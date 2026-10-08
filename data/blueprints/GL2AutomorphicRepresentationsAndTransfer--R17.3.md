# Modular forms — Hecke theory, newforms, and L-functions, Part II: GL₂ automorphic representations and transfer

Part R17.3: layers R17.3–R17.6. Agent: Codex. Issue: [#734](https://github.com/CBirkbeck/tauceti-explorer/issues/734).

This is a complete target-level planning pass, with all four layers **planned** and none **closed**. The packet has 57 declarations, 33 API items, 29 unit tests and 20 planets. 8 explicit gaps and 35 precise supplier requests prevent closure. Every proposed implementation remains unchecked.

The binding base is the accepted RS-21 result in [data/restructure/RS-21.result.json](../../../data/restructure/RS-21.result.json), accepted on 29 September 2026 after independent REV-RS-21 review. This roadmap extends `tauceti:TauCetiRoadmap/ModularForms`. The pending review of a subsequent restructuring correction does not supersede that accepted ownership.

The machine-readable plan is the [packet](../packets/GL2AutomorphicRepresentationsAndTransfer--R17.3.json); the [suggested Lean file](../suggested/GL2AutomorphicRepresentationsAndTransfer--R17.3.lean) records true typed fragments, API lemmas, named test examples and explicit §13 omissions for the unavailable signatures. This document gives the definitive mathematical statements.

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

The suggested file uses individual Mathlib imports at the pin. Its matrix and coefficient fragments remain explicit typed statements. Section 13 records the transfer, automorphic, arithmetic and compatible-system signatures that cannot yet be stated on their supplier carriers; each omission retains its node, statement, hypotheses, API and tests. Every remaining declaration is intended to be true as written. Elaboration with placeholder proofs checks those fragments and does not establish the omitted transfer theorems.

## R17.3 — Global Jacquet–Langlands

The objects in this layer are the supplied automorphic isomorphism classes for a quaternion algebra and GL₂, with central character and local components. Global transfer is an equivalence on the non-norm spectrum, including its inverse. Its split-place Hecke comparison preserves both generators of the degree-two Euler polynomial. The norm-character exception, quaternionic strong multiplicity one, rational structures and both definite and indefinite infinity types are separate declarations because they have different hypotheses and different consumers.

CDN20 needs a prescribed supercuspidal globalization; its footnote allows a central-character twist and coefficient extension. CDN23 needs the exchange of a finite and a real quaternion invariant and its specified auxiliary tame subgroup. Pan needs the dual highest-weight convention and removal of norm factors in weight zero. These applications import quaternion invariant parity from ClassFieldTheory and send analytic spectra to R18; they do not construct Shimura-curve cohomology.

Planets: Global Jacquet–Langlands correspondence, Quaternionic strong multiplicity one, Definite quaternionic transfer, Supercuspidal globalization.

### Global Jacquet–Langlands correspondence

**Declaration:** `TauCeti.GL2Transfer.globalJL`; construction; node `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`.

Let F be a number field, D/F a quaternion algebra with ramification set S (finite and real places; complex places are split), fixed isomorphisms D⊗F_v ≅ M₂(F_v) for v ∉ S, and ω a unitary character of F^×\A_F^×. Let DS_D(ω) be the set of isomorphism classes of irreducible subrepresentations of the right regular representation of D×(A_F) on L²(D×(F)A_F^×\D×(A_F), ω). For nonsplit D the quotient is compact and DS_D(ω) consists of all irreducible automorphic representations with central character ω. For D = M₂(F) it consists of the cuspidal representations and the characters χ∘det with χ² = ω. There is a bijection JL_D from the members of DS_D(ω) that are not one-dimensional (not of the form χ∘Nrd) onto the cuspidal automorphic representations π of GL₂(A_F) with central character ω such that π_v is square-integrable modulo the centre at every v ∈ S. At a finite v ∈ S this means a Steinberg twist or a supercuspidal representation; at a real v ∈ S, a discrete series D_k⊗χ (k ≥ 2), whose partner is the algebraic D_v× type of dimension k−1. At v ∉ S the components agree via the fixed isomorphisms; at v ∈ S they match by the R17.1 correspondence JL_v. For D = M₂(F) it is the identity on cuspidal classes. The inverse is part of the assertion. For a non-unitary central quasi-character, twist by a real power of |Nrd| (resp. |det|); the correspondence commutes with such twists. For split D the restriction to the discrete spectrum is essential: Eisenstein constituents are automorphic, do not factor through det, and are not in the domain.

**Hypotheses.**

- F is a number field.
- D is a quaternion algebra over F with ramification set S (finite and real places, |S| even; complex places split); S = ∅ (D = M₂(F)) is allowed.
- Isomorphisms D ⊗_F F_v ≅ M₂(F_v) are fixed for every v ∉ S.
- ω is a unitary character of F^×\A_F^×, identified with the central characters on D×(A_F) and GL₂(A_F); a non-unitary quasi-character is reduced to this case by twisting with |Nrd|^s and |det|^s.
- Domain: the irreducible subrepresentations of L²(D×(F)A_F^×\D×(A_F), ω) that are not one-dimensional (not of the form χ∘Nrd).
- Codomain: cuspidal automorphic representations π of GL₂(A_F) with central character ω and π_v square-integrable modulo the centre at every v ∈ S.
- At v ∈ S the local matching is the R17.1 correspondence JL_v; at v ∉ S it is the fixed isomorphism.

**Construction or proof.**

1. D → GL₂: the R17.2 comparison of the discrete parts of the trace formulas of D× and GL₂ gives, for π′ ∈ DS_D(ω), a D-compatible discrete series π = G(π′) of GL₂(A_F). It satisfies π_v ≅ π′_v at v ∉ S and |LJ_v|(π_v) = π′_v at v ∈ S (Badulescu–Renard Theorem 18.1(a), n = 1, d = 2). JL70 Theorem 14.4 obtains this direction through the converse theorem instead; that route is not used here.
2. Cuspidality: if π = χ∘det, then π′_v = χ_v∘det at v ∉ S and π′_v = |LJ_v|(χ_v∘det) = χ_v∘Nrd at v ∈ S, so π′ = χ∘Nrd by injectivity of G. Hence for non-one-dimensional π′, π is not one-dimensional and therefore cuspidal, by the R16.4 description of the discrete spectrum of GL₂ (cuspidal or one-dimensional).
3. Local matching at v ∈ S: π_v is a generic unitary component of a cuspidal representation. Its character does not vanish on the elliptic regular set, so it is square-integrable (R16.2 classification: principal and complementary series characters vanish there). On square-integrable representations |LJ_v| is the R17.1 correspondence JL_v (character relation with sign −1).
4. GL₂ → D: a cuspidal π with π_v square-integrable for all v ∈ S is D-compatible. By Theorem 18.1(a) it equals G(π′) for a unique π′, and π′ is not one-dimensional because G(χ∘Nrd) = χ∘det is not cuspidal. Uniqueness also follows from R16.4 strong multiplicity one and injectivity of JL_v. JL70 Theorem 16.1 states this direction but only sketches its proof.
5. For D = M₂(F), S = ∅ and G is the identity on discrete series; restricting to non-one-dimensional members gives the identity on cuspidal classes.

**Consumers determining the API.**

- CDN20 §5.2.1 and Proposition 5.2: Move a prescribed supercuspidal type between the two quaternionic globalizations.
- CDN23 §4.1.2; Pan §5.5.5; HilbertModularVarietiesAndShimuraCurves R18.3–R18.4: Identify cuspidal Hecke spectra through the common GL₂ representation, preserving local types.

**API.**

- `TauCeti.GL2Transfer.globalJL_local` (compatibility): For every place v, local(GL₂,JL_D π′,v) equals the R17.1 local transfer of local(D,π′,v), using the split-place identification at split v.
- `TauCeti.GL2Transfer.globalJL_central` (projection): The central character of JL_D π′ is the central character of π′.
- `TauCeti.GL2Transfer.globalJL_inverse` (equivalence): The inverse of JL_D recovers every non-one-dimensional discrete series π′ of D×(A_F). JL_D of the inverse recovers every cuspidal π with π_v square-integrable at all v ∈ S.
- `TauCeti.GL2Transfer.globalJL_twist` (functoriality): For a unitary Hecke character χ of F, JL_D(π′⊗χ∘Nrd) = JL_D(π′)⊗χ∘det; the central character becomes ωχ². For a non-unitary χ this holds after the twist reduction to unitary central character.
- `TauCeti.GL2Transfer.globalJL_split` (simp): For D=M₂(F), using the identity identifications, JL_D is the identity equivalence on cuspidal classes.

**Unit tests.**

- `TauCeti.GL2Transfer.jl_split_test` (degenerate): For D=M₂(Q), JL_D fixes every cuspidal isomorphism class.
- `TauCeti.GL2Transfer.jl_steinberg_test` (compatibility): For D/Q ramified at {p,∞} and an allowed weight-two cuspidal π with π_p=St⊗χ_p, local(JL_D inverse π,p)=χ_p∘Nrd under R17.1; local characters are not discarded.
- `TauCeti.GL2Transfer.jl_inverse_test` (characterisation): For every D-compatible cuspidal π, JL_D(JL_D inverse π)=π, and the split-place components of its inverse equal π_v.
- `TauCeti.GL2Transfer.jl_eisenstein_excluded_test` (non-example): For D = M₂(Q) and unitary Hecke characters μ, ν of Q, the irreducible automorphic representation π(μ,ν) induced from μ⊗ν is not one-dimensional and does not factor through det. It is not in the domain of JL_D, because it does not occur in L²_disc(GL₂(Q)A^×\GL₂(A), μν).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.1`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.1`, `GL2AutomorphicRepresentationsAndTransfer:R17.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-representation`, `AutomorphicFormsOnReductiveGroups:AF.2/flath-factorization`, `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-automorphic-representation`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For D/Q ramified at {p,∞}, a cuspidal π with π_p a Steinberg twist and π_∞ weight-two discrete series transfers to a quaternionic representation with one-dimensional local types at p and ∞.
- A cuspidal π whose component at a finite place of S is an unramified principal series is not in the image of JL_D.
- A local one-dimensional D_v× character is allowed; a global reduced-norm character is excluded.
- For D = M₂(Q) and unitary Hecke characters μ, ν, the irreducible Eisenstein representation π(μ,ν) is automorphic and not one-dimensional, but it is not in the domain because it does not occur in the discrete spectrum.

**Sources.**

- [Alexandru Ioan Badulescu, with an appendix by David Renard, Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf), §1.5, definition of discrete series, p. 5 (preprint page = PDF page). Definition used for the domain: irreducible subrepresentations of L²(G′(F)Z(A)\G′(A); ω) with ω unitary. With n = 1, d = 2 (G′ = D×) this is the whole automorphic spectrum when D is division (compact quotient); for D = M₂(F) (BR10's d = 1) it is cuspidal plus one-dimensional, hence the cuspidal restriction.
- [Alexandru Ioan Badulescu, with an appendix by David Renard, Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf), §18.1, Theorem 18.1(a), p. 44 (same statement as Theorem 1.4(a), p. 6). Specialisation n = 1, d = 2 over a number field (BR10 assumes a global field of characteristic zero). BR10's map covers all discrete series, including χ∘Nrd ↦ χ∘det; the node removes that one-dimensional branch and uses that on square-integrable representations |LJ_v| is the classical JL_v. Both directions, injectivity and the image come from here.
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §14, Theorem 14.4, printed p. 247 of the IAS retypeset edition (PDF p. 253); printed pages of that edition, not the Springer LNM 114 pagination. Classical D→GL₂ direction for M′ division (§14 assumes the quotient compact), proved through Corollary 14.3 and the converse theorem. JL70 assumes π′_v infinite-dimensional at every split place rather than 'not χ∘ν'. JL70's §16 introduction restates it as 'not of the form χ∘ν'.
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §16, Theorem 16.1, printed p. 261 of the IAS retypeset edition (PDF p. 267); printed pages of that edition, not the Springer LNM 114 pagination. The inverse direction, with the source's local condition: π_v special (Steinberg twist; at real places JL70's 'special' σ(µ₁,µ₂) is the discrete series) or absolutely cuspidal at each v in the non-split set S. The text layer drops the tensor sign in 'π′ = ⊗π′_v'.
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §16, paragraph after Theorem 16.1, printed p. 261 of the IAS retypeset edition (PDF p. 267); printed pages of that edition, not the Springer LNM 114 pagination. Proof status: JL70 only sketches Theorem 16.1. The unconditional inverse used here is BR10 Theorem 18.1(a), which rests on the Arthur–Clozel trace comparison (the R17.2 input).

**Atlas planet:** Global Jacquet–Langlands correspondence.

**Implementation status:** `unchecked`.

### The reduced-norm character exception

**Declaration:** `TauCeti.GL2Transfer.norm_exception`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.3/norm-exception`.

Let D/F be a nonsplit quaternion algebra with ramification set S and χ a Hecke character of F^×\A_F^×. The one-dimensional automorphic representation χ∘Nrd of D×(A_F) is not in the domain of the cuspidal JL bijection. Its classical local transfers are: St_v⊗χ_v at finite v ∈ S, the weight-two discrete series twisted by χ_v at real v ∈ S, and the one-dimensional χ_v∘det at v ∉ S. Their restricted tensor product therefore has one-dimensional components at almost all places and is not cuspidal. JL70 notes that it acts on no subspace of the automorphic forms on GL₂(A_F), and leaves open whether it is a constituent. In Badulescu–Renard's extended discrete-spectrum correspondence (χ unitary), χ∘Nrd corresponds instead to the residual one-dimensional discrete series χ∘det of GL₂(A_F). There the local map |LJ_v| sends χ_v∘det to χ_v∘Nrd. So |LJ_v| agrees with classical JL_v on square-integrable representations but is not injective on all compatible unitary ones, since both χ_v∘det and St_v⊗χ_v go to χ_v∘Nrd. The two branches must not be identified.

**Hypotheses.**

- D/F is a nonsplit quaternion algebra over a number field F, with ramification set S ≠ ∅.
- χ is a Hecke character of F^×\A_F^×; for the Badulescu–Renard comparison χ is unitary.
- Local transfers at v ∈ S are the R17.1 correspondence; at v ∉ S the fixed isomorphisms are used.

**Construction or proof.**

1. Compute the components of χ∘Nrd: χ_v∘det at v ∉ S, and JL_v(χ_v∘Nrd) = St_v⊗χ_v (finite v) or the twisted weight-two discrete series (real v) at v ∈ S, by the explicit R17.1 character/Steinberg calculation.
2. Local components of a cuspidal representation of GL₂(A_F) are generic, hence infinite-dimensional (R16.4 Whittaker model, R16.2 classification). Since almost all components above are one-dimensional, the product is not cuspidal.
3. For the extended branch, read off from Badulescu–Renard Proposition 15.3(a) and Theorem 18.1(a) that G(χ∘Nrd) = χ∘det. This branch is kept separate from global-jl.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `GL2AutomorphicRepresentationsAndTransfer:R17.1`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- A global norm character is excluded even though every division-place character has a valid local transfer.
- For D/Q ramified at {p,∞} and χ trivial, the classical local transfers are St_p and the weight-two discrete series at ∞, with trivial components elsewhere: not cuspidal. The extended transfer of the trivial character is the trivial representation of GL₂(A_Q).

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §14, paragraph after Theorem 14.4, printed p. 247 of the IAS retypeset edition (PDF p. 253); printed pages of that edition, not the Springer LNM 114 pagination. Exact for the classical branch: for π′ = χ∘ν, ⊗_v π(π′_v) has one-dimensional components at split places and infinite-dimensional ones at nonsplit places, so it is not cuspidal. JL70 leaves open whether it is a constituent of A ('we prefer to leave the question unsettled'); the node does not claim either way.
- [Alexandru Ioan Badulescu, with an appendix by David Renard, Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf), §15, Proposition 15.3(a), p. 39, with Theorem 18.1(a), p. 44. Take d = 2, δ = χ_v (deg = l = 1), k = 2: u(χ_v,2) = χ_v∘det is compatible, so the residual χ∘det is D-compatible and, by Thm 18.1(a), equals G(χ∘Nrd). In the extended transfer, |LJ_v| sends χ_v∘det (not St⊗χ_v) to χ_v∘Nrd. The text layer drops the denominator l(δ) of the second condition.

**Implementation status:** `unchecked`.

### Split-place Hecke compatibility

**Declaration:** `TauCeti.GL2Transfer.split_hecke`; comparison; node `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`.

Let π′ and π = JL_D π′ be as in global-jl. At every finite v ∉ S the fixed algebra identification identifies their local representations, hence their K_v-invariant modules for every compact open K_v and the action of the local Hecke algebra on them. In particular, at a spherical v the eigenvalues t_v of T_v = [K_v diag(ϖ_v,1)K_v] and s_v of S_v = [K_v diag(ϖ_v,ϖ_v)K_v] agree. Consequently the arithmetic degree-two Euler polynomial 1 − a_v X + b_v X², with a_v = t_v and b_v = q_v s_v, agrees; its reciprocal is the polynomial X² − T_vX + N(v)S_v of CDN23. This does not assert an integral global Hecke-module isomorphism, equality of multiplicities at unrelated levels, or spherical vectors at division places.

**Hypotheses.**

- π′ is in the domain of global-jl and π = JL_D π′.
- v is a finite place of F not in the ramification set S, with D⊗F_v ≅ M₂(F_v) fixed, and K_v ⊂ D_v× corresponds to GL₂(O_{F_v}) (or any compact open subgroup transported by the same isomorphism).
- Hecke operators are the unnormalized double cosets T_v = [K_v diag(ϖ_v,1)K_v] and S_v = [K_v diag(ϖ_v,ϖ_v)K_v] (R16.2 arithmetic normalization); q_v is the residue cardinality.

**Construction or proof.**

1. Use globalJL_local with the split identification, then functoriality of the supplied local invariant-vector/Hecke action.
2. Read off both arithmetic generators, using the R16.2 normalization rather than an unrecorded unitary scaling.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Keep the determinant coefficient b_v, not only the trace a_v.
- A ramified-place U_v comparison requires a separate local-type calculation.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §4.1.3, p. 39 (journal page = PDF page). Consumer statement only. CDN23 uses both arithmetic generators, T_v = [U_v diag(ϖ_v,1)U_v] and S_v = [U_v diag(ϖ_v,ϖ_v)U_v] (footnote 27), with S_v ↦ N(v)^{-1}det. The node's b_v = q_v s_v is this normalization. The equality of eigenvalues across the transfer is not stated in CDN23.
- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §4.1.4, p. 41. Consumer use: the degree-two polynomial X² − T_vX + N(v)S_v, the reciprocal of the node's 1 − a_vX + b_vX², with the same T^univ_S acting on the Shimura-curve side through the identification (4.6).
- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §4.1.2, p. 39. The fixed away-place identification through which the same level and Hecke operators act on both quaternionic groups; in the node this is the fixed split-place isomorphism.

**Implementation status:** `unchecked`.

### Local factors of quaternionic transfer

**Declaration:** `TauCeti.GL2Transfer.local_factors`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.3/local-factors`.

For π′ in the domain of global-jl, π = JL_D π′, a fixed nontrivial additive character ψ = ⊗ψ_v of F\A_F, every place v and every quasi-character ω_v of F_v^×: L(s, ω_v⊗π_v) = L(s, ω_v⊗π′_v), L(s, ω_v^{-1}⊗π̃_v) = L(s, ω_v^{-1}⊗π̃′_v) and ε(s, ω_v⊗π_v, ψ_v) = ε(s, ω_v⊗π′_v, ψ_v). Here, at v ∈ S, the factors of π′_v are JL70's and the GL₂ factors are in the R16.3 normalization; at v ∉ S the equalities are the fixed identification. In this normalization the local functional equation of the zeta integrals on D_v carries the extra sign h_v = −1 for v ∈ S. If instead the constant of that functional equation is taken as the ε-factor of π′_v, then ε(s, ω_v⊗π′_v, ψ_v) = −ε(s, ω_v⊗π_v, ψ_v) at each v ∈ S, and the global product of these signs is (−1)^{|S|} = 1. Hence for every Hecke character ω the completed L-functions agree, L(s, ω⊗π′) = L(s, ω⊗π), as do the global ε-factors and the functional equations, with compatible measures and the same ψ.

**Hypotheses.**

- π′ is in the domain of global-jl and π = JL_D π′; S is the ramification set of D.
- ψ = ⊗ψ_v is a fixed nontrivial additive character of F\A_F, and the same ψ_v is used on D_v× and on GL₂(F_v).
- ω_v ranges over all quasi-characters of F_v^×, and ω over all Hecke characters of F.
- At v ∈ S the factors of π′_v are JL70's; at v ∉ S they are those of the GL₂-representation via the fixed isomorphism; the GL₂ factors are in the R16.3 normalization.

**Construction or proof.**

1. At v ∈ S apply the R17.1 local-factor compatibility of JL_v for all character twists (JL70 characterises π_v by these equalities); at v ∉ S use the fixed identification.
2. Take products over all places. The GL₂ standard L-functions of twists, their continuation and functional equations come from the R16.5 integral models; the signs h_v cancel because |S| is even (ClassFieldTheory parity, as in JL70 §14).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `GL2AutomorphicRepresentationsAndTransfer:R17.1`, `GL2AutomorphicRepresentationsAndTransfer:R16.5`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- A character on D_v× matches the L-factor of a Steinberg twist, not the two-factor spherical polynomial of χ_v∘det.
- With the Godement–Jacquet constant on D_v, ε(s, χ_v∘Nrd, ψ_v) = −ε(s, St_v⊗χ_v, ψ_v) at v ∈ S; the signs cancel in the global ε-factor because |S| is even.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §14, before Theorem 14.4, printed p. 247 of the IAS retypeset edition (PDF p. 253); printed pages of that edition, not the Springer LNM 114 pagination. Exact for the local statement: JL70 defines π_v = π(π′_v) by equality of the L-factors of all twists, of the contragredients' L-factors and of the ε-factors (next lines). The ε on D_v is JL70's constant, whose local functional equation carries the extra sign h_v.
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §14, before Theorem 14.4, printed p. 247 of the IAS retypeset edition (PDF p. 253); printed pages of that edition, not the Springer LNM 114 pagination. The ε-equality and the quantifier over all local quasi-characters ω_v: this supports 'including after every local character twist'.
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §14, proof of Theorem 14.2, printed p. 241 (PDF p. 247). Normalization: the zeta-integral functional equation on D_v involves h_v ε(s, π′_v, ψ_v), with h_v = −1 at nonsplit v. On printed p. 247 the product of the h_v is shown to be 1. ('of' is a misprint for 'if' in this edition.)

**Implementation status:** `unchecked`.

### Quaternionic strong multiplicity one

**Declaration:** `TauCeti.GL2Transfer.strong_multiplicity_one`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.3/strong-multiplicity-one`.

Let π′ and σ′ be discrete series of D×(A_F): irreducible subrepresentations of L²(D×(F)A_F^×\D×(A_F), ω) for a unitary ω. For nonsplit D these are, up to a twist by |Nrd|^s, all irreducible automorphic representations. Assume they are not one-dimensional. If π′_v ≅ σ′_v for all finite v outside a finite set, then π′ ≅ σ′. In particular their components away from a finite set of places determine the components in that set, for example at a distinguished ramified place. This is a theorem about global representations, not a statement that one local Hecke scalar determines a local type.

**Hypotheses.**

- F is a number field and D/F a quaternion algebra.
- π′ and σ′ are discrete series of D×(A_F) (irreducible subrepresentations of L²(D×(F)A_F^×\D×(A_F), ω) for unitary ω), not one-dimensional; for nonsplit D this covers every irreducible automorphic representation up to a twist by |Nrd|^s.
- π′_v ≅ σ′_v for all finite places v outside a finite set.

**Construction or proof.**

1. Agreement of the central characters at almost all places forces the same ω. Transfer both to cuspidal GL₂ by global-jl; the transfers agree at almost all split places, so they are isomorphic by R16.4 strong multiplicity one.
2. Use injectivity of global JL (equivalently of each JL_v) to return to D× (Badulescu–Renard Theorem 18.1(b) states the result directly).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- CDN20 Proposition 5.2: the representation away from 𝔭 determines the component at 𝔭.
- For D = M₂(Q), the constituents of the representation induced from χ|·|^{1/2}⊗χ|·|^{-1/2} with Steinberg components exactly at {p}, resp. exactly at {q}, agree at almost all places but are not isomorphic. They are not discrete series, so the discrete-series hypothesis cannot be dropped.

**Sources.**

- [Alexandru Ioan Badulescu, with an appendix by David Renard, Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf), §1.5, Theorem 1.4(c), p. 6 (preprint page = PDF page). Specialisation n = 1, d = 2 (D division quaternion, F a number field) of SMO for discrete series of G′(A) = GL_n(D)(A). The node adds 'not one-dimensional' only to align with global-jl (BR10 needs no such restriction).
- [Alexandru Ioan Badulescu, with an appendix by David Renard, Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf), §18.1, Theorem 18.1(b), second sentence, p. 44. Same statement in §18 (without the condition on archimedean places that Badulescu 2008 needed); the first sentence of 18.1(b) is multiplicity one, the second is strong multiplicity one.
- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §5.2.1, proof of Proposition 5.2, author p. 45 (author pagination = PDF page). Consumer use: the away-𝔭 finite part determines the 𝔭-component (CDN20 writes p for 𝔭).

**Atlas planet:** Quaternionic strong multiplicity one.

**Implementation status:** `unchecked`.

### Multiplicity one in the non-norm spectrum

**Declaration:** `TauCeti.GL2Transfer.multiplicity_one`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.3/multiplicity-one`.

For a fixed unitary central character ω, every non-one-dimensional discrete series π′ of D×(A_F) occurs with multiplicity exactly one in L²_disc(D×(F)A_F^×\D×(A_F), ω). Together with local invariant-vector dimensions this computes its contribution at any fixed finite level; it does not say that the full level space is one-dimensional.

**Hypotheses.**

- F is a number field and D/F a quaternion algebra.
- ω is a fixed unitary character of F^×\A_F^× and the spectrum is L²_disc(D×(F)A_F^×\D×(A_F), ω).
- π′ is a discrete series of D×(A_F) with central character ω, not one-dimensional.

**Construction or proof.**

1. The R17.2 comparison of discrete spectra gives m_D(π′) = m_{GL₂}(JL_D π′) for π′ in the domain of global-jl (Badulescu–Renard Theorem 18.1(b) for n = 1, d = 2).
2. R16.4 GL₂ multiplicity one gives m_{GL₂}(JL_D π′) = 1; work with the fixed central character ω rather than counting twists together.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- An old level can have an invariant-vector space of dimension greater than one while global spectral multiplicity remains one.
- For D = M₂(F) the statement is GL₂ cuspidal multiplicity one.

**Sources.**

- [Alexandru Ioan Badulescu, with an appendix by David Renard, Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf), §1.5, Theorem 1.4(b), p. 6 (preprint page = PDF page). Specialisation n = 1, d = 2 of multiplicity one for all discrete series of G′(A); the node restates it for the non-one-dimensional ones (the one-dimensional case is elementary).
- [Alexandru Ioan Badulescu, with an appendix by David Renard, Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf), §18.1, Theorem 18.1(b), first sentence, p. 44. Same statement in §18; BR10 notes that multiplicity one for GL_n itself is due to Shalika and Piatetski-Shapiro.

**Implementation status:** `unchecked`.

### Coefficient conjugation of global transfer

**Declaration:** `TauCeti.GL2Transfer.coefficient_conjugation`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.3/coefficient-conjugation`.

Let F be totally real, D/F a quaternion algebra with ramification set S, and π = JL_D π′ cohomological: π_v is a discrete series of weight k_v ≥ 2 at every real place, all k_v of the same parity. Suppose, by the R16.4 rationality interface, that for σ ∈ Aut(C) the conjugate σπ_f is the finite part of a cuspidal cohomological π^σ, whose weights are those of π permuted by σ acting on the real embeddings. Then π^σ is again D-compatible: square-integrability at finite places of S is preserved by σ, and all real components are discrete series. Its inverse transfer π′^σ := JL_D^{-1}(π^σ) has finite part σπ′_f, the σ-conjugated algebraic infinity type, and central character with finite part σ∘ω_f. Hence Q(π′_f) = Q(π_f), and both equal the field generated by the arithmetic away-S Hecke eigenvalues (a_v, b_v). This holds only in the cohomological setting supplied by R16.4; it is not a claim of rationality for Maass forms or weight-one Artin forms.

**Hypotheses.**

- F is a totally real number field, D/F a quaternion algebra with ramification set S.
- π = JL_D π′ is cohomological: at every real place v, π_v is a discrete series of weight k_v ≥ 2, all k_v of the same parity; at real v ∈ S, π′_v is the matching algebraic D_v× type.
- The R16.4 rationality interface: for σ ∈ Aut(C), σπ_f is the finite part of a cuspidal cohomological π^σ with weights permuted by σ.
- Hecke eigenvalues are in the arithmetic normalization of split-hecke (a_v = t_v, b_v = q_v s_v), v ∉ S finite.

**Construction or proof.**

1. σ maps Steinberg twists and supercuspidals of GL₂(F_v) to representations of the same kind, so π^σ is D-compatible and π′^σ = JL_D^{-1}(π^σ) exists by global-jl.
2. At finite v ∈ S, JL_v(σπ′_v) = σJL_v(π′_v), since the defining character relation Θ_{π_v} = −Θ_{π′_v} is preserved by σ (Aut(C)-equivariance of the R17.1 correspondence). At split finite v, π′^σ_v = π^σ_v = σπ_v = σπ′_v. Hence π′^σ_f ≅ σπ′_f.
3. By split-hecke, the split Hecke eigenvalues of π′ and π coincide and conjugate coefficientwise. By strong multiplicity one (R16.4 and strong-multiplicity-one), σπ_f ≅ π_f iff σ fixes these eigenvalues; the same holds on the D side. This gives the equality of fields.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/strong-multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.1`, `AutomorphicFormsOnReductiveGroups:AF.4/rationality-field`, `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Changing the arithmetic normalization changes the determinant scalar; state the normalization before comparing coefficient fields.
- For D/Q ramified at {p,∞} and π attached to a weight-two newform f of trivial character with π_p Steinberg, the field generated by the quaternionic away-pN Hecke eigenvalues is the Hecke field Q(a_ℓ(f) : ℓ ∤ pN) of f.

**Sources.**

- [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1), §5.5.5, p. 75 (arXiv v1 page = PDF page). Consumer statement only. Pan uses global JL to identify the Hecke eigensystems λ: T_S → C on quaternionic forms with those of classical cusp forms. This implies the eigenvalue fields agree but says nothing about σ ∈ Aut(C) or models. The Aut(C) assertion is a standard consequence of R16.4 rationality, Aut(C)-equivariance of JL_v and strong multiplicity one, and is not in this source.

**Implementation status:** `unchecked`.

### Rational-model comparison under transfer

**Declaration:** `TauCeti.GL2Transfer.rational_models`; comparison; node `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`.

Let (π′, π) be the cohomological JL pair of coefficient-conjugation, and L ⊂ C a field containing Q(π_f) = Q(π′_f). A p-adic coefficient field such as CDN20's is used through a fixed isomorphism C ≅ Q̄_p. (i) If π′_f and π_f have L-models, then at every finite v ∉ S the fixed identification gives an L-linear isomorphism of the L-models of π′_v and π_v, hence of their K_v-invariants with Hecke actions; the arithmetic Hecke eigensystems agree in L and after every extension of L. The models are absolutely irreducible, so isomorphism over C descends to L. (ii) Equality of the fields of rationality does not by itself give an L-model of π′_f: a Schur/descent obstruction at places of S may force a finite extension of L. Consumers therefore fix L large enough. CDN20 §5.2.1 requires the Shimura-curve representation to be defined over its coefficient field L and allows a finite extension of L (footnote 21).

**Hypotheses.**

- (π′, π) is a cohomological JL pair as in coefficient-conjugation.
- L ⊂ C is a field containing Q(π_f) = Q(π′_f); a p-adic coefficient field is reached through a fixed isomorphism C ≅ Q̄_p.
- Models: L-structures on π′_f and π_f stable under the group actions, when they exist; for GL₂ they are supplied, with any descent condition, by the R16.4 interface.
- Hecke eigenvalues are in the arithmetic normalization of split-hecke.

**Construction or proof.**

1. Apply split-hecke and coefficient-conjugation to the common arithmetic Hecke eigencharacter. At v ∉ S, Hom_L(π′_{v,L}, π_{v,L}) ⊗_L C = Hom_C(π′_v, π_v) ≠ 0 for finitely generated admissible models, so the C-isomorphism descends.
2. Take GL₂-side models from R16.4 and retain, rather than silently erase, any descent obstruction on the D× side.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.3/coefficient-conjugation`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`, `AutomorphicFormsOnReductiveGroups:AF.4/rationality-field`, `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Over CDN20's coefficient field L (a finite extension of Q_p), a comparison that keeps L fixed without permitting the finite extension of footnote 21 is stronger than the source.
- At a split place, isomorphism of L-models follows from isomorphism over C; no further descent datum is needed there.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §5.2.1, author p. 44 (author pagination = PDF page). Consumer statement only. CDN20 requires the Shimura-curve automorphic representation to be defined over L, a finite extension of Q_p (complex representations are viewed over Q̄_p through a fixed isomorphism, footnote 24). CDN20 does not compare rational models across the transfer; 'p' is 𝔭 in the text layer.
- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §5.2.1, footnote 21, author p. 44. Consumer: the finite extension of L is permitted for the globalization (Clozel [9]). The node uses only that consumers fix L large enough. The text layer renders ϖ as '$'.

**Implementation status:** `unchecked`.

### Definite quaternionic weights and cuspidal transfer

**Declaration:** `TauCeti.GL2Transfer.definite_infinity`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity`.

Let F be totally real and D ramified at every real place. A representation π′ in the domain of global-jl whose real components are irreducible algebraic representations of D_v× ≅ H× (of the highest weights normalized by R17.1) transfers to a cuspidal π whose real components are discrete series with the same infinitesimal characters (Sym^{k−2} ↔ D_k). Over Q with D ramified exactly at {p,∞}, take Pan's space A_{(k,0)} = A_{D,−χ}, χ = (−k,0), of W^{(k,0)}-valued quaternionic forms. Here W^{(k,0)} has highest weight (k,0) and is the dual of the irreducible algebraic D_p×-representation of highest weight (0,−k). For k ≥ 1, A_{(k,0)} decomposes under T_S into eigenspaces indexed by cuspidal π of GL₂(A_Q) such that π_∞ has the infinitesimal character of the algebraic GL₂-representation of highest weight (0,−k), (π^∞)^{K^p} ≠ 0, and π_p is special or supercuspidal. So the spectrum lies in σ^{K^p}_{k+2,1}, the T_S-spectrum on M_{k+2}(K^p)·t, where GL₂(A_f) acts on t through the cyclotomic character. For k = 0, A_{(0,0)} = A^c ⊕ A^1 with A^1 the forms factoring through Nrd: norm-factor eigenforms have weight-zero spectrum σ_0^{K^p}, and the weight-two cuspidal branch σ^{K^p}_{2,1} lives on A^c. So the norm-factor subspace must be removed to get the weight-two cuspidal branch. Construction of the algebraic form space and its identification with automorphic representations of D×(A_Q) remain the R18.3 owner's work.

**Hypotheses.**

- F is totally real and D/F is ramified at every real place.
- π′ is in the domain of global-jl and its real components are irreducible algebraic representations of D_v× ≅ H× (up to the fixed twist), with highest weights normalized by R17.1.
- For the Pan specialisation: F = Q, D ramified exactly at {p,∞}, χ = (−k,0) with k ≥ 0, K^p ⊂ GL₂(A_f^p) ≅ (D⊗A_f^p)× via Pan's identification (main involution), and T_S = Z_p[T_ℓ, S_ℓ : ℓ ∉ S].
- Pan's coefficient field is the p-adic C (completion of Q̄_p); the algebraic form space and its comparison with complex automorphic forms are supplied by R18.3.

**Construction or proof.**

1. Apply global JL to the non-norm automorphic spectrum and translate the real type with the R17.1 normalization.
2. Track Pan's dual highest-weight convention (W^{(−n₁,−n₂)} dual to highest weight (n₂,n₁)) and the t-power twist before identifying classical arithmetic Hecke generators. At k = 0, separate A^1 (Definition 5.4.11(2)–(3)), whose eigenforms are the norm characters.
3. Export this representation-theoretic comparison to R18.3, which constructs the actual algebraic form space.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`, `GL2AutomorphicRepresentationsAndTransfer:R17.1`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For k=0, treating all quaternionic forms as weight-two cusp forms gives a false result.
- The statement exports spectral data; it does not import R18.3 back into R17.3.
- For k ≥ 1, A^1_{D,(k,0)} = 0, since norm-factor forms exist only when n₁ = n₂.

**Sources.**

- [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1), §5.4.10, before Definition 5.4.11, p. 71 (arXiv v1 page = PDF page). Convention: W^{(−n₁,−n₂)} is the dual of the D_p×-representation of highest weight (n₂,n₁). For Pan's χ = (n₁,n₂) = (−k,0) this is W^{(k,0)}, of highest weight (k,0); the packet's 'W^{(−k,0)}' was wrong.
- [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1), Definition 5.4.11(2), p. 71. Exact: the norm-factor subspace A^1, nonzero only for k = 0; Definition 5.4.11(3) splits A = A^c ⊕ A^1 Hecke-equivariantly. Pan's quaternionic forms are W-valued functions on D×\(D⊗A_f)× with the weight acting at p.
- [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1), §5.5.5, p. 75. Exact for k ≥ 1, continued on p. 76: 'with highest weight (0, −k) and such that (π^∞)^{K^p} ≠ 0 and π_p is special or supercuspidal. In particular, the spectrum is a subset of σ^{K^p}_{k+2,1}', the T_S-spectrum on M_{k+2}(K^p)·t, where GL₂(A_f) acts on t by the cyclotomic character.
- [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1), §5.5.5, p. 76. Exact for k = 0: norm-factor eigenforms go to weight-zero spectrum σ_0^{K^p}, the rest to weight two σ_{2,1}^{K^p}. The stray '1' in the excerpt is the displaced superscript of A^1_{(0,0)} in the text layer.

**Atlas planet:** Definite quaternionic transfer.

**Implementation status:** `unchecked`.

### Indefinite transfer and the parity input

**Declaration:** `TauCeti.GL2Transfer.indefinite_parity`; application; node `GL2AutomorphicRepresentationsAndTransfer:R17.3/indefinite-parity`.

For totally real F of degree d, a quaternion algebra B split at exactly one real place and ramified at the other d−1 has a ramification set of even cardinality, so its number of ramified finite places has the parity of d−1. In CDN20 §5.2.1, B̌ is split at ∞₀, compact modulo the centre at the other real places and ramified at 𝔭; CDN20 puts no degree condition on F, and the parity of the remaining finite ramification is forced by the product formula. Given such B and a cuspidal π of GL₂(A_F) that is square-integrable at every place of Ram(B), the inverse transfer JL_B^{-1}(π) is the automorphic representation used on the associated Shimura curve. It has the same components, hence the same Hecke data, at every split finite place. The geometry and integral/cohomological realization belong to R18/R22. Parity is applied from ClassFieldTheory Layer 14, not reproved.

**Hypotheses.**

- F is totally real of degree d.
- B/F is a quaternion algebra split at exactly one real place and ramified at the other d−1 real places (d = 1 allowed: B split at the real place of Q).
- B is given by the quaternion/class-field suppliers; the parity is applied from ClassFieldTheory Layer 14.
- π is a cuspidal representation of GL₂(A_F) with π_v square-integrable at every place of Ram(B), including the d−1 ramified real places.

**Construction or proof.**

1. Apply the supplied Hilbert product formula to the prescribed local invariants.
2. Apply global JL only after checking the essentially discrete-series conditions at every ramified place.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Over Q, ramification at ∞ alone is impossible; {p,∞} is valid.
- A quaternion algebra split at the single real place of Q needs an even number of ramified finite places.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §5.2.1, author p. 43 (author pagination = PDF page). Consumer setting only: CDN20 chooses this indefinite algebra over a totally real E with E_𝔭 = F (text layer writes p for 𝔭). It states no parity count and no degree condition on E; the parity is the Hilbert product formula. The JL use is on p. 44 ('par la correspondance de Jacquet-Langlands globale').

**Implementation status:** `unchecked`.

### Transfer after exchanging two quaternion invariants

**Declaration:** `TauCeti.GL2Transfer.invariant_exchange`; application; node `GL2AutomorphicRepresentationsAndTransfer:R17.3/invariant-exchange`.

In CDN23 §4.1 (F = Q_p, p > 2), E is a totally real field of even degree in which p splits completely, supplied by a globalization (Prop. 4.5), with a place 𝔭 | p (so E_𝔭 = Q_p) and a real place ∞₀. D⁰ is a quaternion algebra over E ramified exactly at the real places. D has the invariants of D⁰ exchanged at {𝔭,∞₀}: it is ramified at 𝔭 and at the real places other than ∞₀, and split at ∞₀. Both ramification sets have [E:Q] elements. The algebras are identified away from {𝔭,∞₀} by the fixed isomorphism (4.6). Any cuspidal π of GL₂(A_E) that is square-integrable at all real places and at 𝔭 lies in the image of both global-jl correspondences. This gives π⁰ = JL_{D⁰}^{-1}(π) and π^D = JL_D^{-1}(π), whose components away from {𝔭,∞₀} correspond under (4.6), with equal Hecke actions on invariants under any compact open U^𝔭 transported by (4.6). At 𝔭, π⁰_𝔭 is the special or supercuspidal π_𝔭 (via the fixed identification) and π^D_𝔭 = JL_𝔭^{-1}(π_𝔭). At ∞₀, π⁰_{∞₀} is the algebraic type matching the discrete series π_{∞₀} = π^D_{∞₀}. In particular CDN23's tame level U^𝔭, with U_v = GL₂(O_{E_v}) for v ≠ w₁ and U_{w₁} = {g ≡ (1 *; 0 1) mod ϖ_{w₁}}, is carried to D× through (4.6). Here w₁ is CDN23's auxiliary place: N(w₁) is prime to 2Np and not ≡ 1 mod p, and the ratio of the eigenvalues of ρ̄(Frob_{w₁}) is not 1 or N(w₁)^{±1}. N is the product of the orders of the finite groups (U_max A_f^× ∩ t_iG(E)t_i^{-1})/E^×. Existence of w₁ and the small-level geometry are separate supplied inputs, not consequences of JL.

**Hypotheses.**

- Setting of CDN23 §4: F = Q_p with p > 2; E totally real of even degree in which p splits completely (Prop. 4.5), with a place 𝔭 | p (E_𝔭 = Q_p) and a real place ∞₀.
- D⁰ and D are given quaternion algebras over E: D⁰ ramified exactly at the real places, and D ramified at 𝔭 and at the real places other than ∞₀. Both ramification sets have [E:Q] elements, which is even (consistency by ClassFieldTheory Layer 14).
- The isomorphism (4.6) D⁰⊗A^{𝔭,∞₀} ≅ D⊗A^{𝔭,∞₀} and the maximal-order identifications (O_{D⁰})_v ≅ M₂(O_{E_v}) are fixed.
- π is a cuspidal representation of GL₂(A_E) that is square-integrable at every real place and at 𝔭.
- w₁ and the level U are CDN23's (existence of w₁ is a supplied input, [25, Lemma 8.2]).

**Construction or proof.**

1. Check with the Hilbert product formula (ClassFieldTheory Layer 14) that both invariant sets have the even cardinality [E:Q]; D⁰, D and (4.6) are given data of CDN23.
2. Apply global-jl to D⁰ and to D and compare through the common cuspidal π, using the fixed identifications composed with (4.6) at the other places and R17.1 at 𝔭 and ∞₀. Away-place equality identifies the transported tame Hecke actions (split-hecke).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`, `GL2AutomorphicRepresentationsAndTransfer:R17.1`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- The two changed places give an even invariant change.
- At the other places above p the split identifications remain those fixed in the paper.
- If π_𝔭 is an unramified principal series, π gives a D⁰-representation but no D-partner.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §4.1.1, Proposition 4.5, p. 37 (journal page = PDF page). Exact for the field: E has even degree and p splits completely, so E_𝔭 = Q_p (§4 assumes F = Q_p, p > 2). E is supplied by this globalization ([25, prop. 8.1]).
- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §4.1.2, p. 38. Exact: D⁰ is ramified exactly at the real places (possible because [E:Q] is even).
- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §4.1.2, equation (4.6), p. 38. Exact for the invariant exchange and the fixed away-{𝔭,∞₀} identification. Setting only: CDN23 compares D⁰ and D through Scholze's functor (Prop. 4.11), not through global JL. The JL pairing is the node's consequence of global-jl in this setting.
- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf), §4.1.2, p. 38. Exact conditions on w₁ (existence from [25, Lemma 8.2]). N is the product of the orders of the finite groups (U_max A_f^× ∩ t_iG(E)t_i^{-1})/E^×, and ρ̄ is the residual representation of the globalization. U_{w₁} = {g ≡ (1 *; 0 1) mod ϖ_{w₁}}.

**Implementation status:** `unchecked`.

### Quaternionic globalization of a supercuspidal type

**Declaration:** `TauCeti.GL2Transfer.supercuspidal_globalization`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.3/supercuspidal-globalization`.

Let F₀ be a finite extension of Q_p, L a finite extension of Q_p (CDN20's coefficient field; complex representations are viewed over Q̄_p through a fixed isomorphism C ≅ Q̄_p), and τ = LL(M) an irreducible supercuspidal representation of GL₂(F₀) whose central character is trivial on a fixed uniformizer ϖ. The setting is CDN20 §5.2.1: E totally real with a place 𝔭 | p and E_𝔭 = F₀, a real place ∞₀, B̌ split at ∞₀, compact modulo the centre at the other real places and ramified at 𝔭, and B with the invariants of B̌ exchanged at {𝔭,∞₀}. The globalization sought is an automorphic Π̌ of B̌×(A_E), defined over L, with Π̌_∞ containing σ₂ and Π̌_𝔭 ≅ JL(τ). Here σ₂ is trivial at the real places other than ∞₀ and is the holomorphic discrete series of weight 2 with trivial central character at ∞₀. By footnote 21 this may require adjusting the central character, hence twisting everything by a character: τ by η∘det and JL(τ) by η∘Nrd for a character η of F₀^×, which changes ϖ. It may also require replacing L by a finite extension. The result is stated for the twisted data over the extended field. Given Π̌, global JL through GL₂ gives Π on B×(A_E) with Π^𝔭_f ≅ Π̌^𝔭_f under the fixed identifications and Π_𝔭 ≅ τ (twisted as above). Π̌^𝔭_f determines Π̌_𝔭 by quaternionic strong multiplicity one. The existence of Π̌ (Clozel's limit multiplicities, CDN20's [9]) is an explicit unresolved supplier gap, not a consequence of local transfer.

**Hypotheses.**

- F₀ is a finite extension of Q_p and τ = LL(M) is an irreducible supercuspidal representation of GL₂(F₀) whose central character is trivial on a fixed uniformizer ϖ (CDN20's ϖ-compatibility).
- L is a finite extension of Q_p (CDN20's coefficient field), with complex representations viewed over Q̄_p through a fixed isomorphism C ≅ Q̄_p.
- E, 𝔭 (E_𝔭 = F₀), ∞₀, B̌ and B are chosen as in CDN20 §5.2.1 and are given data.
- The existence of the globalization Π̌ (Clozel's limit-multiplicity theorem) is the recorded gap 'Clozel prescribed-supercuspidal globalization'.
- Twisting τ by a character of F₀^× and finitely extending L are allowed, as footnote 21 permits.

**Construction or proof.**

1. Use Clozel's prescribed-discrete-series globalization/limit-multiplicity input for B̌× with σ₂ at infinity and the twisted JL(τ) at 𝔭, after adjusting the central character and enlarging L as footnote 21 allows. This input is recorded as a gap, not inferred from local transfer.
2. Apply global-jl twice (B̌× → GL₂ → B×) to get Π with Π_𝔭 ≅ τ; use strong multiplicity one for determination by the away-𝔭 spectrum.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/strong-multiplicity-one`, `AutomorphicSpectralTheory:AS.6`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- A statement over the original L without permitting the footnote’s coefficient extension is stronger than the source.
- A statement that globalizes τ itself, without allowing the central-character twist of footnote 21 (which changes ϖ), is stronger than the source.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §5.2.1, footnote 21, author p. 44 (author pagination = PDF page). Exact for the permitted modifications. The twist is of everything, including the local type at 𝔭 (it changes the uniformizer ϖ acting trivially, rendered '$' in the text layer), not only a global twist. L is CDN20's p-adic coefficient field. [9] is Clozel, limit multiplicities of discrete series: the recorded gap.
- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §5.2.1, author p. 44. Consumer of global-jl: from Π̌ on the indefinite B̌× to Π on the definite B× (split at 𝔭), through GL₂. This gives Π^𝔭_f = Π̌^𝔭_f and Π_𝔭 = LL(M) = τ (text layer: p for 𝔭).
- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §5.2.1, author p. 43. Exact description of the definite partner B (invariants of B̌ exchanged at {𝔭,∞₀}). σ₂ (trivial at real places ≠ ∞₀; weight-two holomorphic discrete series with trivial central character at ∞₀) is defined on the same page.

**Atlas planet:** Supercuspidal globalization.

**Implementation status:** `unchecked`.


Layer status: **planned**. Every current stage target has a precise declaration node and its prerequisite chains end in a read baseline/supplier, an explicit request, or a named gap. The target-level pass is complete; the stage is not closed.

Closure work:

- Decompose the trace-formula inverse, coefficient-model descent and source-specific spectral comparison proofs after the R16/R17.1–R17.2 supplier interfaces exist.
- Read and request the precise Clozel limit-multiplicity globalization theorem; retain the central-character and coefficient-field choices.

## R17.4 — Cyclic, solvable and cubic base change

Prime-cyclic strong base change is constructed on isobaric classes so that a quadratic self-twist has a legitimate noncuspidal output. The local parameter, central character, descent fiber and cuspidality criterion are separate assertions. A cuspidal output has exactly the prime-degree character-twist fiber; the dihedral noncuspidal output has a unique cuspidal descent, and an isobaric pair permits independent twists of its two characters. A solvable normal tower uses these distinctions at every step.

The nonnormal cubic branch is a separate construction. An S₃ cubic field cannot be reached from the ground field by prime-cyclic steps. The Artin argument needs the adjoint GL₃ lift, cyclic cubic character induction and GL₃ converse/uniqueness/pole recognition. The generic analytic theorem belongs to an AL extension. These four rank-two bridge nodes form the proposed R17.4a sublayer; their current parent remains R17.4 so the packet realizes exactly the assigned scope. Extraordinary dyadic all-place comparison is placed after Artin automorphy in R17.6; putting it into the Artin prerequisites would create a cycle.

Planets: Cyclic base change, Cyclic automorphic descent, Cyclic cuspidality criterion, Solvable base change, Gelbart–Jacquet adjoint lift, Non-normal cubic base change.

### Unramified base-change Satake rule

**Declaration:** `TauCeti.GL2Transfer.unramifiedBaseChange`; definition; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/unramified-base-change`.

Use the existing arithmetic Satake conjugacy class A_v∈GL₂(C) at an unramified finite v. For an unramified local extension E_w/F_v of residue degree f≥1, define its base-change representative to be A_v^f; the conjugacy class is independent of the chosen representative. This is the transfer-specific rule, not a new Satake carrier. Its determinant is det(A_v)^f and its local Euler polynomial is det(1−A_v^f X). For a split global place each local degree is one. The formal degree-zero extension of the matrix-power function is the identity matrix and is not a degree-zero field extension.

**Hypotheses.**

- K is a field (ℂ in the application) and A ∈ GL₂(K) represents the arithmetic-normalised Satake class A_v of a representation π_v unramified at a finite place v (R16.3 normalisation).
- f ≥ 1 is the residue degree of an unramified local extension E_w/F_v; f = 1 at split places.
- f = 0 is only the formal value of the matrix-power function and corresponds to no field extension.
- Coefficient maps are ring homomorphisms K → L acting entrywise on GL₂.

**Construction or proof.**

1. Implement the rule by power in Mathlib’s existing GL(Fin 2,K); use the existing multiplicative determinant and coefficient-map homomorphisms.
2. Compare to restriction of arithmetic Frobenius: Frob_w maps to Frob_v^f in the unramified quotient.

**Consumers determining the API.**

- Langlands §1 formula (1.1) and §2 local criterion (i); Arthur–Clozel Chapter 3 formula (1.1) and Definition 1.1: Specify the almost-everywhere local data that determine global base change.
- R17.6 compatible-system export: Match the characteristic polynomial of restricted Frobenius to the transferred Hecke polynomial.

**API.**

- `TauCeti.GL2Transfer.unramifiedBaseChange_one` (simp): The degree-one rule fixes A.
- `TauCeti.GL2Transfer.unramifiedBaseChange_tower` (functoriality): Applying residue degrees f and then g gives A^{fg}.
- `TauCeti.GL2Transfer.unramifiedBaseChange_conjugate` (compatibility): For P∈GL₂(K), the rule sends P A P^{-1} to P A^f P^{-1}.
- `TauCeti.GL2Transfer.unramifiedBaseChange_det` (projection): The determinant of the output is det(A)^f.
- `TauCeti.GL2Transfer.unramifiedBaseChange_map` (functoriality): Every coefficient ring map commutes with the power rule.

**Unit tests.**

- `TauCeti.GL2Transfer.bc_degree_one_test` (degenerate): Degree one returns every A∈GL₂(K).
- `TauCeti.GL2Transfer.bc_identity_test` (degenerate): The identity matrix stays the identity for every f, including the formal f=0 case.
- `TauCeti.GL2Transfer.bc_diagonal_square_test` (computation): For A=diag(2,3)∈GL₂(Q), degree two gives the matrix diag(4,9), trace 13 and determinant 36.
- `TauCeti.GL2Transfer.bc_not_identity_test` (non-example): For that A, degree two is different from degree one.
- `TauCeti.GL2Transfer.bc_tower_test` (compatibility): Residue degrees two then three give diag(64,729), agreeing with degree six.

**Direct prerequisites.** `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.GeneralLinearGroup.det`, `mathlib:Matrix.GeneralLinearGroup.map`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For diagonal eigenvalues (2,3) over Q and residue degree two, the output eigenvalues are (4,9), not (2,3).

**Sources.**

- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 §1, formula (1.1) and Definition 1.1, printed p. 199 (PDF p. 215). Exact source of the power rule: the formula (1.1) displayed after this sentence is (t_{π,v})^{f_v} = t_{Π,w} for every w|v, in the unitary normalisation of Hecke matrices. OCR shows f_v as 'f,' and w|v as 'wlv'; the formula itself is garbled in the OCR and was read from the page image. The node uses the R16.3 arithmetic normalisation. That normalisation differs by the scalar q_v^{1/2}, and q_w^{1/2} = (q_v^{1/2})^f, so the rule A ↦ A^f is the same. The matrix-level API and the formal f = 0 case are the node's own.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2, local lifting criterion (i), Digital Math Archive typescript p. 9 (PDF p. 12); compare §1 formula (1.1), p. 2. Specialisation. For unramified μ, ν and E_w/F_v unramified of degree f, the rule μ′ = μ∘N gives μ′(ϖ_E) = μ(ϖ_F)^f, and likewise for ν. This is the power rule on Satake eigenvalues ('µ0, ν 0' in the text layer are μ′, ν′). Langlands states criterion (i) for cyclic E/F of prime degree ℓ. §1 (1.1) gives the same rule for any unramified degree via the L-group homomorphism. 'p.' is the typescript running-head page, not the printed Annals volume page.

**Implementation status:** `unchecked`.

### Prime-cyclic base change for GL₂

**Declaration:** `TauCeti.GL2Transfer.cyclicBaseChange`; construction; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`.

For a cyclic extension E/F of prime degree ℓ of number fields, there is a uniquely determined strong base-change map BC_{E/F} from isobaric automorphic GL₂ classes over F to isobaric automorphic GL₂ classes over E. BC(π) is the unique isobaric Π such that, at every place w|v, Π_w is the local base-change lift of π_v (Langlands §2, criteria (i)/(ii)). At an unramified w|v its Satake class is unramifiedBaseChange(A_v, f(w/v)); when v splits, Π_w ≅ π_v. A cuspidal input has a cuspidal output or, only for ℓ = 2, an output θ⊞θ^σ for a Hecke character θ of E. The central character is ω_π∘N_{E/F}. The output is invariant under Gal(E/F), and the map does not depend on the chosen generator σ. Neither cuspidality nor injectivity is automatic. The theorem local-compatibility identifies BC(π)_w with the restriction to W_{E_w} of the arithmetic-normalised LLC parameter of π_v.

**Hypotheses.**

- F is a number field and E/F is cyclic of prime degree ℓ; σ is a generator of Gal(E/F). The resulting map does not depend on σ.
- π is an isobaric automorphic representation of GL₂(A_F): cuspidal, or χ₁⊞χ₂ with idele class characters χ₁, χ₂.
- Local lifting is the Langlands–Shintani local base change (Langlands §2 criteria (i)/(ii); Arthur–Clozel Ch. 1 Definition 6.1). Unramified Satake classes use the R16.3 arithmetic normalisation.
- Arthur–Clozel's theorems assume representations induced from unitary cuspidal ones; Langlands's GL₂ theorems have no unitarity assumption.

**Construction or proof.**

1. Use the R17.2 prime-cyclic trace comparison to produce a weak base change (quasi-lifting) and the spectral alternatives: Langlands Lemma 11.3, or Arthur–Clozel Ch. 3 Theorem 4.2 with n = 2. Noncuspidal π(μ,ν) lifts directly to π(μ∘N, ν∘N).
2. Upgrade weak to strong with Langlands Proposition 11.4 (a quasi-lifting is a lifting), or with Arthur–Clozel Ch. 3 Theorem 5.1 using the supplied rank-two local comparison. R16.4 isobaric strong multiplicity one fixes the class. At split places the local lift is π_v (Langlands §8).

**Consumers determining the API.**

- Langlands §3; R17.5 tetrahedral and octahedral arguments: Restrict the automorphic realization along the cyclic normal subextensions.
- Carayol §12.3; PotentialModularityAndCompatibleSystems R23.5: Preserve specified local components at split places and restrict local parameters at other places.

**API.**

- `TauCeti.GL2Transfer.cyclicBaseChange_local` (compatibility): At w|v, BC(π)_w is the local base-change lift of π_v in the sense of Langlands §2 (criteria (i)/(ii)); at split v it is π_v. Its description as the restriction of the normalised local parameter to W_{E_w} is the theorem local-compatibility.
- `TauCeti.GL2Transfer.cyclicBaseChange_unramified` (simp): At unramified w|v, Satake equals unramifiedBaseChange(A_v,f(w/v)).
- `TauCeti.GL2Transfer.cyclicBaseChange_central` (projection): The central character is pullback along the idele norm.
- `TauCeti.GL2Transfer.cyclicBaseChange_twist` (functoriality): BC(π⊗χ)=BC(π)⊗(χ∘N_{E/F}).
- `TauCeti.GL2Transfer.cyclicBaseChange_galois` (characterisation): Every output is Gal(E/F)-invariant; every invariant cuspidal class occurs, with the fibers described in cyclic-descent-fibers.
- `TauCeti.GL2Transfer.cyclicBaseChange_coefficients` (compatibility): In the supplied rational/cohomological regime, coefficient conjugation commutes with BC after the recorded normalization.

**Unit tests.**

- `TauCeti.GL2Transfer.cyclic_split_test` (compatibility): At a completely split v each local output equals the original component and its Satake representative A_v.
- `TauCeti.GL2Transfer.cyclic_inert_test` (computation): At an inert unramified place of a quadratic extension, diag(2,3) becomes diag(4,9).
- `TauCeti.GL2Transfer.cyclic_induced_test` (non-example): For π=AI_{E/F}(θ) with θ≠θ^σ in a quadratic extension, BC(π)=θ⊞θ^σ and is not cuspidal.
- `TauCeti.GL2Transfer.cyclic_odd_degree_test` (characterisation): For prime ℓ>2, every cuspidal GL₂ input remains cuspidal.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/unramified-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- A quadratic dihedral representation induced from E can lose cuspidality under this map.

**Sources.**

- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2, global properties (A),(B), Digital Math Archive typescript p. 14 (PDF p. 17); proof in §11, Lemma 11.3 and Proposition 11.4, pp. 140–145. Exact for GL₂ and E/F cyclic of prime degree: existence, uniqueness and Galois invariance of the global lift. In Langlands's definition (p. 13), Π lifts π when Π_w is a local lift of π_v at every place. The central character is property (E), p. 14. The cuspidal or θ⊞θ^σ alternatives are Lemma 11.3. Langlands has no unitarity restriction.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §8, split places, Digital Math Archive typescript p. 93 (PDF p. 96). Exact for the split-place clause: when v splits, the local lift of π_v is π_v ⊗ ⋯ ⊗ π_v, so BC(π)_w ≅ π_v for every w|v.
- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3, Theorem 5.1 (with Theorem 4.2(a)–(c)), printed pp. 202 and 212 (PDF pp. 218, 228). GL(n) generalisation, used for the weak-to-strong step. A weak lift, defined by the almost-everywhere formula (1.1), between representations induced from unitary cuspidal ones is a strong lift, i.e. a local base-change lift at every place (Definition 1.2). Theorem 4.2(a)–(c) gives existence and uniqueness of the σ-stable lift. OCR: 'ir', 'r' = π; 'II', 'I' = Π. The node specialises to n = 2; non-unitary inputs reduce to this by twisting with |det|^s.

**Atlas planet:** Cyclic base change.

**Implementation status:** `unchecked`.

### All-place compatibility of cyclic base change

**Declaration:** `TauCeti.GL2Transfer.local_compatibility`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`.

For the strong cyclic BC pair and every place w|v, rec^{arith}_{E_w}(BC(π)_w) equals rec^{arith}_{F_v}(π_v) restricted to W_{E_w}, including the monodromy operator and the normalization twist specified by R16.3. For a principal series restrict both characters; for a Steinberg twist retain nonzero monodromy; for a supercuspidal the restricted parameter may become reducible. At real-to-complex places restrict the real Weil parameter. A merely almost-everywhere Satake match is not this all-place statement. The global input gives only that BC(π)_w is the local Shintani lift of π_v (character identities). The passage to restricted parameters is local: Langlands covers reducible, special, dihedral and tetrahedral parameters; R16.3 supplies the octahedral (extraordinary) dyadic case for every ℓ. Carayol proves the case [E_w:F_v] ≤ 3 in the Proposition of his §12.2.2, but that Proposition belongs to AutomorphicGaloisRepresentations R19.2, downstream of this stage, so it is not used here.

**Hypotheses.**

- E/F is a cyclic extension of number fields of prime degree ℓ. π is an isobaric automorphic representation of GL₂(A_F) and BC(π) is its strong cyclic base change (cyclic-base-change).
- w|v is any place, archimedean or not, split, inert or ramified. E_w/F_v is trivial or cyclic of degree ℓ.
- rec^{arith} is the R16.3 arithmetic-normalised rank-two local Langlands correspondence with values in Frobenius-semisimple Weil–Deligne representations (monodromy included).
- Comparing the local Shintani lift with restriction of parameters for octahedral (extraordinary) π_v at p = 2, for every ℓ, is an R16.3 input; Carayol's proof of the degree ≤ 3 cases lives downstream in AutomorphicGaloisRepresentations R19.2.

**Construction or proof.**

1. Strong lifting: Langlands §2 (A) with Proposition 11.4, or Arthur–Clozel Ch. 3 Definition 1.2 and Theorem 5.1. At every place w|v, BC(π)_w is the local base-change lift of π_v (Shintani character identities; at split places π_v itself, Langlands §8).
2. Turn local lifts into restricted parameters case by case. Principal series: Langlands criterion (i), restricting both characters. Special: Lemma 7.6 (special lifts to special, so monodromy is kept). Dihedral and archimedean: §2(e). Tetrahedral: Lemma 11.8. Octahedral (extraordinary) at p = 2, every ℓ: the R16.3 characterisation. Carayol's §12.2.2 Proposition covers degree ≤ 3 downstream, in AutomorphicGaloisRepresentations R19.2, and is not imported, which keeps the stage graph acyclic. Twisting by |·|^s commutes with restriction because |·|_{F_v}∘N = |·|_{E_w}, so the R16.3 arithmetic normalisation is respected.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Steinberg monodromy does not vanish just because the extension is unramified.
- Carayol's extraordinary comparison for non-Galois cubic extensions (AutomorphicGaloisRepresentations R19.2/carayol-cubic-base-change-of-extraordinary) is a separate theorem, not an instance of cyclic restriction.

**Sources.**

- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3, Definition 1.2 and Theorem 5.1, printed pp. 199, 212–213 (PDF pp. 215, 228–229). Proof step only: the strong lift has Π_w a local base-change lift of π_v at every place. OCR: 'II' = Π_w, 'xr'/'tr' = π/π_v, 'wjv' = w|v. Here local lifting is the Shintani character identity of Arthur–Clozel Ch. 1 Definition 6.1. Arthur–Clozel do not compare it with restriction of Langlands parameters; that comparison comes from the sources below and R16.3.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2, local result (e), Digital Math Archive typescript p. 10 (PDF p. 13). Exact for reducible (principal-series) and dihedral parameters, which includes every archimedean case since irreducible two-dimensional representations of W_ℝ are dihedral. The remark after (e) says the methods reach tetrahedral ρ but not octahedral ρ.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §7, Lemma 7.6, Digital Math Archive typescript p. 68 (PDF p. 71). Exact for special representations: the lift of the special representation σ(μ′,ν′) of GL₂(F_v) is the special representation σ(μ,ν) of GL₂(E_w), so Steinberg twists stay Steinberg and the monodromy stays nonzero ('µ0, ν 0' are μ′, ν′).
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §11, Lemma 11.8, Digital Math Archive typescript p. 151 (PDF p. 154). Exact for dihedral and tetrahedral local parameters and every prime ℓ.
- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.2.2, printed p. 457 (PDF p. 50). Carayol states the principle (Σ is the restriction of σ to W′_L) and says he knows no reference for it. He says it follows from the definitions for principal series and is checked without much difficulty for special and ordinary cuspidal representations. He then proves the extraordinary cuspidal case (the Proposition of §12.2.2, proof §12.2.3) for p-adic L/F of degree ≤ 3. This covers ℓ = 2, 3. No source read here covers octahedral parameters at p = 2 with ℓ ≥ 5; that case comes from R16.3.

**Implementation status:** `unchecked`.

### Prime-cyclic automorphic descent

**Declaration:** `TauCeti.GL2Transfer.cyclic_descent`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`.

For cyclic E/F of prime degree ℓ, a cuspidal automorphic GL₂ representation Π over E has a cuspidal descent over F if and only if Π^σ≅Π for a generator σ of Gal(E/F). The resulting descents are determined up to twisting by the ℓ characters of F×N_{E/F}(A_E×)\A_F×. This is descent of an automorphic representation, proved by the twisted trace formula comparison, not descent of a Galois representation. Invariant noncuspidal isobaric classes also have isobaric descents, with the two-character ambiguity described separately.

**Hypotheses.**

- E/F is a cyclic extension of number fields of prime degree ℓ, with σ a generator of Gal(E/F).
- Π is a cuspidal automorphic representation of GL₂(A_E); in the last clause, Π is isobaric.
- A descent of Π is an automorphic π over F with BC_{E/F}(π) ≅ Π (strong base change).
- η runs over the ℓ Hecke characters of F trivial on F^×N_{E/F}(A_E^×) (global class field theory).

**Construction or proof.**

1. Use the prime-cyclic invariant-spectrum comparison from R17.2 and Langlands properties (B), (C): Lemma 11.3(c) and Proposition 11.4 show that an invariant cuspidal Π is a lifting, and Lemma 11.6(b) counts the descents.
2. Use R16.4 uniqueness and the cyclic character group supplied by class field theory.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Non-invariant Π has no cyclic descent.
- Invariant Π can have several distinct cuspidal descents.

**Sources.**

- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §11, Lemma 11.6(b), Digital Math Archive typescript p. 151 (PDF p. 154). Exact: an invariant cuspidal Π is the lift of exactly ℓ cuspidal π (the text layer prints ℓ as a backquote). Property (B) (p. 14: an isobaric Π is a lifting iff Π^τ ≅ Π for all τ) supplies the converse, and with it the 'if and only if'. Arthur–Clozel Ch. 3 Theorem 4.2(d) is the GL(n) version.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2, global property (C), Digital Math Archive typescript p. 14 (PDF p. 17). Exact for the twist ambiguity ('π 0' is π′). The group is F^×N_{E/F}I_E\I_F, written out in the sentence before; this sentence omits '\I_F'. Class field theory gives it order ℓ.

**Atlas planet:** Cyclic automorphic descent.

**Implementation status:** `unchecked`.

### The exact prime-cyclic cuspidality criterion

**Declaration:** `TauCeti.GL2Transfer.cuspidality`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`.

Let π be cuspidal GL₂ over F and E/F cyclic of prime degree ℓ; let η be a generator of the order-ℓ group of Hecke characters of F trivial on F^×N_{E/F}(A_E^×). Then BC_{E/F}(π) is noncuspidal if and only if π≅π⊗η. This can occur only for ℓ=2. In that case BC(π)=θ⊞θ^σ for a Hecke character θ with θ≠θ^σ. The identification of π with quadratic automorphic induction is provided by R17.5/quadratic-induction, after this base-change criterion. For prime ℓ>2 the output is always cuspidal. For composite cyclic extensions test each prime step; an odd prime criterion is not a criterion for every composite degree.

**Hypotheses.**

- E/F is a cyclic extension of number fields of prime degree ℓ, and π is a cuspidal automorphic representation of GL₂(A_F).
- η is a generator of the order-ℓ group of Hecke characters of F trivial on F^×N_{E/F}(A_E^×). The condition π ≅ π⊗η does not depend on which generator is chosen.
- BC_{E/F} is the strong cyclic base change of cyclic-base-change.
- AC89 Theorem 4.2 is stated for unitary π; the general case follows by twisting with |det|^s. Langlands has no unitarity restriction.

**Construction or proof.**

1. Arthur–Clozel Ch. 3 Theorem 4.2(a),(b) with n = 2. If π≇π⊗η, the lift is cuspidal. If π≅π⊗η, the only lift is Π₁×Π₁^σ×⋯×Π₁^{σ^{ℓ−1}} with Π₁ cuspidal on GL(2/ℓ) and Π₁≇Π₁^σ; so ℓ = 2 and Π₁ = θ is a Hecke character of E with θ≠θ^σ.
2. Taking central characters in π≅π⊗η gives η²=1; since η has prime order ℓ, ℓ=2. This is why Langlands calls Lemma 11.7 trivial for odd ℓ.
3. For GL₂ the same criterion also follows from Langlands Lemma 11.3(a),(b) and Lemma 11.7. Lemma 11.3(a): π(Ind θ) lifts to π(θ,θ^σ); Lemma 11.3(b): every other cuspidal π has a cuspidal lift. Lemma 11.7: π≅η⊗π iff ℓ=2 and π is induced from E. The named quadratic induction construction is not an input to this criterion.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- A quadratic dihedral π with inducing field different from E need not lose cuspidality under E/F.

**Sources.**

- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3, Theorem 4.2(a),(b), printed p. 202 (PDF p. 218). Exact criterion for GL(n), specialised to n = 2. (a) If π ≇ π⊗η, the unique σ-stable lift is cuspidal. (b) If π ≅ π⊗η, the only lift is Π₁×Π₁^σ×⋯ with Π₁ cuspidal on GL(n/ℓ) and Π₁ ≇ Π₁^σ; for n = 2 this forces ℓ = 2 and Π = θ⊞θ^σ with θ ≠ θ^σ. OCR glyphs, read from the page image: '7r', 'ir', 'r' = π; 'II', 'Hi', 'll' = Π, Π₁; 'a-stable' = σ-stable. The theorem is stated for unitary cuspidal π.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §11, Lemma 11.7, Digital Math Archive typescript p. 151 (PDF p. 154). Self-twist criterion, not itself a base-change statement: for ω a nontrivial character of F^×N I_E\I_F and π cuspidal, π ≅ ω⊗π iff ℓ = 2 and π = π(Ind θ). With Lemma 11.3(a),(b) it gives the node's criterion for GL₂. Langlands calls the lemma trivial for odd ℓ and omits the proof for ℓ = 2, deferring it to Labesse–Langlands [18].
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §11, Lemma 11.3(b), Digital Math Archive typescript p. 141 (PDF p. 144); Lemma 11.3(a) on p. 140. Exact for the cuspidal direction: a cuspidal π that is not π(ρ) with ρ induced from a character of the given E has a cuspidal quasi-lifting, and hence a cuspidal lifting by Proposition 11.4. Lemma 11.3(a) gives the noncuspidal lift π(μ,μ^σ) of π(Ind μ).

**Atlas planet:** Cyclic cuspidality criterion.

**Implementation status:** `unchecked`.

### Cuspidal fibers and quadratic self-twists

**Declaration:** `TauCeti.GL2Transfer.cyclic_descent_fibers`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers`.

If Π is a Gal(E/F)-invariant cuspidal GL₂ representation and π is one of its cyclic descents, then its cyclic descents are precisely π⊗η^i, 0≤i<ℓ; these ℓ classes are distinct and all cuspidal. If E/F is quadratic and the common output is noncuspidal θ⊞θ^σ with θ≠θ^σ, its descent is unique (and cuspidal): π⊗η≅π. The assertion of ℓ distinct descents therefore applies only when the output is cuspidal.

**Hypotheses.**

- E/F is a cyclic extension of number fields of prime degree ℓ, and η is a generator of the Hecke characters of F trivial on F^×N_{E/F}(A_E^×).
- First clause: Π is a cuspidal automorphic representation of GL₂(A_E) with Π^σ ≅ Π, and π is one of its descents.
- Second clause: ℓ = 2 and Π = θ⊞θ^σ for a Hecke character θ of E with θ ≠ θ^σ.

**Construction or proof.**

1. Apply Langlands Lemma 11.6(a),(b) for the fiber counts, as recorded in property (C); equivalently, Arthur–Clozel Ch. 3 Theorem 4.2(d),(e) with n = 2.
2. Use the exact cuspidality criterion to rule out η-self-twists when Π is cuspidal, so the ℓ twists are distinct. A noncuspidal π(μ,ν) cannot be a descent in either case, since its lift π(μ∘N,ν∘N) has σ-invariant characters.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For a quadratic induced π, the two nominal twists coincide; for a cuspidal quadratic output they are distinct.

**Sources.**

- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §11, Lemma 11.6(a), Digital Math Archive typescript p. 150 (PDF p. 153); (b) on p. 151. Exact for the noncuspidal case ('6=' is the text layer's ≠): π(μ,μ^σ) with μ^σ ≠ μ has exactly one preimage among all automorphic π, so in particular a unique cuspidal descent. Lemma 11.6(b), on p. 151, gives the ℓ descents of an invariant cuspidal Π.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2, global property (C), Digital Math Archive typescript p. 14 (PDF p. 17). Exact for both counts. A cuspidal π not induced from E has ℓ distinct descents. When ℓ = 2 and π is induced from E there is one descent, and π ≅ ω⊗π. Arthur–Clozel Ch. 3 Theorem 4.2(d),(e) is the GL(n) version.

**Implementation status:** `unchecked`.

### Isobaric character fibers

**Declaration:** `TauCeti.GL2Transfer.isobaric_fibers`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/isobaric-fibers`.

For π=χ₁⊞χ₂ over F, its cyclic base change is (χ₁∘N_{E/F})⊞(χ₂∘N_{E/F}). Equality of two such outputs is equality of the unordered pairs of pulled-back characters. The two characters can be twisted independently by characters trivial on the norm subgroup; the ambiguity is not in general a simultaneous twist of the whole rank-two representation. When an invariant pair over E is exchanged by σ (possible only for ℓ=2), it has the quadratic cuspidal descent of the exchanged character pair described above.

**Hypotheses.**

- E/F is a cyclic extension of number fields of prime degree ℓ; N = N_{E/F} on ideles.
- π = χ₁⊞χ₂ with χ₁, χ₂ idele class characters of F, not necessarily unitary.
- The twisting characters run over the Hecke characters of F trivial on F^×N_{E/F}(A_E^×).
- The exchanged case θ⊞θ^σ with θ ≠ θ^σ occurs only for ℓ = 2.

**Construction or proof.**

1. Pull back the two characters individually along the idele norm (Langlands §11, verification of (A)).
2. Use the rank-one class-field norm-kernel description and the prime-cyclic exchanged-character descent case (Langlands property (C) and the verification of (B)). Compare unordered pairs rather than ordered Satake eigenvalues, using isobaric strong multiplicity one (R16.4).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Twisting only χ₁ by η already gives the same base change; this need not be a simultaneous twist of χ₁⊞χ₂.

**Sources.**

- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2, global property (C), first sentence, Digital Math Archive typescript p. 14 (PDF p. 17). Exact for the fibre: the descents of BC(π(μ,ν)) are the π(μ₁μ, ν₁ν), with μ₁, ν₁ independent characters of F^×N_{E/F}I_E\I_F. Langlands's π(μ,ν) is the node's μ⊞ν.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §11, verification of (A)–(G), Digital Math Archive typescript p. 151 (PDF p. 154). Exact for BC(χ₁⊞χ₂) = (χ₁∘N)⊞(χ₂∘N) ('µ0, ν 0' are μ′, ν′).
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §11, verification of (B), Digital Math Archive typescript p. 151 (PDF p. 154). Exact for the invariance condition. The exchanged case μ^σ = ν ≠ μ forces ℓ = 2, and its descent is Lemma 11.6(a) (cyclic-descent-fibers). Equality of outputs as unordered pairs uses isobaric strong multiplicity one (§3 Lemma 3.1; R16.4).

**Implementation status:** `unchecked`.

### Base change along a solvable normal tower

**Declaration:** `TauCeti.GL2Transfer.solvableBaseChange`; construction; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`.

Let E/F be a finite Galois extension with solvable Galois group. Choose a subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E with each step cyclic of prime degree and define BC_{E/F} by composing the prime-cyclic maps on isobaric GL₂ classes. At every local place the normalized parameter is restricted from F to E; the map is independent of the chosen prime-cyclic tower by almost-everywhere Satake comparison and isobaric strong multiplicity one. It preserves twists through the total norm and preserves cuspidality exactly when no intermediate step meets its quadratic self-twist exception. A non-Galois cubic extension has no such prime-cyclic tower from F; it is not constructed here.

**Hypotheses.**

- E/F is a finite Galois extension of number fields with solvable Galois group.
- A chosen subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E in which each F_i/F_{i−1} is cyclic of prime degree ℓ_i (F_i need not be normal over F), with compatible embeddings and places.
- π is an isobaric automorphic representation of GL₂(A_F).
- Non-Galois extensions, such as non-normal cubic fields, are excluded.

**Construction or proof.**

1. Choose a subnormal series of the finite solvable group and pass to fixed fields.
2. Compose prime-cyclic base change, retaining every local restriction (local-compatibility at each step and transitivity of restriction) and central-character norm.
3. Independence of the tower is proved directly, without assuming every intermediate field is normal over F. At almost every place, unramified in E and for π, two composites have Satake class A_v^{f(w/v)}, since residue degrees multiply and unramified-base-change composes. Hence they are isomorphic by R16.4 isobaric strong multiplicity one. The theorem tower-independence records this.

**Consumers determining the API.**

- PotentialModularityAndCompatibleSystems R23.5; R17.6 exports: Restrict automorphic data through a chosen solvable extension with local splitting retained.
- Langlands §3: Use the normal cyclic subextensions for the solvable Artin argument, separate from nonnormal cubic transfer.

**API.**

- `TauCeti.GL2Transfer.solvableBaseChange_refl` (simp): For E=F and the empty tower the map is identity.
- `TauCeti.GL2Transfer.solvableBaseChange_tower` (functoriality): For a nested pair of solvable normal extensions the map agrees with composition, with the chosen compatible embeddings.
- `TauCeti.GL2Transfer.solvableBaseChange_local` (compatibility): Every local parameter is restriction along the total local extension, and at completely split places it is unchanged.
- `TauCeti.GL2Transfer.solvableBaseChange_twist` (functoriality): Twisting by χ before BC equals twisting after BC by χ∘N_{E/F}.

**Unit tests.**

- `TauCeti.GL2Transfer.solvable_empty_test` (degenerate): The empty tower fixes every isobaric class.
- `TauCeti.GL2Transfer.solvable_two_towers_test` (characterisation): For a biquadratic E/F, the towers through two different quadratic subfields give equal isobaric output.
- `TauCeti.GL2Transfer.solvable_degree_six_test` (computation): At a place with local residue degrees two then three, diag(2,3) becomes diag(64,729).
- `TauCeti.GL2Transfer.solvable_cuspidality_test` (non-example): A cuspidal input induced from the first quadratic step is already noncuspidal there, so no blanket solvable cuspidality theorem is asserted.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/unramified-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For a non-normal cubic field K/F with S₃ normal closure, its own K/F transfer requires the separate cubic node.

**Sources.**

- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 §7, proof of Theorem 7.3, printed p. 222 (PDF p. 238). Closest source passage. Arthur–Clozel define ρ_{F→F₀}(τ) by repeated prime-cyclic base change along a tower F = F_r ⊂ F_{r−1} ⊂ ⋯ ⊂ F₀ attached to a subnormal series with cyclic quotients of prime order. OCR: 'r7F' = τ_{F₀}, 'Gm(AF0)' = G_m(A_{F₀}), 'r' = τ. This is a step in a GL(m) proof, not a stated theorem; the node specialises to m = 2 with E/F Galois.
- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 §7, proof of Theorem 7.3, printed p. 222 (PDF p. 238). Proof step: the composed lifts preserve representations induced from cuspidal, and these are determined by almost all Hecke eigenvalues (OCR 'IoF', 'PF--Fo' = ι^F_{F₀}, ρ_{F→F₀}). This is the node's tower-independence argument.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3, Lemma 3.1, Digital Math Archive typescript p. 15 (PDF p. 18). Exact GL₂ isobaric strong multiplicity one, used for independence of the tower (credited by Langlands to Callahan). In the packet this input comes from R16.4.

**Atlas planet:** Solvable base change.

**Implementation status:** `unchecked`.

### Independence of the solvable tower

**Declaration:** `TauCeti.GL2Transfer.tower_independence`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/tower-independence`.

For two prime-cyclic subnormal towers from F to the same solvable Galois extension E, the composed GL₂ isobaric base changes coincide. At all places unramified in the towers and in π, both Satake classes are A_v^{f(w/v)}, because residue degrees multiply along each tower. Isobaric strong multiplicity one therefore gives an isomorphism of the two global outputs, hence equality of every local component. Strong local compatibility is not needed for independence; it describes each common component as the restriction of the parameter of π_v. No chosen ordered diagonalization or chosen generator of a cyclic Galois group survives in the output.

**Hypotheses.**

- E/F is a finite Galois extension of number fields with solvable Galois group, and two subnormal towers from F to E have prime-cyclic steps.
- π is an isobaric automorphic representation of GL₂(A_F).
- Isobaric strong multiplicity one over E holds (R16.4; Langlands Lemma 3.1).

**Construction or proof.**

1. Multiply local residue degrees and use the power rule in a tower.
2. Apply the isobaric R16.4 multiplicity-one input to get the global isomorphism. Local restriction transitivity, via local-compatibility, then describes the common local components. Generator independence at each step is Langlands p. 151 / Arthur–Clozel Ch. 3 Proposition 4.4(i).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/unramified-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- The biquadratic two-tower test has the same arithmetic determinant coefficient along both routes.

**Sources.**

- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 §7, proof of Theorem 7.3, printed p. 222 (PDF p. 238). Closest passage, a proof step only. No source states tower independence for GL₂; the node is the packet's own argument, modelled on this remark that composed tower lifts are determined by almost-all Hecke eigenvalues (OCR 'IoF', 'PF--Fo' = ι^F_{F₀}, ρ_{F→F₀}).
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3, Lemma 3.1, Digital Math Archive typescript p. 15 (PDF p. 18). Exact statement of the key input: two isobaric GL₂ representations that agree at almost all places are isomorphic. The packet supplies it through R16.4.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §11, verification of (A)–(G), Digital Math Archive typescript p. 151 (PDF p. 154). Exact only for independence of the generator σ within one prime-cyclic step (the packet's 'verification of generator independence'), not of the tower. Arthur–Clozel Ch. 3 Proposition 4.4(i) is the GL(n) analogue.

**Implementation status:** `unchecked`.

### Descent along a solvable tower with character choices

**Declaration:** `TauCeti.GL2Transfer.solvable_descent`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent`.

Fix a prime-cyclic subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E and an isobaric automorphic GL₂ representation Π over E. Then Π is the composed base change of an isobaric π over F along this tower if and only if there is a chain Π_r=Π, Π_{r−1}, …, Π₀=π in which each Π_{i−1} is a cyclic descent of Π_i along F_i/F_{i−1} and, for i≥2, Π_{i−1} is invariant under Gal(F_{i−1}/F_{i−2}). At each step the possible Π_{i−1} are given by the cyclic fibre theorems. If Π_i is cuspidal there are ℓ_i distinct twists. If ℓ_i=2 and Π_i=θ⊞θ^σ with θ≠θ^σ, there is a unique cuspidal descent. If Π_i=(χ₁∘N)⊞(χ₂∘N), the two characters can be twisted independently by norm-kernel characters. The theorem supplies descent once these stepwise choices exist and records their ambiguities. It does not assert that Gal(E/F)-invariance of Π alone yields a descent to F: an invariant choice at each step, and compatibility with prescribed central characters, is a hypothesis, not a conclusion.

**Hypotheses.**

- A fixed subnormal tower F=F₀⊂F₁⊂⋯⊂F_r=E with each F_i/F_{i−1} cyclic of prime degree ℓ_i, and a generator σ_i of each Gal(F_i/F_{i−1}).
- Π is an isobaric automorphic representation of GL₂(A_E).
- Descent along the tower means preimage under the composed base change of solvable-base-change along this tower.
- Gal(E/F)-invariance of Π alone is not assumed to give a descent; the stepwise invariant choices are hypotheses.

**Construction or proof.**

1. Apply cyclic descent from the top down (Langlands property (B); Arthur–Clozel Ch. 3 Theorem 4.2(d),(f)) and enumerate its fibers at each step (cyclic-descent-fibers, isobaric-fibers; Arthur–Clozel Ch. 3 Theorem 3.1).
2. Before continuing, check invariance under the next generator and any prescribed central-character restrictions. Use the isobaric fiber theorem once cuspidality has been lost. The converse direction is the definition of the composed base change (solvable-base-change).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/isobaric-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For a quadratic step the central character does not distinguish π and π⊗η, since η²=1.
- The theorem does not silently turn a Galois descent into an automorphic descent.

**Sources.**

- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 §3, Theorem 3.1 and its introduction, printed p. 201 (PDF p. 217). Stepwise fibre input. Theorem 3.1: cuspidal π, π′ with (t_{π,v})^{f_v} = (t_{π′,v})^{f_v} almost everywhere satisfy π′ = π⊗χ with χ trivial on F^*N(A_E^*), for cyclic E/F not necessarily of prime degree. Neither source treats descent along a solvable tower; the node iterates the cyclic results.
- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3, Theorem 4.2(f) (and (d)), printed p. 203 (PDF p. 219). Exact for one cyclic step (OCR 'II' = Π, 'a-stable' = σ-stable, 'ir' = π): a σ-stable Π induced from unitary cuspidal ones descends. Theorem 4.2(d), p. 202, gives the twist fibre for cuspidal Π.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2, global properties (A),(B), Digital Math Archive typescript p. 14 (PDF p. 17). Exact GL₂ criterion for one step, with no unitarity assumption: an isobaric Π over F_i is a lifting from F_{i−1} iff it is Gal(F_i/F_{i−1})-invariant.

**Implementation status:** `unchecked`.

### Base change with prescribed local splitting

**Declaration:** `TauCeti.GL2Transfer.prescribed_local_base_change`; application; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/prescribed-local-base-change`.

Suppose a solvable normal extension E/F has already been produced by the arithmetic/potential-modularity owner with chosen completions and splitting at a finite set T. Then BC_{E/F}(π)_w≅π_v at every w|v with v∈T completely split; elsewhere its parameter is the restriction to the prescribed completion. If cuspidality is required, check the quadratic self-twist criterion at every tower step. For potentially unramified or ordinary conditions stated by the consuming local owner, export only the consequences of this precise local restriction and normalization. The construction of the extension with prescribed points/splitting is not replanned here.

**Hypotheses.**

- E/F is a solvable Galois extension of number fields with a chosen prime-cyclic tower, supplied by the consumer together with chosen places and completions.
- T is a finite set of places of F that split completely in E.
- π is an isobaric (in applications, cuspidal) automorphic representation of GL₂(A_F); local parameters use the R16.3 arithmetic normalisation.
- The existence of E with the prescribed splitting is supplied by the consumer and not proved here.

**Construction or proof.**

1. At each tower step apply the split-place case of local base change (Langlands §8: π_v lifts to π_v ⊗ ⋯ ⊗ π_v), so BC(π)_w≅π_v for v∈T. At the other places apply strong local compatibility step by step.
2. Check cuspidality stepwise with the cuspidality criterion, and pass the local parameter restriction to the consumer's own local-condition comparison. Carayol §12.3.1–12.3.2 is a model consumer.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- A place completely split in E/F cannot acquire a new conductor or a different local type through BC.

**Sources.**

- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.3.2, printed p. 459 (PDF p. 52). Consumer use. OCR 'relèvement n de n' is 'relèvement Π de π', read from the page image. Carayol takes a totally real quadratic L/F split at v, so the lift has two essentially square-integrable finite components; that is, π_v is kept at both places above v. The split-place identity is used without comment.
- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.3.1, printed pp. 458–459 (PDF pp. 51–52). Consumer use (OCR 'Vo' = v₀). Carayol takes a global cubic L/F, totally real and split above v₀ (conditions (a),(b), p. 458), with a single place above p realising a prescribed local cubic extension. The lift then has the type of Theorem (B) at the three places above v₀. In the octahedral case this L/F is non-Galois and uses the separate JPSS cubic lift, outside this node; only the quadratic and cyclic-cubic (tetrahedral) cases are instances.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §8, split places, Digital Math Archive typescript p. 93 (PDF p. 96). Exact for the split-place clause: at a place split in a cyclic step, the local lift of π_v is π_v at each place above. Iterating along the tower gives BC(π)_w ≅ π_v for v completely split in E.

**Implementation status:** `unchecked`.

### The Gelbart–Jacquet adjoint lift

**Declaration:** `TauCeti.GL2Transfer.adjointLift`; construction; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`.

For a unitary cuspidal GL₂ automorphic representation π over a number field F, the adjoint lift Ad(π)=Sym²(π)⊗ω_π^{-1} (the Gelbart–Jacquet lift) is an isobaric automorphic GL₃ representation with trivial central character, self-dual, whose component at every place is the Gelbart–Jacquet local lift: L(s,Ad(π)_v⊗χ_v)=L(s,(π_v⊗χ_v)×π̃_v)/L(s,χ_v), with the matching ε-factors, for every character χ_v. Through the GL₂ local Langlands correspondence and its pair-factor compatibility these are the factors of the adjoint of the rank-two LLC parameter. At an unramified v with eigenvalues α,β its eigenvalues are α/β,1,β/α. It is invariant under character twist of π. It is cuspidal exactly when π has no nontrivial self-twist (GJ78 Theorem 9.3 and Remark 9.9). If π≅π⊗η with η≠1, then η=η_{E/F} is quadratic, π=AI_{E/F}(θ), and Ad(π)=η_{E/F}⊞AI_{E/F}(θ/θ^σ), with the rank-two induction interpreted isobarically if its character is invariant. The adjoint of a Galois or Weil–Deligne parameter is taken from ArithmeticGaloisRepresentations G7.

**Hypotheses.**

- F is a number field (§9 and Theorem 9.3 are stated for number fields).
- π is a unitary cuspidal automorphic representation of GL₂(A_F).
- Cuspidal branch: π⊗χ≇π for every Hecke character χ≠1 (GJ78 Theorem 9.3).
- Self-twist branch: π≅π⊗η with η≠1; then η=η_{E/F} is quadratic and π=AI_{E/F}(θ) (GJ78 §3.7, Remark 9.9).
- Normalisation: Ad(π)=Sym²(π)⊗ω_π^{-1} is the GJ78 lift, characterised at every place by trivial central character, self-duality and L(s,Ad(π)_v⊗χ_v)=L(s,(π_v⊗χ_v)×π̃_v)/L(s,χ_v) with matching ε; unitary normalisation.
- The identification of local components with the adjoint of the rank-two LLC parameter uses the GL₂ LLC with pair-factor compatibility (R16.3, ET.6) and the GL₃ local converse theorem; GJ78 does not prove it for extraordinary π_v.

**Construction or proof.**

1. Define the local lift by GJ78 Definition 3.1.3 (trivial central character, self-duality, GL₁-twisted L- and ε-factors equal to L₂ and ε₂); uniqueness is JPSS Lemma (7.5.3), quoted in GJ78 Proposition 3.3(1); for non-extraordinary π_v the lift is the explicit induced or special representation of GJ78 §3.2–3.3.
2. Import GJ78 Theorem 8.1: for highly ramified χ, L₂(s,π,χ) is entire and bounded in vertical strips (Shimura's metaplectic integral). This input is not part of AL.3 Rankin–Selberg theory and is recorded with the GL₃ converse gap.
3. Apply the GL₃ converse theorem in the form of GJ78 §9.2 (functional equations for twists highly ramified at a finite set T) and exclude the non-cuspidal cases (iii)–(v) by poles of L(s,(π⊗μ^{-1})×π̃) and the Jacquet–Shalika nonvanishing on Re s=1 (GJ78 §§9.4–9.8). This gives Theorem 9.3 when π has no self-twist.
4. Self-twist case: GJ78 §3.7 and Remark 9.9 give Ad(π)=Ind(G₃,P;π(θθ'^{-1}),η), automorphic (isobaric) and not cuspidal because L(s,Ad(π)⊗η) has a pole.
5. Compare each local lift with the adjoint of the supplied LLC parameter by equality of GL₁-twisted L- and ε-factors and the GL₃ local converse theorem, using that the GL₂ LLC preserves pair factors (R16.3); this construction does not rebuild general GL₃ automorphic carriers.

**Consumers determining the API.**

- Langlands §3 tetrahedral argument: Compare Ad(π) with the cubic monomial representation Ad(ρ) to remove the cyclic descent ambiguity.
- R16.4 non-CM/self-twist interface: Identify the automorphic adjoint cuspidality criterion with the source’s no-self-twist condition.

**API.**

- `TauCeti.GL2Transfer.adjointLift_local` (compatibility): Each local component of Ad(π) is the Gelbart–Jacquet local lift of π_v; under the GL₂ LLC its parameter is the adjoint of the local parameter of π.
- `TauCeti.GL2Transfer.adjointLift_unramified` (simp): Satake eigenvalues (α,β) become (α/β,1,β/α).
- `TauCeti.GL2Transfer.adjointLift_twist` (functoriality): Ad(π⊗χ)=Ad(π) for every Hecke character χ.
- `TauCeti.GL2Transfer.adjointLift_central` (projection): The central character of Ad(π) is trivial.

**Unit tests.**

- `TauCeti.GL2Transfer.adjoint_diagonal_test` (computation): The Satake class diag(2,3) gives diag(2/3,1,3/2) in GL₃(Q).
- `TauCeti.GL2Transfer.adjoint_scalar_test` (degenerate): Scalar Satake input diag(a,a), a≠0, gives the identity class.
- `TauCeti.GL2Transfer.adjoint_twist_test` (compatibility): Multiplying both input eigenvalues by any u≠0 does not change the three adjoint eigenvalues.
- `TauCeti.GL2Transfer.adjoint_not_sym_square_test` (non-example): For diag(2,3), the adjoint output differs from diag(4,6,9); forgetting ω^{-1} gives the wrong lift.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-representation`, `ArithmeticGaloisRepresentations:G7`, `MetaplecticAutomorphicForms:MP.5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-automorphic-representation`, `AutomorphicLFunctionsAndLocalFactors:AL.3/gln-converse-reduced-rank`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For diag(2,3), unramified adjoint eigenvalues are 2/3,1,3/2, with product one.
- For a nontrivial quadratic self-twist the output is not cuspidal.
- When π has no nontrivial self-twist, L(s,Ad(π)⊗χ) is entire for every Hecke character χ (GJ78 Theorem 9.3(1)).

**Sources.**

- [Stephen Gelbart and Hervé Jacquet, A relation between automorphic representations of GL(2) and GL(3)](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf), Introduction, printed p. 472 (PDF p. 3). Normalisation: GJ78 define the lift through the adjoint map GL(2,C)→PGL(2,C)→GL(3,C), i.e. Satake classes diag(α/β,1,β/α); they say the local match with Ad∘φ_v holds 'sometimes only conjecturally'. The identification with the adjoint of the modern LLC parameter is imported (R16.3/ET.6), not in GJ78.
- [Stephen Gelbart and Hervé Jacquet, A relation between automorphic representations of GL(2) and GL(3)](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf), §3.1, Definition 3.1.3 and the remark after it, printed p. 485 (PDF p. 16). Exact for twist invariance (OCR: n=π, a/CT=σ, %/7=χ; the tail reads 'of σ̃≅σ⊗ω^{-1}'). Definition 3.1.3 itself gives trivial central character, self-duality and L(s,π⊗χ)=L(s,(σ⊗χ)×σ̃)/L(s,χ) with matching ε at each place.
- [Stephen Gelbart and Hervé Jacquet, A relation between automorphic representations of GL(2) and GL(3)](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf), §3.6, printed p. 491 (PDF p. 22). Exact for the output type: the lift exists and is automorphic but not always cuspidal (OCR: a=σ, n=π).
- [Stephen Gelbart and Hervé Jacquet, A relation between automorphic representations of GL(2) and GL(3)](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf), §9, Theorem 9.3, printed p. 534 (PDF p. 65). Specialisation: Theorem 9.3 assumes σ unitary cuspidal with σ⊗χ≇σ for χ≠1 and gives the local lift at every place and a cuspidal global lift (parts 2–3); this is the cuspidal branch of the node. OCR: a=σ, G^=G₂.
- [Stephen Gelbart and Hervé Jacquet, A relation between automorphic representations of GL(2) and GL(3)](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf), Remark 9.9, printed p. 541 (PDF p. 72); with §3.7, printed p. 491. Exact for the self-twist branch: σ≅σ⊗η, η≠1 forces η²=1, σ=π(θ) on the quadratic field H, lift Ind(G₃,P;π(θθ'^{-1}),η), automorphic by §3.7 and not cuspidal (OCR: n/7C=π, %=χ, T|=η, '^ cuspidal'='not cuspidal').
- [Stephen Gelbart and Hervé Jacquet, A relation between automorphic representations of GL(2) and GL(3)](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf), §5 lead-in, Theorem 8.1, printed p. 496 (PDF p. 27); proof in §§5–8. Proof step only: holomorphy and vertical-strip bounds of L₂(s,σ,χ) for highly ramified χ, proved by Shimura's metaplectic integral, feed the GL₃ converse theorem in §9. AL.3 Rankin–Selberg theory does not supply this input.

**Atlas planet:** Gelbart–Jacquet adjoint lift.

**Implementation status:** `unchecked`.

### Cyclic cubic induction of a character

**Declaration:** `TauCeti.GL2Transfer.cubic_character_induction`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`.

For a cyclic cubic extension E/F of number fields and a unitary Hecke character θ of E, there is an isobaric automorphic GL₃ representation AI_{E/F}(θ) whose local parameter at every place is Ind_{W_{E_w}}^{W_{F_v}}(θ_w) (the direct sum over w|v at a split place), in the sense of equal GL₁-twisted L- and ε-factors, and whose standard L-function is L_E(s,θ). It is cuspidal if and only if θ,θ^σ,θ^{σ²} are pairwise distinct, i.e. θ≠θ^σ. If θ=χ∘N_{E/F}, the output is χ⊞χη⊞χη² for the order-three character η associated to E/F. This rank-three character case is the exact monomial input to the tetrahedral proof; the general GL_n automorphic-induction theory is not redeveloped here.

**Hypotheses.**

- F is a number field and E/F a cyclic cubic extension whose Galois group is generated by σ.
- θ is a unitary Hecke character of E (a quasi-character is reduced to this by a twist by |·|^s); JPSS Theorem (14.2) assumes unitarity.
- Cuspidal branch: θ≠θ^σ, which is equivalent to irreducibility of Ind_{W_E}^{W_F}θ (Mackey).
- Invariant branch: θ=θ^σ; then θ=χ∘N_{E/F} by class field theory for the cyclic extension, and η generates the characters of A_F^×/F^×N_{E/F}(A_E^×).
- Unitary normalisation; at finite places the local component is characterised by GL₁-twisted L- and ε-factors equal to those of Ind θ_w.

**Construction or proof.**

1. If θ≠θ^σ: Ind θ is irreducible (Mackey), and L(s,Ind θ⊗χ)=L_E(s,θ·(χ∘N_{E/F})) is entire and bounded in vertical strips for every χ, since θ·(χ∘N_{E/F}) is not Galois-invariant and so is never |·|^{it}. Apply JPSS 1979 Theorem (14.2) and the remark on monomial representations; its proof rests on the GL₃ converse theorem (13.6), recorded in the GL₃ supplier gap.
2. If θ=θ^σ: write θ=χ∘N_{E/F} (class field theory for the cyclic extension) and take the isobaric sum χ⊞χη⊞χη²; Ind(χ∘N_{E/F})=χ⊕χη⊕χη² gives the local parameters.
3. Arthur–Clozel Chapter 3 Theorem 6.2 with n=1, ℓ=3 and Theorem 4.2(d),(e) gives the same dichotomy, but only almost everywhere and through GL(3) cyclic base change.

**Direct prerequisites.** `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicFormsOnReductiveGroups:AF.2/automorphic-representation`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-automorphic-representation`, `tauceti:TauCeti.simple_indFDRep_ofLinearCharacter_iff`, `AutomorphicLFunctionsAndLocalFactors:AL.3/gln-converse-reduced-rank`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- An invariant character gives three rank-one summands, not a cuspidal GL₃ output.
- The three nontrivial V₄ characters in the tetrahedral adjoint form one cyclic orbit.

**Sources.**

- [Hervé Jacquet, Ilja I. Piatetski-Shapiro and Joseph Shalika, Automorphic forms on GL(3). II](https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf), Automorphic forms on GL(3) II, §14.2, Theorem (14.2), printed pp. 253–254 (PDF pp. 42–43 of the author-site scan; visual transcription). Exact for the cuspidal branch at every place: for an irreducible unitary 3-dimensional σ of W_F with all L(s,σ⊗χ) entire and bounded in vertical strips, ⊗π_v is cuspidal, with π_v fixed by GL₁-twisted L- and ε-factors at finite v and π_v=π(σ_v) at infinite v.
- [Hervé Jacquet, Ilja I. Piatetski-Shapiro and Joseph Shalika, Automorphic forms on GL(3). II](https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf), §14.2, remark on monomial representations after the proof, printed p. 255 (PDF p. 44). Specialisation to σ=Ind_{W_E}^{W_F}θ with E/F cyclic cubic: σ is irreducible exactly when θ≠θ^σ (cuspidal branch); otherwise it is a sum of three characters (invariant branch).
- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 §6, Definition 6.1 and Theorem 6.2, printed p. 215 (PDF p. 231). Specialisation n=1, ℓ=3, almost everywhere only: Definition 6.1 matches Hecke eigenvalues at almost all places. OCR: irF/wF=π_F, WrE=π_E. The printed 'GL(n, A_F)' is a misprint for GL(nℓ, A_F) (source issue).
- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 §6, Lemmas 6.3–6.4 and Corollary 6.5, printed pp. 217–218 (PDF pp. 233–234). Proof step only: for prime ℓ (here 3) the invariant/non-invariant dichotomy is Theorem 4.2(d),(e), i.e. GL(3) cyclic base change. The composite-degree reduction in this proof is the known gap and is not used. OCR 'I'=ℓ.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3(i), DMA text p. 17 (PDF p. 20). Consumer statement: Langlands's tetrahedral argument takes this cyclic cubic induction (cuspidal π¹ with π¹_v=π(σ_v) for almost all v) from JPSS [16].

**Implementation status:** `unchecked`.

### GL₃ analytic recognition for the Artin bridge

**Declaration:** `TauCeti.GL2Transfer.gl3_recognition`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition`.

Let F be a number field. (i) GL₃ converse theorem (Jacquet–Piatetski-Shapiro–Shalika; Cogdell Theorem 3.3 with n=3, twists of rank n−2=1): let Π=⊗Π_v be an irreducible admissible representation of GL₃(A_F) whose central character is an idele class character and whose Euler product converges in a right half-plane. If for every idele class character χ the functions L(s,Π⊗χ) and L(s,Π̃⊗χ^{-1}) extend to entire functions bounded in vertical strips and satisfy L(s,Π⊗χ)=ε(s,Π⊗χ)L(1−s,Π̃⊗χ^{-1}), then Π is cuspidal automorphic. If this is required only for χ unramified at a finite set S of finite places, Π agrees outside that set with an automorphic representation. (ii) Jacquet–Shalika pole criterion: if π¹,π² are unitary cuspidal automorphic representations of GL₃(A_F) with L(s,π²_v×π̃¹_v)=L(s,π¹_v×π̃¹_v) for almost all v, then π²≅π¹, because L^S(s,π¹×π̃¹) has a pole at s=1 and L^S(s,π²×π̃¹) has one only if π²≅π¹. These inputs recognise the adjoint lift (via (i)) and identify it with the cyclic cubic induction of Ad(ρ) in Langlands's tetrahedral argument (via (ii)). In that application both representations are cuspidal, so no GL₃ isobaric strong multiplicity one is used. GL₂ strong multiplicity one and an untwisted L-function alone do not supply these results. The generic converse input is AL.3/gln-converse-reduced-rank at n=3; the pole criterion is AL.3/rs-global-poles. The highly ramified T-twist variant is still a separate proof-source gap. R16.5 uses AL.3/gln-converse-full-rank at n=2 with its own checked hypotheses, not this GL₃ statement.

**Hypotheses.**

- F is a number field.
- (i): Π is an irreducible admissible representation of GL₃(A_F) with automorphic central character and an Euler product absolutely convergent in a right half-plane.
- (i): for every idele class character χ (or every χ unramified at a fixed finite set S), L(s,Π⊗χ) and L(s,Π̃⊗χ^{-1}) are entire, bounded in vertical strips, and satisfy L(s,Π⊗χ)=ε(s,Π⊗χ)L(1−s,Π̃⊗χ^{-1}).
- (ii): π¹,π² are unitary cuspidal automorphic representations of GL₃(A_F) whose Rankin–Selberg local factors against π̃¹ agree at almost all places.

**Construction or proof.**

1. Import AL.3/gln-converse-reduced-rank at n=3 and AL.3/rs-global-poles. This node compares their GL₃ applications; it does not prove generic converse theory again. The highly ramified T-twist variant remains an acquisition gap.
2. For the partial Rankin–Selberg pole comparison, use the unitary local convergence bounds at every omitted finite and archimedean place: those local factors are nonzero and finite at s=1. Only then does the completed pole criterion imply the partial one. This is the finite-product argument of Cogdell, Theorem 9.3, pp.74–75.
3. Route the GL₃ converse theorem (JPSS 1979 (13.6); Cogdell Theorem 3.3) and the Jacquet–Shalika Rankin–Selberg pole and nonvanishing results to the single AL extension after AL.3. These generic proofs stay in the recorded gap until that supplier is written.
4. In the tetrahedral application, take π¹ to be the cubic induction of the V₄ character (cubic-character-induction) and π² to be Ad(π_ps(ρ)) (adjoint-lift). At places inert in E the Rankin–Selberg factors agree because both depend only on cubes of Satake classes (Langlands (3.1)–(3.2)), so (ii) gives π¹≅π² without comparing the Satake classes themselves.

**Direct prerequisites.** `AutomorphicLFunctionsAndLocalFactors:AL.3/gln-converse-reduced-rank`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`, `AutomorphicLFunctionsAndLocalFactors:AL.2/jacquet-shalika-satake-bound`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-convergence`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Meromorphic continuation with an unchecked pole does not meet an entire converse hypothesis.
- At a place inert in the cyclic cubic field only the cubes of the two GL₃ Satake classes are known to agree; (ii) consumes equality of the Rankin–Selberg factors there, not of the Satake classes.

**Sources.**

- [James W. Cogdell, Piatetski-Shapiro’s work on converse theorems](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf), §3, sentence before Theorem 3.3 and Theorem 3.3, p. 9. Exact for (i) with n=3: twists by GL₁ cuspidal representations (idele class characters) suffice; 'nice' means entire, bounded in vertical strips, with functional equation (pp. 5–6). This is a survey statement; the proof is JPSS 1979 (13.6), not reproduced.
- [James W. Cogdell, Piatetski-Shapiro’s work on converse theorems](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf), §3, applications (iv)–(v), p. 10. Consumer statement: the converse theorem with twists of rank n−2 is the input for monomial GL₃ representations and JPSS non-normal cubic base change, used by Langlands and Tunnell, and for the Gelbart–Jacquet lift (item (v)).
- [Stephen Gelbart and Hervé Jacquet, A relation between automorphic representations of GL(2) and GL(3)](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf), Introduction, printed p. 473 (PDF p. 4); §9.2, printed pp. 532–534. Consumer statement: GJ78 use the converse theorem in the JPSS form of §9.2 (functional equation only for twists highly ramified at a finite set T), followed by the case analysis 9.2(i)–(v).
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3(i), DMA text p. 18 (PDF p. 21), with (3.1)–(3.2). Exact for (ii): Langlands checks L(s,π¹_v×π̃¹_v)=L(s,π²_v×π̃¹_v) for almost all v and concludes π¹≅π² by the Jacquet–Shalika criterion ([15], C. R. 284 (1977)). Superscripts are flattened in the text layer.
- [James W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf), Lecture 9 §7, Theorem 9.3 proof, printed pp.74–75 (PDF pp.78–79). Omitted unitary finite and archimedean local Rankin–Selberg factors must be nonzero and finite at 1 to transfer the completed pole criterion to L^S.

**Implementation status:** `unchecked`.

### Non-normal cubic base change

**Declaration:** `TauCeti.GL2Transfer.cubicBaseChange`; construction; node `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`.

Let K/F be a separable non-Galois cubic extension of number fields, with S₃ normal closure. The Jacquet–Piatetski-Shapiro–Shalika cubic transfer associates to a cuspidal GL₂ automorphic π over F an automorphic GL₂ representation BC_{K/F}(π) over K, taken isobaric, whose Satake class at almost every w|v is A_v^{f(w/v)}. In Tunnell's statement of [JPSS], Π_w=π(Res ρ_v) whenever π_v=π(ρ_v), for almost all v. For an isobaric π=π(μ,ν) the transfer is π(μ∘N_{K/F},ν∘N_{K/F}). This stage constructs only this weak transfer. Carayol §12.2.1 also records local lifts for extensions of degree at most three (for non-Galois cubic extensions defined by L- and ε-factors) and states that the global lift has these local lifts as components at every place. That all-place statement, which Carayol's extraordinary comparison (AutomorphicGaloisRepresentations R19.2/carayol-cubic-base-change-of-extraordinary) needs, together with the correspondence of the local lift of a principal series, special or ordinary cuspidal π_v with the restriction of its Weil–Deligne parameter (asserted by Carayol §12.2.2 without reference), is an explicit source-proof gap and not part of these construction steps. The transfer respects twists via the norm and preserves the central character by norm pullback. A cuspidal input can cease to be cuspidal; for the primitive tetrahedral/octahedral dyadic parameters of Carayol §12.2.2, the restricted local parameter is irreducible. The original JPSS note and its GL₃/GL₂×GL₃ proof have not been obtained: the theorem rests on Tunnell's and Carayol's consumer statements.

**Hypotheses.**

- K/F is a separable cubic extension of number fields that is not Galois (normal closure with group S₃); the source theorem also covers Galois K/F.
- The input π is a cuspidal automorphic representation of GL₂(A_F) (both sources). The isobaric input π(μ,ν) is handled by composing the characters with N_{K/F}.
- Compatibility is asserted only at almost all places (unramified v with π_v=π(ρ_v)); the output is determined up to isomorphism among isobaric representations.
- Unitary normalisation; A_v is the Satake class of π_v and the output class at w|v is A_v^{f(w/v)}.

**Construction or proof.**

1. Use the JPSS construction through automorphic forms on GL(3) and GL(2)×GL(3) (Tunnell p. 173), not a fictitious cyclic tower from F to K. Its details are in the unread CRAS note and remain a source gap.
2. Identify good-place powers: for unramified π_v=π(ρ_v) and w|v, Res ρ_v has Frobenius ρ_v(Frob_v)^{f(w/v)}. Use isobaric strong multiplicity one over K (R16.4) to fix the global candidate and to derive the twist and central-character identities.
3. These steps establish only weak transfer. The all-place compatibility with the JPSS local lift (Carayol §12.2.1(a)–(b)) awaits the original JPSS source or a supplier proof (for example Mao–Rallis, Canad. J. Math. 52 (2000), relative trace formula). Carayol's extraordinary local comparison, owned by AutomorphicGaloisRepresentations R19.2, consumes that all-place statement.

**Consumers determining the API.**

- Tunnell’s octahedral argument, cited in Carayol §12.2: Restrict an S₄ projective Artin representation to the index-three Sylow-2 preimage field.
- Carayol Proposition 12.2.2; AutomorphicGaloisRepresentations R19.2, R19.4–R19.5: Resolve extraordinary dyadic local parameters by a cubic extension, then compare restrictions and determinants.

**API.**

- `TauCeti.GL2Transfer.cubicBaseChange_unramified` (simp): At unramified w|v the output Satake class is the f(w/v)-power of the input class.
- `TauCeti.GL2Transfer.cubicBaseChange_twist` (functoriality): BC_{K/F}(π⊗χ)=BC_{K/F}(π)⊗(χ∘N_{K/F}).
- `TauCeti.GL2Transfer.cubicBaseChange_central` (projection): The central character is ω_π∘N_{K/F}.
- `TauCeti.GL2Transfer.cubicBaseChange_unique` (characterisation): The isobaric global output is uniquely determined by its almost-everywhere local Satake powers.

**Unit tests.**

- `TauCeti.GL2Transfer.cubic_split_test` (compatibility): At a completely split place the three outputs are all the original Satake class A.
- `TauCeti.GL2Transfer.cubic_one_two_test` (computation): For splitting type (1,2) and A=diag(2,3), the two outputs are diag(2,3) and diag(4,9).
- `TauCeti.GL2Transfer.cubic_inert_test` (computation): For residue degree three and A=diag(2,3), the output is diag(8,27).
- `TauCeti.GL2Transfer.cubic_not_three_test` (non-example): At splitting type (1,2), replacing every output by A³ gives the wrong local components.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`, `GL2AutomorphicRepresentationsAndTransfer:R16.5`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- A nonnormal cubic field has no degree-three cyclic intermediate extension from F.
- For a place of splitting type (1,2), the two output local Satake classes are A and A².

**Sources.**

- [Jerrold Tunnell, Artin's conjecture for representations of octahedral type](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf), Theorem [4] (Tunnell's statement of JPSS), printed p. 173. Exact for the weak theorem: K/F cubic, not necessarily Galois; cuspidal π; automorphic Π with Π_w=π(Res ρ_v) whenever π_v=π(ρ_v), at almost all places. OCR: n/TT=π, U=Π, GL(29 AF)=GL(2,A_F). The node adds only the elementary isobaric extension.
- [Jerrold Tunnell, Artin's conjecture for representations of octahedral type](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf), paragraph after Theorem [4], printed p. 173. Proof only announced: Tunnell gives no proof, only the GL(3) and GL(2)×GL(3) method and the analogy with Jacquet LNM 278 §20.
- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.2.1, printed p. 457 (PDF p. 50). Consumer statement attributing the non-Galois cubic base change to [J.P.S.S.] (C. R. 292 (1981), p. 567).
- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §12.2.1(b), printed p. 457 (PDF p. 50). Stronger consumer statement: for extensions of degree at most three, the global lift has the local lift (defined for non-Galois cubic extensions by L- and ε-factors) as component at every w|v. OCR: n/n^=π or Π components, GL^ (AJ=GL₂(A_L). Carayol gives no proof; the node keeps only the weak part and records the all-place part as a gap.

**Atlas planet:** Non-normal cubic base change.

**Implementation status:** `unchecked`.

Layer status: **planned**. Every current stage target has a precise declaration node and its prerequisite chains end in a read baseline/supplier, an explicit request, or a named gap. The target-level pass is complete; the stage is not closed.

Closure work:

- Decompose prime-cyclic transfer/descent and tower-independence below target level once R17.2 and ET.4/ET.4b exist; cyclic base change and AC89 Chapter 3 automorphic induction import the proposed ET.4b (RT-AREA-langlands-1/1) when it is live.
- R17.4a (adjoint-lift, cubic-character-induction, gl3-recognition, nonnormal-cubic-base-change) awaits the restructure; its inputs are AL.3, AL.3b and MetaplecticAutomorphicForms MP.5 (Gelbart–Jacquet's Shimura integral, GJ78 §§5–8 and Theorem 8.1).
- Obtain JPSS (C. R. Acad. Sci. 292 (1981)) and plan the non-Galois cubic local compatibility (principal series, special, ordinary cuspidal) that AutomorphicGaloisRepresentations requests for R19.2.
- Restore TauCeti.GL2Transfer.gl3_recognition once AL supplies the global admissible/cuspidal GL₃ representation, completed twist, ε and Rankin–Selberg pole carriers (gap "GL₃ recognition suggested signature").

## R17.5 — Langlands–Tunnell and weight one

Quadratic induction supplies the dihedral case. The tetrahedral case compares cuspidal GL₃ Rankin–Selberg factors and their pole, while the octahedral case uses the nonnormal cubic bridge. Arithmetic projective lifting, prescribed local induction, classical weight one and residual applications are separate targets with their own hypotheses.

### Quadratic automorphic induction

**Declaration:** `TauCeti.GL2Transfer.quadraticInduction`; construction; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`.

Let K/F be a quadratic extension of number fields, σ its nontrivial automorphism and θ a Hecke character of K. Quadratic automorphic induction AI_{K/F}(θ) is an isobaric GL₂ automorphic representation with local parameter Ind_{W_{K_w}}^{W_{F_v}}(θ_w), interpreted as the direct sum over w|v at a split place. It is cuspidal exactly when θ≠θ^σ. Its central character is η_{K/F}·θ|_{A_F×}, and L_F(s,AI θ)=L_K(s,θ). Its quadratic base change is θ⊞θ^σ. It commutes with twisting by χ of F using θ·(χ∘N_{K/F}); if θ=χ∘N, it is χ⊞χη, not cuspidal. The finite-group induction carrier and Mackey formulas are imported, not defined here.

**Hypotheses.**

- K/F is a separable quadratic extension of number fields (JL70 allows global fields), σ its nontrivial automorphism and η=η_{K/F}.
- θ is a Hecke character (quasi-character of A_K^×/K^×).
- Cuspidal branch: θ≠θ^σ, equivalently θ does not factor through N_{K/F} (class field theory).
- Unitary normalisation: at inert or ramified v the local component is π(Ind θ_w); at split v it is π(θ_w,θ_{w′}).

**Construction or proof.**

1. For θ not factoring through the norm, apply Jacquet–Langlands Proposition 12.1: L(s,ω⊗Ind θ)=L_K(s,θ·(ω∘N_{K/F})) and its dual are entire and bounded in vertical strips for every ω, so the GL₂ converse theorem (JL70 Theorem 11.3, R16.5) gives the cuspidal ⊗_vπ(σ_v).
2. For θ=χ∘N_{K/F}, Ind θ=χ⊕χη and the output is the isobaric π(χ,χη). θ=θ^σ exactly when θ factors through the norm (class field theory).
3. Compare determinants of induced local parameters for the central character η_{K/F}·θ|_{A_F^×}. The split-place direct-sum formula and the conjugation orbit give BC_{K/F}(AI θ)=θ⊞θ^σ (Langlands §2 property (e)).
4. Arthur–Clozel Chapter 3 Theorem 6.2 with n=1 and ℓ=2 gives the same result almost everywhere and may replace step 1 for existence.

**Consumers determining the API.**

- Langlands §3; R17.5 dihedral case; Rohrlich–Tunnell §2; Wiese Lemmas 2–3: Automorphy of finite dihedral Artin parameters, including the auxiliary odd characteristic-zero lifts of mod-two representations.

**API.**

- `TauCeti.GL2Transfer.quadraticInduction_local` (compatibility): Local LLC of AI θ is local induction of θ, with a direct sum at a split place.
- `TauCeti.GL2Transfer.quadraticInduction_central` (projection): ω(AI θ)=η_{K/F}·θ|_{A_F×}.
- `TauCeti.GL2Transfer.quadraticInduction_baseChange` (characterisation): BC_{K/F}(AI θ)=θ⊞θ^σ.
- `TauCeti.GL2Transfer.quadraticInduction_twist` (functoriality): AI(θ·χ∘N)=AI(θ)⊗χ.
- `TauCeti.GL2Transfer.quadraticInduction_cuspidal` (characterisation): AI θ is cuspidal if and only if θ≠θ^σ.

**Unit tests.**

- `TauCeti.GL2Transfer.induction_invariant_test` (degenerate): θ=χ∘N has output χ⊞χη and is not cuspidal.
- `TauCeti.GL2Transfer.induction_split_test` (compatibility): At v split as w,w′ the local parameter is θ_w⊕θ_w′.
- `TauCeti.GL2Transfer.induction_determinant_test` (computation): For a coset element with induced matrix [[0,a],[b,0]], its determinant is −ab, accounting for the quadratic character.
- `TauCeti.GL2Transfer.induction_noninvariant_test` (non-example): When θ≠θ^σ, replacing AI θ by two F-characters contradicts cuspidality.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `GL2AutomorphicRepresentationsAndTransfer:R16.5`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `tauceti:TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- An invariant character gives χ⊞χη; a non-invariant character gives a cuspidal representation.
- At a split place the two local characters, rather than an irreducible local induction, are the output.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §12, Proposition 12.1, printed p. 206 (PDF p. 212 of the IAS scan). Exact for the cuspidal branch at every place: if χ does not factor through N_{K/F}, ⊗_vπ(σ_v) is cuspidal (A₀ = cusp forms; 'v' is the subscript of the lost ⊗). Proof by the GL₂ converse theorem (Theorem 11.3) with L(s,ω⊗σ)=L(s,ω_{K/F}χ).
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §12, paragraph before Proposition 12.1, printed p. 206. Exact for the local parameter: the Weil-representation constituent π(χ) is π(Ind χ) in the §12 sense (twisted L- and ε-factors, central character det σ); at split v, σ_v is a sum of two characters.
- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 §6, Theorem 6.2, printed p. 215; Lemmas 6.3–6.4 and Corollary 6.5, printed pp. 217–218. Alternative source, specialisation n=1, ℓ=2: existence and the orbit criterion, but only almost everywhere (Definition 6.1) and via GL(2) cyclic base change. OCR '1'=ℓ.

**Atlas planet:** Quadratic automorphic induction.

**Implementation status:** `unchecked`.

### Dihedral Artin automorphy

**Declaration:** `TauCeti.GL2Transfer.dihedral_artin`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`.

Let ρ:G_F→GL₂(C) be continuous, irreducible and finite-image, with dihedral projective image. The imported classification gives a quadratic K/F and a finite-order character θ of G_K with ρ≅Ind_{G_K}^{G_F} θ. Reciprocity identifies θ with a finite-order Hecke character, and quadraticInduction(θ) is the unique cuspidal GL₂ automorphic representation whose normalized local parameter is ρ|_{W_{F_v}} at every place. Over totally real F, total oddness makes the infinite components the holomorphic parallel-weight-one parameters; this archimedean consequence is separate from finite-place automorphy.

**Hypotheses.**

- F is a number field.
- ρ:G_F→GL₂(C) is continuous, irreducible and has finite image.
- The projective image is dihedral D_n with n≥2 (including V₄), so ρ≅Ind_{G_K}^{G_F}θ for a quadratic K/F and a finite-order character θ≠θ^σ of G_K.
- Local parameters are normalised (unitary); holomorphic weight one needs F totally real and ρ totally odd.

**Construction or proof.**

1. Use the finite-image induction criterion from R01.4 and the imported Mackey/Clifford theory.
2. Apply finite-order reciprocity and quadratic automorphic induction.
3. Local induction commutes with the reciprocity dictionary; use strong multiplicity one for uniqueness.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- A reducible induction of an invariant character is excluded by irreducibility.
- Oddness is needed for holomorphic weight one, not for the all-number-field automorphic assertion.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §12, Proposition 12.1, printed p. 206 (PDF p. 212). Exact at every place once ρ=Ind θ with θ a finite-order character that does not factor through the norm (equivalently ρ irreducible). 'v' is the subscript of the lost ⊗; A₀ denotes cusp forms.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), Introduction, DMA text p. 4 (PDF p. 7). Consumer statement for the dihedral case. Langlands §3 itself (DMA p. 16) only assumes ρ 'neither reducible nor dihedral'.

**Implementation status:** `unchecked`.

### Extension of finite-order idele-torsion characters

**Declaration:** `TauCeti.GL2Transfer.finite_hecke_extension`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-hecke-extension`.

Let F be a number field, n≥1, and ω:μ_n(F)\μ_n(A_F)→S¹ a continuous character, where μ_n(F)\μ_n(A_F) is viewed inside the idele class group C_F. Then ω extends to a finite-order continuous character of C_F if and only if its component ω_v on μ_n(F_v) is trivial at every complex place v; real places impose no condition. In particular the obstruction vanishes when F has no complex place, e.g. for totally real F. Extensions are not unique. In the Grunwald–Wang special case the cokernel of μ_n(F)\μ_n(A_F)→C_F[n] has order two, so one first chooses one of two extensions of ω to C_F[n]; either choice admits a finite-order extension when the condition holds, and the case affects only uniqueness. This is an arithmetic extension theorem on the canonical GlobalNumberFields Hecke-character carrier, not a new character group.

**Hypotheses.**

- F is a number field and n ≥ 1; C_F = F^×\A_F^× is the idele class group, into which μ_n(F)\μ_n(A_F) embeds as a closed subgroup.
- ω: μ_n(F)\μ_n(A_F) → S¹ is a continuous character (automatically of order dividing n).
- An extension means a continuous character ω̃: C_F → S¹ restricting to ω; finite order means ω̃ has finite image.
- The criterion concerns only the complex places: ω_v = ω|μ_n(F_v) must be trivial for every complex v; no condition is imposed at real places.

**Construction or proof.**

1. Necessity: a continuous finite-order character of C_F has open kernel, so it is trivial on the identity component D_F; the image of the connected group F_v^×≅C^× at a complex place lies in D_F, so the extension, and hence ω_v, is trivial on μ_n(C).
2. Sufficiency, following Patrikis Lemma 2.3.6: extend ω to the closed subgroup C_F[n] (one of two choices in the Grunwald–Wang special case), then by Pontryagin duality to a continuous character ω̃ of C_F; its archimedean component has the form ∏_v (x_v/|x_v|)^{m_v}|x_v|^{it_v}, and the hypothesis gives m_v≡0 mod n at every complex v.
3. By Weil's criterion for Hecke characters with prescribed archimedean component (Patrikis Lemma 2.3.1), choose a Hecke character ψ with ψ^n equal to ω̃ on the identity component of F_∞^×. Then ω̃ψ^{−n} still extends ω, since ψ^n is trivial on C_F[n]. It is trivial on that identity component and, by continuity, on an open subgroup of the finite unit ideles, so it factors through a ray class group and has finite order.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Over a totally real field the complex-place obstruction is vacuous.
- A nontrivial character on a connected complex-place component cannot have a finite-order extension.
- Real places impose no condition: for F=Q and n=2, the character of μ_2(Q)\μ_2(A_Q) that is nontrivial exactly at ∞ and at 2 is the restriction of the quadratic Hecke character of Q(i)/Q.

**Sources.**

- [Stefan Patrikis, Variations on a theorem of Tate](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf), §2.3, Lemma 2.3.6, first bullet, printed p. 30 (PDF p. 34). Exact for the finite-order clause: Patrikis writes ω_∞ = ∏ι_v(x_v)^{m_v} with m_v ∈ Z/nZ, and m_v = 0 at a complex v means ω_v is trivial on μ_n(C). The node omits his type A clauses. His proof gives only sufficiency ('a simple variant'); necessity is the node's identity-component step.
- [Stefan Patrikis, Variations on a theorem of Tate](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf), proof of Lemma 2.3.6, printed pp. 30–31 (PDF pp. 34–35). Proof step: in the Grunwald–Wang special case one first chooses one of two extensions ω_0 to C_F[n]; the existence argument works for either choice (second bullet: the case only affects uniqueness). The old node wording 'one with the required finite-order property' is corrected.

**Implementation status:** `unchecked`.

### Tate’s arithmetic obstruction vanishing

**Declaration:** `TauCeti.GL2Transfer.tate_vanishing`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing`.

For any number field F, H²_cont(G_F,Q/Z)=0, where Q/Z is discrete with trivial G_F-action. Consequently a continuous finite-image projective representation over C has zero obstruction after enlarging its finite root-of-unity coefficient group. This does not assert H²(G_F,μ_n)=0 for fixed n, nor use Q/Z with cyclotomic action. Continuous cochains and connecting maps are supplied by ProfiniteCohomology; the arithmetic vanishing is proved here.

**Hypotheses.**

- F is a number field and G_F its absolute Galois group with the Krull topology.
- Q/Z is a discrete G_F-module with trivial action; cohomology is continuous cochain cohomology.
- The consequence for projective representations concerns continuous finite-image homomorphisms G_F→PGL_n(C) and uses obstruction classes with trivial μ_m coefficients.

**Construction or proof.**

1. Reduce to H²(G_F,Q_p/Z_p)=0 for each prime p, using Q/Z=⊕_p Q_p/Z_p and compatibility of continuous cohomology with this sum; by restriction–corestriction along F(μ_p)/F, of degree prime to p, assume μ_p⊂F (Patrikis Theorem 2.1.1).
2. H²(G_F,Q_p/Z_p) is p-primary, so it suffices that the connecting map δ:H¹(G_F,Q_p/Z_p)→H²(G_F,Z/p)≅Br(F)[p] is surjective; the identification uses μ_p⊂F and Hilbert 90.
3. Locally, via local reciprocity, a character of F_v^× is a p-th power iff it is trivial on μ_p(F_v), so δ_v(φ_v) depends only on φ_v|μ_p(F_v) and δ_v maps onto Br(F_v)[p]. For a global α∈Br(F)[p] choose φ_v with δ_v(φ_v)=α_v. The restrictions form a character of μ_p(F)\μ_p(A_F), since α is global and its invariants sum to zero, and it is trivial at complex places.
4. Extend that character to a finite-order Hecke character by finite-hecke-extension, read it as an element of H¹(G_F,Q/Z) by global reciprocity and project to Q_p/Z_p; its image under δ has local components α_v, hence equals α because Br(F)→⊕_v Br(F_v) is injective.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-hecke-extension`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- A nonzero fixed-coefficient H² class may become zero only after increasing the root-of-unity group.
- The theorem does not imply the vanishing of the Brauer group of F.
- With the cyclotomic action the analogous group H²(G_F,Q/Z(1)) is Br(F)≠0, so the trivial-action hypothesis cannot be dropped.

**Sources.**

- [Stefan Patrikis, Variations on a theorem of Tate](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf), §2.1, Theorem 2.1.1 and first line of proof, printed p. 17 (PDF p. 21). Exact statement; Q/Z has trivial action and continuous cohomology of Γ_F is meant. Patrikis gives Tate's classical proof in a variant routed through his Lemma 2.3.6, as in the node.
- [Stefan Patrikis, Variations on a theorem of Tate](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf), proof of Theorem 2.1.1, printed p. 18 (PDF p. 22). Proof step: the local choices for a global p-torsion Brauer class give a character of μ_p(F)\μ_p(A_F), trivial at complex places, extended by finite-hecke-extension.
- [Stefan Patrikis, Variations on a theorem of Tate](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf), §2.1, proof of Proposition 2.1.4, printed p. 19 (PDF p. 23). Supports the 'consequently' sentence: obstruction classes with trivial μ_n coefficients die in the colimit H²(Γ_F,Q/Z)=0, so they vanish after enlarging n; the lifting itself is finite-projective-lift.

**Atlas planet:** Tate’s vanishing theorem.

**Implementation status:** `unchecked`.

### Continuous finite-image arithmetic projective lifting

**Declaration:** `TauCeti.GL2Transfer.finite_projective_lift`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-projective-lift`.

Let F be a number field and r:G_F→PGL₂(C) a continuous finite-image homomorphism. There exist a continuous finite-image ρ:G_F→GL₂(C) and an identification of its projectivization with r. Choose representatives in SL₂(C) of the finite projective image, so the factor set takes values in μ₂. By tate-vanishing its class dies in H²(G_F,μ_M) for some even M, giving a continuous cochain with values in the finite group μ_M. Correcting the representatives by this cochain gives a homomorphism whose image lies in μ_M times the preimage in SL₂(C) of r(G_F), a finite group; continuity holds because both factors are locally constant. Any two continuous finite-image lifts of the same identified projective homomorphism differ by a continuous finite-order scalar character. At a real place where r(c) is a nontrivial involution, every linear lift is odd (eigenvalues +1,−1); trivial projective r(c) cannot give an odd two-dimensional lift. No determinant-one or prescribed residual reduction is asserted.

**Hypotheses.**

- F is a number field and r: G_F→PGL₂(C) is a continuous homomorphism with finite image (equivalently with open kernel).
- The lift is a continuous homomorphism ρ: G_F→GL₂(C) with finite image whose composite with GL₂(C)→PGL₂(C) is r.
- For the archimedean clause: v is a real place, c_v∈G_F a complex conjugation at v, and r(c_v)≠1.

**Construction or proof.**

1. Apply the imported factor-set interface and pinned zero-class lifting theorem after tate-vanishing; do not redefine projective representations.
2. Prove continuity and finite image from the trivializing cochain, which takes values in a finite group μ_M of roots of unity and is continuous; the algebraic library theorem alone supplies neither property. This is the specialisation to GL₂→PGL₂ of Patrikis Proposition 2.1.4 (lift to μ_n·SL₂ for large n).
3. Scalar ratios are multiplicative; their continuity and finite image give the finite-order twist ambiguity.
4. At c²=1: ρ(c)²=1, so ρ(c) is diagonalizable with eigenvalues ±1. It is scalar exactly when r(c)=1, so a nontrivial r(c) forces eigenvalues +1 and −1 and det ρ(c)=−1.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`, `tauceti:TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero`, `mathlib:Matrix.ProjGenLinGroup`, `mathlib:Matrix.ProjGenLinGroup.mk`, `ArithmeticGaloisRepresentations:R01.1`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Enlarging the scalar root-of-unity group is allowed; insisting on μ_n may leave an obstruction.
- This lifting theorem alone does not prove that a prescribed mod-p representation is the reduction of the lift.

**Sources.**

- [Stefan Patrikis, Variations on a theorem of Tate](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf), §2.1, Proposition 2.1.4, printed p. 19 (PDF p. 23). Specialisation: Patrikis (after Conrad, Prop. 5.3) lifts continuous ρ:Γ_F→H(Q̄_ℓ) through H̃→H with central torus kernel (OCR 'Q`' is Q̄_ℓ). The node takes GL₂→PGL₂ (kernel G_m) and finite-image r over C, where the same argument applies after viewing the finite image over Q̄.
- [Stefan Patrikis, Variations on a theorem of Tate](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf), proof of Proposition 2.1.4, printed p. 19 (PDF p. 23). Proof step: for GL₂ the isogeny complement is SL₂ and H̃_n=μ_n·SL₂; Tate's theorem kills c_n for large n. The kernel μ_n of H̃_n→PGL₂ is finite, which gives the finite image of the lift.
- [Stefan Patrikis, Variations on a theorem of Tate](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf), Remark 2.1.5, printed p. 19 (PDF p. 23). Supports the finite-order determinant (hence finite image) and, with the first bullet, the need to enlarge coefficients. The twist ambiguity and the archimedean oddness clause are routine and not stated in the source.

**Implementation status:** `unchecked`.

### Tetrahedral Artin automorphy

**Declaration:** `TauCeti.GL2Transfer.tetrahedral_artin`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`.

Let F be a number field and ρ:G_F→GL₂(C) be continuous finite-image irreducible with projective image A₄. There is a unique cuspidal GL₂ automorphic representation π with normalized all-place local parameters ρ. Over the cyclic cubic field E fixed by the preimage of the normal V₄, the restriction P is dihedral and therefore automorphic. Its automorphic representation is Galois-stable, and cyclic descent gives a finite twist fiber over F. Matching the determinant removes the cubic twist ambiguity, giving π_ps(ρ). The adjoint Ad(π_ps) is cuspidal because π_ps has no self-twist, and it is identified with the cyclic cubic induction of the V₄ character θ (Ad ρ=Ind θ) by the Jacquet–Shalika Rankin–Selberg pole criterion. At places inert in E this leaves A(π_v)=diag(ξa,ξ²b) with ξ³=1, and ξ≠1 would give an element of order 6 in A₄. Langlands proves π_v=π(ρ_v) for almost all v (Theorem 3.3 records the consequence that L(s,ρ) is entire); the all-place statement uses his equivalence of the two definitions of π(ρ), whose proof he only sketches. The GL₃ inputs are recorded in the GL₃ supplier gap.

**Hypotheses.**

- F is a number field.
- ρ:G_F→GL₂(C) is continuous, irreducible and has finite image with projective image A₄ (Langlands allows any Weil-group representation of tetrahedral type).
- E/F is the cyclic cubic extension cut out by the preimage of V₄, P=ρ|_{W_E}, and θ is the character of the Galois group over E with Ad ρ=Ind θ.
- Normalisation: π_ps(ρ) is chosen with ω_π=det ρ; local parameters are in the unitary normalisation.

**Construction or proof.**

1. Apply the imported A₄/V₄ classification to construct the cyclic cubic extension and the dihedral restriction.
2. Descend its quadratic induction using cyclic descent and its precise twist fiber; choose the descent with ω_π=det ρ.
3. Show that π_ps has no nontrivial self-twist: a quadratic self-twist would give a Gal(E/F)-invariant quadratic self-twist of π(P), but the three self-twists of P are permuted cyclically. Hence Ad(π_ps) is cuspidal (adjoint-lift). Compare it with the cubic induction of θ by gl3-recognition (ii); the Rankin–Selberg factors agree at all good places, including those inert in E.
4. With equal determinants, A(π_v)=diag(ξa,ξ²b) at places inert in E. Equality of adjoints forces ξ=1 or a=±ξ²b, and the minus sign with ξ≠1 gives an element of order 6 in the projective image, which A₄ does not contain.
5. Get uniqueness from isobaric strong multiplicity one (Langlands Lemma 3.1, R16.4). Pass from almost-everywhere equality to all places with the supplied LLC interfaces, the Artin L-function functional equation and the Jacquet–Langlands §12 method (Langlands §3, pp. 15–16, proof only sketched). Record this normalization, not just equality at good primes.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition`, `ArithmeticGaloisRepresentations:R01.4`, `GL2AutomorphicRepresentationsAndTransfer:R16.5`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For order-three η, equality of determinants of π and π⊗η^i forces η^{2i}=1 and hence i=0.
- Without the GL₃ analytic comparison, the existence of some cyclic descent does not identify the desired Artin parameter.

**Sources.**

- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3(i), Theorem 3.3, DMA text p. 19 (PDF p. 22). Specialisation: stated for any number field and any two-dimensional Weil-group representation of tetrahedral type. The theorem records only entireness of L(s,ρ); the proof shows π_ps(ρ)=π(ρ) at almost all places.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3(i), DMA text pp. 16–17 (PDF pp. 19–20). Exact for the determinant normalisation that fixes the cyclic descent π_ps(ρ) among its cubic twists.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3(i), DMA text p. 18 (PDF p. 21). Proof step: π¹ (Piatetski-Shapiro's cubic induction of σ=Ad ρ=Ind θ) and π² (Gelbart–Jacquet lift of π_ps) are identified by the Jacquet–Shalika criterion; no GL₃ strong multiplicity one is used.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3(i), DMA text p. 19 (PDF p. 22). Exact for the final Frobenius comparison at places not split in E.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3 opening, DMA text p. 15 (PDF p. 18). All-place clause: Langlands asserts that the almost-everywhere and the all-place (JL70 §12) definitions of π(ρ) are equivalent, using results communicated by Callahan and Lemma 3.2, whose proof is not given. This is the only read support for the all-place clause.

**Atlas planet:** Tetrahedral Artin automorphy.

**Implementation status:** `unchecked`.

### Octahedral Artin automorphy

**Declaration:** `TauCeti.GL2Transfer.octahedral_artin`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`.

For a number field F and a continuous irreducible finite-image ρ:G_F→GL₂(C) with projective image S₄, there is a unique cuspidal automorphic π with π_v≅π(ρ_v) for almost all v (Tunnell). By the same all-place upgrade as in the tetrahedral case, π has normalized local parameter ρ|_{W_{F_v}} at every place. Let E/F be the quadratic field cut out by the preimage of A₄, K/F the non-Galois cubic field cut out by the preimage of a Sylow-2 subgroup, and M=EK. The tetrahedral theorem over E gives π(ρ_E), which is the base change of exactly two cuspidal π₁ and π₂=π₁⊗ω_{E/F}. These have the same central character, so determinant matching cannot choose between them. Tunnell's lemma: exactly one i has BC_{K/F}(π_i)≅π(ρ_K), where ρ_K is monomial. Both BC_{K/F}(π_i) base change to π(ρ_M); they differ by ω_{M/K}=ω_{E/F}∘N_{K/F} and are distinct because ρ_M is irreducible, so they are the two quadratic descents of π(ρ_M), one of which is π(ρ_K). For this π, a place w|v of K with [K_w:F_v]∈{1,3} shows that the Satake class of π_v is that of ρ_v: the only alternative gives an element of order 6 in S₄. GL₃ and GL₂×GL₃ theory enters only through the JPSS cubic transfer, which Tunnell quotes without proof. Langlands's earlier octahedral results (Theorems 3.4–3.5, over Q with conditions on complex conjugation) are not substituted for Tunnell's theorem.

**Hypotheses.**

- F is a number field.
- ρ:G_F→GL₂(C) is continuous, irreducible and has finite image with projective image S₄.
- E/F is the quadratic extension cut out by the preimage of A₄, K/F the non-Galois cubic extension cut out by the preimage of a Sylow-2 subgroup (dihedral of order 8), and M=EK.
- Tunnell's conclusion holds almost everywhere (π(ρ) in the JL70 §12 sense at almost all v); the all-place clause needs the separate upgrade.
- Inputs: the tetrahedral theorem over E, quadratic descent and its fibers, the dihedral theorem over K and M, and the weak JPSS cubic transfer.

**Construction or proof.**

1. Use the A₄ normal subgroup: the tetrahedral theorem over E and quadratic cyclic descent give the two candidates π₁ and π₂=π₁⊗ω_{E/F} (Langlands §3(ii)); retain both.
2. Apply the JPSS cubic transfer to π₁ and π₂. By transitivity of base change (almost-everywhere Satake classes and isobaric strong multiplicity one), both BC_{K/F}(π_i) base change over M to π(ρ_M). BC_{K/F}(π₂)≅BC_{K/F}(π₁)⊗ω_{M/K}, and equality would make π(ρ_M) non-cuspidal (quadratic cuspidality criterion), contradicting irreducibility of ρ_M.
3. By the quadratic descent fibers for M/K, BC_{K/F}(π₁) and BC_{K/F}(π₂) are the two descents of π(ρ_M). The dihedral theorem gives π(ρ_K), which is also a descent, so π(ρ_K)=BC_{K/F}(π_i) for a unique i; call this π.
4. Central character: ω_π∘N_{K/F}=det ρ∘N_{K/F} and ω_{E/F}∘N_{K/F}=ω_{M/K}≠1 give ω_π=det ρ. With BC_{E/F}(π)=π(ρ_E) this gives the Satake class diag(a_vω,b_vω), ω²=1, at good v (Tunnell leaves the central-character step implicit).
5. Choose w|v in K with [K_w:F_v]∈{1,3}. Degree 1 gives ω=1 directly. Degree 3 forces ω=1 or a_v=b_vηω with η³=1, and η≠1 with ω=−1 would give an element of order 6 in S₄. Hence π_v≅π(ρ_v) almost everywhere.
6. Use R16.4 uniqueness and the all-place upgrade (as in tetrahedral-artin; Langlands §3, pp. 15–16) in the completed theorem. The JPSS analytic transfer remains a source gap; Tunnell's comparison itself is now read.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R16.5`, `ArithmeticGaloisRepresentations:R01.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For quadratic η, det(π⊗η)=det π, so determinant alone leaves both descents.
- The cubic subgroup is not normal in S₄; prime-cyclic descent cannot replace its transfer.
- Tunnell's choice between π₁ and π₂ uses only almost-everywhere Satake classes and descent fibers; no GL₃ Rankin–Selberg comparison is applied to the two candidates.

**Sources.**

- [Jerrold Tunnell, Artin's conjecture for representations of octahedral type](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf), p. 173, first paragraph. Exact for scope: all octahedral representations over any number field, by Langlands's methods plus the JPSS theorem.
- [Jerrold Tunnell, Artin's conjecture for representations of octahedral type](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf), p. 173, definition of π(ρ). Normalisation: Tunnell's π(ρ) means π_v=π(ρ_v) in the JL70 §12 sense for almost all v only; the node's all-place clause is an added upgrade. OCR: TT/n=π, 7r(p)=π(ρ), irv=π_v.
- [Jerrold Tunnell, Artin's conjecture for representations of octahedral type](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf), Lemma and its proof, p. 174. Exact for the descent comparison (OCR pM=ρ_M). The proof is complete given the JPSS theorem, transitivity of base change, and quadratic descent for M/K.
- [Jerrold Tunnell, Artin's conjecture for representations of octahedral type](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf), Theorem and its proof, pp. 174–175. Exact for the final Satake comparison at a place of K of local degree 1 or 3.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3(ii), DMA text p. 19 (PDF p. 22). Exact for the two quadratic descents π and π′=π⊗ω (the text layer writes 'π 0' for π′).

**Atlas planet:** Octahedral Artin automorphy.

**Implementation status:** `unchecked`.

### Langlands–Tunnell strong Artin theorem

**Declaration:** `TauCeti.GL2Transfer.solvable_artin`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`.

Let F be a number field and ρ:G_F→GL₂(C) be continuous finite-image irreducible with solvable projective image. There is a unique cuspidal GL₂ automorphic representation π such that, in the fixed Artin/LLC normalization, rec_Fv(π_v)≅ρ|_{W_Fv} for every place v. Equivalently (Jacquet–Langlands §12), the L- and ε-factors of all character twists agree at every place, so L(s,π)=L(s,ρ). The finite-image projective classification leaves dihedral, A₄ and S₄; a cyclic projective image would make the representation reducible. Solvability of linear and projective finite images is equivalent because their scalar kernel is abelian. Over totally real F, total oddness gives holomorphic parallel weight one; automorphy itself has no oddness requirement. This is the strong rank-two theorem, not merely holomorphy of the Artin L-function. Rogawski–Tunnell §4 state it as the strong Artin conjecture (cuspidal π(σ) with L(s,π(σ))=L(s,σ)), known for solvable image by Langlands and Tunnell. The published proofs give almost-everywhere equality; the all-place and ε-factor clause rests on Langlands's equivalence of the two definitions of π(ρ) (§3, proof sketched).

**Hypotheses.**

- F is a number field.
- ρ:G_F→GL₂(C) is continuous, irreducible and has finite solvable image, so its projective image is dihedral, A₄ or S₄.
- Unitary normalisation of local parameters; uniqueness is up to isomorphism.
- For the weight-one clause, F is totally real and ρ is totally odd (det ρ(c_v)=−1 at every real place).

**Construction or proof.**

1. Import the finite subgroup classification and apply the dihedral, tetrahedral or octahedral theorem.
2. Upgrade almost-everywhere equality to all places (Langlands §3, pp. 15–16; Jacquet–Langlands §12). Compare the global functional equations of L(s,π⊗ω) and L(s,ρ⊗ω), isolate one bad place by taking ω highly ramified at the others, and use the GL₂ local converse theorem with the LLC characterisation by twisted factors. Archimedean places use Langlands's archimedean analogue.
3. Record uniqueness (strong multiplicity one) in the common normalization. Use the GL₂ dictionary to get weight-one consequences only under the stated infinity condition (Rogawski–Tunnell §4: σ odd implies π(σ) holomorphic of weight one).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R16.5`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `ArithmeticGaloisRepresentations:R01.4`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `tauceti:TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Over Q an odd irreducible S₄ representation gives a holomorphic weight-one newform.
- GL₂(F₉) itself is not a solvable-image hypothesis; the pinned nonsolvability theorem prevents this false shortcut.

**Sources.**

- [Jonathan D. Rogawski and Jerrold B. Tunnell, On Artin L-functions associated to Hilbert modular forms of weight one](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf), §4, proof of Proposition 4.3, printed p. 41. Consumer statement: the strong Artin conjecture, defined on p. 40 as existence of cuspidal π(σ) with L(s,π(σ))=L(s,σ), is known for solvable image by [28] (Langlands 1980) and [32] (Tunnell 1981). RT83 does not mention ε-factors or all-place parameters.
- [Jonathan D. Rogawski and Jerrold B. Tunnell, On Artin L-functions associated to Hilbert modular forms of weight one](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf), §4, printed p. 40. Exact for the weight-one consequence over totally real F: σ odd implies π(σ)∈A₁ (holomorphic weight one). OCR: a=σ, 7i=π, m=in, Л1=A₁, senes=series.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3 opening, DMA text p. 15 (PDF p. 18). All-place and ε-factor clause: Langlands asserts that the two definitions of π(ρ) are equivalent (all places with the JL70 §12 characterisation by twisted L and ε, or isobaric with equality at almost all places); the proof is only sketched (Callahan).
- [Jerrold Tunnell, Artin's conjecture for representations of octahedral type](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf), p. 173, first paragraph. Exact for the octahedral case over every number field (almost everywhere).

**Atlas planet:** Langlands–Tunnell theorem.

**Implementation status:** `unchecked`.

### Odd Artin representations and classical weight one

**Declaration:** `TauCeti.GL2Transfer.q_weight_one`; comparison; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`.

For ρ as in solvable-artin over Q with det ρ(c)=−1, the R16.6 dictionary yields a normalized holomorphic cuspidal weight-one newform f with exact Artin conductor N(ρ), nebentypus det ρ under reciprocity, L(s,f)=L(s,ρ), and, for ℓ∤N(ρ) and arithmetic Frobenius, characteristic polynomial X²−a_ℓ(f)X+det ρ(Frob_ℓ) of ρ(Frob_ℓ). This is the Weil–Langlands theorem (Deligne–Serre Théorème 4.10); its hypothesis that every L(s,ρ⊗χ) is entire follows here from cuspidality of the Langlands–Tunnell representation. Its coefficients lie in a number field. To reduce modulo p choose a place λ above p, an embedding of its residue field into a common algebraic closure, and a stable lattice in a coefficient realization of ρ. Weight one here is not the weight≥2 cohomological construction used in Hilbert varieties.

**Hypotheses.**

- ρ: G_Q→GL₂(C) is continuous, irreducible and of finite image with solvable projective image, so solvable-artin supplies a cuspidal π with π_v matching ρ at every place.
- ρ is odd: det ρ(c)=−1 for complex conjugation c.
- Frobenius normalization is arithmetic (Artin's convention, as in Deligne–Serre), and det ρ is identified with a Dirichlet character by class field theory.
- For reduction: a number field E realizing ρ, a place λ of E above p, an embedding of its residue field into F̄_p, and a G_Q-stable O_{E,λ}-lattice.

**Construction or proof.**

1. Apply the odd archimedean local dictionary to solvable-artin; use R16.2 newvectors for conductor and R16.6 normalization.
2. Use finite-image coefficient realization and stable-lattice data from R01.1; compare full Frobenius polynomials with R01.5.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.5`, `AutomorphicFormsOnReductiveGroups:AF.5/gl2-dictionary`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- A chosen λ is necessary: the rational prime p alone does not identify a reduction.
- An even irreducible finite-image representation does not give this holomorphic weight-one conclusion.
- The nebentypus ε of f is odd, ε(−1)=−1, matching det ρ(c)=−1 (Deligne–Serre 4.4–4.5).

**Sources.**

- [Pierre Deligne and Jean-Pierre Serre, Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), §4(c), Théorème 4.10 (Weil–Langlands), printed p. 516 (PDF p. 11); with Remarques 4.4–4.5 and Théorème 4.6, pp. 514–515. Exact classical statement (OCR read against the page image: 's' is ε=det ρ, 'ro(N)' is Γ₀(N), 'p' is ρ, '/' is f). For ρ irreducible, odd and with every L(s,ρ⊗χ) entire, f=Σa_n q^n with L(s,ρ)=Σa_n n^{-s} is a weight-one newform of level N = conductor of ρ and character det ρ. Entireness comes here from cuspidality of the Langlands–Tunnell π.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3, octahedral case before Theorem 3.4, p. 20 of the Digital Math Archive text (PDF p. 23). Archimedean criterion only, over Q: π_∞=π(μ⊕ν) with μ=ν·sgn. For odd finite-image ρ the parameter is 1⊕sgn and no twist is needed; Langlands then applies Deligne–Serre.
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, proof of the Theorem (case D<0), printed p. 307 (PDF p. 9). Consumer use only, in the dihedral case: the theta series of an odd-order character of an imaginary quadratic field is a weight-one newform whose level is the Artin conductor and whose character is the Kronecker symbol (the determinant of the induced representation). RT97 does not state the general dictionary.

**Implementation status:** `unchecked`.

### Totally odd Artin representations and Hilbert weight one

**Declaration:** `TauCeti.GL2Transfer.tr_weight_one`; comparison; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/tr-weight-one`.

For F totally real and ρ as in solvable-artin with det ρ(c_v)=−1 at every real place, the automorphic π is holomorphic parallel-weight-one Hilbert cuspidal in the R16.6 extended dictionary. At every real place π_v is Rogawski–Tunnell's π₁, the representation of GL₂(R) unitarily induced from the Borel character (a b;0 d)↦sign(a) (isomorphic to π(1,sign)), whose parameter is 1⊕sign; it is a limit of discrete series, not a cohomological weight≥2 discrete-series representation. The finite conductor, central character and local Artin factors are those of ρ. This node exports the weight-one input to residual modularity arguments, without duplicating Hilbert Shimura-variety geometry or claiming a missing weight-one cohomological Galois construction.

**Hypotheses.**

- F is a totally real number field.
- ρ: G_F→GL₂(C) is continuous, irreducible and of finite image with solvable projective image, and π is the cuspidal representation given by solvable-artin, with rec(π_v)≅ρ|W_{F_v} at every place.
- ρ is totally odd: det ρ(c_v)=−1 for every real place v.
- Weight one is meant in Rogawski–Tunnell's sense for GL₂ (D=M₂(F)): π_v≅π₁ at every real place v.

**Construction or proof.**

1. At each real place, solvable-artin gives rec(π_v)≅ρ|W_{F_v}; this factors through Gal(C/R) and sends c_v to an involution with eigenvalues +1,−1, so the parameter is 1⊕sign and π_v≅π(1,sign)≅π₁ by the archimedean correspondence for reducible parameters.
2. Request the exact weight-one adelic/holomorphic extension of R16.6; the existing cohomological-only wording does not suffice.
3. Retain coefficient realization and the chosen residual place when this form is used modulo p.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `ArithmeticGaloisRepresentations:R01.1`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Total oddness must hold at every real place, not just one.
- The infinity type is not silently replaced by weight-two discrete series.
- π₁ has central character sign on R^×, matching det ρ(c_v)=−1 under the determinant/central-character normalization.

**Sources.**

- [Jonathan D. Rogawski and Jerrold B. Tunnell, On Artin L-functions associated to Hilbert modular forms of weight one](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf), §1, definitions (ii) of π₁ and of 'holomorphic of weight k', printed p. 4 (rt83.txt page 4; article PDF p. 5). Definition only. OCR read against the page image: '/ c = l' is k=1, 'TTj' is π₁, 'GLjiR )' is GL₂(R), and the character is (a b;0 d)↦sign(a). With D=M₂(F), 'holomorphic of weight k' means π_v≅π_k at every real place, so weight is parallel. π₁≅π(1,sgn) has parameter 1⊕sgn.
- [Jonathan D. Rogawski and Jerrold B. Tunnell, On Artin L-functions associated to Hilbert modular forms of weight one](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf), Introduction, printed p. 1. Context statement (OCR: 'C5 ( F / F )' is Gal(F̄/F), 'n' is π, 'a' is σ). RT83 prove weight-one π gives odd σ(π). The node's direction (odd ρ with automorphic π gives π_v≅π₁) follows from all-place compatibility and the real parameter 1⊕sgn.

**Implementation status:** `unchecked`.

### Solvable residual lifting in odd characteristic

**Declaration:** `TauCeti.GL2Transfer.odd_residual_lift`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift`.

Let F be totally real, p>2, and r̄:G_F→GL₂(F̄_p) be continuous, absolutely irreducible and totally odd with solvable image. There is a totally odd continuous finite-image characteristic-zero lift ρ over a number field, a place λ above p and a stable lattice whose semisimplified reduction is r̄ after a specified residue-field embedding. The proof uses the finite-subgroup classification (projective image dihedral, A₄ or S₄), a reduction-compatible lift of that finite projective image to characteristic zero, Tate's theorem (finite-projective-lift) and a Teichmüller twist; Tate alone only lifts a projective homomorphism and does not ensure the prescribed residual reduction. Coefficient enlargement is allowed. BCGP state this lift citing only the classification [SD73] and Tate's theorem [Ser77, Theorem 4]; the reduction-compatible lift of the projective image and the final twist are not written out there and remain an explicit source-proof gap in this packet.

**Hypotheses.**

- F is a totally real number field and p>2 is prime.
- r̄: G_F→GL₂(F̄_p) is continuous and absolutely irreducible.
- r̄ is totally odd: det r̄(c_v)=−1 for every real place v.
- r̄ has solvable image (equivalently, solvable projective image).
- The output records a number field E of coefficients, a place λ of E above p, an embedding of the residue field of λ into F̄_p and a stable lattice; coefficient enlargement is allowed.

**Construction or proof.**

1. By the imported classification of finite subgroups of PGL₂(F̄_p), absolute irreducibility and solvability leave a projective image G that is dihedral of order prime to p, A₄ or S₄; BCGP cite Swinnerton-Dyer [SD73] for this.
2. Lift G to a finite subgroup of PGL₂ over the integers of a finite extension of Q_p that maps isomorphically onto G under reduction. If p∤|G|, lift the two-dimensional representation of the preimage of G in SL₂(F̄_p), whose order is prime to p. If p=3 and G is A₄ or S₄, use an embedding of GL₂(F₃) into GL₂ over Z[√−2] that reduces to the identity. BCGP leave this step implicit; it is the recorded gap.
3. Apply finite-projective-lift (Tate) to the resulting finite-image projective representation, viewed over C through a fixed field isomorphism. This gives a finite-image linear ρ₀ whose reduction has the projectivization of r̄, so equals r̄⊗χ̄ for a character χ̄; twist ρ₀ by the Teichmüller lift of χ̄^{-1}. Retain the coefficient field, λ and lattice in the output.
4. At p>2, det ρ(c_v)∈{±1} reduces to det r̄(c_v)=−1, so it equals −1 at every real place; equivalently the non-scalar residual involution forces eigenvalues +1,−1.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-projective-lift`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- The result includes p=3 but is not limited to that prime.
- A random characteristic-zero projective lift with the correct projectivization need not reduce to the specified r̄.
- The lift ρ is irreducible, because its reduction r̄ is absolutely irreducible.

**Sources.**

- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proposition 10.1.3, proof, solvable case, printed p. 474 (PDF p. 322). Proof step only, in BCGP's setting: ϱ̄:G_E→GL₂(F̄_p), E/F a totally real quadratic extension, p∈{3,5}, det ϱ̄=ε̄^{-1} (so totally odd), absolutely irreducible. The node generalises to any totally real F and p>2. The reduction-compatible lift of the projective image and the twist fixing the reduction are left implicit (gap).

**Implementation status:** `unchecked`.

### Solvable residual modularity over totally real fields

**Declaration:** `TauCeti.GL2Transfer.residual_lt_application`; application; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/residual-lt-application`.

For F,p,r̄ as in odd-residual-lift, apply Langlands–Tunnell to its totally odd finite-image lift and obtain a parallel-weight-one Hilbert cuspidal form whose chosen λ-adic reduction realizes r̄. This is the qualitative residual modularity input of the solvable case in the proof of BCGP Proposition 10.1.3 (there over a totally real quadratic extension E of the base field, with p=3 or 5). The proof of Theorem 10.2.6 uses it only through Proposition 10.1.3(1). Subsequent ordinary weight-two lifts, auxiliary solvable extensions and GSp₄ transfer in those arguments require their own lifting/weight-change owners and are not consequences of Langlands–Tunnell alone. No unchanged conductor or ordinary local condition is promised by this application.

**Hypotheses.**

- F, p, r̄ as in odd-residual-lift: F totally real, p>2, r̄:G_F→GL₂(F̄_p) continuous, absolutely irreducible, totally odd, with solvable image.
- The characteristic-zero lift ρ, the place λ above p, the residue-field embedding and the stable lattice are those produced by odd-residual-lift.
- The output form is holomorphic of parallel weight one in the sense of tr-weight-one; no level, conductor or ordinarity condition is claimed.

**Construction or proof.**

1. The lift ρ from odd-residual-lift is irreducible (its reduction is absolutely irreducible), has finite image and solvable projective image, so solvable-artin gives a cuspidal π with all-place parameters ρ; tr-weight-one makes π holomorphic of parallel weight one. Retain the exact residue-field/lattice identification.
2. Pass the witness, with its actual weight, level and place, to downstream modularity-lifting and symplectic-transfer owners.
3. Keep the BLGG ordinary-weight-two adjustment cited by BCGP separate from the weight-one theorem.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tr-weight-one`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.5`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- The output includes a chosen place above p and a stable lattice.
- Solvable-image modularity does not supply an ordinary weight-two automorphic lift without a separate theorem.
- In the proof of BCGP Theorem 10.2.6 the input ρ̄_{E,3} has image GL₂(F₃) and projective image S₄≅PGL₂(F₃), so the octahedral branch at p=3 is the one used.

**Sources.**

- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proposition 10.1.3, proof, solvable case, printed p. 474 (PDF p. 322). Consumer statement: BCGP apply Langlands–Tunnell over the totally real quadratic E to get modularity of ϱ̄, then separately use [BLGG13, Thm A] for the ordinary parallel-weight-two form. The node records only the weight-one step, over a general totally real field.
- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Theorem 10.2.6, proof, printed p. 481 (PDF p. 329). Indirect consumer via Proposition 10.1.3(1), with ϱ̄=ρ̄_{E,3}:G_H→GL₂(F₃) surjective (solvable, projective image S₄, p=3). BCGP's proof omits that H must be totally real for 10.1.3(1); this is register entry PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E150.

**Implementation status:** `unchecked`.


### Tunnell's globalisation of a local two-dimensional Weil representation (Tunnell 1978, Theorem 1.3)

**Declaration:** `TauCeti.GL2Transfer.tunnell_primitive_globalization`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/tunnell-primitive-globalization`.

Tunnell, Invent. Math. 46 (1978), Theorem 1.3, for a p-adic field. Let K be a finite extension of Q_p and σ: W_K → GL₂(C) a continuous two-dimensional representation. There exist a number field F, a finite place v of F with an isomorphism F_v ≅ K, and a continuous representation ρ: W_F → GL₂(C) whose restriction ρ_v to W_{F_v} is isomorphic to σ. If σ is reducible, induced from a proper subgroup, of A₄-type or of S₄-type (the type is the image in PGL₂(C)), then ρ can be chosen of the same type. If K = Q₂ and σ is of S₄-type, one can take F = Q and ρ with det ρ(c) = −1 for complex conjugation c. In the primitive case (A₄- or S₄-type, which forces p = 2) the proof gives ρ = ρ₀ ⊗ χ̃, where ρ₀: G_F → GL₂(C) has finite image and the same projective image as σ, χ̃ is a Hecke quasi-character of F, and in the S₄ case det ρ₀(c) = −1 at every real place. Finite-image form, as Carayol 12.2.3 uses it: if σ is primitive with finite image, ρ can be taken to be a continuous representation of G_F with finite image, tetrahedral or octahedral as σ is. This form needs χ̃ of finite order, i.e. the local–global extension of finite-order characters recorded as a gap. For automorphy the quasi-character form suffices, because ρ is then a twist of the finite-image ρ₀. Tunnell states the theorem for every nonarchimedean local field and a global field F; positive characteristic is not planned here.

**Hypotheses.**

- K is a finite extension of Q_p and W_K its Weil group with the Weil topology. Tunnell's K is any nonarchimedean local field (§1); the node treats characteristic zero only, so F is a number field.
- σ: W_K → GL₂(C) is continuous. No irreducibility is assumed for the existence clause.
- The type of a two-dimensional representation is its image in PGL₂(C) (Tunnell, p. 182). The A₄- and S₄-type representations of W_K are the primitive irreducible ones (Tunnell cites Weil, Exercices dyadiques §13); they occur only for p = 2.
- ρ_v is the restriction along the embedding W_{F_v} → W_F given by a place of F̄ above v; its isomorphism class does not depend on that choice.
- Finite-image form: σ is primitive with finite image, and the local–global extension of finite-order characters (packet gap) is available.

**Construction or proof.**

1. Choose F and v: let g ∈ Q_p[x] be the minimal polynomial of a primitive element of K/Q_p and approximate it by a monic f ∈ Q[x] of the same degree; by Krasner's lemma f is irreducible over Q_p with Q_p[x]/(f) ≅ K, so F = Q[x]/(f) has a place v with F_v ≅ K (global–local dictionary). For K = Q₂ take F = Q.
2. σ reducible, σ ≅ μ ⊕ ν: extend μ and ν to quasi-characters of the idele class group C_F (Tunnell: 'well known'; F_v^× is a closed subgroup of C_F, so the unitary part extends by Pontryagin duality and |·|_v^s extends as |·|_A^s), and let ρ be their sum via global reciprocity.
3. σ ≅ Ind_{W_E}^{W_K} θ with E/K quadratic: choose a quadratic extension L/F with a single place w over v and L_w ≅ E over K (weak approximation on a Kummer generator; squares are open in K^×). Extend θ to a quasi-character θ̃ of C_L and put ρ = Ind_{W_L}^{W_F} θ̃; Mackey's formula with the single place w gives ρ_v ≅ σ.
4. σ primitive: it is of A₄- or S₄-type and p = 2 (R16.3, R01.4). Twist σ by an unramified quasi-character so that it has finite image; the twist is undone at the end by a power of the idele norm. Let K(σ) be the field cut out by the projective representation, the splitting field of a quartic P ∈ K[x] on whose roots Gal(K(σ)/K) ≅ A₄ or S₄ acts. Approximate P by Q ∈ F[x] (weak approximation at v and at the real places) so closely that, by Krasner's lemma, the splitting field of Q over K is K(σ), and in the S₄ case Q has exactly two real roots at every real place. Let L be the splitting field of Q over F; Gal(L/F) ⊆ S₄ contains the decomposition group Gal(L_w/K) ≅ Gal(K(σ)/K).
5. A₄ case: if Gal(L/F) ≅ S₄, replace F by the quadratic subfield of L. The decomposition group lies in A₄, so v splits there and a place above v still has completion K. In both cases Gal(L/F) equals the decomposition group, and transporting the projective representation of σ along Gal(L_w/K) ≅ Gal(L/F) gives r: G_F → PGL₂(C). finite-projective-lift gives ρ₀: G_F → GL₂(C) of finite image with projectivization r.
6. ρ₀|_{W_{F_v}} and σ have the same projectivization, so ρ₀|_{W_{F_v}} ≅ σ ⊗ χ with χ of finite order (χ² = det ρ₀,v / det σ). Tunnell leaves this twist implicit (he cites Serre [11]). Put ρ = ρ₀ ⊗ χ̃⁻¹ for a global extension χ̃ of χ: a quasi-character gives Tunnell's statement, a finite-order χ̃ (packet gap) gives the finite-image form. For F = Q the finite-order extension is elementary (Dirichlet characters).
7. Real places in the S₄ case: complex conjugation permutes the roots of Q as a transposition, so r(c) is a nontrivial involution and det ρ₀(c) = −1 by the archimedean clause of finite-projective-lift. A finite-order χ̃ has χ̃(c)² = 1, so det ρ(c) = −1 is kept. With K = Q₂ and F = Q this is the last clause of the theorem.

**Consumers determining the API.**

- AutomorphicGaloisRepresentations:R19.2/carayol-cubic-base-change-of-extraordinary; GL2AutomorphicRepresentationsAndTransfer:R17.6/extraordinary-cubic-compatibility: Carayol 12.2.3: globalise a primitive (extraordinary dyadic) σ of finite image to a tetrahedral or octahedral representation over a number field before applying the Artin conjecture and base change.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-projective-lift`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Type is preserved: a dihedral σ = Ind θ is globalised as an induced representation, and a primitive σ is never globalised by an induced one.
- In the A₄ case the approximating quartic can have Galois group S₄ over F. Keeping F would give an S₄-type ρ; Tunnell therefore passes to the quadratic subfield of L, in which v splits.
- The final twist cannot be omitted: two linear lifts of the same projective representation differ by a character, so the Tate lift ρ₀ restricted to W_{F_v} is σ only up to a twist.
- F_v ≅ K forces [F:Q] ≥ [K:Q_p], so F = Q is possible only for K = Q_p, as in the Q₂ clause.

**Sources.**

- [Jerrold B. Tunnell, On the local Langlands conjecture for GL(2)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf), §1, Theorem 1.3, printed p. 182 (GDZ article PDF p. 5; page 4 of the OCR text). Exact first sentence, read against the page image (OCR: 'a'/'о' = σ, 'Wj^' = W_K, 'F^ ^ K' = F_v ≈ K, 'p' = ρ, 'Wp' = W_F, 'p^' = ρ_v, 'Wp^' = W_{F_v}). Tunnell's K is any nonarchimedean local field and F a global field; the node specialises to p-adic K and number fields F.
- [Jerrold B. Tunnell, On the local Langlands conjecture for GL(2)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf), §1, Theorem 1.3, second and third sentences, printed p. 182 (GDZ PDF p. 5). Exact for the type clause and the Q₂ clause (OCR: 'A^-type'/'S^-type' = A₄-/S₄-type, 'i^ = Q2 (^^d a' = 'K = Q₂ and σ', 'F = (i^' = 'F = Q', '—1' = −1).
- [Jerrold B. Tunnell, On the local Langlands conjecture for GL(2)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf), proof of Theorem 1.3, first paragraph, printed p. 182 (GDZ PDF p. 5). Proof step: choice of F, and the 'well known' extension of quasi-characters from W_{F_v} to W_F (OCR 'i;' = v, 'F^^K' = F_v ≈ K). The node makes this extension explicit and records its finite-order form as a gap.
- [Jerrold B. Tunnell, On the local Langlands conjecture for GL(2)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf), proof of Theorem 1.3, primitive case, printed p. 183 (GDZ PDF p. 6). Proof step: the quartic approximation (OCR 'P{x)' = P(x), 'К (a)' = K(σ)); two real roots at each real place give oddness in the S₄ case.
- [Jerrold B. Tunnell, On the local Langlands conjecture for GL(2)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf), proof of Theorem 1.3, S₄ case, printed p. 183 (GDZ PDF p. 6). Proof step: Tate's lifting (Tunnell cites Serre [11]), with ρ_v ≅ σ asserted directly (OCR '^^^4' = ≅ S₄, 'Gp' = G_F, 'p^^o' = ρ_v ≅ σ). The twist that matches the restriction to σ is implicit; the node's proof spells it out.
- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), 12.2.3, proof of Proposition 12.2.2, printed p. 458 (PDF p. 51). Consumer use: after an unramified twist making σ of finite image (preceding sentence), Carayol takes a number field 𝔈, a place v₀ with 𝔈_{v₀} ≅ F and a finite-image tetrahedral or octahedral σ̃ of Gal(𝔈̄/𝔈) with σ̃_{v₀} ≅ σ. This is the node's finite-image form; Tunnell states only a W_F-representation (OCR: 'g' = 𝔈, 'VQ' = v₀, '<r' = σ̃, 'a' = σ, 'Gai' = Gal).

**Implementation status:** `unchecked`.

### Automorphic induction with prescribed local and archimedean components (Carayol 11.2)

**Declaration:** `TauCeti.GL2Transfer.prescribed_local_induction`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/prescribed-local-induction`.

Carayol 1986, 11.2, with the global Weil construction of Jacquet–Langlands §12. Let F be a totally real field of degree d with real places τ₁,…,τ_d, let k₁,…,k_d ≥ 2 and w be integers of the same parity, and let D_{k,w} be the essentially square-integrable representation of GL₂(R) of Carayol 0.2 (central character t ↦ t^{−w}), so that D_{k,w} ≅ 𝒲(C, ζ_{k,w}) with ζ_{k,w}(z) = (z z̄)^{(−w−k+1)/2} z^{k−1}. Let 𝔭 ≠ v be finite places of F, L_𝔭/F_𝔭 a quadratic field extension and ξ_𝔭 a quasi-character of L_𝔭^× that does not factor through the norm, with ξ_𝔭·|·|^{w/2} of finite order; so 𝒲(L_𝔭, ξ_𝔭) is ordinary cuspidal. Then there exist a totally imaginary quadratic extension L/F and a quasi-character ξ of 𝔸_L^×/L^× such that (a) L ⊗_F F_𝔭 ≅ L_𝔭 and the 𝔭-component of ξ is ξ_𝔭; (b) at the complex place of L above τ_i, ξ is ζ_{k_i,w}; (c) L/F is not split at v and ξ_v does not factor through the norm L_v^× → F_v^×. The automorphic induction π′ = 𝒲(L, ξ) = quadraticInduction(ξ) is cuspidal, with π′_u ≅ 𝒲(L_u, ξ_u) at every place u; in particular π′_{τ_i} ≅ D_{k_i,w}, π′_𝔭 ≅ 𝒲(L_𝔭, ξ_𝔭) and π′_v is supercuspidal. Hence, when 𝒲(L_𝔭, ξ_𝔭) is the component π_𝔭 of a π as in Carayol (0.3) and v is the place fixed in Theorem (B), π′ satisfies the hypotheses of Theorem (B) and has the same 𝔭-component as π. Carayol calls the existence of (L, ξ) standard and gives no proof. The finite-order condition, automatic for such π_𝔭, cannot be dropped, and the proof uses the local–global extension of finite-order characters recorded as a gap.

**Hypotheses.**

- F is totally real of degree d with real places τ₁,…,τ_d; k₁,…,k_d ≥ 2 and w are integers of the same parity (Carayol 0.3); D_{k,w} is as in Carayol 0.2, with central character t ↦ t^{−w}.
- 𝔭 is a finite place, L_𝔭/F_𝔭 a quadratic field extension and ξ_𝔭 a quasi-character of L_𝔭^× not factoring through N_{L_𝔭/F_𝔭}, so 𝒲(L_𝔭, ξ_𝔭) is supercuspidal and ordinary (Carayol 0.9; JL70 Theorem 4.6(iii)).
- ξ_𝔭·|·|_{L_𝔭}^{w/2} has finite order. Equivalently, the central character of 𝒲(L_𝔭, ξ_𝔭) is |·|^{−w} times a finite-order character; this holds when 𝒲(L_𝔭, ξ_𝔭) ≅ π_𝔭 for π as in Carayol (0.3), whose central character is |·|_𝔸^{−w} times a finite-order character because F is totally real.
- v is a finite place different from 𝔭: Carayol's fixed place of Theorem (B) when d is even, an arbitrary auxiliary place when d is odd.
- 𝒲(E, θ) is the Weil representation π(θ) of JL70 §1 (Theorem 4.6) for a quadratic extension E of a local field and a quasi-character θ of E^×, the principal series π(θ₁, θ₂) when E is split, and 𝒲(C, ·) at a real place; in the packet's normalisation its parameter is Ind θ (quadratic-induction).

**Construction or proof.**

1. Choose L = F(√α) by weak approximation: α negative at every τ_i, α ∈ α_𝔭·(F_𝔭^×)² where L_𝔭 = F_𝔭(√α_𝔭), and α a non-square in F_v (squares are open in F_𝔭^× and F_v^×). Then L is CM, L ⊗_F F_𝔭 ≅ L_𝔭 and L_v is a field; the places 𝔓 above 𝔭 and 𝔙 above v are unique, hence stable under the nontrivial automorphism σ of L/F.
2. Archimedean part: by Weil's criterion for CM fields (Patrikis Lemma 2.3.1) there is a unitary Hecke character ψ₀ of L with component (z/|z|)^{k_i−1} at the complex place above τ_i. Put ψ = ψ₀·|·|_{𝔸_L}^{−w/2}. Since ζ_{k,w}(z) = (z/|z|)^{k−1}|z|^{−w}, ψ satisfies (b).
3. ψ₀ has finite order at 𝔓: take π ∈ L^× with (π) = 𝔓^h. As 𝔓 is σ-stable, π̄/π is a unit of absolute value 1 at every complex place, hence a root of unity (Kronecker), so ψ₀,∞(π) is a root of unity. The components of ψ₀ at its other ramified places have finite order on units, so ψ₀,𝔓(π) is a root of unity, and ψ₀,𝔓 has finite order on the finite-index subgroup π^Z·O_𝔓^×. With the finite-order hypothesis, μ = ξ_𝔭·ψ_𝔓^{−1} = (ξ_𝔭|·|^{w/2})·ψ₀,𝔓^{−1} is a finite-order character of L_𝔓^×.
4. Choose a finite-order character θ of L_𝔙^× with ψ_𝔙θ not σ-invariant: θ = 1 if ψ_𝔙 is not σ-invariant, otherwise any θ with θ ≠ θ∘σ. A character of L_𝔙^× factors through the norm exactly when it is σ-invariant (Hilbert 90 and the index-two norm subgroup).
5. By the local–global extension of finite-order characters (packet gap), take a finite-order Hecke character χ of L with χ_𝔓 = μ and χ_𝔙 = θ; it is trivial at the archimedean places, which are complex. Put ξ = ψχ; then (a), (b) and (c) hold.
6. ξ_𝔓 = ξ_𝔭 does not factor through the norm, so ξ ≠ ξ∘σ and quadraticInduction(ξ) is cuspidal (JL70 Proposition 12.1), with local components 𝒲(L_u, ξ_u). At v, L_v is a field and ξ_v does not factor through the norm, so 𝒲(L_v, ξ_v) is supercuspidal (JL70 Theorem 4.6(iii)). At τ_i the component is 𝒲(C, ζ_{k_i,w}) ≅ D_{k_i,w}, and the central characters match: sgn·sgn^{k_i−1}|t|^{−w} = t^{−w} since k_i ≡ w mod 2.

**Consumers determining the API.**

- AutomorphicGaloisRepresentations:R19.2/carayol-ordinary-cuspidal-places: Carayol 11.2–11.3: replace π by a CM form π′ with the same ordinary cuspidal component at 𝔭, so σ_𝔭(π) = σ_𝔭(π′) is an induced character.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Cuspidality of π′ already follows from (a), because ξ_𝔭 does not factor through the norm. Condition (c) only makes π′_v square-integrable, which Theorem (B) needs at its fixed place when d is even.
- If L were split at v, π′_v would be a principal series π(ξ_{v′}, ξ_{v″}), not square-integrable.
- A real place of F split in L would give a principal series there instead of D_{k_i,w}; this is why L must be totally imaginary.
- The finite-order hypothesis cannot be dropped: ξ(π) = 1 for π generating 𝔓^h forces (ξ_𝔭|·|^{w/2})(π) to be a root of unity. If ξ_𝔭 is replaced by ξ_𝔭·|·|^{it} with |·|^{it} of infinite order on L_𝔭^×, no ξ satisfies (a) and (b).

**Sources.**

- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), 11.2, printed p. 450 (PDF p. 43). Exact existence claim, without proof (OCR: 'Ç' = ζ, 'A^' = 𝔸_L^*). Carayol's (L, ζ) is the node's (L, ξ); 'quadratique imaginaire' over the totally real F means totally imaginary (CM). The node adds the finite-order hypothesis on ξ_𝔭·|·|^{w/2}, automatic in Carayol's setting, and proves the claim.
- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), 11.2, condition (a), printed p. 450 (PDF p. 43). Condition (a), exact (OCR: '(g) Fp^Lp' = ⊗_F F_𝔭 ≅ L_𝔭, 'Ç' = ζ, 'p' = 𝔭). Condition (b), ζ_{τ_i} ≅ ζ_{k_i,w}, is unreadable in the OCR and was read from the page image.
- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), 11.2, condition (c), printed p. 450 (PDF p. 43). Condition (c), exact (OCR: 'u' = v, '^' = ζ_v, 'L^ à F^' = L_v^* à F_v^*).
- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), 11.2, conclusion, printed p. 450 (PDF p. 43). Exact for the conclusion: the global Weil construction gives π′ = 𝒲(L, ζ), satisfying the hypotheses of Theorem (B), with π′_𝔭 ≅ π_𝔭 (OCR: 'TI'=^(L,O' = π′ = 𝒲(L, ζ), 'GL^ (Ap)' = GL₂(𝔸_F), '7t' = π).
- [Henri Carayol, Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), 11.2, archimedean components, printed p. 450 (PDF p. 43). Exact for D_{k,w} ≅ 𝒲(C, ζ_{k,w}) (OCR: 'D^ ^' = D_{k,w}, ''W (C,Ç^)' = 𝒲(C, ζ_{k,w})). The displayed formula, garbled in the OCR, was read from the page image: ζ_{k,w}(z) = (z z̄)^{(−w−k+1)/2} z^{k−1}.
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §12, Proposition 12.1, printed p. 206 (PDF p. 212). Proof step: the global Weil construction. If χ does not factor through the norm, ⊗_v π(σ_v) with σ = Ind χ is a constituent of A₀, i.e. cuspidal; the words 'If there is' and the conclusion 'is a constituent of A₀' surround the excerpt, where a tensor sign breaks the text layer.
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §4, Theorem 4.6(iii), printed p. 71 (PDF p. 77). Proof step: the local Weil representation π(ω) is supercuspidal when ω does not factor through the norm ν (OCR 'χ0 ν' = χ∘ν). Used at v, and for the hypothesis that 𝒲(L_𝔭, ξ_𝔭) is cuspidal.
- [Stefan Patrikis, Variations on a theorem of Tate](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf), §2.3, Lemma 2.3.1 and the sentence after it, printed p. 28 (PDF p. 32). Proof step: a unitary Hecke character of the CM field L with archimedean components (ι(z)/|ι(z)|)^{k_i−1}. Twisting by |·|^{−w/2} gives ζ_{k_i,w}. Patrikis's F is the node's L.

**Implementation status:** `unchecked`.

### The octahedral mod-3 application: odd mod-3 representations come from weight-one forms

**Declaration:** `TauCeti.GL2Transfer.octahedral_mod_three_application`; application; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-mod-three-application`.

Let ρ̄: G_Q → GL₂(F₃) be continuous, absolutely irreducible and odd (det ρ̄(c) = −1). Let λ = (1+√−2), so that Z[√−2]/λ ≅ F₃ with √−2 ↦ −1, and let s: GL₂(F₃) → GL₂(Z[√−2]) be an injective homomorphism with s(x) ≡ x mod λ. For example, s is determined by s([[1,1],[0,1]]) = [[−2, −1+√−2],[1+√−2, 1]] and s([[0,1],[1,0]]) = [[−1−√−2, −2],[−1+√−2, 1+√−2]]: these generate a group of order 48 that reduction maps bijectively onto GL₂(F₃). Fix Q(√−2) ⊂ C and put ρ = s∘ρ̄: G_Q → GL₂(C). Then ρ is continuous, irreducible and odd, with finite image isomorphic to that of ρ̄; det ρ is the ±1-valued lift of det ρ̄; and the projective image of ρ is isomorphic to the image of ρ̄ in PGL₂(F₃) ≅ S₄, so it is solvable (S₄, octahedral, exactly when ρ̄ is surjective). By solvable-artin and q-weight-one there is a normalized weight-one newform g of level N(ρ), the Artin conductor of s∘ρ̄, and odd quadratic nebentypus ε = det ρ, with ρ_g ≅ ρ. For every prime ℓ ∤ N(ρ), a_ℓ(g) = tr s(ρ̄(Frob_ℓ)) ∈ Z[√−2], a_ℓ(g) ≡ tr ρ̄(Frob_ℓ) and ε(ℓ) ≡ det ρ̄(Frob_ℓ) mod λ. Reducing ρ_g along the stable lattice Z[√−2]_λ² gives exactly ρ̄, so ρ̄_{g,λ} ≅ ρ̄. No general reduction-preserving lifting (the odd-residual-lift gap) is used. The level N(ρ) can exceed Serre's conductor of ρ̄. Darmon–Diamond–Taylor, Theorem 3.14(a), state the conclusion as modularity in weight two (their Definition 3.12) and pass from g to a weight-two form by Remark 3.6; that step is not part of this node.

**Hypotheses.**

- ρ̄: G_Q → GL₂(F₃) is continuous, absolutely irreducible and odd: det ρ̄(c) = −1 for complex conjugation c.
- λ = (1+√−2) is the prime of Z[√−2] above 3 (norm 3); reduction modulo λ identifies Z[√−2]/λ with F₃, √−2 ↦ −1.
- s: GL₂(F₃) → GL₂(Z[√−2]) is an injective group homomorphism with red_λ∘s = id (DDT's 'section'). The explicit s of the statement is one choice, checked by enumerating the 48 elements.
- A fixed embedding Q(√−2) → C; Frobenius is arithmetic and det ρ is read as a Dirichlet character by reciprocity, as in q-weight-one.

**Construction or proof.**

1. ρ = s∘ρ̄ is continuous with finite image, and s restricts to an isomorphism im ρ̄ ≅ im ρ; in particular ker ρ = ker ρ̄.
2. Irreducible: if ρ were reducible over C, its finite image would be abelian (a sum of two characters), hence so would im ρ̄; an abelian group cannot act absolutely irreducibly in dimension two.
3. Odd: ρ(c)² = 1, so det ρ(c) = ±1, and it reduces to det ρ̄(c) = −1 ≠ 1 in F₃; hence det ρ(c) = −1. Likewise det s(x) ∈ Z[√−2]^× = {±1} reduces to det x, so det ρ is the ±1-valued lift of det ρ̄.
4. Projective image: s(GL₂(F₃)) is nonabelian, so it acts irreducibly on C², and by Schur s(−1) is a scalar of order two, namely −1. Conversely, if s(x) is scalar then x = red s(x) is scalar. So s induces an isomorphism between the images in PGL₂(F₃) ≅ S₄ and in PGL₂(C), and the projective image of ρ is solvable (R01.4).
5. Apply solvable-artin and q-weight-one to ρ: a normalized weight-one newform g of level N(ρ) and nebentypus det ρ, whose Frobenius polynomials are X² − a_ℓ(g)X + det ρ(Frob_ℓ) for ℓ ∤ N(ρ).
6. Reduction: the lattice Z[√−2]_λ² is stable under s(GL₂(F₃)) and its reduction is red∘s∘ρ̄ = ρ̄. Since ρ̄ is absolutely irreducible, every stable lattice gives the same reduction up to isomorphism (Brauer–Nesbitt, R01.5), so ρ̄_{g,λ} ≅ ρ̄. All a_n(g) lie in Z[√−2]: at p | N(ρ), a_p is 0 or the eigenvalue of Frob_p on the inertia invariants, a line defined over Q(√−2).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.4`, `ArithmeticGaloisRepresentations:R01.5`, `mathlib:Matrix.GeneralLinearGroup.map`, `tauceti:TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- The section must be a homomorphism: the entrywise lift [[1,1],[0,1]] of an element of order 3 has infinite order in GL₂(Z[√−2]), whereas s([[1,1],[0,1]]) has order 3, trace −1, and the primitive cube roots of unity as eigenvalues.
- The level of g is not Serre's conductor: at ℓ ≠ 3 where ρ̄(I_ℓ) is generated by a unipotent element of order 3, ρ̄ has conductor exponent 1, but s of that element has no fixed vector, so s∘ρ̄ has conductor exponent 2 at ℓ.
- For ρ̄ = ρ̄_{E,3} of an elliptic curve E/Q with surjective mod-3 representation, det ρ̄ is the mod-3 cyclotomic character, so ε is the quadratic character of Q(√−3) and 3 divides N(ρ).
- The construction is special to F₃. For surjective ρ̄: G_Q → GL₂(F₉), GL₂(F₉) is not solvable (pinned baseline: F₉ has a nonzero a with a² ≠ 1), and every lift with finite image surjects onto im ρ̄, so solvable-artin applies to no such lift. In F₃ every nonzero a has a² = 1, consistent with GL₂(F₃), of order 48, being solvable.
- Only weight one is produced. The weight-two form in DDT Theorem 3.14 needs Remark 3.6, a separate step.

**Sources.**

- [Henri Darmon, Fred Diamond and Richard Taylor, Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §3.2, Theorem 3.14(a), p. 90. Exact hypotheses for k = F₃. DDT's conclusion 'ρ̄ is modular' means weight two (Definition 3.12); the node stops at weight one.
- [Henri Darmon, Fred Diamond and Richard Taylor, Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §3.2, sketch of proof of Theorem 3.14, case (a), p. 90. Exact for the proof, with the map GL₂(Z[√−2]) → GL₂(F₃) defined in the preceding line as reduction modulo (1+√−2) (the '√' is lost in the text layer: 'Z[ −2]' = Z[√−2]). DDT do not give s; the node gives an explicit one. The passage to weight two by Remark 3.6 is outside the node.
- [Henri Darmon, Fred Diamond and Richard Taylor, Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §3.2, Theorem 3.9, p. 89. The Langlands–Tunnell input over Q in the odd case, which the node takes from solvable-artin and q-weight-one.
- [Henri Darmon, Fred Diamond and Richard Taylor, Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §3.2, Definition 3.12, p. 89. Normalisation: DDT's 'modular' is weight two, so Theorem 3.14 is a weight-two statement. This node records only the weight-one step.

**Implementation status:** `unchecked`.


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

**Declaration:** `TauCeti.GL2Transfer.solvable_dihedral`; application; node `GL2AutomorphicRepresentationsAndTransfer:R17.6/solvable-dihedral`.

Let r̄:G_Q→GL₂(F̄₂) be continuous and absolutely irreducible, with solvable projective image. Then its projective image is a dihedral group D_n of order 2n with n odd ≥3. Reason, from the R01.4 classification in characteristic two: PGL₂(F̄₂)=PSL₂(F̄₂)≅SL₂(F̄₂); every 2-subgroup of SL₂(F̄₂) is elementary abelian and unipotent, so it fixes a unique line; hence a finite subgroup with a nontrivial normal 2-subgroup (every Borel-type group, the Klein four group, and A₄, which here is the Borel subgroup of SL₂(F₄)) fixes a point of P¹, as does a cyclic group of odd order, and makes r̄ reducible; S₄ does not embed because its Sylow 2-subgroup is nonabelian; an even-order element of a dihedral subgroup is an involution, so n is odd. After removing a scalar character (determinant-untwist), the linear image is dihedral of order 2n. This is a Galois application of the existing finite-group classification, not a second classification proof. In characteristic two the determinant condition at complex conjugation is vacuous, so it cannot be used to deduce that a naive complex lift is odd.

**Hypotheses.**

- r̄:G_Q→GL₂(F̄₂) is continuous for the discrete topology on F̄₂, hence has finite image.
- r̄ is absolutely irreducible (over F̄₂ the same as irreducible).
- The image of r̄ in PGL₂(F̄₂) is solvable.
- The finite-subgroup classification of PGL₂(F̄₂)=PSL₂(F̄₂)≅SL₂(F̄₂) is imported from R01.4, specialised to characteristic two.

**Construction or proof.**

1. Use continuity and the discrete residual coefficient field to obtain a finite image in some GL₂(F_{2^f}), hence a finite projective image G.
2. Identify PGL₂(F̄₂) with SL₂(F̄₂) (the centre of SL₂ is trivial in characteristic two and every determinant is a square) and apply the imported classification: Borel-type groups, cyclic groups of odd order, dihedral groups of order 2n with n odd, and the non-solvable SL₂(F_{2^k}), k≥2 (A₅≅SL₂(F₄)).
3. Exclude line-preserving cases by absolute irreducibility: a nontrivial normal 2-subgroup is unipotent and fixes a unique line, which is then G-stable; a cyclic odd-order group is diagonalizable. A₄ occurs only as a Borel subgroup and S₄ does not occur. What remains is D_n, n odd ≥3.
4. Use determinant-untwist to pass to the linear-dihedral hypothesis of Rohrlich–Tunnell; retain the scalar character for twisting back.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- A reducible upper-triangular residual representation is not included.
- The classical Rohrlich–Tunnell theorem assumes linear-dihedral image; a scalar twist is recorded explicitly.
- A projective image A₄ in characteristic two is the Borel subgroup of SL₂(F₄), with a normal Klein four group of unipotents; it forces a fixed line and is not an irreducible case.
- A projective image D_n with n even, including the Klein four group D₂, does not occur for irreducible r̄ in characteristic two.

**Sources.**

- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Introduction, printed p. 123 (PDF p. 1). Supporting passage, not a proof: Wiese's definition of dihedral (induced from a quadratic field) and the asserted equivalence with projective image D_n. For p=2 this is exactly the node's conclusion (n odd ≥3); for odd p the printed equivalence omits n=2 and irreducibility (sourceIssues). The solvable⇒dihedral reduction through the finite-subgroup classification is the packet's own.
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, first paragraph, printed p. 306 (PDF p. 8). Proof step only: the characteristic-two Jordan-form fact used to see that 2-elements are unipotent (text layer writes F2 for F̄₂). RT apply it only to linear-dihedral images.
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, first paragraph, printed p. 306 (PDF p. 8). Proof step only: a dihedral subgroup of GL₂(F̄₂) of order ≥6 has order twice an odd number, which gives n odd in the node.
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), Introduction, printed p. 299 (PDF p. 1). Exact source for the node's last sentence: oddness is vacuous in characteristic two (text layer renders ℓ as `).

**Implementation status:** `unchecked`.

### Removing the characteristic-two scalar character

**Declaration:** `TauCeti.GL2Transfer.determinant_untwist`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`.

For continuous absolutely irreducible r̄:G_Q→GL₂(F̄₂) with dihedral projective image D_n, n odd ≥3, the determinant character det r̄ has odd order and a unique square root ξ:G_Q→F̄₂^× (unique among all characters, since a²=1 forces a=1 in characteristic two); ξ has odd order and is unramified at 2. The twist r̄₀=r̄⊗ξ^{-1} has determinant one and its image maps isomorphically onto the projective image, so it is dihedral of order 2n: a finite scalar in SL₂(F̄₂) is trivial. Conversely, a projective-dihedral r̄ has linear-dihedral image exactly when det r̄=1, because D_n (n odd) is generated by involutions and involutions in GL₂(F̄₂) are unipotent. Twisting a residual modular form for r̄₀ back by ξ (via reciprocity, a Teichmüller lift of ξ and a finite coefficient extension) recovers r̄; level and nebentypus are then recomputed using the actual twist, not held fixed.

**Hypotheses.**

- r̄:G_Q→GL₂(F̄₂) is continuous and absolutely irreducible, so it has finite image.
- The projective image of r̄ is dihedral D_n with n odd ≥3 (the output of solvable-dihedral).
- Characters G_Q→F̄₂^× are identified with odd-order Dirichlet characters by global reciprocity (ClassFieldTheory layer 11, GlobalNumberFields layer 9); twisting a residual form uses a Teichmüller lift of ξ and a finite coefficient extension.

**Construction or proof.**

1. Every finite subgroup of F̄₂^× is cyclic of odd order; squaring is an automorphism of the value group of det r̄, giving ξ=(det r̄)^{(m+1)/2} with m the order of det r̄. An odd-order Dirichlet character is trivial on the 2-part, so ξ is unramified at 2.
2. The central kernel after determinant normalization consists of scalars a with a²=1 and is trivial in characteristic two, so the image of r̄₀ is isomorphic to D_n.
3. For the converse use that involutions in GL₂(F̄₂) are unipotent, hence of determinant one, and that D_n is generated by involutions.
4. Use the supplied twist and conductor interfaces to return to the original representation.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For a nontrivial scalar twist the original determinant need not be one.
- Correcting the determinant can change conductor; an exact original-level claim requires a separate twist conductor calculation.

**Sources.**

- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), §4, proof of Theorem 10, printed p. 131 (PDF p. 9). Proof step only: Wiese takes the square root φ of det ρ and notes it has odd order and is unramified at 2 (text layer writes φ2 for φ²). The untwist to determinant one and the injectivity of SL₂(F̄₂)→PGL₂(F̄₂) are the packet's own.
- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Introduction, printed p. 125 (PDF p. 3). Scope comparison only: RT's 'dihedral' means linear-dihedral image, Wiese's means projective-dihedral; this node is the bridge between the two (text layer drops the overlines on F̄₂).
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), Introduction, printed p. 300 (PDF p. 2). Supporting passage: RT separate projective-dihedral 'dihedral type' from linear-dihedral and note Serre's example is only the former. RT contain no untwisting argument.

**Implementation status:** `unchecked`.

### Teichmüller lift and the four dyadic conductor cases

**Declaration:** `TauCeti.GL2Transfer.teichmuller_conductor`; comparison; node `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`.

Let r̄₀:G_Q→GL₂(F̄₂) be irreducible with linear-dihedral image of order 2n, n odd ≥3. Then r̄₀=Ind_{G_K}^{G_Q}φ for the uniquely determined quadratic field K and a character φ:G_K→F̄₂^× of odd order. Let φ̃ be the unique complex character of G_K of the same order with φ̃≡φ modulo the fixed prime l|2 (the place λ), and ρ̃=Ind φ̃. For every σ the 1-eigenspaces of ρ̃(σ) and r̄₀(σ) have equal dimension: rotations have eigenvalues φ̃(σ)^{±1}, odd-order roots of unity on which reduction is injective; a reflection has complex eigenvalues 1,−1 and its residual image is a nontrivial unipotent involution, never semisimple. Every subgroup of D_n is cyclic or contains a nontrivial rotation, so the invariants of all ramification groups at odd primes agree and the prime-to-two Artin conductor of ρ̃ is N=N(r̄₀): |D|·N_{K/Q}f(φ̃)=2^νN, D=disc K. If 2 splits or ramifies in K then N f(φ̃) is odd; if 2 is inert it is odd or an odd multiple of 4. The four cases are: (i) D and N f(φ̃) odd, ν=0; (ii) D≡5 mod 8 (printed 'D≡±5 (mod 8)'; −5≡3 mod 8 is not a discriminant) and N f(φ̃)≡4 mod 8, ν=2; (iii) D≡4 mod 8 and N f(φ̃) odd, ν=2; (iv) D≡0 mod 8 and N f(φ̃) odd, ν=3. The printed 'ν=3 in case (iii)' is the misprint corrected in sourceIssues E1.

**Hypotheses.**

- r̄₀:G_Q→GL₂(F̄₂) is continuous and irreducible, with linear image a dihedral group of order 2n, n odd ≥3 (not merely projective-dihedral).
- A fixed embedding of Q̄ in C and a fixed prime ideal l of the algebraic integers above 2 (the coefficient place λ) define φ̃ and all reductions.
- N(r̄₀) is the prime-to-2 Artin conductor in RT's normalisation (the contribution at ℓ=2 is omitted).
- D is the discriminant of K and f(φ̃) the finite conductor of φ̃ viewed as an odd-order ray class character of K.

**Construction or proof.**

1. RT §2 Jordan-form argument with R01.4: the index-two cyclic subgroup of the image has odd order and is diagonalised by two distinct mutually inverse characters; K is its fixed field, unique because D_n (n odd ≥3) has a unique cyclic subgroup of index two.
2. Lift: reduction mod l is an isomorphism μ_m(C)→μ_m(F̄₂) for m odd, giving φ̃ of the order of φ; φ̃^σ=φ̃^{-1}, so ρ̃ has dihedral image mapping isomorphically onto that of r̄₀.
3. Compare fixed-space dimensions element by element, then for every subgroup H of D_n (cyclic: use a generator; containing a nontrivial rotation: no invariants on either side), hence the Artin exponents at every odd prime agree (R01.3).
4. Apply the imported induction-conductor formula f(Ind φ̃)=|D|·N_{K/Q}f(φ̃). At a dyadic prime an odd-order local character is trivial on the pro-2 group 1+𝔭, so it is unramified when the residue field is F₂ (2 split or ramified) and has exponent at most 1 at the inert prime (residue field F₄).
5. Read off ν from v₂(D)∈{0,2,3} and v₂(N f(φ̃))∈{0,2}: ν=0,2,2,3 in cases (i)–(iv).
6. Retain the reflection fixed line when reducing the involution in characteristic two; semisimplicity of individual matrices is not assumed.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For a reflection, the induced integral matrix [[0,1],[1,0]] has complex eigenvalues 1,−1 and reduces to a nontrivial unipotent matrix; both fixed spaces have dimension one.
- D≡4 mod 8 has ν=2, not ν=3.
- D≡5 mod 8 with φ̃ unramified at 2O_K is case (i), not (ii); D≡1 mod 8 always gives case (i).
- No fundamental discriminant is ≡3 mod 8, so the printed alternative −5 in case (ii) is vacuous.

**Sources.**

- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, first paragraph, printed p. 306 (PDF p. 8). Exact: the same-order lift φ̃ of φ at the fixed prime l above 2 (the node's 'Teichmüller lift' at λ).
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, first paragraph, printed p. 306 (PDF p. 8). Exact for the conductor comparison; the node adds the subgroup-by-subgroup justification (cyclic subgroups, or a nontrivial rotation with no invariants) that RT leave implicit.
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, second paragraph, printed p. 306 (PDF p. 8). Exact: the dyadic class-field-theory step behind the four cases.
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, second paragraph, list (i)–(iv), printed p. 306 (PDF p. 8). Exact case list. The node rewrites case (ii) as D≡5 mod 8, which is equivalent because odd fundamental discriminants are ≡1 mod 4.
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, sentence after the list, printed p. 307 (PDF p. 9). Exact except the misprint E1: the printed 'ν = 3 in case (iii)' must read case (iv); the node states the corrected value.

**Implementation status:** `unchecked`.

### Rohrlich–Tunnell’s weight and level lemma

**Declaration:** `TauCeti.GL2Transfer.rt_technical_lemma`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`.

Fix Q̄⊂C and a prime ideal l of the algebraic integers above 2 (the coefficient place λ). Let g=Σb(n)q^n∈Prim₁(2^νNr,χ), a normalized newform of weight one, exact level 2^νNr and character χ with χ²=1, where ν∈{0,2,3}, N is odd and r is either 1 or an odd prime not dividing N. Assume N=N(ρ_g); if r≠1 assume b(r)≢1 mod l; if ν=2 assume b(n)=0 whenever n is even; if ν=3 assume b(2)≢0 mod l. Put k=2 if ν∈{0,2} and k=4 if ν=3. Then there is f∈Prim_k(N), a normalized newform of weight k, exact level N and trivial character, with ρ_f≅ρ_g. The Fourier conditions are used in the proof (RT Remark 2: without b(n)=0 for even n, formula (3) in Case 2 is false); the source does not show they are necessary. The theorem is a specialized arithmetic application of the imported Deligne–Serre lifting and old/newform theory, not a replacement for them.

**Hypotheses.**

- A fixed embedding Q̄⊂C and a prime ideal l of the algebraic integers above 2 (the place λ); ρ_h denotes the semisimple mod-l representation attached to an eigenform h by traces and determinants at good primes.
- g=Σb(n)q^n is a normalized newform of weight one, exact level 2^νNr and character χ with χ²=1 (necessarily odd in weight one).
- ν∈{0,2,3}; N is odd; r is 1 or an odd prime not dividing N.
- N=N(ρ_g), the prime-to-2 Artin conductor of ρ_g.
- If r≠1 then b(r)≢1 mod l.
- If ν=2 then b(n)=0 for every even n.
- If ν=3 then b(2)≢0 mod l.
- Conclusion weight k=2 for ν∈{0,2} and k=4 for ν=3.

**Construction or proof.**

1. Reduce to step (i): a divisor M of N and f∈Prim_k(M) with a(p)≡b(p) mod l for all p∤2Nr. Step (ii): for p∤2Nr traces agree and det ρ_f(σ_p)=p^{k−1}≡1≡χ(p) mod l, so ρ_f≅ρ_g by Chebotarev and Brauer–Nesbitt (R01.5). Step (iii): N(ρ_f) divides M (conductor of ρ_{f,λ} away from 2 equals the odd level M, R19.4, and reduction does not increase it, R01.3); with N(ρ_f)=N and M|N, M=N.
2. Preliminary remark (r≠1): for a T_p-eigenvector f₀∈S₂(N′r), p≠2, N′∈{N,2N}, with λ_r≠±1, the attached primitive form has conductor dividing N′; otherwise r exactly divides its conductor, f₀ is a combination of f(dz) with d prime to r, λ_r=a(r), and a(r)=±1 by the Atkin–Lehner sign. Since λ_r≡b(r)≢1 and −1≡1 mod l, λ_r≠±1.
3. ν=0: h=g²∈S₂(Nr); with τ the inverse of a Frobenius at l, h^τ≡Σb(n)q^{2n} mod l is a mod-l eigenvector of T_p (p≠2) with eigenvalues b(p); apply the Deligne–Serre lifting lemma, then the preliminary remark with N′=N.
4. ν=2: b(n)=0 for even n makes g|W odd in q, so g|C=−g and g²∈S₂(2Nr); b(2)=0 forces χ to have odd conductor, so the Atkin–Li operator J at 2 is an involution and g|J=±g; the trace W′(A+B+C)W″ gives h∈S₂(Nr) with h^τ≡Σb(n)q^n mod l; apply Deligne–Serre and the preliminary remark with N′=N.
5. ν=3: h=Σc(4n)q^n∈S₂(2Nr) (Li), h^τ≡Σb(2n)q^n, nonzero mod l since b(2)≢0; Deligne–Serre gives a primitive weight-two g₁ of conductor N₁|2N (preliminary remark with N′=2N). If N₁|N, square g₁ into S₄(N₁); if N₁=2L, use the Atkin–Lehner involution at 2 and the trace W′(A+B+C)W″ to get h₁∈S₄(L) with h₁^τ≡g₁ mod l; apply Deligne–Serre in weight four.
6. In every case pass from the characteristic-zero eigenvector to a primitive form f of level M|N with a(p)≡b(p) for p∤2Nr by old/newform theory (R16.6, Tau Ceti ModularForms layers 4 and 6).

**Direct prerequisites.** `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`, `AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`, `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.5`, `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical`, `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-witness`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`, `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`, `AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation`, `AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- In dyadic case (iii), b(2)≠0 violates the ν=2 hypothesis; this lemma gives no exact-level conclusion.
- The exact conductor equality follows after recognition, not from the existence of an old eigenform.
- The output f has trivial character although χ is odd; this is consistent because χ(p)≡1≡p^{k−1} mod l for odd p.
- If r≠1 and b(r)≡1 mod l the lemma does not apply: an eigenvalue λ_r=±1 cannot be excluded and r may remain in the level.

**Sources.**

- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §1, Lemma, printed p. 302 (PDF p. 4). Exact hypotheses (text layer renders ≠, ≢ as '6=', '6≡', superscripts flattened: 2ν N r is 2^νNr, χ2 is χ²).
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §1, Lemma, printed p. 302 (PDF p. 4). Exact conclusion: f in Prim_k(N), weight k=2 or 4, with ρ_f≅ρ_g.
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §1, printed p. 301 (PDF p. 3). Exact definition of Prim: normalized newforms of exact level N, trivial character when χ is omitted; this is the node's 'exact level N and trivial character'.
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §1, proof of the Lemma, step (iii), printed p. 302 (PDF p. 4). Proof step: RT print N(ρ_f)≤M; the cited Carayol–Livné result gives divisibility, which the node uses; either suffices since M|N.
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §1, preliminary remark, printed p. 302 (PDF p. 4). Proof step: removal of the auxiliary prime r via the Atkin–Lehner sign (N 0 r is N′r in the text layer).
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §1, Case 2 (ν=2), printed p. 304 (PDF p. 6). Proof step: where b(2)=0 is used to make the Atkin–Li operator at 2 an involution fixing g.

**Atlas planet:** Rohrlich–Tunnell weight and level lemma.

**Implementation status:** `unchecked`.

### The real-quadratic odd-lift trick

**Declaration:** `TauCeti.GL2Transfer.serre_odd_trick`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`.

Let r̄₀=Ind_{G_K}^{G_Q}φ, φ̃, N and ν be as in teichmuller-conductor with K real quadratic (D>0) and D odd or divisible by 8; let ∞₁,∞₂ be the real places of K. There exist a prime ideal 𝔯 of K of degree one, prime to 2N, and a quadratic Hecke character ξ of K ramified precisely at ∞₁ and 𝔯, with φ̃(𝔯)≠1. Put r=N𝔯, an odd prime not dividing N and split in K, and g=Σb(n)q^n where L(s,φ̃ξ)=Σb(n)n^{−s}. Then Ind(φ̃ξ) is odd because ξ has mixed signature, its Artin conductor is 2^νN·r, and g∈Prim₁(2^νNr,χ) with χ the product of the Kronecker symbol at D and the (odd) Legendre symbol at r. Since ξ≡1 mod l, ρ_g≅r̄₀ and N(ρ_g)=N. Moreover b(r)≡φ̃(𝔯′)=φ̃(𝔯)^{−1}≢1 mod l, in case (ii) b(n)=0 for even n, and in case (iv) b(2)≢0 mod l. Thus g satisfies every hypothesis of rt-technical-lemma. This controlled auxiliary ramification is the Serre trick used by Rohrlich–Tunnell, distinct from Wiese's trace-zero choice of auxiliary primes.

**Hypotheses.**

- r̄₀=Ind_{G_K}^{G_Q}φ is irreducible with linear-dihedral image; φ̃, N, ν are as in teichmuller-conductor, at the fixed prime l above 2.
- K is real quadratic (D>0), with real places ∞₁, ∞₂.
- D is odd or divisible by 8, so the dyadic case is (i), (ii) or (iv).
- Degree-one primes are taken in a prescribed narrow ray class modulo 4f(φ̃) (Chebotarev).

**Construction or proof.**

1. Let C be the narrow ray class group of K modulo 4f(φ̃) and c∈C the class of principal (γ) with γ negative at ∞₁, positive at ∞₂ and γ≡1 mod 4f(φ̃); c has order 1 or 2.
2. In the wide ray class group C′ modulo f(φ̃) choose an odd-order class b′ with φ̃(b′)≠1 and an odd-order preimage b∈C; by Chebotarev choose a degree-one prime 𝔯∈bc prime to 2N. Then 𝔯²∈b², so φ̃(𝔯)²=φ̃(b′)²≠1 and φ̃(𝔯)≠1.
3. With n the odd order of b, 𝔯^n∈c has a generator ρ negative at ∞₁, positive at ∞₂ and ≡1 mod 4f(φ̃); the quadratic character ξ of K(√ρ)/K is unramified above 2 (ρ≡1 mod 4), ramified at 𝔯 (v_𝔯(ρ)=n odd) and at ∞₁ only. N(ρ)=−r^n≡1 mod 4 gives r≡3 mod 4.
4. f(φ̃ξ)=f(φ̃)𝔯, so the Artin conductor is 2^νN·r; the determinant is the Kronecker character of D times ξ restricted to Q, the odd Legendre character at r. Apply dihedral-artin, quadratic-induction (L(s,AIθ)=L_K(s,θ)) and q-weight-one to obtain g with these coefficients.
5. b(r)=(φ̃ξ)(𝔯′) because ξ is ramified at 𝔯; ξ(𝔯′)=±1≡1 mod l and φ̃(𝔯′)=φ̃(𝔯)^{−1} is a nontrivial odd-order root of unity, not ≡1 mod l. The dyadic conditions hold as for D<0 because ξ is unramified above 2.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`, `ArithmeticGaloisRepresentations:R01.3`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- The untwisted real-quadratic complex induction is even and does not give a holomorphic weight-one form.
- The quadratic ξ disappears modulo two but its auxiliary characteristic-zero conductor is retained.
- The mixed-signature generator ≡1 mod 4 is produced for 𝔯^n with n odd, not for 𝔯 itself.
- The auxiliary prime satisfies r≡3 mod 4, so the nebentypus of g is odd as weight one requires.

**Sources.**

- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, proof of the Theorem, case D>0, printed p. 307 (PDF p. 9). Exact claim (text layer renders 𝔯 as r and ≠ as '6=').
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, proof of the Theorem, case D>0, printed p. 307 (PDF p. 9). Exact level and character of g; the node adds that the Legendre character at r is odd (r≡3 mod 4).
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, proof of the Theorem, case D>0, printed p. 307 (PDF p. 9). Exact: the condition b(r)≢1 mod l.
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, construction of 𝔯 and ξ, printed p. 308 (PDF p. 10). Exact: the mixed-signature generator is for 𝔯^n with n the odd order of b (text layer 'rn'), not for 𝔯.
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), Remark 1, printed p. 308 (PDF p. 10). Exact: why the twisted induction is odd and gives weight one.

**Implementation status:** `unchecked`.

### Rohrlich–Tunnell characteristic-two modularity

**Declaration:** `TauCeti.GL2Transfer.rohrlich_tunnell`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.6/rohrlich-tunnell`.

Fix Q̄⊂C and a prime ideal l above 2 (the coefficient place λ). Let r̄₀:G_Q→GL₂(F̄₂) be continuous and irreducible with linear-dihedral image (so det r̄₀=1), K the uniquely determined quadratic field with r̄₀=Ind_{G_K}^{G_Q}φ, D its discriminant, N=N(r̄₀) the (odd) prime-to-two conductor, ν defined by |D|·N_{K/Q}f(φ̃)=2^νN, and k=2 if ν∈{0,2}, k=4 if ν=3 (Serre's weight, which RT cite from Serre 1987, p. 188). If D is odd or divisible by 8, that is in cases (i), (ii) and (iv) of teichmuller-conductor, there is f∈Prim_k(N), a normalized newform of exact level N, trivial character and weight k, with ρ_f≅r̄₀ at l. Thus odd D gives weight 2 (ν=0 or 2) and 8|D gives weight 4 (ν=3). For D<0 use the odd induction of φ̃; for D>0 use serre-odd-trick and remove its auxiliary prime with the technical lemma. The theorem makes no assertion when D≡4 mod 8 (case (iii)); the authors know neither examples nor counterexamples there. A projective-dihedral r̄ with nontrivial determinant is outside the theorem and is reached only through determinant-untwist, with recomputed level and character.

**Hypotheses.**

- A fixed embedding Q̄⊂C and a prime ideal l of the algebraic integers above 2 (the coefficient place λ).
- r̄₀:G_Q→GL₂(F̄₂) is continuous and irreducible, and its linear image is a dihedral group (this forces det r̄₀=1).
- K is the uniquely determined quadratic field with r̄₀=Ind_{G_K}^{G_Q}φ and D is its discriminant; D is odd or divisible by 8.
- N=N(r̄₀) is the prime-to-2 Artin conductor; ν is defined by |D|·N_{K/Q}f(φ̃)=2^νN; k=2 if ν∈{0,2} and k=4 if ν=3.

**Construction or proof.**

1. Apply teichmuller-conductor: D odd or 8|D means case (i), (ii) or (iv), so ν=2 forces case (ii) and ν=3 forces case (iv).
2. D<0: Ind φ̃ is odd; dihedral-artin, quadratic-induction and q-weight-one give g=Σb(n)q^n with L(s,φ̃)=Σb(n)n^{−s} in Prim₁(2^νN,χ_D), χ_D the Kronecker symbol at D, and ρ_g≅r̄₀, so N(ρ_g)=N. In case (ii) φ̃ is ramified at the inert prime above 2, so b(n)=0 for even n; in case (iv) b(2)=φ̃(𝔭) is a root of unity, nonzero mod l. Apply rt-technical-lemma with r=1.
3. D>0: serre-odd-trick supplies g∈Prim₁(2^νNr,χ) satisfying every hypothesis of rt-technical-lemma; apply it.
4. Keep case (iii) out: φ̃ is unramified at the prime above 2, so b(2)≠0 violates the ν=2 hypothesis and formula (3) in the proof of the lemma fails, exactly as the source explains.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Odd D gives weight two in both odd cases: case (i) with ν=0, and case (ii) (D≡5 mod 8, φ̃ ramified at the inert prime 2O_K) with ν=2.
- For 8|D the prescribed weight is four; D≡4 mod 8 is not smuggled into the theorem.
- The node asserts neither the conclusion nor its failure for D≡4 mod 8 (source Remark 3).
- The trivial-character conclusion matches det r̄₀=1; a twist r̄₀⊗ξ with ξ≠1 is not covered.

**Sources.**

- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, Theorem, printed p. 307 (PDF p. 9). Exact theorem; ρ is RT's linear-dihedral representation and Prim_k(N) means exact level N and trivial character.
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, paragraph before the Theorem, printed p. 307 (PDF p. 9). Exact definition of k by ν and trivial character, cited by RT from Serre 1987 p. 188 (the preceding ε is lost in the text layer).
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), §2, proof, case D<0, printed p. 307 (PDF p. 9). Proof step: the dyadic Fourier conditions in cases (ii) and (iv).
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), Remark 2, printed p. 308 (PDF p. 10). Exact reason case (iii) is excluded.
- [David E. Rohrlich and Jerrold B. Tunnell, An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf), Remark 3, printed p. 308 (PDF p. 10). Exact: the theorem's status in case (iii) is open; the node asserts nothing there.

**Atlas planet:** Rohrlich–Tunnell theorem.

**Implementation status:** `unchecked`.

### Odd characteristic-zero lifts of mod-two dihedral representations

**Declaration:** `TauCeti.GL2Transfer.wiese_odd_lift`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`.

Let r̄:G_Q→GL₂(F̄₂) be continuous and dihedral in Wiese's sense: r̄≅Ind_{G_K}^{G_Q}χ for a quadratic field K and a character χ:G_K→F̄₂^× with χ≠χ^σ (equivalently r̄ is irreducible with projective image D_n, n≥3; n is odd in characteristic two). Wiese's oddness hypothesis is vacuous in characteristic two. Let m be the order of r̄(G_Q), ζ_m a primitive m-th root of unity and P any prime of Q(ζ_m) above 2. (Wiese Lemma 3) There is an odd dihedral r̂:G_Q→GL₂(Z[ζ_m]) whose reduction modulo P is isomorphic to r̄: r̂=Ind χ̃ for the same-order lift χ̃ of χ when this is odd, and otherwise (which forces K real quadratic) r̂=Ind(χ̃ξ) with ξ the quadratic character of K(√λ)/K for some λ∈O_K of negative norm. No conductor is controlled in this general case. (Wiese Lemma 2) If moreover r̄ is unramified at 2 with conductor N, then either (a) some such r̂ has Artin conductor N, or (b) K is real quadratic and there is an infinite set S of primes ℓ, which may be taken odd, split in K and prime to N, with tr r̄(Frob_ℓ)=0, such that for each ℓ∈S some odd dihedral r̂_ℓ:G_Q→GL₂(Z[ζ_m]) of Artin conductor Nℓ reduces to r̄ modulo P. The result covers projective-dihedral images (scalar twists of linear-dihedral ones), not only the linear-dihedral images of Rohrlich–Tunnell.

**Hypotheses.**

- r̄:G_Q→GL₂(F̄₂) is continuous and dihedral in Wiese's sense: irreducible and induced from a character χ:G_K→F̄₂^× of a quadratic field K with χ≠χ^σ (equivalently, projective image D_n with n≥3; n is odd in characteristic two).
- Wiese's oddness hypothesis is vacuous in characteristic two (det r̄(c)=1=−1); the source lemmas hold for every prime p and are specialised here to p=2.
- Coefficients: m is the order of r̄(G_Q), the lift takes values in GL₂(Z[ζ_m]), P is any prime of Q(ζ_m) above 2, and Z[ζ_m]/P is embedded in F̄₂ compatibly with the values of χ.
- For the Lemma 2 refinement r̄ is unramified at 2 and N is its conductor (prime-to-2 Artin conductor).
- Lemma 3 assumes nothing at 2 and gives no control of the Artin conductor of the lift.

**Construction or proof.**

1. Lift χ to the unique character χ̃:G_K→Z[ζ_m]^× of the same order reducing to χ modulo P. Then r̃=Ind χ̃ reduces to r̄; when r̄ is unramified at 2, r̃ has Artin conductor N, because χ and χ̃ have the same conductor f and f(Ind)=Norm(f)·|D|. If r̃ is odd this gives Lemma 3 and Lemma 2(a).
2. If r̃ is even then K is real: for K imaginary a complex conjugation lies outside G_K and has determinant −1. The kernel field of χ̃ is then totally real. For Lemma 3 take λ∈O_K with Norm(λ)<0. The character ξ of K(√λ)/K satisfies ξ(c)ξ^σ(c)=−1, so Ind(χ̃ξ) is odd, and it reduces to r̄ because ξ≡1 modulo P.
3. For Lemma 2(b) take degree-one primes Λ=(λ) with Norm(λ)<0 and λ≡1 modulo 4D·f·σ(f). Chebotarev in the narrow ray class group gives infinitely many. Then χ(Λ)=χ(σΛ)=1, so r̄(Frob_ℓ)=1 and its trace is 0 in characteristic two. K(√λ)/K is unramified at 2 and at the primes dividing Df and is tamely ramified at Λ, so Ind(χ̃ξ) is odd of Artin conductor Nℓ. Wiese imposes λ≡1 only modulo 4Df; when f≠σ(f) that does not force χ(σΛ)=1, so the σ-stable modulus is used here.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Even real-quadratic induction is repaired by a character trivial modulo two.
- The general Lemma 3 does not promise the conductor of Lemma 2.
- If χ is ramified at Q but not at σ(Q), an auxiliary prime chosen only with λ≡1 mod 4Df can have r̄(Frob_ℓ)=diag(1,ζ) with ζ≠1, whose trace 1+ζ is nonzero in characteristic two; the σ-stable congruence excludes this.

**Sources.**

- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Lemma 2, printed p. 126 (PDF p. 4). Hypotheses of Lemma 2, specialised to p=2 (oddness is then vacuous). 'Fp' is the text layer's rendering of F̄_p; N is Serre's prime-to-p conductor and m the order of the image.
- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Lemma 2(b), printed p. 126 (PDF p. 4). Exact source for alternative (b); alternative (a) is the preceding item of the same lemma (lift of Artin conductor N). 'ρb' is the text layer's ρ̂. The node adds that ℓ can be taken odd, split in K and prime to N, which the proof gives once the modulus is corrected.
- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Lemma 3 and proof, printed p. 127 (PDF p. 5). Exact source for the general lift, specialised to p=2; the source says just before it that the Artin conductor is not controlled.
- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), proof of Lemma 2, printed p. 127 (PDF p. 5). Proof step only. With Wiese's congruence λ≡1 mod 4Df this needs χ(σΛ)=1, which holds only if λ≡1 mod σ(f) as well; the node uses the σ-stable modulus 4D·f·σ(f) (source issue recorded).

**Atlas planet:** Wiese’s dihedral lifting lemma.

**Implementation status:** `unchecked`.

### Unramified mod-two dihedral Katz weight one

**Declaration:** `TauCeti.GL2Transfer.unramified_katz`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz`.

Let r̄:G_Q→GL₂(F̄₂) be continuous and dihedral in Wiese's sense, unramified at 2, with conductor N=N(r̄) (the prime-to-2 Artin conductor, an odd integer) and ε=det r̄ viewed as a character of (Z/NZ)^×. Then there is a cuspidal Katz eigenform f∈S₁(Γ₁(N),ε,F̄₂)_Katz for all Hecke operators, which may be normalised (a₁=1), whose associated Galois representation is isomorphic to r̄: a_ℓ(f)=tr r̄(Frob_ℓ) and ε(ℓ)=det r̄(Frob_ℓ) for primes ℓ∤2N. This is Wiese Theorem 9 for p=2: the level is the conductor of r̄ and the character is det r̄. No condition at 2 beyond unramifiedness is imposed, so representations exceptional at 2 (restriction to a decomposition group at 2 a sum of two copies of one unramified character, for example K=Q(√229) with 2 inert) are included. The theorem does not assert a characteristic-zero weight-one form of level N reducing to r̄. Wiese's Introduction states, without proof, that none exists when K is real quadratic of discriminant N with fundamental units of norm −1 (example Q(√229)). The oldform and descent inputs (Wiese Proposition 4, Corollary 5, Proposition 7, Corollary 8) are imported through the R15.2 request; the new arithmetic combination is this theorem.

**Hypotheses.**

- r̄:G_Q→GL₂(F̄₂) is continuous and dihedral in Wiese's sense (irreducible, induced from a character of a quadratic field); oddness is vacuous in characteristic two.
- r̄ is unramified at 2 (equivalently, its minimal weight k(r̄) is one).
- N=N(r̄) is the prime-to-2 Artin conductor (odd); ε=det r̄ is viewed as a character of (Z/NZ)^×, which here equals the prime-to-2 part of det r̄.
- Katz cusp forms are taken in Wiese's non-compactified Γ₁(N) sense over F̄₂, with N invertible.
- The source theorem holds for every prime p; only p=2 is used here, where alternative (b) of Lemma 2 can occur.

**Construction or proof.**

1. If Wiese Lemma 2(a) applies, R17.5/q-weight-one gives a weight-one newform of level N and character det r̂ with Galois representation r̂. Its reduction modulo P is the required eigenform; Katz forms are not needed in this case.
2. Otherwise Lemma 2(b) applies. For ℓ∈S, take the weight-one newform f^{(ℓ)} of level Nℓ attached to r̂_ℓ; a_q(f^{(ℓ)})≡0 mod P for q∈S∖{ℓ}. Corollary 5 gives an eigenform of level Nℓ³ with a_ℓ=0 and the same a_q for q≠ℓ. Its reduction g^{(ℓ)}∈S₁(Γ₁(Nℓ³),ε,F̄₂)_Katz has a_q=0 for all q∈S and Galois representation r̄.
3. For q|N the coefficients a_q(f^{(ℓ)}) lie in a finite set independent of ℓ: they are traces on inertia invariants of representations with image in a fixed finite group. Choose ℓ₁≠ℓ₂ in S whose reductions g₁,g₂ agree at every q|N. At q∤Nℓ₁ℓ₂ (including q=2) the coefficients agree by congruence of traces; at q=ℓ₁,ℓ₂ both vanish. Hence g₁ and g₂ have equal q-expansions.
4. Map g₁ and g₂ to level Nℓ₁³ℓ₂³ by the map of Proposition 7. By the q-expansion principle they give one form h, which is independent of the ℓ₁³- and the ℓ₂³-level structure, hence of m=ℓ₁³ℓ₂³. Proposition 7 and Corollary 8 (2∤Nm) descend h to an eigenform of level Γ₁(N) and character ε. R01.5 identifies its Galois representation with r̄ from full characteristic polynomials; trace alone is insufficient in characteristic two.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization`, `AlgebraicModularFormsAndSerreWeights:R15.1/cusp-ideal-section-forms`, `AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem`, `AlgebraicModularFormsAndSerreWeights:R15.2`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `ArithmeticGaloisRepresentations:R01.5`, `AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions`, `AlgebraicModularFormsAndSerreWeights:R15.6/modularity-formulations-and-determinant`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- An exceptional Frobenius at two (e.g. K=Q(√229), 2 inert) is included; distinguish this from the excluded characteristic-zero same-level lift.
- Ramified-at-two minimal-weight modularity uses Wiese Theorem 10’s deep weight/level lowering, outside this elementary interface.
- Two arbitrary auxiliary primes need not give equal q-expansions; the pigeonhole on the coefficients at q|N is required before Proposition 7 applies.

**Sources.**

- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Theorem 9, printed p. 130 (PDF p. 8). Exact for p=2 ('²' is the text layer's ε, 'Fp' is F̄_p): level Γ₁(N) with N the conductor, character det r̄, weight one. Normalisation a₁=1 is from Theorem 1 (p. 124).
- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), proof of Theorem 9, printed p. 131 (PDF p. 9). Proof step: q-expansion comparison at the common level Nℓ₁³ℓ₂³, after the pigeonhole choice of ℓ₁,ℓ₂ on the same page ('two forms ... have the same coefficients at all primes q | N'); then Corollary 8.
- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Proposition 7, printed p. 129 (PDF p. 7). Descent criterion used in the last proof step, imported through the R15.2 request; hypotheses there: N, m coprime and R containing the Nm-th roots of unity and 1/(Nm).
- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Introduction, printed p. 124 (PDF p. 2). Supports the non-liftability remark: the source then names Q(√229) as an example and gives no proof. The stray '√' comes from the Q(√229) on the next line of the text layer.

**Atlas planet:** Dihedral Katz weight-one theorem.

**Implementation status:** `unchecked`.

### Characteristic-two solvable residual modularity

**Declaration:** `TauCeti.GL2Transfer.qualitative_residual_modularity`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.6/qualitative-residual-modularity`.

Every continuous absolutely irreducible r̄:G_Q→GL₂(F̄₂) with solvable projective image is realized by a holomorphic cuspidal weight-one newform, after choosing a coefficient number field, λ|2, a residue-field embedding and a stable lattice. The newform's level is the Artin conductor of the chosen odd lift and is not controlled in general. The qualitative proof applies the finite classification (such an r̄ has projective image D_n with n odd ≥3, so it is dihedral in Wiese's sense), Wiese’s odd lift (Lemma 3), and then dihedral Artin weight-one automorphy (Weil–Langlands, as in Wiese's proof of Theorem 1). If one wants a weight≥2 witness, apply the existing R15.5 reduction/true-eigenform result: Eisenstein multiplication for the reduction of a characteristic-zero form, and Hasse powers only when a Katz form is the input and the integral lifting criterion has been met. This broad existence theorem does not claim the exact minimal weight, level or trivial character of the restricted Rohrlich–Tunnell theorem.

**Hypotheses.**

- r̄:G_Q→GL₂(F̄₂) is continuous and absolutely irreducible with solvable projective image; in characteristic two this forces projective image D_n with n odd ≥3.
- No oddness or determinant hypothesis is needed: oddness is vacuous in characteristic two.
- The witness data are chosen: coefficient number field, place λ|2, residue-field embedding into F̄₂ and a stable lattice; the comparison is with the semisimplified reduction.
- The level of the weight-one witness is the Artin conductor of the chosen odd lift and is not controlled; weight and character are not minimised.

**Construction or proof.**

1. Apply solvable-dihedral; use either its explicit scalar untwist and twist back or Wiese’s projective-dihedral odd lift directly.
2. Use the odd complex induction and the weight-one newform dictionary, retaining all coefficient/lattice data.
3. Pass to the existing R15.6 residual-modularity witness; its generic carrier is not rebuilt here.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.6/solvable-dihedral`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`, `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-witness`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- All solvable projective images in characteristic two are covered without an odd determinant assumption.
- The produced witness may have auxiliary level or weight; those are recorded rather than silently minimized.

**Sources.**

- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), proof of Theorem 1, printed p. 131 (PDF p. 9). Exact qualitative step: odd lift (Lemma 3) then weight-one newform. The source uses it only in the ramified case; the argument does not use ramification, so the node applies it to every dihedral r̄.
- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Introduction, printed p. 123 (PDF p. 1). Definition of dihedral used. The step from 'solvable projective image' to 'dihedral' in characteristic two is the finite classification of R17.6/solvable-dihedral and R01.4, not in this source.
- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Lemma 3, printed p. 127 (PDF p. 5). The odd characteristic-zero lift consumed from wiese-odd-lift; no conductor control.

**Atlas planet:** Characteristic-two solvable modularity.

**Implementation status:** `unchecked`.

### Transfer to the weight-at-least-two residual witness

**Declaration:** `TauCeti.GL2Transfer.weight_two_witness`; application; node `GL2AutomorphicRepresentationsAndTransfer:R17.6/weight-two-witness`.

Given either an odd complex weight-one dihedral form reducing to r̄ or the preceding unramified Katz form, obtain the R15.6 residual-modularity witness with some weight k≥2 and its actual primitive level. For the reduction of a characteristic-zero weight-one form, use R15.5's Eisenstein multiplication (E₄≡1 mod 2). For a Katz input in characteristic two, the Hasse invariant has weight one and q-expansion one, so multiplying by a power of it preserves the q-expansion and the residual away-two eigencharacter. Wiese's Introduction uses a single factor (weight 2, which is Serre's weight for r̄ unramified at 2), together with the classicality of Katz forms of weight ≥2 on Γ₁(N). That classicality holds for N≥5, which covers N(r̄) here: an irreducible dihedral r̄ unramified at 2 has N(r̄)≥5. In this blueprint the lifting comes from R15.5’s finite-free integral realization and cohomological lifting criterion, with R15.2's base change (stated at full level n≥3, weight ≥2), so choose the weight and an auxiliary level satisfying that criterion. Multiplication alone does not produce a characteristic-zero eigenform. Apply the DS lemma to the commuting Hecke action over a dominating DVR, then the true-eigenform/old-newform reduction. Record K_f, λ|2, common residue-field embeddings and a stable lattice realizing r̄ semisimply. The character of the witness lifts det r̄ but need not be its Teichmüller lift. This application imports Hasse, DS and the witness definition unchanged.

**Hypotheses.**

- Input: either the reduction modulo λ|2 of an odd characteristic-zero weight-one dihedral newform realising r̄, or the Katz eigenform of unramified-katz in S₁(Γ₁(N),det r̄,F̄₂)_Katz.
- Characteristic two: the Hasse invariant A has weight p−1=1 and q-expansion 1, and Hecke eigenvalues at odd ℓ are unchanged by multiplication by A (ℓ^{k−1}≡1 mod 2).
- Characteristic-zero lifting of the shifted form uses R15.5's finite-free integral realization and cusp-sheaf H¹ criterion, with R15.2's base change, currently stated at full level n≥3 and weight ≥2. The weight and an auxiliary level must be chosen to satisfy it.
- Output: an R15.6 witness of some weight k≥2 with its actual level and a character lifting det r̄ (not necessarily its Teichmüller lift); minimal weight and level are not claimed.

**Construction or proof.**

1. Use the Hasse invariant (R15.3) and the weight-shift lemma (R15.5) for the weight and integral-lifting conditions. k≥2 alone is not the geometric criterion: R15.2's base change is stated at full level n≥3, so pass to an auxiliary full level if needed and record the resulting level.
2. Use DS to lift the residual eigencharacter after finite coefficient extension, without claiming a prescribed eigenvector lift.
3. Use the existing true-eigenform reduction and R01.5 to recognize r̄ from good-prime characteristic polynomials; keep the actual level divisor and all places/embeddings.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.6/qualitative-residual-modularity`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz`, `AlgebraicModularFormsAndSerreWeights:R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one`, `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`, `AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`, `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-witness`, `ArithmeticGaloisRepresentations:R01.5`, `AlgebraicModularFormsAndSerreWeights:R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary`, `AlgebraicModularFormsAndSerreWeights:R15.6/modularity-formulations-and-determinant`, `AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- At p=2 multiplying weight one by H raises weight by one and preserves q-expansion, but does not alone prove characteristic-zero lifting.
- Reduction is compared at the chosen λ; weight one and a generic weight≥2 witness are distinct outputs.

**Sources.**

- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Introduction, printed p. 124 (PDF p. 2). Supports the Hasse-invariant transition from a Katz weight-one form to a classical form of weight ≥2. The source states it at level N_ρ with Serre's weight (2 for r̄ unramified at 2); the node only asks for some weight ≥2 and records the level obtained.
- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Introduction, printed p. 124 (PDF p. 2). Lifting input, stated in the source without a level hypothesis. It holds for Γ₁(N) with N≥5 (author's thesis, Ch. I, footnote 3), which covers N(r̄)≥5 here. In this blueprint it is supplied by R15.2/R15.5's criterion, not taken from this sentence.
- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), proof of Lemma 11, printed p. 132 (PDF p. 10). The same Hasse-then-lift pattern for a Katz eigenform, used by the source in another proof; it is a proof step, not a stated theorem.

**Implementation status:** `unchecked`.

### Residual irreducibility under disjoint base change

**Declaration:** `TauCeti.GL2Transfer.disjoint_irreducibility`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.6/disjoint-irreducibility`.

Let F be a number field and r̄:G_F→GL₂(k̄) be continuous and absolutely irreducible with finite projective image, k̄ algebraically closed. Let M/F be the finite Galois extension fixed by the projective kernel. For any finite E/F linearly disjoint from M over F, the projective image of r̄|_{G_E} equals that of r̄, and the restriction is absolutely irreducible. Since M is contained in the field L fixed by ker r̄, linear disjointness from L (a stronger hypothesis) also suffices. Solvability of E/F by itself does not preserve irreducibility. This is the exact finite-image application exported to Moret–Bailly/potential modularity; the construction of E with prescribed local conditions and disjointness belongs to R23.1.

**Hypotheses.**

- F is a number field and r̄:G_F→GL₂(k̄) is continuous and absolutely irreducible, with k̄ algebraically closed of any characteristic and finite projective image.
- M/F is the finite Galois extension cut out by the kernel of the projective representation; L⊇M is the field cut out by ker r̄.
- E/F is a finite extension, not necessarily Galois or solvable, linearly disjoint from M over F (equivalently E∩M=F, since M/F is Galois).
- Extensions E with prescribed local conditions and disjointness are constructed downstream (PotentialModularityAndCompatibleSystems R23.1), not here.

**Construction or proof.**

1. Use E∩M=F and Galois restriction to see that G_E surjects to Gal(M/F).
2. A line stabilized by the restricted representation would then be stabilized by every projective image element, hence by r̄ itself.
3. Export the sufficient disjointness condition; do not import the downstream extension-construction theorem into this packet.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.4`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- An extension containing the quadratic induction field can make a dihedral representation reducible.
- Disjointness from the projective-kernel field suffices even when the scalar image changes.

**Sources.**

- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2, Digital Math Archive text p. 13 (PDF p. 16). Supporting passage only: shows that a quadratic (solvable) base change alone can destroy irreducibility. The disjointness lemma itself is elementary Galois/group theory proved in the proof steps; no source in the packet states it.
- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), §2, printed p. 125 (PDF p. 3). Supporting passage for the acceptance example only: a dihedral r̄ restricted to G_K is the sum of χ and χ^σ, so E⊇K makes it reducible.

**Implementation status:** `unchecked`.

### The bad-dihedral quadratic restriction condition

**Declaration:** `TauCeti.GL2Transfer.quadratic_restriction`; application; node `GL2AutomorphicRepresentationsAndTransfer:R17.6/quadratic-restriction`.

For a finite-image irreducible rank-two r=Ind_{G_K}^{G_F}θ, with K/F quadratic and coefficients in an algebraically closed field of any characteristic, and a finite E/F: r|_{G_E} is irreducible exactly when G_E is not contained in G_K and θ|_{G_{EK}}≠θ^σ|_{G_{EK}}. If E contains K, the restriction is reducible: it is the sum of the two restricted characters. When K⊄E, the restriction is Ind_{G_{EK}}^{G_E}(θ|_{G_{EK}}), since G_EG_K=G_F, and conjugation by any element of G_E∖G_{EK} acts on θ|_{G_{EK}} as σ does. The index-two irreducibility criterion holds in every characteristic. Restricted to G_{EK} the representation is the sum of the two distinct characters θ and θ^σ, which an element of G_E∖G_{EK} swaps. If they coincide, θ extends to G_E and Frobenius reciprocity gives a one-dimensional quotient. Quadratic or solvable base changes must be checked against this criterion; the same loss of cuspidality occurs in quadratic automorphic induction/base change. Generic induction and Clifford theory remain with InductionRestriction/R01.4; the Layer 4 Mackey criterion there assumes the group order invertible, so it is not used in characteristic two.

**Hypotheses.**

- K/F is quadratic, σ∈G_F∖G_K, and θ:G_K→k̄^× is a continuous character with finite image and θ≠θ^σ, so r=Ind_{G_K}^{G_F}θ is irreducible.
- k̄ is algebraically closed of any characteristic, including F̄₂ for residual representations.
- E/F is a finite extension (not necessarily Galois); EK denotes the compositum; G_E⊄G_K exactly when K⊄E.
- In characteristic zero, or when the image order is invertible in k̄, the criterion is the Tau Ceti Layer 4 Mackey criterion. In residual characteristic two (image of even order) it is proved directly, because Layer 4 assumes |G| invertible.

**Construction or proof.**

1. Apply the representation-level Mackey decomposition (InductionRestriction Layer 3, valid over any commutative ring) to G_E and the normal index-two subgroup G_K. One double coset gives Ind_{G_{EK}}^{G_E}θ when K⊄E; two give θ⊕θ^σ restricted to G_E when K⊆E.
2. Prove the index-two criterion directly. In characteristic zero it also follows from the Layer 4 normal-subgroup corollary; in characteristic two use the eigenline-swapping argument and, for the converse, the extension of a σ-invariant character.
3. Compare the criterion with quadraticInduction_baseChange and the cyclic self-twist cuspidality node; pass the actual criterion to compatible-system and potential-modularity applications, not a blanket solvable-extension assertion.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula`, `tauceti:TauCeti.simple_indFDRep_ofLinearCharacter_iff`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Restriction to K of an irreducible quadratic induction is reducible.
- Even E not containing K can identify the two restricted characters; exclude that case explicitly.

**Sources.**

- [Gabor Wiese, Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), §2, printed p. 125 (PDF p. 3). Supporting passage: the dihedral form Ind χ with χ≠χ^σ ('6=' is the text layer's ≠), over an algebraically closed k of any characteristic. The restriction criterion itself is not stated in the source.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2, Digital Math Archive text p. 13 (PDF p. 16). Supports the E⊇K case and the matching loss of cuspidality under quadratic base change; the general criterion is the Mackey argument in the proof steps.

**Implementation status:** `unchecked`.

### Base change of a supplied compatible system

**Declaration:** `TauCeti.GL2Transfer.compatible_base_change`; comparison; node `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-base-change`.

Let {ρ_λ} be a compatible family over F with a common coefficient field and good-place characteristic polynomials P_v, and π a GL₂ automorphic representation matching those polynomials in the fixed arithmetic normalization. For a finite solvable Galois E/F, restriction to G_E matches BC_{E/F}(π) at every good w|v (π_v and ρ_λ unramified at v, v prime to the residue characteristic of λ) by the Frobenius power formula: if P_v has roots α,β, the new polynomial has roots α^{f(w/v)},β^{f(w/v)}. On the automorphic side this is the unramified local lifting π(µ,ν)↦π(µ∘N,ν∘N) at each prime-cyclic step; on the Galois side it is Frob_w↦Frob_v^{f(w/v)}. Keep the residual cuspidality/irreducibility conditions from cyclic-base-change and disjoint-irreducibility; apply quadratic-restriction for dihedral exceptions. This theorem takes the compatible system as data. Existence of an attached family, its integral lattices and the geometric realization belong to R19/R24 and are not proved here.

**Hypotheses.**

- {ρ_λ} is a supplied family of continuous semisimple representations G_F→GL₂(M̄_λ) over a common coefficient field M, with good-place characteristic polynomials P_v in M[X] independent of λ.
- π is an automorphic GL₂ representation over F whose unramified Satake data at good v match P_v in the fixed arithmetic normalisation (arithmetic Frobenius, R16.2/R16.3 scaling); twists by powers of q_v^{1/2} are compatible with f-th powers since q_w=q_v^{f}.
- E/F is finite solvable Galois, and BC_{E/F} is defined along a prime-cyclic tower (R17.4/solvable-base-change), independently of the tower.
- Good w|v means π_v and ρ_λ are unramified at v and v does not divide the residue characteristic of λ; v may ramify in E.
- Existence of the family, lattices and geometric realisation is not part of the node.

**Construction or proof.**

1. Use arithmetic Frobenius restriction Frob_w→Frob_v^{f(w/v)} and the local cyclic/tower transfer formulas.
2. Compare full characteristic polynomials for every coefficient place, preserving the common coefficient field and normalization.
3. Apply the disjointness or bad-dihedral criterion before passing a cuspidal/irreducible claim downstream.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/disjoint-irreducibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/quadratic-restriction`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.5`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For α=2,β=3,f=2 the new trace is 13 and determinant is 36, not the square of trace 5.
- At residue degree one the good polynomial is unchanged.

**Sources.**

- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2 local lifting, condition (i), Digital Math Archive text p. 9 (PDF p. 12). Gives the unramified case: for unramified µ,ν, µ∘N_{E_w/F_v}(ϖ_w)=µ(ϖ_v)^{f(w/v)}, so Satake roots are raised to the f-th power ('µ0' is the text layer's µ′). Prime-degree cyclic steps; solvable towers come from R17.4.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2 after properties (A)–(F), Digital Math Archive text p. 14 (PDF p. 17). Supporting passage: base change corresponds to restriction on the Galois/Weil side, with central character ↔ determinant. Langlands' compatibility statement (G), text p. 16, concerns Artin-type Weil-group representations; the ℓ-adic family comparison at good places is the node's application.
- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 §1 before Definition 1.1, eq. (1.1), printed p. 199 (PDF p. 215). OCR text ('f,'=f_v, 'wlv'=w|v; the hyphenated 'de-scribed' joined). The display that follows, (t_{π,v})^{f_v}=t_{Π,w}, is the Frobenius power formula used, for GL(n) and cyclic E/F.

**Implementation status:** `unchecked`.

### Automorphic descent with a consistent compatible-system twist

**Declaration:** `TauCeti.GL2Transfer.compatible_descent`; comparison; node `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-descent`.

Let E/F be cyclic of prime degree ℓ, η a character of F^×N(A_E^×)\A_F^× of order ℓ, and Π cuspidal over E with Π^σ≅Π. By AC89 Theorem 4.2(d) (Langlands Lemma 11.6(b) for GL₂), the cuspidal descents of Π are exactly π⊗η^i, 0≤i<ℓ, pairwise non-isomorphic, for one chosen descent π. Let {r_λ} be supplied semisimple representations of G_F over a common coefficient field whose restrictions to G_E match the family attached to Π. A matching descent is a single index i, independent of λ, such that the good-place characteristic polynomials of π⊗η^i agree with those of every r_λ. Under that equality, R01.5 identifies each r_λ with the corresponding member attached to π⊗η^i, and i is unique. Suppose each r_λ|_{G_E} is absolutely irreducible and a family {ρ_{π,λ}} attached to π is supplied. Then for each λ, r_λ≅ρ_{π,λ}⊗η^{i(λ)} for some i(λ) (Schur's lemma on the cyclic step). If {r_λ} is compatible, a match at one λ forces the same i at every λ, because both families have λ-independent polynomials. Galois descents chosen independently at different λ, without this common index, do not give one automorphic descent matching the family. In a solvable tower impose this condition at each prime-cyclic step, with its actual descent fiber and local data.

**Hypotheses.**

- E/F is cyclic of prime degree ℓ with generator σ, and η is a character of A_F^×/F^×N(A_E^×) of order ℓ, identified with a character of Gal(E/F) by class field theory.
- Π is a cuspidal automorphic GL₂ representation over E with Π^σ≅Π.
- {r_λ} are continuous semisimple representations G_F→GL₂(M̄_λ) over a common coefficient field M, and r_λ|_{G_E} matches the family attached to Π at good places.
- For the Galois-side twist statement, r_λ|_{G_E} is absolutely irreducible and a family {ρ_{π,λ}} attached to a descent π is supplied as data (its existence belongs to R19/R24).
- Good places exclude ramification of π, of η, of r_λ and the residue characteristic of λ.

**Construction or proof.**

1. Use cyclic-descent (AC89 Thm 4.2(d)/Langlands Lemma 11.6(b)) to obtain π, and cyclic-descent-fibers (AC89 Thm 3.1) to enumerate its ambiguity π⊗η^i.
2. Use the common polynomial data to choose and check one index across the entire family; neither arbitrary character choices nor determinant alone at degree two suffice. With r_λ|_{G_E} absolutely irreducible, Hom_{G_E}(ρ_{π,λ},r_λ) is a line on which G_F acts through Gal(E/F), which gives the twist.
3. Apply full-polynomial recognition (R01.5) to identify each member, and iterate only after the stepwise matching condition is met.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent`, `ArithmeticGaloisRepresentations:R01.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- A quadratic determinant does not distinguish π from π⊗η.
- Two different choices at two coefficient places do not constitute a compatible descent over a common coefficient field.

**Sources.**

- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 Theorem 4.2(d), printed p. 202 (PDF p. 218). OCR text, read on the page image as: '(d) Assume Π is cuspidal, Π≅Π∘σ. Then there is π cuspidal lifting to Π; all such π are conjugate by tensor product by a power of η; they satisfy π≇π⊗η.' Exact source for the descent and its fibre (GL(n), cyclic of prime degree).
- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 Theorem 3.1, printed p. 201 (PDF p. 217). OCR of 'Then π′=π⊗χ, for some character χ of F^×N(A_E^×)\A^×', the conclusion of the fibre theorem for cuspidal π,π′ with (t_{π,v})^{f_v}=(t_{π′,v})^{f_v} almost everywhere.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §11 Lemma 11.6(b), Digital Math Archive text p. 151 (PDF p. 154). GL₂ form of the same descent: exactly ℓ descents ('`' is the text layer's ℓ); property (C) on text p. 14 identifies them as π⊗ω.
- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), proof of Lemma 8.3.2, printed p. 452 (PDF p. 300). Consumer pattern (GSp₄/GL₄): after automorphic descent by AC89 Thm 4.2, the attached Galois representation is twisted by a character of the cyclic step to match ρ, using irreducibility of the restriction. The node is the GL₂ family version.

**Implementation status:** `unchecked`.

### Transfer interface for potential modularity

**Declaration:** `TauCeti.GL2Transfer.potential_modularity_interface`; application; node `GL2AutomorphicRepresentationsAndTransfer:R17.6/potential-modularity-interface`.

Let E/F be a finite solvable Galois extension with the prescribed local completions and disjointness hypotheses supplied by potential modularity, ρ a rank-two Galois representation of G_F, and Π a cuspidal automorphic representation over E matching ρ|_{G_E} at almost all places. Export the following conditional interface. Irreducibility survives under the disjointness criterion. Local transfer uses the exact completion-wise restriction (strong lifting at each prime-cyclic step). Descent to F goes through a prime-cyclic tower. At each step, once the cuspidal representation over the upper field matches the restriction of ρ there, its invariance under the cyclic step is automatic: for Π, Π^τ matches (ρ|_{G_E})^τ≅ρ|_{G_E}, so Π^τ≅Π by strong multiplicity one. AC89 Theorem 4.2(d) then gives a cuspidal descent with its ℓ twists. What is not automatic is the stepwise consistent character matching of compatible-descent. It needs absolute irreducibility of the restriction and representations attached to the intermediate descents; without them, Galois descent of ρ does not identify which automorphic twist matches. Extension construction, potential automorphy and compatible-family existence stay with R23/R24.

**Hypotheses.**

- E/F is a finite solvable Galois extension with a chosen prime-cyclic subnormal tower, and the prescribed local completions/splitting and disjointness are supplied by the potential-modularity owner (R23).
- ρ is a continuous rank-two representation of G_F, Π is a cuspidal automorphic GL₂ representation over E matching ρ|_{G_E} at almost all places, and ρ|_{G_E} is absolutely irreducible (for example by disjoint-irreducibility).
- Representations attached to the intermediate descents are supplied as data when the twist is matched (R19/R24); compatible-descent's common-index condition is checked at each step.
- Non-Galois (e.g. non-normal cubic) extensions are outside this interface.

**Construction or proof.**

1. Consume the extension/local/disjointness data as hypotheses rather than reconstructing the downstream geometric theorem.
2. Apply prescribed-local-base-change and disjoint-irreducibility; derive invariance of Π under each cyclic step from matching with ρ|_{G_E} and R16.4 strong multiplicity one.
3. Apply compatible-descent step by step, after its common-index condition has been checked with the supplied attached representations.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.4/prescribed-local-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/disjoint-irreducibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-descent`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- A non-Galois cubic extension uses cubicBaseChange, not the solvable-Galois tower interface.
- The interface exports sufficient conditions; Galois descent of ρ gives automorphic invariance and existence of some descent, but not by itself the matching twist.

**Sources.**

- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 Theorem 4.2, printed p. 202 (PDF p. 218). OCR ('ElF'=E/F, '1'=l). Heading of the cyclic prime-degree base change/descent theorem whose part (d) is the automorphic descent consumed stepwise; the tower, disjointness and potential-modularity data are the node's interface hypotheses.
- [James Arthur and Laurent Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Chapter 3 Theorem 5.1, printed p. 212 (PDF p. 228). OCR ('ir'=π, 'II'/'I'=Π, 'r'=π). Supplies the all-place local compatibility used for completion-wise restriction at each prime-cyclic step.
- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), proof of Lemma 8.3.2, printed p. 452 (PDF p. 300). Consumer statement showing how potential-modularity arguments use AC89 stepwise along a solvable tower (GSp₄/GL₄ there; GL₂ here).

**Implementation status:** `unchecked`.


Layer status: **planned**. Every current stage target has a precise declaration node and its prerequisite chains end in a read baseline/supplier, an explicit request, or a named gap. The target-level pass is complete; the stage is not closed.

Closure work:

- Write the exact requested Katz auxiliary-level q-expansion descent and Hecke stabilization formulations in R15.2.
- Obtain the Tunnell 1978 globalization input to the late extraordinary dyadic comparison, after Artin automorphy.
- Refine Rohrlich–Tunnell’s three dyadic computations and conditional compatible-system interfaces once the arithmetic/automorphic supplier carriers are compiled; no claim of general minimal-weight level lowering.

## Supplier requests

These contracts use the suppliers’ existing carriers. A request records the exact interface needed by the listed consumers.

### `GL2AutomorphicRepresentationsAndTransfer:R16.1`

The GL₂ specialisation over number fields of the generic carriers: chosen compact subgroups, Haar and quotient measures, the central-character quotient and finite-level function-space identifications, agreeing with AutomorphicFormsOnReductiveGroups AF.2. Generic automorphic representations and the restricted-tensor (Flath) factorization are imported from AF.2/automorphic-representation and AF.2/flath-factorization.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.2`

Rank-two local classification, newvectors, arithmetic Hecke normalization and the distinction between principal series, twists of Steinberg and supercuspidal representations.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/norm-exception`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/prescribed-local-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.3`

Arithmetic-normalized rank-two LLC, compatibility of twists, determinants, local factors and Weil–Deligne restriction, including extraordinary dyadic parameters. Also: preservation of L- and ε-factors (fixed ψ, every character twist) by the arithmetic rank-two LLC, and compatibility of the Langlands–Shintani local cyclic base change with restriction of the parameter for octahedral dyadic parameters and every prime degree ℓ.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/local-factors`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/unramified-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/prescribed-local-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tunnell-primitive-globalization`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.4`

GL₂ multiplicity one and strong multiplicity one over number fields for cuspidal and isobaric (χ₁⊞χ₂) representations, with the exact set of places where equality is required; and the GL₂/Hilbert-cohomological specialisation of AF.4/clozel-rationality (conjugate representations and models over a finite extension of the rationality field). The generic rationality definitions are AF.4/rationality-field.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/coefficient-conjugation`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/norm-exception`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/strong-multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/isobaric-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/tower-independence`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/potential-modularity-interface`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.5`

The GL₂ converse theorem over an arbitrary number field with the full Hecke-character twist family, growth, entireness/pole and functional-equation hypotheses, retaining all-place local factors (the n=2 instance of AL.3b, stated with its own hypotheses), as used by JL70 §12 for quadratic induction and inside the JPSS cubic construction; and the Godement–Jacquet standard factors of GL₂ and their twists with continuation and functional equation, imported from AL.2, for local-factors.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/local-factors`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.6`

(a) Over Q: π_∞ is the weight-one limit of discrete series (parameter 1⊕sign) exactly for holomorphic weight-one newforms (AF.5/gl2-dictionary gives the adelization for k ≥ 1 but identifies π_∞ only for k ≥ 2); newform level equals the conductor of π and nebentypus equals the central character, compared with Tau Ceti ModularForms Layer 4. (b) The totally real holomorphic parallel-weight-one extension. (c) The Hilbert cohomological weight conventions used by definite-infinity.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tr-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz`.

### `GL2AutomorphicRepresentationsAndTransfer:R17.1`

Quaternionic local JL: division places correspond to essentially discrete series; local characters correspond to Steinberg twists; real algebraic weights and split-place identifications use the fixed normalization. Also: local JL preserves L- and ε-factors (fixed ψ) after every character twist, with the sign h_v = −1 of JL70 at division places (a character χ∘Nrd of D_v× has the factors of St⊗χ), and JL_v is Aut(C)-equivariant on algebraic types.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/coefficient-conjugation`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/invariant-exchange`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/local-factors`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/norm-exception`.

### `GL2AutomorphicRepresentationsAndTransfer:R17.2`

The actual GL₂/quaternion and prime-cyclic trace comparisons with matching test functions, Haar measures, central characters and every continuous/residual cancellation; this is the engine used below.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`.

### `AlgebraicModularFormsAndSerreWeights:R15.2`

Wiese Proposition 7/Corollary 8 (descent of a Katz form from Γ₁(Nm) to Γ₁(N), for coprime N, m and a ring containing 1/(Nm) and the (Nm)-th roots of unity, iff it is independent of the m-level structure; same q-expansion) and Wiese Proposition 4/Corollary 5 (U_ℓ at auxiliary primes, degeneracy maps, stabilization with the companion matrices and repeated-root cases). T_ℓ for ℓ prime to the level is the existing node R15.2/integral-hecke-operators-from-q-expansions. Optionally, base change for Γ₁(N) cusp forms with N ≥ 5 and k ≥ 2, so that weight-two-witness can stay at level Γ₁(N).

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz`.

### `ArithmeticGaloisRepresentations:G7`

The canonical adjoint representation and its scalar-quotient/traceless comparison in characteristic zero, restriction, determinant and coefficient-map operations; do not confuse the two carriers in characteristic dividing the rank. The adjoint of a local Weil–Deligne parameter, used by adjointLift_local, is taken on the R01.2/ET.6 Weil–Deligne carrier.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`.

### `ArithmeticGaloisRepresentations:R01.1`

Continuous finite-coefficient and finite-image characteristic-zero rank-two representations, coefficient extensions, stable lattices, semisimplified reduction, restriction and character twisting on the canonical carrier.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-projective-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-mod-three-application`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/residual-lt-application`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tr-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/disjoint-irreducibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/solvable-dihedral`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`.

### `ArithmeticGaloisRepresentations:R01.3`

Artin conductors, their induction formula, invariance dimensions, prime-to-p conductor of reduction and ramification under twists.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`.

### `ArithmeticGaloisRepresentations:R01.4`

Finite GL₂/PGL₂ classification over algebraically closed fields, solvable images and irreducibility, characteristic-two odd-order dihedral case, and bad-dihedral restriction criterion; apply it to finite Galois images here.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-mod-three-application`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tunnell-primitive-globalization`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/disjoint-irreducibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/quadratic-restriction`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/solvable-dihedral`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`.

### `ArithmeticGaloisRepresentations:R01.5`

Recognition of semisimple representations by full Frobenius characteristic polynomials, coefficient descent and Brauer–Nesbitt; trace alone is insufficient in characteristic two.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-mod-three-application`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/residual-lt-application`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/weight-two-witness`.

### `AutomorphicLFunctionsAndLocalFactors:AL.3`

GL₃ and GL₂×GL₃ Rankin–Selberg local and global factors, all-place functional equations, vertical-strip bounds, the Jacquet–Shalika pole criterion and nonvanishing on Re s=1 for GL₃. For irreducible unitary generic representations of GL_n and GL_m at any place, ramified finite and archimedean places included, the local Rankin–Selberg L-factor is holomorphic on Re s≥1 (absolute convergence of the local integrals there); R17.4/gl3-recognition uses it for the omitted factors at s=1, beyond the unramified AL.2/jacquet-shalika-satake-bound. The GL_n converse theorem is the proposed AL.3b and is recorded as a gap. The local convergence and factor contracts are now planned by AL.3/rs-local-convergence and AL.3/rs-local-factor; this request retains their implementation and source-proof obligations and the highly ramified T-converse variant.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`.

### `AutomorphicSpectralTheory:AS.6`

The invariant trace formula for GL₂ and D× over a totally real field with test functions whose component at one finite place is a pseudo-coefficient of a supercuspidal representation, with its convergence and summation conditions, as the input to Clozel's limit-multiplicity globalization; that globalization itself is a recorded gap.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/supercuspidal-globalization`.

### `EndoscopicTransferAndUnitaryTraceComparison:ET.6`

The characteristic-zero local Langlands correspondence for GL₃ (and GL₁) over p-adic fields with L- and ε-factors of pairs, to identify the local components of Ad(π) and of AI_{E/F}(θ) with Ad(rec π_v) and Ind θ_w.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`.

### `MetaplecticAutomorphicForms:MP.5`

The theta series on Mp(A) attached to a quadratic character and the genuine Eisenstein series on the metaplectic cover of SL₂ over a number field, with constant terms and continuation, used in Shimura's integral (Gelbart–Jacquet 1978 §§5–8, Theorem 8.1) to prove L(s,π,Ad⊗χ) entire.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`.

### `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

Dirichlet-density Chebotarev and the infinitude of every Frobenius class, applied to ray class fields of a quadratic field and to the splitting field of a residual representation, to choose auxiliary primes.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`

Brauer–Hasse–Noether exact sequence and local invariants for number fields, including the archimedean terms; combined with local reciprocity in Tate’s vanishing proof.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`

Global Artin reciprocity matching finite-order Galois characters with finite-order Hecke characters and local characters.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/isobaric-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tunnell-primitive-globalization`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`

Hilbert product formula: quaternionic local invariants have even total ramification cardinality; apply this result rather than constructing it again.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.3/indefinite-parity`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/invariant-exchange`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`

The local Brauer group, the local invariant and Br(F_v)[p] ≅ H²(G_{F_v}, μ_p), used at each place in the proof of Tate's vanishing theorem.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`

Local reciprocity, used to show that a character of F_v^× is a p-th power exactly when it is trivial on μ_p(F_v), so that the local connecting map onto Br(F_v)[p] is surjective.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing`.

### `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`

Artin–Whaples weak approximation in the mixed finite/real form, with sign conditions at real places, and openness of the squares in F_v^× at finite places: used to choose a quadratic generator with prescribed local square classes and signs, and the coefficients of a quartic close to a given local quartic.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/prescribed-local-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tunnell-primitive-globalization`.

### `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`

Archimedean components and infinity types of Hecke characters, and Weil's criterion for a Hecke character with prescribed archimedean component (Patrikis Lemma 2.3.1), used to make an extension of an idele-torsion character finite order.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-hecke-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/prescribed-local-induction`.

### `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`

Identity component of the idele class group, ray quotient and profinite quotient; use for extending finite-order characters of idele torsion.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-hecke-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/prescribed-local-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`.

### `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`

Norm pullback of Hecke characters with the placewise local norm and composition in finite towers.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/isobaric-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`.

### `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`

The canonical continuous Hecke-character carrier, conductor, finite-order/ray-class dictionary and the Q Dirichlet-character parity dictionary.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-hecke-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/prescribed-local-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tunnell-primitive-globalization`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/determinant-untwist`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/teichmuller-conductor`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`

Classical newform theory over Q in every weight including one: newform decomposition, bad-prime eigenvalues (Atkin–Lehner–Li), primitive forms and their conductor.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`.

### `tauceti:TauCetiRoadmap/ModularForms#layer-6-atkinlehner-and-fricke-operators`

Atkin–Lehner and Fricke operators W_Q for exact divisors Q‖N and their relations with T_n, including the Atkin–Li operators on forms with nontrivial character that Rohrlich–Tunnell use at Q = 2^ν (their §1, Case 2).

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`.

### `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`

Completions of a number field at finite places as local fields, and the dictionary between the places of F[x]/(f) above v and the irreducible factors of f over F_v (completionFactorsEquivPlaces), with Krasner's lemma from Mathlib: used to realise a given p-adic field K as a completion F_v and the splitting field of an approximating quartic as a completion L_w ≅ K(σ).

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/tunnell-primitive-globalization`.

### `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`

Continuous cohomology with discrete trivial Q/Z coefficients, filtered-colimit compatibility, inflation/restriction and connecting homomorphisms; Q/Z has trivial action, not the cyclotomic action.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/tate-vanishing`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula`

The Mackey decomposition formula over any commutative coefficient ring, for Res_{G_E} Ind_{G_K}^{G_F} θ with K/F quadratic, including residual characteristic two where the Layer 4 irreducibility criterion (|G| invertible) does not apply.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.6/quadratic-restriction`.

### `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-7-projective-representations-factor-sets-and-the-schur-multiplier`

The existing factor-set and Schur-multiplier interface and character ambiguity of linear lifts; the arithmetic continuous finite-image step is new here.

Required by: `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-projective-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift`.

## Gaps preventing closure

### 1. GL₃ converse theorem and Rankin–Selberg pole inputs (AL.3b)

AL.3/gln-converse-full-rank and AL.3/gln-converse-reduced-rank now give the single generic owner contracts; G16 in that packet retains the original proof interiors and native signature carriers. R17.4a uses the reduced-rank node at n=3; R16.5 uses the full-rank node at n=2 with separately checked twist, growth, pole and archimedean hypotheses. Gelbart–Jacquet §9.2’s highly ramified T-twist variant still needs its original source and proof decomposition. The existing AL.3/rs-global-poles and rs-boundary-nonvanishing supply the generic analytic contracts for the unitary cuspidal GL₃ comparison. No GL₃ isobaric strong multiplicity-one theorem is inferred. The proposed AL.3b prefix must precede both GL₂ consumers without importing them. The highly ramified T-statement was reread in GJ78 §9.1–§9.2, printed pp.531–534, and is not supplied by twists unramified at S. The partial Rankin–Selberg pole comparison also needs every omitted local factor to be finite at s=1. At unramified omitted places this is AL.2/jacquet-shalika-satake-bound. At ramified finite and archimedean places AL.3/rs-local-convergence now states absolute convergence on Re s≥1 for unitary generic local components; together with AL.3/rs-local-factor this supplies the omitted-factor holomorphy contract. Cogdell, Lectures 6 and 8, as used in Theorem 9.3, pp.74–75, gives the analytic input. Its native carriers and original proof interiors remain with AL; the highly ramified T-converse gap remains.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`.

### 2. Original JPSS nonnormal cubic transfer proof

Obtain Jacquet–Piatetski-Shapiro–Shalika, Relèvement cubique non normal, C. R. Acad. Sci. Paris Sér. I Math. 292 (1981), no. 12, 567–571, and the GL₃/GL₂×GL₃ proof it invokes (or a later complete proof, e.g. Mao–Rallis, Canad. J. Math. 52 (2000)). Tunnell (Bull. AMS 5 (1981), p. 173) states only the weak form: cuspidal input and Π_w=π(Res ρ_v) for almost all v. Carayol §12.2.1(b) states the all-place form against the JPSS local lift, without proof. Also missing: for lifts of degree at most three, the correspondence of the local lift of a principal series, special or ordinary cuspidal representation with the restriction of its Weil–Deligne representation, which Carayol asserts without reference and which AutomorphicGaloisRepresentations requests from R17.4 for R19.2/carayol-cubic-base-change-of-extraordinary and Carayol's Theorem (A). Do not infer any of this from cyclic towers.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`.

### 3. Clozel prescribed-supercuspidal globalization

Missing input: L. Clozel, On limit multiplicities of discrete series representations in spaces of automorphic forms, Invent. Math. 83 (1986), cited as [9] in CDN20 §5.2.1 footnote 21 (author p. 44): existence of a global automorphic representation of the definite quaternion algebra with prescribed supercuspidal component at 𝔭 and prescribed archimedean type, after the central-character adjustment the footnote allows (twist by a character, changing ϖ) and a finite extension of the p-adic coefficient field. AS.6's trace-formula engine alone does not give this statement; the AS.6 request names the trace-formula input it needs.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R17.3/supercuspidal-globalization`.

### 4. Reduction-compatible lift of a finite solvable projective image (p>2)

BCGP (proof of Proposition 10.1.3, p. 474) cite only the classification [SD73] and Tate's theorem ([Ser77, Theorem 4] is Tate's H²(G_F,Q/Z)=0, the tate-vanishing node). The step they leave implicit is a lift of the finite projective image G ⊂ PGL₂(F̄_p) (dihedral of order prime to p, A₄ or S₄) to a finite subgroup of PGL₂ over the integers of a finite extension of Q_p that reduces isomorphically onto G: for p∤|G| by lifting the prime-to-p preimage in SL₂(F̄_p), and for p=3 with G=A₄ or S₄ through an embedding GL₂(F₃)→GL₂(Z[√−2]) reducing to the identity, followed by a Teichmüller twist to match r̄. No read source writes this out in the generality of odd-residual-lift; the p=3 octahedral case over Q is node R17.5/octahedral-mod-three-application when that node is present.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/residual-lt-application`.

### 5. Local–global extension of characters (Chevalley's congruence theorem for S-units)

Needed: for a number field M, a finite set S of finite places and finite-order characters χ_u of M_u^× (u ∈ S), a finite-order Hecke character of M with these components; and, in Tunnell's 'well known' form, the extension of a quasi-character of one M_u^× to the idele class group. The finite-order form follows from Chevalley's theorem (1951): every finite-index subgroup of the S-unit group contains the S-units congruent to 1 modulo some modulus prime to S. One defines the character on the open finite-index subgroup M^×·(M_∞^{×,0}·∏_{u∈S}M_u^×·∏_{w∉S}U_w) and extends it. The quasi-character form is the closed-subgroup extension F_v^× ⊂ C_F. No Atlas stage owns either. Tau Ceti ClassFieldTheory §1 excludes Grunwald–Wang and prescribed local abelian extensions; GlobalNumberFields layers 9–10 have no existence theorem with prescribed finite components; InverseGaloisAndArithmeticFundamentalGroups IG.4 records its Grunwald–Wang input as an open gap. Weil's criterion (Patrikis Lemma 2.3.1), used by finite-hecke-extension and by prescribed-local-induction, rests on the same congruence property for units. Proposed owner: a node after GlobalNumberFields layer 9, proved from Kummer theory over M(μ_n) (the S-unit Kummer layer of ClassFieldTheory layer 12) and Chebotarev (layer 10, already a supplier of this packet). Over Q, the case used in Tunnell's Q₂ clause is elementary.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R17.5/tunnell-primitive-globalization`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/prescribed-local-induction`.

### 6. All-place upgrade of tetrahedral and octahedral Artin automorphy

Langlands (§3, Theorem 3.3) and Tunnell (1981) prove π_v≅π(ρ_v) for almost all v. The all-place statement (rec(π_v)≅ρ|W_{F_v} with equal L- and ε-factors of every twist) rests on Langlands's equivalence of the two definitions of π(ρ) (§3, p. 15, using results of Callahan and a Lemma 3.2 whose proof is not given) or on Jacquet–Langlands Theorem 12.2, which needs every twisted Artin L-function L(s,ρ⊗χ) entire and bounded in vertical strips, with the Artin functional equation and Langlands–Deligne local constants. No read source proves the upgrade in full; plan it from JL70 §12 and the R16.3 local factors.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`.

### 7. GL₃ recognition suggested signature

TauCeti.GL2Transfer.gl3_recognition is omitted from the suggested file until AL supplies the actual global admissible/cuspidal representation, completed twist, epsilon and Rankin–Selberg pole carriers. The old arbitrary-type equality from local data did not state either analytic recognition or the cuspidal pole criterion. A comment naming the exact missing signature does not count as that signature.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition`.

### 8. Source-specific automorphic transfer signature omissions

The assigned global JL, adjoint, weak nonnormal cubic, cubic character induction, Artin and weight-one interfaces require the actual number-field, local/global automorphic, central-character, coefficient-model, completed L/epsilon and Galois comparison carriers. The suggested file records each omitted declaration/API/test and its full source contract under §13, rather than asserting equivalences of arbitrary types or equality for unrelated functions. Concrete Satake matrix formulas and the numeric parity theorem remain typed fragments. These omissions do not discharge the original source-proof gaps. Since REV-FIX-RT-AREA-automorphic-1~4 the inherited cyclic/solvable base-change, quadratic-induction, R17.4 interface, Artin-lifting, characteristic-two and transfer-export prototypes, which were false as written over arbitrary types and functions, are recorded the same way; their nodes are listed here. quadratic_restriction keeps its algebraically closed coefficient field, as in the node.

Affected declarations: `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/norm-exception`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/local-factors`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/strong-multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/coefficient-conjugation`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/indefinite-parity`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/invariant-exchange`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/supercuspidal-globalization`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cubic-character-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tr-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/residual-lt-application`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cuspidality`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/isobaric-fibers`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/tower-independence`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/prescribed-local-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/finite-hecke-extension`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-residual-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tunnell-primitive-globalization`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/prescribed-local-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-mod-three-application`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/solvable-dihedral`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/rt-technical-lemma`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/serre-odd-trick`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/rohrlich-tunnell`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/wiese-odd-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/unramified-katz`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/qualitative-residual-modularity`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/weight-two-witness`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/compatible-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.6/potential-modularity-interface`.

## Restructuring and stage exports

RT-AREA-automorphic-1/1: cyclic/solvable Galois base change cannot supply a nonnormal cubic extension; rank-two converse theory cannot supply the GL₃ inputs to tetrahedral/octahedral Artin automorphy.

Add GL2AutomorphicRepresentationsAndTransfer:R17.4a 'Non-normal cubic base change and the Gelbart–Jacquet lift' between R17.4 and R17.5, holding adjoint-lift, cubic-character-induction, gl3-recognition and nonnormal-cubic-base-change. Its requires are R17.4, AutomorphicLFunctionsAndLocalFactors:AL.3, AutomorphicLFunctionsAndLocalFactors:AL.3b and MetaplecticAutomorphicForms:MP.5 (Gelbart–Jacquet's Shimura integral on the metaplectic cover); its consumer is R17.5. Until the stage exists these nodes realise R17.4. AL.3b is the proposed single prefix for AL.3/gln-converse-full-rank (n≥2) and gln-converse-reduced-rank (n≥3), after their independent analytic inputs; its consumers are R17.4a and R16.5. R16.5 compares only the full-rank n=2 statement with its own checked hypotheses. G16 retains the original proof interiors and the highly ramified T-twist variant. After the split the non-normal cubic part of the R17.4 → AutomorphicGaloisRepresentations:R19.2 export becomes R17.4a → R19.2. Carayol's extraordinary dyadic comparison (his §12.2.2 Proposition) is owned by AutomorphicGaloisRepresentations R19.2, which imports R17.4/R17.4a and R17.5 (accepted RT-AREA-langlands-2/4 fix); this packet does not plan it.

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

The packet records the editions and passage-level reading provenance below. Reader synchronization does not claim a new full reading of these sources.

### jl70

[Hervé Jacquet and Robert P. Langlands — Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf). Lecture Notes in Mathematics 114 (1970), author scan

Recorded passages: §12, Proposition 12.1 and Theorem 12.2 with the preceding local discussion, pp. 205–207; §14, Theorems 14.2 and 14.4; §15, Theorem 15.1; §16, Theorem 16.1 and the paragraph following it.

SHA-256: `bfd16d259d2816210cff67aa835b8f1fe886d3716ad909ca221d8b2686c379f3`. Access date: 2026-10-06.

### br10

[Alexandru Ioan Badulescu, with an appendix by David Renard — Unitary dual of GL(n) at archimedean places and global Jacquet–Langlands correspondence](https://imag.umontpellier.fr/~ioan-badulescu/Files/br_jl.pdf). Author preprint of Compositio Math. 146 (2010), 1115–1164; preprint page = PDF page

Recorded passages: §1.5 pp. 5–7; §18.1 pp. 44–45, including the trace-comparison proof reduction.

SHA-256: `dc3aad1d249fda35f40f33f7b688537f226e509ed6879fe36dd5d07a15839c88`. Access date: 2026-10-06.

### langlands80

[Robert P. Langlands — Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf). Annals of Mathematics Studies 96 (1980), Digital Math Archive text

Recorded passages: Introduction p. 4 (dihedral case); §2 properties (A)–(G); §3 pp. 15–20: definitions of π(ρ), Lemmas 3.1–3.2, tetrahedral argument and Theorem 3.3, octahedral discussion and Theorems 3.4–3.5; §11, Propositions 11.4–11.5, Lemmas 11.6–11.8 and verification of (A)–(G), text pp. 144–152.

SHA-256: `6af3f53d0eb0e841548f43151f9cb79fd2e12ceac4ca909aefeb08d5462758ab`. Access date: 2026-10-06.

### ac89

[James Arthur and Laurent Clozel — Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf). Annals of Mathematics Studies 120 (1989), Clay scan

Recorded passages: Chapter 3 §1 Definitions 1.1–1.2 and (1.1); §3 Theorem 3.1; §4 Theorem 4.2 and Proposition 4.4; §5 Theorem 5.1; §6 Definition 6.1 and Theorem 6.2, printed pp. 199–216.

SHA-256: `3033d863634f5a1e8c26e48ba5b5ec9d8f95fb411b2a6d21c1580db80bc01737`. Access date: 2026-10-06.

### gj78

[Stephen Gelbart and Hervé Jacquet — A relation between automorphic representations of GL(2) and GL(3)](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf). Ann. Sci. ÉNS (4) 11 (1978), 471–542, published Numdam scan

Recorded passages: Introduction pp. 471–473; §3.1–3.7 pp. 485–491 (Definition 3.1.3, Propositions 3.2–3.3, §3.6–3.7); Theorem 8.1 p. 496; §9.1–9.8 and Theorem 9.3 pp. 531–541; Remark 9.9 p. 541.

SHA-256: `319347503f91fe22bec22ce7519b9ebaf09921ec4de8756c51d155864b4fc16a`. Access date: 2026-10-06.

### converse

[James W. Cogdell — Piatetski-Shapiro’s work on converse theorems](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf). Author survey (2013), by a coauthor of the converse theorems

Recorded passages: §1 Theorem 1.1 and §2 hypotheses and twisting sets pp. 5–6; §3 Theorems 3.1–3.3 pp. 6–9 and list of applications (iv)–(v) p. 10; References [24], [33], [36] p. 19.

SHA-256: `0c922b6e6c26bc6d98ad7cf1162955d34e61491a1e73dc1f803b987cab2f2ffe`. Access date: 2026-10-06.

### patrikis

[Stefan Patrikis — Variations on a theorem of Tate](https://people.math.osu.edu/patrikis.1/variationsrevision.pdf). Author revision, 31 July 2016, submitted memoir version

Recorded passages: §2.1 Theorem 2.1.1 and proof, printed pp. 17–18; Proposition 2.1.4, its proof and Remark 2.1.5, printed p. 19; §2.3 Lemmas 2.3.1 and 2.3.6 and the proof of 2.3.6, printed pp. 28–31 (PDF page = printed page + 4).

SHA-256: `e5e9527daf697d92043ddee823e7f1f2c6882ba84c4f67fffbb77e520e3a0a81`. Access date: 2026-10-06.

### carayol86

[Henri Carayol — Sur les représentations l-adiques associées aux formes modulaires de Hilbert](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf). Ann. Sci. ÉNS (4) 19 (1986), 409–468, published Numdam scan

Recorded passages: §12.1.1–12.1.4 pp. 454–457 (finite subgroups, Sylow-2 subgroups, Lemma 12.1.3 and proof); §12.2.1–12.2.3 pp. 457–458 (cubic base change recollection (a)–(b), Proposition 12.2.2, Remark, proof); §12.3.1–12.3.2 pp. 458–459; Bibliography p. 468 ([J.P.S.S.], [Ku], [L.2], [Tu.1], [Tu.2]).

SHA-256: `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8`. Access date: 2026-10-06.

### rt97

[David E. Rohrlich and Jerrold B. Tunnell — An elementary case of Serre’s conjecture](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p16-p.pdf). Pacific J. Math. 181, special issue (1997), 299–309, published PDF

Recorded passages: Entire paper, printed pp. 299–309 (PDF pp. 1–11, PDF page k = printed page 298+k): introduction pp. 299–300; §1 notation, Deligne–Serre application and conductor pp. 300–301, Lemma p. 302, proof pp. 302–306; §2 dihedral representations and cases (i)–(iv) p. 306, ν and Theorem p. 307, proof pp. 307–308, Remarks 1–3 p. 308.

SHA-256: `fe131f6cff026c25c65727d6675d1bea9233f91bd1d0d7947587b491cf22d3b9`. Access date: 2026-10-06.

### wiese04

[Gabor Wiese — Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf). Documenta Mathematica 9 (2004), 123–133, published PDF

Recorded passages: Whole paper read (printed pp. 123–133 = PDF pp. 1–11): Introduction and Theorem 1, pp. 123–125; §2 Lemmas 2–3 and proofs, pp. 125–127; §3 Proposition 4, Corollary 5, Definition 6, Proposition 7, Corollary 8, pp. 127–130; §4 Theorems 9–10 and proof of Theorem 1, pp. 130–132; §5 Lemma 11 and Proposition 12, p. 132.

SHA-256: `1dcd4bb30b64a19cb1335a7442b6704ff9c0a3dd0ad96d97d6b37a04d0aa3b06`. Access date: 2026-10-06.

### bcgp21

[George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni — Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf). Publications Mathématiques de l’IHÉS 134 (2021), published PDF

Recorded passages: Proposition 10.1.3 and proof pp. 473–475; Theorem 10.2.6 and proof pp. 480–481.

SHA-256: `b4cc8b016615bcaf4b92bdf826ec1e285f6aca842ebd9f13712e1c498f8454af`. Access date: 2026-10-06.

### cdn20

[Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł — Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf). Author final GPW5; published JAMS 33 (2020), 311–362; locators below use author pagination

Recorded passages: §5.2.1 pp. 43–44 (setting of E, ∞₀, B̌, B; σ₂; Π̌ ∈ SD_{2,n}; footnote 21); Proposition 5.2 and its proof pp. 44–45.

SHA-256: `2cdb1de25b5201ed46f8af6c06c19b72fdc5cbe1dd2037b4e1d24dee30155776`. Access date: 2026-10-06.

### cdn23

[Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł — Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf). Forum of Mathematics, Pi 11 (2023), e16, published PDF with download stamp

Recorded passages: §4.1.1–4.1.2 pp. 37–39, hypotheses on E, invariant exchange and auxiliary place; §4.1.3 only the away-place Hecke convention.

SHA-256: `b007a4e37b824ca5986ac6152ed9fabcf38dde97e16d8f5f7f60756fe77d3418`. Access date: 2026-10-06.

### pan26

[Lue Pan — On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1). arXiv:2209.06366v1; published Annals 203 (2026), 121–281; only v1 used for locators

Recorded passages: Definition 5.4.11 and its paragraph on norm-factor forms; §5.5.5 pp. 75–76, quaternionic/classical Hecke spectra and k=0 exception.

SHA-256: `0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4`. Access date: 2026-10-06.

### rt83

[Jonathan D. Rogawski and Jerrold B. Tunnell — On Artin L-functions associated to Hilbert modular forms of weight one](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf). Invent. Math. 74 (1983), 1–42, GDZ article scan (43 PDF pages: cover + pp. 1–42), read through the GDZ OCR pages gdzocr/PPN356556735_0074/00000007–00000048 and page images

Recorded passages: Introduction pp. 1–3; §1 definitions of π_k and of holomorphic weight k, p. 4; §4 strong Artin conjecture and its solvable case, pp. 40–41.

SHA-256: `6a020942a4a0acfb5e2301de3bfd75f3ac9d05c21c8960c706c94a1e81d9c8b1`. Access date: 2026-10-06.

### ds74

[Pierre Deligne and Jean-Pierre Serre — Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf). Ann. Sci. École Norm. Sup. (4) 7 (1974), 507–530, published Numdam scan

Recorded passages: §4(a)–(c): Théorème 4.1, Remarques 4.3–4.5, Théorème 4.6 and proof, Théorème 4.10 (Weil–Langlands) and Remarques 4.11–4.13, printed pp. 513–517.

SHA-256: `65b390f6d33e827e30c6c66bbc15421eca51db3180bdf5996dcee19047be97fc`. Access date: 2026-10-06.

### tunnell81

[Jerrold Tunnell — Artin's conjecture for representations of octahedral type](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf). Bull. Amer. Math. Soc. (N.S.) 5 (1981), no. 2, 173–175 (research announcement); AMS PDF with OCR text layer

Recorded passages: Whole note, pp. 173–175: definition of π(ρ), statement of the JPSS theorem [4], field diagram, Lemma with proof, Theorem with proof, references; page images checked against the OCR text.

SHA-256: `fc276270d09ea11b98d750deeba26193e07d5aac2d30ffe16dbf0f7f576ffc5c`. Access date: 2026-10-06.

### jpss79

[Hervé Jacquet, Ilja I. Piatetski-Shapiro and Joseph Shalika — Automorphic forms on GL(3). II](https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf). Ann. of Math. (2) 109 (1979), 213–258; scan on H. Jacquet's Columbia page without text layer (visual transcription of pp. 253–255 kept as scratch/src/jpss79/jpss79.txt)

Recorded passages: §14.2, Theorem (14.2), its proof and the remark on monomial representations, printed pp. 253–255 (visual reading); Part I, Introduction pp. 169–172, for the location of (13.6) and (14.2).

SHA-256: `0cf1baf41a6279cd1f78b44b0e6d3ff0ed71f7b9b54b55de28210b9f02a293f7`. Access date: 2026-10-06.

### tunnell78

[Jerrold B. Tunnell — On the local Langlands conjecture for GL(2)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0046/LOG_0017.pdf). Inventiones Mathematicae 46 (1978), 179–200; GDZ scan of the article (LOG_0017 of PPN356556735_0046, 23 pages including a GDZ cover sheet, so PDF page = printed page − 177), read with the GDZ OCR pages 00000185–00000206 and against the page images of pp. 182–183

Recorded passages: Introduction (property (*), Theorems A–C), printed pp. 179–180; §1, Theorems 1.1–1.3, the proof of Theorem 1.3 and of Theorem A, pp. 181–183; §2 opening (property (*), base-change facts (2.1.1)–(2.1.2)), p. 183; references, p. 200.

SHA-256: `9f3e94853253589ac99f0b8ba5e67e90b6f33a581857a4f6083f92d6375ce066`. Access date: 2026-10-06.

### ddt

[Henri Darmon, Fred Diamond and Richard Taylor — Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf). Author version dated September 9, 2007 (167 pp., printed page = PDF page) of the article in Elliptic Curves, Modular Forms & Fermat's Last Theorem (Hong Kong, 1993), International Press, 1997, 2–140; theorem numbers as in this version

Recorded passages: Introduction, pp. 11–12 (Artin representations and the Langlands–Tunnell theorem; mod ℓ representations); §3.1, Theorem 3.3 and Remarks 3.4–3.6, pp. 87–88; §3.2, Conjecture 3.7 to Theorem 3.14 with the sketch of proof, pp. 88–90.

SHA-256: `254f6e29957f95219eff046c29478f5ee584615bee12c8aa8357f499c8cbe8b3`. Access date: 2026-10-06.

### cogdell-fields

[James W. Cogdell — Lectures on L-functions, converse theorems, and functoriality for GL(n)](https://people.math.osu.edu/cogdell.1/fields-www.pdf). Author Fields Institute lecture notes, 2004

Recorded passages: Lecture 4 §§1–3, printed pp.29–34; Lecture 9 §§2–4 and §7, printed pp.71–72 and 74–75. The partial-versus-completed pole comparison uses pp.74–75..

SHA-256: `2c5ec050a6db216dcd2104b7fe266ddc03e4db7c7d300239e60d6ee9c40618a7`. Access date: 2026-10-07.

## Round-3 closure boundaries

### GL₃ recognition suggested signature

TauCeti.GL2Transfer.gl3_recognition is omitted from the suggested file until AL supplies the actual global admissible/cuspidal representation, completed twist, epsilon and Rankin–Selberg pole carriers. The old arbitrary-type equality from local data did not state either analytic recognition or the cuspidal pole criterion. A comment naming the exact missing signature does not count as that signature.

Needed by: `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition`.
