# Modularity, automorphy and Langlands endpoint extensions

This roadmap assembles modularity and potential-automorphy theorems, symmetric-power lifts and their analytic consequences, classical-group classification inputs, and precise Langlands frontier assertions. Each result retains its source field, rank, local conditions and normalization. A theorem over ℚ does not supply its totally real analogue; a generic multiplicity formula does not supply a nongeneric one; matching outside a finite set does not supply matching at every place.

The roadmap document is the mathematical specification. The [packet](../packets/ModularityAndLanglandsExtensions.json) records its prerequisite graph and source editions. The [suggested file](../suggested/ModularityAndLanglandsExtensions.lean) proposes names and expressible signatures. Its concrete prototypes concern endpoint bookkeeping, the singular Hodge list, reciprocal Euler polynomials, the finite-field projective-image condition, the orthogonal determinant sign constraint, and the weight-level parallel condition. Dependent signatures whose actual supplier objects or hypotheses are unavailable are explicitly omitted there. Their names, mathematical statements, API and test specifications remain in the manifest. Compiling that file verifies the stated prototypes; it does not certify the omitted endpoints or implement this roadmap.

## Scope and order

All six layers have a target-level plan. None is closed: the supplier requests and exact gaps below are part of the plan. A known mathematical endpoint, a conditional theorem and a conjectural frontier have distinct meanings even when all three have unimplemented Lean declarations. The source-qualified statements determine those meanings; the registry records them rather than inferring them from a stage label.

| Layer | Targets | Planets | Coverage |
| --- | ---: | ---: | --- |
| ML.0 — Endpoint and normalization registry | 12 | 0 | planned |
| ML.1 — Weight one and broader modularity | 16 | 3 | planned |
| ML.2 — Potential automorphy assembly | 33 | 6 | planned |
| ML.3 — Symmetric powers and Sato–Tate | 40 | 6 | planned |
| ML.4 — Classical-group classification and trace sources | 31 | 6 | planned |
| ML.5 — Known functorial transfers and frontiers | 10 | 4 | planned |

The local declaration graph and the graph induced by the assigned parent layers are acyclic. An allowed layer order is ML.0, ML.1, ML.2, ML.4, ML.3, ML.5; ML.4 and ML.3 have no local edge between them. The endoscopic method used by a symmetric-power proof belongs to its method supplier. The wider atlas order requires the PA/ML restructuring specified below; the local order does not certify a global atlas order.

Legacy node identifiers are stable citation keys. A node's assigned layer is its displayed layer, even when its historical identifier contains another layer number. Early functorial-lift/SP definitions and low-rank transfers are in ML.1. The ACC elliptic seed is in ML.2. GSp₄ packet, singular-weight frontier and regular-weight surface inputs are in ML.4.

## Conventions and supplier boundary

Fix the actual number field F, coefficient field M, rational prime ℓ, coefficient place λ|ℓ and coefficient embedding throughout a statement. An automorphic object is an isomorphism class of representations of the specified reductive group over F, with its actual local components. An ℓ-adic realization is a continuous representation of G_F. Weights, determinants, local parameters and L-factors must be derived from those same objects.

- **Galois normalization.** Use HT_τ(ε_ℓ)={−1} and local Artin reciprocity sending a uniformizer to geometric Frobenius. The algebraic normalization is recᵀ(π_v)=rec(π_v⊗|det|^((1−n)/2)). Inversion of Frobenius elements and duality of representations are separate operations. For an elliptic curve the positive-weight cohomological H¹ realization is dual to the usual Tate-module realization in this convention; the comparison requires the explicit realization dictionary.
- **Polarization.** In the imaginary-CM pure-weight-w convention, the automorphic polarization character obeys χ_v(−1)=(−1)^(n+w). Its Galois multiplier is obtained through the same character realization, not assigned independently. The totally real, CM and finite-image Artin oddness statements retain their distinct definitions.
- **Euler factors.** At a good place let Q_v(X)=det(X−Frob_v) be monic of degree n. Set P_v(T)=TⁿQ_v(T⁻¹)=det(1−TFrob_v), with constant coefficient one. The factor is P_v(q_v^(−s))⁻¹=q_v^(ns)/Q_v(q_v^s). Substitution of q_v^(−s) into Q_v gives a different function. Strict compatibility adds ramified Weil–Deligne and real-sign data to the good-place polynomials. Conductor, gamma and epsilon factors must use those additional data.
- **Archimedean reciprocity.** Rank-one rec_ℝ and rec_ℂ use the abelianization of the corresponding Weil group. The finite maps to Gal(ℂ/K) do not encode arbitrary local characters. Higher-rank archimedean parameters use the specified Langlands quotient normalization.
- **Lift degree.** The rank-n symmetric-power endpoint is Sym^(n−1) of a rank-two input, with n≥1. Every API preserves that indexing. The ℚ-specific SymPowerLift predicate is the specialization of the number-field predicate. Its cuspidal input domain is respected by base change and composition; a noncuspidal input requires the separate isobaric-domain operations.
- **Matching.** A full functorial lift matches local parameters at all places where the source correspondence applies, including infinity. A weak lift matches outside a finite set. Strong multiplicity one gives uniqueness in the relevant automorphic domain; it supplies neither existence nor missing ramified matches.
- **Packets and categories.** A packet is a finite multiset with its parameter-derived centralizer, component group and pairing. Global multiplicity is a natural number. Generic-only multiplicity one does not discard repeated nongeneric constituents. The categorical local Langlands assertion uses actual stable ∞-categories and the canonical Whittaker spectral functor and right adjoint, with compactness and support conditions.

### Existing library and roadmap imports

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed coverage audit supplies no modularity or Langlands endpoint in these layers. It does not identify the weight-one roadmap exports as existing library declarations.

- `mathlib:Matrix.trace` (Mathlib/LinearAlgebra/Matrix/Trace.lean): Trace of a finite square matrix, used by suggested complex-conjugation traces and finite-image characters; no continuous group-cohomology or adequacy result is supplied.
- `mathlib:Polynomial.reverse` (Mathlib/Algebra/Polynomial/Reverse.lean): Reverse at the actual natural degree; its coefficient-zero is the original leading coefficient.
- `mathlib:Polynomial.eval₂_reverse_mul_pow` (Mathlib/Algebra/Polynomial/Reverse.lean): For an invertible x and a ring map i, eval₂ i x⁻¹ Q.reverse times x^natDegree Q equals eval₂ i x Q.
- `mathlib:Matrix.charpoly` (Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean): Characteristic polynomial det(XI−A) of an actual finite square matrix over a commutative ring.
- `mathlib:Matrix.ProjGenLinGroup` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean): PGL is GL modulo its centre; it carries its actual quotient group structure.
- `mathlib:Matrix.ProjGenLinGroup.mk` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean): The quotient homomorphism GL→PGL, with kernel the centre.
- `mathlib:Matrix.ProjGenLinGroup.map` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean): The homomorphism PGL(k)→PGL(K) induced by a coefficient ring homomorphism k→K.
- `mathlib:Matrix.ProjectiveSpecialLinearGroup.toPGL` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean): Injective natural map PSL→PGL induced by SL→GL; no abstract PSL carrier is planned here.

ClassicalGroups supplies the representation-theoretic tensor, exterior and symmetric-power constructions. CompactGroups supplies Haar measure, Peter–Weyl, character completeness and its SU₂ classification. ClassFieldTheory and the exact elliptic/modular-curve roadmap layers supply their own objects; the references in each target specify the required layer. The additional current roadmaps AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry are existing owners and are not replanned here. Current Tau Ceti already contains `WeierstrassCurve.tateModuleGaloisRepresentation` and `TauCeti.det_tateModuleGaloisRepresentation`; those constructions postdate the baseline. The requested cohomological and automorphic comparison builds on them.

### Required coherent interfaces

Each contract specifies operations on actual supplier objects and the laws needed by its consumers. The [requests](#supplier-requests) give its owning stage and exact mathematical extension. A supplier title alone does not discharge a contract.

#### C-GALOIS

Actual continuous representations of the absolute Galois group in finite coefficient fields and their algebraic closures; coefficient extension, restriction along actual number-field embeddings, integral lattices and semisimple residual reduction; Weil–Deligne realization of the same representation at each finite place. Realization π↦r_{π,ι} must commute with isomorphism, twists, duals and permitted base change, with the stated rec^T and Hodge–Tate identities. Complex conjugation, polarization multiplier and Hodge/sign data refer to that realization. Frobenius inversion is evaluation at inverse elements; a separate cohomological-duality dictionary is required before changing Hodge signs.

Owner: `AutomorphicGaloisRepresentationsPartII:AG2.2`.

#### C-AUTOMORPHIC

Actual isomorphism classes of irreducible admissible local representations and global automorphic representations with a fixed field, reductive group and rank. Cuspidal, isobaric, regular algebraic, weight, local component, central character, twist and contragredient refer to those objects. Isobaric sums preserve multiplicities and their local parameters are direct sums. Local rec commutes with twists/duals and the all-place functorial-lift predicate uses the same components. The Langlands quotient over ℝ/ℂ and the archimedean Weil group have the specified LLC source scope; a rank label cannot supply these laws.

Owner: `AutomorphicFormsOnReductiveGroups:AF.1`.

#### C-SYSTEM

A system consists of one number field, coefficient field, rank and finite bad set; actual continuous semisimple r_λ; monic Q_v and Hodge multisets. For each λ, r_λ is unramified away from the bad set and residue characteristic and has Frobenius characteristic polynomial equal to Q_v through the specified coefficient embedding. Purity constrains the roots of those same Q_v under every complex embedding. Symmetric powers, tensors, duals, twists, restriction and direct sums are the operations on r_λ and determine the new Q_v, rank, Hodge multiset and pairing; a constituent decomposition is an actual isomorphism at every λ. Strict compatibility additionally supplies coherent ramified WD and real-sign data. The L-function is the Euler product of these Q_v, with the reciprocal conversion above, and its conductor/gamma/epsilon factors use those WD and real data. For a cohomological Dwork fibre, good-place comparison identifies only the global semisimplification. Match coefficient embeddings; require semisimplicity separately before transferring a maximal local monodromy block.

Owner: `PotentialModularityAndCompatibleSystems:R24.5`.

#### C-ARTIN

The full Artin L-function is constructed from the same finite-image continuous complex representation: finite local factors are the determinants on inertia invariants, with the specified Frobenius, and infinity factors use its complex-conjugation eigenspaces. Strong Artin matching supplies local parameters and all these factors at every place; weak almost-everywhere matching supplies only a partial product. Twists, direct sums and automorphic comparisons commute with these constructions. Entireness excludes the trivial rank-one representation.

Owner: `AnalyticNumberTheory:AN.4`.

#### C-LOCAL-DEFORMATION

The component-connects relation compares lifts of the same local residual representation, determinant and Hodge type in the actual generic fibre of its deformation ring. Ordinary and potentially diagonalizable predicates apply to the same continuous local representation and filtration/crystalline module. BCGNT 3.2.1 must export the specialized connects ALT used twice in 6.2.3, preserving all seventeen auxiliary-system conditions and the subsequent cyclic untensoring/descent. PA.4 ordinary/Fontaine–Laffaille endpoints alone do not imply this, nor Caraiani–Newton 1.3 or CG18 5.16.

Owner: `PotentialAutomorphyInfrastructure:PA.4`.

#### C-MODULI

Moret–Bailly uses a smooth geometrically connected scheme over an actual number field; local open subsets of its base changes; and a returned point whose images lie in those opens under the returned field embeddings and completion isomorphisms. The extension has the stated Galois, disjointness and local properties. The twisted modular curve is descended from full level via the actual E[q] Galois cocycle, with Weil-pairing multiplier ε̄, and its points represent symplectic isomorphisms of the specified torsion modules.

Owner: `PotentialModularityAndCompatibleSystems:R23.1`.

#### C-ARTHUR

Actual admissible L/Arthur homomorphisms into the specified L-group; centralizers and component-group quotients derived from those homomorphisms; finite local packet multisets with retained repetitions; Whittaker/inner-twist pairings; global restricted products and multiplicities as natural numbers. Orthogonal parameters satisfy the determinant-one relation before quotienting by the centre. Refined endoscopic character identities and global multiplicity formulas refer to these packets. Unknown weighted/twisted orbital-integral and stabilization hypotheses must be stated by the constructive Part II, with its exact test-function normalizations and local scope. Until then their conditional classification signatures are omitted, not encoded as ArthurInputs. KMSW 2014 generic pure-inner scope and its two nongeneric local inputs are kept distinct. Mœglin–Renard membership uses the two explicit branches stated at its node, not a CaseI field.

Owner: `EndoscopicTransferAndUnitaryTraceComparison:ET.3`.

#### C-COHERENT-GEOMETRY

The actual coherent cohomology eigensystem and attached GSp₄ Galois representation, with a number-field action on an actual abelian variety and its H¹ eigenspaces, are required for the two frontier predicates. The Hodge list is prototyped independently and does not prove the expected de Rham/crystalline claims. For Bianchi forms use actual Fourier coefficients, Hecke eigensystems and the Harder parabolic-cohomology comparison, not unrelated coefficient functions.

Owner: `AutomorphicFormsOnReductiveGroups:AF.4`.

#### C-EQUIDISTRIBUTION

Compact-group characters and Haar probability are supplied by the existing CompactGroups roadmap, including its separate SU₂ symmetric-power classification and class-function completeness. Frobenius classes are the normalized semisimple classes of the same pure Galois realization. The norm is the actual number-field norm and multiplicity is bounded at each norm. The analytic criterion consumes Euler products of those classes with continuation and boundary nonvanishing for every nontrivial irreducible character; free classes/functions cannot supply equidistribution.

Owner: [RepresentationTheory/CompactGroups](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md#layer-6-characters-of-compact-groups).

#### C-CATEGORICAL

Stable ∞-categories D_lis(Bun_G,Λ), Perf and Ind Perf of the actual parameter stack, compact objects, bounded coherent objects with quasicompact and nilpotent singular support, the spectral action on the specified Whittaker sheaf and its canonical colimit extension/right adjoint. These are needed to state FS I.10.2. An ordinary category/functor or a semisimple parameter function is not a substitute. The existing ES5 parameter map supplies only the semisimple specialization. Zou’s torus theorem also needs the stable/condensed group-homology and character-gerbe constructions, as a specific extension of the geometrisation owner.

Owner: `ExcursionOperatorsAndSpectralAction:ES5`.

## Layer ML.0: Endpoint and normalization registry

Pin the realization, local reciprocity and L-factor conventions before applying automorphy. Distinguish the source editions and record theorem status with actual proofs of stated hypotheses. The Hodge-list and Euler-polynomial helpers provide concrete normalization controls.

<a id="target-archimedean-langlands-conventions"></a>

### Archimedean Langlands parameters rec_ℝ, rec_ℂ, isobaric sums ⊞ and BC_{ℂ/ℝ}

Target `ML.0/archimedean-langlands-conventions`; construction. Proposed declaration: `TauCeti.LanglandsRegister.recArch`.

Art_ℝ : ℝ^× ↠ Gal(ℂ/ℝ) and Art_ℂ : ℂ^× ↠ Gal(ℂ/ℂ) are the unique continuous surjections. For K = ℝ (resp. ℂ), rec_K is Langlands' bijection (owner: AutomorphicFormsOnReductiveGroups AF.1/archimedean-llc-gln; this node fixes ACC+'s use of it and constructs ⊞ and BC on top) from irreducible admissible (Lie GL_n(ℝ) ⊗_ℝ ℂ, O(n))-modules (resp. (Lie GL_n(ℂ) ⊗_ℝ ℂ, U(n))-modules) to continuous semisimple n-dimensional representations of the Weil group W_K. For modules π_i of rank n_i, the isobaric sum π₁ ⊞ ⋯ ⊞ π_r is defined by rec_K(π₁ ⊞ ⋯ ⊞ π_r) = rec_K(π₁) ⊕ ⋯ ⊕ rec_K(π_r); for π a (Lie GL_n(ℝ) ⊗ ℂ, O(n))-module, BC_{ℂ/ℝ}(π) is the (Lie GL_n(ℂ) ⊗ ℂ, U(n))-module with rec_ℂ(BC_{ℂ/ℝ}(π)) = rec_ℝ(π)|_{W_ℂ}. ACC+ print the labels rec_ℝ and rec_ℂ interchanged (recorded as a source issue).

Hypotheses:

- n ≥ 1; modules are (𝔤, K)-modules in the sense of AutomorphicFormsOnReductiveGroups AF.1.

Proof route:

1. For rank one use the Weil-group abelianization isomorphism W_K^ab≅K^×: rec_K(χ) is χ composed with its inverse reciprocity map. The finite Galois maps Art_ℝ and Art_ℂ in the notation register are different maps; arbitrary characters do not factor through Gal(ℂ/K).
2. General n: Langlands' classification — every irreducible admissible module is the Langlands quotient of a standard module induced from characters (and, for ℝ, discrete series of GL₂(ℝ)) — matched with the decomposition of a semisimple W_K-representation into irreducibles of dimension ≤ 2.
3. BC_{ℂ/ℝ} and ⊞ are then defined on the Galois side, transported through rec.

Direct prerequisites: `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`, [ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-11-the-global-class-formation-and-global-artin-reciprocity).

Consumers:

- `Allen et al. 2023, §2.3 and §7`: weights at infinity of regular algebraic representations and the archimedean L-factors of compatible systems
- [ML.0/compatible-system-archimedean-factors](#target-compatible-system-archimedean-factors): Γ-factors are those of rec_K of the archimedean components
- [ML.4/gsp4-gl4-archimedean-transfer](#target-gsp4-gl4-archimedean-transfer): the transfer of π_∞ to GL₄(ℝ) is computed on rec_ℝ

Planning API:

- `TauCeti.LanglandsRegister.recArch` — rec_K : irreducible admissible GL_n(K)-modules → semisimple n-dimensional W_K-representations, K = ℝ, ℂ.
- `TauCeti.LanglandsRegister.recArch_bijective` — rec_K is a bijection onto isomorphism classes.
- `TauCeti.LanglandsRegister.recArch_gl1` — For n=1 use local Weil reciprocity K^×≅W_K^ab; rec_K(χ) is χ transported to W_K^ab. The finite map to Gal(ℂ/K) does not define this for arbitrary χ.
- `TauCeti.LanglandsRegister.isobaricSum` — π₁ ⊞ π₂ with rec(π₁ ⊞ π₂) = rec(π₁) ⊕ rec(π₂).
- `TauCeti.LanglandsRegister.baseChangeCR` — BC_{ℂ/ℝ}(π) with rec_ℂ(BC_{ℂ/ℝ}(π)) = rec_ℝ(π)|_{W_ℂ}.
- `TauCeti.LanglandsRegister.recArch_twist` — rec_K(π ⊗ (χ ∘ det)) = rec_K(π) ⊗ rec_K(χ).
- `TauCeti.LanglandsRegister.recArch_dual` — rec_K(π^∨) = rec_K(π)^∨.

Definition tests:

- `TauCeti.LanglandsRegister.recArch_sign` (computation) — rec_ℝ(sgn) is the character of W_ℝ that is trivial on W_ℂ = ℂ^× and sends j to −1.
- `TauCeti.LanglandsRegister.recArch_trivial_gl2` (computation) — rec_ℝ(1_{GL₂(ℝ)}) = |·|^{1/2} ⊕ |·|^{−1/2} (the trivial module is the Langlands quotient of the induced module from |·|^{1/2} ⊗ |·|^{−1/2}).
- `TauCeti.LanglandsRegister.baseChange_gl1` (degenerate) — n = 1: BC_{ℂ/ℝ}(χ) = χ ∘ N_{ℂ/ℝ}.
- `TauCeti.LanglandsRegister.discreteSeries_not_isobaric` (non-example) — rec_ℝ(D_k) for a discrete series D_k (k ≥ 2) is irreducible of dimension 2, so D_k is not an isobaric sum of characters, while BC_{ℂ/ℝ}(D_k) is.

Acceptance controls:

- Check the discrete series: for k ≥ 2, rec_ℝ(D_k) = Ind_{W_ℂ}^{W_ℝ}(z ↦ (z/z̄)^{(k−1)/2}) up to the twist by |·|^{s} fixed by the central character.

Sources: [P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999), §1.2 Notation, arXiv v2 p. 11 (Annals pp. 907–908).

Suggested signature: omitted until C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-blggt-normalization-register"></a>

### BLGGT's normalisations of automorphic Galois representations

Target `ML.0/blggt-normalization-register`; comparison. Proposed declaration: `TauCeti.PotentialAutomorphy.normalizationRegister`.

Register of the conventions BLGGT (arXiv v4) fixes, against which every ML.2 statement is read. (1) A polarized automorphic representation of GL_n(𝔸_F) is a pair (π, χ) with χ : 𝔸_{F⁺}^×/(F⁺)^× → ℂ^× continuous, χ_v(−1) independent of v | ∞, and π^c ≅ π^∨ ⊗ (χ ∘ N_{F/F⁺} ∘ det), with χ_v(−1) = (−1)^{n+w} for v | ∞ when F is imaginary and π has pure weight a ∈ (ℤ^n)_w (the inherited AG2.0/E2 correction; the printed (−1)^n is its weight-zero special case); v4's "polarized" replaces v1's RAECSDC (F imaginary CM) and RAESDC (F totally real). (2) Weights a ∈ (ℤ^n)^{Hom(F,ℂ),+}: π has weight a if π_∞ has the infinitesimal character of Ξ_a^∨; then a ∈ (ℤ^n)_w for some w. (3) The Galois normalisation: (r_{l,ı}(π), ε_l^{1−n}r_{l,ı}(χ)) is totally odd polarized, HT_τ(r_{l,ı}(π)) = {a_{ıτ,1} + n − 1, …, a_{ıτ,n}}, and ıWD(r_{l,ı}(π)|_{G_{F_v}})^{F-ss} ≅ rec(π_v ⊗ |det|_v^{(1−n)/2}) for v ∤ l (and for v | l when π_v has Iwahori-fixed vectors). (4) HT_τ(ε_l) = {−1} and Art_K sends uniformisers to geometric Frobenius. (5) Being automorphic does not depend on ı (Clozel, Theorem 3.13).

Hypotheses:

- F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).

Proof route:

1. Collect the definitions of BLGGT §2.1 and §1 (notation) and compare each with AG2.0's polarized case and AG2.2's realisation; the v1 → v4 renaming (RAECSDC/RAESDC → polarized) is recorded in blggt-version-register.

Direct prerequisites: `AutomorphicGaloisRepresentationsPartII:AG2.0`, `AutomorphicGaloisRepresentationsPartII:AG2.2`.

Acceptance controls:

- For imaginary CM F, n = 2 and pure weight w = 0, χ_v(−1) = +1 and ε_l^{−1}r_{l,ı}(χ) is −1 at complex conjugation. Repeat with w = 1: χ_v(−1) = −1, while r_{l,ı}(χ)(c_v) = (−1)^wχ_v(−1) = +1, so the multiplier is again −1.
- At weight 0, HT_τ = {n − 1, …, 0}; at pure weight w the signs must use n+w rather than n alone.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p. 32 (arXiv v4); [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, Theorem 2.1.1, pp. 33–34 (arXiv v4).

Suggested signature: omitted until C-GALOIS supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-reciprocal-euler-polynomial"></a>

### Reciprocal Euler normalization

Target `ML.0/reciprocal-euler-polynomial`; definition. Proposed declaration: `TauCeti.LanglandsRegister.reciprocalEulerPolynomial`.

For a polynomial Q over a semiring define reciprocalEulerPolynomial(Q) to be Mathlib’s reverse of Q. If Q is monic of degree n this has constant coefficient one and is T^n Q(T⁻¹). For an invertible n×n matrix A over a field, reversing its characteristic polynomial gives det(1−TA). At nonzero x, P(x)x^{−n}=Q(x⁻¹). Thus the unramified Euler denominator is P(q^{−s}), not Q(q^{−s}). This is the local normalization comparison; the compatible-system L-function remains owned by R24.5.

Hypotheses:

- Exactly the domains and hypotheses stated.

Proof route:

1. Use the existing library objects and the explicit formula. The API records the consumer comparison; no missing automorphic carrier is replaced by free data.

Direct prerequisites: `mathlib:Polynomial.reverse`, `mathlib:Polynomial.eval₂_reverse_mul_pow`, `mathlib:Matrix.charpoly`.

Consumers:

- [ML.0/compatible-system-archimedean-factors](#target-compatible-system-archimedean-factors): Fixes the denominator in the partial Euler product.

Planning API:

- `TauCeti.LanglandsRegister.reciprocalEulerPolynomial` — Mathlib polynomial reverse, at the actual degree.
- `TauCeti.LanglandsRegister.reciprocalEulerPolynomial_coeff_zero` — For monic Q the constant coefficient is one.
- `TauCeti.LanglandsRegister.reciprocalEulerPolynomial_eval` — For x≠0 in a field, P(x)x^{−natDegree Q}=Q(x⁻¹).
- `TauCeti.LanglandsRegister.reciprocalEulerPolynomial_matrix` — For A in GL_n, P_A(x)=det(1−xA).

Definition tests:

- `TauCeti.LanglandsRegister.euler_trivial` (computation) — Q=X−1 gives P=1−X.
- `TauCeti.LanglandsRegister.euler_rank_zero` (degenerate) — Q=1 gives P=1.
- `TauCeti.LanglandsRegister.euler_quadratic` (computation) — Q=X²−aX+q gives P=1−aX+qX² over ℚ.
- `TauCeti.LanglandsRegister.euler_wrong_argument` (non-example) — At x=1/2, Q=X−1 and P=1−X have unequal values.

Acceptance controls:

- Q=X−1 gives P=1−X.
- Q=1 gives P=1.
- Q=X²−aX+q gives P=1−aX+qX² over ℚ.
- At x=1/2, Q=X−1 and P=1−X have unequal values.

Sources: [P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999), §7.1, pp. 197–198, arXiv v2.

Suggested signature: stated with its API and tests.

<a id="target-singular-weight-hodge-list"></a>

### The singular-weight Hodge list

Target `ML.0/singular-weight-hodge-list`; definition. Proposed declaration: `TauCeti.LanglandsRegister.singularWeightHodgeList`.

For k∈ℕ and r∈ℤ define H(k,r)=[0,r−2,r+k−1,k+2r−3] as a list, retaining repeated entries. It has four distinct entries exactly when r≠2, k+r≠1 and k+2r≠3. This is a consumer convention check, not a construction of a de Rham representation or proof of crystallinity.

Hypotheses:

- Exactly the domains and hypotheses stated.

Proof route:

1. Use the existing library objects and the explicit formula. The API records the consumer comparison; no missing automorphic carrier is replaced by free data.

Direct prerequisites: the exact export requested from its named import owner.

Consumers:

- [ML.0/expected-crystallinity-newton-above-hodge](#target-expected-crystallinity-newton-above-hodge): Tests the expected weights without assuming the conjectural Hodge realization.

Planning API:

- `TauCeti.LanglandsRegister.singularWeightHodgeList` — The stated list, with four positions even when values coincide.
- `TauCeti.LanglandsRegister.singularWeightHodgeList_length` — Its length equals four.
- `TauCeti.LanglandsRegister.singularWeightHodgeList_nodup_iff` — No repeated entries iff the three exclusions hold, for k≥0.
- `TauCeti.LanglandsRegister.singularWeightHodgeList_r_two` — H(k,2)=[0,0,k+1,k+1].

Definition tests:

- `TauCeti.LanglandsRegister.hodgeList_k2_r1` (computation) — H(2,1)=[0,−1,2,1], with no repetition.
- `TauCeti.LanglandsRegister.hodgeList_singular` (non-example) — H(3,2) repeats entries.
- `TauCeti.LanglandsRegister.hodgeList_degenerate` (degenerate) — H(0,2)=[0,0,1,1].

Acceptance controls:

- H(2,1)=[0,−1,2,1], with no repetition.
- H(3,2) repeats entries.
- H(0,2)=[0,0,1,1].

Sources: [Vincent Pilloni, Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Remark 5.3.2, pp. 25–26, author manuscript.

Suggested signature: stated with its API and tests.

<a id="target-blggt-version-register"></a>

### BLGGT source versions: arXiv v1 against v4 (Annals 2014)

Target `ML.0/blggt-version-register`; comparison. Proposed declaration: `TauCeti.PotentialAutomorphy.versionRegister`.

ML binds its BLGGT statements to arXiv v4 (9 December 2013), the version preceding Ann. of Math. 179 (2014), 501–609. PotentialModularityAndCompatibleSystems part R24.3 cites arXiv v1 (2010). Correspondence: v1 §2.2 (minimal lifting, Theorem 2.2.1) = v4 §2.3 (Theorem 2.3.1); v1 §2.3 (ordinary lifting, Theorem 2.3.1) = v4 §2.4 (Theorem 2.4.1, now also for totally real F); v4 §2.2 (Lemmas 2.2.1–2.2.4 on automorphy) is new; v1 §5.2 (Lemma 5.2.1, Proposition 5.2.2) = v4 §5.3 (Lemma 5.3.1, Proposition 5.3.2); v1 Lemma 5.2.3 = v4 Lemma 5.4.5; v1 §5.3 (Theorem 5.3.1, Corollaries 5.3.2–5.3.3, Proposition 5.3.4) = v4 §5.4 (Theorem 5.4.1 with Corollary 5.4.2, Corollary 5.4.3, Corollary 5.4.4, Proposition 5.4.6); v1 §5.4 (Theorems 5.4.1–5.4.3) = v4 §5.5 (Theorems 5.5.1–5.5.3); v4 §5.2 (rational compatible systems) is new. v4 renames RAECSDC/RAESDC to "polarized" and "essentially conjugate self-dual" to "polarized", and states the lifting theorems for polarized (r, µ) with the "potentially diagonalizably automorphic" hypothesis.

Hypotheses:

- Both versions read on the text layer; theorem statements compared side by side.

Proof route:

1. Compare section headings and theorem statements of arXiv v1 (sha 697e2d3…) and v4 (sha c953df6…).

Direct prerequisites: [ML.0/blggt-normalization-register](#target-blggt-normalization-register).

Acceptance controls:

- Check one renumbered pair: v1 Theorem 5.3.1 and v4 Theorem 5.4.1 both give potential automorphy of irreducible, regular, totally odd, polarized weakly compatible systems.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), title page and table of contents, p. 1 (arXiv v4).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-compatible-system-archimedean-factors"></a>

### Archimedean Euler factors and completed L-function of a pure compatible system

Target `ML.0/compatible-system-archimedean-factors`; comparison. Proposed declaration: `TauCeti.LanglandsRegister.completedL`.

Comparison/import of PotentialModularityAndCompatibleSystems:R24.5/system-l-functions. For a pure weakly compatible rank-n system with monic characteristic polynomial Q_v(X)=det(X−Frob_v), put P_v(T)=T^n Q_v(T^{−1})=det(1−T Frob_v). Then L^S(R,s)=∏_{v∉S}P_v(q_v^{−s})^{−1}=∏_{v∉S}q_v^{ns}/Q_v(q_v^s), absolutely convergent for Re s>1+w/2. Full ramified and archimedean factors require a pure, regular, strictly compatible system (or separately specified coherent Weil–Deligne and real-sign data); they are not determined by a pure weak system alone. With such data, Γ_ℝ(s)=π^{−s/2}Γ(s/2), Γ_ℂ(s)=2(2π)^{−s}Γ(s), and Λ is the product of the full finite and infinite factors. For a real regular odd-rank system, the determinant-to-sign conversion must include the rank parity recorded in E16.

Hypotheses:

- Partial Euler product: weakly compatible, pure of weight w, monic degree-n Q_v, finite ramification set and actual number-field norm.
- Completed product: regular, pure, strictly compatible; real sign data compatible with the Hodge pairing. Arbitrary hodge and hodgeSign fields alone do not ensure this.

Proof route:

1. The W_ℂ-representation at a complex place is ⊕_τ ⊕_{h ∈ H_τ} z^{−h} z̄^{h−w}-type characters; at a real place one adds the eigenvalues of complex conjugation on the pairs h = w/2.
2. The Γ-factor of a character or a two-dimensional induced representation of W_ℝ is the standard one (Tate's thesis for GL₁, Langlands' for W_ℝ).

Direct prerequisites: [ML.0/archimedean-langlands-conventions](#target-archimedean-langlands-conventions), `PotentialModularityAndCompatibleSystems:R24.5:operations`, `PotentialModularityAndCompatibleSystems:R24.5/system-l-functions`.

Consumers:

- [ML.2/compatible-system-l-function-continuation](#target-compatible-system-l-function-continuation): meromorphic continuation and functional equation of Λ(R, s)
- [ML.3/completed-symmetric-power-l-function](#target-completed-symmetric-power-l-function): Λ(Sym^n E, s)
- `Allen et al. 2023, §7.1`: the functional equation for symmetric powers of elliptic curves over CM fields

Planning API:

- `TauCeti.LanglandsRegister.partialL` — L^S(R,s)=∏ q_v^{ns}/Q_v(q_v^s), equivalently ∏ det(1−q_v^{−s}Frob_v)^{−1}, for Re s>1+w/2.
- `TauCeti.LanglandsRegister.archimedeanFactor` — L_v(R, s) for v | ∞ from the Hodge–Tate data and complex conjugation.
- `TauCeti.LanglandsRegister.completedL` — Import Λ(R,s) with all finite and archimedean factors for regular pure strictly compatible systems; do not infer bad factors from weak compatibility.
- `TauCeti.LanglandsRegister.partialL_converges` — Absolute convergence for Re s > 1 + w/2 (purity).
- `TauCeti.LanglandsRegister.archimedeanFactor_directSum` — L_v(R ⊕ R′, s) = L_v(R, s)·L_v(R′, s).
- `TauCeti.LanglandsRegister.archimedeanFactor_tate` — L_v(R(1), s) = L_v(R, s + 1) (twist by the cyclotomic character).

Definition tests:

- `TauCeti.LanglandsRegister.archFactor_trivial_Q` (computation) — R = the trivial character of G_ℚ: L_∞(R, s) = Γ_ℝ(s) and Λ(R, s) = π^{−s/2}Γ(s/2)ζ(s).
- `TauCeti.LanglandsRegister.archFactor_ellipticCurve` (computation) — R = H¹ of an elliptic curve over ℚ: L_∞(R, s) = Γ_ℂ(s) = 2(2π)^{−s}Γ(s).
- `TauCeti.LanglandsRegister.archFactor_sign_character` (non-example) — The quadratic character of ℚ(i): L_∞ = Γ_ℝ(s + 1), not Γ_ℝ(s) — the sign of complex conjugation matters.
- `TauCeti.LanglandsRegister.partialL_rank_zero` (degenerate) — The zero system has L^S = 1 and Λ = 1.

Acceptance controls:

- For R = H¹ of an elliptic curve over ℚ (weight 1) the archimedean factor is Γ_ℂ(s).

Sources: [P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999), §7.1, definition of purity and the paragraph after it, arXiv v2 pp. 197–198 (Annals p. 1092 per routed locator).

Suggested signature: omitted until C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-nt26-normalisation-bridge"></a>

### Newton–Thorne's normalisations against BLGGT's and the atlas's Galois conventions

Target `ML.0/nt26-normalisation-bridge`; comparison. Proposed declaration: `TauCeti.LanglandsRegister.ntBridge`.

Newton–Thorne §1.2 uses geometric Frobenius, HT(ε)={−1}, and Tate-normalized rec^T(π_v)=rec(π_v⊗|det|^{(1−n)/2}), agreeing with BLGGT. Replacing geometric by arithmetic Frobenius evaluates the same representation on inverse elements; it does not by itself dualize the representation or change its Hodge–Tate weights. If IHG.3/R19 independently supplies a dual/cohomological realization dictionary r_atlas(π)≅r_NT(π)^∨, then that dictionary gives HT(r_atlas)=−HT(r_NT). Its exact provenance remains to be established.

Hypotheses:

- Registry node; every ML.3 statement taken from Newton–Thorne is read in these conventions.

Proof route:

1. Compare Newton–Thorne §1.2 with BLGGT §2.1; both use the same geometric-Frobenius convention.
2. Inverting Frobenius only inverts its matrix. A duality bridge is a separate hypothesis concerning the realization; once supplied, the Hodge–Tate sign change follows from duality.

Direct prerequisites: [ML.0/blggt-normalization-register](#target-blggt-normalization-register), `AutomorphicGaloisRepresentationsPartII:AG2.0`.

Acceptance controls:

- Test on GL₁: r_ι(|·|^{−1}) is the p-adic cyclotomic character in both conventions after the dual is taken.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2 Notation, p. 8 (arXiv v2) (geometric-Frobenius Art_K, rec^T, r_{π,ι}, HT convention); Frob_v convention p. 7.

Suggested signature: omitted until C-GALOIS supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-compatible-system-automorphic-l-function-comparison"></a>

### L-functions of the compatible system of an automorphic representation

Target `ML.0/compatible-system-automorphic-l-function-comparison`; theorem. Proposed declaration: `TauCeti.LanglandsRegister.completedL_automorphic`.

Let π be regular algebraic cuspidal and let R_π be its attached compatible system. Unramified local–global compatibility implies L^S(R_π,s)=L^S(π,s+(1−n)/2) on a right half-plane, hence on any common meromorphic continuation. For equality at infinity in the ACC+ argument require R_π pure and the density-one generic-irreducibility hypothesis of ACC+ Theorem 7.1.1 (and its applicable field setting); matching Hodge weights alone does not supply real signs. Equality of full completed functions additionally requires compatibility at every ramified finite place and coherent epsilon factors. Under these named hypotheses Λ(R_π,s) inherits the corresponding shifted automorphic continuation and functional equation.

Hypotheses:

- π regular algebraic cuspidal; R_π attached through the appropriate AG2.2 realization and local–global compatibility.
- For the archimedean comparison via ACC+ Theorem 7.1.1: purity and its density-one generic-irreducibility condition. For the completed comparison: all finite Weil–Deligne and epsilon-factor compatibilities.

Proof route:

1. Use the reciprocal Euler polynomial obtained from unramified local–global compatibility, with the shift (1−n)/2.
2. Use ACC+ Theorem 7.1.1 only with its purity and density-one generic-irreducibility inputs; obtain any missing ramified comparison from a named AG2 supplier rather than from almost-everywhere equality.
3. Apply AL.2 to the full matched automorphic function. The typed realization and local-factor compatibilities are exactly the C-GALOIS/C-SYSTEM/C-AUTOMORPHIC supplier contracts.

Direct prerequisites: [ML.0/compatible-system-archimedean-factors](#target-compatible-system-archimedean-factors), [ML.0/blggt-normalization-register](#target-blggt-normalization-register), `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

Acceptance controls:

- For n = 2 and π attached to an elliptic curve E/ℚ: L(R_π, s) = L(E, s) and Λ(E, s) = N^{s/2}Γ_ℂ(s)L(E, s) satisfies Λ(E, s) = ±Λ(E, 2 − s).

Sources: [P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999), §7.1, paragraph after the proof of Lemma 7.1.10 (before Theorem 7.1.11), arXiv v2 p. 200 (Annals p. 1095).

Suggested signature: omitted until C-GALOIS supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-endpoint-status-register"></a>

### The endpoint register: statement, source version, status and producers

Target `ML.0/endpoint-status-register`; definition. Proposed declaration: `TauCeti.LanglandsRegister.EndpointRecord`.

An endpoint record stores its proposition P, source/locator s, status tag σ∈{known,conditional,conjectural}, finite list H of named mathematical hypotheses, and producer references D. A known record contains a proof of P and no hypotheses; a conditional record contains a proof that all H imply P; a conjectural record records the assertion without a proof. These stored tags do not automatically compute dependency closure. Upgrading a conditional record requires proofs of every member of H. If H=[], its conditional proof establishes P outright, so an upgraded known record can be constructed, while its original tag remains conditional. Verification that all producer chains supply their asserted statements is a separate dependency-verification obligation.

Hypotheses:

- Registry data; it states no mathematics of its own.

Proof route:

1. Record the exact source theorem and named conditional inputs; this is status bookkeeping, not a replacement for their typed mathematical hypotheses.
2. Check producer closure separately; the current Lean EndpointRecord does not compute it from D.

Direct prerequisites: [ML.0/blggt-version-register](#target-blggt-version-register).

Consumers:

- [ML.2/cg18-conditional-potential-modularity](#target-cg18-conditional-potential-modularity): recorded as conditional on Calegari–Geraghty's Conjecture B
- [ML.4/gsp4-arthur-classification](#target-gsp4-arthur-classification): recorded as conditional on ML.0/arthur-dependency-gate
- [ML.0/weight-22-abelian-variety-conjecture](#target-weight-22-abelian-variety-conjecture): recorded as conjectural
- [ML.3/non-cm-symmetric-powers](#target-non-cm-symmetric-powers): recorded as known (Newton–Thorne II, Theorem A)

Planning API:

- `TauCeti.LanglandsRegister.EndpointRecord` — A record (P, source, status, hypotheses, producers).
- `TauCeti.LanglandsRegister.Status` — The three statuses known, conditional and conjectural.
- `TauCeti.LanglandsRegister.EndpointRecord.holds_of_hypotheses` — For a conditional record, (∀ h ∈ H, h) → P.
- `TauCeti.LanglandsRegister.EndpointRecord.upgrade` — From a conditional record and proofs of all its hypotheses, a known record with the same statement.
- `TauCeti.LanglandsRegister.EndpointRecord.known_holds` — A known record yields a proof of P.

Definition tests:

- `TauCeti.LanglandsRegister.EndpointRecord.arithmetic_known` (computation) — A record of the concrete assertion 2+2=4 with its proof has tag known and an empty hypothesis list. NT II Theorem A is separately catalogued as known in the reader; this test does not construct its missing signature.
- `TauCeti.LanglandsRegister.EndpointRecord.arithmetic_conditional` (computation) — A conditional record of 3=4 with the explicit named hypothesis 1=2 retains the conditional tag and its single hypothesis. The implication is proved from that concrete hypothesis; there is no proof of the assertion alone.
- `TauCeti.LanglandsRegister.EndpointRecord.arithmetic_conjectural` (computation) — A conjectural record of 3=4 stores no proof. In particular, constructing the record is distinct from proving its assertion. The mathematical weight-(2,2) endpoint is separately catalogued as conjectural.
- `TauCeti.LanglandsRegister.EndpointRecord.unrelated_proof_not_upgrade` (non-example) — A known record of 2=2 cannot satisfy the missing hypothesis 1=2 of a conditional record. The upgrade interface takes proofs of the actual listed assertions; an unrelated known record is not such an argument.
- `TauCeti.LanglandsRegister.empty_hypotheses` (degenerate) — For a conditional record with H = [], holds_of_hypotheses proves its assertion without inputs and upgrade can produce a known record; the original conditional tag need not equal known.

Acceptance controls:

- Each endpoint of ML.1–ML.5 has a status read off from its record, and a map to its prerequisite constructions (the acceptance criterion of ML.0).

Sources: [Frank Calegari, David Geraghty, Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224), Theorem 1.1(1), §1, p. 3 (arXiv v2) = Invent. p. 300; proof §10, pp. 96–98 (arXiv v2) = Invent. pp. 428–429.

Suggested signature: stated with its API and tests.

<a id="target-nt26-automorphy-predicate"></a>

### Automorphic Galois representations in Newton–Thorne's sense

Target `ML.0/nt26-automorphy-predicate`; definition. Proposed declaration: `TauCeti.LanglandsRegister.IsAutomorphicNT`.

Let F be a totally real or CM number field and p a prime. A continuous representation ρ : G_F → GL_n(Q̄_p) is automorphic if there are a RAESDC or RAECSDC (regular algebraic, essentially (conjugate) self-dual, cuspidal) automorphic representation π of GL_n(𝔸_F) and an isomorphism ι : Q̄_p ≅ ℂ with ρ ≅ r_{π,ι}, normalised as in ML.0/nt26-normalisation-bridge. The definition forces ρ to be (conjugate-)self-dual up to twist and conjecturally irreducible; Newton–Thorne note that it is not the most general one could adopt.

Hypotheses:

- F totally real or CM; p prime; π RAESDC or RAECSDC, so that r_{π,ι} exists (AutomorphicGaloisRepresentationsPartII AG2.2).

Proof route:

1. Use the automorphy definition in the paragraph before Newton–Thorne Lemma 2.1, in the pinned realization conventions of ML.0.
2. Compare with the actual BLGGT polarized-pair definition from PL.0. Fix the Hecke polarization character and its realized multiplier, then use strong multiplicity one and Chebotarev on the same representation; retain that character compatibility in the exported comparison.

Direct prerequisites: [ML.0/nt26-normalisation-bridge](#target-nt26-normalisation-bridge), `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`, `AutomorphicGaloisRepresentationsPartII:AG2.2`.

Consumers:

- `Newton–Thorne 2026, Lemma 2.1`: the one-prime criterion: automorphy of Sym^{n−1}r_ι(π) at one prime gives Sym^{n−1}π
- [ML.3/one-prime-criterion](#target-one-prime-criterion): the statement SP_n in Galois terms
- [ML.3/sp-statement](#target-sp-statement): SP_n is defined through this predicate

Planning API:

- `TauCeti.LanglandsRegister.IsAutomorphicNT` — ρ≅r_{π,ι} for some regular algebraic essentially (conjugate) self-dual CUSPIDAL π and an isomorphism ι:Q̄_p≅ℂ. An isobaric sum does not qualify.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.of_iso` — Invariant under isomorphism of ρ.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.twist` — ρ automorphic and χ an algebraic Hecke character's Galois character ⇒ ρ ⊗ r_ι(χ) automorphic.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.iff_blggt` — For an irreducible polarized pair (ρ,µ) with the actual compatible automorphic polarization character in the BLGGT convention: IsAutomorphicNT ρ iff the pair (ρ,µ) is BLGGT-automorphic. The multiplier/Hecke-character comparison is part of the supplier contract; irreducibility alone is not asserted to make an unspecified multiplier unique.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.irreducible` — Conjectural consequence: the cuspidal realization is expected irreducible in general. No theorem asserting this is proposed; use proved rank-two irreducibility or the precise density/regularity results when applicable.

Definition tests:

- `TauCeti.LanglandsRegister.IsAutomorphicNT.ellipticCurve` (computation) — For E/ℚ, the cohomological realization H¹_et(E_{ℚ̄},Q̄_p) (the dual of the usual Tate module) is automorphic via its weight-two form, in the NT convention HT(ε_p)={−1}; the Tate-module duality is explicit.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.character` (degenerate) — n = 1: ρ is automorphic iff ρ = r_ι(χ) for an algebraic Hecke character χ (class field theory).
- `TauCeti.LanglandsRegister.IsAutomorphicNT.reducible_not` (non-example) — ρ = 1 ⊕ ε_p^{−1} is not automorphic in this sense: an isobaric sum is not cuspidal.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.weightOne_not` (non-example) — The Galois representation of a weight-one newform is not automorphic in this sense: π is not regular algebraic.

Acceptance controls:

- The predicate depends only on ρ up to isomorphism and is independent of ι when π is cohomological (r_ι(π) for another ι′ is r_{ι′}(π′) for a Galois conjugate π′).

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §2 ('Some comforting lemmas'), opening paragraph immediately before Lemma 2.1, p. 9 (arXiv v2).

Suggested signature: omitted until C-GALOIS supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-arthur-dependency-gate"></a>

### Arthur dependency register: the conditional status of the endoscopic classification

Target `ML.0/arthur-dependency-gate`; comparison. Proposed declaration: `TauCeti.LanglandsRegister.arthurGate`.

Arthur's endoscopic classification for quasi-split symplectic and orthogonal groups (2013), and the results deduced from it — Mok's classification for quasi-split unitary groups, Kaletha–Mínguez–Shin–White for their inner forms, Gee–Taïbi's classification for GSp₄, Xu's packets and multiplicity formula for GSp_{2n}, Ishimoto's for non-split odd orthogonal groups — are recorded with status conditional. Arthur's book rests on his Hypothesis 3.2.1 (stabilisation of the twisted trace formula of GL(N) and SO(2n)) and on his announced references [A24]–[A27]. The stabilisation is Mœglin–Waldspurger's (2016), [A24] is settled there, and [A25]–[A27] are proved by Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, so that the one remaining hypothesis is the twisted weighted fundamental lemma, which Mœglin–Waldspurger state as [MW, II.4.4] and which reduces to the weighted fundamental lemma for Lie algebras of non-split groups and its non-standard version (no written proof; the split case is Chaudouard–Laumon). Every endpoint using one of these classifications carries this hypothesis visibly; the register does not claim that the weighted fundamental lemma follows from the (proved) unweighted one.

Hypotheses:

- Registry; the hypothesis it names is carried by every consumer.

Proof route:

1. The stabilisation of the twisted trace formula is proved by Mœglin–Waldspurger (2016); the remaining inputs are as stated by Atobe–Gan–Ichino–Kaletha–Mínguez–Shin §§0.3–0.4 (ML.4/trace-formula-inputs-register).
2. BCGP 2021 §1.4.1 and 2025 §1.6 and CG 2020 §1.4 state the dependence for the GSp₄ results they use.

Direct prerequisites: [ML.0/endpoint-status-register](#target-endpoint-status-register).

Acceptance controls:

- Every node of ML.4 with Arthur's, Mok's, KMSW's, Gee–Taïbi's or Xu's results among its inputs lists this register.

Sources: [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), §1.4.1 'The work of Arthur', p. 14 (arXiv v3); [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645v1), §1.6 'The work of Arthur', pp. 7–8 (arXiv v1); [Hiraku Atobe, Wee Teck Gan, Atsushi Ichino, Tasho Kaletha, Alberto Mínguez, Sug Woo Shin, Local intertwining relations and co-tempered A-packets of classical groups](https://arxiv.org/pdf/2410.13504), Abstract, p. 1 (arXiv v3); [James Arthur, The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](http://web.archive.org/web/20120511125150id_/http://claymath.org/cw/arthur/pdf/Book.pdf), §3.2, Hypothesis 3.2.1, p. 137; Preface p. xvi (2011 manuscript).

Suggested signature: omitted until C-ARTHUR supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-expected-crystallinity-newton-above-hodge"></a>

### Expected de Rham and crystalline properties of GSp₄ Galois representations in singular weight (Pilloni Remark 5.3.2)

Target `ML.0/expected-crystallinity-newton-above-hodge`; definition. Proposed declaration: `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge`.

ExpectedSingularWeightHodge is the proposition: for a system of Hecke eigenvalues Θ occurring in the coherent cohomology H^i(S^tor_{K,Σ}, Ω^{(k,r)}), (k, r) ∈ ℤ_{≥0} × ℤ (or its cuspidal version), of the Siegel threefold, the attached semisimple ρ_{Θ,λ} : G_ℚ → GL₄(E_λ) is de Rham at p with Hodge–Tate weights (0, r − 2, r + k − 1, k + 2r − 3) (cyclotomic character of weight −1), crystalline at p if (N, p) = 1, with Newton polygon above the Hodge polygon. Status: conjectural in general; in cohomological weight (r ≠ 2, k + r ≠ 1, k + 2r ≠ 3) the Newton-above-Hodge statement is a consequence of V. Lafforgue's theorem.

Hypotheses:

- Frontier statement; status conjectural (cohomological weight: Newton above Hodge known).

Proof route:

1. Definition of the proposition only.

Direct prerequisites: `PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified`, [ML.0/endpoint-status-register](#target-endpoint-status-register).

Consumers:

- `Pilloni 2020, Remark 5.3.2`: expectation, not used in proofs
- [ML.0/endpoint-status-register](#target-endpoint-status-register): recorded as conjectural, partly known

Planning API:

- `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge` — The proposition stated.
- `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge.hodgeTate` — The expected Hodge–Tate weights are (0, r − 2, r + k − 1, k + 2r − 3).
- `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge.cohomological` — For k ≥ 0 in cohomological weight the Hodge–Tate weights are pairwise distinct.

Definition tests:

- `TauCeti.LanglandsRegister.hodgeTate_k2_r1` (computation) — k = 2, r = 1 (a cohomological weight: r ≠ 2, k + r ≠ 1, k + 2r ≠ 3): the expected weights (0, −1, 2, 1) are distinct.
- `TauCeti.LanglandsRegister.hodgeTate_singular` (non-example) — r = 2: the weights (0, 0, k + 1, k + 1) repeat, so the weight is not cohomological.
- `TauCeti.LanglandsRegister.hodgeTate_degenerate` (degenerate) — k = 0, r = 2: the weights are (0, 0, 1, 1), those of H¹ of an abelian surface.

Acceptance controls:

- Pilloni Theorem 5.3.1 constructs ρ_{Θ,λ}; the expectation concerns its p-adic Hodge theory.

Sources: [Vincent Pilloni, Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §5.3, Remark 5.3.2, p. 25 (author version); [Vincent Pilloni, Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §5.3, Remark 5.3.2, p. 26 (author version).

Suggested signature: omitted until C-COHERENT-GEOMETRY supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

### ML.0 acceptance and supplier refinements

Check every target at the displayed hypotheses and source scope, every definition against its negative controls, and every direct prerequisite against the exact export. The target-level chains end in a baseline declaration, a checked external node, a requested supplier stage or the named gaps below.

- Obtain C-GALOIS/C-AUTOMORPHIC/C-SYSTEM coherent realization, local parameter and L-factor exports, then replace each explicitly omitted signature.
- Resolve the optional cohomological duality dictionary and the R24.5 odd-rank gamma correction.

## Layer ML.1: Weight one and broader modularity

Keep the weight-one Artin branch, totally real finite-image branch, residual modularity and prescribed weight-two lifts separate. Low-rank transfers and their general lift predicates live here as early inputs to symmetric-power endpoints. The imaginary-quadratic elliptic application retains the exact potentially semistable lifting extension and modular-curve point construction.

Atlas planets: Strong Artin conjecture; Irregular compatible systems come from weight one; Modularity over imaginary quadratic fields.

<a id="target-buzzard-taylor-hypotheses"></a>

### Finitely many points with finite image make R[1/p] reduced (Calegari–Geraghty Lemma 4.14 and the Buzzard–Taylor remark)

Target `ML.1/buzzard-taylor-hypotheses`; theorem. Proposed declaration: `TauCeti.WeightOne.reduced_of_finitePoints`.

Let F be a number field, k a finite field of characteristic p, S a finite set of places not containing any v | p, and ρ̄ : G_{F,S} → GL₂(k) continuous and absolutely irreducible with universal deformation ring R. If the Galois representation of every Q̄_p-point of R has finite image and R has only finitely many Q̄_p-points, then R[1/p] is reduced. For F = ℚ and ρ̄ modular these hypotheses can often be deduced from Buzzard–Taylor and Buzzard (companion forms and analytic continuation of overconvergent weight-one forms), which is how Calegari–Geraghty's weight-one modularity results connect to the classical ones.

Hypotheses:

- Unramified-at-p deformation problem (S contains no place above p); ρ̄ absolutely irreducible.

Proof route:

1. Calegari–Geraghty's proof: the points of R[1/p] with finite image are unobstructed (H¹ of a finite-image representation in characteristic 0 is computed by inflation–restriction), so R[1/p] is étale at them.
2. The remark: Buzzard–Taylor show that unramified-at-p lifts of modular ρ̄ come from weight-one forms, which have finite image and are finite in number.

Direct prerequisites: `AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation`, `GlobalGaloisDeformations:R04.2/universal-deformation-ring`.

Acceptance controls:

- The remark only says 'often'; the hypotheses are not claimed in general.

Sources: [Frank Calegari, David Geraghty, Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224), Lemma 4.14, §4.2, p. 52 (arXiv v2) = Invent. pp. 366–367; proof pp. 52–53 = Invent. pp. 367–368; [Frank Calegari, David Geraghty, Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224), §4.2, remark after the proof of Lemma 4.14, p. 53 (arXiv v2) = Invent. p. 368.

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-ARTIN supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-irregular-systems-weight-one"></a>

### Irregular odd compatible systems arise from weight-one newforms (Khare–Wintenberger, Theorem 10.1(ii))

Target `ML.1/irregular-systems-weight-one`; theorem. Proposed declaration: `TauCeti.WeightOne.weightOne_of_irregular`.

Let (ρ_ι) be a two-dimensional compatible system of representations of G_ℚ (E-rational, continuous, semisimple, finitely ramified ρ_ι : G_ℚ → GL₂(Q̄_ℓ) for every ℓ and ι : E ↪ Q̄_ℓ, with Weil–Deligne compatibility at q ∤ ℓ and crystalline at q | ℓ with Hodge–Tate weights (a, b) for ℓ ≫ 0) which is irregular (a = b), irreducible and odd. Then, up to twist, (ρ_ι) arises from a newform of weight one; in particular, after twisting to Hodge–Tate weights (0, 0), every ρ_ι has finite image.

Hypotheses:

- The compatible system in Khare–Wintenberger's sense (§5): weakly compatible, crystalline only for ℓ ≫ 0.

Proof route:

1. Twist so that the weights are (0, 0); Sen–Fontaine: ρ_ι is unramified at ℓ for almost all ℓ.
2. Residual irreducibility of ρ̄_λ for almost all λ (PotentialModularityAndCompatibleSystems R24.6).
3. Strong form of Serre's conjecture (ClassicalSerreModularity R27.6) with Gross's tameness criterion and Coleman–Voloch (SerreWeightAndLevelOptimisation R20.3): for almost all λ, ρ̄_λ arises from S₁(Γ₁(N)) with N independent of λ.
4. Khare's weight-one descent (owner ClassicalSerreModularity R27.6/weight-one-descent-from-infinitely-many-primes: since S₁(Γ₁(N)) has finitely many newforms, one f has ρ̄_λ ≅ ρ̄_{f,λ} for infinitely many λ, hence ρ_ι ≅ ρ_{f,ι}). Khare–Wintenberger only sketch this step, citing Khare's IMRN 1997 note, which was not available.

Direct prerequisites: `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes`, `ClassicalSerreModularity:R27.6/unramified-residual-representations-arise-in-weight-one`, `ClassicalSerreModularity:R27.6/full-classical-serre-theorem`, `PotentialModularityAndCompatibleSystems:R24.6/residual-members`, `PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified`, `SerreWeightAndLevelOptimisation:R20.3/weight-one-forms-unramified-at-p`, `AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation`.

Acceptance controls:

- The converse: newforms of weight one give irregular irreducible odd compatible systems (Deligne–Serre).

Sources: [Chandrashekhar Khare, Jean-Pierre Wintenberger, Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Theorem 10.1(ii), §10.1, p. 20 (author copy results.pdf); [Chandrashekhar Khare, Jean-Pierre Wintenberger, Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 10.1(ii), p. 20 (author copy results.pdf); [Chandrashekhar Khare, Jean-Pierre Wintenberger, Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §5, p. 8 (author copy results.pdf).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-ARTIN supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-non-solvable-residual-modularity"></a>

### Modularity of non-solvable mod 5 representations of totally real fields with cyclotomic determinant

Target `ML.1/non-solvable-residual-modularity`; theorem. Proposed declaration: `TauCeti.WeightOne.mod5_nonsolvable_modular`.

Let E be totally real with 5 unramified, and ϱ̄:G_E→GL₂(F₅) totally odd with det ϱ̄=ε̄^{−1} and nonsolvable projective image. The residual representation is modular, by the elliptic-curve construction, solvable base change and descent used in BCGP Proposition 10.1.3. Applying Pilloni–Stroh Proposition 2.1.3 requires first twisting the determinant to ε̄ and passing to a solvable totally real extension where the projective image is PSL₂(F₅); it is not a direct application to PGL₂(F₅). Separately, Snowden Theorem 7.2.1 constructs finitely many weight-two lifts for a specified lifting problem exactly when that problem has local solutions at every designated place. It does not promise lifts of incompatible types or determinants.

Hypotheses:

- Residual modularity: E totally real, 5 unramified, det ϱ̄=ε̄^{−1}, total oddness and nonsolvable projective image.
- Lifting subclaim: Snowden assumptions (A1),(A2), an odd residual representation, a finite set Σ containing ramification and the places above 5, a finite-order ψ lifting det ϱ̄/ε̄, definite local types and inertial types, and a local weight-two lift of determinant ψε at every v∈Σ. The projective-PGL₂(F₅) exceptional case needs [E(ζ₅):E]=4. Assumption (A1) is absolute irreducibility after restriction to G_{E(ζ₅)}; (A2) is that degree-four condition in the projective-PGL₂(F₅) case.

Proof route:

1. Residual modularity: SBT/Taylor's moduli of elliptic curves with ϱ̄ ≅ E[5] and Moret-Bailly over a solvable extension, then solvable descent of modularity (BCGP cite Pilloni–Stroh Proposition 2.1.3).
2. Lifts: Snowden Theorem 7.2.1; modularity of lifts: Kisin's theorem (GL2ModularityLifting).

Direct prerequisites: `PotentialModularityAndCompatibleSystems:R23.1`, `AutomorphicGaloisRepresentations:R19.2`, `GL2ModularityLifting:R22.5`.

Acceptance controls:

- The p = 5 case of BCGP Proposition 10.1.3.

Sources: [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Proof of Proposition 10.1.3, p. 266 (arXiv v3); [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Proof of Proposition 10.1.3, p. 266 (arXiv v3); [Vincent Pilloni and Benoît Stroh, Surconvergence, ramification et modularité](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Artinfinal.pdf), §2.1, Lemmas 2.1.1–2.1.2 and Proposition 2.1.3, pp. 9–10; [Andrew Snowden, On two dimensional weight two odd representations of totally real fields](https://arxiv.org/pdf/0905.4266), §7.2, Theorem 7.2.1 and definition of a lifting problem, pp. 20–21; §3.1, (A1)–(A2), p. 6.

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-ARTIN supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-functorial-lift"></a>

### Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N

Target `ML.3/functorial-lift`; definition. Proposed declaration: `TauCeti.Functoriality.IsFunctorialLift`.

Let F be a number field, π a cuspidal automorphic representation of GL_n(𝔸_F) and R : GL_n → GL_N an algebraic representation. A functorial lift of π along R is an automorphic representation R(π) of GL_N(𝔸_F) (isobaric) such that for every place v the Langlands parameter of R(π)_v is R ∘ rec(π_v), where rec is the local Langlands correspondence for GL_n(F_v) (Harris–Taylor, Henniart at finite v; Langlands at infinite v). By strong multiplicity one for isobaric representations R(π) is unique if it exists. A weak lift asks the matching only at almost all v; CKPSS's 'functorial lift' from classical groups asks it at the archimedean places and at almost all unramified finite places.

Hypotheses:

- F a number field; π cuspidal on GL_n(𝔸_F); R algebraic.

Proof route:

1. Local parameters: SUPP LLC for GL_n (EndoscopicTransferAndUnitaryTraceComparison ET.6) and archimedean ML.0.
2. Uniqueness: Jacquet–Shalika strong multiplicity one for isobaric sums (AutomorphicLFunctionsAndLocalFactors AL.3).

Direct prerequisites: `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, [ML.0/archimedean-langlands-conventions](#target-archimedean-langlands-conventions), `AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`.

Consumers:

- [ML.3/gelbart-jacquet](#target-gelbart-jacquet): R = Sym² (and Ad) on GL₂
- [ML.3/kim-shahidi-sym3](#target-kim-shahidi-sym3): R = Sym³ on GL₂ and std ⊗ std on GL₂ × GL₃
- [ML.3/kim-sym4](#target-kim-sym4): R = Sym⁴ on GL₂ and ∧² on GL₄
- `Newton–Thorne 2021, §1`: symmetric power functoriality is the case R = Sym^m

Planning API:

- `TauCeti.Functoriality.IsFunctorialLift` — Π is a functorial lift of π along R: rec(Π_v) ≅ R ∘ rec(π_v) at every place.
- `TauCeti.Functoriality.IsWeakLift` — The same at almost all unramified places (Satake parameters).
- `TauCeti.Functoriality.IsFunctorialLift.unique` — Two functorial lifts of π along R are isomorphic (strong multiplicity one).
- `TauCeti.Functoriality.IsFunctorialLift.toWeak` — A functorial lift is a weak lift.
- `TauCeti.Functoriality.IsFunctorialLift.comp` — If Π is a lift of π along R, Π lies in the input domain of the second lift, and Π′ is a lift of Π along R′, then Π′ is a lift of π along R′∘R. For the cuspidal input definition this requires Π cuspidal; isobaric composition uses the supplied extension to that domain.
- `TauCeti.Functoriality.IsFunctorialLift.id` — π is its own lift along the identity.
- `TauCeti.Functoriality.IsFunctorialLift.lFunction` — L(s, R(π)) = L(s, π, R), the Langlands L-function of π along R.

Definition tests:

- `TauCeti.Functoriality.lift_det` (computation) — R = det on GL₂: the lift of π is the central character ω_π (a Hecke character), by local class field theory.
- `TauCeti.Functoriality.lift_gl1` (degenerate) — n = 1, R = χ ↦ χ^k: the lift of a Hecke character χ is χ^k.
- `TauCeti.Functoriality.lift_sym2_dihedral_not_cuspidal` (non-example) — For π = AI_{K/F}(θ) dihedral, Sym²π exists but is not cuspidal: it is AI(θ²) ⊞ θ|_{𝔸_F^×} (whereas Ad(π) = AI(θ/θ^σ) ⊞ η_{K/F}).
- `TauCeti.Functoriality.lift_std` (compatibility) — R = std: the lift of π is π itself, and IsFunctorialLift agrees with equality of rec at every place.

Acceptance controls:

- R = Sym^{n−1} on GL₂ recovers ML.3/symmetric-power-lifting; R = std ⊗ std′ on GL₂ × GL₂ is Ramakrishnan's lift.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3), Introduction, 'Context', p. 1 (arXiv:1912.11261v3).

Suggested signature: omitted until C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-gelbart-jacquet"></a>

### Gelbart–Jacquet: the symmetric square (adjoint) lift from GL₂ to GL₃

Target `ML.3/gelbart-jacquet`; theorem. Proposed declaration: `TauCeti.Functoriality.gelbartJacquet`.

Let π be a cuspidal automorphic representation of GL₂(𝔸_F), F a number field. Then Sym²π (equivalently Ad(π) = Sym²π ⊗ ω_π^{−1}) exists as an automorphic representation of GL₃(𝔸_F) in the sense of ML.3/functorial-lift, and Ad(π) is cuspidal iff π is not dihedral (not automorphically induced from a Hecke character of a quadratic extension).

Hypotheses:

- F a number field; π cuspidal on GL₂(𝔸_F).

Proof route:

1. Gelbart–Jacquet (Ann. Sci. ÉNS 1978): Shimura's integral representation of L(s, Ad π) and the converse theorem for GL₃.
2. Local compatibility at every place by the local theory of Gelbart–Jacquet and the local Langlands correspondence for GL₂.

Direct prerequisites: [ML.3/functorial-lift](#target-functorial-lift), `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet`.

Acceptance controls:

- For π attached to a non-CM elliptic curve over ℚ, Ad(π) is cuspidal on GL₃; for a CM curve it is not.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3), Introduction, 'Context', p. 1 (arXiv:1912.11261v3); [Stephen Gelbart, Hervé Jacquet, A relation between automorphic representations of GL(2) and GL(3)](http://www.numdam.org/item/ASENS_1978_4_11_4_471_0.pdf), §9, (9.3) Theorem, p. 534 (Ann. Sci. ÉNS 11).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-ARTIN supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-ramakrishnan-tensor-product"></a>

### Ramakrishnan: the automorphic tensor product GL₂ × GL₂ → GL₄

Target `ML.3/ramakrishnan-tensor-product`; theorem. Proposed declaration: `TauCeti.Functoriality.ramakrishnan`.

For cuspidal π,π′ on GL₂(𝔸_F), Ramakrishnan Theorem M constructs an isobaric π⊠π′ on GL₄ with local Rankin–Selberg L- and epsilon-factors at all finite places and L-factors at infinity. If neither is dihedral, it is cuspidal iff π′ is not a Hecke-character twist of π. If π′=AI_{K/F}(μ) for quadratic K/F, it is cuspidal iff BC_K(π) is cuspidal and is not isomorphic to BC_K(π)⊗(μ∘θ)μ^{−1}, θ the nontrivial automorphism. This latter criterion is not replaced by a blanket exclusion of only both-dihedral pairs.

Hypotheses:

- F a number field; π₁, π₂ cuspidal on GL₂(𝔸_F).

Proof route:

1. Ramakrishnan (Ann. of Math. 2000): Rankin–Selberg theory for GL₂ × GL₂ twisted by GL₂ and GL₁, and the converse theorem of Cogdell–Piatetski-Shapiro for GL₄.

Direct prerequisites: [ML.3/functorial-lift](#target-functorial-lift), `AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`.

Acceptance controls:

- Newton–Thorne II Appendix A use GL₂ × GL₂ → GL₄ for icosahedral weight-one forms.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms, II](https://arxiv.org/pdf/2009.07180v2), Appendix A, proof of Theorem A.1, p. 28 (arXiv:2009.07180v2); [Dinakar Ramakrishnan, Modularity of the Rankin–Selberg L-series, and multiplicity one for SL(2)](https://arxiv.org/pdf/math/0007203v1), §3, Theorem M, p. 54 (Ann. of Math. 152; arXiv:math/0007203v1).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-ARTIN supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-imaginary-quadratic-elliptic-modularity"></a>

### Modularity of elliptic curves over imaginary quadratic fields with X₀(15)(F) finite (Caraiani–Newton)

Target `ML.1/imaginary-quadratic-elliptic-modularity`; theorem. Proposed declaration: `TauCeti.WeightOne.ellipticCurve_modular_imagQuadratic`.

Let F be an imaginary quadratic field such that the Mordell–Weil group X₀(15)(F) is finite (for example F = ℚ(√−d), d = 1, 2, 3, 5). Then every elliptic curve E/F is modular: there is a cuspidal automorphic representation of GL₂(𝔸_F) of parallel weight 2 (or, when E has CM by a field embedding in F, an isobaric sum ψ ⊞ ψ^c of Hecke characters of F) whose L-function is L(E, s). More generally, if F is an imaginary CM field, Galois over ℚ with ζ₅ ∉ F, then 100% of Weierstrass equations over F, ordered by height, define modular elliptic curves.

Hypotheses:

- F imaginary quadratic with X₀(15)(F) finite (Theorem 1.1); F imaginary CM Galois over ℚ with ζ₅ ∉ F (Theorem 1.2).

Proof route:

1. Import the exact potentially semistable CM lifting theorem of Caraiani–Newton Theorem 1.3, with its residual image, polarization and local hypotheses, as the requested PA.4 extension. It is not supplied by PA.4’s ordinary/Fontaine–Laffaille endpoint alone.
2. Residual modularity of E[3] or E[5] (Allen–Khare–Thorne) and the 3–5 switch; analysis of the F-points of X₀(15) and related modular curves for the exceptional residual images.
3. These proofs are recorded as a gap: their lifting theorem and the modular-curve analysis are not planned here.

Direct prerequisites: `PotentialAutomorphyInfrastructure:PA.4`, `PotentialModularityAndCompatibleSystems:R23.1`, [ML.0/endpoint-status-register](#target-endpoint-status-register).

Acceptance controls:

- Over imaginary quadratic fields this is the first unconditional modularity theorem; potential modularity over CM fields is ML.3/acc-elliptic-symmetric-powers and ML.2.

Sources: [A. Caraiani, J. Newton, On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3), §1, Theorem 1.1 (Corollary 7.1.2), p. 2 (arXiv:2301.10509v3); [A. Caraiani, J. Newton, On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3), §1, Theorem 1.2 (Corollary 6.1.2), p. 3 (arXiv:2301.10509v3).

Suggested signature: omitted until C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-strong-artin-conjecture"></a>

### Langlands' conjecture for Artin representations (the strong Artin conjecture)

Target `ML.1/strong-artin-conjecture`; definition. Proposed declaration: `TauCeti.WeightOne.IsAutomorphicArtin`.

For a continuous irreducible finite-image complex representation ρ:G_K→GL_n(ℂ), the strong Artin predicate requires a cuspidal π on GL_n(𝔸_K) with rec(π_v)≅ρ|_{W_{K_v}} at every place, including ramified and infinite ones, so full L- and epsilon-factors match. Godement–Jacquet then implies entireness for nontrivial ρ. Almost-everywhere matching is a separate weak Artin predicate: strong multiplicity one gives uniqueness of π, but does not repair missing bad Euler factors or imply entireness of the full Artin function.

Hypotheses:

- K a number field; ρ continuous, irreducible, n-dimensional over ℂ.

Proof route:

1. Define full local matching using the Artin/automorphic local-factor suppliers. Apply Godement–Jacquet after equality of the full functions.
2. Strong multiplicity one proves uniqueness from the unramified places; it supplies no ramified comparison.

Direct prerequisites: `AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet`, `AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`, `AnalyticNumberTheory:AN.4`, [Chebotarev](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev), [ML.0/endpoint-status-register](#target-endpoint-status-register).

Consumers:

- `Khare–Wintenberger 2009, §10.2`: Corollary 10.2(ii) proves it for odd two-dimensional ρ over ℚ
- [ML.5/global-langlands-reciprocity-conjecture](#target-global-langlands-reciprocity-conjecture): its general form is reciprocity for finite image
- `Boxer–Calegari–Gee–Pilloni 2021, proof of Proposition 10.1.3`: the odd Artin conjecture over totally real fields

Planning API:

- `TauCeti.WeightOne.IsAutomorphicArtin` — ρ has a cuspidal π matching its local Weil parameter at every place (strong Artin), rather than merely outside a finite set.
- `TauCeti.WeightOne.IsAutomorphicArtin.lFunction_entire` — IsAutomorphicArtin ρ and ρ non-trivial ⇒ L(ρ, s) extends to an entire function.
- `TauCeti.WeightOne.IsAutomorphicArtin.of_iso` — Invariant under isomorphism of ρ.
- `TauCeti.WeightOne.IsAutomorphicArtin.twist` — IsAutomorphicArtin ρ ⇒ IsAutomorphicArtin (ρ ⊗ χ) for a finite-order character χ.
- `TauCeti.WeightOne.IsAutomorphicArtin.dim_one` — Every one-dimensional ρ is automorphic (class field theory).
- `TauCeti.WeightOne.IsAutomorphicArtin.unique` — The cuspidal π is unique (strong multiplicity one).

Definition tests:

- `TauCeti.WeightOne.artin_character` (degenerate) — For a finite-order Hecke character χ, its finite-image Galois character through global Artin reciprocity is automorphic with π=χ.
- `TauCeti.WeightOne.artin_dihedral` (computation) — ρ = Ind_{G_L}^{G_ℚ} χ for L imaginary quadratic and χ ≠ χ^c is automorphic, with π the automorphic induction of χ (weight-one theta series).
- `TauCeti.WeightOne.artin_reducible_not` (non-example) — ρ = 1 ⊕ 1 is not irreducible: the matching representation 1 ⊞ 1 is isobaric, not cuspidal, and L(ρ, s) = ζ(s)² has a pole.
- `TauCeti.WeightOne.artin_compat_deligneSerre` (compatibility) — For f a weight-one newform, the Deligne–Serre representation ρ_f (AutomorphicGaloisRepresentations R19.1) is automorphic with π = π_f.

Acceptance controls:

- n = 1 is class field theory; the proved two-dimensional cases are ML.1/odd-artin-modularity-over-q and ML.1/totally-real-odd-artin.

Sources: [Chandrashekhar Khare, Jean-Pierre Wintenberger, Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §10.2 — independently checked downloaded PDF p.20; published-copy pagination where applicable; [Chandrashekhar Khare, Jean-Pierre Wintenberger, Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §10.2, PDF/printed p.20 (author copy results.pdf).

Suggested signature: omitted until C-ARTIN supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-kim-shahidi-sym3"></a>

### Kim–Shahidi: functorial products GL₂ × GL₃ → GL₆ and the symmetric cube

Target `ML.3/kim-shahidi-sym3`; theorem. Proposed declaration: `TauCeti.Functoriality.kimShahidi`.

Let F be a number field, π a cuspidal automorphic representation of GL₂(𝔸_F) and σ one of GL₃(𝔸_F). Then the functorial product π ⊠ σ exists as an automorphic representation of GL₆(𝔸_F), and Sym³π exists as an automorphic representation of GL₄(𝔸_F); Sym³π is cuspidal unless π is dihedral or tetrahedral (Ad(π) ≅ Ad(π) ⊗ χ for a cubic χ).

Hypotheses:

- F a number field; π cuspidal on GL₂(𝔸_F), σ cuspidal on GL₃(𝔸_F).

Proof route:

1. Kim–Shahidi (Ann. of Math. 2002): the Langlands–Shahidi method for the Levi GL₂ × GL₃ of SL₅-type groups gives the analytic properties of L(s, π × σ × τ) for cuspidal τ on GL_m, m ≤ 4, and Cogdell–Piatetski-Shapiro's converse theorem.
2. Sym³π is a constituent of π ⊠ Sym²π (Gelbart–Jacquet), split off by the central character.
3. Kim–Shahidi prove local compatibility outside the places above 2 and 3; Newton–Thorne I quote Sym³ as a functorial lift at every place (with Henniart's local results).

Direct prerequisites: [ML.3/gelbart-jacquet](#target-gelbart-jacquet), [ML.3/functorial-lift](#target-functorial-lift), `AutomorphicLFunctionsAndLocalFactors:AL.4`.

Acceptance controls:

- For π attached to a non-CM elliptic curve over ℚ, Sym³π is cuspidal of symplectic type with multiplier ω_π³.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3), Introduction, 'Context', p. 1 (arXiv:1912.11261v3); [Henry H. Kim, Freydoon Shahidi, Functorial products for GL2 × GL3 and the symmetric cube for GL2](https://arxiv.org/pdf/math/0409607v1), Introduction, Theorem A, p. 838 (= Theorem 5.1) (Ann. of Math. 155; arXiv:math/0409607v1); [Henry H. Kim, Freydoon Shahidi, Functorial products for GL2 × GL3 and the symmetric cube for GL2](https://arxiv.org/pdf/math/0409607v1), Introduction, Theorem B, PDF pp.2–3 (printed pp.838–839).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-ARTIN supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-symmetric-power-lift-over-number-fields"></a>

### Symmetric power lifts Sym^{n−1}π over a number field

Target `ML.3/symmetric-power-lift-over-number-fields`; definition. Proposed declaration: `TauCeti.SymmetricPower.SymPowerExists`.

Let F be a number field, π a cuspidal automorphic representation of GL₂(𝔸_F) and n ≥ 1. Sym^{n−1}π exists if there is an automorphic representation Π of GL_n(𝔸_F) with rec_{F_v}(Π_v) ≅ Sym^{n−1} ∘ rec_{F_v}(π_v) for every place v (ML.3/functorial-lift with R = Sym^{n−1}). For F totally real and π regular algebraic (classical Hilbert, weights ≥ 2 of constant parity) and non-CM, Clozel–Thorne phrase it Galois-theoretically: there is a regular algebraic cuspidal Π with Sym^{n−1} r_l(π) ≅ r_l(Π) for every l; ML.3/one-prime-criterion shows the two agree. The historical ℚ spelling is its specialization, not a prerequisite.

Hypotheses:

- F a number field; π cuspidal on GL₂(𝔸_F).

Proof route:

1. Definition through ML.3/functorial-lift; Galois form through the automorphy predicate of ML.0/nt26-automorphy-predicate.

Direct prerequisites: [ML.3/functorial-lift](#target-functorial-lift), [ML.0/nt26-automorphy-predicate](#target-nt26-automorphy-predicate).

Consumers:

- `Newton–Thorne 2026, Theorem A`: existence of Sym^{n−1}π for Hilbert modular forms
- `Clozel–Thorne 2017, Theorem 6.1`: Sym⁶ and Sym⁸ over totally real fields
- [ML.3/sp-statement](#target-sp-statement): the statement SP_n

Planning API:

- `TauCeti.SymmetricPower.SymPowerExists` — ∃ Π with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) at all v.
- `TauCeti.SymmetricPower.SymPowerExists.one` — n = 1: Sym⁰π is the trivial character.
- `TauCeti.SymmetricPower.SymPowerExists.two` — n = 2: Sym¹π = π.
- `TauCeti.SymmetricPower.SymPowerExists.iff_galois` — For π RAESDC non-CM over totally real F: SymPowerExists π n ↔ Sym^{n−1} r_{π,ι} automorphic for one (every) ι.
- `TauCeti.SymmetricPower.SymPowerExists.baseChange` — For soluble L/F, if Sym^{n−1}π exists and BC_{L/F}(π) remains cuspidal, then Sym^{n−1}BC_{L/F}(π) exists. When base change is noncuspidal, use the explicitly extended isobaric-domain predicate and its constituent operations, rather than applying the cuspidal-domain definition.

Definition tests:

- `TauCeti.SymmetricPower.symPowerExists_three` (computation) — n = 3: Sym²π exists for every cuspidal π (Gelbart–Jacquet), cuspidal iff π is not dihedral.
- `TauCeti.SymmetricPower.symPowerExists_cm_not_cuspidal` (non-example) — For π = AI(θ) dihedral, Sym²π exists but is not cuspidal; existence does not mean cuspidality.
- `TauCeti.SymmetricPower.symPowerExists_Q` (compatibility) — For F = ℚ it agrees with ML.3/symmetric-power-lifting.

Acceptance controls:

- Over ℚ it is ML.3/symmetric-power-lifting.

Sources: [L. Clozel, J. A. Thorne, Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download), §1 Introduction, manuscript p. 2.

Suggested signature: omitted until C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-odd-artin-modularity-over-q"></a>

### Registered: odd two-dimensional Artin representations of G_ℚ are modular (Langlands–Tunnell; Khare–Wintenberger Corollary 10.2(ii))

Target `ML.1/odd-artin-modularity-over-q`; comparison. Proposed declaration: `TauCeti.WeightOne.oddArtin_modular_Q`.

Every continuous odd irreducible ρ : G_ℚ → GL₂(ℂ) arises from a newform of weight one, hence satisfies Langlands' conjecture (ML.1/strong-artin-conjecture) and Artin's conjecture. The soluble cases (projective image dihedral, A₄, S₄) are Langlands–Tunnell (owner GL2AutomorphicRepresentationsAndTransfer R17.5, RS-21); the new case, projective image A₅, is Khare–Wintenberger Corollary 10.2(ii), proved and exported by ClassicalSerreModularity R27.6/odd-artin-weight-one-modularity. This node registers the two owners and the consequence for the strong Artin conjecture; it does not reprove either, and it does not derive weight-one representations from weight-two Jacobians.

Hypotheses:

- ρ odd (det ρ(c) = −1), irreducible, over ℚ only. Even two-dimensional ρ (Maass forms) are not covered.

Proof route:

1. Soluble image: GL2AutomorphicRepresentationsAndTransfer R17.5/solvable-artin.
2. Non-soluble image: ClassicalSerreModularity R27.6/odd-artin-weight-one-modularity, which applies Theorem 10.1(ii) to the compatible system ι ∘ ρ.
3. Strong Artin: the weight-one newform f gives π_f with rec(π_{f,v}) ≅ ρ|_{W_v}.

Direct prerequisites: [ML.1/strong-artin-conjecture](#target-strong-artin-conjecture), `AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `ClassicalSerreModularity:R27.6/odd-artin-weight-one-modularity`, [ML.0/endpoint-status-register](#target-endpoint-status-register).

Acceptance controls:

- The acceptance criterion of ML.1: weight-one modularity over ℚ is imported from its owners; weight-one representations are never obtained from a weight-two Jacobian.

Sources: [Chandrashekhar Khare, Jean-Pierre Wintenberger, Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Corollary 10.2(ii), §10.2, p. 21 (author copy results.pdf); [Chandrashekhar Khare, Jean-Pierre Wintenberger, Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §10.2, p. 21 (author copy results.pdf); [Frank Calegari, David Geraghty, Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](http://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Appendix §A.2 'Relation with special values of periods', publ. p. 883 (copy p. 83); appendix arXiv:1907.08694v1 §2 (not downloaded).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-ARTIN supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-totally-real-odd-artin"></a>

### The odd Artin conjecture over totally real fields (Pilloni–Stroh), as used for A₅ images

Target `ML.1/totally-real-odd-artin`; theorem. Proposed declaration: `TauCeti.WeightOne.oddArtin_totallyReal`.

Let E be a totally real field and ϱ : G_E → GL₂(ℂ) a continuous irreducible totally odd representation (det ϱ(c) = −1 for every complex conjugation c), in particular one with projective image A₅. Then ϱ is automorphic: it arises from a Hilbert modular eigenform of parallel weight one (Pilloni–Stroh, Theorem 0.3), so ϱ satisfies Langlands' and Artin's conjectures. Boxer–Calegari–Gee–Pilloni apply it to a characteristic-zero totally odd lift with finite image (Tate) of a mod 3 representation ϱ̄₃ : G_E → GL₂(F₉) with projective image A₅ (printed G_F: recorded as a source issue).

Hypotheses:

- E totally real; ϱ:G_E→GL₂(ℂ) continuous, irreducible and of finite image; det ϱ(c_v)=−1 for every real place v. No unramified-at-p assumption is present in Pilloni–Stroh Theorem 0.3.

Proof route:

1. Pilloni–Stroh (Astérisque 382): companion forms and analytic continuation of overconvergent Hilbert modular forms of parallel weight one (after Buzzard–Taylor, Kassaei, Sasaki), with modularity lifting for the residual representations.
2. Tate: a projective representation with finite image lifts to a representation with finite image; oddness is preserved.

Direct prerequisites: [ML.1/strong-artin-conjecture](#target-strong-artin-conjecture), `AutomorphicGaloisRepresentations:R19.2`, `GL2AutomorphicRepresentationsAndTransfer:R17.5`.

Acceptance controls:

- The non-solvable vast case of BCGP Proposition 10.1.3 for p = 3.

Sources: [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Proof of Proposition 10.1.3, §10.1, p. 266 (arXiv v3); [Vincent Pilloni and Benoît Stroh, Surconvergence, ramification et modularité](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Artinfinal.pdf), Theorem 0.3, §0, printed p. 2.

Suggested signature: omitted until C-ARTIN supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-kim-sym4"></a>

### Kim: the exterior square GL₄ → GL₆ and the symmetric fourth power GL₂ → GL₅ (with Henniart)

Target `ML.3/kim-sym4`; theorem. Proposed declaration: `TauCeti.Functoriality.kim_exteriorSquare`.

Let F be a number field. (a) For Π cuspidal on GL₄(𝔸_F), ∧²Π exists as an automorphic representation of GL₆(𝔸_F) (Kim 2003, with local compatibility at the places over 2 and 3 completed by Henniart 2009, so that ∧²Π is a functorial lift in the sense of ML.3/functorial-lift at every place). (b) For π cuspidal on GL₂(𝔸_F), Sym⁴π exists as an automorphic representation of GL₅(𝔸_F) (Kim 2003), cuspidal unless π is dihedral, tetrahedral or octahedral (Kim–Shahidi).

Hypotheses:

- F a number field.

Proof route:

1. Kim: Langlands–Shahidi method for the Levi GL₂ × GL₄ (and GL₃ × GL₄) in Spin groups and the converse theorem, giving ∧² for GL₄; Sym⁴ is extracted from ∧²(Sym³π).
2. Henniart: local compatibility of ∧² at every place.
3. Gee–Taïbi use (a) in their proof of the multiplicity formula for GSp₄; BCGP Theorem 9.3.1 uses (a) with Theorem 2.9.3.

Direct prerequisites: [ML.3/kim-shahidi-sym3](#target-kim-shahidi-sym3), [ML.3/functorial-lift](#target-functorial-lift), `AutomorphicLFunctionsAndLocalFactors:AL.4`.

Acceptance controls:

- For π attached to a non-CM elliptic curve over ℚ, Sym⁴π is cuspidal on GL₅.

Sources: [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Proof of Theorem 9.3.1, §9.3, p. 258 (arXiv v3); [Toby Gee, Olivier Taïbi, Arthur's multiplicity formula for GSp4 and restriction to Sp4](https://arxiv.org/pdf/1807.03988), §1.1, p. 2 (arXiv v1); [Henry H. Kim (Appendix 1 by D. Ramakrishnan; Appendix 2 by H. Kim and P. Sarnak), Functoriality for the exterior square of GL4 and the symmetric fourth of GL2](https://www.ams.org/journals/jams/2003-16-01/S0894-0347-02-00410-1/S0894-0347-02-00410-1.pdf), §1, Theorem A, p. 139 (= Theorem 5.3.1) (J. Amer. Math. Soc. 16); [Henry H. Kim (Appendix 1 by D. Ramakrishnan; Appendix 2 by H. Kim and P. Sarnak), Functoriality for the exterior square of GL4 and the symmetric fourth of GL2](https://www.ams.org/journals/jams/2003-16-01/S0894-0347-02-00410-1/S0894-0347-02-00410-1.pdf), Introduction, Theorem B, PDF p.2 (printed p.140).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-ARTIN supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-sp-statement"></a>

### The statement SP_n (Newton–Thorne, Conjecture B)

Target `ML.3/sp-statement`; definition. Proposed declaration: `TauCeti.SymmetricPower.SP`.

For n ≥ 1, SP_n is the proposition: for every totally real field F and every cuspidal regular algebraic automorphic representation π of GL₂(𝔸_F) without CM, the lift Sym^{n−1}π exists as a RAESDC automorphic representation of GL_n(𝔸_F), in any of the equivalent senses of ML.3/one-prime-criterion. (Every cuspidal regular algebraic π of GL₂ over a totally real field is RAESDC.) Newton–Thorne prove SP_n for all n (ML.3/all-regular-symmetric-powers).

Hypotheses:

- n ≥ 1.

Proof route:

1. Definition of the proposition.

Direct prerequisites: [ML.3/symmetric-power-lift-over-number-fields](#target-symmetric-power-lift-over-number-fields), [ML.0/nt26-automorphy-predicate](#target-nt26-automorphy-predicate).

Consumers:

- `Newton–Thorne 2026, §1 and Theorem 6.4`: proved for all n by induction on n via n = p + r
- [ML.3/low-rank-symmetric-powers](#target-low-rank-symmetric-powers): the base cases n ≤ 5

Planning API:

- `TauCeti.SymmetricPower.SP` — The proposition SP_n.
- `TauCeti.SymmetricPower.SP.one` — SP 1 holds.
- `TauCeti.SymmetricPower.SP.two` — SP 2 holds.
- `TauCeti.SymmetricPower.SP.of_le_five` — SP n for n ≤ 5 (low-rank transfers).
- `TauCeti.SymmetricPower.SP.all` — SP n for all n (Newton–Thorne Theorem 6.4).

Definition tests:

- `TauCeti.SymmetricPower.SP_one` (degenerate) — SP 1: Sym⁰π is the trivial character, cuspidal on GL₁.
- `TauCeti.SymmetricPower.SP_three` (computation) — SP 3 is Gelbart–Jacquet's theorem for non-CM π.
- `TauCeti.SymmetricPower.SP_cm_excluded` (non-example) — SP_n says nothing about CM π, whose symmetric powers (n ≥ 3) are not cuspidal.

Acceptance controls:

- SP₁, SP₂ are trivial; SP₃ is Gelbart–Jacquet; SP₄, SP₅ are Kim–Shahidi and Kim (ML.3/low-rank-symmetric-powers).

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Conjecture B, §1 (Introduction), p. 3 (arXiv v2); restated after Theorem 3.2, p. 13.

Suggested signature: omitted until C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-weight-one-separation-register"></a>

### Register separating weight-one and totally real/CM modularity from the weight ≥ 2 GL₂/ℚ endpoints

Target `ML.1/weight-one-separation-register`; comparison. Proposed declaration: `TauCeti.WeightOne.scopeRegister`.

Registers the modularity endpoints of ML.1 with their scope: weight one over ℚ (ML.1/odd-artin-modularity-over-q, ML.1/irregular-systems-weight-one), weight one over totally real fields (ML.1/totally-real-odd-artin), residual modularity and prescribed weight-two lifts over totally real fields (ML.1/non-solvable-residual-modularity), and elliptic curves over imaginary quadratic and CM fields (ML.1/imaginary-quadratic-elliptic-modularity); and separates them from the weight-at-least-two GL₂/ℚ endpoints owned by ClassicalSerreModularity and EllipticCurveModularity. Weight-one representations are never derived from weight-two Jacobians, and no statement claims that all elliptic curves over arbitrary number fields are modular: over general F only potential modularity (ML.2) and Calegari–Geraghty's conditional statement (ML.2/cg18-conditional-potential-modularity) are registered.

Hypotheses:

- Registry node.

Proof route:

1. Each registered endpoint carries its field, weight and hypotheses in its own node.

Direct prerequisites: [ML.1/odd-artin-modularity-over-q](#target-odd-artin-modularity-over-q), [ML.1/totally-real-odd-artin](#target-totally-real-odd-artin), [ML.1/imaginary-quadratic-elliptic-modularity](#target-imaginary-quadratic-elliptic-modularity), [ML.0/endpoint-status-register](#target-endpoint-status-register), [ML.1/irregular-systems-weight-one](#target-irregular-systems-weight-one), [ML.1/non-solvable-residual-modularity](#target-non-solvable-residual-modularity).

Acceptance controls:

- The acceptance criterion of ML.1.

Sources: [Chandrashekhar Khare, Jean-Pierre Wintenberger, Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §10.1, paragraph after Theorem 10.1, p. 20 (author copy results.pdf).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-ARTIN supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-low-rank-symmetric-powers"></a>

### Symmetric powers of GL₂ in degrees at most five (SP_n for n ≤ 5)

Target `ML.3/low-rank-symmetric-powers`; theorem. Proposed declaration: `TauCeti.Functoriality.sp_le_five`.

Let F be a totally real field and π a cuspidal regular algebraic automorphic representation of GL₂(𝔸_F) without CM. Then for 1 ≤ n ≤ 5 the lift Sym^{n−1}π exists as a regular algebraic essentially self-dual cuspidal automorphic representation of GL_n(𝔸_F): this is the statement SP_n of Newton–Thorne for n ≤ 5, the base case of their induction.

Hypotheses:

- F totally real; π regular algebraic cuspidal non-CM.

Proof route:

1. n ≤ 3: π itself and Gelbart–Jacquet (cuspidal since non-CM ⇒ non-dihedral).
2. n = 4, 5: Kim–Shahidi and Kim; cuspidality since a regular algebraic non-CM π is not tetrahedral or octahedral (its Galois representations have open image, Ribet).
3. Regular algebraic and essentially self-dual: Sym^{n−1}π ≅ (Sym^{n−1}π)^∨ ⊗ ω_π^{n−1}; regularity from the Hodge–Tate weights of Sym^{n−1} r_ι(π). Newton–Thorne take the base case as known without citation (recorded as a source issue).

Direct prerequisites: [ML.3/gelbart-jacquet](#target-gelbart-jacquet), [ML.3/kim-shahidi-sym3](#target-kim-shahidi-sym3), [ML.3/kim-sym4](#target-kim-sym4), [ML.3/sp-statement](#target-sp-statement).

Acceptance controls:

- Newton–Thorne 2026 §1: SP_n is known for 1 ≤ n ≤ 5.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Proof of Theorem 6.4, §6, p. 50 (arXiv:2212.03595v2); [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1, p. 3 (arXiv:2212.03595v2).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-ARTIN supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

### ML.1 acceptance and supplier refinements

Check every target at the displayed hypotheses and source scope, every definition against its negative controls, and every direct prerequisite against the exact export. The target-level chains end in a baseline declaration, a checked external node, a requested supplier stage or the named gaps below.

- Obtain C-ARTIN/C-AUTOMORPHIC all-place Artin and low-rank transfer interfaces, including the Hilbert weight-one extension.
- Import Khare descent and primary low-rank analytic/full-local inputs; construct Caraiani–Newton potentially semistable lifting and modular-curve point inputs.
- Resolve the PA.4 coarse ML.1 input before asserting a global order.

## Layer ML.2: Potential automorphy assembly

Assemble the polarized, ordinary, residual, compatible-system and Dwork routes at their exact scopes. A regular pure system can become an isobaric sum of cuspidal constituent systems; its reducible total representation is not a cuspidal representation. The p–r switch retains all seventeen auxiliary conditions and concludes weak automorphy of the untensored symmetric power.

Atlas planets: Change of weight and level; Potential automorphy theorem (BLGGT); Potential automorphy of compatible systems; Meromorphic continuation of compatible-system L-functions; Potentially diagonalizable reps lie in compatible systems; Residual potential automorphy (Qian).

<a id="target-acc-auxiliary-primes"></a>

### The auxiliary primes l₁, l₂ for symmetric powers over CM fields (ACC+ Assumption 7.2.6)

Target `ML.2/acc-auxiliary-primes`; lemma. Proposed declaration: `TauCeti.PotentialAutomorphy.acc_auxiliaryPrimes`.

In the proof of ACC+ Theorem 7.1.11 (F/F₀ Galois CM, F₀^avoid, 𝓛₀, strongly irreducible rank-2 very weakly compatible systems R_i with Hodge–Tate numbers {0, 1} and S_i ∩ 𝓛₀ = ∅, integers m_i > 0), one chooses a non-CM E/ℚ with good reduction above 𝓛₀, distinct primes l₁, l₂ and λ_i | l₂ with: (1) l₂ splits completely in each M_i; (2) the image of G_F on E[l₁] contains SL₂(F_{l₁}) and r̄_{i,λ_i}(G_F) ⊇ SL₂(F_{l₂}); (3) l₁, l₂ unramified in F; (4) E has good reduction above l₁, l₂; (5) l₁, l₂ under no prime of S_i; (6) l₁, l₂ > 2m_i + 3, together with (6′) l₁, l₂ > (m_i + 1)² and (7) r_{i,λ_i} crystalline with Hodge–Tate numbers {0, 1} above l₂ (both density-one conditions used in the rest of the proof: recorded as a source issue). Such primes exist since all conditions hold for a set of primes of density one except the first for l₂, which holds for a positive-density set.

Hypotheses:

- Data of ACC+ Theorem 7.1.11.

Proof route:

1. Chebotarev and the density statements of ACC+ Lemma 7.1.3 (residual irreducibility and large image for density one).

Direct prerequisites: [Chebotarev](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev), `PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one`, `PotentialModularityAndCompatibleSystems:R24.5:operations`.

Acceptance controls:

- Feeds the l₁–l₂ switch in the proof of Theorem 7.1.11.

Sources: [P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999), §7.2.5, proof of Theorem 7.1.11, Assumption 7.2.6, arXiv v2 p. 208 (Annals p. 1103).

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-galois-ordinarity-from-automorphic"></a>

### Galois ordinarity from automorphic ordinarity (ACC+ Corollary 5.5.2; Qian Remark 4.4)

Target `ML.2/galois-ordinarity-from-automorphic`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.ordinary_of_iotaOrdinary`.

Let F be an imaginary CM field, ι : Q̄_p ≅ ℂ and π a cuspidal automorphic representation of GL_n(𝔸_F), regular algebraic of weight ιλ. If π is ι-ordinary at every v ∈ S_p and r̄_ι(π) is decomposed generic and irreducible, then r_ι(π)|_{G_{F_v}} is ordinary of weight λ for every v ∈ S_p: upper triangular with the diagonal characters determined by λ and the Hecke eigenvalues of the ordinary U_p-operators. Qian's Remark 4.4 uses it to recover Galois ordinarity of the automorphic Dwork realisation. The Remark 4.4 application is restricted to the irreducible, decomposed-generic residual branch of Theorem 1.4. It does not recover ordinarity for arbitrary semisimple residual input in Theorem 1.1.

Hypotheses:

- F imaginary CM; decomposed generic irreducible residual representation.

Proof route:

1. Use ACC+ Corollary 5.5.2, derived from Theorem 5.5.1 after soluble CM base change disjoint from the residual fixed field; check irreducibility and decomposed genericity before applying it to the Dwork realization.

Direct prerequisites: `PotentialAutomorphyInfrastructure:PA.2`, `PotentialAutomorphyInfrastructurePartII:PL.0`.

Acceptance controls:

- Converse direction to PL.0/iota-ordinary-implies-ordinary of the PL packet, which is stated over totally real or polarized settings.

Sources: [P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999), ACC+ Corollary 5.5.2 from Theorem 5.5.1; Qian Remark 4.4, published p. 1274 (arXiv v1 final paragraph of §4); [Lie Qian, Potential automorphy for general linear groups (PhD dissertation, Stanford University)](https://stacks.stanford.edu/file/druid:yn815wp7042/Thesis%20Final%20Version-augmented.pdf), Remark 4.0.4, Ch. 4, p. 65 (thesis, PDF p. 72); ≈ published Remark 4.4, Invent. p. 1274.

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-moret-bailly-galois-control"></a>

### Moret–Bailly with prescribed local Galois extensions (Proposition 3.1.1)

Target `ML.2/moret-bailly-galois-control`; lemma. Proposed declaration: `TauCeti.PotentialAutomorphy.exists_point_galois_control`.

Let K^{(avoid)}/K/K₀ be number fields with K^{(avoid)}/K and K/K₀ Galois, S a finite set of places of K₀, and for v ∈ S_K a finite Galois L′_v/K_v with L′_{σv} = σL′_v. Let T/K be smooth and geometrically connected with non-empty Gal(L′_v/K_v)-invariant open Ω_v ⊆ T(L′_v). Then there are a finite Galois L/K and P ∈ T(L) with L/K₀ Galois, L linearly disjoint from K^{(avoid)} over K, and L_w ≅ L′_v with P ∈ Ω_v for w | v ∈ S_K.

Hypotheses:

- Places and extensions as stated.

Proof route:

1. Enlarge S (Weil bounds and Hensel give K_v-points for almost all v) so that each simple Galois subextension of K^{(avoid)}/K is non-split at some v ∈ S_K with L′_v = K_v; this gives linear disjointness.
2. Reduce to L′_v = K_v by a soluble extension with prescribed completions (CHT Lemma 4.1.2) and its normal closure over K₀.
3. Apply Moret-Bailly's Théorème 1.3 and take the normal closure over K₀.

Direct prerequisites: `PotentialModularityAndCompatibleSystems:R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points`.

Acceptance controls:

- Check the role of Ω_v: the point lies in the prescribed open at every place above S, which is what the Dwork-family argument needs at l_i, l′ and ∞.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §3.1, Proposition 3.1.1, p. 41 (arXiv v4).

Suggested signature: omitted until C-MODULI supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-p-r-switch"></a>

### The p–r switch for symmetric powers over CM fields (BCGNT Proposition 6.2.3)

Target `ML.2/p-r-switch`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.prSwitch`.

BCGNT Proposition 6.2.3 is a sufficient-condition theorem: with the auxiliary systems and all conditions (1)–(17) below, Sym^{n−1}R is weakly automorphic of level prime to X₀. It does not assert an iff between residual automorphy at p and r of a single CM-tensored system.

Hypotheses:

- F imaginary CM, m≥2, n≥1, X₀ a finite set of finite places; R=(M,S,{Q_v},{r_λ},{H_τ}) very weakly compatible of rank 2. (1) H_τ={0,m}. (2) det r_λ=ε^{−m}. (3) R strongly irreducible. (4) X₀∩S=∅. (5) F/ℚ Galois containing an imaginary quadratic F₀. Fix M↪ℂ.
- (6) E/ℚ cyclic totally real of degree m, disjoint from F; L=EF and Ψ:𝔸_L^×→M^×. Choose τ₀:F₀↪ℂ and τ₁,…,τ_m:EF₀↪ℂ extending τ₀, with Ψ(α)=∏_{i=1}^m τ_i(N_{L/EF₀}α)^{m−i}cτ_i(N_{L/EF₀}α)^{i−1} on L^×. R_CM=Ind_{G_L}^{G_F}Ψ has H_CM,τ={0,…,m−1} and det r_CM,λ=ε^{−m(m−1)/2}. Its bad set is the places ramified in L or above ramification of Ψ.
- (7) Distinct primes p,r not dividing places of S and chosen coefficient places above them. (8) A weakly compatible rank-m R_aux, pure of weight m−1, bad set avoiding X₀∪{v|pr}, det=ε^{−m(m−1)/2}, HT={0,…,m−1}.
- (9) A weakly compatible rank-nm S_UA, pure of weight nm−1, bad set avoiding X₀∪{v|pr}, det=ε^{−nm(nm−1)/2}, HT={0,…,nm−1}, weakly automorphic of level prime to X₀∪{v|pr}. Put S_aux=Sym^{n−1}R⊗R_aux and S_CM=Sym^{n−1}R⊗R_CM.
- (10) L/F and Ψ unramified above X₀∪{v|pr}. (11) p>2nm+1 and [F(ζ_p):F]=p−1. (12) r>2nm+1, r splits completely in EF₀, [L(ζ_r):L]=r−1.
- (13) Up to conjugacy SL₂(F_p)≤r̄_p(G_F)≤GL₂(F_p), likewise at r. For m>2, r̄_aux,p has image GU_m(F_{p²}) and multiplier ε^{1−m}; for m=2 its image is GL₂(F_p). r̄_CM,r restricted to G_{F(ζ_r)} is irreducible. For m=2 the projective extensions cut out by r̄_p and r̄_aux,p over F(ζ_p) are disjoint.
- (14) s̄_UA,p≅s̄_aux,p and r̄_aux,r≅r̄_CM,r. (15) The p-adic places split as Σ_ord⊔Σ_ss; each F_v contains ℚ_{p²}, r̄_p|G_{F_v} and ρ̄_{2,m,0}|G_{F_v} are trivial. On Σ_ord, r_p is crystalline ordinary; on Σ_ss, r_p connects to ρ_{2,m,0}.
- (16) On Σ_ord, r̄_aux,p is trivial and r_aux,p,s_UA,p crystalline ordinary. On Σ_ss, r̄_aux,p is trivial, r_aux,p,s_UA,p crystalline, and they connect to ρ_{m,1,0},ρ_{nm,1,0} respectively. (17) At every v|r, r̄_aux,r≅r̄_CM,r is trivial and r_aux,r is crystalline ordinary. The connects relation and ρ_{a,b,c} are BCGNT Definitions 5.1.1 and the local deformation component relation, not unnamed propositions.

Proof route:

1. Apply BCGNT Theorem 3.2.1 at p to S_aux, using the S_UA seed, Taylor–Wiles image conditions (13) and local connects relations (15)–(16).
2. Apply the same theorem at r to S_CM using S_aux, (14), (17), and ordinary connectedness; obtain weak automorphy of S_CM.
3. The order-m self-twist of its automorphic π gives automorphic induction from GL_n(𝔸_L). Compare compatible systems at an irreducible member, undo Ψ, and descend cyclically to F (ACC+ Proposition 6.5.13). The specialized connects ALT and descent require exact exports beyond a bare PA.4 ordinary/Fontaine–Laffaille citation.

Direct prerequisites: `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `PotentialAutomorphyInfrastructure:PA.4`, `AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`.

Acceptance controls:

- Input to ML.2/potential-weak-automorphy-symmetric-powers.

Sources: [George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880), Proposition 6.2.3 and proof, §6.2, arXiv v3 pp. 61–63 (published pp. 54–57; arXiv pagination differs) — independently checked downloaded PDF p.62; published-copy pagination where applicable.

Suggested signature: omitted until C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-patrikis-taylor-potential-automorphy"></a>

### Potential automorphy of pure regular odd essentially self-dual weakly compatible systems (Patrikis–Taylor, Theorem A)

Target `ML.2/patrikis-taylor-potential-automorphy`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.patrikisTaylor`.

Let R be a weakly compatible system over ℚ, pure, regular and odd essentially self-dual, with its symplectic totally odd or orthogonal totally even multiplier itself a weakly compatible rank-one system. After enlarging the coefficient field, R decomposes as a direct sum of weakly compatible systems R_j, and over one finite Galois totally real extension each R_j is the compatible system of a regular algebraic cuspidal polarized automorphic representation. Thus R becomes isobarically automorphic. No irreducibility assumption is imposed; the sum need not be cuspidal. This is the ℚ-specialization of Patrikis–Taylor Theorem A and Theorem 2.1.

Hypotheses:

- Weak compatibility, purity, regularity, the stated pairing parity and a compatible multiplier. For the extension/avoidance version of Theorem 2.1, use its finite Galois CM F/F₀ and F^avoid/F data.

Proof route:

1. Patrikis–Taylor Lemma 1.6 makes the irreducible constituents totally odd and polarized at conjugation-invariant coefficient primes. Use their Theorem 2.1, not BLGGT Theorem 5.5.3 under weaker hypotheses.
2. The proof chooses suitable coefficient primes, applies BLGGT Theorem 4.5.1 to the constituents, and transports those constituents into compatible systems by BLGGT Theorem 5.5.1. The exact new constituent export is requested from R24.5.

Direct prerequisites: `PotentialModularityAndCompatibleSystems:R24.5:operations`, `PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting`.

Acceptance controls:

- Fresán–Sabbah–Yu apply it to symmetric powers of Kloosterman sheaves.

Sources: [J. Fresán, C. Sabbah, J.-D. Yu, Hodge theory of Kloosterman connections](https://arxiv.org/pdf/1810.06454v5), §5.3.2, Theorem 5.38 (Patrikis–Taylor, [44, Th. A]), arXiv v5 pp. 56–57; [Stefan Patrikis and Richard Taylor, Automorphy and irreducibility of some l-adic representations](https://virtualmath1.stanford.edu/~rltaylor/irred.pdf), Theorem A, p. 2; Theorem 2.1 and proof, pp. 12–13.

Suggested signature: omitted until C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-potential-ordinary-automorphy"></a>

### Potential ordinary automorphy of polarized mod l representations (Proposition 3.3.1)

Target `ML.2/potential-ordinary-automorphy`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.potential_ordinary_automorphy`.

Let F/F₀ be finite Galois of imaginary CM fields, I finite, and for i ∈ I: l_i odd with ζ_{l_i} ∉ F; µ_i totally odd de Rham (HT {w_i}); r̄_i : G_F → GL_{n_i}(F̄_{l_i}) irreducible with (r̄_i, µ̄_i) totally odd polarized, r̄_i|_{G_{F(ζ_{l_i})}} irreducible and l_i ≥ 2(d_i + 1); sets H_{i,τ} of n_i distinct integers with H_{i,τ∘c} = {w_i − h}; a finite Galois-stable S ⊇ primes above l_i and ramification; lifts ρ_{i,v} (v ∤ l_i) with ρ^c_{i,cv} ≅ µ_iρ^∨_{i,v}; and F^{(avoid)}. Then there are F′/F finite CM, Galois over F₀ and linearly disjoint from F^{(avoid)}, and regular algebraic cuspidal polarized (π_i, χ_i) over F′ with r̄_{l_i,ı_i}(π_i) ≅ r̄_i|_{G_{F′}}, r_{l_i,ı_i}(χ_i)ε^{1−n_i} = µ_i|_{G_{F′⁺}}, π_i unramified above l_i and outside S, ı_i-ordinary, HT_τ(r_{l_i,ı_i}(π_i)) = H_{i,τ|_F}, and r_{l_i,ı_i}(π_i)|_{G_{F′_u}} ∼ ρ_{i,v}|_{G_{F′_u}} for u | v ∈ S, u ∤ l_i.

Hypotheses:

- F/F₀ finite Galois of imaginary CM fields; n_i≥1; d_i is the largest dimension of an irreducible subrepresentation of r̄_i on the subgroup generated by all Sylow pro-l_i subgroups. All other data and hypotheses are those displayed in the statement, including the fixed ι_i for each i.

Proof route:

1. Combine dwork-potential-ordinary-automorphy (applied to a symplectic induction of r̄_i to the totally real subfield) with ordinary-lifts-with-local-conditions and ordinary-automorphy-lifting over the resulting extension.

Direct prerequisites: `PotentialAutomorphyInfrastructurePartII:PL.5/dwork-potential-ordinary-automorphy`, `PotentialAutomorphyInfrastructurePartII:PL.5/ordinary-lifts-prescribed-local`, `PotentialAutomorphyInfrastructurePartII:PL.4/ordinary-automorphy-lifting`, `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`.

Acceptance controls:

- Check that the output is ı-ordinary with prescribed Hodge–Tate numbers: the input needed by Theorem 4.5.1 to start the potentially diagonalizable lifting.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §3.3, Proposition 3.3.1, pp. 47–48 (arXiv v4).

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-qian-auxiliary-prime"></a>

### Choice of the auxiliary elliptic curve, N, F^avoid and an ordinary auxiliary prime l′ (Qian §4, Proposition 4.1)

Target `ML.2/qian-auxiliary-prime`; lemma. Proposed declaration: `TauCeti.PotentialAutomorphy.qian_auxiliaryPrime`.

Use Qian’s Theorem 1.1 data F, F^av, n≥2, l and the continuous semisimple residual representation r̄:G_F→GL_n(F_{l^s}). Fix a non-CM elliptic curve E₀/ℚ and write n=l^a m with l∤m. Let k′⊂F̄_l be generated by the m-th roots of all elements of F_{l^s}. Choose an odd N>100n+100 divisible by none of the prime factors of ln, none of the primes ramified in F^av or the residual fixed field, and none of the bad primes of E₀. Require F_{l²}k′⊂F_l(ζ_N); for n=2 require that field to have even degree d over F_l and F_{l²}k′ to lie in the residue field of ℚ(ζ_N)^+. If F_l(ζ_N)=F_{l^d} with d even, require N∤l^(d/2)+1. Let F^avoid be the ℚ-normal closure of F^av F̄^{ker r̄}(ζ_l). Then ℚ(ζ_N) and F^avoid are linearly disjoint over ℚ. There is a rational prime l′≡1 mod Nn with l′>2ln+5, unramified in F^avoid, for which E₀ has good ordinary reduction, r̄_{E₀,l′}(G_{F̃})=GL₂(F_{l′}) with F̃ the normal closure of F, and some σ∈G_F−G_{F(ζ_l′)} has scalar image. The congruence mod n and unramifiedness in F^avoid are the confirmed E7/E36 corrections.

Hypotheses:

- Theorem 1.1 data as displayed; the finite field k′ is distinct from every number-field extension denoted F′. The elliptic residual realization is cohomological H¹ in the pinned convention.

Proof route:

1. Use Qian Lemma 2.3 for the modulus and all finite exclusions. Disjoint ramification makes the cyclotomic/avoidance intersection unramified over ℚ and hence trivial.
2. The progression l′≡1 mod Nn has positive Dirichlet density since gcd(N,n)=1. Remove the finite bad, ramified and bounded primes and the density-zero supersingular exceptions. Serre open image over F̃ supplies the full residual image.
3. Choose u∈F_{l′}× with u²≠1 and an element σ∈G_{F̃} mapping to uI₂. Its cyclotomic determinant is nontrivial, so σ∉G_{F(ζ_l′)}. The exact open-image and supersingular inputs are requested from OpenImageTheoremsForAbelianVarieties.

Direct prerequisites: [Chebotarev](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev).

Acceptance controls:

- The conditions are all of density one or open, so l′ exists.

Sources: [Lie Qian, Potential automorphy for GL_n](https://arxiv.org/pdf/2104.09761), Proposition 4.1 (first list), §4, p. 21, and first paragraph of its proof, p. 22 (arXiv v1); §4 opening (choice of E, N, F^avoid), p. 21; Invent. pp. 1268–1269 per routed locators.

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-steinberg-ordinarity-lemma"></a>

### Steinberg component and ordinarity of the automorphic Dwork realisation (Qian Lemma 4.3)

Target `ML.2/steinberg-ordinarity-lemma`; lemma. Proposed declaration: `TauCeti.PotentialAutomorphy.steinbergOrdinary`.

At a place v|l of the chosen Dwork point require v(t)<0. Suppose V_{λ,t}^{ss}≅r_{l,ι}(π) for a regular algebraic cuspidal π and that the auxiliary-prime V_{λ′,t} is semisimple. The latter holds in the construction because its residual twist is an absolutely irreducible elliptic symmetric power. Match the coefficient embeddings. The monodromy of V_{λ′,t} at v is a single unipotent Jordan block of size n. Varma’s bound for its actual automorphic realization then forces π_v to be an unramified twist of Steinberg. The Hodge weights at τ are M(a_τ),…,M(a_τ)+n−1, so the constant automorphic weight is +λ_τ with λ_τ=M(a_τ). The central-character slope is +nλ_τ, and its j-th partial slope is +jλ_τ, giving ι-ordinarity by Geraghty. This proves ordinary automorphy of V_{λ,t}^{ss}; it does not assert semisimplicity of the original l-adic fibre.

Hypotheses:

- v(t)<0 at each relevant l-adic place; λ′ lies over an odd prime different from l and prime to N; V_{λ′,t} is semisimple; matched coefficient embeddings and the displayed semisimplified automorphic realization.

Proof route:

1. Use Qian’s corrected monodromy lemma at λ′, which requires v(t)<0. Global semisimplicity at λ′ preserves the maximal local Jordan block when comparing with r_{l′,ι′}(π).
2. Use Varma’s local–global monodromy bound. The partition (n) is maximal; local LLC identifies the component as Steinberg twisted by an unramified character.
3. Compute the central character from det r_{l,ι}(π)·ε_l^(n(n−1)/2). Its τ-Hodge weight is nλ_τ; geometric reciprocity makes the Galois value a unit and gives the positive valuation exponent +nλ_τ. Divide by n and multiply by j to obtain +jλ_τ, then apply Geraghty’s ordinary criterion.

Direct prerequisites: `PotentialAutomorphyInfrastructurePartII:PL.0`, `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AutomorphicGaloisRepresentationsPartII:AG2.5`.

Acceptance controls:

- The ordinarity needed to apply ordinary lifting at l.

Sources: [Lie Qian, Potential automorphy for general linear groups (PhD dissertation, Stanford University)](https://stacks.stanford.edu/file/druid:yn815wp7042/Thesis%20Final%20Version-augmented.pdf), Lemma 4.0.3 and its proof, Ch. 4, pp. 64–65 (thesis, PDF pp. 71–72); ≈ published Lemma 4.3, Invent. p. 1273; [Lie Qian, Potential automorphy for GL_n](https://arxiv.org/pdf/2104.09761), Lemma 3.10(4) and its proof, pp. 20–21 (arXiv v1); the published Lemma 4.3 (Invent. p. 1273) is NOT in arXiv v1.

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-twisted-modular-curve"></a>

### The twisted modular curve X_E(q)

Target `ML.2/twisted-modular-curve`; construction. Proposed declaration: `TauCeti.PotentialAutomorphy.TwistedModularCurve`.

Let K be a number field, E/K an elliptic curve and q ≥ 3 a prime. X_E(q) is the smooth projective curve over K (the compactification of the fine moduli space Y_E(q) for q ≥ 3) parametrising pairs (A, φ) of an elliptic curve A with a symplectic isomorphism φ : A[q] ≅ E[q] (compatible with the Weil pairings); it is a twist of the modular curve X(q) by the Galois action on E[q], geometrically connected, and of genus 0 for q ≤ 5. Calegari–Geraghty only say that the auxiliary curve 'follows easily from Prop. 6.2 of [BLGHT11], now applied to twists of a modular curve'.

Hypotheses:

- q ≥ 3 prime (fine moduli); K a number field.

Proof route:

1. Define Y_E(q) by descent of the full symplectic level-q moduli problem, using E[q] as a finite étale group scheme with its Weil pairing. A chosen geometric basis gives a GL₂(F_q) Galois representation with cyclotomic determinant; it is not in general an SL₂ cocycle over K unless μ_q⊂K.
2. Compactify by the ModularCurves owner. Geometric fibers are the fixed-pairing component of X(q), hence geometrically connected; (E,id) gives a K-point. Exact twist/descent and compactification exports remain requested rather than supplied by an untwisted X(q) citation alone.

Direct prerequisites: `PotentialModularityAndCompatibleSystems:R23.1`, [ModularCurves](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves/README.md#layer-5-affine-fine-modular-curves-after-inverting-n), [ModularCurves](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves/README.md#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering).

Consumers:

- `Calegari–Geraghty 2018, §10`: the auxiliary elliptic curve in the general case
- [ML.2/cg18-odd-symmetric-powers](#target-cg18-odd-symmetric-powers): Moret-Bailly on X_E(q)

Planning API:

- `TauCeti.PotentialAutomorphy.TwistedModularCurve` — The curve X_E(q) over K.
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.moduli` — For L/K, the non-cuspidal L-points of X_E(q) are the pairs (A/L, φ : A[q] ≅ E[q] symplectic) up to isomorphism (q ≥ 3).
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.geometricallyConnected` — X_E(q) is geometrically connected.
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.baseChange` — X_E(q) ×_K L = X_{E_L}(q).
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.point_E` — (E, id) is a K-point.

Definition tests:

- `TauCeti.PotentialAutomorphy.TwistedModularCurve.genus_q3` (computation) — q = 3: X_E(3) has genus 0 (X(3) does), and it has the K-point (E, id), so X_E(3) ≅ ℙ¹_K.
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.trivial_twist` (degenerate) — If the Galois action on E[q] is trivial (E[q] ⊂ E(K) and μ_q ⊂ K), X_E(q) ≅ X(q)_K.
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.not_X0` (non-example) — X_E(q) is not X₀(q) as a moduli problem: a point carries a full level-q structure identified with E[q], not a cyclic subgroup; already at q=7 the curves differ (genus of X(7) is 3, of X₀(7) is 0), while for q = 3, 5 both are ℙ¹_K.

Acceptance controls:

- Moret-Bailly's theorem applied to X_E(q) gives points over extensions with prescribed local behaviour.

Sources: [Frank Calegari, David Geraghty, Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224), §10, general case, p. 97 (arXiv v2) = Invent. p. 429.

Suggested signature: omitted until C-MODULI supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-acc-symplectic-potential-automorphy"></a>

### Potential ordinary automorphy of symplectic residual representations with prescribed disjointness (ACC+ Proposition 7.2.3)

Target `ML.2/acc-symplectic-potential-automorphy`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.acc_symplectic`.

Let F/F₀ be a finite Galois extension of totally real fields, 𝓘 finite, and for i ∈ 𝓘 let n_i be even, l_i odd primes, ı_i : Q̄_{l_i} ≅ ℂ, and r̄_i : G_F → GSp_{n_i}(F̄_{l_i}) with open kernel and multiplier ε̄_{l_i}^{1−n_i}, unramified above a finite set 𝓛 of primes unramified in F and ≠ l_i; let F^avoid/F be finite Galois. Then there are finite Galois F^suffices/F₀ and F₁^avoid/ℚ with F ⊂ F^suffices, F^suffices linearly disjoint from F^avoid F₁^avoid over F, F₁^avoid and F^avoid linearly disjoint over ℚ, F^suffices unramified above 𝓛, such that for every finite totally real F′/F^suffices linearly disjoint from F₁^avoid each r̄_i|_{G_{F′}} is ordinarily automorphic of weight 0 and level prime to 𝓛. It strengthens BLGGT Theorem 3.1.2 (PotentialAutomorphyInfrastructurePartII PL.5) by the extra disjointness F₁^avoid.

Hypotheses:

- As in the statement.

Proof route:

1. The Dwork family and the scheme T̃ of BLGGT §3 with Moret-Bailly (ML.2/moret-bailly-galois-control), as in PL.5/dwork-potential-ordinary-automorphy, keeping track of F₁^avoid = the field cut out by the auxiliary residual representations (misprint in the linear disjointness recorded as a source issue).

Direct prerequisites: `PotentialAutomorphyInfrastructurePartII:PL.5/dwork-potential-ordinary-automorphy`, [ML.2/moret-bailly-galois-control](#target-moret-bailly-galois-control).

Acceptance controls:

- The input to ML.2/elliptic-symmetric-power-seed and ML.3/acc-elliptic-symmetric-powers.

Sources: [P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999), §7.2.1, Proposition 7.2.3 and its parenthetical proof, arXiv v2 pp. 204–205 (Annals pp. 1099–1100).

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-cg18-odd-symmetric-powers"></a>

### Conditional potential modularity of odd symmetric powers of elliptic curves (Calegari–Geraghty §10)

Target `ML.2/cg18-odd-symmetric-powers`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.cg18_oddSymPowers`.

Assume Conjecture B. Let A/K be an elliptic curve over a number field with End_ℂ(A) = ℤ and r = Sym^{2n−1}ρ_{A,p}. (Special case) If there is a prime p, totally split in K, with p + 1 divisible by an integer N₂ > 2n + 1 prime to the conductor of A, ρ̄_{A,p} surjective, A with good reduction at all v | p and ρ̄_A|_{G_{ℚ_p}} ≅ Ind ω₂, then r is potentially modular: the Dwork family point (BLGHT II Proposition 6.2) links r̄ to an induced representation, and two applications of CG's Theorem 5.16 give modularity. (General case) An auxiliary elliptic curve A′ with A′[q] ≅ A[q] (a point of the twisted modular curve X_A(q), ML.2/twisted-modular-curve) satisfying the special-case hypothesis reduces the general case to it.

Hypotheses:

- Hypothesis: Conjecture B; the corrections N₂ > 2n + 1, the E216 relabelling and BLGHT II Proposition 6.2 as printed.

Proof route:

1. Special case: Dwork family (owner: the proposed Part II PotentialAutomorphyDworkMotivesPartII; recorded as a gap) and Moret-Bailly; CG Theorem 5.16 twice.
2. General case: Moret-Bailly on X_A(q) for the auxiliary curve; then the special case.

Direct prerequisites: [ML.2/twisted-modular-curve](#target-twisted-modular-curve), [ML.2/moret-bailly-galois-control](#target-moret-bailly-galois-control), `PotentialAutomorphyInfrastructure:PA.4`.

Acceptance controls:

- Odd symmetric powers are the input to the tensor-product trick for Theorem 1.1.

Sources: [Frank Calegari, David Geraghty, Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224), §10, proof of Theorem 1.1, 'extra hypothesis' bullet, p. 97 (arXiv v2) = Invent. p. 428 [sub-item sec10-special-case]; [Frank Calegari, David Geraghty, Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224), §10, general case, pp. 97–98 (arXiv v2) = Invent. p. 429 [sub-items sec10-general-case, sec10-auxiliary-curve-lemma].

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-pd-lifts-with-local-conditions"></a>

### Lifts with potentially diagonalizable local conditions (Theorem 4.3.1)

Target `ML.2/pd-lifts-with-local-conditions`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.exists_pd_lift`.

In the setting of §4.3 (F imaginary CM with ζ_l ∉ F, S split containing places above l, µ algebraic unramified outside S with µ(c_v) = −1, r̄ : G_{F⁺} → G_n(F̄_l) unramified outside S with ν ∘ r̄ = µ̄, lifts ρ_v of r̄̆|_{G_{F_ṽ}} for v ∈ S), assume r̄̆|_{G_{F(ζ_l)}} irreducible, l ≥ 2(d + 1), and for v | l that ρ_v is potentially diagonalizable with n distinct τ-Hodge–Tate numbers. Then r̄ has a lift r : G_{F⁺} → G_n(O_{Q̄_l}) with ν ∘ r = µ, r̆|_{G_{F_ṽ}} ∼ ρ_v for v ∈ S, unramified outside S.

Hypotheses:

- F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).

Proof route:

1. As in Theorem 4.2.1: the deformation ring with the components of the ρ_v has dimension ≥ 1; potential automorphy of r̄ (potential-ordinary-automorphy) and pd-automorphy-lifting over the extension make it finite over O; so it has Q̄_l-points.

Direct prerequisites: `PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting`, [ML.2/potential-ordinary-automorphy](#target-potential-ordinary-automorphy), `PotentialAutomorphyInfrastructurePartII:PL.1/connects-relation`, `PotentialAutomorphyInfrastructurePartII:PL.1/potentially-diagonalizable`, `GlobalGaloisDeformations:G7/polarized-representability`.

Acceptance controls:

- Check that this strengthens ordinary-lifts-with-local-conditions: ordinary crystalline ρ_v are potentially diagonalizable.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §4.3, Theorem 4.3.1, p. 55 (arXiv v4).

Suggested signature: omitted until C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-potential-automorphy-theorem"></a>

### Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)

Target `ML.2/potential-automorphy-theorem`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.potential_automorphy`.

Let F/F₀ be finite Galois of imaginary CM fields, I finite, and for i ∈ I: n_i, d_i ≥ 1, l_i odd with l_i ≥ 2(d_i + 1) and ζ_{l_i} ∉ F, ı_i; (r_i, µ_i) a totally odd, regular algebraic, n_i-dimensional polarized l_i-adic representation of G_F with d_i the maximal dimension of an irreducible constituent of r̄_i restricted to the subgroup generated by the Sylow pro-l_i-subgroups; F^{(avoid)}/F finite Galois. Assume r_i is potentially diagonalizable at each prime of F above l_i and r̄_i|_{G_{F(ζ_{l_i})}} is irreducible. Then there are a finite CM F′/F, Galois over F₀ and linearly disjoint from F^{(avoid)} over F, and regular algebraic cuspidal polarized (π_i, χ_i) of GL_{n_i}(𝔸_{F′}), unramified above l_i, with (r_{l_i,ı_i}(π_i), r_{l_i,ı_i}(χ_i)ε_{l_i}^{1−n_i}) ≅ (r_i|_{G_{F′}}, µ_i|_{G_{(F′)⁺}}).

Hypotheses:

- F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).
- Read "each prime v of F above l_i" (the printed "of F⁺" is a misprint, ModularityAndLanglandsExtensions/E2).

Proof route:

1. potential-ordinary-automorphy gives F′ (Galois over F₀, disjoint from ∩ ker r̄_i · F^{(avoid)}(ζ_{∏l_i})) and ı_i-ordinary (π′_i, χ′_i) with r̄_{l_i,ı_i}(π′_i) ≅ r̄_i|_{G_{F′}}, unramified above l_i.
2. pd-automorphy-lifting over F′ (hypotheses preserved: potential diagonalizability restricts, and r̄_i|_{G_{F′(ζ_{l_i})}} stays irreducible by disjointness).

Direct prerequisites: [ML.2/potential-ordinary-automorphy](#target-potential-ordinary-automorphy), `PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting`, `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`, `PotentialAutomorphyInfrastructurePartII:PL.1/potentially-diagonalizable`, `PotentialAutomorphyInfrastructurePartII:PL.0/automorphic-polarized-representation`.

Acceptance controls:

- Check the Fontaine–Laffaille special case: l_i unramified in F⁺, r_i crystalline above l_i with HT in [a_τ, a_τ + l − 2] (potential-diagonalizability-criteria (2)).
- Check that the output is automorphy over F′ only: descent to F needs automorphy-twist-and-soluble-base-change and holds only for soluble F′/F.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §4.5, Theorem 4.5.1 and proof, pp. 59–60 (arXiv v4).

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-potential-automorphy-with-steinberg-place"></a>

### Residual potential automorphy with a Steinberg place (Fakhruddin–Khare–Patrikis, proof of Proposition 9.1)

Target `ML.2/potential-automorphy-with-steinberg-place`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.withSteinbergPlace`.

Let F be totally real, p ≫_n 0, ρ̄ : Γ_F → GSp_{2n}(k) with similitude κ̄^{1−2n} and ρ̄|_{Γ_{F(ζ_p)}} absolutely GSp_{2n}-irreducible (ρ̄ may be GL_{2n}-reducible), and v₀ a place with ρ̄|_{Γ_{F_{v₀}}} = 1 and N(v₀) ≡ 1 mod p. Then there are a Galois totally real F′/F linearly disjoint from F(ρ̄, ζ_p) and a regular algebraic self-dual cuspidal Π_{F′} of GL_{2n}(𝔸_{F′}) with r̄_ι(Π_{F′}) ≅ ρ̄|_{Γ_{F′}} and Π_{F′,w} an unramified twist of Steinberg for every w | v₀: run BLGGT Theorem 3.1.2 with the additional Moret-Bailly condition v(t(P)) < 0 at the places above v₀.

Hypotheses:

- As stated; the GL_{2n}-constituents of ρ̄ are assumed self-dual and irreducible on Γ_{F(ζ_p)} (a gap in FKP's proof, recorded as a source issue); 'π_{v₀}' is printed for 'π_w, w | v₀' (E34).

Proof route:

1. BLGGT Theorem 3.1.2 (PotentialAutomorphyInfrastructurePartII PL.5/dwork-potential-ordinary-automorphy) with the Moret-Bailly step ML.2/moret-bailly-galois-control including the local condition at v₀.
2. v(t) < 0 forces maximal unipotent monodromy of the Dwork fibre at w | v₀, hence a Steinberg local component.

Direct prerequisites: `PotentialAutomorphyInfrastructurePartII:PL.5/dwork-potential-ordinary-automorphy`, [ML.2/moret-bailly-galois-control](#target-moret-bailly-galois-control).

Acceptance controls:

- Used in FKP Proposition 9.1 to produce geometric lifts with Zariski-dense image.

Sources: [N. Fakhruddin, C. Khare, S. Patrikis, Lifting and automorphy of reducible mod p Galois representations over global fields](https://arxiv.org/pdf/2008.12593v5), §9, proof of Proposition 9.1, arXiv v5 p. 42; [N. Fakhruddin, C. Khare, S. Patrikis, Lifting and automorphy of reducible mod p Galois representations over global fields](https://arxiv.org/pdf/2008.12593v5), §9, proof of Proposition 9.1, arXiv v5 p. 42.

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-change-of-weight-and-level"></a>

### Change of weight and level (Theorem 4.4.1)

Target `ML.2/change-of-weight-and-level`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.change_of_weight_and_level`.

Let F be imaginary CM, l > 2(n + 1) with ζ_l ∉ F and primes above l split over F⁺, S a finite split set of finite places of F⁺ containing those above l, µ algebraic, and r̄ : G_F → GL_n(F̄_l) with (r̄, µ̄) polarized, unramified outside S, ordinarily or potentially diagonalizably automorphic, and r̄|_{G_{F(ζ_l)}} irreducible. For v ∈ S let ρ_v be a lift of r̄|_{G_{F_ṽ}}, potentially diagonalizable with n distinct τ-Hodge–Tate numbers when v | l. Then there is a regular algebraic cuspidal polarized (π, χ) with r̄_{l,ı}(π) ≅ r̄, r_{l,ı}(χ)ε_l^{1−n} = µ, level potentially prime to l, unramified outside S, and ρ_v ∼ r_{l,ı}(π)|_{G_{F_ṽ}} for v ∈ S.

Hypotheses:

- F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).
- The statement is read with ρ_v a lift of r̄|_{G_{F_ṽ}}; see ModularityAndLanglandsExtensions/E3.

Proof route:

1. pd-lifts-with-local-conditions gives a lift r with the local conditions ρ_v; pd-automorphy-lifting makes it automorphic; local–global compatibility (blggt-normalization-register (3)) gives ρ_v ∼ r_{l,ı}(π)|_{G_{F_ṽ}}.

Direct prerequisites: [ML.2/pd-lifts-with-local-conditions](#target-pd-lifts-with-local-conditions), `PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting`, [ML.0/blggt-normalization-register](#target-blggt-normalization-register).

Acceptance controls:

- Check the Serre-weight reading: r̄ is automorphic in every potentially diagonalizable weight and type it admits locally.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §4.4, Theorem 4.4.1, pp. 58–59 (arXiv v4).

Suggested signature: omitted until C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-compatible-systems-potentially-automorphic"></a>

### Potential automorphy of compatible systems (Theorem 5.4.1, Corollary 5.4.2)

Target `ML.2/compatible-systems-potentially-automorphic`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.potential_automorphy_compatibleSystem`.

Let F/F₀ be finite Galois of CM (resp. totally real) fields and F^{(avoid)}/F finite Galois. If (ℛ_i, ℳ_i), i = 1, …, r, are totally odd, polarized weakly compatible systems of l-adic representations of G_F with each ℛ_i regular and irreducible, then there is a finite CM (resp. totally real) F′/F, linearly disjoint from F^{(avoid)} and Galois over F₀, such that each (ℛ_i|_{G_{F′}}, ℳ_i|_{G_{(F′)⁺}}) is automorphic. In particular (Corollary 5.4.2) a single such system becomes automorphic over a finite Galois CM (resp. totally real) F′/F.

Hypotheses:

- (ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.

Proof route:

1. Totally real case from the CM case by automorphy-twist-and-soluble-base-change, choosing F′ disjoint from the fields F_i¹ of Lemma 5.3.1 (rank-two-reducibility-independent-of-lambda) so that ℛ_i stays irreducible (Lemma A.2.1).
2. Take M common; L = ∩_i(L_{i,1} ∩ L_{i,2}) of density 1, with L_{i,1} from residual-irreducibility-density-one and L_{i,2} the primes where ℛ_i is irreducible (Lemma A.1.7).
3. Remove finitely many l: l ≥ 2(dim ℛ_i + 1), l unramified in F and not below the bad primes, Hodge–Tate numbers in some [a, a + l − 2].
4. potential-diagonalizability-criteria (2) makes r_{i,λ} potentially diagonalizable; apply potential-automorphy-theorem to the r_{i,λ} for one λ | l ∈ L.

Direct prerequisites: [ML.2/potential-automorphy-theorem](#target-potential-automorphy-theorem), `PotentialAutomorphyInfrastructurePartII:PL.1/pd-criteria`, `PotentialAutomorphyInfrastructurePartII:PL.0/automorphy-under-twist`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`, `PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one`, `PotentialModularityAndCompatibleSystems:R24.5/rank-two-reducibility-independent-of-lambda`, `PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`.

Acceptance controls:

- Check the density-one bookkeeping: the intersection of finitely many density-one sets has density one.
- Check the Fontaine–Laffaille step: for l large the Hodge–Tate range (fixed by the system) has length < l − 2.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §5.4, Theorem 5.4.1, Corollary 5.4.2 and proof, p. 74 (arXiv v4).

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-constituents-potentially-automorphic"></a>

### Constituents of polarized systems are potentially automorphic (Proposition 5.4.6)

Target `ML.2/constituents-potentially-automorphic`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.constituents_potentially_automorphic`.

Let F be CM and (ℛ, ℳ) a totally odd, polarized weakly compatible system with ℛ pure and extremely regular; write r_λ = r_{λ,1} ⊕ ⋯ ⊕ r_{λ,j_λ} into irreducibles. There is a set L of rational primes of Dirichlet density 1 such that for λ | l ∈ L there is a finite CM Galois F′/F with each (r_{λ,α}|_{G_{F′}}, µ_λ|_{G_{(F′)⁺}}) irreducible and automorphic.

Hypotheses:

- (ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.

Proof route:

1. Lemma 5.4.5 (PM R24.5/constituents-essentially-self-dual, v1 Lemma 5.2.3): each (r_{λ,α}, µ_λ) is totally odd polarized.
2. L from residual-irreducibility-density-one, minus finitely many l (l ≥ 2(dim ℛ + 1), unramified, Fontaine–Laffaille range); potential-diagonalizability-criteria (2); potential-automorphy-theorem with F^{(avoid)} the compositum of the F̄^{ker r̄_{λ,α}}.

Direct prerequisites: [ML.2/potential-automorphy-theorem](#target-potential-automorphy-theorem), `PotentialAutomorphyInfrastructurePartII:PL.1/pd-criteria`, `PotentialModularityAndCompatibleSystems:R24.5/constituents-essentially-self-dual`, `PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one`.

Acceptance controls:

- Check that irreducibility over F′ comes from the choice of F^{(avoid)}: r̄_{λ,α}|_{G_{F′}} stays irreducible, hence so does r_{λ,α}|_{G_{F′}}.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §5.4, Lemma 5.4.5 and Proposition 5.4.6, pp. 76–77 (arXiv v4).

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-potential-automorphy-mod-l"></a>

### Potential automorphy of mod l representations with prescribed local lifts (Corollary 4.5.3)

Target `ML.2/potential-automorphy-mod-l`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.potential_automorphy_residual`.

In the situation of Theorem 4.5.1 but with r̄_i : G_F → GL_{n_i}(F̄_{l_i}) irreducible, (r̄_i, µ_i) polarized (µ_i totally odd de Rham), r̄_i|_{G_{F(ζ_{l_i})}} irreducible, S a Gal(F/F⁺)-stable finite set of primes containing those above l_i and the ramification, and lifts ρ_{i,v} (v ∈ S) with ρ^c_{i,cv} ≅ µ_iρ^∨_{i,v}, potentially diagonalizable with n_i distinct Hodge–Tate numbers when v | l_i: there are F′ (as in 4.5.1) and (π_i, χ_i) with r̄_{l_i,ı_i}(π_i) ≅ r̄_i|_{G_{F′}}, r_{l_i,ı_i}(χ_i)ε^{1−n_i} = µ_i|_{G_{F′⁺}}, level potentially prime to l_i, unramified outside S, and r_{l_i,ı_i}(π_i)|_{G_{F′_u}} ∼ ρ_{i,v}|_{G_{F′_u}} for u | v ∈ S.

Hypotheses:

- F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).
- Read ρ_{i,v}, n_i and ρ_{i,v}|_{G_{F′_u}} in (g) and (7) (misprints E2).

Proof route:

1. Reduce to S split over F⁺ as in potential-ordinary-automorphy; pd-lifts-with-local-conditions gives lifts r_i with r_i|_{G_{F_v}} ∼ ρ_{i,v}; apply potential-automorphy-theorem.

Direct prerequisites: [ML.2/pd-lifts-with-local-conditions](#target-pd-lifts-with-local-conditions), [ML.2/potential-automorphy-theorem](#target-potential-automorphy-theorem).

Acceptance controls:

- Check that it strengthens Proposition 3.3.1: the local conditions may be any potentially diagonalizable types, not only ordinary.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §4.5, Corollary 4.5.3, pp. 60–61 (arXiv v4).

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-potential-automorphy-totally-real"></a>

### Potential automorphy over totally real fields (Corollary 4.5.2)

Target `ML.2/potential-automorphy-totally-real`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.potential_automorphy_totallyReal`.

Let F⁺ be totally real, l ≥ 2(n + 1), and (r, µ) a totally odd, regular algebraic, n-dimensional polarized l-adic representation of G_{F⁺}, potentially diagonalizable at each prime above l, with r̄|_{G_{F⁺(ζ_l)}} irreducible. Then there is a Galois totally real F^{+,′}/F⁺ such that (r|_{G_{F^{+,′}}}, µ|_{G_{F^{+,′}}}) is automorphic of level prime to l.

Hypotheses:

- F⁺ totally real.

Proof route:

1. Choose an imaginary quadratic F/F⁺ in which primes above l split, disjoint from (F̄⁺)^{ker ad r̄}(ζ_l); apply potential-automorphy-theorem to r|_{G_F}; descend from the CM field F′ to (F′)⁺ by automorphy-twist-and-soluble-base-change.

Direct prerequisites: [ML.2/potential-automorphy-theorem](#target-potential-automorphy-theorem), `PotentialAutomorphyInfrastructurePartII:PL.0/automorphy-under-twist`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`.

Acceptance controls:

- Check against KW/Taylor over ℚ: for n = 2 this recovers potential modularity of odd regular 2-dimensional representations with PD local conditions.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §4.5, Corollary 4.5.2, p. 60 (arXiv v4).

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-potential-weak-automorphy-symmetric-powers"></a>

### Potential weak automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 6.2.4)

Target `ML.2/potential-weak-automorphy-symmetric-powers`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.weakAutomorphy_symPower`.

Let F be an imaginary CM field and R a strongly irreducible very weakly compatible system of rank 2 of G_F with H_τ = {0, m} (m ≥ 2) and det r_λ = ε^{−m}. Let v₀ ∉ S. Then for each n ≥ 1 there is a CM extension F_n/F, Galois over ℚ, such that Sym^{n−1}R|_{G_{F_n}} is weakly automorphic of level prime to the places above v₀. The proof uses a semistable elliptic curve A/ℚ, good ordinary at an auxiliary prime q > 2nm + 1 with surjective mod q image, and the automorphy of Sym^{nm−1} of A over a CM field F₆ (ACC+).

Hypotheses:

- As stated.

Proof route:

1. ML.2/p-r-switch with the CM-induced system S_CM and the elliptic-curve seed (ACC+ Theorem 7.1.11 / ML.3/acc-elliptic-symmetric-powers for the symmetric powers of A).
2. Moret-Bailly to find the auxiliary data over F_n.

Direct prerequisites: [ML.2/p-r-switch](#target-p-r-switch), [ML.2/acc-symplectic-potential-automorphy](#target-acc-symplectic-potential-automorphy), `PotentialModularityAndCompatibleSystems:R23.1`.

Acceptance controls:

- Feeds BCGNT Theorem 6.2.1 and the purity Lemma 6.1.3.

Sources: [George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880), Theorem 6.2.4 and proof (incl. the elliptic curve A/ℚ and the automorphy of Sym^{nm−1}ρ_{A,q}|G_{F₆}), §6.2, arXiv v3 pp. 64–68 (published pp. 57–61; arXiv pagination differs).

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-acc-elliptic-symmetric-powers"></a>

### Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)

Target `ML.3/acc-elliptic-symmetric-powers`; theorem. Proposed declaration: `TauCeti.SymmetricPower.acc_ellipticSymPowers`.

Let 𝓜 be a finite set of positive integers, E/ℚ a non-CM elliptic curve, 𝓛 a finite set of primes of good reduction and F^avoid/ℚ finite. There are a finite Galois F₂^avoid/ℚ linearly disjoint from F^avoid and a finite totally real Galois F^suffices/ℚ unramified above 𝓛 and linearly disjoint from F^avoid F₂^avoid, such that for every finite totally real F′/F^suffices linearly disjoint from F₂^avoid and every m ∈ 𝓜 there is a regular algebraic cuspidal polarizable π of GL_{m+1}(𝔸_{F′}) of weight 0 with Sym^m r_{E,l}^∨|_{G_{F′}} ≅ r_{l,ı}(π) (unramified above 𝓛; the same compatible-system realization holds for every l and ι, without asserting ordinarity at all residual characteristics).

Hypotheses:

- As stated; corrections E103–E107 of the ACC+ extraction applied to the proof.

Proof route:

1. ML.2/acc-symplectic-potential-automorphy applied to Sym^m of E[l] twisted by an induced character ψ_m of a CM field to make the residual representation symplectic, then PotentialAutomorphyInfrastructurePartII PL.5 lifting.

Direct prerequisites: [ML.2/acc-symplectic-potential-automorphy](#target-acc-symplectic-potential-automorphy), `PotentialAutomorphyInfrastructurePartII:PL.5`.

Acceptance controls:

- The seed of Qian's argument (ML.2/elliptic-symmetric-power-seed) and of ACC+ Theorem 7.1.11.

Sources: [P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999), §7.2.1, Corollary 7.2.4, arXiv v2 pp. 205–206 (Annals pp. 1100–1101); proof pp. 206–208 (Annals pp. 1101–1103).

Suggested signature: omitted until C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-cg18-conditional-potential-modularity"></a>

### Conditional potential modularity of elliptic curves over arbitrary number fields (Calegari–Geraghty, Theorem 1.1(1))

Target `ML.2/cg18-conditional-potential-modularity`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.cg18_potentialModularity`.

Assume Calegari–Geraghty's Conjecture B (the existence of Galois representations with the expected characteristic polynomials for the torsion Hecke algebras T^an_{Q,ψ} of the locally symmetric spaces of Res_{F/ℚ}PGL(n)). Let F be any number field and E/F an elliptic curve. Then E is potentially modular. Status: conditional (ML.0/endpoint-status-register); Conjecture B is imported from the proposed PotentialAutomorphyInfrastructure Part II and is not proved anywhere in the atlas.

Hypotheses:

- Hypothesis: Conjecture B (status conjectural). F arbitrary; E arbitrary.

Proof route:

1. Odd symmetric powers Sym^{2n−1} of E are potentially modular (ML.2/cg18-odd-symmetric-powers), using CG's minimal modularity lifting beyond Taylor–Wiles (their Theorem 5.16, which assumes Conjecture B).
2. Harris–Shepherd-Barron–Taylor's reduction from odd symmetric powers to E itself (tensor product trick).

Direct prerequisites: [ML.2/cg18-odd-symmetric-powers](#target-cg18-odd-symmetric-powers), [ML.0/endpoint-status-register](#target-endpoint-status-register), `PotentialAutomorphyInfrastructure:PA.4`.

Acceptance controls:

- The acceptance criterion of ML.1: this is the only statement about elliptic curves over arbitrary number fields, and it is conditional.

Sources: [Frank Calegari, David Geraghty, Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224), Theorem 1.1(1), §1, p. 3 (arXiv v2) = Invent. p. 300; proof §10, pp. 96–98 (arXiv v2) = Invent. pp. 428–429; [Frank Calegari, David Geraghty, Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224), Theorem 1.1(1), §1, p. 3 (arXiv v2) = Invent. p. 300; proof §10, pp. 96–98 (arXiv v2) = Invent. pp. 428–429.

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-compatible-system-l-function-continuation"></a>

### Meromorphic continuation, functional equation and purity for compatible systems (Corollary 5.4.3)

Target `ML.2/compatible-system-l-function-continuation`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.lFunction_meromorphic`.

Under the hypotheses of Corollary 5.4.2: (1) for ı : M ↪ ℂ, L^S(ıℛ, s) converges uniformly absolutely on compact subsets of a right half plane and continues meromorphically to ℂ; (2) ℛ is strictly pure and Λ(ıℛ, s) = ε(ıℛ, s)Λ(ıℛ^∨, 1 − s); (3) if F is totally real, n is odd and v | ∞, then tr r_λ(c_v) = ±1 is independent of λ.

Hypotheses:

- (ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.

Proof route:

1. Strict purity: Theorem 5.4.1, Theorem 2.1.1 (purity of WD at v ∤ l for automorphic members) and Brauer's theorem as in the proof of part-of-compatible-system (the Grothendieck-ring argument of PM R24.5/galois-grothendieck-ring).
2. Continuation and functional equation: over each soluble F′/F_i in a Brauer decomposition 1 = Σ n_i Ind ψ_i the system is automorphic, so L^S(ıℛ, s) = ∏ L^S(π_i ⊗ ψ_i, s)^{n_i} (HSBT10 Theorem 4.2 argument), each factor meromorphic with the standard functional equation; nontrivial rank≥2 cuspidal standard factors are entire, while the rank-one trivial factor has a pole (AL.2).
3. (3): reduce to the automorphic case, Taylor 2012 (the Calegari observation); cited.

Direct prerequisites: [ML.2/compatible-systems-potentially-automorphic](#target-compatible-systems-potentially-automorphic), `PotentialModularityAndCompatibleSystems:R24.5/system-l-functions`, `PotentialModularityAndCompatibleSystems:R24.5/galois-grothendieck-ring`, `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AutomorphicLFunctionsAndLocalFactors:AL.2`, `mathlib:Matrix.trace`.

Acceptance controls:

- Check that the Γ- and ε-factors are those of PM R24.5/system-l-functions, so (2) is the functional equation that node could not claim.
- Check the example of an elliptic curve over a totally real field: L(E, s) continues and satisfies its functional equation (the system is regular, irreducible, polarized).

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §5.4, Corollary 5.4.3 and proof, pp. 74–75 (arXiv v4).

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-elliptic-symmetric-power-seed"></a>

### An automorphic symmetric-power seed for the auxiliary elliptic curve (Qian Proposition 4.1; ACC+ Corollary 7.2.4)

Target `ML.2/elliptic-symmetric-power-seed`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.ellipticSeed`.

In the situation of ML.2/qian-auxiliary-prime there are a finite Galois F_2^avoid/ℚ and a finite totally real Galois F^suff/ℚ unramified above the prime divisors of N, with F_2^avoid ∩ F^avoid = ℚ, F^suff ∩ F^avoid F_2^avoid = ℚ, ℚ̄^{ker r̄_{E,l′}} ⊂ F_2^avoid, F^avoid and F_2^avoid unramified above N, such that for every finite totally real F′/F^suff with F′ ∩ F_2^avoid = ℚ, Sym^{n−1} r_{E,l′}|_{G_{F′}} is automorphic.

Hypotheses:

- E/ℚ non-CM; l′ as in ML.2/qian-auxiliary-prime.

Proof route:

1. ACC+ Corollary 7.2.4 (potential automorphy of the symmetric powers of a non-CM elliptic curve over totally real fields with prescribed disjointness, ML.3/acc-elliptic-symmetric-powers states it over totally real F′) gives the seed.
2. Qian's proof checks the extra ramification and disjointness conditions.

Direct prerequisites: [ML.2/qian-auxiliary-prime](#target-qian-auxiliary-prime), [ML.2/acc-symplectic-potential-automorphy](#target-acc-symplectic-potential-automorphy), [ML.3/acc-elliptic-symmetric-powers](#target-acc-elliptic-symmetric-powers).

Acceptance controls:

- Used once, in the proof of ML.2/qian-residual-potential-automorphy.

Sources: [Lie Qian, Potential automorphy for GL_n](https://arxiv.org/pdf/2104.09761), Proposition 4.1 (second list and final assertion), §4, p. 21; proof p. 22 (arXiv v1); Invent. pp. 1269–1270 per routed locator.

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-irreducibility-density-one"></a>

### Irreducibility of r_{l,ı}(π) for density-one l (Theorem 5.5.2)

Target `ML.2/irreducibility-density-one`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.irreducible_density_one`.

Let F be CM and π a regular algebraic, polarizable, cuspidal automorphic representation of GL_n(𝔸_F) of extremely regular weight. Then there is a set L of rational primes of Dirichlet density 1 such that r_{l,ı}(π) is irreducible for every l ∈ L and ı : Q̄_l ≅ ℂ.

Hypotheses:

- F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).

Proof route:

1. Apply constituents-potentially-automorphic to ℛ = {r_{l,ı}(π)}; for l ∈ L write r_{l,ı}(π) = ⊕_{α=1}^j r_{l,ı}(π)_α, each potentially automorphic.
2. ord_{s=1}L^S(ı(ℛ ⊗ ℛ^∨), s) = ord_{s=1}L^S(π × π^∨, s) = −1 (Jacquet–Shalika, Shahidi; requested from AL.3).
3. On the other hand, using the potential automorphy of the constituents and Brauer induction, the order is −j; hence j = 1.

Direct prerequisites: [ML.2/constituents-potentially-automorphic](#target-constituents-potentially-automorphic), `AutomorphicLFunctionsAndLocalFactors:AL.3`, `PotentialModularityAndCompatibleSystems:R24.5/galois-grothendieck-ring`.

Acceptance controls:

- For unitary cuspidal π,π′, the Rankin–Selberg function L^S(π×π′^∨,s) has a simple pole at s=1 exactly when π≅π′, and is holomorphic and nonzero there otherwise. A nontrivial unitary twist can move the pole; being a twist alone is not the criterion at the fixed point s=1.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §5.5, Theorem 5.5.2 and proof, pp. 81–82 (arXiv v4).

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-part-of-compatible-system"></a>

### A potentially diagonalizable polarized representation lies in a compatible system (Theorem 5.5.1)

Target `ML.2/part-of-compatible-system`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.exists_compatibleSystem`.

Let F be CM, l ≥ 2(n + 1) with ζ_l ∉ F, and (r, µ) an n-dimensional totally odd regular algebraic polarized l-adic representation of G_F, potentially diagonalizable above l with r̄|_{G_{F(ζ_l)}} irreducible. Then r is part of a strictly pure compatible system of l-adic representations of G_F.

Hypotheses:

- F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).

Proof route:

1. potential-automorphy-theorem gives F′/F Galois CM, disjoint from F⁰F̄^{ker r̄} (F⁰ cut out by the component group of the Zariski closure of r), and (π, χ) over F′ with r_{l,ı}(π) = r|_{G_{F′}}; soluble descent gives π(F″) for F′/F″ soluble.
2. For each (l′, ı′), decompose r_{l′,ı′}(π) into irreducibles; the component groups are independent of l′ (Lemma 5.3.1), so the pieces descend to each F″.
3. Brauer: 1 = Σ n_i Ind_{F′_i}ψ_i with F′/F′_i soluble; set A_{l′,ı′,α} = Σ n_i ind_{F′_i/F}([r_{l′,ı′}(π(F′_i))_α][ı′^{−1}ψ_i]) in Rep_{F,l′}; dim A = dim r_{l′,ı′}(π)_α and (A, A) = 1, so A = [r_{l′,ı′,α}] is a genuine irreducible representation (PM R24.5/galois-grothendieck-ring).
4. r_{l′,ı′} = ⊕_α r_{l′,ı′,α} has r_{l,ı} ≅ r; its Weil–Deligne representations are pure (Theorem 2.1.1, Lemma 1.3.6) and have l′-independent traces, so the system is strictly pure and compatible.

Direct prerequisites: [ML.2/potential-automorphy-theorem](#target-potential-automorphy-theorem), [ML.2/potential-automorphy-totally-real](#target-potential-automorphy-totally-real), `PotentialAutomorphyInfrastructurePartII:PL.0/automorphy-under-twist`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`, `PotentialModularityAndCompatibleSystems:R24.5/galois-grothendieck-ring`, `PotentialModularityAndCompatibleSystems:R24.5/rank-two-reducibility-independent-of-lambda`, `AutomorphicGaloisRepresentationsPartII:AG2.2`.

Acceptance controls:

- Check the Grothendieck-ring step: (A, A) = 1 with dim A ≥ 0 is exactly the criterion recorded in PM R24.5/galois-grothendieck-ring (4).

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §5.5, Theorem 5.5.1 and proof, pp. 79–81 (arXiv v4).

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-compatible-system-from-potential-automorphy"></a>

### A potentially automorphic geometric GSp_{2n}-lift lies in a strictly pure compatible system (FKP, after BLGGT 5.5.1)

Target `ML.2/compatible-system-from-potential-automorphy`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.compatibleSystem_of_potentiallyAutomorphic`.

Let F be totally real and ρ : Γ_F → GSp_{2n}(O′) geometric with Zariski-dense image such that ρ|_{Γ_{F′}} ≅ r_ι(Π_{F′}) for a RAESDC Π_{F′} of GL_{2n}(𝔸_{F′}), F′/F Galois totally real. Then ρ belongs to a strictly pure compatible system {ρ_{ι′}} of ℓ-adic representations of Γ_F indexed by primes ℓ and ι′ : ℂ ≅ Q̄_ℓ, each with Zariski-dense image in GSp_{2n}.

Hypotheses:

- As stated.

Proof route:

1. The argument of BLGGT Theorem 5.5.1 (ML.2/part-of-compatible-system): Brauer's induction over the soluble subextensions of F′/F, with soluble descent (PotentialAutomorphyInfrastructurePartII PL.0/soluble-descent).
2. Zariski density for all ι′ from that of ρ (Larsen–Pink style independence; FKP's argument).

Direct prerequisites: [ML.2/part-of-compatible-system](#target-part-of-compatible-system), `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`.

Acceptance controls:

- The GSp-valued refinement of ML.2/part-of-compatible-system.

Sources: [N. Fakhruddin, C. Khare, S. Patrikis, Lifting and automorphy of reducible mod p Galois representations over global fields](https://arxiv.org/pdf/2008.12593v5), §9, proof of Proposition 9.1, arXiv v5 p. 43.

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-decomposition-into-irreducible-systems"></a>

### Splitting a polarized system into irreducible systems (Theorem 5.5.3)

Target `ML.2/decomposition-into-irreducible-systems`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.eq_sum_irreducible_systems`.

Let F be CM and ℛ a pure, extremely regular, totally odd, polarizable weakly compatible system of G_F. Then ℛ = ℛ_1 ⊕ ⋯ ⊕ ℛ_s with each ℛ_i an irreducible, strictly pure, totally odd, polarizable compatible system.

Hypotheses:

- (ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.

Proof route:

1. Choose L of density 1 for residual-irreducibility-density-one and constituents-potentially-automorphic; pick λ | l ∈ L with l ≥ 2(n + 1), unramified, Fontaine–Laffaille Hodge–Tate range; decompose r_λ = ⊕ r_{λ,α}.
2. part-of-compatible-system puts each r_{λ,α} in a strictly pure compatible system ℛ_α; over F′ it is the system of an extremely regular π_α, so irreducibility-density-one makes ℛ_α irreducible on a density-one set.
3. Compare Frobenius polynomials: ⊕ℛ_α and ℛ agree at r_λ, hence everywhere.

Direct prerequisites: [ML.2/part-of-compatible-system](#target-part-of-compatible-system), [ML.2/irreducibility-density-one](#target-irreducibility-density-one), [ML.2/constituents-potentially-automorphic](#target-constituents-potentially-automorphic), `PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one`.

Acceptance controls:

- Check the degenerate case s = 1: an irreducible system is its own decomposition, with the added conclusion of strict purity.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §5.5, Theorem 5.5.3 and proof, p. 82 (arXiv v4).

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-dwork-fibre-automorphy-transport"></a>

### Automorphy of the Dwork fibre at l′ and its transport to l (Qian §4)

Target `ML.2/dwork-fibre-automorphy-transport`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.dworkTransport`.

Let t∈F′ be the chosen Dwork point, with its fixed eigenprojector and realizations V_{λ,t}, V_{λ′,t}. The auxiliary-prime ordinary lifting theorem gives V_{λ′,t}≅r_{l′,ι′}(π) for a regular algebraic cuspidal π, after the Teichmüller character twist. At good places the eigenprojector gives a common Frobenius polynomial over ℚ(ζ_N), or its real subfield when n=2. Choose ι and ι′ to induce the same embedding of that coefficient field into ℂ, conjugating π if necessary. Then V_{λ,t}^{ss}≅r_{l,ι}(π). For the arbitrary semisimple residual input of Theorem 1.1, neither semisimplicity of V_{λ,t} nor ramified monodromy compatibility follows from this comparison. If its residual representation χ̄₁⊗r̄|G_{F′} is absolutely irreducible, as in Theorem 1.4, then V_{λ,t} is irreducible and the semisimplification may be removed.

Hypotheses:

- The Dwork point and auxiliary-prime lifting hypotheses of Qian §4; matched coefficient embeddings; the character twist is the actual Teichmüller lift used by the ordinary lifting output.

Proof route:

1. Apply ACC+ Theorem 6.1.2 at l′ with ordinary regular weights, enormous image, decomposed genericity and the scalar element. Retain the resulting cuspidal representation and the actual character twist.
2. Obtain coefficient-independent good-place eigenprojector traces by the Lefschetz trace formula applied to symmetry elements composed with Frobenius. Match the coefficient embeddings.
3. Apply Chebotarev and Brauer–Nesbitt to identify the semisimplification with the same automorphic system member. For reducible residual input use the graded lattice from a composition series: its reduction is the original semisimple residual module. Use the Steinberg slope argument on this semisimplification. Absolutely irreducible residual input forces the original fibre to be irreducible.

Direct prerequisites: [ML.2/elliptic-symmetric-power-seed](#target-elliptic-symmetric-power-seed), `PotentialAutomorphyInfrastructure:PA.4`, `PotentialAutomorphyInfrastructurePartII:PL.5`, [Chebotarev](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev), `PotentialAutomorphyInfrastructure:PA.4/ordinary-automorphy-lifting`.

Acceptance controls:

- The transport between coefficient primes is the step where the compatible system of the Dwork motive is used.

Sources: [Lie Qian, Potential automorphy for GL_n](https://arxiv.org/pdf/2104.09761), §4, proof of Theorem 1.1, p. 24 (arXiv v1); Invent. pp. 1272–1273 per routed locator; [P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999), §6.1, Theorem 6.1.2, hypothesis (5), arXiv v2 p. 133 (Annals p. 1030).

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-multiple-product-l-functions"></a>

### Tensor products of non-CM modular forms (Corollary 5.4.4)

Target `ML.2/multiple-product-l-functions`; application. Proposed declaration: `TauCeti.PotentialAutomorphy.multipleProduct_meromorphic`.

Let K ⊆ ℤ_{>0} be finite with the 2^{#K} partial sums of its elements distinct, and f_k (k ∈ K) non-CM newforms of weight k + 1 with automorphic π_k. Then there are a totally real Galois F/ℚ and a regular algebraic polarizable cuspidal Π on GL_{2^{#K}}(𝔸_F) with rec(Π_v|det|^{(1−2^{#K})/2}) = (⊗_k rec(π_{k,v|ℚ}|det|^{−1/2}))|_{W_{F_v}} for almost all v; in particular L(×_k π_k, s) continues meromorphically to ℂ.

Hypotheses:

- f_k non-CM; the partial-sum condition gives regularity of ⊗_k r_{k,λ}.

Proof route:

1. Apply compatible-systems-potentially-automorphic to ⊗_K r_{k,λ}.
2. Irreducibility (Goursat): the Zariski closure H̄ of (∏ r_{k,λ})(G_ℚ) in PGL_2^K surjects onto each factor; as PGL_2 is simple with only inner automorphisms, H̄ = PGL_2^I with K = ⊔ K_i mapping diagonally; #K_i > 1 would give r_{k,λ} ≅ r_{k′,λ} ⊗ χ with χ de Rham, contradicting Hodge–Tate numbers; so H ⊇ SL_2^K, whose tensor representation is irreducible.

Direct prerequisites: [ML.2/compatible-systems-potentially-automorphic](#target-compatible-systems-potentially-automorphic), [ML.2/compatible-system-l-function-continuation](#target-compatible-system-l-function-continuation), `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`.

Acceptance controls:

- Check the partial-sum condition on K = {1, 2, 4}: the 8 subset sums 0, …, 7 are distinct; on K = {1, 2, 3} they are not (1 + 2 = 3) (suggested file).

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §5.4, Corollary 5.4.4 and proof, pp. 75–76 (arXiv v4).

Suggested signature: omitted until C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-patrikis-taylor-l-function-consequences"></a>

### Purity, functional equation and strict compatibility from potential automorphy (Patrikis–Taylor, Corollary 2.2)

Target `ML.2/patrikis-taylor-l-function-consequences`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.patrikisTaylor_lFunction`.

Let R = {r_ℓ} be a weakly compatible system of G_ℚ that is pure of weight w, regular and odd essentially self-dual. Then for distinct primes p, ℓ the Weil–Deligne representation WD_p(R) attached to r_ℓ is pure of weight w (Frobenius eigenvalues on gr_a of the monodromy filtration are p-Weil numbers of weight w + a), R is strictly compatible, and the completed L-function Λ(R, s) = L_∞(R, s) ∏_{p ∈ S} L(WD_p(R), s) L^S(R, s) has meromorphic continuation and satisfies Λ(R, s) = ε(R, s) Λ(R^∨, 1 − s).

Hypotheses:

- As in ML.2/patrikis-taylor-potential-automorphy.

Proof route:

1. Potential automorphy over F′ (previous node), Brauer's induction theorem over the soluble subfields of F′/ℚ and Godement–Jacquet for each piece (ML.2/compatible-system-l-function-continuation), with local–global compatibility (Caraiani) for purity of WD_p.

Direct prerequisites: [ML.2/patrikis-taylor-potential-automorphy](#target-patrikis-taylor-potential-automorphy), [ML.2/compatible-system-l-function-continuation](#target-compatible-system-l-function-continuation), [ML.0/compatible-system-archimedean-factors](#target-compatible-system-archimedean-factors).

Acceptance controls:

- Fresán–Sabbah–Yu Remark 5.41: strict compatibility gives semistability of the Kloosterman representations at p.

Sources: [J. Fresán, C. Sabbah, J.-D. Yu, Hodge theory of Kloosterman connections](https://arxiv.org/pdf/1810.06454v5), §5.3.2, Corollary 5.39 ([44, Cor. 2.2 (ii)]), arXiv v5 p. 57; [J. Fresán, C. Sabbah, J.-D. Yu, Hodge theory of Kloosterman connections](https://arxiv.org/pdf/1810.06454v5), Remark 5.41, arXiv v5 p. 59; [Stefan Patrikis and Richard Taylor, Automorphy and irreducibility of some l-adic representations](https://virtualmath1.stanford.edu/~rltaylor/irred.pdf), Corollary 2.2, §2, p. 13.

Suggested signature: omitted until C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-qian-residual-potential-automorphy"></a>

### Residual potential ordinary automorphy over CM fields (Qian, Theorem 1.1)

Target `ML.2/qian-residual-potential-automorphy`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.qian_residual`.

Let F be a CM number field, F^av/F a finite extension, n ≥ 2, l a prime and r̄ : G_F → GL_n(F_{l^s}) a continuous semisimple representation. Then there is a finite CM Galois extension F′/F, linearly disjoint from F^av over F, such that r̄|_{G_{F′}} is ordinarily automorphic: it has a lift r ≅ r_{l,ι}(π) with π regular algebraic cuspidal on GL_n(𝔸_{F′}) and r|_{G_{F′_v}} potentially semistable and ordinary with regular Hodge–Tate weights for all v | l. No polarization, oddness or residual image hypothesis is imposed.

Hypotheses:

- F CM; r̄ semisimple, of any dimension n ≥ 2 and any residual characteristic l.

Proof route:

1. Choose the auxiliary data E, N, F^avoid and an ordinary auxiliary prime l′ (ML.2/qian-auxiliary-prime).
2. Automorphy of Sym^{n−1} of the elliptic curve at l′ over a totally real F^suff (ML.2/elliptic-symmetric-power-seed).
3. Moret-Bailly gives a point t of the Dwork family over F′ with the l-adic fibre lifting r̄ ⊗ (twist) and the l′-adic fibre congruent to Sym^{n−1} of E (PotentialAutomorphyInfrastructurePartII PL.5; PotentialModularityAndCompatibleSystems R23.1).
4. Lift at l′ with ACC+ Theorem 6.1.2 and transport to V_{λ,t}^{ss} with matched coefficient embeddings. The auxiliary-prime semisimplicity and Steinberg slope argument give ordinary automorphy at l. The graded lattice reduces to the original semisimple r̄. The irreducible-residual converse from Galois ordinarity is used only in the Theorem 1.4 branch, not to prove the general semisimple Theorem 1.1.

Direct prerequisites: [ML.2/qian-auxiliary-prime](#target-qian-auxiliary-prime), [ML.2/elliptic-symmetric-power-seed](#target-elliptic-symmetric-power-seed), [ML.2/dwork-fibre-automorphy-transport](#target-dwork-fibre-automorphy-transport), [ML.2/steinberg-ordinarity-lemma](#target-steinberg-ordinarity-lemma), `PotentialModularityAndCompatibleSystems:R23.1`, `PotentialAutomorphyInfrastructurePartII:PL.5`.

Acceptance controls:

- The output is automorphy over the extension F′ only (acceptance of ML.2); no descent to F is claimed.

Sources: [Lie Qian, Potential automorphy for GL_n](https://arxiv.org/pdf/2104.09761), Theorem 1.1, §1, p. 1 (arXiv v1); Invent. pp. 1239–1240 per routed locator; proof §4, pp. 21–24 (arXiv v1).

Suggested signature: omitted until C-MODULI supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-qian-ordinary-potential-automorphy"></a>

### Potential automorphy of ordinary l-adic representations over CM fields (Qian, Theorem 1.4)

Target `ML.2/qian-ordinary-potential-automorphy`; theorem. Proposed declaration: `TauCeti.PotentialAutomorphy.qian_ordinary`.

Let F be a CM field, F^av/F finite, n ≥ 2, l > n a prime, ι : Q̄_l ≅ ℂ and r : G_F → GL_n(Q̄_l) continuous with (i) r unramified almost everywhere; (ii) r|_{G_{F_v}} potentially semistable and ordinary with regular Hodge–Tate weights for each v | l; (iii) r̄ absolutely irreducible and decomposed generic, with r̄(G_{F(ζ_l)}) enormous; (iv) some σ ∈ G_F − G_{F(ζ_l)} has r̄(σ) scalar. Then there is a finite CM Galois F′/F, linearly disjoint from F^av over F, such that r|_{G_{F′}} is ordinarily automorphic. The bound l > n comes from ACC+ Theorem 6.1.2(4) (printed without it: recorded as a source issue).

Hypotheses:

- As in the statement; F^av arbitrary.

Proof route:

1. Apply ML.2/qian-residual-potential-automorphy to r̄ with F^av enlarged to contain F̄^{ker r̄}(ζ_l).
2. Conclude by ACC+ Theorem 6.1.2 (ordinary automorphy lifting over CM fields), requested from PotentialAutomorphyInfrastructure PA.4 (RT-AREA-langlands-1/7).

Direct prerequisites: [ML.2/qian-residual-potential-automorphy](#target-qian-residual-potential-automorphy), `PotentialAutomorphyInfrastructure:PA.4`, `PotentialAutomorphyInfrastructure:PA.4/ordinary-automorphy-lifting`.

Acceptance controls:

- Specialises to Qian's Theorem 1.1 lifts when r is itself ordinary.

Sources: [Lie Qian, Potential automorphy for GL_n](https://arxiv.org/pdf/2104.09761), Theorem 1.4, §1, p. 2 (arXiv v1); Invent. p. 1241 per routed locator; proof: last paragraph of §4, p. 26 (arXiv v1).

Suggested signature: omitted until C-LOCAL-DEFORMATION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

### ML.2 acceptance and supplier refinements

Check every target at the displayed hypotheses and source scope, every definition against its negative controls, and every direct prerequisite against the exact export. The target-level chains end in a baseline declaration, a checked external node, a requested supplier stage or the named gaps below.

- Obtain typed C-SYSTEM/C-LOCAL-DEFORMATION/C-MODULI exports for the seventeen-condition p–r switch, actual local points and common all-prime realization.
- Construct Dwork monodromy/Hodge and auxiliary-prime extensions and the CG18 general-number-field conditional branch.
- Export Patrikis–Taylor’s regular/pure constituent systems and common extension from R24.5, distinct from extreme regularity.

## Layer ML.3: Symmetric powers and Sato–Tate

Import the symmetric-power proof methods from their reviewed Part II owners. State the Newton–Thorne and BCGNT endpoints with their full local and residual conditions. Use purity of the same Frobenius polynomials, exact continuation and boundary nonvanishing, and normalized conjugacy classes to obtain Ramanujan and equidistribution.

Atlas planets: Symmetric power functoriality in level one; Symmetric power functoriality for non-CM forms; Sato–Tate for elliptic curves over ℚ; Symmetric powers of Hilbert modular forms; Sato–Tate for elliptic curves over CM fields; Ramanujan conjecture for Bianchi modular forms.

<a id="target-accessible-regular-refinement"></a>

### Accessible and n-regular refinements

Target `ML.3/accessible-regular-refinement`; comparison. Proposed declaration: `TauCeti.SymmetricPower.IsAccessibleRefinement`.

Import owner: **LocalGlobalCompatibilityPartIIEigenvarietyCompanions**. This target records its required export; its method is built by that owner.

For a definite unitary group G_n over F⁺ and an automorphic π of G_n(𝔸_{F⁺}) with p-adic places S_p, an accessible refinement is a choice χ = (χ_v)_{v∈S_p} of smooth characters χ_v : T_n(F_ṽ) → Q̄_p^× occurring as subquotients of the normalised Jacquet module ι^{−1}r_{N_n}(π_v), equivalently with π_v ↪ i^{GL_n}_{B_n}ιχ_v. For n = 2 it is n-regular if (χ_{v,1}/χ_{v,2})^i ≠ 1 for 1 ≤ i ≤ n − 1 and every v ∈ S_p. For π on GL₂(𝔸_ℚ), π_l has an accessible refinement iff its Jacquet module is nonzero, iff π_l is not supercuspidal.

Hypotheses:

- G_n the definite unitary group of NT §1; T_n ⊂ B_n ⊂ GL_n diagonal torus and upper Borel.

Proof route:

1. This node retains the historical id and the exact consumer statement as an import contract. The construction and proof belong to LocalGlobalCompatibilityPartIIEigenvarietyCompanions. Use its requested export with these source hypotheses. ML does not reproduce the method.

Direct prerequisites: the exact export requested from its named import owner.

Consumers:

- [ML.3/eigenvariety-propagation](#target-eigenvariety-propagation): the regularity hypotheses (1)–(2)
- [ML.3/non-supercuspidal-symmetric-powers](#target-non-supercuspidal-symmetric-powers): Proposition 8.2 and 8.3

Planning API:

- `TauCeti.SymmetricPower.IsAccessibleRefinement` — χ_v a subquotient of the normalised Jacquet module at each v ∈ S_p.
- `TauCeti.SymmetricPower.IsNRegular` — (χ_{v,1}/χ_{v,2})^i ≠ 1 for 1 ≤ i ≤ n − 1.
- `TauCeti.SymmetricPower.isAccessible_iff_not_supercuspidal` — An accessible refinement exists iff π_l is not supercuspidal.
- `TauCeti.SymmetricPower.isNRegular_mono` — n-regular ⇒ m-regular for m ≤ n.

Definition tests:

- `TauCeti.SymmetricPower.unramified_refinement` (computation) — π_l unramified with Satake parameters {α, β}: the two refinements are (α, β) and (β, α); n-regular iff (α/β)^i ≠ 1 for i < n.
- `TauCeti.SymmetricPower.steinberg_refinement` (computation) — π_l a twist of Steinberg has exactly one accessible refinement.
- `TauCeti.SymmetricPower.supercuspidal_none` (computation) — π_l supercuspidal has no accessible refinement (the hypothesis of NT I Theorem B).
- `TauCeti.SymmetricPower.not_regular_example` (computation) — α/β = −1 is 2-regular but not 3-regular: (α/β)² = 1.

Acceptance controls:

- Check that an n-regular refinement excludes the ratio being an i-th root of unity for i < n: the condition keeps Sym^{n−1} of the refinement regular.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3), §2, p. 34, and Definition 2.23, p. 40 (arXiv v3).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-buzzard-kilford-eigencurve"></a>

### The tame-level-one 2-adic eigencurve near the boundary (Buzzard–Kilford)

Target `ML.3/buzzard-kilford-eigencurve`; comparison. Proposed declaration: `TauCeti.SymmetricPower.buzzardKilford`.

Import owner: **SymmetricPowersByAnalyticContinuation**. This target records its required export; its method is built by that owner.

For p = 2 and N = 1, E₀ lies over the component W₀⁺ (χ(−1) = 1) of weight space, and w = χ_u(5) − 1 identifies W₀⁺ with {|w| < 1}. Over the annulus W₀(b) = {|8| < |w| < 1}, E₀(b) = κ^{−1}(W₀(b)) is a disjoint union ⊔_{i≥1}X_i of admissible opens with κ|_{X_i} an isomorphism onto W₀(b), and on X_i the slope is i·v₂(w).

Hypotheses:

- p = 2, tame level 1.

Proof route:

1. This node retains the historical id and the exact consumer statement as an import contract. The construction and proof belong to SymmetricPowersByAnalyticContinuation. Use its requested export with these source hypotheses. ML does not reproduce the method.

Direct prerequisites: the exact export requested from its named import owner.

Acceptance controls:

- Check the consequence used: every irreducible component of E₀ meets κ^{−1}(W₀(b)), so it contains some X_i.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3), §3, Theorem 3.2, pp. 53–54 (arXiv v3).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-eigenvariety-propagation"></a>

### Automorphy of Sym^{n−1} is constant on eigencurve components (NT I Theorem 2.33)

Target `ML.3/eigenvariety-propagation`; comparison. Proposed declaration: `TauCeti.SymmetricPower.automorphic_of_same_component`.

Import owner: **SymmetricPowersByAnalyticContinuation**. This target records its required export; its method is built by that owner.

Let (π₀, χ₀), (π′₀, χ′₀) be refined points of the eigencurve E₀ (tame level N, prime p) with corresponding points z₀, z′₀. Suppose either (1) χ₀ is numerically non-critical and n-regular, (2) χ′₀ is n-regular, (3) the Zariski closures of r_{π₀,ι}(G_{ℚ_p}) and r_{π′₀,ι}(G_{ℚ_p}) contain SL₂, (4) Sym^{n−1}r_{π₀,ι} is automorphic; or (1ord) χ₀ is ordinary, (2ord) π₀, π′₀ are not CM, (3ord) Sym^{n−1}r_{π₀,ι} is automorphic. If z₀, z′₀ lie on a common irreducible component of E_{0,ℂ_p}, then Sym^{n−1}r_{π′₀,ι} is automorphic.

Hypotheses:

- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.
- E₀ the Coleman–Mazur eigencurve and E_n the eigenvariety of a definite unitary group in n variables (PadicFamilies L2).

Proof route:

1. This node retains the historical id and the exact consumer statement as an import contract. The construction and proof belong to SymmetricPowersByAnalyticContinuation. Use its requested export with these source hypotheses. ML does not reproduce the method.

Direct prerequisites: the exact export requested from its named import owner.

Acceptance controls:

- Check the ordinary variant: an ordinary refinement is automatically numerically non-critical, and Hida families replace eigencurve components.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3), §2, Theorem 2.33, pp. 50–51 (arXiv v3).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-l-function-equidistribution-criterion"></a>

### Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)

Target `ML.3/l-function-equidistribution-criterion`; theorem. Proposed declaration: `TauCeti.SymmetricPower.equidistributed_of_lFunctions`.

Let K be a compact group with conjugacy-class space X, x_i ∈ X with norms N(x_i) ≥ 2, such that ∏(1 − N(x_i)^{−s})^{−1} converges for Re s > 1 and continues to a neighbourhood of Re s ≥ 1 with no zeros or poles except a simple pole at 1, and for each irreducible ρ, L(s, ρ) = ∏ det(1 − ρ(x_i)N(x_i)^{−s})^{−1} continues likewise with no zeros or poles on Re s ≥ 1 except possibly at 1. Then #{i : N(x_i) ≤ n} ~ n/log n, Σ_{N(x_i)≤n}χ(x_i) = c(χ)n/log n + o(n/log n) with −c(χ) the order of vanishing of L(s, ρ) at 1; if at most boundedly many x_i share a norm, the x_i are Haar-equidistributed iff c(χ) = 0 for every nontrivial irreducible χ (Peter–Weyl/Weyl criterion).

Hypotheses:

- K a compact group (a compact Lie group in the application); ρ irreducible continuous representations.

Proof route:

1. Prime-number-theorem argument for each L(s, ρ): logarithmic derivative, Wiener–Ikehara (AnalyticNumberTheory AN.2), Kedlaya Theorem 24.2.
2. Peter–Weyl: finite linear combinations of irreducible characters are dense in the continuous class functions; orthogonality gives the integrals.

Direct prerequisites: `AnalyticNumberTheory:AN.2`, [RepresentationTheory/CompactGroups](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md#layer-5-the-peter-weyl-theorem), [RepresentationTheory/CompactGroups](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md#layer-6-characters-of-compact-groups), `mathlib:Matrix.trace`.

Acceptance controls:

- Check the Chebotarev instance: K finite, ρ irreducible, recovering Kedlaya §22.5.

Sources: [Kiran S. Kedlaya, Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §§24.1–24.3, Theorem 24.1, Theorem 24.2 and Conjecture 24.3, printed pp. 133–134.

Suggested signature: omitted until C-EQUIDISTRIBUTION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-level-one-ping-pong"></a>

### Symmetric powers for one level-one form give them for all (NT I Theorem 3.1 = Theorem D)

Target `ML.3/level-one-ping-pong`; comparison. Proposed declaration: `TauCeti.SymmetricPower.symPower_levelOne_propagate`.

Import owner: **SymmetricPowersByAnalyticContinuation**. This target records its required export; its method is built by that owner.

Fix n ≥ 2. If π₀ is an everywhere unramified cuspidal π of weight k ≥ 2 with Sym^{n−1}r_{π₀,ι} automorphic for some (equivalently any) p and ι, then Sym^{n−1}r_{π,ι} is automorphic for every everywhere unramified cuspidal π of weight ≥ 2.

Hypotheses:

- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

Proof route:

1. This node retains the historical id and the exact consumer statement as an import contract. The construction and proof belong to SymmetricPowersByAnalyticContinuation. Use its requested export with these source hypotheses. ML does not reproduce the method.

Direct prerequisites: the exact export requested from its named import owner.

Acceptance controls:

- Check the key numerical identity v₂(α) + v₂(β) = k − 1 for the two roots of X² − a₂X + 2^{k−1}, which gives i + i′ = (k − 1)/v₂(w).

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3), §3, Theorem 3.1, p. 53; Introduction pp. 3–4 (arXiv v3).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-n-regular-congruences"></a>

### Congruences to n-regular forms (NT I Proposition 8.3)

Target `ML.3/n-regular-congruences`; comparison. Proposed declaration: `TauCeti.SymmetricPower.exists_nRegular_congruence`.

Import owner: **SymmetricPowersByUnitaryLevelRaising**. This target records its required export; its method is built by that owner.

Let π be non-CM of weight k ≥ 2 with π_l non-supercuspidal for every l. Then there are a prime p > max(2(n + 1), (n − 1)k), ι, and π′ of weight k with r̄_{π,ι}(G_ℚ) ⊇ a conjugate of SL₂(F_p), π_p and π′_p unramified, r̄_{π,ι} ≅ r̄_{π′,ι}, and π′_l non-supercuspidal with all accessible refinements n-regular wherever π′_l is ramified.

Hypotheses:

- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

Proof route:

1. This node retains the historical id and the exact consumer statement as an import contract. The construction and proof belong to SymmetricPowersByUnitaryLevelRaising. Use its requested export with these source hypotheses. ML does not reproduce the method.

Direct prerequisites: the exact export requested from its named import owner.

Acceptance controls:

- Check the numerical bound p > (n − 1)k: it keeps Sym^{n−1} of the residual representation in the Fontaine–Laffaille range.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3), §8, Proposition 8.3, pp. 92–93 (arXiv v3).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-one-level-one-symmetric-power"></a>

### One level-one form with automorphic Sym^{n−1} (NT I Theorem 7.6 = Theorem E)

Target `ML.3/one-level-one-symmetric-power`; comparison. Proposed declaration: `TauCeti.SymmetricPower.exists_levelOne_symPower`.

Import owner: **SymmetricPowersByUnitaryLevelRaising**. This target records its required export; its method is built by that owner.

For every n ≥ 3 there is a cuspidal, everywhere unramified π of GL₂(𝔸_ℚ) of weight k ≥ 2 such that Sym^{n−1}r_{π,ι} is automorphic for every ι.

Hypotheses:

- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

Proof route:

1. This node retains the historical id and the exact consumer statement as an import contract. The construction and proof belong to SymmetricPowersByUnitaryLevelRaising. Use its requested export with these source hypotheses. ML does not reproduce the method.

Direct prerequisites: the exact export requested from its named import owner.

Acceptance controls:

- Check that the strategy uses small residual image and large p, in contrast to Clozel–Thorne's large image and small p.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3), §7, Theorem 7.6, p. 89; Introduction p. 4 (arXiv v3).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-parallel-weight-and-clozel-purity"></a>

### Parallel weight for GL₂ over CM fields, and Clozel's purity lemma

Target `ML.3/parallel-weight-and-clozel-purity`; definition. Proposed declaration: `TauCeti.SymmetricPower.IsParallelWeight`.

Let F be a number field and π a regular algebraic representation of GL₂(𝔸_F) of weight λ = (λ_{τ,1} ≥ λ_{τ,2})_τ. π has parallel weight if λ_{τ,1} − λ_{τ,2} is independent of τ, equivalently if π has a regular algebraic twist of weight (m − 1, 0)_τ for some m ≥ 1; it has parallel weight k ≥ 2 if that twist has weight (k − 2, 0)_τ. Clozel's purity lemma: for F imaginary CM and π cuspidal regular algebraic on GL₂(𝔸_F), λ_{τ,1} + λ_{τc,2} = w is independent of τ, so π is of parallel weight when F is imaginary quadratic (BCGNT §1.6).

Hypotheses:

- F a number field (CM for the purity lemma); π regular algebraic.

Proof route:

1. Definition by the weight λ; purity lemma: Clozel 1990, Lemme 4.9 (owner: AutomorphicFormsOnReductiveGroups AF.4).

Direct prerequisites: `AutomorphicFormsOnReductiveGroups:AF.4`, `AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`.

Consumers:

- `BCGNT 2025, Theorems A and B`: hypothesis: π of parallel weight
- [ML.3/bianchi-ramanujan](#target-bianchi-ramanujan): parallel-weight Ramanujan over CM fields

Planning API:

- `TauCeti.SymmetricPower.IsParallelWeight` — For an actual weight function λ:Hom(F,ℂ)→ℤ², the difference λ_{τ,1}−λ_{τ,2} is independent of τ. The Lean form is over any embedding-index type; attachment to π is supplied by AF.4.
- `TauCeti.SymmetricPower.parallelWeight` — At an embedding τ define k=λ_{τ,1}−λ_{τ,2}+2. For dominant weights k≥2; under IsParallelWeight it is independent of the chosen embedding.
- `TauCeti.SymmetricPower.IsParallelWeight.twist` — Adding the same algebraic character weight a_τ to both coordinates at τ preserves the weight-difference predicate, in both directions.
- `TauCeti.SymmetricPower.clozel_purity` — F imaginary CM, π cuspidal regular algebraic on GL₂: λ_{τ,1} + λ_{τc,2} is independent of τ.
- `TauCeti.SymmetricPower.isParallelWeight_of_imagQuadratic` — F imaginary quadratic ⇒ every cuspidal regular algebraic π on GL₂ has parallel weight.
- `TauCeti.SymmetricPower.parallelWeight_independent` — If the actual weight function is parallel, k computed at τ equals k computed at σ.

Definition tests:

- `TauCeti.SymmetricPower.parallelWeight_Q` (degenerate) — On the one-element embedding-index type, every weight function has constant difference.
- `TauCeti.SymmetricPower.parallelWeight_two` (computation) — The weight function (0,0) on two embeddings is parallel and has k=2. The elliptic-curve comparison requires its actual attached weight, not a supplied equality assumption.
- `TauCeti.SymmetricPower.nonParallel_hilbert` (non-example) — On two embeddings, weights (0,0) and (2,0), corresponding to Hilbert weights (2,4), fail the parallel predicate.

Acceptance controls:

- Every cuspidal Bianchi π (F imaginary quadratic) has parallel weight.

Sources: [George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880), Definition 1.6.1 (Parallel Weight) and the following paragraph, §1.6 Notation, arXiv v3 p. 13 (= Definition 1.5.1, §1.5, published p. 11: arXiv numbering and pagination differ).

Suggested signature: the weight-level definition and its concrete tests are stated. The automorphic/Clozel/imaginary-quadratic comparisons require C-COHERENT-GEOMETRY, C-AUTOMORPHIC and are omitted.

<a id="target-projective-image-sandwich"></a>

### Finite-field projective-image sandwich

Target `ML.3/projective-image-sandwich`; definition. Proposed declaration: `TauCeti.SymmetricPower.ProjectiveImageSandwich`.

Let G be a group, k a finite field embedded by ι into a field K, and ρ:G→GL₂(K). ProjectiveImageSandwich(p,a,n,ι,ρ) means: p prime, a≥1, n≥1, #k=p^a>max(5,2n−1), and for one c∈PGL₂(K), the conjugate by c of the range of Pρ contains the embedded PSL₂(k) and is contained in the embedded PGL₂(k). Both embeddings use ι. Specialization to K=F̄_p gives exactly the residual-image hypothesis of NT II Theorem 2.1. The definition does not assert automorphy lifting or require p>n.

Hypotheses:

- Exactly the domains and hypotheses stated.

Proof route:

1. Use the existing library objects and the explicit formula. The API records the consumer comparison; no missing automorphic carrier is replaced by free data.

Direct prerequisites: `mathlib:Matrix.ProjGenLinGroup`, `mathlib:Matrix.ProjGenLinGroup.mk`, `mathlib:Matrix.ProjGenLinGroup.map`, `mathlib:Matrix.ProjectiveSpecialLinearGroup.toPGL`.

Consumers:

- [ML.3/symmetric-power-automorphy-lifting](#target-symmetric-power-automorphy-lifting): Supplies a faithful expressible residual-image condition for the requested lifting signature.

Planning API:

- `TauCeti.SymmetricPower.ProjectiveImageSandwich` — The explicit conjunction and two subgroup inclusions.
- `TauCeti.SymmetricPower.ProjectiveImageSandwich.bound` — The hypothesis gives p^a>max(5,2n−1).
- `TauCeti.SymmetricPower.ProjectiveImageSandwich.mono` — For 1≤m≤n the same data satisfy the rank-m bound.
- `TauCeti.SymmetricPower.ProjectiveImageSandwich.conjugation` — Conjugating the actual GL₂ representation preserves the condition.

Definition tests:

- `TauCeti.SymmetricPower.projectiveImage_F7_n3` (computation) — The identity representation of GL₂(F₇) satisfies the condition with p=7,a=1,n=3.
- `TauCeti.SymmetricPower.projectiveImage_F5_excluded` (non-example) — Over F₅ the strict bound fails for every representation when a=1.
- `TauCeti.SymmetricPower.projectiveImage_a0_excluded` (degenerate) — No data satisfy the condition with a=0.
- `TauCeti.SymmetricPower.projectiveImage_small_characteristic_bound` (computation) — p=2,a=3,n=4 passes the cardinality bound since 8>7, although p≤n. This tests the bound only, not an unspecified representation.

Acceptance controls:

- The identity representation of GL₂(F₇) satisfies the condition with p=7,a=1,n=3.
- Over F₅ the strict bound fails for every representation when a=1.
- No data satisfy the condition with a=0.
- p=2,a=3,n=4 passes the cardinality bound since 8>7, although p≤n. This tests the bound only, not an unspecified representation.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms, II](https://arxiv.org/pdf/2009.07180v2), Theorem 2.1, pp. 5–6, arXiv v2.

Suggested signature: stated with its API and tests.

<a id="target-purity-from-symmetric-powers"></a>

### Purity from potential weak automorphy of symmetric powers (BCGNT Lemma 6.1.3)

Target `ML.3/purity-from-symmetric-powers`; theorem. Proposed declaration: `TauCeti.SymmetricPower.purity_of_symPowers`.

Let R be a very weakly compatible system of rank 2 of G_F with H_τ = {0, m} for all τ, and v₀ ∉ S a finite place. If for infinitely many n ≥ 1 there is a finite Galois F_n/F such that Sym^{n−1}R|_{F_n} is weakly automorphic of level prime to the places above v₀, then the roots α₁, α₂ of Q_{v₀}(X) satisfy |ια_i|² = q_{v₀}^m for every ι.

Hypotheses:

- As stated.

Proof route:

1. Jacquet–Shalika bound for the unitary cuspidal constituents of the weakly automorphic Sym^{n−1}R|_{F_n} at places above v₀ (AutomorphicLFunctionsAndLocalFactors AL.2/jacquet-shalika-satake-bound): |α|^{n−1} ≤ q^{(n−1)m/2 + 1/2} for infinitely many n, hence |α|² = q^m (using det).

Direct prerequisites: `AutomorphicLFunctionsAndLocalFactors:AL.2/jacquet-shalika-satake-bound`, `PotentialModularityAndCompatibleSystems:R24.5:operations`.

Acceptance controls:

- The mechanism of ML.5/symmetric-power-functoriality-implies-ramanujan in the potential setting.

Sources: [George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880), Lemma 6.1.3 and proof (Jacquet–Shalika bound [JS81, Cor. 2.5]), §6.1, arXiv v3 p. 58 (published p. 52; arXiv pagination differs).

Suggested signature: omitted until C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-steinberg-level-raising"></a>

### Level raising to Steinberg for symmetric powers of theta series (NT I Theorems 4.1, 6.1, 7.1)

Target `ML.3/steinberg-level-raising`; comparison. Proposed declaration: `TauCeti.SymmetricPower.exists_steinberg_levelRaising`.

Import owner: **SymmetricPowersByUnitaryLevelRaising**. This target records its required export; its method is built by that owner.

Let n ≥ 3, p ≡ 1 (mod 48·n!), q ≠ p, X₀ a finite set of places of K prime to 2pq and ω a de Rham character with ωω^c = ε³, unramified on X₀. Then there is a soluble CM F/K, X₀-split, and a RACSDC ι-ordinary Π on GL_n(𝔸_F) with r_{Π,ι} ≅ ω^{n−1}|_{G_F} ⊗ Sym^{n−1}r_{σ₀,ι}|_{G_F}, the same Hodge–Tate numbers, and Π_v an unramified twist of Steinberg at some v | q (Theorem 7.1; proved here for n odd, Proposition 7.4; for n even via Anastassiades–Thorne).

Hypotheses:

- σ₀ a theta series congruent to the chosen level-one form (NT I §7); K an imaginary quadratic field.

Proof route:

1. This node retains the historical id and the exact consumer statement as an import contract. The construction and proof belong to SymmetricPowersByUnitaryLevelRaising. Use its requested export with these source hypotheses. ML does not reproduce the method.

Direct prerequisites: the exact export requested from its named import owner.

Acceptance controls:

- Check the arithmetic condition p ≡ 1 (mod 48·n!) on a small case: for n = 3, 48·3! = 288 and p = 577 is a prime ≡ 1 (mod 288) (suggested file).

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3), §7, Theorem 7.1, p. 82; §4 Theorem 4.1, p. 59; §6 Theorem 6.1, p. 75 (arXiv v3).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-bianchi-modular-forms"></a>

### Bianchi modular forms, their Fourier coefficients and parabolic cohomology

Target `ML.3/bianchi-modular-forms`; definition. Proposed declaration: `TauCeti.SymmetricPower.BianchiEigenform`.

Let F be imaginary quadratic. A cuspidal Bianchi modular eigenform of weight k ≥ 2 and level 𝔫 is a vector-valued function on GL₂(𝔸_F) generating a regular algebraic cuspidal automorphic representation π of parallel weight k (the infinitesimal character of π_∞ is that of (Sym^{k−2} ⊗ \overline{Sym^{k−2}})^∨), with Fourier expansion f((t z; 0 1)) = |t|_F Σ_{α ∈ F^×} c(αtδ_F, f) W(αt_∞) e_F(αz), coefficients c(I, f) vanishing unless I ⊂ O_F and normalised by c(O_F, f) = 1. Its Hecke eigenvalues also occur in the parabolic cohomology H_par ⊂ H¹(Γ₁(𝔫), Sym^{k−2}ℂ² ⊗ \overline{Sym^{k−2}ℂ²}) (Eichler–Shimura–Harder).

Hypotheses:

- F imaginary quadratic; k ≥ 2; 𝔫 a non-zero ideal.

Proof route:

1. Definition through the automorphic representation (Clozel's purity forces parallel weight; ML.3/parallel-weight-and-clozel-purity).
2. Fourier expansion via the Whittaker model (Hida; Williams).
3. Comparison with cohomology: Harder's Eichler–Shimura isomorphism (owner: ArithmeticLocallySymmetricSpaces).

Direct prerequisites: [ML.3/parallel-weight-and-clozel-purity](#target-parallel-weight-and-clozel-purity), `ArithmeticLocallySymmetricSpaces:ALS.3`.

Consumers:

- [ML.3/bianchi-fourier-ramanujan](#target-bianchi-fourier-ramanujan): the bound |c(𝔭, f)| ≤ 2N(𝔭)^{(k−1)/2}
- [ML.3/bianchi-mass-equidistribution](#target-bianchi-mass-equidistribution): the measures μ_f

Planning API:

- `TauCeti.SymmetricPower.BianchiEigenform` — A cuspidal Bianchi eigenform of weight k and level 𝔫.
- `TauCeti.SymmetricPower.BianchiEigenform.coeff` — The Fourier coefficient c(I, f).
- `TauCeti.SymmetricPower.BianchiEigenform.coeff_one` — c(O_F, f) = 1.
- `TauCeti.SymmetricPower.BianchiEigenform.coeff_eq_eigenvalue` — For 𝔭 ∤ 𝔫, c(𝔭, f) is the T_𝔭-eigenvalue.
- `TauCeti.SymmetricPower.BianchiEigenform.toAutRep` — The cuspidal automorphic representation of GL₂(𝔸_F) generated by f (parallel weight k).

Definition tests:

- `TauCeti.SymmetricPower.bianchi_weight2_elliptic` (computation) — A modular elliptic curve over F of conductor 𝔫 without CM by F gives a weight-2 Bianchi eigenform with c(𝔭, f) = N(𝔭) + 1 − #E(F_𝔭).
- `TauCeti.SymmetricPower.bianchi_coeff_nonintegral` (degenerate) — c(I, f) = 0 for I ⊄ O_F.
- `TauCeti.SymmetricPower.bianchi_not_holomorphic` (non-example) — Bianchi forms are not holomorphic functions on a Hermitian domain: ℍ³ is not Hermitian, so there is no q-expansion in holomorphic exponentials; the expansion involves the Bessel-type Whittaker function W.

Acceptance controls:

- The objects of Theorems E–G.

Sources: [George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880), §1.3 Bianchi Modular Forms, arXiv v3 pp. 9–11 (published pp. 8–10; arXiv pagination differs).

Suggested signature: omitted until C-COHERENT-GEOMETRY supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-serre-equidistribution-criterion"></a>

### Serre's equidistribution criterion through L-functions of representations of ST(π)

Target `ML.3/serre-equidistribution-criterion`; theorem. Proposed declaration: `TauCeti.SymmetricPower.serre_criterion`.

Let ST be a compact group and ([π_v])_{v ∉ S} conjugacy classes indexed by the finite places. For an irreducible representation ρ of ST put L^S(π, ρ, s) = ∏_{v ∉ S} det(1 − q_v^{−s}ρ([π_v]))^{−1}, absolutely convergent for Re s > 1. If for every non-trivial irreducible ρ, L^S(π, ρ, s) has meromorphic continuation to ℂ, holomorphic and non-vanishing on Re s = 1, then the [π_v] are equidistributed for the Haar probability measure of ST (Serre, Ch. I, Appendix). This is the general form of ML.3/l-function-equidistribution-criterion.

Hypotheses:

- ST compact; L-functions as stated.

Proof route:

1. Peter–Weyl: finite linear combinations of irreducible characters are uniformly dense in the continuous conjugation-invariant functions (Tau Ceti CompactGroups layers 5–6). Character limits and uniform approximation give the general class-function limit.
2. Wiener–Ikehara/Tauberian theorem for each L^S(π, ρ, s) (AnalyticNumberTheory AN.2).

Direct prerequisites: [ML.3/l-function-equidistribution-criterion](#target-l-function-equidistribution-criterion), `AnalyticNumberTheory:AN.2`, [RepresentationTheory/CompactGroups](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md#layer-5-the-peter-weyl-theorem), [RepresentationTheory/CompactGroups](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md#layer-6-characters-of-compact-groups).

Acceptance controls:

- For ST = SU(2) and ρ = Sym^n it is ML.3/l-function-equidistribution-criterion.

Sources: [George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880), Proof of Theorem 7.2.3, §7.2, arXiv v3 p. 70 (published p. 62; arXiv pagination differs).

Suggested signature: omitted until C-EQUIDISTRIBUTION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-symmetric-power-automorphy-lifting"></a>

### Automorphy lifting for symmetric powers (NT II Theorem 2.1)

Target `ML.3/symmetric-power-automorphy-lifting`; comparison. Proposed declaration: `TauCeti.SymmetricPower.symPower_lifting`.

Import owner: **SymmetricPowerAutomorphyLifting**. This target records its required export; its method is built by that owner.

Newton–Thorne II Theorem 2.1. Let F be totally real, p a prime, n≥1, and π,π′ regular algebraic, cuspidal, non-CM representations of GL₂(𝔸_F), both of weight two and both nonordinary at every v|p. For a fixed ι:Q̄_p≅ℂ assume r̄_{π,ι}≅r̄_{π′,ι}, and that π_v is a twist of Steinberg exactly when π′_v is, for every finite v∤p. Suppose that for some a≥1, up to conjugacy, PSL₂(F_{p^a})≤P r̄_{π,ι}(G_F)≤PGL₂(F_{p^a}), with p^a>max(5,2n−1). If Sym^{n−1}r_{π′,ι} is automorphic, then Sym^{n−1}r_{π,ι} is automorphic. The bound concerns the finite-field cardinality, and applies also at p=2; it does not impose p>n or irreducibility of the residual symmetric power.

Hypotheses:

- All hypotheses in the statement, including weight two, non-CM and nonordinarity for BOTH π and π′. The projective image is a subgroup of PGL₂(F̄_p); the sandwich uses one embedded finite field and one conjugation.

Proof route:

1. This node retains the historical id and the exact consumer statement as an import contract. The construction and proof belong to SymmetricPowerAutomorphyLifting. Use its requested export with these source hypotheses. ML does not reproduce the method.

Direct prerequisites: [ML.3/projective-image-sandwich](#target-projective-image-sandwich).

Acceptance controls:

- Check that the theorem avoids killing the dual Selmer group of Sym^{n−1}r̄, which fails when p ≤ n.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms, II](https://arxiv.org/pdf/2009.07180v2), §2, Theorem 2.1 and proof, pp. 5–6 (arXiv v2).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-acc-purity-rank-two"></a>

### Purity and analytic continuation for rank-two systems of weight zero over CM fields (ACC+, Corollary 7.1.13)

Target `ML.3/acc-purity-rank-two`; theorem. Proposed declaration: `TauCeti.SymmetricPower.acc_purity`.

ACC+ Corollary 7.1.13: for a CM field F and an irreducible rank-2 very weakly compatible system R with H_τ={0,1}, R is pure of weight 1. For every m≥0 the partial symmetric-power L-function has meromorphic continuation and the completed function with the stated degree≤m+1 bad factors satisfies a functional equation. If R is strongly irreducible and m>0, then L^S(ι Sym^m R,s) is holomorphic and nonzero for Re s≥1+m/2. The m=0 function has the Dedekind-zeta pole at s=1; it is not covered by nonvanishing/holomorphy. The non-CM elliptic-curve specialization supplies Sato–Tate with its compact-group criterion.

Hypotheses:

- F CM; R irreducible of rank 2 with Hodge–Tate numbers {0, 1}.

Proof route:

1. Potential automorphy of all Sym^m R (ACC+ Theorem 7.1.11, Corollary 7.1.12, assembled from ML.2/acc-auxiliary-primes and ML.3/acc-elliptic-symmetric-powers).
2. Purity: unitary cuspidal π_{ι,m} and the Jacquet–Shalika bound (ML.3/purity-from-symmetric-powers).

Direct prerequisites: [ML.2/acc-auxiliary-primes](#target-acc-auxiliary-primes), [ML.3/acc-elliptic-symmetric-powers](#target-acc-elliptic-symmetric-powers), [ML.3/purity-from-symmetric-powers](#target-purity-from-symmetric-powers), [ML.0/compatible-system-archimedean-factors](#target-compatible-system-archimedean-factors).

Acceptance controls:

- Over ℚ this recovers Sato–Tate for elliptic curves (ML.3/sato-tate-elliptic-curves).
- Negative control: m=0 gives ζ_F and its pole at 1, so unconditional holomorphy on Re s≥1 would be false.

Sources: [P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999), §7.1, Corollary 7.1.13, arXiv v2 p. 201 (Annals p. 1096); [P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999), §7.1, proof of Corollary 7.1.13, arXiv v2 p. 202 (Annals p. 1097).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-bcgnt-potential-automorphy-det-cyclotomic"></a>

### Purity and potential automorphy of symmetric powers when det r_λ = ε^{−m} (BCGNT Theorem 6.2.1)

Target `ML.3/bcgnt-potential-automorphy-det-cyclotomic`; theorem. Proposed declaration: `TauCeti.SymmetricPower.bcgnt_detCyclotomic`.

Let F be an imaginary CM field and R a strongly irreducible very weakly compatible system of rank 2 of G_F with H_τ = {0, m} (m ≥ 1) and det r_λ = ε^{−m}. Then R is pure of weight m, and for each n ≥ 1 there is a finite CM extension F_n/F, Galois over ℚ, such that Sym^{n−1}R|_{G_{F_n}} is automorphic. For m = 1 the argument simplifies to ACC+ Corollary 7.1.12 (Remark 6.2.2). Here automorphic has BCGNT Definition 6.1.2(2): all finite v outside S are unramified and match the common characteristic polynomial. Matching at the bad places is a separate requirement.

Hypotheses:

- As stated.

Proof route:

1. Theorem 6.2.4 supplies weak automorphy of arbitrarily high symmetric powers with a chosen good place kept unramified. Lemma 6.1.3 gives purity.
2. Lemma 6.1.4 uses Chebotarev and Varma Theorem 1 to match at every v outside the original bad set S: purity makes the unramified principal series irreducible. This is automorphic in Definition 6.1.2(2), not a claim of full Weil–Deligne matching at bad places or strict compatibility there.

Direct prerequisites: [ML.2/potential-weak-automorphy-symmetric-powers](#target-potential-weak-automorphy-symmetric-powers), `PotentialAutomorphyInfrastructure:PA.4`, `PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one`, [ML.3/purity-from-symmetric-powers](#target-purity-from-symmetric-powers), `AutomorphicGaloisRepresentationsPartII:AG2.5`.

Acceptance controls:

- The heart of BCGNT's Theorem C.

Sources: [George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880), Theorem 6.2.1 and proof, Remark 6.2.2, §6.2, arXiv v3 pp. 59–60 (published p. 53); ACC+ inputs also in the proof of Theorem 7.1.1, arXiv p. 69 (published p. 61).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-bcgnt-symmetric-powers-purity"></a>

### Purity and potential automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 7.2.1 = Theorem C)

Target `ML.3/bcgnt-symmetric-powers-purity`; theorem. Proposed declaration: `TauCeti.SymmetricPower.bcgnt_theoremC`.

Let F be a CM field and R a strongly irreducible very weakly compatible system of rank 2 of G_F with H_τ = {0, m}, m ≥ 1. Then R is pure of weight m and for each n ≥ 1 there is a finite CM F′/F, Galois over ℚ, with Sym^{n−1}R|_{G_{F′}} automorphic. If R is irreducible but not strongly irreducible, R is pure of weight m and each Sym^{n−1}R is a direct sum of automorphic compatible systems of dimension ≤ 2.

Hypotheses:

- F CM; R as stated.

Proof route:

1. Follow BCGNT Theorem 7.2.1: normalize the determinant using the rank-one Hecke character, the finite-order square after quadratic CM base change, and twisting, as in Theorem 7.1.1. Apply Theorem 6.2.1 and undo the twist on the resulting automorphic systems.
2. In the irreducible but not strongly irreducible branch use ACC+ Lemma 7.1.2 to express the system as induction of algebraic Hecke characters. Distinct Hodge–Tate weights exclude Artin up to twist. Decompose each symmetric power into induced rank-two systems and, in even symmetric degree, a rank-one system; use rank-one purity and automorphic induction.

Direct prerequisites: [ML.3/bcgnt-potential-automorphy-det-cyclotomic](#target-bcgnt-potential-automorphy-det-cyclotomic), `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Acceptance controls:

- Theorem C of BCGNT.

Sources: [George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880), Theorem 7.2.1 and proof, §7.2, arXiv v3 p. 69 (published pp. 61–62); Theorem C, §1, arXiv p. 4 (published p. 4).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-cg18-conditional-sato-tate"></a>

### Conditional Sato–Tate for elliptic curves over arbitrary number fields (Calegari–Geraghty, Theorem 1.1(2))

Target `ML.3/cg18-conditional-sato-tate`; theorem. Proposed declaration: `TauCeti.SymmetricPower.cg18_satoTate`.

Assume Calegari–Geraghty's Conjecture B. Let F be any number field and E/F a non-CM elliptic curve. Then the Sato–Tate conjecture holds for E. Status: conditional (ML.0/endpoint-status-register).

Hypotheses:

- Hypothesis: Conjecture B.

Proof route:

1. Potential automorphy of all symmetric powers (ML.2/cg18-odd-symmetric-powers with the tensor product trick and ML.2/cg18-conditional-potential-modularity) and the equidistribution criterion (ML.3/l-function-equidistribution-criterion) with Brauer induction.

Direct prerequisites: [ML.2/cg18-conditional-potential-modularity](#target-cg18-conditional-potential-modularity), [ML.3/l-function-equidistribution-criterion](#target-l-function-equidistribution-criterion), [ML.0/endpoint-status-register](#target-endpoint-status-register).

Acceptance controls:

- Not unconditional: potential automorphy alone does not prove equidistribution without the analytic step (acceptance of ML.3).

Sources: [Frank Calegari, David Geraghty, Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224), Theorem 1.1(2), §1, p. 3 (arXiv v2) = Invent. p. 300; reduction in §10, p. 97 (arXiv v2) = Invent. p. 428.

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-large-residual-image-density-one"></a>

### Large residual image for a density-one set of primes (Clozel–Thorne, Lemma 7.5)

Target `ML.3/large-residual-image-density-one`; lemma. Proposed declaration: `TauCeti.SymmetricPower.largeImage`.

Let E be an imaginary CM field and π a RACSDC automorphic representation of GL₂(𝔸_E) with Sym²π cuspidal. Then there is a set L of rational primes of Dirichlet density one such that for all l ∈ L and ι : Q̄_l ≅ ℂ, r̄_ι(π) is irreducible with image containing a conjugate of SL₂(F_l).

Hypotheses:

- E imaginary CM; π RACSDC with Sym²π cuspidal.

Proof route:

1. Irreducibility of r_ι(π) for density-one l (ML.2/irreducibility-density-one) and the classification of subgroups of GL₂(F_l) (large image unless dihedral/exceptional, excluded by Sym²π cuspidal and potential diagonalizability inputs of BLGGT).

Direct prerequisites: [ML.2/irreducibility-density-one](#target-irreducibility-density-one), `PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one`.

Acceptance controls:

- Used for the adequacy hypotheses in Proposition 7.6.

Sources: [L. Clozel, J. A. Thorne, Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download), §7, Lemma 7.5 and proof, manuscript p. 48.

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-one-prime-criterion"></a>

### One prime suffices for symmetric power functoriality (Newton–Thorne, Lemma 2.1)

Target `ML.3/one-prime-criterion`; theorem. Proposed declaration: `TauCeti.SymmetricPower.onePrime`.

Let F be totally real and π a non-CM RAESDC automorphic representation of GL₂(𝔸_F) (π ≇ π ⊗ (χ ∘ det) for every non-trivial Hecke character χ), and n ≥ 1. The following are equivalent: (1) there is a cuspidal Π of GL_n(𝔸_F) with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) for every place v; (2) for every prime p and ι : Q̄_p ≅ ℂ, Sym^{n−1} r_{π,ι} is automorphic; (3) for some p and ι, Sym^{n−1} r_{π,ι} is automorphic (ML.0/nt26-automorphy-predicate).

Hypotheses:

- F totally real; π non-CM RAESDC.

Proof route:

1. Newton–Thorne Lemma 2.1 uses Clozel independence of embedding together with Galois conjugation of the automorphic representation: changing ι can replace π by σπ.
2. Compare compatible Frobenius traces and use Chebotarev; do not claim that fixing π while changing ι is automatic.

Direct prerequisites: [ML.0/nt26-automorphy-predicate](#target-nt26-automorphy-predicate), [ML.3/symmetric-power-lift-over-number-fields](#target-symmetric-power-lift-over-number-fields), `AutomorphicGaloisRepresentationsPartII:AG2.2`, [Chebotarev](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev).

Acceptance controls:

- Reduces symmetric power functoriality to automorphy of a single Galois representation.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Lemma 2.1, §2, p. 9; proof pp. 9–10 (arXiv v2).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-symmetric-power-lifting"></a>

### The symmetric power lifting Sym^{n−1}π

Target `ML.3/symmetric-power-lifting`; comparison. Proposed declaration: `TauCeti.SymmetricPower.SymPowerLift`.

Specialization of [ML.3/symmetric-power-lift-over-number-fields](#target-symmetric-power-lift-over-number-fields): SymPowerLift is the ℚ spelling of the general-number-field definition, not a second construction.

For π cuspidal on GL₂(𝔸_ℚ) and n ≥ 1, a symmetric power lifting Sym^{n−1}π is an automorphic representation Π of GL_n(𝔸_ℚ) with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) for every place v (local Langlands for GL₂ and GL_n). For π regular algebraic and non-CM, Sym^{n−1}π exists as a regular algebraic cuspidal representation iff Sym^{n−1}r_{π,ι} is automorphic in the sense of PotentialAutomorphyInfrastructurePartII:PL.0/automorphic-polarized-representation for one (equivalently every) p and ι : Q̄_p ≅ ℂ (strong multiplicity one, Chebotarev density and local–global compatibility); for CM π or weight-one π the lifting is isobaric and usually not cuspidal.

Hypotheses:

- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 1.

Proof route:

1. Specialize the general-number-field definition at F=ℚ. The all-place/Galois equivalence is subject to the same exact local–global comparison contract as the general definition.

Direct prerequisites: [ML.3/symmetric-power-lift-over-number-fields](#target-symmetric-power-lift-over-number-fields).

Consumers:

- [ML.3/level-one-symmetric-powers](#target-level-one-symmetric-powers): Theorem A
- [ML.3/non-cm-symmetric-powers](#target-non-cm-symmetric-powers): NT II Theorem A
- [ML.3/sato-tate-elliptic-curves](#target-sato-tate-elliptic-curves): the L-functions L(Sym^nE, s)

Planning API:

- `TauCeti.SymmetricPower.SymPowerLift` — Π on GL_n(𝔸_ℚ) with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) at every v.
- `TauCeti.SymmetricPower.SymPowerLift.of_galois` — Sym^{n−1}r_{π,ι} automorphic ⇒ Sym^{n−1}π exists (regular algebraic, cuspidal for non-CM π).
- `TauCeti.SymmetricPower.SymPowerLift.unique` — Unique up to isomorphism (strong multiplicity one).
- `TauCeti.SymmetricPower.SymPowerLift.twist` — Sym^{n−1}(π ⊗ χ) = Sym^{n−1}π ⊗ χ^{n−1}.
- `TauCeti.SymmetricPower.SymPowerLift.lFunction` — L^S(Sym^{n−1}π, s) = L^S(Π, s) for S containing the archimedean places; for n ≥ 2 and Π cuspidal the finite L-function is entire (Godement–Jacquet).

Definition tests:

- `TauCeti.SymmetricPower.sym1` (computation) — n = 2: Sym¹π = π.
- `TauCeti.SymmetricPower.gelbart_jacquet` (computation) — n = 3: Sym²π is the Gelbart–Jacquet lift (the adjoint lift twisted by the central character).
- `TauCeti.SymmetricPower.cm_not_cuspidal` (computation) — π = automorphic induction of a Hecke character ψ of an imaginary quadratic K: Sym²π = Ind ψ² ⊞ ψ|_{𝔸_ℚ^×}, not cuspidal (the η_K factor belongs to Ad(π), not Sym²π).
- `TauCeti.SymmetricPower.degenerate_n1` (computation) — n = 1: Sym⁰π is the trivial character.

Acceptance controls:

- Check the known small cases: n = 2 is π itself; n = 3 is Gelbart–Jacquet; n = 4, 5 are Kim–Shahidi (cited in Newton–Thorne's introduction).

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3), Introduction, p. 1 (arXiv v3).

Suggested signature: omitted until C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-bianchi-ramanujan"></a>

### The Ramanujan conjecture in parallel weight over imaginary CM fields (BCGNT Theorem A = Theorem 7.1.1)

Target `ML.3/bianchi-ramanujan`; theorem. Proposed declaration: `TauCeti.SymmetricPower.bianchi_ramanujan`.

Let F be an imaginary CM field and π a regular algebraic cuspidal automorphic representation of GL₂(𝔸_F) of parallel weight. Then π_v is essentially tempered at every finite place v. After the algebraic Hecke-character twist that makes the weight (k−2,0) at every embedding, with k≥2, its unramified rec^T Satake eigenvalues α_v,β_v have absolute value N(v)^((k−1)/2). In the untwisted statement write w=λ_{τ,1}+λ_{τc,2}; the eigenvalues of rec(π_v)(Frob_v), normalized by q_v^(−w/2), have absolute value one. Parallel weight determines the difference of the two λ-coordinates, not their sum before the twist.

Hypotheses:

- F imaginary CM; π cuspidal regular algebraic of parallel weight.

Proof route:

1. Clozel purity gives λ_{τ,1}+λ_{τc,2}=w. Parallel weight then makes λ_{τ,2}+λ_{τc,2} constant, so an algebraic Hecke-character twist normalizes the weights to (k−2,0). After a quadratic CM base change the finite-order central character is a square; a further finite-order twist normalizes the determinant to ε^(1−k).
2. Use the rank-two classification into strongly irreducible, induced and Artin-up-to-twist systems. Distinct Hodge–Tate weights exclude the Artin branch. Rank-one purity handles induction, and BCGNT Theorem 6.2.1 handles the strongly irreducible branch.
3. The proof of Theorem 7.1.1 makes a further soluble base change to reduce the ramified-place assertion to unramified purity, using ACC+ Corollary 7.1.15. Import the exact local–global compatibility and soluble base-change exports; do not infer full ramified WD compatibility merely from good-place purity.

Direct prerequisites: [ML.3/bcgnt-symmetric-powers-purity](#target-bcgnt-symmetric-powers-purity), [ML.3/parallel-weight-and-clozel-purity](#target-parallel-weight-and-clozel-purity), `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AutomorphicGaloisRepresentationsPartII:AG2.5`.

Acceptance controls:

- Weight 2 recovers ACC+ Theorem 1.0.2.

Sources: [George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880), Theorem 7.1.1 and proof, §7.1, arXiv v3 pp. 68–69 (published p. 61); Theorem A, §1, arXiv p. 3 (published p. 3).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-clozel-thorne-reductions"></a>

### Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1

Target `ML.3/clozel-thorne-reductions`; theorem. Proposed declaration: `TauCeti.SymmetricPower.clozelThorne_reductions`.

(Newton–Thorne Proposition 6.1) Let F be totally real, π a non-CM RAESDC representation of GL₂(𝔸_F), p ≥ 5 prime and 0 < r < p. There are a soluble totally real E/F, ι : Q̄_p ≅ ℂ and a RAESDC π′ of GL₂(𝔸_E) of weight 0 with: Sym^{p+r−1}r_{π,ι} automorphic iff Sym^{p+r−1}r_{π′,ι} is; π′_v an unramified twist of Steinberg for v | p; det r_{π′,ι} = ε^{−1}; a place v₀ with q_{v₀} ≡ −1 mod p and π′_{v₀} tamely dihedral of order p; a place v₁ with q_{v₁} ≡ 1 mod p and π′_{v₁} Steinberg; and the potential-diagonalisability conditions. (Clozel–Thorne) Theorem 7.1 reduces the mixed-parity case to the RAESDC case, Lemma 7.4 twists π_E to a RACSDC representation over a CM extension, and Proposition 7.6 deduces symmetric powers over a CM field from those over its maximal totally real subfield (using an odd extension R̄ of r̄_ι(Π) ⊗ φ); and, for π with discrete series at infinity, 'not CM-induced' is equivalent to 'Sym²π cuspidal'.

Hypotheses:

- As in the cited statements; corrections recorded in the CT17 and NT26 extractions applied.

Proof route:

1. Soluble base change and descent (EndoscopicTransferAndUnitaryTraceComparison ET.7a; PotentialAutomorphyInfrastructurePartII PL.0/soluble-descent); BLGGT Theorem 4.2.1 (PL.5/pd-automorphy-lifting) and Theorems 4.4.1, 5.5.2 (ML.2/change-of-weight-and-level, ML.2/irreducibility-density-one).
2. Moret-Bailly to realise the local conditions at v₀, v₁ over a soluble extension.

Direct prerequisites: `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`, `PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting`, [ML.2/change-of-weight-and-level](#target-change-of-weight-and-level), [ML.2/irreducibility-density-one](#target-irreducibility-density-one), [ML.3/one-prime-criterion](#target-one-prime-criterion).

Acceptance controls:

- Every symmetric-power endpoint over totally real or CM fields uses one of these reductions.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Proposition 6.1, §6, pp. 45–46; proof pp. 46–49 (arXiv v2); also proof of Theorem 6.5, p. 50; [L. Clozel, J. A. Thorne, Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download), §7, Lemma 7.4, manuscript p. 47; [L. Clozel, J. A. Thorne, Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download), §7, Proposition 7.6 and proof, manuscript p. 49.

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-cm-and-weight-one-symmetric-powers"></a>

### Symmetric powers of CM and weight-one forms (NT II Theorem A.1)

Target `ML.3/cm-and-weight-one-symmetric-powers`; theorem. Proposed declaration: `TauCeti.SymmetricPower.symPower_CM_weightOne`.

Let π be cuspidal on GL₂(𝔸_ℚ) with π_∞ a holomorphic limit of discrete series, or π the automorphic induction of a Hecke character of a quadratic field. Then Sym^nπ exists for every n ≥ 1 (usually not cuspidal).

Hypotheses:

- π as stated.

Proof route:

1. CM case: Sym^n of an induced representation decomposes into inductions of characters and characters.
2. Weight one: the Artin image is dihedral, tetrahedral, octahedral or icosahedral; the icosahedral case uses Kim–Shahidi tensor-product and symmetric-power functoriality (Kim 2004, Theorem 6.4; cited).

Direct prerequisites: [ML.3/symmetric-power-lifting](#target-symmetric-power-lifting), `GL2AutomorphicRepresentationsAndTransfer:R17.5`.

Acceptance controls:

- Check the CM decomposition for n = 2 (symmetric-power-lifting test cm_not_cuspidal).

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms, II](https://arxiv.org/pdf/2009.07180v2), Appendix A, Theorem A.1, p. 27 (arXiv v2).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-completed-symmetric-power-l-function"></a>

### The completed symmetric power L-function Λ(Sym^n E, s)

Target `ML.3/completed-symmetric-power-l-function`; construction. Proposed declaration: `TauCeti.SymmetricPower.completedL`.

For an elliptic curve E/ℚ and n ≥ 1, Λ(Sym^n E, s) = N_n^{s/2} γ_n(s) L(Sym^n E, s), where L(Sym^n E, s) = ∏_p L_p(Sym^n E, s) is the Euler product of the local factors of Sym^n of the Weil–Deligne representation at p (at all p, including the bad ones), N_n is the conductor of Sym^n, and γ_n(s) is the archimedean factor of Sym^n of the Hodge structure of E (a product of Γ_ℂ(s − j) and, for n even, a Γ_ℝ factor), as in Dummigan–Martin–Watkins (2009). Removing the nowhere-vanishing entire factor N_n^{s/2} does not affect entireness but changes the functional equation's normalisation.

Hypotheses:

- E/ℚ an elliptic curve; n ≥ 1.

Proof route:

1. Local factors from the Weil–Deligne representation of Sym^n(H¹(E)) (Grothendieck's ℓ-adic monodromy).
2. Archimedean factor from ML.0/compatible-system-archimedean-factors applied to Sym^n of the compatible system of E.
3. The public Dummigan–Martin–Watkins 2009 journal PDF, Introduction and §§2–3, gives finite Euler factors and conductors. Martin–Watkins 2006 §4.2 independently checks the archimedean normalization (up to the explicit powers of 2π/conductor convention). In particular Sym²H¹ has Γ_ℝ(s)Γ_ℂ(s); do not use the erroneous determinant sign formula of BLGGT p.64 without E16.

Direct prerequisites: [ML.0/compatible-system-archimedean-factors](#target-compatible-system-archimedean-factors), [ML.3/symmetric-power-lifting](#target-symmetric-power-lifting).

Consumers:

- `Newton–Thorne II, Corollary B`: entireness for non-CM E
- `Newton–Thorne I, Corollary C`: entireness for semistable E

Planning API:

- `TauCeti.SymmetricPower.completedL` — Λ(Sym^n E, s).
- `TauCeti.SymmetricPower.completedL_eq` — Λ(Sym^n E, s) = N_n^{s/2} γ_n(s) L(Sym^n E, s).
- `TauCeti.SymmetricPower.completedL_entire_iff` — Λ(Sym^n E, s) is entire iff N_n^{−s/2}Λ(Sym^n E, s) is (the conductor factor never vanishes).
- `TauCeti.SymmetricPower.completedL_eq_automorphic` — If Sym^nπ_E exists, Λ(Sym^n E, s) = Λ(Sym^nπ_E, s − n/2) (with the unitary normalisation shift).

Definition tests:

- `TauCeti.SymmetricPower.completedL_one` (computation) — n = 1: Λ(Sym¹E, s) = N^{s/2}·2(2π)^{−s}Γ(s)·L(E, s).
- `TauCeti.SymmetricPower.completedL_zero` (degenerate) — n = 0: Λ(Sym⁰E, s) = π^{−s/2}Γ(s/2)ζ(s), not entire.
- `TauCeti.SymmetricPower.completedL_gamma_two` (computation) — n = 2: γ₂(s) = Γ_ℝ(s)Γ_ℂ(s): Γ_ℂ(s) for the Hodge types (2,0), (0,2) and Γ_ℝ(s) for (1,1), on which complex conjugation acts by −1.
- `TauCeti.SymmetricPower.completedL_partial_not` (non-example) — The partial L-function without bad Euler factors is not Λ: its functional equation fails.

Acceptance controls:

- For n = 1, Λ(Sym¹E, s) = N^{s/2}Γ_ℂ(s)L(E, s).

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms, II](https://arxiv.org/pdf/2009.07180v2), §1 Introduction, Corollary B, arXiv v2 p. 2 (Publ. IHÉS 134, p. 118); [Neil Dummigan, Phil Martin and Mark Watkins, Euler Factors and Local Root Numbers for Symmetric Powers of Elliptic Curves](https://archive.intlpress.com/site/pub/files/_fulltext/journals/pamq/2009/0005/0004/PAMQ-2009-0005-0004-a005.pdf), §§2–3, PDF pp.4–7 (printed pp.1314–1317); [Phil Martin and Mark Watkins, Symmetric powers of elliptic curve L-functions](https://magma.maths.usyd.edu.au/~watkins/papers/antsVII.pdf), §4.2, PDF p.7.

Suggested signature: omitted until C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-level-one-symmetric-powers"></a>

### Symmetric power functoriality in level one (NT I Theorem 7.7 = Theorem A)

Target `ML.3/level-one-symmetric-powers`; theorem. Proposed declaration: `TauCeti.SymmetricPower.symPower_levelOne`.

For every n ≥ 2 and every regular algebraic cuspidal automorphic representation π of GL₂(𝔸_ℚ) of level 1, Sym^{n−1}π exists as a regular algebraic cuspidal automorphic representation of GL_n(𝔸_ℚ).

Hypotheses:

- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.
- π everywhere unramified.

Proof route:

1. n = 2 is trivial; for n ≥ 3 combine one-level-one-symmetric-power with level-one-ping-pong, then symmetric-power-lifting (Galois criterion).

Direct prerequisites: [ML.3/one-level-one-symmetric-power](#target-one-level-one-symmetric-power), [ML.3/level-one-ping-pong](#target-level-one-ping-pong), [ML.3/symmetric-power-lifting](#target-symmetric-power-lifting).

Acceptance controls:

- Check on Δ (weight 12, level 1): Sym^{n−1}Δ exists for every n, so L(Sym^{n−1}Δ, s) is entire.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3), Introduction, Theorem A, p. 2; §7, Theorem 7.7, p. 90 (arXiv v3).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-all-regular-symmetric-powers"></a>

### Symmetric power functoriality for all non-CM regular algebraic GL₂ representations over totally real fields (Newton–Thorne, Theorem 6.4)

Target `ML.3/all-regular-symmetric-powers`; theorem. Proposed declaration: `TauCeti.SymmetricPower.sp_all`.

SP_n holds for all n ≥ 2: for every totally real F and every non-CM cuspidal regular algebraic π of GL₂(𝔸_F), Sym^{n−1}π exists as a RAESDC automorphic representation of GL_n(𝔸_F), in each of the senses of ML.3/one-prime-criterion.

Hypotheses:

- F totally real; π non-CM, cuspidal, regular algebraic.

Proof route:

1. Induction on n ≥ 6, with the cases n ≤ 5 known (ML.3/low-rank-symmetric-powers).
2. Write n = p + r with p ≥ 5 prime and 0 < r < p (Bertrand); Proposition 6.1 (ML.3/clozel-thorne-reductions) reduces to π′ with the local conditions; Newton–Thorne's level-raising and tensor-product theorems (§§3–5; owners: the proposed Part IIs SymmetricPowersByUnitaryLevelRaising and SymmetricPowersByTensorFunctorialityLifting, recorded as a gap) give automorphy of Sym^{p+r−1}r_{π′,ι} from SP_p, SP_r and SP_{p−r}.

Direct prerequisites: [ML.3/sp-statement](#target-sp-statement), [ML.3/low-rank-symmetric-powers](#target-low-rank-symmetric-powers), [ML.3/clozel-thorne-reductions](#target-clozel-thorne-reductions), [ML.3/one-prime-criterion](#target-one-prime-criterion).

Acceptance controls:

- SP_6 recovers Clozel–Thorne's Sym⁵ without their disjointness hypothesis.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Theorem 6.4 and its proof, §6, p. 50 (arXiv v2).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-bianchi-fourier-ramanujan"></a>

### The Ramanujan bound for Fourier coefficients of Bianchi eigenforms (BCGNT Theorem E)

Target `ML.3/bianchi-fourier-ramanujan`; theorem. Proposed declaration: `TauCeti.SymmetricPower.bianchi_coeff_bound`.

Let F be imaginary quadratic, f a cuspidal Bianchi eigenform of level 𝔫 and weight k normalised by c(O_F, f) = 1, and 𝔭 a prime ideal not dividing 𝔫. Then |c(𝔭, f)| ≤ 2N(𝔭)^{(k−1)/2}.

Hypotheses:

- As stated.

Proof route:

1. c(𝔭, f) = α + β with α, β the Satake parameters scaled by N(𝔭)^{(k−1)/2}; ML.3/bianchi-ramanujan gives |α| = |β|.

Direct prerequisites: [ML.3/bianchi-ramanujan](#target-bianchi-ramanujan), [ML.3/bianchi-modular-forms](#target-bianchi-modular-forms).

Acceptance controls:

- Weight 2 gives the Hasse-type bound |c(𝔭, f)| ≤ 2√N(𝔭).

Sources: [George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880), Theorem E, §1.3, arXiv v3 p. 10 (published p. 8; arXiv pagination differs).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-bianchi-mass-equidistribution"></a>

### Mass equidistribution for level-one Bianchi eigenforms of growing weight (BCGNT Theorem G)

Target `ML.3/bianchi-mass-equidistribution`; theorem. Proposed declaration: `TauCeti.SymmetricPower.bianchi_massEquidistribution`.

Let F be imaginary quadratic of class number one and Γ = SL₂(O_F). For any sequence of level-one Bianchi eigenforms f of weight tending to ∞, the normalised measures μ_f on Γ\ℍ³ (Marshall) converge weakly to the normalised hyperbolic volume.

Hypotheses:

- F imaginary quadratic of class number one; level one.

Proof route:

1. Marshall's Corollary 3 is conditional on the Ramanujan bound for the forms involved; ML.3/bianchi-ramanujan supplies it.

Direct prerequisites: [ML.3/bianchi-ramanujan](#target-bianchi-ramanujan), [ML.3/bianchi-modular-forms](#target-bianchi-modular-forms).

Acceptance controls:

- An application of Theorem A to quantum unique ergodicity in the weight aspect.

Sources: [George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880), Theorem G and proof, §1.3, arXiv v3 p. 11 (published p. 10; arXiv pagination differs).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-non-supercuspidal-symmetric-powers"></a>

### Symmetric powers when no local component is supercuspidal (NT I Theorem 8.1 = Theorem B, Corollary C)

Target `ML.3/non-supercuspidal-symmetric-powers`; theorem. Proposed declaration: `TauCeti.SymmetricPower.symPower_of_not_supercuspidal`.

Let π be a non-CM regular algebraic cuspidal π of GL₂(𝔸_ℚ) such that π_l has nonzero Jacquet module for every prime l. Then for every n ≥ 3, Sym^{n−1}r_{π,ι} is automorphic, so Sym^{n−1}π exists. In particular (Corollary C) for a semistable elliptic curve E/ℚ and each n≥1 the completed Λ(Sym^nE, s) is entire.

Hypotheses:

- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

Proof route:

1. Proposition 8.2 (all ramified refinements n-regular) by induction on the number of ramified primes, "killing ramification" along l-adic eigencurves (eigenvariety-propagation) down to level one (level-one-symmetric-powers).
2. General π: n-regular-congruences gives π′ satisfying 8.2 with r̄_{π,ι} ≅ r̄_{π′,ι} and large image; pd-automorphy-lifting (BLGGT Theorem 4.2.1) transfers automorphy of Sym^{n−1}r_{π′,ι} to Sym^{n−1}r_{π,ι}.
3. Corollary C: semistable E is modular (BCDT, Wiles) with Γ₀(N), N squarefree, so every π_l is unramified or Steinberg; Λ(Π, s) is entire for cuspidal Π (Godement–Jacquet, AL.2).

Direct prerequisites: [ML.3/n-regular-congruences](#target-n-regular-congruences), [ML.3/eigenvariety-propagation](#target-eigenvariety-propagation), [ML.3/level-one-symmetric-powers](#target-level-one-symmetric-powers), `PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting`, [ML.3/symmetric-power-lifting](#target-symmetric-power-lifting), `AutomorphicLFunctionsAndLocalFactors:AL.2`.

Acceptance controls:

- Check that Γ₀(N) with N squarefree gives only unramified or Steinberg π_l, never supercuspidal.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3), §8, Theorem 8.1, p. 91; Introduction, Theorem B and Corollary C, p. 2 (arXiv v3).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-sato-tate-group"></a>

### The Sato–Tate group ST(π) of a non-CM regular algebraic GL₂ representation over a CM field

Target `ML.3/sato-tate-group`; definition. Proposed declaration: `TauCeti.SymmetricPower.SatoTateGroup`.

Let F be imaginary CM and π a cuspidal regular algebraic representation of GL₂(𝔸_F) of weight λ, not CM, with λ_{τ,1} + λ_{τc,2} = w and ω_π = |·|^{−w}ψ, ψ unitary of type A₀. ST(π) = U₂(ℝ)_a := {g ∈ U₂(ℝ) : det(g)^a = 1} if ψ has finite order a, and ST(π) = U₂(ℝ) otherwise. It is a compact subgroup of GL₂(ℂ), and for π_v unramified and essentially tempered the conjugacy class of q_v^{−w/2} rec(π_v)(Frob_v) meets ST(π) in a unique ST(π)-conjugacy class [π_v] (Lemma 7.2.2).

Hypotheses:

- F imaginary CM; π non-CM cuspidal regular algebraic on GL₂.

Proof route:

1. Define the subgroup by the actual central character order. Compactness follows from the closed determinant condition in U₂. For an unramified essentially tempered component, its two Satake eigenvalues have equal absolute value; their product is ψ(ϖ_v)q_v^w. After normalization they are unitary and satisfy the determinant condition. GL₂-conjugate unitary elements are SU₂-conjugate, giving uniqueness (Lemma 7.2.2).
2. Essential temperedness is an explicit input to the local class constructor. ML.3/bianchi-ramanujan supplies that input when π has parallel weight; the definition of the group does not assert Ramanujan for all nonparallel weights.

Direct prerequisites: [ML.3/bianchi-ramanujan](#target-bianchi-ramanujan).

Consumers:

- [ML.3/bianchi-sato-tate](#target-bianchi-sato-tate): equidistribution of [π_v] for the Haar measure of ST(π)
- [ML.3/serre-equidistribution-criterion](#target-serre-equidistribution-criterion): irreducible representations of ST(π)

Planning API:

- `TauCeti.SymmetricPower.SatoTateGroup` — ST(π) ⊂ GL₂(ℂ).
- `TauCeti.SymmetricPower.SatoTateGroup.isCompact` — ST(π) is compact.
- `TauCeti.SymmetricPower.SatoTateGroup.ofFiniteOrder` — ψ of finite order a ⇒ ST(π) = {g ∈ U₂(ℝ) : det(g)^a = 1}.
- `TauCeti.SymmetricPower.satoTateClass` — [π_v] ∈ ST(π)/conjugacy for π_v unramified and essentially tempered.
- `TauCeti.SymmetricPower.satoTateClass_unique` — The class [π_v] is unique (Lemma 7.2.2).

Definition tests:

- `TauCeti.SymmetricPower.SatoTateGroup.eq_SU2_of_elliptic` (computation) — For π of a non-CM elliptic curve over F, ψ = 1 and ST(π) = SU(2) = U₂(ℝ)₁.
- `TauCeti.SymmetricPower.satoTate_infiniteOrder` (degenerate) — If ψ has infinite order, ST(π) = U₂(ℝ).
- `TauCeti.SymmetricPower.satoTate_cm_excluded` (non-example) — For a CM representation the non-CM Sato–Tate group formula does not apply: the identity component is toral, and the full group can be a torus or its normalizer depending on the field of definition of the endomorphisms.

Acceptance controls:

- For a non-CM elliptic curve, ψ is trivial (a = 1) and ST(π) = SU(2).

Sources: [George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880), Definition of ST(π) and Lemma 7.2.2 with proof, §7.2, arXiv v3 pp. 69–70 (published p. 62; arXiv pagination differs).

Suggested signature: omitted until C-EQUIDISTRIBUTION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-sym6-sym8"></a>

### Sixth and eighth symmetric powers over totally real fields (Clozel–Thorne, Theorem 6.1)

Target `ML.3/sym6-sym8`; theorem. Proposed declaration: `TauCeti.SymmetricPower.sym6_sym8`.

Let F be totally real and (π, χ) a RAESDC automorphic representation of GL₂(𝔸_F) not automorphically induced from a quadratic CM extension. (1) If F ∩ ℚ(ζ₅) = ℚ, Sym⁶π exists as a cuspidal automorphic representation of GL₇(𝔸_F). (2) If F ∩ ℚ(ζ₇) = ℚ, Sym⁸π exists as a cuspidal automorphic representation of GL₉(𝔸_F). Theorem 6.1 is reduced to Theorem 6.2 (level raising for Sym^{n−1} of a Steinberg-at-q form) by reference to Clozel–Thorne II §6; the level-raising method is owned by the proposed Part II SymmetricPowersByUnitaryLevelRaising.

Hypotheses:

- F totally real with the stated disjointness; π RAESDC, not CM.

Proof route:

1. Reduction to Theorem 6.2 ([CT15, §6]) and potential automorphy inputs from BLGGT (ML.2) — the level-raising method is a gap here.

Direct prerequisites: [ML.3/symmetric-power-lift-over-number-fields](#target-symmetric-power-lift-over-number-fields), [ML.2/potential-automorphy-theorem](#target-potential-automorphy-theorem), [ML.3/clozel-thorne-reductions](#target-clozel-thorne-reductions).

Acceptance controls:

- Superseded for totally real F by ML.3/all-regular-symmetric-powers, which removes the disjointness.

Sources: [L. Clozel, J. A. Thorne, Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download), §6, Theorem 6.1 (= Theorem 1.1), manuscript p. 44 (Theorem 1.1 on p. 2).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-bianchi-parabolic-cohomology-ramanujan"></a>

### The Ramanujan bound for Hecke eigenvalues on parabolic cohomology of Bianchi groups (BCGNT Theorem F)

Target `ML.3/bianchi-parabolic-cohomology-ramanujan`; theorem. Proposed declaration: `TauCeti.SymmetricPower.bianchi_cohomology_bound`.

Let F be imaginary quadratic, 𝔫 ≠ 0, k ≥ 2, and H_par ⊂ H¹(Γ₁(𝔫), Sym^{k−2}ℂ² ⊗ \overline{Sym^{k−2}ℂ²}) (or the sum over the components when h_F > 1). For a principal prime 𝔭 ∤ 𝔫 and an eigenvalue a_𝔭 of T_𝔭 on H_par, |a_𝔭| ≤ 2N(𝔭)^{(k−1)/2}.

Hypotheses:

- As stated.

Proof route:

1. Eichler–Shimura–Harder: H_par is spanned by Bianchi eigenforms (ML.3/bianchi-modular-forms); apply ML.3/bianchi-fourier-ramanujan.

Direct prerequisites: [ML.3/bianchi-fourier-ramanujan](#target-bianchi-fourier-ramanujan), [ML.3/bianchi-modular-forms](#target-bianchi-modular-forms).

Acceptance controls:

- The cohomological form used for computations.

Sources: [George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880), Theorem F, §1.3, arXiv v3 p. 11 (published p. 9; arXiv pagination differs).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-bianchi-sato-tate"></a>

### The Sato–Tate conjecture in parallel weight over imaginary CM fields (BCGNT Theorem B = Theorem 7.2.3)

Target `ML.3/bianchi-sato-tate`; theorem. Proposed declaration: `TauCeti.SymmetricPower.bianchi_satoTate`.

Let F be an imaginary CM field and π a cuspidal regular algebraic representation of GL₂(𝔸_F) of parallel weight, not CM, with ω_π = |·|^{−w}ψ. Let S_π be the set of finite places where π is ramified (printed 'unramified': a source issue). Then the classes [π_v] ∈ ST(π), v ∉ S_π, are equidistributed for the Haar probability measure of ST(π).

Hypotheses:

- As stated.

Proof route:

1. Serre's criterion (ML.3/serre-equidistribution-criterion): for non-trivial irreducible ρ of ST(π), ρ is (a twist of) Sym^{n−1} ⊗ det^k; potential automorphy of Sym^{n−1}R_π (ML.3/bcgnt-symmetric-powers-purity) with Brauer induction and the Jacquet–Shalika non-vanishing on Re s = 1 (AutomorphicLFunctionsAndLocalFactors AL.3) give the analytic properties.

Direct prerequisites: [ML.3/sato-tate-group](#target-sato-tate-group), [ML.3/serre-equidistribution-criterion](#target-serre-equidistribution-criterion), [ML.3/bcgnt-symmetric-powers-purity](#target-bcgnt-symmetric-powers-purity), `AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`.

Acceptance controls:

- For elliptic curves over CM fields it recovers ACC+ Theorem 1.0.1's Sato–Tate.

Sources: [George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880), Theorem 7.2.3, §7.2, arXiv v3 p. 70 (published p. 62); Theorem B, §1, arXiv p. 3 (published p. 3).

Suggested signature: omitted until C-EQUIDISTRIBUTION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-cm-field-symmetric-powers"></a>

### Symmetric powers of conjugate self-dual GL₂ representations over CM fields (Newton–Thorne, Theorem 6.5(2))

Target `ML.3/cm-field-symmetric-powers`; theorem. Proposed declaration: `TauCeti.SymmetricPower.cmField`.

Let E be a CM field and π a RAECSDC automorphic representation of GL₂(𝔸_E) not automorphically induced from a quadratic extension. Then for every n ≥ 2 Sym^{n−1}π exists: there is a cuspidal Π_n of GL_n(𝔸_E) with rec(Π_{n,w}) ≅ Sym^{n−1} ∘ rec(π_w) for every place w.

Hypotheses:

- E CM; π RAECSDC, not dihedral.

Proof route:

1. Clozel–Thorne Proposition 7.6: descend to the maximal totally real subfield via an auxiliary character and an odd extension, apply ML.3/all-regular-symmetric-powers there, and base change back (ML.3/clozel-thorne-reductions).

Direct prerequisites: [ML.3/all-regular-symmetric-powers](#target-all-regular-symmetric-powers), [ML.3/clozel-thorne-reductions](#target-clozel-thorne-reductions), `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

Acceptance controls:

- Over an imaginary quadratic field this covers conjugate self-dual Bianchi forms, not general Bianchi forms (ML.3/bianchi-sato-tate covers those up to potential automorphy).

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Theorem 6.5(2) and its proof, §6, p. 50 (arXiv v2).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-hilbert-symmetric-powers"></a>

### Symmetric power functoriality for Hilbert modular forms (Newton–Thorne, Theorem A = Theorem 6.5(1))

Target `ML.3/hilbert-symmetric-powers`; theorem. Proposed declaration: `TauCeti.SymmetricPower.hilbert`.

Let F be totally real and π a cuspidal automorphic representation of GL₂(𝔸_F) without CM such that π_∞ is essentially square-integrable (each π_v, v | ∞, a twist of a discrete series of weight k_v ≥ 2; the parity of k_v may vary). Then for every n ≥ 2 there is a cuspidal automorphic representation Π_n of GL_n(𝔸_F) with rec(Π_{n,v}) ≅ Sym^{n−1} ∘ rec(π_v) at every place v. These π are those of cuspidal non-CM Hilbert modular forms of weights k_v ≥ 2.

Hypotheses:

- F totally real; π non-CM with discrete-series archimedean components (mixed parity allowed).

Proof route:

1. Same parity: π is regular algebraic up to twist; ML.3/all-regular-symmetric-powers.
2. Mixed parity: Clozel–Thorne Theorem 7.1 reduces to the RAESDC case over a CM extension (ML.3/clozel-thorne-reductions).

Direct prerequisites: [ML.3/all-regular-symmetric-powers](#target-all-regular-symmetric-powers), [ML.3/clozel-thorne-reductions](#target-clozel-thorne-reductions), `AutomorphicGaloisRepresentations:R19.2`.

Acceptance controls:

- For F = ℚ it recovers Newton–Thorne II Theorem A (ML.3/non-cm-symmetric-powers).

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Theorem A, §1, p. 1 = Theorem 6.5(1), §6, p. 50 (arXiv v2).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-non-cm-symmetric-powers"></a>

### Symmetric power functoriality for all non-CM modular forms (NT II Theorem A, Corollary B)

Target `ML.3/non-cm-symmetric-powers`; theorem. Proposed declaration: `TauCeti.SymmetricPower.symPower_nonCM`.

Let π be a regular algebraic, cuspidal, non-CM automorphic representation of GL₂(𝔸_ℚ). Then for every n ≥ 1, Sym^nπ exists as a regular algebraic cuspidal automorphic representation of GL_{n+1}(𝔸_ℚ). In particular (Corollary B), for every elliptic curve E/ℚ without CM and n ≥ 2, Λ(Sym^nE, s) is entire.

Hypotheses:

- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

Proof route:

1. Induction on #sc(π), the primes where π_p is supercuspidal; sc(π) = ∅ is non-supercuspidal-symmetric-powers.
2. Killing ramification: a "seasoned" good-dihedral π′ (with an auxiliary Steinberg prime r so that r_{π′,ι_q} has large image) congruent to π with sc(π′) = sc(π) ∖ {p}; symmetric-power-automorphy-lifting transfers automorphy (NT II Theorem 3.1, Propositions 3.7–3.11).
3. Corollary B: modularity of elliptic curves over ℚ (BCDT) and Godement–Jacquet.

Direct prerequisites: [ML.3/non-supercuspidal-symmetric-powers](#target-non-supercuspidal-symmetric-powers), [ML.3/symmetric-power-automorphy-lifting](#target-symmetric-power-automorphy-lifting), [ML.3/symmetric-power-lifting](#target-symmetric-power-lifting), `AutomorphicLFunctionsAndLocalFactors:AL.2`.

Acceptance controls:

- Check the scope: CM forms and weight-one forms are excluded here and handled by cm-and-weight-one-symmetric-powers.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms, II](https://arxiv.org/pdf/2009.07180v2), Introduction, Theorem A and Corollary B, pp. 1–2; §3, Theorem 3.1, p. 20 (arXiv v2).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-nt21-semistable-l-functions"></a>

### Analytic continuation of symmetric power L-functions of semistable elliptic curves (Newton–Thorne I, Corollary C)

Target `ML.3/nt21-semistable-l-functions`; theorem. Proposed declaration: `TauCeti.SymmetricPower.semistable_entire`.

Let E/ℚ be a semistable elliptic curve. Then for every n ≥ 2 the completed symmetric power L-function Λ(Sym^n E, s) (ML.3/completed-symmetric-power-l-function) admits an analytic continuation to ℂ.

Hypotheses:

- E/ℚ semistable (hence non-CM).

Proof route:

1. Theorem B of Newton–Thorne I (ML.3/non-supercuspidal-symmetric-powers): no local component of π_E is supercuspidal.
2. Godement–Jacquet for the cuspidal Sym^nπ_E and the comparison of completed L-functions (ML.0).

Direct prerequisites: [ML.3/non-supercuspidal-symmetric-powers](#target-non-supercuspidal-symmetric-powers), [ML.3/completed-symmetric-power-l-function](#target-completed-symmetric-power-l-function), `AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet`.

Acceptance controls:

- Superseded by Newton–Thorne II Corollary B (all non-CM E).

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3), Introduction, Corollary C, arXiv v3 p. 2 (Publ. IHÉS 134, p. 2).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-symmetric-powers-up-to-eight"></a>

### Symmetric powers up to eight and holomorphy of L(s, Sym^n π) (Clozel–Thorne, Corollary 7.2)

Target `ML.3/symmetric-powers-up-to-eight`; theorem. Proposed declaration: `TauCeti.SymmetricPower.upToEight`.

Let F be totally real, π cuspidal on GL₂(𝔸_F) with π_∞ essentially square-integrable, not induced from a quadratic CM extension. Then there is a cuspidal Π on GL_{r+1}(𝔸_F) with Sym^r rec(π_v) ≅ rec(Π_v) for all finite v in each case: (1) any F, 1 ≤ r ≤ 4; (2) F ∩ ℚ(ζ₅) = ℚ, r ∈ {5, 6}; (3) F ∩ ℚ(ζ₃₅) = ℚ, r = 7; (4) F ∩ ℚ(ζ₇) = ℚ, r = 8. Consequently (Corollary 1.3) L(s, Sym^n π) is entire with the expected functional equation for n ≤ 8 under the corresponding disjointness.

Hypotheses:

- As stated.

Proof route:

1. (1): ML.3/low-rank-symmetric-powers; (2)–(4): ML.3/sym6-sym8 and the reductions of Theorem 7.1 (mixed parity).
2. Holomorphy: Godement–Jacquet for the cuspidal Π (AutomorphicLFunctionsAndLocalFactors AL.2).

Direct prerequisites: [ML.3/sym6-sym8](#target-sym6-sym8), [ML.3/low-rank-symmetric-powers](#target-low-rank-symmetric-powers), `AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet`.

Acceptance controls:

- Superseded by ML.3/hilbert-symmetric-powers, which needs no disjointness.

Sources: [L. Clozel, J. A. Thorne, Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download), §7, Corollary 7.2, manuscript pp. 46–47 (Corollaries 1.2, 1.3 on p. 2).

Suggested signature: omitted until C-GALOIS, C-AUTOMORPHIC, C-SYSTEM supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-sato-tate-elliptic-curves"></a>

### The Sato–Tate theorem for elliptic curves over ℚ

Target `ML.3/sato-tate-elliptic-curves`; theorem. Proposed declaration: `TauCeti.SymmetricPower.satoTate_elliptic`.

Let E/ℚ be an elliptic curve without complex multiplication, and for good p let α_p be the root of X² − a_pX + p with nonnegative imaginary part and θ_p = arg(α_p/√p) ∈ [0, π]. Then (θ_p) is equidistributed for (2/π)sin²θ dθ, the push-forward of Haar measure on SU(2).

Hypotheses:

- E/ℚ non-CM (End E = ℤ).

Proof route:

1. K = SU(2): classes are diag(e^{iθ}, e^{−iθ}), Haar measure is the Sato–Tate measure, and the irreducible representations are the Sym^n (Kedlaya §24.5).
2. L(s, Sym^n) = L(Sym^nE, s + n/2) (shift of the abscissa by n/2) is the L-function of the cuspidal Sym^nπ_E (non-cm-symmetric-powers), hence entire and nonvanishing on Re s ≥ 1 after the shift (Jacquet–Shalika, AL.3); for n ≥ 1 there is no pole, so c(χ) = 0.
3. Apply l-function-equidistribution-criterion. (Historically: Clozel–Harris–Shepherd-Barron–Taylor for non-integral j via potential automorphy; Barnet-Lamb–Geraghty–Harris–Taylor for all non-CM E over totally real fields.)

Direct prerequisites: [ML.3/l-function-equidistribution-criterion](#target-l-function-equidistribution-criterion), [ML.3/non-cm-symmetric-powers](#target-non-cm-symmetric-powers), `AutomorphicLFunctionsAndLocalFactors:AL.3`, [ML.2/compatible-system-l-function-continuation](#target-compatible-system-l-function-continuation), `EllipticCurveModularity:R29.6`.

Acceptance controls:

- Check the Haar-measure computation: the Weyl integration formula for SU(2) gives (2/π)sin²θ dθ on [0, π] (suggested file: the normalisation ∫₀^π sin²θ dθ = π/2).
- Check that potential automorphy suffices: meromorphic continuation with no zeros or poles on Re s ≥ 1 (ML.2) already gives Sato–Tate; Newton–Thorne's entireness is not needed.

Sources: [Kiran S. Kedlaya, Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §§24.4–24.5, Conjecture 24.4 and Theorems 24.5–24.6, printed pp. 134–135.

Suggested signature: omitted until C-EQUIDISTRIBUTION supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

### ML.3 acceptance and supplier refinements

Check every target at the displayed hypotheses and source scope, every definition against its negative controls, and every direct prerequisite against the exact export. The target-level chains end in a baseline declaration, a checked external node, a requested supplier stage or the named gaps below.

- Design and export the four reviewed symmetric-power method Part IIs and the refinement owner; replace import-contract terminal requests by their exact nodes.
- Obtain actual normalized Frobenius classes, Sato–Tate group and continuation/boundary-nonvanishing interfaces in C-EQUIDISTRIBUTION.
- Export coherent conductor/WD/gamma data and Harder Bianchi comparison; replace the omitted analytic/automorphic signatures.

## Layer ML.4: Classical-group classification and trace sources

Register classical-group classification through source-qualified conditional inputs and a constructive endoscopic Part II. Keep local packet multisets, inner-twist pairings, global multiplicities and the symplectic branch distinct. Apply GSp₄ and real-packet results only at their source scope. The singular-weight assertions remain frontiers.

Atlas planets: Global Arthur parameter; Local Arthur packets; Arthur's multiplicity formula; Mok's classification for unitary groups; Local Langlands correspondence for GSp₄; Arthur's classification for GSp₄.

<a id="target-gan-takeda-llc-gsp4"></a>

### The local Langlands correspondence for GSp₄ (Gan–Takeda)

Target `ML.4/gan-takeda-llc-gsp4`; theorem. Proposed declaration: `TauCeti.Arthur.recGT`.

Let K be a non-archimedean local field of characteristic 0. There is a surjective finite-to-one map rec_GT : π ↦ φ_π from irreducible smooth complex representations of GSp₄(K) to GSp₄(ℂ)-conjugacy classes of L-parameters WD_K → GSp₄(ℂ) such that: (i) π is essentially discrete series iff φ_π does not factor through a proper Levi subgroup; (ii) the fibre (L-packet) L_φ is parametrised by the characters of A_φ = π₀(Z(Im φ)/Z_{GSp₄}), which is trivial or ℤ/2ℤ, and when A_φ = ℤ/2ℤ exactly one member, the one indexed by the trivial character, is generic; (iii) the similitude character of φ_π is ω_π; (iv) φ_{π ⊗ (χ ∘ ν)} = φ_π ⊗ χ; (v) for π generic or non-supercuspidal and every irreducible σ of GL_r(K), the γ-, L- and ε-factors of π × σ (Shahidi) equal those of φ_π ⊗ φ_σ; (vi) the analogous identity of Plancherel measures for non-generic supercuspidal π; (vii) L_φ contains a generic representation iff the adjoint L-factor L(s, ad ∘ φ) is holomorphic at s = 1; (viii) the map is uniquely determined by (i), (iii), (v) and (vi) with r ≤ 2. BCGP normalise it so that rec_GT(π ⊗ (χ ∘ ν)) = rec_GT(π) ⊗ rec(χ) and ν ∘ rec_GT(π) = rec(ω_π), and the Roberts–Schmidt parameters of constituents of unramified principal series agree with it (Gan–Takeda 2011b, Proposition 13.1).

Hypotheses:

- K non-archimedean of characteristic 0 (BCGP use K/ℚ_l finite); complex coefficients (BCGP transport to Q̄_p through ı, ML.0/gsp4-galois-l-packet).

Proof route:

1. Gan–Takeda construct rec_GT through the theta correspondences for (GSp₄, GO(V)) with dim V = 4, 6 and the LLC for GL₂, GL₄ (Harris–Taylor, Henniart) and for the inner forms, and prove the properties by computing γ-factors.
2. Unramified principal series: comparison with Roberts–Schmidt's tables (Gan–Takeda 2011b, Proposition 13.1); BCGP Proposition 2.4.6 records the consequences (Sally–Tadić irreducibility criterion and rec_GT of constituents).

Direct prerequisites: `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `MetaplecticAutomorphicForms:MP.3`.

Acceptance controls:

- Check BCGP Proposition 2.4.6: χ₁ × χ₂ ⋊ σ is irreducible iff none of χ₁, χ₂, χ₁χ₂^{±1} is |·|^{±1}, and rec_GT(π)^{ss} = σ ⊗ (χ₁χ₂ ⊕ χ₁ ⊕ χ₂ ⊕ 1) (characters through Art_K^{−1}) for every constituent π.

Sources: [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), §2.3, p. 18 (arXiv v3); [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Proof of Proposition 2.4.22, §2.4.21, p. 25 (arXiv v3); [Wee Teck Gan and Shuichiro Takeda, The local Langlands conjecture for GSp(4)](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n3-p12-p.pdf), Main Theorem, parts (i)–(vii), pp. 1842–1843; discussion following it, p. 1843.

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-orthogonal-sign-kernel"></a>

### The orthogonal determinant sign constraint

Target `ML.4/orthogonal-sign-kernel`; definition. Proposed declaration: `TauCeti.Arthur.orthogonalSignKernel`.

For a finite index set I and dimensions d_i∈ℕ define the additive subgroup of (ℤ/2)^I by Σ_i(d_i mod 2)s_i=0. Under s_i↦(−1)^{s_i} this is ∏_i sign_i^{d_i}=1, the determinant-one constraint on orthogonal summands. It is the pre-central-quotient sign group, not the whole Arthur component group. A single odd-dimensional summand gives the trivial group; all even dimensions impose no condition.

Hypotheses:

- Exactly the domains and hypotheses stated.

Proof route:

1. Use the existing library objects and the explicit formula. The API records the consumer comparison; no missing automorphic carrier is replaced by free data.

Direct prerequisites: the exact export requested from its named import owner.

Consumers:

- [ML.4/global-arthur-parameter](#target-global-arthur-parameter): Detects the missing determinant constraint without inventing global automorphic parameter data.

Planning API:

- `TauCeti.Arthur.orthogonalSignKernel` — The actual additive subgroup cut out by the weighted mod-two sum.
- `TauCeti.Arthur.orthogonalSignKernel_mem_iff` — Membership is exactly the weighted sum being zero.
- `TauCeti.Arthur.orthogonalSignKernel_even` — If every d_i is even the subgroup is the full function group.
- `TauCeti.Arthur.orthogonalSignKernel_one_odd` — For I a singleton and d odd the subgroup is zero.

Definition tests:

- `TauCeti.Arthur.signKernel_rank_three` (computation) — For one dimension-three summand the kernel is zero.
- `TauCeti.Arthur.signKernel_empty` (degenerate) — The empty index set has the full (already trivial) sign group.
- `TauCeti.Arthur.signKernel_two_odd` (characterisation) — For two odd-dimensional summands membership is s₀=s₁.

Acceptance controls:

- For one dimension-three summand the kernel is zero.
- The empty index set has the full (already trivial) sign group.
- For two odd-dimensional summands membership is s₀=s₁.

Sources: [James Arthur, The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](http://web.archive.org/web/20120511125150id_/http://claymath.org/cw/arthur/pdf/Book.pdf), §1.4, (1.4.4), pp. 30–31, 2011 manuscript.

Suggested signature: stated with its API and tests.

<a id="target-self-dual-cuspidal-type"></a>

### Symplectic and orthogonal type of a self-dual cuspidal representation

Target `ML.4/self-dual-cuspidal-type`; definition. Proposed declaration: `TauCeti.Arthur.IsSymplecticType`.

Let π be a unitary cuspidal automorphic representation of GL_N(𝔸_F) with π ≅ π^∨, and S a finite set of places containing the archimedean places and those where π ramifies. π is of symplectic type if the partial exterior-square L-function L^S(s, π, ∧²) has a pole at s = 1, and of orthogonal type if L^S(s, π, Sym²) has a pole at s = 1. Exactly one of the two holds: L^S(s, π × π) = L^S(s, π, Sym²)·L^S(s, π, ∧²) has a simple pole at s = 1 because π ≅ π^∨, and neither factor vanishes at s = 1. Symplectic type forces N even and ω_π = 1. Arthur's Theorem 1.5.3 identifies the type with the dual group from which π is a twisted-endoscopic transfer: symplectic type exactly when π comes from a generic parameter of split SO_{N+1} (Ĝ = Sp_N(ℂ)), orthogonal type exactly when π comes from Sp_{N−1} (N odd) or from the quasi-split SO_N attached to ω_π (N even).

Hypotheses:

- F a number field; π a unitary cuspidal automorphic representation of GL_N(𝔸_F) with π ≅ π^∨.
- The type does not depend on S: the local factors at finitely many places are holomorphic and non-zero at s = 1.

Proof route:

1. Factorisation L^S(s, π × π^∨) = L^S(s, π, Sym²) L^S(s, π, ∧²) of unramified Euler factors, from Sym²V ⊕ ∧²V = V ⊗ V.
2. Jacquet–Shalika: L^S(s, π × π^∨) has a simple pole at s = 1 (AutomorphicLFunctionsAndLocalFactors AL.3).
3. Shahidi: L^S(s, π, Sym²) and L^S(s, π, ∧²) are non-zero at s = 1 and have at most simple poles there (Langlands–Shahidi method), so exactly one of them has the pole.
4. Arthur, Theorem 1.5.3: the pole determines the twisted-endoscopic group G with π = ψ for a simple generic ψ ∈ Ψ_2(G).

Direct prerequisites: `AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`, `AutomorphicLFunctionsAndLocalFactors:AL.4`, `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`.

Consumers:

- `Arthur 2013, §1.4`: the parity condition on the summands μ_i ⊠ ν_{b_i} of a global parameter ψ ∈ Ψ_2(G)
- `Gan–Ichino 2018, §1.1`: the symplectic/orthogonal split of the summands of A-parameters of Mp_{2n} and SO_{2n+1}
- `Boxer–Calegari–Gee–Pilloni 2021, §2.9`: a cuspidal Π on GL₄ of symplectic type (twisted ∧²) descends to GSp₄
- [ML.5/ckpss-generic-transfer](#target-ckpss-generic-transfer): the image of the generic transfer from SO_{2n+1}

Planning API:

- `TauCeti.Arthur.IsSymplecticType` — π is of symplectic type: L^S(s, π, ∧²) has a pole at s = 1.
- `TauCeti.Arthur.IsOrthogonalType` — π is of orthogonal type: L^S(s, π, Sym²) has a pole at s = 1.
- `TauCeti.Arthur.selfDual_type_dichotomy` — For π ≅ π^∨ cuspidal unitary: exactly one of IsSymplecticType π and IsOrthogonalType π holds.
- `TauCeti.Arthur.IsSymplecticType.even` — IsSymplecticType π implies N is even.
- `TauCeti.Arthur.IsSymplecticType.centralCharacter_eq_one` — IsSymplecticType π implies ω_π = 1.
- `TauCeti.Arthur.IsSymplecticType.independent_of_S` — The pole at s = 1 does not depend on the finite set S.
- `TauCeti.Arthur.selfDualType_iff_transfer` — Arthur Theorem 1.5.3: IsSymplecticType π iff π is the transfer of a simple generic parameter of split SO_{N+1}.

Definition tests:

- `TauCeti.Arthur.quadraticCharacter_orthogonal` (computation) — N = 1: a Hecke character χ with χ² = 1 is of orthogonal type (L^S(s, χ²) = ζ_F^S(s) has a pole; ∧² of a line is 0).
- `TauCeti.Arthur.gl2_trivialCentral_symplectic` (characterisation) — N = 2: a cuspidal π with ω_π = 1 is of symplectic type, since ∧²π = ω_π and L^S(s, ω_π) = ζ_F^S(s).
- `TauCeti.Arthur.ellipticCurve_symplectic` (computation) — The unitary cuspidal π_E of GL₂(𝔸_ℚ) attached to an elliptic curve E/ℚ (with or without CM) is of symplectic type.
- `TauCeti.Arthur.cubicCharacter_noType` (non-example) — A Hecke character χ of order 3 is not self-dual, and neither L^S(s, χ²) nor L^S(s, ∧²χ) = 1 has a pole.

Acceptance controls:

- The type of a quadratic Hecke character (N = 1) is orthogonal; that of a cuspidal GL₂ representation with trivial central character is symplectic; a non-self-dual π has no type.

Sources: [James Arthur, The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](http://web.archive.org/web/20120511125150id_/http://claymath.org/cw/arthur/pdf/Book.pdf), §1.5, Theorem 1.5.3 and the paragraph before it, pp. 47–48 (2011 manuscript).

Suggested signature: omitted until C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-global-arthur-parameter"></a>

### Discrete global Arthur parameters of a quasi-split classical group

Target `ML.4/global-arthur-parameter`; definition. Proposed declaration: `TauCeti.Arthur.GlobalParameter`.

A discrete global Arthur parameter for G is a formal unordered sum ψ = μ₁ ⊠ ν_{b₁} ⊞ ⋯ ⊞ μ_r ⊠ ν_{b_r}, where μ_i is a unitary cuspidal automorphic representation of GL_{m_i}(𝔸_F) with μ_i ≅ μ_i^∨, ν_b is the b-dimensional irreducible representation of SL₂(ℂ), Σ m_i b_i = N, the pairs (μ_i, b_i) are pairwise distinct, every summand μ_i ⊠ ν_{b_i} has the parity of Ĝ (for Ĝ symplectic: μ_i of symplectic type with b_i odd or of orthogonal type with b_i even; for Ĝ orthogonal: μ_i of orthogonal type with b_i odd or of symplectic type with b_i even), and ∏_i ω_{μ_i}^{b_i} = η_G. Ψ_2(G) denotes the set of these (for G = SO_{2n} taken up to the outer automorphism, Ψ̃_2(G)). ψ is generic when every b_i = 1. Its global component group S_ψ is the sign group on the summands, restricted by ∏_i s_i^{m_i b_i}=1 when Ĝ is special orthogonal, then quotiented by the image of Z(Ĝ)^Γ; the determinant-one constraint can remove a generator before the central quotient, and Arthur attaches to ψ a sign character ε_ψ of S_ψ built from symplectic root numbers ε(1/2, μ_i × μ_j). At each place v, ψ localises to ψ_v : L_{F_v} × SL₂(ℂ) → ^LG through the local Langlands correspondence for the GL_{m_i}.

Hypotheses:

- F a number field, 𝔸_F its adèles; G a quasi-split symplectic or special orthogonal group over F (Sp_{2n}, split SO_{2n+1}, or quasi-split SO_{2n} attached to a quadratic character η_G), whose dual group Ĝ has a standard representation of dimension N (N = 2n + 1, 2n, 2n respectively).

Proof route:

1. The parity condition is the condition that ψ, viewed as an N-dimensional representation of L_F × SL₂(ℂ), preserves a form of the type of Ĝ: ν_b is symplectic for b even and orthogonal for b odd, and types multiply.
2. S_ψ is the group of components of the centraliser of the image of ψ in Ĝ, modulo Z(Ĝ)^Γ; each self-dual irreducible summand of the right type contributes one factor ℤ/2ℤ.
3. ε_ψ is Arthur's (1.5.6): a product of root numbers ε(1/2, μ_i × μ_j) = ±1 over the pairs of summands where the Rankin–Selberg product is of symplectic type.

Direct prerequisites: [ML.4/self-dual-cuspidal-type](#target-self-dual-cuspidal-type), `AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Consumers:

- [ML.4/arthur-multiplicity-formula](#target-arthur-multiplicity-formula): the index set of the decomposition of L²_disc
- [ML.4/gsp4-arthur-classification](#target-gsp4-arthur-classification): the parameter types (a)–(f) for GSp₄ are global parameters of Sp₄ ≅ Spin₅ twisted by the similitude
- `Gan–Ichino 2018, §1.3`: A-parameters of Mp_{2n} and SO_{2n+1} and the sign character ε_ψ in the multiplicity formula
- `Chenevier–Taïbi 2020, §§1.4, 5.2`: level one parameters are counted by their archimedean components

Planning API:

- `TauCeti.Arthur.GlobalParameter` — The finite multiset of pairs (μ_i, b_i) with the dimension, distinctness, parity and central-character conditions.
- `TauCeti.Arthur.GlobalParameter.IsGeneric` — Every b_i equals 1.
- `TauCeti.Arthur.GlobalParameter.componentGroup` — Sign vectors on summands, with determinant-one kernel for orthogonal Ĝ, modulo Z(Ĝ)^Γ; not an unrestricted (ℤ/2)^r quotient.
- `TauCeti.Arthur.GlobalParameter.signCharacter` — Arthur's character ε_ψ : S_ψ → {±1}.
- `TauCeti.Arthur.GlobalParameter.localize` — ψ_v : L_{F_v} × SL₂(ℂ) → ^LG obtained from rec(μ_{i,v}) ⊗ ν_{b_i}.
- `TauCeti.Arthur.GlobalParameter.toIsobaric` — The isobaric automorphic representation ⊞_i Speh(μ_i, b_i) of GL_N(𝔸_F) attached to ψ.
- `TauCeti.Arthur.GlobalParameter.ofSelfDualCuspidal` — A unitary self-dual cuspidal μ of GL_N(𝔸_F) of the type of Ĝ (with ω_μ = η_G) is a simple generic parameter.
- `TauCeti.Arthur.GlobalParameter.signCharacter_generic_trivial_of_rootNumbers` — If every symplectic root number ε(1/2, μ_i × μ_j) occurring in ε_ψ equals 1 then ε_ψ = 1; in particular ε_ψ = 1 for generic ψ.

Definition tests:

- `TauCeti.Arthur.GlobalParameter.so3_trivial` (computation) — For G=SO₃≅PGL₂ (dual Sp₂), ψ=1⊠ν₂ is discrete and S_ψ=1. Identifying its automorphic packet is a separate classification application, not this definition test.
- `TauCeti.Arthur.GlobalParameter.so3_generic_iff` (characterisation) — For G=SO₃, a unitary cuspidal μ on GL₂ gives the simple generic parameter μ⊠ν₁ iff ω_μ=1, with self-duality and exterior-square/Hecke comparison supplied.
- `TauCeti.Arthur.GlobalParameter.sp0_empty` (degenerate) — N = 0 (G = SO₁, the trivial group): Ψ_2(G) consists of the empty sum only.
- `TauCeti.Arthur.GlobalParameter.repeated_not_discrete` (non-example) — μ ⊠ ν₁ ⊞ μ ⊠ ν₁ (a repeated summand) is not a discrete parameter: discrete parameters are multiplicity free.
- `TauCeti.Arthur.GlobalParameter.wrongParity` (non-example) — For G = SO₃, the summand χ ⊠ ν₁ ⊞ χ′ ⊠ ν₁ of two quadratic characters is not in Ψ_2(SO₃): each χ ⊠ ν₁ is orthogonal while Ĝ = SL₂ = Sp₂ is symplectic.
- `TauCeti.Arthur.GlobalParameter.orthogonal_rank_three_component` (computation) — For dual Ĝ=SO₃ and a single dimension-3 orthogonal cuspidal summand with b=1, the determinant-one sign condition forces s=+1 and S_ψ is trivial; the unrestricted sign-group formula would give ℤ/2.

Acceptance controls:

- For G = SO₃ ≅ PGL₂ (N = 2) the parameter 1 ⊠ ν₂ is discrete and its packet is the trivial representation; a generic μ ∈ Ψ_2(SO₃) is exactly a cuspidal GL₂ representation with trivial central character.

Sources: [James Arthur, The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](http://web.archive.org/web/20120511125150id_/http://claymath.org/cw/arthur/pdf/Book.pdf), §1.4, (1.4.4), p. 30 (2011 manuscript); [Chung Pang Mok, Endoscopic classification of representations of quasi-split unitary groups](https://arxiv.org/pdf/1206.0882), §2.3, p. 15 (arXiv v5).

Suggested signature: omitted until C-ARTHUR supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-gsp4-discrete-spectrum-types"></a>

### Discrete automorphic representations of GSp₄: symplectic type, general type and transfer

Target `ML.4/gsp4-discrete-spectrum-types`; definition. Proposed declaration: `TauCeti.Arthur.GSp4.IsGeneralType`.

An automorphic representation π of GSp₄(𝔸_F) is discrete if it occurs in the discrete spectrum of L² automorphic forms with central character ω_π (every cuspidal one is). A cuspidal Π of GL₄(𝔸_F) is of symplectic type with multiplier χ if L^S(s, Π, ∧² ⊗ χ^{−1}) has a pole at s = 1 for some (equivalently every) finite S; then Π ≅ Π^∨ ⊗ χ. A discrete π is of general type if there is a cuspidal Π of GL₄(𝔸_F) of symplectic type with multiplier ω_π such that, for every place v, the L-parameter of π_v (rec_GT(π_v) at finite v, the archimedean Langlands parameter at infinite v) composed with GSp₄(ℂ) ⊂ GL₄(ℂ) is rec(Π_v); Π is then the transfer of π. Arthur's classification divides the discrete spectrum into six families (a)–(f), (a) being general type and (b)–(f) the Yoshida, Soudry, Saito–Kurokawa, Howe–Piatetski-Shapiro and one-dimensional types (Gee–Taïbi Remark 6.1.4 list S_ψ = 1, ℤ/2ℤ, 1, ℤ/2ℤ, ℤ/2ℤ, 1 respectively, with ε_ψ non-trivial only in the Saito–Kurokawa case with ε(1/2, π ⊗ η^{−1}) = −1).

Hypotheses:

- F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete automorphic representation of GSp₄(𝔸_F) with central character ω_π.

Proof route:

1. The six types are read off from the transfer π̃ of π to GL₄ under Arthur's classification: (a) π̃ cuspidal and χ_π-self-dual; (b) μ₁ ⊞ μ₂ with μ_i distinct cuspidal on GL₂ with central characters χ_π; (c) μ|·|^{1/2} ⊞ μ|·|^{−1/2} with μ cuspidal of orthogonal type; (d) λ|·|^{1/2} ⊞ λ|·|^{−1/2} ⊞ μ with χ_μ = λ² = χ_π; (e), (f) isobaric sums of Hecke characters.
2. At archimedean places BCGP's 'rec_GT(π_v)' is read as the archimedean Langlands parameter (recorded as a source issue).

Direct prerequisites: [ML.4/self-dual-cuspidal-type](#target-self-dual-cuspidal-type), [ML.4/gan-takeda-llc-gsp4](#target-gan-takeda-llc-gsp4), [ML.0/archimedean-langlands-conventions](#target-archimedean-langlands-conventions).

Consumers:

- `Boxer–Calegari–Gee–Pilloni 2021, Lemma 2.9.1 and Theorem 2.9.3`: only general-type representations contribute after localising at a non-Eisenstein ideal; GL₄ representations of symplectic type descend
- `Calegari–Geraghty 2020, proof of Theorem 7.11`: classes (b)–(f) are excluded by the irreducibility of the residual representation
- `Pilloni 2020, §5.1.7 and §15.2.4`: non-general type gives reducible Galois representations; packets with a holomorphic limit of discrete series are of general, Yoshida or Saito–Kurokawa type

Planning API:

- `TauCeti.Arthur.GSp4.IsDiscrete` — π occurs in L²_disc(GSp₄(F)\GSp₄(𝔸_F), ω_π).
- `TauCeti.Arthur.GSp4.IsSymplecticTypeWith` — Π cuspidal on GL₄ with L^S(s, Π, ∧² ⊗ χ^{−1}) having a pole at s = 1.
- `TauCeti.Arthur.GSp4.IsGeneralType` — π has a cuspidal transfer Π of symplectic type with multiplier ω_π.
- `TauCeti.Arthur.GSp4.transfer` — The transfer Π of a general-type π (unique by strong multiplicity one).
- `TauCeti.Arthur.GSp4.IsSymplecticTypeWith.selfDual` — IsSymplecticTypeWith Π χ ⇒ Π ≅ Π^∨ ⊗ χ.
- `TauCeti.Arthur.GSp4.ArthurType` — The six types (a)–(f) of a discrete π.
- `TauCeti.Arthur.GSp4.isGeneralType_iff_typeA` — IsGeneralType π ↔ ArthurType π = (a).

Definition tests:

- `TauCeti.Arthur.GSp4.yoshida_not_general` (non-example) — A Yoshida lift (transfer μ₁ ⊞ μ₂ of two distinct weight-2 newforms with equal central characters) is discrete but not of general type.
- `TauCeti.Arthur.GSp4.oneDimensional_typeF` (degenerate) — The one-dimensional representation χ ∘ ν of GSp₄(𝔸_F) is discrete, of type (f), with transfer χ|·|^{3/2} ⊞ χ|·|^{1/2} ⊞ χ|·|^{−1/2} ⊞ χ|·|^{−3/2}.
- `TauCeti.Arthur.GSp4.sym3_symplectic` (computation) — For π cuspidal on GL₂ non-dihedral and non-tetrahedral, Sym³π (ML.3/kim-shahidi-sym3) is cuspidal on GL₄ of symplectic type with multiplier ω_π³.
- `TauCeti.Arthur.GSp4.symplectic_iff_gl2` (compatibility) — For GL₂ (the analogue for GSp₂ = GL₂), every cuspidal Π is of symplectic type with multiplier ω_Π, since ∧²Π = ω_Π.

Acceptance controls:

- The cuspidal π of a non-endoscopic genus-2 Siegel eigenform of weight (k, j) ≥ (3, 0) is of general type; a Yoshida lift is of type (b).

Sources: [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), §2.9, p. 38 (arXiv v3); [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), §2.9, definition of general type, p. 38 (arXiv v3); [Toby Gee, Olivier Taïbi, Arthur's multiplicity formula for GSp4 and restriction to Sp4](https://arxiv.org/pdf/1807.03988), Remark 6.1.4, p. 35 (arXiv v1).

Suggested signature: omitted until C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-extended-langlands-parameter"></a>

### Extended Langlands parameters (ϱ, χ_ϱ) of a p-adic classical group

Target `ML.4/extended-langlands-parameter`; definition. Proposed declaration: `TauCeti.Arthur.ExtendedParameter`.

Let F be a non-archimedean local field of characteristic 0 and G° a quasi-split classical group over F (symplectic, special orthogonal or unitary). A Langlands parameter is a Ĝ°-conjugacy class of admissible homomorphisms ϱ : W_F × SL₂(ℂ) → ^LG°; its component group S_ϱ = π₀(Cent_{Ĝ°}(ϱ)/Z(Ĝ°)^{Γ_F}) is an elementary abelian 2-group. An extended Langlands parameter is a pair (ϱ, χ_ϱ) with χ_ϱ a character of S_ϱ, and Lang(G°) is the set of extended parameters. The local Langlands correspondence of Arthur and Mok, normalised by a Whittaker datum, is a bijection LL : Irr(G°) → Lang(G°) (for even special orthogonal groups, up to the outer automorphism), under which the L-packet Π_ϱ is the fibre over ϱ.

Hypotheses:

- F non-archimedean of characteristic 0; G° quasi-split classical; a Whittaker datum fixed (it normalises χ_ϱ).

Proof route:

1. Decompose the parameter into irreducibles. Every good-parity summand with positive multiplicity contributes an O(m_i) centralizer and hence a component, including even m_i. Odd multiplicity governs the image of the central element, not whether that component exists; apply the SO determinant relation and central quotient when appropriate.
2. Use tempered local packets and the Langlands classification, with the exact classical-group enhancement and outer-automorphism conventions.

Direct prerequisites: [ML.4/global-arthur-parameter](#target-global-arthur-parameter), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, [ReductiveGroups](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-6-reductive-and-semisimple-groups).

Consumers:

- `Kurinczuk–Skodlerack–Stevens 2021, §1.20`: endo-parameters are matched with the restriction of extended parameters to wild inertia
- [ML.4/local-arthur-packets](#target-local-arthur-packets): the bijection Π_φ ≅ Ŝ_φ for tempered φ
- [ML.4/vogan-packets-so-v](#target-vogan-packets-so-v): Vogan packets over all pure inner forms are indexed by all characters of S_φ, not only those trivial on the centre

Planning API:

- `TauCeti.Arthur.ExtendedParameter` — A pair (ϱ, χ_ϱ) with χ_ϱ a character of S_ϱ.
- `TauCeti.Arthur.ExtendedParameter.parameter` — The underlying Langlands parameter ϱ.
- `TauCeti.Arthur.ExtendedParameter.character` — The character χ_ϱ of S_ϱ.
- `TauCeti.Arthur.componentGroup_elementaryAbelianTwo` — S_ϱ is an elementary abelian 2-group.
- `TauCeti.Arthur.lPacket_equiv_characters` — For G° quasi-split, LL restricts to a bijection Π_ϱ ≃ Ŝ_ϱ.
- `TauCeti.Arthur.ExtendedParameter.generic_iff` — For tempered ϱ, the generic member of Π_ϱ (for the fixed Whittaker datum) is the one with χ_ϱ = 1.

Definition tests:

- `TauCeti.Arthur.ExtendedParameter.sl2_klein_four` (computation) — G° = SL₂, p odd, ϱ with image the Klein four-group in SO₃(ℂ): S_ϱ ≅ (ℤ/2ℤ)², so |Π_ϱ| = 4.
- `TauCeti.Arthur.ExtendedParameter.so2_split` (degenerate) — G° = split SO₂ ≅ GL₁: every S_ϱ is trivial and, with even orthogonal groups taken up to the outer automorphism, Lang(G°) ≅ Hom(F^×, ℂ^×)/(χ ∼ χ^{−1}) (local class field theory).
- `TauCeti.Arthur.ExtendedParameter.sl2_size_two` (non-example) — G° = SL₂: a parameter ϱ : W_F → SO₃(ℂ) ≅ PGL₂(ℂ) lifting to an irreducible dihedral Ind_{W_E}^{W_F} θ with θ/θ^c not quadratic has S_ϱ ≅ ℤ/2ℤ and an L-packet of size 2, not a singleton as for GL₂.
- `TauCeti.Arthur.ExtendedParameter.unramified_trivial` (characterisation) — An unramified tempered ϱ of Sp_{2n} whose standard representation is a sum of distinct characters has S_ϱ = 1 and Π_ϱ is the unramified representation.

Acceptance controls:

- For G° = SL₂ = Sp₂, a parameter ϱ : W_F → SO₃(ℂ) with image the Klein four-group has S_ϱ ≅ (ℤ/2ℤ)² and an L-packet of four supercuspidal representations (Labesse–Langlands).

Sources: [Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens, Endo-parameters for p-adic classical groups](https://arxiv.org/pdf/1611.02667v3), §1.20, p. 8 (arXiv v3); p. 604 in the version of record.

Suggested signature: omitted until C-ARTHUR supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-shahidi-exterior-square"></a>

### Holomorphy and non-vanishing of twisted exterior-square L-functions on Re s = 1 (Shahidi)

Target `ML.4/shahidi-exterior-square`; theorem. Proposed declaration: `TauCeti.Arthur.exteriorSquare_nonvanishing`.

Let Π be unitary cuspidal on GL₄(𝔸_F) (or GL_{2n}) and ω unitary. At s=1, L^S(s,Π,∧²⊗ω) has either a simple pole or a finite nonzero limit; the pole is equivalent to symplectic type with multiplier ω^{−1}. For cyclic prime-degree F′/F with Π′=BC(Π) cuspidal, in the factorization over the unitary quotient characters ψ at most one factor L^S(s,Π,∧²⊗ωψ) has a pole at 1 and the others have nonzero limits there. This assertion is at s=1; it does not assert absence of poles at all other points of Re s=1.

Hypotheses:

- F a number field; Π unitary cuspidal on GL₄ or GL_{2n}; ω unitary; S contains the ramified places.
- The cyclic base-change consequence requires BC(Π) cuspidal. Two different pole-producing twists would give a prohibited nontrivial self-twist.

Proof route:

1. Use the AL.4 exterior-square theorem at s=1 for unitary cuspidal Π and unitary ω. Full vertical-line claims require a separate theorem and cannot be inferred from BCGP p.247.
2. Pole criterion: definition of symplectic type (ML.4/gsp4-discrete-spectrum-types).
3. Factorisation: base change of unramified local factors.

Direct prerequisites: [ML.4/gsp4-discrete-spectrum-types](#target-gsp4-discrete-spectrum-types), `AutomorphicLFunctionsAndLocalFactors:AL.4`.

Acceptance controls:

- BCGP Lemma 8.3.2 deduces from this that a GSp₄ representation over F′ whose transfer is a base change descends to F.

Sources: [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Proof of Lemma 8.3.2, §8.3, p. 247 (arXiv v3).

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-gsp4-galois-l-packet"></a>

### The L-packet L(ρ) of a GSp₄-valued local Galois representation, and n(π)

Target `ML.0/gsp4-galois-l-packet`; definition. Proposed declaration: `TauCeti.LanglandsRegister.GSp4.lPacketOf`.

Fix for every prime p an isomorphism ı : ℂ ≅ Q̄_p (it fixes square roots in Q̄_p of the positive rationals, the images of the positive real ones). Let K/ℚ_l be finite and ρ : G_K → GSp₄(Q̄_p) continuous with p ≠ l. L(ρ) is the set of isomorphism classes of irreducible smooth Q̄_p-representations π of GSp₄(K) with rec_{GT,p}(π ⊗ |ν|^{−3/2}) ≅ WD(ρ)^{F-ss}, where rec_{GT,p} is Gan–Takeda's correspondence (ML.4/gan-takeda-llc-gsp4 is its owner; it is registered here only through its use) conjugated by ı. For a Weil–Deligne representation (r, N), n((r, N)) is the rank of N; for π irreducible admissible of GL_n(K) (resp. GSp₄(K)), n(π) := n(rec(π)) (resp. n(rec_GT(π))). Boxer–Calegari–Gee–Pilloni use the ı-independence of L(ρ) only for unramified representations and for the rank of the monodromy of representations with Iwahori-fixed vectors.

Hypotheses:

- K/ℚ_l finite, p ≠ l; ı fixed; the twist |ν|^{−3/2} uses the square root of the residue cardinality q of K fixed by ı.

Proof route:

1. Transport rec_GT to Q̄_p-coefficients through ı.
2. Independence of ı in the two cases used: unramified representations (Satake parameters are algebraic) and the rank of N for Iwahori-spherical representations (explicit from Roberts–Schmidt's tables).

Direct prerequisites: [ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors), `GL2AutomorphicRepresentationsAndTransfer:R16.3`, [ML.0/endpoint-status-register](#target-endpoint-status-register), [ML.4/gan-takeda-llc-gsp4](#target-gan-takeda-llc-gsp4).

Consumers:

- `Boxer–Calegari–Gee–Pilloni 2021, Propositions 2.4.22, 2.4.24 and §7.13`: local–global compatibility of GSp₄ Galois representations is stated as π_v ∈ L(ρ|_{G_{F_v}})
- [ML.4/non-general-type-reducible](#target-non-general-type-reducible): WD(ρ_{π,p})^{ss} ≅ rec_{GT,p}(π_v ⊗ |ν|^{−3/2})^{ss}
- `AutomorphicGaloisRepresentationsPartII AG2.6`: the GSp₄ normalisation dictionary requested from ML

Planning API:

- `TauCeti.LanglandsRegister.GSp4.lPacketOf` — L(ρ) as a set of irreducible smooth Q̄_p-representations.
- `TauCeti.LanglandsRegister.GSp4.mem_lPacketOf` — π ∈ L(ρ) ↔ rec_{GT,p}(π ⊗ |ν|^{−3/2}) ≅ WD(ρ)^{F-ss}.
- `TauCeti.LanglandsRegister.GSp4.lPacketOf_twist` — L(ρ ⊗ χ) = L(ρ) ⊗ (χ ∘ Art ∘ ν) for a character χ.
- `TauCeti.LanglandsRegister.GSp4.lPacketOf_nonempty` — L(ρ) is non-empty and has 1 or 2 elements.
- `TauCeti.LanglandsRegister.monodromyRank` — n(π), the rank of the monodromy of rec(π) or rec_GT(π).

Definition tests:

- `TauCeti.LanglandsRegister.GSp4.lPacketOf_unramified` (computation) — For ρ unramified with ρ(Frob) of eigenvalues q^{3/2}·(α₁, α₂, α₃, α₄) (q the residue cardinality of K), L(ρ) is the unramified constituent of the principal series with Satake parameters (α_i).
- `TauCeti.LanglandsRegister.monodromyRank_unramified` (degenerate) — For π unramified, n(π) = 0.
- `TauCeti.LanglandsRegister.monodromyRank_steinberg` (computation) — For the Steinberg representation of GSp₄(K), n(π) = 3 (N regular nilpotent in GSp₄(ℂ)).
- `TauCeti.LanglandsRegister.GSp4.lPacketOf_size_two` (non-example) — For a tempered parameter with A_φ = ℤ/2ℤ, L(ρ) has two elements, exactly one of them generic: L(ρ) is not a singleton.

Acceptance controls:

- Check the twist on unramified principal series: for π = χ₁ × χ₂ ⋊ σ unramified, L(ρ) ∋ π iff ρ(Frob) has eigenvalues the Satake parameters shifted by p^{3/2}.

Sources: [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Definition 2.3.1, §2.3 — independently checked downloaded PDF p.19; published-copy pagination where applicable; [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Remark 2.3.2, §2.3, p. 19 (arXiv v3); [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), §2.3, after Remark 2.3.3, p. 19 (arXiv v3).

Suggested signature: omitted until C-GALOIS supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-regular-weight-serre-implies-abelian-surface-modularity"></a>

### A regular-weight Serre conjecture for GSp₄ implies modularity of abelian surfaces over ℚ (BCGP 2025, Lemma 10.4.1)

Target `ML.0/regular-weight-serre-implies-abelian-surface-modularity`; theorem. Proposed declaration: `TauCeti.LanglandsRegister.abelianSurface_modular_of_serre`.

Suppose that for every prime p and every ρ̄ : G_ℚ → GSp₄(F̄_p) with multiplier ε̄^{−1}, absolutely irreducible, and with (ρ̄|_{G_{ℚ_p}})^{ss} a direct sum of characters, there is an ordinary cuspidal automorphic representation π of GSp₄/ℚ of regular weight, level prime to p and central character |·|² with ρ̄_{π,p} ≅ ρ̄. Then every abelian surface A/ℚ is modular. (Remark 10.4.2: the hypothesis may be weakened, e.g. to p sufficiently large.) This is a conditional endpoint: its hypothesis is a conjecture.

Hypotheses:

- Hypothesis: the regular-weight Serre statement above (status conjectural); the proof also uses Arthur's classification through BCGP's main theorems (ML.0/arthur-dependency-gate).

Proof route:

1. Choose p with ρ̄_{A,p} absolutely irreducible and ordinary-type at p; the hypothesis gives an ordinary regular-weight π.
2. Move from regular weight to parallel weight 2 by BCGP's Hida-theoretic and modularity lifting theorems, giving modularity of A (the analogue of Khare's deduction of Artin's conjecture from Serre's).

Direct prerequisites: [ML.0/gsp4-galois-l-packet](#target-gsp4-galois-l-packet), [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate), [ML.0/endpoint-status-register](#target-endpoint-status-register).

Acceptance controls:

- The analogy: ML.1/odd-artin-modularity-over-q follows from Serre's conjecture.

Sources: [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645v1), Lemma 10.4.1, §10.4, p. 222 (arXiv v1); [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645v1), Remark 10.4.2, p. 222 (arXiv v1).

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-weight-22-abelian-variety-conjecture"></a>

### Conjecture: weight (2,2) Siegel eigenforms come from abelian varieties with real multiplication (conjectural endpoint)

Target `ML.0/weight-22-abelian-variety-conjecture`; definition. Proposed declaration: `TauCeti.LanglandsRegister.WeightTwoTwoConjecture`.

WeightTwoTwoConjecture is the proposition: for every stable general-type cuspidal Siegel modular eigenform of genus 2 and weight (2, 2) over ℚ (in Calegari–Geraghty's normalisation) there are a totally real field E of degree n and an abelian variety M/ℚ of dimension 2n with E ↪ End_ℚ(M) ⊗ ℚ whose λ-adic Galois representations, restricted to the E-eigenspaces, are those of the eigenform. Status: conjectural; Calegari–Geraghty state it as a heuristic (§5.4) suggesting that residual representations of type U₃ at x with σ = (2, 2) admit no minimal lifts, and no proof uses it.

Hypotheses:

- The stable/general-type qualification excludes CAP and endoscopic systems with rank-one constituents. The source is a heuristic, not a theorem; the precise Galois/abelian comparison is this roadmap’s frontier specification.

Proof route:

1. Definition of the proposition only.

Direct prerequisites: [ML.0/gsp4-galois-l-packet](#target-gsp4-galois-l-packet), [ML.0/endpoint-status-register](#target-endpoint-status-register).

Consumers:

- `Calegari–Geraghty 2020, §5.4`: heuristic for the absence of minimal lifts of type U₃
- [ML.0/endpoint-status-register](#target-endpoint-status-register): recorded with status conjectural

Planning API:

- `TauCeti.LanglandsRegister.WeightTwoTwoConjecture` — The proposition stated.
- `TauCeti.LanglandsRegister.WeightTwoTwoConjecture.dim` — Under the conjecture, dim M = 2[E : ℚ].
- `TauCeti.LanglandsRegister.WeightTwoTwoConjecture.semistable_unipotent` — Under the conjecture, inertia at a semistable prime acts with (σ − 1)² = 0 (Grothendieck), so type U₃ cannot occur.

Definition tests:

- `TauCeti.LanglandsRegister.weight22_status` (characterisation) — A proposed eigenform realization must return an abelian variety of dimension 2[E:ℚ] and four-dimensional E_λ-eigenspaces, rather than a two-dimensional total Tate module.
- `TauCeti.LanglandsRegister.weight22_E_eq_Q` (degenerate) — n = 1: the statement is that weight (2, 2) eigenforms with rational eigenvalues come from abelian surfaces over ℚ.
- `TauCeti.LanglandsRegister.weight22_not_proved` (non-example) — A minimal local lift with a size-three unipotent block, (σ−1)²≠0 persisting after finite extension, cannot be the H¹ of an abelian variety with semistable reduction: Grothendieck’s square-zero inertia condition fails.

Acceptance controls:

- Known instance: paramodular forms attached to abelian surfaces over ℚ (BCGP's potential modularity runs the other way, abelian variety ⇒ form).

Sources: [Frank Calegari, David Geraghty, Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](http://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §5.4 'Torsion classes', publ. p. 831; quoted from arXiv v1 §5.4 p. 24 — independently checked downloaded PDF p.31; published-copy pagination where applicable.

Suggested signature: omitted until C-COHERENT-GEOMETRY supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-trace-formula-inputs-register"></a>

### Register of the trace-formula inputs of Arthur's classification and their owners

Target `ML.4/trace-formula-inputs-register`; comparison. Proposed declaration: `TauCeti.Arthur.traceFormulaInputs`.

Arthur's classification (ML.4/local-arthur-packets, ML.4/arthur-multiplicity-formula) and its unitary analogues (ML.4/mok-unitary-classification, ML.4/kmsw-inner-forms) rest on: (1) the invariant trace formula of G and the twisted trace formula of GL_N ⋊ θ (Arthur; owner AutomorphicSpectralTheory:AS.6 for the untwisted formula); (2) the stabilisation of the ordinary and of the twisted trace formula (Arthur; Mœglin–Waldspurger 2016); (3) the transfer of orbital integrals (Waldspurger) and the fundamental lemma (Ngô) with its twisted and weighted variants (Chaudouard–Laumon; the twisted weighted fundamental lemma); (4) the local intertwining relation (Arthur §2.4, proved by Arthur for quasi-split groups modulo [A25]–[A27] and by Atobe–Gan–Ichino–Kaletha–Mínguez–Shin in further cases). Each input is registered with its owner stage and its status: proved in print, announced, or open. No input is assumed proved because a related unitary or GL_N result is.

Hypotheses:

- The registry lists statements and owners; it proves nothing.

Proof route:

1. Owners: AutomorphicSpectralTheory AS.6 (coarse, fine and invariant trace formula); EndoscopicTransferAndUnitaryTraceComparison (transfer, fundamental lemma and unitary trace comparison); no roadmap of the atlas plans the stabilisation of the twisted trace formula or the twisted weighted fundamental lemma: these are recorded as gaps.
2. Status of each input is read from Arthur's book §3.2 and from Atobe–Gan–Ichino–Kaletha–Mínguez–Shin §§0.3–0.4.

Direct prerequisites: `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate).

Acceptance controls:

- Every theorem node of ML.4 lists this register among its prerequisites, so that its conditional status is visible.

Sources: [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), §1.4.1, p. 14 (arXiv v3).

Suggested signature: omitted until C-ARTHUR supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-local-arthur-packets"></a>

### Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)

Target `ML.4/local-arthur-packets`; theorem. Proposed declaration: `TauCeti.Arthur.localPacket`.

Let F be a local field of characteristic 0, G a quasi-split Sp_{2n}, SO_{2n+1} or SO_{2n} over F with a fixed Whittaker datum, and ψ : L_F × SL₂(ℂ) → ^LG a local Arthur parameter whose restriction to L_F is bounded. Then there are a finite multiset Π̃_ψ of irreducible unitary representations of G(F) (for SO_{2n}, orbits under the outer automorphism) and a map π ↦ ⟨·, π⟩ from Π̃_ψ to the characters of S_ψ such that: (a) the distribution f ↦ Σ_{π ∈ Π̃_ψ} ⟨s_ψ, π⟩ f_G(π) is stable and is the transfer of the twisted character of the representation of GL_N(F) ⋊ θ attached to ψ; (b) for every endoscopic datum (G′, s) through which ψ factors as ψ′, f′(ψ′) = Σ_{π ∈ Π̃_ψ} ⟨s_ψ x, π⟩ f_G(π) (the endoscopic character identities); (c) if ψ = φ is trivial on SL₂(ℂ) (a tempered L-parameter) then Π̃_φ is a set of tempered representations, π ↦ ⟨·, π⟩ is injective, and bijective onto Ŝ_φ when F is p-adic; the packets Π̃_φ for φ ∈ Φ̃_bdd(G) are disjoint and exhaust the tempered dual. Part (c) is the local Langlands correspondence for G.

Hypotheses:

- F local of characteristic 0; G quasi-split symplectic or special orthogonal over F with a fixed Whittaker datum.
- The statement is conditional as recorded in ModularityAndLanglandsExtensions:ML.0/arthur-dependency-gate: Arthur's proof uses the stabilisation of the twisted trace formula and results he announces in [A24]–[A27].

Proof route:

1. Arthur's proof (2013, Chapters 2–7) is a long induction comparing the stabilised twisted trace formula of GL_N ⋊ θ with the stable trace formulas of the twisted endoscopic groups G, using the local intertwining relation.
2. The packets are defined by (a) and (b) through the twisted transfer of characters of GL_N (Mœglin–Waldspurger stabilisation; Waldspurger's transfer; the fundamental lemma).
3. No roadmap plans these proofs: they are recorded as the gap 'Arthur's endoscopic classification is an external conditional input' (see ML.4/trace-formula-inputs-register).

Direct prerequisites: [ML.4/extended-langlands-parameter](#target-extended-langlands-parameter), [ML.4/trace-formula-inputs-register](#target-trace-formula-inputs-register), [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Acceptance controls:

- The packets of a tempered φ with S_φ = 1 are singletons; for G = SL₂-type groups the packet sizes are |Ŝ_φ| ∈ {1, 2, 4}.

Sources: [James Arthur, The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](http://web.archive.org/web/20120511125150id_/http://claymath.org/cw/arthur/pdf/Book.pdf), §1.5, Theorem 1.5.1 and the paragraph before it, pp. 41–42 (2011 manuscript); [James Arthur, The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](http://web.archive.org/web/20120511125150id_/http://claymath.org/cw/arthur/pdf/Book.pdf), §1.5, after Theorem 1.5.1, p. 42 (2011 manuscript); [Chung Pang Mok, Endoscopic classification of representations of quasi-split unitary groups](https://arxiv.org/pdf/1206.0882), §2.5, Theorem 2.5.1 — independently checked downloaded PDF p.32; published-copy pagination where applicable.

Suggested signature: omitted until C-ARTHUR supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-mok-unitary-classification"></a>

### Endoscopic classification for quasi-split unitary groups (Mok)

Target `ML.4/mok-unitary-classification`; theorem. Proposed declaration: `TauCeti.Arthur.mok_multiplicity_formula`.

Let E/F be a quadratic extension of number fields and G = U_{E/F}(N) the quasi-split unitary group. Global parameters are formal sums ψ = ⊞_i μ_i ⊠ ν_{b_i} with μ_i conjugate-self-dual unitary cuspidal representations of GL_{m_i}(𝔸_E), Σ m_i b_i = N, pairwise distinct, each μ_i ⊠ ν_{b_i} conjugate-self-dual of sign (−1)^{N−1} (through the standard base change embedding ξ_{χ₊}). Then (local) for every place v there are packets Π_{ψ_v} with characters ⟨·, π_v⟩ of S_{ψ_v} satisfying the endoscopic character identities, and the tempered packets give the local Langlands correspondence for U(N)(F_v); and (global) L²_disc(G(F)\G(𝔸_F)) ≅ ⊕_{ψ ∈ Ψ_2(G, ξ_{χ₊})} ⊕_{π ∈ Π_ψ(ε_ψ)} π, with Π_ψ(ε_ψ) a multiset retaining repetitions; for generic ψ, multiplicity one holds (Mok Remark 2.5.3). No multiplicity-one assertion is made here for every non-generic ψ.

Hypotheses:

- E/F a quadratic extension of number fields; G = U_{E/F}(N) quasi-split; Whittaker datum fixed.
- Conditional exactly as Arthur's book on which Mok's proof depends (ML.0/arthur-dependency-gate).

Proof route:

1. Mok follows Arthur's method: comparison of the stabilised twisted trace formula of R_{E/F}GL_N ⋊ θ with the stable trace formulas of the unitary groups U(N₁) × U(N₂).
2. Mok Theorem 2.5.2 is a decomposition using global packet multisets; Remark 2.5.3 asserts multiplicity one for generic parameters. Absence of the even-orthogonal outer-automorphism ambiguity does not remove non-generic packet repetitions.

Direct prerequisites: [ML.4/global-arthur-parameter](#target-global-arthur-parameter), [ML.4/trace-formula-inputs-register](#target-trace-formula-inputs-register), [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate), `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`.

Acceptance controls:

- Check the sign convention: for N = 1, U(1) parameters are conjugate-orthogonal characters μ of 𝔸_E^×/E^× (μ|_{𝔸_F^×} = 1), and the multiplicity formula is Hilbert 90 / Pontryagin duality for U(1)(F)\U(1)(𝔸_F).

Sources: [Chung Pang Mok, Endoscopic classification of representations of quasi-split unitary groups](https://arxiv.org/pdf/1206.0882), §2.5, Theorem 2.5.2 and Remark 2.5.3, pp. 34–35 (arXiv v5).

Suggested signature: omitted until C-ARTHUR supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-symplectic-branch-status"></a>

### The symplectic (GSp₄) branch is conditional: its verification task

Target `ML.4/symplectic-branch-status`; comparison. Proposed declaration: `TauCeti.Arthur.symplecticBranchStatus`.

The symplectic branch of ML.4 (Gee–Taïbi's classification of the discrete spectrum of GSp₄, ML.4/gsp4-arthur-classification, and everything that uses it: ML.4/gl4-symplectic-descent, ML.4/non-general-type-reducible and the GSp₄ modularity theorems of Boxer–Calegari–Gee–Pilloni and Calegari–Geraghty) is conditional on Arthur's classification for Sp₄ and SO₅ with the inputs of ML.4/trace-formula-inputs-register. It is not made unconditional by the availability of Mok's or KMSW's unitary results. The verification task is: (i) list the statements of Arthur's book that rest on the announced references [A24]–[A27] and on the twisted weighted fundamental lemma; (ii) check, for each, whether a published proof now exists (Mœglin–Waldspurger for the stabilisation; Atobe–Gan–Ichino–Kaletha–Mínguez–Shin for the local intertwining relation); (iii) record the remaining hypotheses as explicit hypotheses of every GSp₄ endpoint.

Hypotheses:

- Status register; the hypotheses it lists are carried by the consumer nodes.

Proof route:

1. Gee–Taïbi deduce GSp₄ from Arthur's classification for Sp₄ and SO₅ (restriction to Sp₄ and the similitude character); they inherit Arthur's hypotheses.
2. Boxer–Calegari–Gee–Pilloni §1.4.1 and Calegari–Geraghty §1.4 state the dependence explicitly; BCGP 2025 §1.6 isolates the remaining twisted weighted fundamental lemma.

Direct prerequisites: [ML.4/trace-formula-inputs-register](#target-trace-formula-inputs-register), [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate).

Acceptance controls:

- The acceptance criterion of ML.4: the symplectic branch has a named verification task and is never marked unconditional because a unitary theorem is available.

Sources: [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), §1.4.1, p. 14 (arXiv v3).

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-adams-johnson-packets"></a>

### Archimedean Arthur packets of cohomological parameters are Adams–Johnson packets

Target `ML.4/adams-johnson-packets`; theorem. Proposed declaration: `TauCeti.Arthur.adamsJohnson_eq_arthurPacket`.

Let G be a quasi-split real symplectic, special orthogonal or unitary group and let ψ be an Adams–Johnson Arthur parameter in the sense of AJ87. AMR Theorem 1.1 identifies the Whittaker-normalized twisted transfer of its stable Adams–Johnson character with the twisted GL_N character of Std∘ψ; consequently its Arthur packet equals the Adams–Johnson packet of cohomologically induced modules A_𝔮(λ), with the multiplicity-one conclusion used by Chenevier–Taïbi. AMR §8.1 lists consequences of the AJ parameter conditions, including regular integral infinitesimal character, centralizer Levi and factorization through a unitary-character parameter with principal SL₂. It explicitly does not restate their full definition. Those consequences are not asserted sufficient here; the complete AJ condition is a named missing supplier definition, so its dependent signature is omitted.

Hypotheses:

- G is quasi-split over ℝ and ψ is an actual Adams–Johnson parameter. Its full defining conditions must be supplied by AF.1’s real-packet extension; regular integral infinitesimal character alone is insufficient.
- Global applications (Chenevier–Taïbi; Ichino–Prasanna) are conditional on ML.0/arthur-dependency-gate; Ichino–Prasanna use KMSW Theorem* 1.7.1 for non-generic parameters, which KMSW prove only for generic ones (recorded at the node).

Proof route:

1. Import AMR Theorem 1.1 at the exact AJ87 parameter scope. The proof compares stable sums of cohomological characters with the Whittaker-normalized twisted GL_N trace, using tempered spectral transfer and resolutions by standard modules.
2. Request the complete parameter definition and cohomological induction objects, then expose the equality as a packet/multiset comparison. The higher-rank non-quasi-split global application separately retains KMSW’s actual nongeneric local hypotheses.

Direct prerequisites: [ML.4/local-arthur-packets](#target-local-arthur-packets), [ML.4/mok-unitary-classification](#target-mok-unitary-classification), `AutomorphicFormsOnReductiveGroups:AF.1/discrete-series`, [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate).

Acceptance controls:

- Chenevier–Taïbi (5.2.1): for Sp_{2g} and holomorphic discrete series ρ_k (k_g > g), ρ_k ∈ Π(ψ_ℝ) iff d_{i₀} = 1, with the character values given there.

Sources: [Gaëtan Chenevier, Olivier Taïbi, Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf), §5.2.1, p. 303 (published); [Atsushi Ichino, Kartik Prasanna, Hodge classes and the Jacquet–Langlands correspondence](https://arxiv.org/pdf/1806.10563v2), §11.2, p. 70 (arXiv v2); published p. 81; [Nicolas Arancibia, Colette Mœglin and David Renard, Paquets d’Arthur des groupes classiques et unitaires](https://arxiv.org/pdf/1507.01432v2), Theorem 1.1, §1, printed p. 3; Adams–Johnson parameter hypotheses in §8.1.

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-arthur-multiplicity-formula"></a>

### Arthur's multiplicity formula for quasi-split classical groups (Theorem 1.5.2)

Target `ML.4/arthur-multiplicity-formula`; theorem. Proposed declaration: `TauCeti.Arthur.multiplicity_formula`.

Let G be as in ML.4/global-arthur-parameter. Then L²_disc(G(F)\G(𝔸_F)) ≅ ⊕_{ψ ∈ Ψ̃_2(G)} ⊕_{π ∈ Π̃_ψ(ε_ψ)} m_ψ π, where Π̃_ψ = ⊗'_v Π̃_{ψ_v} is the global packet (π_v unramified with ⟨·, π_v⟩ = 1 for almost all v; the local components ψ_v lie in Ψ̃⁺_unit(G_v), not necessarily bounded since the Ramanujan conjecture is unknown, and their packets are defined from the bounded case by Arthur's (1.5.1)–(1.5.2)), Π̃_ψ(ε_ψ) is the set of π = ⊗π_v ∈ Π̃_ψ whose character ⟨·, π⟩ = ∏_v ⟨·, π_v⟩, restricted to S_ψ, equals ε_ψ, and m_ψ ∈ {1, 2} is Arthur's multiplicity (m_ψ = 2 exactly when N is even, Ĝ = SO(N, ℂ) and every N_i = m_i b_i is even; otherwise m_ψ = 1). In particular every discrete automorphic representation of G has a parameter ψ, its transfer to GL_N(𝔸_F) is the isobaric representation of ψ, and the summands with generic ψ are the discrete representations whose transfer is a sum of distinct self-dual cuspidals.

Hypotheses:

- F a number field, 𝔸_F its adèles; G a quasi-split symplectic or special orthogonal group over F (Sp_{2n}, split SO_{2n+1}, or quasi-split SO_{2n} attached to a quadratic character η_G), whose dual group Ĝ has a standard representation of dimension N (N = 2n + 1, 2n, 2n respectively).
- Conditional as recorded in ModularityAndLanglandsExtensions:ML.0/arthur-dependency-gate.

Proof route:

1. Arthur 2013, Chapters 3–8: comparison of the stable multiplicity formula with the discrete part of the stabilised trace formula of G and the twisted trace formula of GL_N, by induction on N.
2. The local packets and the pairing ⟨·, π_v⟩ are those of ML.4/local-arthur-packets.
3. The global sign ε_ψ arises from the global intertwining operators normalised by Langlands–Shahidi; its computation uses the root numbers of the Rankin–Selberg products.

Direct prerequisites: [ML.4/global-arthur-parameter](#target-global-arthur-parameter), [ML.4/local-arthur-packets](#target-local-arthur-packets), [ML.4/trace-formula-inputs-register](#target-trace-formula-inputs-register), [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate), `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`.

Acceptance controls:

- Recover the trivial representation of PGL₂ = SO₃ from ψ = 1 ⊠ ν₂, and the cuspidal spectrum of PGL₂ from the generic parameters of ML.4/global-arthur-parameter's test so3_generic_iff (multiplicity one for SL₂-packets after restriction is not claimed: SL₂ is not SO₃).

Sources: [James Arthur, The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](http://web.archive.org/web/20120511125150id_/http://claymath.org/cw/arthur/pdf/Book.pdf), §1.5, Theorem 1.5.2 and (1.5.3)–(1.5.7), pp. 45–47 (2011 manuscript).

Suggested signature: omitted until C-ARTHUR supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-kmsw-inner-forms"></a>

### Endoscopic classification for inner forms of unitary groups (Kaletha–Mínguez–Shin–White)

Target `ML.4/kmsw-inner-forms`; theorem. Proposed declaration: `TauCeti.Arthur.kmsw_multiplicity_formula`.

For an extended pure inner twist Ξ of U_{E/F}(N) and a bounded tempered local parameter φ, KMSW Theorem 1.6.1 gives finite packets with the pairing determined by Ξ and refined endoscopic character identities. At nonarchimedean places the packet maps bijectively to Irr(S_φ^♮,χ_Ξ). At real places this is a bijection only after taking the disjoint union over the specified pure inner forms; a fixed real form need not realize every character. For a global PURE inner twist and a generic discrete parameter ψ, the ψ-part of the discrete spectrum is the sum over Π_ψ(G,Ξ,ε_ψ). For nongeneric ψ or general inner twists, the version printed as Theorem* 1.7.1 uses the two explicitly stated inputs of Chapter 5: the local classification at each ψ_v (Hypothesis 3.6.3) and the local intertwining relation (Theorem* 2.6.2) at every place. This packet does not assert those inputs for the unproved cases.

Hypotheses:

- Quadratic extension E/F, fixed Whittaker datum on the quasi-split form and extended pure inner twist Ξ with its associated central character χ_Ξ.
- Proved global scope in the cited KMSW edition: generic parameter and pure inner twist, together with the registered Mok/Arthur external classification hypothesis. The more general statement is conditional on the actual local classification and local intertwining identities for each localization, not on a label kmswHypotheses.

Proof route:

1. KMSW compare the trace formula of G with the stable trace formulas of the endoscopic groups, using Mok's results for the quasi-split inner form and the theory of extended pure inner twists (Kottwitz's B(G)).
2. The global statement is proved for generic parameters; non-tempered local packets of inner forms are not constructed.

Direct prerequisites: [ML.4/mok-unitary-classification](#target-mok-unitary-classification), [ML.4/trace-formula-inputs-register](#target-trace-formula-inputs-register), [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate).

Acceptance controls:

- Check the degenerate case: for G quasi-split the statement is Mok's (ML.4/mok-unitary-classification).

Sources: [Tasho Kaletha, Alberto Minguez, Sug Woo Shin, Paul-James White, Endoscopic Classification of Representations: Inner Forms of Unitary Groups](https://arxiv.org/pdf/1409.3731), §1.6.1, Theorem* 1.6.1 and the sentence before it, p. 80 (arXiv v3); [Tasho Kaletha, Alberto Minguez, Sug Woo Shin, Paul-James White, Endoscopic Classification of Representations: Inner Forms of Unitary Groups](https://arxiv.org/pdf/1409.3731), Theorem* 1.6.1(5), pp. 80–81; Theorem* 1.7.1 and discussion, p. 89; Chapter 5 and Theorem 5.0.5, pp. 205–206.

Suggested signature: omitted until C-ARTHUR supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-moeglin-renard-packets"></a>

### Arthur packets of Sp_{2g}(ℝ) containing scalar unitary lowest weight modules (Mœglin–Renard)

Target `ML.4/moeglin-renard-packets`; theorem. Proposed declaration: `TauCeti.Arthur.moeglinRenard_packet`.

Let ψ=ψ_u⊕⊕_j(δ_{t_j}⊠R[a_j]) be an Arthur parameter of Sp_{2g}(ℝ), with ψ_u=⊕_i χ_i⊠R[a′_i], χ_i∈{1,sgn}, a′_i odd, one or three unipotent summands, t_j>0 and t_j+a_j odd. Put a(ψ_u)=max_i a′_i. For 0≤k≤g assume that the infinitesimal character is {k−1,…,k−g,−(k−1),…,−(k−g),0}. The scalar highest-weight module π_g(k) belongs to Π_ψ exactly in either of these cases: (i) dim ψ_u=1, 2k>g+1, and the closed intervals [(t_i−a_i+1)/2,(t_i+a_i−1)/2] are pairwise disjoint; (ii) ψ=(sgn^{(2g+1−a(ψ_u))/2}⊠R[a(ψ_u)])⊕ψ′, where ψ′ is a parameter for the compact even orthogonal group O(0,2g+1−a(ψ_u)), its packet contains a finite-dimensional E_{ψ′}, and the Howe lift of E_{ψ′} is π_g(k). In either case π_g(k) has multiplicity one. The refinement for k≥1 has a(ψ_u)=2(g−k)+1 or 2(g−k)+3 in the theta branch; the latter requires 2k≥g+2. The packet character is a separate assertion of Proposition 18.3, whose formula remains a requested export.

Hypotheses:

- The parameter decomposition and infinitesimal-character condition in the statement. Global uses carry the explicit external classification assumptions; the local criterion is not encoded by an arbitrary CaseI proposition.

Proof route:

1. Import the real scalar packet membership criterion and cohomological/theta constructions from the requested real-packet extension of AF.1. Mœglin–Renard Theorem 7.1 is now read directly. Its theta branch requires the compact orthogonal correspondence, which elementary MP.3 does not supply.

Direct prerequisites: [ML.4/local-arthur-packets](#target-local-arthur-packets), `AutomorphicFormsOnReductiveGroups:AF.1/discrete-series`, [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate).

Acceptance controls:

- Used by Chenevier–Taïbi to count level-one Siegel modular forms of small weight.

Sources: [Gaëtan Chenevier, Olivier Taïbi, Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf), §5.2.2, pp. 303–305 (published); [Gaëtan Chenevier, Olivier Taïbi, Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf), §5.2.2, case (H), p. 305 (published); [Colette Mœglin and David Renard, Sur les paquets d’Arthur de Sp(2n,R) contenant des modules unitaires de plus haut poids, scalaires](https://arxiv.org/pdf/1802.04611v4), Theorem 7.1, §7, pp. 18–19; notation §1, pp. 1–3.

Suggested signature: omitted until C-ARTHUR supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-vogan-packets-so-v"></a>

### Vogan packets for odd special orthogonal groups of all quadratic spaces

Target `ML.4/vogan-packets-so-v`; theorem. Proposed declaration: `TauCeti.Arthur.voganPacket_so`.

Let F be a local field of characteristic 0 and φ : L_F → Sp_{2n}(ℂ) an L-parameter. For each (2n+1)-dimensional quadratic space V over F with trivial discriminant there is a (possibly empty) L-packet Π_φ(SO(V)), and Irr SO(V) = ⊔_φ Π_φ(SO(V)); moreover there is a bijection ⊔_V Π_φ(SO(V)) ↔ Ŝ_φ, σ_η ↔ η, onto the characters of the component group S_φ of the centraliser of Im φ in Sp_{2n}(ℂ), where σ_η is a representation of SO(V) only if η(z_φ) = ε(V) (the normalised Hasse–Witt invariant), with equality of the two conditions for F non-archimedean or F = ℂ. σ ∈ Π_φ(SO(V)) is square-integrable iff φ is multiplicity-free and of good parity, and tempered iff φ is tempered.

Hypotheses:

- F local of characteristic 0; V of odd dimension 2n + 1 with trivial discriminant (SO(V⁺) split, SO(V⁻) its pure inner form).
- Conditional: the split case is Arthur's (ML.0/arthur-dependency-gate); the non-split case is Mœglin–Renard's, which assumes Arthur-type results for inner forms (proved for generic parameters by Ishimoto).

Proof route:

1. Split SO(V⁺): ML.4/local-arthur-packets (c) for SO_{2n+1}.
2. Non-split SO(V⁻): Mœglin–Renard, with Ishimoto's local intertwining relation and endoscopic character relations for generic parameters; Gan–Ichino (5.3) record the combined statement.
3. Square-integrability and temperedness criteria follow from the packet construction (Mœglin).

Direct prerequisites: [ML.4/local-arthur-packets](#target-local-arthur-packets), [ML.4/extended-langlands-parameter](#target-extended-langlands-parameter), [ML.4/trace-formula-inputs-register](#target-trace-formula-inputs-register), [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate).

Acceptance controls:

- For n = 1: SO(V⁺) ≅ PGL₂ and SO(V⁻) ≅ D^×/F^× for the quaternion division algebra D; the Vogan packet of a discrete parameter φ with S_φ = ℤ/2ℤ is {the discrete series of PGL₂, its Jacquet–Langlands transfer to D^×/F^×}.

Sources: [Wee Teck Gan, Atsushi Ichino, The Shimura–Waldspurger correspondence for Mp_2n](https://arxiv.org/pdf/1705.10106v3), §5.2, (5.3), p. 17 (arXiv v3); published p. 987; [Wee Teck Gan, Atsushi Ichino, The Shimura–Waldspurger correspondence for Mp_2n](https://arxiv.org/pdf/1705.10106v3), §1.2, p. 4 (arXiv v3); published p. 969.

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-xu-gsp2n-packets"></a>

### Xu's L-packets for similitude groups GSp_{2n} (as used for PGSp₆)

Target `ML.4/xu-gsp2n-packets`; theorem. Proposed declaration: `TauCeti.Arthur.xuPacket`.

Let F be a non-archimedean local field of characteristic 0 and φ♭ an L-parameter of Sp₆ whose L-packet Π_{φ♭} has trivial central character (for n = 3: φ♭ lifts to Spin₇(ℂ)). Let Π̃_{φ♭} be the set of irreducible representations of PGSp₆(F) whose restriction to Sp₆(F) has constituents in Π_{φ♭}, and Φ̃_{φ♭} the finite set of lifts φ of φ♭ to the dual group of PGSp₆, a homogeneous set under Hom(W_F, μ₂). Xu partitions Π̃_{φ♭} into packets Π̃^X_{φ♭} with: (a) the packets are the twists Π̃^X_{φ♭} ⊗ χ by quadratic characters χ of the similitude; (b) restriction to Sp₆ gives a bijection Π̃^X_{φ♭} → Π_{φ♭}/PGSp₆(F); (c) there is a natural bijection Π̃^X_{φ♭} ↔ Irr(S_φ/Z) for any lift φ ∈ Φ̃_{φ♭}; (d) with respect to (c) the packets satisfy the stability and endoscopic character identities; (e) the stabiliser of a member in Hom(F^×, μ₂) equals the stabiliser of φ in Hom(W_F, μ₂), so the packets and the lifts are non-canonically isomorphic homogeneous sets. Xu does not determine which lift φ is the parameter of which packet.

Hypotheses:

- F non-archimedean of characteristic 0; n=3 (PGSp₆/Sp₆), exactly the specialization read in Gan–Savin §7; classification remains conditional on its named Arthur inputs. A general n statement requires direct reading of Xu.

Proof route:

1. Xu (Compositio 2016, Prop. 6.27–6.28, Thm 6.30; Math. Ann. 2017, Prop. 4.4, Thm 4.6; Amer. J. Math. 2025, Thm 4.1): restrict to Sp_{2n}, use Arthur's packets there and the twisted endoscopic character identities for GSp_{2n}.
2. Gan–Savin §9 resolve the matching of (e) when φ♭ factors through G₂.

Direct prerequisites: [ML.4/local-arthur-packets](#target-local-arthur-packets), [ML.4/extended-langlands-parameter](#target-extended-langlands-parameter), [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate).

Acceptance controls:

- For n = 2 Xu's packets for GSp₄ agree with the Gan–Takeda L-packets (ML.4/gan-takeda-llc-gsp4) up to the ambiguity (e).

Sources: [Wee Teck Gan, Gordan Savin, The local Langlands conjecture for G_2](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/the-local-langlands-conjecture-for-dollarg2dollar.pdf), §7, (7.1), p. 22 (published); [Wee Teck Gan, Gordan Savin, The local Langlands conjecture for G_2](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/the-local-langlands-conjecture-for-dollarg2dollar.pdf), §7 (a)–(b), p. 22 (published); [Wee Teck Gan, Gordan Savin, The local Langlands conjecture for G_2](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/the-local-langlands-conjecture-for-dollarg2dollar.pdf), §7 (e), p. 23 (published).

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-amf-nonsplit-so-v"></a>

### Arthur's multiplicity formula for non-split odd orthogonal groups, generic parameters (Gan–Ichino's hypothesis (6.1))

Target `ML.4/amf-nonsplit-so-v`; theorem. Proposed declaration: `TauCeti.Arthur.multiplicity_formula_so_nonsplit`.

Let F be a number field and V a (2n+1)-dimensional quadratic space with trivial discriminant. The near-equivalence decomposition L²_disc(SO(V))=⊕_ΦL²_Φ(SO(V)) ranges over all elliptic A-parameters, including non-generic ones. For a generic elliptic Φ only, Gan–Ichino hypothesis (6.1) gives L²_Φ(SO(V))=⊕_ηm_ηΣ_η through its Vogan packets, where m_η=1 if Δ*η=1 and 0 otherwise. The decomposition and the generic multiplicity formula have different quantifier scopes. The split case follows from Arthur; the non-split generic result uses the stated external inner-form classification.

Hypotheses:

- F a number field; V odd-dimensional with trivial discriminant; Φ generic elliptic.
- For split SO(V) this is Arthur's Theorem 1.5.2; for non-split SO(V) Gan–Ichino assume it (their hypothesis (6.1) with the decomposition of §3.1), and Ishimoto proves it for generic parameters; conditional on ML.0/arthur-dependency-gate.

Proof route:

1. Split case: ML.4/arthur-multiplicity-formula.
2. Non-split case: comparison of the trace formula of SO(V) with that of its quasi-split inner form (Ishimoto, following Kaletha–Mínguez–Shin–White's method for unitary groups), using the local results of ML.4/vogan-packets-so-v.

Direct prerequisites: [ML.4/vogan-packets-so-v](#target-vogan-packets-so-v), [ML.4/arthur-multiplicity-formula](#target-arthur-multiplicity-formula), [ML.4/kmsw-inner-forms](#target-kmsw-inner-forms), [ML.4/trace-formula-inputs-register](#target-trace-formula-inputs-register), [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate).

Acceptance controls:

- Gan–Ichino's Theorem 1.4 (the multiplicity formula for Mp_{2n}) is stated under this hypothesis; the node keeps the hypothesis visible for every consumer.

Sources: [Wee Teck Gan, Atsushi Ichino, The Shimura–Waldspurger correspondence for Mp_2n](https://arxiv.org/pdf/1705.10106v3), §6.2, (6.1), p. 22 (arXiv v3); published p. 993; [Wee Teck Gan, Atsushi Ichino, The Shimura–Waldspurger correspondence for Mp_2n](https://arxiv.org/pdf/1705.10106v3), §3.1, p. 10 (arXiv v3); published p. 977.

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-generic-packets-standard-modules"></a>

### Members of generic L-packets of classical groups are irreducible standard modules (Jiang–Zhang, Proposition B.1)

Target `ML.4/generic-packets-standard-modules`; theorem. Proposed declaration: `TauCeti.Arthur.genericPacket_standardModule`.

Let F be a local field of characteristic 0, G a classical group over F (quasi-split, or a pure inner form) and φ a generic L-parameter (its L-packet contains a generic member for some Whittaker datum of the quasi-split form). Then every member of the L-packet Π_φ(G) is an irreducible standard module, i.e. the full induced representation from the tempered data of its Langlands quotient is irreducible.

Hypotheses:

- F local of characteristic 0; G classical (symplectic, orthogonal or unitary, or a pure inner form); φ generic.
- Conditional through the packets used (ML.0/arthur-dependency-gate).

Proof route:

1. Mœglin–Waldspurger (generic packets and standard modules), Gan–Ichino (the Gross–Prasad–Rallis conjecture), Heiermann (the standard module conjecture for classical groups), Adams–Barbasch–Vogan (archimedean case), as assembled in Jiang–Zhang Appendix B.

Direct prerequisites: [ML.4/local-arthur-packets](#target-local-arthur-packets), [ML.4/vogan-packets-so-v](#target-vogan-packets-so-v), [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate).

Acceptance controls:

- For G = GL_n (not classical, but the model case) the statement is Zelevinsky's standard module result for generic representations.

Sources: [Dihua Jiang, Lei Zhang, Arthur parameters and cuspidal automorphic modules of classical groups](https://arxiv.org/pdf/1508.03205v4), Appendix B, Proposition B.1 and proof, p. 85 (arXiv v4); published p. 818.

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-gsp4-arthur-classification"></a>

### Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)

Target `ML.4/gsp4-arthur-classification`; theorem. Proposed declaration: `TauCeti.Arthur.GSp4.classification`.

Let F be a totally real number field. Every discrete automorphic representation π of GSp₄(𝔸_F) has a transfer π̃ to GL₄(𝔸_F) (its global parameter) of one of the six types (a)–(f) of ML.4/gsp4-discrete-spectrum-types, and the discrete spectrum is described by Arthur's multiplicity formula for GSp₄. In particular: (i) the transfer is compatible with rec_GT at every finite place; (ii) for a parameter ψ = π̃ ⊠ 1 of general type the global component group S_ψ is trivial, so for every choice of local packet members π′_v ∈ Π_{ψ_v} (π′_v unramified for almost all v) ⊗′_v π′_v is automorphic; (iii) such representations occur with multiplicity one; and for a general-type ψ the archimedean packet Π_{ψ_∞} is the L-packet of the archimedean parameter.

Hypotheses:

- F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete automorphic representation of GSp₄(𝔸_F) with central character ω_π.
- Conditional on ML.0/arthur-dependency-gate: Gee–Taïbi prove Arthur's 2004 announcement from Arthur 2013 for Sp₄ and SO₅, and the result is only as unconditional as Arthur 2013 and Mœglin–Waldspurger's stabilisation.
- The BCGP §2.9 statement used here has F totally real; a version over an arbitrary number field needs a separately checked Gee–Taïbi export.

Proof route:

1. Gee–Taïbi: restrict from GSp₄ to Sp₄ and use Arthur's classification for Sp₄ (Ĝ = SO₅) and for SO₅ ≅ PGSp₄ (Ĝ = Sp₄), together with the similitude character, and prove compatibility with rec_GT.
2. Parts (ii)–(iii) for general type: ψ is stable (S_ψ = 1), so ε_ψ = 1 and every member of the global packet occurs once.

Direct prerequisites: [ML.4/gsp4-discrete-spectrum-types](#target-gsp4-discrete-spectrum-types), [ML.4/arthur-multiplicity-formula](#target-arthur-multiplicity-formula), [ML.4/gan-takeda-llc-gsp4](#target-gan-takeda-llc-gsp4), [ML.4/symplectic-branch-status](#target-symplectic-branch-status), [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate).

Acceptance controls:

- Calegari–Geraghty Theorem 7.11 and Pilloni Proposition 15.2.4.1 use exactly (ii) and (iii) to move between the holomorphic and generic limits of discrete series at infinity.

Sources: [Frank Calegari, David Geraghty, Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](http://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Theorem 7.11, §7.2, publ. p. 854; arXiv v1 p. 40; [Frank Calegari, David Geraghty, Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](http://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Theorem 7.11, publ. p. 855 (copy p. 55); [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), §2.9 'Arthur's classification', first paragraph — independently checked downloaded PDF p.38; published-copy pagination where applicable.

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-packet-member-irreducibility"></a>

### Irreducibility of the induced representations building almost tempered packets (Gan–Ichino, Lemmas 5.1 and 5.5)

Target `ML.4/packet-member-irreducibility`; theorem. Proposed declaration: `TauCeti.Arthur.induced_irreducible_of_almostTempered`.

(Lemma 5.1) Let F be local of characteristic 0, φ = ϕ ⊕ ϕ^∨ ⊕ φ₀ an almost tempered symplectic parameter, V = H^k ⊕ V₀ (k = dim ϕ), Q ⊂ SO(V) the parabolic with Levi GL_k × SO(V₀) and τ ∈ Irr GL_k(F) attached to ϕ. Then Ind_Q^{SO(V)}(τ ⊗ σ₀) is irreducible for every σ₀ ∈ Π_{φ₀}(SO(V₀)). (Lemma 5.5) Let φ′ = φ ⊕ S_{2r−2n} with φ a 2n-dimensional almost tempered symplectic representation of L_F, 2n < r − 1, φ = ϕ ⊕ ϕ^∨ ⊕ φ₀, φ′₀ = φ₀ ⊕ S_{2r−2n}, Q′ ⊂ SO_{2r+1} with Levi GL_k × SO_{2r−2k+1}. Then Ind_{Q′}^{SO_{2r+1}}(τ ⊗ σ′₀) is irreducible for every irreducible subrepresentation σ′₀ of every member of the A-packet Π_{φ′₀}(SO_{2r−2k+1}).

Hypotheses:

- F local of characteristic 0; 'almost tempered' as in Gan–Ichino §5.2: ϕ with exponents in (−1/2, 1/2) after the tempered part is split off.
- In both lemmas φ=ϕ⊕ϕ^∨⊕φ₀ is the canonical bad/good decomposition: φ₀ consists of the symplectic irreducible summands and ϕ selects the non-symplectic dual pairs. An arbitrary choice of a symplectic subparameter φ₀ does not satisfy the source hypothesis.

Proof route:

1. Lemma 5.1, F non-archimedean: Mœglin–Waldspurger §2.14 with the Gross–Prasad–Rallis conjecture proved by Gan–Ichino (Appendix B of their Formal degrees paper); archimedean F by Arthur's refined inductive property.
2. Lemma 5.5: Mœglin (non-archimedean) and Mœglin–Renard (F = ℂ).

Direct prerequisites: [ML.4/vogan-packets-so-v](#target-vogan-packets-so-v), [ML.4/local-arthur-packets](#target-local-arthur-packets).

Acceptance controls:

- The lemmas are what makes the members σ_η of almost tempered packets irreducible (Gan–Ichino Proposition 5.4).

Sources: [Wee Teck Gan, Atsushi Ichino, The Shimura–Waldspurger correspondence for Mp_2n](https://arxiv.org/pdf/1705.10106v3), §5.2, Lemma 5.1 and proof, p. 18 (arXiv v3); published p. 987; [Wee Teck Gan, Atsushi Ichino, The Shimura–Waldspurger correspondence for Mp_2n](https://arxiv.org/pdf/1705.10106v3), §5.4, Lemma 5.5 and proof, p. 20 (arXiv v3); published p. 990.

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-xu-multiplicity-formula"></a>

### Xu's multiplicity formula for the tempered discrete spectrum of PGSp_{2n}

Target `ML.4/xu-multiplicity-formula`; theorem. Proposed declaration: `TauCeti.Arthur.xu_multiplicity_formula`.

Let F be a number field. Xu describes the tempered part of the discrete automorphic spectrum of PGSp_{2n} (as used: n = 3) by global packets Π̃^X_{Ψ♭} = ⊗_v Π̃^X_{Ψ♭_v} built from the local packets of ML.4/xu-gsp2n-packets, indexed by generic A-parameters Ψ♭ of Sp_{2n}, with an Arthur-type multiplicity formula. In particular, if Σ is a cuspidal automorphic representation of PGSp₆ whose restriction to Sp₆ has a generic A-parameter Ψ♭ with trivial global component group, every element of the global packet containing Σ is automorphic.

Hypotheses:

- F a number field; tempered part only; conditional through Arthur's classification (ML.0/arthur-dependency-gate).

Proof route:

1. Xu (Amer. J. Math. 2025, Theorem 4.1): from Arthur's multiplicity formula for Sp_{2n} and the local results (a)–(e).
2. Trivial component group: ε_Ψ = 1 and the sign condition is empty, so every member occurs.

Direct prerequisites: [ML.4/xu-gsp2n-packets](#target-xu-gsp2n-packets), [ML.4/arthur-multiplicity-formula](#target-arthur-multiplicity-formula), [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate).

Acceptance controls:

- Gan–Savin §12.8 apply it to a cuspidal Σ on PGSp₆ in the proof of Theorem 12.7.

Sources: [Wee Teck Gan, Gordan Savin, The local Langlands conjecture for G_2](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/the-local-langlands-conjecture-for-dollarg2dollar.pdf), §7 (f), p. 23 (published); [Wee Teck Gan, Gordan Savin, The local Langlands conjecture for G_2](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/the-local-langlands-conjecture-for-dollarg2dollar.pdf), §12.8, proof of Theorem 12.7, pp. 39–40 (published).

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-gl4-symplectic-descent"></a>

### Descent from GL₄ of symplectic type to GSp₄ (BCGP Theorem 2.9.3)

Target `ML.4/gl4-symplectic-descent`; theorem. Proposed declaration: `TauCeti.Arthur.GSp4.descent_of_symplecticType`.

Let F be totally real and Π a cuspidal automorphic representation of GL₄(𝔸_F) of symplectic type with multiplier χ. Then there is a discrete automorphic representation π of GSp₄(𝔸_F) with central character χ whose transfer is Π. More precisely, if for each place v π_v is any element of the L-packet corresponding to (rec_p(Π_v), χ_v), then π := ⊗′_v π_v is automorphic and occurs with multiplicity one in the discrete spectrum; if moreover Π is algebraic, π is cuspidal.

Hypotheses:

- F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete automorphic representation of GSp₄(𝔸_F) with central character ω_π.
- Π cuspidal of symplectic type with multiplier χ; conditional on ML.0/arthur-dependency-gate.

Proof route:

1. The first two statements are immediate from the multiplicity formula of ML.4/gsp4-arthur-classification (S_ψ = 1 for ψ = Π ⊠ 1).
2. Cuspidality for algebraic Π: Clozel's purity lemma makes Π_∞ essentially tempered, and Wallach's criterion (a discrete representation with tempered archimedean component is cuspidal) applies.

Direct prerequisites: [ML.4/gsp4-arthur-classification](#target-gsp4-arthur-classification), `AutomorphicFormsOnReductiveGroups:AF.4`.

Acceptance controls:

- Consumers: BCGP Lemma 8.3.2 (soluble descent of GSp₄ automorphy), Theorem 9.3.1 and §7.13.

Sources: [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Theorem 2.9.3, §2.9 — independently checked downloaded PDF p.39; published-copy pagination where applicable; [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Proof of Theorem 2.9.3, PDF/printed p.39 (arXiv v3).

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-gsp4-archimedean-limit-packets"></a>

### The archimedean L-packet of a limit of discrete series of GSp₄(ℝ)

Target `ML.4/gsp4-archimedean-limit-packets`; theorem. Proposed declaration: `TauCeti.Arthur.GSp4.limitPacket`.

Let λ = (λ₁, 0; c) with λ₁ < 0. The limits of discrete series of GSp₄(ℝ) with infinitesimal character λ attached to the two Weyl chambers positive for λ are π(λ)^h (containing the holomorphic and antiholomorphic limits of discrete series of Sp₄(ℝ)) and π(λ)^g (the generic one), and the archimedean L-packet containing π(λ)^h is {π(λ)^g, π(λ)^h} (Blasius–Harris–Ramakrishnan, Proposition 5.3.7). In Calegari–Geraghty's notation this is the packet {π(λ, C₀), π(λ, C₁)}, λ = (a − 1, 0; 4 − a), and for a global parameter ψ of general type the archimedean Arthur packet Π_{ψ_∞} is this L-packet.

Hypotheses:

- λ = (λ₁, 0; c) with λ₁ < 0 (Pilloni's Proposition 15.2.4.1 prints λ₁ > 0: recorded as a source issue).
- The identification of Π_{ψ_∞} with the L-packet uses Arthur's classification (ML.0/arthur-dependency-gate).

Proof route:

1. Harish-Chandra parametrisation of (limits of) discrete series by Weyl chambers (AutomorphicFormsOnReductiveGroups).
2. Blasius–Harris–Ramakrishnan Proposition 5.3.7 / Mok §3.1: the L-packet of the parameter with infinitesimal character λ.
3. For general-type ψ, ψ_∞ is trivial on SL₂ (S_ψ = 1), so Π_{ψ_∞} is the L-packet (Wallach Theorem 2.1, as cited by CG).

Direct prerequisites: [ML.4/gsp4-arthur-classification](#target-gsp4-arthur-classification), [ML.0/archimedean-langlands-conventions](#target-archimedean-langlands-conventions), `AutomorphicFormsOnReductiveGroups:AF.1/discrete-series`.

Acceptance controls:

- Pilloni's Proposition 15.2.4.1 and CG's Theorem 7.11 switch between π(λ)^h and π(λ)^g using this packet.

Sources: [Vincent Pilloni, Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §15.2.4, proof of Proposition 15.2.4.1, p. 109 (author version); [Frank Calegari, David Geraghty, Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](http://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Theorem 7.11, point (2), publ. p. 855; arXiv v1 p. 41.

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-non-general-type-reducible"></a>

### Discrete representations of GSp₄ not of general type have reducible Galois representations (BCGP Lemma 2.9.1)

Target `ML.4/non-general-type-reducible`; theorem. Proposed declaration: `TauCeti.Arthur.GSp4.reducible_of_not_generalType`.

Let F be totally real and π a discrete automorphic representation of GSp₄(𝔸_F) such that for each v | ∞, π_v has the infinitesimal character of the L-packet of φ_{(2; k_v−1, l_v−2)} with k_v ≡ l_v (mod 2) and k_v ≥ l_v ≥ 2. If π is not of general type, there is a compatible system of reducible Galois representations ρ_{π,p} : G_F → GSp₄(Q̄_p) with WD(ρ_{π,p}|_{G_{F_v}})^{ss} ≅ rec_{GT,p}(π_v ⊗ |ν|^{−3/2})^{ss} for all but finitely many v. Pilloni (§5.1.7) records the same for F = ℚ and discrete-series π_∞: in types (b)–(f), ρ_{π,λ} is a sum of representations attached to GL₁ and regular algebraic GL₂ forms. For general type, irreducibility of ρ_{π,p} is only expected (BCGP Remark 2.9.2).

Hypotheses:

- F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete automorphic representation of GSp₄(𝔸_F) with central character ω_π.
- The archimedean condition of the lemma; conditional on ML.0/arthur-dependency-gate.

Proof route:

1. By ML.4/gsp4-arthur-classification, π falls into one of the classes (b)–(f).
2. In each class the transfer is an isobaric sum of Hecke characters and cuspidal GL₂ representations (possibly twisted by |·|^{±1/2}), all regular algebraic or algebraic by the archimedean condition; take the sum of their Galois representations (class field theory; AutomorphicGaloisRepresentations for Hilbert modular forms).
3. In class (b) the GL₂ constituents have central character ω_π (BCGP print µ_π: recorded as a source issue).

Direct prerequisites: [ML.4/gsp4-arthur-classification](#target-gsp4-arthur-classification), [ML.0/gsp4-galois-l-packet](#target-gsp4-galois-l-packet), `AutomorphicGaloisRepresentations:R19.2`.

Acceptance controls:

- Check case (b): a Yoshida lift has ρ_{π,p} = ρ_{μ₁,p} ⊕ ρ_{μ₂,p}.

Sources: [George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Lemma 2.9.1, §2.9, p. 38 (arXiv v3); [Vincent Pilloni, Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §5.1.7, paragraph after Remark 5.1.7.1, p. 23 (author version 17 June 2019).

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-unitary-descent-of-gl4-transfer"></a>

### Descent of the GL₄ transfer of a Siegel form to a unitary group, and the symplectic sign

Target `ML.4/unitary-descent-of-gl4-transfer`; theorem. Proposed declaration: `TauCeti.Arthur.GSp4.symplectic_of_unitaryDescent`.

Calegari–Geraghty Lemma6.9 concludes that the Galois realization of a general-type cuspidal Siegel eigenform has the requisite symplectic pairing, hence its absolutely irreducible residual realization has a symplectic pairing. In making the unitary-descent argument explicit, do not infer conjugate self-duality of BC_K(π) merely from essential self-duality π≅π^∨⊗ω. One must supply the algebraic normalization/twist giving the correct conjugate-self-dual unitary parameter, a CM restriction preserving absolute irreducibility, the exact descent theorem, and transport of the Bellaïche–Chenevier pairing back through these operations. Those inputs are still a blueprint proof gap; E10 is rejected as an established error of the source.

Hypotheses:

- f of general type; K imaginary quadratic with r_f|_{G_K} absolutely irreducible.
- Conditional on ML.0/arthur-dependency-gate (the transfer and Mok's descent).

Proof route:

1. Obtain the GL₄ transfer with its multiplier and all local conventions.
2. Choose a CM restriction preserving absolute irreducibility and the appropriate algebraic normalization/twist before invoking conjugate-self-dual unitary descent. An untwisted essential self-duality identity is insufficient.
3. Apply the exact unitary realization and Bellaïche–Chenevier sign theorem, then transport the pairing back. The twist/descent/restriction compatibility is not established by the current supplier signatures.

Direct prerequisites: [ML.4/gsp4-arthur-classification](#target-gsp4-arthur-classification), [ML.4/mok-unitary-classification](#target-mok-unitary-classification), `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `AutomorphicGaloisRepresentationsPartII:AG2.2`.

Acceptance controls:

- The conclusion used by CG: r̄_m symplectic when absolutely irreducible.

Sources: [Frank Calegari, David Geraghty, Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](http://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Lemma 6.9, §6.2, publ. p. 840 (copy p. 40); arXiv v1 p. 30.

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-gsp4-gl4-archimedean-transfer"></a>

### Infinitesimal character of the transfer of π_∞ from GSp₄(ℝ) to GL₄(ℝ) (Calegari–Geraghty Theorem 5.6)

Target `ML.4/gsp4-gl4-archimedean-transfer`; theorem. Proposed declaration: `TauCeti.Arthur.GSp4.transfer_infinitesimalCharacter`.

Let µ = (a, b; c) be a dominant weight, w = −(a + b + 2c), and π = π^∞ ⊗ π_∞ a discrete automorphic representation of GSp₄(𝔸_ℚ) contributing to the coherent cohomology H^i(X, W_µ)_(2). Then (1) π_∞ has infinitesimal character χ_{(a−1, b−2; −w)}; (2) the transfer π̃_∞ of π_∞ to GL₄(ℝ) (the archimedean parameter composed with the spin embedding GSp₄(ℂ) ⊂ GL₄(ℂ)) has infinitesimal character χ_τ with τ = ((a+b−3−w)/2, (a−b+1−w)/2, (−a+b−1−w)/2, (−a−b+3−w)/2); (3) if π_∞ is tempered it is the (limit of) discrete series π((a−1, b−2; −w), C_i) for a chamber C_i.

Hypotheses:

- F = ℚ; Calegari–Geraghty's normalisation of weights and of coherent cohomology (§5.3).

Proof route:

1. (1) from the (𝔭, K)-cohomology computation of π_∞ ⊗ V_σ (Harris; CG §5.3).
2. (2) the weights of the spin representation: with (λ₁, λ₂; λ₀) = (a−1, b−2; −w), τ = ((λ₁+λ₂+λ₀)/2, (λ₁−λ₂+λ₀)/2, (−λ₁+λ₂+λ₀)/2, (−λ₁−λ₂+λ₀)/2) (Sorensen §2.1.2).
3. (3) tempered representations with regular-or-singular integral infinitesimal character are (limits of) discrete series.

Direct prerequisites: [ML.0/archimedean-langlands-conventions](#target-archimedean-langlands-conventions), [ML.4/gsp4-archimedean-limit-packets](#target-gsp4-archimedean-limit-packets), `AutomorphicFormsOnReductiveGroups:AF.1/discrete-series`.

Acceptance controls:

- CG Remark 5.12: for µ = (a, b), w = a + b − 6, τ = (0, −(b−2), −(a−1), −(a+b−3)) + (3/2)(1, 1, 1, 1), consistent with (2).

Sources: [Frank Calegari, David Geraghty, Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](http://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Theorem 5.6(2), §5.3, publ. p. 829; quoted from arXiv v1 p. 22 — independently checked downloaded PDF p.29; published-copy pagination where applicable; [Frank Calegari, David Geraghty, Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](http://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Theorem 5.6, publ. p. 829 (copy p. 29).

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-limit-discrete-series-packet-types"></a>

### Global packets with a holomorphic limit of discrete series at infinity are of general, Yoshida or Saito–Kurokawa type

Target `ML.4/limit-discrete-series-packet-types`; theorem. Proposed declaration: `TauCeti.Arthur.GSp4.generalType_of_limitDiscreteSeries`.

Let π = π_f ⊗ π(λ)^h be a discrete automorphic representation of GSp₄(𝔸_ℚ) with λ = (λ₁, 0; c), λ₁ < 0. Then its global Arthur packet is of general, Yoshida or Saito–Kurokawa type (Schmidt 2018, §§1.1–1.2, compared with the archimedean parameters of π(λ)^h in Schmidt 2017). If moreover the Hecke eigensystem of π_f is congruent to a non-Eisenstein maximal ideal (residual Galois representation irreducible), the packet is of general type, and then π_f ⊗ π(λ)^h is automorphic iff π_f ⊗ π(λ)^g is, both with multiplicity one (Pilloni, Proposition 15.2.4.1).

Hypotheses:

- F = ℚ; λ₁ < 0; conditional on ML.0/arthur-dependency-gate.

Proof route:

1. Compare the archimedean parameter of π(λ)^h with the archimedean components allowed in each of Arthur's six types (Schmidt's tables).
2. Yoshida and Saito–Kurokawa types give reducible Galois representations (ML.4/non-general-type-reducible), contradicting irreducibility of the residual representation.
3. For general type: ML.4/gsp4-archimedean-limit-packets and parts (ii)–(iii) of ML.4/gsp4-arthur-classification. Pilloni's 'hence Π is stable and tempered' overstates Arthur (temperedness needs Ramanujan); what is used is that ψ is trivial on SL₂ (recorded as a source issue).

Direct prerequisites: [ML.4/gsp4-archimedean-limit-packets](#target-gsp4-archimedean-limit-packets), [ML.4/non-general-type-reducible](#target-non-general-type-reducible), [ML.4/gsp4-arthur-classification](#target-gsp4-arthur-classification).

Acceptance controls:

- Calegari–Geraghty's proof of Theorem 7.11 excludes classes (b)–(f) by the same reducibility argument in weight (a, 2).

Sources: [Vincent Pilloni, Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §15.2.4, proof of Proposition 15.2.4.1, p. 109 (author version); [Vincent Pilloni, Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §15.2.4, proof of Proposition 15.2.4.1, p. 109 (author version).

Suggested signature: omitted until C-ARTHUR, C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

### ML.4 acceptance and supplier refinements

Check every target at the displayed hypotheses and source scope, every definition against its negative controls, and every direct prerequisite against the exact export. The target-level chains end in a baseline declaration, a checked external node, a requested supplier stage or the named gaps below.

- Construct the endoscopic classification Part II’s exact weighted/twisted transfer, stabilization and local intertwining inputs, retaining explicit unproved hypotheses and packet multiplicities.
- Obtain C-ARTHUR/C-GALOIS carriers; supply KMSW nongeneric local hypotheses, full theta/real-packet and Xu extensions at exact scope. Supply the full AJ87 parameter conditions; the necessary consequences in AMR §8.1 do not define that domain.
- Finish GL₄ unitary descent with its normalization/pairing dictionary and the abelian-surface application; replace the omitted signatures.

## Layer ML.5: Known functorial transfers and frontiers

Register known base change, induction, generic transfers and descents at their exact input domains. State strong Artin, global reciprocity, general functoriality and categorical local Langlands as separate assertions. The known integral torus categorical theorem does not establish the general reductive-group conjecture.

Atlas planets: Generic transfer from classical groups to GL_N; Automorphic descent (Ginzburg–Rallis–Soudry); Langlands functoriality; Categorical local Langlands conjecture.

<a id="target-cyclic-base-change-gln"></a>

### Cyclic and soluble base change and descent for GL_n, as used by the endpoints

Target `ML.5/cyclic-base-change-gln`; comparison. Proposed declaration: `TauCeti.Functoriality.solubleBaseChange`.

(Arthur–Clozel) Let L/F be a cyclic extension of number fields of prime degree and π a cuspidal automorphic representation of GL_n(𝔸_F). There is an isobaric automorphic representation BC_{L/F}(π) of GL_n(𝔸_L) with rec(BC_{L/F}(π)_w) ≅ rec(π_v)|_{W_{L_w}} for every place w | v; it is cuspidal unless π ≅ π ⊗ η for a non-trivial character η of 𝔸_F^×/F^×N_{L/F}𝔸_L^×; and a cuspidal Π of GL_n(𝔸_L) with Π ≅ Π^σ for Gal(L/F) = ⟨σ⟩ is a base change. Iterating along a soluble Galois tower L/F: for π regular algebraic cuspidal with BC_{L/F}(π) cuspidal, BC_{L/F}(π) is regular algebraic; and (soluble descent) if r : G_F → GL_n(Q̄_p) is irreducible, r|_{G_L} is irreducible and automorphic for a soluble Galois L/F, then r is automorphic. For n = 2 the owner is GL2AutomorphicRepresentationsAndTransfer R17.4.

Hypotheses:

- L/F soluble Galois (cyclic of prime degree at each step) of number fields.
- The Galois automorphy-descent clause uses the CM/totally-real polarized setting and irreducibility of the restriction in PL.0/soluble-descent; it is not a theorem for arbitrary G_F with the restricted NT automorphy predicate.

Proof route:

1. Arthur–Clozel 1989, Theorems 3.4.2 and 3.5.1 (cyclic base change and descent), through EndoscopicTransferAndUnitaryTraceComparison ET.7a.
2. Soluble descent: induction along the tower using strong multiplicity one and Chebotarev (BLGGT Lemma 2.2.2; owner PotentialAutomorphyInfrastructurePartII PL.0/soluble-descent).
3. Newton–Thorne 2026 §1.2 quote base change in the form above (with misprints recorded as source issues).

Direct prerequisites: `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent`, [Chebotarev](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev), `AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`.

Acceptance controls:

- Newton–Thorne 2026 use it in the proofs of Lemma 3.1, Theorem 3.2 and Proposition 6.1; BCGNT in Proposition 6.2.3.

Sources: [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §1.2, p. 8 (arXiv:2212.03595v2); [James Newton and Jack A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), §3, end of proof of Theorem 3.2, p. 25 (arXiv:2212.03595v2).

Suggested signature: omitted until C-AUTOMORPHIC, C-GALOIS supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-ckpss-generic-transfer"></a>

### Generic transfer from split classical groups to GL_N and its image (Cogdell–Kim–Piatetski-Shapiro–Shahidi; Ginzburg–Rallis–Soudry)

Target `ML.5/ckpss-generic-transfer`; theorem. Proposed declaration: `TauCeti.Functoriality.ckpss`.

Let k be a number field, G_n = SO_{2n+1}, SO_{2n} (n ≥ 2) or Sp_{2n} split over k, and N = 2n, 2n, 2n + 1. Every globally generic cuspidal automorphic representation π of G_n(𝔸) has a functorial lift Π to GL_N(𝔸) (local lift at every archimedean place and at almost all unramified finite places). For G_n = SO_{2n+1}: Π = Π₁ ⊞ ⋯ ⊞ Π_d with Π_i pairwise non-isomorphic unitary self-dual cuspidal representations of GL_{N_i}(𝔸) such that L^T(s, Π_i, ∧²) has a pole at s = 1 (symplectic type), and conversely every such Π is the lift of some π; for Sp_{2n} (resp. SO_{2n}) the same holds with L^T(s, Π_i, Sym²) having a pole at s = 1 (orthogonal type) and trivial central character of the total lift Π (not necessarily of each Π_i) (CKPSS Theorems 7.1, 7.2, the image being Ginzburg–Rallis–Soudry's).

Hypotheses:

- k a number field; G_n split; π globally generic cuspidal (with respect to a fixed splitting).

Proof route:

1. CKPSS: Langlands–Shahidi L-functions of G_n × GL_m and the converse theorem for GL_N.
2. Image: Ginzburg–Rallis–Soudry's descent (ML.5/grs-descent).
3. Arthur remarks that the generic cases of his seed theorems follow from CKPSS and GRS, though he does not use them.

Direct prerequisites: [ML.3/functorial-lift](#target-functorial-lift), [ML.4/self-dual-cuspidal-type](#target-self-dual-cuspidal-type), `AutomorphicLFunctionsAndLocalFactors:AL.4`.

Acceptance controls:

- Boxer–Calegari–Gee Remark 2.5 apply Theorem 7.2 to self-dual level-one cuspidal π of GL₁₀₅ to get a globally generic cuspidal representation of Sp₁₀₄/ℚ; 'level one' needs a local input CKPSS does not give (recorded as a source issue in their extraction, E8).

Sources: [J. W. Cogdell, H. H. Kim, I. I. Piatetski-Shapiro, F. Shahidi, Functoriality for the classical groups](http://www.numdam.org/item/PMIHES_2004__99__163_0.pdf), Theorem 1.1, §1, p. 169 (Publ. Math. IHÉS 99); [J. W. Cogdell, H. H. Kim, I. I. Piatetski-Shapiro, F. Shahidi, Functoriality for the classical groups](http://www.numdam.org/item/PMIHES_2004__99__163_0.pdf), Theorem 7.1, §7.1, p. 195 (Publ. Math. IHÉS 99); [George Boxer, Frank Calegari, Toby Gee, Cuspidal cohomology classes for GL_n(Z)](https://arxiv.org/pdf/2309.15944v3), Remark 2.5, §2, p. 8 (arXiv:2309.15944v3); journal p. 515; [J. W. Cogdell, H. H. Kim, I. I. Piatetski-Shapiro, F. Shahidi, Functoriality for the classical groups](http://www.numdam.org/item/PMIHES_2004__99__163_0.pdf), Theorem 7.2, PDF p.34 (printed p.196).

Suggested signature: omitted until C-AUTOMORPHIC, C-GALOIS supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-automorphic-induction-register"></a>

### Register of automorphic induction and base change: owners and exact hypotheses

Target `ML.5/automorphic-induction-register`; comparison. Proposed declaration: `TauCeti.Functoriality.knownTransfers`.

Registers, with their owners and hypotheses, the transfers this roadmap's endpoints use but does not plan: automorphic induction AI_{L/F} from GL_m(𝔸_L) to GL_{md}(𝔸_F) for cyclic L/F of degree d (Arthur–Clozel; owner EndoscopicTransferAndUnitaryTraceComparison ET.7a) with the cuspidality criterion (AI(π) cuspidal iff π has full Galois orbit, i.e. π is not isomorphic to π^σ for any nonidentity σ∈Gal(L/F)); the rank-two monomial case and Langlands–Tunnell's soluble Artin modularity (owner GL2AutomorphicRepresentationsAndTransfer R17.5, by the accepted restructuring RS-21); GL₂ cyclic and soluble base change (owner R17.4, RS-21); and GL_n cyclic base change (ML.5/cyclic-base-change-gln, resting on ET.7a). No general functorial transfer is inferred from these cases.

Hypotheses:

- Registry node.

Proof route:

1. Each entry cites its owner stage; the requests of this packet carry the exact statements needed.

Direct prerequisites: `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `GL2AutomorphicRepresentationsAndTransfer:R17.5`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent`, [ML.5/cyclic-base-change-gln](#target-cyclic-base-change-gln), [ML.0/endpoint-status-register](#target-endpoint-status-register).

Acceptance controls:

- The acceptance criterion of ML.5: every known transfer is registered with exact hypotheses and owner.

Sources: [James Arthur, The principle of functoriality](https://www.ams.org/journals/bull/2003-40-01/S0273-0979-02-00963-1/S0273-0979-02-00963-1.pdf), §4, Conjecture (Langlands [L1]) for G′ = {1}, p. 45 (Bull. AMS 40 (2003)).

Suggested signature: omitted until C-AUTOMORPHIC, C-GALOIS supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-functoriality-conjecture"></a>

### Langlands' principle of functoriality (frontier statement)

Target `ML.5/functoriality-conjecture`; definition. Proposed declaration: `TauCeti.Functoriality.Functoriality`.

Let F be a global field, G, G′ connected reductive groups over F with G quasi-split, and ρ : ᴸG′ → ᴸG an L-homomorphism (compatible with the projections to the Galois group). Functoriality(G′, G, ρ) is the proposition: for every automorphic representation π′ of G′(𝔸_F) there is an automorphic representation π of G(𝔸_F) with c_v(π) = ρ(c_v(π′)) (Satake parameters) for all places v outside a finite set where π and π′ are unramified. The refined form asks local compatibility through local Langlands at every place. The statement is a conjecture; this roadmap uses it only as a named hypothesis of conditional implications, and its known cases are the theorem nodes of ML.5.

Hypotheses:

- G quasi-split; ρ an L-homomorphism; frontier statement with status conjectural in ML.0/endpoint-status-register.

Proof route:

1. Definition of the proposition; no proof.

Direct prerequisites: [ML.3/functorial-lift](#target-functorial-lift), [ML.0/endpoint-status-register](#target-endpoint-status-register), [ReductiveGroups](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-6-reductive-and-semisimple-groups).

Consumers:

- [ML.5/symmetric-power-functoriality-implies-ramanujan](#target-symmetric-power-functoriality-implies-ramanujan): the hypothesis of the conditional implication
- `Newton–Thorne 2021, §1`: symmetric power functoriality is a special case
- [ML.0/endpoint-status-register](#target-endpoint-status-register): registered as conjectural

Planning API:

- `TauCeti.Functoriality.Functoriality` — The proposition Functoriality(G′, G, ρ).
- `TauCeti.Functoriality.Functoriality.comp` — Functoriality(G′, G, ρ) and Functoriality(G, G″, ρ′) imply Functoriality(G′, G″, ρ′ ∘ ρ) (weak form).
- `TauCeti.Functoriality.Functoriality.id` — Functoriality(G, G, id) holds.
- `TauCeti.Functoriality.Functoriality.of_gelbartJacquet` — Gelbart–Jacquet supplies the cuspidal GL₂ case of the Sym² weak functoriality assertion. Extension to noncuspidal isobaric GL₂ inputs uses the direct-sum/Hecke-character transfer and automorphic isobaric assembly; it is not an extra assertion of the cuspidal theorem.
- `TauCeti.Functoriality.Functoriality.sym` — General symmetric-power functoriality for arbitrary cuspidal GL₂ representations remains a frontier assertion. ML.3 proves the specified regular algebraic, Hilbert discrete-series and monomial/weight-one cases, rather than this unrestricted assertion.

Definition tests:

- `TauCeti.Functoriality.functoriality_trivialGroup` (degenerate) — G′ = {1}, G = GL₁: Functoriality is the statement that the trivial character is automorphic (true).
- `TauCeti.Functoriality.functoriality_det` (computation) — G′ = GL_n, G = GL₁, ρ = det: Functoriality holds, the lift of π being ω_π.
- `TauCeti.Functoriality.functoriality_reciprocity` (characterisation) — For G′={1}, the domain L-group is W_F (with the finite quotient Gal(E/F) through which r factors), and the L-homomorphism is w↦(r(w),w). Weak functoriality asks almost-everywhere Artin matching. All-place compatibility is the separate strong refinement.
- `TauCeti.Functoriality.functoriality_not_from_parameters` (non-example) — For GL₁ the proposed map (z,w)↦(z,1) on ℂ^××W_F fails the projection-to-W_F condition. A map on dual-group parameters alone cannot be accepted as the L-homomorphism input of Functoriality.

Acceptance controls:

- A known instance (e.g. G′ = GL₂, G = GL₃, ρ = Sym²: ML.3/gelbart-jacquet) proves Functoriality for that triple only.

Sources: [James Arthur, The principle of functoriality](https://www.ams.org/journals/bull/2003-40-01/S0273-0979-02-00963-1/S0273-0979-02-00963-1.pdf), §4, Conjecture (Langlands [L1]), pp. 44–45 (Bull. AMS 40 (2003)).

Suggested signature: omitted until C-AUTOMORPHIC supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-grs-descent"></a>

### Automorphic descent of Ginzburg–Rallis–Soudry (with Jiang–Soudry's irreducibility)

Target `ML.5/grs-descent`; theorem. Proposed declaration: `TauCeti.Functoriality.grsDescent`.

Let F be a number field and φ = τ₁ ⊞ ⋯ ⊞ τ_r a generic global parameter for the split group SO_{2n+1}: τ_i pairwise non-isomorphic unitary self-dual cuspidal representations of GL_{n_i}(𝔸_F) of symplectic type, Σ n_i = 2n. The automorphic descent (a Fourier–Jacobi or Bessel coefficient of the residual Eisenstein representation E_τ with parameter (τ₁, 2) ⊞ ⋯ ⊞ (τ_r, 2)) is a non-zero cuspidal globally generic automorphic representation π₀ of SO_{2n+1}(𝔸_F) whose functorial lift to GL_{2n} is τ₁ ⊞ ⋯ ⊞ τ_r; it is irreducible (Jiang–Soudry) and is the generic member of the global packet Π̃_φ. The analogous descents for the other quasi-split classical groups give non-zero cuspidal generic representations whose structure depends on the uniqueness of local Bessel models over Vogan packets.

Hypotheses:

- F a number field; φ generic for split SO_{2n+1}.

Proof route:

1. Ginzburg–Rallis–Soudry (2011 monograph): non-vanishing and cuspidality of the descent via unfolding of Fourier–Jacobi coefficients of residual Eisenstein series.
2. Jiang–Soudry (Ann. of Math. 2003): irreducibility for SO_{2n+1} via the local converse theorem.
3. Jiang–Zhang record the general structure, with the correction their extraction lists (E21).

Direct prerequisites: [ML.4/global-arthur-parameter](#target-global-arthur-parameter), [ML.5/ckpss-generic-transfer](#target-ckpss-generic-transfer), `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`.

Acceptance controls:

- The descent inverts ML.5/ckpss-generic-transfer on its image.

Sources: [Dihua Jiang, Lei Zhang, Arthur parameters and cuspidal automorphic modules of classical groups](https://arxiv.org/pdf/1508.03205v4), §1.1, p. 6 (arXiv v4); published p. 744; [Dihua Jiang, Lei Zhang, Arthur parameters and cuspidal automorphic modules of classical groups](https://arxiv.org/pdf/1508.03205v4), §7.2, p. 75 (arXiv v4); published p. 809.

Suggested signature: omitted until C-AUTOMORPHIC, C-GALOIS supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-local-descent-mp2n"></a>

### Local descent to Mp_{2n} and globalisation of square-integrable representations of GL_{2n} (Gan–Ichino Appendix A)

Target `ML.5/local-descent-mp2n`; theorem. Proposed declaration: `TauCeti.Functoriality.localDescent_mp`.

(Local descent) For F_v local and τ_v an irreducible square-integrable representation of GL_{2n}(F_v) with L(s, τ_v, ∧²) having a pole at s = 0, the descent π_v of τ_v to Mp_{2n}(F_v) relative to ψ_v (Ginzburg–Rallis–Soudry; Ichino–Lapid–Mao Theorem 3.1) is irreducible, genuine, ψ_v-generic and square-integrable. (Proposition A.1) Given a number field F, a non-empty finite set S of non-archimedean places, v₀ ∉ S non-archimedean and such τ_v for v ∈ S ∪ {v₀} with τ_{v₀} supercuspidal, there is an irreducible cuspidal T on GL_{2n}(𝔸_F) with T_v = τ_v there, T_v principal series at the other finite places outside S_∞, L(s, T, ∧²) having a pole at s = 1 and L(1/2, T) ≠ 0.

Hypotheses:

- As stated; Gan–Ichino's Proposition A.2 needs θ_{ψ_{v₀}}(π_{v₀}) supercuspidal (their extraction's E7).

Proof route:

1. Descend τ_v locally, globalise the generic square-integrable genuine representations of Mp_{2n} (Gan–Ichino Proposition A.2), lift through the theta correspondence to SO_{2n+1} and then by ML.5/ckpss-generic-transfer to GL_{2n}.
2. Ichino–Lapid–Mao Proposition 4.3/4.6 give T_v = τ_v.

Direct prerequisites: [ML.5/ckpss-generic-transfer](#target-ckpss-generic-transfer), `MetaplecticAutomorphicForms:MP.3`.

Acceptance controls:

- Used by Gan–Ichino to produce cuspidal T with non-vanishing central value for their Theorem 1.4.

Sources: [Wee Teck Gan, Atsushi Ichino, The Shimura–Waldspurger correspondence for Mp_2n](https://arxiv.org/pdf/1705.10106v3), Appendix A, proof of Proposition A.1, pp. 29–30 (arXiv v3); published pp. 1001–1002; [Wee Teck Gan, Atsushi Ichino, The Shimura–Waldspurger correspondence for Mp_2n](https://arxiv.org/pdf/1705.10106v3), Appendix A, proof of Proposition A.1, p. 30 (arXiv v3); published p. 1002.

Suggested signature: omitted until C-AUTOMORPHIC, C-GALOIS supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-local-langlands-conjecture-general"></a>

### The local Langlands conjecture for a general reductive group (frontier statement)

Target `ML.5/local-langlands-conjecture-general`; definition. Proposed declaration: `TauCeti.Functoriality.LocalLanglands`.

LLC(G, F_v) is the proposition: for G quasi-split over a local field F_v there is a surjective finite-to-one map π ↦ φ_π from irreducible admissible smooth representations of G(F_v) in the nonarchimedean case, and irreducible admissible (𝔤,K)-modules in the archimedean case to Ĝ-conjugacy classes of L-parameters φ : L_{F_v} → ᴸG (L_{F_v} = W_{F_v} archimedean, W_{F_v} × SU(2) non-archimedean), compatible with central characters, twisting, parabolic induction and the L- and ε-factors wherever the relevant local-factor theory is supplied, bijective for GL_n. Known: archimedean F_v (Langlands); GL_n (Harris–Taylor, Henniart, Scholze); quasi-split classical groups (ML.4/local-arthur-packets, conditionally); GSp₄ (ML.4/gan-takeda-llc-gsp4).

Hypotheses:

- Frontier statement; status conjectural except in the listed cases.
- Known GL_n finite-place exports are for characteristic-zero local fields in ET.6. General residual/archimedean fields need their own stated source scope; the GSp₄ factor characterization distinguishes generic and nongeneric supercuspidal representations.

Proof route:

1. Definition of the proposition.

Direct prerequisites: [ML.4/extended-langlands-parameter](#target-extended-langlands-parameter), [ML.0/endpoint-status-register](#target-endpoint-status-register), [ReductiveGroups](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-6-reductive-and-semisimple-groups), `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Consumers:

- [ML.4/local-arthur-packets](#target-local-arthur-packets): the classical-group case
- [ML.4/gan-takeda-llc-gsp4](#target-gan-takeda-llc-gsp4): the GSp₄ case

Planning API:

- `TauCeti.Functoriality.LocalLanglands` — The proposition LLC(G, F_v).
- `TauCeti.Functoriality.LocalLanglands.gl` — LLC for GL_n over characteristic-zero nonarchimedean local fields is the ET.6 export (Harris–Taylor, Henniart); other field scopes require their own separately checked export.
- `TauCeti.Functoriality.LocalLanglands.archimedean` — LLC(G, ℝ) holds (Langlands).
- `TauCeti.Functoriality.LocalLanglands.gsp4` — LLC for GSp₄ over characteristic-zero nonarchimedean local fields is Gan–Takeda’s correspondence with its exact generic, nongeneric and Plancherel characterization.

Definition tests:

- `TauCeti.Functoriality.llc_torus` (degenerate) — G = GL₁: LLC is local class field theory (Hom(F_v^×, ℂ^×) ≅ Hom(W_{F_v}, ℂ^×)).
- `TauCeti.Functoriality.llc_sl2_not_injective` (non-example) — For G = SL₂ the map is not injective: L-packets of size 2 and 4 occur (ML.4/extended-langlands-parameter).
- `TauCeti.Functoriality.llc_gl2_unramified` (computation) — For GL₂ and an unramified principal series χ₁ × χ₂, φ = χ₁ ⊕ χ₂ through Art^{−1}.

Acceptance controls:

- A semisimple parametrisation π ↦ φ_π^{ss} (Fargues–Scholze) is weaker and does not prove LLC(G, F_v).

Sources: [James Arthur, The principle of functoriality](https://www.ams.org/journals/bull/2003-40-01/S0273-0979-02-00963-1/S0273-0979-02-00963-1.pdf), §5, p. 47 (Bull. AMS 40 (2003)).

Suggested signature: omitted until C-AUTOMORPHIC, C-GALOIS supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-categorical-local-langlands-conjecture"></a>

### The categorical local Langlands conjecture of Fargues–Scholze (frontier statement)

Target `ML.5/categorical-local-langlands-conjecture`; definition. Proposed declaration: `TauCeti.Functoriality.CategoricalLLC`.

Fargues–Scholze Conjecture I.10.2. Let E be a nonarchimedean local field with residue characteristic p and cardinality q, ℓ≠p, and G quasi-split. Choose a Borel B, a generic character ψ:U(E)→O_L^× for an algebraic L/ℚ_ℓ, and √q∈O_L. If d=|π₀Z(G)|, put Λ=O_L[1/d]. Let W_ψ on the neutral stratum Bun_G^1 be the sheaf of c-Ind_{U(E)}^{G(E)}ψ. Extend the spectral action on W_ψ by colimits to Φ:Ind Perf^{qc}(Z¹(W_E,Ĝ)_Λ/Ĝ)→D_lis(Bun_G,Λ). Its canonical right adjoint is fully faithful on compact objects and induces the Perf(Z¹(W_E,Ĝ)_Λ/Ĝ)-linear equivalence D_lis(Bun_G,Λ)^ω≃D_coh,Nilp^{b,qc}(Z¹(W_E,Ĝ)_Λ/Ĝ). The target consists of bounded complexes with coherent cohomology, quasicompact support and nilpotent singular support. This is a conjecture about stable ∞-categories and a specified adjunction. The established semisimple parameter map does not supply it. The torus case is known in Zou Theorem 6.4.1 over ℤ_ℓ (ℓ≠p), using the canonical action on the unique Whittaker sheaf; Theorem 6.4.5 proves t-exactness and Remark 6.4.7 gives scalar extension. For tori the square-root choice is unnecessary. This known specialization does not settle the assertion for a general quasi-split group.

Hypotheses:

- Exactly the field, group, Whittaker, square-root and coefficient conditions in the statement. Inverting d is necessary for the spectral action constructed in the cited edition.

Proof route:

1. Definition of the proposition as stated by Fargues–Scholze, Conjecture I.10.2; the objects are owned by the geometrisation roadmaps.

Direct prerequisites: [ML.5/local-langlands-conjecture-general](#target-local-langlands-conjecture-general), `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, [ML.0/endpoint-status-register](#target-endpoint-status-register).

Consumers:

- `Fargues–Scholze 2021, §I.10`: the categorical form of local Langlands
- [ML.0/endpoint-status-register](#target-endpoint-status-register): registered as conjectural

Planning API:

- `TauCeti.Functoriality.CategoricalLLC` — The canonical Whittaker spectral-action right adjoint induces the compact/coherent equivalence with the stated singular-support and coefficient conditions.
- `TauCeti.Functoriality.CategoricalLLC.implies_semisimple` — CatLLC is compatible with the semisimple parametrisation of Fargues–Scholze (part of the statement).
- `TauCeti.Functoriality.CategoricalLLC.torus` — Zou Theorem 6.4.1: for any E-torus T and ℓ≠p, the canonical Whittaker spectral-action functor identifies the bounded coherent quasicompact nilpotent-support side with compact D_lis(Bun_T,ℤ_ℓ). It is t-exact (6.4.5), extends by scalars (6.4.7), and needs no √q.

Definition tests:

- `TauCeti.Functoriality.catLLC_gl1` (degenerate) — For GL₁, Bun strata are indexed by ℤ. The canonical equivalence identifies a compact complex on a fixed degree stratum with a perfect complex on the corresponding character-gerbe weight piece; the parameter and Bernstein-center actions agree with local class field theory.
- `TauCeti.Functoriality.catLLC_not_from_ss` (non-example) — For GL₂, the Weil–Deligne data with r=|·|^{1/2}⊕|·|^{−1/2} and N=0 or N of rank one have the same semisimple Weil part and different monodromy. The categorical parameter/support interface must distinguish these points; the semisimple assignment alone cannot supply that distinction.
- `TauCeti.Functoriality.catLLC_whittaker` (characterisation) — After Ind-completion or restriction to a connected component, the structure sheaf is sent to the Whittaker sheaf by Φ. Neither global sheaf is falsely required to have quasicompact support on all components.

Acceptance controls:

- No instance of LLC(G, E) or of Functoriality is inferred from it in this roadmap (acceptance of ML.5).

Sources: [Laurent Fargues, Peter Scholze, Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v4), §I.10, Conjecture I.10.2, p. 38 (arXiv:2102.13459v4); [Konrad Zou, The categorical form of Fargues’ conjecture for tori](https://arxiv.org/pdf/2202.13238v2), Theorems 6.4.1, 6.4.5 and Remark 6.4.7, pp. 25–27.

Suggested signature: omitted until C-CATEGORICAL supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-global-langlands-reciprocity-conjecture"></a>

### Global Langlands reciprocity for GL_n (frontier statement)

Target `ML.5/global-langlands-reciprocity-conjecture`; definition. Proposed declaration: `TauCeti.Functoriality.Reciprocity`.

Reciprocity(F,n) is the strong Artin assertion: every continuous irreducible finite-image r:G_F→GL_n(ℂ) has a cuspidal π of GL_n(𝔸_F) whose local parameter at EVERY place matches r|_{W_{F_v}}. The weak assertion of almost-everywhere Satake matching is recorded separately and does not, by uniqueness alone, supply the bad factors. For nontrivial r the strong assertion implies entireness of its full Artin L-function; the trivial rank-one representation has the Dedekind-zeta pole. Its regular geometric ℓ-adic refinement is a separate frontier conjecture. Known cases used here: rank one through class field theory; the odd rank-two ℚ case through Langlands–Tunnell and Khare–Wintenberger; totally odd finite-image rank two over totally real fields through Pilloni–Stroh.

Hypotheses:

- Frontier statement; status conjectural in ML.0/endpoint-status-register.

Proof route:

1. Definition of the proposition; the known cases are theorem nodes of ML.1 and the GL₂ roadmap.

Direct prerequisites: [ML.5/functoriality-conjecture](#target-functoriality-conjecture), [ML.1/strong-artin-conjecture](#target-strong-artin-conjecture), [ML.0/endpoint-status-register](#target-endpoint-status-register).

Consumers:

- [ML.1/odd-artin-modularity-over-q](#target-odd-artin-modularity-over-q): the proved case n = 2, odd, over ℚ
- [ML.0/nt26-automorphy-predicate](#target-nt26-automorphy-predicate): the automorphy predicate is the ℓ-adic matching

Planning API:

- `TauCeti.Functoriality.Reciprocity` — The proposition Reciprocity(F, n).
- `TauCeti.Functoriality.Reciprocity.one` — Reciprocity(F, 1) holds (class field theory).
- `TauCeti.Functoriality.Reciprocity.of_functoriality` — The refined functoriality assertion for finite-image irreducible r, including all-place local compatibility and a cuspidal lift, implies the strong Reciprocity assertion. Weak matching alone is a distinct conclusion.
- `TauCeti.Functoriality.Reciprocity.implies_artin` — Strong Reciprocity for a NONTRIVIAL irreducible finite-image r implies entireness of the full Artin L-function by Godement–Jacquet. For r=1 the corresponding function is Dedekind zeta and has a pole.

Definition tests:

- `TauCeti.Functoriality.reciprocity_gl1` (degenerate) — n = 1: Reciprocity(F, 1) is Artin reciprocity.
- `TauCeti.Functoriality.reciprocity_dihedral` (computation) — For K/ℚ quadratic and a finite-order character χ of G_K with χ≠χ^c, the irreducible Ind_{G_K}^{G_ℚ}χ corresponds to the cuspidal automorphic induction of the associated Hecke character.
- `TauCeti.Functoriality.reciprocity_reducible_not_cuspidal` (non-example) — For reducible r = χ₁ ⊕ χ₂ the matching π is the isobaric χ₁ ⊞ χ₂, not cuspidal: irreducibility is needed.

Acceptance controls:

- Every 'automorphic' predicate of ML.0 (BLGGT, Newton–Thorne) is an instance of the matching it asks for.

Sources: [James Arthur, The principle of functoriality](https://www.ams.org/journals/bull/2003-40-01/S0273-0979-02-00963-1/S0273-0979-02-00963-1.pdf), §4, Conjecture (Langlands [L1]) for G′ = {1}, p. 45 (Bull. AMS 40 (2003)).

Suggested signature: omitted until C-ARTIN supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

<a id="target-symmetric-power-functoriality-implies-ramanujan"></a>

### Symmetric power functoriality implies the Ramanujan bound (Langlands' argument)

Target `ML.5/symmetric-power-functoriality-implies-ramanujan`; theorem. Proposed declaration: `TauCeti.Functoriality.ramanujan_of_symPower`.

Let π be a unitary cuspidal automorphic representation of GL₂(𝔸_F). If for every n ≥ 1 the lifts Symⁿπ and Symⁿπ^∨ have compatible unitary cuspidal realizations, or isobaric realizations all of whose cuspidal constituents are unitary (it suffices to have such realizations over finite extensions of F), then π_v is tempered at every place v where π is unramified (Ramanujan): from the Rankin–Selberg L-functions L(s, Symⁿπ × Symⁿπ^∨) and the Jacquet–Shalika bound |α| < q_v^{1/2} for the Satake parameters of unitary cuspidal representations of GL_{n+1} one gets |α_v|^n < q_v^{1/2} for all n, hence |α_v| = 1.

Hypotheses:

- π unitary cuspidal on GL₂. For unbounded positive n, Sym^nπ has a compatible unitary cuspidal realization, or an isobaric realization whose constituents are all unitary cuspidal; the potential version has such realizations over finite extensions. Arbitrary nonunitary isobaric automorphy alone is insufficient for the Satake bound.

Proof route:

1. Apply the Jacquet–Shalika bound to unitary cuspidal constituents, with the actual unramified local symmetric-power compatibility. This bounds |α_v|^n by q_v^{1/2} for unbounded n.
2. For a place w|v of residue degree f in a potential field, the parameters become α_v^f and the norm becomes q_v^f; cancel f from |α_v|^{fn}<q_v^{f/2}. Base change does not preserve raw absolute values.
3. Apply the same estimate to both Satake parameters (or to the dual) and use unitarity of the determinant to conclude |α_v|=1.

Direct prerequisites: [ML.5/functoriality-conjecture](#target-functoriality-conjecture), [ML.3/symmetric-power-lifting](#target-symmetric-power-lifting), `AutomorphicLFunctionsAndLocalFactors:AL.2/jacquet-shalika-satake-bound`, [ML.5/cyclic-base-change-gln](#target-cyclic-base-change-gln).

Acceptance controls:

- ACC+ prove Ramanujan for weight-zero regular algebraic π over CM fields this way; BCGNT for Bianchi forms (ML.3).

Sources: [P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999), §1, paragraph after Theorem 1.0.2, p. 3 (arXiv:1812.09999v2); [P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999), §1, paragraph after Theorem 1.0.2, p. 3 (arXiv:1812.09999v2).

Suggested signature: omitted until C-AUTOMORPHIC, C-GALOIS supplies the actual objects and hypotheses. The mathematical target and its API/test specifications above remain required.

### ML.5 acceptance and supplier refinements

Check every target at the displayed hypotheses and source scope, every definition against its negative controls, and every direct prerequisite against the exact export. The target-level chains end in a baseline declaration, a checked external node, a requested supplier stage or the named gaps below.

- Obtain the refined all-place functorial/reciprocity and local factor interfaces, without upgrading weak matching by uniqueness.
- Obtain C-CATEGORICAL stable ∞-categories, parameter stack, Whittaker spectral action and canonical right adjoint, including the known integral torus specialization; replace the omitted categorical signature.

## Ownership and dependency restructuring

### Ownership contract 1

PA.4 already has ACC+ 6.1.1 and 6.1.2. Its ordinary node cites coarse ML.1 while the ML.1 imaginary-quadratic application consumes PA.4; the coarse edge is not an exact input.

Keep the existing PA.4 endpoints; add no PA.6 copy. Replace the PA.4 coarse ML.1 import by the exact lower-tier residual-modularity/descent exports used in its proof. Move any actual weight-one seed out as a named early supplier before ML.1 applications. Verify the PA fine dependency chain before updating the atlas edge. BCGNT 3.2.1 connects, Caraiani–Newton 1.3 potentially semistable and CG18 5.16 conditional branches are distinct extensions.

### Ownership contract 2

ML.4 records external conditional classifications; ET.3/ET.4 do not supply full weighted/twisted transfer or stabilization.

Construct EndoscopicTransferAndUnitaryTraceComparison, Part II: Endoscopic classification of classical groups. It owns exact weighted and twisted orbital-integral identities, full stabilization, local intertwining relations and classification proofs. ML.4 retains the conditional register and source-specific applications. The unproved twisted weighted lemma and KMSW nongeneric local inputs remain explicit external assumptions; no arbitrary proposition represents them in Lean.

### Ownership contract 3

Early low-rank transfers and ACC elliptic seeds previously caused later-layer references; GSp₄ consumers formerly pointed from ML.0 to ML.4.

Preserve historical node ids but assign the GSp₄ packet and surface applications to ML.4, ACC+ elliptic symmetric powers to ML.2, and the low-rank transfer nodes and their general symmetric-lift/SP definitions to ML.1. The intended local coarse order is ML.0 → ML.1 → ML.2 → ML.3 → ML.5, ML.0/ML.1 → ML.4 → ML.5. Legacy id prefixes are not parent-stage assignments. These local moves are recorded in placement and do not edit the atlas.

### Ownership contract 4

The accepted NT paper routes separate endpoints from analytic, unitary-level-raising, symmetric-power lifting and tensor-lifting methods.

Retain the eight method/refinement ids as import contracts with ownership fields naming the reviewed proposed Part IIs. Exact exports are requested without fabricated stage ids. The endpoint roadmap contains no second proof plan for those methods. The unitary method owner consumes the classifications as an external conditional input with their precise status; do not add a circular ML.4 → ML.3 proof edge.

## Supplier requests

Every request is open. Each names the exact extension rather than treating an existing coarse layer as a proof of a stronger result. Requests to a local layer with a proposed method owner terminate at that owner contract; no undesigned stage identifier is invented.

### R1: `AnalyticNumberTheory:AN.2`

The Wiener–Ikehara/Tauberian prime number theorem for Euler products continuing to a neighbourhood of Re s ≥ 1 with no zeros or poles except at s = 1: Σ_{N(x)≤n} χ(x) = c·n/log n + o(n/log n) with −c the order at 1 (Kedlaya Theorem 24.2).

Required by: [ML.3/l-function-equidistribution-criterion](#target-l-function-equidistribution-criterion), [ML.3/serre-equidistribution-criterion](#target-serre-equidistribution-criterion).

### R2: `AnalyticNumberTheory:AN.4`

Artin L-functions L(ρ, s) of continuous representations ρ : G_K → GL_n(ℂ) with finite image, their Euler products and their comparison with automorphic L-functions (used to state Langlands' conjecture for Artin representations).

Required by: [ML.1/strong-artin-conjecture](#target-strong-artin-conjecture).

### R3: `ArithmeticLocallySymmetricSpaces:ALS.3`

Hecke operators on the cohomology of the Bianchi locally symmetric spaces Γ₁(𝔫)\ℍ³ with coefficients Sym^{k−2}ℂ² ⊗ conj(Sym^{k−2}ℂ²), the parabolic subspace H_par and Harder's Eichler–Shimura comparison with cuspidal Bianchi eigenforms. Scope correction: the current ALS.3 statement supplies Hecke chain correspondences, not Harder’s Bianchi Eichler–Shimura theorem. The latter is a requested explicit extension with its parabolic-cohomology and weight hypotheses.

Required by: [ML.3/bianchi-modular-forms](#target-bianchi-modular-forms).

### R4: `AutomorphicFormsOnReductiveGroups:AF.4`

Clozel's purity lemma (Clozel 1990, Lemme 4.9): for F CM and π cuspidal regular algebraic on GL_n(𝔸_F), λ_{τ,i} + λ_{τc,n+1−i} is independent of τ; and regularity/algebraicity of weights in the conventions of BCGNT §1.6.

Required by: [ML.3/parallel-weight-and-clozel-purity](#target-parallel-weight-and-clozel-purity), [ML.4/gl4-symplectic-descent](#target-gl4-symplectic-descent).

### R5: `AutomorphicGaloisRepresentations:R19.2`

Galois realizations of Hilbert cusp forms over the totally real F occurring in non-general GSp4 types, together with one-dimensional global class-field characters; R19.1 classical forms over ℚ alone does not supply this.

Required by: [ML.4/non-general-type-reducible](#target-non-general-type-reducible).

### R6: `AutomorphicGaloisRepresentations:R19.2`

Galois representations of Hilbert modular forms of parallel and non-parallel weight, including parallel weight one (Rogawski–Tunnell, Jarvis), as used for totally odd Artin representations and for Theorem A of Newton–Thorne 2026. Scope correction: the read R19.2 stage constructs cohomological Hilbert/quaternionic realizations. Parallel weight-one and Pilloni–Stroh totally odd Artin inputs need an explicit exact extension; do not infer them from cohomological weight≥2 alone.

Required by: [ML.1/non-solvable-residual-modularity](#target-non-solvable-residual-modularity), [ML.1/totally-real-odd-artin](#target-totally-real-odd-artin), [ML.3/hilbert-symmetric-powers](#target-hilbert-symmetric-powers).

### R7: `AutomorphicGaloisRepresentationsPartII:AG2.0`

Regular algebraic and polarized automorphic representations (π, χ) of GL_n(𝔸_F) for F CM or totally real, with BLGGT's conditions (χ_v(−1) independent of v | ∞, π^c ≅ π^∨ ⊗ (χ ∘ N ∘ det), χ_v(−1) = (−1)^{n+w} for F imaginary of pure weight w (reviewed AG2.0/E2)), weights a ∈ (ℤ^n)^{Hom(F,ℂ),+}_w and the level conditions (prime / potentially prime to l). ML.0 registers these conventions; it does not re-define them.

Required by: [ML.0/blggt-normalization-register](#target-blggt-normalization-register), [ML.0/nt26-normalisation-bridge](#target-nt26-normalisation-bridge).

### R8: `AutomorphicGaloisRepresentationsPartII:AG2.2`

BLGGT v4 Theorem 2.1.1: for regular algebraic cuspidal polarized (π, χ), a semisimple r_{l,ı}(π) with (r_{l,ı}(π), ε_l^{1−n}r_{l,ı}(χ)) totally odd polarized, local–global compatibility ıWD(r|_{G_{F_v}})^{F-ss} ≅ rec(π_v ⊗ |det|^{(1−n)/2}) pure of weight w at v ∤ l (Caraiani), de Rham with HT_τ = {a_{ıτ,i} + n − i}, and the same compatibility at v | l when π_v has Iwahori-fixed vectors; plus Geraghty's ordinarity comparisons (6)–(7). Also: r_{π,ι} for RAESDC and RAECSDC π over totally real and CM fields with local–global compatibility at every finite place (Caraiani), as used by Newton–Thorne 2026 §1.2 and Lemma 2.1, and the compatible systems R_π of ACC+ §7.1 (Harris–Lan–Taylor–Thorne, Scholze, Varma) for regular algebraic cuspidal π over CM fields.

Required by: [ML.0/blggt-normalization-register](#target-blggt-normalization-register), [ML.0/compatible-system-automorphic-l-function-comparison](#target-compatible-system-automorphic-l-function-comparison), [ML.0/nt26-automorphy-predicate](#target-nt26-automorphy-predicate), [ML.2/compatible-system-l-function-continuation](#target-compatible-system-l-function-continuation), [ML.2/part-of-compatible-system](#target-part-of-compatible-system), [ML.2/steinberg-ordinarity-lemma](#target-steinberg-ordinarity-lemma), [ML.3/bianchi-ramanujan](#target-bianchi-ramanujan), [ML.3/one-prime-criterion](#target-one-prime-criterion), [ML.3/symmetric-power-lifting](#target-symmetric-power-lifting), [ML.4/unitary-descent-of-gl4-transfer](#target-unitary-descent-of-gl4-transfer).

### R9: `AutomorphicGaloisRepresentationsPartII:AG2.3`

Definite-unitary finite-slope eigenvarieties with dense strongly regular classical points and their Galois pseudo-representations, as used for E_n in Newton–Thorne I §2.

Required by: [ML.3/eigenvariety-propagation](#target-eigenvariety-propagation).

### R10: `AutomorphicGaloisRepresentationsPartII:AG2.5`

Varma's local–global compatibility (semisimplified, with the monodromy bound) for regular algebraic cuspidal π over CM fields, used for temperedness at ramified places in BCGNT Theorem 7.1.1. In Qian’s Steinberg argument compare at the auxiliary prime λ′≠l where the fibre is semisimple; preserve the maximal Jordan-block conclusion. Transport at λ alone identifies its global semisimplification.

Required by: [ML.3/bianchi-ramanujan](#target-bianchi-ramanujan), [ML.2/steinberg-ordinarity-lemma](#target-steinberg-ordinarity-lemma).

### R11: `AutomorphicLFunctionsAndLocalFactors:AL.2`

Godement–Jacquet: for cuspidal π on GL_n(𝔸_F), L^S(π, s) is entire (n ≥ 2) and satisfies the standard functional equation, with twists by finite-order characters; used through a Brauer-induction argument in BLGGT Corollary 5.4.3. Also: the Jacquet–Shalika bound for Satake parameters of unitary cuspidal representations (AL.2/jacquet-shalika-satake-bound), used for purity from symmetric powers (BCGNT Lemma 6.1.3, ACC+ Corollary 7.1.13).

Required by: [ML.0/compatible-system-automorphic-l-function-comparison](#target-compatible-system-automorphic-l-function-comparison), [ML.2/compatible-system-l-function-continuation](#target-compatible-system-l-function-continuation), [ML.3/non-cm-symmetric-powers](#target-non-cm-symmetric-powers), [ML.3/non-supercuspidal-symmetric-powers](#target-non-supercuspidal-symmetric-powers).

### R12: `AutomorphicLFunctionsAndLocalFactors:AL.3`

For cuspidal π, π′ on GL_n, GL_{n′} with unitary twists, L^S(π × π′^∨, s) is meromorphic, holomorphic and nonzero at s = 1 unless π ≅ π′ ⊗ |det|^t, in which case it has a simple pole there (Jacquet–Shalika 1981, Shahidi 1981); used in BLGGT Theorem 5.5.2. Also: L(Π, s) ≠ 0 on Re s = 1 for cuspidal Π on GL_n (Jacquet–Shalika), used for Sato–Tate. Also: strong multiplicity one for cuspidal and isobaric representations (AL.3/strong-multiplicity-one) and the simple pole of L^S(s, π × π^∨) at s = 1 (Jacquet–Shalika), used for the symplectic/orthogonal dichotomy and the uniqueness of functorial lifts.

Required by: [ML.2/irreducibility-density-one](#target-irreducibility-density-one), [ML.3/sato-tate-elliptic-curves](#target-sato-tate-elliptic-curves).

### R13: `AutomorphicLFunctionsAndLocalFactors:AL.4`

The Langlands–Shahidi L-functions L^S(s, π, Sym²), L^S(s, π, ∧²) and twisted L^S(s, Π, ∧²⊗ω), with Π unitary cuspidal and ω unitary: meromorphic continuation and the source-supported alternative at s=1 of a simple pole or a nonzero finite limit, including its exact symplectic-type criterion. Supply separately the precise analytic hypotheses for GL₂×GL₃ and GL₂×GL₄ converse-theorem inputs used by Kim–Shahidi and Kim; no full boundary-line theorem is inferred from the s=1 statement. Scope correction: AL.4 currently constructs only general unramified L-group factors and supplied-bound convergence, expressly not generic analytic continuation. These analytic inputs require an explicit Part II extension in this owner’s direction.

Required by: [ML.3/kim-shahidi-sym3](#target-kim-shahidi-sym3), [ML.3/kim-sym4](#target-kim-sym4), [ML.4/self-dual-cuspidal-type](#target-self-dual-cuspidal-type), [ML.4/shahidi-exterior-square](#target-shahidi-exterior-square), [ML.5/ckpss-generic-transfer](#target-ckpss-generic-transfer).

### R14: `EndoscopicTransferAndUnitaryTraceComparison:ET.3`

The fundamental lemma (Ngô), its twisted and weighted variants where proved (Chaudouard–Laumon for split groups), and Waldspurger's transfer of orbital integrals, as inputs of the stabilisation behind Arthur's classification; the twisted weighted fundamental lemma is recorded as open. Scope correction: the read ET.3 explicitly avoids a full weighted fundamental lemma; it cannot supply Arthur’s full weighted/twisted package. Keep that as the separate named external classification input/Part II request.

Required by: [ML.4/trace-formula-inputs-register](#target-trace-formula-inputs-register).

### R15: `EndoscopicTransferAndUnitaryTraceComparison:ET.4`

The simple stable and twisted trace formulas for unitary groups and twisted GL_n (the restricted form ET.4 plans), as the part of the twisted trace formula and its stabilisation the atlas plans; the full stabilisation of Mœglin–Waldspurger is recorded as a gap in ML.4.

Required by: [ML.4/trace-formula-inputs-register](#target-trace-formula-inputs-register).

### R16: `EndoscopicTransferAndUnitaryTraceComparison:ET.6`

The local Langlands correspondence for GL_n over p-adic fields (Harris–Taylor, Henniart, Scholze), rec_K, with its compatibility with twists, duals, central characters and L/ε-factors of pairs, used to define local parameters of automorphic representations and functorial lifts.

Required by: [ML.3/functorial-lift](#target-functorial-lift), [ML.4/extended-langlands-parameter](#target-extended-langlands-parameter), [ML.4/gan-takeda-llc-gsp4](#target-gan-takeda-llc-gsp4), [ML.4/global-arthur-parameter](#target-global-arthur-parameter), [ML.4/local-arthur-packets](#target-local-arthur-packets).

### R17: `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`

Arthur–Clozel cyclic base change and descent for GL_n (Theorems 3.4.2, 3.5.1 of AC89) with Harris–Taylor Lemma VII.2.6, and automorphic induction from a cyclic CM extension, with the cuspidality criteria; used in BLGGT Lemmas 2.2.2, 2.2.4 and Proposition 4.1.1. Also: Arthur–Clozel cyclic base change and descent for GL_n of prime degree with soluble iteration, in the form quoted by Newton–Thorne 2026 §1.2 and used by BCGNT Proposition 6.2.3, and Labesse's base change between unitary groups and GL_n used for the Steinberg-at-q forms of Newton–Thorne I and the unitary descent in Calegari–Geraghty Lemma 6.9.

Required by: [ML.2/p-r-switch](#target-p-r-switch), [ML.3/bcgnt-symmetric-powers-purity](#target-bcgnt-symmetric-powers-purity), [ML.3/clozel-thorne-reductions](#target-clozel-thorne-reductions), [ML.3/cm-field-symmetric-powers](#target-cm-field-symmetric-powers), [ML.3/steinberg-level-raising](#target-steinberg-level-raising), [ML.4/unitary-descent-of-gl4-transfer](#target-unitary-descent-of-gl4-transfer), [ML.5/automorphic-induction-register](#target-automorphic-induction-register), [ML.5/cyclic-base-change-gln](#target-cyclic-base-change-gln).

### R18: `GL2AutomorphicRepresentationsAndTransfer:R16.3`

The local Langlands correspondence for GL₂ (parameters of principal series, Steinberg and supercuspidal representations), as used by Gelbart–Jacquet's lift and by Gan–Takeda.

Required by: [ML.0/gsp4-galois-l-packet](#target-gsp4-galois-l-packet), [ML.3/gelbart-jacquet](#target-gelbart-jacquet), [ML.4/gan-takeda-llc-gsp4](#target-gan-takeda-llc-gsp4).

### R19: `GL2AutomorphicRepresentationsAndTransfer:R17.5`

Automorphic induction of Hecke characters of quadratic fields to GL₂ and the soluble (dihedral, tetrahedral, octahedral) Artin modularity for weight one, with the Kim–Shahidi inputs for the icosahedral case as they are recorded there; used for Newton–Thorne II Theorem A.1. Also: R17.5/solvable-artin (Langlands–Tunnell) is registered by ML.1/odd-artin-modularity-over-q and rank-two automorphic induction by ML.5/automorphic-induction-register (RS-21).

Required by: [ML.1/totally-real-odd-artin](#target-totally-real-odd-artin), [ML.3/cm-and-weight-one-symmetric-powers](#target-cm-and-weight-one-symmetric-powers), [ML.5/automorphic-induction-register](#target-automorphic-induction-register).

### R20: `GL2ModularityLifting:R22.5`

Request the exact odd-prime potentially Barsotti–Tate modularity lifting theorem over the totally real field used in BCGP Proposition10.1.3, with residual modularity, cyclotomic irreducibility, determinant and local types. R22.1 only builds the deformation-to-Hecke map. R22.5 is the lifting direction; its precise Hilbert-field export still needs verification.

Required by: [ML.1/non-solvable-residual-modularity](#target-non-solvable-residual-modularity).

### R21: `GlobalGaloisDeformations:R04.2/universal-deformation-ring`

Under Φ_p and Schur residual representation (here absolutely irreducible), the strict-equivalence deformation functor is pro-represented by a complete local Noetherian ring. Finite-image tangent-space vanishing in CG Lemma4.14 is a separate class-field argument, not part of this representability theorem.

Required by: [ML.1/buzzard-taylor-hypotheses](#target-buzzard-taylor-hypotheses).

### R22: `MetaplecticAutomorphicForms:MP.3`

Local theta correspondences for (GSp₄, GO(V)) with dim V = 4, 6 and for (Mp_{2n}, SO_{2n+1}) (Gan–Takeda; Gan–Savin), used to construct the LLC for GSp₄ and the local descent to Mp_{2n}. Scope correction: MP.3 provides elementary theta modules and source-qualified range statements; full all-residual-characteristic Howe duality and GRS local descent require a separate exact extension.

Required by: [ML.4/gan-takeda-llc-gsp4](#target-gan-takeda-llc-gsp4), [ML.5/local-descent-mp2n](#target-local-descent-mp2n).

### R23: `PadicFamilies:L2`

Finite-slope eigenvarieties: the Coleman–Mazur eigencurve E for GL₂/ℚ (tame level N, prime p) with its weight map κ, slope map and the classical points (f, α); and eigenvarieties E_n for definite unitary groups in n variables with refined points (π, χ); with the Zariski density of classical points and irreducible components. Used by Newton–Thorne I §§2–3.

Required by: [ML.3/buzzard-kilford-eigencurve](#target-buzzard-kilford-eigencurve), [ML.3/eigenvariety-propagation](#target-eigenvariety-propagation).

### R24: `PotentialAutomorphyInfrastructure:PA.2`

ACC+ Theorem 5.5.1 (local–global compatibility at p for ordinary parts over CM fields, decomposed generic residual representation) and the ordinarity comparison of ACC+ Corollary 5.5.2.

Required by: [ML.2/galois-ordinarity-from-automorphic](#target-galois-ordinarity-from-automorphic).

### R25: `PotentialAutomorphyInfrastructure:PA.4`

The automorphy lifting theorems for n-dimensional representations of G_F, F imaginary CM or totally real, of ACC+ §6.1: Theorem 6.1.1 (Fontaine–Laffaille: crystalline, p unramified, p > n², enormous decomposed generic residual image, regular weight below p − 2n) and Theorem 6.1.2 (ordinary of regular weight, p > n), with all image, level and local hypotheses (RT-AREA-langlands-1/7). Consumers: Qian, BCGNT, Caraiani–Newton, Calegari–Geraghty. The reviewed PA.4/fontaine-laffaille-automorphy-lifting and PA.4/ordinary-automorphy-lifting exports now exist; they apply only after their exact bounds, enormous/decomposed-generic image, scalar and local conditions are checked. BCGNT Proposition 6.2.3 instead needs its Theorem 3.2.1 with the local connects relation; Caraiani–Newton needs its Theorem 1.3 potentially semistable branch, and CG Theorem 5.16 needs its general-number-field conditional branch. Those are distinct requests, not supplied by the two PA.4 endpoints.

Required by: [ML.1/imaginary-quadratic-elliptic-modularity](#target-imaginary-quadratic-elliptic-modularity), [ML.2/cg18-conditional-potential-modularity](#target-cg18-conditional-potential-modularity), [ML.2/cg18-odd-symmetric-powers](#target-cg18-odd-symmetric-powers), [ML.2/dwork-fibre-automorphy-transport](#target-dwork-fibre-automorphy-transport), [ML.2/p-r-switch](#target-p-r-switch), [ML.2/qian-ordinary-potential-automorphy](#target-qian-ordinary-potential-automorphy), [ML.3/bcgnt-potential-automorphy-det-cyclotomic](#target-bcgnt-potential-automorphy-det-cyclotomic).

### R26: `PotentialAutomorphyInfrastructurePartII:PL.0`

Geraghty's ι-ordinarity, the Steinberg weight-zero criterion (PL.0/steinberg-weight-zero-iota-ordinary) and the comparison of automorphic and Galois ordinarity in the polarized setting.

Required by: [ML.2/galois-ordinarity-from-automorphic](#target-galois-ordinarity-from-automorphic), [ML.2/steinberg-ordinarity-lemma](#target-steinberg-ordinarity-lemma).

### R27: `PotentialAutomorphyInfrastructurePartII:PL.5`

The Dwork family's compatible systems and BLGGT Theorem 3.1.2 / Proposition 3.2.1 (potential ordinary automorphy, ordinary lifts with prescribed local behaviour), as used in Qian §4 and ACC+ §7.2.

Required by: [ML.2/dwork-fibre-automorphy-transport](#target-dwork-fibre-automorphy-transport), [ML.2/qian-residual-potential-automorphy](#target-qian-residual-potential-automorphy), [ML.3/acc-elliptic-symmetric-powers](#target-acc-elliptic-symmetric-powers).

### R28: `PotentialModularityAndCompatibleSystems:R23.1`

Moret-Bailly's theorem: points of a smooth geometrically connected variety over a Galois extension unramified at a given set, with prescribed local behaviour and linear disjointness (used for Dwork-family points, twisted modular curves X_E(q) and auxiliary elliptic curves).

Required by: [ML.1/imaginary-quadratic-elliptic-modularity](#target-imaginary-quadratic-elliptic-modularity), [ML.1/non-solvable-residual-modularity](#target-non-solvable-residual-modularity), [ML.2/potential-weak-automorphy-symmetric-powers](#target-potential-weak-automorphy-symmetric-powers), [ML.2/qian-residual-potential-automorphy](#target-qian-residual-potential-automorphy), [ML.2/twisted-modular-curve](#target-twisted-modular-curve).

### R29: `PotentialModularityAndCompatibleSystems:R24.5:operations`

Weakly, very weakly and extremely weakly compatible systems of l-adic representations (BLGGT §5.1; ACC+ §7.1), purity, symmetric powers and duals of systems, and their partial L-functions.

Required by: [ML.0/compatible-system-archimedean-factors](#target-compatible-system-archimedean-factors), [ML.2/acc-auxiliary-primes](#target-acc-auxiliary-primes), [ML.2/patrikis-taylor-potential-automorphy](#target-patrikis-taylor-potential-automorphy), [ML.3/purity-from-symmetric-powers](#target-purity-from-symmetric-powers).

### R30: [Chebotarev](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev)

Chebotarev density in Dirichlet density form, to compare Galois representations through traces of Frobenius and to choose auxiliary primes of density one.

Required by: [ML.1/strong-artin-conjecture](#target-strong-artin-conjecture), [ML.2/acc-auxiliary-primes](#target-acc-auxiliary-primes), [ML.2/dwork-fibre-automorphy-transport](#target-dwork-fibre-automorphy-transport), [ML.2/qian-auxiliary-prime](#target-qian-auxiliary-prime), [ML.3/one-prime-criterion](#target-one-prime-criterion), [ML.5/cyclic-base-change-gln](#target-cyclic-base-change-gln).

### R31: [ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-11-the-global-class-formation-and-global-artin-reciprocity)

The archimedean Artin maps Art_ℝ (kernel ℝ_{>0}) and Art_ℂ (trivial), as used in ACC+'s conventions.

Required by: [ML.0/archimedean-langlands-conventions](#target-archimedean-langlands-conventions).

### R32: [ClassFieldTheory](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors)

The local Artin map Art_K normalised so that uniformisers go to geometric Frobenius, for the definition of L(ρ) in BCGP Definition 2.3.1.

Required by: [ML.0/gsp4-galois-l-packet](#target-gsp4-galois-l-packet).

### R33: [ModularCurves](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves/README.md#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering)

The compactified modular curve X(q) and its cusps, for the twisted modular curve X_E(q).

Required by: [ML.2/twisted-modular-curve](#target-twisted-modular-curve).

### R34: [ModularCurves](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ModularCurves/README.md#layer-5-affine-fine-modular-curves-after-inverting-n)

The fine moduli scheme Y(q) of elliptic curves with full level-q structure (q ≥ 3) over ℤ[1/q], twisted by E[q] to give Y_E(q).

Required by: [ML.2/twisted-modular-curve](#target-twisted-modular-curve).

### R35: [ReductiveGroups](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-6-reductive-and-semisimple-groups)

Connected reductive groups over local and global fields, quasi-split forms and their (Langlands) dual groups and L-groups, for the definitions of L-parameters and the statements of functoriality.

Required by: [ML.4/extended-langlands-parameter](#target-extended-langlands-parameter), [ML.5/functoriality-conjecture](#target-functoriality-conjecture), [ML.5/local-langlands-conjecture-general](#target-local-langlands-conjecture-general).

### R36: [RepresentationTheory/CompactGroups](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md#layer-5-the-peter-weyl-theorem)

The Peter–Weyl theorem for compact groups (characters of irreducible representations span the class functions), for Serre's equidistribution criterion.

Required by: [ML.3/serre-equidistribution-criterion](#target-serre-equidistribution-criterion).

### R37: [RepresentationTheory/CompactGroups](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md#layer-6-characters-of-compact-groups)

Characters and Haar measure of compact groups such as U₂(ℝ)_a, for the Sato–Tate groups of BCGNT §7.2.

Required by: [ML.3/serre-equidistribution-criterion](#target-serre-equidistribution-criterion).

### R38: `PotentialAutomorphyInfrastructure:PA.4`

BCGNT Theorem 3.2.1, the CM automorphy lifting theorem with Taylor–Wiles conditions and component-wise local connects hypotheses, plus ACC+ Proposition 6.5.13 cyclic descent with irreducibility and level control. Ordinary/Fontaine–Laffaille endpoint names alone do not provide these signatures.

Required by: [ML.2/p-r-switch](#target-p-r-switch).

### R39: `PotentialModularityAndCompatibleSystems:R24.5/system-l-functions`

Reuse the completed L-function definition, strict/pure/regular and real-sign hypotheses, monic-to-reciprocal Euler conversion, and corrected odd-rank determinant sign (ML/E16). No duplicate completed-function definition belongs to ML.0.

Required by: [ML.0/compatible-system-archimedean-factors](#target-compatible-system-archimedean-factors), [ML.3/completed-symmetric-power-l-function](#target-completed-symmetric-power-l-function).

### R40: `EllipticCurveModularity:R29.6`

Modularity of every elliptic curve over ℚ with full local-factor comparison, to apply NT non-CM symmetric powers in the Sato–Tate criterion; exact statement read in the atlas R29.6 description.

Required by: [ML.3/sato-tate-elliptic-curves](#target-sato-tate-elliptic-curves).

### R41: `PotentialModularityAndCompatibleSystems:R24.5`

Patrikis–Taylor Lemma 1.6 and Theorem 2.1: for a pure, regular, totally odd polarized weakly compatible system, irreducible constituents at conjugation-invariant coefficient primes retain the polarization, and extend to a decomposition into weakly compatible systems becoming cuspidally automorphic over one CM extension with the stated avoidance and Galois conditions. This differs from the existing BLGGT extremely regular decomposition and does not turn a reducible sum into a cusp form.

Required by: [ML.2/patrikis-taylor-potential-automorphy](#target-patrikis-taylor-potential-automorphy), [ML.2/patrikis-taylor-l-function-consequences](#target-patrikis-taylor-l-function-consequences).

### R42: `ModularityAndLanglandsExtensions:ML.3`

Let (π₀, χ₀), (π′₀, χ′₀) be refined points of the eigencurve E₀ (tame level N, prime p) with corresponding points z₀, z′₀. Suppose either (1) χ₀ is numerically non-critical and n-regular, (2) χ′₀ is n-regular, (3) the Zariski closures of r_{π₀,ι}(G_{ℚ_p}) and r_{π′₀,ι}(G_{ℚ_p}) contain SL₂, (4) Sym^{n−1}r_{π₀,ι} is automorphic; or (1ord) χ₀ is ordinary, (2ord) π₀, π′₀ are not CM, (3ord) Sym^{n−1}r_{π₀,ι} is automorphic. If z₀, z′₀ lie on a common irreducible component of E_{0,ℂ_p}, then Sym^{n−1}r_{π′₀,ι} is automorphic. Required export: TauCeti.SymmetricPower.automorphic_of_same_component. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

Proposed owner: SymmetricPowersByAnalyticContinuation.

Required by: [ML.3/eigenvariety-propagation](#target-eigenvariety-propagation).

### R43: `ModularityAndLanglandsExtensions:ML.3`

For p = 2 and N = 1, E₀ lies over the component W₀⁺ (χ(−1) = 1) of weight space, and w = χ_u(5) − 1 identifies W₀⁺ with {|w| < 1}. Over the annulus W₀(b) = {|8| < |w| < 1}, E₀(b) = κ^{−1}(W₀(b)) is a disjoint union ⊔_{i≥1}X_i of admissible opens with κ|_{X_i} an isomorphism onto W₀(b), and on X_i the slope is i·v₂(w). Required export: TauCeti.SymmetricPower.buzzardKilford. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

Proposed owner: SymmetricPowersByAnalyticContinuation.

Required by: [ML.3/buzzard-kilford-eigencurve](#target-buzzard-kilford-eigencurve).

### R44: `ModularityAndLanglandsExtensions:ML.3`

Fix n ≥ 2. If π₀ is an everywhere unramified cuspidal π of weight k ≥ 2 with Sym^{n−1}r_{π₀,ι} automorphic for some (equivalently any) p and ι, then Sym^{n−1}r_{π,ι} is automorphic for every everywhere unramified cuspidal π of weight ≥ 2. Required export: TauCeti.SymmetricPower.symPower_levelOne_propagate. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

Proposed owner: SymmetricPowersByAnalyticContinuation.

Required by: [ML.3/level-one-ping-pong](#target-level-one-ping-pong).

### R45: `ModularityAndLanglandsExtensions:ML.3`

Let n ≥ 3, p ≡ 1 (mod 48·n!), q ≠ p, X₀ a finite set of places of K prime to 2pq and ω a de Rham character with ωω^c = ε³, unramified on X₀. Then there is a soluble CM F/K, X₀-split, and a RACSDC ι-ordinary Π on GL_n(𝔸_F) with r_{Π,ι} ≅ ω^{n−1}|_{G_F} ⊗ Sym^{n−1}r_{σ₀,ι}|_{G_F}, the same Hodge–Tate numbers, and Π_v an unramified twist of Steinberg at some v | q (Theorem 7.1; proved here for n odd, Proposition 7.4; for n even via Anastassiades–Thorne). Required export: TauCeti.SymmetricPower.exists_steinberg_levelRaising. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

Proposed owner: SymmetricPowersByUnitaryLevelRaising.

Required by: [ML.3/steinberg-level-raising](#target-steinberg-level-raising).

### R46: `ModularityAndLanglandsExtensions:ML.3`

For every n ≥ 3 there is a cuspidal, everywhere unramified π of GL₂(𝔸_ℚ) of weight k ≥ 2 such that Sym^{n−1}r_{π,ι} is automorphic for every ι. Required export: TauCeti.SymmetricPower.exists_levelOne_symPower. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

Proposed owner: SymmetricPowersByUnitaryLevelRaising.

Required by: [ML.3/one-level-one-symmetric-power](#target-one-level-one-symmetric-power).

### R47: `ModularityAndLanglandsExtensions:ML.3`

Let π be non-CM of weight k ≥ 2 with π_l non-supercuspidal for every l. Then there are a prime p > max(2(n + 1), (n − 1)k), ι, and π′ of weight k with r̄_{π,ι}(G_ℚ) ⊇ a conjugate of SL₂(F_p), π_p and π′_p unramified, r̄_{π,ι} ≅ r̄_{π′,ι}, and π′_l non-supercuspidal with all accessible refinements n-regular wherever π′_l is ramified. Required export: TauCeti.SymmetricPower.exists_nRegular_congruence. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

Proposed owner: SymmetricPowersByUnitaryLevelRaising.

Required by: [ML.3/n-regular-congruences](#target-n-regular-congruences).

### R48: `ModularityAndLanglandsExtensions:ML.3`

Newton–Thorne II Theorem 2.1. Let F be totally real, p a prime, n≥1, and π,π′ regular algebraic, cuspidal, non-CM representations of GL₂(𝔸_F), both of weight two and both nonordinary at every v|p. For a fixed ι:Q̄_p≅ℂ assume r̄_{π,ι}≅r̄_{π′,ι}, and that π_v is a twist of Steinberg exactly when π′_v is, for every finite v∤p. Suppose that for some a≥1, up to conjugacy, PSL₂(F_{p^a})≤P r̄_{π,ι}(G_F)≤PGL₂(F_{p^a}), with p^a>max(5,2n−1). If Sym^{n−1}r_{π′,ι} is automorphic, then Sym^{n−1}r_{π,ι} is automorphic. The bound concerns the finite-field cardinality, and applies also at p=2; it does not impose p>n or irreducibility of the residual symmetric power. Required export: TauCeti.SymmetricPower.symPower_lifting. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

Proposed owner: SymmetricPowerAutomorphyLifting.

Required by: [ML.3/symmetric-power-automorphy-lifting](#target-symmetric-power-automorphy-lifting).

### R49: `ModularityAndLanglandsExtensions:ML.3`

For a definite unitary group G_n over F⁺ and an automorphic π of G_n(𝔸_{F⁺}) with p-adic places S_p, an accessible refinement is a choice χ = (χ_v)_{v∈S_p} of smooth characters χ_v : T_n(F_ṽ) → Q̄_p^× occurring as subquotients of the normalised Jacquet module ι^{−1}r_{N_n}(π_v), equivalently with π_v ↪ i^{GL_n}_{B_n}ιχ_v. For n = 2 it is n-regular if (χ_{v,1}/χ_{v,2})^i ≠ 1 for 1 ≤ i ≤ n − 1 and every v ∈ S_p. For π on GL₂(𝔸_ℚ), π_l has an accessible refinement iff its Jacquet module is nonzero, iff π_l is not supercuspidal. Required export: TauCeti.SymmetricPower.IsAccessibleRefinement. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

Proposed owner: LocalGlobalCompatibilityPartIIEigenvarietyCompanions.

Required by: [ML.3/accessible-regular-refinement](#target-accessible-regular-refinement).

### R50: `ModularityAndLanglandsExtensions:ML.4`

BCGP25 Lemma 10.4.1: the regular-weight residual Serre hypothesis implies modularity of abelian surfaces only after the surface classification, residual split/irreducible alternatives, ordinary prime density and weight-changing/Hida arguments. Export the full application with its explicit Arthur-classification dependence.

Proposed owner: AbelianSurfacesModularity.

Required by: [ML.0/regular-weight-serre-implies-abelian-surface-modularity](#target-regular-weight-serre-implies-abelian-surface-modularity).

### R51: `AutomorphicGaloisRepresentationsPartII:AG2.2`

C-GALOIS: Actual continuous representations of the absolute Galois group in finite coefficient fields and their algebraic closures; coefficient extension, restriction along actual number-field embeddings, integral lattices and semisimple residual reduction; Weil–Deligne realization of the same representation at each finite place. Realization π↦r_{π,ι} must commute with isomorphism, twists, duals and permitted base change, with the stated rec^T and Hodge–Tate identities. Complex conjugation, polarization multiplier and Hodge/sign data refer to that realization. Frobenius inversion is evaluation at inverse elements; a separate cohomological-duality dictionary is required before changing Hodge signs.

Required by: [ML.0/blggt-normalization-register](#target-blggt-normalization-register), [ML.0/nt26-normalisation-bridge](#target-nt26-normalisation-bridge), [ML.0/nt26-automorphy-predicate](#target-nt26-automorphy-predicate), [ML.0/compatible-system-automorphic-l-function-comparison](#target-compatible-system-automorphic-l-function-comparison), [ML.0/gsp4-galois-l-packet](#target-gsp4-galois-l-packet), [ML.0/blggt-version-register](#target-blggt-version-register), [ML.2/potential-ordinary-automorphy](#target-potential-ordinary-automorphy), [ML.2/potential-automorphy-theorem](#target-potential-automorphy-theorem), [ML.2/potential-automorphy-totally-real](#target-potential-automorphy-totally-real), [ML.2/potential-automorphy-mod-l](#target-potential-automorphy-mod-l), [ML.2/compatible-systems-potentially-automorphic](#target-compatible-systems-potentially-automorphic), [ML.2/compatible-system-l-function-continuation](#target-compatible-system-l-function-continuation), [ML.2/multiple-product-l-functions](#target-multiple-product-l-functions), [ML.2/constituents-potentially-automorphic](#target-constituents-potentially-automorphic), [ML.2/part-of-compatible-system](#target-part-of-compatible-system), [ML.2/irreducibility-density-one](#target-irreducibility-density-one), [ML.2/decomposition-into-irreducible-systems](#target-decomposition-into-irreducible-systems), [ML.3/accessible-regular-refinement](#target-accessible-regular-refinement), [ML.3/eigenvariety-propagation](#target-eigenvariety-propagation), [ML.3/buzzard-kilford-eigencurve](#target-buzzard-kilford-eigencurve), [ML.3/level-one-ping-pong](#target-level-one-ping-pong), [ML.3/steinberg-level-raising](#target-steinberg-level-raising), [ML.3/one-level-one-symmetric-power](#target-one-level-one-symmetric-power), [ML.3/level-one-symmetric-powers](#target-level-one-symmetric-powers), [ML.3/n-regular-congruences](#target-n-regular-congruences), [ML.3/non-supercuspidal-symmetric-powers](#target-non-supercuspidal-symmetric-powers), [ML.3/symmetric-power-automorphy-lifting](#target-symmetric-power-automorphy-lifting), [ML.3/non-cm-symmetric-powers](#target-non-cm-symmetric-powers), [ML.3/cm-and-weight-one-symmetric-powers](#target-cm-and-weight-one-symmetric-powers), [ML.1/irregular-systems-weight-one](#target-irregular-systems-weight-one), [ML.1/odd-artin-modularity-over-q](#target-odd-artin-modularity-over-q), [ML.1/non-solvable-residual-modularity](#target-non-solvable-residual-modularity), [ML.1/buzzard-taylor-hypotheses](#target-buzzard-taylor-hypotheses), [ML.1/weight-one-separation-register](#target-weight-one-separation-register), [ML.2/qian-auxiliary-prime](#target-qian-auxiliary-prime), [ML.2/elliptic-symmetric-power-seed](#target-elliptic-symmetric-power-seed), [ML.2/dwork-fibre-automorphy-transport](#target-dwork-fibre-automorphy-transport), [ML.2/steinberg-ordinarity-lemma](#target-steinberg-ordinarity-lemma), [ML.2/galois-ordinarity-from-automorphic](#target-galois-ordinarity-from-automorphic), [ML.2/acc-symplectic-potential-automorphy](#target-acc-symplectic-potential-automorphy), [ML.2/acc-auxiliary-primes](#target-acc-auxiliary-primes), [ML.2/potential-automorphy-with-steinberg-place](#target-potential-automorphy-with-steinberg-place), [ML.2/compatible-system-from-potential-automorphy](#target-compatible-system-from-potential-automorphy), [ML.2/cg18-conditional-potential-modularity](#target-cg18-conditional-potential-modularity), [ML.2/cg18-odd-symmetric-powers](#target-cg18-odd-symmetric-powers), [ML.2/potential-weak-automorphy-symmetric-powers](#target-potential-weak-automorphy-symmetric-powers), [ML.3/bcgnt-potential-automorphy-det-cyclotomic](#target-bcgnt-potential-automorphy-det-cyclotomic), [ML.3/one-prime-criterion](#target-one-prime-criterion), [ML.3/clozel-thorne-reductions](#target-clozel-thorne-reductions), [ML.3/all-regular-symmetric-powers](#target-all-regular-symmetric-powers), [ML.3/hilbert-symmetric-powers](#target-hilbert-symmetric-powers), [ML.3/cm-field-symmetric-powers](#target-cm-field-symmetric-powers), [ML.3/sym6-sym8](#target-sym6-sym8), [ML.3/symmetric-powers-up-to-eight](#target-symmetric-powers-up-to-eight), [ML.3/large-residual-image-density-one](#target-large-residual-image-density-one), [ML.3/nt21-semistable-l-functions](#target-nt21-semistable-l-functions), [ML.3/acc-purity-rank-two](#target-acc-purity-rank-two), [ML.3/bcgnt-symmetric-powers-purity](#target-bcgnt-symmetric-powers-purity), [ML.3/bianchi-ramanujan](#target-bianchi-ramanujan), [ML.3/bianchi-fourier-ramanujan](#target-bianchi-fourier-ramanujan), [ML.3/bianchi-parabolic-cohomology-ramanujan](#target-bianchi-parabolic-cohomology-ramanujan), [ML.3/bianchi-mass-equidistribution](#target-bianchi-mass-equidistribution), [ML.3/cg18-conditional-sato-tate](#target-cg18-conditional-sato-tate), [ML.3/gelbart-jacquet](#target-gelbart-jacquet), [ML.3/kim-shahidi-sym3](#target-kim-shahidi-sym3), [ML.3/kim-sym4](#target-kim-sym4), [ML.3/ramakrishnan-tensor-product](#target-ramakrishnan-tensor-product), [ML.3/low-rank-symmetric-powers](#target-low-rank-symmetric-powers), [ML.5/cyclic-base-change-gln](#target-cyclic-base-change-gln), [ML.5/ckpss-generic-transfer](#target-ckpss-generic-transfer), [ML.5/grs-descent](#target-grs-descent), [ML.5/local-descent-mp2n](#target-local-descent-mp2n), [ML.5/automorphic-induction-register](#target-automorphic-induction-register), [ML.5/local-langlands-conjecture-general](#target-local-langlands-conjecture-general), [ML.5/symmetric-power-functoriality-implies-ramanujan](#target-symmetric-power-functoriality-implies-ramanujan).

### R52: `AutomorphicFormsOnReductiveGroups:AF.1`

C-AUTOMORPHIC: Actual isomorphism classes of irreducible admissible local representations and global automorphic representations with a fixed field, reductive group and rank. Cuspidal, isobaric, regular algebraic, weight, local component, central character, twist and contragredient refer to those objects. Isobaric sums preserve multiplicities and their local parameters are direct sums. Local rec commutes with twists/duals and the all-place functorial-lift predicate uses the same components. The Langlands quotient over ℝ/ℂ and the archimedean Weil group have the specified LLC source scope; a rank label cannot supply these laws.

Required by: [ML.0/archimedean-langlands-conventions](#target-archimedean-langlands-conventions), [ML.3/symmetric-power-lift-over-number-fields](#target-symmetric-power-lift-over-number-fields), [ML.3/symmetric-power-lifting](#target-symmetric-power-lifting), [ML.3/sp-statement](#target-sp-statement), [ML.3/functorial-lift](#target-functorial-lift), [ML.5/functoriality-conjecture](#target-functoriality-conjecture), [ML.4/self-dual-cuspidal-type](#target-self-dual-cuspidal-type), [ML.4/gsp4-discrete-spectrum-types](#target-gsp4-discrete-spectrum-types), [ML.0/blggt-version-register](#target-blggt-version-register), [ML.3/accessible-regular-refinement](#target-accessible-regular-refinement), [ML.3/eigenvariety-propagation](#target-eigenvariety-propagation), [ML.3/buzzard-kilford-eigencurve](#target-buzzard-kilford-eigencurve), [ML.3/level-one-ping-pong](#target-level-one-ping-pong), [ML.3/steinberg-level-raising](#target-steinberg-level-raising), [ML.3/one-level-one-symmetric-power](#target-one-level-one-symmetric-power), [ML.3/level-one-symmetric-powers](#target-level-one-symmetric-powers), [ML.3/n-regular-congruences](#target-n-regular-congruences), [ML.3/non-supercuspidal-symmetric-powers](#target-non-supercuspidal-symmetric-powers), [ML.3/symmetric-power-automorphy-lifting](#target-symmetric-power-automorphy-lifting), [ML.3/non-cm-symmetric-powers](#target-non-cm-symmetric-powers), [ML.3/cm-and-weight-one-symmetric-powers](#target-cm-and-weight-one-symmetric-powers), [ML.0/regular-weight-serre-implies-abelian-surface-modularity](#target-regular-weight-serre-implies-abelian-surface-modularity), [ML.1/irregular-systems-weight-one](#target-irregular-systems-weight-one), [ML.1/odd-artin-modularity-over-q](#target-odd-artin-modularity-over-q), [ML.1/non-solvable-residual-modularity](#target-non-solvable-residual-modularity), [ML.1/buzzard-taylor-hypotheses](#target-buzzard-taylor-hypotheses), [ML.1/weight-one-separation-register](#target-weight-one-separation-register), [ML.3/bcgnt-potential-automorphy-det-cyclotomic](#target-bcgnt-potential-automorphy-det-cyclotomic), [ML.3/one-prime-criterion](#target-one-prime-criterion), [ML.3/clozel-thorne-reductions](#target-clozel-thorne-reductions), [ML.3/all-regular-symmetric-powers](#target-all-regular-symmetric-powers), [ML.3/hilbert-symmetric-powers](#target-hilbert-symmetric-powers), [ML.3/cm-field-symmetric-powers](#target-cm-field-symmetric-powers), [ML.3/sym6-sym8](#target-sym6-sym8), [ML.3/symmetric-powers-up-to-eight](#target-symmetric-powers-up-to-eight), [ML.3/large-residual-image-density-one](#target-large-residual-image-density-one), [ML.3/nt21-semistable-l-functions](#target-nt21-semistable-l-functions), [ML.3/acc-purity-rank-two](#target-acc-purity-rank-two), [ML.3/bcgnt-symmetric-powers-purity](#target-bcgnt-symmetric-powers-purity), [ML.3/bianchi-ramanujan](#target-bianchi-ramanujan), [ML.3/bianchi-fourier-ramanujan](#target-bianchi-fourier-ramanujan), [ML.3/bianchi-parabolic-cohomology-ramanujan](#target-bianchi-parabolic-cohomology-ramanujan), [ML.3/bianchi-mass-equidistribution](#target-bianchi-mass-equidistribution), [ML.3/cg18-conditional-sato-tate](#target-cg18-conditional-sato-tate), [ML.4/symplectic-branch-status](#target-symplectic-branch-status), [ML.4/vogan-packets-so-v](#target-vogan-packets-so-v), [ML.4/amf-nonsplit-so-v](#target-amf-nonsplit-so-v), [ML.4/packet-member-irreducibility](#target-packet-member-irreducibility), [ML.4/generic-packets-standard-modules](#target-generic-packets-standard-modules), [ML.4/gan-takeda-llc-gsp4](#target-gan-takeda-llc-gsp4), [ML.4/gsp4-arthur-classification](#target-gsp4-arthur-classification), [ML.4/non-general-type-reducible](#target-non-general-type-reducible), [ML.4/gl4-symplectic-descent](#target-gl4-symplectic-descent), [ML.4/shahidi-exterior-square](#target-shahidi-exterior-square), [ML.4/gsp4-archimedean-limit-packets](#target-gsp4-archimedean-limit-packets), [ML.4/limit-discrete-series-packet-types](#target-limit-discrete-series-packet-types), [ML.4/gsp4-gl4-archimedean-transfer](#target-gsp4-gl4-archimedean-transfer), [ML.4/unitary-descent-of-gl4-transfer](#target-unitary-descent-of-gl4-transfer), [ML.4/xu-gsp2n-packets](#target-xu-gsp2n-packets), [ML.4/xu-multiplicity-formula](#target-xu-multiplicity-formula), [ML.4/adams-johnson-packets](#target-adams-johnson-packets), [ML.3/gelbart-jacquet](#target-gelbart-jacquet), [ML.3/kim-shahidi-sym3](#target-kim-shahidi-sym3), [ML.3/kim-sym4](#target-kim-sym4), [ML.3/ramakrishnan-tensor-product](#target-ramakrishnan-tensor-product), [ML.3/low-rank-symmetric-powers](#target-low-rank-symmetric-powers), [ML.5/cyclic-base-change-gln](#target-cyclic-base-change-gln), [ML.5/ckpss-generic-transfer](#target-ckpss-generic-transfer), [ML.5/grs-descent](#target-grs-descent), [ML.5/local-descent-mp2n](#target-local-descent-mp2n), [ML.5/automorphic-induction-register](#target-automorphic-induction-register), [ML.5/local-langlands-conjecture-general](#target-local-langlands-conjecture-general), [ML.5/symmetric-power-functoriality-implies-ramanujan](#target-symmetric-power-functoriality-implies-ramanujan), [ML.3/parallel-weight-and-clozel-purity](#target-parallel-weight-and-clozel-purity).

### R53: `PotentialModularityAndCompatibleSystems:R24.5`

C-SYSTEM: A system consists of one number field, coefficient field, rank and finite bad set; actual continuous semisimple r_λ; monic Q_v and Hodge multisets. For each λ, r_λ is unramified away from the bad set and residue characteristic and has Frobenius characteristic polynomial equal to Q_v through the specified coefficient embedding. Purity constrains the roots of those same Q_v under every complex embedding. Symmetric powers, tensors, duals, twists, restriction and direct sums are the operations on r_λ and determine the new Q_v, rank, Hodge multiset and pairing; a constituent decomposition is an actual isomorphism at every λ. Strict compatibility additionally supplies coherent ramified WD and real-sign data. The L-function is the Euler product of these Q_v, with the reciprocal conversion above, and its conductor/gamma/epsilon factors use those WD and real data. For a cohomological Dwork fibre, good-place comparison identifies only the global semisimplification. Match coefficient embeddings; require semisimplicity separately before transferring a maximal local monodromy block.

Required by: [ML.0/compatible-system-archimedean-factors](#target-compatible-system-archimedean-factors), [ML.3/completed-symmetric-power-l-function](#target-completed-symmetric-power-l-function), [ML.2/patrikis-taylor-potential-automorphy](#target-patrikis-taylor-potential-automorphy), [ML.2/patrikis-taylor-l-function-consequences](#target-patrikis-taylor-l-function-consequences), [ML.2/p-r-switch](#target-p-r-switch), [ML.3/acc-elliptic-symmetric-powers](#target-acc-elliptic-symmetric-powers), [ML.3/purity-from-symmetric-powers](#target-purity-from-symmetric-powers), [ML.2/potential-ordinary-automorphy](#target-potential-ordinary-automorphy), [ML.2/potential-automorphy-theorem](#target-potential-automorphy-theorem), [ML.2/potential-automorphy-totally-real](#target-potential-automorphy-totally-real), [ML.2/potential-automorphy-mod-l](#target-potential-automorphy-mod-l), [ML.2/compatible-systems-potentially-automorphic](#target-compatible-systems-potentially-automorphic), [ML.2/compatible-system-l-function-continuation](#target-compatible-system-l-function-continuation), [ML.2/multiple-product-l-functions](#target-multiple-product-l-functions), [ML.2/constituents-potentially-automorphic](#target-constituents-potentially-automorphic), [ML.2/part-of-compatible-system](#target-part-of-compatible-system), [ML.2/irreducibility-density-one](#target-irreducibility-density-one), [ML.2/decomposition-into-irreducible-systems](#target-decomposition-into-irreducible-systems), [ML.3/accessible-regular-refinement](#target-accessible-regular-refinement), [ML.3/eigenvariety-propagation](#target-eigenvariety-propagation), [ML.3/buzzard-kilford-eigencurve](#target-buzzard-kilford-eigencurve), [ML.3/level-one-ping-pong](#target-level-one-ping-pong), [ML.3/steinberg-level-raising](#target-steinberg-level-raising), [ML.3/one-level-one-symmetric-power](#target-one-level-one-symmetric-power), [ML.3/level-one-symmetric-powers](#target-level-one-symmetric-powers), [ML.3/n-regular-congruences](#target-n-regular-congruences), [ML.3/non-supercuspidal-symmetric-powers](#target-non-supercuspidal-symmetric-powers), [ML.3/symmetric-power-automorphy-lifting](#target-symmetric-power-automorphy-lifting), [ML.3/non-cm-symmetric-powers](#target-non-cm-symmetric-powers), [ML.3/cm-and-weight-one-symmetric-powers](#target-cm-and-weight-one-symmetric-powers), [ML.2/qian-auxiliary-prime](#target-qian-auxiliary-prime), [ML.2/elliptic-symmetric-power-seed](#target-elliptic-symmetric-power-seed), [ML.2/dwork-fibre-automorphy-transport](#target-dwork-fibre-automorphy-transport), [ML.2/steinberg-ordinarity-lemma](#target-steinberg-ordinarity-lemma), [ML.2/galois-ordinarity-from-automorphic](#target-galois-ordinarity-from-automorphic), [ML.2/acc-symplectic-potential-automorphy](#target-acc-symplectic-potential-automorphy), [ML.2/acc-auxiliary-primes](#target-acc-auxiliary-primes), [ML.2/potential-automorphy-with-steinberg-place](#target-potential-automorphy-with-steinberg-place), [ML.2/compatible-system-from-potential-automorphy](#target-compatible-system-from-potential-automorphy), [ML.2/cg18-conditional-potential-modularity](#target-cg18-conditional-potential-modularity), [ML.2/cg18-odd-symmetric-powers](#target-cg18-odd-symmetric-powers), [ML.2/potential-weak-automorphy-symmetric-powers](#target-potential-weak-automorphy-symmetric-powers), [ML.3/bcgnt-potential-automorphy-det-cyclotomic](#target-bcgnt-potential-automorphy-det-cyclotomic), [ML.3/one-prime-criterion](#target-one-prime-criterion), [ML.3/clozel-thorne-reductions](#target-clozel-thorne-reductions), [ML.3/all-regular-symmetric-powers](#target-all-regular-symmetric-powers), [ML.3/hilbert-symmetric-powers](#target-hilbert-symmetric-powers), [ML.3/cm-field-symmetric-powers](#target-cm-field-symmetric-powers), [ML.3/sym6-sym8](#target-sym6-sym8), [ML.3/symmetric-powers-up-to-eight](#target-symmetric-powers-up-to-eight), [ML.3/large-residual-image-density-one](#target-large-residual-image-density-one), [ML.3/nt21-semistable-l-functions](#target-nt21-semistable-l-functions), [ML.3/acc-purity-rank-two](#target-acc-purity-rank-two), [ML.3/bcgnt-symmetric-powers-purity](#target-bcgnt-symmetric-powers-purity), [ML.3/bianchi-ramanujan](#target-bianchi-ramanujan), [ML.3/bianchi-fourier-ramanujan](#target-bianchi-fourier-ramanujan), [ML.3/bianchi-parabolic-cohomology-ramanujan](#target-bianchi-parabolic-cohomology-ramanujan), [ML.3/bianchi-mass-equidistribution](#target-bianchi-mass-equidistribution), [ML.3/cg18-conditional-sato-tate](#target-cg18-conditional-sato-tate).

### R54: `AnalyticNumberTheory:AN.4`

C-ARTIN: The full Artin L-function is constructed from the same finite-image continuous complex representation: finite local factors are the determinants on inertia invariants, with the specified Frobenius, and infinity factors use its complex-conjugation eigenspaces. Strong Artin matching supplies local parameters and all these factors at every place; weak almost-everywhere matching supplies only a partial product. Twists, direct sums and automorphic comparisons commute with these constructions. Entireness excludes the trivial rank-one representation.

Required by: [ML.1/strong-artin-conjecture](#target-strong-artin-conjecture), [ML.5/global-langlands-reciprocity-conjecture](#target-global-langlands-reciprocity-conjecture), [ML.1/totally-real-odd-artin](#target-totally-real-odd-artin), [ML.1/irregular-systems-weight-one](#target-irregular-systems-weight-one), [ML.1/odd-artin-modularity-over-q](#target-odd-artin-modularity-over-q), [ML.1/non-solvable-residual-modularity](#target-non-solvable-residual-modularity), [ML.1/buzzard-taylor-hypotheses](#target-buzzard-taylor-hypotheses), [ML.1/weight-one-separation-register](#target-weight-one-separation-register), [ML.3/gelbart-jacquet](#target-gelbart-jacquet), [ML.3/kim-shahidi-sym3](#target-kim-shahidi-sym3), [ML.3/kim-sym4](#target-kim-sym4), [ML.3/ramakrishnan-tensor-product](#target-ramakrishnan-tensor-product), [ML.3/low-rank-symmetric-powers](#target-low-rank-symmetric-powers).

### R55: `PotentialAutomorphyInfrastructure:PA.4`

C-LOCAL-DEFORMATION: The component-connects relation compares lifts of the same local residual representation, determinant and Hodge type in the actual generic fibre of its deformation ring. Ordinary and potentially diagonalizable predicates apply to the same continuous local representation and filtration/crystalline module. BCGNT 3.2.1 must export the specialized connects ALT used twice in 6.2.3, preserving all seventeen auxiliary-system conditions and the subsequent cyclic untensoring/descent. PA.4 ordinary/Fontaine–Laffaille endpoints alone do not imply this, nor Caraiani–Newton 1.3 or CG18 5.16.

Required by: [ML.2/p-r-switch](#target-p-r-switch), [ML.2/pd-lifts-with-local-conditions](#target-pd-lifts-with-local-conditions), [ML.2/change-of-weight-and-level](#target-change-of-weight-and-level), [ML.2/qian-ordinary-potential-automorphy](#target-qian-ordinary-potential-automorphy), [ML.1/imaginary-quadratic-elliptic-modularity](#target-imaginary-quadratic-elliptic-modularity), [ML.2/potential-ordinary-automorphy](#target-potential-ordinary-automorphy), [ML.2/potential-automorphy-theorem](#target-potential-automorphy-theorem), [ML.2/potential-automorphy-totally-real](#target-potential-automorphy-totally-real), [ML.2/potential-automorphy-mod-l](#target-potential-automorphy-mod-l), [ML.2/compatible-systems-potentially-automorphic](#target-compatible-systems-potentially-automorphic), [ML.2/compatible-system-l-function-continuation](#target-compatible-system-l-function-continuation), [ML.2/multiple-product-l-functions](#target-multiple-product-l-functions), [ML.2/constituents-potentially-automorphic](#target-constituents-potentially-automorphic), [ML.2/part-of-compatible-system](#target-part-of-compatible-system), [ML.2/irreducibility-density-one](#target-irreducibility-density-one), [ML.2/decomposition-into-irreducible-systems](#target-decomposition-into-irreducible-systems), [ML.2/qian-auxiliary-prime](#target-qian-auxiliary-prime), [ML.2/elliptic-symmetric-power-seed](#target-elliptic-symmetric-power-seed), [ML.2/dwork-fibre-automorphy-transport](#target-dwork-fibre-automorphy-transport), [ML.2/steinberg-ordinarity-lemma](#target-steinberg-ordinarity-lemma), [ML.2/galois-ordinarity-from-automorphic](#target-galois-ordinarity-from-automorphic), [ML.2/acc-symplectic-potential-automorphy](#target-acc-symplectic-potential-automorphy), [ML.2/acc-auxiliary-primes](#target-acc-auxiliary-primes), [ML.2/potential-automorphy-with-steinberg-place](#target-potential-automorphy-with-steinberg-place), [ML.2/compatible-system-from-potential-automorphy](#target-compatible-system-from-potential-automorphy), [ML.2/cg18-conditional-potential-modularity](#target-cg18-conditional-potential-modularity), [ML.2/cg18-odd-symmetric-powers](#target-cg18-odd-symmetric-powers), [ML.2/potential-weak-automorphy-symmetric-powers](#target-potential-weak-automorphy-symmetric-powers).

### R56: `PotentialModularityAndCompatibleSystems:R23.1`

C-MODULI: Moret–Bailly uses a smooth geometrically connected scheme over an actual number field; local open subsets of its base changes; and a returned point whose images lie in those opens under the returned field embeddings and completion isomorphisms. The extension has the stated Galois, disjointness and local properties. The twisted modular curve is descended from full level via the actual E[q] Galois cocycle, with Weil-pairing multiplier ε̄, and its points represent symplectic isomorphisms of the specified torsion modules.

Required by: [ML.2/moret-bailly-galois-control](#target-moret-bailly-galois-control), [ML.2/twisted-modular-curve](#target-twisted-modular-curve), [ML.2/qian-residual-potential-automorphy](#target-qian-residual-potential-automorphy).

### R57: `EndoscopicTransferAndUnitaryTraceComparison:ET.3`

C-ARTHUR: Actual admissible L/Arthur homomorphisms into the specified L-group; centralizers and component-group quotients derived from those homomorphisms; finite local packet multisets with retained repetitions; Whittaker/inner-twist pairings; global restricted products and multiplicities as natural numbers. Orthogonal parameters satisfy the determinant-one relation before quotienting by the centre. Refined endoscopic character identities and global multiplicity formulas refer to these packets. Unknown weighted/twisted orbital-integral and stabilization hypotheses must be stated by the constructive Part II, with its exact test-function normalizations and local scope. Until then their conditional classification signatures are omitted, not encoded as ArthurInputs. KMSW 2014 generic pure-inner scope and its two nongeneric local inputs are kept distinct. Mœglin–Renard membership uses the two explicit branches stated at its node, not a CaseI field.

Required by: [ML.4/global-arthur-parameter](#target-global-arthur-parameter), [ML.4/extended-langlands-parameter](#target-extended-langlands-parameter), [ML.4/local-arthur-packets](#target-local-arthur-packets), [ML.4/arthur-multiplicity-formula](#target-arthur-multiplicity-formula), [ML.4/mok-unitary-classification](#target-mok-unitary-classification), [ML.4/kmsw-inner-forms](#target-kmsw-inner-forms), [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate), [ML.4/trace-formula-inputs-register](#target-trace-formula-inputs-register), [ML.4/moeglin-renard-packets](#target-moeglin-renard-packets), [ML.0/regular-weight-serre-implies-abelian-surface-modularity](#target-regular-weight-serre-implies-abelian-surface-modularity), [ML.4/symplectic-branch-status](#target-symplectic-branch-status), [ML.4/vogan-packets-so-v](#target-vogan-packets-so-v), [ML.4/amf-nonsplit-so-v](#target-amf-nonsplit-so-v), [ML.4/packet-member-irreducibility](#target-packet-member-irreducibility), [ML.4/generic-packets-standard-modules](#target-generic-packets-standard-modules), [ML.4/gan-takeda-llc-gsp4](#target-gan-takeda-llc-gsp4), [ML.4/gsp4-arthur-classification](#target-gsp4-arthur-classification), [ML.4/non-general-type-reducible](#target-non-general-type-reducible), [ML.4/gl4-symplectic-descent](#target-gl4-symplectic-descent), [ML.4/shahidi-exterior-square](#target-shahidi-exterior-square), [ML.4/gsp4-archimedean-limit-packets](#target-gsp4-archimedean-limit-packets), [ML.4/limit-discrete-series-packet-types](#target-limit-discrete-series-packet-types), [ML.4/gsp4-gl4-archimedean-transfer](#target-gsp4-gl4-archimedean-transfer), [ML.4/unitary-descent-of-gl4-transfer](#target-unitary-descent-of-gl4-transfer), [ML.4/xu-gsp2n-packets](#target-xu-gsp2n-packets), [ML.4/xu-multiplicity-formula](#target-xu-multiplicity-formula), [ML.4/adams-johnson-packets](#target-adams-johnson-packets).

### R58: `AutomorphicFormsOnReductiveGroups:AF.4`

C-COHERENT-GEOMETRY: The actual coherent cohomology eigensystem and attached GSp₄ Galois representation, with a number-field action on an actual abelian variety and its H¹ eigenspaces, are required for the two frontier predicates. The Hodge list is prototyped independently and does not prove the expected de Rham/crystalline claims. For Bianchi forms use actual Fourier coefficients, Hecke eigensystems and the Harder parabolic-cohomology comparison, not unrelated coefficient functions.

Required by: [ML.0/weight-22-abelian-variety-conjecture](#target-weight-22-abelian-variety-conjecture), [ML.0/expected-crystallinity-newton-above-hodge](#target-expected-crystallinity-newton-above-hodge), [ML.3/bianchi-modular-forms](#target-bianchi-modular-forms), [ML.3/parallel-weight-and-clozel-purity](#target-parallel-weight-and-clozel-purity).

### R59: [RepresentationTheory/CompactGroups](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md#layer-6-characters-of-compact-groups)

C-EQUIDISTRIBUTION: Compact-group characters and Haar probability are supplied by the existing CompactGroups roadmap, including its separate SU₂ symmetric-power classification and class-function completeness. Frobenius classes are the normalized semisimple classes of the same pure Galois realization. The norm is the actual number-field norm and multiplicity is bounded at each norm. The analytic criterion consumes Euler products of those classes with continuation and boundary nonvanishing for every nontrivial irreducible character; free classes/functions cannot supply equidistribution.

Required by: [ML.3/sato-tate-group](#target-sato-tate-group), [ML.3/l-function-equidistribution-criterion](#target-l-function-equidistribution-criterion), [ML.3/serre-equidistribution-criterion](#target-serre-equidistribution-criterion), [ML.3/sato-tate-elliptic-curves](#target-sato-tate-elliptic-curves), [ML.3/bianchi-sato-tate](#target-bianchi-sato-tate).

### R60: `ExcursionOperatorsAndSpectralAction:ES5`

C-CATEGORICAL: Stable ∞-categories D_lis(Bun_G,Λ), Perf and Ind Perf of the actual parameter stack, compact objects, bounded coherent objects with quasicompact and nilpotent singular support, the spectral action on the specified Whittaker sheaf and its canonical colimit extension/right adjoint. These are needed to state FS I.10.2. An ordinary category/functor or a semisimple parameter function is not a substitute. The existing ES5 parameter map supplies only the semisimple specialization. Zou’s torus theorem also needs the stable/condensed group-homology and character-gerbe constructions, as a specific extension of the geometrisation owner.

Required by: [ML.5/categorical-local-langlands-conjecture](#target-categorical-local-langlands-conjecture).

### R61: `AutomorphicFormsOnReductiveGroups:AF.1`

Export the complete Adams–Johnson parameter definition, cohomological induction A_𝔮(λ), standard-module resolutions and the Whittaker-normalized stable/twisted character maps needed by AMR Theorem 1.1. AMR §8.1 supplies necessary consequences only.

Proposed owner: AutomorphicFormsOnReductiveGroups, Part II: Real packets and cohomological induction.

Required by: [ML.4/adams-johnson-packets](#target-adams-johnson-packets).

## Exact unresolved inputs

These inputs prevent closure; they are explicit terminal gaps in the target-level plan. Each consumer is named so that the corresponding supplier theorem can replace the gap without changing unrelated targets.

### G1: Remaining BLGGT citations

Clozel 1990 Theorem 3.13 (independence of ı), Harris–Shepherd-Barron–Taylor 2010 Theorem 4.2 (the Brauer argument for L-functions), Taylor 2012 (the parity statement of Corollary 5.4.3(3)) and Caraiani 2012a,b (purity) are cited from BLGGT and not read.

Required by: [ML.2/compatible-system-l-function-continuation](#target-compatible-system-l-function-continuation), [ML.2/irreducibility-density-one](#target-irreducibility-density-one), [ML.2/part-of-compatible-system](#target-part-of-compatible-system).

### G2: Newton–Thorne proofs are recorded at statement level

The proofs of NT I Theorems 2.24/2.33 (infinitesimal R = T on eigenvarieties, using Newton–Thorne 2020 on adjoint Bloch–Kato Selmer groups), 4.1 (depth-zero types), 5.2, 6.1 (Allen–Newton–Thorne residually reducible R_p = T_p), 7.1, 8.3 and NT II §§2–3 (patching with pseudodeformation rings; seasoned good-dihedral forms) are summarised from the introductions and statements, not decomposed. Cited and unread: Buzzard–Kilford 2005, Anastassiades–Thorne 2021, Allen–Newton–Thorne 2020, Newton–Thorne 2020, Kim 2004.

Required by: [ML.3/eigenvariety-propagation](#target-eigenvariety-propagation), [ML.3/steinberg-level-raising](#target-steinberg-level-raising), [ML.3/one-level-one-symmetric-power](#target-one-level-one-symmetric-power), [ML.3/n-regular-congruences](#target-n-regular-congruences), [ML.3/symmetric-power-automorphy-lifting](#target-symmetric-power-automorphy-lifting), [ML.3/non-cm-symmetric-powers](#target-non-cm-symmetric-powers).

### G3: The unitary method owner needs its classification inputs

The retained Steinberg node is an import contract to SymmetricPowersByUnitaryLevelRaising. That owner must import Mok, KMSW and the local packets with their exact field, parameter and conditional scopes. The endpoint packet does not create an opposite stage edge and reconstruct the method internally.

Required by: [ML.3/steinberg-level-raising](#target-steinberg-level-raising).

### G4: Arthur's endoscopic classification is an external conditional input

No roadmap plans the proofs of Arthur 2013 (Chapters 2–8), Mok 2015, KMSW 2014, Gee–Taïbi 2019, Xu or Ishimoto: the stabilisation of the twisted trace formula (Mœglin–Waldspurger 2016), the local intertwining relation (Arthur [A25]–[A27], proved by Atobe–Gan–Ichino–Kaletha–Mínguez–Shin), and the twisted weighted fundamental lemma (Mœglin–Waldspurger II.4.4; the weighted fundamental lemma for Lie algebras of non-split groups and its non-standard version have no written proof). The ML.4 nodes state the results with this status (ML.0/arthur-dependency-gate); restructure proposal 2 asks for a constructive owner.

Required by: [ML.4/local-arthur-packets](#target-local-arthur-packets), [ML.4/arthur-multiplicity-formula](#target-arthur-multiplicity-formula), [ML.4/mok-unitary-classification](#target-mok-unitary-classification), [ML.4/kmsw-inner-forms](#target-kmsw-inner-forms), [ML.4/gsp4-arthur-classification](#target-gsp4-arthur-classification), [ML.4/xu-gsp2n-packets](#target-xu-gsp2n-packets), [ML.4/amf-nonsplit-so-v](#target-amf-nonsplit-so-v).

### G5: Newton–Thorne and Clozel–Thorne methods are owned by proposed Part IIs

The level-raising, eigenvariety and tensor-functoriality arguments of Newton–Thorne 2021/2026 and Clozel–Thorne III (§§3–5 of NT26, Theorem 6.2 of CT17) are routed to the proposed Part IIs SymmetricPowersByUnitaryLevelRaising, SymmetricPowersByAnalyticContinuation, SymmetricPowerAutomorphyLifting and SymmetricPowersByTensorFunctorialityLifting (pending DESIGN-ModularityAndLanglandsExtensionsPartII); ML.3 cites them.

Required by: [ML.3/all-regular-symmetric-powers](#target-all-regular-symmetric-powers), [ML.3/sym6-sym8](#target-sym6-sym8), [ML.3/clozel-thorne-reductions](#target-clozel-thorne-reductions).

### G6: Dwork, open-image and Conjecture B extensions require their requested owners

The Dwork family's Hodge numbers, monodromy and the switching theorem (proposed PotentialAutomorphyDworkMotivesPartII), Serre's open image and supersingular-prime theorems (proposed OpenImageTheoremsForAbelianVarieties), and Calegari–Geraghty's Conjecture B with their Theorem 5.16 (proposed PotentialAutomorphyInfrastructure Part II) are not roadmaps yet; cited, not planned.

Required by: [ML.2/cg18-odd-symmetric-powers](#target-cg18-odd-symmetric-powers), [ML.2/cg18-conditional-potential-modularity](#target-cg18-conditional-potential-modularity), [ML.2/qian-auxiliary-prime](#target-qian-auxiliary-prime), [ML.2/qian-residual-potential-automorphy](#target-qian-residual-potential-automorphy).

### G7: Caraiani–Newton's lifting theorem and modular-curve analysis

Caraiani–Newton Theorem 1.3 (the exact CM potentially semistable lifting theorem, with its residual and local conditions), Allen–Khare–Thorne residual modularity and the analysis of F-points of X₀(15) and related curves are not planned anywhere; the node records the statements only.

Required by: [ML.1/imaginary-quadratic-elliptic-modularity](#target-imaginary-quadratic-elliptic-modularity).

### G8: Secondary-only sources

Still read through cited primary endpoints only: Khare 1997 weight-one descent, Blasius–Harris–Ramakrishnan Proposition 5.3.7, Schmidt 2017/2018, Kim–Shahidi Duke 2002 and Henniart 2009. Pilloni–Stroh, Snowden, Gan–Takeda, Patrikis–Taylor, Arancibia–Mœglin–Renard, Mœglin–Renard and Zou are now checked directly at the locators recorded in sources. The refused AMS downloads of Arthur 2003 and Kim 2003 do not count as reading those primary PDFs.

Required by: [ML.4/gsp4-archimedean-limit-packets](#target-gsp4-archimedean-limit-packets), [ML.4/limit-discrete-series-packet-types](#target-limit-discrete-series-packet-types), [ML.3/kim-shahidi-sym3](#target-kim-shahidi-sym3).

### G9: Missing typed suppliers: signatures omitted rather than simulated

All Context/GaloisData/CompatibleSystemData/ArtinData/G5Context/CategoricalContext and ArthurInputs/TraceFormulaInputs/kmswHypotheses/CaseI records are removed from Suggested. Their failed signatures are not declared. Each node records an omission and the exact semantic supplier contract; every proposed name, API and test remains a mathematical specification in the reader and the commented manifest. Only statements on actual pinned objects are elaborated. Refinement must obtain the listed supplier types and operations, then state the omitted contracts with all their hypotheses; an elaborated proxy is not an acceptable substitute.

Required by: [ML.0/blggt-normalization-register](#target-blggt-normalization-register), [ML.3/symmetric-power-lifting](#target-symmetric-power-lifting), [ML.3/accessible-regular-refinement](#target-accessible-regular-refinement), [ML.0/arthur-dependency-gate](#target-arthur-dependency-gate), [ML.0/archimedean-langlands-conventions](#target-archimedean-langlands-conventions), [ML.0/compatible-system-archimedean-factors](#target-compatible-system-archimedean-factors), [ML.0/nt26-automorphy-predicate](#target-nt26-automorphy-predicate), [ML.0/nt26-normalisation-bridge](#target-nt26-normalisation-bridge), [ML.0/gsp4-galois-l-packet](#target-gsp4-galois-l-packet), [ML.0/weight-22-abelian-variety-conjecture](#target-weight-22-abelian-variety-conjecture), [ML.0/expected-crystallinity-newton-above-hodge](#target-expected-crystallinity-newton-above-hodge), [ML.1/strong-artin-conjecture](#target-strong-artin-conjecture), [ML.1/odd-artin-modularity-over-q](#target-odd-artin-modularity-over-q), [ML.1/weight-one-separation-register](#target-weight-one-separation-register), [ML.2/twisted-modular-curve](#target-twisted-modular-curve), [ML.3/symmetric-power-lift-over-number-fields](#target-symmetric-power-lift-over-number-fields), [ML.3/sp-statement](#target-sp-statement), [ML.3/completed-symmetric-power-l-function](#target-completed-symmetric-power-l-function), [ML.3/parallel-weight-and-clozel-purity](#target-parallel-weight-and-clozel-purity), [ML.3/sato-tate-group](#target-sato-tate-group), [ML.3/bianchi-modular-forms](#target-bianchi-modular-forms), [ML.4/self-dual-cuspidal-type](#target-self-dual-cuspidal-type), [ML.4/global-arthur-parameter](#target-global-arthur-parameter), [ML.4/extended-langlands-parameter](#target-extended-langlands-parameter), [ML.4/trace-formula-inputs-register](#target-trace-formula-inputs-register), [ML.4/symplectic-branch-status](#target-symplectic-branch-status), [ML.4/gsp4-discrete-spectrum-types](#target-gsp4-discrete-spectrum-types), [ML.3/functorial-lift](#target-functorial-lift), [ML.5/cyclic-base-change-gln](#target-cyclic-base-change-gln), [ML.5/automorphic-induction-register](#target-automorphic-induction-register), [ML.5/functoriality-conjecture](#target-functoriality-conjecture), [ML.5/global-langlands-reciprocity-conjecture](#target-global-langlands-reciprocity-conjecture), [ML.5/local-langlands-conjecture-general](#target-local-langlands-conjecture-general), [ML.5/categorical-local-langlands-conjecture](#target-categorical-local-langlands-conjecture).

### G10: Exact NT/Mok/FS/ACC contracts await their typed carriers

NT image groups and bound are now concretely prototyped; the lifting theorem is an import contract to its method Part II. Mok retains finite packet multisets and repetitions, with multiplicity one only for generic parameters. FS records its specified stable ∞-category adjunction and compact/coherent equivalence, with the torus case checked in Zou. ACC infinity and full-place comparisons have distinct hypotheses. The remaining missing carriers, listed per node, are reasons to omit the signatures, not to weaken their mathematics.

Required by: [ML.3/symmetric-power-automorphy-lifting](#target-symmetric-power-automorphy-lifting), [ML.4/mok-unitary-classification](#target-mok-unitary-classification), [ML.5/categorical-local-langlands-conjecture](#target-categorical-local-langlands-conjecture), [ML.0/compatible-system-automorphic-l-function-comparison](#target-compatible-system-automorphic-l-function-comparison).

### G11: Patrikis–Taylor constituent export is requested from the system owner

The primary Lemma 1.6 and Theorem 2.1 have been read. Their regular, pure, polarized constituent decomposition differs from BLGGT extreme regularity. R24.5 must export the actual constituent systems and common extension; the full direct sum is isobaric, not necessarily cuspidal.

Required by: [ML.2/patrikis-taylor-potential-automorphy](#target-patrikis-taylor-potential-automorphy), [ML.2/patrikis-taylor-l-function-consequences](#target-patrikis-taylor-l-function-consequences).

### G12: Global stage order needs fine supplier inputs

The local node graph is reordered by explicit parent-stage placements: GSp₄ consumers in ML.4, ACC elliptic seed in ML.2, early low-rank transfers in ML.1. Method proofs are imported from their reviewed Part II owners instead of copied locally. Atlas edges and PA.4’s coarse ML.1 input still require the stated restructuring; local topological order is evidence only for this packet, not for the assembled atlas. No global acyclicity claim is made.

Required by: [ML.0/gsp4-galois-l-packet](#target-gsp4-galois-l-packet), [ML.2/elliptic-symmetric-power-seed](#target-elliptic-symmetric-power-seed), [ML.3/steinberg-level-raising](#target-steinberg-level-raising), [ML.1/imaginary-quadratic-elliptic-modularity](#target-imaginary-quadratic-elliptic-modularity).

### G13: Coarse supplier extensions require exact exports

Exact stage statements read: AL.4 is unramified L-group factors, not Langlands–Shahidi analytic continuation; ALS.3 is Hecke chain correspondences, not Harder Eichler–Shimura; R19.2 is cohomological Hilbert Galois realization, not all parallel weight-one forms; MP.3 elementary theta does not include full Howe duality; ET.3 ordinary/nonstandard transfer does not include the full weighted/twisted lemma. Their requests now state these as missing extensions rather than existing supplier theorems. R22.5 is the lifting direction, but its required Hilbert-field form still needs an exact export.

Required by: [ML.4/shahidi-exterior-square](#target-shahidi-exterior-square), [ML.3/kim-shahidi-sym3](#target-kim-shahidi-sym3), [ML.3/bianchi-modular-forms](#target-bianchi-modular-forms), [ML.1/totally-real-odd-artin](#target-totally-real-odd-artin), [ML.4/gan-takeda-llc-gsp4](#target-gan-takeda-llc-gsp4), [ML.4/trace-formula-inputs-register](#target-trace-formula-inputs-register).

### G14: Full Adams–Johnson parameter definition

AMR §8.1, manuscript p. 31, expressly lists only consequences of AJ87’s conditions. Read a cleared primary statement of the complete conditions and construct its AF.1 carrier; do not define Adams–Johnson by the regular-integral and Levi consequences alone.

Required by: [ML.4/adams-johnson-packets](#target-adams-johnson-packets).

## Source corrections and editions

All mathematical statements above are paraphrases with locators. The edition and locator identify what was read; they do not assert that an unavailable journal text was collated. The packet records hashes and reading provenance. Unread primary inputs remain gaps. Rejected source-error allegations are retained as decisions and are not used to change a theorem.

### E1: confirmed

Source: [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), arXiv v4, §2.1, p. 32, definition of polarized automorphic representations.

Replace the undefined µ by χ; for the operative CM pure-weight-w normalization use χ_v(−1)=(−1)^{n+w} (canonical inherited AG2/E2), not the unqualified printed rank-only sign.

The µ/χ variable slip is present on p.32. It duplicates canonical AG2/E1, not a new independent erratum. The sign itself must also use weight n+w as in inherited AG2/E2; replacing µ alone is insufficient.

### E2: confirmed

Source: [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), arXiv v4, §4.5, Theorem 4.5.1, its remark and proof, and Corollary 4.5.3, pp. 59–61.

Read: each prime v of F above l_i (r_i is a representation of G_F); Lemma 1.4.3(2) (the Fontaine–Laffaille criterion; Lemma 1.4.2 lifts filtered modules); unramified above l_i; HT_τ(ρ_{i,v}) has n_i distinct elements; ∼ ρ_{i,v}|_{G_{F′_u}}.

Read pp.59–61: index, field-prime and lemma-reference slips are present. The interval remark also requires l_i rather than an unindexed l.

### E3: confirmed

Source: [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), arXiv v4, §4.4, Theorem 4.4.1, pp. 58–59.

ρ_v is a lift of r̄|_{G_{F_ṽ}}.

Theorem 4.4.1 begins with r̄ and only produces π later, so the printed residual attachment to π is premature.

### E4: confirmed

Source: [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Chapter 24, §24.4, printed p. 134, paragraph after Conjecture 24.4.

E has CM when End_{K̄}(E) is larger than ℤ. The printed condition is geometric non-CM.

Printed p.134 reverses CM and non-CM. State the correction geometrically: End_{K̄}(E)≠ℤ, not End_K(E)≠ℤ.

### E5: confirmed

Source: [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Chapter 24, §24.5, Theorem 24.6 and the preceding sentence, printed p. 135.

For Sym^n H¹ the abscissa is Re s>1+n/2. Boundary nonvanishing requires an analytic theorem, not absolute convergence on the open half-plane. Entireness is now known for non-CM E and n≥1; n=0 has a zeta pole. The historical CHSBT attribution must be distinguished from the later NT theorem.

The abscissa 3/2 is only the n=1 case, and convergence alone does not prove nonvanishing on the boundary. Current entireness is true for n≥1 non-CM curves by NT, but the historical attribution is inaccurate; n=0 has a zeta pole. Distinguish this from the reciprocal-root error E15.

### E6: confirmed

Source: [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Chapter 24, Conjecture 24.3, printed p. 134.

at most c values of i with N(x_i) = n (bounded multiplicity of each norm).

Conjecture 24.3 needs a uniform bound on the number of occurrences of each norm n; N(x_i)≤c is a misprint.

### E7: rejected

Source: [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), §2.9, definition of 'general type', p. 38 (arXiv:1812.09269v3).

The allegation is rejected; use the source-qualified statement above.

Using rec_GT for the archimedean packet is standard implicit extension of notation, not an established mathematical gap in BCGP. The blueprint must nevertheless distinguish finite Gan–Takeda LLC from archimedean Langlands classification.

### E8: confirmed

Source: [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Proof of Lemma 2.9.1, case (b), p. 39 (arXiv:1812.09269v3).

with central character ω_π

The undefined µ_π on p.39 should denote the central character ω_π used in adjacent cases.

### E9: confirmed

Source: [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), Remark 9.3.2, p. 259 (arXiv:1812.09269v3).

Since the 4-dimensional Galois representations H¹(A, ℚ_l) are generalized symplectic

Remark 9.3.2 p.259 has the extra word four; there is one rank-four representation for each l.

### E10: rejected

Source: [Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](http://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Lemma 6.9, §6.2, Duke Math. J. 169 p. 840 (arXiv:1907.08691v1 p. 30).

The allegation is rejected; use the source-qualified statement above.

The sentence is shorthand, not enough evidence of a paper proof gap. The proposed correction is itself incomplete: an essentially self-dual GL4 representation needs the appropriate algebraic twist/normalization before its CM base change is conjugate self-dual. Restriction must retain absolute irreducibility and the descent classification must be supplied. Record this as a blueprint dependency gap instead.

### E11: confirmed

Source: [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645v1), Proof of Lemma 10.4.1, p. 223 (arXiv:2502.20645v1).

ρ̄_{A,p}(G_{ℚ(ζ_{p^∞})}) ∖ ρ̄_{A,p}(G_{K(ζ_{p^∞})})

Lemma 10.4.1 p.223: the subgroup is G_{K(ζ_{p^∞})}; the printed G in the subscript is a typo.

### E12: confirmed

Source: [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Remark 5.3.2, p. 26 (author version, 17 June 2019).

This last statement is a consequence of the main theorem of [45] if the weight is cohomological.

Remark 5.3.2 p.26 contains a stray is.

### E13: rejected

Source: [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Proof of Theorem 10.1(ii), p. 20 (author copy results.pdf).

The allegation is rejected; use the source-qualified statement above.

KW explicitly announces a sketch and cites Khare 1997. Its omission of the final finite-newform/Chebotarev argument is not an established error in the paper. The blueprint must import the R27.6 descent step, which it does.

### E14: confirmed

Source: [Endoscopic classification of representations of quasi-split unitary groups](https://arxiv.org/pdf/1206.0882), Proposition 8.2.5 (arXiv:1206.0882v5), as reported by Kaletha–Mínguez–Shin–White §1.5, p. 77.

Use Kaletha–Mínguez–Shin–White, arXiv:1409.3731, Appendix A (invariance of R-groups under the Aubert involution for unitary groups).

KMSW p.77 explicitly reports the missing justification and supplies Appendix A. This is a known repaired input, not a still-open proposition.

### E15: confirmed

Source: [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Chapter 24 §24.5, Definition 24.5, printed p.135 (PDF p.151).

For P_n(T)=∏_{j=0}^n(1−α_p^{n−j}ᾱ_p^jT), its roots are the reciprocals of those eigenvalues; alternatively use the monic characteristic polynomial Q_n and the factor q^{(n+1)s}/Q_n(q^s).

Direct degree-one computation and the primary elliptic Euler factors verify the reciprocal-root correction.

### E16: confirmed

Source: [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §5.1, real-place archimedean factors, PDF/printed p.64.

For odd regular rank n, each non-middle Hodge pair contributes complex-conjugation determinant −1. Thus use d±=(n±(−1)^{w/2+(n−1)/2}(det R)(c_v))/2. Equivalently use the appropriately signed trace when a compatible real realization is supplied.

The regular rank-three symmetric-square positive control contradicts the printed sign. R24.5/system-l-functions also needs this correction; its existing E2 handles Hodge signs but does not include this rank-parity factor.

The packet applies, without re-recording them, the confirmed errata of the routed extractions that its nodes use: PAPER-ALLEN-ETAL-23 E3, E51, E101, E103–E107; PAPER-QIAN-23 E1, E2, E7, E36, E40, E41, E43, E45; PAPER-CALEGARI-GERAGHTY-18 E96–E100, E180–E183, E186, E212–E216, E230; PAPER-CALEGARI-GERAGHTY-20 E39, E43, E49, E83; PAPER-PILLONI-20 E26, E161, E163; PAPER-BOXER-CALEGARI-GEE-PILLONI-21 E147, E148; PAPER-BOXER-CALEGARI-GEE-ETAL-25 E13, E26–E30; PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22 E33, E34; PAPER-CLOZEL-THORNE-17 E4, E5; PAPER-NEWTON-THORNE-26 E6–E12; PAPER-GAN-ICHINO-18 E3, E7; PAPER-JIANG-ZHANG-20 E21, E23; PAPER-GAN-SAVIN-23-B E8, E14, E15; PAPER-BOXER-CALEGARI-GEE-25 E8.

### Bibliography

- **blggt-2014-v4**: Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4). arXiv:1010.2561v4 (9 December 2013), 93 pages; published in Ann. of Math. (2) 179 (2014), 501–609 (not collated). Printed page = PDF page.
- **newton-thorne-I**: James Newton and Jack A. Thorne, [Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3). arXiv:1912.11261v3 (27 September 2021), 101 pages; published in Publ. Math. IHÉS 134 (2021), 1–116 (not collated). Printed page = PDF page.
- **newton-thorne-II**: James Newton and Jack A. Thorne, [Symmetric power functoriality for holomorphic modular forms, II](https://arxiv.org/pdf/2009.07180v2). arXiv:2009.07180v2 (27 September 2021), 30 pages; published in Publ. Math. IHÉS 134 (2021), 117–152 (not collated).
- **kedlaya-ant-2025**: Kiran S. Kedlaya, [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf). Author PreTeXt PDF, last modified 21 December 2025, 154 PDF pages.
- **acc-2023**: P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, [Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999). arXiv:1812.09999v2 (16 Jun 2022; latest, the accepted version) / Ann. of Math. 197 (2023), no. 3, 897–1113
- **agikms-2024**: Hiraku Atobe, Wee Teck Gan, Atsushi Ichino, Tasho Kaletha, Alberto Mínguez, Sug Woo Shin, [Local intertwining relations and co-tempered A-packets of classical groups](https://arxiv.org/pdf/2410.13504). arXiv:2410.13504v3 (24 Jul 2026; v1 17 Oct 2024)
- **arthur-2003**: James Arthur, [The principle of functoriality](https://www.ams.org/journals/bull/2003-40-01/S0273-0979-02-00963-1/S0273-0979-02-00963-1.pdf). Bull. Amer. Math. Soc. (N.S.) 40 (2003), no. 1, 39–53 (electronically published 10 October 2002)
- **arthur-2013**: James Arthur, [The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](http://web.archive.org/web/20120511125150id_/http://claymath.org/cw/arthur/pdf/Book.pdf). Book manuscript (pdfTeX, dated 30 May 2011, 535 pp.) formerly posted at claymath.org/cw/arthur/pdf/Book.pdf; published as AMS Colloquium Publications 61 (2013). Wayback Machine snapshot of 11 May 2012.
- **bcg-2025**: George Boxer, Frank Calegari, Toby Gee, [Cuspidal cohomology classes for GL_n(Z)](https://arxiv.org/pdf/2309.15944v3). arXiv:2309.15944v3 (12 Sep 2024); published J. Amer. Math. Soc. 38 (2025) (Remark 2.5 on p. 515 of the journal, per the extraction; not compared)
- **bcgnt-2025**: George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, [The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880). arXiv:2309.15880v3 [math.NT] (27 Mar 2025; latest, post-publication: its §1.5 thanks Dat Pham for a correction to Remark 2.1.1 'of the published version'); published as Forum Math. Pi (2025), doi:10.1017/fmp.2024.29
- **bcgp-2021**: George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3). arXiv:1812.09269v3 (28 Nov 2021, 'Final version (fixing minor typos found in copyediting)', 292 pp.) / Publ. Math. IHÉS 134 (2021), 153–501
- **bcgp-2025**: George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645v1). arXiv:2502.20645v1 (28 Feb 2025; only version)
- **caraiani-newton-2023**: A. Caraiani, J. Newton, [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3). arXiv:2301.10509v3 (27 March 2025)
- **cg-2018**: Frank Calegari, David Geraghty, [Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224). arXiv:1207.4224v2 (16 Jul 2017) / published Invent. Math. 211 (2018) 297–433
- **cg-2020**: Frank Calegari, David Geraghty, [Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](http://www.math.uchicago.edu/~fcale/papers/Siegel.pdf). Duke Math. J. 169 (2020), no. 5, 801–896 (Duke typeset advance-publication copy, 96 pp., paginated 1–96) and arXiv:1907.08691v1 (19 Jul 2019, 60 pp., main text only; the appendix is arXiv:1907.08694v1, not downloaded). NB the task's guess 'arXiv:1609.xxxxx' is wrong: the arXiv number is 1907.08691.
- **chenevier-taibi-2020**: Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf). Publ. Math. IHÉS 131 (2020), 261–323 (open access, published version); arXiv:1907.08783v1
- **ckpss-2004**: J. W. Cogdell, H. H. Kim, I. I. Piatetski-Shapiro, F. Shahidi, [Functoriality for the classical groups](http://www.numdam.org/item/PMIHES_2004__99__163_0.pdf). Publ. Math. IHÉS 99 (2004) 163–233 (Numdam scan with text layer)
- **ct-2017**: L. Clozel, J. A. Thorne, [Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download). Accepted manuscript dated December 10, 2015 (Apollo, Cambridge repository) / Duke Math. J. 166 (2017), no. 2, 325–402; not on arXiv
- **fargues-scholze-2021**: Laurent Fargues, Peter Scholze, [Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v4). arXiv:2102.13459v4 (27 Nov 2024)
- **fkp-2022**: N. Fakhruddin, C. Khare, S. Patrikis, [Lifting and automorphy of reducible mod p Galois representations over global fields](https://arxiv.org/pdf/2008.12593v5). arXiv:2008.12593v5 (15 Oct 2021; final version) / Invent. Math. 228 (2022), 415–492
- **fsy-2022**: J. Fresán, C. Sabbah, J.-D. Yu, [Hodge theory of Kloosterman connections](https://arxiv.org/pdf/1810.06454v5). arXiv:1810.06454v5 (13 Jun 2022) / Duke Math. J. 171 (2022)
- **gan-ichino-2018**: Wee Teck Gan, Atsushi Ichino, [The Shimura–Waldspurger correspondence for Mp_2n](https://arxiv.org/pdf/1705.10106v3). arXiv:1705.10106v3 (3 August 2018); Ann. of Math. (2) 188 (2018), no. 3, 965–1016
- **gan-savin-2023-g2**: Wee Teck Gan, Gordan Savin, [The local Langlands conjecture for G_2](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/the-local-langlands-conjecture-for-dollarg2dollar.pdf). Forum Math. Pi 11 (2023), e28 (open access, CC BY 4.0); arXiv:2209.07346v2 (17 Dec 2022, sha256 025a257e…96decb7) also fetched
- **gee-taibi-2019**: Toby Gee, Olivier Taïbi, [Arthur's multiplicity formula for GSp4 and restriction to Sp4](https://arxiv.org/pdf/1807.03988). arXiv:1807.03988v1 (11 Jul 2018; the only arXiv version) / J. Éc. polytech. Math. 6 (2019), 469–535 (journal version not read)
- **gelbart-jacquet-1978**: Stephen Gelbart, Hervé Jacquet, [A relation between automorphic representations of GL(2) and GL(3)](http://www.numdam.org/item/ASENS_1978_4_11_4_471_0.pdf). Ann. Sci. École Norm. Sup. (4) 11 (1978), no. 4, 471–542 (Numdam scan; OCR text layer is noisy)
- **ichino-prasanna-2023**: Atsushi Ichino, Kartik Prasanna, [Hodge classes and the Jacquet–Langlands correspondence](https://arxiv.org/pdf/1806.10563v2). arXiv:1806.10563v2 (10 July 2023, revised after referee reports); Forum Math. Pi 11 (2023), e22
- **jiang-zhang-2020**: Dihua Jiang, Lei Zhang, [Arthur parameters and cuspidal automorphic modules of classical groups](https://arxiv.org/pdf/1508.03205v4). arXiv:1508.03205v4 (19 November 2019); Ann. of Math. (2) 191 (2020), no. 3, 739–827
- **kim-2003**: Henry H. Kim (Appendix 1 by D. Ramakrishnan; Appendix 2 by H. Kim and P. Sarnak), [Functoriality for the exterior square of GL4 and the symmetric fourth of GL2](https://www.ams.org/journals/jams/2003-16-01/S0894-0347-02-00410-1/S0894-0347-02-00410-1.pdf). J. Amer. Math. Soc. 16 (2003), no. 1, 139–183 (AMS PDF, free)
- **kim-shahidi-2002**: Henry H. Kim, Freydoon Shahidi, [Functorial products for GL2 × GL3 and the symmetric cube for GL2](https://arxiv.org/pdf/math/0409607v1). Ann. of Math. 155 (2002) 837–893; arXiv:math/0409607v1 (30 Sep 2004) = the published text with journal pagination
- **kmsw-2014**: Tasho Kaletha, Alberto Minguez, Sug Woo Shin, Paul-James White, [Endoscopic Classification of Representations: Inner Forms of Unitary Groups](https://arxiv.org/pdf/1409.3731). arXiv:1409.3731v3 (3 December 2014); not published in a journal
- **kss-2021**: Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens, [Endo-parameters for p-adic classical groups](https://arxiv.org/pdf/1611.02667v3). arXiv:1611.02667v3 (31 August 2020); Invent. Math. 223 (2021), no. 2, 597–723
- **kw-2009-I**: Chandrashekhar Khare, Jean-Pierre Wintenberger, [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf). author copy results.pdf (23 pp., PDF created 31 May 2009); published Invent. Math. 178 (2009) 485–504 (not compared)
- **mok-2015**: Chung Pang Mok, [Endoscopic classification of representations of quasi-split unitary groups](https://arxiv.org/pdf/1206.0882). arXiv:1206.0882v5 (22 June 2013); published Mem. Amer. Math. Soc. 235 (2015), no. 1108
- **nt-2026**: James Newton and Jack A. Thorne, [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2). arXiv:2212.03595v2 (19 Feb 2025); published Ann. of Math. 203 (2026)
- **pilloni-2020**: Vincent Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Author's version dated 17 June 2019 (113 pp., post-referee) of Duke Math. J. 169 (2020), no. 9, 1647–1807, doi:10.1215/00127094-2019-0075. There is no arXiv version (the task's 'arXiv:1709.xxxxx' does not exist; earlier versions are HAL hal-01393374 v1–v3). Journal pagination was not checked.
- **qian-2023**: Lie Qian, [Potential automorphy for GL_n](https://arxiv.org/pdf/2104.09761). arXiv:2104.09761v1 (20 Apr 2021; the only arXiv version; p. 1 dated April 19, 2021) / published Invent. Math. 231 (2023) 1239–1275, DOI 10.1007/s00222-022-01161-6 (published PDF not freely downloadable: Springer returns a JavaScript challenge page)
- **qian-thesis-2023**: Lie Qian, [Potential automorphy for general linear groups (PhD dissertation, Stanford University)](https://stacks.stanford.edu/file/druid:yn815wp7042/Thesis%20Final%20Version-augmented.pdf). Stanford PhD thesis, June 2023, 78 pp. ('The majority of the work is published on Inventiones Mathematicae volume 231, pages 1239–1275 (2023)', p. 2 of Ch. 1 text). Numbering X.0.Y: Theorem 1.0.10 = published Thm 1.1 (l odd), Theorem 1.0.13 = Thm 1.4, Lemma 3.0.11 = arXiv-v1 Lemma 3.10(1)–(3), Lemma 3.0.12 / Remark 3.0.13 ≈ published Lemma 3.12 / Remark 3.13, Proposition 4.0.1 = Prop. 4.1, Lemma 4.0.3 / Remark 4.0.4 ≈ published Lemma 4.3 / Remark 4.4 (wording matches the published text quoted in E1, E41, E43, E45).
- **ramakrishnan-2000**: Dinakar Ramakrishnan, [Modularity of the Rankin–Selberg L-series, and multiplicity one for SL(2)](https://arxiv.org/pdf/math/0007203v1). Ann. of Math. 152 (2000) 45–111; arXiv:math/0007203v1 (1 Jul 2000) with the Annals pagination
- **dmw-2009**: Neil Dummigan, Phil Martin and Mark Watkins, [Euler Factors and Local Root Numbers for Symmetric Powers of Elliptic Curves](https://archive.intlpress.com/site/pub/files/_fulltext/journals/pamq/2009/0005/0004/PAMQ-2009-0005-0004-a005.pdf). Pure Appl. Math. Q. 5 (2009), 1311–1341; public journal PDF, 31 pages.
- **martin-watkins-2006**: Phil Martin and Mark Watkins, [Symmetric powers of elliptic curve L-functions](https://magma.maths.usyd.edu.au/~watkins/papers/antsVII.pdf). Public author PDF, 15 pages; ANTS VII (2006).
- **pilloni-stroh-2016**: Vincent Pilloni and Benoît Stroh, [Surconvergence, ramification et modularité](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Artinfinal.pdf). Author final manuscript, published Astérisque 382 (2016), pp. 195–266; manuscript pagination used
- **snowden-2009**: Andrew Snowden, [On two dimensional weight two odd representations of totally real fields](https://arxiv.org/pdf/0905.4266). arXiv:0905.4266, downloaded edition dated May 26, 2009
- **moeglin-renard-2018**: Colette Mœglin and David Renard, [Sur les paquets d’Arthur de Sp(2n,R) contenant des modules unitaires de plus haut poids, scalaires](https://arxiv.org/pdf/1802.04611v4). arXiv:1802.04611v4, 30 January 2019
- **amr-2018**: Nicolas Arancibia, Colette Mœglin and David Renard, [Paquets d’Arthur des groupes classiques et unitaires](https://arxiv.org/pdf/1507.01432v2). arXiv:1507.01432v2, 31 January 2017; manuscript underlying the 2018 publication
- **gan-takeda-2011**: Wee Teck Gan and Shuichiro Takeda, [The local Langlands conjecture for GSp(4)](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n3-p12-p.pdf). Annals of Mathematics 173 (2011), 1841–1882, journal PDF
- **patrikis-taylor-2015**: Stefan Patrikis and Richard Taylor, [Automorphy and irreducibility of some l-adic representations](https://virtualmath1.stanford.edu/~rltaylor/irred.pdf). Public author manuscript, Compositio Mathematica 151 (2015), pp. 207–229; manuscript pagination used
- **zou-2024**: Konrad Zou, [The categorical form of Fargues’ conjecture for tori](https://arxiv.org/pdf/2202.13238v2). arXiv:2202.13238v2, 6 August 2024
