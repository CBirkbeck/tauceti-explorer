# Roadmap: weight and level optimisation of residual modular representations

Blueprint for the atlas roadmap `SerreWeightAndLevelOptimisation` (job
`BP-SerreWeightAndLevelOptimisation`). This document is definitive; the packet
`research/blueprint/packets/SerreWeightAndLevelOptimisation.json` is its machine-readable form
and `research/blueprint/suggested/SerreWeightAndLevelOptimisation.lean` suggests Lean forms.

The roadmap starts from a **particular modular residual representation** and optimises its
level and weight. It does not prove residual modularity, and it does not reconstruct the local
weight recipe. In the words of the restructuring that governs it, it keeps "conditional
level/weight optimisation of an already modular residual representation, with exact source
hypotheses and dyadic exceptions".

## Standing hypotheses and conventions

- `ℓ` is the residual characteristic; `F` is a finite field of characteristic `ℓ`; `ρ̄` is a
  continuous, odd, irreducible representation `Gal(Q̄/Q) → GL(2, F)`.
- `p` denotes a prime different from `ℓ` unless the dyadic layer says otherwise, where `p = 2`
  is the point.
- `v` is a fixed place above `ℓ` of the field of algebraic numbers, and `λ` the induced place
  of a coefficient field; "congruent" means congruent modulo `v`, or modulo `λ` once a
  coefficient field is fixed.
- `Γ₀(N)` is written where the sources write `Γ_o(N)`.
- `N(ρ̄)` is the prime-to-`ℓ` Serre level, a full Artin conductor **with its exponents**. It is
  never the radical of itself, and the `ℓ`-part of a level is never part of it.
- `𝕋` is always the *integral* Hecke algebra; an integral cuspidal module is always a lattice
  on the modular-symbol or homology side, never inside a space of forms.
- Every theorem below carries its hypotheses explicitly. There is no blanket "strong Serre"
  abbreviation: a consumer chooses an entry whose hypotheses it has proved.

## The pinned libraries: what is consumed

Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Both pins were read directly (8482 and 5477 `.lean`
files, 246008 and 70802 indexed declarations).

No layer of this roadmap has an entry in the reviewed library audit `data/library-coverage.json`,
which covers 1316 atlas stages. The plan/import boundary below was therefore established by
searching the pinned trees and reading the statements, not read off an audit.

**Consumed from Tau Ceti.** The characteristic-zero newform theory: the old and new subspaces
and their complementarity, the level-raising (degeneracy) operator, normalised newforms and the
complex multiplicity-one statement on the new subspace.

**Not present, hence planned here.** Level lowering in every form, Mazur's principle, the Serre
level as an Artin conductor, congruence modules, integral saturation, and the mod 2 theory.
Searching for these under several descriptions returns nothing in either library.

Three searches gave a false clean before being corrected, and they are recorded because a
reviewer repeating this work will meet them:

| search | result | what it actually means |
|---|---|---|
| `HeckeAlgebra`, `HeckeOperator` | 0, 0 | `Hecke` returns **1186** declarations; the theory is there under other names |
| `newSpace`, `oldSpace` | 0, 0 | the subspaces exist as `TauCeti.cuspFormsNew` and `TauCeti.cuspFormsOld` |
| `characterGroup` | 47 | all of them the character group of a **split torus**, not the character group of the toric part of a Jacobian's bad fibre, which is the notion R20.2 needs |

## The build, in layers

### R20.1 — Level-changing algebra and cohomology

This layer owns the **integral** algebra that every level-lowering argument below consumes, and
it owns only that. The distinction is the whole point of the layer, and it is worth stating
sharply because the pinned libraries make it easy to miss.

Tau Ceti already has the old/new decomposition of cusp forms. At the pinned commit
`f790474`, `TauCeti.cuspFormsOld` and `TauCeti.cuspFormsNew` are `Submodule ℂ` of the space of
cusp forms, the new subspace being the Petersson-orthogonal complement of the old, and
`TauCeti.isCompl_cuspFormsOld_cuspFormsNew` proves they are complements — Diamond–Shurman
(5.20). That is a direct sum **over ℂ**, obtained from an archimedean inner product. It says
nothing about `ℓ`-torsion, about saturation, or about which residual eigensystems survive a
change of level, because after inverting `ℓ` every one of those questions is vacuous.

So the analytic decomposition is imported and the integral theory is planned. The integral
Hecke module itself is also imported, from the ModularForms anchor's Layer 8, which builds the
finitely generated integral Hecke module of modular symbols and proves the integrality and
commutativity of the Hecke action on it. Note that layer's deliberate design: the lattice sits
on the **modular-symbol** side, and no lattice inside the space of forms is ever constructed.
This roadmap respects that — every integral module below is a symbol or homology lattice.

**Conventions pinned here.** `𝕋` always denotes the *integral* Hecke algebra, never its
`ℂ`-algebra; `H` always denotes an integral cuspidal module on the symbol/homology side;
`T n` for `n` prime to the removed prime `p` is the operator asserted to act compatibly, and
`U p` at the removed prime is not claimed to. "New" at `p` means the cokernel of the
degeneracy pair, defined integrally, and its agreement with the complex notion is a theorem
(recorded as an acceptance test), not a definition.

**Coverage status: `partial`.**

#### `R20.1/integral-old-new-exact-sequence` — The integral old/new exact sequence of Hecke modules at a prime exactly dividing the level

*theorem*

Let M be prime to p and let H denote the integral cuspidal Hecke module of level Mp that this layer imports rather than builds. It is a lattice on the modular-symbol and homology side, not a lattice inside a space of forms: the Tau Ceti ModularForms roadmap builds its finitely generated integral Hecke module as the Γ₁(N)-coinvariants of Div⁰(ℙ¹(ℚ)) ⊗ Sym^{k-2}(ℤ²) and states explicitly that no lattice inside the space of forms is ever constructed, so H must be taken on that side and its Hecke action is the integral action on symbols. Write α, β : H → H_M for the two degeneracy maps to level M and ι : H_M ⊕ H_M → H for their transpose. Then there is an exact sequence of modules over the integral Hecke algebra 𝕋 of level Mp, 0 → H_M ⊕ H_M → H → H^{p-new} → 0, in which H^{p-new} is defined as the cokernel, the maps are 𝕋-equivariant for the Hecke operators T_n with n prime to p, and the sequence need not split. Its cokernel and the torsion of ι are what distinguish this statement from the complex decomposition S_k(Γ₁(N)) = old ⊕ new, which is a direct sum over ℂ and therefore carries no information about ℓ-torsion or saturation.

**Hypotheses.**
- M prime to p
- H the integral cuspidal Hecke module of level Mp, with its 𝕋-action
- α, β the two degeneracy maps to level M

**Construction or proof, in steps.**
1. Construct ι = (α^∨, β^∨) : H_M ⊕ H_M → H from the two degeneracy maps, and check 𝕋-equivariance for T_n with (n,p) = 1 on the nose, recording that T_p and U_p act differently on the two levels.
2. Define H^{p-new} as coker ι, so that right-exactness holds by construction.
3. Prove left-exactness, i.e. that ι is injective: this is the integral input and is where the complex statement gives nothing. Compare with the Petersson-orthogonal complement over ℂ only after tensoring with ℂ.
4. Identify the failure of the sequence to split with a congruence-module invariant, and record it rather than suppressing it.
5. Tensor with ℂ and check that the resulting decomposition agrees with the library's `isCompl_cuspFormsOld_cuspFormsNew`, which is the compatibility that pins the definition of H^{p-new} down.

**Acceptance tests.**
- After ⊗ℂ the sequence recovers the library's complex old/new complement, so the two notions of 'new' agree in characteristic zero.
- The sequence is not required to split, and an implementation that produces a splitting over ℤ is wrong.
- The Hecke operators T_n with n prime to p act compatibly on all three terms.
- For M = 1 the left-hand term is H₁ ⊕ H₁ at level 1, which vanishes in weight two, so H = H^{p-new}.

**Dependencies.**
- On other roadmaps, by stage id: `ModularCurvesPartII:R14.2`, `ModularCurvesPartII:R14.3`
- On the pinned libraries: `tauceti:TauCeti.isCompl_cuspFormsOld_cuspFormsNew`, `tauceti:TauCeti.cuspFormsOld`, `tauceti:TauCeti.cuspFormsNew`, `tauceti:TauCeti.ModularForm.levelRaise`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §6, opening paragraph, Character groups and component groups. The source's own description of the integral objects the level-lowering proofs run on: the component groups and character groups attached to bad reductions of ordinary modular curves and Shimura curves, and the relation of [41, Theorem 4.3].

#### `R20.1/congruence-module` — The congruence module of a residual eigensystem at a level

*definition* · planet **Congruence module**

Let 𝕋 be the integral Hecke algebra acting on the integral cuspidal module H of level N, and let m ⊆ 𝕋 be the maximal ideal cut out by a residual eigensystem with residue characteristic ℓ. Let 𝕋 → 𝕆 be the quotient by the minimal prime attached to a chosen characteristic-zero lift, with complementary quotient 𝕋 → 𝕆'. The congruence module of the eigensystem is C = 𝕆 / (image of the annihilator of 𝕆'), equivalently 𝕆 ⊗_𝕋 𝕆'. It is a finite 𝕆-module supported at ℓ, and it measures exactly the congruences between the chosen lift and the complementary eigensystems: C = 0 if and only if the lift is congruent to no other eigensystem modulo ℓ.

**Hypotheses.**
- 𝕋 the integral Hecke algebra on H, of finite rank over ℤ
- m a maximal ideal of residue characteristic ℓ
- a chosen minimal prime of 𝕋 contained in m, giving 𝕆

**Construction or proof, in steps.**
1. Localise 𝕋 at m; the localisation is a complete local ring, finite flat over ℤ_ℓ after completion.
2. Split off the chosen minimal prime to get 𝕋 → 𝕆 and the complementary quotient 𝕋 → 𝕆'.
3. Define C = 𝕆 ⊗_𝕋 𝕆' and check it is finite: it is a quotient of 𝕆 by a nonzero ideal, and 𝕆 has finite rank.
4. Show C is supported at ℓ: after inverting ℓ the two quotients become products of distinct number-field factors, so the tensor product vanishes.
5. Verify the vanishing criterion: C = 0 exactly when the idempotent cutting out 𝕆 already lies in 𝕋, i.e. when no congruence holds.

**API.**

| name | role | statement |
|---|---|---|
| `congruenceModule` | constructor | congruenceModule 𝕋 m 𝕆 : Type, the module 𝕆 ⊗_𝕋 𝕆'. |
| `congruenceModule_finite` | structure | congruenceModule is a finite module. |
| `congruenceModule_eq_zero_iff` | characterisation | congruenceModule = 0 ↔ the idempotent cutting out 𝕆 lies in 𝕋_m, i.e. no congruence with a complementary eigensystem. |
| `congruenceModule_isTorsion_ell` | structure | congruenceModule is ℓ-power torsion. |
| `congruenceModule_conj_invariant` | functoriality | congruenceModule is invariant under replacing the chosen lift by a Galois conjugate. |

**Unit tests.** A wrong definition fails one of these.

- `congruenceModule.test_zero` (degenerate) — For 𝕋_m a DVR with a unique eigensystem in its residue class, congruenceModule = 0.
- `congruenceModule.test_finite` (computation) — congruenceModule is finite of ℓ-power order.
- `congruenceModule.test_nonzero` (non-example) — At a level where two eigensystems are congruent mod ℓ, congruenceModule ≠ 0; a definition always returning 0 fails this.

**Where it is used.**
- `SerreWeightAndLevelOptimisation:R20.2/mazur-principle` — The descent step is controlled by the congruence module of the residual eigensystem: the eigensystem descends when the relevant congruence invariant vanishes.
- `SerreWeightAndLevelOptimisation:R20.2/level-lowering-unramified-prime` — Theorem 1.5 avoids a multiplicity-one hypothesis by arguing with the congruence and monodromy pairings instead.
- `SerreWeightAndLevelOptimisation:R20.1/eigensystem-level-descent` — Saturation of the eigensystem ideal is stated in terms of the congruence module being trivial at the relevant prime.

**Acceptance tests.**
- C = 0 when 𝕋_m is a discrete valuation ring and the eigensystem is the only one in its residue class.
- C is finite and ℓ-power order.
- Enlarging the level so that a second eigensystem becomes congruent makes C nonzero.
- C is unchanged by replacing the lift by a Galois conjugate.

**Dependencies.**
- Inside this roadmap: `R20.1/integral-old-new-exact-sequence`
- On other roadmaps, by stage id: `ModularCurvesPartII:R14.2`, `AlgebraicModularFormsAndSerreWeights:R15.5`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §7, opening of the proof of Theorem 1.5. The setting of the proof that consumes this definition: ℓ ≥ 3, ρ irreducible arising from a weight-two eigenform on Γ₀(Mp) with p prime to ℓM and ρ unramified at p.

#### `R20.1/eigensystem-level-descent` — Saturation and controlled-level passage between characteristic-zero and residual eigensystems

*theorem*

Let H be the integral cuspidal module of level N with Hecke algebra 𝕋, and let λ : 𝕋 → F be a residual eigensystem with maximal ideal m = ker λ of residue characteristic ℓ. Then: (i) λ lifts to a characteristic-zero eigensystem 𝕋 → 𝕆 with 𝕆 a finite flat ℤ_ℓ-algebra, and the set of such lifts is in bijection with the minimal primes of 𝕋_m; (ii) the 𝕋-submodule H[m] is nonzero, and its F-dimension is 1 exactly when multiplicity one holds at m; (iii) if S ⊆ H is the 𝕋-submodule generated by the image of the degeneracy maps from a level N' ∣ N, then λ factors through level N' if and only if the saturation of S at m contains an m-torsion element, and this criterion is stable under the base change ℤ → ℤ_ℓ. In particular a residual eigensystem survives removing a prime from the level exactly when the corresponding saturated submodule is not ℓ-divisible, a condition invisible to the complex old/new decomposition.

**Hypotheses.**
- H integral cuspidal of level N, 𝕋 its integral Hecke algebra
- λ : 𝕋 → F a residual eigensystem, m = ker λ, residue characteristic ℓ
- N' ∣ N and the degeneracy maps from level N'

**Construction or proof, in steps.**
1. For (i): 𝕋_m is a complete local ring finite flat over ℤ_ℓ after completion, so it has finitely many minimal primes and each gives a characteristic-zero eigensystem reducing to λ.
2. For (ii): H[m] ≠ 0 because H is a faithful 𝕋-module of finite rank and m is maximal; the dimension statement is the definition of multiplicity one at m, which must be hypothesised and not assumed.
3. For (iii): pass to the saturation S^{sat} = {x ∈ H : cx ∈ S for some nonzero integer c} and note S^{sat}/S is finite; the factorisation criterion is then a statement about the m-torsion of H/S^{sat}.
4. Check base-change stability: saturation commutes with ℤ → ℤ_ℓ because localisation is flat, so the criterion may be checked ℓ-adically. This is the module and base-change hypothesis that the shared lifting lemma requires to be verified before use.
5. Record explicitly that tensoring with ℂ destroys the criterion, so the complex decomposition cannot be substituted.

**Acceptance tests.**
- H[m] ≠ 0 for every maximal ideal m of 𝕋 in the support of H.
- The set of characteristic-zero lifts of λ is finite and nonempty.
- Saturation is idempotent: (S^{sat})^{sat} = S^{sat}.
- The descent criterion is unchanged by replacing ℤ with ℤ_ℓ.
- Over ℂ the criterion becomes vacuous, since every subspace is saturated; an implementation that reduces to the ℂ statement is wrong.

**Dependencies.**
- Inside this roadmap: `R20.1/integral-old-new-exact-sequence`, `R20.1/congruence-module`
- On other roadmaps, by stage id: `ModularCurvesPartII:R14.4`, `AlgebraicModularFormsAndSerreWeights:R15.5`
- On the pinned libraries: `tauceti:HeckeRing.GL2.cuspFormsNewEigenspace`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §7, opening of the proof of Theorem 1.5. The proof whose first move is to pass between the residual eigensystem and a characteristic-zero eigenform at a controlled level, which is what this node states.

**Remaining in this layer.**
- Nodes for the localisation statements at the maximal ideal beyond the saturation criterion recorded here, and for the explicit comparison of the integral Hecke algebra of level Mp with that of level M.
- The R14.4 Ihara theorem is cited through a request rather than a node; its exact statement must be pinned before the old/new sequence's injectivity step can be closed.
- The shared eigenvalue-lifting lemma of AlgebraicModularFormsAndSerreWeights:R15.5 is used via a request; RS-06 requires its module and base-change hypotheses to be checked, which is stated in the saturation node but not yet discharged against that layer's statement.

### R20.2 — Lowering level away from p

This is the mathematical core, and RS-06 keeps it whole: Mazur's principle, the Ribet and
Diamond level-lowering statements, the higher-exponent cases, the wild and bad-fibre geometry,
and the coefficient fields are all proof obligations here.

The organising requirement is the one RS-06 states: **the iteration must reach the prime-to-`ℓ`
Artin conductor, not merely its radical.** That is why the layer begins by defining the Serre
level as a full Artin conductor with exponents, and why the descent theorem's content is
*termination at* `N(ρ̄)` rather than termination as such. A descent that strips each bad prime
once and stops has proved something strictly weaker, and the unit test
`serreLevel.test_not_radical` is there to catch exactly that error.

**Conventions pinned here.** `ℓ` is the residual characteristic throughout and `p` is a prime
distinct from `ℓ`; `N(ρ̄)` is prime to `ℓ` by construction, so the `ℓ`-part of a level is never
the business of this layer (it is R20.4's). `Γ₀` is written for what the source writes `Γ_o`.
Hypotheses are carried explicitly and never absorbed into a blanket "strong Serre" abbreviation:
a consumer must choose an entry whose hypotheses it has proved.

**One hypothesis is sharper than the headline statement.** Mazur's Principle is stated at
`ℓ ≥ 5` in the source, but the source also says that the proof it gives in §8 requires only
that `ℓ` be odd and does not exclude `ℓ = 3`. The node states the weight-two case for `ℓ` odd,
and an implementation that carries `ℓ ≥ 5` there has imported a hypothesis the proof does not
need.

**Coverage status: `partial`.**

#### `R20.2/serre-level` — The prime-to-ℓ Serre level N(ρ̄) as a full Artin conductor

*definition* · planet **Serre level N(ρ̄)**

Let ℓ be a prime, F a finite field of characteristic ℓ and ρ̄ : Gal(Q̄/Q) → GL(2,F) continuous, odd and irreducible. For each prime p ≠ ℓ let n_p(ρ̄) be the exponent at p of the Artin conductor of ρ̄, that is n_p(ρ̄) = Σ_{i≥0} (1/[G_0 : G_i]) · dim_F(V / V^{G_i}), where V = F² with its ρ̄-action, G_i is the i-th higher ramification subgroup of a decomposition group at p in its upper numbering, and V^{G_i} is the subspace of G_i-invariants. The Serre level is N(ρ̄) = ∏_{p ≠ ℓ} p^{n_p(ρ̄)}. It is prime to ℓ by construction. The tame case n_p(ρ̄) = dim_F(V/V^{I_p}) occurs exactly when the wild inertia at p acts trivially; in general n_p(ρ̄) may exceed that value, so N(ρ̄) is not determined by its radical.

**Hypotheses.**
- ℓ prime, F finite of characteristic ℓ
- ρ̄ continuous, odd, irreducible
- p ranges over primes different from ℓ

**Construction or proof, in steps.**
1. Fix a decomposition group D_p ⊆ Gal(Q̄/Q) at p and its inertia subgroup I_p = G_0, with the higher ramification subgroups G_i in the upper numbering.
2. The action of ρ̄ on V = F² factors, on inertia, through a finite quotient, so all but finitely many G_i act trivially and the sum defining n_p(ρ̄) is finite.
3. Each term (1/[G_0 : G_i]) · dim_F(V/V^{G_i}) is the usual local contribution to the Artin conductor; the sum is a non-negative integer by the Artin conductor's integrality.
4. Independence of the choice of D_p: two decomposition groups at p are conjugate, and conjugation permutes the G_i compatibly while preserving dimensions of invariants.
5. Set N(ρ̄) = ∏_{p≠ℓ} p^{n_p(ρ̄)}; the product is finite because ρ̄ is ramified at only finitely many primes.
6. Record the tame comparison: if G_1 acts trivially then every i ≥ 1 term vanishes and n_p(ρ̄) = dim_F(V/V^{I_p}) ∈ {0,1,2}.

**API.**

| name | role | statement |
|---|---|---|
| `serreLevel` | constructor | serreLevel ℓ ρ̄ : ℕ, the product ∏_{p≠ℓ} p^{n_p(ρ̄)}. |
| `serreLevel_coprime_ell` | characterisation | ¬ (ℓ ∣ serreLevel ℓ ρ̄). |
| `conductorExponent_eq_codim_inertia_invariants_of_tame` | compatibility | If the wild inertia G₁ at p acts trivially then n_p(ρ̄) = 2 - dim_F V^{I_p}. |
| `conductorExponent_eq_zero_iff_unramified` | characterisation | n_p(ρ̄) = 0 ↔ ρ̄ is unramified at p. |
| `serreLevel_eq_one_iff` | characterisation | serreLevel ℓ ρ̄ = 1 ↔ ρ̄ is unramified at every p ≠ ℓ. |
| `conductorExponent_twist` | functoriality | For a character φ of conductor dividing p, n_p(ρ̄ ⊗ φ) is computed from the ramification of ρ̄ ⊗ φ; the twisting formula that Proposition (4.5) uses. |
| `serreLevel_dvd_of_arises_from_level` | relation | If ρ̄ arises from an eigenform of level N with N prime to ℓ then serreLevel ℓ ρ̄ ∣ N. |

**Unit tests.** A wrong definition fails one of these.

- `serreLevel.test_unramified` (degenerate) — For ρ̄ unramified outside ℓ, serreLevel ℓ ρ̄ = 1.
- `serreLevel.test_not_div_ell` (non-example) — ℓ ∤ serreLevel ℓ ρ̄, even for ρ̄ wildly ramified at ℓ.
- `serreLevel.test_tame_value` (computation) — For ρ̄ tamely ramified at p with dim_F V^{I_p} = 1, n_p(ρ̄) = 1 and p ∥ serreLevel ℓ ρ̄.
- `serreLevel.test_not_radical` (non-example) — There is a ρ̄ and an odd p with n_p(ρ̄) = 2, so serreLevel ℓ ρ̄ ≠ radical(serreLevel ℓ ρ̄); a definition returning the radical fails this.

**Where it is used.**
- `SerreWeightAndLevelOptimisation:R20.2/descend-to-serre-level` — It is the target of the descent: the iteration must terminate at N(ρ̄) itself, with its exponents, rather than at the squarefree radical.
- `SerreWeightAndLevelOptimisation:R20.2/mazur-principle` — Mazur's Principle removes one prime p from the level exactly when ρ̄ is unramified at p, i.e. when n_p(ρ̄) = 0.
- `SerreWeightAndLevelOptimisation:R20.6/reduced-level-of-elliptic-curve` — The elliptic reduced level M₀ of Bennett–Siksek is compared against N(ρ̄); they agree only under conditions that node records.

**Acceptance tests.**
- ρ̄ unramified outside ℓ gives N(ρ̄) = 1.
- ℓ does not divide N(ρ̄), whatever the ramification of ρ̄ at ℓ.
- If ρ̄ is tamely ramified at p with a one-dimensional space of inertia invariants then n_p(ρ̄) = 1.
- A ρ̄ whose wild inertia at an odd p acts nontrivially has n_p(ρ̄) ≥ 2, so N(ρ̄) is divisible by p² and differs from its radical.

**Dependencies.**
- On the pinned libraries: `mathlib:DirichletCharacter`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §2, the definition of n(p, ρ) and N(ρ), pp. 3–4 of the author's copy. The conductor formula itself: n(p, ρ) = Σ_{i≥0} (1/(G₀:G_i)) dim V/V_i with V_i the G_i-fixed subspace, and the conclusion that N(ρ) is prime to ℓ. This is the primary citation for the statement of this node.
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §1, the Refined Conjecture and the local nature of k(ρ) and N(ρ). That N(ρ) is an integer prime to ℓ depending only on the restrictions of ρ to decomposition groups at the primes p ≠ ℓ, which is what makes the level a product of local Artin conductor exponents.
- Jean-Pierre Serre, *Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)* — 1.2, (1.2.1)–(1.2.3), printed p. 181. Serre's own definition of n(l, ρ) by (1.2.1) and of N by (1.2.3), matching Ribet's restatement.
#### `R20.2/mazur-principle` — Mazur's Principle: removing an unramified prime p with p ≢ 1 mod ℓ

*theorem* · planet **Mazur's Principle**

Let ℓ ≥ 5 and let p ≠ ℓ be a prime with p ≢ 1 (mod ℓ). Let M be prime to p and suppose the irreducible ρ̄ arises from an eigenform f of weight k on Γ₁(M) ∩ Γ₀(p), and that ρ̄ is unramified at p. Then ρ̄ arises from an eigenform on Γ₁(M). The proof is carried out in weight two (case (a) of the source's reduction) and needs only that ℓ be odd, so the case ℓ = 3 is not excluded; the hypothesis p ≢ 1 (mod ℓ) is what the argument consumes and may not be dropped.

**Hypotheses.**
- ℓ ≥ 5 as stated; the §8 proof requires only ℓ odd
- p ≠ ℓ prime, p ≢ 1 (mod ℓ)
- M prime to p
- ρ̄ irreducible and arising from an eigenform of weight k on Γ₁(M) ∩ Γ₀(p)
- ρ̄ unramified at p

**Construction or proof, in steps.**
1. Reduce to weight two, situation (a) of the source's dichotomy, so that f is a weight-two eigenform on Γ₁(M) ∩ Γ₀(p) whose nebentypus is defined modulo M.
2. Work with the integral cuspidal Hecke module of X₁(M,p) and the two degeneracy maps to level M, using the integral old/new sequence rather than the complex decomposition.
3. At p the curve X₁(M,p) has bad reduction of known shape; the character group of the toric part of the Jacobian's Neron model at p carries the Hecke action, supplied by the bad-fibre geometry.
4. Because ρ̄ is unramified at p, its restriction to a decomposition group at p is unramified, so the corresponding residual eigensystem cannot be p-new: the local condition forces the eigensystem into the image of the degeneracy maps.
5. Here p ≢ 1 (mod ℓ) enters: it makes the relevant component group contribution ℓ-trivial (Eisenstein), so the residual eigensystem cannot be supported only on the component group.
6. Conclude that the residual eigensystem occurs at level M, i.e. ρ̄ arises from an eigenform on Γ₁(M).

**Acceptance tests.**
- The conclusion fails without p ≢ 1 (mod ℓ): the argument must break at the component-group step, and a formalisation should exhibit where.
- For k = 2 and trivial nebentypus this reduces to the statement Mazur proved in his letter to Mestre.
- Applied with ρ̄ ramified at p, the hypothesis is not met and nothing is concluded.
- ℓ = 3 is allowed by the §8 proof, so an implementation must not carry ℓ ≥ 5 as a hypothesis of the weight-two case.

**Dependencies.**
- Inside this roadmap: `R20.2/serre-level`, `R20.1/integral-old-new-exact-sequence`, `R20.1/congruence-module`, `R20.2/character-group-of-bad-fibre`, `R20.2/monodromy-pairing-component-group`
- On other roadmaps, by stage id: `ModularCurvesPartII:R13.6`, `NeronModelsAndSemistableAbelianVarieties:R11.4`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §4, statement (4.7) Mazur's Principle. The statement of Mazur's Principle, with its hypotheses ℓ ≥ 5, p ≠ ℓ, p ≢ 1 mod ℓ, M prime to p and ρ unramified at p.
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §4, remark following (4.7) on the proof given in §8. The source's own statement that the §8 proof requires only that ℓ be odd and does not exclude ℓ = 3, and that §8's prime q plays the role of p.

#### `R20.2/level-lowering-unramified-prime` — Level lowering at an unramified prime with no condition on ℓ dividing M (Ribet, Theorem 1.5)

*theorem* · planet **Level lowering at an unramified prime**

Let ℓ ≥ 3 be a prime and ρ̄ : Gal(Q̄/Q) → GL(2,F) irreducible. Suppose ρ̄ arises from an eigenform f of weight two and trivial character on Γ₁(M) ∩ Γ₀(p), where p is prime to ℓM, and that ρ̄ is unramified at p. Then ρ̄ arises from a weight-two eigenform with trivial character on Γ₁(M). The point of the theorem is that M is not required to be prime to ℓ: M may be divisible by an arbitrarily high power of ℓ. As stated it applies only to forms with trivial character, that is to forms on Γ₀(Mp).

**Hypotheses.**
- ℓ ≥ 3 prime
- ρ̄ irreducible
- ρ̄ arises from a weight-two eigenform of trivial character on Γ₁(M) ∩ Γ₀(p)
- p prime to ℓM
- ρ̄ unramified at p

**Construction or proof, in steps.**
1. Since the character is trivial, f is a weight-two eigenform on Γ₀(Mp).
2. Form the integral Hecke module of the Jacobian of X₀(Mp) and localise at the maximal ideal m of the Hecke algebra cut out by the residual eigensystem of ρ̄.
3. Study the reduction of X₀(Mp) at p, whose character group and component group carry Hecke actions; this is where M being divisible by ℓ would obstruct earlier arguments that required M prime to ℓ.
4. Use the monodromy pairing on the character group of the toric part, and its compatibility with the corresponding pairing for the auxiliary curve, to control the m-torsion without invoking a multiplicity-one hypothesis.
5. Deduce that the residual eigensystem is not p-new, hence descends to level M, so ρ̄ arises from a weight-two eigenform of trivial character on Γ₁(M).

**Acceptance tests.**
- M divisible by a high power of ℓ is allowed; an implementation carrying 'M prime to ℓ' as a hypothesis is not this theorem.
- ℓ = 3 is permitted.
- The conclusion is at weight two with trivial character, matching the hypothesis; it does not by itself give arbitrary nebentypus.
- Taking p ramified for ρ̄ gives no conclusion.

**Dependencies.**
- Inside this roadmap: `R20.2/serre-level`, `R20.1/integral-old-new-exact-sequence`, `R20.1/congruence-module`, `R20.2/character-group-of-bad-fibre`, `R20.2/ribet-exact-sequence`, `R20.2/monodromy-pairing-component-group`
- On other roadmaps, by stage id: `ModularCurvesPartII:R13.6`, `ModularCurvesPartII:R14.4`, `NeronModelsAndSemistableAbelianVarieties:R11.4`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §1, statement (1.5) Theorem. The statement of Theorem 1.5 with its hypotheses ℓ ≥ 3, weight two and trivial character on Γ₁(M) ∩ Γ₀(p), p prime to ℓM, ρ unramified at p.

#### `R20.2/twist-away-ramified-character` — Twisting away a ramified character to divide the level by p (Ribet, Proposition 4.5)

*theorem*

In the local situation at p where the associated automorphic representation π is special with ramified character α and the invariant e is positive, there is a Dirichlet character φ of conductor p and ℓ-power order such that the newform associated to f ⊗ φ has level dividing N/p; in particular ρ̄ is modular of level N/p. Since e > 0 forces ᾱ to be unramified, α restricted to inertia at p has ℓ-power order and equals a power ω^i of the mod-p cyclotomic character, so φ may be taken to be ω^{-i}; then π ⊗ φ has conductor p while π itself has conductor p².

**Hypotheses.**
- e > 0, where e is the source's local invariant at p
- α ramified
- f an eigenform of level N whose local representation at p is special
- the order of the nebentypus ε is prime to ℓ

**Construction or proof, in steps.**
1. From e > 0 deduce dim_F V^{I_p} > 0, hence ᾱ is unramified.
2. Therefore α restricted to inertia at p has ℓ-power order, so it is a power ω^i of the mod-p cyclotomic character and the conductor of α is exactly p.
3. Set φ = ω^{-i}; then π ⊗ φ has conductor p whereas π has conductor p².
4. Replacing f by the newform attached to f ⊗ φ therefore replaces N by N/p, and ρ̄ ⊗ φ̄ = ρ̄ because φ has ℓ-power order and so is trivial modulo ℓ.
5. Record the consequence the source draws: ε̄ is unramified at p because det ρ̄ is, and as the order of ε is prime to ℓ this makes ε unramified at p, so f is a newform on Γ₁(M) ∩ Γ₀(p²) with M = N/p² prime to p and φ quadratic.

**Acceptance tests.**
- The twisting character φ has ℓ-power order, hence trivial reduction, so the residual representation is unchanged.
- The conclusion divides the level by exactly one factor of p, not by p².
- With α unramified the proposition does not apply, and the source's alternative branch (f a cusp form on Γ₁(M) ∩ Γ₀(p) with level Mp) is the one in force.
- If the order of ε were divisible by ℓ, the deduction that ε is unramified at p is unavailable.

**Dependencies.**
- Inside this roadmap: `R20.2/serre-level`
- On the pinned libraries: `mathlib:DirichletCharacter.changeLevel`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §4, statement (4.5) Proposition and its proof. The statement of Proposition 4.5: a character φ of conductor p and ℓ-power order twists f so that the associated newform has level dividing N/p.

#### `R20.2/descend-to-serre-level` — Iterated descent to the full prime-to-ℓ Artin conductor

*theorem* · planet **Descent to the Serre level**

Let ℓ ≥ 3 and let ρ̄ be irreducible and arising from some eigenform of weight two and trivial character on Γ₀(N). Iterating the one-prime steps — Mazur's Principle at primes p ∥ N with p ≢ 1 (mod ℓ) where ρ̄ is unramified, Theorem 1.5 at primes p ∥ N prime to ℓM where ρ̄ is unramified, and the twisting step at primes where the local representation is special with ramified character — terminates in an eigenform whose level is exactly the prime-to-ℓ Serre level N(ρ̄), with its Artin conductor exponents, and not merely the radical of N(ρ̄). Each step strictly decreases the ℓ-free part of the level, so the iteration terminates; termination at N(ρ̄) rather than at a larger level is the content, and requires that at every prime p ∤ ℓ remaining in the level the local exponent already equals n_p(ρ̄).

**Hypotheses.**
- ℓ ≥ 3
- ρ̄ irreducible, arising from a weight-two eigenform of trivial character on Γ₀(N)
- at each step the hypotheses of the step invoked hold, in particular the congruence condition of Mazur's Principle where that step is used

**Construction or proof, in steps.**
1. Order the primes p ∤ ℓ dividing N and induct on Σ_{p ∤ ℓ} ord_p(N), a non-negative integer.
2. At a prime p where ρ̄ is unramified and p ∥ N, apply Mazur's Principle when p ≢ 1 (mod ℓ), and Theorem 1.5 when p is prime to ℓM, to strip p from the level; the invariant drops.
3. At a prime p where the local representation is special with ramified character and e > 0, apply the twisting step to divide the level by p; the invariant drops and the residual representation is unchanged.
4. At a prime p where n_p(ρ̄) > 0, show no step applies once ord_p(level) = n_p(ρ̄): the local invariants of ρ̄ obstruct further descent, so the exponent reached is exactly n_p(ρ̄).
5. Assemble: the terminal level is ∏_{p≠ℓ} p^{n_p(ρ̄)} = N(ρ̄).
6. Record which steps were used at which primes, since consumers must choose an entry whose hypotheses they have proved rather than invoke a blanket descent.

**Acceptance tests.**
- For ρ̄ unramified outside ℓ the descent ends at level 1.
- The terminal level is divisible by p² whenever n_p(ρ̄) = 2; a descent that stops at the radical fails this test.
- The iteration terminates in finitely many steps, bounded by Σ_{p∤ℓ} ord_p(N).
- If at some prime p ∥ N with ρ̄ unramified at p we have p ≡ 1 (mod ℓ) and p not prime to ℓM, no listed step applies and the descent is recorded as blocked at p rather than asserted.

**Dependencies.**
- Inside this roadmap: `R20.2/serre-level`, `R20.2/mazur-principle`, `R20.2/level-lowering-unramified-prime`, `R20.2/twist-away-ramified-character`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §4, statement (4.6) Problem. The one-prime problem the iteration solves: from an eigenform of weight k on Γ₁(M) ∩ Γ₀(p) with M prime to p and ρ unramified at p, produce an eigenform on Γ₁(M).
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §2, the definition of n(p, ρ) and N(ρ). The target of the descent, with its exponents: N(ρ) = ∏ p^{n(p,ρ)} for the Artin conductor exponent n(p,ρ), so the terminal level is not in general squarefree.

#### `R20.2/q-new-subspace` — The q-new subspace as the kernel of the trace map

*definition*

Let N be prime to q and let S = S_k(Γ₁(N) ∩ Γ₀(q)). The q-new subspace S^{q-new} ⊆ S is the kernel of the natural trace map from S to the direct sum of two copies of S_k(Γ₁(N)). A residual representation ρ̄ arising from an eigenform on Γ₁(N) ∩ Γ₀(q) whose associated newform has level divisible by q is exactly one arising from an eigenform in S^{q-new}, so this subspace is the precise home of the level-raising condition. The trace map is the adjoint of the pair of degeneracy inclusions, so the definition is integral in nature even though the space here is complex; the integral form is the business of R20.1.

**Hypotheses.**
- N prime to q
- k ≥ 2
- S = S_k(Γ₁(N) ∩ Γ₀(q))

**Construction or proof, in steps.**
1. Construct the two degeneracy inclusions S_k(Γ₁(N)) → S given by f ↦ f and f ↦ f(qτ), whose sum embeds S_k(Γ₁(N)) ⊕ S_k(Γ₁(N)) into S as the space of oldforms.
2. Define the trace map S → S_k(Γ₁(N)) ⊕ S_k(Γ₁(N)) as the adjoint of that embedding for the Petersson product, and set S^{q-new} to be its kernel.
3. Check that S^{q-new} is stable under the diamond operators ⟨d⟩ for d ∈ (ℤ/Nℤ)* and under T_n for n prime to q; it is not in general stable under any splitting of U = T_q, which is why U is treated separately.
4. Record the equivalence with the newform formulation: ρ̄ arises from an eigenform whose associated newform has level divisible by q if and only if it arises from an eigenform of S^{q-new}.

**API.**

| name | role | statement |
|---|---|---|
| `cuspFormsQNew` | constructor | The q-new subspace of S_k(Γ₁(N) ∩ Γ₀(q)) as the kernel of the trace map. |
| `mem_cuspFormsQNew_iff` | characterisation | f ∈ S^{q-new} ↔ the trace of f to S_k(Γ₁(N)) ⊕ S_k(Γ₁(N)) vanishes. |
| `cuspFormsQNew_hecke_stable` | structure | S^{q-new} is stable under T_n for n prime to q and under ⟨d⟩. |
| `cuspFormsQNew_codim` | relation | codim S^{q-new} = 2 · dim S_k(Γ₁(N)), the trace map being surjective. |
| `cuspFormsQNew_level_one` | example | For N = 1 and k = 2, S^{q-new} = S. |

**Unit tests.** A wrong definition fails one of these.

- `cuspFormsQNew.test_level_one` (degenerate) — For N = 1, k = 2, the old part is zero and S^{q-new} = S.
- `cuspFormsQNew.test_oldform_excluded` (non-example) — The image of a nonzero f ∈ S_k(Γ₁(N)) under either degeneracy map is not in S^{q-new}; a definition returning all of S fails this.
- `cuspFormsQNew.test_hecke_stable` (computation) — T_n S^{q-new} ⊆ S^{q-new} for every n prime to q.

**Where it is used.**
- `SerreWeightAndLevelOptimisation:R20.2/level-raising-diamond` — Condition I of Diamond's theorem is membership of S^{q-new}, so the criterion is a statement about this subspace.
- `SerreWeightAndLevelOptimisation:R20.2/descend-to-serre-level` — The descent removes a prime exactly when the residual eigensystem fails to be q-new, so the subspace is what the descent must avoid.

**Acceptance tests.**
- For N = 1 the old part vanishes in weight two, so S^{q-new} = S.
- S^{q-new} is stable under T_n for n prime to q and under the diamond operators.
- An eigenform of S whose newform has level dividing N is not in S^{q-new}.
- The trace map is surjective, so S^{q-new} has codimension 2 dim S_k(Γ₁(N)) in S.

**Dependencies.**
- On the pinned libraries: `tauceti:TauCeti.cuspFormsOld`, `tauceti:TauCeti.cuspFormsNew`, `tauceti:TauCeti.ModularForm.levelRaise`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §5, the paragraph following (5.1) defining S^{q-new}. The definition of the q-new subspace as the kernel of the trace map to two copies of S_k(Γ₁(N)), and the statement that Condition I says exactly that ρ arises from an eigenform in it.

#### `R20.2/auxiliary-prime` — Auxiliary primes and the shape of Frobenius

*definition*

Let σ = ρ̄ × χ be the three-dimensional representation of Gal(Q̄/Q) over F given by ρ̄ together with the mod ℓ cyclotomic character χ. An auxiliary prime is a prime q, prime to ℓN, such that σ(Frob_q) is conjugate to σ(c) for c a complex conjugation. For such a q the characteristic polynomial of ρ̄(Frob_q) coincides with that of ρ̄(c); since ρ̄ is odd, ρ̄(c) is conjugate to diag(−1, 1) and the polynomial is (T − 1)(T + 1). Since χ(Frob_q) = χ(c) = −1 one gets q ≡ −1 (mod ℓ), and the polynomial may be written (T − a)(T − qa) with a = ±1. Auxiliary primes therefore satisfy the trace condition of the level-raising criterion automatically, and by the Čebotarev density theorem the set of them has positive density, so there are infinitely many.

**Hypotheses.**
- ρ̄ : Gal(Q̄/Q) → GL(2,F) irreducible and odd
- χ the mod ℓ cyclotomic character
- q prime, prime to ℓN

**Construction or proof, in steps.**
1. Form σ = ρ̄ × χ as a three-dimensional representation over F and fix a complex conjugation c.
2. Define q to be auxiliary when σ(Frob_q) is conjugate to σ(c); this is a condition on the image of σ, hence a union of conjugacy classes, which is what makes Čebotarev applicable.
3. For auxiliary q, read off that ρ̄(Frob_q) and ρ̄(c) have the same characteristic polynomial, and that oddness gives ρ̄(c) ∼ diag(−1,1) with polynomial (T−1)(T+1).
4. From χ(Frob_q) = χ(c) = −1 deduce q ≡ −1 (mod ℓ), and rewrite (T−1)(T+1) as (T − a)(T − qa) with a = +1 or a = −1.
5. Apply Čebotarev to the image of σ to conclude that the auxiliary primes have positive density.

**API.**

| name | role | statement |
|---|---|---|
| `IsAuxiliaryPrime` | constructor | IsAuxiliaryPrime ℓ ρ̄ N q : Prop, that q ∤ ℓN and σ(Frob_q) ∼ σ(c) for σ = ρ̄ × χ. |
| `isAuxiliaryPrime.neg_one_mod` | characterisation | An auxiliary prime satisfies q ≡ −1 (mod ℓ). |
| `isAuxiliaryPrime.charpoly` | characterisation | At an auxiliary prime the characteristic polynomial of ρ̄(Frob_q) is (T−1)(T+1), equal to (T − a)(T − qa) for a = ±1. |
| `infinite_setOf_isAuxiliaryPrime` | structure | The set of auxiliary primes is infinite, of positive density. |
| `isAuxiliaryPrime_odd` | compatibility | The construction uses only that ρ̄ is odd and irreducible, via ρ̄(c) ∼ diag(−1,1). |

**Unit tests.** A wrong definition fails one of these.

- `auxiliaryPrime.test_congruence` (computation) — Every auxiliary prime satisfies q ≡ −1 (mod ℓ).
- `auxiliaryPrime.test_charpoly` (computation) — At an auxiliary prime the characteristic polynomial is (T−1)(T+1).
- `auxiliaryPrime.test_ell_two_vacuous` (non-example) — For ℓ = 2 the congruence q ≡ −1 (mod 2) holds for every odd q, so the notion distinguishes nothing; an implementation that relies on it at ℓ = 2 is wrong.

**Where it is used.**
- `SerreWeightAndLevelOptimisation:R20.2/level-raising-diamond` — Auxiliary primes are the supply of primes at which Condition II holds, so that the criterion can be used to raise the level at will.
- `SerreWeightAndLevelOptimisation:R20.2/mazur-principle` — The auxiliary prime introduced into the level is chosen by this construction in the §8 proof of Mazur's principle.

**Acceptance tests.**
- An auxiliary prime satisfies q ≡ −1 (mod ℓ).
- The trace condition (T − a)(T − qa) holds at an auxiliary prime with a = ±1.
- There are infinitely many auxiliary primes, by Čebotarev applied to the image of ρ̄ × χ.
- For ℓ = 2 the condition q ≡ −1 (mod ℓ) is empty, so the notion carries no information there and the dyadic arguments of R20.5 use involutions instead.

**Dependencies.**
- Inside this roadmap: `R20.2/serre-level`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §5, the definition of an auxiliary prime and the computation of ρ̄(Frob_q). The definition of an auxiliary prime as one with σ(Frob_q) conjugate to σ(c), and the deduction that ρ̄(c) is conjugate to diag(−1,1) with characteristic polynomial (T−1)(T+1). The μ…¶ marks are the text layer's rendering of the matrix delimiters.
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §5, the Čebotarev argument for the density of auxiliary primes. That the primes for which c and Frob_q map to conjugate elements in the image of ρ̄ × χ have positive density, so there are infinitely many auxiliary primes.

#### `R20.2/level-raising-diamond` — Diamond's level-raising criterion (Ribet, Theorem 5.1)

*theorem* · planet **Diamond's level-raising criterion**

Let ρ̄ : Gal(Q̄/Q) → GL(2,F) be an irreducible mod ℓ representation arising from S_k(Γ₁(N)) with N prime to ℓ, and let q be a prime, prime to Nℓ. Consider: (I) ρ̄ arises from a weight-k eigenform on Γ₁(N) ∩ Γ₀(q) whose associated newform has level divisible by q; (II) the characteristic polynomial of ρ̄(Frob_q) is of the form (T − a)(T − qa) with a ∈ F*. If 2 ≤ k ≤ ℓ + 1 then I and II are equivalent. The implication I ⇒ II is a direct consequence of Langlands's local-global theorem: the automorphic representation at q is special, α ⊗ sp with α unramified, so ρ̄|D_q has semisimplification ᾱ ⊕ ᾱχ and Frobenius acts with eigenvalues a and qa. The weight restriction 2 ≤ k ≤ ℓ + 1 is used for II ⇒ I and is not decoration.

**Hypotheses.**
- ℓ prime, F of characteristic ℓ
- ρ̄ irreducible, arising from S_k(Γ₁(N))
- N prime to ℓ
- q prime, prime to Nℓ
- 2 ≤ k ≤ ℓ + 1

**Construction or proof, in steps.**
1. For I ⇒ II: let f be a newform of S^{q-new} giving ρ̄ and π the admissible representation of GL(2,Q_q) attached to it. Being associated with Γ₁(D) ∩ Γ₀(q) for some D | N forces π to be special, α ⊗ sp with α unramified.
2. By Langlands's theorem ρ_λ|D_q is an extension of the character α by αχ̃, so the semisimplification of ρ̄|D_q is ᾱ ⊕ ᾱχ.
3. Evaluate at Frob_q ∈ D_q to get diag(a, qa) with a = α(Frob_q), whose characteristic polynomial is (T − a)(T − qa). This gives II.
4. For II ⇒ I, the essential content: compare eigenforms in S_k(Γ₁(N)) and in S. With f of level N and f'(τ) = f(qτ), both are eigenvectors for the diamond operators and for T_n with (n,q) = 1 but not in general for U = T_q.
5. Form the two roots α, β of T² − c_q T + q^{k−1}ε(q); then f − αf' and f − βf' are U-eigenvectors with eigenvalues β and α respectively, which is the computation that converts the trace condition into membership of S^{q-new}.
6. Follow Diamond's intermediate results, within the stated weight range, to conclude I.

**Acceptance tests.**
- The two conditions are equivalent only under 2 ≤ k ≤ ℓ + 1; an implementation without that hypothesis is not this theorem.
- At an auxiliary prime II holds with a = ±1, so the criterion applies and the level may be raised.
- I ⇒ II needs only Langlands's theorem and holds without the weight restriction.
- For q dividing N neither condition is stated, q being assumed prime to Nℓ.

**Dependencies.**
- Inside this roadmap: `R20.2/q-new-subspace`, `R20.2/auxiliary-prime`, `R20.1/integral-old-new-exact-sequence`
- On other roadmaps, by stage id: `GL2AutomorphicRepresentationsAndTransfer:R17.6`, `AutomorphicGaloisRepresentations:R19.6`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §5, Conditions I and II and the statement (5.1) Theorem (Diamond). The two conditions on q, stated for ρ̄ irreducible arising from S_k(Γ₁(N)) with N prime to ℓ: Condition I on the newform level being divisible by q, and Condition II that the characteristic polynomial of ρ̄(Frob_q) is (T−a)(T−qa) with a ∈ F*.
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §5, statement (5.1) Theorem (Diamond). The theorem: for 2 ≤ k ≤ ℓ + 1, Conditions I and II are equivalent.

#### `R20.2/degeneracy-map-and-eta` — The degeneracy map on Jacobians and the operator η = U² − 1 (Ribet, Theorem 6.1)

*theorem*

Let q be a prime and N prime to q. The two standard degeneracy coverings X₀(qN) ↠ X₀(N) induce by pullback a map δ : J₀(N) × J₀(N) → J₀(qN) with finite kernel, the antidiagonal image of the kernel of the pullback of X₁(N) → X₀(N). Writing T_q for the q-th Hecke operator on J₀(N) and U for the q-th Hecke operator on J₀(qN), one has U ∘ δ = δ ∘ U where the second U is the matrix [[T_q, q], [−1, 0]] of endomorphisms of J₀(N) × J₀(N); this is the unique action of the Hecke ring T = T_{qN} ⊆ End J₀(qN) making δ equivariant. Setting η = U² − 1 in T, there is a unique homomorphism of abelian varieties σ : J₀(qN) → J₀(N) × J₀(N) with σ ∘ δ = η, and σ is T-equivariant. All of δ, σ, T_n and U are defined over Q.

**Hypotheses.**
- q prime, N prime to q
- T = T_{qN} the subring of End J₀(qN) generated by the T_n and U = T_q
- η = U² − 1 in T

**Construction or proof, in steps.**
1. Construct δ by pullback along the two degeneracy coverings and identify its kernel with the antidiagonal image of the kernel of the pullback of X₁(N) → X₀(N); in particular δ has finite kernel.
2. Compute the interaction with the q-th Hecke operators: U ∘ δ = δ ∘ U with U on the product given by [[T_q, q], [−1, 0]], and observe that this is the unique T-action making δ equivariant.
3. Construct δ' : J₀(qN) → J₀(N) × J₀(N) by Albanese (covariant) functoriality of the Jacobian along the same coverings; the definition of T_q as a correspondence on X₀(N) gives δ' ∘ δ = [[q+1, T_q], [T_q, q+1]].
4. Set σ = [[−1, T_q], [0, −1]] ∘ δ' and compute that σ ∘ δ = η as a matrix of endomorphisms of J₀(N).
5. For unicity and equivariance, prove Hom(Q, J₀(N) × J₀(N)) = 0 where Q = J₀(qN)/δ(J₀(N)²): Q has purely toric reduction at q while J₀(N) has good reduction at q. Two candidate σ differ by an operator vanishing on the image of δ, hence factoring through Q, hence zero; the same argument applied to σT − Tσ gives T-equivariance.

**Acceptance tests.**
- δ has finite kernel, so δ is an isogeny onto its image.
- The operator σ is unique; an implementation producing a second one has an error.
- σ ∘ δ = η = U² − 1, not U² or U² + 1.
- The unicity argument fails if J₀(N) does not have good reduction at q, so N prime to q is used.
- All maps are defined over Q, so the construction is compatible with the Galois action.

**Dependencies.**
- Inside this roadmap: `R20.1/integral-old-new-exact-sequence`
- On other roadmaps, by stage id: `ModularCurvesPartII:R13.6`, `ModularCurvesPartII:R14.2`, `NeronModelsAndSemistableAbelianVarieties:R11.3`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §6, the definition of η and statement (6.1) Theorem. That η = U² − 1 in T, and Theorem 6.1: there is a unique homomorphism of abelian varieties σ : J₀(qN) → J₀(N) × J₀(N) with σ ∘ δ = η, and it is T-equivariant.

#### `R20.2/character-group-of-bad-fibre` — The character group of the toric part and the component group at a bad prime

*definition* · planet **Character group of the bad fibre**

Let N = pM with p prime not dividing M, and let q be a prime not dividing N. Let J₀(pqM)/F_p be the fibre at p of the Néron model of J₀(pqM). It is an extension of a finite component group Θ_p by a connected group J₀(pqM)⁰/F_p, which is in turn an extension of a product of two copies of J₀(qM) by a torus T over F_p. Define L_p to be the character group of that torus, and L_q the character group of the analogous torus for J₀(pqM)/F_q. Define X_p to be the analogue of L_p for (J₀(pM) × J₀(pM))/F_p, and X_q with p replaced by q; X_p and X_q are naturally direct sums of two copies of the character group of a single J₀(pM)/F_p resp. J₀(qM)/F_q, so endomorphisms of X_p are two-by-two matrices over the character group of one copy. The operators T_n and U of the three abelian varieties induce maps on L_p, X_p, L_q and X_q, written with the same names; in particular U on X_p is the matrix [[T_q, −1], [q, 0]]. The map δ : L_p → X_p induced by the degeneracy map is surjective.

**Hypotheses.**
- N = pM with p prime, p ∤ M
- q prime, q ∤ N
- J₀(pqM) with its Néron model at p and at q

**Construction or proof, in steps.**
1. Take the fibre at p of the Néron model of J₀(pqM) and split off the finite component group Θ_p to reach the connected component J₀(pqM)⁰/F_p.
2. Identify the connected component as an extension of J₀(qM) × J₀(qM) by a torus T over F_p; this is the bad-fibre geometry imported from the modular-curve and Néron-model roadmaps.
3. Define L_p as the character group Hom(T, G_m) of that torus, and L_q, X_p, X_q by the same recipe at the other prime and for the product.
4. Record the direct-sum structure of X_p and X_q, so that endomorphisms are two-by-two matrices, and compute that U acts on X_p as [[T_q, −1], [q, 0]]. Note that this matrix is not the one acting on J₀(N) × J₀(N), which is [[T_q, q], [−1, 0]]: the character group is contravariant, so the matrix is the transpose up to sign and must not be copied from the abelian-variety side.
5. Prove that δ : L_p → X_p is surjective.

**API.**

| name | role | statement |
|---|---|---|
| `characterGroupToricPart` | constructor | L_p, the character group of the toric part of the Néron fibre of J₀(pqM) at p. |
| `componentGroup` | constructor | Θ_p, the finite component group of that fibre. |
| `characterGroupProduct_eq_sum` | structure | X_p is the direct sum of two copies of the character group of J₀(pM)/F_p. |
| `hecke_on_characterGroupProduct` | compatibility | U acts on X_p as the matrix [[T_q, −1], [q, 0]]. |
| `surjective_delta_characterGroup` | structure | δ : L_p → X_p is surjective. |
| `componentGroup_finite` | structure | Θ_p is finite. |

**Unit tests.** A wrong definition fails one of these.

- `characterGroup.test_delta_surjective` (computation) — δ : L_p → X_p is surjective.
- `characterGroup.test_U_matrix` (non-example) — U on X_p is [[T_q, −1], [q, 0]] and not [[T_q, q], [−1, 0]]; an implementation copying the covariant matrix fails.
- `characterGroup.test_componentGroup_finite` (degenerate) — Θ_p is finite, and is trivial when the fibre is connected.

**Where it is used.**
- `SerreWeightAndLevelOptimisation:R20.2/ribet-exact-sequence` — L_p, X_p and Y_q are the three terms of the exact sequence, so the sequence is a statement about these groups.
- `SerreWeightAndLevelOptimisation:R20.2/monodromy-pairing-component-group` — The monodromy pairing is a pairing on L_p whose cokernel is Θ_p.
- `SerreWeightAndLevelOptimisation:R20.2/mazur-principle` — The proof works with the character group of the toric part and the component group at the removed prime rather than with a congruence of Frobenius traces.

**Acceptance tests.**
- δ : L_p → X_p is surjective.
- U acts on X_p as [[T_q, −1], [q, 0]]; an implementation reusing [[T_q, q], [−1, 0]] here has confused the covariant and contravariant sides and fails.
- X_p is a direct sum of two copies of the character group of J₀(pM)/F_p.
- Θ_p is finite.
- For M = 1 and small p the torus may be trivial, and then L_p = 0; the definitions must survive that degenerate case.

**Dependencies.**
- Inside this roadmap: `R20.2/degeneracy-map-and-eta`
- On other roadmaps, by stage id: `ModularCurvesPartII:R13.6`, `NeronModelsAndSemistableAbelianVarieties:R11.3`, `NeronModelsAndSemistableAbelianVarieties:R11.4`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §6, the Néron fibre at p and the definition of L_p, L_q, X_p and X_q. That the fibre at p of the Néron model of J₀(pqM) is an extension of a finite component group Θ_p by a connected group, itself an extension of two copies of J₀(qM) by a torus, and that L_p is the character group of that torus.
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §6, the map δ : L_p → X_p and its surjectivity. That δ denotes also the induced map L_p → X_p and that its surjectivity was established in the author's earlier paper, Theorem 3.15.

#### `R20.2/ribet-exact-sequence` — The Shimura-curve exact sequence relating the character groups (Ribet, 6.2 and 6.3)

*theorem*

Let C be the Shimura curve attached to a quaternion algebra of discriminant pq with Γ₀(M)-type level structure, J its Jacobian, and Y_p, Y_q the analogues of L_p, L_q for J. The reductions J/F_p and J/F_q are extensions of their component groups Ψ_p, Ψ_q by tori with character groups Y_p, Y_q; by Čerednik and Drinfeld all components of C/F_p and C/F_q have genus zero, so these reductions are semiabelian with trivial abelian-variety part. Then there are exact sequences 0 → Y_q →^ι L_p →^δ X_p → 0 and, with the roles of p and q permuted, 0 → Y_p → L_q → X_q → 0. Both are compatible with the Hecke operators T_n on J and on J₀(pqM), and the operators T_p and T_q on J are involutions. Consequently the Hecke ring ℤ[…, T_n, …] ⊆ End J is naturally a quotient of the ring T attached to J₀(pqM), so T acts on J.

**Hypotheses.**
- p ≠ q primes, M prime to pq
- C the Shimura curve of discriminant pq with Γ₀(M)-type level structure, J = Jac C
- L_p, X_p as defined for J₀(pqM)

**Construction or proof, in steps.**
1. Construct C and J and identify the reductions J/F_p and J/F_q as extensions of Ψ_p, Ψ_q by tori with character groups Y_p, Y_q; this is the quaternionic geometry imported from the Shimura-curve roadmap.
2. Invoke Čerednik–Drinfeld uniformisation to see that all components of C/F_p and C/F_q have genus zero, so the reductions are semiabelian with trivial abelian part.
3. Identify the kernel of δ : L_p → X_p with Y_q, giving the exact sequence 0 → Y_q → L_p → X_p → 0; surjectivity of δ is the previous node's statement.
4. Permute p and q to obtain the analogue 0 → Y_p → L_q → X_q → 0.
5. Check Hecke compatibility of both sequences, and that T_p and T_q act on J as involutions.
6. Deduce that the Hecke ring of J is a quotient of T, so that T acts on J and the sequences are sequences of T-modules.

**Acceptance tests.**
- Both sequences are exact, with δ surjective and kernel exactly Y_q resp. Y_p.
- The sequences are T-equivariant.
- T_p and T_q are involutions on J; in particular their squares are the identity, which an implementation must reproduce.
- The Hecke ring of J is a quotient of T, not a subring.
- The genus-zero statement is used, so an implementation must not assume an abelian-variety part in the reduction of J.

**Dependencies.**
- Inside this roadmap: `R20.2/character-group-of-bad-fibre`
- On other roadmaps, by stage id: `HilbertModularVarietiesAndShimuraCurves:R18.6`, `NeronModelsAndSemistableAbelianVarieties:R11.4`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §6, the Shimura curve, the genus-zero components and the exact sequences (6.2) and (6.3). That the reductions of J at p and q are semiabelian with trivial abelian-variety parts, and the exact sequences 0 → Y_q → L_p → X_p → 0 and 0 → Y_p → L_q → X_q → 0, compatible with the Hecke operators, with T_p and T_q involutions on J.

#### `R20.2/monodromy-pairing-component-group` — The monodromy pairing and the component group as its cokernel

*theorem*

The monodromy pairing associated with L_p is a bilinear map ⟨ , ⟩ : L_p × L'_p → ℤ, where the prime denotes the dual abelian variety, and it induces an injection L'_p ↪ Hom(L_p, ℤ) with finite cokernel. That cokernel is canonically isomorphic to the component group Θ_p, so there is an exact sequence 0 → L'_p → Hom(L_p, ℤ) → Θ_p → 0, and it is T-equivariant when T_n ∈ T acts as T_n on Θ_p, as T'_n on L'_p and by the transpose on Hom(L_p, ℤ). The pairing is therefore the bridge between the character group, which carries the Hecke action used in the descent, and the component group, whose ℓ-triviality is what the congruence hypothesis of Mazur's principle delivers.

**Hypotheses.**
- L_p the character group of the toric part at p, L'_p its analogue for the dual abelian variety
- Θ_p the component group at p

**Construction or proof, in steps.**
1. Construct the monodromy pairing ⟨ , ⟩ : L_p × L'_p → ℤ from the structure of the Néron fibre, following Grothendieck's construction in SGA 7.
2. Prove that it induces an injection L'_p ↪ Hom(L_p, ℤ) and that the cokernel is finite.
3. Identify the cokernel canonically with Θ_p, giving the exact sequence 0 → L'_p → Hom(L_p, ℤ) → Θ_p → 0.
4. Check T-equivariance with the stated actions: T_n on Θ_p, T'_n on L'_p, and the transpose on Hom(L_p, ℤ). The three actions are different maps and must not be identified.
5. Record the consequence used downstream: localising the sequence at the maximal ideal of the residual eigensystem converts a statement about Θ_p into one about the character group.

**Acceptance tests.**
- The cokernel of L'_p ↪ Hom(L_p, ℤ) is canonically Θ_p, not merely of the same order.
- The sequence is T-equivariant for the stated actions.
- If Θ_p is trivial then L'_p → Hom(L_p, ℤ) is an isomorphism, so the pairing is perfect.
- The pairing is ℤ-valued and its finiteness of cokernel is part of the statement.

**Dependencies.**
- Inside this roadmap: `R20.2/character-group-of-bad-fibre`
- On other roadmaps, by stage id: `NeronModelsAndSemistableAbelianVarieties:R11.4`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §6, the monodromy pairing on L_p and the identification of the cokernel with Θ_p. That the monodromy pairing L_p × L'_p → ℤ induces an injection L'_p ↪ Hom(L_p, ℤ) with finite cokernel canonically isomorphic to Θ_p, and that the resulting exact sequence is T-equivariant with T_n acting as T_n on Θ_p and as T'_n on L'_p.

**Remaining in this layer.**
- Wild ramification at p: the descent node states that the terminal exponent equals n_p(ρ̄), but the wild case of that claim is asserted from the local invariants and needs its own lemma.
- Coefficient fields: RS-06 requires the coefficient field of each theorem to be verified, which is recorded per node but not yet a separate statement.
- The §7 proof of Theorem 1.5 itself — the auxiliary-prime step, the localisation at the maximal ideal and the dimension count — is not decomposed; the character-group and monodromy nodes now supply its inputs but not its argument.
- Higher exponents: RS-06 requires the cases needed for an arbitrary prime-to-ℓ Artin conductor, and only the one-prime steps and their iteration are planned.

### R20.3 — Weight optimisation at p

RS-06 narrows this layer to the modular weight-minimality theorem under a supplied modularity witness. It must cover the irreducible and reducible local branches, the low-characteristic corrections, the exact conclusion at weight `p+1` and the effect of twisting, and it binds the layer to "Preserve Edixhoven Theorem 4.5 as an optimisation proof, not merely a recipe definition."

**Source (checkpoint by Claude Code cc-fb70e5).** Edixhoven's paper is public as the author's DVI on his Leiden page (`weight.dvi`, SHA-256 `ff106eeb…`). AlgebraicModularFormsAndSerreWeights uses the same file. The layer is planned from it:
- the local forms of eigenforms of weight 2 ≤ k ≤ p + 1 (Theorems 2.5 and 2.6, with the §6 proof of 2.6);
- Mazur's weight-`p+1` theorem (2.8, the numbering Buzzard cites);
- weight-one unramifiedness (2.7) and Gross's companion forms (2.9);
- Theorem 4.5 with its whole proof.

The recipe, θ, the filtration, the θ-cycles and the reduction to weight ≤ p + 1 are imported from AlgebraicModularFormsAndSerreWeights R15.3–R15.4. Edixhoven's note, added after the paper was written, records that Coleman–Voloch remove, for p > 2, both the dependence on Gross's unverified compatibilities and the hypothesis "not exceptional".

**Coverage status: `partial`.**

#### `R20.3/local-form-of-ordinary-eigenforms` — Deligne: the local representation of an ordinary eigenform of weight 2 ≤ k ≤ p + 1

*theorem*

Let p be a prime, N ≥ 1 prime to p, ε : (ℤ/Nℤ)^× → F̄_p^× a character, and f a cusp form of type (N, k, ε) over F̄_p in Katz's sense (a section of ω^{⊗k} on the Γ₁(N) moduli stack over F̄_p) that is an eigenform for all T*_l with eigenvalues a_l; ρ_f is its semisimple Galois representation, ρ_{f,p} its restriction to a decomposition group G_p, and λ(a) the unramified character of G_p with λ(a)(Frob_p) = a. If 2 ≤ k ≤ p + 1 and a_p ≠ 0, then ρ_{f,p} is reducible: ρ_{f,p} ≅ (χ^{k−1}λ(ε(p)/a_p) ∗; 0 λ(a_p)), χ the mod-p cyclotomic character.

**Hypotheses.**
- 2 ≤ k ≤ p + 1 and a_p ≠ 0 (T*_p is U_p when p | N·p; here p ∤ N and T*_p is the usual T_p)
- the source refers to Gross [10] for the proof; the proof steps below give the route through p-adic Hodge theory

**Construction or proof, in steps.**
1. Lift f to a characteristic-zero eigenform F of the same weight and level with a_p(F) a λ-adic unit reducing to a_p (Deligne–Serre lifting, AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma, with base change for k ≥ 2, AlgebraicModularFormsAndSerreWeights:R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary).
2. V_F is crystalline at p with Frobenius polynomial X² − a_pX + ε(p)p^{k−1}, and ordinary since a_p is a unit: it has an unramified quotient on which Frobenius acts by the unit root α ≡ a_p, and the sub has character χ^{k−1}λ(ε(p)/α) by the determinant (PadicHodgeTheory:R06.5/modular-form-crystalline-good-primes).
3. Reduce modulo λ: ρ_{f,p} has the stated shape (AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform).

**Acceptance tests.**
- Δ at p = 11 (k = 12 = p + 1): τ(11) = 534612 ≡ 1 mod 11, so ρ_{Δ,11} ≅ (χ^{11}λ(1) ∗; 0 λ(1)), and on inertia (ω ∗; 0 1) as ω^{11} = ω.
- 11a1 at p = 3 (k = 2, a₃ = −1): ρ_{f,3} ≅ (χλ(−1) ∗; 0 λ(−1)).

**Dependencies.**
- On other roadmaps, by node id: `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`, `AlgebraicModularFormsAndSerreWeights:R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary`, `PadicHodgeTheory:R06.5/modular-form-crystalline-good-primes`, `AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform`

**Sources.**
- Bas Edixhoven, *The weight in Serre's conjectures on modular forms* — 2.5, p. 5 of the DVI. The ordinary local form; the proof is referred to Gross [10].

#### `R20.3/local-form-of-supersingular-eigenforms` — Fontaine: the local representation of a supersingular eigenform of weight 2 ≤ k ≤ p + 1

*theorem*

Let p be a prime, N ≥ 1 prime to p, ε : (ℤ/Nℤ)^× → F̄_p^× a character, and f a cusp form of type (N, k, ε) over F̄_p in Katz's sense (a section of ω^{⊗k} on the Γ₁(N) moduli stack over F̄_p) that is an eigenform for all T*_l with eigenvalues a_l; ρ_f is its semisimple Galois representation, ρ_{f,p} its restriction to a decomposition group G_p, and λ(a) the unramified character of G_p with λ(a)(Frob_p) = a. If 2 ≤ k ≤ p + 1 and a_p = 0, then ρ_{f,p} is irreducible and ρ_f|_I ≅ ψ^{k−1} ⊕ ψ′^{k−1}, where ψ, ψ′ are the two fundamental characters of level 2.

**Hypotheses.**
- Fontaine's proof (letters to Serre, 1979) is unpublished; Edixhoven proves the theorem in his §6
- by Theorem 2.8 (R20.3/weight-p-plus-one-and-finiteness) one may assume 2 ≤ k ≤ p
- the proof uses Gross's construction [10] of ρ_f through the Igusa curves in the stable reduction of X₁(pN) over ℤ_p[ζ_p]; Gross's article is not read here

**Construction or proof, in steps.**
1. Reduce to 2 ≤ k ≤ p by Theorem 2.8, and to N with X₁(N) representing the stack.
2. Construct a differential ω(f) on the Igusa curve with the eigenvalues of f (6.7), lift it to X₁(pN) through the stable model X over ℤ_p[ζ_p] whose special fibre is I ∪ E meeting at the supersingular points (6.2), and realise ρ_f in the reduction of the Tate module of J₁(pN) (6.3).
3. Compute the action of inertia through the automorphisms g(σ) of X and the formulas 6.6.1 for T_p and ⟨b⟩_p on J_I × J_E: inertia acts through ψ^{k−1} and ψ′^{k−1}; irreducibility follows as these are of level 2.

**Acceptance tests.**
- For E = 11a1 at p = 19 (a₁₉ = 0, k = 2) the 19-torsion has ρ|_I ≅ ψ ⊕ ψ′.
- For Δ at p = 2411 (τ(2411) ≡ 0 mod 2411 and k = 12 ≤ p + 1): ρ_{Δ,2411}|_I ≅ ψ^{11} ⊕ ψ′^{11}.

**Dependencies.**
- Inside this roadmap: `R20.3/weight-p-plus-one-and-finiteness`
- On other roadmaps, by node id: `AlgebraicModularFormsAndSerreWeights:R15.4/tame-inertia-characters-of-a-local-residual-representation`, `AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform`
- On other roadmaps, by stage id: `ModularCurvesPartII:R13.5`

**Sources.**
- Bas Edixhoven, *The weight in Serre's conjectures on modular forms* — 2.6, p. 6 of the DVI. The supersingular local form.
- Bas Edixhoven, *The weight in Serre's conjectures on modular forms* — 6.1, p. 16 of the DVI. Edixhoven's proof in §6 (Fontaine's is unpublished).

#### `R20.3/weight-p-plus-one-and-finiteness` — Mazur: an ordinary eigenform of weight p + 1 not divisible by A has a_p² = ε(p) and a non-finite extension

*theorem*

Let p be a prime, N ≥ 1 prime to p, ε : (ℤ/Nℤ)^× → F̄_p^× a character, and f a cusp form of type (N, k, ε) over F̄_p in Katz's sense (a section of ω^{⊗k} on the Γ₁(N) moduli stack over F̄_p) that is an eigenform for all T*_l with eigenvalues a_l; ρ_f is its semisimple Galois representation, ρ_{f,p} its restriction to a decomposition group G_p, and λ(a) the unramified character of G_p with λ(a)(Frob_p) = a. Let f have weight p + 1. Suppose that ρ_f is irreducible and that there is no form g of type (N, 2) with f = Ag (A the Hasse invariant). Then a_p² = ε(p), and the extension of Theorem 2.5 is not finite at p: the group scheme over ℚ_p attached to a realisation of ρ_f over a finite field has no finite flat extension over ℤ_p. For such f, finiteness at p is equivalent to being peu ramifiée (Edixhoven §8).

**Hypotheses.**
- the source refers to Mazur [22] §6 for ε trivial and p > 2 (not read), states that the proof generalises to arbitrary ε, and sketches the adaptation for p = 2
- the equivalence of "finite at p" with "peu ramifiée" is AlgebraicModularFormsAndSerreWeights:R15.4/finite-at-p-equals-peu-ramifie (Edixhoven Proposition 8.2)

**Construction or proof, in steps.**
1. Mazur's argument (Eisenstein ideal, §6): the representation appears in J₁(Np) on which U_p acts; a finite model would force f to come from level N in weight 2, i.e. f = Ag.
2. For p = 2: if V is unramified the result is immediate; otherwise V^l and V^{et} are 1-dimensional vector-space schemes, the Zariski closure of V^l in the Néron model is finite and multiplicative, V lands in the toric part, contradicting the one-dimensionality of U^t (Edixhoven's adaptation).
3. Combine with Theorem 2.5 to read off a_p² = ε(p) from the determinant.

**Acceptance tests.**
- Δ at p = 11 (weight 12 = p + 1): ρ_{Δ,11} is irreducible and Δ ≠ Ag (there are no level-one forms of weight 2), so τ(11)² ≡ 1 mod 11, as 534612² ≡ 1 (checked in the suggested Lean file), and ρ_{Δ,11} is not finite at 11: très ramifiée, Serre weight 12.
- For f = A·g with g of weight 2 the extension is finite (it comes from g), so the hypothesis f ≠ Ag cannot be dropped.

**Dependencies.**
- Inside this roadmap: `R20.3/local-form-of-ordinary-eigenforms`
- On other roadmaps, by node id: `AlgebraicModularFormsAndSerreWeights:R15.4/finite-at-p-equals-peu-ramifie`, `AlgebraicModularFormsAndSerreWeights:R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one`, `AlgebraicModularFormsAndSerreWeights:R15.4/raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction`

**Sources.**
- Bas Edixhoven, *The weight in Serre's conjectures on modular forms* — 2.8, p. 6 of the DVI. The weight p + 1 conclusion and the p = 2 adaptation.

#### `R20.3/weight-one-forms-unramified-at-p` — Weight-one eigenforms are unramified at p when the U_p-polynomial has distinct roots or the form lifts

*theorem*

Let p be a prime, N ≥ 1 prime to p, ε : (ℤ/Nℤ)^× → F̄_p^× a character, and f a cusp form of type (N, k, ε) over F̄_p in Katz's sense (a section of ω^{⊗k} on the Γ₁(N) moduli stack over F̄_p) that is an eigenform for all T*_l with eigenvalues a_l; ρ_f is its semisimple Galois representation, ρ_{f,p} its restriction to a decomposition group G_p, and λ(a) the unramified character of G_p with λ(a)(Frob_p) = a. Let f have weight 1 with T*_p f = a_p f. If X² − a_pX + ε(p) has two distinct roots in F̄_p, or f is the reduction of a characteristic-zero eigenform, then ρ_f is unramified at p. For p > 2 every weight-one cuspidal eigenform over F̄_p has ρ_f unramified at p (Coleman–Voloch, as recorded in Edixhoven's note).

**Hypotheses.**
- the case a = a′ for a form that does not lift was open when the source was written; the Coleman–Voloch result quoted in the source's note closes it for p > 2

**Construction or proof, in steps.**
1. Af and V*_p f are eigenforms of weight p for T_l (l ≠ p) with the eigenvalues of f, and T*_p acts on their span with characteristic polynomial X² − a_pX + ε(p).
2. Its two eigenvectors g, g′ have ρ_g ≅ ρ_{g′} ≅ ρ_f, and Theorem 2.5 applied to g and g′ gives upper-triangular forms with swapped unramified characters λ(a′), λ(a); if a ≠ a′ both are split and ρ_f is unramified.
3. If f lifts to characteristic zero, Deligne–Serre Théorème 4.1 gives an Artin representation, unramified at p.

**Acceptance tests.**
- A weight-one form whose U_p-polynomial X² − a_pX + ε(p) has distinct roots: ρ_f is unramified at p, and the two weight-p forms g, g′ are companions of each other.

**Dependencies.**
- Inside this roadmap: `R20.3/local-form-of-ordinary-eigenforms`
- On other roadmaps, by node id: `AlgebraicModularFormsAndSerreWeights:R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one`

**Sources.**
- Bas Edixhoven, *The weight in Serre's conjectures on modular forms* — 2.7, p. 6 of the DVI. Unramifiedness of weight-one forms.
- Bas Edixhoven, *The weight in Serre's conjectures on modular forms* — Introduction, the note after the acknowledgements, p. 3 of the DVI. The Coleman–Voloch consequence.

#### `R20.3/companion-forms` — Gross: companion forms and tame ramification

*theorem*

Let p be a prime, N ≥ 1 prime to p, ε : (ℤ/Nℤ)^× → F̄_p^× a character, and f a cusp form of type (N, k, ε) over F̄_p in Katz's sense (a section of ω^{⊗k} on the Γ₁(N) moduli stack over F̄_p) that is an eigenform for all T*_l with eigenvalues a_l; ρ_f is its semisimple Galois representation, ρ_{f,p} its restriction to a decomposition group G_p, and λ(a) the unramified character of G_p with λ(a)(Frob_p) = a. Let f be as in Theorem 2.5 (2 ≤ k ≤ p + 1, a_p ≠ 0), and if k = p suppose a_p² ≠ ε(p). Then ρ_{f,p} is tamely ramified (its restriction to inertia is diagonalisable) if and only if there is a cuspidal eigenform f′ of type (N, k′, ε), k′ = p + 1 − k, with l a′_l = l^{k′} a_l for all l (a companion form). For p > 2 and 2 < k ≤ p with T*_p f ≠ 0, Coleman and Voloch prove the equivalence without the unverified compatibilities of Gross's article.

**Hypotheses.**
- Gross's proof depends on compatibilities of p-adic cohomology theories with Hecke operators that were not all checked (pages 504–505 of [10]); R. Coleman checked the map in (16.6)
- the case k = p with a_p² = ε(p) is not covered

**Construction or proof, in steps.**
1. The hard direction (existence of f′ when ρ_{f,p} is tame) is Gross [10], Theorem 13.10, not read here.
2. The easy direction: θ^{k′}f′ and θf have the same q-expansion away from p-power terms up to the stated eigenvalue twist, which forces the splitting on inertia.

**Acceptance tests.**
- 11a1 at p = 3 is ordinary with ρ_{f,3} peu ramifiée and wildly ramified in general; a companion form of weight p + 1 − 2 = 2 exists exactly when ρ_{f,3} is tame.

**Dependencies.**
- Inside this roadmap: `R20.3/local-form-of-ordinary-eigenforms`
- On other roadmaps, by node id: `AlgebraicModularFormsAndSerreWeights:R15.3/theta-operator-filtration-and-hecke-commutation`

**Sources.**
- Bas Edixhoven, *The weight in Serre's conjectures on modular forms* — 2.9, p. 7 of the DVI. Gross's criterion; the Coleman–Voloch improvement is in the introduction's note.

#### `R20.3/edixhoven-weight-theorem` — Edixhoven's theorem: a modular ρ arises in Serre's weight k_ρ and, if not exceptional, in the minimal weight k(ρ)

*theorem* · planet **Edixhoven's weight theorem**

Let ρ : G_ℚ → GL₂(F̄_p) be continuous, irreducible and odd, with Serre's weight k_ρ and Edixhoven's weight k(ρ) (AlgebraicModularFormsAndSerreWeights:R15.4/edixhoven-weight-k-rho-and-its-comparison-with-serre-k). Suppose ρ ≅ ρ_g for a cusp form g of some type (N, k, ε) with p ∤ N that is an eigenform for all T*_l. Then there is a cuspidal eigenform f of type (N, k_ρ, ε) with the same eigenvalues as g for T*_l (l ≠ p) and ρ ≅ ρ_f. If ρ is not exceptional (ρ_p is not an extension of an unramified character by itself), there is such an f of type (N, k(ρ), ε), and no eigenform of level prime to p and weight less than k(ρ) has representation ρ. For p > 2 the hypothesis "not exceptional" can be dropped (Coleman–Voloch, recorded in the source's note). Twisting: ρ ⊗ χ^a corresponds to θ^a applied to a form of lower filtration, and the proof finds k(ρ) as w(θ^α f₁).

**Hypotheses.**
- p ∤ N and ρ ≅ ρ_g for some eigenform g: this is weight optimisation, not existence of a modular form
- the minimality statement needs ρ not exceptional; the source's note removes this for p > 2
- the proof uses Theorems 2.5, 2.6, 2.8, 2.9 and Proposition 2.7, whose proofs depend on Gross [10] (for p > 2 no longer on its unverified compatibilities, by Coleman–Voloch)
- the last step of the minimality proof invokes Gross [10], Proposition 4.12 and a "case by case" check that the source does not display

**Construction or proof, in steps.**
1. By Theorem 3.4 (AlgebraicModularFormsAndSerreWeights:R15.3/weight-reduction-to-at-most-p-plus-one) some twist ρ ⊗ χ^{−α} comes from an eigenform f₁ of type (N, k₁, ε) with k₁ ≤ p + 1 and w(f₁) = k₁.
2. Level-2 case: Theorems 2.5–2.8 and Proposition 2.7 force k₁ ≥ 2, a_p = 0, k₁ ≤ p; Theorem 2.6 limits (α, k₁) to (a, 1 + b − a) or (b − 1, p + 2 + a − b) (b − a ≠ 1) or (a, 2); Prop. 3.3 (the θ-cycles) shows these occur, and f = θ^a f₁ has w(f) = 1 + pa + b = k(ρ) = k_ρ.
3. Level-1 wild case: exactly one twist comes from weight 2 ≤ k₁ ≤ p + 1 (Theorem 2.5, Prop. 2.7); k₁ − 1 ≡ β − α (Theorem 2.5) and Theorem 2.8 (très ramifiée ⇔ extra p − 1) determine k₁; at p = 2, k₁ = 2 or 3; then w(θ^α f₁) = k(ρ) = k_ρ by Prop. 3.3.
4. Level-1 tame case: via Theorems 3.4, 2.5, 2.6, 2.8, 2.9 and Prop. 2.7 a twist comes from 2 ≤ k₁ < p + 1; for α = β = 0 the weight-one form exists by Theorem 2.9 when ρ is not exceptional.
5. Minimality: if T*_p f = T*_p g = 0 the q-expansions differ by a constant, so k(ρ) = w(f) = w(g) ≤ k; if T*_p g ≠ 0 then k ≤ p + 1 (Gross [10], Proposition 4.12) and a case-by-case check gives k(ρ) ≤ k.

**Acceptance tests.**
- ρ = ρ_{Δ,11}: level-1 wild case with α = 0, β = 1 and ρ_p not finite (Theorem 2.8), so k(ρ) = k_ρ = 1 + 0 + 1 + 10 = 12, the weight of Δ; Δ is already minimal.
- ρ = E[3] for E = 11a1: finite at 3 with det|_I = χ̄, k(ρ) = k_ρ = 2, the weight of 11a1.
- An unramified ρ_p that is not exceptional: k(ρ) = 1 (a Katz form of weight one) while k_ρ = p.

**Dependencies.**
- Inside this roadmap: `R20.3/local-form-of-ordinary-eigenforms`, `R20.3/local-form-of-supersingular-eigenforms`, `R20.3/weight-p-plus-one-and-finiteness`, `R20.3/weight-one-forms-unramified-at-p`, `R20.3/companion-forms`
- On other roadmaps, by node id: `AlgebraicModularFormsAndSerreWeights:R15.3/weight-reduction-to-at-most-p-plus-one`, `AlgebraicModularFormsAndSerreWeights:R15.3/theta-cycles-and-the-small-characteristic-tables`, `AlgebraicModularFormsAndSerreWeights:R15.3/theta-operator-filtration-and-hecke-commutation`, `AlgebraicModularFormsAndSerreWeights:R15.4/edixhoven-weight-k-rho-and-its-comparison-with-serre-k`, `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`

**Sources.**
- Bas Edixhoven, *The weight in Serre's conjectures on modular forms* — 4.5, p. 11 of the DVI. The theorem; its proof follows on pp. 11–12.
- Bas Edixhoven, *The weight in Serre's conjectures on modular forms* — Proof of 4.5, p. 12 of the DVI. Minimality through Gross's Proposition 4.12 and a case-by-case check.
- Bas Edixhoven, *The weight in Serre's conjectures on modular forms* — Introduction, the note after the acknowledgements, p. 3 of the DVI. The Coleman–Voloch consequence for exceptional ρ.

**Remaining in this layer.**
- Gross, "A tameness criterion for Galois representations associated to modular forms (mod p)" (Duke 1990), on which Theorems 2.5, 2.6 (via §6), 2.9 and the minimality step depend, is not read; for p > 2 the source's note says Coleman–Voloch remove its unverified compatibilities, and Coleman–Voloch is not read either.
- Mazur's Eisenstein-ideal paper §6 (Theorem 2.8) is not read; the p = 2 adaptation is taken from Edixhoven.
- The "case by case" check that ends the minimality proof is not displayed in the source.
- Ribet's §3 'Adjustment of the weight' (ribet1994) is read but has no node; it gives the weight statements in the form Ribet uses for level lowering.
- Whether the Coleman–Voloch note is present in the 1992 printing was not checked (the note is in the author's DVI).

### R20.4 — Coefficient-prime level and character

This layer owns the removal of unwanted `ℓ`-power level and the control of the nebentypus, in
the exact ranges of the sources and no wider.

Two statements are planned here. Ribet's Theorem 2.1 strips the `ℓ`-power part of the level:
for `ℓ ≥ 3`, a representation arising from `Γ₁(Nℓ^α)` with `N` prime to `ℓ` arises from
`Γ₁(N)`. Its conclusion is at *some* weight `k ≥ 2` — the statement trades `ℓ`-power level for
an uncontrolled weight, and weight control is R20.3's business, not this layer's. Carayol's
theorem then replaces the nebentypus by any congruent character.

**The character hypothesis is indispensable, and RS-06 says so.** Carayol's theorem holds for
`ℓ ≥ 5`, and the source records counterexamples at `ℓ = 2` and `ℓ = 3`. This is exactly the
distinction RS-06 requires the layer to retain: a residual trivial character is not the same
thing as a characteristic-zero character reducing to one, and a character congruent to `1` need
not be replaceable by `1` when its order is divisible by `ℓ`. The acceptance tests carry that
distinction rather than leaving it in prose.

**Conventions pinned here.** `ε` is the nebentypus of a characteristic-zero eigenform and `ε̄`
its reduction; "congruent" means congruent modulo the fixed place `v` above `ℓ`. Ribet's
Theorem 2.1 is stated with the source's own remark that `ℓ ≥ 3` is assumed principally for
convenience, so `ℓ = 2` is open here rather than false.

**Coverage status: `partial`.**

#### `R20.4/nebentypus-congruent-character` — Changing the nebentypus to a congruent character (Carayol)

*theorem*

Assume ℓ ≥ 5 and let ρ̄ : Gal(Q̄/Q) → GL(2,F) be odd and irreducible. Suppose ρ̄ arises from an eigenform f ∈ S_k(Γ₁(N)) with associated Dirichlet character ε, and let ε' be a character on (Z/NZ)* congruent to ε modulo v. Then ρ̄ arises from an eigenform f' ∈ S_k(Γ₁(N)) whose nebentypus character is ε'. In particular one may normalise the nebentypus within its residue class, and a character congruent to 1 may be replaced by 1 — but only under the stated hypothesis ℓ ≥ 5: the source records counterexamples for ℓ = 2 and ℓ = 3, so a character congruent to 1 need not be replaceable by the trivial character when its order is divisible by ℓ.

**Hypotheses.**
- ℓ ≥ 5
- ρ̄ odd and irreducible
- ρ̄ arises from f ∈ S_k(Γ₁(N)) with nebentypus ε
- ε' a character on (Z/NZ)* congruent to ε modulo v

**Construction or proof, in steps.**
1. Reduce to comparing the two eigensystems attached to ε and ε' inside the same space S_k(Γ₁(N)), using that the diamond operators act through (Z/NZ)*.
2. Use that ℓ ≥ 5 to ensure the residual representations attached to the eigenforms of a given space all arise from eigenforms whose associated character has prime-to-ℓ order, which is the source's reduction.
3. Transfer the residual eigensystem from the ε-eigenspace to the ε'-eigenspace, the two characters being congruent modulo v.
4. Record the failure for ℓ = 2, 3: the source cites counterexamples there, so the hypothesis ℓ ≥ 5 is used and not decorative.

**Acceptance tests.**
- Taking ε' = ε returns f itself.
- For ℓ ≥ 5 and ε congruent to 1, one may take ε' = 1, which is the trivial-nebentypus normalisation the exports use.
- For ℓ = 2 or 3 the statement is not available; an implementation without the ℓ ≥ 5 hypothesis is wrong.
- The weight k and level N are unchanged by the statement.

**Dependencies.**
- Inside this roadmap: `R20.2/serre-level`
- On other roadmaps, by stage id: `AlgebraicModularFormsAndSerreWeights:R15.4`
- On the pinned libraries: `mathlib:DirichletCharacter`, `mathlib:DirichletCharacter.changeLevel`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §1, statement (1.3) Theorem, attributed to Carayol [7, Proposition 3]. The statement of Carayol's theorem on replacing the nebentypus by a congruent character, with the hypothesis ℓ ≥ 5.

#### `R20.4/strip-ell-power-from-level` — Removing the ℓ-power part of the level (Ribet, Theorem 2.1)

*theorem* · planet **Stripping ℓ-power level**

Assume ℓ ≥ 3. Suppose the irreducible odd ρ̄ arises from Γ₁(M), where M = Nℓ^α with (N,ℓ) = 1. Then ρ̄ arises from Γ₁(N). Here 'arises from Γ' means 'arises from the space of weight-k cusp forms on Γ for some k ≥ 2', so the statement trades ℓ-power level for an unspecified weight and does not preserve the weight. It is the step that makes Serre's weak conjecture equivalent to the assertion that ρ̄ arises at some level prime to ℓ, consistently with N(ρ̄) being prime to ℓ. The source notes the hypothesis ℓ ≥ 3 is made principally for convenience and that ℓ = 2 should be analysable without great difficulty, so ℓ = 2 is open here rather than excluded on mathematical grounds.

**Hypotheses.**
- ℓ ≥ 3
- ρ̄ irreducible and odd
- ρ̄ arises from Γ₁(M) with M = Nℓ^α and (N, ℓ) = 1

**Construction or proof, in steps.**
1. Normalise all eigenforms so their Fourier coefficients are their Hecke eigenvalues, and read congruences mod ℓ or mod v as formal congruences of q-expansions; the source fixes this convention before the proof.
2. Run the proof in the independent steps of the concrete techniques of Serre and Queen that the source cites, rather than via the alternative Katz route it mentions.
3. At each step the ℓ-power part of the level drops while the weight is allowed to change; track that the residual representation is unchanged, only the q-expansion congruence class mattering.
4. Conclude that ρ̄ arises from Γ₁(N) for some weight k ≥ 2, with no control claimed on k. Weight control is the separate business of the weight-optimisation layer.

**Acceptance tests.**
- The conclusion is at level N prime to ℓ with the weight not controlled; an implementation claiming the same weight is stronger than this theorem.
- For α = 0 the statement is trivial and returns the hypothesis.
- ℓ = 2 is not covered by the statement as given.
- The residual representation is unchanged, so composing this with the prime-to-ℓ descent of R20.2 is legitimate.

**Dependencies.**
- Inside this roadmap: `R20.2/serre-level`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §2, statement (2.1) Theorem. The statement of Theorem 2.1: for ℓ ≥ 3, if ρ arises from Γ₁(M) with M = Nℓ^α and (N,ℓ) = 1 then ρ arises from Γ₁(N).
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §2, the remark following (2.1) on its proof and on ℓ = 2. The source's remark that ℓ ≥ 3 is assumed principally for convenience and that ℓ = 2 should be analysable without great difficulty, together with the techniques the proof uses.

**Remaining in this layer.**
- The sufficiently-large-p finite-flat weight-two application, which needs FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5 through the request recorded here.
- The justification for excluding p-primary character orders is stated inside the nebentypus node's acceptance tests via the ℓ = 2, 3 counterexamples, but the counterexamples themselves are cited from the source and not reconstructed.

#### The proof of Theorem 2.1, in its four steps, and Theorem 2.2 (third pass)

Ribet proves Theorem 2.1 in four independent steps, each trading ℓ-power level for weight, and follows it
with a partial converse that returns to weight two at level Nℓ. Each step is its own node below, and the
Theorem 2.1 node now depends on all four.

##### `strip-ell-step1` — Stripping ℓ-power level, step 1: twisting away the ℓ-power character

*lemma*

Let ℓ ≥ 3 and let ρ̄ arise from an eigenform f ∈ S_k(Γ₁(M)), M = Nℓ^α with (N, ℓ) = 1 and α > 0. Then ρ̄ arises from Γ₀(ℓ^r) ∩ Γ₁(ℓN) for some r ≥ 0. Writing the character of f as κ = εηω^i, with ε of conductor dividing N, η of ℓ-power order and conductor, and ω the Teichmüller character, one writes η = ξ^{−2} with ξ of ℓ-power order (possible because η has odd order); then f ⊗ ξ has type (k, εω^i), gives rise to ρ̄, and has level Nℓ^r once ℓ^r is divisible by the square of the conductor of ξ. For ℓ ≥ 5 the step also follows from Carayol's theorem, with r = α.

**Hypotheses.**
- ℓ ≥ 3
- k ≥ 2
- M = Nℓ^α, (N, ℓ) = 1, α > 0
- ρ̄ arises from an eigenform in S_k(Γ₁(M)) with character κ

**Proof, in steps.**
1. Decompose κ = εηω^i with ε of conductor dividing N, η of ℓ-power order and ℓ-power conductor, and ω the character of conductor ℓ and order ℓ − 1 congruent to the identity mod v; i is an integer mod ℓ − 1.
2. Since η has ℓ-power order and ℓ is odd, η has odd order, so η = ξ^{−2} for a character ξ of ℓ-power order.
3. Twist: f ⊗ ξ has type (k, εω^i). Because ξ has ℓ-power order it is trivial mod v, so f ⊗ ξ gives rise to ρ̄.
4. Choose r ≥ α with ℓ^r divisible by the square of the conductor of ξ; then f ⊗ ξ has level Nℓ^r.
5. For ℓ ≥ 5, Carayol's theorem gives the same conclusion directly, with r = α.

**Acceptance tests.**
- The twisting character has ℓ-power order, hence trivial reduction, so the residual representation is unchanged.
- The step needs ℓ odd, to write η as a square; that is where ℓ ≥ 3 enters.
- The resulting level Γ₀(ℓ^r) ∩ Γ₁(ℓN) may have r > α: the step trades the character for more ℓ-power level.

**Dependencies.** `R20.4/nebentypus-congruent-character`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §2, proof of (2.1), Step 1, p. 5. The statement of Step 1, that for ℓ ≥ 5 it follows from (1.3) with r = α, and that it holds for all ℓ ≥ 3 by the elementary twisting argument.

##### `strip-ell-step2` — Stripping ℓ-power level, step 2: multiplying by an Eisenstein series congruent to 1

*lemma*

If ρ̄ arises from an eigenform of type (k, εω^i) on Γ₀(ℓ^r) ∩ Γ₁(ℓN), with r > 0, then ρ̄ arises from Γ₀(ℓ^r) ∩ Γ₁(N). With i positive, the Eisenstein series G := L(1−i, ω^{−i})/2 + Σ_n (Σ_{d|n} ω^{−i}(d)d^{i−1}) q^n has type (i, ω^{−i}) on Γ₀(ℓ); its constant term c has negative v-adic order, by the Kummer congruences and the von Staudt theorem, so E := c^{−1}G has v-integral coefficients and E ≡ 1 mod v. Then fE is on Γ₀(ℓ^r) ∩ Γ₁(N) and, mod v, is a nonzero eigenform with the eigenvalues of f, and the Deligne–Serre lifting lemma gives an eigenform there with congruent eigenvalues.

**Hypotheses.**
- ρ̄ arises from an eigenform f of type (k, εω^i) on Γ₀(ℓ^r) ∩ Γ₁(ℓN)
- r > 0
- i a positive integer

**Proof, in steps.**
1. Form G := L(1−i, ω^{−i})/2 + Σ_n (Σ_{d|n} ω^{−i}(d) d^{i−1}) q^n, of type (i, ω^{−i}) on Γ₀(ℓ).
2. The product fG has character εω^iω^{−i} = ε, so it lies on Γ₀(ℓ^r) ∩ Γ₁(N) since r > 0.
3. The constant term c = L(1−i, ω^{−i})/2 has negative v-adic order, by the Kummer congruences and the von Staudt theorem; so E := c^{−1}G is v-integral and E ≡ 1 mod v.
4. Hence fE ≡ f mod v: it is a nonzero mod-v eigenform with the eigenvalues of f, on Γ₀(ℓ^r) ∩ Γ₁(N).
5. Apply the Deligne–Serre lifting lemma to obtain an eigenform on Γ₀(ℓ^r) ∩ Γ₁(N) whose eigenvalues are congruent to those of f.

**Acceptance tests.**
- The multiplier cancels exactly the ω^i part of the character, which is why it is taken of type (i, ω^{−i}).
- The congruence E ≡ 1 mod v rests on the constant term having negative v-adic order; without it the product would not reduce to f.
- The lift is to an eigenform with congruent eigenvalues, not to fE itself, which need not be an eigenform in characteristic zero.

**Dependencies.** `R20.4/strip-ell-step1`, `AlgebraicModularFormsAndSerreWeights:R15.5`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §2, proof of (2.1), Step 2, p. 5. The normalisation E := c^{−1}G ≡ 1 mod v, the conclusion that fE is a nonzero mod-v eigenform with the eigenvalues of f on Γ₀(ℓ^r) ∩ Γ₁(N), and the appeal to the lifting lemma [12, Lemme 6.11].

##### `strip-ell-step3` — Stripping ℓ-power level, step 3: lowering the ℓ-power by Frobenius and U

*lemma*

If ρ̄ arises from an eigenform f = Σ a_n q^n on Γ₀(ℓ^r) ∩ Γ₁(N) with r > 1, then f is congruent mod v to a cusp form of some weight on Γ₀(ℓ^{r−1}) ∩ Γ₁(N); iterating, ρ̄ arises from Γ₀(ℓ) ∩ Γ₁(N). With σ a Frobenius element for v in Gal(K/Q), K a Galois number field containing the a_n, the form g := (σ^{−1}f)^ℓ|U, where U is the ℓ-th Hecke operator, lies on Γ₀(ℓ^{r−1}) ∩ Γ₁(N), and its expansion is congruent mod v to Σ (σ^{−1}a_n)^ℓ q^n, hence to that of f.

**Hypotheses.**
- ρ̄ arises from an eigenform f = Σ a_n q^n on Γ₀(ℓ^r) ∩ Γ₁(N)
- r > 1
- K a finite Galois extension of Q containing the a_n, σ ∈ Gal(K/Q) a Frobenius element for v

**Proof, in steps.**
1. σ^{−1}f := Σ σ^{−1}(a_n) q^n is a normalised eigenform of the same weight, and σa ≡ a^ℓ mod v on the ring of integers of K.
2. Set g := (σ^{−1}f)^ℓ|U. The ℓ-th power raises the weight; applying U lowers the ℓ-level, so g lies on Γ₀(ℓ^{r−1}) ∩ Γ₁(N).
3. Mod v, the ℓ-th power acts on q-expansions by n ↦ ℓn with coefficients raised to the ℓ-th power, and U undoes the index change, so g ≡ Σ (σ^{−1}a_n)^ℓ q^n mod v.
4. Since (σ^{−1}a_n)^ℓ ≡ a_n mod v, g ≡ f mod v.
5. Iterate from r down to r = 1.

**Acceptance tests.**
- The step changes the weight and does not control it.
- It needs r > 1 at each application and stops at level ℓ, i.e. Γ₀(ℓ) ∩ Γ₁(N).
- The Frobenius twist is what makes the ℓ-th power congruent to f rather than to its Frobenius conjugate.

**Dependencies.** `R20.4/strip-ell-step2`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §2, proof of (2.1), Step 3, p. 5. The construction g := (σ^{−1}f)^ℓ|U, that g lies on Γ₀(ℓ^{r−1}) ∩ Γ₁(N), and that its expansion is congruent mod v to that of f.

##### `strip-ell-step4` — Stripping ℓ-power level, step 4: Serre's trace argument to level N

*lemma*

If ρ̄ arises from an eigenform f of character ε on Γ₁(N) ∩ Γ₀(ℓ), then ρ̄ arises from Γ₁(N). With U the ℓ-th Hecke operator, V : Σ a_n q^n ↦ Σ a_n q^{ℓn} and W the Atkin–Lehner-type operator given by an integer matrix of the form (ℓx, y; Nℓz, ℓ) with ℓx − Nyz = 1, the trace Tr(F) := F + ε^{−1}(ℓ)ℓ^{1−w/2} F|W|U carries a form of weight w and character ε on Γ₁(N) ∩ Γ₀(ℓ) to one on Γ₁(N). Taking E the normalised Eisenstein series of weight ℓ − 1 (or E₄ when ℓ = 3), of weight a, the form g := E − ℓ^{a/2}E|W = E − ℓ^a E|V satisfies g ≡ 1 mod ℓ with g|W divisible by ℓ^{1+a/2}, and Tr(f g^i) ≡ f mod ℓ for sufficiently large i.

**Hypotheses.**
- ρ̄ arises from an eigenform f of character ε on Γ₁(N) ∩ Γ₀(ℓ)
- ℓ ≥ 3
- N prime to ℓ

**Proof, in steps.**
1. Recall the operators: U the ℓ-th Hecke operator; V : Σ a_n q^n ↦ Σ a_n q^{ℓn}; W given by (ℓx, y; Nℓz, ℓ) with ℓx − Nyz = 1. W is the inverse of the operator W_Q of Atkin–Li, W = ε(ℓ)W_Q on forms with character ε, and W² is multiplication by ε(ℓ).
2. The trace Tr(F) := F + ε^{−1}(ℓ)ℓ^{1−w/2} F|W|U of a form of weight w and character ε on Γ₁(N) ∩ Γ₀(ℓ) is a form of weight w on Γ₁(N); and for G on Γ₁(N), G|W = ℓ^{w/2}ε(ℓ)G|V.
3. Take E the normalised Eisenstein series of weight ℓ − 1 on SL(2, Z) (E₄ if ℓ = 3), of weight a, so E ≡ 1 mod ℓ, and form g := E − ℓ^{a/2}E|W = E − ℓ^a E|V. Then g ≡ 1 mod ℓ and g|W is divisible by ℓ^{1+a/2}.
4. Tr(f g^i) is a form on Γ₁(N) for every positive integer i.
5. Following Serre's calculation, the term ε^{−1}(ℓ)ℓ^{1−w/2}(f g^i)|W|U is divisible by an increasing power of ℓ as i grows, so Tr(f g^i) ≡ f mod ℓ for i large.

**Acceptance tests.**
- The weight grows with i; like steps 1 and 3, the step gives some weight and does not control it.
- g ≡ 1 mod ℓ is what makes f g^i reduce to f; g|W being divisible by a positive power of ℓ is what makes the second term of the trace vanish mod ℓ for large i.
- ℓ = 3 uses E₄ in place of the weight ℓ − 1 = 2 series, which is not holomorphic.

**Dependencies.** `R20.4/strip-ell-step3`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §2, proof of (2.1), Step 4, p. 6. The conclusion of Step 4: Tr(f g^i) is a form on Γ₁(N) and is congruent to f mod ℓ for i large, following Serre's calculation in [46, §3.2].

##### `weight-two-at-level-n-ell` — Descending to weight two at level Nℓ (Ribet, Theorem 2.2)

*theorem* · planet **Weight two at level Nℓ**

Suppose ρ̄ arises from S_k(Γ₁(N)) with N prime to ℓ and 2 ≤ k ≤ ℓ + 1, and assume ℓ > 3 or N > 3. Then ρ̄ arises from S₂(Γ₁(Nℓ)). This is the partial converse to Theorem 2.1: that theorem removes ℓ-power level at the cost of the weight, and this one returns to weight two at the cost of one factor of ℓ.

**Hypotheses.**
- N prime to ℓ
- 2 ≤ k ≤ ℓ + 1
- ℓ > 3 or N > 3
- ρ̄ arises from S_k(Γ₁(N))

**Proof, in steps.**
1. For ℓ ≥ 5, cite Ash–Stevens's proof by parabolic cohomology.
2. Alternatively follow Serre's approach as worked out by Gross, Proposition 9.3, which allows arbitrary ℓ but assumes N ≥ 4; Gross's §10 extends it to N ≤ 2 with k even.
3. The hypothesis 'ℓ > 3 or N > 3' covers exactly the cases the two sources between them reach.

**Acceptance tests.**
- The weight range 2 ≤ k ≤ ℓ + 1 is a hypothesis and cannot be dropped.
- The conclusion is at level Nℓ, not N: one factor of ℓ is the price of weight two.
- The case ℓ ≤ 3 with N ≤ 3 is not covered by the statement.

**Dependencies.** `R20.4/strip-ell-power-from-level`, `AlgebraicModularFormsAndSerreWeights:R15.5`

**Sources.**
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §2, statement (2.2) Theorem, p. 6. The statement of Theorem 2.2 with its hypotheses.
- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)* — §2, the paragraph following (2.2), p. 6. The two proofs the source cites, and the ranges they cover: Ash–Stevens for ℓ ≥ 5, and Gross's Proposition 9.3 for arbitrary ℓ with N ≥ 4.

### R20.5 — Combined classical optimisation and exceptions

RS-06 keeps this layer whole, and it is where the dyadic prime is handled honestly.

Buzzard's Theorem 2.8 is the mod 2 level-lowering theorem, and it carries five hypotheses, one
of which is a genuine exclusion: **ρ̄ is not induced from `ℚ(i)`**. The source's own Remark (c)
says the induced case is provable "by brute force" and is dealt with separately when the general
level-lowering theorem is proved in its §3. That separate branch is named in the layer's
remaining work; it is not folded into the main theorem, because the main theorem does not cover
it.

The second dyadic matter is a real gap in the literature, not a gap in this plan. When ρ̄
restricted to a decomposition group at 2 has scalar image, the multiplicity-one input is, in the
source's words, not known, and "it is not clear whether one should expect it to be true"; the
source calls it an open question. This layer therefore **registers** the case conditionally and
discharges nothing. RS-06 is explicit about the shape this must take: the gap is recorded here
but completed only by the classical Serre roadmap's late dyadic stage, and this early layer must
*not* acquire a dependency on that stage, since doing so would cycle through the classical
proof. Accordingly the register node is a prerequisite of no export of this roadmap, and its
acceptance tests assert that.

**Conventions pinned here.** `λ` is the place of the coefficient field above 2; "multiplicity
one" is the residual multiplicity-one property at the relevant maximal ideal and is always a
hypothesis, never an assumption made silently; "finite at 2" is the finite-flat condition, which
selects between the two parity hypotheses on `M`.

**Coverage status: `partial`.**

#### `R20.5/buzzard-mod-two-level-lowering` — Level lowering for mod 2 representations not induced from Q(i) (Buzzard, Theorem 2.8)

*theorem* · planet **Mod 2 level lowering**

Let M be a positive integer and p a prime not dividing 2M. Let f ∈ S₂(Γ₁(M) ∩ Γ₀(p); Q̄₂) be a normalised cuspidal eigenform and let ρ̄ be the associated mod 2 Galois representation. Assume ρ̄ is absolutely irreducible and satisfies multiplicity one; that M is odd if ρ̄ is finite at 2, and that 2 divides M exactly once if ρ̄ is not finite at 2; and that ρ̄ is not induced from Q(i). Then there is a normalised eigenform g ∈ S₂(Γ₁(M); Q̄₂) giving rise to ρ̄, and g may be chosen with a₂(g) ≡ a₂(f) mod λ. The hypothesis that ρ̄ is not induced from Q(i) is a genuine restriction of this statement: the induced case is provable by other means and is handled separately in the source's §3.

**Hypotheses.**
- M a positive integer, p a prime with p ∤ 2M
- f ∈ S₂(Γ₁(M) ∩ Γ₀(p); Q̄₂) a normalised cuspidal eigenform
- ρ̄ mod 2 absolutely irreducible and satisfying multiplicity one
- M odd if ρ̄ is finite at 2; 2 ∥ M if ρ̄ is not finite at 2
- ρ̄ not induced from Q(i)

**Construction or proof, in steps.**
1. Reduce to M ≥ 5: if M < 5, use that ρ̄ is not induced from Q(i) to choose an auxiliary prime q > 3 and replace f by an oldform of level Mqp, apply the theorem at level Mq ≥ 5, then descend again; the source notes this situation cannot in fact occur since there are no such forms for M < 5.
2. Choose the auxiliary prime q so that ρ̄(Frob_q) is an involution, following Ribet's Montreal modification; this replaces the classical choice q ≢ 1 mod ℓ, which has serious shortcomings at ℓ = 2.
3. Work with the Jacobians J₁(a,b) of the curves X₁(a,b) = X(Γ₁(a) ∩ Γ₀(b)) and the Hecke correspondences on them.
4. Use the multiplicity-one hypothesis to show that ρ̄ occurs in the relevant Jacobian with multiplicity one, then run Ribet's argument to move the eigensystem off level p.
5. Track the coefficient a₂ through the construction to obtain the congruence a₂(g) ≡ a₂(f) mod λ.

**Acceptance tests.**
- A ρ̄ induced from Q(i) is outside the hypotheses: the theorem must not be applied to it, and the separate §3 analysis is required.
- The conclusion includes the congruence a₂(g) ≡ a₂(f) mod λ, not only the existence of g.
- If ρ̄ restricted to a decomposition group at 2 is contained in the scalars, multiplicity one is not known and the hypothesis fails; nothing is concluded.
- The two parity hypotheses on M are alternatives selected by whether ρ̄ is finite at 2, and a statement carrying only one of them is not this theorem.

**Dependencies.**
- Inside this roadmap: `R20.2/serre-level`, `R20.1/congruence-module`, `R20.1/eigensystem-level-descent`
- On other roadmaps, by stage id: `ModularCurvesPartII:R13.6`, `ModularCurvesPartII:R14.4`

**Sources.**
- Kevin Buzzard, *On level-lowering for mod 2 representations* — §2, Theorem 2.8, hypotheses (p. 6). The hypotheses of Theorem 2.8: M positive, p a prime not dividing 2M, f a normalised cuspidal eigenform in S₂(Γ₁(M) ∩ Γ₀(p); Q̄₂), and ρ mod 2 absolutely irreducible satisfying multiplicity one.
- Kevin Buzzard, *On level-lowering for mod 2 representations* — §2, Theorem 2.8, remaining hypotheses and conclusion (pp. 6–7). The parity hypotheses on M, the exclusion 'assume that ρ is not induced from Q(i)', and the conclusion: a normalised eigenform g ∈ S₂(Γ₁(M); Q̄₂) giving rise to ρ with a₂(g) ≡ a₂(f) mod λ.
- Kevin Buzzard, *On level-lowering for mod 2 representations* — §2, Remark (c) following Theorem 2.8. The source's own statement that the Q(i)-induced case is provable by brute force and is dealt with separately when the general level-lowering theorem is proved in §3.

#### `R20.5/dyadic-scalar-multiplicity-one-obstruction` — The mod 2 scalar local case: multiplicity one unknown, and why it is not assumed here

*theorem*

Let ρ̄ : Gal(Q̄/Q) → GL(2,F̄₂) be irreducible and modular and suppose the restriction of ρ̄ to a decomposition group at 2 is contained in the scalar matrices. Then the multiplicity-one result used in the previous node is not available: the source records that it 'does not appear to be known, and indeed it is not clear whether one should expect it to be true', and calls this an open question. Consequently every statement in this layer that invokes multiplicity one at 2 must carry the non-scalar hypothesis explicitly, and this layer records the scalar case as an obligation discharged elsewhere rather than proving or assuming it. This node is the register of that obligation: it asserts only the conditional shape (if multiplicity one at a scalar local 2 were available, the previous node's proof would extend), and it is deliberately not a prerequisite of any export in this roadmap.

**Hypotheses.**
- ρ̄ mod 2 irreducible and modular
- ρ̄ restricted to a decomposition group at 2 has scalar image
- Khare–Wintenberger I §1 identify the missing case exactly: ρ̄|_{D₂} scalar with non-dihedral projective image; the dihedral case is Wiese's ([42]) and the rest is Buzzard's ([6]); their Theorem 1.2(2) settles it (ClassicalSerreModularity R27.4), without being an input here

**Construction or proof, in steps.**
1. Record the source's statement that in this case the multiplicity-one result is not known and is not clearly to be expected.
2. Isolate exactly where the previous node's proof uses multiplicity one, so that the conditional extension is a precise implication rather than a gesture.
3. State the conditional: granted multiplicity one at m in the scalar case, the argument of Theorem 2.8 applies verbatim to give the level-lowered form.
4. Do not discharge the hypothesis. Name the supplier: the weight-two theorem of the classical Serre roadmap's late dyadic stage, which is the layer that completes this case; this layer must not acquire a dependency on that stage, since doing so would cycle through the classical proof.

**Acceptance tests.**
- The node proves no unconditional statement about the scalar case.
- No export of this roadmap has this node as a prerequisite.
- The conditional implication is stated with multiplicity one as an explicit hypothesis.
- Applying it to a ρ̄ with non-scalar local image at 2 is vacuous, the non-scalar case being covered unconditionally by the previous node.

**Dependencies.**
- Inside this roadmap: `R20.5/buzzard-mod-two-level-lowering`

**Sources.**
- Kevin Buzzard, *On level-lowering for mod 2 representations* — §0 Introduction, the remark on the scalar case. The source's statement that when the restriction of ρ to a decomposition group at 2 is contained in the scalars, the multiplicity one result does not appear to be known and it is unclear whether it should be expected; it remains an open question.
- Chandrashekhar Khare and Jean-Pierre Wintenberger, *Serre's modularity conjecture (I)* — §1, p. 2 (authors' preprint). Khare–Wintenberger's identification of the missing case: ρ̄|_{D₂} scalar with non-dihedral projective image, completed by their Theorem 1.2(2).

**Remaining in this layer.**
- The source's §3 analysis of the Q(i)-induced representations, which Theorem 2.8 explicitly excludes and which RS-06 requires as a separate branch.
- Wiese's assigned weight-one theorem, for the comparison RS-06 asks for. The public Wiese paper obtained ('Dihedral Galois representations and Katz modular forms', arXiv:math/0402163) extracted only partially and the weight-one theorem to compare against has not been pinned.
- Khare–Wintenberger I §1's exception is now read and cited in `R20.5/dyadic-scalar-multiplicity-one-obstruction`: ρ̄|_{D₂} scalar with non-dihedral projective image.
- The exact list of weak-to-classical-strong implications that this layer is to assemble.

### R20.6 — Exports for Serre and elliptic curves

This layer exports what the downstream stages consume, and the maintainer added
Bennett–Siksek to this roadmap precisely for it. The route's own words are that the
reduced-level elliptic specialisation and the removed-prime congruence are *consumer contracts*
of the level and weight optimisation above; this layer states them as such, and it re-plans
neither modularity nor the integral Hecke modules nor the Galois representations.

Three statements are planned. The reduced level `M₀` of an elliptic curve, from Bennett–Siksek
equation (3); the weight-two newform at level `M₀` for `E[ℓ]` irreducible, their Theorem 3; and
the trace congruence at a removed prime, their Lemma 2.1.

**`M₀` is not defined to be the Artin conductor, and that matters.** The paper extraction's own
note warns that `M₀` "is not automatically the prime-to-ℓ Artin conductor when ℓ divides the
elliptic conductor". The definition node therefore keeps the comparison as an obligation in its
API rather than an identity, and the comparison is listed in the layer's remaining work.

**A reading correction is pinned into the definition.** The source explains its notation as
"we write `ord_q(x)` for the largest power of a prime `q` dividing a nonzero integer `x`" — the
largest *power* is `q^{ord_q x}`, whereas the formula uses the *exponent*, as its own use
`ℓ ∣ ord_q(Δ)` shows. The unit test `reducedLevel.test_exponent_not_power` distinguishes the two
readings on a curve with `ord_q(Δ) = ℓ`, so an implementation that follows the phrase literally
fails a test rather than silently computing the wrong level.

**The manifest, not an edge.** RS-06 requires a case table showing how the classical Serre
roadmap supplies the dyadic completion, and requires that the table be a manifest and not a
proof prerequisite of the early exports. The table is listed in this layer's remaining work and
will be written as per-case hypotheses; the full unconditional Serre theorem stays with the
classical roadmap.

**Coverage status: `partial`.**

#### `R20.6/reduced-level-of-elliptic-curve` — The reduced level M₀ of an elliptic curve at ℓ

*definition* · planet **Reduced level M₀**

Let E/Q be an elliptic curve with conductor M and nonzero minimal discriminant Δ, and let ℓ ≥ 3 be a prime. Define M₀ = M / ∏ q, the product being over the primes q with q ∥ M and ℓ ∣ ord_q(Δ), where ord_q denotes the q-adic valuation. Thus M₀ removes from M exactly those primes of multiplicative reduction at which ℓ divides the valuation of the minimal discriminant. M₀ is the level at which the residual representation ρ̄_{E,ℓ} is predicted to arise, but it is not automatically the prime-to-ℓ Artin conductor N(ρ̄_{E,ℓ}): the two may differ when ℓ divides M, and the comparison is a statement to be proved and not a definition.

**Hypotheses.**
- E/Q an elliptic curve of conductor M with minimal discriminant Δ ≠ 0
- ℓ ≥ 3 prime
- q ranges over primes with q ∥ M and ℓ ∣ ord_q(Δ)

**Construction or proof, in steps.**
1. Define ord_q as the q-adic valuation of a nonzero integer. The source's phrase 'the largest power of a prime q dividing a nonzero integer x' describes the power q^{ord_q(x)} rather than the exponent; the exponent is what the formula uses, as its own use ord_q(Δ) shows.
2. Check the product is over a finite set of primes, since only finitely many q divide M.
3. Check M₀ is a positive integer dividing M: each q in the product satisfies q ∥ M, so q divides M exactly once and dividing by it stays integral.
4. Record the relationship to reduction type: q ∥ M means E has multiplicative reduction at q, and ℓ ∣ ord_q(Δ) is the condition making ρ̄_{E,ℓ} unramified at q.
5. Do not identify M₀ with N(ρ̄_{E,ℓ}); state the comparison separately with its hypotheses.

**API.**

| name | role | statement |
|---|---|---|
| `reducedLevel` | constructor | reducedLevel E ℓ : ℕ, the integer M₀ of equation (3). |
| `reducedLevel_dvd_conductor` | relation | reducedLevel E ℓ ∣ conductor E. |
| `reducedLevel_eq_conductor_iff` | characterisation | reducedLevel E ℓ = conductor E ↔ no prime q ∥ M has ℓ ∣ ord_q(Δ). |
| `not_dvd_reducedLevel_of_mult_of_dvd_ord` | characterisation | If q ∥ M and ℓ ∣ ord_q(Δ) then q ∤ reducedLevel E ℓ. |
| `reducedLevel_ne_serreLevel` | compatibility | reducedLevel E ℓ and the prime-to-ℓ Serre level of ρ̄_{E,ℓ} agree under stated hypotheses and may differ when ℓ ∣ M; the comparison is a theorem, not a definitional identity. |

**Unit tests.** A wrong definition fails one of these.

- `reducedLevel.test_dvd` (computation) — reducedLevel E ℓ divides the conductor of E.
- `reducedLevel.test_no_removal` (degenerate) — If no q ∥ M has ℓ ∣ ord_q(Δ) then reducedLevel E ℓ = M.
- `reducedLevel.test_exponent_not_power` (non-example) — On a curve with q ∥ M and ord_q(Δ) = ℓ, the prime q is removed; an implementation reading the source's 'largest power' literally as q^{ord_q(Δ)} does not remove q and fails.

**Where it is used.**
- `SerreWeightAndLevelOptimisation:R20.6/weight-two-newform-at-reduced-level` — M₀ is the level of the newform produced by the source's Theorem 3.
- `SerreWeightAndLevelOptimisation:R20.6/removed-prime-trace-congruence` — The congruence at a removed prime p is stated under p ∤ ℓM₀ and p ∥ M, so it refers to M₀ directly.
- `SerreWeightAndLevelOptimisation:R20.2/serre-level` — M₀ is compared with the prime-to-ℓ Artin conductor; the comparison is what licenses using the optimisation results for elliptic curves.

**Acceptance tests.**
- M₀ divides M, and M₀ = M when no q ∥ M has ℓ ∣ ord_q(Δ).
- M₀ is squarefree-quotient-free in the sense that each removed q divides M exactly once.
- For E of conductor a prime q with ℓ ∣ ord_q(Δ), M₀ = 1.
- A definition using q^{ord_q(Δ)} in place of ord_q(Δ) gives a different and wrong condition; the test at a curve with ord_q(Δ) = ℓ distinguishes them.

**Dependencies.**
- On the pinned libraries: `mathlib:DirichletCharacter`

**Sources.**
- Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums* — §2, equation (3), p. 358. The definition of M₀ as M divided by the product of the primes q ∥ M with ℓ ∣ ord_q(Δ), together with the source's explanation of the notation ord_q.

#### `R20.6/weight-two-newform-at-reduced-level` — Weight-two newform at the reduced level for an elliptic curve (Bennett–Siksek, Theorem 3)

*theorem* · planet **Weight-two newform at level M₀**

Let E/Q be an elliptic curve of conductor M and minimal discriminant Δ, let ℓ ≥ 3 and let M₀ be the reduced level. If E[ℓ] is irreducible then there is a cuspidal newform f = Σ_{n≥1} c_n q^n of weight 2 and level M₀ such that ρ̄_{E,ℓ} ∼ ρ̄_{f,λ}, where λ ∣ ℓ is a prime of the totally real field K = Q(c₁, c₂, …), and where ∼ means that a_p(E) ≡ c_p (mod λ) for almost all primes p. The nebentypus is trivial. This is the export of this roadmap's optimisation results to elliptic curves: the source presents it as a standard consequence of Ribet's level-lowering theorem, originally conditional on modularity of elliptic curves over Q and now a special case of Serre's modularity conjecture.

**Hypotheses.**
- E/Q an elliptic curve of conductor M, minimal discriminant Δ
- ℓ ≥ 3
- E[ℓ] irreducible as a Galois module
- M₀ the reduced level of E at ℓ

**Construction or proof, in steps.**
1. Modularity of E over Q gives a weight-two newform of level M attached to E; this is imported, not proved here.
2. The residual representation ρ̄_{E,ℓ} is irreducible by hypothesis, and unramified at each prime q ∥ M with ℓ ∣ ord_q(Δ), by the theory of the Tate curve at such q.
3. Apply the descent to the Serre level at each such q, using the entry whose hypotheses hold at q, to obtain a weight-two form of level M₀.
4. Identify the coefficient field as totally real and choose λ ∣ ℓ, so that ρ̄_{f,λ} is defined over the residue field at λ and becomes isomorphic to ρ̄_{E,ℓ} after extending both coefficient fields to an algebraic closure of F_ℓ.
5. Unwind ∼ into the trace congruence a_p(E) ≡ c_p (mod λ) for almost all p.

**Acceptance tests.**
- The newform has weight exactly 2 and trivial nebentypus.
- The level is M₀, which may be strictly smaller than M.
- The coefficient field K is totally real and λ lies over ℓ.
- With E[ℓ] reducible the statement is not claimed; irreducibility is a hypothesis and not a conclusion.

**Dependencies.**
- Inside this roadmap: `R20.6/reduced-level-of-elliptic-curve`, `R20.2/descend-to-serre-level`, `R20.4/nebentypus-congruent-character`
- On other roadmaps, by stage id: `EllipticCurveModularity:R29.1`, `AutomorphicGaloisRepresentations:R19.6`
- On the pinned libraries: `tauceti:HeckeRing.GL2.Newform`

**Sources.**
- Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums* — §2, Theorem 3, p. 359. The statement of Theorem 3: a cuspidal newform of weight 2 and level M₀ with ρ_{E,ℓ} ∼ ρ_{f,λ} and λ ∣ ℓ a prime of the totally real field K.
- Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums* — §2, the sentence introducing Theorem 3, p. 359. The source's attribution: a standard consequence of Ribet's level lowering theorem, originally conditional on modularity of elliptic curves over Q, and a special case of Serre's modularity conjecture.

#### `R20.6/removed-prime-trace-congruence` — Trace congruence at a prime removed from the level (Bennett–Siksek, Lemma 2.1)

*theorem*

With E, ℓ, M₀, f and λ as in the previous node, let p be a rational prime. (i) If p ∤ ℓMM₀ then a_p(E) ≡ c_p (mod λ). (ii) If p ∤ ℓM₀ and p ∥ M then p + 1 ≡ ±c_p (mod λ). Part (ii) is the congruence at a prime removed from the level: at such a p the curve has multiplicative reduction, so a_p(E) = ±1 and the Frobenius trace of ρ̄_{E,ℓ} is ±(p+1) rather than a_p(E). It is the form of the comparison that the applications use, and it is stated with p ∤ ℓM₀ rather than p ∤ ℓMM₀, precisely so that the removed primes p ∥ M are included.

**Hypotheses.**
- the situation of the previous node
- p a rational prime
- for (i): p ∤ ℓMM₀
- for (ii): p ∤ ℓM₀ and p ∥ M

**Construction or proof, in steps.**
1. For (i): at p of good reduction prime to the level, compare the traces of Frobenius of ρ̄_{E,ℓ} and ρ̄_{f,λ}, both of which are defined and equal by the isomorphism of residual representations.
2. For (ii): p ∥ M means E has multiplicative reduction at p; the Tate parametrisation gives ρ̄_{E,ℓ}|_{D_p} as an extension whose Frobenius trace is ±(p+1) modulo ℓ.
3. Since p ∤ M₀, the form f is unramified at p, so c_p is the Frobenius trace of ρ̄_{f,λ} at p.
4. Equating the two traces modulo λ gives p + 1 ≡ ±c_p (mod λ); the sign records which of the two unramified quotients occurs.
5. Keep the two parts separate: their hypotheses on p differ, and (ii) applies to primes excluded from (i).

**Acceptance tests.**
- The two parts have different hypotheses on p: (i) excludes p ∣ M, (ii) includes the primes p ∥ M.
- In (ii) the sign is genuinely ambiguous; a statement fixing the sign is stronger than the source and is not licensed.
- For p of good reduction and p ∤ ℓMM₀, (i) applies and gives the direct congruence on a_p(E).
- Applied at p ∣ M₀ neither part applies.

**Dependencies.**
- Inside this roadmap: `R20.6/weight-two-newform-at-reduced-level`, `R20.6/reduced-level-of-elliptic-curve`

**Sources.**
- Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums* — §2, Lemma 2.1(i) and (ii), p. 359. The statement of both parts of Lemma 2.1, including (ii): if p ∤ ℓM₀ and p ∥ M then p + 1 ≡ ±c_p (mod λ).

**Remaining in this layer.**
- The case table showing how the classical Serre roadmap supplies the dyadic completion. RS-06 requires it as a manifest that is not a proof prerequisite of the early exports, so it must be written as a table with per-case hypotheses rather than as an edge.
- The conditional cases needed inside the downstream stages R22, R26, R27 and R33, each to be stated with the hypotheses that consumer has proved.
- The comparison of the reduced level M₀ with the prime-to-ℓ Artin conductor, stated as an obligation in the M₀ node's api but not yet proved; the paper extraction's own note warns they need not agree when ℓ divides the elliptic conductor.

## Requests to other roadmaps

Each entry names a supplier stage and the precise statement needed. Nothing in this list is
planned here.

- **`tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`** — The finitely generated integral Hecke module of modular symbols and the integrality and commutativity of the Hecke action on it (that roadmap's HeckeSymbol, HeckeCommute, HeckeFinite milestones), together with the coefficient field as a number field. R20.1 consumes this lattice; it does not construct one, and in particular it does not construct a lattice inside a space of forms, which that roadmap rules out by design.
- **`ModularCurvesPartII:R14.2`** — The integral cuspidal Hecke module of X₁(M,p) with its Hecke action, as a module over the integral Hecke algebra, together with the integral structure needed to state saturation. R20.1 consumes this rather than constructing it; the library supplies only the complex cusp-form spaces.
- **`ModularCurvesPartII:R14.3`** — The degeneracy maps between integral Hecke modules at levels M and Mp, with their equivariance for T_n at n prime to p, as needed for the integral old/new sequence.
- **`ModularCurvesPartII:R14.4`** — The integral Ihara theorem, in the precise form giving injectivity of the map from two copies of level M into level Mp. RS-06 names this as the import for R20.1; the exact statement must be pinned so that the old/new sequence's left-exactness step can cite it.
- **`ModularCurvesPartII:R13.6`** — The bad-fibre geometry of the modular curves at a prime exactly dividing the level: the reduction type, the dual graph and the character group of the toric part of the Jacobian's Neron model, with its Hecke action. Used by Mazur's Principle and by Theorem 1.5.
- **`NeronModelsAndSemistableAbelianVarieties:R11.4`** — The semistable Picard and character-group theory, including the monodromy pairing on the character group of the toric part, which the level-lowering proofs use in place of a multiplicity-one hypothesis.
- **`AlgebraicModularFormsAndSerreWeights:R15.5`** — The eigenvalue-lifting theorem, together with its module and base-change hypotheses stated explicitly, so that R20.1 can check them before applying it as RS-06 requires.
- **`AlgebraicModularFormsAndSerreWeights:R15.4`** — The extension-sensitive classical weight and the nebentypus conventions at a coefficient prime, applied rather than rederived by R20.4.
- **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`** — The local finite-flat criterion at p, in the form needed for the sufficiently-large-p weight-two application of R20.4.
- **`EllipticCurveModularity:R29.1`** — Modularity of an elliptic curve over Q at the level of its conductor, and residual irreducibility for a fixed curve, both consumed by the R20.6 export and not proved here.
- **`AutomorphicGaloisRepresentations:R19.6`** — The residual representation attached to a newform at a prime λ of its coefficient field, with the Frobenius trace identity, used to state the R20.6 comparison.
- **`HilbertModularVarietiesAndShimuraCurves:R18.6`** — The Shimura curve attached to a quaternion algebra of discriminant pq with Γ₀(M)-type level structure, its Jacobian, and the Čerednik–Drinfeld description of its reduction at p and q as semiabelian with genus-zero components, together with the character groups of the toric parts and the Hecke action on them. R20.2's exact sequence consumes this; it is not constructed here.
- **`GL2AutomorphicRepresentationsAndTransfer:R17.6`** — Langlands's local-global compatibility at a prime q where the automorphic representation is special, in the form π = α ⊗ sp with α unramified and ρ_λ|D_q an extension of α by αχ̃, whose residual semisimplification is ᾱ ⊕ ᾱχ. This is what gives the easy direction of Diamond's level-raising criterion and is applied rather than proved here.
- **`NeronModelsAndSemistableAbelianVarieties:R11.3`** — Semistable reduction of an abelian variety and the structure of the Néron fibre at a prime of bad reduction as an extension of a finite component group by a connected group with toric part, together with good reduction away from the level. R20.2's character-group nodes consume this structure; R11.4 supplies the character groups and the monodromy pairing on top of it.

## Gaps

Recorded rather than papered over.

- **Edixhoven 1992 read from the author's DVI; the results it rests on (Gross, Mazur) are not read.** Resolved in part (Claude Code cc-fb70e5): the author's DVI of Edixhoven's paper is public at his Leiden page (weight.dvi, SHA-256 ff106eeb…, the file AlgebraicModularFormsAndSerreWeights also uses), and R20.3 is now planned from it. Its Theorem 4.5 is the optimisation theorem RS-06 names, and its Theorem 2.8 is Mazur's weight-p + 1 theorem, which is the numbering Buzzard cites. Still open: Gross, 'A tameness criterion…' (Duke 1990), on which Theorems 2.5, 2.9, the §6 proof of 2.6 and the minimality step depend, and Mazur's Eisenstein-ideal §6 (Theorem 2.8), are not read; Edixhoven's note records that Coleman–Voloch remove the dependence on Gross's unverified compatibilities for p > 2, and Coleman–Voloch is not read either.
- **Khare–Wintenberger I §1's exception, read from the authors' preprint.** Resolved (Claude Code cc-fb70e5): the authors' preprint is public (UCLA, SHA-256 3c389dc3…). §1 states that Theorem 1.2(2) 'completes the work that the qualitative form of Serre's conjecture implies the refined form by filling in a missing case in characteristic 2: control of the level for ρ̄|D2 scalar when the projective image of ρ̄ is not dihedral (see [6] and [42])', with [6] Buzzard and [42] Wiese. This is exactly the case of R20.5/dyadic-scalar-multiplicity-one-obstruction, which now cites it. Remaining for R20.5: the Q(i)-induced branch of Buzzard §3 and Wiese's weight-one theorem.
- **Serre 1987 obtained; the level formula now cited to Serre as well as Ribet.** Resolved (Claude Code cc-fb70e5): the Collège de France PDF of Serre's paper is public (SHA-256 8048919d…, the file AlgebraicModularFormsAndSerreWeights uses). Its (1.2.1) is the formula of R20.2/serre-level and (1.2.3) defines N; the node now cites both. The weight recipe k(ρ) is planned in AlgebraicModularFormsAndSerreWeights R15.4 from Serre §2, which R20.3 imports.
- **check_blueprint reads a Tau Ceti anchor stage id as a baseline declaration.** The ModularForms layer-8 import is recorded as a request and not as a node prerequisite, because it cannot be both. check_blueprint resolves a node prerequisite by testing BASE_REF = ^(mathlib|tauceti):(\S+)$ before testing membership in the atlas stage set, so the anchor stage id 'tauceti:TauCetiRoadmap/ModularForms#layer-8-...' matches the baseline pattern and is reported as 'baseline prerequisite ... is not listed in baseline.declarations'. Any packet importing from a Tau Ceti anchor layer will hit this, so anchor-layer imports are expressible only through `requests`. The dependency is therefore real but is not in the prerequisite graph; a reviewer should read the requests list alongside the node prerequisites.
- **No library-coverage audit exists for any layer of this roadmap.** data/library-coverage.json has entries for 1316 atlas stages and none of R20.1–R20.6 is among them, so there is no reviewed verdict to plan against. The baseline determinations in this packet were made by indexing the pinned trees directly (mathlib 082e2d37, 8482 .lean files; tauceti f790474, 5477 .lean files, 70802 indexed declarations) and reading the cited statements in source. Three probes gave false cleans before being corrected: 'HeckeAlgebra' and 'HeckeOperator' return 0 while 'Hecke' returns 1186; 'newSpace' returns 0 while the new subspace exists as TauCeti.cuspFormsNew; and 'characterGroup' returns 47 hits that are the character group of a split torus, not the character group of the toric part of a Jacobian's bad fibre. A reviewer should repeat searches under several descriptions.

## Structure proposal

- **rescope** (SerreWeightAndLevelOptimisation, tauceti:TauCetiRoadmap/ModularForms). RS-06's entry for R20.1 narrows the layer to 'Own integral old/new exact sequences and congruence-module applications with localisation, saturation, and controlled-level passage' and says to 'Import actual integral curve Hecke modules and the R14.4 Ihara theorem'. Its suppliedBy list names ModularForms layers 3 and 4 (the Petersson product with oldforms and newforms; eigenforms, newforms and the conductor) together with ModularCurvesPartII R14.2-R14.4 and AlgebraicModularFormsAndSerreWeights R15.5. But layers 3 and 4 of ModularForms are characteristic-zero analytic layers: the library realises them as Submodule over C via the Petersson inner product, which is what this packet's baseline entries for cuspFormsOld, cuspFormsNew and isCompl_cuspFormsOld_cuspFormsNew record. The integral Hecke module that R20.1 actually needs is planned in ModularForms **layer 8**, 'modular symbols, the integral Hecke algebra, and coefficient fields', which builds the finitely generated integral Hecke module of modular symbols and proves the integrality and commutativity of the Hecke action on it. Layer 8 is absent from RS-06's suppliedBy list for R20.1.

  *Proposal.* Add the ModularForms layer-8 stage to the suppliedBy list of the RS-06 entry for SerreWeightAndLevelOptimisation:R20.1, as the supplier of the integral Hecke module and the integral Hecke action; keep layers 3 and 4 as the suppliers of the characteristic-zero old/new and newform theory that they in fact provide. This packet already records the import as a request and as a prerequisite edge, so no planning changes here; the proposal is to make the restructuring's supplier list match where the integral structure is planned. Note also layer 8's design constraint, that no lattice inside the space of forms is ever constructed, which is why R20.1's integral module is stated on the symbol and homology side.

## Ordering — the dependency graph

Within the roadmap the order is the stage order: R20.1 supplies the integral algebra; R20.2
proves the descent; R20.4 removes the `ℓ`-power level and controls the character; R20.5
assembles the classical cases and registers the dyadic exceptions; R20.6 exports. R20.3 sits
between R20.2 and R20.4 in the stage order and is not planned in this pass.

The one ordering constraint that is a design decision rather than a consequence: the dyadic
scalar register in R20.5 is a prerequisite of **no** export, so that the early exports of
R20.6 do not depend on the late dyadic completion. Making it a dependency would cycle through
the classical proof.

## Sources

- Kenneth A. Ribet, *Report on mod ℓ representations of Gal(Q̄/Q)*. Motives (Seattle, WA, 1991), Proc. Sympos. Pure Math. 55, Part 2, Amer. Math. Soc. (1994), 639–676. Author's copy, 31 pp.; locators are to the numbered statements, which the author's pagination preserves.
  <https://math.berkeley.edu/~ribet/Articles/motives.pdf>, read 2026-09-24.
- Kevin Buzzard, *On level-lowering for mod 2 representations*. Math. Res. Lett. 7 (2000), 95–110. Author's copy, 'Version of 1 Oct 1999', 11 pp. Read from the author's DVI: the author's PDF is a dvips Type3 bitmap with no recoverable text layer.
  <https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/note.dvi>, read 2026-09-24.
- Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums*. Annals of Mathematics 191 (2020), no. 2, 355–392, doi:10.4007/annals.2020.191.2.2. Publisher PDF, 38 pp.
  <https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf> (sha256 `3920a7524a378709…`), read 2026-09-24.

- Bas Edixhoven, *The weight in Serre's conjectures on modular forms*. Invent. Math. 109 (1992), 563–594. Author's DVI dated 24 December 1998; DVI page numbers are used as locators.
  <https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi> (sha256 `ff106eeb48c67949…`), read 2026-09-29.
- Chandrashekhar Khare and Jean-Pierre Wintenberger, *Serre's modularity conjecture (I)*. Invent. Math. 178 (2009), 485–504. Authors' preprint.
  <https://www.math.ucla.edu/~shekhar/papers/results.pdf> (sha256 `3c389dc33e09fe84…`), read 2026-09-29.
- Jean-Pierre Serre, *Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)*. Duke Math. J. 54 (1987), 179–230. Collège de France PDF; printed page = PDF page + 178.
  <https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf> (sha256 `8048919db24dcb97…`), read 2026-09-29.

The three sources listed earlier as unobtainable are public in these author and institutional copies. The earlier sentence to that effect is withdrawn.
