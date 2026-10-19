# Arithmetic Iwasawa theory and the main conjecture — part I.1

This target-level plan covers the cyclotomic tower, arithmetic Iwasawa modules, Stickelberger elements, descent, classical main-conjecture arguments, CM Selmer and Ritter–Weiss modules, the Brumer–Stark Fitting argument, and the Kurihara–Kolster comparison. It contains 66 targets. No implementation is claimed.

**Independent review: needs changes (2026-10-19).** The corrected plan is partial. Real dyadic unit and cohomology comparisons, the totally real classical proof, several Hilbert modular and local Ribet supplier contracts, and the finite-to-infinite presentation contract remain open. The review of this plan is finished; its proof gaps are recorded below. Read each target’s review note together with its statement. A verified local statement does not discharge an open prerequisite.

The [packet](../packets/IntegralIwasawaTheory--I.1.json) records dependencies, APIs and checks. The [suggested Lean file](../suggested/IntegralIwasawaTheory--I.1.lean) gives representative signatures over carriers available at the pinned libraries. The [independent report](../reviews/REV-IntegralIwasawaTheory--I.1.md) explains the corrections. I.8, I.9 and L0 are planned in [part I.8](IntegralIwasawaTheory--I.8.md); this part identifies suppliers for them without claiming that all their requested interfaces have been established.

## Conventions

- p is any prime unless restricted; q = p for odd p and q = 4 for p = 2. Fields lie in a fixed algebraic closure. χ_cyc is the algebraic cyclotomic character, with continuity proved separately; κ = ⟨χ_cyc⟩ projects to 1 + qZ_p.
- K_n has degree p^n over K in K_∞/K. This is a Z_p-layer index, not the exponent of the roots of unity.
- Λ_K = Z_p[[Γ_K]], with T = γ − 1 and u = κ(γ) for a chosen generator. The contragredient twist M(n) has series f(u^{−n}(1 + T) − 1); the covariant dual uses the involution ι.
- Class-group and unit inverse limits use norms; direct limits use extension. X is unramified, X′_S is S-split, and 𝔛_S is S-ramified. Real dyadic ramification and wide/narrow conventions require the explicit comparisons below.
- Frobenius is arithmetic; χ(Θ) = L(χ^{-1}, s), and # sends σ to σ^{-1}. In specialisation κ(Frob_v) = ⟨Nv⟩, so Teichmüller factors must be retained.
- For complex conjugation c, the integral minus quotient is M/(1 + c)M. It agrees with the minus eigenspace after inverting 2. Kolster’s dyadic norm-kernel convention is a different object until compared.
- Fitt is the zeroth Fitting ideal unless indexed. A pseudo-measure x lies in the total quotient ring and satisfies x I_G ⊆ Λ.
- In the dyadic Hilbert modular argument d = [F:Q], independent of the cyclotomic layer or the congruence precision m. Coefficient algebras may be nonreduced.

## Ownership and current library boundary

The pinned baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The current supplied upstream trees were checked separately. Their completed group algebra, compact-module actions, higher Fitting ideals and local unit filtration are existing work, not targets to reconstruct here. Generic algebraic interfaces remain with their existing roadmap owners. The absence of an exact supplier is recorded as a request or gap, not treated as an available theorem.

The three confirmed red-team findings are respected: I.3 has no unitary IG.1 dependency and receives its Hilbert ordinary input through AutomorphicPadicLFunctions L3 and the T5 ordinary tower; IHG.1 is the proposed owner of codimension-zero congruence modules but does not yet supply the required interface; I.2 owns Leopoldt’s map and defect, with L4, Polylogarithms P.6 and AutomorphicPadicLFunctions L0 consuming it. The Q main-conjecture statement already has an owner in EulerSystemsCyclotomicMainConjecture L3; its tier/bundle placement must be reconciled before adding a backwards edge.

## Coverage

### IntegralIwasawaTheory:I.1 — planned

- Resolve the exact character-ring descent interfaces used by I.9; the corrected height-one claim requires reflexive or invertible objects.
- Use current completedGroupAlgebra when packaging; the generic PadicMeasures owner is not a merged roadmap in the supplied upstream.

### IntegralIwasawaTheory:I.10 — partial

- G-I10-REALPLACE: construct and verify the Kurihara–Kolster comparison, including its twist, finite cokernel and real inertia rank.
- Use Γ-invariants of Kolster’s discrete module, retaining the derived Tor terms.

### IntegralIwasawaTheory:I.2 — partial

- G-I2-H2: prove the H² comparison with its real-place convention.
- G-I2-REAL-UNITS and G-I2-UNIT-FINITENESS: supply sign factors and unit-limit comparisons.
- G-I2-FEDERER and G-I2-IWASAWA83: original dyadic class/unit comparisons remain secondary-source inputs.

### IntegralIwasawaTheory:I.3 — planned

- AutomorphicPadicLFunctions L3 (the Deligne–Ribet and group-ring Eisenstein supplier) has no accepted review yet; re-check node ids when it is reviewed.
- AnalyticNumberTheory AN.4 continuation of finite-order Hecke L-functions over totally real fields is requested.

### IntegralIwasawaTheory:I.4 — partial

- G-I4-ENLARGE: prove the injective local inertia term, with the corrected arithmetic-character normalisation.
- G-I10-REALPLACE: prove the real-place map and Λ/(2)-rank; a finite-layer sign group is not a tower characteristic factor.

### IntegralIwasawaTheory:I.5 — partial

- G-I5-WILES: supply the totally-real Eisenstein argument and the separate μ-comparison.
- G-I5-CONGRUENCE: obtain the exact generic congruence API from its proposed owner.
- G-I5-INDUCTION: verify the going-up argument beyond the dyadic source.
- Reconcile the common Q theorem owner EulerSystemsCyclotomicMainConjecture L3.

### IntegralIwasawaTheory:I.6 — planned

- Refine ritter-weiss-module to the lemma level of Dasgupta–Kakde Appendix A (Lemmas A.1–A.9) and DKSW §4–5 (class-formation duality), read here by statement.

### IntegralIwasawaTheory:I.7 — partial

- G-I7-NORM-PRESENTATIONS: reconcile I.9’s stronger contract with intrinsic norm maps and Fitting continuity.
- G-I7-RIBET-RESIDUAL: supply the local weighted theorem in every residual component.
- G-I7-GALOIS-SUPPLIER and G-I7-MODULAR-SUPPLIERS: obtain the actual p=2/arbitrary-degree ordinary representation and cusp-correction contracts.

### IntegralIwasawaTheory:I.8 — planned

- Planned in research/blueprint/packets/IntegralIwasawaTheory--I.8.json (accepted 2026-10-18); this packet does not replan it. Its supplier contracts on I.1, I.2, I.3, I.6 and I.7 are addressed by the nodes listed in the handoff note; the remaining items of that packet (gaps G1–G3) stand.

### IntegralIwasawaTheory:I.9 — planned

- Planned in research/blueprint/packets/IntegralIwasawaTheory--I.8.json (accepted 2026-10-18); this packet does not replan it. Its supplier contracts on I.1, I.2, I.3, I.6 and I.7 are addressed by the nodes listed in the handoff note; the remaining items of that packet (gaps G1–G3) stand.

### IntegralIwasawaTheory:L0 — planned

- Planned in research/blueprint/packets/IntegralIwasawaTheory--I.8.json (accepted 2026-10-18); this packet does not replan it. Its supplier contracts on I.1, I.2, I.3, I.6 and I.7 are addressed by the nodes listed in the handoff note; the remaining items of that packet (gaps G1–G3) stand.

## Targets

## IntegralIwasawaTheory:I.1

### The cyclotomic Z_p-extension

**Construction target:** `IntegralIwasawaTheory:I.1/cyclotomic-zp-extension`.

**Planet:** Cyclotomic Z_p-extension.

**Review — corrected.** Separated algebraic cyclotomicCharacter from the finite-level continuity proof; completed the uniqueness argument.

Let K be a number field inside a fixed algebraic closure K̄, p a prime, and q = p for odd p, q = 4 for p = 2. Let K(μ_{p^∞}) ⊆ K̄ be the field generated over K by all p-power roots of unity and G_∞(K) = Gal(K(μ_{p^∞})/K). The p-adic cyclotomic character χ_cyc : Gal(K̄/K) → Z_p^× (σ(ζ) = ζ^{χ_cyc(σ) mod p^n} for ζ ∈ μ_{p^n}) factors through a continuous injective homomorphism G_∞(K) → Z_p^× with open image. Let Δ_K ⊆ G_∞(K) be its torsion subgroup, which is finite and is the preimage of the torsion of Z_p^× (μ_{p−1} for odd p, {±1} for p = 2). The cyclotomic Z_p-extension of K is K_∞ := K(μ_{p^∞})^{Δ_K}. Its group Γ_K := Gal(K_∞/K) is torsion-free procyclic, and the composite κ := ⟨χ_cyc⟩ of χ_cyc with the projection Z_p^× = μ × (1 + qZ_p) → 1 + qZ_p identifies Γ_K with an open subgroup of 1 + qZ_p; in particular Γ_K ≅ Z_p (non-canonically). K_∞ is the unique subfield of K(μ_{p^∞}) that is Galois over K with group isomorphic to Z_p.

**Hypotheses and conventions.**

- K is a number field and K̄ a fixed algebraic closure; every field below is a subfield of K̄.
- p is a prime; q = p if p is odd and q = 4 if p = 2.
- κ is the restriction of ⟨χ_cyc⟩ to Γ_K; it is injective with open image in 1 + qZ_p.

**Proof plan.**

1. Mathlib cyclotomicCharacter supplies the algebraic homomorphism and its action on roots of unity. Each reduction modulo p^n factors through a finite cyclotomic extension, hence is continuous for the Krull topology. The inverse-limit topology gives continuity, and the action on all roots proves injectivity on G_∞(K).
2. The image is open: Gal(K(μ_{p^n})/K) has index at most [K : Q] in (Z/p^n)^×, using the irreducibility of cyclotomic polynomials over Q (Mathlib IsCyclotomicExtension) and K ∩ Q(μ_{p^n}).
3. Z_p^× = μ × (1 + qZ_p) with 1 + qZ_p ≅ Z_p torsion-free, so an open subgroup U of Z_p^× has finite torsion and U/U_tors ≅ Z_p; an open subgroup of Z_p^× has a unique quotient isomorphic to Z_p (Sharifi Lemma 3.1.7).
4. Define K_∞ as the fixed field of Δ_K and identify Γ_K = G_∞(K)/Δ_K by the infinite Galois correspondence (Mathlib InfiniteGalois.fixedField_fixingSubgroup, InfiniteGalois.normalAutEquivQuotient).
5. Any closed subgroup giving a Z_p quotient contains Δ_K. Its image in G_∞(K)/Δ_K ≅ Z_p must be zero: every nonzero closed subgroup has a finite quotient, which cannot be Z_p. The subgroup therefore equals Δ_K.

**Prerequisites.**

- `mathlib:cyclotomicCharacter`
- `mathlib:IsCyclotomicExtension`
- `mathlib:IntermediateField.fixedField`
- `mathlib:InfiniteGalois.fixedField_fixingSubgroup`
- `mathlib:InfiniteGalois.normalAutEquivQuotient`
- `mathlib:PadicInt`
- `mathlib:CommGroup.torsion`
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`

**API.**

- `IntegralIwasawaTheory.cyclotomicZpExtension` (constructor): For a number field K, a prime p and an algebraic closure, the intermediate field K_∞ = K(μ_{p^∞})^{Δ_K}.
- `IntegralIwasawaTheory.cyclotomicChar` (projection): The p-adic cyclotomic character Gal(K̄/K) → Z_p^×, Mathlib's cyclotomicCharacter composed with the passage to ring automorphisms of K̄.
- `IntegralIwasawaTheory.torsionCharSubgroup` (data): The subgroup of σ with torsion cyclotomic character; K_∞ is its fixed field.
- `IntegralIwasawaTheory.cyclotomicZpExtension_le` (characterisation): K_∞ ⊆ K(μ_{p^∞}), and K_∞ is Galois over K.
- `IntegralIwasawaTheory.cyclotomicZpExtension_unique` (characterisation): A subfield L ⊆ K(μ_{p^∞}) Galois over K with Gal(L/K) ≅ Z_p as topological groups equals K_∞.
- `IntegralIwasawaTheory.Gamma` (data): Γ_K := Gal(K_∞/K) with its profinite topology.
- `IntegralIwasawaTheory.kappa` (projection): κ : Γ_K → 1 + qZ_p, the restriction of ⟨χ_cyc⟩, a continuous injective homomorphism with open image.
- `IntegralIwasawaTheory.kappa_spec` (compatibility): For σ ∈ Gal(K̄/K) and ζ ∈ μ_{p^n}: σ(ζ) = ζ^{a} where a ≡ χ_cyc(σ) mod p^n (Mathlib cyclotomicCharacter.spec); κ(σ|_{K_∞}) = ⟨χ_cyc(σ)⟩.
- `IntegralIwasawaTheory.Gamma_equiv_padicInt` (equivalence): After choosing a topological generator γ, n ↦ γ^n extends to a topological isomorphism Z_p ≅ Γ_K.
- `IntegralIwasawaTheory.cyclotomicZpExtension_baseChange` (functoriality): For a finite extension L/K inside K̄, L_∞ = L·K_∞ and restriction Γ_L → Γ_K is injective with open image.
- `IntegralIwasawaTheory.cyclotomicZpExtension_isTotallyReal` (relation): If K is totally real then so is every layer of K_∞, because complex conjugation has χ_cyc = −1 and lies in Δ_K.
- `IntegralIwasawaTheory.cyclotomicZpExtension_fixed_iff` (characterisation): x ∈ K_∞ iff every automorphism whose cyclotomic character is torsion fixes x.

**Checks.**

- `cyclotomicZpExtension_rat_three_layer_one` (computation): For K = Q and p = 3, the first layer of Q_∞ is the cubic subfield Q(ζ_9 + ζ_9^{-1}) of Q(ζ_9).
- `cyclotomicZpExtension_rat_two_layer_one` (computation): For K = Q and p = 2, the first layer of Q_∞ is Q(√2) = Q(ζ_8 + ζ_8^{-1}).
- `cyclotomicZpExtension_of_mu_q` (degenerate): If μ_q ⊆ K then Δ_K is trivial and K_∞ = K(μ_{p^∞}).
- `not_zp_extension_full_cyclotomic` (non-example): For K = Q and p odd, Gal(Q(μ_{p^∞})/Q) ≅ Z_p^× has torsion μ_{p−1}, so Q(μ_{p^∞}) itself is not a Z_p-extension; a definition that takes the whole cyclotomic tower fails the torsion-free test.
- `kappa_compat_cyclotomicCharacter` (compatibility): For every σ ∈ Gal(K̄/K), κ(σ|_{K_∞}) equals the 1 + qZ_p-component of Mathlib's cyclotomicCharacter applied to σ.

**Uses.**

- IntegralIwasawaTheory:I.2: every inverse limit of class groups, units and Galois groups is taken along the layers of K_∞/K
- IntegralIwasawaTheory:I.8/burns-flach-iwasawa-complex: F_∞/F is the cyclotomic Z_p-extension of a totally real field
- EulerSystemsCyclotomicMainConjecture:L0: the request for Q_∞ ⊆ Q(μ_{p^∞}) with Gal(Q_∞/Q) ≅ Z_p
- SpecialValuesBirchTate:B.5: the cyclotomic Z_2-tower of a totally real field and its Iwasawa modules
- Burungale–Tian, §1.0.3, pp. 2–3: Λ_cyc = Z_p[[Gal(Q_∞/Q)]] for the cyclotomic Z_p-extension of Q

**Acceptance.**

- For K = Q and p odd, Q_∞ is the fixed field of μ_{p−1} ≅ Gal(Q(μ_p)/Q) inside Q(μ_{p^∞}), and κ : Γ_Q ≅ 1 + pZ_p is an isomorphism.
- For K = Q and p = 2, Q_∞ is the maximal real subfield of Q(μ_{2^∞}) and κ : Γ_Q ≅ 1 + 4Z_2.

**Sources.**

- **SHARIFI**, Definition 3.1.3, Remark 3.1.4, Lemmas 3.1.5 and 3.1.7, Definition 3.1.8, pp. 75–76. Defines the p-adic cyclotomic character, shows that its image on G_F is open in Z_p^×, decomposes Z_p^× into roots of unity and 1 + qZ_p, and defines the cyclotomic Z_p-extension as the unique Z_p-subextension of F(μ_{p^∞}).
- **KOLSTER-2009**, Lecture 1, §1, p. 5. Describes the cyclotomic Z_p-extension as the fixed field of the finite part Δ of Gal(F(μ_{p^∞})/F) ≅ Z_p × Δ, with layers of degree p^n.
- **BURUNGALE-TIAN-2026**, §1.0.3, pp. 2–3. Uses the cyclotomic Z_p-extension Q_∞/Q and its Iwasawa algebra as the torsion-free quotient of the full cyclotomic tower.

### Layers, norms and the exponent shift

**Construction target:** `IntegralIwasawaTheory:I.1/cyclotomic-layers`.

**Review — corrected.** Added a working characterisation, extensionality or universal-property API after checking the stated construction.

With K_∞/K as in cyclotomic-zp-extension and n ≥ 0, the n-th layer K_n is the fixed field of Γ_K^{p^n}; it is the unique subextension of K_∞/K of degree p^n, Gal(K_n/K) ≅ Γ_K/Γ_K^{p^n} is cyclic of order p^n, K_0 = K, K_n ⊆ K_m for n ≤ m and K_∞ = ⋃_n K_n. For m ≥ n the relative norm N_{K_m/K_n} on elements and on ideals and the restriction Gal(K_m/K) → Gal(K_n/K) are compatible and transitive. The layer index is not the cyclotomic exponent: for K = Q and odd p, Q_n ⊆ Q(μ_{p^{n+1}}); for p = 2, Q_n ⊆ Q(μ_{2^{n+2}}). Every statement of this roadmap indexes towers by the Z_p-layer n, and a source indexed by the cyclotomic exponent is translated by this shift.

**Hypotheses and conventions.**

- K_∞/K is the cyclotomic Z_p-extension of cyclotomic-zp-extension.
- n, m are natural numbers.

**Proof plan.**

1. Closed subgroups of Γ_K ≅ Z_p are 0 and the p^nZ_p; apply the infinite Galois correspondence.
2. Norm transitivity for the tower K ⊆ K_n ⊆ K_m (Mathlib Algebra.norm, Algebra.norm_norm; Ideal.spanNorm for ideals).
3. For K = Q, Q(μ_{p^{n+1}}) has Galois group (Z/p^{n+1})^× ≅ μ_{p−1} × Z/p^n for odd p, whose quotient by the torsion is Z/p^n; for p = 2, (Z/2^{n+2})^× ≅ {±1} × Z/2^n.

**Prerequisites.**

- `IntegralIwasawaTheory:I.1/cyclotomic-zp-extension`
- `mathlib:Algebra.norm`
- `mathlib:Ideal.relNorm`
- `mathlib:IntermediateField.fixedField`

**API.**

- `IntegralIwasawaTheory.layer` (constructor): K_n, the fixed field of Γ_K^{p^n}.
- `IntegralIwasawaTheory.layerSubgroup` (data): The subgroup of σ whose cyclotomic character is a torsion unit times a p^n-th power of a value of the character; K_n is its fixed field.
- `IntegralIwasawaTheory.layer_zero` (simp): K_0 = K.
- `IntegralIwasawaTheory.layer_mono` (structure): n ≤ m implies K_n ≤ K_m.
- `IntegralIwasawaTheory.finrank_layer` (characterisation): [K_n : K] = p^n.
- `IntegralIwasawaTheory.layerGaloisEquiv` (equivalence): Gal(K_n/K) ≅ Γ_K/Γ_K^{p^n}, compatible with restriction for n ≤ m.
- `IntegralIwasawaTheory.iSup_layer` (characterisation): ⨆_n K_n = K_∞.
- `IntegralIwasawaTheory.layerNorm_trans` (relation): N_{K_m/K_n} ∘ N_{K_l/K_m} = N_{K_l/K_n} for n ≤ m ≤ l, on elements and on ideals.
- `IntegralIwasawaTheory.layer_rat_le_cyclotomic` (compatibility): For K = Q: Q_n ⊆ Q(μ_{p^{n+1}}) for odd p and Q_n ⊆ Q(μ_{2^{n+2}}) for p = 2.
- `IntegralIwasawaTheory.layer_ext` (extensionality): Maps out of a finite layer agree if they agree on its embedding into the fixed algebraic closure.

**Checks.**

- `layer_zero_eq` (degenerate): layer K p 0 = ⊥ (that is, K itself).
- `finrank_layer_rat` (computation): For K = Q and p = 5, [Q_1 : Q] = 5 and Q_1 is the quintic subfield of Q(ζ_25).
- `layer_ne_cyclotomicField` (non-example): For K = Q, p = 3 and n = 1, Q_1 ≠ Q(μ_3): the degrees are 3 and 2, so indexing layers by the cyclotomic exponent is wrong.
- `layerNorm_trans_example` (characterisation): For n ≤ m ≤ l, the composite of the relative norms K_l → K_m → K_n is the relative norm K_l → K_n.

**Uses.**

- IntegralIwasawaTheory:I.2/class-group-limit: the finite layers carry the class groups A_n and their norm maps
- IntegralIwasawaTheory:L1/cyclotomic-class-field-specialization: the classical tower Q(μ_{p^n}) of RJW is indexed by cyclotomic exponent
- IntegralIwasawaTheory:I.8/burns-flach-iwasawa-complex: C_{F∞,S} is a derived limit over the layers F_n
- ArithmeticKTheory:N.6: finite-level cyclotomic fields and their norms

**Acceptance.**

- [K_n : K] = p^n for every n.
- For K = Q, p odd and n ≥ 1, Q_n ≠ Q(μ_{p^n}) since [Q(μ_{p^n}) : Q] = p^{n−1}(p − 1).

**Sources.**

- **SHARIFI**, Definition 3.2.3, p. 78; Remark 2.4.3, p. 52. Fixes the layers F_n of a Z_p-extension with Gal(F_n/F) ≅ Γ/Γ^{p^n}, the norm maps N_{n,m} and the inclusion maps j_{n,m} between their class groups.
- **KOLSTER-2009**, Lecture 1, §1, p. 5. States the tower F = F_0 ⊆ F_1 ⊆ ⋯ with [F_n : F] = p^n and F_∞ = ⋃ F_n.
- **RJW-PADIC-L**, §13.2, p. 66. Indexes the classical tower by the cyclotomic exponent, F_n = Q(μ_{p^n}) with the unique prime p_n above p, which is the shift recorded here.

### The full cyclotomic group and its decomposition

**Construction target:** `IntegralIwasawaTheory:I.1/full-cyclotomic-tower`.

**Review — corrected.** Added a working characterisation, extensionality or universal-property API after checking the stated construction.

For a number field K and prime p, let G_∞(K) = Gal(K(μ_{p^∞})/K) with the cyclotomic character κ_full : G_∞(K) → Z_p^× (injective, open image; an isomorphism for K = Q). For c ∈ κ_full(G_∞(K)) put σ_c = κ_full^{-1}(c). Let Δ_K be the torsion subgroup of G_∞(K). For p odd, Z_p^× = μ_{p−1} × (1 + pZ_p) has factors of coprime (supernatural) orders, so G_∞(K) = Δ_K × Γ'_K canonically with Γ'_K = κ_full^{-1}(1 + pZ_p), restriction Γ'_K → Γ_K is an isomorphism, and Δ_K ≅ Gal(K(μ_p)/K); the Teichmüller character ω : Δ_K → μ_{p−1} is the restriction of κ_full. For p = 2 the projection Z_2^× → {±1} defines ω on all of G_∞(K) with kernel Gal(K(μ_{2^∞})/K(i)); G_∞(K) ≅ Δ_K × Γ_K still holds, non-canonically, but Δ_K = G_∞(K) ∩ {±1} can be trivial while K(i) ≠ K (K = Q(√−2)), so Δ_K need not be Gal(K(i)/K); if K has a real place, Δ_K = {±1} ≅ Gal(K(i)/K). Characters of G_∞(K) that are nontrivial on the torsion, such as powers of ω for odd p, do not factor through Γ_K.

**Hypotheses and conventions.**

- K is a number field, p a prime, q as in cyclotomic-zp-extension.

**Proof plan.**

1. κ_full is the restriction of Mathlib's cyclotomicCharacter to K(μ_{p^∞}); injectivity and openness as in cyclotomic-zp-extension.
2. For odd p, a closed subgroup of μ_{p−1} × (1 + pZ_p) is the product of its prime-to-p and pro-p parts. For p = 2, G_∞(K)/Δ_K ≅ Z_2 is free pro-2, so the extension splits non-canonically.
3. The example K = Q(√−2): the elements of Z_2^× fixing ζ_8 + ζ_8^3 are those ≡ 1, 3 mod 8, a torsion-free subgroup of index 2.
4. For K = Q, surjectivity onto Z_p^× follows from the irreducibility of every cyclotomic polynomial over Q.

**Prerequisites.**

- `IntegralIwasawaTheory:I.1/cyclotomic-zp-extension`
- `mathlib:cyclotomicCharacter`
- `mathlib:IsCyclotomicExtension`
- `mathlib:CommGroup.torsion`

**API.**

- `IntegralIwasawaTheory.fullCyclotomicGroup` (data): G_∞(K) = Gal(K(μ_{p^∞})/K) with its profinite topology.
- `IntegralIwasawaTheory.kappaFull` (projection): The injective continuous cyclotomic character G_∞(K) → Z_p^×.
- `IntegralIwasawaTheory.kappaFull_rat_equiv` (equivalence): For K = Q, κ_full is a topological isomorphism onto Z_p^×.
- `IntegralIwasawaTheory.sigmaOf` (constructor): σ_c = κ_full^{-1}(c) for c in the image.
- `IntegralIwasawaTheory.delta_prod_gamma` (equivalence): G_∞(K) ≅ Δ_K × Γ_K: canonically for odd p (via Γ'_K = κ_full^{-1}(1 + pZ_p)), non-canonically for p = 2.
- `IntegralIwasawaTheory.teichmuller` (projection): ω : G_∞(K) → μ(Z_p), the composite of κ_full with the projection Z_p^× → μ(Z_p); on Δ_K it is the restriction of κ_full for odd p.
- `IntegralIwasawaTheory.sigmaOf_apply` (simp): σ_c(ζ) = ζ^{c mod p^n} for ζ ∈ μ_{p^n}.
- `IntegralIwasawaTheory.fullCyclotomicTower_minimal` (universal-property): K(μ_{p^∞}) is the least intermediate field containing all p-power roots of unity.

**Checks.**

- `sigmaOf_neg_one_rat` (computation): For K = Q, σ_{−1} acts on μ_{p^∞} by inversion, so it restricts to complex conjugation on every Q(μ_{p^n}).
- `delta_rat_odd` (computation): For K = Q and p odd, Δ_Q ≅ μ_{p−1} is cyclic of order p − 1.
- `delta_of_mu_q` (degenerate): If μ_q ⊆ K then Δ_K is trivial and G_∞(K) = Γ_K.
- `delta_two_not_gal_i` (non-example): For K = Q(√−2) and p = 2, G_∞(K) ≅ Z_2 is torsion-free although [K(i) : K] = 2; identifying Δ_K with Gal(K(i)/K) fails at p = 2 for fields without real places.
- `omega_not_factor_gamma` (non-example): For K = Q and p odd, ω is a nontrivial character of G_∞(Q) that is trivial on Γ'_Q, so it does not factor through the restriction to Q_∞; replacing G_∞ by its Z_p-quotient loses the Teichmüller components.

**Uses.**

- IntegralIwasawaTheory:I.8/cm-twist-minus-plus: K_∞ = F_∞(μ_{2p}) and the cyclotomic character on Gal(K_∞/k)
- IntegralIwasawaTheory:I.4/twisted-coinvariant-descent: the twists M(n) use κ on Γ and ω on Δ
- Burungale–Tian, §2.2.2, p. 4: the full cyclotomic group with σ_c, as opposed to its Z_p quotient

**Acceptance.**

- For K = Q: κ_full is an isomorphism G_∞(Q) ≅ Z_p^×, σ_c(ζ) = ζ^c for ζ ∈ μ_{p^∞}, and σ_{−1} is complex conjugation.

**Sources.**

- **BURUNGALE-TIAN-2026**, §2.2.2, p. 4. Uses G_∞ = Gal(Q(μ_{p^∞})/Q) with the cyclotomic isomorphism κ : G_∞ ≅ Z_p^× and the elements σ_c = κ^{-1}(c), distinguished from the Z_p-quotient.
- **SHARIFI**, Lemma 3.1.5 and Corollary 3.1.6, p. 76. Gives the internal direct-sum decomposition of Z_p^× and the resulting decomposition of the cyclotomic Galois group.
- **KOLSTER-2009**, Lecture 1, §1, p. 6. Writes G_∞ = Gal(F(μ_{p^∞})/F) ≅ Γ × Δ with Δ ≅ Gal(F(ζ_{2p})/F), the cyclotomic character ρ, its restriction κ to Γ and the Teichmüller character ω on Δ.

### Ramification and splitting in the cyclotomic tower

**Theorem target:** `IntegralIwasawaTheory:I.1/tower-ramification`.

**Planet:** Ramification in the cyclotomic tower.

**Review — corrected.** Replaced the insufficient class-number argument by local cyclotomic ramification at every p-adic place, and used projected Frobenius away from p.

Let K_∞/K be the cyclotomic Z_p-extension. (a) Every place not above p is unramified in K_∞/K. (b) Every prime above p ramifies in K_∞/K, and there is n_0 ≥ 0 such that every prime of K_{n_0} above p is totally ramified in K_∞/K_{n_0}. (c) No finite prime splits completely: for every finite place v of K the decomposition group D_v ⊆ Γ_K is open, so only finitely many places of K_∞ lie above v; for v ∤ p, D_v is the closure of the subgroup generated by the Frobenius, which has infinite order. (d) Complex conjugations lie in Δ_K, so every real place of K splits completely in K_∞; if K is totally real, K_∞ is totally real. (e) For K = Q, p odd and a prime ℓ ≠ p, D_ℓ is topologically generated by κ^{-1}(⟨ℓ⟩) with ⟨ℓ⟩ = ℓ·ω(ℓ)^{-1}. (f) If L/K is finite Galois of degree prime to p, then L ∩ K_∞ = K and Gal(L K_n/K_n) ≅ Gal(L/K) for every n.

**Hypotheses and conventions.**

- K is a number field, p a prime, K_∞/K the cyclotomic Z_p-extension.

**Proof plan.**

1. (a): a place v ∤ p is unramified in K(μ_{p^∞}) because p-power cyclotomic extensions are unramified away from p (Tau Ceti GlobalNumberFields Layer 10, cyclotomic ramification).
2. At each v | p, base change of the cyclotomic extension of Q_p to the finite field K_v remains infinite and eventually totally ramified. Its inertia has nonzero, hence open, image in Γ_K. Finitely many such places give a common n_0 (Sharifi Lemma 3.1.10 and Proposition 3.1.11, pp. 77–78).
3. For v ∤ p, κ(Frob_v) = ⟨Nv⟩ has infinite order: a positive rational integer Nv > 1 cannot be a p-adic root of unity. Thus D_v is nonzero and open in Z_p. At v | p use the preceding inertia argument.
4. (d): χ_cyc(c) = −1 is torsion, so c|_{K(μ_{p^∞})} ∈ Δ_K and fixes K_∞.
5. (e): the arithmetic Frobenius at ℓ acts on μ_{p^∞} by ζ ↦ ζ^ℓ, so its image under κ is ⟨ℓ⟩.
6. (f): [L ∩ K_∞ : K] divides both [L : K] and a power of p.

**Prerequisites.**

- `IntegralIwasawaTheory:I.1/cyclotomic-zp-extension`
- `IntegralIwasawaTheory:I.1/cyclotomic-layers`
- `IntegralIwasawaTheory:I.1/full-cyclotomic-tower`
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`
- `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`
- `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol`
- `mathlib:NumberField.classNumber`

**Acceptance.**

- For p = 3 and ℓ = 2: ⟨2⟩ = −2 ∈ 1 + 3Z_3 has v_3(−2 − 1) = 1, so it topologically generates 1 + 3Z_3 and 2 is inert in every layer of Q_∞/Q.
- p is totally ramified in Q_∞/Q (n_0 = 0) and Q_∞ is totally real.
- Sharifi Proposition 3.1.11: no finite prime splits completely in F_cyc/F.

**Sources.**

- **SHARIFI**, Proposition 3.1.9, Lemma 3.1.10, Proposition 3.1.11 and Corollary 3.1.12, pp. 76–77. Shows that primes not over p are unramified in any Z_p-extension, that some prime over p ramifies and is eventually totally ramified, and that no finite prime splits completely in the cyclotomic Z_p-extension.
- **KOLSTER-2009**, Lecture 1, §1, p. 7. Notes that for totally real F the cyclotomic Z_p-extension is totally real and that, under Leopoldt, it is the only Z_p-extension.

### The Iwasawa algebra, its coordinate, twists and change of generator

**Construction target:** `IntegralIwasawaTheory:I.1/iwasawa-algebra-coordinate`.

**Planet:** Iwasawa algebra.

**Review — corrected.** Added a working characterisation, extensionality or universal-property API after checking the stated construction.

Let Λ_K = Z_p[[Γ_K]] be the completed group algebra of Γ_K (owned by Tau Ceti ProfiniteProPGroups Layer 9 and PadicMeasuresIwasawaAlgebras Layer 1). For a topological generator γ of Γ_K, put u = κ(γ) ∈ 1 + qZ_p and let ι_γ : Z_p[[T]] ≅ Λ_K be the continuous isomorphism with T ↦ γ − 1. (i) Change of generator: if γ' = γ^c with c ∈ Z_p^×, then ι_γ^{-1} ∘ ι_{γ'} sends T to (1 + T)^c − 1, its inverse sends T to (1 + T)^{c^{-1}} − 1, u' = u^c, and characteristic ideals are transported along this isomorphism. (ii) Twists: for n ∈ Z the continuous ring automorphism Tw_n of Λ_K with γ ↦ κ(γ)^n γ (T ↦ u^n(1 + T) − 1 in the coordinate) satisfies M(n) ≅ M ⊗ Z_p(n) as Λ_K-modules, char(M(n)) = Tw_{−n}(char M), Tw_0 = id and Tw_n ∘ Tw_m = Tw_{n+m}. (iii) The involution ι : γ ↦ γ^{-1} (T ↦ (1 + T)^{-1} − 1) gives M^ι, used for Pontryagin duals. (iv) The augmentation Λ_K → Z_p has kernel (T).

**Hypotheses and conventions.**

- Γ_K is the Galois group of the cyclotomic Z_p-extension, with κ as in cyclotomic-zp-extension.
- c ∈ Z_p^×; n ∈ Z.

**Proof plan.**

1. Import the completed group algebra and its power-series coordinate for a procyclic pro-p group (ProfiniteProPGroups Layer 9; PadicMeasuresIwasawaAlgebras Layer 1).
2. Change of generator: γ' − 1 = (1 + T)^c − 1 in the γ-coordinate, a continuous automorphism of Z_p[[T]].
3. Twist: γ ↦ κ(γ)^n γ extends by continuity and the universal property of the completed group algebra; on M ⊗ Z_p(n) the element γ acts as κ(γ)^n γ, hence the formula for characteristic ideals (Kolster Lemma 1.2).
4. Characteristic ideals and the transport of μ and λ under coordinate changes are imported from PadicMeasuresIwasawaAlgebras Layer 4.

**Prerequisites.**

- `IntegralIwasawaTheory:I.1/cyclotomic-zp-extension`
- `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`
- `PadicMeasuresIwasawaAlgebras:L1`
- `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`
- `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`
- `mathlib:PowerSeries`
- `mathlib:PadicInt`

**API.**

- `IntegralIwasawaTheory.iwasawaAlgebra` (constructor): Λ_K = Z_p[[Γ_K]], the completed group algebra of Γ_K.
- `IntegralIwasawaTheory.coordinate` (equivalence): ι_γ : Z_p[[T]] ≃ Λ_K with T ↦ γ − 1, for a topological generator γ.
- `IntegralIwasawaTheory.coordinate_change` (relation): For γ' = γ^c: ι_γ^{-1} ∘ ι_{γ'} (T) = (1 + T)^c − 1.
- `IntegralIwasawaTheory.twist` (constructor): Tw_n : Λ_K ≃ Λ_K with γ ↦ κ(γ)^n γ.
- `IntegralIwasawaTheory.twist_zero` (simp): Tw_0 = id.
- `IntegralIwasawaTheory.twist_add` (simp): Tw_n ∘ Tw_m = Tw_{n+m}.
- `IntegralIwasawaTheory.charIdeal_twist` (relation): For a finitely generated torsion Λ_K-module M, char(M ⊗ Z_p(n)) = Tw_{−n}(char M).
- `IntegralIwasawaTheory.involution` (constructor): ι : Λ_K ≃ Λ_K with γ ↦ γ^{-1}; M^ι is M with γ acting as γ^{-1}.
- `IntegralIwasawaTheory.augmentation_ker` (characterisation): The augmentation Λ_K → Z_p is surjective with kernel generated by T = γ − 1.
- `IntegralIwasawaTheory.iwasawaCoordinate_generator` (characterisation): The arithmetic coordinate is characterised by γ ↦ 1+T; uniqueness and change of generator use the imported completed-algebra universal property.

**Checks.**

- `twist_one_T` (computation): In the γ-coordinate, Tw_1(T) = u(1 + T) − 1 with u = κ(γ).
- `coordinate_change_one` (degenerate): For c = 1 the change of generator is the identity of Z_p[[T]].
- `coordinate_change_inv_not_id` (non-example): For γ' = γ^{-1}, the ideal (T − p) is carried to the ideal generated by (1 + T)^{-1} − (1 + p), which is (T − ((1 + p)^{-1} − 1)) and not (T − p); characteristic ideals must be transported, not copied.
- `charIdeal_tate_twist` (characterisation): char_Λ(Z_p(n)) = (T − (u^n − 1)) for every n ∈ Z.

**Uses.**

- IntegralIwasawaTheory:I.4/coinvariant-euler-characteristic: evaluation of characteristic series at u^n − 1 after a twist
- SpecialValuesBirchTate:B.5: the generator transport γ' = γ^c with T' ↦ (1 + T)^{c^{-1}} − 1 requested by B.5
- IntegralIwasawaTheory:I.10/kurihara-kolster-dictionary: Kolster's covariant twist versus the contragredient twist
- IntegralIwasawaTheory:I.8/cm-twist-minus-plus: the twist τ : σ ↦ κ(σ)^{-1}σ on the equivariant algebra

**Acceptance.**

- Tw_1(T) = u(1 + T) − 1.
- For M = Z_p(n) (Λ_K acting through κ^n), char(M) = (T − (u^n − 1)).

**Sources.**

- **SHARIFI**, Definition 2.3.1, Remark 2.4.3 and Definition 3.2.1, pp. 47, 52, 78. Defines completed group rings, the isomorphism with a power-series ring after choosing γ, and the Iwasawa algebra of a Z_p-extension.
- **KOLSTER-2009**, Lecture 1, §1, pp. 5–7, Lemma 1.2. Identifies Λ with Z_p[[T]] through γ ↦ 1 + T and gives the characteristic polynomial f*(κ(γ)^{−n}(1 + T) − 1) of the twist M(n).
- **KURIHARA**, §3, p. 17. Works with Λ_{K∞} = Z_p[[Gal(K_∞/k)]], a topological generator γ and the total quotient ring.

### The kernel of passage to a finite layer

**Theorem target:** `IntegralIwasawaTheory:I.1/finite-level-kernel`.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against SHARIFI Remark 2.4.3 and Lemma 2.4.4, pp. 52–53; KOLSTER-2009 Lecture 1, §1, p. 5. No local correction needed; imported proof inputs retain their stated supplier conditions.

For n ≥ 0 and a topological generator γ of Γ_K, the projection π_n : Λ_K → Z_p[Gal(K_n/K)] = Z_p[Γ_K/Γ_K^{p^n}] is surjective with kernel the principal ideal (ω_n), ω_n = γ^{p^n} − 1 = (1 + T)^{p^n} − 1; the ideal does not depend on γ. Hence Λ_K = lim_n Λ_K/(ω_n), and for a compact Λ_K-module M the Γ_K^{p^n}-coinvariants are M/ω_n M. The ideals (T^{p^n}) and (T^n) are different from (ω_n) for n ≥ 1.

**Hypotheses and conventions.**

- Γ_K ≅ Z_p with generator γ; n ≥ 0.

**Proof plan.**

1. Z_p[Γ/Γ^{p^n}] = Z_p[x]/(x^{p^n} − 1) with x = image of γ.
2. The completed group algebra is the limit of the finite group algebras, and γ^{p^n} − 1 corresponds to (1 + T)^{p^n} − 1 under ι_γ (Sharifi Remark 2.4.3).
3. Changing γ to γ^c multiplies ω_n by a unit, because (1 + T)^{cp^n} − 1 = ((1 + T)^{p^n} − 1)·(unit) for c ∈ Z_p^×.
4. ω_n is a distinguished polynomial of degree p^n (Tau Ceti TauCeti.Polynomial.isDistinguishedAt_one_add_X_pow_sub_one at main; PadicMeasuresIwasawaAlgebras §4.3).

**Prerequisites.**

- `IntegralIwasawaTheory:I.1/iwasawa-algebra-coordinate`
- `IntegralIwasawaTheory:I.1/cyclotomic-layers`
- `PadicMeasuresIwasawaAlgebras:L4`
- `mathlib:Polynomial.IsDistinguishedAt`
- `mathlib:MonoidAlgebra`

**Acceptance.**

- n = 0: ω_0 = T, the augmentation ideal.
- ω_1 = Σ_{i=1}^{p} C(p,i) T^i has the term pT, so ω_1 ∉ (T^p).

**Sources.**

- **SHARIFI**, Remark 2.4.3 and Lemma 2.4.4, pp. 52–53. Defines ω_n = (T + 1)^{p^n} − 1, identifies O[Γ_n] with Λ/(ω_n), Λ with the inverse limit of these quotients, and M/ω_nM with the Γ^{p^n}-coinvariants.
- **KOLSTER-2009**, Lecture 1, §1, p. 5. Obtains the Iwasawa algebra as the inverse limit of the group rings Z_p[Γ_n], isomorphic to Z_p[[T]] through γ ↦ 1 + T.

### The arithmetic completed action on Galois groups and limits

**Construction target:** `IntegralIwasawaTheory:I.1/arithmetic-compact-action`.

**Review — corrected.** Restricted surjectivity of limit projections to surjective transition maps and added a counterexample.

Let E/K be a Galois extension inside K̄ with K_∞ ⊆ E and X = Gal(E/K_∞) abelian pro-p. For σ ∈ Γ_K and any lift σ̃ ∈ Gal(E/K), x ↦ σ̃xσ̃^{-1} is independent of the lift, continuous, and defines a continuous action of Γ_K on X; it extends uniquely to a continuous Λ_K-module structure on the compact Z_p-module X. Likewise, for an inverse system (M_n) of finite Z_p[Gal(K_n/K)]-modules with equivariant transition maps, lim_n M_n is a compact Λ_K-module. Continuous equivariant homomorphisms between such modules are Λ_K-linear, and the two constructions agree under the inverse limit of Artin maps (class-field-identification).

**Hypotheses and conventions.**

- E/K Galois, K_∞ ⊆ E, Gal(E/K_∞) abelian pro-p; or (M_n) an inverse system of finite modules over the layers.

**Proof plan.**

1. Independence of the lift: two lifts differ by an element of the abelian group X, which acts trivially on X by conjugation.
2. Continuity of the action map Γ_K × X → X follows from continuity of multiplication in Gal(E/K).
3. A compact Z_p-module with a continuous Γ_K-action is a module over each Z_p[Γ_K/U] on the finite quotients X/V; pass to the limit (Sharifi §2.3, the completed group ring as limit of group rings).
4. Λ_K-linearity of continuous equivariant maps: they commute with the dense subalgebra Z_p[Γ_K].

**Prerequisites.**

- `IntegralIwasawaTheory:I.1/iwasawa-algebra-coordinate`
- `IntegralIwasawaTheory:I.1/cyclotomic-layers`
- `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`
- `PadicMeasuresIwasawaAlgebras:L1`
- `mathlib:ContinuousMonoidHom`
- `mathlib:IsGalois`

**API.**

- `IntegralIwasawaTheory.conjAction` (constructor): The continuous action of Γ_K on Gal(E/K_∞) by conjugation through any lift.
- `IntegralIwasawaTheory.conjAction_lift_indep` (characterisation): The action does not depend on the chosen lift σ̃.
- `IntegralIwasawaTheory.compactLambdaModule` (instance): A compact abelian pro-p group with continuous Γ_K-action is a topological Λ_K-module, uniquely extending the action.
- `IntegralIwasawaTheory.limitLambdaModule` (instance): The inverse limit of an equivariant system of finite Z_p[Gal(K_n/K)]-modules is a compact Λ_K-module.
- `IntegralIwasawaTheory.lambdaLinear_of_equivariant` (functoriality): Continuous Γ_K-equivariant homomorphisms of such modules are Λ_K-linear; identity and composition are preserved.
- `IntegralIwasawaTheory.compactLambdaModule_unique` (extensionality): Two continuous Λ-actions extending the same Γ-action on a compact pro-p module agree.

**Checks.**

- `conjAction_trivial_of_abelian` (computation): If E/K is abelian, every γ ∈ Γ_K acts trivially, so T·X = 0.
- `conjAction_degenerate` (degenerate): For E = K_∞ the module X is zero.
- `conjAction_needs_abelian` (non-example): If Gal(E/K_∞) is non-abelian, conjugation by two lifts of σ can differ by an inner automorphism, so the recipe does not define an action; abelianness is required.
- `limitLambdaModule_finite_level` (compatibility): For M = lim M_n there is a natural Λ/(ω_n)-linear map M/ω_nM → M_n; it is surjective if all transition maps are surjective.
- `limitProjection_not_always_surjective` (non-example): Take M_0 = F_p and M_n = 0 for n ≥ 1 with the zero transition to M_0. The inverse limit is zero, so its projection to M_0 is not surjective.

**Uses.**

- IntegralIwasawaTheory:I.2/maximal-abelian-pro-p-extensions: X and 𝔛_S are Λ-modules through this action
- IntegralIwasawaTheory:L1/conjugation-completed-action: specialises the action to the classical cyclotomic tower
- IntegralIwasawaTheory:I.2/class-group-limit: the inverse limit of class groups under norms is a compact Λ-module

**Acceptance.**

- If E/K is abelian then Γ_K acts trivially, T acts by 0, and X is a Λ_K/(T)-module.

**Sources.**

- **KOLSTER-2009**, Lecture 1, §1, p. 7. For an abelian pro-p extension K_∞ of F_∞ Galois over F, Γ acts on X = Gal(K_∞/F_∞) by inner automorphisms, making X a compact Λ-module.
- **SHARIFI**, Definition 3.2.2 and Remark 3.2.5, pp. 78–79; Remark 3.3.8, p. 86. Calls Λ-modules Iwasawa modules and describes the Γ-action through lifts, on Galois groups and on cohomology.

### The equivariant Iwasawa algebra of an abelian tower over a totally real field

**Construction target:** `IntegralIwasawaTheory:I.1/equivariant-iwasawa-algebra`.

**Planet:** Equivariant Iwasawa algebra.

**Review — corrected.** Corrected the splitting argument: it is the torsion-free rank-one Z_p quotient that splits, rather than an arbitrary extension by an open Z_p.

Let k be totally real, F/k a finite abelian extension, F_∞ = F·k_∞ the cyclotomic Z_p-extension of F, and G = Gal(F_∞/k) (abelian profinite). Then G ≅ G_tors × Γ' with G_tors finite and Γ' ≅ Z_p closed (non-canonically), Γ_F = Gal(F_∞/F) is open in G, and Λ_{F∞} := Z_p[[G]] ≅ Z_p[G_tors][[T]] is a reduced noetherian finite free Z_p[[Γ']]-algebra, a finite product of complete local rings. Its total quotient ring Q(Λ_{F∞}) (localisation at all non-zerodivisors) is a finite product of fields. An element x ∈ Λ_{F∞} is a non-zerodivisor iff ψ(x) ≠ 0 in O_ψ[[T]] for every character ψ of G_tors. For n ≥ 0 the projection Λ_{F∞} → Z_p[Gal(F_n/k)] is surjective with kernel (γ_F^{p^n} − 1), γ_F a generator of Γ_F; for k ⊆ F' ⊆ F restriction Λ_{F∞} → Λ_{F'_∞} is surjective. The sharp involution, character evaluations and invertible fractional Λ_{F∞}-submodules of Q(Λ_{F∞}) (determinant lines) are imported from PadicMeasuresIwasawaAlgebras Layers 5–6. When p divides #G_tors the character idempotents of G_tors do not lie in Λ_{F∞} (character-decomposition-integrality).

**Hypotheses and conventions.**

- k totally real, F/k finite abelian, F_∞ the cyclotomic Z_p-extension of F, G = Gal(F_∞/k).
- p any prime, p = 2 included.

**Proof plan.**

1. G is abelian and has an open subgroup Z_p. Its prime-to-p part is finite, and its pro-p part is a finitely generated Z_p-module of rank one. The structure theorem gives G ≅ G_tors × Z_p; the quotient by torsion splits because Z_p is a free Z_p-module.
2. Z_p[[G_tors × Γ']] = Z_p[G_tors][[T]] by the coordinate of iwasawa-algebra-coordinate; it is finite free over Z_p[[Γ']].
3. Reducedness: Q_p[G_tors] is semisimple, so Z_p[G_tors] is reduced, and a power-series ring over a reduced noetherian ring is reduced; a reduced noetherian ring has a total quotient ring that is a finite product of fields.
4. Non-zerodivisors are detected after the injective character map Λ_{F∞} → ∏_ψ O_ψ[[T]] (PadicMeasuresIwasawaAlgebras L6 character evaluation).
5. Finite levels: Gal(F_n/k) = G/Γ_F^{p^n}; apply finite-level-kernel to Γ_F.

**Prerequisites.**

- `IntegralIwasawaTheory:I.1/iwasawa-algebra-coordinate`
- `IntegralIwasawaTheory:I.1/finite-level-kernel`
- `IntegralIwasawaTheory:I.1/cyclotomic-zp-extension`
- `PadicMeasuresIwasawaAlgebras:L1`
- `PadicMeasuresIwasawaAlgebras:L5`
- `PadicMeasuresIwasawaAlgebras:L6/character-evaluation`
- `PadicMeasuresIwasawaAlgebras:L6/sharp-involution`
- `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`
- `mathlib:FractionRing`
- `mathlib:MonoidAlgebra`
- `mathlib:Module.Invertible`

**API.**

- `IntegralIwasawaTheory.equivariantIwasawaAlgebra` (constructor): Λ_{F∞} = Z_p[[Gal(F_∞/k)]].
- `IntegralIwasawaTheory.equivariantIwasawaAlgebra_finite_free` (structure): Λ_{F∞} is finite free over Z_p[[Γ']] of rank #G_tors.
- `IntegralIwasawaTheory.equivariantIwasawaAlgebra_isReduced` (instance): Λ_{F∞} is reduced and noetherian.
- `IntegralIwasawaTheory.totalQuotient` (data): Q(Λ_{F∞}) := FractionRing Λ_{F∞}, a finite product of fields.
- `IntegralIwasawaTheory.mem_nonZeroDivisors_iff_character` (characterisation): x is a non-zerodivisor iff ψ(x) ≠ 0 for every character ψ of G_tors.
- `IntegralIwasawaTheory.toLayer` (projection): Λ_{F∞} → Z_p[Gal(F_n/k)], surjective with kernel (γ_F^{p^n} − 1).
- `IntegralIwasawaTheory.restrict` (functoriality): For k ⊆ F' ⊆ F, the surjection Λ_{F∞} → Λ_{F'∞} induced by restriction; identity for F' = F, compatible with composition.
- `IntegralIwasawaTheory.sharp` (compatibility): The involution σ ↦ σ^{-1}, the PadicMeasuresIwasawaAlgebras L6 sharp involution on each finite level, compatible with toLayer.
- `IntegralIwasawaTheory.equivariantToLayer_comp` (simp): Projection to a lower layer equals projection to a higher layer followed by the finite group-ring quotient.

**Checks.**

- `equivariant_trivial_extension` (degenerate): For F = k, Λ_{F∞} is the Iwasawa algebra Λ_k ≅ Z_p[[T]].
- `group_ring_Z2_C2_image` (computation): For G_tors = Z/2 and p = 2, the character map Z_2[Z/2] → Z_2 × Z_2, σ ↦ (1, −1), is injective with image {(a, b) : a ≡ b mod 2} of index 2.
- `idempotent_not_integral` (non-example): For G_tors = Z/2 and p = 2, e = (1 + σ)/2 is an idempotent of Q(Λ_{F∞}) with integral character values 1 and 0, but e ∉ Λ_{F∞}; integrality cannot be checked character by character.
- `toLayer_augmentation` (compatibility): The composite of toLayer with the augmentation of Z_p[Gal(F_n/k)] is the augmentation of Λ_{F∞}.

**Uses.**

- IntegralIwasawaTheory:I.8/burns-flach-iwasawa-complex: C_{F∞,S} is a perfect complex of Λ_{F∞}-modules
- IntegralIwasawaTheory:I.9/integral-determinant-main-conjecture: the identity Det(C)^{-1} = g Λ_{F∞} lives in Q(Λ_{F∞})
- IntegralIwasawaTheory:I.3/deligne-ribet-dictionary: g_{F∞/k,S} is an element of Q(Λ_{F∞})
- NoncommutativeAndEquivariantIwasawa:NE.6/abelian-case: the abelian case Λ(G × Δ) of the noncommutative main conjecture

**Acceptance.**

- F = k: Λ_{F∞} = Λ_k ≅ Z_p[[T]].
- Kurihara §4.1: Λ_{F∞} = Z_p[[Gal(F_∞/k)]] and its total quotient ring carry g_{F∞/k,S}.

**Sources.**

- **KURIHARA**, §4.1, pp. 22–24. Sets Λ_{F∞} = Z_p[[Gal(F_∞/k)]] for an abelian totally real F/k with F_∞ cyclotomic and states the equivariant main conjecture inside its total quotient ring.
- **KURIHARA**, §3, p. 17. Defines Q(Λ_{K∞}) as the total quotient ring and works with a topological generator of Gal(K_∞/K).
- **KAKDE-2013**, §3, p. 14. Writes G = H × Γ with H finite abelian and places the Deligne–Ribet pseudomeasure in the total quotient ring Q(Λ(G)).
- **DK-2023**, §2.2, pp. 15–16. Decomposes O[G] = ∏_χ O[G_p]_χ into local components and describes character group rings as images in ∏_ψ O_ψ.

### Integral character decomposition and its failure at p

**Theorem target:** `IntegralIwasawaTheory:I.1/character-decomposition-integrality`.

**Review — corrected.** Restricted height-one descent to suitable invertible or reflexive objects; arbitrary integral ideals are not determined by character values or height-one data alone.

Let Δ be a finite abelian group and O a finite extension of Z_p containing the values of all characters of Δ. (i) The character map O[Δ] → ∏_{ψ ∈ Δ̂} O, x ↦ (ψ(x)), is injective with finite cokernel; it is an isomorphism iff p ∤ #Δ. (ii) If p ∤ #Δ, then O[Δ][[T]] = ∏_ψ O[[T]], and Fitting ideals, characteristic ideals and determinant lines of finitely generated modules decompose character by character. (iii) If p | #Δ, an element of the total quotient ring with all ψ-components in O[[T]] need not lie in O[Δ][[T]]; an identity of integral group-ring ideals proved after the scalar extension to ∏_ψ O[[T]] must be descended separately, for instance through the character group rings R_Ψ and their component decomposition, or through height-one localisation together with an appropriate reflexivity or invertibility theorem. Height-one agreement alone is not a descent criterion for arbitrary ideals.

**Hypotheses and conventions.**

- Δ finite abelian, O ⊇ Z_p containing the character values.

**Proof plan.**

1. Injectivity: Q_p[Δ] ⊗ Frac(O) is semisimple with the ψ as its simple factors (Tau Ceti CharacterTheory Layer 3 idempotents).
2. If p ∤ #Δ the idempotents e_ψ = (#Δ)^{-1} Σ ψ(δ)^{-1}δ are integral; conversely, if the map is an isomorphism then e_{trivial} = (#Δ)^{-1}Σδ is integral, forcing p ∤ #Δ.
3. Decomposition of Fitting and characteristic ideals over a product ring is componentwise (PadicMeasuresIwasawaAlgebras L4 character decomposition, L6 character group rings).
4. (iii) the example e = (1 + σ)/2 for Δ = Z/2, p = 2.

**Prerequisites.**

- `PadicMeasuresIwasawaAlgebras:L6/character-group-ring`
- `PadicMeasuresIwasawaAlgebras:L6/character-evaluation`
- `PadicMeasuresIwasawaAlgebras:L6/group-ring-component-decomposition`
- `PadicMeasuresIwasawaAlgebras:L4/character-decomposition`
- `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`
- `mathlib:MonoidAlgebra`

**Acceptance.**

- Δ = Z/2, p = 2: cokernel of Z_2[Δ] → Z_2 × Z_2 has order 2.
- Δ = Z/3, p = 2: Z_2[Δ] ⊗ Z_2[ζ_3] ≅ Z_2[ζ_3]^3.

**Sources.**

- **DK-2023**, §2.2, pp. 15–16. Defines character group rings R_Ψ as images of O[G] in ∏_{ψ∈Ψ} O_ψ, finite-index subrings of products of DVRs, and the component decomposition O[G] = ∏ O[G_p]_χ.
- **KOLSTER-2009**, Lecture 2, §3, p. 13. Uses that for #G prime to p the idempotents lie in Z_p[G], which is then a maximal order, a product of DVRs O_ρ.
- **KURIHARA**, §2.5, p. 11, proof of Corollary 2.9. Relates Fitting ideals of a module and its dual only when the p-part of the group is cyclic, illustrating that p-power order groups need separate integral arguments.

## IntegralIwasawaTheory:I.2

### Class-group towers and their limits

**Construction target:** `IntegralIwasawaTheory:I.2/class-group-limit`.

**Planet:** Class-group Iwasawa module.

**Review — corrected.** Replaced the impossible finite-S test by a finite-level class-generation test; corrected the norm citation.

Let K_∞/K be the cyclotomic Z_p-extension with layers K_n, and S a finite set of finite places of K. Put A_n = Cl(O_{K_n}) ⊗ Z_p (the p-part) and A_{n,S} = Cl(O_{K_n,S}) ⊗ Z_p, the quotient of A_n by the classes of the primes above S. For m ≥ n let N_{m,n} : A_m → A_n be induced by the ideal norm and j_{n,m} : A_n → A_m by extension of ideals; N_{m,n} ∘ j_{n,m} is multiplication by p^{m−n} and j_{n,m} ∘ N_{m,n} is the norm element ν_{m,n} = Σ_{σ ∈ Gal(K_m/K_n)} σ. The unramified class module is X_∞ := lim_n A_n along the N_{m,n}, a compact Λ_K-module; X'_{∞,S} := lim_n A_{n,S}; and A_∞ := colim_n A_n along the j_{n,m}, a discrete p-primary Λ_K-module. The same constructions apply to T-smoothed ray class groups Cl^T and to any tower of finite subextensions of an infinite abelian extension (for example the ray tower K(p^∞𝔣) of an imaginary quadratic field), always with norm transition maps.

**Hypotheses and conventions.**

- K a number field, p a prime, K_∞/K cyclotomic; S a finite set of finite places of K.
- Transition maps of inverse limits are norms; of direct limits, extension of ideals.

**Proof plan.**

1. Ideal norm and extension of ideals descend to class groups and to S-class groups (Mathlib ClassGroup; Ideal.relNorm; Tau Ceti ray class groups for Cl^T).
2. The composite identities follow from N_{K_m/K_n}(𝔞O_{K_m}) = 𝔞^{[K_m:K_n]} for an ideal 𝔞 of K_n, and from the fact that the extension to K_m of the norm of an ideal 𝔄 of K_m is Π_{σ ∈ Gal(K_m/K_n)} σ(𝔄).
3. The Λ_K-module structures come from arithmetic-compact-action (inverse limit) and from the discrete Γ_K-action (direct limit).

**Prerequisites.**

- `IntegralIwasawaTheory:I.1/cyclotomic-layers`
- `IntegralIwasawaTheory:I.1/arithmetic-compact-action`
- `mathlib:ClassGroup`
- `mathlib:Ideal.relNorm`
- `tauceti:TauCeti.GlobalNumberFields.RayClassGroup`
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers`

**API.**

- `IntegralIwasawaTheory.classModule` (constructor): A_n = Cl(O_{K_n}) ⊗ Z_p and A_{n,S} = Cl(O_{K_n,S}) ⊗ Z_p, finite Z_p[Gal(K_n/K)]-modules.
- `IntegralIwasawaTheory.classNorm` (data): N_{m,n} : A_m → A_n induced by the ideal norm.
- `IntegralIwasawaTheory.classExtend` (data): j_{n,m} : A_n → A_m induced by extension of ideals.
- `IntegralIwasawaTheory.classNorm_classExtend` (relation): N_{m,n} ∘ j_{n,m} = p^{m−n}.
- `IntegralIwasawaTheory.classExtend_classNorm` (relation): j_{n,m} ∘ N_{m,n} = ν_{m,n}.
- `IntegralIwasawaTheory.unramifiedModule` (constructor): X_∞ = lim_n A_n along norms, a compact Λ_K-module; X'_{∞,S} likewise.
- `IntegralIwasawaTheory.classColimit` (constructor): A_∞ = colim_n A_n along extension maps, a discrete p-primary Λ_K-module.
- `IntegralIwasawaTheory.classModule_functorial` (functoriality): For K ⊆ L finite, norm and extension maps between the towers of K and L commute with the transition maps.
- `IntegralIwasawaTheory.classLimit_ext` (extensionality): Two elements of X_∞ agree iff their components in every A_n agree.

**Checks.**

- `unramifiedModule_rat` (computation): For K = Q and any p, A_n(Q_n) = 0 for all n, hence X_∞ = 0 and A_∞ = 0.
- `classModule_Q_mu37` (computation): For K = Q(μ_37) and p = 37, A_0 is cyclic of order 37.
- `classModule_S_all` (degenerate): At a fixed level n, if the classes of the primes above the finite set S generate A_n, then A_{n,S} = 0. No uniform finite S killing all tower levels is asserted.
- `unramifiedModule_not_colimit` (non-example): Taking the limit along extension maps j instead of norms gives the discrete module A_∞, not the compact X_∞; for K = Q(μ_37), p = 37, X_∞ is a nonzero compact Λ-module while A_∞ is a nonzero discrete p-primary torsion group, so the two constructions are not interchangeable.

**Uses.**

- IntegralIwasawaTheory:I.2/class-field-identification: X_∞ is identified with the Galois group of the maximal unramified abelian pro-p extension
- IntegralIwasawaTheory:L2/one-prime-inertia-control: control of X_∞ in a one-prime tower
- SpecialValuesBirchTate:B.5: the minus class module A_∞^- and its dual at p = 2
- ArithmeticKTheory:N.6: finite-level S-class groups, norms and coinvariants
- CMAllPrimeMainConjectures: inverse limits of p-primary class groups in the ray tower of an imaginary quadratic field

**Acceptance.**

- K = Q: A_n = 0 for every n and every p, so X_∞ = 0.
- K = Q(μ_37), p = 37: A_0 ≅ Z/37, so X_∞ ≠ 0.

**Sources.**

- **SHARIFI**, Definition 3.2.3, p. 78; Definitions 3.2.17–3.2.18, p. 83. Defines A_n, the norm maps N_{n,m}, the inclusion maps j_{n,m}, X_∞ = lim A_n, A_∞ = colim A_n, and the S-split variants X'_∞ and A'_∞.
- **BURUNGALE-TIAN-2026**, §2.1.1, p. 3. Takes h² = lim Cl_{K'}(p) and h¹ = lim (O_{K'}[1/p]^× ⊗ Z_p) over the finite subextensions K' of the ray tower K(p^∞𝔣), with norm transition maps.
- **KURIHARA**, §3, pp. 15–17. Uses the minus parts of A_{K∞} = colim A_{K_n} and of the T-smoothed class groups along the cyclotomic tower of a CM field.

### Unit and S-unit towers

**Construction target:** `IntegralIwasawaTheory:I.2/unit-limits`.

**Review — corrected.** Added a working characterisation, extensionality or universal-property API after checking the stated construction.

With K_n as above and S a finite set of places of K, put E_n = O_{K_n}^× ⊗_Z Z_p and E_{n,S} = O_{K_n,S}^× ⊗_Z Z_p. Because these unit groups are finitely generated, E_n and E_{n,S} are finitely generated Z_p-modules equal to the p-adic completions of O_{K_n}^× and O_{K_n,S}^×; their torsion is μ_{p^∞}(K_n). The norm maps N_{K_m/K_n} induce transition maps, and E_∞ := lim_n E_n, E_{∞,S} := lim_n E_{n,S} are compact Λ_K-modules. For an arbitrary infinite abelian extension with finite subextensions K', the analogous limit lim_{K'} (O_{K'}[1/p]^× ⊗ Z_p) along norms is defined the same way.

**Hypotheses and conventions.**

- K_n are the layers of the cyclotomic Z_p-extension; S a finite set of places.

**Proof plan.**

1. Dirichlet's S-unit theorem gives finite generation (Mathlib NumberField.Units.rank for units; S-units through the valuation sequence).
2. For a finitely generated abelian group B, B ⊗ Z_p = lim B/p^m B.
3. Norms are Galois-equivariant, so the limits are Λ_K-modules by arithmetic-compact-action.

**Prerequisites.**

- `IntegralIwasawaTheory:I.1/cyclotomic-layers`
- `IntegralIwasawaTheory:I.1/arithmetic-compact-action`
- `mathlib:NumberField.Units.rank`
- `mathlib:Algebra.norm`

**API.**

- `IntegralIwasawaTheory.unitModule` (constructor): E_n = O_{K_n}^× ⊗ Z_p and E_{n,S} = O_{K_n,S}^× ⊗ Z_p.
- `IntegralIwasawaTheory.unitModule_fg` (structure): E_n and E_{n,S} are finitely generated Z_p-modules with torsion μ_{p^∞}(K_n).
- `IntegralIwasawaTheory.unitModule_rank` (characterisation): rank_{Z_p} E_n = r_1(K_n) + r_2(K_n) − 1 and rank E_{n,S} = rank E_n + #S(K_n)_{finite}.
- `IntegralIwasawaTheory.unitLimit` (constructor): E_∞ = lim_n E_n and E_{∞,S} = lim_n E_{n,S} along norms, compact Λ_K-modules.
- `IntegralIwasawaTheory.unitLimit_functorial` (functoriality): For K ⊆ L finite, the norm maps between the towers commute with transition maps.
- `IntegralIwasawaTheory.unitLimit_ext` (extensionality): Two norm-compatible unit systems agree iff their units agree at every layer.

**Checks.**

- `unitModule_rat_odd` (computation): For K = Q and p odd, E_0 = 0 and E_{0,{p}} ≅ Z_p generated by p.
- `unitModule_rat_two` (degenerate): For K = Q and p = 2, E_0 = {±1} ⊗ Z_2 ≅ Z/2: the torsion is kept.
- `unitModule_not_multiplicative_group` (non-example): K^× ⊗ Z_p is not finitely generated over Z_p and differs from the p-adic completion of K^×; the construction is restricted to (S-)units.
- `unitModule_rank_real_quadratic` (compatibility): For K real quadratic and S = ∅, E_0 has Z_p-rank 1, matching Mathlib's NumberField.Units.rank K = 1.

**Uses.**

- IntegralIwasawaTheory:I.2/global-local-unit-sequence: E_∞ maps to the semilocal units
- IntegralIwasawaTheory:L1/principal-global-unit-closures: closures of global units in the classical tower
- CMAllPrimeMainConjectures: the norm-compatible p-unit module h¹ of Burungale–Tian

**Acceptance.**

- K = Q, p odd: E_0 = {±1} ⊗ Z_p = 0 and E_{0,{p}} = Z[1/p]^× ⊗ Z_p ≅ Z_p, generated by p ⊗ 1.

**Sources.**

- **SHARIFI**, Definition 3.3.5, p. 85. Defines ℰ_∞ = lim ℰ_{F_n} and ℰ'_∞ = lim ℰ_{F_n,S} for S = V_{p∞} under norm maps.
- **SHARIFI-AWS**, §2.5, p. 24. Defines ℰ_n = Z_p[1/p, μ_{p^n}]^× ⊗ Z_p and ℰ_∞ = lim ℰ_n for the tower Q(μ_{p^n}).
- **BURUNGALE-TIAN-2026**, §2.1.1, p. 3. Defines h¹ = lim (O_{K'}[1/p]^× ⊗ Z_p) with norm transition maps.

### Semilocal principal units and the global-to-local map

**Construction target:** `IntegralIwasawaTheory:I.2/semilocal-principal-units`.

**Review — corrected.** Distinguished the pinned Z_p principal units from the newer general local-field unit filtration.

For a number field E and a prime p, let U(E) = ∏_{v | p} U^1(E_v), the product of the principal units of the completions at the places above p. The canonical map (O_{E_v}^×)^∧_p → U^1(E_v) from the pro-p completion is an isomorphism (the prime-to-p roots of unity die), so the global units define ι_E : O_E^× ⊗ Z_p → U(E); Ē(E) := ι_E(O_E^× ⊗ Z_p) is closed. Along the cyclotomic tower, U_n = U(K_n), local norms define U_∞ = lim_n U_n, ι_n is compatible with norms, and Ē_∞ = lim_n Ē(K_n). For S ⊇ S_p, the pro-p completions ℱ_n = ∏_{v | p} (K_{n,v}^×)^∧_p receive the S-units.

**Hypotheses and conventions.**

- E a number field, p a prime; U^1(E_v) = 1 + 𝔪_v.

**Proof plan.**

1. Use the local-field unit filtration and Teichmüller splitting from TauCetiRoadmap LocalFieldsRamification Layer 1 to prove O_{E_v}^× = μ_{q_v−1} × U^1(E_v) with U^1 pro-p. At the pins TauCeti.unitsPrincipal only handles Z_p; the newer library has a general unitFiltration, so import its available filtration and supply only the completion and norm compatibility still needed here.
2. ι_E is the composite of O_E^× ⊗ Z_p → ∏ (O_{E_v}^×)^∧_p with this identification; its image is compact, hence closed.
3. Local norms are compatible with global norms under the diagonal embeddings.

**Prerequisites.**

- `IntegralIwasawaTheory:I.2/unit-limits`
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`
- `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletion`
- `mathlib:PadicInt`

**API.**

- `IntegralIwasawaTheory.semilocalUnits` (constructor): U(E) = ∏_{v|p} U^1(E_v), a finitely generated Z_p-module of rank [E : Q].
- `IntegralIwasawaTheory.proPCompletion_units_equiv` (equivalence): (O_{E_v}^×)^∧_p ≅ U^1(E_v), canonically.
- `IntegralIwasawaTheory.globalToLocal` (data): ι_E : O_E^× ⊗ Z_p → U(E).
- `IntegralIwasawaTheory.globalUnitClosure` (constructor): Ē(E) = image of ι_E, a closed Z_p-submodule.
- `IntegralIwasawaTheory.semilocalLimit` (constructor): U_∞ = lim_n U(K_n) along local norms, a compact Λ_K-module; ι_n induce E_∞ → U_∞.
- `IntegralIwasawaTheory.globalToLocal_norm` (functoriality): ι commutes with global and local norms.
- `IntegralIwasawaTheory.semilocalUnits_ext` (extensionality): Two semilocal principal units agree iff their components at every v | p agree.

**Checks.**

- `semilocalUnits_rat_odd` (computation): For E = Q and p odd, U(Q) = 1 + pZ_p, free of rank 1.
- `semilocalUnits_rat_two` (degenerate): For E = Q and p = 2, U(Q) = Z_2^× has torsion {±1}; nothing is discarded at p = 2.
- `globalToLocal_not_units` (non-example): The map O_E^× → ∏_{v|p} O_{E_v}^× without passing to pro-p completions does not land in U(E): for E = Q(i), p = 3, the unit i maps to an element of order 4 in Z_3[i]^×, which is not principal.
- `semilocalUnits_rank` (compatibility): rank_{Z_p} U(E) = [E : Q], since U^1(E_v) has rank [E_v : Q_p].

**Uses.**

- IntegralIwasawaTheory:I.2/leopoldt-map-and-defect: Leopoldt's map is ι_E
- IntegralIwasawaTheory:I.2/global-local-unit-sequence: U_∞/Ē_∞ is the inertia part of 𝔛_S
- ColemanPowerSeries:L4: the local principal units and their quotient by cyclotomic units
- Polylogarithms:P.6: the completed global-to-local unit map and its comparison with principal-unit logarithms

**Acceptance.**

- E = Q, p odd: U(Q) = 1 + pZ_p ≅ Z_p.
- E = Q, p = 2: U(Q) = Z_2^× = {±1} × (1 + 4Z_2) contains torsion.

**Sources.**

- **SHARIFI**, Conjecture 1.5.1 and the surrounding definitions, p. 28; Definition 3.3.5, p. 85. Defines the semilocal units 𝒰_v as p-completions of local units, the map ι_F : ℰ_F → ⊕_{v|p} 𝒰_v, and their inverse limits 𝒰_∞ and ℱ_∞ along local norms.
- **SHARIFI-AWS**, §2.5, p. 24. Defines 𝒰_n as the pro-p completion of Q_p(μ_{p^n})^× and 𝒰_∞ = lim 𝒰_n.

### Leopoldt's conjecture and the Leopoldt defect

**Definition target:** `IntegralIwasawaTheory:I.2/leopoldt-map-and-defect`.

**Planet:** Leopoldt conjecture.

**Review — corrected.** Added a working characterisation, extensionality or universal-property API after checking the stated construction.

For a number field E and a prime p, Leopoldt's map is ι_E : O_E^× ⊗_Z Z_p → U(E) = ∏_{v|p} U^1(E_v) of semilocal-principal-units. Its kernel is a torsion-free Z_p-module (the torsion μ_{p^∞}(E) of the source embeds), and the Leopoldt defect is δ(E, p) := rank_{Z_p} ker ι_E = (r_1(E) + r_2(E) − 1) − rank_{Z_p} Ē(E). Leopoldt's conjecture for (E, p) is the proposition δ(E, p) = 0, equivalently injectivity of ι_E. This is the strong (field-level) conjecture; the weak Leopoldt property of a Z_p-extension (weak-leopoldt) asks only that δ(K_n, p) stay bounded. The equivalence with the nonvanishing of the p-adic regulator and the logarithmic formulation are comparisons that import this definition.

**Hypotheses and conventions.**

- E a number field, p a prime.

**Proof plan.**

1. ker ι_E ∩ torsion = 0 because roots of unity of p-power order embed into each E_v.
2. rank_{Z_p}(O_E^× ⊗ Z_p) = r_1 + r_2 − 1 by Dirichlet's unit theorem (Mathlib NumberField.Units.rank).

**Prerequisites.**

- `IntegralIwasawaTheory:I.2/semilocal-principal-units`
- `mathlib:NumberField.Units.rank`

**API.**

- `IntegralIwasawaTheory.leopoldtMap` (data): ι_E : O_E^× ⊗ Z_p → U(E).
- `IntegralIwasawaTheory.leopoldtDefect` (constructor): δ(E, p) = rank_{Z_p} ker ι_E, a natural number.
- `IntegralIwasawaTheory.LeopoldtConjecture` (constructor): The proposition δ(E, p) = 0.
- `IntegralIwasawaTheory.leopoldtConjecture_iff_injective` (characterisation): LeopoldtConjecture E p ↔ ι_E injective.
- `IntegralIwasawaTheory.leopoldtDefect_eq` (characterisation): δ(E, p) = r_1 + r_2 − 1 − rank_{Z_p} Ē(E).
- `IntegralIwasawaTheory.leopoldtDefect_le` (relation): δ(E, p) ≤ δ(E', p) for a finite Galois extension E'/E (descent of a kernel along restriction).
- `IntegralIwasawaTheory.leopoldtDefect_rank_zero` (example): If r_1 + r_2 = 1 (E = Q or imaginary quadratic) then δ(E, p) = 0.
- `IntegralIwasawaTheory.leopoldtDefect_eq_zero_iff` (characterisation): δ(E,p)=0 iff the completed global-to-local map is injective on the torsion-free Q_p-space of global units.

**Checks.**

- `leopoldt_rat` (degenerate): δ(Q, p) = 0 for every prime p.
- `leopoldt_real_quadratic` (computation): For E real quadratic with fundamental unit ε, ι_E(ε) is non-torsion (otherwise ε would be a root of unity in some E_v and hence in E), so δ(E, p) = 0.
- `leopoldt_not_uncompleted` (non-example): The map O_E^× → ∏_{v|p} E_v^× is always injective; that injectivity is not Leopoldt's conjecture, which concerns O_E^× ⊗ Z_p.
- `leopoldt_not_weak` (non-example): Boundedness of δ(K_n, p) along the cyclotomic tower (weak Leopoldt, a theorem) does not imply δ(K, p) = 0; the two predicates are distinct.

**Uses.**

- IntegralIwasawaTheory:L4/leopoldt-defect: the logarithmic formulation of the defect and the abelian Leopoldt theorem
- Polylogarithms:P.6: the equivalence with nonvanishing of the p-adic regulator, kept in P.6
- AutomorphicPadicLFunctions:L0/leopoldt-dimension-formula: the dimension of the ray-class limit with the Leopoldt defect
- SelmerIwasawaCohomology:L4/leopoldt-selmer: Leopoldt and the strict-at-p Tate Selmer group
- IntegralIwasawaTheory:I.2/weak-leopoldt: the defects δ(K_n, p) along the cyclotomic tower

**Acceptance.**

- δ(Q, p) = 0 for every p.
- δ(E, p) = 0 for E imaginary quadratic or real quadratic.

**Sources.**

- **SHARIFI**, Conjecture 1.5.1 p. 28, Proposition 1.5.6 and Theorem 1.5.7 p. 31, Definition 1.5.9 p. 32. States Leopoldt's conjecture as injectivity of ι_F, reformulates it, and defines the Leopoldt defect as the Z_p-rank of ker ι_F.
- **SHARIFI**, Conjecture 3.3.2, p. 84. States the weak Leopoldt conjecture as boundedness of the defects δ(F_n) in a Z_p-extension, distinguishing it from Leopoldt's conjecture.

### Maximal abelian pro-p extensions with prescribed ramification

**Construction target:** `IntegralIwasawaTheory:I.2/maximal-abelian-pro-p-extensions`.

**Planet:** Maximal abelian pro-p extensions.

**Review — corrected.** Added a working characterisation, extensionality or universal-property API after checking the stated construction.

Inside K̄, for an algebraic extension E of K and a set S of places of K: M_S(E) is the maximal abelian pro-p extension of E unramified outside the places above S (an archimedean place is unramified when it stays real; for p = 2 real places may ramify only if they lie in S); L(E) := M_∅(E) is the maximal unramified abelian pro-p extension; L'_S(E) is the maximal subextension of L(E) in which every place above S splits completely. Put 𝔛_S(E) = Gal(M_S(E)/E), X(E) = Gal(L(E)/E) and X'_S(E) = Gal(L'_S(E)/E). Each satisfies the universal property: every abelian pro-p extension of E with the stated condition lies in it, uniquely. If E is Galois over K, so are M_S(E), L(E), L'_S(E), and for E = K_∞ the groups are compact Λ_K-modules (arithmetic-compact-action). The unramified module X and the S-ramified module 𝔛_S are different objects and are never interchanged in a main conjecture.

**Hypotheses and conventions.**

- K a number field, p a prime, E/K algebraic inside K̄, S a set of places of K.

**Proof plan.**

1. Compositum of abelian pro-p extensions with the condition again satisfies it, so the maximal one exists (inside K̄).
2. Galois stability: a K-conjugate of an S-ramified abelian pro-p extension of E is again one when E/K is Galois.
3. Finite levels are described by class field theory (Tau Ceti ClassFieldTheory Layers 11–12): Gal(M_S(E)/E) for E a number field is the pro-p completion of the ray class groups of conductor supported on S.

**Prerequisites.**

- `IntegralIwasawaTheory:I.1/arithmetic-compact-action`
- `IntegralIwasawaTheory:I.1/cyclotomic-zp-extension`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`
- `mathlib:IntermediateField.fixedField`
- `mathlib:Field.absoluteGaloisGroup`
- `tauceti:OpenNormalSubgroup.maximalAbelianLayer`

**API.**

- `IntegralIwasawaTheory.maxAbelianProP` (constructor): M_S(E), the maximal abelian pro-p extension of E unramified outside S.
- `IntegralIwasawaTheory.sRamifiedModule` (constructor): 𝔛_S(E) = Gal(M_S(E)/E).
- `IntegralIwasawaTheory.unramifiedGaloisModule` (constructor): X(E) = Gal(L(E)/E), L(E) = M_∅(E).
- `IntegralIwasawaTheory.splitGaloisModule` (constructor): X'_S(E) = Gal(L'_S(E)/E).
- `IntegralIwasawaTheory.maxAbelianProP_lift` (universal-property): Every abelian pro-p extension of E unramified outside S is contained in M_S(E); hence a unique continuous surjection 𝔛_S(E) → Gal(E'/E).
- `IntegralIwasawaTheory.maxAbelianProP_mono` (functoriality): S ⊆ S' gives M_S(E) ⊆ M_{S'}(E) and a surjection 𝔛_{S'} → 𝔛_S; X(E) is a quotient of every 𝔛_S(E).
- `IntegralIwasawaTheory.sRamifiedModule_lambda` (instance): For E = K_∞ these are compact Λ_K-modules.
- `IntegralIwasawaTheory.maximalProPExtension_universal` (universal-property): Every abelian pro-p extension with the specified ramification and splitting conditions embeds in the chosen maximal extension; restriction induces its quotient Galois group.

**Checks.**

- `unramified_rat` (degenerate): X(Q) = 0, since Q has no nontrivial unramified extension.
- `sRamified_rat_odd` (computation): For p odd and S = {p, ∞}, M_S(Q) = Q_∞ and 𝔛_S(Q) ≅ Z_p (the maximal pro-p quotient of Gal(Q(μ_{p^∞})/Q) = Z_p^×).
- `unramified_ne_sRamified` (non-example): For E = Q, X(Q) = 0 while 𝔛_{{p,∞}}(Q) ≅ Z_p; replacing 𝔛_S by X changes the module.
- `split_quotient` (characterisation): X'_S(E) is the quotient of X(E) by the closed subgroup generated by the decomposition groups at the places above S.

**Uses.**

- IntegralIwasawaTheory:I.8/compact-complex-cohomology: H²(C_{F∞,S}) is the S-ramified module X_{F∞,S}
- IntegralIwasawaTheory:L1/cyclotomic-class-field-specialization: RJW's X = 𝔛_{{p}} and Y = X for the classical tower
- SpecialValuesBirchTate:B.6/kurihara-main-conjecture-over-f: X_{F∞,S} for p = 2 and S = S_2 ∪ S_∞
- IntegralIwasawaTheory:I.5/wiles-main-conjecture: the module X_S whose ψ-parts are compared with Deligne–Ribet

**Acceptance.**

- E = Q, S = ∅: L(Q) = Q, so X(Q) = 0.
- E = Q, S = {p, ∞}, p odd: M_S(Q) = Q_∞ and 𝔛_S(Q) ≅ Z_p.

**Sources.**

- **SHARIFI**, Remark 3.2.5, Proposition 3.2.6, Remark 3.2.9 and Definition 3.2.10, pp. 79–80. Defines S-ramified extensions, the maximal S-ramified abelian pro-p extensions L_n of the layers and of F_∞, the convention at archimedean places, and the S-ramified Iwasawa module 𝔛_{∞,S}.
- **SHARIFI**, Proposition 3.2.19, p. 83. Identifies X'_∞ with the Galois group of the maximal unramified abelian pro-p extension of F_∞ in which the primes above p split completely.
- **KOLSTER-2009**, Lecture 1, §1, p. 7. Introduces L_∞, L'_∞ and the maximal abelian pro-p extension M^S_∞ unramified outside S with X_S = Gal(M^S_∞/F_∞), the standard Iwasawa module.

### Class-field identification of the Iwasawa modules

**Theorem target:** `IntegralIwasawaTheory:I.2/class-field-identification`.

**Planet:** Class-field identification.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against SHARIFI Proposition 3.2.6 and Corollary 3.2.7, p. 79; Proposition 3.2.11 and (3.2.1), p. 80; Propositions 3.2.19–3.2.20, p. 83; KOLSTER-2009 Lecture 1, §1, p. 7. No local correction needed; imported proof inputs retain their stated supplier conditions.

Let K_∞/K be cyclotomic and n_0 as in tower-ramification. (a) The inverse limit of Artin maps gives a canonical isomorphism of Λ_K-modules X(K_∞) ≅ lim_n Gal(L(K_n)/K_n) ≅ lim_n A_n = X_∞ (the second by class field theory at each layer). (b) For S ⊇ S_p, X'_S(K_∞) ≅ lim_n A_{n,S}. (c) For any S, 𝔛_S(K_∞) ≅ lim_n 𝔛_S(K_n) under restriction, and 𝔛_S(K_n) is the pro-p completion of the ray class groups of K_n with conductor supported on S. (d) For n ≥ n_0, L(K_n) ∩ K_∞ = K_n, and the maps (X_∞)_{Γ^{p^n}} → A_n are controlled by the inertia groups at the primes above p (the exact sequence with ker Σ^{(m)} and coker Σ^{(m)}).

**Hypotheses and conventions.**

- K_∞/K the cyclotomic Z_p-extension; S a finite set of places of K.

**Proof plan.**

1. Every S-ramified abelian pro-p extension of K_∞ is a union of such extensions of the layers (Sharifi Proposition 3.2.6).
2. Artin reciprocity at each layer, compatible with norm and restriction (Tau Ceti ClassFieldTheory Layers 11–12).
3. For (d): beyond n_0 the primes above p are totally ramified in K_∞/K_n, so no nontrivial unramified extension of K_n lies in K_∞ (Sharifi (3.2.1)).

**Prerequisites.**

- `IntegralIwasawaTheory:I.2/class-group-limit`
- `IntegralIwasawaTheory:I.2/maximal-abelian-pro-p-extensions`
- `IntegralIwasawaTheory:I.1/tower-ramification`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`

**Acceptance.**

- Sharifi Corollary 3.2.7: the inverse limit of Artin maps identifies X_∞ with the Galois group of the maximal unramified abelian pro-p extension of F_∞.

**Sources.**

- **SHARIFI**, Proposition 3.2.6 and Corollary 3.2.7, p. 79; Proposition 3.2.11 and (3.2.1), p. 80; Propositions 3.2.19–3.2.20, p. 83. Proves that Gal(L_∞/F_∞) is the inverse limit of the Gal(L_n/F_n), identifies X_∞ with the unramified Galois group, gives the control sequence through inertia at p, and the S-split analogues.
- **KOLSTER-2009**, Lecture 1, §1, p. 7. Identifies X_∞ and X'_∞ as Galois groups over F_∞ and states that they are finitely generated torsion Λ-modules.

### The global–local unit sequence

**Theorem target:** `IntegralIwasawaTheory:I.2/global-local-unit-sequence`.

**Planet:** Global–local unit sequence.

**Review — unverifiable.** Restricted the unaugmented global–local sequence to odd p or totally imaginary K and removed the unproved limit-unit identification. The real dyadic extension and E_∞ comparison remain open.

Let K_∞/K be cyclotomic, S = S_p ∪ S_∞, and assume p is odd or K is totally imaginary. (a) At a finite layer, 0 → Ē(K_n) → U(K_n) → Gal(M_S(K_n)/K_n) → Gal(L(K_n)/K_n) → 0 is exact, with Ē the image of completed global units. (b) Taking compact inverse limits gives 0 → Ē_∞ → U_∞ → 𝔛_S(K_∞) → X(K_∞) → 0. Identifying E_∞ with Ē_∞ requires a separate weak-Leopoldt comparison and is not part of inverse-limit exactness. (c) The S-unit version is 0 → Ē_{∞,S} → ℱ_∞ → 𝔛_S(K_∞) → X′_S(K_∞) → 0. (d) If μ_{2p} ⊆ K, Kummer duality gives 0 → A_∞^∨(1) → 𝔛_S(K_∞) → Hom_{Z_p}(O_{K∞}^× ⊗ Z_p, Z_p(1)) → 0. For p = 2 and real K, the finite local product must also include real sign factors and specify the wide/narrow class convention; that extension remains open.

**Hypotheses and conventions.**

- K_∞/K cyclotomic, S = S_p ∪ S_∞; p odd or K totally imaginary for (a)–(c).
- For (d), μ_{2p} ⊆ K.

**Proof plan.**

1. (a) is the class-field-theoretic description of the maximal p-ramified abelian pro-p extension (Sharifi Theorem 1.5.4).
2. Apply compact inverse-limit exactness to the finite-layer sequences; this proves the sequence with Ē_∞, not the additional assertion E_∞ ≅ Ē_∞. Sharifi Proposition 3.3.6, p. 86, imposes the odd-prime or no-real-place hypothesis.
3. (d): Kummer theory for H¹(G_{K∞,S}, μ_{p^∞}) and Pontryagin duality (Sharifi Propositions 3.3.9, Corollary 3.3.14).

**Prerequisites.**

- `IntegralIwasawaTheory:I.2/class-field-identification`
- `IntegralIwasawaTheory:I.2/semilocal-principal-units`
- `IntegralIwasawaTheory:I.2/unit-limits`
- `IntegralIwasawaTheory:I.2/maximal-abelian-pro-p-extensions`
- `PadicMeasuresIwasawaAlgebras:L5`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

**Acceptance.**

- For K = Q(μ_p), p odd, (b) is the sequence 0 → ℰ_∞ → 𝒰_∞ → 𝔛_∞ → X_∞ → 0 of Sharifi's AWS notes (2.5.1), and its plus part is the L1 sequence 0 → E^+/C^+ → U^+/C^+ → X^+ → Y^+ → 0 after dividing by cyclotomic units.

**Sources.**

- **SHARIFI**, Theorem 1.5.4, p. 29; Proposition 3.3.6, p. 86; Proposition 3.3.9, Corollary 3.3.10, p. 86–88; Corollary 3.3.14, p. 89. Gives the class-field exact sequences relating global units, semilocal units and the p-ramified and unramified Galois groups at finite level, their inverse limits along the cyclotomic tower, and the Kummer-dual sequence for F ⊇ μ_{2p}.
- **SHARIFI-AWS**, §2.5, (2.5.1) and p. 24. States the exact sequence 0 → ℰ_∞ → 𝒰_∞ → 𝔛_∞ → X_∞ → 0 with injectivity on the left by weak Leopoldt.

### Finite generation and torsion of the arithmetic modules

**Theorem target:** `IntegralIwasawaTheory:I.2/iwasawa-finiteness`.

**Review — unverifiable.** Exposed the missing finite-generation proof for global and semilocal unit limits. The unit finite-generation argument is missing.

For the cyclotomic Z_p-extension K_∞/K and finite S ⊇ S_p: (a) X(K_∞) = X_∞ and X'_S(K_∞) are finitely generated torsion Λ_K-modules; (b) 𝔛_S(K_∞) is a finitely generated Λ_K-module; (c) A_∞^∨ is finitely generated torsion, pseudo-isomorphic to X_∞^ι, and has no nonzero finite Λ_K-submodule; (d) E_∞ and U_∞ are finitely generated Λ_K-modules. Iwasawa's growth formula for #A_n is imported from IntegralIwasawaTheory L2 and PadicMeasuresIwasawaAlgebras L4.

**Hypotheses and conventions.**

- K_∞/K cyclotomic; S finite containing S_p.

**Proof plan.**

1. Control sequence (3.2.1) of class-field-identification shows (X_∞)_{Γ^{p^m}} has bounded Z_p-rank and finite-index image in A_m; compact Nakayama (PadicMeasuresIwasawaAlgebras L5) gives finite generation, and boundedness of ranks gives torsion (Sharifi Proposition 3.2.11).
2. Duality between inverse and direct limits (Sharifi Proposition 3.2.14, Corollary 3.2.15).
3. 𝔛_S is finitely generated because its Γ-coinvariants are finitely generated over Z_p (Sharifi Theorem 3.3.3 proof).
4. For (d), local norm-compatible unit structure must first give finite generation of U_∞. To deduce finite generation of E_∞ as a closed submodule, one also needs E_∞ ≅ Ē_∞ from weak Leopoldt. These steps, including real sign factors at 2, are not supplied by the cited class-group finiteness theorem (G-I2-UNIT-FINITENESS).

**Prerequisites.**

- `IntegralIwasawaTheory:I.2/class-field-identification`
- `IntegralIwasawaTheory:I.2/class-group-limit`
- `PadicMeasuresIwasawaAlgebras:L5`
- `PadicMeasuresIwasawaAlgebras:L4/pseudo-isomorphism`
- `PadicMeasuresIwasawaAlgebras:L4/iwasawa-module-structure-theorem`

**Acceptance.**

- For K = Q, X_∞ = 0; for K = Q(μ_p) with p regular, X_∞ = 0.

**Sources.**

- **SHARIFI**, Proposition 3.2.11, p. 80; Proposition 3.2.14 and Corollary 3.2.15, p. 82; Proposition 3.2.19, p. 83. Proves that X_∞ is finitely generated and torsion, that A_∞^∨ is pseudo-isomorphic to X_∞^ι and has no nonzero finite submodule, and the analogues for X'_∞ and A'_∞.
- **KOLSTER-2009**, Lecture 1, §1, p. 7. Records that X_∞ and X'_∞ are finitely generated Λ-torsion and that X_S is finitely generated.

### Weak Leopoldt for the cyclotomic tower

**Theorem target:** `IntegralIwasawaTheory:I.2/weak-leopoldt`.

**Planet:** Weak Leopoldt theorem.

**Review — unverifiable.** Used X′_{S_p} in the defect bound and removed the false assertion that including real places gives cd_2 ≤ 2. The H² equivalence has no verified proof in the stated dyadic scope.

Let K_∞/K be the cyclotomic Z_p-extension of a number field K and S ⊇ S_p ∪ S_∞ finite. (a) The Leopoldt defects δ(K_n, p) are bounded in n; if μ_{2p} ⊆ K then δ(K_n, p) ≤ λ(X'_{S_p}(K_∞)) for every n. (b) rank_{Λ_K} 𝔛_S(K_∞) = r_2(K); in particular 𝔛_S(K_∞) is Λ_K-torsion iff K is totally real. (c) 𝔛_S(K_∞) has no nonzero finite Λ_K-submodule. (d) Equivalently to (b), H²(G_S(K_∞), Q_p/Z_p) = 0, where G_S(K_∞) is the Galois group of the maximal extension of K_∞ unramified outside S; in particular this holds for K_∞ = F(μ_{p^∞}) when μ_{2p} ⊆ F. Leopoldt's conjecture for K itself is not assumed.

**Hypotheses and conventions.**

- K a number field, p a prime, K_∞/K cyclotomic, S ⊇ S_p ∪ S_∞ finite.

**Proof plan.**

1. Sharifi Theorem 3.3.4, p. 85, bounds defects using the class module with primes above p split, X′_{S_p}; it does not justify replacing this module by an arbitrary further S-quotient.
2. (b): rank_{Z_p} 𝔛_S(K_n) = p^n r_2(K) + 1 + δ_n and (𝔛_S)_{Γ_n} has rank p^n r_2 + δ_n; bounded δ_n gives rank_Λ = r_2 (Sharifi Theorem 3.3.3).
3. (c): Iwasawa's theorem for the cyclotomic Z_p-extension (cited by Kolster p. 7).
4. The H² formulation is an outstanding comparison (G-I2-H2), not a consequence of boundedness alone. For p = 2 with real places, ordinary G_S contains order-two decomposition groups and has infinite 2-cohomological dimension even when S includes infinity. A proof must specify ordinary or modified cohomology and its transition maps; none is supplied here.

**Prerequisites.**

- `IntegralIwasawaTheory:I.2/leopoldt-map-and-defect`
- `IntegralIwasawaTheory:I.2/global-local-unit-sequence`
- `IntegralIwasawaTheory:I.2/iwasawa-finiteness`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`
- `ArithmeticGaloisDuality:D7/compact-support-euler-characteristic`
- `mathlib:NumberField.InfinitePlace.nrComplexPlaces`

**Acceptance.**

- K totally real: 𝔛_S(K_∞) is Λ_K-torsion.
- K imaginary quadratic: rank_Λ 𝔛_S(K_∞) = 1.

**Sources.**

- **SHARIFI**, Conjecture 3.3.2, Theorems 3.3.3 and 3.3.4, pp. 84–85. States weak Leopoldt as boundedness of defects in a Z_p-extension, proves that it gives rank_Λ 𝔛_∞ = r_2(F), and proves it for the cyclotomic Z_p-extension with the bound δ_n ≤ λ(X'_∞) when μ_{2p} ⊆ F.
- **KOLSTER-2009**, Lecture 1, §1, p. 7. Cites Iwasawa for: for the cyclotomic Z_p-extension, X_S has no nontrivial finite Λ-submodule and Λ-rank r_2, so it is torsion iff F is totally real.

### Minus class modules of CM towers and their duals

**Construction target:** `IntegralIwasawaTheory:I.2/cm-minus-class-modules`.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against SHARIFI §3.4, Proposition 3.4.1 p. 89, Proposition 3.4.2 p. 90; KURIHARA §3, pp. 15–17. No local correction needed; imported proof inputs retain their stated supplier conditions.

Let K be a CM field, K^+ its maximal real subfield, j complex conjugation, and K_∞/K cyclotomic (a CM field with real subfield K^+_∞). For p odd, A_n^- is the −1-eigenspace of j on A_n = Cl(K_n) ⊗ Z_p, and A_∞^- = colim A_n^-, X_∞^- = lim A_n^-. For p = 2 eigenspaces are not available and the norm-kernel convention is used: A_n^- := ker(N_{K_n/K_n^+} : A(K_n) → A(K_n^+)), A_∞^- := colim_n A_n^-, with Pontryagin dual (A_∞^-)^∨ a compact Λ-module; the quotient convention M/(1 + j)M is a different functor and is compared with the norm kernel only up to explicit finite kernels and cokernels killed by 2. For p odd, the maps A_n^- → A_∞^- are injective and X_∞^- has no nonzero finite Λ-submodule; for p = 2, (A_∞^-)^∨ has no nonzero finite Λ-submodule (Federer).

**Hypotheses and conventions.**

- K a CM field, p a prime, K_∞/K cyclotomic; for p = 2 the norm-kernel convention is fixed.

**Proof plan.**

1. For p odd, multiplication by (1 − j)/2 is an idempotent projector on Z_p-modules, and the eigenspace decomposition commutes with norms and extension maps.
2. Injectivity of j_n^- and absence of finite submodules for p odd (Sharifi Propositions 3.4.1, 3.4.2).
3. For p = 2, Federer's theorem on (A_∞^-)^∨ is imported as stated by Kolster 1989 (via SpecialValuesBirchTate) and recorded as a source gap for its original proof (gap G-I2-FEDERER).

**Prerequisites.**

- `IntegralIwasawaTheory:I.2/class-group-limit`
- `IntegralIwasawaTheory:I.2/iwasawa-finiteness`
- `mathlib:NumberField.IsCMField`
- `mathlib:NumberField.IsCMField.complexConj`
- `mathlib:NumberField.maximalRealSubfield`

**API.**

- `IntegralIwasawaTheory.minusClassModule` (constructor): A_n^- (eigenspace for p odd; norm kernel for p = 2) and A_∞^- = colim A_n^-.
- `IntegralIwasawaTheory.minusClassModule_dual` (constructor): (A_∞^-)^∨ = Hom(A_∞^-, Q_p/Z_p), a compact Λ-module with the contragredient action.
- `IntegralIwasawaTheory.minusClassModule_eq_eigen` (compatibility): For p odd, the norm kernel equals the −1-eigenspace of j.
- `IntegralIwasawaTheory.minusClassModule_quotient_comparison` (relation): For p = 2, the natural map from the norm kernel to M/(1 + j)M has kernel and cokernel killed by 2, made explicit.
- `IntegralIwasawaTheory.minusClassModule_injective` (characterisation): For p odd, A_n^- → A_∞^- is injective.

**Checks.**

- `minus_rat_cyclotomic` (computation): For K = Q(μ_37) and p = 37, A_0^- ≅ Z/37 and A_0^+ = 0 (the class group of Q(μ_37)^+ is trivial).
- `minus_degenerate` (degenerate): If p ∤ h_K and K has a unique prime above p, totally ramified in K_∞/K, then A_n = 0 for all n (Iwasawa), so A_n^- = 0 and A_∞^- = 0.
- `minus_two_not_quotient` (non-example): For p = 2 and M = Z/4 with j acting trivially, the −1-eigenspace {m : jm = −m} = 2M and the quotient M/(1 + j)M = M/2M both have order 2, but the natural map from the first to the second is zero; at p = 2 eigenspace, norm-kernel and quotient conventions are compared, never identified.
- `minus_dual_compatible` (compatibility): For p odd, (A_∞^-)^∨ is pseudo-isomorphic to (X_∞^-)^ι, compatible with Sharifi Corollary 3.2.15 on minus parts.

**Uses.**

- SpecialValuesBirchTate:B.5/federer-main-conjecture: the minus class module A_∞^- at p = 2 with the norm-kernel convention
- IntegralIwasawaTheory:I.6/smoothed-class-groups: finite-level minus parts of T-smoothed class groups
- IntegralIwasawaTheory:I.10/kurihara-kolster-dictionary: the comparison of the norm-kernel minus module with the S-ramified module of the real field

**Acceptance.**

- For K = Q(μ_p), p odd, X_∞^- is the minus part of the classical module of RJW and Sharifi §3.4.

**Sources.**

- **SHARIFI**, §3.4, Proposition 3.4.1 p. 89, Proposition 3.4.2 p. 90. For a CM field and odd p, shows that A_n^- → A_∞^- is injective and that X_∞^- has no nonzero finite Λ-submodule.
- **KURIHARA**, §3, pp. 15–17. Works with (A_{K∞}^-)^∨ and its Fitting ideal over Z_p[[Gal(K_∞/k)]]^- for a CM field, distinguishing ω and non-ω components.

### Galois cohomology of the real unit limit at p = 2

**Theorem target:** `IntegralIwasawaTheory:I.2/real-unit-galois-cohomology`.

**Review — unverifiable.** Corrected the finite 2-group rank: 2^s is #B[2] = #B/2B, not #B. The corrected unit-cohomology formula still relies on unread Iwasawa 1983.

Let F be totally real, p = 2, F_n^+ the layers of the cyclotomic Z_2-extension F_∞^+ = F_∞ of F (Kolster's tower), U^+_∞ = lim→ U(F_n^+) the direct limit of the unit groups and ℰ = U^+_∞/μ_2 its free part, Γ = Gal(F_∞/F). Then H¹(Γ, ℰ) ≅ B ⊕ (Q_2/Z_2)^r with B finite and H²(Γ, ℰ) ≅ (Q_2/Z_2)^{r−1} for some r with 1 ≤ r ≤ d, d the number of dyadic places of F_∞; consequently #H¹(Γ, μ_2 ⊗ ℰ) = 2^{s+r−1} with 2^s = #(B/2B) = #B[2], and μ_2 ⊗ ℰ_F has order 2^{[F:Q]−1}, ℰ_F being the free part of the unit group of F. These are the inputs of Kolster's Theorem 1 relating K_2(O_F)(2) to the minus class module.

**Hypotheses and conventions.**

- F totally real, p = 2.

**Proof plan.**

1. Iwasawa's Proposition 2 (Amer. J. Math. 105 (1983)), cited in Kolster 1989; the original is not read here (gap G-I2-IWASAWA83).
2. The order of μ_2 ⊗ ℰ^Γ from Dirichlet's unit theorem for F (Mathlib NumberField.Units.rank).
3. Apply the long exact sequence of 0 → ℰ → ℰ → ℰ/2ℰ → 0. It uses the 2-rank of the finite group B, rather than its order; for B = Z/4 the contribution has order 2.

**Prerequisites.**

- `IntegralIwasawaTheory:I.2/unit-limits`
- `IntegralIwasawaTheory:I.1/cyclotomic-layers`
- `mathlib:NumberField.Units.rank`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`

**Checks.**

- `unitCohomology_two_rank` (non-example): For B = Z/4, #(B/2B) = #B[2] = 2 although #B = 4; the exponent s is 1.

**Acceptance.**

- Kolster 1989, proof of Theorem 1, p. 250.

**Sources.**

- **KOLSTER-1989**, Proof of Theorem 1, pp. 249–250. Quotes Iwasawa's description of H^i(Γ, ℰ) for the free part of the direct limit of real units and derives the order of H¹(Γ, μ_2 ⊗ ℰ) and the factor 2^{[F:Q]−1}.

## IntegralIwasawaTheory:I.3

### Equivariant L-values and Stickelberger elements

**Definition target:** `IntegralIwasawaTheory:I.3/stickelberger-elements`.

**Planet:** Stickelberger element.

**Review — corrected.** Added a working characterisation, extensionality or universal-property API after checking the stated construction.

Let k be a totally real field, H/k a finite abelian extension with G = Gal(H/k), and Σ, Σ' disjoint finite sets of places of k with Σ ⊇ S_∞. For a character χ : G → C^× let L(χ, s) = ∏_v (1 − χ(v)Nv^{−s})^{−1} be its primitive Hecke L-function (χ(v) = 0 when χ is ramified at v; meromorphic continuation from AnalyticNumberTheory AN.4), and L_{Σ,Σ'}(χ, s) = L(χ, s) ∏_{v ∈ Σ∖S_∞} (1 − χ(v)Nv^{−s}) ∏_{v ∈ Σ'} (1 − χ(v)Nv^{1−s}). The Stickelberger element Θ^{H/k}_{Σ,Σ'}(s) ∈ C[G] is the unique element with χ(Θ^{H/k}_{Σ,Σ'}(s)) = L_{Σ,Σ'}(χ^{-1}, s) for every χ ∈ Ĝ, that is Θ(s) = Σ_χ L_{Σ,Σ'}(χ^{-1}, s) e_χ with e_χ = (#G)^{-1} Σ_σ χ(σ)σ^{-1}. For an integer j ≥ 1, Θ_{Σ,Σ'}(1 − j) lies in Q[G] (Siegel–Klingen). Write Θ_Σ = Θ_{Σ,∅}, and θ_S := Θ_{S}(0) when S ⊇ S_∞ ∪ S_ram(H/k). Frobenius elements are arithmetic: Frob_v acts on residue fields by x ↦ x^{Nv}. This general analytic definition is the one that IntegralIwasawaTheory I.6 specialises to CM extensions at s = 0.

**Hypotheses and conventions.**

- k totally real; H/k finite abelian (H need not be CM); Σ ⊇ S_∞ and Σ' finite, disjoint.
- s ∈ C away from the poles of the L-functions; values at s = 1 − j, j ≥ 1, are finite.

**Proof plan.**

1. Define Θ(s) through the idempotents e_χ ∈ C[G] (Tau Ceti CharacterTheory Layer 3); uniqueness because the χ separate C[G].
2. The continued L-functions and their Euler factors are imported from AnalyticNumberTheory AN.4.
3. Rationality at s = 1 − j: Gal(Q̄/Q)-equivariance of the values L(χ, 1 − j) (Siegel–Klingen, AutomorphicPadicLFunctions L3/siegel-klingen-rationality) makes Θ(1 − j) fixed by the action on coefficients.

**Prerequisites.**

- `AnalyticNumberTheory:AN.4`
- `AutomorphicPadicLFunctions:L3/siegel-klingen-rationality`
- `AutomorphicPadicLFunctions:L3/partial-zeta-distributions`
- `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`
- `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol`
- `mathlib:MonoidAlgebra`
- `mathlib:Polynomial.bernoulli`

**API.**

- `IntegralIwasawaTheory.stickelberger` (constructor): Θ^{H/k}_{Σ,Σ'}(s) ∈ C[G] for s away from poles.
- `IntegralIwasawaTheory.stickelberger_character` (characterisation): χ(Θ_{Σ,Σ'}(s)) = L_{Σ,Σ'}(χ^{-1}, s) for every character χ of G.
- `IntegralIwasawaTheory.stickelberger_rational` (characterisation): Θ_{Σ,Σ'}(1 − j) ∈ Q[G] for every integer j ≥ 1.
- `IntegralIwasawaTheory.stickelbergerRat` (constructor): For k = Q and H = Q(μ_m), m ≥ 2: the element Σ_a −m^{j−1}B_j(a/m)/j · σ_a^{-1} of Q[(Z/m)^×], equal to Θ_S(1 − j) for S = S_∞ ∪ {ℓ | m}.
- `IntegralIwasawaTheory.stickelberger_partialZeta` (relation): Θ_Σ(s) = Σ_{σ ∈ G} ζ_Σ(σ, s) σ^{-1} with ζ_Σ(σ, s) = Σ_{𝔞 prime to Σ, Frob 𝔞 = σ} N𝔞^{−s} when Σ ⊇ S_ram.
- `IntegralIwasawaTheory.stickelberger_rat_cyclotomic` (example): For k = Q, H = Q(μ_m): Θ_{S}(1 − j) = −m^{j−1} Σ_a (B_j(a/m)/j) σ_a^{-1}, with B_j the Bernoulli polynomial (Mathlib Polynomial.bernoulli).
- `IntegralIwasawaTheory.stickelberger_trivial_extension` (compatibility): For H = k, Θ_Σ(s) is the Σ-truncated Dedekind zeta function ζ_{k,Σ}(s).
- `IntegralIwasawaTheory.stickelberger_ext` (extensionality): Two complex group-ring elements agree iff all character evaluations agree.

**Checks.**

- `stickelberger_Q_mu3` (computation): For k = Q, H = Q(μ_3), Σ = {∞, 3}: Θ_Σ(0) = (1 − c)/6 with c complex conjugation; the odd character gives 1/3 = L(χ_{−3}, 0).
- `stickelberger_Q_trivial` (degenerate): For H = k = Q and Σ = {∞}: Θ(0) = ζ(0) = −1/2, agreeing with Mathlib riemannZeta_neg_nat_eq_bernoulli at 0.
- `stickelberger_vs_classical` (compatibility): For k = Q and H = Q(μ_m), Θ_{S}(0) = ½N_G − θ_{Q(μ_m)} where θ_{Q(μ_m)} = m^{-1}Σ a σ_a^{-1} is Stickelberger's element.
- `stickelberger_not_inverse_convention` (non-example): Defining Θ by χ(Θ) = L(χ, s) instead of L(χ^{-1}, s) gives the image under the involution #; for H = Q(μ_5) the two differ on the odd quartic characters, so the convention is part of the definition.

**Uses.**

- IntegralIwasawaTheory:I.6/smoothed-stickelberger: the CM case at s = 0 with T-smoothing and minus parts
- IntegralIwasawaTheory:I.8/stickelberger-deligne-ribet-square: θ_{K∞/k,S} is the inverse limit of these elements
- IntegralIwasawaTheory:I.3/deligne-ribet-dictionary: the interpolation property is stated through Stickelberger values at 1 − j
- NoncommutativeAndEquivariantIwasawa:NE.6/partial-zeta-values: partial zeta values are the coefficients of Θ(1 − j)
- Dasgupta–Kakde, Theorems 1.2–1.4: every main theorem is phrased through Θ_{S,T} and Θ_{Σ,Σ'}

**Acceptance.**

- For k = Q, H = Q(μ_m) and Σ = S_∞ ∪ {ℓ | m}: Θ_Σ(0) = Σ_{a ∈ (Z/m)^×} (1/2 − a/m) σ_a^{-1} with 0 < a < m, which equals ½N_G − θ_{Q(μ_m)} for Stickelberger's θ = m^{-1} Σ a σ_a^{-1}.

**Sources.**

- **DK-2023**, §1, pp. 3–4. Defines L(χ, s) with χ(𝔭) = 0 at ramified primes, the Σ-depleted Σ'-smoothed L-function and the Stickelberger element Θ_{Σ,Σ'}(s) by χ(Θ(s)) = L_{Σ,Σ'}(χ^{-1}, s), and records Siegel–Klingen–Shintani rationality of Θ_{Σ,Σ'}(0).
- **KURIHARA**, §2.3, pp. 6–7. Defines θ_{M/k,S}(s) = Σ_ψ L_S(s, ψ^{-1}) ε_ψ with ε_ψ = (#G)^{-1}Σ ψ(σ)σ^{-1}, its rationality and the Sinnott–Kurihara module Θ(K/k).
- **SHARIFI**, Definition 4.5.1, p. 113. Defines Stickelberger's element θ_F = m^{-1} Σ a σ_a^{-1} of Q(μ_m), the normalisation compared in the acceptance item.

### Restriction, depletion and smoothing of Stickelberger elements

**Theorem target:** `IntegralIwasawaTheory:I.3/stickelberger-functoriality`.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against DK-2023 §1, pp. 4–7, equations (5) and (7); §1.1 observation (c), p. 6; KURIHARA §2.3, pp. 6–7; §3.1, p. 16. No local correction needed; imported proof inputs retain their stated supplier conditions.

With notation of stickelberger-elements: (a) for H ⊆ H' finite abelian over k and Σ ⊇ S_∞ ∪ S_ram(H'/k), restriction π : C[Gal(H'/k)] → C[Gal(H/k)] sends Θ^{H'}_{Σ,Σ'}(s) to Θ^{H}_{Σ,Σ'}(s); (b) for v ∉ Σ ∪ Σ' unramified in H, Θ_{Σ ∪ {v},Σ'}(s) = (1 − Frob_v^{-1} Nv^{−s}) Θ_{Σ,Σ'}(s) and Θ_{Σ,Σ' ∪ {v}}(s) = (1 − Frob_v^{-1} Nv^{1−s}) Θ_{Σ,Σ'}(s); (c) for v ramified in H with inertia I_v and decomposition group G_v, adding v to Σ multiplies Θ_{Σ,Σ'}(s) by (1 − σ_v^{-1} e_v Nv^{−s}), e_v = (#I_v)^{-1} N I_v, σ_v ∈ G_v a Frobenius coset representative (independent of the choice); at s = 0 on Θ^# this is the factor (1 − σ_v e_v); (d) if H is CM with complex conjugation c, then cΘ_{Σ,Σ'}(0) = −Θ_{Σ,Σ'}(0) whenever #Σ ≥ 2 (that is, [k : Q] ≥ 2 or Σ contains a finite place); smoothing does not help: for k = Q, Σ = {∞} the trivial character contributes ζ(0)∏_{v∈Σ'}(1 − Nv) ≠ 0; (e) for S ⊇ S_∞ ∪ S_p ∪ S_ram(H_∞/k), the elements θ^{H_n/k}_S along the cyclotomic tower H_∞ = ⋃ H_n are compatible under restriction and define θ_{H∞/k,S} := lim_n θ^{H_n/k}_S ∈ Q(Λ_{H∞}) once the Deligne–Ribet integrality of smoothed-integrality is applied.

**Hypotheses and conventions.**

- As in stickelberger-elements; in (e), S contains all places above p and all places ramified in H_∞/k.

**Proof plan.**

1. (a): Artin formalism: a character of Gal(H/k) inflated to Gal(H'/k) has the same primitive L-function, and Σ contains every prime ramified in H' (AnalyticNumberTheory AN.4).
2. (b): compare Euler factors character by character; χ(Frob_v^{-1}) = χ^{-1}(Frob_v).
3. (c): χ(e_v) = 1 if χ is unramified at v and 0 otherwise, so χ(1 − σ_v^{-1} e_v Nv^{−s}) is the Euler factor 1 − χ^{-1}(v)Nv^{−s} of L(χ^{-1}, s) at v, or 1 when χ is ramified at v (DK (7) for Θ^#).
4. (d): L(χ, 0) = 0 for every totally even χ ≠ 1 (order of vanishing [k : Q] at 0), and ζ_{k,Σ}(0) = 0 exactly when #Σ ≥ 2; the smoothing factors 1 − Nv do not vanish, so Θ lies in the (1 − c)-part exactly under #Σ ≥ 2.
5. (e): apply (a) at each layer; the limit lies in Q(Λ_{H∞}) because a smoothed limit is integral (smoothed-integrality) and the smoothing factors are non-zerodivisors.

**Prerequisites.**

- `IntegralIwasawaTheory:I.3/stickelberger-elements`
- `AnalyticNumberTheory:AN.4`
- `IntegralIwasawaTheory:I.1/equivariant-iwasawa-algebra`
- `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol`

**Acceptance.**

- DK (7): Θ^#_{S,T} = Θ^#_{S∞,T} ∏_{v ∈ S_ram} (1 − σ_v e_v).
- Kurihara §3.1, p. 16: θ_{K∞/k,S} ∈ Z_p[[Gal(K_∞/k)]] after T-smoothing.

**Sources.**

- **DK-2023**, §1, pp. 4–7, equations (5) and (7); §1.1 observation (c), p. 6. Gives the ramified Euler-factor identity (7), the effect of the smoothing set on Θ_{S,T}, and that complex conjugation acts as −1 on Θ_{S,T}.
- **KURIHARA**, §2.3, pp. 6–7; §3.1, p. 16. Uses the restriction-compatible Stickelberger elements of the layers K_n and their limit θ_{K∞/k,S} in Q(Λ_{K∞}).

### Deligne–Ribet–Cassou-Noguès integrality

**Theorem target:** `IntegralIwasawaTheory:I.3/smoothed-integrality`.

**Planet:** Deligne–Ribet integrality.

**Review — corrected.** Restored all DKSW conditions and allowed infinity to be partitioned between depletion and smoothing.

Let H/k be finite abelian with k totally real, S ⊇ S_∞ ∪ S_ram(H/k), and T a finite set of finite places disjoint from S such that no nontrivial root of unity of H is ≡ 1 modulo every prime of H above T (condition (1) of Dasgupta–Kakde; it holds if T contains two primes of different residue characteristics or one prime of residue characteristic > [k : Q] + 1). Then (a) Θ_{S,T}(0) = ∏_{v ∈ T}(1 − Frob_v^{-1}Nv) θ_S lies in Z[G]; (b) Ann_{Z[G]}(μ(H)) θ_S ⊆ Z[G] (Kurihara (4)); (c) for H CM and any prime p, with disjoint Σ, Σ′ satisfying (A1)–(A5) of keystone-fitting-theorem, including Σ ≠ ∅, torsion-free O^×_{H,S∞,Σ′}, all p-ramified primes in Σ and all other ramified primes in Σ′, and t = #(S_∞ ∩ Σ′), the element of Z_p[G]^- characterised by χ(x) = L_{Σ,Σ'}(χ^{-1}, 0)/2^t for odd χ exists (DKSW, using Deligne–Ribet Corollary 8.9); (d) p-adically, θ_{H∞/k,S} is a pseudo-measure: I(Gal(H_∞/k))·θ_{H∞/k,S} ⊆ Λ_{H∞}.

**Hypotheses and conventions.**

- k totally real, H/k finite abelian, S, T as stated; for (c), H CM and p arbitrary (p = 2 included). In (c), all conditions (A1)–(A5), not merely coverage of ramification, are required; archimedean smoothing is interpreted by its character L-values.

**Proof plan.**

1. (a)–(b) are the integrality theorem of Deligne–Ribet and Cassou-Noguès, imported from AutomorphicPadicLFunctions L3/deligne-ribet-measure ((0.4), (8.4)) applied to the measures on ray class groups; the smoothing factor clears exactly the denominators coming from μ(H).
2. (c): the 2-adic refinement (8.11) of Deligne–Ribet gives integrality of odd measures up to 2^{[k:Q]−1}; Kurihara's argument in DK Lemma 3.4 passes to depleted and smoothed elements (DKSW-BSZ §1.2, after Theorem 1.2).
3. (d): the Deligne–Ribet pseudo-measure (AutomorphicPadicLFunctions L3/deligne-ribet-pseudomeasure) and stickelberger-functoriality (e).

**Prerequisites.**

- `IntegralIwasawaTheory:I.3/stickelberger-elements`
- `IntegralIwasawaTheory:I.3/stickelberger-functoriality`
- `AutomorphicPadicLFunctions:L3/deligne-ribet-measure`
- `AutomorphicPadicLFunctions:L3/deligne-ribet-pseudomeasure`
- `IntegralIwasawaTheory:I.1/equivariant-iwasawa-algebra`

**Acceptance.**

- k = Q, H = Q(μ_3), S = {∞, 3}, T = {7}: Θ_{S,T}(0) = (1 − 7)(1 − c)/6 = −(1 − c) ∈ Z[G].
- T = {2} for H = Q(μ_3) violates condition (1) (−1 ≡ 1 mod 2), and Θ_{S,{2}}(0) = (1 − 2c)(1 − c)/6 = (1 − c)/2 ∉ Z[G].

**Sources.**

- **DK-2023**, §1, equations (1)–(2), p. 4. States condition (1) on T with its sufficient criterion and the theorem of Deligne–Ribet and Cassou-Noguès that Θ_{S,T} ∈ Z[G].
- **KURIHARA**, §2.3, equation (4), p. 7. States Ann(μ(M))θ_{M/k,S} ⊆ Z[Gal(M/k)] for S ⊇ S_ram(M/k), after Deligne–Ribet and Cassou-Noguès.
- **DKSW-BSZ**, §1.2, Theorem 1.2 and the paragraph after it, p. 5. Defines Θ_{Σ,Σ'}/2^t in Z_p[G]^- through odd characters, citing Deligne–Ribet Corollary 8.9 and Kurihara's argument for its existence.
- **KURIHARA**, §4.1, p. 23. Places g_{K∞/k,S} among Serre's pseudo-measures: elements x of Q(Λ_{K∞}) with x·I ⊆ Λ_{K∞}.

### The Deligne–Ribet pseudomeasure in Iwasawa normalisation

**Comparison target:** `IntegralIwasawaTheory:I.3/deligne-ribet-dictionary`.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against KURIHARA §4.1, pp. 22–24; KOLSTER-2009 Lecture 1, §1, p. 8; KAKDE-2013 §3, p. 14. No local correction needed; imported proof inputs retain their stated supplier conditions.

Let k be totally real, F/k finite abelian totally real, K_∞ = F_∞(μ_{2p}) = F(μ_{p^∞}), S ⊇ S_∞ ∪ S_p ∪ S_ram(F/k), and κ : Gal(K_∞/k) → Z_p^× the cyclotomic character. Transport the Deligne–Ribet pseudo-measure of AutomorphicPadicLFunctions L3 along the Artin map Cl^+_k(𝔣p^∞) → Gal(K_∞/k) (arithmetic Frobenius convention) to g_{K∞/k,S} ∈ Q(Λ_{K∞}). Then: (i) κ^n ψ(g_{K∞/k,S}) = L_S(1 − n, ψ) for every n ≥ 1 and every finite-order character ψ of Gal(K_∞/k); (ii) g_{K∞/k,S} is a pseudo-measure, and lies in Λ_{K∞} unless the trivial-character pole intervenes; (iii) it is unique with property (i); (iv) for v ∉ S, v ∤ p, g_{K∞/k,S∪{v}} = (1 − Nv^{-1}Frob_v) g_{K∞/k,S}; (v) restriction to Gal(F'_∞(μ_{2p})/k) for k ⊆ F' ⊆ F sends g_{K∞/k,S} to g_{K'∞/k,S}, and g_{F∞/k,S} is the image of g_{K∞/k,S} in Q(Λ_{F∞}), the even part; (vi) in the coordinate of iwasawa-algebra-coordinate, for an even character ψ of Gal(F/k) of type S (F_ψ ∩ k_∞ = k), the ψ-component of g_{F∞/k,S} is G_{ψ,S}(T)/H_ψ(T) with G_{ψ,S}(u^n − 1) = L_S(1 − n, ψω^{−n})·H_ψ(u^n − 1) and H_ψ(T) = ψ(γ)(1 + T) − 1 for ψ of type W, 1 otherwise; (vii) no abelian-over-Q hypothesis is imposed on k.

**Hypotheses and conventions.**

- k totally real, F/k finite abelian totally real, p any prime (p = 2 included), S as stated.

**Proof plan.**

1. Transport AutomorphicPadicLFunctions L3/deligne-ribet-pseudomeasure along the reciprocity isomorphism of Tau Ceti ClassFieldTheory Layer 11, with arithmetic Frobenius.
2. (i): the moment formula ∫ε N^k dλ = L(1 − k, ε) with κ(Frob_v) = Nv for v ∤ p.
3. (iii): pseudo-measures are separated by their values κ^nψ (PadicMeasuresIwasawaAlgebras L3 separation; interpolation-uniqueness).
4. (iv): compare the Euler factor (1 − ψ(v)Nv^{n−1}) with κ^nψ(1 − Nv^{-1}Frob_v).
5. (vi): write κ = ω⟨κ⟩ on Gal(K_∞/k) ≅ Δ × Γ and evaluate in the T-coordinate (Kolster Lecture 1, p. 8).

**Prerequisites.**

- `AutomorphicPadicLFunctions:L3/deligne-ribet-pseudomeasure`
- `AutomorphicPadicLFunctions:L3/deligne-ribet-measure`
- `IntegralIwasawaTheory:I.3/smoothed-integrality`
- `IntegralIwasawaTheory:I.1/equivariant-iwasawa-algebra`
- `IntegralIwasawaTheory:I.1/iwasawa-algebra-coordinate`
- `IntegralIwasawaTheory:I.1/full-cyclotomic-tower`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`
- `PadicMeasuresIwasawaAlgebras:L3/pseudomeasures`

**Acceptance.**

- Kurihara §4.1, p. 23: κ^nψ(g_{K∞/k,S}) = L_S(1 − n, ψ) for all n ≥ 1.
- Kolster p. 8: L^S_p(1 − s, ψ) = G_{ψ,S}(κ(γ)^s − 1)/H_ψ(κ(γ)^s − 1).

**Sources.**

- **KURIHARA**, §4.1, pp. 22–24. Defines g_{K∞/k,S} as the pseudo-measure with κ^nψ(g) = L_S(1 − n, ψ), its image g_{F∞/k,S}, and the relation τ(θ^#_{K∞/k,S}) = g_{K∞/k,S} of equation (11).
- **KOLSTER-2009**, Lecture 1, §1, p. 8. States the Deligne–Ribet interpolation L_p(1 − n, ψ) = L(1 − n, ψω^{−n})∏_{𝔭|p}(1 − ψω^{−n}(𝔭)N𝔭^{n−1}), the S-imprimitive version, and the power series G_{ψ,S}/H_ψ with H_ψ = ψ(γ)(1 + T) − 1 for type W.
- **KAKDE-2013**, §3, p. 14. Recalls Deligne–Ribet, Cassou-Noguès and Barsky: G_ψ(u^n − 1) = L_Σ(ψ, 1 − n) for nontrivial ψ and the pole for the trivial character, and Serre's pseudo-measure ζ ∈ Q(Λ(G)).

### Kubota–Leopoldt, Bernoulli distributions and Stickelberger elements over Q

**Comparison target:** `IntegralIwasawaTheory:I.3/kubota-leopoldt-stickelberger-dictionary`.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against SHARIFI §5.3, Proposition 5.3.3 to Theorem 5.3.13, pp. 138–142; Corollaries 5.3.15–5.3.16, p. 142; SHARIFI-AWS §2.5, p. 23. No local correction needed; imported proof inputs retain their stated supplier conditions.

For k = Q, m ≥ 1 prime to p, F_n = Q(μ_{mp^n}) and G_∞ = Gal(F_∞/Q) ≅ Z_{p,m}^× = (Z/m)^× × Z_p^× (a ↦ σ_a): (i) the limit Θ^{(1)}_∞ = (Θ^{(1)}_n)_n of the Bernoulli–Stickelberger elements Θ^{(1)}_n = Σ_{a mod mp^n, (a,mp)=1} E^{(1)}_n(a) σ_a^{-1} (E^{(1)}_n(a) = a/(mp^n) − 1/2) lies in Q_p[Δ][[T]], and (1 − c σ_c^{-1})Θ^{(1)}_∞ is integral for c ∈ Z_{p,m}^× (Sharifi Remark 5.3.7); (ii) for a primitive even Dirichlet character χ of conductor m or mq (of the first kind) the Iwasawa power series f_χ = −ω̃χ^{-1}(Θ^{(1)}_∞) satisfies f_χ(ξu^s − 1) = L_p(χρ, s) for χ ≠ 1, and f_1 = (1 − u(1 + T)^{-1})·F_1 with F_1 the Kubota–Leopoldt zeta function (pole at the trivial character), with ½f_χ ∈ Λ_χ; (iii) this agrees with the Kubota–Leopoldt pseudo-measure of DirichletPadicLFunctions L1–L2, with the Euler factor at p, L_p(χ, 1 − n) = −(1 − χω^{−n}(p)p^{n−1})B_{n,χω^{−n}}/n, and with g_{F∞/Q,S} of deligne-ribet-dictionary after the identification σ_a ↔ a; (iv) no second p-adic zeta carrier is constructed.

**Hypotheses and conventions.**

- k = Q, p any prime, m prime to p, q = p or 4.

**Proof plan.**

1. (i)–(ii): Sharifi Definition 5.3.5, Remark 5.3.10, Lemma 5.3.11, Proposition 5.3.12 and Theorem 5.3.13.
2. (iii): DirichletPadicLFunctions L1/arithmetic-pseudomeasure and L2 give the measure and its interpolation; AutomorphicPadicLFunctions L3/deligne-ribet-rational-comparison identifies it with Deligne–Ribet for k = Q.

**Prerequisites.**

- `IntegralIwasawaTheory:I.3/stickelberger-elements`
- `IntegralIwasawaTheory:I.3/deligne-ribet-dictionary`
- `DirichletPadicLFunctions:L1/arithmetic-pseudomeasure`
- `DirichletPadicLFunctions:L2`
- `AutomorphicPadicLFunctions:L3/deligne-ribet-rational-comparison`
- `IntegralIwasawaTheory:I.1/full-cyclotomic-tower`
- `mathlib:Polynomial.bernoulli`

**Acceptance.**

- For p odd and even k ≢ 0 mod p − 1: L_p(1 − j, ω^k) = −(1 − p^{j−1})B_j/j when j ≡ k mod p − 1 (Sharifi Corollary 5.3.16).

**Sources.**

- **SHARIFI**, §5.3, Proposition 5.3.3 to Theorem 5.3.13, pp. 138–142; Corollaries 5.3.15–5.3.16, p. 142. Constructs the higher Stickelberger elements Θ^{(k)}_n, identifies the Iwasawa power series f_χ with the Kubota–Leopoldt function including the pole factor for χ = 1, and proves ½f_χ integral.
- **SHARIFI-AWS**, §2.5, p. 23. Normalises f_k = −Θ^{(k)}_∞ with f_k(υ^s − 1) = L_p(ω^k, s) for the main conjecture over Q.

### Uniqueness and poles of interpolating pseudo-measures

**Theorem target:** `IntegralIwasawaTheory:I.3/interpolation-uniqueness`.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against KURIHARA §4.1, p. 23; SHARIFI Proposition 5.3.3 and Remark 5.3.4, pp. 138–139. No local correction needed; imported proof inputs retain their stated supplier conditions.

Let G be an abelian profinite group with an open subgroup isomorphic to Z_p and κ : G → Z_p^× a character with open image. (a) A pseudo-measure x ∈ Q(Z_p[[G]]) is determined by the values κ^nψ(x) for ψ ranging over finite-order characters and n over any infinite set of positive integers. (b) If x is a pseudo-measure then (g − 1)x ∈ Z_p[[G]] for every g ∈ G; x ∈ Z_p[[G]] iff its value at the trivial character is finite, i.e. iff the augmentation-pole vanishes. (c) An assignment of values to the κ^nψ does not by itself define an element: existence (Deligne–Ribet), uniqueness ((a)) and pole behaviour ((b)) are separate statements, and only their conjunction is used in I.5, I.8 and I.9.

**Hypotheses and conventions.**

- G abelian profinite, Γ ⊆ G open with Γ ≅ Z_p; κ continuous with open image.

**Proof plan.**

1. (a): reduce to measures by multiplying with a regular clearing factor 1 − c (PadicMeasuresIwasawaAlgebras L3 independence of the clearing factor) and use separation of measures by positive moments twisted by finite characters (L3 positive-moment and character separation).
2. (b): the defining property of Serre's pseudo-measures (Kurihara §4.1) and the augmentation ideal generated by the g − 1.

**Prerequisites.**

- `PadicMeasuresIwasawaAlgebras:L3/pseudomeasures`
- `PadicMeasuresIwasawaAlgebras:L3/independence-of-clearing-factor`
- `PadicMeasuresIwasawaAlgebras:L3/actual-pseudomoment-separation`
- `PadicMeasuresIwasawaAlgebras:L3/actual-unit-character-separation`
- `DirichletPadicLFunctions:L1/arithmetic-not-integral`

**Acceptance.**

- For G = Z_p^×, the Kubota–Leopoldt pseudo-measure is not a measure, while (1 − σ_c)·ζ_p is (DirichletPadicLFunctions L1/arithmetic-not-integral).

**Sources.**

- **KURIHARA**, §4.1, p. 23. Uses Serre's pseudo-measures, the submodule of Q(Λ_{K∞}) of x with x·I_{Gal(K∞/k)} ⊆ Λ_{K∞}, characterised by the interpolation property.
- **SHARIFI**, Proposition 5.3.3 and Remark 5.3.4, pp. 138–139. Proves uniqueness of the interpolating element and records the pole factor h_{1,u} = u(T + 1)^{-1} − 1 for the trivial character.

## IntegralIwasawaTheory:I.4

### Arithmetic Iwasawa complexes of Tate twists

**Construction target:** `IntegralIwasawaTheory:I.4/arithmetic-iwasawa-complex`.

**Review — corrected.** Corrected the finite-layer non-example: inflation supplies a Λ-action, but does not replace the Iwasawa limit.

Let k be totally real or arbitrary, F/k finite abelian, F_∞ the cyclotomic Z_p-extension of F, G = Gal(F_∞/k), Λ = Λ_{F∞} (equivariant-iwasawa-algebra), S ⊇ S_p ∪ S_∞ ∪ S_ram(F/k) finite, and T a finite free Z_p-module with a continuous G_{k,S}-action (in this roadmap T = Z_p(r), r ∈ Z, possibly twisted by a finite-order character). Define C^Iw_S(F_∞, T) := RΓ_Iw(O_{F∞,S}, T) = R lim_n RΓ(O_{F_n,S}, T) (corestriction transitions), the instance of SelmerIwasawaCohomology L3 for this tower, and its compactly supported variant C^Iw_{c,S}(F_∞, T) := R lim_n RΓ_c(O_{F_n,S}, T) built from ArithmeticGaloisDuality D7. For p odd (or F totally imaginary) both are perfect complexes of Λ-modules with Λ-linear Galois action; for T = Z_p(1) the compactly supported cohomology vanishes outside degrees 2 and 3. Their cohomology for T = Z_p(1) is: H^1_Iw = E_{∞,S} (Kummer), 0 → X'_S(F_∞) → H^2_Iw → ker(⊕_{w ∈ S_f(F∞)} Z_p → Z_p) → 0, and H^2_c = 𝔛_S(F_∞), H^3_c = Z_p (Poitou–Tate). At p = 2 with real places the perfect model is the Burns–Flach complex of IntegralIwasawaTheory I.8, and every statement of I.4 is applied to it.

**Hypotheses and conventions.**

- p a prime; S ⊇ S_p ∪ S_∞ ∪ S_ram(F/k) finite; T finite free over Z_p with continuous G_{k,S}-action.
- Perfectness is asserted for p odd or F totally imaginary; for p = 2 with real places the I.8 model replaces it.

**Proof plan.**

1. Instantiate SelmerIwasawaCohomology L3/iwasawa-cohomology and L3/infinite-selmer-complex with the tower F_n, using Shapiro's lemma to identify RΓ_Iw with RΓ(O_{k,S}, Λ ⊗ T^ι) (L3/iwasawa-shapiro).
2. Compact support: ArithmeticGaloisDuality D7/compact-support-cochains and derived Poitou–Tate duality D7/derived-global-duality.
3. Kummer sequence for μ_{p^m} on O_{F_n,S} and the limit over m, n (Tau Ceti ProfiniteCohomology Layer 9; Sharifi Proposition 3.3.9).

**Prerequisites.**

- `SelmerIwasawaCohomology:L3/iwasawa-cohomology`
- `SelmerIwasawaCohomology:L3/iwasawa-shapiro`
- `SelmerIwasawaCohomology:L3/infinite-selmer-complex`
- `ArithmeticGaloisDuality:D7/compact-support-cochains`
- `ArithmeticGaloisDuality:D7/derived-global-duality`
- `IntegralIwasawaTheory:I.1/equivariant-iwasawa-algebra`
- `IntegralIwasawaTheory:I.2/unit-limits`
- `IntegralIwasawaTheory:I.2/maximal-abelian-pro-p-extensions`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

**API.**

- `IntegralIwasawaTheory.iwasawaComplex` (constructor): C^Iw_S(F_∞, T) = R lim_n RΓ(O_{F_n,S}, T) in the derived category of Λ-modules.
- `IntegralIwasawaTheory.iwasawaComplexCompact` (constructor): C^Iw_{c,S}(F_∞, T) = R lim_n RΓ_c(O_{F_n,S}, T).
- `IntegralIwasawaTheory.iwasawaComplex_perfect` (structure): For p odd or F totally imaginary, both complexes are perfect complexes of Λ-modules.
- `IntegralIwasawaTheory.iwasawaComplex_H1_twist1` (characterisation): H¹ of C^Iw_S(F_∞, Z_p(1)) is E_{∞,S} = lim_n O_{F_n,S}^× ⊗ Z_p.
- `IntegralIwasawaTheory.iwasawaComplexCompact_H2` (characterisation): H²_c(F_∞, Z_p(1)) ≅ 𝔛_S(F_∞) and H³_c(F_∞, Z_p(1)) ≅ Z_p.
- `IntegralIwasawaTheory.iwasawaComplex_twist` (relation): C^Iw_S(F_∞, T(n)) ≅ Tw_n-twist of C^Iw_S(F_∞, T) when μ_{p^∞} ⊆ F_∞.
- `IntegralIwasawaTheory.iwasawaComplex_restrict` (functoriality): For k ⊆ F' ⊆ F, C(F_∞) ⊗^L_{Λ_{F∞}} Λ_{F'∞} ≅ C(F'_∞), compatible with composition.
- `IntegralIwasawaTheory.iwasawaComplex_equiv_compatible` (functoriality): Changing compatible finite-layer cochain models by compatible quasi-isomorphisms gives the same derived inverse-limit object.

**Checks.**

- `iwasawaComplex_H0_vanishes` (degenerate): H⁰ of C^Iw_S(F_∞, Z_p(1)) is 0, because Z_p(1) has no nonzero G_{F_n}-invariants for any n.
- `iwasawaComplexCompact_H3_rat` (computation): For F = Q and p odd, H³_c(Q_∞, Z_p(1)) ≅ Z_p with trivial Γ-action (T acts by 0).
- `iwasawaComplex_not_finite_level` (non-example): A finite-layer complex can be inflated along Λ → Z_p[Gal(F_n/k)], and ω_n acts by zero on it. This is not the derived inverse limit, whose specialisation requires derived descent and its Tor terms.
- `iwasawaComplexCompact_H2_compat` (compatibility): The identification H²_c ≅ 𝔛_S agrees with the global–local unit sequence of IntegralIwasawaTheory I.2 on the inertia subgroup.

**Uses.**

- IntegralIwasawaTheory:I.4/finite-layer-descent: the complexes descended to the layers F_n
- NoncommutativeAndEquivariantIwasawa:NE.4: compactly supported Iwasawa complexes with G-action
- IntegralIwasawaTheory:I.10/finite-euler-characteristic-comparison: the weight-two specialisation at p = 2

**Acceptance.**

- For F = k = Q, p odd and T = Z_p(1): H^1_Iw = lim_n (O_{Q_n}[1/p]^× ⊗ Z_p) along the layers Q_n of the cyclotomic Z_p-extension, and H^2_c = 𝔛_{{p,∞}}(Q_∞).

**Sources.**

- **KURIHARA**, §4.1, pp. 22–23. Uses the inverse limit of RΓ_c(O_{F_n,S}, Z_p(1)) along the cyclotomic tower, a perfect complex of Λ_{F∞}-modules with H² = X_{F∞,S} and H³ = Z_p, valid at p = 2 in the Burns–Flach model.
- **SHARIFI**, Proposition 3.3.9 and Corollary 3.3.14, pp. 86–89. Relates H¹(G_{F∞,S}, μ_{p^∞}) to S-units and class groups by Kummer theory and dualises it to the S-ramified Iwasawa module.

### Descent to finite layers and the Tor spectral sequence

**Theorem target:** `IntegralIwasawaTheory:I.4/finite-layer-descent`.

**Planet:** Descent to finite layers.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against SHARIFI Theorem 3.3.3, proof, p. 84; KURIHARA §4.2, pp. 24–26; KOLSTER-2009 Lecture 2, §3, pp. 13–14. No local correction needed; imported proof inputs retain their stated supplier conditions.

For C = C^Iw_S(F_∞, T) (or its compactly supported variant, or the I.8 complex) and n ≥ 0: (a) C ⊗^L_{Λ} Z_p[Gal(F_n/k)] ≅ RΓ(O_{F_n,S}, T) (resp. RΓ_c), compatibly with restriction maps; (b) there is a convergent spectral sequence E_2^{i,j} = Tor^{Λ}_{−i}(H^j(C), Z_p[Gal(F_n/k)]) ⇒ H^{i+j}(O_{F_n,S}, T); (c) for G = Γ (F = k) this degenerates into exact sequences 0 → H^j(C)_{Γ_n} → H^j(O_{k_n,S}, T) → H^{j+1}(C)^{Γ_n} → 0 with Γ_n = Γ^{p^n}; (d) the kernels and cokernels of H^j(C)_{Γ_n} → H^j_n are given by these Tor terms and are never discarded before a finite-level statement is made; (e) for T = Z_p(1) and j = 2 compact support, (𝔛_S)_{Γ_n} → 𝔛_S(F_n) is injective with cokernel (H³_c)^{Γ_n} = Z_p, identified with Γ_n = Gal(F_∞/F_n) (Sharifi, proof of Theorem 3.3.3: 0 → (𝔛_∞)_{Γ_n} → 𝔛_n → Γ_n → 0).

**Hypotheses and conventions.**

- As in arithmetic-iwasawa-complex.

**Proof plan.**

1. (a): derived control for Iwasawa cohomology (SelmerIwasawaCohomology L3/derived-control) with Shapiro's lemma.
2. (b): the Künneth/Tor spectral sequence for a perfect complex tensored with a module.
3. (c): Z_p[Γ/Γ_n] = Λ/(ω_n) has a length-one free resolution by multiplication by the non-zerodivisor ω_n (finite-level-kernel).
4. (e): Sharifi's computation in the proof of Theorem 3.3.3.

**Prerequisites.**

- `IntegralIwasawaTheory:I.4/arithmetic-iwasawa-complex`
- `SelmerIwasawaCohomology:L3/derived-control`
- `SelmerIwasawaCohomology:L3/kernel-control`
- `IntegralIwasawaTheory:I.1/finite-level-kernel`
- `PadicMeasuresIwasawaAlgebras:L5`

**Acceptance.**

- For M = H^j(C) torsion with M^{Γ_n} finite, #H^j_n is computed from #M_{Γ_n} and #H^{j+1}(C)^{Γ_n}.

**Sources.**

- **SHARIFI**, Theorem 3.3.3, proof, p. 84. Uses the exact sequence 0 → (𝔛_∞)_{Γ_n} → 𝔛_n → Γ_n → 0 to compute Z_p-ranks of coinvariants.
- **KURIHARA**, §4.2, pp. 24–26. Descends the Iwasawa complex and Selmer modules from K_∞ to finite layers, keeping the finite kernels and cokernels.
- **KOLSTER-2009**, Lecture 2, §3, pp. 13–14. Galois descent H¹(o'_{E∞}, Q_p/Z_p(n))^Γ = H¹(o'_E, Q_p/Z_p(n)) used to compare coinvariants of X with finite-level cohomology.

### Euler characteristics at arithmetic characters

**Theorem target:** `IntegralIwasawaTheory:I.4/coinvariant-euler-characteristic`.

**Planet:** Euler characteristic at an arithmetic character.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against KOLSTER-2009 Lecture 1, Lemma 1.1, p. 6, and Lemma 1.2, p. 7; KOLSTER-2009 Lecture 2, §3, Propositions 3.1–3.2, p. 14; ROGNES-WEIBEL-2000 Appendix A (Kolster), proof of Theorem A.1, p. 47. No local correction needed; imported proof inputs retain their stated supplier conditions.

Let O be a finite extension of Z_p, Λ_O = O[[T]] = O[[Γ]], and M a finitely generated torsion Λ_O-module with characteristic power series f = ϖ^μ f*. For an arithmetic point ρ_n,ψ = κ^nψ : Λ → O_ψ, the specialisation is computed through Γ-(co)invariants of the twist M(−n)_ψ: (a) M_Γ is finite iff M^Γ is finite iff f(0) ≠ 0, and then #M_Γ/#M^Γ = #(O/f(0)O); (b) if moreover M has no nonzero finite Λ_O-submodule then M^Γ = 0 and #M_Γ = #(O/f(0)O); (c) for the twist, char(M(−n)) is f(κ(γ)^n(1 + T) − 1) in the contragredient convention, so #M(−n)_Γ = #(O/f(u^n − 1)O) when f(u^n − 1) ≠ 0 and M has no nonzero finite submodule; Kolster's covariant convention (γφ)(x) = φ(γx) evaluates instead at u^{-n} − 1, and the two are compared by the involution ι; (d) at a trivial zero (f(u^n − 1) = 0, for instance M = Z_p and n = 0) the specialisation is not a finite Euler characteristic, and the statement passes to a leading term; away from it the augmentation factor is explicit: for M = Z_p (characteristic series T) and n ≠ 0, #Z_p(−n)_Γ = |u^n − 1|_p^{-1}, which equals #H⁰(F, Q_p/Z_p(n)) when κ^n factors through Γ = Gal(F_∞/F) (for instance μ_q ⊆ F), the trivial-character correction.

**Hypotheses and conventions.**

- M finitely generated torsion over O[[T]]; n ∈ Z; ψ a finite-order character of the finite part.

**Proof plan.**

1. (a): import the Euler quotient χ_n(M) of PadicMeasuresIwasawaAlgebras L4 (#M_{Γ_n}/#M^{Γ_n} via the resultant) at n = 0; it is Kolster Lemma 1.1.
2. (b): M^Γ is a finite submodule.
3. (c): Kolster Lemma 1.2 for the twist and iwasawa-algebra-coordinate for the two conventions.
4. (d): Z_p(n) as a Λ-module has characteristic series T − (u^n − 1) (iwasawa-algebra-coordinate test charIdeal_tate_twist).

**Prerequisites.**

- `IntegralIwasawaTheory:I.1/iwasawa-algebra-coordinate`
- `PadicMeasuresIwasawaAlgebras:L4`
- `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`
- `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`
- `PadicMeasuresIwasawaAlgebras:L4/projective-dimension-and-resolution`

**Acceptance.**

- Kolster Proposition 3.2: #H²(o'_E, Z_p(n))_{χ^{-1}} = #X_ψ(−n)_Γ = |f(κ(γ)^n − 1)|_v^{-1} for ψ ≠ 1.
- Kolster p. 14: #X(−n)_Γ^{-1} = κ(γ)^n − 1 for X = Z_p.

**Sources.**

- **KOLSTER-2009**, Lecture 1, Lemma 1.1, p. 6, and Lemma 1.2, p. 7. For a finitely generated torsion Λ-module: M^Γ finite ⇔ M_Γ finite ⇔ f(0) ≠ 0, with |M^Γ|/|M_Γ| = |f(0)|_v; the characteristic polynomial of M(n) is f*(κ(γ)^{−n}(1 + T) − 1).
- **KOLSTER-2009**, Lecture 2, §3, Propositions 3.1–3.2, p. 14. Uses absence of finite submodules to get M^Γ = 0 and computes the order of the twisted coinvariants, with the separate trivial-character computation κ(γ)^n − 1.
- **ROGNES-WEIBEL-2000**, Appendix A (Kolster), proof of Theorem A.1, p. 47. At p = 2 and even n uses the same coinvariant computation, with X(−n)^Γ = 0 because X has no finite submodule.

### Twisted coinvariants of the S-ramified module and étale cohomology

**Theorem target:** `IntegralIwasawaTheory:I.4/twisted-coinvariant-descent`.

**Review — corrected.** Restricted the integral character comparison to prime-to-p eigenspaces, p odd and weights n ≥ 2; kept the separate even dyadic case.

Let F be totally real, p a prime, E/F finite abelian with E ⊇ μ_{2p} (so μ_{p^∞} ⊆ E_∞), S ⊇ S_p ∪ S_∞, X = 𝔛_S(E_∞), and n ∈ Z, n ≠ 0, with Γ = Gal(E_∞/E). Then: (a) Hom(X, Q_p/Z_p(n)) = H¹(G_S(E_∞), Q_p/Z_p(n)) as Λ-modules, Galois acting trivially on Q_p/Z_p(n) over E_∞; (b) Hochschild–Serre gives H¹(G_S(E), Q_p/Z_p(n)) ≅ H¹(G_S(E_∞), Q_p/Z_p(n))^Γ for n ≠ 0 (for p = 2 using that H^i(Γ, Q_2/Z_2(n)) vanish for i = 1, 2); hence the Pontryagin dual of X(−n)_Γ is H¹(O_E^S, Q_p/Z_p(n)); (c) assume p odd, n ≥ 2 and p ∤ [E:F]; on an eigenspace where H¹(O_E^S, Q_p/Z_p(n)) is finite (odd χ for odd n, even χ for even n, with χ = ψω^{−n}), its quotient by its maximal divisible subgroup identifies with H²(O_E^S, Z_p(n))_{χ^{-1},tors}; under the stated finiteness this is the whole group; so #H²(O_E^S, Z_p(n))_{χ^{-1}} = #X_ψ(−n)_Γ; (d) for F itself and p = 2, n even ≥ 2: #X(F)(−n)_Γ = #H²_et(O_F[1/2], Z_2(n)), where X(F) is the S-ramified module allowing ramification at the real places.

**Hypotheses and conventions.**

- F totally real, E/F finite abelian with μ_{2p} ⊆ E, S ⊇ S_p ∪ S_∞ finite, n ≠ 0; in (c) the parity condition χ(−1) = (−1)^n. In (c), p odd, n ≥ 2, p ∤ [E:F], so the integral character idempotents exist.

**Proof plan.**

1. (a): Q_p/Z_p(n) is a trivial G_S(E_∞)-module; H¹ of a profinite group with trivial divisible coefficients is Hom of its abelianisation, whose pro-p part is X.
2. (b): inflation–restriction / Hochschild–Serre for Γ ≅ Z_p of cohomological dimension 1 (Tau Ceti ProfiniteCohomology Layer 5).
3. (c): the torsion-of-H² identification H¹(Q_p/Z_p(n))/div ≅ H²(Z_p(n))_tors, and finiteness on the eigenspaces of the right parity (Kolster Corollary 2.2).
4. (d): Rognes–Weibel Appendix A, proof of Theorem A.1.

**Prerequisites.**

- `IntegralIwasawaTheory:I.4/arithmetic-iwasawa-complex`
- `IntegralIwasawaTheory:I.4/coinvariant-euler-characteristic`
- `IntegralIwasawaTheory:I.2/maximal-abelian-pro-p-extensions`
- `IntegralIwasawaTheory:I.2/weak-leopoldt`
- `IntegralIwasawaTheory:I.1/full-cyclotomic-tower`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`

**Acceptance.**

- Kolster Proposition 3.1: the Pontryagin dual of X_ψ(−n)_Γ is the finite group H²_et(o'_E, Z_p(n))_{χ^{-1}}.

**Sources.**

- **KOLSTER-2009**, Lecture 1, §2, Proposition 2.1 and Corollary 2.2, pp. 10–11; Lecture 2, §3, Proposition 3.1, pp. 13–14. Identifies Hom(X, Q_p/Z_p(n)) with H¹(o'_{E∞}, Q_p/Z_p(n)), descends to E, and identifies the finite eigenspaces with H²(o'_E, Z_p(n)).
- **ROGNES-WEIBEL-2000**, Appendix A (Kolster), proof of Theorem A.1, p. 47. For p = 2, n even and F totally real, shows (X(−n)_Γ)^# ≅ H¹(G_S(F), Q_2/Z_2(n)) ≅ H²_et(O_F[1/2], Z_2(n)), using vanishing of H¹ and H² of Γ.

### Local Euler factors under enlarging S

**Theorem target:** `IntegralIwasawaTheory:I.4/s-enlargement-euler-factors`.

**Review — corrected.** Restricted to addition of one prime and corrected κ(Frob_v) to ⟨Nv⟩, including the Teichmüller factor in specialisation.

Let F/k be finite abelian totally real, F_∞ cyclotomic, S′ = S ∪ {v} with S ⊇ S_p ∪ S_∞ ∪ S_ram, and v ∉ S (so v ∤ p, v unramified in F). Then: (a) there is an exact sequence of Λ_{F∞}-modules 0 → ⊕_{w | v} (inertia at w in 𝔛_{S'}) → 𝔛_{S'}(F_∞) → 𝔛_S(F_∞) → 0, where the inertia term is Λ_{F∞} ⊗_{Z_p[[D_v]]} lim_m μ_{p^∞}(k(w_m)) ≅ Λ_{F∞}/(Frob_v − Nv), with D_v ⊆ Gal(F_∞/k) the decomposition group of v (topologically generated by Frob_v) and k(w_m) the residue fields of F_m above v under norms; (b) its characteristic ideal (over each component) is generated by 1 − Nv^{-1}Frob_v, so Det(C_{S'})^{-1} = (1 − Nv^{-1}Frob_v)·Det(C_S)^{-1}, matching g_{S'} = (1 − Nv^{-1}Frob_v)g_S of IntegralIwasawaTheory I.3; (c) at a finite layer the corresponding factor is the Euler factor 1 − ψ(v)⟨Nv⟩^n/Nv at κ^nψ on a totally real procyclic tower; it equals 1 − ψ_0(v)Nv^{n−1} when ψ = ψ_0ω^n on Frobenius, which may vanish p-adically but never identically on Λ; (d) the identities hold integrally, so the finite S-local factor is kept in every finite-level formula (and in Kolster's imprimitive L^S_p).

**Hypotheses and conventions.**

- v ∉ S, v ∤ p, v unramified in F/k; D_v ⊆ G the decomposition group, open by tower-ramification.

**Proof plan.**

1. (a): the maximal S'-ramified extension differs from the S-ramified one by tame inertia at the primes above v, which is a quotient of Z_p(1) (pro-p tame inertia), and by weak Leopoldt there is no further kernel (global–local unit sequence with S'). The injectivity of this inertia term remains G-I4-ENLARGE; weak Leopoldt alone is not a proof of the asserted exact sequence.
2. The inverse limit of the local p-primary roots of unity is the cyclic D_v-module with relation Frob_v − Nv; induction gives the displayed Λ-quotient. A unit relation gives the zero module. At p = 2 the criterion is absence of μ_2, not absence of μ_4. Since Nv is a p-adic unit, Frob_v − Nv and 1 − Nv^{-1}Frob_v generate the same ideal.
3. On the cyclotomic Z_p-quotient κ(Frob_v) = ⟨Nv⟩, so evaluate at κ^nψ with the Teichmüller adjustment displayed in (c). The full cyclotomic character need not factor through this quotient.

**Prerequisites.**

- `IntegralIwasawaTheory:I.4/arithmetic-iwasawa-complex`
- `IntegralIwasawaTheory:I.2/global-local-unit-sequence`
- `IntegralIwasawaTheory:I.2/weak-leopoldt`
- `IntegralIwasawaTheory:I.1/tower-ramification`
- `IntegralIwasawaTheory:I.3/deligne-ribet-dictionary`
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`
- `PadicMeasuresIwasawaAlgebras:L5`

**Acceptance.**

- For k = F = Q and v = ℓ ≠ p: char(𝔛_{{p,ℓ,∞}})/char(𝔛_{{p,∞}}) = (1 − ℓ^{-1}σ_ℓ).

**Sources.**

- **KOLSTER-2009**, Lecture 1, §1, pp. 8–9. Defines imprimitive p-adic L-functions L^S_p by removing Euler factors at S and notes the characteristic polynomial f*_{ψ,S} is insensitive to enlarging the field but sensitive to S.
- **KURIHARA**, §4.2, equation (14) and the following computation, p. 26. Relates the determinants of the complexes and the T-smoothed Selmer module through local factors at the primes of T, ∏(1 − Frob_v N(v)), after localisation at height-one primes.
- **DK-2023**, §3.1, Lemma 3.1 and the change-of-depletion sequence, pp. 19–20. Uses 0 → Y_{H,Σ∖Σ0} → Sel_Σ → Sel_{Σ0} → 0 and the Euler factor (1 − ψ(v)) when enlarging the depletion set.

### Real-place corrections at p = 2

**Theorem target:** `IntegralIwasawaTheory:I.4/dyadic-real-place-correction`.

**Review — unverifiable.** Marked the real-place comparison as open and corrected height-one visibility of tower sign modules. The exact real-place map and rank have not been established.

Let F be totally real with r_1 = [F : Q], p = 2, S = S_2 ∪ S_∞. (a) The following comparison is a target still awaiting G-I10-REALPLACE. The S-ramified module X(F) = 𝔛_S(F_∞) must allow ramification at the real places; the module 𝔛^+ with real places unramified differs from it, and characteristic ideals change by explicit factors of 2: char(ι_u X(F)) = (2^{r_1} f_F) in the comparison with Kolster's minus module (consumed by SpecialValuesBirchTate B.6). (b) For even n ≥ 2, ζ_F(1 − n) ∼_2 #H²_et(O_F[1/2], Z_2(n))/#H¹_et(O_F[1/2], Z_2(n)) once the 2-adic main conjecture for F and the trivial character holds, with #H¹ ∼_2 w_n(F) ∼_2 κ(γ)^n − 1. (c) The local real-place groups H^i(R, Z_2(n)) are finite of order 2 in the relevant degrees and are recorded separately in every finite Euler characteristic; a finite group at one layer is invisible to a Λ-characteristic ideal, but a norm-compatible induced tower module Λ/(2) is supported at the height-one prime (2) and changes that ideal. Its rank and maps must be proved before claiming the factor in (a).

**Hypotheses and conventions.**

- F totally real; p = 2; n even ≥ 2 in (b).

**Proof plan.**

1. Class field theory gives a quotient of a sum of Λ/(2) real inertia modules. It does not by itself prove injectivity, the number of independent factors, or the comparison with the norm-kernel class module. Those are exactly G-I10-REALPLACE.
2. (b): Rognes–Weibel Appendix A, Theorem A.1 and its proof (with twisted-coinvariant-descent (d) and coinvariant-euler-characteristic), using Remark A.4(b) for the equality of μ-invariants in the trivial-character case.
3. (c): local Tate cohomology of Gal(C/R) with Z_2(n) coefficients.

**Prerequisites.**

- `IntegralIwasawaTheory:I.4/twisted-coinvariant-descent`
- `IntegralIwasawaTheory:I.4/coinvariant-euler-characteristic`
- `IntegralIwasawaTheory:I.2/maximal-abelian-pro-p-extensions`
- `IntegralIwasawaTheory:I.2/weak-leopoldt`
- `IntegralIwasawaTheory:I.3/deligne-ribet-dictionary`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`

**Acceptance.**

- F = Q: ζ(−1) = −1/12 ∼_2 #H²_et(Z[1/2], Z_2(2))/#H¹_et(Z[1/2], Z_2(2)) with #H¹ = w_2(Q)_2 = 8; this is the 2-part of the Birch–Tate formula for Q (K_2(Z) = Z/2).

**Sources.**

- **ROGNES-WEIBEL-2000**, Appendix A (Kolster), Theorem A.1, Remark A.4 and the proof of Theorem A.1, pp. 45–47. Proves ζ_F(1 − n) ∼_2 |H²|/|H¹| for even n from the 2-adic main conjecture for the trivial character, stressing that ramification at infinite primes must be allowed for p = 2 and that the μ-invariants agree for the trivial character.
- **KOLSTER-2009**, Lecture 2, Corollary 3.4 and Birch–Tate Conjecture 3.5, p. 15. States ζ_F(1 − n) = ±h_n(F)/w_n(F) up to powers of 2 for odd primes and notes the 2-primary part for abelian F.

## IntegralIwasawaTheory:I.5

### The classical main conjecture for a totally real field

**Definition target:** `IntegralIwasawaTheory:I.5/main-conjecture-statement`.

**Planet:** Iwasawa main conjecture.

**Review — corrected.** Separated weak and strong conjectures and restricted the Q branch equivalences; added the Ferrero–Washington input.

Let F be totally real, p a prime, S ⊇ S_p ∪ S_∞ finite, and ψ an even one-dimensional p-adic Artin character of F of type S (F_ψ ∩ F_∞ = F). Let N = F_ψ, X_S(N) = 𝔛_S(N_∞) (I.2, ramification at real places allowed when p = 2), O_ψ = Z_p[ψ], X_S(N)_ψ = {x ∈ X_S(N) ⊗ O_ψ : δx = ψ(δ)x for δ ∈ Gal(N/F)}, g_{ψ,S} = ϖ^{μ(g)} g*_{ψ,S} its characteristic series (g* the characteristic polynomial of γ − 1 on X_S(N)_ψ ⊗ Q̄_p), and G_{ψ,S} = ϖ^{μ(G)} G*_{ψ,S}·u the Deligne–Ribet power series of IntegralIwasawaTheory I.3 (deligne-ribet-dictionary (vi)). MainConjecture(F, p, ψ, S) is the proposition g*_{ψ,S} = G*_{ψ,S}; the strong form adds μ(g) = μ(G), that is char(X_S(N)_ψ) = (G_{ψ,S}). Over Q for odd p, ψ = ω^k with k even and k ≢ 0 mod p−1, the strong form is equivalent to char(X_∞^{(ω^{1−k})}) = (f_k) for the unramified minus eigenspace, and to char(E_∞^{(k)}/C_∞^{(k)}) = char(X_∞^{(k)}) for units modulo cyclotomic units. Passing from the weak statement to these characteristic-ideal equalities uses the separately imported arithmetic and analytic Ferrero–Washington μ = 0 theorems. The exceptional branch k ≡ 0 has a pole and is treated separately.

**Hypotheses and conventions.**

- F totally real; p prime; S ⊇ S_p ∪ S_∞; ψ even of type S, one-dimensional, finite order.

**Proof plan.**

1. X_S(N)_ψ is finitely generated torsion over O_ψ[[T]] by weak-leopoldt (N totally real).
2. g* is unchanged when N is replaced by any finite abelian E ⊇ F_ψ with E ∩ F_∞ = F (Kolster p. 9, citing Greenberg); enlarging S multiplies both sides by the same local factors (I.4/s-enlargement-euler-factors).
3. Over Q: the equivalences of the three versions use I.2/global-local-unit-sequence, Kummer duality, and Iwasawa's isomorphism U_∞^{(k)}/C_∞^{(k)} ≅ Λ/(g_k) through Coleman power series (ColemanPowerSeries L4). The weak-to-strong passage additionally imports Ferrero–Washington; it is not a formal equivalence of distinguished polynomials and full ideals.

**Prerequisites.**

- `IntegralIwasawaTheory:I.2/maximal-abelian-pro-p-extensions`
- `IntegralIwasawaTheory:I.2/weak-leopoldt`
- `IntegralIwasawaTheory:I.3/deligne-ribet-dictionary`
- `IntegralIwasawaTheory:I.4/s-enlargement-euler-factors`
- `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`
- `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`
- `ColemanPowerSeries:L4`
- `IntegralIwasawaTheory:I.2/global-local-unit-sequence`
- `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero`
- `IntegralIwasawaTheory:L4/fw-analytic-mu-zero`

**API.**

- `IntegralIwasawaTheory.MainConjecture` (constructor): The proposition g*_{ψ,S} = G*_{ψ,S} for (F, p, ψ, S).
- `IntegralIwasawaTheory.StrongMainConjecture` (constructor): The proposition char(X_S(F_ψ)_ψ) = (G_{ψ,S}).
- `IntegralIwasawaTheory.mainConjecture_S_indep` (characterisation): MainConjecture(F, p, ψ, S) ↔ MainConjecture(F, p, ψ, S') for S ⊆ S'.
- `IntegralIwasawaTheory.mainConjecture_field_indep` (characterisation): The Iwasawa side may be computed over any finite abelian E ⊇ F_ψ with E ∩ F_∞ = F.
- `IntegralIwasawaTheory.mainConjecture_rat_iff_unramified` (equivalence): Over Q, for odd p and even k ≢ 0 mod p−1: StrongMainConjecture ↔ char(X_∞^{(ω^{1−k})}) = (f_k).
- `IntegralIwasawaTheory.mainConjecture_rat_iff_units` (equivalence): Over Q, for odd p and even k ≢ 0 mod p−1: StrongMainConjecture ↔ char(E_∞^{(k)}/C_∞^{(k)}) = char(X_∞^{(k)}).

**Checks.**

- `mainConjecture_rat_37` (computation): For F = Q, p = 37 and k = 32: f_{32} is not a unit (37 | B_{32}), and the main conjecture with Mazur–Wiles Theorem 2.5.13 gives |A_{Q(μ37)}^{(ω^5)}| = 37 = h(Q(μ_37)).
- `mainConjecture_unit_case` (degenerate): If ψ has order prime to p, X_ψ is a direct summand with no nonzero finite Λ-submodule. If G_{ψ,S} is a unit, the strong conjecture then gives X_ψ = 0. For Q and regular odd p, this applies to the nonexceptional even branches.
- `mainConjecture_not_unramified_even` (non-example): Comparing G_{ψ,S} for even ψ with the unramified even eigenspace X_∞^{(ψ)} is wrong: for F = Q, p = 37, ψ = ω^{32}, Vandiver's conjecture (true for 37) gives X_∞^{(ω^{32})} = 0 while G is not a unit.
- `mainConjecture_weak_vs_strong` (characterisation): MainConjecture compares distinguished polynomials only; StrongMainConjecture additionally needs μ(X_ψ) = μ(G_ψ), proved by Wiles for ψ of order prime to p.

**Uses.**

- IntegralIwasawaTheory:I.10/nonequivariant-characteristic-ideal: the nonequivariant statement char(X_{F∞,S}) = ((γ − 1)g) at the trivial character
- SpecialValuesBirchTate:B.4/etale-euler-characteristic-and-zeta: the main conjecture for the trivial character gives the p-adic valuation of ζ_F(−1)
- NoncommutativeAndEquivariantIwasawa:NE.6/abelian-case: Wiles's theorem is the abelian input of the noncommutative main conjecture
- AutomorphicCongruences:L5b: the odd-prime totally real abelian-character main conjecture bound in Wan's Theorem 100

**Acceptance.**

- Rognes–Weibel Appendix A, p. 46: G*_ψ(T) = g*_ψ(T) is Greenberg's formulation.
- Sharifi AWS Theorems 2.5.1, 2.5.4, 2.5.7: the three equivalent versions over Q.

**Sources.**

- **KOLSTER-2009**, Lecture 1, §1, pp. 7–9, Iwasawa's Main Conjecture 1.3. Formulates the main conjecture for type-S characters as equality of the distinguished polynomial of the Deligne–Ribet power series with the characteristic polynomial of γ − 1 on V_ψ, independent of the auxiliary field.
- **ROGNES-WEIBEL-2000**, Appendix A (Kolster), pp. 45–47, Main Conjecture and Remark A.4. Gives Greenberg's formulation with ramification at infinite places allowed for p = 2, and the stronger version including μ-invariants.
- **SHARIFI-AWS**, §2.5, Theorems 2.5.1, 2.5.4, 2.5.6 and 2.5.7, pp. 22–25. States the main conjecture over Q in three equivalent forms: unramified odd eigenspaces, p-ramified even eigenspaces, and units modulo cyclotomic units.

### Ordinary Hecke algebras and the Eisenstein ideal

**Construction target:** `IntegralIwasawaTheory:I.5/hida-hecke-eisenstein-ideal`.

**Planet:** Eisenstein ideal.

**Review — unverifiable.** Recorded that the proposed IHG.1 codimension-zero congruence interface is not present in current upstream and remains a supplier gap. The general codimension-zero supplier interface is not available.

Over Q (tame level 1, p ≥ 5, k even with k ≢ 0 mod p − 1): let 𝔐 = 𝔐(1, Λ)^ord ⊇ 𝔖 = 𝔖(1, Λ)^ord be Hida's ordinary Λ-adic modular and cusp forms, ℌ and 𝔥 their Hecke algebras (inverse diamond operators), ℰ_θ the Λ-adic Eisenstein series of character θ = ω^{k−2} with constant term ½ the Kubota–Leopoldt power series. The Eisenstein ideal I_k ⊆ 𝔥 is generated by U_p − 1, T_ℓ − 1 − ℓ⟨ℓ⟩ (ℓ ≠ p) and ⟨j⟩ − ω^{k−2}(j) (j ∈ μ_{p−1}); 𝔪_k = I_k + (p, ⟨υ⟩ − 1) and 𝔥_k = 𝔥_{𝔪_k}. Then 𝔥_k ≠ 0 iff p divides B_{2,ω^{k−2}}, and (Mazur–Wiles) 𝔥_k/I ≅ Λ/(ξ_k) with ξ_k(v^s − 1) = L_p(ω^k, s − 1); the congruence module of 0 → 𝔖 → 𝔐 → Λ → 0 (nearly split by ℰ) is Λ/(ξ_k). Over a totally real F the same construction uses Wiles's and Hida's ordinary Λ-adic Hilbert forms and Hecke algebras (PadicFamilies L5), the Hilbert Eisenstein families of AutomorphicPadicLFunctions L3 with constant term the Deligne–Ribet series, and an Eisenstein ideal for each even character ψ; the codimension-zero congruence module and ideal are those owned by IntegralHeckeAndGaloisDeterminants IHG.1.

**Hypotheses and conventions.**

- p odd (p ≥ 5 in the Q-case as in the source); k even; ψ even of type S for the totally real version.

**Proof plan.**

1. Hida duality between 𝔐 and ℌ; the Eisenstein series gives ℌ → Λ with kernel the Eisenstein ideal ℐ.
2. The constant-term functional gives T_0 ∈ ℌ with ℌ/(T_0) ≅ 𝔥 and image ½ξ in ℌ/ℐ ≅ Λ, hence 𝔥/I ≅ Λ/(ξ) (Emerton's proof, Sharifi AWS Theorem 4.3.3).
3. The Q congruence quotient is supplied directly by Sharifi AWS Theorem 4.3.3, pp. 50–52. The general codimension-zero Ψ_λ/η_λ interface requested from IHG.1 is an ownership proposal, not an available theorem in current TauCetiRoadmap; its precise coefficient and augmentation hypotheses remain G-I5-CONGRUENCE.

**Prerequisites.**

- `PadicFamilies:L5/nearly-ordinary-hecke-algebra`
- `PadicFamilies:L5/lambda-adic-hilbert-forms`
- `PadicFamilies:L0a/finite-ordinary-projector`
- `PadicFamilies:L1/congruence-ideal`
- `IntegralHeckeAndGaloisDeterminants:IHG.1`
- `DirichletPadicLFunctions:L4/full-eisenstein-total-series`
- `AutomorphicPadicLFunctions:L3/hilbert-eisenstein-series`
- `IntegralIwasawaTheory:I.3/deligne-ribet-dictionary`
- `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`
- `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`

**API.**

- `IntegralIwasawaTheory.ordinaryHeckeAlgebra` (data): 𝔥 (cuspidal) and ℌ (full) ordinary Λ-adic Hecke algebras, imported from PadicFamilies L5 with inverse diamond operators.
- `IntegralIwasawaTheory.eisensteinIdeal` (constructor): I_k ⊆ 𝔥 generated by U_p − 1, T_ℓ − 1 − ℓ⟨ℓ⟩ and ⟨j⟩ − ω^{k−2}(j).
- `IntegralIwasawaTheory.eisensteinHom` (projection): The surjection 𝔥_k → Λ/(ξ_k) with kernel I.
- `IntegralIwasawaTheory.eisenstein_quotient` (characterisation): 𝔥_k/I ≅ Λ/(ξ_k) (Mazur–Wiles).
- `IntegralIwasawaTheory.eisensteinLocal_ne_zero_iff` (characterisation): 𝔥_k ≠ 0 iff p | B_{2,ω^{k−2}}.
- `IntegralIwasawaTheory.eisenstein_congruenceModule` (compatibility): The congruence module of 0 → 𝔖 → 𝔐 → Λ → 0 is Λ/(ξ_k), an instance of IHG.1's congruence module.
- `IntegralIwasawaTheory.eisensteinQuotient_generator` (characterisation): The Q Eisenstein quotient is generated as a Λ-module by the image of 1, with annihilator (ξ_k).

**Checks.**

- `eisenstein_691` (computation): For p = 691, k = 12, tame level 1: the Eisenstein ideal is proper, witnessed by Δ ≡ E_{12} mod 691.
- `eisenstein_regular_degenerate` (degenerate): If p ∤ B_{2,ω^{k−2}} then ξ_k is a unit, I = 𝔥_k and 𝔥_k = 0.
- `eisenstein_full_algebra_nonexample` (non-example): In the full Hecke algebra ℌ the Eisenstein quotient is ℌ/ℐ ≅ Λ, not Λ/(ξ): the congruence appears only after passing to the cuspidal quotient 𝔥 = ℌ/(T_0).
- `eisensteinHom_T_ell` (compatibility): The Eisenstein homomorphism sends T_ℓ to 1 + ℓ⟨ℓ⟩, the Hecke eigenvalue of the Λ-adic Eisenstein series.

**Uses.**

- IntegralIwasawaTheory:I.5/ribet-extension-construction: the Eisenstein quotient 𝔥/I ≅ Λ/(ξ) bounds the Fitting ideal of the Ribet module
- IntegralIwasawaTheory:I.7/group-ring-hecke-eisenstein-homomorphism: the group-ring analogue of the Eisenstein homomorphism
- SerreWeightAndLevelOptimisation:R20.1: concrete congruence modules of Hecke modules

**Acceptance.**

- p = 691, k = 12, level 1: Δ ≡ E_12 mod 691 (τ(ℓ) ≡ 1 + ℓ^{11}), so the Eisenstein maximal ideal of the ordinary Hecke algebra is proper.

**Sources.**

- **SHARIFI-AWS**, §4.2–4.3, Definitions 4.2.1–4.2.6 and 4.3.1, Remark 4.3.2, Theorem 4.3.3, pp. 45–50. Defines ordinary Λ-adic forms and Hecke algebras, the Eisenstein ideal I_k and its maximal ideal 𝔪_k, shows 𝔥_k ≠ 0 iff p | B_{2,ω^{k−2}}, and proves 𝔥/I ≅ Λ/(ξ) through the congruence module of the nearly split sequence.
- **DK-2023**, §1.3, pp. 9–11. Describes the Eisenstein homomorphism from the cuspidal Hecke algebra onto the Stickelberger quotient as the core of Ribet's method after Wiles.

### Ribet's construction and the divisibility of characteristic ideals

**Theorem target:** `IntegralIwasawaTheory:I.5/ribet-extension-construction`.

**Planet:** Ribet's construction.

**Review — corrected.** Specified the rings in the Fitting argument and limited the unverified totally-real extension to distinguished-polynomial divisibility.

With 𝔥 = 𝔥_k, I and ξ = ξ_k as in hida-hecke-eisenstein-ideal: let ρ : G_Q → GL_2(Q(𝔥)) be the Galois representation on 𝒯 ⊗ Q(𝔥) in a basis adapted to the ordinary filtration at p (𝒯 the ordinary Λ-adic Tate module). Then a(σ) − det ρ(σ), d(σ) − 1 and b(σ)c(τ) lie in I; the 𝔥-spans B, C of b and c are faithful; ψ_c(σ) = det ρ(σ)^{-1}c(σ) mod IC is a cocycle whose restriction to G_{Q(μ_{p^∞})} is unramified everywhere and factors through X_∞^{(ω^{1−k})}, giving a surjection of Λ-modules X_∞^{(ω^{1−k})}(1) ↠ C/IC; and faithfulness gives Fitt_𝔥(C) = 0, hence Fitt_{𝔥/I}(C/IC) = 0; via 𝔥/I ≅ Λ/(ξ), this implies Fitt_Λ(C/IC) ⊆ (ξ) and therefore (ξ) divides char_Λ(C/IC), hence f_k | char(X_∞^{(ω^{1−k})}) with f_k(v^s − 1) = ξ(v^{s+1} − 1). Over a totally real F the analogous construction, with Wiles's ordinary Hilbert representations and auxiliary twisting to control ramification above p, is intended to give G*_{ψ,S} | g*_{ψ,S} for even ψ of type S and p odd; the μ-comparison and the missing totally-real proof are separate inputs (G-I5-WILES).

**Hypotheses and conventions.**

- p odd; the Q-case as in Sharifi AWS §4.3 (tame level 1, p ≥ 5); the totally real case for p odd.

**Proof plan.**

1. Ordinary local shape of ρ at p and the Čebotarev density of Frobenii give the congruences of Lemma 4.3.4 (Kurihara, Harder–Pink, Ohta) (Tau Ceti Chebotarev Layer 10).
2. Faithfulness of B and C: BC ⊆ I contains a positive density of T_ℓ − 1 − ℓ⟨ℓ⟩.
3. Unramifiedness at p: the cocycle is unramified at p by the choice of basis adapted to the ordinary filtration; elsewhere ρ is unramified.
4. C is finite and faithful over 𝔥, so Fitt_𝔥(C) ⊆ Ann_𝔥(C) = 0. Base change gives Fitt_{𝔥/I}(C/IC) = 0. Since 𝔥/I ≅ Λ/(ξ), base change from Λ shows Fitt_Λ(C/IC) ⊆ (ξ). Localising at each height-one prime of the regular ring Λ turns this into the required length inequality (Sharifi AWS p. 52).
5. Totally real case: replace modular curves by Wiles's Λ-adic Hilbert forms and R19.2/wiles-ordinary-hilbert-representation; the original argument (Wiles 1990) is not read here (gap G-I5-WILES). Only distinguished-polynomial divisibility is asserted without the separate μ-input.

**Prerequisites.**

- `IntegralIwasawaTheory:I.5/hida-hecke-eisenstein-ideal`
- `IntegralHeckeAndGaloisDeterminants:IHG.6/distinct-character-ribet`
- `IntegralHeckeAndGaloisDeterminants:IHG.6/zeroth-fitting-ideal`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hida-family-representation`
- `AutomorphicGaloisRepresentations:R19.2/wiles-ordinary-hilbert-representation`
- `IntegralIwasawaTheory:I.2/class-field-identification`
- `IntegralIwasawaTheory:I.1/arithmetic-compact-action`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`
- `IntegralIwasawaTheory:I.5/hecke-class-group-comparison`

**Acceptance.**

- Sharifi AWS p. 52: f_k | char(X_∞^{(1−k)}) for every even k, which with the analytic class number formula gives the main conjecture over Q.

**Sources.**

- **SHARIFI-AWS**, §4.3, Lemma 4.3.4 and the following argument, pp. 50–52. Constructs ρ adapted to the ordinary filtration, proves the Eisenstein congruences of its matrix entries, the faithfulness of B and C, the unramified cocycle into C/IC and the divisibility f_k | char(X_∞^{(1−k)}).
- **DK-2023**, §1.3, pp. 9–11. Summarises Ribet's method as used by Wiles: a faithful Hecke module, a cohomology class unramified away from p and the Fitting ideal inclusion, and explains why ramification above p must be controlled.
- **DKSW-RIBET**, §1, pp. 2–4. Recalls that Ribet's method was used by Mazur–Wiles over Q and by Wiles over totally real fields, and gives the residually distinguishable proof sketch with the Fitting ideal inclusion.

### Hecke-module and arithmetic-module actions

**Comparison target:** `IntegralIwasawaTheory:I.5/hecke-class-group-comparison`.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against SHARIFI-AWS Remark 4.3.2, p. 50; §4.3, p. 52. No local correction needed; imported proof inputs retain their stated supplier conditions.

The Λ-module structures used in ribet-extension-construction agree with those of IntegralIwasawaTheory I.1–I.2: (a) Λ acts on 𝔥 through inverse diamond operators ⟨a⟩^{-1}, so that the Galois action on C/IC through det ρ^{-1}c corresponds to the arithmetic conjugation action on X_∞ twisted by Z_p(1); (b) the module receiving the Ribet class is the unramified module X_∞ of I.2 (class-field-identification), not the S-ramified 𝔛_S, and the eigenspace is ω^{1−k}; (c) the comparison of the variables, f_k(v^s − 1) = ξ(v^{s+1} − 1), is the twist Tw_{±1} of I.1 and is kept explicit; (d) in the totally real case, the ψ-part of the S-ramified module and its relation with the odd parts of the unramified module of F_ψ(μ_p) is the Kummer duality of I.2/global-local-unit-sequence (d).

**Hypotheses and conventions.**

- As in ribet-extension-construction.

**Proof plan.**

1. Read off the twist from det ρ = ε_cyc·⟨ε_cyc⟩ on G_Q.
2. Use arithmetic-compact-action for the conjugation action and iwasawa-algebra-coordinate for the twist.

**Prerequisites.**

- `IntegralIwasawaTheory:I.1/iwasawa-algebra-coordinate`
- `IntegralIwasawaTheory:I.1/arithmetic-compact-action`
- `IntegralIwasawaTheory:I.2/class-field-identification`
- `IntegralIwasawaTheory:I.2/global-local-unit-sequence`
- `IntegralIwasawaTheory:I.5/hida-hecke-eisenstein-ideal`

**Acceptance.**

- Sharifi AWS Remark 4.3.2 and p. 52: Λ acts by inverse diamond operators, and ψ_c is Λ-linear from X_∞^{(1−k)}(1).

**Sources.**

- **SHARIFI-AWS**, Remark 4.3.2, p. 50; §4.3, p. 52. Fixes the inverse-diamond convention and shows the cocycle factors through X_∞^{(1−k)} with the Tate twist.

### One divisibility implies the main conjecture

**Theorem target:** `IntegralIwasawaTheory:I.5/divisibility-to-equality`.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against SHARIFI-AWS Remark 2.5.2, p. 23; KOLSTER-2009 Lecture 2, §3, p. 13. No local correction needed; imported proof inputs retain their stated supplier conditions.

(a) Over Q (p odd): if f_k | char(X_∞^{(ω^{1−k})}) for every even k, then equality holds for every k. (b) Over a totally real F (p odd): if (G_{ψ,S}) | char(X_S(F_ψ)_ψ) for every even ψ of type S of order prime to p and the μ-invariants satisfy μ(G) ≥ μ(X), then equality holds. The input is an analytic class number formula: over Q, |A_n^-| is a product of Bernoulli numbers and λ(X^-) = Σ_j λ(Λ/(f_{2j})), with μ = 0 by Ferrero–Washington; over F, the analytic class number formula for the CM fields F_ψ(μ_p)_n (minus parts) compares the product of the characteristic ideals with the product of the p-adic L-functions.

**Hypotheses and conventions.**

- p odd.

**Proof plan.**

1. Over Q: Sharifi AWS Remark 2.5.2: the class number formula expresses h_n^- through generalised Bernoulli numbers, which gives the equality of total λ- and μ-invariants; a divisibility between monic polynomials of equal total degree for every character is an equality.
2. μ = 0 over abelian fields from IntegralIwasawaTheory L4/fw-arithmetic-mu-zero (μ for the analytic side from L4/fw-analytic-mu-zero).
3. Over F: the analytic class number formula for CM fields (AnalyticNumberTheory AN.4 Dedekind residue) and Wiles's comparison; the original argument is recorded as gap G-I5-WILES.

**Prerequisites.**

- `IntegralIwasawaTheory:I.5/ribet-extension-construction`
- `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero`
- `IntegralIwasawaTheory:L4/fw-analytic-mu-zero`
- `IntegralIwasawaTheory:L0/index-formula`
- `AnalyticNumberTheory:AN.4`
- `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`
- `IntegralIwasawaTheory:I.4/coinvariant-euler-characteristic`

**Acceptance.**

- Sharifi AWS Remark 2.5.2: to prove the main conjecture it suffices to show one divisibility for all even k.

**Sources.**

- **SHARIFI-AWS**, Remark 2.5.2, p. 23. Uses the analytic class number formula to equate λ(X^-) with Σ λ(Λ/(f_{2j})) and the μ-invariants, so one divisibility for all k gives the main conjecture.
- **KOLSTER-2009**, Lecture 2, §3, p. 13. Cites Wiles 1990 Theorem 1.4 for μ(X_ψ) = μ(G_ψ) when ψ has order prime to p.

### The Mazur–Wiles theorem

**Theorem target:** `IntegralIwasawaTheory:I.5/mazur-wiles-theorem`.

**Planet:** Mazur–Wiles theorem.

**Review — corrected.** Restricted the abelian generalisation to the case where the character field is abelian over Q, and imported the common Q main-conjecture statement.

Let p be an odd prime. For every even integer k, char_Λ(X_∞^{(ω^{1−k})}) = (f_k), where X_∞ is the unramified Iwasawa module of Q(μ_{p^∞}), f_k(v^s − 1) = L_p(ω^k, s) for k ≢ 0 mod p − 1 and f_k = 1 for k ≡ 0 mod p − 1; equivalently (main-conjecture-statement) char(𝔛_∞^{(k)}) = (g_k) and char(E_∞^{(k)}/C_∞^{(k)}) = char(X_∞^{(k)}). More generally, for a totally real abelian field F and an even character ψ of type S whose field F_ψ is abelian over Q, MainConjecture(F, p, ψ, S) holds in the strong form. Consequence: |A_{Q(μp)}^{(ω^{1−k})}| = p^{v_p(B_{1,ω^{k−1}})} for every even k ≢ 0 mod p − 1. The Q characteristic-ideal identity is the common theorem owned by EulerSystemsCyclotomicMainConjecture L3; this layer plans its Eisenstein-ideal proof and the comparison with that interface.

**Hypotheses and conventions.**

- p odd; in the generalisation both F and F_ψ are abelian over Q.

**Proof plan.**

1. Divisibility from ribet-extension-construction; equality from divisibility-to-equality (a).
2. The finite-level consequence: descend to n = 0 with coinvariant-euler-characteristic, using that X_∞^- has no nonzero finite submodule (I.2/cm-minus-class-modules) and f_k(0) ≡ −B_{1,ω^{k−1}} up to units.

**Prerequisites.**

- `IntegralIwasawaTheory:I.5/main-conjecture-statement`
- `IntegralIwasawaTheory:I.5/ribet-extension-construction`
- `IntegralIwasawaTheory:I.5/divisibility-to-equality`
- `IntegralIwasawaTheory:I.2/cm-minus-class-modules`
- `IntegralIwasawaTheory:I.4/coinvariant-euler-characteristic`
- `IntegralIwasawaTheory:I.3/kubota-leopoldt-stickelberger-dictionary`

**Acceptance.**

- p = 37, k = 32: |A^{(ω^5)}| = 37.
- Sharifi AWS Theorem 2.5.13: |A^{(1−k)}| = p^{v_p(B_{1,ω^{k−1}})}.

**Sources.**

- **SHARIFI-AWS**, Theorems 2.5.1 and 2.5.13, pp. 22–25; §4.3, pp. 49–52. States the Mazur–Wiles main conjecture over Q, its equivalent forms and the refined Herbrand–Ribet formula, and proves the theorem in the style of Mazur–Wiles and Ohta.
- **KURIHARA**, §2.1, Theorem 2.1, p. 3. States the Mazur–Wiles formula #A_K^{ω^i} = #Z_p/B_{1,ω^{−i}} for K = Q(μ_p) and odd i as a corollary of the main conjecture.
- **SHARIFI**, §6.3, Conjecture 6.3.1 and Proposition 6.3.2, Theorem 6.3.3, pp. 164–166. States the main conjecture over Q and its equivalent formulations.

### Wiles's main conjecture for totally real fields

**Theorem target:** `IntegralIwasawaTheory:I.5/wiles-main-conjecture`.

**Planet:** Wiles's main conjecture.

**Review — unverifiable.** Kept Wiles distinguished-polynomial equality separate from the prime-to-p μ-comparison. The totally-real Wiles proof contract remains incomplete.

Let F be totally real and p odd. For every even one-dimensional p-adic Artin character ψ of F of type S and every finite S ⊇ S_p ∪ S_∞, MainConjecture(F, p, ψ, S) holds: g*_{ψ,S} = G*_{ψ,S}. If moreover ψ has order prime to p, then μ(X_S(F_ψ)_ψ) = μ(G_{ψ,S}), so char(X_S(F_ψ)_ψ) = (G_{ψ,S}). For F = Q the statement also holds at p = 2.

**Hypotheses and conventions.**

- F totally real, p odd (p = 2 allowed for F = Q), ψ even of type S.

**Proof plan.**

1. The intended totally-real Eisenstein argument gives distinguished-polynomial divisibility G* | g*, not the strong ideal divisibility for arbitrary p-power-order ψ. Its missing details remain G-I5-WILES.
2. Compare degrees using the analytic class number argument for the polynomial statement. Only for ψ of order prime to p invoke Wiles Theorem 1.4 for equality of μ-invariants (Kolster 2009, pp. 13–14; Kakde §3, p. 14).
3. Characters of type W and general ψ are reduced to type S by going-up-induction.
4. The original proof is not read here; the statement is taken from Kolster, Kakde and Rognes–Weibel Appendix A (gap G-I5-WILES).

**Prerequisites.**

- `IntegralIwasawaTheory:I.5/main-conjecture-statement`
- `IntegralIwasawaTheory:I.5/ribet-extension-construction`
- `IntegralIwasawaTheory:I.5/divisibility-to-equality`
- `IntegralIwasawaTheory:I.5/going-up-induction`
- `IntegralIwasawaTheory:I.3/deligne-ribet-dictionary`
- `IntegralIwasawaTheory:I.2/weak-leopoldt`

**Acceptance.**

- Kakde §3, p. 14: h_ψ(T) and G*_ψ(T) generate the same ideal (Wiles Theorem 1.3), and μ_ψ = 0 when p ∤ #Gal(F_ψ/F) (Wiles Theorem 1.4 under μ = 0).

**Sources.**

- **KOLSTER-2009**, Lecture 1, §1, p. 8, and Lecture 2, §3, p. 13. Records that Wiles proved the main conjecture for odd p (and for p = 2 when F = Q) and that μ(X_ψ) = μ(G_ψ) for ψ of order prime to p.
- **KAKDE-2013**, §3, p. 14. Recalls Wiles's Theorems 1.3 and 1.4: h_ψ and G*_ψ generate the same ideal, and the μ-statement for p ∤ #Gal(F_ψ/F).
- **ROGNES-WEIBEL-2000**, Appendix A (Kolster), p. 46. States that the main conjecture was proved by Wiles for odd p and all totally real fields, and for p = 2 over Q (also by Greither).
- **DK-2023**, §1.1, p. 7. Notes that earlier progress on Brumer–Stark used the main conjecture for totally real fields proved by Wiles.

### Going-up and induction for the main conjecture

**Theorem target:** `IntegralIwasawaTheory:I.5/going-up-induction`.

**Review — unverifiable.** Distinguished the dyadic theorem actually sourced in Rognes–Weibel from the proposed general-prime induction argument. Only the dyadic going-up argument was verified against the source.

Let K be totally real and p a prime. (a) If MainConjecture(K, p, χ, S) holds for every real one-dimensional χ of type S over K, then for every finite totally real F/K, MainConjecture(F, p, ψ, S) holds for every real one-dimensional ψ of type S over F with F_ψ abelian over K. (b) Under induction Ind_H^G ψ = Σ_χ χ, the Deligne–Ribet power series satisfy G_ψ(T_e) = ∏_χ G_χ(T) with T_e = (1 + T)^{p^e} − 1, where p^e = [F ∩ K_∞ : K] (Kolster writes p = 2), and when e = 0 the Iwasawa characteristic polynomials behave the same way under induction; (c) a character χ = λρ with λ of type S and ρ of type W has G*_χ(T) equal to G*_λ(ρ(γ)(1 + T) − 1) up to a root of unity.

**Hypotheses and conventions.**

- K totally real; F/K finite totally real; ψ real one-dimensional of type S over F with F_ψ/K abelian.

**Proof plan.**

1. Factor p-adic L-functions under induction (Artin formalism for the Deligne–Ribet functions).
2. Compare roots of the distinguished polynomials under T ↦ T_e and under twisting by type-W characters.
3. On the Iwasawa side, identify W(N)_ψ with W(L)_λ for L = K_λ and compute the action of the generator γ_N = δγ_e (Rognes–Weibel Appendix A, proof of Theorem A.2).
4. The read source, Rognes–Weibel Theorem A.2, pp. 47–49, proves this going-up argument at p = 2. The extension to arbitrary p needs its induction and coefficient-field hypotheses checked; it remains G-I5-INDUCTION rather than a citation to that theorem.

**Prerequisites.**

- `IntegralIwasawaTheory:I.5/main-conjecture-statement`
- `IntegralIwasawaTheory:I.3/deligne-ribet-dictionary`
- `IntegralIwasawaTheory:I.1/equivariant-iwasawa-algebra`
- `AnalyticNumberTheory:AN.4`

**Acceptance.**

- Rognes–Weibel Corollary A.3: the 2-adic formula of Theorem A.1 holds for all totally real abelian fields, by going-up from Q.

**Sources.**

- **ROGNES-WEIBEL-2000**, Appendix A (Kolster), Theorem A.2, Corollary A.3 and the proof of Theorem A.2, pp. 45–49. Proves the going-up of the main conjecture to characters ψ over F with F_ψ abelian over K by factoring the p-adic L-functions under induction and comparing the roots of the distinguished polynomials.

### The Euler-characteristic endpoint of the main conjecture

**Theorem target:** `IntegralIwasawaTheory:I.5/special-value-endpoint`.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against KOLSTER-2009 Lecture 2, §3, Propositions 3.1–3.2, Theorem 3.3 and Corollary 3.4, pp. 13–15. No local correction needed; imported proof inputs retain their stated supplier conditions.

Let F be totally real, p odd, E = F(μ_p), Δ = Gal(E/F) (of order prime to p), S ⊇ S_p ∪ S_∞, X = 𝔛_S(E_∞) and n ≥ 2. For a one-dimensional even-or-odd character χ of F with F_χ ⊆ E and χ(−1) = (−1)^n, put ψ = χω^n (even, of order prime to p, hence of type S). Then X_ψ(−n)^Γ = 0, X_ψ(−n)_Γ is finite, and v_p(#X_ψ(−n)_Γ) = d_χ·v_p(L_S(1 − n, χ)) + v_p(#H⁰(E, Q_p/Z_p(n))_{χ^{-1}}), with d_χ = [O_χ : Z_p] and v_p the valuation of the fixed embedding Q̄ ⊆ Q̄_p, v_p(p) = 1; the H⁰ term is nonzero only when χ = ω^{−n} on Δ, i.e. ψ = 1. For χ = 1, n = 2 and S = S_p ∪ S_∞ this reads v_p(#X_{ω²}(−2)_Γ) = v_p(ζ_F(−1)) + v_p(w_2(F)): the equality of a finite Λ-module Euler characteristic with the p-adic valuation of ζ_F(−1), which SpecialValuesBirchTate B.4 converts into #H²_et(O_F[1/p], Z_p(2)) through IntegralIwasawaTheory I.4.

**Hypotheses and conventions.**

- F totally real; p odd; n ≥ 2; χ with F_χ ⊆ F(μ_p) and χ(−1) = (−1)^n.

**Proof plan.**

1. Apply wiles-main-conjecture to ψ (order prime to p, so the strong form holds), with the pole H_ψ(T) = ψ(γ)(1 + T) − 1 when ψ is of type W, i.e. ψ = 1 (Kolster p. 14 for the trivial character).
2. Evaluate the characteristic series of X_ψ(−n) at 0 with I.4/coinvariant-euler-characteristic; X has no nonzero finite submodule (I.2/weak-leopoldt (c)), so X_ψ(−n)^Γ = 0.
3. The Euler factors at v | p in L_S(1 − n, χ) = L(1 − n, χ)∏_{v|p}(1 − χ(v)Nv^{n−1}) are p-adic units for n ≥ 2, and |κ(γ)^n − 1|_p^{-1} accounts for H⁰(E, Q_p/Z_p(n))_{χ^{-1}}, nonzero only for χ = ω^{−n}·(trivial on Δ).

**Prerequisites.**

- `IntegralIwasawaTheory:I.5/wiles-main-conjecture`
- `IntegralIwasawaTheory:I.4/coinvariant-euler-characteristic`
- `IntegralIwasawaTheory:I.4/twisted-coinvariant-descent`
- `IntegralIwasawaTheory:I.2/weak-leopoldt`
- `IntegralIwasawaTheory:I.3/deligne-ribet-dictionary`
- `IntegralIwasawaTheory:I.1/full-cyclotomic-tower`

**Acceptance.**

- F = Q, p = 3, χ = 1, n = 2: v_3(ζ(−1)) + v_3(w_2(Q)) = −1 + 1 = 0, so X_{ω²}(−2)_Γ = 0, consistent with K_2(Z) = Z/2.
- Kolster Theorem 3.3: L_S(1 − n, χ)^{d_χ} ∼_p |H²_et(o^S_E, Z_p(n))_{χ^{-1}}| / |H⁰(E, Q_p/Z_p(n))_{χ^{-1}}|.

**Sources.**

- **KOLSTER-2009**, Lecture 2, §3, Propositions 3.1–3.2, Theorem 3.3 and Corollary 3.4, pp. 13–15. Combines the main conjecture with the coinvariant computation, treating the trivial character through H_1(T) = T and the group H⁰(E, Q_p/Z_p(n)), to relate L_S(1 − n, χ) to orders of étale cohomology and deduce ζ_F(1 − n) = ±h_n(F)/w_n(F) up to powers of 2.

## IntegralIwasawaTheory:I.6

### Minus parts, the involution # and Pontryagin duals for CM extensions

**Definition target:** `IntegralIwasawaTheory:I.6/cm-minus-parts-and-duals`.

**Review — corrected.** Replaced the ambiguous Z/4 test by a free-module counterexample separating the minus quotient from the eigenspace.

Let F be totally real, H/F finite abelian with H CM, G = Gal(H/F) and c ∈ G complex conjugation. The integral minus ring is Z[G]^- := Z[G]/(1 + c), finite free over Z, and for any Z[G]-module M put M^- := M ⊗_{Z[G]} Z[G]^- = M/(1 + c)M; after inverting 2 this is also the −1-eigenspace {m : cm = −m}, but integrally at 2 the quotient, the eigenspace and the norm kernel are different functors and are never identified. The involution # of Z[G] is σ ↦ σ^{-1} (PadicMeasuresIwasawaAlgebras L6/sharp-involution). The Pontryagin dual of a finite Z[G]-module M is M^∨ = Hom_Z(M, Q/Z) (Mathlib CharacterModule) with the contragredient action (σf)(m) = f(σ^{-1}m). Then Ann_{Z[G]}(M^∨) = Ann_{Z[G]}(M)^# for finite M, Fitt(M^∨) = Fitt(M)^# when the p-Sylow subgroup of G is cyclic (p-adically), and in general only Fitt ⊆ Ann holds for each. The integral duality Hom_Z(M, Z) ≅ Hom_{Z[G]}(M, Z[G]), φ ↦ (m ↦ Σ_g φ(gm)[g^{-1}]), identifies the lattice dual used for transposes; it differs from the finite dual M^∨ (for M = Z/p, Hom(M, Z_p[G]) = 0 while M^∨ ≅ Z/p).

**Hypotheses and conventions.**

- F totally real, H/F finite abelian CM, c the complex conjugation in G.

**Proof plan.**

1. c is central of order 2 because H is CM and G abelian; Z[G]/(1 + c) is torsion-free as c acts freely on G.
2. Ann of the dual: for finite M, x annihilates M^∨ iff x^# annihilates M, because (xf)(m) = f(x^#m).
3. Fitting ideals of duals for cyclic p-Sylow subgroups: Kurihara §2.5, proof of Corollary 2.9.
4. Integral duality: the stated map is an isomorphism of Z[G]-modules (DK proof of Lemma A.8).

**Prerequisites.**

- `PadicMeasuresIwasawaAlgebras:L6/sharp-involution`
- `PadicMeasuresIwasawaAlgebras:L6/contragredient-dual`
- `mathlib:CharacterModule`
- `mathlib:MonoidAlgebra`
- `mathlib:MonoidAlgebra.mapDomainRingEquiv`
- `mathlib:Module.annihilator`
- `mathlib:NumberField.IsCMField.complexConj`

**API.**

- `IntegralIwasawaTheory.minusRing` (constructor): Z[G]^- = Z[G]/(1 + c), and its p-adic version Z_p[G]^-.
- `IntegralIwasawaTheory.sharp` (compatibility): The involution # of R[G] as Mathlib's MonoidAlgebra.mapDomainRingEquiv for inversion; it agrees with PadicMeasuresIwasawaAlgebras L6/sharp-involution.
- `IntegralIwasawaTheory.minusPart` (functoriality): M ↦ M^- = M ⊗ Z[G]^-, right exact, exact after inverting 2.
- `IntegralIwasawaTheory.minusPart_eigen` (compatibility): After inverting 2, M^- ≅ {m : cm = −m}.
- `IntegralIwasawaTheory.pontryaginDual` (constructor): M^∨ = CharacterModule M with (σf)(m) = f(σ^{-1}m).
- `IntegralIwasawaTheory.annihilator_dual` (relation): Ann(M^∨) = Ann(M)^# for finite M.
- `IntegralIwasawaTheory.fitting_dual_cyclic` (relation): Fitt_{Z_p[G]}(M^∨) = Fitt_{Z_p[G]}(M)^# when the p-Sylow subgroup of G is cyclic.
- `IntegralIwasawaTheory.integralDuality` (equivalence): Hom_Z(M, Z) ≅ Hom_{Z[G]}(M, Z[G]) as Z[G]-modules for the contragredient action.
- `IntegralIwasawaTheory.minusPart_lift` (universal-property): A G-linear map M → N with (1+c)N=0 factors uniquely through M/(1+c)M.

**Checks.**

- `minusRing_C2` (computation): For G = {1, c}, Z[G]^- ≅ Z with c ↦ −1.
- `minusPart_odd_trivial` (degenerate): If c acts trivially on a finite module M of odd order then M^- = M/2M = 0.
- `minusPart_two_quotient` (non-example): For M = Z with c acting trivially, M/(1+c)M = Z/2 but {m : cm = −m} = 0. The canonical map from the eigenspace to the quotient is not an isomorphism at 2.
- `dual_annihilator_compat` (compatibility): For M = Z[G]/(x) finite, Ann(M^∨) = (x^#), agreeing with annihilator_dual.

**Uses.**

- IntegralIwasawaTheory:I.7/strong-brumer-stark: Theorem 1.3 ⇒ Theorem 1.2 via Fitt ⊆ Ann and duality
- IntegralIwasawaTheory:I.8/cm-twist-minus-plus: the minus quotient Λ_K^- = Λ_K/(1 + ρ)
- IntegralIwasawaTheory:I.9/selmer-modified-iwasawa-limit: minus parts of the CM Selmer modules
- PadicMeasuresIwasawaAlgebras: the Gorenstein-order duality that the upstream roadmap leaves to the Brumer–Stark roadmap

**Acceptance.**

- DK §1.1, p. 6: Theorem 1.3 implies Theorem 1.2 through Fitt ⊆ Ann, Ann(M^∨) = Ann(M)^# and the action of c by −1 on Θ_{S,T}.

**Sources.**

- **DK-2023**, §1.1, p. 6. Defines the Pontryagin dual with contragredient action, the involution #, minus parts M^- = M/(σ + 1) after inverting 2, and records Fitt ⊆ Ann and Ann(M^∨) = Ann(M)^#.
- **DKSW-BSZ**, §1.2, p. 5. Defines the integral minus ring Z[G]^- = Z[G]/(1 + c), finite free over Z, and M^- = M/(1 + c)M, used at p = 2.
- **DK-2023**, Lemma A.8, proof, p. 86. Uses the natural isomorphism Hom_Z(−, Z) ≅ Hom_{Z[G]}(−, Z[G]) to compute the transpose.
- **KURIHARA**, §2.5, Corollary 2.9 and its proof, p. 11. Uses Fitt_{Z_p[G]}(M)^# = Fitt_{Z_p[G]}(M^∨) for finite M when G_p is cyclic.

### Smoothed and depleted class groups

**Construction target:** `IntegralIwasawaTheory:I.6/smoothed-class-groups`.

**Planet:** Smoothed class group.

**Review — corrected.** Added a working characterisation, extensionality or universal-property API after checking the stated construction.

For H/F as above, a finite set T of finite places of F, T_H the places of H above T, and a set Σ of places: Cl^T(H) := I_T(H)/P_T(H), the ray class group of conductor ∏_{w ∈ T_H} w (Tau Ceti RayClassGroup for that modulus), where P_T(H) is generated by principal ideals (α) with α ≡ 1 mod every w ∈ T_H; Cl^T_Σ(H) is the quotient of Cl^T(H) by the classes of primes above Σ. These are finite Z[G]-modules. There is an exact sequence 1 → O_{H,Σ,T}^× → O_{H,Σ}^× → ∏_{w ∈ T_H} (O_H/w)^× → Cl^T_Σ(H) → Cl_Σ(H) → 0, and enlarging T by a prime v gives 0 → (∏_{w|v}(O_H/w)^×)/(image) → Cl^{T∪{v}} → Cl^T → 0, whose dual is the dual ray class sequence used for T-modification. Norm and extension maps for H ⊆ H' are compatible.

**Hypotheses and conventions.**

- T disjoint from Σ; T ∩ S_ram arbitrary (DK allow ramified primes in the smoothing set Σ').

**Proof plan.**

1. Instantiate Tau Ceti GlobalNumberFields ray class groups (TauCeti.GlobalNumberFields.RayClassGroup) with the squarefree modulus ∏_{w∈T_H} w and no infinite part.
2. The exact sequence is the ray class sequence of Tau Ceti GlobalNumberFields Layer 2 with units of the Σ-integers.
3. Galois action: G permutes T_H and Σ_H.

**Prerequisites.**

- `tauceti:TauCeti.GlobalNumberFields.RayClassGroup`
- `tauceti:TauCeti.GlobalNumberFields.Modulus`
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers`
- `IntegralIwasawaTheory:I.2/class-group-limit`
- `IntegralIwasawaTheory:I.6/cm-minus-parts-and-duals`

**API.**

- `IntegralIwasawaTheory.smoothedClassGroup` (constructor): Cl^T(H), the ray class group of conductor ∏_{w∈T_H} w.
- `IntegralIwasawaTheory.smoothedClassGroup_depleted` (constructor): Cl^T_Σ(H), the quotient by classes of primes above Σ.
- `IntegralIwasawaTheory.smoothedClassGroup_finite` (instance): Cl^T_Σ(H) is a finite Z[G]-module.
- `IntegralIwasawaTheory.smoothedClassGroup_exact` (relation): The exact sequence with O_{H,Σ,T}^×, O_{H,Σ}^× and ∏_{w∈T_H}(O_H/w)^×.
- `IntegralIwasawaTheory.smoothedClassGroup_enlarge` (relation): The sequence for T ⊆ T ∪ {v} and its Pontryagin dual.
- `IntegralIwasawaTheory.smoothedClassGroup_norm` (functoriality): Norm and extension maps for H ⊆ H', compatible with composition.
- `IntegralIwasawaTheory.smoothedClassGroup_lift` (universal-property): A homomorphism on ideals prime to T descends to Cl^T exactly when it kills T-congruent principal ideals.

**Checks.**

- `smoothedClassGroup_Q_mu3_7` (computation): For H = Q(μ_3), T = {7}: Cl^T(H) ≅ Z/6 with trivial c-action.
- `smoothedClassGroup_empty` (degenerate): For T = Σ = ∅, Cl^T_Σ(H) = Cl(H).
- `smoothedClassGroup_not_class_group` (non-example): For H = Q(μ_3), T = {7}, Cl^T(H) ≅ Z/6 while Cl(H) = 1: smoothing changes the module, so Cl cannot be used in place of Cl^T in the Brumer–Stark statement.
- `smoothedClassGroup_rayClass_compat` (compatibility): Cl^T(H) is TauCeti.GlobalNumberFields.RayClassGroup for the modulus with finite part ∏_{w∈T_H} w and empty infinite part.

**Uses.**

- IntegralIwasawaTheory:I.7/brumer-stark-theorem: Θ_{S,T} annihilates Cl^T(H)
- IntegralIwasawaTheory:I.6/selmer-module: Cl^{Σ'}(H)^{∨,-} is the quotient of the Selmer module
- IntegralIwasawaTheory:I.6/ritter-weiss-module: Cl^{Σ'}_Σ(H) is the submodule in property (P1)

**Acceptance.**

- For H = Q(μ_3) and T = {7}: Cl(H) = 1, ∏_{w|7}(O_H/w)^× ≅ (F_7^×)^2, μ_6 embeds as {(x, x^{-1})}, so Cl^T(H) ≅ F_7^× ≅ Z/6 with c acting trivially; its minus part vanishes.

**Sources.**

- **DK-2023**, §1, p. 4. Defines Cl^T(H) = I_T(H)/P_T(H) as the ray class group of conductor the product of the primes of T_H, and Cl^T_S(H) as its quotient by the classes of primes above S.
- **DK-2023**, §3.3, dual ray class sequence (37), p. 23. Uses the effect of enlarging the smoothing set on Cl^{∨,-}.
- **KURIHARA**, §2.5, p. 11. Works with A^T_K = Cl^T(K) ⊗ Z_p and its minus part for the strong Brumer–Stark conjecture.

### Smoothed Stickelberger elements of CM extensions and their integrality

**Construction target:** `IntegralIwasawaTheory:I.6/smoothed-stickelberger`.

**Review — corrected.** Restricted anti-invariance to the range that kills the trivial character, and restored the DKSW integrality hypotheses.

For H/F CM abelian and disjoint Σ ⊇ S_∞ (or, for DKSW, Σ ∪ Σ' ⊇ S_∞) and Σ' satisfying condition (1): (a) Θ_{Σ,Σ'} := Θ^{H/F}_{Σ,Σ'}(0) of IntegralIwasawaTheory I.3 lies in Z[G] when Σ ⊇ S_∞ ∪ S_ram, and in Z_p[G] for the depletion and smoothing sets Σ = S_∞ ∪ {v ∈ S_ram : v | p}, Σ' = T ∪ {v ∈ S_ram : v ∤ p} (DK (32), via the Sinnott–Kurihara ideal); (b) if Σ ⊇ S_∞ and #Σ ≥ 2, cΘ = −Θ, so Θ is determined by its image in Z[G]^- (after inverting 2); (c) under all (A1)–(A5) of keystone-fitting-theorem, for p = 2, with t = #(S_∞ ∩ Σ'), the element Θ_{Σ,Σ'}/2^t ∈ Z_2[G]^- characterised on odd characters exists; (d) on a character group ring R_Ψ of the minus part, Θ^# vanishes at every ψ with a trivial zero (ψ(G_v) = 1 for some v ∈ Σ), and on the trivial-zero-free quotient R_Ψ (Ψ = {ψ : ψ(v) ≠ 1 ∀ v ∈ Σ}) Θ^# is a non-zerodivisor; (e) for v ∤ p in S_ram, #I_v divides Nv − 1 in Z_p, so 1 − σ_v e_v Nv = (1 − σ_v e_v) + σ_v N I_v·(1 − Nv)/#I_v and Θ^#_{Σ,Σ'} = Θ^#_{Σ,T} ∏_{v ∈ S_ram, v ∤ p}(1 − σ_v e_v Nv) lies in the p-modified Sinnott–Kurihara ideal SK^T_p(H/F) ⊆ Z_p[G] (DK Remark 3.6), although the individual factors need not be integral.

**Hypotheses and conventions.**

- F totally real, H/F finite abelian CM, p a prime; Σ, Σ' as stated.

**Proof plan.**

1. (a): I.3/smoothed-integrality, and Kurihara's Lemma 3.4 argument for the DK sets (DK Remark 3.6).
2. (b): I.3/stickelberger-functoriality (d).
3. (c): I.3/smoothed-integrality (c).
4. (d): ψ(Θ^#) = L_{Σ,Σ'}(ψ, 0) = (1 − ψ(v))L_{Σ∖{v},Σ'}(ψ, 0) (DK Lemma 3.2); non-zerodivisor on R_Ψ by nonvanishing of L(ψ, 0) for odd ψ (AutomorphicPadicLFunctions L0/odd-character-l-zero-nonvanishing).
5. (e): the p-Sylow of tame inertia is a quotient of (O/v)^× (Tau Ceti LocalFieldsRamification Layer 3).

**Prerequisites.**

- `IntegralIwasawaTheory:I.3/stickelberger-elements`
- `IntegralIwasawaTheory:I.3/stickelberger-functoriality`
- `IntegralIwasawaTheory:I.3/smoothed-integrality`
- `IntegralIwasawaTheory:I.6/cm-minus-parts-and-duals`
- `PadicMeasuresIwasawaAlgebras:L6/character-group-ring`
- `PadicMeasuresIwasawaAlgebras:L6/component-character-group-ring`
- `AutomorphicPadicLFunctions:L0/odd-character-l-zero-nonvanishing`
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`

**API.**

- `IntegralIwasawaTheory.smoothedStickelberger` (constructor): Θ_{Σ,Σ'} = Θ^{H/F}_{Σ,Σ'}(0) as an element of Z[G] (Σ ⊇ S_∞ ∪ S_ram) or Z_p[G].
- `IntegralIwasawaTheory.smoothedStickelberger_minus` (projection): The image of Θ_{Σ,Σ'} in Z_p[G]^-.
- `IntegralIwasawaTheory.SmoothingCondition` (constructor): The predicate on a finite set T of primes of H: no nontrivial root of unity of H is ≡ 1 modulo every prime of T (condition (1)).
- `IntegralIwasawaTheory.smoothedStickelberger_conj` (simp): If Σ ⊇ S_∞ and #Σ ≥ 2, c·Θ_{Σ,Σ′} = −Θ_{Σ,Σ′}; odd projection is available without this full-ring anti-invariance.
- `IntegralIwasawaTheory.smoothedStickelberger_dyadic` (constructor): Under (A1)–(A5), the odd-character element Θ_{Σ,Σ′}/2^t ∈ Z_2[G]^−, t = #(S_∞ ∩ Σ′).
- `IntegralIwasawaTheory.smoothedStickelberger_trivialZero` (characterisation): ψ(Θ^#) = 0 when ψ(G_v) = 1 for some v ∈ Σ.
- `IntegralIwasawaTheory.smoothedStickelberger_nonZeroDivisor` (characterisation): Θ^# is a non-zerodivisor in the trivial-zero-free quotient R_Ψ.
- `IntegralIwasawaTheory.smoothingCondition_mono` (functoriality): If T ⊆ T′ and T satisfies the root-of-unity congruence condition, then T′ satisfies it.

**Checks.**

- `smoothedStickelberger_Q_mu3` (computation): For H = Q(μ_3), Σ = {∞, 3}, Σ' = {7}: Θ_{Σ,Σ'} = −(1 − c) ∈ Z[G].
- `smoothedStickelberger_trivialZero_example` (degenerate): If Σ contains a place v split completely in H (G_v = 1), then every ψ has a trivial zero and Θ_{Σ,Σ'} = 0.
- `smoothedStickelberger_condition_needed` (non-example): For H = Q(μ_3), Σ = {∞, 3}, Σ' = {2}, condition (1) fails and Θ = (1 − c)/2 ∉ Z[G].
- `smoothedStickelberger_I3_compat` (compatibility): smoothedStickelberger agrees with IntegralIwasawaTheory I.3's Θ^{H/F}_{Σ,Σ'}(0).
- `smoothedStickelberger_single_infinite_place` (non-example): For F = Q, H = Q(μ_3), Σ = {∞}, T = {7}, the trivial character of Θ has value ζ_Q(0)(1−7) = 3. Thus cΘ = −Θ fails for this singleton depletion set.

**Uses.**

- IntegralIwasawaTheory:I.7/keystone-fitting-theorem: Fitt(Sel^-) = (Θ^#_{Σ,Σ'})
- IntegralIwasawaTheory:I.8/stickelberger-deligne-ribet-square: the CM Stickelberger element θ with its T-Euler factors
- NoncommutativeAndEquivariantIwasawa:NE.6/unconditional-abelian-minus-main-theorem: Fitt(M) = (Θ^T_S) over Z_p[[G]]^-

**Acceptance.**

- H = Q(μ_3), Σ = {∞, 3}, Σ' = {7}: Θ = −(1 − c), with image −2 in Z[G]^- ⊗ Z[1/2] = Z[1/2].

**Sources.**

- **DK-2023**, §3.2–3.3, Lemma 3.2, Theorem 3.3, Lemma 3.4 and Remark 3.6, pp. 20–22. Defines the sets Σ, Σ' of (32), proves Θ^#_{Σ,Σ'} ∈ Z_p[G] through the p-modified Sinnott–Kurihara ideal, and shows that Θ^# vanishes on trivial-zero components.
- **DK-2023**, §7.1, Lemma 7.1, p. 43. Passes to the trivial-zero-free character group ring quotient on which Θ^# is a non-zerodivisor.
- **DKSW-BSZ**, §1.2, Theorem 1.2 and the following paragraph, p. 5. Introduces Θ_{Σ,Σ'}/2^t with t = #(S_∞ ∩ Σ') as an element of Z_p[G]^- for all p.

### The Sinnott–Kurihara ideal

**Definition target:** `IntegralIwasawaTheory:I.6/sinnott-kurihara-ideal`.

**Planet:** Sinnott–Kurihara ideal.

**Review — corrected.** Added a working characterisation, extensionality or universal-property API after checking the stated construction.

For H/F CM abelian, T satisfying condition (1) and S_ram the finite ramified places, with inertia I_v, decomposition G_v, e_v = (#I_v)^{-1}N I_v and σ_v ∈ G_v a Frobenius coset representative: SK^T(H/F) := (Θ^#_{S∞,T}) ∏_{v ∈ S_ram} (N I_v, 1 − σ_v e_v), a priori a fractional ideal of Z[G]. Equivalently SK^T(H/F) is generated by the elements ∏_{v ∈ J̄} N I_v·(Θ^{H_J/F}_{J,T})^#, S_∞ ⊆ J ⊆ S_∞ ∪ S_ram, J̄ = S_ram ∖ J, H_J the maximal subextension unramified at J̄. It lies in Z[G] (Kurihara). For an odd prime p, the p-modified ideal is SK^T_p(H/F) := (Θ^#_{Σ,T}) ∏_{v ∈ S_ram, v ∤ p}(N I_v, 1 − σ_v e_v) ⊆ Z_p[G] with Σ = S_∞ ∪ {v ∈ S_ram : v | p}, and Θ^#_{Σ,Σ'} ∈ SK^T_p.

**Hypotheses and conventions.**

- As in smoothed-stickelberger; σ_v any Frobenius representative (1 − σ_v e_v is independent of the choice).

**Proof plan.**

1. Independence of σ_v: e_v kills I_v − 1.
2. Integrality: expand the product and use (Θ^{H_J/F}_{J,T})^# ∈ Z[Gal(H_J/F)] (I.3/smoothed-integrality) with the multiplication by ∏ N I_v (DK (33)–(34)).

**Prerequisites.**

- `IntegralIwasawaTheory:I.6/smoothed-stickelberger`
- `IntegralIwasawaTheory:I.3/stickelberger-functoriality`
- `IntegralIwasawaTheory:I.3/smoothed-integrality`
- `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`

**API.**

- `IntegralIwasawaTheory.sinnottKuriharaIdeal` (constructor): SK^T(H/F) as a Z[G]-submodule of Q[G].
- `IntegralIwasawaTheory.sinnottKuriharaIdeal_le` (characterisation): SK^T(H/F) ⊆ Z[G], so it is an ideal.
- `IntegralIwasawaTheory.sinnottKuriharaIdeal_subextensions` (equivalence): The description by the generators ∏ N I_v (Θ^{H_J/F}_{J,T})^#.
- `IntegralIwasawaTheory.sinnottKuriharaIdeal_p` (constructor): SK^T_p(H/F) ⊆ Z_p[G].
- `IntegralIwasawaTheory.stickelberger_mem_sinnottKurihara` (relation): Θ^#_{S,T} ∈ SK^T(H/F) and Θ^#_{Σ,Σ'} ∈ SK^T_p(H/F).
- `IntegralIwasawaTheory.sinnottKuriharaIdeal_unramified` (example): If S_ram = ∅ then SK^T(H/F) = (Θ^#_{S∞,T}).
- `IntegralIwasawaTheory.sinnottKuriharaIdeal_mem_iff` (characterisation): Membership is equivalent to being a Z[G]-linear combination of the displayed subextension generators, transported by norm-element lifts.

**Checks.**

- `sinnottKurihara_unramified` (degenerate): For H/F unramified at all finite places, SK^T(H/F) = (Θ^#_{S∞,T}) is principal.
- `sinnottKurihara_Q_mu3` (computation): For H = Q(μ_3), T = {7}: Θ_{S∞,T} = (3/2)(1 + c) − (1 − c), I_3 = G, σ_3 = 1, so SK^T = (3(1 + c), −(1 − c)) and SK^{T,-} = (2) = Z[1/2] after inverting 2, matching Fitt(Cl^T(H)^{∨,-}) = (1).
- `sinnottKurihara_not_principal_stickelberger` (non-example): (Θ^#_{S,T}) is in general strictly smaller than SK^T: for H = Q(μ_3), T = {7}, Θ_{S,T} = −(1 − c) generates (1 − c), which does not contain 3(1 + c).
- `sinnottKurihara_choice_indep` (characterisation): Replacing σ_v by σ_v τ with τ ∈ I_v leaves 1 − σ_v e_v unchanged.

**Uses.**

- IntegralIwasawaTheory:I.7/kurihara-fitting-formula: Fitt(Cl^T(H)^{∨,-}) = SK^T(H/F)^-
- IntegralIwasawaTheory:I.7/partial-kurihara: Fitt(Sel^T_Σ(H)^-_p) = SK^T_p(H/F)^-

**Acceptance.**

- DK (7): Θ^#_{S,T} = Θ^#_{S∞,T}∏_{v∈S_ram}(1 − σ_v e_v) ∈ SK^T(H/F).

**Sources.**

- **DK-2023**, §1.1, the definition of SK^T and Theorem 1.4, p. 7; Lemma 3.4, equations (33)–(34), p. 21; Remark 3.6, p. 22. Defines the Sinnott–Kurihara ideal, its description by subextensions H_J, Kurihara's integrality lemma and the p-modified ideal SK^T_p with Θ^#_{Σ,Σ'} ∈ SK^T_p.
- **KURIHARA**, §2.3, p. 7. Defines the module Θ(K/k) generated by N_J(θ_{K_J/k, S_ram ∖ J}) and its alternative description (∏ U_v)w, citing his Proposition 3.1.

### The T-smoothed analytic class number formula for minus parts

**Theorem target:** `IntegralIwasawaTheory:I.6/minus-class-number-formula`.

**Planet:** Minus class number formula.

**Review — corrected.** Removed the claim that an away-from-two splitting by itself determines the integral power of two.

Let H/F be CM abelian, H^+ its maximal real subfield, ε the nontrivial character of Gal(H/H^+), and T satisfying condition (1). Then L_{S∞,T}(H/H^+, ε, 0) ∈ Z, and up to a power of 2, #Cl^T(H)^- = L_{S∞,T}(H/H^+, ε, 0) = ∏_{ψ ∈ Ĝ odd} L_{S∞,T}(H/F, ψ, 0) = ∏_{ψ odd} ψ(Θ_{S∞,T}). The regulator relation R^T(H) = 2^{[H^+:Q]−1}R^T(H^+) is an exact analytic input. An exact dyadic class-group comparison also requires the norm kernel, cokernel and wide-class convention; the splitting after inverting 2 alone does not determine these. DKSW Lemma 2.13 supplies the required modified-class norm sequence in inclusion-implies-equality.

**Hypotheses and conventions.**

- H/F CM abelian, F totally real, T satisfying condition (1).

**Proof plan.**

1. The T-smoothed Dedekind class number formula at s = 0 for H and H^+ (leading terms of ζ_{H,S∞,T} and ζ_{H^+,S∞,T}, both of order [H^+ : Q] − 1) (AnalyticNumberTheory AN.4 Dedekind continuation and residue; DK (24)–(25)).
2. Condition (1) gives O_{H,S∞,T}^× = O_{H^+,S∞,T}^×, hence the regulator relation.
3. Artin formalism Ind_{G_{H+}}^{G_F} ε = ⊕_{ψ odd} ψ (AnalyticNumberTheory AN.4).
4. Integrality by Deligne–Ribet/Cassou-Noguès (I.3/smoothed-integrality).

**Prerequisites.**

- `AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`
- `AnalyticNumberTheory:AN.4`
- `IntegralIwasawaTheory:I.3/stickelberger-elements`
- `IntegralIwasawaTheory:I.3/smoothed-integrality`
- `IntegralIwasawaTheory:I.6/smoothed-class-groups`
- `mathlib:NumberField.Units.regulator`
- `mathlib:NumberField.dedekindZeta`

**Acceptance.**

- H = Q(μ_3), T = {7}: ∏_{ψ odd} ψ(Θ_{S∞,T}) = −2, and #Cl^T(H)^- = 1 up to a power of 2.

**Sources.**

- **DK-2023**, §2.1, Lemma 2.1 and its proof, equations (22)–(26), pp. 14–15. Proves integrality of L_{S∞,T}(H/H^+, ε, 0) and the equality with #Cl^T(H)^- up to a power of 2, from the T-smoothed class number formula and the Artin formalism.

### The Burns–Kurihara–Sano Selmer module

**Construction target:** `IntegralIwasawaTheory:I.6/selmer-module`.

**Planet:** Burns–Kurihara–Sano Selmer module.

**Review — corrected.** Restricted minus Selmer exact sequences and the vanishing archimedean term to coefficients in which 2 is invertible.

For disjoint finite sets Σ ⊇ S_∞ and Σ' (Σ' satisfying condition (1)) of places of F, let H^×_{Σ'} = {x ∈ H^× : ord_w(x − 1) > 0 ∀ w ∈ Σ'_H} and Sel^{Σ'}_Σ(H) := Hom_Z(H^×_{Σ'}, Z)/∏_{w ∉ Σ_H ∪ Σ'_H} Z, the image of (x_w) being Σ_w x_w ord_w, with contragredient G-action. Then: (a) 0 → Y_{H,Σ∖S∞} → Sel^{Σ'}_Σ(H) → Sel^{Σ'}_{S∞}(H) → 0; (b) 0 → Cl^{Σ'}(H)^∨ → Sel^{Σ'}_{S∞}(H) → Hom_Z(O^×_{H,S∞,Σ'}, Z) → 0, so Sel^{Σ'}_{S∞}(H)^- ≅ Cl^{Σ'}(H)^{∨,-} and 0 → Y^-_{H,Σ} → Sel^{Σ'}_Σ(H)^- → Cl^{Σ'}(H)^{∨,-} → 0; (c) for S' ⊇ Σ with Cl^{Σ'}_{S'}(H) = 0, Sel^{Σ'}_Σ(H) ≅ Hom_Z(O^×_{H,S',Σ'}, Z)/∏_{w ∈ S'_H ∖ Σ_H} Z; (d) Sel_p := Sel ⊗ Z_p is H² of the T-modified compactly supported complex RΓ_{c,T}(O_{H,S}, Z_p) when Σ = S, Σ' = T, and the triangle RΓ_c → RΓ_{c,T} → (⊕_{w∈T_H} Q_p/Z_p(1))^∨[−2] relates the modified and unmodified modules; (e) norm (corestriction) maps for H ⊆ H' make (Sel^T_S(H_n)_p)_n an inverse system along the cyclotomic tower; (f) for ψ ≠ 1 with ψ(G_v) = 1 for some v ∈ Σ, Fitt_{O_ψ}(Sel_ψ) = 0. The minus exact sequences and the identification with the class-group dual in (a)–(b) use Z[1/2] or Z_p for odd p. Integrally at 2, taking the quotient by 1+c is not exact and Y_{H,S∞}/(1+c) need not vanish. The all-prime transpose statement is supplied separately by Kurihara Theorem 2.12.

**Hypotheses and conventions.**

- F totally real, H/F CM abelian; Σ ⊇ S_∞; Σ' with condition (1); for (d), S ⊇ S_∞ ∪ S_ram, T = Σ'.

**Proof plan.**

1. (a)–(b): the exact sequences of DK Lemma 3.1 and Burns' sequence; on minus parts Hom(O^×_{H,S∞,Σ'}, Z)^- = 0 because units of a CM field come from the real subfield up to torsion, killed by condition (1). This uses exactness of minus projection after inverting 2. At 2, a c-fixed free unit or place module has minus quotient M/2M, so this proof does not apply.
2. (c): Burns–Kurihara–Sano (12), cited by DK (31).
3. (d): Burns–Kurihara–Sano Proposition 2.4 (cited by Kurihara §4.2 p. 24) and ArithmeticGaloisDuality D7 compact support.
4. (e): functoriality of ord_w under norms.
5. (f): (Sel ⊗ K)_ψ ⊇ (Ind_{G_v}^G K)_ψ ≅ K by Frobenius reciprocity (Tau Ceti RepresentationTheory InductionRestriction Layer 2).

**Prerequisites.**

- `IntegralIwasawaTheory:I.6/smoothed-class-groups`
- `IntegralIwasawaTheory:I.6/cm-minus-parts-and-duals`
- `ArithmeticGaloisDuality:D7/compact-support-cochains`
- `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-2-induced-characters-and-frobenius-reciprocity`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`
- `mathlib:NumberField.Units.rank`

**API.**

- `IntegralIwasawaTheory.selmerModule` (constructor): Sel^{Σ'}_Σ(H) = Hom_Z(H^×_{Σ'}, Z)/∏_{w∉Σ_H∪Σ'_H} Z with contragredient action.
- `IntegralIwasawaTheory.selmerModule_depletion` (relation): 0 → Y_{H,Σ∖Σ0} → Sel_Σ → Sel_{Σ0} → 0 for S_∞ ⊆ Σ0 ⊆ Σ.
- `IntegralIwasawaTheory.selmerModule_minus` (relation): 0 → Y^-_{H,Σ} → Sel^{Σ'}_Σ(H)^- → Cl^{Σ'}(H)^{∨,-} → 0. (over Z[1/2] or Z_p with p odd).
- `IntegralIwasawaTheory.selmerModule_units_presentation` (equivalence): Sel ≅ Hom_Z(O^×_{H,S',Σ'}, Z)/∏_{w∈S'_H∖Σ_H} Z when Cl^{Σ'}_{S'}(H) = 0.
- `IntegralIwasawaTheory.selmerModule_cohomological` (compatibility): Sel^T_S(H)_p ≅ H²(RΓ_{c,T}(O_{H,S}, Z_p)).
- `IntegralIwasawaTheory.selmerModule_norm` (functoriality): Corestriction maps Sel(H') → Sel(H) for H ⊆ H', with identity and composition laws.
- `IntegralIwasawaTheory.selmerModule_fitting_trivialZero` (characterisation): Fitt_{O_ψ}(Sel_ψ) = 0 for ψ ≠ 1 with ψ(G_v) = 1, v ∈ Σ.
- `IntegralIwasawaTheory.selmerModule_lift` (universal-property): A homomorphism from Hom_Z(H^×_{Σ′},Z) killing the valuation-image subgroup factors uniquely through Sel^{Σ′}_Σ.

**Checks.**

- `selmerModule_Q_mu3` (computation): For H = Q(μ_3), Σ = S_∞, Σ' = {7}: Sel^- ≅ Cl^{{7}}(H)^{∨,-} = 0, and Fitt = (1) = (Θ^#) after inverting 2.
- `selmerModule_Y_term` (degenerate): With 2 inverted, Y^-_{H,S∞} = 0 because c fixes every infinite place. At p = 2 the quotient Y/(1+c) is Y/2Y and must be retained.
- `selmerModule_not_class_dual` (non-example): For Σ ⊋ S_∞ containing a finite place v, Sel_Σ^- surjects onto Cl^{∨,-} with nonzero kernel Y^-_{H,{v}} when c ∉ G_v; the Selmer module is not the class-group dual.
- `selmerModule_kurihara_compat` (compatibility): Kurihara's Sel^T_S(K) of §2.6 is the instance Σ = S, Σ' = T.

**Uses.**

- IntegralIwasawaTheory:I.7/keystone-fitting-theorem: the module whose Fitting ideal is (Θ^#_{Σ,Σ'})
- IntegralIwasawaTheory:I.9/selmer-modified-iwasawa-limit: the finite modules and norm maps of the CM Selmer limit
- NoncommutativeAndEquivariantIwasawa:NE.6/unconditional-abelian-minus-main-theorem: the smoothed Selmer module over the Iwasawa algebra

**Acceptance.**

- DK Lemma 3.1: 0 → Y^-_{H,Σ} → Sel^{Σ'}_Σ(H)^- → Cl^{Σ'}(H)^{∨,-} → 0. Coefficients invert 2.

**Sources.**

- **DK-2023**, §3.1, definition (29), Lemma 3.1, equations (30)–(31) and the trivial-zero computation, pp. 19–20. Defines the Selmer module of Burns–Kurihara–Sano, proves the minus exact sequence with Y_{H,Σ} and Cl^{Σ'}(H)^{∨,-}, gives the S'-unit presentation and the vanishing of Fitting ideals at trivial-zero characters.
- **KURIHARA**, §2.6, pp. 12–14, Proposition 2.11. Introduces Sel_S^T(K) following Burns–Kurihara–Sano and describes the Pontryagin dual of Sel_S(K) inside K^× ⊗ Q/Z.
- **KURIHARA**, §4.2, p. 24. Identifies Sel_S(K_∞)_p and Sel^T_S(K_∞)_p with H² of the compactly supported complexes and uses the T-modification triangle.

### Ritter–Weiss modules

**Construction target:** `IntegralIwasawaTheory:I.6/ritter-weiss-module`.

**Planet:** Ritter–Weiss module.

**Review — corrected.** Separated the generalised DKSW projective presentation from the original V^θ presentation.

For H/F abelian (F a number field), disjoint finite sets S, T of places with S ∪ T ⊇ S_∞ (DKSW; S ⊇ S_∞ in Dasgupta–Kakde), auxiliary S' ⊇ S, and the Ritter–Weiss local and global data (local Weil-group extensions, the modules V_w, W_w, the semilocal J ⊆ V ↠ W, the global Tate extension 0 → C_H → 𝔒 → ΔG → 0 and the map θ of extensions), the module ∇^T_S(H) is the cokernel of V^θ → B^θ (Definition A.2). It satisfies: (P1) 0 → Cl^T_S(H) → ∇^T_S(H) → X → 0, with X = X_{H,S} (degree-zero divisors on places above S) when S ∪ T ⊇ S_∞ ∪ S_ram (condition (A)/(A1)); its minus part is exact when some v ∈ S has c ∈ G_v. (P4) Under (B) (tame ramification in T) and (C) (O^×_{H,S,T} torsion-free), 0 → O^×_{H,S,T} → V^θ → B^θ → ∇^T_S(H) → 0 with V^θ, B^θ projective, a quadratic presentation under (A); for CM H and S ≠ ∅ a presentation of ∇^- by projective Z[G]^--modules; with (B_p) the same after ⊗ Z_(p). The construction is independent of S' up to canonical isomorphism (Lemma A.3). For the generalised DKSW construction with S not containing S_∞, its minus presentation uses a projective module V′ from Theorem 2.2; one must not identify it without proof with the original V^θ. Square projective or free presentations do not imply a nonzero determinant when trivial zeros occur.

**Hypotheses and conventions.**

- H/F abelian; S, T disjoint, S ∪ T ⊇ S_∞; for the presentation, conditions (A), (B) or (B_p), and (C).

**Proof plan.**

1. Local Weil-group extensions and the Ritter–Weiss modules V_w, W_w (local class field theory, Tau Ceti ClassFieldTheory Layers 6 and 9).
2. The global Tate sequence extension from the global class formation (Tau Ceti ClassFieldTheory Layer 11) and the Ritter–Weiss map of extensions θ; surjectivity of V → 𝔒 (DK Lemma A.1).
3. Snake lemma for 0 → J → V → W → 0 against 0 → C_H → 𝔒 → ΔG → 0 gives 0 → O^× → V^θ → W^θ → Cl → 0 and then (P1).
4. Projectivity of V^θ: cohomological triviality of 𝔒, of induced local unit modules for unramified v, and of V_w (Ritter–Weiss), with Nakayama's criterion (cohomologically trivial and torsion-free ⇒ projective) (DK Lemma A.4).
5. Independence of S' (DK Lemma A.3 and §A.2).

**Prerequisites.**

- `IntegralIwasawaTheory:I.6/smoothed-class-groups`
- `IntegralIwasawaTheory:I.6/cm-minus-parts-and-duals`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`
- `PadicMeasuresIwasawaAlgebras:L6/quadratic-presentation`
- `PadicMeasuresIwasawaAlgebras:L6/locally-quadratic-presentation`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma`
- `mathlib:groupCohomology`

**API.**

- `IntegralIwasawaTheory.ritterWeissModule` (constructor): ∇^T_S(H) = coker(V^θ → B^θ).
- `IntegralIwasawaTheory.ritterWeiss_classGroup_seq` (relation): (P1): 0 → Cl^T_S(H) → ∇^T_S(H) → X_{H,S} → 0 under (A).
- `IntegralIwasawaTheory.ritterWeiss_minus_seq` (relation): The minus part of (P1) is exact when some v ∈ S has c ∈ G_v.
- `IntegralIwasawaTheory.ritterWeiss_presentation` (structure): (P4): 0 → O^×_{H,S,T} → V^θ → B^θ → ∇ → 0 with V^θ, B^θ projective; quadratic under (A). In the generalised DKSW minus construction use its V′; no identification with the original V^θ is asserted.
- `IntegralIwasawaTheory.ritterWeiss_S'_indep` (characterisation): ∇^T_S(H) and its extension class do not depend on the auxiliary S'.
- `IntegralIwasawaTheory.ritterWeiss_baseChange` (functoriality): Compatibility with change of coefficients to Z_(p), Z_p[G]^- and character group rings R.
- `IntegralIwasawaTheory.ritterWeissModule_lift` (universal-property): A map from the chosen B-module killing the image of its V-module factors uniquely through ∇; the resulting module is independent of the auxiliary presentation.

**Checks.**

- `ritterWeiss_unramified_trivial` (degenerate): If H = F and Cl^T_S(F) = 0 then ∇^T_S(F) ≅ X_{F,S}.
- `ritterWeiss_rank` (computation): B^θ is free of rank #S' + #S'_ram − 1 (DK (145)), so a quadratic presentation of ∇ uses that many generators.
- `ritterWeiss_not_selmer` (non-example): ∇ is not isomorphic to the Selmer module itself but to a transpose of it; their Fitting ideals agree only after applying # (ritter-weiss-transpose).
- `ritterWeiss_P1_compat` (compatibility): The submodule Cl^T_S(H) in (P1) is the smoothed-class-groups module.

**Uses.**

- IntegralIwasawaTheory:I.7/surjection-from-nabla: Theorem 9.8: a surjection ∇_{R#} ↠ B̄_p(𝛙^{-1})
- IntegralIwasawaTheory:I.7/kurihara-fitting-formula: Appendix B computes higher Fitting ideals of ∇ by functoriality
- NoncommutativeAndEquivariantIwasawa:NE.6: the Ritter–Weiss machinery of the equivariant main conjecture

**Acceptance.**

- DK Remark A.7: over a Z_p[G]-algebra R, V^θ_R is free and ∇_R is quadratically presented for the sets (57), (59).

**Sources.**

- **DK-2023**, Appendix A, §A.1, equations (133)–(150), Definition A.2, Lemma A.1, Lemma A.3 and Lemmas A.4–A.5, pp. 78–86. Constructs the local modules V_w, W_w, the semilocal sequence, the global Tate extension and the map θ, defines ∇^{Σ'}_Σ(H) as a cokernel, proves property (P1), independence of S' and the locally quadratic presentation.
- **DKSW-BSZ**, §2.1, Theorems 2.1–2.2, pp. 6–8. States the properties of the generalised Ritter–Weiss modules ∇^T_S(H) with S ∪ T ⊇ S_∞: the class-group sequence, its minus part, and projective (quadratic) presentations under (A), (B) or (B_p), (C).
- **DK-2023**, §6, properties (P1)–(P4), pp. 39–40. Lists the four properties of ∇ used in the proof and explains what is new relative to Ritter–Weiss and Burns–Kurihara–Sano.

### Transpose, quadratic presentation and Fitting ideals of the Selmer module

**Theorem target:** `IntegralIwasawaTheory:I.6/ritter-weiss-transpose`.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against DK-2023 §6.1, Lemma 6.1 and Corollary 6.2, p. 40; Appendix A.4, Lemma A.8, pp. 86–87; KURIHARA §2.6, pp. 13–14. No local correction needed; imported proof inputs retain their stated supplier conditions.

(a) (P3) Under (A2) (resp. (A2')), the transpose of ∇^{Σ'}_Σ(H) for the presentation V^θ → B^θ is Sel^{Σ'}_Σ(H) (resp. after base change to R). (b) Hence for every character group ring quotient R of Z_p[G] (DK sets (57), (59)), Sel^{Σ'}_Σ(H)_R is quadratically presented and Fitt_R(Sel_R) = Fitt_{R#}(∇_{R#})^#, a principal ideal. (c) With s excess generators, Fitt^0_{R#}(M^{tr}) = (Fitt^s_R(M))^#. (d) For S ⊇ S_ram and (O^T_{K,S})^× torsion-free, Sel^T_S(K)_p^- and ∇^T_S(K)_p^- have quadratic presentations over Z_p[G]^-, and Fitt_{Z_p[G]^-}(Sel^T_S(K)_p^-) = (Fitt_{Z_p[G]^-}(∇^T_S(K)_p^-))^#; these are the finite-presentation hypotheses of Kurihara's finite-level theorems.

**Hypotheses and conventions.**

- As in ritter-weiss-module; R a character group ring quotient of Z_p[G].

**Proof plan.**

1. (a): apply Hom_Z(−, Z) ≅ Hom_{Z[G]}(−, Z[G]) to 0 → W^θ → B^θ → Z^θ → 0 and compare with the presentation (31) of Sel (DK Lemma A.8).
2. (b): transposes of quadratically presented modules and their Fitting ideals (PadicMeasuresIwasawaAlgebras L6/transpose-fitting; DK Lemma 6.1, Corollary 6.2).
3. (c): PadicMeasuresIwasawaAlgebras L6/transpose-higher-fitting (DK (175)).
4. (d): Kurihara §2.6 citing Burns–Kurihara–Sano Proposition 2.4(iv) and Lemma 2.8.

**Prerequisites.**

- `IntegralIwasawaTheory:I.6/ritter-weiss-module`
- `IntegralIwasawaTheory:I.6/selmer-module`
- `IntegralIwasawaTheory:I.6/cm-minus-parts-and-duals`
- `PadicMeasuresIwasawaAlgebras:L6/presentation-transpose`
- `PadicMeasuresIwasawaAlgebras:L6/transpose-stable-equivalence`
- `PadicMeasuresIwasawaAlgebras:L6/transpose-fitting`
- `PadicMeasuresIwasawaAlgebras:L6/transpose-higher-fitting`
- `PadicMeasuresIwasawaAlgebras:L6/fitting-quadratic`

**Acceptance.**

- DK Corollary 6.2: Fitt_R(Sel_R) = Fitt_{R#}(∇_{R#})^#.

**Sources.**

- **DK-2023**, §6.1, Lemma 6.1 and Corollary 6.2, p. 40; Appendix A.4, Lemma A.8, pp. 86–87. Proves that the transpose of ∇ for its projective presentation is the Selmer module, and that transposes of quadratically presented modules have Fitting ideals related by #.
- **KURIHARA**, §2.6, pp. 13–14. States that for S ⊇ S_ram(K/k) and torsion-free (O^T_{K,S})^×, Sel^T_S(K)^- and ∇^T_S(K)^- have quadratic presentations with principal Fitting ideals related by #.

### Extension classes of Ritter–Weiss modules via Galois cohomology

**Theorem target:** `IntegralIwasawaTheory:I.6/ritter-weiss-galois-cohomology`.

**Planet:** Galois-cohomological characterisation of ∇.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against DK-2023 §6.2, Lemma 6.3, equations (82)–(84) and Lemma 6.4, pp. 41–42; §A.5, Lemma A.9, pp. 87–89; DKSW-BSZ §2.1, Theorem 2.3, p. 8. No local correction needed; imported proof inputs retain their stated supplier conditions.

(a) (P2, Dasgupta–Kakde Lemma 6.4) Over Z[1/2] and on minus parts, with M = Cl^{Σ'}_Σ(H)^-, the extension class of 0 → M → ∇^- → X^-_{H,Σ} → 0 in Ext¹_{Z[G]^-}(X^-_{H,Σ}, M) ≅ ⊕_{v∈Σ} H¹(G_v, M) is the tuple (λ_v) of local restrictions of the class λ ∈ H¹(G_F, M) whose restriction to G_H is the Artin reciprocity map onto Gal(L/H) ≅ M; here restriction H¹(G_F, N) → H¹(G_H, N)^G is an isomorphism for every Z[G]^--module N. (b) (DKSW Theorem 2.3, all p) Assume (A) and (B) or (B_p), S ≠ ∅ and v_0 ∈ S. For a finite G-module N (a p-group under (B_p)), a 1-cocycle κ : G_F → N with κ(G_{F_{v0}}) = 0, κ unramified outside S ∪ T and tamely ramified at finite v ∈ T, and elements x_v (v ∈ S ∖ {v_0}) with κ(σ) = (σ − 1)x_v for σ ∈ G_{F_v}, there is a G-equivariant map ∇^T_S(H) → N whose image is generated by κ(G_F) and the x_v.

**Hypotheses and conventions.**

- (a): F totally real, H CM, 2 inverted. (b): (A), (B) or (B_p), S ≠ ∅.

**Proof plan.**

1. (a): H^i(G, N) = 0 for minus modules after inverting 2, since c acts as −1 and trivially on cohomology (DK Lemma 6.3; Tau Ceti ProfiniteCohomology Layer 5 inflation–restriction).
2. Compute the class of ∇^- through the cocycles γ_v(g) = gx − x for lifts x of ½(w − w̄) (DK (84)) and compare with the explicit Ritter–Weiss cocycle for λ (DK §A.5, Lemma A.9).
3. (b): DKSW §4.6 through their duality theorem for class formations (DKSW §5).

**Prerequisites.**

- `IntegralIwasawaTheory:I.6/ritter-weiss-module`
- `IntegralIwasawaTheory:I.6/cm-minus-parts-and-duals`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`

**Acceptance.**

- DK Theorem 9.8 uses (a) to complete diagram (125) by a surjection ∇_{R#} ↠ B̄_p(𝛙^{-1}).

**Sources.**

- **DK-2023**, §6.2, Lemma 6.3, equations (82)–(84) and Lemma 6.4, pp. 41–42; §A.5, Lemma A.9, pp. 87–89. Shows that restriction is an isomorphism on minus modules, defines the canonical class λ and its local components λ_v, and proves that the minus extension class of ∇ equals (λ_v).
- **DKSW-BSZ**, §2.1, Theorem 2.3, p. 8. Characterises maps from ∇^T_S(H) to finite G-modules by cocycles with prescribed local behaviour, valid for all p including p = 2.

## IntegralIwasawaTheory:I.7

### Inclusion of Fitting ideals implies equality

**Theorem target:** `IntegralIwasawaTheory:I.7/inclusion-implies-equality`.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against DK-2023 §5, Theorem 5.1 and Lemmas 5.2–5.7, Remark 5.8, pp. 31–39; §2.3, pp. 16–18; DKSW-BSZ §2.5, Theorem 2.7, Theorem 2.10 and Lemmas 2.11–2.13, pp. 12–17. No local correction needed; imported proof inputs retain their stated supplier conditions.

Fix p, a CM abelian H/F, an odd character χ of the prime-to-p part G' of G, R = O[G_p]_χ the corresponding component (for p = 2, the components of Z_2[G]^-), and the sets Σ = S_∞ ∪ {v ∈ S_ram : v | p}, Σ' = T ∪ {v ∈ S_ram : v ∤ p} (DK (57)–(59); for p = 2 the DKSW sets with an archimedean place moved and the factor 2^t). Suppose that in every such situation Sel^{Σ'}_Σ(H)_R is quadratically presented and Fitt_R(Sel^{Σ'}_Σ(H)_R) ⊆ (Θ^#_{Σ,Σ'}) (resp. Fitt(∇_{p,−}) ⊆ (Θ_{Σ,Σ'}/2^t)). Then each inclusion is an equality.

**Hypotheses and conventions.**

- All CM abelian extensions H/F of the given type and all components χ are considered simultaneously; p arbitrary (DK for p odd, DKSW §2.5 for p = 2).

**Proof plan.**

1. Trivial zeros: on characters ψ with ψ(G_v) = 1 for some v ∈ Σ both sides vanish (I.6/smoothed-stickelberger (d); I.6/selmer-module (f)), so pass to the trivial-zero-free quotient.
2. Reduce by induction on the field: descend the R-component of the Selmer module to H_χ and to subfields (DK Lemmas 4.1–4.3, 5.2, 5.4).
3. Compare orders: a quadratically presented module with principal Fitting ideal (x) over a character group ring has order #O/∏ψ(x) (PadicMeasuresIwasawaAlgebras L6/quadratic-cardinality and character-group-ring-index).
4. Compute #Cl^{Σ'}(H)^∨ components by the minus class number formula (I.6/minus-class-number-formula) together with Lemmas 5.5–5.7 for the norm element of the minimal inertia group, and conclude that the quotient of generators is a unit (DK §5; DKSW Theorem 2.7, Lemmas 2.11–2.13).

**Prerequisites.**

- `IntegralIwasawaTheory:I.6/selmer-module`
- `IntegralIwasawaTheory:I.6/smoothed-stickelberger`
- `IntegralIwasawaTheory:I.6/minus-class-number-formula`
- `IntegralIwasawaTheory:I.6/ritter-weiss-transpose`
- `PadicMeasuresIwasawaAlgebras:L6/quadratic-cardinality`
- `PadicMeasuresIwasawaAlgebras:L6/character-group-ring-index`
- `PadicMeasuresIwasawaAlgebras:L6/character-group-ring-unit-criterion`
- `PadicMeasuresIwasawaAlgebras:L6/norm-element-kernel`
- `PadicMeasuresIwasawaAlgebras:L6/fitting-extension`

**Acceptance.**

- DK §2.3, p. 18: in the conductor-one case, (11) and (12) force the inclusion of Fitting ideals to be an equality.

**Sources.**

- **DK-2023**, §5, Theorem 5.1 and Lemmas 5.2–5.7, Remark 5.8, pp. 31–39; §2.3, pp. 16–18. Proves that an inclusion Fitt_R(Sel_R) ⊆ (Θ^#) in every situation implies equality, using the analytic class number formula, descent of components and the size of quadratically presented modules.
- **DKSW-BSZ**, §2.5, Theorem 2.7, Theorem 2.10 and Lemmas 2.11–2.13, pp. 12–17. Proves the inclusion-implies-equality theorem at p = 2 for the generalised Ritter–Weiss modules with the factor 2^t.

### A cuspidal group-ring family congruent to an Eisenstein series

**Theorem target:** `IntegralIwasawaTheory:I.7/extra-congruence-cusp-form`.

**Planet:** Extra-congruence cusp form.

**Review — unverifiable.** Separated the odd-prime cusp congruences from the DKSW minimal-set construction; defined d = [F:Q] independently of the level. Corrected the source statement, but the constant-term correction and full all-prime modular supplier interface remain missing.

For p odd: Let R be the trivial-zero-free character group ring quotient of a component of O[G] (DK §7.1), 𝛙 the canonical character, n = cond(H/F)∏_{𝔩∈T}𝔩, P the p-part of n and x = Θ_{S∞}(1 − k)/Θ_{S∞}(0) ∈ R (a non-zerodivisor ≡ ∏_{𝔭|p}(1 − χ(𝔭)^{-1}) mod 𝔪_R). For k ≡ 1 mod (p − 1)p^N with N large there is a p-ordinary cuspidal group-ring family F_k(𝛙) ∈ S_k(nP', R, 𝛙)^{p-ord} with: case 1a (P = 1, some χ(𝔭) = 1): F_k(𝛙) ≡ x·W_1(𝛙, 1) − W_k(𝛙, 1_p) mod xΘ^#; case 1b (P = 1, all χ(𝔭) ≠ 1): F_k(𝛙) ≡ W_1(𝛙_p, 1) mod Θ^#; case 2 (P ≠ 1): F_k(𝛙) ≡ W_1(𝛙_{𝔓𝔓''}, 1) mod Θ^#; congruences are of all Fourier coefficients. For p = 2 use the separate DKSW construction: write d = [F:Q]. If no p-adic prime ramifies, take Σ = {ℓ}, with ℓ ∤ np unramified and Frob_ℓ = c; otherwise take Σ = {v ∈ S_ram : v | p}. In both cases Σ′ = T ∪ {v ∈ S_ram : v ∤ p} ∪ S_∞, with T containing no p-adic prime. Work on the Galois-stable odd trivial-zero-free character quotient R_{Φ_0}. Choose m so large that Θ^#/2^d divides p^m and k > 1 odd with k ≡ 1 mod (p−1)p^N and ε_cyc^{k−1} ≡ 1 mod p^m. DKSW Theorems 3.2–3.5 and Corollaries 3.6, 3.8 give the ordinary cusp congruences modulo xΘ^#/2^d, at the indicated raised level; the unramified case also uses the ℓ-old forms. These are not obtained by simply changing the modulus in the odd-prime τ-basis argument.

**Hypotheses and conventions.**

- For the DK odd-prime construction, its component, level and weight hypotheses as stated.
- For the dyadic construction, the disjoint minimal sets Σ, Σ′ and character quotient of DKSW Theorem 2.14; d = [F:Q]; m, N and k as stated. The auxiliary ℓ is chosen so its Frobenius is nonscalar on the finitely many relevant eigenform representations (DKSW Lemma 3.10).

**Proof plan.**

1. Group-ring Eisenstein series E_k(𝛙, 1), the modified series W_k(𝛙, 1) with integral nonconstant coefficients, and the ordinary projector formula: AutomorphicPadicLFunctions L3/group-ring-eisenstein-families.
2. Constant terms at all cusps (DK Propositions 8.4, 8.6, 8.7): AutomorphicPadicLFunctions L3/eisenstein-constant-terms.
3. Hida–Silliman forms V_k ≡ 1 mod p^m (DK Theorem 8.8) and Silliman's group-ring forms with prescribed constant terms (DK Theorem 8.9) and the cuspidal correction (DK Theorem 8.15).
4. Form x W_1 V_{k−1} − W_k − xΘ^#H_k (case 1) or e^ord_P(W_1 V_{k−1} − Θ^#H_k) (case 2), cuspidal by Theorems 8.17–8.18; apply e^ord and the factors (U_𝔭 − 𝛙(𝔭)) (DK Corollaries 8.19, 8.21; PadicFamilies L0a ordinary projector).
5. For p = 2, use DKSW Theorem 2.14, pp. 17–18, to reduce to these minimal sets. Choose the auxiliary prime by Lemma 3.10, and use the separate ℓ-old cusp form construction and congruences in §3.2, pp. 24–26. Here t = #(Σ′ ∩ S_∞) = d; n in the ideal level is unrelated to d.
6. The cited supplier nodes cover Eisenstein series and constant terms, but the Hida–Silliman forms V_k ≡ 1 and the group-ring cuspidal correction are additional nonroutine inputs. Request their exact all-prime/level statements from the Hilbert-form owner, rather than using the narrower p-odd Λ-adic PadicFamilies L5 contract (G-I7-MODULAR-SUPPLIERS).

**Prerequisites.**

- `AutomorphicPadicLFunctions:L3/group-ring-eisenstein-families`
- `AutomorphicPadicLFunctions:L3/eisenstein-constant-terms`
- `AutomorphicPadicLFunctions:L3/hilbert-eisenstein-series`
- `PadicFamilies:L0a/finite-ordinary-projector`
- `PadicFamilies:L5/lambda-adic-hilbert-forms`
- `IntegralIwasawaTheory:I.6/smoothed-stickelberger`
- `IntegralIwasawaTheory:I.3/deligne-ribet-dictionary`
- `AutomorphicBundles:B5/hilbert-expansion-principle`

**Acceptance.**

- DK Remark 8.20: the congruence (105) is a congruence of all Fourier coefficients c(m, ·).

**Sources.**

- **DK-2023**, §8, Lemma 8.1, Theorems 8.8–8.9, 8.15, 8.17–8.18, Lemma 8.16, Corollaries 8.19 and 8.21, pp. 50–62. Constructs modified Eisenstein series, corrects them to cusp forms using Silliman's results, and obtains p-ordinary cuspidal group-ring families congruent to Eisenstein series modulo xΘ^# or Θ^#.
- **DKSW-BSZ**, §3.2, Theorems 3.2–3.3, 3.5, Corollaries 3.6 and 3.8, pp. 24–26. Adapts the construction to p = 2 with the auxiliary prime and the factor 2^n.

### The Eisenstein homomorphism on the group-ring Hecke algebra

**Theorem target:** `IntegralIwasawaTheory:I.7/group-ring-hecke-eisenstein-homomorphism`.

**Review — corrected.** Replaced the false embedding of the dyadic Hecke algebra into a product of coefficient rings by its possibly nonreduced finite algebra and exact cancellation contract.

Let T ⊆ T̃ be the Hecke algebras over R generated by T_𝔩 (𝔩 ∤ np) and S(𝔪) (resp. also U_𝔭 for 𝔭 | p) acting on the p-ordinary group-ring cusp forms of extra-congruence-cusp-form, 𝔐 the Eisenstein maximal ideal (kernel of the mod 𝔪_R eigencharacter of F_k(𝛙)), and, for p odd, T_𝔐 ⊆ T̃_𝔐 ⊆ ∏_{f∈M̄} O the completed finite coefficient orders (M̄ the ordinary newforms congruent to the Eisenstein system). Then there are a non-zerodivisor x ∈ R, an R/xΘ^#-algebra W and a surjective R-algebra map φ : T̃_𝔐 → W such that: R/xΘ^# → W is injective; on T_𝔐, φ(S(𝔪)) = 𝛙(𝔪), φ(U_𝔭) = 1 for 𝔭 | P and φ(T_𝔩) = ε_cyc^{k−1}(𝔩) + 𝛙(𝔩); and for U = ∏_{𝔭|P'}(U_𝔭 − 𝛙(𝔭)), φ(U)y = 0 with y ∈ R implies y ∈ (Θ^#). For p = 2, the coefficient algebra is instead a finite order in K = ∏_f K_f, with K_f a coefficient field or the finite quadratic algebra arising from U_ℓ on an ℓ-old space; K_f can be nonreduced. Put A = Θ^#/2^d with the minimal sets and d = [F:Q] of extra-congruence-cusp-form. The map φ : T̃_𝔐 → W induces T_𝔐/I ≅ R/(xA), so R → T_𝔐/I is surjective, and satisfies φ(Uy) = 0 ⇒ y ∈ (A) for y ∈ R, with U the specified product of U_v−𝛙(v). It is this cancellation statement, together with the local factors of hecke-galois-representation, that is required in DKSW Theorem 2.16.

**Hypotheses and conventions.**

- As in extra-congruence-cusp-form; x as there in case 1a and x = 1 otherwise.

**Proof plan.**

1. W is the image of the T̃-span of F_k(𝛙) in ∏_𝔞 R/xΘ^# under Fourier coefficients (DK proof of Theorem 8.23).
2. Hecke formulas (97) for group-ring forms show the map is Hecke-equivariant; Artin–Rees for the completions.
3. The last property uses the factor x in the congruence of case 1a (DK p. 77).
4. Use the precise quotient and cancellation statement in DKSW Theorem 3.9, pp. 26–27. In the ℓ-old case retain the quadratic U_ℓ algebra and its possible nilpotents; no embedding of T̃ into a product of fields is asserted.

**Prerequisites.**

- `IntegralIwasawaTheory:I.7/extra-congruence-cusp-form`
- `PadicFamilies:L5/nearly-ordinary-hecke-algebra`
- `PadicFamilies:L5/hecke-total-fraction-ring`
- `PadicFamilies:L5/hilbert-hecke-reduced`
- `AutomorphicBundles:B5/hecke-expansion-compatibility`

**Acceptance.**

- DK Theorem 8.23(ii): φ(T_𝔩) = ε^{k−1}_cyc(𝔩) + 𝛙(𝔩) for 𝔩 ∤ np.

**Sources.**

- **DK-2023**, §8.5, Lemma 8.22 and Theorem 8.23, pp. 62–65. Defines the Hecke algebras of p-ordinary group-ring cusp forms, the Eisenstein maximal ideal and the surjection φ onto W with R/xΘ^# ↪ W and the stated values and cancellation property.
- **DKSW-BSZ**, §3.1–3.2, Lemma 3.1 and Theorem 3.9, pp. 22–27. Gives the version with Θ^#/2^n and a possibly non-reduced Hecke algebra at p = 2.

### The Galois representation of the Eisenstein-localised Hecke algebra

**Theorem target:** `IntegralIwasawaTheory:I.7/hecke-galois-representation`.

**Review — unverifiable.** Separated the distinct-residual τ basis from the dyadic representation with its local triangular bases and nonreduced coefficient algebra. The source construction is clear, but its listed ordinary-Galois supplier excludes p=2 and odd-degree F.

For p odd: With K = Frac(T_𝔐) = ∏_{f∈M̄} E (the reduced odd-prime case), there is a continuous ρ = ∏_f ρ_f : G_F → GL_2(K) unramified outside np, with characteristic polynomial x² − T_𝔩 x + 𝛙(𝔩)ε^{k−1}_cyc(𝔩) at Frob_𝔩 for 𝔩 ∤ np (DK (113)), whose restriction to each decomposition group at 𝔭 | p has the ordinary shape (𝛙η_𝔭^{-1}ε^{k−1}_cyc ∗; 0 η_𝔭) with η_𝔭 unramified and η_𝔭(rec(ϖ^{-1})) = U_𝔭 (DK (114)); its characteristic polynomials lie in T_𝔐[x] and factor residually as (x − ε^{k−1}_cyc)(x − 𝛙); there is τ ∈ G_F with χ(τ) ≠ 1 moving every local ordinary line V_{𝔭,f} (Proposition 9.3), so in a basis of ρ(τ)-eigenvectors the off-diagonal entries satisfy A_{f,𝔭} ≠ 0 and C_{f,𝔭} ≠ 0 (key point (111)). The inputs are: Wiles's ordinary Hilbert representations, irreducibility on open subgroups for non-CM forms (Ribet; Balasubramanyam–Ghate–Vatsal), splitting of p in the CM field for p-ordinary CM forms (Hara–Ochiai), and the CM ordinary line moved by complex conjugation. For p = 2 use K = Frac(T̃_𝔐) with the finite local principal factors K_f of the preceding construction. Assemble ρ_f over these factors; the reduction in each field factor is irreducible. Its characteristic polynomial lies in T_𝔐[X] and is congruent to (X−χ)(X−𝛙) modulo I, χ = ε_cyc^{k−1}. On each v ∈ Σ ∪ P, P = {v | p : v ∉ Σ}, provide a local lower-triangular basis with characters (η_v, ξ_v), ξ_v ≡ 𝛙 on G_v for v ∈ Σ, and ξ_v ≡ χ on inertia for v ∈ P. The product ∏_{v∈P}(ξ_v(σ_v)−χ(σ_v)) agrees with the Hecke cancellation factor up to units as required by DKSW Theorem 2.16. No global basis with distinct residual eigenvalues is available or required at 2. The full arithmetic range is a target: the particular R19.2 prerequisite currently listed does not cover p = 2 or odd-degree F, so those cases are not dependency-closed.

**Hypotheses and conventions.**

- As in group-ring-hecke-eisenstein-homomorphism; p odd in DK, p = 2 in DKSW with auxiliary prime.

**Proof plan.**

1. The cited R19.2/wiles-ordinary-hilbert-representation is restricted to p odd and even [F:Q]. It therefore supplies only that subcase. The p = 2 and arbitrary-degree finite-weight ordinary representations, with the Hecke normalisation and local lines required by DKSW Theorem 3.14, need a widened R19.2 contract (G-I7-GALOIS-SUPPLIER).
2. Non-CM f: R19.2/virtual-reducibility-implies-cm gives irreducibility on open subgroups (DK Lemma 9.1). CM f: R19.2/ordinary-cm-primes-split and R19.2/cm-ordinary-line-complex-conjugation (DK Lemma 9.2).
3. For p odd choose τ by DK Proposition 9.3 and split its two distinct residual roots by Hensel’s lemma. This step is confined to the residually distinguishable component.
4. In the odd-prime case assemble the representations over the product of coefficient fields. For p = 2, retain the ℓ-old quadratic algebras, use nonscalar Frobenius from Lemma 3.10, and the simultaneous local statements of DKSW Theorem 3.14, pp. 27–30. Check each local congruence and the unit factors against Theorem 2.16.

**Prerequisites.**

- `IntegralIwasawaTheory:I.7/group-ring-hecke-eisenstein-homomorphism`
- `AutomorphicGaloisRepresentations:R19.2/wiles-ordinary-hilbert-representation`
- `AutomorphicGaloisRepresentations:R19.2/virtual-reducibility-implies-cm`
- `AutomorphicGaloisRepresentations:R19.2/ordinary-cm-primes-split`
- `AutomorphicGaloisRepresentations:R19.2/cm-ordinary-line-complex-conjugation`
- `AutomorphicGaloisRepresentations:R19.2/hilbert-uniqueness-determinant-oddness-irreducibility`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3/hida-family-representation`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Acceptance.**

- DK (111): A_{f,𝔭} ≠ 0 and C_{f,𝔭} ≠ 0 for every f ∈ M̄ and every 𝔭 | p.

**Sources.**

- **DK-2023**, §9.1–9.2, Lemmas 9.1–9.2, Proposition 9.3, equations (110)–(116), pp. 65–69. Attaches to each ordinary eigenform its Galois representation with the ordinary local shape, proves the needed irreducibility and the existence of τ moving all local eigenspaces, and assembles ρ over the total ring of fractions.
- **DKSW-BSZ**, §3.3, Lemmas 3.10–3.12 and Theorem 3.14, pp. 27–30. Constructs ρ at p = 2 when the Hecke algebra is not reduced because of old forms at the auxiliary prime.

### The Ribet module and cohomology class of the Eisenstein ideal

**Construction target:** `IntegralIwasawaTheory:I.7/eisenstein-cohomology-class`.

**Review — unverifiable.** Added the dyadic local Ribet module, local generators and the finite-lattice/topology verification required by current upstream. Corrected the dyadic algebra and local data, but the exact local weighted supplier contract for all residual components is not available.

For p odd in the distinct-residual setting: In a basis of ρ(τ)-eigenvectors write ρ(σ) = (a(σ) b(σ); c(σ) d(σ)). Let Ĩ = ker φ ⊆ T̃_𝔐 and I = Ĩ ∩ T_𝔐. Then tr ρ(σ) ≡ ε^{k−1}_cyc(σ) + 𝛙(σ) mod I, a(σ) ≡ ε^{k−1}_cyc(σ) and d(σ) ≡ 𝛙(σ) mod I. Let B_0 be the T_𝔐-module generated by the b(σ), B = (B_0, A_𝔭/C_𝔭 : 𝔭 ∈ Σ ∖ S_∞), B' = B(I_p) the submodule generated by b of inertia at the primes above p not in Σ, and B̄_p = B/(IB, B', p^m B) with submodule B̄_0. Then κ(σ) = b(σ)𝛙(σ)^{-1} defines a class κ ∈ H¹(G_F, B̄_p(𝛙^{-1})) (with ε_cyc^{k−1} ≡ 1 after the choice of k) that is unramified away from Σ', tamely ramified at Σ', locally trivial at Σ, and whose cocycle values generate B̄_0. The general algebra (Ribet modules with local conditions, the cocycle and its Fitting bound) is IntegralHeckeAndGaloisDeterminants IHG.6; this node verifies its hypotheses for the Hilbert–Eisenstein representation. For p = 2 the τ-eigenbasis construction is replaced by IHG.6 local_ribet. Apply it to T_𝔐 ⊂ T̃_𝔐, χ = ε_cyc^{k−1} and ψ = 𝛙, with the local triangular data above. Its difference-matrix construction supplies a finite T_𝔐-module N_0, a continuous cocycle κ_0 ∈ Z¹(G_F,N_0(χψ^{-1})), and elements y_v for v ∈ Σ ∖ {v_0}. They satisfy κ_0(G_{v_0}) = 0, κ_0(σ) = (χψ^{-1}(σ)−1)y_v on G_v, and κ_0(I_v) = 0 for v ∈ P. The module is generated by the cocycle values together with these y_v. Put N̄ = N_0/(IN_0+p^mN_0). Because χ ≡ 1 mod p^m and R → T/I is surjective, κ_0 reduces to a cocycle with values in N̄(ψ^{-1}), satisfying DKSW Theorem 2.3 and generating N̄ together with the local y_v. A class-group map alone need not generate N̄. Supplier limitation: the current IHG.6 local_ribet signature assumes χ ≡ ψ modulo m_T. Apply that signature only on components satisfying this hypothesis. Components with distinct residual characters need a local weighted theorem with the same nonreduced coefficient and topology hypotheses; the distinct-character global theorem alone does not supply it (G-I7-RIBET-RESIDUAL).

**Hypotheses and conventions.**

- As in hecke-galois-representation; m ≥ ord_p(#G_p).

**Proof plan.**

1. For p odd, obtain the trace congruence by Hecke eigenvalues and Chebotarev; the τ argument gives diagonal congruences because the residual roots are distinct. This argument is not used at p = 2.
2. For p odd, matrix multiplication gives the upper-right cocycle modulo IB. At p = 2 import the difference-matrix/local-generator construction of IHG.6 local_ribet rather than dividing by an eigenvalue gap.
3. Ramification: unramified at 𝔩 ∤ np by ρ; tame at Σ' by pro-p cohomology of tame inertia (DK Proposition 9.4); unramified above p outside Σ by quotienting by B'; locally trivial at Σ by (116) and φ(U_𝔭) = 1 (DK Proposition 9.5).
4. Verify the extra current-upstream topology hypothesis as follows. Each field-valued ρ_f has a stable coefficient lattice, and the finitely many K_f are finite-dimensional p-adic algebras, including the quadratic nonreduced factors. Compactness bounds all matrix entries in a finite O-lattice. Enlarge that lattice to contain the two difference modules and their products, and close it under the finite O-algebra T; this is still finite. The induced topology and the m_T-adic topology agree on this lattice by the finite-module adic topology theorem (T is a finite local O-algebra). Supply this lattice to local_ribet. If a packaging supplier does not expose that topology theorem, it must be included in the IHG.6 contract.
5. At p = 2 reduce modulo I and p^m only after obtaining the local generators and weighted Fitting bound. The ramification outside Σ ∪ Σ′ ∪ P comes from ρ, inertia at P is killed by the local theorem, and finite places in Σ′ have residue characteristic different from p, giving the tame condition (DKSW Theorem 2.16, pp. 20–21).
6. Check hres explicitly before invoking current upstream local_ribet. At p = 2, ψ can have nontrivial odd-order residual part on G′, so χ ≡ 1 does not imply χ ≡ ψ. In those components the all-component theorem still needs a distinct-residual local interface (G-I7-RIBET-RESIDUAL).

**Prerequisites.**

- `IntegralIwasawaTheory:I.7/hecke-galois-representation`
- `IntegralHeckeAndGaloisDeterminants:IHG.6/ribet-difference-modules`
- `IntegralHeckeAndGaloisDeterminants:IHG.6/canonical-ribet-cocycle`
- `IntegralHeckeAndGaloisDeterminants:IHG.6/local-ribet-quotient`
- `IntegralIwasawaTheory:I.6/smoothed-class-groups`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`

**API.**

- `IntegralIwasawaTheory.eisensteinIdealHecke` (constructor): Ĩ = ker φ ⊆ T̃_𝔐 and I = Ĩ ∩ T_𝔐.
- `IntegralIwasawaTheory.ribetModule` (constructor): B_0, B, B' = B(I_p) and B̄_p = B/(IB, B', p^m B) as T_𝔐-modules. In the dyadic branch use the separate local-Ribet N_0 and N̄ = N_0/(IN_0+p^mN_0), including the y_v.
- `IntegralIwasawaTheory.ribetClass` (constructor): κ ∈ H¹(G_F, B̄_p(𝛙^{-1})), κ(σ) = b(σ)𝛙(σ)^{-1}. In the dyadic branch use the difference-matrix cocycle κ_0 reduced in N̄(ψ^{-1}).
- `IntegralIwasawaTheory.ribetClass_unramified` (characterisation): κ is unramified away from Σ', tame at Σ' and locally trivial at Σ. At 2 the representative is zero at v_0 and a specified coboundary with generator y_v at each other v ∈ Σ.
- `IntegralIwasawaTheory.ribetClass_generates` (characterisation): The values κ(G_F) generate B̄_0 over R. This upper-right statement is for p odd. At 2 the cocycle values and y_v together generate N̄.
- `IntegralIwasawaTheory.ribetClass_classGroup` (relation): Class field theory turns κ into a surjection Cl^{Σ'}_Σ(H)_{R#} ↠ B̄_0(𝛙^{-1}). This is the distinct-residual odd-prime branch; the dyadic target uses ∇ and its local generators directly.
- `IntegralIwasawaTheory.dyadicRibet_quotient` (compatibility): The quotient N_0 → N̄ carries the cocycle and every local y_v to the corresponding reduced data; these data, rather than cocycle values alone, determine the generating map.

**Checks.**

- `ribetModule_faithful` (characterisation): B_0 is generated over R by finitely many non-zerodivisors of K (DK Lemma 9.9).
- `ribetClass_trivial_case` (degenerate): If I = T_𝔐 (no Eisenstein congruence) then B̄_p = 0 and κ = 0.
- `ribetClass_ramified_above_p` (non-example): Without dividing by B' = B(I_p), κ need not be unramified at primes above p outside Σ; DK §1.3 explains that the resulting class does not land in the class group.
- `ribetClass_IHG6_compat` (compatibility): The odd-prime κ is the distinct-character instance of IHG.6. The dyadic instance must instead supply the local_ribet finite lattice, its adic topology, local generators and weighted Fitting bound.
- `dyadicRibet_local_generators` (non-example): When Σ has more than one place, local_ribet generates N̄ by κ(G_F) and the y_v; asserting generation by κ alone drops the local part needed for the ∇ surjection.

**Uses.**

- IntegralIwasawaTheory:I.7/surjection-from-nabla: κ and the vectors A_𝔭/C_𝔭 give the extension classes matched with ∇
- IntegralIwasawaTheory:I.7/fitting-ideal-calculation: Fitt_R(B̄_p) is bounded by (Θ^#)

**Acceptance.**

- DK Corollary 9.6: a canonical R^#-surjection α : Cl^{Σ'}_Σ(H)_{R#} ↠ B̄_0(𝛙^{-1}).

**Sources.**

- **DK-2023**, §9.3, equations (117)–(124), Propositions 9.4–9.5 and Corollary 9.6, pp. 69–72. Defines the Eisenstein ideals, the modules B_0, B, B' and B̄_p, the cohomology class κ and proves its ramification properties and the surjection from the class group.
- **DKSW-RIBET**, §2, Theorem 2.1 and §2.1, pp. 7–10. Constructs the module N and the cocycle with local conditions in the general GL_2 setting, without residual distinguishability.
- **DKSW-RIBET**, Remark 2.2, p. 8. States that the local theorem also holds without residual coincidence and points to the b-coefficient method. The current IHG.6 local_ribet signature is narrower, so its extension remains an explicit supplier request.

### A surjection from the Ritter–Weiss module

**Theorem target:** `IntegralIwasawaTheory:I.7/surjection-from-nabla`.

**Review — unverifiable.** Specified the dyadic surjection from the generalised Ritter–Weiss module using all local generators. Corrected the dyadic algebra and local data, but the exact local weighted supplier contract for all residual components is not available.

For p odd: There is an R^#-module surjection β : ∇^{Σ'}_Σ(H)_{R#} ↠ B̄_p(𝛙^{-1}) completing the diagram whose rows are 0 → Cl^{Σ'}_Σ(H)_{R#} → ∇_{R#} → (X_{H,Σ})_{R#} → 0 and 0 → B̄_0 → B̄_p → B̄_1 → 0, with outer maps α (from eisenstein-cohomology-class) and γ : (X_{H,Σ})_{R#} ↠ B̄_1(𝛙^{-1}) (DK Proposition 9.7). At p = 2 apply DKSW Theorem 2.3 to N̄(ψ^{-1}), the representative κ and all y_v to obtain ∇^{Σ′}_Σ(H)_R ↠ N̄(ψ^{-1}). Surjectivity uses their joint generation from local_ribet, not a claimed surjection from the class-group term alone. Supplier limitation: the current IHG.6 local_ribet signature assumes χ ≡ ψ modulo m_T. Apply that signature only on components satisfying this hypothesis. Components with distinct residual characters need a local weighted theorem with the same nonreduced coefficient and topology hypotheses; the distinct-character global theorem alone does not supply it (G-I7-RIBET-RESIDUAL).

**Hypotheses and conventions.**

- As in eisenstein-cohomology-class.

**Proof plan.**

1. Compare the two extension classes in Ext¹_{R#}((X_{H,Σ})_{R#}, B̄_0(𝛙^{-1})) after pushout by α and pullback by γ; by I.6/ritter-weiss-galois-cohomology (P2) the class of ∇ is the tuple of local classes λ_v, which match the local values of κ (DK proof of Theorem 9.8).
2. Equal extension classes give the completing map; surjectivity from surjectivity of α and γ.
3. At p = 2 verify every condition of DKSW Theorem 2.3 from the reduced local_ribet data: zero at v_0, specified local coboundaries elsewhere in Σ, ramification only in Σ ∪ Σ′ and tameness at finite Σ′. Its image contains κ(G_F) and the y_v, so it is all of N̄(ψ^{-1}).

**Prerequisites.**

- `IntegralIwasawaTheory:I.7/eisenstein-cohomology-class`
- `IntegralIwasawaTheory:I.6/ritter-weiss-galois-cohomology`
- `IntegralIwasawaTheory:I.6/ritter-weiss-module`
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`

**Acceptance.**

- DK Theorem 9.8.

**Sources.**

- **DK-2023**, §9.4, Proposition 9.7 and Theorem 9.8, pp. 73–75. Constructs γ from the elements A_𝔭/C_𝔭 and proves that the extension class of ∇ maps to that of B̄_p, yielding the surjection β.
- **DKSW-BSZ**, §2.7, proof of Theorem 2.16, pp. 20–21. Applies Theorem 2.3 to obtain a surjection ∇^{Σ'}_Σ(H)_R → N from the cocycle.

### The Fitting-ideal bound

**Theorem target:** `IntegralIwasawaTheory:I.7/fitting-ideal-calculation`.

**Review — unverifiable.** Restored the weighted local Fitting bound and its cancellation argument; the unweighted global Ribet theorem is insufficient. Corrected the dyadic algebra and local data, but the exact local weighted supplier contract for all residual components is not available.

For p odd, Fitt_R(B̄_p) ⊆ (Θ^#), hence the corresponding ∇ and Selmer bounds follow by the surjection and transpose. For p = 2 put A = Θ^#/2^d in the DKSW minimal-set case. The local Ribet theorem gives the weighted bound P_loc·Fitt_T(N_0) ⊆ Ĩ, where P_loc = ∏_{v∈P}(ξ_v(σ_v)−χ(σ_v)). It does not assert Fitt_T(N_0) ⊆ I. The Hecke cancellation property, R → T/I surjective, and A | p^m then yield Fitt_R(N̄) ⊆ (A). Twisting and the dyadic ∇ surjection give Fitt(∇_{p,−}) ⊆ (Θ/2^d); inclusion-implies-equality and change of depletion/smoothing sets give the general t = #(Σ′ ∩ S_∞) formulation. Supplier limitation: the current IHG.6 local_ribet signature assumes χ ≡ ψ modulo m_T. Apply that signature only on components satisfying this hypothesis. Components with distinct residual characters need a local weighted theorem with the same nonreduced coefficient and topology hypotheses; the distinct-character global theorem alone does not supply it (G-I7-RIBET-RESIDUAL).

**Hypotheses and conventions.**

- As in surjection-from-nabla.

**Proof plan.**

1. Generate B̄_p by c_i = b(σ_i)𝛙(𝔭_i)ε^{1−k}_cyc(σ_i) (one for each 𝔭_i | P') and non-zerodivisor generators b_j (Lemma 9.9).
2. Rewrite each relation row as an identity in B with factors (U_{𝔭_j} − 𝛙(𝔭_j) + I); the matrix M' over K has determinant 0, cancel the non-zerodivisors A_j/C_j and b_j, and apply φ: 0 = φ(U)(det M + p^m R) in W (DK proof of Theorem 9.10).
3. By group-ring-hecke-eisenstein-homomorphism, det M ∈ (Θ^#) since Θ^# | p^m (DK Lemma 8.1).
4. At 2 use IHG.6 local_ribet with its finite lattice/topology input, not merely global_ribet. Given y ∈ Fitt_R(N̄), lift its Fitting relation modulo I and p^m to get y+i+p^mr ∈ Fitt_T(N_0), with i ∈ I and r ∈ R. Multiplying by P_loc gives P_loc(y+p^mr) ∈ Ĩ. The Hecke cancellation property implies y+p^mr ∈ (A), and A | p^m implies y ∈ (A) (DKSW Theorem 2.16, pp. 20–21).
5. Pass from B̄_p to ∇ and Sel by surjection-from-nabla and I.6/ritter-weiss-transpose (DK Corollary 9.11).

**Prerequisites.**

- `IntegralIwasawaTheory:I.7/surjection-from-nabla`
- `IntegralIwasawaTheory:I.7/group-ring-hecke-eisenstein-homomorphism`
- `IntegralHeckeAndGaloisDeterminants:IHG.6/weighted-fitting-containment`
- `IntegralHeckeAndGaloisDeterminants:IHG.6/global-ribet-theorem`
- `IntegralHeckeAndGaloisDeterminants:IHG.6/local-ribet-theorem`
- `IntegralHeckeAndGaloisDeterminants:IHG.6/distinct-character-ribet`
- `IntegralIwasawaTheory:I.6/ritter-weiss-transpose`
- `PadicMeasuresIwasawaAlgebras:L6/fitting-quadratic`

**Acceptance.**

- DK Corollary 9.11: Fitt_R(Sel^{Σ'}_Σ(H)_R) ⊆ (Θ^#).

**Sources.**

- **DK-2023**, §9.5, Lemma 9.9, Theorem 9.10 and Corollary 9.11, pp. 75–77. Computes the Fitting ideal of B̄_p through relation matrices and the extra factor x, giving Fitt_R(B̄_p) ⊆ (Θ^#) and hence the bound for the Selmer module.
- **DKSW-RIBET**, §2, Theorem 2.1 and §2.1, pp. 7–10. The local theorem includes the y_v and a product of local character differences multiplying Fitt_T(N); it applies without residual distinguishability. IHG.6 supplies the explicit finite-lattice/topology version used here.
- **DKSW-BSZ**, §2.7, Theorems 2.14–2.16, pp. 17–21. Reduces the p = 2 case of the keystone theorem to the construction of (T̃, φ, ρ) and applies the residually indistinguishable Ribet lemma.

### The keystone Fitting-ideal theorem

**Theorem target:** `IntegralIwasawaTheory:I.7/keystone-fitting-theorem`.

**Planet:** Keystone theorem.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against DK-2023 §1, Theorem 1.7, p. 12; §3.2, Theorem 3.3, p. 20; DKSW-BSZ §1.2, conditions (A1)–(A5) and Theorem 1.2, pp. 4–5. No local correction needed; imported proof inputs retain their stated supplier conditions.

(a) (Dasgupta–Kakde, p odd) With Σ = S_∞ ∪ {v ∈ S_ram : v | p} and Σ' = T ∪ {v ∈ S_ram : v ∤ p}, the Z_p[G]^--module Sel^{Σ'}_Σ(H)_p^- is quadratically presented and Fitt_{Z_p[G]^-}(Sel^{Σ'}_Σ(H)_p^-) = (Θ^#_{Σ,Σ'}). (b) (Dasgupta–Kakde–Silliman–Wang, all p) For disjoint Σ, Σ' with (A1) Σ ∪ Σ' ⊇ S_∞ ∪ S_ram, (A2) O^×_{H,S∞,Σ'} torsion-free, (A3) Σ ≠ ∅, (A4) Σ ⊇ {v ∈ S_ram : v | p}, (A5) Σ' ⊇ {v ∈ S_ram : v ∤ p}: ∇^{Σ'}_Σ(H)_{p,−} is quadratically presented over Z_p[G]^- and Fitt_{Z_p[G]^-}(∇^{Σ'}_Σ(H)_{p,−}) = (Θ_{Σ,Σ'}/2^t), t = #(S_∞ ∩ Σ').

**Hypotheses and conventions.**

- F totally real, H/F CM abelian, T with condition (1); p odd in (a), any p in (b).

**Proof plan.**

1. Quadratic presentation: I.6/ritter-weiss-transpose (b), (d).
2. Inclusion: fitting-ideal-calculation for every component R, after passing to the trivial-zero-free quotient (DK Lemma 7.1).
3. Equality: inclusion-implies-equality.
4. For (b) at p = 2: DKSW §2 with the generalised Ritter–Weiss module whose depletion set need not contain S_∞.

**Prerequisites.**

- `IntegralIwasawaTheory:I.7/fitting-ideal-calculation`
- `IntegralIwasawaTheory:I.7/inclusion-implies-equality`
- `IntegralIwasawaTheory:I.6/ritter-weiss-transpose`
- `IntegralIwasawaTheory:I.6/smoothed-stickelberger`

**Acceptance.**

- DK Theorem 1.7 = Theorem 3.3.
- DKSW-BSZ Theorem 1.2.

**Sources.**

- **DK-2023**, §1, Theorem 1.7, p. 12; §3.2, Theorem 3.3, p. 20. States the keystone result: the minus p-part of the Selmer module for the sets (20) is quadratically presented with Fitting ideal (Θ^#_{Σ,Σ'}).
- **DKSW-BSZ**, §1.2, conditions (A1)–(A5) and Theorem 1.2, pp. 4–5. Proves Fitt_{Z_p[G]^-}(∇^{Σ'}_Σ(H)_{p,−}) = (Θ_{Σ,Σ'}/2^t) for every prime p, the case p = 2 being new.

### Kurihara's Theorem 2.12: Fitting ideals of modified Selmer and Ritter–Weiss modules

**Theorem target:** `IntegralIwasawaTheory:I.7/kurihara-theorem-2-12`.

**Planet:** Kurihara's Theorem 2.12.

**Review — unverifiable.** Removed the false non-zerodivisor determinant assertion and the unsupported choice of norm-compatible free matrices. The I.9 consumer’s stronger presentation contract remains unresolved.

Let K/k be a finite abelian CM extension of a totally real field, p any prime, S ⊇ S_∞ ∪ S_ram(K/k) and T a finite set of places disjoint from S with (O^T_{K,S})^× torsion-free. Then Fitt_{Z_p[G]^-}(∇^T_S(K)_{p,−}) = θ^T_{K/k,S}·Z_p[G]^- and Fitt_{Z_p[G]^-}(Sel^T_S(K)_p^-) = (θ^T_{K/k,S})^#·Z_p[G]^-. Both modules admit square finite free presentations. Their determinant can be zero on trivial-zero character components: if S contains a completely split finite prime, θ^T_{K/k,S} = 0. The intrinsic module maps and the Fitting identities are compatible with change of field; the cited sources do not choose coherent norm-compatible free bases and matrices. Any I.9 consumer requiring that stronger contract must instead use a proved inverse-limit/derived-presentation interface (G-I7-NORM-PRESENTATIONS).

**Hypotheses and conventions.**

- k totally real, K/k CM abelian, p any prime (p = 2 included), S ⊇ S_∞ ∪ S_ram(K/k), T disjoint with (O^T_{K,S})^× torsion-free.

**Proof plan.**

1. Deduce from keystone-fitting-theorem (b) by moving the places of S_ram ∖ S_p and of S ∖ S_ram between depletion and smoothing sets, using the Euler-factor identities of I.3/stickelberger-functoriality and the depletion sequence for Selmer modules (Kurihara §2.6, after Lemma 6 of Dasgupta–Kakde–Silliman's ETNC paper).
2. The Selmer statement follows by transpose (I.6/ritter-weiss-transpose (d); Burns–Kurihara–Sano Lemma 2.8).
3. DK Appendix B.1, Lemmas B.1–B.3, pp. 89–91, supplies intrinsic functorial module maps, not a coherent system of free bases. Kurihara §4.2, pp. 24–25, uses Fitting-ideal continuity for the tower; verify that exact limit contract rather than assuming norm-compatible matrices.

**Prerequisites.**

- `IntegralIwasawaTheory:I.7/keystone-fitting-theorem`
- `IntegralIwasawaTheory:I.6/ritter-weiss-transpose`
- `IntegralIwasawaTheory:I.6/selmer-module`
- `IntegralIwasawaTheory:I.6/ritter-weiss-module`
- `IntegralIwasawaTheory:I.3/stickelberger-functoriality`
- `PadicMeasuresIwasawaAlgebras:L6/fitting-extension`

**Checks.**

- `quadratic_determinant_can_vanish` (non-example): Add to S a finite prime split completely in K/k. Every character Euler factor is zero, so θ_S^T = 0 and a square presentation has zero determinant; quadratic does not imply torsion over every character component.

**Uses.**

- IntegralIwasawaTheory:I.9/selmer-modified-iwasawa-limit: finite-level square presentations compatible under norms
- IntegralIwasawaTheory:I.9/twisted-selmer-fitting: the Iwasawa Selmer Fitting identity is the limit of these finite identities
- NoncommutativeAndEquivariantIwasawa:NE.6/unconditional-abelian-minus-main-theorem: the unconditional abelian minus main theorem over the Iwasawa algebra

**Acceptance.**

- Kurihara Theorem 2.12 with S ⊇ S_ram: the case used for the equivariant main conjecture.

**Sources.**

- **KURIHARA**, §2.6, Theorem 2.12 and the surrounding discussion, pp. 12–15. States that for S ⊇ S_ram and (O^T_{K,S})^× torsion-free, Fitt(∇^T_S(K)_{p,−}) = θ^T_{K/k,S}Z_p[G]^- and Fitt(Sel^T_S(K)^-_p) = (θ^T)^#, deduced from the keystone theorem of Dasgupta–Kakde (p > 2) and Dasgupta–Kakde–Silliman–Wang (p = 2). Square presentation here does not imply a regular determinant; no coherent norm-compatible matrices are asserted.
- **DK-2023**, Appendix B.1, Lemmas B.1–B.3, pp. 90–93. Proves the functoriality of the presentation V^θ → B^θ of ∇ under passage to fixed fields, compatible with the maps α_v, β_v.

### The p-modified Kurihara formula and Strong Brumer–Stark

**Theorem target:** `IntegralIwasawaTheory:I.7/partial-kurihara-and-strong-brumer-stark`.

**Planet:** Strong Brumer–Stark.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against DK-2023 §3.3, Theorem 3.7, Corollary 3.8 and Lemma 3.9, pp. 22–25; DKSW-BSZ §2.2, Theorem 2.4 and its proof, pp. 8–9. No local correction needed; imported proof inputs retain their stated supplier conditions.

(a) For every odd prime p, Fitt_{Z_p[G]^-}(Sel^T_Σ(H)_p^-) = SK^T_p(H/F)^- with Σ = S_∞ ∪ {v ∈ S_ram : v | p}. (b) (Strong Brumer–Stark, Kurihara's conjecture) Θ^#_{S,T} ∈ Fitt_{Z[G]^-}(Cl^T(H)^{∨,-}) (2 inverted in Z[G]^-). (c) At p = 2: Θ^#_{S,T}/2^{n−1} annihilates (Cl^T(H)^-)^∨ over Z[G]^-, equivalently Θ_{S,T}/2^{n−1} annihilates Cl^T(H)^-, n = [F : Q].

**Hypotheses and conventions.**

- F totally real, H/F CM abelian, S ⊇ S_∞ ∪ S_ram, T with condition (1).

**Proof plan.**

1. (a): from keystone-fitting-theorem (a) by changing smoothing sets: the Euler factors (1 − σ_v e_v Nv) are combinations of the generators (N I_v, 1 − σ_v e_v) (DK Remark 3.6, proof of Theorem 3.7, Lemma 3.9 on exterior powers).
2. (b): Sel^T_Σ(H)^- ↠ Cl^T(H)^{∨,-} (I.6/selmer-module), Fitting ideals grow under surjections, and Θ^#_{S,T} ∈ SK^T_p (I.6/sinnott-kurihara-ideal) (DK Corollary 3.8).
3. (c): DKSW Theorem 2.4 from keystone-fitting-theorem (b), the p = 2 version of (a) and Appendix B of Dasgupta–Kakde, and the dual exact sequence of their Lemma 4.21.

**Prerequisites.**

- `IntegralIwasawaTheory:I.7/keystone-fitting-theorem`
- `IntegralIwasawaTheory:I.6/sinnott-kurihara-ideal`
- `IntegralIwasawaTheory:I.6/selmer-module`
- `IntegralIwasawaTheory:I.6/cm-minus-parts-and-duals`
- `PadicMeasuresIwasawaAlgebras:L6/exterior-cokernel-annihilator`
- `PadicMeasuresIwasawaAlgebras:L6/compound-matrix`
- `PadicMeasuresIwasawaAlgebras:L6/higher-adjugate`

**Acceptance.**

- DK Theorem 1.3 = Corollary 3.8.
- DKSW-BSZ Theorem 2.4.

**Sources.**

- **DK-2023**, §3.3, Theorem 3.7, Corollary 3.8 and Lemma 3.9, pp. 22–25. Proves the p-modified Kurihara formula from the keystone theorem and deduces the Strong Brumer–Stark conjecture.
- **DKSW-BSZ**, §2.2, Theorem 2.4 and its proof, pp. 8–9. Proves the annihilation statement with Θ_{S,T}/2^{n−1} at p = 2 and deduces the Brumer–Stark conjecture over Z.

### Kurihara's conjecture: the Fitting ideal of the dual class group

**Theorem target:** `IntegralIwasawaTheory:I.7/kurihara-fitting-formula`.

**Planet:** Kurihara's conjecture.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against DK-2023 §1.1, Theorem 1.4, p. 7; §3.3, Theorem 3.5, p. 21; Appendix B, Lemmas B.1–B.7 and Theorem B.8, pp. 89–97; KURIHARA §2.5, Theorem 2.8 and Corollary 2.9, p. 11. No local correction needed; imported proof inputs retain their stated supplier conditions.

For F totally real, H/F CM abelian and T with condition (1): Fitt_{Z[G]^-}(Cl^T(H)^{∨,-}) = SK^T(H/F)^-. Equivalently, with s = #S_ram, Fitt^s_{Z[G]^-}(∇^T_{S∞}(H)^-) = (∏_{v∈J̄} N I_v·Θ_{J,T}(H_J/F) : S_∞ ⊆ J ⊆ S_∞ ∪ S_ram).

**Hypotheses and conventions.**

- As stated; the equality is in Z[G]^- with 2 inverted (Dasgupta–Kakde).

**Proof plan.**

1. Lemma B.4: the transpose of ∇^T_{S∞}(H) is Sel^T_{S∞}(H), with s excess generators, and Sel^T_{S∞}(H)^- ≅ Cl^T(H)^{∨,-} (I.6/ritter-weiss-transpose (c), I.6/selmer-module (b)).
2. Lemma B.6: descent formula for Fitt^{s−j} of ∇^T_J(H)_p through the functoriality of DK Appendix B.1 (2×2 determinants of (α_v, β_v)-values vanish, Lemma B.5).
3. Lemma B.7 from partial-kurihara-and-strong-brumer-stark (a), and Theorem B.8 by recombining over the partition J = Σ_0 ∪ J_0.

**Prerequisites.**

- `IntegralIwasawaTheory:I.7/partial-kurihara-and-strong-brumer-stark`
- `IntegralIwasawaTheory:I.6/ritter-weiss-transpose`
- `IntegralIwasawaTheory:I.6/selmer-module`
- `IntegralIwasawaTheory:I.6/sinnott-kurihara-ideal`
- `IntegralIwasawaTheory:I.6/ritter-weiss-module`
- `PadicMeasuresIwasawaAlgebras:L6/higher-fitting-ideal`
- `PadicMeasuresIwasawaAlgebras:L6/transpose-higher-fitting`

**Acceptance.**

- DK Theorem 1.4 = Theorem 3.5.
- For H = Q(μ_3), T = {7}: SK^{T,-} is the unit ideal after inverting 2 and Cl^T(H)^{∨,-} = 0.

**Sources.**

- **DK-2023**, §1.1, Theorem 1.4, p. 7; §3.3, Theorem 3.5, p. 21; Appendix B, Lemmas B.1–B.7 and Theorem B.8, pp. 89–97. States Kurihara's conjecture and proves it by bootstrapping from the p-modified formula through the functoriality of ∇ and higher Fitting ideals.
- **KURIHARA**, §2.5, Theorem 2.8 and Corollary 2.9, p. 11. Restates the Dasgupta–Kakde theorem as Fitt_{Z_p[G]^-}(((A^T_K)^-)^∨) = (Θ(K/k)^T_p)^# and draws the Strong Brumer–Stark consequence.

### The Brumer–Stark theorem

**Theorem target:** `IntegralIwasawaTheory:I.7/brumer-stark-theorem`.

**Planet:** Brumer–Stark theorem.

**Review — corrected.** Removed the claimed logical equivalence of annihilation and the anti-unit construction, and separated the degree-one case.

Let F be totally real of degree n, H/F finite abelian CM, S ⊇ S_∞ ∪ S_ram and T disjoint satisfying condition (1). Then Θ_{S,T} ∈ Ann_{Z[G]}(Cl^T(H)) (Brumer–Stark conjecture in Tate's form). Moreover, for every prime 𝔭 ∉ S ∪ T of F splitting completely in H and 𝔓 | 𝔭 in H, there is u ∈ H^× with |u|_w = 1 for every place w of H not above 𝔭 (including the complex places), Σ_{σ∈G} χ(σ) ord_{σ^{-1}(𝔓)}(u) = L_{S,T}(χ, 0) for every character χ, and u ≡ 1 mod 𝔮O_H for every 𝔮 ∈ T. Over Z[1/2] this is Dasgupta–Kakde; integrally it is Dasgupta–Kakde–Silliman–Wang, who show that Θ_{S,T}/2^{n−1} annihilates Cl^T(H)^- (DKSW-BSZ Theorem 2.4) and for n ≥ 2 obtain the unit form with Θ_{S,T}/2^{n−2} in place of Θ_{S,T}. For n = 1, the integral Brumer–Stark unit statement uses the classical Q-case; it is not deduced by replacing Θ with 2Θ.

**Hypotheses and conventions.**

- F totally real, H/F CM abelian, S ⊇ S_∞ ∪ S_ram, T with condition (1).

**Proof plan.**

1. Over Z[1/2]: from partial-kurihara-and-strong-brumer-stark (b) using Fitt ⊆ Ann, Ann(M^∨) = Ann(M)^# and cΘ = −Θ (I.6/cm-minus-parts-and-duals; DK p. 6).
2. At 2: partial-kurihara-and-strong-brumer-stark (c) and the construction of u from 𝔓^{Θ_{S,T}/2^{n−1}} = (z)𝔞^{1+c} (DKSW proof of Theorem 1.1, p. 9).
3. The cited Brumer–Stark unit theorem supplies a T-congruent anti-unit with the prescribed principal ideal. Annihilation alone supplies a principal ideal and does not imply all these constraints; no converse equivalence is claimed. For degree one use the classical Stickelberger case as in DKSW §2.2, pp. 8–10.

**Prerequisites.**

- `IntegralIwasawaTheory:I.7/partial-kurihara-and-strong-brumer-stark`
- `IntegralIwasawaTheory:I.6/cm-minus-parts-and-duals`
- `IntegralIwasawaTheory:I.6/smoothed-class-groups`
- `IntegralIwasawaTheory:I.6/smoothed-stickelberger`

**Acceptance.**

- For H = Q(μ_3), S = {∞, 3}, T = {7}: Θ_{S,T} = −(1 − c), and Cl^T(H) ≅ Z/6 with c acting trivially, so (1 − c) annihilates Cl^T(H).

**Sources.**

- **DK-2023**, §1, Conjecture 1.1 and Theorem 1.2, pp. 4–5; equation (5), p. 5; §1.1, p. 6. States the Brumer–Stark conjecture, proves it away from 2 and explains the equivalent formulation by Brumer–Stark units.
- **DKSW-BSZ**, §1.1, Theorem 1.1, p. 4; §2.2, Theorem 2.4 and proof of Theorem 1.1, pp. 8–10. Proves the Brumer–Stark conjecture over Z, in the unit form, with the refinement by 2^{n−2}.

### Rubin's higher-rank Brumer–Stark conjecture away from 2

**Theorem target:** `IntegralIwasawaTheory:I.7/rubin-conjecture-consequence`.

**Review — corrected.** Separated the fixed depletion set from the split places; the old right side vanished identically.

Let S_0 ⊇ S_∞ ∪ S_ram(H/F) be fixed, T disjoint satisfying condition (1), and V = {v_1,…,v_r} a set of finite primes outside S_0 ∪ T splitting completely in the CM abelian extension H/F; choose w_j | v_j. Let U_{V,T} consist of T-congruent elements of H^× with zero finite valuation outside V_H. On its minus rational part, the determinant of the valuations at w_j defines ord_G : ∧^r_{Q[G]} QU^-_{V,T} ≅ Q[G]^−. Define u_RBS by ord_G(u_RBS) = Θ_{S_0,T}, with the fixed set S_0, not V, on the right. Then u_RBS belongs to Rubin’s lattice after tensoring with Z[1/2]. The exterior bidual, lattice and order map are imported from EulerSystemsAndKolyvaginSystems ES.6; this target is the deduction from Kurihara’s formula (DK Theorem 1.6 and §3.4, pp. 8, 25–27).

**Hypotheses and conventions.**

- F totally real, H/F CM abelian; S_0 contains infinity and ramification; V consists of distinct finite split primes outside S_0 ∪ T; T satisfies condition (1).

**Proof plan.**

1. Express ϕ(u_{RBS}) = det(ϕ_i(u_j)) through the Fitting ideal of Cl^T(H)^{∨,-} computed by kurihara-fitting-formula, and apply the exterior-power annihilation lemma (PadicMeasuresIwasawaAlgebras L6/exterior-cokernel-annihilator; DK Lemma 3.9).
2. Integral duality Hom_Z(−, Z[1/2]) ≅ Hom_{Z[G]}(−, Z[G]^-) on minus parts (I.6/cm-minus-parts-and-duals).
3. Keep S_0 and V separate throughout. Putting a completely split v_j in the depletion set of Θ would multiply every character value by 1−1 and force the proposed right side to zero.

**Prerequisites.**

- `IntegralIwasawaTheory:I.7/kurihara-fitting-formula`
- `EulerSystemsAndKolyvaginSystems:ES.6/rubin-lattice`
- `EulerSystemsAndKolyvaginSystems:ES.6/exterior-bidual`
- `PadicMeasuresIwasawaAlgebras:L6/exterior-cokernel-annihilator`
- `IntegralIwasawaTheory:I.6/cm-minus-parts-and-duals`

**Acceptance.**

- DK Theorem 1.6: u_{RBS} ∈ 𝓛 ⊗_Z Z[1/2]; for r = 1 it is the Brumer–Stark theorem.

**Sources.**

- **DK-2023**, §1.2, the definitions (8)–(10), Conjecture 1.5 and Theorem 1.6, pp. 8–9; §3.4, pp. 25–27. Recalls Rubin's lattice and the Rubin–Brumer–Stark element and deduces the prime-to-2 part of Rubin's conjecture from the Fitting ideal formula.

## IntegralIwasawaTheory:I.10

### The nonequivariant main conjecture at every prime

**Theorem target:** `IntegralIwasawaTheory:I.10/nonequivariant-characteristic-ideal`.

**Planet:** Nonequivariant main conjecture at all primes.

**Review — verified.** Checked the statement, hypotheses, proof outline and stated conventions against KURIHARA §4.1–4.2, Theorem 4.1, the proof and the three remarks, pp. 24–27; ROGNES-WEIBEL-2000 Appendix A (Kolster), pp. 45–47. No local correction needed; imported proof inputs retain their stated supplier conditions.

Let k be totally real, F/k finite abelian totally real, p any prime (p = 2 included), S ⊇ S_∞ ∪ S_p ∪ S_ram(F/k), and X = X_{F∞,S} = 𝔛_S(F_∞) with ramification at real places allowed. (a) At the augmentation prime 𝔭 = I(Gal(F_∞/k)) of Λ_{F∞}: Fitt_{Λ_{F∞,𝔭}}(X_𝔭) = (γ − 1)g_{F∞/k,S}Λ_{F∞,𝔭}, with γ a topological generator of Gal(k_∞/k); at every other height-one prime 𝔭, Fitt(X_𝔭) = g_{F∞/k,S}Λ_{F∞,𝔭}. (b) Assume F ∩ k_∞ = k, so that Gal(F_∞/k) = Gal(F/k) × Gal(F_∞/F) with Gal(F_∞/F) ≅ Gal(k_∞/k). For a character ψ of Gal(F/k), the ψ-quotient X_ψ = X ⊗_{Z_p[Gal(F/k)]} O_ψ is a finitely generated torsion O_ψ[[Gal(k_∞/k)]]-module with char(X_ψ) = (ψ(g_{F∞/k,S})) for ψ ≠ 1 and char(X_1) = ((γ − 1)·g_{F∞/k,S}) for ψ = 1. (c) For F = k and p = 2 this reads char_{Z_2[[T]]}(X_{F∞,S}) = ((γ − 1)g_{F∞/F,S}). (d) For p odd and ψ of order prime to p and of type S, (b) is Wiles's strong main conjecture of IntegralIwasawaTheory I.5; for p | ord ψ the ψ-quotient and the ψ-eigenspace may differ by modules killed by #Gal(F/k)_p, which are recorded and not discarded.

**Hypotheses and conventions.**

- k totally real, F/k finite abelian totally real, p any prime, S as stated.

**Proof plan.**

1. Apply IntegralIwasawaTheory I.9/integral-determinant-main-conjecture, Det(C_{F∞,S})^{-1} = g_{F∞/k,S}Λ_{F∞}, with H²(C) = X and H³(C) = Z_p (I.8/compact-complex-cohomology).
2. Localise at height-one primes (PadicMeasuresIwasawaAlgebras L5): (Z_p)_𝔭 = 0 unless 𝔭 is the augmentation prime, where Det(Z_p) contributes γ − 1 (Kurihara §4.2, first remark, p. 27).
3. Base change along ψ : Λ_{F∞} → O_ψ[[Gal(k_∞/k)]] using perfectness, and identify characteristic ideals of ψ-quotients (Kurihara §4.2, second remark).
4. Compare with I.5/main-conjecture-statement for p odd using I.3/deligne-ribet-dictionary (vi).

**Prerequisites.**

- `IntegralIwasawaTheory:I.9/integral-determinant-main-conjecture`
- `IntegralIwasawaTheory:I.8/compact-complex-cohomology`
- `IntegralIwasawaTheory:I.3/deligne-ribet-dictionary`
- `IntegralIwasawaTheory:I.5/main-conjecture-statement`
- `IntegralIwasawaTheory:I.5/wiles-main-conjecture`
- `PadicMeasuresIwasawaAlgebras:L5`
- `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`
- `IntegralIwasawaTheory:I.1/equivariant-iwasawa-algebra`

**Acceptance.**

- Kurihara §4.2, p. 27: char(X_{F∞,S})_ψ is generated by the image of g for ψ ≠ 1 and by (γ − 1) times it for ψ trivial.
- SpecialValuesBirchTate B.6/kurihara-main-conjecture-over-f is the instance F = k, p = 2.

**Sources.**

- **KURIHARA**, §4.1–4.2, Theorem 4.1, the proof and the three remarks, pp. 24–27. Proves the equivariant main conjecture Det(RΓ_c)^{-1} = gΛ for all p and derives the characteristic ideals of X_{F∞,S} and of its ψ-quotients, with the factor γ − 1 at the trivial character.
- **ROGNES-WEIBEL-2000**, Appendix A (Kolster), pp. 45–47. Uses the 2-adic main conjecture for the trivial character over a totally real field, with ramification at the real places allowed.

### The Kurihara–Kolster module dictionary at p = 2

**Comparison target:** `IntegralIwasawaTheory:I.10/kurihara-kolster-module-dictionary`.

**Review — unverifiable.** Made the unproved real-place map/rank comparison an explicit open target rather than a consequence of a quotient presentation. The real-place comparison is still a target, not a proved supplier.

Let F be totally real, p = 2, S = S_2 ∪ S_∞, F_∞/F cyclotomic, K_∞ = F(μ_{2^∞}) = F_∞(√−1), Δ' = Gal(K_∞/F_∞) = ⟨ρ⟩, Γ = Gal(F_∞/F) with generator γ (Kolster's γ_0 restricted) and u = κ(γ). This comparison target has sourced input (a), but (b)–(c) remain open under G-I10-REALPLACE; they must not be used as an established supplier theorem. The proposed map-level identifications retain each finite kernel and cokernel: (a) Kummer duality gives an injection (Sel_S(K_∞)_2)^-(1) → X_{F∞,S} with cokernel Z/2 (IntegralIwasawaTheory I.9/dyadic-selmer-comparison), and dually Hom(X_{F∞,S}, Q_2/Z_2) → ((Sel_S(K_∞)_2)^∨)^{ρ=−1}(−1) is surjective with kernel Z/2; (b) the inertia subgroups at the real places of F_∞ generate a quotient of ⊕_{v real of F} Λ/(2), and the S_2-ramified module split at infinity is Kummer-dual, in Kolster's covariant convention (γφ)(x) = φ(γx), to the norm-kernel minus class module A^-_∞ of K_∞; (c) the missing rank/injectivity and Kummer comparisons are required to establish char(ι_u X_{F∞,S}) = (2^{[F:Q]}·f_F), where f_F is the characteristic polynomial of Kolster's Ǎ^-_∞ = Hom(A^-_∞, Q_2/Z_2) and ι_u is the automorphism γ ↦ κ(γ)γ^{-1} of Λ (T ↦ u(1 + T)^{-1} − 1); (d) H²(C_{F∞,S}) = X_{F∞,S} and H³ = Z_2 in the Burns–Flach compact-support convention, not an ordinary compact-support convention at real places; (e) every identification is compatible with enlarging S by places v ∤ 2 through the factors (1 − Nv^{-1}Frob_v) of I.4/s-enlargement-euler-factors; (f) for an abelian extension of Q the classical going-up comparison of Rognes–Weibel Appendix A.2–A.3 is I.5/going-up-induction.

**Hypotheses and conventions.**

- F totally real, p = 2, S = S_2 ∪ S_∞.

**Proof plan.**

1. (a): Kurihara Lemma 4.2(1): H¹(Δ', Q_2/Z_2) ≅ Z/2 and H²(Δ', Q_2/Z_2) = 0 in the Hochschild–Serre sequence for K_∞/F_∞.
2. (b): class field theory for the real places: each real place of F splits completely in F_∞ and contributes inertia of order dividing 2 in the S-ramified extension; Kummer duality as in I.2/global-local-unit-sequence (d) with the norm-kernel convention of I.2/cm-minus-class-modules.
3. An exact sequence with kernel (Λ/2)^{[F:Q]} would give the asserted characteristic factor, but being a quotient of such a module is insufficient. Construct the map and prove its kernel and cokernel first. Finite Λ-modules have trivial characteristic ideal, whereas Λ/2 is height-one torsion. This is the outstanding G-I10-REALPLACE, not a completed deduction.
4. The precise real-place injectivity and the exact form of Federer's comparison are recorded as gap G-I10-REALPLACE (Federer 1982 and Iwasawa 1983 not read).

**Prerequisites.**

- `IntegralIwasawaTheory:I.10/nonequivariant-characteristic-ideal`
- `IntegralIwasawaTheory:I.9/dyadic-selmer-comparison`
- `IntegralIwasawaTheory:I.8/compact-complex-cohomology`
- `IntegralIwasawaTheory:I.2/cm-minus-class-modules`
- `IntegralIwasawaTheory:I.2/global-local-unit-sequence`
- `IntegralIwasawaTheory:I.4/s-enlargement-euler-factors`
- `IntegralIwasawaTheory:I.4/coinvariant-euler-characteristic`
- `IntegralIwasawaTheory:I.1/iwasawa-algebra-coordinate`
- `IntegralIwasawaTheory:I.5/going-up-induction`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`

**Acceptance.**

- SpecialValuesBirchTate B.6/kolster-kurihara-comparison-table consumes (a)–(e).
- Kolster 1989, Conjecture 3: (G) = (2^{[F:Q]} f) is Federer's 2-adic main conjecture; with (c) and B.6's series dictionary it is equivalent to the nonequivariant main conjecture.

**Sources.**

- **KURIHARA**, §4.2, Lemma 4.2 and its proof, pp. 25–26. Gives the injection (Sel_S(K_∞)_p)^-(1) → X_{F∞,S}, an isomorphism for odd p and with cokernel of order 2 for p = 2, and the Fitting ideal of the modified Selmer module.
- **KOLSTER-1989**, pp. 248–250, Theorem 1, Lemma 2, Conjecture 3 and Theorem 5. Sets up the tower F_n = F(ζ_{2^{n+e}}), the norm-kernel minus class module A^-_∞ with the covariant dual, the power series G(T), Federer's conjecture (G) = (2^{[F:Q]}f) and its implication of the 2-part of Birch–Tate.
- **ROGNES-WEIBEL-2000**, Appendix A (Kolster), Theorem A.2 and Corollary A.3, pp. 45–49. Gives the going-up comparison of the main conjecture for abelian extensions.

### The weight-two finite Euler characteristic with all factors

**Theorem target:** `IntegralIwasawaTheory:I.10/finite-euler-characteristic-comparison`.

**Planet:** Weight-two Euler characteristic.

**Review — unverifiable.** Corrected Kolster’s direct-limit formula to Γ-invariants and stated the derived degrees and conditional comparison explicitly. The zeta/descent statement is sourced, but the full Kolster comparison remains conditional.

Let F be totally real, p = 2, S = S_2 ∪ S_∞ and X = X_{F∞,S} (real places may ramify). Then: (a) X(−2)^Γ = 0 and X(−2)_Γ is finite, with v_2(#X(−2)_Γ) = v_2(ζ_F(−1)) + v_2(w_2(F)); (b) #X(−2)_Γ = #H²_et(O_F[1/2], Z_2(2)) and #H¹_et(O_F[1/2], Z_2(2)) = w_2(F)_2; hence ζ_F(−1) ∼_2 #H²_et(O_F[1/2], Z_2(2))/#H¹_et(O_F[1/2], Z_2(2)); (c) the derived specialisation C_{F∞,S} ⊗^L_{Λ, κ²} Z_2 has finite cohomology, its Euler characteristic is computed by (a)–(b), and the Tor terms, the order-two cokernel of kurihara-kolster-module-dictionary (a) and the factor 2^{[F:Q]} at p = 2 appear explicitly in the comparison with Kolster's |(T ⊗ A^-_∞)^Γ| and |K_2(O_F)(2)| = 2^{[F:Q]}|(T ⊗ A^-_∞)^Γ|; (d) the identities are compatible with enlarging S. For odd p, the twist κ² does not factor through Gal(F_∞/F) unless ω² is trivial on Gal(F(μ_p)/F), and the corresponding statement is I.5/special-value-endpoint over F(μ_p). The implication to K_2 and W_2 is owned by SpecialValuesBirchTate B.6. In the compact-support convention H² after specialisation is X(−2)_Γ and H³ is Z_2(−2)_Γ of order w_2(F)_2, giving Euler quotient #H²/#H³. The comparison of this complex with Kolster’s norm-kernel module and its real-place factor is conditional on G-I10-REALPLACE; the zeta-value identity (a)–(b) does not by itself discharge that map-level comparison.

**Hypotheses and conventions.**

- F totally real; p = 2; S = S_2 ∪ S_∞.

**Proof plan.**

1. (a): evaluate char(X) = ((γ − 1)g) (nonequivariant-characteristic-ideal (c)) at κ(γ)² − 1 after the twist, use that X has no nonzero finite Λ-submodule (I.2/weak-leopoldt (c)) and the interpolation κ²(g) = L_S(−1, 1) = ζ_F(−1)∏_{v|p}(1 − Nv) (I.3/deligne-ribet-dictionary (i); κ² factors through Γ at p = 2 because ω² = 1), the Euler factors 1 − Nv for v | 2 being odd, and v_2(κ(γ)² − 1) = v_2(w_2(F)) (I.4/coinvariant-euler-characteristic).
2. (b): I.4/twisted-coinvariant-descent (d), together with H¹(O_F[1/2], Z_2(2)) ≅ H⁰(F, Q_2/Z_2(2)) for F totally real (Kolster Lecture 1, §2; Rognes–Weibel p. 47).
3. Derived specialisation of the H² = X, H³ = Z_2 complex gives the twisted coinvariants and invariant Tor terms. Finiteness and the absence of invariants give H² = X(−2)_Γ and H³ = Z_2(−2)_Γ. Kolster 1989 Theorem 1, pp. 249–250, instead uses the Γ-invariants of the discrete direct-limit module T ⊗ A^-_∞. Comparing the two, including real inertia, still requires G-I10-REALPLACE.
4. (d): I.4/s-enlargement-euler-factors.

**Prerequisites.**

- `IntegralIwasawaTheory:I.10/nonequivariant-characteristic-ideal`
- `IntegralIwasawaTheory:I.10/kurihara-kolster-module-dictionary`
- `IntegralIwasawaTheory:I.5/special-value-endpoint`
- `IntegralIwasawaTheory:I.4/twisted-coinvariant-descent`
- `IntegralIwasawaTheory:I.4/coinvariant-euler-characteristic`
- `IntegralIwasawaTheory:I.4/finite-layer-descent`
- `IntegralIwasawaTheory:I.4/dyadic-real-place-correction`
- `IntegralIwasawaTheory:I.4/s-enlargement-euler-factors`
- `IntegralIwasawaTheory:I.2/weak-leopoldt`
- `IntegralIwasawaTheory:I.2/real-unit-galois-cohomology`
- `IntegralIwasawaTheory:I.3/deligne-ribet-dictionary`

**Checks.**

- `discrete_invariants_not_coinvariants` (non-example): For D = Q_2/Z_2 with γ acting as multiplication by 3, D^Γ = D[2] has order 2 but D_Γ = D/2D = 0. Replacing invariants by coinvariants in the discrete Kolster formula loses a factor of 2.

**Acceptance.**

- F = Q, p = 2: v_2(ζ(−1)) = −2 and #H²_et(Z[1/2], Z_2(2))/#H¹_et(Z[1/2], Z_2(2)) = 2/8.
- Recover the zeta-value conclusion of Rognes–Weibel Theorem A.1 after importing the all-prime main conjecture; this does not establish the separate real-place module comparison.

**Sources.**

- **ROGNES-WEIBEL-2000**, Appendix A (Kolster), Theorem A.1 and its proof, pp. 45–47. Derives ζ_F(1 − n) ∼_2 |H²_et(O_F[1/2], Z_2(n))|/|H¹_et(O_F[1/2], Z_2(n))| for even n from the 2-adic main conjecture for the trivial character.
- **KOLSTER-1989**, Theorem 1 and Lemma 2, pp. 249–250. Shows |K_2(o)(2)| = 2^{[F:Q]}·|(T ⊗ A^-_∞)^Γ| and computes |(T ⊗ A^-_∞)^Γ| ∼ f(u^{-1} − 1).
- **KOLSTER-2009**, Lecture 1, §2, pp. 9–11. Identifies H¹_et(o'_F, Z_p(n))_tors with H⁰(F, Q_p/Z_p(n)) and describes H² for even n over totally real F.

## Interfaces consumed by part I.8

I.1 supplies the tower and arithmetic coefficient actions; I.2 supplies class-field and unit modules; I.3 supplies Stickelberger normalisations; I.6 supplies Selmer and Ritter–Weiss constructions; I.7 supplies finite Fitting theorems. Their open conditions propagate to consumers. In particular, weak Leopoldt at real dyadic places, the integral minus Selmer comparison, and the I.9 request for norm-compatible free presentations are not discharged by the corrected statements. The sourced intrinsic field-change maps and Fitting continuity must replace or justify that last request.

## Supplier requests

### AnalyticNumberTheory:AN.4

Hecke L-functions of finite-order ray class characters of a totally real field, with meromorphic continuation, the Euler-factor identities for imprimitive versions, the Artin formalism for induction from CM extensions, and the T-smoothed Dedekind class number formula at s = 0 (leading terms of ζ_{H,S∞,T} and ζ_{H+,S∞,T}).

Needed by `IntegralIwasawaTheory:I.3/stickelberger-elements`, `IntegralIwasawaTheory:I.3/stickelberger-functoriality`, `IntegralIwasawaTheory:I.5/divisibility-to-equality`, `IntegralIwasawaTheory:I.5/going-up-induction`, `IntegralIwasawaTheory:I.6/minus-class-number-formula`.

### ColemanPowerSeries:L4

Iwasawa's isomorphism U_∞^{(k)}/C_∞^{(k)} ≅ Λ/(g_k) through Coleman power series, used for the units version of the main conjecture over Q.

Needed by `IntegralIwasawaTheory:I.5/main-conjecture-statement`.

### DirichletPadicLFunctions:L2

The Kubota–Leopoldt branches with Euler factor at p, Teichmüller twists and the trivial-character pole, in the normalisation compared with Stickelberger elements by I.3.

Needed by `IntegralIwasawaTheory:I.3/kubota-leopoldt-stickelberger-dictionary`.

### IntegralHeckeAndGaloisDeterminants:IHG.1

The codimension-zero congruence module Ψ_λ(M) and congruence ideal η_λ of an augmented finite flat O-algebra, with the finite-flat comparison Ψ ≅ O/η (red-team finding RT-AREA-langlands-1/27), instantiated by I.5 for the Eisenstein augmentation of the ordinary Hecke algebra. Ownership is proposed; this exact interface is not present in the supplied current upstream (G-I5-CONGRUENCE).

Needed by `IntegralIwasawaTheory:I.5/hida-hecke-eisenstein-ideal`.

### PadicMeasuresIwasawaAlgebras:L1

Import the completed group-algebra carrier and finite-level projections already in the current Tau Ceti library, with a pinned-availability adapter when packaging. The universal property and arithmetic action are distinct contracts; no generic carrier is replanned here.

Needed by `IntegralIwasawaTheory:I.1/arithmetic-compact-action`, `IntegralIwasawaTheory:I.1/equivariant-iwasawa-algebra`, `IntegralIwasawaTheory:I.1/iwasawa-algebra-coordinate`.

### PadicMeasuresIwasawaAlgebras:L4

Characteristic ideals, μ/λ, pseudo-isomorphism, the Euler quotient χ_n(M) = #M_{Γn}/#M^{Γn} through resultants, and invariance under change of generator.

Needed by `IntegralIwasawaTheory:I.1/finite-level-kernel`, `IntegralIwasawaTheory:I.4/coinvariant-euler-characteristic`.

### PadicMeasuresIwasawaAlgebras:L5

Determinant lines of perfect complexes over Λ_{F∞}, height-one localisation, compact inverse-limit exactness and topological Nakayama.

Needed by `IntegralIwasawaTheory:I.1/equivariant-iwasawa-algebra`, `IntegralIwasawaTheory:I.10/nonequivariant-characteristic-ideal`, `IntegralIwasawaTheory:I.2/global-local-unit-sequence`, `IntegralIwasawaTheory:I.2/iwasawa-finiteness`, `IntegralIwasawaTheory:I.4/finite-layer-descent`, `IntegralIwasawaTheory:I.4/s-enlargement-euler-factors`.

### tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

The Čebotarev density theorem, for density of Frobenius elements.

Needed by `IntegralIwasawaTheory:I.5/ribet-extension-construction`, `IntegralIwasawaTheory:I.7/hecke-galois-representation`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

Global Artin reciprocity for ray class groups and its compatibility with norms and restriction.

Needed by `IntegralIwasawaTheory:I.2/class-field-identification`, `IntegralIwasawaTheory:I.2/maximal-abelian-pro-p-extensions`, `IntegralIwasawaTheory:I.3/deligne-ribet-dictionary`, `IntegralIwasawaTheory:I.6/ritter-weiss-galois-cohomology`, `IntegralIwasawaTheory:I.6/ritter-weiss-module`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence

The global existence theorem and the correspondence between ray class groups and abelian extensions, used for maximal abelian pro-p extensions with prescribed ramification.

Needed by `IntegralIwasawaTheory:I.10/kurihara-kolster-module-dictionary`, `IntegralIwasawaTheory:I.2/class-field-identification`, `IntegralIwasawaTheory:I.2/global-local-unit-sequence`, `IntegralIwasawaTheory:I.2/maximal-abelian-pro-p-extensions`, `IntegralIwasawaTheory:I.4/dyadic-real-place-correction`, `IntegralIwasawaTheory:I.6/ritter-weiss-galois-cohomology`, `IntegralIwasawaTheory:I.7/eisenstein-cohomology-class`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

Norm theorems for class fields, used for norm maps on class groups along the cyclotomic tower.

Needed by `IntegralIwasawaTheory:I.2/class-field-identification`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity

Local class field theory, for the local modules of Ritter–Weiss.

Needed by `IntegralIwasawaTheory:I.6/ritter-weiss-module`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group

Local Weil groups and their extensions, for the Ritter–Weiss modules V_w, W_w.

Needed by `IntegralIwasawaTheory:I.6/ritter-weiss-module`.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic

Cyclotomic splitting and ramification over number fields.

Needed by `IntegralIwasawaTheory:I.1/cyclotomic-zp-extension`, `IntegralIwasawaTheory:I.1/tower-ramification`.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers

Moduli and ray class groups, for T-smoothed class groups and their exact sequences.

Needed by `IntegralIwasawaTheory:I.2/class-group-limit`, `IntegralIwasawaTheory:I.6/smoothed-class-groups`.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group

Units of local fields and the principal-unit filtration.

Needed by `IntegralIwasawaTheory:I.2/semilocal-principal-units`.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration

Tame and wild ramification; the p-Sylow of tame inertia is a quotient of the residue units.

Needed by `IntegralIwasawaTheory:I.4/s-enlargement-euler-factors`, `IntegralIwasawaTheory:I.6/smoothed-stickelberger`.

### tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra

Hecke operators and Hecke algebras of classical modular forms.

Needed by `IntegralIwasawaTheory:I.5/hida-hecke-eisenstein-ideal`.

### tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields

Integral Hecke algebras of modular forms.

Needed by `IntegralIwasawaTheory:I.5/hida-hecke-eisenstein-ideal`.

### tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol

Frobenius elements and the Artin symbol, with the arithmetic convention.

Needed by `IntegralIwasawaTheory:I.1/tower-ramification`, `IntegralIwasawaTheory:I.3/stickelberger-elements`, `IntegralIwasawaTheory:I.3/stickelberger-functoriality`.

### tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places

Decomposition and inertia groups at finite places.

Needed by `IntegralIwasawaTheory:I.1/tower-ramification`, `IntegralIwasawaTheory:I.6/sinnott-kurihara-ideal`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees

Continuous cohomology of profinite groups in all degrees.

Needed by `IntegralIwasawaTheory:I.2/weak-leopoldt`, `IntegralIwasawaTheory:I.4/twisted-coinvariant-descent`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension

Cohomological dimension, for the vanishing of pro-p cohomology of tame inertia away from p.

Needed by `IntegralIwasawaTheory:I.7/eisenstein-cohomology-class`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences

Inflation–restriction and Hochschild–Serre exact sequences for profinite groups.

Needed by `IntegralIwasawaTheory:I.2/real-unit-galois-cohomology`, `IntegralIwasawaTheory:I.4/twisted-coinvariant-descent`, `IntegralIwasawaTheory:I.6/ritter-weiss-galois-cohomology`, `IntegralIwasawaTheory:I.7/surjection-from-nabla`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma

Coinduced modules and Shapiro's lemma.

Needed by `IntegralIwasawaTheory:I.6/ritter-weiss-galois-cohomology`, `IntegralIwasawaTheory:I.6/ritter-weiss-module`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory

Hilbert 90 and Kummer theory for Galois cohomology with roots of unity.

Needed by `IntegralIwasawaTheory:I.2/global-local-unit-sequence`, `IntegralIwasawaTheory:I.2/weak-leopoldt`, `IntegralIwasawaTheory:I.4/arithmetic-iwasawa-complex`, `IntegralIwasawaTheory:I.6/selmer-module`.

### tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs

The completed group algebra of a procyclic pro-p group and its power-series coordinate with change of generator.

Needed by `IntegralIwasawaTheory:I.1/arithmetic-compact-action`, `IntegralIwasawaTheory:I.1/equivariant-iwasawa-algebra`, `IntegralIwasawaTheory:I.1/iwasawa-algebra-coordinate`.

### tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality

Character orthogonality and idempotents of finite abelian groups.

Needed by `IntegralIwasawaTheory:I.1/character-decomposition-integrality`, `IntegralIwasawaTheory:I.3/stickelberger-elements`.

### tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-2-induced-characters-and-frobenius-reciprocity

Frobenius reciprocity for the induced place modules Y_{H,{v}}.

Needed by `IntegralIwasawaTheory:I.6/selmer-module`.

### IntegralHeckeAndGaloisDeterminants:IHG.6

Local weighted Ribet theorem for residually distinct components as well as coincident components, allowing the finite quadratic nonreduced K_f; include finite matrix lattice/topology input and the local generators. Current local_ribet hres is not automatic at p=2 (G-I7-RIBET-RESIDUAL).

Needed by `IntegralIwasawaTheory:I.7/eisenstein-cohomology-class`, `IntegralIwasawaTheory:I.7/surjection-from-nabla`, `IntegralIwasawaTheory:I.7/fitting-ideal-calculation`.

### AutomorphicGaloisRepresentations:R19.2

Finite-weight ordinary Hilbert representations for every totally real degree and p=2 with the exact local and coefficient data of DKSW Theorem 3.14. The current wiles-ordinary-hilbert-representation supplier is only odd-p/even-degree (G-I7-GALOIS-SUPPLIER).

Needed by `IntegralIwasawaTheory:I.7/hecke-galois-representation`.

### AutomorphicPadicLFunctions:L3

Hida–Silliman forms congruent to 1, prescribed constant terms and the cuspidal correction of DK Theorems 8.8, 8.9, 8.15, plus the dyadic ℓ-old extension. Verify the q-expansion/level/coefficient contracts with AutomorphicBundles and PadicFamilies (G-I7-MODULAR-SUPPLIERS).

Needed by `IntegralIwasawaTheory:I.7/extra-congruence-cusp-form`, `IntegralIwasawaTheory:I.7/group-ring-hecke-eisenstein-homomorphism`.

## Open gaps

### G-I2-H2 — Source for the H² form of weak Leopoldt

Prove the equivalence between the rank/defect form of weak Leopoldt and the asserted H² vanishing, specifying coefficients and limit maps. The proposed cd_p ≤ 2 argument fails at p = 2 with real places, whose order-two decomposition groups give infinite ordinary cohomological dimension. Kurihara §4.1, p. 23, uses weak Leopoldt but does not supply this proof.

Needed by `IntegralIwasawaTheory:I.2/weak-leopoldt`.

### G-I2-FEDERER — Federer's theorem on the dual minus class module at 2

That (A_∞^-)^∨ has no nonzero finite Λ-submodule for p = 2 with the norm-kernel convention is quoted by Kolster 1989 from Federer (Birkhäuser 1982), which was not read.

Needed by `IntegralIwasawaTheory:I.2/cm-minus-class-modules`.

### G-I2-IWASAWA83 — Iwasawa's 1983 computation of H^i(Γ, ℰ)

Iwasawa, On cohomology groups of units for Z_p-extensions, Amer. J. Math. 105 (1983), Proposition 2, is used as quoted in Kolster 1989; the original was not read.

Needed by `IntegralIwasawaTheory:I.2/real-unit-galois-cohomology`.

### G-I4-ENLARGE — Left exactness when enlarging S

Injectivity of the inertia map Λ_{F∞}/(Frob_v − Nv) → 𝔛_{S∪{v}}(F_∞) is argued from weak Leopoldt (vanishing H²); the classical source (Greenberg, Nagoya Math. J. 67 (1977)) was not read.

Needed by `IntegralIwasawaTheory:I.4/s-enlargement-euler-factors`.

### G-I5-WILES — Wiles 1990 and Mazur–Wiles 1984 not read

Wiles, The Iwasawa conjecture for totally real fields, Ann. of Math. 131 (1990), 493–540, and Mazur–Wiles, Invent. Math. 76 (1984), 179–330, were not read in this pass. The Q-case is planned from Sharifi's AWS notes (§4.3, a complete sketch in the Ohta–Emerton form); the totally real case (Λ-adic Hilbert forms, auxiliary twisting to control ramification above p, the μ-comparison Theorem 1.4) is stated from Kolster, Kakde, Rognes–Weibel and Dasgupta–Kakde's account.

Needed by `IntegralIwasawaTheory:I.5/ribet-extension-construction`, `IntegralIwasawaTheory:I.5/divisibility-to-equality`, `IntegralIwasawaTheory:I.5/wiles-main-conjecture`.

### G-I10-REALPLACE — Real-place correction at p = 2

Construct the inertia map at infinity and prove its kernel, cokernel and Λ/(2)-rank before deducing 2^{[F:Q]} or the twist ι_u. A quotient of a sum of Λ/(2) modules gives no such equality. Compare the precise norm-kernel minus class module of Kolster 1989, Theorem 1 and Conjecture 3, pp. 248–250, with Kurihara Lemma 4.2, p. 25; retain the finite order-two cokernel and use invariants for Kolster’s discrete module.

Needed by `IntegralIwasawaTheory:I.10/kurihara-kolster-module-dictionary`, `IntegralIwasawaTheory:I.10/finite-euler-characteristic-comparison`.

### G-I2-REAL-UNITS — Real sign factors in the dyadic global–local sequence

For real K at p = 2, specify the local ±1 factors, the wide or narrow class group, and the maps before passing to limits. Prove the weak-Leopoldt identification E_∞ → Ē_∞ separately. The unaugmented sequence cited from Sharifi does not supply this case.

Needed by `IntegralIwasawaTheory:I.2/global-local-unit-sequence`, `IntegralIwasawaTheory:I.2/iwasawa-finiteness`, `IntegralIwasawaTheory:I.10/kurihara-kolster-module-dictionary`.

### G-I2-UNIT-FINITENESS — Finite generation of norm-compatible unit modules

Supply the local Iwasawa unit-module theorem for U_∞ and the injectivity/comparison E_∞ ≅ Ē_∞ needed to use noetherianity. Sharifi Proposition 3.2.11 proves the class-module statement, not these unit assertions. Avoid a circular reliance on the global–local sequence.

Needed by `IntegralIwasawaTheory:I.2/iwasawa-finiteness`.

### G-I5-CONGRUENCE — Codimension-zero congruence interface

RT-AREA-langlands-1/27 proposes IHG.1 as the generic owner. Current upstream has congruence ideals but no matching Ψ_λ(M) finite-flat comparison. Supply that API with its augmentation and finiteness hypotheses, or give the particular Q argument directly; do not treat a proposed owner as an implemented contract.

Needed by `IntegralIwasawaTheory:I.5/hida-hecke-eisenstein-ideal`.

### G-I5-INDUCTION — General-prime going-up interface

Rognes–Weibel Appendix A.2 proves the dyadic case. Supply a source or a complete target-level argument for arbitrary p, including coefficient fields for induction, distinguished-polynomial substitutions and type-S/type-W factorisation.

Needed by `IntegralIwasawaTheory:I.5/going-up-induction`.

### G-I7-NORM-PRESENTATIONS — The exact finite-to-infinite presentation contract

The finite module/Fitting theorem and intrinsic field-change maps are sourced. A coherent system of norm-compatible free matrices is not. Reconcile the I.9 supplier request with Kurihara §4.2 Fitting-ideal continuity or a derived presentation theorem; do not infer regular determinants in the presence of trivial zeros.

Needed by `IntegralIwasawaTheory:I.7/kurihara-theorem-2-12`.

### G-I7-RIBET-RESIDUAL — Local weighted Ribet input for distinct residual components

The checked current IHG.6 local_ribet and atlas local-ribet-theorem assume χ≡ψ modulo the maximal ideal. The global distinct-character theorem has no local weighted conclusion. At p=2 a character with nontrivial odd-order part need not be residually trivial. Request a local distinct-character theorem (including possibly nonreduced K_f and the finite-lattice topology), or a uniform local statement matching DKSW Theorem 2.15; do not silently drop hres. DKSW Remark 2.2, p. 8, explicitly states the source theorem also holds without residual coincidence; the gap here concerns the exact supplier signature, not the truth of that mathematical extension.

Needed by `IntegralIwasawaTheory:I.7/eisenstein-cohomology-class`, `IntegralIwasawaTheory:I.7/surjection-from-nabla`, `IntegralIwasawaTheory:I.7/fitting-ideal-calculation`.

### G-I7-GALOIS-SUPPLIER — Ordinary Hilbert representations in the required range

The read R19.2/wiles-ordinary-hilbert-representation statement assumes p odd and [F:Q] even. I.7 needs finite-weight ordinary Hilbert representations for arbitrary totally real F and p=2, with trace/determinant normalisation, coefficient descent and local triangular data. DKSW Theorem 3.14 states the needed arithmetic input; route the general representation theorem to its existing R19.2 owner rather than attributing the broader result to the narrower node.

Needed by `IntegralIwasawaTheory:I.7/hecke-galois-representation`.

### G-I7-MODULAR-SUPPLIERS — Cusp correction and all-prime Hilbert modular supplier range

Supply exact contracts for DK Theorems 8.8, 8.9 and 8.15 (forms congruent to 1, prescribed constant terms, cuspidal correction), and the dyadic ℓ-old construction of DKSW §3.2. Existing PadicFamilies L5 Λ-adic Hilbert statements assume odd p and contain conditional control inputs; the read AutomorphicBundles Hilbert expansion principle is in a prime-to-p-level setup. Check the precise level and coefficient-change range used in I.7.

Needed by `IntegralIwasawaTheory:I.7/extra-congruence-cusp-form`, `IntegralIwasawaTheory:I.7/group-ring-hecke-eisenstein-homomorphism`.

## Ownership proposals

**IntegralIwasawaTheory, Polylogarithms, AutomorphicPadicLFunctions.** RT-AREA-ktheory-2/26: Leopoldt's map and defect are used by IntegralIwasawaTheory L4, Polylogarithms P.6 and AutomorphicPadicLFunctions L0 without a common owner. IntegralIwasawaTheory:I.2/leopoldt-map-and-defect owns the completed global-to-local unit map, the defect and the conjecture. The I.8 packet's L4/leopoldt-defect becomes the logarithmic comparison importing it; P.6 keeps the regulator equivalence and APL L0 its dimension formula, each importing I.2.

**IntegralIwasawaTheory, IntegralHeckeAndGaloisDeterminants, PadicFamilies.** RT-AREA-langlands-1/27: the codimension-zero congruence module and ideal have no generic owner; PadicFamilies L1 currently plans them. IntegralHeckeAndGaloisDeterminants IHG.1 owns the congruence module and ideal (the confirmed fix); I.5/hida-hecke-eisenstein-ideal imports IHG.1 (requested) and cites PadicFamilies L1/congruence-ideal only as the present planned statement, to be re-pointed when IHG.1 is extended. This is an ownership proposal; the exact generic supplier statement is still missing (G-I5-CONGRUENCE).

**IntegralIwasawaTheory, AutomorphicPadicLFunctions, IgusaVarietiesAndTorsionConcentration, HodgeTateAndCanonicalSubgroups.** RT-AREA-langlands-1/8: RS-14 linked IG.1 (Igusa varieties of unitary data) to IntegralIwasawaTheory I.3, whose Hilbert modular inputs need the Katz–Hida ordinary tower. I.3 takes no Igusa input directly: it imports the Deligne–Ribet pseudo-measure, Hilbert Eisenstein series and q-expansion principle from AutomorphicPadicLFunctions L3, whose ordinary Igusa tower is HodgeTateAndCanonicalSubgroups T5. Remove the IG.1 → I.3 edge.

**IntegralIwasawaTheory, AutomorphicPadicLFunctions.** Group-ring valued Hilbert modular forms and Eisenstein families (Dasgupta–Kakde §§7–8) are planned in AutomorphicPadicLFunctions L3/group-ring-eisenstein-families, while the paper route sent them to I.7. Keep the single owner AutomorphicPadicLFunctions L3; I.7 imports it and owns only the cuspidal extra-congruence family, the Eisenstein homomorphism and the Galois-side argument.

**IntegralIwasawaTheory.** Stickelberger elements are needed by I.3 (interpolation dictionary) and I.6 (integral CM objects), with I.3 → I.6. I.3/stickelberger-elements owns the general analytic Θ^{H/k}_{Σ,Σ'}(s); I.6/smoothed-stickelberger owns the CM-specific integral, minus and trivial-zero properties.

**IntegralIwasawaTheory, EulerSystemsCyclotomicMainConjecture.** The Q characteristic-ideal main conjecture appears in both I.5 and EulerSystemsCyclotomicMainConjecture L3. Keep one common statement at EulerSystemsCyclotomicMainConjecture L3; I.5 supplies its Eisenstein proof and dictionary. Reconcile tier or bundle placement before adding a backwards dependency.

## Upstream notes

**PadicMeasuresIwasawaAlgebras.** The supplied TauCetiRoadmap main (0d144d044dacebca17b654695b6f1ad58f159b27) has no PadicMeasuresIwasawaAlgebras directory. Its atlas blueprint remains the proposed owner of the generic order/character-ring interfaces. The supplied Tau Ceti main (a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039) already implements completedGroupAlgebra and TauCeti.fittingIdeal (all indices); do not plan those constructions again. Current availability does not change this packet’s pinned baseline. Remaining character-ring, transpose and continuity interfaces still need exact supplier contracts.

**ProfiniteProPGroups.** Layer 9 of TauCetiRoadmap ProfiniteProPGroups owns the completed group algebra and the power-series coordinate with change of generator; I.1 cites it and plans only the arithmetic instance.

**ClassFieldTheory.** Layers 11–13 supply global reciprocity, existence and norm theorems for the class-field identification of Iwasawa modules; I.2 adds only the tower-level statements.

**IntegralHeckeAndGaloisDeterminants.** Current IHG.6 local_ribet requires an explicit finite matrix lattice with the correct induced adic topology in addition to algebraic trace and local conditions. I.7 must verify that arithmetic input. RT-AREA-langlands-1/27 identifies an owner for codimension-zero congruence modules, but current IHG.1 does not yet supply the requested Ψ_λ API.

**EulerSystemsCyclotomicMainConjecture.** The Q characteristic-ideal main-conjecture statement is already a target of EulerSystemsCyclotomicMainConjecture L3. I.5 should import that common statement and give the Eisenstein proof/comparison; it must not create a second owner for the theorem.

## Pinned declaration audit

All 35 declaration statements were read at the pins. The ideal norm uses `Ideal.relNorm`, rather than the norm-generated ideal `Ideal.spanNorm`; continuity is not attributed to the algebraic `cyclotomicCharacter` declaration.

- `mathlib:Algebra.norm` — `Mathlib/RingTheory/Norm/Defs.lean`. The norm S →* R of a finite free algebra, used for relative norms in the cyclotomic tower.
- `mathlib:CharacterModule` — `Mathlib/Algebra/Module/CharacterModule.lean`. The character module Hom_Z(A, Q/Z) of an abelian group, the Pontryagin dual of a finite module.
- `mathlib:ClassGroup` — `Mathlib/RingTheory/ClassGroup/Basic.lean`. The class group of a domain, units of fractional ideals modulo principal ones.
- `mathlib:CommGroup.torsion` — `Mathlib/GroupTheory/Torsion.lean`. The torsion subgroup of a commutative group, used for Δ_K.
- `mathlib:ContinuousMonoidHom` — `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean`. Continuous monoid homomorphisms between topological monoids.
- `mathlib:Field.absoluteGaloisGroup` — `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean`. The absolute Galois group Gal(K̄/K) of a field, with the Krull topology.
- `mathlib:FractionRing` — `Mathlib/RingTheory/Localization/FractionRing.lean`. Localisation at all non-zerodivisors, the total quotient ring of a commutative ring.
- `mathlib:Ideal.relNorm` — `Mathlib/RingTheory/Ideal/Norm/RelNorm.lean`. The multiplicative relative ideal norm Ideal S →*₀ Ideal R for a finite extension of Dedekind domains, using the integral algebra norm. Descent to ideal classes and compatibility in towers still require proofs.
- `mathlib:InfiniteGalois.fixedField_fixingSubgroup` — `Mathlib/FieldTheory/Galois/Infinite.lean`. The infinite Galois correspondence: the fixed field of the fixing subgroup of an intermediate field is that field.
- `mathlib:InfiniteGalois.normalAutEquivQuotient` — `Mathlib/FieldTheory/Galois/Infinite.lean`. For a closed normal subgroup H, Gal(K/k)/H ≃ Gal(fixedField H/k).
- `mathlib:IntermediateField.fixedField` — `Mathlib/FieldTheory/Galois/Basic.lean`. The fixed field of a subgroup of automorphisms.
- `mathlib:IsCyclotomicExtension` — `Mathlib/NumberTheory/Cyclotomic/Basic.lean`. The class of cyclotomic extensions for a set of orders, allowing all p-power orders.
- `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletion` — `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean`. The completion of the fraction field at a finite place.
- `mathlib:IsGalois` — `Mathlib/FieldTheory/Galois/Basic.lean`. Galois extensions (separable and normal).
- `mathlib:Module.Invertible` — `Mathlib/RingTheory/PicardGroup.lean`. Invertible modules: the evaluation map from dual tensor module to the ring is bijective.
- `mathlib:Module.annihilator` — `Mathlib/RingTheory/Ideal/Maps.lean`. The annihilator ideal of a module.
- `mathlib:MonoidAlgebra` — `Mathlib/Algebra/MonoidAlgebra/Defs.lean`. The monoid algebra R[M], in particular the group ring Z[G].
- `mathlib:MonoidAlgebra.mapDomainRingEquiv` — `Mathlib/Algebra/MonoidAlgebra/MapDomain.lean`. The ring isomorphism R[M] ≃ R[N] induced by a monoid isomorphism, used for the involution #.
- `mathlib:NumberField.InfinitePlace.nrComplexPlaces` — `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`. The number r_2 of complex places of a number field.
- `mathlib:NumberField.IsCMField` — `Mathlib/NumberTheory/NumberField/CMField.lean`. CM fields: totally complex quadratic extensions of their maximal real subfield.
- `mathlib:NumberField.IsCMField.complexConj` — `Mathlib/NumberTheory/NumberField/CMField.lean`. Complex conjugation on a CM field, as an automorphism over the maximal real subfield.
- `mathlib:NumberField.Units.rank` — `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean`. The unit rank card(InfinitePlace K) − 1 of a number field.
- `mathlib:NumberField.Units.regulator` — `Mathlib/NumberTheory/NumberField/Units/Regulator.lean`. The regulator of a number field, the covolume of the unit lattice.
- `mathlib:NumberField.classNumber` — `Mathlib/NumberTheory/NumberField/ClassNumber.lean`. The class number of a number field.
- `mathlib:NumberField.dedekindZeta` — `Mathlib/NumberTheory/NumberField/DedekindZeta.lean`. The Dedekind zeta function as an L-series (no continuation to negative integers at the pin).
- `mathlib:NumberField.maximalRealSubfield` — `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean`. The maximal real subfield K⁺ of a number field.
- `mathlib:PadicInt` — `Mathlib/NumberTheory/Padics/PadicIntegers.lean`. The ring Z_p of p-adic integers.
- `mathlib:Polynomial.IsDistinguishedAt` — `Mathlib/RingTheory/Polynomial/Eisenstein/Distinguished.lean`. Distinguished polynomials at an ideal, e.g. ω_n = (1 + T)^{p^n} − 1 at (p).
- `mathlib:Polynomial.bernoulli` — `Mathlib/NumberTheory/BernoulliPolynomials.lean`. Bernoulli polynomials B_n(X) over Q.
- `mathlib:PowerSeries` — `Mathlib/RingTheory/PowerSeries/Basic.lean`. Formal power series R[[X]].
- `mathlib:cyclotomicCharacter` — `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean`. The algebraic monoid homomorphism from ring automorphisms to p-adic units with its root-of-unity action formula; continuity on an absolute Galois group must be proved using the finite-level projections.
- `mathlib:groupCohomology` — `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean`. Group cohomology of a representation of a group.
- `tauceti:OpenNormalSubgroup.maximalAbelianLayer` — `TauCeti/NumberTheory/ClassFieldTheory/Formation/AbelianLayer.lean`. The maximal abelian layer V ⊔ closure[G, G] of an open normal subgroup of a profinite group.
- `tauceti:TauCeti.GlobalNumberFields.Modulus` — `TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean`. Moduli of a number field: a nonzero integral ideal and a set of real places.
- `tauceti:TauCeti.GlobalNumberFields.RayClassGroup` — `TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean`. The ray class group of a modulus: ideals prime to it modulo the principal ideals congruent to one.

## Source corrections

### IntegralIwasawaTheory/E1 — error

**Version and locator:** KOLSTER-2009, Lecture 1, §1, p. 6, in the author PDF read (Maine–Québec site; the notes are formatted for the IAS/Park City Mathematics Series).

**Assertion checked.** For a number field F and a prime p, the notes write Gal(F(μ_{p^∞})/F) as Γ × Δ with Δ isomorphic to Gal(F(ζ_{2p})/F), and define ω on Δ.

**Correction.** This holds for odd p, and for p = 2 when F has a real place or contains i. In general at p = 2 the torsion of Gal(F(μ_{2^∞})/F) need not be Gal(F(i)/F): the decomposition holds with Δ the torsion subgroup, and ω must be defined on the whole group through the projection Z_2^× → {±1}.

**Check.** For F = Q(√−2), the σ_a with a ∈ Z_2^× fixing √−2 = ζ_8 + ζ_8^3 are those with a ≡ 1 or 3 mod 8; this subgroup has index 2 in Z_2^× and contains no torsion, so Gal(F(μ_{2^∞})/F) ≅ Z_2, while [F(i) : F] = 2.

**Review — confirmed.** The stated general dyadic product with Δ = Gal(F(i)/F) fails for F = Q(√−2): the cyclotomic image is a ≡ 1 or 3 mod 8, is torsion-free, and nevertheless F(i)/F has degree 2. The correct torsion subgroup and whole-group Teichmüller projection are used in I.1. Checked Kolster Lecture 1 §1, p. 6.

Effect: nothing. Correction search status: new.

- the notes themselves (no corrigendum)
- a web search for the notes and a published version (Arithmetic of L-functions, IAS/Park City Mathematics Series), whose text was not obtained

### IntegralIwasawaTheory/E2 — misprint

**Version and locator:** DKSW-RIBET, arXiv:2310.16396v2, Theorem 2.1 p. 8 and §2.1, second defining relation of Q, p. 9.

**Assertion checked.** The local value condition in the theorem uses the scalar χψ⁻¹−1 multiplying its named vector. The construction then imposes the same relation with the opposite scalar 1−χψ⁻¹ and says these named vectors satisfy the theorem.

**Correction.** Either impose the relation with χψ⁻¹−1 in the construction, or use the negatives of the construction’s free vectors as the theorem’s local vectors.

**Check.** In the constructed quotient the displayed relation gives κ(σ)=(1−χψ⁻¹(σ))y_v. Replacing y_v by −y_v produces the theorem’s convention. This changes neither generation nor the Fitting bound and does not invalidate the existence theorem. The roadmap uses the theorem convention, as current IHG.6 already does.

**Review — confirmed.** The local relation and the theorem use opposite signs for the same named generator. Renaming that generator by its negative reconciles them without changing the result.

Effect: nothing. Correction search status: new.

- Theorem 2.1 and §2.1 in the cleared arXiv v2, including Remark 2.2; no correction is stated there.
- Web searches for arXiv:2310.16396 with erratum and for the title with sign correction, 19 October 2026, returned no relevant correction.

## Sources and versions read

Locators above refer to these precise editions, with page numbers in the cited PDF unless the entry specifies printed pagination. The bibliography records the original planning pass and the independent review separately. Unread originals supporting secondary accounts are listed as gaps above.

### DK-2023

Samit Dasgupta; Mahesh Kakde. [On the Brumer–Stark conjecture](https://arxiv.org/pdf/2010.00657v3). arXiv:2010.00657v3 (5 September 2022), the authors' final version of Ann. of Math. 197 (2023), no. 1, 289–388; locators are to the arXiv v3 PDF (its equation numbers).

SHA-256: `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099`.

Planning pass locators:

- §1 Introduction and §§1.1–1.3, pp. 3–13
- §2.1–2.3, Lemmas 2.1–2.7, pp. 14–18
- §3, Lemmas 3.1–3.2, Theorems 3.3, 3.5, 3.7, Corollary 3.8, Remark 3.6, pp. 19–25
- §5, Theorem 5.1 and its setting, p. 31
- §6, properties (P1)–(P4), Lemma 6.1, Corollary 6.2, Lemmas 6.3–6.4, pp. 39–42
- §7.1–7.2.8, Lemmas 7.1–7.2, pp. 43–48
- §8, statements of Theorems 8.8, 8.9, 8.15, 8.17, 8.18, Corollary 8.19 and Theorem 8.23 with its proof, pp. 54–65
- §9, equations (110)–(124), Theorems 9.8, 9.10 with proof, Corollary 9.11, pp. 65–77
- Appendix A, Definition A.2, Lemmas A.5, A.8 and Remark A.7, pp. 82–87
- Appendix B, Lemmas B.1, B.4, B.6–B.7 and Theorem B.8, pp. 89–97

Independent review locators:

- Independent review: §§1–3, pp. 3–27; §§5–9, pp. 31–43 and 50–77; Appendices A–B, pp. 78–97.

### DKSW-BSZ

Samit Dasgupta; Mahesh Kakde; Jesse Silliman; Jiuya Wang. [The Brumer–Stark conjecture over Z](https://arxiv.org/pdf/2310.16399v1). arXiv:2310.16399v1 (25 October 2023).

SHA-256: `e32514db92247fb0a9b4e3fa120161df4ceaf88f5b1339144f26f996662cb6b0`.

Planning pass locators:

- §1 and §§1.1–1.2, Theorems 1.1–1.2, pp. 1–6
- §2.1–2.2, Theorems 2.1–2.4 and the proof of Theorem 1.1, pp. 6–10
- Statements of Theorem 2.7, Remark 2.8, Lemma 2.9, Theorem 2.10, Lemma 2.11 (pp. 13–14) and Theorems 2.14–2.16 (pp. 17–21)
- Statements of Theorems 3.2–3.3, 3.9, Lemma 3.10 and Theorem 3.14, pp. 24–29; the proofs of §§3–5 were not read in full

Independent review locators:

- Independent review: §§1–3, pp. 3–10 and 12–30, including the inclusion/equality argument, local Ribet hypotheses and modular construction statements.

### DKSW-RIBET

Samit Dasgupta; Mahesh Kakde; Jesse Silliman; Jiuya Wang. [The residually indistinguishable case of Ribet's method for GL_2](https://arxiv.org/abs/2310.16396v2). arXiv:2310.16396v2 (26 October 2023), read from the maintainer's cleared library; cited as Dasgupta–Kakde–Silliman–Wang [DKSW], arXiv:2310.16396v2.

Planning pass locators:

- §1 Introduction, Theorems 1.1–1.2 and the sketch of the residually distinguishable case, pp. 2–6

Independent review locators:

- Independent review: Theorems 1.1–1.2, pp. 2–4, and Theorem 2.1 with §2.1, pp. 7–10, read from the maintainer-cleared copy.

### KURIHARA

Masato Kurihara. [On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf). Author manuscript of the contribution to Arithmetic of L-functions, EMS 2025; locators use the manuscript's own pages 1–37.

SHA-256: `22ebb98ed24bcebe814ea2f6ba6b4681d7dbafd309b55f06b02f5807fec8ff33`.

Planning pass locators:

- §2.1, Theorem 2.1, p. 3; §2.3, pp. 6–7
- §2.5, Theorem 2.8 and Corollary 2.9, p. 11; §2.6, Proposition 2.11 and Theorem 2.12, pp. 12–15
- §3.1, Theorems 3.1 and 3.3, pp. 15–17
- §4.1–4.3, Theorem 4.1, Lemma 4.2, the three remarks, Corollary 4.3 and Proposition 4.4, pp. 22–28

Independent review locators:

- §§2.1, 2.3, pp. 3, 6–7; §§2.5–2.6, pp. 11–17; §4, pp. 22–28.

### SHARIFI

Romyar Sharifi. [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf). Public author notes, 189-page PDF retrieved 19 October 2026; undated edition, numbered printed pages (equal to PDF pages).

SHA-256: `e5308be4c3d9ded6002cefb50df64b31f62b584b6ff68be7f21dc939f2508c26`.

Planning pass locators:

- §1.5, Conjecture 1.5.1 to Definition 1.5.9, pp. 28–32
- §2.3–2.4, Definition 2.3.1, Remark 2.4.3 and Lemma 2.4.4, pp. 47–53
- §3.1–3.4, Definitions 3.1.1–3.1.8 through Proposition 3.4.2, pp. 75–90
- §4.5, Definition 4.5.1, p. 113
- §5.3, Proposition 5.3.3 to Corollary 5.3.16, pp. 138–142
- §6.3, Conjecture 6.3.1, Proposition 6.3.2 and Theorem 6.3.3, pp. 164–166

Independent review locators:

- §§1.3, 1.5–1.6, pp. 28–32, 47, 52–53; §§3.1–3.4, pp. 75–90; §4.5, p. 113; §5.3, pp. 138–142; §6.3, pp. 164–166.

### SHARIFI-AWS

Romyar Sharifi. [Modular curves and cyclotomic fields](https://www.math.ucla.edu/~sharifi/aws-iwasawa.pdf). Arizona Winter School lecture notes, public author PDF retrieved 19 October 2026; printed pages.

SHA-256: `3f4bc1f8b721341ab690ee01d86919714ba8875e3f8b8973e3ebef7e1ae7a1d5`.

Planning pass locators:

- §2.2 statement of the Herbrand–Ribet theorem, p. 15
- §2.5, Theorems 2.5.1–2.5.13 and Remarks 2.5.2–2.5.3, pp. 22–25
- §4.2–4.3, Definitions 4.2.1–4.2.6, Definition 4.3.1, Remark 4.3.2, Theorem 4.3.3, Lemma 4.3.4 and the proof of the main conjecture, pp. 45–52

Independent review locators:

- §2.2, p. 15; §2.5, pp. 22–25; §§4.2–4.3, pp. 45–52.

### KOLSTER-2009

Manfred Kolster. [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf). Lecture notes, author PDF from the Maine–Québec Number Theory Conference 2009 site; printed pages.

SHA-256: `5772ace94ba4b247ae745cf32c6b3b079fe25e0de46af057cb4e971a1c3ead28`.

Planning pass locators:

- Lecture 1, §§1–2, Lemmas 1.1–1.2, Main Conjecture 1.3, Proposition 2.1 and Corollary 2.2, pp. 5–11
- Lecture 2, §3, Propositions 3.1–3.2, Theorem 3.3, Corollary 3.4 and Conjecture 3.5, pp. 13–15

Independent review locators:

- Lecture 1, §§1–2, pp. 5–11; Lecture 2, §3, pp. 13–15.

### KOLSTER-1989

Manfred Kolster. [A relation between the 2-primary parts of the main conjecture and the Birch–Tate conjecture](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf). Canad. Math. Bull. 32 (1989), 248–251, DOI 10.4153/CMB-1989-036-8, published PDF from Cambridge Core.

SHA-256: `ce649cf4085c501f755517afb0dd7bc9a9798ad1ee9a37116d7b5aae98073f2f`.

Planning pass locators:

- The whole note, pp. 248–251

Independent review locators:

- The complete four-page note, printed pp. 248–251.

### ROGNES-WEIBEL-2000

John Rognes; Charles Weibel (Appendix A by Manfred Kolster). [Two-primary algebraic K-theory of rings of integers in number fields](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf). J. Amer. Math. Soc. 13 (2000), 1–54; author PDF from C. Weibel's archive; printed pages.

SHA-256: `9d770c079313ccc26f29da641d301269edf12985f122fd107ab201f086e8f446`.

Planning pass locators:

- Appendix A (Kolster), Theorems A.1–A.2, Corollary A.3, Remark A.4 and their proofs, pp. 45–49

Independent review locators:

- Appendix A (Kolster), Theorems A.1–A.2, Corollary A.3 and Remark A.4, pp. 45–49.

### KAKDE-2013

Mahesh Kakde. [The main conjecture of Iwasawa theory for totally real fields](https://arxiv.org/pdf/1008.0142v3). arXiv:1008.0142v3 (19 May 2011); published Invent. Math. 193 (2013), 539–626.

SHA-256: `5a05da0d58f2717422fb401510d9cad4aeeac707313929a796870b92e27ea45c`.

Planning pass locators:

- §3 Classical Iwasawa main conjecture, p. 14

Independent review locators:

- Introduction, main-conjecture discussion, p. 14.

### BURUNGALE-TIAN-2026

Ashay A. Burungale; Ye Tian. [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/pdf/2506.03465v2). arXiv:2506.03465v2 (11 October 2025), author version of Ann. of Math. 203 (2026), no. 1.

SHA-256: `cbb8284a13ed40bd15df9713001485724bc4d2a3b5c38d8fd83f9b6f3f3e4664`.

Planning pass locators:

- §1.0.3, pp. 2–3
- §2.1.1, p. 3
- §2.2.2, p. 4

Independent review locators:

- §1, §§1.0.3–1.0.4, pp. 2–4.

### RJW-PADIC-L

Joaquín Rodrigues Jacinto; Chris Williams. [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2). arXiv:2309.15692v2, 19 December 2024.

SHA-256: `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`.

Planning pass locators:

- §13.1–13.2, Lemma 13.4, Definition 13.5 and the definitions of M_n, L_n for F_n = Q(μ_{p^n}), p. 66

Independent review locators:

- Theorem 15.3, p. 66.
