# Roadmap: automorphic bundles and classical automorphic forms

**Summary.** This roadmap builds the coefficient sheaves of classical automorphic forms on Shimura
varieties and the section spaces they define. From a Shimura datum it constructs the coefficient
group and the associated bundles of its torsors, the canonical principal bundle on the canonical
model, the automorphic vector bundle attached to a representation of the Hodge parabolic, the Betti,
étale and filtered de Rham realizations of full-group representations, the canonical and
subcanonical extensions across a toroidal boundary, and the spaces of classical and cuspidal forms
over their actual fields of definition and over the integral PEL and ramified Hilbert models. It
then equips those spaces with geometric Hecke operators and proves the Fourier–Jacobi expansion
principle with arbitrary coefficient modules. The ramified Hilbert q-expansion principle and the
classical Hodge–Tate decomposition of the cohomology of the Siegel threefold are specified subject
to the missing boundary and comparison prerequisites below. We want it because every
modularity and Hida/Coleman argument downstream works with these objects: Galois representations are
attached to Hecke eigensystems in coherent cohomology, congruences are proved by reducing
q-expansions modulo primes, and the p-adic comparisons of Boxer–Calegari–Gee–Pilloni start from the
classical coherent sheaves and their Hodge–Tate weights. The modular, Hilbert, Siegel and unitary
examples fix every convention (differentials, determinants, similitude lines, Tate twists and Hecke
normalizations) that those applications depend on.

An automorphic form has a coefficient, a field of definition and a condition at the boundary. This
roadmap constructs these three pieces together. A representation of the entire coefficient group
carries more structure than a representation of the Hodge parabolic: Betti and étale local systems
and a filtered de Rham bundle with an integrable connection. A representation of a Levi or parabolic
alone acquires no flat connection. Keeping this distinction visible connects the classical coherent
coefficients with their Hodge–Tate comparisons without changing their meaning.

The principal references are Milne for canonical principal bundles and rationality, Deligne for
absolute Hodge tensors, Caraiani–Scholze and Andreatta–Goren–Howard–Madapusi Pera for the Hodge-type
tensor construction, Lan for integral PEL boundary charts, coefficient modules and the expansion
principle, Diamond for ramified Hilbert coefficients and their q-expansions, and
Boxer–Calegari–Gee–Pilloni for the classical Siegel comparisons. Source labels refer to the editions
in the references; page numbers follow those editions. `Suggested.lean` gives, against the pinned
Mathlib and Tau Ceti, the signatures of the targets that can already be stated there; this README is
the specification.

## Scope and ownership

The roadmap owns:

- the coefficient group `Gᶜ = G/Z_s`, ineffective-stabilizer descent, the Hodge and Hodge–Tate
  parabolic conventions, associated bundles of torsors, compact-dual coefficients and their analytic
  and algebraic descents (Layer B0);
- the canonical principal bundle of Hodge and abelian type, through finite tensor stabilizers,
  absolute Hodge tensors, the tensor-preserving de Rham frame torsor, its filtration reduction, the
  special-point normalization and Hecke pullback (Layer B1), and its general-data version through
  connected conjugation and second jets (Layer B1.general);
- the automorphic vector bundle functor, highest-weight conventions, the Betti, étale and filtered
  de Rham realizations of full-group representations and their comparison (Layer B2), with the
  general-data versions (Layer B2.general);
- canonical and subcanonical extensions over toroidal models, their behaviour under fan refinement,
  logarithmic extensions of full-group connections, coherent pushforward to the minimal model,
  rationality, and the integral coefficients on good-prime PEL models (Layer B3), with the
  general-data versions (Layer B3.general);
- classical and cuspidal forms, the automorphy-factor adapter to Mathlib's `SlashAction`, the
  analytic comparison, the modular, Hilbert, Siegel and unitary weight conventions, integral forms
  with arbitrary coefficient modules, the ramified Hilbert weight line and the classical VB
  normalization (Layer B4);
- geometric Hecke operators and their convolution law, the expansion principle with arbitrary
  coefficients, vector-valued Fourier–Jacobi expansions, Diamond's ramified Hilbert q-expansions,
  the Hecke action on expansions, and the classical Siegel Hodge–Tate decompositions (Layer B5).

It leaves to other roadmaps:

- **Shimura data and varieties.** Compact duals, Borel embeddings, reflex flags and homogeneous
  variations are ShimuraData D3; the analytic tower, minimal compactification, CM reciprocity,
  canonical models, conjugation and canonical towers are ShimuraVarieties V1–V8; PEL data and their
  universal families are PELModuli M0, M3, M5; Hilbert data, families, splitting models, cusp
  representatives and central kernels are HilbertModularVarietiesAndShimuraCurves H0–H4.
- **Compactifications (bundle partner).** Fans, cusp labels, toroidal models, refinements, toroidal
  Hecke spans, degeneration families, good-prime PEL models and Hilbert cusp charts are
  ShimuraCompactifications C0–C6, which goes to Tau Ceti together with this roadmap. In particular
  the scalar Fourier–Jacobi expansion of Hodge-line sections — its coefficient modules, independence
  of the cone and of the cone decomposition, invariance under the cusp stabilizer, functoriality in
  the coefficient module and the restriction to a boundary stratum through the constant term — is
  ShimuraCompactifications C5 (*hodge-line-fourier-jacobi-expansion*, `HodgeLineFJ`); this roadmap
  proves the expansion principle for it and extends it to vector coefficients. The refinement
  invariance of canonical and cuspidal cohomology with arbitrary coefficient modules is
  ShimuraCompactifications C3 (*coherent-cohomology-invariance*), and Dimitrov's tame Hilbert
  q-expansion principle is ShimuraCompactifications C6 (*hilbert-q-expansion-injective*); Layer B5
  treats Diamond's prime-to-`p` ramified setting, including `p = 2`, which C6 does not cover. The
  semiample Hodge line, finite generation of its section algebra and the ample positive power on
  the minimal model are C5 (*hodge-semiampleness*, *graded-section-finite-generation*,
  *minimal-hodge-ampleness*); only their coefficient comparisons are used here.
- **Tau Ceti roadmaps.** The analytic theory of elliptic modular forms, including the automorphy
  sheaf on the coarse curve and the dimension formulas, is ModularForms Layer 10C, and its Hecke
  ring and nebentypus action are ModularForms Layer 2; this roadmap compares its GL₂ coefficients
  with them and does not define a second modular-form carrier or Hecke algebra. Borel–Weil line
  bundles `G_ℂ ×_B ℂ_{−λ}` on full flag manifolds are RepresentationTheory/LieGroups Layer 8; they
  do not replace coefficients for a Hodge parabolic on a reflex compact dual. Schur functors and the
  highest-weight classification of `GLₙ` are RepresentationTheory/ClassicalGroups Layers 2–3. The
  generic finite locally free sheaf, tensor, dual, pullback and determinant APIs are
  AlgebraicVectorBundles Layers L0A–L0C. General affine-group quotients and dynamic parabolic
  representability are ReductiveGroups Layers 3 and 7 (Layer 8 for general bases). The
  Deligne torus and its cocharacter `μ` are ReductiveGroupsPartII RG2.0a.3; level quotients, neat
  levels and Hecke correspondences of adelic groups are AdelicAlgebraicGroups §§4.3–4.5.
- **Other roadmaps.** Geometric modular forms, their q-expansion principle and Katz's integral Hecke
  operators are AlgebraicModularFormsAndSerreWeights R15.1–R15.2, compared here with the uniform
  construction. Coherent analytification and projective GAGA are ComplexComparisonPartII C0 and C2.
  Relative de Rham cohomology of abelian schemes, its Hodge sequence and Gauss–Manin connection are
  AbelianSchemesAndArithmeticModuli A4. Torsors, fpqc descent of quasi-coherent sheaves,
  quasi-coherent sheaves on algebraic stacks, coarse moduli spaces and tame stacks are
  SchemeAndStackFoundations SF.1 and AlgebraicModuliForArithmeticGeometry §§3.1 and 5.3. Formal
  completion along a closed subset is AdicSpacesPartII F0.
- **Later work and neighbouring theories.** Higher integral coherent cohomology and
  Hecke-equivariant perfect complexes belong to AutomorphicBundlesPartII; locally analytic and
  overconvergent weights to OverconvergentAutomorphicForms; the Hodge–Tate period map and its VB
  functor to HodgeTateAndCanonicalSubgroups and PerfectoidShimuraVarieties. The three inputs that
  this roadmap needs from that theory are missing comparison prerequisites (specified below);
  B4.21 and B5.20–B5.22 are conditional until these prerequisites have a closed construction.
  Multiplicativity of Siegel Fourier–Jacobi expansions,
  their comparison with analytic Fourier series beyond rank one, and q-expansions of analytic
  `p`-adic families of Hilbert forms are consumer interfaces, not targets here.

## Conventions

Fix a Shimura datum `(G, X)`, its reflex field `E`, a finite level `K` and a coefficient field
`L ⊇ E` over which the coefficient is defined; `L` need not equal `E`. Choose `L ↪ ℂ` when making an
analytic comparison. The characteristic-zero Hodge/abelian construction and the general-data
construction have separate layers. Every integral assertion names a good-prime PEL base or a
ramified Hilbert model explicitly.

Write `Gᶜ = G/Z_s`, where `Z_s` is the largest central `ℚ`-subtorus that is split over `ℝ` and has
no nonzero `ℚ`-split subtorus; this is neither the whole centre nor the adjoint group. Arithmetic
descent checks the action of the ineffective centre and of every finite stabilizer on fibres.
Neatness (AdelicAlgebraicGroups §4.3, `Neat.IsNeatLevel`) does not remove infinite central units. At
a non-neat level use equivariant sheaves on the stack; passage to a coarse space requires its own
fibre-triviality and tameness hypotheses.

Use the cohomological Hodge filtration unless homology is named. With `μ_h(z) = h_ℂ(z, 1)`, the
cocharacter `μ_h` acts on `H^{p,q}` by `z^{−p}`, and `F^a = ⊕_{p ≥ a} H^{p,q}`. The filtration
parabolic is `P_H = P(μ_h⁻¹)` with Levi `M = Z_G(μ_h)`; Boxer–Calegari–Gee–Pilloni use the opposite
`P_HT = P(μ_h)` and left cosets. Here `P(λ)` is the dynamic parabolic of a cocharacter `λ`, the
points `g` for which `λ(t) g λ(t)⁻¹` has a limit as `t → 0` (Tau Ceti
`TauCeti.Cocharacter.parabolic`). The fibre highest weight `λ` and the function character
`−w_{0,M} λ` are different labels. Tate and similitude lines remain explicit throughout.

For a right `P`-torsor `T` use `(t, v) ∼ (tp, ρ(p)⁻¹ v)`, so a section is a function with
`f(tp) = ρ(p)⁻¹ f(t)`. For a left action on `X` use `J(gh, x) = J(g, hx) J(h, x)`. The resulting
slash operator is `(f|g)(x) = J(g, x)⁻¹ f(gx)`, with `f|(gh) = (f|g)|h`. In Lean, `e.trans f`
applies `e` and then `f`. The determinant-negative `GL₂(ℝ)` scalar law is semilinear over `ℂ`; the
linear compatibility test is restricted to `SL₂`.

Write `V(J)` for the automorphic coefficient and `V(J)^can_Σ` for its canonical extension on `S_Σ`.
Put `V(J)^sub_Σ = V(J)^can_Σ ⊗ I_D`, where `D` is the **reduced** boundary. Boundary frames
characterize the canonical extension; its restriction to the open variety alone does not. Minimal
pushforwards are coherent and need not be locally free. A boundary blow-up need not pull back a
subcanonical extension isomorphically.

Over `L` set `M(J, K; L) = H⁰(S_Σ, V(J)^can_Σ)` and `S(J, K; L) = H⁰(S_Σ, V(J)^sub_Σ)`, section
spaces on a proper model. On Lan's good-prime integral model the scalar notation is
`AF(k, M) = Γ(S_Σ, ω_tor^k ⊗_R M)` for `k ≥ 0` and an arbitrary `R`-module `M`. For vector
coefficients use `Ecan(W) = V(W)^can` and `Esub(W) = Ecan(W) ⊗ I_D`.

At a cusp `Φ` retain the character lattice `X_Φ`, its positivity cone, the abelian torsor `C_Φ`, the
invertible character sheaves `Ψ_Φ(ℓ)`, the finite cover of the lower-dimensional moduli stack and
the **full** cusp stabilizer. The boundary determinant line is `L_Φ = det_ℤ(X_Φ) ⊗ ω_A`. The
relative invariant differential on a Tate fibre is `du/u`; `dq/q` lives on the base.

Use `H_g = tr_{p₁} ∘ θ_g ∘ p₂^*` and `T_g = ν(g) H_g`, with `ν` a multiplicative `K`-bi-invariant
character of the admissible monoid into `R^×`. Trace means the finite locally free trace, extended
through the specified toric refinement comparison. For `GL₂` choose `ν(g) = det(g)⁻¹` when comparing
with the analytic normalization. An unramified modular `ℓ`-correspondence has degree `ℓ + 1`, so
`T_ℓ(1) = (ℓ + 1)/ℓ` in weight zero. The numerical Lean specialization requires
`ℓ` prime; hence `ℓ ≠ 0` in `ℚ`, and it defines no correspondence at `ℓ = 0`. Use the transposed correspondence convention of
Boxer–Calegari–Gee–Pilloni, compared with the inverse/right-coset Hecke action of Tau Ceti.

For Hodge–Tate comparisons `ℚ_p(1)` has Hodge–Tate weight `−1` and Sen eigenvalue `+1`.
Boxer–Calegari–Gee–Pilloni §4.5 includes the `μ`-weight twist in the classical `VB⁰` comparison;
§4.8 uses untwisted coherent coefficients and puts the Tate twists into the decomposition. Count
each twist once.

All proposed names lie under `AutomorphicBundles`; names in the text omit that common prefix.
Suggested module homes are `TauCeti/Geometry/Shimura/AutomorphicBundles/`, with `Principal`,
`Coefficients`, `Extensions`, `ClassicalForms`, `FourierJacobi`, `Hecke`, `Hilbert` and
`SiegelComparison` submodules. A functorial map API includes identity and composition laws with the
datum, level, base and coefficient hypotheses held fixed; these laws also test independence of proof
terms.

## Exact supplier contracts

### From Mathlib (pinned)

- Linear coefficients and slash actions: `SlashAction`, `SlashAction.slash_mul`,
  `LinearEquiv.trans`, `LinearEquiv.trans_symm`, `LinearEquiv.symm_apply_eq`,
  `LinearEquiv.automorphismGroup`, `LinearEquiv.applyDistribMulAction`; the scalar `GL₂` conventions
  `UpperHalfPlane.denom_ne_zero`, `UpperHalfPlane.denom_cocycle`, `UpperHalfPlane.denom_cocycle'`,
  `ModularForm.SL_slash_apply`, `ModularForm.slash_action_eq'_iff`, `ModularForm.smul_slash` (the
  last records the determinant-sign semilinearity).
- Analytic modular forms: `ModularForm`, `CuspForm`, `UpperHalfPlane.qExpansion`,
  `ModularForm.qExpansion_injective`, `ModularForm.isCuspForm_iff_coeffZero_eq_zero` (the
  constant-coefficient cusp criterion is the full-level case only), and the unnormalized
  finite-index sums `ModularForm.trace`, `CuspForm.trace`, which are not the geometric trace.
- Scheme modules: `AlgebraicGeometry.Scheme.Modules`, `.presheaf`, `.pushforward`,
  `.pushforward_obj_obj`, `SheafOfModules.sections`, `SheafOfModules.sectionsMap`,
  `AlgebraicGeometry.tilde.isoTop` (evaluation of affine tilde modules).
- Algebra used in the expansion principle: `CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono`
  (no epimorphism hypothesis on the last map),
  `IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime`,
  `IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime`,
  `Ideal.iInf_pow_smul_eq_bot_of_isLocalRing`, `IsHausdorff.of_isLocalRing`,
  `AdicCompletion.of_injective` (finite-stalk separation at a proper ideal),
  `PowerSeries.isUnit_iff_constantCoeff` (the completion obstruction), and for traces
  `Algebra.trace_algebraMap_of_basis`, `Algebra.trace_trace`, `LinearMap.trace_baseChange`.
- Cocharacter inversion: `AddMonoidAlgebra.mapDomainBialgHom` and `LaurentPolynomial.invert`.

### From Tau Ceti (pinned)

- Dynamic subgroups of a cocharacter `l : H →ₐc[R] R[T;T⁻¹]` of an affine group `Spec H`:
  `TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.levi`, `TauCeti.Cocharacter.unipotent`, with
  the Levi decomposition on points (`TauCeti.Cocharacter.limit_mem_levi`,
  `TauCeti.Cocharacter.unipotent_sup_levi`); representability of these subfunctors is not supplied
  at the pins; its general theory belongs to ReductiveGroups Layers 7–8.
- Algebraic-group quotients: `TauCeti.CommHopfAlgCat.centerQuotientFppfSheaf` and the general fppf
  quotient by a normal subgroup with its torsor square
  `TauCeti.CommHopfAlgCat.isPullback_fppfQuotientTorsor`; representability is supplied by
  ReductiveGroups Layer 3, specialized to `Z_s` in B0.1.
- Hecke rings: `HeckeCosetModule.instRingHeckeRing`, `HeckeRing.GL2.heckeRingHomCharSpace`,
  `HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime` (analytic nebentypus action at good
  primes), and the sheafified tensor product `AlgebraicGeometry.Scheme.Modules.tensorProduct`.

### From TauCetiRoadmap roadmaps

- **AlgebraicVectorBundles.** L0A (sheaf tensor, internal Hom, pullback and duality), L0B
  (finite locally free sheaves and their finite projective affine models), L0C (exterior,
  symmetric and determinant operations). The new construction in B0.4 is descent of an
  associated coefficient along a group torsor, not a second vector-bundle carrier.
- **ReductiveGroups.** Layer 3 (normal subgroup quotients and their representability), Layer 7
  (parabolics, Levis and the dynamic route). B0.1 fixes the particular ineffective central
  torus; B0.3 fixes Hodge versus opposite conventions. Neither reconstructs the general theory.

- **ModularForms.** Layer 10C (the automorphy sheaf on the coarse curve `X(Γ)`) and Layer 2
  (`heckeRingHomCharSpace` and the arithmetic normalization of `T_n`): the analytic side of B4.10
  and B5.13.
- **RepresentationTheory/ClassicalGroups.** Layer 2 (`schurFunctor`) and Layer 3 (`DominantWeight`,
  the theorem of the highest weight for `GLₙ`): complex Schur coefficients of B4.16 and the
  highest-weight labels of B2.3. The rational, nonsplit and integral forms needed for Levi
  coefficients are additional and are planned in B2.3 and B3.10.
- **ReductiveGroupsPartII.** RG2.0a.3 (*deligne-torus*, the cocharacter `μ : z ↦ (z, 1)`): the
  convention for `μ_h`.
- **AdelicAlgebraicGroups.** §4.3 (`Neat.IsNeatLevel`), §4.5 (*Hecke correspondences*,
  `LevelMaps.hecke`; *Degree of a Hecke correspondence*; *Cartesian squares of level maps*, which
  needs `U′L = U`): the group-theoretic part of the Hecke targets of Layer B5.

### From other roadmaps

| Roadmap and layer | Used for |
|---|---|
| SchemeAndStackFoundations SF.1 (*torsor* `Groups.Torsor`, *qcoh-fpqc-descent*, *stack-quasi-coherent*, *keel-mori*, *finite-quotient-coarse*, *tame-stack*), SF.2 (*qcoh-higher-direct-images*), SF.4 (*stein-factorization*) | torsors, descent, coherent sheaves on stacks, coarse spaces, Stein factorization |
| AlgebraicModuliForArithmeticGeometry §3.1 (`fpqcQuasicoherentDescent`), §5.3 (`TauCeti.ArithmeticModuli.tame_finite_flat_descent`), §7.10.3 (`properSchemeGagaEquivalence`) | descent of coefficients, tame coarse descent, proper GAGA |
| AdicSpacesPartII F0 (`FormalScheme.completion`, `FormalScheme.completion.map`, completion of coherent sheaves, sections near a closed subset after EGA I (10.8.11)) | formal boundary charts |
| ComplexComparisonPartII C0 (`CoherentAnalytification`, `coherentPullbackOperations`), C2 (`projectiveGeometricDictionaries`) | analytification and projective GAGA |
| AbelianSchemesAndArithmeticModuli A4 (`AbelianH1dR`, `AbelianTate`, `exteriorCohomology`) | relative `H¹_dR`, Hodge sequence, Gauss–Manin, Tate modules |
| ShimuraData D3 (*compact-dual*, *filtration-parabolic*, *borel-embedding*, *homogeneous-variation*, *reflex-flag-descent*) | compact duals and homogeneous variations |
| AlgebraicModularFormsAndSerreWeights R15.1 (*Geometric modular forms*, *All-weight analytic comparison*), R15.2 (*The q-expansion principle*, *Integral geometric Hecke operators*, *The equivariant cuspidal sequence*) | the GL₂ specialization |
| ShimuraVarieties V1, V2, V4–V8, V8.general | towers, minimal compactification, CM reciprocity, canonical models, conjugation |
| PELModuli M0, M3, M5 | PEL data, universal families, Siegel and `GU(1,1)` examples |
| HilbertModularVarietiesAndShimuraCurves H0–H4 | Hilbert data, families, splitting models, cusps and central kernels |

### From the bundle partner ShimuraCompactifications

C0 (*relative-torus-embedding*, *relative-stratum-quotient*, *relative-face-open*), C1
(*cusp-label*, *arithmetic-stabilizer*), C2 (*arithmetic-gluing*, *smooth-normal-crossings*,
*projective-algebraization*, *minimal-boundary-map*), C2.general (*general-toroidal-descent*), C3
(*refinement-map*, *choice-comparison*, *refinement-boundary-ideal*,
*coherent-cohomology-invariance*, *hecke-span*), C3.general (*general-map-descent*), C4
(*semi-abelian-scheme*, *formal-universal-degeneration*, *tate-degeneration-comparison*), C5
(*integral-toroidal-space*, *formal-completion*, *integral-coefficient-extension*,
*hodge-semiampleness*, *graded-section-finite-generation*, *minimal-hodge-ampleness*,
*hodge-line-fourier-jacobi-expansion*, *neat-strata-detect-geometric-components*) and C6
(*hilbert-toroidal-model*, *hilbert-boundary-formal-comparison*,
*hilbert-minimal-formal-comparison*, *hilbert-q-expansion-injective*). ShimuraCompactifications C5
*integral-coefficient-extension* leaves to B3.10 the check that general automorphic canonical
extensions are formally canonical, and C3 *coherent-cohomology-invariance* leaves to B3.5 the
identification `f^*E^can = E′^can`.

### Missing comparison prerequisites

**Gap.** The following contracts require constructions not provided by earlier layers, the
compactification partner or lower-tier suppliers. The conditional comparisons B4.21 and
B5.20–B5.22 retain their precise conclusions, but are not closed end theorems of this build.
An assumed period torsor, comparison or degeneration theorem does not construct that object
or prove that theorem. In particular the local-system construction, logarithmic comparison,
dual BGG complex and degeneration must be separated before these targets can be unconditional.

- `HodgeTateVBInput` (used by B4.21 and B5.20). For the neat-level Siegel or Hodge-type toroidal
  tower at `p` with tame level `K^p` and a sufficiently large `p`-adic field: a rational Hodge–Tate
  `M`-torsor over the tower and the functor `VB` from finite-dimensional algebraic
  `M`-representations to `O^sm`-modules, compatible with refinements, level maps and prime-to-`p`
  Hecke maps ([BCGP], §4.5, pp.72–80, and §§4.6.1–4.6.2, pp.81–82). The perfectoid tower,
  its rational period torsor and the finite-dimensional descent
  needed for this functor have no construction in this build.
- `LogHodgeTateInput` (used by B5.20–B5.22). The canonical pro-Kummer-étale local system of a
  finite-dimensional representation on the toroidal compactification, with the logarithmic
  Hodge–Tate comparison of its cohomology and of its compactly supported cohomology, equivariant for
  `G_{ℚ_p}` and the prime-to-`p` Hecke algebra, with the Tate normalization fixed above (the input
  of [BCGP], Theorem 4.8.2, pp.101–102). Neither the logarithmic local system nor either
  comparison is constructed in this build.
- `DualBGGInput` (used by B5.21–B5.22). For `GSp₄`, the dual BGG/Kostant identification of the
  graded pieces of the logarithmic de Rham complex of `V_κ^∨` with the coherent sheaves of the four
  weights `−w_{0,M}(w·κ + 2ρ_M)`, `w ∈ ^M W` ([BCGP], §4.8 before Remark 4.8.1, p.101, after
  [FC90], VI §5, Proposition 5.4 and Theorem 5.5, pp.233–234, and VI §6, Theorem 6.2(i), p.241).
  Identification of graded pieces alone does not establish degeneration or the `p`-adic
  comparison. Tau Ceti RepresentationTheory/LieHighestWeight has Verma modules and
  the Weyl character formula but no Kostant theorem on `𝔫`-cohomology and no BGG resolution.

### Missing ramified Hilbert boundary geometry

**Gap.** The Hilbert formal comparisons cited from ShimuraCompactifications C6 are for its
Dimitrov model and level hypotheses. They do not identify the completions of Diamond's
Pappas–Rapoport splitting model with its line-valued cusp series for every ramified `p`,
including `p = 2`. The splitting model from HilbertModularVarietiesAndShimuraCurves H2 supplies
the open moduli space and filtration, not that boundary comparison. The required variant
must construct the semi-abelian extension on the ramified toroidal model, its toroidal and
minimal formal cusp charts, transport of the splitting-filtration line and unit action,
and detection by cusps in the relevant residue fibres. The characteristic-zero or tame
C6 comparison alone is insufficient. Sources for the variant are [Diamond22], §§2.7–2.10,
pp.6–8, and §§6.1–6.2, pp.24–25, together with [Diamond21], Proposition 7.2.1, p.37.
B4.15 and B5.16–B5.18 therefore retain these precise boundary data as an unsupplied contract;
the ramified Hilbert specialization of B5.19 has the same gap.

## How to read the build

`README.md` is normative; `Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the
targets whose carriers exist there. Every target ends with a *Lean:* line naming its declarations in
`Suggested.lean`, or reading *Lean:* none, in which case the target is specified here only and
building its objects is part of the target. A Check label in backticks names an `example` or
declaration of `Suggested.lean` when one exists there; otherwise it is the proposed name of the
test. In *Needs* clauses `B3.2` is a subsection of this roadmap, a name in backticks is a
declaration, and an italic slug such as *coherent-cohomology-invariance* is a target of the named
roadmap layer. The layers are built in order: B0 fixes the coefficient group and associated bundles;
B1 builds the canonical principal bundle of Hodge and abelian type, B1.general that of general data;
B2 and B2.general associate vector bundles and realizations to representations; B3 and B3.general
extend them across the toroidal boundary; B4 defines classical and cuspidal forms and fixes the
explicit weight conventions; B5 equips them with Hecke operators, expansions and the Siegel
Hodge–Tate comparison.

## Layer B0: coefficients, associated bundles and descent

This layer fixes the coefficient group, the parabolic conventions and the algebraic and analytic
descent of coefficients. Associated bundles of torsors are constructed once, by fpqc descent (B0.4),
and every later coefficient is an instance. The compact dual, its reflex flag and Borel embedding
come from ShimuraData D3 and the analytic tower from ShimuraVarieties V1. The central and
coefficient-field checks belong to the construction, before any weight is chosen.

### B0.1 The coefficient quotient Gᶜ

Construct `centralSplitQuotient`. For a reductive ℚ-group in a Shimura datum, form the algebraic
quotient Gᶜ = G/Z_s. Here Z_s is the largest central ℚ-subtorus that splits over ℝ and has no
nonzero ℚ-split subtorus; use Milne's character-lattice description, equivalently Lan's removal of
excess real split rank. Algebraic representations factor through the quotient exactly when Z_s acts
trivially. For GL₂ this torus is trivial; for Res_{F/ℚ}GL₂ with F totally real of degree d its
dimension is d−1. The quotient retains central characters that an adjoint quotient would erase.

*Source:* [Milne90], III §1, p.52; III §3, p.58; [LanIntro], §5.3 Theorem 5.3.1, p.63.

The API:

- `centralSplitQuotient_quotient`: The algebraic epimorphism q:G→Gᶜ has kernel Z_s.
- `centralSplitQuotient_factor`: If ρ|Z_s=1 there is a unique ρᶜ with ρ=ρᶜ∘q.
- `centralSplitQuotient_factor_iff`: An algebraic representation factors through q iff Z_s acts
  trivially.

*Needs:* Tau Ceti `TauCeti.CommHopfAlgCat.centerQuotientFppfSheaf` and the fppf quotient by a normal
subgroup; TauCetiRoadmap.ReductiveGroups Layer 3 (quotient representability) and Layer 6
(centre, radical and central isogenies).
*Lean:* none; specified in the README only.

**Checks.**

- `centralSplitQuotient_test_gl2` (computation): For G=GL2/Q, ranks of its centre over Q and R
  agree, so Z_s=1 and Gᶜ=G.
- `centralSplitQuotient_test_hilbert` (non-example): For G=Res(F/Q)GL2 with [F:Q]>1 totally real,
  Z_s has dimension [F:Q]−1; replacing Gᶜ by G without a central condition admits forbidden
  coefficients.
- `centralSplitQuotient_test_trivial` (degenerate): The trivial representation factors through Gᶜ
  and stays trivial.

### B0.2 Ineffective stabilizers and coefficient descent

Prove `ineffectiveFibreDescent`. Separate the arithmetic group from its effective action on the
Hermitian domain. Check the action of its ineffective central kernel on every coefficient fibre
before descending the analytic bundle. For a finite tame quotient in characteristic zero, descent of
an equivariant locally free coefficient to the coarse space is equivalent to trivial stabilizer
actions on the fibres. An infinite arithmetic central kernel needs the separate effective-quotient
argument; a neat group can still contain nontrivial central units. Retain the stack coefficient
whenever the fibre-triviality or tame assumption fails.

*Source:* [Milne90], III §8, pp.63–64.

*Needs:* B0.1 (`centralSplitQuotient`); AlgebraicModuliForArithmeticGeometry §5.3
`TauCeti.ArithmeticModuli.tame_finite_flat_descent`; SchemeAndStackFoundations SF.1
(*finite-quotient-coarse*, *tame-stack*).
*Lean:* none; specified in the README only.

**Checks.**

- For a Hilbert datum a neat arithmetic subgroup can still contain infinitely many central units; no
  implication neat⇒trivial coefficient centre is used.

### B0.3 Hodge and opposite parabolic conventions

Construct `hodgeParabolicConvention`. Fix μ_h(z)=h_ℂ(z,1) acting by z^(−p) on H^{p,q}, with
F^a=⊕_{p≥a}H^{p,q}. Construct the filtration stabilizer P_H=P(μ_h⁻¹), with Levi Z_G(μ_h), from D3's
filtration parabolic and compact dual, as the dynamic parabolic of the inverse cocharacter (Tau Ceti
`TauCeti.Cocharacter.parabolic`). Use the generic representability and Levi theory from
ReductiveGroups Layers 7–8; the new assertion here is its identification with the Hodge filtration
and the opposite-coset coefficient convention. Compare it explicitly with the opposite
P_HT=P(μ_h) and BCGP's
left-coset flag. The comparison includes inversion of left/right cosets and the required dual
coefficient. A sign choice for μ alone does not identify the two associated bundles. The
pointwise Lean specialization uses a commutative Hopf algebra over a commutative ring and evaluates
on commutative algebras; it asserts inversion and intersection, not representability or a Hodge
structure on an arbitrary Hopf algebra.

*Source:* [CS], §2.3, pp.669–671; [BCGP], §3.2.13–3.2.16, p.44; §4.8 before Remark 4.8.1, p.101;
[ConradLuminy], Theorem 4.1.7 and its proof, pp.112–113 (the dynamic subgroups `P_G(λ)`,
`Z_G(λ) = P_G(λ) ∩ P_G(−λ)` for an affine group over a ring).

*Needs:* ShimuraData D3 (*filtration-parabolic*, *compact-dual*); Tau Ceti
`TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.levi`, `TauCeti.Cocharacter.unipotent`;
Mathlib `AddMonoidAlgebra.mapDomainBialgHom`; TauCetiRoadmap.ReductiveGroups Layers 7–8;
TauCetiRoadmap.ReductiveGroupsPartII RG2.0a.3
(*deligne-torus*).
*Lean:* `inverseCocharacter`, `inverseCocharacter_inverseCocharacter`, `hodgeParabolic`,
`hodgeTateParabolic`, `levi_inverseCocharacter`, `hodgeParabolic_inf_hodgeTateParabolic`.

**Checks.**

- For GL2 homology type (−1,0),(0,−1), the stabilizer preserves F⁰, whereas the opposite stabilizes
  the complementary line.
- `hodgeParabolic_test_levi` (compatibility): the Levi `Z_G(μ)` is contained in `P(μ⁻¹)`, since a
  cocharacter and its inverse centralize the same points.
- `hodgeTateParabolic_test_levi` (compatibility): the same Levi is contained in `P(μ)`; together
  with `hodgeParabolic_inf_hodgeTateParabolic` this pins the two parabolics as opposite.
- `hodgeParabolic_test_gl2` (computation): for `GL₂` with `μ(z) = diag(z, 1)` acting on
  `H^{−1,0} ⊕ H^{0,−1}`, conjugation by `μ(t)` multiplies the lower-left entry by `t⁻¹`; so `P(μ)`
  is the upper-triangular Borel and `P(μ⁻¹)` the lower-triangular one. A convention that takes
  `P(μ)` as the stabilizer of the Hodge filtration picks the wrong Borel.

### B0.4 Associated bundles of torsors

Construct `contractedProduct`. Let `S₀` be a scheme, `G` a flat affine group scheme over `S₀` with
Hopf algebra `H`, `π : P → S` a right `G`-torsor over an `S₀`-scheme `S` for the fpqc topology, and
`ρ : G → GL(V)` a representation on a finite locally free `O_{S₀}`-module `V` (an `H`-comodule).
Define the associated bundle `P ×^G V` as the quasi-coherent `O_S`-module obtained by descending,
along `π`, the module `O_P ⊗ V` with the descent datum given by `(t, v) ∼ (tg, ρ(g)⁻¹ v)`. It is
finite locally free of the rank of `V`, and `π^*(P ×^G V) ≅ O_P ⊗ V` as `G`-equivariant modules.
Over a field `k` and a `k`-variety `S` the functor `𝓥 ↦ π^*𝓥` is an equivalence between vector
bundles on `S` and `G`-vector bundles on `P`, and `P ×^G V` is the bundle corresponding to the
`G`-vector bundle `P × V` ([Milne90], III Lemma 3.1, p.58); in general the same construction is fpqc
descent along the cover `π`, which trivializes `P` (AlgebraicModuliForArithmeticGeometry §3.1).

*Hypotheses.* `G` is flat and affine over `S₀` and `P` is locally trivial for the fpqc topology; no
smoothness of `G` is required. `V` is finite locally free, which makes `P ×^G V` finite locally
free; for an arbitrary comodule the construction gives a quasi-coherent module and no rank
statement.

*Source:* [Milne90], III Lemma 3.1, p.58, and Proposition 3.5, p.58.

The API:

- `contractedProduct_pullback`: `π^*(P ×^G V) ≅ O_P ⊗ V`, `G`-equivariantly.
- `contractedProduct_trivial`: for the trivial torsor `G ×_{S₀} S` the associated bundle is
  `O_S ⊗ V`.
- `contractedProduct_map`: a `G`-equivariant map `u : V → W` induces `P ×^G u`, with identity and
  composition laws.
- `contractedProduct_tensor`: tensor products, duals and the unit are preserved by canonical
  isomorphisms.
- `contractedProduct_baseChange`: formation commutes with base change along `S′ → S`.
- `contractedProduct_rank`: `P ×^G V` is locally free of rank `rk V`.

*Needs:* SchemeAndStackFoundations SF.1 (*torsor* `Groups.Torsor`, *qcoh-fpqc-descent*);
AlgebraicModuliForArithmeticGeometry §3.1 `fpqcQuasicoherentDescent`; Tau Ceti
`TauCeti.CommHopfAlgCat.isPullback_fppfQuotientTorsor`.
*Lean:* none; specified in the README only.

**Checks.**

- `contractedProduct_test_unit` (degenerate): the trivial one-dimensional representation gives
  `O_S`.
- `contractedProduct_test_line` (computation): for `G = 𝔾_m`, `P = Isom(O_S, 𝓛)` the frame torsor of
  a line bundle `𝓛` with `η·g = η ∘ g`, and the character `χ(g) = g`, the map `[η, v] ↦ η(v)`
  identifies `P ×^G χ` with `𝓛`, and `χ⁻¹` gives `𝓛^∨`. A construction with `(t, v) ∼ (tg, ρ(g) v)`
  exchanges the two answers.
- `contractedProduct_test_point` (compatibility): over `S = Spec k` with the trivial torsor,
  `P ×^G V` is the underlying vector space of `V`; for the nontrivial line bundle `𝓛 = O(1)` on `ℙ¹`
  the weight-one and weight-zero characters, which have the same underlying space, give `O(1)` and
  `O`, so the bundle depends on `ρ` and not only on `V`.

### B0.5 Equivariant coefficients on the compact dual

Construct `compactDualCoefficient`. Over the actual coefficient field L, let V be a
finite-dimensional algebraic representation of P_Hᶜ. Define its Gᶜ-equivariant bundle on the compact
dual by Gᶜ×^{P_Hᶜ}V, using (g,v)∼(gp,ρ(p)⁻¹v). Allow parabolic representations with nontrivial
unipotent action as well as representations factoring through the Levi. Supply morphisms,
tensor/dual/unit identifications and pullback. On the GL₂ flag the tautological character gives
O(−1); its inverse gives O(1).

*Source:* [Milne90], III §2, Remark 2.3(a), pp.54–56.

The API:

- `compactDualCoefficient_fibre`: At the base flag the P-equivariant fibre is V with action ρ.
- `compactDualCoefficient_inflate`: The coefficient for an M representation equals that for its
  inflation to P.
- `compactDualCoefficient_tensor`: Associated coefficients preserve tensor products, duals and the
  tensor unit.
- `compactDualCoefficient_map`: For a Pᶜ-equivariant linear map u:V→W over the fixed coefficient
  field, the induced map sends [g,v] to [g,u(v)] on the associated compact-dual bundles.
- `compactDualCoefficient_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `compactDualCoefficient_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced
  map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level,
  field and model hypotheses remain fixed.

*Needs:* B0.1 (`centralSplitQuotient`); B0.3 (`hodgeParabolicConvention`); ShimuraData D3
(*reflex-flag-descent*); AlgebraicModuliForArithmeticGeometry §3.1 `fpqcQuasicoherentDescent`; B0.4
(`contractedProduct`).
*Lean:* none; specified in the README only.

**Checks.**

- `compactDualCoefficient_test_unit` (degenerate): The trivial one-dimensional representation yields
  O_X̌.
- `compactDualCoefficient_test_gl2` (compatibility): For G=GL2/L and P the stabilizer of Le₁, the
  contracted-product bundle for χ(p)=a when pe₁=ae₁ is O_(P¹)(−1), via [g,v]↦vge₁; the inverse
  character χ⁻¹ gives O_(P¹)(1). The cohomological Hodge convention must declare which of these
  characters is used.
- `compactDualCoefficient_test_unipotent` (non-example): The standard P representation with a
  nontrivial upper-triangular unipotent action is not isomorphic as P-module to its associated
  graded inflation.

### B0.6 The analytic filtration torsor

Construct `homogeneousHodgeTorsor`. Pull the compact-dual P_Hᶜ-torsor back along the actual Borel
embedding X→X̌. Its quotient by the unipotent radical is the torsor of graded Hodge frames. Give the
compatible action and associated coefficient identification. A connection on the full group torsor
does not automatically give a flat connection on this filtration reduction.

*Source:* [CS], §2.3, p.670.

The API:

- `homogeneousHodgeTorsor_filtered_frames`: A point is a tensor-compatible frame identifying the
  reference and varying filtrations.
- `homogeneousHodgeTorsor_graded`: The U quotient parametrizes individual frames of the graded
  pieces.
- `homogeneousHodgeTorsor_pullback_coefficient`: Associating a P coefficient to this torsor is the
  Borel pullback of its compact-dual bundle.

*Needs:* B0.5 (`compactDualCoefficient`); ShimuraData D3 (*borel-embedding*,
*homogeneous-variation*).
*Lean:* none; specified in the README only.

**Checks.**

- `homogeneousHodgeTorsor_test_point` (computation): At the reference point the torsor has its
  reference frame.
- `homogeneousHodgeTorsor_test_standard` (compatibility): For the symplectic standard representation
  the associated filtration is the Hodge exact sequence.
- `homogeneousHodgeTorsor_test_graded` (non-example): Two filtered frames differing by a nonidentity
  unipotent element have the same graded frame, but remain distinct filtered frames.

### B0.7 Analytic arithmetic-quotient coefficients

Construct `analyticCoefficient`. For the actual arithmetic quotient of X, descend the Borel-pulled
homogeneous coefficient through the effective group. Require a torsion-free effective action and
trivial action of the ineffective kernel on fibres, or retain the equivariant stack formulation.
Obtain its holomorphic bundle structure from the Borel embedding and coefficient, rather than from a
quotient of smooth spaces alone.

On an adelic component write the coefficient as Γ\\(G(ℝ)×V)/K_∞, with (g,v)·k=(gk,ρ(k)⁻¹v). Its
holomorphic structure is the one induced by the compact-dual coefficient, with the same
ineffective-kernel descent condition.

*Source:* [HarrisBundles], Entire note, pp.1–2.

The API:

- `analyticCoefficient_local_trivial`: A small quotient chart identifies the coefficient with its
  holomorphic product bundle.
- `analyticCoefficient_section_equiv`: Sections correspond to equivariant functions under the
  diagonal fibre relation.
- `analyticCoefficient_change_frame`: Changing the frame conjugates the transition cocycle and
  preserves the descended bundle.
- `analyticCoefficient_map`: An equivariant morphism u between the supplied compact-dual
  coefficients descends on each effective analytic quotient; in a compatible frame it sends the
  class of (x,v) to (x,u(v)).
- `analyticCoefficient_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `analyticCoefficient_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map
  of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field
  and model hypotheses remain fixed.

*Needs:* B0.2 (`ineffectiveFibreDescent`); B0.6 (`homogeneousHodgeTorsor`).
*Lean:* none; specified in the README only.

**Checks.**

- `analyticCoefficient_test_trivial` (degenerate): The trivial representation gives the holomorphic
  structure sheaf on Γ_eff\X.
- `analyticCoefficient_test_odd` (non-example): The −1 stabilizer acts by −1 on an odd-weight GL2
  coefficient, so that coefficient does not descend to the coarse quotient unless that stabilizer is
  removed.
- `analyticCoefficient_test_rank` (characterisation): The local rank equals dim V, independent of
  the arithmetic component.

### B0.8 Sections as equivariant functions

Prove `sectionsEquivariant`. Identify sections of the associated bundle of a right P-torsor T with
coefficient-valued functions satisfying f(tp)=ρ(p)⁻¹f(t). In a local frame on a left arithmetic
quotient this becomes f(γx)=J(γ,x)f(x), where J(gh,x)=J(g,hx)J(h,x). Establish the identifications
with their regular or holomorphic hypotheses, and their compatibility with coefficient maps and
frame changes.

*Source:* [HarrisBundles], p.1, equation (1) and its consistency check.

*Needs:* B0.5 (`compactDualCoefficient`); B0.7 (`analyticCoefficient`).
*Lean:* none; specified in the README only.

**Checks.**

- Noncommuting fibre maps distinguish this relation from the wrong product order.

### B0.9 Descent over the coefficient field

Construct `coefficientGaloisDescent`. For a finite Galois splitting extension L/E, descend the
equivariant coefficient using its actual semilinear transport maps and cocycle. Tensor, dual and
base-extension operations commute with this descent. A highest weight descends only with the
representation's Galois datum; use its stabilizer field where necessary. In an embedding-labelled
example a parallel tensor survives permutation of factors, whereas a nonparallel label is not
automatically defined over E.

*Source:* [Milne90], III §5, Theorem 5.1, p.61.

The API:

- `coefficientGaloisDescent_base_change`: The descended coefficient tensored with L is the original
  J with its given descent maps.
- `coefficientGaloisDescent_unique`: Morphisms over E are exactly L-morphisms compatible with all
  d_σ.
- `coefficientGaloisDescent_associate`: Descent commutes with association to a descended principal
  torsor.
- `coefficientGaloisDescent_map`: A coefficient morphism commuting with the actual semilinear Galois
  descent isomorphisms descends uniquely; its base change is the supplied split-coefficient
  morphism.
- `coefficientGaloisDescent_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `coefficientGaloisDescent_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the
  induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum,
  level, field and model hypotheses remain fixed.

*Needs:* AlgebraicModuliForArithmeticGeometry §3.1 `fpqcQuasicoherentDescent`; B0.5
(`compactDualCoefficient`).
*Lean:* none; specified in the README only.

**Checks.**

- `coefficientGaloisDescent_test_identity` (degenerate): For L=E and the identity datum descent
  returns J.
- `coefficientGaloisDescent_test_parallel` (computation): For a real quadratic F split by L/E, the
  split tensor of the two embedding-labelled Hodge lines with equal exponent r admits the
  factor-swap descent isomorphism; applying the nontrivial permutation twice is identity. Retain the
  actual descent datum of the underlying HB family.
- `coefficientGaloisDescent_test_nonparallel` (non-example): For a real quadratic F and weight
  (k1,k2) with k1≠k2, the nontrivial embedding permutation does not fix the label; it cannot be
  descended by declaring all d_σ identities.

### B0.10 Algebraic and analytic coefficient descent

Prove `geometricAnalyticCoefficients`. Compare the analytification of the actual algebraic
associated coefficient with the holomorphic bundle constructed from the same torsor and
representation. The comparison respects equivariant sections and tensor maps. Prove it by descent on
the named torsor charts; no assertion of coherent GAGA for a nonproper open variety is needed.

*Source:* [Milne90], III §3, Lemma 3.1 and Propositions 3.2–3.5, pp.58–59.

*Needs:* B0.9 (`coefficientGaloisDescent`); B0.7 (`analyticCoefficient`); ComplexComparisonPartII C0
(`CoherentAnalytification`, `coherentPullbackOperations`).
*Lean:* none; specified in the README only.

**Checks.**

- The comparison transports the same frame factor, not merely an isomorphic unfiltered smooth
  bundle.

### Examples

- For `G = GL₂` over `ℚ` the centres over `ℚ` and `ℝ` have the same split rank, so `Z_s = 1` and
  `Gᶜ = G`; for `Res_{F/ℚ} GL₂` with `[F : ℚ] = d` totally real, `Z_s` has dimension `d − 1` (B0.1).
- On the `GL₂` flag `ℙ¹`, with `P` the stabilizer of `L e₁` and `χ(p) = a` when `p e₁ = a e₁`, the
  contracted product for `χ` is `O(−1)` and for `χ⁻¹` is `O(1)` (B0.5); the cohomological Hodge
  convention declares which character is used.
- The stabilizer `−1` of `SL₂(ℤ)` acts by `(−1)^k` on the weight-`k` coefficient, so odd weights do
  not descend to the coarse quotient (B0.7).

### Dependencies

ShimuraData D3; ShimuraVarieties V1; SchemeAndStackFoundations SF.1;
AlgebraicModuliForArithmeticGeometry §§3.1, 5.3; ComplexComparisonPartII C0; Tau Ceti dynamic
parabolics and fppf quotients.

## Layer B1: canonical principal bundles of Hodge and abelian type

Begin with the actual Hodge-type universal family and its degree-one comparisons. Finitely many
tensors specify the group, absolute Hodge theory transports those tensors, and their de Rham frames
construct the torsor. The filtration reduction, the special-point normalization and independence of
the symplectic embedding identify its canonical rational model. Connected central-isogeny descent
supplies the abelian-type extension.

### B1.1 Reductive groups as tensor stabilizers

Prove `finiteTensorStabilizer`. For a faithful representation of a reductive group in characteristic
zero, choose finitely many mixed tensors whose scheme-theoretic pointwise stabilizer is exactly the
group. Include duals and the stated Tate-coordinate convention. Stabilizing a line up to scalar is a
weaker condition and does not provide the tensor-preserving frame torsor used here.

*Source:* [Deligne], §3 Proposition 3.1(a–c), pp.22–23; [CS], §2.3, p.667.

*Needs:* Tau Ceti comodule representations (`TauCeti.Algebra.AlgebraicGroup.Representation`) and
linear reductivity (`TauCeti.Algebra.AlgebraicGroup.LinearlyReductive`).
*Lean:* none; specified in the README only.

**Checks.**

- For GSp(V,ψ) include the similitude/Tate line; requiring ψ to be fixed in V∨⊗V∨ alone cuts out Sp,
  not GSp.

### B1.2 Absolute Hodge tensors in abelian families

Prove `absoluteHodgePropagation`. Let A be an abelian variety over an algebraically closed field of
characteristic zero, with a chosen embedding into ℂ. Every rational Hodge tensor built from H¹(A),
its dual and Tate twists is absolute Hodge. For a smooth proper abelian family over a connected
smooth complex base, a horizontal tensor of type (0,0) at every fibre propagates from being absolute
Hodge at one fibre to being absolute Hodge at all fibres. Retain the compatible Betti, de Rham and
étale realizations in this propagation. This gives absolute Hodge classes without an assertion that
they are algebraic cycles or that every motive has an abelian realization.

*Source:* [Deligne], Main Theorem 2.11, p.19; Principle B, Theorem 2.12, p.20, and Theorem 2.15,
p.21; Proposition 6.1, pp.41–42; [CS], §2.3 Lemma 2.3.2, pp.668–669.

*Needs:* AbelianSchemesAndArithmeticModuli A4 (`AbelianH1dR` with its Hodge sequence and Gauss–Manin
connection, `AbelianTate`, `exteriorCohomology`).
*Lean:* none; specified in the README only.

**Checks.**

- Algebraic endomorphisms and polarization tensors of a CM elliptic curve satisfy the statement; no
  integral Hodge conjecture is used.

### B1.3 Descended Hodge-tensor realizations

Construct `hodgeTensorRealizations`. For a Hodge-type datum with a chosen symplectic embedding and
sufficiently small level, let A/S be the universal abelian scheme over the canonical reflex field E.
Realize the finite defining family of rational Hodge tensors in H=H₁(A)=(R¹π_\*)∨ and its Betti,
étale and de Rham tensor constructions, including Tate twists. The de Rham tensors are horizontal,
lie in the required filtration and descend to E using arithmetic Galois invariance and
absolute-Hodge comparison. The standard homology module is the dual of relative H¹ and carries the
declared Tate lines. The realizations preserve the tensor relations defining Gᶜ.

*Source:* [CS], Lemmas 2.3.1–2.3.2, pp.668–669; [AG], §3.3; §3.5, pp.418–422.

The API:

- `hodgeTensorRealizations_horizontal`: The de Rham defining tensors satisfy ∇sα,dR=0.
- `hodgeTensorRealizations_compare`: The Betti–de Rham and Betti–étale comparisons send each sα to
  its named realization, with the same Tate normalization.
- `hodgeTensorRealizations_galois`: After base change to Ebar the named tensor sections are fixed by
  Gal(Ebar/E), hence descend to E.

*Needs:* B1.1 (`finiteTensorStabilizer`); B1.2 (`absoluteHodgePropagation`);
AbelianSchemesAndArithmeticModuli A4 (`AbelianH1dR` with its Hodge sequence and Gauss–Manin
connection, `AbelianTate`, `exteriorCohomology`); PELModuli M3 (fine-level universal abelian
families); ShimuraVarieties V5 (canonical Siegel and PEL models and their universal families);
ShimuraVarieties V8 (the canonical finite étale tower and Hecke spans over the reflex field).
*Lean:* none; specified in the README only.

**Checks.**

- `hodgeTensorRealizations_test_endomorphism` (compatibility): An algebraic endomorphism of A acts
  compatibly in all three degree-one realizations.
- `hodgeTensorRealizations_test_polarization` (characterisation): The polarization tensor is valued
  in the specified Tate line; ignoring that line changes GSp to Sp.
- `hodgeTensorRealizations_test_zero` (degenerate): Adding a zero tensor does not change the
  simultaneous stabilizer or the descended frame torsor.

### B1.4 The tensor-preserving de Rham frame torsor

Construct `tensorFrameTorsor`. Define the de Rham frame functor by tensor-preserving isomorphisms
η:V⊗O→H_dR. The right action is η·g=η∘g. Prove representability and local nonemptiness from the
tensor comparison, then identify it as the relevant principal torsor. Being a closed subfunctor of
an isomorphism scheme by itself proves neither local nonemptiness nor the torsor property.

*Source:* [AG], Proposition 3.5.1, pp.421–422; [CS], §2.3, p.670.

The API:

- `tensorFrameTorsor_frame`: A T point is an invertible frame of H carrying every reference tensor
  to its de Rham realization.
- `tensorFrameTorsor_right_action`: η·g=η∘g, and T×G→T×_S T is an isomorphism.
- `tensorFrameTorsor_coefficient`: T×^G V identifies with H_dR for the chosen faithful coefficient.

*Needs:* B1.1 (`finiteTensorStabilizer`); B1.3 (`hodgeTensorRealizations`); B0.1
(`centralSplitQuotient`).
*Lean:* none; specified in the README only.

**Checks.**

- `tensorFrameTorsor_test_identity` (computation): For a constant tensor-equipped bundle V⊗O_S,
  identity is a global frame and T≃G×S.
- `tensorFrameTorsor_test_sp` (non-example): For a polarization with a separately varying similitude
  line, the correct tensor frame group is GSp; fixing the alternating form with no Tate line
  incorrectly yields Sp.
- `tensorFrameTorsor_test_rank` (characterisation): An isomorphism frame exists only between
  equal-rank modules and must preserve all tensors, not just the polarization.

### B1.5 The filtered frame reduction

Construct `filtrationReduction`. Construct the equivariant filtration map from the tensor frame
torsor to the reflex-field compact dual. Over a field where the reference parabolic is defined,
identify its inverse image with a P_Hᶜ-reduction and its unipotent quotient with graded frames. The
reflex flag can have no rational point, so do not choose a reference filtration over E without a
hypothesis; nonsplit flag forms test this distinction.

*Source:* [CS], §2.3, pp.669–671.

The API:

- `filtrationReduction_flag_map`: γ(ηg)=g⁻¹γ(η) in the chosen right-torsor convention.
- `filtrationReduction_parabolic_fibre`: After choosing the reference flag over L, its inverse image
  is exactly the tensor-preserving filtered frames.
- `filtrationReduction_levi`: Quotienting the filtered-frame torsor by U identifies frames of gr_F H
  individually.

*Needs:* B1.4 (`tensorFrameTorsor`); B0.6 (`homogeneousHodgeTorsor`); ShimuraData D3
(*reflex-flag-descent*).
*Lean:* none; specified in the README only.

**Checks.**

- `filtrationReduction_test_siegel` (compatibility): For the standard Siegel family γ records the
  Hodge subbundle, with its actual Lagrangian condition.
- `filtrationReduction_test_zero` (degenerate): For a rank-zero coefficient the induced filtration
  is zero, even though the principal datum remains the same.
- `filtrationReduction_test_no_point` (non-example): For the quaternionic Shimura curve of the
  division algebra B=(−1,3)/Q, the compact dual is the Severi–Brauer conic of B and has no Q-point;
  the rational γ:Π→X̌_Q does not furnish a section Spec Q→X̌_Q. B is split over R, while 3 is not a
  norm from Q(i), so this tests an actual nonsplit flag form.

### B1.6 Canonical principal bundles of Hodge type

Prove `hodgeCanonicalPrincipalBundle`. For a Hodge-type Shimura datum in characteristic zero,
construct the canonical Gᶜ-principal bundle over the reflex canonical model, its filtration map, its
full-group flat connection and its Hecke tower maps. Compare with the analytic torsor and impose the
CM-period normalization at special points. The integral tensor-frame construction at a particular
good prime is additional model-specific work, not an all-prime consequence.

*Source:* [Milne90], III §3, p.58; Theorem 4.3, pp.59–60; Example 4.4(a), p.60; [AG], §3.5,
Proposition 3.5.1 and proof, pp.421–422.

*Needs:* B1.4 (`tensorFrameTorsor`); B1.5 (`filtrationReduction`); ShimuraVarieties V4 (special
points and reciprocity).
*Lean:* none; specified in the README only.

**Checks.**

- In the Siegel case the associated standard homology coefficient is the dual relative H¹dR with
  Gauss–Manin connection.

### B1.7 Independence of symplectic embedding

Prove `embeddingIndependence`. Compare the canonical principal bundles obtained from two faithful
symplectic embeddings of the same Hodge-type datum. Use a common tensor realization and tensor
projectors to produce the canonical comparison. Check its cocycle for three embeddings and
compatibility with filtration, connection, Hecke maps and CM normalization.

*Source:* [CS], Remark 2.3.3; Lemma 2.3.4, pp.669–670; [AG], §3.5, proof of Proposition 3.5.1,
p.422.

*Needs:* B1.6 (`hodgeCanonicalPrincipalBundle`); B1.3 (`hodgeTensorRealizations`); B1.1
(`finiteTensorStabilizer`).
*Lean:* none; specified in the README only.

**Checks.**

- Adding a second faithful representation gives the same principal torsor, with the expected second
  associated module.

### B1.8 The special-point normalization

Prove `cmPrincipalNormalization`. At a special point identify the principal-bundle fibre with the
corresponding CM period torsor. Verify reciprocity compatibility with the actual special-point
transport. This fixes the canonical rational model and comparison isomorphisms; it does not supply a
preferred frame, a numerical period or a trivialization of the period torsor.

*Source:* [Milne90], III Theorem 4.1, p.59; Example 4.2(b), p.59; Remark 4.5, p.60.

*Needs:* B1.6 (`hodgeCanonicalPrincipalBundle`); ShimuraVarieties V4 (special points and
reciprocity).
*Lean:* none; specified in the README only.

**Checks.**

- Changing an Artin convention must invert the reciprocity map in both the variety and the fibre
  normalization.

### B1.9 Canonical principal bundles of abelian type

Prove `abelianCanonicalPrincipalBundle`. Pass from Hodge-type data to abelian-type data through the
stated connected central-isogeny and finite-quotient constructions. Descend the bundle, filtration,
connection and tower maps, checking that the quotient kernel acts trivially on the coefficient
fibres. Compatibility with connected-component transport is part of the construction.

*Source:* [Milne88], §7, Lemmas 7.1–7.3 and Proposition 7.4, pp.29–31; [Milne90], III §4, Theorems
4.1/4.3 and Remark 4.5(ii), pp.59–60.

*Needs:* B1.6 (`hodgeCanonicalPrincipalBundle`); B1.7 (`embeddingIndependence`); B1.8
(`cmPrincipalNormalization`); B0.2 (`ineffectiveFibreDescent`); ShimuraVarieties V6 (connected and
abelian-type canonical models).
*Lean:* none; specified in the README only.

**Checks.**

- A connected abelian-type cover with a finite central kernel does not descend a coefficient on
  which that kernel acts nontrivially.

### B1.10 Hecke pullback of the canonical torsor

Prove `principalHeckePullback`. Along the supplied finite étale arithmetic level maps and Hecke
translations, construct the canonical isomorphisms between the pulled-back principal bundles. They
preserve the filtration map, full-group connection and special-point normalization, and satisfy
identity and composition laws. Trace on coherent sections is a separate B5 operation.

*Source:* [Milne90], III Proposition 2.1(a), p.55; Proposition 3.2, p.58; Remark 4.5(i–ii), p.60.

*Needs:* B1.9 (`abelianCanonicalPrincipalBundle`); ShimuraVarieties V1 (the analytic tower, level
maps and Hecke translations); ShimuraVarieties V8 (the canonical finite étale tower and Hecke spans
over the reflex field).
*Lean:* none; specified in the README only.

**Checks.**

- A pair of Hecke pullbacks composes to their product after passing to a level where both are
  defined.

### Examples

- For the Siegel datum the polarization tensor takes values in the Tate line; forgetting that line
  replaces `GSp` by `Sp` (B1.4).
- For the quaternionic Shimura curve of the division algebra `(−1, 3)/ℚ` the compact dual is the
  Severi–Brauer conic, which has no rational point; the filtration map exists without a rational
  reference filtration (B1.5).

### Dependencies

Layer B0; AbelianSchemesAndArithmeticModuli A4; PELModuli M3; ShimuraVarieties V1, V4, V5, V6, V8;
ShimuraData D3.

## Layer B1.general: canonical principal bundles for general data

The general-data route uses conjugation of connected Shimura data and its principal-automorphism
argument. The adjoint second-jet realization and the rank-one rational-point reduction precede
continuous effective descent. This is a characteristic-zero construction for general pure data; it
does not assume a universal abelian family.

### B1.general.1 Conjugation of connected principal bundles

Prove `connectedPrincipalConjugation`. Fix a connected datum (G,X) with G semisimple simply
connected, σ∈Aut(ℂ), and a special point x. Construct the algebraic isomorphism from the σ-conjugate
connected standard principal bundle to that of the transported datum, normalized by the period
torsor at x. Preserve the compact-dual map, flat connection and connected Hecke-group action. Under
V7's conjugate-datum identification the comparison is independent of auxiliary choices. Use the
rank-one reduction and faithful adjoint-jet realization below to prove that the normalization
controls principal automorphisms.

*Source:* [Milne88], Theorem 3.10 and Corollary 3.11, pp.18–20.

*Needs:* B1.9 (`abelianCanonicalPrincipalBundle`); ShimuraVarieties V7 (conjugation of connected
Shimura data); B1.general.3 (`generalConnectedReduction`).
*Lean:* none; specified in the README only.

**Checks.**

- The normalized isomorphism is unique with all the stated equivariance/connection conditions.

### B1.general.2 The adjoint bundle and second jets

Prove `adjointJetRealization`. Realize the adjoint coefficient faithfully inside the second jets of
the tangent bundle in the connected conjugation argument. Prove equivariance and the induced
restriction on principal automorphisms. Use the corrected order-two injection in Milne's Lemmas
9.3–9.4; an order-one tangent realization and the withdrawn Harris 1984 assertion do not replace it.

*Source:* [Milne88], §9 Lemmas 9.3–9.4, pp.33–34.

*Needs:* ShimuraData D3 (*compact-dual*); ShimuraVarieties V7 (conjugation of connected Shimura
data).
*Lean:* none; specified in the README only.

**Checks.**

- First-order tangent data alone are not asserted to give this injection.

### B1.general.3 The general connected bundle reduction

Prove `generalConnectedReduction`. Reduce the connected principal-bundle conjugation theorem to
type-A₁ subdata after the prescribed totally real auxiliary extension. Separate algebraic-group
generation in Lemma 9.5 from generation of rational points in Lemma 9.2. Work with a connected
Shimura datum with `G` semisimple simply connected and `G^ad` ℚ-simple, writing `G = Res_{F/ℚ} H`
for `F` totally real and `H` absolutely almost simple. The transport homomorphism
`r_x : G(ℚ) → G(ℂ)` is the one obtained from the normalized flat principal-bundle transport.
Realize its adjoint representation in the second jets of the compact-dual tangent bundle; the
automorphic-sub-bundle realization makes it continuous in the complex topology (Lemma 9.3).
After a totally real enlargement splitting the special torus over a quadratic extension, the
algebraic adjoint map agrees with the ordinary adjoint action on the type-A₁ subgroups `H_α`.
Lemma 9.5 gives algebraic-group generation, and hence agreement of the adjoint maps.

The remaining difference `γ(g) = r_x(g)g⁻¹` is a central homomorphism. Use generation of `G(ℚ)`
by the rational points of special tori (the result invoked in Lemma 9.2), not simplicity of
`G(ℚ)/Z(ℚ)` for arbitrary `G`. For an element in a special torus, enlarge the totally real
field again so that the torus lies in a reductive type-A₁ subgroup `G_α` isotropic at a finite
prime. The auxiliary subgroup has the simple rational central quotient used in Lemma 9.2;
functoriality of the central difference then kills the element. This proves `r_x(g) = g`. The
special-torus generation, auxiliary type-A₁ embedding and local-isotropy steps are proof
obligations of this target with the hypotheses above, not unnamed hypotheses of its conclusion.
Do not invoke the stronger rational-point assertion in §8.1, which its footnote leaves conjectural.

*Source:* [Milne88], §9 Lemmas 9.1–9.5, pp.33–34.

*Needs:* B1.general.2 (`adjointJetRealization`); B1.9 (`abelianCanonicalPrincipalBundle`);
ShimuraVarieties V7 (conjugation of connected Shimura data).
*Lean:* none; specified in the README only.

**Checks.**

- For a type-A₁ datum the normalized transport is already the abelian-type one.
- Equality of adjoint maps alone permits a central discrepancy; the special-torus argument must
  kill it on rational points. Assuming an arbitrary rational central quotient is simple is invalid.
- The proof never invokes a non-abelian-type family of motives.

### B1.general.4 General canonical principal models

Prove `generalPrincipalModel`. For a general pure Shimura datum satisfying Milne II (2.1), descend
the normalized connected principal bundles on the neat effective canonical tower to a canonical
Gᶜ-torsor over E. Its analytification is the homogeneous standard principal bundle, with its
canonical flat connection. Prove the continuity and effectivity of the Weil descent datum and its
compatibility with components and level maps. A family of motives is not an additional assumed
carrier for this construction.

*Source:* [Milne90], III Theorem 4.3 and Example 4.4, pp.59–60.

*Needs:* B1.general.3 (`generalConnectedReduction`); B0.1 (`centralSplitQuotient`); ShimuraVarieties
V7 (conjugation of connected Shimura data); ShimuraVarieties V8.general (canonical towers for
general data).
*Lean:* none; specified in the README only.

**Checks.**

- General models are characteristic-zero models over number fields; no integral or motivic upgrade
  follows.

### B1.general.5 The rational compact-dual map

Prove `generalCompactDualMap`. Descend the equivariant compact-dual map along the general
principal-bundle descent datum. It is defined over E with its reflex flag target and is compatible
with conjugation. A rational point of that flag variety is not needed for the map and is not
asserted by its existence.

*Source:* [Milne90], III Theorem 4.6, pp.60–61.

*Needs:* B1.general.4 (`generalPrincipalModel`); ShimuraData D3 (*reflex-flag-descent*).
*Lean:* none; specified in the README only.

**Checks.**

- The construction descends the conjugacy class of flags, not a chosen E-rational filtration.

### B1.general.6 Normalized conjugation and its cocycle

Prove `generalConjugationCocycle`. Prove the two-step cocycle for the special-point-normalized
conjugation transports of general principal bundles and their compact-dual maps. Keep all
coefficient-field transports. Rational Betti statements retain the ℚ-defined weight hypothesis of
Milne III Theorem 6.2.

*Source:* [Milne90], III Theorem 4.1, p.59; Remark 4.5, p.60; Theorem 6.2, p.62.

*Needs:* B1.general.4 (`generalPrincipalModel`); B1.general.5 (`generalCompactDualMap`);
B1.general.3 (`generalConnectedReduction`); ShimuraVarieties V7 (conjugation of connected Shimura
data).
*Lean:* none; specified in the README only.

**Checks.**

- σ=id gives identity; successive conjugation uses the transported datum and CM period torsor, not a
  fixed unchanged group.

### Examples

- For `σ = id` the normalized conjugation is the identity and the cocycle is trivial (B1.general.6).
- An order-one tangent realization of the adjoint coefficient does not suffice; the corrected
  order-two injection of Milne's Lemmas 9.3–9.4 is used (B1.general.2).

### Dependencies

Layers B0–B1; ShimuraData D3; ShimuraVarieties V7, V8.general.

## Layer B2: associated bundles and realizations

Pull the compact-dual coefficient back to the canonical torsor and descend it along the group
action. This gives the coherent automorphic bundle of a parabolic coefficient. Full-group
coefficients additionally receive arithmetic local systems and filtered connections. Every
comparison keeps the representation field, the highest-weight label and the homology/cohomology
switch.

### B2.1 The automorphic coefficient functor

Construct `automorphicVectorBundle`. Use the canonical principal bundle and its equivariant
compact-dual map to descend γ\*J to an automorphic vector bundle V(J) over the actual coefficient
field L. For a parabolic or Levi representation take J from B0. Give a tensor, dual, unit and
coefficient-map functor with base-field and level compatibility. A full-group representation is
required for the additional flat realization; a GL₂ parabolic Hodge-line character need not extend
to a rank-one GL₂ representation.

*Source:* [Milne90], III §5, Theorem 5.1, p.61; [CS], Lemma 2.3.5, pp.670–671.

The API:

- `automorphicVectorBundle_pullback`: Π\*V(J)≃γ\*J with the specified Gᶜ descent action.
- `automorphicVectorBundle_levi`: For ρ:M→GL(V), V(Jρ)≃P_dR×^{P_H}V after inflation.
- `automorphicVectorBundle_tensor`: V preserves tensor products, duals and the unit through
  canonical descent isomorphisms.
- `automorphicVectorBundle_scalar_extension`: V(J)⊗_L L′≃V(J⊗_L L′) for every field extension L′/L.
- `automorphicVectorBundle_map`: A Pᶜ-equivariant linear map u:V→W induces the associated
  coefficient map V(u) on the fixed canonical model; after pulling back to the principal torsor it
  is the constant map u.
- `automorphicVectorBundle_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `automorphicVectorBundle_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced
  map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level,
  field and model hypotheses remain fixed.

*Needs:* B1.9 (`abelianCanonicalPrincipalBundle`); B1.5 (`filtrationReduction`); B0.5
(`compactDualCoefficient`); B0.9 (`coefficientGaloisDescent`); AlgebraicModuliForArithmeticGeometry
§3.1 `fpqcQuasicoherentDescent`; B0.4 (`contractedProduct`).
*Lean:* none; specified in the README only.

**Checks.**

- `automorphicVectorBundle_test_unit` (degenerate): For J=O_X̌ with trivial fibre action, V(J)=O_S.
- `automorphicVectorBundle_test_hodge` (compatibility): In the Siegel cohomology convention, the
  Hodge-line/standard Levi coefficient gives e\*Ω¹_A/S, not its inverse.
- `automorphicVectorBundle_test_nonflat` (non-example): For the upper-triangular P in GL2,
  χ(diag(a,d))=a defines a rank-one associated automorphic coefficient. It is not the restriction of
  a one-dimensional GL2 representation: det^n restricts to a^n d^n and cannot equal a for any n. The
  full-group flat-connection functor therefore cannot be applied to this coefficient by declaring χ
  to extend.

### B2.2 The algebraic automorphic bundle comparison

Prove `automorphicAnalyticComparison`. After L↪ℂ identify V(J)^an with B0's holomorphic quotient
coefficient, using the same torsor, inverse fibre action and effective arithmetic descent. Check
coefficient maps, tensors and the section transformation law under this identification.

*Source:* [Milne90], III §3, Proposition 3.5, pp.58–59; III §5, Theorem 5.1, p.61.

*Needs:* B2.1 (`automorphicVectorBundle`); B0.10 (`geometricAnalyticCoefficients`); B0.8
(`sectionsEquivariant`).
*Lean:* none; specified in the README only.

**Checks.**

- For GL2 the chosen Hodge line is the holomorphic invariant-differential coefficient.

### B2.3 Highest weights and coefficient conventions

Prove `leviHighestWeightConvention`. For a split Levi over L and a dominant weight λ, label the
coefficient fibre by the actual representation V_λ. In BCGP's left-coset function realization its
Borel character is −w₀,Mλ. The dual representation has highest weight −w₀,Mλ as a different
statement. Provide the explicit conversion, including similitude characters, and the Galois descent
datum for nonsplit forms.

*Source:* [BCGP], §3.2.13–3.2.16, p.44; Example 3.2.18, p.45.

*Needs:* B0.3 (`hodgeParabolicConvention`); B0.5 (`compactDualCoefficient`); B0.9
(`coefficientGaloisDescent`); TauCetiRoadmap.RepresentationTheory.ClassicalGroups Layer 3
(`DominantWeight`, the theorem of the highest weight).
*Lean:* none; specified in the README only.

**Checks.**

- BCGP’s tautological Siegel exact sequence is compared with the full standard P representation; it
  is not split into a flat sum by naming the two Levi weights.

### B2.4 Betti coefficients of a full-group representation

Construct `bettiCoefficientLocalSystem`. For a finite-dimensional rational full-group
Gᶜ-representation W and a neat effective arithmetic component Γ\X, form the Betti local system
Γ\\(X×W), with its arithmetic monodromy. Its associated holomorphic flat bundle is the full-group
automorphic coefficient. When the projected weight is ℚ-defined and W has one pure weight, use D3's
rational variation of Hodge structure. Treat mixed weights weight by weight. Preserve the
homology/cohomology dual convention and Tate lines in the Siegel specialization.

*Source:* [AG], §3.3, p.418; [Milne90], III §6, pp.61–62, including Remark 6.1 and Theorem 6.2.

The API:

- `bettiCoefficientLocalSystem_monodromy`: On Γ\X the local monodromy is the representation of Γ on
  W.
- `bettiCoefficientLocalSystem_tensor`: Betti coefficients preserve tensor products and duals.
- `bettiCoefficientLocalSystem_complex_flat`: W_B⊗_Q O_an is the full-group coefficient with its
  flat connection.
- `bettiCoefficientLocalSystem_map`: A full-Gᶜ representation intertwiner u:V→W induces a map of the
  descended Betti local systems with fibre u and preserves monodromy.
- `bettiCoefficientLocalSystem_map_id`: For a fixed admitted input V, the induced map of the
  identity morphism of V is the identity on its output.
- `bettiCoefficientLocalSystem_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the
  induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum,
  level, field and model hypotheses remain fixed.

*Needs:* B0.1 (`centralSplitQuotient`); B0.2 (`ineffectiveFibreDescent`); B2.2
(`automorphicAnalyticComparison`); ShimuraData D3 (*homogeneous-variation*).
*Lean:* none; specified in the README only.

**Checks.**

- `bettiCoefficientLocalSystem_test_unit` (degenerate): For W=Q with trivial action, W_B is the
  constant rational local system.
- `bettiCoefficientLocalSystem_test_standard` (compatibility): For the Siegel homology
  representation, W_B=H₁ of the actual universal abelian family, not R¹π_\*Q without a dual.
- `bettiCoefficientLocalSystem_test_levi` (non-example): The GL2 upper-triangular Levi character
  (a,d)↦a is not the restriction of any one-dimensional GL2 representation (whose character is
  det^n). It cannot be supplied as a full-group rank-one Betti input without an extension.

### B2.5 Étale coefficients from the canonical tower

Construct `etaleCoefficientLocalSystem`. Choose a stable ℤ_ℓ lattice in a full-group ℓ-adic
coefficient and compatible compact ℓ-levels. Descend its finite lattice quotients on the arithmetic
étale tower, take the inverse limit and invert ℓ to obtain the local system over the canonical
coefficient field. Prove independence of the lattice after inversion and Hecke compatibility.
Arithmetic ℚ_ℓ(1) and the geometrically constant rank-one sheaf have different Galois actions.

*Source:* [AG], §3.3 Proposition 3.3.1, pp.418–419; [Milne90], III §6, Remark 6.1, p.62.

The API:

- `etaleCoefficientLocalSystem_finite_level`: The lattice modulo ℓⁿ is the finite étale sheaf
  associated to the chosen level quotient action.
- `etaleCoefficientLocalSystem_lattice_independence`: After tensoring with Q_ℓ the result is
  independent of a stable lattice through the common rational representation.
- `etaleCoefficientLocalSystem_hecke`: Level and Hecke pullbacks preserve the descended sheaf and
  its canonical arithmetic Galois structure.
- `etaleCoefficientLocalSystem_map`: A continuous full-Gᶜ Q_ℓ-representation intertwiner u:V→W
  induces the map of the descended arithmetic ℓ-adic local systems; it respects the actual
  finite-level tower and arithmetic Galois action.
- `etaleCoefficientLocalSystem_map_id`: For a fixed admitted input V, the induced map of the
  identity morphism of V is the identity on its output.
- `etaleCoefficientLocalSystem_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the
  induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum,
  level, field and model hypotheses remain fixed.

*Needs:* B0.1 (`centralSplitQuotient`); B1.10 (`principalHeckePullback`); ShimuraVarieties V8 (the
canonical finite étale tower and Hecke spans over the reflex field); ShimuraVarieties V1 (the
analytic tower, level maps and Hecke translations).
*Lean:* none; specified in the README only.

**Checks.**

- `etaleCoefficientLocalSystem_test_unit` (degenerate): The trivial representation gives the
  constant Q_ℓ sheaf over E.
- `etaleCoefficientLocalSystem_test_abelian` (compatibility): The symplectic homology coefficient
  gives (R¹π_\*Q_ℓ)∨ with its arithmetic action.
- `etaleCoefficientLocalSystem_test_arithmetic` (non-example): Over Spec Q the étale coefficients
  Q_ℓ and Q_ℓ(1) have the same one-dimensional geometric/complex realization but different
  arithmetic Galois actions (trivial versus cyclotomic). Forgetting the arithmetic tower/action
  cannot characterize the descended coefficient.

### B2.6 Filtered de Rham full-group coefficients

Construct `filteredDeRhamCoefficient`. Let W be an algebraic full-group Gᶜ-representation over a
number field L containing E. The canonical principal bundle associates to W a locally free de Rham
coefficient with integrable connection and Hodge filtration from γ. Prove Griffiths transversality
and the corresponding analytic horizontal-section description. In Hodge type this agrees with the
matching tensor construction in the universal family's relative H₁,dR; its regular-singular boundary
extension is a B3 target. Parabolic or Levi-only coefficients use the associated-bundle functor
without this flat structure.

*Source:* [Milne90], III §5, Theorem 5.1, p.61; III §6, pp.61–62; [AG], §3.5, Proposition 3.5.1,
p.421.

The API:

- `filteredDeRhamCoefficient_connection`: ∇²=0 and the connection descends from Π.
- `filteredDeRhamCoefficient_filtration`: F^aW_dR is the locally direct-summand filtration encoded
  by γ.
- `filteredDeRhamCoefficient_transversality`: ∇F^a⊂F^{a−1}⊗Ω¹_S; tensors and duals carry the induced
  filtered connections.
- `filteredDeRhamCoefficient_map`: A full-Gᶜ representation intertwiner induces a horizontal
  filtration-preserving map between the associated de Rham coefficients; its principal-frame map is
  u.
- `filteredDeRhamCoefficient_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `filteredDeRhamCoefficient_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the
  induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum,
  level, field and model hypotheses remain fixed.

*Needs:* B2.1 (`automorphicVectorBundle`); B1.6 (`hodgeCanonicalPrincipalBundle`); ShimuraData D3
(*homogeneous-variation*); AbelianSchemesAndArithmeticModuli A4 (`AbelianH1dR` with its Hodge
sequence and Gauss–Manin connection, `AbelianTate`, `exteriorCohomology`).
*Lean:* none; specified in the README only.

**Checks.**

- `filteredDeRhamCoefficient_test_unit` (degenerate): The tensor unit is (O_S,d) with its
  weight-zero filtration.
- `filteredDeRhamCoefficient_test_hodge` (compatibility): For H¹dR of an abelian family F¹=e\*Ω¹_A/S
  and the connection is Gauss–Manin.
- `filteredDeRhamCoefficient_test_levi` (non-example): For the GL2 upper-triangular Levi, (a,d)↦a
  does not extend to a one-dimensional GL2 representation, since no a^n d^n equals a. Its associated
  line cannot be treated as a rank-one input to the full-group filtered connection functor.

### B2.7 Betti, étale and de Rham comparison

Prove `realizationComparison`. For a rational Gᶜ-representation W and an embedding L↪ℂ, identify
W_B⊗ℚ_ℓ≃W_ℓ|S_ℂ under the algebraic/analytic étale comparison, and W_B⊗O^an≃W_dR^an as flat
holomorphic bundles. When the projected weight is ℚ-defined and W is pure, these identifications
respect the Hodge filtration and rational variation. Preserve the defining tensors, duals, Tate
twists and Hecke pullbacks. The comparison does not add crystalline or B_dR assertions.

*Source:* [AG], Proposition 3.3.1; Proposition 3.5.1, pp.418–422; [Milne90], III §6, pp.61–62.

*Needs:* B2.4 (`bettiCoefficientLocalSystem`); B2.5 (`etaleCoefficientLocalSystem`); B2.6
(`filteredDeRhamCoefficient`); AbelianSchemesAndArithmeticModuli A4 (`AbelianH1dR` with its Hodge
sequence and Gauss–Manin connection, `AbelianTate`, `exteriorCohomology`).
*Lean:* none; specified in the README only.

**Checks.**

- The standard representation comparison is the actual degree-one family comparison, and tensor
  projectors agree on both sides.

### B2.8 Tensor and Hecke coherence of coefficients

Prove `coefficientTensorHecke`. Prove coherent compatibility of the associated-coefficient and
full-group realization functors with tensor products, duals, units, coefficient maps and
finite-level/Hecke pullbacks. Include the associativity, unit and composition diagrams. Exactness
here is characteristic-zero representation exactness; an integral lattice requires its own flatness
or projectivity hypotheses.

*Source:* [Milne90], III §3, Lemma 3.1, p.58; III §5, p.61; III §6, p.62.

*Needs:* B2.1 (`automorphicVectorBundle`); B1.10 (`principalHeckePullback`); B2.7
(`realizationComparison`).
*Lean:* none; specified in the README only.

**Checks.**

- The dual of a Hodge-line coefficient is the inverse line; retaining it as the same line would fail
  this theorem.

### B2.9 The Siegel tautological coefficient sequence

Prove `siegelTautologicalSequence`. On the split opposite flag P_HT\G for GSp_{2g}, construct the
sequence 0→L_(0,…,0,−1;1)→O⊗St→L_(1,0,…,0;1)→0. Both outer terms have rank g. Compare it with the
actual Hodge sequence using the opposite/dual conversion and declared Tate character. Its
realization in the solid analytic category is a separately supplied comparison.

*Source:* [BCGP], Remark 3.2.19, p.45; Remark 4.8.1, p.101.

*Needs:* B0.5 (`compactDualCoefficient`); B0.3 (`hodgeParabolicConvention`); B2.3
(`leviHighestWeightConvention`); PELModuli M0 (PEL data and their compact duals).
*Lean:* none; specified in the README only.

**Checks.**

- For g=2 this is precisely L_(0,−1;1)→St→L_(1,0;1); pulling it to the Hodge–Tate tower requires its
  separately constructed torsor.

### Examples

- For the upper-triangular `P ⊂ GL₂`, the character `diag(a, d) ↦ a` gives a rank-one automorphic
  coefficient that is not the restriction of a one-dimensional `GL₂`-representation (`det^n`
  restricts to `aⁿdⁿ`), so it carries no flat connection (B2.1).
- Over `Spec ℚ` the étale coefficients `ℚ_ℓ` and `ℚ_ℓ(1)` have the same geometric realization and
  different Galois actions (B2.5).
- On the `GSp_{2g}` flag the tautological sequence
  `0 → L_{(0,…,0,−1;1)} → O ⊗ St → L_{(1,0,…,0;1)} → 0` has two outer terms of rank `g` (B2.9).

### Dependencies

Layers B0–B1; ShimuraData D3; ShimuraVarieties V1, V8; AbelianSchemesAndArithmeticModuli A4;
PELModuli M0; AlgebraicModuliForArithmeticGeometry §3.1; TauCetiRoadmap
RepresentationTheory/ClassicalGroups Layer 3.

## Layer B2.general: associated coefficients for general data

Use the general canonical principal bundle of Layer B1.general with the same associated-bundle
functor as Layer B2. The new work is descent and conjugation compatibility of the realizations, not
a new representation category.

### B2.general.1 General automorphic coefficient models

Prove `generalAssociatedModel`. Apply the same associated-coefficient functor to B1.general's
canonical principal bundle and compact-dual map. Obtain general-data V(J) over the actual field of
definition, with tensor, dual, pullback, analytic and normalized conjugation compatibilities. This
uses the associated-bundle construction of B0.4, without a second coefficient construction.

*Source:* [Milne90], III Theorem 5.1, p.61.

*Needs:* B1.general.4 (`generalPrincipalModel`); B1.general.5 (`generalCompactDualMap`); B2.1
(`automorphicVectorBundle`); B0.9 (`coefficientGaloisDescent`); B1.general.6
(`generalConjugationCocycle`); B0.4 (`contractedProduct`).
*Lean:* none; specified in the README only.

**Checks.**

- This is valid for non-abelian-type data without assigning an abelian motive to J.

### B2.general.2 General full-group realizations

Prove `generalFlatRealizations`. For rational full-group coefficients on a general pure datum,
construct Betti, arithmetic ℓ-adic and filtered de Rham realizations using the general canonical
torsor and tower. Give their comparisons and tensor/Hecke maps. No universal abelian family or
family of motives is assumed for the general datum.

*Source:* [Milne90], III §6, pp.61–62; [LanIntro], §5.3, pp.63–64.

*Needs:* B2.general.1 (`generalAssociatedModel`); B1.general.4 (`generalPrincipalModel`); B2.5
(`etaleCoefficientLocalSystem`); B2.7 (`realizationComparison`); ShimuraVarieties V8.general
(canonical towers for general data).
*Lean:* none; specified in the README only.

**Checks.**

- The tensor unit remains constant; a Levi coefficient is not automatically a full-group local
  system.

### B2.general.3 Conjugation of rational realizations

Prove `generalRealizationConjugation`. Transport the general associated bundles and full-group
realizations through normalized conjugation. Check their comparison cocycles, coefficient-field
changes and filtration maps. The rational Betti comparison requires the weight to be ℚ-defined; its
absence cannot be repaired by simply forgetting the field of definition.

*Source:* [Milne90], III Theorem 6.2, p.62.

*Needs:* B2.general.2 (`generalFlatRealizations`); B1.general.6 (`generalConjugationCocycle`); B1.8
(`cmPrincipalNormalization`).
*Lean:* none; specified in the README only.

**Checks.**

- The dR conjugation does not alone determine a rational Betti lattice; the extra hypothesis is
  retained.

### Examples

- Without a `ℚ`-defined weight the rational Betti comparison under conjugation is not available, and
  forgetting the field of definition does not repair it (B2.general.3).

### Dependencies

Layers B1.general and B2; ShimuraVarieties V8.general.

## Layer B3: canonical and subcanonical boundary extensions

Construct coefficients on the degeneration charts supplied by ShimuraCompactifications and glue them
with their normalized boundary frames. Canonical and reduced-boundary extensions behave differently
under refinement; section comparisons use the direct-image theorems of ShimuraCompactifications C3.
Logarithmic connections belong to full-group coefficients. The minimal pushforward is coherent, with
separate positivity requirements for scalar line descent. The last target gives the integral
coefficients on good-prime PEL models used in Layer B5.

### B3.1 Coefficients on degeneration charts

Construct `boundaryCoefficientChart`. On the supplied neat characteristic-zero Hodge/PEL toroidal
chart, describe the coefficient using the actual semi-abelian degeneration or one-motive and its
graded frames. Extend to the specified good integral PEL base only with C5's finite locally free
representations. Identify the relative invariant differentials and coefficient transports on
overlaps; the torus differential is du/u, not the base differential dq/q.

*Source:* [HLTT], Appendix B.8, pp.270–271; [LanIntro], §4.2.7, pp.49–50.

The API:

- `boundaryCoefficientChart_restrict`: Restriction to the open family is the given filtered/graded
  automorphic coefficient.
- `boundaryCoefficientChart_hodge`: The Hodge coefficient is e\*Ω¹_G/SΣ of the supplied semi-abelian
  extension.
- `boundaryCoefficientChart_transition`: Degeneration-chart transition maps induce tensor-compatible
  frame/coefficient isomorphisms.
- `boundaryCoefficientChart_map`: A morphism of the prescribed boundary representations induces a
  chart-coefficient morphism compatible with the canonical frame and with every chart transition.
- `boundaryCoefficientChart_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `boundaryCoefficientChart_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the
  induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum,
  level, field and model hypotheses remain fixed.

*Needs:* B2.1 (`automorphicVectorBundle`); ShimuraCompactifications C4 (*semi-abelian-scheme*,
*formal-universal-degeneration*); ShimuraCompactifications C5 (*integral-toroidal-space*,
*formal-completion*).
*Lean:* none; specified in the README only.

**Checks.**

- `boundaryCoefficientChart_test_tate` (compatibility): The dimension-one Hodge frame at a
  multiplicative fibre is generated by du/u.
- `boundaryCoefficientChart_test_unit` (degenerate): The trivial coefficient extends to O of each
  cusp chart.
- `boundaryCoefficientChart_test_base` (non-example): The base logarithmic differential dq/q is not
  identified with the relative invariant differential du/u.

### B3.2 The canonical automorphic extension

Construct `canonicalExtension`. Construct the locally free canonical extension V^can_Σ on the
specified smooth toroidal model, characterized by canonical boundary frames and the corresponding
growth normalization. Give its normalized coefficient-map and tensor functor. Use the Hodge/abelian
characteristic-zero construction, and the specific C5 good-integral coefficients where stated.
Equality on the open variety cannot characterize an extension, since boundary twists have the same
restriction.

*Source:* [Milne90], V §6, pp.90–91; [HLTT], Appendix B.8, p.271.

The API:

- `canonicalExtension_restrict`: j\*V(J)^can_Σ≃V(J) with the given canonical open comparison.
- `canonicalExtension_boundary_frame`: On a canonical cusp chart V(J)^can is the locally free
  coefficient of the specified extended frame torsor.
- `canonicalExtension_tensor`: The canonical extension functor preserves tensor products, duals and
  the unit.
- `canonicalExtension_unique`: A chart-normalized extension with these transition maps has a unique
  isomorphism preserving its normalization.
- `canonicalExtension_map`: For a coefficient map induced by an algebraic Pᶜ-representation
  intertwiner, the prescribed canonical chart maps glue to its canonical extension; it restricts to
  the original coefficient map and respects canonical chart normalization. An arbitrary morphism on
  the open without this chart condition is not an admitted input.
- `canonicalExtension_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `canonicalExtension_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map
  of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field
  and model hypotheses remain fixed.

*Needs:* B3.1 (`boundaryCoefficientChart`); B2.1 (`automorphicVectorBundle`);
ShimuraCompactifications C2 (*arithmetic-gluing*, *smooth-normal-crossings*,
*projective-algebraization*); B3.3 (`canonicalExtensionGluing`).
*Lean:* none; specified in the README only.

**Checks.**

- `canonicalExtension_test_unit` (degenerate): The canonical extension of the unit coefficient is
  O_SΣ.
- `canonicalExtension_test_hodge` (compatibility): For an elliptic/PEL Hodge coefficient it is the
  semi-abelian invariant-differential bundle.
- `canonicalExtension_test_twist` (non-example): For nonempty boundary D, V^can(D) has the same open
  restriction but fails the specified canonical boundary-frame normalization.

### B3.3 Gluing the canonical extension

Prove `canonicalExtensionGluing`. Glue the chartwise canonical coefficient by the actual
boundary-frame transition isomorphisms. Prove the overlap cocycle, compatibility with the open
bundle and uniqueness among extensions with these normalized charts. Normality of the
compactification alone does not establish the gluing or uniqueness.

*Source:* [Milne90], V §6 Theorem 6.1, p.90.

*Needs:* B3.1 (`boundaryCoefficientChart`); ShimuraCompactifications C2 (*arithmetic-gluing*,
*smooth-normal-crossings*, *projective-algebraization*); ShimuraCompactifications C4
(*semi-abelian-scheme*, *formal-universal-degeneration*); AlgebraicModuliForArithmeticGeometry §3.1
`fpqcQuasicoherentDescent`.
*Lean:* none; specified in the README only.

**Checks.**

- A boundary twist cannot be glued in as an alternative normalization merely because it is trivial
  on the open part.

### B3.4 The subcanonical automorphic extension

Construct `subcanonicalExtension`. For the reduced normal-crossings Cartier boundary i:D↪S_Σ set
V^sub_Σ=V^can_Σ⊗I_D=V^can_Σ(−D). Construct 0→V^sub_Σ→V^can_Σ→i_\*i\*V^can_Σ→0 with the applicable
field or relative tensor hypotheses. At a crossing q₁q₂=0 the cusp ideal is (q₁q₂); vanishing only
in (q₁,q₂), or twisting by 2D, gives a different condition.

*Source:* [LanIntro], §4.2.7, p.50; [HLTT], Appendix B.8, p.271.

The API:

- `subcanonicalExtension_ideal`: V^sub≃V^can⊗I_D with D reduced.
- `subcanonicalExtension_inclusion`: V^sub→V^can is the kernel of restriction to D.
- `subcanonicalExtension_restrict`: j\*V^sub≃V, while boundary restriction of its included sections
  is zero.
- `subcanonicalExtension_map`: A coefficient morphism u^can induces u^sub=u^can⊗id_(I_D); the
  boundary inclusions commute with u^sub and u^can.
- `subcanonicalExtension_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `subcanonicalExtension_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced
  map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level,
  field and model hypotheses remain fixed.

*Needs:* B3.2 (`canonicalExtension`); ShimuraCompactifications C2 (*arithmetic-gluing*,
*smooth-normal-crossings*, *projective-algebraization*).
*Lean:* none; specified in the README only.

**Checks.**

- `subcanonicalExtension_test_empty` (degenerate): For an empty boundary, V^sub=V^can.
- `subcanonicalExtension_test_crossing` (computation): On Spec k[q1,q2] with reduced D=V(q1q2), the
  unit subcanonical ideal is (q1q2), so sections vanish on both components.
- `subcanonicalExtension_test_multiplicity` (non-example): For a full divisor 2D, V^can(−2D) is not
  the reduced-boundary subcanonical extension.

### B3.5 Canonical coefficients under fan refinement

Prove `refinementCanonicalExtension`. For a smooth fan refinement f:S_Σ′→S_Σ identify f\*V^can_Σ
with V^can_Σ′ and construct the natural boundary-ideal map f\*V^sub_Σ→V^sub_Σ′. In general f\*D≥D′,
so the latter map need not be an isomorphism. Use C3's f_\*O=O and f_\*I_D′=I_D to identify
pushforwards and section spaces, with coherent composition laws.

*Source:* [HarrisLoc], §1.4, Theorem 1.4.2 and (1.4.3), p.10.

*Needs:* B3.2 (`canonicalExtension`); B3.4 (`subcanonicalExtension`); ShimuraCompactifications C3
(*refinement-map*, *choice-comparison*, *refinement-boundary-ideal*,
*coherent-cohomology-invariance*).
*Lean:* none; specified in the README only.

**Checks.**

- Blowing up the crossing of two boundary components gives exceptional multiplicity two in f\*D, but
  multiplicity one in the reduced new boundary.

### B3.6 Fan independence of canonical and cusp sections

Prove `fanIndependentSections`. Use a common smooth projective refinement to identify H⁰ of
canonical extensions, and separately of subcanonical extensions, for different fans in
characteristic zero. Prove independence of the common refinement and the three-fan cocycle. The
required assertions concern section spaces and the specified ideal pushforward, without a blanket
theorem about higher direct images.

*Source:* [LanIntro], §4.2.7, p.49; [HarrisLoc], §1.4, (1.4.3), pp.10–11.

*Needs:* B3.5 (`refinementCanonicalExtension`); ShimuraCompactifications C3 (*refinement-map*,
*choice-comparison*, *refinement-boundary-ideal*, *coherent-cohomology-invariance*).
*Lean:* none; specified in the README only.

**Checks.**

- The identity refinement yields identity on sections; no fixed fan is declared Hecke-stable.

### B3.7 The logarithmic full-group extension

Construct `logarithmicConnectionExtension`. For a full-group coefficient with regular singular
connection and unipotent local monodromy, take Deligne's canonical logarithmic extension with
nilpotent residues and the zero-exponent normalization (ComplexComparisonPartII C5.6
`CanonicalLogExtension`). Identify its underlying bundle with the automorphic canonical extension of
B3.2 and retain logarithmic Griffiths transversality. Nonunipotent monodromy requires a specified
residue interval and is outside this nilpotent-residue identification.

*Source:* [LanIntro], §4.2.7, p.50; [Milne90], V §6, proof of Theorem 6.1, p.91.

The API:

- `logarithmicConnectionExtension_restrict`: Restriction gives the original integrable flat
  connection.
- `logarithmicConnectionExtension_residue`: Each boundary residue is nilpotent in the unipotent
  zero-exponent normalization.
- `logarithmicConnectionExtension_tensor`: In that normalization the logarithmic extension preserves
  tensor products and duals, with induced residue actions.
- `logarithmicConnectionExtension_map`: A horizontal map between the admitted regular-singular
  full-group coefficients extends to a horizontal map between their normalized logarithmic
  extensions and commutes with the residues.
- `logarithmicConnectionExtension_map_id`: For a fixed admitted input V, the induced map of the
  identity morphism of V is the identity on its output.
- `logarithmicConnectionExtension_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the
  induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum,
  level, field and model hypotheses remain fixed.

*Needs:* B2.6 (`filteredDeRhamCoefficient`); B3.2 (`canonicalExtension`); B3.1
(`boundaryCoefficientChart`); ComplexComparisonPartII C5.6 (`RegularSingular`,
`CanonicalLogExtension`).
*Lean:* none; specified in the README only.

**Checks.**

- `logarithmicConnectionExtension_test_unit` (degenerate): The unit coefficient extends to (O_SΣ,d)
  with zero residues.
- `logarithmicConnectionExtension_test_tate` (computation): For a nodal elliptic degeneration the
  rank-two coefficient has nonzero nilpotent monodromy residue, while its determinant has zero
  residue.
- `logarithmicConnectionExtension_test_nonunipotent` (non-example): A rank-one local system with
  monodromy −1 cannot be put in a nilpotent-residue normalization without a cover or a different
  exponent choice.

### B3.8 Coherent coefficients on the minimal model

Construct `minimalCoherentPushforward`. For the proper toroidal-to-minimal morphism between the
specified Noetherian characteristic-zero models, form π_\*V^can. Prove coherence, equality of global
section spaces and fan independence using refinements. Do not assume it is a vector bundle at the
minimal boundary; coherent ideals such as (x,y) on a nodal chart distinguish coherence from local
freeness.

*Source:* [LanIntro], §4.2.7, pp.49–50.

The API:

- `minimalCoherentPushforward_sections`: H⁰(Smin,π_\*V^can)=H⁰(SΣ,V^can).
- `minimalCoherentPushforward_coherent`: Proper pushforward of the coherent canonical coefficient is
  coherent.
- `minimalCoherentPushforward_refinement`: Compatible fan refinements induce a canonical isomorphism
  of these degree-zero pushforwards.
- `minimalCoherentPushforward_map`: For a morphism u:F→G of the admitted canonical or subcanonical
  coefficients, π_\*u is its coherent sheaf pushforward on the specified minimal model.
- `minimalCoherentPushforward_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `minimalCoherentPushforward_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the
  induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum,
  level, field and model hypotheses remain fixed.

*Needs:* B3.2 (`canonicalExtension`); B3.5 (`refinementCanonicalExtension`);
ShimuraCompactifications C2 (*arithmetic-gluing*, *smooth-normal-crossings*,
*projective-algebraization*); Mathlib `AlgebraicGeometry.Scheme.Modules`; Mathlib
`AlgebraicGeometry.Scheme.Modules.presheaf`; Mathlib `SheafOfModules.sections`; Mathlib
`AlgebraicGeometry.Scheme.Modules.pushforward`; Mathlib
`AlgebraicGeometry.Scheme.Modules.pushforward_obj_obj`; ShimuraVarieties V2 (the Baily–Borel minimal
compactification); ShimuraVarieties V8 (the canonical finite étale tower and Hecke spans over the
reflex field).
*Lean:* none; specified in the README only.

**Checks.**

- `minimalCoherentPushforward_test_proper_open` (degenerate): When the Shimura variety is proper and
  π is identity, the minimal coefficient is V.
- `minimalCoherentPushforward_test_rank` (compatibility): On the open S the pushforward restricts to
  V.
- `minimalCoherentPushforward_test_singular` (non-example): On the noetherian nodal affine scheme
  Spec L[x,y]/(xy), the ideal (x,y) is coherent but is not locally free at the origin: its generic
  rank is one and its fibre modulo (x,y) has dimension two. This non-example tests the inference
  from coherent pushforward to local freeness; it does not identify that ideal with every
  automorphic coefficient.

### B3.9 Rationality of the canonical extension

Prove `canonicalRationalDescent`. Descend the chart-normalized canonical and reduced-boundary
subcanonical extensions to their actual coefficient field L, and prove compatibility with field
extension. Transport the boundary ideal and normalized comparison maps in the descent datum. No
all-prime integral extension follows from this rationality statement.

*Source:* [Milne90], V §6 Theorem 6.2, p.91.

*Needs:* B3.2 (`canonicalExtension`); B3.3 (`canonicalExtensionGluing`); B3.4
(`subcanonicalExtension`); B0.9 (`coefficientGaloisDescent`); ShimuraCompactifications C2
(*arithmetic-gluing*, *smooth-normal-crossings*, *projective-algebraization*); B2.1
(`automorphicVectorBundle`).
*Lean:* none; specified in the README only.

**Checks.**

- A coefficient over L⊃E has its extension over L; the statement does not force its descent to E.

### B3.10 Integral canonical coefficients on good-prime PEL models

Construct `integralLeviCoefficient`. On Lan's smooth projective toroidal compactification
`M^tor_{H,Σ}` of a good-prime PEL moduli problem over `S₀ = Spec O_{F₀,(□)}`, whose boundary `D` is
a simple normal crossings divisor, let `R` be an algebra over `R₀ = O_{F₀′,(□′)}` (a finite
extension of `F₀` over which the Hodge decomposition of `h₀` is defined) and `W` a representation of
the Levi group scheme `M₀` over `R` that is locally free of finite presentation over `R`. Let
`E^can_{M₀}` be the canonical extension of the principal `M₀`-bundle: the scheme of isomorphisms
from `(Lie^∨_{G^∨/M^tor}, O(1))` to `(L₀^∨(1), R(1)) ⊗ O_{M^tor}`, for the tautological semi-abelian
scheme `G` and its dual. Define `Ecan(W) = E^can_{M₀} ×^{M₀} W` (an associated bundle as in B0.4)
and `Esub(W) = Ecan(W) ⊗ I_D`; both are locally free of finite rank. Along the completion at a point
of a minimal-boundary stratum, the pullback of `Ecan(W)` to the formal chart `X` is the pullback of
a canonically determined locally free sheaf `E₀(W)` on the abelian torsor `C`, and `E₀(W)` has a
filtration whose graded pieces are pulled back from the boundary moduli; this filtration need not
descend to `X/Γ`. Consequently the pullbacks of `Ecan(W)(nD′)` and `Esub(W)(nD′)` to the cone chart
`V_σ` are the completed sums of `Ψ(ℓ) ⊗ E₀(W)` over `ℓ ∈ σ^∨(n)` and over `ℓ ∈ σ^∨(n)₊`
respectively, so that `Ecan(W)` is formally canonical and `Esub(W)` formally subcanonical in the
sense of ShimuraCompactifications C5 (*integral-coefficient-extension*).

*Hypotheses.* The cone decomposition `Σ` is smooth and projective, the level is neat, and `W` is
locally free of finite presentation over `R`; infinite-dimensional or `p`-adic analytic
representations are not included. The filtration statement holds on `C`, not on `X/Γ`.

*Source:* [LanHigher], §2, p.3, and §3, p.5; Proposition 5.6 and proof, pp.11–13; Corollaries
5.8–5.9, p.13.

The API:

- `integralLeviCoefficient_restrict`: the restriction of `Ecan(W)` to `M_H` is the automorphic
  bundle `E_{M₀,R}(W)`.
- `integralLeviCoefficient_sub`: `Esub(W) = Ecan(W) ⊗ I_D` with `I_D` the ideal of the reduced
  boundary.
- `integralLeviCoefficient_map`: an `M₀`-equivariant `R`-linear map `W → W′` induces maps of `Ecan`
  and `Esub`, with identity and composition laws.
- `integralLeviCoefficient_baseChange`: formation commutes with base change along `R → R′`.
- `integralLeviCoefficient_boundary`: the formal-chart description through `E₀(W)` and the completed
  sums over `σ^∨(n)` and `σ^∨(n)₊`.
- `integralLeviCoefficient_charZero`: over a field of characteristic zero `Ecan(W)` and `Esub(W)`
  are the extensions B3.2 and B3.4 of the automorphic bundle of `W`.

*Needs:* B0.4 (`contractedProduct`); B3.2 (`canonicalExtension`); B3.4 (`subcanonicalExtension`);
ShimuraCompactifications C5 (*integral-toroidal-space*, *formal-completion*,
*integral-coefficient-extension*); ShimuraCompactifications C4 (*semi-abelian-scheme*,
*formal-universal-degeneration*); ShimuraCompactifications C3 (*refinement-boundary-ideal*).
*Lean:* none; specified in the README only.

**Checks.**

- `integralLeviCoefficient_test_unit` (degenerate): `W = R` with trivial action gives
  `Ecan = O_{M^tor}` and `Esub = I_D`.
- `integralLeviCoefficient_test_standard` (computation): for the defining representation
  `W = L₀^∨(1)` of `M₀`, the map `[η, w] ↦ η⁻¹(w)` identifies `Ecan(W)` with `Lie^∨_{G^∨/M^tor}`,
  the cotangent sheaf of the dual tautological semi-abelian scheme along its unit section; its
  restriction to `M_H` is `Lie^∨_{A^∨/M_H}`, not its dual.
- `integralLeviCoefficient_test_twist` (non-example): `Ecan(W)(nD′)` for `n ≠ 0` has the same
  restriction to `M_H` as `Ecan(W)`, but its chart description uses `σ^∨(n)` instead of `σ^∨(0)`; a
  definition through the restriction to `M_H` alone cannot distinguish them.
- `integralLeviCoefficient_test_filtration` (non-example): the filtration of `E₀(W)` lives on the
  torsor `C`; asserting that the pullback of `Ecan(W)` to `X/Γ` is filtered with these graded pieces
  is not part of the statement and fails in general.

### Examples

- On `Spec k[q₁, q₂]` with reduced boundary `D = V(q₁q₂)` the subcanonical ideal is `(q₁q₂)`; the
  ideal `(q₁, q₂)` and the twist by `2D` give different conditions (B3.4).
- On the nodal chart `Spec L[x, y]/(xy)` the ideal `(x, y)` is coherent but not locally free at the
  origin: generic rank one, fibre dimension two (B3.8).
- For a nodal elliptic degeneration the rank-two coefficient has nonzero nilpotent residue while its
  determinant has residue zero (B3.7).

### Dependencies

Layers B0–B2; ShimuraCompactifications C2–C5; ShimuraVarieties V2, V8;
AlgebraicModuliForArithmeticGeometry §3.1; HilbertModularVarietiesAndShimuraCurves H2; Mathlib
scheme modules.

## Layer B3.general: general-data boundary extensions

Use the general characteristic-zero boundary charts and transported fans. The canonical
normalization, logarithmic comparison and ideal-pushforward rules have the same meaning as in Layer
B3.

### B3.general.1 General canonical automorphic extensions

Prove `generalCanonicalExtension`. Extend the general-data coefficient to the supplied
characteristic-zero general toroidal model, using the general boundary chart and canonical
normalization. Give gluing, rationality, canonical and subcanonical coefficients and their
functorial maps. The construction uses C2.general's boundary data without asserting a universal
abelian degeneration for general Shimura data.

*Source:* [Milne90], V §6 Theorems 6.1–6.2, pp.90–91; [LanIntro], §4.2.7, pp.49–50.

*Needs:* B2.general.1 (`generalAssociatedModel`); B3.2 (`canonicalExtension`); B3.4
(`subcanonicalExtension`); B3.9 (`canonicalRationalDescent`); ShimuraCompactifications C2.general
(*general-toroidal-descent*).
*Lean:* none; specified in the README only.

**Checks.**

- The unit and full-group coefficients have the same normalization as on Hodge-type subdata.

### B3.general.2 General logarithmic realization comparison

Prove `generalLogarithmicComparison`. For a general full-group coefficient satisfying regular
singularity and unipotence, compare the canonical extension with the zero-exponent logarithmic
connection extension. Preserve filtration, residues and the normalized general conjugation map.
Regular singularity and Deligne's canonical logarithmic extension are ComplexComparisonPartII C5.6.

*Source:* [Milne90], V §6, Theorem 6.1(c) and proof, p.91; [LanIntro], §4.2.7, p.50.

*Needs:* B2.general.2 (`generalFlatRealizations`); B3.general.1 (`generalCanonicalExtension`); B3.7
(`logarithmicConnectionExtension`); B1.general.6 (`generalConjugationCocycle`);
ShimuraCompactifications C2.general (*general-toroidal-descent*); ComplexComparisonPartII C5.6
(`RegularSingular`, `CanonicalLogExtension`, `deligneRiemannHilbert`).
*Lean:* none; specified in the README only.

**Checks.**

- No assertion that all general-data full-group coefficients arise from a motivic family is needed.

### B3.general.3 General boundary and conjugation compatibility

Prove `generalBoundaryFunctoriality`. Prove that general canonical and subcanonical section spaces
and coefficient maps respect compatible fan refinements, compactified Hecke maps and normalized
conjugation. Use common refinements and the reduced-boundary ideal pushforward for subcanonical
sections. Retain the distinction between their pushforward/section comparison and arbitrary
subcanonical pullback isomorphisms.

*Source:* [HarrisLoc], Theorem 1.4.2 and (1.4.3), pp.10–11; [Milne90], V §6, p.91.

*Needs:* B3.general.1 (`generalCanonicalExtension`); B3.5 (`refinementCanonicalExtension`); B3.6
(`fanIndependentSections`); B1.general.6 (`generalConjugationCocycle`); ShimuraCompactifications
C3.general (*general-map-descent*).
*Lean:* none; specified in the README only.

**Checks.**

- Conjugation acts on the coefficient field and the fan; it is not an endomorphism of one fixed
  compactification.

### Examples

- The unit and full-group coefficients receive the same normalization as on Hodge-type subdata
  (B3.general.1).

### Dependencies

Layers B1.general–B3; ShimuraCompactifications C2.general, C3.general.

## Layer B4: classical forms and explicit weights

Take global sections on the proper toroidal model and compare them with holomorphic transformation
laws through the canonical boundary frame and projective GAGA. The functional automorphy-factor
adapter reuses Mathlib's `SlashAction`. The modular, Hilbert, Siegel and `GU(1,1)` examples fix the
differential, determinant and similitude conventions. Field base change, the integral forms with
arbitrary coefficients, the ramified Hilbert weight line and the classical VB normalization complete
the layer.

### B4.1 Classical automorphic forms

Define `classicalForms`. For an automorphic coefficient on a smooth projective toroidal model S_Σ/L,
define M(J,K;L)=H⁰(S_Σ,V(J)^can). The definition applies to the Hodge/abelian and general
coefficients through their corresponding B2–B3 layers. Use fan-independent sections for the level
space, proper coherent finiteness for finite dimension, and tensoring of sections for
multiplication. H⁰ on the nonproper open Shimura variety is not a substitute.

*Source:* [Milne90], III §2, p.55 (including the holomorphy-at-infinity caveat); III §7, Definition
7.1, p.62; [LanIntro], §4.2.7, p.50.

The API:

- `classicalForms_section`: A classical form is a global section of the canonical coefficient.
- `classicalForms_fan`: Common refinements induce a canonical identification of M for different
  smooth projective fans.
- `classicalForms_multiply`: Tensoring sections gives M(J1)×M(J2)→M(J1⊗J2).
- `classicalForms_map`: A map u:V^can→W^can on the supplied model induces H⁰(u):M(V)→M(W). In the
  supplied Scheme.Modules section map this is exactly SheafOfModules.sectionsMap u.
- `classicalForms_map_id`: For a fixed admitted input V, the induced map of the identity morphism of
  V is the identity on its output.
- `classicalForms_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of
  v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field
  and model hypotheses remain fixed.

*Needs:* B3.2 (`canonicalExtension`); B3.6 (`fanIndependentSections`); B3.general.1
(`generalCanonicalExtension`); B3.general.3 (`generalBoundaryFunctoriality`); Mathlib
`AlgebraicGeometry.Scheme.Modules`; Mathlib `AlgebraicGeometry.Scheme.Modules.presheaf`; Mathlib
`SheafOfModules.sections`.
*Lean:* none; specified in the README only.

**Checks.**

- `classicalForms_test_unit` (degenerate): For a proper geometrically connected model and trivial
  coefficient, M=L.
- `classicalForms_test_curve` (compatibility): For the modular Hodge coefficient ω^k the space
  agrees with proper-curve sections of AlgebraicModularFormsAndSerreWeights R15.1.
- `classicalForms_test_open` (non-example): For Spec L[t] with coefficient O, H⁰=L[t] has the
  infinite independent family 1,t,t²,…; it cannot replace the proper geometrically connected model,
  whose unit coefficient has H⁰=L.
- `classicalForms_test_map_id` (compatibility): For any supplied Scheme.Modules coefficient V and
  section s, the supplied-section forgetting sends the identity coefficient map to s.
- `classicalForms_test_map_comp` (compatibility): For supplied Scheme.Modules maps u:V→W and v:W→U,
  mapping a section by v∘u equals mapping first by u then by v.
- `classicalForms_test_map_zero` (degenerate): For any supplied Scheme.Modules map u:V→W, its
  global-section map sends the compatible section whose value on every open is zero to the zero
  compatible section.

### B4.2 Cuspidal automorphic forms

Define `cuspForms`. Define S(J,K;L)=H⁰(S_Σ,V(J)^sub). The boundary sequence identifies its image in
M with the kernel of restriction to the reduced boundary. This means vanishing in every boundary
component's ideal in the canonical frame. Use the subcanonical ideal-pushforward comparison for fan
independence. Left exactness suffices for the kernel statement; neither H¹-vanishing nor Koecher's
extension theorem makes boundary vanishing automatic.

*Source:* [LanIntro], §4.2.7, p.50; [BCGP], §4.8.2, Theorem 4.8.2, p.101.

The API:

- `cuspForms_include`: S(J)↪M(J) is induced by the boundary-ideal inclusion.
- `cuspForms_kernel`: A form is cuspidal iff its restriction to every reduced boundary component is
  zero.
- `cuspForms_tensor`: The product of a cusp form with a classical form is cuspidal in the tensor
  coefficient.
- `cuspForms_map`: A map between canonical coefficients induces the boundary-compatible map on their
  I_D twists and hence S(u):S(V)→S(W); the inclusions into classical forms commute with this map.
- `cuspForms_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is
  the identity on its output.
- `cuspForms_map_comp`: For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is
  the composite of the induced map of v with the induced map of u; all datum, level, field and model
  hypotheses remain fixed.

*Needs:* B3.4 (`subcanonicalExtension`); B4.1 (`classicalForms`); B3.6 (`fanIndependentSections`);
Mathlib `AlgebraicGeometry.Scheme.Modules`; Mathlib `AlgebraicGeometry.Scheme.Modules.presheaf`;
Mathlib `SheafOfModules.sections`.
*Lean:* none; specified in the README only.

**Checks.**

- `cuspForms_test_empty` (degenerate): If D=∅, S(J)=M(J).
- `cuspForms_test_constant` (computation): For nonempty boundary and trivial coefficient on a proper
  geometrically connected model, a nonzero constant is not cuspidal.
- `cuspForms_test_crossing` (characterisation): At a two-component crossing a holomorphic
  coefficient is cuspidal iff it lies in the product ideal (q1q2), not merely (q1,q2).

### B4.3 The normalized automorphy factor

Define `AutomorphyFactor`. For a left group action on a complex domain X and a finite-dimensional
complex coefficient V, define a holomorphic linear factor J:Γ×X→GL_ℂ(V) by holomorphy in x, J(1,x)=1
and J(gh,x)=J(g,hx)J(h,x). Its sections satisfy f(gx)=J(g,x)f(x). Canonical extension and cusp
growth are additional conditions in the specified boundary frame: holomorphic extension and
membership in the reduced boundary ideal, respectively. Frame change u gives
J′(g,x)=u(gx)J(g,x)u(x)⁻¹. The functional Lean form keeps the concrete linear equations and omits
the unavailable holomorphic carrier. The scalar cocycle printed in [LanIntro], p.49, omits
the shift of the base point in its first factor; here the shift follows from applying the section
transformation law twice, and agrees with Mathlib `UpperHalfPlane.denom_cocycle`. For
`g = h = ((0,−1),(1,0))` at `z = i`, the correct product is `(−1/z)z = −1`; at `z = 2i` the
unshifted product is `z² = −4`, whereas `J(g²,z) = −1`. Thus the unshifted law is false even
for scalar modular factors of weight one.

*Source:* [LanIntro], §4.2.7, pp.49–50.

The API:

- `AutomorphyFactor_one`: J(1,x)=id.
- `AutomorphyFactor_mul`: J(gh,x)=J(g,hx)∘J(h,x), with the indicated shifted base point.
- `AutomorphyFactor_change_frame`: A holomorphic frame change u gives J′(g,x)=u(gx)J(g,x)u(x)⁻¹ and
  an isomorphic coefficient.
- `AutomorphyFactor_forget`: Forgetting holomorphy yields the normalized linear cocycle input for
  the existing SlashAction adapter.
- `AutomorphyFactor_ext`: Two normalized functional factors with identical coefficient maps at every
  (k,g,x) are equal; the law proofs carry no extra data. The holomorphic refinement additionally
  retains its declared analytic hypotheses.
- `AutomorphyFactor_change_frame_id`: Gauge change by the constant identity frame returns the
  original normalized functional factor.
- `AutomorphyFactor_change_frame_comp`: Changing first by u and then by v equals changing by
  x↦v(x)∘u(x). This is the displayed order of frame composition, not its reverse.

*Needs:* B0.7 (`analyticCoefficient`); B0.8 (`sectionsEquivariant`); B3.2 (`canonicalExtension`);
B3.4 (`subcanonicalExtension`); Mathlib `LinearEquiv.trans`.
*Lean:* `AutomorphyFactor`, `AutomorphyFactor.changeFrame`, `AutomorphyFactor.ext`,
`AutomorphyFactor.changeFrame_id`, `AutomorphyFactor.changeFrame_comp`; the shears `shearX`,
`shearY` and the constant factor `constantFactor` are the test data of the Checks.

**Checks.**

- `AutomorphyFactor_test_unit` (degenerate): The constant identity coefficient is normalized and
  satisfies the shifted cocycle.
- `AutomorphyFactor_test_frame` (computation): For any invertible frame function u,
  J(g,x)=u(gx)u(x)⁻¹ satisfies the shifted cocycle.
- `AutomorphyFactor_test_order` (non-example): For Q² let Sx(a,b)=(a+b,b), Sy(a,b)=(a,a+b). The
  constant functional factor J(g,x)=g for the evaluation action of GL(Q²) has J(SxSy,x)(1,0)=(2,1)
  and J(SySx,x)(1,0)=(1,1). Reversing coefficient composition fails this test.
- `AutomorphyFactor_test_scalar_shift` (non-example): for the modular inversion matrix `S` at
  `z = 2i`, `denom(S²,z) = −1` whereas `denom(S,z)² = −4`. The unshifted scalar law fails.
- `AutomorphyFactor_test_shift` (non-example): On C₂ acting on itself by left multiplication, choose
  frames u(1)=id and u(t)=Sx on Q². Gauge-changing the identity factor gives J(t²,1)(0,1)=(0,1),
  whereas the unshifted square J(t,1)²(0,1)=(2,1). Thus the base-point shift is necessary.

### B4.4 The convention adapter to SlashAction

Construct `slashActionOfAutomorphyFactor`. Let β index weights, G be a monoid acting on X on the
left, R a semiring and V an R-module. A family J(k,g,x):V≃_R V with the normalized shifted cocycle
defines the existing SlashAction β G (X→V) by (f|_k g)(x)=J(k,g,x)⁻¹(f(gx)). Prove its additive and
R-linear laws, its dependence only on the coefficient maps and its equality with precomposition when
J=1. Its right-action multiplication is f|_k(gh)=(f|_k g)|_k h.

*Source:* [LanIntro], §4.2.7, p.49.

The API:

- `slashActionOfAutomorphyFactor_map_apply`: The map evaluates to J(k,g,x)⁻¹(f(gx)).
- `slashActionOfAutomorphyFactor_invariant_iff`: ∀g,f|_k g=f iff ∀g,x,f(gx)=J(k,g,x)f(x).
- `slashActionOfAutomorphyFactor_map_smul`: Slash is R-linear on functions.
- `slashActionOfAutomorphyFactor_congr`: Pointwise equal coefficient families give equal SlashAction
  values, independent of proof terms.
- `slashActionOfAutomorphyFactor_map_of_trivial`: If J is identity, map is precomposition by the
  left base action.

*Needs:* Mathlib `SlashAction`; Mathlib `LinearEquiv.trans`; Mathlib `LinearEquiv.trans_symm`;
Mathlib `LinearEquiv.symm_apply_eq`; Mathlib `LinearEquiv.automorphismGroup`; Mathlib
`LinearEquiv.applyDistribMulAction`.
*Lean:* `slashActionOfAutomorphyFactor`, `slashActionOfAutomorphyFactor_map_smul`,
`slashActionOfAutomorphyFactor_congr`, `slashActionOfAutomorphyFactor_map_of_trivial`.

**Checks.**

- `slashActionOfAutomorphyFactor_test_trivial` (degenerate): For identity J, f|g is x↦f(gx).
- `slashActionOfAutomorphyFactor_test_zero` (computation): The zero function is fixed for every
  normalized coefficient.
- `slashActionOfAutomorphyFactor_test_frame` (characterisation): The point-dependent frame cocycle
  u(gx)u(x)⁻¹ yields exactly u(x)u(gx)⁻¹f(gx).
- `slashActionOfAutomorphyFactor_test_noncommuting` (non-example): For the two rational shears,
  applying the inverse composite in the wrong order changes the value on (1,0).
- `slashActionOfAutomorphyFactor_test_inverse` (non-example): The rational shearX applied to the
  constant (0,1) has slash value (−1,1), detecting an operator that forgets the inverse.
- `slashActionOfAutomorphyFactor_test_sl2` (compatibility): For SL2(Z), V=C and
  J(k,g,z)=denom(g,z)^k as a scalar linear automorphism, the adapter equals Mathlib’s scalar slash
  action.
- `slashActionOfAutomorphyFactor_test_zero_noncocycle` (non-example): The normalized nonzero factor
  on C2 with nonidentity value 2 transforms the zero section but fails J(gh)=J(g)J(h); this is not
  accepted as an adapter input.
- `slashActionOfAutomorphyFactor_test_semilinear` (non-example): The determinant-negative GL2(R)
  slash law has conjugated scalar multiplication and cannot be represented by this C-linear adapter.

### B4.5 Evaluation of the slash adapter

Prove `slashActionOfAutomorphyFactor_map_apply`. For exactly the family and hypotheses used in
slashActionOfAutomorphyFactor, evaluate the map as J(k,g,x)⁻¹(f(gx)). This is the defining-map
formula, without an additional invertibility or nonzero-section assumption.

*Source:* [LanIntro], §4.2.7, p.49.

*Needs:* B4.4 (`slashActionOfAutomorphyFactor`).
*Lean:* `slashActionOfAutomorphyFactor_map_apply`.

**Checks.**

- No nowhere-zero assumption on f is used.

### B4.6 Invariance and the transformation law

Prove `slashActionOfAutomorphyFactor_invariant_iff`. For the same normalized linear family, prove
that f|_k g=f for every g is equivalent to f(gx)=J(k,g,x)f(x) for every g,x. Apply the linear
equivalence at each point; no cancellation of a selected nonzero section is involved.

*Source:* [LanIntro], §4.2.7, p.49.

*Needs:* B4.5 (`slashActionOfAutomorphyFactor_map_apply`); Mathlib `LinearEquiv.symm_apply_eq`.
*Lean:* `slashActionOfAutomorphyFactor_invariant_iff`.

**Checks.**

- The zero function satisfies both sides.

### B4.7 The inverse-base right cocycle

Prove `inverse_base_action_cocycle`. If G and H are groups and J:G×X→H obeys the left shifted
cocycle, the right base action x·g=g⁻¹x has factor J_right(x,g)=J(g⁻¹,x). Its law is
J((gh)⁻¹,x)=J(h⁻¹,g⁻¹x)J(g⁻¹,x). This changes the action on the base; the right slash action on
functions is the separate construction of B4.4.

*Source:* [LanIntro], §4.2.7, p.49.

*Needs:* B4.3 (`AutomorphyFactor`).
*Lean:* `inverse_base_action_cocycle`.

**Checks.**

- Noncommuting coefficient maps distinguish the product order.

### B4.8 When a section detects a scalar cocycle

Prove `cocycle_at_of_automorphy_of_ne_zero`. For a monoid action, a field K and scalar functions
J:G×X→K and f:X→K satisfying f(gx)=J(g,x)f(x), prove the shifted cocycle at any x where f(x)≠0.
Compare f((gh)x) with its iterated transformation and cancel f(x). There is no such deduction at a
zero of f; the identically zero section imposes no cocycle condition.

*Source:* [LanIntro], §4.2.7, p.49.

*Needs:* Mathlib `MulAction`.
*Lean:* `cocycle_at_of_automorphy_of_ne_zero`.

**Checks.**

- For C2 acting trivially on a point, J(nonidentity)=2 and J(identity)=1 transforms zero but
  violates the cocycle because 4≠1.

### B4.9 Geometric and analytic classical forms

Prove `analyticClassicalComparison`. Under L↪ℂ, compare M with holomorphic equivariant sections of
the analytic coefficient whose components extend holomorphically in canonical cusp frames. Compare S
with those components in the reduced boundary ideal. Use the local removable-singularity result for
logarithmic growth and coordinatewise divisibility, then projective coherent GAGA on S_Σ. Scalar
boundedness on the Baily–Borel model requires the separately descended scalar line. A degree-zero
kernel comparison in the course notes does not prove a full Dolbeault resolution.

*Source:* [LanIntro], §4.2.7, pp.49–50; [HarrisLog], p.3, degree-zero kernels only.

*Needs:* B4.1 (`classicalForms`); B4.2 (`cuspForms`); B2.2 (`automorphicAnalyticComparison`); B0.8
(`sectionsEquivariant`); B3.2 (`canonicalExtension`); B3.4 (`subcanonicalExtension`); ShimuraCompactifications C5
(*minimal-hodge-ampleness*, *hodge-semiampleness*, *graded-section-finite-generation*); ComplexComparisonPartII C2 (`projectiveGeometricDictionaries`);
AlgebraicModuliForArithmeticGeometry §7.10.3 `properSchemeGagaEquivalence`.
*Lean:* none; specified in the README only.

**Checks.**

- Changing a frame arbitrarily can change apparent boundedness; the theorem names the canonical
  frame. Negative-determinant full GL2 uses its semilinear extension.

### B4.10 The GL₂ Hodge-line specialization

Prove `gl2HodgeLineComparison`. At a fine modular level on the actual modular-curve model, identify
ω=e\*Ω¹_{E/S}, its generalized-elliptic canonical extension and weight-k coefficient ω^k for every
integer k; negative powers mean duals. Import R15.1's proper-curve geometric forms and their
all-cusp analytic comparison to Mathlib ModularForm/CuspForm. Match the uniformization, Hodge dual
convention, holomorphy and every cusp condition. Use SL₂ for the ℂ-linear factor adapter and the
separate semilinear law for determinant-negative GL₂.

*Source:* [LanIntro], §4.2.7, pp.49–50; [HarrisBundles], pp.1–2.

*Needs:* B2.2 (`automorphicAnalyticComparison`); B4.9 (`analyticClassicalComparison`);
AlgebraicModularFormsAndSerreWeights R15.1 (*Geometric modular forms*, *All-weight analytic
comparison*); Mathlib `ModularForm`; Mathlib `CuspForm`; Mathlib `ModularForm.SL_slash_apply`;
Mathlib `ModularForm.slash_action_eq'_iff`; Mathlib `ModularForm.smul_slash`; Mathlib
`UpperHalfPlane.denom_ne_zero`; Mathlib `UpperHalfPlane.denom_cocycle`; Mathlib
`UpperHalfPlane.denom_cocycle'`; TauCetiRoadmap.ModularForms Layer 10C (the automorphy sheaf on
`X(Γ)`).
*Lean:* the scalar factor `sl2ScalarFactor` and the `example`s
`slashActionOfAutomorphyFactor_test_sl2` and `slashActionOfAutomorphyFactor_test_semilinear` pin the
scalar `SL₂` convention; the geometric comparison is specified in the README only.

**Checks.**

- For k=0 the coefficient is O; an odd weight does not descend through a surviving −1 stabilizer.

### B4.11 Arithmetic Hilbert weights

Define `HilbertArithmeticWeight` for an index type `I` by integers k_τ and a common integer w
with k_τ≡w mod 2. For an arithmetic Hilbert coefficient `I` is the finite set of real embeddings
of F; the integer-data definition and its parity identities need no finiteness hypothesis. Put m_τ=(w−k_τ)/2
and prove 2m_τ=w−k_τ. Define addition and extensionality by the actual integer data. This is a
weight label; field and central descent are separate theorems. Allow negative k_τ and negative
determinant exponents.

*Source:* [Milne90], III §8, pp.63–64; [LanIntro], §4.2.7, pp.49–50; [Diamond21], §3.2, tensor
coefficient formula, Definition 3.2.1 and paritious-weight paragraph, p.12.

The API:

- `HilbertArithmeticWeight_k`: The embedding-indexed integer k_τ.
- `HilbertArithmeticWeight_w`: The common integer central weight w.
- `HilbertArithmeticWeight_detExponent`: m_τ=(w−k_τ)/2.
- `HilbertArithmeticWeight_two_mul_detExponent`: 2m_τ=w−k_τ for every τ.
- `HilbertArithmeticWeight_add`: Pointwise k addition and w addition preserve arithmetic parity.
- `HilbertArithmeticWeight_ext`: Arithmetic weights with the same embedding-indexed k and the same w
  are equal; parity proofs carry no extra data.

*Needs:* Mathlib `Int.emod_two_eq_zero_or_one`.
*Lean:* `HilbertArithmeticWeight`, `HilbertArithmeticWeight.detExponent`,
`HilbertArithmeticWeight.two_mul_detExponent`, `HilbertArithmeticWeight.add`,
`HilbertArithmeticWeight.ext`.

**Checks.**

- `HilbertArithmeticWeight_test_zero` (degenerate): k=0,w=0 is an arithmetic weight and every m_τ=0.
- `HilbertArithmeticWeight_test_negative` (computation): For one embedding, k=4,w=2 gives m=−1, so
  forbidding negative determinant twists would lose an allowed weight.
- `HilbertArithmeticWeight_test_parity` (non-example): k=3,w=2 violates parity and is not an
  arithmetic weight.
- `HilbertArithmeticWeight_test_add` (computation): at one index, adding `(k,w) = (4,2)` to
  `(2,0)` gives `(6,2)` and determinant exponent `−2`, the sum of the two exponents `−1`.
  Addition with `(0,0)` fixes a weight, and addition with its negative gives `(0,0)`.


### B4.12 The split Hilbert coefficient

Construct `hilbertCoefficient`. Over a characteristic-zero splitting field L for F and the actual
Hilbert–Blumenthal family, take H¹_dR=⊕_τH_τ and ω=⊕_τω_τ, with ranks two and one. Set δ_τ=det H_τ
and ω^{(k,w)}=⊗_τ(ω_τ^{k_τ}⊗δ_τ^{(w−k_τ)/2}). In cohomological frames t_τ acts on ω_τ by t_τ and on
δ_τ by t_τ², giving the central character Norm(t)^w. Homology frames invert it. Tensor products
correspond to addition of arithmetic weights.

*Source:* [Milne90], III §8, pp.63–64; [LanIntro], §4.2.7, pp.49–50; [Diamond21], §3.2, tensor
coefficient formula, Definition 3.2.1 and paritious-weight paragraph, p.12.

The API:

- `hilbertCoefficient_formula`: The line equals the displayed tensor of ω_τ powers and determinant
  powers.
- `hilbertCoefficient_central`: Its cohomological-frame central action is Norm(t)^w.
- `hilbertCoefficient_add`: Coefficient tensor products correspond to addition of arithmetic
  weights.

*Needs:* B4.11 (`HilbertArithmeticWeight`); B2.1 (`automorphicVectorBundle`); B0.3
(`hodgeParabolicConvention`); HilbertModularVarietiesAndShimuraCurves H1 (Hilbert–Blumenthal
families and their `O_F ⊗ O`-modules); HilbertModularVarietiesAndShimuraCurves H2 (ramified
Pappas–Rapoport splitting models and the Rapoport locus).
*Lean:* none; specified in the README only.

**Checks.**

- `hilbertCoefficient_test_rational` (compatibility): For F=Q, (k,w=k) has m=0 and gives ω^k.
- `hilbertCoefficient_test_determinant` (computation): For every embedding k_τ=0,w=2, the
  coefficient is ⊗_τdet H_τ.
- `hilbertCoefficient_test_negative` (non-example): At k_τ=4,w=2 the determinant factor is δ_τ⁻¹;
  replacing m by its absolute value changes the central character.

### B4.13 The Hilbert central-action check

Prove `hilbertCentralDescent`. For the actual Res_{F/ℚ}GL₂ or G\* quotient and its ineffective
central subgroup C, the split coefficient descends precisely when Norm(t)^w, or its homology
inverse, is trivial on C. Totally positive norm-one units pass this test, but remaining signs and
finite stabilizers need their own check. Use H0/H3/H4's true polarization and unit quotient for G\*,
retaining the stack coefficient if descent fails.

*Source:* [Milne90], III §8, pp.63–64; [Diamond21], §3.2, tensor coefficient formula, Definition
3.2.1 and paritious-weight paragraph, p.12.

*Needs:* B4.12 (`hilbertCoefficient`); B0.2 (`ineffectiveFibreDescent`);
HilbertModularVarietiesAndShimuraCurves H0 (Hilbert data, centres and effective quotients);
HilbertModularVarietiesAndShimuraCurves H3 (cusp representatives, polarization and unit quotients);
HilbertModularVarietiesAndShimuraCurves H4 (central level kernels and stabilizers).
*Lean:* none; specified in the README only.

**Checks.**

- Neatness alone never discharges the infinite-unit condition; norm −1 and a parity-odd w can
  obstruct a quotient that includes such units.

### B4.14 Hilbert coefficients without a global splitting

Prove `unsplitHilbertDescent`. Before a splitting extension use the O_F⊗O-linear Hodge and de Rham
modules with their determinant/norm constructions, rather than global embedding idempotents. After
splitting, descend the labelled tensor coefficient using the actual Galois permutation of embeddings
and representation datum, together with the central descent condition. Its field is the
weight/representation field and can exceed the reflex field. Integral versions require the indicated
finite locally free hypotheses.

*Source:* [Milne90], III §5, Theorem 5.1, p.61; III §8, pp.63–64.

*Needs:* B4.12 (`hilbertCoefficient`); B0.9 (`coefficientGaloisDescent`); B4.13
(`hilbertCentralDescent`); HilbertModularVarietiesAndShimuraCurves H1 (Hilbert–Blumenthal families
and their `O_F ⊗ O`-modules); HilbertModularVarietiesAndShimuraCurves H2 (ramified Pappas–Rapoport
splitting models and the Rapoport locus).
*Lean:* none; specified in the README only.

**Checks.**

- A nonparallel real-quadratic weight is exchanged by the two embeddings, so it is not automatically
  Q-defined.

### B4.15 The ramified Hilbert weight line

**Gap.** The ramified boundary geometry specified above is not supplied by the cited C6 targets.

Construct `ramifiedHilbertLine`. Let `F ≠ ℚ` be totally real, `p` a prime that may ramify in `F`
(including `p = 2`), `O` the valuation ring of a sufficiently large `p`-adic field with the set `Θ`
of embeddings of `F`, and `Ỹ` Diamond's Pappas–Rapoport splitting model of the Hilbert modular
variety of prime-to-`p` level `U(N)` over `O`, with its toroidal and minimal compactifications and
the open immersion `j̃ : Ỹ → Ỹ^min`. For `k, m ∈ ℤ^Θ` and a Noetherian `O`-algebra `R`, let
`Ã_{k,m,R} = ⊗_θ ω_θ^{k_θ} ⊗ δ_θ^{m_θ}` be the line bundle on `Ỹ_R` built from the splitting
filtration, with one line `ω_θ` and one determinant line `δ_θ` for each embedding and duals for
negative exponents. The semi-abelian extension of the universal family gives a formally canonical
extension of `Ã_{k,m,R}` to `Ỹ^tor_R`, and `j̃_*Ã_{k,m,R}` is coherent on `Ỹ^min_R`. For a
sufficiently small level `U` prime to `p` such that the character `χ_{k+2m,R}` is trivial on
`O_F^× ∩ U`, `Ã_{k,m,R}` descends to a line bundle `A_{k,m,R}` on `Y_R`, and `i_*A_{k,m,R}` is
coherent on `Y^min_R` for `i : Y_R → Y^min_R`. The descent hypothesis forces either `pⁿR = 0` for
some `n > 0` or `k_θ + 2m_θ` independent of `θ`.

*Hypotheses.* `R` is a Noetherian `O`-algebra and `U` is prime to `p` and sufficiently small; the
trivial-unit-character condition is part of the construction of `A_{k,m,R}` on `Y_R`. The
pushforward to the minimal model is coherent and need not be invertible.

*Source:* [Diamond22], §2.9, p.7, and §2.10, pp.7–8; §6.1, p.24; [Diamond21], §3.2, Definition 3.2.1
and the paritious-weight paragraph, p.12.

The API:

- `ramifiedHilbertLine_tensor`: `A_{k,m} ⊗ A_{k′,m′} ≅ A_{k+k′,m+m′}` and `A_{0,0} = O`.
- `ramifiedHilbertLine_baseChange`: formation commutes with maps `R → R′` of Noetherian
  `O`-algebras.
- `ramifiedHilbertLine_canonical`: the extension to `Ỹ^tor_R` is formally canonical, with completion
  along the boundary as described by Diamond 2021, Proposition 7.2.1.
- `ramifiedHilbertLine_minimal`: `i_*A_{k,m,R}` is coherent on `Y^min_R`.
- `ramifiedHilbertLine_unramified`: where `p` is unramified, `ω_θ` and `δ_θ` are the embedding
  components of B4.12, and for parallel `k + 2m = w` the line is that coefficient for the arithmetic
  weight `(k, w)`.

*Needs:* HilbertModularVarietiesAndShimuraCurves H2 (ramified Pappas–Rapoport splitting models);
HilbertModularVarietiesAndShimuraCurves H3 (unit and polarization quotients);
ShimuraCompactifications C6 (*hilbert-toroidal-model*, *hilbert-minimal-formal-comparison*);
ShimuraCompactifications C5 (*integral-coefficient-extension*); B4.11 (`HilbertArithmeticWeight`);
B4.12 (`hilbertCoefficient`).
*Lean:* none; specified in the README only.

**Checks.**

- `ramifiedHilbertLine_test_zero` (degenerate): `(k, m) = (0, 0)` gives `O_Y`.
- `ramifiedHilbertLine_test_parallel` (compatibility): for `k = (1, …, 1)` and `m = 0` over a
  characteristic-zero `R`, `A_{k,m}` is `⊗_θ ω_θ = det_R(ω)`, the determinant of the
  rank-`[F : ℚ]` Hodge bundle over the base ring, and agrees with B4.12 at `k_τ = 1`, `w = 1`.
- `ramifiedHilbertLine_test_descent` (non-example): for `F` real quadratic, `R` flat over `O` and
  `k + 2m = (1, 3)`, a unit `u` of norm one has `χ(u) = θ₁(u) θ₂(u)³ = θ₁(u)⁻²`, which is not `1`
  unless `u = ±1`; so the unit condition fails on every finite-index subgroup of `O_F^×` and
  `Ã_{k,m,R}` does not descend to `Y_R`. A definition that ignores the unit character produces a
  sheaf on the wrong space.

### B4.16 Siegel Schur and determinant coefficients

Construct `siegelCoefficient`. For a rank-g cohomological Hodge bundle ω and dominant integer
λ₁≥⋯≥λ_g, set a_i=λ_i−λ_g and define S_a(ω)⊗det(ω)^{λ_g} in characteristic zero. Declare the
similitude/Tate character independently. For a good integral base require the actual integral Schur
representation. Compare with BCGP's two tautological Levi coefficients using the opposite/dual
switch from B2, without asserting a split Hodge sequence. Scalar λ=(r,…,r) gives det(ω)^r;
λ=(1,0,…,0) gives the rank-g ω.

*Source:* [BCGP], §3.2.19, p.45; §4.8.1–4.8.2, pp.101–102; [HLTT], Appendix B.8, pp.270–271.

The API:

- `siegelCoefficient_schur`: The coefficient is S_(λ−λ_g)(ω)⊗det(ω)^{λ_g} with its separately
  declared central twist.
- `siegelCoefficient_scalar`: For λ=(r,…,r) the coefficient is det(ω)^r.
- `siegelCoefficient_standard`: For λ=(1,0,…,0) it is ω.

*Needs:* B2.1 (`automorphicVectorBundle`); B2.3 (`leviHighestWeightConvention`); PELModuli M3
(fine-level universal abelian families); PELModuli M5 (the Siegel and split `GU(1,1)` examples);
AbelianSchemesAndArithmeticModuli A4 (`AbelianH1dR` with its Hodge sequence and Gauss–Manin
connection, `AbelianTate`, `exteriorCohomology`);
TauCetiRoadmap.RepresentationTheory.ClassicalGroups Layer 2 (`schurFunctor`).
*Lean:* none; specified in the README only.

**Checks.**

- `siegelCoefficient_test_g1` (compatibility): For g=1 the coefficient is the modular Hodge-line
  power ω^{λ₁}.
- `siegelCoefficient_test_det` (computation): For λ=(−1,…,−1) it is det(ω)⁻¹, not a polynomial-only
  Schur coefficient.
- `siegelCoefficient_test_standard` (non-example): For g>1, λ=(1,0,…,0) yields rank g, so replacing
  every Siegel coefficient by a scalar determinant power fails.

### B4.17 A split unitary coefficient test

Construct `unitaryCoefficient`. For the imaginary-quadratic GU(1,1) PEL datum over L containing the
two labelled embeddings τ and barτ, take H¹_dR=H_τ⊕H_barτ with rank-two summands and rank-one Hodge
lines. In cohomological graded frames the GL₁×GL₁×G_m coefficient (k,l;n) is ω_τ^k⊗ω_barτ^l⊗ν^n,
with ν the specified similitude/Tate line. Negative exponents use duals. Conjugation swaps k and l
and transports the PEL datum; no universal determinant identification of ν is assumed.

*Source:* [HLTT], Appendix B.8, pp.270–271; [CS], §2.3, pp.669–670.

The API:

- `unitaryCoefficient_formula`: The labelled weight coefficient is ω_τ^k⊗ω_barτ^l⊗ν^n.
- `unitaryCoefficient_dual`: The dual weight is (−k,−l;−n), with dualized similitude line.
- `unitaryCoefficient_conjugate`: The embedding permutation transports (k,l;n) to (l,k;n) and the
  transported PEL coefficient.

*Needs:* B2.1 (`automorphicVectorBundle`); B0.9 (`coefficientGaloisDescent`); B0.2
(`ineffectiveFibreDescent`); PELModuli M0 (PEL data and their compact duals); PELModuli M3
(fine-level universal abelian families); PELModuli M5 (the Siegel and split `GU(1,1)` examples).
*Lean:* none; specified in the README only.

**Checks.**

- `unitaryCoefficient_test_unit` (degenerate): Weight (0,0;0) gives O.
- `unitaryCoefficient_test_line` (computation): Weight (1,0;0) gives ω_τ, while (0,1;0) gives the
  differently labelled ω_barτ.
- `unitaryCoefficient_test_twist` (non-example): Weight (0,0;1) is ν, so erasing the formal
  similitude/Tate line loses a coefficient even when k=l=0.

### B4.18 Rational forms and field base change

Prove `numberFieldFormsBaseChange`. For a proper toroidal model over L and a coherent canonical or
subcanonical coefficient F, prove finite dimension of H⁰ and the field-extension isomorphism
H⁰(S_Σ,F)⊗_L L′≃H⁰(S_Σ×_L L′,F_L′). Under L↪ℂ this identifies the rational classical or cusp space
inside its analytic counterpart. Check products and coefficient maps. An integral special-fibre
base-change assertion would require different hypotheses.

*Source:* [Milne90], III §7, Definition 7.1 and Proposition 7.2, p.62; Corollary 7.3, p.63.

*Needs:* B4.1 (`classicalForms`); B4.2 (`cuspForms`); B3.9 (`canonicalRationalDescent`); B4.9
(`analyticClassicalComparison`).
*Lean:* none; specified in the README only.

**Checks.**

- A characteristic-zero field extension is flat; reduction modulo p may have extra forms and is not
  covered.

### B4.19 Sections on quasi-compact quasi-separated stacks and filtered colimits

Prove `qcqsSectionsColimit`. On a quasi-compact and quasi-separated algebraic stack `𝒳`,
homomorphisms out of a finitely presented `O_𝒳`-module `𝓖` commute with filtered colimits: for every
directed system `(𝓕_i)` of `O_𝒳`-modules, a map `𝓖 → colim_i 𝓕_i` factors through some `𝓕_i`,
uniquely up to passing further along the system. Taking `𝓖 = O_𝒳` shows that global sections of
quasi-coherent modules on `𝒳` commute with filtered colimits. Applied to `𝓕_i = 𝓔 ⊗_R M_i`, for a
locally free `𝓔` and the finitely generated submodules `M_i` of an `R`-module `M`, every section of
`𝓔 ⊗_R M` comes from some `𝓔 ⊗_R M_i`.

*Hypotheses.* Quasi-compactness and quasi-separatedness of `𝒳` and finite presentation of `𝓖` are
both needed. The statement concerns filtered colimits; no commutation of sections with infinite
products is asserted.

*Source:* [StacksColimit], 0GQZ, Lemma 103.13.5.

*Needs:* SchemeAndStackFoundations SF.1 (*stack-quasi-coherent*).
*Lean:* none; specified in the README only.

**Checks.**

- For an infinite direct sum `M = ⊕_{n∈ℕ} R` the sections of `𝓔 ⊗_R M` are `⊕_n Γ(𝓔)`; for the
  product `∏_n R` no such statement is made, and the expansion principle of Layer B5 never uses one.
- On a non-quasi-compact scheme `⊔_{n∈ℕ} Spec R` the global sections of `O ⊗ M` are `∏_n M`, and
  `colim` over finitely generated submodules of `M` fails to reach them when `M` is not finitely
  generated; the qcqs hypothesis is necessary.

### B4.20 Integral automorphic forms with arbitrary coefficient modules

Define `integralForms`. On Lan's good-prime PEL toroidal model `M^tor_H` over `O_{F₀,(□)}`, the
proper smooth algebraic stack attached to a compatible choice of smooth projective cone
decompositions, let `ω_tor = ∧^top Lie^∨_{G^tor/M^tor}` be the Hodge invertible sheaf of the
tautological semi-abelian scheme. For `k ≥ 0` and an arbitrary `O_{F₀,(□)}`-module `M` define
`AF(k, M) = Γ(M^tor_H, ω_tor^{⊗k} ⊗_{O_{F₀,(□)}} M)`, the automorphic forms of naive parallel weight
`k` with coefficients in `M`. For vector coefficients put `AF(W, M) = Γ(M^tor_H, Ecan(W) ⊗_R M)` and
`AF_cusp(W, M) = Γ(M^tor_H, Esub(W) ⊗_R M)`, with `Ecan` and `Esub` from B3.10. The coefficient
module is tensored inside the sheaf: `Γ(Ecan(W)) ⊗_R M` is a different module in general. As a
functor of `M`, `AF(W, −)` is left exact and commutes with filtered colimits, and it does not depend
on the cone decomposition.

*Hypotheses.* `M` is arbitrary: it need not be flat, finitely generated or an algebra. The weight is
the naive parallel weight of the Hodge line or a representation `W` as in B3.10.

*Source:* [LanPEL], Definition 7.1.1.1 and Remark 7.1.1.3, p.532; Lemma 7.1.1.4, pp.532–533.

The API:

- `integralForms_map`: an `R`-linear map `M → N` induces `AF(W, M) → AF(W, N)`, with identity and
  composition laws.
- `integralForms_colimit`: `AF(W, colim_i M_i) = colim_i AF(W, M_i)` for a filtered system, by
  B4.19.
- `integralForms_fan`: for a refinement `Σ′` of `Σ`, pullback gives `AF_Σ(W, M) ≅ AF_{Σ′}(W, M)` and
  the same for cusp forms (ShimuraCompactifications C3 *coherent-cohomology-invariance*).
- `integralForms_cusp_include`: `AF_cusp(W, M) → AF(W, M)`, induced by `I_D ⊂ O`, is injective.
- `integralForms_charZero`: for `M = L` a characteristic-zero field over the base, `AF(W, L)` and
  `AF_cusp(W, L)` are B4.1 and B4.2 of the automorphic bundle of `W`.

*Needs:* B3.10 (`integralLeviCoefficient`); B4.1 (`classicalForms`); B4.2 (`cuspForms`); B4.19
(`qcqsSectionsColimit`); ShimuraCompactifications C5 (*integral-toroidal-space*);
ShimuraCompactifications C3 (*coherent-cohomology-invariance*).
*Lean:* none; specified in the README only.

**Checks.**

- `integralForms_test_zero` (degenerate): `AF(k, 0) = 0`.
- `integralForms_test_field` (compatibility): for `M` a characteristic-zero field the module is the
  classical space `M(J, K; L)` of B4.1 for the determinant-Hodge coefficient of weight `k`.
- `integralForms_test_leftExact` (characterisation): for `0 → R →^p R → R/p → 0` with `p` a
  nonzerodivisor on the flat model, the sequence `0 → AF(k, R) → AF(k, R) → AF(k, R/p)` is exact and
  the last map is onto exactly when `H¹(M^tor_H, ω_tor^k)` has no `p`-torsion. The alternative
  `AF(k, R) ⊗_R M` would make the last map onto in every case, so it fails as soon as that `H¹` has
  `p`-torsion.
- `integralForms_test_fan` (compatibility): the module does not change when `Σ` is replaced by a
  smooth projective refinement.

### B4.21 The classical VB coefficient normalization

Prove `classicalVBTateNormalization`. In BCGP's Hodge-type setting, fix neat tame K^p, a p-adic
field large enough for the split group and reflex embeddings, compatible toroidal fans, and the
rational Hodge–Tate `M`-torsor and `VB` functor of `HodgeTateVBInput`. For an algebraic Levi
coefficient L_κ identify VB⁰_Σ(L_κ)≃ω^{κ,sm}(κ(μ)), where ω^{κ,sm}=colim_{K_p}ω^κ_{K_p} has the
classical rational structure. Transport the comparison when the group action moves fans, using
compatible refinements. The μ-weight twist belongs to this identification; §4.8's coherent
convention is untwisted.

**Gap.** No construction of `HodgeTateVBInput` is supplied; this comparison remains conditional.

*Assumes:* `HodgeTateVBInput` (*Missing comparison prerequisites*).

*Source:* [BCGP], §4.5, proof end p.78.

*Needs:* B2.1 (`automorphicVectorBundle`); B1.5 (`filtrationReduction`); B3.2
(`canonicalExtension`); B2.3 (`leviHighestWeightConvention`); B1.10 (`principalHeckePullback`); B3.6
(`fanIndependentSections`); the input `HodgeTateVBInput`.
*Lean:* none; specified in the README only.

**Checks.**

- For the tensor unit κ=0 the twist is zero. In §4.8 the underlying coherent ω^κ is used without
  retaining the §4.5 twist twice.

### Examples

- For a proper geometrically connected model the unit coefficient has `H⁰ = L`, while on `Spec L[t]`
  the sections `1, t, t², …` are independent; properness is essential (B4.1).
- For an arithmetic Hilbert weight with `k = 4`, `w = 2` at one embedding the determinant exponent
  is `m = −1`; replacing it by its absolute value changes the central character (B4.11, B4.12).
- For the rational shears `S_x(a, b) = (a + b, b)` and `S_y(a, b) = (a, a + b)` and the constant
  factor `J(g, x) = g`, `J(S_xS_y, x)(1, 0) = (2, 1)` while `J(S_yS_x, x)(1, 0) = (1, 1)`; the slash
  adapter sends the constant `(1, 0)` to `(1, −1)` under `S_xS_y` (B4.3, B4.4).
- For `0 → ℤ_(p) → ℤ_(p) → 𝔽_p → 0` the map `AF(k, ℤ_(p)) → AF(k, 𝔽_p)` is onto exactly when
  `H¹(ω_tor^k)` has no `p`-torsion (B4.20).

### Dependencies

Layers B0–B3.general; AlgebraicModularFormsAndSerreWeights R15.1; ComplexComparisonPartII C2;
HilbertModularVarietiesAndShimuraCurves H0–H4; PELModuli M0, M3, M5; ShimuraCompactifications C3,
C5, C6; TauCetiRoadmap RepresentationTheory/ClassicalGroups Layer 2; Mathlib `SlashAction`,
`ModularForm`, `CuspForm`; the input `HodgeTateVBInput`.

## Layer B5: Hecke action and Fourier expansions

This layer works in four distinct geometric settings: determinant-weight good-prime PEL
coefficients, finite projective vector coefficients on the same PEL models, prime-to-`p` ramified
Hilbert coefficients, and the characteristic-zero classical Siegel comparison; each target names its
base and model. The scalar Fourier–Jacobi expansion of Hodge-line sections is
ShimuraCompactifications C5 (*hodge-line-fourier-jacobi-expansion*, `HodgeLineFJ`): its coefficient
modules `Γ(C_Φ, Ψ_Φ(ℓ) ⊗ L_Φ^k ⊗ M)` of sections over the abelian torsor (for a non-flat `M` this is
the form to use: rewriting it as `p_*Ψ_Φ(ℓ) ⊗ M` on the boundary moduli needs a base-change
theorem), its independence of the cone and of the cone decomposition, its full-stabilizer
invariance, its functoriality in `M` and the restriction to a stratum through the constant term.
This layer proves the expansion principle for it — injectivity on prime quotients, then finite
modules by a prime filtration, then arbitrary modules by filtered colimits — and the geometric
detection hypotheses are established before that algebraic reduction. It then constructs geometric
Hecke operators, extends expansions to vector coefficients and to Diamond's ramified Hilbert
setting, and states the classical Siegel Hodge–Tate decompositions.

### B5.1 The trace of a finite locally free morphism

Construct `finiteLocallyFreeTrace`. For a finite locally free morphism `π : X → Y` of schemes,
define the trace `Tr_π : π_*O_X → O_Y`, sending a local section `f` to the trace of multiplication
by `f` on the finite locally free `O_Y`-module `π_*O_X`. It is `O_Y`-linear and `Tr_π ∘ π^♯` is
multiplication by the locally constant degree of `π`. For a finite locally free `O_Y`-module `𝓕`,
the projection formula `π_*π^*𝓕 ≅ π_*O_X ⊗ 𝓕` gives `Tr_{π,𝓕} : π_*π^*𝓕 → 𝓕`. The trace is
transitive along composites of finite locally free morphisms and commutes with base change along any
`Y′ → Y`; on an affine open where `π_*O_X` is free with a basis it is the algebra trace computed in
that basis. For finite locally free morphisms of algebraic stacks the trace is defined by descent
along a flat atlas, by the base-change property.

*Hypotheses.* `π` is finite and locally free; the trace of a finite morphism that is not flat is not
defined by this construction. No averaging by the degree is involved, so the degree need not be
invertible.

*Source:* [StacksTrace], 0BVH, Section 49.3.

The API:

- `finiteLocallyFreeTrace_linear`: `Tr_π` is `O_Y`-linear.
- `finiteLocallyFreeTrace_unit`: `Tr_π(π^♯ a) = deg(π)·a`.
- `finiteLocallyFreeTrace_comp`: `Tr_{π∘π′} = Tr_π ∘ π_*Tr_{π′}` for finite locally free
  `π′ : X′ → X`.
- `finiteLocallyFreeTrace_baseChange`: formation commutes with base change along `Y′ → Y`.
- `finiteLocallyFreeTrace_coefficient`: `Tr_{π,𝓕}` is natural in `𝓕` and equals `Tr_π ⊗ id_𝓕` under
  the projection formula.

*Needs:* Mathlib `Algebra.trace_algebraMap_of_basis`, `Algebra.trace_trace`,
`LinearMap.trace_baseChange`; SchemeAndStackFoundations SF.1 (*qcoh-fpqc-descent*,
*stack-quasi-coherent*).
*Lean:* none; specified in the README only.

**Checks.**

- `finiteLocallyFreeTrace_test_identity` (degenerate): for `π = id`, `Tr_π = id`.
- `finiteLocallyFreeTrace_test_quadratic` (computation): for `X = Spec R[t]/(t² − a) → Y = Spec R`,
  `Tr(1) = 2`, `Tr(t) = 0` and `Tr(t²) = 2a`; the trace is not divided by the degree.
- `finiteLocallyFreeTrace_test_charP` (non-example): for the trivial cover `X = ⊔_{i=1}^{p} Y` over
  an `𝔽_p`-scheme, `Tr(1) = p = 0`; an operator defined by averaging over the fibre does not exist
  there, while the trace does.

### B5.2 Left exactness of Hodge-section coefficient change

Prove `integralForms_coefficient_leftExact`. For a short exact coefficient sequence 0→N→M→Q→0 on the
supplied R-flat model, prove 0→AF(k,N)→AF(k,M)→AF(k,Q) is left exact. Local freeness of the Hodge
coefficient and R-flatness on the atlas give exactness after tensoring; descend the quasi-coherent
sequence and take sections. Surjectivity onto AF(k,Q) is not asserted.

*Hypotheses.* The toroidal model X is flat over R and omega_tor^k is locally free over O_X, as
supplied by ShimuraCompactifications C5 and by B3.10 and B4.20. Sections and tensor products are
taken on the actual algebraic stack or an equivalent descent presentation, not its coarse space.

*Source:* [LanPEL], First paragraph of the proof of 7.1.2.14, printed p. 539.

*Needs:* B4.20 (`integralForms`); ShimuraCompactifications C5 (*integral-toroidal-space*,
*formal-completion*); SchemeAndStackFoundations SF.1 (*stack-quasi-coherent*, *qcoh-fpqc-descent*);
Mathlib `Module.Flat` (tensoring with a flat module preserves injections); B3.2
(`canonicalExtension`); B4.1 (`classicalForms`).
*Lean:* none; specified in the README only.

**Checks.**

- N=M and Q=0 recovers the identity inclusion.
- For the flat affine rank-one chart over Z, the coefficient sequence Z --2--> Z to Z/2 remains left
  exact.
- Dropping R-flatness is invalid: on Spec F_p over Z the locally free O_X-module O_X turns Z --p-->
  Z into the zero map. Local freeness over O_X alone is insufficient.

### B5.3 Left exactness of invariant coefficient families

Prove `FJCoefficient.invariantFamily_leftExact`. For the same short exact coefficient sequence,
prove left exactness of 0→G(N)→G(M)→G(Q), including the products over character degrees and full
stabilizer invariants. On each R-flat abelian-torsor chart use locally free tensoring and section
left exactness. Products have componentwise unique kernel lifts; equivariance and uniqueness make
those lifts invariant. Neither right exactness of invariants nor their commutation with filtered
colimits is used.

*Hypotheses.* Each C_Phi is flat over R and each character-Hodge coefficient sheaf Psi_Phi(ell)
tensor L_Phi^k is invertible on C_Phi. These geometric facts come from ShimuraCompactifications C4
and C5. The full stabilizer actions are R-linear, preserve the transported coefficient sequence, and
are the actions of `HodgeLineFJ` (ShimuraCompactifications C5). The stabilizer need not be finite or
have invertible order.

*Source:* [LanPEL], 7.1.2.14, first paragraph and exact-row diagram on printed p. 539.

*Needs:* ShimuraCompactifications C5 (*hodge-line-fourier-jacobi-expansion*, `HodgeLineFJ`,
*integral-toroidal-space*, *formal-completion*); ShimuraCompactifications C1 (*cusp-label*,
*arithmetic-stabilizer*); ShimuraCompactifications C4 (*semi-abelian-scheme*,
*formal-universal-degeneration*); SchemeAndStackFoundations SF.1 (*stack-quasi-coherent*,
*qcoh-fpqc-descent*); Mathlib `Module.Flat` (tensoring with a flat module preserves injections).
*Lean:* none; specified in the README only.

**Checks.**

- A trivial C_p-action on F_p has its entire module as invariants, even though averaging by p is
  undefined.
- For the unipotent C_p-action on F_p^2 with generator (a,b) sent to (a+b,b), the equivariant
  sequence 0 to F_p to F_p^2 to F_p to 0 is exact, but the map on invariants to the final F_p is
  zero. This rejects a false right-exactness claim.
- Infinite degree products are allowed here, but their interchange with a filtered union is not
  inferred.

### B5.4 The prime-quotient coefficient case

Prove `FourierJacobi.injective_primeQuotient`. For a prime ideal p of the field or Dedekind base R,
including p=0, put S=R/p. Assume the chosen base-changed strata meet every irreducible component of
the reduced model X_S and the completed coefficient charts are compatible with this base change.
Then the joint expansion on AF(k,S) is injective. At neat level use ShimuraCompactifications C5
(*neat-strata-detect-geometric-components*) with its good-prime regular base and
fan/no-self-intersection assumptions; non-neat coverage requires a separate branch or level-descent
comparison. Zero coefficients give zero completed sections, finite-stalk Krull separation gives zero
near the selected strata, and reducedness plus component detection gives global zero.

*Hypotheses.* The good-prime model of ShimuraCompactifications C5 is smooth over the regular base R;
hence X and each residue-field model used here are reduced and locally Noetherian, with locally free
pulled-back Hodge line. F0 still supplies separated homogeneous coefficient extraction and
identification with completion of the actual Hodge sheaf; SF.1 supplies the passage through a flat
atlas. Local adic separation of a finite stalk at a proper ideal is already a pinned Mathlib
theorem, and ordinary coherent-section detection near a closed subset is AdicSpacesPartII F0
(sections near a closed subset). Use AF(k,R/p) = Gamma(X_S,omega_S^k) through the closed-base-change
sheaf identification. Do not replace this by AF(k,R) tensor_R S without a base-change theorem.

The base-change step compares finite thickenings first: (P/I^(n+1)P)⊗_R S≃P_S/I_S^(n+1)P_S. These
identifications commute with n and chart transport, so their inverse systems can be compared without
moving tensor past an arbitrary inverse limit. At a selected stratum point, the Noetherian finite
stalk is separated at its proper stratum ideal by Mathlib's existing Krull-intersection theorem. The
corresponding completion-detection theorem gives an open zero locus; reducedness and fibrewise
component coverage make it dense in each component. Carry this zero-locus argument through the
actual flat atlas, without requiring every affine atlas chart to meet a selected stratum.

*Source:* [LanPEL], 7.1.2.14(1), p. 539; 6.4.1.1(2)-(5), p. 520; 6.4.1.2, p. 523; [StacksKrull],
00IP, Lemma 10.51.4; [StacksStein], 0A18, Theorem 76.36.4 and Lemma 76.36.9 (also tag 0E0D); [EGAI],
Chapter I, Proposition 10.8.11 and proof, printed p. 197 (physical PDF 196).

*Needs:* ShimuraCompactifications C5 (*hodge-line-fourier-jacobi-expansion*, `HodgeLineFJ`,
*integral-toroidal-space*, *formal-completion*, *neat-strata-detect-geometric-components*);
AdicSpacesPartII F0 (`FormalScheme.completion`, completion of coherent sheaves, sections near a
closed subset, after EGA I (10.8.11)); SchemeAndStackFoundations SF.1 (*stack-quasi-coherent*,
*qcoh-fpqc-descent*); Mathlib `Module.Flat` (tensoring with a flat module preserves injections);
Mathlib `Ideal.iInf_pow_smul_eq_bot_of_isLocalRing`; Mathlib `IsHausdorff.of_isLocalRing`; Mathlib
`AdicCompletion.of_injective`.
*Lean:* none; specified in the README only.

**Checks.**

- A nonempty stratum on a smooth connected component over a field detects a line-bundle section.
- Two disjoint smooth curves with all selected strata on only one component violate the detection
  hypothesis and admit an undetected section.
- For a general smooth R-scheme, total-space detection alone need not imply residue-fiber detection:
  Spec R and its open subscheme Spec R[1/p] provide the elementary warning. This example is not
  asserted to be a PEL boundary stratum or a counterexample to Lan's theorem.
- For X=P1_R with its two disjoint relative boundary sections, each whole boundary section meets the
  unique component of every geometric fiber. Removing the closed fiber from one section destroys
  fiberwise density although that open still meets the total component. This distinguishes the
  needed relative-stratum hypothesis from mere total-space density.
- At a Tate chart with A=R[q], I=(q), P=A and S=R/p, every finite-thickening comparison sends the
  class of q^j to the same class for 0<=j<=n. It makes no assertion that tensor commutes with all
  inverse limits.
- For a nonzero module over F₂, completion at the unit ideal is zero and its canonical map is not
  injective. This rejects omitting the proper-ideal condition from the local finite-stalk argument.

### B5.5 Propagation through a coefficient extension

Prove `FourierJacobi.injective_of_extension`. For the two actual left-exact coefficient rows of
0→N→M→Q→0, injectivity of FJ on AF(k,N) and AF(k,Q) implies injectivity on AF(k,M). Apply Mathlib's
short-complex monicity theorem to the natural expansion morphism; its first-row monomorphisms and
exactness are B5.2 and B5.3. Nonsplit coefficient extensions and torsion are allowed. Surjectivity
of the last global-section map is unnecessary.

*Hypotheses.* Use the exact section row, the monic first coefficient-family map, and the naturality
squares supplied by B5.2, B5.3 and `HodgeLineFJ`. Do not add a surjectivity assumption on AF(k,M) to
AF(k,Q), or invert a coefficient characteristic or a stabilizer order.

*Source:* [LanPEL], The left-exact coefficient functors in the proof of 7.1.2.14, pp.539–540.

*Needs:* ShimuraCompactifications C5 (*hodge-line-fourier-jacobi-expansion*, `HodgeLineFJ`); B5.2
(`integralForms_coefficient_leftExact`); B5.3 (`FJCoefficient.invariantFamily_leftExact`); Mathlib
`CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono`.
*Lean:* none; specified in the README only.

**Checks.**

- The nonsplit sequence 0 to Z/2 to Z/4 to Z/2 to 0 tests the nilpotent-torsion step.
- The argument still applies when the last section-row map is not surjective.
- With N=0 or Q=0 it agrees with naturality under the induced coefficient isomorphism.

### B5.6 Finite coefficients by a prime filtration

Prove `FourierJacobi.injective_of_finite`. If the prime-quotient geometric hypotheses hold for every
p, deduce FJ injectivity for every finitely generated R-module. Use the existing Noetherian
prime-filtration induction: zero coefficients, transport from a module linearly equivalent to R/p,
and propagation through a short exact coefficient sequence. Repeated prime factors, R/pⁿ and finite
nonfree projective coefficients are included. The prime filtration does not assert finite length,
and coefficient surjectivity is not section surjectivity.

*Hypotheses.* R is the indicated field or Dedekind domain, hence Noetherian. No
principal-ideal-domain or semilocal assumption is made. Use the existing Mathlib induction for any
commutative Noetherian R and Module.Finite R M. Its prime case is a finite module N together with a
linear equivalence to R/p, so preserve that form across module universes. No complete local
coefficient category is required.

*Source:* [StacksPrime], 00L0, Lemma 10.62.1; [LanPEL], 7.1.1.4 and the reduction in 7.1.2.14(1),
pp.532–533, 539–540; [MathlibPrime], IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime,
with its preceding RelSeries existence theorem, at the pinned Mathlib commit.

*Needs:* B5.4 (`FourierJacobi.injective_primeQuotient`); B5.5
(`FourierJacobi.injective_of_extension`); ShimuraCompactifications C5
(*hodge-line-fourier-jacobi-expansion*, `HodgeLineFJ`); Mathlib
`IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime`; Mathlib
`IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime`.
*Lean:* none; specified in the README only.

**Checks.**

- The filtration of Z/4 by 0, 2(Z/4), Z/4 has two Z/2 factors and must be accepted although Z/4 is
  nonreduced as a ring.
- A nonprincipal invertible ideal over a Dedekind ring is covered as a finite module without
  asserting that it is free.
- The zero module has the empty filtration and an injective expansion map.

### B5.7 Joint injectivity at a component-detecting collection of cusps

Prove `FourierJacobi.expansionPrinciple`. In Lan's setting choose finitely many nonempty strata
whose union meets every irreducible component of X. Use ShimuraCompactifications C5 to relate this
total-space hypothesis to the prime-quotient detection used above, including the needed non-neat
descent. Then FJ_I on AF(k,M) is injective for every R-module M. A section comes from a finitely
generated submodule N⊂M by qcqs section-colimit compatibility. Naturality and injection G(N)→G(M)
reduce its vanishing to the finite-coefficient theorem. There is no interchange of an infinite
coefficient product with a filtered colimit.

*Hypotheses.* The source's smooth proper good-prime PEL model, k nonnegative, and M an arbitrary
R-module. The finite collection is component-detecting in the source's sense. No claim is made that
any chosen single cusp detects all components. Use the actual qcqs stack section/filtered-colimit
comparison. No colimit theorem for the infinite Fourier-Jacobi coefficient product is assumed.

For an arbitrary M, lift a section to AF(k,N) for a finite submodule N. If its expansion becomes
zero over M, use the injective coefficient-family map G(N)→G(M) to make it zero over N and apply
finite-coefficient injectivity. Only the section functor commutes with this colimit; no
colimit/product identity is needed for G.

*Source:* [LanPEL], 7.1.2.14(1), proof, and the module reduction in 7.1.1.4, pp.532–533, 539–540;
[StacksColimit], 0GQZ, Lemma 103.13.5, G=O_X.

*Needs:* B5.6 (`FourierJacobi.injective_of_finite`); ShimuraCompactifications C5
(*hodge-line-fourier-jacobi-expansion*, `HodgeLineFJ`, *integral-toroidal-space*,
*formal-completion*); B5.3 (`FJCoefficient.invariantFamily_leftExact`); B4.20 (`integralForms`);
SchemeAndStackFoundations SF.1 (*stack-quasi-coherent*, *qcoh-fpqc-descent*); Mathlib `Module.Flat`
(tensoring with a flat module preserves injections); B4.1 (`classicalForms`); B4.19
(`qcqsSectionsColimit`).
*Lean:* none; specified in the README only.

**Checks.**

- On the disjoint union of two proper connected curves, expansion at a cusp on only one component
  does not detect a section supported on the other.
- The nonsplit prime-filtration step covers R/p^2; geometric pointwise vanishing alone does not.
- For M=R[1/p]/R, each finite set of elements lies in a finitely generated torsion submodule, so the
  same argument applies.
- Product/colimit warning: over a field, for M the direct sum of countably many copies of the field,
  the sequence of distinct basis vectors in the product M^N does not lie in N^N for any
  finite-dimensional submodule N. This rules out the unused interchange of these two operations.

### B5.8 Recognition of a coefficient submodule from expansions

Prove `FourierJacobi.coefficientRecognition`. For M₁⊂M and the same detecting cusps, a section in
AF(k,M) comes from AF(k,M₁) exactly when every chosen expansion lies in the corresponding image of
the invariant coefficient family with M₁ coefficients. Map the section to M/M₁, use naturality and
injectivity for that quotient, then the kernel/image equality of the AF row. The quotient need not
be finite or flat, so the arbitrary-coefficient theorem is essential.

*Hypotheses.* The standing good-prime PEL and component-detection hypotheses. Use the geometric
coefficient functors and the inclusion M1 into M; membership is in their images, not an informal
statement about scalar entries.

*Source:* [LanPEL], 7.1.2.14(2) and its exact-row diagram, pp.539–540.

*Needs:* B5.7 (`FourierJacobi.expansionPrinciple`); ShimuraCompactifications C5
(*hodge-line-fourier-jacobi-expansion*, `HodgeLineFJ`); B5.2
(`integralForms_coefficient_leftExact`); B5.3 (`FJCoefficient.invariantFamily_leftExact`).
*Lean:* none; specified in the README only.

**Checks.**

- For M1=M the conclusion is automatic.
- For M1=0 it reduces to joint injectivity.
- For M=R[1/p] and M1=R, the quotient is torsion: injectivity only for torsion-free coefficients is
  inadequate for this application.

### B5.9 Cuspidality from boundary restrictions

Prove `FourierJacobi.cusp_iff_boundaryRestriction`. For a neat smooth toroidal model with reduced
relative normal-crossings boundary D, suppose the boundary coefficient sequence remains exact after
tensoring with the chosen M. The image of Γ(X,ω_tor^k(−D)⊗_R M) consists exactly of sections
restricting to zero on D. If the boundary charts detect that restriction, this is equivalent to
vanishing of the required constant terms at all proper boundary labels. Over a nonreduced base
geometric-point vanishing is insufficient, and a single maximal-cusp constant term does not replace
all boundary restrictions.

*Hypotheses.* Neatness, smoothness and the stated relative normal-crossings boundary; use B3's
actual subcanonical extension. For nonflat M, retain the relative flatness/exactness checks of the
boundary sequence. No general-coarse-space vector-bundle claim is included.

*Source:* [LanIntro], 4.2.7, printed p. 50.

*Needs:* B4.20 (`integralForms`); ShimuraCompactifications C5
(*hodge-line-fourier-jacobi-expansion*, `HodgeLineFJ`, *integral-toroidal-space*,
*formal-completion*); ShimuraCompactifications C4 (*semi-abelian-scheme*,
*formal-universal-degeneration*); B3.4 (`subcanonicalExtension`); B4.2 (`cuspForms`).
*Lean:* none; specified in the README only.

**Checks.**

- On a one-variable formal chart, divisibility by q is equivalent to zero constant coefficient.
- A higher-dimensional boundary coefficient may be a nonzero form on a lower-dimensional boundary
  even when a scalar constant at a deeper cusp is zero.
- Koecher extension of sections does not force their boundary restriction to vanish.

### B5.10 Geometric Hecke operators on classical sections

Construct `ClassicalHecke.operator`. For an admissible prime-to-characteristic g let K_g=K∩gKg⁻¹ and
use X_K←p₁X_Kg→p₂X_K. On compatible toroidal refinements the actual coefficient realization gives
θ_g:p₂\*E→p₁\*E. Define H_g=tr_p₁ θ_g p₂\* on Γ(X_K,E⊗_R M), then T_g=ν(g)H_g for the specified
K-bi-invariant multiplicative unit-valued character ν. Trace is finite locally free trace
transported through the supplied toric-refinement comparison. Prove independence of representatives
and refinement, coefficient-map compatibility and preservation of subcanonical sections using the
reduced-boundary transport.

*Hypotheses.* Use actual bundle sections, including coefficients inside the sheaf; Γ(E)⊗M is not
substituted. p1 is finite locally free on a compatible intermediate model; a further fan refinement
can be proper rather than finite. Its coefficient-sensitive pushforward comparison is required. θ_g
uses the right-translation and isogeny convention; ν is part of the level/weight normalization, not
division by every correspondence degree.

*Source:* [LanPEL], 6.4.3.1–6.4.3.4, pp.527–530; [Diamond22], §6.1, weight/level pullback
convention, p.24; [BCGP], §1.8, pp.17–18.

The API:

- `ClassicalHecke.operator`: The R-linear composite ν(g)tr_p1 θ_g p2\* on the actual section module.
- `ClassicalHecke.operator_one`: The identity correspondence with ν(1)=1 acts as identity.
- `ClassicalHecke.coefficient_map`: An R-linear coefficient map M→N commutes with T_g, by
  coefficient-compatible pullback, trace and θ_g.
- `ClassicalHecke.refinement`: Transport across the B3 section comparison along a common fan
  refinement intertwines T_g, with identity and composition laws.

*Needs:* TauCetiRoadmap.AdelicAlgebraicGroups §4.5 (*Hecke correspondences*, `LevelMaps.hecke`,
*Degree of a Hecke correspondence*); B3.10 (`integralLeviCoefficient`); ShimuraCompactifications C3
(*coherent-cohomology-invariance*, *refinement-boundary-ideal*, *refinement-map*,
*choice-comparison*, *hecke-span*); B4.20 (`integralForms`); SchemeAndStackFoundations SF.1
(*stack-quasi-coherent*); Mathlib `Module.Flat` (tensoring with a flat module preserves injections);
Mathlib `Algebra.trace_algebraMap_of_basis`; B2.1 (`automorphicVectorBundle`); B2.8
(`coefficientTensorHecke`); B1.10 (`principalHeckePullback`); B3.2 (`canonicalExtension`); B3.4
(`subcanonicalExtension`); B3.6 (`fanIndependentSections`); B3.general.3
(`generalBoundaryFunctoriality`); B4.1 (`classicalForms`); B4.2 (`cuspForms`); B5.1
(`finiteLocallyFreeTrace`); B4.15 (`ramifiedHilbertLine`).
*Lean:* `ClassicalHecke.modularNormalization` (the weight-zero value `(ℓ + 1)/ℓ`); the operator is
specified in the README only.

**Checks.**

- `ClassicalHecke.identity` (degenerate): The identity correspondence acts as identity on canonical
  and subcanonical sections.
- `ClassicalHecke.weightZeroTrace` (computation): For a finite-free degree-d chart and the trivial
  bundle, the raw operator on 1 is d, not 1; the normalized value is ν(g)d.
- `ClassicalHecke.modularNormalization` (compatibility): Over C, after the imported modular
  comparison and correct coset orientation, GL2 det⁻¹-scaled isogeny pull-identify-trace agrees with
  the existing HeckeRing.GL2.heckeRingHomCharSpace action; at an unramified prime its coefficients
  have the character-weighted ℓ^(k−1) term.

### B5.11 Convolution law for the geometric Hecke action

Prove `ClassicalHecke.convolution`. With these correspondence, coefficient-cocycle,
trace/base-change and multiplicative-normalization hypotheses, extend [KgK]↦T_g to a unital ring
homomorphism from the existing integral Hecke ring to End_R Γ(X_K,E⊗_R M). Its action restricts to
cusp sections. Compare the inverse/right-coset orientation with HeckeCosetModule convolution and
retain the integer multiplicities from the correspondence decomposition.

*Hypotheses.* Require the full double-coset fibre-product/Mackey decomposition, not a false
Cartesian square for an arbitrary normal finer level. Coefficient traces satisfy composition and
finite-flat base change; normalization ν is multiplicative and bi-K-invariant.

*Source:* [BCGP], §1.8, Hecke conventions, pp.17–18; [Diamond22], §6.1, p.24.

*Needs:* B5.10 (`ClassicalHecke.operator`); TauCetiRoadmap.AdelicAlgebraicGroups §4.5 (*Cartesian
squares of level maps*, with its hypothesis `U′L = U`); Tau Ceti
`HeckeCosetModule.instRingHeckeRing`; Tau Ceti `HeckeRing.GL2.heckeRingHomCharSpace`;
SchemeAndStackFoundations SF.1 (*stack-quasi-coherent*); Mathlib `Module.Flat` (tensoring with a
flat module preserves injections); B5.1 (`finiteLocallyFreeTrace`).
*Lean:* none; specified in the README only.

**Checks.**

- The identity coset maps to identity and a sum maps to the sum of operators.
- In the good GL2 prime case the transported formula recovers the existing analytic convolution
  action, including its character term.
- A normalization chosen by dividing each coset by its degree need not be a multiplicative
  character; the construction does not silently permit it.

### B5.12 Hecke action at non-neat level

Prove `ClassicalHecke.nonNeatDescent`. For a normal neat K′⊲K with finite quotient Γ, identify
sections of the actual equivariant coefficient on [X_K′/Γ] with Γ(X_K′,E⊗_R M)^Γ. Construct the
K-Hecke action on this equalizer using the K_g correspondence and common neat covers of both legs.
Prove stability, independence of cover and agreement with stack pull-identify-trace. The AA.4
Cartesian comparison requires its U′L=U hypothesis; normality of a chosen cover alone does not
supply that square or its double coset.

*Hypotheses.* The quotient means the stack with its bundle action; no coarse-space vector bundle
descent is assumed. No inversion of |Γ| is required for the equalizer. Hecke compatibility uses the
refined correspondence and Mackey sum, not restriction of a single K′-double-coset operator.

*Source:* [Diamond22], §6.1, non-small U and normal fine U′, p.24; §6.2, normal-level invariants
argument immediately before Proposition 6.2.1, p.25; [LanPEL], 7.1.2.6–7.1.2.8, pp.536–537.

*Needs:* B5.10 (`ClassicalHecke.operator`); B5.11 (`ClassicalHecke.convolution`);
TauCetiRoadmap.AdelicAlgebraicGroups §4.5 (*Cartesian squares of level maps*, with its hypothesis
`U′L = U`); SchemeAndStackFoundations SF.1 (*qcoh-fpqc-descent*, *stack-quasi-coherent*);
ShimuraCompactifications C3 (*refinement-map*, *choice-comparison*, *refinement-boundary-ideal*,
*coherent-cohomology-invariance*).
*Lean:* none; specified in the README only.

**Checks.**

- For the trivial action of C_p on F_p, invariants are F_p, while the group sum is zero.
- For the unipotent C_p action on F_p², taking invariants does not preserve the surjection to the
  second-coordinate quotient. The proof uses only the equalizer, not exactness of invariants.
- Do not assume K′∩K_g=K′∩gK′g⁻¹; AA.4’s Cartesian theorem requires its additional product
  condition.

### B5.13 Tate and analytic q-expansion comparison

Prove `FourierJacobi.modular_qExpansion_comparison`. Specialize rank-one FJ to R15.1's Tate
q-expansion and its analytic comparison with UpperHalfPlane.qExpansion h at q=exp(2πiτ/h), using the
same differential frame. At full level n≥3 the family of AlgebraicModularFormsAndSerreWeights R15.1
is Tate(qⁿ) over ℤ[1/n,ζ_n][[q]], with Kodaira–Spencer sending the square of the invariant
differential to n dq/q. Import the all-component integral principle, cusp exact sequence and
geometric modular Hecke operators from R15.2. Compare their normalization with the existing analytic
Hecke action.

*Hypotheses.* Match the selected cusp, width h>0 in the actual subgroup strict periods, roots of
unity and descent data. Levels 1 and 2 use the stack or rigidifying-cover descent of R15.1. One
infinity constant detects cuspidality only in the full modular group case already proved in Mathlib.

*Source:* [LanPEL], 7.1.2.1–7.1.2.4, pp.534–535; [LanIntro], §4.2.7, pp.49–50.

*Needs:* ShimuraCompactifications C5 (*hodge-line-fourier-jacobi-expansion*, `HodgeLineFJ`); B5.10
(`ClassicalHecke.operator`); AlgebraicModularFormsAndSerreWeights R15.1 (*Geometric modular forms*,
*All-weight analytic comparison*); AlgebraicModularFormsAndSerreWeights R15.2 (*The q-expansion
principle*, *Integral geometric Hecke operators*, *The equivariant cuspidal sequence*); Mathlib
`UpperHalfPlane.qExpansion`; Mathlib `ModularForm.qExpansion_injective`; Mathlib
`ModularForm.isCuspForm_iff_coeffZero_eq_zero`; Tau Ceti `HeckeRing.GL2.heckeRingHomCharSpace`;
TauCetiRoadmap.ModularForms Layer 2 (`heckeRingHomCharSpace`).
*Lean:* none; specified in the README only.

**Checks.**

- Retain n dq/q at Tate(q^n); replacing du/u with a base differential loses the convention.
- The local monomial q^r(du/u)^k has coefficient 1 in degree r and 0 elsewhere; this is a local
  chart test, not a global existence claim.
- Import the modular principle for one cusp per component and all-cusp cuspidality; analytic
  injection alone supplies neither statement over torsion coefficients.

### B5.14 Fourier–Jacobi expansion with vector coefficients

Construct `VectorFourierJacobi.expansion`. On Lan's neat good-prime PEL model over a Noetherian
allowed coefficient algebra R, let W be a finite projective representation of the actual Levi.
Import Ecan(W) and its boundary pullback identification with a locally free E₀(W) on the abelian
torsor C. For any M define degree-ℓ coefficients Γ(C,Ψ(ℓ)⊗E₀(W)⊗_R M) and extract them by completed
restriction. Keep the completion support and full stabilizer transports before taking invariants. In
general characteristic zero require C3.general's proven mixed-boundary/coefficient comparison; Milne
VII Conjecture 4.1 is not that proof. The boundary filtration on C need not descend to its
stabilizer quotient.

*Hypotheses.* The PEL bundle W is finite projective and the fan smooth/projective as in Lan Higher
§2; arbitrary infinite-dimensional or p-adic analytic representations are not included. The
degree-zero coefficient module is Γ(C,Ψ(ell)⊗E0⊗M). Definition 5.10 also treats higher cohomology,
which is not replaced here by a degree-zero product. E0’s filtration is on C. Its graded pieces
descend locally over the lower base, but the whole filtration need not descend through the
stabilizer quotient.

*Source:* [LanHigher], Author-hosted preprint, Proposition 5.6 and proof, pp.11–13; Remark 5.7,
p.13; [LanHigher], Author-hosted preprint, Corollaries 5.8–5.9 and Definition 5.10, p.13; [Milne90],
VII.4, Conjecture 4.1, p.102.

The API:

- `VectorFourierJacobi.expansion`: Given the actual finite-projective representation bundle and its
  completed boundary identification, return the R-linear vector expansion into the full-stabilizer
  invariant family of sections of Ψ(ell) tensor E0(W) tensor_R M.
- `VectorFourierJacobi.coefficient`: Extract the degree-ell section of Ψ(ell)⊗E0(W)⊗M from the
  completed boundary restriction.
- `VectorFourierJacobi.coefficient_map`: An equivariant R-linear representation map W→W′ and a
  coefficient map M→M′ induce commuting degreewise maps, respecting identities and composition.
- `VectorFourierJacobi.transport`: A cusp transport moves the lattice degree, Ψ and E0 together and
  intertwines extraction.
- `VectorFourierJacobi.determinant`: The determinant-Hodge representation specializes to the scalar
  FJ map, under B3’s supplied boundary bundle isomorphism.
- `VectorFourierJacobi.refinement`: The canonical section comparison for a common fan refinement
  intertwines vector expansions and has its cocycle law.

*Needs:* ShimuraCompactifications C5 (*hodge-line-fourier-jacobi-expansion*, `HodgeLineFJ`); B3.10
(`integralLeviCoefficient`); ShimuraCompactifications C3 (*coherent-cohomology-invariance*,
*refinement-boundary-ideal*); B4.20 (`integralForms`); ShimuraCompactifications C3.general
(*general-map-descent*); ShimuraCompactifications C4 (*semi-abelian-scheme*,
*formal-universal-degeneration*); B2.1 (`automorphicVectorBundle`); B2.3
(`leviHighestWeightConvention`); B3.2 (`canonicalExtension`); B3.1 (`boundaryCoefficientChart`);
B3.general.1 (`generalCanonicalExtension`); B4.1 (`classicalForms`).
*Lean:* none; specified in the README only.

**Checks.**

- `VectorFourierJacobi.zeroRepresentation` (degenerate): For W=0 or M=0 every coefficient and
  expansion is zero.
- `VectorFourierJacobi.rankTwoMonomial` (computation): On a trivial rank-two local coefficient
  bundle and rank-one chart, q^n(v1,v2) has vector coefficient (v1,v2) at n and zero at other
  degrees.
- `VectorFourierJacobi.scalarSpecialization` (compatibility): For the determinant-Hodge
  representation giving ω^k the expansion equals the scalar map after the actual boundary-line
  identification.
- `VectorFourierJacobi.notFiniteSupport` (non-example): on the rank-one formal chart `R[[q]]` over a
  nonzero ring, `(1 − q)⁻¹` has coefficient `1` in every degree; a coefficient target with finite
  support loses valid completed sections.
- `VectorFourierJacobi.commonCompletion` (non-example): on an affine toric surface the origin
  completion of `k[x, y]` is `k[[x, y]]` and the completion of the face chart `D(y)` along `x = 0`
  is `k[y, y⁻¹][[x]]`; no ring map between them extends the face immersion, since `1 − y` is a unit
  in `k[[x, y]]` but its constant coefficient is not a unit in `k[y, y⁻¹]`. Cone expansions are
  compared through the common boundary completion and its maps to the stratum completions.
- `VectorFourierJacobi.noAveraging` (non-example): for the trivial action of the cyclic group of
  order `p` on `𝔽_p` the invariants are all of `𝔽_p`; a construction that multiplies by the group
  sum or divides by `p` does not give the invariant coefficient family.

### B5.15 Expansion principle for locally free automorphic coefficients

Prove `VectorFourierJacobi.expansionPrinciple`. Let R be Noetherian and X qcqs smooth over R in the
supplied setup. Require finite-rank locally free Ecan, R-flat abelian-torsor charts with locally
free E₀, the actual formal graded comparison/descent, and finitely many strata meeting every
irreducible component of X_(R/p) for each prime p. Then joint vector FJ is injective for every
R-module M and recognizes images from M₁⊂M. Its boundary-zero criterion identifies Esub sections
when the relative boundary tensor sequence is exact. Use prime filtrations, the two left-exact rows
and qcqs colimits as in the scalar proof.

*Hypotheses.* The component condition is fibrewise after every prime reduction, including the zero
prime when present; total-model density alone is not used as this hypothesis. Use the sheaf colimit
theorem on qcqs stacks via SF.1, or schemes at neat level. Products of coefficient modules are not
asserted to commute with filtered colimits. This is a derived vector-bundle extension of Lan’s
scalar argument, with the formal identification from Higher Koecher’s principle; it is not claimed
as a literal statement of either paper.

*Source:* [LanPEL], Proposition 7.1.2.14, pp.539–540; [LanHigher], Author-hosted preprint,
Proposition 5.6, p.11.

*Needs:* B5.14 (`VectorFourierJacobi.expansion`); ShimuraCompactifications C5
(*hodge-line-fourier-jacobi-expansion*, `HodgeLineFJ`); B5.2
(`integralForms_coefficient_leftExact`); B5.3 (`FJCoefficient.invariantFamily_leftExact`); B5.6
(`FourierJacobi.injective_of_finite`); B5.8 (`FourierJacobi.coefficientRecognition`); B5.9
(`FourierJacobi.cusp_iff_boundaryRestriction`); AdicSpacesPartII F0 (sections near a closed subset,
after EGA I (10.8.11)); SchemeAndStackFoundations SF.1 (*qcoh-fpqc-descent*,
*stack-quasi-coherent*); ShimuraCompactifications C3 (*coherent-cohomology-invariance*,
*refinement-boundary-ideal*); B3.10 (`integralLeviCoefficient`); B4.20 (`integralForms`); B3.2
(`canonicalExtension`); B3.4 (`subcanonicalExtension`); B4.1 (`classicalForms`); B4.2 (`cuspForms`);
B4.19 (`qcqsSectionsColimit`).
*Lean:* none; specified in the README only.

**Checks.**

- W=det^k recovers the scalar principle with the same component and coefficient hypotheses.
- A rank-two direct sum is detected component by component; the theorem does not collapse
  coefficients to a scalar.
- The nonsplit Z/4 extension is included. The Iwahori Hilbert special fibre with a component
  disjoint from all cusps fails the required hypothesis.

### B5.16 Hilbert cusp q-expansions and coefficient lines

**Gap.** The ramified boundary geometry specified above is not supplied by the cited C6 targets.

Construct `HilbertQExpansion.map`. Let F≠ℚ be totally real, p possibly ramified, O the valuation
ring of a sufficiently large p-adic field with embedding set Θ, and U=U^p GL₂(O_F,p). For a
Noetherian O-algebra R and integer vectors (k,m), require χ_(k+2m),R to be trivial on O_F×∩U. Use
the actual ramified splitting-model line A_(k,m) and M_(k,m)(U;R)=Γ(Y,A)=Γ(Ymin,j_\*A). For cusp
data 0→I→H→J→0 with polarization and level, set Λ=d_F⁻¹I⁻¹J. Choose fine prime-to-p N≥3, ζ_N∈O and a
splitting of H. Its coefficient line is D_(k,m),c=⊗_θ(I⁻¹)_θ^{kθ}⊗(d_F(IJ)⁻¹)_θ^{mθ}. Define the
expansion into completed line-valued series indexed by N⁻¹Λ_+∪{0}; prove splitting, representative
and fine-level transport with the actual unit action. The minimal pushforward need not be locally
free.

*Hypotheses.* All the weight, level and trivial-unit-character conditions are part of the
definition; p=2 and ramified p are not discarded. The ramified Pappas–Rapoport splitting model and
its automorphic line are HilbertModularVarietiesAndShimuraCurves H2 and B4.15, and the Hilbert cusp
geometry is ShimuraCompactifications C6. The series includes zero and totally positive degrees in
the stated fractional lattice; the coefficient line and unit action cannot be replaced by a naked
scalar monoid algebra.

*Source:* [Diamond22], §6.1 and §6.2, pp.24–25.

The API:

- `HilbertQExpansion.map`: The R-linear formal restriction q_c into the coefficient-line series in
  the specified fractional positive lattice.
- `HilbertQExpansion.coeff`: Extract the D_c⊗R coefficient of t∈N⁻¹Λ_+∪{0}, including zero.
- `HilbertQExpansion.transport`: The canonical lattice/line isomorphism for a cusp representative or
  splitting change intertwines the transformed series; transports compose.
- `HilbertQExpansion.coefficient_map`: A Noetherian O-algebra map R→R′ commutes with each
  coefficient after base change of the actual form.
- `HilbertQExpansion.fineLevel`: Restriction to a fine U(N) and any cusp above c gives the same
  expansion after the canonical line/lattice identifications.

*Needs:* B5.14 (`VectorFourierJacobi.expansion`); HilbertModularVarietiesAndShimuraCurves H2
(ramified Pappas–Rapoport splitting models and the Rapoport locus);
HilbertModularVarietiesAndShimuraCurves H3 (cusp representatives, polarization and unit quotients);
ShimuraCompactifications C6 (*hilbert-toroidal-model*, *hilbert-boundary-formal-comparison*,
*hilbert-minimal-formal-comparison*); B3.10 (`integralLeviCoefficient`); ShimuraCompactifications C3
(*coherent-cohomology-invariance*, *refinement-boundary-ideal*); B4.20 (`integralForms`); B2.1
(`automorphicVectorBundle`); B3.2 (`canonicalExtension`); B3.8 (`minimalCoherentPushforward`); B4.11
(`HilbertArithmeticWeight`); B4.12 (`hilbertCoefficient`); B4.14 (`unsplitHilbertDescent`); B4.13
(`hilbertCentralDescent`); B4.15 (`ramifiedHilbertLine`).
*Lean:* none; specified in the README only.

**Checks.**

- `HilbertQExpansion.zero` (degenerate): The zero form has zero coefficient in every degree; over
  the zero coefficient ring all forms and coefficients vanish.
- `HilbertQExpansion.localMonomial` (computation): On a chosen formal cusp chart and
  coefficient-line trivialization, q^t d has coefficient d at t and zero elsewhere; no global form
  or unit invariance of this local monomial is asserted.
- `HilbertQExpansion.unitTransport` (non-example): A family supported at a positive t moved to a
  different degree by a cusp unit, with nonzero coefficient only at t, is not invariant unless its
  full transported orbit satisfies the unit relation. It cannot be declared the expansion of a
  descended form.

### B5.17 Hilbert q-expansion principle

**Gap.** The ramified boundary geometry specified above is not supplied by the cited C6 targets.

Prove `HilbertQExpansion.expansionPrinciple`. In this prime-to-p Hilbert setting, take cusps S
meeting every connected component of Ymin, equivalently surjecting onto F_+×\A_F,f×/det(U).
Diamond's q_S is injective. For a Noetherian O-subalgebra R′⊂R, coefficients in D_c⊗_O R′ at every
c∈S recognize a form over R′. Require the ramified formal-chart and component/fibre comparison from
C6/H2/H3. For general U descend from a normal fine cover by invariants. General Iwahori special
fibres can have irreducible components without cusps, so this detection principle does not extend to
them.

*Hypotheses.* Retain the weight/unit condition over both rings and the exact prime-to-p level U. The
determinant surjectivity is the source’s component condition, not merely the choice of one
representative in a polarization class. Before importing the vector proof at torsion R, C6 must
supply the actual fibrewise detection argument; it remains an explicit input rather than an inferred
smoothness claim for every ramified integral model.

*Source:* [Diamond22], Proposition 6.2.1 and following Iwahori warning, p.25.

*Needs:* B5.16 (`HilbertQExpansion.map`); B5.15 (`VectorFourierJacobi.expansionPrinciple`); B5.8
(`FourierJacobi.coefficientRecognition`); ShimuraCompactifications C6 (*hilbert-toroidal-model*,
*hilbert-boundary-formal-comparison*, *hilbert-minimal-formal-comparison*);
HilbertModularVarietiesAndShimuraCurves H2 (ramified Pappas–Rapoport splitting models and the
Rapoport locus); HilbertModularVarietiesAndShimuraCurves H3 (cusp representatives, polarization and
unit quotients); SchemeAndStackFoundations SF.1 (*qcoh-fpqc-descent*, *stack-quasi-coherent*).
*Lean:* none; specified in the README only.

**Checks.**

- A set of infinity cusps covering the determinant classes gives an injective map.
- Coefficients in R′=O inside its fraction field detect the corresponding integral form in the
  stated setup.
- For U0(P) the source explicitly warns that components may contain no cusp, so the same criterion
  is not available.

### B5.18 Hilbert cusp forms and all cusp constants

**Gap.** The ramified boundary geometry specified above is not supplied by the cited C6 targets.

Prove `HilbertQExpansion.cusp_iff_constantTerms`. Define the Hilbert cusp space as the kernel of the
product of constant-term maps over all cusps, with each constant in its actual line D_c⊗_O R and
cusp-unit invariants. Under the canonical/subcanonical comparison and exact boundary tensor sequence
this equals the image of Γ(Ytor,A_(k,m)(−D)⊗_O R). Constants are independent of the splitting. In
§6.3's characteristic-zero or O-flat setting a nonparallel pair (kθ,mθ) has zero invariant constants
and every form is cuspidal; no such assertion is made for arbitrary torsion coefficients.

*Hypotheses.* Use every required boundary component and its unit/line action. One infinity
coefficient at arbitrary level is insufficient. B3/C6 supply the precise Hilbert boundary ideal and
tensor exactness, including the ramified model; Koecher extension does not replace the cusp ideal.

*Source:* [Diamond22], §6.3, p.26.

*Needs:* B5.16 (`HilbertQExpansion.map`); ShimuraCompactifications C5
(*hodge-line-fourier-jacobi-expansion*, `HodgeLineFJ`); B5.9
(`FourierJacobi.cusp_iff_boundaryRestriction`); ShimuraCompactifications C3
(*coherent-cohomology-invariance*, *refinement-boundary-ideal*); B3.10 (`integralLeviCoefficient`);
ShimuraCompactifications C6 (*hilbert-toroidal-model*, *hilbert-boundary-formal-comparison*,
*hilbert-minimal-formal-comparison*); B3.4 (`subcanonicalExtension`); B4.15 (`ramifiedHilbertLine`).
*Lean:* none; specified in the README only.

**Checks.**

- At all cusps a local q^t d with t strictly positive has zero constant; a local constant d has its
  actual D_c value.
- The source’s nonparallel flat-coefficient case makes the cusp and full section spaces equal;
  torsion coefficients require rechecking the character ideal.
- No automatic cusp assertion follows merely because the Hilbert minimal boundary has codimension
  greater than one.

### B5.19 Hecke action on Fourier–Jacobi coefficients

**Gap.** The ramified Hilbert specialization needs the missing boundary geometry specified above.

Prove `ClassicalHecke.expansion_compat`. Complete the actual Hecke correspondence at its cusps and
define the coefficient operator H_g^FJ by its lattice transport, coefficient-bundle identification
and finite trace. Prove FJ∘T_g=ν(g)H_g^FJ∘FJ, compatible with coefficient change and refinement. At
a good modular ℓ∤N this becomes b_n=a_(ℓn)+χ(ℓ)ℓ^(k−1)a_(n/ℓ), including n=0 and with the second
coefficient zero if ℓ∤n. In Diamond's normalized Hilbert coefficients, for v∤np use r_m^t(T_v
f)=r_m^(ϖ_v t)(f)+Nm(v)r_m^(ϖ_v⁻¹t)(S_v f); for U₁(n) and v|n omit the second term. Keep the
coefficient-line/χ_m normalization and actual central correspondence S_v.

*Hypotheses.* Require formal trace/base-change and actual degree/cusp maps from C3/C4; ordinary
toric inclusions alone do not give them. The modular geometric normalization requires ℓ invertible
and the source’s good-prime hypotheses. Diamond’s displayed formulas use primes outside p; no saving
trace or U_p at p is inferred. Retain the different cusp/component t in the Hilbert formula and its
character normalization.

*Source:* [Diamond22], Proposition 6.5.1, equation (6.1) and Remark 6.5.2, pp.27–29; [LanPEL],
5.4.3.8–5.4.3.10 and 6.4.3, pp.438–439 and 527–530.

*Needs:* B5.10 (`ClassicalHecke.operator`); B5.12 (`ClassicalHecke.nonNeatDescent`); B5.13
(`FourierJacobi.modular_qExpansion_comparison`); B5.16 (`HilbertQExpansion.map`); B5.14
(`VectorFourierJacobi.expansion`); ShimuraCompactifications C3 (*refinement-map*,
*choice-comparison*, *refinement-boundary-ideal*, *coherent-cohomology-invariance*);
ShimuraCompactifications C4 (*semi-abelian-scheme*, *formal-universal-degeneration*);
ShimuraCompactifications C6 (*hilbert-toroidal-model*, *hilbert-boundary-formal-comparison*,
*hilbert-minimal-formal-comparison*); AlgebraicModularFormsAndSerreWeights R15.2 (*Integral
geometric Hecke operators*); Tau Ceti `HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime`.
*Lean:* none; specified in the README only.

**Checks.**

- For a local modular sequence supported in degree r and n not divisible by ℓ, only the a_(ℓn) term
  contributes; when ℓ|n the second term has χ(ℓ)ℓ^(k−1).
- At n=0 the good modular operator gives (1+χ(ℓ)ℓ^(k−1))a_0; this also tests the normalization on
  constant weight-zero forms.
- Over R/p² at ℓ≠p, coefficient change and the normalized operator commute; reduction at p does not
  erase a missing integral trace construction.
- Higher-rank coefficients move through abelian-torsor sections, rather than being scalar Fourier
  coefficients.

### B5.20 Classical algebraic bundles in the Hodge–Tate coefficient functor

**Gap.** The comparison prerequisites below are missing from the build; this target is conditional.

Prove `SiegelHT.classicalVB_equivariance`. Import B4's μ-normalized classical VB⁰ identification for
finite-dimensional algebraic M-dominant L_κ, neat tame K^p and a sufficiently large p-adic field E.
Compare coherent level cohomology with colim_{K_p}RΓ(X_KpK^p,ω^κ_Kp), a complex of smooth admissible
G(ℚ_p)-representations, with the corresponding normalization. Give the subcanonical version using
the actual boundary ideal, and compatibility with level maps, prime-to-p Hecke maps and fan changes
through common refinements. For GSp₄ the (1,0;−1) check gives ω_A(−1)⊗O^sm. The `VB` functor and its
finite-dimensional descent are those of `HodgeTateVBInput`.

*Hypotheses.* The bundle is finite-dimensional and algebraic, not a locally analytic Coleman
coefficient. Retain the μ normalization; §4.8 uses untwisted coherent bundles and applies its Tate
twists separately. The `VB` functor is the one of `HodgeTateVBInput`.

*Assumes:* `HodgeTateVBInput`, `LogHodgeTateInput` (*Missing comparison prerequisites*).

*Source:* [BCGP], §§4.6.1–4.6.2, pp.81–82; §§4.5.17–4.5.22 for refinement context.

*Needs:* the input `LogHodgeTateInput`; SchemeAndStackFoundations SF.2
(*qcoh-higher-direct-images*); ShimuraCompactifications C3.general (*general-map-descent*); B5.10
(`ClassicalHecke.operator`); B1.6 (`hodgeCanonicalPrincipalBundle`); B1.10
(`principalHeckePullback`); B2.1 (`automorphicVectorBundle`); B2.3 (`leviHighestWeightConvention`);
B3.2 (`canonicalExtension`); B3.4 (`subcanonicalExtension`); B3.6 (`fanIndependentSections`);
B3.general.3 (`generalBoundaryFunctoriality`); B4.21 (`classicalVBTateNormalization`); the input
`HodgeTateVBInput`.
*Lean:* none; specified in the README only.

**Checks.**

- The (1,0;−1) coefficient is ω_A(−1), not untwisted ω_A.
- At κ=0 the actual constant coefficient matches the classical structure sheaf with its supplied
  normalization.
- The cusp comparison uses ω_Kp^κ(−D_Kp) on every finite model and compatible boundary pullback, not
  ordinary Γ on the open Shimura variety.

### B5.21 Classical Siegel Hodge–Tate decomposition

**Gap.** The comparison prerequisites below are missing from the build; this target is conditional.

Prove `SiegelHT.decomposition`. For BCGP's finite-level GSp₄ toroidal model, take an integral
dominant κ=(k₁,k₂;w) with 0≥k₁≥k₂ and k₁+k₂+w even. Let V_κ∨ be the actual canonical
pro-Kummer-étale coefficient. With the untwisted coherent convention of §4.8 put λ₀=(k₁,k₂;−w),
λ₁=(2−k₁,k₂;−w), λ₂=(3−k₂,k₁+1;−w), λ₃=(3−k₂,3−k₁;−w), and 2a₀=k₁+k₂+w, 2a₁=2−k₁+k₂+w,
2a₂=4−k₂+k₁+w, 2a₃=6−k₁−k₂+w. For i≥0 specify the G_ℚp×T_KpK^p-equivariant comparison Hⁱ(X,V_κ∨)⊗_ℚp
C_p≃⊕_{j=0}³H^(i−j)(X,ω^λj)(−a_j), with negative coherent degrees zero. Use the
logarithmic/pro-Kummer cohomology in the source, its actual comparison and dual BGG/Kostant inputs;
a spectral sequence alone does not establish the displayed decomposition.

*Hypotheses.* Keep all four weights, central weight −w, shifts i−j and separate Tate twists −a_j.
Parity makes every a_j integral. Use `LogHodgeTateInput` for the canonical local system and its
logarithmic comparison and `DualBGGInput` for the dual BGG/Kostant identification; the degeneration
and Hecke compatibility of the theorem that BCGP attribute to Faltings–Chai are part of these
inputs.

For κ=0 the four λ_j are (0,0;0), (2,0;0), (3,1;0), (3,3;0) and a_j=0,1,2,3. At i=0 only the j=0
term can survive. The parity test excludes (0,0;1), so half-weight division is exact integer
division only under the hypothesis. `LogHodgeTateInput` supplies the logarithmic cohomology;
`DualBGGInput` and the comparison attributed by BCGP to Faltings–Chai Theorem 6.2 supply the
decomposition. This finite-level comparison can be constructed directly from the classical
logarithmic comparison and dual BGG complex; it does not require the perfectoid `VB` functor
of B5.20.

*Assumes:* `LogHodgeTateInput`, `DualBGGInput` (*Missing comparison prerequisites*).

*Source:* [BCGP], §4.8.1 and Theorem 4.8.2, pp.101–102; [FC90], VI §6, Theorem 6.2(i),
p.241 (the classical `p`-adic comparison), and VI §5, Theorem 5.5(i), pp.233–234
(dual BGG degeneration).

*Needs:* the input `LogHodgeTateInput`; SchemeAndStackFoundations SF.2
(*qcoh-higher-direct-images*); B5.11
(`ClassicalHecke.convolution`); B1.6 (`hodgeCanonicalPrincipalBundle`); B2.5
(`etaleCoefficientLocalSystem`); B2.3 (`leviHighestWeightConvention`); B3.2 (`canonicalExtension`);
B4.16 (`siegelCoefficient`); the input `DualBGGInput`.
*Lean:* `SiegelHT.coherentWeights`, `SiegelHT.twiceTateExponents`,
`SiegelHT.twiceTateExponents_even` (the weight data of the decomposition); the comparison itself is
specified in the README only.

**Checks.**

- `SiegelHT.weights_zero` (computation): for `κ = 0` the coherent weights are `(0,0;0)`, `(2,0;0)`,
  `(3,1;0)`, `(3,3;0)` and the doubled Tate exponents `0, 2, 4, 6`.
- `SiegelHT.parity` (non-example): `(0, 0; 1)` fails the parity condition and its first doubled
  exponent is odd, so halving it is not integer division.
- `SiegelHT.weights_nonzero` (computation): for `κ = (0,−2;2)`, the coherent weights are
  `(0,−2;−2)`, `(2,−2;−2)`, `(5,1;−2)`, `(5,3;−2)` and doubled exponents `0,2,8,10`.
  This tests the sign of the central weight and distinguishes the four Weyl terms away from zero.

- At κ=(0,0;0), λj=(0,0;0),(2,0;0),(3,1;0),(3,3;0) and a_j=0,1,2,3.
- At i=0 only the j=0 summand can survive; negative coherent degree is zero.
- For κ=(0,0;1), parity fails and the integral GSp4 representation in this convention is
  unavailable; a formula using integer truncation of half-weights is rejected.

### B5.22 Compact-support Siegel Hodge–Tate decomposition

**Gap.** The comparison prerequisites below are missing from the build; this target is conditional.

Prove `SiegelHT.decomposition_compactSupport`. For exactly the datum, integral weight, coefficient
and Tate convention of B5.21, specify H_cⁱ(X,V_κ∨)⊗_ℚp C_p≃⊕_{j=0}³H^(i−j)(X,ω^λj(−D))(−a_j),
equivariantly for G_ℚp×T_KpK^p. Here D is the actual reduced toroidal boundary and H_c the supplied
compact-support logarithmic/étale theory. Its boundary comparison and duality are separate
prerequisites; ordinary cohomology and degree-zero constant-term vanishing alone do not imply this
formula.

*Hypotheses.* Use the same four λ_j and a_j, all component boundary ideals and compact-support
functoriality. The boundary and logarithmic compact-support comparison and duality are part of
`LogHodgeTateInput`. It is not a formal consequence of degree-zero cuspidality or of the ordinary
decomposition.

*Assumes:* `LogHodgeTateInput`, `DualBGGInput` (*Missing comparison prerequisites*).

*Source:* [BCGP], Theorem 4.8.2, compact-support display, pp.101–102; [FC90], VI §6,
Theorem 6.2(i), p.241, and VI §5, Proposition 5.4(2) and Theorem 5.5(ii), pp.233–234
(boundary ideal and compact-support dual BGG degeneration).

*Needs:* the input `LogHodgeTateInput`; SchemeAndStackFoundations SF.2
(*qcoh-higher-direct-images*); B5.11
(`ClassicalHecke.convolution`); B5.21 (`SiegelHT.decomposition`); B5.9
(`FourierJacobi.cusp_iff_boundaryRestriction`); B1.6 (`hodgeCanonicalPrincipalBundle`); B2.5
(`etaleCoefficientLocalSystem`); B2.3 (`leviHighestWeightConvention`); B3.2 (`canonicalExtension`);
B3.4 (`subcanonicalExtension`); B4.16 (`siegelCoefficient`); B4.2 (`cuspForms`); the input
`DualBGGInput`.
*Lean:* the weight data `SiegelHT.coherentWeights` and `SiegelHT.twiceTateExponents`; the comparison
itself is specified in the README only.

**Checks.**

- At κ=0 the four coherent terms have twists −D and Tate shifts 0,−1,−2,−3, with their degree shifts
  retained.
- When D is empty the boundary twist is identity and the proper compact-support theory agrees with
  the ordinary one under the supplier comparison.
- When D is nonempty, silently using ω^λ in place of ω^λ(−D) fails the cusp-coefficient convention.

### Examples

- The formal series `(1 − q)⁻¹` has coefficient `1` in every degree over a nonzero ring; a
  finite-support coefficient target loses valid completed sections (B5.14).
- Over `ℤ/4` reduction to `ℤ/2` is not injective and `2` is a nonzero nilpotent; the expansion proof
  uses both terms of an extension rather than testing residue fields only (B5.5).
- For the shear action of `C₂` on `(ℤ/2)²` the second-coordinate quotient is onto before invariants
  and not after; only left exactness of invariants is used (B5.3).
- In the Siegel comparison `κ = 0` gives coherent weights `(0,0;0)`, `(2,0;0)`, `(3,1;0)`,
  `(3,3;0)`, Tate twists `0, −1, −2, −3` and coherent degrees `i, i−1, i−2, i−3`; every compactly
  supported term additionally carries the twist by `−D`, and the weight `(0,0;1)` fails the parity
  condition (B5.21).
- At a good prime `ℓ ∤ N` the modular Hecke operator acts on expansions by
  `b_n = a_{ℓn} + χ(ℓ) ℓ^{k−1} a_{n/ℓ}`, with the second term zero when `ℓ ∤ n` (B5.19).

### Dependencies

Layers B0–B4; ShimuraCompactifications C0–C6; AdelicAlgebraicGroups §4.5; AdicSpacesPartII F0;
SchemeAndStackFoundations SF.1, SF.2; AlgebraicModularFormsAndSerreWeights R15.1–R15.2;
HilbertModularVarietiesAndShimuraCurves H2, H3; Tau Ceti Hecke rings; the inputs `HodgeTateVBInput`,
`LogHodgeTateInput`, `DualBGGInput`.

## Worked examples

- For `GL₂`, the tautological compact-dual line has degree `−1`, while the cohomological modular
  Hodge coefficient of weight `k` is `ω^k`. The coefficient/dual comparison determines the sign;
  identifying both by an unqualified character would reverse a weight (B0.5, B4.10).
- On a proper geometrically connected model the unit coefficient has section space `L`. On
  `Spec L[t]` it has the infinite independent family `1, t, t², …`. Properness is essential to the
  finite-dimensional statement (B4.1).
- At a two-component boundary crossing, cusp membership is divisibility by `q₁q₂`. After a blow-up
  the exceptional boundary can have a different pullback multiplicity; ideal pushforward compares
  cusp sections (B3.4, B3.5).
- For an arithmetic Hilbert weight with `k = 4`, `w = 2` at one embedding, the determinant exponent
  is `−1`. Replacing it by a nonnegative exponent changes the central character (B4.11).
- A formal series `(1 − q)⁻¹` has nonzero coefficients in all degrees over a nonzero ring. A
  finite-support coefficient target loses valid completed sections (B5.14).
- Over `ℤ/4`, reduction to `ℤ/2` is not injective, and the coefficient `2` is a nonzero nilpotent.
  The expansion proof uses both terms of an extension rather than testing only residue fields (B5.5,
  B5.6).
- For the shear action of `C₂` on `(ℤ/2)²`, the second-coordinate quotient is surjective before
  invariants and not after. Only the left-exact invariant functor enters the argument (B5.3).
- In the Siegel comparison `κ = 0` gives coherent weights `(0,0;0)`, `(2,0;0)`, `(3,1;0)`,
  `(3,3;0)`, Tate exponents `0, −1, −2, −3` and coherent degrees `i, i−1, i−2, i−3`. Every
  compact-support term additionally has the twist by `−D`. The putative weight `(0,0;1)` fails
  parity and must not be accepted by integer division of a half-weight (B5.21).
- In weight zero the normalized modular Hecke operator at an unramified prime `ℓ` sends `1` to
  `ν(g)·(ℓ + 1) = (ℓ + 1)/ℓ`, with `ν = det⁻¹`; the raw pull-trace operator gives `ℓ + 1` (B5.10).

The roadmap's endpoint is usable classical and cuspidal coefficients over their actual number fields
and over the specified integral PEL and Hilbert bases, with coherent functorial maps, Hecke actions
and coefficient-detecting expansions.

## Downstream consumers

- **HodgeTateAndCanonicalSubgroups** (T1, T2, T6) and **PerfectoidShimuraVarieties** (S6) use the
  canonical principal bundle, the automorphic bundle functor, its boundary extensions and the
  classical VB normalization (Layers B0–B4).
- **AutomorphicGaloisRepresentationsPartII** (AG2.1a, AG2.4) uses automorphic bundles and their
  canonical and subcanonical extensions (Layers B2–B3).
- **HilbertModularVarietiesAndShimuraCurves** (H5, R18.2) uses the Hilbert weight conventions and
  automorphic line bundles (Layers B2, B4).
- **AlgebraicModularFormsAndSerreWeights** (R15.1) uses the canonical logarithmic extension of the
  elliptic de Rham bundle (Layer B3).
- **ShimuraCompactifications** (bundle partner) uses the canonical extensions of general automorphic
  bundles and the formally canonical check of B3.10.
- **OverconvergentAutomorphicForms** (O1, O6, O8), **AbelianVarietiesIsogenousToNoJacobian**,
  **TorsionCohomologyInfrastructure** (TC.1), **AutomorphicBundlesPartII**, and the
  Iwasawa-theoretic roadmaps (AutomorphicPadicLFunctions, AutomorphicCongruences,
  IntegralIwasawaTheory, PadicFamilies) use classical forms, Hecke operators and the expansion
  principle (Layers B4–B5).

## References

- **Milne90.** J. S. Milne, *Canonical models of (mixed) Shimura varieties and automorphic vector bundles*. Corrected author revision, 11 March 2018; cited chapter and page numbering. [Milne90]

[Milne90]: https://www.jmilne.org/math/xnotes/AA.pdf

- **Milne88.** J. S. Milne, *Automorphic vector bundles on connected Shimura varieties*. Author TeX copy of Invent. Math. 92 (1988), pp.91–128 [Milne88]

[Milne88]: https://jmilne.org/math/articles/1988aT.pdf

- **LanIntro.** Kai-Wen Lan, *An Example-Based Introduction to Shimura Varieties*. Author-hosted introduction; cited section and printed page numbering. [LanIntro]

[LanIntro]: https://www.kwlan.org/articles/intro-sh-ex.pdf

- **AG.** F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, *Faltings heights of abelian varieties with complex multiplication*. Version of record, Annals of Mathematics 187 (2018), 391–531 [AG]

[AG]: https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf

- **CS.** A. Caraiani, P. Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties*. Version of record, Annals of Mathematics 186 (2017), 649–766 [CS]

[CS]: https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf

- **BCGP.** G. Boxer, F. Calegari, T. Gee, V. Pilloni, *Modularity theorems for abelian surfaces*. arXiv:2502.20645v1, 28 February 2025. [BCGP]

[BCGP]: https://arxiv.org/pdf/2502.20645v1

- **HLTT.** M. Harris, K.-W. Lan, R. Taylor, J. Thorne, *On the rigid cohomology of certain Shimura varieties*. Author-hosted manuscript; cited manuscript page numbering. [HLTT]

[HLTT]: https://www.kwlan.org/articles/rigcoh.pdf

- **HarrisLoc.** M. Harris, *Beilinson–Bernstein localization over Q and periods of automorphic forms*. Author-hosted manuscript; cited manuscript page numbering. [HarrisLoc]

[HarrisLoc]: https://webusers.imj-prg.fr/~michael.harris/BBlocalization_web.pdf

- **HarrisBundles.** M. Harris, *Vector bundles (Cours 2013, 4fibres)*. Author-hosted course notes, 2013. [HarrisBundles]

[HarrisBundles]: https://webusers.imj-prg.fr/~michael.harris/Cours_2013/4fibres.pdf

- **HarrisLog.** M. Harris, *Logarithmic growth (Cours 2013, 8logarithmique)*. Author-hosted course notes, 2013. [HarrisLog]

[HarrisLog]: https://webusers.imj-prg.fr/~michael.harris/Cours_2013/8logarithmique.pdf

- **HarrisToric.** M. Harris, *Torus embeddings (Cours 2013, 7torique)*. Author-hosted course notes, 2013. [HarrisToric]

[HarrisToric]: https://webusers.imj-prg.fr/~michael.harris/Cours_2013/7torique.pdf

- **Deligne.** P. Deligne (notes by J. S. Milne), *Hodge cycles on abelian varieties*. Revised author TeX copy, 1 October 2018, of LNM 900 (1982), pp.9–100 [Deligne]

[Deligne]: https://jmilne.org/math/Documents/Deligne82.pdf

- **Diamond21.** Fred Diamond, *Geometric weight-shifting operators on Hilbert modular forms in characteristic p*. arXiv:2011.14128v2, 18 September 2021. [Diamond21]

[Diamond21]: https://arxiv.org/pdf/2011.14128v2

- **LanPEL.** Kai-Wen Lan, *Arithmetic compactifications of PEL-type Shimura varieties*. Author-hosted thesis revision, 14 March 2021, with book numbering. [LanPEL]

[LanPEL]: https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf

- **LanErrata.** Kai-Wen Lan, *Arithmetic compactifications of PEL-type Shimura varieties - Errata*. 14 March 2021 [LanErrata]

[LanErrata]: https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf

- **StacksPrime.** The Stacks Project Authors, *Lemma 10.62.1: prime filtrations of finite modules*. Use the cited tag and numbered statement; chapter numbering follows the linked text. [StacksPrime]

[StacksPrime]: https://stacks.math.columbia.edu/tag/00L0

- **StacksKrull.** The Stacks Project Authors, *Krull's intersection theorem*. Use the cited tag and numbered statement; chapter numbering follows the linked text. [StacksKrull]

[StacksKrull]: https://stacks.math.columbia.edu/tag/00IP

- **StacksColimit.** The Stacks Project Authors, *Filtered colimits and finitely presented modules on algebraic stacks*. Use the cited tag and numbered statement; chapter numbering follows the linked text. [StacksColimit]

[StacksColimit]: https://stacks.math.columbia.edu/tag/0GQZ

- **ConradLuminy.** Brian Conrad, *Reductive group schemes*, in Autour des schémas en groupes I, Panoramas et Synthèses 42–43 (2014); author-hosted copy; page numbers as printed in that copy. [ConradLuminy]

[ConradLuminy]: https://math.stanford.edu/~conrad/papers/luminysga3.pdf

- **StacksTrace.** The Stacks Project Authors, *Section 49.3: Discriminant of a finite locally free morphism* (the trace `Trace_π` of a finite locally free morphism). Use the cited tag; chapter numbering follows the linked text. [StacksTrace]

[StacksTrace]: https://stacks.math.columbia.edu/tag/0BVH

- **StacksProjective.** The Stacks Project Authors, *Finite projective modules*. Use the cited tag and numbered statement; chapter numbering follows the linked text. [StacksProjective]

[StacksProjective]: https://stacks.math.columbia.edu/tag/00NX

- **StacksStein.** The Stacks Project Authors, *Stein factorization for algebraic spaces*. Use the cited tag and numbered statement; chapter numbering follows the linked text. [StacksStein]

[StacksStein]: https://stacks.math.columbia.edu/tag/0A18

- **MathlibPrime.** Jinzhao Pan and the Mathlib contributors, *Prime filtrations and exact-sequence induction for finite modules*. Mathlib commit 082e2d37e8b0463410cdb532e111cd43d5a66174 [MathlibPrime]

[MathlibPrime]: https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/AssociatedPrime/Finiteness.lean

- **EGAI.** A. Grothendieck, with J. Dieudonné, *Éléments de géométrie algébrique I: Le langage des schémas*. Publications Mathématiques de l’IHÉS 4 (1960), journal scan served by Numdam [EGAI]

[EGAI]: https://www.numdam.org/article/PMIHES_1960__4__5_0.pdf

- **LanHigher.** Kai-Wen Lan, *Higher Koecher’s principle*. Author-hosted preprint; cover directs readers to Mathematical Research Letters 23 (2016), 163–199, DOI 10.4310/MRL.2016.v23.n1.a9 for the official version. Locators below use the preprint pagination, not journal pagination. [LanHigher]

[LanHigher]: https://www.kwlan.org/articles/Koecher.pdf

- **Diamond22.** Fred Diamond, *Compactifications of Iwahori-level Hilbert modular varieties*. arXiv:2211.06922v1, 13 November 2022 (PDF cover date) [Diamond22]

[Diamond22]: https://arxiv.org/pdf/2211.06922v1

- **FC90.** G. Faltings and C.-L. Chai, *Degeneration of Abelian Varieties*, Ergebnisse der
  Mathematik und ihrer Grenzgebiete (3) 22, Springer, 1990. Locators use printed book pages.

[FC90]: https://doi.org/10.1007/978-3-662-02632-8
