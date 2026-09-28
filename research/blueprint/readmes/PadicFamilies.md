# Hida and Coleman families, period modules, and family L-functions — blueprint

This blueprint covers stages L0, L0a, L1, L2, L2a, L3, L4 and L5. After the fourth checkpoint:
- **L0a is source-decomposed.**
- **L2a is partial:** it carries the fourteen reviewed nodes of the integrated decomposition.
- **L0 is partial:** Hida's ordinary Hecke algebra and control theorem, from Hida, Ann. Sci. ÉNS 1986.
- **L3 is partial:** critical-slope and θ-critical theory, from Bellaïche, *Critical p-adic L-functions*.
- **L5 is partial:** Hida theory on the definite quaternionic towers of a totally real field, from Skinner–Wiles,
  Publ. Math. IHÉS 89 (1999), §3.2.
- **L1, L2 and L4 are not yet read.**

The roadmap belongs to the restructured family RS-08, whose accepted proposal fixes what each layer keeps.
- **L0a** owns the finite and profinite factorial ordinary-projector API "beyond the pinned Fitting lemma".
  - OrdinaryAutomorphicFormsAndModularityLifting R21.1 imports it.
  - So do PotentialAutomorphyInfrastructure PA.2 and AutomorphicCongruences L2s.
- **L2a** is the group-independent eigenvariety machine. AutomorphicGaloisRepresentationsPartII AG2.3 and the
  modular instance L2 apply it.

The L0a sources are:
- **Khare–Thorne:** *Potential automorphy and the Leopoldt conjecture*, arXiv:1409.7007v2, §2.4, Lemmas 2.10–2.15.
- **Hida:** *Iwasawa modules attached to congruences of cusp forms*, Ann. Sci. ÉNS 19 (1986), §1. It is open
  access on Numdam.
- **ACC+:** *Potential automorphy over CM fields*, arXiv:1812.09999v2, §§5.1–5.2.

The L2a source is Buzzard, *Eigenvarieties* (author manuscript, 2006), §§4–5. It is read together with:
- Conrad, *Modular curves and rigid-analytic spaces*, Appendix A.1;
- Chenevier, *Familles p-adiques de formes automorphes pour GL_n*, §6.4;
- Coleman–Mazur, *The eigencurve*, §1.3.

## Purpose

Hida theory rests on one elementary construction: the ordinary projector e = lim U^{n!} of a Hecke operator U.
- **L0a** builds it once, for every module on which it makes sense:
  - finite modules, by a finite-set argument;
  - modules presented as inverse limits of finite quotients;
  - finite modules over a noetherian local ring with finite residue field;
  - complexes, perfect complexes in the homotopy category, and towers of perfect complexes over R/I_c.
- **L0 and L5** instantiate it on modular and Hilbert modular forms and cohomology.
- **R21.1 and PA.2** apply it to Hecke complexes.

L2a turns a compact operator φ on (Pr) Banach modules over the affinoids of a weight space into an eigenvariety. The
steps are:
1. the Fredholm spectral variety;
2. an admissible cover by finite flat slope blocks;
3. the finite Hecke algebras of the blocks;
4. the gluing.

L2 applies L2a to overconvergent modular symbols, and AG2.3 to definite unitary groups.

## What the libraries and other roadmaps supply

The reviewed library audit AUDIT-15 records:
- **L0a: partly built.** Mathlib has the Fitting decomposition, but not the factorial projector, the profinite
  projector, exactness or the complex-level statements.
- **L2a: not built.**

**Mathlib has:**
- the Fitting decomposition of an endomorphism of an Artinian and Noetherian module
  (`LinearMap.isCompl_iSup_ker_pow_iInf_range_pow`, `LinearMap.eventually_isCompl_ker_pow_range_pow`), with the
  stabilisation lemmas `LinearMap.eventually_iInf_range_pow_eq` and `LinearMap.eventually_iSup_ker_pow_eq`;
- `isArtinian_of_finite`, the Noetherian instance for finite modules, and
  `IsArtinian.bijective_of_injective_endomorphism`;
- idempotents and projections (`IsIdempotentElem`, `LinearMap.isProj_iff_isIdempotentElem`,
  `LinearMap.linearProjOfIsCompl`);
- localization of modules (`LocalizedModule`, `IsLocalizedModule`) and the R[X]-module `Module.AEval'` attached to
  an endomorphism;
- finiteness of R/mⁿ over a noetherian local ring with finite residue field (`Ideal.finite_quotient_pow`,
  `IsLocalRing.finite_quotient_iff`) and adic completeness (`IsAdicComplete`);
- sections of cofiltered systems of finite sets (`nonempty_sections_of_finite_cofiltered_system`);
- complexes, homology maps and the homotopy category (`HomologicalComplex`, `HomologicalComplex.homologyMap`,
  `HomotopyCategory`).

**Tau Ceti has** nothing specific to L0a or L2a (AUDIT-15: no ordinary projector, eigenvariety or Fredholm
hypersurface).

**Imported from other packets (cited node ids):**
- **AdicSpacesPartII F0:** `finite-module-inverse-limit`. Finite modules over an adic noetherian ring are
  separated and complete, and every linear map between them is continuous.
- **ArithmeticGaloisDuality R02.1:** `milnor-sequence` and `mittag-leffler-lim-one`, giving cohomology of towers
  of complexes.
- **LocallyAnalyticDistributions L4 (for L2a):**
  - the Fredholm determinant and its theory on (Pr) modules (`fredholm-determinant`, `entire-series`,
    `projective-banach-modules`, `summand-fredholm-theory`, `completed-base-change`);
  - the cyclic identity det(1 − Xuv) = det(1 − Xvu) (`cyclic-determinant-identity`);
  - Riesz slope summands and their Hecke stability (`finite-slope-summands`, `riesz-commuting-stability`);
  - resultants (`entire-resultants`, `resultant-unit`).

- **OrdinaryAutomorphicFormsAndModularityLifting R21.1 (for L5):** the ordinary projector on definite quaternionic
  forms and the towers M_∞, H_∞ (`quaternionic-ordinary-projector`, `quaternionic-nearly-ordinary-hecke-algebra`,
  `ordinary-level-independence`, `ordinary-towers-duality`). RS-08 gives the arithmetic application of the projector to
  that roadmap, and L5 proves Hida's theorems on its modules.
- **PadicMeasuresIwasawaAlgebras L1 (for L5):** the completed group ring (`convolution-algebra`).

**Requested (stage suppliers):**
- **HilbertModularVarietiesAndShimuraCurves R18.3 (for L5):** free action after an auxiliary prime (Skinner–Wiles
  Lemma 3.5, Corollary 3.6), and invariants of the quaternionic sets under free action.
- **GL2AutomorphicRepresentationsAndTransfer R16.6 (for L5):** Hilbert cusp forms of parallel weight with their newforms.
- **DeformationAndDerivedPatchingAlgebra P7:**
  - minimal complexes (Khare–Thorne Lemma 2.3);
  - gluing of good complexes and of homotopy classes along R/I_c (Lemmas 2.13–2.14).
- **AdicSpacesPartII R0:** Tate algebras, affinoid products and Weierstrass preparation (Buzzard Lemma 4.1).
- **AdicSpacesPartII R2:** admissible formal models with the Bosch–Lütkebohmert flattening theorems (Conrad
  A.1.2).
- **AdicSpacesPartII R3:** finite coherent algebras, affinoid restriction and coherent descent.
- **PadicMeasuresIwasawaAlgebras L0a:** the rigid weight space with its affinoid restriction maps.

## Conventions

- **Modules and endomorphisms.**
  - U ∈ End_R(M) is R-linear; R need not be commutative except where localization at U is used.
  - "Finite module" in L0a means finite as a set, unless it is said to be a finite R-module.
- **The projector.**
  - e_U = U^{m!} with m = |M| for finite M.
  - In general e_U = lim U^{n!}, a pointwise limit, with the explicit threshold n ≥ |M/J| modulo J.
  - M_ord = e_U M and M_nord = ker e_U = (1 − e_U)M.
- **Finite quotient systems.**
  - They are downward-directed families of U-stable submodules J with finite M/J, separated and complete.
  - Continuity of a map means: for every K there is J with f(J) ⊆ K.
- **Complexes.** Khare–Thorne's conventions apply:
  - *good* complexes are bounded with finite projective terms;
  - *minimal* complexes are good with differentials zero modulo m;
  - End_{K(R)}(C) = End_{D(R)}(C) for good C.
- **Eigenvarieties.** Buzzard's conventions apply:
  - K is complete for a nontrivial nonarchimedean absolute value, and R is a reduced K-affinoid with its supremum
    norm;
  - the spectral coordinate T is the reciprocal of a nonzero φ-eigenvalue;
  - radii r lie in the divisible closure of |K×|;
  - logarithmic radii are kept distinct from radii (see E1).

## Milestones

Library modules:
- L0a: `TauCeti/NumberTheory/PadicFamilies/{OrdinaryProjector, OrdinaryComplex}`, namespace `TauCeti.PadicFamilies`.
- L2a: `TauCeti/NumberTheory/PadicFamilies/Eigenvariety`, namespace `TauCeti.PadicFamilies.Eigenvariety`.

### L0, Milestone 0: Hida's ordinary Hecke algebra

The source is Hida, *Iwasawa modules attached to congruences of cusp forms*, Ann. Sci. ÉNS 19 (1986), §§1–5 and §7, from
the Numdam scan.

**Definition: Katz's p-adic modular functions** (node `katz-padic-modular-functions`; planet "Katz p-adic modular
forms").
- V(N; A) consists of functions on trivialised elliptic curves with level structure over p-adic A-algebras.
- W(N; A) consists of those that are integral at the Tate curves.
- **The q-expansion principle** (1.8): the q-expansion is injective with A-flat cokernel.
- **Level:** V(N₀pʳ; A) = V(N₀; A).
- *Unit tests.*
  - E_{p−1} ≡ 1.
  - The p-power part of the level is absorbed.
  - A p-adic limit of Eisenstein series lies in no single classical weight.

**Theorem: the p-adic closure of classical forms** (node `padic-completion-of-classical`; Katz's Theorem 1.1 and
Corollary 1.2).
- W(N; ℤ_p) is the p-adic closure of the classical forms of all weights.
- Modulo p, W ≅ G/(E_{p−1} − 1).

**Construction: Hecke operators and the weight action** (node `padic-hecke-operators`; (1.12)–(1.13)).
- T(ℓ) and T(ℓ, ℓ) act on p-adic forms by Hida's q-expansion formulas.
- The group Z = ℤ_p^× × (ℤ/N₀)^× acts continuously.
- **Unit tests.**
  - U_p fixes E₂^{(p)}.
  - T(ℓ) is classical on each weight.
  - Γ acts on weight k by z^k.

**Construction: the universal Hecke algebra** (node `universal-hecke-algebra`; planet "Hida's universal Hecke algebra";
(1.14)–(1.15)).
- H(N; 𝒪) = lim_j H_j(N; 𝒪) is compact.
- It is independent of the power of p in N.
- *API.*
  - `universalHecke`.
  - `universalHecke_compact`.
  - `universalHecke_level_indep`.
  - `universalHecke_restrict`.

**Construction: the ordinary idempotent** (node `ordinary-idempotent-hecke`; (1.17)).
- e = lim T(p)^{n!} in H(N; 𝒪), an instance of L0a's `ordinary-idempotent-finite-algebra` on each finite H_j.
- It is compatible with the limit.
- *Unit tests.*
  - p = 11 fixes Δ, since τ(11) ≡ 1 mod 11.
  - p = 2 kills Δ.
  - e fixes E_k^{(p)}.

**Theorem: duality** (node `hecke-duality`; Proposition 2.1, Theorem 2.2, Corollary 2.3).
- H_j ≅ Hom(M_j, A) via a(1, f|h).
- For p ≥ 5, H(N; ℤ_p) and M(N; ℚ_p/ℤ_p) are Pontryagin dual.
- The ordinary parts are dual.

**Construction: the weight algebra** (node `weight-algebra-action`).
- Λ = 𝒪[[1 + pℤ_p]] ≅ 𝒪[[X]] acts through the weight action.
- The arithmetic points are P_k = (1 + X) − (1 + p)^k.
- H^ord = ⊕_{a mod p−1} H^ord(N, a).

**Lemma and theorems:**
- `jochnowitz-lemma` (Lemma 4.1): U_p kills M_{k+p−1}/M_k mod p for k ≥ 3.
- `ordinary-mod-p-weight-independence` (Theorem 4.2): the ordinary mod-p forms live in weights j(a) ∈ [3, p + 1].
- `ordinary-finite-over-lambda` (Corollary 4.2): H^ord is finite over Λ, by duality and topological Nakayama.

**Theorem: Hida's control theorem** (node `hida-control-theorem`; planet; Theorem 3.1 and Corollary 3.2). For p ≥ 5
and p | N:
- H^ord and h^ord are free of finite rank over Λ;
- H^ord(N, a)/P_k ≅ H_k^ord(Γ₁(N₀p), ω^{a−k}) for k ≥ j(a);
- h^ord(N, a)/P_k ≅ h_k^ord for k ≥ 2.

**Construction: the ordinary Eisenstein family** (node `ordinary-eisenstein-family`). It is built from
DirichletPadicLFunctions L4's measure-valued q-expansion (RS-08).
- Its specialisation at P_k is E_k^{(p)}(ψω^{−k}).
- U_p = 1.
- Its constant term is the Kubota–Leopoldt pseudomeasure.
- *Unit tests.*
  - 691 divides the constant term at k = 12.
  - U_p = 1.
  - The q¹-coefficient is 1.

**Theorem: classical specialisation** (node `arithmetic-specialization`; planet).
- Arithmetic specialisations of Λ-adic ordinary eigenforms are classical ordinary eigenforms of weight k, level N₀pʳ and
  nebentypus ω^{a−k}.
- Oldforms at p enter through the unique unit-root p-stabilisation (ModularSymbolsPadicLFunctions L2).

### L0a, Milestone 1: the finite projector

**Lemma: factorial iterates stabilise** (`iterate_factorial_eq_of_card_le`, `iterate_factorial_idempotent`;
node `factorial-iterate-stabilises`). Let f : X → X with |X| = m. Then:
- f^[n!] = f^[m!] for every n ≥ m;
- e = f^[m!] is idempotent, with image the eventual image ⋂ f^[k](X);
- f is a bijection of that image, with inverse f^[m! − 1].

*Proof.* Every orbit enters a cycle of length ℓ ≤ m after at most m steps, and ℓ divides n! for n ≥ m. No group order
is inverted.

**Definition: the ordinary projector** (`ordinaryProjector`; node `finite-ordinary-projector`; planet "Ordinary
projector"; Khare–Thorne Lemma 2.10, Hida (1.17)). For an R-module M finite as a set and U ∈ End_R(M),
e_U := U^{|M|!}.

*API.*
- `ordinaryProjector_eq_pow_factorial`: e_U = U^{n!} for n ≥ |M|.
- `isIdempotentElem_ordinaryProjector`.
- `commute_ordinaryProjector`.
- `ordinaryProjector_of_isUnit`: e_U = 1.
- `ordinaryProjector_of_isNilpotent`: e_U = 0.
- `ordinaryPart` and `nonOrdinaryPart`.

*Unit tests.*
- Multiplication by 2 on ZMod 6 has e = multiplication by 4, the projection onto the ZMod 3 factor. A definition
  "1 if U is invertible, else 0" fails this test.
- Multiplication by 2 on ZMod 8: M_ord = 0.
- Multiplication by 3 on ZMod 8: M_ord = M.
- e_1 = 1.
- range e_U = ⨅ range Uⁿ and ker e_U = ⨆ ker Uⁿ (Mathlib's Fitting decomposition).

**Lemma: the Fitting comparison** (`ordinaryPart_eq_iInf_range_pow`, `nonOrdinaryPart_eq_iSup_ker_pow`; node
`finite-fitting-comparison`). e_U is the projection onto ⨅ range Uⁿ along ⨆ ker Uⁿ in
`LinearMap.isCompl_iSup_ker_pow_iInf_range_pow`.

**Lemma: invertible and nilpotent parts** (`bijOn_ordinaryPart`, `pow_pred_mul_eq_on_ordinaryPart`,
`pow_card_apply_nonOrdinaryPart`; node `ordinary-part-bijective`).
- U is an automorphism of M_ord, with inverse U^{m! − 1}.
- U^m = 0 on M_nord.

**Theorem: uniqueness of the decomposition** (`ordinaryPart_unique`; node `finite-ordinary-decomposition-unique`;
planet "Ordinary and non-ordinary parts"; Khare–Thorne Lemma 2.10(1)).
- **The decomposition.** M = M_ord ⊕ M_nord, with U bijective on M_ord and nilpotent on M_nord.
- **Uniqueness.** If M = A ⊕ B with U(A) = A and B killed by powers of U, then A = M_ord and B = M_nord.

*Proof.* A ⊆ ⨅ range Uⁿ and B ⊆ ⨆ ker Uⁿ, then count.

**Lemma: naturality** (`ordinaryProjector_comp_of_comp_eq`; node `ordinary-projector-natural`; Khare–Thorne Lemma
2.10(2)). If f U₁ = U₂ f, then f e_{U₁} = e_{U₂} f.

*Proof.* Use one exponent n! with n ≥ max(|M|, |N|).

**Theorem: exactness** (`ordinaryPart_exact`, `map_ordinaryPart_of_surjective`; node `ordinary-projector-exact`;
Khare–Thorne Lemma 2.11). Take U-equivariant maps f : M′ → M and g : M → M″, exact at M. Then:
- ker g ∩ M_ord = f(M′_ord);
- if g is surjective, then g(M_ord) = M″_ord.

**Lemma: quotients** (`ordinaryPart_quotient`; node `ordinary-projector-quotient`; Khare–Thorne Lemma 2.10(3)).
- (M/P)_ord is the image of M_ord.
- (M/IM)_ord = M_ord/I M_ord.

**Comparison: localization** (`bijective_ordinaryPart_localizedModule`, `comp_ordinaryProjector_of_bijective`; node
`ordinary-part-localization`; ACC+, proof of Proposition 5.2.15). Let R be commutative.
- M_ord → M[U⁻¹] is an isomorphism, where M[U⁻¹] is the localization of the R[X]-module M, with X acting by U, at
  the powers of X.
- Emerton's localization definition of ordinary parts therefore agrees with the summand definition at finite level.

### L0a, Milestone 2: profinite modules and the adic instance

**Definition: finite quotient systems** (`FiniteQuotientSystem`; node `finite-quotient-system`). A downward-directed
family (J_i) of submodules of M such that:
- each J_i is U-stable;
- each M/J_i is finite;
- ⋂ J_i = 0;
- every compatible family of residues is represented by one x ∈ M, so M = lim M/J_i.

*API.*
- `quotientEnd`.
- `mk_eq_iff`.
- `equivLimit`.

*Unit tests.*
- ℤ_p with pⁿℤ_p.
- No system on ℂ over ℂ.
- The one-element system on a finite module.
- ∏ ZMod 2 with the left shift: a compact module with continuous U need not admit a U-stable system.

**Construction: the profinite ordinary projector** (`FiniteQuotientSystem.projector`; node
`profinite-ordinary-projector`; planet "Profinite ordinary projector"; Hida (1.17a–b)). e is the unique
endomorphism reducing to e_{U_i} on every M/J_i.

*Properties.*
- U^{n!}x ≡ e x mod J_i for n ≥ |M/J_i|.
- e² = e and eU = Ue.
- e(J_i) ⊆ J_i.

*API.*
- `mkQ_comp_projector`.
- `projector_sub_pow_factorial_mem`.
- `isIdempotentElem_projector`.
- `commute_projector`.
- `projector_mapsTo`.

*Unit tests.*
- ℤ_p with U = p: e = 0.
- ℤ_p with U a unit: e = 1.
- ℤ_p² with U = diag(1, p): e = diag(1, 0).
- The finite case agrees with `ordinaryProjector`.

**Theorem: the profinite decomposition** (`isCompl_range_ker_projector`, `bijOn_range_projector`,
`tendsto_pow_of_mem_ker`, `projector_unique`; node `profinite-ordinary-decomposition`).
- M = eM ⊕ (1 − e)M, with closed summands.
- U is bijective on eM, with continuous inverse.
- U is topologically nilpotent on (1 − e)M. There is no uniform exponent: on ℤ_p with U = p, U is not nilpotent.
- e is unique among continuous idempotents commuting with U with these properties.

**Lemma: naturality for maps respecting the systems** (`projector_comp_of_comp_eq`; node
`profinite-projector-natural`). Continuous U-equivariant maps commute with the projectors. Continuity is the
condition that the map respects the quotient systems.

**Theorem: the adic instance** (`FiniteQuotientSystem.adic`; node `adic-instance`; planet "Hida's projector over
complete local rings"; Khare–Thorne Lemma 2.10). Let R be noetherian local with finite residue field and M a finite,
m-adically complete R-module.
- (mⁿM) is a finite quotient system for every R-linear U.
- e_U = lim U^{n!} in End_R(M).
- All of Lemma 2.10 follows: the decomposition, its uniqueness, naturality for every R-linear map, and
  (M/IM)_ord = M_ord/IM_ord.

*Failure test.* R = ℂ, m = 0, U = 2. Finite generation over a complete local ring is not enough.

**Lemma: limits of finite exact sequences** (`exists_sections_lift_of_finite`; node `finite-inverse-limit-exact`).
Over a cofiltered index, the limit of short exact sequences with finite kernels is exact.

*Proof.* The fibres are finite nonempty cosets, so `nonempty_sections_of_finite_cofiltered_system` applies.

**Theorem: exactness of the profinite ordinary part** (node `profinite-projector-exact`).
- **(a)** For continuous U-equivariant exact sequences, the ordinary sequence is a retract of the given one.
- **(b)** For cofiltered systems of finite exact sequences, the limit is exact and (lim M_c)_ord = lim (M_c)_ord.
  This is compact surjectivity in place of Mittag-Leffler.

### L0a, Milestone 3: complexes

**Theorem: ordinary parts of complexes** (`ordinaryProjectorComplex`, `homologyMap_ordinaryProjectorComplex`; node
`ordinary-part-complexes`; Khare–Thorne Lemma 2.11). Let T be a chain endomorphism of a complex of finite modules,
or of finite modules over a complete noetherian local ring with finite residue field.
- The degreewise projectors form a chain idempotent.
- C = C_ord ⊕ C_nord.
- H^i(C_ord) = H^i(C)_ord.
- The decomposition is functorial for chain maps intertwining the endomorphisms.

**Construction: the idempotent of an element of a finite algebra** (`exists_isIdempotentElem_limit_pow_factorial`;
node `ordinary-idempotent-finite-algebra`). Let A be a finite, m-adically complete R-algebra and t ∈ A.
- e_t = lim t^{n!} is an idempotent of R[t] = `Algebra.adjoin R {t}`.
- e_t acts on every A-module that is finite over R as the ordinary projector of t.

*API.*
- `ordinaryIdempotent_mem_adjoin`.
- `isIdempotentElem_ordinaryIdempotent`.
- `tendsto_pow_factorial_ordinaryIdempotent`.
- `ordinaryIdempotent_smul`.
- `map_ordinaryIdempotent`.

*Unit tests.*
- A = ℤ_p.
- A = ℤ_p × ℤ_p with t = (1, p): e = (1, 0).
- A = M₂(ℤ_p) with t = (1 1; 0 p): e = (1 1/(1 − p); 0 0), the projection onto the unit eigenline along the p-eigenline.
- t nilpotent: e = 0.

**Theorem: the ordinary part of a perfect complex** (node `derived-ordinary-idempotent`; planet "Ordinary part of a
perfect complex"; Khare–Thorne Lemma 2.12; ACC+ §5.1). Let C be a good complex over a complete noetherian local ring
with finite residue field, and t ∈ End_{K(R)}(C).
- e = e_t is the unique idempotent in R[t] with:
  - H(t) invertible on H(e)H*(C);
  - H(t) topologically nilpotent on (1 − H(e))H*(C).
- The degreewise ordinary part of any chain representative splits e. So C_ord exists in K(R) without assuming that
  the derived category is idempotent complete in the library.

**Theorem: ordinary parts along a tower** (node `ordinary-complexes-inverse-limit`; planet "Ordinary complexes
along a tower"; Khare–Thorne Proposition 2.15). Take perfect complexes M_c over R/I_c, with compatible endomorphisms
t_c and compatible ordinary cohomology.
- They glue to a minimal complex F_∞ over R with F_∞ ⊗ R_c ≅ (M_c)_ord.
- F_∞ is unique up to homotopy.
- Commuting endomorphisms glue.

*Imported.* Minimal complexes and gluing (P7) and the Milnor sequence (ArithmeticGaloisDuality R02.1).

### L3, Milestone 6: critical slope, θ-criticality and critical p-adic L-functions

The source is Bellaïche, *Critical p-adic L-functions*, arXiv:0912.2925 (Invent. Math. 189 (2012)). RS-08 makes this
layer the owner of the general critical-slope, θ-critical and secondary theory; ModularSymbolsPadicLFunctions L3
imports it.

**Definition: refinements and their criticality** (node `refinement-criticality`; planet; §2.2, Definition 2.13). Three
separate notions:
- critical slope: v_p(β) = k + 1;
- critical: Proposition 2.12's equivalent conditions;
- θ-critical: f_β lies in θ^{k+1}(M†_{−k}).

*Unit tests.*
- The non-ordinary refinement of an ordinary form has critical slope.
- X₀(32) with p = 5 is critical and θ-critical.
- A supersingular form has no critical-slope refinement.

**Theorem: equivalent forms of criticality** (node `criticality-equivalences`; Proposition 2.12). The conditions are:
- non-classical generalised overconvergent eigenforms;
- non-étaleness of the weight map;
- a split local representation;
- a critical line in D_cris;
- θ-criticality (for cuspidal f).

**Theorem: classification** (node `critical-slope-classification`; Proposition 2.14). Critical-slope refinements exist
exactly in three cases:
- ordinary non-CM forms;
- CM forms with p split;
- Eisenstein series.

**Definition: decent refinements** (node `decent-refinement`; Definition 1, Proposition 2.15). f_β is decent if it is
Eisenstein, or non-critical, or has H¹_g(ad ρ_f) = 0.

**Theorem: smoothness** (node `eigencurve-smooth-decent`; Theorem 2.16). The eigencurve is smooth at decent points.

**Theorem: the θ exact sequence** (node `theta-exact-sequence`; planet; §3.2.3).
- 0 → D_{−2−k}(k + 1) → D_k → V_k → 0.
- On symbols this gives 0 → Symb(D_{−2−k}) → Symb(D_k) → Symb(V_k).

**Theorem: freeness in families** (node `family-symbols-free-rank-one`; Propositions 4.3–4.5). Family symbols are free
of rank one over the DVR local Hecke algebra at decent points.

**Theorem: the local Hecke algebra** (node `local-hecke-algebra-structure`; Theorem 4.7).
- The local Hecke algebra is ℚ̄_p[t]/(t^e).
- The generalised eigenspace has dimension e.

**Theorem: Bellaïche's theorem** (node `critical-eigenspace-dimension`; planet; Theorem 1, Corollary 4.8).
- The eigenline is one-dimensional.
- critical ⇔ e > 1 ⇔ ρ*_k kills the eigenline.

**Construction: the critical p-adic L-function** (node `critical-p-adic-l-function`; planet; §1.4.2).
L±(f_β, σ) = Φ±({∞} − {0})(σ).
- It is analytic, of order ≤ v_p(β).
- It equals the Pollack–Stevens L-function when f_β is not θ-critical.
- *Unit tests.*
  - Disjoint supports for the two signs.
  - The ordinary case recovers Mazur–Tate–Teitelbaum.
  - The Eisenstein minus-sign L-function vanishes.

**Theorems: consequences** (Theorem 2, Corollary 1).
- `theta-critical-vanishing`: divisibility by log^{[k]}.
- `critical-slope-infinitely-many-zeros`.

**Theorem: two-variable L-functions** (node `two-variable-l-function`; planet; Theorem 3). They exist on an affinoid
neighbourhood in the eigencurve.

**Construction: secondary L-functions** (node `secondary-l-functions`; §1.4.5). The L±_i = ∂^iL±/∂y^i and their
intrinsic flag.

### L2a, Milestone 4: spectral variety and slope cover

The fourteen nodes below keep the ids, statements and proof routes of the integrated decomposition. That
decomposition passed the R1 review of 2026-09-15.

**Construction: the Fredholm spectral variety** (`spectralVariety`; node `spectral-hypersurface`; planet "Fredholm
spectral variety"; Buzzard §4, §5 p. 32). Z_φ = V(det(1 − Tφ)) ⊆ Sp R × 𝔸¹.

*API.*
- `spectralVariety_truncation`.
- `mem_spectralVariety_iff`.
- `spectralVariety_baseChange`.

*Unit tests.*
- φ = 0 gives ∅.
- The rank-one case V(1 − aT).
- φ = (1 1; 0 1) gives the nonreduced (1 − T)².

**Lemmas and theorems:**
- `flat-spectral-charts`: Lemma 4.1 and Corollary 4.2. The charts Z_r → Sp R are flat and quasi-finite.
- `constant-rank-finiteness`: Corollary 4.3, via Conrad Theorem A.1.2. Constant fibre rank gives finite flatness.
- `newton-degree-loci`: Lemma 4.4. The loci of fibre degree ≥ i are finite unions of affinoids.
- `admissible-slope-cover`: Theorem 4.6, planet "Admissible cover by slope blocks". It carries the strengthened
  induction hypothesis (E4).

**Construction: strict neighbourhoods with a fixed slope block** (`strictNeighbourhood`; node
`strict-slope-neighborhoods`; Buzzard Lemma 4.5 as corrected by E1–E3). The corrected construction uses:
- the n = 0 condition;
- (n − d) log t;
- the witness identities V ∩ W = ∅ and X ∪ W = B.

*Unit tests.*
- The counterexample P = 1 + uT.
- The constant family.
- The failure of the printed witness identities.

### L2a, Milestone 5: Hecke charts and gluing

**Construction: slope polynomials** (`slopePolynomial`, `slopeSummand`; node `slope-polynomials`; §5
pp. 34–35).
- Q = a₀⁻¹Q′ with Q(0) = 1.
- Coprimality with F_A/Q, supplied by the resultant argument (E5).
- The finite projective Hecke-stable summand N.

*Unit tests.*
- Rank one.
- Diagonal φ with distinct slopes.
- A double root.

**Construction: finite Hecke images** (`heckeImage`; node `finite-hecke-images`). T(Y) ⊆ End_A(N) is finite over A,
with T ↦ φ⁻¹.

*Unit tests.*
- Hecke algebra generated by φ.
- Buzzard's nonreduced example R ⊕ I.
- N = 0.

**Construction: gluing Hecke charts** (`eigenvariety`; node `hecke-chart-gluing`; Lemmas 5.1–5.3). D_φ is separated
and finite over Z_φ.

**Comparisons:**
- `flat-eigenvariety-base-change`: Lemmas 5.4–5.5. Flatness is necessary, and the admissibility argument is
  corrected (E9).
- `linked-banach-families`: Lemma 5.6. It uses the cyclic determinant identity, Lemma 2.12 (E6).

**Construction: the eigenvariety machine** (`eigenvarietyOverWeight`; node `global-weight-gluing`; planet
"Eigenvariety machine"; Construction 5.7, with the link indices corrected by E7). D_φ → W, with:
- the eigenvalue map;
- canonical restriction to affinoids;
- independence of the cover.

*Unit tests.*
- W a point.
- A constant family.
- Identity links.

**Theorems:**
- `eigenpacket-points`: Lemmas 5.9–5.10, planet "Points are finite-slope eigensystems". Both directions are written
  out (E8).
- `equidimensional-components`: Lemma 5.8 via Chenevier Proposition 6.4.2.

### L5, Milestone 7: Hida theory over totally real fields (partial)

Library module: `TauCeti/NumberTheory/PadicFamilies/TotallyReal`. The source is Skinner–Wiles §3.2, with F totally
real of even degree and the definite quaternion algebra D ramified exactly at the infinite places. The modules and
the projector are OrdinaryAutomorphicFormsAndModularityLifting R21.1. L5 proves Hida's theorems about them.

**Construction: the weight algebra** (node `totally-real-weight-algebra`; planet "Nearly ordinary weight algebra of a
totally real field"). G(U) ≅ (𝒪_F ⊗ ℤ_p)^× × Z(U), where Z(U) is the idelic centre modulo global units. The free part
of Z(U) has rank δ_F = 1 + the Leopoldt defect, so Λ′_𝒪 = 𝒪[[X_1, …, X_{δ_F}, Y^{(i)}_j]] has δ_F + d variables, and
𝒪[[G(U)]] is finite free over it. The weight-two arithmetic points (finite characters φ, ψ) are Zariski dense.
- *API:* `nearlyOrdinaryWeightAlgebra`, `heckeGroup`, `groupRing_free`, `deltaF_eq_rank`, `arithmeticPoint`,
  `arithmeticPoints_dense`.
- *Tests:*
  - for F = ℚ, Λ′_𝒪 = 𝒪[[X, Y]] (weight and twist);
  - a real quadratic abelian F has 3 variables;
  - the density of the points (1 + X − ζ);
  - the torsion of G(U) is not a weight variable.

**Theorem: Hida's freeness** (node `hida-freeness`; planet "Hida's freeness theorem"). This is Skinner–Wiles
Proposition 3.3, after Hida [H2, Theorem 3.8]. If U/(U ∩ F^×) acts freely on D^×\G^D(A_f), M_∞(U) and M⁺_∞(U) are
projective over 𝒪[[G(U)]], hence free over Λ′_𝒪.
- The proof: the free action makes the dual of H⁰(X(U_a), K/𝒪) free over 𝒪[G(U_a)]. The e-part is then a direct
  summand, and level independence (OAFML R21.1) bounds its generators in the limit.
- The stated rank rank_𝒪 eH⁰(X(U⁰_1), 𝒪) × #G(U)_tors needs equal ranks on all characters of the prime-to-p torsion
  (E11).

**Theorem: finiteness** (node `hida-hecke-finite`). This is Corollary 3.4. T_∞(U, 𝒪) is finite and torsion-free over
Λ′_𝒪, semilocal and complete. The proof shrinks U at an auxiliary prime ℓ ∤ 6 to get a free action (R18.3), embeds
M_∞(U) ↪ M_∞(V), and uses the faithful action.

**Theorem: Hida's control** (node `hida-control-nearly-ordinary`; planet). This is Proposition 3.7, after Hida [H2,
Corollary 2.5]. A λ with λ|_{Z(U)} = ψε^μ and finite torus character comes from a nearly ordinary π of parallel weight
(μ + 2)·t. The weight-two case follows from the definitions. For μ > 0 the proof is cited, unread, and recorded as a gap.

**Lemma: density on components** (node `algebraic-primes-dense`). This is Lemma 3.8 with Corollary 3.9. Weight-two
algebraic primes are dense in every Spec(T_∞/Q), by lying over from Λ′_𝒪 and a dimension count, which the source calls
"immediate". A minimal prime whose dense set of points factors through a larger level comes from that level.

## Dependencies

- **Within this roadmap:** L0a supplies L0, L1 and L5 (RS-08). L2a supplies L2 and, through it, L3.
- **L0a imports:**
  - AdicSpacesPartII F0 (`finite-module-inverse-limit`);
  - ArithmeticGaloisDuality R02.1 (`milnor-sequence`, `mittag-leffler-lim-one`);
  - DeformationAndDerivedPatchingAlgebra P7 (requested).
- **L2a imports:**
  - LocallyAnalyticDistributions L4 (cited node ids);
  - AdicSpacesPartII R0, R2 and R3 (requested);
  - PadicMeasuresIwasawaAlgebras L0a (requested).
- **L5 imports:**
  - OrdinaryAutomorphicFormsAndModularityLifting R21.1 and PadicMeasuresIwasawaAlgebras L1 (cited node ids);
  - HilbertModularVarietiesAndShimuraCurves R18.3 and GL2AutomorphicRepresentationsAndTransfer R16.6 (requested).
- **Consumers:**
  - of L5: OrdinaryAutomorphicFormsAndModularityLifting R21.2 (its request for Propositions 3.3 and 3.7, Corollary 3.4
    and Lemma 3.8);
  - of L0a: OrdinaryAutomorphicFormsAndModularityLifting R21.1–R21.2, PotentialAutomorphyInfrastructure PA.2,
    AutomorphicCongruences L2s, GeneralizedHeegnerCycles GH.3;
  - of L2a: AutomorphicGaloisRepresentationsPartII AG2.3 and AutomorphicPadicLFunctions L4e.

## Acceptance tests

- **L0a:**
  - e = U^{n!} with the explicit threshold |M| (or |M/J|).
  - Mathlib's Fitting decomposition is recovered.
  - The ZMod 6 test separates e from "1 if U is invertible".
  - Topological nilpotence without a uniform exponent (ℤ_p, U = p).
  - The failure test R = ℂ, U = 2.
  - The shift non-example for compact modules.
  - Exactness for finite, profinite and limit sequences.
  - Khare–Thorne Lemmas 2.10–2.12 and Proposition 2.15 as stated, with T₂ acting on the target (E10).
  - No averaging over a group order, and no supplied idempotent in place of the construction.
- **L2a:**
  - The nilpotent structure of Z_φ is kept.
  - The corrected Lemma 4.5 passes the P = 1 + uT counterexample.
  - Flatness is kept in the base-change comparison.
  - Links are genuine intertwinings.
  - Eigenpackets are classified as points, not as unique eigenvectors.

- **L5:**
  - Λ′_𝒪 for F = ℚ has two variables.
  - The torsion of G(U) is not a weight variable.
  - Freeness is proved over Λ′_𝒪, and the rank formula is flagged (E11).
  - The control theorem gives parallel weights only.

## Source issues

The packet records eleven findings.
- **E1–E9:** Buzzard's manuscript.
  - E1: (n − d)t for (n − d) log t in Lemma 4.5.
  - E2: the printed witness identities X ∩ W = ∅ and X ∪ V = B.
  - E3: the missing n = 0 condition.
  - E4: the induction hypothesis of Theorem 4.6.
  - E5: the coprimality of Q with F_A/Q in §5.
  - E6: Lemma 2.13 cited for Lemma 2.12 in Lemma 5.6.
  - E7: the mis-indexed links of Construction 5.7.
  - E8: the reduction step in Lemma 5.9.
  - E9: the admissibility argument in Lemma 5.5.

  All nine were recorded in the reviewed decomposition's nodes and gap entries. They were re-read here against the
  text layer and are now filed as source issues.
- **E10:** Khare–Thorne print T₂ ∈ End_R(M) in Lemma 2.10(2), and T₂ ∈ End_R(C•) in Lemma 2.11(2). The target's
  endomorphism is meant.
- **E11 (gap, reaches a stated result):** Skinner–Wiles Proposition 3.3 states a rank
  rank_𝒪 eH⁰(X(U⁰_1), 𝒪) × #G(U)_tors, and its proof says it "clearly suffices" to argue without e. Dropping e gives
  only projectivity over 𝒪[G(U_a)]. The e-part is free of that rank only if all characters of the prime-to-p torsion
  of G(U_a) contribute equal 𝒪-rank, which the proof does not compare. Freeness over Λ′_𝒪, the only form used later,
  does follow. Hida's cited [H2] was not obtained.

## Remaining layers

- **L0.** p-adic modular forms from the ordinary tower, finite flatness and control over the weight Iwasawa algebra,
  the ordinary Eisenstein family, and specialisation. The route is Hida §§1–3, Wiles and Emerton–Pollack–Weston. RS-08
  imports p-stabilisation from ModularSymbolsPadicLFunctions L2 and the Eisenstein measure from
  DirichletPadicLFunctions L4.
- **L1.** The ordinary family modular-symbol module, period and congruence modules, and the cyclotomic measure.
- **L2.** The modular instance of L2a:
  - the compact U_p on distribution-valued cohomology;
  - the eigencurve;
  - classicality through ModularSymbolsPadicLFunctions L2.
- **L3.** Critical-slope and theta-critical theory (Pollack–Stevens, Bellaïche).
- **L4.** Family Selmer complexes, regulators and big Kato classes.
- **L5 (partial).** Still to do:
  - Hida's control in weight μ + 2 > 2 (a gap: Hida [H1], [H2] are not obtained);
  - the indefinite Hilbert and Shimura-curve cohomology (R18.4) and odd-degree F;
  - period modules;
  - the comparison of the F = ℚ slice with L0.

## Sources

- **Khare–Thorne,** *Potential automorphy and the Leopoldt conjecture*, arXiv:1409.7007v2 (Amer. J. Math. 139
  (2017)). Read §2.2 and §2.4.
- **Allen et al.,** *Potential automorphy over CM fields*, arXiv:1812.09999v2 (Ann. of Math. 197 (2023)). Read
  §§5.1–5.2.
- **Hida,** *Iwasawa modules attached to congruences of cusp forms*, Ann. Sci. ÉNS (4) 19 (1986), 231–273, Numdam.
  Read the introduction and §1.
- **Buzzard,** *Eigenvarieties*, author manuscript of 2 August 2006. Read §§2–5 and the opening of §6.
- **Conrad,** *Modular curves and rigid-analytic spaces*, author manuscript (2006). Read Appendix A.1.
- **Chenevier,** *Familles p-adiques de formes automorphes pour GL_n*, author copy. Read §§6.2–6.4 as cited.
- **Skinner–Wiles,** *Residually reducible representations and modular forms*, Publ. Math. IHÉS 89 (1999), 5–126,
  Numdam. Read §2.2 (δ_F), §2.5 and §3.2.
- **Coleman–Mazur,** *The eigencurve*, Internet Archive capture of the authors' preprint. Read §1.1, §1.3 and
  §§7.1, 7.4–7.5 (statements).
