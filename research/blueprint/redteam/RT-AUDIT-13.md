# RT-AUDIT-13 — red team of library audit AUDIT-13

**Result: 54 findings — 1 high, 18 medium, 35 low.** Every cited declaration exists at the pins and says
what its note claims. Every layer verdict follows from its targets, and no verdict changes.

The high finding: AdelicAlgebraicGroups AA.1 and the summary deny any topology on G(𝔸). In fact Mathlib topologizes the
points of every affine scheme over a topological ring, and makes GL_n(𝔸), SL_n(𝔸) and the ideles topological groups.

The medium findings are mostly library material that a note denies or leaves out, and `duplicates` records that miss
owners elsewhere in the atlas.

**Red team:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #1576).

**Target:** `AUDIT-13`, the library audit of five roadmaps: AdelicAlgebraicGroups, AlgebraicModularFormsAndSerreWeights,
ArithmeticLocallySymmetricSpaces, AutomorphicBundles and AutomorphicFormsOnReductiveGroups. It is read as it stands after
its review's 76 corrections (`REV-AUDIT-13`).

**Baseline:** tauceti `f790474` and mathlib `082e2d3`, both read at exactly those commits.

**Eligibility:** `cc-2aeb03` wrote neither `AUDIT-13` nor its review.

## Method

- **Every declaration claim.** All 227 `declarations` entries (192 targets, 36 layers) were
  located at the pins. Mathlib was read at `082e2d3`, and Tau Ceti with `git show f790474:<file>`. All exist at the cited
  line. One of them, `SlashAction.slash_mul`, is a structure field.
- **What each declaration says.** For every target marked `mathlib` or `partial`, each cited declaration was read at the pin
  and compared with the target and the note: generality, hypotheses, privacy and the `fit` label.
- **The absence claims.** Every target marked `absent` and every `not built` layer was searched for in both libraries under
  other names, including their GL₁, GL₂ and SL₂(ℤ) special cases.
- **Verdicts, summaries and duplicates.** Each layer verdict was checked against its targets, each roadmap summary against its
  layers, and each `duplicates` entry against the stages of the other roadmaps in the atlas.

## Findings


### AdelicAlgebraicGroups — 10 findings (1 high, 4 medium, 5 low)

- **RT-AUDIT-13/1** (library-claim, high). The audit says no topology on G(𝔸) exists in either library.
- **RT-AUDIT-13/2** (library-claim, medium). The classical SL₂/ℚ case of reduction theory is in the libraries and is not cited anywhere in AUDIT-13. Mathlib proves that every point of ℍ is SL₂(ℤ)-equivalent to a point of the standard domain 𝒟, that 𝒟 lies in the Siegel set {|x| ≤ 1/2, y ≥ √3/2}, that only finitely many explicit g satisfy z, g•z ∈ 𝒟 (the Siegel finiteness property), that truncations of 𝒟 are compact, and that every arithmetic subgroup of GL₂(ℝ) has finitely many cusp orbits (so finitely many Siegel sets at any level). Tau Ceti proves that 𝒟 has finite invariant volume and that 𝒟ᵒ (and its coset tiling) is a measure-theoretic fundamental domain for PSL₂(ℤ) and any subgroup.
- **RT-AUDIT-13/3** (library-claim, low). The class-number note understates the GL₁ case.
- **RT-AUDIT-13/4** (duplicate, medium). AA.3's duplicates omit two stages that plan its mathematics, both already recorded as overlapping with AA.3 from the other side.
- **RT-AUDIT-13/5** (duplicate, medium). AA.1 lists only ShimuraData:D0 and ReductiveGroupsPartII:RG2.0a. It omits three stages, each already recorded as overlapping with AA.1 by another accepted audit.
- **RT-AUDIT-13/6** (duplicate, medium). AA.4 lists only ShimuraVarieties:V0 and GlobalNumberFields layer 6. Its level-map targets (finite covering maps at neat level, degrees via stabilizer indices, Cartesian diagrams for Hecke correspondences, quotient groupoids at non-neat level) are also planned in ShimuraVarieties:V1, ArithmeticLocallySymmetricSpaces:ALS.3 and CompletedCohomologyPartII:CC.0. The neatness notion they all rely on is defined in ShimuraData:D5. The G_a/G_m case of its weak-approximation target is GlobalNumberFields layer 1, whose named theorem AA.4 cites.
- **RT-AUDIT-13/7** (duplicate, low). The same result file lists AA.5 among the duplicates of AutomorphicFormsOnReductiveGroups:AF.5 ('the same two validation comparisons': GL₁ with the idele class construction, GL₂/ℚ with the upper half-plane), but AA.5 does not list AF.5. AF.5 does not depend on AA.5, so the comparison could be built twice.
- **RT-AUDIT-13/8** (other, low). Three presentation errors in the layer.
- **RT-AUDIT-13/9** (other, low). The Hecke note calls the Hecke ring 'classical ... for GL_2 and GL_n'. In fact Mathlib defines, and Tau Ceti gives a ring structure to, the abstract Hecke ring of an arbitrary Hecke triple (H₁, Δ, H₂) in any group, following Shimura Chapter 3; GL₂ and GL_n are instances.
- **RT-AUDIT-13/10** (error, low). Neither library defines a modular curve Γ(N)\ℍ. `ModularCurve`, 'modular curve' and orbit quotients of ℍ by Γ(N) occur nowhere.

### AlgebraicModularFormsAndSerreWeights — 9 findings (2 medium, 7 low)

- **RT-AUDIT-13/11** (library-claim, medium). The note says the finite-flat condition (rho-bar restricted to G_{Q_2} prolongs to a finite flat group scheme over Z_2) 'cannot be stated: neither library attaches group schemes to Galois modules'. Stating the condition needs the opposite direction, the Galois module of a group scheme's generic fibre, and Tau Ceti has it.
- **RT-AUDIT-13/12** (duplicate, medium). None of R15.5's three duplicate entries plans the Deligne-Serre eigenvalue-lifting lemma, which is R15.5's content.
- **RT-AUDIT-13/13** (duplicate, low). The same audit file records AutomorphicBundles:B4 -> R15.1 and AutomorphicBundles:B5 -> R15.2 as duplicates, but R15.1 and R15.2 do not list B4 and B5 back.
- **RT-AUDIT-13/14** (duplicate, low). The Tau Ceti LocalFieldsRamification roadmap, layer 4, owns the tame character of a local field: I_K/P_K ≅ Ẑ^{(p')}(1), given by σ ↦ (σ(π^{1/m})/π^{1/m})_m, with G_K-equivariance and the finite-level form.
- **RT-AUDIT-13/15** (library-claim, low). The note cites only the finite-field Frobenius isogeny (TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius). Tau Ceti also has the relative Frobenius to the Frobenius twist W^{(p)}. It exists as an R-algebra map on coordinate rings over any commutative ring of exponential characteristic p, and as an isogeny W → W.map (frobenius F p) of degree p over any field of characteristic p, perfect or not.
- **RT-AUDIT-13/16** (library-claim, low). Mathlib proves Ramanujan's formulas for the Serre and normalized derivatives of E₂, E₄, E₆ and the q-expansion of E₂. These are the characteristic-zero identities from which the theta operator on level-one mod-p forms and its filtration behaviour are computed, in Serre's and Swinnerton-Dyer's treatment: θ is expressed through ∂ and E₂ ≡ E_{p+1}, with ∂E₄ = −E₆/3 and ∂E₆ = −E₄²/2. The theta note cites only D and serreDerivativeMF, and the filtration target cites nothing.
- **RT-AUDIT-13/17** (library-claim, low). For the coefficient formula the target asks for, the audit cites only the coprime special case a_m(T_n F) = a_{mn}(F), gcd(m, n) = 1. Tau Ceti has the full classical divisor-sum formula a_m(T_n F) = Σ_{d | gcd(m,n)} χ(d) d^{k−1} a_{mn/d²}(F) for all nonzero m and n, and its cusp-form version.
- **RT-AUDIT-13/18** (library-claim, low). The note cites only Mathlib's analytic ModularForm and says there is 'no space of forms over a general base ring and hence nothing to base change'. That is true of spaces of forms.
- **RT-AUDIT-13/19** (library-claim, low). The parity target's note is just 'Absent.', with no citation.

### ArithmeticLocallySymmetricSpaces — 12 findings (5 medium, 7 low)

- **RT-AUDIT-13/20** (library-claim, medium). The note cites only the SL(2,R)/GL(2,R)-on-H instances and describes Tau Ceti's free-locus results without citing them.
- **RT-AUDIT-13/21** (library-claim, medium). The note says 'Missing: the inverse construction of a module-valued local system from a π₁-representation, local systems on X_K attached to Γ-modules'. The inverse construction is not missing.
- **RT-AUDIT-13/22** (missing, medium). The note says 'there is no space X_K, hence no covering maps'. The covering-map half of this target is a general theorem in Tau Ceti: for Γ' ≤ Γ acting on X with quotient covering maps, the induced map Γ'\X → Γ\X is a covering.
- **RT-AUDIT-13/23** (missing, medium). The audit gives the parent ALS.5 only the finite-level-duality targets and its duplicates entry says the two layers' 'target lists coincide'. The parent stage has content the prefix does not have: the comparison of Betti, de Rham and relative Lie algebra cohomology in characteristic zero via local systems (using AF.1a), and the further comparison with automorphic forms (consuming AS.5). The document's acceptance also requires 'the three cohomology theories'. The distinctive targets of ALS.5 are therefore not audited at all.
- **RT-AUDIT-13/24** (duplicate, medium). ALS.2 must 'prove the manifold-with-corners structure at neat level, compactness of the quotient and the homotopy equivalence from the interior' and glue boundary pieces.
- **RT-AUDIT-13/25** (missing, low). The note says 'Only the rank-one example is present'. For GL_p(R), Tau Ceti has the model of the symmetric space as the positive-definite cone, the congruence action A ↦ C A Cᵀ, and the Cholesky homeomorphism onto positive-diagonal lower-triangular matrices, which is the Iwasawa coordinate on GL_p(R)/O(p). It also proves compactness of the orthogonal/unitary groups, the standard K_inf for GL_p. These are not packaged as a G-space G/K and maximality is not proved, so both targets stay absent,…
- **RT-AUDIT-13/26** (missing, low). The GL2/Q special case is in the libraries but uncited.
- **RT-AUDIT-13/27** (missing, low). These notes cite no corestriction at all, and ALS.6 says 'Only degree-one inflation–restriction exists'. For a torsion-free Γ, H*(Γ\X) = H*(Γ) (see the K(Γ,1) result in the first finding). The group-cohomological restriction and corestriction exist: restriction in every degree (Mathlib), corestriction for any finite-index subgroup in degrees 0–2 with cor ∘ res = index (Tau Ceti), and homological corestriction in every degree (Mathlib). The last is the transfer identity behind finite-level descent.
- **RT-AUDIT-13/28** (missing, low). The note rests on '`grep -rn -i satake` over both trees returns nothing'. That is literally true, but the nearest material is uncited: Tau Ceti proves Shimura's Theorem 3.20 for n = 1, 2, that the p-local Hecke ring of GL_n is a polynomial ring on the diagonal prime cosets.
- **RT-AUDIT-13/29** (missing, low). The document's 'Completion contracts added on 2026-09-15' say they apply to ALS.1, ALS.2, ALS.3, ALS.4 and ALS.5:finite-level-duality and are 'required construction and validation tasks'. None of their constructions is an audit target: chain-level restriction and transfer from a common equivariant cell decomposition refined for a finite correspondence, with homotopy independence of the refinement and the double-coset identity; the incidence maps between parabolics and the orientation local system on nilmanifold fibres in the Borel–Serre boundary spectral sequence; the producer–consumer conditions (perfect complexes only for finite-projective coefficients and finite-CW/neat hypotheses;
- **RT-AUDIT-13/30** (duplicate, low). The audit lists special-case owners (ShimuraData:D2 'the Hermitian case', ModularCurvesPartII:R14.1 'the GL_2 case'), but it misses three rank-one owners.
- **RT-AUDIT-13/31** (other, low). The summary needs to follow the corrections above.

### AutomorphicBundles — 9 findings (3 medium, 6 low)

- **RT-AUDIT-13/32** (missing, medium). This target cites only the fppf quotient torsor and BalancedProduct.
- **RT-AUDIT-13/33** (duplicate, medium). Both duplicate lists omit tauceti:TauCetiRoadmap/ModularForms#10c--modular-forms-as-section-spaces-and-the-dimension-formulas.
- **RT-AUDIT-13/34** (duplicate, medium). B5's duplicates (AA.4, ALS.3, L4, R15.2) omit the modular-curve and GL₂ owners of B5's own targets.
- **RT-AUDIT-13/35** (library-claim, low). The note's paraphrase of the cited ModularForm.mem_range_ofLeₗ_iff ('a form for Γ' ≤ Γ comes from Γ exactly when it is Γ-slash invariant') drops a real hypothesis: every cusp of Γ must be a cusp of Γ'. It also drops [Γ.HasDetOne] and [Γ'.HasDetOne]. Tau Ceti's docstring stresses that without the cusp hypothesis 'enlarging the invariance group can create cusps at which nothing is known'. Separately, the analytic GL₂ shadow of this target is sharper than the note says.
- **RT-AUDIT-13/36** (missing, low). B4[3] cites nothing, and B4[5] cites only schurFunctor.
- **RT-AUDIT-13/37** (missing, low). B0[4]'s note says there is 'no compact dual'. For GL₂, the compact dual of ℍ is ℙ¹ = GL₂/B, and Tau Ceti identifies GL₂(F)/B(F) with Mathlib's projective line OnePoint F, equivariantly, over any field.
- **RT-AUDIT-13/38** (missing, low). The audit cites analytic GL₂ counterparts for some B5 targets but misses the closest ones for others.
- **RT-AUDIT-13/39** (missing, low). Three absent targets have uncited nearby material.
- **RT-AUDIT-13/40** (other, low). The summary ends with 'B0–B3 and the three general-data interfaces are untouched', but B0's target 'Equivariant-function description of sections, in a fixed left/right convention' carries library 'partial', with SlashInvariantForm as a special case.

### AutomorphicFormsOnReductiveGroups — 14 findings (4 medium, 10 low)

- **RT-AUDIT-13/41** (library-claim, medium). The notes describe the real-group side as only 'continuous representations of topological groups' (attributed to Tau Ceti) plus Mathlib's Lie modules, and the AF.1 U(g_C) note lists 'the complexified algebra for a real reductive group' as missing.
- **RT-AUDIT-13/42** (duplicate, medium). Neither layer lists the Tau Ceti LieGroups roadmap, which owns the real Lie-group structure these layers plan on: layer 9 owns the maximal compact K, the Cartan decomposition 𝔤 = 𝔨 ⊕ 𝔭 and the diffeomorphism K × 𝔭 → G, i.e. G/K ≅ 𝔭, which is the contraction AF.1a's 'contracting homotopy on G/K' and 'complex of invariant forms on G/K' rest on and gives the K-module 𝔤/𝔨 ≅ 𝔭 of AF.1's relative complex; layer 5 owns U(𝔤) as the algebra of left-invariant differential operators and the scalar…
- **RT-AUDIT-13/43** (library-claim, medium). The note says 'there is no space of smooth functions on a Lie group or a locally profinite group ... in either library'. This is false.
- **RT-AUDIT-13/44** (error, medium). The note justifies the absence with 'there is no adelic quotient of a reductive group in either library'. That is false for GL₁ and contradicts this audit's own AdelicAlgebraicGroups layers: Mathlib defines the idele class group 𝔸_K^×/K^× = GL₁(K)\GL₁(𝔸_K), which AA.5 cites as the GL₁ adelic quotient (fit 'special case'), and AA.1 records that Tau Ceti's points functor gives G(𝔸) as an abstract group with the diagonal G(F) → G(𝔸). The target (a space of automorphic forms) is still absent;…
- **RT-AUDIT-13/45** (missing, low). The constant-term note says 'there is no unipotent adelic quotient', and the compactness note cites only a docstring.
- **RT-AUDIT-13/46** (missing, low). The audit cites classical GL₂ shadows elsewhere in AF.3 (exp_decay_atImInfty as 'special case' of rapid decay), but not the two classical results that are the GL₂ cases of these targets.
- **RT-AUDIT-13/47** (missing, low). These targets have no classical-shadow citations, though the libraries have the GL₂/GL_n cases and the audit cites such shadows elsewhere (Sturm-bound finiteness in AF.2, multiplicity one, exp decay). (a) Mathlib proves the moderate-growth bound |f(τ)| ≤ C·max(1, Im τ^{-k}) for modular forms on every arithmetic Γ, the classical moderate-growth condition.
- **RT-AUDIT-13/48** (library-claim, low). The first note says Tau Ceti's extra material is 'on an explicit low-degree model with discrete coefficients'. The explicit model is not restricted to discrete coefficients.
- **RT-AUDIT-13/49** (missing, low). The note cites only the Peter–Weyl Hilbert basis.
- **RT-AUDIT-13/50** (missing, low). The absence rests on '`grep -i 'algebraic'` finds no normalization convention of this kind'. That search cannot find the ingredient the target turns on.
- **RT-AUDIT-13/51** (missing, low). The note says neither infinity types nor conductors exist and cites ideal weights as the shadow of finite-order Hecke characters.
- **RT-AUDIT-13/52** (duplicate, low). The note correctly says there is no Weil restriction in either library, but the layer's duplicates do not name the two stages that own the restriction-of-scalars inputs.
- **RT-AUDIT-13/53** (duplicate, low). The Tau Ceti ModularForms roadmap, a prerequisite of this roadmap, plans the GL₂ case of these targets in its layer 8: modular symbols as a finite integral Hecke module, the integral Hecke algebra, and coefficient fields of newforms as number fields.
- **RT-AUDIT-13/54** (duplicate, low). The duplicate note says AL.0 owns 'Schwartz–Bruhat functions and Fourier theory on the adeles, the same adelic test-function space'. The spaces differ at infinity.


## For the verifier and the fixer

The high finding was checked at the pin. Mathlib `082e2d3`, `Mathlib/Algebra/Category/Ring/Topology.lean`, has:

- the scoped instance `CommRingCat.HomTopology` (`:50`), which topologizes `A ⟶ R` by the topology induced from functions
  `A → R`;
- `continuous_precomp` (`:64`);
- `isClosedEmbedding_precomp_of_surjective` (`:94`): Hom(A/I, R) is a closed subspace when R is T1.

In addition, `Mathlib/Topology/Algebra/Group/Units.lean:102` makes Rˣ a topological group, and
`Mathlib/Topology/Algebra/Group/Matrix.lean:125` does the same for SL_n(R).

What stays missing is narrower:

- the group topology on the Hopf-algebra points of a general G;
- its identification with the restricted product ∏′ G(K_v);
- local compactness.

The fixes are to notes, `library`/`fit` labels, cited declarations and the `duplicates` records, as each finding states.
Library values change as follows:

- **RT-AUDIT-13/2** moves two AA.3 targets from `absent` to `partial`: finitely many Siegel sets, and finite volume. Both go
  through the SL₂(ℤ) special case.
- **RT-AUDIT-13/3** asks for AA.3's finiteness target to become `partial` through its GL₁ case (ray and narrow class groups),
  or for the note to explain why it differs from AA.2.
- **RT-AUDIT-13/22** leaves ALS.3's value to the fixer, provided it is consistent with AA.4.

No layer verdict changes.
