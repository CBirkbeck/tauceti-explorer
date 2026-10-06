# Modular forms — Hecke theory, newforms, and L-functions, Part II: GL₂ automorphic representations and transfer

Part R17.3: layers R17.3–R17.6. Agent: Codex. Issue: [#734](https://github.com/CBirkbeck/tauceti-explorer/issues/734).

This is a complete target-level planning pass, with all four layers **planned** and none **closed**. The packet has 55 declarations, 33 API items, 28 unit tests and 20 planets. Seven explicit gaps and 25 precise supplier requests prevent closure. Every proposed implementation remains unchecked.

The binding base is the accepted RS-21 result in [data/restructure/RS-21.result.json](../../../data/restructure/RS-21.result.json), accepted on 29 September 2026 after independent REV-RS-21 review. This roadmap extends `tauceti:TauCetiRoadmap/ModularForms`. The pending review of a subsequent restructuring correction does not supersede that accepted ownership.

The machine-readable plan is the [packet](../packets/GL2AutomorphicRepresentationsAndTransfer--R17.3.json); the [suggested Lean file](../suggested/GL2AutomorphicRepresentationsAndTransfer--R17.3.lean) gives provisional signatures, API lemmas and named test examples. This document gives the definitive mathematical statements.

## Conventions and ownership

F is a number field; A_F is its adele ring. D/F is a quaternion algebra, with chosen algebra identifications at split places. Automorphic representations mean the canonical supplier-owned irreducible or isobaric isomorphism classes; a symbol for a representation does not define a second carrier. Isomorphism and equality of classes are used interchangeably. Norm means the canonical field or idele norm; Nrd is the reduced norm. A local character of a division algebra is allowed in the non-norm global spectrum. A global character factoring through Nrd is excluded from the cuspidal JL correspondence.

Fix arithmetic Frobenius, the R16.2 Hecke scaling and the R16.3 arithmetic LLC normalization. An unramified Satake class A has Euler polynomial det(1−AX), with both trace and determinant specified. Local restriction includes the monodromy operator; comparisons of epsilon factors use the same additive character and compatible measures. At infinity distinguish discrete-series cohomological weights from the holomorphic weight-one limit/principal-series parameter. Coefficient conjugation and rationality statements below have cohomological hypotheses.

A residual representation has a chosen coefficient place, residue-field embedding and stable lattice; its comparison is semisimplified. At characteristic two, determinant oddness is vacuous, individual involution matrices need not be semisimple, and full Frobenius characteristic polynomials are retained. A supplied compatible family is data, with one common coefficient field and common good-place polynomials; its existence is owned elsewhere.

Generic quaternion parity and reciprocity belong to ClassFieldTheory; Hecke characters and ray-class interfaces to GlobalNumberFields; factor sets and induction to InductionRestriction; continuous cohomology to ProfiniteCohomology; modular form sheaves, q-expansions, Hasse and eigenvalue lifting to R15; canonical finite Galois representations and conductor/recognition/classification to R01. Analytic rank-two transfer is planned here. Geometric automorphic realization belongs to R18/R19, generic GL₃ converse and poles to AL, extension construction and compatible systems to R23/R24.

## Pinned-library boundary

The reviewed AUDIT14 entries in `data/library-coverage.json` classify the target transfer and Artin/modularity results as unavailable. The following full declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; they are reused, never replanned.

- `mathlib:Matrix.GeneralLinearGroup` — GL(n,R) is the existing unit group of square matrices; the Satake computation uses GL(Fin 2,K), not a new matrix group. Module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Matrix.GeneralLinearGroup.det` — Multiplicative determinant GL(n,R) → R units, for a commutative ring. Module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Matrix.GeneralLinearGroup.map` — Coefficient ring maps induce multiplicative maps of existing general linear groups. Module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Matrix.ProjGenLinGroup` — PGL(n,R) is the existing quotient of GL(n,R) by its center, with its group instance; no replacement projective matrix group. Module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean`.
- `mathlib:Matrix.ProjGenLinGroup.mk` — The canonical group homomorphism GL(n,R) → PGL(n,R), used to state arithmetic lifting on the existing carrier. Module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean`.
- `tauceti:TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero` — A projective action with zero factor-set cohomology class is a scalar rescaling of a linear homomorphism. This does not assert arithmetic obstruction vanishing or continuity. Module: `TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean`.
- `tauceti:TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two` — GL₂(F) is not solvable if F contains a nonzero a with a²≠1; it does not prove an Artin modularity theorem. Module: `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Solvable.lean`.

The Lean file imports only individual Mathlib modules at that exact Mathlib pin. It elaborated successfully with 116 placeholder-proof warnings and no other warnings or errors. The shared Tau Ceti build is newer than its pin, so no Tau Ceti module is imported as a replacement for the pinned statements. Missing supplier types are type parameters and unavailable conditions are explicitly omitted. The signatures do not assert unconditional theorems for arbitrary parameter types and operations. Compilation checks the prototype syntax and concrete matrix/coefficient expressions; it proves no transfer theorem.

## R17.3 — Global Jacquet–Langlands

The objects in this layer are the supplied automorphic isomorphism classes for a quaternion algebra and GL₂, with central character and local components. Global transfer is an equivalence on the non-norm spectrum, including its inverse. Its split-place Hecke comparison preserves both generators of the degree-two Euler polynomial. The norm-character exception, quaternionic strong multiplicity one, rational structures and both definite and indefinite infinity types are separate declarations because they have different hypotheses and different consumers.

CDN20 needs a prescribed supercuspidal globalization; its footnote allows a central-character twist and coefficient extension. CDN23 needs the exchange of a finite and a real quaternion invariant and its specified auxiliary tame subgroup. Pan needs the dual highest-weight convention and removal of norm factors in weight zero. These applications import quaternion invariant parity from ClassFieldTheory and send analytic spectra to R18; they do not construct Shimura-curve cohomology.

Planets: Global Jacquet–Langlands correspondence, Quaternionic strong multiplicity one, Definite quaternionic transfer, Supercuspidal globalization.

### Global Jacquet–Langlands correspondence

Declaration `TauCeti.GL2Transfer.globalJL` (construction); node `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`.

Let F be a number field and D/F a quaternion algebra, with fixed split-place identifications and a central Hecke character ω. There is a bijection JL_D between irreducible automorphic representations of D×(A_F) with character ω which do not factor through reduced norm, and cuspidal representations π of GL₂(A_F) with character ω for which π_v is essentially discrete series at every ramified place of D. At a finite ramified place this means a Steinberg twist or a supercuspidal representation; at a real ramified place it means a discrete-series representation with the corresponding algebraic D_v× type. Complex places are split. At split places the components agree; at ramified places they match the fixed R17.1 correspondence. For split D this is the identity on cuspidal isomorphism classes. The inverse is part of the assertion.

Construction or proof:

1. Apply the R17.2 trace comparison, isolating the non-norm spectrum; local matching has the R17.1 normalization.
2. Use the R16.4 GL₂ strong multiplicity-one theorem to identify the unique transferred representation.
3. Use Badulescu–Renard Theorem 18.1 specialized to degree two for the unconditional inverse. Its residual/norm-character branch is removed before restricting the discrete-spectrum bijection to cuspidal GL₂.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R16.1`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.1`, `GL2AutomorphicRepresentationsAndTransfer:R17.2`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Alexandru I. Badulescu and David Renard, Global Jacquet–Langlands correspondence, multiplicity one and classification of automorphic representations](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf), §1.5 Theorem 1.4(a); §18.1 Theorem 18.1(a), pp. 6, 44. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Consumers determining the API:

- CDN20 §5.2.1 and Proposition 5.2 — Move a prescribed supercuspidal type between the two quaternionic globalizations.
- CDN23 §4.1.2; Pan §5.5.5; HilbertModularVarietiesAndShimuraCurves R18.3–R18.4 — Identify cuspidal Hecke spectra through the common GL₂ representation, preserving local types.

API:

- `TauCeti.GL2Transfer.globalJL_local` (compatibility): For every place v, local(GL₂,JL_D π′,v) equals the R17.1 local transfer of local(D,π′,v), using the split-place identification at split v.
- `TauCeti.GL2Transfer.globalJL_central` (projection): The central character of JL_D π′ is the central character of π′.
- `TauCeti.GL2Transfer.globalJL_inverse` (equivalence): The inverse of JL_D recovers every non-norm π′; JL_D of the inverse recovers every D-compatible cuspidal π.
- `TauCeti.GL2Transfer.globalJL_twist` (functoriality): For a Hecke character χ of F, JL_D(π′⊗χ∘Nrd)=JL_D(π′)⊗χ∘det; the central character becomes ωχ².
- `TauCeti.GL2Transfer.globalJL_split` (simp): For D=M₂(F), using the identity identifications, JL_D is the identity equivalence on cuspidal classes.

Unit tests:

- `TauCeti.GL2Transfer.jl_split_test` (degenerate): For D=M₂(Q), JL_D fixes every cuspidal isomorphism class.
- `TauCeti.GL2Transfer.jl_steinberg_test` (compatibility): For D/Q ramified at {p,∞} and an allowed weight-two cuspidal π with π_p=St⊗χ_p, local(JL_D inverse π,p)=χ_p∘Nrd under R17.1; local characters are not discarded.
- `TauCeti.GL2Transfer.jl_inverse_test` (characterisation): For every D-compatible cuspidal π, JL_D(JL_D inverse π)=π, and the split-place components of its inverse equal π_v.

Acceptance checks:

- For D/Q ramified at {p,∞}, a cuspidal π with π_p a Steinberg twist and π_∞ weight-two discrete series transfers to a quaternionic representation with one-dimensional local types at p and ∞.
- An unramified principal series at a ramified finite place has no image under this bijection.
- A local one-dimensional D_v× character is allowed; a global reduced-norm character is excluded.

### The reduced-norm character exception

Declaration `TauCeti.GL2Transfer.norm_exception` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.3/norm-exception`.

For a nonsplit quaternion algebra D/F, a global automorphic character χ∘Nrd is not in the non-norm/cuspidal JL bijection. Its ramified local character has classical local JL equal to St⊗χ_v; its split local component is χ_v∘det, so the tensor product of these classical local transfers is not a cuspidal GL₂ automorphic representation. The extended discrete-spectrum transfer of Badulescu–Renard treats the residual branch differently. Do not identify that extended local unitary transfer with classical discrete-series JL on every split character.

Construction or proof:

1. Read the split and nonsplit components of a norm character; use the explicit R17.1 character/Steinberg calculation.
2. Apply R16.4 uniqueness and the cuspidal local genericity criterion from R16.2; keep the residual branch of the extended theorem separate.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `GL2AutomorphicRepresentationsAndTransfer:R17.1`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §14, paragraph after Theorem 14.4, p. 247. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- A global norm character is excluded even though every division-place character has a valid local transfer.

### Split-place Hecke compatibility

Declaration `TauCeti.GL2Transfer.split_hecke` (comparison); node `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`.

Let π′ and π=JL_D π′ be as above. At every split finite v the fixed algebra identification identifies their entire local representation and hence their K_v-invariant modules and action of the local Hecke algebra. In particular, at a spherical v both normalized T_v and the central operator S_v agree. Consequently the arithmetic degree-two Euler polynomial 1−a_v X+b_v X² agrees. This does not assert an integral global Hecke-module isomorphism, equality of multiplicities of unrelated levels, or spherical vectors at division places.

Construction or proof:

1. Use globalJL_local with the split identification, then functoriality of the supplied local invariant-vector/Hecke action.
2. Read off both arithmetic generators, using the R16.2 normalization rather than an unrecorded unitary scaling.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §4.1.2 equation (4.6) and §4.1.3 Hecke generators, pp. 38–39. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- Keep the determinant coefficient b_v, not only the trace a_v.
- A ramified-place U_v comparison requires a separate local-type calculation.

### Local factors of quaternionic transfer

Declaration `TauCeti.GL2Transfer.local_factors` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.3/local-factors`.

For the cuspidal JL pair and a fixed nontrivial additive character ψ of F\A_F, the local L- and ε-factors of π_v and π′_v agree at every place, including after every local character twist, in the common R16.3/R17.1 normalization. The products give equality of completed global L-functions and functional equations; the equality uses compatible measures/additive characters and the same character twist.

Construction or proof:

1. Apply R17.1 local-factor compatibility at division places and identity at split places.
2. Use the AL.3 product and functional-equation interface; no transfer-specific sign remains after the prescribed local convention.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §14, before Theorem 14.4, p. 247. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- A character on D_v× matches the L-factor of a Steinberg twist, not the two-factor spherical polynomial of χ_v∘det.

### Quaternionic strong multiplicity one

Declaration `TauCeti.GL2Transfer.strong_multiplicity_one` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.3/strong-multiplicity-one`.

If π′ and σ′ are non-norm irreducible automorphic representations of D×(A_F), and π′_v≅σ′_v for all finite v outside a finite set, then π′≅σ′. In particular their away-S components determine the component at a distinguished ramified place. This is a theorem about global representations, not a statement that one local Hecke scalar determines a local type.

Construction or proof:

1. Transfer both to cuspidal GL₂ and use R16.4 strong multiplicity one.
2. Use injectivity of global JL to return to D×.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Alexandru I. Badulescu and David Renard, Global Jacquet–Langlands correspondence, multiplicity one and classification of automorphic representations](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf), Theorem 1.4(c); Theorem 18.1(b), pp. 6, 44. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- CDN20 Proposition 5.2: the representation away from p determines the component at p.

### Multiplicity one in the non-norm spectrum

Declaration `TauCeti.GL2Transfer.multiplicity_one` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.3/multiplicity-one`.

For fixed unitary central character, every non-norm irreducible representation of D×(A_F) occurs with multiplicity one in the discrete automorphic spectrum. Together with local invariant-vector dimensions this computes its contribution at any fixed finite level; it does not say that the full level space is one-dimensional.

Construction or proof:

1. Use the multiplicity identity in the R17.2 trace comparison, or degree-two specialization of Badulescu–Renard Theorem 18.1(b).
2. Use the fixed central-character decomposition rather than counting twists together.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.2`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Alexandru I. Badulescu and David Renard, Global Jacquet–Langlands correspondence, multiplicity one and classification of automorphic representations](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf), Theorem 1.4(b); Theorem 18.1(b), pp. 6, 44. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- An old level can have an invariant-vector space of dimension greater than one while global spectral multiplicity remains one.

### Coefficient conjugation of global transfer

Declaration `TauCeti.GL2Transfer.coefficient_conjugation` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.3/coefficient-conjugation`.

Let F be totally real and π′,π=JL_D π′ have compatible algebraic infinity types and cohomological normalization, with their finite parts defined over number fields by the R16.4 rationality interface. For σ∈Aut(C), applying σ to finite coefficients gives JL_D({}^σπ′_f)≅{}^σπ_f, with the σ-conjugated algebraic infinity data and central character. The fields generated by both normalized away-S Hecke systems agree. This assertion is restricted to the coefficient-conjugation setting supplied by R16.4; it is not a claim of cohomological rationality for arbitrary Maass forms or weight-one Artin forms.

Construction or proof:

1. The split Hecke eigenvalues conjugate coefficientwise in the supplied rational structures.
2. Use R16.4 existence of the conjugate automorphic representation and strong multiplicity one; local JL tracks the infinity types.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/strong-multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves](https://arxiv.org/pdf/2209.06366v1), §5.5.5, Hecke spectra before and after quaternionic comparison, pp. 75–76. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- Changing the arithmetic normalization changes the determinant scalar; state the normalization before comparing coefficient fields.

### Rational-model comparison under transfer

Declaration `TauCeti.GL2Transfer.rational_models` (comparison); node `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`.

For the cohomological JL pair of the preceding theorem, and a number field L over which the supplied finite representation modules and matching local types are realized, their split-place Hecke eigensystems agree over L and after every extension of L. If one needs an actual L-linear module comparison, use the supplied R16.4 descent data and compare the relevant invariant-vector modules after the specified local transfers. Equality of the field of rationality alone is not sufficient to conclude that both entire representations have models over that field; a Schur/descent obstruction and finite coefficient extension must be allowed.

Construction or proof:

1. Apply coefficient-conjugation compatibility to the common arithmetic Hecke eigencharacter.
2. Descend the comparison with R16.4 model data; retain rather than silently erase the descent obstruction.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.3/coefficient-conjugation`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §5.2.1 and footnote 21, author pp. 43–44. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- The coefficient extension allowed in footnote 21 is part of the output, not an invisible change of field.

### Definite quaternionic weights and cuspidal transfer

Declaration `TauCeti.GL2Transfer.definite_infinity` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity`.

Let F be totally real and D ramified at every real place. A non-norm global representation whose real components are the algebraic quaternionic types of highest weights prescribed by R17.1 transfers to GL₂ discrete series with the matching infinitesimal characters. Over Q with D ramified at p and ∞, Pan’s type W^{(−k,0)} gives the GL₂ infinity infinitesimal character of highest weight (0,−k), and the p-component is special or supercuspidal. For k≥1 the resulting away-p Hecke spectrum is contained in Pan’s σ_{k+2,1}, including its t-twist convention. At k=0 the norm-factor subspace must be removed to get the weight-two cuspidal branch; the norm-factor branch has weight-zero spectrum. Geometric construction and semisimplicity of the algebraic form space remain the R18.3 owner’s work.

Construction or proof:

1. Apply global JL to the non-norm automorphic spectrum; translate the real type with the R17.1 normalization.
2. Track Pan’s dual highest-weight and t-power conventions before identifying classical arithmetic Hecke generators.
3. Export this representation-theoretic comparison to R18.3, which constructs the actual algebraic form space.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`, `GL2AutomorphicRepresentationsAndTransfer:R17.1`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves](https://arxiv.org/pdf/2209.06366v1), Definition 5.4.11; §5.5.5, pp. 75–76. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- For k=0, treating all quaternionic forms as weight-two cusp forms gives a false result.
- The statement exports spectral data; it does not import R18.3 back into R17.3.

### Indefinite transfer and the parity input

Declaration `TauCeti.GL2Transfer.indefinite_parity` (application); node `GL2AutomorphicRepresentationsAndTransfer:R17.3/indefinite-parity`.

For totally real F of degree d, an indefinite quaternion algebra split at exactly one real place and ramified at the other d−1 has an even total ramification set; its finite ramification cardinality therefore has parity d−1. Given such an algebra from the quaternion/class-field suppliers and a compatible cuspidal GL₂ representation, the inverse JL gives the automorphic representation used on the associated Shimura curve, preserving Hecke data at every split finite place. The geometry and integral/cohomological realization belong to R18/R22. Parity is applied from ClassFieldTheory Layer 14, not reproved.

Construction or proof:

1. Apply the supplied Hilbert product formula to the prescribed local invariants.
2. Apply global JL only after checking the essentially discrete-series conditions at every ramified place.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §5.2.1, author pp. 43–44. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- Over Q, ramification at ∞ alone is impossible; {p,∞} is valid.
- A quaternion algebra split at the single real place of Q needs an even number of ramified finite places.

### Transfer after exchanging two quaternion invariants

Declaration `TauCeti.GL2Transfer.invariant_exchange` (application); node `GL2AutomorphicRepresentationsAndTransfer:R17.3/invariant-exchange`.

In CDN23 §4.1, E is the supplied totally real field of even degree with distinguished p-adic place 𝔭 and real place ∞₀. Let D⁰ be ramified at all real places and split at every finite place, and D exchange the invariants of D⁰ at {𝔭,∞₀}. They are identified away from these places. Any cuspidal GL₂ representation compatible with both algebras gives a JL pair on D⁰× and D× with identical away-{𝔭,∞₀} components and Hecke actions. At 𝔭 the split component on D⁰ is special or supercuspidal and corresponds to the division component on D. Given the paper’s auxiliary place w₁ with q_{w₁} coprime to 2Np, q_{w₁}≠1 mod p and residual eigenvalue ratio outside {1,q_{w₁},q_{w₁}^{−1}}, its specified tame subgroup is carried through the away-place identification. Existence of w₁ and the small-level geometry are separate supplied inputs, not consequences of JL.

Construction or proof:

1. Apply the already-owned invariant classification and parity to D⁰ and D.
2. Transfer through the common cuspidal GL₂ representation; away-place equality identifies the specified tame Hecke actions.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`, `GL2AutomorphicRepresentationsAndTransfer:R17.1`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §4.1.2 equation (4.6), pp. 38–39. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- The two changed places give an even invariant change.
- At the other places above p the split identifications remain those fixed in the paper.

### Quaternionic globalization of a supercuspidal type

Declaration `TauCeti.GL2Transfer.supercuspidal_globalization` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.3/supercuspidal-globalization`.

Let F₀ be a p-adic field, τ an irreducible supercuspidal GL₂(F₀) representation with specified central character and a finite coefficient field L. In the totally real/global setting of CDN20 §5.2.1, one can choose a globalization with a distinguished place 𝔭, E_𝔭≅F₀, and the specified cohomological infinity type; its quaternionic local component is JL(τ), and transfer gives Π_𝔭≅τ. Prescribed tame local data must be compatible with the global central character. The construction may require a global character twist and a finite extension of L, exactly as footnote 21 permits. The general limit-multiplicity input needed to guarantee this globalization is an explicit unresolved supplier gap. Once the globalization exists, away-𝔭 data determine its 𝔭-component by quaternionic strong multiplicity one.

Construction or proof:

1. Use Clozel’s prescribed-discrete-series globalization/limit-multiplicity input with the admissible central character and tame data; this input is recorded as a gap, not inferred from local transfer.
2. Apply global JL to match τ and JL(τ); use strong multiplicity one for determination by the away-place spectrum.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/strong-multiplicity-one`, `AutomorphicSpectralTheory:AS.6`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §5.2.1 and footnote 21, author pp. 43–44. The read passage supports the stated consumer theorem or comparison; the original proof and any missing upgrade are explicitly separated as gaps in this node and packet.

Acceptance checks:

- A statement over the original L without permitting the footnote’s coefficient extension is stronger than the source.

Layer status: **planned**. Every current stage target has a precise declaration node and its prerequisite chains end in a read baseline/supplier, an explicit request, or a named gap. The target-level pass is complete; the stage is not closed.

Closure work:

- Decompose the trace-formula inverse, coefficient-model descent and source-specific spectral comparison proofs after the R16/R17.1–R17.2 supplier interfaces exist.
- Read and request the precise Clozel limit-multiplicity globalization theorem; retain the central-character and coefficient-field choices.

## R17.4 — Cyclic, solvable and cubic base change

Prime-cyclic strong base change is constructed on isobaric classes so that a quadratic self-twist has a legitimate noncuspidal output. The local parameter, central character, descent fiber and cuspidality criterion are separate assertions. A cuspidal output has exactly the prime-degree character-twist fiber; the dihedral noncuspidal output has a unique cuspidal descent, and an isobaric pair permits independent twists of its two characters. A solvable normal tower uses these distinctions at every step.

The nonnormal cubic branch is a separate construction. An S₃ cubic field cannot be reached from the ground field by prime-cyclic steps. The Artin argument needs the adjoint GL₃ lift, cyclic cubic character induction and GL₃ converse/uniqueness/pole recognition. The generic analytic theorem belongs to an AL extension. These four rank-two bridge nodes form the proposed R17.4a sublayer; their current parent remains R17.4 so the packet realizes exactly the assigned scope. Extraordinary dyadic all-place comparison is placed after Artin automorphy in R17.6; putting it into the Artin prerequisites would create a cycle.

Planets: Cyclic base change, Cyclic automorphic descent, Cyclic cuspidality criterion, Solvable base change, Gelbart–Jacquet adjoint lift, Non-normal cubic base change.

### Unramified base-change Satake rule

Declaration `TauCeti.GL2Transfer.unramifiedBaseChange` (definition); node `GL2AutomorphicRepresentationsAndTransfer:R17.4/unramified-base-change`.

Use the existing arithmetic Satake conjugacy class A_v∈GL₂(C) at an unramified finite v. For an unramified local extension E_w/F_v of residue degree f≥1, define its base-change representative to be A_v^f; the conjugacy class is independent of the chosen representative. This is the transfer-specific rule, not a new Satake carrier. Its determinant is det(A_v)^f and its local Euler polynomial is det(1−A_v^f X). For a split global place each local degree is one. The formal degree-zero extension of the matrix-power function is the identity matrix and is not a degree-zero field extension.

Construction or proof:

1. Implement the rule by power in Mathlib’s existing GL(Fin 2,K); use the existing multiplicative determinant and coefficient-map homomorphisms.
2. Compare to restriction of arithmetic Frobenius: Frob_w maps to Frob_v^f in the unramified quotient.

Direct prerequisites: `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.GeneralLinearGroup.det`, `mathlib:Matrix.GeneralLinearGroup.map`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2 local lifting criteria (i), (e), and global criterion (i). The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Consumers determining the API:

- Langlands §2; Arthur–Clozel Chapter 3 Definition 6.1 — Specify the almost-everywhere local data that determine global base change.
- R17.6 compatible-system export — Match the characteristic polynomial of restricted Frobenius to the transferred Hecke polynomial.

API:

- `TauCeti.GL2Transfer.unramifiedBaseChange_one` (simp): The degree-one rule fixes A.
- `TauCeti.GL2Transfer.unramifiedBaseChange_tower` (functoriality): Applying residue degrees f and then g gives A^{fg}.
- `TauCeti.GL2Transfer.unramifiedBaseChange_conjugate` (compatibility): For P∈GL₂(K), the rule sends P A P^{-1} to P A^f P^{-1}.
- `TauCeti.GL2Transfer.unramifiedBaseChange_det` (projection): The determinant of the output is det(A)^f.
- `TauCeti.GL2Transfer.unramifiedBaseChange_map` (functoriality): Every coefficient ring map commutes with the power rule.

Unit tests:

- `TauCeti.GL2Transfer.bc_degree_one_test` (degenerate): Degree one returns every A∈GL₂(K).
- `TauCeti.GL2Transfer.bc_identity_test` (degenerate): The identity matrix stays the identity for every f, including the formal f=0 case.
- `TauCeti.GL2Transfer.bc_diagonal_square_test` (computation): For A=diag(2,3)∈GL₂(Q), degree two gives the matrix diag(4,9), trace 13 and determinant 36.
- `TauCeti.GL2Transfer.bc_not_identity_test` (non-example): For that A, degree two is different from degree one.
- `TauCeti.GL2Transfer.bc_tower_test` (compatibility): Residue degrees two then three give diag(64,729), agreeing with degree six.

Acceptance checks:

- For diagonal eigenvalues (2,3) over Q and residue degree two, the output eigenvalues are (4,9), not (2,3).

### Prime-cyclic base change for GL₂

Declaration `TauCeti.GL2Transfer.cyclicBaseChange` (construction); node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`.

For a cyclic extension E/F of prime degree ℓ of number fields, there is a uniquely determined strong base-change map BC_{E/F} from isobaric automorphic GL₂ classes over F to isobaric automorphic GL₂ classes over E. For a cuspidal input the output is cuspidal or a sum of two automorphic characters. At every place w|v its arithmetic-normalized LLC parameter is the restriction of the parameter at v; when v splits it is the original component. The central character is ω_π∘N_{E/F}. The output is invariant under Gal(E/F); neither cuspidality nor injectivity is automatic.

Construction or proof:

1. Use R17.2 prime-cyclic trace comparison to produce weak base change and the required spectral alternatives.
2. Upgrade weak to strong using Arthur–Clozel Chapter 3 Theorem 5.1 and the supplied rank-two local comparison; R16.4 uniqueness fixes the class.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/unramified-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 Theorems 4.2 and 5.1, pp. 202–213. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Consumers determining the API:

- Langlands §3; R17.5 tetrahedral and octahedral arguments — Restrict the automorphic realization along the cyclic normal subextensions.
- Carayol §12.3; PotentialModularityAndCompatibleSystems R23.5 — Preserve specified local components at split places and restrict local parameters at other places.

API:

- `TauCeti.GL2Transfer.cyclicBaseChange_local` (compatibility): At w|v the normalized local parameter is restriction to W_{E_w}; at split v use the identity.
- `TauCeti.GL2Transfer.cyclicBaseChange_unramified` (simp): At unramified w|v, Satake equals unramifiedBaseChange(A_v,f(w/v)).
- `TauCeti.GL2Transfer.cyclicBaseChange_central` (projection): The central character is pullback along the idele norm.
- `TauCeti.GL2Transfer.cyclicBaseChange_twist` (functoriality): BC(π⊗χ)=BC(π)⊗(χ∘N_{E/F}).
- `TauCeti.GL2Transfer.cyclicBaseChange_galois` (characterisation): Every output is Gal(E/F)-invariant; every invariant cuspidal class occurs, with the fibers described in cyclic-descent-fibers.
- `TauCeti.GL2Transfer.cyclicBaseChange_coefficients` (compatibility): In the supplied rational/cohomological regime, coefficient conjugation commutes with BC after the recorded normalization.

Unit tests:

- `TauCeti.GL2Transfer.cyclic_split_test` (compatibility): At a completely split v each local output equals the original component and its Satake representative A_v.
- `TauCeti.GL2Transfer.cyclic_inert_test` (computation): At an inert unramified place of a quadratic extension, diag(2,3) becomes diag(4,9).
- `TauCeti.GL2Transfer.cyclic_induced_test` (non-example): For π=AI_{E/F}(θ) with θ≠θ^σ in a quadratic extension, BC(π)=θ⊞θ^σ and is not cuspidal.
- `TauCeti.GL2Transfer.cyclic_odd_degree_test` (characterisation): For prime ℓ>2, every cuspidal GL₂ input remains cuspidal.

Acceptance checks:

- A quadratic dihedral representation induced from E can lose cuspidality under this map.

### All-place compatibility of cyclic base change

Declaration `TauCeti.GL2Transfer.local_compatibility` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`.

For the strong cyclic BC pair and every place w|v, rec^{arith}_{E_w}(BC(π)_w) equals rec^{arith}_{F_v}(π_v) restricted to W_{E_w}, including the monodromy operator and the normalization twist specified by R16.3. For a principal series restrict both characters; for a Steinberg twist retain nonzero monodromy; for a supercuspidal the restricted parameter may become reducible. At real-to-complex places restrict the real Weil parameter. A merely almost-everywhere Satake match is not this all-place statement.

Construction or proof:

1. Use Arthur–Clozel’s weak-to-strong theorem with the R16.3 normalization.
2. Identify principal-series and Steinberg cases explicitly; use the supplied LLC characterization for ramified supercuspidal cases.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 Theorem 5.1, pp. 212–213. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- Steinberg monodromy does not vanish just because the extension is unramified.
- The extraordinary cubic comparison below is a separate theorem, not an instance of cyclic restriction.

### Prime-cyclic automorphic descent

Declaration `TauCeti.GL2Transfer.cyclic_descent` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`.

For cyclic E/F of prime degree ℓ, a cuspidal automorphic GL₂ representation Π over E has a cuspidal descent over F if and only if Π^σ≅Π for a generator σ of Gal(E/F). The resulting descents are determined up to twisting by the ℓ characters of F×N_{E/F}(A_E×)\A_F×. This is descent of an automorphic representation, proved by the trace/converse argument, not descent of a Galois representation. Invariant noncuspidal isobaric classes also have isobaric descents, with the two-character ambiguity described separately.

Construction or proof:

1. Use the prime-cyclic invariant-spectrum comparison from R17.2 and Langlands properties (B), (C).
2. Use R16.4 uniqueness and the cyclic character group supplied by class field theory.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2 properties (B),(C); §11 Lemma 11.6(b). The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- Non-invariant Π has no cyclic descent.
- Invariant Π can have several distinct cuspidal descents.

### The exact prime-cyclic cuspidality criterion

Declaration `TauCeti.GL2Transfer.cuspidality` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`.

Let π be cuspidal GL₂ over F and E/F cyclic of prime degree ℓ; let η be the nontrivial generator of the associated order-ℓ character group. Then BC_{E/F}(π) is noncuspidal if and only if π≅π⊗η. This can occur only for ℓ=2. In that case BC(π)=θ⊞θ^σ for a Hecke character θ with θ≠θ^σ. The identification of π with quadratic automorphic induction is provided by R17.5/quadratic-induction, after this base-change criterion. For prime ℓ>2 the output is always cuspidal. For composite cyclic extensions test each prime step; an odd prime criterion is not a criterion for every composite degree.

Construction or proof:

1. Use Langlands Lemma 11.7 and Arthur–Clozel Chapter 3 Theorem 3.1 fiber classification.
2. Taking central characters in π≅π⊗η gives η²=1; combine with η’s prime order.
3. The exchanged-character description of the noncuspidal output follows from the prime-cyclic trace comparison and Langlands Lemma 11.6(a); the named quadratic induction construction is not an input to this criterion.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §11 Lemma 11.7, text p. 151. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- A quadratic dihedral π with inducing field different from E need not lose cuspidality under E/F.

### Cuspidal fibers and quadratic self-twists

Declaration `TauCeti.GL2Transfer.cyclic_descent_fibers` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers`.

If Π is a Gal(E/F)-invariant cuspidal GL₂ representation, its cyclic descents are precisely π⊗η^i, 0≤i<ℓ, and these ℓ classes are distinct. If the common output is noncuspidal θ⊞θ^σ with θ≠θ^σ and E/F quadratic, its cuspidal descent is unique: π⊗η≅π. Thus the phrase “the fiber consists of ℓ distinct descents” must be restricted to cuspidal outputs.

Construction or proof:

1. Apply Langlands Lemma 11.6(a),(b) for the fiber counts.
2. Use the exact cuspidality criterion to exclude η-self-twists when Π is cuspidal.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §11 Lemma 11.6(a),(b), text pp. 150–151. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- For a quadratic induced π, the two nominal twists coincide; for a cuspidal quadratic output they are distinct.

### Isobaric character fibers

Declaration `TauCeti.GL2Transfer.isobaric_fibers` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.4/isobaric-fibers`.

For π=χ₁⊞χ₂ over F, its cyclic base change is (χ₁∘N_{E/F})⊞(χ₂∘N_{E/F}). Equality of two such outputs is equality of the unordered pairs of pulled-back characters. The two characters can be twisted independently by characters trivial on the norm subgroup; the ambiguity is not in general a simultaneous twist of the whole rank-two representation. When an invariant pair over E is exchanged by σ, it has the quadratic cuspidal descent of the exchanged character pair described above.

Construction or proof:

1. Pull back the two characters individually along the idele norm.
2. Use the rank-one class-field norm-kernel description and the prime-cyclic exchanged-character descent case; compare unordered pairs rather than ordered Satake eigenvalues.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2 property (C), noncuspidal paragraph; §11 verification of (B). The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- Twisting only χ₁ by η already gives the same base change; this need not be a simultaneous twist of χ₁⊞χ₂.

### Base change along a solvable normal tower

Declaration `TauCeti.GL2Transfer.solvableBaseChange` (construction); node `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`.

Let E/F be a finite Galois extension with solvable Galois group. Choose a subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E with each step cyclic of prime degree and define BC_{E/F} by composing the prime-cyclic maps on isobaric GL₂ classes. At every local place the normalized parameter is restricted from F to E; the map is independent of the chosen prime-cyclic tower by almost-everywhere Satake comparison and isobaric strong multiplicity one. It preserves twists through the total norm and preserves cuspidality exactly when no intermediate step meets its quadratic self-twist exception. A non-Galois cubic extension has no such prime-cyclic tower from F; it is not constructed here.

Construction or proof:

1. Choose a subnormal series of the finite solvable group and pass to fixed fields.
2. Compose prime-cyclic base change, retaining every local restriction and central-character norm.
3. Prove independence by the theorem tower-independence below, not by asserting that every field tower is normal over F.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 §§4–5 cyclic base change and weak-to-strong theorem. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Consumers determining the API:

- PotentialModularityAndCompatibleSystems R23.5; R17.6 exports — Restrict automorphic data through a chosen solvable extension with local splitting retained.
- Langlands §3 — Use the normal cyclic subextensions for the solvable Artin argument, separate from nonnormal cubic transfer.

API:

- `TauCeti.GL2Transfer.solvableBaseChange_refl` (simp): For E=F and the empty tower the map is identity.
- `TauCeti.GL2Transfer.solvableBaseChange_tower` (functoriality): For a nested pair of solvable normal extensions the map agrees with composition, with the chosen compatible embeddings.
- `TauCeti.GL2Transfer.solvableBaseChange_local` (compatibility): Every local parameter is restriction along the total local extension, and at completely split places it is unchanged.
- `TauCeti.GL2Transfer.solvableBaseChange_twist` (functoriality): Twisting by χ before BC equals twisting after BC by χ∘N_{E/F}.

Unit tests:

- `TauCeti.GL2Transfer.solvable_empty_test` (degenerate): The empty tower fixes every isobaric class.
- `TauCeti.GL2Transfer.solvable_two_towers_test` (characterisation): For a biquadratic E/F, the towers through two different quadratic subfields give equal isobaric output.
- `TauCeti.GL2Transfer.solvable_degree_six_test` (computation): At a place with local residue degrees two then three, diag(2,3) becomes diag(64,729).
- `TauCeti.GL2Transfer.solvable_cuspidality_test` (non-example): A cuspidal input induced from the first quadratic step is already noncuspidal there, so no blanket solvable cuspidality theorem is asserted.

Acceptance checks:

- For a non-normal cubic field K/F with S₃ normal closure, its own K/F transfer requires the separate cubic node.

### Independence of the solvable tower

Declaration `TauCeti.GL2Transfer.tower_independence` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.4/tower-independence`.

For two prime-cyclic subnormal towers from F to the same solvable Galois extension E, the composed GL₂ isobaric base changes coincide. At all places unramified in the towers and in π, both Satake classes are A_v^{f(w/v)}. Isobaric strong multiplicity one therefore identifies the global outputs; the strong local-compatibility theorem identifies all remaining components. No chosen ordered diagonalization or chosen generator of a cyclic Galois group survives in the output.

Construction or proof:

1. Multiply local residue degrees and use the power rule in a tower.
2. Apply the isobaric R16.4 multiplicity-one input; then use local restriction transitivity.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/unramified-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §11 verification of generator independence and properties (D),(E). The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- The biquadratic two-tower test has the same arithmetic determinant coefficient along both routes.

### Descent along a solvable tower with character choices

Declaration `TauCeti.GL2Transfer.solvable_descent` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent`.

Given a prime-cyclic tower and an isobaric representation over its top, it descends along that tower if one can choose at each step a descent invariant under the next cyclic action and compatible with the previously fixed local/global character data. At a step with cuspidal invariant output the alternatives are its order-ℓ character twists; at noncuspidal steps use the independent-character fiber classification. The theorem supplies descent once these stepwise conditions are met and records their ambiguities. Invariance under the entire solvable Galois group alone is not asserted to supply every compatible descent choice; central-character and cocycle obstructions are retained.

Construction or proof:

1. Apply cyclic descent from the top down and enumerate its fibers at each step.
2. Check invariance and prescribed central-character restrictions before continuing; use the isobaric fiber theorem when cuspidality has been lost.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/isobaric-fibers`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 Theorem 3.1 and §4 descent statement. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- For an even-degree step determinant does not distinguish π and π⊗η, since η²=1.
- The theorem does not silently turn a Galois descent into an automorphic descent.

### Base change with prescribed local splitting

Declaration `TauCeti.GL2Transfer.prescribed_local_base_change` (application); node `GL2AutomorphicRepresentationsAndTransfer:R17.4/prescribed-local-base-change`.

Suppose a solvable normal extension E/F has already been produced by the arithmetic/potential-modularity owner with chosen completions and splitting at a finite set T. Then BC_{E/F}(π)_w≅π_v at every w|v with v∈T completely split; elsewhere its parameter is the restriction to the prescribed completion. If cuspidality is required, check the quadratic self-twist criterion at every tower step. For potentially unramified or ordinary conditions stated by the consuming local owner, export only the consequences of this precise local restriction and normalization. The construction of the extension with prescribed points/splitting is not replanned here.

Construction or proof:

1. Apply strong local compatibility and the split-place degree-one case.
2. Check cuspidality stepwise; pass the local parameter restriction to the consumer’s own local-condition comparison.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.3.1–12.3.2, pp. 458–459. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- A place completely split in E/F cannot acquire a new conductor or a different local type through BC.

### The Gelbart–Jacquet adjoint lift

Declaration `TauCeti.GL2Transfer.adjointLift` (construction); node `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`.

For a unitary cuspidal GL₂ automorphic representation π over a number field F, the adjoint lift Ad(π)=Sym²(π)⊗ω_π^{-1} is an isobaric automorphic GL₃ representation with trivial central character and all local factors matching the adjoint of the rank-two LLC parameter. At an unramified v with eigenvalues α,β its eigenvalues are α/β,1,β/α. It is invariant under character twist of π. It is cuspidal exactly when π has no nontrivial self-twist. In the quadratic monomial case π=AI_{E/F}(θ), the isobaric formula is Ad(π)=η_{E/F}⊞AI_{E/F}(θ/θ^σ), with the rank-two induction interpreted isobarically if its character is invariant. The generic adjoint representation/carrier is imported from ArithmeticGaloisRepresentations G7.

Construction or proof:

1. Use Gelbart–Jacquet’s local lift and the GL₃ converse theorem for the analytic adjoint L-functions; the converse input is an explicit extension gap.
2. Use Theorem 9.3 for the no-self-twist cuspidal case and Remark 9.9 for the quadratic self-twist case.
3. Compare to the supplied adjoint Weil parameter; this construction does not rebuild general GL₃ automorphic carriers.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-representation`, `ArithmeticGaloisRepresentations:G7`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Stephen Gelbart and Hervé Jacquet, A relation between automorphic representations of GL(2) and GL(3)](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf), Introduction pp. 472–474; Theorem 9.3 p. 534; Remark 9.9 p. 541. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Consumers determining the API:

- Langlands §3 tetrahedral argument — Compare Ad(π) with the cubic monomial representation Ad(ρ) to remove the cyclic descent ambiguity.
- R16.4 non-CM/self-twist interface — Identify the automorphic adjoint cuspidality criterion with the source’s no-self-twist condition.

API:

- `TauCeti.GL2Transfer.adjointLift_local` (compatibility): Each local parameter of Ad(π) equals the supplied adjoint of the local parameter of π.
- `TauCeti.GL2Transfer.adjointLift_unramified` (simp): Satake eigenvalues (α,β) become (α/β,1,β/α).
- `TauCeti.GL2Transfer.adjointLift_twist` (functoriality): Ad(π⊗χ)=Ad(π) for every Hecke character χ.
- `TauCeti.GL2Transfer.adjointLift_central` (projection): The central character of Ad(π) is trivial.

Unit tests:

- `TauCeti.GL2Transfer.adjoint_diagonal_test` (computation): The Satake class diag(2,3) gives diag(2/3,1,3/2) in GL₃(Q).
- `TauCeti.GL2Transfer.adjoint_scalar_test` (degenerate): Scalar Satake input diag(a,a), a≠0, gives the identity class.
- `TauCeti.GL2Transfer.adjoint_twist_test` (compatibility): Multiplying both input eigenvalues by any u≠0 does not change the three adjoint eigenvalues.
- `TauCeti.GL2Transfer.adjoint_not_sym_square_test` (non-example): For diag(2,3), the adjoint output differs from diag(4,6,9); forgetting ω^{-1} gives the wrong lift.

Acceptance checks:

- For diag(2,3), unramified adjoint eigenvalues are 2/3,1,3/2, with product one.
- For a nontrivial quadratic self-twist the output is not cuspidal.

### Cyclic cubic induction of a character

Declaration `TauCeti.GL2Transfer.cubic_character_induction` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`.

For a cyclic cubic extension E/F and a Hecke character θ of E, there is an isobaric automorphic GL₃ representation AI_{E/F}(θ), with local parameters Ind_{W_E}^{W_F}(θ) and standard L-function L_E(s,θ). It is cuspidal if and only if θ,θ^σ,θ^{σ²} are pairwise distinct. If θ=χ∘N_{E/F}, the output is χ⊞χη⊞χη² for the order-three character η associated to E/F. This rank-three character case is the exact monomial input to the tetrahedral proof; the general GL_n automorphic-induction theory is not redeveloped here.

Construction or proof:

1. Specialize Arthur–Clozel Chapter 3 Theorem 6.2 to n=1, ℓ=3, importing their local induction and analytic inputs.
2. Use the cyclic orbit/centralizer criterion in that theorem to distinguish the cuspidal orbit of size three from the invariant-character branch.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-representation`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 Definition 6.1 and Theorem 6.2, pp. 214–216. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- An invariant character gives three rank-one summands, not a cuspidal GL₃ output.
- The three nontrivial V₄ characters in the tetrahedral adjoint form one cyclic orbit.

### GL₃ analytic recognition for the Artin bridge

Declaration `TauCeti.GL2Transfer.gl3_recognition` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition`.

In the tetrahedral argument, use the supplied GL₃ converse theorem with the full Hecke-character twist family (and its analytic hypotheses, including both dual L-functions, vertical-strip bounds and functional equations) to recognize the adjoint candidate. Use GL₃ isobaric strong multiplicity one and the Rankin–Selberg pole/nonvanishing criterion to compare Ad(π) with the cubic automorphic induction of Ad(ρ). The latter criterion distinguishes common cuspidal constituents, including the reducible/isobaric branch. GL₂ strong multiplicity one and an untwisted L-function alone do not supply these results. The generic converse and GL₃ uniqueness proofs belong in the proposed AL extension, not in R16.5 a second time.

Construction or proof:

1. Route the general converse and GL₃ recognition/pole lemmas to the single AL extension after AL.3.
2. Apply the supplied results to the two explicit GL₃ candidates from adjoint-lift and cubic-character-induction; the missing generic proofs remain gaps until that supplier is written.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Stephen Gelbart and Hervé Jacquet, A relation between automorphic representations of GL(2) and GL(3)](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf), Introduction pp. 472–474; §9.2–9.3, pp. 532–534. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- Meromorphic continuation with an unchecked pole does not meet an entire converse hypothesis.
- Two GL₂ candidates with equal determinant need not yet have equal adjoints.

### Non-normal cubic base change

Declaration `TauCeti.GL2Transfer.cubicBaseChange` (construction); node `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`.

Let K/F be a separable non-Galois cubic extension of number fields, with S₃ normal closure. The Jacquet–Piatetski-Shapiro–Shalika cubic transfer associates to an isobaric GL₂ automorphic π over F an isobaric GL₂ representation BC_{K/F}(π) over K whose almost-everywhere Satake class at w|v is A_v^{f(w/v)}. This stage constructs weak transfer. The extraordinary all-place comparison needed by Carayol is a separate R17.6 declaration consuming Artin automorphy; an unrestricted strong upgrade is an explicit source-proof gap, not part of these construction steps. It respects twists via the norm and preserves the central character by norm pullback. A cuspidal input can cease to be cuspidal; for the primitive tetrahedral/octahedral dyadic parameters of §12.2.2, the restricted local parameter is irreducible. The original JPSS note and its analytic proof have not been obtained in this run: the general statement and the strong upgrade are precise source-proof gaps, supported here by Carayol’s explicit consumer statement.

Construction or proof:

1. Use the JPSS GL₃/GL₂×GL₃ converse construction, not a fictitious cyclic tower from F to K.
2. Identify good-place powers; use strong multiplicity one to fix the global candidate.
3. These steps establish only weak transfer. An unrestricted all-place upgrade awaits the original JPSS source/supplier proof; the separate extraordinary local comparison is not a prerequisite of this construction.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.2.1(a), pp. 457–458, and its citation [J.P.S.S. 2]. The read passage supports the stated consumer theorem or comparison; the original proof and any missing upgrade are explicitly separated as gaps in this node and packet.

Consumers determining the API:

- Tunnell’s octahedral argument, cited in Carayol §12.2 — Restrict an S₄ projective Artin representation to the index-three Sylow-2 preimage field.
- Carayol Proposition 12.2.2; AutomorphicGaloisRepresentations R19.2, R19.4–R19.5 — Resolve extraordinary dyadic local parameters by a cubic extension, then compare restrictions and determinants.

API:

- `TauCeti.GL2Transfer.cubicBaseChange_unramified` (simp): At unramified w|v the output Satake class is the f(w/v)-power of the input class.
- `TauCeti.GL2Transfer.cubicBaseChange_twist` (functoriality): BC_{K/F}(π⊗χ)=BC_{K/F}(π)⊗(χ∘N_{K/F}).
- `TauCeti.GL2Transfer.cubicBaseChange_central` (projection): The central character is ω_π∘N_{K/F}.
- `TauCeti.GL2Transfer.cubicBaseChange_unique` (characterisation): The isobaric global output is uniquely determined by its almost-everywhere local Satake powers.

Unit tests:

- `TauCeti.GL2Transfer.cubic_split_test` (compatibility): At a completely split place the three outputs are all the original Satake class A.
- `TauCeti.GL2Transfer.cubic_one_two_test` (computation): For splitting type (1,2) and A=diag(2,3), the two outputs are diag(2,3) and diag(4,9).
- `TauCeti.GL2Transfer.cubic_inert_test` (computation): For residue degree three and A=diag(2,3), the output is diag(8,27).
- `TauCeti.GL2Transfer.cubic_not_three_test` (non-example): At splitting type (1,2), replacing every output by A³ gives the wrong local components.

Acceptance checks:

- A nonnormal cubic field has no degree-three cyclic intermediate extension from F.
- For a place of splitting type (1,2), the two output local Satake classes are A and A².

Layer status: **planned**. Every current stage target has a precise declaration node and its prerequisite chains end in a read baseline/supplier, an explicit request, or a named gap. The target-level pass is complete; the stage is not closed.

Closure work:

- Decompose prime-cyclic transfer/descent and tower-independence proofs below the present target-level nodes; discharge the local-factor normalization requests.
- Write the proposed R17.4a and AL converse/GL₃ recognition supplier; obtain the original JPSS cubic-transfer proof.

## R17.5 — Automorphic induction and Langlands–Tunnell

Quadratic induction uses the canonical Hecke-character and representation-induction carriers. The dihedral case is its finite-order arithmetic application. The projective factor-set theory is imported from InductionRestriction and the pinned Tau Ceti algebraic lifting theorem. The new arithmetic inputs are finite-order idele-torsion extension, Tate's continuous obstruction vanishing and continuity/finite image of the resulting lift. The coefficient action in Tate's theorem is trivial; neither fixed-root-of-unity cohomology nor the Brauer group is asserted to vanish.

The tetrahedral and octahedral branches consume the GL₃/cubic bridge. Determinants remove an order-three twist ambiguity but cannot distinguish two quadratic descents. The octahedral comparison therefore retains Tunnell's analytic input. The combined theorem is strong Artin automorphy over a number field, with all-place local parameters; total oddness is added for holomorphic weight one over a totally real field. That weight-one dictionary requires an explicit extension of the current cohomological R16.6 wording. A prescribed residual characteristic-zero lift for p>2 requires Serre's reduction-preserving argument in addition to projective lifting.

Planets: Quadratic automorphic induction, Tate’s vanishing theorem, Tetrahedral Artin automorphy, Octahedral Artin automorphy, Langlands–Tunnell theorem.

### Quadratic automorphic induction

Declaration `TauCeti.GL2Transfer.quadraticInduction` (construction); node `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`.

Let K/F be a quadratic extension of number fields, σ its nontrivial automorphism and θ a Hecke character of K. Quadratic automorphic induction AI_{K/F}(θ) is an isobaric GL₂ automorphic representation with local parameter Ind_{W_{K_w}}^{W_{F_v}}(θ_w), interpreted as the direct sum over w|v at a split place. It is cuspidal exactly when θ≠θ^σ. Its central character is η_{K/F}·θ|_{A_F×}, and L_F(s,AI θ)=L_K(s,θ). Its quadratic base change is θ⊞θ^σ. It commutes with twisting by χ of F using θ·(χ∘N_{K/F}); if θ=χ∘N, it is χ⊞χη, not cuspidal. The finite-group induction carrier and Mackey formulas are imported, not defined here.

Construction or proof:

1. Specialize Arthur–Clozel Chapter 3 Theorem 6.2 to n=1 and ℓ=2, using the supplied local induction/reciprocity dictionary.
2. Apply the orbit criterion for cuspidality; compare determinants of induced local parameters for the central character.
3. The split-place direct-sum formula and conjugation orbit give the base-change identity.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-4-intertwining-numbers-and-the-mackey-irreducibility-criterion`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 Theorem 6.2, pp. 214–216. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Consumers determining the API:

- Langlands §3; R17.5 dihedral case; Rohrlich–Tunnell §2; Wiese Lemmas 2–3 — Automorphy of finite dihedral Artin parameters, including the auxiliary odd characteristic-zero lifts of mod-two representations.

API:

- `TauCeti.GL2Transfer.quadraticInduction_local` (compatibility): Local LLC of AI θ is local induction of θ, with a direct sum at a split place.
- `TauCeti.GL2Transfer.quadraticInduction_central` (projection): ω(AI θ)=η_{K/F}·θ|_{A_F×}.
- `TauCeti.GL2Transfer.quadraticInduction_baseChange` (characterisation): BC_{K/F}(AI θ)=θ⊞θ^σ.
- `TauCeti.GL2Transfer.quadraticInduction_twist` (functoriality): AI(θ·χ∘N)=AI(θ)⊗χ.
- `TauCeti.GL2Transfer.quadraticInduction_cuspidal` (characterisation): AI θ is cuspidal if and only if θ≠θ^σ.

Unit tests:

- `TauCeti.GL2Transfer.induction_invariant_test` (degenerate): θ=χ∘N has output χ⊞χη and is not cuspidal.
- `TauCeti.GL2Transfer.induction_split_test` (compatibility): At v split as w,w′ the local parameter is θ_w⊕θ_w′.
- `TauCeti.GL2Transfer.induction_determinant_test` (computation): For a coset element with induced matrix [[0,a],[b,0]], its determinant is −ab, accounting for the quadratic character.
- `TauCeti.GL2Transfer.induction_noninvariant_test` (non-example): When θ≠θ^σ, replacing AI θ by two F-characters contradicts cuspidality.

Acceptance checks:

- An invariant character gives χ⊞χη; a non-invariant character gives a cuspidal representation.
- At a split place the two local characters, rather than an irreducible local induction, are the output.

### Dihedral Artin automorphy

Declaration `TauCeti.GL2Transfer.dihedral_artin` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`.

Let ρ:G_F→GL₂(C) be continuous, irreducible and finite-image, with dihedral projective image. The imported classification gives a quadratic K/F and a finite-order character θ of G_K with ρ≅Ind_{G_K}^{G_F} θ. Reciprocity identifies θ with a finite-order Hecke character, and quadraticInduction(θ) is the unique cuspidal GL₂ automorphic representation whose normalized local parameter is ρ|_{W_{F_v}} at every place. Over totally real F, total oddness makes the infinite components the holomorphic parallel-weight-one parameters; this archimedean consequence is separate from finite-place automorphy.

Construction or proof:

1. Use the finite-image induction criterion from R01.4 and the imported Mackey/Clifford theory.
2. Apply finite-order reciprocity and quadratic automorphic induction.
3. Local induction commutes with the reciprocity dictionary; use strong multiplicity one for uniqueness.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3 discussion preceding Theorem 3.3, pp. 15–18. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- A reducible induction of an invariant character is excluded by irreducibility.
- Oddness is needed for holomorphic weight one, not for the all-number-field automorphic assertion.

### Extension of finite-order idele-torsion characters

Declaration `TauCeti.GL2Transfer.finite_hecke_extension` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-hecke-extension`.

For a number field F and n≥1, a continuous character ω:μ_n(F)\μ_n(A_F)→S¹ has a finite-order extension to the idele class group if and only if its complex-place components are trivial. In particular the obstruction vanishes for totally real F. In the Grunwald–Wang exceptional case the auxiliary n-torsion quotient and its character cannot be silently discarded: the proof allows two choices of extension, one with the required finite-order property. This is an arithmetic extension theorem on the canonical GlobalNumberFields Hecke-character carrier, not a new character group.

Construction or proof:

1. Follow Patrikis Lemma 2.3.6 using the idele-class identity component and the ray-class/profinite quotient.
2. Keep the Grunwald–Wang index-two branch in the quotient calculation; choose the correct extension, instead of falsely asserting unique n-torsion extension.
3. A complex component is connected and hence killed by any finite-order continuous character; this proves necessity.

Direct prerequisites: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Stefan Patrikis, Variations on a theorem of Tate](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf), Lemma 2.3.6 and proof, pp. 30–31. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- Over a totally real field the complex-place obstruction is vacuous.
- A nontrivial character on a connected complex-place component cannot have a finite-order extension.

### Tate’s arithmetic obstruction vanishing

Declaration `TauCeti.GL2Transfer.tate_vanishing` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing`.

For any number field F, H²_cont(G_F,Q/Z)=0, where Q/Z is discrete with trivial G_F-action. Consequently a continuous finite-image projective representation over C has zero obstruction after enlarging its finite root-of-unity coefficient group. This does not assert H²(G_F,μ_n)=0 for fixed n, nor use Q/Z with cyclotomic action. Continuous cochains and connecting maps are supplied by ProfiniteCohomology; the arithmetic vanishing is proved here.

Construction or proof:

1. Use the local/global Brauer sequence and reciprocity, after finite extension to contain the required roots of unity, as in Patrikis Theorem 2.1.1.
2. Kill local obstruction components by suitable finite-order characters; the preceding Hecke-extension result resolves the archimedean and Grunwald–Wang choices.
3. Pass through finite torsion coefficients to Q/Z using the imported continuous-cohomology colimit interface. Track the action: the theorem uses trivial coefficients.

Direct prerequisites: `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-hecke-extension`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Stefan Patrikis, Variations on a theorem of Tate](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf), Theorem 2.1.1 and proof, pp. 17–18; Proposition 2.1.4, p. 19. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- A nonzero fixed-coefficient H² class may become zero only after increasing the root-of-unity group.
- The theorem does not imply the vanishing of the Brauer group of F.

### Continuous finite-image arithmetic projective lifting

Declaration `TauCeti.GL2Transfer.finite_projective_lift` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-projective-lift`.

Let F be a number field and r:G_F→PGL₂(C) a continuous finite-image homomorphism. There exist a continuous finite-image ρ:G_F→GL₂(C) and an identification of its projectivization with r. Choose representatives of the finite projective image so the factor set takes values in roots of unity; Tate vanishing supplies a continuous scalar cochain after enlarging that torsion group. Compactness gives a finite image for the cochain, hence for the resulting linear lift. Any two continuous finite-image lifts of the same identified projective homomorphism differ by a continuous finite-order scalar character. At a real place where r(c) is a nontrivial involution, every linear lift is odd (eigenvalues +1,−1); trivial projective r(c) cannot give an odd two-dimensional lift. No determinant-one or prescribed residual reduction is asserted.

Construction or proof:

1. Apply the imported factor-set interface and pinned zero-class lifting theorem after tate-vanishing; do not redefine projective representations.
2. Prove continuity and finite image by choosing a continuous finite-torsion trivializing cochain; the algebraic library theorem alone supplies neither property.
3. Scalar ratios are multiplicative; their continuity and finite image give the finite-order twist ambiguity.
4. At c²=1 compare scalar versus non-scalar order-two matrices for the archimedean assertion.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`, `tauceti:TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero`, `mathlib:Matrix.ProjGenLinGroup`, `mathlib:Matrix.ProjGenLinGroup.mk`, `ArithmeticGaloisRepresentations:R01.1`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Stefan Patrikis, Variations on a theorem of Tate](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf), Theorem 2.1.1; Proposition 2.1.4 and Remark 2.1.5, pp. 17–20. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- Enlarging the scalar root-of-unity group is allowed; insisting on μ_n may leave an obstruction.
- This lifting theorem alone does not prove that a prescribed mod-p representation is the reduction of the lift.

### Tetrahedral Artin automorphy

Declaration `TauCeti.GL2Transfer.tetrahedral_artin` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`.

Let F be a number field and ρ:G_F→GL₂(C) be continuous finite-image irreducible with projective image A₄. There is a unique cuspidal GL₂ automorphic representation π with normalized all-place local parameters ρ. Over the cyclic cubic field fixed by the normal V₄, restriction is dihedral and therefore automorphic. Its automorphic representation is Galois-stable; cyclic descent gives a finite twist fiber over F. Matching determinant removes the cubic twist ambiguity, and comparison of Ad(π) with the cyclic cubic induction of the three V₄ characters verifies the required Frobenius classes. The GL₃ recognition step needs its full analytic/pole inputs, explicitly recorded as a supplier gap.

Construction or proof:

1. Apply the imported A₄/V₄ classification to construct the cyclic cubic extension and the dihedral restriction.
2. Descend its quadratic induction using cyclic descent and its precise twist fiber.
3. Use the adjoint and cubic-character-induction comparison, GL₃ strong multiplicity one and pole criterion; compare determinant and adjoint to recover the rank-two Frobenius data.
4. Complete all-place compatibility using the supplied local transfer/LLC interfaces and the Artin L-function identities; record this source normalization, not just equality at good primes.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition`, `ArithmeticGaloisRepresentations:R01.4`, `GL2AutomorphicRepresentationsAndTransfer:R16.5`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3 Theorem 3.3 and surrounding proof, pp. 15–21. The read passage supports the stated consumer theorem or comparison; the original proof and any missing upgrade are explicitly separated as gaps in this node and packet.

Acceptance checks:

- For order-three η, equality of determinants of π and π⊗η^i forces η^{2i}=1 and hence i=0.
- Without the GL₃ analytic comparison, the existence of some cyclic descent does not identify the desired Artin parameter.

### Octahedral Artin automorphy

Declaration `TauCeti.GL2Transfer.octahedral_artin` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`.

For a number field F and a continuous irreducible finite-image ρ:G_F→GL₂(C) with projective image S₄, there is a unique cuspidal automorphic π with normalized local parameter ρ at every place. First restrict to the quadratic field cut out by A₄ and apply the tetrahedral theorem. The two cyclic descents have the same determinant, so determinant matching cannot choose between them. Tunnell’s proof uses the nonnormal cubic field attached to a Sylow-2 subgroup, the resulting dihedral restriction, and the GL₃/GL₂×GL₃ analytic comparison to identify the correct descent. Langlands’s earlier restricted octahedral assertions over Q are not substituted for Tunnell’s all-number-field theorem. The original Tunnell 1981 proof has not been obtained; its crucial comparison is a source-proof gap.

Construction or proof:

1. Use the A₄ normal subgroup to obtain quadratic descent candidates and retain both possible quadratic twists.
2. Use the index-three dihedral restriction and nonnormal cubic base change to distinguish them with Tunnell’s analytic argument.
3. The JPSS analytic transfer and Tunnell proof are required source gaps, not inferred from determinant matching.
4. Use R16.4 uniqueness and all-place Artin identities in the completed theorem.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition`, `GL2AutomorphicRepresentationsAndTransfer:R16.5`, `ArithmeticGaloisRepresentations:R01.4`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.2.1(a)–(c), p. 457; citation [Tu. 2] to Tunnell, Bull. AMS 5 (1981), 173–175. The read passage supports the stated consumer theorem or comparison; the original proof and any missing upgrade are explicitly separated as gaps in this node and packet.

Acceptance checks:

- For quadratic η, det(π⊗η)=det π, so determinant alone leaves both descents.
- The cubic subgroup is not normal in S₄; prime-cyclic descent cannot replace its transfer.

### Langlands–Tunnell strong Artin theorem

Declaration `TauCeti.GL2Transfer.solvable_artin` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`.

Let F be a number field and ρ:G_F→GL₂(C) be continuous finite-image irreducible with solvable projective image. There is a unique cuspidal GL₂ automorphic representation π such that, in the fixed Artin/LLC normalization, rec_Fv(π_v)≅ρ|_{W_Fv} for every place v, and the standard Artin and automorphic L- and epsilon-factors agree. The finite-image projective classification leaves dihedral, A₄ and S₄; a cyclic projective image would make the representation reducible. Solvability of linear and projective finite images is equivalent because their scalar kernel is abelian. Over totally real F, total oddness gives holomorphic parallel weight one; automorphy itself has no oddness requirement. This is the strong rank-two theorem, not merely holomorphy of the Artin L-function.

Construction or proof:

1. Import the finite subgroup classification and apply the dihedral, tetrahedral or octahedral theorem.
2. Record all-place compatibility and uniqueness in the common normalization; use the GL₂ dictionary to obtain weight-one consequences only under the stated infinity condition.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R16.5`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `ArithmeticGaloisRepresentations:R01.4`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Jonathan D. Rogawski and Jerrold B. Tunnell, On Artin L-functions associated to Hilbert modular forms of weight one](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0005.pdf), Introduction pp. 1–3; §1 weight-one infinite component, p. 4 (visual reading). The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- Over Q an odd irreducible S₄ representation gives a holomorphic weight-one newform.
- GL₂(F₉) itself is not a solvable-image hypothesis; the pinned nonsolvability theorem prevents this false shortcut.

### Odd Artin representations and classical weight one

Declaration `TauCeti.GL2Transfer.q_weight_one` (comparison); node `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`.

For ρ as in solvable-artin over Q with det ρ(c)=−1, the R16.6 dictionary yields a normalized holomorphic cuspidal weight-one newform f with exact Artin conductor N(ρ), nebentypus det ρ under reciprocity, and good-prime characteristic polynomial X²−a_ℓ(f)X+det ρ(Frob_ℓ). Its coefficients lie in a number field. To reduce modulo p choose a place λ above p, an embedding of its residue field into a common algebraic closure, and a stable lattice in a coefficient realization of ρ. Weight one here is not the weight≥2 cohomological construction used in Hilbert varieties.

Construction or proof:

1. Apply the odd archimedean local dictionary to solvable-artin; use R16.2 newvectors for conductor and R16.6 normalization.
2. Use finite-image coefficient realization and stable-lattice data from R01.1; compare full Frobenius polynomials with R01.5.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.5`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2 proof of the main theorem, pp. 306–308. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- A chosen λ is necessary: the rational prime p alone does not identify a reduction.
- An even irreducible finite-image representation does not give this holomorphic weight-one conclusion.

### Totally odd Artin representations and Hilbert weight one

Declaration `TauCeti.GL2Transfer.tr_weight_one` (comparison); node `GL2AutomorphicRepresentationsAndTransfer:R17.5/tr-weight-one`.

For F totally real and ρ as in solvable-artin with det ρ(c_v)=−1 at every real place, the automorphic π is holomorphic parallel-weight-one Hilbert cuspidal in the R16.6 extended dictionary. The local infinite representation is the weight-one principal-series/limit parameter induced from (1,sign), as in Rogawski–Tunnell §1; it is not a cohomological weight≥2 discrete-series parameter. The finite conductor, central character and local Artin factors are those of ρ. This node exports the weight-one input to residual modularity arguments, without duplicating Hilbert Shimura-variety geometry or claiming a missing weight-one cohomological Galois construction.

Construction or proof:

1. Apply the real-place parameter classification and the Artin automorphy theorem.
2. Request the exact weight-one adelic/holomorphic extension of R16.6; the existing cohomological-only wording does not suffice.
3. Retain coefficient realization and the chosen residual place when this form is used modulo p.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `ArithmeticGaloisRepresentations:R01.1`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Jonathan D. Rogawski and Jerrold B. Tunnell, On Artin L-functions associated to Hilbert modular forms of weight one](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0005.pdf), Introduction pp. 1–3 and §1 p. 4, visually read. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- Total oddness must hold at every real place, not just one.
- The infinity type is not silently replaced by weight-two discrete series.

### Solvable residual lifting in odd characteristic

Declaration `TauCeti.GL2Transfer.odd_residual_lift` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift`.

Let F be totally real, p>2, and r̄:G_F→GL₂(F̄_p) be continuous, absolutely irreducible and totally odd with solvable image. There is a totally odd continuous finite-image characteristic-zero lift ρ over a number field, a place λ above p and a stable lattice whose semisimplified reduction is r̄ after a specified residue-field embedding. The proof uses the finite-image classification, Serre’s characteristic-zero lifting argument and Tate’s arithmetic obstruction vanishing; Tate alone only lifts a projective homomorphism and does not ensure the prescribed residual reduction. Coefficient enlargement is allowed. The Serre 1977 proof of the reduction-preserving step is an explicit source-proof gap in this packet.

Construction or proof:

1. Split the finite solvable image into the relevant projective cases, applying the finite representation-theoretic lifting result cited as Serre [1977] by BCGP.
2. Use arithmetic Tate lifting to remove the scalar obstruction while preserving the residual data; retain the coefficient field, λ and lattice in the output.
3. At p>2 the non-scalar residual involution forces each characteristic-zero c_v to have eigenvalues +1,−1.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-projective-lift`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proposition 10.1.3 proof, p. 474; Theorem 10.2.6 proof, p. 481. The read passage supports the stated consumer theorem or comparison; the original proof and any missing upgrade are explicitly separated as gaps in this node and packet.

Acceptance checks:

- The result includes p=3 but is not limited to that prime.
- A random characteristic-zero projective lift with the correct projectivization need not reduce to the specified r̄.

### Solvable residual modularity over totally real fields

Declaration `TauCeti.GL2Transfer.residual_lt_application` (application); node `GL2AutomorphicRepresentationsAndTransfer:R17.5/residual-lt-application`.

For F,p,r̄ as in odd-residual-lift, apply Langlands–Tunnell to its totally odd finite-image lift and obtain a parallel-weight-one Hilbert cuspidal form whose chosen λ-adic reduction realizes r̄. This is the qualitative residual modularity input used in BCGP Proposition 10.1.3 and Theorem 10.2.6. Subsequent ordinary weight-two lifts, auxiliary solvable extensions and GSp₄ transfer in those arguments require their own lifting/weight-change owners and are not consequences of Langlands–Tunnell alone. No unchanged conductor or ordinary local condition is promised by this application.

Construction or proof:

1. Combine odd-residual-lift with tr-weight-one and retain the exact residue-field/lattice identification.
2. Pass the witness, with its actual weight, level and place, to downstream modularity-lifting and symplectic-transfer owners.
3. Keep the BLGG ordinary-weight-two adjustment cited by BCGP separate from the weight-one theorem.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tr-weight-one`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.5`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proposition 10.1.3 and proof, pp. 473–475; Theorem 10.2.6 and proof, pp. 480–481. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- The output includes a chosen place above p and a stable lattice.
- Solvable-image modularity does not supply an ordinary weight-two automorphic lift without a separate theorem.

Layer status: **planned**. Every current stage target has a precise declaration node and its prerequisite chains end in a read baseline/supplier, an explicit request, or a named gap. The target-level pass is complete; the stage is not closed.

Closure work:

- Obtain original Tunnell 1981 and Serre 1977 proofs; decompose the determinant/adjoint recognition and reduction-preserving residual lifting steps.
- Complete the GL₃ analytic supplier and the exact totally real weight-one extension of R16.6; keep weight-two ordinary adjustment downstream.

## R17.6 — Characteristic-two cases and transfer interfaces

The characteristic-two application first distinguishes a solvable projective dihedral image from the linear-dihedral hypothesis of Rohrlich–Tunnell. The unique square root of the determinant removes the scalar character, which must be retained for twisting back. The exact conductor and weight conclusion is restricted to the source's allowed dyadic discriminant cases. Its technical lemma includes the auxiliary-prime and Fourier-coefficient conditions; omitting them would incorrectly include the discriminant-valuation-two case.

Wiese supplies a broader odd lift without a general unchanged-conductor promise, and a Katz weight-one form of exact odd conductor when the residual representation is unramified at two. Two auxiliary stabilized forms first establish independence of auxiliary level structures; only then does the exact descent statement apply. Hasse multiplication, Deligne–Serre lifting and the generic residual-modularity witness are imported from R15. Qualitative modularity does not include general minimal weight or level lowering.

The remaining exports preserve irreducibility under specified disjointness, give the exact bad-dihedral restriction criterion, and compare supplied compatible families under base change or descent. A common finite-order descent character must work for every coefficient place. Potential modularity receives these conditional interfaces and owns extension construction and compatible-family existence. Carayol's extraordinary dyadic comparison follows the Artin theorem and exports to R19 without a reverse dependency.

Planets: Rohrlich–Tunnell weight and level lemma, Rohrlich–Tunnell theorem, Wiese’s dihedral lifting lemma, Dihedral Katz weight-one theorem, Characteristic-two solvable modularity.

### Extraordinary dyadic compatibility under cubic base change

Declaration `TauCeti.GL2Transfer.extraordinary_cubic_compatibility` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/extraordinary-cubic-compatibility`.

Let F be p-adic, π an extraordinary cuspidal GL₂(F) representation and ρ its normalized irreducible two-dimensional Weil parameter with tetrahedral or octahedral projective image. For a degree-at-most-three local extension L/F, Carayol Proposition 12.2.2 identifies the base-changed local π with the automorphic local representation of ρ|_{W_L}; the latter is irreducible. In the degree-three reduction, choose the preimage of a Sylow-2 subgroup: the tetrahedral cubic is cyclic, the octahedral cubic is non-Galois. If another two-dimensional parameter has the same determinant and the same restriction to this cubic subgroup, it is isomorphic to ρ. This determinant-plus-restriction recognition is not a blanket theorem for arbitrary index-three subgroups.

Construction or proof:

1. Use Carayol §12.1.2 to reduce the projective image to a dihedral subgroup of index three and §12.1.3 for determinant-plus-restriction recognition.
2. Globalize the finite-image primitive Weil representation as in the cited Tunnell 1978 theorem after removing the unramified twist; this precise input is recorded as a source gap.
3. Use the strong finite-image Artin modularity node in R17.5 and the cubic transfer; global strong multiplicity one matches the two restrictions, proving the local compatibility. This dependence is acyclic: Artin modularity uses existence of cubic transfer, not this local comparison.
4. Export this theorem and cyclic compatibility to Carayol/Saito in R19.2, hence R19.4–R19.5.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `ArithmeticGaloisRepresentations:R01.4`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.1.2–12.2.2, pp. 456–458; §12.3 application, pp. 458–459. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- Octahedral index-three restriction cannot be justified by prime-cyclic base change alone.
- Comparing determinants and the selected restriction is sufficient; arbitrary equal traces after restriction are not the stated recognition criterion.

### Solvable characteristic-two images are dihedral

Declaration `TauCeti.GL2Transfer.solvable_dihedral` (application); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/solvable-dihedral`.

Let r̄:G_Q→GL₂(F̄₂) be continuous and absolutely irreducible, with solvable projective image. Apply R01.4 finite subgroup classification: its projective image is D_n for an odd n≥3. After removing a scalar character, the linear image is dihedral of order 2n. A cyclic projective image or an affine solvable subgroup fixing a line is excluded by absolute irreducibility. This is a Galois application of the existing finite-group classification, not a second classification proof. In characteristic two the determinant condition at complex conjugation is vacuous, so it cannot be used to deduce that a naive complex lift is odd.

Construction or proof:

1. Use continuity and the discrete residual coefficient field to obtain a finite image.
2. Apply the imported classification and exclude line-preserving cases by absolute irreducibility.
3. Use determinant-untwist to pass to the linear-dihedral hypothesis of Rohrlich–Tunnell; retain the scalar character for twisting back.

Direct prerequisites: `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Introduction definition of dihedral, pp. 123–125; §5 finite-image irreducibility discussion. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- A reducible upper-triangular residual representation is not included.
- The classical Rohrlich–Tunnell theorem assumes linear-dihedral image; a scalar twist is recorded explicitly.

### Removing the characteristic-two scalar character

Declaration `TauCeti.GL2Transfer.determinant_untwist` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`.

For finite-image absolutely irreducible r̄:G_Q→GL₂(F̄₂) with dihedral projective image D_n, n odd≥3, the determinant character has odd order and a unique finite-order square root ξ. The twist r̄₀=r̄⊗ξ^{-1} has determinant one and linear image D_n. Indeed a finite scalar in SL₂(F̄₂) is trivial, so projection is injective on this finite image. Twisting a residual modular form back by ξ (via reciprocity and a finite coefficient extension) recovers r̄; level and nebentypus are then recomputed using the actual twist, not held fixed.

Construction or proof:

1. Use that every finite subgroup of F̄₂× has odd order; squaring is an automorphism, giving ξ.
2. The central kernel after determinant normalization consists of scalars a with a²=1 and is trivial in characteristic two.
3. Use the supplied twist and conductor interfaces to return to the original representation.

Direct prerequisites: `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2 first paragraph, p. 306; scope comparison in Wiese Introduction p. 125. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- For a nontrivial scalar twist the original determinant need not be one.
- Correcting the determinant can change conductor; an exact original-level claim requires a separate twist conductor calculation.

### Teichmüller lift and the four dyadic conductor cases

Declaration `TauCeti.GL2Transfer.teichmuller_conductor` (comparison); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`.

Let r̄₀:G_Q→GL₂(F̄₂) have irreducible linear-dihedral image of order 2n, n odd≥3. Write r̄₀=Ind_{G_K}^{G_Q}φ, for the uniquely determined quadratic K, and let φ̃ be its same-order complex Teichmüller lift at a chosen place λ|2. The induced ρ̃ preserves the dimension of the 1-eigenspace of every group element, including the reflection whose residual matrix need not be semisimple. Thus its prime-to-two Artin conductor is N=N(r̄₀), and |D_K| Norm(f(φ̃))=2^νN. The possibilities are: (i) both factors odd, ν=0; (ii) D≡±5 mod 8 and Norm f≡4 mod 8, ν=2; (iii) D≡4 mod 8 and Norm f odd, ν=2; (iv) 8|D and Norm f odd, ν=3. The printed second occurrence of (iii) in the ν=3 sentence is corrected in sourceIssues E1.

Construction or proof:

1. Use the induced matrix formula and same-order odd roots of unity to compare fixed-space dimensions.
2. Apply the imported Artin induction-conductor formula and the quadratic local ray-character analysis at two.
3. Retain the reflection fixed line when reducing the involution in characteristic two; semisimplicity of every individual matrix is not assumed.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`, `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2 conductor formula and cases (i)–(iv), pp. 306–307. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- For a reflection, the induced integral matrix [[0,1],[1,0]] has complex eigenvalues 1,−1 and reduces to a nontrivial unipotent matrix; both fixed spaces have dimension one.
- D≡4 mod 8 has ν=2, not ν=3.

### Rohrlich–Tunnell’s weight and level lemma

Declaration `TauCeti.GL2Transfer.rt_technical_lemma` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`.

Fix a coefficient place λ|2. Suppose g=Σb(n)q^n is a normalized primitive weight-one form of level 2^νNr and quadratic character χ, with ν∈{0,2,3}, N odd, r=1 or an odd prime not dividing N, and N=N(r̄_g). If r≠1 require b(r)≢1 mod λ; if ν=2 require b(n)=0 for every even n; if ν=3 require b(2)≢0 mod λ. Then there is a primitive form f of exact level N and trivial character, weight k=2 for ν∈{0,2} and k=4 for ν=3, with r̄_f≅r̄_g. These extra Fourier conditions are essential. The theorem is a specialized arithmetic application of the imported Deligne–Serre lifting and old/newform theory, not a replacement for them.

Construction or proof:

1. Follow §1’s three case computations: square/Frobenius coefficient untwist, dyadic trace/Atkin–Lehner operators, and the residual away-two eigenvalues.
2. Apply the existing DS eigenvalue-lifting lemma over a dominating DVR after coefficient extension; extract a primitive form using R16.6 old/newforms.
3. Remove the auxiliary r using its non-±1 residual eigenvalue and newvector/Atkin–Lehner theory; compare full characteristic polynomials to recognize r̄.
4. The resulting primitive level M divides N; the imported conductor bound N(r̄_f)|M forces M=N. The ν=2 even-coefficient hypothesis is used in the dyadic trace identity.

Direct prerequisites: `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`, `AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.5`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §1 Lemma and full three-case proof, pp. 302–306. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- In dyadic case (iii), b(2)≠0 violates the ν=2 hypothesis; this lemma gives no exact-level conclusion.
- The exact conductor equality follows after recognition, not from the existence of an old eigenform.

### The real-quadratic odd-lift trick

Declaration `TauCeti.GL2Transfer.serre_odd_trick` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`.

In the linear-dihedral setting above with K real quadratic, there exist a degree-one prime ideal 𝔯 coprime to 2N and a quadratic Hecke character ξ of K ramified exactly at one real place and at 𝔯, with φ̃(𝔯)≠1. Then Ind(φ̃ξ) is odd, reduces to r̄₀ at λ|2, and has conductor 2^νN·r with r=Norm 𝔯. Its normalized weight-one form has b(r)≢1 mod λ. The dyadic coefficients still satisfy b(even)=0 in case (ii) and b(2)≢0 in case (iv). This controlled auxiliary ramification is the precise Serre trick used by Rohrlich–Tunnell, distinct from Wiese’s trace-zero choice of auxiliary primes.

Construction or proof:

1. Use narrow/wide ray classes and Chebotarev to find 𝔯 in the prescribed class with a generator of mixed signature and congruent to 1 mod 4.
2. Use the associated quadratic extension and reciprocity to obtain ξ; it reduces to one in characteristic two.
3. Compute b(r) from the conjugate prime and use the nontrivial odd-order value of φ̃.
4. Apply dihedral-artin and q-weight-one to the now odd complex induction.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`, `ArithmeticGaloisRepresentations:R01.3`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2 real-quadratic proof and Remarks 1–2, pp. 307–308. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- The untwisted real-quadratic complex induction is even and does not give a holomorphic weight-one form.
- The quadratic ξ disappears modulo two but its auxiliary characteristic-zero conductor is retained.

### Rohrlich–Tunnell characteristic-two modularity

Declaration `TauCeti.GL2Transfer.rohrlich_tunnell` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/rohrlich-tunnell`.

Let r̄₀:G_Q→GL₂(F̄₂) be continuous irreducible with linear-dihedral image, quadratic induction field K and odd prime-to-two conductor N. If the discriminant D_K is odd or divisible by eight, r̄₀ is realized at a chosen coefficient place λ|2 by a normalized primitive classical form of exact level N, trivial character, and weight 2 when ν=0 or 2, or weight 4 when ν=3. For imaginary K use the odd Teichmüller induction; for real K use the preceding controlled odd-lift trick and remove its auxiliary prime with the technical lemma. The theorem does not cover D≡4 mod 8, and its exact trivial-character conclusion applies to the determinant-normalized representation, not an arbitrary scalar twist.

Construction or proof:

1. Apply teichmuller-conductor and split the imaginary/real quadratic cases.
2. Supply every Fourier hypothesis of rt-technical-lemma using the corresponding dyadic cases and serre-odd-trick.
3. Keep case (iii) out: its nonzero b(2) fails the ν=2 condition, exactly as the source explains.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2 Theorem and proof, pp. 307–308. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- Odd D gives weight two, except the inert ramified-character branch still has ν=2 and weight two.
- For 8|D the prescribed weight is four; D≡4 mod 8 is not smuggled into the theorem.

### Odd characteristic-zero lifts of mod-two dihedral representations

Declaration `TauCeti.GL2Transfer.wiese_odd_lift` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`.

Every continuous absolutely irreducible dihedral r̄:G_Q→GL₂(F̄₂) admits an odd finite-image characteristic-zero dihedral lift after choosing a cyclotomic coefficient field, λ|2 and a stable lattice reducing to r̄. Wiese Lemma 3 constructs it by lifting the inducing character and, when K is real quadratic, adding a mixed-signature quadratic character. No unchanged conductor is asserted in this general lemma. If r̄ is unramified at two, Lemma 2 refines the alternatives: either an odd lift of exact conductor N exists, or K is real quadratic and infinitely many auxiliary primes ℓ give odd lifts of conductor Nℓ and tr r̄(Frob_ℓ)=0. This result covers projective-dihedral scalar twists as well as linear-dihedral image.

Construction or proof:

1. Use the same-order lift of the inducing character and inspect oddness at complex conjugation.
2. In the even real-quadratic case use a quadratic extension of mixed signature; its character reduces to one mod two.
3. For the unramified-at-two refinement follow the narrow ray-class choice in Lemma 2; record the trace-zero auxiliary-prime condition and the exact Nℓ conductor.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Lemma 2 and proof pp. 126–127; Lemma 3 and proof p. 127. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- Even real-quadratic induction is repaired by a character trivial modulo two.
- The general Lemma 3 does not promise the conductor of Lemma 2.

### Unramified mod-two dihedral Katz weight one

Declaration `TauCeti.GL2Transfer.unramified_katz` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz`.

If r̄:G_Q→GL₂(F̄₂) is continuous absolutely irreducible dihedral and unramified at two, there is a normalized cuspidal Katz weight-one eigenform of exact odd conductor N(r̄) and character det r̄ whose associated residual representation is r̄. Wiese’s two-auxiliary-prime construction works even for exceptional residual parameters at two. It does not assert a characteristic-zero weight-one lift at the same level: the real quadratic example K=Q(√229) exhibits why that stronger assertion fails. Generic q-expansion descent and the oldform calculations are imported from R15/R16; the new arithmetic combination is this theorem.

Construction or proof:

1. If Wiese Lemma 2 gives a conductor-preserving odd lift, apply dihedral weight-one automorphy and reduce.
2. Otherwise choose two trace-zero auxiliary primes; apply Proposition 4/Corollary 5 to obtain full Hecke eigenforms after stabilization.
3. Compare the two stabilized q-expansions at their common auxiliary level using the supplied q-expansion principle. Prove independence of each auxiliary level structure, then apply Proposition 7 and Corollary 8 to descend; this independence/descent statement is requested from R15.2.
4. Recognize the residual representation from full characteristic polynomials and retain the Katz form even when no classical weight-one lift exists.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization`, `AlgebraicModularFormsAndSerreWeights:R15.1/cusp-ideal-section-forms`, `AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `ArithmeticGaloisRepresentations:R01.5`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Proposition 7 p. 129; Theorem 9 and proof pp. 129–130; Introduction example p. 124. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- An exceptional Frobenius at two is included; distinguish this from the excluded characteristic-zero same-level lift.
- Ramified-at-two minimal-weight modularity uses Wiese Theorem 10’s deep weight/level lowering, outside this elementary interface.

### Characteristic-two solvable residual modularity

Declaration `TauCeti.GL2Transfer.qualitative_residual_modularity` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/qualitative-residual-modularity`.

Every continuous absolutely irreducible r̄:G_Q→GL₂(F̄₂) with solvable projective image is realized by a holomorphic cuspidal eigenform after choosing a coefficient number field, λ|2, a residue-field embedding and a stable lattice. The qualitative proof applies finite classification and Wiese’s odd lift, then dihedral Artin weight-one automorphy. If one wants a weight≥2 witness, apply the existing R15.5 reduction/true-eigenform result, using Hasse powers only when Katz realization is the input and the integral lifting criterion has been met. This broad existence theorem does not claim the exact minimal weight, level or trivial character of the restricted Rohrlich–Tunnell theorem.

Construction or proof:

1. Apply solvable-dihedral; use either its explicit scalar untwist and twist back or Wiese’s projective-dihedral odd lift directly.
2. Use the odd complex induction and the weight-one newform dictionary, retaining all coefficient/lattice data.
3. Pass to the existing R15.6 residual-modularity witness; its generic carrier is not rebuilt here.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.6/solvable-dihedral`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`, `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-witness`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Lemma 3 p. 127; discussion p. 125; Introduction pp. 123–124. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- All solvable projective images in characteristic two are covered without an odd determinant assumption.
- The produced witness may have auxiliary level or weight; those are recorded rather than silently minimized.

### Transfer to the weight-at-least-two residual witness

Declaration `TauCeti.GL2Transfer.weight_two_witness` (application); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/weight-two-witness`.

Given either an odd complex weight-one dihedral form reducing to r̄ or the preceding unramified Katz form, obtain the R15.6 residual-modularity witness with some weight k≥2 and its actual primitive level. For a Katz input in characteristic two the Hasse invariant has weight one and q-expansion one, so a suitable power preserves the residual away-two eigencharacter. Choose the power large enough for R15.5’s finite-free integral realization and cohomological lifting criterion; multiplication alone does not produce a characteristic-zero eigenform. Apply the DS lemma to the commuting Hecke action over a dominating DVR, then the true-eigenform/old-newform reduction. Record K_f, λ|2, common residue-field embeddings and a stable lattice realizing r̄ semisimply. This application imports Hasse, DS and the witness definition unchanged.

Construction or proof:

1. Use H and WEIGHT for the weight and integral-lifting conditions; k≥2 alone need not be the full geometric criterion.
2. Use DS to lift the residual eigencharacter after finite coefficient extension, without claiming a prescribed eigenvector lift.
3. Use the existing true-eigenform reduction and R01.5 to recognize r̄ from good-prime characteristic polynomials; keep the actual level divisor and all places/embeddings.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.6/qualitative-residual-modularity`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz`, `AlgebraicModularFormsAndSerreWeights:R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one`, `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`, `AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`, `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-witness`, `ArithmeticGaloisRepresentations:R01.5`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Introduction pp. 123–124; Theorem 9 proof, pp. 129–130. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- At p=2 multiplying weight one by H raises weight by one and preserves q-expansion, but does not alone prove characteristic-zero lifting.
- Reduction is compared at the chosen λ; weight one and a generic weight≥2 witness are distinct outputs.

### Residual irreducibility under disjoint base change

Declaration `TauCeti.GL2Transfer.disjoint_irreducibility` (theorem); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/disjoint-irreducibility`.

Let F be a number field and r̄:G_F→GL₂(k̄) be continuous absolutely irreducible with finite projective image; let M/F be the finite Galois extension fixed by the projective kernel. For any finite E/F linearly disjoint from M over F, the projective image of r̄|_{G_E} equals that of r̄, and the restriction is absolutely irreducible. It suffices, more strongly, to be disjoint from the field fixed by the full linear kernel. Solvability of E/F by itself does not preserve irreducibility. This is the exact finite-image application exported to Moret–Bailly/potential modularity; the construction of E with prescribed local conditions and disjointness belongs to R23.1.

Construction or proof:

1. Use E∩M=F and Galois restriction to see that G_E surjects to Gal(M/F).
2. A line stabilized by the restricted representation would then be stabilized by every projective image element, hence by r̄ itself.
3. Export the sufficient disjointness condition; do not import the downstream extension-construction theorem into this packet.

Direct prerequisites: `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.4`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), §2 induced formula, pp. 125–126; §5 Lemma 11 irreducibility discussion, pp. 131–132. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- An extension containing the quadratic induction field can make a dihedral representation reducible.
- Disjointness from the projective-kernel field suffices even when the scalar image changes.

### The bad-dihedral quadratic restriction condition

Declaration `TauCeti.GL2Transfer.quadratic_restriction` (application); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/quadratic-restriction`.

For a finite-image irreducible rank-two r=Ind_{G_K}^{G_F}θ with K/F quadratic and a finite E/F, restrict the imported Mackey criterion: r|_{G_E} is irreducible exactly when G_E is not contained in G_K and θ|_{G_{EK}}≠θ^σ|_{G_{EK}}. If E contains K it is reducible as the sum of the two restricted characters. In particular quadratic or solvable base changes must be checked against this criterion; the same loss of cuspidality is seen in quadratic automorphic induction/base change. Generic induction and Clifford theory remain with InductionRestriction/R01.4.

Construction or proof:

1. Apply the canonical Mackey decomposition to the index-two subgroup and use its two-character irreducibility criterion.
2. Compare the criterion with quadraticInduction_baseChange and the cyclic self-twist cuspidality node.
3. Pass the actual criterion to compatible-system and potential-modularity applications; do not replace it by a blanket solvable-extension assertion.

Direct prerequisites: `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-4-intertwining-numbers-and-the-mackey-irreducibility-criterion`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), §2 formula pp. 125–126; Lemma 11 and proof pp. 131–132. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- Restriction to K of an irreducible quadratic induction is reducible.
- Even E not containing K can identify the two restricted characters; exclude that case explicitly.

### Base change of a supplied compatible system

Declaration `TauCeti.GL2Transfer.compatible_base_change` (comparison); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-base-change`.

Given a compatible family {ρ_λ} over F with a common coefficient field and good-prime characteristic polynomials P_v, and a GL₂ automorphic π matching those polynomials in the fixed normalization, restriction to a finite solvable Galois E/F matches BC_{E/F}(π) at good w|v by the Frobenius power formula: if P_v has roots α,β, the new polynomial has roots α^{f(w/v)},β^{f(w/v)}. Keep the residual cuspidality/irreducibility conditions from cyclic-base-change and disjoint-irreducibility; apply quadratic-restriction for dihedral exceptions. This theorem takes the compatible system as data. Existence of an attached family, its integral lattices and the geometric realization belong to R19/R24 and are not proved here.

Construction or proof:

1. Use arithmetic Frobenius restriction Frob_w→Frob_v^{f(w/v)} and the local cyclic/tower transfer formulas.
2. Compare full characteristic polynomials for every coefficient place, preserving the common coefficient field and normalization.
3. Apply the disjointness or bad-dihedral criterion before passing a cuspidal/irreducible claim downstream.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/disjoint-irreducibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/quadratic-restriction`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.5`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2 properties (B), (D)–(F), pp. 6–12; §11 verification, pp. 150–152. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- For α=2,β=3,f=2 the new trace is 13 and determinant is 36, not the square of trace 5.
- At residue degree one the good polynomial is unchanged.

### Automorphic descent with a consistent compatible-system twist

Declaration `TauCeti.GL2Transfer.compatible_descent` (comparison); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-descent`.

Let E/F be cyclic of prime degree, Π cuspidal over E and Galois-stable, and let {r_λ} be supplied representations of G_F whose restrictions match the family attached to Π. Choose one actual automorphic descent π of Π. A matching descent must choose a single finite-order character η^i of Gal(E/F), independent of λ, so that the good-prime characteristic polynomials of π⊗η^i agree with those of every r_λ in their common coefficient field. Under that equality, R01.5 identifies each r_λ with the corresponding attached member. The existence of Galois descents or independent λ-dependent twists alone does not give this automorphic matching. In a solvable tower impose this condition at each prime-cyclic step, with its actual descent fiber and local data.

Construction or proof:

1. Use cyclic-descent to obtain π and cyclic-descent-fibers to enumerate its ambiguity.
2. Use the common polynomial data to choose and check one character across the entire family; neither arbitrary character choices nor determinant alone at degree two suffice.
3. Apply full-polynomial recognition to identify each member and iterate only after the stepwise matching condition is met.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent`, `ArithmeticGaloisRepresentations:R01.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 Theorem 3.1, pp. 201–202; Theorem 5.1, pp. 212–213. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- A quadratic determinant does not distinguish π from π⊗η.
- Two different choices at two coefficient places do not constitute a compatible descent over a common coefficient field.

### Transfer interface for potential modularity

Declaration `TauCeti.GL2Transfer.potential_modularity_interface` (application); node `GL2AutomorphicRepresentationsAndTransfer:R17.6/potential-modularity-interface`.

Given a finite solvable Galois extension E/F with the prescribed local completions and disjointness hypotheses supplied by potential modularity, and a cuspidal automorphic representation over E matching a specified rank-two Galois representation there, export the following conditional interface: irreducibility survives under the disjointness criterion; local transfer uses the exact completion-wise restriction; descent to F is available through a prime-cyclic tower when the automorphic Galois-invariance and stepwise consistent character matching of compatible-descent hold. A Galois representation descending to F is not by itself evidence that an arbitrary Π over E admits the needed automorphic descent. Extension construction, potential automorphy and compatible-family existence stay with R23/R24.

Construction or proof:

1. Consume the extension/local/disjointness data as hypotheses rather than reconstructing the downstream geometric theorem.
2. Apply prescribed-local-base-change and disjoint-irreducibility.
3. Apply compatible-descent step by step only after its automorphic invariance and common-character conditions have been checked.

Direct prerequisites: `GL2AutomorphicRepresentationsAndTransfer:R17.4/prescribed-local-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/disjoint-irreducibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-descent`.

Proposed library location: `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

Source: [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 §4–§5, pp. 202–213, with the stated stepwise transfer/descent hypotheses. The stated source passage supplies the result, in the normalization and restricted scope described in the statement.

Acceptance checks:

- A non-Galois cubic extension uses cubicBaseChange, not the solvable-Galois tower interface.
- The interface exports sufficient conditions; it does not assert unconditional automorphic descent from Galois descent.

Layer status: **planned**. Every current stage target has a precise declaration node and its prerequisite chains end in a read baseline/supplier, an explicit request, or a named gap. The target-level pass is complete; the stage is not closed.

Closure work:

- Write the exact requested Katz auxiliary-level q-expansion descent and Hecke stabilization formulations in R15.2.
- Obtain the Tunnell 1978 globalization input to the late extraordinary dyadic comparison, after Artin automorphy.
- Refine Rohrlich–Tunnell’s three dyadic computations and conditional compatible-system interfaces once the arithmetic/automorphic supplier carriers are compiled; no claim of general minimal-weight level lowering.

## Supplier requests

These are exact missing interfaces, rather than new definitions of their suppliers’ objects. Read supplier nodes are imported by their full node IDs in the declarations above. The existing R15 q-expansion principle supplies comparison and coefficient detection, but does not assert arbitrary auxiliary-level descent; Wiese’s independence criterion is a separate request.

### `GL2AutomorphicRepresentationsAndTransfer:R16.1`

The existing number-field GL₂ automorphic carrier, local components and restricted tensor-product decomposition, with central character and finite-level Hecke actions; no replacement carrier in this packet.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.2`

Rank-two local classification, newvectors, arithmetic Hecke normalization and the distinction between principal series, twists of Steinberg and supercuspidal representations.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/norm-exception`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.3`

Arithmetic-normalized rank-two LLC, compatibility of twists, determinants, local factors and Weil–Deligne restriction, including extraordinary dyadic parameters.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/local-factors`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/unramified-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/extraordinary-cubic-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.4`

Number-field GL₂ strong multiplicity one for cuspidal/isobaric representations; cohomological coefficient conjugation and rational-model comparison with the possible descent obstruction made explicit.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/strong-multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/coefficient-conjugation`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/tower-independence`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/extraordinary-cubic-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.5`

The GL₂ converse theorem with the full character-twist family, growth, entireness/pole and functional-equation hypotheses, retaining all-place local factors.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.6`

The normalized newform/adelic dictionary over Q including odd finite-image weight one, and its totally real holomorphic parallel-weight-one extension (outside the present cohomological-only Hilbert wording).

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tr-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz`.

### `GL2AutomorphicRepresentationsAndTransfer:R17.1`

Quaternionic local JL: division places correspond to essentially discrete series; local characters correspond to Steinberg twists; real algebraic weights and split-place identifications use the fixed normalization.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/norm-exception`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/invariant-exchange`.

### `GL2AutomorphicRepresentationsAndTransfer:R17.2`

The actual GL₂/quaternion and prime-cyclic trace comparisons with matching test functions, Haar measures, central characters and every continuous/residual cancellation; this is the engine used below.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`.

### `ArithmeticGaloisRepresentations:R01.1`

Continuous finite-coefficient and finite-image characteristic-zero rank-two representations, coefficient extensions, stable lattices, semisimplified reduction, restriction and character twisting on the canonical carrier.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-projective-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tr-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/residual-lt-application`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/solvable-dihedral`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/disjoint-irreducibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-base-change`.

### `ArithmeticGaloisRepresentations:R01.3`

Artin conductors, their induction formula, invariance dimensions, prime-to-p conductor of reduction and ramification under twists.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`.

### `ArithmeticGaloisRepresentations:R01.4`

Finite GL₂/PGL₂ classification over algebraically closed fields, solvable images and irreducibility, characteristic-two odd-order dihedral case, and bad-dihedral restriction criterion; apply it to finite Galois images here.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.6/extraordinary-cubic-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/solvable-dihedral`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/disjoint-irreducibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/quadratic-restriction`.

### `ArithmeticGaloisRepresentations:R01.5`

Recognition of semisimple representations by full Frobenius characteristic polynomials, coefficient descent and Brauer–Nesbitt; trace alone is insufficient in characteristic two.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/residual-lt-application`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/weight-two-witness`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-descent`.

### `AutomorphicLFunctionsAndLocalFactors:AL.3`

GL₃ and GL₂×GL₃ local/global analytic factors, all-place functional equations, pole/nonvanishing criteria and vertical-strip bounds. The new converse/GL₃ multiplicity-one extension is separately proposed and recorded as a gap.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/local-factors`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition`.

### `AutomorphicSpectralTheory:AS.6`

General invariant trace-formula engine; the limit-multiplicity globalization input is separately recorded as a gap, not claimed to follow from existence of the engine.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/supercuspidal-globalization`.

### `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`

The canonical continuous Hecke-character carrier, conductor, finite-order/ray-class dictionary and the Q Dirichlet-character parity dictionary.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-hecke-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`.

### `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`

Norm pullback of Hecke characters with the placewise local norm and composition in finite towers.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/isobaric-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`.

### `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`

Identity component of the idele class group, ray quotient and profinite quotient; use for extending finite-order characters of idele torsion.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-hecke-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`

Brauer–Hasse–Noether exact sequence and local invariants for number fields, including the archimedean terms; combined with local reciprocity in Tate’s vanishing proof.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`

Hilbert product formula: quaternionic local invariants have even total ramification cardinality; apply this result rather than constructing it again.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/indefinite-parity`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/invariant-exchange`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`

Global Artin reciprocity matching finite-order Galois characters with finite-order Hecke characters and local characters.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/isobaric-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-descent`.

### `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`

Continuous cohomology with discrete trivial Q/Z coefficients, filtered-colimit compatibility, inflation/restriction and connecting homomorphisms; Q/Z has trivial action, not the cyclotomic action.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`

The existing factor-set and Schur-multiplier interface and character ambiguity of linear lifts; the arithmetic continuous finite-image step is new here.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-projective-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-4-intertwining-numbers-and-the-mackey-irreducibility-criterion`

The Mackey irreducibility criterion for index-two induction, and its restriction formula, applied to finite Galois quotients; no new induction carrier.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/quadratic-restriction`.

### `ArithmeticGaloisRepresentations:G7`

The canonical adjoint representation and its scalar-quotient/traceless comparison in characteristic zero, restriction, determinant and coefficient-map operations; do not confuse the two carriers in characteristic dividing the rank.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`.

### `AlgebraicModularFormsAndSerreWeights:R15.2`

Extend the existing q-expansion/Hecke layer by Wiese Proposition 7 and Corollary 8: for coprime positive N,m and a ring R containing (Nm)-th roots of unity and 1/(Nm), a Katz form at Gamma_1(Nm) descends to Gamma_1(N) if and only if it is independent of the m-level structure; the descended form has the same q-expansion. For cuspidal eigenforms retain the character, all Hecke eigenvalues and residual representation. Equality of q-expansions is used to prove independence in the two-auxiliary-prime construction; it does not by itself assert arbitrary level descent. Also supply oldform/degeneracy-map Hecke equivariance and full-eigenform stabilization with the companion matrices and repeated-root cases in Wiese Proposition 4/Corollary 5.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz`.

## Gaps preventing closure

### 1. GL₃ converse, isobaric uniqueness and pole inputs

Add the proposed AL extension after AL.3: the n=3 converse with its exact twisting sets, dual entireness, strip bounds, functional equations, central character and convergence hypotheses, plus GL₃ isobaric strong multiplicity one and Rankin–Selberg constituent/pole recognition. Cogdell’s read survey states the converse; the generic proof and pole lemmas have not been decomposed here and belong to AL. R16.5 specializes that supplier.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`.

### 2. Original JPSS nonnormal cubic transfer proof

Obtain Jacquet–Piatetski-Shapiro–Shalika, Relèvement cubique non normal, C. R. Acad. Sci. Paris Sér. I Math. 292 (1981), 567–571, and the GL₃/GL₂×GL₃ proof it invokes. Carayol §12.2.1 records the consumer statement, but the original analytic construction and unrestricted all-place upgrade were not accessible in this run. Do not infer them from cyclic towers.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`.

### 3. Original Tunnell octahedral comparison proof

Obtain Tunnell, Artin’s conjecture for representations of octahedral type, Bull. AMS (N.S.) 5 (1981), 173–175. AMS endpoints refused access and the Project Euclid legacy endpoint did not yield a PDF. Carayol and Rogawski–Tunnell state the theorem, but the proof distinguishing the two quadratic descents and its exact all-place hypotheses must be read before this branch is closed.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`.

### 4. Clozel prescribed-supercuspidal globalization

CDN20 §5.2.1 footnote 21 identifies the limit-multiplicity input and the necessary central-character twist/coefficient extension. The precise prescribed-local-type existence theorem and proof must be supplied by an AutomorphicSpectralTheory extension; AS.6’s trace-formula engine alone is insufficient.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/supercuspidal-globalization`.

### 5. Tunnell primitive local-parameter globalization

Read the Tunnell 1978 globalization result cited in Carayol §12.2.2, including the finite-image primitive Weil parameter, number-field completion, cubic global extension and unramified-twist handling. Carayol’s consumer proof was read; the original input was not obtained. This is separate from CDN20’s supercuspidal limit-multiplicity input.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.6/extraordinary-cubic-compatibility`.

### 6. Reduction-preserving solvable residual lift for p>2

Read Serre, Modular forms of weight one and Galois representations (Durham 1977), Theorem 4 and the relevant finite-image lifting discussion, or a primary full proof with the same totally real, p>2, irreducible/solvable hypotheses. BCGP cites Tate plus Serre but does not prove the prescribed-reduction step. Generic factor-set trivialization by itself does not supply it.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/residual-lt-application`.

### 7. Missing compiled automorphic and arithmetic supplier interfaces

The pins contain the matrix group and algebraic factor-set lifting, but not the planned adelic automorphic isomorphism-class, continuous Galois-projective, Hecke-character, weight-one Hilbert or attached compatible-family interfaces. Suggested signatures use type parameters for supplier-owned carriers and leave the exact unavailable mathematical conditions out beside their comments, per protocol §13. No Prop-valued substitute carrier or theorem definition is introduced. Restore those conditions and all-place structures before implementation; compilation only checks the provisional signatures, not these missing claims.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/norm-exception`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/local-factors`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/strong-multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/coefficient-conjugation`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/indefinite-parity`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/invariant-exchange`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/supercuspidal-globalization`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/unramified-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/isobaric-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/tower-independence`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/prescribed-local-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/extraordinary-cubic-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-hecke-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-projective-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tr-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/residual-lt-application`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/rohrlich-tunnell`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/qualitative-residual-modularity`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/disjoint-irreducibility`.

## Restructuring and stage exports

RT-AREA-automorphic-1/1: cyclic/solvable Galois base change cannot supply a nonnormal cubic extension; rank-two converse theory cannot supply the GL₃ inputs to tetrahedral/octahedral Artin automorphy.

Add R17.4a between R17.4 and R17.5 for adjoint-lift, cubic-character-induction, gl3-recognition and nonnormal-cubic-base-change. Until the stage exists these nodes realise current R17.4, preserving this job’s exact scope. Add a single AL layer after AL.3 for the generic n=3 converse and GL₃ uniqueness/pole criteria; R16.5 imports/specializes it. R17.4a requires R17.4 and AL.3/new AL layer; R17.5 consumes R17.4a. The extraordinary local comparison belongs to R17.6, dependent on R17.5 after Artin automorphy, as a late export to R19; it is not a prerequisite of the Artin proof.

The extra extraordinary-comparison export is needed because Carayol’s arithmetic local argument consumes Artin automorphy. It is attached to R17.6, while the existence of cubic transfer and the GL₃ bridge remain prerequisites of R17.5. The current atlas stage edges, every cross-stage prerequisite of this packet and all proposed links form an acyclic graph.

- `GL2AutomorphicRepresentationsAndTransfer:R16.4` → `GL2AutomorphicRepresentationsAndTransfer:R17.3`: RT-AREA-automorphic-1/11: JL uniqueness and rational Hecke comparison.
- `GL2AutomorphicRepresentationsAndTransfer:R16.5` → `GL2AutomorphicRepresentationsAndTransfer:R17.5`: RT-AREA-automorphic-1/11: full GL₂ converse specialization used by the Artin proof.
- `GL2AutomorphicRepresentationsAndTransfer:R16.6` → `GL2AutomorphicRepresentationsAndTransfer:R17.5`: RT-AREA-automorphic-1/11: Q and totally real weight-one dictionary.
- `GL2AutomorphicRepresentationsAndTransfer:R17.3` → `HilbertModularVarietiesAndShimuraCurves:R18.3`: RT-AREA-automorphic-1/12: export transfer to quaternionic/Hilbert forms, then R18.4; no reverse geometric dependency.
- `GL2AutomorphicRepresentationsAndTransfer:R17.4` → `AutomorphicGaloisRepresentations:R19.2`: RT-AREA-langlands-2/4: cyclic and nonnormal cubic transfer for Carayol/Saito; R19.4–R19.5 consume through R19.2.
- `GL2AutomorphicRepresentationsAndTransfer:R17.6` → `AutomorphicGaloisRepresentations:R19.2`: Late extraordinary dyadic local comparison, using R17.5 Artin automorphy without putting it into the earlier R17.4a Artin prerequisite.

Consumer `HilbertModularVarietiesAndShimuraCurves:R18.3–R18.4`: Analytic transfer and spectra here; integral Hecke modules, level geometry and cohomology there.

Consumer `AutomorphicGaloisRepresentations:R19.2, R19.4–R19.5`: Local base-change parameter comparison here; attached Galois representations and Carayol/Saito theorem there.

Consumer `PotentialModularityAndCompatibleSystems:R23–R24; ClassicalSerreModularity:R33.5`: Exact conditional transfer and residual solvable cases here; geometric existence, weight lowering and general modularity lifting there.

## Source correction

GL2AutomorphicRepresentationsAndTransfer/E1: Published MSP PDF, p. 307, first paragraph of §2 following cases (i)–(iv). The printed text is “ν = 3 in case (iii)”. The ν=3 case is (iv), not (iii). Case (iii) has discriminant valuation two and odd character conductor, so ν=2; case (iv) has discriminant valuation three and odd character conductor, so ν=3. The subsequent proof explicitly uses case (iv) when ν=3.

Effect on this blueprint: nothing. MSP published article page and PDF on 2026-10-06; no linked corrigendum was found. Web search for Rohrlich–Tunnell elementary case Serre conjecture erratum/corrigendum on 2026-10-06; no correction located.

## Sources read

Access date: 6 October 2026. Locators refer to the specific editions below. Source hashes identify the downloaded files, which are not repository deliverables. Consumer statements do not stand in for the unobtained original proofs identified in the gaps.

### jl70

[Hervé Jacquet and Robert P. Langlands — Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf). Lecture Notes in Mathematics 114 (1970), author scan.

Read: §12, Theorem 12.2; §14, Theorems 14.2 and 14.4; §15, Theorem 15.1; §16, Theorem 16.1 and the paragraph following it.

SHA-256: `bfd16d259d2816210cff67aa835b8f1fe886d3716ad909ca221d8b2686c379f3`.

### br10

[Alexandru I. Badulescu and David Renard — Global Jacquet–Langlands correspondence, multiplicity one and classification of automorphic representations](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf). Author preprint, Theorems 1.4 and 18.1 (2010 version).

Read: §1.5 pp. 5–7; §18.1 pp. 44–45, including the trace-comparison proof reduction.

SHA-256: `dc3aad1d249fda35f40f33f7b688537f226e509ed6879fe36dd5d07a15839c88`.

### langlands80

[Robert P. Langlands — Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf). Annals of Mathematics Studies 96 (1980), Digital Math Archive text.

Read: §2 properties (A)–(F); §3 tetrahedral and octahedral Artin arguments; §11, Propositions 11.4–11.5, Lemmas 11.6–11.8 and verification of (A)–(G), text pp. 144–152.

SHA-256: `6af3f53d0eb0e841548f43151f9cb79fd2e12ceac4ca909aefeb08d5462758ab`.

### ac89

[James Arthur and Laurent Clozel — Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf). Annals of Mathematics Studies 120 (1989), Clay scan.

Read: Chapter 3 §1 Theorem 3.1; §4 Theorem 4.2; §5 Theorem 5.1; §6 Definition 6.1 and Theorem 6.2, printed pp. 201–216.

SHA-256: `3033d863634f5a1e8c26e48ba5b5ec9d8f95fb411b2a6d21c1580db80bc01737`.

### gj78

[Stephen Gelbart and Hervé Jacquet — A relation between automorphic representations of GL(2) and GL(3)](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf). Ann. Sci. ÉNS (4) 11 (1978), 471–542, published Numdam scan.

Read: Introduction pp. 471–474; §9.2–9.4 Theorem 9.3 pp. 531–535; Remark 9.9 p. 541 (self-twist case).

SHA-256: `319347503f91fe22bec22ce7519b9ebaf09921ec4de8756c51d155864b4fc16a`.

### converse

[James W. Cogdell — Piatetski-Shapiro’s work on converse theorems](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf). Author survey (2013), by a coauthor of the converse theorems.

Read: §2 hypotheses and twisting sets pp. 5–6; §3 Theorems 3.1–3.3 pp. 6–9.

SHA-256: `0c922b6e6c26bc6d98ad7cf1162955d34e61491a1e73dc1f803b987cab2f2ffe`.

### patrikis

[Stefan Patrikis — Variations on a theorem of Tate](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf). Author revision, 31 July 2016, submitted memoir version.

Read: §2.1 Theorem 2.1.1 and proof pp. 17–18; Proposition 2.1.4 and Remark 2.1.5 pp. 19–20; §2.3 Lemma 2.3.6 pp. 30–31.

SHA-256: `e5e9527daf697d92043ddee823e7f1f2c6882ba84c4f67fffbb77e520e3a0a81`.

### carayol86

[Henri Carayol — Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf). Ann. Sci. ÉNS (4) 19 (1986), 409–468, published Numdam scan.

Read: §12.1.2–12.1.3 pp. 456–457; §12.2.1–12.2.2 pp. 457–458, statements and proof; §12.3.1–12.3.2 pp. 458–459.

SHA-256: `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8`.

### rt97

[David E. Rohrlich and Jerrold B. Tunnell — An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf). Pacific J. Math. 181, special issue (1997), 299–309, published PDF.

Read: Entire paper: §1 technical lemma, hypotheses and proof pp. 300–305; §2 four dyadic cases, main theorem and proof pp. 306–308.

SHA-256: `fe131f6cff026c25c65727d6675d1bea9233f91bd1d0d7947587b491cf22d3b9`.

### wiese04

[Gabor Wiese — Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf). Documenta Mathematica 9 (2004), 123–133, published PDF.

Read: Introduction and Theorem 1; §2 Lemmas 2–3 and proofs; Proposition 4 and Corollary 5; §3 Definition 6, Proposition 7, Theorems 9–10, Lemma 11 and examples.

SHA-256: `1dcd4bb30b64a19cb1335a7442b6704ff9c0a3dd0ad96d97d6b37a04d0aa3b06`.

### bcgp21

[George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni — Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf). Publications Mathématiques de l’IHÉS 134 (2021), published PDF.

Read: Proposition 10.1.3 and proof pp. 473–475; Theorem 10.2.6 and proof pp. 480–481.

SHA-256: `b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af`.

### cdn20

[Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł — Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf). Author final GPW5; published JAMS 33 (2020), 311–362; locators below use author pagination.

Read: §5.2.1 pp. 43–44, quaternionic globalisation, footnote 21; Proposition 5.2 proof p. 45, strong multiplicity one use.

SHA-256: `2cdb1de25b5201ed46f8af6c06c19b72fdc5cbe1dd2037b4e1d24dee30155776`.

### cdn23

[Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł — Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf). Forum of Mathematics, Pi 11 (2023), e16, published PDF with download stamp.

Read: §4.1.1–4.1.2 pp. 37–39, hypotheses on E, invariant exchange and auxiliary place; §4.1.3 only the away-place Hecke convention.

SHA-256: `b007a4e37b824ca5986ac6152ed9fabcf38dde97e16d8f5f7f60756fe77d3418`.

### pan26

[Lue Pan — On locally analytic vectors of the completed cohomology of modular curves](https://arxiv.org/pdf/2209.06366v1). arXiv:2209.06366v1; published Annals 203 (2026), 121–281; only v1 used for locators.

Read: Definition 5.4.11 and its paragraph on norm-factor forms; §5.5.5 pp. 75–76, quaternionic/classical Hecke spectra and k=0 exception.

SHA-256: `0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4`.

### rt83

[Jonathan D. Rogawski and Jerrold B. Tunnell — On Artin L-functions associated to Hilbert modular forms of weight one](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0005.pdf). Invent. Math. 74 (1983), 1–42; Göttingen scan of the entire volume; visual reading.

Read: Introduction pp. 1–3; §1 p. 4, definition of the archimedean weight-one representation; no claim to have read its Galois construction proof.

SHA-256: `5bd3509ed947c8678f6acfc092379c6e580e2901da94cee36224c0bb56b9516d`.
