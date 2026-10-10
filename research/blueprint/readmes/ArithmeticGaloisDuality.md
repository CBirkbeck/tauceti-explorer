# Continuous cohomology of profinite groups, Part II: compact coefficients and arithmetic duality

Roadmap ID: **ArithmeticGaloisDuality**. Blueprint job: **BP-ArithmeticGaloisDuality (#675)**. This is the target-level plan of all eight layers under `detail.json`, extending ProfiniteCohomology as prescribed by accepted RS-08. The definitive mathematical specification is this reader together with the synchronized packet. The suggested Lean file proposes native carriers and signatures and is non-exhaustive; elaboration is a signature check and makes no implementation claim. Every node remains `unchecked`.

The plan preserves the 72 existing node IDs and adds 52 targets and supporting interfaces. It contains 124 nodes (1 definition, 22 constructions, 23 lemmas and 78 theorem targets), 138 construction API items, 73 construction tests, 42 planets, 45 checked baseline declaration anchors and 35 supplier requests. All eight layers are **planned**, none is closed. Four mathematical/source/interface gaps and ten prototype/integration records are explicit below.

## Conventions and implementation boundaries

Write C_cts(G,M) for the continuous inhomogeneous complex, compared with Mathlib’s existing homogeneous complex; H_cts is its existing continuousCohomology carrier. TopRep guarantees continuity of each action operator. Joint continuity is stated separately where needed, or follows from a smooth discrete representation. A discrete coefficient has its actual discrete topology; a finite-type coefficient over a complete local ring has its maximal-ideal topology. Forget topology only when entering the ordinary category of module complexes.

For number fields use a supplied separable closure. G_{F,S} has ramification allowed at finite places in S; archimedean places are conventionally included but do not constrain the compositum. G_v is an actual local Galois group and its embedding into the global group is chosen explicitly. At a real place local duality uses complete Tate cohomology; ordinary H⁰ means invariants before the norm quotient. At a complex place the positive and Tate terms vanish. The finite module dual is M^D=Hom(M,μ_m), with its cyclotomic action and evaluation pairing, for m annihilating M. Pontryagin duals and Matlis duals are named separately.

For a map res:A→B, compact support is Cone(res)[−1]. In coordinates its differential is (a,b)↦(da,−res(a)−db). A compact-first cup product has local coordinate a_S cup res(b); a compact-second product has local coordinate (−1)^i res(a) cup b_S. Transgression uses the displayed inhomogeneous convention, giving the minus sign in the extension-class cup formula. Negative cochains in contraction products use a complete Tate resolution.

For R complete Noetherian local with finite residue field, finite-type means finitely generated with the adic topology; cofinite refers to the Matlis-dual/Artinian coefficient regime with discrete topology. Perfect amplitude is an R-module derived assertion. Under (P), p is odd or F has no real places, finite global p-primary cohomology has the bounded range used for compact duality. At p=2 with real places ordinary global cohomology can be unbounded and modified compact support can have negative degrees. The Euler function takes the coefficient of the cumulative Hilbert–Samuel polynomial at the ambient dimension of R: finite-length torsion over Z_p has value zero.

## Existing work and upstream order

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their declaration statements were read. The current read-only roadmap main and current Tau Ceti (`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) were also checked for ownership and completed work. The atlas snapshot is not the authority for that check.

ProfiniteCohomology owns discrete comparisons, filtered finite quotients, low-degree exact sequences, all-degree maps, Shapiro, cup products and cohomological-dimension interfaces. Its current scope expressly excludes the Hochschild–Serre spectral sequence and general non-discrete coefficient theorems; those extensions belong here. ClassFieldTheory owns finite local duality/Euler and the local/global invariant, reciprocity and class-formation inputs. Completed/RestrictedProducts already supplies the generic restricted-product mathematics. Existing adic completion, derived categories, factor sets, normalized profinite quotient sections, internal Homs, roots of unity and number-field carriers are reused.

ArithmeticGaloisDuality and SelmerIwasawaCohomology form the tier-8 bundle. ArithmeticGaloisRepresentations is lower tier. DeformationAndDerivedPatchingAlgebra and the local/global deformation-ring and potential-modularity roadmaps are higher tier: the needed foundations move down to D7, the prescribed-local totally real specialization moves to R02.4, and D8 supplies the elementary first-order cocycle/trace comparison. Higher-tier owners import these nodes. No prerequisite points upward to them. A relation bound is conditional on their supplied obstruction injection.

The Grunwald–Wang overlap with InverseGalois IG.4 is a maintainer reconciliation request: the exact arithmetic obstruction is owned here and realization applications import it. No other roadmap file is changed. FunctionFieldArithmetic FA.4–FA.5 is an explicit arithmetic supplier outside the 94-roadmap Caraiani–Newton selection; its interfaces remain requests rather than assumed implementations.

## Layers

| Layer | Targets | Construction API items | Tests | Planets | Status |
|---|---:|---:|---:|---:|---|
| R02.1 — Compact coefficients, limits and continuous extensions | 23 | 30 | 18 | 6 | planned |
| R02.2 — Hochschild–Serre, transgression and residue maps | 11 | 19 | 7 | 6 | planned |
| R02.3 — Restricted ramification, arithmetic finiteness and finite compact support | 21 | 41 | 22 | 6 | planned |
| R02.4 — Arithmetic duality and local–global obstruction groups | 26 | 17 | 8 | 6 | planned |
| R02.5 — Selmer duality and dimension formulas | 5 | 0 | 0 | 2 | planned |
| R02.6 — Auxiliary primes and patching numerics | 9 | 0 | 0 | 6 | planned |
| D7 — Derived continuous cohomology and compact arithmetic duality | 24 | 31 | 18 | 6 | planned |
| D8 — Cohomological fibres for determinant and coefficient change | 5 | 0 | 0 | 4 | planned |

Read R02.1 limits and R02.2 generic spectral sequences before their compact/derived applications. D7 coefficient foundations are independent supporting inputs even though the historical D7 identifier follows the R02 layers. R02.3 finite arithmetic objects and R02.4 global duality precede R02.5–R02.6; D8 consumes the actual cochain diagrams. The internal prerequisite graph is acyclic.

## R02.1: Compact coefficients, limits and continuous extensions

Build on the existing continuous homogeneous complex. The inverse-limit convention is the kernel/cokernel of one minus the transition shift. Surjectivity of coefficient transitions permits cochain lifting, while finiteness or Mittag–Leffler of the previous cohomology group removes the Milnor term. Compact and rational coefficient comparisons preserve this distinction. Pointwise Hom is required for the splitting torsor: an infinite discrete source does not generally give a continuous cocycle into a discrete Hom. The normalized quotient-section theorem and the algebraic factor-set extension are existing Tau Ceti declarations; this layer adds their continuous coefficient uses and topology. Completed tensor is compared with ordinary tensor only in the stated finite regime. The finite contraction uses the existing complete Tate complex in negative degrees.

<a id="r021-lim-one"></a>

### R02.1/lim-one — lim and lim¹ of a tower

For an ℕ-indexed tower of abelian groups (A_n, φ_n : A_{n+1} → A_n), lim A = ker(∏A_n → ∏A_n) and lim¹A = coker(∏A_n → ∏A_n) for the shift (a_n) ↦ (a_n − φ_n(a_{n+1})). These compute R⁰lim and R¹lim, and R^p lim = 0 for p > 1.

**Hypotheses.** ℕ-indexed towers only; for other index sets the derived functors are different.

**Planet.** Derived limits.

**Construction or proof.**

1. Definition as kernel and cokernel of the shift map.
2. Identification with Rlim is Stacks Lemma 15.88.1.



**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.CompactCoefficients.Tower.lim` | lim A = ker(shift). |
| `TauCeti.CompactCoefficients.Tower.limOne` | lim¹ A = coker(shift). |
| `TauCeti.CompactCoefficients.Tower.mem_lim` | a ∈ lim ↔ φ_n(a_{n+1}) = a_n for all n. |
| `TauCeti.CompactCoefficients.Tower.limOne_subsingleton_of_surjective` | Surjective transitions give lim¹ = 0. |

**Construction tests.**

- `limOne_surjective_tower`: The tower ℤ/p^{n+1} ↠ ℤ/p^n has lim¹ = 0.
- `limOne_mul_p`: The tower ℤ ← ℤ with multiplication by p has lim = 0 and lim¹ ≅ ℤ_p/ℤ ≠ 0.
- `lim_constant`: The constant tower with identity maps has lim equal to the diagonal.

**Uses.**

- ArithmeticGaloisDuality:R02.1/milnor-sequence: the kernel term lim¹ H^{i−1}
- SelmerIwasawaCohomology:L0/padic-kummer-identification: lim¹ μ_{p^m}(K) = 0
- Rubin Appendix B, Proposition 2.3: the finiteness criterion

**Acceptance.**

- lim¹ is kept explicitly in every comparison until a Mittag-Leffler lemma removes it (RS-08).

**Sources.**

- [STACKS](https://stacks.math.columbia.edu/tag/07KW), Stacks Project, More on Algebra, Lemma 15.88.1 (tag 07KW). The two-term complex computing Rlim.

<a id="r021-mittag-leffler"></a>

### R02.1/mittag-leffler — Mittag-Leffler towers

A tower is Mittag-Leffler if for every n the images of A_{n+k} → A_n stabilise as k grows.

**Hypotheses.** Stated on the underlying sets, as in the Stacks Project; for groups the images are subgroups.

**Construction or proof.**

1. Definition through the iterated transition maps.

**Inputs.** `mathlib:CategoryTheory.Functor.IsMittagLeffler`

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.CompactCoefficients.Tower.IsMittagLeffler` | The stabilisation condition. |
| `TauCeti.CompactCoefficients.Tower.isMittagLeffler_of_surjective` | Surjective transitions are Mittag-Leffler. |
| `TauCeti.CompactCoefficients.Tower.isMittagLeffler_of_finite` | Towers of finite groups are Mittag-Leffler. |
| `TauCeti.CompactCoefficients.Tower.isMittagLeffler_iff_functor` | Agreement with Mathlib's IsMittagLeffler on the underlying functor ℕᵒᵖ ⥤ Type. |

**Construction tests.**

- `ml_finite`: A tower of finite groups is Mittag-Leffler.
- `ml_surjective`: Surjective transitions are Mittag-Leffler.
- `ml_mul_p_fails`: ℤ ← ℤ with multiplication by p is not Mittag-Leffler (images p^kℤ never stabilise).

**Uses.**

- ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one: the vanishing criterion
- SelmerIwasawaCohomology:L0/roots-of-unity-mittag-leffler: the tower μ_{p^m}(K)

**Acceptance.**

- Mathlib's CategoryTheory.Functor.IsMittagLeffler is the same notion for functors to types; the tower form is the one the lim¹ lemmas consume.

**Sources.**

- [STACKS](https://stacks.math.columbia.edu/tag/07KW), Stacks Project, Algebra, Definition 10.86.1 (tag 0594). The definition.

<a id="r021-mittag-leffler-lim-one"></a>

### R02.1/mittag-leffler-lim-one — Mittag-Leffler towers have vanishing lim¹

If (A_n) is Mittag-Leffler then lim¹ A = 0.

**Hypotheses.** ℕ-indexed tower of abelian groups.

**Planned declaration.** `TauCeti.CompactCoefficients.Tower.limOne_subsingleton_of_isMittagLeffler`.

**Construction or proof.**

1. Replace A_n by the stable images, which form a tower with surjective transitions and the same lim¹; for surjective transitions, solve a_n − φ_n(a_{n+1}) = b_n by induction on n (Stacks Lemma 15.88.1).

**Inputs.** [R02.1/lim-one](#r021-lim-one); [R02.1/mittag-leffler](#r021-mittag-leffler)

**Acceptance.**

- The converse fails for uncountable systems; for towers of countable groups it holds (not needed here).

**Sources.**

- [STACKS](https://stacks.math.columbia.edu/tag/07KW), Stacks Project, More on Algebra, Lemma 15.88.1 (tag 07KW). if (An) is ML, then R^1 lim An = 0.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r021-lim-one-six-term"></a>

### R02.1/lim-one-six-term — The six-term sequence of lim and lim¹

For a short exact sequence of towers 0 → A → B → C → 0 there is an exact sequence 0 → lim A → lim B → lim C → lim¹A → lim¹B → lim¹C → 0.

**Hypotheses.** Exactness levelwise; compatibility with the transition maps.

**Planned declaration.** `TauCeti.CompactCoefficients.Tower.limOneSixTerm`.

**Construction or proof.**

1. Snake lemma for the map of short exact sequences 0 → ∏A → ∏B → ∏C → 0 given by the shift maps.

**Inputs.** [R02.1/lim-one](#r021-lim-one)

**Acceptance.**

- With A Mittag-Leffler, 0 → lim A → lim B → lim C → 0 is exact (Stacks Lemma 10.86.4).

**Sources.**

- [STACKS](https://stacks.math.columbia.edu/tag/07KW), Stacks Project, More on Algebra, Lemma 15.88.1 (tag 07KW). Rlim is computed by the two-term complex; the long exact sequence follows.
- [STACKS](https://stacks.math.columbia.edu/tag/07KW), Stacks Project, Algebra, Lemma 10.86.4 (tag 0598). The Mittag-Leffler special case.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r021-milnor-sequence"></a>

### R02.1/milnor-sequence — The Milnor sequence for towers of complexes

For a tower of cochain complexes of abelian groups (K_n) with degreewise surjective transitions and limit K = lim K_n, there are short exact sequences 0 → lim¹ H^{p−1}(K_n) → H^p(K) → lim H^p(K_n) → 0.

**Hypotheses.** Degreewise surjective transitions, so lim K_n computes Rlim K_n.

**Planned declaration.** `TauCeti.CompactCoefficients.milnorSequence`.

**Planet.** Milnor sequence.

**Construction or proof.**

1. 0 → K → ∏K_n → ∏K_n → 0 (shift) is a short exact sequence of complexes (surjectivity of the shift from degreewise surjective transitions).
2. Its long exact cohomology sequence has connecting maps whose kernels and cokernels are lim and lim¹ of H^•(K_n).

**Inputs.** [R02.1/lim-one](#r021-lim-one); [R02.1/lim-one-six-term](#r021-lim-one-six-term)

**Acceptance.**

- The lim¹ term is kept; it vanishes under Mittag-Leffler (mittag-leffler-lim-one).

**Sources.**

- [STACKS](https://stacks.math.columbia.edu/tag/07KW), Stacks Project, More on Algebra, Lemma 15.88.10 (tag 07KY), with Lemma 15.88.9 (tag 07KX). The short exact sequences.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r021-cochain-lifting"></a>

### R02.1/cochain-lifting — Lifting continuous cochains along finite surjections

For a compact totally disconnected space X (for example Gⁱ with G profinite) and a surjection π : Y → Z of finite discrete sets, every continuous f : X → Z lifts to a continuous g : X → Y. Hence for a tower of finite discrete G-modules with surjective transitions, the transitions C^i(G, T_{n+1}) → C^i(G, T_n) are surjective.

**Hypotheses.** X compact and totally disconnected; Y, Z discrete, π surjective.

**Planned declaration.** `TauCeti.CompactCoefficients.exists_lift_continuous`.

**Construction or proof.**

1. f is locally constant with finitely many fibres, each clopen; compose with a set-theoretic section of π.



**Acceptance.**

- Fails for connected X mapping to a non-trivial finite set only in the trivial way; the profinite hypothesis is what makes cochain towers Milnor-admissible.

**Sources.**

- [RUBIN-ES](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162). Tates inverse-limit statement relies on this surjectivity.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r021-cochains-inverse-limit"></a>

### R02.1/cochains-inverse-limit — Continuous cochains into an inverse limit

For G profinite and T = lim T_n (inverse-limit topology), C^i(G, T) = lim C^i(G, T_n) as complexes, and the transitions of this tower are surjective when the T_n are finite discrete with surjective transitions.

**Hypotheses.** T closed in ∏T_n with the product topology.

**Planned declaration.** `TauCeti.CompactCoefficients.continuous_into_pi_iff`.

**Construction or proof.**

1. Continuous maps into a subspace of a product are compatible families of continuous maps into the factors (continuous_pi_iff).
2. Surjectivity from cochain-lifting.

**Inputs.** `mathlib:continuous_pi_iff`; [R02.1/cochain-lifting](#r021-cochain-lifting)

**Acceptance.**

- The coboundaries commute with the limit because they are given by the same formula levelwise.

**Sources.**

- [RUBIN-ES](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §2, Definition 2.1, printed pp. 151–152 (PDF pp. 161–162). Continuous cochains Maps(Gⁱ, T).

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r021-carrier-comparison"></a>

### R02.1/carrier-comparison — Comparison with the canonical carrier for compact coefficients

For a profinite G and a topological R-module M with jointly continuous G-action, dehomogenization identifies the inhomogeneous complex C(Gⁿ,M) with Mathlib TopRep.homogeneousCochains after forgetting topology, and hence identifies its cohomology with the underlying R-module of continuousCohomology. For compact and rational coefficients this extends the upstream discrete comparison. Cohomology is given the quotient topology when a topological comparison is asserted; algebraic derived-category comparisons forget that topology.

**Hypotheses.** G is compact Hausdorff and totally disconnected.; The action G × M → M is jointly continuous; per-operator continuity in TopRep alone is insufficient.

**Planned declaration.** `TauCeti.ArithmeticDuality.carrierComparison`.

**Construction or proof.**

1. The dehomogenisation map between homogeneous and inhomogeneous continuous cochains is a homeomorphism Gⁱ⁺¹ → Gⁱ-shape bijection, continuous in both directions for any topological module, so the discrete proof applies verbatim once continuity is checked on the compact-open topology.

**Inputs.** `mathlib:continuousCohomology`; [R02.1/cochains-inverse-limit](#r021-cochains-inverse-limit)

**Acceptance.**

- The degree-one map agrees with the pinned Tau Ceti H1 carrier comparison.
- The degree-two map agrees with the pinned H2 comparison.
- Iterated continuous-map spaces are replaced by C(Gⁿ,M) only using compact local compactness.

**Sources.**

- [RUBIN-ES](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §2, Definition 2.1, printed pp. 151–152 (PDF pp. 161–162). The inhomogeneous definition compared.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r021-tate-inverse-limit"></a>

### R02.1/tate-inverse-limit — Tate's inverse-limit theorem

For G profinite, T = lim T_n with finite discrete G-modules T_n and surjective transitions, and i > 0, there is a short exact sequence 0 → lim¹ H^{i−1}(G, T_n) → H^i(G, T) → lim H^i(G, T_n) → 0. In particular H^i(G, T) = lim H^i(G, T_n) when every H^{i−1}(G, T_n) is finite.

**Hypotheses.** i > 0; finite discrete T_n; surjective transitions.

**Planned declaration.** `TauCeti.CompactCoefficients.tateInverseLimit`.

**Planet.** Tate's inverse-limit theorem.

**Construction or proof.**

1. cochains-inverse-limit: C^•(G, T) = lim C^•(G, T_n) with surjective transitions.
2. milnor-sequence gives the short exact sequence.
3. Finite H^{i−1}(G, T_n) form a Mittag-Leffler tower (Tower.isMittagLeffler_of_finite), so lim¹ = 0.

**Inputs.** [R02.1/cochains-inverse-limit](#r021-cochains-inverse-limit); [R02.1/milnor-sequence](#r021-milnor-sequence); [R02.1/mittag-leffler-lim-one](#r021-mittag-leffler-lim-one); [R02.1/carrier-comparison](#r021-carrier-comparison)

**Acceptance.**

- Applied with T = ℤ_p(1), i = 1: SelmerIwasawaCohomology's p-adic Kummer identification.

**Sources.**

- [RUBIN-ES](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162). The statement (Tate, Corollary 2.2).

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r021-continuous-section-exists"></a>

### R02.1/continuous-section-exists — Continuous sections of coefficient surjections

A continuous surjective homomorphism of profinite groups has a continuous normalized set-theoretic section. Apply TauCeti.exists_continuous_section to its closed kernel and transport through the quotient isomorphism. For coefficient modules use the underlying additive profinite groups; an arbitrary surjection of compact spaces has no such assertion.

**Hypotheses.** Both additive groups are profinite and the map is a continuous surjective additive homomorphism.

**Planned declaration.** `TauCeti.CompactCoefficients.continuousSectionExists`.

**Construction or proof.**

1. The closed kernel has the normalized continuous quotient section already constructed in Tau Ceti; transport it along the induced topological group isomorphism.

**Inputs.** `tauceti:TauCeti.exists_continuous_section`

**Acceptance.**

- The section need not be a homomorphism.

**Sources.**

- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §2.7, Proposition 2.7.2, pp. 138–139. Continuous sections of profinite group quotients, including normalization.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r021-continuous-section-long-exact"></a>

### R02.1/continuous-section-long-exact — Long exact sequences for continuous cohomology

If 0 → T' → T → T'' → 0 is exact and has a continuous set-theoretic section T'' → T, then 0 → C^•(G, T') → C^•(G, T) → C^•(G, T'') → 0 is exact and there is a long exact sequence in continuous cohomology, natural in the sequence, agreeing with Tau Ceti's discrete one when all terms are discrete.

**Hypotheses.** A continuous section exists (continuous-section-exists).; The injection is a topological embedding onto its closed image; compact Hausdorff coefficient modules supply this automatically.; All three actions are jointly continuous.

**Planned declaration.** `TauCeti.ArithmeticDuality.continuousSectionLongExact`.

**Construction or proof.**

1. Surjectivity of C^i(G, T) → C^i(G, T'') by composing with the section; the rest is the long exact sequence of a short exact sequence of complexes.

**Inputs.** [R02.1/continuous-section-exists](#r021-continuous-section-exists); [R02.1/carrier-comparison](#r021-carrier-comparison)

**Acceptance.**

- Without a section the cochain sequence need not be right exact.

**Sources.**

- [RUBIN-ES](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §2, Definition 2.1, printed pp. 151–152 (PDF pp. 161–162). The statement.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r021-compact-cochain-bounded"></a>

### R02.1/compact-cochain-bounded — Continuous cochains into V land in a lattice

For a compact space X, a finite free ℤ_p-module T and V = T ⊗ ℚ_p, every continuous f : X → V lands in p^{−n}T for some n; hence C(X, V) = ⋃_n C(X, p^{−n}T) = C(X, T) ⊗ ℚ_p.

**Hypotheses.** X compact; T finite free.

**Planned declaration.** `TauCeti.CompactCoefficients.exists_pow_smul_mem_lattice`.

**Construction or proof.**

1. f(X) is compact, hence bounded in the p-adic norm.



**Acceptance.**

- Applied with X = Gⁱ.

**Sources.**

- [RUBIN-ES](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §2, Proposition 2.4, printed p. 152 (PDF p. 162). Tates rationalisation argument.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r021-rationalization"></a>

### R02.1/rationalization — Rationalisation of lattice cohomology

For G profinite and T a finitely generated ℤ_p-module with continuous action, H^i(G, T) has no nonzero divisible elements and H^i(G, T) ⊗ ℚ_p ≅ H^i(G, T ⊗ ℚ_p).

**Hypotheses.** T finitely generated over ℤ_p with the p-adic topology.

**Planned declaration.** `TauCeti.CompactCoefficients.rationalization`.

**Planet.** Rationalisation.

**Construction or proof.**

1. compact-cochain-bounded: C^•(G, V) = C^•(G, T) ⊗ ℚ_p, and ⊗ ℚ_p is exact.
2. Divisible elements: they map to 0 in every H^i(G, T/p^n) and so lie in the lim¹ term of tate-inverse-limit, which Tate shows has no divisible elements.

**Inputs.** [R02.1/compact-cochain-bounded](#r021-compact-cochain-bounded); [R02.1/tate-inverse-limit](#r021-tate-inverse-limit)

**Acceptance.**

- V's cohomology is not the limit of anything; rationalisation is a colimit.

**Sources.**

- [RUBIN-ES](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §2, Proposition 2.4, printed p. 152 (PDF p. 162). The statement (Tate, Proposition 2.3).

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r021-discrete-quotient-colimit"></a>

### R02.1/discrete-quotient-colimit — Cohomology of the discrete quotient W = V/T

For T finite free over ℤ_p, W = V/T is a discrete torsion module and H^i(G, W) = colim_n H^i(G, W[p^n]), with W[p^n] ≅ T/p^nT.

**Hypotheses.** G profinite; W with the discrete topology (a continuous action on V/T makes it a discrete module).

**Planned declaration.** `TauCeti.ArithmeticDuality.discreteQuotientColimit`.

**Construction or proof.**

1. A continuous cochain Gⁱ → W has compact, hence finite, image, contained in some W[p^n]; cohomology commutes with this filtered colimit (Tau Ceti ProfiniteCohomology, finite-quotient description, Layer 4).

**Inputs.** [R02.1/carrier-comparison](#r021-carrier-comparison)

**Acceptance.**

- T and W have different topologies and different limiting operations, as the stage requires.

**Sources.**

- [RUBIN-ES](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter I, §2, Example 2.1, printed p. 3 (PDF p. 13). A discrete torsion coefficient computed by a colimit.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Lattice and extension-classification signatures” in the gap ledger.

<a id="r021-lattice-torsion-sequence"></a>

### R02.1/lattice-torsion-sequence — The sequence T → V → W and the torsion of H¹(T)

For T finite free over ℤ_p, the sequence 0 → T → V → W → 0 gives V^G → W^G → H^1(G, T)_tors → 0, and ker(H^1(G, T) → H^1(G, V)) = H^1(G, T)_tors.

**Hypotheses.** G profinite; T finite free.

**Planned declaration.** `TauCeti.ArithmeticDuality.latticeTorsionSequence`.

**Construction or proof.**

1. continuous-section-long-exact applies because W is discrete.
2. rationalization identifies ker(H^1(T) → H^1(V)) with the torsion subgroup.

**Inputs.** [R02.1/continuous-section-long-exact](#r021-continuous-section-long-exact); [R02.1/rationalization](#r021-rationalization); [R02.1/discrete-quotient-colimit](#r021-discrete-quotient-colimit)

**Acceptance.**

- H^1(G, T) is torsion-free when W^G is divisible (for example W^G = 0).

**Sources.**

- [RUBIN-ES](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter I, §2, Lemma 2.2(ii) and its proof, printed pp. 3–4 (PDF pp. 13–14). The statement.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Lattice and extension-classification signatures” in the gap ledger.

<a id="r021-pointwise-hom"></a>

### R02.1/pointwise-hom — Pointwise Hom of discrete modules

For discrete Γ-modules C and A, Hom_pt(C, A) is the group of additive maps C → A with the topology induced from A^C (pointwise convergence) and the conjugation action (g·u)(c) = g u(g⁻¹c). Evaluation Hom_pt(C, A) × C → A is jointly continuous and equivariant, and the action is jointly continuous. For finitely generated C the topology is discrete, and Hom_pt(C, A) is Tau Ceti's InternalHom with homAction.

**Hypotheses.** C, A discrete; no finiteness on C for the definition.

**Construction or proof.**

1. Induced topology from the product; continuity of evaluation from continuity of projections; discreteness for finitely generated C: evaluation at finitely many generators isolates 0.

**Inputs.** `tauceti:TauCeti.homAction`

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.CompactCoefficients.HomPt` | Hom(C, A) with the pointwise topology. |
| `TauCeti.CompactCoefficients.continuous_eval` | Evaluation Hom_pt(C,A)×C→A is jointly continuous when C carries the discrete topology. |
| `TauCeti.CompactCoefficients.discreteTopology_of_fg` | Finitely generated C gives the discrete topology. |
| `TauCeti.CompactCoefficients.homPt_equiv_internalHom` | For finite C, Hom_pt(C, A) = Tau Ceti's InternalHom with homAction. |

**Construction tests.**

- `homPt_int`: For discrete A, evaluation identifies Hom_pt(Z,A) with A as a topological additive group.
- `homPt_fg_discrete`: Finitely generated C: discrete.
- `homPt_not_discrete`: C = ⊕_ℕ 𝔽₂: Hom_pt(C, 𝔽₂) = 𝔽₂^ℕ is not discrete (HW23 E10).

**Uses.**

- ArithmeticGaloisDuality:R02.1/splitting-torsor: the structure group
- Harpaz–Wittenberg, Lemma 5.5: the Massey obstruction as a cup product

**Acceptance.**

- No derived-functor (Ext) interpretation is claimed for Hom_pt with non-discrete topology.

**Sources.**

- [HARPAZ-WITTENBERG-23](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §5, Lemma 5.5, p. 19 (author final version; corrected in PAPER-HARPAZ-WITTENBERG-23/E10). Hom(C, A) as the torsors structure group, with the topology corrected.

<a id="r021-splitting-torsor"></a>

### R02.1/splitting-torsor — The splitting torsor

For an exact sequence 0 → A → B → C → 0 of discrete Γ-modules admitting an additive section, the sections form a continuous affine Hom_pt(C, A)-torsor under conjugation; a section s gives the continuous cocycle γ(g) = g s g⁻¹ − s with values in Hom_pt(C, A); replacing s by s + u changes γ by d⁰u; the class [γ] vanishes iff there is an equivariant additive section.

**Hypotheses.** An additive section exists; Hom_pt with the pointwise topology (not the discrete one).; A,B,C are smooth discrete representations, with jointly continuous actions.

**Construction or proof.**

1. Two sections differ by a map C → A; conjugation preserves sections; the cocycle identity is formal; continuity of γ into Hom_pt is pointwise continuity, which holds as B is discrete.

**Inputs.** [R02.1/pointwise-hom](#r021-pointwise-hom)

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.CompactCoefficients.Sections` | The set of additive sections. |
| `TauCeti.CompactCoefficients.sections_sub_mem_ker` | Two sections differ by a map C → A. |
| `TauCeti.CompactCoefficients.sections_nonempty_iff` | Nonempty iff the sequence splits additively. |
| `TauCeti.CompactCoefficients.splittingClass` | The class [γ] ∈ H^1(Γ, Hom_pt(C, A)). |
| `TauCeti.CompactCoefficients.splittingClass_eq_zero_iff` | [γ] = 0 iff an equivariant section exists. |
| `TauCeti.CompactCoefficients.pointwiseHomRepresentation` | The conjugation representation on the actual Hom_pt carrier. |
| `TauCeti.CompactCoefficients.pointwiseHomRepresentation_apply` | The action is (g·f)(c)=g·f(g⁻¹·c). |

**Construction tests.**

- `torsor_equivariant_split`: An equivariant splitting makes the actual pointwise-Hom H¹ class zero.
- `torsor_zero_class`: If A is the zero group, every additive section gives the zero splitting class.
- `torsor_discrete_fails`: The coordinate shear g↦(c_i↦g_i a_i) is not continuous into discrete Hom on countable direct sums over F₂.

**Uses.**

- ArithmeticGaloisDuality:R02.1/connecting-cup-formula: the class that computes ∂
- Harpaz–Wittenberg, proof of Proposition 5.3: the Massey obstruction

**Acceptance.**

- With the discrete topology on Hom(C, A), γ need not be continuous (HW23 E10).
- Arithmetic acceptance case: A = 0: the only section is the identity and [γ] = 0.

**Sources.**

- [HARPAZ-WITTENBERG-23](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §5, Lemma 5.5, p. 19 (author final version; corrected in PAPER-HARPAZ-WITTENBERG-23/E10). The torsor, in corrected form.

<a id="r021-connecting-cup-formula"></a>

### R02.1/connecting-cup-formula — The connecting map is cup product with the torsor class

In the situation of splitting-torsor, for every m ≥ 0 and continuous m-cocycle c with values in C, s∘c is a continuous cochain with d(s∘c)(g_0, …, g_m) = γ(g_0)(g_0 c(g_1, …, g_m)); hence the connecting map H^m(Γ, C) → H^{m+1}(Γ, A) is ∂[c] = [γ ∪ c] for the evaluation pairing Hom_pt(C, A) × C → A.

**Hypotheses.** As in splitting-torsor; cup products on continuous cochains with the jointly continuous evaluation pairing.

**Planned declaration.** `TauCeti.ArithmeticDuality.connectingCupFormula`.

**Construction or proof.**

1. Direct computation on inhomogeneous cochains; no Ext interpretation is used.

**Inputs.** [R02.1/splitting-torsor](#r021-splitting-torsor); [R02.1/pointwise-hom](#r021-pointwise-hom); [R02.1/continuous-section-long-exact](#r021-continuous-section-long-exact)

**Acceptance.**

- For finitely generated C the formula holds with discrete Hom and Tau Ceti's discrete cup product.

**Sources.**

- [HARPAZ-WITTENBERG-23](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §5, Lemma 5.5, p. 19 (author final version; corrected in PAPER-HARPAZ-WITTENBERG-23/E10). The boundary formula, proved by cochains instead of Ext.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Lattice and extension-classification signatures” in the gap ledger.

<a id="r021-discrete-hom-finitely-generated"></a>

### R02.1/discrete-hom-finitely-generated — Finitely generated C: the discrete case

If C is finitely generated as an abelian group, Hom_pt(C, A) is discrete, the splitting class lies in the discrete-module cohomology H^1(Γ, Hom(C, A)), and connecting-cup-formula holds with the discrete Hom and the discrete cup product; in particular for finite C, as in every application of Harpaz–Wittenberg's Lemma 5.5.

**Hypotheses.** C finitely generated.

**Planned declaration.** `TauCeti.CompactCoefficients.discreteTopology_of_fg`.

**Construction or proof.**

1. discreteTopology_of_fg; then the continuous cochains of the discrete module Hom(C, A) are those of Hom_pt.

**Inputs.** [R02.1/pointwise-hom](#r021-pointwise-hom); [R02.1/connecting-cup-formula](#r021-connecting-cup-formula)

**Acceptance.**

- This is the scope in which the printed Lemma 5.5 is correct.

**Sources.**

- [HARPAZ-WITTENBERG-23](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §5, Lemma 5.5, p. 19 (author final version; corrected in PAPER-HARPAZ-WITTENBERG-23/E10). The printed lemma, valid for finitely generated C.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r021-completed-tensor-comparison"></a>

### R02.1/completed-tensor-comparison — Completed tensor products and finite reductions

For complete Noetherian local R with maximal ideal m and finitely generated complete modules T,M, T ⊗̂_R M is the existing m-adic completion of T⊗_R M and is canonically lim_n((T/mⁿT)⊗_{R/mⁿ}(M/mⁿM)). If T is finite projective, the ordinary tensor product is already complete and the comparison T⊗M → T⊗̂M is an isomorphism. Each reduction agrees with the tensor product over R/mⁿ.

**Hypotheses.** R is complete Noetherian local; T,M are finitely generated with their m-adic topologies.; Do not use this ordinary-tensor identification for arbitrary infinitely generated modules.

**Planned declaration.** `TauCeti.CompactCoefficients.completedTensorComparison`.

**Construction or proof.**

1. Apply the existing adic completion universal property to T⊗M.
2. Compute reductions using right exactness of tensor and the quotient isomorphism; finite generation ensures completion and inverse-limit agreement.
3. For projective T, exhibit it as a summand of a finite free module and use completeness of M.

**Inputs.** [R02.1/lim-one](#r021-lim-one); `mathlib:AdicCompletion`

**Acceptance.**

- T=R gives M, and reduction at mⁿ gives M/mⁿ.
- The zero module stays zero.
- Record completion before claiming a tensor comparison.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §§2.1–2.3, pp. 51–53; §§3.1–3.2, pp. 75–78; §4.1, pp. 95–96. Adic coefficient modules and their finite-level cochain comparisons.
- [PAPER-NAKAMURA-23](https://arxiv.org/pdf/2006.13647), Appendix B, Lemmas B.29–B.31, author pp. 104–106; journal pp. 285–288. The finite-generation regime in which tensor comparisons are used.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r021-continuous-factor-set-extension"></a>

### R02.1/continuous-factor-set-extension — Continuous topology on factor-set extensions

For profinite G and abelian profinite M with jointly continuous G-action, a normalized continuous multiplicative two-cocycle α defines the product topology on the existing TauCeti.FactorSet.Extension. Its existing multiplication (a,g)(b,h)=(a·g(b)·α(g,h),gh) is continuous, the extension is profinite, and its existing canonical section is continuous. Rescaling by a continuous normalized one-cochain gives the existing factor-set equivalence as a homeomorphism.

**Hypotheses.** The factor set, algebraic extension and rescaling equivalence are already in Tau Ceti and are reused.; M is abelian and the action and α are jointly continuous.

**Planet.** Continuous factor-set extensions.

**Construction or proof.**

1. Transport the product topology along the existing left/right coordinates.
2. Check multiplication and inversion using continuity of the action and factor set.
3. Use the existing rescaleEquiv and check both coordinate maps continuously.

**Inputs.** `tauceti:TauCeti.FactorSet`; `tauceti:TauCeti.FactorSet.Extension`; [R02.1/continuous-section-exists](#r021-continuous-section-exists)

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.CompactCoefficients.factorSetTopology` | Product topology transported to the existing FactorSet.Extension. |
| `TauCeti.CompactCoefficients.factorSet_isTopologicalGroup` | The existing extension operations are continuous. |
| `TauCeti.CompactCoefficients.factorSet_section_continuous` | The existing canonical section is continuous. |
| `TauCeti.CompactCoefficients.factorSet_rescaleHomeomorph` | Continuous rescaling is a homeomorphism of extensions. |

**Construction tests.**

- `factor_trivial_product`: Trivial action and trivial cocycle give the product topology.
- `factor_section`: The canonical normalized section projects to its input.
- `factor_zero_kernel`: A trivial kernel gives the original profinite group.

**Uses.**

- PAPER-KALETHA-16/P03: The profinite coefficient extension W is an actual topological extension.
- ArithmeticGaloisDuality:R02.1/continuous-schreier-classification: Realizes a continuous cohomology class.

**Acceptance.**

- The trivial factor set has the semidirect-product topology.
- For the trivial action and factor set the existing extension is topologically M×G.
- A discontinuous cocycle is excluded even when it defines an abstract group.

**Sources.**

- [PAPER-KALETHA-16](https://arxiv.org/pdf/1304.3292v5), §3.2, pp. 10–12; citation of NSW Theorem 2.7.7. The topological group extension used by the rigid inner-form construction.
- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §2.7, Theorem 2.7.7, pp. 142–143. The continuous factor-set construction for profinite coefficients.

<a id="r021-continuous-schreier-classification"></a>

### R02.1/continuous-schreier-classification — Continuous Schreier classification and automorphisms

Equivalence classes of profinite extensions 1→M→E→G→1 inducing the fixed G-action correspond naturally to H²_cts(G,M). A normalized continuous quotient section produces the cocycle, and a change of section is a continuous coboundary. Automorphisms of a fixed extension inducing identity on M and G correspond to continuous one-cocycles Z¹_cts(G,M); inner conjugations by M correspond to coboundaries, giving H¹ after quotienting.

**Hypotheses.** G and M are profinite, M abelian; extension embeddings and projections are continuous and topologically exact.; The topology on E and the fixed action are part of the equivalence relation.

**Planned declaration.** `TauCeti.ArithmeticDuality.continuousSchreierClassification`.

**Construction or proof.**

1. Use the pinned normalized quotient section and existing factorSetOfSection.
2. The section cocycle is continuous; the existing rescaling equivalence identifies section changes.
3. For an automorphism compute σ(s(g))s(g)⁻¹ and check the cocycle identity; reconstruct σ on the coordinates.

**Inputs.** [R02.1/continuous-factor-set-extension](#r021-continuous-factor-set-extension); [R02.1/carrier-comparison](#r021-carrier-comparison); `tauceti:TauCeti.exists_continuous_section`

**Acceptance.**

- A split extension has zero class.
- For a central split extension, automorphisms over endpoints are continuous homomorphisms G→M.
- Do not add a finite-rank or countability assumption absent from the normalized quotient-section theorem.

**Sources.**

- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §2.7, Theorem 2.7.7, pp. 142–143. Classification by continuous second cohomology.
- [PAPER-KALETHA-16](https://arxiv.org/pdf/1304.3292v5), §3.2, pp. 10–12. Automorphisms and section changes of the profinite extension.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Lattice and extension-classification signatures” in the gap ledger.

<a id="r021-unbalanced-cochain-product"></a>

### R02.1/unbalanced-cochain-product — Unbalanced cochain products

For a surjection of finite groups Δ→Θ, Δ-module A, Θ-module B and integers i>j′≥j>0, let C^{i,j′}(Δ,A) be degree-i cochains whose last j′ variables factor through Θ. There is the contraction product C^{i,j′}(Δ,A) × C^{−j}(Θ,B) → C^{i−j,j′−j}(Δ,A⊗B) obtained by summing over the j quotient variables in Kaletha §4.3; at j=0 it is ordinary cup product. It satisfies d(f⊔g)=df⊔g+(−1)^i f⊔dg in its stated degree ranges and is compatible with quotient maps. Negative cochains use the fixed complete Tate resolution, not ordinary positive cochains.

**Hypotheses.** Use the precise strict range i>j′≥j>0; no assertion outside the contraction range.; A⊗B uses the diagonal Δ-action, with B inflated from Θ.; The factors through quotient condition applies to the last variables.

**Planet.** Unbalanced cochain products.

**Construction or proof.**

1. Define the factoring submodule inside the existing inhomogeneous cochains; transport negative terms from the complete resolution.
2. Write the finite summation formula, prove independence of lifts using the factoring condition.
3. Expand differentials and cancel consecutive terms; the surviving boundary terms give the displayed Leibniz sign.

**Inputs.** `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`; [R02.1/carrier-comparison](#r021-carrier-comparison); `mathlib:tateCohomology`

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.ArithmeticDuality.quotientFactoringCochains` | The last-variable quotient-factoring submodule. |
| `TauCeti.ArithmeticDuality.unbalancedProduct` | Finite contraction product in the strict degree range. |
| `TauCeti.ArithmeticDuality.unbalancedProduct_leibniz` | The differential identity in the permitted ranges. |
| `TauCeti.ArithmeticDuality.unbalancedProduct_zeroDegree` | Its boundary at j=0 is ordinary cup product. |
| `TauCeti.ArithmeticDuality.factoringDifferential` | d preserves the last-j-variable condition for j<i; the boundary j=i is excluded. |
| `TauCeti.ArithmeticDuality.productTensorIso` | Transport to the existing tensor representation carrier. |
| `TauCeti.ArithmeticDuality.unbalancedProduct_one` | For negative degree −1, sum f(g₁,…,gₙ,s(a)) tensor (π(g₁⋯gₙ)a)·b over a∈Θ, independent of the chosen lifts s. |

**Construction tests.**

- `unbalanced_zero`: A zero input gives zero output.
- `unbalanced_ordinary`: The degree-zero boundary agrees with ordinary cup product.
- `unbalanced_odd_sign`: For i=3 the second differential term has coefficient −1.

**Uses.**

- PAPER-KALETHA-16/T21: Compares the explicit rigid cocycles with Tate products.
- PAPER-KALETHA-16/T22: Moves connecting morphisms through the contraction.

**Acceptance.**

- The j=0 boundary comparison is ordinary cup product.
- For i odd the differential on the second factor has a minus sign.
- The Θ-summation cannot be replaced by a Δ-summation without multiplicity.

**Sources.**

- [PAPER-KALETHA-16](https://arxiv.org/pdf/1304.3292v5), §4.3, pp. 19–20, product formula and differential identity. The contraction range, factoring condition and Leibniz sign.

## R02.2: Hochschild–Serre, transgression and residue maps

The generic first-quadrant spectral sequence is built on Mathlib double complexes and total complexes; its filtration and edge maps are part of the target. Discrete Hochschild–Serre has its usual subgroup cohomology page. Compact coefficients require a separate relative-invariants construction: for an arbitrary closed subgroup the derived relative invariants need not be continuous cohomology of that subgroup. The signed transgression and transfer square use the chosen inhomogeneous convention. Laurent-series residue maps have the perfect-residue and prime-to-characteristic hypotheses required by the public proof; a Brauer statement in characteristic p is not inferred by treating wild inertia as prime-to-p tame inertia.

<a id="r022-first-quadrant-spectral-sequence"></a>

### R02.2/first-quadrant-spectral-sequence — The spectral sequence of a first-quadrant double complex

For a first-quadrant double complex A^{••} of abelian groups (A^{pq} = 0 for p < 0 or q < 0, with anticommuting differentials d′, d″), the column filtration F^p Tot^n = ⊕_{i≥p} A^{i,n−i} of the total complex is biregular and gives a cohomological spectral sequence E_2^{pq} = H^p_I(H^q_{II}(A)) ⇒ E^n = H^n(Tot A). It converges: E_r^{pq} = E_∞^{pq} for r > max(p, q + 1), and E_∞^{pq} ≅ F^pE^{p+q}/F^{p+1}E^{p+q}. It has edge morphisms E_2^{n,0} → E^n → E_2^{0,n}, the five-term exact sequence 0 → E_2^{1,0} → E^1 → E_2^{0,1} → E_2^{2,0} → E^2, and, if E_2^{pq} = 0 for 0 < q < n, isomorphisms E_2^{m,0} ≅ E^m for m < n and an exact sequence 0 → E_2^{n,0} → E^n → E_2^{0,n} → E_2^{n+1,0} → E^{n+1}. If every row A^{0q} → A^{1q} → ⋯ is exact in positive degrees, then E^n = H^n(ker(A^{0•} → A^{1•})).

**Hypotheses.** First-quadrant double complexes of abelian groups (or of modules over a ring).

**Construction or proof.**

1. Mathlib builds a spectral object from any functor into cochain complexes, by mapping cones (HomotopyCategory.spectralObjectMappingCone); apply it to the column-truncation filtration indexed by EInt, and pass to an abelian spectral object with the homology functor (Triangulated.SpectralObject.mapHomologicalFunctor).
2. The first-quadrant vanishing (Abelian.SpectralObject.IsFirstQuadrant) holds because A^{pq} = 0 outside the quadrant; Mathlib's spectralSequence for coreE₂CohomologicalNat gives the E₂ pages and differentials.
3. Identify E_2^{pq} with H^p_I(H^q_{II}(A)): the E₁ page is the vertical cohomology and d₁ is induced by d′ (NSW (2.2.1)).
4. Convergence: the filtration is finite in each degree, so the pages stabilise for r > max(p, q + 1) and E_∞ is the associated graded of H^n(Tot).
5. Edge morphisms and the five-term sequence from the definition of the filtration (NSW (2.1.1), (2.1.2)); the exact-rows statement from the transposed double complex (NSW (2.2.4)).

**Inputs.** `mathlib:HomotopyCategory.spectralObjectMappingCone`; `mathlib:CategoryTheory.Triangulated.SpectralObject.mapHomologicalFunctor`; `mathlib:CategoryTheory.Abelian.SpectralObject.IsFirstQuadrant`; `mathlib:CategoryTheory.Abelian.SpectralObject.coreE₂CohomologicalNat`; `mathlib:CategoryTheory.Abelian.SpectralObject.spectralSequence`; `mathlib:HomologicalComplex₂.total`

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.DoubleComplex.spectralSequence` | The E₂ spectral sequence of a first-quadrant double complex, from Mathlib's spectral objects. |
| `TauCeti.DoubleComplex.e2Iso` | E_2^{pq} ≅ H^p_I(H^q_{II}(A)). |
| `TauCeti.DoubleComplex.abutmentFiltration` | The column filtration F^pH^n(Tot A). |
| `TauCeti.DoubleComplex.eInftyIsoGr` | E_∞^{pq} ≅ F^pH^{p+q}/F^{p+1}H^{p+q}. |
| `TauCeti.DoubleComplex.page_eq_eInfty` | E_r^{pq} = E_∞^{pq} for r > max(p, q + 1). |
| `TauCeti.DoubleComplex.edgeBottom` | E_2^{n,0} → H^n(Tot A). |
| `TauCeti.DoubleComplex.edgeLeft` | H^n(Tot A) → E_2^{0,n}. |
| `TauCeti.DoubleComplex.fiveTerm_exact` | The five-term exact sequence (NSW (2.1.1)). |
| `TauCeti.DoubleComplex.exact_of_rows_vanish` | Vanishing rows 0 < q < n give the extended sequence (NSW (2.1.2)). |
| `TauCeti.DoubleComplex.totalCohomology_of_exact_rows` | Exact rows give H^n(Tot A) = H^n(ker(A^{0•} → A^{1•})) (NSW (2.2.4)). |
| `TauCeti.DoubleComplex.spectralSequence_map` | Natural in the double complex. |

**Construction tests.**

- `one_row`: A^{pq} = 0 for q > 0: E_2^{p0} = H^p(A^{•0}) = H^p(Tot A), and all differentials vanish.
- `one_column`: A^{pq} = 0 for p > 0: E_2^{0q} = H^q(A^{0•}) = H^q(Tot A).
- `acyclic_square`: A^{00} = A^{10} = ℤ with d′ = id and all else 0: E_2 = 0 and H(Tot A) = 0.
- `low_degree`: H^0(Tot A) = E_2^{00} for every first-quadrant double complex.

**Uses.**

- ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence: the double complex C^{pq} of NSW (2.4.1)
- SelmerIwasawaCohomology:L2/unramified-dimension-count: the degenerate two-column case

**Acceptance.**

- The convergence to H^n(Tot A) with its filtration is stated, not only the pages: Mathlib's spectral sequence of a spectral object does not yet record its abutment.

**Sources.**

- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter II, §1, Proposition 2.1.1, printed p. 99 (PDF p. 113). The five-term sequence, with Lemma 2.1.2 and the convergence statement on the same page.
- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter II, §2, Lemma 2.2.4, printed p. 105 (PDF p. 119). The exact-rows lemma, used for the abutment of Hochschild–Serre.

<a id="r022-hochschild-serre-spectral-sequence"></a>

### R02.2/hochschild-serre-spectral-sequence — The Hochschild–Serre spectral sequence

Let G be a profinite group, H a closed normal subgroup and A a discrete G-module. There is a first-quadrant spectral sequence E_2^{pq} = H^p(G/H, H^q(H, A)) ⇒ H^{p+q}(G, A), natural in A, whose edge morphisms H^n(G/H, A^H) → H^n(G, A) → H^n(H, A)^{G/H} are inflation and restriction. For an open subgroup G′ with H′ = H ∩ G′, restriction and corestriction are morphisms of spectral sequences between E(G, H, A) and E(G′, H′, A); a pairing A × B → C gives cup products E_r^{pq}(A) × E_r^{p′q′}(B) → E_r^{p+p′,q+q′}(C) with d_r(α ∪ β) = d_rα ∪ β + (−1)^{p+q} α ∪ d_rβ.

**Hypotheses.** G profinite, H closed and normal, A discrete. Compact coefficients: see compact-five-term.; The action on the discrete module is jointly continuous (a smooth discrete representation), beyond TopRep’s per-operator continuity.

**Planet.** Hochschild–Serre spectral sequence.

**Construction or proof.**

1. Apply H⁰(H, −) to the standard resolution A → X^•(G, A) of induced modules, and form the double complex C^{pq} = C^p(G/H, H⁰(H, X^q)) with d′ the cochain differential and d″ = (−1)^p times the differential of X^• (first-quadrant-spectral-sequence).
2. C^p(G/H, −) is exact, so the vertical cohomology is C^p(G/H, H^q(H, A)) and E_2^{pq} = H^p(G/H, H^q(H, A)). The rows are exact in positive degrees because each H⁰(H, X^q) is an induced G/H-module (ProfiniteCohomology Layer 7), so the abutment is H^n(X^•(G, A)^G) = H^n(G, A) by the exact-rows lemma.
3. H^n(G, A) here is the homogeneous continuous-cochain cohomology; it is Mathlib's continuousCohomology for discrete A (ProfiniteCohomology Layers 3 and 10).
4. Edge maps, the morphisms along (G′, H′), and the cup products are checked on the double complex (NSW II §4, Exercises 1, 3 and 5).

**Inputs.** [R02.2/first-quadrant-spectral-sequence](#r022-first-quadrant-spectral-sequence); `mathlib:continuousCohomology`

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.HochschildSerre.spectralSequence` | E(G, H, A) with E_2^{pq} = H^p(G/H, H^q(H, A)). |
| `TauCeti.HochschildSerre.abutmentIso` | The abutment is H^n(G, A) (continuousCohomology). |
| `TauCeti.HochschildSerre.edgeBottom_eq_inflation` | The bottom edge map is inflation. |
| `TauCeti.HochschildSerre.edgeLeft_eq_restriction` | The left edge map is restriction. |
| `TauCeti.HochschildSerre.map` | Natural in the discrete G-module A. |
| `TauCeti.HochschildSerre.res` | An open subgroup U containing H gives restriction to the spectral sequence for H≤U; general morphisms of extensions are a further naturality obligation. |
| `TauCeti.HochschildSerre.cor` | The same open subgroup U containing H gives the corestriction morphism. |
| `TauCeti.HochschildSerre.cup` | An equivariant bilinear coefficient pairing gives products on each r≥2 page. The graded Leibniz rule and compatibility of higher-tier-page descent are acceptance obligations. |

**Construction tests.**

- `trivial_subgroup`: H = 1: E_2^{p0} = H^p(G, A) and E_2^{pq} = 0 for q > 0.
- `whole_group`: H = G: E_2^{0q} = H^q(G, A) and E_2^{pq} = 0 for p > 0.
- `z4_nondegenerate`: G = ℤ/4, H = 2ℤ/4, A = 𝔽₂: d₂^{0,1} : H¹(H, 𝔽₂) → H²(G/H, 𝔽₂) is nonzero, since it is minus the class of the non-split extension 0 → ℤ/2 → ℤ/4 → ℤ/2 → 0 (transgression-cup-product); so E₂ ≠ E_∞.

**Uses.**

- ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles/prime-to-p-cohomology-through-tame-quotient: Hochschild–Serre for the wild inertia with discrete torsion coefficients, edge map inflation
- DiamondEtaleCohomology:C8/extension-cd-bound: the all-degree sequence for a closed normal subgroup
- ExcursionOperatorsAndSpectralAction:ES7: the general construction, applied to a geometric quotient
- SelmerIwasawaCohomology:L2/unramified-dimension-count: Hochschild–Serre for inertia at ℓ ≠ p

**Acceptance.**

- Stated for discrete coefficients, with the edge maps identified with inflation and restriction; no compact-coefficient spectral sequence is claimed here (see compact-five-term).
- Arithmetic acceptance case: G = G₁ × H with G₁ acting trivially on A: the sequence degenerates at E₂ (NSW (2.4.6)).

**Sources.**

- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter II, §4, Theorem 2.4.1, printed p. 111 (PDF p. 125). Theorem 2.4.1 and its proof (pp. 111–112).
- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter II, §4, Exercises 1, 3, 5, printed p. 119 (PDF p. 133). The edge maps, the morphisms for restriction and corestriction, and the cup products.

<a id="r022-five-term-transgression"></a>

### R02.2/five-term-transgression — The five-term sequence and the transgression

In the Hochschild–Serre spectral sequence the differential d₂^{0,1} : H¹(H, A)^{G/H} → H²(G/H, A^H) is the transgression, so the five-term exact sequence 0 → H¹(G/H, A^H) → H¹(G, A) → H¹(H, A)^{G/H} → H²(G/H, A^H) → H²(G, A) of the spectral sequence is the inflation–restriction–transgression sequence of ProfiniteCohomology Layer 5. If H^i(H, A) = 0 for 0 < i < n, then H^m(G/H, A^H) ≅ H^m(G, A) for m < n and 0 → H^n(G/H, A^H) → H^n(G, A) → H^n(H, A)^{G/H} → H^{n+1}(G/H, A^H) → H^{n+1}(G, A) is exact.

**Hypotheses.** G profinite, H closed normal, A discrete.

**Planned declaration.** `TauCeti.HochschildSerre.fiveTermTransgression`.

**Construction or proof.**

1. The five-term sequence is first-quadrant-spectral-sequence's, with edge maps inflation and restriction (hochschild-serre-spectral-sequence).
2. d₂^{0,1} = tg: an element of H¹(H, A)^{G/H} is an H-invariant 1-cocycle x of the resolution; G/H-invariance gives b with d(b_{σ,ρ}) = ρx − σx, which may be taken G-invariant, normalised and factoring through G/H × G/H; the cocycle ∂b represents d₂^{0,1}, and y_σ = x_{1,σ} + b_{1,σ}(σ) has the properties defining tg, with ∂y = ∂b (NSW (2.4.3), proof of Moser and Stix).
3. The extended sequence is the vanishing-rows case of first-quadrant-spectral-sequence.

**Inputs.** [R02.2/hochschild-serre-spectral-sequence](#r022-hochschild-serre-spectral-sequence); [R02.2/first-quadrant-spectral-sequence](#r022-first-quadrant-spectral-sequence)

**Acceptance.**

- The identification is with ProfiniteCohomology's explicit transgression (transgression, fiveTerm_exact_H1N, fiveTerm_exact_H2Q), not a second definition.

**Sources.**

- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter II, §4, Theorem 2.4.3, printed p. 113 (PDF p. 127). Theorem 2.4.3; the five-term sequence and its extension are on p. 112.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r022-transgression-cup-product"></a>

### R02.2/transgression-cup-product — d₂ as cup product with the extension class

Let H be an open normal subgroup of the profinite group G acting trivially on A, H′ the closure of the commutator subgroup of H, and u ∈ H²(G/H, H^ab) the class of 1 → H^ab → G/H′ → G/H → 1. Under H¹(H, A) = Hom(H^ab, A), the differential d₂^{p−1,1} : H^{p−1}(G/H, H¹(H, A)) → H^{p+1}(G/H, A) is x ↦ −u ∪ x for p > 0; in particular tg(x) = −u ∪ x. The same holds for a closed normal H with u the continuous class in H²_cts(G/H, H^ab).

**Hypotheses.** H acts trivially on A. For closed H, u lives in continuous cohomology with the profinite coefficient H^ab.

**Planned declaration.** `TauCeti.ArithmeticDuality.transgressionCupProduct`.

**Planet.** Transgression as cup product.

**Construction or proof.**

1. For finite G: the projection H → H^ab is a G/H-invariant class ε, and tg(ε) = −u by a cochain computation with a section s of G → G/H.
2. d₂^{p,1} = δ ∘ δ for the two short exact sequences cut from 0 → A^H → X⁰(G, A)^H → Z → H¹(H, A) → 0, and cup products with ε commute with both δ's, so d₂(z) = δδ(ε ∪ z) = −u ∪ z.
3. General G: pass to the finite quotients G/W for open normal W ⊆ H, using the compatibility of cup products with inflation and H¹(H, A) = colim_W H¹(H/W, A) (ProfiniteCohomology Layers 4 and 12).
4. Closed H: the same argument with the continuous class u of R02.1's cohomology with compact coefficients.

**Inputs.** [R02.2/hochschild-serre-spectral-sequence](#r022-hochschild-serre-spectral-sequence); [R02.2/five-term-transgression](#r022-five-term-transgression); [R02.1/carrier-comparison](#r021-carrier-comparison)

**Acceptance.**

- The sign −u is recorded; Harpaz–Wittenberg's d₂^{1,1}[β] = [β ∪ f] (extraction item 148) is this identity for their extension, up to the sign they call harmless.

**Sources.**

- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter II, §4, Theorem 2.4.4, printed p. 114 (PDF p. 128). Theorem 2.4.4, its proof (pp. 115–117) and the remark on closed H.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Relative compact HS and signed transfer signatures” in the gap ledger.

<a id="r022-hochschild-serre-degeneration"></a>

### R02.2/hochschild-serre-degeneration — Degeneration of the Hochschild–Serre spectral sequence

(i) If H^q(H, A) = 0 for all q > 0, then H^n(G/H, A^H) ≅ H^n(G, A). (ii) If 1 → H → G → G/H → 1 splits and H acts trivially on A, inflation H^*(G/H, A) → H^*(G, A) is a split injection and every differential into the bottom row vanishes. (iii) If G = G₁ × H with G₁ acting trivially on the H-module A, the sequence degenerates at E₂ and H^n(G, A) ≅ ⊕_{p+q=n} H^p(G₁, H^q(H, A)) (non-canonically). (iv) If H^q(H, A) = 0 for q > 1, there is a long exact sequence ⋯ → H^n(G/H, A^H) → H^n(G, A) → H^{n−1}(G/H, H¹(H, A)) → H^{n+1}(G/H, A^H) → ⋯; if cd(G/H) ≤ 1, then 0 → H¹(G/H, H^{n−1}(H, A)) → H^n(G, A) → H^n(H, A)^{G/H} → 0 is exact for n ≥ 1.

**Hypotheses.** As in hochschild-serre-spectral-sequence.

**Planned declaration.** `TauCeti.HochschildSerre.hochschildSerreDegeneration`.

**Construction or proof.**

1. (i) All rows but q = 0 vanish.
2. (ii) The splitting makes the bottom edge maps split injections, so E_2^{*,0} = E_∞^{*,0} and the differentials d_r^{*,r−1} into it are zero (NSW (2.4.5)).
3. (iii) For trivial G₁-coefficients C^•(G₁, B) ≅ C^•(G₁, ℤ) ⊗ B, so the double complex is a tensor product with a complex of flat ℤ-modules; the Künneth argument degenerates it (NSW (2.4.6), after Jannsen).
4. (iv) Two nonzero rows, or two nonzero columns when cd(G/H) ≤ 1 (ProfiniteCohomology Layer 11), in first-quadrant-spectral-sequence (NSW II §4, Exercise 4; Lemma 2.1.3).

**Inputs.** [R02.2/hochschild-serre-spectral-sequence](#r022-hochschild-serre-spectral-sequence); [R02.2/first-quadrant-spectral-sequence](#r022-first-quadrant-spectral-sequence)

**Acceptance.**

- Each degeneration is stated with its hypothesis; (iii)'s splitting is not claimed to be functorial in A.

**Sources.**

- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter II, §4, Theorem 2.4.6, printed p. 118 (PDF p. 132). Corollary 2.4.2 (p. 112), Proposition 2.4.5, Theorem 2.4.6 and Exercise 4 (p. 119).

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r022-finite-index-descent"></a>

### R02.2/finite-index-descent — Restriction and corestriction descent for finite index

Let G be a profinite group, U an open subgroup of index n and A a discrete G-module. (i) cor ∘ res = n on H^i(G, A). (ii) If U is normal and multiplication by every prime dividing n is an automorphism of A (for example A ℓ-primary with ℓ ∤ n), then res : H^i(G, A) → H^i(U, A)^{G/U} is an isomorphism for every i. (iii) If A is ℓ-primary and ℓ ∤ n, res : H^i(G, A) → H^i(U, A) is injective. Arithmetically: for a finite extension L/K of degree prime to ℓ and an ℓ-primary discrete G_K-module M, H^i(K, M) → H^i(L, M) is injective, with image H^i(L, M)^{Gal(L/K)} when L/K is Galois; the same holds for ℤ_ℓ-lattices T and for V = T ⊗ ℚ_ℓ with continuous cohomology.

**Hypotheses.** n = (G : U) prime to the primes of A's torsion, where stated.

**Planned declaration.** `TauCeti.ArithmeticDuality.finiteIndexDescent`.

**Planet.** Descent along finite extensions.

**Construction or proof.**

1. (i) is ProfiniteCohomology's cor ∘ res = (G : U) in all degrees (NSW (1.5.7)).
2. (ii) The finite group G/U has Ĥ^p(G/U, B) = 0 for p ≥ 1 when multiplication by the primes dividing n is bijective on B (NSW (1.6.2)); applied to B = H^q(U, A), all columns p > 0 of Hochschild–Serre vanish (hochschild-serre-degeneration) and the edge map res is an isomorphism onto H^q(U, A)^{G/U}.
3. (iii) From (i): n kills the kernel of res, and n is injective on A's ℓ-primary cohomology.
4. For T and V: pass to the limit over T/ℓ^m (Tate's inverse-limit theorem, R02.1) and tensor with ℚ_ℓ (rationalization).

**Inputs.** [R02.2/hochschild-serre-spectral-sequence](#r022-hochschild-serre-spectral-sequence); [R02.2/hochschild-serre-degeneration](#r022-hochschild-serre-degeneration); [R02.1/tate-inverse-limit](#r021-tate-inverse-limit); [R02.1/rationalization](#r021-rationalization)

**Acceptance.**

- Serves the maintainer's Harpaz–Wittenberg item for R02.2 (finite-extension restriction and corestriction descent with prime-to-p injectivity).

**Sources.**

- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter I, §5, Corollary 1.5.7, printed p. 51 (PDF p. 65). Corollary 1.5.7, with Proposition 1.6.2 (p. 60) for the vanishing.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Relative compact HS and signed transfer signatures” in the gap ledger.

<a id="r022-compact-five-term"></a>

### R02.2/compact-five-term — Inflation–restriction for compact and rational coefficients

Let H be a closed normal subgroup of the profinite group G and T a topological G-module that is discrete, a finitely generated ℤ_p-module or a finite-dimensional ℚ_p-vector space. (i) 0 → H¹(G/H, T^H) → H¹(G, T) → H¹(H, T) is exact. (ii) If moreover H¹(G, S), H²(G, S) and H¹(H, S) are finite for every G-module (resp. H-module) S of finite p-power order, then 0 → H¹(G/H, T^H) → H¹(G, T) → H¹(H, T)^{G/H} → H²(G/H, T^H) → H²(G, T) is exact.

**Hypotheses.** The finiteness hypotheses of (ii), for all finite p-primary modules.

**Planned declaration.** `TauCeti.ArithmeticDuality.compactFiveTerm`.

**Construction or proof.**

1. (i) is the cochain proof of the discrete case (ProfiniteCohomology Layer 5), which uses no discreteness.
2. (ii) For T finitely generated over ℤ_p, apply five-term-transgression to the discrete modules T/p^mT; the hypotheses make every term finite, so the inverse limit over m is exact, and Tate's inverse-limit theorem (R02.1/tate-inverse-limit) identifies the limits with the cohomology of T.
3. For a ℚ_p-space V, choose a G-stable lattice T₀, and tensor the sequence for T₀ with ℚ_p (R02.1/rationalization).

**Inputs.** [R02.2/five-term-transgression](#r022-five-term-transgression); [R02.1/tate-inverse-limit](#r021-tate-inverse-limit); [R02.1/rationalization](#r021-rationalization); [R02.1/mittag-leffler-lim-one](#r021-mittag-leffler-lim-one)

**Acceptance.**

- Keep Rubin B.2.5 finiteness hypotheses for the full compact five-term sequence; the three-term inflation–restriction sequence needs fewer hypotheses.
- The general compact spectral sequence below uses relative derived invariants rather than silently replacing them by Hcts(H,T).

**Sources.**

- [RUBIN-ES](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §2, Proposition 2.5, printed p. 152 (PDF p. 162). Proposition B.2.5 and its proof.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Relative compact HS and signed transfer signatures” in the gap ledger.

<a id="r022-compact-hochschild-serre"></a>

### R02.2/compact-hochschild-serre — Relative compact Hochschild–Serre

For a closed normal H of profinite G and an ind-admissible R[G]-module T, derive the relative invariants functor Γ(G,G/H,−): T↦Tᴴ inside ind-admissible coefficients. There is a convergent first-quadrant Grothendieck spectral sequence E₂^{a,b}=H_der^a(G/H,R^bΓ(G,G/H,T))⇒H_der^{a+b}(G,T), natural with its edge maps. A canonical comparison to RΓ_cts(H,T) is not always an isomorphism. For open normal H the finite quotient comparison gives the usual compact HS; more general replacement requires the stated comparison quasi-isomorphism and the finiteness/convergence hypotheses. In a finite-coefficient tower retain the Milnor lim¹ terms when identifying an inverse-limit abutment.

**Hypotheses.** R is complete Noetherian local with finite residue field; coefficients are ind-admissible.; Usual compact HS is asserted for open H, or with an actual quasi-isomorphism of relative invariants to subgroup cochains.; Bounded diagonal filtrations and the relevant inverse-limit comparison are checked before commuting the spectral sequence with a limit.

**Planned declaration.** `TauCeti.ArithmeticDuality.compactHochschildSerre`.

**Planet.** Compact Hochschild–Serre.

**Construction or proof.**

1. Relative invariants has exact inflation left adjoint and preserves injectives; apply the existing Grothendieck spectral-sequence mechanism.
2. Compare injective resolutions after restriction to H; do not assume that restriction preserves injectives in the ind-admissible category.
3. For open H use finite coset decomposition; for a tower use Milnor and finite filtrations, recording any lim¹ obstruction.

**Inputs.** [R02.2/hochschild-serre-spectral-sequence](#r022-hochschild-serre-spectral-sequence); [R02.1/milnor-sequence](#r021-milnor-sequence); [D7/admissible-coefficients](#d7-admissible-coefficients); [D7/derived-tensor-and-tor](#d7-derived-tensor-and-tor); [D7/grothendieck-spectral-sequence](#d7-grothendieck-spectral-sequence)

**Acceptance.**

- For discrete coefficients it is the upstream HS sequence.
- For an open normal subgroup, the quotient is finite and the usual edge maps are inflation and restriction.
- For K=Q_p(μ_p), H=G_{K(μ_{p∞})}, T=Z_p(1), ordinary H¹(H,T) is an Iwasawa module outside the ind-admissible quotient category; exclude the naive identification.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §3.6.3–3.6.5, pp. 92–93; §4.1.4, pp. 96–97. The relative spectral sequence, its comparison and explicit failure for closed subgroups.
- [JANNSEN](https://epub.uni-regensburg.de/26684/1/jannsen12.pdf), §2, Theorem 2.2, pp. 215–216. The comparison of derived inverse-limit cohomology with continuous cochains.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Relative compact HS and signed transfer signatures” in the gap ledger.

<a id="r022-transgression-norm-square"></a>

### R02.2/transgression-norm-square — Transgression and norm compatibility

For 1→Γ_L→Γ_K→H→1, a finite H-module A and a subgroup H′≤H, transgression tg_H:H¹(L,A)^H→H²(H,A) obeys cor_{H′}^H∘tg_{H′}=tg_H∘N_{H/H′}, where N_{H/H′} sends an H′-invariant cohomology class to the sum of its coset translates. If Δ is the abelianization of Γ_L and u∈H²(H,Δ) is the pushed-out extension class, tg_H(x)=−u∪x under evaluation Δ×Hom(Δ,A)→A. When A=μ_m and Kummer applies, this cohomological norm becomes the corresponding field norm.

**Hypotheses.** H is a finite quotient of Γ_K and A is a discrete H-module, so Γ_L acts trivially. H′ need not be normal. The abelianized kernel Δ can be profinite and uses the continuous evaluation convention.; Use the same normalized inhomogeneous differential as upstream ProfiniteCohomology.

**Planned declaration.** `TauCeti.ArithmeticDuality.transgressionNormSquare`.

**Construction or proof.**

1. Express tg by the extension factor set and the negative pushforward formula.
2. Compare coset representatives in transfer; differences give a coboundary.
3. Under Hilbert 90 and Kummer, corestriction becomes the norm; insert this into the square.

**Inputs.** [R02.2/transgression-cup-product](#r022-transgression-cup-product); [R02.2/finite-index-descent](#r022-finite-index-descent); `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

**Acceptance.**

- The nonsplit Z/4 extension gives a nonzero transgression.
- A split extension gives zero.
- Norm and restriction have opposite variance and must not be interchanged.

**Sources.**

- [PAPER-MERKURJEV-SCAVIA-26](https://www.math.ucla.edu/~merkurev/papers/Negligible.pdf), §2, Lemmas 2.3 and 2.5, pp. 6–7. Inflation/corestriction and the transgression–norm square, with the negative extension-class convention.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Relative compact HS and signed transfer signatures” in the gap ledger.

<a id="r022-laurent-residue-sequence"></a>

### R02.2/laurent-residue-sequence — Laurent-field residue and Witt sequences

For perfect k, m invertible in k, and K=k((t)), the tame inertia sequence and the chosen uniformizer give split exact sequences 0→H^q(k,μ_m^{⊗r})→H^q(K,μ_m^{⊗r})→H^{q−1}(k,μ_m^{⊗(r−1)})→0 for q≥1. The splitting is cup product with the Kummer class of t, with residue normalized to send that class to 1. For a complete discretely valued field with perfect residue k, the Brauer Witt sequence 0→Br(k)→Br(K)→H¹(k,Q/Z)→0 is split by a uniformizer. The first statement excludes coefficients divisible by char(k); the full Brauer statement uses the perfect-residue argument separately.

**Hypotheses.** k is perfect; the finite-coefficient statement has gcd(m,char k)=1.; A uniformizer is chosen for the splitting; residue itself is canonical.; The unramified Brauer embedding is via the valuation ring, not an arbitrary field embedding in mixed characteristic.

**Planned declaration.** `TauCeti.ArithmeticDuality.laurentResidueSequence`.

**Planet.** Laurent-field residue sequences.

**Construction or proof.**

1. Import the tame inertia quotient and its prime-to-characteristic cd1 calculation; apply discrete HS and the split valuation/Kummer class.
2. Compute residue of t and use the projection formula for the split finite sequence.
3. For Brauer use the valuation exact sequence on units over finite unramified extensions; perfect residue supplies unramified splitting fields and acyclicity of principal units. Pass to finite-extension colimits and use H²(G,Z)=H¹(G,Q/Z).

**Inputs.** [R02.2/hochschild-serre-degeneration](#r022-hochschild-serre-degeneration); `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`

**Acceptance.**

- q=1,r=1: K×/K×m splits into k×/k×m and the valuation Z/m.
- Algebraically closed k gives Br(k((t)))=0.
- Finite k gives Br(K)≅Q/Z.
- Do not extend the finite-coefficient residue statement to wild p-torsion without a different inertia calculation.

**Sources.**

- [PAPER-HARPAZ-WITTENBERG-23](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §3, Remark 3.4, pp. 10–11. The Laurent-field residue and Brauer decomposition used in the Massey argument.
- [CHAN-ORDERS](https://web.maths.unsw.edu.au/~danielch/Lect_Orders.pdf), §8.1–8.3, Theorems 8.1, 8.7, 8.10 and Lemma 8.9, pp. 24–30. A public proof of the perfect-residue Brauer Witt sequence.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “All-place duality, roots and geometric-coefficient signatures” in the gap ledger.

<a id="r022-cyclotomic-local-global-kernel"></a>

### R02.2/cyclotomic-local-global-kernel — Cyclotomic description of the power kernel

For a number field F, p prime and r≥1, K=F(μ_{pʳ}), inflation identifies the all-place kernel Sha¹(F,μ_{pʳ}) with ker(H¹(Gal(K/F),μ_{pʳ})→∏_v H¹(Gal(K_w/F_v),μ_{pʳ})). The full cyclotomic H¹ is zero except when p=2,r≥2 and −1 belongs to the cyclotomic Galois image; in that case it is Z/2. Therefore Sha¹ is zero or Z/2, but nonzero cyclotomic H¹ does not itself imply nonzero Sha¹. If L/F is linearly disjoint from K, restriction identifies the ambient cyclotomic H¹ groups. It need not identify the all-place kernels, because local decomposition groups can shrink. If [L:F] is even, corestriction on Sha¹(L,μ_{2ʳ}) is zero, since every such class inflates from this exponent-two ambient group.

**Hypotheses.** Localization uses every place, including infinity.; In the last assertion L/F is finite and disjoint from K; the coefficient μ_{pʳ} is transported by the same roots of unity.

**Planned declaration.** `TauCeti.ArithmeticDuality.cyclotomicLocalGlobalKernel`.

**Planet.** Cyclotomic power kernels.

**Construction or proof.**

1. Over K the coefficient is constant; Chebotarev makes an everywhere-split cyclic extension trivial. Apply inflation–restriction globally and locally.
2. Compute cohomology of subgroups of (Z/pʳ)× by cyclic resolutions and the dyadic inversion condition.
3. Disjointness identifies the ambient finite cyclotomic cohomology groups. Every all-place Sha¹ class lies in the inflated ambient group; combine its exponent two with cor∘res=[L:F]. Do not infer that restriction is onto the all-place kernel.

**Inputs.** [R02.3/absolute-and-relative-sha](#r023-absolute-and-relative-sha); [R02.2/finite-index-descent](#r022-finite-index-descent); `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Acceptance.**

- For Q and μ_4 the all-place Sha¹ is zero although the cyclotomic H¹ can be Z/2.
- For odd p the kernel is zero.
- Do not identify the inversion exception with the entire Grunwald–Wang special case.

**Sources.**

- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §9.1, Propositions 9.1.5–9.1.6, pp. 526–527. The exceptional cyclotomic calculation.
- [PAPER-QIAN-23](https://par.nsf.gov/servlets/purl/10388233), Lemmas 2.1–2.2, pp. 1246–1247; downloaded author pp. 122–124. Inflation, the all-place kernel and restriction/corestriction in the exceptional case.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “All-place duality, roots and geometric-coefficient signatures” in the gap ledger.

## R02.3: Restricted ramification, arithmetic finiteness and finite compact support

K_S is a compositum in a supplied separable closure, with ramification constrained only at finite places. Localization at infinity is modified Tate cohomology, while Euler cardinalities at infinity use ordinary invariants. Restricted products reuse the existing library carrier. S-idele modules are filtered arithmetic modules with actual transition maps and actions, rather than unnamed abstract colimits. The accepted ownership decision assigns finite arithmetic finiteness, cohomological dimension, global Euler characteristics and finite compact support here. Their historical R02.4 node IDs remain stable; parentStageId and this reader give the ownership. The exponent-two field, one-new-prime Kummer construction and antiunit rank are separate targets. The antiunit lower bound retains its precise source gap.

<a id="r023-restricted-ramification-group"></a>

### R02.3/restricted-ramification-group — The Galois group G_{K,S} of the maximal extension unramified outside S

Let K be a number field with separable closure K^s, and S a set of places of K containing the archimedean places. K_S ⊆ K^s is the compositum of the finite extensions of K in K^s that are unramified at every finite place outside S; G_S = G_{K,S} = Gal(K_S/K) is the quotient of G_K by the closed normal subgroup H_S = Gal(K^s/K_S), with the Krull topology. R_{K,S} = {a ∈ K : ord_v(a) ≥ 0 for all finite v ∉ S} is the ring of S-integers. For a finite extension F of K in K_S, the places of F above S are again written S, and F_S = K_S. P is the set of primes ℓ such that ℓ^∞ divides the supernatural degree [K_S : K]; it contains every ℓ that is a unit in R_{K,S}.

**Hypotheses.** K a number field; S ⊇ the archimedean places, possibly infinite. Function fields are not treated: this roadmap and its ClassFieldTheory supplier are for number fields.

**Planet.** The Galois group G_{K,S}.

**Construction or proof.**

1. K_S/K is Galois: the Galois closure of a finite extension unramified outside S is a compositum of its conjugates, hence unramified outside S (NumberFieldArithmetic Layer 1, unramified sets of primes and their behaviour in towers and composita).
2. H_S is the closed subgroup fixing K_S, and G_S = G_K/H_S carries the quotient topology (InfiniteGalois.IntermediateFieldEquivClosedSubgroup).
3. A finite L ⊆ K^s lies in K_S iff L/K is unramified outside S, since composita of extensions unramified outside S are unramified outside S.
4. S ⊆ S′ gives K_S ⊆ K_{S′} and a continuous surjection G_{S′} → G_S; S = all places gives K_S = K^s. For F ⊆ K_S finite, an extension of F unramified outside S_F is unramified outside S over K, so F_S = K_S.
5. If ℓ is a unit in R_{K,S}, then S contains the places above ℓ, and K(μ_{ℓ^n}) is unramified outside ℓ and ∞; so K(μ_{ℓ^∞}) ⊆ K_S and ℓ^∞ divides [K_S : K] (ProfiniteProPGroups Layer 1).

**Inputs.** `mathlib:Field.absoluteGaloisGroup`; `mathlib:InfiniteGalois.IntermediateFieldEquivClosedSubgroup`; `mathlib:Set.integer`

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.RestrictedRamification.maxUnramifiedOutside` | K_S as an intermediate field of K^s/K. |
| `TauCeti.RestrictedRamification.galoisGroupS` | G_{K,S} := Gal(K_S/K) with its Krull topology, a profinite group. |
| `TauCeti.RestrictedRamification.mem_maxUnramifiedOutside_iff` | A finite L ≤ K^s satisfies L ≤ K_S iff every finite place outside S is unramified in L. |
| `TauCeti.RestrictedRamification.isGalois_maxUnramifiedOutside` | K_S/K is Galois. |
| `TauCeti.RestrictedRamification.toGaloisGroupS_surjective` | The canonical restriction homomorphism G_K→G_{K,S} is surjective. Continuity and its H_S kernel are arithmetic acceptance obligations. |
| `TauCeti.RestrictedRamification.maxUnramifiedOutside_mono` | S⊆S′ gives K_S≤K_{S′}. The induced quotient restriction is an arithmetic acceptance obligation. |
| `TauCeti.RestrictedRamification.maxUnramifiedOutside_of_le` | For F ≤ K_S finite over K, F_{S_F} = K_S, and Gal(K_S/F) is the open subgroup of G_S fixing F. |
| `TauCeti.RestrictedRamification.cyclotomic_le_maxUnramifiedOutside` | If S contains the places above ℓ, then K(μ_{ℓ^∞}) ≤ K_S, so ℓ ∈ P. |

**Construction tests.**

- `restricted_rat_infty`: Over Q with no finite allowed prime, the ramification compositum is Q.
- `restricted_rat_two`: A root i of x²=−1 in the supplied closure lies in Q({2}).
- `restricted_rat_two_nonexample`: A root of x²=3 does not lie in Q({2}).
- `restricted_all_places`: With every finite place allowed, the compositum is the entire supplied separable closure.

**Uses.**

- ArithmeticGaloisDuality:R02.3/h1-finite: the profinite group whose H¹ is shown to be finite
- ArithmeticGaloisDuality:R02.3/s-class-formation: the group of the S-idele-class formation
- SelmerIwasawaCohomology:L2/galois-selmer-group: the global Galois group of its Selmer groups, as requested from R02.3
- GlobalGaloisDeformations:R04.2/phi-p-global: the group G_{F,S} whose Φ_p is verified

**Acceptance.**

- K_S lies in a fixed separable closure; the test ℚ, S = {∞} gives the trivial group.
- Arithmetic acceptance case: K = ℚ, S = {∞}: K_S = ℚ and G_S = 1, since every number field of degree > 1 has |disc| > 2 (NumberField.abs_discr_gt_two) and so ramifies at a finite prime.
- Arithmetic acceptance case: K = ℚ, S = {2, ∞}: ℚ(i), ℚ(√2) and every ℚ(ζ_{2^n}) lie in K_S.
- Arithmetic acceptance case: K = ℚ, S = {2, ∞}: ℚ(√3) is not contained in K_S, since 3 ramifies in it.
- Arithmetic acceptance case: S = all places: K_S = K^s, and G_S is Mathlib's Field.absoluteGaloisGroup K.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, opening paragraph, p. 48 (PDF p. 56). The definition of K_S and G_S.
- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, definition of P, p. 48 (PDF p. 56). The set P of primes, and the cyclotomic argument that it contains the units of R_{K,S}.

<a id="r023-hermite-unramified-outside-finite"></a>

### R02.3/hermite-unramified-outside-finite — Hermite: finitely many extensions of bounded degree unramified outside a finite set

Let K be a number field, S a finite set of places of K and n ≥ 1. Only finitely many subfields L ⊆ K^s with K ⊆ L and [L : K] ≤ n are unramified at every finite place outside S.

**Hypotheses.** S finite; no condition on n.

**Planned declaration.** `TauCeti.ArithmeticDuality.hermiteUnramifiedOutsideFinite`.

**Construction or proof.**

1. For such L, |disc(L)| = |disc(K)|^{[L:K]} · N_{K/ℚ}(𝔡_{L/K}) (tower formula for the relative discriminant, NumberFieldArithmetic Layer 4).
2. 𝔡_{L/K} is supported on the finite places of S, and at each such 𝔭 its exponent is bounded in terms of n and the residue characteristic by the tame and wild different-exponent bounds (NumberFieldArithmetic Layer 6). So |disc(L)| is bounded by a constant depending on K, S and n.
3. Hermite's theorem NumberField.finite_of_discr_bdd, applied to the subfields of K^s, gives finiteness.

**Inputs.** `mathlib:NumberField.finite_of_discr_bdd`

**Acceptance.**

- Stated for subfields of a fixed K^s, as Mathlib's finite_of_discr_bdd is; the discriminant bound is explicit in the proof.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, proof of Lemma 4.9, p. 56 (PDF p. 64). The finiteness statement used in Lemma 4.9, isolated as its own theorem.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r023-h1-finite"></a>

### R02.3/h1-finite — Finiteness of H¹(G_{K,S}, M)

Let S be a finite set of places of the number field K containing the archimedean places, and M a finite discrete G_S-module, of any order. Then H¹(G_S, M) is finite. In particular Hom_cont(G_{F,S}, 𝔽_p) is finite for every finite extension F of K in K_S and every prime p.

**Hypotheses.** S finite; M finite. No hypothesis that #M is a unit in R_{K,S}.

**Planned declaration.** `TauCeti.ArithmeticDuality.h1Finite`.

**Construction or proof.**

1. Choose a finite Galois F ⊆ K_S such that Gal(K_S/F) acts trivially on M (M is finite and discrete, so the kernel of the action is open).
2. Inflation–restriction (ProfiniteCohomology Layer 5): 0 → H¹(Gal(F/K), M^{Gal(K_S/F)}) → H¹(G_S, M) → H¹(Gal(K_S/F), M); the first group is finite.
3. H¹(Gal(K_S/F), M) = Hom_cont(G_{F,S}, M), as F_S = K_S. The kernel of such a homomorphism cuts out an extension of F of degree at most #M unramified outside S, and there are only finitely many homomorphisms with a given kernel.
4. hermite-unramified-outside-finite (over F) gives finitely many such fields, so Hom_cont(G_{F,S}, M) is finite.

**Inputs.** [R02.3/restricted-ramification-group](#r023-restricted-ramification-group); [R02.3/hermite-unramified-outside-finite](#r023-hermite-unramified-outside-finite)

**Acceptance.**

- Finiteness of H² needs Poitou–Tate and is planned in R02.4 (global-finiteness); H¹ finiteness is proved here without it.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Lemma 4.9, p. 56 (PDF p. 64). For S finite the whole of P¹_S(K, M) is compact (a finite product of finite groups), so Lemma 4.9 gives the finiteness of H¹; the proof here is its Hermite argument.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r023-localisation-maps"></a>

### R02.3/localisation-maps — Localisation maps and the modified local groups

For each place v of K fix an embedding K^s ↪ K_v^s over K. It gives G_v = Gal(K_v^s/K_v) → G_K → G_S and, for a discrete G_S-module M, localisation maps loc_v : H^r(G_S, M) → H^r(K_v, M), where H^r(K_v, M) := H^r(G_v, M) for v finite and H^r(K_v, M) := Ĥ^r(G_v, M), Tate cohomology of the finite group G_v, for v archimedean (so H⁰(ℝ, M) = M^{Gal(ℂ/ℝ)}/N M and H^r(ℂ, M) = 0). For v finite with M unramified at v, H^r_un(K_v, M) is the image of inflation H^r(g_v, M) → H^r(G_v, M), where g_v = G_v/I_v. loc_v does not depend on the chosen embedding.

**Hypotheses.** M discrete; the unramified subgroups only at finite v where the inertia group acts trivially.; The arithmetic coefficient module is smooth and discrete, so the group action is jointly continuous.

**Construction or proof.**

1. Two embeddings differ by an element of G_K, which conjugates G_v; conjugation acts trivially on cohomology (ProfiniteCohomology Layer 6), so loc_v is independent of the choice.
2. loc_v is the map of the compatible pair (G_v → G_S, id_M), so it commutes with connecting homomorphisms (ProfiniteCohomology Layer 10); at archimedean v compose with H^r → Ĥ^r.
3. H⁰_un = H⁰; inflation H¹(g_v, M) → H¹(G_v, M) is injective, so H¹_un ≅ H¹(g_v, M); for finite M, H²(g_v, M) = 0 because g_v ≅ Ẑ has cohomological dimension 1 (ProfiniteCohomology Layer 11), so H²_un = 0.
4. loc_v agrees with the restriction to the decomposition group of ArithmeticGaloisRepresentations R01.2.

**Inputs.** [R02.3/restricted-ramification-group](#r023-restricted-ramification-group); `mathlib:tateCohomology`; `ArithmeticGaloisRepresentations:R01.2`

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.RestrictedRamification.localCohomology` | H^r(K_v, M): continuous cohomology at finite v, Tate cohomology Ĥ^r(G_v, M) at archimedean v. |
| `TauCeti.RestrictedRamification.locMap` | loc_v : H^r(G_S, M) → H^r(K_v, M), natural in M. |
| `TauCeti.RestrictedRamification.locMap_indep` | Conjugating a local restriction homomorphism by g gives the same induced cohomology map after the explicit coefficient isomorphism ρ(g). |
| `TauCeti.RestrictedRamification.locMap_delta` | A commutative diagram of short exact cochain complexes gives localization commuting with the connecting morphism. Specialization to all arithmetic places also needs the Tate-modification comparison. |
| `TauCeti.RestrictedRamification.unramifiedSubgroup` | H^r_un(K_v, M) ≤ H^r(K_v, M) for finite v with M^{I_v} = M. |
| `TauCeti.RestrictedRamification.unramifiedH1Equiv` | For an unramified module, inflation identifies quotient H¹ with the unramified H¹ subgroup; the Frobenius cokernel formula is the arithmetic specialization. |
| `TauCeti.RestrictedRamification.unramifiedSubgroup_two_eq_bot` | If quotient H² is zero, its inflation image is zero. Finite residue-field coefficients supply that vanishing. |
| `TauCeti.RestrictedRamification.locMap_eq_restriction` | loc_v is the placewise restriction of ArithmeticGaloisRepresentations R01.2. |

**Construction tests.**

- `complex_zero`: v complex: H^r(K_v, M) = 0 for every r and M (Tate cohomology of the trivial group).
- `real_modified_H0`: v real, M = ℤ/3 with trivial action: H⁰(K_v, M) = Ĥ⁰(ℤ/2, ℤ/3) = 0, whereas the ordinary invariants are ℤ/3; a definition using ordinary H⁰ fails this test.
- `real_two`: v real, M = ℤ/2 with trivial action: H^r(K_v, M) = ℤ/2 for every r ≥ 0.

**Uses.**

- ArithmeticGaloisDuality:R02.4/restricted-product-cohomology: the local factors and their unramified subgroups
- ArithmeticGaloisDuality:R02.4/poitou-tate: β^r is the product of the loc_v
- SelmerIwasawaCohomology:L2/galois-selmer-group: the localisation maps whose preimages define Selmer groups

**Acceptance.**

- The archimedean groups are Tate cohomology in every degree, including degree 0; the real-place test with ℤ/3 separates them from ordinary cohomology.
- Arithmetic acceptance case: v finite, M = ℤ/m with trivial action: H¹_un(K_v, M) = Hom(Ẑ, ℤ/m) ≅ ℤ/m, the unramified characters.
- Arithmetic acceptance case: K = ℚ, v = 2, M = ℤ/2: the class of ℚ_2(i)/ℚ_2 in H¹(ℚ_2, ℤ/2) is not in H¹_un.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, statement of the main theorem, p. 55 (PDF p. 63). The localisation maps; the sources modified groups at archimedean places and its unramified subgroups follow in the same paragraph (see ArithmeticGaloisDuality/E3).

<a id="r023-s-idele-class-modules"></a>

### R02.3/s-idele-class-modules — S-ideles, S-units and S-idele classes

For a finite extension F of K in K_S: J_{F,S} = ∏′_{w∈S} F_w^× (restricted product with respect to the local units Ô_w^×), R_{F,S} the ring of S-integers of F, E_{F,S} = R_{F,S}^×, C_{F,S} = J_{F,S}/E_{F,S}, U_{F,S} = ∏_{w∉S} Ô_w^× ⊆ J_F, C_S(F) = C_F/U_{F,S}, and Id_{F,S} = Pic(R_{F,S}). J_S, E_S, C_S and U_S are the direct limits over the finite F ⊆ K_S; they are discrete G_S-modules, and 0 → E_S → J_S → C_S → 0 is exact. At each level 0 → C_{F,S} → C_F/U_{F,S} → Id_{F,S} → 0 is exact, and Id_{F,S} = 0 when S omits only finitely many places (Milne Lemma 4.1).

**Hypotheses.** S ⊇ the archimedean places.

**Construction or proof.**

1. F^× ∩ U_{F,S} = 1 and J_{F,S} ∩ (F^× · U_{F,S}) = E_{F,S} inside J_F, so J_{F,S} → C_F/U_{F,S} has kernel E_{F,S}.
2. The cokernel is J_F/(J_{F,S} · U_{F,S} · F^×) ≅ (⊕_{w∉S} ℤ)/im(F^×) = Pic(R_{F,S}).
3. The transition maps are the idele inclusions of GlobalNumberFields Layer 8 and are Galois equivariant; every element is fixed by an open subgroup, so the limits are discrete G_S-modules, and filtered colimits preserve exactness.
4. A Dedekind domain with finitely many primes is a principal ideal domain.

**Inputs.** [R02.3/restricted-ramification-group](#r023-restricted-ramification-group); `mathlib:Set.integer`; `mathlib:Set.unit`; `mathlib:RestrictedProduct`; `mathlib:ClassGroup`

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.RestrictedRamification.sIdeles` | J_{F,S} as a restricted product, with its locally compact topology. |
| `TauCeti.RestrictedRamification.sUnits` | E_{F,S} = R_{F,S}^× embedded diagonally, a discrete subgroup of J_{F,S}. |
| `TauCeti.RestrictedRamification.sIdeleClasses` | C_{F,S} = J_{F,S}/E_{F,S} and C_S(F) = C_F/U_{F,S}. |
| `TauCeti.RestrictedRamification.limitModules` | Given the actual finite-field transition functors E,J,C,U into abelian groups, take their filtered colimits. Binding those functors and their smooth G_S actions is a recorded prototype contract. |
| `TauCeti.RestrictedRamification.sIdeleClasses_exact` | 0 → C_{F,S} → C_F/U_{F,S} → Pic(R_{F,S}) → 0 is exact. |
| `TauCeti.RestrictedRamification.pic_eq_bot_of_cofinite` | If S omits only finitely many places, Pic(R_{F,S}) = 0. |
| `TauCeti.RestrictedRamification.sIdeles_all` | S = all places: J_{F,S} = J_F, E_{F,S} = F^× and C_{F,S} = C_F (GlobalNumberFields). |

**Construction tests.**

- `s_units_rat_infty`: The S-units of Q with S consisting of its infinite place are exactly ±1.
- `s_units_all`: Allowing every place makes the S-unit subgroup the full unit group K×.
- `s_classes_all`: With every place allowed, the S-idele quotient is the existing global idele class group.

**Uses.**

- ArithmeticGaloisDuality:R02.3/s-class-formation: the module C_S
- ArithmeticGaloisDuality:R02.4/ext-units-ideles: Ext of M into E_S and J_S
- ArithmeticGaloisDuality:R02.4/poitou-tate: the Ext(M^D, −) sequence of 0 → E_S → J_S → C_S → 0
- ArithmeticGaloisDuality:R02.3/s-unit-kummer-sequence: the S-units E_S

**Acceptance.**

- The limits are discrete G_S-modules, and the class-group cokernel of Lemma 4.1 is kept explicit.
- Arithmetic acceptance case: K = F = ℚ, S = {∞}: E_{ℚ,S} = {±1}, J_{ℚ,S} = ℝ^× and C_{ℚ,S} = ℝ^×/{±1} ≅ ℝ_{>0}.
- Arithmetic acceptance case: K = ℚ, S = {2, ∞}: E_{ℚ,S} = {±1} × 2^ℤ.
- Arithmetic acceptance case: K = ℚ(√−5), S = {∞}: Pic(R_{K,S}) = ℤ/2, so C_{K,S} → C_K/U_{K,S} is not surjective.
- Arithmetic acceptance case: S = all places: C_S is the idele-class module of the global class formation (ClassFieldTheory Layer 11).

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Lemma 4.1, p. 49 (PDF p. 57). Lemma 4.1 and the notation J_{F,S}, E_{F,S}, C_{F,S}, U_{F,S} of p. 49.

<a id="r023-s-idele-class-sequence"></a>

### R02.3/s-idele-class-sequence — The S-idele classes as a quotient of the idele classes

For every S, lim_F Pic(R_{F,S}) = 0 over the finite F ⊆ K_S, so the maps C_{F,S} → C_F/U_{F,S} induce an isomorphism C_S ≅ C^{H_S}/U_S and an exact sequence 0 → U_S → C^{H_S} → C_S → 0 of discrete G_S-modules, where C is the idele-class module of K^s. Moreover H^r(G_S, U_S) = 0 for r ≥ 1; hence C_S^{G_S} = C_K/U_{K,S}, and H^r(G_S, C^{H_S}) → H^r(G_S, C_S) is an isomorphism for r ≥ 1. The same holds over every finite F ⊆ K_S.

**Hypotheses.** S ⊇ the archimedean places; S may be finite.

**Planned declaration.** `TauCeti.RestrictedRamification.sIdeleClasses_exact`.

**Construction or proof.**

1. If S omits only finitely many places, Lemma 4.1 gives isomorphisms at every level (the source writes 'When S is finite' here, see ArithmeticGaloisDuality/E2).
2. In general the cokernel of the limit map is lim_F Pic(R_{F,S}). By class field theory Pic(R_{F,S}) ≅ Gal(F′/F) for the maximal unramified abelian extension F′ of F in which the places of S split, and Pic(R_{F,S}) → Pic(R_{F′,S}) corresponds to the transfer Gal(L/F)^ab → Gal(L/F′)^ab, L the maximal unramified S-split extension; the principal ideal theorem makes it zero. F′ ⊆ K_S, so the limit vanishes (ClassFieldTheory Layer 13, requested).
3. H^r(G_S, U_S) = lim_F ∏_{v∉S} H^r(Gal(F_w/K_v), Ô_w^×): finite-group cohomology commutes with products and Shapiro's lemma reduces to a decomposition group (ProfiniteCohomology Layers 4 and 7); H^r(Gal(F_w/K_v), Ô_w^×) = 0 for r ≥ 1 because F_w/K_v is unramified (ClassFieldTheory Layer 6).
4. (C^{H_S})^{G_S} = C_K by Galois descent for idele classes (ClassFieldTheory Layer 10); the long exact sequence (ProfiniteCohomology Layer 5) gives the rest.

**Inputs.** [R02.3/s-idele-class-modules](#r023-s-idele-class-modules)

**Acceptance.**

- Valid for finite S, where the class groups of R_{F,S} are nonzero and the principal ideal theorem is needed.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, proof of Proposition 4.3, p. 50 (PDF p. 58). Proposition 4.3, with Lemma 4.4 (p. 51) for the vanishing of H^r(G_S, U_S).
- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, proof of Lemma 4.4, p. 51 (PDF p. 59). The cohomological triviality of the unramified local units.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r023-p-class-formation"></a>

### R02.3/p-class-formation — P-class formations

For a set P of primes, a P-class formation is a profinite group G, a discrete G-module C and injections inv_U : H²(U, C) → ℚ/ℤ for the open subgroups U ≤ G, such that H¹(U, C) = 0; inv_V ∘ Res_{V,U} = (U : V) · inv_U for V ≤ U; for V normal in U the restriction inv_{U/V} : H²(U/V, C^V) → (U : V)^{-1}ℤ/ℤ is an isomorphism; and for ℓ ∈ P, inv_U induces H²(U, C)(ℓ) ≅ (ℚ/ℤ)(ℓ). When P is the set of all primes the inv_U are isomorphisms (a class formation in Milne's sense); P = ∅ gives Artin–Tate's class formations.

**Hypotheses.** No condition on G beyond being profinite.

**Construction or proof.**

1. A class formation of ClassFieldTheory Layer 2 whose invariant maps are bijective is a P-class formation for every P.
2. For H closed and normal in G, (G/H, C^H) is a P-class formation with P = {ℓ : ℓ^∞ divides (G : H)}: since H¹(H, C) = 0, inflation identifies H²(U/H, C^H) with the colimit of the H²(U/V, C^V) for open V ⊇ H, which inv_U maps onto the elements of ℚ/ℤ whose order divides the supernatural index (U : H) (ProfiniteCohomology Layer 10, ProfiniteProPGroups Layer 1).



**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.ClassFormation.PClassFormation` | The structure (G, C, inv_U) with injective invariants and axioms (a), (b). |
| `TauCeti.ClassFormation.PClassFormation.ofClassFormation` | A ClassFieldTheory class formation with bijective invariants is a P-class formation for every P. |
| `TauCeti.ClassFormation.PClassFormation.quotient` | A full class formation and a closed normal H give the P_H-class formation on (G/H,C^H), where p∈P_H iff every p^n divides some finite quotient index above H. The input is not an arbitrary P-class formation. |
| `TauCeti.ClassFormation.PClassFormation.restrict` | Restriction to an open subgroup is again a P-class formation. |
| `TauCeti.ClassFormation.PClassFormation.invPrimaryEquiv` | H²(U, C)(ℓ) ≅ (ℚ/ℤ)(ℓ) for ℓ ∈ P. |
| `TauCeti.ClassFormation.PClassFormation.fundamentalClass` | u_{U/V} ∈ H²(U/V, C^V), the class of invariant 1/(U : V). |

**Construction tests.**

- `class_formation_empty`: A full class formation supplies a P-class formation for empty P.
- `class_formation_primary`: For p∈P the invariant map on p-primary H² is bijective.
- `class_formation_index_one`: An index-one finite quotient has zero fundamental class.

**Uses.**

- ArithmeticGaloisDuality:R02.3/s-class-formation: the structure carried by (G_S, C_S)
- ArithmeticGaloisDuality:R02.4/class-formation-ext-duality: the hypothesis of Tate's duality theorem

**Acceptance.**

- The invariant maps are injective, not bijective; the (ℤ_p, ℤ) test separates a P-class formation from a class formation.
- Arithmetic acceptance case: G = Ẑ, C = ℤ, inv_U from the connecting map of 0 → ℤ → ℚ → ℚ/ℤ and a chosen generator: a class formation (Milne Example 1.6(a)).
- Arithmetic acceptance case: P = ∅ recovers Artin–Tate's class formations: only the finite-layer isomorphisms are required.
- Arithmetic acceptance case: G = Ẑ, C = ℤ, H = ∏_{ℓ≠p} ℤ_ℓ: (G/H, C^H) = (ℤ_p, ℤ) is a {p}-class formation but not a class formation, since H²(ℤ_p, ℤ) = ℚ_p/ℤ_p ≠ ℚ/ℤ.
- Arithmetic acceptance case: (G_K, C) for a number field K is a class formation (ClassFieldTheory Layer 11).

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §1, a generalization, p. 25 (PDF p. 33). The definition, and the quotient construction stated after it.

<a id="r023-s-class-formation"></a>

### R02.3/s-class-formation — (G_S, C_S) is a P-class formation

(G_S, C_S) is a P-class formation, with P the primes ℓ such that ℓ^∞ divides [K_S : K], and C_S^{Gal(K_S/F)} = C_F/U_{F,S} for every finite F ⊆ K_S. Its invariant maps are those of the global class formation (G_K, C), transported along H^r(G_S, C^{H_S}) ≅ H^r(G_S, C_S).

**Hypotheses.** K a number field; S ⊇ the archimedean places.

**Planned declaration.** `TauCeti.ArithmeticDuality.sClassFormation`.

**Construction or proof.**

1. (G_K, C) is a class formation (ClassFieldTheory Layer 11), so (G_S, C^{H_S}) is a P-class formation by p-class-formation's quotient construction.
2. s-idele-class-sequence gives H^r(G_S, C^{H_S}) ≅ H^r(G_S, C_S) for r ≥ 1, and the same for every open subgroup Gal(K_S/F) (F_S = K_S); transport the invariant maps.

**Inputs.** [R02.3/p-class-formation](#r023-p-class-formation); [R02.3/s-idele-class-sequence](#r023-s-idele-class-sequence); [R02.3/restricted-ramification-group](#r023-restricted-ramification-group)

**Acceptance.**

- P is determined by the supernatural degree [K_S : K]; nothing is asserted for ℓ ∉ P.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Proposition 4.2, p. 50 (PDF p. 58). The statement and its proof from Proposition 4.3 and Lemma 4.4.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Arithmetic S-idele class-formation and Ext signatures” in the gap ledger.

<a id="r023-s-idele-class-reciprocity"></a>

### R02.3/s-idele-class-reciprocity — Reciprocity for the S-idele classes

Let K be a number field and D_S(K) the identity component of C_S(K) = C_K/U_{K,S}. Then D_S(K) = D_K U_{K,S}/U_{K,S}, it is divisible, and 0 → D_S(K) → C_S(K) → G_S^ab → 0 is exact, the second map induced by the global reciprocity map. The same holds over every finite F ⊆ K_S.

**Hypotheses.** K a number field.

**Planned declaration.** `TauCeti.ArithmeticDuality.sIdeleClassReciprocity`.

**Construction or proof.**

1. S = all places: the reciprocity map C_K → G_K^ab is surjective with kernel the identity component D_K, which is divisible (ClassFieldTheory Layer 12; GlobalNumberFields Layer 7).
2. U_{K,S} is compact, so C_K → C_S(K) is proper and the image of D_K is closed; it is the identity component of C_S(K), divisible as a quotient of a divisible group.
3. The image of U_{K,S} in G_K^ab is the closed subgroup generated by the inertia groups at v ∉ S (local units map onto inertia, ClassFieldTheory Layers 7 and 11), which is Gal(K^ab/K_S ∩ K^ab), the kernel of G_K^ab → G_S^ab; the snake lemma gives the exact sequence.

**Inputs.** [R02.3/s-class-formation](#r023-s-class-formation); [R02.3/s-idele-class-modules](#r023-s-idele-class-modules)

**Acceptance.**

- Number fields only; the kernel of reciprocity on C_S(K) is the identity component, which is divisible.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Lemma 4.5, p. 51 (PDF p. 59). Lemma 4.5 and its proof.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Arithmetic S-idele class-formation and Ext signatures” in the gap ledger.

<a id="r023-s-unit-kummer-sequence"></a>

### R02.3/s-unit-kummer-sequence — The Kummer sequence for S-units

Let m be a unit in R_{K,S}. Then 0 → μ_m → E_S → E_S → 0 (the last map x ↦ x^m) is an exact sequence of discrete G_S-modules, H⁰(G_S, E_S) = E_{K,S}, H¹(G_S, E_S) ≅ Pic(R_{K,S}), and 0 → E_{K,S}/E_{K,S}^m → H¹(G_S, μ_m) → Pic(R_{K,S})[m] → 0 is exact.

**Hypotheses.** m a unit in R_{K,S}, that is, S contains the places above m; S ⊇ the archimedean places.

**Planned declaration.** `TauCeti.ArithmeticDuality.sUnitKummerSequence`.

**Construction or proof.**

1. E_S is m-divisible: for a ∈ E_{F,S}, F(a^{1/m})/F is unramified outside S, since m and a are units at every finite place outside S; so a^{1/m} ∈ E_S, and the kernel of x ↦ x^m is μ_m ⊆ K_S.
2. 0 → E_S → K_S^× → Div_S → 0, with Div_S the colimit of the divisor groups ⊕_{w∉S} ℤ of the R_{F,S}. Since the places outside S are unramified in K_S, Div_S^{G_S} = Div(R_{K,S}) and H¹(G_S, Div_S) = 0 (Shapiro's lemma and H¹(finite group, ℤ) = 0, ProfiniteCohomology Layer 7).
3. H¹(G_S, K_S^×) = 0 (Hilbert 90 for the Galois extension K_S/K, ProfiniteCohomology Layer 9), so the long exact sequence gives H¹(G_S, E_S) = coker(K^× → Div(R_{K,S})) = Pic(R_{K,S}).
4. The long exact sequence of 0 → μ_m → E_S → E_S → 0 (ProfiniteCohomology Layer 5) gives the Kummer sequence; over K_S = K^s it is Tau Ceti's kummerShortExact.

**Inputs.** [R02.3/s-idele-class-modules](#r023-s-idele-class-modules); [R02.3/restricted-ramification-group](#r023-restricted-ramification-group); `mathlib:ClassGroup`; `tauceti:TauCeti.kummerShortExact`

**Acceptance.**

- Serves SelmerIwasawaCohomology:L0/s-unit-kummer-identification, which requested the Kummer sequence with S-units and the S-class group from R02.3.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, proof of Lemma 4.12, p. 59 (PDF p. 67). The divisibility of E_S.
- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, proof of Corollary 4.18, p. 63 (PDF p. 71). The sequence 0 → E_S → K_S^× → ⊕_{v∉S} ℤ → 0 used for H¹(G_S, E_S).

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r024-global-finiteness"></a>

### R02.4/global-finiteness — Finiteness of Galois cohomology with restricted ramification

If S is finite and M is a finite G_S-module whose order is a unit in R_{K,S}, then H^r(G_S, M) is finite for every r.

**Hypotheses.** S finite; #M a unit in R_{K,S}.

**Planned declaration.** `TauCeti.ArithmeticDuality.globalFiniteness`.

**Construction or proof.**

1. P^r_S(K, M) is finite for S and M finite; H⁰ is finite; H¹ and H² are finite because Ш¹_S(K, M) and Ш²_S(K, M) are (poitou-tate (a), for M and for M^D); for r ≥ 3 use poitou-tate (c).

**Inputs.** [R02.4/poitou-tate](#r024-poitou-tate); [R02.4/restricted-product-cohomology](#r024-restricted-product-cohomology)

**Acceptance.**

- The stage R02.3 asks for this theorem; it is planned in R02.4 because the source derives it from Poitou–Tate (see the packet's restructure proposal).
- Owned by R02.3 under RS-08; the legacy ID stays stable. Its proof may use R02.4 duality without moving ownership.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Corollary 4.15, p. 62 (PDF p. 70). Corollary 4.15.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r024-cohomological-dimension-bound"></a>

### R02.4/cohomological-dimension-bound — Cohomological dimension of G_{K,S}

Let ℓ be a prime that is a unit in R_{K,S}. For every finite ℓ-primary G_S-module M and r ≥ 3, H^r(G_S, M) ≅ ⊕_{v real} Ĥ^r(G_v, M). Hence cd_ℓ(G_S) ≤ 2 if ℓ is odd or K is totally imaginary. If ℓ = 2 and K has a real place, H^r(G_S, ℤ/2) ≅ (ℤ/2)^{r₁} ≠ 0 for every r, so cd₂(G_S) = ∞.

**Hypotheses.** ℓ a unit in R_{K,S}.

**Planned declaration.** `TauCeti.ArithmeticDuality.cohomologicalDimensionBound`.

**Planet.** Cohomological dimension of G_{K,S}.

**Construction or proof.**

1. poitou-tate (c) for finite ℓ-primary M (#M is a power of ℓ, a unit in R_{K,S}).
2. For ℓ odd, the Tate cohomology of ℤ/2 on an ℓ-primary module vanishes; for K totally imaginary there is no real place. So H³(G_S, A) = 0 for every finite simple ℓ-torsion A.
3. ProfiniteCohomology Layer 11: cd_ℓ(G) ≤ n iff H^{n+1}(G, A) = 0 for every simple discrete ℓ-torsion A, and such A are finite.

**Inputs.** [R02.4/poitou-tate](#r024-poitou-tate)

**Acceptance.**

- No blanket cd_ℓ ≤ 2 statement is made for ℓ = 2 over a field with a real place: the modified archimedean terms carry all higher cohomology (the caution of Harpaz–Wittenberg's extraction, item 154). The stage R02.3 asks for this bound; it is planned in R02.4 because the source derives it from Poitou–Tate.
- Owned by R02.3 under RS-08; the legacy ID stays stable. Its proof may use R02.4 duality without moving ownership.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Theorem 4.10(c), p. 57 (PDF p. 65). Theorem 4.10(c), with the real places kept.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r024-euler-characteristic-additivity"></a>

### R02.4/euler-characteristic-additivity — The Euler characteristic quotient is multiplicative

Let S be finite. For finite G_S-modules M of order a unit in R_{K,S}, let χ(G_S, M) = #H⁰(G_S, M)·#H²(G_S, M)/#H¹(G_S, M) and φ(M) = χ(G_S, M) · ∏_{v arch} |#M|_v/#H⁰(G_v, M). Then φ(M) = φ(M′)·φ(M″) for every short exact sequence 0 → M′ → M → M″ → 0.

**Hypotheses.** S finite; orders units in R_{K,S}.

**Planned declaration.** `TauCeti.ArithmeticDuality.eulerCharacteristicAdditivity`.

**Construction or proof.**

1. Truncate the long exact sequence at H⁵(G_S, M′)′ = ker(H⁵(G_S, M′) → H⁵(G_S, M)); all terms are finite (global-finiteness).
2. For r ≥ 3 replace H^r(G_S, −) by ⊕_{v arch} H^r(G_v, −) (poitou-tate (c)); [P³] = [P⁴] because the Herbrand quotient of a finite module is 1, and periodicity of the cohomology of a cyclic group identifies the kernel in degree 5 with C = ker(⊕_{v real} H¹(G_v, M′) → ⊕ H¹(G_v, M)).
3. The sequence 0 → ⊕ H⁰(G_v, M′) → ⊕ H⁰(G_v, M) → ⊕ H⁰(G_v, M″) → C → 0 computes #C, and #M = #M′ · #M″.

**Inputs.** [R02.4/global-finiteness](#r024-global-finiteness); [R02.4/poitou-tate](#r024-poitou-tate); `tauceti:TauCeti.TateCohomology.herbrandQuotient_eq_one_of_finite`; `tauceti:Rep.FiniteCyclicGroup.tateCohomologyIsoOdd`

**Acceptance.**

- The real places enter through the periodicity of Tate cohomology, not through a truncation at degree 2.
- Owned by R02.3 under RS-08; the legacy ID stays stable. Its proof may use R02.4 duality without moving ownership.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §5, Lemma 5.3, p. 69 (PDF p. 77). Lemma 5.3 and its proof.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Finite arithmetic localization, duality and Euler signatures” in the gap ledger.

<a id="r024-global-euler-characteristic"></a>

### R02.4/global-euler-characteristic — Tate's global Euler characteristic formula

Let S be a finite set of places of the number field K containing the archimedean places, and M a finite G_S-module whose order is a unit in R_{K,S}. With χ(G_S, M) = #H⁰(G_S, M)·#H²(G_S, M)/#H¹(G_S, M) (ordinary cohomology, even when K has real places), χ(G_S, M) = ∏_{v arch} #H⁰(G_v, M)/|#M|_v, where H⁰(G_v, M) = M^{G_v} is ordinary (not Tate) cohomology and |·|_v is the normalised absolute value. Equivalently χ(G_S, M) = ∏_{v arch} #Ĥ⁰(G_v, M^D)/#H⁰(G_v, M^D); and χ(G_S, M) · χ(G_S, M^D) = ∏_{v∈S} χ(K_v, M).

**Hypotheses.** S finite; #M a unit in R_{K,S}.

**Planned declaration.** `TauCeti.ArithmeticDuality.globalEulerCharacteristic`.

**Planet.** Tate's global Euler characteristic formula.

**Construction or proof.**

1. euler-characteristic-additivity reduces to M killed by a prime p, a unit in R_{K,S}.
2. Choose a finite Galois L ⊆ K_S splitting M and containing μ_p (μ_4 if p = 2). φ is a homomorphism on R_{𝔽_p}(Gal(L/K)); by modular-cyclic-induction and Shapiro's lemma (ProfiniteCohomology Layer 7) one may enlarge K and assume Gal(L/K) cyclic of order prime to p.
3. L is totally imaginary, so H^r(Gal(K_S/L), M) = 0 for r ≥ 3 (cohomological-dimension-bound); cup product with μ_p and 𝔽_p[Ḡ] ⊗ M ≅ 𝔽_p[Ḡ] ⊗ M₀ (Milne Lemma 5.4) give χ(G_S, M) = χ(G_S, M^D).
4. For finite S all terms of poitou-tate's sequence are finite, so χ(G_S, M)·χ(G_S, M^D) = ∏_{v∈S} χ(K_v, M); by the local Euler characteristic formula (ClassFieldTheory Layer 5), the product formula and archimedean-local-duality this gives φ(M)·φ(M^D) = 1.
5. At a real v the factors of φ(M) and φ(M^D) agree (if L_w ≠ K_v then p is odd and [M^{G_v}] = [M_{G_v}] = [(M^D)^{G_v}]); so φ(M) = φ(M^D) and φ(M) = 1.

**Inputs.** [R02.4/euler-characteristic-additivity](#r024-euler-characteristic-additivity); [R02.4/modular-cyclic-induction](#r024-modular-cyclic-induction); [R02.4/poitou-tate](#r024-poitou-tate); [R02.4/global-finiteness](#r024-global-finiteness); [R02.4/cohomological-dimension-bound](#r024-cohomological-dimension-bound); [R02.4/archimedean-local-duality](#r024-archimedean-local-duality); [R02.4/finite-module-dual](#r024-finite-module-dual)

**Acceptance.**

- Footnote 13: M = ℤ/2 and S the places above 2 and ∞ give χ(G_S, M) = 2^{−s}, s the number of complex places; using Tate cohomology at the real places would change the real factors.
- The stage R02.3 asks for this formula; it is planned in R02.4 because the source derives it from Poitou–Tate.
- Owned by R02.3 under RS-08; the legacy ID stays stable. Its proof may use R02.4 duality without moving ownership.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §5, Theorem 5.1, p. 67 (PDF p. 75). The definition of χ(G_S, M) with ordinary cohomology, and Theorem 5.1 with Remark 5.2.
- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §5, footnote 13, p. 67 (PDF p. 75). The archimedean H⁰ in the formula is ordinary cohomology.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Finite arithmetic localization, duality and Euler signatures” in the gap ledger.

<a id="r023-finite-compact-support"></a>

### R02.3/finite-compact-support — Finite arithmetic compact support

For finite discrete M over a global field F and finite nonempty S containing all ramification, primes dividing #M and infinity in the number-field case, form the actual mapping fibre of C(G_{F,S},M)→⊕_{v∈S}C_v(M). At real places C_v is complete Tate cochains and at complex places it is zero. Under p odd or F totally imaginary this is the ordinary finite-place fibre in the p-primary regime. Its long exact sequence, finite cohomology, local invariant in degree 3 and coefficient naturality supply the finite duality carrier extended in D7. In the real dyadic case its negative degrees and ordinary unbounded global cohomology are retained.

**Hypotheses.** For function fields #M is prime to char(F) and S is nonempty.; The map is the sum of actual localization chain maps, with the mapping-fibre sign fixed in D7.

**Planet.** Finite compact support.

**Construction or proof.**

1. Use the imported cochain restriction maps and the existing mapping cone.
2. Derive the long exact sequence of its triangle.
3. Apply finite PT and arithmetic finiteness; use the complete local resolution at real places.

**Inputs.** [R02.3/localisation-maps](#r023-localisation-maps); [R02.4/poitou-tate](#r024-poitou-tate); [D7/derived-tensor-and-tor](#d7-derived-tensor-and-tor); `FunctionFieldArithmetic:FA.4`

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.ArithmeticDuality.finiteCompactCochains` | The mapping fibre of the finite arithmetic localization map. |
| `TauCeti.ArithmeticDuality.finiteCompactCohomology` | Its cohomology in integer degree. |
| `TauCeti.ArithmeticDuality.finiteCompact_exact` | The long exact sequence of the localization fibre. |
| `TauCeti.ArithmeticDuality.finiteCompact_map` | Naturality in coefficients and the localization diagram. |

**Construction tests.**

- `finite_support_identity`: The mapping fibre of an identity localization is acyclic.
- `finite_support_no_local`: A zero local complex gives the original cochain complex.
- `finite_support_h0`: H⁰ of the fibre is the kernel of localization on H⁰ when the local complex has no negative cohomology.

**Uses.**

- ArithmeticGaloisDuality:D7: Finite starting point for compact limits and derived duality.
- PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22/6: Equal-characteristic duality and numerical formula.

**Acceptance.**

- The local terms are restriction morphisms, not just a list of cohomology groups.
- With no real dyadic contribution and nonempty finite S, H⁰_c=0.
- The finite theory is owned here; D7 adds compact and derived coefficient comparisons.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.3.1, pp. 122–123; §5.7.2–5.7.4, pp. 131–133. Finite mapping fibre and the real-place complete-cochain correction.
- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §8.6, Theorems 8.6.7 and 8.6.10, pp. 485–492. Finite global duality over number and function fields.

<a id="r023-absolute-and-relative-sha"></a>

### R02.3/absolute-and-relative-sha — Absolute and relative locally trivial groups

For finite discrete G_F-module M, define Shaⁱ(F,M) as the kernel of localization to the product over every place of F. For a finite Galois splitting field K/F define the relative Sha¹(K/F,M) by the kernel of finite-group restriction to all decomposition groups. In positive degrees one and two, complete real Tate groups agree with ordinary local cohomology; degree zero retains the explicit modified convention. Restriction and corestriction preserve these kernels by the decomposition-group and Mackey squares.

**Hypotheses.** F is a global field; for positive characteristic coefficients have order prime to char(F).; Every place is included, and the degree is fixed rather than treating modified H⁰ as ordinary invariants.

**Planet.** Locally trivial cohomology.

**Construction or proof.**

1. Use the existing cohomology and the actual product of local restriction maps; take its kernel.
2. For relative degree one restrict the finite Galois quotient to every decomposition subgroup.
3. Check restriction/corestriction against each local map using Mackey decomposition.

**Inputs.** [R02.3/localisation-maps](#r023-localisation-maps); `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`; `FunctionFieldArithmetic:FA.4`

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.ArithmeticDuality.absoluteSha` | Kernel of the full all-place localization map. |
| `TauCeti.ArithmeticDuality.relativeSha` | Kernel for finite-Galois quotient decomposition groups. |
| `TauCeti.ArithmeticDuality.mem_absoluteSha` | A class belongs exactly when all local restrictions vanish. |
| `TauCeti.ArithmeticDuality.sha_res_cor` | The local compatibility squares preserve the kernels. |

**Construction tests.**

- `absolute_sha_zero`: Zero coefficients give zero Sha.
- `absolute_sha_nonzero_local`: A nonzero localization excludes a class.
- `relative_sha_identity`: For the identity finite extension, relative H¹ and its kernel are zero.

**Uses.**

- PAPER-QIAN-23/018: Full absolute and relative kernels without restricting the place set.
- ArithmeticGaloisDuality:R02.4/all-place-sha-duality: Domain of the finite perfect pairing.

**Acceptance.**

- For the zero module the kernel is zero.
- Any class with one nonzero localization is excluded.
- The full G_F case is stated independently of a finite S.

**Sources.**

- [PAPER-QIAN-23](https://par.nsf.gov/servlets/purl/10388233), Proofs of Lemmas 2.1–2.2, pp. 1246–1247. Absolute and finite-Galois locally trivial groups.
- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §8.6, definition preceding Theorem 8.6.7, pp. 481–485. The all-place and restricted-ramification kernel conventions.

<a id="r023-exponent-two-ramification-field"></a>

### R02.3/exponent-two-ramification-field — Exponent-two ramification fields

For a number field F and a finite set S of finite places, F(S) is the maximal abelian extension of exponent two unramified at every finite place outside S. Ramification at real places is allowed. It is finite by the ray-class correspondence and the finite square-class description with valuation parity outside S. Inclusion of place sets gives inclusion of these fields; F(∅) can be larger than the everywhere-unramified-at-infinity field.

**Hypotheses.** The set S consists of finite places; no infinity splitting condition is imposed.; The field is an intermediate field of a fixed separable closure.

**Planet.** Exponent-two ramification fields.

**Construction or proof.**

1. Apply the existing abelian class-field correspondence to the maximal exponent-two quotient with finite ramification outside S.
2. Use Kummer and finitely generated S-units plus the finite class group to show finitely many relevant square classes.
3. Identify the compositum of quadratic extensions by the parity-of-valuation and dyadic conditions.

**Inputs.** [R02.3/restricted-ramification-group](#r023-restricted-ramification-group); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.ArithmeticDuality.exponentTwoField` | The maximal exponent-two subfield of the ramification compositum. |
| `TauCeti.ArithmeticDuality.exponentTwoField_mono` | Inclusion of finite ramification sets gives inclusion of fields. |
| `TauCeti.ArithmeticDuality.exponentTwoField_contains` | Every quadratic extension unramified at finite places outside S lies in F(S). |
| `TauCeti.ArithmeticDuality.exponentTwoField_finite` | The exponent-two ramification field is finite. |

**Construction tests.**

- `exponent_two_empty_Q`: The empty finite ramification set over Q gives Q.
- `exponent_two_imaginary`: Q(i) lies in Q({2}); infinity ramification is allowed.
- `exponent_two_all_quadratic`: Every quadratic field admitted by the finite-place predicate lies in the compositum.

**Uses.**

- PAPER-NEWTON-THORNE-26/small-degree-quadratic-field: Correct finite field in the auxiliary-prime argument.
- ArithmeticGaloisDuality:R02.3/one-new-prime-kummer: Compares the ramification fields after adjoining one prime.

**Acceptance.**

- For Q, F(∅)=Q.
- For Q and S={2}, Q(i) is permitted although ramified at infinity.
- Increasing S cannot shrink F(S).

**Sources.**

- [PAPER-NEWTON-THORNE-26](https://api.repository.cam.ac.uk/server/api/core/bitstreams/6bd9d94f-51d3-42e2-9cb1-ffc812189ac5/content), §5, Lemma 5.3 and proof, author pp. 39–40. The definition of F(S) and its unrestricted infinity convention.

<a id="r023-one-new-prime-kummer"></a>

### R02.3/one-new-prime-kummer — One new ramified prime and quadratic reciprocity

Let H/F be the ray class field of modulus 8∞ and let w∤2 split in H. There is a totally positive λ_w with w=(λ_w) and λ_w a square in each dyadic completion. For finite S of finite places with w∉S, if w splits in F(S)H, then F(S∪{w})=F(S)F(√λ_w). For distinct v,w∤2 outside S splitting in F(S)H, v splits in F(S∪{w}) if and only if w splits in F(S∪{v}).

**Hypotheses.** The modulus contains every real place; w is away from 2.; S may include dyadic places and F(S) allows infinity ramification.

**Planned declaration.** `TauCeti.ArithmeticDuality.oneNewPrimeKummer`.

**Construction or proof.**

1. Use the ray-class splitting dictionary to produce a generator congruent to 1 modulo 8 and positive at infinity.
2. Kummer square classes and Hilbert reciprocity bound the new exponent-two quotient by one; λ_w supplies the nontrivial class via its odd valuation at w.
3. All Hilbert symbols away from v,w vanish; reciprocity equates the two remaining quadratic residue symbols.

**Inputs.** [R02.3/exponent-two-ramification-field](#r023-exponent-two-ramification-field); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`

**Acceptance.**

- For Q a prime w≡1 mod8 has the required positive dyadic-square generator w.
- The extension ramifies at w, so the new quotient is nontrivial.
- A prime above 2 fails the stated argument.

**Sources.**

- [PAPER-NEWTON-THORNE-26](https://api.repository.cam.ac.uk/server/api/core/bitstreams/6bd9d94f-51d3-42e2-9cb1-ffc812189ac5/content), §5, Lemma 5.3 and proof, author pp. 39–40. The precise one-prime Kummer extension and symmetry of splitting.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Class-field and function-field application signatures” in the gap ledger.

<a id="r023-antiunit-class-field-rank"></a>

### R02.3/antiunit-class-field-rank — The antiunit class-field rank

In Newton–Thorne Lemma 3.4, for CM K/F and T the places above the chosen split finite place v₀, let Δ be the maximal abelian pro-p quotient unramified outside p and Δ₀ its quotient with T split. The Z_p-rank d₀ of the anti-invariant part of ker(Δ→Δ₀) equals the anti-invariant rank of the closure of O_{K,T}× in ∏_{v|p}O_{K_v}×(p). In the towers K₁⊆K₂ of the lemma the rank over K₂ is at least that over K₁. If the chosen totally real field contains an abelian subextension of odd degree d>1 in which v₀ splits, the Maire input used by the paper gives rank at least d; its exact general hypotheses require the source check recorded as a gap.

**Hypotheses.** Use exactly the CM tower, odd p and splitting/avoidance setup of Newton–Thorne Lemma 3.4.; The rank is that of a closure in local pro-p units; no Leopoldt hypothesis is inserted.; The lower-bound generalization is conditional on the unread Maire Proposition 19 and its addendum.

**Planned declaration.** `TauCeti.ArithmeticDuality.antiunitClassFieldRank`.

**Construction or proof.**

1. Use global Artin reciprocity to express the kernel imposed by splitting at T as the image of T-unit diagonals in p-adic units.
2. Take the c=−1 part; odd p makes its idempotent exact.
3. Use restriction/norm in the finite tower to prove the rank inequality.
4. For the degree-d lower bound obtain and check Maire Proposition 19 with its 2003 addendum; the currently read source only states its application.

**Inputs.** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`

**Acceptance.**

- The statement records a closure rather than identifying abstract unit rank with its p-adic image.
- The c=−1 projection uses p odd.
- The Maire dependency is a proof-source gap, not an established general theorem.

**Sources.**

- [PAPER-NEWTON-THORNE-26](https://api.repository.cam.ac.uk/server/api/core/bitstreams/6bd9d94f-51d3-42e2-9cb1-ffc812189ac5/content), §3, proof of Lemma 3.4, author pp. 16–17. The exact closure formula, tower inequality and cited antiunit lower bound.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Class-field and function-field application signatures” in the gap ledger.

<a id="r023-no-zp-extension-away-from-p"></a>

### R02.3/no-zp-extension-away-from-p — No Z_p-extension unramified at p

For a number field F, p prime and a finite set S of finite places disjoint from the places above p, the maximal abelian pro-p quotient unramified outside S has finite p-power torsion contribution from each tame local inertia group and a finite unramified quotient. It has no quotient Z_p^r for r>0. Consequently a finite-image characteristic-zero representation V of G_{F,S} has H¹_cts(G_{F,S},V)=0 after killing its finite image and descending by finite-index averaging.

**Hypotheses.** S is finite and excludes every place above p.; V is finite-dimensional over a finite extension of Q_p and its image is finite.; Possible real-place ramification contributes only finite 2-torsion.

**Planned declaration.** `TauCeti.ArithmeticDuality.noZpExtensionAwayFromP`.

**Construction or proof.**

1. Local reciprocity makes the pro-p inertia image away from p finite; the global unramified quotient is controlled by the finite class group.
2. A torsion-free Z_p quotient kills these finite inertia images and cannot survive the unramified quotient.
3. Restrict to an open normal subgroup acting trivially on V, identify H¹ with continuous homomorphisms to V, then descend using invertibility of the finite index in Q_p.

**Inputs.** [R02.2/finite-index-descent](#r022-finite-index-descent); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`

**Acceptance.**

- Removing the exclusion of primes above p is false: the cyclotomic Z_p-extension is a counterexample.
- An infinite ramification set is outside the statement.
- Do not assert vanishing for an arbitrary infinite-image representation.

**Sources.**

- [PAPER-CALEGARI-GERAGHTY-18](https://arxiv.org/pdf/1207.4224), §4, proof of Lemma 4.14, author pp. 52–53; journal pp. 367–368. The no-Z_p-extension argument and its finite-image cohomology consequence.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Class-field and function-field application signatures” in the gap ledger.

<a id="r023-function-field-finiteness-euler"></a>

### R02.3/function-field-finiteness-euler — Function-field arithmetic finiteness and Euler characteristic

For a global function field F of characteristic ℓ, p≠ℓ, nonempty finite S containing ramification and finite p-primary M, Hⁱ(G_{F,S},M) is finite, cd_p G_{F,S}≤2 and #H⁰·#H²/#H¹=1. For finite-dimensional k of characteristic p the alternating dimensions sum to zero. Finite compact support and local duality use ordinary finite-place terms and no archimedean factor.

**Hypotheses.** S is nonempty and finite; coefficients have order prime to char(F).; The coefficient field k is finite for cardinality conversion.

**Planned declaration.** `TauCeti.ArithmeticDuality.functionFieldFinitenessEuler`.

**Construction or proof.**

1. Use function-field places, prime-to-characteristic local duality and global reciprocity from FA.4.
2. Apply the same finite PT argument to prove finiteness and the cd2 bound.
3. The finite local/global Euler formula has no infinity contribution; convert cardinalities to dimensions.

**Inputs.** `FunctionFieldArithmetic:FA.4`; [R02.4/poitou-tate](#r024-poitou-tate); [R02.3/finite-compact-support](#r023-finite-compact-support)

**Acceptance.**

- There is no real-place correction in positive characteristic.
- For rank-one trivial k, the Euler dimension is zero.
- Do not infer this restricted-group cd bound for S empty.

**Sources.**

- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter VIII, §§3, 6–7, Theorems 8.6.10 and 8.7.9, pp. 490–516. Global-field finiteness, PT and numerical formulas.
- [PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22](https://arxiv.org/pdf/2008.12593), §2, p. 10. The positive-characteristic prime-to-p specialization used by the lifting argument.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Class-field and function-field application signatures” in the gap ledger.

## R02.4: Arithmetic duality and local–global obstruction groups

Finite local duality and the invariant normalization come from current ClassFieldTheory; this layer supplies the global class-formation/Ext, restricted-product topology and Poitou–Tate comparisons. Absolute all-place Sha is distinguished from restricted-ramification Sha. Lattice and rational duality is passed through finite coefficients with its limit topologies. The complete Wang special case records its dyadic obstruction and its order-doubling alternative. Root extraction uses an actual Brauer boundary and a prescribed-local field construction, with general Galois and soluble square-root assertions kept separate. Torus and abelian-variety duality keep their geometric Ext/topology inputs explicit. Tate H²(Q/Z) vanishing is a theorem for the full absolute Galois group with trivial coefficients; it is not a strict-dimension assertion for every G_{F,S}.

<a id="r024-discrete-module-ext"></a>

### R02.4/discrete-module-ext — Ext of discrete G-modules

For a profinite group G, the category DiscreteRep ℤ G of discrete G-modules is a Grothendieck abelian category, and Ext^r_G(M, N) is Mathlib's Abelian.Ext in it. Ext^r_G(ℤ, N) ≅ H^r(G, N) (continuousCohomology), naturally and compatibly with connecting maps; Ext has long exact sequences in both variables and a Yoneda product Ext^r_G(M, C) × H^s(G, M) → H^{r+s}(G, C). For finitely generated M there is a long exact sequence 0 → H¹(G, Hom(M, N)) → Ext¹_G(M, N) → H⁰(G, Ext¹(M, N)) → H²(G, Hom(M, N)) → ⋯, so Ext^r_G(M, N) ≅ H^r(G, Hom(M, N)) when N is divisible by the orders of the torsion elements of M. Ext commutes with compatible colimits (G = lim G_i, N = colim N_i, M finitely generated), and Ext^r_G(Ind_U^G M, N) ≅ Ext^r_U(M, N) for open U (Shapiro).

**Hypotheses.** G profinite; M finitely generated where stated.

**Construction or proof.**

1. DiscreteRep ℤ G is abelian with exact filtered colimits (computed on underlying groups) and generator ⊕_U ℤ[G/U]; so it has enough injectives (IsGrothendieckAbelian.enoughInjectives) and Ext groups (hasExt_of_enoughInjectives).
2. Ext^r_G(ℤ, −) and H^r(G, −) are universal δ-functors on discrete modules: H^r is effaceable by coinduced modules (ProfiniteCohomology Layers 7 and 10).
3. For finitely generated M, Hom(M, −) sends injectives to (−)^G-acyclic modules and Ext^s_ℤ(M, −) = 0 for s ≥ 2, so the two-row spectral sequence H^r(G, Ext^s(M, N)) ⇒ Ext^{r+s}_G(M, N) is the stated long exact sequence (Milne Example 0.8); divisibility kills Ext¹(M, N).
4. Hom_G(M, −) commutes with filtered colimits for finitely generated M; induction is left adjoint to restriction and both are exact, which gives Shapiro's isomorphism.

**Inputs.** `tauceti:TauCeti.DiscreteRep`; `mathlib:CategoryTheory.IsGrothendieckAbelian.enoughInjectives`; `mathlib:CategoryTheory.hasExt_of_enoughInjectives`; `mathlib:CategoryTheory.Abelian.Ext`; `mathlib:CategoryTheory.Abelian.Ext.comp`; `mathlib:CategoryTheory.Abelian.Ext.covariantSequence_exact`; `mathlib:continuousCohomology`

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.DiscreteExt.isGrothendieckAbelian` | DiscreteRep ℤ G is Grothendieck abelian, hence HasExt. |
| `TauCeti.DiscreteExt.Ext` | Ext^r_G(M, N) := Abelian.Ext M N r. |
| `TauCeti.DiscreteExt.extZeroEquiv` | Ext⁰_G(M, N) = Hom_G(M, N). |
| `TauCeti.DiscreteExt.extIntEquivCohomology` | Ext^r_G(ℤ, N) ≅ H^r(G, N), natural in N and compatible with connecting maps. |
| `TauCeti.DiscreteExt.yonedaPairing` | Ext^r_G(M, C) × H^s(G, M) → H^{r+s}(G, C), from Ext.comp. |
| `TauCeti.DiscreteExt.extEquivCohomologyHom` | M finitely generated, N divisible by the orders of the torsion of M: Ext^r_G(M, N) ≅ H^r(G, Hom(M, N)). |
| `TauCeti.DiscreteExt.ext_colimit` | For finitely generated M and a fixed profinite G, Ext^r_G(M,−) commutes with a sequential filtered coefficient colimit. The varying-quotient-G form of Milne Remark 0.10 remains an arithmetic integration obligation. |
| `TauCeti.DiscreteExt.extShapiro` | For U open, Ext^r_G(Ind_U^G M,N)≅Ext^r_U(M,Res_U N), on the existing induction and restriction carriers. |
| `TauCeti.DiscreteExt.ext_isTorsion` | Ext^r_G(M, N) is torsion for r ≥ 1 and M finitely generated. |

**Construction tests.**

- `ext_degree_zero`: Ext⁰(M,N) is the equivariant Hom group.
- `ext_int_first`: Ext¹(Z,N) is continuous H¹(G,N).
- `ext_divisibility_needed`: For G=1, Ext¹(Z/2,Z) is nonzero, so the Hom-cohomology comparison cannot omit divisibility.
- `ext_trivial_group`: For G=1 the higher Ext from Z vanishes.

**Uses.**

- ArithmeticGaloisDuality:R02.4/class-formation-ext-duality: the domain of the maps α^r(G, M)
- ArithmeticGaloisDuality:R02.4/ext-units-ideles: Ext of M into E_S and J_S
- ArithmeticGaloisDuality:R02.4/poitou-tate: the Ext(M^D, −) long exact sequence

**Acceptance.**

- Ext is Mathlib's Abelian.Ext in the category of discrete modules, not in all topological representations; the divisibility test shows when it reduces to cohomology.
- Arithmetic acceptance case: G = 1: Ext^r_G = Ext^r_ℤ, so Ext¹(ℤ/m, ℤ) = ℤ/m and Ext^r = 0 for r ≥ 2.
- Arithmetic acceptance case: Ext^r_G(ℤ, N) is Mathlib's continuousCohomology of N in degree r.
- Arithmetic acceptance case: G = 1, M = ℤ/m, N = ℤ: Ext¹(M, N) = ℤ/m but H¹(G, Hom(M, N)) = 0; the divisibility hypothesis cannot be dropped.
- Arithmetic acceptance case: Ext⁰_G(ℤ, N) = N^G.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §0, Example 0.8, p. 7 (PDF p. 15). The reduction Ext^r_G(M, N) = H^r(G, Hom(M, N)); Remark 0.10 (p. 8) gives torsion and colimits, Remark 0.11 Shapiro.

<a id="r024-class-formation-ext-duality"></a>

### R02.4/class-formation-ext-duality — Tate's duality theorem for a class formation

Let (G, C) be a P-class formation, ℓ ∈ P and M a finitely generated discrete G-module. The Yoneda pairing Ext^r_G(M, C) × H^{2−r}(G, M) → H²(G, C) followed by inv_G defines α^r(G, M) : Ext^r_G(M, C) → H^{2−r}(G, M)^*. (a) α^r(G, M)(ℓ) is bijective for r ≥ 2, and α¹(G, M)(ℓ) is bijective for torsion-free M; Ext^r_G(M, C)(ℓ) = 0 for r ≥ 4, and for r = 3 when M is torsion-free. (b) α¹(G, M)(ℓ) is bijective for all M if α¹(U, ℤ/ℓ^m) is bijective for every open U and every m. (c) α⁰(G, M) is surjective (bijective) for all finite ℓ-primary M if in addition every α⁰(U, ℤ/ℓ^m) is surjective (bijective). For M = ℤ, α⁰ is the reciprocity map C^G → G^ab and α² is inv_G.

**Hypotheses.** ℓ ∈ P; M finitely generated.

**Planned declaration.** `TauCeti.ArithmeticDuality.classFormationExtDuality`.

**Construction or proof.**

1. Lemma 1.9: for torsion-free M with N = Hom(M, ℤ), Ext^r_G(M, C) ≅ H^r(G, N ⊗ C) = colim_U H^r(G/U, N ⊗ C^U); by Tate–Nakayama (ClassFieldTheory Layer 3), cup product with u_{G/U} gives Ĥ^{r−2}(G/U, N) ≅ Ĥ^r(G/U, N ⊗ C^U), and the colimit along (U : V)·Inf of the torsion groups Ĥ^{r−2} has zero ℓ-part because ℓ^∞ divides every (G : U) (ℓ ∈ P).
2. Lemma 1.7: for M = ℤ and ℤ/m the maps α^r are described through rec_G (ClassFieldTheory Layer 4) and inv_G, since the Yoneda and cup-product pairings agree (ProfiniteCohomology Layer 12).
3. Embed M in M_* = Ind_U^G M with U acting trivially, cokernel M_1; Shapiro for Ext and for cohomology (discrete-module-ext, ProfiniteCohomology Layer 7) and the five lemma on the diagram (1.9.1), by descending induction on r.

**Inputs.** [R02.4/discrete-module-ext](#r024-discrete-module-ext); [R02.3/p-class-formation](#r023-p-class-formation)

**Acceptance.**

- Every statement is on ℓ-primary components for ℓ ∈ P.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §1, Theorem 1.13, p. 25 (PDF p. 33). Theorem 1.13, the P-class-formation form of Theorem 1.8 (p. 21), with Lemmas 1.7 and 1.9.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Arithmetic S-idele class-formation and Ext signatures” in the gap ledger.

<a id="r024-tate-global-duality"></a>

### R02.4/tate-global-duality — Tate's global duality for the S-idele classes

Let K be a number field, M a finitely generated discrete G_S-module and ℓ ∈ P. Then α^r(G_S, M)(ℓ) : Ext^r_{G_S}(M, C_S)(ℓ) → H^{2−r}(G_S, M)^*(ℓ) is an isomorphism for every r ≥ 1, and α⁰(G_S, M)(ℓ) is surjective for finite M.

**Hypotheses.** ℓ ∈ P.

**Planned declaration.** `TauCeti.ArithmeticDuality.tateGlobalDuality`.

**Construction or proof.**

1. s-idele-class-reciprocity: D_S(F) is divisible and 0 → D_S(F) → C_S(F) → Gal(K_S/F)^ab → 0 is exact for every finite F ⊆ K_S; with Lemma 1.7's description of α through the reciprocity map, α¹(U, ℤ/ℓ^m) is bijective and α⁰(U, ℤ/ℓ^m) is surjective for every open U ≤ G_S.
2. Apply class-formation-ext-duality (a)–(c) to the P-class formation (G_S, C_S) (s-class-formation).

**Inputs.** [R02.4/class-formation-ext-duality](#r024-class-formation-ext-duality); [R02.3/s-class-formation](#r023-s-class-formation); [R02.3/s-idele-class-reciprocity](#r023-s-idele-class-reciprocity)

**Acceptance.**

- Milne's Theorem 4.6(b), the kernel of α⁰ as a norm image of Hom(M, D_S(L)), is not planned: it needs L sufficiently large (ArithmeticGaloisDuality/E4), and poitou-tate obtains its first three terms by Pontryagin duality instead. Part (c) is for function fields and out of scope.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, proof of Theorem 4.6, p. 53 (PDF p. 61). Theorem 4.6(a) and the surjectivity of α⁰ for finite M.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Arithmetic S-idele class-formation and Ext signatures” in the gap ledger.

<a id="r024-finite-module-dual"></a>

### R02.4/finite-module-dual — The dual M^D = Hom(M, E_S)

For finite M of exponent m invertible outside S, the existing Tau Ceti InternalHom G M μ_m, with its existing homAction and evaluation pairing, identifies canonically with Hom(M,E_S) and Hom(M,Kˢ×). Evaluation gives M ≅ M^{DD}; the contravariant functor is exact and preserves cardinality. This is an arithmetic comparison of existing carriers, not another finite-dual definition.

**Hypotheses.** M finite; the isomorphism M ≅ M^{DD} needs #M to be a unit in R_{K,S}.

**Planned declaration.** `TauCeti.CompactCoefficients.homPt_equiv_internalHom`.

**Construction or proof.**

1. Hom(M, E_S) lands in the roots of unity of K_S; when m = #M is a unit in R_{K,S}, μ_m ⊆ K_S, so Hom(M, E_S) = Hom(M, μ_m) = Hom(M, K^{s×}).
2. It is Tau Ceti's InternalHom of a finite discrete module into a discrete one, with its equivariant evaluation pairing.
3. Hom(Hom(M, μ_m), μ_m) ≅ M for m-torsion M, as μ_m is cyclic of order m.

**Inputs.** `tauceti:TauCeti.InternalHom`; `tauceti:TauCeti.InternalHom.evalPairing`; `tauceti:TauCeti.KummerCoeff`; [R02.3/s-idele-class-modules](#r023-s-idele-class-modules)

**Acceptance.**

- The unit hypothesis appears in every statement that uses M ≅ M^{DD}.
- Existing-dual comparison: M^D := Hom(M, E_S) as a discrete G_S-module (Tau Ceti InternalHom).
- Existing-dual comparison: #M a unit in R_{K,S}: M^D ≅ Hom(M, μ_{#M}) = Hom(M, K^{s×}).
- Existing-dual comparison: The equivariant evaluation M^D × M → E_S (InternalHom.evalPairing).
- Existing-dual comparison: M ≅ M^{DD} by evaluation.
- Existing-dual comparison: M ↦ M^D is exact and contravariant on finite modules of order a unit in R_{K,S}.
- Existing-dual comparison: #M^D = #M when #M is a unit in R_{K,S}.
- Arithmetic acceptance case: (ℤ/m)^D = μ_m for m a unit in R_{K,S}.
- Arithmetic acceptance case: μ_m^D = ℤ/m with trivial action.
- Arithmetic acceptance case: K = ℚ, S = {∞}: K_S = ℚ and E_S = {±1}, so (ℤ/3)^D = Hom(ℤ/3, {±1}) = 0 and (ℤ/3)^{DD} ≠ ℤ/3; the hypothesis that #M is a unit in R_{K,S} is needed.
- Arithmetic acceptance case: M^D is Tau Ceti's InternalHom(M, μ_m) with its evaluation pairing.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, before Theorem 4.10, p. 56 (PDF p. 64). The dual M^D and M^{DD} ≅ M.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r024-archimedean-local-duality"></a>

### R02.4/archimedean-local-duality — Local duality at the archimedean places

Let G = Gal(ℂ/ℝ) and M a finite G-module with M^D = Hom(M, ℂ^×). Cup product gives a nondegenerate pairing of finite groups Ĥ^r(G, M^D) × Ĥ^{2−r}(G, M) → Ĥ²(G, ℂ^×) ≅ ½ℤ/ℤ for every r ∈ ℤ. For K_v = ℝ or ℂ and finite M, #H⁰(G_v, M) · #H⁰(G_v, M^D)/#H¹(G_v, M) = |#M|_v, with ordinary H⁰ and the normalised absolute value (|m|_v = m for v real, m² for v complex).

**Hypotheses.** M finite. The finitely generated case of Milne 2.13(a) is not needed here.

**Planned declaration.** `TauCeti.ArithmeticDuality.archimedeanLocalDuality`.

**Construction or proof.**

1. Odd-primary parts have zero Tate cohomology since #G = 2; by dévissage along a composition series (long exact sequences and the five lemma) reduce to M = ℤ/2 with trivial action.
2. For M = ℤ/2 both sides are ℤ/2 in every degree and the pairing is computed directly with the periodicity of Tate cohomology of a cyclic group (Tau Ceti tateCohomologyIsoEven/Odd); Ĥ²(G, ℂ^×) = Br(ℝ) ≅ ½ℤ/ℤ (ClassFieldTheory Layer 10).
3. Euler formula: the complex case is immediate; in the real case 1 − σ on M^D is adjoint to 1 + σ on M, and the Herbrand quotient of a finite module is 1.

**Inputs.** `mathlib:tateCohomology`; `tauceti:Rep.FiniteCyclicGroup.tateCohomologyIsoEven`; `tauceti:Rep.FiniteCyclicGroup.tateCohomologyIsoOdd`; `tauceti:TauCeti.TateCohomology.herbrandQuotient_eq_one_of_finite`

**Acceptance.**

- The pairing lands in Ĥ²(Gal(ℂ/ℝ), ℂ^×) = ½ℤ/ℤ; the Euler formula uses ordinary H⁰.
- The arithmetic invariant normalization is imported from current ClassFieldTheory Layer 10; this target supplies the complete Tate/ordinary-H0 comparison needed in global duality and Euler formulas.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §2, proof of Theorem 2.13, p. 35 (PDF p. 43). Theorem 2.13(a), (c) for finite M.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Finite arithmetic localization, duality and Euler signatures” in the gap ledger.

<a id="r024-unramified-exact-annihilators"></a>

### R02.4/unramified-exact-annihilators — Unramified classes are exact annihilators

Let v be a finite place of K and M a finite G_v-module, unramified at v, of order prime to the residue characteristic of v. Then M^D is unramified, and H¹_un(K_v, M) and H¹_un(K_v, M^D) are exact annihilators of each other under the local Tate pairing H¹(K_v, M) × H¹(K_v, M^D) → H²(K_v, μ) ≅ ℚ/ℤ.

**Hypotheses.** #M prime to the residue characteristic; M unramified.

**Planned declaration.** `TauCeti.ArithmeticDuality.unramifiedExactAnnihilators`.

**Construction or proof.**

1. M^D = Hom(M, μ_m) is unramified, as μ_m ⊆ K_v^un for m prime to the residue characteristic.
2. Orthogonality: the cup product of two inflated classes is inflated from H²(g_v, μ_m) = 0 (ProfiniteCohomology Layers 11 and 12).
3. #H¹(g_v, N) = #H⁰(g_v, N) for finite N (the sequence 0 → N^{Frob} → N → N → N_{Frob} → 0), so #H¹_un(M) · #H¹_un(M^D) = #H⁰(K_v, M) · #H⁰(K_v, M^D).
4. Local duality gives #H²(K_v, M) = #H⁰(K_v, M^D), and the local Euler characteristic with |#M|_v = 1 gives #H¹(K_v, M) = #H⁰(K_v, M) · #H⁰(K_v, M^D) (ClassFieldTheory Layer 5). The two orthogonal subgroups have complementary orders, so each is the annihilator of the other.

**Inputs.** [R02.3/localisation-maps](#r023-localisation-maps)

**Acceptance.**

- Only for #M prime to the residue characteristic; the counting proof uses ClassFieldTheory's local duality and Euler characteristic instead of the source's Ext argument.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §2, Theorem 2.6, p. 30 (PDF p. 38). Theorem 2.6 for finite M.
- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §2, proof of Theorem 2.6, p. 31 (PDF p. 39). The counting proof planned here.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Finite arithmetic localization, duality and Euler signatures” in the gap ledger.

<a id="r024-restricted-product-cohomology"></a>

### R02.4/restricted-product-cohomology — Restricted products of local cohomology and Ш^r_S

The arithmetic local family uses Mathlib RestrictedProduct with Hⁱ_un at finite unramified places and complete Tate cohomology at infinity. P⁰ has the compact product topology; P¹ has the locally compact restricted-product topology; for finite coefficients Pⁱ (i≥2) is a discrete direct sum. Locally trivial classes are ker β, where β is the actual sum of restriction maps. The generic topology and sum/product dictionary are imported from the current Completed/RestrictedProducts roadmap.

**Hypotheses.** Torsion order of M a unit in R_{K,S}.

**Construction or proof.**

1. Lemma 4.8: a class comes from H^r(Gal(L/K), M) for a finite Galois L ⊆ K_S, and at v unramified in L its localisation is unramified.
2. H¹(K_v, M) is finite for finite v (ClassFieldTheory Layer 5, finite_H), so P¹_S is locally compact with the restricted-product topology (Mathlib RestrictedProduct.topologicalSpace).

**Inputs.** [R02.3/localisation-maps](#r023-localisation-maps); `mathlib:RestrictedProduct`; `mathlib:RestrictedProduct.topologicalSpace`

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.PoitouTate.restrictedProductCohomology` | P^r_S(K, M) as Mathlib's RestrictedProduct of the H^r(K_v, M) over H^r_un(K_v, M). |
| `TauCeti.PoitouTate.beta` | β^r : H^r(G_S, M) → P^r_S(K, M), the product of the loc_v. |
| `TauCeti.PoitouTate.sha` | Ш^r_S(K, M) := ker β^r. |
| `TauCeti.PoitouTate.compactSpace_P0` | P⁰_S(K, M) is compact for finite M. |
| `TauCeti.PoitouTate.locallyCompactSpace_P1` | P¹_S(K, M) is locally compact. |
| `TauCeti.PoitouTate.restrictedProductCohomology_eq_sum` | For finite M and r ≥ 2, P^r_S(K, M) = ⊕_{v∈S} H^r(K_v, M), discrete. |
| `TauCeti.PoitouTate.sha_map` | Ш^r_S is functorial in M and under restriction to a finite F ⊆ K_S. |
| `TauCeti.PoitouTate.finite_restrictedProductCohomology` | S and M finite: P^r_S(K, M) is finite. |

**Construction tests.**

- `rp_finite_pi`: For a finite index set the restricted product is the full product.
- `rp_zero_local`: If every localization is zero, the Sha kernel is the entire global group.
- `rp_modified_real`: Real Tate H⁰(C₂,Z/2) is nonzero, retaining the dyadic real contribution.
- `rp_direct_sum`: Over N the restricted product of Z with zero distinguished subgroups is the direct sum.

**Uses.**

- ArithmeticGaloisDuality:R02.4/poitou-tate: the middle terms of the nine-term sequence
- ArithmeticGaloisDuality:R02.4/h1-localisation-proper: the topology on P¹_S
- SelmerIwasawaCohomology:L2/galois-selmer-group: Ш as the Selmer group with the zero local conditions

**Acceptance.**

- Ш^r_S uses the modified archimedean groups; for r = 1, 2 they are ordinary cohomology, matching Harpaz–Wittenberg's Ш.
- Arithmetic acceptance case: K = ℚ, S = {2, ∞}, M = ℤ/2: Ш¹_S = 0, since ℚ(√−1), ℚ(√2) and ℚ(√−2) are ramified at 2.
- Arithmetic acceptance case: Milne Example 4.11(i): Ш¹_S(K, ℤ/m) = 0 when S has density > 1/2 (Chebotarev).
- Arithmetic acceptance case: Harpaz–Wittenberg §7: over ℚ with S all places, Ш¹(ℚ, μ_4) = 0, and so Ш²(ℚ, ℤ/4) = 0.
- Arithmetic acceptance case: K = ℚ, S = {3, ∞}, M = ℤ/3: P⁰_S = H⁰(ℚ_3, ℤ/3) × Ĥ⁰(ℝ, ℤ/3) = ℤ/3; with ordinary H⁰ at ∞ one would get (ℤ/3)², and β⁰ would not have the dual cokernel.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, statement of the main theorem, p. 55 (PDF p. 63). P^r_S, Lemma 4.8, and Ш^r_S (p. 56).
- [HARPAZ-WITTENBERG-23](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §7, before Lemma 7.6, p. 28 (author final version). Ш over all places of ℚ, with the modified real terms of items 120–121 of the extraction.

<a id="r024-h1-localisation-proper"></a>

### R02.4/h1-localisation-proper — β¹ is proper

For a finite G_S-module M, the inverse image under β¹_S(K, M) of every compact subset of P¹_S(K, M) is finite; in particular Ш¹_S(K, M) is finite.

**Hypotheses.** M finite.

**Planned declaration.** `TauCeti.ArithmeticDuality.h1LocalisationProper`.

**Construction or proof.**

1. Restriction to a finite F ⊆ K_S splitting M has finite kernel H¹(Gal(F/K), M) (inflation–restriction), so assume G_S acts trivially on M.
2. Every compact subset of P¹_S lies in some P(T) = ∏_{v∈S∖T} H¹(K_v, M) × ∏_{v∈T} H¹_un(K_v, M) with S ∖ T finite (Tychonoff).
3. An element of β¹^{-1}(P(T)) is a homomorphism f : G_S → M whose fixed field is unramified at every v ∈ T, so unramified outside the finite set S ∖ T, of degree dividing #M: finitely many by hermite-unramified-outside-finite.

**Inputs.** [R02.4/restricted-product-cohomology](#r024-restricted-product-cohomology); [R02.3/hermite-unramified-outside-finite](#r023-hermite-unramified-outside-finite)

**Acceptance.**

- Gives finiteness of Ш¹_S(K, M) for finite M and every S.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Lemma 4.9, p. 56 (PDF p. 64). Lemma 4.9 and its proof.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Finite arithmetic localization, duality and Euler signatures” in the gap ledger.

<a id="r024-restricted-product-self-duality"></a>

### R02.4/restricted-product-self-duality — P^r_S(K, M) is dual to P^{2−r}_S(K, M^D)

For a finite G_S-module M of order a unit in R_{K,S} and every r, the sum over v ∈ S of the local pairings H^r(K_v, M) × H^{2−r}(K_v, M^D) → ℚ/ℤ identifies P^r_S(K, M) with the Pontryagin dual of P^{2−r}_S(K, M^D), algebraically and topologically. Hence there are continuous maps γ^r = γ^r_S(K, M^D) : P^r_S(K, M^D) → H^{2−r}(G_S, M)^*, γ^r the dual of β^{2−r}.

**Hypotheses.** #M a unit in R_{K,S}.

**Planned declaration.** `TauCeti.ArithmeticDuality.restrictedProductSelfDuality`.

**Construction or proof.**

1. Finite v: local Tate duality (ClassFieldTheory Layer 5); archimedean v: archimedean-local-duality.
2. The dual of a product of finite groups is the direct sum of their duals, which gives P⁰ against P²; for r = 1, at almost all v the module is unramified of order prime to v, and H¹_un(M), H¹_un(M^D) are exact annihilators (unramified-exact-annihilators), so the dual of the restricted product relative to H¹_un(M) is the restricted product relative to the annihilators H¹_un(M^D) (Pontryagin duality, Mathlib PontryaginDual).

**Inputs.** [R02.4/restricted-product-cohomology](#r024-restricted-product-cohomology); [R02.4/finite-module-dual](#r024-finite-module-dual); [R02.4/archimedean-local-duality](#r024-archimedean-local-duality); [R02.4/unramified-exact-annihilators](#r024-unramified-exact-annihilators); `mathlib:PontryaginDual`; `mathlib:RestrictedProduct`

**Acceptance.**

- The duality is topological: P⁰ compact against P² discrete, and P¹ locally compact against itself.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, before Theorem 4.10, p. 56 (PDF p. 64). The duality of the restricted products and the maps γ^r.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Finite arithmetic localization, duality and Euler signatures” in the gap ledger.

<a id="r024-ext-units-ideles"></a>

### R02.4/ext-units-ideles — Ext into the S-units and the S-ideles

Let M be a finitely generated G_S-module whose torsion order is a unit in R_{K,S}, and M^d = Hom(M, E_S) (Hom(M, Ô_v^{un×}) at v ∉ S, Hom(M, K_v^{s×}) at v ∈ S). (a) Ext^r_{G_S}(M, E_S) = H^r(G_S, M^d) for r ≥ 0. (b) For v ∉ S, H^r(g_v, M^d) = Ext^r_{g_v}(M, Ô_v^{un×}), and both vanish for r ≥ 2. (c) If M is finite or S omits only finitely many places, Hom_{G_S}(M, J_S) = ∏_{v∈S} H⁰(G_v, M^d) and Ext^r_{G_S}(M, J_S) = P^r_S(K, M^d) for r ≥ 1.

**Hypotheses.** Torsion order of M a unit in R_{K,S}; in (c), M finite or S cofinite.

**Planned declaration.** `TauCeti.ArithmeticDuality.extUnitsIdeles`.

**Construction or proof.**

1. (a): E_S is divisible by the units of R_{K,S} (s-unit-kummer-sequence), so the reduction of discrete-module-ext applies.
2. (b): Ô_v^{un×} is divisible by #M_tors and cohomologically trivial (ClassFieldTheory Layer 6), with an injective resolution of length one.
3. (c): J_S = colim_{F,T} J_{F,S⊃T}, with J_{F,S⊃T} = ∏_{w∈T} F_w^× × ∏_{w∈S∖T} Ô_w^× over finite T ⊆ S containing the archimedean and ramified places; Ext commutes with the colimit and with products in the second variable, and Shapiro reduces to the decomposition groups. At v ∈ S ∖ T use (b); at v ∈ T, Ext^r_{G_v}(M, K_v^{s×}) = H^r(G_v, M^d) (ClassFieldTheory Layer 5).

**Inputs.** [R02.4/discrete-module-ext](#r024-discrete-module-ext); [R02.3/s-idele-class-modules](#r023-s-idele-class-modules); [R02.3/s-unit-kummer-sequence](#r023-s-unit-kummer-sequence); [R02.4/restricted-product-cohomology](#r024-restricted-product-cohomology)

**Acceptance.**

- Remark 4.14: K = ℚ, S = {∞}, M = ℤ gives Ext²_{G_S}(ℤ, J_S) = 0 but P²_S(K, M^d) = H²(Gal(ℂ/ℝ), ℂ^×) = ½ℤ/ℤ; the hypotheses of (c) cannot be dropped.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Lemmas 4.12 and 4.13, p. 59 (PDF p. 67). Lemmas 4.12 and 4.13.
- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Remark 4.14, p. 61 (PDF p. 69). The counterexample, kept as an acceptance test.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Arithmetic S-idele class-formation and Ext signatures” in the gap ledger.

<a id="r024-poitou-tate"></a>

### R02.4/poitou-tate — Poitou–Tate duality and the nine-term exact sequence

Let K be a number field and M a finite G_S-module whose order is a unit in R_{K,S}. (a) Ш¹_S(K, M) and Ш²_S(K, M^D) are finite, and there is a canonical nondegenerate pairing Ш¹_S(K, M) × Ш²_S(K, M^D) → ℚ/ℤ. (b) β⁰ is injective, γ² is surjective, and im β^r = ker γ^r for r = 0, 1, 2, so that 0 → H⁰(G_S, M) → P⁰_S(K, M) → H²(G_S, M^D)^* → H¹(G_S, M) → P¹_S(K, M) → H¹(G_S, M^D)^* → H²(G_S, M) → P²_S(K, M) → H⁰(G_S, M^D)^* → 0 is an exact sequence of locally compact groups (finite, compact, compact / compact, locally compact, discrete / discrete, discrete, finite). (c) For r ≥ 3, β^r : H^r(G_S, M) → ⊕_{v real} H^r(K_v, M) is bijective. The pairing in (a) is natural in M: for f : M → N, ⟨f_* a, b⟩ = ⟨a, f^D_* b⟩, and it is given by the cochain formula ⟨a, a′⟩ = Σ_v inv_v(c_v).

**Hypotheses.** #M a unit in R_{K,S}; S ⊇ the archimedean places, possibly infinite; archimedean terms are the modified (Tate) groups.

**Planned declaration.** `TauCeti.ArithmeticDuality.poitouTate`.

**Planet.** Poitou–Tate duality.

**Construction or proof.**

1. Take the long exact Ext_{G_S}(M^D, −) sequence of 0 → E_S → J_S → C_S → 0.
2. Replace Ext^r(M^D, E_S) = H^r(G_S, M) and Ext^r(M^D, J_S) = P^r_S(K, M) for r ≥ 1 (ext-units-ideles, M^{Dd} = M), and Ext^r(M^D, C_S) = H^{2−r}(G_S, M^D)^* for r ≥ 1 (tate-global-duality; the primes dividing #M are units in R_{K,S}, hence in P). This gives exactness from H¹(G_S, M) on and the isomorphisms H^r(G_S, M) ≅ ⊕_{v real} H^r(K_v, M) for r ≥ 4.
3. P²_S(K, M) → H⁰(G_S, M^D)^* is surjective, being dual to the injection H⁰(G_S, M^D) → P⁰_S(K, M^D) (S contains a finite place when M ≠ 0); with the previous step this gives (c) at r = 3.
4. The first three terms: dualise the exact sequence H²(G_S, M^D) → P²_S(K, M^D) → H⁰(G_S, M)^* → 0 (the previous steps for M^D) using restricted-product-self-duality and the exactness of Pontryagin duality on these locally compact groups; this is the source's alternative on p. 62 and avoids Theorem 4.6(b) (ArithmeticGaloisDuality/E4).
5. (a): exactness identifies Ш¹_S(K, M) with the dual of Ш²_S(K, M^D); Ш¹ is finite by h1-localisation-proper, hence so is Ш².
6. Naturality and the cochain formula: the Ext sequence is natural in M^D, and the Yoneda and cup pairings are natural (ProfiniteCohomology Layer 12).

**Inputs.** [R02.4/ext-units-ideles](#r024-ext-units-ideles); [R02.4/tate-global-duality](#r024-tate-global-duality); [R02.4/restricted-product-self-duality](#r024-restricted-product-self-duality); [R02.4/h1-localisation-proper](#r024-h1-localisation-proper); [R02.4/finite-module-dual](#r024-finite-module-dual); [R02.4/restricted-product-cohomology](#r024-restricted-product-cohomology); [R02.3/s-idele-class-modules](#r023-s-idele-class-modules); `mathlib:PontryaginDual`

**Acceptance.**

- The first three terms are obtained without Theorem 4.6(b).
- Serves the requests to R02.4 of GlobalGaloisDeformations (R04.3, R04.5, G7, G8) and NoncommutativeAndEquivariantIwasawa (NE.4), and Harpaz–Wittenberg's items 120–121.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Theorem 4.10, p. 56 (PDF p. 64). Theorem 4.10 (a)–(c) and the exact sequence (p. 57).
- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, end of the proof of Theorem 4.10, p. 62 (PDF p. 70). The route planned for the first three terms.
- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, an explicit description of the pairing, p. 65 (PDF p. 73). The cochain formula for the pairing of Ш¹ and Ш².
- [HARPAZ-WITTENBERG-23](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §7, proof of Lemma 7.7, p. 29 (author final version). Items 120–121 of the extraction: the Ш pairing, natural in the coefficient module, used with the modified real terms.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Finite arithmetic localization, duality and Euler signatures” in the gap ledger.

<a id="r024-h2-localisation-surjective"></a>

### R02.4/h2-localisation-surjective — Surjectivity of H² onto finitely many local H²

Let M be a finite G_S-module whose order is a unit in R_{K,S}, and T ⊆ S finite, omitting at least one finite place of S. Then H²(G_S, M) → ⊕_{v∈T} H²(G_v, M) is surjective. In particular H²(K, M) → ⊕_{v real} H²(K_v, M) is surjective.

**Hypotheses.** #M a unit in R_{K,S}; T omits a finite place v₀ of S.

**Planned declaration.** `TauCeti.ArithmeticDuality.h2LocalisationSurjective`.

**Construction or proof.**

1. By poitou-tate (b) the image of β² is the orthogonal complement of the image of β⁰ in the duality between P⁰_S(K, M^D) and P²_S(K, M) (restricted-product-self-duality).
2. Given a ∈ P²_S(K, M), let χ be the character of P⁰_S(K, M^D) it defines; H⁰(G_S, M^D) → H⁰(K_{v₀}, M^D) is injective, so the restriction of χ to H⁰(G_S, M^D) extends to H⁰(K_{v₀}, M^D). Correcting a at v₀ by the element of H²(K_{v₀}, M) dual to that extension (ClassFieldTheory Layer 5) makes a orthogonal to im β⁰, hence in im β².

**Inputs.** [R02.4/poitou-tate](#r024-poitou-tate); [R02.4/restricted-product-self-duality](#r024-restricted-product-self-duality)

**Acceptance.**

- T omits a finite place of S; the real-place case gives H²(K, M) → ⊕_{v real} H²(K_v, M) surjective.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Corollary 4.16, p. 62 (PDF p. 70). Corollary 4.16 and its proof.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Finite arithmetic localization, duality and Euler signatures” in the gap ledger.

<a id="r024-units-cohomology-high-degree"></a>

### R02.4/units-cohomology-high-degree — High-degree cohomology of the S-units

For a prime ℓ that is a unit in R_{K,S} and r ≥ 3, H^r(G_S, E_S)(ℓ) → ⊕_{v real} H^r(G_v, K_v^{s×})(ℓ) is an isomorphism; in particular H^r(G_S, E_S)(ℓ) = 0 if ℓ or r is odd. With S the set of all places, H³(K, K^{s×}) = 0 for every number field K.

**Hypotheses.** ℓ a unit in R_{K,S}.

**Planned declaration.** `TauCeti.ArithmeticDuality.unitsCohomologyHighDegree`.

**Construction or proof.**

1. From 0 → E_S → K_S^× → Div_S → 0 (s-unit-kummer-sequence) and 0 → Br(K) → ⊕_v Br(K_v) → ℚ/ℤ (ClassFieldTheory Layer 10), H²(G_S, E_S) → ⊕_{v real} Br(K_v) is surjective.
2. The Kummer sequence 0 → μ_{ℓ^n} → E_S → E_S → 0 and poitou-tate (c) for μ_{ℓ^n} give a map of exact rows ending in H³(G_S, E_S)_{ℓ^n} and ⊕_{v real} H³(G_v, K_v^{s×})_{ℓ^n}; the five lemma gives r = 3, and induction along the continued diagram gives r > 3.
3. For r odd, H^r(G_v, ℂ^×) = Ĥ¹(ℤ/2, ℂ^×) = 0 at a real place (Hilbert 90 and periodicity); for ℓ odd the ℓ-part of the Tate cohomology of ℤ/2 vanishes. With S all places every ℓ is a unit, and H³ is torsion, so H³(K, K^{s×}) = 0.

**Inputs.** [R02.4/poitou-tate](#r024-poitou-tate); [R02.3/s-unit-kummer-sequence](#r023-s-unit-kummer-sequence); [R02.3/s-idele-class-modules](#r023-s-idele-class-modules); `tauceti:Rep.FiniteCyclicGroup.tateCohomologyIsoOdd`

**Acceptance.**

- Serves Harpaz–Wittenberg's item 154, H³(k, k̄^×) = 0, with the real places kept rather than through a cd₂ = 2 statement.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Corollary 4.18, p. 63 (PDF p. 71). Corollary 4.18.
- [HARPAZ-WITTENBERG-23](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §3, Remark 3.1, p. 9 (author final version). Item 154 of the extraction: the vanishing of H³(k, k̄^×), including fields with real places.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Arithmetic S-idele class-formation and Ext signatures” in the gap ledger.

<a id="r024-decomposition-map-surjective"></a>

### R02.4/decomposition-map-surjective — Surjectivity of the decomposition map

Let G be a finite group, K a finite extension of ℚ_p containing the |G|-th roots of unity, with residue field k. The decomposition map d : R_K(G) → R_k(G) is surjective and commutes with induction from subgroups.

**Hypotheses.** K large enough: it contains the |G|-th roots of unity.

**Planned declaration.** `TauCeti.ArithmeticDuality.decompositionMapSurjective`.

**Construction or proof.**

1. Brauer's induction theorem (every virtual character is a ℤ-combination of characters induced from elementary subgroups; Tau Ceti InductionRestriction Layer 6) and compatibility of d with induction reduce to G elementary, G = C × P with C cyclic of order prime to p and P a p-group.
2. For such G every simple k[G]-module is inflated from C (P acts trivially on simple modules in characteristic p), and every k[C]-module lifts to K since #C is prime to p.



**Acceptance.**

- Used only after tensoring with ℚ, in modular-cyclic-induction.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §2, proof of Lemma 2.10, p. 32 (PDF p. 40). Brauers theorem as the source uses it, cited to Serres Linear representations.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Arithmetic S-idele class-formation and Ext signatures” in the gap ledger.

<a id="r024-modular-cyclic-induction"></a>

### R02.4/modular-cyclic-induction — R_{𝔽_p}(G) ⊗ ℚ is induced from cyclic p′-subgroups

For a finite group G, R_{𝔽_p}(G) ⊗ ℚ is generated by the images of Ind_H^G : R_{𝔽_p}(H) ⊗ ℚ → R_{𝔽_p}(G) ⊗ ℚ as H runs over the cyclic subgroups of G of order prime to p.

**Hypotheses.** G finite.

**Planned declaration.** `TauCeti.ArithmeticDuality.modularCyclicInduction`.

**Construction or proof.**

1. Artin's induction theorem: in characteristic 0, #G times every virtual character is an integral combination of characters induced from cyclic subgroups (TauCeti.ClassFunction.natCard_nsmul_mem_indVirtualCharacters_isCyclic).
2. decomposition-map-surjective transfers this to R_k(G) ⊗ ℚ for a large finite field k, and restriction of scalars from k to 𝔽_p to R_{𝔽_p}(G) ⊗ ℚ.
3. For a cyclic H = H′ × H_p with H_p a p-group, every simple 𝔽_p[H]-module is inflated from H′, so Ind_H^G of it is Ind_{H′}^G of a module in R_{𝔽_p}(H′) ⊗ ℚ.

**Inputs.** `tauceti:TauCeti.ClassFunction.natCard_nsmul_mem_indVirtualCharacters_isCyclic`; [R02.4/decomposition-map-surjective](#r024-decomposition-map-surjective)

**Acceptance.**

- The statement is about R_{𝔽_p}(G) ⊗ ℚ, not R_{𝔽_p}(G).

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §2, Lemma 2.10, p. 32 (PDF p. 40). Lemma 2.10 and its proof.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Arithmetic S-idele class-formation and Ext signatures” in the gap ledger.

<a id="r024-lattice-rational-poitou-tate"></a>

### R02.4/lattice-rational-poitou-tate — Poitou–Tate for lattices and rational coefficients

For a finite free Z_p-lattice T with continuous G_{F,S}-action, put V=T⊗Q_p and W=V/T, and T^D=Hom(T,Q_p/Z_p)(1). Finite PT for T/pⁿT passes to the lattice–torsion duality sequence using compact inverse limits on the lattice side and discrete direct limits on the dual side. Each global and local comparison includes 0→lim¹H^{i−1}(T/pⁿ)→Hⁱ_cts(T)→limHⁱ(T/pⁿ)→0 until finiteness removes lim¹. Rationalization then yields the Q_p-linear PT sequence and finite-dimensional duality. The local coefficient regimes, unramified subgroups and topology are transported by these specific limits, not by an unspecified completed product.

**Hypotheses.** F is a number field, S finite contains p, infinity and ramification; T finite free.; Use the complete real-place correction when p=2 and real places occur; bounded rational comparison holds after inverting p.; Compact/discrete duals use Pontryagin/Matlis duality; rational duals use Q_p-linear duality.

**Planned declaration.** `TauCeti.ArithmeticDuality.latticeRationalPoitouTate`.

**Planet.** Lattice Poitou–Tate duality.

**Construction or proof.**

1. Write the finite nine-term sequences with transition maps adjoint under finite evaluation.
2. Use the Milnor sequence at each cochain complex and the lattice/torsion exact sequence; finite arithmetic cohomology gives ML of the relevant tower.
3. Use inverse limits of compact finite exact sequences and exact direct limits on discrete duals; account for local unramified subgroups by the same finite reductions.
4. Rationalize the actual maps using bounded compact images and verify invariant-sum normalization.

**Inputs.** [R02.4/poitou-tate](#r024-poitou-tate); [R02.1/milnor-sequence](#r021-milnor-sequence); [R02.1/tate-inverse-limit](#r021-tate-inverse-limit); [R02.1/rationalization](#r021-rationalization); [R02.1/lattice-torsion-sequence](#r021-lattice-torsion-sequence); [D7/compact-support-without-p](#d7-compact-support-without-p)

**Acceptance.**

- Display every lim¹ term before invoking a vanishing lemma.
- A finite coefficient reduction agrees with finite PT.
- For real dyadic fields rationalization kills the real Tate correction.

**Sources.**

- [RUBIN-ES](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §2, Propositions 2.3–2.5, pp. 151–152; §3, pp. 153–154. Compact, rational and torsion comparisons used in arithmetic duality.
- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §§5.2, 5.4, 5.7, pp. 116–133. Lattice/cofinite duality diagrams and real-place correction.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “All-place duality, roots and geometric-coefficient signatures” in the gap ledger.

<a id="r024-all-place-sha-duality"></a>

### R02.4/all-place-sha-duality — All-place Sha duality and transfer adjunction

For a global field F and finite module M of exponent m prime to char(F), with M^D=Hom(M,μ_m), the full absolute all-place kernels Sha¹(F,M^D) and Sha²(F,M) are finite and perfectly paired by cup product and the sum of local invariants. In number fields use complete real Tate groups, which agree with ordinary local H¹ and H². For every finite extension L/F, restriction and corestriction preserve these kernels and ⟨cor x,y⟩_F=⟨x,res y⟩_L; coefficient maps have the corresponding dual adjunction.

**Hypotheses.** The field group is G_F and every place is included; this is not a finite-S assertion.; M is finite and prime to positive characteristic.; The finite dual carries the contragredient cyclotomic action.

**Planned declaration.** `TauCeti.ArithmeticDuality.allPlaceShaDuality`.

**Planet.** All-place Sha duality.

**Construction or proof.**

1. Enlarge finite S to contain the ramification of a representative and then compare all-place kernels using the unramified annihilators.
2. Apply finite PT or the all-place class-formation theorem directly to obtain the finite pairing.
3. Compare cup product, transfer and invariant sums using the projection formula and local degree normalization.

**Inputs.** [R02.3/absolute-and-relative-sha](#r023-absolute-and-relative-sha); [R02.4/poitou-tate](#r024-poitou-tate); [R02.4/finite-module-dual](#r024-finite-module-dual); [R02.2/finite-index-descent](#r022-finite-index-descent); `FunctionFieldArithmetic:FA.4`

**Acceptance.**

- Q with μ_4 has Sha¹=0, hence Sha²(Q,Z/4)=0.
- For CM fields the real terms disappear.
- Restriction is adjoint to corestriction with no unexplained degree factor.

**Sources.**

- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §8.6, Theorem 8.6.7 and the explicit pairing, pp. 485–489. Finite all-place perfect pairing and functorial normalization.
- [PAPER-QIAN-23](https://par.nsf.gov/servlets/purl/10388233), Proof of Lemma 2.1, p. 1246. The full absolute pairing and Res/Cor adjunction.
- [PAPER-HARPAZ-WITTENBERG-23](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §7, Lemmas 7.6–7.7, pp. 28–30. Coefficient naturality in the all-place case.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “All-place duality, roots and geometric-coefficient signatures” in the gap ledger.

<a id="r024-grunwald-wang"></a>

### R02.4/grunwald-wang — Grunwald–Wang with its exact dyadic obstruction

Let F be a number field, S finite and local finite-order characters χ_v:F_v×→C× of orders with least common multiple n. There is a global character with these local restrictions and order n, except in the Wang special case when the product obstruction is −1; in that case order 2n is attainable and order n is impossible. Write s_F≥2 for the maximal real 2-power cyclotomic level in F, η_s=ζ_{2ˢ}+ζ_{2ˢ}^{−1}, and S_F for dyadic v where F_v(μ_{2^{s_F+1}})/F_v is biquadratic. The special case is F(μ_{2^{s_F+1}})/F biquadratic, v₂(n)>s_F and S⊇S_F. Its power kernel is generated by a=(2+η_{s_F})^{n/2}, and the obstruction is ∏_{v∈S_F}χ_v(a). Outside this case the power kernel away from S is trivial. At real places the local characters must have the stated parity.

**Hypotheses.** Local characters are continuous and of finite order; the global character is an idele class character.; The result includes dyadic places; excluding them is a sufficient special case, not its definition.; Use Conrad’s exact special-case convention, including possibly empty S_F.

**Planned declaration.** `TauCeti.ArithmeticDuality.grunwaldWang`.

**Planet.** Grunwald–Wang theorem.

**Construction or proof.**

1. Apply global reciprocity to the finite-order character extension problem for local idele factors.
2. Compute the annihilator by the global n-th-power kernel using finite duality.
3. Use the explicit dyadic cyclotomic calculation to identify the kernel and the product obstruction.
4. If the obstruction is nontrivial, replace n by 2n and verify the kernel restriction disappears.

**Inputs.** [R02.4/all-place-sha-duality](#r024-all-place-sha-duality); [R02.2/cyclotomic-local-global-kernel](#r022-cyclotomic-local-global-kernel); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`

**Acceptance.**

- Q, n=8 and prescribed dyadic unramified order-eight character is obstructed at fixed order.
- If S excludes all dyadic places, the source’s globalization corollary applies.
- Do not claim that adding an unramified local twist always fixes the obstruction.

**Sources.**

- [CONRAD-GW](https://virtualmath1.stanford.edu/~conrad/papers/locchar.pdf), Appendix A, Wang special case and Propositions A.1–A.3, pp. 31–32. The precise exception, power-kernel generator and order-doubling alternative.
- [PAPER-BOXER-CALEGARI-GEE-ETAL-25](https://arxiv.org/pdf/2309.15880), §5.3, Lemma 5.3.1 and Remark 5.3.2, author pp. 55–56; published pp. 49–50. Local character globalization and the dyadic counterexample.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “All-place duality, roots and geometric-coefficient signatures” in the gap ledger.

<a id="r024-character-root-obstruction"></a>

### R02.4/character-root-obstruction — Character roots and local Brauer obstructions

For a finite-order continuous character χ:G_F→μ_N in an algebraic closure of a characteristic-zero coefficient field and integer m≥1, the power exact sequence 1→μ_m→μ_{mN}→μ_N→1 has trivial G_F-actions and gives δχ∈H²(F,Z/m). The character gains an m-th root in algebraically closed coefficients exactly when δχ=0. The obstruction has finite local support; after adjoining μ_m a local extension of degree divisible by m kills its invariant. For m=2, the coefficient Z/2=μ_2 is canonical and δχ is a Brauer 2-torsion class; local–global Brauer injectivity detects its vanishing. For general m retain all-place Sha², rather than identifying Z/m with μ_m before roots of unity are present.

**Hypotheses.** Root values may require a finite extension of the original coefficient field.; The power sequence uses trivial coefficient actions; the Brauer identification for m>2 requires μ_m in the field.

**Planned declaration.** `TauCeti.ArithmeticDuality.characterRootObstruction`.

**Construction or proof.**

1. Construct the discrete short exact power sequence and use the existing connecting map.
2. Finite-quotient inflation shows only finitely many localizations can be nonzero, since unramified local H² vanishes.
3. Identify the local class with a μ_m Brauer class after adjoining roots of unity and apply degree multiplication of invariants.
4. For m=2 use the global Brauer sequence; for general m retain the all-place kernel and its dual.

**Inputs.** `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`; [R02.4/all-place-sha-duality](#r024-all-place-sha-duality)

**Acceptance.**

- A character already equal to ψ^m has zero obstruction.
- An unramified local character has a root in algebraically closed coefficients.
- A same-finite-field root is not guaranteed.

**Sources.**

- [PAPER-QIAN-23](https://par.nsf.gov/servlets/purl/10388233), Proof of Lemma 2.1, pp. 1245–1247. Power sequence, finite support, local killing and remaining all-place obstruction.
- [PAPER-BOXER-CALEGARI-GEE-ETAL-25](https://arxiv.org/pdf/2309.15880), §5.3, proof of Lemma 5.3.3, author p. 56. Brauer obstruction after adjoining the relevant roots of unity.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “All-place duality, roots and geometric-coefficient signatures” in the gap ledger.

<a id="r024-character-roots-after-base-change"></a>

### R02.4/character-roots-after-base-change — Roots after prescribed totally real base change

For CM F, a finite-order character η:G_F→Qbar_l×, integer m≥1 and a finite avoidance extension, there is a totally real Galois M/Q disjoint from that avoidance extension such that η|_{G_{FM}} has an m-th root ψ. If T is a finite set of rational primes excluding 2 where η is unramified, M can split T and ψ can be chosen unramified above T. In the square-root situation of Allen et al. Theorem 7.1.11, import the soluble totally real field with local residue degrees divisible by 2[F_v:Q_p]; Brauer injectivity kills the obstruction and a quadratic Grunwald–Wang adjustment makes all the finite list of square roots unramified at the prescribed set. For a totally real F and totally even characters unramified at primes above an odd p, a suitable totally real quadratic base change, split above p and disjoint from a given finite extension, kills the square-root Brauer obstructions.

**Hypotheses.** CM roots use algebraically closed characteristic-zero coefficients and finite avoidance.; The general m-th-root theorem does not assert solvability of M; solvability is retained only for the imported ACC square-root construction.; In the totally real case local roots at real places require even parity.

**Planned declaration.** `TauCeti.ArithmeticDuality.characterRootsAfterBaseChange`.

**Construction or proof.**

1. Kill finite local obstruction support by the prescribed-local-degree field-existence theorem, imported from PotentialModularity.
2. Use all-place Sha duality and cyclotomic descent to kill the remaining obstruction for general m.
3. Adjust by a global finite-order character with the prescribed unramified local conditions, respecting the Wang exception.
4. For totally even square roots use weak approximation to find a positive quadratic extension nonsplit at the bad support and split at p, with an auxiliary prime ensuring disjointness.

**Inputs.** [R02.4/character-root-obstruction](#r024-character-root-obstruction); [R02.4/grunwald-wang](#r024-grunwald-wang); [R02.2/cyclotomic-local-global-kernel](#r022-cyclotomic-local-global-kernel); [R02.4/prescribed-local-totally-real-base-change](#r024-prescribed-local-totally-real-base-change)

**Acceptance.**

- No same-finite-field root is asserted.
- The avoidance condition is explicit and preserved through every extension.
- The local-degree field construction is requested, not re-planned here.

**Sources.**

- [PAPER-BOXER-CALEGARI-GEE-ETAL-25](https://arxiv.org/pdf/2309.15880), §5.3, Lemma 5.3.3, author p. 56; published p. 50. General CM roots with avoidance and prime-to-dyadic splitting.
- [PAPER-ALLEN-ETAL-23](https://annals.math.princeton.edu/2023/197-3/p02), Proof of Theorem 7.1.11, pp. 1103–1104. The soluble square-root construction and unramified quadratic adjustment.
- [PAPER-BOXER-CALEGARI-GEE-PILLONI-21](https://arxiv.org/pdf/1812.09269), §8.5, proof of Theorem 8.5.2, author pp. 248–249; §9.2, p. 257. Totally even square-root reduction and coefficient-field caveat.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “All-place duality, roots and geometric-coefficient signatures” in the gap ledger.

<a id="r024-tate-h2-qmodz"></a>

### R02.4/tate-h2-qmodz — Tate vanishing for trivial Q/Z coefficients

For a global field F, H²(G_F,Q/Z)=0 with trivial discrete action (prime-to-char(F) part in positive characteristic). Equivalently a class in H²(F,Z/n) dies after some coefficient inclusion Z/n→Z/N; this is a direct limit of trivial cyclic coefficients, not a statement about the Brauer group H²(F,μ_∞).

**Hypotheses.** For function fields restrict to torsion of order prime to char(F).; Q/Z has trivial Galois action.

**Planned declaration.** `TauCeti.ArithmeticDuality.tateH2Qmodz`.

**Construction or proof.**

1. Apply the long exact sequence of 0→Z→Q→Q/Z→0 with trivial discrete action. Positive-degree cohomology of Q vanishes by averaging over finite quotients, so H²(Q/Z)≅H³(Z).
2. For number fields, Milne I Corollary 4.17 gives odd integral cohomology zero: first use an imaginary index-two subgroup of strict dimension two and the two-step permutation-lattice sequence to make degrees ≥3 two-periodic; compare degrees ≥4 with the real local terms by finite PT, whose odd integral cohomology vanishes.
3. For global function fields, Milne I Remark 1.12 gives strict cohomological dimension two away from the characteristic from the global class formation; hence the prime-to-characteristic H³(Z) term vanishes. The criterion itself is an imported class-field input.
4. Commutation with filtered colimits of finite cyclic trivial coefficients then gives the precise finite-exponent consequence: every finite cyclic H² class becomes zero under some coefficient inclusion. Do not replace the full absolute group by G_{F,S}, whose strict-dimension claim can involve regulators.

**Inputs.** `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-4-the-finite-quotient-colimit-description`; [R02.4/all-place-sha-duality](#r024-all-place-sha-duality); [R02.2/cyclotomic-local-global-kernel](#r022-cyclotomic-local-global-kernel); `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`

**Acceptance.**

- Do not infer Br(F)=0: μ_∞ carries cyclotomic action.
- The finite-exponent coefficient inclusion is part of the proof, not a consequence of finite Sha cardinality alone.

**Sources.**

- [CONRAD-GW](https://virtualmath1.stanford.edu/~conrad/papers/locchar.pdf), Introduction, Remark 1.1, pp. 1–2. Tate’s vanishing with trivial coefficients and the global-field version, citing Serre §6.5.
- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), I, Remark 1.12, p. 24; Corollary 4.17 and proof, p. 63. Strict dimension for the full global class formation and odd integral cohomology; the finite-exponent formulation follows by filtered colimits.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="r024-torus-sha-duality"></a>

### R02.4/torus-sha-duality — Torus Sha duality and adelic annihilators

For a torus T over a number field F with character lattice X*(T), Sha¹(F,T) and Sha²(F,X*(T)) are finite and perfectly paired. The image of T(A_F) in Hom(H²(F,X*(T)),Q/Z), given by the sum of local evaluation invariants, is the annihilator of Sha²(F,X*(T)). Coefficient topology is explicit: H²(F,X*(T)) is discrete and its dual has the compact-open topology. In the torsor application of Harpaz–Wittenberg the obstruction character changes by minus this pairing.

**Hypotheses.** Use the existing torus/character-lattice duality carrier; no second algebraic torus definition.; No finiteness conjecture for abelian-variety Sha is assumed.

**Planned declaration.** `TauCeti.ArithmeticDuality.torusShaDuality`.

**Planet.** Torus Sha duality.

**Construction or proof.**

1. Resolve the character lattice by permutation lattices; use Shapiro, finite PT and class-formation duality for finitely generated coefficients.
2. Use the torus evaluation cup pairing with local invariants to identify the finite Sha groups.
3. Pass to the adelic restricted product and identify its annihilator by the all-place exact sequence; verify the source’s torsor sign separately.

**Inputs.** [R02.4/all-place-sha-duality](#r024-all-place-sha-duality); [R02.4/class-formation-ext-duality](#r024-class-formation-ext-duality); [R02.4/restricted-product-self-duality](#r024-restricted-product-self-duality); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`

**Acceptance.**

- For T=G_m, Sha¹ is zero by Hilbert 90.
- The image/annihilator statement uses all places.
- The torus carrier and character functor are imported.

**Sources.**

- [MILNE-ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Theorem 4.20 and Corollaries 4.17, 4.21, pp. 65–70. Duality for finitely generated lattices and tori.
- [PAPER-HARPAZ-WITTENBERG-20](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §2, Propositions 2.6–2.7, author p. 11. The torus Sha pairing, adelic annihilator and application sign.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “All-place duality, roots and geometric-coefficient signatures” in the gap ledger.

<a id="r024-abelian-variety-local-duality"></a>

### R02.4/abelian-variety-local-duality — Local abelian-variety duality and gerbe evaluation

For an abelian variety A over a nonarchimedean local field F with dual A∨, there are canonical identifications H^r(F,A∨)≅Ext^{r+1}_ét(A,G_m), r≥0. Yoneda evaluation and the local invariant give perfect continuous pairings H^r(F,A)×H^{1−r}(F,A∨)→Q/Z for r=0,1; A(F) is profinite, H¹ is torsion cofinite, and higher H^r vanish. A torsor t∈H¹(F,A∨) corresponds to an Ext² gerbe α_t and its character on A(F) is a↦inv(a*α_t). Hence a nonzero torsor gives a nontrivial character, whose Haar integral is zero.

**Hypotheses.** F is nonarchimedean local; use the existing Tau Ceti abelian variety and its dual construction.; Ext is in the category of étale sheaves, not Ext of the point group A(F).; Continuous perfection uses Pontryagin duality and the local analytic topology.

**Planned declaration.** `TauCeti.ArithmeticDuality.abelianVarietyLocalDuality`.

**Planet.** Local abelian-variety duality.

**Construction or proof.**

1. Use the Barsotti–Weil Ext¹ identification and vanishing of higher sheaf Ext, then the local-to-global Ext spectral sequence.
2. Apply local abelian-variety duality and its evaluation normalization.
3. Pull the gerbe back along a rational point and compare the Yoneda product with cup product.
4. Translation invariance of Haar measure kills the integral of a nontrivial continuous character; import the measure lemma.

**Inputs.** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`; [D7/derived-tensor-and-tor](#d7-derived-tensor-and-tor); [D7/matlis-coefficient-duality](#d7-matlis-coefficient-duality); [D7/derived-local-duality](#d7-derived-local-duality)

**Acceptance.**

- For the zero torsor the character is trivial.
- A nonzero torsor cannot give an identically zero invariant function.
- A(F) is profinite while H¹ is discrete; algebraic nondegeneracy alone is insufficient.

**Sources.**

- [PAPER-GROECHENIG-WYSS-ZIEGLER-20](https://arxiv.org/pdf/1707.06417), §3.2, Lemma 3.8, Theorem 3.10 and Remark 3.11, author pp. 17–18. Ext description, topological Tate pairing and gerbe evaluation.
- [PAPER-GROECHENIG-WYSS-ZIEGLER-20-B](https://arxiv.org/pdf/1810.06739v2), §6.5, proof of Lemma 6.14, author pp. 42–43. The nontrivial torsor character used for integration.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “All-place duality, roots and geometric-coefficient signatures” in the gap ledger.

<a id="r024-isogeny-dual-exact-sequence"></a>

### R02.4/isogeny-dual-exact-sequence — Self-dual isogenies and their local index

For an isogeny φ:A→B over nonarchimedean local F, the local sequence 0→kerφ(F)→A(F)→B(F)→H¹(F,kerφ)→H¹(F,A)→H¹(F,B)→H²(F,kerφ)→0 is dual to the corresponding sequence for φ∨:B∨→A∨, with the degree-two kernel term dual to degree zero. If ψ:A≅B∨ and ψ∨φ=φ∨ψ, and degφ is prime to the residue characteristic, then |B(F)/φA(F)|=|kerφ(F)|.

**Hypotheses.** Use finite flat group-scheme duality for kerφ and the étale realization when the degree is invertible.; The self-duality is a morphism identity, not merely equality of kernel orders.; Prime-to-residue-characteristic degree is essential for the index conclusion as stated.

**Planned declaration.** `TauCeti.ArithmeticDuality.isogenyDualExactSequence`.

**Construction or proof.**

1. Form the long exact sequence of the isogeny and its dual using vanishing of higher local abelian-variety cohomology.
2. Use Yoneda composition and connecting-map adjunction to compare each arrow under local duality.
3. Use ψ to identify the dual sequences; Euler characteristic of the finite prime-to-p kernel makes the order of H¹ equal the square of H⁰, yielding the index formula.

**Inputs.** [R02.4/abelian-variety-local-duality](#r024-abelian-variety-local-duality); [R02.4/finite-module-dual](#r024-finite-module-dual); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`

**Acceptance.**

- For the identity isogeny both groups have order one.
- The quotient is B(F)/φA(F), with the correct source and target.
- Degree-zero kernel is paired with H² of the dual kernel, not H¹.

**Sources.**

- [PAPER-GROECHENIG-WYSS-ZIEGLER-20](https://arxiv.org/pdf/1707.06417), §3.2, Construction 3.14, Lemma 3.15 and Proposition 3.16, author pp. 18–19. The self-dual sequence and prime-to-p index consequence.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “All-place duality, roots and geometric-coefficient signatures” in the gap ledger.

<a id="r024-function-field-central-obstructions"></a>

### R02.4/function-field-central-obstructions — Function-field central obstruction localization

For a global function field F of characteristic ℓ and finite abelian constant A of order prime to ℓ, assume F contains the roots of unity of exponent A. Then H²(G_F,A)→∏_vH²(G_{F_v},A) is injective. More generally the same conclusion holds for a finite module whose Tate dual is constant: Chebotarev makes Sha¹(F,A^D)=0 and all-place PT makes Sha²(F,A)=0.

**Hypotheses.** Enough roots of unity trivialize the dual action; an isomorphism A≅A^D is not canonical without choices.; Coefficients are prime to char(F).; This is the cohomological obstruction input, not the consumer’s full embedding-problem lifting theorem.

**Planned declaration.** `TauCeti.ArithmeticDuality.functionFieldCentralObstructions`.

**Construction or proof.**

1. Identify the Tate dual as a constant finite module using the root-of-unity hypothesis.
2. A locally trivial H¹ class for a constant module is an everywhere-split finite abelian extension, trivial by function-field Chebotarev.
3. Use all-place Sha duality to kill the localization kernel.

**Inputs.** [R02.4/all-place-sha-duality](#r024-all-place-sha-duality); `FunctionFieldArithmetic:FA.4`; `FunctionFieldArithmetic:FA.5`

**Acceptance.**

- The roots-of-unity condition is explicit.
- No archimedean places are added.
- Do not re-plan the tamely ramified nonabelian extension construction owned by the consumer.

**Sources.**

- [PAPER-WOOD-19](https://par.nsf.gov/servlets/purl/10152050), §3, Lemma 3.2 and its proof, published p. 389. The positive-characteristic prime-to-p central obstruction input.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “All-place duality, roots and geometric-coefficient signatures” in the gap ledger.

<a id="r024-prescribed-local-totally-real-base-change"></a>

### R02.4/prescribed-local-totally-real-base-change — Totally real local base change with avoidance

For a number field F and a finite avoidance extension, finitely many finite local extensions and a finite set of rational primes required to split, construct a totally real Galois extension M/Q disjoint from the avoidance field with the prescribed local residue-degree divisibilities over F. The split primes are disjoint from the nontrivial prescribed local requirements. The general m-th-root application of BCGN permits arbitrary finite local data and does not claim solubility. For the square-root application of Allen et al. use their soluble specialization with local degrees divisible by 2[F_v:Q_p]; it supplies exactly the local invariant killing needed for a finite list of Brauer classes. The totally real quadratic specialization for totally even characters preserves the prescribed odd-p splitting and disjointness.

**Hypotheses.** A finite list of local requirements, with compatibility at primes also required to split.; The general Galois construction and the soluble square-root construction are separate assertions.

**Planned declaration.** `TauCeti.ArithmeticDuality.prescribedLocalTotallyRealBaseChange`.

**Construction or proof.**

1. Use the approximation/field-construction argument cited and applied in BCGN Lemma 5.3.3 for prescribed local extensions and avoidance.
2. For square roots follow the soluble construction in Allen et al. Theorem 7.1.11, before applying the local invariant and Brauer injectivity.
3. The resulting characters are treated by the root-obstruction and Grunwald–Wang targets; those do not supply the field construction themselves.

**Inputs.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`

**Acceptance.**

- A split requirement cannot simultaneously demand a nontrivial local extension.
- Solubility is recorded only for the square-root specialization.
- The avoidance extension is kept fixed throughout the construction.

**Sources.**

- [PAPER-BOXER-CALEGARI-GEE-ETAL-25](https://arxiv.org/pdf/2309.15880), §5.3, Lemma 5.3.3 and proof, author pp. 55–56. Prescribed local extensions, splitting and avoidance for roots of CM characters.
- [PAPER-ALLEN-ETAL-23](https://annals.math.princeton.edu/2023/197-3/p02), Proof of Theorem 7.1.11, pp. 1103–1104. The soluble local-degree construction for the finite square-root list.
- [PAPER-BOXER-CALEGARI-GEE-PILLONI-21](https://arxiv.org/pdf/1812.09269), §8.5, proof of Theorem 8.5.2; §9.2, proof of Lemma 9.2.7, author pp. 249, 257. The totally real quadratic specialization for totally even characters.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “All-place duality, roots and geometric-coefficient signatures” in the gap ledger.

## R02.5: Selmer duality and dimension formulas

The Selmer carrier and its cochain local-condition diagram belong to the SelmerIwasawaCohomology bundle. This layer imports them and proves duality, kernel/fibre comparison and numerical consequences. H¹ of the mapping fibre surjects onto the kernel Selmer group, with the cokernel of the degree-zero localization map as kernel. Removing that correction requires surjectivity on H⁰. Greenberg–Wiles uses exact-annihilator local conditions and the cyclotomic dual, with its ordinary archimedean terms. The rank-one and function-field formulas retain their distinct hypotheses.

<a id="r025-greenberg-wiles-formula"></a>

### R02.5/greenberg-wiles-formula — The Greenberg–Wiles formula

Let F be a number field, M a finite discrete G_F-module and M^* = Hom(M, μ_n) (nM = 0). For each place v fix L_v ⊆ H¹(G_v, M), with L_v = H¹(G_v/I_v, M^{I_v}) for all but finitely many v, and let L_v^⊥ ⊆ H¹(G_v, M^*) be its annihilator under local duality. The Selmer groups H¹_L(F, M) and H¹_{L*}(F, M^*) (preimages of ∏L_v and ∏L_v^⊥ under localisation) are finite, and #H¹_L(F, M)/#H¹_{L*}(F, M^*) = (#H⁰(G_F, M)/#H⁰(G_F, M^*)) · ∏_v #L_v/#H⁰(G_v, M), all but finitely many factors being 1. Here H⁰(G_v, M) is ordinary cohomology at every place, including the archimedean ones.

**Hypotheses.** M finite; the local conditions are unramified almost everywhere.

**Planned declaration.** `TauCeti.ArithmeticDuality.greenbergWilesFormula`.

**Planet.** Greenberg–Wiles formula.

**Construction or proof.**

1. For finite v with #M prime to v and M unramified, #H¹(G_v/I_v, M^{I_v}) = #H⁰(G_v, M) (the sequence 0 → H⁰ → M^{I_v} → M^{I_v} → H¹_ur → 0), so almost all factors are 1.
2. Choose S ⊇ archimedean places, places dividing #M, ramified places and places where L_v is not unramified. Then 0 → H¹_L(F, M) → H¹(G_S, M) → ⊕_{v∈S} H¹(G_v, M)/L_v (galois-selmer-group), and H¹(G_S, M) is finite (global-finiteness).
3. Dualising the same sequence for M^* with local duality ((H¹/L_v)^∨ ≅ L_v^⊥ by orthogonal-complement's quotient pairing; unramified-exact-annihilators outside S) gives ⊕_{v∈S} L_v → H¹(G_S, M^*)^∨ → H¹_{L*}(F, M^*)^∨ → 0.
4. The segment 0 → H⁰(G_S, M) → (⊕_{v∈S} H⁰(G_v, M))/(1 + c)M → H²(G_S, M^*)^∨ → H¹(G_S, M) → ⊕ H¹(G_v, M) → H¹(G_S, M^*)^∨ of Poitou–Tate (the archimedean H⁰ is Tate's modified group), with H¹(G_v, M) replaced by L_v, gives an exact sequence whose alternating product of orders, with Tate's global Euler characteristic for M^*, yields the formula.

**Inputs.** [R02.4/poitou-tate](#r024-poitou-tate); [R02.4/global-euler-characteristic](#r024-global-euler-characteristic); [R02.4/restricted-product-self-duality](#r024-restricted-product-self-duality); [R02.4/unramified-exact-annihilators](#r024-unramified-exact-annihilators); [R02.4/finite-module-dual](#r024-finite-module-dual); [R02.4/global-finiteness](#r024-global-finiteness); [R02.3/restricted-ramification-group](#r023-restricted-ramification-group); `SelmerIwasawaCohomology:L2/galois-selmer-group`; `SelmerIwasawaCohomology:L2/dual-selmer-structure`; `SelmerIwasawaCohomology:L1/orthogonal-complement`

**Acceptance.**

- Stated over every number field (DDT Theorem 2.19), with the archimedean conventions explicit: ordinary H⁰ in the formula, Tate's modified H⁰ inside the proof.
- Serves ArithmeticStatistics ST.5 (the Greenberg–Wiles ratio) and OrdinaryAutomorphicFormsAndModularityLifting R21.4 (Wiles' formula), which requested it from R02.4.

**Sources.**

- [DDT-FLT](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.3, Theorem 2.18, p. 61 (author PDF, revised 9 September 2007). Theorem 2.18 and its proof (pp. 61–62).
- [DDT-FLT](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.3, Theorem 2.19, p. 62 (author PDF, revised 9 September 2007). Theorem 2.19, the statement over a number field (see ArithmeticGaloisDuality/E5).

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Selmer arithmetic comparison and dimension signatures” in the gap ledger.

<a id="r025-selmer-condition-comparison"></a>

### R02.5/selmer-condition-comparison — Changing one local condition

If L ⊆ L′ differ at finitely many places, primal Selmer groups grow and dual Selmer groups shrink. Their cardinality ratios satisfy #Sel(L′)/#Sel(L) = (∏[L′_v:L_v])·#Sel(L′⊥)/#Sel(L⊥). At a newly relaxed unramified prime q, the dual condition is zero; its new dual Selmer group is the kernel of the full localization to H¹(F_q,M^D). Because the old classes are unramified, this kernel can equivalently be taken in H¹_un(F_q,M^D).

**Hypotheses.** L ⊆ L′ differ at finitely many places.

**Planned declaration.** `TauCeti.ArithmeticDuality.selmerConditionComparison`.

**Construction or proof.**

1. Divide the two instances of greenberg-wiles-formula; the global H⁰ terms and the unchanged local factors cancel.
2. The inclusion and the kernel description are the exact sequences of SelmerIwasawaCohomology's selmer-structure-poitou-tate (i) and change-of-conditions, with (H¹(G_q, M))^⊥ = 0 and H¹_ur^⊥ = H¹_ur (unramified-exact-annihilators).

**Inputs.** [R02.5/greenberg-wiles-formula](#r025-greenberg-wiles-formula); `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`; `SelmerIwasawaCohomology:L2/change-of-conditions`; [R02.4/unramified-exact-annihilators](#r024-unramified-exact-annihilators)

**Acceptance.**

- This is the form used to make one Selmer group vanish, as in DDT's applications and in the auxiliary-prime arguments of GlobalGaloisDeformations R04.5.

**Sources.**

- [DDT-FLT](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.3, before Theorem 2.18, p. 61 (author PDF, revised 9 September 2007). The use of Theorem 2.18 to compare Selmer groups.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Selmer arithmetic comparison and dimension signatures” in the gap ledger.

<a id="r025-selmer-complex-h1-comparison"></a>

### R02.5/selmer-complex-h1-comparison — Selmer complex H¹ with its H⁰ correction

Import SelmerIwasawaCohomology L2’s complex F=Cone(C_global⊕U→C_local)[−1], where the map is res−i and i:U→C_local is the actual local-condition map. If H¹(i) is injective, there is a canonical exact sequence 0→coker(H⁰(C_global)⊕H⁰(U)→H⁰(C_local))→H¹(F)→Sel_L→0, with L=image H¹(i). Thus H¹(F) equals the restriction-kernel Selmer group exactly when that degree-zero map is surjective. Without injectivity of H¹(i), the kernel of H¹(U)→H¹(C_local) also contributes before projection to H¹(C_global).

**Hypotheses.** The local conditions are imported maps of complexes, not merely chosen H¹ subgroups.; The H⁰ and H¹ conditions are explicit for every comparison.

**Planned declaration.** `TauCeti.ArithmeticDuality.selmerComplexH1Comparison`.

**Planet.** Selmer complex comparison.

**Construction or proof.**

1. Apply the long exact sequence of the actual imported fibre.
2. Project ker(H¹(C_global)⊕H¹(U)→H¹(C_local)) to H¹(C_global) and compute its kernel.
3. If H¹(i) is injective, identify the image with the existing Selmer subgroup.
4. Quotient the degree-zero term; only then state the H¹ isomorphism under surjectivity.

**Inputs.** `SelmerIwasawaCohomology:L2`; [R02.3/localisation-maps](#r023-localisation-maps); [D7/derived-tensor-and-tor](#d7-derived-tensor-and-tor)

**Acceptance.**

- A zero global complex with non-surjective H⁰ local map can have nonzero H¹ fibre.
- Changing a local condition uses its chain map.
- Do not silently erase the H⁰ cokernel.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §6.1, Definition 6.1.2 and exact sequence 6.1.3, pp. 135–137. The mapping-fibre Selmer complex and its low-degree correction.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Selmer arithmetic comparison and dimension signatures” in the gap ledger.

<a id="r025-rank-one-selmer-numerics"></a>

### R02.5/rank-one-selmer-numerics — Rank-one Selmer numerics

For a number field F, odd p with ζ_p∉F, trivial M=F_p and unramified local conditions at every finite place and zero at infinity, dim Sel_L(F,F_p)−dim Sel_{L⊥}(F,μ_p)=−(r₁+r₂−1). The primal group is the p-torsion class-group character space; the dual fits the unit/class-group Kummer sequence, whose unit contribution has dimension r₁+r₂−1. The formula changes if ζ_p lies in F.

**Hypotheses.** Use ordinary invariants in the global and archimedean factors of Greenberg–Wiles.; The finite unramified condition at p is distinguished from full local H¹.

**Planned declaration.** `TauCeti.ArithmeticDuality.rankOneSelmerNumerics`.

**Construction or proof.**

1. Apply Greenberg–Wiles with the finite unramified local factors.
2. Use global H⁰(F,F_p)=F_p and H⁰(F,μ_p)=0.
3. Use Dirichlet S-unit/Kummer and the class-field dictionary to compare both sides.

**Inputs.** [R02.5/greenberg-wiles-formula](#r025-greenberg-wiles-formula); [R02.3/s-unit-kummer-sequence](#r023-s-unit-kummer-sequence); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`

**Acceptance.**

- For Q the difference is zero.
- If μ_p⊆F the H⁰ dual term is nonzero and the stated formula cannot be copied unchanged.

**Sources.**

- [PAPER-CALEGARI-GERAGHTY-18](https://arxiv.org/pdf/1207.4224), §8.1, author pp. 77–78; journal §8.2. The rank-one dimension calculation and the unit/class-group interpretation.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Selmer arithmetic comparison and dimension signatures” in the gap ledger.

<a id="r025-function-field-greenberg-wiles"></a>

### R02.5/function-field-greenberg-wiles — Function-field Greenberg–Wiles

For a global function field F, finite k of characteristic p≠char(F), finite-dimensional M and local conditions L_v equal to unramified ones away from a finite set, dim Sel_L(M)−dim Sel_{L⊥}(M^D)=h⁰(F,M)−h⁰(F,M^D)+Σ_v(dim L_v−h⁰(F_v,M)). The finite sum has no archimedean term. With no invariants on either global module this is the sum of the local condition excesses.

**Hypotheses.** All conditions and orthogonality are the existing L2/L1 notions.; Finite ramification and prime-to-characteristic coefficients.

**Planned declaration.** `TauCeti.ArithmeticDuality.functionFieldGreenbergWiles`.

**Construction or proof.**

1. Use finite PT and the function-field Euler characteristic.
2. Apply the same cardinality comparison as Greenberg–Wiles and convert to dimensions.
3. Check the finite support of nontrivial local factors.

**Inputs.** [R02.5/greenberg-wiles-formula](#r025-greenberg-wiles-formula); [R02.3/function-field-finiteness-euler](#r023-function-field-finiteness-euler); `SelmerIwasawaCohomology:L2`; `SelmerIwasawaCohomology:L1`

**Acceptance.**

- No number-field infinity factor appears.
- Relaxing one condition gives the same dual-size compensation formula.

**Sources.**

- [PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22](https://arxiv.org/pdf/2008.12593), §2, p. 10. The equal-characteristic numerical Selmer input.
- [NSW-CNF](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §8.7, Theorem 8.7.9, pp. 515–516. Global-field Greenberg–Wiles formula.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Selmer arithmetic comparison and dimension signatures” in the gap ledger.

## R02.6: Auxiliary primes and patching numerics

Finite-image and Chebotarev inputs supply primes with prescribed local cohomology. Odd Taylor–Wiles primes kill the required strict dual Selmer group. The dyadic Khare–Wintenberger construction uses the full adjoint, leaves the specified dimension-two cyclotomic residual, and has its own auxiliary quotient rank and exponent. It cannot be replaced by the odd argument. Relative tangent numerics are cohomological statements here; a relation bound is conditional on a supplied relation-module injection into the dual Selmer target. Ring representability is owned by the higher-tier deformation roadmaps. The archimedean formula uses involution eigenspace dimensions and no division by the representation rank.

<a id="r026-taylor-wiles-local-count"></a>

### R02.6/taylor-wiles-local-count — Local cohomology at a Taylor–Wiles prime

Let ℓ be odd, k a finite field of characteristic ℓ, ρ̄ : G_ℚ → GL₂(k), and q ≡ 1 (mod ℓ) a prime at which ρ̄ is unramified with ρ̄(Frob_q) having distinct k-rational eigenvalues. Then H⁰(F_q, ad⁰ρ̄) = H⁰(F_q, ad⁰ρ̄(1)) = k and H¹(F_q, ad⁰ρ̄) = H¹(F_q, ad⁰ρ̄(1)) = k, where H^i(F_q, −) is the cohomology of Gal(ℚ_q^ur/ℚ_q) (unramified classes).

**Hypotheses.** q ≡ 1 mod ℓ; ρ̄ unramified at q with distinct Frobenius eigenvalues.

**Planned declaration.** `TauCeti.ArithmeticDuality.taylorWilesLocalCount`.

**Construction or proof.**

1. Frob_q acts semisimply on ad⁰ρ̄ with eigenvalues x, 1, x^{−1}, x ≠ 1 the ratio of the eigenvalues; since q ≡ 1 mod ℓ, the twist (1) does not change them.
2. For the procyclic Gal(ℚ_q^ur/ℚ_q), H⁰ and H¹ of a finite module N are ker and coker of Frob − 1 on N (SelmerIwasawaCohomology unramified-condition), both one-dimensional here.

**Inputs.** `SelmerIwasawaCohomology:L2/unramified-condition`

**Acceptance.**

- The twist by the cyclotomic character is trivial on Frob_q only because q ≡ 1 mod ℓ; for general q the two modules differ.

**Sources.**

- [DDT-FLT](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.8, Lemma 2.46, p. 81 (author PDF, revised 9 September 2007). Lemma 2.46(a) and its proof.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Auxiliary-prime and first-order application signatures” in the gap ledger.

<a id="r026-dual-selmer-killing"></a>

### R02.6/dual-selmer-killing — The conditional dual-Selmer killing calculation

With ρ̄ as in taylor-wiles-local-count, let H¹_∅*(ℚ, ad⁰ρ̄(1)) be the dual Selmer group of a Selmer structure ∅ on ad⁰ρ̄ unramified at the primes of a finite set Q of Taylor–Wiles primes, and let Q be the structure relaxed at Q, whose dual is strict at Q. If H¹_∅*(ℚ, ad⁰ρ̄(1)) → ⊕_{q∈Q} H¹(F_q, ad⁰ρ̄(1)) is an isomorphism, then #Q = dim_k H¹_∅*(ℚ, ad⁰ρ̄(1)) and H¹_{Q*}(ℚ, ad⁰ρ̄(1)) = 0. It is an isomorphism as soon as it is injective and #Q = dim_k H¹_∅*(ℚ, ad⁰ρ̄(1)); injectivity holds if every nonzero class has nonzero restriction at some q ∈ Q.

**Hypotheses.** Taylor–Wiles primes (taylor-wiles-local-count); the Selmer structure ∅ unramified at Q.

**Planned declaration.** `TauCeti.ArithmeticDuality.dualSelmerKilling`.

**Planet.** Dual-Selmer killing.

**Construction or proof.**

1. Each H¹(F_q, ad⁰ρ̄(1)) is one-dimensional (taylor-wiles-local-count), so injectivity plus the count gives the isomorphism.
2. Relaxing at q makes the dual condition strict (selmer-condition-comparison), and the restriction of a class of H¹_∅* at q ∈ Q lies in the unramified part; so H¹_{Q*} is the kernel of the displayed map.

**Inputs.** [R02.6/taylor-wiles-local-count](#r026-taylor-wiles-local-count); [R02.5/selmer-condition-comparison](#r025-selmer-condition-comparison); `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`

**Acceptance.**

- Conditional: the existence of such Q is GlobalGaloisDeformations R04.5 (Chebotarev), which uses sigma-criterion below; the order of the two is never reversed (RS-08).
- Stated for ℓ odd over ℚ (DDT §2.8); the dyadic trace-zero and dual-module distinctions of KW II remain to be planned.

**Sources.**

- [DDT-FLT](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.8, Lemma 2.46(c), p. 81 (author PDF, revised 9 September 2007). Lemma 2.46(c); the reduction in the proof of Theorem 2.49 (p. 83).

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Auxiliary-prime and first-order application signatures” in the gap ledger.

<a id="r026-sl2-adjoint-h1-vanishing"></a>

### R02.6/sl2-adjoint-h1-vanishing — H¹(SL₂(F), End⁰) vanishes

Let F be a finite field of odd characteristic ℓ with #F ≠ 5. Then H¹(SL₂(F), End⁰(F²)) = 0.

**Hypotheses.** #F ≠ 5, odd characteristic.

**Planned declaration.** `TauCeti.ArithmeticDuality.sl2AdjointH1Vanishing`.

**Construction or proof.**

1. ℓ does not divide the index of the Borel subgroup B, so restriction H¹(SL₂(F), M) → H¹(B, M) is injective (ArithmeticGaloisDuality R02.2/finite-index-descent).
2. ℓ does not divide [B : U] for the unipotent U, so H^i(B, M) = H^i(U, M)^{B/U}.
3. #F = 3: H¹(U, M) = ker N/(σ − 1)M = 0 directly. #F > 5: filter End⁰(F²) by B-stable M₀ ⊂ M₁ ⊂ M₂ ⊂ M₃ with one-dimensional quotients and use the long exact sequences; for #F = 9 also check that the B/U-fixed line of H¹(U, M₃/M₂) maps injectively to H²(U, M₂/M₁). (Cline–Parshall–Scott, table 4.5, not read.)

**Inputs.** [R02.2/finite-index-descent](#r022-finite-index-descent); `mathlib:groupCohomology`

**Acceptance.**

- #F = 5 is excluded, as in the source.

**Sources.**

- [DDT-FLT](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.8, Lemma 2.48, p. 82 (author PDF, revised 9 September 2007). Lemma 2.48 and its sketched proof.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Auxiliary-prime and first-order application signatures” in the gap ledger.

<a id="r026-sigma-criterion"></a>

### R02.6/sigma-criterion — The group-theoretic input to Taylor–Wiles primes

Let ℓ be odd, ρ̄ : G_ℚ → GL₂(k) with ρ̄|G_L absolutely irreducible for L = ℚ(√((−1)^{(ℓ−1)/2}ℓ)), and F_m the extension of ℚ(ζ_{ℓ^m}) cut out by ad⁰ρ̄. Then H¹(Gal(F_n/ℚ), ad⁰ρ̄(1)) = 0 for every n, and for every nonzero ψ ∈ H¹(G_ℚ, ad⁰ρ̄(1)) there is σ ∈ G_ℚ with σ|_{ℚ(ζ_{ℓ^n})} = 1, ad⁰ρ̄(σ) having an eigenvalue other than 1, and ψ(σ) ∉ (σ − 1)ad⁰ρ̄(1). By Chebotarev, primes q with Frob_q near σ are Taylor–Wiles primes of level n with res_q ψ ≠ 0.

**Hypotheses.** ℓ odd; ρ̄|G_L absolutely irreducible.

**Planned declaration.** `TauCeti.ArithmeticDuality.sigmaCriterion`.

**Planet.** Taylor–Wiles group theory.

**Construction or proof.**

1. Inflation–restriction for F_n/F₀/ℚ (ArithmeticGaloisDuality R02.2/five-term-transgression): the G_ℚ-invariants H¹(Gal(F_n/F₀), ad⁰ρ̄(1))^{G_ℚ} ≅ Hom(Gal(F_n/F₁), ad⁰ρ̄(1)^{G_ℚ}) vanish by absolute irreducibility over L.
2. H¹(Gal(F₀/ℚ), ad⁰ρ̄(1)^{G_{F₀}}) vanishes unless ℓ | #Gal(F₀/ℚ) and Gal(ℚ(ζ_ℓ)/ℚ) is a quotient; by Dickson's classification of the projective image (ArithmeticGaloisRepresentations R01.4) this leaves ℓ = 3 with image PSL₂(𝔽_{3^r}), handled by sl2-adjoint-h1-vanishing.
3. So ψ(G_{F_n}) ≠ 0; some g ∈ Gal(F_n/ℚ(ζ_{ℓ^n})) of order prime to ℓ fixes a nonzero element of ψ(G_{F_n}); lift g to σ₀ and take σ = τσ₀ with τ ∈ G_{F_n} chosen so that ψ(τ) + ψ(σ₀) ∉ (σ₀ − 1)ad⁰ρ̄(1), possible since ψ(G_{F_n}) ⊄ (g − 1)ad⁰ρ̄(1) (the source writes ψ(G_F); see ArithmeticGaloisDuality/E6).

**Inputs.** [R02.6/sl2-adjoint-h1-vanishing](#r026-sl2-adjoint-h1-vanishing); [R02.2/five-term-transgression](#r022-five-term-transgression); `ArithmeticGaloisRepresentations:R01.4`

**Acceptance.**

- Only the group theory is proved here; the passage from σ to primes is Chebotarev, used by GlobalGaloisDeformations R04.5, which owns the actual primes.

**Sources.**

- [DDT-FLT](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.8, proof of Theorem 2.49, p. 83 (author PDF, revised 9 September 2007). The reduction to σ and the cohomological argument (pp. 83–84).
- [DDT-FLT](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.8, end of the proof of Theorem 2.49, p. 84 (author PDF, revised 9 September 2007). The vanishing of H¹(Gal(F_n/ℚ), ad⁰ρ̄(1)).

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Auxiliary-prime and first-order application signatures” in the gap ledger.

<a id="r026-kw-relative-tangent-relations"></a>

### R02.6/kw-relative-tangent-relations — Khare–Wintenberger tangent and relation bounds

For the fixed-determinant global deformation problem of KW II §4 over totally real F, with S containing p, infinity and ramification and absolutely irreducible residual ρ, use ad⁰ and its true dual (ad⁰)* (1). The local tangent condition L_v is the image of the connecting map H⁰(ad)→k in the exact trace sequence 0→ad⁰→ad→k→0. The relative framed tangent count is g=h¹_L(ad⁰)−δ_p+Σ_{v∈S}h⁰(F_v,ad)−h⁰(F,ad); Wiles’ formula and the local exact sequences give g=h¹_{L⊥}((ad⁰)*(1))+|S|−1 in the stated problem. If a deformation presentation has its relation module injected into this dual Selmer group by its obstruction map, the number of defining relations is at most the same dimension. Construction of the presentation and injection belongs to the higher-tier ring roadmap, which imports the cohomological formula here.

**Hypotheses.** δ_p=1 if p=2 and 0 otherwise, as in KW II’s notation; verify the source’s trace/global invariant correction.; Local deformation rings and their representability are imported from R08/R04.; The relation bound requires the actual injective obstruction map, not just a dimension heuristic.

**Planned declaration.** `TauCeti.ArithmeticDuality.kwRelativeTangentRelations`.

**Planet.** Patching Selmer numerics.

**Construction or proof.**

1. Use the trace exact sequence, its connecting image and the imported tangent identification.
2. Apply the cardinality Wiles formula to ad⁰ and its true dual.
3. Substitute local/global invariant dimensions from KW Lemma 4.3.
4. Import Hom(J/mJ,k)↪dual Selmer from R04 and take dimensions.

**Inputs.** [R02.5/greenberg-wiles-formula](#r025-greenberg-wiles-formula); [D8/trace-adjoint-duality](#d8-trace-adjoint-duality); [D8/first-order-cocycle-comparison](#d8-first-order-cocycle-comparison)

**Acceptance.**

- In characteristic two do not replace (ad⁰)* by ad⁰.
- The local boundary condition is retained at every place.
- The ring carrier remains owned by GlobalGaloisDeformations.

**Sources.**

- [PAPER-KHARE-WINTENBERGER-09-II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §4.1.6, §4.2 and Lemmas 4.3–4.4, pp. 42–43; Proposition 4.6, pp. 44–45. The exact trace, framing, tangent and relation corrections.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Auxiliary-prime and first-order application signatures” in the gap ledger.

<a id="r026-odd-taylor-wiles-primes"></a>

### R02.6/odd-taylor-wiles-primes — Odd-prime Taylor–Wiles auxiliary sets

Let p be odd, F totally real and unramified above p, ρ:G_F→GL₂(k) totally odd and absolutely irreducible on G_{F(μ_p)}, with k finite of characteristic p. For each n≥1 there is a set Q_n of size h¹_{L⊥}((ad⁰ρ)*(1)), disjoint from S, with Nq≡1 mod pⁿ and distinct residual Frobenius eigenvalues, for which the new strict dual Selmer group is zero. Each such prime has full local h¹(ad⁰ρ)=2 and h⁰=1, while the unramified H¹ has dimension one. The local fixed-determinant framed generator count is |Q_n|+|S|−1 in KW’s problem.

**Hypotheses.** Preserve the totally real, p-unramified and residual-image hypotheses of KW Lemma 5.2(1).; Local conditions at S are exactly those of KW §4.1.4; no general adequate-image assertion is substituted.

**Planned declaration.** `TauCeti.ArithmeticDuality.oddTaylorWilesPrimes`.

**Planet.** Odd Taylor–Wiles primes.

**Construction or proof.**

1. Prove the cyclotomic finite-quotient H¹ vanishing by the DDT group-theoretic criterion and Dickson classification.
2. For each nonzero dual class choose a Frobenius with nonzero evaluation and distinct eigenvalues, then use Chebotarev.
3. Choose enough independent localization functionals to kill the finite-dimensional dual Selmer group.
4. Apply local finite duality and Euler characteristic for the full versus unramified counts.

**Inputs.** [R02.6/sigma-criterion](#r026-sigma-criterion); [R02.6/dual-selmer-killing](#r026-dual-selmer-killing); [R02.6/kw-relative-tangent-relations](#r026-kw-relative-tangent-relations); `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`

**Acceptance.**

- Full local H¹ has dimension two; unramified H¹ has dimension one.
- The source explicitly warns that the same dual-Selmer argument can fail for p=2.

**Sources.**

- [PAPER-KHARE-WINTENBERGER-09-II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §5.3–5.4, Lemma 5.2(1), Lemmas 5.3–5.4 and Proposition 5.5, pp. 47–48. The precise odd-prime field, image, local-count and generator statements.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Auxiliary-prime and first-order application signatures” in the gap ledger.

<a id="r026-dyadic-cyclotomic-residual"></a>

### R02.6/dyadic-cyclotomic-residual — Dyadic auxiliary primes and the cyclotomic residual

In KW II §5.5, F is totally real, ρ:G_F→GL₂(k) has nonsolvable projective image in characteristic two, S contains 2, infinity and ramification, and n>n₀ is above the maximal real cyclotomic level. Use the full adρ, including scalar matrices. With F_n=F(μ_{2ⁿ}), the special Kummer extension F̃_n and its disjointness from the dual-class field as in Proposition 5.6, there is Q_n of cardinality h¹(S,adρ)−2 with Nq≡1 mod2ⁿ, distinct Frobenius eigenvalues and q split in F̃_n. The strict full-adjoint H¹ group is the inflated cyclotomic scalar H¹(F_n/F,k), of dimension two. The S-split local condition gives h¹=2−Σ_{v∈S}h⁰(F_v,adρ)+2|Q_n|. For t=2−|S|+|Q_n|, the maximal abelian 2-extension unramified outside Q_n and split at S has quotient by 2^{n−2} isomorphic to (Z/2^{n−2})^t.

**Hypotheses.** Use full ad, not trace-zero ad⁰ or its self-dual replacement.; The special Kummer field and the disjointness condition of KW Proposition 5.6 are required.; The residual is dimension two, not a vanishing dual Selmer group.

**Planned declaration.** `TauCeti.ArithmeticDuality.dyadicCyclotomicResidual`.

**Planet.** Dyadic auxiliary primes.

**Construction or proof.**

1. Use Dickson classification and KW Lemma 4.3(5) to identify cyclotomic H¹ in the full adjoint.
2. Prove the special Kummer disjointness of Proposition 5.6 using scalar cocycles and its 2-power degree calculation.
3. Choose Frobenius evaluations by Chebotarev outside the cyclotomic scalar residual.
4. Apply Wiles twice and the scalar/local counts to obtain the two dimension formulas.
5. Use Kummer duality and S-unit constraints for the abelian quotient rank.

**Inputs.** [R02.6/kw-relative-tangent-relations](#r026-kw-relative-tangent-relations); [R02.2/cyclotomic-local-global-kernel](#r022-cyclotomic-local-global-kernel); [R02.3/s-unit-kummer-sequence](#r023-s-unit-kummer-sequence); `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; `ArithmeticGaloisRepresentations:R01.4`

**Acceptance.**

- The auxiliary count subtracts two.
- The cyclic quotient exponent is 2^{n−2}, with n large enough.
- Do not label this as characteristic-two dual-Selmer killing.

**Sources.**

- [PAPER-KHARE-WINTENBERGER-09-II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §5.5, Proposition 5.6, Lemmas 5.8–5.10, pp. 48–53. The special Kummer disjointness and the full-adjoint two-dimensional residual.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Auxiliary-prime and first-order application signatures” in the gap ledger.

<a id="r026-finite-order-determinant-twists"></a>

### R02.6/finite-order-determinant-twists — Finite-order determinant twists

In KW II Lemma 7.10, p-adic characters ψ,ψ′ with the same reduction, agreeing on open unit subgroups at p and with equal restrictions on units at the prescribed finite place v, have finite p-power, totally even ratio ψ′/ψ. After a finite coefficient extension and a totally real cyclic soluble F′/F split at v and disjoint from a given finite extension, there is finite p-power ζ unramified at v with ζ²ψ|_{G_{F′}}=ψ′|_{G_{F′}}. For p odd take F′=F; for p=2 use the Grunwald–Wang construction with an auxiliary place to preserve disjointness.

**Hypotheses.** All equality-of-reduction and local-unit hypotheses of the source are retained.; The base field and the twist are finite-order only for the ratio and ζ, not for ψ itself.

**Planned declaration.** `TauCeti.ArithmeticDuality.finiteOrderDeterminantTwists`.

**Construction or proof.**

1. Kill the infinite unit contribution using the local agreement and class-field theory; equal reductions force p-power order.
2. For odd p multiplication by two is invertible on p-power characters.
3. For p=2 choose the cyclic totally real extension with prescribed local splitting and an auxiliary Frobenius condition, then take a root and adjust unramifiedness.

**Inputs.** [R02.4/grunwald-wang](#r024-grunwald-wang); [R02.4/character-root-obstruction](#r024-character-root-obstruction); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

**Acceptance.**

- The relation is ζ²ψ=ψ′, with the ratio in the correct order.
- The source allows extending the coefficient field.

**Sources.**

- [PAPER-KHARE-WINTENBERGER-09-II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7, Lemma 7.10 and proof, p. 69. The ratio, local agreement, coefficient extension and soluble cyclic base change.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Auxiliary-prime and first-order application signatures” in the gap ledger.

<a id="r026-archimedean-adjoint-dimensions"></a>

### R02.6/archimedean-adjoint-dimensions — Archimedean adjoint dimensions

For k of characteristic different from two and a rank-n representation at a real place with involution eigenspace dimensions a,b, a+b=n, h⁰(ad⁰)=a²+b²−1. At a complex place it is n²−1. If every real involution is balanced, |a−b|≤1, then Σ_{v|∞}h⁰(F_v,ad⁰)=[F:Q]n(n−1)/2+l₀ with l₀=r₁⌊(n−1)/2⌋+r₂(n−1). This is the archimedean contribution in Calegari–Geraghty’s numerical coincidence.

**Hypotheses.** Characteristic is not two and n≥1.; Balanced eigenspace dimensions are explicit; a small modular trace value alone does not imply them.

**Planned declaration.** `TauCeti.ArithmeticDuality.archimedeanAdjointDimensions`.

**Planet.** Archimedean adjoint dimensions.

**Construction or proof.**

1. Diagonalize the involution using the ± idempotents.
2. Its centralizer is End(k^a)⊕End(k^b); impose one trace equation without dividing by n.
3. Insert the balanced dimensions and sum the real and complex contributions.

**Inputs.** [D8/trace-adjoint-duality](#d8-trace-adjoint-duality); [R02.5/greenberg-wiles-formula](#r025-greenberg-wiles-formula)

**Acceptance.**

- n=2 balanced real involution gives h⁰(ad⁰)=1.
- A scalar involution has h⁰=n²−1 and is excluded when it is not balanced.

**Sources.**

- [PAPER-CALEGARI-GERAGHTY-18](https://arxiv.org/pdf/1207.4224), §8.4, author pp. 80–81. The infinity sum and l₀ used in the numerical coincidence.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

## D7: Derived continuous cohomology and compact arithmetic duality

Admissibility uses the finite image algebra of the group action with its adic topology. Reuse Mathlib continuous cochains, ordinary derived categories, tensor products, mapping cones, Ext and spectral objects. Under the tier rule this layer owns the extra derived tensor/Tor, Matlis/injective-hull, derived-composite spectral-sequence and adic continuous-map foundations that it needs; they cannot be supplied by the higher-tier patching roadmap. Continuous cochain base change uses finite generation and actual adic topologies. Compact support is the signed mapping fibre; derived local and global duality are actual cup-and-trace morphisms. At real dyadic places complete Tate terms require unbounded derived statements. The finite-group UCT/Sylow and continuous product Künneth targets are coefficient-comparison applications; special finite-group computations remain with their consumers.

<a id="d7-derived-tensor-and-tor"></a>

### D7/derived-tensor-and-tor — Derived tensor, perfect amplitude and Tor

For commutative rings R→R′, the left-derived tensor functor on the existing derived categories of modules is computed by K-flat complexes. It preserves distinguished triangles. If C is represented by a bounded complex of finite projective R-modules in [a,b], then R′⊗^L_R C is represented by its degreewise tensor in [a,b]; this is the perfect-complex predicate used here. A bounded perfect C has a convergent spectral sequence E₂^{−i,j}=Tor_i^R(R′,H^j(C))⇒H^{j−i}(R′⊗^L_R C). Its edge morphism is the canonical coefficient-change map; flatness or the specified Tor vanishing is necessary for an underived comparison.

**Hypotheses.** The Tor spectral sequence is asserted for bounded perfect amplitude; it is not a convergence assertion for arbitrary unbounded tensor products.; R′ is an R-algebra.

**Planned declaration.** `TauCeti.ArithmeticDuality.derivedTensorAndTor`.

**Construction or proof.**

1. Use the existing derived-category localization and choose K-flat resolutions to derive the existing tensor bifunctor.
2. Prove independence of resolution and triangle preservation using the cone of a quasi-isomorphism between K-flat models.
3. Filter a tensor resolution by degree, use the first-quadrant spectral-sequence framework and bounded perfect amplitude to identify the Tor page and finite filtration.

**Inputs.** `mathlib:DerivedCategory`; `mathlib:HomologicalComplex₂.total`; [R02.2/first-quadrant-spectral-sequence](#r022-first-quadrant-spectral-sequence)

**Acceptance.**

- Derived tensor of the identity coefficient map is the identity.
- A flat algebra gives the usual tensor on cohomology.
- For R=Z, R′=Z/2 and C=Z/2 in degree zero, Tor₁ contributes in degree −1.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §1.2, pp. 33–40; §2.1, p. 51; §4.2, pp. 97–100. Tensor complexes, derived tensor and perfect coefficient-change arguments.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-matlis-coefficient-duality"></a>

### D7/matlis-coefficient-duality — Matlis duality for arithmetic coefficients

For a complete Noetherian local commutative ring R with finite residue field k, choose the injective hull E_R(k). The contravariant exact functor D(M)=Hom_R(M,E_R(k)) exchanges finitely generated R-modules with Artinian cofinite modules and has the canonical evaluation isomorphism M→D(D(M)) in these two regimes. Finite-type modules carry their maximal-ideal topology, and cofinite modules carry the discrete topology. For a continuous group action D uses conjugation; evaluation, finite reductions and passage to inverse/direct limits are equivariant. Dualizing complexes and derived Hom use this exact Matlis functor; an arbitrary module is not declared reflexive.

**Hypotheses.** R is complete Noetherian local; the residue field is finite.; The chosen injective hull includes its essential-extension property, rather than any injective embedding.

**Planned declaration.** `TauCeti.ArithmeticDuality.matlisCoefficientDuality`.

**Construction or proof.**

1. Construct an essential injective hull of the residue module in the existing module category.
2. Prove exactness by injectivity and establish the finite-length bidual by induction on length.
3. Use completeness and the compatible finite reductions to prove the finite-type/cofinite anti-equivalence and its equivariant extension.

**Inputs.** `mathlib:DerivedCategory`; `mathlib:CategoryTheory.IsGrothendieckAbelian.enoughInjectives`

**Acceptance.**

- For R=Z_p, the hull is Q_p/Z_p and a lattice is paired with its cofinite dual.
- A finite-length coefficient is canonically bidual.
- The infinite-vector-space bidual counterexample remains excluded.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §§2.2–2.3, pp. 51–53; §3.1, pp. 75–76. Dualizing functors, Matlis duality and coefficient categories.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-grothendieck-spectral-sequence"></a>

### D7/grothendieck-spectral-sequence — Derived composite spectral sequence

Let F:A→B and H:B→C be additive left-exact functors between abelian categories with enough injectives. Suppose F sends injective objects to H-acyclic objects. For X in A there is a natural convergent first-quadrant spectral sequence R^aH(R^bF(X))⇒R^{a+b}(H∘F)(X), with edge maps induced by the actual adjunction/resolution maps. In the compact Hochschild–Serre application A is the ind-admissible coefficient category and F is relative H-invariants. The required category and acyclicity verification are part of that application.

**Hypotheses.** Enough injectives in all resolution categories and the stated acyclicity assumption.; A first-quadrant spectral sequence has finite filtration in each total degree.

**Planned declaration.** `TauCeti.ArithmeticDuality.grothendieckSpectralSequence`.

**Construction or proof.**

1. Resolve X injectively, then form an adapted double resolution for H applied to F of that resolution.
2. The acyclicity hypothesis identifies one filtration with the derived composite.
3. The other filtration gives the displayed page; use the existing double-complex spectral objects and identify the edges.

**Inputs.** `mathlib:DerivedCategory`; [R02.2/first-quadrant-spectral-sequence](#r022-first-quadrant-spectral-sequence)

**Acceptance.**

- If F is exact, the higher F rows vanish.
- If H is exact, only its degree-zero column remains.
- Dropping acyclicity is not a permitted hypothesis relaxation.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §3.6.3–3.6.5, pp. 92–93. The relative-invariants derived composite and its acyclicity proof.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-adic-continuous-map-flatness"></a>

### D7/adic-continuous-map-flatness — Adic continuous-map flatness

Let R be complete Noetherian local with its maximal-ideal topology and finite residue field, K a compact Hausdorff totally disconnected space, and M finitely generated over R with its adic topology. The R-module C(K,R) is flat and the canonical map C(K,R)⊗_R M→C(K,M), f⊗m↦(x↦f(x)m), is an isomorphism. The theorem applies with K=G^n to finite-type continuous cochains. Pro-free coefficient products require their product topology and the separate perfect-resolution comparison; this theorem does not replace completed tensor with ordinary tensor for infinitely generated M.

**Hypotheses.** The ring and finite module topologies are their actual adic topologies; R is complete.; K is compact Hausdorff and totally disconnected.

**Planned declaration.** `TauCeti.CompactCoefficients.adicContinuousMapFlatness`.

**Construction or proof.**

1. Write C(K,R) as the inverse limit of locally constant functions into R/mⁿ. Each reduction is a filtered colimit of finite free modules indexed by finite clopen partitions; the transition maps are surjective.
2. Apply Stacks Lemma 15.28.4 to this tower: Artin–Rees makes the finite-presentation Tor towers pro-zero, giving flatness and commutation of tensor with finite modules.
3. Identify M⊗ C(K,R/mⁿ) with C(K,M/mⁿM) at every finite clopen partition. Completeness of finite M identifies the limit with C(K,M); the comparison sends f⊗m to x↦f(x)m.

**Inputs.** `mathlib:AdicCompletion`

**Acceptance.**

- K a point recovers R⊗M≅M.
- M=R gives the identity comparison.
- The map is not asserted for arbitrary infinite M.

**Sources.**

- [PAPER-NAKAMURA-23](https://arxiv.org/pdf/2006.13647), Appendix B, Lemma B.29 and proof, author pp. 104–105; journal pp. 285–286. The continuous-function tensor and flatness input, with finite-generation hypotheses.
- [POTTHARST-13](https://msp.org/ant/2013/7-7/ant-v7-n7-p02-p.pdf), §1, Lemma 1.3(1),(5), pp. 1576–1577. Adic reduction of continuous functions and flatness of the cochain terms.
- [STACKS](https://stacks.math.columbia.edu/tag/07KW), More on Algebra, §15.28, Lemma 15.28.4, tag 0912; proof uses Lemma 15.28.3. Flat inverse limits and finite-module tensor comparison, replacing the book-only flatness criterion.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="d7-hilbert-samuel-euler-function"></a>

### D7/hilbert-samuel-euler-function — Hilbert–Samuel Euler function

For a commutative Noetherian local ring R with maximal ideal m and a finite R-module M, define P_M∈Q[X] by P_M(n)=length_R(M/m^(n+1)M) for all sufficiently large n. This cumulative Hilbert–Samuel polynomial is unique. If d=dim R, put e_R(M)=d!·coeff_d(P_M), a nonnegative integer. This normalization is additive on short exact sequences of finite modules, equals length for d=0, vanishes when dim Supp(M)<d, and, for R a domain, equals e_R(R)·rank_R(M). It differs from the multiplicity normalized by dim Supp(M). The actual length quotients, rather than a free polynomial parameter, define the function.

**Hypotheses.** R is commutative Noetherian local; M is finitely generated.; The Euler coefficient is indexed by a finite d with ringKrullDim R=d; compact arithmetic uses the complete local finite-residue specialization.; The polynomial records cumulative lengths, not the lengths of the individual graded pieces.

**Construction or proof.**

1. Give the associated graded ring and module their maximal-ideal filtration. Finite generation of the ideal and M yields a standard graded Noetherian algebra over the residue field and a finite graded module. Prove the graded Hilbert–Serre step by induction on degree-one generators, splitting off the submodule killed by a power of a chosen generator and then using the injective multiplication exact sequences.
2. Use the existing Polynomial.hilbertPoly calculation for rational Hilbert series and sum the graded lengths to get the unique eventual cumulative polynomial. Prove its degree is dim Supp(M) by a prime filtration and the dimension theorem, so the ambient coefficient is nonnegative and integral.
3. Apply the existing Artin–Rees lemma to a submodule in a short exact sequence. The induced good filtration changes only lower-degree coefficients; extracting the common ambient degree d proves additivity, including the d=0 finite-length case.
4. For a domain localize a prime filtration at its minimal prime; only the full-dimensional terms contribute. A field gives length=dimension, while Z_p gives free rank and kills finite p-power torsion.

**Inputs.** `mathlib:Module.length`; `mathlib:ringKrullDim`; `mathlib:Polynomial.hilbertPoly`; `mathlib:Ideal.exists_pow_inf_eq_pow_smul`

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.ArithmeticDuality.hilbertSamuelPolynomial` | The unique rational polynomial of eventual actual quotient lengths. |
| `TauCeti.ArithmeticDuality.hilbertSamuelPolynomial_eventual` | For some N and every n≥N, P_M(n)=length_R(M/m^(n+1)M). |
| `TauCeti.ArithmeticDuality.hilbertSamuelEuler` | Natural-valued ambient Euler function, taking the normalized coefficient at a specified d. |
| `TauCeti.ArithmeticDuality.hilbertSamuelEuler_coefficient` | When ringKrullDim R=d, its rational cast is d! times coefficient d of the cumulative polynomial. |
| `TauCeti.ArithmeticDuality.hilbertSamuelEuler_exact` | Additivity for injective/exact/surjective maps of actual finite modules at the common ring dimension. |

**Construction tests.**

- `euler_multiplicity_field`: For a field k, e_k(k^r)=r at dimension zero.
- `euler_multiplicity_zp_free`: For Z_p, e_(Z_p)(Z_p^r)=r at dimension one.
- `euler_multiplicity_zp_torsion`: For a finite Z_p-module killed by p^n, e_(Z_p)(M)=0 at dimension one.

**Uses.**

- ArithmeticGaloisDuality:D7/compact-support-euler-characteristic: Defines the additive function on finite cohomology and archimedean term modules.
- DeformationAndDerivedPatchingAlgebra:P7: The higher-tier perfect-complex and multiplicity arguments import this existing lower-tier foundation.

**Acceptance.**

- The construction does not assume that finite M has finite length over positive-dimensional R.
- Check that the cumulative polynomial convention gives rank for a free Z_p-module.
- Finite p-power torsion over Z_p has e_R=0, although its ordinary length is positive.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §4.6.5, pp. 108–109, especially 4.6.5.3–4.6.5.6. The ambient-dimension normalization used by compact Euler characteristics.
- [STACKS](https://stacks.math.columbia.edu/tag/07KW), Commutative Algebra, Proposition 10.58.7 (tag 00K1), Proposition 10.59.5 and Lemma 10.59.10 (§10.59, tag 00K4), Lemma 10.62.6 (tag 00L8); Intersection Theory, Definition 43.15.1 and Lemma 43.15.2 (§43.15, tag 0AZU). Public proofs of eventual polynomiality, degree, the Artin–Rees correction and additive ambient multiplicity.

<a id="d7-local-invariant-trivialization"></a>

### D7/local-invariant-trivialization — The local invariant map as a quasi-isomorphism

For v ∈ S_f and n ≥ 0, local class field theory gives inv_v : H²(G_v, ℤ/p^n(1)) = Br(K_v)[p^n] ≅ ℤ/p^n (5.1.3). Hence for every R-module A with trivial action, inv_v : H²_cont(G_v, A(1)) ≅ A and H^i_cont(G_v, A(1)) = 0 for i > 2, with A(1) = A ⊗_R R(1); the map i_v : A[−2] → τ_{≥2}C_cont(G_v, A(1)) induced by inv_v^{−1} is a quasi-isomorphism (5.2.1.1). For a complex A• with trivial action this gives RΓ_cont(G_v, A•(1)) → A•[−2] in D(_R Mod), and for a bounded below complex of injectives a homotopy inverse r_v : τ^{II}_{≥2}C_cont(G_v, A•(1)) → A•[−2], unique up to homotopy (5.2.1.3).

**Hypotheses.** v is a finite place of a number field; local finite-coefficient duality is imported from ClassFieldTheory.; R is complete Noetherian local with finite residue field of characteristic p; A is an admissible or ind-admissible R-module with trivial action.; The asserted invariant comparison is in the coefficient regime of Nekovář §5.2, not for every abstract topological module.

**Planned declaration.** `TauCeti.ArithmeticDuality.localInvariantTrivialization`.

**Construction or proof.**

1. 5.1.3 is local class field theory (Tate); cd_p(G_v) = 2 (5.1.2) kills degrees > 2.
2. Pass from ℤ/p^n to A by the admissibility of A(1) and continuity (Nekovář Proposition 3.2.5).
3. A quasi-isomorphism into a bounded below complex of injectives has a homotopy inverse.

**Inputs.** [R02.4/archimedean-local-duality](#r024-archimedean-local-duality); [R02.4/cohomological-dimension-bound](#r024-cohomological-dimension-bound); [R02.1/rationalization](#r021-rationalization)

**Acceptance.**

- Local class field theory and cd_p(G_v) = 2 are imported from Tau Ceti ClassFieldTheory Layer 5 and the R02.4 nodes.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.1.3 and §5.2.1, (5.2.1.1)–(5.2.1.3), pp. 114–115 (Numdam; PDF 123–124). 5.1.3 and 5.2.1, read on the page images.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-local-duality-maps"></a>

### D7/local-duality-maps — The local duality morphisms α_{J,X}

Fix v ∈ S_f, a bounded complex J of injective R-modules and r_{v,J} as above. For a bounded complex X• of admissible R[G_v]-modules put D_J(X•) = Hom•_R(X•, J). The evaluation ev₂ : X• ⊗_R D_J(X•)(1) → J(1), the cup product and r_{v,J} give a morphism of complexes C•_cont(G_v, X•) ⊗ C•_cont(G_v, D_J(X•)(1)) → J[−2], hence by adjunction α_{J,X•} : C•_cont(G_v, X•) → D_{J[−2]}(C•_cont(G_v, D_J(X•)(1))), and a well-defined α_{J,X} : RΓ_cont(G_v, X) → D_{J[−2]}(RΓ_cont(G_v, D_J(X)(1))) in D^b(_R Mod) independent of r_{v,J}; symmetrically α′_{J,X} from ev₁. They induce pairings H^i_cont(G_v, X) ⊗ H^j_cont(G_v, D_J(X)(1)) → H^{i+j−2}(J•) (5.2.2.1).

**Hypotheses.** K a global field of characteristic ≠ p, S a finite set of primes containing those above p and the archimedean ones, S_f its non-archimedean part, G_{K,S} = Gal(K_S/K) and G_v the decomposition groups through fixed embeddings; R a complete local noetherian ring with finite residue field of characteristic p; condition (P): if p = 2 then K has no real prime (the case without (P) is its own node).; Two choices of J (5.2.3): (A) J = I[n], I an injective hull of the residue field (D_J is Matlis duality); (B) J = ω•[n], a dualizing complex (Grothendieck duality). In both, ε_J : X → D_J(D_J(X)) is a quasi-isomorphism under the finiteness hypotheses.

**Construction or proof.**

1. The adjunction Hom(A ⊗ B, C) = Hom(A, Hom(B, C)) (Nekovář 1.2.6) turns the pairing into α.
2. Independence of r_{v,J}: two homotopy inverses are homotopic.
3. Matlis duality (Nekovář 2.3.2) and Grothendieck duality (2.6, 2.8.11) give ε_J, cited from Nekovář Chapter 2.

**Inputs.** [D7/local-invariant-trivialization](#d7-local-invariant-trivialization); [R02.1/cochains-inverse-limit](#r021-cochains-inverse-limit)

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.GaloisCohomology.dualizingHom` | D_J(X•) = Hom•_R(X•, J). |
| `TauCeti.GaloisCohomology.localDualityMap` | Given actual global cochain complexes A,B, dualizing J, and a degree −2 cochain pairing β, adjunction gives A→Hom•(B,J[−2]). The arithmetic pairing and invariant trace bind this generic signature to RΓ. |
| `TauCeti.GaloisCohomology.localDualityMap'` | The reversed evaluation pairing gives B→Hom•(A,J[−2]) on the same canonical Hom complex. |
| `TauCeti.GaloisCohomology.localDualityPairing` | The actual chain pairing descends to H^i(A)×H^j(B)→H^{i+j}(J[−2]); local trace identifies its arithmetic specialization. |
| `TauCeti.GaloisCohomology.localDualityMap_indep` | Homotopic cochain pairings induce homotopic duality morphisms; an invariant-trace homotopy identifies different arithmetic choices. |

**Construction tests.**

- `dualizing_hom_degree`: The nth term of the dualizing Hom is the existing Cochain(A,J,n) module.
- `dualizing_zero`: A zero first complex gives the zero duality map.
- `dualizing_infinite_biddual`: The F₂-linear bidual map of the countable direct sum of F₂ is not surjective.

**Uses.**

- ArithmeticGaloisDuality:D7/derived-local-duality: the maps shown to be isomorphisms
- ArithmeticGaloisDuality:D7/local-duality-functoriality: naturality and symmetry of α, α′

**Acceptance.**

- The dualizing functors of Nekovář Chapter 2 are cited, not decomposed (remaining).
- Arithmetic acceptance case: R = ℤ_p, J = ℚ_p/ℤ_p, X = ℤ/p: the pairing H⁰(G_v, ℤ/p) × H²(G_v, μ_p) → H²(G_v, μ_p) ≅ ℤ/p is Tate's cup-product pairing (5.1.4).
- Arithmetic acceptance case: X = 0 gives the zero map.
- Arithmetic acceptance case: Without the finiteness hypotheses of 5.2.3, ε_J need not be a quasi-isomorphism (for example X = ⊕_ℕ ℤ/p with J = I), and α need not be an isomorphism.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.2.2–5.2.3, pp. 115–116 (PDF 124–125). 5.2.2 (construction of α and α′, pairings (5.2.2.1)) and 5.2.3 (the choices of J), read on the page images.

<a id="d7-derived-local-duality"></a>

### D7/derived-local-duality — Derived local Tate duality

Assume (i) J = I[n] and X ∈ D^b_{R-ft} or D^b_{R-coft} of admissible R[G_v]-modules, or (ii) J = ω•[n] and X ∈ D^b_{R-ft}. Then α_{J,X} and α′_{J,X} are isomorphisms in D^b(_R Mod) (Proposition 5.2.4); α_{J[n],X} is α_{J,X} shifted (Lemma 5.2.5). Consequently, if T, T* ∈ D^b_{R-ft} and A, A* ∈ D^b_{R-coft} are related by the duality diagram (T* = 𝒟(T), A = Φ(T), A* = D(T)), then so are RΓ_cont(G_v, T), RΓ_cont(G_v, T*(1))[2], RΓ_cont(G_v, A) and RΓ_cont(G_v, A*(1))[2], and there is a spectral sequence E₂^{i,j} = Ext^i_R(H^{2−j}_cont(G_v, T*(1)), ω) = Ext^i_R(D(H^j_cont(G_v, A)), ω) ⇒ H^{i+j}_cont(G_v, T) (Theorem 5.2.6). On cohomology, cup product gives H^i(G_v, T) ≅ D(H^{2−i}(G_v, A*(1))) and H^j(G_v, A*(1)) ≅ D(H^{2−j}(G_v, T)) (5.2.10).

**Hypotheses.** Local field F_v finite over Q_p; R as in Nekovář §5.2.; The coefficient complex is bounded with finite-type or cofinite-type cohomology, as appropriate for Matlis duality; dualizing-complex duality uses finite-type cohomology.

**Planned declaration.** `TauCeti.ArithmeticDuality.derivedLocalDuality`.

**Planet.** Derived local duality.

**Construction or proof.**

1. (i): triangles and truncation reduce to a single module; Lemma 5.2.5 reduces to J = I; for X = T of finite type, α_T is the limit of α_{I,T/𝔪^nT}, which are Tate's local duality (5.1.4) for finite modules, and u₁, …, u₈ are quasi-isomorphisms by the Mittag-Leffler lemmas (Nekovář 4.1.2, 4.2.4); dually for A of cofinite type.
2. (ii): reduce to J = ω•[d] and compare with J = I through Φ_{−d} and the trace, using Nekovář 2.8.12, 1.2.13 and 3.5.8.
3. Theorem 5.2.6: combine the isomorphisms of 5.2.4 with Nekovář 4.3.1 and 2.8.1; the spectral sequence is 2.8.6 applied to the diagram.

**Inputs.** [D7/local-duality-maps](#d7-local-duality-maps); [D7/local-invariant-trivialization](#d7-local-invariant-trivialization); [R02.1/milnor-sequence](#r021-milnor-sequence); [R02.1/mittag-leffler-lim-one](#r021-mittag-leffler-lim-one)

**Acceptance.**

- This is the derived form of local Tate duality asked for in D7; the finite-module duality (5.1.4) is imported from Tau Ceti ClassFieldTheory Layer 5.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.2.4–5.2.6 and 5.2.10, pp. 116–121 (PDF 125–130). Proposition 5.2.4, Lemma 5.2.5, Theorem 5.2.6 and 5.2.10, read on the page images.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-local-duality-functoriality"></a>

### D7/local-duality-functoriality — Functoriality and symmetry of local duality

For f : X• → Y• of bounded complexes of admissible R[G_v]-modules: α_{J,X•} = α′_{J,D_J(X•)(1)} ∘ (ε_J)_*; the squares of α and α′ with f_* and (D_J(f)(1))_* commute; and the composite D_{J[−2]}(α′_{J,X•}) ∘ ε_{J[−2]} is homotopic to α_{J,X•} (Proposition 5.2.7, Corollary 5.2.8). In the self-dual case f : X → D_J(X)(1) with g = D_J(f)(1) ∘ ε_J, the pairings satisfy ∪_g = ∪_f ∘ s₁₂; in particular g = ±f gives ∪_f ∘ s₁₂ = ±∪_f (5.2.9).

**Hypotheses.** K a global field of characteristic ≠ p, S a finite set of primes containing those above p and the archimedean ones, S_f its non-archimedean part, G_{K,S} = Gal(K_S/K) and G_v the decomposition groups through fixed embeddings; R a complete local noetherian ring with finite residue field of characteristic p; condition (P): if p = 2 then K has no real prime (the case without (P) is its own node).

**Planned declaration.** `TauCeti.ArithmeticDuality.localDualityFunctoriality`.

**Construction or proof.**

1. (i) from Nekovář 1.2.12 and the commutative diagram of cup products and evaluation maps (1.2.9).
2. (ii) from 1.2.11; (iii) from (1.2.7.1), 3.4.5.4 and 1.2.14, with the involution 𝒯 homotopic to the identity.
3. 5.2.9 from (1.2.7.1) and a derived version of 1.2.10.

**Inputs.** [D7/local-duality-maps](#d7-local-duality-maps); [D7/derived-local-duality](#d7-derived-local-duality)

**Acceptance.**

- These are the sign normalisations D7 asks to fix once; they are the ones Nekovář uses throughout.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.2.7–5.2.9, pp. 119–121 (PDF 128–130). Proposition 5.2.7, Corollary 5.2.8 and 5.2.9.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-compact-support-cochains"></a>

### D7/compact-support-cochains — Continuous cochains with compact support

For bounded complexes of ind-admissible coefficients, extend R02.3 finite compact support using the actual morphism of continuous cochain complexes res: C(G_{F,S},X) → ⊕_{v∈S_f}C(G_v,X). The complex is Cone(res)[−1], with differential d(a,b)=(da,−res(a)−db), and has its triangle, long exact sequence and change-of-embedding homotopy equivalence. Under (P), p odd or F totally imaginary, finite-type/cofinite-type boundedness follows from arithmetic finiteness. At real dyadic places use the separate Tate-corrected construction; do not assert boundedness for the finite-place cone there.

**Hypotheses.** S is finite and contains p and infinity.; R is complete Noetherian local with finite residue field; X is bounded ind-admissible.; Bounded duality and perfectness use (P), unless the real-place correction is explicitly invoked.

**Planet.** Compactly supported cochains.

**Construction or proof.**

1. The cone of a morphism of complexes is a complex; the triangle is the cone triangle shifted.
2. Embedding change: the first square commutes up to the homotopy h_v = α′*_v ⋆ h_{σ_v}(M•) ⋆ inf, the second strictly; Cone(id, (σ_v)_*, h) is a homotopy equivalence with inverse Cone(id, (σ_v^{−1})_*, h′), by Nekovář 1.1.7 and a 2-homotopy.
3. Lemma 5.3.2 from Nekovář 4.2.7 for the global and local terms and the long exact sequence.

**Inputs.** [R02.3/finite-compact-support](#r023-finite-compact-support); [D7/admissible-coefficients](#d7-admissible-coefficients); [D7/continuous-derived-cochains](#d7-continuous-derived-cochains)

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.GaloisCohomology.compactCochains` | C•_{c,cont}(G_{K,S}, M•) as the shifted cone of res_{S_f}. |
| `TauCeti.GaloisCohomology.compactCohomology` | H^i_{c,cont}(G_{K,S}, M•). |
| `TauCeti.GaloisCohomology.compactTriangle` | The exact triangle (5.3.1.1) and the long exact sequence (5.3.1.2). |
| `TauCeti.GaloisCohomology.compactCochains_embedding` | A change of embeddings gives a homotopy equivalence of cones. |
| `TauCeti.GaloisCohomology.compactCochains_finite` | For a Noetherian ring, finite global/local cohomology in the relevant degrees implies finite cohomology of the fibre. The cofinite and amplitude forms require the requested derived coefficient interfaces. |
| `TauCeti.GaloisCohomology.compactCochains_diff` | d(a, a_S) = (da, −res_{S_f}(a) − da_S). |

**Construction tests.**

- `cone_square_zero`: The signed mapping-fibre differential composes to zero.
- `compact_no_local`: A zero local complex recovers the original global cohomology.
- `h0_vanishes`: If the local complex has no negative cohomology and localization on H⁰ is injective, H⁰ of the fibre vanishes.

**Uses.**

- ArithmeticGaloisDuality:D7/compact-support-cup-products: the two cup products
- ArithmeticGaloisDuality:D7/derived-global-duality: RΓ_c in global duality
- SelmerIwasawaCohomology:L2: Selmer complexes as mapping fibres modelled on this cone

**Acceptance.**

- With the other convention (archimedean terms included) the cone differs at real places; for p = 2 with real places Nekovář uses modified Tate complexes (see compact-support-without-p).
- R02.3 asks for compactly supported cohomology "using the localisation map and the corrected infinite-place terms"; this node supplies the finite-place construction and without-p supplies the correction.
- Arithmetic acceptance case: K = ℚ, S = {p, ∞}, p odd, M = 𝔽_p: H⁰_c = H¹_c = H³_c = 0 and H²_c ≅ 𝔽_p, so χ_c = 1 = dim 𝔽_p^{G_ℝ} (Theorem 5.3.6).
- Arithmetic acceptance case: For p = 2 and K with a real place the finite-place cone does not give Poitou–Tate; Tate cohomology at real places must be added (5.7).

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.3.1–5.3.2, pp. 122–123 (PDF 131–132). Definition 5.3.1.1, 5.3.1.2, 5.3.1.3 with (5.3.1.1)–(5.3.1.2), and Lemma 5.3.2, read on the page images.

<a id="d7-compact-support-cup-products"></a>

### D7/compact-support-cup-products — Cup products with compact support

For complexes A•, B• of ind-admissible R[G_{K,S}]-modules there are two cup products C•_{c,cont}(A•) ⊗ C•_cont(B•) → C•_{c,cont}(A• ⊗ B•), (a, a_S) _c∪ b = (a ∪ b, a_S ∪ res_{S_f}(b)), with d((a, a_S) _c∪ b) = d(a, a_S) _c∪ b + (−1)^{deg(a,a_S)}(a, a_S) _c∪ db (5.3.3.2); and C•_cont(A•) ⊗ C•_{c,cont}(B•) → C•_{c,cont}(A• ⊗ B•), a ∪_c (b, b_S) = (a ∪ b, (−1)^{deg a} res_{S_f}(a) ∪ b_S), with d(a ∪_c (b, b_S)) = (da) ∪_c (b, b_S) + (−1)^{deg a} a ∪_c d(b, b_S) (5.3.3.3). The involutions 𝒯 extend to compact support and are homotopic to the identity, the product diagram with s₁₂ commutes (5.3.3.4), and both products are compatible with ∪ through C_c → C (5.3.3.5).

**Hypotheses.** K a global field of characteristic ≠ p, S a finite set of primes containing those above p and the archimedean ones, S_f its non-archimedean part, G_{K,S} = Gal(K_S/K) and G_v the decomposition groups through fixed embeddings; R a complete local noetherian ring with finite residue field of characteristic p; condition (P): if p = 2 then K has no real prime (the case without (P) is its own node).

**Construction or proof.**

1. The Leibniz rules follow from those of ∪ and the differential d(a, a_S) = (da, −res(a) − da_S), using that res is a ring map on cochains.
2. The sign (−1)^{deg a} in ∪_c is forced by moving d past a.

**Inputs.** [D7/compact-support-cochains](#d7-compact-support-cochains)

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.GaloisCohomology.compactCupLeft` | _c∪ : C_c(A) ⊗ C(B) → C_c(A ⊗ B). |
| `TauCeti.GaloisCohomology.compactCupRight` | ∪_c : C(A) ⊗ C_c(B) → C_c(A ⊗ B). |
| `TauCeti.GaloisCohomology.compactCupLeft_leibniz` | The Leibniz rule for _c∪. |
| `TauCeti.GaloisCohomology.compactCupRight_leibniz` | The Leibniz rule for ∪_c with the sign (−1)^{deg a}. |
| `TauCeti.GaloisCohomology.compactCup_forget` | Compatibility with ∪ through C_c → C. |
| `TauCeti.GaloisCohomology.compactCupLeft_coordinates` | The global coordinate is a cup b and the local coordinate is a_S cup res(b). |
| `TauCeti.GaloisCohomology.compactCupRight_coordinates` | The global coordinate is a cup b and the local coordinate is (−1)^i res(a) cup b_S. |

**Construction tests.**

- `degree_one_sign`: For deg a = 1, a ∪_c (b, b_S) = (a ∪ b, −res(a) ∪ b_S).
- `empty_S_f`: S_f = ∅: C_c = C and both products are ∪.
- `no_sign`: Without the sign (−1)^{deg a}, ∪_c fails the Leibniz rule for odd-degree a.

**Uses.**

- ArithmeticGaloisDuality:D7/derived-global-duality: the pairings β, _cβ

**Acceptance.**

- These signs are the single sign normalisation D7 asks for at the compact-support level.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.3.3, pp. 123–124 (PDF 132–133). 5.3.3.1–5.3.3.5, read on the page images.

<a id="d7-compact-support-euler-characteristic"></a>

### D7/compact-support-euler-characteristic — Euler–Poincaré characteristic with compact support

For finite discrete F_p[G_(F,S)]-module M under (P), the compact-support Euler sum Σ_(q=0)^3 (−1)^q dim_(F_p) H_c^q(F,S,M) equals Σ_(v|∞) dim_(F_p) M^(G_v). More generally, for a bounded complex T• of finite-type admissible R[G_(F,S)]-modules, Σ_i(−1)^i e_R(H_c^i(F,S,T•))=Σ_(v|∞)Σ_q(−1)^q e_R((T^q)^(G_v)), where e_R is the ambient-dimension Hilbert–Samuel function of D7/hilbert-samuel-euler-function.

**Hypotheses.** R is complete Noetherian local of finite Krull dimension with finite residue field of characteristic p; S is finite and contains p, infinity and ramification.; Assume (P): p is odd or F has no real places.; T• is bounded and each term is finite-type admissible; finite cohomology alone does not justify the displayed termwise right-hand side.; e_R is normalized by dim R. It agrees with length only in dimension zero; finite-length torsion over a positive-dimensional domain contributes zero.

**Planned declaration.** `TauCeti.ArithmeticDuality.compactSupportEulerCharacteristic`.

**Construction or proof.**

1. For residual finite coefficients combine the finite compact-support long exact sequence with global and finite-local Euler formulas; the remaining terms are ordinary invariants at infinity.
2. For finite-type terms filter the actual cochain complexes by powers of the maximal ideal. The graded spectral sequence and good filtrations give finite graded modules; Artin–Rees controls changes of filtration. Use Hilbert–Serre and evaluate the normalized generating functions at 1, retaining the vanishing of lower-dimensional terms, as in Nekovář §4.6.
3. Apply additivity of the ambient Euler function to the compact-support triangle and truncate the bounded term complex. Under (P), arithmetic finiteness and cohomological dimension make the alternating sums finite.

**Inputs.** [D7/compact-support-cochains](#d7-compact-support-cochains); [R02.4/global-euler-characteristic](#r024-global-euler-characteristic); [R02.4/euler-characteristic-additivity](#r024-euler-characteristic-additivity); [D7/derived-tensor-and-tor](#d7-derived-tensor-and-tor); [D7/matlis-coefficient-duality](#d7-matlis-coefficient-duality); [D7/hilbert-samuel-euler-function](#d7-hilbert-samuel-euler-function)

**Acceptance.**

- Retain ordinary archimedean invariants on the right-hand side, even though compact support uses Tate local terms.
- A finite p-power torsion coefficient over Z_p gives zero multiplicity on both sides; the residual-field dimension formula is a distinct coefficient-ring specialization.
- The noncommutative refinement of §5.3.7 belongs outside this commutative coefficient target.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.3.5–5.3.7, pp. 124–125 (PDF 133–134). 5.3.5 and Theorem 5.3.6.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-global-invariant-trivialization"></a>

### D7/global-invariant-trivialization — The global invariant map on H³_c

The long exact sequence (5.3.1.2) and the reciprocity law 5.1.5 give inv : H³_{c,cont}(G_{K,S}, ℤ/p^n(1)) ≅ ℤ/p^n (5.4.1). Hence H^i_{c,cont}(G_{K,S}, A(1)) is A for i = 3 and 0 for i > 3, for R-modules A with trivial action, and i : A[−3] → τ_{≥3}C•_{c,cont}(G_{K,S}, A(1)) (from inv^{−1}) is a quasi-isomorphism (5.4.1.1). Since res_{S_f} : H²(G_{K,S}, A^i(1)) → ⊕ H²(G_v, A^i(1)) is injective, τ^{II}_{≥3}C_c ≅ Cone(τ_{≥2}C(G_{K,S}) → ⊕ τ_{≥2}C(G_v))[−1] (5.4.1.2); for a bounded complex J of injectives, a homotopy equivalence with J[−2] ⊕ … yields r_J : τ^{II}_{≥3}C_{c,cont}(G_{K,S}, J(1)) → J[−3], unique up to homotopy (5.4.1.3).

**Hypotheses.** K a global field of characteristic ≠ p, S a finite set of primes containing those above p and the archimedean ones, S_f its non-archimedean part, G_{K,S} = Gal(K_S/K) and G_v the decomposition groups through fixed embeddings; R a complete local noetherian ring with finite residue field of characteristic p; condition (P): if p = 2 then K has no real prime (the case without (P) is its own node).

**Planned declaration.** `TauCeti.ArithmeticDuality.globalInvariantTrivialization`.

**Construction or proof.**

1. Reciprocity (5.1.5): 0 → H²(G_{K,S}, ℤ/p^n(1)) → ⊕_{v∈S_f} H²(G_v, ℤ/p^n(1)) → ℤ/p^n → 0; with (5.3.1.2) and cd_p = 2 this computes H³_c.
2. The injectivity of res_{S_f} on H² gives the cone description; fixing v₀ ∈ S_f, i_S = j ∘ i_{v₀} is a quasi-isomorphism, hence a homotopy equivalence.

**Inputs.** [D7/compact-support-cochains](#d7-compact-support-cochains); [D7/local-invariant-trivialization](#d7-local-invariant-trivialization); [R02.4/h2-localisation-surjective](#r024-h2-localisation-surjective); [R02.3/s-idele-class-reciprocity](#r023-s-idele-class-reciprocity)

**Acceptance.**

- The reciprocity sequence is imported from R02.3/R02.4 (sum of local invariants).

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.4.1, pp. 125–126 (PDF 134–135). 5.4.1 with (5.4.1.1)–(5.4.1.3), read on the page images.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-derived-global-duality"></a>

### D7/derived-global-duality — Derived Poitou–Tate duality

For X ∈ D^b of admissible R[G_{K,S}]-modules, the cup products _c∪ and ∪_c with ev₂, ev₁ and r_J give maps _cβ_{J,X} : RΓ_cont(G_{K,S}, X) → D_{J[−3]}(RΓ_{c,cont}(G_{K,S}, D_J(X)(1))), β_{c,J,X} : RΓ_{c,cont}(G_{K,S}, X) → D_{J[−3]}(RΓ_cont(G_{K,S}, D_J(X)(1))) and their primed versions, independent of choices, and pairings H^i_{c,cont}(G_{K,S}, X) ⊗ H^j_cont(G_{K,S}, D_J(X)(1)) → H^{i+j−3}(J•) (5.4.2.1). Under (i) J = I[n] with X R-finite or R-cofinite, or (ii) J = ω•[n] with X R-finite, these maps are isomorphisms (Proposition 5.4.3); they are natural and symmetric as in 5.2.7 (Proposition 5.4.4). If T, T*, A, A* are related by the duality diagram, so are RΓ_cont(G_{K,S}, T), RΓ_{c,cont}(G_{K,S}, T*(1))[3], RΓ_cont(G_{K,S}, A) and RΓ_{c,cont}(G_{K,S}, A*(1))[3], with spectral sequences E₂^{i,j} = Ext^i_R(H^{3−j}_{c,cont}(G_{K,S}, T*(1)), ω) ⇒ H^{i+j}_cont(G_{K,S}, T) and ′E₂^{i,j} = Ext^i_R(H^{3−j}_cont(G_{K,S}, T*(1)), ω) ⇒ H^{i+j}_{c,cont}(G_{K,S}, T) (Theorem 5.4.5).

**Hypotheses.** R is complete Noetherian local with finite residue field and admits the stated injective/dualizing complex.; S contains p and infinity and is finite; bounded statements assume p odd or F totally imaginary.; At p=2 with real places use compact-support-without-p in the unbounded derived category.

**Planned declaration.** `TauCeti.ArithmeticDuality.derivedGlobalDuality`.

**Planet.** Derived Poitou–Tate duality.

**Construction or proof.**

1. As for Proposition 5.2.4, reduce to a finite discrete ℤ/p^n[G_{K,S}]-module M, where the statement is a variant of Poitou–Tate (5.1.6): the non-obvious maps of the nine-term sequence are the cup products ∪_c : H^i(G_{K,S}, M) × H^{3−i}_c(G_{K,S}, M*(1)) → H³_c(G_{K,S}, ℤ/p^n(1)) ≅ ℤ/p^n and _c∪ (Nekovář cites [Ni, Lemma 6.1] and NSW 8.6.13).
2. Proposition 5.4.4 as 5.2.7, with the diagram of 5.3.3.4 replacing that of 3.4.5.4.
3. Theorem 5.4.5 as 5.2.6 from Proposition 5.4.3.

**Inputs.** [D7/global-invariant-trivialization](#d7-global-invariant-trivialization); [D7/compact-support-cup-products](#d7-compact-support-cup-products); [D7/derived-local-duality](#d7-derived-local-duality); [D7/local-duality-maps](#d7-local-duality-maps); [R02.4/poitou-tate](#r024-poitou-tate); [R02.4/tate-global-duality](#r024-tate-global-duality)

**Acceptance.**

- The finite nine-term Poitou–Tate sequence (R02.4/poitou-tate) is the input; this node is its derived, compact/lattice form, with the modified archimedean terms in compact-support-without-p.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.4.2–5.4.5, pp. 126–128 (PDF 135–137). 5.4.2 (the maps and pairings), Propositions 5.4.3–5.4.4 and Theorem 5.4.5, read on the page images.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-duality-after-localization"></a>

### D7/duality-after-localization — Duality after localising the coefficients

For a multiplicative set 𝒮 ⊆ R, 5.2.1–5.2.2, 5.2.7–5.2.9, 5.4.1–5.4.2 and 5.4.4 hold with R replaced by R_𝒮. If J = ω•_{R_𝒮}[n] (so D_J = 𝒟_{R_𝒮,n}) and the cohomology of X is of finite type over R_𝒮, then α_{J,X} : RΓ_cont(G_v, X) → 𝒟_{R_𝒮,n−2}(RΓ_cont(G_v, 𝒟_{R_𝒮,n}(X)(1))) and _cβ_{J,X}, _cβ′, β_c, β′_c are isomorphisms (Proposition 5.6.3).

**Hypotheses.** K a global field of characteristic ≠ p, S a finite set of primes containing those above p and the archimedean ones, S_f its non-archimedean part, G_{K,S} = Gal(K_S/K) and G_v the decomposition groups through fixed embeddings; R a complete local noetherian ring with finite residue field of characteristic p; condition (P): if p = 2 then K has no real prime (the case without (P) is its own node).

**Planned declaration.** `TauCeti.ArithmeticDuality.dualityAfterLocalization`.

**Construction or proof.**

1. Dévissage reduces to an admissible R_𝒮[G_v]-module X of finite type over R_𝒮; then X = 𝒮^{−1}Y with Y of finite type over R (Nekovář 3.7.3), and α is the localisation of α_{ω[n],Y} from 5.2.4; similarly with 5.4.3.

**Inputs.** [D7/derived-local-duality](#d7-derived-local-duality); [D7/derived-global-duality](#d7-derived-global-duality)

**Acceptance.**

- Rational coefficients (R = ℤ_p, 𝒮 = {p^n}) are the case D7 needs for lattice and rational Poitou–Tate.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.6, Proposition 5.6.3, p. 130 (PDF 139). 5.6.1–5.6.3.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-compact-support-without-p"></a>

### D7/compact-support-without-p — Duality when p = 2 and K has real places

For p=2 and real places, replace the finite local target of res by the sum of finite ordinary cochains and complete Tate cochains at every real place, then take its mapping fibre Ĉ_c. Ordinary global cohomology remains unbounded above, and Ĉ_c may have negative-degree cohomology; the source does not replace ordinary global cochains by a bounded carrier. For finite M the pairings Hⁱ(G_{F,S},M) × Ĥ_c^{3−i}(G_{F,S},M^D) → R are perfect for all integer i, with Ĥ_cⁱ=0 for i>3. The corresponding finite-type/cofinite-type derived duality lives in the unbounded derived category. Inverting 2 identifies the ordinary and modified compact-support complexes and restores the bounded comparison.

**Hypotheses.** K a global field of characteristic ≠ p, S a finite set of primes containing those above p and the archimedean ones, S_f its non-archimedean part, G_{K,S} = Gal(K_S/K) and G_v the decomposition groups through fixed embeddings; R a complete local noetherian ring with finite residue field of characteristic p; p = 2 and K has at least one real prime.

**Planned declaration.** `TauCeti.ArithmeticDuality.compactSupportWithoutP`.

**Construction or proof.**

1. These are the classical statements with Tate cohomology at real places (NSW Chapter VIII), restated by Nekovář; the constructions of 5.3 are repeated with Ĉ at real places.

**Inputs.** [D7/compact-support-cochains](#d7-compact-support-cochains); [D7/derived-global-duality](#d7-derived-global-duality); [R02.4/archimedean-local-duality](#r024-archimedean-local-duality); [R02.4/poitou-tate](#r024-poitou-tate)

**Acceptance.**

- A trivial Z/2 module at a real place has nonzero Tate cohomology in every integer degree.
- Do not claim perfect bounded complexes in the real dyadic case without a separate bounded truncation and its correction.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.7.1–5.7.6, pp. 130–133, formulas checked on printed p. 133. The complete Tate local terms, finite pairings, unbounded derived duality and comparison after inverting 2.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-admissible-coefficients"></a>

### D7/admissible-coefficients — Admissible compact and cofinite coefficients

For complete Noetherian local R with finite residue field, an R[G]-module is admissible when the image of R[G] in End_R(M) is finitely generated over R and the induced representation is continuous for the m-adic topology on that finite image algebra. Ind-admissible means a filtered union of admissible submodules. For finite-type M this is its m-adic topology; for cofinite-type M use its discrete Matlis-dual topology. This defines a full coefficient subcategory of the existing Tau Ceti/Mathlib representation carrier, with actual continuity rather than per-operator continuity.

**Hypotheses.** G is profinite; R is complete Noetherian local with finite residue field.; Finite-type and cofinite-type regimes are distinct and remain visible.

**Planet.** Admissible coefficients.

**Construction or proof.**

1. Form the R-subalgebra generated by the existing representation image.
2. Give finite image algebra its m-adic topology and impose continuity of the representation map.
3. Use the source’s exact coefficient category and closure under kernels, cokernels, extensions, restriction and finite induction.

**Inputs.** [D7/adic-continuous-map-flatness](#d7-adic-continuous-map-flatness); [R02.1/completed-tensor-comparison](#r021-completed-tensor-comparison); `mathlib:TopRep`; `tauceti:TauCeti.DiscreteRep`

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.ArithmeticDuality.actionSpan` | The span of the existing representation image in its endomorphism module. |
| `TauCeti.ArithmeticDuality.isAdmissible` | Finiteness of the image algebra and adic continuity. |
| `TauCeti.ArithmeticDuality.admissible_of_finite` | Finite discrete jointly continuous modules are admissible. |
| `TauCeti.ArithmeticDuality.admissible_of_finiteType` | Finite-type continuous modules give the finite-type regime. |

**Construction tests.**

- `admissible_trivial`: The image algebra of a trivial representation is the cyclic R-span of Id, including the zero-module case.
- `admissible_zero`: The zero module has zero image algebra.
- `admissible_joint`: For a finite-type module with the maximal-ideal topology, admissibility implies joint continuity of the action.

**Uses.**

- ArithmeticGaloisDuality:D7/continuous-derived-cochains: Coefficient category for continuous derived invariants.
- PAPER-NAKAMURA-23/61: Finite and pro-free coefficient comparisons.

**Acceptance.**

- A finite discrete continuous module is admissible.
- A finite free continuous R-lattice is admissible.
- A TopRep with discontinuous dependence on G is excluded.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §3.2.1–3.2.5, pp. 75–77; §4.1, pp. 95–96. Admissibility and the finite/cofinite coefficient topology.

<a id="d7-continuous-derived-cochains"></a>

### D7/continuous-derived-cochains — Continuous cochains in the derived category

For jointly continuous compact or ind-admissible coefficients use the existing TopRep.homogeneousCochains, its inhomogeneous comparison and algebraic forgetful functor to obtain an actual cochain complex C_cts(G,X) of R-modules. For bounded coefficient complexes totalize with the Koszul sign. Its localization/restriction maps are chain maps and agree with pinned low-degree coefficient maps. On ind-admissible coefficients the source’s comparison to derived invariants gives RΓ_cts; on inverse systems compare to Jannsen’s RlimΓ and retain Milnor. This creates comparison functors, not a second Hcts carrier.

**Hypotheses.** Joint continuity is explicit.; Use finite-type, cofinite-type or ind-admissible hypotheses needed for the derived-invariants comparison.; For non-discrete coefficients do not automatically identify naive derived invariants in the discrete category.

**Construction or proof.**

1. Forget topology on the existing homogeneous cochain complex and use R02.1 dehomogenization.
2. For a bounded coefficient complex construct its double complex and total with the fixed sign convention.
3. Apply the effaceability/comparison proof in the ind-admissible category; identify degree-zero invariants.
4. Check the finite-level tower and derived-limit comparison using Milnor.

**Inputs.** [D7/admissible-coefficients](#d7-admissible-coefficients); [R02.1/carrier-comparison](#r021-carrier-comparison); [R02.1/milnor-sequence](#r021-milnor-sequence); `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`; [D7/derived-tensor-and-tor](#d7-derived-tensor-and-tor); [D7/matlis-coefficient-duality](#d7-matlis-coefficient-duality)

**API.**

| Declaration | Contract |
|---|---|
| `TauCeti.ArithmeticDuality.algebraicContinuousCochains` | Forget topology on the existing homogeneous continuous cochain complex. |
| `TauCeti.ArithmeticDuality.algebraicContinuousCohomology` | Its algebraic cohomology, compared with the existing topological carrier. |
| `TauCeti.ArithmeticDuality.algebraicCohomology_compare` | Underlying algebraic cohomology agrees with continuousCohomology. |
| `TauCeti.ArithmeticDuality.continuousCochains_d_squared` | The actual complex differential composes to zero. |

**Construction tests.**

- `cochains_d_squared`: The differential of the actual homogeneous cochain complex composes to zero.
- `cochains_homogeneous`: The prototype uses the existing Mathlib homogeneous carrier.
- `cochains_zero`: Zero cochains have zero differential.

**Uses.**

- ArithmeticGaloisDuality:D7/derived-local-duality: Source and target of the actual derived morphism.
- ArithmeticGaloisDuality:D8: Restriction and trace maps defining comparison fibres.

**Acceptance.**

- The H¹/H² comparison matches existing Tau Ceti maps.
- The differential squares to zero as a chain-complex identity.
- No arbitrary Prop-valued cohomology datum replaces an actual complex.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §§3.4–3.6, pp. 81–93; §4.1, pp. 95–97. The actual continuous complex, derived invariants and total signs.
- [JANNSEN](https://epub.uni-regensburg.de/26684/1/jannsen12.pdf), §2, Theorem 2.2, pp. 215–216. Comparison with derived inverse-limit cohomology.

<a id="d7-cochain-finiteness-perfectness"></a>

### D7/cochain-finiteness-perfectness — Cohomological finiteness and perfect amplitude

Assume G satisfies (F): cohomology of every finite-length discrete module is finite length, equivalently finite-dimensional Hⁱ(U,k) for each open U and degree. Finite-type continuous T then has finite-type Hⁱ, and cofinite A has cofinite Hⁱ. If cd_p G≤e, these groups vanish above e. For a bounded coefficient complex perfect over R in degrees [a,b], RΓ_cts(G,T) is perfect over R with amplitude contained in [a,b+e], under the source’s completeness and finiteness hypotheses. Local number-field groups have e=2; restricted global groups have e=2 under (P). Real dyadic ordinary global complexes do not meet this bound.

**Hypotheses.** R is complete Noetherian local with finite residue field; coefficients are admissible.; Perfectness is an R-module assertion, not a claim of projectivity as an R[G]-module.; Finite cd and (F) are both used.

**Planned declaration.** `TauCeti.ArithmeticDuality.cochainFinitenessPerfectness`.

**Construction or proof.**

1. Reduce finite-type coefficients modulo mⁿ and use finite-length cohomology plus ML.
2. Use Matlis duality for cofinite coefficients.
3. Use surjectivity at top finite cohomological degree to remove the possible lim¹ in e+1.
4. Apply the imported perfect-complex criterion after finite residual amplitude and finite generation.

**Inputs.** [D7/continuous-derived-cochains](#d7-continuous-derived-cochains); [R02.4/global-finiteness](#r024-global-finiteness); [R02.4/cohomological-dimension-bound](#r024-cohomological-dimension-bound); [D7/derived-tensor-and-tor](#d7-derived-tensor-and-tor); [D7/matlis-coefficient-duality](#d7-matlis-coefficient-duality)

**Acceptance.**

- Local lattice cohomology vanishes outside 0,1,2.
- For a degree-zero perfect lattice the stated interval is [0,e].
- A real dyadic field is an explicit excluded case.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §4.2.1–4.2.9, pp. 97–100. The (F) condition, finite/cofinite cohomology and perfect amplitude.
- [POTTHARST-13](https://msp.org/ant/2013/7-7/ant-v7-n7-p02-p.pdf), §1, Theorem 1.1 and Corollary 1.2, pp. 1576–1578. Independent finite-flat coefficient finiteness, ML, vanishing and perfect-amplitude argument.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-compact-shapiro-projection"></a>

### D7/compact-shapiro-projection — Compact Shapiro and projection formulas

For an open subgroup H of profinite G and a finite-type R-lattice T with continuous H-action, finite-coset induction/coinduction is the existing finite direct-sum representation with product topology. Evaluation gives a quasi-isomorphism C_cts(G,Coind_H^G T)≃C_cts(H,T), agreeing with discrete Shapiro at every reduction. For finite projective coefficient L with continuous G-action, the projection formula identifies Coind(T)⊗_R L with Coind(T⊗_R Res L), compatibly with cochains, cup products and local restriction/corestriction.

**Hypotheses.** H is open, so the coset set is finite.; Tensor coefficient L is finite projective; for general coefficients use the derived tensor and Tor comparison.

**Planned declaration.** `TauCeti.ArithmeticDuality.compactShapiroProjection`.

**Construction or proof.**

1. Use the upstream coinduced carrier, adding its finite product topology.
2. Reduce modulo mⁿ, apply discrete Shapiro and pass to the actual cochain limit with Milnor.
3. Write the finite-coset tensor map and check equivariance, evaluation and cup compatibility.

**Inputs.** `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma`; [R02.1/cochains-inverse-limit](#r021-cochains-inverse-limit); [R02.1/completed-tensor-comparison](#r021-completed-tensor-comparison); [D7/continuous-derived-cochains](#d7-continuous-derived-cochains)

**Acceptance.**

- H=G gives the identity comparison.
- Finite coefficient reductions match upstream Shapiro.
- Do not use finite-coset product topology for an arbitrary closed subgroup.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §§8.1.1–8.1.6, pp. 189–194; §§8.2.1–8.2.3, pp. 200–201. Finite-coset maps, cup/transfer compatibility and the ind-admissible Shapiro proof by finite reductions and surjective limits.
- [RUBIN-ES](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §4, Definition 4.1, Proposition 4.2 and Remark 4.3, pp. 155–156. The discrete induction carrier, double-coset decomposition and Shapiro comparison used before passage to compact limits.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-nakamura-cochain-base-change"></a>

### D7/nakamura-cochain-base-change — Nakamura cochain tensor comparisons

Let G=G_{Q,Σ} with p∈Σ or G=G_{Q_l}; let A be complete Noetherian local over O with finite residue field and ρ a finite free continuous A-representation. For every finitely generated A-module M, the natural degreewise map C_cts(G,ρ)⊗_A M→C_cts(G,ρ⊗_A M) is an isomorphism; the cochain terms are flat. For a pro-free P=∏_I A and a bounded finite-projective N→C_cts(G,ρ), P⊗N⊗M→C_cts(G,P⊗ρ⊗M) is a quasi-isomorphism. For smooth admissible Γ-modules, pass through the filtered union of fixed parts whose A-modules are finitely generated, as in Corollary B.32.

**Hypotheses.** M is finitely generated.; P has the product/pro-free topology; the coefficient tensor topology is the source’s one.; The finite-projective cochain model N and its quasi-isomorphism are actual data.

**Planned declaration.** `TauCeti.ArithmeticDuality.nakamuraCochainBaseChange`.

**Planet.** Continuous cochain base change.

**Construction or proof.**

1. Apply D7 adic continuous-map flatness, proved through Pottharst Lemma 1.3 and Stacks tag 0912, degreewise with K=Gⁿ. Keep finite generation of M and the actual adic topologies.
2. Pass through the degreewise continuous cochain model and its carrier comparison.
3. Use a bounded projective model and pro-free flatness, then compare each finite module specialization.
4. For smooth admissible modules take exact filtered colimits of their finite fixed parts.

**Inputs.** [D7/continuous-derived-cochains](#d7-continuous-derived-cochains); [D7/cochain-finiteness-perfectness](#d7-cochain-finiteness-perfectness); [R02.1/completed-tensor-comparison](#r021-completed-tensor-comparison); [D7/derived-tensor-and-tor](#d7-derived-tensor-and-tor); [D7/matlis-coefficient-duality](#d7-matlis-coefficient-duality); [D7/adic-continuous-map-flatness](#d7-adic-continuous-map-flatness)

**Acceptance.**

- M=A gives the identity.
- M=A/I gives the coefficient reduction comparison.
- No arbitrary infinitely generated underived tensor comparison is asserted.

**Sources.**

- [PAPER-NAKAMURA-23](https://arxiv.org/pdf/2006.13647), Appendix B, Lemmas B.29–B.31 and Corollary B.32, author pp. 104–106; journal pp. 285–288. Finite-module, pro-free and smooth admissible cochain base change.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-local-coefficient-field-duality"></a>

### D7/local-coefficient-field-duality — Local duality over finite and local coefficient fields

For K finite over Q_p and κ a finite field of characteristic p, a finite extension of Q_p, or a characteristic-p local field with finite residue field, let V be finite-dimensional over κ with continuous G_K-action and a stable O_κ-lattice when κ is local. Then Hⁱ_cts(G_K,V) is finite-dimensional, vanishes outside 0,1,2, has perfect κ-linear local Tate pairing with H^{2−i}(G_K,V∨(1)), and χ=−[K:Q_p]dimκV. The finite-field case imports finite local duality; the two local-field cases follow by lattice/cofinite limits and localization. No assertion is made for an arbitrary complete characteristic-p coefficient field.

**Hypotheses.** κ is one of the three stated coefficient fields and V is finite-dimensional continuous.; A stable coefficient lattice and its adic topology are explicit.

**Planned declaration.** `TauCeti.ArithmeticDuality.localCoefficientFieldDuality`.

**Planet.** Local coefficient-field duality.

**Construction or proof.**

1. For finite κ use the existing ClassFieldTheory pairing and Euler characteristic.
2. For a local κ, use lattice reductions over its valuation ring and cofinite duals; prove finiteness by the source’s admissible-coefficient theorem.
3. Invert the uniformizer and identify the dual with κ-linear V∨(1).
4. Transport the invariant and Euler normalization from the finite levels.

**Inputs.** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`; [D7/derived-local-duality](#d7-derived-local-duality); [D7/cochain-finiteness-perfectness](#d7-cochain-finiteness-perfectness); [D7/duality-after-localization](#d7-duality-after-localization)

**Acceptance.**

- For V=κ the Euler dimension is −[K:Q_p].
- The dual is V∨(1), with the twist retained.
- The deformation-ring targets import this result without rebuilding local duality.

**Sources.**

- [BOCKLE-JUSCHKA](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S2050509423000828), §3.4, Theorem 3.4.1 and proof, pp. 20–21. All three coefficient-field regimes, local pairing and Euler formula.
- [PAPER-BOCKLE-IYENGAR-PASKUNAS-23](https://arxiv.org/pdf/2110.01638), §3, local cohomology preliminaries, Lemmas 3.17–3.18. Characteristic-p local residue-field cohomology needed in deformation rings.
- [PAPER-PASKUNAS-QUAST-26](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2D7C5400C4BA7789C0E1CFF008D12E60/S2050508626100304a.pdf/div-class-title-on-local-galois-deformation-rings-generalised-reductive-groups-div.pdf), §3, proof surrounding equation (13), p. 17; local duality applications in §§12–15. The same coefficient-field duality for generalized reductive deformation rings.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-finite-group-uct-sylow"></a>

### D7/finite-group-uct-sylow — Finite-group universal coefficients and Sylow detection

For a finite group G and a trivial abelian coefficient group A, the universal coefficient sequence is 0→H_n(G,Z)⊗A→H_n(G,A)→Tor₁(H_{n−1}(G,Z),A)→0. Finite integral homology yields H^{n+1}(G,Z)≅Ext¹(H_n(G,Z),Z) for n≥0. Over a finite field k the evaluation pairing identifies H_n(G,k) with the k-linear dual of H^n(G,k). For a Sylow ℓ subgroup P, restriction detects ℓ-primary cohomology because cor∘res=[G:P] is invertible there; the corresponding homology statement uses the transfer with its own variance.

**Hypotheses.** G is finite; trivial coefficient action for the displayed UCT and k-dual statements.; The splitting of UCT is not claimed natural.

**Planned declaration.** `TauCeti.ArithmeticDuality.finiteGroupUctSylow`.

**Construction or proof.**

1. Apply the generic tensor/derived coefficient-change theorem to the existing bar resolution.
2. Use finiteness of positive integral homology to remove Hom(−,Z) in the cohomological UCT.
3. Over a field dualize the finite-dimensional chain complex.
4. Use transfer and its index identity for Sylow detection.

**Inputs.** `mathlib:groupCohomology`; [D7/derived-tensor-and-tor](#d7-derived-tensor-and-tor); [D7/matlis-coefficient-duality](#d7-matlis-coefficient-duality); `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`; [R02.2/finite-index-descent](#r022-finite-index-descent)

**Acceptance.**

- For C_m, H₁(C_m,Z)=Z/m and H²(C_m,Z)=Z/m.
- A prime-to-|G| coefficient field gives no positive cohomology.
- The consumer owns its special SL₂ and exceptional-prime computations.

**Sources.**

- [PAPER-CALEGARI-DIMITROV-TANG-25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), §4.5, pp. 661–663. The finite-group UCT, finite-field duality and Sylow detection inputs.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d7-profinite-product-kunneth"></a>

### D7/profinite-product-kunneth — Continuous Künneth for products

For a finite family of profinite groups and finite field k with trivial action, continuous cohomology of the product is the graded tensor product of the continuous cohomology algebras. For an infinite product, continuous finite-valued cochains factor through a finite product of finite quotients, so H^n is the direct sum over finite-support multiindices of total degree n of the corresponding tensor factors. In degree two, if every H¹ factor vanishes, only the degree-two axis summands remain.

**Hypotheses.** Coefficients are a finite field with trivial action; no arbitrary infinite coefficient tensor statement.; Use the continuous, discrete-coefficient cochain carrier and filtered finite quotients.

**Planned declaration.** `TauCeti.ArithmeticDuality.profiniteProductKunneth`.

**Construction or proof.**

1. Apply finite-group Künneth over a field to each finite quotient and compare cup signs.
2. Use the upstream finite-quotient and filtered-colimit comparison for discrete coefficients.
3. For an infinite product, compactness and local constancy force finite-coordinate dependence; take the directed colimit over finite coordinate sets.

**Inputs.** `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-4-the-finite-quotient-colimit-description`; [D7/finite-group-uct-sylow](#d7-finite-group-uct-sylow); [R02.2/hochschild-serre-degeneration](#r022-hochschild-serre-degeneration); [D7/derived-tensor-and-tor](#d7-derived-tensor-and-tor); [D7/matlis-coefficient-duality](#d7-matlis-coefficient-duality)

**Acceptance.**

- Two C₂ factors over F₂ have the mixed degree-two H¹⊗H¹ term.
- If H¹ vanishes, the mixed term disappears.
- An infinite product gives finite-support direct sums, not all infinite tuples.

**Sources.**

- [PAPER-CALEGARI-DIMITROV-TANG-25](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), §4.5, pp. 661–665. Finite/profinite product cohomology and the degree-two reduction.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

## D8: Cohomological fibres for determinant and coefficient change

The trace pairing identifies the dual of trace-zero adjoint with adjoint modulo scalars even when the characteristic divides the rank. First-order matrix lifts give cocycles, strict conjugation gives coboundaries and determinant differentiates to trace. The global and local maps must commute with restriction before taking their fibres. Iterated determinant/localization fibres are compared on actual cochain diagrams. Selmer coefficient change uses derived tensor, its Tor page and the actual local-condition base-change maps. These are the cohomological inputs consumed by local/global deformation-ring roadmaps; their representing rings are not prerequisites here.

<a id="d8-selmer-localization-tangent-comparison"></a>

### D8/selmer-localization-tangent-comparison — Selmer and deformation tangent comparison

Given global and local first-order lift problems with the cocycle comparison of D8, identify their tangent modules with H¹(G_{F,S},adρ) and the specified local H¹ subspaces using the actual restriction maps. The tangent of the global problem with those local conditions is the existing kernel Selmer group. Compare it with H¹ of the imported Selmer complex through the explicit degree-zero correction of R02.5; framing retains local/global H⁰(adρ) terms. For a supplied obstruction morphism into H² of this same fibre, D7 duality identifies its dual target. Later deformation-ring owners construct that morphism and its relation-module injection.

**Hypotheses.** The actual local-condition cochain maps are supplied as data; higher-tier local-ring owners identify the maps for their finite-flat, ordinary and fixed-type conditions.; The determinant and trace-zero variants use the trace sequence below.; Do not assert an equality with H¹ of the Selmer complex without its H⁰ hypothesis.

**Planned declaration.** `TauCeti.ArithmeticDuality.selmerLocalizationTangentComparison`.

**Planet.** Selmer tangent comparison.

**Construction or proof.**

1. Compare a first-order lift ρ(1+εc) with the first-order cocycle comparison of D8.
2. Use the actual commutative restriction square to identify the kernel.
3. Apply the fibre long exact sequence and keep the framing and H⁰ corrections.
4. Compare the supplied obstruction map using derived global/local duality.

**Inputs.** [D8/first-order-cocycle-comparison](#d8-first-order-cocycle-comparison); `SelmerIwasawaCohomology:L2`; [R02.5/selmer-complex-h1-comparison](#r025-selmer-complex-h1-comparison); [D7/derived-global-duality](#d7-derived-global-duality)

**Acceptance.**

- The tangent square uses restriction, not merely equal dimensions.
- The zero or full local condition recovers strict or relaxed Selmer groups.
- The ring representability proof is not duplicated.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §6.1, pp. 135–137. The local-condition fibre and its low-degree exact sequence.
- [PAPER-KHARE-WINTENBERGER-09-II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §4.1–4.2, pp. 39–45. The actual local/global tangent maps and H⁰ framing corrections.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="d8-trace-adjoint-duality"></a>

### D8/trace-adjoint-duality — Trace-zero adjoint duality without division by n

For a rank-n free module V over a field k, n≥1, put ad=End_k(V) and ad⁰=ker tr. The trace pairing on ad is perfect, the trace map ad→k is surjective, and its dual gives 0→k·Id→ad→(ad⁰)∨→0; hence (ad⁰)∨≅ad/(k·Id), equivariantly for conjugation. The restriction of the trace pairing to ad⁰ is perfect exactly when n is nonzero in k. If char(k)|n, scalar matrices lie in ad⁰ and the restricted pairing has that scalar radical. The fixed-determinant tangent complex is obtained from the actual trace map; its low-degree trace boundary must be retained.

**Hypotheses.** n≥1.; No division by n is used for the surjective trace or the dual quotient.; Self-duality of ad⁰ requires n invertible.

**Planned declaration.** `TauCeti.ArithmeticDuality.traceAdjointDuality`.

**Planet.** Trace-zero adjoint duality.

**Construction or proof.**

1. Use matrix units to prove perfection of the full trace pairing and surjectivity of trace.
2. Dualize the kernel/cokernel sequence and identify the orthogonal complement of ad⁰ as scalar matrices.
3. Restrict to ad⁰ and compute whether the scalar line meets it.
4. Transport the exact sequence to Galois cochains and its long exact sequence.

**Inputs.** `mathlib:groupCohomology`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`

**Acceptance.**

- In characteristic two and n=2, Id has trace zero and is in the radical.
- For n prime to char(k), ad⁰ is self-dual.
- The full trace map is surjective even when char(k)|n.

**Sources.**

- [PAPER-KHARE-WINTENBERGER-09-II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §4.1.4–4.1.6 and remark after Lemma 5.3, pp. 41–42, 47–48. The trace sequence and the characteristic-two true dual.
- [PAPER-PASKUNAS-QUAST-26](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2D7C5400C4BA7789C0E1CFF008D12E60/S2050508626100304a.pdf/div-class-title-on-local-galois-deformation-rings-generalised-reductive-groups-div.pdf), §3, local cohomology preliminaries; applications to (ad⁰)* in §§12–15. The true linear dual in local deformation obstructions.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="d8-determinant-fibre-comparison"></a>

### D8/determinant-fibre-comparison — Determinant tangent fibres

For a residual representation ρ, the differential of determinant on infinitesimal matrices is trace: det(1+εX)=1+εtr(X). The actual global and local trace cochain maps commute with restriction. Their mapping fibres give the determinant-relative tangent comparison and the exact sequence involving H⁰(ad)→H⁰(k)→H¹(ad⁰). Local determinant conditions are imported maps, and the fixed-determinant Selmer comparison uses the true dual quotient ad/k·Id with Tate twist, including when p divides n.

**Hypotheses.** Square-zero infinitesimal extension k[ε]/ε².; The complex is a fibre of the actual trace map, not an independently postulated tangent complex.; The local determinant condition is an actual map of complexes and the first-order identification is D8’s cocycle calculation; higher-tier ring owners bind it to their representing functors.

**Planned declaration.** `TauCeti.ArithmeticDuality.determinantFibreComparison`.

**Planet.** Determinant tangent fibres.

**Construction or proof.**

1. Expand determinant over dual numbers and identify its linear term.
2. Check trace intertwines conjugation, then induces the global/local cochain maps.
3. Apply the mapping-fibre and trace short-exact long exact sequences.
4. Compare with the given determinant first-order lift problem and retain the H⁰ boundary.

**Inputs.** [D8/trace-adjoint-duality](#d8-trace-adjoint-duality); [D8/selmer-localization-tangent-comparison](#d8-selmer-localization-tangent-comparison); [D8/first-order-cocycle-comparison](#d8-first-order-cocycle-comparison); [D7/derived-tensor-and-tor](#d7-derived-tensor-and-tor)

**Acceptance.**

- For n=1 the trace is the identity and the fixed-determinant tangent is zero.
- At p|n the full trace still gives a nontrivial boundary.

**Sources.**

- [PAPER-KHARE-WINTENBERGER-09-II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §4.1.4–4.2, pp. 41–43. Determinant conditions, trace boundary and local/global tangent count.
- [PAPER-BOCKLE-IYENGAR-PASKUNAS-23](https://arxiv.org/pdf/2110.01638), §3, Lemmas 3.17–3.18. Trace-zero and true-dual local tangent applications.

**Prototype.** A native signature with this declaration name elaborates. Arithmetic bindings and stronger acceptance obligations remain as recorded in the gap ledger.

<a id="d8-derived-coefficient-change-selmer"></a>

### D8/derived-coefficient-change-selmer — Derived coefficient change for Selmer comparisons

For a coefficient map R→R′ and a diagram of perfect arithmetic cochain complexes with imported local-condition maps, if the D7 global/local derived base-change morphisms and the local-condition base-change morphisms are quasi-isomorphisms, then the actual Selmer mapping fibre commutes with derived tensor: R′⊗^L_R F≃F′. Its cohomology is computed by the Tor spectral sequence E₂^{−a,b}=Tor_a^R(R′,H^b(F))⇒H^{b−a}(F′). A flat R′ or the specified Tor vanishing gives the underived H¹ comparison; otherwise the H⁰/H² correction terms remain. The trace and determinant fibre comparisons commute with this map.

**Hypotheses.** The cochain and local-condition complexes are perfect with stated amplitude.; Base change of each local condition is actual data; no blanket compatibility for arbitrary local deformation conditions.; The convergence uses bounded perfect amplitude.

**Planned declaration.** `TauCeti.ArithmeticDuality.derivedCoefficientChangeSelmer`.

**Planet.** Selmer coefficient change.

**Construction or proof.**

1. Apply derived tensor to the localization/local-condition triangle.
2. Use the given global, local and condition quasi-isomorphisms to compare its three vertices.
3. Deduce a fibre quasi-isomorphism by the triangulated comparison theorem.
4. Import the generic Tor spectral sequence and identify its differentials and relevant low-degree terms.

**Inputs.** [D7/nakamura-cochain-base-change](#d7-nakamura-cochain-base-change); [D7/cochain-finiteness-perfectness](#d7-cochain-finiteness-perfectness); [R02.5/selmer-complex-h1-comparison](#r025-selmer-complex-h1-comparison); [D8/determinant-fibre-comparison](#d8-determinant-fibre-comparison); `SelmerIwasawaCohomology:L2`; [D7/derived-tensor-and-tor](#d7-derived-tensor-and-tor)

**Acceptance.**

- R′=R gives the identity.
- Flat base change removes positive Tor terms.
- A quotient R′ can produce Tor; do not promise ordinary tensor compatibility for every ideal.

**Sources.**

- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §4.2, pp. 97–100; §6.1, pp. 135–137. Perfect arithmetic cochains and the local-condition fibre.
- [PAPER-NAKAMURA-23](https://arxiv.org/pdf/2006.13647), Appendix B, Lemmas B.29–B.31, author pp. 104–106. The precise cochain coefficient comparison feeding the fibre.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Derived arithmetic coefficient and duality signatures” in the gap ledger.

<a id="d8-first-order-cocycle-comparison"></a>

### D8/first-order-cocycle-comparison — First-order Galois cocycle comparison

For a continuous representation ρ:G→GL_n(k) with k discrete and a square-zero extension k[ε]/ε², every lift with fixed reduction is uniquely ρ_ε(g)=(1+εc(g))ρ(g), where c is a continuous one-cocycle in the conjugation module adρ. Conjugation by 1+εX changes c by the corresponding coboundary, giving H¹(G,adρ) for equivalence classes. Restriction to subgroups is actual cochain restriction. The determinant derivative is trace; fixed determinant means tr(c)=0, and the trace exact sequence retains its H⁰ boundary. Framing retains cocycles and its scalar stabilizers. This is the cohomological calculation used by the higher-tier local/global deformation-ring owners, without requiring their representability theorems.

**Hypotheses.** k is a field with the discrete topology, the G-action is jointly continuous, and n≥1.; Equivalence is by conjugations reducing to the identity; a framing means that quotient has not been taken.

**Planned declaration.** `TauCeti.ArithmeticDuality.firstOrderCocycleComparison`.

**Construction or proof.**

1. Multiply two first-order matrices and compare the ε-coefficient to the group law.
2. Compute conjugation by 1+εX and identify its difference as a coboundary.
3. Expand determinant using matrix units and verify trace commutes with conjugation and restriction.

**Inputs.** [R02.1/carrier-comparison](#r021-carrier-comparison); [D8/trace-adjoint-duality](#d8-trace-adjoint-duality); `mathlib:groupCohomology`

**Acceptance.**

- For n=1 the determinant derivative is the identity.
- Conjugation by a scalar first-order matrix gives zero coboundary.
- The characteristic-dividing-rank trace boundary is retained.

**Sources.**

- [PAPER-KHARE-WINTENBERGER-09-II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §4.1, pp. 39–42. The cocycle, trace and framing calculations used in tangent dimensions.
- [DDT-FLT](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.3, tangent-space calculation. First-order deformations and continuous one-cocycles.

**Prototype contract.** This named target is left unstated in the non-exhaustive suggested file under PROTOCOL §13. The exact missing input is recorded under “Auxiliary-prime and first-order application signatures” in the gap ledger.

## Routed-source coverage

This table accounts for every item routed to this job. The entries point to targets, corrected scopes or an existing external owner; they are not source-section summaries. Item IDs retain the extraction numbering. Exact theorem, section and page citations occur on the targets and in the source ledger.

| Routed paper | Items | Targets or ownership decision |
|---|---|---|
| PAPER-BOCKLE-IYENGAR-PASKUNAS-23 | 024, 025 | D7/local-coefficient-field-duality: finite, p-adic and characteristic-p local coefficient fields; finite local duality itself is imported. |
| PAPER-HARPAZ-WITTENBERG-20 | 21, 35, 46, 48 | R02.4/all-place-sha-duality, tate-h2-qmodz, torus-sha-duality; H³(G_m) uses the existing global Brauer/class-formation input, not a new G_m carrier. |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25 | 84, 85 | R02.4/grunwald-wang, including the dyadic order-doubling counterexample. |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25 | 86 | R02.4/character-root-obstruction, character-roots-after-base-change and prescribed-local-totally-real-base-change. |
| PAPER-KHARE-WINTENBERGER-09-II | 1, 10 | Standing residual/adjoint notation imported from ArithmeticGaloisRepresentations; trace and dyadic scalar correction are D8/trace-adjoint-duality and R02.6/kw-relative-tangent-relations. |
| PAPER-KHARE-WINTENBERGER-09-II | 210, 252 | R02.4/grunwald-wang and R02.6/finite-order-determinant-twists. |
| PAPER-PASKUNAS-QUAST-26 | 19 | D7/local-coefficient-field-duality; local ring consumers import this theorem. |
| PAPER-NAKAMURA-23 | 61 | D7/adic-continuous-map-flatness and nakamura-cochain-base-change, with finite-module, pro-free and admissible fixed-part hypotheses. |
| PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22 | 6 | R02.3/function-field-finiteness-euler and D7/local-coefficient-field-duality; finite number-field local pairing remains ClassFieldTheory’s. |
| PAPER-GROECHENIG-WYSS-ZIEGLER-20-B | 143 | R02.4/abelian-variety-local-duality: local Pontryagin pairing and rational-point topology. |
| PAPER-QIAN-23 | 021, 106, 117 | R02.4/all-place-sha-duality and R02.2/cyclotomic-local-global-kernel. Ambient exceptional H¹ restriction is an isomorphism; all-place Sha restriction is not asserted to be an isomorphism. |
| PAPER-HARPAZ-WITTENBERG-23 | 120, 121, 130 | R02.4/all-place-sha-duality and grunwald-wang. |
| PAPER-HARPAZ-WITTENBERG-23 | 139, 140, 141, 142, 143 | R02.1/pointwise-hom, splitting-torsor, connecting-cup-formula and discrete-hom-finitely-generated; the unrestricted discrete-Hom statement is corrected. |
| PAPER-HARPAZ-WITTENBERG-23 | 148, 149, 150 | R02.2/transgression-cup-product and laurent-residue-sequence; public Chan tame/perfect-residue proof replaces the uncleared book citation. |
| PAPER-HARPAZ-WITTENBERG-23 | 154 | Full-absolute H³(G_m) input through ClassFieldTheory’s global Brauer/class formation; no repeated global reciprocity plan. |
| PAPER-CALEGARI-GERAGHTY-18 | cft-no-Zp-extension-unramified-at-p | R02.3/no-zp-extension-away-from-p. |
| PAPER-CALEGARI-GERAGHTY-18 | gl1-selmer-dimension-difference | R02.5/rank-one-selmer-numerics. |
| PAPER-CALEGARI-GERAGHTY-18 | sum-h0-archimedean-ad0 | R02.6/archimedean-adjoint-dimensions. |
| PAPER-WOOD-19 | 250 | R02.4/function-field-central-obstructions; constant dual plus Chebotarev and full all-place duality. |
| PAPER-NEWTON-THORNE-26 | small-degree-quadratic-field, one-new-prime-quadratic-extension | R02.3/exponent-two-field and one-new-prime-kummer. |
| PAPER-NEWTON-THORNE-26 | maire-antiunits, d0-class-field-formula | R02.3/antiunit-class-field-rank; the p-adic closure formula is separate from the unresolved Maire bound. |
| PAPER-MERKURJEV-SCAVIA-26 | 32, 33 | R02.2/hochschild-serre-spectral-sequence and finite-index-descent; existing change-of-groups maps are reused. |
| PAPER-MERKURJEV-SCAVIA-26 | 36, 37 | R02.2/transgression-cup-product and transgression-norm-square, with the chosen sign and coset-sum norm. |
| PAPER-ALLEN-ETAL-23 | 328 | R02.4/character-root-obstruction, character-roots-after-base-change and prescribed-local-totally-real-base-change; soluble square-root specialization read from the cleared manuscript. |
| PAPER-CALEGARI-DIMITROV-TANG-25 | finite-group-homology-inputs, kunneth-profinite | D7/finite-group-uct-sylow and profinite-product-kunneth. Special SL₂ arithmetic computations remain with their consumer. |
| PAPER-KALETHA-16 | P03, P04, P06 | R02.1/tate-inverse-limit, continuous-section-long-exact; R02.2/compact-hochschild-serre and compact-five-term; R02.4/archimedean-local-duality. |
| PAPER-KALETHA-16 | D14, T21, T22 | R02.1/unbalanced-cochain-product, its quotient-factoring carrier, negative-one finite sum, Leibniz sign and naturality. |
| PAPER-KALETHA-16 | P24, P25, P26 | R02.1/continuous-factor-set-extension and continuous-schreier-classification: topology, continuous extension classes and automorphisms. |
| PAPER-GROECHENIG-WYSS-ZIEGLER-20 | 24, 26, 27 | R02.4/abelian-variety-local-duality and isogeny-dual-exact-sequence, including gerbe realization, dual exactness and prime-to-residue-characteristic isogeny index. |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21 | 14 | GSp₄ local Langlands is outside this arithmetic-duality job. Its accepted route to ModularityAndLanglandsExtensions ML.0/ML.4 and GSp4LocalLanglandsAndGaloisRepresentations remains authoritative; no target or prerequisite for it is introduced here. |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21 | 189 | R02.4/character-roots-after-base-change and prescribed-local-totally-real-base-change: totally real quadratic roots of totally even characters. |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21 | 334 | R02.4/tate-h2-qmodz, with Milne’s full-absolute proof and the finite-exponent coefficient-inclusion consequence. |

## Supplier contracts

Each entry is a request for the stated interface, not an implementation claim. A request names the actual current upstream layer when one exists. All neededBy nodes are listed; the targets above give the exact hypotheses and comparisons.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-3-the-comparison-isomorphisms

The comparison of Mathlib's continuousCohomology with explicit inhomogeneous continuous cochains for discrete modules, with the dehomogenisation map, which carrier-comparison extends to compact and rational coefficients. Also: the homogeneous standard-complex cohomology used to build Hochschild–Serre is continuousCohomology for discrete modules.

Consumed by [R02.1/carrier-comparison](#r021-carrier-comparison); [R02.2/hochschild-serre-spectral-sequence](#r022-hochschild-serre-spectral-sequence).

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-4-the-finite-quotient-colimit-description

Continuous cohomology of discrete modules commutes with filtered colimits of coefficients. Also: the finite-quotient colimit description in all degrees, used to compute H^r(G_S, U_S) level by level. Also: H¹(H, A) = colim_W H¹(H/W, A), for the reduction of d₂ = −u ∪ to finite quotients.

Consumed by [R02.1/discrete-quotient-colimit](#r021-discrete-quotient-colimit); [R02.3/s-idele-class-sequence](#r023-s-idele-class-sequence); [R02.2/transgression-cup-product](#r022-transgression-cup-product); [R02.4/tate-h2-qmodz](#r024-tate-h2-qmodz); [D7/profinite-product-kunneth](#d7-profinite-product-kunneth).

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences

The discrete long exact sequence and its connecting maps, for agreement with continuous-section-long-exact on discrete terms. Also: inflation–restriction in degree one and the long exact sequences used for finiteness of H¹, the S-idele classes, the S-unit Kummer sequence and the Euler characteristic. Also: the explicit five-term sequence (transgression, fiveTerm_exact_H1N, fiveTerm_exact_H2Q) that Hochschild–Serre's low-degree sequence is identified with, and inflation–restriction for compact coefficients.

Consumed by [R02.1/continuous-section-long-exact](#r021-continuous-section-long-exact); [R02.3/h1-finite](#r023-h1-finite); [R02.3/s-idele-class-sequence](#r023-s-idele-class-sequence); [R02.3/s-unit-kummer-sequence](#r023-s-unit-kummer-sequence); [R02.4/h1-localisation-proper](#r024-h1-localisation-proper); [R02.4/euler-characteristic-additivity](#r024-euler-characteristic-additivity); [R02.2/five-term-transgression](#r022-five-term-transgression); [R02.2/compact-five-term](#r022-compact-five-term); [R02.4/character-root-obstruction](#r024-character-root-obstruction); [D8/trace-adjoint-duality](#d8-trace-adjoint-duality).

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-8-cup-products-in-low-degrees

Low-degree cup products on the explicit model for an equivariant pairing, extended to the jointly continuous evaluation Hom_pt(C, A) × C → A.

Consumed by [R02.1/connecting-cup-formula](#r021-connecting-cup-formula).

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-6-change-of-groups

Conjugation acts trivially on continuous cohomology, and maps along compatible pairs, so that localisation at a place does not depend on the embedding K^s ↪ K_v^s. Also: cor ∘ res = (G : U) in all degrees.

Consumed by [R02.3/localisation-maps](#r023-localisation-maps); [R02.2/finite-index-descent](#r022-finite-index-descent).

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma

Coinduced discrete modules are acyclic and Shapiro's lemma holds in every degree (with finite-index subgroups and decomposition groups). Also: induced modules X^q(G, A) and their H-invariants are acyclic, so the rows of the Hochschild–Serre double complex are exact.

Consumed by [R02.3/s-idele-class-sequence](#r023-s-idele-class-sequence); [R02.3/s-unit-kummer-sequence](#r023-s-unit-kummer-sequence); [R02.4/discrete-module-ext](#r024-discrete-module-ext); [R02.4/class-formation-ext-duality](#r024-class-formation-ext-duality); [R02.4/ext-units-ideles](#r024-ext-units-ideles); [R02.4/global-euler-characteristic](#r024-global-euler-characteristic); [R02.2/hochschild-serre-spectral-sequence](#r022-hochschild-serre-spectral-sequence); [D7/compact-shapiro-projection](#d7-compact-shapiro-projection).

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory

Profinite Hilbert 90 for a Galois extension that need not be the separable closure (here K_S/K), and the Kummer sequence.

Consumed by [R02.3/s-unit-kummer-sequence](#r023-s-unit-kummer-sequence); [R02.2/transgression-norm-square](#r022-transgression-norm-square); [R02.2/laurent-residue-sequence](#r022-laurent-residue-sequence); [R02.3/exponent-two-ramification-field](#r023-exponent-two-ramification-field).

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees

Continuous cohomology in all degrees as a universal δ-functor on discrete modules, effaceable by coinduced modules, with inflation and inflation–restriction in all degrees. Also: all-degree inflation, restriction and corestriction, for the edge maps and the morphisms of Hochschild–Serre spectral sequences. All-degree Mackey/projection-formula identities needed for all-place Res/Cor adjunction and Sylow detection.

Consumed by [R02.3/localisation-maps](#r023-localisation-maps); [R02.3/p-class-formation](#r023-p-class-formation); [R02.4/discrete-module-ext](#r024-discrete-module-ext); [R02.2/hochschild-serre-spectral-sequence](#r022-hochschild-serre-spectral-sequence); [R02.2/finite-index-descent](#r022-finite-index-descent); [R02.3/absolute-and-relative-sha](#r023-absolute-and-relative-sha); [R02.4/all-place-sha-duality](#r024-all-place-sha-duality); [D7/finite-group-uct-sylow](#d7-finite-group-uct-sylow); [D7/continuous-derived-cochains](#d7-continuous-derived-cochains).

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension

cd_p with its dévissage criterion (cd_p G ≤ n iff H^{n+1}(G, A) = 0 for every simple discrete p-torsion A), and cd(Ẑ) = 1. Also: cd(G/H) ≤ 1 for the two-column degeneration. Strict cohomological dimension two for the full absolute global Galois group away from real dyadic places, with Milne I Remark 1.12’s class-formation criterion; no such assertion for arbitrary G_{F,S}.

Consumed by [R02.3/localisation-maps](#r023-localisation-maps); [R02.4/unramified-exact-annihilators](#r024-unramified-exact-annihilators); [R02.4/cohomological-dimension-bound](#r024-cohomological-dimension-bound); [R02.2/hochschild-serre-degeneration](#r022-hochschild-serre-degeneration); [R02.2/laurent-residue-sequence](#r022-laurent-residue-sequence); [R02.4/character-root-obstruction](#r024-character-root-obstruction); [R02.4/tate-h2-qmodz](#r024-tate-h2-qmodz).

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees

The graded cup product in all degrees, compatible with inflation and connecting maps, and its agreement with the Yoneda product of Ext classes. Also: cup products compatible with inflation, for the multiplicative structure of Hochschild–Serre and d₂ = −u ∪.

Consumed by [R02.4/class-formation-ext-duality](#r024-class-formation-ext-duality); [R02.4/unramified-exact-annihilators](#r024-unramified-exact-annihilators); [R02.4/poitou-tate](#r024-poitou-tate); [R02.4/global-euler-characteristic](#r024-global-euler-characteristic); [R02.2/hochschild-serre-spectral-sequence](#r022-hochschild-serre-spectral-sequence); [R02.2/transgression-cup-product](#r022-transgression-cup-product); [D7/local-duality-maps](#d7-local-duality-maps); [D7/compact-support-cup-products](#d7-compact-support-cup-products); [R02.1/unbalanced-cochain-product](#r021-unbalanced-cochain-product).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-2-class-formations-and-fundamental-classes

Class formations (profinite G, discrete C, invariant maps satisfying the restriction axiom) with their fundamental classes u_{U/V}, as the base of the P-class formations of R02.3.

Consumed by [R02.3/p-class-formation](#r023-p-class-formation).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-3-tates-theorem-for-a-class-formation

The Tate–Nakayama isomorphism: cup product with u_{G/U} gives Ĥ^{r−2}(G/U, N) ≅ Ĥ^r(G/U, N ⊗ C^U) for torsion-free N, in every integer degree (Milne Lemma 1.2).

Consumed by [R02.4/class-formation-ext-duality](#r024-class-formation-ext-duality).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-4-the-abstract-artin-map

The abstract reciprocity map C^G → G^ab of a class formation as cup product with the fundamental classes (Milne Theorem 1.3, Remark 1.5), for the description of α⁰(G, ℤ).

Consumed by [R02.4/class-formation-ext-duality](#r024-class-formation-ext-duality).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality

Local Tate duality for the evaluation pairing (tateDualityPairing_perfect_mixed), finiteness of H⁰, H¹, H² (finite_H), the cardinality form of the local Euler characteristic, and the local invariant, for finite modules over completions of number fields at finite places. Also: local duality and the local Euler characteristic in the Greenberg–Wiles formula.

Consumed by [R02.4/unramified-exact-annihilators](#r024-unramified-exact-annihilators); [R02.4/restricted-product-cohomology](#r024-restricted-product-cohomology); [R02.4/restricted-product-self-duality](#r024-restricted-product-self-duality); [R02.4/ext-units-ideles](#r024-ext-units-ideles); [R02.4/h2-localisation-surjective](#r024-h2-localisation-surjective); [R02.4/global-euler-characteristic](#r024-global-euler-characteristic); [R02.5/greenberg-wiles-formula](#r025-greenberg-wiles-formula); [D7/local-invariant-trivialization](#d7-local-invariant-trivialization); [D7/derived-local-duality](#d7-derived-local-duality); [R02.2/laurent-residue-sequence](#r022-laurent-residue-sequence); [R02.4/character-root-obstruction](#r024-character-root-obstruction); [R02.4/abelian-variety-local-duality](#r024-abelian-variety-local-duality); [R02.4/isogeny-dual-exact-sequence](#r024-isogeny-dual-exact-sequence); [R02.6/odd-taylor-wiles-primes](#r026-odd-taylor-wiles-primes); [D7/local-coefficient-field-duality](#d7-local-coefficient-field-duality).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity

The units of an unramified extension of local fields are cohomologically trivial (Serre, Local Fields), as used to build the local class formation on unramified layers.

Consumed by [R02.3/s-idele-class-sequence](#r023-s-idele-class-sequence); [R02.4/ext-units-ideles](#r024-ext-units-ideles).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

Under the local Artin map the local units map onto the inertia subgroup of the abelianised local Galois group.

Consumed by [R02.3/s-idele-class-reciprocity](#r023-s-idele-class-reciprocity); [R02.3/no-zp-extension-away-from-p](#r023-no-zp-extension-away-from-p); [R02.6/finite-order-determinant-twists](#r026-finite-order-determinant-twists).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants

Galois descent C_L^{Gal(L/K)} = C_K for idele classes; the exact sequence 0 → Br(K) → ⊕_v Br(K_v) → ℚ/ℤ → 0 with the archimedean invariants and Br(ℝ) ≅ ½ℤ/ℤ. Quadratic Hilbert reciprocity and the real/local Brauer invariant normalization used for one-prime Kummer fields and square-root obstructions.

Consumed by [R02.3/s-idele-class-sequence](#r023-s-idele-class-sequence); [R02.4/archimedean-local-duality](#r024-archimedean-local-duality); [R02.4/units-cohomology-high-degree](#r024-units-cohomology-high-degree); [R02.3/one-new-prime-kummer](#r023-one-new-prime-kummer); [R02.4/character-root-obstruction](#r024-character-root-obstruction); [R02.4/torus-sha-duality](#r024-torus-sha-duality).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

The global class formation (G_K, C) whose invariant is the sum of local invariants, and the local–global compatibility of the global Artin map.

Consumed by [R02.3/s-class-formation](#r023-s-class-formation); [R02.3/s-idele-class-reciprocity](#r023-s-idele-class-reciprocity); [R02.3/antiunit-class-field-rank](#r023-antiunit-class-field-rank).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence

The absolute reciprocity map C_K → G_K^ab of a number field is surjective, with kernel the identity component D_K of C_K, which is divisible.

Consumed by [R02.3/s-idele-class-reciprocity](#r023-s-idele-class-reciprocity); [R02.3/exponent-two-ramification-field](#r023-exponent-two-ramification-field); [R02.3/antiunit-class-field-rank](#r023-antiunit-class-field-rank); [R02.3/no-zp-extension-away-from-p](#r023-no-zp-extension-away-from-p); [R02.4/grunwald-wang](#r024-grunwald-wang); [R02.6/finite-order-determinant-twists](#r026-finite-order-determinant-twists).

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

For a number field F and a set S of places containing the archimedean ones: the maximal unramified abelian extension F′ of F in which the places of S split has Gal(F′/F) ≅ Pic(R_{F,S}), and the S-form of the principal ideal theorem (every ideal class of R_{F,S} becomes principal in R_{F′,S}; the transfer to Gal(L/F′)^ab vanishes, Artin–Tate XIII 4). Ray class modulus 8∞, positive generators congruent to 1 modulo 8, and the S-unramified exponent-two class-field dictionary.

Consumed by [R02.3/s-idele-class-sequence](#r023-s-idele-class-sequence); [R02.3/exponent-two-ramification-field](#r023-exponent-two-ramification-field); [R02.3/one-new-prime-kummer](#r023-one-new-prime-kummer); [R02.3/no-zp-extension-away-from-p](#r023-no-zp-extension-away-from-p); [R02.5/rank-one-selmer-numerics](#r025-rank-one-selmer-numerics).

Requested as an extension of Layer 13, whose targets do not yet include the S-split class field or the principal ideal theorem; if the owner declines, ArithmeticGaloisDuality plans both in R02.3.

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles

Ideles and idele class groups of number fields, with their topology and the local unit subgroups.

Consumed by [R02.3/s-idele-class-modules](#r023-s-idele-class-modules); [R02.4/grunwald-wang](#r024-grunwald-wang).

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary

The identity component D_K of the idele class group.

Consumed by [R02.3/s-idele-class-reciprocity](#r023-s-idele-class-reciprocity); [R02.3/one-new-prime-kummer](#r023-one-new-prime-kummer).

### tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles

Inclusion and norm maps of ideles and idele classes along finite extensions, with the Galois action.

Consumed by [R02.3/s-idele-class-modules](#r023-s-idele-class-modules); [R02.3/antiunit-class-field-rank](#r023-antiunit-class-field-rank).

### tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary

Unramified sets of primes (Layer 1.2), with their behaviour in towers, composita and Galois closures.

Consumed by [R02.3/restricted-ramification-group](#r023-restricted-ramification-group).

### tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-4-the-relative-discriminant

The relative discriminant with the tower formula disc(L) = disc(K)^{[L:K]} · N_{K/ℚ}(𝔡_{L/K}).

Consumed by [R02.3/hermite-unramified-outside-finite](#r023-hermite-unramified-outside-finite).

### tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-6-global-ramification-consequences

The tame and wild different-exponent bounds, which bound the discriminant exponent at a prime in terms of the degree and the residue characteristic.

Consumed by [R02.3/hermite-unramified-outside-finite](#r023-hermite-unramified-outside-finite).

### tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-1-supernatural-order-and-index

Supernatural orders and indices of profinite groups.

Consumed by [R02.3/restricted-ramification-group](#r023-restricted-ramification-group); [R02.3/p-class-formation](#r023-p-class-formation).

### tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction

Brauer's induction theorem: every virtual character is an integral combination of characters induced from elementary subgroups.

Consumed by [R02.4/decomposition-map-surjective](#r024-decomposition-map-surjective).

### ArithmeticGaloisRepresentations:R01.2

Restriction to the decomposition group at a place through an embedding into a local separable closure, with invariance under changing the embedding (the placewise maps of R01 that R02.3 identifies with localisation).

Consumed by [R02.3/localisation-maps](#r023-localisation-maps).

### ArithmeticGaloisRepresentations:R01.4

Dickson's classification of finite subgroups of PGL₂(F̄_ℓ) (DDT Theorem 2.47(b)), for the projective image of ρ̄ in the Taylor–Wiles group theory.

Consumed by [R02.6/sigma-criterion](#r026-sigma-criterion); [R02.6/dyadic-cyclotomic-residual](#r026-dyadic-cyclotomic-residual).

### FunctionFieldArithmetic:FA.4

Existing function-field places, local/global class fields, reciprocity and finite prime-to-characteristic local duality; this packet adds their arithmetic cohomology specializations.

Consumed by [R02.3/finite-compact-support](#r023-finite-compact-support); [R02.3/absolute-and-relative-sha](#r023-absolute-and-relative-sha); [R02.3/function-field-finiteness-euler](#r023-function-field-finiteness-euler); [R02.4/all-place-sha-duality](#r024-all-place-sha-duality); [R02.4/function-field-central-obstructions](#r024-function-field-central-obstructions).

### FunctionFieldArithmetic:FA.5

Function-field Chebotarev for everywhere-split finite abelian extensions.

Consumed by [R02.4/function-field-central-obstructions](#r024-function-field-central-obstructions).

### tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

The actual Frobenius density statement for finite Galois extensions and avoidance of finitely many primes.

Consumed by [R02.2/cyclotomic-local-global-kernel](#r022-cyclotomic-local-global-kernel); [R02.6/odd-taylor-wiles-primes](#r026-odd-taylor-wiles-primes); [R02.6/dyadic-cyclotomic-residual](#r026-dyadic-cyclotomic-residual); [R02.6/finite-order-determinant-twists](#r026-finite-order-determinant-twists).

### SelmerIwasawaCohomology:L2

The generic Selmer mapping fibre with actual local-condition maps U→C_local, its local-change triangle, and coefficient-change maps. The existing kernel Selmer definitions are imported; L2 currently does not supply the full complex contract.

Consumed by [R02.5/selmer-complex-h1-comparison](#r025-selmer-complex-h1-comparison); [D8/selmer-localization-tangent-comparison](#d8-selmer-localization-tangent-comparison); [D8/derived-coefficient-change-selmer](#d8-derived-coefficient-change-selmer); [R02.5/function-field-greenberg-wiles](#r025-function-field-greenberg-wiles).

### SelmerIwasawaCohomology:L1

The existing orthogonal-complement carrier and exact finite local annihilator interface.

Consumed by [R02.5/function-field-greenberg-wiles](#r025-function-field-greenberg-wiles).

## Gaps and prototype contracts

The first four records isolate mathematical source or native-interface gaps. The nine prototype-contract records account for all 73 named target signatures omitted under PROTOCOL §13; they do not weaken the written mathematical targets. The final record names arithmetic bindings still required by elaborated generic signatures. Every construction API and all 73 packet tests appear in the suggested file. Generic signatures use actual complexes, representations, homomorphisms, kernels and pairings; an unavailable condition is not replaced by an opaque proposition.

### Maire antiunit lower-bound proof and addendum

Newton–Thorne Lemma 3.4 explicitly invokes Maire, Sur la dimension cohomologique des pro-p-extensions des corps de nombres (JNT 95 (2002)), Proposition 19. The author publication list also records a 2003 addendum. Neither text was accessible from the primary publisher/author links in this run. The class-field closure formula and tower inequality are planned from the read Newton–Thorne source; the exact general hypotheses and proof of rank ≥d remain a source-verification gap.

Needed by [R02.3/antiunit-class-field-rank](#r023-antiunit-class-field-rank).

### Étale Ext and gerbe realization contract

The existing algebraic torus and abelian-variety carriers are reused. A precise owner for the étale sheaf Ext category, Barsotti–Weil comparison, dual abelian variety, gerbe-to-Ext² realization and rational-point topology must be integrated with the generic derived/sheaf packages. The arithmetic duality target is fully stated from the read sources, but the prototype cannot yet express this entire sheaf-level input against the pinned library.

Needed by [R02.4/abelian-variety-local-duality](#r024-abelian-variety-local-duality); [R02.4/torus-sha-duality](#r024-torus-sha-duality).

### Native derived coefficient and injective-hull contracts

The existing derived category, complexes, tensor product, Ext and spectral objects are reused. The pinned tree has no integrated derived tensor/Tor functor, essential injective hull/Matlis anti-equivalence, or derived-composite spectral-sequence interface. Their exact mathematical targets are planned here because they are needed before the higher-tier patching tier. The suggested file leaves those unstated rather than replacing their hypotheses with opaque propositions.

Needed by [D7/derived-tensor-and-tor](#d7-derived-tensor-and-tor); [D7/matlis-coefficient-duality](#d7-matlis-coefficient-duality); [D7/grothendieck-spectral-sequence](#d7-grothendieck-spectral-sequence).

### Prescribed-local field-construction proof closure

The read BCGN and cleared Allen et al. passages state and apply the construction. Their general approximation/avoidance input must be supplied as the precise finite local field-construction theorem, including the separate soluble specialization; an actual interface for local extension data and disjointness is still required. The target moves here under the tier rule; it no longer depends on higher-tier potential modularity.

Needed by [R02.4/prescribed-local-totally-real-base-change](#r024-prescribed-local-totally-real-base-change).

### Prototype contract: Lattice and extension-classification signatures

Need the actual discrete quotient V/T and its finite-coefficient direct system, the section-derived evaluation cup/connecting maps, and the category of continuous extensions with equivalences over both endpoints. The file already gives the lattice rationalization, pointwise-Hom torsor, quotient-section and factor-set topology signatures. Their comparisons require these named carriers and maps; no opaque quotient-of-classes object is substituted.

Needed by [R02.1/discrete-quotient-colimit](#r021-discrete-quotient-colimit); [R02.1/lattice-torsion-sequence](#r021-lattice-torsion-sequence); [R02.1/connecting-cup-formula](#r021-connecting-cup-formula); [R02.1/continuous-schreier-classification](#r021-continuous-schreier-classification).

### Prototype contract: Arithmetic S-idele class-formation and Ext signatures

Need the actual finite-extension norm/embedding diagram for E,J,C,U and its smooth G_S actions, the arithmetic invariant on the class-formation coefficient, and the finite cyclic fundamental-class/Yoneda maps. The generic P-class formation, Abelian.Ext, its Hom/cohomology comparison and open-subgroup Shapiro are typed. ClassFieldTheory Layers 2–4 and 10–13 and GlobalNumberFields Layers 6–8 must bind those generic interfaces to the S-arithmetic objects, including the absolute idele class C used in the decomposition map.

Needed by [R02.3/s-class-formation](#r023-s-class-formation); [R02.3/s-idele-class-reciprocity](#r023-s-idele-class-reciprocity); [R02.4/class-formation-ext-duality](#r024-class-formation-ext-duality); [R02.4/tate-global-duality](#r024-tate-global-duality); [R02.4/ext-units-ideles](#r024-ext-units-ideles); [R02.4/units-cohomology-high-degree](#r024-units-cohomology-high-degree); [R02.4/decomposition-map-surjective](#r024-decomposition-map-surjective); [R02.4/modular-cyclic-induction](#r024-modular-cyclic-induction).

### Prototype contract: Finite arithmetic localization, duality and Euler signatures

Need the arithmetic local Galois groups for all actual places, cyclotomic finite-module dual, local invariant trace and finite/archimedean evaluation pairings, plus the quotient/restricted-product topology on the induced localization maps. The generic ordinary-to-Tate, restricted-product and Sha kernels are typed. The cardinality/Euler examples use ordinary infinity invariants, but their global arithmetic theorem cannot be stated by replacing the absent place-indexed duality data with arbitrary numbers. Bind ClassFieldTheory Layers 5 and 10 and the ProfiniteCohomology cup/cohomology suppliers.

Needed by [R02.4/archimedean-local-duality](#r024-archimedean-local-duality); [R02.4/unramified-exact-annihilators](#r024-unramified-exact-annihilators); [R02.4/h1-localisation-proper](#r024-h1-localisation-proper); [R02.4/restricted-product-self-duality](#r024-restricted-product-self-duality); [R02.4/poitou-tate](#r024-poitou-tate); [R02.4/h2-localisation-surjective](#r024-h2-localisation-surjective); [R02.4/euler-characteristic-additivity](#r024-euler-characteristic-additivity); [R02.4/global-euler-characteristic](#r024-global-euler-characteristic).

### Prototype contract: Relative compact HS and signed transfer signatures

Need relative invariants in the ind-admissible category, the acyclicity proof and its comparison to the actual compact continuous complex; this is D7 derived-composite spectral sequence, not ordinary closed-subgroup invariants. Discrete HS E₂, edges, d₂, five-term exactness, restriction/corestriction and page products are typed. The extension-class cup and transfer/norm pairings require the actual all-degree cup/transfer supplier maps and their sign identification.

Needed by [R02.2/transgression-cup-product](#r022-transgression-cup-product); [R02.2/finite-index-descent](#r022-finite-index-descent); [R02.2/compact-five-term](#r022-compact-five-term); [R02.2/compact-hochschild-serre](#r022-compact-hochschild-serre); [R02.2/transgression-norm-square](#r022-transgression-norm-square).

### Prototype contract: Class-field and function-field application signatures

Need ray-class reciprocity with modulus 8∞, the Frobenius/principal-generator maps, the antiunit p-adic closure with its norm diagrams, and function-field restricted-ramification Galois groups with their local maps. The exponent-two compositum is typed. The arithmetic maps come from ClassFieldTheory, GlobalNumberFields, Chebotarev and FunctionFieldArithmetic FA.4–FA.5; Maire Proposition 19 and the addendum additionally remain an explicit proof-source gap.

Needed by [R02.3/one-new-prime-kummer](#r023-one-new-prime-kummer); [R02.3/antiunit-class-field-rank](#r023-antiunit-class-field-rank); [R02.3/no-zp-extension-away-from-p](#r023-no-zp-extension-away-from-p); [R02.3/function-field-finiteness-euler](#r023-function-field-finiteness-euler).

### Prototype contract: All-place duality, roots and geometric-coefficient signatures

Need the native valuation/residue/tame-inertia maps, absolute all-place cyclotomic localization, global character restriction and Brauer/Kummer boundary, compatible finite quotient systems and the actual field-avoidance interface. Torus and abelian-variety terms additionally require the étale Ext/gerbe/dual-variety interface recorded separately. The full absolute integral-odd and H²(Q/Z) signatures are typed; they do not supply any missing finite-level local map or geometric duality by themselves. FunctionFieldArithmetic supplies the positive-characteristic carriers.

Needed by [R02.2/laurent-residue-sequence](#r022-laurent-residue-sequence); [R02.2/cyclotomic-local-global-kernel](#r022-cyclotomic-local-global-kernel); [R02.4/lattice-rational-poitou-tate](#r024-lattice-rational-poitou-tate); [R02.4/all-place-sha-duality](#r024-all-place-sha-duality); [R02.4/grunwald-wang](#r024-grunwald-wang); [R02.4/character-root-obstruction](#r024-character-root-obstruction); [R02.4/character-roots-after-base-change](#r024-character-roots-after-base-change); [R02.4/torus-sha-duality](#r024-torus-sha-duality); [R02.4/abelian-variety-local-duality](#r024-abelian-variety-local-duality); [R02.4/isogeny-dual-exact-sequence](#r024-isogeny-dual-exact-sequence); [R02.4/function-field-central-obstructions](#r024-function-field-central-obstructions); [R02.4/prescribed-local-totally-real-base-change](#r024-prescribed-local-totally-real-base-change).

### Prototype contract: Selmer arithmetic comparison and dimension signatures

Need L2’s actual diagram RΓ_global⊕U⁺→RΓ_local, its degree-zero local-condition maps, the cochain pairings giving annihilator local conditions and their finite-dimensional arithmetic specializations. The generic fibre H¹-to-kernel theorem and its H⁰-cokernel are typed. L1 supplies the existing kernel Selmer carrier, not a new carrier here. The dimension formula requires these arithmetic data rather than abstract vector-space dimensions.

Needed by [R02.5/greenberg-wiles-formula](#r025-greenberg-wiles-formula); [R02.5/selmer-condition-comparison](#r025-selmer-condition-comparison); [R02.5/selmer-complex-h1-comparison](#r025-selmer-complex-h1-comparison); [R02.5/rank-one-selmer-numerics](#r025-rank-one-selmer-numerics); [R02.5/function-field-greenberg-wiles](#r025-function-field-greenberg-wiles).

### Prototype contract: Auxiliary-prime and first-order application signatures

Need actual adjoint coefficient representations, local Frobenius operators and quotient/restriction maps, finite-image extension cocycles and Chebotarev specialization, and the continuous square-zero first-order lift functor with its strict-conjugacy quotient. The matrix trace/archimedean dimension and generic determinant-fibre maps are typed. ArithmeticGaloisRepresentations R01.2/R01.4 and the lower-tier finite-group suppliers bind the finite-image data. D8 owns the elementary first-order calculation; ring representability and relation-module injections are conditional external consumers, not forward prerequisites.

Needed by [R02.6/taylor-wiles-local-count](#r026-taylor-wiles-local-count); [R02.6/dual-selmer-killing](#r026-dual-selmer-killing); [R02.6/sl2-adjoint-h1-vanishing](#r026-sl2-adjoint-h1-vanishing); [R02.6/sigma-criterion](#r026-sigma-criterion); [R02.6/kw-relative-tangent-relations](#r026-kw-relative-tangent-relations); [R02.6/odd-taylor-wiles-primes](#r026-odd-taylor-wiles-primes); [R02.6/dyadic-cyclotomic-residual](#r026-dyadic-cyclotomic-residual); [R02.6/finite-order-determinant-twists](#r026-finite-order-determinant-twists); [D8/first-order-cocycle-comparison](#d8-first-order-cocycle-comparison).

### Prototype contract: Derived arithmetic coefficient and duality signatures

Need native derived tensor/Tor, K-flat/perfect-amplitude and Matlis/injective-hull functors and acyclicity interfaces, plus local/global cup-and-invariant morphisms on the arithmetic complexes. The generic canonical continuous complex, dualizing Hom, signed compact-support cone and homotopy-independent duality maps are typed. The adic continuous-function and finite completed-tensor comparison signatures are typed. The real dyadic target also requires a complete real Tate local totalization in the unbounded derived category; no bounded ordinary replacement is permitted. L2’s actual local-condition base-change maps are required for the Selmer derived-tensor comparison.

Needed by [D7/local-invariant-trivialization](#d7-local-invariant-trivialization); [D7/derived-local-duality](#d7-derived-local-duality); [D7/local-duality-functoriality](#d7-local-duality-functoriality); [D7/compact-support-euler-characteristic](#d7-compact-support-euler-characteristic); [D7/global-invariant-trivialization](#d7-global-invariant-trivialization); [D7/derived-global-duality](#d7-derived-global-duality); [D7/duality-after-localization](#d7-duality-after-localization); [D7/compact-support-without-p](#d7-compact-support-without-p); [D7/cochain-finiteness-perfectness](#d7-cochain-finiteness-perfectness); [D7/compact-shapiro-projection](#d7-compact-shapiro-projection); [D7/nakamura-cochain-base-change](#d7-nakamura-cochain-base-change); [D7/local-coefficient-field-duality](#d7-local-coefficient-field-duality); [D7/finite-group-uct-sylow](#d7-finite-group-uct-sylow); [D7/profinite-product-kunneth](#d7-profinite-product-kunneth); [D8/derived-coefficient-change-selmer](#d8-derived-coefficient-change-selmer); [D7/derived-tensor-and-tor](#d7-derived-tensor-and-tor); [D7/matlis-coefficient-duality](#d7-matlis-coefficient-duality); [D7/grothendieck-spectral-sequence](#d7-grothendieck-spectral-sequence).

### Arithmetic bindings of elaborated generic constructions

Every construction API and every numbered packet test has a native prototype signature. Several are intentionally generic: locMap takes an actual continuous homomorphism and an archimedean flag rather than manufacturing arithmetic embeddings; limitModules takes the actual E,J,C,U functors; the S-class exact sequence has its arithmetic norm/fixed-part binding still to be supplied; HS page products still need their graded-Leibniz descent; localDualityMap takes actual cochain pairing/chain identities and needs the arithmetic invariant specialization; compact-support finite-type signatures do not assert the full cofinite or amplitude statement; determinant/first-order fibres take actual commuting complex maps and need the representation/local-condition specialization. These are explicit integration contracts, not proofs or opaque Prop fields.

Needed by [R02.3/restricted-ramification-group](#r023-restricted-ramification-group); [R02.3/localisation-maps](#r023-localisation-maps); [R02.3/s-idele-class-modules](#r023-s-idele-class-modules); [R02.3/s-idele-class-sequence](#r023-s-idele-class-sequence); [R02.2/hochschild-serre-spectral-sequence](#r022-hochschild-serre-spectral-sequence); [D7/local-duality-maps](#d7-local-duality-maps); [D7/compact-support-cochains](#d7-compact-support-cochains); [D8/determinant-fibre-comparison](#d8-determinant-fibre-comparison); [D8/selmer-localization-tangent-comparison](#d8-selmer-localization-tangent-comparison).

## Source corrections

The sourceIssues register is retained with E1–E6 corrected in the targets, and adds E7. The entries state the issue and correction in our own words. The sourceVersions records identify exactly what was read and what was not collated.

### ArithmeticGaloisDuality/E1 — error

§5, Lemma 5.5, p. 19 (author final version; corrected in PAPER-HARPAZ-WITTENBERG-23/E10)

**Printed assertion.** Lemma 5.5 assumes Γ is profinite and that the discrete Γ-modules form a short exact sequence 0 → A → B → C → 0 which splits as abelian groups. It assigns the torsor a class [γ] ∈ H1(Γ, Hom(C, A)).

**Correction.** Assume C finitely generated (for example finite, as in the only application), or give Hom(C, A) the pointwise topology Hom_pt(C, A), in which case the class lies in H^1(Γ, Hom_pt(C, A)) and the formula holds by a cochain computation.

**Reason.** Γ = ∏_ℕ C₂, A = ⊕𝔽₂a_i, C = ⊕𝔽₂c_i with trivial actions and B = A ⊕ C with g·c_i = c_i + g_i a_i: B is a discrete module and the sequence splits additively, but γ(g)(c_i) = g_i a_i has kernel {1}, not open, so γ is not continuous into the discrete module Hom(C, A).

**Status.** PAPER-HARPAZ-WITTENBERG-23/E10 (research/errata/REGISTER.md), confirmed by REV-ERRATA-PAPER-HARPAZ-WITTENBERG-23; affects a stated result.

- research/errata/REGISTER.md: recorded as PAPER-HARPAZ-WITTENBERG-23/E10

### ArithmeticGaloisDuality/E2 — misprint

Chapter I, §4, proof of Proposition 4.3, p. 50 (PDF p. 58), second edition, 01.07.06 file

**Printed assertion.** The source assumes S is finite and claims an isomorphism results by taking a direct limit of the isomorphisms C_{F,S} → C_F/U_{F,S}.

**Correction.** Use a cofinite set of primes for the first direct-limit isomorphism. For a general set, kill the S-class-group cokernel by the principal ideal theorem before passing to the limit.

**Reason.** Lemma 4.1 gives C_{F,S} ≅ C_F/U_{F,S} only when S omits finitely many primes. For finite S the cokernel is the class group of R_{F,S}, which is nonzero in general: K = ℚ(√−5), S = {∞} gives ℤ/2. The general case treated next, by the principal ideal theorem, covers finite S, so no result is affected.

**Status.** new; affects nothing.

- the author's page for the book (https://www.jmilne.org/math/Books/adt.html), checked 2026-09-29: its only erratum is for the 07.08.04 version and was corrected in the 01.07.06 file read here
- research/errata/REGISTER.md: no entry for Milne, Arithmetic Duality Theorems

### ArithmeticGaloisDuality/E3 — misprint

Chapter I, §4, statement of the main theorem, p. 55 (PDF p. 63), second edition, 01.07.06 file

**Printed assertion.** The source defines H^r_un(K_v, M) as the image of H^r(g_v, M) inside H^r(G_v, M), assuming v is archimedean and M has no ramification at v.

**Correction.** Define the unramified subgroup only at a finite place, by inflation from its residue-field Galois group when inertia acts trivially.

**Reason.** g_v = Gal(k(v)^s/k(v)) = G_v/I_v is defined only for nonarchimedean v, which have a residue field k(v); the next sentence computes H¹_un ≅ H¹(g_v, M) and H²_un = 0, statements about finite places. The restricted products need unramified subgroups at all but finitely many places, which are finite places.

**Status.** new; affects nothing.

- the author's page for the book (https://www.jmilne.org/math/Books/adt.html), checked 2026-09-29: its only erratum is for the 07.08.04 version and was corrected in the 01.07.06 file read here
- research/errata/REGISTER.md: no entry for Milne, Arithmetic Duality Theorems

### ArithmeticGaloisDuality/E4 — gap

Chapter I, §4, Theorem 4.6(b) and its proof, pp. 52–53 (PDF pp. 60–61), second edition, 01.07.06 file

**Printed assertion.** The proof selects L inside K_S as a finite Galois extension of K that is totally imaginary, with M fixed by Gal(K_S/L).

**Correction.** Choose L sufficiently large, for example containing enough p-power roots of unity for the primes p dividing the order of M; the proof step saying the sequence is exact whenever G_S acts trivially on M and L = K must be replaced by an argument for such L.

**Reason.** The proof uses H³(G_S, ℤ) = 0, which would follow from strict cohomological dimension 2, an assertion equivalent to Leopoldt's conjecture. If Leopoldt's conjecture fails for K and p, D_S(K) has an extra p-divisible part from the Leopoldt kernel that the norm image need not account for. The planned proof of Poitou–Tate (poitou-tate) does not use part (b).

**Status.** the author's footnote 11 to Theorem 4.6, p. 52, which reproduces a correction by W. McCallum and notes that Tate's 1962 announcement says 'sufficiently large'; affects a stated result.

- Milne, Arithmetic Duality Theorems, footnote 11, p. 52 (read)
- the author's page for the book (https://www.jmilne.org/math/Books/adt.html), checked 2026-09-29: its only erratum is for the 07.08.04 version and was corrected in the 01.07.06 file read here

### ArithmeticGaloisDuality/E5 — misprint

§2.3, Theorem 2.19, p. 62 (author PDF revised 9 September 2007)

**Printed assertion.** Theorem 2.19 asserts finiteness of H^1_L(G, M) and H^1_{L*}(G, M^*), then states a formula.

**Correction.** In the finiteness assertion use F as the field parameter for both Selmer groups, as in their definitions and the displayed formula.

**Reason.** The theorem defines H^1_L(F, M) and H^1_{L*}(F, M^*) in the previous sentence and uses them in the displayed formula; no G is introduced (the groups are G_F and G_v).

**Status.** new; affects nothing.

- Darmon's publication page (https://www.math.mcgill.ca/darmon/pub/pub.html), checked 2026-09-29: errata are listed for other papers, none for this one
- research/errata/REGISTER.md: no entry for Darmon–Diamond–Taylor (only citations of it in Calegari–Geraghty entries)
- the 1997 reprint was not accessed

### ArithmeticGaloisDuality/E6 — misprint

§2.8, last line of the proof of Theorem 2.49, p. 84 (author PDF revised 9 September 2007)

**Printed assertion.** The source justifies the choice using ψ(G_F) ⊄ (g − 1)ad^0 ρ̄(1).

**Correction.** Restrict the cocycle to G_{F_n} in the final noncontainment, matching the group from which the chosen element is drawn.

**Reason.** The proof defines only the fields F_m (the extensions of ℚ(ζ_{ℓ^m}) cut out by ad⁰ρ̄) and chooses τ ∈ G_{F_n}; the preceding sentences establish that g fixes a nonzero element of ψ(G_{F_n}), which is what is needed. No field F occurs in the argument.

**Status.** new; affects nothing.

- Darmon's publication page (https://www.math.mcgill.ca/darmon/pub/pub.html), checked 2026-09-29: errata are listed for other papers, none for this one
- research/errata/REGISTER.md: no entry for Darmon–Diamond–Taylor (only citations of it in Calegari–Geraghty entries)
- the 1997 reprint was not accessed

### ArithmeticGaloisDuality/E7 — misprint

I, Remark 5.2(a), p. 67 (PDF p. 75), final displayed formula, 01.07.06 author file; page image inspected

**Printed assertion.** The alternate archimedean Euler quotient has the Tate invariants of M^D in its numerator but ordinary invariants of M in its denominator.

**Correction.** The denominator must use ordinary invariants of M^D. The preceding local-duality identity and the equality of the H¹ cardinalities give that quotient.

**Reason.** For K=Q and a trivial Z/3 module with S={3,infinity}, the main theorem gives chi=1. The printed alternate quotient gives 1/3 because Tate H⁰ at the real place of its cyclotomic dual has cardinality one, while ordinary H⁰ of M has cardinality three. Replacing the denominator by ordinary H⁰ of the dual restores one.

**Status.** new; affects nothing.

- Author second-edition page https://www.jmilne.org/math/Books/adt.html checked 9 October 2026: its listed corrections do not include Remark 5.2(a).
- The atlas source-issue register was searched for Arithmetic Duality Theorems and this formula; no matching correction found. The first edition was not collated.

## Source ledger

Only the passages needed by these targets were read in this run. Historical source-version records are retained as historical records. Public PDFs were read from the author, publisher or institutional repository; the Allen et al. passage was read in the maintainer-cleared manuscript in place. No source text, page excerpt, private file or book copy is included in the repository. Where author and journal pagination differ, node citations specify the version. SHA-256 identifies the public PDF bytes read.

### RUBIN-ES

[Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf). Karl Rubin. Author draft of Annals of Mathematics Studies 147 (2000); printed page = PDF page − 10.

Public artifact SHA-256: `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50`.

**Passages used.** Chapter I §2 (Example 2.1, Lemma 2.2); Appendix B §2 (Definition 2.1, Remark 2.2, Propositions 2.3–2.5, 2.7, Lemma 2.8); Appendix B §2, Proposition 2.5 (read again for R02.2); Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162); Appendix B, §2, Definition 2.1, printed pp. 151–152 (PDF pp. 161–162); Appendix B, §2, Proposition 2.4, printed p. 152 (PDF p. 162); Chapter I, §2, Example 2.1, printed p. 3 (PDF p. 13); Chapter I, §2, Lemma 2.2(ii) and its proof, printed pp. 3–4 (PDF pp. 13–14); Appendix B, §2, Proposition 2.5, printed p. 152 (PDF p. 162); Appendix B, §2, Propositions 2.3–2.5, pp. 151–152; §3, pp. 153–154; Appendix B, §4, Definition 4.1, Proposition 4.2 and Remark 4.3, pp. 155–156

### STACKS

[The Stacks Project](https://stacks.math.columbia.edu/tag/07KW). The Stacks project authors. Online Stacks Project, tags 0594, 0598, 07KW, 07KX, 07KY and 0912; completion-flatness proof rechecked 10 October 2026; graded Hilbert–Serre and ambient multiplicity tags 00K1, 00K4, 00L8 and 0AZU.

**Passages used.** Definition 10.86.1; Lemma 10.86.4; Lemmas 15.88.1, 15.88.9, 15.88.10; More on Algebra, §15.28, Lemmas 15.28.3–15.28.4, tags 0911 and 0912; Artin–Rees and inverse-limit proof; Commutative Algebra, §§10.58–10.59, Proposition 10.58.7, Proposition 10.59.5 and Lemma 10.59.10; §10.62, Lemma 10.62.6; Intersection Theory, §43.15, Definition 43.15.1 and Lemma 43.15.2; full proofs read; Stacks Project, More on Algebra, Lemma 15.88.1 (tag 07KW); Stacks Project, Algebra, Definition 10.86.1 (tag 0594); Stacks Project, Algebra, Lemma 10.86.4 (tag 0598); Stacks Project, More on Algebra, Lemma 15.88.10 (tag 07KY), with Lemma 15.88.9 (tag 07KX); More on Algebra, §15.28, Lemma 15.28.4, tag 0912; proof uses Lemma 15.28.3; Commutative Algebra, Proposition 10.58.7 (tag 00K1), Proposition 10.59.5 and Lemma 10.59.10 (§10.59, tag 00K4), Lemma 10.62.6 (tag 00L8); Intersection Theory, Definition 43.15.1 and Lemma 43.15.2 (§43.15, tag 0AZU)

### HARPAZ-WITTENBERG-23

[The Massey vanishing conjecture for number fields](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf). Yonatan Harpaz; Olivier Wittenberg. Author final version (33 pp., revised 9 December 2021), identical to arXiv 1904.06512v2; Duke Math. J. 172 (2023) not accessed.

Public artifact SHA-256: `d95100ebd7210600873351ffbe1f3f1dc0fd3f36b815ca70286884801afc546f`.

**Passages used.** §5, Lemma 5.5 and its use in the proof of Proposition 5.3, pp. 19–20; §3, Remark 3.1, p. 9; §7, Lemmas 7.6 and 7.7 with their proofs, pp. 28–29; §5, Lemma 5.5, p. 19 (author final version; corrected in PAPER-HARPAZ-WITTENBERG-23/E10); §7, before Lemma 7.6, p. 28 (author final version); §7, proof of Lemma 7.7, p. 29 (author final version); §3, Remark 3.1, p. 9 (author final version)

### MILNE-ADT

[Arithmetic Duality Theorems](https://www.jmilne.org/math/Books/ADTnot.pdf). J. S. Milne. Second edition, author PDF (version 01.07.06, the file sent to the publisher for the 2006 paperback); printed page = PDF page − 8.

Public artifact SHA-256: `2c6195ec76a974f3f336c77cb71cc3845b018aad2d43136716b3477a3bc5fb31`.

**Passages used.** Chapter I §0: Examples 0.8, 0.9, Remarks 0.10, 0.11; Chapter I §1: class formations, Lemmas 1.2, 1.7, 1.9, Theorems 1.3, 1.8, 1.13; Chapter I §2: Corollary 2.3, Theorems 2.6, 2.8, Lemmas 2.9, 2.10, Theorem 2.13; Chapter I §4: Lemma 4.1 to Corollary 4.21, with footnotes 9–11; Chapter I §5: Theorem 5.1, Remark 5.2, Lemmas 5.3, 5.4, with footnote 13; Chapter I, §4, opening paragraph, p. 48 (PDF p. 56); Chapter I, §4, definition of P, p. 48 (PDF p. 56); Chapter I, §4, proof of Lemma 4.9, p. 56 (PDF p. 64); Chapter I, §4, Lemma 4.9, p. 56 (PDF p. 64); Chapter I, §4, statement of the main theorem, p. 55 (PDF p. 63); Chapter I, §4, Lemma 4.1, p. 49 (PDF p. 57); Chapter I, §4, proof of Proposition 4.3, p. 50 (PDF p. 58); Chapter I, §4, proof of Lemma 4.4, p. 51 (PDF p. 59); Chapter I, §1, a generalization, p. 25 (PDF p. 33); Chapter I, §4, Proposition 4.2, p. 50 (PDF p. 58); Chapter I, §4, Lemma 4.5, p. 51 (PDF p. 59); Chapter I, §4, proof of Lemma 4.12, p. 59 (PDF p. 67); Chapter I, §4, proof of Corollary 4.18, p. 63 (PDF p. 71); Chapter I, §0, Example 0.8, p. 7 (PDF p. 15); Chapter I, §1, Theorem 1.13, p. 25 (PDF p. 33); Chapter I, §4, proof of Theorem 4.6, p. 53 (PDF p. 61); Chapter I, §4, before Theorem 4.10, p. 56 (PDF p. 64); Chapter I, §2, proof of Theorem 2.13, p. 35 (PDF p. 43); Chapter I, §2, Theorem 2.6, p. 30 (PDF p. 38); Chapter I, §2, proof of Theorem 2.6, p. 31 (PDF p. 39); Chapter I, §4, Lemmas 4.12 and 4.13, p. 59 (PDF p. 67); Chapter I, §4, Remark 4.14, p. 61 (PDF p. 69); Chapter I, §4, Theorem 4.10, p. 56 (PDF p. 64); Chapter I, §4, end of the proof of Theorem 4.10, p. 62 (PDF p. 70); Chapter I, §4, an explicit description of the pairing, p. 65 (PDF p. 73); Chapter I, §4, Corollary 4.15, p. 62 (PDF p. 70); Chapter I, §4, Theorem 4.10(c), p. 57 (PDF p. 65); Chapter I, §4, Corollary 4.16, p. 62 (PDF p. 70); Chapter I, §4, Corollary 4.18, p. 63 (PDF p. 71); Chapter I, §2, proof of Lemma 2.10, p. 32 (PDF p. 40); Chapter I, §2, Lemma 2.10, p. 32 (PDF p. 40); Chapter I, §5, Lemma 5.3, p. 69 (PDF p. 77); Chapter I, §5, Theorem 5.1, p. 67 (PDF p. 75); Chapter I, §5, footnote 13, p. 67 (PDF p. 75); I, Remark 1.12, p. 24; Corollary 4.17 and proof, p. 63; Chapter I, §4, Theorem 4.20 and Corollaries 4.17, 4.21, pp. 65–70

### NSW-CNF

[Cohomology of Number Fields](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf). Jürgen Neukirch; Alexander Schmidt; Kay Wingberg. Second edition, electronic version 2.3 (May 2020), free for non-commercial use, with the authors' errata file; printed page = PDF page − 14.

Public artifact SHA-256: `abbb7cdefc9ecb3350286c3cba36fe36a90c103257ff8f64173e09a50afdcb91`.

**Passages used.** Chapter I §5 (1.5.2–1.5.7), §6 (1.6.1–1.6.2, 1.6.6–1.6.7); Chapter II §1 (2.1.1–2.1.3), §2 (2.2.1–2.2.4), §4 (2.4.1–2.4.6 and Exercises 1–5); Chapter II §7 (2.7.1–2.7.12), for the compact-coefficient conventions; §2.7, Proposition 2.7.2, pp. 138–139; Chapter II, §1, Proposition 2.1.1, printed p. 99 (PDF p. 113); Chapter II, §2, Lemma 2.2.4, printed p. 105 (PDF p. 119); Chapter II, §4, Theorem 2.4.1, printed p. 111 (PDF p. 125); Chapter II, §4, Exercises 1, 3, 5, printed p. 119 (PDF p. 133); Chapter II, §4, Theorem 2.4.3, printed p. 113 (PDF p. 127); Chapter II, §4, Theorem 2.4.4, printed p. 114 (PDF p. 128); Chapter II, §4, Theorem 2.4.6, printed p. 118 (PDF p. 132); Chapter I, §5, Corollary 1.5.7, printed p. 51 (PDF p. 65); §2.7, Theorem 2.7.7, pp. 142–143; §9.1, Propositions 9.1.5–9.1.6, pp. 526–527; §8.6, Theorems 8.6.7 and 8.6.10, pp. 485–492; §8.6, definition preceding Theorem 8.6.7, pp. 481–485; Chapter VIII, §§3, 6–7, Theorems 8.6.10 and 8.7.9, pp. 490–516; §8.6, Theorem 8.6.7 and the explicit pairing, pp. 485–489; §8.7, Theorem 8.7.9, pp. 515–516

### DDT-FLT

[Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf). Henri Darmon; Fred Diamond; Richard Taylor. Author PDF revised 9 September 2007 (167 pp., Darmon's page); first published in Current Developments in Mathematics 1995, reprinted in Elliptic curves, modular forms & Fermat's last theorem (1997), pp. 2–140 (not accessed); printed page = PDF page.

Public artifact SHA-256: `254f6e29957f95219eff046c29478f5ee584615bee12c8aa8357f499c8cbe8b3`.

**Passages used.** §2.3 (Theorems 2.17–2.19), pp. 59–62; §2.7 end (Theorem 2.41 proof, Lemma 2.42, Corollary 2.43), pp. 78–79; §2.8 (Lemmas 2.44–2.46, 2.48, Corollary 2.45, Theorems 2.47, 2.49 with proof), pp. 80–84, on the page images for pp. 62, 83–84; §2.3, Theorem 2.18, p. 61 (author PDF, revised 9 September 2007); §2.3, Theorem 2.19, p. 62 (author PDF, revised 9 September 2007); §2.3, before Theorem 2.18, p. 61 (author PDF, revised 9 September 2007); §2.8, Lemma 2.46, p. 81 (author PDF, revised 9 September 2007); §2.8, Lemma 2.46(c), p. 81 (author PDF, revised 9 September 2007); §2.8, Lemma 2.48, p. 82 (author PDF, revised 9 September 2007); §2.8, proof of Theorem 2.49, p. 83 (author PDF, revised 9 September 2007); §2.8, end of the proof of Theorem 2.49, p. 84 (author PDF, revised 9 September 2007); §2.3, tangent-space calculation

### NEKOVAR-SC

[Selmer complexes](https://www.numdam.org/item/AST_2006__310__R1_0.pdf). Jan Nekovář. Astérisque 310 (2006), Société Mathématique de France; Numdam scan, printed page = PDF page − 9; the OCR text layer is unreliable for formulas, so statements were read on rendered pages.

Public artifact SHA-256: `61c84e5ad3252a2e520747215ac57a282addc2b58c824a3637bcd77bbe02153f`.

**Passages used.** §5.1.3 and §5.2.1, (5.2.1.1)–(5.2.1.3), pp. 114–115 (Numdam; PDF 123–124); §5.2.2–5.2.3, pp. 115–116 (PDF 124–125); §5.2.4–5.2.6 and 5.2.10, pp. 116–121 (PDF 125–130); §5.2.7–5.2.9, pp. 119–121 (PDF 128–130); §5.3.1–5.3.2, pp. 122–123 (PDF 131–132); §5.3.3, pp. 123–124 (PDF 132–133); §5.3.5–5.3.7, pp. 124–125 (PDF 133–134); §5.4.1, pp. 125–126 (PDF 134–135); §5.4.2–5.4.5, pp. 126–128 (PDF 135–137); §5.6, Proposition 5.6.3, p. 130 (PDF 139); §5.7.1–5.7.6, pp. 130–133, formulas checked on printed p. 133; §§2.1–2.3, pp. 51–53; §§3.1–3.2, pp. 75–78; §4.1, pp. 95–96; §3.6.3–3.6.5, pp. 92–93; §4.1.4, pp. 96–97; §5.3.1, pp. 122–123; §5.7.2–5.7.4, pp. 131–133; §§5.2, 5.4, 5.7, pp. 116–133; §6.1, Definition 6.1.2 and exact sequence 6.1.3, pp. 135–137; §3.2.1–3.2.5, pp. 75–77; §4.1, pp. 95–96; §§3.4–3.6, pp. 81–93; §4.1, pp. 95–97; §4.2.1–4.2.9, pp. 97–100; §§8.1.1–8.1.6, pp. 189–194; §§8.2.1–8.2.3, pp. 200–201; §6.1, pp. 135–137; §4.2, pp. 97–100; §6.1, pp. 135–137; §1.2, pp. 33–40; §2.1, p. 51; §4.2, pp. 97–100; §§2.2–2.3, pp. 51–53; §3.1, pp. 75–76; §3.6.3–3.6.5, pp. 92–93; §4.6.5, pp. 108–109, especially 4.6.5.3–4.6.5.6

### JANNSEN

[Continuous étale cohomology](https://epub.uni-regensburg.de/26684/1/jannsen12.pdf). Uwe Jannsen. Mathematische Annalen 280 (1988), 207–245.

Public artifact SHA-256: `c9d26714c40b14912ea553307062835a05955b0787587429260cfead87bb3d76`.

**Passages used.** §1, Proposition 1.6 and Lemma 1.15, pp. 211–214; §2, Theorem 2.2 and Corollary 2.3, pp. 215–216; §2, Theorem 2.2, pp. 215–216

### BOCKLE-JUSCHKA

[Equidimensionality of universal pseudodeformation rings in characteristic p for absolute Galois groups of p-adic fields](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S2050509423000828). Gebhard Böckle and Ann-Kristin Juschka. Forum of Mathematics, Sigma 11 (2023), e102, 1–83; publisher PDF.

Public artifact SHA-256: `8c30eb663008604e614e3b78ded538ef9677d15c782c92c7a53755e0824a40b7`.

**Passages used.** §3.4, Theorem 3.4.1 and its proof, pp. 20–21; §3.4, Theorem 3.4.1 and proof, pp. 20–21

### MILNE-CFT

[Class Field Theory](https://www.jmilne.org/math/CourseNotes/CFT.pdf). J. S. Milne. Author course notes, version in downloaded PDF.

Public artifact SHA-256: `50d79af78250a9f1117ad9d337e0b231704a533fc707966ed1bfa52e13d498f5`.

**Passages used.** Global reciprocity and norm correspondence; ray class fields and quadratic reciprocity

### CONRAD-GW

[Lifting global representations with local properties](https://virtualmath1.stanford.edu/~conrad/papers/locchar.pdf). Brian Conrad. Author manuscript, 11 December 2011.

Public artifact SHA-256: `782fe71a3c7f26ccd67943d468f73540d384e2de5d474bf8369475b8b631d9bd`.

**Passages used.** Introduction, Remark 1.1, pp. 1–2; Appendix A, Propositions A.1–A.3 and the Wang special case, pp. 31–32; Appendix A, Wang special case and Propositions A.1–A.3, pp. 31–32; Introduction, Remark 1.1, pp. 1–2

### CHAN-ORDERS

[Lectures on Orders](https://web.maths.unsw.edu.au/~danielch/Lect_Orders.pdf). Daniel Chan. Author lecture notes, 16 May 2011.

Public artifact SHA-256: `2280d86df8844091d96311d226ec82fdb9c721929fe2faab0df7810c08b33b19`.

**Passages used.** §8.1–8.3, Theorems 8.1, 8.5, 8.7, Lemma 8.9 and Theorem 8.10, pp. 24–30; §8.1–8.3, Theorems 8.1, 8.7, 8.10 and Lemma 8.9, pp. 24–30

### PAPER-BOCKLE-IYENGAR-PASKUNAS-23

[On local Galois deformation rings](https://arxiv.org/pdf/2110.01638). Gebhard Böckle, Ashwin Iyengar and Vytautas Paškūnas. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `b48dad0a42d8cacea0a4ae80d5f3a5e89c3a13bf2e03beb8527081422b5853c4`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §3, local cohomology preliminaries, Lemmas 3.17–3.18; §3, Lemmas 3.17–3.18

### PAPER-BOXER-CALEGARI-GEE-ETAL-25

[The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880). George Boxer, Frank Calegari, Toby Gee, James Newton and Jack A. Thorne. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `0ad015dfe35d40489a2b8b462ac93d5dd715dbbae7d3fbf18377beaed654579d`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §5.3, Lemma 5.3.1 and Remark 5.3.2, author pp. 55–56; published pp. 49–50; §5.3, proof of Lemma 5.3.3, author p. 56; §5.3, Lemma 5.3.3, author p. 56; published p. 50; §5.3, Lemma 5.3.3 and proof, author pp. 55–56

### PAPER-CALEGARI-GERAGHTY-18

[Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224). Frank Calegari and David Geraghty. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §4, proof of Lemma 4.14, author pp. 52–53; journal pp. 367–368; §8.1, author pp. 77–78; journal §8.2; §8.4, author pp. 80–81

### PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22

[Lifting and automorphy of reducible mod p Galois representations over global fields](https://arxiv.org/pdf/2008.12593). Najmuddin Fakhruddin, Chandrashekhar Khare, Stefan Patrikis. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `6c260021acef4649492892fc266f703aa69401879bf87e1c2492bf2ef24ff1e2`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §2, p. 10

### PAPER-BOXER-CALEGARI-GEE-PILLONI-21

[Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269). George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §8.5, proof of Theorem 8.5.2, author pp. 248–249; §9.2, p. 257; §8.5, proof of Theorem 8.5.2; §9.2, proof of Lemma 9.2.7, author pp. 249, 257

### PAPER-GROECHENIG-WYSS-ZIEGLER-20

[Mirror symmetry for moduli spaces of Higgs bundles via p-adic integration](https://arxiv.org/pdf/1707.06417). Michael Groechenig, Dimitri Wyss and Paul Ziegler. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `f63d8093b87ce2fd380dc86c299e2959040ef9963c58227fb6e171ce4dfd9b31`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §3.2, Lemma 3.8, Theorem 3.10 and Remark 3.11, author pp. 17–18; §3.2, Construction 3.14, Lemma 3.15 and Proposition 3.16, author pp. 18–19

### PAPER-GROECHENIG-WYSS-ZIEGLER-20-B

[Geometric stabilisation via p-adic integration](https://arxiv.org/pdf/1810.06739v2). Michael Groechenig, Dimitri Wyss, Paul Ziegler. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `0139fc5ac0c4109e049b52c8bd298312954f84e63b29a4cb10b34cf66491a5f2`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §6.5, proof of Lemma 6.14, author pp. 42–43

### PAPER-KALETHA-16

[Rigid inner forms of real and p-adic groups](https://arxiv.org/pdf/1304.3292v5). Tasho Kaletha. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `8f88e61e4a86c69ed2e03b760d1517c6f5da167422b5ac8d637af2203bca12a4`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §3.2, pp. 10–12; citation of NSW Theorem 2.7.7; §3.2, pp. 10–12; §4.3, pp. 19–20, product formula and differential identity

### PAPER-HARPAZ-WITTENBERG-20

[Zéro-cycles sur les espaces homogènes et problème de Galois inverse](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf). Yonatan Harpaz; Olivier Wittenberg. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `2e425ee63d77e6fc53ddd76aca8c8b7ab36be95b078fbcec5e2a8d7f325e6ad9`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §2, Propositions 2.6–2.7, author p. 11

### PAPER-HARPAZ-WITTENBERG-23

[The Massey vanishing conjecture for number fields](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf). Yonatan Harpaz and Olivier Wittenberg. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `d95100ebd7210600873351ffbe1f3f1dc0fd3f36b815ca70286884801afc546f`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §3, Remark 3.4, pp. 10–11; §7, Lemmas 7.6–7.7, pp. 28–30

### PAPER-NAKAMURA-23

[Zeta morphisms for rank two universal deformations](https://arxiv.org/pdf/2006.13647). Kentaro Nakamura. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `0d8fa462594a20ef96d755d31a13ba23081f1454bfe9809a5fda54fd30311ba7`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; Appendix B, Lemmas B.29–B.31, author pp. 104–106; journal pp. 285–288; Appendix B, Lemmas B.29–B.31 and Corollary B.32, author pp. 104–106; journal pp. 285–288; Appendix B, Lemmas B.29–B.31, author pp. 104–106; Appendix B, Lemma B.29 and proof, author pp. 104–105; journal pp. 285–286

### PAPER-NEWTON-THORNE-26

[Symmetric power functoriality for Hilbert modular forms](https://api.repository.cam.ac.uk/server/api/core/bitstreams/6bd9d94f-51d3-42e2-9cb1-ffc812189ac5/content). James Newton and Jack A. Thorne. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `635cb99e56a6987814066d78bd9d27a18ebe7dbd4765f32073c7990d8e00d0c5`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §5, Lemma 5.3 and proof, author pp. 39–40; §3, proof of Lemma 3.4, author pp. 16–17

### PAPER-PASKUNAS-QUAST-26

[On local Galois deformation rings: generalised reductive groups](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2D7C5400C4BA7789C0E1CFF008D12E60/S2050508626100304a.pdf/div-class-title-on-local-galois-deformation-rings-generalised-reductive-groups-div.pdf). Vytautas Paškūnas, Julian Quast. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `b18abe909131d28524f7a326834e5656d10063039a92f54e627d7cb899350d93`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §3, proof surrounding equation (13), p. 17; local duality applications in §§12–15; §3, local cohomology preliminaries; applications to (ad⁰)* in §§12–15

### PAPER-MERKURJEV-SCAVIA-26

[Galois representations modulo p that do not lift modulo p²](https://www.math.ucla.edu/~merkurev/papers/Negligible.pdf). Alexander Merkurjev and Federico Scavia. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `e1049ad7b42d25e27211316e860e762762a4508052c3593d5fc7022d364a8eb3`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §2, Lemmas 2.3 and 2.5, pp. 6–7

### PAPER-CALEGARI-DIMITROV-TANG-25

[The unbounded denominators conjecture](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf). Frank Calegari, Vesselin Dimitrov and Yunqing Tang. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §4.5, pp. 661–663; §4.5, pp. 661–665

### PAPER-KHARE-WINTENBERGER-09-II

[Serre's modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf). Chandrashekhar Khare, Jean-Pierre Wintenberger. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §4.1.6, §4.2 and Lemmas 4.3–4.4, pp. 42–43; Proposition 4.6, pp. 44–45; §5.3–5.4, Lemma 5.2(1), Lemmas 5.3–5.4 and Proposition 5.5, pp. 47–48; §5.5, Proposition 5.6, Lemmas 5.8–5.10, pp. 48–53; §7, Lemma 7.10 and proof, p. 69; §4.1–4.2, pp. 39–45; §4.1.4–4.1.6 and remark after Lemma 5.3, pp. 41–42, 47–48; §4.1.4–4.2, pp. 41–43; §4.1, pp. 39–42

### PAPER-WOOD-19

[Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050). Melanie Matchett Wood; Appendix with Philip Matchett Wood. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `154e700c1b634b9e9bde4334a19678d05ff98ca18efb6b07cb5b809f2da9c03d`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; §3, Lemma 3.2 and its proof, published p. 389

### PAPER-QIAN-23

[Potential automorphy for GL_n](https://par.nsf.gov/servlets/purl/10388233). Lie Qian. Source PDF read 9 October 2026; locators distinguish author and journal pagination.

Public artifact SHA-256: `77969caa063c52027dc7274ccef679ce11a2382b8e0b5a8565847922a8d7c0d8`.

**Passages used.** The routed passages identified on the nodes below, with surrounding hypotheses and proofs; Lemmas 2.1–2.2, pp. 1246–1247; downloaded author pp. 122–124; Proofs of Lemmas 2.1–2.2, pp. 1246–1247; Proof of Lemma 2.1, p. 1246; Proof of Lemma 2.1, pp. 1245–1247

### PAPER-ALLEN-ETAL-23

[Potential automorphy over CM fields](https://annals.math.princeton.edu/2023/197-3/p02). Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne. Annals of Mathematics 197 (2023), 897–1113; cleared author manuscript.

**Passages used.** Proof of Theorem 7.1.11, pp. 1103–1104; read in the maintainer-cleared author manuscript; no passages retained; Proof of Theorem 7.1.11, pp. 1103–1104

### POTTHARST-13

[Analytic families of finite-slope Selmer groups](https://msp.org/ant/2013/7-7/ant-v7-n7-p02-p.pdf). Jonathan Pottharst. Algebra & Number Theory 7 (2013), no. 7, 1571–1612; publisher PDF.

Public artifact SHA-256: `41410c5e95be1f5e6db08b3176563b8d3076d3dacdf924ddd9f809b448190f9e`.

**Passages used.** §1, Hypotheses A, Theorem 1.1, Corollary 1.2 and Lemma 1.3, pp. 1575–1577; proofs of the reduction and flatness statements; §1, Theorem 1.1 and Corollary 1.2, pp. 1576–1578; §1, Lemma 1.3(1),(5), pp. 1576–1577

## Acceptance and continuation

The synchronized packet passes check_blueprint with zero errors and zero warnings. The suggested file elaborates at the pinned shared build with proof-placeholder warnings only. The inventory check finds every construction API and every packet test; the omitted named signatures are exactly the nine grouped prototype contracts above. All statements, API entries, tests, planets and inputs in this reader are generated from the same final packet and supplemented by the explicit ownership and routing decisions.

Independent review should first check the finite/ordinary/Tate conventions, the closed-subgroup compact HS caveat, the full Wang obstruction, the odd/dyadic auxiliary-prime distinction, the trace/scalar correction, the real-dyadic unbounded derived statement, the tier moves and the source corrections. Closing a layer requires the exact supplier interfaces and the gap ledger, including Maire Proposition 19/addendum and the prescribed-local field construction. Packaging must retain those limits and bind the generic prototype maps to actual arithmetic data. No node is marked implemented.
