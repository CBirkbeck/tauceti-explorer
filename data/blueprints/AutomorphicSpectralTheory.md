# Automorphic spectral theory and trace distributions

This roadmap constructs the spectral analysis of automorphic L², its comparison with ordinary cohomology, and the distributions in the general trace formula. Its starting point is the library’s measure, Hilbert-space and complex-analysis infrastructure and the atlas’s adelic quotients, cuspidal representations and local induction. Continuation of Eisenstein series, control of truncated inner products, recovery of the residual and continuous spectrum, and justification of regularized traces are the central analytic constructions.

All seven stages have a target-level plan. The detailed inventory below gives the statements, hypotheses, proof work, interfaces and tests; unresolved analytic lemmas, unavailable primary proofs and supplier extensions are collected separately. Coverage is **planned**, not closed. No declaration is claimed implemented. This distinction applies particularly to the Langlands residue system, Franke’s comparison, the real Paley–Wiener proof dependencies and the function-field interchange behind spectral recovery.

This document and its packet give the definitive mathematical assertions. The suggested file proposes names and signatures, sometimes in an explicitly restricted normed, finite-dimensional or one-parameter model where the general atlas carrier is unavailable. Those restrictions do not alter this document’s targets. The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Conventions and construction order

Fix a number field F, a connected reductive F-group G, a minimal parabolic P₀, and compatible Levi decompositions P=MₚNₚ. Import adelic and quotient measures, logarithmic heights Hₚ, modulus characters and reduction domains from **AdelicAlgebraicGroups**. Work consistently on G(𝔸)¹ or the equivalent central quotient by the connected real split centre A_G(ℝ)⁰. Compact-group measure and the unipotent automorphic quotient measure have mass one. Every induction or constant-term formula retains these choices; changing measures changes intertwining coefficients and traces.

The real height space is 𝔞ₚ=Hom(X*(Mₚ)_F,ℝ); its dual carries the induction parameter λ. Use the quotient by 𝔞_G and the corresponding annihilator when the central character is fixed. Normalized induction uses λ+ρₚ, where ρₚ is the half-modulus, on a compact-picture carrier independent of λ. Associated parabolics bring restricted Weyl isomorphisms, stabilizers and multiplicity factors that must survive in the spectral transform.

Inner products conjugate the first variable. An Eisenstein series initially converges in the positive chamber specified by Re(λ) and ρₚ. Construct the convergent unipotent intertwining integral there before using it in the constant-term identity. Meromorphic continuation uses a common local denominator on each finite inducing and compact-type block. The continued global operators are unitary on the imaginary axis. Unnormalized local opposite operators compose to the reciprocal μ-function; choosing local normalizers is a separate construction.

A direct integral needs a saturated measurable-section space and a countable fundamental sequence. Its equivalence relation is almost-everywhere equality. Parseval proves that the wave-packet map is an isometry; a separate density and residue argument establishes surjectivity and recovers the full spectrum.

For the full modular group take Γ=PSL₂(ℤ), hyperbolic measure dμ=dx dy/y², and the nonnegative Laplacian Δ=−y²(∂ₓ²+∂ᵧ²). The cusp-∞ Eisenstein series has residue 3/π at s=1, the constant spectral contribution is (3/π)∫f dμ, and the continuous measure is dt/(4π). Gross–Zagier uses Δ_GZ=−Δ and a Green/resolvent scaling of −4π. Its group sum counts each ±I pair once. At other congruence levels one needs a scattering matrix and a family for each cusp. The claim that the full modular group has no exceptional cusp eigenvalue is retained as a separate source gap.

The function-field branch fixes a curve over 𝔽_q, degree maps and a central degree quotient Ξ. Character parameters are compact tori with finite components and **probability Haar measure on the entire group**. Polynomial dependence on a real truncation parameter becomes quasi-polynomial dependence on the degree lattice. Cycle lengths and block sizes determine the finite spectral cover, and recovery averages over every lift in each fibre. These normalizations require their own proofs.

Weighted ordinary cohomology uses the derived graph norms of the smooth de Rham complex. Franke’s Fin_J functor fixes an infinitesimal-character ideal; for coefficient E the comparison uses J=Ann_{Z(𝔤)}(E∨). Constant-term exponents determine the filtration. Principal-value representatives depend on transverse auxiliary data, while the associated graded comparison is canonical. Relative cohomology retains all components of K∞, including the distinction between O(n) and SO(n).

The trace formula first integrates modified kernels at sufficiently regular T and then evaluates their polynomial dependence at Arthur’s distinguished T₀. Absolute integrated estimates justify coarse geometric and spectral class sums. The fine spectral formula has the bi-K-finite Hecke hypothesis. At fixed infinitesimal-character height its integrals are absolute, and the resulting height totals are absolutely summable; these statements do not imply joint absolute convergence of every rearranged integral-sum. Weighted orbital integrals and weighted characters are constructed here. Unweighted invariant orbital integrals and transfer are imported from **EndoscopicTransferAndUnitaryTraceComparison**.

## Ownership and existing mathematics

Apply the accepted restructuring **RS-04**. **AutomorphicFormsOnReductiveGroups** owns the cuspidal L² carrier, discreteness and cuspidal finite multiplicities. AS.4 owns the spectral transform, completeness, residual spectrum and the additional multiplicity statements. **ArithmeticLocallySymmetricSpaces** owns locally symmetric spaces and the cuspidal cohomology carrier; AS.5 supplies the weighted analytic and ordinary-cohomology comparisons.

**SmoothRepresentationsOfLocalGroups** supplies local induction and admissibility. Its local geometric lemma does not supply rational G(F) double cosets; that global Bruhat adapter is a separately requested extension. **AutomorphicLFunctionsAndLocalFactors** supplies local Euler factors and the planned GL×GL Rankin–Selberg normalization. Jiang–Zhang additionally needs GL×classical Shahidi factors and classical generic packets. Their Part II extensions are explicit requests, rather than an assertion that current supplier stages already contain them.

**QSeriesPartitionsAndMockModularForms** owns the named I, J and K Bessel functions, Kloosterman sums and hyperbolic differential operators. AS owns the Whittaker normalization, spectral resolvent and comparison integrals. **EllipticRegulators** supplies congruence-class weight-zero real-analytic Eisenstein series; AS supplies its primitive level-N adapter. Quadratic cycles and genus characters are imported from their existing owner. Cusp-corrected arithmetic Green functions and holomorphic projection remain with the Gross–Zagier consumers.

The pinned libraries supply scalar L² and its integral inner product, Bochner Fubini and dominated parameter differentiation, finite-character orthogonality, compact-group Peter–Weyl theory, Stone’s unbounded correspondence, normed vector-valued Schwartz spaces and continuous postcomposition, regularized hypergeometric series, beta/gamma identities, hyperbolic distance formulas and the interior Vitali theorem. Fixed compact perturbations are already Fredholm; nonzero compact eigenspaces are finite dimensional. The planned extensions are parameter-meromorphic inverses, general locally convex Schwartz targets, direct-integral multiplicity models and spectral measures. The finite-dimensional eigenbasis theorem is used only under its actual finite-dimensional hypothesis.

## AS.0 — Analytic infrastructure

Construct measurable Hilbert fields, their direct integrals and decomposable operators. Scalar L² is a compatibility test for this varying-fibre construction. Projection-valued measures, Herglotz representation and the unbounded spectral theorem provide multiplication models with multiplicity. The additional normal-operator joint-measure argument remains explicit proof work.

Hilbert–Schmidt and trace-class ideals control trace manipulations. A kernel’s diagonal needs a specified representative, such as the product factorization in the kernel-trace theorem. The locally convex branch supplies quasi-complete integration, nuclear summation and completed projective tensor products. It reuses Mathlib’s normed Schwartz spaces and extends to general seminorm targets.

The real-line test-function space and its final locally convex topology are imported from Mathlib. Strictness, nuclearity, supported-stage embeddings and the bounded-set theorem extend that space. Finite-group Fourier tests use the full complex character basis and probability counting Haar; the smooth circle coefficient estimate supplies the positive-dimensional model.

The BPCZ continuation principle preserves finite vertical-strip order, rather than producing a universal polynomial bound. Its Schwartz and LF-dual consequences are separate theorems. Whittaker and Gross–Zagier functions retain initial convergence domains, reciprocal-gamma normalization and endpoint restrictions. Yu’s cycle-cover coordinates and normalized Fourier averaging are reusable compact-torus inputs to later spectral recovery.

## AS.1 — Initial Eisenstein theory

Construct normalized induced families, Eisenstein sums and convergent intertwiners before using continued values. Unfolding gives constant terms and pseudo-Eisenstein pairings; cuspidality removes proper inducing constant terms. Pseudo-Eisenstein spans decompose the Hilbert space by cuspidal data before the complete spectral transform. Differentiated uniform chamber estimates are named proof obligations for exchanges of sums, integrals and derivatives.

Classical specializations include completed and uncompleted modular series, Poincaré seeds, raising and Fourier coefficients. The Gross–Zagier character-pair series retain their primitive/unrestricted normalization. Their arithmetic inputs use Tau Ceti’s fundamental-discriminant predicate: 12 is fundamental and 16 is not, while Chapter IV §2 specifically assumes odd D. Function-field sections include the transport between the source’s two modulus conventions. Block-induction data start the isobaric construction; its continued Langlands constituent is supplied in AS.2 and imported into AS.5.

## AS.2 — Continuation and normalization

Continue global Eisenstein series and global intertwiners separately from local normalization. Local normalizers satisfy cocycle, unitary-axis, rationality and spherical-vector conditions. The μ-function belongs to the unnormalized theory, and global factorization retains its scalar factors. Ordered residues keep transverse coordinates. Square integrability follows from the constant-term exponent criterion; nonzero residual vectors require an additional check.

The Jiang–Zhang branch supplies Shahidi’s ratio, strict bounds on generic standard-module exponents and the distinct holomorphy regions of tempered GL, raw classical and generic normalized operators. Holomorphic and nonzero does not mean invertible. The GLₙ isobaric sum is a representation with the prescribed cuspidal Langlands data, Satake union and L-function product, together with a uniqueness theorem; it is not represented merely by a list of eigenvalues.

The modular resolvent isolates eigenspace poles and keeps the parity correction in opposite-sign residues. The level-N automorphic Green construction has its own convergence, symmetry and Laplace API. At s=1, subtracting its constant pole leaves a nonharmonic finite part. The primary Hejhal continuation proof remains a source requirement.

## AS.3 — Truncation and wave packets

Define root and dual-weight cones with their boundary conventions and Arthur’s alternating truncation. Projection and rapid decay provide the bounds needed for Eisenstein packet integrals. Separate the exact cuspidal Maass–Selberg identity from the asymptotic discrete-data formula. Singular limits need a uniform regularized-packet estimate and retain residue terms.

The function-field adapters use degree lattices, floor functions and a generic perturbation vector. Their quasi-polynomial uniqueness and proper-Levi vanishing feed Fourier recovery. Genericity and coprimality stay attached to the identities that use them.

## AS.4 — Complete automorphic spectrum

The spectral domain consists of Weyl-compatible measurable parameter fields with the stated multiplicity weights. The wave-packet transform extends to a unitary map onto an invariant subspace, and the orthogonal-sum theorem proves completeness. Residual summands and their multiplicities appear alongside continuous induction. Finite Hecke and central actions agree with the transform.

Compact quotients give discrete trace specializations once the smooth-kernel trace-class bound is proved. The full modular expansion fixes the residual constant and continuous measure; Weyl and coefficient estimates control its convergence. Wallach’s source theorem is stated in its semisimple, ℚ-tempered setting. The reductive, essentially tempered central-character adapter is separate proof work. Yu’s everywhere-unramified discrete classification and stabilizers use Mœglin–Waldspurger with the spherical restriction retained.

## AS.5 — Weighted and ordinary cohomology

Construct the weighted smooth de Rham complex and regularize its currents model. Apply the infinitesimal-character functor, its derived comparison and Franke’s exponent filtration. In the Jordan-block test, the polynomial variable acts through Mathlib’s endomorphism-evaluation module; the generalized-character functor contains the whole block while the first kernel is proper. Principal values and jets identify graded pieces. Weight-cone acyclicity and boundary constant-term resolution lead to the ordinary-cohomology comparison; the endpoint includes Eisenstein classes.

The cuspidal comparison imports ALS’s carrier and relative cochains and identifies their finite Hecke actions. The GL/SL diagram retains the full compact group and parity-dependent multiplicity. The isobaric realization imports AS.2’s sum and Franke–Schwermer’s cuspidal-support theorem. The primary Franke–Schwermer proof must be obtained to establish this integration; a consumer citation does not supply it.

## AS.6 — Regularized and invariant trace formulas

The real invariant Paley–Wiener image, Arthur’s operator image and multiplier theorem are prerequisites. Their local prefix is independent of the orbital-integral and global trace machinery, so it can supply ET.1 without a dependency cycle. Construct global and parabolic kernels, truncate them, and prove the coarse identity and polynomial dependence. (G,M)-families control wall cancellation and descent before weighted orbital integrals and weighted characters enter the fine expansions.

The fine geometric expansion retains its finite set of places and coefficient construction. The fine spectral expansion retains the Hecke hypothesis, determinant quotient and separate convergence assertions. Its corrected determinant space is 𝔞_M^L, verified in the source’s change of variables and earlier corollary; the later displayed 𝔞_M^G misprint is recorded in the source-issue ledger. Almost-compact tests and character support enable invariant recursion over Levi subgroups. The invariant identity, compact specialization, Euler–Poincaré functions and L²-Lefschetz application remain separate statements, including residual cohomological constituents.

Yu’s degree-twisted kernels form a distinct function-field branch through multiplicative (G,M)-families, finite covers, ordered traces and spectral Fourier recovery. The Higgs comparison imports its geometric proof input. Every finite-fibre formula keeps all lifts, the full covering denominator, source stabilizers, probability Haar measure and the order of the intertwining and twist operators.

## Declaration inventory

Each declaration below specifies its mathematical target. The proposed module and name identify the interface; every implementation status is unchecked. A stated suggested-model restriction fixes the scope of that prototype and leaves the full target intact. Acceptance properties and tests distinguish the intended object from plausible incorrect definitions.

<a id="automorphicspectraltheory-as-0"></a>

## AS.0 — Declarations

Coverage: **planned**. Every stated stage target has a node, an imported owner target or a precise gap. Planned means target inventory coverage, not proof closure or implementation. The continuation and Fourier interfaces distinguish restricted test models from the general source adapters.

Atlas landmarks: Measurable Hilbert fields, Direct integrals, Spectral measures, Self-adjoint spectral theorem, Hilbert–Schmidt operators, Trace-class operators.

<a id="automorphicspectraltheory-as-0-measurable-hilbert-field"></a>

### Measurable separable Hilbert fields

**Definition** · `AutomorphicSpectralTheory:AS.0/measurable-hilbert-field` · planet: **Measurable Hilbert fields**.

Proposed interface: `TauCeti.AutomorphicSpectral.measurable_hilbert_field` in `TauCeti/Automorphic/Spectral/AS0`.

On a standard Borel space X, a measurable Hilbert field consists of complete complex Hilbert spaces Hₓ and a complex-linear space M of sections: x↦‖s(x)‖ is measurable for s∈M; a section t lies in M exactly when x↦⟪t(x),s(x)⟫ is measurable for every s∈M; and M contains a countable sequence whose values are dense in every fibre. Equality and changes of fundamental sequence preserve M, not merely the individual fibres.

**Hypotheses and conventions.**

- X is standard Borel; fibres are separable; inner products conjugate the first variable.

**Construction or proof.**

1. Use polarization to obtain measurable pairings from measurable norms.
2. Close a fundamental sequence under rational complex linear combinations; measurable approximation gives the saturation axiom.

**Prerequisites.** [mathlib:MeasureTheory.L2.inner_def](#mathlib-measuretheory-l2-inner-def).

**Uses that determine the interface.**

- **AS.4 associate-parameter-fields**: The induced representations must form measurable fields before integration.
- **AS.0 decomposable-operator**: Fibre operators must carry measurable sections to measurable sections.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.measurable_hilbert_field.ofFundamental` | constructor | A sequence with measurable pairwise Gram entries and pointwise dense span generates exactly one saturated measurable-section space. |
| `TauCeti.AutomorphicSpectral.measurable_hilbert_field.mem_iff_pairing` | characterisation | s∈M iff its pairings with every fundamental section are measurable. |
| `TauCeti.AutomorphicSpectral.measurable_hilbert_field.map_isometry` | functoriality | A fibrewise unitary carrying one fundamental sequence to measurable sections transports M; identity and composition agree. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.measurable_hilbert_field.constant_scalar` (compatibility): For the standard constant ℂ field, with the constant-one section in M, M is exactly the measurable complex functions.
- `TauCeti.AutomorphicSpectral.measurable_hilbert_field.zero_fibre` (degenerate): If every fibre is zero, M contains the unique section.
- `TauCeti.AutomorphicSpectral.measurable_hilbert_field.fundamental_change` (characterisation): Adding measurable limits of finite rational combinations to a fundamental sequence leaves M unchanged.

**Acceptance and prototype scope.**

- Dropping the countable fundamental sequence is rejected by Yetter’s Example 4.

**Sources.**

- [David N. Yetter, Measurable Categories](https://arxiv.org/pdf/math/0309185), §2 Definition 1 and Example 4. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-direct-integral"></a>

### Direct integral Hilbert space

**Construction** · `AutomorphicSpectralTheory:AS.0/direct-integral` · planet: **Direct integrals**.

Proposed interface: `TauCeti.AutomorphicSpectral.direct_integral` in `TauCeti/Automorphic/Spectral/AS0`.

For a measurable Hilbert field and a σ-finite Borel measure μ, form square-integrable measurable sections s with ∫‖s(x)‖²dμ<∞, quotient by equality μ-almost everywhere, and give the quotient inner product ∫⟪s(x),t(x)⟫dμ. This is complete and separable for a standard Borel σ-finite measure. Null fibres and null subsets have no effect. Scalar-valued and finite atomic instances identify with Mathlib L² and weighted Hilbert sums.

**Hypotheses and conventions.**

- The field is measurable in the preceding saturated/countable sense; μ is σ-finite.

**Construction or proof.**

1. Cauchy–Schwarz gives integrability of pairings; use L² norm convergence and an almost-everywhere convergent subsequence to construct fibrewise limits.
2. Approximate with countably many fundamental sections on a countable measure-finite generating algebra.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/measurable-hilbert-field](#automorphicspectraltheory-as-0-measurable-hilbert-field), [mathlib:MeasureTheory.L2.inner_def](#mathlib-measuretheory-l2-inner-def), [mathlib:MeasureTheory.integral_tsum](#mathlib-measuretheory-integral-tsum).

**Uses that determine the interface.**

- **Arthur 2005 Theorem 7.2(b)**: This is the domain of the spectral integration map.
- **AS.4 spectral-orthosum**: Separates continuous measure from discrete atomic summands.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.direct_integral.mk` | constructor | A measurable square-integrable section has a canonical class. |
| `TauCeti.AutomorphicSpectral.direct_integral.mk_eq_mk` | extensionality | Two such classes agree iff the sections agree μ-almost everywhere. |
| `TauCeti.AutomorphicSpectral.direct_integral.inner_mk` | compatibility | The inner product of classes is the integral of fibre inner products. |
| `TauCeti.AutomorphicSpectral.direct_integral.reindex` | functoriality | A measure-preserving Borel isomorphism and measurable fibrewise unitaries induce a unitary reindexing map. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.direct_integral.scalar_L2` (compatibility): The standard constant ℂ field, with the constant-one section in M, identifies unitarily with L²(μ;ℂ).
- `TauCeti.AutomorphicSpectral.direct_integral.two_atoms` (computation): For μ=aδ₀+bδ₁ with a,b>0, ‖(v₀,v₁)‖²=a‖v₀‖²+b‖v₁‖².
- `TauCeti.AutomorphicSpectral.direct_integral.null_singleton` (non-example): Changing a section on a μ-null singleton leaves its class unchanged even when its value changes.

**Acceptance and prototype scope.**

- Equality is almost everywhere, not pointwise.

**Sources.**

- [David N. Yetter, Measurable Categories](https://arxiv.org/pdf/math/0309185), §4 Definition26, p.13; Theorem27, pp.13–14. Definition26 constructs the L²-section quotient and its inner product; Theorem27 verifies its linear functoriality. The completeness/separability proof in this packet is an explicit analytic adaptation, not a claimed numbered theorem of Yetter.

<a id="automorphicspectraltheory-as-0-decomposable-operator"></a>

### Decomposable operators

**Construction** · `AutomorphicSpectralTheory:AS.0/decomposable-operator`.

Proposed interface: `TauCeti.AutomorphicSpectral.decomposable_operator` in `TauCeti/Automorphic/Spectral/AS0`.

An operator field Aₓ:Hₓ→Kₓ is measurable when it carries every measurable section to a measurable section. If ess supₓ‖Aₓ‖<∞, it induces a bounded operator D(A) between the direct integrals by [s]↦[x↦Aₓs(x)]. Its norm equals ess sup‖Aₓ‖; adjoints and compositions are fibrewise, and two fields induce the same operator iff they agree almost everywhere.

**Hypotheses and conventions.**

- σ-finite standard Borel base; measurable separable fields; essentially bounded operator norm.

**Construction or proof.**

1. Estimate ∫‖Aₓsₓ‖² by the essential bound.
2. Use countably many dense fundamental vectors to prove measurability of the norm and the reverse operator-norm inequality.
3. Test against measurable sections to identify the adjoint.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/direct-integral](#automorphicspectraltheory-as-0-direct-integral).

**Uses that determine the interface.**

- **AS.4 Hecke-central-compatibility**: Hecke operators act fibrewise with a uniform operator bound.
- **AS.2 unitary-axis**: Unitary fibre intertwiners give unitary direct-integral maps.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.decomposable_operator.apply_mk` | simp | D(A)[s]=[Aₓsₓ]. |
| `TauCeti.AutomorphicSpectral.decomposable_operator.norm_eq_essSup` | characterisation | ‖D(A)‖=ess supₓ‖Aₓ‖. |
| `TauCeti.AutomorphicSpectral.decomposable_operator.adjoint` | compatibility | D(A)⁎=D(A⁎); D(B∘A)=D(B)∘D(A). |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.decomposable_operator.identity` (computation): For the identity operator field, its decomposable operator is the identity on the direct integral and has norm one on a nonzero scalar fibre model.
- `TauCeti.AutomorphicSpectral.decomposable_operator.null_change` (characterisation): Changing A on a null set induces the same operator.
- `TauCeti.AutomorphicSpectral.decomposable_operator.unbounded_multiplier` (non-example): Multiplication by the real coordinate on L²(ℝ) has no bounded extension agreeing almost everywhere on all compactly supported vectors.

**Acceptance and prototype scope.**

- An unbounded field is not presented as a bounded decomposable operator.
- Suggested model: Scalar identity and coordinate-multiplication tests exercise the constructed direct integral; the nonstandard varying-fibre measurable-field adapter remains required.

**Sources.**

- [David N. Yetter, Measurable Categories](https://arxiv.org/pdf/math/0309185), §2 Definition2; §4 Definition26 and Theorem27. Definition26 gives the operator on L² classes and Theorem27 its bound/functoriality. Equality of the essential-supremum norm uses the countable fundamental sequence, as detailed in the proof work.

<a id="automorphicspectraltheory-as-0-isometric-integration-map"></a>

### Isometric integration maps

**Theorem** · `AutomorphicSpectralTheory:AS.0/isometric-integration-map`.

Proposed interface: `TauCeti.AutomorphicSpectral.isometric_integration_map` in `TauCeti/Automorphic/Spectral/AS0`.

Let D be a dense linear subspace of a direct integral and W₀:D→H a linear map into a complete Hilbert space satisfying ⟪W₀u,W₀v⟫=∫⟪uₓ,vₓ⟫dμ. Then W₀ extends uniquely to a linear isometry W of the entire direct integral. Its range is closed; W is unitary onto H exactly when the range of W₀ is dense. An isometry alone does not prove spectral completeness.

**Hypotheses and conventions.**

- D is dense; the stated Gram identity holds for every u,v∈D.

**Construction or proof.**

1. Polarization reduces the norm identity to the Gram identity.
2. Extend by completeness and prove closed range; use density separately for surjectivity.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/direct-integral](#automorphicspectraltheory-as-0-direct-integral).

**Acceptance and prototype scope.**

- Finite atomic integration agrees with an orthonormal sum; a proper closed inclusion is an isometry but is not onto.

**Sources.**

- [Gerald Teschl, Mathematical Methods in Quantum Mechanics](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf), §0.4 Theorem0.26 (B.L.T. theorem), pp.23–24. The source proves unique norm-preserving bounded extension from a dense domain. Polarization and the closed range of an isometry supply the Hilbert-space corollary; density of the target range is a separate hypothesis.

<a id="automorphicspectraltheory-as-0-projection-valued-measure"></a>

### Projection-valued measures

**Definition** · `AutomorphicSpectralTheory:AS.0/projection-valued-measure` · planet: **Spectral measures**.

Proposed interface: `TauCeti.AutomorphicSpectral.projection_valued_measure` in `TauCeti/Automorphic/Spectral/AS0`.

A projection-valued measure E on ℝ (or ℂ for a bounded normal operator) assigns an orthogonal projection E(B) to each Borel set, with E(∅)=0, E(total)=1 and strong countable additivity on disjoint Borel sets. Strong additivity means convergence after application to each vector; operator-norm additivity is not imposed. The scalar measure μᵥ(B)=⟪v,E(B)v⟫ is positive with total mass ‖v‖².

**Hypotheses and conventions.**

- H is a complete complex Hilbert space.

**Construction or proof.**

1. Construct scalar measures from strong sums and polarization; derive E(B)E(C)=E(B∩C).

**Prerequisites.** .

**Uses that determine the interface.**

- **Teschl Theorem 3.7**: Encodes an unbounded self-adjoint operator.
- **AS.0 bounded-normal-spectral**: Encodes the joint real and imaginary spectral variables.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.projection_valued_measure.scalarMeasure` | projection | E gives positive finite scalar measures μᵥ and polarized complex measures μᵤ,ᵥ. |
| `TauCeti.AutomorphicSpectral.projection_valued_measure.inter` | relation | E(B)E(C)=E(B∩C) for Borel B,C. |
| `TauCeti.AutomorphicSpectral.projection_valued_measure.borelIntegral` | constructor | Bounded Borel functions integrate to bounded operators, with indicators mapping to E(B). |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.projection_valued_measure.finite_diagonal` (computation): For diag(a,b), E(B)=diag(1_B(a),1_B(b)).
- `TauCeti.AutomorphicSpectral.projection_valued_measure.empty` (degenerate): E(∅)=0 and E(total)=1, including the zero Hilbert space.
- `TauCeti.AutomorphicSpectral.projection_valued_measure.multiplication` (compatibility): On L²(ℝ), E(B) is multiplication by 1_B.

**Acceptance and prototype scope.**

- The multiplication projections on L² are strongly additive although their tails need not have small operator norm.

**Sources.**

- [Gerald Teschl, Mathematical Methods in Quantum Mechanics](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf), §3.1 equations (3.5)–(3.15); PDF page 100. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-herglotz-representation"></a>

### Herglotz representation

**Theorem** · `AutomorphicSpectralTheory:AS.0/herglotz-representation`.

Proposed interface: `TauCeti.AutomorphicSpectral.herglotz_representation` in `TauCeti/Automorphic/Spectral/AS0`.

If F is holomorphic on the upper half-plane and Im F≥0, then uniquely F(z)=a+bz+∫ℝ[(t−z)⁻¹−t/(1+t²)]dν(t), where a∈ℝ, b≥0 and ν is positive with ∫(1+t²)⁻¹dν<∞. The resolvent special case has b=0 and finite mass fixed by its asymptotic at i∞. Polarization of scalar resolvent pairings reconstructs the spectral measure.

**Hypotheses and conventions.**

- The sign is the resolvent convention (A−z)⁻¹; a resolvent written (z−A)⁻¹ has the opposite sign.

**Construction or proof.**

1. Apply the Poisson representation on the disk via the Cayley transform.
2. Separate the atom at the boundary point corresponding to infinity, obtaining b and the subtraction term.

**Prerequisites.** .

**Acceptance and prototype scope.**

- F(z)=z has b=1 and ν=0; F(z)=(a−z)⁻¹ has ν=δₐ.

**Sources.**

- [Gerald Teschl, Mathematical Methods in Quantum Mechanics](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf), §3.4 Theorem 3.20. Theorem 3.20 proves only the finite-measure Borel-transform case under |F(z)|≤M/Im(z). It supplies the resolvent specialization, not the general a+bz representation.
- [Jacob Shapiro, Functional Analysis: Princeton University MAT520 Lecture Notes](https://web.math.princeton.edu/~js129/PDFs/teaching/MAT520_fall_2025/MAT520_Lecture_Notes.pdf), §10.1 Theorem 10.5, equation (10.1), and proof, printed pp.125–126. This is the general subtracted representation with a real constant, nonnegative linear coefficient and weighted-integrable positive measure. The Im F=0 boundary case follows by the open mapping theorem (F is a real constant). The proof invokes the positive harmonic Poisson representation.

<a id="automorphicspectraltheory-as-0-unbounded-selfadjoint-spectral"></a>

### Unbounded self-adjoint spectral theorem

**Theorem** · `AutomorphicSpectralTheory:AS.0/unbounded-selfadjoint-spectral` · planet: **Self-adjoint spectral theorem**.

Proposed interface: `TauCeti.AutomorphicSpectral.unbounded_selfadjoint_spectral` in `TauCeti/Automorphic/Spectral/AS0`.

For a densely defined self-adjoint partial linear map A on H there is a unique projection-valued measure E on ℝ with A=∫t dE(t), domain {v:∫t²dμᵥ(t)<∞}. The bounded Borel calculus satisfies f(A)⁎=conj(f)(A), multiplication, and dominated strong convergence. For general Borel f, the domain is {v:∫|f|²dμᵥ<∞}; real f gives self-adjoint f(A). If H is separable, a unitary multiplication model is a countable sum of cyclic L² measures, hence a measurable-multiplicity direct integral. This extends, and agrees with, the existing Stone correspondence.

**Hypotheses and conventions.**

- A is self-adjoint, not merely symmetric or essentially self-adjoint on an unspecified domain.

**Construction or proof.**

1. Use the resolvent Herglotz representation to build scalar spectral measures and polarize.
2. Prove multiplicativity by the resolvent identity and uniqueness.
3. Use cyclic subspaces and separability for the multiplication model; identify exp(itA) by uniqueness in Stone’s theorem.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/projection-valued-measure](#automorphicspectraltheory-as-0-projection-valued-measure), [AutomorphicSpectralTheory:AS.0/herglotz-representation](#automorphicspectraltheory-as-0-herglotz-representation), [AutomorphicSpectralTheory:AS.0/direct-integral](#automorphicspectraltheory-as-0-direct-integral), [tauceti:IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul](#tauceti-isselfadjoint-existsunique-isunitary-complexgenerator-eq-i-smul).

**Acceptance and prototype scope.**

- For multiplication by x on L²(ℝ), the domain is exactly {f:xf∈L²}; a symmetric operator with unequal deficiency indices fails the hypothesis.

**Sources.**

- [Gerald Teschl, Mathematical Methods in Quantum Mechanics](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf), §3.1 Theorems 3.1–3.7; §3.3 Theorem 3.17. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-bounded-normal-spectral"></a>

### Bounded normal spectral theorem

**Theorem** · `AutomorphicSpectralTheory:AS.0/bounded-normal-spectral`.

Proposed interface: `TauCeti.AutomorphicSpectral.bounded_normal_spectral` in `TauCeti/Automorphic/Spectral/AS0`.

For a bounded normal operator N on a separable complex Hilbert space there is a unique projection-valued Borel measure on its compact spectrum in ℂ with N=∫z dE(z). Its bounded Borel calculus extends the continuous functional calculus and gives a multiplication direct-integral model, including multiplicities. This is a spectral-measure extension; the existing finite-dimensional self-adjoint eigenbasis is the finite atomic special case.

**Hypotheses and conventions.**

- N⁎N=NN⁎; H is separable and complete.

**Construction or proof.**

1. Apply the self-adjoint spectral theorem to commuting Re N and Im N; prove their projections commute and construct the joint measure.
2. Identify polynomials and use the continuous calculus uniqueness to establish compatibility.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/unbounded-selfadjoint-spectral](#automorphicspectraltheory-as-0-unbounded-selfadjoint-spectral), [AutomorphicSpectralTheory:AS.0/projection-valued-measure](#automorphicspectraltheory-as-0-projection-valued-measure), [AutomorphicSpectralTheory:AS.0/direct-integral](#automorphicspectraltheory-as-0-direct-integral), [mathlib:LinearMap.IsSymmetric.eigenvectorBasis](#mathlib-linearmap-issymmetric-eigenvectorbasis).

**Acceptance and prototype scope.**

- The unilateral shift is excluded because it is not normal; diag(1,i) gives two atoms.

**Sources.**

- [Gerald Teschl, Mathematical Methods in Quantum Mechanics](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf), §3.1 bounded functional calculus and §3.3 multiplication models. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-hilbert-schmidt"></a>

### Hilbert–Schmidt operators

**Definition** · `AutomorphicSpectralTheory:AS.0/hilbert-schmidt` · planet: **Hilbert–Schmidt operators**.

Proposed interface: `TauCeti.AutomorphicSpectral.hilbert_schmidt` in `TauCeti/Automorphic/Spectral/AS0`.

For a bounded operator A:H→K between separable Hilbert spaces define the squared Hilbert–Schmidt norm by Σ_j‖Ae_j‖² for any orthonormal basis of H. Finiteness is basis independent. These operators form a complete normed vector space and a two-sided operator ideal; finite-rank operators are dense in this norm. On scalar L² spaces, a square-integrable kernel gives a Hilbert–Schmidt operator with exactly its kernel L² norm.

**Hypotheses and conventions.**

- Complete separable complex Hilbert spaces; countable orthonormal bases.

**Construction or proof.**

1. Use Parseval twice to establish basis independence and the kernel identification.
2. Approximate by finite matrix corners and apply Cauchy–Schwarz for ideal bounds.

**Prerequisites.** [mathlib:MeasureTheory.integral_prod](#mathlib-measuretheory-integral-prod), [mathlib:MeasureTheory.L2.inner_def](#mathlib-measuretheory-l2-inner-def), [tauceti:IsCompactOperator.finiteDimensional_eigenspace](#tauceti-iscompactoperator-finitedimensional-eigenspace).

**Uses that determine the interface.**

- **AS.0 trace-class**: Products of two HS operators supply trace-class factorizations.
- **AS.4 compact-quotient**: Smooth convolution on a compact quotient gives compact spectral pieces.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.hilbert_schmidt.norm_basis` | characterisation | ‖A‖HS²=Σ_j‖Ae_j‖² for every orthonormal basis. |
| `TauCeti.AutomorphicSpectral.hilbert_schmidt.ideal_bound` | relation | ‖BAC‖HS≤‖B‖‖A‖HS‖C‖. |
| `TauCeti.AutomorphicSpectral.hilbert_schmidt.kernel_norm` | compatibility | For K∈L²(X×Y), the integral operator has HS norm ‖K‖₂. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.hilbert_schmidt.rank_one` (computation): For v↦⟪u,v⟫w, ‖A‖HS=‖u‖‖w‖.
- `TauCeti.AutomorphicSpectral.hilbert_schmidt.infinite_identity` (non-example): On a Hilbert space with an ℕ-indexed Hilbert basis the identity has no Hilbert–Schmidt representative.
- `TauCeti.AutomorphicSpectral.hilbert_schmidt.finite_identity` (computation): On an n-dimensional Hilbert space the actual identity is Hilbert–Schmidt and has Hilbert–Schmidt norm √n.

**Acceptance and prototype scope.**

- Square-integrable kernels yield compact operators; diagonal values of an arbitrary L² kernel are not intrinsic.

**Sources.**

- [Gerald Teschl, Mathematical Methods in Quantum Mechanics](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf), §6.3 equations (6.8)–(6.13), Lemma 6.10; PDF page 152. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-trace-class"></a>

### Trace-class operators and trace norm

**Definition** · `AutomorphicSpectralTheory:AS.0/trace-class` · planet: **Trace-class operators**.

Proposed interface: `TauCeti.AutomorphicSpectral.trace_class` in `TauCeti/Automorphic/Spectral/AS0`.

A bounded operator A on a separable Hilbert space is trace class iff its singular values are summable, equivalently A=BC for two Hilbert–Schmidt operators. Define ‖A‖₁=Σs_j(A) and tr A=Σ⟪e_j,Ae_j⟫. The diagonal series is absolutely convergent and basis independent, |tr A|≤‖A‖₁, and tr(AD)=tr(DA) for bounded D. Trace norm convergence permits passage through trace, unlike strong convergence alone.

**Hypotheses and conventions.**

- Trace is operator trace, with the first inner-product slot conjugated.

**Construction or proof.**

1. Apply the pinned compact symmetric eigenbasis theorem to A* A. For each positive eigenvalue s_j² set the left singular vector to s_j⁻¹ A e_j; this constructs the singular-value expansion directly, with the kernel treated separately. No full compact spectral theorem is inferred from finite-dimensionality of individual eigenspaces.
2. Factor the singular-value expansion by square roots; apply double Cauchy–Schwarz to show absolute convergence and cyclicity.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/hilbert-schmidt](#automorphicspectraltheory-as-0-hilbert-schmidt), [tauceti:IsCompactOperator.finiteDimensional_eigenspace](#tauceti-iscompactoperator-finitedimensional-eigenspace), [tauceti:ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector](#tauceti-continuouslinearmap-exists-hilbertbasis-forall-haseigenvector).

**Uses that determine the interface.**

- **Arthur 2005 Theorem 15.1**: Absolute trace-norm estimates justify spectral trace sums.
- **AS.6 compact-trace**: The convolution trace equals the spectral multiplicity sum.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.trace_class.trace_basis` | characterisation | tr A=Σ_j⟪e_j,Ae_j⟫ with absolute convergence for any basis. |
| `TauCeti.AutomorphicSpectral.trace_class.mul_hs` | constructor | BC is trace class and ‖BC‖₁≤‖B‖HS‖C‖HS. |
| `TauCeti.AutomorphicSpectral.trace_class.trace_cyclic` | relation | For trace-class A and bounded D, tr(AD)=tr(DA). |
| `TauCeti.AutomorphicSpectral.trace_class.trace_continuous` | compatibility | \|tr(A−B)\|≤‖A−B‖₁. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.trace_class.rank_one_trace` (computation): tr(v↦⟪u,v⟫w)=⟪u,w⟫.
- `TauCeti.AutomorphicSpectral.trace_class.diagonal_harmonic` (non-example): The bounded diagonal operator with basis coefficients 1/(n+1) is Hilbert–Schmidt and has no trace-class representative.
- `TauCeti.AutomorphicSpectral.trace_class.projection_trace` (computation): An orthogonal projection of rank r has trace and trace norm r.

**Acceptance and prototype scope.**

- The trace bound controls the spectral side; strong convergence of rank-one projections to zero does not imply convergence of traces.

**Sources.**

- [Gerald Teschl, Mathematical Methods in Quantum Mechanics](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf), §6.2 Theorems 6.6–6.7; §6.3 Lemma 6.13, Corollary 6.14 and Lemmas 6.15–6.16, printed pp.136–144. The singular-value expansion is Theorem 6.7, proved using the compact self-adjoint spectral theorem. Lemma 6.13 gives Hilbert–Schmidt factorization; Lemmas 6.15–6.16 give basis independence and bounded-operator cyclicity.

<a id="automorphicspectraltheory-as-0-kernel-trace-diagonal"></a>

### Diagonal trace under a factorization hypothesis

**Theorem** · `AutomorphicSpectralTheory:AS.0/kernel-trace-diagonal`.

Proposed interface: `TauCeti.AutomorphicSpectral.kernel_trace_diagonal` in `TauCeti/Automorphic/Spectral/AS0`.

Let X be σ-finite and K₁,K₂∈L²(X×X). The trace-class product T₁T₂ has trace ∫_{X×X}K₁(x,y)K₂(y,x)dμ(x)dμ(y). If specified representatives give K(x,z)=∫K₁(x,y)K₂(y,z)dμ(y) at every diagonal point almost everywhere, with that diagonal measurable, then tr(T₁T₂)=∫K(x,x)dμ(x). A bare equivalence class K∈L²(X×X) does not define K(x,x); continuity or the displayed factorization must fix the representative.

**Hypotheses and conventions.**

- Fubini is applied to the absolutely integrable product, bounded by ‖K₁‖₂‖K₂‖₂.

**Construction or proof.**

1. Expand in an orthonormal basis using the HS norm identities.
2. Use the stated integrable majorant and the baseline Fubini theorem before identifying the actual diagonal.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/hilbert-schmidt](#automorphicspectraltheory-as-0-hilbert-schmidt), [AutomorphicSpectralTheory:AS.0/trace-class](#automorphicspectraltheory-as-0-trace-class), [mathlib:MeasureTheory.integral_prod](#mathlib-measuretheory-integral-prod).

**Acceptance and prototype scope.**

- Changing an L² kernel on the diagonal of a nonatomic product space cannot change operator trace.

**Sources.**

- [Gerald Teschl, Mathematical Methods in Quantum Mechanics](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf), §6.3 kernel expansion (6.10)–(6.12) and Lemma 6.15. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-nuclear-lf-space"></a>

### Nuclear Fréchet and LF test spaces

**Definition** · `AutomorphicSpectralTheory:AS.0/nuclear-lf-space`.

Proposed interface: `TauCeti.AutomorphicSpectral.nuclear_lf_space` in `TauCeti/Automorphic/Spectral/AS0`.

A Hausdorff locally convex complex space E is Fréchet if its topology comes from a countable seminorm family and is complete. A nuclear map factors through Banach spaces by a series Σλ_j ℓ_j⊗v_j with Σ|λ_j|<∞ and bounded vectors and functionals; E is nuclear if its continuous seminorm quotient maps admit such factorizations after strengthening the seminorm. A strict LF space is a countable inductive limit of Fréchet spaces with closed topological embeddings. Smooth functions at fixed finite adelic level and fixed compact archimedean support form nuclear Fréchet spaces; their support/level inductive limit is the nuclear LF test space 𝓓(G(𝔸)). Quasi-completeness means every closed bounded subset is complete.

**Hypotheses and conventions.**

- A countable exhaustion and a second-countable finite-dimensional real Lie group are fixed; nonarchimedean test functions are locally constant.

**Construction or proof.**

1. Construct derivative seminorms on each compact support.
2. Use compact-chart nuclearity and finite direct sums, then the strict LF limit.
3. Distinguish quasi-completeness from completeness, and import Banach–Steinhaus rather than reprove it.

**Prerequisites.** `AutomorphicFormsOnReductiveGroups:AF.0/smooth-adelic-function`, [mathlib:WithSeminorms.banach_steinhaus](#mathlib-withseminorms-banach-steinhaus), [mathlib:TestFunction](#mathlib-testfunction), [mathlib:TestFunction.topologicalSpace](#mathlib-testfunction-topologicalspace).

**Uses that determine the interface.**

- **AS.6 automorphic-kernel**: Gives the exact global test-function topology.
- **BPCZ Appendix A**: Vector holomorphy, integrals and summable tensor expansions use quasi-completeness and nuclearity.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.nuclear_lf_space.supportLevelPiece` | constructor | Compact support and finite level define a nuclear Fréchet subspace with seminorms sup‖D f‖. |
| `TauCeti.AutomorphicSpectral.nuclear_lf_space.inclusion` | functoriality | Increasing support and lowering finite level give continuous closed embeddings and their induced LF maps. |
| `TauCeti.AutomorphicSpectral.nuclear_lf_space.bounded_stage` | characterisation | A bounded set in the strict LF test space is contained and bounded in one Fréchet stage. |
| `TauCeti.AutomorphicSpectral.nuclear_lf_space.distributionDual` | projection | Continuous complex-linear functionals form the strong and weak distribution duals with their named topologies. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.nuclear_lf_space.finite_group` (computation): The constant finite-group function stages induce exactly the usual finite-dimensional topology on their function space.
- `TauCeti.AutomorphicSpectral.nuclear_lf_space.real_line` (compatibility): For real smooth compactly supported tests, the support-stage construction agrees with Mathlib TestFunction topology, and each fixed-support stage embeds as a closed subspace.
- `TauCeti.AutomorphicSpectral.nuclear_lf_space.escaping_support` (non-example): The translates by n of a fixed nonzero real test function are not von Neumann bounded in the actual LF topology; failure of a common support alone is not the conclusion.

**Acceptance and prototype scope.**

- An LF test space has fixed-support pieces; an arbitrary union with unspecified topology is insufficient.
- Suggested model: The suggested real-line tests use Mathlib TestFunction and its fixed-support stages. Nuclearity and the general strict LF universal property are not supplied by these topology/ boundedness tests.
- On the real line, reuse Mathlib TestFunction and its existing locally convex final topology. Supported-stage closed embeddings, strictness, nuclearity and the bounded-set theorem extend that carrier; the topology is not redefined as new infrastructure.

**Sources.**

- [Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor, The Global Gan–Gross–Prasad Conjecture for Unitary Groups: the Endoscopic Case](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf), Appendix A.0.1, A.0.5 and A.0.6; PDF page 145. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-locally-convex-integration"></a>

### Quasi-complete vector integration and summation

**Theorem** · `AutomorphicSpectralTheory:AS.0/locally-convex-integration`.

Proposed interface: `TauCeti.AutomorphicSpectral.locally_convex_integration` in `TauCeti/Automorphic/Spectral/AS0`.

For a quasi-complete Hausdorff locally convex E and a continuous E-valued map on a σ-compact locally compact Radon space, integrability of every continuous seminorm gives a unique vector integral characterized by all continuous linear functionals. Absolutely seminorm-summable families admit unordered sums and continuous linear maps commute with both constructions. A nuclear continuous map carries summable families to absolutely summable families. Bochner integrals in complete normed spaces agree with this integral.

**Hypotheses and conventions.**

- Every seminorm integral is finite; summable and absolutely summable are different hypotheses.

**Construction or proof.**

1. Use compact-support approximation and quasi-completeness to take the vector integral.
2. Apply scalar duality for uniqueness and compatibility.
3. Use an absolutely summable nuclear expansion to bound each target seminorm.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/nuclear-lf-space](#automorphicspectraltheory-as-0-nuclear-lf-space), [mathlib:MeasureTheory.integral_tsum](#mathlib-measuretheory-integral-tsum), [mathlib:MeasureTheory.integral_prod](#mathlib-measuretheory-integral-prod).

**Acceptance and prototype scope.**

- An integral is not asserted for an arbitrary weakly integrable map without the quasi-completeness and seminorm bounds.

**Sources.**

- [Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor, The Global Gan–Gross–Prasad Conjecture for Unitary Groups: the Endoscopic Case](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf), Appendix A.0.2 and Lemmas A.0.6.1–A.0.6.2; PDF page 145. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-projective-tensor"></a>

### Completed projective tensor products

**Construction** · `AutomorphicSpectralTheory:AS.0/projective-tensor`.

Proposed interface: `TauCeti.AutomorphicSpectral.projective_tensor` in `TauCeti/Automorphic/Spectral/AS0`.

For Hausdorff locally convex E,F, the completed projective tensor product E⊗̂πF is the Hausdorff completion for the largest locally convex topology making the canonical bilinear map continuous. Continuous bilinear maps to a complete target correspond uniquely to continuous linear maps from E⊗̂πF. For complete nuclear spaces, the associated kernel descriptions and absolutely summable decompositions have the topology and completeness assumptions of BPCZ A.0.7; no purely algebraic tensor product is substituted.

**Hypotheses and conventions.**

- The completion and separated quotient are explicit; the universal target is complete.

**Construction or proof.**

1. Generate seminorms inf Σp(e_i)q(f_i) and separate their common kernel.
2. Complete and extend continuous bilinear maps by the completion universal property.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/nuclear-lf-space](#automorphicspectraltheory-as-0-nuclear-lf-space), [AutomorphicSpectralTheory:AS.0/locally-convex-integration](#automorphicspectraltheory-as-0-locally-convex-integration).

**Uses that determine the interface.**

- **BPCZ A.0.7–A.0.9**: Controls vector-valued Schwartz functions and nuclear kernel expansions.
- **AS.0 distribution-convergence**: Tensor kernels must use continuous test-space maps.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.projective_tensor.tensor` | constructor | The canonical continuous bilinear map sends (e,f) to e⊗f. |
| `TauCeti.AutomorphicSpectral.projective_tensor.lift` | universal-property | Each continuous bilinear b:E×F→H, H complete, has a unique continuous linear extension. |
| `TauCeti.AutomorphicSpectral.projective_tensor.map_comp` | functoriality | Continuous maps on both factors induce tensor maps respecting identity and composition. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.projective_tensor.scalar_unit` (compatibility): ℂ⊗̂πE≅E for complete E, by z⊗e↦ze.
- `TauCeti.AutomorphicSpectral.projective_tensor.finite_matrix` (computation): ℂᵐ⊗̂πℂⁿ≅ℂ^(m×n).
- `TauCeti.AutomorphicSpectral.projective_tensor.zero` (degenerate): If either factor is zero, the completed product is zero.

**Acceptance and prototype scope.**

- Rank-one functions map to rank-one tensors, and the topology controls their convergent sums.

**Sources.**

- [Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor, The Global Gan–Gross–Prasad Conjecture for Unitary Groups: the Endoscopic Case](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf), Appendix A.0.7; PDF page 148. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-vector-schwartz"></a>

### Vector-valued Schwartz spaces

**Definition** · `AutomorphicSpectralTheory:AS.0/vector-schwartz`.

Proposed interface: `TauCeti.AutomorphicSpectral.vector_schwartz` in `TauCeti/Automorphic/Spectral/AS0`.

For a finite-dimensional real vector space V and quasi-complete locally convex E, 𝓢(V,E) consists of smooth maps f with sup_v(1+‖v‖)^N p(Df(v))<∞ for every N, constant-coefficient differential operator D and continuous seminorm p. Use those seminorms for the topology. For complete nuclear E the map 𝓢(V)⊗̂πE→𝓢(V,E) is the canonical kernel identification with the completeness qualifications in A.0.9. Normed vector-valued Schwartz functions and continuous postcomposition already exist in Mathlib and are imported. The new generality here is quasi-complete locally convex targets not carrying one norm; the proposed tensor identification still needs a precise kernel theorem, as recorded below.

**Hypotheses and conventions.**

- V finite dimensional; E Hausdorff quasi-complete; tensor identification assumes the stronger stated completeness/nuclearity.

**Construction or proof.**

1. Build the topology from differential seminorms; compare scalar evaluations.
2. Apply the nuclear summation and tensor-product universal property to the kernel map.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/projective-tensor](#automorphicspectraltheory-as-0-projective-tensor), [AutomorphicSpectralTheory:AS.0/locally-convex-integration](#automorphicspectraltheory-as-0-locally-convex-integration), [mathlib:SchwartzMap](#mathlib-schwartzmap), [mathlib:SchwartzMap.postcompCLM](#mathlib-schwartzmap-postcompclm).

**Uses that determine the interface.**

- **AS.3 wave-packet**: Rapid parameter decay controls spectral integrals.
- **BPCZ Lemma A.0.9.1**: Nuclear expansions permit integrating Schwartz families.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.vector_schwartz.tensor_apply` | simp | (φ⊗e)(v)=φ(v)e. |
| `TauCeti.AutomorphicSpectral.vector_schwartz.map` | functoriality | A continuous linear map E→F acts pointwise continuously on Schwartz spaces. |
| `TauCeti.AutomorphicSpectral.vector_schwartz.fourier` | compatibility | The vector Fourier transform commutes with continuous scalar functionals and is a continuous automorphism with the dual Haar normalization. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.vector_schwartz.scalar` (compatibility): For E=ℂ this agrees with Mathlib SchwartzMap.
- `TauCeti.AutomorphicSpectral.vector_schwartz.gaussian_tensor` (computation): The transform of e^(−π‖v‖²)e is the same Gaussian times e for self-dual Euclidean measure.
- `TauCeti.AutomorphicSpectral.vector_schwartz.constant` (non-example): A nonzero constant E-valued map on ℝ is not Schwartz.

**Acceptance and prototype scope.**

- Seminorm bounds include every derivative, not only f.

**Sources.**

- [Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor, The Global Gan–Gross–Prasad Conjecture for Unitary Groups: the Endoscopic Case](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf), Appendix A.0.8–A.0.9, Lemma A.0.9.1; PDF page 149. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-operator-meromorphic"></a>

### Weak and strong meromorphic operator families

**Definition** · `AutomorphicSpectralTheory:AS.0/operator-meromorphic`.

Proposed interface: `TauCeti.AutomorphicSpectral.operator_meromorphic` in `TauCeti/Automorphic/Spectral/AS0`.

On a finite-dimensional complex parameter domain U, a continuous-operator family A:E→F is strongly meromorphic with locally finite polar hyperplanes if locally a finite product q of defining linear forms makes qA holomorphic for the topology of uniform convergence on bounded sets. Weak meromorphy tests ℓ(A(z)e), but its equivalence to strong meromorphy requires one common local denominator, barrelled E, quasi-complete F, and locally bounded regularized maps. Laurent coefficients along a transverse coordinate are continuous operators; finite-rank polar parts are an additional conclusion, not part of the definition.

**Hypotheses and conventions.**

- One common denominator and the specified bounded-set topology are essential.

**Construction or proof.**

1. Apply Banach–Steinhaus to common-denominator regularizations and scalar Cauchy integrals.
2. Construct vector Cauchy coefficients with quasi-complete integration; use uniqueness under continuous duals.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/nuclear-lf-space](#automorphicspectraltheory-as-0-nuclear-lf-space), [AutomorphicSpectralTheory:AS.0/locally-convex-integration](#automorphicspectraltheory-as-0-locally-convex-integration), [mathlib:WithSeminorms.banach_steinhaus](#mathlib-withseminorms-banach-steinhaus).

**Uses that determine the interface.**

- **AS.2 Eisenstein-continuation**: Specifies the topology in which continuation is asserted.
- **AS.6 weighted-character**: Derivatives and residues of intertwining families require one denominator.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.operator_meromorphic.regularize` | characterisation | Strong meromorphy is equivalent to a local common scalar denominator giving bounded-set holomorphy. |
| `TauCeti.AutomorphicSpectral.operator_meromorphic.coefficient` | projection | A transverse Laurent coefficient is obtained by a continuous vector Cauchy integral. |
| `TauCeti.AutomorphicSpectral.operator_meromorphic.compose` | functoriality | Continuous fixed pre- and post-composition commute with regularization and Laurent coefficients. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.operator_meromorphic.scalar_pole` (computation): For A(z)=z⁻¹id, the residue at 0 is id and is infinite rank when E is infinite dimensional.
- `TauCeti.AutomorphicSpectral.operator_meromorphic.removable` (degenerate): A holomorphic family has zero negative Laurent coefficients.
- `TauCeti.AutomorphicSpectral.operator_meromorphic.pointwise_orders` (non-example): For the direct-sum family with nth coordinate z^(−n), every finitely supported vector has a local denominator, but no common exponent and radius regularize all basis vectors.

**Acceptance and prototype scope.**

- Pole order cannot depend without bound on the chosen input vector.
- Suggested model: The direct-sum pole counterexample is an algebraic linear-map family on finitely supported sequences, not a bounded operator on a completed Hilbert space. The stronger bounded-set meromorphy theorem remains a separate proof obligation.

**Sources.**

- [Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor, The Global Gan–Gross–Prasad Conjecture for Unitary Groups: the Endoscopic Case](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf), Appendix A.0.3–A.0.5 holomorphy; Arthur 2005 §7 motivates meromorphic extension; PDF page 146. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-analytic-fredholm"></a>

### Analytic Fredholm continuation

**Theorem** · `AutomorphicSpectralTheory:AS.0/analytic-fredholm`.

Proposed interface: `TauCeti.AutomorphicSpectral.analytic_fredholm` in `TauCeti/Automorphic/Spectral/AS0`.

For a norm-holomorphic compact-operator family K(z) on a connected open subset of ℂ, either 1−K(z) is nowhere invertible, or its inverse is norm-meromorphic with discrete poles and finite-rank principal parts. At one invertible point the second alternative holds globally; its inverse agrees with the ordinary bounded inverse away from poles. This one-variable theorem does not by itself supply several-variable hyperplane geometry of Eisenstein singularities.

**Hypotheses and conventions.**

- Banach-space norm holomorphy; compact K(z); a known invertible point when claiming continuation.

**Construction or proof.**

1. Split off a finite-dimensional spectral block near each point using a compact spectral cutoff.
2. Invert the complement by a Neumann series and the finite block by its determinant.
3. Continue across connected overlaps and obtain finite-rank polar coefficients.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/operator-meromorphic](#automorphicspectraltheory-as-0-operator-meromorphic), [tauceti:TauCeti.isFredholm_one_sub](#tauceti-tauceti-isfredholm-one-sub).

**Acceptance and prototype scope.**

- K=1 on a one-dimensional space gives the nowhere-invertible alternative; K(z)=zP gives residue −P at z=1.

**Sources.**

- [Gerald Teschl, Mathematical Methods in Quantum Mechanics](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf), §6.2 Fredholm alternative and analytic perturbation motivation; PDF page 148. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-distribution-convergence"></a>

### Distributional and dominated spectral interchanges

**Theorem** · `AutomorphicSpectralTheory:AS.0/distribution-convergence`.

Proposed interface: `TauCeti.AutomorphicSpectral.distribution_convergence` in `TauCeti/Automorphic/Spectral/AS0`.

For the continuous dual of the LF test space, weak distributional convergence means convergence on every fixed test function; strong convergence means uniform convergence on every bounded test set. A uniformly seminorm-dominated family of kernels or spectral integrals admits sum–integral interchange, differentiation and distributional passage to a limit using the cited Mathlib integrability theorems and locally convex integration. Strong convergence follows only when the estimates are uniform on bounded test sets; pointwise convergence alone is insufficient.

**Hypotheses and conventions.**

- The majorant is integrable and uniform in the asserted parameter neighborhood and test set.

**Construction or proof.**

1. Reduce weak claims by evaluation against a test function and apply the exact baseline Fubini, summation and derivative theorems.
2. Use fixed-support seminorm estimates to upgrade to uniform convergence on bounded LF sets.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/nuclear-lf-space](#automorphicspectraltheory-as-0-nuclear-lf-space), [AutomorphicSpectralTheory:AS.0/locally-convex-integration](#automorphicspectraltheory-as-0-locally-convex-integration), [mathlib:MeasureTheory.integral_prod](#mathlib-measuretheory-integral-prod), [mathlib:MeasureTheory.integral_tsum](#mathlib-measuretheory-integral-tsum), [mathlib:hasFDerivAt_integral_of_dominated_of_fderiv_le](#mathlib-hasfderivat-integral-of-dominated-of-fderiv-le).

**Acceptance and prototype scope.**

- A boundary-value limit on the unitary axis is proved distributionally with its own majorant, never by normal convergence solely inside a half-plane.

**Sources.**

- [Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor, The Global Gan–Gross–Prasad Conjecture for Unitary Groups: the Endoscopic Case](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf), Appendix A.0.2–A.0.5; PDF page 146. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-vector-phragmen-lindelof"></a>

### Vector Phragmén–Lindelöf principle

**Theorem** · `AutomorphicSpectralTheory:AS.0/vector-phragmen-lindelof`.

Proposed interface: `TauCeti.AutomorphicSpectral.vector_phragmen_lindelof` in `TauCeti/Automorphic/Spectral/AS0`.

Let V be a Hausdorff quasi-complete complex locally convex space and C>0. Let Z_±: {Re s>C}→V be holomorphic of finite order in vertical strips. Let H⊂V′ be total (its common kernel is zero). Suppose every ℓ∘Z_±, ℓ∈H, extends to an entire scalar function of finite order in vertical strips and satisfies ℓZ_+(s)=ℓZ_−(−s). Then uniquely Z_± extend to entire V-valued functions of finite order in vertical strips, satisfying Z_+(s)=Z_−(−s). Order≤d means that for every d′>d, exp(−|s|^(d′))Z(s) is bounded in each closed vertical strip of the domain. Finite order is not a polynomial bound.

**Hypotheses and conventions.**

- V is quasi-complete and Hausdorff; C>0; one finite order for each initial vector family; H is a linear total subspace of the continuous dual.
- Scalar entire continuation, finite strip order and the reflected functional equation hold for every ℓ∈H.

**Construction or proof.**

1. Apply scalar Phragmén–Lindelöf to preserve a common strip order through the reflected continuation.
2. Multiply by exp(s^(4n+2)) for sufficiently large n to make the two boundary families rapidly decreasing.
3. On |Re s|<D use (2π)⁻¹∫[Z_±(D+it)/(D+it−s)−Z_∓(D+it)/(D+it+s)]dt; quasi-completeness gives the vector integrals.
4. Scalar Cauchy equality for the total subspace identifies these vector functions and glues the continuation; undo the exponential multiplier.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/locally-convex-integration](#automorphicspectraltheory-as-0-locally-convex-integration), [AutomorphicSpectralTheory:AS.0/operator-meromorphic](#automorphicspectraltheory-as-0-operator-meromorphic).

**Acceptance and prototype scope.**

- Z_+=Z_−=exp(−s²)v is entire of finite vertical-strip order but grows exponentially on the imaginary axis, so no polynomial strip bound follows.
- The common scalar denominators used in meromorphic Eisenstein applications must be cleared before applying this holomorphic theorem.

**Sources.**

- [Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor, The Global Gan–Gross–Prasad Conjecture for Unitary Groups: the Endoscopic Case](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf), Appendix A.0.8 definition; Lemma A.0.10.1, printed p.332. The hypotheses and proof of the entire vector continuation have been read. This lemma does not assert arbitrary polynomial growth.

<a id="automorphicspectraltheory-as-0-yu-145"></a>

### Cycle coordinates for the spectral character cover

**Definition** · `AutomorphicSpectralTheory:AS.0/yu-145`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_145` in `TauCeti/Automorphic/Spectral/AS0`.

Let w permute equal-rank blocks of M. Index its nonempty cycles by j, with length l_j≥1 and common block rank d_j≥1; N_j=l_j*d_j and n=ΣN_j. In unit-circle coordinates z_(j,t), define T by ∏_(j,t)z_(j,t)^d_j=1; A consists of cycle-constant u_j with ∏u_j^N_j=1; B satisfies ∏_t v_(j,t)^d_j=1 separately for each j, and B0 satisfies ∏_t v_(j,t)=1 separately. Embed A and B in T. These are respectively Im X_M^G, Im X_L^G, Im X_M^L and its identity component, L=L_w.

**Hypotheses and conventions.**

- Compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

**Construction or proof.**

1. Write every cycle of w with its length l_j and block size d_j, and define A, B and B₀ by their coordinate-product and weighted central equations.
2. Construct δ_w(c) by successive cyclic ratios; telescoping verifies the B₀ condition.
3. Define μ_w(a,c)=aδ_w(c) in these coordinates. Separate connected torus directions from finite central components before the following degree calculation.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/yu-010](#automorphicspectraltheory-as-1-yu-010), [AutomorphicSpectralTheory:AS.6/yu-047](#automorphicspectraltheory-as-6-yu-047), [AutomorphicSpectralTheory:AS.6/yu-048](#automorphicspectraltheory-as-6-yu-048), [mathlib:MeasureTheory.integral_prod](#mathlib-measuretheory-integral-prod).

**Uses that determine the interface.**

- **PAPER-YU-23/062**: Input to Finite-kernel torus Fourier inversion.
- **PAPER-YU-23/146**: Input to Difference map on every Weyl cycle.
- **PAPER-YU-23/147**: Input to Degree and fibres of the spectral cover.
- **PAPER-YU-23/151**: Input to Typed finite-fibre operator trace.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_145.cycleTori` | constructor | Construct closed subgroups T,A,B,B0 of finite products of Circle from positive integral cycle/rank data. |
| `TauCeti.AutomorphicSpectral.yu_145.componentProduct` | characterisation | The map B→∏_j μ_(d_j), v↦(∏_t v_(j,t))_j is onto with connected kernel B0. |
| `TauCeti.AutomorphicSpectral.yu_145.embedCentral` | compatibility | A embeds by repeating u_j in its l_j coordinates, and its intersection with B0 is ∏_j μ_(l_j). |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_145.test1` (computation): For one cycle l=2,d=1: A=μ₂, B=B0={(z,z⁻¹)}.
- `TauCeti.AutomorphicSpectral.yu_145.test2` (non-example): For one cycle l=1,d=2: B=μ₂ while B0={1}; replacing B by its identity component loses two points.
- `TauCeti.AutomorphicSpectral.yu_145.test3` (degenerate): For w=1, every l_j=1, A=T and B=∏_j μ_(d_j), with B0={1}.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, §§5.2.2–5.2.3 pp32–36; detailed derivation in the continuation report. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-yu-146"></a>

### Difference map on every Weyl cycle

**Theorem** · `AutomorphicSpectralTheory:AS.0/yu-146`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_146` in `TauCeti/Automorphic/Spectral/AS0`.

For the groups in145, δ_w:B→B0, v↦v/w⁻¹(v), is surjective, with kernel ∏_j μ_(N_j). Every fibre has ∏_j N_j points, even when B is disconnected.

**Hypotheses and conventions.**

- Compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

**Construction or proof.**

1. Choose an orientation of each cycle.
2. For b with product one, solve v_t/v_(t−1)=b_t recursively from v_0=c.
3. The final cyclic equation is exactly ∏b_t=1.
4. The condition (∏v_t)^d=1 is an equation c^(ld)=a in Circle, which has exactly ld distinct solutions.
5. For b=1 all v_t=c and c^(ld)=1.
6. Product over cycles; a reverse orientation gives the same cardinality..

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/yu-145](#automorphicspectraltheory-as-0-yu-145), [mathlib:MeasureTheory.integral_prod](#mathlib-measuretheory-integral-prod).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, §§5.2.2–5.2.3 pp32–36; detailed derivation in the continuation report. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-yu-147"></a>

### Degree and fibres of the spectral cover

**Theorem** · `AutomorphicSpectralTheory:AS.0/yu-147`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_147` in `TauCeti/Automorphic/Spectral/AS0`.

The continuous homomorphism mu_w:A×B→T, (a,c)↦a*δ_w(c), is onto with |ker mu_w|=D=(∏l_j)(∏N_j)=|w|*|X_L^L|. For any tau∈T its fibre consists of the finite pairs a∈A, b∈B0 with tau=a*b, followed by c∈B with δ_w(c)=b. There are ∏l_j outer pairs and ∏N_j inner lifts.

**Hypotheses and conventions.**

- Compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

**Construction or proof.**

1. For tau choose u_j with u_j^l_j=∏_t tau_(j,t).
2. Then ∏u_j^N_j=1, so a∈A and b=tau/a∈B0.
3. Choices of a differ by A∩B0=∏μ_(l_j).
4. Apply146 to b.
5. Fibres are translates of the kernel.
6. The notation |w| means product of cycle lengths, not permutation order..

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/yu-145](#automorphicspectraltheory-as-0-yu-145), [AutomorphicSpectralTheory:AS.0/yu-146](#automorphicspectraltheory-as-0-yu-146), [mathlib:MeasureTheory.integral_prod](#mathlib-measuretheory-integral-prod).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, §§5.2.2–5.2.3 pp32–36; detailed derivation in the continuation report. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-yu-148"></a>

### Normalized transfer along a finite compact-group cover

**Construction** · `AutomorphicSpectralTheory:AS.0/yu-148`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_148` in `TauCeti/Automorphic/Spectral/AS0`.

For a continuous surjective homomorphism p:H→K of compact abelian Lie groups with finite kernel F of size D>0, define Tr_p f(y)=D⁻¹Σ_(p(x)=y) f(x). For continuous f this is continuous, and for smooth f it is smooth. Every group carries probability Haar.

**Hypotheses and conventions.**

- Compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

**Construction or proof.**

1. For a surjective finite covering homomorphism p define the normalized transfer by D⁻¹ times the sum over every lift.
2. Pull this average back along p and identify it with translation averaging over ker(p); the number of lifts is exactly D.
3. Use uniqueness of probability Haar under the surjective homomorphism to prove the integral identity. Establish measurability/smoothness locally on covering charts before using it for Fourier series.

**Prerequisites.** [mathlib:MeasureTheory.integral_prod](#mathlib-measuretheory-integral-prod), [mathlib:MonoidHom.measurePreserving](#mathlib-monoidhom-measurepreserving), [mathlib:UnitAddTorus.hasSum_mFourier_series_apply_of_summable](#mathlib-unitaddtorus-hassum-mfourier-series-apply-of-summable), [mathlib:AddChar.expect_eq_ite](#mathlib-addchar-expect-eq-ite).

**Uses that determine the interface.**

- **PAPER-YU-23/062**: Input to Finite-kernel torus Fourier inversion.
- **PAPER-YU-23/149**: Input to Pointwise character inversion gives the fibre average.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_148.transfer` | constructor | Use any lift x of y and average f(x*k) over k∈ker p; prove lift independence. |
| `TauCeti.AutomorphicSpectral.yu_148.integralTransfer` | compatibility | For continuous f, ∫_K Tr_p f=∫_H f, by kernel averaging, Haar invariance and142. |
| `TauCeti.AutomorphicSpectral.yu_148.pullbackTransfer` | characterisation | For continuous g on K, Tr_p(g∘p)=g; for a character χ of H the transfer vanishes unless χ is trivial on ker p, in which case it is the descended character. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_148.test1` (degenerate): Tr_id f=f and Tr_p 1=1 for every nonempty finite fibre.
- `TauCeti.AutomorphicSpectral.yu_148.test2` (computation): For the circle square-cover, normalized transfer of z² is the target coordinate and transfer of z is zero.
- `TauCeti.AutomorphicSpectral.yu_148.test3` (non-example): For the same degree-two cover the normalized transfer of one is one, whereas the unnormalized kernel sum is two.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, §§5.2.2–5.2.3 pp32–36; detailed derivation in the continuation report. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-yu-149"></a>

### Pointwise character inversion gives the fibre average

**Theorem** · `AutomorphicSpectralTheory:AS.0/yu-149`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_149` in `TauCeti/Automorphic/Spectral/AS0`.

For p:H→K as in148 and smooth complex f on H, at every y∈K the absolutely convergent character sum Σ_(χ∈Khat) ∫_H χ(p(x)/y)*f(x) dx equals Tr_p f(y). Equivalently the coefficient indexed by χ is the (χ⁻¹)-Fourier coefficient of Tr_p f. Apply p=mu_w and y=lambda_pi to obtain (5.2.12) with factor D⁻¹.

**Hypotheses and conventions.**

- Compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

**Construction or proof.**

1. Kernel averaging and142 give ∫_H χ(p(x))f(x)=∫_K χ(z)Tr_p f(z).
2. A compact abelian Lie group is a finite abelian group times a torus; for these explicit tori obtain such coordinates from their integer exponent matrices.
3. Combine finite character orthogonality144 and torus inversion143.
4. Item150 supplies absolute summability.
5. Reindex χ to χ⁻¹ to get the displayed sign.
6. This is pointwise evaluation of a smooth function, not evaluation of an L² equivalence class.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/yu-147](#automorphicspectraltheory-as-0-yu-147), [AutomorphicSpectralTheory:AS.0/yu-148](#automorphicspectraltheory-as-0-yu-148), [AutomorphicSpectralTheory:AS.0/yu-150](#automorphicspectraltheory-as-0-yu-150), [mathlib:MeasureTheory.integral_prod](#mathlib-measuretheory-integral-prod), [mathlib:MonoidHom.measurePreserving](#mathlib-monoidhom-measurepreserving), [mathlib:UnitAddTorus.hasSum_mFourier_series_apply_of_summable](#mathlib-unitaddtorus-hassum-mfourier-series-apply-of-summable), [mathlib:AddChar.expect_eq_ite](#mathlib-addchar-expect-eq-ite), [mathlib:AddChar.complexBasis](#mathlib-addchar-complexbasis).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.
- The suggested finite-group specialization quantifies over the full complex additive-character group of the target, uses normalized counting probability Haar, and asserts absolute summability and HasSum equal to the actual normalized finite-fibre transfer. Passing to finite components times a torus remains an explicit adapter.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, §5.2.3, equation (5.2.12), printed p.35; compact smooth Fourier argument via §§5.2.1–5.2.3, pp.32–36. Equation (5.2.12) averages all lifts with the reciprocal finite kernel cardinal and sums over every continuous character. Smoothness supplies absolute Fourier convergence.

<a id="automorphicspectraltheory-as-0-yu-150"></a>

### Smooth Fourier decay on the character groups in the trace formula

**Theorem** · `AutomorphicSpectralTheory:AS.0/yu-150`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_150` in `TauCeti/Automorphic/Spectral/AS0`.

On a finite product of Circle and a finite abelian group, a smooth complex function has absolutely summable Fourier coefficients. For torus dimension d and integer s with 2s>d, |fhat(k)|≤C(1+4π²||k||²)^(-s). The statement includes dimension zero and is uniform in a compact auxiliary parameter when the corresponding derivatives are uniformly bounded.

**Hypotheses and conventions.**

- Compact abelian Lie groups with probability Haar, including disconnected components; smoothness and finite covering assumptions in the statement.

**Construction or proof.**

1. Apply (1−Δ)^s to the periodic smooth function and integrate by parts on each circle; boundary terms cancel.
2. Bound the Fourier coefficient by its L¹ norm to get the displayed estimate.
3. Count lattice points in sup-norm shells to sum (1+||k||²)^(-s).
4. There are only finitely many component characters.
5. For parameter families bound finitely many derivatives on the compact product.
6. Integer-lattice coordinate decomposition and derivative transport remain implementation adapters, not an imported library theorem..

**Prerequisites.** [mathlib:MeasureTheory.integral_prod](#mathlib-measuretheory-integral-prod), [mathlib:MonoidHom.measurePreserving](#mathlib-monoidhom-measurepreserving), [mathlib:UnitAddTorus.hasSum_mFourier_series_apply_of_summable](#mathlib-unitaddtorus-hassum-mfourier-series-apply-of-summable), [mathlib:AddChar.expect_eq_ite](#mathlib-addchar-expect-eq-ite).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.
- The suggested theorem uses an actual continuous function on the unit d-torus whose periodic lift is smooth. It concludes summability of the actual mFourierCoeff family and its decay for every integer s with 2s>d, including d=0. The separate numerical lattice estimate is only a proof helper; finite components and uniform auxiliary parameters remain adapters.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, §5.2.3, equation (5.2.12), printed p.35; smooth Fourier justification. The smooth function in (5.2.12) permits pointwise character inversion. Integration by parts on each torus coordinate supplies the coefficient estimate needed for absolute convergence.

<a id="automorphicspectraltheory-as-0-dit-112"></a>

### Whittaker M and W functions

**Definition** · `AutomorphicSpectralTheory:AS.0/dit-112`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_112` in `TauCeti/Automorphic/Spectral/AS0`.

For y>0 put M_{μ,ν}(y)=Γ(1+2ν)e^(−y/2)y^(ν+1/2) regularized ₁F₁(ν−μ+1/2;1+2ν;y). Initially when Re(ν±μ+1/2)>0 this equals y^(ν+1/2)e^(y/2)Γ(1+2ν)/[Γ(ν+μ+1/2)Γ(ν−μ+1/2)] ∫₀¹ t^(ν+μ−1/2)(1−t)^(ν−μ−1/2)e^(−yt)dt. Define W by y^(ν+1/2)e^(y/2)/Γ(ν−μ+1/2) ∫₁∞t^(ν+μ−1/2)(t−1)^(ν−μ−1/2)e^(−yt)dt in that region, then continue. The M series in the statement is entire in y after stripping the y power and meromorphic in ν; W has decaying normalization.

**Hypotheses and conventions.**

- y>0; initial Euler-integral assumptions Re(ν±μ+1/2)>0; continuation excludes uncompensated gamma poles.

**Construction or proof.**

1. Expand the regularized ₁F₁ series and multiply by the displayed gamma, exponential and positive-real power factors to define M.
2. Apply the beta integral termwise in its initial positive-real-part region to recover the Euler integral and its gamma denominator.
3. Define W by its convergent tail integral there; prove decaying normalization and compare the differential equation. Continue in parameters only after tracking gamma poles and branch choices.

**Prerequisites.** [mathlib:Complex.regularizedHGFun](#mathlib-complex-regularizedhgfun), [mathlib:Complex.radius_regularizedHGFunSeries_eq_top](#mathlib-complex-radius-regularizedhgfunseries-eq-top), [mathlib:Complex.betaIntegral_eq_Gamma_mul_div](#mathlib-complex-betaintegral-eq-gamma-mul-div).

**Uses that determine the interface.**

- **PAPER-DUKE-IMAMOGLU-TOTH-16/110**: Differentiate and integrate the same Whittaker normalization.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.dit_112.eulerIntegral` | constructor | For y>0 and Re(ν±μ+1/2)>0, the series-defined M agrees with its displayed Euler integral; W is defined by the convergent tail integral in this region and continued separately. |
| `TauCeti.AutomorphicSpectral.dit_112.hypergeometricSeries` | compatibility | For Re(s)>0, M_{μ,s−1/2}(y)=e^(−y/2)y^s Γ(2s)·regularized ₁F₁(s−μ;2s;y), using Mathlib Complex.regularizedHGFun with singleton numerator and denominator multisets. |
| `TauCeti.AutomorphicSpectral.dit_112.decayingNormalization` | characterisation | At positive infinity, W has leading term y^μ exp(−y/2), fixing its scale. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.dit_112.test1` (computation): M_{0,1/2}(y)=2 sinh(y/2).
- `TauCeti.AutomorphicSpectral.dit_112.test2` (compatibility): At μ=1, ν=1/2 and y>0, M_{1,1/2}(y)=y e^(−y/2), so the growing-asymptotic coefficient vanishes.
- `TauCeti.AutomorphicSpectral.dit_112.test3` (non-example): For t>0, M_{0,1/2}(2t sin(π/2))=2 sinh(t); replacing the argument by t sin(π/2) gives the wrong value.

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Cycle Integrals of the j-Function and Mock Modular Forms](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf), DIT11 Appendix A, (A.1)–(A.2), p. 977; DIT16 §5, p. 961; the series for M_{μ,s−1/2} is the display on DIT16 p. 984. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-dit-113"></a>

### Whittaker–Bessel comparison

**Theorem** · `AutomorphicSpectralTheory:AS.0/dit-113`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_113` in `TauCeti/Automorphic/Spectral/AS0`.

I_ν(y)=2^(−2ν−1/2)Γ(ν+1)⁻¹y^(−1/2)M_{0,ν}(2y), and K_ν(y)=√(π/(2y))W_{0,ν}(2y). Use these to reconcile every factor2√y in weight-zero expansions.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Set the Whittaker weight μ=0 and substitute y=2t in its differential equation to obtain the modified Bessel equation.
2. Compare the small-argument I branch and large-argument decaying K branch with the QM.2 normalizations.
3. Determine the √t and gamma constants from the initial series/integral values, then use analytic continuation for permitted parameters.

**Prerequisites.** [mathlib:Complex.regularizedHGFun](#mathlib-complex-regularizedhgfun), [mathlib:Complex.radius_regularizedHGFunSeries_eq_top](#mathlib-complex-radius-regularizedhgfunseries-eq-top), [mathlib:Complex.betaIntegral_eq_Gamma_mul_div](#mathlib-complex-betaintegral-eq-gamma-mul-div), `QSeriesPartitionsAndMockModularForms:QM.2`, `QSeriesPartitionsAndMockModularForms:QM.2/modified-bessel-function-i`, [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Cycle Integrals of the j-Function and Mock Modular Forms](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf), DIT11 AppendixA, p977. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-dit-114"></a>

### Whittaker differential and asymptotic API

**Theorem** · `AutomorphicSpectralTheory:AS.0/dit-114`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_114` in `TauCeti/Automorphic/Spectral/AS0`.

W and M satisfy w″+(−1/4+μ/y+(1/4−ν²)/y²)w=0. For Re(s)>0, M_{μ,s−1/2}(y)=y^s(1+O(y)) near0. Away from exceptional parameters its large-y growing term and the decaying W asymptotic have the gamma constants in DIT11 (A.4). Uniform derivative bounds are needed before differentiation under integrals. More explicitly, W_{μ,ν}~y^μe^(−y/2), M_{μ,ν}~Γ(1+2ν)/Γ(ν−μ+1/2)y^(−μ)e^(y/2) in the initial Euler-integral region, continued only where the growing coefficient is nonzero.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Apply the tail-integral Laplace estimate to W to get y^μe^(−y/2) for fixed admitted parameters. Uniform differentiated bounds on parameter compacts require the separate domination/exceptional-parameter continuation contract, and are not supplied by DIT11 Appendix A alone.
2. Apply the endpoint beta/Euler estimate to M to obtain its growing coefficient Γ(1+2ν)/Γ(ν−μ+1/2).
3. If that coefficient vanishes, use the lower branch instead; the generic growing asymptotic cannot be asserted at such a parameter.

**Prerequisites.** [mathlib:Complex.regularizedHGFun](#mathlib-complex-regularizedhgfun), [mathlib:Complex.radius_regularizedHGFunSeries_eq_top](#mathlib-complex-radius-regularizedhgfunseries-eq-top), [mathlib:Complex.betaIntegral_eq_Gamma_mul_div](#mathlib-complex-betaintegral-eq-gamma-mul-div), [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Cycle Integrals of the j-Function and Mock Modular Forms](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf), DIT11 Appendix A, (A.3)–(A.5), printed p.977. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-dit-115"></a>

### Correct sine-power integral

**Theorem** · `AutomorphicSpectralTheory:AS.0/dit-115`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_115` in `TauCeti/Automorphic/Spectral/AS0`.

For Re(ν)>0 and complex β, ∫_0^π e^{iβθ}sin^(ν−1)θ dθ=πe^{iπβ/2}Γ(ν)/(2^(ν−1)Γ((ν+β+1)/2)Γ((ν−β+1)/2)), interpreted via reciprocal gamma. The factor2^(ν−1) is missing in the displayed source formula on p984.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Insert the initial Whittaker Euler integral into the cycle integral with its positive-real powers.
2. Use the uniform endpoint majorant to interchange integrals and evaluate the inner beta/Gamma integral.
3. Compare with the Bessel branch from item113 and continue only the proved parameter identity, with its displayed constants retained.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le), [mathlib:Complex.Gamma_mul_Gamma_add_half](#mathlib-complex-gamma-mul-gamma-add-half), `QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j`, [AutomorphicSpectralTheory:AS.0/dit-113](#automorphicspectraltheory-as-0-dit-113).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), AppendixA, p984; [23]3.892(1). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-dit-118"></a>

### New Whittaker cycle integral

**Theorem** · `AutomorphicSpectralTheory:AS.0/dit-118`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_118` in `TauCeti/Automorphic/Spectral/AS0`.

For μ∈C,t>0,Re(s)>0, ∫_0^π exp(±i(t cosθ+μθ))M_{μ,s−1/2}(2t sinθ)dθ/sinθ = exp(±iπμ/2)(2π)^(3/2)2^(−s)Γ(2s)[Γ((s+1+μ)/2)Γ((s+1−μ)/2)]⁻¹ t^(1/2)J_{s−1/2}(t). Establish the ODE by integration by parts and its t^s leading coefficient using115, then117.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Use the cycle integral and Whittaker differential equation to establish its second-order equation in the radial variable.
2. Control the two endpoints by the proved sin^(σ−1) majorant and show the integration-by-parts terms vanish.
3. Identify the required Bessel solution by its leading behavior, not solely by the differential equation.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le), [mathlib:Complex.Gamma_mul_Gamma_add_half](#mathlib-complex-gamma-mul-gamma-add-half), `QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j`.

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Lemma 7, display (9.4), p. 980 (statement); restated as (A.1), Appendix A, p. 983; proof Appendix A, pp. 983–985. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-dit-165"></a>

### Endpoint-justified integration by parts for both signs

**Theorem** · `AutomorphicSpectralTheory:AS.0/dit-165`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_165` in `TauCeti/Automorphic/Spectral/AS0`.

Let H_ε(t)=t^(−s)∫₀^π exp(εi(t cosθ+μθ))M_{μ,s−1/2}(2t sinθ)dθ/sinθ, μ∈ℂ, Re(s)>0, t>0, ε=±1. Then f_ε=t^sH_ε satisfies f_ε″+(1−s(s−1)/t²)f_ε=0. On every compact parameter set with Re(s)≥σ>0 the integrands and their first two t derivatives are bounded by C sin^(σ−1)θ; the integration-by-parts endpoint terms are O(δ^σ). The calculation works for both signs without complex conjugation.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Differentiate t^(−s) times the Whittaker angular integral twice on compact parameter sets with Re(s)≥σ>0.
2. Use the Whittaker equation and integrate the angular derivative by parts; the endpoint terms are O(δ^σ) and vanish.
3. Obtain f″+(1−s(s−1)/t²)f=0 for f=t^sH_ε, for both signs ε without taking complex conjugates.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le), [mathlib:Complex.Gamma_mul_Gamma_add_half](#mathlib-complex-gamma-mul-gamma-add-half).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Appendix A, proof of (A.1), p.984: Whittaker angular integration by parts and the differential equation for the angular integral, with vanishing endpoint terms.. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-dit-appendix-a2-series-of-whittaker-cycle-integral"></a>

### Series expansion (A.2) of the Whittaker cycle integral

**Theorem** · `AutomorphicSpectralTheory:AS.0/dit-appendix-a2-series-of-whittaker-cycle-integral`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_appendix_a2_series_of_whittaker_cycle_integral` in `TauCeti/Automorphic/Spectral/AS0`.

For μ ∈ ℂ, Re(s) > 0 and t > 0, ∫_0^π e^{i(t cos θ+μθ)} M_{μ,s−1/2}(2t sin θ) dθ/sin θ = 2π e(μ/4) Γ(2s) Σ_{ℓ≥0} Σ_{m+n=ℓ} (−1)^m (s−μ)_n Γ(s+n) / ( m! n! Γ(2s+n) Γ((n+s+m+μ+1)/2) Γ((n+s−m−μ+1)/2) ) · t^{s+ℓ}. The double series converges absolutely for every t, and the reciprocal gammas are entire. The paper writes (s−μ)_n as Γ(s−μ+n)/Γ(s−μ), so the printed prefactor is 2π e(μ/4)Γ(2s)/Γ(s−μ).

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Expand the regularized Whittaker ₁F₁ series and the angular exponential in their initial domain.
2. Use the endpoint sin^(σ−1) majorant for termwise integration and evaluate the beta integrals for the even surviving powers.
3. Collect the coefficients in the stated Pochhammer notation, preserving the gamma normalization and powers of2.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le), [mathlib:Complex.Gamma_mul_Gamma_add_half](#mathlib-complex-gamma-mul-gamma-add-half).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Appendix A, (A.2), p. 985 (derivation p. 984). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-dit-appendix-a3-series-of-rhs"></a>

### Series expansion (A.3) of G(s,μ) t^{1/2} J_{s−1/2}(t)

**Theorem** · `AutomorphicSpectralTheory:AS.0/dit-appendix-a3-series-of-rhs`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_appendix_a3_series_of_rhs` in `TauCeti/Automorphic/Spectral/AS0`.

For μ ∈ ℂ, Re(s) > 0, t > 0: G(s,μ) t^{1/2} J_{s−1/2}(t) = π^{3/2} e(μ/4) 2^{2−2s} Γ(2s) / (Γ((s+1+μ)/2) Γ((s+1−μ)/2)) · Σ_{r≥0} (−1)^r 2^{−2r} / (r! Γ(s+1/2+r)) · t^{s+2r}, where G(s,μ) = e(μ/4)(2π)^{3/2}2^{−s}Γ(2s)/(Γ((s+1+μ)/2)Γ((s+1−μ)/2)).

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Expand the normalized Bessel expression on the right-hand side into its convergent power series.
2. Use the beta/gamma duplication identity to put each coefficient in the same Pochhammer convention as the Whittaker-cycle expansion.
3. Compare the powers and sign dependence without replacing the minus-sign identity by conjugation.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le), [mathlib:Complex.Gamma_mul_Gamma_add_half](#mathlib-complex-gamma-mul-gamma-add-half), `QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j`.

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Appendix A, (A.3), p. 985. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-dit-appendix-a-leading-coefficient-match"></a>

### Agreement of the first coefficients of (A.2) and (A.3)

**Theorem** · `AutomorphicSpectralTheory:AS.0/dit-appendix-a-leading-coefficient-match`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_appendix_a_leading_coefficient_match` in `TauCeti/Automorphic/Spectral/AS0`.

In (A.2) and (A.3) the coefficients of t^s agree, both being 2π e(μ/4) Γ(s) / (Γ((s+1+μ)/2) Γ((s+1−μ)/2)). The coefficient of t^{s+1} in (A.2) is 0: the terms (m,n) = (1,0) and (0,1) cancel because ((s−μ)/2)/Γ((s−μ)/2+1) = 1/Γ((s−μ)/2). The coefficients of t^{s+2} also agree. Together with the common ODE and Frobenius uniqueness (the step recorded in E11: a solution t^s Σ c_n t^n of the ODE is determined by c_0), this proves (A.1).

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Evaluate the leading coefficient of the Whittaker-cycle series with the beta integral.
2. Simplify its gamma ratio by duplication and compare it with the leading coefficient of the normalized Bessel series.
3. Use the common regular ODE/power-series recursion to match all coefficients on the initial domain, then continue the parameter identity.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le), [mathlib:Complex.Gamma_mul_Gamma_add_half](#mathlib-complex-gamma-mul-gamma-add-half).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Appendix A, p. 985 (last paragraph of the proof). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-0-gz-64"></a>

### Legendre function of the second kind Q_{s−1} (2.5), (2.6)

**Definition** · `AutomorphicSpectralTheory:AS.0/gz-64`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_64` in `TauCeti/Automorphic/Spectral/AS0`.

For t>1 and complex s with Re(s)>0, define Q_{s−1}(t)=∫₀∞(t+√(t²−1)cosh u)^(−s)du with the positive real base. It equals Γ(s)²/[2Γ(2s)](2/(1+t))^s ₂F₁(s,s;2s;2/(1+t)), satisfies ((1−t²)Q′)′+s(s−1)Q=0, and for integer s=k≥1 equals the Q_{k−1} of GZ IV(5.7). In particular Q₀(t)=½log((t+1)/(t−1)) and Q₁(t)=tQ₀(t)−1.

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Define Q_{s−1}(t) by its positive-base tail integral for t>1 and Re(s)>0. The cosh growth gives an integrable parameter-uniform tail bound.
2. Use a change of variable to the beta integral and the regularized hypergeometric power series to obtain the stated ₂F₁ expression.
3. Differentiate under the integral to obtain the Legendre equation; evaluate s=1 and2 to recover Q₀ and Q₁ and the integer-weight specialization.

**Prerequisites.** [mathlib:Complex.regularizedHGFun](#mathlib-complex-regularizedhgfun), [mathlib:Complex.betaIntegral_eq_Gamma_mul_div](#mathlib-complex-betaintegral-eq-gamma-mul-div), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le).

**Uses that determine the interface.**

- **GZ86 Chapter II, §2, (2.5), (2.6), p. 238**: Provides the local analytic normalization used by the Fourier, pole or height calculation.
- **GZ.6/7 consumer**: Imports the common spectral special function; the arithmetic height and holomorphic projection constructions remain at their owners.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.gz_64.integral` | constructor | Use the positive-base convergent integral for Re(s)>0. |
| `TauCeti.AutomorphicSpectral.gz_64.hypergeometric` | compatibility | Compare with the displayed ₂F₁ formula on its open-disc argument. |
| `TauCeti.AutomorphicSpectral.gz_64.integer_specialization` | simp | The integer k case is the same Q_{k−1}, with Q₀,Q₁ as stated. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.gz_64.q_zero` (computation): At s=1, Q₀(3)=½log2.
- `TauCeti.AutomorphicSpectral.gz_64.q_one` (computation): At s=2, Q₁(3)=3/2 log2−1.
- `TauCeti.AutomorphicSpectral.gz_64.boundary` (non-example): t=1 has a logarithmic singularity and is excluded from the ordinary pointwise definition.

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter II, §2, (2.5), (2.6), p. 238; inspected printed p.238. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-gz-65"></a>

### Asymptotics of Q_{s−1} (2.7), (2.8)

**Theorem** · `AutomorphicSpectralTheory:AS.0/gz-65`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_65` in `TauCeti/Automorphic/Spectral/AS0`.

Q_{s−1}(t) = −½ log(t − 1) + O(1) as t ↘ 1 (2.7), and Q_{s−1}(t) = O(t^{−s}) as t → ∞ (2.8) (s > 1 fixed).

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Split the defining integral into a bounded interval and its exponential tail.
2. Use a scaled near-singularity comparison with the log integral and an integrable O(1) difference; for t→∞ factor t^(−s) and bound the remaining cosh integral.

**Prerequisites.** [mathlib:Complex.regularizedHGFun](#mathlib-complex-regularizedhgfun), [mathlib:Complex.betaIntegral_eq_Gamma_mul_div](#mathlib-complex-betaintegral-eq-gamma-mul-div), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le), [AutomorphicSpectralTheory:AS.0/gz-64](#automorphicspectraltheory-as-0-gz-64).

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter II, §2, (2.7), (2.8), p. 238; inspected printed p.238. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-gz-66"></a>

### Point-pair invariants g and g_s (2.4), (2.9)

**Definition** · `AutomorphicSpectralTheory:AS.0/gz-66`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_66` in `TauCeti/Automorphic/Spectral/AS0`.

g(z, z′) = log(|z − z′|²/|z̄ − z′|²) satisfies a′) g(γz, γz′) = g(z, z′) for γ ∈ PSL₂(ℝ); b′) continuous and harmonic in each variable on 𝔥 × 𝔥 ∖ diagonal; c′) g = log|z − z′|² + O(1) as z′ → z; but Σ_{γ ∈ Γ₀(N)} g(z, γz′) diverges (barely). For s > 1, g_s(z, z′) = −2Q_{s−1}(1 + |z − z′|²/(2yy′)) (z ≠ z′) (2.9) satisfies a′), c′) (by (2.7)) and Δg_s = s(s−1)g_s in each variable; g₁ = g. The positive spectral Laplacian convention of DIT is −Δ_GZ, so its eigenvalue here is s(1−s).

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Insert the hyperbolic point-pair invariant t=1+|z−z′|²/(2yy′) into −2Q_{s−1}(t).
2. Use invariance of hyperbolic distance to prove simultaneous PSL₂(ℝ) invariance and exchange symmetry.
3. At s=1 insert the explicit Q₀ logarithm. Apply the radial Laplace formula to obtain Δ_GZ g_s=s(s−1)g_s away from the diagonal; retain the opposite DIT sign.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/gz-64](#automorphicspectraltheory-as-0-gz-64), [mathlib:UpperHalfPlane.cosh_dist](#mathlib-upperhalfplane-cosh-dist), [mathlib:UpperHalfPlane.tanh_half_dist](#mathlib-upperhalfplane-tanh-half-dist).

**Uses that determine the interface.**

- **GZ86 Chapter II, §2, (2.4), (2.9), pp. 238–239**: Provides the local analytic normalization used by the Fourier, pole or height calculation.
- **GZ.6/7 consumer**: Imports the common spectral special function; the arithmetic height and holomorphic projection constructions remain at their owners.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.gz_66.invariant` | structure | Simultaneous PSL₂(ℝ) action preserves g_s. |
| `TauCeti.AutomorphicSpectral.gz_66.s_one` | simp | At s=1, −2Q₀(cosh dist)=log(\|z−z′\|²/\|z−bar z′\|²). |
| `TauCeti.AutomorphicSpectral.gz_66.laplace` | relation | Off the diagonal, Δ_GZ g_s=s(s−1)g_s in either variable. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.gz_66.symmetry` (compatibility): g_s(z,z′)=g_s(z′,z).
- `TauCeti.AutomorphicSpectral.gz_66.singularity` (non-example): The diagonal value is not a finite smooth kernel.
- `TauCeti.AutomorphicSpectral.gz_66.bare_sum` (non-example): The Γ₀(N) sum at s=1 diverges; subtract the pole before taking the finite part.

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter II, §2, (2.4), (2.9), pp. 238–239; inspected printed p.238. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-gz-108"></a>

### Asymptotics of the Legendre function Q_{s−1}(t) as t ↘ 1

**Theorem** · `AutomorphicSpectralTheory:AS.0/gz-108`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_108` in `TauCeti/Automorphic/Spectral/AS0`.

For the Legendre function of the second kind Q_{s−1} (s > 1, s near 1) as t ↘ 1: Q_{s−1}(t) = ½ log((t + 1)/(t − 1)) − (Γ′/Γ(s) − Γ′/Γ(1)) + o(1) [printed '+ O(1)'; see PAPER-GROSS-ZAGIER-86/E11].

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Subtract Q₀ from the integral, use an integrable difference, and evaluate the limit by the logarithmic derivative of the beta/gamma identity.
2. Prove the difference remainder tends to zero; a bare O(1) formula does not determine the finite constant.

**Prerequisites.** [mathlib:Complex.regularizedHGFun](#mathlib-complex-regularizedhgfun), [mathlib:Complex.betaIntegral_eq_Gamma_mul_div](#mathlib-complex-betaintegral-eq-gamma-mul-div), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le), [AutomorphicSpectralTheory:AS.0/gz-64](#automorphicspectraltheory-as-0-gz-64).

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter II, §5, display after (5.7), p. 251; inspected printed p.251. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-gz-207"></a>

### The archimedean integral V_s(t)

**Definition** · `AutomorphicSpectralTheory:AS.0/gz-207`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_207` in `TauCeti/Automorphic/Spectral/AS0`.

Fix k ≥ 1. For s ∈ ℂ with Re(s) > 1−k and t ∈ ℝ: V_s(t) = ∫_{−∞}^{∞} e^{−2πixt} dx / ((x+i)^{2k−1}(x²+1)^s). This is the Fourier transform of x ↦ (x+i)^{−(2k−1)}(x²+1)^{−s}, which is absolutely integrable exactly when Re(s) > 1−k.

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Define V_s(t) by the printed Fourier integral on the region where its absolute value is integrable.
2. Bound the denominator separately near finite u and at infinity to obtain local parameter-uniform domination.
3. Move the integral/parameter derivatives only in that region; outside it V_s means the analytically continued function provided below.

**Prerequisites.** [mathlib:Complex.betaIntegral_eq_Gamma_mul_div](#mathlib-complex-betaintegral-eq-gamma-mul-div), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le).

**Uses that determine the interface.**

- **GZ86 Chapter IV, (3.2) Proposition, p. 277**: Provides the local analytic normalization used by the Fourier, pole or height calculation.
- **GZ.6/7 consumer**: Imports the common spectral special function; the arithmetic height and holomorphic projection constructions remain at their owners.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.gz_207.fourier_integral` | constructor | V_s is the explicit Lebesgue Fourier integral in Re(s)>1−k. |
| `TauCeti.AutomorphicSpectral.gz_207.integrable_iff` | characterisation | The seed norm is integrable exactly for Re(s)>1−k. |
| `TauCeti.AutomorphicSpectral.gz_207.parameter_derivative` | compatibility | Differentiate in a compact sub-half-plane using the logarithmic majorant. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.gz_207.k_one` (computation): At k=1, the initial absolutely integrable domain is Re(s)>0.
- `TauCeti.AutomorphicSpectral.gz_207.threshold` (non-example): At Re(s)=1−k the seed norm decays like |x|⁻¹ and is not integrable.
- `TauCeti.AutomorphicSpectral.gz_207.zero_frequency` (compatibility): t=0 equals the gamma formula in AS.0/gz-212.

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter IV, (3.2) Proposition, p. 277; inspected printed p.277. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-gz-212"></a>

### Proposition (3.3a): the value V_s(0)

**Theorem** · `AutomorphicSpectralTheory:AS.0/gz-212`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_212` in `TauCeti/Automorphic/Spectral/AS0`.

For k ≥ 1: V_s(0) = (−1)^k π i 2^{−2s−2k+3} Γ(2s+2k−2)/(Γ(s)Γ(s+2k−1)). This holds for Re(s) > 1−k and gives the meromorphic continuation of V_s(0) in s.

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Set t=0 in the initially absolutely convergent V integral and make the beta/Gamma change of variable.
2. Evaluate the resulting gamma quotient with its phase and integer-weight factors.
3. Continue this scalar identity meromorphically; removable gamma singularities are limits of the quotient, not substitutions into a divergent integral.

**Prerequisites.** [mathlib:Complex.betaIntegral_eq_Gamma_mul_div](#mathlib-complex-betaintegral-eq-gamma-mul-div), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le), [AutomorphicSpectralTheory:AS.0/gz-207](#automorphicspectraltheory-as-0-gz-207).

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter IV, §3, (3.3) Proposition a), p. 277; proofs pp. 279–280; inspected printed p.279. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-gz-213"></a>

### Proposition (3.3b): holomorphy of V_s(t) in s and exponential decay in t

**Theorem** · `AutomorphicSpectralTheory:AS.0/gz-213`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_213` in `TauCeti/Automorphic/Spectral/AS0`.

For t ≠ 0 the function s ↦ V_s(t) continues holomorphically to all s ∈ ℂ and satisfies, locally uniformly in s, V_s(t) = |t|^{O(1)} e^{−2π|t|} as |t| → ∞.

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Deform the Fourier contour according to the sign of t, with the specified branch cuts and orientations.
2. Evaluate the branch-cut jump to obtain the decaying real integral multiplied by reciprocal-gamma factors.
3. Use the exponential decay for local parameter-uniform holomorphy away from t=0 and identify V_s by equality on the initial domain; integer singular parameters require the continued limit.

**Prerequisites.** [mathlib:Complex.betaIntegral_eq_Gamma_mul_div](#mathlib-complex-betaintegral-eq-gamma-mul-div), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le), [AutomorphicSpectralTheory:AS.0/gz-207](#automorphicspectraltheory-as-0-gz-207), [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112).

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter IV, §3, (3.3) Proposition b), p. 277; proof pp. 280–281; inspected printed p.280. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-gz-214"></a>

### Proposition (3.3c): V*_s(t) is entire and satisfies V*_s(t) = sign(t) V*_{2−2k−s}(t)

**Theorem** · `AutomorphicSpectralTheory:AS.0/gz-214`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_214` in `TauCeti/Automorphic/Spectral/AS0`.

For t ≠ 0 set V*_s(t) = (π|t|)^{−s−2k+1} Γ(s+2k−1) V_s(t). At Gamma poles the product means its removable holomorphic extension, rather than multiplication of totalized pointwise Gamma values. Then V*_s(t) is entire in s and V*_s(t) = sign(t) V*_{2−2k−s}(t). For t > 0 this comes from V*_s(t) = ∫_0^∞ u^{s+k−1} e^{−πt(u+1/u)} ∫_{−∞}^{∞} e^{−πtv²} (v + (u^{1/2}+u^{−1/2})/i)^{2k−1} dv du/u.

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Use the Gaussian Mellin integral for V*_s at positive t, whose e^(−πt(u+u⁻¹)) supplies integrability for every s.
2. Substitute u↦u⁻¹ to obtain reflection in s+k−1, retaining sign(t) for negative t.
3. Expand the odd polynomial into the finite a,b,c sum and identify the K-Bessel Mellin integrals.

**Prerequisites.** [mathlib:Complex.betaIntegral_eq_Gamma_mul_div](#mathlib-complex-betaintegral-eq-gamma-mul-div), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le), [AutomorphicSpectralTheory:AS.0/gz-207](#automorphicspectraltheory-as-0-gz-207), [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112).

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter IV, §3, (3.3) Proposition c), p. 278; proof p. 280; inspected printed p.280. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-gz-215"></a>

### Proposition (3.3d): V_{−r}(t) for integers 0 ≤ r ≤ k−1

**Theorem** · `AutomorphicSpectralTheory:AS.0/gz-215`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_215` in `TauCeti/Automorphic/Spectral/AS0`.

Let r ∈ ℤ with 0 ≤ r ≤ k−1. Then V_{−r}(t) = 0 for t < 0 and V_{−r}(t) = 2πi(−1)^{k−r} p_{k,r}(4πt) e^{−2πt} for t > 0, where p_{k,r}(t) = (t/2)^{2k−2−2r} Σ_{j=0}^{r} C(r, j) (−t)^j/(2k−2r−2+j)! (a polynomial). Here V_{−r}(t) = ∫ (x−i)^r (x+i)^{−(2k−1−r)} e^{−2πixt} dx, conditionally convergent for r = k−1.

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Use the contour/branch-cut integral to continue V_s; at s=−r evaluate the finite residues for positive t and the zero for negative t.
2. At s=1−k differentiate the branch jump and identify q_{k−1}; justify the uniform limit on compact negative-frequency sets.

**Prerequisites.** [mathlib:Complex.betaIntegral_eq_Gamma_mul_div](#mathlib-complex-betaintegral-eq-gamma-mul-div), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le), [AutomorphicSpectralTheory:AS.0/gz-207](#automorphicspectraltheory-as-0-gz-207).

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter IV, §3, (3.3) Proposition d), p. 278; proof p. 281; inspected printed p.281. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-gz-216"></a>

### Proposition (3.3e): ∂_s V_s(t) at the centre s = 1−k for t < 0

**Theorem** · `AutomorphicSpectralTheory:AS.0/gz-216`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_216` in `TauCeti/Automorphic/Spectral/AS0`.

For t < 0: ∂/∂s V_s(t)|_{s=1−k} = −2πi q_{k−1}(4π|t|) e^{−2πt}, where q_{k−1}(t) = ∫_1^∞ (x−1)^{k−1} x^{−k} e^{−xt} dx (t > 0).

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Use the contour/branch-cut integral to continue V_s; at s=−r evaluate the finite residues for positive t and the zero for negative t.
2. At s=1−k differentiate the branch jump and identify q_{k−1}; justify the uniform limit on compact negative-frequency sets.

**Prerequisites.** [mathlib:Complex.betaIntegral_eq_Gamma_mul_div](#mathlib-complex-betaintegral-eq-gamma-mul-div), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le), [AutomorphicSpectralTheory:AS.0/gz-207](#automorphicspectraltheory-as-0-gz-207).

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter IV, §3, (3.3) Proposition e), p. 278; proof p. 281; inspected printed p.281. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-gz-217"></a>

### K-Bessel expression for V*_s(t), t > 0

**Theorem** · `AutomorphicSpectralTheory:AS.0/gz-217`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_217` in `TauCeti/Automorphic/Spectral/AS0`.

For t > 0: V*_s(t) = i Σ_{a,b,c≥0, 2a+b+c=2k−1} (−1)^{k−a}(2k−1)!/((2a)! b! c!) · Γ(a+½)/(πt)^{a+½} · ∫_0^∞ u^{s+k+(b−c)/2−2} e^{−πt(u+1/u)} du = (2(−1)^k i/t^{1/2}) Σ_{a,b,c≥0, 2a+b+c=2k−1} (2k−1)!/(a! b! c!) · (−1/(4πt))^a · K_{s+k−1+(b−c)/2}(2πt). For k = 1: V*_s(t) = (−2i/√t)(K_{1/2+s}(2πt) + K_{1/2−s}(2πt)). The functional equation (3.3c) for t > 0 follows from K_ν = K_{−ν} by interchanging b and c.

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Use the Gaussian Mellin integral for V*_s at positive t, whose e^(−πt(u+u⁻¹)) supplies integrability for every s.
2. Substitute u↦u⁻¹ to obtain reflection in s+k−1, retaining sign(t) for negative t.
3. Expand the odd polynomial into the finite a,b,c sum and identify the K-Bessel Mellin integrals.

**Prerequisites.** [mathlib:Complex.betaIntegral_eq_Gamma_mul_div](#mathlib-complex-betaintegral-eq-gamma-mul-div), [mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](#mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le), [AutomorphicSpectralTheory:AS.0/gz-207](#automorphicspectraltheory-as-0-gz-207), [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112), `QSeriesPartitionsAndMockModularForms:QM.2`.

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter IV, §3, proof of (3.3), p. 280; inspected printed p.280. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-0-schwartz-family-continuation"></a>

### Entire continuation of Schwartz families

**Theorem** · `AutomorphicSpectralTheory:AS.0/schwartz-family-continuation`.

Proposed interface: `TauCeti.AutomorphicSpectral.schwartz_family_continuation` in `TauCeti/Automorphic/Spectral/AS0`.

Let A be finite-dimensional real and C>0. Two scalar families Z₊(a,s), Z₋(a,s) are entire of finite order in vertical strips at each a, satisfy Z₊(a,s)=Z₋(a,−s), and, on Re(s)>C, take values holomorphically in the usual Fréchet Schwartz space. On this initial half-plane each family has one finite strip-order exponent for every weighted derivative seminorm; constants may depend on the seminorm and the strip. There are unique entire Schwartz-valued continuations agreeing with those scalar values. They agree with the initial families, satisfy the reflected functional equation and have finite order in the full Schwartz topology on every vertical strip.

**Hypotheses and conventions.**

- Finite-dimensional A with its usual Schwartz seminorm topology; both scalar and vector hypotheses of BPCZ Corollary A.0.11.1.
- A single initial order exponent controls all Schwartz seminorms, rather than only the sup norm of the values.

**Construction or proof.**

1. Use the complete Fréchet Schwartz space and the total span of its point evaluations in BPCZ A.0.11.
2. Reflect the initial right half-plane by the functional equation and apply the vector Phragmén–Lindelöf principle to every continuous seminorm.
3. The resulting entire values agree under every point evaluation; separation gives uniqueness and the vector functional equation.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/vector-phragmen-lindelof](#automorphicspectraltheory-as-0-vector-phragmen-lindelof), [AutomorphicSpectralTheory:AS.0/vector-schwartz](#automorphicspectraltheory-as-0-vector-schwartz).

**Acceptance and prototype scope.**

- Pointwise entire continuation without initial Schwartz-topology strip control is insufficient.
- The suggested specialization uses the existing Mathlib SchwartzMap Fréchet topology and general topological-vector-space differentiation, with all weighted derivative seminorms. It constructs the extension; it does not assert arbitrary initial data are already globally Schwartz.

**Sources.**

- [Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor, The Global Gan–Gross–Prasad Conjecture for Unitary Groups: the Endoscopic Case](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf), Corollary A.0.11.1, pp.332–333; PDF page 150. Corollary A.0.11.1 uses point evaluations as a total dual subspace and requires finite order of the initial Schwartz-valued maps, as well as scalar continuation and reflection.

<a id="automorphicspectraltheory-as-0-lf-dual-continuation"></a>

### Entire continuation of LF dual families

**Theorem** · `AutomorphicSpectralTheory:AS.0/lf-dual-continuation`.

Proposed interface: `TauCeti.AutomorphicSpectral.lf_dual_continuation` in `TauCeti/Automorphic/Spectral/AS0`.

Let W be an LF space, H⊂W a dense linear subspace, and C>0. Suppose Z_±(s,·) are continuous functionals for Re(s)>C, with each scalar Z_±(s,w) holomorphic of one common order≤d in vertical strips. On H they have entire scalar finite-order continuation with Z_+(s,h)=Z_−(−s,h). Then Z_± extend as entire W′-valued finite-order functions and their functional equation holds on every w∈W. Here W′ carries the weak topology of pointwise convergence, as fixed in BPCZ A.0.1; no strong-dual holomorphy is inferred from this citation.

**Hypotheses and conventions.**

- W is LF; H is dense; d is common to all initial scalar evaluations.

**Construction or proof.**

1. Use barrelledness of W and Banach–Steinhaus for the initial vector dual families.
2. The weak continuous dual of a barrelled space is quasi-complete, as used in BPCZ A.0.11; apply the vector principle with the total evaluation subspace supplied by dense H.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/vector-phragmen-lindelof](#automorphicspectraltheory-as-0-vector-phragmen-lindelof), [AutomorphicSpectralTheory:AS.0/nuclear-lf-space](#automorphicspectraltheory-as-0-nuclear-lf-space), [mathlib:WithSeminorms.banach_steinhaus](#mathlib-withseminorms-banach-steinhaus).

**Acceptance and prototype scope.**

- Scalar order bounds on the initial half-plane have one common d.
- The dual topology is pointwise convergence. Entire means every evaluation on W is entire; the values at every parameter are continuous linear functionals.
- The suggested file gives the Banach one-stage LF specialization, with a dense linear subspace, one initial scalar order, agreement, weak holomorphy, continued functional equation and uniqueness. The general LF weak-dual adapter remains required.

**Sources.**

- [Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor, The Global Gan–Gross–Prasad Conjecture for Unitary Groups: the Endoscopic Case](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf), Corollary A.0.11.2, p.333. Corollary A.0.11.2 applies the vector principle to the weak continuous dual of a barrelled LF space; dense H supplies a total evaluation subspace.

<a id="automorphicspectraltheory-as-1"></a>

## AS.1 — Declarations

Coverage: **planned**. Every stated stage target has a node, an imported owner target or a precise gap. Planned means target inventory coverage, not proof closure or implementation. The continuation and Fourier interfaces distinguish restricted test models from the general source adapters.

Atlas landmarks: Normalized induction, Eisenstein series, Intertwining integrals, Pseudo-Eisenstein series, Cuspidal-data decomposition.

<a id="automorphicspectraltheory-as-1-induced-family"></a>

### Normalized induced Hilbert families

**Definition** · `AutomorphicSpectralTheory:AS.1/induced-family` · planet: **Normalized induction**.

Proposed interface: `TauCeti.AutomorphicSpectral.induced_family` in `TauCeti/Automorphic/Spectral/AS1`.

Fix P=MN and a discrete unitary representation σ of M(𝔸)¹, with its automorphic multiplicity space. H_P is the space of measurable functions on N(𝔸)M(F)A_M(ℝ)⁰\G(𝔸) whose m-slices lie in the σ-isotypic discrete space and with ∫_K∫_[M]¹|φ(mk)|²dm dk finite. I_P(λ,g)φ(x)=φ(xg)exp((λ+ρ_P)(H_P(xg)−H_P(x))). The carrier is independent of λ. H_P⁰ consists of smooth, finite-level, K-finite vectors lying in a finite sum of inducing irreducible spaces. A holomorphic section is a holomorphic map to a fixed finite-dimensional subspace of H_P⁰; its flat sections are constant in this compact picture.

**Hypotheses and conventions.**

- F is a number field; G is connected reductive; compatible Iwasawa measures have vol K=vol(N(F)\N(𝔸))=1; work on G(𝔸)¹ or quotient A_G(ℝ)⁰ throughout.

**Construction or proof.**

1. Import H_P and δ_P=exp(2ρ_PH_P) from the adelic measure and cuspidal carriers.
2. Use the Iwasawa cocycle to verify the representation law; the half-modulus gives unitarity on i𝔞_P*.
3. Use finite K types and smooth vectors to define the common holomorphic-section model.

**Prerequisites.** `AdelicAlgebraicGroups:AA.2/log-height`, `AdelicAlgebraicGroups:AA.2/modulus-character`, `AdelicAlgebraicGroups:AA.2/automorphic-quotient-measure`, `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-automorphic-representation`, [AutomorphicSpectralTheory:AS.0/direct-integral](#automorphicspectraltheory-as-0-direct-integral).

**Uses that determine the interface.**

- **Arthur 2005 §7**: A common carrier makes intertwiner composition and parameter derivatives meaningful.
- **AS.3 Maass–Selberg**: The inner product pairs vectors in the fixed compact picture.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.induced_family.action_comp` | relation | I_P(λ,gh)=I_P(λ,g)I_P(λ,h). |
| `TauCeti.AutomorphicSpectral.induced_family.unitary_axis` | structure | For λ imaginary, I_P(λ,g) is unitary. |
| `TauCeti.AutomorphicSpectral.induced_family.flat_section` | constructor | A fixed φ∈H_P⁰ gives an entire flat section λ↦φ; evaluation and right translation are holomorphic. |
| `TauCeti.AutomorphicSpectral.induced_family.local_tensor` | compatibility | For factorizable σ and section, I_P(σ,λ) is the restricted tensor product of the local normalized inductions. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.induced_family.whole_group` (degenerate): For P=G on G(𝔸)¹, ρ_P=H_P=0 and I_P is right translation on the discrete inducing space.
- `TauCeti.AutomorphicSpectral.induced_family.rank_one_half_modulus` (computation): The GL₂ open-cell torus model acts by r^(s+1/2)f(rx), and preserves the L² norm for purely imaginary s.
- `TauCeti.AutomorphicSpectral.induced_family.unnormalized_not_unitary` (non-example): Dropping the half-modulus in the same dilation model, at r=4 a nonzero vector has half its original norm.

**Acceptance and prototype scope.**

- For P=G this is the inducing representation, with no ρ-shift.
- Suggested model: The rank-one norm tests are the normalized GL₂ open-cell dilation realization. Identifying it with the full supplied parabolic-induction compact picture is a required adapter.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §7 pp.32–34. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-eisenstein-series"></a>

### Eisenstein series in the convergence chamber

**Construction** · `AutomorphicSpectralTheory:AS.1/eisenstein-series` · planet: **Eisenstein series**.

Proposed interface: `TauCeti.AutomorphicSpectral.eisenstein_series` in `TauCeti/Automorphic/Spectral/AS1`.

For φ∈H_P⁰ and Re λ−ρ_P in the open positive chamber, define E_P(g,φ,λ)=Σ_{δ∈P(F)\G(F)}φ(δg)exp((λ+ρ_P)H_P(δg)). The sum uses the full rational coset space, is independent of representatives, and is linear in φ. It defines an automorphic smooth function, with right equivariance E(g,I_P(λ,h)φ,λ)=E(gh,φ,λ). Parameter continuation is a separate AS.2 result.

**Hypotheses and conventions.**

- Re(λ−ρ_P)(α∨)>0 for every simple root of P; φ is smooth K-finite finite-level discrete inducing data.

**Construction or proof.**

1. Use N(𝔸)M(F) invariance and rational height zero for representative independence.
2. Apply the convergence theorem before exchanging right translation, sum and derivatives.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/induced-family](#automorphicspectraltheory-as-1-induced-family), `AdelicAlgebraicGroups:AA.3/siegel-covering-adelic`.

**Uses that determine the interface.**

- **AS.2 continuation**: Supplies the germ that continuation must extend uniquely.
- **Gross–Zagier IV**: The integer-weight level-character series are induced specializations.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.eisenstein_series.linear` | structure | E_P is complex linear in the inducing vector. |
| `TauCeti.AutomorphicSpectral.eisenstein_series.automorphic` | relation | E_P(γg,φ,λ)=E_P(g,φ,λ) for γ∈G(F). |
| `TauCeti.AutomorphicSpectral.eisenstein_series.right_equivariant` | compatibility | E(g,I_P(λ,h)φ,λ)=E(gh,φ,λ). |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.eisenstein_series.whole_group` (degenerate): For P=G, E_G(g,φ,0)=φ(g).
- `TauCeti.AutomorphicSpectral.eisenstein_series.zero` (degenerate): E(g,0,λ)=0.
- `TauCeti.AutomorphicSpectral.eisenstein_series.sl2_positive` (computation): For Γ=SL₂(ℤ), the spherical section gives Σ_{Γ∞\Γ}Im(γz)^s for Re s>1, with λ=s−1/2.

**Acceptance and prototype scope.**

- For G anisotropic modulo center, there is only the P=G summand.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §7 equation (7.1) and Lemma 7.1. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-eisenstein-convergence"></a>

### Absolute and differentiated chamber convergence

**Theorem** · `AutomorphicSpectralTheory:AS.1/eisenstein-convergence`.

Proposed interface: `TauCeti.AutomorphicSpectral.eisenstein_convergence` in `TauCeti/Automorphic/Spectral/AS1`.

On Re λ∈ρ_P+(𝔞_P*)⁺ the series defining E_P and the unipotent integrals defining M(w,λ) converge absolutely, locally uniformly for g in compact sets and λ in compact subsets of that chamber. They are holomorphic in λ. Every fixed right archimedean differential operator and finite-level translation can be applied termwise; resulting functions have moderate growth on Siegel sets uniformly on compact parameter subsets. For a finite-dimensional inducing space and fixed derivative, a finite power of the adelic height bounds the absolute majorant.

**Hypotheses and conventions.**

- The inducing vectors are H_P⁰; local uniformity stays strictly inside the chamber; differentiated bounds are for a fixed finite family of derivatives.

**Construction or proof.**

1. Combine reduction theory and rapid decrease of cuspidal inducing data; obtain discrete data by their residual construction when that extension is invoked.
2. Use the chamber inequalities to dominate the rational-coset tail.
3. Use holomorphic compact-subset Cauchy estimates and fixed-vector smoothness for the derivatives.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/induced-family](#automorphicspectraltheory-as-1-induced-family), `AdelicAlgebraicGroups:AA.3/height-siegel-estimate`, `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-spectrum-discrete`, [mathlib:hasFDerivAt_integral_of_dominated_of_fderiv_le](#mathlib-hasfderivat-integral-of-dominated-of-fderiv-le).

**Acceptance and prototype scope.**

- The boundary Re s=1 of spherical SL₂ is excluded; no majorant there is inferred.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §7 Lemma 7.1; §13 paragraph after Proposition 13.2. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-convergent-intertwiner"></a>

### Convergent Weyl intertwining integrals

**Construction** · `AutomorphicSpectralTheory:AS.1/convergent-intertwiner` · planet: **Intertwining integrals**.

Proposed interface: `TauCeti.AutomorphicSpectral.convergent_intertwiner` in `TauCeti/Automorphic/Spectral/AS1`.

For w∈W(𝔞_P,𝔞_Q), choose a rational representative ŵ. In the common compact picture M(w,λ)φ(x)=exp(−(wλ+ρ_Q)H_Q(x))∫_{(N_Q∩ŵN_Pŵ⁻¹)(𝔸)\N_Q(𝔸)}φ(ŵ⁻¹nx)exp((λ+ρ_P)H_P(ŵ⁻¹nx))dn. The chamber convergence theorem defines this on H_P⁰. Rational representatives and compatible quotient measures give the same map to H_Q; it intertwines I_P(λ) with I_Q(wλ). This object precedes both the constant-term and pseudo-Eisenstein inner-product formulas.

**Hypotheses and conventions.**

- Re λ−ρ_P is positive; Haar measures and rational Weyl representatives are fixed compatibly.

**Construction or proof.**

1. Apply the chamber estimate to the unipotent quotient integral.
2. Use changes of variables and the height cocycle for equivariance.
3. The identity Weyl element has a point quotient of mass one.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/induced-family](#automorphicspectraltheory-as-1-induced-family), [AutomorphicSpectralTheory:AS.1/eisenstein-convergence](#automorphicspectraltheory-as-1-eisenstein-convergence), `AdelicAlgebraicGroups:AA.2/quotient-measure-transitivity`, [mathlib:zeta_eq_tsum_one_div_nat_add_one_cpow](#mathlib-zeta-eq-tsum-one-div-nat-add-one-cpow).

**Uses that determine the interface.**

- **Arthur (12.3)**: The inner product formula is proved in the convergence chamber, before continuation.
- **AS.1 constant-term**: Bruhat decomposition produces exactly these integrals.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.convergent_intertwiner.intertwines` | relation | M(w,λ)I_P(λ,g)=I_Q(wλ,g)M(w,λ). |
| `TauCeti.AutomorphicSpectral.convergent_intertwiner.identity` | simp | M(1,λ)=id for P=Q. |
| `TauCeti.AutomorphicSpectral.convergent_intertwiner.holomorphic_chamber` | structure | Every compact-picture matrix coefficient is holomorphic in the chamber. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.convergent_intertwiner.identity_quotient` (degenerate): The actual point-quotient integral returns the original vector.
- `TauCeti.AutomorphicSpectral.convergent_intertwiner.sl2_spherical` (computation): The convergent real spherical integral times its finite-prime Euler product gives ξ(2s−1)/ξ(2s) on the spherical eigenline.
- `TauCeti.AutomorphicSpectral.convergent_intertwiner.target_parabolic` (characterisation): The block-permutation slice transports both inducing labels and parameter, and its operator integral applies the same permutation to the section coordinates; full GL_n induction coherence is required.

**Acceptance and prototype scope.**

- The map has source H_P and target H_Q, not an endomorphism unless P=Q.
- Suggested model: the integral constructor takes an explicit measure and operator-valued integrand. The three tests use the point quotient, the classical real spherical integral with its finite-prime zeta factor, and block permutation of both labels and parameters. The full adelic unipotent integrand and its coherent GL_n inducing carrier remain required; no arbitrary operator is asserted to have the spherical scalar.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §7 equation (7.2) and Lemma7.1, p.34; outer ρ sign corrected as sourceIssue E37. Lemma7.1 supplies the convergence chamber. The displayed outer exponent in (7.2) has a sign error; the packet uses −(wλ+ρ_Q), checked against the identity Weyl case and the local formula on p.135.

<a id="automorphicspectraltheory-as-1-cuspidal-constant-term"></a>

### Finite Weyl constant-term formula

**Theorem** · `AutomorphicSpectralTheory:AS.1/cuspidal-constant-term`.

Proposed interface: `TauCeti.AutomorphicSpectral.cuspidal_constant_term` in `TauCeti/Automorphic/Spectral/AS1`.

For cuspidal inducing φ∈H_P,cusp⁰, the N_Q constant term of E_P equals the sum over W(𝔞_P,𝔞_Q) of exp((wλ+ρ_Q)H_Q(g))(M(w,λ)φ)(g). When the Weyl set is empty the term is zero. For an arbitrary parabolic constant term, the general formula groups rational Bruhat cells by double cosets: each surviving summand is an Eisenstein series on M_Q induced from the appropriate constant term of φ, with its own Levi intertwiner. The displayed finite exponential formula is asserted only for associate Q and cuspidal data.

**Hypotheses and conventions.**

- Initial equality is in absolute convergence; N_Q(F)\N_Q(𝔸) has volume one; the simple associate formula uses cuspidal data.

**Construction or proof.**

1. Unfold the sum against N_Q and use rational Bruhat decomposition.
2. Cuspidality annihilates cells with a proper constant term on M_P.
3. Identify surviving unipotent integrals with M(w,λ); analytic continuation transports the identity.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/eisenstein-series](#automorphicspectraltheory-as-1-eisenstein-series), [AutomorphicSpectralTheory:AS.1/convergent-intertwiner](#automorphicspectraltheory-as-1-convergent-intertwiner), `AutomorphicFormsOnReductiveGroups:AF.3/constant-term`, `SmoothRepresentationsOfLocalGroups:SR.2`.

**Acceptance and prototype scope.**

- For SL₂, E_N=y^s+ξ(2s−1)ξ(2s)⁻¹y^(1−s); the full E is not just its constant term.

**Sources.**

- [Robert P. Langlands, Eisenstein Series](https://publications.ias.edu/sites/default/files/Eisenstein-series-rpl_0.pdf), §3 Lemma 3 and following Bruhat computation. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-pseudo-eisenstein"></a>

### Paley–Wiener pseudo-Eisenstein series

**Construction** · `AutomorphicSpectralTheory:AS.1/pseudo-eisenstein` · planet: **Pseudo-Eisenstein series**.

Proposed interface: `TauCeti.AutomorphicSpectral.pseudo_eisenstein` in `TauCeti/Automorphic/Spectral/AS1`.

Fix cuspidal data (P,σ). Let Ψ:(𝔞_P^G)_ℂ*→H_P,cusp,σ⁰ be entire, valued in one finite-dimensional subspace, and the Fourier–Laplace transform of a smooth compactly supported function on 𝔞_P^G. Set ψ(g)=∫_{Λ+i(𝔞_P^G)*}exp((λ+ρ_P)H_P(g))Ψ(λ,g)dλ and Eψ(g)=Σ_{P(F)\G(F)}ψ(δg). Fourier inversion makes ψ compactly supported in the projected height H_P^G, so the result is independent of Λ. The dual measure satisfies ∫_{i(𝔞_P^G)*}∫_{𝔞_P^G} h(H)e^(−λ(H))dH dλ=h(0); no extra (2π)^rank factor is inserted. This is the fixed trivial A_G(ℝ)⁰-character version on G(F)\G(𝔸)¹ (equivalently the quotient by A_G(ℝ)⁰): λ vanishes on 𝔞_G and the inducing central action is compatible. Arthur Lemmas12.2–12.4 first use all of 𝔞_P and L²(G(F)\G(𝔸)); that full-height version is a separate construction and does not automatically descend to the central quotient.

**Hypotheses and conventions.**

- The compact-picture coefficient space is fixed and finite dimensional; Ψ is Paley–Wiener, not merely an arbitrary entire function.
- Fix the trivial split-central character, parameters in (𝔞_P^G)_ℂ* and the matching central restriction of the inducing datum. In the full-height variant use 𝔞_P and the full arithmetic quotient instead.

**Construction or proof.**

1. Apply scalar Fourier inversion componentwise on 𝔞_P^G with the chosen dual measure; first restrict the central datum and parameter space, then construct ψ with compact projected-height support.
2. Use reduction theory and cusp decay for its automorphic sum.
3. Apply chamber convergence to express Eψ as a shifted contour integral of E_P.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/induced-family](#automorphicspectraltheory-as-1-induced-family), [AutomorphicSpectralTheory:AS.1/eisenstein-series](#automorphicspectraltheory-as-1-eisenstein-series), [AutomorphicSpectralTheory:AS.1/convergent-intertwiner](#automorphicspectraltheory-as-1-convergent-intertwiner), `AutomorphicLFunctionsAndLocalFactors:AL.0`.

**Uses that determine the interface.**

- **Langlands Lemma 12.3**: Unfolding their pairings gives a positive form involving convergent intertwiners.
- **AS.2 continuation**: These vectors provide the elementary Hilbert-space decomposition used in contour shifting.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.pseudo_eisenstein.contour_independent` | characterisation | The inverse-transform ψ is independent of the real shift Λ. |
| `TauCeti.AutomorphicSpectral.pseudo_eisenstein.linear` | structure | Ψ↦Eψ is complex linear. |
| `TauCeti.AutomorphicSpectral.pseudo_eisenstein.eisenstein_integral` | compatibility | For Λ with Λ−ρ_P in the open positive chamber (the absolute-convergence region of AS.1/eisenstein-convergence), Eψ(g)=∫_{Λ+i(𝔞_P^G)*} E_P(g,Ψ(λ),λ)dλ. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.pseudo_eisenstein.zero` (degenerate): The zero Paley–Wiener section gives zero.
- `TauCeti.AutomorphicSpectral.pseudo_eisenstein.split_torus` (compatibility): For a split torus in the full-height variant, P=G and Eψ is ordinary inverse Fourier–Laplace transformation on 𝔞_G; in the fixed-central-character version 𝔞_P^G=0, so this height transform is absent.
- `TauCeti.AutomorphicSpectral.pseudo_eisenstein.wrong_entire_growth` (non-example): For V=ℂ, Ψ(z)=exp(z⁴) is entire but not Paley–Wiener and does not qualify for this construction. More generally exp(z⁴)v is excluded only when v≠0.

**Acceptance and prototype scope.**

- Compact height support does not mean compact support in the full arithmetic quotient.
- For G=G_m, a nonconstant smooth compactly supported function of log|g| is a full-height pseudo-Eisenstein function and does not descend through A_G(ℝ)⁰. The two parameter conventions must remain distinct.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §12 preceding Lemma 12.2. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-pseudo-eisenstein-l2"></a>

### Square-integrability of pseudo-Eisenstein series

**Theorem** · `AutomorphicSpectralTheory:AS.1/pseudo-eisenstein-l2`.

Proposed interface: `TauCeti.AutomorphicSpectral.pseudo_eisenstein_l2` in `TauCeti/Automorphic/Spectral/AS1`.

For the fixed-central-character pseudo-Eisenstein series just defined, Eψ belongs to L²(G(F)\G(𝔸)¹), equivalently L²(G(F)\G(𝔸)/A_G(ℝ)⁰), using parameters and compact height support in 𝔞_P^G. If one instead uses the full 𝔞_P transform of Arthur Lemma12.2, the target is L²(G(F)\G(𝔸)); no descent through the split centre is asserted for an arbitrary full-height section. Both assertions concern finite-dimensional cuspidal Paley–Wiener sections, not an individual unitary-axis Eisenstein series.

**Hypotheses and conventions.**

- Cuspidal inducing vectors; smooth compact height support before summation; compatible quotient measures.
- The split-central convention and height space agree with the preceding construction; the full-height and fixed-central variants are not identified.

**Construction or proof.**

1. Unfold the squared pairing in a positive chamber.
2. Apply cusp orthogonality and convergent intertwiner bounds to the finite Weyl sum; rapid vertical decay makes its integral finite.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/pseudo-eisenstein](#automorphicspectraltheory-as-1-pseudo-eisenstein), [AutomorphicSpectralTheory:AS.1/convergent-intertwiner](#automorphicspectraltheory-as-1-convergent-intertwiner), [mathlib:MeasureTheory.integral_prod](#mathlib-measuretheory-integral-prod).

**Acceptance and prototype scope.**

- SL₂ E(z,1/2+it) is a generalized eigenfunction; smearing the spectral parameter gives L² wave packets.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §12 Lemma 12.2. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-pseudo-eisenstein-inner-product"></a>

### Langlands pseudo-Eisenstein inner product

**Theorem** · `AutomorphicSpectralTheory:AS.1/pseudo-eisenstein-inner-product`.

Proposed interface: `TauCeti.AutomorphicSpectral.pseudo_eisenstein_inner_product` in `TauCeti/Automorphic/Spectral/AS1`.

With Mathlib’s conjugate-first inner product, ⟪Eψ′,Eψ⟫=∫_{Λ+i(𝔞_P^G)*}Σ_{w∈W(𝔞_P,𝔞_Q)}⟪Ψ′(−overline(wλ)),M(w,λ)Ψ(λ)⟫dλ, where Ψ is attached to (P,σ), Ψ′ to (Q,σ′), and Λ−ρ_P is positive. Only compatible inducing cuspidal isotypic spaces contribute. The conjugation in −overline(wλ) is essential: the second section is evaluated on the reflected real contour. On an imaginary contour after justified continuation this becomes wλ. Use the same fixed-central datum and quotient as pseudo-eisenstein. For the full-height version replace 𝔞_P^G by 𝔞_P and use the full arithmetic quotient on both sides.

**Hypotheses and conventions.**

- Paley–Wiener sections of the preceding construction; the equality is first proved in the absolute-convergence chamber.
- Central restriction, contour dimension and both L² measures use the same variant; conjugation is retained in the reflected contour.

**Construction or proof.**

1. Unfold Eψ′ against Eψ and take the cuspidal constant term.
2. Use the finite Weyl formula and Fourier inversion in the height coordinate.
3. Conjugate Langlands’s linear-first convention to match the stated conjugate-first convention; use dominated Fubini.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/pseudo-eisenstein-l2](#automorphicspectraltheory-as-1-pseudo-eisenstein-l2), [AutomorphicSpectralTheory:AS.1/cuspidal-constant-term](#automorphicspectraltheory-as-1-cuspidal-constant-term), [mathlib:MeasureTheory.integral_prod](#mathlib-measuretheory-integral-prod).

**Acceptance and prototype scope.**

- For P=G with no height coordinate, the formula is the ordinary cuspidal inner product.

**Sources.**

- [Robert P. Langlands, Eisenstein Series](https://publications.ias.edu/sites/default/files/Eisenstein-series-rpl_0.pdf), §4 Corollary formula (2). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-cuspidal-datum-space"></a>

### Cuspidal-data generated subspaces

**Definition** · `AutomorphicSpectralTheory:AS.1/cuspidal-datum-space`.

Proposed interface: `TauCeti.AutomorphicSpectral.cuspidal_datum_space` in `TauCeti/Automorphic/Spectral/AS1`.

A cuspidal datum χ is a Weyl-associate class of pairs (P,σ), where σ occurs in L²_cusp([M_P]¹). Let L²_χ be the closed G(𝔸)¹-invariant linear span of the pseudo-Eisenstein series from all pairs in χ. Associate equivalence requires conjugation of σ together with the parabolic; grouping only the parabolics loses spectral information. This definition uses cuspidal carriers supplied by AF.3 and does not construct a second cuspidal spectrum.

**Hypotheses and conventions.**

- The central quotient/G(𝔸)¹ convention is fixed; equivalence includes the representation.

**Construction or proof.**

1. Use the Weyl association relation and conjugation functor on cuspidal representations.
2. Take the Hilbert closure of the generated span; right equivariance proves invariance.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/pseudo-eisenstein-l2](#automorphicspectraltheory-as-1-pseudo-eisenstein-l2), `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-automorphic-representation`.

**Uses that determine the interface.**

- **AS.2 contour-shift continuation**: Continuation takes place separately in the elementary χ-blocks.
- **AS.6 coarse-spectral-distribution**: K_χ is the kernel of projection onto this subspace composed with R(f).

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.cuspidal_datum_space.generator_mem` | constructor | Each Eψ attached to χ lies in L²_χ. |
| `TauCeti.AutomorphicSpectral.cuspidal_datum_space.right_invariant` | structure | Right translation preserves L²_χ. |
| `TauCeti.AutomorphicSpectral.cuspidal_datum_space.associate_eq` | extensionality | Weyl-associate pairs define the same subspace, with the representation transported by that Weyl element. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.cuspidal_datum_space.whole_group_cusp` (compatibility): For χ represented by (G,σ), L²_χ is the σ-isotypic cuspidal summand.
- `TauCeti.AutomorphicSpectral.cuspidal_datum_space.inequivalent_same_levi` (non-example): Distinct closed generated blocks remain distinct in the quotient by equality of cuspidal_datum_space; identifying this block relation with AF Weyl-associate cuspidal data is required.
- `TauCeti.AutomorphicSpectral.cuspidal_datum_space.zero_generators` (degenerate): The closed span of the zero generator set is the zero subspace.

**Acceptance and prototype scope.**

- Two nonassociate cuspidal representations on the same Levi define different χ.
- Suggested model: The typed prototype takes the closure of generators and tests its block quotient. AF must supply actual cuspidal data and prove that source Weyl association has the stated block interpretation; it cannot identify data by parabolic alone.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §12 Lemma 12.4 and its definition. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-cuspidal-data-orthosum"></a>

### Elementary orthogonal cuspidal-data decomposition

**Theorem** · `AutomorphicSpectralTheory:AS.1/cuspidal-data-orthosum` · planet: **Cuspidal-data decomposition**.

Proposed interface: `TauCeti.AutomorphicSpectral.cuspidal_data_orthosum` in `TauCeti/Automorphic/Spectral/AS1`.

The subspaces L²_χ form an orthogonal Hilbert direct sum equal to L²([G]¹). Their finite linear combinations are dense. Orthogonality is proved with the pseudo-Eisenstein inner-product formula in the convergence region; completeness uses induction on parabolic rank and Fourier inversion of constant terms. This decomposition precedes analytic continuation and is distinct from the final discrete-plus-continuous Plancherel parametrization.

**Hypotheses and conventions.**

- All cuspidal associate classes χ occur; reductive Levis use the same quotient measures.

**Construction or proof.**

1. Different χ have no compatible Weyl pairing, hence their generating vectors are orthogonal.
2. A vector perpendicular to all pseudo-Eisenstein series has every cuspidal projection of every parabolic constant term zero.
3. Induct on semisimple rank and use the P=G cuspidal piece to show that vector is zero.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/cuspidal-datum-space](#automorphicspectraltheory-as-1-cuspidal-datum-space), [AutomorphicSpectralTheory:AS.1/pseudo-eisenstein-inner-product](#automorphicspectraltheory-as-1-pseudo-eisenstein-inner-product), `AutomorphicFormsOnReductiveGroups:AF.3/constant-term-transitivity`.

**Acceptance and prototype scope.**

- The elementary χ-block can contain both residues and continuous Eisenstein spectrum.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §12 Lemma 12.4, equation (12.4). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-yu-010"></a>

### Unramified character tori and central degree lattices

**Definition** · `AutomorphicSpectralTheory:AS.1/yu-010`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_010` in `TauCeti/Automorphic/Spectral/AS1`.

For M=∏GL_ni let M(A)^0 be the simultaneous kernel of rational-character degrees, Xi_M the central lattice generated by a in each block, X_M=Hom(M(A)/M(A)^0,C*)≅(C*)^r and X_M^L the characters trivial on Z_L(A). The latter need not be connected; Im denotes its unitary subgroup.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Use determinant degree to identify an unramified character with a tuple (λ_i) on the GL block factors.
2. Impose triviality on the scalar degree-one central subgroup: ∏λ_i^{n_i}=1. The unitary restriction is |λ_i|=1, with every finite component retained.
3. Identify Levi restriction, Weyl permutation and the central finite-root subgroup in these same coordinates.

**Prerequisites.** `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Uses that determine the interface.**

- **PAPER-YU-23/012**: Input to Spherical cuspidal automorphic forms.
- **PAPER-YU-23/017**: Input to Discrete spherical spectrum.
- **PAPER-YU-23/018**: Input to Discrete pairs, their equivalence and stabilizers.
- **PAPER-YU-23/022**: Input to GL_n relative root spaces and degree projections.
- **PAPER-YU-23/047**: Input to Weyl permutations and fixed Levis.
- **PAPER-YU-23/048**: Input to Multiplicative and linear torus pairings.
- **PAPER-YU-23/145**: Input to Cycle coordinates for the spectral character cover.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_010.detCoordinates` | constructor | identify the unramified characters of a product Levi |
| `TauCeti.AutomorphicSpectral.yu_010.trivialOnCenter` | compatibility | construct X_M^L with its components |
| `TauCeti.AutomorphicSpectral.yu_010.unitaryPart` | structure | restrict to probability-Haar compact character tori |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_010.test1` (computation): For M=G=GL_n, X_G^G={z∈C*:z^n=1}.
- `TauCeti.AutomorphicSpectral.yu_010.test2` (non-example): For M=GL₂ and L=M, Im X_M^L=μ₂ has two points and is not connected.
- `TauCeti.AutomorphicSpectral.yu_010.test3` (compatibility): For M=GL_a×GL_b in G=GL_(a+b), X_M^G is given by x^a y^b=1, rather than xy=1 unless a=b=1.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §2.2.3, p. 9 (M(A)^0, Ξ_M, X_M, X_M^L); unitary parts Im X in §4. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-yu-060"></a>

### Induced spherical sections with a fixed normalization

**Definition** · `AutomorphicSpectralTheory:AS.1/yu-060`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_060` in `TauCeti/Automorphic/Spectral/AS1`.

For each R∈P(M), fix the inducing character s_R explicitly. The spherical section space consists of phi on M(F)N_R(A)\G(A)/K with s_R⁻¹ phi|_M∈pi; its basis is s_R*phi_pi. Laf97 p284 and Yu p32 use s_R=rho_R (with P to be replaced by R in Yu); Yu p39 uses s_R=rho_R⁻¹. Item153 supplies the transport contract; S2 retains the choice matching the numerical Rankin–Selberg normalizers.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Start with the supplied spherical inducing space and extend a spherical vector using Iwasawa decomposition and the chosen δ_P half-modulus.
2. Multiply by the determinant character λ^{H_P(g)} and compare the flat section on the compact subgroup.
3. On the unitary axis the modulus of this twist is one; transport the finite-dimensional spherical space and its quotient inner product without changing its Haar normalization.

**Prerequisites.** [AutomorphicSpectralTheory:AS.4/yu-017](#automorphicspectraltheory-as-4-yu-017), [AutomorphicSpectralTheory:AS.4/yu-018](#automorphicspectraltheory-as-4-yu-018), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [AutomorphicSpectralTheory:AS.1/induced-family](#automorphicspectraltheory-as-1-induced-family).

**Uses that determine the interface.**

- **PAPER-YU-23/061**: Input to Intertwiners and operator-valued families.
- **PAPER-YU-23/065**: Input to A stabilizing twist fixes the spherical function.
- **PAPER-YU-23/066**: Input to Scalar intertwiners on spherical sections.
- **PAPER-YU-23/153**: Input to Explicit transport between induction normalization conventions.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_060.sphericalSection` | constructor | For specified s_R, extend phi_pi by phi_R(nmk)=s_R(m)phi_pi(m). |
| `TauCeti.AutomorphicSpectral.yu_060.leviRestriction` | compatibility | Recover phi_pi by multiplying the Levi restriction by s_R⁻¹. |
| `TauCeti.AutomorphicSpectral.yu_060.parameterTwist` | structure | transport along an unramified lambda |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_060.test1` (compatibility): For prescribed s_R, the Levi restriction of s_R*phi_pi multiplied by s_R⁻¹ equals phi_pi.
- `TauCeti.AutomorphicSpectral.yu_060.test2` (degenerate): For R=G the modular character is1, so both displayed rho conventions give the same section.
- `TauCeti.AutomorphicSpectral.yu_060.test3` (non-example): Apply yu_060 to the constant vector one with ρ=2: the positive section gives two and the inverse section gives one half.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §5.2.2 and§5.3.2 pp32,39, E8. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-yu-153"></a>

### Explicit transport between induction normalization conventions

**Construction** · `AutomorphicSpectralTheory:AS.1/yu-153`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_153` in `TauCeti/Automorphic/Spectral/AS1`.

Fix positive inducing characters s_R on M(A). Define A_R,pi^s by s_R⁻¹*phi|_M∈pi and spherical basis phi_R(nmk)=s_R(m)*phi_pi(m). For a second convention t_R, C_R^(s→t) multiplies by t_R/s_R in Iwasawa coordinates. Transport each operator by M^t_(R′|R)=C_R′ M^s_(R′|R) C_R⁻¹. Yu p32 and Laf97 p284 use s_R=rho_R in their membership formula (Yu writes P); Yu p39 uses s_R=rho_R⁻¹. One cannot identify their numerical normalizers until this dictionary, including parameter conventions, is checked.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Compare the two section conventions t_s and s_s on an Iwasawa representative, including their opposite δ half-moduli.
2. Construct the resulting invertible height-dependent transport and conjugate each intertwiner by the source and target transports.
3. Check that the compact-picture vector, unitary norm, cocycle and ratio family are carried together; changing only the scalar factor would not reconcile the two conventions.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/yu-060](#automorphicspectraltheory-as-1-yu-060), [AutomorphicSpectralTheory:AS.2/yu-061](#automorphicspectraltheory-as-2-yu-061), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [AutomorphicSpectralTheory:AS.1/induced-family](#automorphicspectraltheory-as-1-induced-family).

**Uses that determine the interface.**

- **Yu Yu arXiv:1807.04659v5, §§5.2.2–5.2.3 pp32–36; detailed derivation in the continuation report**: Supplies the degree-lattice spectral/truncation calculation with the normalizations stated here.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_153.normalizedSection` | constructor | From a fixed positive character s_R, extend a Levi spherical vector by multiplication by s_R; independence follows from its triviality on M∩K. |
| `TauCeti.AutomorphicSpectral.yu_153.changeConvention` | compatibility | C_R^(t→u)∘C_R^(s→t)=C_R^(s→u), and C_R^(s→s)=Id. |
| `TauCeti.AutomorphicSpectral.yu_153.conjugateOperators` | structure | Transport domains, intertwining identities and norms together; a closed composition on A_P is conjugated by C_P, hence has unchanged finite-dimensional trace. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_153.test1` (computation): The actual section transport from ρ to ρ⁻¹ sends a value-two vector to one half when ρ=2.
- `TauCeti.AutomorphicSpectral.yu_153.test2` (compatibility): Restricting s_R*phi_pi and multiplying by s_R⁻¹ recovers phi_pi exactly.
- `TauCeti.AutomorphicSpectral.yu_153.test3` (non-example): The squared norm of the transported section, integrated with the compensating factor |ρ|⁴, equals the original integrated squared norm.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, §§5.2.2–5.2.3 pp32–36; detailed derivation in the continuation report. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-dit-57"></a>

### Nonholomorphic Eisenstein series

**Construction** · `AutomorphicSpectralTheory:AS.1/dit-57`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_57` in `TauCeti/Automorphic/Spectral/AS1`.

For Re(s)>1, E(z,s)=Σ_{Γ∞\PSL₂(Z)}Im(γz)^s=(1/2)y^sΣ_{gcd(c,d)=1}|cz+d|^(−2s). The half accounts for ±(c,d). Prove local normal convergence and ΔE=s(1−s)E.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Sum Im(γz)^s over primitive bottom rows with the half for ±pairs, or equivalently over Γ∞\Γ.
2. Use the y^Re(s) denominator estimate on a compact z-set to prove absolute locally uniform convergence for Re(s)>1.
3. Transport by Γ and apply the weight-zero Laplacian termwise after proving the differentiated majorant.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/eisenstein-convergence](#automorphicspectraltheory-as-1-eisenstein-convergence).

**Uses that determine the interface.**

- **PAPER-DUKE-IMAMOGLU-TOTH-16/140**: Construct the weight-zero Eisenstein function used in the Hecke formula.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.dit_57.cosetSum` | constructor | Define E by ΣIm(γz)^s in Re(s)>1. |
| `TauCeti.AutomorphicSpectral.dit_57.primitivePairs` | equivalence | The coprime(c, d) expression has factor 1/2 for ±pairs. |
| `TauCeti.AutomorphicSpectral.dit_57.automorphy` | structure | E(γz, s)=E(z, s) and ΔE=s(1−s)E in the normal-convergence region. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.dit_57.test1` (computation): Along the imaginary axis E(iy,2)/y² tends to one as y tends to infinity, testing the actual Eisenstein leading constant term.
- `TauCeti.AutomorphicSpectral.dit_57.test2` (compatibility): Summing primitive pairs without 1/2 doubles E.
- `TauCeti.AutomorphicSpectral.dit_57.test3` (non-example): The critical-line value requires continuation and cannot be obtained by declaring the initial series convergent there.

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (5.2). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-dit-58"></a>

### Completed Eisenstein series

**Construction** · `AutomorphicSpectralTheory:AS.1/dit-58`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_58` in `TauCeti/Automorphic/Spectral/AS1`.

Let Λ(s)=π^(−s/2)Γ(s/2)ζ(s), and E*(z,s)=Λ(2s)E(z,s), with meromorphic values interpreted through continuation. Its critical-line use includes the limit at t=0.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Multiply E(z,s) by the specified completed zeta factor and use its constant/Fourier expansion.
2. Apply zeta’s functional equation and the completed scattering coefficient to obtain E*(z,s)=E*(z,1−s).
3. Separate its poles at0 and1 with the printed residues; all other apparent gamma singularities require cancellation in the completed expression.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/eisenstein-convergence](#automorphicspectraltheory-as-1-eisenstein-convergence), [AutomorphicSpectralTheory:AS.1/dit-57](#automorphicspectraltheory-as-1-dit-57), `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral`.

**Uses that determine the interface.**

- **PAPER-DUKE-IMAMOGLU-TOTH-16/59**: Keep the exact completed constant term.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.dit_58.completion` | constructor | Multiply E(z, s) by Λ(2 s) where Λ is the completed scalar zeta. |
| `TauCeti.AutomorphicSpectral.dit_58.constantTerm` | simp | Its constant Fourier coefficient is Λ(2 s)y^s+Λ(2−2 s)y^(1−s). |
| `TauCeti.AutomorphicSpectral.dit_58.continuation` | compatibility | Define equality with the initial completion on Re(s)>1 and extend meromorphically. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.dit_58.test1` (computation): Residues at 0 and 1 are −1/2 and +1/2.
- `TauCeti.AutomorphicSpectral.dit_58.test2` (compatibility): At critical t=0, cancellations between meromorphic pieces require a limit.
- `TauCeti.AutomorphicSpectral.dit_58.test3` (non-example): An uncompleted E period cannot be substituted into Theorem 3 without dividing by Λ(2 s).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (5.3). The definition preceding (5.3) and the displayed expansion on printed p.962 fix the completed normalization and its two constant terms.

<a id="automorphicspectraltheory-as-1-dit-88"></a>

### Weight-zero Bessel–Kloosterman coefficient

**Construction** · `AutomorphicSpectralTheory:AS.1/dit-88`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_88` in `TauCeti/Automorphic/Spectral/AS1`.

For mn≠0 and Re(s)>1, Φ(m,n;s)=Σ_{c>0}c⁻¹K(m,n;c)B_{2s−1}(4π√|mn|/c), using I for mn<0 and J for mn>0. This sign convention must match the F_{−m} residue.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Define the coefficient sum using the Q-series coefficients and K/J branches for the positive and negative indices with their stated arguments.
2. Prove the Re(s)>1 convergence with coefficient bounds and the respective archimedean asymptotics.
3. Keep the parity/sign convention for opposite indices; these coefficients will be obtained again from Poincaré/resolvent Fourier expansion.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112), [AutomorphicSpectralTheory:AS.0/dit-113](#automorphicspectraltheory-as-0-dit-113), `QSeriesPartitionsAndMockModularForms:QM.2/modified-bessel-function-i`, `QSeriesPartitionsAndMockModularForms:QM.2/bessel-function-j`, `QSeriesPartitionsAndMockModularForms:QM.3/classical-kloosterman-sum`.

**Uses that determine the interface.**

- **PAPER-DUKE-IMAMOGLU-TOTH-16/94**: Take a coefficient residue after constructing the family.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.dit_88.signBranch` | simp | Use I_{2 s−1} for mn<0 and J_{2 s−1} for mn>0. |
| `TauCeti.AutomorphicSpectral.dit_88.initialConvergence` | characterisation | The series over c defines Φ in Re(s)>1 for fixed nonzero m,n. |
| `TauCeti.AutomorphicSpectral.dit_88.resolventComparison` | compatibility | Identify Φwith the actual Fourier coefficient of F_m before continuation. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.dit_88.test1` (computation): m=n=1 uses J.
- `TauCeti.AutomorphicSpectral.dit_88.test2` (compatibility): m=−1, n=1 uses I.
- `TauCeti.AutomorphicSpectral.dit_88.test3` (non-example): The guarded nonzero-frequency coefficient returns no value at index zero and the actual dit_88 coefficient at index one.

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8, p974. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-dit-89"></a>

### Weight-zero Poincaré family

**Construction** · `AutomorphicSpectralTheory:AS.1/dit-89`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_89` in `TauCeti/Automorphic/Spectral/AS1`.

For m≠0 and Re(s)>1 let F_m(z,s)=Σ_{Γ∞\Γ}√Im(γz) I_{s−1/2}(2π|m|Im(γz))e(m Re(γz)); F_0=E. No L² assumption is imposed on the exponentially growing seed.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Construct the nonzero-index seed with its growing I-Bessel normalization and sum over Γ∞\Γ.
2. Use reduction of the y-height and Bessel small-argument behavior for absolute convergence in Re(s)>1; the zero-index seed is the separately normalized Eisenstein family.
3. Differentiate only after local uniform seed/derivative bounds, to obtain the stated Laplace equation.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/eisenstein-convergence](#automorphicspectraltheory-as-1-eisenstein-convergence), [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112), [AutomorphicSpectralTheory:AS.0/dit-113](#automorphicspectraltheory-as-0-dit-113), `QSeriesPartitionsAndMockModularForms:QM.2/modified-bessel-function-i`.

**Uses that determine the interface.**

- **PAPER-DUKE-IMAMOGLU-TOTH-16/93**: Extract a Maass eigenprojection from a non-L² series.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.dit_89.seed` | constructor | Use √yI_{s−1/2}(2π\|m\|y)e(mx) for nonzero m. |
| `TauCeti.AutomorphicSpectral.dit_89.automorphicSum` | structure | The coset sum is Γ-invariant in Re(s)>1. |
| `TauCeti.AutomorphicSpectral.dit_89.resolventContinuation` | compatibility | Relate the seed and Fourier expansion to the resolvent rather than assuming the growing series is L². |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.dit_89.test1` (computation): m=0 gives E by a separate definition.
- `TauCeti.AutomorphicSpectral.dit_89.test2` (compatibility): The absolute value of m occurs in the Bessel argument but not in the phase.
- `TauCeti.AutomorphicSpectral.dit_89.test3` (non-example): Under the standard large-argument I-Bessel asymptotic, the actual nonzero Poincaré seed has nonintegrable squared norm on the cusp for real s>1; it cannot be inserted directly as an L² vector.

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.
- Suggested model: The non-L² seed test explicitly assumes the source I-Bessel large-argument asymptotic for the special-function carrier. It does not treat the growing untruncated seed as an L² vector.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (8.1). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-dit-90"></a>

### Poincaré eigenfunction and convergence

**Theorem** · `AutomorphicSpectralTheory:AS.1/dit-90`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_90` in `TauCeti/Automorphic/Spectral/AS1`.

F_m converges normally on compact sets for Re(s)>1, is Γ-invariant and satisfies ΔF_m=s(1−s)F_m. The differentiated series needs its own compact majorant.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Bound the Poincaré seed and its differentiated forms on a compact subset of 𝔥 by the initial-chamber powers of Im(γz).
2. Compare their sums with the absolutely convergent Eisenstein majorant for Re(s)>1.
3. Obtain locally uniform convergence and the parameter-holomorphic sum; the boundary Re(s)=1 is not inferred from these bounds.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112), [AutomorphicSpectralTheory:AS.0/dit-113](#automorphicspectraltheory-as-0-dit-113), `QSeriesPartitionsAndMockModularForms:QM.2/modified-bessel-function-i`.

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8, p973. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-dit-105"></a>

### Weight-two Poincaré one-form

**Construction** · `AutomorphicSpectralTheory:AS.1/dit-105`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_105` in `TauCeti/Automorphic/Spectral/AS1`.

Let φ be a smooth function on (0,∞) with φ(y)≪y^{ε} for some ε>0 as y→0 (the weaker sufficient hypothesis used in this adapter; the paper prints φ(y)≪y^{1+ε} on p.979), let m∈ℤ and f(τ)=e(m Re τ)φ(Im τ). Put P_m(τ,φ)=Σ_{γ∈Γ∞\Γ} f(γτ)·d(γτ)/dτ. The paper prints d(γz)/dz. P_m transforms with weight 2, so P_m(τ,φ)dτ is a Γ-invariant 1-form. Absolute convergence of this series, and of the unfolding in Lemma 6, only needs φ(y)≪y^{ε}. That weaker bound is what the φ of (9.2) satisfies for Re(s)>1, since φ(y)≍y^{s−1} as y→0. Local normal convergence of differentiated series additionally requires the corresponding derivative seed bounds; a value bound alone is insufficient.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Form the stated weight-two one-form from a seed satisfying the correct near-zero power bound φ(y)≪y^ε.
2. Prove local uniform convergence of both the seed sum and differentiated seed sum, using the corresponding derivative bounds.
3. Apply the differential/raising identity termwise and compare its Fourier primitive and constant term; a bound for the seed value alone does not justify this differentiation.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/eisenstein-convergence](#automorphicspectraltheory-as-1-eisenstein-convergence).

**Uses that determine the interface.**

- **PAPER-DUKE-IMAMOGLU-TOTH-16/106**: Unfold invariant differentials rather than scalar densities.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.dit_105.oneFormSum` | constructor | Sum the seed times d(γz), including the Möbius derivative. |
| `TauCeti.AutomorphicSpectral.dit_105.weightTwo` | compatibility | P_m(γz)γ′(z)=P_m(z), so the one-form P_m dz descends to the quotient. |
| `TauCeti.AutomorphicSpectral.dit_105.parameterBounds` | characterisation | Expose small-y bounds for φ and the derivatives actually used in normal convergence. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.dit_105.test1` (computation): For a smooth compactly supported seed, inversion transforms the actual Poincaré coefficient with derivative z^(−2), as required for the descended weight-two one-form.
- `TauCeti.AutomorphicSpectral.dit_105.test2` (compatibility): Reversing the interval orientation negates the integral of the actual dit_105 one-form pulled back along a parametrized cycle.
- `TauCeti.AutomorphicSpectral.dit_105.test3` (non-example): The smooth positive-axis seed y² sin(exp(1/y)) satisfies the named value-bound condition of order two (hence the small-y value condition with ε = 1), while its derivative has no uniform bound near zero; a value bound does not imply the derivative majorant.

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.
- Suggested model: The inversion test uses a smooth compactly supported seed, a sufficient convergence specialization. The oscillating seed is smooth on the positive axis and violates the derivative majorant despite its value bound; it does not assert divergence of the differentiated global series without an additional comparison.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §9, p979. The printed hypothesis is y^{1+ε}. The adapter separately justifies the weaker y^ε value bound by comparison with the Eisenstein majorant of exponent 1+ε; derivative convergence requires additional derivative bounds.

<a id="automorphicspectraltheory-as-1-dit-110"></a>

### Differentiated Whittaker seed

**Theorem** · `AutomorphicSpectralTheory:AS.1/dit-110`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_110` in `TauCeti/Automorphic/Spectral/AS1`.

For the weight-zero seed of F_m, −2i∂_zF_m is the weight-two Poincaré series with seed −s|m|^(−1/2)(2πy)⁻¹ Γ(s)/Γ(2s) M_{sgn(m),s−1/2}(4π|m|y)e(mx).

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Differentiate the flat Poincaré seed using the specified weight-raising operator and the Whittaker recursion.
2. Compute the nonzero Fourier terms with the stated factor and index sign, retaining the separately raised zero mode.
3. Pass raising through the sum on the region of local differentiated convergence and then continue the parameter identity meromorphically.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112), [AutomorphicSpectralTheory:AS.0/dit-113](#automorphicspectraltheory-as-0-dit-113).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (9.2). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-dit-fourier-expansion-weight0-poincare"></a>

### Fourier expansion of F_m(z,s) (cited)

**Theorem** · `AutomorphicSpectralTheory:AS.1/dit-fourier-expansion-weight0-poincare`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_fourier_expansion_weight0_poincare` in `TauCeti/Automorphic/Spectral/AS1`.

Let m≠0 and Re(s)>1. Then F_m(z,s)=f_m(z,s)+2|m|^{1/2−s}σ_{2s−1}(|m|)((2s−1)Λ(2s))⁻¹y^{1−s}+2y^{1/2}Σ_{n≠0}Φ(m,n;s)K_{s−1/2}(2π|n|y)e(nx), with Λ(s)=π^{−s/2}Γ(s/2)ζ(s) and Φ as in item 88.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Unfold the x-Fourier coefficient of the seed Poincaré sum in Re(s)>1.
2. Group nontrivial double cosets into Kloosterman sums imported from QM and evaluate the archimedean integral by the I/J/K adapters.
3. Separate the m=0 term and the two nonzero signs. Use the proved summability bounds before comparing to the continued family.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112), [AutomorphicSpectralTheory:AS.0/dit-113](#automorphicspectraltheory-as-0-dit-113).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8, p.974, citing [20] and [16]. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-1-gz-69"></a>

### Weight-0 Eisenstein series E_N(z, s) at ∞ (2.14)

**Definition** · `AutomorphicSpectralTheory:AS.1/gz-69`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_69` in `TauCeti/Automorphic/Spectral/AS1`.

Construct the cusp-∞ normalized level-N adapter E_N to the imported congruence-class weight-zero Eisenstein series of ER.7: E_N=[2ζ(2s)∏_{p|N}(1−p^(−2s))]⁻¹ Σ_{v∈(ℤ/Nℤ)×} E_{(0,v)} for Re(s)>1. Prove this equals Σ_{Γ∞\Γ₀(N)}Im(γz)^s, and that E_1 agrees with AS.1/dit-57. Under Δ_GZ=+y²(∂x²+∂y²), Δ_GZ E_N=s(s−1)E_N; −4πE_N has residue κ_N=−12/[SL₂(ℤ):Γ₀(N)] at s=1.

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Sum the ER.7 congruence-class Eisenstein series over unit residues (0,v), and divide by the stated zeta/Euler factor.
2. Separate a bottom row into its primitive part and common divisor; the removed Euler factors impose the level-N coprimality condition.
3. Identify the primitive Γ∞\Γ₀(N) sum, compare N=1 with DIT’s half ±pair normalization, and compute its residue from the hyperbolic quotient volume.

**Prerequisites.** `EllipticRegulators:ER.7/real-analytic-eisenstein-series`, [AutomorphicSpectralTheory:AS.1/dit-57](#automorphicspectraltheory-as-1-dit-57), [mathlib:zeta_eq_tsum_one_div_nat_add_one_cpow](#mathlib-zeta-eq-tsum-one-div-nat-add-one-cpow).

**Uses that determine the interface.**

- **GZ86 Chapter II, §2, (2.14), p. 239**: Provides the local analytic normalization used by the Fourier, pole or height calculation.
- **GZ.6/7 consumer**: Imports the common spectral special function; the arithmetic height and holomorphic projection constructions remain at their owners.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.gz_69.congruence_adapter` | constructor | Use the stated finite sum of ER.7 congruence classes divided by the Euler/zeta factor. |
| `TauCeti.AutomorphicSpectral.gz_69.coset_sum` | characterisation | The adapter equals the primitive coset sum in Re(s)>1. |
| `TauCeti.AutomorphicSpectral.gz_69.level_one` | compatibility | At N=1 it equals the DIT E with the same half for ±pairs. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.gz_69.level_one_test` (computation): N=1 gives E and residue3/π.
- `TauCeti.AutomorphicSpectral.gz_69.prime_level` (computation): For N=p, using the named ER.7 meromorphic congruence-pair continuation and Mathlib Riemann zeta in the actual gz_69 adapter, the s=1 residue is 3/[π(p+1)]. It is not asserted for arbitrary series or arbitrary normalizing functions.
- `TauCeti.AutomorphicSpectral.gz_69.nonprimitive` (non-example): The actual unrestricted nonzero integer-pair Eisenstein sum at s=2 equals 2ζ(4) times the primitive-coset dit_57 series and differs from that normalized series.

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter II, §2, (2.14), p. 239; inspected printed p.239. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-1-gz-70"></a>

### E_N via the SL₂(ℤ) series (2.16)

**Theorem** · `AutomorphicSpectralTheory:AS.1/gz-70`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_70` in `TauCeti/Automorphic/Spectral/AS1`.

For N ≥ 1: E_N(z, s) = N^{−s} ∏_{p|N} (1 − p^{−2s})⁻¹ Σ_{d|N} μ(d) d^{−s} E((N/d)z, s), E = E₁ the SL₂(ℤ) series; consequently E_N(w_N z, s) = N^{−s} ∏_{p|N}(1 − p^{−2s})⁻¹ Σ_{d|N} μ(d) d^{−s} E(dz, s) (p. 241).

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Apply the primitive/unrestricted bottom-row decomposition to the level-N Eisenstein adapter.
2. Use Möbius inversion to remove the prime divisibility conditions and express the result through the full-level series at the appropriate scaled arguments.
3. For each divisor retain its scaling exponent and Euler factor before computing the constant term.

**Prerequisites.** `EllipticRegulators:ER.7/real-analytic-eisenstein-series`, [AutomorphicSpectralTheory:AS.1/dit-57](#automorphicspectraltheory-as-1-dit-57), [AutomorphicSpectralTheory:AS.1/gz-69](#automorphicspectraltheory-as-1-gz-69), [mathlib:ArithmeticFunction.moebius](#mathlib-arithmeticfunction-moebius).

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter II, §2, (2.16), p. 240; p. 241; inspected printed p.240. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-1-gz-179"></a>

### Non-holomorphic Eisenstein series E_s = E_{M,ε,2k−1,s} of level M = N|D|

**Definition** · `AutomorphicSpectralTheory:AS.1/gz-179`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_179` in `TauCeti/Automorphic/Spectral/AS1`.

Let D<0 be a fundamental discriminant, ε its odd primitive quadratic character, δ=|D|, k≥1 and (N,D)=1. With M = N|D|: E_s(z) = E_{M,ε,2k−1,s}(z) = L^{(N)}(2s+2k−1, ε) Σ_{±(∗ ∗; c d) ∈ Γ_∞\Γ₀(M)} ε(d)(cz+d)^{−(2k−1)} y^s |cz+d|^{−2s} = ½ Σ_{c,d∈ℤ, c≡0 (mod M), (d,M)=1} ε(d)(cz+d)^{−(2k−1)} y^s |cz+d|^{−2s}, for Re(s) large. Here L^{(N)}(s, ε) = Σ_{(n,N)=1} ε(n)n^{−s} and Γ_∞ = {±(1 n; 0 1)}. E_s ∈ M̃_{2k−1}(Γ₀(M), ε). (The two expressions agree: pull out g = gcd(c,d), which is prime to M, and pair ±(c,d) using ε(−1)(−1)^{2k−1} = 1.)

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Start with the half unrestricted lattice sum of odd integer weight and the primitive odd quadratic character.
2. Separate the common divisor from each pair; its character and complex power produce the partial L^(N) factor converting to the primitive Eisenstein sum.
3. Use the odd parity to identify the two ±terms and verify the level and Nebentypus after the prescribed normalization.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/induced-family](#automorphicspectraltheory-as-1-induced-family), [AutomorphicSpectralTheory:AS.1/eisenstein-convergence](#automorphicspectraltheory-as-1-eisenstein-convergence), `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral`.

**Uses that determine the interface.**

- **GZ86 Chapter IV, §1, p. 271**: Provides the local analytic normalization used by the Fourier, pole or height calculation.
- **GZ.6/7 consumer**: Imports the common spectral special function; the arithmetic height and holomorphic projection constructions remain at their owners.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.gz_179.primitive_to_full` | equivalence | The L^(N) factor converts the primitive coset sum into the half unrestricted sum. |
| `TauCeti.AutomorphicSpectral.gz_179.automorphy` | structure | The series has weight2k−1 and Nebentypus ε on Γ₀(Nδ). |
| `TauCeti.AutomorphicSpectral.gz_179.n_one` | compatibility | For N=1 it is the D₁=1 case of AS.1/gz-192. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.gz_179.sign_pair` (computation): With an odd character, negating both lattice indices leaves the actual gz_179 summand unchanged; the half-sum equals the series constructor.
- `TauCeti.AutomorphicSpectral.gz_179.n_one_test` (compatibility): N=1 gives levelδ.
- `TauCeti.AutomorphicSpectral.gz_179.wrong_parity` (non-example): With an even character and an absolutely summable odd-weight lattice family, the actual gz_179 series vanishes by cancellation of opposite indices.

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter IV, §1, p. 271; inspected printed p.271. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-1-gz-192"></a>

### Eisenstein series E^{(D₁)}_s attached to a decomposition D = D₁·D₂ (2.1)

**Definition** · `AutomorphicSpectralTheory:AS.1/gz-192`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_192` in `TauCeti/Automorphic/Spectral/AS1`.

Fix an odd negative fundamental discriminant D, k≥1 and a factorization D=D₁D₂ into fundamental discriminants, allowing D_i=1. Let ε_i be the primitive quadratic characters of conductors |D_i|. For sufficiently large Re(s), define E_s^(D₁)(z) by half the sum over integer pairs (m,n) with D₂ dividing m of ε₁(m)ε₂(n)(mz+n)^(−2k+1) Im(z)^s |mz+n|^(−2s). Its transformation law has weight 2k−1 and character ε₁ε₂ on Γ₀(|D|). The case D₁=1 recovers the level-|D₂| series. Genus characters and ramified ideals are imported arithmetic data for the consumers, rather than part of this analytic definition.

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. For D=D₁D₂ define the character-pair lattice summand and its integer weight, character factors and denominator.
2. Use the stated linear/congruence substitution to verify its transformation under Γ₀(δ), keeping the primitive versus unrestricted scalar factor.
3. Compare the D₁=1 specialization with item179 and retain the sign of D and odd/even character parity rather than assuming every pair has the same symmetry.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/induced-family](#automorphicspectraltheory-as-1-induced-family), [AutomorphicSpectralTheory:AS.1/eisenstein-convergence](#automorphicspectraltheory-as-1-eisenstein-convergence), `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral`, [tauceti:TauCeti.Multiquadratic.IsFundamentalDiscriminant](#tauceti-tauceti-multiquadratic-isfundamentaldiscriminant).

**Uses that determine the interface.**

- **GZ86 Chapter IV, §2, (2.1), p. 273**: Provides the local analytic normalization used by the Fourier, pole or height calculation.
- **GZ.6/7 consumer**: Imports the common spectral special function; the arithmetic height and holomorphic projection constructions remain at their owners.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.gz_192.pair_sum` | constructor | Use ½Σ_{D₂\|m}ε₁(m)ε₂(n)(mz+n)^(−2k+1)y^s\|mz+n\|^(−2s). |
| `TauCeti.AutomorphicSpectral.gz_192.d1_one` | simp | D₁=1 recovers E^(1)_s of GZ IV(1.2). |
| `TauCeti.AutomorphicSpectral.gz_192.automorphy` | structure | The coefficient pair transforms by ε(d), giving weight2k−1 on Γ₀(δ). |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.gz_192.d1_one_test` (degenerate): D₁=1 gives the levelδ series.
- `TauCeti.AutomorphicSpectral.gz_192.odd_product` (computation): When the product of the two character parities is odd, simultaneous sign reversal preserves the actual two-character lattice summand and its half-sum is gz_192.
- `TauCeti.AutomorphicSpectral.gz_192.nonfundamental` (non-example): The constructor guard using the upstream fundamental-discriminant criterion accepts 12 and rejects 16. The raw analytic lattice sum alone does not construct primitive arithmetic characters.

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.
- Suggested model: The discriminant guard is an adapter for the existing Tau Ceti predicate, fixed by its exact criterion; its compiled module is unavailable in the shared build. The raw lattice sum omits primitive-character and Gauss-sum carriers. Discriminant 12 is fundamental; this boundary test is outside GZ’s odd-D specialization and must not be used to relax that source hypothesis.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter IV, §2, (2.1), p. 273; inspected printed p.273. GZ Chapter IV §2, equation (2.1), defines the two-character lattice sum. The transformation calculation uses the quadratic-character factors and the level |D|; the proposed construction retains its odd-discriminant and convergence conditions.

<a id="automorphicspectraltheory-as-1-gz-208"></a>

### Poisson (Lipschitz-type) identity for Σ_l (z+l)^{−(2k−1)}|z+l|^{−2s}

**Theorem** · `AutomorphicSpectralTheory:AS.1/gz-208`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_208` in `TauCeti/Automorphic/Spectral/AS1`.

For k ≥ 1, z = x+iy ∈ ℌ and Re(s) > 1−k: Σ_{l∈ℤ} 1/((z+l)^{2k−1}|z+l|^{2s}) = y^{−2s−2k+2} Σ_{r∈ℤ} V_s(ry) e^{2πirx}. Termwise Poisson requires the value/derivative decay proved from the explicit seed; general L¹ Fourier inversion alone is insufficient.

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Fix the nonzero bottom-row variable and periodize the archimedean seed in the remaining lattice variable.
2. Prove the required seed and derivative decay before applying Poisson summation; Fourier inversion for a general L¹ function is insufficient.
3. Compute the shifted exponential, character and lattice-scaling factors, expressing each nonzero Fourier integral as V_s with its exact argument.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/gz-207](#automorphicspectraltheory-as-0-gz-207).

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter IV, §3, proof of (3.2), p. 278; inspected printed p.278. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-1-gz-209"></a>

### Fourier expansion of E^{(D₁)}_s

**Theorem** · `AutomorphicSpectralTheory:AS.1/gz-209`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_209` in `TauCeti/Automorphic/Spectral/AS1`.

Let D<0 be a fundamental discriminant, ε its odd primitive quadratic character, δ=|D|, k≥1 and (N,D)=1. Standing notation (Ch. IV §0, p. 267): K = ℚ(√D) imaginary quadratic with fundamental discriminant D < 0, δ = |D|, ε(n) = (D/n) the odd primitive quadratic character of conductor δ, w = #O_K^×, 𝒜 ∈ Cl_K an ideal class, r_𝒜(n) = #{integral ideals of norm n in 𝒜} (n ≥ 1), r_𝒜(0) = 1/w; k ≥ 1 an integer; N ≥ 1 with (N, D) = 1; f = Σ a(n)qⁿ ∈ S_{2k}^new(Γ₀(N)); L_𝒜(f,s) = L^{(N)}(2s−2k+1, ε) Σ_{n≥1} a(n) r_𝒜(n) n^{−s} (0.1); z = x+iy ∈ ℌ, q = e^{2πiz}, e(x) = e^{2πix}, e_n(a) = e^{2πia/n}. From §2 on: D odd, so (D, 2N) = 1, D squarefree, D ≡ 1 mod 4; for a decomposition D = D₁·D₂ into fundamental discriminants (D_i = 1 allowed), δ_i = |D_i|, ε_i = ε_{D_i} (mod δ_i), 𝔡_i the integral ideal of norm δ_i (product of ramified primes, 𝔡_i² = (D_i)), 𝒟₁ the class of 𝔡₁, χ_{D₁·D₂} the genus character of §0 (χ(𝔞) = ε_{D₁}(N𝔞) = ε_{D₂}(N𝔞)), κ(D₁) = 1 or i as D₁ > 0 or D₁ < 0. Write E^{(D₁)}_s(z) = Σ_{n∈ℤ} e^{(D₁)}_s(n, y) e(nx). Then e^{(D₁)}_s(0, y) = L(2s+2k−1, ε) y^s if D₁ = 1, D₂ = D; = V_s(0) L(2s+2k−2, ε) y^{−s−2k+2} if D₁ = D, D₂ = 1; = 0 otherwise. For n ≠ 0, e^{(D₁)}_s(n, y) = ε₁(δ₂)κ(D₂)/δ₂^{2s+2k−3/2} · (Σ_{m|n, m>0} ε₁(m)ε₂(n/m) m^{−(2s+2k−2)}) · y^{−s−2k+2} V_s(ny). Here L(s, ε) = Σ_{n≥1} ε(n)n^{−s}. Valid for Re(s) large, and it gives the meromorphic continuation in s.

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Apply the justified Poisson expansion for each residue class of the character-pair Eisenstein series.
2. Sum the finite character Gauss factors and divisors, separating the zero Fourier mode and n≠0.
3. Insert V_s with the printed absolute-value scaling, phase and L denominator. Use the initial-domain normal convergence before continuing the identity in s.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/gz-207](#automorphicspectraltheory-as-0-gz-207), [AutomorphicSpectralTheory:AS.1/gz-192](#automorphicspectraltheory-as-1-gz-192), [AutomorphicSpectralTheory:AS.1/gz-208](#automorphicspectraltheory-as-1-gz-208).

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter IV, §3, proof of (3.2), pp. 278–279; inspected printed p.279. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-1-gz-241"></a>

### Growth of the SL₂(ℤ) Eisenstein series: E(z,s) = y^s + O(y^{1−s}) (quoted input)

**Theorem** · `AutomorphicSpectralTheory:AS.1/gz-241`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_241` in `TauCeti/Automorphic/Spectral/AS1`.

For real s > 1 let E(z,s) = Σ_{γ∈Γ_∞\SL₂(ℤ)} Im(γz)^s = Σ_{(c,d)=1, mod ±} y^s/|cz+d|^{2s}. Then E(z,s) = y^s + O(y^{1−s}) as y → ∞ (uniformly in x).

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Use the already proved Fourier expansion and K/Whittaker exponential decay at the cusp.
2. Bound the constant term by its explicit powers of y and the nonzero coefficient sum by a parameter-uniform decaying majorant.
3. Apply the estimate on the stated vertical line/domain; near a pole first separate the polar term, rather than inferring a global uniform bound from pointwise continuation.

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/dit-59](#automorphicspectraltheory-as-2-dit-59).

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter IV §5 proof of (5.1), p.289; estimate follows from II(2.17), inspected p.240. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-1-gz-265"></a>

### Fourier expansion of the weight-0 Eisenstein series and of E_{2,s} (quoted 'well-known')

**Theorem** · `AutomorphicSpectralTheory:AS.1/gz-265`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_265` in `TauCeti/Automorphic/Spectral/AS1`.

For E(z,s) = Σ_{Γ∞\SL₂(ℤ)} Im(γz)^s (weight 0): E(z,s) = y^s + π^{1/2}Γ(s−½)ζ(2s−1)/(Γ(s)ζ(2s)) · y^{1−s} + (2π^s y^{1/2}/(Γ(s)ζ(2s))) Σ_{m≠0} |m|^{1/2−s} σ_{2s−1}(m) K_{s−1/2}(2π|m|y) e^{2πimx}, σ_ν(m) = Σ_{d|m} d^ν, K_ν = K-Bessel function. The identity (cz+d)^{−2}|cz+d|^{−2s} y^s = (2i/(s+1)) ∂/∂z (y^{s+1}/|cz+d|^{2s+2}) (printed with (cz+d)^{−1}, see issue PAPER-GROSS-ZAGIER-86/E47) gives E_{2,s}(z) = (2i/(s+1)) ∂/∂z E(z, s+1), hence E_{2,s}(z) = y^s − π^{1/2} s Γ(s+½)ζ(2s+1)/(Γ(s+2)ζ(2s+2)) · y^{−1−s} + Σ_{m≠0} e_{2,s}(m,y)e^{2πimz} with e_{2,s}(m,y) = (2π^{s+1}|m|^{−s−1/2}/(Γ(s+2)ζ(2s+2))) σ_{2s+1}(m) e^{2πmy} (∂/∂y − 2πm)(√y K_{s+1/2}(2π|m|y)).

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Insert the uncompleted full-level Eisenstein Fourier expansion with its positive and negative modes.
2. Differentiate by the specified raising operator and use the Whittaker/Bessel recurrence to compute the raised modes.
3. Keep the raised constant term and the printed y and 2π factors. Justify differentiated local convergence before continuing the weight-raised identity.

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/dit-59](#automorphicspectraltheory-as-2-dit-59), [AutomorphicSpectralTheory:AS.1/dit-105](#automorphicspectraltheory-as-1-dit-105).

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter IV, §6, proof of (6.2), pp. 298-299; inspected printed p.299. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-2"></a>

## AS.2 — Declarations

Coverage: **planned**. Every stated stage target has a node, an imported owner target or a precise gap. Planned means target inventory coverage, not proof closure or implementation. The continuation and Fourier interfaces distinguish restricted test models from the general source adapters.

Atlas landmarks: Harish-Chandra μ-function, Local normalization theorem, Eisenstein continuation, Eisenstein residues, Shahidi normalization, Intertwiner holomorphy theorem.

<a id="automorphicspectraltheory-as-2-local-intertwiner"></a>

### Local standard intertwining operators

**Construction** · `AutomorphicSpectralTheory:AS.2/local-intertwiner`.

Proposed interface: `TauCeti.AutomorphicSpectral.local_intertwiner` in `TauCeti/Automorphic/Spectral/AS2`.

For a characteristic-zero local field k, a Levi M of a connected reductive G and irreducible admissible π of M(k), J_Q|P(π_λ):H_P(π)→H_Q(π) is the quotient unipotent integral with half-modulus twists, initially where Re λ is sufficiently positive relative to π. Its K-finite matrix coefficients continue meromorphically; they are rational in q^(−λ(α∨)) for nonarchimedean k. The fixed compact picture and normalized induction are imported; this node owns the analytic integral and its continuation.

**Hypotheses and conventions.**

- P,Q have common Levi M; π is admissible; sufficiently positive means relative to the exponents of π, not a uniform chamber for all π.

**Construction or proof.**

1. Use the convergence estimates for matrix coefficients and the unipotent integral.
2. Reduce to rank one and use local meromorphic continuation; parabolic induction transitivity handles higher rank.

**Prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `AutomorphicFormsOnReductiveGroups:AF.1`, [AutomorphicSpectralTheory:AS.0/operator-meromorphic](#automorphicspectraltheory-as-0-operator-meromorphic).

**Uses that determine the interface.**

- **AS.2 μ-function**: The composition of opposite raw integrals defines the Plancherel scalar.
- **AS.6 weighted-character**: The normalized logarithmic derivatives start from these local integrals.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.local_intertwiner.intertwines` | relation | J_Q\|P(π_λ) intertwines I_P(π_λ) and I_Q(π_λ). |
| `TauCeti.AutomorphicSpectral.local_intertwiner.identity` | simp | J_P\|P(π_λ)=id. |
| `TauCeti.AutomorphicSpectral.local_intertwiner.meromorphic_coefficients` | structure | Each fixed K-finite matrix coefficient is meromorphic in λ, rational in the exponential coordinates over nonarchimedean k. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.local_intertwiner.identity_test` (degenerate): When P=Q the integral is the identity.
- `TauCeti.AutomorphicSpectral.local_intertwiner.p_adic_gl2_spherical` (computation): For GL₂(k), unramified χ₁⊗χ₂ and hyperspecial normalization, the nontrivial Weyl integral on the spherical vector equals (1−q⁻¹z)/(1−z), z=χ₁(ϖ)/χ₂(ϖ), in |z|<1.
- `TauCeti.AutomorphicSpectral.local_intertwiner.raw_not_unitary` (non-example): The continued spherical eigenline, identified with the valuation-shell integral in its chamber, sends one to a vector of norm 3/4 at q=2,z=−1; it does not preserve norm on the unitary axis.

**Acceptance and prototype scope.**

- For P=Q the point integral is the identity; opposite operators need a μ scalar, not an assumed inverse.
- Suggested model: The shell integral is an actual use of the integral constructor. Its continued spherical eigenline agrees with that integral in the convergence disk. Identifying it with the GL₂ unipotent quotient and continuing the full operator family requires the local induction supplier.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §21 pp.134–135 preceding Theorem 21.4. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-mu-function"></a>

### Harish-Chandra μ-function

**Definition** · `AutomorphicSpectralTheory:AS.2/mu-function` · planet: **Harish-Chandra μ-function**.

Proposed interface: `TauCeti.AutomorphicSpectral.mu_function` in `TauCeti/Automorphic/Spectral/AS2`.

For irreducible admissible π and opposite P,P̄ with Levi M, the composition J_P|P̄(π_λ)J_P̄|P(π_λ) is the scalar μ_M(π_λ)⁻¹ times the identity as a meromorphic family. This defines the measure-dependent μ-function with the specified Haar measures. It is not the global scattering matrix, and a change of the two unipotent measures rescales μ inversely by their product. Rank-one root factors control the higher-rank Plancherel density.

**Hypotheses and conventions.**

- Characteristic-zero local field; irreducible admissible inducing representation; generic irreducibility and analytic continuation identify the scalar meromorphically.

**Construction or proof.**

1. Use Schur’s lemma at generic parameters and continuation to identify a scalar.
2. Compare rank-one factorizations with the local Plancherel formula; retain the Haar scalar.

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/local-intertwiner](#automorphicspectraltheory-as-2-local-intertwiner).

**Uses that determine the interface.**

- **Arthur 1989 Theorem 2.1**: Rank-one r_P|P̄ r_P̄|P=μ⁻¹ yields transitive normalized operators.
- **AS.6 spectral densities**: Controls the local factors of weighted characters.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.mu_function.opposite_composition` | characterisation | J_P\|P̄ J_P̄\|P=μ_M⁻¹ id as meromorphic families. |
| `TauCeti.AutomorphicSpectral.mu_function.measure_change` | functoriality | Multiplying the two unipotent measures by c,d multiplies μ⁻¹ by cd. |
| `TauCeti.AutomorphicSpectral.mu_function.rank_one_product` | compatibility | The reduced-root rank-one composition scalars give the higher-rank μ-product with the fixed measures. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.mu_function.no_roots` (degenerate): For M=G the point integral gives μ=1.
- `TauCeti.AutomorphicSpectral.mu_function.gl2_spherical` (computation): For unramified GL₂, μ⁻¹=c(z)c(z⁻¹), c(z)=(1−q⁻¹z)/(1−z), interpreted meromorphically.
- `TauCeti.AutomorphicSpectral.mu_function.measure_scaling` (non-example): Rescaling both opposite measures by 2 changes μ⁻¹ by 4; μ is not measure independent.

**Acceptance and prototype scope.**

- Do not equate raw opposite intertwiners with the identity.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §21 p.135 before Theorem 21.4. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-local-normalization"></a>

### Existence of local normalizing factors

**Theorem** · `AutomorphicSpectralTheory:AS.2/local-normalization` · planet: **Local normalization theorem**.

Proposed interface: `TauCeti.AutomorphicSpectral.local_normalization` in `TauCeti/Automorphic/Spectral/AS2`.

There exist scalar meromorphic r_Q|P(π_λ), products of reduced-root rank-one factors, such that R_Q|P=r_Q|P⁻¹J_Q|P is transitive: R_R|P=R_R|Q R_Q|P. It is equivariant under Weyl transport and compatible with induction in stages. For unitary π, R_Q|P is analytic and unitary on i𝔞_M* and R_Q|P(λ)*=R_P|Q(−overline λ). K-finite coefficients are rational in λ(α∨) over real fields and in q^(−λ(α∨)) over nonarchimedean fields. For tempered π, r_Q|P has no zeros or poles in the open P-positive chamber. For unramified π and hyperspecial K with the normalized spherical vector, R_Q|P maps that vector to its counterpart in H_Q. The factors are choices satisfying these properties, not a canonical global L-function for every reductive group.

**Hypotheses and conventions.**

- Characteristic-zero local fields; connected reductive G; irreducible admissible π; unitary, tempered and spherical clauses carry their own additional hypotheses.

**Construction or proof.**

1. Reduce to rank one and square-integrable inducing data using induction in stages and Langlands classification.
2. Construct rank-one factors satisfying r_P|P̄ r_P̄|P=μ⁻¹: real gamma factors in §3, nonarchimedean rational factors in §4 of Arthur 1989.
3. Multiply over reduced roots; verify transitivity, adjoint symmetry and spherical normalization.

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/mu-function](#automorphicspectraltheory-as-2-mu-function), [AutomorphicSpectralTheory:AS.2/local-intertwiner](#automorphicspectraltheory-as-2-local-intertwiner), `SmoothRepresentationsOfLocalGroups:SR.4`.

**Acceptance and prototype scope.**

- All seven normalization conditions are retained; only unitarity is restricted to unitary π.

**Sources.**

- [James Arthur, Intertwining Operators and Residues I: Weighted Characters](https://www.claymath.org/library/cw/arthur/pdf/28.pdf), §2 Theorem 2.1; §§3–4. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-eisenstein-continuation"></a>

### Langlands meromorphic continuation and functional equations

**Theorem** · `AutomorphicSpectralTheory:AS.2/eisenstein-continuation` · planet: **Eisenstein continuation**.

Proposed interface: `TauCeti.AutomorphicSpectral.eisenstein_continuation` in `TauCeti/Automorphic/Spectral/AS2`.

For φ∈H_P⁰, E_P(g,φ,λ) and M(w,λ)φ extend meromorphically to all 𝔞_P,ℂ*. On each finite inducing/K-type block there is a common local product of affine linear forms clearing the polar divisor. They obey E_Q(g,M(w,λ)φ,wλ)=E_P(g,φ,λ) and M(vw,λ)=M(v,wλ)M(w,λ). On i𝔞_P* both families are regular and M(w,λ) extends to a unitary H_P→H_Q. Regularity here is for actual unitary discrete inducing data and the global family; a scalar normalizing factor or arbitrary nonunitary local family can still have a pole.

**Hypotheses and conventions.**

- Number field; discrete inducing H_P⁰; hyperplane denominators are local and on fixed finite blocks; the whole smooth Fréchet family requires the explicit seminorm extension.

**Construction or proof.**

1. Use the positive pseudo-Eisenstein pairing to construct the self-adjoint resolvent on a χ-block as in Langlands 1966 §4.
2. Obtain rank-one scattering continuation from the resolvent and factor higher-rank operators; shift contours with the residue calculus.
3. Induct on Levi rank for discrete noncuspidal data and extend identities from the chamber by uniqueness.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/cuspidal-data-orthosum](#automorphicspectraltheory-as-1-cuspidal-data-orthosum), [AutomorphicSpectralTheory:AS.1/pseudo-eisenstein-inner-product](#automorphicspectraltheory-as-1-pseudo-eisenstein-inner-product), [AutomorphicSpectralTheory:AS.1/convergent-intertwiner](#automorphicspectraltheory-as-1-convergent-intertwiner), [AutomorphicSpectralTheory:AS.0/unbounded-selfadjoint-spectral](#automorphicspectraltheory-as-0-unbounded-selfadjoint-spectral), [AutomorphicSpectralTheory:AS.0/operator-meromorphic](#automorphicspectraltheory-as-0-operator-meromorphic), [AutomorphicSpectralTheory:AS.0/analytic-fredholm](#automorphicspectraltheory-as-0-analytic-fredholm).

**Acceptance and prototype scope.**

- An imaginary-axis zero does not create a pole; rank-one SL₂ scattering satisfies c(s)c(1−s)=1.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §7 Theorem 7.2(a), equations (7.3)–(7.4). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-intertwiner-factorization"></a>

### Local–global factorization and adjoints

**Theorem** · `AutomorphicSpectralTheory:AS.2/intertwiner-factorization`.

Proposed interface: `TauCeti.AutomorphicSpectral.intertwiner_factorization` in `TauCeti/Automorphic/Spectral/AS2`.

For a factorizable discrete π=⊗′π_v and vector, the global M_Q|P restricted to its π-isotypic inducing space is m_disc(π) copies of ⊗′J_Q|P(π_v,λ), first in the common convergence chamber and then meromorphically. With compatible chosen local factors, R_Q|P(global)=⊗′R_Q|P(local) is a finite product on a spherical-outside-S vector. M_Q|P=r_Q|P R_Q|P, where r_Q|P is the analytically continued Euler product; no absolute Euler-product convergence is asserted on the unitary axis. Globally M(w,λ)*=M(w⁻¹,−overline(wλ)) and the cocycle implies the inverse on the regular unitary axis.

**Hypotheses and conventions.**

- Restricted tensor factorization of automorphic π is an imported theorem; outside S data and normalizations are hyperspecial spherical.

**Construction or proof.**

1. Unfold the global unipotent integral as a product in the chamber.
2. Use spherical normalization to construct the restricted tensor product of R.
3. Continue the identities, then use the pseudo-Eisenstein Gram formula and the cocycle to obtain the global adjoint and inverse.

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/local-normalization](#automorphicspectraltheory-as-2-local-normalization), [AutomorphicSpectralTheory:AS.2/eisenstein-continuation](#automorphicspectraltheory-as-2-eisenstein-continuation), [AutomorphicSpectralTheory:AS.1/induced-family](#automorphicspectraltheory-as-1-induced-family), `AutomorphicFormsOnReductiveGroups:AF.2/flath-factorization`.

**Acceptance and prototype scope.**

- At a point where scalar factors have zero/pole, only the complete meromorphic product identity is used.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §21 equations (21.13)–(21.14). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-residue-calculus"></a>

### Polar hyperplanes and ordered Eisenstein residues

**Construction** · `AutomorphicSpectralTheory:AS.2/residue-calculus` · planet: **Eisenstein residues**.

Proposed interface: `TauCeti.AutomorphicSpectral.residue_calculus` in `TauCeti/Automorphic/Spectral/AS2`.

On a fixed finite inducing/K-type block, regularize E and M near a parameter λ₀ by a finite affine-root hyperplane product. For an ordered list of independent hyperplanes choose transverse coordinates z₁,…,z_r and define the ordered residue by successive z_j⁻¹ Laurent coefficients. It is a continuous linear map of inducing vectors, with the order and coordinates included as data. Residues that meet Langlands’s square-integrability exponent criterion give residual automorphic forms; a pole of M alone does not certify a nonzero L² residue of E.

**Hypotheses and conventions.**

- Common denominator; an ordered independent hyperplane flag; the L² assertion additionally requires every surviving exponent to lie in the appropriate negative cone modulo center.

**Construction or proof.**

1. Use vector Cauchy coefficients from AS.0 with common denominators.
2. Take residues of the constant-term formula to compute all surviving exponents.
3. Apply the imported L² exponent criterion; retain possible cancellations and zero residues.

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/eisenstein-continuation](#automorphicspectraltheory-as-2-eisenstein-continuation), [AutomorphicSpectralTheory:AS.1/cuspidal-constant-term](#automorphicspectraltheory-as-1-cuspidal-constant-term), [AutomorphicSpectralTheory:AS.0/operator-meromorphic](#automorphicspectraltheory-as-0-operator-meromorphic), `AutomorphicFormsOnReductiveGroups:AF.3`.

**Uses that determine the interface.**

- **AS.4 residual-spectrum**: Residual L² summands arise from the nonzero square-integrable ordered residues.
- **Yu 2023 §2.3**: GL_n residual Speh data are normalized Eisenstein residues.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.residue_calculus.coefficient` | projection | An ordered residue is the stated sequence of Laurent coefficient maps. Each one-variable Cauchy integral uses a positive radius enclosing no other pole, with a common meromorphic denominator and holomorphy on the punctured closed ball. |
| `TauCeti.AutomorphicSpectral.residue_calculus.constant_term` | compatibility | Constant term commutes with a justified common-denominator residue and reveals its exponents. |
| `TauCeti.AutomorphicSpectral.residue_calculus.change_coordinate` | functoriality | Changing transverse coordinates transforms residue differential forms by the determinant; a scalar residue requires the chosen coordinates. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.residue_calculus.two_simple_poles` (computation): The ordered residue of v/(z₁z₂) is v in either coordinate order.
- `TauCeti.AutomorphicSpectral.residue_calculus.holomorphic_zero` (degenerate): A holomorphic family has zero residue.
- `TauCeti.AutomorphicSpectral.residue_calculus.pole_not_residue` (non-example): The scalar family 1/z² has a pole at zero and residue zero.

**Acceptance and prototype scope.**

- Residue order is not silently interchanged at a hyperplane intersection.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §12 p.66 discussion of contour shifts. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-shahidi-normalization"></a>

### Classical-group Shahidi normalization

**Definition** · `AutomorphicSpectralTheory:AS.2/shahidi-normalization` · planet: **Shahidi normalization**.

Proposed interface: `TauCeti.AutomorphicSpectral.shahidi_normalization` in `TauCeti/Automorphic/Spectral/AS2`.

For H_{a+m} with Levi G_{E/F}(a)×H_m, τ unitary generic self-dual and σ in a relevant generic local L-packet, define β_v(s)=L_v(1+s,τ×σ)L_v(1+2s,τ,ρ)ε_v(s,τ×σ,ψ)ε_v(2s,τ,ρ,ψ)/(L_v(s,τ×σ)L_v(2s,τ,ρ)) and N_v(s)=β_v(s)M_v(s). Here ρ=∧² for even orthogonal, Sym² for odd orthogonal, and Asai⊗ξ^m for unitary groups. The dual target is τ*=ι(τ)∨ with |det|^(−s). Local L/ε factors and the additive character are supplied by the parameter theory; the factors are multiplied in precisely this orientation.

**Hypotheses and conventions.**

- Characteristic-zero local field; relevant classical-group packet with generic parameter; specified ψ and compatible measures; self-dual is conjugate-self-dual in the unitary case.

**Construction or proof.**

1. Import local factors and packet identities.
2. Apply the explicit ratio (5.4), not an unspecified normalization choice.

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/local-intertwiner](#automorphicspectraltheory-as-2-local-intertwiner), `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Uses that determine the interface.**

- **Jiang–Zhang Theorem B.2**: This exact normalization has holomorphy and nonvanishing on Re s≥1/2.
- **AS.2 classical-pole-order**: Separates possible poles of the scalar L-ratio from a regular normalized operator.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.shahidi_normalization.normalized_eq` | simp | N_v=β_v M_v with β_v equal to the displayed L/ε ratio. |
| `TauCeti.AutomorphicSpectral.shahidi_normalization.target` | projection | N_v maps I(τ\|det\|^s⊗σ) to I(τ*\|det\|^(−s)⊗σ). |
| `TauCeti.AutomorphicSpectral.shahidi_normalization.global_product` | compatibility | On factorizable data the global scalar ratio uses L(s,τ×σ)L(2s,τ,ρ) divided by the shifted L-factors and ε-factors, as in (5.2)–(5.4). |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.shahidi_normalization.spherical` (compatibility): If the spherical vector has the supplied raw eigenvalue and the actual local-factor normalizer times that eigenvalue is one, the shahidi_normalization operator fixes it. This is not asserted for an arbitrary raw operator.
- `TauCeti.AutomorphicSpectral.shahidi_normalization.orthogonal_parity` (characterisation): For the two-dimensional Satake parameter (2,3), exterior-square weight 6 and symmetric-square weights 4,6,9 give different actual normalized operators at a regular parameter.
- `TauCeti.AutomorphicSpectral.shahidi_normalization.unitary_dual` (characterisation): For a one-dimensional representation, the cross-factor argument used in the actual normalizer is its inverse conjugate character; the test exposes that argument in the normalization formula.

**Acceptance and prototype scope.**

- The ε-factors multiply the numerator; reversing β changes the theorem.
- Suggested model: Tests evaluate explicit unramified factor functions and a supplied one-dimensional dual character. Actual admissible packets, epsilon-factor conventions and generic/tempered conditions remain imported AL/AF/ET data. A spherical eigenvalue and its normalization identity are required, rather than a universal assertion for arbitrary M.

**Sources.**

- [Dihua Jiang and Lei Zhang, Arthur Parameters and Cuspidal Automorphic Modules of Classical Groups](https://arxiv.org/pdf/1508.03205v4), §5.1 equations (5.3)–(5.4). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-generic-standard-module"></a>

### Irreducibility of generic packet standard modules

**Theorem** · `AutomorphicSpectralTheory:AS.2/generic-standard-module`.

Proposed interface: `TauCeti.AutomorphicSpectral.generic_standard_module` in `TauCeti/Automorphic/Spectral/AS2`.

For the relevant generic local parameter φ⁺ of a generic global Arthur parameter, each σ in Π_φ⁺(H_m) is the irreducible standard module induced from tempered unitary τ(φ_i)|det|^β_i and σ₀, with 1/2>β₁>⋯>β_t>0. The unitary generic self-dual τ has a symmetric standard-module realization with tempered unitary pieces and exponents 1/2>α₁>⋯>α_d>0. These bounds and irreducibility are retained for every pure inner form occurring in the theorem.

**Hypotheses and conventions.**

- φ⁺ is a local component of an H_m-relevant generic global Arthur parameter, not an arbitrary generic nonunitary parameter.

**Construction or proof.**

1. Use Proposition B.1 for standard-module irreducibility.
2. Apply the archimedean/nonarchimedean generic unitary dual classification to bound the exponents.

**Prerequisites.** `SmoothRepresentationsOfLocalGroups:SR.3`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Acceptance and prototype scope.**

- The strict 1/2 bounds make the Re s=1/2 boundary accessible.

**Sources.**

- [Dihua Jiang and Lei Zhang, Arthur Parameters and Cuspidal Automorphic Modules of Classical Groups](https://arxiv.org/pdf/1508.03205v4), Appendix B Proposition B.1 and (B.5)–(B.6). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-tempered-gl-intertwiner"></a>

### Tempered GL intertwiner half-plane

**Theorem** · `AutomorphicSpectralTheory:AS.2/tempered-gl-intertwiner`.

Proposed interface: `TauCeti.AutomorphicSpectral.tempered_gl_intertwiner` in `TauCeti/Automorphic/Spectral/AS2`.

For unitary tempered τ,τ′ on general linear groups, the Mœglin–Waldspurger normalized rank-one GL×GL intertwiner is holomorphic and nonzero on Re s>−1. This is a statement about the source’s rank-one parameter convention, transported unchanged to (B.7)–(B.8); it is not a claim that every normalization of a reducible induced GL representation is invertible everywhere in that half-plane.

**Hypotheses and conventions.**

- Tempered unitary GL data and the MW normalization; the conclusion is nonzero, not necessarily invertible at a reducibility point.

**Construction or proof.**

1. Import the GL rank-one reducibility and normalized local-factor results.
2. Apply the MW holomorphy bound and transport it through the standard-module realization.

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/local-normalization](#automorphicspectraltheory-as-2-local-normalization), `SmoothRepresentationsOfLocalGroups:SR.3`.

**Acceptance and prototype scope.**

- For shifts s±α±β the strict exponent bounds retain this region when Re s≥0.

**Sources.**

- [Dihua Jiang and Lei Zhang, Arthur Parameters and Cuspidal Automorphic Modules of Classical Groups](https://arxiv.org/pdf/1508.03205v4), Appendix B after (B.7)–(B.9), citing [66]. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-tempered-standard-intertwiner"></a>

### Tempered classical standard integral half-plane

**Theorem** · `AutomorphicSpectralTheory:AS.2/tempered-standard-intertwiner`.

Proposed interface: `TauCeti.AutomorphicSpectral.tempered_standard_intertwiner` in `TauCeti/Automorphic/Spectral/AS2`.

For unitary tempered GL data τ and a tempered classical packet member σ₀, the raw rank-one standard operator M(w,τ⊗σ₀,s) is holomorphic and nonzero for Re s>0. The normalizing L-factors equal those of the generic tempered member σ₀° and are holomorphic and nonzero there, so the source’s normalized operator has the same property. This is the positive-open-half-plane input, before shifting by |α|<1/2.

**Hypotheses and conventions.**

- σ₀ is in the tempered packet of the generic parameter used in Appendix B; characteristic-zero local field.

**Construction or proof.**

1. Use Waldspurger IV.2.1 over nonarchimedean fields and Borel–Wallach Lemma 4.4 over archimedean fields for the raw integral.
2. Compare tempered packet L-factors with the generic member and use their nonvanishing.

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/shahidi-normalization](#automorphicspectraltheory-as-2-shahidi-normalization), `AutomorphicFormsOnReductiveGroups:AF.1`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Acceptance and prototype scope.**

- The theorem does not supply a value at Re s=0.

**Sources.**

- [Dihua Jiang and Lei Zhang, Arthur Parameters and Cuspidal Automorphic Modules of Classical Groups](https://arxiv.org/pdf/1508.03205v4), Appendix B p.87. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-generic-normalized-intertwiner"></a>

### Generic classical normalized intertwiner bound

**Theorem** · `AutomorphicSpectralTheory:AS.2/generic-normalized-intertwiner`.

Proposed interface: `TauCeti.AutomorphicSpectral.generic_normalized_intertwiner` in `TauCeti/Automorphic/Spectral/AS2`.

For a generic unitary member of the relevant classical packet and unitary generic GL inducing data, the Shahidi normalized rank-one operator is holomorphic and nonzero for Re s≥1/2, with the source’s parameter and ρ convention. The general packet theorem reduces the nongeneric members to this input plus the tempered shifted factors.

**Hypotheses and conventions.**

- Generic member of a relevant generic unitary packet; normalization is (5.4).

**Construction or proof.**

1. Apply Cogdell–Kim–Piatetski-Shapiro–Shahidi Theorem 11.1, as cited at the beginning of the B.2 proof.
2. Retain the global-parameter/relevance restrictions of that proof.

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/shahidi-normalization](#automorphicspectraltheory-as-2-shahidi-normalization), `EndoscopicTransferAndUnitaryTraceComparison:ET.0`.

**Acceptance and prototype scope.**

- Nonvanishing is distinguished from injectivity and invertibility.

**Sources.**

- [Dihua Jiang and Lei Zhang, Arthur Parameters and Cuspidal Automorphic Modules of Classical Groups](https://arxiv.org/pdf/1508.03205v4), Appendix B proof of Theorem B.2. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-jiang-zhang-holomorphy"></a>

### Jiang–Zhang intertwiner holomorphy

**Theorem** · `AutomorphicSpectralTheory:AS.2/jiang-zhang-holomorphy` · planet: **Intertwiner holomorphy theorem**.

Proposed interface: `TauCeti.AutomorphicSpectral.jiang_zhang_holomorphy` in `TauCeti/Automorphic/Spectral/AS2`.

Let φ⁺ be the local component of an H_m-relevant generic global Arthur parameter. If τ is irreducible admissible unitary generic self-dual on G_{E/F}(a)(k) and σ∈Π_φ⁺(H_m), then N(w₀,τ⊗σ,s) with (5.4) normalization is holomorphic and nonzero for Re s≥1/2. This includes nongeneric members of pure inner forms; it does not include arbitrary local Arthur parameters or nonunitary τ.

**Hypotheses and conventions.**

- All hypotheses are those of Appendix B Theorem B.2; the local factors use the same packet and ψ.

**Construction or proof.**

1. Use irreducible standard-module realizations with 0<α_i,β_j<1/2.
2. Factor into GL×GL terms with s±α_i±β_j and 2s±α_i±α_j, and tempered classical terms s±α_i.
3. Apply the three preceding holomorphy inputs; their strict inequalities cover the closed Re s≥1/2 region.

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/generic-standard-module](#automorphicspectraltheory-as-2-generic-standard-module), [AutomorphicSpectralTheory:AS.2/tempered-gl-intertwiner](#automorphicspectraltheory-as-2-tempered-gl-intertwiner), [AutomorphicSpectralTheory:AS.2/tempered-standard-intertwiner](#automorphicspectraltheory-as-2-tempered-standard-intertwiner), [AutomorphicSpectralTheory:AS.2/generic-normalized-intertwiner](#automorphicspectraltheory-as-2-generic-normalized-intertwiner).

**Acceptance and prototype scope.**

- The conclusion is nonzero as an operator; a nonzero composition requires the standard-module realization, not just composing arbitrary nonzero maps.

**Sources.**

- [Dihua Jiang and Lei Zhang, Arthur Parameters and Cuspidal Automorphic Modules of Classical Groups](https://arxiv.org/pdf/1508.03205v4), Appendix B Theorem B.2 = §5.1 Theorem 5.1. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-isobaric-sum"></a>

### GLₙ isobaric automorphic sums

**Definition** · `AutomorphicSpectralTheory:AS.2/isobaric-sum`.

Proposed interface: `TauCeti.AutomorphicSpectral.isobaric_sum` in `TauCeti/Automorphic/Spectral/AS2`.

For cuspidal automorphic representations π_i of GL_{n_i}(𝔸_F), with specified real/unitary twists and Σn_i=n, the isobaric sum ⊞_iπ_i is the automorphic GL_n representation with those cuspidal Langlands data, equivalently the Langlands quotient of the normalized parabolic induction in its prescribed order. Its unramified Satake multiset is the union of the summands’ multisets and its standard L-function is their product. Existence/uniqueness is a general GL_n theorem; the symbol does not mean a Hilbert direct sum of representations of different groups.

**Hypotheses and conventions.**

- Cuspidal GL_{n_i} data and their twists; compatible Langlands order; strong multiplicity one is required for uniqueness from almost-all Satake parameters.

**Construction or proof.**

1. Construct the normalized induced automorphic Eisenstein family from the block Levi.
2. Use its Langlands constituent and general GL_n uniqueness theorem; compare unramified Satake parameters.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/induced-family](#automorphicspectraltheory-as-1-induced-family), [AutomorphicSpectralTheory:AS.2/eisenstein-continuation](#automorphicspectraltheory-as-2-eisenstein-continuation), `AutomorphicLFunctionsAndLocalFactors:AL.2`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Uses that determine the interface.**

- **BCGP21 notation and Eisenstein arguments**: Gives one typed carrier for the block induction and its factors.
- **AS.5 isobaric-realization**: Realizes the almost-all Hecke eigenvalues of GL_n cohomology classes.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.isobaric_sum.satake_union` | compatibility | At a place where all summands are unramified, the Satake eigenvalues concatenate. |
| `TauCeti.AutomorphicSpectral.isobaric_sum.standard_L_product` | relation | L(s,⊞π_i)=∏_i L(s,π_i) with the summand twists retained. |
| `TauCeti.AutomorphicSpectral.isobaric_sum.permutation` | extensionality | Permuting summands with the corresponding Langlands ordering gives the same isobaric representation. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.isobaric_sum.single` (degenerate): The isobaric sum of a single cusp π is π.
- `TauCeti.AutomorphicSpectral.isobaric_sum.two_characters` (computation): For unramified characters χ₁,χ₂ the GL₂ Satake polynomial is (1−χ₁(ϖ)T)(1−χ₂(ϖ)T).
- `TauCeti.AutomorphicSpectral.isobaric_sum.not_hilbert_sum` (non-example): π₁⊕π₂ is not the isobaric GL_{n₁+n₂} representation: it does not even carry the same group action.

**Acceptance and prototype scope.**

- The isobaric object is a GL_n representation, whereas its cuspidal data live on a product Levi.
- AS.1 supplies the block-induction data and AS.2 supplies the continued Langlands constituent; AS.5 imports this carrier. No dependency of AS.1 on AS.5 is introduced.
- A Langlands quotient with arbitrary real twists need not be generic; no genericity is asserted without an irreducibility/generic-standard-module hypothesis.

**Sources.**

- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian Surfaces over Totally Real Fields Are Potentially Modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Notation preceding automorphic representation results. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-yu-061"></a>

### Intertwiners and operator-valued families

**Construction** · `AutomorphicSpectralTheory:AS.2/yu-061`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_061` in `TauCeti/Automorphic/Spectral/AS2`.

Construct M_(R'|R)(w,lambda) by the convergent unipotent integral and meromorphic continuation on induced sections. It satisfies the composition and unitary-axis identities. Ratios M_R(lambda,P;mu)=M_(R|P)(lambda)^−1 M_(R|P)(lambda/mu) give the operator-valued (G,M)-family on its regular domain.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Start with the convergent spherical unipotent integral and compute each rank-one Gindikin–Karpelevich factor.
2. Form the restricted product, retaining q^((1−g)n_i n_j) from the global unipotent measure; analytically continue only after establishing the normalization transport.

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/yu-049](#automorphicspectraltheory-as-6-yu-049), [AutomorphicSpectralTheory:AS.1/yu-060](#automorphicspectraltheory-as-1-yu-060), [AutomorphicSpectralTheory:AS.1/convergent-intertwiner](#automorphicspectraltheory-as-1-convergent-intertwiner), [AutomorphicSpectralTheory:AS.2/eisenstein-continuation](#automorphicspectraltheory-as-2-eisenstein-continuation).

**Uses that determine the interface.**

- **PAPER-YU-23/063**: Input to Corrected Arthur–Lafforgue spectral expression.
- **PAPER-YU-23/066**: Input to Scalar intertwiners on spherical sections.
- **PAPER-YU-23/151**: Input to Typed finite-fibre operator trace.
- **PAPER-YU-23/153**: Input to Explicit transport between induction normalization conventions.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_061.integralIntertwiner` | constructor | define on the domain of absolute convergence |
| `TauCeti.AutomorphicSpectral.yu_061.continueOperator` | compatibility | prove meromorphic continuation and functional equations |
| `TauCeti.AutomorphicSpectral.yu_061.ratioFamily` | structure | form the regular operator family on the unitary domain |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_061.test1` (degenerate): The actual regular-point family constructor on a same-parabolic input is the identity, using its typed identity data.
- `TauCeti.AutomorphicSpectral.yu_061.test2` (compatibility): The ratio family built from the inverse regular intertwiner and yu_061 at λ/μ gives the identity at μ=1.
- `TauCeti.AutomorphicSpectral.yu_061.test3` (compatibility): Composition of two members of the typed regular family agrees with its composed member. The source integral, continuation and Weyl transport must supply the identity/cocycle data.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.
- Suggested model: The suggested carrier is a regular invertible slice with explicit identity and cocycle data. The source integral and analytic continuation must construct those data on the inducing spaces; this bundle is not their proof and does not omit the Weyl-transport requirement.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §5.2.2–5.2.3 pp32–35. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-yu-066"></a>

### Scalar intertwiners on spherical sections

**Theorem** · `AutomorphicSpectralTheory:AS.2/yu-066`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_066` in `TauCeti/Automorphic/Spectral/AS2`.

Let (P,π) be a good everywhere-unramified discrete pair, M=M_P, fix nonzero spherical φ_Π for each discrete Π and φ_π their tensor product, and for R in P(M) let φ_R(nmk)=ρ_R(m)φ_π(m) with ρ_R=δ_R^{1/2}. For S,R in P(M): M_{R|S}(λ)φ_S=n_{R|S}(π,λ)φ_R with n_{R|S}(π,λ)=∏_{β in Φ(Z_M,G), β in Φ_S ∩ Φ_{R̄}} n_β(π,λ^{−β^∨}) (equivalently ∏_{α in Φ_R ∩ Φ_S̄} n_{−α}(π,λ^{α^∨})), n_β as in (5.1.1); for L ⊇ M and Q,Q' in P(L) group the factors over β restricting to α in Φ(Z_L,G). In particular M(w,λ)φ_P=n_π(w,λ)φ_P for (w,1) in stab(P,π). The factor q^{(1−g)n_in_j} comes from vol(N(F)\N(A))=1 versus local vol(N(O_v))=1 (vol(F\A)=q^{g−1} for the product measure). Prove the local Gindikin–Karpelevich factors, the restricted Euler product and the global Haar factor separately.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Compute each local intertwiner on the normalized spherical vector.
2. Multiply the unramified factors and include the global unipotent Haar volume q^((1−g)ni nj).
3. Adjacent-parabolic composition gives the full product; source images fix the normalization in E8/E12.
4. The global additive-volume factor is unchanged by the present continuation.
5. The rho ambiguity now has the explicit153 transport contract; no scalar formula is asserted independent of a change of normalization without that proof..

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/yu-060](#automorphicspectraltheory-as-1-yu-060), [AutomorphicSpectralTheory:AS.2/yu-061](#automorphicspectraltheory-as-2-yu-061), `AutomorphicLFunctionsAndLocalFactors:AL.3`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), Proposition5.3.4 p39, E12. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-dit-59"></a>

### Eisenstein Fourier expansion

**Theorem** · `AutomorphicSpectralTheory:AS.2/dit-59`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_59` in `TauCeti/Automorphic/Spectral/AS2`.

E*(z,s)=Λ(2s)y^s+Λ(2−2s)y^(1−s)+2√y Σ_{n≠0}|n|^(s−1/2)σ_{1−2s}(|n|)K_{s−1/2}(2π|n|y)e(nx). Prove local convergence and parameter continuation of the expansion.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Unfold each Fourier coefficient of the primitive Eisenstein sum, separate n=0 and n≠0, and evaluate the nonzero archimedean integral by the K-Bessel adapter.
2. Compute the divisor sum and retain the 2, √y and completed-zeta denominators.
3. Use the exponentially decaying K branch to prove local convergence in z and compare the formula with the meromorphic completed family.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/dit-58](#automorphicspectraltheory-as-1-dit-58), [AutomorphicSpectralTheory:AS.2/eisenstein-continuation](#automorphicspectraltheory-as-2-eisenstein-continuation).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5, (5.3), p962. The definition preceding (5.3) and the displayed expansion on printed p.962 fix the completed normalization and its two constant terms.

<a id="automorphicspectraltheory-as-2-dit-60"></a>

### Eisenstein continuation and residues

**Theorem** · `AutomorphicSpectralTheory:AS.2/dit-60`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_60` in `TauCeti/Automorphic/Spectral/AS2`.

E*(z,s) extends meromorphically with only simple poles at s=0,1, residues −1/2,+1/2, and E*(z,s)=E*(z,1−s). Do not infer this function-valued statement from scalar ζ continuation alone.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Continue the completed Eisenstein family and divide by its completed scalar factor on the domain where this quotient is defined.
2. Identify the scattering coefficient and use the functional equation to locate poles and compare the two parameter halves.
3. Interpret singular scalar parameters meromorphically; neither individual divergent Fourier integrals nor a zero denominator defines an ordinary value.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/dit-58](#automorphicspectraltheory-as-1-dit-58), [AutomorphicSpectralTheory:AS.2/eisenstein-continuation](#automorphicspectraltheory-as-2-eisenstein-continuation).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5, text before (5.4), (5.4) and (5.5), p962. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-dit-91"></a>

### Weight-zero resolvent kernel

**Construction** · `AutomorphicSpectralTheory:AS.2/dit-91`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_91` in `TauCeti/Automorphic/Spectral/AS2`.

Construct the kernel G(z,z′;s) of (Δ−s(1−s))⁻¹ on the modular L² space, initially off the spectrum, with its boundary/cusp realization and meromorphic continuation to the spectral parameters used. A generic compact-operator spectral theorem is insufficient on this noncompact quotient.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Realize the nonnegative modular Laplacian on its specified self-adjoint cusp domain and define the off-spectrum inverse (Δ−s(1−s))⁻¹.
2. Identify its distribution/kernel normalization, diagonal logarithmic singularity and zero-frequency cusp term.
3. Use the quoted noncompact resolvent theorem for meromorphic continuation on the asserted region; AS.0’s bounded off-spectrum calculus alone does not cross the continuous spectrum.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/unbounded-selfadjoint-spectral](#automorphicspectraltheory-as-0-unbounded-selfadjoint-spectral), [AutomorphicSpectralTheory:AS.0/operator-meromorphic](#automorphicspectraltheory-as-0-operator-meromorphic), [AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion](#automorphicspectraltheory-as-4-gl2-spectral-expansion).

**Uses that determine the interface.**

- **PAPER-DUKE-IMAMOGLU-TOTH-16/92**: Identify the finite-rank polar projector.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.dit_91.inverseEquation` | characterisation | (Δ−s(1−s))R_s=1 on the proper operator domain off the spectrum. |
| `TauCeti.AutomorphicSpectral.dit_91.kernelSymmetry` | relation | The actual self-adjoint resolvent kernel obeys R_s(z,z′)=conj(R_conj(s)(z′,z)), with conjugation of the parameter as well as exchange of the spatial variables. |
| `TauCeti.AutomorphicSpectral.dit_91.restrictedResolvent` | constructor | Remove an isolated finite-dimensional eigenspace and prove the complement resolvent holomorphic near its eigenvalue. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.dit_91.test1` (computation): On the constant eigenline, the actual resolvent of the scalar Laplacian has value −1/[s(1−s)] away from its poles.
- `TauCeti.AutomorphicSpectral.dit_91.test2` (compatibility): At the parameter 1/2+it for the scalar Laplacian eigenvalue 1/4+t², its defining inverse equation has no solution for every right-hand side; a bounded inverse cannot be used there.
- `TauCeti.AutomorphicSpectral.dit_91.test3` (non-example): The actual scalar resolvent on the eigenline of eigenvalue 1/4 is (s−1/2)^(−2), so the parameter pole is double at the threshold.

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.
- Suggested model: The three suggested tests are scalar eigenline specializations of the actual resolvent, including failure of its inverse equation at the spectrum and the threshold double pole. They do not construct the unbounded modular self-adjoint domain or continuous-spectrum continuation.
- The hermitian-kernel API remains a named commented omission in the suggested file until the actual modular resolvent kernel is supplied; no theorem asserts it for an arbitrary kernel function.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (8.2)–(8.4), Fay[20]. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-dit-92"></a>

### Finite-rank resolvent polar part

**Theorem** · `AutomorphicSpectralTheory:AS.2/dit-92`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_92` in `TauCeti/Automorphic/Spectral/AS2`.

Let s₀=1/2+ir with r>0, and let {u} be an orthonormal basis of the Δ-eigenspace with eigenvalue 1/4+r². With the convention (8.2), (Δ−s(1−s))∫_F G(z,z′;s)u(z)dμ(z)=u(z′), the polar part of G at s₀ is (1/4+r²−s(1−s))⁻¹ Σ_u conj(u(z)) u(z′), as in (8.4). Since 1/4+r²−s(1−s)=(s−s₀)(2s₀−1)+O((s−s₀)²), Res_{s₀}(2s−1)G(z,z′;s)=Σ_u conj(u(z))u(z′).

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Split the resolvent near a spectral point into its finite-rank orthogonal eigenspace projector divided by λ_j−s(1−s) and a regular remainder.
2. Use an orthonormal basis and the inner-product convention to write that projector kernel with complex conjugation.
3. Convert an eigenvalue residue to the s-parameter by the derivative2s−1. At the threshold r=0 the quadratic denominator must be retained.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/unbounded-selfadjoint-spectral](#automorphicspectraltheory-as-0-unbounded-selfadjoint-spectral), [AutomorphicSpectralTheory:AS.0/operator-meromorphic](#automorphicspectraltheory-as-0-operator-meromorphic), [AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion](#automorphicspectraltheory-as-4-gl2-spectral-expansion), [AutomorphicSpectralTheory:AS.2/dit-91](#automorphicspectraltheory-as-2-dit-91).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (8.4). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-dit-93"></a>

### Poincaré residue theorem

**Theorem** · `AutomorphicSpectralTheory:AS.2/dit-93`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_93` in `TauCeti/Automorphic/Spectral/AS2`.

For m≠0, F_m extends meromorphically to Re(s)>0 and Res_{s=1/2+ir}[(2s−1)F_m(z,s)]=Σ_φ2a(m)||φ||⁻²φ(z), with the real Hecke normalization a(m); equivalently the residue of (2s−1)F_{−m} uses 2a(−m). The eigenspace sum contains all Hecke eigenforms at λ. The displayed simple-pole formula assumes r>0; the threshold r=0 has a quadratic parameter denominator.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Read the nonzero z′ Fourier coefficient of the resolvent expansion in terms of F_m and K_{s−1/2}.
2. Insert the finite-rank polar projector and compare its Fourier coefficient with the real Hecke normalization of the cusp eigenfunction.
3. Retain a(−m) when passing to F_{−m}; parity gives the odd/even correction in (2s−1)F_{−m}. Use r>0 for the displayed simple-pole formula.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/unbounded-selfadjoint-spectral](#automorphicspectraltheory-as-0-unbounded-selfadjoint-spectral), [AutomorphicSpectralTheory:AS.0/operator-meromorphic](#automorphicspectraltheory-as-0-operator-meromorphic), [AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion](#automorphicspectraltheory-as-4-gl2-spectral-expansion), [AutomorphicSpectralTheory:AS.2/dit-91](#automorphicspectraltheory-as-2-dit-91), [AutomorphicSpectralTheory:AS.1/dit-89](#automorphicspectraltheory-as-1-dit-89), [AutomorphicSpectralTheory:AS.2/dit-resolvent-fourier-expansion-weight0](#automorphicspectraltheory-as-2-dit-resolvent-fourier-expansion-weight0).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Proposition3, pp973–974. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-dit-94"></a>

### Bessel coefficient residue

**Theorem** · `AutomorphicSpectralTheory:AS.2/dit-94`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_94` in `TauCeti/Automorphic/Spectral/AS2`.

Let m,n≠0. Then Φ(m,n;s) continues meromorphically to Re(s)>0, and Res_{s=1/2+ir}(2s−1)Φ(−m,n;s)=2Σ_φ⟨φ,φ⟩⁻¹a(−m)a(n)=2Σ_φ⟨φ,φ⟩⁻¹a(−1)a(m)a(n). The sum runs over all Hecke–Maass cusp forms φ with eigenvalue 1/4+r², and the a(n) are real. The paper prints a(m)a(n), which is correct only for the even φ (see the new source issue on p.975). Assume r>0 for the simple-pole parameter residue; arbitrary complex orthonormal bases require conjugation in the polar projector.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Express Φ_m by the regularized Poincaré/resolvent coefficients with the retained index sign.
2. Apply the F_m residue formula and pair the two Fourier indices, preserving conjugation for an arbitrary complex orthonormal basis.
3. Separate odd and even eigenspaces and keep the parity-dependent coefficient. A threshold eigenvalue requires the quadratic-parameter treatment rather than this simple-pole statement.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/unbounded-selfadjoint-spectral](#automorphicspectraltheory-as-0-unbounded-selfadjoint-spectral), [AutomorphicSpectralTheory:AS.0/operator-meromorphic](#automorphicspectraltheory-as-0-operator-meromorphic), [AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion](#automorphicspectraltheory-as-4-gl2-spectral-expansion), [AutomorphicSpectralTheory:AS.2/dit-91](#automorphicspectraltheory-as-2-dit-91), [AutomorphicSpectralTheory:AS.1/dit-88](#automorphicspectraltheory-as-1-dit-88), [AutomorphicSpectralTheory:AS.2/dit-93](#automorphicspectraltheory-as-2-dit-93).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8, pp974–975. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-dit-resolvent-fourier-expansion-weight0"></a>

### Fourier expansion of the weight-0 resolvent kernel (Fay Thm 3.1, cited)

**Theorem** · `AutomorphicSpectralTheory:AS.2/dit-resolvent-fourier-expansion-weight0`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_resolvent_fourier_expansion_weight0` in `TauCeti/Automorphic/Spectral/AS2`.

Let Re(s)>1 and let y′>max_{γ∈Γ}Im(γz), which holds for example when z lies in the standard fundamental domain and y′>y. Then G(z,z′;s)=(2s−1)⁻¹y′^{1−s}E(z,s)+√y′Σ_{m≠0}F_{−m}(z,s)K_{s−1/2}(2π|m|y′)e(mx′).

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Take the z′ Fourier expansion of the off-diagonal resolvent and solve its radial ODE using the decaying K branch in the cusp.
2. Identify the z-dependent coefficient with F_{−m} and retain √(yy′), the zero mode and its completed-zeta normalization.
3. Use the noncompact resolvent theorem for continuation and differentiate the finite-rank polar term separately at eigenspace poles.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/unbounded-selfadjoint-spectral](#automorphicspectraltheory-as-0-unbounded-selfadjoint-spectral), [AutomorphicSpectralTheory:AS.0/operator-meromorphic](#automorphicspectraltheory-as-0-operator-meromorphic), [AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion](#automorphicspectraltheory-as-4-gl2-spectral-expansion), [AutomorphicSpectralTheory:AS.2/dit-91](#automorphicspectraltheory-as-2-dit-91).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (8.3), p.973, citing Fay [20, Thm 3.1, p.173]. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-2-gz-68"></a>

### Meromorphic continuation of G_{N,s}; residue κ_N (2.13)

**Theorem** · `AutomorphicSpectralTheory:AS.2/gz-68`.

Proposed interface: `TauCeti.AutomorphicSpectral.gz_68` in `TauCeti/Automorphic/Spectral/AS2`.

(Quoted from Hejhal [20].) G_{N,s}(z, z′) extends meromorphically in s to a neighbourhood of s = 1 with a simple pole at s = 1 of residue κ_N = −12/[SL₂(ℤ) : Γ₀(N)] = −12 N⁻¹ ∏_{p|N} (1 + 1/p)⁻¹, independent of z, z′. Consequently lim_{s→1}[G_{N,s} − κ_N/(s−1)] is not harmonic: its Laplacian is κ_N ≠ 0. The automorphic kernel is G_{N,s}(z,z′)=Σ_{γ∈Γ₀(N)}−2Q_{s−1}(1+|z−γz′|²/(2y Im(γz′))), initially Re(s)>1 and z outside the Γ-orbit of z′. Its finite part at s=1 has Δ_GZ equal to κ_N and is not harmonic; the cusp-corrected arithmetic Green function is owned by GZ.7.

**Hypotheses and conventions.**

- The printed parameter range, nonzero-frequency or off-orbit restrictions in the statement; Haar/Lebesgue normalization is fixed.
- GZ uses Δ_GZ=+y²(∂x²+∂y²); DIT uses its negative. Positive real powers use the real logarithm.

**Construction or proof.**

1. Compare the automorphic point-pair sum with the modular resolvent with its sign and 4π normalization.
2. Separate the constant eigenspace pole to compute κ_N from the hyperbolic volume π·index/3.
3. Take the finite part of the eigen-equation to obtain Δ_GZ G_N=κ_N; arithmetic cusp corrections are outside this node.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/gz-64](#automorphicspectraltheory-as-0-gz-64), [AutomorphicSpectralTheory:AS.2/dit-91](#automorphicspectraltheory-as-2-dit-91), [AutomorphicSpectralTheory:AS.0/gz-66](#automorphicspectraltheory-as-0-gz-66), [AutomorphicSpectralTheory:AS.2/automorphic-green](#automorphicspectraltheory-as-2-automorphic-green).

**Acceptance and prototype scope.**

- Retain the exact coefficient and pole normalization; arithmetic Green/height correction and holomorphic projection are imported by their consumers.
- The suggested Möbius identity fixes Mathlib ArithmeticFunction.moebius, Riemann zeta, the named ER.7 continuation and positive UHP dilation. It is not an identity for arbitrary functions occupying those argument slots.
- The suggested eigen-equation uses the actual GZ-sign coordinate adapter gzLaplacian, shared with the automorphic Green test; it cannot be asserted for an arbitrary map called lap.
- The suggested continuedCongruenceE names the ER.7 supplier prototype; its initial pair sum and unique meromorphic continuation remain source obligations. All residue tests fix this supplier and the actual Riemann zeta normalization.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter II, §2, (2.13), p. 239; inspected printed p.239. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-2-automorphic-green"></a>

### Level-N automorphic Green kernel

**Construction** · `AutomorphicSpectralTheory:AS.2/automorphic-green`.

Proposed interface: `TauCeti.AutomorphicSpectral.automorphic_green` in `TauCeti/Automorphic/Spectral/AS2`.

For N≥1 and z,z′∈𝔥 off the Γ₀(N)-orbit diagonal, construct G_{N,s}(z,z′), initially Σ_{γ∈Γ₀(N)/{±I}}g_s(z,γz′) for Re(s)>1, and then its meromorphic continuation near s=1. Here g_s=−2Q_{s−1}(1+|z−z′|²/(2yy′)); Γ is interpreted as the effective projective action, with each ±I pair counted once. It is Γ-invariant in each variable, symmetric in z,z′ and satisfies Δ_GZ G=s(s−1)G away from its diagonal. This is the analytic resolvent kernel, not the cusp-corrected arithmetic Green function of GZ.7.

**Hypotheses and conventions.**

- N≥1; the two points are outside the orbit diagonal; the effective projective-group sum and hyperbolic measure dxdy/y² are fixed.
- For the initial sum Re(s)>1; continuation uses the quoted Hejhal result and the spectral/resolvent inputs, with the proof-source gap retained.

**Construction or proof.**

1. At weight zero identify Δ_GZ with the negative of QM.3/weight-k-hyperbolic-laplacian. QM.2 does not own a Laplacian; retain the sign conversion before the eigen-equation.
2. Use Q-decay and lattice-point growth to prove locally uniform convergence of the effective-group sum off the diagonal.
3. Pass the point-pair eigen-equation through the sum on compact off-diagonal sets and use inversion in Γ for symmetry.
4. Continue the quotient resolvent and identify its constant spectral projection; retain the explicit pole before taking the finite part.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/gz-64](#automorphicspectraltheory-as-0-gz-64), [AutomorphicSpectralTheory:AS.0/gz-65](#automorphicspectraltheory-as-0-gz-65), [AutomorphicSpectralTheory:AS.0/gz-66](#automorphicspectraltheory-as-0-gz-66), [AutomorphicSpectralTheory:AS.0/unbounded-selfadjoint-spectral](#automorphicspectraltheory-as-0-unbounded-selfadjoint-spectral), `EllipticRegulators:ER.7/real-analytic-eisenstein-series`, `QSeriesPartitionsAndMockModularForms:QM.3/weight-k-hyperbolic-laplacian`.

**Uses that determine the interface.**

- **GZII §2 (2.10)–(2.15)**: Separates the analytic kernel and pole from the additional Eisenstein cusp correction owned by GZ.7.
- **AS.2/gz-68**: Supplies a defined analytic carrier to the meromorphic pole and finite-part theorem.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.automorphic_green.initial_sum` | characterisation | For Re(s)>1 off the orbit diagonal G_{N,s}=Σ_{Γ₀(N)/±I}g_s(z,γz′), absolutely and locally uniformly. |
| `TauCeti.AutomorphicSpectral.automorphic_green.symmetry` | relation | G_{N,s}(z,z′)=G_{N,s}(z′,z); invariance holds in both variables with the effective-group convention. |
| `TauCeti.AutomorphicSpectral.automorphic_green.eigenfunction` | compatibility | Away from the orbit diagonal Δ_GZ,z G_{N,s}=Δ_GZ,z′ G_{N,s}=s(s−1)G_{N,s}. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.automorphic_green.full_level_residue` (computation): At N=1 the s=1 residue is −12, with hyperbolic quotient volume π/3.
- `TauCeti.AutomorphicSpectral.automorphic_green.point_pair_symmetry` (compatibility): For the identity summand g_s(z,z′)=g_s(z′,z), since the point-pair invariant is symmetric.
- `TauCeti.AutomorphicSpectral.automorphic_green.finite_part_not_harmonic` (non-example): At N=1 the actual Green finite part after subtracting −12/(s−1) has y²(∂x²+∂y²) value −12≠0 off the effective modular orbit, so it is not harmonic. The suggested test uses the concrete gzLaplacian coordinate adapter, never an arbitrary function called lap.

**Acceptance and prototype scope.**

- Counting SL₂ matrices and their negatives independently is rejected: it doubles both the initial kernel and the residue.
- Subtracting only the pole does not produce a harmonic arithmetic Green function.
- The GZ-sign coordinate Laplacian is y²∂x²+∂t²−∂t along the logarithmic vertical curve t↦y·exp(t). Its identification with the QM.3 weight-zero supplier remains an adapter obligation; the derivative test is already meaningful on the UHP function carrier.

**Sources.**

- [Benedict H. Gross and Don B. Zagier, Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), ChapterII §2 equations(2.10)–(2.13), p.239. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-3"></a>

## AS.3 — Declarations

Coverage: **planned**. Every stated stage target has a node, an imported owner target or a precise gap. Planned means target inventory coverage, not proof closure or implementation. The continuation and Fourier interfaces distinguish restricted test models from the general source adapters.

Atlas landmarks: Arthur truncation, Maass–Selberg relations, Discrete Maass–Selberg asymptotics, Eisenstein wave packets.

<a id="automorphicspectraltheory-as-3-truncation-cones"></a>

### Parabolic truncation cones and denominators

**Definition** · `AutomorphicSpectralTheory:AS.3/truncation-cones`.

Proposed interface: `TauCeti.AutomorphicSpectral.truncation_cones` in `TauCeti/Automorphic/Spectral/AS3`.

For P⊂Q use the relative simple roots Δ_P^Q and their dual fundamental weights Δ̂_P^Q on 𝔞_P^Q. τ_P^Q(H) is the indicator that every α(H)>0; τ̂_P^Q(H) is the indicator that every ϖ(H)>0. Set θ_P^Q(ν)=vol(𝔞_P^Q/ℤ(Δ_P^Q)∨)⁻¹∏_{α∈Δ_P^Q}ν(α∨), using the fixed Lebesgue measure. These root and dual-weight cones are different. Their alternating incidence sums satisfy the Langlands combinatorial cancellation identities. Cone boundaries use strict positivity; the constant-term support complement therefore uses ≤0.

**Hypotheses and conventions.**

- A compatible relative root datum and dual Lebesgue measures are fixed; rank-zero products and cone indicators are 1.

**Construction or proof.**

1. Import the rational parabolic root data.
2. Construct indicators and lattice covolumes; prove the alternating identities by partitioning according to sign patterns.

**Prerequisites.** `AdelicAlgebraicGroups:AA.3/relative-chamber`, `AdelicAlgebraicGroups:AA.3/minimal-parabolic-data`.

**Uses that determine the interface.**

- **Arthur truncation**: Alternating cones cut off constant terms and establish projection laws.
- **Maass–Selberg**: The θ denominators are cone Laplace transforms; their covolumes fix constants.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.truncation_cones.rank_zero` | simp | For P=Q, τ=τ̂=θ=1. |
| `TauCeti.AutomorphicSpectral.truncation_cones.alternating_sum` | relation | The incidence alternating sum of root/dual-weight cone products vanishes off the rank-zero interval, with Arthur Identity 6.2 signs. |
| `TauCeti.AutomorphicSpectral.truncation_cones.theta_homogeneous` | structure | θ_P^Q(tν)=t^dim(𝔞_P^Q)θ_P^Q(ν). |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.truncation_cones.rank_one` (computation): For one coroot α∨, θ(ν)=ν(α∨)/vol(𝔞/ℤα∨).
- `TauCeti.AutomorphicSpectral.truncation_cones.boundary` (computation): At α(H)=0 the strict root-cone indicator is 0.
- `TauCeti.AutomorphicSpectral.truncation_cones.a2_distinction` (non-example): The named A₂ simple-root cutoff is zero at root coordinates (−1,3), while the cutoff for the two inverse-Cartan fundamental weights is one.

**Acceptance and prototype scope.**

- Root and weight cones coincide in rank one but generally differ in rank two.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §6 Identity 6.2; §15 denominator (15.7), p.84. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-3-arthur-truncation"></a>

### Arthur truncation operator

**Construction** · `AutomorphicSpectralTheory:AS.3/arthur-truncation` · planet: **Arthur truncation**.

Proposed interface: `TauCeti.AutomorphicSpectral.arthur_truncation` in `TauCeti/Automorphic/Spectral/AS3`.

For sufficiently regular T∈𝔞₀⁺ define Λᵀf(g)=Σ_{P⊃P₀}(−1)^dim(𝔞_P^G)Σ_{δ∈P(F)\G(F)}f_P(δg)τ̂_P(H_P(δg)−T), where f_P=∫_{N_P(F)\N_P(𝔸)}f(ng)dn. For locally bounded measurable automorphic f, the inner sum is finite at each g and locally finite on compact g-sets. T is projected to each 𝔞_P. This function truncation is distinct from diagonal kernel truncation kᵀ, although they give the same integrated distribution for sufficiently regular T relative to test-function support.

**Hypotheses and conventions.**

- Number field; compatible measures with vol[N_P]=1; regularity of T is a reduction-theoretic threshold.

**Construction or proof.**

1. Use reduction theory to prove the stated local finiteness before forming the alternating sum.
2. Apply the root-cone cancellation identities and constant-term transitivity.

**Prerequisites.** [AutomorphicSpectralTheory:AS.3/truncation-cones](#automorphicspectraltheory-as-3-truncation-cones), `AutomorphicFormsOnReductiveGroups:AF.3/constant-term`, `AdelicAlgebraicGroups:AA.3/siegel-finiteness-adelic`.

**Uses that determine the interface.**

- **AS.3 Maass–Selberg**: Makes individual unitary-axis Eisenstein series square integrable.
- **AS.6 coarse-trace**: Truncation of kernels replaces an undefined noncompact diagonal trace.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.arthur_truncation.cusp_fixed` | simp | If every proper constant term of f vanishes, Λᵀf=f. |
| `TauCeti.AutomorphicSpectral.arthur_truncation.linear` | structure | Λᵀ is complex linear on its domain. |
| `TauCeti.AutomorphicSpectral.arthur_truncation.local_finite` | characterisation | On each compact g-set only finitely many rational cosets can contribute for fixed regular T. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.arthur_truncation.cusp` (compatibility): A cuspidal automorphic form is unchanged, not annihilated, by Λᵀ.
- `TauCeti.AutomorphicSpectral.arthur_truncation.sl2_constant` (computation): The actual one-cusp strip truncation datum at T=log Y sends the constant function one to the indicator y≤Y. Global identification with SL₂ truncation uses the sufficiently-large-Y reduction theorem.
- `TauCeti.AutomorphicSpectral.arthur_truncation.rank_zero` (degenerate): When G has no proper rational parabolic, Λᵀ=id.

**Acceptance and prototype scope.**

- The P=G term is f, hence cusp forms are fixed.
- Suggested model: The cusp-strip datum has one proper parabolic and one embedded cusp translate. Its identification with the global SL₂ fundamental-domain formula requires sufficiently large Y and reduction theory.
- The suggested linearity API requires finite coset support at each point. The compact-uniform local-finiteness API is a named omission pending the genuine reduction-theory carrier and regular truncation parameter, rather than a theorem about arbitrary TruncationData.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §13 equation (13.1). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-truncation-projection"></a>

### Self-adjoint projection and constant-term support

**Theorem** · `AutomorphicSpectralTheory:AS.3/truncation-projection`.

Proposed interface: `TauCeti.AutomorphicSpectral.truncation_projection` in `TauCeti/Automorphic/Spectral/AS3`.

For sufficiently regular T, the P-constant term of Λᵀf vanishes unless every ϖ(H_P(g)−T)≤0. Moreover ΛᵀΛᵀ=Λᵀ. For locally bounded f and compactly supported continuous h, ⟪Λᵀf,h⟫=⟪f,Λᵀh⟫ whenever the displayed pairings are defined. It extends as an orthogonal projection on L². The support inequality is non-strict, correcting the strict inequality printed in Arthur 1980 Lemma 1.1.

**Hypotheses and conventions.**

- Regular T; the initial self-adjointness formula uses one compactly supported factor before L² extension.

**Construction or proof.**

1. Apply Bruhat decomposition, constant-term transitivity and the cone cancellation identity to each constant term.
2. The support property kills every proper-parabolic term of a second truncation.
3. Unfold against a compactly supported h, then extend the symmetric idempotent using L² estimates.

**Prerequisites.** [AutomorphicSpectralTheory:AS.3/arthur-truncation](#automorphicspectraltheory-as-3-arthur-truncation), [AutomorphicSpectralTheory:AS.3/truncation-cones](#automorphicspectraltheory-as-3-truncation-cones), [mathlib:MeasureTheory.integral_prod](#mathlib-measuretheory-integral-prod).

**Acceptance and prototype scope.**

- At a boundary point ϖ(H_P−T)=0, no vanishing is asserted.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §13 Proposition 13.1(a)–(c) and correction after statement. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-truncation-rapid-decay"></a>

### Rapid decay of truncated uniform-moderate families

**Theorem** · `AutomorphicSpectralTheory:AS.3/truncation-rapid-decay`.

Proposed interface: `TauCeti.AutomorphicSpectral.truncation_rapid_decay` in `TauCeti/Automorphic/Spectral/AS3`.

If f is smooth of uniform moderate growth (one height exponent N₀ works for all archimedean derivatives, with derivative-dependent constants), Λᵀf is rapidly decreasing on every Siegel set for regular T. Quantitatively, for each desired decay exponent N, input N₀ and finite level K₀, there are finitely many differential operators X_i and a differentiability order r such that sup_{x∈S}‖x‖^N∫_Ω|Λᵀf_ω(x)|dω is bounded by a fixed constant times sup_y‖y‖^(−N₀)Σ_i∫_Ω|X_i f_ω(y)|dω. Thus a regular unitary Eisenstein series truncates to L², and dominated parameter families can be integrated after truncation.

**Hypotheses and conventions.**

- The quantitative bound is for fixed T/S/N/N₀/K₀; input is C^r and measurable in ω; right side finite.

**Construction or proof.**

1. Use alternating cancellation to isolate terms with large root coordinates.
2. Apply integration by parts and reduction-theoretic height estimates to their unipotent Fourier terms.
3. Apply the finite derivative seminorm bound, retaining the parameter integral instead of assuming pointwise domination suffices.

**Prerequisites.** [AutomorphicSpectralTheory:AS.3/truncation-projection](#automorphicspectraltheory-as-3-truncation-projection), [AutomorphicSpectralTheory:AS.1/eisenstein-convergence](#automorphicspectraltheory-as-1-eisenstein-convergence), [AutomorphicSpectralTheory:AS.2/eisenstein-continuation](#automorphicspectraltheory-as-2-eisenstein-continuation), `AdelicAlgebraicGroups:AA.3/height-siegel-estimate`.

**Acceptance and prototype scope.**

- No bound uniform in T approaching a chamber wall is asserted.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §13 Proposition 13.2(a)–(b), (13.5)–(13.6). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-cuspidal-maass-selberg"></a>

### Exact cuspidal Maass–Selberg relations

**Theorem** · `AutomorphicSpectralTheory:AS.3/cuspidal-maass-selberg` · planet: **Maass–Selberg relations**.

Proposed interface: `TauCeti.AutomorphicSpectral.cuspidal_maass_selberg` in `TauCeti/Automorphic/Spectral/AS3`.

For cuspidal φ∈H_P⁰ and φ′∈H_R⁰ and regular T, the truncated Gram pairing ⟪ΛᵀE_R(φ′,λ′),ΛᵀE_P(φ,λ)⟫ equals ωᵀ(λ,λ′;φ,φ′)=Σ_QΣ_{w∈W(𝔞_P,𝔞_Q)}Σ_{w′∈W(𝔞_R,𝔞_Q)}exp((wλ+overline(w′λ′))(T_Q))⟪M(w′,λ′)φ′,M(w,λ)φ⟫/θ_Q^G(wλ+overline(w′λ′)). Initially take generic regular parameters; at a denominator zero take the holomorphic limit of the whole finite sum. The sum is zero for nonassociate P,R. Exact equality here requires cuspidal inducing data.

**Hypotheses and conventions.**

- Cuspidal inducing vectors; regular T; meromorphic continuation of both sides; generic parameters first; conjugate-first Gram convention.

**Construction or proof.**

1. Use the cuspidal constant-term formula and unfold the truncation pairing.
2. Integrate exponential functions over the truncated root cones; their Laplace transforms give θ denominators and the covolumes.
3. Sum all Weyl terms before taking removable limits.

**Prerequisites.** [AutomorphicSpectralTheory:AS.3/truncation-rapid-decay](#automorphicspectraltheory-as-3-truncation-rapid-decay), [AutomorphicSpectralTheory:AS.3/truncation-cones](#automorphicspectraltheory-as-3-truncation-cones), [AutomorphicSpectralTheory:AS.1/cuspidal-constant-term](#automorphicspectraltheory-as-1-cuspidal-constant-term), [AutomorphicSpectralTheory:AS.2/eisenstein-continuation](#automorphicspectraltheory-as-2-eisenstein-continuation).

**Acceptance and prototype scope.**

- For SL₂, coincident parameters produce log Y and the scattering logarithmic derivative; individual summands can diverge.

**Sources.**

- [James Arthur, On the Inner Product of Truncated Eisenstein Series](https://www.claymath.org/library/cw/arthur/pdf/12.pdf), Introduction formula (1); §9 ωᵀ formula. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-discrete-maass-selberg-asymptotic"></a>

### Discrete-data Maass–Selberg asymptotics

**Theorem** · `AutomorphicSpectralTheory:AS.3/discrete-maass-selberg-asymptotic` · planet: **Discrete Maass–Selberg asymptotics**.

Proposed interface: `TauCeti.AutomorphicSpectral.discrete_maass_selberg_asymptotic` in `TauCeti/Automorphic/Spectral/AS3`.

For fixed cuspidal support χ and finite K-type set Γ, arbitrary discrete inducing vectors φ∈H_P,χ,Γ⁰ and φ′∈H_R,χ,Γ⁰ on the imaginary axes satisfy |⟪ΛᵀE_R(φ′,λ′),ΛᵀE_P(φ,λ)⟫−ωᵀ(λ,λ′;φ,φ′)|≤ρ(λ,λ′)‖φ‖‖φ′‖exp(−ε‖T‖). For each fixed δ>0 and sufficiently large N, this holds when every α(T)>δ‖T‖>N; ε>0 and ρ is locally bounded on i𝔞_P*×i𝔞_R*. The ωᵀ finite sum has the preceding operator form, but equality for general discrete data is replaced by this error estimate.

**Hypotheses and conventions.**

- Number field; fixed χ,Γ; T remains away from all walls; no global polynomial bound for ρ is inferred from local boundedness.

**Construction or proof.**

1. Express discrete data as ordered residues of cuspidal Eisenstein families.
2. Take residues of the exact cuspidal formula and decompose the resulting polynomial-exponential terms as Arthur §§7–9.
3. The nonconstant exponents are negative on the controlled T-cone, giving the uniform exponential remainder.

**Prerequisites.** [AutomorphicSpectralTheory:AS.3/cuspidal-maass-selberg](#automorphicspectraltheory-as-3-cuspidal-maass-selberg), [AutomorphicSpectralTheory:AS.2/residue-calculus](#automorphicspectraltheory-as-2-residue-calculus).

**Acceptance and prototype scope.**

- Replacing the inequality by exact equality for residual inducing data is rejected.

**Sources.**

- [James Arthur, On the Inner Product of Truncated Eisenstein Series](https://www.claymath.org/library/cw/arthur/pdf/12.pdf), §9 Theorem 9.1, Q=G, printed p.69. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-eisenstein-wave-packet"></a>

### Regular Eisenstein wave packets

**Construction** · `AutomorphicSpectralTheory:AS.3/eisenstein-wave-packet` · planet: **Eisenstein wave packets**.

Proposed interface: `TauCeti.AutomorphicSpectral.eisenstein_wave_packet` in `TauCeti/Automorphic/Spectral/AS3`.

Let F_P be a smooth compactly supported function on i(𝔞_P/𝔞_G)* with values in a fixed finite-dimensional H_P⁰ subspace and whose support avoids any poles of the chosen inducing continuation. Define W_P(F)(g)=∫E_P(g,F_P(λ),λ)dλ. This initially defines a smooth automorphic function by compact-parameter integration. For an associate family impose F_Q(wλ)=M(w,λ)F_P(λ) and sum n_P⁻¹W_P(F_P), with n_P=Σ_Q|W(𝔞_P,𝔞_Q)|. The weighted family is an L² wave packet by the norm theorem; its construction is here, before AS.3’s pairings, while onto completeness belongs to AS.4.

**Hypotheses and conventions.**

- Finite-dimensional smooth inducing space; compact smooth spectral support; compatible dual measure and central quotient.

**Construction or proof.**

1. Use local uniform parameter regularity and compact-parameter integration to construct the smooth automorphic function, pointwise or in a truncated Hilbert space.
2. Prove truncation commutes with the integral using the quantitative seminorm estimate. The Gram/norm theorem is a later consumer, not a prerequisite of this construction; its global L² conclusion is not assumed here.

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/eisenstein-continuation](#automorphicspectraltheory-as-2-eisenstein-continuation), [AutomorphicSpectralTheory:AS.2/intertwiner-factorization](#automorphicspectraltheory-as-2-intertwiner-factorization), [AutomorphicSpectralTheory:AS.0/locally-convex-integration](#automorphicspectraltheory-as-0-locally-convex-integration), [AutomorphicSpectralTheory:AS.3/truncation-rapid-decay](#automorphicspectraltheory-as-3-truncation-rapid-decay).

**Uses that determine the interface.**

- **AS.3 packet-Gram**: Makes every truncated norm statement refer to an already constructed function.
- **AS.4 unitary-spectral-map**: Extends this dense-domain map to the complete direct integral.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.eisenstein_wave_packet.linear` | structure | F↦W(F) is complex linear. |
| `TauCeti.AutomorphicSpectral.eisenstein_wave_packet.right_equivariant` | compatibility | Right translation acts by the corresponding induced action on F_P(λ). |
| `TauCeti.AutomorphicSpectral.eisenstein_wave_packet.truncate_integral` | compatibility | Λᵀ commutes with the compact-parameter integral under the quantitative truncation estimates. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.eisenstein_wave_packet.zero` (degenerate): Zero sections give zero packets.
- `TauCeti.AutomorphicSpectral.eisenstein_wave_packet.rank_zero` (compatibility): For P=G on [G]¹ the zero-dimensional integral gives the inducing vector.
- `TauCeti.AutomorphicSpectral.eisenstein_wave_packet.weyl_overcount` (non-example): The packet constructor over a two-element Weyl orbit with measure half counting sends a compatible constant section v to v; omitting the denominator gives 2v.

**Acceptance and prototype scope.**

- This construction does not assume the onto map it supplies in AS.4.
- Individual unitary-axis Eisenstein series are not assumed to belong to the untruncated global L² space.
- Suggested model: The Weyl test is a finite two-point compatible-section specialization of the integral constructor. The full continuous-parameter Weyl action and quotient measures remain supplied inputs.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §7 Theorem 7.2(b) wave-packet formula. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-wave-packet-gram"></a>

### Integrated wave-packet Gram identities

**Theorem** · `AutomorphicSpectralTheory:AS.3/wave-packet-gram`.

Proposed interface: `TauCeti.AutomorphicSpectral.wave_packet_gram` in `TauCeti/Automorphic/Spectral/AS3`.

For compact spectral wave packets F,F′, the truncated pairing is the double integral of the truncated Eisenstein Gram pairing. For cuspidal inducing data insert the exact ωᵀ sum; for general discrete data insert ωᵀ plus the uniformly exponentially small error on compact parameter support. After imposing associate symmetry, the T→∞ limit is Σ_P n_P⁻¹∫⟪F′_P(λ),F_P(λ)⟫dλ. This proves the isometric dense-domain norm identity, separately from surjectivity.

**Hypotheses and conventions.**

- Compact smooth spectral support; compatible associate symmetry; controlled regular T-cone for the discrete error estimate.

**Construction or proof.**

1. Commute compact parameter integration with truncation and the L² pairing using the uniform estimates.
2. Integrate the complete Weyl sum and take its removable singular limits before sending T to infinity.
3. Use Fourier inversion in T and association symmetry to get the diagonal Plancherel pairing.

**Prerequisites.** [AutomorphicSpectralTheory:AS.3/eisenstein-wave-packet](#automorphicspectraltheory-as-3-eisenstein-wave-packet), [AutomorphicSpectralTheory:AS.3/cuspidal-maass-selberg](#automorphicspectraltheory-as-3-cuspidal-maass-selberg), [AutomorphicSpectralTheory:AS.3/discrete-maass-selberg-asymptotic](#automorphicspectraltheory-as-3-discrete-maass-selberg-asymptotic), [mathlib:MeasureTheory.integral_prod](#mathlib-measuretheory-integral-prod).

**Acceptance and prototype scope.**

- A norm identity proves isometry only; AS.4 supplies density of its range.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §7 Theorem 7.2(b) and §12 contour discussion; PDF page 35. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-3-singular-parameter-limits"></a>

### Coalescing parameters and residue Gram forms

**Theorem** · `AutomorphicSpectralTheory:AS.3/singular-parameter-limits`.

Proposed interface: `TauCeti.AutomorphicSpectral.singular_parameter_limits` in `TauCeti/Automorphic/Spectral/AS3`.

Near coincident regular parameters, the complete Maass–Selberg Weyl sum extends as the actual truncated Gram function even when individual θ denominators vanish. Differentiating that full regularized identity gives Gram forms of parameter derivatives. For ordered polar flags with a common denominator, take the chosen residue coefficients on both sides; the resulting residue Gram form uses the same coordinate/order conventions. No positivity or L² membership is deduced from a formal Laurent coefficient alone.

**Hypotheses and conventions.**

- Differentiation and residues have the common denominator and locally uniform derivative majorants; exact equality is the cuspidal formula, while general discrete data retains its controlled error.

**Construction or proof.**

1. Use the vector Cauchy formula to regularize the complete identity.
2. Apply dominated differentiation to the truncated integral and then take Laurent coefficients with fixed flag data.

**Prerequisites.** [AutomorphicSpectralTheory:AS.3/cuspidal-maass-selberg](#automorphicspectraltheory-as-3-cuspidal-maass-selberg), [AutomorphicSpectralTheory:AS.3/discrete-maass-selberg-asymptotic](#automorphicspectraltheory-as-3-discrete-maass-selberg-asymptotic), [AutomorphicSpectralTheory:AS.2/residue-calculus](#automorphicspectraltheory-as-2-residue-calculus), [mathlib:hasFDerivAt_integral_of_dominated_of_fderiv_le](#mathlib-hasfderivat-integral-of-dominated-of-fderiv-le).

**Acceptance and prototype scope.**

- The rank-one limit of (Y^z−1)/z is log Y; taking one pole term by itself gives no Gram form.

**Sources.**

- [James Arthur, On the Inner Product of Truncated Eisenstein Series](https://www.claymath.org/library/cw/arthur/pdf/12.pdf), §§3–6 taking residues of the cuspidal pairing. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-yu-022"></a>

### GL_n relative root spaces and degree projections

**Definition** · `AutomorphicSpectralTheory:AS.3/yu-022`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_022` in `TauCeti/Automorphic/Spectral/AS3`.

Using the imported rational root spaces of AA.3, construct their determinant-degree coordinate adapter for function-field GL_n. For M=∏GL_ni, use determinant coordinates for a_M and its dual. Projection a_B→a_M takes block sums, while dual projection takes block averages. Relative roots are det_i/ni−det_j/nj, coroots e_i−e_j, a_M^G has coordinate sum zero and its dual has Σni x_i=0.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Apply the imported rational root-space description to a block Levi and identify determinant-degree coordinates and their total-degree map.
2. For adjacent blocks compute the relative root and coroot pairing explicitly, including the block-rank scaling between determinant and root coordinates.
3. Compute partial block sums for the dual fundamental weights and verify that the degree lattice maps to the claimed rational height lattice.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/yu-010](#automorphicspectraltheory-as-1-yu-010), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, `AdelicAlgebraicGroups:AA.3/relative-chamber`, `AdelicAlgebraicGroups:AA.3/minimal-parabolic-data`.

**Uses that determine the interface.**

- **PAPER-YU-23/023**: Input to Chamber functions and parabolic height.
- **PAPER-YU-23/032**: Input to Large-chamber isocline criterion.
- **PAPER-YU-23/047**: Input to Weyl permutations and fixed Levis.
- **PAPER-YU-23/048**: Input to Multiplicative and linear torus pairings.
- **PAPER-YU-23/049**: Input to Arthur theta denominator and multiplicative families.
- **PAPER-YU-23/056**: Input to Generic auxiliary chamber selector.
- **PAPER-YU-23/057**: Input to Rankin–Selberg normalizing factors.
- **PAPER-YU-23/059**: Input to Floor-vector expression for the cone series.
- **PAPER-YU-23/080**: Input to Spanning trees and type-A root bases.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_022.blockProjection` | constructor | implement sums on a_M and averages on its dual |
| `TauCeti.AutomorphicSpectral.yu_022.relativeRoot` | compatibility | construct det_i/ni−det_j/nj and coroots |
| `TauCeti.AutomorphicSpectral.yu_022.fundamentalWeight` | structure | export the prefix inequalities with exact denominators |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_022.test1` (computation): The actual block projection for 1|23 sends (1,2,3) to (1,5), and its averaged dual projection gives (1,5/2).
- `TauCeti.AutomorphicSpectral.yu_022.test2` (degenerate): For the single rank-n block, n>0, subtracting the central projection gives the zero relative-height vector for every input.
- `TauCeti.AutomorphicSpectral.yu_022.test3` (compatibility): For blocks of ranks1 and2, α(x,y)=x−y/2 and α∨=(1,−1), with the degree-zero condition x+y=0.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §3.1.1–3.1.6 pp13–15. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-yu-023"></a>

### Chamber functions and parabolic height

**Definition** · `AutomorphicSpectralTheory:AS.3/yu-023`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_023` in `TauCeti/Automorphic/Spectral/AS3`.

Import the root/fundamental-weight cones from AS.3/truncation-cones and specialize their height argument to the function-field determinant-degree lattice. Define tau_P and hat-tau_P as strict positive-root/fundamental-weight cone indicators. For g=nmk, H_P(g) is the vector of determinant degrees of m. Record block-weight denominators and proper-parabolic conventions in the truncation cutoff.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Restrict the previously defined root and dual-weight cones to determinant-degree heights.
2. Check the strict and weak boundary inequalities against the function-field κ convention, rather than changing them by notation.
3. Transport the lattice by Weyl maps and record the degree-e fibre on which later cone series are summed.

**Prerequisites.** [AutomorphicSpectralTheory:AS.3/yu-022](#automorphicspectraltheory-as-3-yu-022), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [AutomorphicSpectralTheory:AS.3/truncation-cones](#automorphicspectraltheory-as-3-truncation-cones).

**Uses that determine the interface.**

- **PAPER-YU-23/024**: Input to Truncated geometric kernel and fixed-degree trace.
- **PAPER-YU-23/030**: Input to T-semistability and lattice cone indicator.
- **PAPER-YU-23/058**: Input to Degree-filtered lattice cone series.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_023.height` | constructor | extract Levi determinant degrees from Iwasawa decomposition |
| `TauCeti.AutomorphicSpectral.yu_023.tau` | compatibility | test strict simple-root inequalities |
| `TauCeti.AutomorphicSpectral.yu_023.hatTau` | structure | test strict fundamental-weight inequalities |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_023.test1` (degenerate): The empty product of cone conditions for GL₁ is1.
- `TauCeti.AutomorphicSpectral.yu_023.test2` (non-example): A point on a required wall, with the corresponding pairing zero, does not satisfy the strict cone condition.
- `TauCeti.AutomorphicSpectral.yu_023.test3` (compatibility): For the determinant-height homomorphism with trivial unipotent and compact factors, the named height of nmk is that of m, and both actual cone cutoffs agree.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §3.1.3–3.1.6 pp14–15. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-yu-056"></a>

### Generic auxiliary chamber selector

**Construction** · `AutomorphicSpectralTheory:AS.3/yu-056`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_056` in `TauCeti/Automorphic/Spectral/AS3`.

Choose kappa in the positive chamber outside every relative-root hyperplane for every semistandard Levi. The unique Q_L with all its simple roots positive on kappa orders the Levi blocks. Merely requiring nonzero projections to a_L is insufficient.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. List the finitely many nonzero root and fundamental-weight forms for all Weyl-transported Levis used by the degree calculation.
2. Choose η outside their rational walls and fix its chamber signs.
3. Check that the required integral partial sums do not lie on a boundary; small perturbations in this chamber preserve the chosen floor/cone convention.

**Prerequisites.** [AutomorphicSpectralTheory:AS.3/yu-022](#automorphicspectraltheory-as-3-yu-022), [AutomorphicSpectralTheory:AS.6/yu-047](#automorphicspectraltheory-as-6-yu-047), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Uses that determine the interface.**

- **PAPER-YU-23/058**: Input to Degree-filtered lattice cone series.
- **PAPER-YU-23/080**: Input to Spanning trees and type-A root bases.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_056.avoidHyperplanes` | constructor | choose a point off the finite union of relative-root walls |
| `TauCeti.AutomorphicSpectral.yu_056.orderedParabolic` | compatibility | recover Q_L from the signs |
| `TauCeti.AutomorphicSpectral.yu_056.weylTransport` | structure | relate a semistandard Levi to the ordered standard one |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_056.test1` (non-example): The vector (3,2,1) fails membership in the selector for the crossed partition {1,3}|{2}, because its block averages are equal.
- `TauCeti.AutomorphicSpectral.yu_056.test2` (computation): The vector (2,0) belongs to the actual GL₂ regular selector and chooses the positive ordered parabolic.
- `TauCeti.AutomorphicSpectral.yu_056.test3` (compatibility): Multiplying a generic kappa by a positive real preserves every relative-root sign, hence preserves every Q_L.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §5.1.1 p29, corrected E6. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-yu-058"></a>

### Degree-filtered lattice cone series

**Construction** · `AutomorphicSpectralTheory:AS.3/yu-058`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_058` in `TauCeti/Automorphic/Spectral/AS3`.

Let M be standard, Q in P(M) and s in W_n/W^Q with sQs^{-1} standard. Let φ_Q be the indicator of {H in a_{s(M)} : for all α in Δ_Q, ϖ_{s(α)}(H)≤0 if α(κ)>0 and ϖ_{s(α)}(H)>0 if α(κ)<0}, where ϖ_{s(α)} in Δ̂_{sQs^{-1}} is dual to s(α)^∨, and let ε(Q)=#{α in Δ_Q : α(κ)<0}. Then 1̂_Q(λ) on X_M^G is the analytic continuation of (−1)^{ε(Q)}Σ_{H in a_{M,Z}/X_*(Z_G)} φ_Q(s(H))λ^{−H}, which converges where |λ^{α^∨}|<1 for all α in Φ(Z_M,G) with α(κ)>0 (a region meeting every component of X_M^G). For semi-standard L and Q in P(L), 1̂_Q(λ):=1̂_{wQw^{-1}}(w(λ)), where w in W_n/W^{Q_L} is the unique element with wQ_Lw^{-1} standard. For ζ a primitive n-th root of unity, η=ζ^{deg det} in X_G^G and e in Z, 1̂^e_Q(λ)=n^{-1}Σ_{k=1}^n ζ^{ek}1̂_Q(λη^k); it is the part of the series with Σ_iH_i≡e (mod n), and 1̂_Q=Σ_{e=0}^{n−1}1̂^e_Q.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Define the κ-signed degree-e lattice indicator and sum its character values initially in the convergence chamber.
2. In a coroot basis sum the geometric series and express the resulting numerator by the associated floor exponents.
3. Continue the resulting rational function and form its finite degree-Fourier projector; all e mod n are allowed, and their normalization is fixed before later regularization.

**Prerequisites.** [AutomorphicSpectralTheory:AS.3/yu-023](#automorphicspectraltheory-as-3-yu-023), [AutomorphicSpectralTheory:AS.6/yu-048](#automorphicspectraltheory-as-6-yu-048), [AutomorphicSpectralTheory:AS.3/yu-056](#automorphicspectraltheory-as-3-yu-056), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Uses that determine the interface.**

- **PAPER-YU-23/059**: Input to Floor-vector expression for the cone series.
- **PAPER-YU-23/063**: Input to Corrected Arthur–Lafforgue spectral expression.
- **PAPER-YU-23/151**: Input to Typed finite-fibre operator trace.
- **PAPER-YU-23/152**: Input to Degree Fourier recovery of the spectral contribution.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_058.coneSeries` | constructor | define in a convergence chamber then continue |
| `TauCeti.AutomorphicSpectral.yu_058.degreeFourierProjector` | compatibility | select a degree residue by the finite Fourier sum |
| `TauCeti.AutomorphicSpectral.yu_058.sumResidues` | structure | recover the unfiltered series |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_058.test1` (degenerate): For n=1 the Fourier degree projector has one term and hat1_Q^0=hat1_Q.
- `TauCeti.AutomorphicSpectral.yu_058.test2` (compatibility): Summing hat1_Q^e over e=0,...,n−1 recovers hat1_Q.
- `TauCeti.AutomorphicSpectral.yu_058.test3` (computation): For n=2,zeta=−1, the even/odd projectors of a function f are (f(lambda)±f(lambda*eta))/2.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §5.2.1 pp31–32. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-yu-059"></a>

### Floor-vector expression for the cone series

**Theorem** · `AutomorphicSpectralTheory:AS.3/yu-059`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_059` in `TauCeti/Automorphic/Spectral/AS3`.

For ordered block prefix ranks r_s^i, H_Q^e=s^−1(floor(e r_s^0/n)−floor(e r_s^1/n),...,floor(e r_s^(r−1)/n)−floor(e r_s^r/n)) belongs to the integral a_L lattice with total degree −e. Then hat1_Q^e=lambda^H∏_{alpha∈Delta_Q}(1−lambda^alpha∨)^−1; for e=−1 this is (−1)^(r−1)(∏lambda_i)/theta_Q.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Parametrize lattice points in the cone by nonnegative simple-coroot coefficients and the degree constraint.
2. The unique minimal representative is the floor vector with total −e.
3. Multiply the geometric series in each root direction; verify the e=−1 specialization with its sign..

**Prerequisites.** [AutomorphicSpectralTheory:AS.3/yu-022](#automorphicspectraltheory-as-3-yu-022), [AutomorphicSpectralTheory:AS.6/yu-048](#automorphicspectraltheory-as-6-yu-048), [AutomorphicSpectralTheory:AS.3/yu-058](#automorphicspectraltheory-as-3-yu-058), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), Proposition5.2.1 p32, E7. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-yu-115"></a>

### Degree floor-monomial family

**Construction** · `AutomorphicSpectralTheory:AS.3/yu-115`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_115` in `TauCeti/Automorphic/Spectral/AS3`.

Set I_Q^e=H_Q^e+s^−1(0,1,...,1). The functions lambda↦lambda^I_Q^e form a (G,M)-family, and hat1_Q^e=(−1)^dim(a_M^G)lambda^I_Q^e/theta_Q. Adjacent-block compatibility follows from the floor identities on the wall.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Use Proposition5.2.1’s explicit floor exponents and shift them by s⁻¹(0,1,…,1) to obtain I_Q^e.
2. On a shared adjacent-block wall compare the two floor differences; their discrepancy pairs trivially with λ, so λ^{I_Q^e} agrees there.
3. Multiply the cone transform by θ_Q and retain the sign (−1)^dim(a_M^G). This makes a family of numerators rather than claiming the singular quotients themselves are holomorphic members.

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/yu-049](#automorphicspectraltheory-as-6-yu-049), [AutomorphicSpectralTheory:AS.3/yu-059](#automorphicspectraltheory-as-3-yu-059), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Uses that determine the interface.**

- **PAPER-YU-23/116**: Input to Translated degree-cutoff vanishing.
- **PAPER-YU-23/117**: Input to Dependence of cutoff values only on degree order.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_115.floorExponent` | constructor | add the ordered (0,1,...,1) vector |
| `TauCeti.AutomorphicSpectral.yu_115.wallAgreement` | compatibility | prove adjacent exponent compatibility |
| `TauCeti.AutomorphicSpectral.yu_115.cutoffFactor` | structure | recover hat1_Q^e with the single theta denominator |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_115.test1` (computation): The named floor-height and shifted-exponent constructions for ranks (1,2), total rank three and degree one give H=(0,−1), I=(0,0).
- `TauCeti.AutomorphicSpectral.yu_115.test2` (compatibility): The total of H_Q^e is−e and the total of I_Q^e is r−1−e.
- `TauCeti.AutomorphicSpectral.yu_115.test3` (non-example): In multiplicative character coordinates the two-block cone expression λ₂^(−1)/(1−λ₁/λ₂) equals −1/(λ₁−λ₂). Multiplication by the actual linear θ cancels the pole; multiplying by its inverse gives a double denominator.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), LemmaA.1 p75; Laf97 Lemma5(ii)p301. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-yu-116"></a>

### Translated degree-cutoff vanishing

**Theorem** · `AutomorphicSpectralTheory:AS.3/yu-116`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_116` in `TauCeti/Automorphic/Spectral/AS3`.

Let n ≥ 1 and e ∈ Z with gcd(e,n) = 1. Let M be a standard Levi of GL_n and μ_0 ∈ X_M^G. Let (c_Q)_(Q∈P(M)) be a (G,M)-family on a domain containing μ_0^Z such that c_M^Q is independent of Q ∈ P(L) for each L ∈ L(M), and such that c_Q(λμ_0) = c_Q(λ). Then lim_(λ→1) Σ_(Q∈P(M)) 1̂^e_Q(λμ_0)c_Q(λμ_0) = 0 unless μ_0 ∈ X_G^G. Proof: d_Q(λ) = 1̂^e_Q(λμ_0)θ_Q(λ), multiplied by θ_Q as in E24, is a (G,M)-family by Lemme A.1 and the argument of Lemme 4.2.8. By Prop. 4.2.3 the limit equals Σ_L c_M^L d_L. If μ_0 ∉ X_L^G, then d_L = 0. If μ_0 ∈ X_L^G with L ≠ G, then d_L is a nonzero constant times Σ_(Q∈P(L)) 1̂^e_Q(μ_0) (the L-level functions), and this sum vanishes by the proposed coverage item because gcd(e,n) = 1. Finally d_G = 0 unless μ_0 is central. For gcd(e,n) > 1 the conclusion is false.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Use the product-family formula with the corrected d_Q=hat1_Q theta_Q.
2. Partial-value independence makes all noncentral translated contributions vanish by the same missing-pole argument as item55..

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/yu-051](#automorphicspectraltheory-as-6-yu-051), [AutomorphicSpectralTheory:AS.6/yu-055](#automorphicspectraltheory-as-6-yu-055), [AutomorphicSpectralTheory:AS.3/yu-115](#automorphicspectraltheory-as-3-yu-115), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), LemmaA.2 pp75–76, E24. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-yu-117"></a>

### Dependence of cutoff values only on degree order

**Theorem** · `AutomorphicSpectralTheory:AS.3/yu-117`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_117` in `TauCeti/Automorphic/Spectral/AS3`.

Under the same partial-value compatibility, lim_(mu→1)Σ_Qhat1_Q^e(mu)c_Q(mu) depends only on the order of e in Z/nZ. On a Levi with block sizes m_j, the top-degree floor-monomial contribution vanishes unless n|e m_j for every j; product descent gives the assertion.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Expand the floor-monomial exponential family at the identity.
2. The top-degree coefficient survives exactly under the divisibilities n|e m_j; these depend only on gcd(e,n).
3. Descend through all Levis using the product formula to obtain invariance for the full limit..

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/yu-051](#automorphicspectraltheory-as-6-yu-051), [AutomorphicSpectralTheory:AS.3/yu-059](#automorphicspectraltheory-as-3-yu-059), [AutomorphicSpectralTheory:AS.3/yu-115](#automorphicspectraltheory-as-3-yu-115), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), LemmaA.3 pp76–77. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-yu-157"></a>

### Quasi-polynomiality of the Γ-lattice counts and determination from the deep chamber

**Theorem** · `AutomorphicSpectralTheory:AS.3/yu-157`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_157` in `TauCeti/Automorphic/Spectral/AS3`.

Let M_P ≅ GL(n_1) × ⋯ × GL(n_r), e ∈ Z and e_i ∈ Z/n_iZ, and let h = h^e_{(e_i)} = {(d_1, …, d_r) ∈ Z^r : Σ d_i = e, d_i ≡ e_i mod n_i}. (a) [Ch15, Prop 4.5.5] On lattice points T ∈ Hom(X^*(B), Z) ≅ Z^n with T_1 ≥ ⋯ ≥ T_n, the finite sum T ↦ Σ_{H∈h} Γ_{(n_1,…,n_r)}(H, T) agrees with a quasi-polynomial Σ_{ν∈f} p_ν(T) q^{⟨ν,T⟩}, with f ⊂ (2πi/log q) X^*(B) ⊗ Q finite and each p_ν a polynomial. Yu's Γ_I equals Chaudouard's Γ_P. (b) Two such quasi-polynomials that agree at all lattice points T with d(T) ≥ c agree on all lattice points of the closed chamber, in particular at T = 0. (c) (Remarque 3.3.3) Γ_I(·, 0) ≡ 0 for r > 1 and Γ_{(n)} ≡ 1.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Represent each deep-chamber expression by polynomial functions on the finitely many residue classes of its degree lattice.
2. Intersect each residue class with the sufficiently deep chamber; polynomial equality there forces equality of the polynomial on that residue class by lattice Zariski density.
3. Conclude that the quasi-polynomial continuation and its T=0 value are independent of the initially chosen deep-chamber expression. Pointwise equality at one height would be insufficient.

**Prerequisites.** `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [AutomorphicSpectralTheory:AS.3/yu-022](#automorphicspectraltheory-as-3-yu-022), [AutomorphicSpectralTheory:AS.3/yu-023](#automorphicspectraltheory-as-3-yu-023).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §3.3.1, p. 20, and Remarque 3.3.3, p. 19; [Ch15, Définition 4.5.3, Proposition 4.5.5]. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-3-yu-175"></a>

### Vanishing of the degree-e cone sum on a proper Levi

**Theorem** · `AutomorphicSpectralTheory:AS.3/yu-175`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_175` in `TauCeti/Automorphic/Spectral/AS3`.

Let L ≅ GL_(m_1)×…×GL_(m_k) be a standard Levi of GL_n with k ≥ 2, let d = gcd(m_1,…,m_k) and e ∈ Z, and let 1̂^e_Q (Q ∈ P(L)) be the functions of Prop. 5.2.1. Then Σ_(Q∈P(L)) 1̂^e_Q(λ) vanishes identically on X_L^G unless (n/d) | e; in particular it vanishes when gcd(e,n) = 1. When (n/d) | e the sum is a single monomial with root-of-unity values; for example it is ≡ 1 for L = T ⊂ GL_2 with e = 0. Proof sketch: the κ-signed cone series of §5.2.1 sum to the generating function of the classes H ∈ a_(L,Z)/X_*(Z_G) with zero projection to a_L^G, namely H = (j/d)(m_1,…,m_k) for 0 ≤ j < d. Their total degree jn/d is ≡ 0 mod n/d, so the degree-e part is empty unless (n/d) | e. Numerically verified for 12 Levis of GL_2 to GL_6 and every e.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Sum the κ-signed cone series over P(L); the cone decomposition leaves precisely lattice classes with zero projection to a_L^G.
2. For block ranks m_i and d=gcd(m_i), write these remaining classes as (j/d)(m_1,…,m_k), 0≤j<d. Their total degree is jn/d.
3. Project to degree e. The class set is empty unless n/d divides e; in that case the remaining generating function is the stated single monomial. A proper Levi has n/d>1, so coprimality forces vanishing.

**Prerequisites.** `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), Appendix A, pp. 75–76, input to Lemme A.2 (supplement; not stated in the paper). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4"></a>

## AS.4 — Declarations

Coverage: **planned**. Every stated stage target has a node, an imported owner target or a precise gap. Planned means target inventory coverage, not proof closure or implementation. The continuation and Fourier interfaces distinguish restricted test models from the general source adapters.

Atlas landmarks: Automorphic spectral transform, Automorphic Plancherel theorem, Residual spectrum, Compact quotient spectrum, GL₂ spectral expansion, Wallach cuspidality criterion.

<a id="automorphicspectraltheory-as-4-associate-parameter-fields"></a>

### Measurable associate spectral parameters

**Definition** · `AutomorphicSpectralTheory:AS.4/associate-parameter-fields`.

Proposed interface: `TauCeti.AutomorphicSpectral.associate_parameter_fields` in `TauCeti/Automorphic/Spectral/AS4`.

For each associate class 𝒫 of rational parabolics take measurable families F_P:i(𝔞_P/𝔞_G)*→H_P with F_Q(wλ)=M(w,λ)F_P(λ), and norm² Σ_{P∈𝒫}n_P⁻¹∫‖F_P(λ)‖²dλ, n_P=Σ_{Q∈𝒫}|W(𝔞_P,𝔞_Q)|. This closed symmetric subspace of the Hilbert direct sum is the quotient-free model of the measurable Weyl parameter space. Choosing Borel fundamental domains gives an equivalent quotient model with stabilizers and multiplicity spaces retained. The discrete inducing representation of each Levi includes its cuspidal and already constructed residual parts. Lebesgue measure is dual to the fixed height measure; residual atoms are not absorbed into it.

**Hypotheses and conventions.**

- Number field; countably many discrete inducing constituents at each level/K-type; compatible central quotient and unitary-axis intertwiner fields.

**Construction or proof.**

1. Use a fixed compact picture on every discrete constituent to generate a measurable Hilbert field.
2. Use the unitary cocycle to define the measurable Weyl action and the closed symmetric subspace.
3. Select finite-Weyl Borel domains and disintegrate finite orbit measures, retaining stabilizer weights.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/measurable-hilbert-field](#automorphicspectraltheory-as-0-measurable-hilbert-field), [AutomorphicSpectralTheory:AS.0/direct-integral](#automorphicspectraltheory-as-0-direct-integral), [AutomorphicSpectralTheory:AS.0/decomposable-operator](#automorphicspectraltheory-as-0-decomposable-operator), [AutomorphicSpectralTheory:AS.2/eisenstein-continuation](#automorphicspectraltheory-as-2-eisenstein-continuation), [AutomorphicSpectralTheory:AS.2/intertwiner-factorization](#automorphicspectraltheory-as-2-intertwiner-factorization).

**Uses that determine the interface.**

- **AS.4 spectral-map**: This is the precise Hilbert domain of the unitary Eisenstein integration map.
- **AS.6 spectral-integrals**: Weyl multiplicities and residual data enter the trace formula through this normalization.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.associate_parameter_fields.symmetric_norm` | characterisation | The symmetric-family norm is Σ_P n_P⁻¹∫‖F_P‖². |
| `TauCeti.AutomorphicSpectral.associate_parameter_fields.weyl_transport` | functoriality | F_P↦F_Q(wλ) is the unitary fibre transport M(w,λ), satisfying identity and composition. |
| `TauCeti.AutomorphicSpectral.associate_parameter_fields.quotient_equiv` | equivalence | A Borel orbit-domain model with the orbit/stabilizer measure is unitarily equivalent to the symmetric-family model. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.associate_parameter_fields.rank_zero` (degenerate): A constant section over the single point with n_G=1 maps to an actual field vector whose squared norm is the original squared norm.
- `TauCeti.AutomorphicSpectral.associate_parameter_fields.rank_one` (computation): For a reflected compatible section over the real parameter line with n_P=2, the actual field vector has half the full integrated squared norm.
- `TauCeti.AutomorphicSpectral.associate_parameter_fields.stabilizer_not_removed` (non-example): A nonzero vector fixed by the stabilizer operator defines a nonzero point-field vector, with the reciprocal stabilizer norm factor retained.

**Acceptance and prototype scope.**

- Do not divide by the Weyl order a second time after using the symmetric n_P model.
- Suggested model: Point and reflected-line tests evaluate the actual field-vector norm with reciprocal Weyl factor. The measurable quotient, global Weyl coherence, completion and fundamental-domain model remain required.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §7 Theorem 7.2(b), definition of L̂_𝒫. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-spectral-map"></a>

### Unitary Eisenstein spectral map

**Construction** · `AutomorphicSpectralTheory:AS.4/spectral-map` · planet: **Automorphic spectral transform**.

Proposed interface: `TauCeti.AutomorphicSpectral.spectral_map` in `TauCeti/Automorphic/Spectral/AS4`.

On smooth compactly supported symmetric associate families define U(F)=Σ_P n_P⁻¹∫E_P(g,F_P(λ),λ)dλ. Extend by the wave-packet Gram identity to the direct sum over associate classes. The resulting map is an isometry intertwining G(𝔸)¹. The spectral orthosum theorem proves it onto L²([G]¹), so its inverse, the spectral transform, is a unitary equivalence, not just an isometric embedding.

**Hypotheses and conventions.**

- Dense smooth compact spectral domain in the symmetric-family Hilbert space; all discrete Levi data are included.

**Construction or proof.**

1. Use the already constructed AS.3 packets and their Gram identity.
2. Apply the unique isometric extension theorem.
3. Use the independent onto proof before declaring the inverse spectral transform.

**Prerequisites.** [AutomorphicSpectralTheory:AS.4/associate-parameter-fields](#automorphicspectraltheory-as-4-associate-parameter-fields), [AutomorphicSpectralTheory:AS.3/eisenstein-wave-packet](#automorphicspectraltheory-as-3-eisenstein-wave-packet), [AutomorphicSpectralTheory:AS.3/wave-packet-gram](#automorphicspectraltheory-as-3-wave-packet-gram), [AutomorphicSpectralTheory:AS.0/isometric-integration-map](#automorphicspectraltheory-as-0-isometric-integration-map).

**Uses that determine the interface.**

- **AS.6 spectral-kernel**: Produces a kernel expansion from a proved complete spectral resolution.
- **AS.5 automorphic-filtration**: Locates the discrete and Eisenstein pieces used in cohomology.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.spectral_map.packet_apply` | simp | On the dense domain U equals the normalized sum of Eisenstein integrals. |
| `TauCeti.AutomorphicSpectral.spectral_map.norm` | characterisation | ‖U(F)‖²=Σ_P n_P⁻¹∫‖F_P(λ)‖². |
| `TauCeti.AutomorphicSpectral.spectral_map.right_intertwines` | compatibility | U I(g)=R(g)U; after onto completeness its inverse has the same intertwining property. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.spectral_map.cusp_component` (compatibility): The P=G cuspidal component maps identically to the AF.3 cuspidal subspace.
- `TauCeti.AutomorphicSpectral.spectral_map.zero` (degenerate): U(0)=0.
- `TauCeti.AutomorphicSpectral.spectral_map.proper_isometry` (non-example): A proper closed inclusion of Hilbert spaces satisfies the norm law but fails the required surjectivity condition.

**Acceptance and prototype scope.**

- Hecke compatibility follows from the actual induced representation action.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §7 Theorem 7.2(b). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-spectral-orthosum"></a>

### Completeness of the automorphic spectral decomposition

**Theorem** · `AutomorphicSpectralTheory:AS.4/spectral-orthosum` · planet: **Automorphic Plancherel theorem**.

Proposed interface: `TauCeti.AutomorphicSpectral.spectral_orthosum` in `TauCeti/Automorphic/Spectral/AS4`.

The isometric map U from all associate classes is onto L²([G]¹). Equivalently the closed invariant images L²_𝒫 are pairwise orthogonal and their Hilbert sum is all of L². A vector perpendicular to all wave packets is zero: project it to every elementary χ-block, apply the pseudo-Eisenstein pairing, shift the contour and include every residual contribution. Orthogonality or an isometric map alone is insufficient.

**Hypotheses and conventions.**

- All associate parabolics and all discrete inducing representations of their Levis; ordered residual terms from every crossed polar flag.

**Construction or proof.**

1. Start with the complete elementary χ-decomposition, which was proved before continuation.
2. Express its Paley–Wiener generators as contour-shifted imaginary packets plus ordered residues.
3. Induct on Levi rank to place each residue in the discrete inducing data; the orthogonal complement then annihilates every χ-generator.

**Prerequisites.** [AutomorphicSpectralTheory:AS.4/spectral-map](#automorphicspectraltheory-as-4-spectral-map), [AutomorphicSpectralTheory:AS.1/cuspidal-data-orthosum](#automorphicspectraltheory-as-1-cuspidal-data-orthosum), [AutomorphicSpectralTheory:AS.2/residue-calculus](#automorphicspectraltheory-as-2-residue-calculus).

**Acceptance and prototype scope.**

- In SL₂ the constant residual vector must occur as well as cusp forms and the Eisenstein continuum.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §7 Theorem 7.2(b), equation (7.5); §12. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-residual-spectrum"></a>

### Residual discrete automorphic spectrum

**Construction** · `AutomorphicSpectralTheory:AS.4/residual-spectrum` · planet: **Residual spectrum**.

Proposed interface: `TauCeti.AutomorphicSpectral.residual_spectrum` in `TauCeti/Automorphic/Spectral/AS4`.

Import L²_cusp and its finite-multiplicity decomposition from AF.3. Define L²_disc as the closed sum of irreducible closed invariant subrepresentations in L², and L²_res=L²_disc∩(L²_cusp)⊥. The residual construction identifies L²_res with the closed span of the nonzero square-integrable ordered Eisenstein residues from proper Levi cuspidal data. Define L²_cont=(L²_disc)⊥. These are orthogonal closed invariant spaces; a formal residue outside the L² exponent criterion is not a residual summand.

**Hypotheses and conventions.**

- The complete spectral theorem and the negative-exponent residue criterion; cuspidal space is imported rather than reconstructed.

**Construction or proof.**

1. Use contour-shift completeness and induction on Levi rank to identify discrete residual pieces.
2. Take closed orthogonal complements and retain each residual multiplicity space.

**Prerequisites.** [AutomorphicSpectralTheory:AS.4/spectral-orthosum](#automorphicspectraltheory-as-4-spectral-orthosum), [AutomorphicSpectralTheory:AS.2/residue-calculus](#automorphicspectraltheory-as-2-residue-calculus), `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-spectrum-discrete`.

**Uses that determine the interface.**

- **Franke filtration**: Discrete Levi forms, including residual ones, generate Eisenstein filtration pieces.
- **Yu residual classification**: Speh residues occupy the discrete residual branch, distinct from cuspidal data.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.residual_spectrum.orthogonal` | structure | L²_disc=L²_cusp⊕L²_res and L²=L²_disc⊕L²_cont. |
| `TauCeti.AutomorphicSpectral.residual_spectrum.residue_mem` | constructor | A nonzero ordered residue satisfying the negative-exponent criterion defines a vector in L²_res. |
| `TauCeti.AutomorphicSpectral.residual_spectrum.projection_equivariant` | functoriality | The three orthogonal projections commute with the unitary right action and every bounded integrated Hecke action. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.residual_spectrum.anisotropic` (degenerate): If G is anisotropic modulo center, there are no proper rational parabolics and L²_res=L²_cont=0.
- `TauCeti.AutomorphicSpectral.residual_spectrum.sl2_constant` (computation): The Eisenstein residue is 3/π. In a Hilbert model with discrete space equal to cusp plus an orthogonal nonzero constant line, the actual residual_spectrum is precisely that line; the modular spectral theorem must establish the model hypotheses.
- `TauCeti.AutomorphicSpectral.residual_spectrum.non_l2_pole` (non-example): For a surviving cusp power y^a with a≥1/2, there is no L² representative for the hyperbolic cusp measure, so the power cannot be a vector in any L² residual subspace.

**Acceptance and prototype scope.**

- The words discrete and cuspidal are not synonymous.
- Suggested model: The constant-line test assumes the supplied discrete/cusp decomposition and orthogonality. The modular residue/completeness theorem must establish those hypotheses; an arbitrary pole still cannot be declared a residual vector.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §7 and §12 contour residues. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-discrete-finite-multiplicity"></a>

### Finite multiplicity in the discrete spectrum

**Theorem** · `AutomorphicSpectralTheory:AS.4/discrete-finite-multiplicity`.

Proposed interface: `TauCeti.AutomorphicSpectral.discrete_finite_multiplicity` in `TauCeti/Automorphic/Spectral/AS4`.

Every irreducible unitary automorphic representation occurs in L²_disc([G]¹) with finite multiplicity. At fixed compact open finite level, finite K∞-type set and fixed infinitesimal character, the corresponding discrete automorphic space is finite dimensional. The cuspidal part is supplied by AF.3; the new conclusion concerns residual constituents, their finite multiplicity and the combination. This does not assert that the whole residual Hilbert space is finite dimensional.

**Hypotheses and conventions.**

- Fixed central character and the number-field quotient; finite level, K-types and infinitesimal character only in the finite-dimensional clause.

**Construction or proof.**

1. Import cusp finite multiplicity.
2. Use finite-dimensional automorphic spaces at the fixed parameters and the ordered-residue construction to bound residual multiplicity.
3. Combine the discrete decomposition with the finite-dimensional fixed-parameter criterion.

**Prerequisites.** [AutomorphicSpectralTheory:AS.4/residual-spectrum](#automorphicspectraltheory-as-4-residual-spectrum), `AutomorphicFormsOnReductiveGroups:AF.2`, `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-spectrum-discrete`.

**Acceptance and prototype scope.**

- Countably infinitely many discrete representations are compatible with finite multiplicity of each.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §7 discrete decomposition and §12. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-hecke-central-compatibility"></a>

### Hecke and central-character spectral compatibility

**Theorem** · `AutomorphicSpectralTheory:AS.4/hecke-central-compatibility`.

Proposed interface: `TauCeti.AutomorphicSpectral.hecke_central_compatibility` in `TauCeti/Automorphic/Spectral/AS4`.

For an L¹ compactly supported finite Hecke test h, U⁻¹R(h)U is the decomposable field I_P(λ,h) and ‖R(h)‖≤‖h‖₁. The field preserves the associate symmetry and all cusp/residual/continuous projections. Restricting to a fixed unitary central character uses the matching induced central character and quotient measures. Twisting by a unitary global character transports the spectral decomposition and Haar data; a nonunitary twist requires the corresponding change of weighted Hilbert norm and is not asserted as unitary on the original space.

**Hypotheses and conventions.**

- The transform is onto; h has finite level and integrable compact support; the central character is unitary in the L² model.

**Construction or proof.**

1. Integrate the right-equivariance identity on the dense packet domain.
2. Use the L¹ operator bound and decomposable-operator extension.
3. Disintegrate the center or fix the quotient centrally at the start; compare character twists.

**Prerequisites.** [AutomorphicSpectralTheory:AS.4/spectral-orthosum](#automorphicspectraltheory-as-4-spectral-orthosum), [AutomorphicSpectralTheory:AS.4/residual-spectrum](#automorphicspectraltheory-as-4-residual-spectrum), [AutomorphicSpectralTheory:AS.0/decomposable-operator](#automorphicspectraltheory-as-0-decomposable-operator), `SmoothRepresentationsOfLocalGroups:SR.1`, `AdelicAlgebraicGroups:AA.2/quotient-norm-one-comparison`.

**Acceptance and prototype scope.**

- Do not confuse the A_G(ℝ)⁰ quotient with quotienting every archimedean central factor.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §7 representation decomposition and §§12,15. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-compact-quotient-spectrum"></a>

### Compact quotient discrete spectral specialization

**Theorem** · `AutomorphicSpectralTheory:AS.4/compact-quotient-spectrum` · planet: **Compact quotient spectrum**.

Proposed interface: `TauCeti.AutomorphicSpectral.compact_quotient_spectrum` in `TauCeti/Automorphic/Spectral/AS4`.

For a cocompact lattice Γ in a real reductive G with fixed central quotient and finite level as appropriate, L²(Γ\G) is a discrete Hilbert sum of irreducible unitary representations with finite multiplicities. Smooth compactly supported convolution is trace class and admits its smooth periodized kernel. This allows Γ\G compact while G itself is noncompact; compact-group Peter–Weyl supplies the distinct Γ={1}, G compact specialization. On a finite-volume noncompact quotient, arbitrary full-space convolution need not be trace class.

**Hypotheses and conventions.**

- Cocompact lattice and actual quotient measure; smooth compact test; admissible real representation theory; central quotient removes any noncompact split-center direction.

**Construction or proof.**

1. Use smooth periodization on the compact quotient and factor a smoothing operator into two HS operators via compact-quotient Sobolev estimates.
2. Apply the compact-operator spectral theorem to a family of smoothing convolution operators and admissibility for finite multiplicity.
3. Compare the genuinely compact-group case with the pinned Peter–Weyl basis.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/hilbert-schmidt](#automorphicspectraltheory-as-0-hilbert-schmidt), [AutomorphicSpectralTheory:AS.0/trace-class](#automorphicspectraltheory-as-0-trace-class), [AutomorphicSpectralTheory:AS.0/kernel-trace-diagonal](#automorphicspectraltheory-as-0-kernel-trace-diagonal), `AdelicAlgebraicGroups:AA.3/arithmetic-quotient-compact`, `AutomorphicFormsOnReductiveGroups:AF.1`, [tauceti:TauCeti.stdPeterWeylBasis](#tauceti-tauceti-stdpeterweylbasis), [tauceti:IsCompactOperator.finiteDimensional_eigenspace](#tauceti-iscompactoperator-finitedimensional-eigenspace).

**Acceptance and prototype scope.**

- A compact hyperbolic surface Γ\PSL₂(ℝ) is not obtained by applying compact-group Peter–Weyl to PSL₂(ℝ).

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §§3–4 compact quotient trace formula; PDF page 8. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-4-gl2-spectral-expansion"></a>

### GL₂ modular spectral expansion

**Theorem** · `AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion` · planet: **GL₂ spectral expansion**.

Proposed interface: `TauCeti.AutomorphicSpectral.gl2_spectral_expansion` in `TauCeti/Automorphic/Spectral/AS4`.

On PSL₂(ℤ)\ℍ with dμ=dx dy/y², Δ=−y²(∂ₓ²+∂ᵧ²) has constant eigenvector, a countable orthogonal cusp spectrum and continuous generalized eigenfunctions E(z,1/2+it). For f∈C_c∞, f=3π⁻¹∫f dμ+Σ_φ⟪φ,f⟫φ/‖φ‖²+(4π)⁻¹∫_ℝ⟪E(·,1/2+it),f⟫E(z,1/2+it)dt, in L² and locally uniformly. A level subgroup has one Eisenstein family per cusp and its scattering matrix, not the one-cusp formula unchanged. Cusp eigenvalues can be denoted 1/4+r² with r real or purely imaginary; the general spectral theorem does not remove exceptional eigenvalues.

**Hypotheses and conventions.**

- Compact smooth f; one-cusp full modular group in the displayed formula; orthogonal nonzero cusp eigenvectors; standard E normalization.

**Construction or proof.**

1. Specialize the unitary spectral transform and dual measure to the rank-one real parameter.
2. Identify the residual constant by the s=1 Eisenstein pole and vol=π/3.
3. Use elliptic/Sobolev estimates to upgrade smooth compact input from L² to locally uniform convergence.

**Prerequisites.** [AutomorphicSpectralTheory:AS.4/spectral-orthosum](#automorphicspectraltheory-as-4-spectral-orthosum), [AutomorphicSpectralTheory:AS.4/residual-spectrum](#automorphicspectraltheory-as-4-residual-spectrum), [AutomorphicSpectralTheory:AS.2/eisenstein-continuation](#automorphicspectraltheory-as-2-eisenstein-continuation), `QSeriesPartitionsAndMockModularForms:QM.3/weight-k-hyperbolic-laplacian`.

**Acceptance and prototype scope.**

- The continuous measure is dt/(4π); omitting the constant residual vector loses completeness.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5 equations (5.1)–(5.6). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-modular-weyl-estimates"></a>

### Modular Weyl law and spectral summability

**Theorem** · `AutomorphicSpectralTheory:AS.4/modular-weyl-estimates`.

Proposed interface: `TauCeti.AutomorphicSpectral.modular_weyl_estimates` in `TauCeti/Automorphic/Spectral/AS4`.

For the full modular cusp spectrum counted with multiplicity, N(X)=#{φ:λ_φ≤X}∼X/12. For compactly supported smooth f, its cusp and Eisenstein coefficients decrease faster than every fixed inverse spectral power after repeated integration by parts with Δ; on compact z-sets the eigenfunction/Eisenstein bounds and Weyl counting make the spectral expansion absolutely summable after sufficiently many derivatives. These estimates justify the hyperbolic Weyl-integral pairings for the compact core; cusp-end integrals require their separate endpoint bounds.

**Hypotheses and conventions.**

- Actual spectral values λ_φ; no assertion λ_φ>1/4 is used; fixed compact z-set and fixed smooth f.

**Construction or proof.**

1. Use the modular Weyl law with vol/(4π)=1/12.
2. Move powers of Δ onto f to bound spectral coefficients.
3. Combine local eigenfunction bounds, scattering bounds and spectral counting for normal convergence.

**Prerequisites.** [AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion](#automorphicspectraltheory-as-4-gl2-spectral-expansion).

**Acceptance and prototype scope.**

- An approximation to a characteristic function is first made smooth; raw discontinuous input is not assigned rapid coefficient decay.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5 equation (5.10) and paragraph after (5.11). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-wallach-cuspidality"></a>

### Wallach tempered cuspidality criterion

**Theorem** · `AutomorphicSpectralTheory:AS.4/wallach-cuspidality` · planet: **Wallach cuspidality criterion**.

Proposed interface: `TauCeti.AutomorphicSpectral.wallach_cuspidality` in `TauCeti/Automorphic/Spectral/AS4`.

For a semisimple real group arising from a Q-group and an arithmetic lattice Γ as in Wallach, any (𝔤,K)-homomorphism from a tempered Harish-Chandra module V into A(Γ\G)∩L²(Γ\G) has cuspidal image. Consequently a square-integrable automorphic representation with tempered archimedean component is cuspidal in this setting. For a general reductive group and an essentially tempered archimedean component, first remove the specified positive central twist and pass to the finite-volume central quotient; the transfer of this criterion requires a separate central-reduction proof.

**Hypotheses and conventions.**

- Wallach Theorem 4.3’s arithmetic semisimple setting; the essentially tempered central extension is distinguished as an additional adaptation.

**Construction or proof.**

1. Expand each constant term into finite exponent-polynomial terms using Jacquet exponents.
2. Temperedness puts their real exponents at or above the critical boundary, while L² imposes strict decay.
3. The incompatible inequalities force every proper constant term to vanish.

**Prerequisites.** `AutomorphicFormsOnReductiveGroups:AF.1`, `AutomorphicFormsOnReductiveGroups:AF.3/constant-term`, [AutomorphicSpectralTheory:AS.4/residual-spectrum](#automorphicspectraltheory-as-4-residual-spectrum).

**Acceptance and prototype scope.**

- L² alone allows residual representations; temperedness at infinity rules them out in the stated setting.

**Sources.**

- [Nolan R. Wallach, On the Constant Term of a Square Integrable Automorphic Form](https://mathweb.ucsd.edu/~nwallach/tempered-cuspidal.pdf), §4 Theorem 4.3 and its proof pp.233–234. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-yu-017"></a>

### Discrete spherical spectrum

**Definition** · `AutomorphicSpectralTheory:AS.4/yu-017`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_017` in `TauCeti/Automorphic/Spectral/AS4`.

For a fixed central character theta, use the paper's |theta|-weighted L² norm on the central quotient and take irreducible spherical constituents of the discrete subspace. Cuspidal constituents are discrete; residual constituents must not be discarded.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Choose a fundamental domain for the scalar degree subgroup and descend functions using the specified unitary central twist.
2. Define the inner product by the quotient integral; absolute-square invariance makes it independent of representative.
3. Take the discrete Hilbert summand supplied by the function-field automorphic owner, preserving its spherical finite-dimensional subspace and unitary twist equivalence.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/yu-010](#automorphicspectraltheory-as-1-yu-010), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Uses that determine the interface.**

- **PAPER-YU-23/018**: Input to Discrete pairs, their equivalence and stabilizers.
- **PAPER-YU-23/020**: Input to Moeglin–Waldspurger classification.
- **PAPER-YU-23/060**: Input to Induced spherical sections with a fixed normalization.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_017.weightedNorm` | constructor | use theta's absolute-value normalization |
| `TauCeti.AutomorphicSpectral.yu_017.discreteSubspace` | compatibility | separate discrete from continuous spectral pieces |
| `TauCeti.AutomorphicSpectral.yu_017.cuspidalInclusion` | structure | embed cuspidal constituents without identifying them with all discrete ones |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_017.test1` (non-example): In the constant-line model the vector one lies in the constructed discrete span and residual_spectrum, and its actual yu_017 point-quotient norm is one. The GL₂ automorphic embedding remains a supplier obligation.
- `TauCeti.AutomorphicSpectral.yu_017.test2` (compatibility): For |theta|=1 the |theta|-weighted integrand equals |phi|².
- `TauCeti.AutomorphicSpectral.yu_017.test3` (characterisation): When the section and its weight transform by the same nonzero central character, the actual integrated yu_017 norm is unchanged under central translation.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.
- Suggested model: The constant-line discrete/residual test is a point-quotient specialization. The actual automorphic quotient, central character and GL₂ residual embedding are supplied by AA/AF and the Langlands residue theorem.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §2.3.3, pp. 10–11, Définition 2.3.4 and the definition of L²(M_P(F)\M_P(A))_θ^K. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-yu-018"></a>

### Discrete pairs, their equivalence and stabilizers

**Definition** · `AutomorphicSpectralTheory:AS.4/yu-018`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_018` in `TauCeti/Automorphic/Spectral/AS4`.

A pair (P,pi) has standard P and a discrete spherical representation of M_P, with central character trivial on Xi_M. Quotient by Weyl transport and unramified twists in X_M^G; stab(P,pi) comprises the corresponding pairs (w,lambda).

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Pair a standard parabolic with a discrete inducing representation and transport pairs by the restricted Weyl maps and unramified twists.
2. Compose these transports as a genuine action, including the Weyl action on the character tuple.
3. Define stab(P,π) by the equation w(π⊗τ)=π. Identity, inverses and composition follow from that action; the representation identification is part of the transport.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/yu-010](#automorphicspectraltheory-as-1-yu-010), [AutomorphicSpectralTheory:AS.4/yu-017](#automorphicspectraltheory-as-4-yu-017), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Uses that determine the interface.**

- **PAPER-YU-23/019**: Input to Good representatives of discrete pairs.
- **PAPER-YU-23/024**: Input to Truncated geometric kernel and fixed-degree trace.
- **PAPER-YU-23/060**: Input to Induced spherical sections with a fixed normalization.
- **PAPER-YU-23/063**: Input to Corrected Arthur–Lafforgue spectral expression.
- **PAPER-YU-23/091**: Input to Cuspidal stabilizer strata.
- **PAPER-YU-23/151**: Input to Typed finite-fibre operator trace.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_018.pair` | constructor | construct standard-parabolic discrete data |
| `TauCeti.AutomorphicSpectral.yu_018.weylTwistEquiv` | compatibility | transport both the parabolic and coefficient representation |
| `TauCeti.AutomorphicSpectral.yu_018.stabilizer` | structure | record the Weyl element and its compensating character |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_018.test1` (degenerate): (1,1) belongs to stab(P,pi).
- `TauCeti.AutomorphicSpectral.yu_018.test2` (characterisation): (w,tau) is in the stabilizer precisely when w normalizes M and w(pi⊗tau)=pi.
- `TauCeti.AutomorphicSpectral.yu_018.test3` (compatibility): The inverse stabilizer element of (w,tau) is (w⁻¹,w(tau)⁻¹), in the convention of Yu (5.2.11).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §2.3.3 pp11–12. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-yu-019"></a>

### Good representatives of discrete pairs

**Construction** · `AutomorphicSpectralTheory:AS.4/yu-019`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_019` in `TauCeti/Automorphic/Spectral/AS4`.

Choose pi=⊗_i Π_i^⊗mi with equal representatives of each inertial class and distinct classes for distinct i. Then stabilizers split into permutations of equal factors and their twist stabilizers. These choices are required in the zero/pole and cycle computations.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Use the discrete GL classification to write the inducing representation as a tensor of repeated blocks from finitely many cuspidal inertial classes.
2. Choose one representative in each inertial class and order equal blocks together; inequivalent classes cannot be permuted into one another by a twist.
3. Show that the resulting stabilizer separates the block permutations from the individual unramified fix groups; the good-representative hypothesis is essential for this product description.

**Prerequisites.** [AutomorphicSpectralTheory:AS.4/yu-018](#automorphicspectraltheory-as-4-yu-018), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Uses that determine the interface.**

- **PAPER-YU-23/057**: Input to Rankin–Selberg normalizing factors.
- **PAPER-YU-23/069**: Input to Residual Rankin–Selberg product and zero–pole index.
- **PAPER-YU-23/070**: Input to Cyclic character fibres.
- **PAPER-YU-23/083**: Input to Cycle-block Laplacian data.
- **PAPER-YU-23/089**: Input to Regrouping residual data into cuspidal data.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_019.groupEqualTypes` | constructor | choose one representative of each inertial class |
| `TauCeti.AutomorphicSpectral.yu_019.cycleData` | compatibility | decompose stabilizing permutations on multiplicity blocks |
| `TauCeti.AutomorphicSpectral.yu_019.stabilizerCard` | structure | compute factorial and twist factors |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_019.test1` (computation): Two raw representations in the same inertial class have equal chosen representatives under yu_019, so their distinguished tuple is fixed by transposition.
- `TauCeti.AutomorphicSpectral.yu_019.test2` (non-example): For two distinct inertial classes and a representative section of the class map, transposition does not fix the actual distinguished tuple.
- `TauCeti.AutomorphicSpectral.yu_019.test3` (characterisation): On the distinguished tuple, the actual Weyl/twist stabilizer is the product of permutation and twist stabilizers when twisting preserves inertial classes; no equality of arbitrary sets is assumed.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §2.3.3, p. 12 ('bon représentant'); used in §6.2.1 and §6.4.1. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-yu-020"></a>

### Moeglin–Waldspurger classification

**Theorem** · `AutomorphicSpectralTheory:AS.4/yu-020`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_020` in `TauCeti/Automorphic/Spectral/AS4`.

(Moeglin–Waldspurger, [MW89, Théorème p. 606].) Let Π be a discrete everywhere-unramified automorphic representation of G_n(A). There are d | n, the standard parabolic P with M_P = G_d × ⋯ × G_d (ν = n/d factors), and an everywhere-unramified cuspidal representation π of G_d(A) such that, with |g| = q^{deg det g} and π̃ = π|·|^{(ν−1)/2} ⊗ π|·|^{(ν−3)/2} ⊗ ⋯ ⊗ π|·|^{−(ν−1)/2}, Π ≅ π̃ as H_G-modules via t_P at every place. The pair (π, ν) is unique. Conversely, for every everywhere-unramified cuspidal π of G_d(A) and every ν ≥ 1, π̃ viewed as an H_G-module via t_P is isomorphic to the H_G-module of a discrete everywhere-unramified representation of G_{νd}(A), denoted π ⊠ ν.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Import the residual-spectrum classification.
2. Normalize each cuspidal segment symmetrically, take the spherical Langlands quotient, and use uniqueness of cuspidal support to distinguish its length and cuspidal input.
3. The original MW89 proof remains unread..

**Prerequisites.** [AutomorphicSpectralTheory:AS.4/yu-017](#automorphicspectraltheory-as-4-yu-017), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §2.3.4, p. 12, Théorème 2.3.6 (the theorem is on p. 12 only). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-yu-021"></a>

### Residual twist stabilizers

**Theorem** · `AutomorphicSpectralTheory:AS.4/yu-021`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_021` in `TauCeti/Automorphic/Spectral/AS4`.

Fix(pi box ν)≅Fix(pi). Two such discrete constituents are inertially equivalent exactly when their ν agree and their cuspidal inputs are inertially equivalent.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Twisting commutes with normalized induction and its unique spherical quotient.
2. Uniqueness of the cuspidal support recovers the segment length and cuspidal input, giving both directions of the stabilizer comparison..

**Prerequisites.** [AutomorphicSpectralTheory:AS.4/yu-020](#automorphicspectraltheory-as-4-yu-020), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), Proposition 2.3.7 p13. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-yu-065"></a>

### A stabilizing twist fixes the spherical function

**Theorem** · `AutomorphicSpectralTheory:AS.4/yu-065`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_065` in `TauCeti/Automorphic/Spectral/AS4`.

If lambda_pi∈Fix(pi), multiplication by lambda_pi acts as the identity on A_(P,pi). First evaluate the scalar at a degree-zero nonvanishing point for cuspidal pi; extend to residual pi by the Eisenstein residue construction. On the full smooth G(A)-span it is an intertwiner, not generally the identity.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. On the spherical cuspidal line a stabilizing twist is a scalar; evaluate it at the degree-zero nonvanishing point of item64 to show that scalar is one.
2. For a residual representation take compatible Eisenstein residues.
3. This conclusion is only on the indicated spherical section space..

**Prerequisites.** [AutomorphicSpectralTheory:AS.4/yu-020](#automorphicspectraltheory-as-4-yu-020), [AutomorphicSpectralTheory:AS.4/yu-021](#automorphicspectraltheory-as-4-yu-021), [AutomorphicSpectralTheory:AS.1/yu-060](#automorphicspectraltheory-as-1-yu-060), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), Proposition5.3.1 andRemark5.3.2 pp36–39. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-yu-166"></a>

### Residual discrete forms are residues of cuspidal Eisenstein series

**Theorem** · `AutomorphicSpectralTheory:AS.4/yu-166`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_166` in `TauCeti/Automorphic/Spectral/AS4`.

(Langlands; Moeglin–Waldspurger 1994, V.3.13(iii).) Let π be an everywhere-unramified discrete, non-cuspidal automorphic representation of G_n(A). For every φ in π there are a discrete pair (P',π') all of whose factors are cuspidal, a cuspidal φ' in A_{P',π'} and a point λ' in X_{P'}^G such that φ(g)=Res_{λ'}E(φ',·)(g) for all g in G(A), where E(φ',λ) is the Eisenstein series of φ' (MW94 II.1.5) and Res_{λ'} is an iterated residue operator at λ'. Moreover E(φ'λ0,λ)=λ0·E(φ',λ) for λ0 in X_G^G.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Write the discrete GL constituent as the residual representation attached to the unique cuspidal MW datum.
2. Choose the appropriate cuspidal Eisenstein family, continue it in the simple-root parameters and take the prescribed iterated residue.
3. Use the classification’s nonzero residue identification on the spherical space; transport the character multiplication and section normalization through that residue to extend the cuspidal argument of Proposition5.3.1.

**Prerequisites.** `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [AutomorphicSpectralTheory:AS.4/yu-020](#automorphicspectraltheory-as-4-yu-020), [AutomorphicSpectralTheory:AS.2/yu-061](#automorphicspectraltheory-as-2-yu-061), [AutomorphicSpectralTheory:AS.1/yu-060](#automorphicspectraltheory-as-1-yu-060).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §5.3.1, pp. 38–39, proof of Proposition 5.3.1 (citing [MW94, V.3.13(iii)] and [MW94, II.1.5]). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-dit-138"></a>

### Cusp decay for the Stokes input

**Theorem** · `AutomorphicSpectralTheory:AS.4/dit-138`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_138` in `TauCeti/Automorphic/Spectral/AS4`.

For u=E(z,1/2+it), its derivative constant terms are O(Y^(−1/2)) for fixed t, with the t=0 limit treated separately; nonconstant terms decay exponentially. Cusp forms have exponential decay. Hence the horizontal derivative integral tends to0 and u is absolutely integrable on each finite-width core cusp.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Insert the Eisenstein Fourier expansion on each horizontal cusp segment of the quadratic core.
2. Integrate the nonzero Fourier modes over x and bound the remaining y-integrals using K-Bessel decay and the compactly controlled constant term.
3. Combine the finitely many cusp tails with the compact core to obtain the stated y-integral growth/absolute-integrability bound.

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/dit-59](#automorphicspectraltheory-as-2-dit-59), [AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion](#automorphicspectraltheory-as-4-gl2-spectral-expansion).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Lemma1 proof, p972. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-dit-wrong-sign-weyl-integrals-vanish"></a>

### Vanishing of the Weyl integrals of the wrong sign

**Theorem** · `AutomorphicSpectralTheory:AS.4/dit-wrong-sign-weyl-integrals-vanish`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_wrong_sign_weyl_integrals_vanish` in `TauCeti/Automorphic/Spectral/AS4`.

Let D>0 be a fundamental discriminant, D=d′d a factorization into fundamental discriminants with genus character χ, and u either E(z,s) with Re(s)=1/2 or ⟨φ,φ⟩^{−1}φ for a Hecke–Maass cusp form φ (λ its eigenvalue). If d′,d>0 then Σ_{A∈Cl⁺(K)} χ(A)(λ/2)∫_{F_A}u dμ = 0 (this includes the trivial character d′=1). If d′,d<0 then Σ_{A∈Cl⁺(K)} χ(A)∫_{∂F_A}u y^{−1}|dz| = 0.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.

**Construction or proof.**

1. Use the orientation/reversal and genus-character symmetry supplied by the period owner.
2. Pair each cycle or core contribution with its involuted term; parity gives the stated sign cancellation.

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/dit-59](#automorphicspectraltheory-as-2-dit-59), [AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion](#automorphicspectraltheory-as-4-gl2-spectral-expansion).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5, p963, paragraph after (5.12). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-4-dit-eisenstein-integrable-over-core"></a>

### Absolute integrability of E(z,s) over F_A on the critical line

**Theorem** · `AutomorphicSpectralTheory:AS.4/dit-eisenstein-integrable-over-core`.

Proposed interface: `TauCeti.AutomorphicSpectral.dit_eisenstein_integrable_over_core` in `TauCeti/Automorphic/Spectral/AS4`.

For Re(s)=1/2, E(z,s) is absolutely integrable over F_A with respect to dμ=y^{−2}dxdy.

**Hypotheses and conventions.**

- Γ=PSL₂(ℤ), positive Laplacian Δ=−y²(∂x²+∂y²), dμ=dxdy/y²; e(x)=exp(2πix).
- The parameter, sign, nonzero-index and boundary assumptions in the statement are retained; ⟪u,v⟫ is conjugate-linear in u.
- The imported core has a compact part and finitely many cusp ends of finite width; use the geometric carrier supplied by the Fuchsian-orbifold Part II route. At removable points use the continued value of E.

**Construction or proof.**

1. On the compact part use smoothness of the continued Eisenstein series.
2. In each finite-width cusp use the constant term y^s+φ(s)y^(1−s) and the exponentially decaying K-Bessel nonconstant terms from (5.3). On Re(s)=1/2 the bound is O(y^(1/2)(1+log y)), allowing a coalescing constant-term limit.
3. Multiply by dx dy/y² and integrate: ∫_Y^∞ y^(−3/2)(1+log y)dy is finite. Sum over the finitely many ends. This is an L¹ argument and does not require an individual Eisenstein series in L².

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/dit-59](#automorphicspectraltheory-as-2-dit-59), [AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion](#automorphicspectraltheory-as-4-gl2-spectral-expansion).

**Acceptance and prototype scope.**

- Keep the named coefficient normalization and all domain restrictions; use limits at meromorphic exceptional parameters.

**Sources.**

- [William Duke, Özlem İmamoğlu and Árpád Tóth, Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5, p963 ('by (5.3)'). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-5"></a>

## AS.5 — Declarations

Coverage: **planned**. Every stated stage target has a node, an imported owner target or a precise gap. Planned means target inventory coverage, not proof closure or implementation. The continuation and Fourier interfaces distinguish restricted test models from the general source adapters.

Atlas landmarks: Weighted L² complexes, Finite-character functor, Franke filtration, Franke comparison theorem, Cuspidal-support decomposition.

<a id="automorphicspectraltheory-as-5-weighted-l2-complex"></a>

### Weighted L² de Rham complexes

**Definition** · `AutomorphicSpectralTheory:AS.5/weighted-l2-complex` · planet: **Weighted L² complexes**.

Proposed interface: `TauCeti.AutomorphicSpectral.weighted_l2_complex` in `TauCeti/Automorphic/Spectral/AS5`.

On X_K=G(F)\G(𝔸)/(A_G(ℝ)⁰K∞K_f), with an algebraic coefficient local system E and its invariant metric, an admissible positive smooth weight p satisfies |Dp|≤C_D p for every archimedean differential operator. Define L_p^q(E)={measurable E-valued q-forms ω: pω∈L² and p dω∈L²}, where dω is the distributional local-system derivative. Give it the graph norm and differential d. The union over sufficiently decreasing exponential Siegel weights computes ordinary de Rham cohomology; the single weight p=1 instead gives an L² complex. Use p_λ comparable to exp(λ(H(g))) on Siegel sets and eventually N_P-invariant in the deep P-cusp.

**Hypotheses and conventions.**

- Neat finite level or the orbifold variant with its stabilizer conventions; finite-dimensional algebraic E; fixed quotient measure and metric; d interpreted distributionally.

**Construction or proof.**

1. Construct p_λ by the locally finite reduction-theoretic partition in Franke §2.1.
2. Use the distributional derivative domain to obtain d²=0 without requiring every form initially smooth.
3. Compare the decreasing-weight union locally with currents on the Borel–Serre charts.

**Prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison`, `AdelicAlgebraicGroups:AA.3/adelic-height`, [AutomorphicSpectralTheory:AS.0/distribution-convergence](#automorphicspectraltheory-as-0-distribution-convergence).

**Uses that determine the interface.**

- **Franke Theorem 18**: Decreasing weights provide the comparison with all smooth ordinary-cohomology classes.
- **AS.5 regularization**: A smoothing homotopy must preserve these graph domains.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.weighted_l2_complex.domain` | characterisation | ω lies in L_p^q iff pω and its distributional p dω are L². |
| `TauCeti.AutomorphicSpectral.weighted_l2_complex.weight_comparison` | functoriality | If p≤Cq, there is a continuous complex inclusion L_q^•→L_p^•. |
| `TauCeti.AutomorphicSpectral.weighted_l2_complex.d_squared` | relation | The distributional derivative squares to zero on the graph domain. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.weighted_l2_complex.unit_weight` (compatibility): For p=1 this is the maximal L² de Rham graph complex.
- `TauCeti.AutomorphicSpectral.weighted_l2_complex.rank_zero` (degenerate): On a compact quotient all admissible weights bounded above and below give the same form domain and cohomology.
- `TauCeti.AutomorphicSpectral.weighted_l2_complex.cusp_power` (computation): For the power vector y^a, weight y^b and its actual radial differential ay^a, membership in the named graph domain is equivalent to a+b<1/2; the critical boundary fails membership.

**Acceptance and prototype scope.**

- The ordinary-cohomology comparison uses the union of weights, not just p=1.
- Suggested model: The cusp test specifies the actual differential of the power vector. The degree-changing weak exterior derivative and weighted Sobolev graph topology are ALS/AF interfaces, not consequences of a scalar function carrier.

**Sources.**

- [Jens Franke, Harmonic Analysis in Weighted L²-Spaces](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf), §2.1 (1)–(7); §2.2 current comparison. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-5-weighted-regularization"></a>

### Weighted regularization and relative cochains

**Theorem** · `AutomorphicSpectralTheory:AS.5/weighted-regularization`.

Proposed interface: `TauCeti.AutomorphicSpectral.weighted_regularization` in `TauCeti/Automorphic/Spectral/AS5`.

At every admissible weight p the smooth all-derivative weighted forms compute the distributional graph-complex cohomology. On fixed finite K-types, regularization by convolution and the Casimir/Sobolev homotopies preserve equivalent weights and induce quasi-isomorphisms. Passing through finite level and the decreasing-weight union identifies the complex with the relative (𝔪_G,K∞) cochains of uniformly moderate-growth smooth functions, tensor E and the required central balancing twist. The topological/de Rham comparison itself is imported from ALS.5.

**Hypotheses and conventions.**

- Admissible derivative bounds on p; algebraic E; 𝔪_G=𝔤_ℂ/𝔞_G,ℂ; use the full possibly disconnected K∞.

**Construction or proof.**

1. Apply Franke Theorems 2–3 to weighted smoothing and its homotopy.
2. Use the finite K-type Sobolev comparison of §2.3.
3. Identify differential forms with relative cochains and track the split-central coefficient twist.

**Prerequisites.** [AutomorphicSpectralTheory:AS.5/weighted-l2-complex](#automorphicspectraltheory-as-5-weighted-l2-complex), `AutomorphicFormsOnReductiveGroups:AF.1a/relative-lie-cochain-complex`, `ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison`.

**Acceptance and prototype scope.**

- A smoothing operator alone is insufficient: the cochain homotopy and weight-domain control are part of the result.

**Sources.**

- [Jens Franke, Harmonic Analysis in Weighted L²-Spaces](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf), §§2.2–2.3 and §3 Theorems 2–3. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-5-finite-character-functor"></a>

### Finite-infinitesimal-character functor

**Definition** · `AutomorphicSpectralTheory:AS.5/finite-character-functor` · planet: **Finite-character functor**.

Proposed interface: `TauCeti.AutomorphicSpectral.finite_character_functor` in `TauCeti/Automorphic/Spectral/AS5`.

Let Z=Z(U(𝔪_G)) and J⊂Z a finite-codimension ideal. For a (𝔤,K)-module V define Fin_J(V)=⋃_{n≥1}{v:J^n v=0}, equivalently the filtered union Hom_Z(Z/J^n,V). It is a left-exact functor; R^i Fin_J(V)=colim_n Ext_Z^i(Z/J^n,V) with the compatible (𝔤,K) structure. The central algebra and infinitesimal characters are imported from AF.1; this node owns the uniform-ideal torsion functor rather than a second infinitesimal-character carrier.

**Hypotheses and conventions.**

- Complex Harish-Chandra category; J finite codimensional; the category’s injective resolution and compatible central action are specified.

**Construction or proof.**

1. Use ideals J^n to construct nested annihilator submodules.
2. Apply filtered-colimit exactness and the injective-preservation statement of Franke Theorem 7.

**Prerequisites.** `AutomorphicFormsOnReductiveGroups:AF.1/infinitesimal-character`, [mathlib:Module.AEval'](#mathlib-module-aeval), [mathlib:Module.AEval'.X_smul_of](#mathlib-module-aeval--x-smul-of).

**Uses that determine the interface.**

- **Franke Theorem 16**: Acyclicity is for the derived Fin_J functor on weighted smooth spaces.
- **Franke Theorem 18**: Taking J=Ann(E∨) gives the automorphic ordinary-cohomology comparison.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.finite_character_functor.mem_iff` | characterisation | v∈Fin_J(V) iff J^n v=0 for some n. |
| `TauCeti.AutomorphicSpectral.finite_character_functor.map` | functoriality | A central-compatible module map restricts to Fin_J, preserving identity and composition. |
| `TauCeti.AutomorphicSpectral.finite_character_functor.left_exact` | structure | For 0→U→V→W, 0→Fin_J(U)→Fin_J(V)→Fin_J(W) is exact at the first two terms. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.finite_character_functor.zero_ideal` (degenerate): For J=0, Fin_J(V)=V.
- `TauCeti.AutomorphicSpectral.finite_character_functor.unit_ideal` (degenerate): For J=Z, Fin_J(V)=0.
- `TauCeti.AutomorphicSpectral.finite_character_functor.nilpotent_jordan` (computation): On the actual polynomial module defined by the size-two nilpotent Jordan operator, finite_character_functor for (X) is the whole module, although X does not annihilate every vector.

**Acceptance and prototype scope.**

- Being killed pointwise by some power is distinct from one power killing the entire module.

**Sources.**

- [Jens Franke, Harmonic Analysis in Weighted L²-Spaces](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf), §4 definition before Theorem 7 and Theorem 7(1)–(2). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-5-derived-finite-character"></a>

### Derived finite-character and coefficient comparison

**Theorem** · `AutomorphicSpectralTheory:AS.5/derived-finite-character`.

Proposed interface: `TauCeti.AutomorphicSpectral.derived_finite_character` in `TauCeti/Automorphic/Spectral/AS5`.

The finite-character functor preserves injective (𝔤,K)-modules and its derived functors are the filtered Ext groups stated above. If E is a finite-dimensional (𝔤,K)-module and J=Ann_Z(E∨), inclusion Fin_J(V)→V induces the relative-cohomology comparison once V is Fin_J-acyclic; in general the comparison is the derived one, with the spectral sequence for R^iFin_J(V), not an unconditional underived equality.

**Hypotheses and conventions.**

- Finite-dimensional E and J=Ann_Z(E∨); derived resolutions in the actual Harish-Chandra module category.

**Construction or proof.**

1. Use the exact induction/restriction adjunctions of §4 to preserve injectives.
2. Compute derived torsion as filtered Ext and compare with relative cochains by the central annihilator.

**Prerequisites.** [AutomorphicSpectralTheory:AS.5/finite-character-functor](#automorphicspectraltheory-as-5-finite-character-functor), `AutomorphicFormsOnReductiveGroups:AF.1a/relative-cohomology-functoriality`.

**Acceptance and prototype scope.**

- Without acyclicity a higher derived term cannot be dropped.

**Sources.**

- [Jens Franke, Harmonic Analysis in Weighted L²-Spaces](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf), §4 Theorem 7 and equation (4.4). The printed Theorem7(3) uses the annihilator of the contragredient Ẽ; the text layer loses the tilde. The spectral sequence is E₂^(p,q)=H^p(R^qFin_J(V)⊗E)⇒H^(p+q)(V⊗E).

<a id="automorphicspectraltheory-as-5-franke-filtration"></a>

### Franke constant-term filtration

**Definition** · `AutomorphicSpectralTheory:AS.5/franke-filtration` · planet: **Franke filtration**.

Proposed interface: `TauCeti.AutomorphicSpectral.franke_filtration` in `TauCeti/Automorphic/Spectral/AS5`.

For fixed J and an associate parabolic class {P}, every Fin_J uniform-moderate form has finitely many constant-term exponents: f_{N_Q}(g)=Σ_λ exp((ρ_Q+λ)H_Q(g)) f_{Q,λ}(H_Q(g),g), with polynomial height coefficients and smooth Levi functions. Decompose each real exponent as λ=λ₊+λ₋ by Franke’s root/fundamental-weight decomposition (§6 Lemma 1). Let F_J be the finite set of possible (Re λ)₊. Choose T:F_J→ℤ with T(λ)<T(θ) whenever λ≠θ and θ∈λ−closure(positive root cone). Define the descending filtration F_T^i by f_{Q,λ}=0 whenever T((Re λ)₊)<i for every Q. At weighted boundary use S_{p_{−r}+log}=⋃_n S_{w^(−n)p_{−r}} and S_{p_{−r}−log}=⋂_n S_{w^n p_{−r}}, with w the positive logarithmic Siegel height of §5. The filtration is finite and (𝔤,K,G_f)-stable.

**Hypotheses and conventions.**

- r in the closed positive chamber; J finite codimensional; all constant terms, not only the minimal one; the ordering function is strictly compatible with the source root cone.

**Construction or proof.**

1. Use finite central support to bound the exponent set.
2. Apply the unique positive/negative root decomposition of §6 Lemma 1, including its Levi projection compatibility.
3. Filter by the support conditions of (6.9); constant-term transitivity proves stability.

**Prerequisites.** [AutomorphicSpectralTheory:AS.5/finite-character-functor](#automorphicspectraltheory-as-5-finite-character-functor), `AutomorphicFormsOnReductiveGroups:AF.3/constant-term-transitivity`, [AutomorphicSpectralTheory:AS.3/truncation-cones](#automorphicspectraltheory-as-3-truncation-cones).

**Uses that determine the interface.**

- **Franke Theorem 14**: The graded pieces are expressed through induced discrete Levi forms and holomorphic jets.
- **Franke Theorem 16**: Compatible Levi filtrations make the inductive acyclicity proof work.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.franke_filtration.mem_iff` | characterisation | f∈F_T^i iff every nonzero constant-term coefficient has T((Re λ)₊)≥i. |
| `TauCeti.AutomorphicSpectral.franke_filtration.descending` | structure | F_T^(i+1)⊂F_T^i and the filtration has finite length. |
| `TauCeti.AutomorphicSpectral.franke_filtration.levi_compatible` | compatibility | The positive-part decomposition commutes with Levi projection as in §6 (6), so the induced Levi filtrations agree. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.franke_filtration.single_weight` (computation): If the only exponent weight has T-value j, F_T^i is the whole space for i≤j and zero for i>j.
- `TauCeti.AutomorphicSpectral.franke_filtration.no_exponents` (degenerate): The zero vector belongs to every step.
- `TauCeti.AutomorphicSpectral.franke_filtration.rank_only_fails` (non-example): For two exponent coefficients of the same parabolic with T-values zero and one, the vector supported at exponent one lies in step one and the vector at exponent zero does not. Equal parabolic rank does not determine membership.

**Acceptance and prototype scope.**

- Filtering only by Levi rank fails for the G₂ residual example in §6.

**Sources.**

- [Jens Franke, Harmonic Analysis in Weighted L²-Spaces](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf), §6 (1)–(9), printed pp.232–233. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-5-eisenstein-principal-value"></a>

### Principal values of meromorphic Eisenstein jets

**Construction** · `AutomorphicSpectralTheory:AS.5/eisenstein-principal-value`.

Proposed interface: `TauCeti.AutomorphicSpectral.eisenstein_principal_value` in `TauCeti/Automorphic/Spectral/AS5`.

For a finite set of polar hyperplanes through λ_t choose a transverse direction ξ avoiding each hyperplane. A meromorphic germ f has f(λ_t+zξ)=Σ_{k≫−∞}a_k z^k; define MW_ξ(f)=a₀. Holomorphic jets at λ_t are finite linear combinations of parameter derivatives. Applying MW_ξ to such a derivative of E gives a smooth automorphic principal value. It need not be equivariant as an unfiltered map; in the appropriate Franke graded quotient it is equivariant and independent of ξ.

**Hypotheses and conventions.**

- A common finite hyperplane divisor and transverse ξ; target complete locally convex space; graded independence is the theorem below, not part of the raw definition.

**Construction or proof.**

1. Take vector Laurent coefficients using AS.0.
2. Commute continuous maps, including constant term, with the coefficient extraction.
3. Track the ξ-dependent correction terms in deeper filtration steps.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/operator-meromorphic](#automorphicspectraltheory-as-0-operator-meromorphic), [AutomorphicSpectralTheory:AS.2/eisenstein-continuation](#automorphicspectraltheory-as-2-eisenstein-continuation), [AutomorphicSpectralTheory:AS.5/franke-filtration](#automorphicspectraltheory-as-5-franke-filtration).

**Uses that determine the interface.**

- **Franke Theorem 14**: Defines the map from induced discrete data with jets to each graded piece.
- **Franke–Schwermer support**: Realizes automorphic forms through derivatives and residues of cuspidal Eisenstein families.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.eisenstein_principal_value.holomorphic_eval` | simp | For a holomorphic germ, MW_ξ(f)=f(λ_t). |
| `TauCeti.AutomorphicSpectral.eisenstein_principal_value.linear` | structure | MW_ξ is linear and commutes with continuous fixed target maps. |
| `TauCeti.AutomorphicSpectral.eisenstein_principal_value.graded_independent` | compatibility | The induced Eisenstein-jet map to the prescribed graded quotient is independent of ξ. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.eisenstein_principal_value.simple_pole` (computation): MW(z⁻¹v+w)=w.
- `TauCeti.AutomorphicSpectral.eisenstein_principal_value.holomorphic` (degenerate): MW of a constant vector v is v.
- `TauCeti.AutomorphicSpectral.eisenstein_principal_value.direction_dependence` (non-example): Restrict the same named germ (z₁,z₂)↦z₁/z₂ along directions (1,1) and (2,1): the actual principal values are one and two.

**Acceptance and prototype scope.**

- A principal value is the constant coefficient, not the residue.

**Sources.**

- [Jens Franke, Harmonic Analysis in Weighted L²-Spaces](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf), §6 (12)–(13), printed pp.235–236. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-5-franke-graded-isomorphism"></a>

### Eisenstein description of the graded pieces

**Theorem** · `AutomorphicSpectralTheory:AS.5/franke-graded-isomorphism`.

Proposed interface: `TauCeti.AutomorphicSpectral.franke_graded_isomorphism` in `TauCeti/Automorphic/Spectral/AS5`.

For r in the closed positive chamber, each graded piece F_T^i/F_T^(i+1) of Fin_J S_{p_{−r}+log}^{{P}} is the direct sum over Levi ranks k of the colimit, under Weyl transport, of M(t)=W(u_t)⊗D_t with T(Re λ_t)=i (choose an equivalent shifted ordering so all filtration indices are positive). Here t=(R,Λ,χ) has R containing a member of {P}, continuous central character Λ, infinitesimal character χ in the finite J-support, Re λ_t in the closed positive chamber and in r−closure(positive root cone); u_t=Λ exp(−λ_tH_R) is unitary inducing data, W(u_t) is its induced discrete automorphic module, and D_t is the space of finite-order holomorphic functionals supported at λ_t. The map is MW_ξ applied to the corresponding derivative of E. It is a (𝔤,K,G_f)-isomorphism independent of ξ.

**Hypotheses and conventions.**

- All index conditions in Franke §6 (10)–(14), including J-support and weighted exponent bounds; colimit identifies Weyl-isomorphic data, not a free direct sum over repetitions.

**Construction or proof.**

1. Prove the image belongs to the weighted space by the constant-term exponent criterion (Theorem 15).
2. Identify leading terms and show corrections lie in the next filtration step.
3. Use Weyl-compatible jets and induction on Levi rank for injectivity and surjectivity.

**Prerequisites.** [AutomorphicSpectralTheory:AS.5/franke-filtration](#automorphicspectraltheory-as-5-franke-filtration), [AutomorphicSpectralTheory:AS.5/eisenstein-principal-value](#automorphicspectraltheory-as-5-eisenstein-principal-value), [AutomorphicSpectralTheory:AS.4/residual-spectrum](#automorphicspectraltheory-as-4-residual-spectrum).

**Acceptance and prototype scope.**

- Every automorphic form is a finite sum of Laurent coefficients of cuspidal Eisenstein series, via the finite filtration.

**Sources.**

- [Jens Franke, Harmonic Analysis in Weighted L²-Spaces](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf), §6 Theorem 14, equation (14). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-5-weighted-finite-character-acyclic"></a>

### Acyclicity of weighted smooth spaces

**Theorem** · `AutomorphicSpectralTheory:AS.5/weighted-finite-character-acyclic`.

Proposed interface: `TauCeti.AutomorphicSpectral.weighted_finite_character_acyclic` in `TauCeti/Automorphic/Spectral/AS5`.

For r in the closed positive chamber, R^i Fin_J(S_{p_{−r}+log}([G]))=0 for i>0. For the stronger S_{p_{−r}−log} space the same holds when r lies in the intersection of the closed positive Weyl chamber with the interior of the positive root cone. Passing to the union over sufficiently decreasing weights gives Fin_J-acyclicity of the uniform-moderate-growth smooth space. This acyclicity concerns the derived central torsion functor, not vanishing of every relative Lie algebra cohomology group.

**Hypotheses and conventions.**

- Finite-codimension J; weights and log modifications as above; the second clause additionally requires r in the interior of the positive root cone.

**Construction or proof.**

1. Resolve the weighted space modulo functions with vanishing deep-cusp constant terms by induced Levi weighted spaces.
2. Use induction on rank, compatible exponent filtrations and graded Eisenstein isomorphisms.
3. Apply the derived Fin_J calculation and exact filtered colimits.

**Prerequisites.** [AutomorphicSpectralTheory:AS.5/derived-finite-character](#automorphicspectraltheory-as-5-derived-finite-character), [AutomorphicSpectralTheory:AS.5/franke-graded-isomorphism](#automorphicspectraltheory-as-5-franke-graded-isomorphism), [AutomorphicSpectralTheory:AS.3/truncation-rapid-decay](#automorphicspectraltheory-as-3-truncation-rapid-decay).

**Acceptance and prototype scope.**

- The compact-quotient base case uses Theorem 13, not a claim that weighted cohomology is zero.

**Sources.**

- [Jens Franke, Harmonic Analysis in Weighted L²-Spaces](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf), §7 Theorem 16. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-5-constant-term-resolution"></a>

### Acyclic parabolic constant-term resolution

**Theorem** · `AutomorphicSpectralTheory:AS.5/constant-term-resolution`.

Proposed interface: `TauCeti.AutomorphicSpectral.constant_term_resolution` in `TauCeti/Automorphic/Spectral/AS5`.

Let S_c be the weighted smooth functions whose P-constant terms vanish in every sufficiently deep P-cusp. For the finite poset of proper standard parabolics, the constant-term map S_p([G])/S_c([G])→lim_P S_p[P] is an isomorphism and R^i lim_P S_p[P]=0 for i>0, with the restriction maps and their compatible weights specified by Franke §7.1. The associated finite alternating parabolic complex therefore resolves that quotient. This is the acyclic boundary complex used in the Fin_J induction.

**Hypotheses and conventions.**

- Admissible weights; the actual constant-term transition maps; functions are finite-level and K-finite as in Franke.

**Construction or proof.**

1. Use the deep-cusp support partition and constant-term transitivity to construct the resolution.
2. Apply truncation/root-cone cancellations to prove the augmented complex exact.

**Prerequisites.** [AutomorphicSpectralTheory:AS.5/weighted-l2-complex](#automorphicspectraltheory-as-5-weighted-l2-complex), [AutomorphicSpectralTheory:AS.5/franke-filtration](#automorphicspectraltheory-as-5-franke-filtration), [AutomorphicSpectralTheory:AS.3/truncation-projection](#automorphicspectraltheory-as-3-truncation-projection).

**Acceptance and prototype scope.**

- The inverse-limit higher functors vanish for this diagram, not for arbitrary diagrams over a finite poset.

**Sources.**

- [Jens Franke, Harmonic Analysis in Weighted L²-Spaces](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf), §7.1 Theorem 17. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-5-franke-comparison"></a>

### Franke ordinary-cohomology comparison

**Theorem** · `AutomorphicSpectralTheory:AS.5/franke-comparison` · planet: **Franke comparison theorem**.

Proposed interface: `TauCeti.AutomorphicSpectral.franke_comparison` in `TauCeti/Automorphic/Spectral/AS5`.

For a connected reductive number-field group, algebraic finite-dimensional E, and finite level K_f, the inclusions A_J([G])=Fin_J S_umg([G])→S_umg([G])→C∞([G]) induce isomorphisms on H^q(𝔪_G,K∞;−⊗E) when J=Ann_Z(E∨), the central annihilator of the contragredient coefficient module. Through the ALS.5 de Rham comparison this equals ordinary H^q(X_K,𝓔), with the split-central balancing twist and full disconnected K∞ invariants. The isomorphisms are compatible with level changes and finite Hecke correspondences. This is ordinary cohomology; replacing it by cusp or L² cohomology would change the theorem.

**Hypotheses and conventions.**

- Algebraic E; the finite-level neat/orbifold conventions of ALS.5; 𝔪_G removes the split-center Lie algebra; coefficient central character is balanced.

**Construction or proof.**

1. Use weighted regularization and the union-of-weights current comparison.
2. Apply Fin_J acyclicity and the coefficient comparison to replace smooth growth functions by automorphic forms.
3. Import topological/de Rham comparison and prove the maps commute with Hecke pull–push.

**Prerequisites.** [AutomorphicSpectralTheory:AS.5/weighted-regularization](#automorphicspectraltheory-as-5-weighted-regularization), [AutomorphicSpectralTheory:AS.5/weighted-finite-character-acyclic](#automorphicspectraltheory-as-5-weighted-finite-character-acyclic), [AutomorphicSpectralTheory:AS.5/derived-finite-character](#automorphicspectraltheory-as-5-derived-finite-character), [AutomorphicSpectralTheory:AS.5/constant-term-resolution](#automorphicspectraltheory-as-5-constant-term-resolution), `ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison`, `AutomorphicFormsOnReductiveGroups:AF.2/smooth-automorphic-forms`.

**Acceptance and prototype scope.**

- E=ℂ on the modular curve recovers ordinary cohomology, including its boundary/Eisenstein contribution.

**Sources.**

- [Jens Franke, Harmonic Analysis in Weighted L²-Spaces](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf), §7.4 Theorem 18. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-5-gl-sl-cuspidal-diagram"></a>

### GLₙ and SLₙ cuspidal cohomology diagram

**Theorem** · `AutomorphicSpectralTheory:AS.5/gl-sl-cuspidal-diagram`.

Proposed interface: `TauCeti.AutomorphicSpectral.gl_sl_cuspidal_diagram` in `TauCeti/Automorphic/Spectral/AS5`.

At level one and trivial algebraic coefficients, the BCG diagram compares ⊕_πH*(𝔰𝔩_n,O(n);π∞) with H*_cusp(GL_n(ℤ),ℂ), and the corresponding SO(n) sum with H*_cusp(SL_n(ℤ),ℂ). The top is the O(n)/SO(n)-invariant part of the bottom. For odd n the two cusp cohomologies agree; for even n, the SO(n) cohomology of the unique tempered cohomological archimedean constituent is free over ℂ[ℤ/2], giving dim H*_cusp(SL_n)=2 dim H*_cusp(GL_n). Nonvanishing is equivalent to a level-one weight-zero cusp π. In the displayed sums multiplicity one and one-dimensional spherical finite vectors are the GL_n inputs.

**Hypotheses and conventions.**

- Level-one GL_n/Q, trivial coefficients; algebraic cohomological weight-zero convention; full O(n), not just its identity component.

**Construction or proof.**

1. Specialize the general cusp spectral comparison and split-center quotient.
2. Identify the determinant double cover and its component-group action.
3. Use the real cohomological representation calculation and GL_n multiplicity one to obtain the parity statements.

**Prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.5/cuspidal-cohomology`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Acceptance and prototype scope.**

- The even-n factor 2 disappears if one wrongly replaces O(n) by SO(n) throughout.

**Sources.**

- [George Boxer, Frank Calegari and Toby Gee, Cuspidal Cohomology of GLₙ(Z) and SLₙ(Z)](https://math.uchicago.edu/~fcale/papers/WeightZero.pdf), Remark 1.2, pp.511–512. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-5-franke-schwermer-support"></a>

### Franke–Schwermer cuspidal-support decomposition

**Theorem** · `AutomorphicSpectralTheory:AS.5/franke-schwermer-support` · planet: **Cuspidal-support decomposition**.

Proposed interface: `TauCeti.AutomorphicSpectral.franke_schwermer_support` in `TauCeti/Automorphic/Spectral/AS5`.

For finite-codimension J, the space A_J(G) of automorphic forms decomposes algebraically as a direct sum over associate classes of parabolics and Weyl-associate cuspidal data on their Levis, generated by Laurent coefficients and derivatives of the corresponding cuspidal Eisenstein series with infinitesimal character in J-support. The resulting relative-cohomology decomposition is Hecke compatible. For a general reductive group this is a cuspidal-support decomposition; the phrase isobaric automorphic representation is reserved for the GL_n specialization.

**Hypotheses and conventions.**

- Fixed J and central balancing; every coefficient belongs to the actual automorphic space; Weyl equivalence includes cuspidal data.

**Construction or proof.**

1. Use the constant-term filtration and its graded Eisenstein descriptions.
2. Refine by cuspidal Levi support, keeping orthogonality/independence of inequivalent support data.
3. Apply relative cohomology and finite Hecke compatibility.

**Prerequisites.** [AutomorphicSpectralTheory:AS.5/franke-graded-isomorphism](#automorphicspectraltheory-as-5-franke-graded-isomorphism), [AutomorphicSpectralTheory:AS.5/franke-comparison](#automorphicspectraltheory-as-5-franke-comparison), [AutomorphicSpectralTheory:AS.1/cuspidal-datum-space](#automorphicspectraltheory-as-1-cuspidal-datum-space).

**Acceptance and prototype scope.**

- This algebraic automorphic decomposition is distinct from the Hilbert L² decomposition.

**Sources.**

- [Frank Calegari, David Geraghty and Michael Harris, Bloch–Kato Conjectures for Automorphic Motives](https://arxiv.org/pdf/1907.08694), §3 proof of Lemma 3.1, citing FS98 Theorem 2.3. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-5-isobaric-realization"></a>

### Isobaric realization of GLₙ cohomology eigenclasses

**Theorem** · `AutomorphicSpectralTheory:AS.5/isobaric-realization`.

Proposed interface: `TauCeti.AutomorphicSpectral.isobaric_realization` in `TauCeti/Automorphic/Spectral/AS5`.

For an ordinary cohomology Hecke eigenclass of the arithmetic quotient of Res_{F/ℚ}PGL_n with algebraic coefficients over ℂ, its unramified Hecke eigenvalues outside a finite set are those of an isobaric GL_n automorphic representation, obtained from a cuspidal-support summand of the Franke–Schwermer decomposition. The class may be Eisenstein; the theorem does not force that isobaric representation to be cuspidal or tempered. For a general reductive group the conclusion is realization in a cuspidal-support Eisenstein module, not an undefined general-group isobaric sum.

**Hypotheses and conventions.**

- Complex algebraic coefficients; anemic unramified Hecke eigenclass; GL_n/PGL_n central convention; no assertion about torsion classes.

**Construction or proof.**

1. Use Franke comparison to represent the class in A_J cohomology.
2. Choose a nonzero cuspidal-support component with those Hecke eigenvalues.
3. For GL_n pass from its inducing cuspidal data to the isobaric representation and compare Satake multisets.

**Prerequisites.** [AutomorphicSpectralTheory:AS.5/franke-schwermer-support](#automorphicspectraltheory-as-5-franke-schwermer-support), [AutomorphicSpectralTheory:AS.2/isobaric-sum](#automorphicspectraltheory-as-2-isobaric-sum).

**Acceptance and prototype scope.**

- A torsion mod-p cohomology class is not covered by this characteristic-zero theorem.

**Sources.**

- [Frank Calegari, David Geraghty and Michael Harris, Bloch–Kato Conjectures for Automorphic Motives](https://arxiv.org/pdf/1907.08694), §3 proof of Lemma 3.1. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6"></a>

## AS.6 — Declarations

Coverage: **planned**. Every stated stage target has a node, an imported owner target or a precise gap. Planned means target inventory coverage, not proof closure or implementation. The continuation and Fourier interfaces distinguish restricted test models from the general source adapters.

Atlas landmarks: Invariant Paley–Wiener theorem, Spectral multipliers, Arthur families, Weighted orbital integrals, Weighted characters, Invariant trace formula.

<a id="automorphicspectraltheory-as-6-real-invariant-paley-wiener"></a>

### Real invariant Paley–Wiener theorem

**Theorem** · `AutomorphicSpectralTheory:AS.6/real-invariant-paley-wiener` · planet: **Invariant Paley–Wiener theorem**.

Proposed interface: `TauCeti.AutomorphicSpectral.real_invariant_paley_wiener` in `TauCeti/Automorphic/Spectral/AS6`.

For a real reductive algebraic group G with maximal compact K and radius r>0, the trace transforms of smooth bi-K-finite functions supported in the radius-r ball are exactly the collections F_i(δ,ν) on basic representations induced from limits of discrete series of Levi subgroups satisfying: finite support in δ; entire scalar Paley–Wiener bounds of type r in ν; K-conjugacy/Weyl invariance; and every induction-in-stages additivity relation (iv) of Clozel–Delorme Theorem 1. The LF image carries the quotient topology. All four conditions are required; a Weyl-invariant entire function alone is insufficient.

**Hypotheses and conventions.**

- The real reductive algebraic setting and basic representations of Clozel–Delorme §0; Haar, norm/radius, and normalized induction are fixed.
- The induced families in this local theorem come from the requested AF.1 real-parabolic compact picture, not AS.1 global adelic automorphic induction.

**Construction or proof.**

1. Use minimal K-types to reduce to a single discrete-series datum.
2. Apply the operator Paley–Wiener construction and the affiliation/induction relations.
3. Reassemble finitely many discrete parameters, keeping the prescribed support radius.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/nuclear-lf-space](#automorphicspectraltheory-as-0-nuclear-lf-space), `AutomorphicFormsOnReductiveGroups:AF.1`, `AutomorphicFormsOnReductiveGroups:AF.1/sf-representation`.

**Acceptance and prototype scope.**

- The invariant theorem is a trace image theorem, not injectivity of the trace map.

**Sources.**

- [Laurent Clozel and Patrick Delorme, Le théorème de Paley-Wiener invariant pour les groupes de Lie réductifs II](https://www.numdam.org/article/ASENS_1990_4_23_2_193_0.pdf), §0 Theorem 1(i)–(iv), pp.194–195; §5 Theorem 1′. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-real-operator-paley-wiener"></a>

### Real operator Paley–Wiener theorem

**Theorem** · `AutomorphicSpectralTheory:AS.6/real-operator-paley-wiener`.

Proposed interface: `TauCeti.AutomorphicSpectral.real_operator_paley_wiener` in `TauCeti/Automorphic/Spectral/AS6`.

For Arthur’s real reductive group G and K, Fourier transformation f↦{I_B(σ,λ,f)} is a topological algebra isomorphism C_c^∞(G,K)→PW(G,K). At fixed radius N and finite K-type set Γ it identifies C_N^∞(G)_Γ with PW_N(G)_Γ: entire finite-dimensional operator families with all seminorms sup e^(−N||Re λ||)(1+||λ||)^n||F_B(σ,λ)|| finite and all differential matrix-coefficient relations (III.4.1) inherited from the induced representations. The relations include derivatives, not just ordinary intertwining covariance.

**Hypotheses and conventions.**

- The representation, radius and finite-K-type conventions of Arthur Acta III §4; finite-dimensional matrix coefficient spaces.
- The induced families in this local theorem come from the requested AF.1 real-parabolic compact picture, not AS.1 global adelic automorphic induction.

**Construction or proof.**

1. Translate Eisenstein integrals to induced matrix coefficients using Part I §3.
2. Use Theorem III.3.3 for Fourier surjectivity with derivative relations.
3. Fourier inversion gives injectivity and the LF topology; convolution becomes operator multiplication.

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/vector-schwartz](#automorphicspectraltheory-as-0-vector-schwartz), [AutomorphicSpectralTheory:AS.0/nuclear-lf-space](#automorphicspectraltheory-as-0-nuclear-lf-space), `AutomorphicFormsOnReductiveGroups:AF.1/sf-representation`, `AutomorphicFormsOnReductiveGroups:AF.1`.

**Acceptance and prototype scope.**

- A trace Paley–Wiener theorem is not substituted for this operator theorem.

**Sources.**

- [James Arthur, A Paley-Wiener Theorem for Real Reductive Groups](https://www.claymath.org/library/cw/arthur/pdf/15.pdf), III §4 Theorem 4.1, pp.84–85. Theorem III.4.1, printed p.85, states the topological isomorphism and fixed-radius/fixed-K-type image; III.4.1 differential relations are retained.

<a id="automorphicspectraltheory-as-6-spectral-multiplier"></a>

### Arthur spectral multipliers

**Construction** · `AutomorphicSpectralTheory:AS.6/spectral-multiplier` · planet: **Spectral multipliers**.

Proposed interface: `TauCeti.AutomorphicSpectral.spectral_multiplier` in `TauCeti/Automorphic/Spectral/AS6`.

For a compactly supported W-invariant distribution γ on the real Cartan space h, and f∈C_c^∞(G,K), construct the unique f_γ with π(f_γ)=γ̂(ν_π)π(f) for every irreducible admissible π. A radius-N input and radius-N_γ distribution give radius≤N+N_γ output with the same finite K-types. The multiplier is a continuous convolution-central endomorphism of the Hecke LF space.

**Hypotheses and conventions.**

- Real reductive group; infinitesimal character ν_π as a W-orbit; Fourier–Laplace convention γ̂(ν)=γ(exp⟨ν,·⟩).

**Construction or proof.**

1. Multiply the operator Paley–Wiener family by γ̂(ν_σ+λ).
2. Use polynomial approximation of the W-invariant entire transform to preserve all derivative relations.
3. Apply operator Fourier inversion and estimate the radius and seminorms.

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/real-operator-paley-wiener](#automorphicspectraltheory-as-6-real-operator-paley-wiener), [AutomorphicSpectralTheory:AS.0/locally-convex-integration](#automorphicspectraltheory-as-0-locally-convex-integration).

**Uses that determine the interface.**

- **Arthur05 §20 Theorem 20.5**: Controls the interchange of truncation and spectral cutoffs.
- **Arthur88global §6**: Supplies the weak convergence estimate for the height expansion.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.spectral_multiplier.character` | characterisation | π(f_γ)=γ̂(ν_π)π(f) for every irreducible admissible π, with ν_π its infinitesimal-character W-orbit. |
| `TauCeti.AutomorphicSpectral.spectral_multiplier.composition` | relation | (f_γ)_η=f_(γ*η). |
| `TauCeti.AutomorphicSpectral.spectral_multiplier.support` | compatibility | A radius N input and radius N_γ multiplier have output supported in radius N+N_γ, with the same K-types. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.spectral_multiplier.dirac` (computation): The Dirac distribution at 0 acts as identity.
- `TauCeti.AutomorphicSpectral.spectral_multiplier.central_polynomial` (compatibility): For the distribution whose transform is the Harish-Chandra polynomial p_z, f_γ=zf.
- `TauCeti.AutomorphicSpectral.spectral_multiplier.zero` (degenerate): The zero distribution sends every f to zero.

**Acceptance and prototype scope.**

- Scalar multiplication on the spectral side must lift to an actual compactly supported test function.

**Sources.**

- [James Arthur, A Paley-Wiener Theorem for Real Reductive Groups](https://www.claymath.org/library/cw/arthur/pdf/15.pdf), III §4 Theorem 4.2 and its proof, pp.86–87. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-automorphic-kernel"></a>

### Automorphic convolution kernels

**Construction** · `AutomorphicSpectralTheory:AS.6/automorphic-kernel`.

Proposed interface: `TauCeti.AutomorphicSpectral.automorphic_kernel` in `TauCeti/Automorphic/Spectral/AS6`.

For f∈C_c^∞(G(𝔸)^1), define K_f(x,y)=Σ_{γ∈G(F)}f(x⁻¹γy), the kernel of right convolution on [G]^1=G(F)\G(𝔸)^1. For P=MN define K_{P,f}(x,y)=∫_{N_P(𝔸)}Σ_{γ∈M_P(F)}f(x⁻¹γny)dn. Geometric summation uses the semisimple-part equivalence classes o, while spectral projection uses Weyl-cuspidal classes χ. The two kernels have distinct indices and must not be identified term by term.

**Hypotheses and conventions.**

- Connected reductive number-field G; rational quotient, Haar and N(F)\N(𝔸) volume-one conventions; smooth finite-level compact support.

**Construction or proof.**

1. Unfold right convolution against a fundamental domain.
2. Use compact support and discreteness locally, then reduction-theoretic bounds on a Siegel domain.
3. Apply the spectral map to project K_f to each χ.

**Prerequisites.** `AdelicAlgebraicGroups:AA.2/automorphic-quotient-measure`, `AdelicAlgebraicGroups:AA.3/siegel-covering-adelic`, [AutomorphicSpectralTheory:AS.4/spectral-map](#automorphicspectraltheory-as-4-spectral-map).

**Uses that determine the interface.**

- **Arthur78 §§1–3**: Provides the coarse geometric kernels.
- **AS.6 coarse-truncated-kernel**: Parabolic cancellation regularizes the diagonal.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.automorphic_kernel.operator` | characterisation | R(f)u(x)=∫_[G] K_f(x,y)u(y)dy on smooth compactly supported quotient functions. |
| `TauCeti.AutomorphicSpectral.automorphic_kernel.constant_term` | compatibility | The parabolic kernel is obtained by the indicated unipotent integral and rational Levi sum. |
| `TauCeti.AutomorphicSpectral.automorphic_kernel.adjoint` | relation | For a rational index family equipped with an explicit inversion reindexing j↦j⁻¹, K_{f*}(x,y)=conj K_f(y,x). The source rational subgroup supplies that reindexing. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.automorphic_kernel.finite_group` (computation): For finite G(F) inside a finite group, unfolding gives the usual finite convolution matrix.
- `TauCeti.AutomorphicSpectral.automorphic_kernel.noncompact_diagonal` (non-example): For the compact logarithmic seed on the additive real group and the trivial discrete lattice, the actual periodized kernel has nonintegrable diagonal on the infinite-volume quotient. This is a kernel counterexample model; the finite-volume modular cusp estimate remains a source adapter.
- `TauCeti.AutomorphicSpectral.automorphic_kernel.adjoint_swap` (compatibility): For an inversion-stable rational index family with explicit bijective inversion reindexing and f(g)=conj f(g⁻¹), the actual periodized kernel is Hermitian.

**Acceptance and prototype scope.**

- The untruncated diagonal integral generally diverges.
- Suggested model: The diagonal counterexample is a compact-seed, trivial-lattice logarithmic group model on an infinite-volume quotient. It tests the actual kernel constructor. Establishing the finite-volume modular cusp analogue needs the source lattice-counting and reduction estimates.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §4 (4.1)–(4.2) and §14 spectral kernels; PDF page 8. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-6-coarse-truncated-kernel"></a>

### Coarse truncated trace kernels

**Construction** · `AutomorphicSpectralTheory:AS.6/coarse-truncated-kernel`.

Proposed interface: `TauCeti.AutomorphicSpectral.coarse_truncated_kernel` in `TauCeti/Automorphic/Spectral/AS6`.

For a positive regular T, define k_f^T(x)=Σ_{P⊃P₀}(−1)^dim(a_P/a_G)Σ_{δ∈P(F)\G(F)}τ̂_P(H_P(δx)−T)K_{P,f}(δx,δx). Keeping only a geometric class o or spectral class χ defines k_o^T or k_χ^T. Its integral J^T(f) is a regularized trace, not the ordinary trace of R(f) on noncompact [G]. At fixed f the class integrals are polynomials of degree≤dim(a₀/a_G) for sufficiently regular T.

**Hypotheses and conventions.**

- Number-field test function and measures above; dual-weight open cone indicators, all standard parabolics including G; T sufficiently regular relative to supp f.

**Construction or proof.**

1. Combine parabolic kernels with alternating dual cones.
2. Use root-cone cancellation and rational Bruhat/reduction estimates for absolute integrability.
3. Use the compact Γ′-cone integral and translation identity to obtain polynomial dependence.

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/automorphic-kernel](#automorphicspectraltheory-as-6-automorphic-kernel), [AutomorphicSpectralTheory:AS.3/truncation-cones](#automorphicspectraltheory-as-3-truncation-cones), `AdelicAlgebraicGroups:AA.3/adelic-height`.

**Uses that determine the interface.**

- **Arthur05 §16**: Gives the coarse trace identity.
- **Yu23 §4.1**: The function-field degree-lattice variant replaces polynomial behavior by quasi-polynomial behavior.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.coarse_truncated_kernel.decomposition` | relation | k_f^T=Σ_o k_o^T=Σ_χ k_χ^T with the absolute integrated convergence theorem. |
| `TauCeti.AutomorphicSpectral.coarse_truncated_kernel.levi_translation` | compatibility | Translation of T is expressed using Γ′-cone integrals and constant-term test functions on Levis. |
| `TauCeti.AutomorphicSpectral.coarse_truncated_kernel.canonical_value` | data | J(f) is the polynomial J^T(f) evaluated at Arthur’s distinguished point T₀, not its leading coefficient. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.coarse_truncated_kernel.anisotropic` (degenerate): With only the whole-group parabolic, the actual coarse_truncated_kernel equals the original kernel diagonal.
- `TauCeti.AutomorphicSpectral.coarse_truncated_kernel.rank_one` (computation): In the constant-term logarithmic cusp model, the actual two-parabolic truncated diagonal is integrable on positive heights and its integral is T for T≥0, a degree-one polynomial.
- `TauCeti.AutomorphicSpectral.coarse_truncated_kernel.zero_test` (degenerate): f=0 gives k_f^T=0 and J^T(f)=0.

**Acceptance and prototype scope.**

- Both summation over classes and integration require estimates.
- Suggested model: The rank-one test integrates the actual two-parabolic constant-term model with logarithmic height measure. Identification of these model terms with a smooth automorphic kernel and the general polynomial theorem remains required.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §§5–6 definition; §9 polynomial dependence; §14 (14.2). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-coarse-trace-identity"></a>

### Coarse trace formula

**Theorem** · `AutomorphicSpectralTheory:AS.6/coarse-trace-identity`.

Proposed interface: `TauCeti.AutomorphicSpectral.coarse_trace_identity` in `TauCeti/Automorphic/Spectral/AS6`.

For f∈C_c^∞(G(𝔸)^1) and T sufficiently regular relative to supp f, Σ_o∫|k_o^T| and Σ_χ∫|k_χ^T| are finite, and Σ_o J_o^T(f)=J^T(f)=Σ_χ J_χ^T(f). Each spectral class integral is also ∫_[G] Λ₂^T K_χ(x,x)dx. Polynomial evaluation at T₀ gives Σ_o J_o(f)=Σ_χ J_χ(f). This compares the class totals, without a bijection between o and χ.

**Hypotheses and conventions.**

- Number-field G, smooth compact support at fixed finite level; sufficiently regular truncation; consistent quotient measures.

**Construction or proof.**

1. Prove the geometric absolute estimate by alternating cones and reduction theory.
2. Prove the spectral estimate with finite-K-type Sobolev bounds and Selberg positivity.
3. Compare modified and singly truncated kernels by the support/Bruhat vanishing argument, then evaluate the polynomial.

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/coarse-truncated-kernel](#automorphicspectraltheory-as-6-coarse-truncated-kernel), [mathlib:MeasureTheory.integral_tsum](#mathlib-measuretheory-integral-tsum).

**Acceptance and prototype scope.**

- The coarse spectral formula holds in the full smooth compactly supported space; the later fine formula is stated in the Hecke algebra.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §14 Theorem 14.1; §16 (16.1); PDF page 74. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-6-gm-family"></a>

### Arthur (G,M)-families

**Definition** · `AutomorphicSpectralTheory:AS.6/gm-family` · planet: **Arthur families**.

Proposed interface: `TauCeti.AutomorphicSpectral.gm_family` in `TauCeti/Automorphic/Spectral/AS6`.

Fix G,M and a Haar measure on a_M^G. A (G,M)-family is a smooth collection c_P:ia_M*→ℂ indexed by P∈P(M), whose adjacent members agree on their shared wall. Put θ_P(λ)=vol(a_M^G/ℤΔ_P∨)⁻¹∏_{α∈Δ_P}λ(α∨). Away from walls c_M(λ)=Σ_P c_P(λ)/θ_P(λ); wall cancellation extends it smoothly, with c_M=c_M(0). Restriction to Levi subspaces and parabolics yields the families used in splitting and descent. Operator-valued families use the corresponding vector-valued version.

**Hypotheses and conventions.**

- Finite rational parabolic/root data; smoothness on the imaginary real vector space; coroot lattice covolume and fixed Haar.

**Construction or proof.**

1. Construct the adjacent-wall equalizer of smooth families.
2. Cancel opposite simple poles across each adjacent pair to extend the sum.
3. Restrict along Levi subspaces; wall equality proves independence of the subordinate parabolic.

**Prerequisites.** [AutomorphicSpectralTheory:AS.3/truncation-cones](#automorphicspectraltheory-as-3-truncation-cones), [AutomorphicSpectralTheory:AS.0/vector-schwartz](#automorphicspectraltheory-as-0-vector-schwartz).

**Uses that determine the interface.**

- **Arthur05 §18**: Exponential families yield the orbital weight.
- **Arthur05 §21**: Ratios of intertwining operators yield weighted characters.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.gm_family.wall` | characterisation | Adjacent c_P,c_P′ have identical restrictions to the common wall. |
| `TauCeti.AutomorphicSpectral.gm_family.product` | structure | Pointwise multiplication and restriction produce (G,M)-families. |
| `TauCeti.AutomorphicSpectral.gm_family.regularized_sum` | data | c_M is the unique smooth extension of Σ_P c_P/θ_P, evaluated at zero. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.gm_family.rank_zero` (degenerate): For a genuine one-member gm_family with no walls, the actual regularized zero value equals its member at zero.
- `TauCeti.AutomorphicSpectral.gm_family.rank_one` (computation): For a genuine two-member family with agreement on the shared wall, the full regularized sum has limit c₊′(0)−c₋′(0), and its zero-value construction has that value.
- `TauCeti.AutomorphicSpectral.gm_family.bad_wall` (non-example): No actual gm_family on a domain containing the shared wall can have constant members one and zero on the adjacent parabolics.

**Acceptance and prototype scope.**

- Adjacency is essential; arbitrary smooth chamber collections do not cancel.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §17 definition and Lemma 17.1, pp.93–94. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-gm-splitting"></a>

### Splitting and descent of Arthur families

**Theorem** · `AutomorphicSpectralTheory:AS.6/gm-splitting`.

Proposed interface: `TauCeti.AutomorphicSpectral.gm_splitting` in `TauCeti/Automorphic/Spectral/AS6`.

For (G,M)-families c,d the product has (cd)_M=Σ_{Q∈F(M)}c_M^Q d_Q′. If c_M^L is independent of Q∈P(L), this becomes Σ_{L∈L(M)}c_M^L d_L. The two-factor descent/splitting coefficients d_M^G(L₁,L₂) vanish unless a_M^{L₁}⊕a_M^{L₂}→a_M^G is an isomorphism; otherwise they are the determinant of this map with the fixed measures. Applied to local factors this gives the weighted orbital/character splitting formulas with normalized constant-term functions.

**Hypotheses and conventions.**

- Smooth wall-compatible families; the indicated independence for the shorter Levi-only sum; the section selecting Q₁,Q₂ and all measures in Arthur §17.

**Construction or proof.**

1. Invert the root/fundamental-weight denominator relation (17.9).
2. Multiply and regroup over parabolics to obtain (17.8).
3. Use projections to Levi subspaces and change-of-measure determinants for (17.13)–(17.14).

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/gm-family](#automorphicspectraltheory-as-6-gm-family), [AutomorphicSpectralTheory:AS.3/truncation-cones](#automorphicspectraltheory-as-3-truncation-cones).

**Acceptance and prototype scope.**

- The unrestricted product identity sums over F(M), not just P(M).

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §17 Lemmas 17.4–17.6, (17.8), (17.12)–(17.14). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-weighted-orbital-integral"></a>

### Weighted orbital integrals

**Construction** · `AutomorphicSpectralTheory:AS.6/weighted-orbital-integral` · planet: **Weighted orbital integrals**.

Proposed interface: `TauCeti.AutomorphicSpectral.weighted_orbital_integral` in `TauCeti/Automorphic/Spectral/AS6`.

For γ∈M(F_S) with connected G_γ=M_γ, define J_M^G(γ,f)=|D^G(γ)|^(1/2)∫_{G_γ(F_S)\G(F_S)} f(x⁻¹γx)v_M(x)dx. Here v_M is the zero value of the family exp(−λH_P(x)), hence the volume of the convex hull of {−H_P(x)} in a_M^G. For arbitrary γ use the canonical induced-class measure/central-shift limit of Arthur Theorem18.2, not the same integral when the centralizer condition fails. Import the unweighted orbital-integral carrier and singular extension from ET.1; this construction owns only the weight, its estimates, splitting and descent.

**Hypotheses and conventions.**

- Local/product-local connected centralizers, compatible Haar quotient and coroot covolumes; smooth compact support; absolute convergence before identifying a distribution.

**Construction or proof.**

1. Use the convex-hull description to obtain M-left invariance and logarithmic growth of the weight.
2. Apply the unweighted orbital integration estimate with the extra polynomial-log factor.
3. For singular elements use the finite Levi limiting formula and induced measures, then splitting and descent.

**Prerequisites.** `EndoscopicTransferAndUnitaryTraceComparison:ET.1`, [AutomorphicSpectralTheory:AS.6/gm-family](#automorphicspectraltheory-as-6-gm-family), [AutomorphicSpectralTheory:AS.6/gm-splitting](#automorphicspectraltheory-as-6-gm-splitting).

**Uses that determine the interface.**

- **Arthur05 §19**: Forms the local constituents of the fine geometric expansion.
- **AS.6 invariant-recursion**: Its conjugation defect is canceled by lower-Levi weighted characters.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.weighted_orbital_integral.weight` | data | v_M(x)=lim_(λ→0)Σ_P exp(−λH_P(x))/θ_P(λ). |
| `TauCeti.AutomorphicSpectral.weighted_orbital_integral.full_levi` | compatibility | J_G(γ,f)=\|D^G(γ)\|^(1/2)O_γ(f) with the imported quotient measure. |
| `TauCeti.AutomorphicSpectral.weighted_orbital_integral.splitting` | relation | For two place sets, J_M is Σ d_M^G(L₁,L₂)J_M^{L₁}(γ₁,f₁,Q₁)J_M^{L₂}(γ₂,f₂,Q₂). |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.weighted_orbital_integral.rank_zero` (degenerate): M=G gives weight 1.
- `TauCeti.AutomorphicSpectral.weighted_orbital_integral.rank_one_volume` (computation): The actual two-height weight with coroot covolume vol is r·vol for r≥0, and the named point-quotient weighted orbital integral with discriminant one takes exactly that value.
- `TauCeti.AutomorphicSpectral.weighted_orbital_integral.measure_scaling` (compatibility): Scaling the centralizer Haar by c scales the quotient integral by c⁻¹; the global centralizer-volume coefficient scales by c and cancels it.

**Acceptance and prototype scope.**

- For M=G the weight is 1 and the construction specializes to ET.1 with the discriminant convention stated here.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §18 (18.3), Theorem 18.2, (18.10). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-weighted-character"></a>

### Normalized weighted characters

**Construction** · `AutomorphicSpectralTheory:AS.6/weighted-character` · planet: **Weighted characters**.

Proposed interface: `TauCeti.AutomorphicSpectral.weighted_character` in `TauCeti/Automorphic/Spectral/AS6`.

Fix π unitary on M(F_S), P∈P(M) and normalized local intertwiners R. The family ℛ_Q(Λ,π_λ)=R_(Q|P)(π_λ)⁻¹R_(Q|P)(π_(λ+Λ)) has wall compatibility. Its regularized zero value ℛ_M gives J_M(π_λ,f)=tr(ℛ_M(π_λ,P)I_P(π_λ,f)). Fourier integration over ia_M,S*/ia_G,S* defines J_M(π,X,f), where Z=H_G(X) and f is restricted to height Z. The definition for nonunitary data uses the specified finite contour combination; no pole-free unitary formula is asserted there.

**Hypotheses and conventions.**

- S has Arthur’s closure property; fixed finite K-types of f; analytic unitary-axis normalized intertwiners; quotient Haar/Fourier dual measures.

**Construction or proof.**

1. Use intertwiner induction and cocycle relations for adjacent-wall equality.
2. Cancel family denominators and take a finite-dimensional K-supported trace.
3. Use Fourier inversion in the central-height variable with shifted contours for nonunitary parameters.

**Prerequisites.** [AutomorphicSpectralTheory:AS.2/local-normalization](#automorphicspectraltheory-as-2-local-normalization), [AutomorphicSpectralTheory:AS.6/gm-family](#automorphicspectraltheory-as-6-gm-family), [AutomorphicSpectralTheory:AS.0/trace-class](#automorphicspectraltheory-as-0-trace-class).

**Uses that determine the interface.**

- **Arthur88global §4**: The fine spectral terms split into this local constituent and global r-derivative coefficients.
- **AS.6 invariant-recursion**: Provides the Fourier maps subtracting conjugation defects.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.weighted_character.trace` | data | J_M(π_λ,f)=tr(ℛ_M(π_λ,P)I_P(π_λ,f)). |
| `TauCeti.AutomorphicSpectral.weighted_character.full_levi` | compatibility | For M=G, ℛ_G=1 and J_G is the ordinary character. |
| `TauCeti.AutomorphicSpectral.weighted_character.parabolic_independence` | relation | Conjugating by normalized R identifies the definitions for different P, so their traces agree. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.weighted_character.full_levi_test` (degenerate): M=G recovers tr π(f).
- `TauCeti.AutomorphicSpectral.weighted_character.rank_one_derivative` (computation): On a finite-dimensional regular invertible slice, the actual weighted_character equals the trace of R(λ)^(−1)R′(λ) composed with the test operator; the trace-class witness is tied to that product.
- `TauCeti.AutomorphicSpectral.weighted_character.normalization_change` (non-example): The actual scalar weighted traces for the families exp(z)Id and Id at zero are one and zero. The scalar exp(z) is unitary on the imaginary axis but changes the logarithmic derivative weight.

**Acceptance and prototype scope.**

- The normalization uses local R; the distinct global scalar r enters the spectral coefficients.
- Suggested model: Finite-dimensional tests use the actual trace-class product and logarithmic derivative; general admissible representations, coroot normalizations and normalized parabolic families remain source-qualified suppliers.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §21 (21.11)–(21.16); §23 (23.1)–(23.2). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-fine-geometric-expansion"></a>

### Fine geometric expansion

**Theorem** · `AutomorphicSpectralTheory:AS.6/fine-geometric-expansion`.

Proposed interface: `TauCeti.AutomorphicSpectral.fine_geometric_expansion` in `TauCeti/Automorphic/Spectral/AS6`.

Given a compact support neighborhood Δ⊂G(𝔸)^1, there is S_Δ such that for every S⊃S_Δ and f supported in Δ at S with spherical unit outside S, J(f)=Σ_M |W₀^M|/|W₀^G| Σ_{γ∈(M(F))_(M,S)}a^M(S,γ)J_M(γ,f). Each inner sum is finite. The coefficients are defined from unipotent distributions in connected semisimple centralizers and their volume/descent factors; they depend on S and the equivalence class. They are not all ordinary centralizer volumes.

**Hypotheses and conventions.**

- Number field; sufficiently large S depending on support and ramification; Arthur connected-centralizer and (M,S)-equivalence conventions.

**Construction or proof.**

1. Construct the unipotent coefficients by induction from the unipotent coarse distribution.
2. Descend a general geometric class to its semisimple centralizer.
3. Apply weighted orbital descent and the support-finiteness lemma to sum the classes.

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/coarse-trace-identity](#automorphicspectraltheory-as-6-coarse-trace-identity), [AutomorphicSpectralTheory:AS.6/weighted-orbital-integral](#automorphicspectraltheory-as-6-weighted-orbital-integral), [AutomorphicSpectralTheory:AS.6/gm-splitting](#automorphicspectraltheory-as-6-gm-splitting).

**Acceptance and prototype scope.**

- The same S and quotient measures occur in the coefficients and local integrals.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §19 Theorems 19.1–19.2 and Corollary 19.3 (19.10). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-fine-spectral-expansion"></a>

### Fine spectral expansion

**Theorem** · `AutomorphicSpectralTheory:AS.6/fine-spectral-expansion`.

Proposed interface: `TauCeti.AutomorphicSpectral.fine_spectral_expansion` in `TauCeti/Automorphic/Spectral/AS6`.

For f in the adelic bi-K-finite Hecke algebra H(G), J(f)=Σ_{t≥0}Σ_{M,L⊃M}Σ_{s∈W^L(M)_reg} (|W₀^M|/|W₀^G|)|det(s−1)|_(a_M^L)⁻¹ ∫_(ia_L*/ia_G*) tr(ℳ_L(λ,P)M_P(s,0)I_(P,t)(λ,f))dλ, with ℳ_L the regularized family built from global M. Decomposing M=rR separates global logarithmic r-derivatives and local normalized weighted characters. For each t all displayed integrals converge absolutely; Σ_t|J_t(f)|<∞. Joint absolute convergence after taking the absolute value inside every t-integral is not supplied. The L=G terms include singular continuous contributions as well as the genuine discrete spectrum. The determinant-space misprint in (21.17) is recorded in sourceIssues; the corrected Jacobian a_M^L is established in the source’s own (21.5) and Corollary21.3, and Arthur1988global p.520.

**Hypotheses and conventions.**

- Number-field connected reductive G; f∈H(G), including finite archimedean K-types; quotient determinant space a_M^L and its Haar; t=minimum-norm imaginary infinitesimal-character height.

**Construction or proof.**

1. Use spectral multipliers and truncated inner-product asymptotics to justify the two limiting operations.
2. Expand the global (G,M)-family by M=rR and split it.
3. Prove the per-t absolute bounds from rank-one positivity and rational local normalization, then sum the coarse height totals.

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/spectral-multiplier](#automorphicspectraltheory-as-6-spectral-multiplier), [AutomorphicSpectralTheory:AS.6/weighted-character](#automorphicspectraltheory-as-6-weighted-character), [AutomorphicSpectralTheory:AS.6/coarse-trace-identity](#automorphicspectraltheory-as-6-coarse-trace-identity), [AutomorphicSpectralTheory:AS.3/discrete-maass-selberg-asymptotic](#automorphicspectraltheory-as-3-discrete-maass-selberg-asymptotic), [AutomorphicSpectralTheory:AS.2/intertwiner-factorization](#automorphicspectraltheory-as-2-intertwiner-factorization).

**Acceptance and prototype scope.**

- The determinant is on a_M^L, not a_M^G for every L. The full smooth C_c^∞ extension is not claimed.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §21 Theorem 21.6, Corollary 21.7; Remarks 3–4; Arthur88global Theorem4.4. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.
- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §21 (21.5), p.130, and Corollary21.3, p.134. The explicit change-of-variable Jacobian fixes the determinant space a_M^L, independently of the later displayed misprint.
- [James Arthur, The Invariant Trace Formula II: Global Theory](https://www.claymath.org/library/cw/arthur/pdf/27.pdf), Theorem4.4 proof, p.520, first coefficient in the proof. Read the displayed coefficient on the scanned page: a_(L₀)^(M₁), corresponding to a_M^L in the survey notation. The theorem also separates integral absolute convergence and outer summability.

<a id="automorphicspectraltheory-as-6-almost-compact-test-space"></a>

### Almost compact invariant Fourier spaces

**Definition** · `AutomorphicSpectralTheory:AS.6/almost-compact-test-space`.

Proposed interface: `TauCeti.AutomorphicSpectral.almost_compact_test_space` in `TauCeti/Automorphic/Spectral/AS6`.

For S with the closure property (an archimedean place, or only finite places of one residual characteristic), a_G,S=H_G(G(F_S)) is closed. H_ac(G)_Γ consists of functions with fixed finite K-types Γ for which f(x)b(H_G(x))∈H(G)_Γ for every compactly supported smooth b on a_G,S. I_ac(G)_Γ consists of character-side functions φ(π,Z), satisfying φ(π_λ,Z)=exp(λZ)φ(π,Z), for which φ b lies in the invariant Fourier image I(G)_Γ for every such b. Take the LF union in Γ. The weighted Fourier map φ_M(f)(π,X)=J_M(π,X,f) is continuous H_ac(G)→I_ac(M).

**Hypotheses and conventions.**

- Tempered π on G(F_S); central Fourier dual quotient ia_G*/ia_G,S∨, with periods 2πℤ; the invariant PW image, not all functions on tempered representations.

**Construction or proof.**

1. Localize in central height and use fixed finite K-type LF seminorms.
2. Apply real and p-adic invariant Fourier image theorems.
3. Use weighted-character descent, splitting and meromorphic residues for continuity of φ_M.

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/weighted-character](#automorphicspectraltheory-as-6-weighted-character), [AutomorphicSpectralTheory:AS.6/real-invariant-paley-wiener](#automorphicspectraltheory-as-6-real-invariant-paley-wiener).

**Uses that determine the interface.**

- **Arthur88local §§1–3**: Permits weighted Fourier maps with noncompact central-height support.
- **AS.6 invariant-recursion**: The lower-Levi distributions act on φ_L(f) through this space.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.almost_compact_test_space.cutoff` | characterisation | Membership means every compact smooth height cutoff belongs to the same Γ piece of H or I. |
| `TauCeti.AutomorphicSpectral.almost_compact_test_space.height_covariance` | relation | φ(π_λ,Z)=e^(λZ)φ(π,Z). |
| `TauCeti.AutomorphicSpectral.almost_compact_test_space.weighted_fourier` | data | φ_M(f)(π,X)=J_M(π,X,f), a continuous linear map into I_ac(M). |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.almost_compact_test_space.compact_input` (compatibility): H(G) embeds into H_ac(G).
- `TauCeti.AutomorphicSpectral.almost_compact_test_space.semisimple` (degenerate): If a_G=0 then H_ac(G)=H(G), and likewise for I.
- `TauCeti.AutomorphicSpectral.almost_compact_test_space.fiberwise_only` (non-example): There is a smooth coefficient family with compact support for each K-type and finitely many nonzero types at each height, but all labels occur in one compact height interval. It lies in no almost-compact space for a fixed finite type set.

**Acceptance and prototype scope.**

- Almost compact support is uniform after every height cutoff, not merely compactness of individual height fibers.
- Suggested model: The suggested counterexample is stated in K-type coefficient coordinates; circle-character reconstruction and the actual Hecke compact-support LF carrier are required adapters. Compact height fibres do not imply one uniform finite type set.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §23 pp.146–148 and Proposition 23.1. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-invariant-recursion"></a>

### Invariantization by Levi recursion

**Construction** · `AutomorphicSpectralTheory:AS.6/invariant-recursion`.

Proposed interface: `TauCeti.AutomorphicSpectral.invariant_recursion` in `TauCeti/Automorphic/Spectral/AS6`.

Define I_M^G(γ,f)=J_M^G(γ,f)−Σ_{L⊃M,L≠G}Î_M^L(γ,φ_L(f)) and the parallel I_M^G(π,X,f) with the same lower-Levi subtraction. Define I^G(f)=J^G(f)−Σ_{L≠G}(|W₀^L|/|W₀^G|)Î^L(φ_L(f)). Hats mean factoring a distribution through the invariant character image, not choosing a representative test function. Simultaneous induction proves conjugation invariance and annihilation of every test function with zero character transform, so every subtraction is well-defined.

**Hypotheses and conventions.**

- S has closure property; H_ac domain; induction on proper Levis; character support is proved for these distributions, not assumed for all invariant distributions.

**Construction or proof.**

1. Start with full-Levi ordinary orbital/character distributions.
2. Match their conjugation defects with constant-term/splitting identities of φ_L.
3. Use local/global character-support induction and support finiteness to factor through I_ac.

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/weighted-orbital-integral](#automorphicspectraltheory-as-6-weighted-orbital-integral), [AutomorphicSpectralTheory:AS.6/almost-compact-test-space](#automorphicspectraltheory-as-6-almost-compact-test-space), [AutomorphicSpectralTheory:AS.6/coarse-trace-identity](#automorphicspectraltheory-as-6-coarse-trace-identity).

**Uses that determine the interface.**

- **Arthur88global §§2–5**: Produces the invariant global trace and proves its character support.
- **EndoscopicTransferAndUnitaryTraceComparison ET.1**: Consumes these invariant identities; unweighted orbital integration remains ET.1-owned.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.invariant_recursion.recursion` | characterisation | The defining subtraction uses every proper Levi L containing M. |
| `TauCeti.AutomorphicSpectral.invariant_recursion.invariance` | relation | In the linear recursion model, matching the conjugation defect of J with the weighted lower-Levi defects implies I(conjugate f)=I(f). Arthur’s induction must supply that compatibility for the local and global distributions. |
| `TauCeti.AutomorphicSpectral.invariant_recursion.character_support` | compatibility | In the linear model, an explicit character-image factorization J=Î∘transform+Σ_L weight_L·lower_L∘φ_L identifies the recursively constructed I with Î∘transform. Hence transform f=0 implies I(f)=0; proving the source factorization remains part of Arthur’s induction. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.invariant_recursion.full_levi` (degenerate): I_G(γ,f)=J_G(γ,f) and I_G(π,Z,f)=tr π(f^Z).
- `TauCeti.AutomorphicSpectral.invariant_recursion.zero_transform` (compatibility): Build J from a character-image functional and the lower-Levi correction, then the actual invariant_recursion annihilates every f with transform f=0. The test does not assume its own vanishing conclusion.
- `TauCeti.AutomorphicSpectral.invariant_recursion.rank_one` (computation): In the global GL₂ recursion (Arthur (23.10)), the one proper-Levi correction has Weyl coefficient 1/2. In the local I_M^G recursion (23.3) the corresponding coefficient is one; these are distinct formulas.

**Acceptance and prototype scope.**

- No arbitrary invariant distribution is asserted to factor through characters.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §23 Theorems 23.2–23.3, (23.3)–(23.4), (23.10). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-invariant-trace-formula"></a>

### Invariant trace formula

**Theorem** · `AutomorphicSpectralTheory:AS.6/invariant-trace-formula` · planet: **Invariant trace formula**.

Proposed interface: `TauCeti.AutomorphicSpectral.invariant_trace_formula` in `TauCeti/Automorphic/Spectral/AS6`.

For f∈H(G), I(f)=lim_S Σ_M (|W₀^M|/|W₀^G|)Σ_{γ∈Γ(M)_S}a^M(γ)I_M(γ,f)=lim_T Σ_M (|W₀^M|/|W₀^G|)∫_{Π(M)_T}a^M(π)I_M(π,f)dπ. The geometric limit stabilizes for S sufficiently large depending only on support and ramification, and is finite. For each height bound T the spectral integral converges absolutely and the limit equals Σ_t I_t(f). The weak multiplier estimate is Σ_{t>T}|I_t(f_α)|≤C exp(kT) sup_{ν∈h_u*(r,T)}|α̂(ν)|, with C,k,r depending on f and α supported in a fixed-radius Cartan ball. This does not assert joint absolute convergence of every spectral term.

**Hypotheses and conventions.**

- Number-field connected reductive G; adelic K-finite Hecke input; consistent normalizing factors, determinants and measures.

**Construction or proof.**

1. Apply the Levi recursion simultaneously to fine geometric and spectral expansions.
2. Use splitting and character support to combine the lower-Levi terms.
3. Prove support stabilization and the multiplier estimate by the corresponding noninvariant estimates and rank induction.

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/invariant-recursion](#automorphicspectraltheory-as-6-invariant-recursion), [AutomorphicSpectralTheory:AS.6/fine-geometric-expansion](#automorphicspectraltheory-as-6-fine-geometric-expansion), [AutomorphicSpectralTheory:AS.6/fine-spectral-expansion](#automorphicspectraltheory-as-6-fine-spectral-expansion), [AutomorphicSpectralTheory:AS.6/spectral-multiplier](#automorphicspectraltheory-as-6-spectral-multiplier).

**Acceptance and prototype scope.**

- Truncation T in earlier stages and the spectral height bound T here are distinct parameters.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §23 Theorem23.4 (23.11)–(23.13); Arthur88global §§3–6. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-compact-trace-specialization"></a>

### Trace formula for compact quotients

**Theorem** · `AutomorphicSpectralTheory:AS.6/compact-trace-specialization`.

Proposed interface: `TauCeti.AutomorphicSpectral.compact_trace_specialization` in `TauCeti/Automorphic/Spectral/AS6`.

If G(F)\G(𝔸)^1 is compact (equivalently G has no proper F-parabolic), smooth compactly supported convolution is trace class and its trace equals ∫_[G]K_f(x,x)dx=Σ_[γ] vol(G_γ(F)\G_γ(𝔸)^1)∫_{G_γ(𝔸)\G(𝔸)}f(x⁻¹γx)dx=Σ_πm(π)tr π(f). Use the same connected/full centralizer convention in both volume and orbital integral. The convolution spectrum is discrete with finite multiplicities; compactness of G itself is not required.

**Hypotheses and conventions.**

- Compact arithmetic quotient; smooth finite-level f; compatible quotient measures; disconnected centralizer index retained.

**Construction or proof.**

1. Use compact-quotient smoothing/Sobolev estimates for trace class and a continuous diagonal.
2. Unfold the geometric kernel with the stabilizer measure.
3. Use the discrete spectral expansion and trace-class absolute summability.

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/automorphic-kernel](#automorphicspectraltheory-as-6-automorphic-kernel), [AutomorphicSpectralTheory:AS.6/coarse-trace-identity](#automorphicspectraltheory-as-6-coarse-trace-identity), [AutomorphicSpectralTheory:AS.4/compact-quotient-spectrum](#automorphicspectraltheory-as-4-compact-quotient-spectrum), [AutomorphicSpectralTheory:AS.0/kernel-trace-diagonal](#automorphicspectraltheory-as-0-kernel-trace-diagonal).

**Acceptance and prototype scope.**

- Peter–Weyl alone does not apply to a noncompact G with compact arithmetic quotient.

**Sources.**

- [James Arthur, An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §1 compact quotient formula; §16 (16.1)′′; PDF page 8. The locator identifies the source result. The statement and proof outline here are authored mathematical descriptions, with hypotheses and any adaptation stated explicitly.

<a id="automorphicspectraltheory-as-6-general-euler-poincare"></a>

### Real Euler–Poincaré test functions

**Construction** · `AutomorphicSpectralTheory:AS.6/general-euler-poincare`.

Proposed interface: `TauCeti.AutomorphicSpectral.general_euler_poincare` in `TauCeti/Automorphic/Spectral/AS6`.

Import the discrete-series/pseudo-coefficient and relative-cohomology carriers from ET.1 and AF.1a. For a finite-dimensional real reductive coefficient ξ, construct f_ξ of arbitrarily prescribed positive support radius with tr π(f_ξ)=Σ_q(−1)^q dim H^q(𝔤,K;π⊗ξ) for every finite-length admissible π. If G has no discrete series, this Euler characteristic is identically zero and f_ξ=0 is admissible. This is the full finite-length Euler–Poincaré character identity beyond the tempered pseudo-coefficient indicator.

**Hypotheses and conventions.**

- Clozel–Delorme real group conventions; finite-length Harish-Chandra module and finite-dimensional ξ; split-center/central-character balancing when passing to adelic groups.

**Construction or proof.**

1. Show the Euler characteristic is additive, admissible and zero on properly induced representations.
2. Apply the invariant PW theorem to the resulting discrete Grothendieck functional.
3. Extend from tempered/basic characters using the induction relations.

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/real-invariant-paley-wiener](#automorphicspectraltheory-as-6-real-invariant-paley-wiener), `EndoscopicTransferAndUnitaryTraceComparison:ET.1`, `AutomorphicFormsOnReductiveGroups:AF.1a/relative-lie-cochain-complex`.

**Uses that determine the interface.**

- **Arthur89lefschetz Lemma3.1 and Proposition3.2**: Replaces alternating cohomological traces by an adelic test function.
- **CT20 §1.4**: Provides the archimedean function for the level-one L²-Lefschetz trace.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.general_euler_poincare.trace_identity` | characterisation | The source target is tr π(f_ξ)=EP(𝔤,K;π⊗ξ) for every finite-length admissible π. The suggested scalar image model takes an invertible trace map E≃ₗℂ and defines f by its inverse applied to the finite alternating cohomology sum; its trace identity follows from this actual construction. |
| `TauCeti.AutomorphicSpectral.general_euler_poincare.induced_vanishing` | relation | The source target is vanishing on properly induced representations. The suggested rank-one cochain model computes the alternating sum as zero while its two cohomology groups remain nonzero; it makes no universal assertion about arbitrary dimension lists. |
| `TauCeti.AutomorphicSpectral.general_euler_poincare.no_discrete_series` | compatibility | The source target is identically zero EP when G has no discrete series. In the scalar image model the supplied zero Euler sum gives the zero test element; the source representation theorem must prove that condition, not the model. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.general_euler_poincare.compact_group` (computation): The actual EP test element for the degree-zero relative cochain model has trace one, equal to its one-dimensional zeroth cohomology.
- `TauCeti.AutomorphicSpectral.general_euler_poincare.no_discrete_series_test` (compatibility): For finite relative cochains with zero Euler characteristic, evaluating the actual scalar-trace EP construction gives zero; the source no-discrete-series theorem must supply this cohomological condition for each representation.
- `TauCeti.AutomorphicSpectral.general_euler_poincare.parabolic_induction` (non-example): The actual EP construction for the rank-one relative cochain model has trace zero while both its zeroth and first cohomology have dimension one; vanishing of the trace does not imply vanishing of the cohomology.

**Acceptance and prototype scope.**

- The EP trace can be signed and is not a projection onto all cohomological representations.
- Suggested model: The tests use explicit relative cochain complexes and the scalar trace image. The actual Hecke realization for all finite-length admissible representations, coefficient representation and no-discrete-series / proper-induction vanishing theorems remain the source target; a scalar model is not that realization.

**Sources.**

- [Laurent Clozel and Patrick Delorme, Le théorème de Paley-Wiener invariant pour les groupes de Lie réductifs II](https://www.numdam.org/article/ASENS_1990_4_23_2_193_0.pdf), §5 Theorem3, pp.213–215. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-l2-lefschetz"></a>

### L²-Lefschetz traces of Hecke operators

**Theorem** · `AutomorphicSpectralTheory:AS.6/l2-lefschetz`.

Proposed interface: `TauCeti.AutomorphicSpectral.l2_lefschetz` in `TauCeti/Automorphic/Spectral/AS6`.

For Arthur’s reductive Q-group, coefficient ξ, level K_f and central balancing character, the alternating trace of h on finite-dimensional L² relative cohomology is Σ_{π∈Π_disc}m_disc(π)EP(𝔪_G,K∞;π∞⊗ξ)tr π_f(h)=I(f_ξ⊗h). The invariant geometric expansion computes this trace with lower-Levi corrections. In CT20’s split classical integral groups at level one, h=∏_p1_{G(ℤ_p)} with vol G(ℤ_p)=1 gives EP(G;λ)=T_geom(G;λ); its elliptic term is Σ_[γ finite order]vol(G_γ(ℚ)\G_γ(𝔸))O_γ(h)tr(γ|V_λ), with signed Euler–Poincaré measure at infinity and the matching local centralizer measures. Residual cohomology contributes unless a separate theorem excludes it.

**Hypotheses and conventions.**

- Finite-dimensional algebraic coefficient; finite level; full K∞ component convention; invariant quotient by the split center. CT specialization uses the groups and coefficient regularity stated in §1.4. Arthur assumes G(ℝ)/A_G(ℝ)^0 has a compact Cartan subgroup; see §2, p.264. CT20 §1.4 uses its listed split classical groups admitting discrete series (in particular the even orthogonal cases allowed there).

**Construction or proof.**

1. Decompose L² cohomology using the discrete spectrum and finite multiplicity.
2. Use the full finite-length EP identity; apply the one-place cuspidal simplification of the invariant trace.
3. Apply the geometric descent/Lefschetz formula and in level one track the signed archimedean and finite local measures.

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/general-euler-poincare](#automorphicspectraltheory-as-6-general-euler-poincare), [AutomorphicSpectralTheory:AS.6/invariant-trace-formula](#automorphicspectraltheory-as-6-invariant-trace-formula), [AutomorphicSpectralTheory:AS.4/spectral-orthosum](#automorphicspectraltheory-as-4-spectral-orthosum), [AutomorphicSpectralTheory:AS.4/discrete-finite-multiplicity](#automorphicspectraltheory-as-4-discrete-finite-multiplicity).

**Acceptance and prototype scope.**

- L²-Lefschetz is not identified with the cuspidal or ordinary cohomological trace.

**Sources.**

- [James Arthur, The L²-Lefschetz Numbers of Hecke Operators](https://www.claymath.org/library/cw/arthur/pdf/32.pdf), Arthur89 §2, p.264 (compact-Cartan hypothesis), Proposition 2.1; §3 Proposition 3.2; §6 Theorem 6.1; CT20 §1.4. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-024"></a>

### Truncated geometric kernel and fixed-degree trace

**Construction** · `AutomorphicSpectralTheory:AS.6/yu-024`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_024` in `TauCeti/Automorphic/Spectral/AS6`.

Form k_P by the prescribed rational Levi sum, central Xi_G sum and unipotent integral; k^T is the alternating sum over P(F)\G(F) with hat-tau_P(H−T). Set J_e^T=∫_{G(F)\G(A)^e} k^T(x,x) dx and J_e=J_e^0, with convergence proved separately.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. For each parabolic P form the rational Levi kernel by integrating over N_P(𝔸) and summing over M_P(F).
2. Sum its rational P(F)\G(F) translates with the alternating rank sign and the dual-cone truncation cutoff.
3. Establish local finiteness and absolute integrability in the sufficiently regular chamber before integrating the diagonal on the fixed determinant-degree quotient. This gives J_e^T, not evaluation at a singular T.

**Prerequisites.** [AutomorphicSpectralTheory:AS.4/yu-018](#automorphicspectraltheory-as-4-yu-018), [AutomorphicSpectralTheory:AS.3/yu-023](#automorphicspectraltheory-as-3-yu-023), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Uses that determine the interface.**

- **PAPER-YU-23/025**: Input to Convergence and quasipolynomial continuation.
- **PAPER-YU-23/033**: Input to Adelic bundle dictionary and cancellation of automorphism weights.
- **PAPER-YU-23/038**: Input to Characteristic-polynomial refinements of the group and Lie kernels.
- **PAPER-YU-23/063**: Input to Corrected Arthur–Lafforgue spectral expression.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_024.parabolicKernel` | constructor | assemble rational sums and unipotent integration |
| `TauCeti.AutomorphicSpectral.yu_024.truncate` | compatibility | form the locally finite alternating parabolic sum |
| `TauCeti.AutomorphicSpectral.yu_024.fixedDegreeIntegral` | structure | integrate only after convergence and quotient-measure proofs |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_024.test1` (degenerate): For G=GL₁, the parabolic truncation sum has only P=G and k^T=k_G.
- `TauCeti.AutomorphicSpectral.yu_024.test2` (compatibility): Writing J_e^T as an integral is permitted after integrability of the restricted diagonal kernel has been proved; the value at T=0 is J_e.
- `TauCeti.AutomorphicSpectral.yu_024.test3` (non-example): The actual fixed-degree integral of the two-parabolic cusp model on [0,2T] is T and differs from the whole-group-only integral when T>0.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §3.2.1 pp15–16. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-025"></a>

### Convergence and quasipolynomial continuation

**Theorem** · `AutomorphicSpectralTheory:AS.6/yu-025`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_025` in `TauCeti/Automorphic/Spectral/AS6`.

The truncated fixed-degree integral is absolutely convergent; T↦J_e^T is quasipolynomial in the lattice sense, with its extension determined by values sufficiently deep in the positive chamber. T=0 evaluation is not untruncated integration or an unjustified limit of finite counts.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Use the function-field truncation estimates for absolute convergence.
2. On each sufficiently deep chamber the lattice sums have finite exponential-polynomial expansions.
3. Establish uniqueness of that extension before evaluating at zero.
4. Ch15's definition was read, but the full analytic estimates are a source gate..

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/yu-024](#automorphicspectraltheory-as-6-yu-024), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §3.2.1; Theorem 3.3.1; Laf97 p227; Ch15 Definition4.5.3. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-038"></a>

### Characteristic-polynomial refinements of the group and Lie kernels

**Construction** · `AutomorphicSpectralTheory:AS.6/yu-038`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_038` in `TauCeti/Automorphic/Spectral/AS6`.

For monic p∈Fq[X] of degree n restrict the large-T kernels to matrices/endormorphisms with characteristic polynomial p and extend their integrals quasipolynomially. If p(0)≠0, End(E) and Aut(E) fibres coincide; hence J_e=Σ_{p(0)≠0} tildeJ_p,e.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Apply the characteristic-polynomial map to the Lie-algebra summands and retain exactly the chosen rational polynomial fibre; conjugation preserves this condition.
2. Define the parabolic constant-term and alternating truncated Lie kernels with the same fibre condition and quotient measures.
3. Use the cited Lie-trace/reduction theorem for absolute convergence and deep-chamber quasi-polynomial dependence of the Lie fibre. For p(0)≠0 the group fibre equals the Lie fibre; for p(0)=0 the group fibre is empty. Apply uniqueness of lattice quasi-polynomial continuation. The external Lie-trace proof remains a named source dependency.

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/yu-024](#automorphicspectraltheory-as-6-yu-024), [AutomorphicSpectralTheory:AS.6/yu-025](#automorphicspectraltheory-as-6-yu-025), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [AutomorphicSpectralTheory:AS.3/yu-157](#automorphicspectraltheory-as-3-yu-157).

**Uses that determine the interface.**

- **PAPER-YU-23/037**: Input to Higgs count and geometrically indecomposable bundles.
- **PAPER-YU-23/039**: Input to Coprime scalar-nilpotent vanishing and the Fourier comparison.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_038.charpolyFibre` | constructor | restrict kernel sums to a monic degree-n polynomial |
| `TauCeti.AutomorphicSpectral.yu_038.lieKernel` | compatibility | replace automorphisms by all endomorphisms |
| `TauCeti.AutomorphicSpectral.yu_038.continueInT` | structure | extend each truncated integral quasipolynomially |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_038.test1` (computation): The scalar matrix a·Id belongs to the (X−a)^n characteristic-polynomial fibre.
- `TauCeti.AutomorphicSpectral.yu_038.test2` (non-example): For n>0, the zero matrix belongs to the X^n fibre, is not invertible, and does not belong to the (X−1)^n fibre.
- `TauCeti.AutomorphicSpectral.yu_038.test3` (characterisation): For A in the p characteristic-polynomial fibre, A is invertible iff p has nonzero constant term; on a bundle use the corresponding global Cayley–Hamilton inverse.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), AppendixB pp78–79. Appendix B, p.79, uses characteristic-polynomial fibres; the Lie-trace theorem cited there remains an explicit external proof gap.

<a id="automorphicspectraltheory-as-6-yu-039"></a>

### Coprime scalar-nilpotent vanishing and the Fourier comparison

**Theorem** · `AutomorphicSpectralTheory:AS.6/yu-039`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_039` in `TauCeti/Automorphic/Spectral/AS6`.

(Chaudouard, D = 0.) Let gcd(n,e) = 1. (a) [Ch15, Thm 6.2.1] For monic p ∈ F_q[X] of degree n, the T = 0 value J̃_{p,e} of the Lie-algebra quasi-polynomial vanishes unless p = (X−α)^n with α ∈ F_q, in which case J̃_{p,e} = J̃_{nilp,e}. (b) [Ch15, Cor 5.2.3] For every T and e, Σ_p J̃^T_{p,e} = J^{T,e}_0 = q^{n²(1−g)} J^{T,e}_K, with K a canonical divisor. (c) [Ch15, Cor 5.2.2] Since deg K = 2g−2, J^{0,e}_K is the mass Σ 1/|Aut| of the groupoid of semistable Higgs bundles (E, θ: E → E ⊗ ω) of rank n and degree e over F_q. Hence J_e = (q−1)J̃_{nilp,e} = ((q−1)/q) Σ_p J̃_{p,e} = ((q−1)/q) q^{−n²(g−1)} mass(Higgs^{ss}_{n,e}(X_1)(F_q)).

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. For the scalar-nilpotent support, follow Ch15 Thm6.2.1's reduction through characteristic-polynomial factors and the degree coprimality obstruction; its downstream lemmas remain to be read.
2. For Fourier comparison apply Poisson summation to the two kernels.
3. Ch15 Thm5.2.1 and its corollaries were read through their proofs..

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/yu-025](#automorphicspectraltheory-as-6-yu-025), [AutomorphicSpectralTheory:AS.6/yu-038](#automorphicspectraltheory-as-6-yu-038), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), Appendix B, p. 79; [Ch15, Théorème 6.2.1, Corollaires 5.2.2–5.2.3]. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-047"></a>

### Weyl permutations and fixed Levis

**Definition** · `AutomorphicSpectralTheory:AS.6/yu-047`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_047` in `TauCeti/Automorphic/Spectral/AS6`.

Let M be a semi-standard Levi subgroup of G=GL_n and w in W_n (a permutation matrix). Put w(M)=wMw^{-1}; then w(a_M)=a_{w(M)} and w induces an isomorphism w: X_M^G -> X_{w(M)}^G, w(λ)(m)=λ(w^{-1}mw) for m in w(M)(A). If w(M)=M (so w permutes the blocks of M, necessarily among blocks of equal size), there is a smallest Levi subgroup L_w containing M and w; it is characterized by a_{L_w}=ker((w−id)|a_M), its blocks are the unions of the blocks of M along the cycles of the block permutation induced by w, and w acts trivially on X_{L_w}^G. For M ⊆ L, restriction of characters gives an inclusion X_L^G ⊆ X_M^G. Track the lattices a_{M,Z}, a_{L,Z} as well as the real spaces.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Decompose the block permutation w into cycles. A height is w-fixed exactly when its coordinates are constant on each cycle.
2. Group each cycle into its corresponding Levi block and identify this fixed space with the Levi height space.
3. On character tori retain the weighted central equation; its finite central components cannot be removed by passing only to the connected identity component.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/yu-010](#automorphicspectraltheory-as-1-yu-010), [AutomorphicSpectralTheory:AS.3/yu-022](#automorphicspectraltheory-as-3-yu-022), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Uses that determine the interface.**

- **PAPER-YU-23/049**: Input to Arthur theta denominator and multiplicative families.
- **PAPER-YU-23/056**: Input to Generic auxiliary chamber selector.
- **PAPER-YU-23/145**: Input to Cycle coordinates for the spectral character cover.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_047.leviFromCycles` | constructor | construct L_w from the permutation orbits |
| `TauCeti.AutomorphicSpectral.yu_047.fixedVectorSpace` | compatibility | identify a_L with ker(w−1) |
| `TauCeti.AutomorphicSpectral.yu_047.centralCharacterAction` | structure | prove w fixes X_L^G |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_047.test1` (degenerate): For w=1 the minimal fixed Levi is M.
- `TauCeti.AutomorphicSpectral.yu_047.test2` (computation): For M=GL_d×GL_d and w swapping the two blocks, L_w=GL_(2d).
- `TauCeti.AutomorphicSpectral.yu_047.test3` (non-example): For M=GL₁^4 and w=(12)(34), L_w=GL₂×GL₂ up to permutation, rather than GL₄.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §4.1.1, p. 21, and §4.1.3, p. 22. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-048"></a>

### Multiplicative and linear torus pairings

**Definition** · `AutomorphicSpectralTheory:AS.6/yu-048`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_048` in `TauCeti/Automorphic/Spectral/AS6`.

In determinant coordinates set X_M^G={(lambda_i):∏lambda_i^ni=1}. Write lambda^H=∏lambda_i^H_i but <lambda,H>=Σlambda_i H_i, using the coordinate embedding, not a logarithm. The finite central subgroup X_G^G is mu_n.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Evaluate a degree character on an integral determinant tuple by the product ∏λ_i^{H_i}; addition of degrees becomes multiplication of values.
2. Define the additive coordinate pairing separately by Σλ_iH_i; no logarithm is used.
3. Restrict to the diagonal scalar subgroup and its rank-n relation to identify X_G^G with μ_n.

**Prerequisites.** [AutomorphicSpectralTheory:AS.1/yu-010](#automorphicspectraltheory-as-1-yu-010), [AutomorphicSpectralTheory:AS.3/yu-022](#automorphicspectraltheory-as-3-yu-022), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Uses that determine the interface.**

- **PAPER-YU-23/049**: Input to Arthur theta denominator and multiplicative families.
- **PAPER-YU-23/053**: Input to Root-coordinate Haar integral.
- **PAPER-YU-23/058**: Input to Degree-filtered lattice cone series.
- **PAPER-YU-23/059**: Input to Floor-vector expression for the cone series.
- **PAPER-YU-23/070**: Input to Cyclic character fibres.
- **PAPER-YU-23/145**: Input to Cycle coordinates for the spectral character cover.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_048.multiplicativePairing` | constructor | evaluate lambda^H with integer exponents |
| `TauCeti.AutomorphicSpectral.yu_048.linearPairing` | compatibility | evaluate the coordinate-linear form without logarithms |
| `TauCeti.AutomorphicSpectral.yu_048.centralRoots` | structure | identify X_G^G with mu_n |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_048.test1` (compatibility): lambda^(H+K)=lambda^H*lambda^K for integral H,K.
- `TauCeti.AutomorphicSpectral.yu_048.test2` (computation): For H=(1,−1), lambda^H=lambda1/lambda2 whereas <lambda,H>=lambda1−lambda2.
- `TauCeti.AutomorphicSpectral.yu_048.test3` (degenerate): For H=0 the multiplicative pairing is1 and the additive pairing is0.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §4.1.5–4.1.6, p. 22. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-049"></a>

### Arthur theta denominator and multiplicative families

**Definition** · `AutomorphicSpectralTheory:AS.6/yu-049`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_049` in `TauCeti/Automorphic/Spectral/AS6`.

For a semi-standard Levi L, the chambers of a_L^G correspond to P(L) via P ↦ {H in a_L^G : α(H)>0 for all α in Δ_P}; P̄ denotes the opposite parabolic (Φ_P̄=−Φ_P), and P,Q in P(L) are adjacent when |Φ_P̄ ∩ Φ_Q|=1. For Q in P(M) and λ in X_M put θ_Q(λ)=∏_{α in Δ_Q}⟨λ,α^∨⟩ (the linear pairing of 4.1.6, so ⟨λ,α^∨⟩=λ_u−λ_v for α^∨=e_{M,u}−e_{M,v}); this differs from Arthur's θ_Q by a volume factor. Let Ω ⊆ X_M^G or X_M be a domain. A family (c_P)_{P in P(M)} of holomorphic functions on Ω is a (G,M)-family if c_P(λ)=c_{P'}(λ) for every adjacent pair P,P' and every λ in Ω with λ^{α^∨}=1, where α is the unique root in Φ_P ∩ Φ_{P̄'}. For such a family c_M(λ)=Σ_{Q in P(M)} c_Q(λ)θ_Q(λ)^{-1} is meromorphic on Ω. A domain around a noncentral translate must be specified when one is used.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. For each parabolic Q construct θ_Q as the product of the stated additive coordinate differences, omitting Arthur’s covolume factor only in the type-A normalization.
2. Specify the complex domain and impose equality of holomorphic adjacent members on λ^{α∨}=1.
3. Form Σ_Q c_Q/θ_Q on the complement of the walls. Its continuation is the next theorem, not an axiom of this definition.

**Prerequisites.** [AutomorphicSpectralTheory:AS.3/yu-022](#automorphicspectraltheory-as-3-yu-022), [AutomorphicSpectralTheory:AS.6/yu-047](#automorphicspectraltheory-as-6-yu-047), [AutomorphicSpectralTheory:AS.6/yu-048](#automorphicspectraltheory-as-6-yu-048), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [AutomorphicSpectralTheory:AS.6/gm-family](#automorphicspectraltheory-as-6-gm-family), [AutomorphicSpectralTheory:AS.6/gm-splitting](#automorphicspectraltheory-as-6-gm-splitting).

**Uses that determine the interface.**

- **PAPER-YU-23/050**: Input to Regularized family value and descent.
- **PAPER-YU-23/052**: Input to Root-product derivative formula.
- **PAPER-YU-23/061**: Input to Intertwiners and operator-valued families.
- **PAPER-YU-23/115**: Input to Degree floor-monomial family.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_049.adjacentCompatibility` | constructor | state equality on the multiplicative coroot wall |
| `TauCeti.AutomorphicSpectral.yu_049.theta` | compatibility | construct the product of coordinate differences |
| `TauCeti.AutomorphicSpectral.yu_049.regularizedSum` | structure | name the sum before proving removable singularities |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_049.test1` (computation): For GL₂ with diagonal Levi, theta_B=lambda1−lambda2 and theta_Bop=lambda2−lambda1.
- `TauCeti.AutomorphicSpectral.yu_049.test2` (non-example): The multiplicative wall equation from the actual coroot (1,−1) rejects any yu_049 family with constant adjacent members one and two on the whole character domain.
- `TauCeti.AutomorphicSpectral.yu_049.test3` (degenerate): For M=G, theta_G=1 and the single holomorphic member automatically satisfies the adjacency condition.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §4.1.2, p. 21, and §4.2.1, p. 23, Définition 4.2.1 and (4.2.1). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-050"></a>

### Regularized family value and descent

**Theorem** · `AutomorphicSpectralTheory:AS.6/yu-050`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_050` in `TauCeti/Automorphic/Spectral/AS6`.

(a) Let (c_Q)_{Q in P(M)} be meromorphic on X_M^G (or X_M) and a (G,M)-family on a neighbourhood of λ0 in X_M^G (or X_M). Then c_M(λ)=Σ_Q c_Q(λ)θ_Q(λ)^{-1} is regular at λ0. (b) For a (G,M)-family near 1 put c_M=lim_{λ→1}c_M(λ). For L in L(M), R in P(L) and Q in P^L(M), c^R_Q(λ)=c_{QN_R}(λ) (QN_R the unique element of P(M) contained in R with QN_R ∩ L=Q) is an (L,M)-family near 1, with value c^R_M=lim_{λ→1}Σ_{Q in P^L(M)} c^R_Q(λ)θ^L_Q(λ)^{-1}, θ^L_Q(λ)=∏_{α in Δ^L_Q}⟨λ,α^∨⟩. (c) For Q in P(L) and λ in X_L^G, c_Q(λ):=c_P(λ) for any P in P(M) with P ⊆ Q is independent of P and defines a (G,L)-family near 1.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Subtract adjacent chamber values; the wall-compatibility condition cancels the corresponding simple-root denominator.
2. Iterating over walls makes the total sum regular.
3. Restrict characters along nested Levis to prove the two descent constructions.
4. Arthur's original regularization proof is still an imported leaf.
5. Freshly read Laf97 VI.2 Lemma7 pp303–304: fix a root wall, pair permutations in which its two labels are adjacent, and use their equal wall values to divide their difference by the wall equation.
6. Other terms have no pole there.
7. Repeating over all root walls removes the product denominator; intersections do not introduce a new pole.
8. Corollary10 applies this to the full family before the contour reaches the unitary locus..

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/yu-049](#automorphicspectraltheory-as-6-yu-049), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [AutomorphicSpectralTheory:AS.6/gm-family](#automorphicspectraltheory-as-6-gm-family), [AutomorphicSpectralTheory:AS.6/gm-splitting](#automorphicspectraltheory-as-6-gm-splitting).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §4.2.1–4.2.2, p. 23, Théorème 4.2.2 and (4.2.2)–(4.2.5). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-051"></a>

### Product formula for families

**Theorem** · `AutomorphicSpectralTheory:AS.6/yu-051`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_051` in `TauCeti/Automorphic/Spectral/AS6`.

If c_M^Q is independent of Q∈P(L) for every L⊇M, then (cd)_M=Σ_L c_M^L d_L in Yu's normalization. This hypothesis is essential; the formula is not asserted for arbitrary families without the partial-value compatibility.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Apply the two-family descent expansion.
2. The hypothesis that c_M^Q depends only on its Levi allows collecting the terms with that Levi into c_M^L d_L.
3. Preserve that hypothesis in the API; arbitrary partial values do not permit the simplification..

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/yu-050](#automorphicspectraltheory-as-6-yu-050), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [AutomorphicSpectralTheory:AS.6/gm-family](#automorphicspectraltheory-as-6-gm-family), [AutomorphicSpectralTheory:AS.6/gm-splitting](#automorphicspectraltheory-as-6-gm-splitting).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §4.2.2, pp. 23–24, Proposition 4.2.3 (variant of Arthur 1981, Corollary 6.5). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-052"></a>

### Root-product derivative formula

**Theorem** · `AutomorphicSpectralTheory:AS.6/yu-052`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_052` in `TauCeti/Automorphic/Spectral/AS6`.

For each root beta choose c_beta meromorphic on C*, regular at 1 with c_beta(1)=1. The products c_Q=∏_{beta∈Phi_Q} c_beta(lambda^beta∨) form a family; c_M=Σ_F ∏_{beta∈F}c_beta'(1), where F ranges over root subsets forming a basis of a_M^{G,*}.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Linearize one root factor at a time and use regularization to discard terms of degree below dim(a_M^G).
2. The surviving squarefree terms correspond exactly to root bases; their lattice determinants fix the normalization.
3. Yu's induction supplies the multiplicative-family version..

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/yu-049](#automorphicspectraltheory-as-6-yu-049), [AutomorphicSpectralTheory:AS.6/yu-050](#automorphicspectraltheory-as-6-yu-050), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [AutomorphicSpectralTheory:AS.6/gm-family](#automorphicspectraltheory-as-6-gm-family), [AutomorphicSpectralTheory:AS.6/gm-splitting](#automorphicspectraltheory-as-6-gm-splitting).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), Theorem4.2.4 pp24–26. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-053"></a>

### Root-coordinate Haar integral

**Theorem** · `AutomorphicSpectralTheory:AS.6/yu-053`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_053` in `TauCeti/Automorphic/Spectral/AS6`.

For a root basis F and continuous functions fβ on S¹, the root-coordinate homomorphism p:Im X_M^G→(S¹)^F is surjective with finite kernel and pushes probability Haar to probability Haar. Thus ∫∏β fβ(pβ(λ))dλ=∏β(1/(2πi))∮ fβ(z)dz/z. Equivalently, including ∏βpβ(λ) in the integrand gives ∏β(1/(2πi))∮ fβ(z)dz, as in Yu Lemma4.2.5.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. The exponent homomorphism of compact tori associated to a root basis is surjective with finite kernel.
2. Pushforward of probability Haar measure is probability Haar measure.
3. Apply Fubini and the probability-circle measure dz/(2πiz); the coordinate factor in Yu cancels each z denominator.

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/yu-048](#automorphicspectraltheory-as-6-yu-048), [AutomorphicSpectralTheory:AS.6/yu-052](#automorphicspectraltheory-as-6-yu-052), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), Lemma4.2.5 p26. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-054"></a>

### Argument-principle integral of a family

**Theorem** · `AutomorphicSpectralTheory:AS.6/yu-054`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_054` in `TauCeti/Automorphic/Spectral/AS6`.

Assume each c_beta is meromorphic on a neighborhood of the closed unit disk and nonzero and finite on S1. For the ratio root-product family, its integrated regularized value is Σ_F∏_{beta∈F}(N(c_beta)−P(c_beta)), counting multiplicities in |z|<1. Rational L-ratios satisfy the needed extension assumption when boundary singularities are absent.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Apply item52 to the translated ratio family.
2. Integrate each logarithmic derivative via item53, then use the argument principle on the disk.
3. Meromorphic continuation to the disk and absence of boundary zeros/poles are essential, not consequences of meromorphicity on C* alone..

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/yu-052](#automorphicspectraltheory-as-6-yu-052), [AutomorphicSpectralTheory:AS.6/yu-053](#automorphicspectraltheory-as-6-yu-053), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), Corollary4.2.6 p27, corrected E4. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-055"></a>

### Ambient independence and central-translation vanishing

**Theorem** · `AutomorphicSpectralTheory:AS.6/yu-055`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_055` in `TauCeti/Automorphic/Spectral/AS6`.

(a) [Lemme 4.2.7] If c_Q(λ)=∏_{β in Φ_Q} c_β(λ^{β^∨}) as in Théorème 4.2.4, then for every L in L(M) the value c^R_M is independent of R in P(L) (write c^L_M): c^R_Q=∏_{β in Φ(Z_M,N_Q)}c_β(λ^{β^∨})·∏_{β in Φ(Z_M,N_R)}c_β(λ^{β^∨}), and the second factor tends to 1. (b) [Lemme 4.2.8] Let μ0 in X_M^G and let (c_Q) be a (G,M)-family on a domain containing μ0^Z such that c^R_M is independent of R in P(L) for every L in L(M) and c_Q(λμ0)=c_Q(λ) wherever c_Q is defined. Then lim_{λ→1}Σ_{Q in P(M)} θ_Q(λμ0)^{-1}c_Q(λμ0)=0 unless μ0 in X_G^G, and for μ0 in X_G^G it equals μ_{01}^{−dim a_M^G} c_M, where μ_{01} is the (common) first coordinate of μ0.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Factor the roots into Levi-internal and external roots; the latter evaluate to one on the restricted torus.
2. For central translation track the theta scaling.
3. If a noncentral root value survives, the translated family has a missing pole and its regularized limit vanishes..

**Prerequisites.** [AutomorphicSpectralTheory:AS.6/yu-050](#automorphicspectraltheory-as-6-yu-050), [AutomorphicSpectralTheory:AS.6/yu-051](#automorphicspectraltheory-as-6-yu-051), [AutomorphicSpectralTheory:AS.6/yu-052](#automorphicspectraltheory-as-6-yu-052), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [AutomorphicSpectralTheory:AS.6/gm-family](#automorphicspectraltheory-as-6-gm-family), [AutomorphicSpectralTheory:AS.6/gm-splitting](#automorphicspectraltheory-as-6-gm-splitting).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), Lemmas4.2.7–4.2.8 pp27–29. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-062"></a>

### Finite-kernel torus Fourier inversion

**Theorem** · `AutomorphicSpectralTheory:AS.6/yu-062`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_062` in `TauCeti/Automorphic/Spectral/AS6`.

For L=L_w, the map mu_w:Im X_L^G×Im X_M^L→Im X_M^G, (mu,lambda')↦lambda' mu/w^−1(lambda'), is surjective with finite kernel of size |w||X_L^L|, where |w| is the product of cycle lengths. Haar Fourier inversion converts the character sum into a normalized sum over its finite fibres.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Items145–147 give the explicit cycle proof of the cover and its degree;148–150 prove the normalized transfer and pointwise Fourier identity using probability Haar and absolute summability.
2. See the report for the proof, including disconnected components.
3. These elementary adapters no longer depend on the unresolved trace-formula normalization..

**Prerequisites.** [AutomorphicSpectralTheory:AS.0/yu-145](#automorphicspectraltheory-as-0-yu-145), [AutomorphicSpectralTheory:AS.0/yu-146](#automorphicspectraltheory-as-0-yu-146), [AutomorphicSpectralTheory:AS.0/yu-147](#automorphicspectraltheory-as-0-yu-147), [AutomorphicSpectralTheory:AS.0/yu-148](#automorphicspectraltheory-as-0-yu-148), [AutomorphicSpectralTheory:AS.0/yu-149](#automorphicspectraltheory-as-0-yu-149), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [mathlib:MonoidHom.measurePreserving](#mathlib-monoidhom-measurepreserving), [mathlib:UnitAddTorus.hasSum_mFourier_series_apply_of_summable](#mathlib-unitaddtorus-hassum-mfourier-series-apply-of-summable), [mathlib:AddChar.expect_eq_ite](#mathlib-addchar-expect-eq-ite).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §5.2.3 pp34–35. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-063"></a>

### Corrected Arthur–Lafforgue spectral expression

**Theorem** · `AutomorphicSpectralTheory:AS.6/yu-063`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_063` in `TauCeti/Automorphic/Spectral/AS6`.

For G=GL_n over F_q(X), n>0, the everywhere-unramified trace at T=0 is J_eta=Σ_[(P,pi)] |stab(P,pi)|⁻¹ Σ_[(w,tau)∈stab(P,pi)] ∫_(lambda∈A) D⁻¹ Σ_[(a,c)∈mu_w⁻¹(tau)] F_eta(lambda,a,c) d lambda. Here A=Im X_L^G, B=Im X_M^L, L=L_w, mu_w(a,c)=a*c/w⁻¹(c), D=|w||X_L^L|, and F_eta is the exact ordered regularized trace151 with h_Q(v)=hat1_Q(v eta⁻¹). Haar on A has total mass one, including all components. The finite fibre is equivalently a∈A,b∈B0,tau=a*b,c∈B,δ_w(c)=b. Replacing h_Q by hat1_Q^e gives J_e for every e∈Z. No good-representative hypothesis is required for this spectral identity. Its proof and scalar specialization require the coherent normalization and analytic prerequisites retained in S2. Here F_η is the ordered operator trace defined in AS.6/yu-151; both the all-lifts fiber sum and D⁻¹ are retained.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Start with Laf97 VI.2 Lemma9/Corollary10, not its unexpanded Theorem11.
2. Yu (5.2.10) shifts the contour variable by eta⁻¹.
3. Decompose the parameter in A*B using probability-Haar pushforward142, and replace (w,tau) by its inverse (w⁻¹,w(tau)⁻¹) to obtain (5.2.11).
4. After the regularized Q-sum is smooth, apply149 to its character coefficient to evaluate on mu_w⁻¹(tau).
5. This gives exactly151, with D⁻¹.
6. Item152 recovers each degree.
7. Source-to-operator identification still imports Langlands unitarity, functional equations and gluing; S2 does not claim those original proofs or the rho dictionary fully closed..

**Prerequisites.** [AutomorphicSpectralTheory:AS.4/yu-018](#automorphicspectraltheory-as-4-yu-018), [AutomorphicSpectralTheory:AS.6/yu-024](#automorphicspectraltheory-as-6-yu-024), [AutomorphicSpectralTheory:AS.6/yu-025](#automorphicspectraltheory-as-6-yu-025), [AutomorphicSpectralTheory:AS.3/yu-058](#automorphicspectraltheory-as-3-yu-058), [AutomorphicSpectralTheory:AS.2/yu-061](#automorphicspectraltheory-as-2-yu-061), [AutomorphicSpectralTheory:AS.6/yu-062](#automorphicspectraltheory-as-6-yu-062), [AutomorphicSpectralTheory:AS.6/yu-151](#automorphicspectraltheory-as-6-yu-151), [AutomorphicSpectralTheory:AS.6/yu-152](#automorphicspectraltheory-as-6-yu-152), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), Theorem5.2.2 andCorollary5.2.3 pp33–36; corrected Laf97 theorem. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-151"></a>

### Typed finite-fibre operator trace

**Construction** · `AutomorphicSpectralTheory:AS.6/yu-151`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_151` in `TauCeti/Automorphic/Spectral/AS6`.

For a discrete pair (P,pi), (w,tau)∈stab(P,pi), L=L_w, a∈A, b∈B0, tau=a*b and c∈B with δ_w(c)=b, put z=lambda*c for lambda∈A. Define R_Q(z;v)=M_(R|P)(z)⁻¹∘M_(R|P)(z/v), where R∈P^Q(M), v∈X_L^G. For h_Q=hat1_Q(·eta⁻¹) or hat1_Q^e, set F_h(lambda,a,c)=lim_(mu→1 in X_L^G) Tr_(A_P,pi)[(Σ_(Q∈P(L))h_Q(mu*a) R_Q(z;mu*a))∘M(w,w⁻¹(c))∘U_tau]. U_tau is multiplication by tau. The Q-sum is continued holomorphically before evaluation at mu=1; the other parameters are unitary.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Use the stabilizer equation to type U_τ:A_(P,π)→A_(P,π⊗τ) and the following Weyl intertwiner back to A_(P,π). Only their composition is an endomorphism.
2. Define R_Q=M_(R|P)(z)⁻¹M_(R|P)(z/v); the continued functional equation proves independence of the auxiliary R.
3. Use adjacent-wall compatibility to continue the entire weighted Q-sum holomorphically near μ=1. Take its finite-dimensional trace with M(w,w⁻¹c)∘U_τ in the retained order, then evaluate the limit.
4. For the spectral contribution integrate on probability Haar and average over all D lifts, with the separate reciprocal stabilizer cardinal. Unitarity and the holomorphic-sum input are source dependencies, not assumed trace identities.

**Prerequisites.** [AutomorphicSpectralTheory:AS.4/yu-018](#automorphicspectraltheory-as-4-yu-018), [AutomorphicSpectralTheory:AS.3/yu-058](#automorphicspectraltheory-as-3-yu-058), [AutomorphicSpectralTheory:AS.2/yu-061](#automorphicspectraltheory-as-2-yu-061), [AutomorphicSpectralTheory:AS.0/yu-145](#automorphicspectraltheory-as-0-yu-145), [AutomorphicSpectralTheory:AS.0/yu-147](#automorphicspectraltheory-as-0-yu-147), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [AutomorphicSpectralTheory:AS.6/yu-049](#automorphicspectraltheory-as-6-yu-049), [AutomorphicSpectralTheory:AS.6/yu-050](#automorphicspectraltheory-as-6-yu-050).

**Uses that determine the interface.**

- **PAPER-YU-23/063**: Input to Corrected Arthur–Lafforgue spectral expression.
- **PAPER-YU-23/152**: Input to Degree Fourier recovery of the spectral contribution.

**API.**

| Proposed name | Role | Required statement |
| --- | --- | --- |
| `TauCeti.AutomorphicSpectral.yu_151.stabilizerTransport` | compatibility | U_tau:A_P,pi→A_P,pi⊗tau followed by M(w,w⁻¹c):A_P,pi⊗tau→A_P,w(pi⊗tau)=A_P,pi closes the endomorphism because stab means w(pi⊗tau)=pi. |
| `TauCeti.AutomorphicSpectral.yu_151.regularizedFamily` | constructor | For a fixed fibre and lambda form the meromorphic Q-sum, prove its extension near mu=1 by adjacent-wall gluing, then take the finite-dimensional trace. |
| `TauCeti.AutomorphicSpectral.yu_151.spectralContribution` | structure | Integrate F_h over probability Haar on A and average over the D-point fibre; multiply by \|stab(P,pi)\|⁻¹. Choice of R within P^Q(M) does not change the operator. |

**Unit tests.**

- `TauCeti.AutomorphicSpectral.yu_151.test1` (degenerate): For all cycle lengths one, count the actual finite kernel of the map (a,c)↦aδ(c) on the constructed A×B cover: its cardinal is ∏d_j, retaining every finite component.
- `TauCeti.AutomorphicSpectral.yu_151.test2` (non-example): In the general stabilizer case U_tau alone need not end in A_P,pi; the trace is formed only after the Weyl transport closes the endomorphism.
- `TauCeti.AutomorphicSpectral.yu_151.test3` (compatibility): For M=L=G the parabolic sum has one term and R_G(z;v)=Id; the formula reduces to the finite character average of h_G(a) times Tr(M(1,c)∘U_tau).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, §§5.2.2–5.2.3 pp32–36; detailed derivation in the continuation report. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-152"></a>

### Degree Fourier recovery of the spectral contribution

**Theorem** · `AutomorphicSpectralTheory:AS.6/yu-152`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_152` in `TauCeti/Automorphic/Spectral/AS6`.

Let n>0, zeta primitive of order n and eta=zeta^deg. If J_(eta^k)=Σ_(e mod n)zeta^(ek) J_e, then J_e=n⁻¹Σ_(k mod n)zeta^(−ek)J_(eta^k). In151 this replaces hat1_Q(mu*a*eta^(−k)) by hat1_Q^e(mu*a)=n⁻¹Σ_k zeta^(ek)hat1_Q(mu*a*eta^k), leaving the fibre, operator order and denominator unchanged. It holds for every integer e, not just coprime e.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Apply finite character orthogonality144 to Z/nZ.
2. Interchange only finite sums with integrals and the regularized limit, then substitute k↦−k in the cone-series term.
3. Coprimality is used later in067, not in this recovery..

**Prerequisites.** [AutomorphicSpectralTheory:AS.3/yu-058](#automorphicspectraltheory-as-3-yu-058), [AutomorphicSpectralTheory:AS.6/yu-151](#automorphicspectraltheory-as-6-yu-151), `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [mathlib:MonoidHom.measurePreserving](#mathlib-monoidhom-measurepreserving), [mathlib:UnitAddTorus.hasSum_mFourier_series_apply_of_summable](#mathlib-unitaddtorus-hassum-mfourier-series-apply-of-summable), [mathlib:AddChar.expect_eq_ite](#mathlib-addchar-expect-eq-ite).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, §§5.2.2–5.2.3 pp32–36; detailed derivation in the continuation report. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-164"></a>

### Twisted truncated trace and its degree decomposition

**Theorem** · `AutomorphicSpectralTheory:AS.6/yu-164`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_164` in `TauCeti/Automorphic/Spectral/AS6`.

Let n≥1, ζ an n-th root of unity and η=ζ^{deg det} in X_G^G. Define J^T_η:=∫_{G(F)\G(A)/Ξ_G} η(g)k^T(g,g)dg, with k^T Arthur's truncated kernel (item 024) and Ξ_G=a^Z (a a fixed idele of degree 1, as a scalar matrix, so deg det a=n). Since G(F) ⊂ G(A)^0, k^T(g,g) is Ξ_G-invariant, and G(F)\G(A)^e → G(F)\G(A)/Ξ_G is a measure-preserving bijection onto the classes with deg det ≡ e (mod n), one has J^T_η=Σ_{e=1}^n ζ^e J^T_e with J^T_e=∫_{G(F)\G(A)^e}k^T(x,x)dx, and J^T_e depends only on e mod n. Hence, for ζ primitive, J^T_{η^k}=Σ_{e=1}^nζ^{ek}J^T_e for all k in Z and J^T_e=n^{-1}Σ_{k=1}^nζ^{−ek}J^T_{η^k} for all e in Z.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. The scalar central subgroup a^ℤ changes determinant degree by n, so the quotient decomposes into exactly the residue classes e mod n.
2. Use the measure-preserving identification of each class with the degree-e automorphic quotient and the central invariance of the truncated diagonal kernel.
3. Integrate the factor ζ^{deg det}; this gives the finite sum of ζ^eJ_e^T. For primitive ζ apply character orthogonality to recover every degree component, with n⁻¹ normalization.

**Prerequisites.** `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [AutomorphicSpectralTheory:AS.6/yu-024](#automorphicspectraltheory-as-6-yu-024), [AutomorphicSpectralTheory:AS.6/yu-152](#automorphicspectraltheory-as-6-yu-152).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §5.2.3, p. 33, equation (5.2.8); p. 36, displays before Corollaire 5.2.3. The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-165"></a>

### Lafforgue's spectral expansion before Fourier inversion, twisted by η

**Theorem** · `AutomorphicSpectralTheory:AS.6/yu-165`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_165` in `TauCeti/Automorphic/Spectral/AS6`.

(Lafforgue 1997, VI §2, through Lemme 9 and Corollaire 10, with the change of variable μ_Q ↦ μ_Qη^{-1} at the start of step (e), p. 304.) For G=GL_n over the function field F of X_1 and η in X_G^G, J_η=J_η^{T=0} equals the sum, over inertial classes of everywhere-unramified discrete pairs (P,π) and over continuous characters χ of Im X_{M_P}^G, of |stab(P,π)|^{-1}Σ_{(w,λ_π) in stab(P,π)} lim_{μ0 in X_{L_w}^G, μ0→1} Σ_{Q in P(L_w)} ∫_{Im X_{L_w}^G}∫_{Im X_{M_P}^G} 1̂_Q(μμ0η^{-1}) χ(λ w(λ_π)μ0μ/w(λ)) Tr_{A_{P,π}}(M_Q(λ,P;μμ0) ∘ M(w^{-1},w(λ)) ∘ w(λ_π)^{-1}) dλ dμ, with probability Haar measures. The Q-sum is continued holomorphically as a whole before μ0→1 (Laf97 Corollaire 10), using the isometry of intertwiners on the unitary axis, the functional equation, and the relations w(λ0)^{H_P}M(w,λ)φ=M(w,λλ0^{-1})(φλ0^{H_P}) and M(w,λμ)=M(w,λ) for μ in X_{L_w}^G.

**Hypotheses and conventions.**

- Function-field branch: F=𝔽_q(X), smooth projective geometrically connected curve; n>0; everywhere-unramified GL_n data unless the statement specifies a general compact-group result.
- Haar measure on each whole compact character group has total mass one. For a group with r connected components, every component has mass 1/r, not mass one separately; degree sign and δ^(1/2) normalization are fixed.

**Construction or proof.**

1. Use the cited Lafforgue VI.2 Lemma9/Corollary10 spectral expression with a holomorphic continuation of the entire Q-sum before μ₀→1. The original proof is an explicit remaining source dependency.
2. Perform μ_Q↦μ_Qη⁻¹ in probability Haar coordinates and transform both the cutoff and the scalar character argument.
3. Retain the operator order M_Q∘M(w⁻¹,w(λ))∘w(λ_π)⁻¹ and the reciprocal stabilizer cardinal.
4. Use the coherent section/intertwiner normalization, unitary-axis isometry and functional equation for the changed integrand; justify exchanges by the named smooth Fourier and uniform regularization inputs, not the number-field theorem.

**Prerequisites.** `AdelicAlgebraicGroups:AA.0/restricted-haar-product`, [AutomorphicSpectralTheory:AS.2/yu-061](#automorphicspectraltheory-as-2-yu-061), [AutomorphicSpectralTheory:AS.6/yu-164](#automorphicspectraltheory-as-6-yu-164), [AutomorphicSpectralTheory:AS.6/yu-151](#automorphicspectraltheory-as-6-yu-151), [AutomorphicSpectralTheory:AS.0/yu-149](#automorphicspectraltheory-as-0-yu-149).

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §5.2.3, p. 34, proof of Théorème 5.2.2, equation (5.2.10). The indicated passage supplies the definition or theorem under the hypotheses stated here; the proof sketch records the extension or adaptation.

<a id="automorphicspectraltheory-as-6-yu-169"></a>

### Arthur's root-basis identity for θ-sums

**Theorem** · `AutomorphicSpectralTheory:AS.6/yu-169`.

Proposed interface: `TauCeti.AutomorphicSpectral.yu_169` in `TauCeti/Automorphic/Spectral/AS6`.

Let m=dim a_M^G and β_1,…,β_m distinct elements of Φ(Z_M,G). For ξ in a_{M,C}^* with ⟨ξ,α^∨⟩≠0 for all α in Φ(Z_M,G), Σ'_Q θ_Q(ξ)^{-1}∏_{j=1}^m⟨ξ,β_j^∨⟩, summed over the Q in P(M) with {β_1,…,β_m} ⊆ Φ_Q, equals 0 if the β_j are linearly dependent and 1 if they form a basis of a_M^{G,*}. Here θ_Q is Yu's unnormalized θ_Q. In type A every basis of relative coroots generates the full lattice {x in Z^r: Σx=0}, so Arthur's volume factors cancel.

**Hypotheses and conventions.**

- G=GL_n with a specified block Levi M and Yu’s unnormalized θ; m=dim a_M^G, the β_j are distinct relative roots, and every relative-coroot pairing with ξ is nonzero.
- The selected parabolics contain all β_j. The value1 uses type-A unimodularity; for another root system a covolume factor must be retained.

**Construction or proof.**

1. Apply Arthur’s chamber/cone identity to the selected parabolics containing the distinct β_j, with θ_Q and the relative-height measure consistently normalized.
2. Its coefficient is zero for dependent roots and equals the relative-lattice covolume factor for a basis; Yu quotes the original argument at Ar82 pp.1319–1320.
3. For type A identify e_i−e_j with oriented edges. A basis is a spanning tree; leaf elimination shows it generates the full sum-zero integral lattice, with determinant ±1. Hence Yu’s unnormalized coefficient is1.

**Prerequisites.** [AutomorphicSpectralTheory:AS.3/truncation-cones](#automorphicspectraltheory-as-3-truncation-cones), [AutomorphicSpectralTheory:AS.3/yu-022](#automorphicspectraltheory-as-3-yu-022), `AdelicAlgebraicGroups:AA.3/relative-chamber`.

**Acceptance and prototype scope.**

- Use the exact degree, domain, stabilizer and normalization conditions in the statement; no general function-field reductive trace formula is inferred.

**Sources.**

- [Hongjie Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), §4.2.3 proof of Théorème4.2.4, p.26, k=m case; citing Ar82 pp.1319–1320. The following sentence distinguishes value0 for a dependent family and value1 for a basis. The packet separates the root-cone input from the type-A lattice normalization.

## Existing declarations at the pinned baseline

These declarations are inputs, rather than new targets. A normed or finite-dimensional instance supplies only its stated generality. In particular the compact spectral theorem does not establish the general normal-operator joint measure, and the final test-function topology does not itself prove strictness or nuclearity.

<a id="mathlib-measuretheory-l2-inner-def"></a>

**[mathlib:MeasureTheory.L2.inner_def](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Function/L2Space.lean)**. For L² classes in an inner-product space, the inner product equals the integral of pointwise inner products.

<a id="mathlib-measuretheory-integral-prod"></a>

**[mathlib:MeasureTheory.integral_prod](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Integral/Prod.lean)**. Bochner Fubini for integrable functions under the module and s-finite product-measure hypotheses.

<a id="mathlib-measuretheory-integral-tsum"></a>

**[mathlib:MeasureTheory.integral_tsum](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Integral/DominatedConvergence.lean)**. Countable AEStronglyMeasurable family with finite sum of norm integrals permits interchange of Bochner integral and sum.

<a id="mathlib-hasfderivat-integral-of-dominated-of-fderiv-le"></a>

**[mathlib:hasFDerivAt_integral_of_dominated_of_fderiv_le](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/ParametricIntegral.lean)**. Parameter-neighborhood differentiability with one integrable derivative majorant permits Fréchet differentiation under the integral.

<a id="mathlib-hasderivat-integral-of-dominated-loc-of-deriv-le"></a>

**[mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/ParametricIntegral.lean)**. RCLike parameter, eventual measurability, integrable value and derivative majorant give integrable derivative and differentiation under the integral.

<a id="mathlib-withseminorms-banach-steinhaus"></a>

**[mathlib:WithSeminorms.banach_steinhaus](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/LocallyConvex/Barrelled.lean)**. Pointwise seminorm boundedness of continuous semilinear maps from a barrelled space gives uniform equicontinuity.

<a id="mathlib-complex-regularizedhgfun"></a>

**[mathlib:Complex.regularizedHGFun](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean)**. Regularized generalized hypergeometric power series with Pochhammer numerators and Gamma denominators.

<a id="mathlib-complex-radius-regularizedhgfunseries-eq-top"></a>

**[mathlib:Complex.radius_regularizedHGFunSeries_eq_top](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean)**. Infinite radius if the numerator multiset cardinal is at most the denominator multiset cardinal.

<a id="mathlib-complex-betaintegral-eq-gamma-mul-div"></a>

**[mathlib:Complex.betaIntegral_eq_Gamma_mul_div](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean)**. For positive real parts, the beta integral equals Gamma(u)Gamma(v)/Gamma(u+v).

<a id="mathlib-complex-gamma-mul-gamma-add-half"></a>

**[mathlib:Complex.Gamma_mul_Gamma_add_half](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean)**. Legendre duplication with the factor 2^(1−2s)√π, using Mathlib totalized Gamma.

<a id="tauceti-tauceti-stdpeterweylbasis"></a>

**[tauceti:TauCeti.stdPeterWeylBasis](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/PeterWeyl.lean)**. Hilbert basis of L² of a compact group for Haar probability, indexed by irreducibles and pairs of matrix indices.

<a id="tauceti-isselfadjoint-existsunique-isunitary-complexgenerator-eq-i-smul"></a>

**[tauceti:IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.lean)**. A self-adjoint partial linear map on a complete complex Hilbert space is the generator iA of a unique unitary strongly continuous group.

<a id="mathlib-monoidhom-measurepreserving"></a>

**[mathlib:MonoidHom.measurePreserving](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/Haar/Unique.lean)**. For a continuous surjective group homomorphism with compact codomain, Borel topological groups and Haar measures of equal total mass, the homomorphism is measure preserving.

<a id="mathlib-unitaddtorus-hassum-mfourier-series-apply-of-summable"></a>

**[mathlib:UnitAddTorus.hasSum_mFourier_series_apply_of_summable](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/AddCircleMulti.lean)**. For a finite-dimensional unit torus, a continuous complex function with summable Fourier coefficients has its Fourier series converging to its value at every point.

<a id="mathlib-addchar-expect-eq-ite"></a>

**[mathlib:AddChar.expect_eq_ite](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean)**. On a finite additive group with characteristic-zero semifield values, normalized expectation of a character is one when it is the trivial character and zero otherwise.

<a id="mathlib-upperhalfplane-cosh-dist"></a>

**[mathlib:UpperHalfPlane.cosh_dist](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean)**. The hyperbolic cosh distance is 1+|z−w|²/(2 Im(z)Im(w)).

<a id="mathlib-upperhalfplane-tanh-half-dist"></a>

**[mathlib:UpperHalfPlane.tanh_half_dist](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean)**. The hyperbolic tanh half-distance is |z−w|/|z−conj(w)|.

<a id="tauceti-tauceti-vitali"></a>

**[tauceti:TauCeti.vitali](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Complex/Conformal/Vitali.lean)**. For a locally bounded sequence of holomorphic scalar functions on an open preconnected complex domain, pointwise convergence on a subset with an interior accumulation point gives a holomorphic locally uniform limit. This is an interior theorem, not a boundary bound.

<a id="mathlib-schwartzmap"></a>

**[mathlib:SchwartzMap](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean)**. Schwartz maps already support normed vector-valued targets; smoothness and all iterated Fréchet derivative decay are part of the definition. AS extends only to general quasi-complete locally convex targets.

<a id="mathlib-schwartzmap-postcompclm"></a>

**[mathlib:SchwartzMap.postcompCLM](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean)**. Postcomposition by a continuous linear map is a continuous linear map between normed vector-valued Schwartz spaces; pointwise evaluation and composition laws are existing.

<a id="mathlib-linearmap-issymmetric-eigenvectorbasis"></a>

**[mathlib:LinearMap.IsSymmetric.eigenvectorBasis](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/InnerProductSpace/Spectrum.lean)**. For a finite-dimensional real/complex inner-product space and a symmetric linear endomorphism, gives a finite orthonormal eigenbasis sorted by eigenvalue. This is not an arbitrary infinite-dimensional compact-operator Hilbert basis.

<a id="tauceti-iscompactoperator-finitedimensional-eigenspace"></a>

**[tauceti:IsCompactOperator.finiteDimensional_eigenspace](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Normed/Operator/Compact/Eigenspace.lean)**. A compact continuous linear endomorphism over a complete nontrivially normed field has finite-dimensional eigenspace at every nonzero eigenvalue.

<a id="tauceti-tauceti-isfredholm-one-sub"></a>

**[tauceti:TauCeti.isFredholm_one_sub](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Fredholm/CompactPerturbation.lean)**. For a compact endomorphism of a complete normed space over a complete RCLike normed field, 1−K is Fredholm. No parameter-meromorphic inverse is supplied.

<a id="tauceti-continuouslinearmap-exists-hilbertbasis-forall-haseigenvector"></a>

**[tauceti:ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/InnerProductSpace/Spectrum.lean)**. A compact symmetric continuous endomorphism of a complete real or complex Hilbert space admits a Hilbert basis of eigenvectors, without a separability assumption. Applied to A* A, it provides the compact positive spectral decomposition used in the singular-value construction.

<a id="mathlib-testfunction"></a>

**[mathlib:TestFunction](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/TestFunction.lean)**. Bundled real-smooth functions with compact support in an open set, for a normed real domain and normed target; complex scalar structure is inherited when available.

<a id="mathlib-testfunction-topologicalspace"></a>

**[mathlib:TestFunction.topologicalSpace](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/TestFunction.lean)**. The existing locally convex final topology for the compact-support stage inclusions. This supplies the real-line test carrier; closed embeddings, strictness, nuclearity and the bounded-set criterion are additional targets.

<a id="mathlib-addchar-complexbasis"></a>

**[mathlib:AddChar.complexBasis](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean)**. The full set of complex additive characters of a finite additive commutative group is a basis of its complex-valued function space. Its basis vectors are exactly the character functions.

<a id="mathlib-module-aeval"></a>

**[mathlib:Module.AEval'](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Module/AEval.lean)**. The polynomial module attached to an endomorphism of a module over a commutative semiring; the underlying module is a type synonym and polynomials act by evaluation at that endomorphism.

<a id="mathlib-module-aeval--x-smul-of"></a>

**[mathlib:Module.AEval'.X_smul_of](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Module/AEval.lean)**. Under the canonical linear equivalence with the original module, multiplication by the polynomial variable is the chosen endomorphism. This identifies the Jordan model used by the generalized-character test.

<a id="mathlib-zeta-eq-tsum-one-div-nat-add-one-cpow"></a>

**[mathlib:zeta_eq_tsum_one_div_nat_add_one_cpow](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/RiemannZeta.lean)**. For a complex parameter with real part greater than one, the existing Riemann zeta function equals the sum of reciprocal complex powers of the positive integers.

<a id="tauceti-tauceti-multiquadratic-isfundamentaldiscriminant"></a>

**[tauceti:TauCeti.Multiquadratic.IsFundamentalDiscriminant](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Basic.lean)**. An integer congruent to one modulo four is fundamental when squarefree; the other branch is four times a squarefree integer congruent to two or three modulo four. In particular 12 satisfies the criterion, whereas 16 does not. AS imports this predicate and does not build a second arithmetic definition.

<a id="mathlib-arithmeticfunction-moebius"></a>

**[mathlib:ArithmeticFunction.moebius](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean)**. The integer-valued Möbius arithmetic function is zero off squarefree integers and equals (−1) to the number of prime factors on squarefree integers; its value at zero is zero.

## Supplier interfaces

The following requests pin contracts supplied by other owners. A requested stage is a dependency of the target inventory; it is not a claim that its full interface is implemented.

### SmoothRepresentationsOfLocalGroups:SR.2

The local parabolic induction and geometric-lemma indexing used in comparing compact-picture intertwiners. Rational F-points and automorphic global Bruhat cosets are a separate missing input below.

Required by [AutomorphicSpectralTheory:AS.1/cuspidal-constant-term](#automorphicspectraltheory-as-1-cuspidal-constant-term).

### AutomorphicLFunctionsAndLocalFactors:AL.0

Fourier–Laplace inversion for C_c∞ on finite-dimensional real height spaces with dual Haar measure and the componentwise Paley–Wiener characterization; this is the real-place Schwartz–Bruhat interface.

Required by [AutomorphicSpectralTheory:AS.1/pseudo-eisenstein](#automorphicspectraltheory-as-1-pseudo-eisenstein).

### SmoothRepresentationsOfLocalGroups:SR.2

Local normalized induction, induction in stages and compact-picture source/target identifications over nonarchimedean fields.

Required by [AutomorphicSpectralTheory:AS.2/local-intertwiner](#automorphicspectraltheory-as-2-local-intertwiner), [AutomorphicSpectralTheory:AS.2/local-normalization](#automorphicspectraltheory-as-2-local-normalization).

### SmoothRepresentationsOfLocalGroups:SR.3

Admissible and tempered representations, Harish-Chandra matrix-coefficient estimates, rank-one meromorphic continuation and the nonarchimedean Langlands classification.

Required by [AutomorphicSpectralTheory:AS.2/local-intertwiner](#automorphicspectraltheory-as-2-local-intertwiner), [AutomorphicSpectralTheory:AS.2/local-normalization](#automorphicspectraltheory-as-2-local-normalization).

### AutomorphicFormsOnReductiveGroups:AF.1

Real reductive Harish-Chandra modules, tempered/discrete-series parameters, compact-picture normalized induction and the real Langlands classification needed in local normalization.

Required by [AutomorphicSpectralTheory:AS.2/local-intertwiner](#automorphicspectraltheory-as-2-local-intertwiner), [AutomorphicSpectralTheory:AS.2/local-normalization](#automorphicspectraltheory-as-2-local-normalization).

### SmoothRepresentationsOfLocalGroups:SR.4

Hyperspecial spherical vectors and the rank-one unramified c-function for normalized induction; fixed Haar volume K=1.

Required by [AutomorphicSpectralTheory:AS.2/local-normalization](#automorphicspectraltheory-as-2-local-normalization), [AutomorphicSpectralTheory:AS.2/local-intertwiner](#automorphicspectraltheory-as-2-local-intertwiner).

### AutomorphicFormsOnReductiveGroups:AF.2

Import AF.2/flath-factorization for the irreducible admissible algebraic restricted tensor product and almost-everywhere spherical vectors. Match its Hilbert completion and the separate discrete multiplicity space in AS.2; AF.4 rationality is not this theorem.

Required by [AutomorphicSpectralTheory:AS.2/intertwiner-factorization](#automorphicspectraltheory-as-2-intertwiner-factorization).

### AutomorphicFormsOnReductiveGroups:AF.3

Langlands square-integrability criterion for automorphic forms with finitely many parabolic exponents: negative real exponents on every proper parabolic modulo the split center, including the weak/non-strict boundary distinction.

Required by [AutomorphicSpectralTheory:AS.2/residue-calculus](#automorphicspectraltheory-as-2-residue-calculus).

### AutomorphicLFunctionsAndLocalFactors:AL.3

Import only the GL×GL Rankin–Selberg normalization/factor input covered by AL.3. The GL×classical and exterior/symmetric/Asai Shahidi factors exceed its current scope and are the precise Part II gap below.

Required by [AutomorphicSpectralTheory:AS.2/shahidi-normalization](#automorphicspectraltheory-as-2-shahidi-normalization), [AutomorphicSpectralTheory:AS.2/tempered-standard-intertwiner](#automorphicspectraltheory-as-2-tempered-standard-intertwiner).

### EndoscopicTransferAndUnitaryTraceComparison:ET.0

EndoscopicTransferAndUnitaryTraceComparison, Part II: local unitary and orthogonal/classical tempered parameter and packet carriers with pure-inner-form/genericity conventions. Current ET.0 supplies conjugacy data; it supplies none of these packet carriers. No existing ET node discharges this request.

Required by [AutomorphicSpectralTheory:AS.2/shahidi-normalization](#automorphicspectraltheory-as-2-shahidi-normalization), [AutomorphicSpectralTheory:AS.2/generic-standard-module](#automorphicspectraltheory-as-2-generic-standard-module), [AutomorphicSpectralTheory:AS.2/jiang-zhang-holomorphy](#automorphicspectraltheory-as-2-jiang-zhang-holomorphy).

### AutomorphicFormsOnReductiveGroups:AF.2

Harish-Chandra finiteness of automorphic forms at fixed finite level, finite archimedean K types and fixed finite-codimension infinitesimal-character ideal, with uniform moderate growth.

Required by [AutomorphicSpectralTheory:AS.4/discrete-finite-multiplicity](#automorphicspectraltheory-as-4-discrete-finite-multiplicity).

### SmoothRepresentationsOfLocalGroups:SR.1

Complex finite Hecke convolution and its integrated unitary action, involution and L¹ operator-norm bound; compact-open idempotents project to finite-level invariants.

Required by [AutomorphicSpectralTheory:AS.4/hecke-central-compatibility](#automorphicspectraltheory-as-4-hecke-central-compatibility), [AutomorphicSpectralTheory:AS.6/automorphic-kernel](#automorphicspectraltheory-as-6-automorphic-kernel).

### EndoscopicTransferAndUnitaryTraceComparison:ET.1

The unweighted quotient-centralizer orbital integral, its semisimple convergence and singular extension, with connected/full centralizer and discriminant conventions exposed for comparison.

Required by [AutomorphicSpectralTheory:AS.6/weighted-orbital-integral](#automorphicspectraltheory-as-6-weighted-orbital-integral).

### EndoscopicTransferAndUnitaryTraceComparison:ET.1

Import unitary/discrete-series and tempered pseudo-coefficient carriers; AS.6 adds the full finite-length EP trace identity and L²-Lefschetz application.

Required by [AutomorphicSpectralTheory:AS.6/general-euler-poincare](#automorphicspectraltheory-as-6-general-euler-poincare).

### AutomorphicLFunctionsAndLocalFactors:AL.3

Import only the GL×GL Rankin–Selberg normalization/factor input covered by AL.3. The GL×classical and exterior/symmetric/Asai Shahidi factors exceed its current scope and are the precise Part II gap below.

Required by [AutomorphicSpectralTheory:AS.2/yu-066](#automorphicspectraltheory-as-2-yu-066).

### SmoothRepresentationsOfLocalGroups:SR.4

Spherical Satake/normalized constant-term map for GL_n and the rank-one Gindikin–Karpelevich action, with local vol N(𝒪_v)=1.

Required by [AutomorphicSpectralTheory:AS.2/yu-066](#automorphicspectraltheory-as-2-yu-066).

### GeometryOfNumbersAndQuadraticArithmetic:GN.3

GeometryOfNumbersAndQuadraticArithmetic, Part II (with the Fuchsian-orbifold Part II route): oriented quadratic cycles/cores, the cycle involution and genus-character sign used by DIT16. Current GN.3 supplies mass/theta results, not these cycles; no existing GN.3 node discharges this request.

Required by [AutomorphicSpectralTheory:AS.4/dit-wrong-sign-weyl-integrals-vanish](#automorphicspectraltheory-as-4-dit-wrong-sign-weyl-integrals-vanish).

### AutomorphicLFunctionsAndLocalFactors:AL.1

Import AL.1/hecke-l-functional-equation and its local/global Tate zeta normalization; specialize the completed Hecke L-function to the Riemann or Dirichlet character and remove the finite Euler factors stated here. AL.0 supplies Fourier analysis, not this scalar functional equation.

Required by [AutomorphicSpectralTheory:AS.1/dit-58](#automorphicspectraltheory-as-1-dit-58).

### AutomorphicLFunctionsAndLocalFactors:AL.1

Import AL.1/hecke-l-functional-equation and its local/global Tate zeta normalization; specialize the completed Hecke L-function to the Riemann or Dirichlet character and remove the finite Euler factors stated here. AL.0 supplies Fourier analysis, not this scalar functional equation.

Required by [AutomorphicSpectralTheory:AS.1/gz-179](#automorphicspectraltheory-as-1-gz-179), [AutomorphicSpectralTheory:AS.1/gz-192](#automorphicspectraltheory-as-1-gz-192).

### AutomorphicLFunctionsAndLocalFactors:AL.2

Unramified standard GL_n local Euler factors; an isobaric block sum concatenates Satake multisets and multiplies these factors. This does not request the isobaric existence theorem from AL.2.

Required by [AutomorphicSpectralTheory:AS.2/isobaric-sum](#automorphicspectraltheory-as-2-isobaric-sum).

### QSeriesPartitionsAndMockModularForms:QM.2

Supply the K-Bessel function with its convergent positive-real integral, order reflection K_ν=K_(−ν), initial-value/decaying normalization and the differentiated parameter estimates required by AS.0/dit-113 and gz-217. QM.2 has I and J nodes but no K node yet. I and J are imported by their exact node ids; the finite untwisted Kloosterman sum is QM.3/classical-kloosterman-sum. The Whittaker M/W definitions belong to AS.0/dit-112.

Required by [AutomorphicSpectralTheory:AS.0/dit-113](#automorphicspectraltheory-as-0-dit-113), [AutomorphicSpectralTheory:AS.0/gz-217](#automorphicspectraltheory-as-0-gz-217).

### AutomorphicFormsOnReductiveGroups:AF.1

Local real normalized parabolic induction for every real parabolic P=M_P A_P N_P and a supplied admissible SF representation (or a supplied unitary Hilbert realization) of M_P, on the fixed compact picture with K∩M_P covariance. Supply the half-modulus convention a^(ν+ρ_P), right translation, finite K-type coefficient spaces, holomorphic parameter dependence, and induction-in-stages. The existing AF.1/principal-series only treats minimal parabolics with finite-dimensional inducing W and is not this general Levi-family theorem. Use the independent AF.1/sf-representation interface; do not require a global automorphic occurrence in L²([M]¹). Bernstein–Krötz §9.3, Proposition9.6 and pp.39–40 give the local source route with its good-module/globalization hypotheses; wider supplied-SF holomorphy remains a stated extension.

Required by [AutomorphicSpectralTheory:AS.6/real-invariant-paley-wiener](#automorphicspectraltheory-as-6-real-invariant-paley-wiener), [AutomorphicSpectralTheory:AS.6/real-operator-paley-wiener](#automorphicspectraltheory-as-6-real-operator-paley-wiener).

## Proof and carrier closure

All seven stages are planned at target level. None is closed: the named gaps and supplier refinements below must be discharged before proof closure is recorded. Compiling an admitted prototype establishes that its signatures elaborate; it does not establish its mathematical assertions.

### Analytic Fredholm source closure

Teschl supplies the fixed-operator Fredholm alternative, not a full parameter-analytic Fredholm proof. The finite-dimensional block argument here requires a source-qualified proof of holomorphic Riesz projections and local block inversion; several-variable polar hyperplanes are handled independently in AS.2.

Needed by [AutomorphicSpectralTheory:AS.0/analytic-fredholm](#automorphicspectraltheory-as-0-analytic-fredholm).

### Uniform differentiated chamber estimates

Arthur’s Lemma 7.1 states absolute analytic convergence; the target also needs all fixed differential operators and Siegel-set height bounds. Extract their explicit seminorm estimates from Langlands Chapter 7 and the residual-to-discrete extension, with local uniformity on compact chamber subsets. The present pass does not identify a complete source-level seminorm proof.

Needed by [AutomorphicSpectralTheory:AS.1/eisenstein-convergence](#automorphicspectraltheory-as-1-eisenstein-convergence).

### General nonassociate constant-term indexing

The associate cuspidal exponential formula is fully specified. The target’s arbitrary Q/discrete inducing formula needs the explicit surviving double-coset conditions and Levi source/target maps from Langlands Chapter 7; the present pass records that general formula as a named gap, rather than using the associate formula outside its hypotheses.

Needed by [AutomorphicSpectralTheory:AS.1/cuspidal-constant-term](#automorphicspectraltheory-as-1-cuspidal-constant-term).

### Local Harish-Chandra analytic inputs beyond suppliers

The reviewed SR and AF stages provide representation-theoretic carriers, but a complete proof of the μ-function/Plancherel scalar and rank-one local meromorphic integrals needs the real and nonarchimedean Harish-Chandra harmonic-analysis theorems cited by Arthur 1989. No precise supplier node for these general analytic theorems exists in the packets inspected; identify their statements and ownership before claiming analytic closure.

Needed by [AutomorphicSpectralTheory:AS.2/local-intertwiner](#automorphicspectraltheory-as-2-local-intertwiner), [AutomorphicSpectralTheory:AS.2/mu-function](#automorphicspectraltheory-as-2-mu-function), [AutomorphicSpectralTheory:AS.2/local-normalization](#automorphicspectraltheory-as-2-local-normalization).

### Langlands Chapter 7 residue-system proof

The continuation and final onto map are precisely stated by Arthur Theorem 7.2. The full higher-rank residual system in Langlands Chapter 7, including compatible ordered residues, affine root hyperplanes and positivity when crossing intersections, has not been decomposed source by source in this pass. The resolvent/contour outline is not a replacement for that input.

Needed by [AutomorphicSpectralTheory:AS.2/eisenstein-continuation](#automorphicspectraltheory-as-2-eisenstein-continuation), [AutomorphicSpectralTheory:AS.2/residue-calculus](#automorphicspectraltheory-as-2-residue-calculus), [AutomorphicSpectralTheory:AS.4/spectral-orthosum](#automorphicspectraltheory-as-4-spectral-orthosum), [AutomorphicSpectralTheory:AS.4/residual-spectrum](#automorphicspectraltheory-as-4-residual-spectrum).

### Jiang–Zhang rank-one source closure

Appendix B supplies the exact three analytic inputs and their bounds. The MW 1989, Waldspurger 2003/Borel–Wallach and CKPSS 2004 proofs, plus the generic unitary dual and standard-module irreducibility theorems, have not been read from their primary sources in this pass. Source-qualify these statements and reconcile their parameter/normalization conventions before closing the chain.

Needed by [AutomorphicSpectralTheory:AS.2/generic-standard-module](#automorphicspectraltheory-as-2-generic-standard-module), [AutomorphicSpectralTheory:AS.2/tempered-gl-intertwiner](#automorphicspectraltheory-as-2-tempered-gl-intertwiner), [AutomorphicSpectralTheory:AS.2/tempered-standard-intertwiner](#automorphicspectraltheory-as-2-tempered-standard-intertwiner), [AutomorphicSpectralTheory:AS.2/generic-normalized-intertwiner](#automorphicspectraltheory-as-2-generic-normalized-intertwiner), [AutomorphicSpectralTheory:AS.2/jiang-zhang-holomorphy](#automorphicspectraltheory-as-2-jiang-zhang-holomorphy).

### Uniform packet-limit argument

The exact compact-support Fubini identity follows from the stated bounds. The final T→∞ diagonalization of the complete Weyl sum, including overlapping residual strata, is Langlands’s spectral construction and must be extracted from Chapter 7; no termwise limit of separate singular Weyl terms is permitted.

Needed by [AutomorphicSpectralTheory:AS.3/wave-packet-gram](#automorphicspectraltheory-as-3-wave-packet-gram).

### Compact-quotient Sobolev trace-class input

The compact periodized kernel is specified, but its smoothing-to-trace-class factorization requires Sobolev compact embeddings and an elliptic/smoothing spectral estimate on Γ\G. Peter–Weyl for compact G does not provide this for noncompact G with cocompact Γ; source-qualify that analytic input before closing this node.

Needed by [AutomorphicSpectralTheory:AS.4/compact-quotient-spectrum](#automorphicspectraltheory-as-4-compact-quotient-spectrum), [AutomorphicSpectralTheory:AS.6/compact-trace-specialization](#automorphicspectraltheory-as-6-compact-trace-specialization).

### Modular Weyl and pointwise analytic proof inputs

DIT §5 cites Hejhal/Iwaniec for the full spectral theorem, Weyl law and eigenfunction bounds. Primary proofs of these inputs and the compact-core coefficient estimates must be extracted; DIT’s numerical first eigenvalues are not a proof that every cusp eigenvalue exceeds 1/4.

Needed by [AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion](#automorphicspectraltheory-as-4-gl2-spectral-expansion), [AutomorphicSpectralTheory:AS.4/modular-weyl-estimates](#automorphicspectraltheory-as-4-modular-weyl-estimates).

### Essentially tempered reductive central adapter

Wallach’s inspected theorem is for the semisimple arithmetic real setting. The GSp₄/totally-real and Res PGL_n consumer claims need a proved restriction-of-scalars and split-center twist reduction, checking square integrability modulo the chosen unitary character. This pass does not use the reductive extension without that proof.

Needed by [AutomorphicSpectralTheory:AS.4/wallach-cuspidality](#automorphicspectraltheory-as-4-wallach-cuspidality).

### Franke graded-piece weight/index integration

The principal p_{−r}+log acyclicity and the constant-term support filtration are stated. Theorem 16’s printed extra cone has been read: closed Weyl chamber intersected with the interior of the positive root cone. Theorem 14’s height-space duals, χ-support and induced jet-module identifications must still be compared with the supplier representation types before implementation. This is a type-integration gap, not an unknown cone.

Needed by [AutomorphicSpectralTheory:AS.5/weighted-finite-character-acyclic](#automorphicspectraltheory-as-5-weighted-finite-character-acyclic), [AutomorphicSpectralTheory:AS.5/franke-graded-isomorphism](#automorphicspectraltheory-as-5-franke-graded-isomorphism).

### General GLₙ cohomological and multiplicity-one input

BCG supplies the exact level-one diagram and parity consequences, citing Clozel Lemma 3.14 and Borel. The general n archimedean cohomological calculation and GL_n global multiplicity-one/spherical-vector statements need their own primary-source supplier; the existing GL₂ direction covers only n=2. No GL₂ stage is used as if it proved general n.

Needed by [AutomorphicSpectralTheory:AS.5/gl-sl-cuspidal-diagram](#automorphicspectraltheory-as-5-gl-sl-cuspidal-diagram), [AutomorphicSpectralTheory:AS.5/isobaric-realization](#automorphicspectraltheory-as-5-isobaric-realization).

### Franke–Schwermer primary source and GLₙ synthesis

The requested FS98 Math. Ann.311 (1998),765–790 Theorem2.3 has not been obtained in a freely readable primary copy. The inspected CGH consumer quotes the isobaric realization, while Franke proves the coarser Laurent-coefficient synthesis. Obtain FS98, verify its exact support/ideal indices, and source-qualify general GL_n isobaric existence and multiplicity one before closing these two nodes.

Needed by [AutomorphicSpectralTheory:AS.5/franke-schwermer-support](#automorphicspectraltheory-as-5-franke-schwermer-support), [AutomorphicSpectralTheory:AS.5/isobaric-realization](#automorphicspectraltheory-as-5-isobaric-realization), [AutomorphicSpectralTheory:AS.2/isobaric-sum](#automorphicspectraltheory-as-2-isobaric-sum).

### Nonarchimedean invariant trace Paley–Wiener supplier

The BDK trace-image theorem is not in the stated SR.0–SR.4 scope. SmoothRepresentationsCharactersPartII is the proposed owner but has no designed stage/node in the current atlas. Supply the finite Bernstein-component/support and regular trace image theorem there; AS.6 imports it for I_ac at finite places and does not duplicate it.

Needed by [AutomorphicSpectralTheory:AS.6/almost-compact-test-space](#automorphicspectraltheory-as-6-almost-compact-test-space), [AutomorphicSpectralTheory:AS.6/invariant-recursion](#automorphicspectraltheory-as-6-invariant-recursion).

### Weighted orbital estimate and general L²-cohomology primary prerequisites

The inspected Arthur survey/originals state the weighted orbital convergence, induced-class limiting measures and L²-Lefschetz formulas, but their Deligne–Rao singular estimate, Borel–Casselman L² cohomology finiteness, and the complete rank-inductive weighted estimates are not supplied by ET.1 or ALS.5’s current scopes. Source and assign those exact analytic/cohomological inputs before closing the corresponding constructions.

Needed by [AutomorphicSpectralTheory:AS.6/weighted-orbital-integral](#automorphicspectraltheory-as-6-weighted-orbital-integral), [AutomorphicSpectralTheory:AS.6/l2-lefschetz](#automorphicspectraltheory-as-6-l2-lefschetz), [AutomorphicSpectralTheory:AS.6/compact-trace-specialization](#automorphicspectraltheory-as-6-compact-trace-specialization).

### Yu 010 external proof inputs

The source routing dependencies outside this spectral inventory are PAPER-YU-23/009. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.

Needed by [AutomorphicSpectralTheory:AS.1/yu-010](#automorphicspectraltheory-as-1-yu-010).

### Yu 017 external proof inputs

The source routing dependencies outside this spectral inventory are PAPER-YU-23/011, PAPER-YU-23/012. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.

Needed by [AutomorphicSpectralTheory:AS.4/yu-017](#automorphicspectraltheory-as-4-yu-017).

### Yu 020 external proof inputs

The source routing dependencies outside this spectral inventory are PAPER-YU-23/012. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.

Needed by [AutomorphicSpectralTheory:AS.4/yu-020](#automorphicspectraltheory-as-4-yu-020).

### Yu 021 external proof inputs

The source routing dependencies outside this spectral inventory are PAPER-YU-23/004. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.

Needed by [AutomorphicSpectralTheory:AS.4/yu-021](#automorphicspectraltheory-as-4-yu-021).

### Yu 022 external proof inputs

The source routing dependencies outside this spectral inventory are PAPER-YU-23/009. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.

Needed by [AutomorphicSpectralTheory:AS.3/yu-022](#automorphicspectraltheory-as-3-yu-022).

### Yu 024 external proof inputs

The source routing dependencies outside this spectral inventory are PAPER-YU-23/011. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.

Needed by [AutomorphicSpectralTheory:AS.6/yu-024](#automorphicspectraltheory-as-6-yu-024).

### Yu 038 external proof inputs

The source routing dependencies outside this spectral inventory are PAPER-YU-23/033. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.

Needed by [AutomorphicSpectralTheory:AS.6/yu-038](#automorphicspectraltheory-as-6-yu-038).

### Yu 039 external proof inputs

The source routing dependencies outside this spectral inventory are PAPER-YU-23/008, PAPER-YU-23/035. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.

Needed by [AutomorphicSpectralTheory:AS.6/yu-039](#automorphicspectraltheory-as-6-yu-039).

### Yu 053 external proof inputs

The source routing dependencies outside this spectral inventory are PAPER-YU-23/011. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.

Needed by [AutomorphicSpectralTheory:AS.6/yu-053](#automorphicspectraltheory-as-6-yu-053).

### Yu 065 external proof inputs

The source routing dependencies outside this spectral inventory are PAPER-YU-23/013, PAPER-YU-23/064. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.

Needed by [AutomorphicSpectralTheory:AS.4/yu-065](#automorphicspectraltheory-as-4-yu-065).

### Yu 066 external proof inputs

The source routing dependencies outside this spectral inventory are PAPER-YU-23/011, PAPER-YU-23/057. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.

Needed by [AutomorphicSpectralTheory:AS.2/yu-066](#automorphicspectraltheory-as-2-yu-066).

### Yu 148 external proof inputs

The source routing dependencies outside this spectral inventory are PAPER-YU-23/142. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.

Needed by [AutomorphicSpectralTheory:AS.0/yu-148](#automorphicspectraltheory-as-0-yu-148).

### Yu 149 external proof inputs

The source routing dependencies outside this spectral inventory are PAPER-YU-23/143, PAPER-YU-23/144. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.

Needed by [AutomorphicSpectralTheory:AS.0/yu-149](#automorphicspectraltheory-as-0-yu-149).

### Yu 150 external proof inputs

The source routing dependencies outside this spectral inventory are PAPER-YU-23/143, PAPER-YU-23/144. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.

Needed by [AutomorphicSpectralTheory:AS.0/yu-150](#automorphicspectraltheory-as-0-yu-150).

### Yu 152 external proof inputs

The source routing dependencies outside this spectral inventory are PAPER-YU-23/144. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.

Needed by [AutomorphicSpectralTheory:AS.6/yu-152](#automorphicspectraltheory-as-6-yu-152).

### Function-field spectral analytic sources

Yu v5 gives the explicit statements, local factors and Fourier calculations. Complete primary proof closure still requires Lafforgue VI.1 Langlands unitarity/functional equations, VI.2 Lemma9/Corollary10 with coherent ρ conventions, the original Mœglin–Waldspurger residual classification in the function-field GL_n case, and Harder’s cuspidal compact-support input. Number-field AS.1–4 are not used as an unproved transfer to characteristic p.

Needed by [AutomorphicSpectralTheory:AS.4/yu-017](#automorphicspectraltheory-as-4-yu-017), [AutomorphicSpectralTheory:AS.4/yu-020](#automorphicspectraltheory-as-4-yu-020), [AutomorphicSpectralTheory:AS.1/yu-060](#automorphicspectraltheory-as-1-yu-060), [AutomorphicSpectralTheory:AS.2/yu-061](#automorphicspectraltheory-as-2-yu-061), [AutomorphicSpectralTheory:AS.6/yu-063](#automorphicspectraltheory-as-6-yu-063), [AutomorphicSpectralTheory:AS.4/yu-065](#automorphicspectraltheory-as-4-yu-065), [AutomorphicSpectralTheory:AS.2/yu-066](#automorphicspectraltheory-as-2-yu-066), [AutomorphicSpectralTheory:AS.6/yu-165](#automorphicspectraltheory-as-6-yu-165), [AutomorphicSpectralTheory:AS.4/yu-166](#automorphicspectraltheory-as-4-yu-166).

### No exceptional level-one cusp spectrum

DIT16 (5.6),(5.11) choose real r and give numerical first-eigenvalue data; that is not a proof that all cusp eigenvalues exceed 1/4. Obtain a rigorous primary-source theorem with certification if computational. All AS.4 decomposition and DIT residue statements retain possible exceptional parameters or explicitly assume r>0.

Needed by [AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion](#automorphicspectraltheory-as-4-gl2-spectral-expansion), [AutomorphicSpectralTheory:AS.4/modular-weyl-estimates](#automorphicspectraltheory-as-4-modular-weyl-estimates).

### Modular resolvent primary source and noncompact boundary realization

DIT16 quotes Fay Theorem3.1, Hejhal and Neunhöffer for continuation rather than proving it. Verify the cusp self-adjoint domain, the kernel-to-distribution realization, the full Fourier expansion including m=0, and meromorphic continuation on Re(s)>0 in a primary freely readable copy. AS.0 spectral calculus alone gives a bounded off-spectrum inverse; it does not continue a kernel across continuous spectrum.

Needed by [AutomorphicSpectralTheory:AS.2/dit-91](#automorphicspectraltheory-as-2-dit-91), [AutomorphicSpectralTheory:AS.2/dit-92](#automorphicspectraltheory-as-2-dit-92), [AutomorphicSpectralTheory:AS.2/dit-93](#automorphicspectraltheory-as-2-dit-93), [AutomorphicSpectralTheory:AS.2/dit-94](#automorphicspectraltheory-as-2-dit-94), [AutomorphicSpectralTheory:AS.2/dit-resolvent-fourier-expansion-weight0](#automorphicspectraltheory-as-2-dit-resolvent-fourier-expansion-weight0).

### Gross–Zagier resolvent source and regularized derivative integrals

GZ II§2 quotes Hejhal for the meromorphic kernel rather than proving its continuation; share the modular resolvent proof gap with DIT. At integer negative V-parameters some original Fourier integrals are conditional and must be defined by continuation, not by a divergent absolute integral. The gamma and K-Bessel formulas need source-to-library type integration.

Needed by [AutomorphicSpectralTheory:AS.2/gz-68](#automorphicspectraltheory-as-2-gz-68), [AutomorphicSpectralTheory:AS.0/gz-213](#automorphicspectraltheory-as-0-gz-213), [AutomorphicSpectralTheory:AS.0/gz-215](#automorphicspectraltheory-as-0-gz-215), [AutomorphicSpectralTheory:AS.0/gz-216](#automorphicspectraltheory-as-0-gz-216), [AutomorphicSpectralTheory:AS.0/gz-217](#automorphicspectraltheory-as-0-gz-217).

### Local-factor and packet Part II beyond current owners

AutomorphicLFunctionsAndLocalFactors AL.3 covers GL×GL Rankin–Selberg factors; it does not define all GL×classical Shahidi L/ε factors, exterior/symmetric-square or Asai local factors with packet compatibility. Extend that owner as Part II before the Jiang–Zhang ratio is implemented. ET.0 is conjugacy data, not local parameter theory; unitary and orthogonal/classical generic tempered packets and the relevant pure inner forms need EndoscopicTransferAndUnitaryTraceComparison, Part II. No dependency on the existing stages is treated as proving these extensions.

Needed by [AutomorphicSpectralTheory:AS.2/shahidi-normalization](#automorphicspectraltheory-as-2-shahidi-normalization), [AutomorphicSpectralTheory:AS.2/generic-standard-module](#automorphicspectraltheory-as-2-generic-standard-module), [AutomorphicSpectralTheory:AS.2/tempered-standard-intertwiner](#automorphicspectraltheory-as-2-tempered-standard-intertwiner), [AutomorphicSpectralTheory:AS.2/generic-normalized-intertwiner](#automorphicspectraltheory-as-2-generic-normalized-intertwiner), [AutomorphicSpectralTheory:AS.2/jiang-zhang-holomorphy](#automorphicspectraltheory-as-2-jiang-zhang-holomorphy).

### Modular core and boundary-residue adapters

The F_A core-surface construction belongs to the Fuchsian-orbifold Part II route of the reviewed DIT extraction; the geometry of oriented quadratic cycles/genus signs requires GeometryOfNumbersAndQuadraticArithmetic, Part II; current GN.2–3 do not supply it. Until its new roadmap has a supplier node, the integrable-over-core adapter is conditional on that imported finite-area cusp geometry. TauCeti.vitali supplies interior convergence only: the limit on Re(s)=1/2 and coefficient residues still require a parameter-uniform cusp majorant and the meromorphic resolvent proof, rather than an interior Vitali argument.

Needed by [AutomorphicSpectralTheory:AS.4/dit-eisenstein-integrable-over-core](#automorphicspectraltheory-as-4-dit-eisenstein-integrable-over-core), [AutomorphicSpectralTheory:AS.4/dit-wrong-sign-weyl-integrals-vanish](#automorphicspectraltheory-as-4-dit-wrong-sign-weyl-integrals-vanish), [AutomorphicSpectralTheory:AS.2/dit-93](#automorphicspectraltheory-as-2-dit-93), [AutomorphicSpectralTheory:AS.2/dit-94](#automorphicspectraltheory-as-2-dit-94).

### Global rational Bruhat indexing

The automorphic constant-term computation needs the rational Bruhat decomposition of G(F), its parabolic double-coset refinements and compatibility with the adelic unipotent quotient measures. SmoothRepresentationsOfLocalGroups SR.2 supplies local induction/geometric lemmas only; it does not supply these rational global decompositions. Assign this extension to AdelicAlgebraicGroups, Part II (or an accepted algebraic-group supplier) before proving the constant-term identity.

Needed by [AutomorphicSpectralTheory:AS.1/cuspidal-constant-term](#automorphicspectraltheory-as-1-cuspidal-constant-term), [AutomorphicSpectralTheory:AS.3/truncation-projection](#automorphicspectraltheory-as-3-truncation-projection), [AutomorphicSpectralTheory:AS.6/coarse-truncated-kernel](#automorphicspectraltheory-as-6-coarse-truncated-kernel).

### Bounded-normal joint-measure proof

Teschl §3 develops the self-adjoint spectral measure and motivates multiplication models, but the normal-operator claim here additionally needs a source-qualified proof that the spectral projections of commuting Re(N), Im(N) commute and give a joint complex Borel measure. The compact-selfadjoint baseline cannot supply this missing step.

Needed by [AutomorphicSpectralTheory:AS.0/bounded-normal-spectral](#automorphicspectraltheory-as-0-bounded-normal-spectral).

### Locally convex Schwartz kernel integration

Mathlib already supplies normed vector-valued Schwartz maps and continuous postcomposition. The general quasi-complete locally convex Schwartz carrier needs seminorm-family topology and completion integration. The tensor identification needs a precise Grothendieck kernel theorem with its nuclearity/completeness hypotheses; BPCZ A.0.7.8 is a quoted source input, not its proof. Do not implement this by re-defining Mathlib SchwartzMap.

Needed by [AutomorphicSpectralTheory:AS.0/vector-schwartz](#automorphicspectraltheory-as-0-vector-schwartz), [AutomorphicSpectralTheory:AS.0/projective-tensor](#automorphicspectraltheory-as-0-projective-tensor), [AutomorphicSpectralTheory:AS.0/schwartz-family-continuation](#automorphicspectraltheory-as-0-schwartz-family-continuation).

### Effective modular-group and Green-resolvent integration

ER.7 supplies congruence groups and upper-half-plane geometry. Integrate the Γ₀(N)/±I index for the Green sum, distinguishing it from Γ∞\Γ for Eisenstein series. Prove the off-diagonal lattice-growth/differentiation bounds and obtain the quoted Hejhal Chapters6–7 continuation proof; GZ p.239 quotes that proof rather than giving it. The imported QM.3 weight-zero Laplacian must use Δ_GZ=+y²(∂x²+∂y²), opposite to DIT’s nonnegative convention.

Needed by [AutomorphicSpectralTheory:AS.2/automorphic-green](#automorphicspectraltheory-as-2-automorphic-green), [AutomorphicSpectralTheory:AS.2/gz-68](#automorphicspectraltheory-as-2-gz-68).

### Positive harmonic Poisson representation

The general Herglotz proof needs the representation of a positive harmonic function on the upper half-plane as b Im(z)+∫ Im(z)/((Re(z)−t)²+Im(z)²)dν(t), with b≥0 and ∫(1+t²)⁻¹dν finite. Shapiro Theorem 10.5 invokes this classical input; no pinned baseline or supplier node has been established here. Teschl Theorem 3.20 does not cover it.

Needed by [AutomorphicSpectralTheory:AS.0/herglotz-representation](#automorphicspectraltheory-as-0-herglotz-representation).

### Strong operator topology source qualification

BPCZ Appendix A equips Hom(V,W) and V′ with weak pointwise topologies. The bounded-set topology and weak-to-strong meromorphy upgrade in the operator-meromorphic target require a separate proof with a common denominator and the appropriate local boundedness/uniform seminorm hypotheses. The cited weak holomorphy passage alone does not establish that upgrade.

Needed by [AutomorphicSpectralTheory:AS.0/operator-meromorphic](#automorphicspectraltheory-as-0-operator-meromorphic).

### Local analytic extensions beyond representation carriers

SR.3 supplies admissible/tempered representation carriers, not the complete Harish-Chandra estimates, rank-one continuation or Langlands classification requested here. AF.1 now plans langlands-classification, discrete-series, archimedean-llc-gln and casselman-wallach-globalization in the single real-representation owner; its original classification/discrete-series proofs and faithful native signatures remain recorded gaps. Reuse those precise contracts rather than create another real classification owner. SR.4 supplies Satake and spherical constant terms, not a proof of the analytic Gindikin–Karpelevich c-function. Reuse the planned SR/AF interfaces and request the additional analytic inputs from their respective owners; SR.1 finite Hecke convolution also needs the unitary integrated L¹ norm bound before the analytic Hilbert action is used.

Needed by [AutomorphicSpectralTheory:AS.2/local-intertwiner](#automorphicspectraltheory-as-2-local-intertwiner), [AutomorphicSpectralTheory:AS.2/local-normalization](#automorphicspectraltheory-as-2-local-normalization), [AutomorphicSpectralTheory:AS.2/yu-066](#automorphicspectraltheory-as-2-yu-066), [AutomorphicSpectralTheory:AS.4/hecke-central-compatibility](#automorphicspectraltheory-as-4-hecke-central-compatibility), [AutomorphicSpectralTheory:AS.6/automorphic-kernel](#automorphicspectraltheory-as-6-automorphic-kernel).

### Function-field root and coprime cutoff proof adapters

AA.3 is stated for number fields. The GL_n root/block linear algebra can be reused over the function field only after recording its characteristic-independent root-datum adapter. Yu Lemma A.2 requires gcd(e,n)=1 (PAPER-YU-23/E48); its proper-Levi translated cutoff cancellation is not proved by merely citing the missing-pole argument for an arbitrary family. Source-qualify this coprime argument. Do not use (5.3.6) for every degree or the noncoprime global Theorem A.4 from this argument; the lattice identity of Lemma A.3 is a separate statement.

Needed by [AutomorphicSpectralTheory:AS.3/yu-022](#automorphicspectraltheory-as-3-yu-022), [AutomorphicSpectralTheory:AS.3/yu-023](#automorphicspectraltheory-as-3-yu-023), [AutomorphicSpectralTheory:AS.3/yu-116](#automorphicspectraltheory-as-3-yu-116), [AutomorphicSpectralTheory:AS.3/yu-117](#automorphicspectraltheory-as-3-yu-117), [AutomorphicSpectralTheory:AS.3/yu-157](#automorphicspectraltheory-as-3-yu-157).

### General LF weak-dual continuation adapter

The revised Schwartz signature retains the two-sided scalar continuation, initial full-seminorm strip order, functional equation and existence/uniqueness conclusion. The revised weak-dual signature supplies the corresponding Banach one-stage LF specialization, with one common initial scalar order and continuous functional values. General LF stage topologies, the weak-dual locally convex carrier and the barrelled/quasi-complete passage still require the planned LF/vector analysis interfaces. No strong-dual holomorphy is asserted.

Needed by [AutomorphicSpectralTheory:AS.0/schwartz-family-continuation](#automorphicspectraltheory-as-0-schwartz-family-continuation), [AutomorphicSpectralTheory:AS.0/lf-dual-continuation](#automorphicspectraltheory-as-0-lf-dual-continuation).

### Compact Lie Fourier and full-carrier test adapters

The revised Yu149 specialization uses normalized finite-group Haar, the full dual, absolute summability and the actual fibre average. Yu150 now concerns smooth periodic functions and their actual torus coefficients. The finite-group-times-torus transport, uniform auxiliary-parameter derivative estimate and the full adelic/representation carriers connecting the restricted object tests to their source models remain required. Individual restrictions are stated at each affected node; numerical helper identities are no longer presented as the source-level test.

Needed by [AutomorphicSpectralTheory:AS.0/yu-149](#automorphicspectraltheory-as-0-yu-149), [AutomorphicSpectralTheory:AS.0/nuclear-lf-space](#automorphicspectraltheory-as-0-nuclear-lf-space).

### Smooth globalization, weighted χ projections and Siegel cutoffs

BPCZ items27–28 require the AF Part II SLF/Casselman–Wallach globalization and completed product, and Lapid smooth Eisenstein continuity into T_N([G]), beyond the finite-K-type Langlands prototypes. Item33 requires the weighted parabolic MW II.2.4 decomposition and equality of χ projections for different weights. Item45 is the AA Part II compact Siegel cutoff F^G (modulo the center), distinct from Λ^T. The previous routing of all four through Appendix A was not justified; these item-specific routes are now gap decisions.

Needed by [AutomorphicSpectralTheory:AS.1/induced-family](#automorphicspectraltheory-as-1-induced-family), [AutomorphicSpectralTheory:AS.2/eisenstein-continuation](#automorphicspectraltheory-as-2-eisenstein-continuation), [AutomorphicSpectralTheory:AS.1/cuspidal-datum-space](#automorphicspectraltheory-as-1-cuspidal-datum-space), [AutomorphicSpectralTheory:AS.1/cuspidal-data-orthosum](#automorphicspectraltheory-as-1-cuspidal-data-orthosum), [AutomorphicSpectralTheory:AS.3/arthur-truncation](#automorphicspectraltheory-as-3-arthur-truncation).

### Weight-k modular Laplacian conjugation

QM.3 uses the classical weight-k coefficient operator −y²(∂x²+∂y²)+iky(∂x+i∂y), while DIT uses the unitary-weight operator −y²(∂x²+∂y²)+iky∂x. For F=y^(k/2)f the first operator on f is y^(−k/2)(Δ_unit F+(k²/4−k/2)F). The k=1/2 shift is −3/16. State this conjugation and its measure/automorphy dictionary before using the QM carrier for the DIT half-weight eigenvalue; the two conventions cannot be identified literally.

Needed by [AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion](#automorphicspectraltheory-as-4-gl2-spectral-expansion).

### Real harmonic-analysis prefix before ET.1

The rescope proposal now names the three existing real Paley–Wiener/multiplier nodes and their independent inputs as an AS.1a export prefix. Current atlas stages and node ids remain unchanged pending maintainer integration. ET.1 must import that prefix, not the complete AS.6 stage, which imports ET.1 for orbital integrals. General Euler–Poincaré functions remain an AS.6 consumer of ET.1; they are not part of the exported harmonic-analysis prefix.

Needed by [AutomorphicSpectralTheory:AS.6/real-invariant-paley-wiener](#automorphicspectraltheory-as-6-real-invariant-paley-wiener), [AutomorphicSpectralTheory:AS.6/real-operator-paley-wiener](#automorphicspectraltheory-as-6-real-operator-paley-wiener), [AutomorphicSpectralTheory:AS.6/spectral-multiplier](#automorphicspectraltheory-as-6-spectral-multiplier), [AutomorphicSpectralTheory:AS.6/general-euler-poincare](#automorphicspectraltheory-as-6-general-euler-poincare).

### Local real induction interface for the independent Paley–Wiener prefix

Local real normalized parabolic induction for every real parabolic P=M_P A_P N_P and a supplied admissible SF representation (or a supplied unitary Hilbert realization) of M_P, on the fixed compact picture with K∩M_P covariance. Supply the half-modulus convention a^(ν+ρ_P), right translation, finite K-type coefficient spaces, holomorphic parameter dependence, and induction-in-stages. The existing AF.1/principal-series only treats minimal parabolics with finite-dimensional inducing W and is not this general Levi-family theorem. Use the independent AF.1/sf-representation interface; do not require a global automorphic occurrence in L²([M]¹). Bernstein–Krötz §9.3, Proposition9.6 and pp.39–40 give the local source route with its good-module/globalization hypotheses; wider supplied-SF holomorphy remains a stated extension.

Needed by [AutomorphicSpectralTheory:AS.6/real-invariant-paley-wiener](#automorphicspectraltheory-as-6-real-invariant-paley-wiener), [AutomorphicSpectralTheory:AS.6/real-operator-paley-wiener](#automorphicspectraltheory-as-6-real-operator-paley-wiener).

### Fixed-central and full-height pseudo-Eisenstein comparison

Arthur05 pp.65–66 distinguishes the full 𝔞_P construction on G(F)\G(𝔸) from its G(𝔸)¹ variant. Implement the split-centre decomposition, restricted inducing character and projected-height Fourier measure before identifying either model with the AS.1 abstract carrier. The rank-one full-height Lean specialization fixes the forward-transform sign and dt/(2π) dual measure; it does not prove global square-integrability or descent. The previously stated universal L² and inner-product prototypes are removed because arbitrary scalar families do not satisfy them.

Needed by [AutomorphicSpectralTheory:AS.1/pseudo-eisenstein](#automorphicspectraltheory-as-1-pseudo-eisenstein), [AutomorphicSpectralTheory:AS.1/pseudo-eisenstein-l2](#automorphicspectraltheory-as-1-pseudo-eisenstein-l2), [AutomorphicSpectralTheory:AS.1/pseudo-eisenstein-inner-product](#automorphicspectraltheory-as-1-pseudo-eisenstein-inner-product).

### Source-qualified spectral signatures after the round-3 fix review

The real invariant/operator Paley–Wiener conclusions cannot quantify over an arbitrary linear transform or an arbitrary pair of rings. Local normalizing factors cannot be asserted for arbitrary J (J=0 contradicts the unitary inverse). The convergent-intertwiner and its SL₂/Weyl tests need actual rational quotient, inducing, chamber and Weyl-transport data. Those full source signatures are explicitly omitted until the named suppliers exist. The suggested file retains a regular-point scalar-composition adapter for μ, an image-preserving multiplier transport, and actual rank-one/measure specializations, without claiming that these produce the missing real/adelic carriers. The round-3 fix review did not adjudicate the wider B1–B4 blockers. The independent revision-2 review below supersedes that limitation after checking the complete packet. The local-intertwiner adapter now assumes actual integrability and pointwise intertwining compatibility. Its spherical test evaluates the normalized valuation-shell integral, with the identification with GL₂ unipotent integration still omitted; arbitrary-kernel meromorphic continuation is no longer asserted. Weighted two-place splitting likewise awaits its actual quotient/Levi data, instead of asserting equality for unrelated scalars.

Needed by [AutomorphicSpectralTheory:AS.1/convergent-intertwiner](#automorphicspectraltheory-as-1-convergent-intertwiner), [AutomorphicSpectralTheory:AS.2/mu-function](#automorphicspectraltheory-as-2-mu-function), [AutomorphicSpectralTheory:AS.2/local-normalization](#automorphicspectraltheory-as-2-local-normalization), [AutomorphicSpectralTheory:AS.6/real-invariant-paley-wiener](#automorphicspectraltheory-as-6-real-invariant-paley-wiener), [AutomorphicSpectralTheory:AS.6/real-operator-paley-wiener](#automorphicspectraltheory-as-6-real-operator-paley-wiener), [AutomorphicSpectralTheory:AS.6/spectral-multiplier](#automorphicspectraltheory-as-6-spectral-multiplier), [AutomorphicSpectralTheory:AS.6/weighted-orbital-integral](#automorphicspectraltheory-as-6-weighted-orbital-integral), [AutomorphicSpectralTheory:AS.2/local-intertwiner](#automorphicspectraltheory-as-2-local-intertwiner).

### Stage acceptance work

**AutomorphicSpectralTheory:AS.0 — planned.**

- Analytic Fredholm source closure: Teschl supplies the fixed-operator Fredholm alternative, not a full parameter-analytic Fredholm proof. The finite-dimensional block argument here requires a source-qualified proof of holomorphic Riesz projections and local block inversion; several-variable polar hyperplanes are handled independently in AS.2.
- Yu 148 external proof inputs: The source routing dependencies outside this spectral inventory are PAPER-YU-23/142. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.
- Yu 149 external proof inputs: The source routing dependencies outside this spectral inventory are PAPER-YU-23/143, PAPER-YU-23/144. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.
- Yu 150 external proof inputs: The source routing dependencies outside this spectral inventory are PAPER-YU-23/143, PAPER-YU-23/144. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.
- Gross–Zagier resolvent source and regularized derivative integrals: GZ II§2 quotes Hejhal for the meromorphic kernel rather than proving its continuation; share the modular resolvent proof gap with DIT. At integer negative V-parameters some original Fourier integrals are conditional and must be defined by continuation, not by a divergent absolute integral. The gamma and K-Bessel formulas need source-to-library type integration.
- Bounded-normal joint-measure proof: Teschl §3 develops the self-adjoint spectral measure and motivates multiplication models, but the normal-operator claim here additionally needs a source-qualified proof that the spectral projections of commuting Re(N), Im(N) commute and give a joint complex Borel measure. The compact-selfadjoint baseline cannot supply this missing step.
- Locally convex Schwartz kernel integration: Mathlib already supplies normed vector-valued Schwartz maps and continuous postcomposition. The general quasi-complete locally convex Schwartz carrier needs seminorm-family topology and completion integration. The tensor identification needs a precise Grothendieck kernel theorem with its nuclearity/completeness hypotheses; BPCZ A.0.7.8 is a quoted source input, not its proof. Do not implement this by re-defining Mathlib SchwartzMap.
- Positive harmonic Poisson representation: The general Herglotz proof needs the representation of a positive harmonic function on the upper half-plane as b Im(z)+∫ Im(z)/((Re(z)−t)²+Im(z)²)dν(t), with b≥0 and ∫(1+t²)⁻¹dν finite. Shapiro Theorem 10.5 invokes this classical input; no pinned baseline or supplier node has been established here. Teschl Theorem 3.20 does not cover it.
- Strong operator topology source qualification: BPCZ Appendix A equips Hom(V,W) and V′ with weak pointwise topologies. The bounded-set topology and weak-to-strong meromorphy upgrade in the operator-meromorphic target require a separate proof with a common denominator and the appropriate local boundedness/uniform seminorm hypotheses. The cited weak holomorphy passage alone does not establish that upgrade.
- General LF weak-dual continuation adapter: The revised Schwartz signature retains the two-sided scalar continuation, initial full-seminorm strip order, functional equation and existence/uniqueness conclusion. The revised weak-dual signature supplies the corresponding Banach one-stage LF specialization, with one common initial scalar order and continuous functional values. General LF stage topologies, the weak-dual locally convex carrier and the barrelled/quasi-complete passage still require the planned LF/vector analysis interfaces. No strong-dual holomorphy is asserted.
- Compact Lie Fourier and full-carrier test adapters: The revised Yu149 specialization uses normalized finite-group Haar, the full dual, absolute summability and the actual fibre average. Yu150 now concerns smooth periodic functions and their actual torus coefficients. The finite-group-times-torus transport, uniform auxiliary-parameter derivative estimate and the full adelic/representation carriers connecting the restricted object tests to their source models remain required. Individual restrictions are stated at each affected node; numerical helper identities are no longer presented as the source-level test.
- Supplier request: QSeriesPartitionsAndMockModularForms:QM.2 — Supply the K-Bessel function with its convergent positive-real integral, order reflection K_ν=K_(−ν), initial-value/decaying normalization and the differentiated parameter estimates required by AS.0/dit-113 and gz-217. QM.2 has I and J nodes but no K node yet. I and J are imported by their exact node ids; the finite untwisted Kloosterman sum is QM.3/classical-kloosterman-sum. The Whittaker M/W definitions belong to AS.0/dit-112.
- REV-FIX-RT-AREA-automorphic-1~3: retain the precise local-real induction, split-central pseudo-Eisenstein and source-qualified signature obligations recorded in the new gaps; the full-carrier source and prototype obligations are stated at the affected nodes and remain for independent review.

**AutomorphicSpectralTheory:AS.1 — planned.**

- Uniform differentiated chamber estimates: Arthur’s Lemma 7.1 states absolute analytic convergence; the target also needs all fixed differential operators and Siegel-set height bounds. Extract their explicit seminorm estimates from Langlands Chapter 7 and the residual-to-discrete extension, with local uniformity on compact chamber subsets. The present pass does not identify a complete source-level seminorm proof.
- General nonassociate constant-term indexing: The associate cuspidal exponential formula is fully specified. The target’s arbitrary Q/discrete inducing formula needs the explicit surviving double-coset conditions and Levi source/target maps from Langlands Chapter 7; the present pass records that general formula as a named gap, rather than using the associate formula outside its hypotheses.
- Yu 010 external proof inputs: The source routing dependencies outside this spectral inventory are PAPER-YU-23/009. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.
- Function-field spectral analytic sources: Yu v5 gives the explicit statements, local factors and Fourier calculations. Complete primary proof closure still requires Lafforgue VI.1 Langlands unitarity/functional equations, VI.2 Lemma9/Corollary10 with coherent ρ conventions, the original Mœglin–Waldspurger residual classification in the function-field GL_n case, and Harder’s cuspidal compact-support input. Number-field AS.1–4 are not used as an unproved transfer to characteristic p.
- Global rational Bruhat indexing: The automorphic constant-term computation needs the rational Bruhat decomposition of G(F), its parabolic double-coset refinements and compatibility with the adelic unipotent quotient measures. SmoothRepresentationsOfLocalGroups SR.2 supplies local induction/geometric lemmas only; it does not supply these rational global decompositions. Assign this extension to AdelicAlgebraicGroups, Part II (or an accepted algebraic-group supplier) before proving the constant-term identity.
- Smooth globalization, weighted χ projections and Siegel cutoffs: BPCZ items27–28 require the AF Part II SLF/Casselman–Wallach globalization and completed product, and Lapid smooth Eisenstein continuity into T_N([G]), beyond the finite-K-type Langlands prototypes. Item33 requires the weighted parabolic MW II.2.4 decomposition and equality of χ projections for different weights. Item45 is the AA Part II compact Siegel cutoff F^G (modulo the center), distinct from Λ^T. The previous routing of all four through Appendix A was not justified; these item-specific routes are now gap decisions.
- Supplier request: SmoothRepresentationsOfLocalGroups:SR.2 — The local parabolic induction and geometric-lemma indexing used in comparing compact-picture intertwiners. Rational F-points and automorphic global Bruhat cosets are a separate missing input below.
- Supplier request: AutomorphicLFunctionsAndLocalFactors:AL.0 — Fourier–Laplace inversion for C_c∞ on finite-dimensional real height spaces with dual Haar measure and the componentwise Paley–Wiener characterization; this is the real-place Schwartz–Bruhat interface.
- Supplier request: AutomorphicLFunctionsAndLocalFactors:AL.1 — Import AL.1/hecke-l-functional-equation and its local/global Tate zeta normalization; specialize the completed Hecke L-function to the Riemann or Dirichlet character and remove the finite Euler factors stated here. AL.0 supplies Fourier analysis, not this scalar functional equation.
- Supplier request: AutomorphicLFunctionsAndLocalFactors:AL.1 — Import AL.1/hecke-l-functional-equation and its local/global Tate zeta normalization; specialize the completed Hecke L-function to the Riemann or Dirichlet character and remove the finite Euler factors stated here. AL.0 supplies Fourier analysis, not this scalar functional equation.
- Supplier request: QSeriesPartitionsAndMockModularForms:QM.2 — Supply the K-Bessel function with its convergent positive-real integral, order reflection K_ν=K_(−ν), initial-value/decaying normalization and the differentiated parameter estimates required by AS.0/dit-113 and gz-217. QM.2 has I and J nodes but no K node yet. I and J are imported by their exact node ids; the finite untwisted Kloosterman sum is QM.3/classical-kloosterman-sum. The Whittaker M/W definitions belong to AS.0/dit-112.
- REV-FIX-RT-AREA-automorphic-1~3: retain the precise local-real induction, split-central pseudo-Eisenstein and source-qualified signature obligations recorded in the new gaps; the full-carrier source and prototype obligations are stated at the affected nodes and remain for independent review.

**AutomorphicSpectralTheory:AS.2 — planned.**

- Local Harish-Chandra analytic inputs beyond suppliers: The reviewed SR and AF stages provide representation-theoretic carriers, but a complete proof of the μ-function/Plancherel scalar and rank-one local meromorphic integrals needs the real and nonarchimedean Harish-Chandra harmonic-analysis theorems cited by Arthur 1989. No precise supplier node for these general analytic theorems exists in the packets inspected; identify their statements and ownership before claiming analytic closure.
- Langlands Chapter 7 residue-system proof: The continuation and final onto map are precisely stated by Arthur Theorem 7.2. The full higher-rank residual system in Langlands Chapter 7, including compatible ordered residues, affine root hyperplanes and positivity when crossing intersections, has not been decomposed source by source in this pass. The resolvent/contour outline is not a replacement for that input.
- Jiang–Zhang rank-one source closure: Appendix B supplies the exact three analytic inputs and their bounds. The MW 1989, Waldspurger 2003/Borel–Wallach and CKPSS 2004 proofs, plus the generic unitary dual and standard-module irreducibility theorems, have not been read from their primary sources in this pass. Source-qualify these statements and reconcile their parameter/normalization conventions before closing the chain.
- Franke–Schwermer primary source and GLₙ synthesis: The requested FS98 Math. Ann.311 (1998),765–790 Theorem2.3 has not been obtained in a freely readable primary copy. The inspected CGH consumer quotes the isobaric realization, while Franke proves the coarser Laurent-coefficient synthesis. Obtain FS98, verify its exact support/ideal indices, and source-qualify general GL_n isobaric existence and multiplicity one before closing these two nodes.
- Yu 066 external proof inputs: The source routing dependencies outside this spectral inventory are PAPER-YU-23/011, PAPER-YU-23/057. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.
- Function-field spectral analytic sources: Yu v5 gives the explicit statements, local factors and Fourier calculations. Complete primary proof closure still requires Lafforgue VI.1 Langlands unitarity/functional equations, VI.2 Lemma9/Corollary10 with coherent ρ conventions, the original Mœglin–Waldspurger residual classification in the function-field GL_n case, and Harder’s cuspidal compact-support input. Number-field AS.1–4 are not used as an unproved transfer to characteristic p.
- Modular resolvent primary source and noncompact boundary realization: DIT16 quotes Fay Theorem3.1, Hejhal and Neunhöffer for continuation rather than proving it. Verify the cusp self-adjoint domain, the kernel-to-distribution realization, the full Fourier expansion including m=0, and meromorphic continuation on Re(s)>0 in a primary freely readable copy. AS.0 spectral calculus alone gives a bounded off-spectrum inverse; it does not continue a kernel across continuous spectrum.
- Gross–Zagier resolvent source and regularized derivative integrals: GZ II§2 quotes Hejhal for the meromorphic kernel rather than proving its continuation; share the modular resolvent proof gap with DIT. At integer negative V-parameters some original Fourier integrals are conditional and must be defined by continuation, not by a divergent absolute integral. The gamma and K-Bessel formulas need source-to-library type integration.
- Local-factor and packet Part II beyond current owners: AutomorphicLFunctionsAndLocalFactors AL.3 covers GL×GL Rankin–Selberg factors; it does not define all GL×classical Shahidi L/ε factors, exterior/symmetric-square or Asai local factors with packet compatibility. Extend that owner as Part II before the Jiang–Zhang ratio is implemented. ET.0 is conjugacy data, not local parameter theory; unitary and orthogonal/classical generic tempered packets and the relevant pure inner forms need EndoscopicTransferAndUnitaryTraceComparison, Part II. No dependency on the existing stages is treated as proving these extensions.
- Modular core and boundary-residue adapters: The F_A core-surface construction belongs to the Fuchsian-orbifold Part II route of the reviewed DIT extraction; the geometry of oriented quadratic cycles/genus signs requires GeometryOfNumbersAndQuadraticArithmetic, Part II; current GN.2–3 do not supply it. Until its new roadmap has a supplier node, the integrable-over-core adapter is conditional on that imported finite-area cusp geometry. TauCeti.vitali supplies interior convergence only: the limit on Re(s)=1/2 and coefficient residues still require a parameter-uniform cusp majorant and the meromorphic resolvent proof, rather than an interior Vitali argument.
- Effective modular-group and Green-resolvent integration: ER.7 supplies congruence groups and upper-half-plane geometry. Integrate the Γ₀(N)/±I index for the Green sum, distinguishing it from Γ∞\Γ for Eisenstein series. Prove the off-diagonal lattice-growth/differentiation bounds and obtain the quoted Hejhal Chapters6–7 continuation proof; GZ p.239 quotes that proof rather than giving it. The imported QM.3 weight-zero Laplacian must use Δ_GZ=+y²(∂x²+∂y²), opposite to DIT’s nonnegative convention.
- Local analytic extensions beyond representation carriers: SR.3 supplies admissible/tempered representation carriers, not the complete Harish-Chandra estimates, rank-one continuation or Langlands classification requested here. AF.1 now plans langlands-classification, discrete-series, archimedean-llc-gln and casselman-wallach-globalization in the single real-representation owner; its original classification/discrete-series proofs and faithful native signatures remain recorded gaps. Reuse those precise contracts rather than create another real classification owner. SR.4 supplies Satake and spherical constant terms, not a proof of the analytic Gindikin–Karpelevich c-function. Reuse the planned SR/AF interfaces and request the additional analytic inputs from their respective owners; SR.1 finite Hecke convolution also needs the unitary integrated L¹ norm bound before the analytic Hilbert action is used.
- Smooth globalization, weighted χ projections and Siegel cutoffs: BPCZ items27–28 require the AF Part II SLF/Casselman–Wallach globalization and completed product, and Lapid smooth Eisenstein continuity into T_N([G]), beyond the finite-K-type Langlands prototypes. Item33 requires the weighted parabolic MW II.2.4 decomposition and equality of χ projections for different weights. Item45 is the AA Part II compact Siegel cutoff F^G (modulo the center), distinct from Λ^T. The previous routing of all four through Appendix A was not justified; these item-specific routes are now gap decisions.
- Supplier request: SmoothRepresentationsOfLocalGroups:SR.2 — Local normalized induction, induction in stages and compact-picture source/target identifications over nonarchimedean fields.
- Supplier request: SmoothRepresentationsOfLocalGroups:SR.3 — Admissible and tempered representations, Harish-Chandra matrix-coefficient estimates, rank-one meromorphic continuation and the nonarchimedean Langlands classification.
- Supplier request: AutomorphicFormsOnReductiveGroups:AF.1 — Real reductive Harish-Chandra modules, tempered/discrete-series parameters, compact-picture normalized induction and the real Langlands classification needed in local normalization.
- Supplier request: SmoothRepresentationsOfLocalGroups:SR.4 — Hyperspecial spherical vectors and the rank-one unramified c-function for normalized induction; fixed Haar volume K=1.
- Supplier request: AutomorphicFormsOnReductiveGroups:AF.2 — Import AF.2/flath-factorization for the irreducible admissible algebraic restricted tensor product and almost-everywhere spherical vectors. Match its Hilbert completion and the separate discrete multiplicity space in AS.2; AF.4 rationality is not this theorem.
- Supplier request: AutomorphicFormsOnReductiveGroups:AF.3 — Langlands square-integrability criterion for automorphic forms with finitely many parabolic exponents: negative real exponents on every proper parabolic modulo the split center, including the weak/non-strict boundary distinction.
- Supplier request: AutomorphicLFunctionsAndLocalFactors:AL.3 — Import only the GL×GL Rankin–Selberg normalization/factor input covered by AL.3. The GL×classical and exterior/symmetric/Asai Shahidi factors exceed its current scope and are the precise Part II gap below.
- Supplier request: EndoscopicTransferAndUnitaryTraceComparison:ET.0 — EndoscopicTransferAndUnitaryTraceComparison, Part II: local unitary and orthogonal/classical tempered parameter and packet carriers with pure-inner-form/genericity conventions. Current ET.0 supplies conjugacy data; it supplies none of these packet carriers. No existing ET node discharges this request.
- Supplier request: AutomorphicLFunctionsAndLocalFactors:AL.3 — Import only the GL×GL Rankin–Selberg normalization/factor input covered by AL.3. The GL×classical and exterior/symmetric/Asai Shahidi factors exceed its current scope and are the precise Part II gap below.
- Supplier request: SmoothRepresentationsOfLocalGroups:SR.4 — Spherical Satake/normalized constant-term map for GL_n and the rank-one Gindikin–Karpelevich action, with local vol N(𝒪_v)=1.
- Supplier request: AutomorphicLFunctionsAndLocalFactors:AL.2 — Unramified standard GL_n local Euler factors; an isobaric block sum concatenates Satake multisets and multiplies these factors. This does not request the isobaric existence theorem from AL.2.
- REV-FIX-RT-AREA-automorphic-1~3: retain the precise local-real induction, split-central pseudo-Eisenstein and source-qualified signature obligations recorded in the new gaps; the full-carrier source and prototype obligations are stated at the affected nodes and remain for independent review.

**AutomorphicSpectralTheory:AS.3 — planned.**

- Uniform packet-limit argument: The exact compact-support Fubini identity follows from the stated bounds. The final T→∞ diagonalization of the complete Weyl sum, including overlapping residual strata, is Langlands’s spectral construction and must be extracted from Chapter 7; no termwise limit of separate singular Weyl terms is permitted.
- Yu 022 external proof inputs: The source routing dependencies outside this spectral inventory are PAPER-YU-23/009. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.
- Global rational Bruhat indexing: The automorphic constant-term computation needs the rational Bruhat decomposition of G(F), its parabolic double-coset refinements and compatibility with the adelic unipotent quotient measures. SmoothRepresentationsOfLocalGroups SR.2 supplies local induction/geometric lemmas only; it does not supply these rational global decompositions. Assign this extension to AdelicAlgebraicGroups, Part II (or an accepted algebraic-group supplier) before proving the constant-term identity.
- Function-field root and coprime cutoff proof adapters: AA.3 is stated for number fields. The GL_n root/block linear algebra can be reused over the function field only after recording its characteristic-independent root-datum adapter. Yu Lemma A.2 requires gcd(e,n)=1 (PAPER-YU-23/E48); its proper-Levi translated cutoff cancellation is not proved by merely citing the missing-pole argument for an arbitrary family. Source-qualify this coprime argument. Do not use (5.3.6) for every degree or the noncoprime global Theorem A.4 from this argument; the lattice identity of Lemma A.3 is a separate statement.
- Smooth globalization, weighted χ projections and Siegel cutoffs: BPCZ items27–28 require the AF Part II SLF/Casselman–Wallach globalization and completed product, and Lapid smooth Eisenstein continuity into T_N([G]), beyond the finite-K-type Langlands prototypes. Item33 requires the weighted parabolic MW II.2.4 decomposition and equality of χ projections for different weights. Item45 is the AA Part II compact Siegel cutoff F^G (modulo the center), distinct from Λ^T. The previous routing of all four through Appendix A was not justified; these item-specific routes are now gap decisions.

**AutomorphicSpectralTheory:AS.4 — planned.**

- Langlands Chapter 7 residue-system proof: The continuation and final onto map are precisely stated by Arthur Theorem 7.2. The full higher-rank residual system in Langlands Chapter 7, including compatible ordered residues, affine root hyperplanes and positivity when crossing intersections, has not been decomposed source by source in this pass. The resolvent/contour outline is not a replacement for that input.
- Compact-quotient Sobolev trace-class input: The compact periodized kernel is specified, but its smoothing-to-trace-class factorization requires Sobolev compact embeddings and an elliptic/smoothing spectral estimate on Γ\G. Peter–Weyl for compact G does not provide this for noncompact G with cocompact Γ; source-qualify that analytic input before closing this node.
- Modular Weyl and pointwise analytic proof inputs: DIT §5 cites Hejhal/Iwaniec for the full spectral theorem, Weyl law and eigenfunction bounds. Primary proofs of these inputs and the compact-core coefficient estimates must be extracted; DIT’s numerical first eigenvalues are not a proof that every cusp eigenvalue exceeds 1/4.
- Essentially tempered reductive central adapter: Wallach’s inspected theorem is for the semisimple arithmetic real setting. The GSp₄/totally-real and Res PGL_n consumer claims need a proved restriction-of-scalars and split-center twist reduction, checking square integrability modulo the chosen unitary character. This pass does not use the reductive extension without that proof.
- Yu 017 external proof inputs: The source routing dependencies outside this spectral inventory are PAPER-YU-23/011, PAPER-YU-23/012. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.
- Yu 020 external proof inputs: The source routing dependencies outside this spectral inventory are PAPER-YU-23/012. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.
- Yu 021 external proof inputs: The source routing dependencies outside this spectral inventory are PAPER-YU-23/004. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.
- Yu 065 external proof inputs: The source routing dependencies outside this spectral inventory are PAPER-YU-23/013, PAPER-YU-23/064. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.
- Function-field spectral analytic sources: Yu v5 gives the explicit statements, local factors and Fourier calculations. Complete primary proof closure still requires Lafforgue VI.1 Langlands unitarity/functional equations, VI.2 Lemma9/Corollary10 with coherent ρ conventions, the original Mœglin–Waldspurger residual classification in the function-field GL_n case, and Harder’s cuspidal compact-support input. Number-field AS.1–4 are not used as an unproved transfer to characteristic p.
- No exceptional level-one cusp spectrum: DIT16 (5.6),(5.11) choose real r and give numerical first-eigenvalue data; that is not a proof that all cusp eigenvalues exceed 1/4. Obtain a rigorous primary-source theorem with certification if computational. All AS.4 decomposition and DIT residue statements retain possible exceptional parameters or explicitly assume r>0.
- Modular core and boundary-residue adapters: The F_A core-surface construction belongs to the Fuchsian-orbifold Part II route of the reviewed DIT extraction; the geometry of oriented quadratic cycles/genus signs requires GeometryOfNumbersAndQuadraticArithmetic, Part II; current GN.2–3 do not supply it. Until its new roadmap has a supplier node, the integrable-over-core adapter is conditional on that imported finite-area cusp geometry. TauCeti.vitali supplies interior convergence only: the limit on Re(s)=1/2 and coefficient residues still require a parameter-uniform cusp majorant and the meromorphic resolvent proof, rather than an interior Vitali argument.
- Local analytic extensions beyond representation carriers: SR.3 supplies admissible/tempered representation carriers, not the complete Harish-Chandra estimates, rank-one continuation or Langlands classification requested here. AF.1 now plans langlands-classification, discrete-series, archimedean-llc-gln and casselman-wallach-globalization in the single real-representation owner; its original classification/discrete-series proofs and faithful native signatures remain recorded gaps. Reuse those precise contracts rather than create another real classification owner. SR.4 supplies Satake and spherical constant terms, not a proof of the analytic Gindikin–Karpelevich c-function. Reuse the planned SR/AF interfaces and request the additional analytic inputs from their respective owners; SR.1 finite Hecke convolution also needs the unitary integrated L¹ norm bound before the analytic Hilbert action is used.
- Weight-k modular Laplacian conjugation: QM.3 uses the classical weight-k coefficient operator −y²(∂x²+∂y²)+iky(∂x+i∂y), while DIT uses the unitary-weight operator −y²(∂x²+∂y²)+iky∂x. For F=y^(k/2)f the first operator on f is y^(−k/2)(Δ_unit F+(k²/4−k/2)F). The k=1/2 shift is −3/16. State this conjugation and its measure/automorphy dictionary before using the QM carrier for the DIT half-weight eigenvalue; the two conventions cannot be identified literally.
- Supplier request: AutomorphicFormsOnReductiveGroups:AF.2 — Harish-Chandra finiteness of automorphic forms at fixed finite level, finite archimedean K types and fixed finite-codimension infinitesimal-character ideal, with uniform moderate growth.
- Supplier request: SmoothRepresentationsOfLocalGroups:SR.1 — Complex finite Hecke convolution and its integrated unitary action, involution and L¹ operator-norm bound; compact-open idempotents project to finite-level invariants.
- Supplier request: GeometryOfNumbersAndQuadraticArithmetic:GN.3 — GeometryOfNumbersAndQuadraticArithmetic, Part II (with the Fuchsian-orbifold Part II route): oriented quadratic cycles/cores, the cycle involution and genus-character sign used by DIT16. Current GN.3 supplies mass/theta results, not these cycles; no existing GN.3 node discharges this request.

**AutomorphicSpectralTheory:AS.5 — planned.**

- Franke graded-piece weight/index integration: The principal p_{−r}+log acyclicity and the constant-term support filtration are stated. Theorem 16’s printed extra cone has been read: closed Weyl chamber intersected with the interior of the positive root cone. Theorem 14’s height-space duals, χ-support and induced jet-module identifications must still be compared with the supplier representation types before implementation. This is a type-integration gap, not an unknown cone.
- General GLₙ cohomological and multiplicity-one input: BCG supplies the exact level-one diagram and parity consequences, citing Clozel Lemma 3.14 and Borel. The general n archimedean cohomological calculation and GL_n global multiplicity-one/spherical-vector statements need their own primary-source supplier; the existing GL₂ direction covers only n=2. No GL₂ stage is used as if it proved general n.
- Franke–Schwermer primary source and GLₙ synthesis: The requested FS98 Math. Ann.311 (1998),765–790 Theorem2.3 has not been obtained in a freely readable primary copy. The inspected CGH consumer quotes the isobaric realization, while Franke proves the coarser Laurent-coefficient synthesis. Obtain FS98, verify its exact support/ideal indices, and source-qualify general GL_n isobaric existence and multiplicity one before closing these two nodes.

**AutomorphicSpectralTheory:AS.6 — planned.**

- Compact-quotient Sobolev trace-class input: The compact periodized kernel is specified, but its smoothing-to-trace-class factorization requires Sobolev compact embeddings and an elliptic/smoothing spectral estimate on Γ\G. Peter–Weyl for compact G does not provide this for noncompact G with cocompact Γ; source-qualify that analytic input before closing this node.
- Nonarchimedean invariant trace Paley–Wiener supplier: The BDK trace-image theorem is not in the stated SR.0–SR.4 scope. SmoothRepresentationsCharactersPartII is the proposed owner but has no designed stage/node in the current atlas. Supply the finite Bernstein-component/support and regular trace image theorem there; AS.6 imports it for I_ac at finite places and does not duplicate it.
- Weighted orbital estimate and general L²-cohomology primary prerequisites: The inspected Arthur survey/originals state the weighted orbital convergence, induced-class limiting measures and L²-Lefschetz formulas, but their Deligne–Rao singular estimate, Borel–Casselman L² cohomology finiteness, and the complete rank-inductive weighted estimates are not supplied by ET.1 or ALS.5’s current scopes. Source and assign those exact analytic/cohomological inputs before closing the corresponding constructions.
- Yu 024 external proof inputs: The source routing dependencies outside this spectral inventory are PAPER-YU-23/011. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.
- Yu 038 external proof inputs: The source routing dependencies outside this spectral inventory are PAPER-YU-23/033. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.
- Yu 039 external proof inputs: The source routing dependencies outside this spectral inventory are PAPER-YU-23/008, PAPER-YU-23/035. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.
- Yu 053 external proof inputs: The source routing dependencies outside this spectral inventory are PAPER-YU-23/011. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.
- Yu 152 external proof inputs: The source routing dependencies outside this spectral inventory are PAPER-YU-23/144. Match their exact statements to existing supplier nodes (curve/adelic dictionaries, spherical Hecke and local factors, bundle/Higgs counting or original harmonic analysis as appropriate); the present node does not claim those inputs proved.
- Function-field spectral analytic sources: Yu v5 gives the explicit statements, local factors and Fourier calculations. Complete primary proof closure still requires Lafforgue VI.1 Langlands unitarity/functional equations, VI.2 Lemma9/Corollary10 with coherent ρ conventions, the original Mœglin–Waldspurger residual classification in the function-field GL_n case, and Harder’s cuspidal compact-support input. Number-field AS.1–4 are not used as an unproved transfer to characteristic p.
- Global rational Bruhat indexing: The automorphic constant-term computation needs the rational Bruhat decomposition of G(F), its parabolic double-coset refinements and compatibility with the adelic unipotent quotient measures. SmoothRepresentationsOfLocalGroups SR.2 supplies local induction/geometric lemmas only; it does not supply these rational global decompositions. Assign this extension to AdelicAlgebraicGroups, Part II (or an accepted algebraic-group supplier) before proving the constant-term identity.
- Local analytic extensions beyond representation carriers: SR.3 supplies admissible/tempered representation carriers, not the complete Harish-Chandra estimates, rank-one continuation or Langlands classification requested here. AF.1 now plans langlands-classification, discrete-series, archimedean-llc-gln and casselman-wallach-globalization in the single real-representation owner; its original classification/discrete-series proofs and faithful native signatures remain recorded gaps. Reuse those precise contracts rather than create another real classification owner. SR.4 supplies Satake and spherical constant terms, not a proof of the analytic Gindikin–Karpelevich c-function. Reuse the planned SR/AF interfaces and request the additional analytic inputs from their respective owners; SR.1 finite Hecke convolution also needs the unitary integrated L¹ norm bound before the analytic Hilbert action is used.
- Supplier request: SmoothRepresentationsOfLocalGroups:SR.1 — Complex finite Hecke convolution and its integrated unitary action, involution and L¹ operator-norm bound; compact-open idempotents project to finite-level invariants.
- Supplier request: EndoscopicTransferAndUnitaryTraceComparison:ET.1 — The unweighted quotient-centralizer orbital integral, its semisimple convergence and singular extension, with connected/full centralizer and discriminant conventions exposed for comparison.
- Supplier request: EndoscopicTransferAndUnitaryTraceComparison:ET.1 — Import unitary/discrete-series and tempered pseudo-coefficient carriers; AS.6 adds the full finite-length EP trace identity and L²-Lefschetz application.
- Real harmonic-analysis prefix before ET.1: The real invariant/operator Paley–Wiener and multiplier targets are currently located in AS.6, whose weighted orbital-integral and Euler–Poincaré targets import ET.1. ET.1 must consume the general real harmonic-analysis results through an earlier AS prefix or an AF Part II prefix, not by importing the complete AS.6 stage. Record that exported prefix and its acyclic dependencies when integrating RT-AREA-automorphic-1/4 and /24; no new stage id is invented in this review.
- REV-FIX-RT-AREA-automorphic-1~3: retain the precise local-real induction, split-central pseudo-Eisenstein and source-qualified signature obligations recorded in the new gaps; the full-carrier source and prototype obligations are stated at the affected nodes and remain for independent review.

## Source corrections and edition limits

The disputed assertions below are described in authored prose with exact locators. Corrections apply only to the recorded editions, with their stated search limits. The mathematical targets use the corrected conventions; a reported defect is not an independent claim about every edition.

### AutomorphicSpectralTheory/E1 — misprint

Source: [Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Appendix A, proof of (A.1) (Lemma 7), the last display, p.984, in the published version, Annals of Mathematics 184 (2016), 949–990 (publisher PDF, SHA-256 a67de715…5f61); the author preprint of 29 July 2016 on W. Duke's page has the same text there.

**Disputed assertion.** The cited trigonometric integral is used with a prefactor lacking the required power of two.

**Correction.** ∫_0^π e^{iβx} sin^{ν−1}x dx = π e^{iπβ/2} Γ(ν) / (2^{ν−1} Γ((ν+β+1)/2) Γ((ν−β+1)/2)) for Re ν > 0.

**Reason and effect.** At ν = 3, β = 0 the left side is ∫_0^π sin²x dx = π/2, while the printed right side is πΓ(3)/Γ(2)² = 2π. The cited Gradshteyn–Ryzhik formula, π e^{iπβ/2} / (2^{ν−1} ν B((ν+β+1)/2, (ν−β+1)/2)), has the factor 2^{ν−1}. The next display (A.2) is correct. With ν = n + s, the factor 2^{n+s−1} cancels (2t)^{n+s} and leaves the printed 2π, so Lemma 7 is unaffected. Checked on the page image. Noted by the extraction (Corrections, item 7). Effect: nothing.

**Edition and correction status.** Recorded and independently checked in PAPER-DUKE-IMAMOGLU-TOTH-16/E9; retained here for the corrected spectral nodes. This is not a newly claimed discovery.

**Recorded bounded searches.**

- Reused the recorded bounded searches in research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json (their dates and edition limits remain those of that record).
- Re-read the relevant passage in the source version ledgered here; no fresh claim of global novelty or journal collation.

### AutomorphicSpectralTheory/E2 — misprint

Source: [Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Appendix A, the display before (A.3), p.985, in the published version, Annals of Mathematics 184 (2016), 949–990 (publisher PDF, SHA-256 a67de715…5f61); the author preprint of 29 July 2016 on W. Duke's page has the same text there.

**Disputed assertion.** The comparison of the Bessel series with a power series loses a square-root-of-two normalization.

**Correction.** t^{1/2} J_{s−1/2}(t) = √2 Σ_{r≥0} (−1)^r (t/2)^{s+2r} / (r! Γ(s + 1/2 + r)).

**Reason and effect.** Put ν = s − 1/2 in J_ν(t) = Σ (−1)^r (t/2)^{ν+2r} / (r! Γ(ν + r + 1)). Then t^{1/2}(t/2)^{s−1/2+2r} = √2 (t/2)^{s+2r}. (A.3) is correct with the √2: G(s, μ) = e(μ/4)(2π)^{3/2} 2^{−s}Γ(2s)/(…), times √2 · 2^{−s−2r}, gives the printed π^{3/2} e(μ/4) 2^{2−2s} Γ(2s) 2^{−2r}/(…). The leading coefficients of (A.2) and (A.3) then agree by the duplication formula, so Lemma 7 stands. Checked on the page image. Noted by the extraction (Corrections, item 8). Effect: nothing.

**Edition and correction status.** Recorded and independently checked in PAPER-DUKE-IMAMOGLU-TOTH-16/E10; retained here for the corrected spectral nodes. This is not a newly claimed discovery.

**Recorded bounded searches.**

- Reused the recorded bounded searches in research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json (their dates and edition limits remain those of that record).
- Re-read the relevant passage in the source version ledgered here; no fresh claim of global novelty or journal collation.

### AutomorphicSpectralTheory/E3 — gap

Source: [Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Appendix A, proof of (A.1): the strategy sentence on p. 983 and the final paragraph on p. 985; the differentiation under the integral sign on p. 984.

**Disputed assertion.** The proof attempts to establish uniqueness from a common differential equation and agreement of the first three expansion coefficients.

**Correction.** Two unstated routine steps close the proof. (i) Uniqueness. By (A.2), the left side of (A.1) is t^s H(t) with H entire: the double series is dominated termwise using |∫_0^π e^{i(m+μ)θ} sin^{n+s−1}θ dθ| ≤ e^{π|Im μ|}∫_0^π sin^{σ−1}θ dθ, which also justifies integrating termwise. By (A.3), the right side is t^s H̃(t) with H̃ entire. For f = t^s Σ a_ℓ t^ℓ, the equation f″ + (1 − s(s−1)/t²)f = 0 forces a_1 = 0 and ℓ(ℓ+2s−1)a_ℓ = −a_{ℓ−2} (ℓ ≥ 2), and ℓ(ℓ+2s−1) ≠ 0 for ℓ ≥ 1 when Re s > 0. So both sides are determined by their t^s coefficients. These coefficients agree by the duplication formula, and this covers the case where both vanish. (ii) Differentiating twice in t under the integral on p. 984 is justified by dominated convergence: the integrand and its first two t-derivatives are O(sin^{σ−1}θ), σ = Re s, uniformly for t in compact subsets of (0,∞).

**Reason and effect.** The step is terse but no step is false. In the defence of the paper: 'Taylor series' refers to the expansions in powers t^{s+ℓ} that (A.2) and (A.3) actually compute. The authors match coefficients of t^s, t^{s+1}, t^{s+2}, and 'more than what is needed' shows they intend the one-coefficient Frobenius argument at the regular singular point t = 0 (exponents s and 1−s), not a regular-point uniqueness from two Taylor coefficients. So the extraction's framing overstates the problem. What is missing is the explicit statement of the recurrence and the differentiation-under-the-integral justification; items 117/166 and 163–165 supply them. Lemma 7 is true: I verified it numerically, for both signs, complex μ and s, and G = 0. Effect: the proof.

**Edition and correction status.** Recorded and independently checked in PAPER-DUKE-IMAMOGLU-TOTH-16/E11; retained here for the corrected spectral nodes. This is not a newly claimed discovery.

**Recorded bounded searches.**

- Reused the recorded bounded searches in research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json (their dates and edition limits remain those of that record).
- Re-read the relevant passage in the source version ledgered here; no fresh claim of global novelty or journal collation.

### AutomorphicSpectralTheory/E4 — misprint

Source: [Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (8.3), p.973; and the display after (8.4), p.974.

**Disputed assertion.** The displayed Green-kernel Fourier series includes the zero index in a formula whose Bessel argument and seed are only specified for nonzero indices; the subsequent Fourier-coefficient equation lacks the same outer square-root factor.

**Correction.** (8.3): the m=0 term is (2s−1)^{−1}y′^{1−s}E(z,s); the expansion is valid for y′>max_γ Im γz (e.g. z∈F, y′>y). p. 974: the second term should be −(¼+r²−s(1−s))^{−1}Σ⟨φ,φ⟩^{−1}conj φ(z)·2a(m)√y′K_{ir}(2π|m|y′).

**Reason and effect.** The m=0 term is the m→0 limit of √y′K_{s−1/2}(2π|m|y′)F_{−m}(z,s), which is y′^{1−s}y^s/(2s−1) on the seed. For z not reduced, y′>y does not exclude singular points z′=γz with Im γz>y. Only m≠0 is used, and the missing √y′ cancels on both sides, so the conclusion Res(2s−1)F_{−m}=Σ⟨φ,φ⟩⁻¹2a(m)conj(φ(z)) is right. Effect: nothing.

**Edition and correction status.** Recorded and independently checked in PAPER-DUKE-IMAMOGLU-TOTH-16/E25; retained here for the corrected spectral nodes. This is not a newly claimed discovery.

**Recorded bounded searches.**

- Reused the recorded bounded searches in research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json (their dates and edition limits remain those of that record).
- Re-read the relevant passage in the source version ledgered here; no fresh claim of global novelty or journal collation.

### AutomorphicSpectralTheory/E5 — error

Source: [Geometric Invariants for Real Quadratic Fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §8, display at the top of p.975.

**Disputed assertion.** The residue is expressed through a bilinear product of Fourier coefficients without an explicit conjugation convention for the chosen cusp-form basis.

**Correction.** Res_{s=1/2+ir}(2s−1)Φ(−m,n;s)=2Σ_φ⟨φ,φ⟩^{−1}a(−m)a(n)=2Σ_φ⟨φ,φ⟩^{−1}a(−1)a(m)a(n).

**Reason and effect.** By Proposition 3 with −m, Res(2s−1)F_{−m}(z,s)=Σ_φ⟨φ,φ⟩⁻¹2a(−m)φ(z); the proof on p.974 gives the same, Σ2a(m)conj(φ(z))/⟨φ,φ⟩. The n-th Fourier coefficient of F_{−m} is 2y^{1/2}Φ(−m,n;s)K_{s−1/2}(2π|n|y) (the expansion on p.974, which I checked numerically), and that of φ is 2y^{1/2}a(n)K_{ir}. The main term and the y^{1−s} term are holomorphic at s=1/2+ir. So the residue is 2Σa(−m)a(n)/⟨φ,φ⟩, and for odd φ, a(−m)=−a(m). This matches the parity factor in the opposite-sign Kuznetsov formula. The display is only 'for comparison' and is not used later. The result is unused later, but its displayed residue formula is a stated result and is scoped accordingly here. Effect: a stated result.

**Edition and correction status.** Recorded and independently checked in PAPER-DUKE-IMAMOGLU-TOTH-16/E26; retained here for the corrected spectral nodes. This is not a newly claimed discovery.

**Recorded bounded searches.**

- Reused the recorded bounded searches in research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json (their dates and edition limits remain those of that record).
- Re-read the relevant passage in the source version ledgered here; no fresh claim of global novelty or journal collation.

### AutomorphicSpectralTheory/E6 — gap

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, 18 July2022: Corollary4.2.6 p27.

**Disputed assertion.** The winding-number argument imposes holomorphy and nonvanishing near the unit circle while counting interior zeros and poles.

**Correction.** Also assume that each c_β extends meromorphically to a neighbourhood of the closed disc |z|≤1. Equivalently, read N(c_β)−P(c_β) as the winding number (2πi)^{-1}∮_{|z|=1}c'_β/c_β dz, which is what the proof computes. The rational L-ratios of §5.3.3 satisfy this.

**Reason and effect.** Annular holomorphy does not define the interior divisor. For example z exp(1/z) is nonzero on an annulus but has an essential singularity at zero. The later rational L-factor application is repaired by specifying its extension. Effect: a stated result.

**Edition and correction status.** Recorded and independently checked in PAPER-YU-23/E4; retained here for the corrected spectral nodes. This is not a newly claimed discovery.

**Recorded bounded searches.**

- Reused the recorded bounded searches in research/blueprint/papers/PAPER-YU-23.result.json (their dates and edition limits remain those of that record).
- Re-read the relevant passage in the source version ledgered here; no fresh claim of global novelty or journal collation.

### AutomorphicSpectralTheory/E7 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, 18 July2022: §5.2.2 p32 compared with §5.3.2 p39.

**Disputed assertion.** The compact-picture embedding in the first location uses the inverse half-modulus, whereas the subsequent transported section uses a different convention.

**Correction.** In the definition of A_{R,π} read ρ_R for ρ_P. Use one inducing character consistently: membership ρ_R^{-1}φ|_M ∈ π and spherical basis φ_R(nmk)=ρ_R(m)φ_π(m).

**Reason and effect.** For the same rho_R, the two Yu displays are algebraically inconsistent already for R=P. Fresh images show Laf97 p284 also has rho_P⁻¹ phi∈pi and p281 defines rho through its action on Haar measures. This invalidates the earlier inference that the p32 formula alone should be reversed. The mismatch remains a candidate source issue; the correct global convention requires a complete dictionary. Effect: the proof.

**Edition and correction status.** Recorded and independently checked in PAPER-YU-23/E8; retained here for the corrected spectral nodes. This is not a newly claimed discovery.

**Recorded bounded searches.**

- Reused the recorded bounded searches in research/blueprint/papers/PAPER-YU-23.result.json (their dates and edition limits remain those of that record).
- Re-read the relevant passage in the source version ledgered here; no fresh claim of global novelty or journal collation.

### AutomorphicSpectralTheory/E8 — error

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv1807.04659v5 §5.2.3, p.33, report and replacement Theorem5.2.2.

**Disputed assertion.** Yu reports failures in the earlier Lafforgue trace statement and gives a replacement theorem at this locator.

**Correction.** Use Yu's Théorème 5.2.2 (5.2.9), respectively Corollaire 5.2.3 (5.2.14). The factor is 1/(|w||X_L^L|), and the sum runs over the whole fibre μ_w^{-1}(λ_π)={(λ_L,λ_w): λ_L in Im X_L^G, λ_w in Im X_M^L, λ_Lλ_w/w^{-1}(λ_w)=λ_π}, with probability Haar measures.

**Reason and effect.** Yu explicitly reports an error and gives the corrected recovery. The evidence is Yu’s discussion rather than an independent reading of the original Lafforgue theorem; no independent glyph-level allegation is made against the original. The finite-cover convention in the node is all lifts with probability Haar and denominator |w||X_L^L|. Effect: the proof.

**Edition and correction status.** Recorded and independently checked in PAPER-YU-23/E9; retained here for the corrected spectral nodes. This is not a newly claimed discovery.

**Recorded bounded searches.**

- Reused the recorded bounded searches in research/blueprint/papers/PAPER-YU-23.result.json (their dates and edition limits remain those of that record).
- Re-read the relevant passage in the source version ledgered here; no fresh claim of global novelty or journal collation.

### AutomorphicSpectralTheory/E9 — gap

Source: [Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter II, §5, asymptotic expansion of Q_{s−1}(t) after (5.7), p. 251, Invent. Math. 84 (1986), published version (GDZ scan).

**Disputed assertion.** The expansion retains only a bounded error after subtracting the logarithmic singularity and digamma constant.

**Correction.** Strengthen the displayed bounded remainder to a remainder tending to zero before taking the next renormalized limit. The displayed O(1) is true but insufficient for that limit; this packet does not classify a true weak estimate as a false theorem.

**Reason and effect.** With a remainder that is merely bounded, the next display (the value g_s(z) = −log|2π(z − z̄)η(z)⁴|² + 2Γ′/Γ(s) − 2Γ′/Γ(1) of the renormalized limit) would not follow. The classical expansion is Q_ν(t) = ½ log((t+1)/(t−1)) − γ − ψ(ν+1) + O((t−1) log(t−1)), and −γ − ψ(s) = ψ(1) − ψ(s), so the remainder tends to 0. Re-checked on imgHR/p251.jpg and on a tight IIIF crop of image 00000257 at full resolution: the symbol is a capital O of cap height, as tall as the '1' and the parentheses (a lowercase o would have the x-height of the adjacent 't'). (The cruder expansion (2.7), p. 238, Q_{s−1}(t) = −½ log(t − 1) + O(1), correctly has O(1); the refined expansion on p. 251 needs o(1).) Effect: the proof.

**Edition and correction status.** Recorded and independently checked in PAPER-GROSS-ZAGIER-86/E11; retained here for the corrected spectral nodes. This is not a newly claimed discovery.

**Recorded bounded searches.**

- Reused the recorded bounded searches in research/blueprint/papers/PAPER-GROSS-ZAGIER-86.result.json (their dates and edition limits remain those of that record).
- Re-read the relevant passage in the source version ledgered here; no fresh claim of global novelty or journal collation.

### AutomorphicSpectralTheory/E10 — misprint

Source: [Heegner Points and Derivatives of L-Series](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf), Chapter IV, §6, proof of (6.2), last display, p. 298, Invent. Math. 84 (1986), published version (GDZ scan).

**Disputed assertion.** The differentiation formula uses a factor whose parameter shift does not match the powers in the function being differentiated.

**Correction.** 1/(cz+d)^2 · y^s/|cz+d|^{2s} = 2i/(s+1) · ∂/∂z ( y^{s+1}/|cz+d|^{2s+2} )

**Reason and effect.** With y = (z − z̄)/2i: ∂_z(y^{s+1}|cz+d|^{−2s−2}) = (s+1)y^s(cz̄+d)/(2i(cz+d)|cz+d|^{2s+2}) = (s+1)y^s/(2i(cz+d)^2|cz+d|^{2s}). Confirmed numerically (finite-difference Wirtinger derivative at c = 3, d = −2, s = 0.37+0.2i, z = 0.31+0.77i: RHS = −0.019198+0.067476i equals the (cz+d)^2 version, not the printed one, −0.13533−0.11655i). The weight-2 series E_{2,s} (p. 296) has (cz+d)^2, and the next line E_{2,s} = (2i/(s+1))∂_z E(z,s+1) holds only with the square. Read on the high-resolution page (no exponent, no overbar). Effect: nothing.

**Edition and correction status.** Recorded and independently checked in PAPER-GROSS-ZAGIER-86/E47; retained here for the corrected spectral nodes. This is not a newly claimed discovery.

**Recorded bounded searches.**

- Reused the recorded bounded searches in research/blueprint/papers/PAPER-GROSS-ZAGIER-86.result.json (their dates and edition limits remain those of that record).
- Re-read the relevant passage in the source version ledgered here; no fresh claim of global novelty or journal collation.

### AutomorphicSpectralTheory/E11 — misprint

Source: [An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §13, p.68, correction following Proposition13.1, concerning Arthur1980 Lemma1.1.

**Disputed assertion.** Arthur explains that the earlier lemma needs a non-strict inequality so its equality case is included.

**Correction.** Use the weak boundary inequality in the support statement of the older lemma; the packet keeps the correctly stated vanishing region of Proposition13.1.

**Reason and effect.** Arthur supplies the correction in the primary survey. Equality on a truncation wall is exactly the boundary case that strict-versus-weak notation changes. Effect: nothing.

**Edition and correction status.** Arthur2005 §13 immediately after Proposition13.1

**Recorded bounded searches.**

- The cited later primary source explicitly records this correction; no novelty claim.

### AutomorphicSpectralTheory/E12 — error

Source: [An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §21 Remark3, p.137, concerning [A8] §8 p.1329 (1982 spectral formula).

**Disputed assertion.** Arthur points out that the earlier bound does not cover nontempered representations for arbitrary compactly supported smooth test functions outside the Hecke algebra.

**Correction.** Restrict this fine spectral formula to f∈H(G); retain the height-grouped outer convergence and do not claim absolute convergence of a jointly rearranged expansion.

**Reason and effect.** Arthur explicitly says the last formula for J_χ does not hold for that complement. The coarse identity has different test-function hypotheses and remains separate. Effect: a stated result.

**Edition and correction status.** Arthur2005 §21 Remark3 and Theorem21.6

**Recorded bounded searches.**

- The cited later primary source explicitly records this correction; no novelty claim.

### AutomorphicSpectralTheory/E13 — error

Source: [Le théorème de Paley-Wiener invariant pour les groupes de Lie réductifs II](https://www.numdam.org/article/ASENS_1990_4_23_2_193_0.pdf), AppendixD, p.224, report about [7] Lemma4 (1984); this run read the 1990 repair.

**Disputed assertion.** The repair disputes the earlier lemma and its attribution to Vogan.

**Correction.** Use AppendixD PropositionD.1 and LemmaD.1, proved jointly with Bouaziz, for the two places that used the earlier lemma.

**Reason and effect.** The later primary source names both affected statements and supplies replacement proofs; the packet uses the 1990 theorem and does not claim to have read the 1984 lemma. Effect: the proof.

**Edition and correction status.** Clozel–Delorme1990 AppendixD (with A.Bouaziz)

**Recorded bounded searches.**

- The cited later primary source explicitly records this correction; no novelty claim.

### AutomorphicSpectralTheory/E14 — misprint

Source: [An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §21 Theorem21.6 coefficient(21.17), p.137 in the Clay PDF; compared with (21.5), p.130, and Corollary21.3 coefficient, p.134.

**Disputed assertion.** The coefficient multiplies the Weyl-group ratio by the reciprocal determinant on the relative height space.

**Correction.** In this sum over L⊃M and s∈W^L(M)_reg use a_M^L in the determinant. Keep a_M^G only in the L=G discrete-part specialization.

**Reason and effect.** The change of variables F_s on i(a_M^L)* in the same source gives this Jacobian explicitly in (21.5), and Corollary21.3 prints a_M^L. Arthur1988global p.520, proof of Theorem4.4, gives a_(L₀)^(M₁), with L₀=M and M₁=L. For L=M proper in G and s=1, a_M^L=0 and its determinant is1; s−1 on a_M^G is zero on a positive-dimensional space and cannot supply the advertised nonzero reciprocal. Effect: a stated result.

**Edition and correction status.** new: no separately labelled correction found in this bounded search; the correct coefficient is already printed earlier in the same paper and in Arthur1988global. No claim of exhaustive novelty.

**Recorded bounded searches.**

- Read Clay2005 PDF equations(21.5),(21.17), Corollary21.3 and the discrete specialization; read Arthur1988global published scan p.520 (proof of Theorem4.4).
- 2026-10-07 public searches for Arthur Introduction to the Trace Formula 21.17 erratum determinant and Arthur introduction trace formula corrections det 21.6; inspected the author PDF result showing the earlier a_M^L derivation. No separate erratum was located.

### AutomorphicSpectralTheory/E15 — error

Source: [Measurable Categories](https://arxiv.org/pdf/math/0309185), arXiv:math/0309185v2, Theorem28, p.14, displayed Radon–Nikodym map and proof.

**Disputed assertion.** The Radon–Nikodym comparison is drawn from the second measure’s direct integral toward the first, but its multiplier has the opposite measure ratio.

**Correction.** Reverse the displayed source and target: this multiplier is the isometric embedding from L²(μ,H) into L²(ν,H). It is an isomorphism for equivalent measures, with the inverse defined using the reciprocal density on its essential support.

**Reason and effect.** The proof integrates |f|²(dμ/dν) against ν and obtains the μ norm. With μ counting measure on positive integers and ν({n})=2^(−n), the constant-one section lies in L²(ν), while its printed image 2^(n/2) is not in L²(μ). Effect: a stated result.

**Edition and correction status.** Finding in the explicitly ledgered v2; no published-version collation was possible.

**Recorded bounded searches.**

- Bounded searches on 2026-10-07 for Yetter Measurable Categories Theorem28 erratum/corrigendum and the Springer DOI10.1007/s10485-005-9003-6; no separate correction located in the returned results.
- The Springer published-PDF endpoint returned HTML; only arXiv v2 was read. This is not an exhaustive novelty search.

### AutomorphicSpectralTheory/E16 — error

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, 18 July2022: §5.1.1 p29, choice of kappa.

**Disputed assertion.** The claimed choice of a projection-nonzero vector is used as though it automatically avoided every relative-root hyperplane.

**Correction.** Choose kappa off the finite union of all relative-root hyperplanes for every semistandard Levi.

**Reason and effect.** Image checked. kappa=(3,2,1) is in the positive chamber and every Levi projection is nonzero, but the blocks {1,3}|{2} have equal averages 2, so their relative root evaluates to zero. Effect: the proof.

**Edition and correction status.** Recorded in PAPER-YU-23/E6; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- Publisher article record https://annals.math.princeton.edu/2023/197-2/p01 checked for correction links on2026-09-22; no correction found there.
- Author https://www.hongjieyu.com/ checked; no erratum found on the inspected publication page.
- arXiv1807.04659 submission history v1–v5 checked; v5 fully read, no full inter-version collation. Earlier versions may contain or correct an issue; not excluded.
- Exact-title/DOI searches with erratum, corrigendum and correction; no separate erratum located. Final journal PDF not obtained; this is a bounded search, not a global novelty guarantee.
- Rechecked by cc-442dc5 on 23 September 2026: arXiv v5 re-fetched (SHA-256 9383bcde…, matching). The journal version is not openly available: the Annals site returned HTML, and Unpaywall lists only the author's thesis.
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E17 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, 18 July2022: Proposition5.2.1 p32, type of H_Q^e.

**Disputed assertion.** The cutoff exponent is assigned to a relative height space with the wrong Levi index.

**Correction.** H_Q^e belongs to a_(L,Z) in the affine degree −e hyperplane, not the degree-zero vector space.

**Reason and effect.** The floor differences telescope to −e. With one block and e=1, H=−1 while a_G^G=0. Image checked; 119 exact small floor checks corroborate the sign. Effect: a stated result.

**Edition and correction status.** Recorded in PAPER-YU-23/E7; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- Publisher article record https://annals.math.princeton.edu/2023/197-2/p01 checked for correction links on2026-09-22; no correction found there.
- Author https://www.hongjieyu.com/ checked; no erratum found on the inspected publication page.
- arXiv1807.04659 submission history v1–v5 checked; v5 fully read, no full inter-version collation. Earlier versions may contain or correct an issue; not excluded.
- Exact-title/DOI searches with erratum, corrigendum and correction; no separate erratum located. Final journal PDF not obtained; this is a bounded search, not a global novelty guarantee.
- Rechecked by cc-442dc5 on 23 September 2026: arXiv v5 re-fetched (SHA-256 9383bcde…, matching). The journal version is not openly available: the Annals site returned HTML, and Unpaywall lists only the author's thesis.
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E18 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, 18 July2022: Lemma5.3.3 p36.

**Disputed assertion.** The nonvanishing lemma seeks a nonzero value on the degree-zero subgroup for every nonzero inducing vector.

**Correction.** Add phi≠0.

**Reason and effect.** The zero vector is an immediate counterexample; the proof explicitly uses nonzero phi and a nonzero Whittaker scalar. (cc-442dc5) Reclassified to affect nothing: Lemma 5.3.3 as printed fails only for ϕ = 0, and its proof (through a nonzero Whittaker coefficient) concerns a nonzero ϕ. Effect: nothing.

**Edition and correction status.** Recorded in PAPER-YU-23/E10; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- Publisher article record https://annals.math.princeton.edu/2023/197-2/p01 checked for correction links on2026-09-22; no correction found there.
- Author https://www.hongjieyu.com/ checked; no erratum found on the inspected publication page.
- arXiv1807.04659 submission history v1–v5 checked; v5 fully read, no full inter-version collation. Earlier versions may contain or correct an issue; not excluded.
- Exact-title/DOI searches with erratum, corrigendum and correction; no separate erratum located. Final journal PDF not obtained; this is a bounded search, not a global novelty guarantee.
- Rechecked by cc-442dc5 on 23 September 2026: arXiv v5 re-fetched (SHA-256 9383bcde…, matching). The journal version is not openly available: the Annals site returned HTML, and Unpaywall lists only the author's thesis.
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E19 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, 18 July2022: Lemma5.3.3 proof p38.

**Disputed assertion.** The central translation is combined with an asserted degree of the translating element, without the compensating degree normalization needed for the subgroup in the conclusion.

**Correction.** With J_v=(-(n−1)n_v,...,0) and deg=−Σv, deg x0=+n(n−1)(g−1); multiply by a^−((n−1)(g−1)) to reach degree zero.

**Reason and effect.** Sum the diagonal valuations and use deg K=2g−2. Both displayed signs were checked in the image and against §2.2.1. Effect: the proof.

**Edition and correction status.** Recorded in PAPER-YU-23/E11; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- Publisher article record https://annals.math.princeton.edu/2023/197-2/p01 checked for correction links on2026-09-22; no correction found there.
- Author https://www.hongjieyu.com/ checked; no erratum found on the inspected publication page.
- arXiv1807.04659 submission history v1–v5 checked; v5 fully read, no full inter-version collation. Earlier versions may contain or correct an issue; not excluded.
- Exact-title/DOI searches with erratum, corrigendum and correction; no separate erratum located. Final journal PDF not obtained; this is a bounded search, not a global novelty guarantee.
- Rechecked by cc-442dc5 on 23 September 2026: arXiv v5 re-fetched (SHA-256 9383bcde…, matching). The journal version is not openly available: the Annals site returned HTML, and Unpaywall lists only the author's thesis.
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E20 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, 18 July2022: Proposition5.3.4 proof, final paragraph p39.

**Disputed assertion.** The spherical change of section is written with a positive genus-dependent power of the field cardinality.

**Correction.** Use q^((1−g)ni nj), as in equation5.1.1.

**Reason and effect.** With product local volume(O_v)=1, the additive adelic quotient has volume q^(g−1); imposing global unipotent quotient volume one multiplies the measure by q^(1−g) in each root direction. The definition and calculation must use the same normalization. Effect: nothing.

**Edition and correction status.** Recorded in PAPER-YU-23/E12; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- Publisher article record https://annals.math.princeton.edu/2023/197-2/p01 checked for correction links on2026-09-22; no correction found there.
- Author https://www.hongjieyu.com/ checked; no erratum found on the inspected publication page.
- arXiv1807.04659 submission history v1–v5 checked; v5 fully read, no full inter-version collation. Earlier versions may contain or correct an issue; not excluded.
- Exact-title/DOI searches with erratum, corrigendum and correction; no separate erratum located. Final journal PDF not obtained; this is a bounded search, not a global novelty guarantee.
- Rechecked by cc-442dc5 on 23 September 2026: arXiv v5 re-fetched (SHA-256 9383bcde…, matching). The journal version is not openly available: the Annals site returned HTML, and Unpaywall lists only the author's thesis.
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E21 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, 18 July2022: §5.3.3 p41, central shift and equation5.3.6.

**Disputed assertion.** The formula changes its central quotient from the Levi-character parameter to the whole-group parameter.

**Correction.** Use lambda_(L1)^−e and lambda_(G1)^−e, matching Proposition5.1.1.

**Reason and effect.** The floor exponent has total −e and each root denominator is invariant under a central shift. Hence hat1_Q^e(mu lambda)=lambda_1^−e hat1_Q^e(mu). Image checked. The final degree-order argument is insensitive to e↦−e but intermediate identities are not. Effect: the proof.

**Edition and correction status.** Recorded in PAPER-YU-23/E13; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- Publisher article record https://annals.math.princeton.edu/2023/197-2/p01 checked for correction links on2026-09-22; no correction found there.
- Author https://www.hongjieyu.com/ checked; no erratum found on the inspected publication page.
- arXiv1807.04659 submission history v1–v5 checked; v5 fully read, no full inter-version collation. Earlier versions may contain or correct an issue; not excluded.
- Exact-title/DOI searches with erratum, corrigendum and correction; no separate erratum located. Final journal PDF not obtained; this is a bounded search, not a global novelty guarantee.
- Rechecked by cc-442dc5 on 23 September 2026: arXiv v5 re-fetched (SHA-256 9383bcde…, matching). The journal version is not openly available: the Annals site returned HTML, and Unpaywall lists only the author's thesis.
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E22 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, 18 July2022: LemmaA.2 proof p76.

**Disputed assertion.** The auxiliary family is formed by dividing a translated cutoff transform by a root denominator, although the cancellation required for a holomorphic family is not established.

**Correction.** Multiply by theta_Q(lambda), rather than its inverse.

**Reason and effect.** The family product formula writes the desired sum as Σ d_Q c_Q/theta_Q. The printed choice introduces a double pole even at mu0=1; the corrected choice is the holomorphic monomial family from LemmaA.1. Effect: the proof.

**Edition and correction status.** Recorded in PAPER-YU-23/E24; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- Publisher article record https://annals.math.princeton.edu/2023/197-2/p01 checked for correction links on2026-09-22; no correction found there.
- Author https://www.hongjieyu.com/ checked; no erratum found on the inspected publication page.
- arXiv1807.04659 submission history v1–v5 checked; v5 fully read, no full inter-version collation. Earlier versions may contain or correct an issue; not excluded.
- Exact-title/DOI searches with erratum, corrigendum and correction; no separate erratum located. Final journal PDF not obtained; this is a bounded search, not a global novelty guarantee.
- Rechecked by cc-442dc5 on 23 September 2026: arXiv v5 re-fetched (SHA-256 9383bcde…, matching). The journal version is not openly available: the Annals site returned HTML, and Unpaywall lists only the author's thesis.
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E23 — error

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5, 18 July2022: TheoremA.4 proof p78, order of a sum.

**Disputed assertion.** The proof identifies the order of a sum with the least common multiple of the two individual orders.

**Correction.** Only test whether e+a=0. Since 2a=0 in Z/cZ, a is zero or the unique element of order two; equality e=−a is determined by ord(e).

**Reason and effect.** Take c=2,e=a=1: ord(e+a)=1 but lcm(2,2)=2. These parameters occur for one cycle l=2,f=1. Image checked. The replacement proves the needed invariance; 80,100 exact degree tests pass. Effect: the proof.

**Edition and correction status.** Recorded in PAPER-YU-23/E26; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- Publisher article record https://annals.math.princeton.edu/2023/197-2/p01 checked for correction links on2026-09-22; no correction found there.
- Author https://www.hongjieyu.com/ checked; no erratum found on the inspected publication page.
- arXiv1807.04659 submission history v1–v5 checked; v5 fully read, no full inter-version collation. Earlier versions may contain or correct an issue; not excluded.
- Exact-title/DOI searches with erratum, corrigendum and correction; no separate erratum located. Final journal PDF not obtained; this is a bounded search, not a global novelty guarantee.
- Rechecked by cc-442dc5 on 23 September 2026: arXiv v5 re-fetched (SHA-256 9383bcde…, matching). The journal version is not openly available: the Annals site returned HTML, and Unpaywall lists only the author's thesis.
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E24 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), Appendix B, p. 79.

**Disputed assertion.** The argument uses the constant-field identification of global functions and then requires the characteristic polynomial’s constant coefficient to be nonzero.

**Correction.** Comme H^0(X_1, O_{X_1}) ≅ F_q, …

**Reason and effect.** Page image p. 79 checked. X is the base change of X_1 to the algebraic closure F, so H^0(X, O_X) = F, not F_q. For an endomorphism γ of a bundle on X_1, det γ ∈ H^0(X_1, O_{X_1}) = F_q (geometric connectedness), and that is what the argument needs. Effect: nothing.

**Edition and correction status.** Recorded in PAPER-YU-23/E29; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- arXiv 1807.04659: v5 (18 July 2022) is the latest version
- Crossref for doi:10.4007/annals.2023.197.2.1 (Ann. of Math. 197 (2023), 423–531), 23 September 2026: no update-to or relation entries, and no work declaring an update of it
- the Annals article page (annals.math.princeton.edu/2023/197-2/p01), 23 September 2026: no erratum linked
- the published version is behind the journal's paywall and could not be read, so whether print differs from arXiv v5 here is not established
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E25 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), Appendix B, p. 78.

**Disputed assertion.** The group statement is accompanied by a Lie-algebra variant whose notation still contains the group symbol.

**Correction.** ( resp. X ∈ 𝔤(F))

**Reason and effect.** Page image p. 78 checked; the membership sign is missing. Typographical only. Effect: nothing.

**Edition and correction status.** Recorded in PAPER-YU-23/E30; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- arXiv 1807.04659: v5 (18 July 2022) is the latest version
- Crossref for doi:10.4007/annals.2023.197.2.1 (Ann. of Math. 197 (2023), 423–531), 23 September 2026: no update-to or relation entries, and no work declaring an update of it
- the Annals article page (annals.math.princeton.edu/2023/197-2/p01), 23 September 2026: no erratum linked
- the published version is behind the journal's paywall and could not be read, so whether print differs from arXiv v5 here is not established
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E26 — error

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §3.3.1, p. 18, Théorème 3.3.1, and its use on p. 20.

**Disputed assertion.** The trace is asserted to be quasipolynomial in a real height parameter while invoking a lattice-based definition.

**Correction.** The restriction of T ↦ J^T_e to lattice points T ∈ Hom(X^*(B), Z) ≅ Z^n is a quasi-polynomial in the sense of [Ch15, Déf. 4.5.3]. The same applies on p. 20 to the right-hand side via [Ch15, Prop. 4.5.5]: the equality holds for all lattice T with T_1 ≥ ⋯ ≥ T_n. T = 0 is a lattice point, so J_e = P_n^e(X_1) follows unchanged.

**Reason and effect.** In Yu 𝔞_B = Hom(X^*(B), R) is real (§3.1.1). Ch15 Déf 4.5.3 (author p. 25, image read) defines quasi-polynomials on 𝔞_B as Σ_{ν∈f} p_ν(T) q^{⟨ν,T⟩} with p_ν polynomials and ν ∈ (2πi/log q)X^*(B) ⊗ Q, so they are real-analytic in T. J^T_e depends on T only through the indicators τ̂_P(H_B(δx) − T) with H_B(δx) in a lattice, so it is locally constant off the hyperplanes ϖ(T) ∈ (1/n)Z. It is not constant: by (3.3.7), for d(T) ≥ max(0, 2g−2) it counts T-semistable bundles of degree e, and this number is unbounded as d(T) → ∞ (already for n = 2 via L_1 ⊕ L_2). A non-constant locally constant function on the open chamber cannot be real-analytic, so the statement is false for real T. The inconsistency is inherited from Ch15, whose Example 4.5.4 counts floor functions as quasi-polynomial and whose Prop. 4.5.5 is stated on a lattice. The proof of Théorème 3.2.4 compares the two sides only at deep lattice points and evaluates at T = 0, so no result is affected. Effect: nothing.

**Edition and correction status.** Recorded in PAPER-YU-23/E32; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- arXiv 1807.04659: v5 (18 July 2022) is the latest version
- Crossref for doi:10.4007/annals.2023.197.2.1 (Ann. of Math. 197 (2023), 423–531), 23 September 2026: no update-to or relation entries, and no work declaring an update of it
- the Annals article page (annals.math.princeton.edu/2023/197-2/p01), 23 September 2026: no erratum linked
- the published version is behind the journal's paywall and could not be read, so whether print differs from arXiv v5 here is not established
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E27 — error

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §5.3.2, p. 39, equation (5.3.2) and Proposition 5.3.4 (first display).

**Disputed assertion.** The normalization product uses a nested root restriction and equates the resulting scalar with the spherical section transport.

**Correction.** n_{Q|P}(π,λ)=∏_{α∈Φ_Q∩Φ_{P̄}}∏_{β|α} n_{−β}(π,λ^{β^∨}), equivalently ∏ over γ in Φ_P∩Φ_{Q̄} (roots of M_P) of n_γ(π,λ^{−γ^∨}). The factor for the integrated root space of e_j−e_i is built from L(Π_i×Π_j^∨), not L(Π_j×Π_i^∨).

**Reason and effect.** Page image checked. A direct GL_2 computation (a good pair: π=χ_1⊗χ_2 with χ_1,χ_2 not inertially equivalent) gives the following. For S=B, R=B̄, φ_B(nmk)=ρ_B(m)χ_1(t_1)χ_2(t_2), the Iwasawa decomposition n̄(x)=n·diag(x^{-1},x)·k for |x|_v>1 makes the local integral ∫φ_B(n̄(x))λ^{H_B(n̄(x))}dx equal to (1−(χ_1χ_2^{-1})(ϖ_v)q_v^{-1}z^{deg v})/(1−(χ_1χ_2^{-1})(ϖ_v)z^{deg v}) with z=λ_2/λ_1. That is L_v(Π_1×Π_2^∨,z)/L_v(Π_1×Π_2^∨,q^{-1}z), the factor of n_{e1−e2}(π,λ^{−(e1−e2)^∨}), and it is the standard L(2s,χ_1χ_2^{-1})/L(2s+1,χ_1χ_2^{-1}). (5.3.2) instead gives n_{e2−e1}(π,λ^{(e2−e1)^∨}), built from L(Π_2×Π_1^∨). The 'en particulier' display and (5.1.2) use the correct labelling; they agree with (5.3.2) only because, for good pairs, (w,1)∈stab inverts only roots between equal factors. Proposition 5.1.1 is unaffected: the n_{S|P} ratio is 1 at central λ_L, and in (c) L(Π_j×Π_i^∨,z)=conj(L(Π_i×Π_j^∨,z̄)) (Π^∨≅Π̄ for unitary discrete Π) has the same zeros and poles in |z|<1. Effect: a stated result.

**Edition and correction status.** Recorded in PAPER-YU-23/E34; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- arXiv 1807.04659: v5 (18 July 2022) is the latest version
- Crossref for doi:10.4007/annals.2023.197.2.1 (Ann. of Math. 197 (2023), 423–531), 23 September 2026: no update-to or relation entries, and no work declaring an update of it
- the Annals article page (annals.math.princeton.edu/2023/197-2/p01), 23 September 2026: no erratum linked
- the published version is behind the journal's paywall and could not be read, so whether print differs from arXiv v5 here is not established
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E28 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §4.2.2, p. 24, proof of Proposition 4.2.3.

**Disputed assertion.** The volume of a lattice generated by projected dual roots is treated as depending only on the pair of Levi subgroups.

**Correction.** v_{M_P}^{M_Q}:=vol(a_P^Q/Z(Δ_P^Q)^∨), the covolume of the coroot lattice, which is the volume in Arthur's θ_P=vol(a_P^G/Z(Δ_P^∨))^{-1}∏λ(α^∨).

**Reason and effect.** Page image checked (the hat is printed). Arthur's normalization of θ_P, which the comparison with [Ar81, Cor. 6.5] needs, uses the coroot lattice. The proof's next sentence ('Δ_Q^∨ est la projection de Δ_P^∨−(Δ_P^Q)^∨ en a_Q^G') is an argument about coroots. The identity v_M^Lv_L^G=v_M^G holds for coroots, since ZΔ_P^∨∩a_M^L=Z(Δ_P^L)^∨ and the projection to a_L^G is ZΔ_Q^∨. It also holds for coweights by the dual argument, so the conclusion (cd)_M=Σc_M^Ld_L is unaffected. Effect: nothing.

**Edition and correction status.** Recorded in PAPER-YU-23/E35; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- arXiv 1807.04659: v5 (18 July 2022) is the latest version
- Crossref for doi:10.4007/annals.2023.197.2.1 (Ann. of Math. 197 (2023), 423–531), 23 September 2026: no update-to or relation entries, and no work declaring an update of it
- the Annals article page (annals.math.princeton.edu/2023/197-2/p01), 23 September 2026: no erratum linked
- the published version is behind the journal's paywall and could not be read, so whether print differs from arXiv v5 here is not established
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E29 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §4.2.3, p. 25, proof of Théorème 4.2.4.

**Disputed assertion.** The proof chooses an affine path in multiplicative character coordinates without establishing that the path remains in the constrained parameter subtorus.

**Correction.** ξ is a generic vector of C^{dim a_M}≅a_{M,C}^* (a tangent direction; later ξ=zβ_1+ξ_1). The expansion of c_M(1+ξt) is taken on X_M, where c_Q(λ)=∏c_β(λ^{β^∨}) and θ_Q are defined and still form a (G,M)-family; its regular value at 1 is the value on X_M^G.

**Reason and effect.** Checked in the TeX (line 1647). For ξ≠0 the curve 1+ξt is not in X_M^G. For M=T⊂GL_2, (1+ξ_1t)(1+ξ_2t)=1 for all t forces ξ=0, and points of X_P^G are multiplicative, not directions. The argument only uses θ_Q(1+ξt)=t^mθ_Q(ξ) for the linear pairing and the regularity of Σc_Qθ_Q^{-1} at 1 on X_M, so nothing else changes. Effect: nothing.

**Edition and correction status.** Recorded in PAPER-YU-23/E36; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- arXiv 1807.04659: v5 (18 July 2022) is the latest version
- Crossref for doi:10.4007/annals.2023.197.2.1 (Ann. of Math. 197 (2023), 423–531), 23 September 2026: no update-to or relation entries, and no work declaring an update of it
- the Annals article page (annals.math.princeton.edu/2023/197-2/p01), 23 September 2026: no erratum linked
- the published version is behind the journal's paywall and could not be read, so whether print differs from arXiv v5 here is not established
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E30 — gap

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §4.2.3, p. 26, Lemme 4.2.5; §5.2.3, pp. 34–35, the decomposition before (5.2.11) and (5.2.12).

**Disputed assertion.** The change of variables factors a character-torus integral into circle contour integrals without specifying the parameter torus’s Haar normalization.

**Correction.** State that every compact group Im X_M^L (disconnected and finite ones included) carries its Haar probability measure, and products carry the product of these.

**Reason and effect.** Checked in the TeX. Taking f_β(z)=z^{-1} in Lemme 4.2.5 gives vol(Im X_M^G)=1. The identity (5.2.12), with the factor 1/|ker μ_w|, and ∫_{Im X_M^G}f=∫_{Im X_L^G}∫_{Im X_M^L}f(λλ') hold exactly when source and target measures are probability measures (measure preservation plus Fourier inversion on the target). The intended convention is clear, so affects=nothing; the extraction's items 063 and 142 already adopt it. Effect: the proof.

**Edition and correction status.** Recorded in PAPER-YU-23/E37; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- arXiv 1807.04659: v5 (18 July 2022) is the latest version
- Crossref for doi:10.4007/annals.2023.197.2.1 (Ann. of Math. 197 (2023), 423–531), 23 September 2026: no update-to or relation entries, and no work declaring an update of it
- the Annals article page (annals.math.princeton.edu/2023/197-2/p01), 23 September 2026: no erratum linked
- the published version is behind the journal's paywall and could not be read, so whether print differs from arXiv v5 here is not established
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E31 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §4.2.3, p. 29, proof of Lemme 4.2.8.

**Disputed assertion.** The argument first claims vanishing for every Levi index and then invokes a vanishing condition with a parabolic index and an exception for the full group.

**Correction.** 'on a d_L=0 (pour ce L)' and 'si L∈L(M) mais L≠G'.

**Reason and effect.** Checked in the TeX. The first case proves the vanishing only for the Levi L under consideration; it fails for L=G when μ0 is central, where d_G=μ_{01}^{−dim a_M^G}. The product formula (Proposition 4.2.3) sums over L∈L(M), not P(M). Effect: nothing.

**Edition and correction status.** Recorded in PAPER-YU-23/E38; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- arXiv 1807.04659: v5 (18 July 2022) is the latest version
- Crossref for doi:10.4007/annals.2023.197.2.1 (Ann. of Math. 197 (2023), 423–531), 23 September 2026: no update-to or relation entries, and no work declaring an update of it
- the Annals article page (annals.math.princeton.edu/2023/197-2/p01), 23 September 2026: no erratum linked
- the published version is behind the journal's paywall and could not be read, so whether print differs from arXiv v5 here is not established
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E32 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §5.3.1, p. 38, proof of Lemme 5.3.3.

**Disputed assertion.** The local inducing representation is taken unramified while the scaled additive character is required to have conductor zero.

**Correction.** '… et ϖ_v^{−n_v}ψ_v (le caractère a↦ψ_v(ϖ_v^{−n_v}a)) est de conducteur 0'.

**Reason and effect.** Page image checked. J_v is a vector of exponents. The conductor-0 character defined on p. 37 and used in the next line (W'∈W(π_v,ϖ_v^{−n_v}ψ_v)) is ϖ_v^{−n_v}ψ_v. Conjugation by ϖ_v^{J_v} changes ψ_v on each simple-root coordinate by ϖ_v^{j_i−j_{i+1}}=ϖ_v^{−n_v}. Effect: nothing.

**Edition and correction status.** Recorded in PAPER-YU-23/E39; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- arXiv 1807.04659: v5 (18 July 2022) is the latest version
- Crossref for doi:10.4007/annals.2023.197.2.1 (Ann. of Math. 197 (2023), 423–531), 23 September 2026: no update-to or relation entries, and no work declaring an update of it
- the Annals article page (annals.math.princeton.edu/2023/197-2/p01), 23 September 2026: no erratum linked
- the published version is behind the journal's paywall and could not be read, so whether print differs from arXiv v5 here is not established
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E33 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §6.2.2, p. 47, sentence before (6.2.9) and the summation range of (6.2.9).

**Disputed assertion.** The stabilizer count is restricted to the connected character torus, but the subsequent summation permits translates selected by a whole-group character.

**Correction.** Fix(π) ∩ (Im X^G_{M_P})°, with π = Π0^{⊗l}, has cardinality |Fix(π0)|^{l−1}, and the sum in (6.2.9) runs over λ_π ∈ Fix(π).

**Reason and effect.** In the single-cycle case M_P = G_d^l and Fix(π) = Fix(Π0)^l ≅ μ_f^l. The identity component is cut out by one product condition, so the intersection has f^{l−1} elements. r is undefined in this case, and (6.2.9) itself uses |Fix(π0)|^{l−1}. Image checked. Effect: nothing.

**Edition and correction status.** Recorded in PAPER-YU-23/E41; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- arXiv 1807.04659: v5 (18 July 2022) is the latest version
- Crossref for doi:10.4007/annals.2023.197.2.1 (Ann. of Math. 197 (2023), 423–531), 23 September 2026: no update-to or relation entries, and no work declaring an update of it
- the Annals article page (annals.math.princeton.edu/2023/197-2/p01), 23 September 2026: no erratum linked
- the published version is behind the journal's paywall and could not be read, so whether print differs from arXiv v5 here is not established
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E34 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), §6.2.2, p. 45, proof of Lemme 6.2.2.

**Disputed assertion.** The displayed connected torus gives an ambient complex torus dimension equal to the number of blocks despite indexing coordinates by every entry of those blocks.

**Correction.** (C^×)^{l_1+⋯+l_r}

**Reason and effect.** The tuple has one coordinate per factor of M_P, l_1+⋯+l_r in all. Image checked. Effect: nothing.

**Edition and correction status.** Recorded in PAPER-YU-23/E42; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- arXiv 1807.04659: v5 (18 July 2022) is the latest version
- Crossref for doi:10.4007/annals.2023.197.2.1 (Ann. of Math. 197 (2023), 423–531), 23 September 2026: no update-to or relation entries, and no work declaring an update of it
- the Annals article page (annals.math.princeton.edu/2023/197-2/p01), 23 September 2026: no erratum linked
- the published version is behind the journal's paywall and could not be read, so whether print differs from arXiv v5 here is not established
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E35 — error

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), Appendix A, p. 75, Lemme A.2 (proof p. 76). It is applied 'pour tout e ∈ Z' in §5.3.3, p. 41, to obtain (5.3.6), and the proof of Théorème A.4 (p. 77) rests on (5.3.6)..

**Disputed assertion.** The lemma concludes that the translated cutoff-family limit vanishes at every noncentral parameter under its family and translation hypotheses. Its subsequent use permits all integer degrees, although the coprime-degree restriction needed by the counterexample check is absent.

**Correction.** Add the hypothesis gcd(e,n) = 1. The proof then goes through with d_Q = 1̂^e_Q(λμ_0)θ_Q(λ) (E24) and the vanishing Σ_(Q∈P(L)) 1̂^e_Q ≡ 0 on proper Levis L for gcd(e,n) = 1 (proposed new item). Consequently (5.3.6) is established only for (e,n) = 1, and Théorème A.4 and Corollaire A.5 are proved only in the form 'J_e and P_n^e are the same for all e prime to n'. For gcd(e,n) > 1 the same-order statement (Théorème 1.4) rests on Mellit [Me17]. The main results (Théorèmes 1.1–1.3) use only coprime e and are unaffected.

**Reason and effect.** Counterexample: n = 2, M = T, c_Q ≡ 1 (a constant (G,M)-family, invariant under every μ_0, with c_M^L independent of Q), e = 0 and μ_0 = (i,−i) ∈ X_M^G, which is not central. By Prop. 5.2.1, 1̂^0_B(λ) + 1̂^0_(B̄)(λ) = 1/(1−λ_1/λ_2) + 1/(1−λ_2/λ_1) ≡ 1, so the limit is 1 ≠ 0. The failure also occurs where Théorème A.4 has nontrivial content: for n = 10, M = GL_5×GL_5 and e ∈ {2,4,6,8}, Σ_Q 1̂^e_Q(μ_0) = 1 at a generic noncentral μ_0. In general, for μ_0 ∈ X_L^G the term d_L of Yu's argument is proportional to Σ_(Q∈P(L)) 1̂^e_Q(μ_0), which is nonzero whenever (n/gcd(m_j)) | e; the 'même argument' of Lemme 4.2.8 works only when the monomials λ^{I^e_Q} do not depend on Q, as for e = −1. Numerical checks (mpmath, 60–150 digits): with random μ_0-periodic root-product families and μ_0 on walls of proper Levis, the limit is O(x) → 0 for every coprime e and converges to stable nonzero values for non-coprime e, for example −12.04 and 11.86 in GL_4 with e = 0 and e = 2. The statement is confirmed on the page image (p. 75); the image of the application is from p. 41. Effect: a stated result.

**Edition and correction status.** Recorded in PAPER-YU-23/E48; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- arXiv 1807.04659: v5 (18 July 2022) is the latest version
- Crossref for doi:10.4007/annals.2023.197.2.1 (Ann. of Math. 197 (2023), 423–531), 23 September 2026: no update-to or relation entries, and no work declaring an update of it
- the Annals article page (annals.math.princeton.edu/2023/197-2/p01), 23 September 2026: no erratum linked
- the published version is behind the journal's paywall and could not be read, so whether print differs from arXiv v5 here is not established
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E36 — misprint

Source: [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5), Yu arXiv:1807.04659v5 (18 July 2022), Appendix A, p. 75, display (A.0.2).

**Disputed assertion.** The cutoff-transform sign is indexed by a Levi symbol that has not been defined at that point.

**Correction.** (−1)^{dim a_M^G}: Q_s ∈ P(M), and L is not defined at this point.

**Reason and effect.** Confirmed on the image. By Prop. 5.2.1, Π_(α∈Δ_Q) 1/(1−λ_u/λ_v) = Π(−λ_v)/⟨λ,α^∨⟩, which gives the sign (−1)^{|Δ_Q|} = (−1)^{dim a_M^G} and the shift s^{−1}(0,1,…,1). Effect: nothing.

**Edition and correction status.** Recorded in PAPER-YU-23/E55; independently re-read here in Yu v5. This is not a new discovery or a claim about the journal edition.

Only arXiv:1807.04659v5 (18 July 2022) is collated here; no assertion that the unavailable journal text has the same defect.

**Recorded bounded searches.**

- arXiv 1807.04659: v5 (18 July 2022) is the latest version
- Crossref for doi:10.4007/annals.2023.197.2.1 (Ann. of Math. 197 (2023), 423–531), 23 September 2026: no update-to or relation entries, and no work declaring an update of it
- the Annals article page (annals.math.princeton.edu/2023/197-2/p01), 23 September 2026: no erratum linked
- the published version is behind the journal's paywall and could not be read, so whether print differs from arXiv v5 here is not established
- 2026-10-07: primary locator re-read for REV-AutomorphicSpectralTheory; the prior bounded searches retain their original dates and limits. No global novelty or inter-version collation claim.

### AutomorphicSpectralTheory/E37 — misprint

Source: [An Introduction to the Trace Formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf), §7 equation (7.2), printed/PDF p.34, outer exponential factor; compared with the local J_Q|P formula on p.135.

**Disputed assertion.** The outer exponential subtracts the transported spectral parameter but adds the target half-modulus, so the identity-Weyl specialization leaves an unwanted height factor.

**Correction.** exp(−(sλ+ρ_P′)(H_P′(x)))

**Reason and effect.** The page image has a plus before ρ_P′. Put s=1 and P′=P: the quotient is a point, so the printed two exponentials leave exp(2ρ_P H_P(x)) rather than the identity operator. Replacing +ρ_P′ by −ρ_P′ cancels the height factors. The same survey prints the corresponding local factor exp(−(λ+ρ_Q)H_Q(x)) on p.135. The packet already had the corrected mathematical exponent; this entry makes its departure from the cited display explicit. Effect: a stated result.

**Edition and correction status.** No separate published correction located in the bounded search; the correct local convention appears in the same source. No claim of global novelty.

**Recorded bounded searches.**

- 2026-10-07: inspected rendered Arthur05 p.34 and p.65, read p.135 and the normalized induced-action convention.
- 2026-10-07: public searches for Arthur Introduction to the Trace Formula 7.2 correction and errata rho intertwining returned the author/Clay archives but no separately labelled correction.

## Source editions and reading ledger

The dates record access to the listed sections in this packet’s source ledger. They do not assert a new reading of every primary proof. Missing primary proofs and consumer-only evidence have explicit gaps above. Source files are not part of the repository.

### yetter — Measurable Categories

David N. Yetter. arXiv:math/0309185v2, 6 September 2004. [Public source](https://arxiv.org/pdf/math/0309185). Recorded access: 2026-10-07.

**Read scope.**

- §2 Definitions 1–2 and Example 4; §4 direct integration

Version checksum: `a3b59a3b059e2d10c55abdd688415c1e20d23e0a536cf9afd09950a5fbae6bf3`.

### teschl — Mathematical Methods in Quantum Mechanics

Gerald Teschl. author PDF of second edition. [Public source](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §3.1 spectral measures and Theorems 3.1–3.7; §3.3 multiplicity; §6.3 Schatten ideals

Version checksum: `8dc8de0b58aa0a3fedfe594a345f9b5875322e5526ea581cb640a98d55b82818`.

### arthur05 — An Introduction to the Trace Formula

James Arthur. Clay Mathematics Proceedings 4 (2005), 1–263. [Public source](https://www.claymath.org/library/cw/arthur/pdf/62.pdf). Recorded access: 2026-10-09.

**Read scope.**

- §7 Hilbert induction and Theorem7.2; §§12–17 truncation, convergence, coarse identity; §§18–23 weighted families and fine/invariant expansions, including the Hecke-only correction and height convergence; selected statements/proofs, not full recursive closure of all cited originals
- §12 Lemmas12.2–12.4 and (12.3)–(12.4), printed pp.64–66, re-read 2026-10-09

Version checksum: `2b6623010ce5d854732458dfb5e61600a4e6cc7288629a72cb63d5f7530ac510`.

### langlands — On the Functional Equations Satisfied by Eisenstein Series

Robert P. Langlands. IAS electronic transcription, 235 PDF pages, dated 2 December2015 and updated 22 July2016, of LNM544(1976); AppendixIII includes editorial reconstruction notices; not collated against the printed 337-page edition. [Public source](https://publications.ias.edu/sites/default/files/functional-equations-eisenstein_rpl_8.pdf). Recorded access: 2026-10-07.

**Read scope.**

- Preface and Chapter 1; Chapter 7 residual construction and continuation

Version checksum: `d0feffaf5f79222a7ee29009cb8b36bebb45564a28a34aacfc0241c1fff25c99`.

### langlands66 — Eisenstein Series

Robert P. Langlands. Proc. Sympos. Pure Math. 9 (1966), 235–252, IAS transcription. [Public source](https://publications.ias.edu/sites/default/files/Eisenstein-series-rpl_0.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §§3–6 and contour shifts in §§7–10

Version checksum: `7ee86983d6d186532cd229ec3223d999a6e643f960bac62e970a1257b2f66715`.

### arthur78 — A Trace Formula for Reductive Groups I: Terms Associated to Classes in G(Q)

James Arthur. Duke Math. J. 45 (1978), 911–952. [Public source](https://www.claymath.org/library/cw/arthur/pdf/7.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §§1–3 definitions and geometric convergence; reduction estimates

Version checksum: `7e60f480e35d9ccec29b7aa53d6a5a6f0ca617dc6f69332fec49a08f51c8e2f3`.

### arthur80 — A Trace Formula for Reductive Groups II: Applications of a Truncation Operator

James Arthur. Compositio Math. 40 (1980), 87–121. [Public source](https://www.claymath.org/library/cw/arthur/pdf/9.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §§1–3 truncation and coarse identity; §4 polynomial dependence

Version checksum: `8478531337b3fd5925026614f1a6533e35e87324674af26f664d6de7f455f647`.

### arthur81 — The Trace Formula in Invariant Form

James Arthur. Annals of Math. 114 (1981), 1–74. [Public source](https://www.claymath.org/library/cw/arthur/pdf/10.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §§2–3 invariantization; §6 (G,M)-families

Version checksum: `6bdf32990eb33b6d02a7bd858ace66fc85cebe2e97dca1a4be082afd958d3a43`.

### arthur82ms — On the Inner Product of Truncated Eisenstein Series

James Arthur. Duke Math. J. 49 (1982), 35–70. [Public source](https://www.claymath.org/library/cw/arthur/pdf/12.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §§1–3 discrete data and polynomial exponentials; §§7–9 asymptotic estimate

Version checksum: `f0693c409f3cbae9e8cedbc1c2eceec4657f79fdc361fcb0ffc89f40b044547c`.

### arthur83pw — Multipliers and a Paley-Wiener Theorem for Real Reductive Groups

James Arthur. 1983 expository article, Arthur archive no.17. [Public source](https://www.claymath.org/library/cw/arthur/pdf/17.pdf). Recorded access: 2026-10-07.

**Read scope.**

- Definitions of operator Paley-Wiener spaces; Theorems 1–2

Version checksum: `a1eb8329d69373748f2f7ac13f0e2c4241e1cbece8b9f39fc18780a64e9faac1`.

### arthur83acta — A Paley-Wiener Theorem for Real Reductive Groups

James Arthur. Acta Math. 150 (1983), 1–89. [Public source](https://www.claymath.org/library/cw/arthur/pdf/15.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §§1–4; Theorem 4.2 multiplier theorem; main Fourier isomorphism

Version checksum: `a78240ce1095e2a17591bf829fa726675ca865e77e8c3d663823d3dcf4fb8034`.

### arthur88local — The Invariant Trace Formula I: Local Theory

James Arthur. JAMS 1 (1988), 323–383. [Public source](https://www.claymath.org/library/cw/arthur/pdf/26.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §§1–6 local distributions and character support; §§7–9 families, descent and splitting

Version checksum: `902db792ffe113507165a252b0c1b8c59f78ab8d04def1c5c39b0372362dc3ac`.

### arthur88global — The Invariant Trace Formula II: Global Theory

James Arthur. JAMS 1 (1988), 501–554. [Public source](https://www.claymath.org/library/cw/arthur/pdf/27.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §3 Theorem3.3 and proof; §4 Theorem4.4 with scalar/operator family separation; §6 convergence remark; selected spectral and invariantization statements

Version checksum: `42d2193dde29d159ebf757e3636f7ab3e4c0c85644cac360baffb7e0758e507b`.

### arthur89weighted — Intertwining Operators and Residues I: Weighted Characters

James Arthur. J. Funct. Anal. 84 (1989), 19–84. [Public source](https://www.claymath.org/library/cw/arthur/pdf/28.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §§1–4 normalizing factors; §§6–7 weighted characters; §§11–12 invariant Fourier maps

Version checksum: `0ba6be4e9e8020d1d0cf6a3a87cb79297e66f18a75d2af7d1e09d3e57139c13f`.

### arthur89lefschetz — The L²-Lefschetz Numbers of Hecke Operators

James Arthur. Invent. Math. 97 (1989), 257–290. [Public source](https://www.claymath.org/library/cw/arthur/pdf/32.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §§2–3 cohomological trace and pseudo-coefficients; §§5–6 Lefschetz formula

Version checksum: `5c8655176c90fa08ab9037d317d5f6bfc75914a6b3c41415f52873b7c21d050c`.

### clozeldelorme90 — Le théorème de Paley-Wiener invariant pour les groupes de Lie réductifs II

Laurent Clozel and Patrick Delorme. Ann. ENS 23 (1990), 193–228. [Public source](https://www.numdam.org/article/ASENS_1990_4_23_2_193_0.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §0 Theorem1 all four image conditions; §5 EP function/Theorem3 finite-length trace; AppendixD statement of the repair of [7]Lemma4 and selected proof, not its full representation-theoretic proof closure

Version checksum: `dd70f4069fdeec6fc31e44557f239080f5c169743dc8aa2de5b69659da594432`.

### franke — Harmonic Analysis in Weighted L²-Spaces

Jens Franke. Ann. ENS 31 (1998), 181–279. [Public source](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §§2–3 weighted definitions and regularization statements; §4 Theorem7 with printed contragredient Ẽ; §6 filtration, principal values and Theorem14; §7 Theorems16–18 and boundary resolution; selected proof steps only

Version checksum: `3c0465f6413bf156d8574f4bc94f1768cb7ff650deec645e46171b24f269c58b`.

### wallach — On the Constant Term of a Square Integrable Automorphic Form

Nolan R. Wallach. Monogr. Stud. Math. 18 (1984), 227–237, author scan. [Public source](https://mathweb.ucsd.edu/~nwallach/tempered-cuspidal.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §§2–4, especially Theorem 4.3

Version checksum: `07bd2feb5939f4fa867160f5a44484a707c12184d0d38b87572bba41b4e4d539`.

### yu23 — Comptage des systèmes locaux ℓ-adiques sur une courbe

Hongjie Yu. arXiv:1807.04659v5, 18 July 2022 (journal route labelled 2023). [Public source](https://arxiv.org/pdf/1807.04659v5). Recorded access: 2026-10-09.

**Read scope.**

- §§2.2–2.3 definitions/classification statement; §§3.1–3.3 degree/truncation and quasi-polynomial statements; §4.2 family identities and proofs; §5.2 finite-cover spectral recovery proof; §5.3 stabilizers/local factors; AppendixA degree-family proofs and AppendixB comparison statement; Lafforgue/MW/Chaudouard originals pending
- Revision: §§5.2.1–5.2.3, printed pp.32–36, and Appendix A, pp.75–77; full-seminorm and character-cover hypotheses compared with the proposed signatures
- §5.2.1–5.2.3, printed pp.32–36; Appendix A, pp.75–77; cutoff exponents, torus conventions and coprime scope re-read 2026-10-09

Version checksum: `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c`.

### jiangzhang20 — Arthur Parameters and Cuspidal Automorphic Modules of Classical Groups

Dihua Jiang and Lei Zhang. arXiv:1508.03205v4 author preprint; route points to Annals of Mathematics191(2020),905–985; journal text not collated. [Public source](https://arxiv.org/pdf/1508.03205v4). Recorded access: 2026-10-07.

**Read scope.**

- §5.1 formulas (5.3)–(5.4) and Theorem 5.1; Appendix B

Version checksum: `d97bf3048aa10de52f07ae5bbbc3970c974996ae4193d9cd7f12b17890df7bb4`.

### dit16 — Geometric Invariants for Real Quadratic Fields

William Duke, Özlem İmamoğlu and Árpád Tóth. Annals of Math. 184 (2016), 949–990. [Public source](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). Recorded access: 2026-10-09.

**Read scope.**

- §5 spectral conventions; §7 cusp integrability; §§8–9 Poincaré/resolvent/raising; Appendix A
- §5 equations (5.1)–(5.7), printed pp.961–962; §9 Lemmas5–7, pp.979–980, re-read 2026-10-09

Version checksum: `a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61`.

### dit11 — Cycle Integrals of the j-Function and Mock Modular Forms

William Duke, Özlem İmamoğlu and Árpád Tóth. Annals of Math. 173 (2011), 947–981. [Public source](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf). Recorded access: 2026-10-07.

**Read scope.**

- Appendix A Whittaker definitions, comparisons and asymptotics

Version checksum: `8f2b8ed3518fe69f08a72ef0ed3311d30523042335d4bd0e1ffd82d84459a010`.

### cg20 — Minimal Modularity Lifting for Non-regular Symplectic Representations

Frank Calegari and David Geraghty. arXiv:1907.08691v1, July2019; source of the Duke2020 route. [Public source](https://arxiv.org/pdf/1907.08691). Recorded access: 2026-10-07.

**Read scope.**

- Theorem7.11 Wallach application; AppendixA LemmaA.3 consumer citation; no audit of the modularity-lifting proof

Version checksum: `39aa93a83c77ce93884db6352e4c63f80e881197f4213dd699cdf7d77cfbb059`.

### cgh20 — Bloch–Kato Conjectures for Automorphic Motives

Frank Calegari, David Geraghty and Michael Harris. arXiv:1907.08694v1, July2019. [Public source](https://arxiv.org/pdf/1907.08694). Recorded access: 2026-10-07.

**Read scope.**

- §3.1 Lemma3.1 proof, automorphic/isobaric cohomology realization and FS98 citation

Version checksum: `8389edfec6576b92aea1fd4dbf6c96ccb86b2186a6f244ab46c4abf1c02e2bed`.

### bcg25 — Cuspidal Cohomology of GLₙ(Z) and SLₙ(Z)

George Boxer, Frank Calegari and Toby Gee. author WeightZero PDF; route labelled 2025. [Public source](https://math.uchicago.edu/~fcale/papers/WeightZero.pdf). Recorded access: 2026-10-07.

**Read scope.**

- Remark 1.2 and its cohomological decomposition diagram

Version checksum: `4d27afabbef371babf3a73dad19bc8ccee180636be27bd6ebee17f58f7150290`.

### bpcz22 — The Global Gan–Gross–Prasad Conjecture for Unitary Groups: the Endoscopic Case

Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard and Michał Zydor. Publ. Math. IHES 135 (2022), 183–337. [Public source](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf). Recorded access: 2026-10-09.

**Read scope.**

- AppendixA.0.1–A.0.11, functional-analytic definitions, lemmas and vector continuation proof; selected main-text applications §§2.2,2.7,2.9,3.3.4; not the global GGP proof
- Revision: BPCZ Appendix A.0.1–A.0.11, pp.326–333
- Appendix A, A.0.1–A.0.11, printed pp.326–333; two continuation corollaries re-read 2026-10-09

Version checksum: `a07a6143d3e71f1eca31b6ba9b774bec325a7de07c7417b7796486a77df13794`.

### ct20 — Discrete Series Multiplicities for Classical Groups over Z and Level 1 Algebraic Cusp Forms

Gaëtan Chenevier and Olivier Taïbi. Publ. Math. IHES 131 (2020), 261–323. [Public source](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §1.4 L²-Lefschetz formula and measure conventions

Version checksum: `ea90fb0faabeaaa56be15f2c6f9c22450e7891c2181130fd79fe356cd83ba3de`.

### bcgp21 — Abelian Surfaces over Totally Real Fields Are Potentially Modular

George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni. Publ. Math. IHES 134 (2021), 153–501. [Public source](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §§2.9,3.10 Wallach applications; isobaric sums notation

Version checksum: `b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af`.

### gz86 — Heegner Points and Derivatives of L-Series

Benedict H. Gross and Don B. Zagier. Invent. Math. 84 (1986), 225–320. [Public source](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf). Recorded access: 2026-10-09.

**Read scope.**

- Scanned printed pp.238–240,251; pp.271,273,277–281,294,298–299; definitions and selected proofs of routed analytic items; no reading of the arithmetic Chapters III/V proof interiors
- Chapter IV §2, equation (2.1), printed p.273, page image re-read 2026-10-09

Version checksum: `a9a52cb8662e03f19ace81dcfbf24bf873bf9c46ba89a8c890727b9541abdbf5`.

### shapiro25 — Functional Analysis: Princeton University MAT520 Lecture Notes

Jacob Shapiro. Fall 2025; last typeset 10 December 2025. [Public source](https://web.math.princeton.edu/~js129/PDFs/teaching/MAT520_fall_2025/MAT520_Lecture_Notes.pdf). Recorded access: 2026-10-07.

**Read scope.**

- §10.1 Theorem 10.5 and proof, printed pp.125–126

Version checksum: `56aefb385eefd760ecd55bce9e3be14759f307fa98b5a00b8b787fde735e6b9d`.

## Source contributions and owners

This routing records the source items needed by the seven-stage spectral programme. Items outside that programme are imported from their owners. No source is reproduced or summarized in source-section order.

- **PAPER-YU-23/010** — planned: [AutomorphicSpectralTheory:AS.1/yu-010](#automorphicspectraltheory-as-1-yu-010). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/017** — planned: [AutomorphicSpectralTheory:AS.4/yu-017](#automorphicspectraltheory-as-4-yu-017). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/018** — planned: [AutomorphicSpectralTheory:AS.4/yu-018](#automorphicspectraltheory-as-4-yu-018). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/019** — planned: [AutomorphicSpectralTheory:AS.4/yu-019](#automorphicspectraltheory-as-4-yu-019). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/020** — planned: [AutomorphicSpectralTheory:AS.4/yu-020](#automorphicspectraltheory-as-4-yu-020). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/021** — planned: [AutomorphicSpectralTheory:AS.4/yu-021](#automorphicspectraltheory-as-4-yu-021). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/022** — planned: [AutomorphicSpectralTheory:AS.3/yu-022](#automorphicspectraltheory-as-3-yu-022). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/023** — planned: [AutomorphicSpectralTheory:AS.3/yu-023](#automorphicspectraltheory-as-3-yu-023). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/024** — planned: [AutomorphicSpectralTheory:AS.6/yu-024](#automorphicspectraltheory-as-6-yu-024). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/025** — planned: [AutomorphicSpectralTheory:AS.6/yu-025](#automorphicspectraltheory-as-6-yu-025). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/038** — planned: [AutomorphicSpectralTheory:AS.6/yu-038](#automorphicspectraltheory-as-6-yu-038). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/039** — planned: [AutomorphicSpectralTheory:AS.6/yu-039](#automorphicspectraltheory-as-6-yu-039). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/047** — planned: [AutomorphicSpectralTheory:AS.6/yu-047](#automorphicspectraltheory-as-6-yu-047). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/048** — planned: [AutomorphicSpectralTheory:AS.6/yu-048](#automorphicspectraltheory-as-6-yu-048). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/049** — planned: [AutomorphicSpectralTheory:AS.6/yu-049](#automorphicspectraltheory-as-6-yu-049). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/050** — planned: [AutomorphicSpectralTheory:AS.6/yu-050](#automorphicspectraltheory-as-6-yu-050). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/051** — planned: [AutomorphicSpectralTheory:AS.6/yu-051](#automorphicspectraltheory-as-6-yu-051). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/052** — planned: [AutomorphicSpectralTheory:AS.6/yu-052](#automorphicspectraltheory-as-6-yu-052). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/053** — planned: [AutomorphicSpectralTheory:AS.6/yu-053](#automorphicspectraltheory-as-6-yu-053). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/054** — planned: [AutomorphicSpectralTheory:AS.6/yu-054](#automorphicspectraltheory-as-6-yu-054). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/055** — planned: [AutomorphicSpectralTheory:AS.6/yu-055](#automorphicspectraltheory-as-6-yu-055). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/056** — planned: [AutomorphicSpectralTheory:AS.3/yu-056](#automorphicspectraltheory-as-3-yu-056). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/058** — planned: [AutomorphicSpectralTheory:AS.3/yu-058](#automorphicspectraltheory-as-3-yu-058). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/059** — planned: [AutomorphicSpectralTheory:AS.3/yu-059](#automorphicspectraltheory-as-3-yu-059). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/060** — planned: [AutomorphicSpectralTheory:AS.1/yu-060](#automorphicspectraltheory-as-1-yu-060). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/061** — planned: [AutomorphicSpectralTheory:AS.2/yu-061](#automorphicspectraltheory-as-2-yu-061). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/062** — planned: [AutomorphicSpectralTheory:AS.6/yu-062](#automorphicspectraltheory-as-6-yu-062). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/063** — planned: [AutomorphicSpectralTheory:AS.6/yu-063](#automorphicspectraltheory-as-6-yu-063). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/065** — planned: [AutomorphicSpectralTheory:AS.4/yu-065](#automorphicspectraltheory-as-4-yu-065). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/066** — planned: [AutomorphicSpectralTheory:AS.2/yu-066](#automorphicspectraltheory-as-2-yu-066). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/115** — planned: [AutomorphicSpectralTheory:AS.3/yu-115](#automorphicspectraltheory-as-3-yu-115). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/116** — planned: [AutomorphicSpectralTheory:AS.3/yu-116](#automorphicspectraltheory-as-3-yu-116). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/117** — planned: [AutomorphicSpectralTheory:AS.3/yu-117](#automorphicspectraltheory-as-3-yu-117). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/145** — planned: [AutomorphicSpectralTheory:AS.0/yu-145](#automorphicspectraltheory-as-0-yu-145). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/146** — planned: [AutomorphicSpectralTheory:AS.0/yu-146](#automorphicspectraltheory-as-0-yu-146). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/147** — planned: [AutomorphicSpectralTheory:AS.0/yu-147](#automorphicspectraltheory-as-0-yu-147). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/148** — planned: [AutomorphicSpectralTheory:AS.0/yu-148](#automorphicspectraltheory-as-0-yu-148). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/149** — planned: [AutomorphicSpectralTheory:AS.0/yu-149](#automorphicspectraltheory-as-0-yu-149). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/150** — planned: [AutomorphicSpectralTheory:AS.0/yu-150](#automorphicspectraltheory-as-0-yu-150). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/151** — planned: [AutomorphicSpectralTheory:AS.6/yu-151](#automorphicspectraltheory-as-6-yu-151). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/152** — planned: [AutomorphicSpectralTheory:AS.6/yu-152](#automorphicspectraltheory-as-6-yu-152). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/153** — planned: [AutomorphicSpectralTheory:AS.1/yu-153](#automorphicspectraltheory-as-1-yu-153). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/157** — planned: [AutomorphicSpectralTheory:AS.3/yu-157](#automorphicspectraltheory-as-3-yu-157). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/164** — planned: [AutomorphicSpectralTheory:AS.6/yu-164](#automorphicspectraltheory-as-6-yu-164). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/165** — planned: [AutomorphicSpectralTheory:AS.6/yu-165](#automorphicspectraltheory-as-6-yu-165). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/166** — planned: [AutomorphicSpectralTheory:AS.4/yu-166](#automorphicspectraltheory-as-4-yu-166). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/169** — planned: [AutomorphicSpectralTheory:AS.6/yu-169](#automorphicspectraltheory-as-6-yu-169). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-YU-23/175** — planned: [AutomorphicSpectralTheory:AS.3/yu-175](#automorphicspectraltheory-as-3-yu-175). Fresh v5 statement comparison; corrections and unresolved original-proof dependencies are recorded separately.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/57** — planned: [AutomorphicSpectralTheory:AS.1/dit-57](#automorphicspectraltheory-as-1-dit-57). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/58** — planned: [AutomorphicSpectralTheory:AS.1/dit-58](#automorphicspectraltheory-as-1-dit-58). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/59** — planned: [AutomorphicSpectralTheory:AS.2/dit-59](#automorphicspectraltheory-as-2-dit-59). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/60** — planned: [AutomorphicSpectralTheory:AS.2/dit-60](#automorphicspectraltheory-as-2-dit-60). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/66** — covered: [AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion](#automorphicspectraltheory-as-4-gl2-spectral-expansion). Uses the same GL₂ spectral node; no duplicate Weyl-law or coefficient-decay theorem.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/67** — covered: [AutomorphicSpectralTheory:AS.4/modular-weyl-estimates](#automorphicspectraltheory-as-4-modular-weyl-estimates). Uses the same GL₂ spectral node; no duplicate Weyl-law or coefficient-decay theorem.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/68** — covered: [AutomorphicSpectralTheory:AS.4/modular-weyl-estimates](#automorphicspectraltheory-as-4-modular-weyl-estimates). Uses the same GL₂ spectral node; no duplicate Weyl-law or coefficient-decay theorem.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/88** — planned: [AutomorphicSpectralTheory:AS.1/dit-88](#automorphicspectraltheory-as-1-dit-88). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/89** — planned: [AutomorphicSpectralTheory:AS.1/dit-89](#automorphicspectraltheory-as-1-dit-89). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/90** — planned: [AutomorphicSpectralTheory:AS.1/dit-90](#automorphicspectraltheory-as-1-dit-90). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/91** — planned: [AutomorphicSpectralTheory:AS.2/dit-91](#automorphicspectraltheory-as-2-dit-91). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/92** — planned: [AutomorphicSpectralTheory:AS.2/dit-92](#automorphicspectraltheory-as-2-dit-92). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/93** — planned: [AutomorphicSpectralTheory:AS.2/dit-93](#automorphicspectraltheory-as-2-dit-93). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/94** — planned: [AutomorphicSpectralTheory:AS.2/dit-94](#automorphicspectraltheory-as-2-dit-94). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/105** — planned: [AutomorphicSpectralTheory:AS.1/dit-105](#automorphicspectraltheory-as-1-dit-105). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/110** — planned: [AutomorphicSpectralTheory:AS.1/dit-110](#automorphicspectraltheory-as-1-dit-110). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/112** — planned: [AutomorphicSpectralTheory:AS.0/dit-112](#automorphicspectraltheory-as-0-dit-112). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/113** — planned: [AutomorphicSpectralTheory:AS.0/dit-113](#automorphicspectraltheory-as-0-dit-113). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/114** — planned: [AutomorphicSpectralTheory:AS.0/dit-114](#automorphicspectraltheory-as-0-dit-114). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/115** — planned: [AutomorphicSpectralTheory:AS.0/dit-115](#automorphicspectraltheory-as-0-dit-115). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/118** — planned: [AutomorphicSpectralTheory:AS.0/dit-118](#automorphicspectraltheory-as-0-dit-118). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/138** — planned: [AutomorphicSpectralTheory:AS.4/dit-138](#automorphicspectraltheory-as-4-dit-138). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/157** — gap: [AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion](#automorphicspectraltheory-as-4-gl2-spectral-expansion). No assertion of absence of exceptional spectrum without a certified source.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/165** — planned: [AutomorphicSpectralTheory:AS.0/dit-165](#automorphicspectraltheory-as-0-dit-165). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/wrong-sign-weyl-integrals-vanish** — planned: [AutomorphicSpectralTheory:AS.4/dit-wrong-sign-weyl-integrals-vanish](#automorphicspectraltheory-as-4-dit-wrong-sign-weyl-integrals-vanish). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/eisenstein-integrable-over-core** — planned: [AutomorphicSpectralTheory:AS.4/dit-eisenstein-integrable-over-core](#automorphicspectraltheory-as-4-dit-eisenstein-integrable-over-core). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/fourier-expansion-weight0-poincare** — planned: [AutomorphicSpectralTheory:AS.1/dit-fourier-expansion-weight0-poincare](#automorphicspectraltheory-as-1-dit-fourier-expansion-weight0-poincare). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/resolvent-fourier-expansion-weight0** — planned: [AutomorphicSpectralTheory:AS.2/dit-resolvent-fourier-expansion-weight0](#automorphicspectraltheory-as-2-dit-resolvent-fourier-expansion-weight0). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/appendix-a2-series-of-whittaker-cycle-integral** — planned: [AutomorphicSpectralTheory:AS.0/dit-appendix-a2-series-of-whittaker-cycle-integral](#automorphicspectraltheory-as-0-dit-appendix-a2-series-of-whittaker-cycle-integral). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/appendix-a3-series-of-rhs** — planned: [AutomorphicSpectralTheory:AS.0/dit-appendix-a3-series-of-rhs](#automorphicspectraltheory-as-0-dit-appendix-a3-series-of-rhs). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-DUKE-IMAMOGLU-TOTH-16/appendix-a-leading-coefficient-match** — planned: [AutomorphicSpectralTheory:AS.0/dit-appendix-a-leading-coefficient-match](#automorphicspectraltheory-as-0-dit-appendix-a-leading-coefficient-match). Statement compared to the published DIT16 or DIT11 passage; corrected formulas and primary-source proof gates remain explicit.
- **PAPER-GROSS-ZAGIER-86/64** — planned: [AutomorphicSpectralTheory:AS.0/gz-64](#automorphicspectraltheory-as-0-gz-64). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/65** — planned: [AutomorphicSpectralTheory:AS.0/gz-65](#automorphicspectraltheory-as-0-gz-65). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/66** — planned: [AutomorphicSpectralTheory:AS.0/gz-66](#automorphicspectraltheory-as-0-gz-66). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/68** — planned: [AutomorphicSpectralTheory:AS.2/gz-68](#automorphicspectraltheory-as-2-gz-68). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/69** — planned: [AutomorphicSpectralTheory:AS.1/gz-69](#automorphicspectraltheory-as-1-gz-69). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/70** — planned: [AutomorphicSpectralTheory:AS.1/gz-70](#automorphicspectraltheory-as-1-gz-70). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/71** — covered: [AutomorphicSpectralTheory:AS.2/dit-59](#automorphicspectraltheory-as-2-dit-59). The integer Legendre function and N=1 specialization use the same definitions; the SL₂ constant term is the uncompleted DIT expansion.
- **PAPER-GROSS-ZAGIER-86/108** — planned: [AutomorphicSpectralTheory:AS.0/gz-108](#automorphicspectraltheory-as-0-gz-108). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/179** — planned: [AutomorphicSpectralTheory:AS.1/gz-179](#automorphicspectraltheory-as-1-gz-179). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/185** — covered: [AutomorphicSpectralTheory:AS.1/gz-179](#automorphicspectraltheory-as-1-gz-179), [AutomorphicSpectralTheory:AS.1/gz-192](#automorphicspectraltheory-as-1-gz-192). The integer Legendre function and N=1 specialization use the same definitions; the SL₂ constant term is the uncompleted DIT expansion.
- **PAPER-GROSS-ZAGIER-86/192** — planned: [AutomorphicSpectralTheory:AS.1/gz-192](#automorphicspectraltheory-as-1-gz-192). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/207** — planned: [AutomorphicSpectralTheory:AS.0/gz-207](#automorphicspectraltheory-as-0-gz-207). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/208** — planned: [AutomorphicSpectralTheory:AS.1/gz-208](#automorphicspectraltheory-as-1-gz-208). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/209** — planned: [AutomorphicSpectralTheory:AS.1/gz-209](#automorphicspectraltheory-as-1-gz-209). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/212** — planned: [AutomorphicSpectralTheory:AS.0/gz-212](#automorphicspectraltheory-as-0-gz-212). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/213** — planned: [AutomorphicSpectralTheory:AS.0/gz-213](#automorphicspectraltheory-as-0-gz-213). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/214** — planned: [AutomorphicSpectralTheory:AS.0/gz-214](#automorphicspectraltheory-as-0-gz-214). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/215** — planned: [AutomorphicSpectralTheory:AS.0/gz-215](#automorphicspectraltheory-as-0-gz-215). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/216** — planned: [AutomorphicSpectralTheory:AS.0/gz-216](#automorphicspectraltheory-as-0-gz-216). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/217** — planned: [AutomorphicSpectralTheory:AS.0/gz-217](#automorphicspectraltheory-as-0-gz-217). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/241** — planned: [AutomorphicSpectralTheory:AS.1/gz-241](#automorphicspectraltheory-as-1-gz-241). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-GROSS-ZAGIER-86/258** — covered: [AutomorphicSpectralTheory:AS.0/gz-64](#automorphicspectraltheory-as-0-gz-64). The integer Legendre function and N=1 specialization use the same definitions; the SL₂ constant term is the uncompleted DIT expansion.
- **PAPER-GROSS-ZAGIER-86/265** — planned: [AutomorphicSpectralTheory:AS.1/gz-265](#automorphicspectraltheory-as-1-gz-265). Compared with scanned printed pages; the literal citation is manually transcribed prose.
- **PAPER-JIANG-ZHANG-20/eisenstein-series** — covered: [AutomorphicSpectralTheory:AS.2/shahidi-normalization](#automorphicspectraltheory-as-2-shahidi-normalization), [AutomorphicSpectralTheory:AS.2/jiang-zhang-holomorphy](#automorphicspectraltheory-as-2-jiang-zhang-holomorphy), [AutomorphicSpectralTheory:AS.2/tempered-gl-intertwiner](#automorphicspectraltheory-as-2-tempered-gl-intertwiner), [AutomorphicSpectralTheory:AS.2/tempered-standard-intertwiner](#automorphicspectraltheory-as-2-tempered-standard-intertwiner), [AutomorphicSpectralTheory:AS.2/generic-normalized-intertwiner](#automorphicspectraltheory-as-2-generic-normalized-intertwiner). The target-level general node supplies the routed consumer; exact source/proof gaps are retained.
- **PAPER-JIANG-ZHANG-20/intertwining-constant-term** — covered: [AutomorphicSpectralTheory:AS.2/shahidi-normalization](#automorphicspectraltheory-as-2-shahidi-normalization), [AutomorphicSpectralTheory:AS.2/jiang-zhang-holomorphy](#automorphicspectraltheory-as-2-jiang-zhang-holomorphy), [AutomorphicSpectralTheory:AS.2/tempered-gl-intertwiner](#automorphicspectraltheory-as-2-tempered-gl-intertwiner), [AutomorphicSpectralTheory:AS.2/tempered-standard-intertwiner](#automorphicspectraltheory-as-2-tempered-standard-intertwiner), [AutomorphicSpectralTheory:AS.2/generic-normalized-intertwiner](#automorphicspectraltheory-as-2-generic-normalized-intertwiner). The target-level general node supplies the routed consumer; exact source/proof gaps are retained.
- **PAPER-JIANG-ZHANG-20/normalized-intertwining** — covered: [AutomorphicSpectralTheory:AS.2/shahidi-normalization](#automorphicspectraltheory-as-2-shahidi-normalization), [AutomorphicSpectralTheory:AS.2/jiang-zhang-holomorphy](#automorphicspectraltheory-as-2-jiang-zhang-holomorphy), [AutomorphicSpectralTheory:AS.2/tempered-gl-intertwiner](#automorphicspectraltheory-as-2-tempered-gl-intertwiner), [AutomorphicSpectralTheory:AS.2/tempered-standard-intertwiner](#automorphicspectraltheory-as-2-tempered-standard-intertwiner), [AutomorphicSpectralTheory:AS.2/generic-normalized-intertwiner](#automorphicspectraltheory-as-2-generic-normalized-intertwiner). The target-level general node supplies the routed consumer; exact source/proof gaps are retained.
- **PAPER-JIANG-ZHANG-20/thm-5-1** — covered: [AutomorphicSpectralTheory:AS.2/shahidi-normalization](#automorphicspectraltheory-as-2-shahidi-normalization), [AutomorphicSpectralTheory:AS.2/jiang-zhang-holomorphy](#automorphicspectraltheory-as-2-jiang-zhang-holomorphy), [AutomorphicSpectralTheory:AS.2/tempered-gl-intertwiner](#automorphicspectraltheory-as-2-tempered-gl-intertwiner), [AutomorphicSpectralTheory:AS.2/tempered-standard-intertwiner](#automorphicspectraltheory-as-2-tempered-standard-intertwiner), [AutomorphicSpectralTheory:AS.2/generic-normalized-intertwiner](#automorphicspectraltheory-as-2-generic-normalized-intertwiner). The target-level general node supplies the routed consumer; exact source/proof gaps are retained.
- **PAPER-JIANG-ZHANG-20/rev-normalized-gl-gl-intertwining-operators** — covered: [AutomorphicSpectralTheory:AS.2/shahidi-normalization](#automorphicspectraltheory-as-2-shahidi-normalization), [AutomorphicSpectralTheory:AS.2/jiang-zhang-holomorphy](#automorphicspectraltheory-as-2-jiang-zhang-holomorphy), [AutomorphicSpectralTheory:AS.2/tempered-gl-intertwiner](#automorphicspectraltheory-as-2-tempered-gl-intertwiner), [AutomorphicSpectralTheory:AS.2/tempered-standard-intertwiner](#automorphicspectraltheory-as-2-tempered-standard-intertwiner), [AutomorphicSpectralTheory:AS.2/generic-normalized-intertwiner](#automorphicspectraltheory-as-2-generic-normalized-intertwiner). The target-level general node supplies the routed consumer; exact source/proof gaps are retained.
- **PAPER-JIANG-ZHANG-20/rev-standard-intertwining-operators-for-tempered** — covered: [AutomorphicSpectralTheory:AS.2/shahidi-normalization](#automorphicspectraltheory-as-2-shahidi-normalization), [AutomorphicSpectralTheory:AS.2/jiang-zhang-holomorphy](#automorphicspectraltheory-as-2-jiang-zhang-holomorphy), [AutomorphicSpectralTheory:AS.2/tempered-gl-intertwiner](#automorphicspectraltheory-as-2-tempered-gl-intertwiner), [AutomorphicSpectralTheory:AS.2/tempered-standard-intertwiner](#automorphicspectraltheory-as-2-tempered-standard-intertwiner), [AutomorphicSpectralTheory:AS.2/generic-normalized-intertwiner](#automorphicspectraltheory-as-2-generic-normalized-intertwiner). The target-level general node supplies the routed consumer; exact source/proof gaps are retained.
- **PAPER-JIANG-ZHANG-20/rev-normalized-intertwining-operators-for-generic** — covered: [AutomorphicSpectralTheory:AS.2/shahidi-normalization](#automorphicspectraltheory-as-2-shahidi-normalization), [AutomorphicSpectralTheory:AS.2/jiang-zhang-holomorphy](#automorphicspectraltheory-as-2-jiang-zhang-holomorphy), [AutomorphicSpectralTheory:AS.2/tempered-gl-intertwiner](#automorphicspectraltheory-as-2-tempered-gl-intertwiner), [AutomorphicSpectralTheory:AS.2/tempered-standard-intertwiner](#automorphicspectraltheory-as-2-tempered-standard-intertwiner), [AutomorphicSpectralTheory:AS.2/generic-normalized-intertwiner](#automorphicspectraltheory-as-2-generic-normalized-intertwiner). The target-level general node supplies the routed consumer; exact source/proof gaps are retained.
- **PAPER-CALEGARI-GERAGHTY-20/ext-wallach-cuspidality** — covered: [AutomorphicSpectralTheory:AS.4/wallach-cuspidality](#automorphicspectraltheory-as-4-wallach-cuspidality). The target-level general node supplies the routed consumer; exact source/proof gaps are retained.
- **PAPER-CALEGARI-GERAGHTY-20/ext-franke-schwermer-isobaric-realisation** — covered: [AutomorphicSpectralTheory:AS.5/franke-schwermer-support](#automorphicspectraltheory-as-5-franke-schwermer-support), [AutomorphicSpectralTheory:AS.5/isobaric-realization](#automorphicspectraltheory-as-5-isobaric-realization). The target-level general node supplies the routed consumer; exact source/proof gaps are retained.
- **PAPER-BOXER-CALEGARI-GEE-25/cuspidal-cohomology** — covered: [AutomorphicSpectralTheory:AS.5/gl-sl-cuspidal-diagram](#automorphicspectraltheory-as-5-gl-sl-cuspidal-diagram). Import the exact spectral sum and Hecke map from ArithmeticLocallySymmetricSpaces:ALS.5/cuspidal-cohomology. AS.5 owns only the GL_n/SL_n parity specialization; the duplicate target was removed by this review.
- **PAPER-BOXER-CALEGARI-GEE-25/cuspidal-cohomology-decomposition** — covered: [AutomorphicSpectralTheory:AS.5/gl-sl-cuspidal-diagram](#automorphicspectraltheory-as-5-gl-sl-cuspidal-diagram). Import the exact spectral sum and Hecke map from ArithmeticLocallySymmetricSpaces:ALS.5/cuspidal-cohomology. AS.5 owns only the GL_n/SL_n parity specialization; the duplicate target was removed by this review.
- **PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/8** — covered: [AutomorphicSpectralTheory:AS.3/truncation-cones](#automorphicspectraltheory-as-3-truncation-cones), [AutomorphicSpectralTheory:AS.1/induced-family](#automorphicspectraltheory-as-1-induced-family). Root, Iwasawa-height and Siegel carriers are imported from AA.3; AS.3 specializes the cone combinatorics. This is not an Appendix A functional-analysis result.
- **PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/27** — gap: [AutomorphicSpectralTheory:AS.1/induced-family](#automorphicspectraltheory-as-1-induced-family), [AutomorphicSpectralTheory:AS.0/projective-tensor](#automorphicspectraltheory-as-0-projective-tensor). Finite-K-type inducing carriers are planned. Full SLF/Casselman–Wallach globalization and product completion are additional AF Part II inputs, explicitly recorded as a gap.
- **PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/28** — gap: [AutomorphicSpectralTheory:AS.1/eisenstein-series](#automorphicspectraltheory-as-1-eisenstein-series), [AutomorphicSpectralTheory:AS.1/convergent-intertwiner](#automorphicspectraltheory-as-1-convergent-intertwiner), [AutomorphicSpectralTheory:AS.2/eisenstein-continuation](#automorphicspectraltheory-as-2-eisenstein-continuation). The finite-K-type Langlands statements are planned. The full smooth SLF source topology and Lapid continuity into T_N([G]) are not discharged by Appendix A alone; see the smooth-topology gap.
- **PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/32** — covered: [AutomorphicSpectralTheory:AS.1/cuspidal-datum-space](#automorphicspectraltheory-as-1-cuspidal-datum-space). The Weyl-associate cuspidal pair and central quotient are the AS.1 datum construction, not an LF continuation target.
- **PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/33** — gap: [AutomorphicSpectralTheory:AS.1/cuspidal-data-orthosum](#automorphicspectraltheory-as-1-cuspidal-data-orthosum), [AutomorphicSpectralTheory:AS.1/cuspidal-datum-space](#automorphicspectraltheory-as-1-cuspidal-datum-space). The global unit-weight χ decomposition is planned. Weighted parabolic χ projections and agreement for two weights need the separate MW II.2.4/topological comparison recorded below.
- **PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/45** — gap: [AutomorphicSpectralTheory:AS.3/arthur-truncation](#automorphicspectraltheory-as-3-arthur-truncation), [AutomorphicSpectralTheory:AS.3/truncation-cones](#automorphicspectraltheory-as-3-truncation-cones). This is the compact Siegel cutoff F^G and its central quotient support, not the function truncation Λ^T. The AA Part II cutoff/support adapter is recorded below.
- **PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/108** — covered: [AutomorphicSpectralTheory:AS.0/nuclear-lf-space](#automorphicspectraltheory-as-0-nuclear-lf-space), [AutomorphicSpectralTheory:AS.0/locally-convex-integration](#automorphicspectraltheory-as-0-locally-convex-integration). The LF/quasi-complete carrier and seminorm-integral targets supply this Appendix A item, with their recorded integration gaps.
- **PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/109** — covered: [AutomorphicSpectralTheory:AS.0/operator-meromorphic](#automorphicspectraltheory-as-0-operator-meromorphic), [AutomorphicSpectralTheory:AS.0/distribution-convergence](#automorphicspectraltheory-as-0-distribution-convergence), [AutomorphicSpectralTheory:AS.0/locally-convex-integration](#automorphicspectraltheory-as-0-locally-convex-integration). Weak operator holomorphy, barrelled equicontinuity and continued evaluation are the relevant targets; strong operator topology needs the separate source qualification.
- **PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/111** — covered: [AutomorphicSpectralTheory:AS.0/locally-convex-integration](#automorphicspectraltheory-as-0-locally-convex-integration), [AutomorphicSpectralTheory:AS.0/nuclear-lf-space](#automorphicspectraltheory-as-0-nuclear-lf-space). The locally convex integration target explicitly includes nuclear maps taking summable families to absolutely summable ones; scalar unordered-sum bounds are part of that target proof.
- **PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/112** — covered: [AutomorphicSpectralTheory:AS.0/projective-tensor](#automorphicspectraltheory-as-0-projective-tensor), [AutomorphicSpectralTheory:AS.0/vector-schwartz](#automorphicspectraltheory-as-0-vector-schwartz). The tensor universal property is planned; the complete nuclear kernel-image theorem remains the specifically recorded Grothendieck source gap.
- **PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/113** — covered: [AutomorphicSpectralTheory:AS.0/vector-schwartz](#automorphicspectraltheory-as-0-vector-schwartz), [AutomorphicSpectralTheory:AS.0/vector-phragmen-lindelof](#automorphicspectraltheory-as-0-vector-phragmen-lindelof). The vector Schwartz and uniform scalar-strip-order seminorm targets cover A.0.9.1; this does not remove its barrelled/quasi-complete hypotheses.
- **PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/114** — covered: [AutomorphicSpectralTheory:AS.0/vector-phragmen-lindelof](#automorphicspectraltheory-as-0-vector-phragmen-lindelof), [AutomorphicSpectralTheory:AS.0/schwartz-family-continuation](#automorphicspectraltheory-as-0-schwartz-family-continuation), [AutomorphicSpectralTheory:AS.0/lf-dual-continuation](#automorphicspectraltheory-as-0-lf-dual-continuation). These are the three actual Appendix A.0.10–11 targets. The revision’s suggested continuation signatures now retain the two initial continuous families, reflected functional equation and common finite strip order; they construct the continuation rather than assert continuity of arbitrary off-chamber data.
- **PAPER-CHENEVIER-TAIBI-20/l2-lefschetz** — covered: [AutomorphicSpectralTheory:AS.6/l2-lefschetz](#automorphicspectraltheory-as-6-l2-lefschetz), [AutomorphicSpectralTheory:AS.6/general-euler-poincare](#automorphicspectraltheory-as-6-general-euler-poincare). The target-level general node supplies the routed consumer; exact source/proof gaps are retained.
- **PAPER-BOXER-CALEGARI-GEE-PILLONI-21/228** — covered: [AutomorphicSpectralTheory:AS.4/wallach-cuspidality](#automorphicspectraltheory-as-4-wallach-cuspidality). The target-level general node supplies the routed consumer; exact source/proof gaps are retained.
- **PAPER-BOXER-CALEGARI-GEE-PILLONI-21/335** — covered: [AutomorphicSpectralTheory:AS.1/induced-family](#automorphicspectraltheory-as-1-induced-family), [AutomorphicSpectralTheory:AS.2/isobaric-sum](#automorphicspectraltheory-as-2-isobaric-sum). Normalized induction in AS.1 supplies the ordered cuspidal block input; AS.2 constructs the continued isobaric representation, its almost-everywhere uniqueness, Satake union and L-function product. Wallach cuspidality belongs to item228 and does not supply this construction.

## Structural boundary

RT-AREA-automorphic-1/4 and /24: real harmonic analysis supplies ET.1, whereas weighted orbital integrals use ET.1. A whole AS.6→ET.1 import would cycle.

Extract AS.1a “Real Paley–Wiener theory and spectral multipliers” containing AS.6/real-invariant-paley-wiener, AS.6/real-operator-paley-wiener and AS.6/spectral-multiplier, preserving their statements, source ranges, APIs and tests. Its inputs are AS.0/vector-schwartz, AS.0/nuclear-lf-space, AS.0/locally-convex-integration, the independent AF.1/sf-representation carrier and the precise AF.1 local real-parabolic induction request (including arbitrary supplied Levi data and holomorphic compact pictures), together with AF.1b real classification/discrete-series inputs. AS.1 global adelic induced-family is not a supplier for this local prefix. The multiplier depends on the operator theorem inside this prefix. It imports neither ET.1 nor any AS.6 orbital/trace result. Export AS.1a to ET.1 and AS.6; keep ET.1→AS.6/weighted-orbital-integral and general-euler-poincare. Until integration use the current precise node ids and keep the stage boundary gap; do not claim a new atlas stage already exists. The nonarchimedean BDK supplier stays SmoothRepresentationsCharactersPartII, and AS.2 retains the measure-dependent μ-function/local-normalization nodes.

## Independent revision-2 review

Accepted as a complete target-level planning pass on 9 October 2026 by REV-AutomorphicSpectralTheory~2. The independent ledger checks every retained node: 177 verified and 13 corrected (one correction makes an omitted API name explicit). All seven stages remain planned, with 52 recorded gaps and 22 supplier requests; every implementation remains unchecked. The report is [REV-AutomorphicSpectralTheory~2](../reviews/REV-AutomorphicSpectralTheory~2.md).

The original continuation and Fourier-transfer blockers are resolved: the Schwartz/LF-dual continuations use two initial continuous families and a common order bound, and the finite/torus Fourier models fix probability measure and the complete character basis. The object tests now evaluate named constructions or documented specializations.

This review also fixes inverse-closed indexing in the kernel adjoint; explicit defect and factorization hypotheses in invariant recursion; the scalar Euler–Poincaré realization; the root-contour dz/z normalization; and Arthur’s Jacobian locator (21.5), p.130. The level adapter uses the named ER.7 meromorphic series and Mathlib zeta/Möbius data. The point-pair and automorphic Green eigen-equations use the actual GZ-sign coordinate Laplacian. Truncation linearity has finite coset support as a hypothesis, while compact local finiteness and the actual hermitian resolvent-kernel API await their genuine supplier carriers. These omissions follow the suggested-file convention and leave the source targets intact.

All 32 baseline declarations are confirmed at their recorded pins. All 37 source-issue verdicts are renewed for this job and retain their older history. E3 remains rejected; E5 is the missing opposite-sign parity coefficient, since the printed DIT p.975 display already has the factor 2. The earlier review explanation claiming a missing printed factor 2 is superseded. The corrected suggested file elaborates against the pinned Mathlib with only admitted-proof warnings.
