# Conditional automorphy lifting for GL_n over arbitrary number fields

*Reusable infrastructure for potential automorphy over CM fields, Part II.*

This roadmap starts where PotentialAutomorphyInfrastructure stops. The parent plans the unconditional argument of Allen et al. over CM fields: integral cohomology on complexes, degree shifting, derived Ihara avoidance, Taylor–Wiles primes and ultrapatching. Here we plan the conditional framework from which that argument grew: automorphy lifting for GL_n over an arbitrary number field F, where the cohomology of the locally symmetric spaces of Res_{F/ℚ}PGL_n localized at a non-Eisenstein maximal ideal occupies the l_0 + 1 degrees [q_0, q_0 + l_0], with l_0 = r_1⌊(n−1)/2⌋ + r_2(n − 1). The source is Part 2 of Calegari–Geraghty, *Modularity lifting beyond the Taylor–Wiles method* (Invent. Math. 211, 2018), together with the pieces of its conditional GL_n machinery that the Calegari–Geraghty–Harris appendix (Duke Math. J. 169, 2020) restates and uses.

The end theorems are Theorem 9.19 — under Conjecture B, the dual of H^{q_0}(Y, K/O)_m is a nearly faithful module over the minimal global deformation ring R_S — and Theorem 5.16, conditional modularity lifting for n-dimensional crystalline representations of G_F with Hodge–Tate weights 0, …, n − 1. Both are planned in corrected form. The extraction of the paper recorded that Lemma 8.2 is false as printed, that Theorem 5.16 is stated under weaker hypotheses than Theorem 9.19 is proved, that Conjecture B lacks the compatibility of diamond operators at Taylor–Wiles primes, and many smaller slips; planning found three further points and its review a fourth (sourceIssues E1–E4 of the packet). The statements below are the ones the planned proofs establish.

**Boundaries.** Conjecture B is never asserted: it appears as four named propositions (B^gal, B^lgc, B^van, B^tw) and their bundle, assumed by the theorems that need them. What other roadmaps plan is imported: the commutative algebra of patching, including Calegari–Geraghty's Theorem 6.3, Lemma 6.2 and Theorem 6.4 (DeformationAndDerivedPatchingAlgebra P8, P9, R03.5, R03.6); local and global Galois deformation theory, including Taylor's Ihara-avoidance rings and the minimally ramified rings (LocalGaloisDeformationRings L7, R08.2; GlobalGaloisDeformations R04.x, G8); Greenberg–Wiles and the archimedean count behind l_0 (ArithmeticGaloisDuality R02.5–R02.6); arithmetic quotients, Taylor–Wiles levels, Hecke correspondences, degeneracy maps, boundary and duality (ArithmeticLocallySymmetricSpaces ALS.0–ALS.6); Hecke images, factorial-power projectors, Galois-type maximal ideals and the GL_n Hecke polynomial (IntegralHeckeAndGaloisDeterminants IHG.2–IHG.3, now a TauCetiRoadmap roadmap); the local block theory behind CG18 Theorem 9.16 (SmoothRepresentationsOfLocalGroups SR.5); the Lyndon sequence and Ihara's amalgam (ModularCurvesPartII R14.4, ReductiveGroupsPartII RG2.2); l_0, q_0, Borel–Wallach and Clozel's purity lemma (AutomorphicFormsOnReductiveGroups AF.4); and the congruence-kernel theorems with the localized vanishing of H^0 and H^1 for PGL_3 over ℚ and PGL_2 over CM quartic fields (KTheoryLowDegrees U.4). This roadmap owns what is specific to the Calegari–Geraghty argument: the Taylor–Wiles-level Hecke algebras of Res PGL_n with their projector, the Conjecture B predicates, Lemma 9.6, the instantiation of the local and global deformation data with the numerical coincidence, the complexes D̃_N, the two patching data and their verification, Theorems 9.19 and 5.16, and cuspidal recognition. Not in scope: the unconditional CM-field results (parent PA.3–PA.4 and CrystallineLocalGlobalCompatibilityCM), the coherent-cohomology complexes of CG18 §7.2 (IntegralCoherentHeckeComplexes), the defect-one GL_2 theory of weight-one and Bianchi forms (GL2ModularityLiftingDefectOne), and the deduction of CG18 Theorem 1.1, which ModularityAndLanglandsExtensions ML.2 assembles from Theorem 5.16 here. The appendix's own vanishing theorems and adjoint Selmer statements belong to AdjointSelmerGroupsFromModularityLifting, which imports the predicates of BT.2 and Theorem 5.16.

## Notation and conventions

F is a number field of signature (r_1, r_2), n ≥ 2 (the case n = 1 is the example BT.1/gl1-defect-example), p > n a prime unramified in F, and O the ring of integers of a finite extension K/ℚ_p with uniformizer ϖ and residue field k, large enough that W(k)[1/p] contains every embedding of F; it is enlarged finitely when needed. G = Res_{F/ℚ}PGL_n and Y(K) = G(ℚ)\G(𝔸)/K^0_∞K, with orbifold cohomology at non-neat level. l_0 = r_1⌊(n − 1)/2⌋ + r_2(n − 1) and 2q_0 + l_0 = dim Y (AutomorphicFormsOnReductiveGroups AF.4/l0-q0-invariants). S_p is the set of places above p; R is a finite set of places prime to p, split as R_triv ⊔ R_reg, with N(v) ≡ 1 mod p for v ∈ R_triv (r̄ trivial there) and r̄(σ_v) a single unipotent Jordan block for v ∈ R_reg; S = S_p ⊔ R; T = S_p ∪ R is the set of framed places; Q is a set of Taylor–Wiles primes and S_Q = S ⊔ Q.

Frobenius elements are arithmetic, ε is the p-adic cyclotomic character with ε(Frob_λ) = N(λ), and ξ = ε^{n(n−1)/2}. Hecke operators are unnormalized: T_{λ,i} is the characteristic function of K diag(ϖ_λ^{(i)}, 1^{(n−i)}) K, and the Hecke polynomial is Σ_i (−1)^i N(λ)^{i(i−1)/2} T_{λ,i} X^{n−i} (IntegralHeckeAndGaloisDeterminants IHG.3/gln-hecke-polynomial); with this convention det r_m = ε^{n(n−1)/2}, matching the determinant of the lifts. Levels are hyperspecial at every place outside R ∪ Q, including the places above p, Iwahori at R, and the line stabilizer K_0(x) with its normal subgroup K_1(x) (quotient k_x^×) at x ∈ Q. Completed group and framing rings use power series: S_∞ = O⟦(ℤ_p)^q⟧, O^□ = O⟦z_1, …, z_j⟧. The homological side of every duality uses the dual local system O(χ^{-1}) and the dual maximal ideal m^*.

## How the plan is organized

The roadmap is planned at target level: one node for each target and for each definition or key theorem on the way, with full API and unit tests for every definition. BT.0 is the Hecke side, BT.1 the Galois side, BT.2 Conjecture B, BT.3 the Taylor–Wiles level comparison (condition (5)), BT.4 the complexes and patching data, BT.5 the patching argument and the end theorems. The suggested Lean file (`research/blueprint/suggested/AutomorphyLiftingBeyondTaylorWiles.lean`) types what the pinned libraries can state — the invariants l_0 and q_0, the archimedean count for balanced involutions, the numerical coincidence, the Gram determinant of the degeneracy maps behind Lemma 9.6 and the congruence behind cuspidal recognition — and lists the arithmetic statements that need carriers the pins do not yet have.


## BT.0. Hecke algebras at Taylor–Wiles level

For G = Res_{F/ℚ}PGL_n over an arbitrary number field F: the Iwahori character local systems O(ψ) at a finite set R; the unnormalized Hecke operators T_{α,k}, V_x and diamond operators at Taylor–Wiles level; the Hecke algebras T^an_{Q,ψ} and T_{Q,ψ} of CG18 Definition 9.1, taken on the cohomology of every level between L_Q and K_Q with all coefficients O/ϖ^m; the Taylor–Wiles maximal ideal m_Q and projector e_Q = lim ∏ Q_x(V_x)^{k!}; the residual independence of the character ψ and the dual local system on homology; and Serre modularity of minimal level as the existence of a mod p class at Iwahori level.

**Layer dependencies:** `ArithmeticLocallySymmetricSpaces:ALS.1`, `ArithmeticLocallySymmetricSpaces:ALS.0`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `IntegralHeckeAndGaloisDeterminants:IHG.3`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `ArithmeticLocallySymmetricSpaces:ALS.4`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`.


<a id="bt-bt-0-iwahori-character-local-system"></a>

### The local systems O(ψ) of Iwahori characters

**Target:** `BeyondTW.iwahoriCharLocalSystem` (definition); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.0/iwahori-character-local-system`.

Let F be a number field, G = Res_{F/ℚ}PGL_n with n ≥ 2, p > n a prime, O the ring of integers of a finite extension K/ℚ_p with uniformizer ϖ and residue field k, and R a finite set of finite places of F prime to p. For v ∈ R let Iw(v) ⊂ PGL_n(O_v) be the Iwahori subgroup (upper triangular mod ϖ_v) and Iw_1(v) its pro-v radical, so Iw(v)/Iw_1(v) ≅ (k_v^×)^n/k_v^× (diagonal entries modulo scalars). An Iwahori character datum is ψ = (ψ_v)_{v∈R}, ψ_v = ψ_{v,1} × ⋯ × ψ_{v,n} : (k_v^×)^n → 1 + 𝔪_O with ∏_i ψ_{v,i} = 1, so that ψ_v factors through Iw(v)/Iw_1(v). For a level K whose component at v ∈ R is Iw(v), O(ψ) is the rank-one local system on Y(K) = G(ℚ)\G(𝔸)/K^0_∞K whose sections over U are the locally constant f on the preimage of U in Y(K ∩ ∏_{v∈R}Iw_1(v)) with f(γu) = ψ(γ)f(u) for γ ∈ ∏_{v∈R}Iw(v)/Iw_1(v). Write H^i_ψ(Y(K), A) := H^i(Y(K), O(ψ) ⊗_O A) and H_{i,ψ} for homology.

**Hypotheses and conventions.**

- n ≥ 2; v ∈ R are finite places prime to p
- ψ_{v,i} take values in 1 + 𝔪_O, so they have p-power order and are trivial unless p | N(v) − 1
- The product condition ∏_i ψ_{v,i} = 1 is what makes ψ_v a character of the PGL_n Iwahori quotient

**Construction or proof.**

1. The quotient Iw(v)/Iw_1(v) is the torus of PGL_n over k_v; a character of (k_v^×)^n trivial on the diagonal k_v^× descends to it.
2. O(ψ) is the arithmetic local system attached to the smooth O[K]-module O on which K acts through K → ∏_{v∈R}Iw(v)/Iw_1(v) and ψ (ALS.1 arithmetic-local-system).
3. Cohomology and homology with coefficients in O(ψ) ⊗ A are computed by the Betti complexes of ALS.1, with coefficient change along O → A.

**Uses.** CG18 Conjecture B(3), p. 414: fixes the inertial characteristic polynomial at v ∈ R to ∏_i(X − ψ_{v,i}(Art_v^{-1}σ)). CG18 §9.5, pp. 425–426: the two patching data use ψ = 1 and ψ = χ; their cohomologies agree mod ϖ. BT.4/localized-tw-complexes: the χ-twisted complexes are built from O(χ^{-1}).

**API.**

- `BeyondTW.iwahoriCharLocalSystem` (constructor): The local system O(ψ) on Y(K) for an Iwahori character datum ψ at R.
- `BeyondTW.iwahoriCharLocalSystem_one` (simp): O(1) ≅ O, compatibly with Hecke operators away from R.
- `BeyondTW.iwahoriCharLocalSystem_mod_varpi` (characterisation): O(ψ) ⊗_O k ≅ k for every datum ψ with values in 1 + 𝔪_O.
- `BeyondTW.iwahoriCharLocalSystem_dual` (compatibility): Hom_O(O(ψ), O) ≅ O(ψ^{-1}), and Poincaré duality pairs H^*_ψ with H_{*,ψ^{-1}}.
- `BeyondTW.iwahoriCharLocalSystem_pullback` (functoriality): Pullback along a change of level away from R preserves O(ψ).

**Unit tests.**

- `iwahoriChar_trivial` (degenerate): For ψ = 1 and any A, H^i_ψ(Y(K), A) = H^i(Y(K), A).
- `iwahoriChar_needs_congruence` (computation): If N(v) ≢ 1 mod p then every character (k_v^×)^n → 1 + 𝔪_O is trivial, so O(ψ) = O at v.
- `iwahoriChar_product_condition` (non-example): A tuple (ψ_{v,1}, …, ψ_{v,n}) with nontrivial product does not descend to Iw(v)/Iw_1(v) ⊂ PGL_n and defines no local system on Y(K).
- `iwahoriChar_residual` (compatibility): H^i_χ(Y(K), k) = H^i(Y(K), k) for every χ with values in 1 + 𝔪_O.

**Acceptance.**

- For ψ = 1, O(ψ) is the constant local system O and H^*_ψ = H^*.
- Since every ψ_{v,i} ≡ 1 mod ϖ, O(ψ)/ϖ is the constant local system k.
- The dual local system is O(ψ^{-1}).

**Direct prerequisites:** `ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system`; `ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups`; `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`.

**Source:** CG18, §9.1, published pp. 411–412: The character ψ of the Iwahori quotient and the local system O(ψ) on the arithmetic quotients, with H^i_ψ and H_{i,ψ}, are defined there; trivial ψ gives O. CG18, §9.5, published p. 426 (sourceIssues E207 of PAPER-CALEGARI-GERAGHTY-18): The homology side must use the dual local system O(χ^{-1}); recorded here as part of the API.


<a id="bt-bt-0-tw-hecke-operators"></a>

### Hecke operators T_{α,k}, V_x and diamond operators at Taylor–Wiles level

**Target:** `BeyondTW.heckeOp` (definition); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.0/tw-hecke-operators`.

Keep the notation of BT.0/iwahori-character-local-system, and let Q be a finite set of finite places disjoint from S_p ∪ R with K_Q ⊃ L_Q the Taylor–Wiles levels of ALS.0/standard-level-subgroups (hyperspecial at every place outside R ∪ Q, including those above p; Iwahori at R; at x ∈ Q the line-stabilizer K_0(x) and its normal subgroup K_1(x) with K_0(x)/K_1(x) ≅ k_x^×). For K one of K_Q, L_Q or an intermediate level L_Q ⊆ K′ ⊆ K_Q, and g ∈ G(𝔸^∞) trivial at every place of R, T(g) is the correspondence H^*_ψ(Y(K)) → H^*_ψ(Y(K ∩ gKg^{-1})) → H^*_ψ(Y(g^{-1}Kg ∩ K)) → H^*_ψ(Y(K)) (pullback, translation by g, trace), with the same formula on homology. For α ∈ 𝔸_F^{∞,×} and 1 ≤ k ≤ n, T_{α,k} := T(diag(α, …, α, 1, …, 1)) with k entries α. For a prime λ ∉ S_Q, T_{λ,k} := T_{α,k} with α a uniformizer at λ and 1 elsewhere: this is the unnormalized operator, the characteristic function of K diag(ϖ_λ^{(k)}, 1^{(n−k)}) K. For x ∈ Q, V_x := T_{x,1}, well defined up to diamond operators. For δ ∈ Δ̃_Q := K_Q/L_Q ≅ ∏_{x∈Q} k_x^× the diamond operator ⟨δ⟩ acts on H^*_ψ(Y_1(Q)) as a deck transformation of Y_1(Q) → Y_0(Q); for α ∈ ∏_{x∈Q}O_x^×, T_{α,1} acts through the class of α in Δ̃_Q.

**Hypotheses and conventions.**

- g trivial at R so that the correspondence preserves O(ψ)
- No normalization by powers of N(λ) (sourceIssues E180 of PAPER-CALEGARI-GERAGHTY-18)
- Δ̃_Q is identified with ∏ k_x^× by g ≡ (a ∗; 0 B) ↦ det(B)·a^{1−n} (ALS.0/standard-level-subgroups (iii)–(iv) give K_0(x)/K_1(x) ≅ k_x^×; this explicit map is the one fixed in sourceIssues E181 of PAPER-CALEGARI-GERAGHTY-18)

**Construction or proof.**

1. The correspondences and their composition law are ALS.3 (hecke-operator-formula, hecke-composition); they lift to the derived category (ALS.3/derived-hecke-action).
2. At λ ∉ S_Q the T_{λ,k} commute and generate the spherical Hecke algebra; IHG.3/gln-hecke-polynomial fixes the polynomial convention.
3. For α ∈ ∏ O_x^× the element diag(α,1,…,1) lies in K_Q, so T_{α,1} is the deck transformation by its class; with the identification above that class is α^{1−n}, and since p > n the T_{α,1} run over the p-part of Δ̃_Q.

**Uses.** CG18 Conjecture B, p. 414: the characteristic polynomial of r̄_m(Frob_λ) is written in the T_{λ,i}. CG18 §9.5 and §7.1, pp. 394, 425: V_x enters the Taylor–Wiles projector ∏_x Q_x(V_x)^{k!}. BT.2/conj-b-local-global clause (6): the T_{α,1}, α ∈ ∏O_x^×, are compared with inertia at x ∈ Q.

**API.**

- `BeyondTW.heckeOp` (constructor): T(g) on H^*_ψ(Y(K), A) and on the Betti complex, for g trivial at R.
- `BeyondTW.heckeOp_comm` (relation): The T_{λ,k} for λ ∉ S_Q commute with each other, with V_x and with diamond operators.
- `BeyondTW.diamond` (data): The action of Δ̃_Q on H^*_ψ(Y_1(Q), A) by deck transformations, making it an O[Δ̃_Q]-module.
- `BeyondTW.heckeOp_unit_eq_diamond` (characterisation): For α ∈ ∏_{x∈Q}O_x^× (1 elsewhere), T_{α,1} = ⟨α^{1−n}⟩.
- `BeyondTW.heckeOp_central` (simp): T_{λ,n} = 1 on PGL_n.
- `BeyondTW.heckeOp_pullback` (functoriality): Pullback along Y(K′) → Y(K″) commutes with T_{λ,k} for λ ∉ S_Q.

**Unit tests.**

- `heckeOp_unnormalized_n2` (computation): For n = 2 at level K_∅, the eigenvalue of T_{λ,1} on the class of a weight-two eigenform f is a_λ(f), not N(λ)^{-1}a_λ(f).
- `heckeOp_identity` (degenerate): T_{α,k} with α = 1 is the identity on H^*_ψ(Y(K), A).
- `heckeOp_diamond_trivial_Q_empty` (degenerate): For Q = ∅, Δ̃_Q is trivial and K_Q = L_Q.
- `heckeOp_not_normalized` (non-example): With the printed normalization T_{λ,i} = N(λ)^{-i}T_{α,i}, the Conjecture B polynomial would have determinant N(λ)^{n(n−1)/2 − n}, contradicting det r̄_m = ε̄^{n(n−1)/2}.

**Acceptance.**

- T_{α,k} for α ≡ 1 at all finite places is the identity.
- On H^*(Y(K_∅)) with n = 2, T_{λ,1} is the classical T_λ and T_{λ,2} the diamond-type operator ⟨λ⟩ (trivial on PGL_2).
- T_{λ,n} = 1 on PGL_n since diag(ϖ,…,ϖ) is central.

**Direct prerequisites:** `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula`; `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-composition`; `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`; `ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups`; `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`; [The local systems O(ψ) of Iwahori characters](#bt-bt-0-iwahori-character-local-system).

**Source:** CG18, §9.2, published pp. 412–413: Defines T(g) by corestriction, translation and the natural map on homology, the operators T_{α,k} = T(diag(α^{(k)},1^{(n−k)})) and T_{𝔞,k}; the printed normalization by N(𝔞)^{-k} is corrected to the unnormalized operator (E180). CG18, §9.3, Conjecture B(5), published pp. 414–415: V_x := T_{x,1} is used at Taylor–Wiles primes; it is well defined modulo the maximal ideal m. CG18, §9.5, published p. 425: The covering Y_1(Q_N) → Y_0(Q_N) has group Δ̃ = ∏_{x∈Q_N}(O_F/x)^× (sourceIssues E204 fixes the index set). CGH20, §3.1, arXiv pp. 4–5 (published appendix §A.3.1): The appendix restates the anemic algebra generated by T_{α,i} with α a unit at the level, citing CG18 Definition 9.1.


<a id="bt-bt-0-tw-hecke-algebra"></a>

### The Hecke algebras T^an_{Q,ψ} and T_{Q,ψ} (Definition 9.1)

**Target:** `BeyondTW.heckeAlgebra` (definition); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.0/tw-hecke-algebra`; planet: *Taylor–Wiles Hecke algebra*.

With Q and ψ as above, let 𝒦_Q be the set of levels K′ with L_Q ⊆ K′ ⊆ K_Q. T^an_{Q,ψ} is the O-subalgebra of End_O(⊕_{K′∈𝒦_Q} ⊕_{k,m} H^k_ψ(Y(K′), O/ϖ^m)) generated by the T_{α,k} (1 ≤ k ≤ n) with α a unit at every place of S_Q = S_p ∪ R ∪ Q. T_{Q,ψ} is the O-algebra generated by T^an_{Q,ψ} and the V_x = T_{x,1}, x ∈ Q, together with the diamond operators. Write T_ψ := T_{∅,ψ} = T^an_{∅,ψ} and T := T_1. Both are finite O-algebras, hence semilocal and the products of their completions at maximal ideals; for a maximal ideal m, T^an_{Q,ψ,m} is finite (not necessarily flat) over O. Two maximal ideals of T_{Q,ψ} give rise to the same Galois representation when they have the same contraction to T^an_{Q,ψ}.

**Hypotheses and conventions.**

- Hecke operators as in BT.0/tw-hecke-operators
- The direct sum runs over every intermediate level between L_Q and K_Q; this is the form needed in §9.5 (see sourceIssues E1 of this packet)
- Coefficients O/ϖ^m for all m ≥ 1, so the algebra acts on every finite coefficient cohomology group (CG18 Remark 9.2)

**Construction or proof.**

1. The algebra generated by commuting operators on a finite O-module is a finite commutative O-algebra (IHG.2/cohomology-hecke-image applied to the Betti complexes of ALS.1, which have finite cohomology).
2. Finite algebras over the complete local ring O decompose as the product of their localizations at maximal ideals (IHG.2/finite-hecke-local-factors).
3. The restriction of the action to a single level K′ gives the image algebra of that level as a quotient of T^an_{Q,ψ}; pullback and trace between levels are Hecke equivariant for operators prime to S_Q.

**Uses.** BT.2/conj-b-galois-type: Conjecture B attaches r̄_m and r_m to its maximal ideals. CG18 §9.5, p. 427: R_{S_Q} acts on the cohomology of every Y_{Δ_N}(Q_M) through T^an_{Q,ψ,m}. CGH20 §3.1, Theorem 3.2 (appendix A.4): the localized cohomology at m_α of Y_1(Q) is taken for this algebra with U_x − α_x.

**API.**

- `BeyondTW.heckeAlgebra` (constructor): T^an_{Q,ψ} as a commutative O-subalgebra of the endomorphisms of the stated direct sum.
- `BeyondTW.heckeAlgebraFull` (constructor): T_{Q,ψ} = T^an_{Q,ψ}[V_x, ⟨δ⟩].
- `BeyondTW.heckeAlgebra_finite` (instance): T^an_{Q,ψ} and T_{Q,ψ} are finite O-algebras; Module.Finite O.
- `BeyondTW.heckeAlgebra_localization_prod` (structure): T^an_{Q,ψ} ≅ ∏_m T^an_{Q,ψ,m}.
- `BeyondTW.heckeAlgebra_restrict` (projection): For each K′ ∈ 𝒦_Q, the surjection onto the image algebra acting on ⊕_{k,m}H^k_ψ(Y(K′), O/ϖ^m).
- `BeyondTW.SameGaloisRep` (relation): Maximal ideals of T_{Q,ψ} with equal contraction to T^an_{Q,ψ}.
- `BeyondTW.heckeAlgebra_empty` (simp): For Q = ∅, T_{∅,ψ} = T^an_{∅,ψ}.

**Unit tests.**

- `heckeAlgebra_level_one_Q` (computation): For F = ℚ, n = 2, R = Q = ∅ and p > 3, H^*(Y, O/ϖ^m) is O/ϖ^m in degree 0 (H^1(PSL_2(ℤ), O/ϖ^m) = 0 since PSL_2(ℤ) ≅ ℤ/2 ∗ ℤ/3), T_{λ,1} acts by 1 + λ, so T^an_{∅,1} = O and its unique maximal ideal is Eisenstein.
- `heckeAlgebra_finite_O` (characterisation): T^an_{Q,ψ} is a finite O-module and every maximal ideal has residue field finite over k.
- `heckeAlgebra_not_flat` (non-example): T^an_{Q,ψ,m} need not be O-flat: if H^*_ψ(Y, O)_m is ϖ-torsion, T^an_{Q,ψ,m} is killed by a power of ϖ.
- `heckeAlgebra_intermediate_needed` (non-example): The image algebra of Y_1(Q) alone need not act on H^*(Y_Δ(Q), O/ϖ^m): an operator killing all H^*(Y_1(Q), O/ϖ^m) acts on H^*(Y_Δ(Q), O/ϖ^m) only nilpotently, through the Hochschild–Serre filtration.

**Acceptance.**

- For Q = ∅ the set 𝒦_Q is {K_∅} and T^an_{∅,ψ} is the anemic algebra of CG18 Definition 9.1.
- T^an_{Q,ψ} acts on H^*_ψ(Y_Δ(Q), O/ϖ^m) for every quotient Δ of Δ̃_Q.
- For F = ℚ, n = 2 and level one, T^an_{∅,1} = O acting on H^0 by T_{λ,1} = 1 + λ.

**Direct prerequisites:** [Hecke operators T_{α,k}, V_x and diamond operators at Taylor–Wiles level](#bt-bt-0-tw-hecke-operators); `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`; `IntegralHeckeAndGaloisDeterminants:IHG.2/cohomology-hecke-image`; `IntegralHeckeAndGaloisDeterminants:IHG.2/finite-hecke-local-factors`; `ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal`.

**Source:** CG18, §9.2, Definition 9.1 and Remark 9.2, published pp. 413–414: Defines T^an_{Q,ψ} on ⊕_{k,n}H^k_ψ(Y_1(Q), O/ϖ^n) generated by the T_{α,k} with α a unit at S_Q, T_{Q,ψ} with the operators at Q, and T_ψ for Q = ∅; Remark 9.2 explains the use of all O/ϖ^n coefficients. CG18, §7.1, published p. 394: In practice T = T^an[U_x : x ∈ Q]; two maximal ideals give the same Galois representation iff they contract to the same ideal of T^an. CG18, §9.5, proof of Theorem 9.19, published p. 427: The proof uses an action on H^*(Y_{Δ_N}(Q_M), O/ϖ^n)_m for the intermediate covers, which is why the algebra here includes every intermediate level.


<a id="bt-bt-0-tw-maximal-ideal-and-projector"></a>

### The Taylor–Wiles maximal ideal m_Q and projector e_Q

**Target:** `BeyondTW.twMaximalIdeal` (definition); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.0/tw-maximal-ideal-and-projector`; planet: *Taylor–Wiles projector*.

Let m be a maximal ideal of T^an_{Q,ψ} with residue field k. For each x ∈ Q fix a factorization P_x(X) = (X − α_x)Q_x(X) in k[X] of a monic polynomial of degree n with Q_x(α_x) ≠ 0. In the application P_x is the characteristic polynomial of r̄(Frob_x) for the residual representation r̄ of a standing datum (BT.1/ihara-avoidance-data), r̄|G_x ≅ s̄_x ⊕ ψ̄_x with ψ̄_x a one-dimensional generalized Frobenius eigenspace, and α_x := ψ̄_x(Frob_x). m_Q is the maximal ideal of T_{Q,ψ} generated by m and the V_x − α̃_x (x ∈ Q), for any lifts α̃_x ∈ O. The Taylor–Wiles projector is e_Q := lim_{k→∞} ∏_{x∈Q} Q̃_x(V_x)^{k!}, with Q̃_x any lift of Q_x to O[X]. On every finite T_{Q,ψ}-module M supported above m it is the idempotent projecting onto ⊕_𝔫 M_𝔫, the sum over the maximal ideals 𝔫 of T_{Q,ψ} above m at which no V_x is congruent to a root of Q_x; when the residual eigenvalues of every V_x on M are roots of P_x, this is the localization M_{m_Q}.

**Hypotheses and conventions.**

- α_x a simple root of P_x, as for the one-dimensional generalized eigenspace ψ̄_x at a Taylor–Wiles prime (BT.1/numerical-coincidence)
- Limits are in the profinite topology of the finite O-algebra T_{Q,ψ,m}

**Construction or proof.**

1. By IHG.2/factorial-localizing-idempotent, for t ∈ T_{Q,ψ,m} the powers t^{k!} converge to the idempotent which is 1 on the local factors where t is a unit and 0 where t lies in the maximal ideal.
2. Q̃_x(V_x) is a unit exactly on the local factors 𝔫 where V_x mod 𝔫 is not a root of Q_x. These include the factors where V_x ≡ α_x, since Q_x(α_x) ≠ 0, and they are exactly those factors when the residual eigenvalues of V_x are roots of P_x. For n = 2 at a Taylor–Wiles prime the m-part may a priori contain a factor with V_x ≡ ±1, which e_Q keeps; this is why Lemma 9.6 localizes at m̃ = (m, U_x − α_x) (E229 of PAPER-CALEGARI-GERAGHTY-18).
3. The product over x ∈ Q of these commuting idempotents is the idempotent of the factors described in the statement (the m_Q-factor under the eigenvalue condition); it commutes with diamond operators and with the T^an_{Q,ψ}-action.

**Uses.** BT.2/conj-b-tw-comparison: Conjecture B(5) is an isomorphism onto the m_Q-part via e_Q followed by the projection to that part. BT.4/localized-tw-complexes: the complexes D̃_N compute e_Q-projected homology. BT.3/distinct-eigenvalue-comparison: e_α of §9.4 is the case Q = {x}.

**API.**

- `BeyondTW.twMaximalIdeal` (constructor): m_Q ⊂ T_{Q,ψ} from m and the choices α_x.
- `BeyondTW.twProjector` (constructor): e_Q as an idempotent of T_{Q,ψ,m}.
- `BeyondTW.twProjector_isIdempotent` (simp): e_Q² = e_Q.
- `BeyondTW.twProjector_range` (characterisation): e_Q M = ⊕_𝔫 M_𝔫 over the maximal ideals 𝔫 of T_{Q,ψ} above m at which no V_x is congruent to a root of Q_x, for every finite T_{Q,ψ}-module M supported above m; this is M_{m_Q} when every residual eigenvalue of every V_x on M is a root of P_x.
- `BeyondTW.twProjector_indep` (extensionality): e_Q does not depend on the lifts of α_x and Q_x.
- `BeyondTW.twProjector_comm_diamond` (relation): e_Q commutes with diamond operators and with T^an_{Q,ψ}.

**Unit tests.**

- `twProjector_empty` (degenerate): For Q = ∅, e_Q = 1 and m_Q = m.
- `twProjector_n2` (computation): For n = 2 and Q = {x} with eigenvalues α_x ≠ β_x, e_Q = lim(V_x − β̃_x)^{k!} and it kills the generalized β_x-eigenspace of V_x.
- `twProjector_toy_operator` (computation): On O² with V = diag(α̃, β̃), α̃ ≢ β̃ mod ϖ, the projector lim(V − β̃)^{k!} equals diag(1, 0).
- `twProjector_needs_simple_root` (non-example): If α_x is a double root of P_x then Q_x(α_x) = 0 and lim Q_x(V_x)^{k!} kills the α_x-part instead of isolating it.
- `twProjector_keeps_nonroot` (non-example): For n = 2 and Q = {x} with residual eigenvalues α_x, β_x ∉ {±1}, on O with V_x acting by 1 (a Steinberg-type eigenvalue), lim (V_x − β̃_x)^{k!} = 1, so e_Q keeps this line although it is not in the m_Q-part; e_Q cuts out M_{m_Q} only under the eigenvalue condition.

**Acceptance.**

- For Q = ∅, m_Q = m and e_Q = 1.
- For n = 2, e_Q = lim ∏(V_x − β̃_x)^{k!} with β_x the other eigenvalue (CG18 §7.1, p. 395).
- The definition is independent of the lifts α̃_x and Q̃_x.

**Direct prerequisites:** [The Hecke algebras T^an_{Q,ψ} and T_{Q,ψ} (Definition 9.1)](#bt-bt-0-tw-hecke-algebra); `IntegralHeckeAndGaloisDeterminants:IHG.2/factorial-localizing-idempotent`; `IntegralHeckeAndGaloisDeterminants:IHG.2/finite-hecke-local-factors`.

**Source:** CG18, §9.3, Conjecture B(5), published pp. 414–415: Defines P_x = (X − α_x)Q_x, m_Q containing m and V_x − α_x, and the map lim ∏ Q_x(V_x)^{k!}. CG18, §7.1, published pp. 394–395: The projector P_x commuting with diamond operators and cutting out the localization at m; for GL_2, lim(U_x − β_x)^{n!}. CGH20, §3.1, Theorem 3.2, arXiv p. 5: The localization at m_α for the algebra T_Q containing U_x − α_x.


<a id="bt-bt-0-residual-character-independence"></a>

### Residual independence of the Iwahori character and the dual local system

**Target:** `BeyondTW.residual_character_independence` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.0/residual-character-independence`.

Let χ = (χ_v)_{v∈R} be an Iwahori character datum. (1) For every level K with Iwahori components at R, O(χ) ⊗ k ≅ k, giving H^*_χ(Y(K), k) ≅ H^*(Y(K), k) and H_{*,χ}(Y(K), k) ≅ H_*(Y(K), k), equivariantly for every Hecke operator T(g) with g trivial at R and for diamond operators. (2) Consequently each maximal ideal m of T_1 determines a maximal ideal of T_χ (also written m) with the same residual Hecke eigenvalues, and r̄_m (when Conjecture B gives it) is the same for both. (3) Under B(4)(b) at m, H^*_χ(Y(K), O/ϖ^m)^∨_m ≅ H_{*,χ^{-1}}(Y(K), O/ϖ^m)_{m^*}, where m^* is the dual maximal ideal (Remark 9.5) and the homology uses the dual local system O(χ^{-1}).

**Hypotheses and conventions.**

- χ_{v,i} take values in 1 + 𝔪_O
- For (3): boundary vanishing at m (Conjecture B(4)(b)) and Poincaré–Verdier duality on Y(K)

**Construction or proof.**

1. (1) O(χ) ⊗_O k is the constant sheaf since χ ≡ 1 mod ϖ (BT.0/iwahori-character-local-system), and the Hecke correspondences on both sides are given by the same pullback, translation and trace.
2. (2) The isomorphism of (1) intertwines the generators T_{α,k}, so the residual systems of eigenvalues agree; Chebotarev and Brauer–Nesbitt identify the residual representations.
3. (3) Duality pairs H^i_c(Y, O(χ)) with H^{d−i}(Y, O(χ^{-1})) and identifies compactly supported cohomology with homology (ALS.5 finite-level duality); boundary vanishing identifies compactly supported and ordinary cohomology at m; Hecke adjoints send m to m^*.

**Acceptance.**

- (1) holds for every Taylor–Wiles level and every intermediate cover.
- In (3) the local system on the homology side is O(χ^{-1}), not O(χ) (sourceIssues E207 of the extraction).
- For χ = 1, (3) is CG18 Remark 9.5.

**Direct prerequisites:** [The local systems O(ψ) of Iwahori characters](#bt-bt-0-iwahori-character-local-system); [Hecke operators T_{α,k}, V_x and diamond operators at Taylor–Wiles level](#bt-bt-0-tw-hecke-operators); [The Hecke algebras T^an_{Q,ψ} and T_{Q,ψ} (Definition 9.1)](#bt-bt-0-tw-hecke-algebra); `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`.

**Source:** CG18, §9.5, published p. 426: Since χ is trivial mod ϖ, H^*(Y, O/ϖ) ≅ H^*_χ(Y, O/ϖ) and m induces a maximal ideal of T_χ. CG18, §9.3, Remark 9.5, published p. 416: The patched complexes compute H^*(Y, O/ϖ^n)^∨_m = H_*(Y, O/ϖ^n)_{m^*}, using boundary vanishing (E187 fixes m^*). CG18, §9.5, published pp. 425–426: The χ-version of the duality is printed with H_{*,χ}; the extraction's E207 corrects it to O(χ^{-1}).


<a id="bt-bt-0-serre-modular-minimal-level"></a>

### Serre modular of minimal level

**Target:** `BeyondTW.SerreModularMinimal` (definition); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.0/serre-modular-minimal-level`; planet: *Serre modular of minimal level*.

Let r̄ : G_F → GL_n(k) be continuous and absolutely irreducible, and let R(r̄) be the set of finite places v ∤ p at which r̄ is ramified. r̄ is Serre modular of minimal level if there is a maximal ideal m of T = T_{∅,1} at the level K_∅(R(r̄)) (hyperspecial outside R(r̄), Iwahori at R(r̄)) such that m is of Galois type for the Hecke polynomial of BT.0/tw-hecke-operators (IntegralHeckeAndGaloisDeterminants IHG.3/galois-type-maximal-ideal; this is the residual part of B^gal, BT.2/conj-b-galois-type) with residual representation r̄_m ≅ r̄ ⊗_k k(m). Equivalently, H^*(Y(K_∅(R(r̄))), k)_m ≠ 0 for a maximal ideal m whose Hecke polynomials at λ ∉ S are the characteristic polynomials of r̄(Frob_λ).

**Hypotheses and conventions.**

- r̄ has at worst unipotent ramification away from p (the setting of CG18 §8.5), so that Iwahori level at R(r̄) is the minimal level; for other ramification Iwahori level is not minimal
- The level at R(r̄) is Iwahori, which realizes the Serre conductor exponent n − 1 when r̄(σ_v) is a single unipotent Jordan block (the case BT.5/theorem-5-16 uses)
- This is a statement about a mod p class only; no characteristic-zero lift is asserted

**Construction or proof.**

1. The Hecke polynomial convention is IHG.3/gln-hecke-polynomial; Galois type is IHG.3/galois-type-maximal-ideal.
2. The equivalence of the two formulations is Chebotarev density together with Brauer–Nesbitt (uniqueness of semisimple representations with given characteristic polynomials).
3. Nonvanishing of H^*(Y, k)_m is equivalent to m lying in the support of the finite T-module H^*(Y, k).

**Uses.** BT.5/maximal-ideal-from-hypothesis-8: case (8b) of Theorem 5.16 supplies m directly. BT.5/theorem-5-16: hypothesis (8b).

**API.**

- `BeyondTW.SerreModularMinimal` (constructor): The predicate on r̄ described above.
- `BeyondTW.SerreModularMinimal.maximalIdeal` (projection): The maximal ideal m of T at level K_∅(R(r̄)) with r̄_m ≅ r̄.
- `BeyondTW.SerreModularMinimal.iff_cohomology` (characterisation): Equivalence with nonvanishing of H^*(Y(K_∅(R(r̄))), k)_m for the m cut out by the characteristic polynomials of r̄.
- `BeyondTW.SerreModularMinimal.extendScalars` (functoriality): Invariance under finite extension of k.

**Unit tests.**

- `serreModular_GL2_Q_weight2` (compatibility): For F = ℚ, n = 2 and r̄ with Serre conductor N, Serre modularity of minimal level is equivalent to r̄ arising from a mod p weight-2 eigenform on Γ_0(N) (Iwahori level at the primes of N, as r̄ is unipotently ramified there).
- `serreModular_reducible_excluded` (non-example): A reducible r̄ = 1 ⊕ ε̄ is excluded by absolute irreducibility, although it is the residual representation of Eisenstein classes.
- `serreModular_unramified_level` (degenerate): If r̄ is unramified outside p then the level is K_∅(∅), hyperspecial everywhere.
- `serreModular_characteristic_zero_not_required` (characterisation): A class in H^*(Y, k)_m that does not lift to characteristic zero still witnesses Serre modularity.

**Acceptance.**

- For n = 2 and F = ℚ this is the existence of a mod p eigenform of weight 2 and level Γ_0-type at the conductor primes with the given Galois representation, the weight-2 form of Serre's conjecture.
- Serre modularity of minimal level is invariant under replacing k by a finite extension.
- It is not preserved by cyclic base change in general (CG18, remark after Theorem 5.16).

**Direct prerequisites:** [The Hecke algebras T^an_{Q,ψ} and T_{Q,ψ} (Definition 9.1)](#bt-bt-0-tw-hecke-algebra); `IntegralHeckeAndGaloisDeterminants:IHG.3/galois-type-maximal-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`; `ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups`.

**Source:** CG18, Theorem 5.16(8)(b) and the remark after it, published pp. 383–384: Condition (8b) is only a statement about the existence of a mod p cohomology class of level N(r̄), the natural generalization of Serre's conjecture. CG18, §9.5, published p. 425: The proof assumes a maximal ideal m of T = T_{∅,1} with r̄_m ≅ r̄; minimal level makes the Iwahori set R the ramification set of r̄.


## BT.1. The Galois side: Ihara-avoidance data and the numerical coincidence

A standing datum (F, n, p, O, r̄, ξ = ε^{n(n−1)/2}, R = R_triv ⊔ R_reg, χ) with r̄ Fontaine–Laffaille at p, trivial on R_triv and a single unipotent block on R_reg; the local rings R^1_loc and R^χ_loc (Fontaine–Laffaille, Taylor's unipotent and χ-rings, minimally ramified rings); Lemma 8.2 in corrected form (equidimensional with characteristic-0 minimal primes, R^1/ϖ = R^χ/ϖ, Spec R^χ_loc irreducible, unique components above special components); the global data S_Q, S^χ_Q with their O[Δ_Q]-structure; Lemma 8.3 and Proposition 8.4; the numerical coincidence of Proposition 8.5 with g = q + |T| − 1 − [F:ℚ]n(n−1)/2 − l_0; the type-S criterion for lifts; and the GL_1 example with l_0 = r_1 + r_2 − 1.

**Layer dependencies:** `LocalGaloisDeformationRings:L7`, `ArithmeticGaloisRepresentations:G7`, `ArithmeticGaloisDuality:R02.6`, `AutomorphyLiftingBeyondTaylorWiles:BT.0`, `LocalGaloisDeformationRings:R08.2`, `GlobalGaloisDeformations:R04.2`, `GlobalGaloisDeformations:G8`, `DeformationAndDerivedPatchingAlgebra:R03.1`, `GlobalGaloisDeformations:R04.3`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `GlobalGaloisDeformations:R04.4`, `ArithmeticGaloisDuality:R02.5`, `AutomorphicFormsOnReductiveGroups:AF.4`, `GlobalGaloisDeformations:R04.5`, `PadicHodgeTheory:R06.4`, `AdelicAlgebraicGroups:AA.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.


<a id="bt-bt-1-ihara-avoidance-data"></a>

### Standing residual data with an Ihara-avoidance set

**Target:** `BeyondTW.StandingData` (definition); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.1/ihara-avoidance-data`; planet: *Ihara-avoidance datum*.

A standing datum consists of: a number field F of signature (r_1, r_2); an integer n ≥ 2; a prime p > n unramified in F; the ring of integers O of a finite extension K/ℚ_p with residue field k such that W(k)[1/p] contains the images of all embeddings F ↪ Q̄_p; a continuous absolutely irreducible r̄ : G_F → GL_n(k); the character ξ = ε^{n(n−1)/2} : G_F → O^× (ε the p-adic cyclotomic character, ε(Frob_λ) = N(λ) for arithmetic Frobenius); and a finite set R of finite places of F, disjoint from S_p, written R = R_triv ⊔ R_reg, together with characters χ = (χ_v)_{v∈R_triv}, χ_v = (χ_{v,1}, …, χ_{v,n}), χ_{v,i} : k_v^× → 1 + 𝔪_O (equivalently, characters of O_{F_v}^× trivial on 1 + 𝔭_v) pairwise distinct with ∏_i χ_{v,i} = 1, evaluated on I_v through Art_v^{-1} (sourceIssues E168 of PAPER-CALEGARI-GERAGHTY-18). It is required that: (a) for every v | p, r̄|G_v is Fontaine–Laffaille with weights {0, 1, …, n − 1} for each embedding τ (LocalGaloisDeformationRings L7/fontaine-laffaille-deformation-condition); (b) N(v) ≡ 1 mod p for every v ∈ R_triv (no congruence is imposed on R_reg); (c) r̄|G_v is trivial for v ∈ R_triv; (d) for v ∈ R_reg, r̄|I_v is unipotent and r̄(σ_v) is a single Jordan block, σ_v a generator of tame inertia; (e) r̄ is unramified outside S_p ∪ R; (f) r̄ is odd (balanced) at every real place v: the ±1-eigenspaces of r̄(c_v) have dimensions differing by at most one (ArithmeticGaloisRepresentations G7/oddness-at-real-places (d)); in characteristic p > n this is the trace condition Tr r̄(c_v) ∈ {−1, 0, 1} except when n is even and p = n + 1 (sourceIssues E164); (g) det r̄ = ε̄^{n(n−1)/2}. Put S = S_p ⊔ R and T = S_p ∪ R (the framed places); the Iwahori character datum of BT.0 is ψ = 1 or ψ = χ, with χ extended by 1 on R_reg, viewed as a character of Iw(v)/Iw_1(v) ≅ (k_v^×)^n/k_v^×.

**Hypotheses and conventions.**

- The splitting R = R_triv ⊔ R_reg replaces the single set R of CG18 §8.5: Lemma 8.2 is false without (c) at the Ihara-avoidance places (sourceIssues E169, E203 of PAPER-CALEGARI-GERAGHTY-18), and (d) is the minimal-ramification case used by CGH20 §4(2)(a); the congruence (b) is needed only where the characters χ_v live, so R_reg carries none, as in CGH20 Theorem 1.2 (A.2)
- χ_{v,i} are characters of the finite group k_v^× with values in the pro-p group 1 + 𝔪_O, so they have p-power order and are nontrivial only because N(v) ≡ 1 mod p (E168: a character of I_v with values in 1 + 𝔪_O need not factor through k_v^×)
- Oddness at a real place is the balanced-eigenspace condition of R02.6/archimedean-adjoint-dimensions (E164 of PAPER-CALEGARI-GERAGHTY-18: the trace criterion is not equivalent to it when n is even and p = n + 1)

**Construction or proof.**

1. Each condition is local except (e) and (g); (a) is meaningful because p > n and F_v/ℚ_p is unramified, so the weights lie in the Fontaine–Laffaille range [0, p − 2].
2. Since R contains every ramified place of r̄ away from p, (c) and (d) say that at a ramified place r̄ is a single unipotent block, and at an unramified place of R it is trivial.
3. χ_v extended by 1 on R_reg is a tuple of characters of (k_v^×)^n with trivial product, which is the Iwahori character datum of BT.0/iwahori-character-local-system; on inertia it acts through Art_v^{-1} and O_{F_v}^× ↠ k_v^×.

**Uses.** BT.1/cg-local-rings: the local conditions are chosen place by place from this datum. BT.5/theorem-9-19: the standing hypotheses of §9.5 in corrected form. BT.5/theorem-5-16: the hypotheses of Theorem 5.16 produce such a datum.

**API.**

- `BeyondTW.StandingData` (constructor): The bundled datum (F, n, p, O, r̄, ξ, R_triv, R_reg, χ) with the conditions (a)–(g).
- `BeyondTW.StandingData.S` (projection): S = S_p ⊔ R.
- `BeyondTW.StandingData.framedPlaces` (projection): T = S_p ∪ R, with |T| = |S_p| + |R|.
- `BeyondTW.StandingData.psi` (projection): The Iwahori character data ψ = 1 and ψ = χ (χ extended by 1 on R_reg).
- `BeyondTW.StandingData.unramified_outside` (characterisation): r̄ is unramified outside S.
- `BeyondTW.StandingData.extendScalars` (functoriality): Enlarging O preserves every condition.

**Unit tests.**

- `standingData_R_empty` (degenerate): With R = ∅, S = S_p, T = S_p and the χ-datum is the trivial datum.
- `standingData_tate_curve` (computation): For n = 2 and r̄ = E[p] with E having multiplicative reduction at v and p ∤ v(Δ_E), the place v belongs to R_reg (r̄(σ_v) conjugate to (1 1; 0 1)), with no condition on N(v) mod p.
- `standingData_nonscalar_excluded` (non-example): If r̄|G_v is unramified with r̄(Frob_v) nonscalar, v can be neither in R_triv (not trivial) nor in R_reg (not ramified).
- `standingData_chi_distinct` (characterisation): For v ∈ R_triv the χ_{v,i} are pairwise distinct; with χ_{v,1} = χ_{v,2} the ring R^χ_v is not irreducible in general and the datum is rejected.
- `standingData_trace_not_balanced` (non-example): For n = 2 and p = 3, r̄(c_v) = 1 at a real place has trace 2 = −1 in 𝔽_3 but ±1-eigenspaces of dimensions 2 and 0, so it violates (f); a definition of oddness by the trace alone would accept it (E164).
- `standingData_reg_no_congruence` (characterisation): A place v with r̄(σ_v) a single unipotent Jordan block may be put in R_reg for every N(v) prime to p, whereas a place of R_triv needs N(v) ≡ 1 mod p: otherwise every character k_v^× → 1 + 𝔪_O is trivial and the χ_{v,i} cannot be pairwise distinct.

**Acceptance.**

- R = ∅ is allowed; then r̄ is unramified outside p.
- For n = 2 and E an elliptic curve with multiplicative reduction at v and p ∤ v(Δ_E), r̄ = E[p] has v ∈ R_reg, whatever N(v) is modulo p.
- A place v with r̄|G_v unramified of nonscalar Frobenius cannot be put in R.

**Direct prerequisites:** `LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition`; `ArithmeticGaloisRepresentations:G7/oddness-at-real-places`; `ArithmeticGaloisDuality:R02.6/archimedean-adjoint-dimensions`; [The local systems O(ψ) of Iwahori characters](#bt-bt-0-iwahori-character-local-system).

**Source:** CG18, §8.5, published pp. 406–407: The standing hypotheses: p > n unramified, Fontaine–Laffaille with weights [0, …, n − 1], unipotent ramification with N(v) ≡ 1 mod p, oddness, ξ lifting det r̄, the set R and the characters χ_v. CG18, §8.5.1, Lemma 8.2, published pp. 407–408: Lemma 8.2 rests on Taylor's Ihara-avoidance computation, which needs r̄|G_v trivial at the places carrying χ_v (E169). CGH20, §4, item (2)(a), arXiv p. 7 (published appendix §A.4): At bad places with r̄(σ) a single unipotent block, the unipotent ring R^1_v is the minimally ramified ring of CHT Definition 2.4.14.


<a id="bt-bt-1-cg-local-rings"></a>

### The local deformation rings R^1_loc and R^χ_loc

**Target:** `BeyondTW.flLocalRing` (construction); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.1/cg-local-rings`; planet: *Local deformation rings R^1_loc, R^χ_loc*.

For a standing datum, let C_O be the category of complete Noetherian local O-algebras with residue field k. (i) For v | p, R_v is the framed Fontaine–Laffaille deformation ring of r̄|G_v with determinant ξ|G_v and τ-weights {0, …, n − 1}; it is formally smooth over O of relative dimension n² − 1 + [F_v : ℚ_p]n(n − 1)/2. (ii) For v ∈ R_triv, R^1_v (resp. R^{χ_v}_v) is the quotient of the framed determinant-ξ lifting ring of r̄|G_v by the condition that every σ ∈ I_v has characteristic polynomial (X − 1)^n (resp. ∏_i(X − χ_{v,i}(Art_v^{-1}(σ)))). (iii) For v ∈ R_reg, R^1_v is the same unipotent quotient, which equals the minimally ramified ring and is formally smooth of relative dimension n² − 1. Put R^1_loc := (⊗̂_{v|p} R_v) ⊗̂ (⊗̂_{v∈R} R^1_v) and R^χ_loc := (⊗̂_{v|p} R_v) ⊗̂ (⊗̂_{v∈R_triv} R^{χ_v}_v) ⊗̂ (⊗̂_{v∈R_reg} R^1_v), completed tensor products over O. Write D_v, D^1_v, D^χ_v for the corresponding local deformation problems.

**Hypotheses and conventions.**

- Standing datum of BT.1/ihara-avoidance-data
- Fixed determinant ξ in every local problem
- The rings R^1_v, R^χ_v are the literal quotients of the lifting ring; their O-flat quotients would break the mod ϖ identification (sourceIssues E165)

**Construction or proof.**

1. (i) is LocalGaloisDeformationRings L7/fontaine-laffaille-deformation-condition with smoothness from L7/fontaine-laffaille-tangent-space-and-smoothness (CHT Corollary 2.4.3), with the determinant fixed by GlobalGaloisDeformations R04.2/fixed-determinant-rings.
2. (ii) are the Ihara-avoidance quotients of R08.2/ihara-avoidance-components, taken with fixed determinant: since p ∤ n and ∏χ_{v,i} = 1, twisting by n-th roots of unramified characters identifies the variable-determinant quotient with the fixed-determinant one times a formally smooth factor in one variable.
3. (iii) R08.2/regular-unipotent-minimally-ramified identifies the unipotent condition with the minimally ramified one when r̄(σ_v) is a single Jordan block, and R08.2/minimally-ramified-ring gives formal smoothness.
4. The completed tensor products exist in C_O (DeformationAndDerivedPatchingAlgebra R03.1/complete-coefficient-tensor).

**Uses.** BT.1/local-ring-properties: Lemma 8.2 in corrected form. BT.4/patching-input-data: R^i_∞ = R^i_loc⟦x_1, …, x_g⟧. BT.5/minimal-r-equals-t: formal smoothness when R_triv = ∅.

**API.**

- `BeyondTW.flLocalRing` (constructor): R_v at v | p with determinant ξ.
- `BeyondTW.unipotentLocalRing` (constructor): R^1_v for v ∈ R.
- `BeyondTW.chiLocalRing` (constructor): R^{χ_v}_v for v ∈ R_triv.
- `BeyondTW.localRing` (constructor): R^1_loc and R^χ_loc as completed tensor products, with their maps from each factor.
- `BeyondTW.localRing_mod_varpi` (relation): R^1_loc/ϖ ≅ R^χ_loc/ϖ, compatibly with the factor maps.
- `BeyondTW.unipotentLocalRing_reg_smooth` (characterisation): For v ∈ R_reg, R^1_v ≅ O⟦y_1, …, y_{n²−1}⟧.
- `BeyondTW.localRing_point_criterion` (characterisation): An O′-point of R^1_loc is a tuple of framed lifts of r̄|G_v, v ∈ T, with determinant ξ, Fontaine–Laffaille at p and unipotent inertia at R.

**Unit tests.**

- `localRing_R_empty_smooth` (degenerate): For R = ∅, R^1_loc = R^χ_loc ≅ O⟦y_1, …, y_d⟧ with d = |S_p|(n² − 1) + [F:ℚ]n(n − 1)/2.
- `localRing_n2_steinberg` (compatibility): For n = 2 and v ∈ R_reg, R^1_v is the Steinberg ring of R08.2/steinberg-ring-domain, a power series ring in 3 variables over O.
- `localRing_unipotent_not_flat` (non-example): For n = 2 and v ∈ R_triv with q = N(v), write Φ = ρ(φ_v) and S = ρ(σ_v) − 1 for the universal lift over R^1_v; then (q − 1)·tr(ΦS) = 0 but tr(ΦS) ≠ 0, as the point Φ = diag(1 + X, δ/(1 + X)), Σ = diag(1 + α, 1 − α) with values in O⟦X⟧[α]/(α², (q − 1)α) shows (δ = ξ(φ_v)); so R^1_v and R^1_loc have nonzero p-torsion (E165).
- `localRing_mod_varpi_equal` (computation): For n = 2 and v ∈ R_triv, both R^1_v/ϖ and R^{χ_v}_v/ϖ are the quotient of the lifting ring mod ϖ by tr(ρ(σ)) = 2, det ρ(σ) = 1 on inertia.

**Acceptance.**

- R^1_v/ϖ = R^{χ_v}_v/ϖ for v ∈ R_triv because χ_{v,i} ≡ 1 mod ϖ.
- For R = ∅, R^1_loc = R^χ_loc = ⊗̂_{v|p}R_v is formally smooth of relative dimension |S_p|(n² − 1) + [F:ℚ]n(n − 1)/2.
- If R_triv = ∅ then R^1_loc = R^χ_loc is formally smooth over O.

**Direct prerequisites:** [Standing residual data with an Ihara-avoidance set](#bt-bt-1-ihara-avoidance-data); `LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition`; `LocalGaloisDeformationRings:L7/fontaine-laffaille-tangent-space-and-smoothness`; `LocalGaloisDeformationRings:R08.2/ihara-avoidance-components`; `LocalGaloisDeformationRings:R08.2/regular-unipotent-minimally-ramified`; `LocalGaloisDeformationRings:R08.2/minimally-ramified-ring`; `GlobalGaloisDeformations:R04.2/fixed-determinant-rings`; `GlobalGaloisDeformations:G8/fixed-versus-variable-determinant`; `DeformationAndDerivedPatchingAlgebra:R03.1/complete-coefficient-tensor`; `GlobalGaloisDeformations:R04.3/local-deformation-problem`.

**Source:** CG18, §8.5.1, published p. 407: Defines R_v (Fontaine–Laffaille, smooth of relative dimension n² − 1 + [F_v : ℚ_p]n(n − 1)/2 by CHT Proposition 2.4.3), R^1_v and R^{χ_v}_v by characteristic polynomials of inertia, and R^1_loc, R^χ_loc as completed tensor products. CGH20, §4, item (2)(a), arXiv p. 7: For r̄(σ) a single unipotent block, the unipotent ring coincides with CHT's minimal condition and is formally smooth (CHT Corollary 2.4.3 and Lemma 2.4.19).


<a id="bt-bt-1-local-ring-properties"></a>

### Lemma 8.2 in corrected form: the local rings for Ihara avoidance

**Target:** `BeyondTW.localRing_properties` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.1/local-ring-properties`.

For a standing datum: (1) R^1_loc and R^χ_loc are equidimensional of Krull dimension 1 + |S_p ∪ R|(n² − 1) + [F:ℚ]n(n − 1)/2, and every minimal prime of each has characteristic 0; (2) there is a natural isomorphism R^1_loc/ϖ ≅ R^χ_loc/ϖ; (3) Spec R^χ_loc is irreducible, after enlarging O if necessary; (4) every irreducible component of Spec R^1_loc/ϖ is contained in a unique irreducible component of Spec R^1_loc. Neither ring is asserted to be p-torsion free; R^1_loc is not when R_triv ≠ ∅.

**Hypotheses and conventions.**

- Standing datum with R = R_triv ⊔ R_reg (BT.1/ihara-avoidance-data); O large enough that the irreducible components of each factor are geometrically irreducible
- The printed Lemma 8.2 asserts p-torsion freeness and states (3) without r̄|G_v trivial on R; both are false in that generality (E165, E169)

**Construction or proof.**

1. Factors at v | p and v ∈ R_reg are formally smooth over O, hence O-flat domains with irreducible generic fibre and the stated relative dimensions (BT.1/cg-local-rings).
2. At v ∈ R_triv, Taylor's computation (R08.2/ihara-avoidance-components, in fixed determinant): Spec R^{χ_v}_v is irreducible with generic point of characteristic 0, R^1_v/ϖ = R^{χ_v}_v/ϖ, every component of Spec R^1_v has the same dimension and characteristic-0 generic point, and each prime minimal over ϖ contains a unique minimal prime.
3. Completed tensor products over O of rings that are equidimensional with characteristic-0 minimal primes and geometrically irreducible components are again such, with dimensions adding (relative dimensions add), components being products of components, and the 'unique component above each special component' property preserved: this is BLGHT Lemma 3.3, requested from DeformationAndDerivedPatchingAlgebra R03.3.
4. (1), (3), (4) follow factor by factor from the previous steps; (2) is the tensor product of the factorwise identifications mod ϖ.

**Acceptance.**

- The dimension count: Σ_{v|p}(n² − 1 + [F_v : ℚ_p]n(n − 1)/2) + |R|(n² − 1) + 1 = 1 + |S_p ∪ R|(n² − 1) + [F:ℚ]n(n − 1)/2.
- If R_triv = ∅ then R^1_loc = R^χ_loc is formally smooth, and (1)–(4) are immediate.
- The counterexample of E169: with v ∈ R, r̄|G_v unramified of distinct Frobenius eigenvalues and χ_{v,2} = χ_{v,1}^{-1} ≠ χ_{v,1}, Spec R^{χ_v}_v[1/p] is disconnected; the datum excludes this v.

**Direct prerequisites:** [The local deformation rings R^1_loc and R^χ_loc](#bt-bt-1-cg-local-rings); `LocalGaloisDeformationRings:R08.2/ihara-avoidance-components`; `LocalGaloisDeformationRings:R08.2/minimally-ramified-ring`; `LocalGaloisDeformationRings:L7/fontaine-laffaille-tangent-space-and-smoothness`; `DeformationAndDerivedPatchingAlgebra:R03.3`; `DeformationAndDerivedPatchingAlgebra:R03.1/tensor-presentation`.

**Source:** CG18, §8.5.1, Lemma 8.2 and its proof, published pp. 407–408: Lemma 8.2 lists the four properties, citing BLGHT [76, Lemma 3.3] and Taylor [11, Proposition 3.1]; the corrected form replaces p-torsion freeness by characteristic-0 minimal primes (E165) and restricts the Ihara-avoidance places to r̄|G_v trivial (E169). CG18, §9.5, proof of Theorem 9.19, published pp. 426, 428: The proof uses only the dimension, irreducibility of Spec R^2_∞, the mod ϖ identification and characteristic-0 minimal primes.


<a id="bt-bt-1-cg-global-deformation-data"></a>

### The global deformation data S_Q and S^χ_Q

**Target:** `BeyondTW.globalData` (definition); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.1/cg-global-deformation-data`; planet: *Global deformation data S_Q*.

For a standing datum and a finite set Q of places disjoint from S at which r̄|G_x ≅ s̄_x ⊕ ψ̄_x with ψ̄_x a one-dimensional generalized Frobenius eigenspace and N(x) ≡ 1 mod p, let D_x be the Taylor–Wiles local problem of R08.2/taylor-wiles-local-tangent: lifts of determinant ξ of the form s_x ⊕ ψ_x lifting s̄_x ⊕ ψ̄_x with I_x acting by scalars on s_x and on ψ_x. S_Q := (r̄, O, S ⊔ Q, ξ, (D_v)_{v∈S_p∪Q}, (D^1_v)_{v∈R}) and S^χ_Q := (r̄, O, S ⊔ Q, ξ, (D_v)_{v∈S_p∪Q}, (D^χ_v)_{v∈R_triv}, (D^1_v)_{v∈R_reg}) are global deformation data in the sense of GlobalGaloisDeformations R04.3/global-deformation-type. A deformation is of type S_Q if it is unramified outside S ⊔ Q, has determinant ξ, and lies in the given local problem at each v ∈ S_p ∪ Q ∪ R. R_{S_Q} and R^{□_T}_{S_Q} (T-framed) are the representing objects; S := S_∅. Restriction of the universal deformation to I_x, x ∈ Q, on the ψ_x-line gives a character of the maximal p-power quotient Δ_x of k_x^× (via Art_x), making R_{S_Q} an O[Δ_Q]-algebra, Δ_Q := ∏_{x∈Q}Δ_x, with R_{S_Q} ⊗_{O[Δ_Q]} O = R_S.

**Hypotheses and conventions.**

- r̄ absolutely irreducible, so the unframed functor is representable
- p ∤ n so ad r̄ = k ⊕ ad⁰ r̄
- The Taylor–Wiles places carry the one-dimensional eigenspace condition of CG18 §8.5.1

**Construction or proof.**

1. Representability of the T-framed and unframed functors: R04.3/global-framed-ring, using that each local problem is a local deformation problem (R04.3/local-deformation-problem).
2. The local maps R^1_loc → R^{□_T}_{S_Q} and R^χ_loc → R^{□_T}_{S^χ_Q} are R04.3/local-to-global-map.
3. At x ∈ Q a lift of type D_x is s_x ⊕ ψ_x, and ψ_x|I_x factors through the p-part of k_x^× since N(x) ≡ 1 mod p (the block form of R08.2/taylor-wiles-block-condition with n_1 = 1); this defines O[Δ_Q] → R_{S_Q}.
4. Killing the augmentation ideal forces ψ_x and s_x unramified, which with determinant ξ unramified at x gives deformations of type S (R04.4/enlarging-ramification).

**Uses.** BT.2/conj-b-type-s-surjection: Conjecture B makes r_m a deformation of type S_Q, giving R_{S_Q} ↠ T^an_{Q,ψ,m}. BT.4/patching-input-data: R^{□_T}_{S_{Q_N}} are quotients of R^i_∞. BT.1/lift-has-type-s: the lift r of Theorem 5.16 is a deformation of type S.

**API.**

- `BeyondTW.globalData` (constructor): S_Q and S^χ_Q as global deformation data.
- `BeyondTW.globalRing` (constructor): R_{S_Q}, with its universal deformation.
- `BeyondTW.framedGlobalRing` (constructor): R^{□_T}_{S_Q} with the maps from R^1_loc and R_{S_Q}.
- `BeyondTW.globalRing_deltaAlgebra` (structure): The O[Δ_Q]-algebra structure from inertia at Q.
- `BeyondTW.globalRing_augmentation` (characterisation): R_{S_Q} ⊗_{O[Δ_Q]} O ≅ R_S.
- `BeyondTW.globalRing_mod_varpi` (relation): R_{S_Q}/ϖ ≅ R_{S^χ_Q}/ϖ compatibly with the Δ_Q-structures.
- `BeyondTW.globalRing_traces` (characterisation): R_{S_Q} is topologically generated over O by the traces of Frobenius at λ ∉ S ⊔ Q (Carayol, GlobalGaloisDeformations R04.2/carayol-trace-theorem).

**Unit tests.**

- `globalData_Q_empty` (degenerate): For Q = ∅, R_{S_∅} = R_S and Δ_∅ is trivial.
- `globalData_n2_TW_ring` (compatibility): For n = 2 and x ∈ Q with distinct residual eigenvalues, the local problem D_x is the ring 𝒪⟦x, y, B, u⟧/((1+u)^{p^m} − 1) of R08.2/taylor-wiles-local-ring up to the fixed-determinant twist.
- `globalData_deltaAction_trivial_unramified` (characterisation): A deformation of type S_Q unramified at every x ∈ Q is killed by the augmentation ideal of O[Δ_Q].
- `globalData_unrestricted_not_TW` (non-example): With the unrestricted local problem at x ∈ Q instead of D_x the tangent space grows by h⁰(G_x, ad⁰ r̄) − 1 extra dimensions and the numerical coincidence of BT.1/numerical-coincidence fails for n ≥ 3.

**Acceptance.**

- S_∅ = S and S^χ_∅ = S^χ.
- R_{S_Q}/ϖ ≅ R_{S^χ_Q}/ϖ because the local problems agree mod ϖ.
- The O[Δ_Q]-algebra structure agrees with GlobalGaloisDeformations R04.5/taylor-wiles-inertia-action for n = 2 after the twist recorded in R08.2/taylor-wiles-block-condition.

**Direct prerequisites:** [Standing residual data with an Ihara-avoidance set](#bt-bt-1-ihara-avoidance-data); [The local deformation rings R^1_loc and R^χ_loc](#bt-bt-1-cg-local-rings); `LocalGaloisDeformationRings:R08.2/taylor-wiles-local-tangent`; `LocalGaloisDeformationRings:R08.2/taylor-wiles-block-condition`; `GlobalGaloisDeformations:R04.3/global-deformation-type`; `GlobalGaloisDeformations:R04.3/global-framed-ring`; `GlobalGaloisDeformations:R04.3/local-to-global-map`; `GlobalGaloisDeformations:R04.4/enlarging-ramification`.

**Source:** CG18, §8.5.1–8.5.2, published pp. 407–409: D_v at v ∈ Q, the data S_Q and S^χ_Q, deformations of type S_Q, and the representing rings R_{S_Q}, R^{□_T}_{S_Q} with framing at T = S_p ∪ R. CG18, §9.5, published p. 427: Chooses representatives of the universal deformations of type S_{Q_N} and S^χ_{Q_N} which agree mod ϖ.


<a id="bt-bt-1-framing-and-presentation"></a>

### Framing and presentation over the local rings (Lemma 8.3, Proposition 8.4)

**Target:** `BeyondTW.framed_presentation` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.1/framing-and-presentation`.

For a standing datum and Q as in BT.1/cg-global-deformation-data: (1) R_{S_Q} → R^{□_T}_{S_Q} is formally smooth of relative dimension n²|T| − 1 (and likewise for S^χ_Q), for T nonempty. (2) R^{□_T}_{S_Q} (resp. R^{□_T}_{S^χ_Q}) is a quotient of a power series ring over R^1_loc (resp. R^χ_loc) in h¹_{L(Q),T}(G_F, ad⁰r̄) + Σ_{v∈T} h⁰(G_v, ad r̄) − h⁰(G_F, ad r̄) variables, where H¹_{L(Q),T}(G_F, ad⁰r̄) is the kernel of H¹(G_{F,S_Q}, ad⁰r̄) → ⊕_{x∈T} H¹(G_x, ad⁰r̄) ⊕ ⊕_{x∈Q} H¹(G_x, ad⁰r̄)/L_x. (3) h¹_{L(Q),T}(ad⁰r̄) = h¹_{L(Q)^⊥,T}(ad⁰r̄(1)) + h⁰(G_F, ad⁰r̄) − h⁰(G_F, ad⁰r̄(1)) + Σ_{x∈Q}(dim L_x − h⁰(G_x, ad⁰r̄)) − Σ_{v∈T∪{v|∞}} h⁰(G_v, ad⁰r̄).

**Hypotheses and conventions.**

- T = S_p ∪ R nonempty (it contains the places above p)
- r̄ absolutely irreducible and p ∤ n

**Construction or proof.**

1. (1) The T-framed functor is a torsor over the formal group (∏_{v∈T} Γ̂_n)/Ĝ_m of framings: GlobalGaloisDeformations R04.2/framed-unframed-comparison in its T-framed form (G8/variable-determinant-representability gives the n²|T| − 1 count for nonempty T).
2. (2) R04.3/local-to-global-presentation: the relative tangent space of R^{□_T}_{S_Q} over the local ring is the Selmer group relative to T, corrected by the framing variables Σ_{v∈T}h⁰(G_v, ad r̄) − h⁰(G_F, ad r̄) (R04.3/relative-tangent-space).
3. (3) Poitou–Tate duality and the Greenberg–Wiles formula (ArithmeticGaloisDuality R02.5/greenberg-wiles-formula) for M = ad⁰r̄ with conditions 0 at T, L_x at Q and unramified elsewhere.

**Acceptance.**

- With Q = ∅ and R = ∅, (3) reads h¹_{∅,S_p}(ad⁰) = h¹_{⊥}(ad⁰(1)) − Σ_{v|p}h⁰(G_v, ad⁰) − Σ_{v|∞}h⁰(G_v, ad⁰) when h⁰(ad⁰) = h⁰(ad⁰(1)) = 0.
- For n = 1, ad⁰ r̄ = 0 and (3) reads 0 = 0; the rank-one count of BT.1/gl1-defect-example uses ad r̄ = k instead (R02.5/rank-one-selmer-numerics).
- (1) fails for T = ∅: the unframed ring is not a power series ring over itself in −1 variables.

**Direct prerequisites:** [The global deformation data S_Q and S^χ_Q](#bt-bt-1-cg-global-deformation-data); `GlobalGaloisDeformations:R04.2/framed-unframed-comparison`; `GlobalGaloisDeformations:G8/variable-determinant-representability`; `GlobalGaloisDeformations:R04.3/local-to-global-presentation`; `GlobalGaloisDeformations:R04.3/relative-tangent-space`; `ArithmeticGaloisDuality:R02.5/greenberg-wiles-formula`.

**Source:** CG18, §8.5.2, Lemma 8.3 and Proposition 8.4, published pp. 409–410: Lemma 8.3 (relative dimension n²|T| − 1) and Proposition 8.4 (number of variables over R^1_loc and the Euler characteristic identity), proved by the argument of Kisin's Lemma 3.2.2 and Poitou–Tate.


<a id="bt-bt-1-numerical-coincidence"></a>

### The numerical coincidence (Proposition 8.5)

**Target:** `BeyondTW.numerical_coincidence` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.1/numerical-coincidence`; planet: *Numerical coincidence*.

For a standing datum with r̄(G_{F(ζ_p)}) big (CHT Definition 2.5.1) and F(ad⁰r̄) ∌ ζ_p, and an integer q ≥ h¹_{L^⊥,T}(G_F, ad⁰r̄(1)), for every N ≥ 1 there is a tuple (Q, (ψ̄_x)_{x∈Q}) with: (1) |Q| = q and Q ∩ S = ∅; (2) r̄|G_x ≅ s̄_x ⊕ ψ̄_x with ψ̄_x a one-dimensional generalized Frobenius eigenspace; (3) N(x) ≡ 1 mod p^N; (4) R^{□_T}_{S_Q} (resp. R^{□_T}_{S^χ_Q}) is a quotient of R^1_loc⟦x_1, …, x_g⟧ (resp. R^χ_loc⟦x_1, …, x_g⟧) with g = q + |T| − 1 − [F:ℚ]n(n − 1)/2 − l_0, l_0 = r_1⌊(n − 1)/2⌋ + r_2(n − 1). Consequently, with j = n²|T| − 1, dim R^1_loc⟦x_1, …, x_g⟧ = 1 + q + j − l_0.

**Hypotheses and conventions.**

- r̄(G_{F(ζ_p)}) big in the sense of CHT Definition 2.5.1 (requested from ArithmeticGaloisRepresentations G7) and F(ad⁰r̄) ∌ ζ_p
- r̄ odd at the real places, so that the archimedean count of R02.6 applies
- N(x) ≡ 1 mod p for x ∈ Q is what gives dim_k L_x − h⁰(G_x, ad⁰r̄) = 1 (R08.2/taylor-wiles-local-tangent)

**Construction or proof.**

1. (1)–(3) and the vanishing H¹_{L(Q)^⊥,T}(G_F, ad⁰r̄(1)) = 0: choose x by Chebotarev so that each class of the dual Selmer group is detected by tr(e_x φ(Frob_x)), as in CHT Proposition 2.5.9; this rank-n big-image selection is requested from GlobalGaloisDeformations R04.5.
2. Then BT.1/framing-and-presentation (2)–(3) with h¹_{L(Q)^⊥,T} = 0, h⁰(G_F, ad⁰) = h⁰(G_F, ad⁰(1)) = 0 (absolute irreducibility and ζ_p ∉ F(ad⁰r̄)), dim L_x − h⁰ = 1 at x ∈ Q, h⁰(G_v, ad) = h⁰(G_v, ad⁰) + 1 (p ∤ n), and Σ_{v|∞}h⁰(G_v, ad⁰) = [F:ℚ]n(n − 1)/2 + l_0 (R02.6/archimedean-adjoint-dimensions, using oddness) give g = q + |T| − 1 − [F:ℚ]n(n − 1)/2 − l_0.
3. Adding dim R^1_loc = 1 + |T|(n² − 1) + [F:ℚ]n(n − 1)/2 (BT.1/local-ring-properties) to g gives 1 + q + (n²|T| − 1) − l_0.

**Acceptance.**

- For F imaginary quadratic and n = 2, l_0 = 1, [F:ℚ]n(n − 1)/2 = 2 and g = q + |T| − 4.
- For F totally real and n = 2, l_0 = 0, recovering the Taylor–Wiles–Kisin count g = q + |T| − 1 − [F:ℚ].
- For n = 1 the formula gives l_0 = r_1 + r_2 − 1 only with the GL_1 conventions of BT.1/gl1-defect-example, not the PGL_n formula, which gives 0.

**Direct prerequisites:** [Framing and presentation over the local rings (Lemma 8.3, Proposition 8.4)](#bt-bt-1-framing-and-presentation); [The local deformation rings R^1_loc and R^χ_loc](#bt-bt-1-cg-local-rings); [Lemma 8.2 in corrected form: the local rings for Ihara avoidance](#bt-bt-1-local-ring-properties); `LocalGaloisDeformationRings:R08.2/taylor-wiles-local-tangent`; `ArithmeticGaloisDuality:R02.6/archimedean-adjoint-dimensions`; `AutomorphicFormsOnReductiveGroups:AF.4/l0-q0-invariants`; `GlobalGaloisDeformations:R04.5`; `ArithmeticGaloisRepresentations:G7`.

**Source:** CG18, §8.6, Proposition 8.5 and its proof, published pp. 410–411: Choice of q Taylor–Wiles primes killing the dual Selmer group (via CHT Proposition 2.5.9) and the count q + |T| − 1 − [F:ℚ]n(n − 1)/2 − l_0 of variables. CG18, §8.4, equation (1), published pp. 405–406: Σ_{v|∞} dim H⁰(F_v, ad⁰V) = [F:ℚ]n(n − 1)/2 + l_0 for odd V. CG18, §9.5, published p. 426: Checks 1 + (n² − 1)|T| + [F:ℚ]n(n − 1)/2 + g = 1 + j + q − l_0 with j = n²|T| − 1.


<a id="bt-bt-1-lift-has-type-s"></a>

### Lifts satisfying the hypotheses of Theorem 5.16 have type S

**Target:** `BeyondTW.lift_isTypeS` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.1/lift-has-type-s`.

Let (F, n, p, O, r̄, R) be a standing datum and r : G_F → GL_n(O′) (O′ ⊇ O finite) a continuous lift of r̄ such that: r is unramified outside S; for v | p, r|G_v is crystalline with gr^i(r ⊗ B_dR)^{G_v} free of rank one over O ⊗ F_v for i ∈ {0, …, n − 1} and zero otherwise; for v ∈ R, r|I_v is unipotent; det r = ε^{n(n−1)/2}. Then r is a deformation of r̄ of type S, hence defines an O-algebra map x_r : R_S → O′ whose kernel is a prime of R_S with residue ring O′.

**Hypotheses and conventions.**

- p > n unramified in F, so the Hodge–Tate weights lie in the Fontaine–Laffaille range [0, p − 2]
- Standing datum (BT.1/ihara-avoidance-data); the determinant convention ε(Frob_λ) = N(λ)

**Construction or proof.**

1. At v | p: a crystalline representation of an unramified p-adic field with Hodge–Tate weights in [0, p − 2] has Fontaine–Laffaille lattices, and the weights {0, …, n − 1} with multiplicity one per embedding identify r|G_v with an O′-point of R_v (PadicHodgeTheory R06.4/fontaine-laffaille-crystalline-comparison, LocalGaloisDeformationRings L7/fontaine-laffaille-deformation-condition).
2. At v ∈ R: unipotent inertia means every σ ∈ I_v has characteristic polynomial (X − 1)^n, the defining condition of R^1_v; on R_reg this is the minimally ramified ring (R08.2/regular-unipotent-minimally-ramified).
3. det r = ξ and unramifiedness outside S are the remaining conditions of type S; the deformation class of r gives x_r by representability (BT.1/cg-global-deformation-data).

**Acceptance.**

- An O′-point of R_S is the same as a deformation of type S over O′.
- If r is ramified at v ∈ R_triv, x_r lies on a component of R^1_v other than the unramified one.
- A lift with r|I_v of infinite order but non-unipotent is not of type S.

**Direct prerequisites:** [The global deformation data S_Q and S^χ_Q](#bt-bt-1-cg-global-deformation-data); [The local deformation rings R^1_loc and R^χ_loc](#bt-bt-1-cg-local-rings); `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`; `LocalGaloisDeformationRings:L7/fontaine-laffaille-deformation-condition`; `LocalGaloisDeformationRings:R08.2/regular-unipotent-minimally-ramified`.

**Source:** CG18, Theorem 5.16 hypotheses (1), (2), (6), (7), published p. 383: The local hypotheses on r: crystalline with Hodge–Tate weights {0, …, n − 1}, unipotent ramification and determinant ε^{n(n−1)/2}. CG18, §9.5, published p. 424 (with the review note: corollary remark): Theorem 5.16 is said to follow immediately from Theorem 9.19; the step that r is of type S is not written (brief of PAPER-CALEGARI-GERAGHTY-18, item thm-5-16).


<a id="bt-bt-1-gl1-defect-example"></a>

### The case GL_1: defect l_0 = r_1 + r_2 − 1 and class field theory

**Target:** `BeyondTW.gl1_unramified_classGroup` (application); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.1/gl1-defect-example`.

Let F be a number field with ζ_p ∉ F and r̄ : G_F → k^× the trivial character. Minimal deformations are the everywhere unramified characters, with universal ring R^unr. The arithmetic quotients X_Q = F^×\𝔸_F^×/U_Q A^0_∞ of GL_1 have components which are compact tori of dimension l_0 = r_1 + r_2 − 1, and the dimension of the dual Selmer group to be killed exceeds that of the Selmer group by the same l_0. Patching complexes of length l_0 gives R^unr ≅ ℤ_p[Cl(O_F) ⊗ ℤ_p], i.e. the p-part of the Hilbert class field corresponds to the p-part of the class group. The argument is circular: the Greenberg–Wiles formula it uses rests on class field theory.

**Hypotheses and conventions.**

- ζ_p ∉ F (otherwise the choice of auxiliary primes fails)
- The PGL_n formula for l_0 does not specialize to this case; GL_1 has its own l_0 = r_1 + r_2 − 1

**Construction or proof.**

1. dim H¹_L(F, F_p) − dim H¹_{L*}(F, μ_p) = −(r_1 + r_2 − 1): ArithmeticGaloisDuality R02.5/rank-one-selmer-numerics.
2. Each component of X_Q has dimension r_1 + r_2 − 1 (AdelicAlgebraicGroups AA.5/gl1-component-dimension), so its cohomology lives in degrees [0, l_0].
3. Taylor–Wiles primes are primes with N(v) ≡ 1 mod p^N at which the Kummer classes of a basis of the dual Selmer group are nontrivial; they exist by Chebotarev because ζ_p ∉ F.
4. The Hecke action on H^0 is through the ray class group by class field theory and propagates to higher degrees by Künneth; patching then identifies R^unr with the group algebra of the p-part of the class group.

**Acceptance.**

- l_0 = r_1 + r_2 − 1 equals the number of excess dual Selmer classes.
- For F = ℚ, l_0 = 0 and the statement is R^unr = ℤ_p (no unramified p-extension of ℚ).
- For F imaginary quadratic, l_0 = 0 as well; for F real quadratic, l_0 = 1.

**Direct prerequisites:** `ArithmeticGaloisDuality:R02.5/rank-one-selmer-numerics`; `AdelicAlgebraicGroups:AA.5/gl1-component-dimension`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Source:** CG18, §8.2 and Remark 8.1, published pp. 401–405: The one-dimensional case: Greenberg–Wiles count −(r_1 + r_2 − 1), the spaces X_Q as products of circles, choice of auxiliary primes using ζ_p ∉ F, the conclusion R^unr ≅ ℤ_p[Cl(O_F) ⊗ ℤ_p], and the remark that the argument is circular.


## BT.2. Conjecture B as hypotheses

Conjecture B of CG18 §9.3 as named propositions, never conclusions: residual and integral Galois representations for T^an_{Q,ψ} (B^gal), local–global compatibility at p, at Taylor–Wiles primes and at R together with the added compatibility of diamond operators at Taylor–Wiles primes (B^lgc), vanishing outside [q_0, q_0 + l_0] and on the Borel–Serre boundary (B^van), and the Taylor–Wiles level comparison (B^tw); their bundle; dévissage; the surjection R_{S_Q} ↠ T^an_{Q,ψ,m} of O[Δ_Q]-algebras; and B^van(a) in small rank (imaginary quadratic GL_2 directly; GL_3/ℚ and CM quartic GL_2 through the congruence-kernel theorems and the localized H^0, H^1 vanishing of KTheoryLowDegrees U.4).

**Layer dependencies:** `AutomorphyLiftingBeyondTaylorWiles:BT.0`, `IntegralHeckeAndGaloisDeterminants:IHG.3`, `GlobalGaloisDeformations:R04.2`, `AutomorphyLiftingBeyondTaylorWiles:BT.1`, `LocalGaloisDeformationRings:R08.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `AutomorphicFormsOnReductiveGroups:AF.4`, `ArithmeticLocallySymmetricSpaces:ALS.2`, `ArithmeticLocallySymmetricSpaces:ALS.4`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`, `KTheoryLowDegrees:U.4`.


<a id="bt-bt-2-conj-b-galois-type"></a>

### Conjecture B, residual and integral Galois representations (hypothesis)

**Target:** `BeyondTW.ConjB.GaloisType` (definition); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.2/conj-b-galois-type`.

For Q, ψ as in BT.0 and a maximal ideal m of T^an_{Q,ψ}, the hypothesis B^gal(Q, ψ, m) is the conjunction of: (i) there is a continuous semisimple r̄_m : G_F → GL_n(T^an_{Q,ψ}/m), unramified outside S_Q, such that for every prime λ ∉ S_Q the characteristic polynomial of r̄_m(Frob_λ) (arithmetic Frobenius) is X^n − T_{λ,1}X^{n−1} + ⋯ + (−1)^i N(λ)^{i(i−1)/2}T_{λ,i}X^{n−i} + ⋯ + (−1)^n N(λ)^{n(n−1)/2}T_{λ,n} in (T^an_{Q,ψ}/m)[X], with the unnormalized T_{λ,i}; that is, m is of Galois type in the sense of IntegralHeckeAndGaloisDeterminants (IHG.3/galois-type-maximal-ideal) for this Hecke polynomial; (ii) if r̄_m is absolutely irreducible (m non-Eisenstein), there is a continuous lift r_m : G_F → GL_n(T^an_{Q,ψ,m}) of r̄_m, unramified outside S_Q, whose characteristic polynomials at Frob_λ, λ ∉ S_Q, are given by the same formula in T^an_{Q,ψ,m}[X]. It is a hypothesis: a named proposition assumed by the theorems of BT.5, never asserted.

**Hypotheses and conventions.**

- The unnormalized T_{λ,i} of BT.0/tw-hecke-operators (with the printed normalization the exponent would have to be i(i+1)/2; E180)
- Arithmetic Frobenius; IHG.3/frobenius-conversion converts to geometric Frobenius

**Construction or proof.**

1. (i) determines r̄_m up to isomorphism by Chebotarev density and Brauer–Nesbitt (IHG.3/galois-type-maximal-ideal, uniqueness).
2. When r̄_m is absolutely irreducible, a lift as in (ii) is unique up to conjugation by Carayol's theorem (GlobalGaloisDeformations R04.2/carayol-trace-theorem), and is equivalent to a continuous determinant G_F → T^an_{Q,ψ,m} with the given characteristic polynomials (IHG.1 reconstruction).

**Uses.** BT.2/conj-b-type-s-surjection: r_m is the deformation that gives R_{S_Q} ↠ T^an_{Q,ψ,m}. BT.5/cuspidal-recognition: r̄_m(G_{F(ζ_p)}) big excludes residual eigensystems. CGH20 Theorem 1.2 (A.2): assumed for GL_n over CM fields.

**API.**

- `BeyondTW.ConjB.GaloisType` (constructor): The proposition B^gal(Q, ψ, m), with a real body: existence of r̄_m (and of r_m when r̄_m is absolutely irreducible) with the stated characteristic polynomials.
- `BeyondTW.ConjB.GaloisType.residual` (projection): The residual representation r̄_m, unique up to isomorphism.
- `BeyondTW.ConjB.GaloisType.lift` (projection): The lift r_m over T^an_{Q,ψ,m} when m is non-Eisenstein.
- `BeyondTW.ConjB.IsNonEisenstein` (characterisation): m is non-Eisenstein iff r̄_m is absolutely irreducible; agrees with IHG's Spherical.IsNonEisenstein.
- `BeyondTW.ConjB.GaloisType.det` (relation): det r_m = ε^{n(n−1)/2} on Frobenius elements, since T_{λ,n} = 1 on PGL_n.

**Unit tests.**

- `conjBGal_eisenstein_GL2` (computation): For F = ℚ, n = 2, level one and the unique maximal ideal (T_{λ,1} ↦ 1 + λ), (i) holds with r̄_m = 1 ⊕ ε̄ and m is not non-Eisenstein.
- `conjBGal_classical` (compatibility): For F = ℚ, n = 2, the hypothesis holds for every m in the support of H^1 of a modular curve: r_m is the Hecke-algebra valued Galois representation of Carayol.
- `conjBGal_unnormalized` (non-example): With T_{λ,i} replaced by N(λ)^{-i}T_{λ,i} and the exponent i(i−1)/2 kept, the determinant of r̄_m(Frob_λ) would be N(λ)^{n(n−3)/2} (as T_{λ,n} = 1 on PGL_n), not ε̄^{n(n−1)/2}(Frob_λ) = N(λ)^{n(n−1)/2}; the hypothesis would then fail at every classical m.
- `conjBGal_unique` (characterisation): Two representations satisfying (i) for the same m become isomorphic after extension to an algebraic closure of T^an/m.

**Acceptance.**

- For F = ℚ and n = 2, (i) and (ii) hold at every non-Eisenstein m by Eichler–Shimura, Deligne and Carayol.
- For F CM, (i) holds by Scholze, and (ii) holds modulo a nilpotent ideal; the full (ii) over T^an_m is not known in general.
- At an Eisenstein m with r̄_m = 1 ⊕ ε̄ (n = 2), (i) holds and (ii) is not asked.

**Direct prerequisites:** [The Hecke algebras T^an_{Q,ψ} and T_{Q,ψ} (Definition 9.1)](#bt-bt-0-tw-hecke-algebra); [Hecke operators T_{α,k}, V_x and diamond operators at Taylor–Wiles level](#bt-bt-0-tw-hecke-operators); `IntegralHeckeAndGaloisDeterminants:IHG.3/galois-type-maximal-ideal`; `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`; `GlobalGaloisDeformations:R04.2/carayol-trace-theorem`.

**Source:** CG18, §9.3, Conjecture B (first paragraph), published p. 414: Predicts semisimple r̄_m with the stated Frobenius characteristic polynomials, defines non-Eisenstein by absolute irreducibility, and predicts the deformation r_m over T^an_{Q,ψ,m}. CGH20, §1, arXiv p. 3 (published appendix p. 882): Conjecture B of CG18 consists of five parts; the appendix assumes all but (4).


<a id="bt-bt-2-conj-b-local-global"></a>

### Conjecture B(1)–(3) and the Taylor–Wiles compatibility (6) (hypothesis)

**Target:** `BeyondTW.ConjB.LocalGlobal` (definition); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.2/conj-b-local-global`.

Assume B^gal(Q, ψ, m) with m non-Eisenstein, r̄_m ≅ r̄ ⊗ T^an/m for the r̄ of a standing datum, and Q a set of Taylor–Wiles primes as in BT.1/numerical-coincidence (Q = ∅ allowed). B^lgc(Q, ψ, m) is the conjunction of: (1) for v | p, r_m|G_v is Fontaine–Laffaille with all weights {0, 1, …, n − 1} (an object of the deformation problem D_v of BT.1/cg-local-rings); (2) for v ∈ Q, r_m|G_v is a lifting of type D_v (r_m|G_v ≅ s_v ⊕ ψ_v with I_v acting by scalars on each summand); (3) for v ∈ R and σ ∈ I_v, the characteristic polynomial of r_m(σ) is ∏_i(X − ψ_{v,i}(Art_v^{-1}(σ))); (6) for v ∈ Q and α ∈ O_v^× (α = 1 at the other places), the operator T_{α,1} acts on H^*_ψ(Y_1(Q), O/ϖ^m)_m as the scalar by which r_m(Art_v(α)) acts on the lift ψ_v of the line ψ̄_v.

**Hypotheses and conventions.**

- Clause (6) is not in CG18's Conjecture B; it is the GL(n) analogue of Conjecture A(3), needed for condition (d) of the patching theorem and for the surjection onto T^an including diamond operators (sourceIssues E181 of PAPER-CALEGARI-GERAGHTY-18)
- Art_v normalized as in BT.0 (uniformizers to arithmetic Frobenius); on the homology side (m^*) the clause holds with the inverse character

**Construction or proof.**

1. (1)–(3) are the printed local–global compatibility clauses; (3) with ψ = 1 says inertia at R acts unipotently.
2. Under the identification K_Q/L_Q ≅ ∏k_x^× of BT.0/tw-hecke-operators, T_{α,1} has class α^{1−n}, so (6) fixes the action of O[Δ_Q] on the m-part, and p > n makes the T_{α,1} exhaust the p-part of Δ̃_Q.

**Uses.** BT.2/conj-b-type-s-surjection: (1)–(3) make r_m of type S_Q or S^χ_Q, (6) puts the diamond operators in the image of R_{S_Q}. BT.4/patching-hypotheses-verified: condition (d) of the patching theorem uses (6). CGH20 Theorem 1.2: the appendix assumes (1)–(3) and (5).

**API.**

- `BeyondTW.ConjB.LocalGlobal` (constructor): The proposition B^lgc(Q, ψ, m) with clauses (1), (2), (3), (6).
- `BeyondTW.ConjB.LocalGlobal.atP` (projection): Clause (1).
- `BeyondTW.ConjB.LocalGlobal.atQ` (projection): Clause (2).
- `BeyondTW.ConjB.LocalGlobal.atR` (projection): Clause (3).
- `BeyondTW.ConjB.LocalGlobal.diamond` (projection): Clause (6): the Δ_Q-action on cohomology equals the inertial action through r_m.
- `BeyondTW.ConjB.LocalGlobal.empty` (simp): For Q = ∅ the proposition is the conjunction of (1) and (3).

**Unit tests.**

- `conjBLgc_Q_empty` (degenerate): For Q = ∅, B^lgc reduces to clauses (1) and (3).
- `conjBLgc_psi_trivial_unipotent` (computation): With ψ = 1, clause (3) says r_m(σ) − 1 is nilpotent for σ ∈ I_v, v ∈ R.
- `conjBLgc_diamond_needed` (non-example): Without clause (6), r_m may be unramified at x ∈ Q while a diamond operator acts nontrivially; then the augmentation ideal of O[Δ_Q] does not map into the image of ker(R_{S_Q} → R_S) and condition (d) fails.
- `conjBLgc_GL2_Q` (compatibility): For F = ℚ, n = 2, all clauses hold at non-Eisenstein m by Carayol's local–global compatibility and Fontaine–Laffaille theory for p > 2 at weight two.

**Acceptance.**

- For Q = ∅ clauses (2) and (6) are empty.
- For F CM, (1) is known only up to a nilpotent ideal and under extra hypotheses (ACC+, Caraiani–Newton); (2), (3) and (6) follow from local–global compatibility at ℓ ≠ p.
- With ψ = χ, clause (3) places r_m in R^χ_v at v ∈ R_triv.

**Direct prerequisites:** [Conjecture B, residual and integral Galois representations (hypothesis)](#bt-bt-2-conj-b-galois-type); [Standing residual data with an Ihara-avoidance set](#bt-bt-1-ihara-avoidance-data); [The local deformation rings R^1_loc and R^χ_loc](#bt-bt-1-cg-local-rings); `LocalGaloisDeformationRings:R08.2/taylor-wiles-local-tangent`; [The local systems O(ψ) of Iwahori characters](#bt-bt-0-iwahori-character-local-system); [Hecke operators T_{α,k}, V_x and diamond operators at Taylor–Wiles level](#bt-bt-0-tw-hecke-operators); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

**Source:** CG18, §9.3, Conjecture B(1)–(3), published p. 414: Fontaine–Laffaille at v | p with weights [0, …, n − 1], type D_v at v ∈ Q, inertial characteristic polynomial ∏(X − ψ_{v,i}(Art_v^{-1}σ)) at v ∈ R (E182: the hypothesis reads r̄_m ≅ r̄). CG18, §5.3, Conjecture A(3), published pp. 374–375: The GL_2 version includes local–global compatibility of diamond operators at Taylor–Wiles primes, the model for clause (6).


<a id="bt-bt-2-conj-b-vanishing"></a>

### Conjecture B(4): vanishing outside [q_0, q_0 + l_0] and on the boundary (hypothesis)

**Target:** `BeyondTW.ConjB.Vanishing` (definition); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.2/conj-b-vanishing`.

For Q, ψ and a maximal ideal m of T^an_{Q,ψ}, B^van(Q, ψ, m) is the conjunction, over every level K′ ∈ 𝒦_Q and every m ≥ 1, of: (a) H^i_ψ(Y(K′), O/ϖ^m)_m = 0 unless q_0 ≤ i ≤ q_0 + l_0; (b) H^i_ψ(∂Y(K′), O/ϖ^m)_m = 0 for all i, ∂Y(K′) the boundary of the Borel–Serre compactification. Here l_0, q_0 are the invariants of AutomorphicFormsOnReductiveGroups AF.4/l0-q0-invariants for Res_{F/ℚ}PGL_n: l_0 = r_1⌊(n − 1)/2⌋ + r_2(n − 1) and 2q_0 + l_0 = dim Y.

**Hypotheses and conventions.**

- Stated at every intermediate level, matching BT.0/tw-hecke-algebra
- Cohomology of the boundary is localized for the Hecke operators prime to S_Q acting on boundary cohomology (ArithmeticLocallySymmetricSpaces ALS.4)

**Construction or proof.**

1. (b) and the boundary triangle (ALS.4/boundary-triangle) give H^*_c ≅ H^* after localization, and with Poincaré–Verdier duality (ALS.5) H^*(Y, O/ϖ^m)^∨_m ≅ H_*(Y, O/ϖ^m)_{m^*}.
2. By dévissage (BT.2/conj-b-devissage) it suffices to check m = 1.

**Uses.** BT.4/localized-tw-complexes: concentration of D̃_N in degrees q_0, …, q_0 + l_0. BT.5/cuspidal-recognition: (b) makes the localized cohomology interior. CGH20 Theorem 3.2 (A.4): replaces (4)(a) for large p.

**API.**

- `BeyondTW.ConjB.Vanishing` (constructor): The proposition B^van(Q, ψ, m).
- `BeyondTW.ConjB.Vanishing.range` (projection): Clause (a).
- `BeyondTW.ConjB.Vanishing.boundary` (projection): Clause (b).
- `BeyondTW.ConjB.Vanishing.compact_eq` (characterisation): Under (b), H^*_{c,ψ}(Y(K′), O/ϖ^m)_m ≅ H^*_ψ(Y(K′), O/ϖ^m)_m.
- `BeyondTW.ConjB.Vanishing.dual` (compatibility): Under (b), H^*_ψ(Y, O/ϖ^m)^∨_m ≅ H_{*,ψ^{-1}}(Y, O/ϖ^m)_{m^*}.

**Unit tests.**

- `conjBVan_defect_zero` (degenerate): For l_0 = 0 the range is the single degree q_0 = dim Y/2.
- `conjBVan_imag_quad` (computation): For F imaginary quadratic and n = 2, dim Y = 3, l_0 = q_0 = 1 and the range is {1, 2}.
- `conjBVan_eisenstein_fails` (non-example): At the Eisenstein ideal with r̄_m = 1 ⊕ ε̄, H^0(Y, k)_m ≠ 0, so (a) fails; (a) is only asked at non-Eisenstein m in the theorems.
- `conjBVan_numerics` (computation): For n = 3, F = ℚ: l_0 = 1, 2q_0 + l_0 = 5, q_0 = 2.

**Acceptance.**

- For F = ℚ and n = 2 (l_0 = 0, q_0 = 1), (a) says H^0 and H^2 vanish at non-Eisenstein m, which holds.
- For F imaginary quadratic and n = 2 (l_0 = 1, q_0 = 1), (a) asks vanishing in degrees 0 and 3 only.
- (a) is open in general; (b) follows from Galois representations for the Levi cohomology (ALS.4/gln-boundary-eisenstein) when those are available.

**Direct prerequisites:** [The Hecke algebras T^an_{Q,ψ} and T_{Q,ψ} (Definition 9.1)](#bt-bt-0-tw-hecke-algebra); [The local systems O(ψ) of Iwahori characters](#bt-bt-0-iwahori-character-local-system); `AutomorphicFormsOnReductiveGroups:AF.4/l0-q0-invariants`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`; `ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal`.

**Source:** CG18, §9.3, Conjecture B(4)(a)–(b), published p. 414: Vanishing of H^i_ψ(Y_1(Q), O/ϖ^m)_m outside [q_0, q_0 + l_0] and of the localized boundary cohomology. CG18, §8.4, published pp. 405–406: l_0 and 2q_0 + l_0 via ranks and dimensions of SL_n(ℝ), SO_n(ℝ), SL_n(ℂ), SU_n(ℂ); [q_0, q_0 + l_0] is the range of tempered cuspidal cohomology (Borel–Wallach).


<a id="bt-bt-2-conj-b-tw-comparison"></a>

### Conjecture B(5): no new cohomology at Taylor–Wiles level (hypothesis)

**Target:** `BeyondTW.ConjB.TWComparison` (definition); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.2/conj-b-tw-comparison`.

For Q a set of Taylor–Wiles primes and m as in BT.0/tw-maximal-ideal-and-projector, B^tw(Q, ψ, m) asserts that for every m ≥ 1 the composite of pr^*, e_Q and the projection onto the m_Q-part, H^*_ψ(Y, O/ϖ^m)_m → H^*_ψ(Y_0(Q), O/ϖ^m)_{m_Q}, is an isomorphism, where pr : Y_0(Q) → Y is the natural projection and e_Q = lim_{k→∞} ∏_{x∈Q} Q_x(V_x)^{k!} is the Taylor–Wiles projector.

**Hypotheses and conventions.**

- Q a set of Taylor–Wiles primes (each ψ̄_x one-dimensional, N(x) ≡ 1 mod p)
- Projector with exponent k!, not n (E191)

**Construction or proof.**

1. Both sides are finite T_{Q,ψ}-modules; e_Q ∘ pr^* is Hecke equivariant for operators prime to S_Q because pr^* is.
2. By dévissage (BT.2/conj-b-devissage) it suffices to check m = 1.

**Uses.** BT.4/localized-tw-complexes: identifies the Δ_Q-coinvariants of D̃_N with the complex of Y. BT.4/patching-hypotheses-verified: condition (a) of the patching theorem: D_N ⊗ S_N/𝔪 ≅ T.

**API.**

- `BeyondTW.ConjB.TWComparison` (constructor): The proposition B^tw(Q, ψ, m).
- `BeyondTW.ConjB.TWComparison.map` (data): The map e_Q ∘ pr^* followed by the projection onto the m_Q-part.
- `BeyondTW.ConjB.TWComparison.empty` (simp): For Q = ∅ the proposition holds.
- `BeyondTW.ConjB.TWComparison.mono` (functoriality): If it holds for Q it holds for every subset of Q (by applying the projector one prime at a time).

**Unit tests.**

- `conjBTw_empty` (degenerate): For Q = ∅ the proposition holds for every m.
- `conjBTw_n2` (compatibility): For n = 2 it holds for every Taylor–Wiles set (Lemma 9.6).
- `conjBTw_without_projector` (non-example): pr^* alone is not an isomorphism onto H^*_ψ(Y_0(x), O/ϖ^m)_m for n = 2: the m-part contains the two degeneracy images H^*(Y)²_m (ALS.3/degeneracy-old-forms).
- `conjBTw_toy` (computation): For n = 2 the two old eigenvalues of V_x on H^*(Y)² are α_x and β_x, and e_Q selects the α_x-line.

**Acceptance.**

- For Q = ∅ the map is the identity.
- For n = 2 the hypothesis holds at every Taylor–Wiles prime (Lemma 9.6, BT.3/lemma-9-6).
- Under local–global compatibility at x the GL(n) analogue holds at primes with distinct Frobenius eigenvalues (BT.3/distinct-eigenvalue-comparison); its transfer to the Res PGL_n quotients used here is a recorded gap.

**Direct prerequisites:** [The Taylor–Wiles maximal ideal m_Q and projector e_Q](#bt-bt-0-tw-maximal-ideal-and-projector); [The Hecke algebras T^an_{Q,ψ} and T_{Q,ψ} (Definition 9.1)](#bt-bt-0-tw-hecke-algebra); `ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback`.

**Source:** CG18, §9.3, Conjecture B(5), published pp. 414–415: The map lim_k ∏_x Q_x(V_x)^{k!} ∘ pr^* from H^*_ψ(Y, O/ϖ^m)_m to H^*_ψ(Y_0(Q), O/ϖ^m)_{m_Q} is an isomorphism. CG18, §9.3, discussion after Remark 9.5, published p. 416: Condition (5) is needed because the arguments of CHT §3 require O-flat GL_n(F_x)-modules.


<a id="bt-bt-2-conjecture-b"></a>

### Conjecture B for a standing datum (the hypothesis bundle)

**Target:** `BeyondTW.ConjB` (definition); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.2/conjecture-b`; planet: *Conjecture B*.

For a standing datum and a maximal ideal m of T at level K_∅(R) with r̄_m ≅ r̄, ConjB(Q, ψ, m) := B^gal ∧ B^lgc ∧ B^van ∧ B^tw at (Q, ψ, m). The hypothesis of BT.5/theorem-9-19 is ConjB(Q, ψ, m_Q) for Q = ∅ and for each set Q_N of the chosen Taylor–Wiles system, with ψ = 1 and ψ = χ. 'Conjecture B for F' means ConjB for every standing datum over F, every Taylor–Wiles set and both character data. The appendix CGH20 Theorem 1.2 assumes all clauses except B^van.

**Hypotheses and conventions.**

- Clause (6) of BT.2/conj-b-local-global is included (E181)
- Intermediate levels are included in B^gal and B^van (BT.0/tw-hecke-algebra; sourceIssues E1 of this packet)

**Construction or proof.**

1. The bundle is the conjunction of the four named predicates; each theorem of BT.4–BT.5 names exactly the clauses it uses.

**Uses.** BT.5/theorem-9-19: the full hypothesis. BT.5/theorem-5-16: Conjecture B for F. CGH20 Theorem 1.2 (A.2): assumed without (4).

**API.**

- `BeyondTW.ConjB` (constructor): The bundled proposition.
- `BeyondTW.ConjB.forField` (constructor): Conjecture B for F.
- `BeyondTW.ConjB.withoutVanishing` (constructor): The conjunction without B^van, as assumed in CGH20.
- `BeyondTW.ConjB.mk` (constructor): Assemble from the four clauses.
- `BeyondTW.ConjB.mono_Q` (functoriality): ConjB at Q implies ConjB at every subset of Q for the clauses that do not mention diamond operators.

**Unit tests.**

- `conjB_empty_clauses` (degenerate): For Q = ∅, ConjB(∅, ψ, m) ↔ B^gal ∧ (1) ∧ (3) ∧ B^van.
- `conjB_GL2_Q` (compatibility): For F = ℚ, n = 2 and non-Eisenstein m, ConjB holds for every Taylor–Wiles set.
- `conjB_not_trivially_true` (non-example): ConjB(∅, 1, m) fails at the Eisenstein ideal of level one over ℚ (B^van(a) fails in degree 0).
- `conjB_withoutVanishing_weaker` (characterisation): ConjB → ConjB.withoutVanishing, and the converse needs B^van.

**Acceptance.**

- ConjB(∅, 1, m) involves only clauses (1), (3) and (4).
- For F = ℚ and n = 2 every clause holds at non-Eisenstein m (classical theory and Lemma 9.6).
- CGH20 replaces B^van by its Theorem 3.2 for large p.

**Direct prerequisites:** [Conjecture B, residual and integral Galois representations (hypothesis)](#bt-bt-2-conj-b-galois-type); [Conjecture B(1)–(3) and the Taylor–Wiles compatibility (6) (hypothesis)](#bt-bt-2-conj-b-local-global); [Conjecture B(4): vanishing outside [q_0, q_0 + l_0] and on the boundary (hypothesis)](#bt-bt-2-conj-b-vanishing); [Conjecture B(5): no new cohomology at Taylor–Wiles level (hypothesis)](#bt-bt-2-conj-b-tw-comparison).

**Source:** CG18, §9.3, Conjecture B, published pp. 414–415: The five parts of Conjecture B, conjectured for Taylor–Wiles sets Q. CG18, §9.5, published pp. 424–425: The modularity lifting argument assumes Conjecture B for each Q_N and for Q = ∅, with ψ = 1 and ψ = χ. CGH20, §1 and §4, arXiv pp. 3, 7–8: Theorem 1.2 assumes all parts of Conjecture B except (4) and uses Theorem 3.2 instead.


<a id="bt-bt-2-conj-b-devissage"></a>

### Dévissage for Conjecture B(4) and (5)

**Target:** `BeyondTW.ConjB.devissage` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.2/conj-b-devissage`.

For fixed (Q, ψ, m), clause (a) and clause (b) of B^van, and B^tw, hold for all coefficients O/ϖ^m (m ≥ 1) if and only if they hold for m = 1, that is with coefficients k = O/ϖ.

**Hypotheses and conventions.**

- Localization at m is exact on finite T-modules
- The maps in B^tw are natural in the coefficient module

**Construction or proof.**

1. Use the exact sequences 0 → O/ϖ^{m−1} → O/ϖ^m → k → 0 and the long exact cohomology sequences, which are Hecke equivariant and remain exact after localization (ALS.1/coefficient-change, ALS.4/localization-at-maximal-ideal).
2. Vanishing for k and O/ϖ^{m−1} gives vanishing for O/ϖ^m; for B^tw apply the five lemma to the map of long exact sequences given by e_Q ∘ pr^*.
3. The converse direction is the case m = 1.

**Acceptance.**

- For B^van the argument needs only exactness; for B^tw the naturality of e_Q ∘ pr^* in the coefficients.
- The printed text says n = 1 for m = 1 (E183).
- The statement fails for a single fixed degree without the neighbouring degrees: the long exact sequence mixes degrees i and i + 1.

**Direct prerequisites:** [Conjecture B(4): vanishing outside [q_0, q_0 + l_0] and on the boundary (hypothesis)](#bt-bt-2-conj-b-vanishing); [Conjecture B(5): no new cohomology at Taylor–Wiles level (hypothesis)](#bt-bt-2-conj-b-tw-comparison); `ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change`; `ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal`.

**Source:** CG18, §9.3, paragraph after Conjecture B, published p. 415: By dévissage, conditions 4 and 5 hold for all O/ϖ^m if and only if they hold with coefficients in k (E183 corrects n to m).


<a id="bt-bt-2-conj-b-type-s-surjection"></a>

### Conjecture B gives R_{S_Q} ↠ T^an_{Q,ψ,m} as O[Δ_Q]-algebras

**Target:** `BeyondTW.ConjB.globalRing_surj_hecke` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.2/conj-b-type-s-surjection`; planet: *R_{S_Q} ↠ T_m from Conjecture B*.

Let a standing datum be given, Q a Taylor–Wiles set, ψ ∈ {1, χ}, and m a maximal ideal of T^an_{Q,ψ} with r̄_m ≅ r̄. Assume B^gal and B^lgc at (Q, ψ, m), and ξ = ε^{n(n−1)/2}. Then r_m is a deformation of r̄ of type S_Q (ψ = 1) or S^χ_Q (ψ = χ), and the induced map R_{S_Q} → T^an_{Q,1,m} (resp. R_{S^χ_Q} → T^an_{Q,χ,m}) is a surjection of O[Δ_Q]-algebras: it sends tr ρ^univ(Frob_λ) to T_{λ,1} and the inertial character at x ∈ Q to the diamond action. It is compatible with the maps between intermediate levels in 𝒦_Q and, for Q = ∅, gives R_S ↠ T_m and R_{S^χ} ↠ T_{χ,m}.

**Hypotheses and conventions.**

- ξ = ε^{n(n−1)/2} (the printed text leaves this implicit; E186)
- Clause (6) for the Δ_Q-linearity (E181)

**Construction or proof.**

1. Clauses (1)–(3) of B^lgc and det r_m = ε^{n(n−1)/2} (from T_{λ,n} = 1 and Chebotarev) show r_m is of type S_Q or S^χ_Q (BT.1/cg-global-deformation-data).
2. The image of R_{S_Q} is the closed O-subalgebra generated by the coefficients of the characteristic polynomials of r_m(Frob_λ), which are the T_{λ,i}; these generate T^an_{Q,ψ,m} together with the diamond operators.
3. Clause (6) identifies the diamond operators with the images of the inertial characters ψ_x, so the image contains them and the map is O[Δ_Q]-linear.
4. Compatibility with the maps between levels holds because pullback and trace commute with the T_{λ,i}, λ ∉ S_Q.

**Acceptance.**

- For Q = ∅ this is R_S ↠ T_m, used in Theorem 9.19.
- Without (6) only the subalgebra generated by the T_{λ,i} is hit, and the surjection onto T^an_{Q,ψ,m} can fail.
- With ψ = χ the map lands in T^an_{Q,χ,m} and its reduction mod ϖ agrees with the ψ = 1 map under BT.0/residual-character-independence.

**Direct prerequisites:** [Conjecture B, residual and integral Galois representations (hypothesis)](#bt-bt-2-conj-b-galois-type); [Conjecture B(1)–(3) and the Taylor–Wiles compatibility (6) (hypothesis)](#bt-bt-2-conj-b-local-global); [The global deformation data S_Q and S^χ_Q](#bt-bt-1-cg-global-deformation-data); [The Hecke algebras T^an_{Q,ψ} and T_{Q,ψ} (Definition 9.1)](#bt-bt-0-tw-hecke-algebra); [Residual independence of the Iwahori character and the dual local system](#bt-bt-0-residual-character-independence).

**Source:** CG18, §9.3, sentence after Conjecture B(5), published p. 415: It follows that r_m is a deformation of type S_Q (resp. S^χ_Q), giving surjections R_{S_Q} ↠ T^an_{Q,1,m} (resp. R_{S^χ_Q} ↠ T^an_{Q,χ,m}); E186 adds ξ = ε^{n(n−1)/2}, E181 the compatibility at Q. CG18, §9.5, published p. 426: By Conjecture B there are surjections R_S ↠ T_m and R_{S^χ} ↠ T_{χ,m}.


<a id="bt-bt-2-conj-b-small-rank"></a>

### Conjecture B(4)(a) in small rank (Remark 9.3)

**Target:** `BeyondTW.ConjB.vanishing_small_rank` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.2/conj-b-small-rank`.

Let m be a non-Eisenstein maximal ideal at which B^gal and B^van(b) hold. (1) For F imaginary quadratic and n = 2 (dim Y = 3, l_0 = q_0 = 1), H^0(Y(K′), O/ϖ^m)_m = H^3(Y(K′), O/ϖ^m)_m = 0 for every level, so B^van(a) holds. (2) For n = 3, F = ℚ ((q_0, l_0) = (2, 1), d = dim Y = 5) and for n = 2 with F a CM field of degree 4 ((q_0, l_0) = (2, 2), d = 6), with p > n unramified in F as in the standing data, suppose also that B^gal holds at the dual maximal ideal m^∨ and that m^∨ is non-Eisenstein. Then H^i(Y(K′), O/ϖ^m)_m = 0 for i ∈ {0, 1, d − 1, d} and every level K′, so B^van(a) holds.

**Hypotheses and conventions.**

- Boundary vanishing at m (B^van(b)) for the step from H_c to H, or ArithmeticLocallySymmetricSpaces ALS.4/gln-boundary-eisenstein where Galois representations of the Levi factors are available
- For (2): p > n unramified in F, so p ∤ #μ(F); the congruence-kernel theorems behind the vanishing of H^0 and H^1 (Bass–Milnor–Serre for SL_3(ℤ), Serre 1970 for SL_2(O_F) with O_F^× infinite) are planned in KTheoryLowDegrees U.4 and enter through U.4/cg-localized-h1-vanishing
- In both cases of (2), G(ℝ) = PGL_3(ℝ) or PGL_2(ℂ)² is connected, so Y(K′) is orientable and Poincaré duality needs no orientation twist

**Construction or proof.**

1. (1) H^0 at a non-Eisenstein m vanishes because H^0(Y, k) is spanned by component classes on which T_{λ,1} acts by a degree (Eisenstein eigenvalues); H^3 = H^3_c (boundary vanishing) is dual to H^0 at m^*.
2. (2) KTheoryLowDegrees U.4/cg-localized-h1-vanishing gives H^0(Y(K′), k)_m = H^1(Y(K′), k)_m = 0 at every level for a non-Eisenstein m, and likewise at m^∨: a finite central congruence kernel of order prime to p makes every mod-p character of the lattices congruence, and the finite-cover Hochschild–Serre sequence then places it in Eisenstein-supported H^0.
3. Poincaré duality (ALS.5 verdier-poincare-duality, with hecke-adjoint-duality sending m to m^∨) identifies H_c^{d−i}(Y, k)_m with the dual of H^i(Y, k)_{m^∨}, which vanishes for i = 0, 1; boundary vanishing at m (ALS.4/boundary-triangle) identifies H_c^{d−i} and H^{d−i} after localization.
4. The degrees outside [q_0, q_0 + l_0] are 0, 1, d − 1, d; dévissage (BT.2/conj-b-devissage) passes from k to O/ϖ^m.

**Acceptance.**

- For F imaginary quadratic the proof needs no congruence subgroup property (CG18 Lemma 5.9(1)); H^1 and H^2 lie in the range [1, 2] there.
- The printed degree q_0 − 1 is d − 1 (E184); Serre's 1970 paper is the right citation for the CM quartic case (E185); KTheoryLowDegrees U.4 leaves the degree d − 1 half of Remark 9.3 to this node.
- For n = 2 and F real quadratic, l_0 = 0 and q_0 = 2 (Hilbert modular surfaces), which is not covered.

**Direct prerequisites:** [Conjecture B(4): vanishing outside [q_0, q_0 + l_0] and on the boundary (hypothesis)](#bt-bt-2-conj-b-vanishing); `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`; `ArithmeticLocallySymmetricSpaces:ALS.4/gln-boundary-eisenstein`; `KTheoryLowDegrees:U.4/cg-localized-h1-vanishing`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality`; [Conjecture B, residual and integral Galois representations (hypothesis)](#bt-bt-2-conj-b-galois-type); [Dévissage for Conjecture B(4) and (5)](#bt-bt-2-conj-b-devissage).

**Source:** CG18, §9.3, Remark 9.3, published p. 415: Part (4)(a) can be verified for GL(2) over CM fields of degree 2 or 4 and GL(3)/ℚ; in the last two cases the congruence subgroup property gives vanishing of H^1 at m and, by duality at m and its dual, of H_c^{d−1}, hence of H^{d−1} by boundary vanishing (degree corrected to d − 1 by E184; Serre's paper added by E185). CG18, §5.2, Lemma 5.9(1), published p. 376: The imaginary quadratic case: vanishing in degrees 0 and 3.


## BT.3. No new cohomology at Taylor–Wiles level

Condition (5) of Conjecture B: for n = 2, Lemma 9.6 through the PSL_2 reduction, the S-arithmetic Ihara amalgam Γ^1 ∗_{Γ^1_0(x)} Γ^1, the operator U_{x²}, the Hecke-equivariant Lyndon sequence and localization at (m, U_x − α_x); for GL_n at primes with distinct Frobenius eigenvalues, the comparison e_α : H^*(X)_{m_∅} ≅ H^*(X_0(x))_m through the block category of SmoothRepresentationsOfLocalGroups SR.5, under local–global compatibility at x (its transfer to the Res_{F/ℚ}PGL_n quotients is a recorded gap).

**Layer dependencies:** `ArithmeticLocallySymmetricSpaces:ALS.0`, `ArithmeticLocallySymmetricSpaces:ALS.6`, `ReductiveGroupsPartII:RG2.2`, `AdelicAlgebraicGroups:AA.4`, `AutomorphyLiftingBeyondTaylorWiles:BT.0`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `ModularCurvesPartII:R14.4`, `AutomorphyLiftingBeyondTaylorWiles:BT.2`, `SmoothRepresentationsOfLocalGroups:SR.5`.


<a id="bt-bt-3-psl2-reduction"></a>

### Reduction from PGL_2 to PSL_2 arithmetic groups

**Target:** `BeyondTW.psl2_reduction` (lemma); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.3/psl2-reduction`.

Let n = 2, p odd, and Y = ⊔_i Γ_i\ℋ the decomposition of an arithmetic quotient of Res_{F/ℚ}PGL_2 into components (ℋ the symmetric space, Γ_i congruence subgroups commensurable with PGL_2(O_F)). For each Γ = Γ_i put Γ^1 := Γ ∩ PSL_2(O_F). Then Φ := Γ/Γ^1 is an elementary abelian 2-group and, for every m ≥ 1, restriction gives H^*(Γ, O/ϖ^m) ≅ H^*(Γ^1, O/ϖ^m)^Φ; the same holds for Γ_0(x) and Γ^1_0(x) := Γ_0(x) ∩ Γ^1, compatibly with restriction maps and with double-coset operators from elements of PSL_2(F).

**Hypotheses and conventions.**

- p odd (p > n = 2)
- Component groups as in ALS.0/component-decomposition; at non-neat level the cohomology is that of the arithmetic groupoid

**Construction or proof.**

1. PGL_2/PSL_2 is identified with F^×/F^{×2} through the determinant, so Γ/Γ^1 embeds in O_F^×/O_F^{×2}-type groups of exponent two (ALS.0/component-decomposition).
2. The Hochschild–Serre spectral sequence for Γ^1 ⊂ Γ with |Φ| a power of 2 invertible in O/ϖ^m degenerates to the invariants (ALS.6/finite-cover-hochschild-serre, degenerate case).
3. Double-coset operators of elements of PSL_2(F) normalize the situation and commute with the Φ-action.

**Acceptance.**

- For F = ℚ and Γ = PGL_2(ℤ), Φ = ℤ/2 and Γ^1 = PSL_2(ℤ).
- The statement fails for p = 2.
- Φ acts on H^*(Γ^1) through the outer action of a matrix of determinant a unit not a square.

**Direct prerequisites:** `ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition`; `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre`.

**Source:** CG18, §9.3, proof of Lemma 9.6, published p. 417: Y ≅ ⊔Γ_i\ℋ; Γ^1 = Γ ∩ PSL_2(O_F), Φ = Γ/Γ^1 elementary abelian of exponent two, and H^*(Γ, O/ϖ^n) ≅ H^*(Γ^1, O/ϖ^n)^Φ by Hochschild–Serre since p is odd.


<a id="bt-bt-3-global-ihara-amalgam"></a>

### The S-arithmetic amalgam G = Γ^1 ∗_{Γ^1_0(x)} Γ^1

**Target:** `BeyondTW.iharaAmalgam` (construction); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.3/global-ihara-amalgam`.

Let n = 2, x a Taylor–Wiles prime with K_x maximal, and assume x is trivial in the ray class group governing the components of Y, with π_x ∈ O_F a generator of x. For Γ^1 as in BT.3/psl2-reduction, with level maximal at x, let Γ^1_0(x) := Γ_0(x) ∩ Γ^1, h := diag(1, π_x) ∈ PGL_2(F) and g := diag(π_x, π_x^{-1}) ∈ PSL_2(F). Then Γ^1 ∩ hΓ^1h^{-1} = Γ^1_0(x), Γ^1 and hΓ^1h^{-1} being the stabilizers of two adjacent vertices of the Bruhat–Tits tree of PSL_2(F_x); the subgroup G of PSL_2(O_F[1/x]) generated by Γ^1 and hΓ^1h^{-1} is a congruence subgroup with the same level as Γ^1 away from x and contains g; and G is the amalgamated product Γ^1 ∗_{Γ^1_0(x)} Γ^1 of Γ^1 with itself along Γ^1_0(x), embedded in the first factor by inclusion and in the second by γ ↦ h^{-1}γh. G acts on the tree without inversion with an edge as fundamental domain. Conjugation by g moves a vertex to one at distance two, so Γ^1 and gΓ^1g^{-1} do not form this amalgam.

**Hypotheses and conventions.**

- Without the triviality assumption on x one amalgamates different Γ_i of the component decomposition; the argument is the same with more notation
- Strong approximation for SL_2 over F with respect to the place x (SL_2(F_x) noncompact)

**Construction or proof.**

1. Local Ihara amalgam: PSL_2(F_x) is the amalgamated product of the stabilizers of two adjacent vertices of its tree over the Iwahori subgroup (ReductiveGroupsPartII RG2.2/ihara-amalgam).
2. Strong approximation for SL_2 (AdelicAlgebraicGroups AA.4/strong-approximation-theorem) gives density of the S-arithmetic group in PSL_2(F_x) and identifies the quotient of the tree by G with one edge, whose vertex stabilizers are Γ^1 and hΓ^1h^{-1} and whose edge stabilizer is Γ^1_0(x); g lies in G because π_x is a unit congruent to 1 at the level away from x (the triviality of x in the ray class group).
3. Serre's structure theorem for groups acting on trees with an edge as quotient gives the amalgam.

**Uses.** BT.3/lyndon-hecke-equivariance: the Lyndon sequence of the amalgam. BT.3/lemma-9-6: U_{x²} acts on H^*(G) by a degree.

**API.**

- `BeyondTW.iharaAmalgam` (constructor): The group G ⊂ PSL_2(O_F[1/x]) with its two embeddings of Γ^1 (inclusion, and conjugation by h = diag(1, π_x)).
- `BeyondTW.iharaAmalgam.isPushout` (universal-property): G is the pushout of Γ^1 ← Γ^1_0(x) → Γ^1 in groups.
- `BeyondTW.iharaAmalgam.isCongruence` (characterisation): G is a congruence subgroup of PSL_2(O_F[1/x]) with level equal to that of Γ^1 away from x.
- `BeyondTW.iharaAmalgam.mem_g` (simp): diag(π_x, π_x^{-1}) ∈ G.

**Unit tests.**

- `iharaAmalgam_Q` (compatibility): For F = ℚ, Γ^1 = PSL_2(ℤ) and x = ℓ, G = PSL_2(ℤ[1/ℓ]).
- `iharaAmalgam_edge_quotient` (characterisation): G\(tree) is a single edge whose vertex stabilizers are Γ^1 and hΓ^1h^{-1}, h = diag(1, π_x); the vertices fixed by Γ^1 and by gΓ^1g^{-1} are at distance two.
- `iharaAmalgam_not_PGL2` (non-example): PGL_2(ℤ[1/ℓ]) is not the amalgam of two copies of PGL_2(ℤ) over Γ_0(ℓ): it contains elements of odd valuation determinant, which invert the edge.
- `iharaAmalgam_degenerate_index` (computation): [Γ^1 : Γ^1_0(x)] = N(x) + 1.

**Acceptance.**

- For F = ℚ and Γ^1 = PSL_2(ℤ), G = PSL_2(ℤ[1/x]) and the statement is Ihara's theorem.
- G contains g, so the double coset GgG = G acts on H^*(G) as the identity (sourceIssues E189 of PAPER-CALEGARI-GERAGHTY-18).
- The amalgam does not exist for PGL_2 (only for the even-valuation subgroup).

**Direct prerequisites:** [Reduction from PGL_2 to PSL_2 arithmetic groups](#bt-bt-3-psl2-reduction); `ReductiveGroupsPartII:RG2.2/ihara-amalgam`; `AdelicAlgebraicGroups:AA.4/strong-approximation-theorem`.

**Source:** CG18, §9.3, proof of Lemma 9.6 and Remark 9.7, published pp. 417–418: The amalgam G := Γ^1 ∗_{Γ^1_0(x)} Γ^1 is a congruence subgroup of PSL_2(O_F[1/x]); PSL_2(F_x) is an amalgam while PGL_2(F_x) is not; the gluing of the second factor, left implicit there, is conjugation by diag(1, π_x).


<a id="bt-bt-3-u-x-squared"></a>

### The operator U_{x²} on Γ^1_0(x)-cohomology

**Target:** `BeyondTW.Ux2` (definition); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.3/u-x-squared`.

With x, π_x as in BT.3/global-ihara-amalgam, U_{x²} is N(x)^{-2} times the double-coset operator of Γ^1_0(x) attached to diag(π_x², 1), equivalently (the operator depends on the matrix only up to scalars) to g = diag(π_x, π_x^{-1}). It acts on H^*(Γ^1_0(x), O/ϖ^m), on H^*(Y_0(x), O/ϖ^m) componentwise, and on H^*(G, O/ϖ^m) through the double coset GgG = G, where the unnormalized operator is the identity, so that U_{x²} acts on H^*(G) by the scalar N(x)^{-2} (not by 1 as printed; sourceIssues E189 of PAPER-CALEGARI-GERAGHTY-18). On H^*(Y_0(x), O/ϖ^m), U_x² = U_{x²} for U_x normalized as N(x)^{-1} times the double coset of diag(π_x, 1); for the unnormalized V_x = T_{x,1}, V_x² = N(x)²U_{x²} ≡ U_{x²} mod p.

**Hypotheses and conventions.**

- N(x) ≡ 1 mod p, so N(x) is a unit and N(x)² ≡ 1 mod p

**Construction or proof.**

1. The double-coset operator [Γ^1_0(x) g Γ^1_0(x)] is defined by restriction, conjugation and corestriction (ALS.3/hecke-operator-formula).
2. Since g ∈ G, the double coset GgG is the single coset G and the induced endomorphism of H^*(G) is the identity (conjugation by an element of G acts trivially on H^*(G)); it is also the map induced on H_0 of the Bruhat–Tits tree by the compatible endomorphism of its chain complex, whose augmentation is 1 (E189). So U_{x²} acts on H^*(G) by N(x)^{-2}, a unit ≡ 1 mod p. The printed argument, which multiplies by the degree N(x)², computes the operator on the restriction of a G-invariant class to Γ^1_0(x), not on H^*(G).
3. The relation U_x² = U_{x²} is the composition of double cosets at a prime of level Γ_0(x) (ALS.3/hecke-composition).

**Uses.** BT.3/lyndon-hecke-equivariance: equivariance of the Lyndon sequence. BT.3/lemma-9-6: localization at an ideal where U_{x²} − 1 is a unit.

**API.**

- `BeyondTW.Ux2` (constructor): U_{x²} on H^*(Γ^1_0(x)), H^*(Y_0(x)) and H^*(G).
- `BeyondTW.Ux2_on_amalgam` (characterisation): U_{x²} acts on H^*(G, O/ϖ^m) by the scalar N(x)^{-2} (the unnormalized double coset GgG = G acts by 1); in particular U_{x²} − 1 acts by a scalar in pℤ_p.
- `BeyondTW.Ux2_eq_sq` (relation): U_x² = U_{x²} on H^*(Y_0(x), O/ϖ^m).
- `BeyondTW.Ux2_indep_scalar` (extensionality): The operator depends on the matrix only up to scalars.

**Unit tests.**

- `Ux2_old_eigenvalues` (computation): On the old part, U_{x²} has eigenvalues α_x² and β_x², reductions of the squares of the roots of X² − T_x X + N(x).
- `Ux2_on_G_scalar` (characterisation): U_{x²} acts on H^0(G, O/ϖ^m) = O/ϖ^m by N(x)^{-2}, which is ≡ 1 mod p but not 1 in general: for N(x) = 7, p = 3 and m = 2 it is multiplication by 7 on ℤ/9.
- `Ux2_unnormalized` (non-example): The unnormalized double coset of diag(π_x², 1) acts on H^0(Γ^1_0(x)) by N(x)², not by 1.
- `Ux2_mod_p` (compatibility): V_x² ≡ U_{x²} mod p, since N(x) ≡ 1 mod p.

**Acceptance.**

- U_{x²} ≡ V_x² mod p.
- On the old part spanned by the degeneracy images, U_x has eigenvalues α_x, β_x and U_{x²} has α_x², β_x².
- U_{x²} − 1 is invertible on the localization at (m, U_x − α_x) because α_x² ≢ 1.

**Direct prerequisites:** [The S-arithmetic amalgam G = Γ^1 ∗_{Γ^1_0(x)} Γ^1](#bt-bt-3-global-ihara-amalgam); [Hecke operators T_{α,k}, V_x and diamond operators at Taylor–Wiles level](#bt-bt-0-tw-hecke-operators); `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula`; `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-composition`.

**Source:** CG18, §9.3, proof of Lemma 9.6, published p. 418: U_{x²} is 1/N(x)² times the double coset operator for Γ^1_0(x) of diag(π_x², 1), equivalently of g = diag(π_x, π_x^{-1}) ∈ G; the source says it acts on H^*(G) by 1 (the correct value is N(x)^{-2}, E189), and U_x² = U_{x²} on H^*(Y_0(x)). CG18, §9.3, Remark 9.7, published p. 418: U_{x²} acts by +1 on H^*(G) (E192 reads U_{x²} for U_x²; by E189 the value is N(x)^{-2} ≡ 1 mod p).


<a id="bt-bt-3-lyndon-hecke-equivariance"></a>

### The Hecke-equivariant Lyndon sequence of the amalgam

**Target:** `BeyondTW.lyndon_hecke_equivariant` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.3/lyndon-hecke-equivariance`.

For the amalgam G = Γ^1 ∗_{Γ^1_0(x)} Γ^1 and every m ≥ 1 there is a long exact sequence ⋯ → H^{i−1}(Γ^1_0(x), O/ϖ^m) → H^i(G, O/ϖ^m) → H^i(Γ^1, O/ϖ^m)² → H^i(Γ^1_0(x), O/ϖ^m) → H^{i+1}(G, O/ϖ^m) → ⋯, whose middle map is the difference of the two restrictions (the second through conjugation by g). It is equivariant for U_{x²}, acting on the outer terms as in BT.3/u-x-squared and on H^i(Γ^1)² by the 2 × 2 matrix of Hecke operators induced by the tree endomorphism, and for the Hecke operators prime to x. Localizing at any ideal where U_{x²} − 1 is invertible on all terms gives H^i(Γ^1, O/ϖ^m)²_· ≅ H^i(Γ^1_0(x), O/ϖ^m)_·.

**Hypotheses and conventions.**

- The printed sequence has H^{i−1}(G) where H^i(G) belongs (E190)
- Equivariance is asserted without proof in the source (E189); it is proved through the tree

**Construction or proof.**

1. Realize the Lyndon sequence as the Ext_G(−, O/ϖ^m) sequence of the chain complex 0 → C_1(𝒯) → C_0(𝒯) → ℤ → 0 of the Bruhat–Tits tree 𝒯 (ModularCurvesPartII R14.4/lyndon-exact-sequence for the exact sequence).
2. U_{x²} on H^*(Γ^1_0(x)) is induced by the G-endomorphism of C_1(𝒯) = ℤ[G/Γ^1_0(x)] sending an edge to the sum of the N(x)² edges at distance two; it extends uniquely to a G-endomorphism of C_0(𝒯) compatible with the boundary, inducing the stated 2 × 2 Hecke matrix on the Γ^1-terms.
3. On H^*(G) the induced endomorphism is the one induced on H_0(𝒯) = ℤ, multiplication by the augmentation 1 of the unnormalized operator, so U_{x²} acts on H^*(G) by N(x)^{-2}, as in BT.3/u-x-squared.
4. U_{x²} − 1 acts on H^*(G, O/ϖ^m) by the scalar N(x)^{-2} − 1 ∈ pℤ_p (the source claims 0; E189), hence nilpotently; after localizing the sequence (exact, as a sequence of modules over the commutative algebra generated by U_{x²} and the operators prime to x) at an ideal where U_{x²} − 1 is a unit, the H^*(G) terms vanish and the middle map is an isomorphism.

**Acceptance.**

- The localized isomorphism holds at m̃ = (m, U_x − α_x) since U_{x²} − 1 ≡ α_x² − 1 is a unit there.
- At the anaemic m itself the argument does not apply when part of the m-localization has U_x ≡ ±1 (E229).
- For F = ℚ this recovers the Ihara-lemma argument of Calegari–Venkatesh Chapter 4.

**Direct prerequisites:** [The S-arithmetic amalgam G = Γ^1 ∗_{Γ^1_0(x)} Γ^1](#bt-bt-3-global-ihara-amalgam); [The operator U_{x²} on Γ^1_0(x)-cohomology](#bt-bt-3-u-x-squared); `ModularCurvesPartII:R14.4/lyndon-exact-sequence`.

**Source:** CG18, §9.3, proof of Lemma 9.6, published p. 418: The long exact sequence of Lyndon for an amalgam (Serre, Trees, p. 169) and the claim that it is U_{x²}-equivariant, giving H^i(Γ^1)²_m ≅ H^i(Γ^1_0(x))_m after localizing at an ideal where U_{x²} − 1 is invertible. CG18, §9.3, proof of Lemma 9.6, published p. 418 (with E189, E190 of PAPER-CALEGARI-GERAGHTY-18): The corrected index of the sequence and the tree-level construction of the Hecke equivariance.


<a id="bt-bt-3-lemma-9-6"></a>

### Lemma 9.6: condition (5) of Conjecture B for n = 2

**Target:** `BeyondTW.lemma_9_6` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.3/lemma-9-6`; planet: *Lemma 9.6 (condition (5) for n = 2)*.

Let n = 2, p > 2, Q a set of Taylor–Wiles primes and m a maximal ideal of T^an_{Q,ψ} with B^gal and r̄_m ≅ r̄. For x ∈ Q let α_x, β_x be the two (distinct) eigenvalues of r̄(Frob_x), with α_x the eigenvalue on ψ̄_x. Then for every m ≥ 1 the map (lim_{k→∞}∏_{x∈Q}(V_x − β̃_x)^{k!}) ∘ pr^* , followed by the projection onto the m_Q-part, is an isomorphism H^*_ψ(Y, O/ϖ^m)_m → H^*_ψ(Y_0(Q), O/ϖ^m)_{m_Q}; that is, B^tw(Q, ψ, m) holds.

**Hypotheses and conventions.**

- N(x) ≡ 1 mod p and α_x ≠ β_x (so α_x ≢ ±1, since α_xβ_x ≡ N(x) ≡ 1)
- ψ dropped from the notation; the argument is the same for O(ψ) since ψ is trivial at x
- Localization at m̃ = (m, U_x − α_x), not at m (E229)

**Construction or proof.**

1. Induction on |Q| reduces to Q = {x}, using that the projectors for different primes commute.
2. The degeneracy maps φ : H^*(Y)² → H^*(Y_0(x)) and φ^∨ satisfy φ^∨ ∘ φ = (N(x)+1, T_x; T_x, N(x)+1), with determinant (N(x)+1)² − T_x² ∉ m, so H^*(Y_0(x))_m ≅ H^*(Y)²_m ⊕ W and H^*(Y_0(x))_{m̃} ≅ H^*(Y)_{m̃} ⊕ W_{m̃} (ArithmeticLocallySymmetricSpaces ALS.3/degeneracy-old-forms).
3. Pass to PSL_2 components (BT.3/psl2-reduction) and apply the localized Lyndon isomorphism at m̃ (BT.3/lyndon-hecke-equivariance), where U_{x²} − 1 ≡ α_x² − 1 is a unit: H^i(Y)²_{m̃} ≅ H^i(Y_0(x))_{m̃}, so W_{m̃} = 0.
4. Applying the projectors lim(U_x − β̃_x)^{k!} and lim(U_x − α̃_x)^{k!} (exponent k!, E191) identifies H^*(Y)_m with the α_x-part, which is the m_Q-part.

**Acceptance.**

- For F = ℚ this is the classical 'no new cohomology at Taylor–Wiles level' statement (ModularCurvesPartII R14.4/taylor-wiles-root-control).
- The statement concerns all degrees, not only the lowest one (contrast CG18 Remark 9.8).
- For n = 3 the method fails: PSL_3(F_x) is not an amalgam of two vertex stabilizers.

**Direct prerequisites:** `ArithmeticLocallySymmetricSpaces:ALS.3/degeneracy-old-forms`; [Reduction from PGL_2 to PSL_2 arithmetic groups](#bt-bt-3-psl2-reduction); [The Hecke-equivariant Lyndon sequence of the amalgam](#bt-bt-3-lyndon-hecke-equivariance); [The operator U_{x²} on Γ^1_0(x)-cohomology](#bt-bt-3-u-x-squared); [Conjecture B(5): no new cohomology at Taylor–Wiles level (hypothesis)](#bt-bt-2-conj-b-tw-comparison); [The Taylor–Wiles maximal ideal m_Q and projector e_Q](#bt-bt-0-tw-maximal-ideal-and-projector); [Conjecture B, residual and integral Galois representations (hypothesis)](#bt-bt-2-conj-b-galois-type).

**Source:** CG18, §9.3, Lemma 9.6 and proof, published pp. 416–418: If n = 2, condition 5 of Conjecture B holds for all Taylor–Wiles primes; proof by degeneracy maps, the amalgam Γ^1 ∗ Γ^1, Lyndon's sequence and U_x² = U_{x²}, completed at m̃ (E229) with k! projectors (E191). CG18, §9.3, Remarks 9.7–9.8, published pp. 418–419: PSL_2(F_x) is an amalgam while PGL_2(F_x) is not; the lowest-degree case is more elementary.


<a id="bt-bt-3-distinct-eigenvalue-comparison"></a>

### No new cohomology at primes with distinct Frobenius eigenvalues (§9.4)

**Target:** `BeyondTW.distinct_eigenvalue_comparison` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.3/distinct-eigenvalue-comparison`; planet: *Distinct-eigenvalue comparison*.

Let G = GL_n over F with arithmetic quotients X, X_0(x) (level the line-stabilizer at x), x a prime with N(x) ≡ 1 mod p at which r̄(Frob_x) is unramified with n distinct eigenvalues, α one of them, m_∅ the Hecke ideal away from x and m = (m_∅, V − α) with V the double coset of diag(1, …, 1, ϖ_x). Assume local–global compatibility at x for the localized completed cohomology: every irreducible G(F_x)-subrepresentation of M_j[m_∅], M_j := lim_{m→∞}H^j(X(x^m), O/ϖ^n)_{m_∅}, is the unramified principal series attached to r̄|G_x. Then e_α := lim_k Q(V)^{k!} induces isomorphisms H^*(X, O/ϖ^n)_{m_∅} ≅ H^*(X_0(x), O/ϖ^n)_m, where P(T) = (T − α)Q(T) is the characteristic polynomial of r̄(Frob_x). For the Res_{F/ℚ}PGL_n quotients of §9 the corresponding statement (B^tw at such primes, and the comparison H^i(Y_0(Q), k)_{m_α} ≅ H^i(Y, k)_m that CGH20 Theorem 3.2 uses) is not established here: CG18 only says it should follow from the GL_n case through the central torus fibrations (E194), and it is a recorded gap of this roadmap.

**Hypotheses and conventions.**

- Distinct eigenvalues of r̄(Frob_x) (enormous image supplies such Taylor–Wiles primes)
- The local–global compatibility at x is a hypothesis; the source says only 'by assumption'
- GL_n quotients are torus bundles (not circle bundles) over PGL_n quotients up to components (E194); the source's remark that the PGL_n case should be easy to deduce is not an argument, and the PGL_n version is the recorded gap 'Distinct-eigenvalue comparison for the Res_{F/ℚ}PGL_n quotients'

**Construction or proof.**

1. Each M_j is filtered by its m_∅-torsion, and the compatibility hypothesis with Ext-vanishing between the unramified principal series and other irreducibles (SmoothRepresentationsOfLocalGroups SR.5/cg-distinct-block) puts M_j in the block category 𝒞.
2. Hochschild–Serre for the towers X(x^m) → X and X(x^m) → X_0(x) gives spectral sequences H^i(G(O_x), M_j) ⇒ H^{i+j}(X)_{m_∅} and e_αH^i(U_0(x), M_j) ⇒ H^{i+j}(X_0(x))_m (ArithmeticLocallySymmetricSpaces ALS.6/finite-cover-hochschild-serre and its tower version).
3. The map ι_* : H^k(G(O_x), M) → e_αH^k(U_0(x), M) is an isomorphism on the block (SR.5/cg-derived-projector, CG18 Theorem 9.16), so the morphism of spectral sequences is an isomorphism on E_2 and hence on the abutments.
4. The comparison is equivariant for the Hecke operators away from x. The PGL_n version is not deduced: the torus fibrations of E194 relate the two cohomologies only through a Leray spectral sequence, and Khare–Thorne Lemma 6.25(4), which CGH20 cites, is a GL_n statement at Iwahori level for ordinary completed cohomology (see the gap and sourceIssues E4).

**Acceptance.**

- For GL_2 with distinct eigenvalues this is the analogue of Lemma 9.6, conditional on local–global compatibility at x; for PGL_2, Lemma 9.6 (BT.3/lemma-9-6) gives B^tw without it.
- Without distinct eigenvalues the category 𝒞 is not described by Corollary 9.13 and the argument does not apply.
- The isomorphism is compatible with the Hecke operators prime to x.

**Direct prerequisites:** `SmoothRepresentationsOfLocalGroups:SR.5/cg-distinct-block`; `SmoothRepresentationsOfLocalGroups:SR.5/cg-derived-projector`; `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre`; [The Taylor–Wiles maximal ideal m_Q and projector e_Q](#bt-bt-0-tw-maximal-ideal-and-projector); [Conjecture B(5): no new cohomology at Taylor–Wiles level (hypothesis)](#bt-bt-2-conj-b-tw-comparison); [Conjecture B, residual and integral Galois representations (hypothesis)](#bt-bt-2-conj-b-galois-type).

**Source:** CG18, §9.4.1–9.4.2, Lemmas 9.9–9.14, Theorem 9.16, published pp. 419–424: The category 𝒞, the description of its finite-length objects, injectives, and Theorem 9.16 (ι_* is an isomorphism); §9.4.2 applies it to the modules M_j by comparing two Hochschild–Serre spectral sequences. CGH20, §3.1, proof of Theorem 3.2, arXiv pp. 5–6: H^i(Y_0(Q), k)_{m_α} ≅ H^i(Y, k)_m as in §9.4 of CG18 and Khare–Thorne Lemma 6.25(4).


## BT.4. Taylor–Wiles complexes and patching data

The minimal perfect complexes D̃_N and D̃^χ_N over O[Δ_N] in degrees q_0, …, q_0 + l_0 computing the projected localized homology of the intermediate covers; the two patching data of Theorem 9.19 (S_∞, O^□, R^i_∞ = R^i_loc⟦x_1, …, x_g⟧, (R^i, H^i), the reflected residual complex T, D^i_N, compatible surjections φ^i_N); their comparisons modulo ϖ; and the verification of hypotheses (a)–(d) of the patching theorem and of its two-datum version.

**Layer dependencies:** `AutomorphyLiftingBeyondTaylorWiles:BT.0`, `AutomorphyLiftingBeyondTaylorWiles:BT.2`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `DeformationAndDerivedPatchingAlgebra:P7`, `AutomorphyLiftingBeyondTaylorWiles:BT.1`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `DeformationAndDerivedPatchingAlgebra:P8`.


<a id="bt-bt-4-localized-tw-complexes"></a>

### The minimal complexes D̃_N and D̃^χ_N

**Target:** `BeyondTW.twComplex` (construction); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.4/localized-tw-complexes`; planet: *Taylor–Wiles complexes D̃_N*.

For a standing datum, a maximal ideal m of T with r̄_m ≅ r̄, a Taylor–Wiles set Q_N of level N (BT.1/numerical-coincidence) and a surjection Δ̃_{Q_N} ↠ Δ_N := (ℤ/p^N)^q with S_N := O[Δ_N], let Y_{Δ_M}(Q_N) → Y_0(Q_N) be the intermediate covers (0 ≤ M ≤ N). Assuming ConjB(Q_N, ψ, m_{Q_N}) for ψ ∈ {1, χ}, there are perfect complexes D̃_N and D̃^χ_N of finite free S_N-modules (homologically graded) such that: (1) they are concentrated in degrees q_0, …, q_0 + l_0; (2) D̃_N ⊗_{S_N} S_N/𝔪_{S_N} has zero differentials; (3) for every i, n ≥ 1 and 0 ≤ M ≤ N, H_i(D̃_N ⊗_{S_N} S_M/ϖ^n) ≅ e_{Q_N}H_i(Y_{Δ_M}(Q_N), O/ϖ^n)_{m^*} and H_i(D̃^χ_N ⊗_{S_N} S_M/ϖ^n) ≅ e_{Q_N}H_{i,χ^{-1}}(Y_{Δ_M}(Q_N), O/ϖ^n)_{m^*}, as S_N-modules and compatibly with T^an_{Q_N}; (4) D̃_N ⊗_{S_N} O computes e_{Q_N}H_*(Y_0(Q_N))_{m^*}, which B^tw identifies with H_*(Y)_{m^*}.

**Hypotheses and conventions.**

- Conjecture B at Q_N (vanishing and Taylor–Wiles comparison) for ψ = 1 and ψ = χ
- The χ-twisted complex uses the dual local system O(χ^{-1}) (E207)
- The projector e_{Q_N} is the Taylor–Wiles projector for the primes of Q_N (E204)

**Construction or proof.**

1. Chains of the cover Y_1(Q_N) form a perfect complex of O[Δ̃_{Q_N}]-modules quasi-isomorphic to the singular chains (Mumford's lemma; ArithmeticLocallySymmetricSpaces ALS.1/finite-complex-model), and base change along O[Δ̃] → O[Δ_M]/ϖ^n computes the chains of Y_{Δ_M}(Q_N) with O/ϖ^n coefficients (CG18 Lemma 7.1).
2. Each Hecke operator lifts to an endomorphism of this perfect complex (CG18 Lemma 7.2; ALS.3/derived-hecke-action), and for the localizing operator t = ∏_{x∈Q_N}P_x ∘ ∏_{i∈Ω}P_i (P_i separating the other residual Galois representations, P_x the Taylor–Wiles projector) the colimit C_t = lim t^k C is a perfect direct summand computing the localized homology (CG18 Lemma 7.3; IHG.2/localizing-operator-summand, IHG.2/factorial-localizing-idempotent).
3. Over the local ring S_N, Nakayama's lemma for perfect complexes produces a minimal representative D̃_N with zero differentials mod 𝔪_{S_N} and terms of rank dim H_i(Y_0(Q_N), k)_{m^*} (CG18 Lemma 7.4; DeformationAndDerivedPatchingAlgebra P7/minimal-representative).
4. Vanishing outside [q_0, q_0 + l_0] at the residual level (B^van(a) with duality and B^van(b)) bounds the minimal complex to those degrees; B^tw identifies the residual terms with H_*(Y, k)_{m^*}, independent of N.

**Uses.** BT.4/patching-input-data: D^i_N := D̃_N/ϖ^N, reflected to cohomological degrees 0, …, l_0. BT.4/patching-hypotheses-verified: conditions (a)–(c) of the patching theorem.

**API.**

- `BeyondTW.twComplex` (constructor): D̃_N (and D̃^χ_N) as a perfect complex of finite free S_N-modules with a chosen minimal representative.
- `BeyondTW.twComplex_degrees` (characterisation): Terms vanish outside q_0, …, q_0 + l_0.
- `BeyondTW.twComplex_minimal` (characterisation): Differentials vanish mod 𝔪_{S_N}.
- `BeyondTW.twComplex_homology` (equivalence): H_i(D̃_N ⊗ S_M/ϖ^n) ≅ e_{Q_N}H_i(Y_{Δ_M}(Q_N), O/ϖ^n)_{m^*}, Hecke-equivariantly.
- `BeyondTW.twComplex_residual_rank` (characterisation): rank_{S_N} D̃_{N,i} = dim_k H_i(Y, k)_{m^*}.
- `BeyondTW.twComplex_hecke` (structure): T^an_{Q_N,ψ,m} acts on D̃_N in the derived category of S_N-modules, compatibly with (3).

**Unit tests.**

- `twComplex_defect_zero` (degenerate): For l_0 = 0, D̃_N is a single finite free S_N-module in degree q_0 and its coinvariants are H_{q_0}(Y, O)_{m^*}.
- `twComplex_ranks_constant` (characterisation): The ranks of D̃_N do not depend on N (they are residual dimensions at level Y).
- `twComplex_without_vanishing` (non-example): Without B^van(a), the minimal complex can have nonzero terms in degrees below q_0 and its length exceeds l_0, so the codimension count of the patching theorem fails.
- `twComplex_imag_quad_length` (computation): For F imaginary quadratic and n = 2, D̃_N has terms in degrees 1 and 2 only.

**Acceptance.**

- dim_k D̃_{N,i}/𝔪 = dim_k H_i(Y, k)_{m^*} for every N.
- For Q_N = ∅ (N = 0), D̃_0 is a minimal complex over O computing H_*(Y, O)_{m^*}.
- The minimal representative is unique up to (non-unique) isomorphism of complexes.

**Direct prerequisites:** [The Hecke algebras T^an_{Q,ψ} and T_{Q,ψ} (Definition 9.1)](#bt-bt-0-tw-hecke-algebra); [The Taylor–Wiles maximal ideal m_Q and projector e_Q](#bt-bt-0-tw-maximal-ideal-and-projector); [Conjecture B(4): vanishing outside [q_0, q_0 + l_0] and on the boundary (hypothesis)](#bt-bt-2-conj-b-vanishing); [Conjecture B(5): no new cohomology at Taylor–Wiles level (hypothesis)](#bt-bt-2-conj-b-tw-comparison); [Residual independence of the Iwahori character and the dual local system](#bt-bt-0-residual-character-independence); `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`; `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`; `IntegralHeckeAndGaloisDeterminants:IHG.2/localizing-operator-summand`; `IntegralHeckeAndGaloisDeterminants:IHG.2/factorial-localizing-idempotent`; `DeformationAndDerivedPatchingAlgebra:P7/minimal-representative`; `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`.

**Source:** CG18, §7.1, Lemmas 7.1–7.4 and the paragraph after, published pp. 391–395: Perfect O[Δ]-complexes computing the chains of the cover, lifting of Hecke operators, the localizing operator ∏P_x ∘ ∏P_i, and Nakayama's lemma for perfect complexes, with dim D_n/𝔪 = dim H_n(X_0(Q), k)_m. CG18, §9.5, published p. 425: The complexes D̃_N and D̃^χ_N: degrees q_0, …, q_0 + l_0, trivial differentials mod 𝔪_{S_N}, homology the projected homology of Y_{Δ_M}(Q_N) localized at m^* (E204, E207).


<a id="bt-bt-4-patching-input-data"></a>

### The two patching data of the proof of Theorem 9.19

**Target:** `BeyondTW.patchingDatum` (construction); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.4/patching-input-data`; planet: *Patching data for Theorem 9.19*.

Fix q ≥ h¹_{L^⊥,T}(ad⁰r̄(1)) and Taylor–Wiles sets Q_N (N ≥ 1) as in BT.1/numerical-coincidence, and put g = q + |T| − 1 − [F:ℚ]n(n − 1)/2 − l_0, S_∞ := O⟦(ℤ_p)^q⟧, S_N := O[Δ_N], j := n²|T| − 1, O^□ := O⟦z_1, …, z_j⟧. The datum i = 1 (resp. i = 2) consists of: R^1_∞ := R^1_loc⟦x_1, …, x_g⟧ (resp. R^2_∞ := R^χ_loc⟦x_1, …, x_g⟧); (R^1, H^1) := (R_S, H^{q_0}(Y, K/O)^∨_m) (resp. (R^2, H^2) := (R_{S^χ}, H^{q_0}_χ(Y, K/O)^∨_m)), with R^i acting through BT.2/conj-b-type-s-surjection; the complex T of finite-dimensional k-spaces in degrees 0, …, l_0 with T^c = H^{q_0+l_0−c}(Y, k)^∨_m and zero differentials; D^1_N := D̃_N/ϖ^N and D^2_N := D̃^χ_N/ϖ^N regarded as cohomological complexes in degrees 0, …, l_0 by c ↦ q_0 + l_0 − c; and surjections φ^i_N : R^i_∞ ↠ R^□_{S_{Q_N}} ↠ R_{S_{Q_N}} ↠ R^i (resp. with S^χ), where the surjections R^i_∞ ↠ R^□ are chosen so that their reductions mod ϖ agree under R^1_∞/ϖ ≅ R^2_∞/ϖ, using representatives of the universal deformations of type S_{Q_N} and S^χ_{Q_N} that agree mod ϖ.

**Hypotheses and conventions.**

- Double brackets for completed rings throughout (Correction items 1, 12; E12, E205)
- T^c = H^{q_0+l_0−c}, a reflection of degrees, not a shift by q_0 (E208)
- The choice of compatible surjections mod ϖ is needed for the commutative square of the two-datum patching (E209)

**Construction or proof.**

1. R^{□}_{S_{Q_N}} is a quotient of R^1_loc⟦x_1, …, x_g⟧ by BT.1/numerical-coincidence(4); composing with R^□ ≅ R_{S_{Q_N}}⟦z_1, …, z_j⟧ ↠ R_{S_{Q_N}} ↠ R_S gives φ^1_N (BT.1/framing-and-presentation(1)).
2. For i = 2 take the natural map R^χ_loc → R^□_{S^χ_{Q_N}}, which reduces mod ϖ to the i = 1 map, and send each x_i to a lift of the image of x_i mod ϖ; the resulting map is surjective because it is surjective on reduced cotangent spaces (complete Nakayama).
3. D^i_N inherits from D̃_N the identification D^i_N ⊗_{S_N} S_N/𝔪 ≅ T (after reflection), since both have zero differentials and the same residual terms.

**Uses.** BT.4/patching-hypotheses-verified: the input of the two-datum patching theorem. BT.5/patched-complexes: patching the two data.

**API.**

- `BeyondTW.patchingDatum` (constructor): The datum (R^i_∞, R^i, H^i, T, (D^i_N), (φ^i_N)) for i = 1, 2.
- `BeyondTW.patchingDatum.dim` (characterisation): dim R^i_∞ = 1 + q + j − l_0.
- `BeyondTW.patchingDatum.residualComplex` (data): T with T^c = H^{q_0+l_0−c}(Y, k)^∨_m and zero differentials.
- `BeyondTW.patchingDatum.surjection` (data): φ^i_N : R^i_∞ ↠ R^i.
- `BeyondTW.patchingDatum.modVarpi` (relation): The two data agree mod ϖ: R^1_∞/ϖ ≅ R^2_∞/ϖ and φ^1_N ≡ φ^2_N under it.
- `BeyondTW.patchingDatum.top` (projection): H^{l_0}(T) = H^{q_0}(Y, k)^∨_m.

**Unit tests.**

- `patchingDatum_l0_zero` (degenerate): For l_0 = 0 the data have T in degree 0 and dim R^i_∞ = 1 + q + j.
- `patchingDatum_reflection` (computation): For F imaginary quadratic, n = 2 (q_0 = l_0 = 1): T^0 = H^2(Y, k)^∨_m and T^1 = H^1(Y, k)^∨_m.
- `patchingDatum_shift_wrong` (non-example): With T^c = H^{c−l_0}(Y, k)^∨_m as printed, T is zero in degrees 0, …, l_0 − 1 for q_0 ≥ 1 and H^{l_0}(T) ≠ H/ϖ.
- `patchingDatum_incompatible_choice` (non-example): Changing φ^2_N by x_1 ↦ φ^2_N(x_1) + z_1² keeps it surjective but breaks the R^i_∞-equivariance of the comparison mod ϖ (E209's example).

**Acceptance.**

- dim R^i_∞ = 1 + q + j − l_0 (BT.1/numerical-coincidence).
- For l_0 = 0, T is the single space H^{q_0}(Y, k)^∨_m in degree 0 and the data are those of Taylor–Wiles–Kisin module patching.
- R^1_∞/ϖ ≅ R^2_∞/ϖ by BT.1/local-ring-properties(2) and x_i ↦ x_i.

**Direct prerequisites:** [The minimal complexes D̃_N and D̃^χ_N](#bt-bt-4-localized-tw-complexes); [The numerical coincidence (Proposition 8.5)](#bt-bt-1-numerical-coincidence); [Framing and presentation over the local rings (Lemma 8.3, Proposition 8.4)](#bt-bt-1-framing-and-presentation); [Lemma 8.2 in corrected form: the local rings for Ihara avoidance](#bt-bt-1-local-ring-properties); [The local deformation rings R^1_loc and R^χ_loc](#bt-bt-1-cg-local-rings); [The global deformation data S_Q and S^χ_Q](#bt-bt-1-cg-global-deformation-data); [Conjecture B gives R_{S_Q} ↠ T^an_{Q,ψ,m} as O[Δ_Q]-algebras](#bt-bt-2-conj-b-type-s-surjection); `DeformationAndDerivedPatchingAlgebra:R03.5/cyclic-group-ring-quotients`.

**Source:** CG18, §9.5, proof of Theorem 9.19, published pp. 426–427: Lists S_∞, S_N, j = n²|T| − 1, O^□, R^1_∞ = R^1_loc⟦x⟧, R^2_∞ = R^χ_loc⟦x⟧, (R^i, H^i), the complex T, D^i_N = D̃/ϖ^N in degrees 0, …, l_0, and the surjections φ^i_N; corrected by E205 (power series), E208 (reflection of degrees), E209 (compatible choice mod ϖ).


<a id="bt-bt-4-mod-varpi-comparisons"></a>

### Comparisons of the two data modulo ϖ

**Target:** `BeyondTW.patchingDatum_modVarpi` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.4/mod-varpi-comparisons`.

Under ConjB(∅, ψ, m) for ψ = 1, χ: (1) R^1/ϖ = R_S/ϖ ≅ R_{S^χ}/ϖ = R^2/ϖ; (2) H^1/ϖ ≅ H^{q_0}(Y, k)^∨_m ≅ H^{q_0}_χ(Y, k)^∨_m ≅ H^2/ϖ, compatibly with the actions of R^1/ϖ ≅ R^2/ϖ; (3) for M ≥ N ≥ 0 with M ≥ 1, H^{l_0}((D^1_M)^□ ⊗_{S_M} S_N/ϖ) ≅ (e_{Q_M}H^{q_0}(Y_{Δ_N}(Q_M), k)^∨_m)^□ ≅ (e_{Q_M}H^{q_0}_χ(Y_{Δ_N}(Q_M), k)^∨_m)^□ ≅ H^{l_0}((D^2_M)^□ ⊗_{S_M} S_N/ϖ), compatibly with R^1_∞/ϖ ≅ R^2_∞/ϖ and with the reductions N → 0.

**Hypotheses and conventions.**

- B^van(a) at Q = ∅ in degree q_0 − 1 (so that H^{q_0}(Y, K/O)_m[ϖ] = H^{q_0}(Y, k)_m)
- The choices of BT.4/patching-input-data (compatible surjections mod ϖ)

**Construction or proof.**

1. (1) The global deformation problems agree mod ϖ because the local ones do (BT.1/cg-local-rings).
2. (2) The exact sequence 0 → H^{q_0−1}(Y, K/O)_m/ϖ → H^{q_0}(Y, k)_m → H^{q_0}(Y, K/O)_m[ϖ] → 0 and B^van(a) give H^{q_0}(Y, k)_m ≅ H^{q_0}(Y, K/O)_m[ϖ], dual to H^1/ϖ; BT.0/residual-character-independence gives the χ-version; Hecke equivariance and BT.2/conj-b-type-s-surjection give compatibility with R^i/ϖ.
3. (3) is the same argument at Taylor–Wiles level using BT.4/localized-tw-complexes(3); the top-degree cohomology of a complex in degrees 0, …, l_0 commutes with the right exact reductions, which gives compatibility with N → 0 (the hypothesis whose absence E142 records).

**Acceptance.**

- The printed display has H^{l_0}(Y_{Δ_N}(Q_M)) where H^{q_0}, the dual and the projector belong (E210).
- For l_0 = 0, (3) is the usual comparison of patched modules mod ϖ.
- The comparisons are not asserted integrally: H^1 and H^2 differ in general.

**Direct prerequisites:** [The two patching data of the proof of Theorem 9.19](#bt-bt-4-patching-input-data); [The minimal complexes D̃_N and D̃^χ_N](#bt-bt-4-localized-tw-complexes); [Residual independence of the Iwahori character and the dual local system](#bt-bt-0-residual-character-independence); [Conjecture B(4): vanishing outside [q_0, q_0 + l_0] and on the boundary (hypothesis)](#bt-bt-2-conj-b-vanishing); [Conjecture B gives R_{S_Q} ↠ T^an_{Q,ψ,m} as O[Δ_Q]-algebras](#bt-bt-2-conj-b-type-s-surjection); [The local deformation rings R^1_loc and R^χ_loc](#bt-bt-1-cg-local-rings).

**Source:** CG18, §9.5, proof of Theorem 9.19, published pp. 426–427: Natural compatible isomorphisms R^1/ϖ ≅ R^2/ϖ, H^1/ϖ ≅ H^2/ϖ, and the displayed isomorphisms of degree-l_0 cohomology at Taylor–Wiles level (E210 for the corrected display, E142 for compatibility with N → 0).


<a id="bt-bt-4-patching-hypotheses-verified"></a>

### Verification of the hypotheses of the two-datum patching theorem

**Target:** `BeyondTW.patching_hypotheses` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.4/patching-hypotheses-verified`.

For the data of BT.4/patching-input-data, assuming ConjB(Q, ψ, m) for Q = ∅ and Q = Q_N (N ≥ 1), ψ = 1, χ: each datum i satisfies the hypotheses of the Calegari–Geraghty patching theorem (DeformationAndDerivedPatchingAlgebra P8/patched-perfect-complexes-in-a-range-of-degrees, Theorem 6.3 with the corrections E132, E133, E134): dim R^i_∞ = 1 + j + q − l_0; H^i is a nonzero finite R^i-module; (a) D^i_N ⊗ S_N/𝔪 ≅ T; (b) for M ≥ N ≥ 0, M ≥ 1 and 1 ≤ n ≤ M, R^i_∞ acts on H^*((D^i_M)^□ ⊗_{S_M} S_N/ϖ^n), commuting with S^□_M and compatibly with reductions; (c) H^{l_0}((D^i_N)^□ ⊗ O/ϖ^n) ≅ H^i/ϖ^n for 1 ≤ n ≤ N, R^i_∞-linearly through φ^i_N; (d) the image of S^□_M lies in the image of R^i_∞, and the augmentation ideal of S^□_N maps into the image of ker φ^i_M. The comparisons of BT.4/mod-varpi-comparisons supply the additional hypotheses of the two-datum version (CG18 Proposition 6.6 with the compatibility condition of E142).

**Hypotheses and conventions.**

- Conjecture B including clause (6) (E181) and the intermediate levels (sourceIssues E1 of this packet)
- H^1 ≠ 0 because m is in the support of H^{q_0}(Y, k) (E134)

**Construction or proof.**

1. (a) BT.4/localized-tw-complexes (2) and (4) with B^tw.
2. (b) BT.2/conj-b-type-s-surjection at Q_M gives R_{S_{Q_M}} → T^an_{Q_M,ψ,m} acting on the cohomology of every intermediate cover Y_{Δ_N}(Q_M); composing with R^i_∞ ↠ R^□_{S_{Q_M}} ≅ R_{S_{Q_M}}⟦z⟧ gives the R^i_∞-action on the framed cohomology (the printed Q_N is Q_M, E211).
3. (c) holds for n ≤ N by BT.4/localized-tw-complexes(3) and BT.4/mod-varpi-comparisons (the range n ≤ N is E132's correction).
4. (d) clause (6) of Conjecture B identifies the S_M-action (diamond operators) with the inertial characters at Q_M, which lie in the image of R_{S_{Q_M}}; the augmentation ideal of S_N maps to ker(R_{S_{Q_M}} → R_S) (BT.1/cg-global-deformation-data), hence into the image of ker φ^i_M (E133).

**Acceptance.**

- Without clause (6) condition (d) cannot be verified (E181).
- For l_0 = 0 these are the hypotheses of Taylor–Wiles–Kisin module patching.
- The verification does not need B^van at level Q_N beyond its use in BT.4/localized-tw-complexes.

**Direct prerequisites:** [The two patching data of the proof of Theorem 9.19](#bt-bt-4-patching-input-data); [The minimal complexes D̃_N and D̃^χ_N](#bt-bt-4-localized-tw-complexes); [Comparisons of the two data modulo ϖ](#bt-bt-4-mod-varpi-comparisons); [Conjecture B gives R_{S_Q} ↠ T^an_{Q,ψ,m} as O[Δ_Q]-algebras](#bt-bt-2-conj-b-type-s-surjection); [Conjecture B(1)–(3) and the Taylor–Wiles compatibility (6) (hypothesis)](#bt-bt-2-conj-b-local-global); [Conjecture B for a standing datum (the hypothesis bundle)](#bt-bt-2-conjecture-b); [The global deformation data S_Q and S^χ_Q](#bt-bt-1-cg-global-deformation-data); `DeformationAndDerivedPatchingAlgebra:P8/patched-perfect-complexes-in-a-range-of-degrees`.

**Source:** CG18, §9.5, proof of Theorem 9.19, published p. 427: Condition (b) from the action of R_{S_{Q_M}} given by Conjecture B, condition (d) 'follows from Conjecture B', condition (c) 'is clear', and the commutative square of Proposition 6.6 (corrections E132, E133, E181, E209–E211). CG18, §6.1, Theorem 6.3 and Proposition 6.6, published pp. 386–391: The hypotheses (1)–(3) and (a)–(d) of the patching theorem and the extra comparisons of the two-datum version.


## BT.5. Theorem 9.19 and Theorem 5.16

The patched complexes P^{i,□}_∞; near faithfulness on the χ side by depth and irreducibility, transfer to the unipotent side by Taylor's lemma, and descent to R_S: Theorem 9.19; minimal R = T and freeness when the local rings are smooth; cuspidal recognition of the support of H^{q_0}(Y)_m; production of m from hypothesis (8); Theorem 5.16 in corrected form, conditional on Conjecture B; and the specializations to n = 2 over imaginary quadratic and totally real fields. Theorem 5.16 is exported to ModularityAndLanglandsExtensions ML.2 as a conditional endpoint.

**Layer dependencies:** `AutomorphyLiftingBeyondTaylorWiles:BT.4`, `DeformationAndDerivedPatchingAlgebra:P8`, `DeformationAndDerivedPatchingAlgebra:P9`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `AutomorphyLiftingBeyondTaylorWiles:BT.1`, `DeformationAndDerivedPatchingAlgebra:R03.6`, `AutomorphyLiftingBeyondTaylorWiles:BT.2`, `ArithmeticLocallySymmetricSpaces:ALS.4`, `ArithmeticLocallySymmetricSpaces:ALS.5`, `AutomorphicSpectralTheory:AS.5`, `AutomorphicSpectralTheory:AS.4`, `AutomorphicFormsOnReductiveGroups:AF.4`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `ArithmeticGaloisRepresentations:G7`, `AutomorphyLiftingBeyondTaylorWiles:BT.0`, `IntegralHeckeAndGaloisDeterminants:IHG.3`, `PadicHodgeTheory:R06.4`, `AutomorphyLiftingBeyondTaylorWiles:BT.3`.


<a id="bt-bt-5-patched-complexes"></a>

### The patched complexes P^{1,□}_∞ and P^{2,□}_∞

**Target:** `BeyondTW.patched_complexes` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.5/patched-complexes`; planet: *Patched complexes P_∞*.

Under the hypotheses of BT.4/patching-hypotheses-verified there are perfect complexes P^{1,□}_∞, P^{2,□}_∞ of finitely generated S^□_∞-modules (S^□_∞ = S_∞ ⊗̂ O^□), concentrated in degrees 0, …, l_0, such that for i = 1, 2: (i) P^{i,□}_∞ is a projective resolution of minimal length of H^{l_0}(P^{i,□}_∞); (ii) R^i_∞ ⊗̂_O S^□_∞ acts on H^{l_0}(P^{i,□}_∞), extending the S^□_∞-action, and H^{l_0}(P^{i,□}_∞) is a finite R^i_∞-module; (iii) depth_{R^i_∞} H^{l_0}(P^{i,□}_∞) = 1 + j + q − l_0 = dim R^i_∞; (iv) there are a surjection φ^i_∞ : R^i_∞ ↠ R^i and an isomorphism H^{l_0}(P^{i,□}_∞)/𝔞 ≅ H^i of R^i_∞-modules, 𝔞 = ker(S^□_∞ → O), with the image of 𝔞 in End(H^{l_0}(P^{i,□}_∞)) contained in that of ker φ^i_∞. Moreover there is an isomorphism H^{l_0}(P^{1,□}_∞)/ϖ ≅ H^{l_0}(P^{2,□}_∞)/ϖ of R^1_∞/ϖ ≅ R^2_∞/ϖ-modules (linear over (R^i_∞ ⊗̂ S^□_∞)/ϖ) compatible with H^1/ϖ ≅ H^2/ϖ after reduction mod 𝔞.

**Hypotheses and conventions.**

- All hypotheses of the two-datum patching theorem, verified in BT.4/patching-hypotheses-verified
- H^i ≠ 0, so the complexes are not exact (E130, E134)

**Construction or proof.**

1. Apply the Calegari–Geraghty patching construction to each datum (DeformationAndDerivedPatchingAlgebra P8/patched-perfect-complexes-in-a-range-of-degrees): compactness of finite patching data, inverse limit of a compatible tower, the action of R^i_∞ and the augmentation isomorphism.
2. Patch the two data simultaneously, carrying the comparison isomorphisms mod ϖ as part of each finite datum; this two-datum version (CG18 Proposition 6.6 with the compatibility of E142) is requested from DeformationAndDerivedPatchingAlgebra P8.
3. dim_{S^□_∞} H^*(P^{i,□}_∞) = dim_{R^i_∞} ≤ dim R^i_∞ = dim S^□_∞ − l_0, so H^* has codimension ≥ l_0 over the regular ring S^□_∞, and the codimension–amplitude lemma (CG18 Lemma 6.2; DeformationAndDerivedPatchingAlgebra P9/balanced-patched-complex) gives (i) and depth = dim S^□_∞ − l_0, which equals the R^i_∞-depth by the patching depth comparison (R03.5/patching-depth-numerical).

**Acceptance.**

- For l_0 = 0, P^{i,□}_∞ is a single finite free S^□_∞-module (P9/one-degree-specialization).
- H^{l_0}(P^{i,□}_∞) is maximal Cohen–Macaulay over R^i_∞ by (iii).
- The comparison mod ϖ is used only through its top-degree part.

**Direct prerequisites:** [Verification of the hypotheses of the two-datum patching theorem](#bt-bt-4-patching-hypotheses-verified); [Comparisons of the two data modulo ϖ](#bt-bt-4-mod-varpi-comparisons); `DeformationAndDerivedPatchingAlgebra:P8/patched-perfect-complexes-in-a-range-of-degrees`; `DeformationAndDerivedPatchingAlgebra:P9/balanced-patched-complex`; `DeformationAndDerivedPatchingAlgebra:P9/balanced-depth`; `DeformationAndDerivedPatchingAlgebra:R03.5/patching-depth-numerical`; `DeformationAndDerivedPatchingAlgebra:P8`.

**Source:** CG18, §6.1, Theorem 6.3 and its proof, Proposition 6.6, published pp. 386–391: The patched complex P_∞ with conclusions (i)–(iv), and the two-datum refinement whose proof is omitted (E142 adds the compatibility hypothesis needed for the square). CG18, §9.5, proof of Theorem 9.19, published p. 428: Proposition 6.6 yields P^{1,□}_∞ and P^{2,□}_∞.


<a id="bt-bt-5-chi-side-nearly-faithful"></a>

### Near faithfulness on the χ side

**Target:** `BeyondTW.chi_side_nearlyFaithful` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.5/chi-side-nearly-faithful`.

In the situation of BT.5/patched-complexes, H^{l_0}(P^{2,□}_∞) is a nearly faithful R^2_∞-module, and H^{l_0}(P^{1,□}_∞)/ϖ ≅ H^{l_0}(P^{2,□}_∞)/ϖ is nearly faithful over R^1_∞/ϖ ≅ R^2_∞/ϖ.

**Hypotheses and conventions.**

- Spec R^2_∞ = Spec R^χ_loc⟦x_1, …, x_g⟧ irreducible (BT.1/local-ring-properties(3))
- R^2_∞ need not be shown p-torsion free: the argument uses depth = dimension (E165)

**Construction or proof.**

1. By BT.5/patched-complexes(iii), H^{l_0}(P^{2,□}_∞) is a nonzero finite R^2_∞-module of depth dim R^2_∞.
2. A finite module of maximal depth over a Noetherian local ring with irreducible spectrum is nearly faithful (Taylor's Lemma 2.3; DeformationAndDerivedPatchingAlgebra R03.6/maximal-cm-nearly-faithful-irreducible).
3. Near faithfulness passes to the quotient by ϖ (R03.6/nearly-faithful-quotient), and the isomorphism of BT.5/patched-complexes transports it.

**Acceptance.**

- The printed proof cites Theorem 6.4, which assumes p-torsion freeness; the corrected route uses Theorem 6.3(iii) and Taylor's Lemma 2.3 (E165).
- If R_triv = ∅ the two sides coincide and this step is not needed.
- Near faithfulness is a statement about reduced supports: it gives no integral R = T.

**Direct prerequisites:** [The patched complexes P^{1,□}_∞ and P^{2,□}_∞](#bt-bt-5-patched-complexes); [Lemma 8.2 in corrected form: the local rings for Ihara avoidance](#bt-bt-1-local-ring-properties); `DeformationAndDerivedPatchingAlgebra:R03.6/maximal-cm-nearly-faithful-irreducible`; `DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-quotient`; `DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful`.

**Source:** CG18, §9.5, proof of Theorem 9.19, published p. 428: By Lemma 8.2 Spec R^2_∞ is irreducible, hence by Theorem 6.4 H^{l_0}(P^{2,□}_∞) is nearly faithful; so H^{l_0}(P^{1,□}_∞)/ϖ is nearly faithful over R^1_∞/ϖ (rerouted through depth by E165).


<a id="bt-bt-5-unipotent-side-nearly-faithful"></a>

### Transfer to the unipotent side and descent to R_S

**Target:** `BeyondTW.unipotent_side_nearlyFaithful` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.5/unipotent-side-nearly-faithful`.

In the situation of BT.5/patched-complexes, H^{l_0}(P^{1,□}_∞) is p-torsion free and nearly faithful over R^1_∞, and H^1 = H^{q_0}(Y, K/O)^∨_m is nearly faithful over R^1 = R_S.

**Hypotheses and conventions.**

- R^1_∞ equidimensional with minimal primes of characteristic 0, catenary, and each prime minimal over ϖ contains a unique minimal prime (BT.1/local-ring-properties(1), (4))

**Construction or proof.**

1. Depth = dimension (BT.5/patched-complexes(iii)) forces every associated prime of H^{l_0}(P^{1,□}_∞) to be a minimal prime of R^1_∞ (R03.6/maximal-depth-annihilator-primes-top-dimensional); these have characteristic 0, so ϖ is a nonzerodivisor on the module.
2. Taylor's Lemma 2.2: a finite module on which ϖ is regular and whose reduction mod ϖ is nearly faithful is nearly faithful, under the stated hypotheses on R^1_∞ (R03.6/nearly-faithful-lift-from-special-fibre), applied with BT.5/chi-side-nearly-faithful.
3. Conclusion (iv) of BT.5/patched-complexes and the radical comparison transfer near faithfulness from H^{l_0}(P^{1,□}_∞) over R^1_∞ to H^1 over R^1 (R03.6/patching-nearly-faithful-descends).

**Acceptance.**

- The transfer uses only characteristic-0 minimal primes of R^1_∞, which survives the correction of Lemma 8.2 (E165).
- Catenarity holds since R^1_∞ is a quotient of a power series ring over O.
- The conclusion is near faithfulness, not faithfulness.

**Direct prerequisites:** [The patched complexes P^{1,□}_∞ and P^{2,□}_∞](#bt-bt-5-patched-complexes); [Near faithfulness on the χ side](#bt-bt-5-chi-side-nearly-faithful); [Lemma 8.2 in corrected form: the local rings for Ihara avoidance](#bt-bt-1-local-ring-properties); `DeformationAndDerivedPatchingAlgebra:R03.6/maximal-depth-annihilator-primes-top-dimensional`; `DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-lift-from-special-fibre`; `DeformationAndDerivedPatchingAlgebra:R03.6/patching-nearly-faithful-descends`.

**Source:** CG18, §9.5, proof of Theorem 9.19, published p. 428: Associated primes of H^{l_0}(P^{1,□}_∞) are minimal primes of R^1_∞, of characteristic 0 by Lemma 8.2, so the module is p-torsion free and Taylor's [11, Lemma 2.2] applies; conclusion (iv) gives near faithfulness of H^1 over R_S.


<a id="bt-bt-5-theorem-9-19"></a>

### Theorem 9.19: near faithfulness of H^{q_0}(Y, K/O)^∨_m over R_S

**Target:** `BeyondTW.theorem_9_19` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.5/theorem-9-19`; planet: *Theorem 9.19 (near faithfulness)*.

Let (F, n, p, O, r̄, ξ = ε^{n(n−1)/2}, R = R_triv ⊔ R_reg, χ) be a standing datum (BT.1/ihara-avoidance-data) with r̄(G_{F(ζ_p)}) big and F(ad⁰r̄) ∌ ζ_p. Let m be a maximal ideal of T = T_{∅,1} at level K_∅(R) with r̄_m ≅ r̄. Fix q ≥ h¹_{L^⊥,T}(ad⁰r̄(1)) and Taylor–Wiles sets Q_N (N ≥ 1) as in BT.1/numerical-coincidence, and assume ConjB(Q, ψ, m) (BT.2/conjecture-b, including clause (6) and intermediate levels) for Q = ∅ and Q = Q_N, ψ = 1 and ψ = χ. Then H^{q_0}(Y, K/O)^∨_m, regarded as an R_S-module through R_S ↠ T_m, is nearly faithful.

**Hypotheses and conventions.**

- Corrected standing hypotheses: R splits into R_triv (r̄|G_v trivial, Ihara avoidance) and R_reg (single unipotent Jordan block), N(v) ≡ 1 mod p on R (E169, E203)
- Conjecture B with the Taylor–Wiles compatibility clause (6) (E181) and at intermediate levels (E1 of this packet)
- r̄(G_{F(ζ_p)}) big (E126)

**Construction or proof.**

1. BT.2/conj-b-type-s-surjection gives R_S ↠ T_m and R_{S^χ} ↠ T_{χ,m}.
2. BT.4/patching-input-data and BT.4/patching-hypotheses-verified set up and verify the two patching data.
3. BT.5/patched-complexes produces P^{1,□}_∞, P^{2,□}_∞; BT.5/chi-side-nearly-faithful and BT.5/unipotent-side-nearly-faithful conclude.

**Acceptance.**

- For F = ℚ, n = 2, l_0 = 0 and R_triv = ∅, this is the minimal R = T theorem of Taylor–Wiles (with freeness by BT.5/minimal-r-equals-t).
- For F imaginary quadratic and n = 2 it is conditional on Conjecture B, with B^tw supplied by Lemma 9.6.
- Near faithfulness says Spec T_m = Spec R_S on reduced spectra.

**Direct prerequisites:** [Transfer to the unipotent side and descent to R_S](#bt-bt-5-unipotent-side-nearly-faithful); [Near faithfulness on the χ side](#bt-bt-5-chi-side-nearly-faithful); [The patched complexes P^{1,□}_∞ and P^{2,□}_∞](#bt-bt-5-patched-complexes); [Verification of the hypotheses of the two-datum patching theorem](#bt-bt-4-patching-hypotheses-verified); [The two patching data of the proof of Theorem 9.19](#bt-bt-4-patching-input-data); [Conjecture B gives R_{S_Q} ↠ T^an_{Q,ψ,m} as O[Δ_Q]-algebras](#bt-bt-2-conj-b-type-s-surjection); [Conjecture B for a standing datum (the hypothesis bundle)](#bt-bt-2-conjecture-b); [The numerical coincidence (Proposition 8.5)](#bt-bt-1-numerical-coincidence); [Standing residual data with an Ihara-avoidance set](#bt-bt-1-ihara-avoidance-data).

**Source:** CG18, §9.5, Theorem 9.19 and proof, published pp. 424–428: Under the standing hypotheses of §9.5 (a maximal ideal m of T = T_{∅,1} with r̄_m ≅ r̄, bigness, Taylor–Wiles sets satisfying Proposition 8.5, Conjecture B for each Q_N), H^{q_0}(Y, K/O)^∨_m is a nearly faithful R_S-module. CGH20, §4, arXiv pp. 7–8: Theorem 1.2 is deduced from CG18 Theorems 5.16 and 6.4.


<a id="bt-bt-5-minimal-r-equals-t"></a>

### Minimal R = T and freeness when the local rings are smooth

**Target:** `BeyondTW.minimal_R_eq_T` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.5/minimal-r-equals-t`; planet: *Minimal R = T*.

In the situation of BT.5/theorem-9-19 suppose moreover R_triv = ∅ (every v ∈ R has r̄(σ_v) a single unipotent Jordan block, or R = ∅). Then R_S → T_m is an isomorphism and H^{q_0}(Y, K/O)^∨_m is a free R_S-module; only the datum ψ = 1 is used, and Conjecture B is needed only for ψ = 1.

**Hypotheses and conventions.**

- R_triv = ∅, so R^1_loc is formally smooth over O (BT.1/cg-local-rings)
- Conjecture B for Q = ∅ and Q = Q_N with ψ = 1

**Construction or proof.**

1. R^1_∞ = R^1_loc⟦x_1, …, x_g⟧ is a power series ring over O, hence regular and p-torsion free.
2. Patching the single datum i = 1 (BT.5/patched-complexes for one datum) gives H^{l_0}(P^{1,□}_∞) of depth dim R^1_∞, hence free by Auslander–Buchsbaum (R03.6/patching-free-conclusion).
3. Freeness and conclusion (iv) give ker φ_∞ = ı(𝔞)R^1_∞ and H^1 free over R_S (R03.6/patching-kernel-equals-ideal, R03.6/patched-module-r-equals-t); since R_S acts on H^1 through T_m, R_S ≅ T_m (R03.6/r-equals-t-of-free).

**Acceptance.**

- This is the form used by CGH20 Theorem 1.2 (A.2), where the bad places have a single unipotent block and no congruence on N(v) is imposed; CGH20 normalizes det r = ε^{n(1−n)/2}, so the node applies to r^∨, which has the same adjoint representation.
- Then T_m is a complete intersection.
- If R_triv ≠ ∅ only near faithfulness is obtained.

**Direct prerequisites:** [The patched complexes P^{1,□}_∞ and P^{2,□}_∞](#bt-bt-5-patched-complexes); [The local deformation rings R^1_loc and R^χ_loc](#bt-bt-1-cg-local-rings); [Lifts satisfying the hypotheses of Theorem 5.16 have type S](#bt-bt-1-lift-has-type-s); `DeformationAndDerivedPatchingAlgebra:R03.6/patching-free-conclusion`; `DeformationAndDerivedPatchingAlgebra:R03.6/patching-kernel-equals-ideal`; `DeformationAndDerivedPatchingAlgebra:R03.6/patched-module-r-equals-t`; `DeformationAndDerivedPatchingAlgebra:R03.6/r-equals-t-of-free`.

**Source:** CG18, §6.1, Theorem 6.4(1) and proof, published p. 389: If R_∞ is formally smooth then H is a free R-module, by Auslander–Buchsbaum and the augmentation isomorphism. CGH20, §4, arXiv pp. 7–8: R ≅ T is obtained from CG18 Theorems 5.16 and 6.4 because the local deformation rings (minimal at the Steinberg places, Fontaine–Laffaille at p) are formally smooth.


<a id="bt-bt-5-cuspidal-recognition"></a>

### Cuspidal recognition of the support of H^{q_0}(Y)_m

**Target:** `BeyondTW.cuspidal_recognition` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.5/cuspidal-recognition`; planet: *Cuspidal recognition*.

Let m be a maximal ideal of T at level K_∅(R) at which B^gal and B^van hold for Q = ∅, ψ = 1, with r̄_m absolutely irreducible and r̄_m(G_{F(ζ_p)}) big. Fix ι : Q̄_p ≅ ℂ. If f : T_m → Q̄_p is an O-algebra map such that the f-eigenspace of H^{q_0}(Y, Q̄_p)_m is nonzero, then there is a cuspidal automorphic representation π of GL_n(𝔸_F) with trivial central character and trivial infinitesimal character at every archimedean place, with (π^∞)^{K_∅(R)} ≠ 0, whose unnormalized Hecke eigenvalues are ι f(T_{λ,i}) for every λ ∉ S.

**Hypotheses and conventions.**

- Boundary vanishing B^van(b) at m
- Bigness of r̄_m(G_{F(ζ_p)}) (CHT Definition 2.5.1), used to exclude residual eigensystems
- Eisenstein (non-discrete) eigensystems of H^*(Y, ℂ) occur in boundary cohomology: requested from AutomorphicSpectralTheory AS.5

**Construction or proof.**

1. B^van(b) with coefficients K (universal coefficients from O/ϖ^m) gives H^*(∂Y, K)_m = 0, so H^{q_0}(Y, ℂ)_m consists of interior classes (ALS.4/boundary-triangle).
2. The f-eigenclass is realized by an isobaric automorphic representation Π from a summand of the Franke–Schwermer decomposition (AutomorphicSpectralTheory AS.5/isobaric-realization; ALS.5/automorphic-comparison).
3. If Π comes from a non-discrete (Eisenstein) contribution, its eigensystem occurs in H^*(∂Y, ℂ) (requested from AS.5), contradicting the first step. If Π is residual, the Moeglin–Waldspurger classification (requested from AS.4) gives Π = Speh(σ, k) with k ≥ 2.
4. In the residual case, at every λ ∉ S with N(λ) ≡ 1 mod p the Hecke polynomial of Π_λ is a product ∏_{j<k}P_σ(N(λ)^{−j}cX) whose roots reduce mod ϖ with multiplicity ≥ k; by Chebotarev (Tau Ceti Chebotarev layer 10) every element of r̄_m(G_{F(ζ_p)}) is some r̄_m(Frob_λ) with N(λ) ≡ 1 mod p, contradicting bigness, which provides an element with a simple eigenvalue.
5. Hence Π = π is cuspidal; trivial coefficients give trivial infinitesimal character, and π_∞ is tempered by Clozel's purity lemma (AF.4/clozel-purity), consistent with degree q_0 (AF.4/borel-wallach-tempered-range).

**Acceptance.**

- For F = ℚ and n = 2 this is the statement that non-Eisenstein classes in H^1 of a modular curve come from cusp forms.
- Without bigness, a Speh(σ, 2) eigensystem is not excluded by this argument.
- The passage from a point of R_S to π is not written in the source (it says Theorem 5.16 follows immediately from Theorem 9.19; E3 of this packet).

**Direct prerequisites:** [Conjecture B, residual and integral Galois representations (hypothesis)](#bt-bt-2-conj-b-galois-type); [Conjecture B(4): vanishing outside [q_0, q_0 + l_0] and on the boundary (hypothesis)](#bt-bt-2-conj-b-vanishing); `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`; `ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison`; `AutomorphicSpectralTheory:AS.5/isobaric-realization`; `AutomorphicSpectralTheory:AS.5`; `AutomorphicSpectralTheory:AS.4`; `AutomorphicFormsOnReductiveGroups:AF.4/clozel-purity`; `AutomorphicFormsOnReductiveGroups:AF.4/borel-wallach-tempered-range`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; `ArithmeticGaloisRepresentations:G7`.

**Source:** CG18, Theorem 5.16 and the sentence after it, published pp. 383–384: Modularity means a regular algebraic cusp form π with trivial infinitesimal character and L(r, s) = L(π, s); the deduction from Theorem 9.19 is not written. CG18, §9.3, Conjecture B(4)(b), published p. 414: Boundary vanishing after localization, the input the brief names for passing to a cuspidal π. CGH20, §3.1, proof of Lemma 3.1, arXiv p. 5: Eigenclasses in cohomology are realized by isobaric automorphic representations (Franke's Theorem 2.3); a class outside the tempered range [q_0, q_0 + l_0] forces the representation to be non-tempered (Borel–Wallach and Clozel's Lemma 3.14), which strong multiplicity one then contradicts.


<a id="bt-bt-5-maximal-ideal-from-hypothesis-8"></a>

### The maximal ideal m from hypothesis (8)

**Target:** `BeyondTW.maximalIdeal_of_hyp8` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.5/maximal-ideal-from-hypothesis-8`.

Let r̄ be the residual representation of a standing datum. (a) If π_0 is a cuspidal automorphic representation of GL_n(𝔸_F) with trivial central character and trivial infinitesimal character, unramified at every v | p and outside S, with π_{0,v}^{Iw(v)} ≠ 0 for v ∈ R, whose unnormalized Hecke eigenvalues at λ ∉ S (after ι : ℂ ≅ Q̄_p) are integral and reduce to the coefficients of the characteristic polynomial of r̄(Frob_λ) in the convention of BT.2/conj-b-galois-type, then there is a maximal ideal m of T at level K_∅(R) with H^{q_0}(Y, k)_m ≠ 0 and r̄_m ≅ r̄ (given B^gal at m). (b) If r̄ is Serre modular of minimal level and R = R(r̄), such an m exists by definition (BT.0/serre-modular-minimal-level).

**Hypotheses and conventions.**

- (a) uses Clozel's purity lemma and the Borel–Wallach range to place π_0 in cuspidal cohomology in degree q_0
- Uniqueness of r̄_m is Chebotarev with Brauer–Nesbitt

**Construction or proof.**

1. π_{0,∞} is tempered and cohomological for the trivial coefficient system (AF.4/clozel-purity, AF.4/borel-wallach-tempered-range), so π_0 contributes to H^{q_0}_cusp(Y(K_∅(R)), ℂ) (ALS.5/cuspidal-cohomology), since (π_0^∞)^{K_∅(R)} ≠ 0.
2. T acts on the finite O-module H^{q_0}(Y, O) and its eigensystem on the π_0-part is integral; reduction gives a maximal ideal m in the support of H^{q_0}(Y, O), hence of H^{q_0}(Y, k) by Nakayama and universal coefficients.
3. The Hecke polynomials at m are the reductions of those of π_0, i.e. the characteristic polynomials of r̄(Frob_λ); so r̄_m ≅ r̄ by IHG.3/galois-type-maximal-ideal (uniqueness).
4. (b) is the definition.

**Acceptance.**

- In (a) the paper's hypothesis that the p-adic representation r_p(π_0) exists and satisfies condition (6) is replaced by the eigenvalue congruence and Iwahori-sphericity at R, which make sense over every number field (E2 of this packet).
- For F totally real or CM, (a) follows from the paper's form through the Galois representations attached to π_0 and local–global compatibility at ℓ ≠ p.
- The ideal m depends only on r̄, not on π_0.

**Direct prerequisites:** [Serre modular of minimal level](#bt-bt-0-serre-modular-minimal-level); [The Hecke algebras T^an_{Q,ψ} and T_{Q,ψ} (Definition 9.1)](#bt-bt-0-tw-hecke-algebra); [Conjecture B, residual and integral Galois representations (hypothesis)](#bt-bt-2-conj-b-galois-type); `AutomorphicFormsOnReductiveGroups:AF.4/clozel-purity`; `AutomorphicFormsOnReductiveGroups:AF.4/borel-wallach-tempered-range`; `ArithmeticLocallySymmetricSpaces:ALS.5/cuspidal-cohomology`; `IntegralHeckeAndGaloisDeterminants:IHG.3/galois-type-maximal-ideal`.

**Source:** CG18, Theorem 5.16(8a)–(8b), published pp. 383–384: Either a cuspidal π_0 with trivial infinitesimal character, good reduction at p and r_p(π_0) residually r̄ satisfying condition (6), or r̄ Serre modular of minimal level with r ramified only where r̄ is. CG18, §9.5, published p. 425: The proof assumes a maximal ideal m of T = T_{∅,1} with r̄_m ≅ r̄; producing m from (8a) or (8b) is left to the reader (brief, item thm-5-16).


<a id="bt-bt-5-theorem-5-16"></a>

### Theorem 5.16: conditional modularity lifting for GL_n over any number field

**Target:** `BeyondTW.theorem_5_16` (theorem); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.5/theorem-5-16`; planet: *Theorem 5.16 (conditional automorphy lifting)*.

Assume Conjecture B for F (BT.2/conjecture-b, with clause (6) and intermediate levels). Let F be a number field, n ≥ 2, p > n a prime unramified in F, O as in BT.1/ihara-avoidance-data, and r : G_F → GL_n(O) continuous and unramified outside a finite set, with reduction r̄. Suppose: (1) r|G_v is crystalline for v | p; (2) for v | p, gr^i(r ⊗_{ℤ_p} B_dR)^{G_v} is free of rank one over O ⊗_{ℤ_p} F_v for i ∈ {0, …, n − 1} and zero otherwise; (3) r̄|G_{F(ζ_p)} is absolutely irreducible and F(ad⁰r̄) ∌ ζ_p; (4) r̄(G_{F(ζ_p)}) is big (CHT Definition 2.5.1); (5) r is odd at every real place; (6′) for every finite place x ∤ p at which r (or, in case (8a), π_0) is ramified: r|I_x is unipotent, and either r̄|G_x is trivial and N(x) ≡ 1 mod p, or r̄|I_x is unipotent with r̄(σ_x) a single Jordan block; (7) det r = ε^{n(n−1)/2}; (8) either (a) there is π_0 as in BT.5/maximal-ideal-from-hypothesis-8(a) for R the set of places in (6′), or (b) r̄ is Serre modular of minimal level and r is ramified only at places where r̄ is ramified. Then r is modular: there is a cuspidal automorphic representation π of GL_n(𝔸_F) with trivial central character and trivial infinitesimal character such that, for every finite place λ ∤ p outside the set R of places in (6′), π_λ is unramified and the characteristic polynomial of r(Frob_λ) (arithmetic Frobenius) is Σ_i (−1)^i N(λ)^{i(i−1)/2} t_{λ,i}(π) X^{n−i}, t_{λ,i}(π) the unnormalized Hecke eigenvalues of π_λ; equivalently, with arithmetic Frobenius in the Euler factors of L(r, s), L^S(r, s) = L^S(π, s − (n − 1)/2) for S = S_p ∪ R.

**Hypotheses and conventions.**

- (6′) corrects the printed (6) and (8a) (E125, E169; E2 of this packet): where r̄ is unramified it adds that r̄|G_x is trivial (Taylor's Ihara avoidance), where r̄ is ramified it asks for a single Jordan block (the minimally ramified ring), and it keeps the printed proviso that N(x) ≡ 1 mod p is needed only where r̄ is unramified; the deletion of that proviso proposed in E203 is not needed once the ramified places of r̄ use the minimally ramified ring
- (4) is bigness of r̄(G_{F(ζ_p)}) (E126)
- Conjecture B is a hypothesis; for n = 2 its condition (5) holds by Lemma 9.6

**Construction or proof.**

1. Put R := the places of (6′), R_triv := those with r̄|G_x trivial, R_reg := the rest. By (1)–(3), (5)–(7) and Fontaine–Laffaille theory (p > n, F unramified at p), (F, n, p, O, r̄, ξ = ε^{n(n−1)/2}, R, χ) is a standing datum for any choice of χ (BT.1/ihara-avoidance-data); in case (8b), R = R(r̄).
2. BT.5/maximal-ideal-from-hypothesis-8 gives m with r̄_m ≅ r̄ at level K_∅(R).
3. BT.1/numerical-coincidence gives Taylor–Wiles sets Q_N; BT.5/theorem-9-19 gives near faithfulness of H := H^{q_0}(Y, K/O)^∨_m over R_S.
4. By BT.1/lift-has-type-s, r gives x_r : R_S → O; near faithfulness puts ker x_r in Supp_{R_S} H, so H ⊗_{R_S,x_r} K ≠ 0. Pontryagin duality and B^van(a) identify H ⊗ K with the K-dual of H^{q_0}(Y, K)_m, so the eigensystem x_r of T_m occurs in H^{q_0}(Y, K)_m.
5. BT.5/cuspidal-recognition turns this eigensystem into a cuspidal π; Chebotarev and the Hecke polynomial convention (IHG.3/gln-hecke-polynomial) give the stated equality of characteristic polynomials and of partial L-functions.

**Acceptance.**

- For n = 2 and F imaginary quadratic, Conjecture B(5) is Lemma 9.6 (BT.3/lemma-9-6) and (4)(a) is BT.2/conj-b-small-rank(1).
- For F = ℚ and n = 2 the theorem is unconditional and is the Taylor–Wiles/Taylor Ihara-avoidance modularity lifting theorem in weight two at Fontaine–Laffaille primes.
- The theorem is exported to ModularityAndLanglandsExtensions ML.2 as a conditional endpoint, through CG18 Theorem 1.1 (potential modularity of elliptic curves over any number field, assuming Conjecture B).

**Direct prerequisites:** [Theorem 9.19: near faithfulness of H^{q_0}(Y, K/O)^∨_m over R_S](#bt-bt-5-theorem-9-19); [The maximal ideal m from hypothesis (8)](#bt-bt-5-maximal-ideal-from-hypothesis-8); [Cuspidal recognition of the support of H^{q_0}(Y)_m](#bt-bt-5-cuspidal-recognition); [Lifts satisfying the hypotheses of Theorem 5.16 have type S](#bt-bt-1-lift-has-type-s); [The numerical coincidence (Proposition 8.5)](#bt-bt-1-numerical-coincidence); [Standing residual data with an Ihara-avoidance set](#bt-bt-1-ihara-avoidance-data); [Conjecture B(4): vanishing outside [q_0, q_0 + l_0] and on the boundary (hypothesis)](#bt-bt-2-conj-b-vanishing); [Conjecture B for a standing datum (the hypothesis bundle)](#bt-bt-2-conjecture-b); `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`; `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Source:** CG18, Theorem 5.16, published pp. 383–384: Assume Conjecture B; r crystalline with Hodge–Tate weights 0, …, n − 1, residually absolutely irreducible over F(ζ_p) with F(ad⁰r̄) ∌ ζ_p, big, odd, unipotently ramified, determinant ε^{n(n−1)/2}, and (8a) or (8b); then r is modular. Corrected by E125, E126, E169, E203. CG18, §9.5, opening, published p. 424: Theorem 5.16 follows from Theorem 9.19 (the deduction is written here).


<a id="bt-bt-5-imaginary-quadratic-case"></a>

### The case n = 2 over an imaginary quadratic field

**Target:** `BeyondTW.imagQuad_case` (application); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.5/imaginary-quadratic-case`.

Let F be imaginary quadratic and n = 2, so l_0 = 1, q_0 = 1 and dim Y = 3. Then Theorem 5.16 holds assuming only the clauses B^gal, B^lgc and B^van(b) of Conjecture B at the relevant levels: B^tw holds by Lemma 9.6 and B^van(a) by BT.2/conj-b-small-rank(1). The resulting statement is the GL_2 conditional modularity lifting over imaginary quadratic fields in the form of CG18 Theorems 1.2–1.3 and 5.11 (there under Conjecture A), now with Ihara avoidance at places where r̄ is trivial.

**Hypotheses and conventions.**

- Hypotheses of BT.5/theorem-5-16 with n = 2
- Conjecture A of CG18 §5.3 is the n = 2 analogue of B^gal and B^lgc in homological normalization

**Construction or proof.**

1. Specialize BT.5/theorem-5-16, replacing B^tw by BT.3/lemma-9-6 and B^van(a) by BT.2/conj-b-small-rank(1).
2. The complexes D̃_N have length one (degrees 1, 2), and the patched module H^{l_0}(P_∞) is balanced of codimension one.

**Acceptance.**

- l_0 = 1 for PGL_2 over an imaginary quadratic field.
- For a non-CM elliptic curve over F with r̄ satisfying the hypotheses, the conclusion is modularity by a cuspidal cohomological π of PGL_2(𝔸_F), the statement whose unconditional proof (via degree shifting and local–global compatibility) is Caraiani–Newton's.
- For F = ℚ(√−1) and n = 2: |T| = |S_p| + |R| with |S_p| = 2 if p ≡ 1 mod 4 and 1 if p ≡ 3 mod 4, and g = q + |T| − 4 (the suggested file checks twVariables 3 1 2 2 1 = 0).

**Direct prerequisites:** [Theorem 5.16: conditional modularity lifting for GL_n over any number field](#bt-bt-5-theorem-5-16); [Lemma 9.6: condition (5) of Conjecture B for n = 2](#bt-bt-3-lemma-9-6); [Conjecture B(4)(a) in small rank (Remark 9.3)](#bt-bt-2-conj-b-small-rank).

**Source:** CG18, §5, Theorems 1.2, 1.3 and 5.11, published pp. 299–300, 377–380: Minimal modularity lifting for PGL_2 over imaginary quadratic fields assuming Conjecture A, with l_0 = 1. CG18, §9.3, Lemma 9.6, published p. 416: Condition (5) holds for n = 2.


<a id="bt-bt-5-defect-zero-case"></a>

### Defect zero: n = 2 over a totally real field

**Target:** `BeyondTW.defectZero_case` (application); packet node `AutomorphyLiftingBeyondTaylorWiles:BT.5/defect-zero-case`.

Let F be totally real and n = 2, so l_0 = 0 and q_0 = [F:ℚ]. Then the complexes D̃_N are single free S_N-modules, the patching is module patching, and Theorem 5.16 is the weight-two Fontaine–Laffaille automorphy lifting theorem for Hilbert modular forms (with Ihara avoidance at places where r̄ is trivial), conditional on Conjecture B for the Betti cohomology of Hilbert modular varieties in middle degree.

**Hypotheses and conventions.**

- Hypotheses of BT.5/theorem-5-16 with n = 2 and F totally real; r is totally odd by (5)

**Construction or proof.**

1. l_0 = r_1⌊1/2⌋ + r_2 = 0 and 2q_0 = 2[F:ℚ] = dim Y (AF.4/l0-q0-invariants).
2. With l_0 = 0, BT.5/patched-complexes reduces to a single free module (P9/one-degree-specialization) and the argument is Taylor–Wiles–Kisin's, with Taylor's Ihara avoidance on the χ side.

**Acceptance.**

- g = q + |T| − 1 − [F:ℚ].
- For F = ℚ, Y is a modular curve, q_0 = 1, and Conjecture B holds at non-Eisenstein m.
- The numerical coincidence dim R_∞ = dim S_∞ holds exactly (no defect).

**Direct prerequisites:** [Theorem 5.16: conditional modularity lifting for GL_n over any number field](#bt-bt-5-theorem-5-16); `AutomorphicFormsOnReductiveGroups:AF.4/l0-q0-invariants`; `DeformationAndDerivedPatchingAlgebra:P9/one-degree-specialization`.

**Source:** CG18, §8.1, published p. 401: In defect l_0 = 0 the method is the usual Taylor–Wiles–Kisin method; the dimension of R_∞ is l_0 less than in the classical case only when l_0 > 0. CG18, §8.4, published pp. 405–406: The formula for l_0 gives 0 for n = 2 over totally real fields.


## Requests to other roadmaps

Each request names the owning layer and the exact statement this roadmap uses; the consuming nodes cite the layer until the owner plans the statement.

- **GlobalGaloisDeformations:R04.5** — Rank-n Taylor–Wiles primes under bigness, in the form of CHT Proposition 2.5.9 adapted to unpolarized GL_n with fixed determinant ξ (CG18 Proposition 8.5(1)–(3), pp. 410–411): for a number field F, p > n, r̄ : G_F → GL_n(k) absolutely irreducible with r̄(G_{F(ζ_p)}) big and F(ad⁰r̄) ∌ ζ_p, a finite set T of places containing S_p, local conditions L_v at T, and q ≥ h¹_{L^⊥,T}(G_F, ad⁰r̄(1)), for every N ≥ 1 a set Q of q places disjoint from T with N(x) ≡ 1 mod p^N, r̄|G_x = s̄_x ⊕ ψ̄_x with ψ̄_x a one-dimensional generalized Frobenius eigenspace, and H¹_{L(Q)^⊥,T}(G_F, ad⁰r̄(1)) = 0 for the Taylor–Wiles local conditions of LocalGaloisDeformationRings R08.2/taylor-wiles-local-tangent at Q. Needed by: [The numerical coincidence (Proposition 8.5)](#bt-bt-1-numerical-coincidence).
- **ArithmeticGaloisRepresentations:G7** — The big-subgroup condition of CHT Definition 2.5.1 for H ⊂ GL_n(k) (no nontrivial p-power quotient; H⁰ and H¹ of H with coefficients in ad⁰ vanish; every irreducible k[H]-submodule W of gl_n contains, for some h ∈ H with a simple eigenvalue α, an element with nonzero trace against the α-eigenprojector of h), with its invariance under extension of k and the consequence that a big subgroup contains an element with a simple eigenvalue. Needed by: [The numerical coincidence (Proposition 8.5)](#bt-bt-1-numerical-coincidence), [Cuspidal recognition of the support of H^{q_0}(Y)_m](#bt-bt-5-cuspidal-recognition).
- **DeformationAndDerivedPatchingAlgebra:R03.3** — BLGHT (Calabi–Yau II) Lemma 3.3 in C_O: completed tensor products over O of complete local O-algebras that are equidimensional with characteristic-0 minimal primes are equidimensional of dimension the sum of relative dimensions plus one, with characteristic-0 minimal primes; after enlarging O so that components are geometrically irreducible, the irreducible components of the tensor product are the products of components, and the property 'each prime minimal over ϖ contains a unique minimal prime' is preserved. Needed by: [Lemma 8.2 in corrected form: the local rings for Ihara avoidance](#bt-bt-1-local-ring-properties).
- **DeformationAndDerivedPatchingAlgebra:P8** — The two-datum version of P8/patched-perfect-complexes-in-a-range-of-degrees (CG18 Proposition 6.6, pp. 390–391) with the compatibility hypothesis recorded in PAPER-CALEGARI-GERAGHTY-18 E142: given two data satisfying the hypotheses of that node, with R^1_∞/ϖ ≅ R^2_∞/ϖ, R^1/ϖ ≅ R^2/ϖ, H^1/ϖ ≅ H^2/ϖ and, for M ≥ N ≥ 0, isomorphisms of top-degree cohomology H^{l_0}(D^1_M ⊗ S_N/ϖ) ≅ H^{l_0}(D^2_M ⊗ S_N/ϖ) that become R_∞ ⊗ S^□_N/ϖ-linear after framing and reduce for N → 0 to the given comparison with H/ϖ, the patched complexes carry an isomorphism H^{l_0}(P^1_∞)/ϖ ≅ H^{l_0}(P^2_∞)/ϖ linear over (R_∞ ⊗̂ S^□_∞)/ϖ and compatible with H^1/ϖ ≅ H^2/ϖ modulo 𝔞. Needed by: [The patched complexes P^{1,□}_∞ and P^{2,□}_∞](#bt-bt-5-patched-complexes).
- **AutomorphicSpectralTheory:AS.5** — For Res_{F/ℚ}PGL_n over any number field and trivial (or algebraic) coefficients: a Hecke eigensystem of H^*(Y(K), ℂ) whose Franke–Schwermer realization (AS.5/isobaric-realization) comes from a summand with cuspidal support {P} ≠ {G} either occurs in H^*(∂Y(K), ℂ) or is the eigensystem of a residual (discrete-spectrum) automorphic representation. Needed by: [Cuspidal recognition of the support of H^{q_0}(Y)_m](#bt-bt-5-cuspidal-recognition).
- **AutomorphicSpectralTheory:AS.4** — The Moeglin–Waldspurger description of the residual spectrum of GL_n over a number field: every residual discrete automorphic representation is Speh(σ, k) for k | n, k ≥ 2, σ cuspidal on GL_{n/k}, with unramified local components having Satake parameters {s_i q^{(k−1)/2 − j}} (the existing node AS.4/yu-020 treats the everywhere-unramified function-field case). Needed by: [Cuspidal recognition of the support of H^{q_0}(Y)_m](#bt-bt-5-cuspidal-recognition).
- **tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev** — Chebotarev density for finite Galois extensions, used to realize elements of r̄(G_{F(ζ_p)}) as Frobenius elements at primes λ ≡ 1 mod p and to compare characteristic polynomials. Needed by: [Cuspidal recognition of the support of H^{q_0}(Y)_m](#bt-bt-5-cuspidal-recognition), [Theorem 5.16: conditional modularity lifting for GL_n over any number field](#bt-bt-5-theorem-5-16), [The case GL_1: defect l_0 = r_1 + r_2 − 1 and class field theory](#bt-bt-1-gl1-defect-example).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors** — The local Artin map Art_v with its normalization (uniformizers to arithmetic Frobenius), used to transport inertial characters to Iwahori characters and diamond operators. Needed by: [Conjecture B(1)–(3) and the Taylor–Wiles compatibility (6) (hypothesis)](#bt-bt-2-conj-b-local-global).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity** — Global Artin reciprocity for the GL_1 example (ray class groups and the Hecke action on H^0). Needed by: [The case GL_1: defect l_0 = r_1 + r_2 − 1 and class field theory](#bt-bt-1-gl1-defect-example).

## Recorded gaps

- **Distinct-eigenvalue comparison for the Res_{F/ℚ}PGL_n quotients.** PAPER-CALEGARI-GERAGHTY-20 routes to this roadmap the comparison H^i(Y_0(Q), k)_{m_α} ≅ H^i(Y, k)_m for the Res_{F/ℚ}PGL_n quotients of CG18 §9, at sets Q of primes with N(x) ≡ 1 mod p and distinct eigenvalues of r̄(Frob_x) (CGH20 Theorem 3.2 = A.4, proof). CG18 §9.4 proves the analogue for GL_n arithmetic quotients under local–global compatibility at x (BT.3/distinct-eigenvalue-comparison) and only says that the PGL_n case should follow; Khare–Thorne Lemma 6.25(4), which CGH20 also cites, concerns GL_n over CM fields at Iwahori level and ordinary completed cohomology (sourceIssues E4). Two routes are open: rerun §9.4 for smooth PGL_n(F_x)-modules (GL_n(F_x)-modules with trivial central character) with the block theory of SmoothRepresentationsOfLocalGroups SR.5 and the derived comparison for the images of GL_n(O_x) and U_0(x) in PGL_n(F_x); or compare the GL_n and PGL_n cohomologies through the central torus fibrations (E194 of PAPER-CALEGARI-GERAGHTY-18) by a Leray argument after localization at a non-Eisenstein m. Neither is in the sources. The end theorems of this roadmap do not use it, because B^tw is a hypothesis of Theorem 9.19; its consumer is AdjointSelmerGroupsFromModularityLifting (CGH20 Theorem A.4). Needed by: [No new cohomology at primes with distinct Frobenius eigenvalues (§9.4)](#bt-bt-3-distinct-eigenvalue-comparison).

## Corrections of the sources used here

The statements above use the corrected forms of the source. The corrections that change a statement are recorded in the extraction `research/blueprint/papers/PAPER-CALEGARI-GERAGHTY-18.result.json` (cited as E-numbers there) and, for the four found in planning and review, in this roadmap's packet:

- **E1** (gap; §9.5, proof of Theorem 9.19, published p. 427 (verification of condition (b)); Definition 9.1, p. 413). In our words: the proof says Conjecture B provides an action of the deformation ring on the cohomology of the intermediate covers Y_{Δ_N}(Q_M), but Definition 9.1 and Conjecture B concern only the Hecke algebra of Y_1(Q). Correction: Either define T^an_{Q,ψ} on the direct sum of the cohomology of every level between L_Q and K_Q and state Conjecture B for that algebra (the choice made in BT.0/tw-hecke-algebra), or patch derived Hecke algebras with nilpotent error ideals as in ACC+ §6 (DeformationAndDerivedPatchingAlgebra P8/finite-level-patching-data). Reason: An operator killing every H^k(Y_1(Q), O/ϖ^m) acts on H^k(Y_{Δ}(Q), O/ϖ^m) through the Hochschild–Serre spectral sequence H^i(Δ′, H^j(Y_1(Q))) ⇒ H^{i+j}(Y_Δ(Q)) (Δ′ = ker(Δ̃ → Δ) of p-power order), hence only nilpotently in general; the surjection R_{S_Q} ↠ T^an_{Q,ψ,m} then gives no action on the intermediate cohomology.
- **E2** (gap; Theorem 5.16(8a), published p. 383). In our words: hypothesis (8a) refers to the p-adic Galois representation of the cuspidal π_0 and asks that it be residually r̄ and satisfy condition (6). Correction: Over an arbitrary number field the existence of such a Galois representation is not known; state (8a) through the Hecke eigenvalue congruence between π_0 and r̄ and Iwahori-sphericity of π_0 at the places where it ramifies (BT.5/maximal-ideal-from-hypothesis-8), which is all the proof uses. Reason: The proof of Theorem 9.19 needs only a maximal ideal m with r̄_m ≅ r̄ at Iwahori level; Galois representations attached to cohomological cuspidal π are known for F totally real or CM, not for general F.
- **E3** (gap; Theorem 5.16 and the sentence after it, published pp. 383–384; §9.5, opening, p. 424). In our words: the source says Theorem 5.16 follows immediately from Theorem 9.19 and gives no argument for producing m, checking that r is of type S, or passing from near faithfulness to a cuspidal π; it also writes L(r, s) = L(π, s) without specifying the normalization. Correction: Write the deduction (BT.5/theorem-5-16): produce m, check that r is of type S, use near faithfulness to place the eigensystem of r in H^{q_0}(Y, K)_m, and recognise it as cuspidal using boundary vanishing, the Franke–Schwermer realization and bigness to exclude residual Speh eigensystems (BT.5/cuspidal-recognition). The equality of L-functions holds for partial L-functions, with arithmetic Frobenius in the Euler factors of L(r, s) and the shift L^S(r, s) = L^S(π, s − (n − 1)/2). Reason: Boundary vanishing alone does not exclude residual discrete-spectrum eigensystems in interior cohomology; the bigness argument is needed for that step.
- **E4** (gap; CGH20, §3.1, proof of Theorem 3.2, arXiv v1 p. 6 (published appendix §A.3.1, proof of Theorem A.4, p. 886)). In our words: for the PGL_n arithmetic quotients Y, Y_0(Q) of CG18 §9 and the lowest degree i in which vanishing fails, the proof identifies H^i(Y_0(Q), k)_{m_α} with H^i(Y, k)_m by citing CG18 §9.4 and Khare–Thorne Lemma 6.25(4). Correction: Both cited results are GL_n statements: CG18 §9.4 is announced as an informal approach for GL_n, with the passage to PGL_n left as an expectation, and Khare–Thorne Lemma 6.25(4) concerns GL_n over CM fields, Iwahori level at the auxiliary prime and ordinary completed cohomology. The comparison for the PGL_n quotients at line-stabilizer level needs its own argument (see the gap of this packet); until then Theorem 3.2 should either be stated for GL_n quotients or take the comparison as a hypothesis. Reason: Read CG18 §9.4 (published pp. 419–424, arXiv v2 TeX) and Khare–Thorne arXiv:1409.7007v2 §6.6 (Lemma 6.25 and Proposition 6.26, pp. 40–42): the latter fixes G = GL_n, the Iwahori subgroup B at w and the ordinary complexes F^•_m over Λ. No version for Res_{F/ℚ}PGL_n or for the parahoric U_0(x) is stated in either source.

The extraction's corrections used most often: E180 (unnormalized T_{λ,i} in Conjecture B), E181 (Taylor–Wiles compatibility of diamond operators), E165 and E169 (Lemma 8.2: characteristic-0 minimal primes instead of p-torsion freeness, and r̄|G_v trivial at the Ihara-avoidance places), E203 (Theorem 5.16 hypotheses; its deletion of the N(x) ≡ 1 proviso is not needed here, see BT.5/theorem-5-16), E164 (oddness as balanced eigenspaces), E168 (the characters χ_v live on k_v^×), E189 (U_{x²} acts on H^*(G) by N(x)^{-2}), E208–E211 (indices and degrees in the proof of Theorem 9.19), E142 (compatibility in Proposition 6.6), E229 (Lemma 9.6 at m̃).


## Structure

- **rescope** (AutomorphyLiftingBeyondTaylorWiles, GL2ModularityLiftingDefectOne, GL2ModularityLiftingPositiveDefect). The extraction PAPER-IYENGAR-KHARE-MANNING-24 proposes GL2ModularityLiftingPositiveDefect with Conjectures A–D for PGL_2 over number fields, and PAPER-CALEGARI-GERAGHTY-18 proposes GL2ModularityLiftingDefectOne with CG18 Conjecture A; these are the n = 2 specializations of the Conjecture B predicates planned here in BT.2. When those roadmaps are designed, they import the hypothesis predicates BT.2/conj-b-galois-type, conj-b-local-global, conj-b-vanishing and conj-b-tw-comparison at n = 2 (with the homological normalization of Conjecture A recorded as a comparison) and Lemma 9.6 from BT.3, rather than stating them again; the defect-one GL_2 theory (weight one, Bianchi forms) stays with them.

## Sources

- **CG18**: Frank Calegari and David Geraghty, *Modularity lifting beyond the Taylor–Wiles method*, Inventiones mathematicae 211 (2018), 297–433, DOI 10.1007/s00222-017-0749-x; published layout, author-hosted copy (137 pp., created 27 July 2017); Correction, Invent. Math. 227 (2022), 855–856. <http://www.math.uchicago.edu/~fcale/papers/CG.pdf>. Read: Part 2: Theorem 5.16 and remarks, pp. 383–384; §6 (Lemmas 6.1–6.2, Theorems 6.3–6.4, Remark 6.5, Proposition 6.6), pp. 384–391; §7.1 (Lemmas 7.1–7.4 and the localizing operator), pp. 391–395; §8.1–8.6 (outline, GL_1 case, l_0 and q_0, deformation rings, Lemma 8.2, Lemma 8.3, Propositions 8.4–8.5), pp. 401–411; §9 (arithmetic quotients, Hecke operators, Definition 9.1, Conjecture B, Remarks 9.2–9.5, Lemma 9.6, Remarks 9.7–9.8, §9.4, §9.5 and Theorem 9.19), pp. 411–428; §10 (proof of Theorem 1.1), pp. 428–429; the source issues recorded for these pages in research/blueprint/papers/PAPER-CALEGARI-GERAGHTY-18.result.json (E12, E125–E126, E130, E132–E134, E142, E165, E169, E176, E180–E214, E229).
- **CG18v2**: Frank Calegari and David Geraghty, *Modularity lifting beyond the Taylor–Wiles method (arXiv version)*, arXiv:1207.4224v2 (16 July 2017), the accepted version; §9 subsections numbered 9.1–9.3 there for published 9.3–9.5. <https://arxiv.org/abs/1207.4224v2>. Read: Table of contents and §9 section numbering, compared with the published version for locators.
- **CGH20**: Frank Calegari, David Geraghty and Michael Harris, *Bloch–Kato conjectures for automorphic motives (published as the appendix to Calegari–Geraghty, Modularity lifting for non-regular symplectic representations, Duke Math. J. 169 (2020), pp. 881–889)*, arXiv:1907.08694v1 (19 July 2019); statement numbers of the arXiv version (Theorem 1.2 = published A.2, Lemma 3.1 = A.3, Theorem 3.2 = A.4). <https://arxiv.org/abs/1907.08694v1>. Read: §1, Theorems 1.1–1.2 and the discussion of Conjecture B, pp. 1–3; §3.1, Lemma 3.1 and Theorem 3.2, pp. 4–6; §4, proofs, pp. 7–8.
- **KT17**: Chandrashekhar B. Khare and Jack A. Thorne, *Potential automorphy and the Leopoldt conjecture*, arXiv:1409.7007v2 (6 July 2016). <https://arxiv.org/abs/1409.7007v2>. Read: §6.6, Lemma 6.25 and Proposition 6.26, arXiv pp. 40–42 (read for the review, to check the citation in CGH20 Theorem 3.2).
