# Analytic toric geometry, Part II: arithmetic toroidal compactifications

**First prerequisite:** the unchanged [Analytic toric geometry](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/AnalyticToricGeometry/README.md) roadmap, `tauceti:TauCetiRoadmap/AnalyticToricGeometry`.

**Part C0; revision status: partial checkpoint.** The independently reviewed target-level pass has 90 nodes, 119 API items, 92 definition/construction tests and 34 planets. All eight stages (C0, C1, C2, C2.general, C3, C3.general, C4 and C5) remain planned, none closed, and every declaration remains unchecked. There are 21 explicit gaps and 37 supplier requests. C6 is outside this part. The reader now includes all reviewer corrections and the distinct projective normalized blow-up target. Full geometric prototyping remains unfinished at the pinned supplier boundary; the checkpoint does not supersede the independent needs-changes verdict.

The accepted RS-32 ownership boundary is binding. The anchor owns the common lattice, cone, dual-monoid and finite complex fan construction. This Part II begins with arbitrary coefficient rings, relative torus torsors, arithmetic-admissible fans and arithmetic quotients. The nonarchimedean Part II imports the uniform base-ring scheme and begins with formal completion, adic generic fibres and perfectoid additions. Boundary Hodge structures use HodgeStructures L2; C4 imports the local R11.3 Raynaud theory. Other owners retain their group, abelian, sheaf, algebraic-space, analytic and cohomological carriers.

## Conventions and library boundary

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The 14 baseline records below were checked by reading their statements at those commits. Source-generated additive monoid-algebra forms are recorded explicitly. The reviewed library audit is the ownership starting point; source reading is not a compilation claim. The revised Suggested file elaborates in the shared pinned build; the omitted contracts are not checked by that elaboration.

For the coefficient algebra, let R be a commutative ring and P an additive commutative monoid. The notation R[P] means Mathlib's existing `AddMonoidAlgebra R P`. An element is a finite monomial sum; its coefficient family is the existing `coeff` field. Write e_p for the unit-coefficient monomial of degree p. The zero ring and nonreduced coefficient rings are included.

For the relative geometry, let H be a **split torus** over a scheme Z and let T → Z be a right H-torsor. Algebraic-space bases use their actual étale atlases and descent. The character lattice M is finite free; the cocharacter lattice is its integral dual. Use the common closed rational polyhedral salient cone σ and the existing additive monoid

\[
P_\sigma=\{m\in M:\langle m,v\rangle\geq0\text{ for all }v\in\sigma\}.
\]

Lan's cone convention is relatively open. His nonnegative character monoid agrees with the one for its closure. When comparing strictly positive character degrees, use the relative interior of the closed cone, not every point of a set containing the origin. For the zero cone the nonnegative monoid is all of M and the strictly positive part is empty.

A right translation by h acts on a weight-m function through multiplication by m(h). Let L_m be the corresponding invertible subsheaf of the actual pushforward of O_T. The identifications L_0 ≅ O_Z and the multiplication maps

\[
L_m\otimes L_n\longrightarrow L_{m+n}
\]

are inherited from the torsor algebra and are isomorphisms. Their associativity, symmetry and unit compatibility are retained. A family of line bundles without these coherent multiplication maps is not the input. Lan's Remark 6.1.2.2 is relevant precisely because one cannot freely choose incompatible rigidifications.

The ordinary relative chart construction is generic in T. It consumes the torsor/descent interface of SF.1 and the relative-Spec interface of SF.0. **It does not import C4.** C4 instantiates this construction with its actual cusp torsors. Thus the direction remains generic foundations → C0 → C4/early C5. The PEL component detector belongs to SF.2 after proper coherent cohomology, and feeds early C5, then B5. There is no reverse B5 dependency.

For pure characteristic-zero assertions fix the pure datum, level and actual arithmetic quotients from V0; no universal abelian scheme is presumed. For the relative degeneration assertions use the complete normal Noetherian-domain setting of Lan 4.1–4.4. For integral assertions retain the full good-prime conditions of Lan 1.4.1.1 and 1.4.1.2 and the given PEL moduli hypotheses. Individual declarations repeat the restrictions needed for their exact statements.

- **`tauceti:TauCeti.Toric.Fan.ext`**, TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean: Extensionality on the existing finite fan carrier. Its structure has finite_cones; it is not an arithmetic fan with merely finitely many orbits. Reuse its lattice/cone vocabulary and finite specialization. Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.
- **`tauceti:TauCeti.SplitTorus.groupScheme`**, TauCeti/Algebra/AlgebraicGroup/SplitTorus/Scheme.lean: The actual finite-rank split torus over Spec R for any commutative ring, not just over a field. Relative torsors and toroidal boundary charts are additional constructions. Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.
- **`tauceti:TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk`**, TauCeti/AlgebraicGeometry/IrreducibleOfConnectedDomainStalk.lean: A locally Noetherian connected SCHEME with domain stalks is irreducible. This is a scheme-specialization input for the foundations owner, not the algebraic-space or geometric-fiber theorem needed below. Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.
- **`mathlib:MonoidAlgebra.comapDomain`**, Mathlib/Algebra/MonoidAlgebra/MapDomain.lean: Coefficient restriction along an injective degree map, including its source-generated AddMonoidAlgebra version. The operation is additive, not an algebra homomorphism without the face condition proved in C0. Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.
- **`mathlib:AddMonoidAlgebra.lift`**, Mathlib/Algebra/MonoidAlgebra/Basic.lean: Equivalence between multiplicative maps from Multiplicative P to an R-algebra A and R-algebra homomorphisms from AddMonoidAlgebra R P. It packages the actual monomial-or-zero map once its multiplication law is established. Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.
- **`mathlib:AddMonoidAlgebra.lift_single`**, Mathlib/Algebra/MonoidAlgebra/Basic.lean: The additive monoid-algebra lift evaluated on a coefficient monomial is the scalar multiple of the chosen monoid map. This checks the face-projection normalization. Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.
- **`mathlib:MonoidAlgebra.mapDomainAlgHom`**, Mathlib/Algebra/MonoidAlgebra/Basic.lean: The algebra map induced by a degree-monoid homomorphism, with its source-generated AddMonoidAlgebra form. Used for the existing inclusion R[F] to R[P], not replanned. Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.
- **`mathlib:MonoidAlgebra.mapRingHom`**, Mathlib/Algebra/MonoidAlgebra/MapDomain.lean: The ring map changing every monoid-algebra coefficient along a unital ring homomorphism, with its source-generated additive-degree form, coefficient formula and monomial formula. Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.
- **`mathlib:MonoidAlgebra.domCongr`**, Mathlib/Algebra/MonoidAlgebra/Basic.lean: An equivalence of degree monoids induces an algebra equivalence for any coefficient algebra. Its source-generated additive version supplies the algebraic part of integral regular coordinates, but not the dual-monoid or torsor theorem. Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.
- **`mathlib:Ideal.quotientKerAlgEquivOfRightInverse`**, Mathlib/RingTheory/Ideal/Quotient/Operations.lean: For an algebra homomorphism with an actual right inverse, the quotient by its kernel is algebra-isomorphic to its codomain. The C0 work identifies the specified off-face monomial ideal with that kernel. Statement and surrounding hypotheses freshly read at the recorded pin on 2026-10-06. Source annotations generating the additive forms were checked where applicable. The read statement supplies exactly the limited interface in provides; no compiled Tau Ceti import is claimed.
- **`tauceti:TauCeti.Hodge.MixedHodgeStructure`**, TauCeti/Geometry/Hodge/Mixed/Basic.lean: Integral module with actual rational/complex base-change models, bounded increasing WQ and decreasing F, and native pure graded Hodge structures whose filtration is exactly the induced quotient filtration. C1 only constructs its boundary instance. Pinned source read 2026-10-06, structure and graded_pure fields, lines 65–105; no compiled Tau Ceti import is claimed.
- **`tauceti:TauCeti.Hodge.MixedHodgeStructure.gradedHodgeStructure`**, TauCeti/Geometry/Hodge/Mixed/Basic.lean: The native weight-k graded Hodge structure, with F defined by gradedF and exact gradedHodgeStructure_F comparison. C1 uses this existing pure carrier rather than choosing an unrelated pure structure. Pinned source read 2026-10-06, actual definition and filtration equality after conjF, approximately lines 208–228; statement includes isBaseChange_ratTensorMap and the native weightGradedRat quotient.
- **`mathlib:AlgebraicGeometry.Spec`**, Mathlib/AlgebraicGeometry/Scheme.lean: The existing scheme spectrum of CommRingCat, used for Spec R[P] rather than a new affine-scheme carrier. Actual definitions and identity/composition statements read at Mathlib 082e2d3 on 2026-10-06, lines 468–488, blob 7b6780cadcf0a4d2df6c5bf7e4356b95d059e8d9.
- **`mathlib:AlgebraicGeometry.Spec.map`**, Mathlib/AlgebraicGeometry/Scheme.lean: A ring morphism R to S induces the scheme morphism Spec S to Spec R. Coefficient maps of integral charts use this existing contravariance. Actual definitions and identity/composition statements read at Mathlib 082e2d3 on 2026-10-06, lines 468–488, blob 7b6780cadcf0a4d2df6c5bf7e4356b95d059e8d9.

## Stage contracts

| Stage | Nodes | Planets | Coverage |
|---|---:|---:|---|
| C0 | 17 | 5 | planned, open |
| C1 | 6 | 5 | planned, open |
| C2 | 9 | 6 | planned, open |
| C2.general | 1 | 1 | planned, open |
| C3 | 12 | 5 | planned, open |
| C3.general | 1 | 1 | planned, open |
| C4 | 14 | 5 | planned, open |
| C5 | 30 | 6 | planned, open |

## C0

The native face quotient retains nilpotent coefficients. Relative charts use weight subsheaves and multiplication inherited from the actual torsor algebra. Arithmetic systems keep infinite cone sets distinct from finite arithmetic orbit sets; finiteness is tested inside the positivity domain. The new typed local fan/refinement component fixes the action and requires a concrete finite-overlap witness. Global cusp restrictions and compatible adelic reindexing remain supplied by V2. Uniform affine coefficient change is Cartesian without flatness or Noetherian assumptions. Finite complex gluing and relative Spec are already implemented in current Tau Ceti and are imported through their owners, while the arbitrary-ring and torsor extensions remain this layer’s targets.

### The integral face projection

**Node:** `ShimuraCompactifications:C0/face-projection`. **Declaration:** `AddMonoidAlgebra.faceProjection`. **Kind:** construction.

Construct the R-algebra homomorphism pi_(R,F): R[P] to R[F] that restricts a finite coefficient family to F. On the monomial r e_p it is r e_(p in F) when p belongs to F and zero otherwise. Its underlying additive map is the pinned coefficient restriction comapDomain along the inclusion F to P. In particular this is not an augmentation, reduction of R, or an arbitrary linear map renamed a stratum restriction.

**Hypotheses.**

- R is a commutative ring, including the zero ring; P is an additive commutative monoid.
- F is an existing additive submonoid of P with the explicit face condition: for all a,b in P, a+b belongs to F if and only if both a and b belong to F. No replacement face or monoid carrier is introduced.

**Construction or proof.**

1. Reuse the existing additive monoid-algebra carrier and its coefficient restriction along the injective subtype map. The additive operation is already in the pinned library.
2. For multiplication, reduce by finite bilinearity to e_a e_b=e_(a+b). The face condition says exactly that the product survives precisely when both factors survive. The surviving subtype sum is the original sum. This proves multiplicativity without cancellation, reducedness or a domain hypothesis.
3. Zero belongs to F, so e_0 maps to e_0 and every scalar is preserved. Package these laws as an AlgHom. Equivalently apply the pinned AddMonoidAlgebra.lift to the monomial-or-zero multiplicative map; the lift universal property proves agreement with coefficient restriction.

**Direct prerequisites.** `mathlib:MonoidAlgebra.comapDomain`, `mathlib:AddMonoidAlgebra.lift`, `mathlib:AddMonoidAlgebra.lift_single`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.1–6.1.2.6, especially the homogeneous quotient in Lemma 6.1.2.6: This is the general coefficient-algebra proof behind the source toric-stratum quotient, written in existing monoid-algebra vocabulary. The extension to an arbitrary face submonoid is proved here, not attributed to a separately numbered general theorem in Lan.

**Uses.**

- **ShimuraCompactifications:C0/relative-stratum-quotient**: Realizes the local restriction from a torus embedding to its closed orbit without reducing the base.
- **ShimuraCompactifications:C0/relative-boundary-coordinates**: Kills the selected coordinate directions in the actual scheme-theoretic boundary ideal.

**API.**

- **`AddMonoidAlgebra.faceProjection_eq_comapDomain`** (compatibility): For every f in R[P], pi_(R,F)(f) equals comapDomain along the injective inclusion F to P applied to f.
- **`AddMonoidAlgebra.faceProjection_single_mem`** (simp): For p in F and r in R, pi_(R,F)(r e_p)=r e_(p in F).
- **`AddMonoidAlgebra.faceProjection_single_not_mem`** (simp): For p outside F and r in R, pi_(R,F)(r e_p)=0.
- **`AddMonoidAlgebra.faceProjection_coeff`** (projection): For f in R[P] and m in F, the m-coefficient of pi_(R,F)(f) is the underlying m-coefficient of f; promoted to face-projection-coeff.
- **`AddMonoidAlgebra.faceProjection_comp_inclusion`** (relation): The composite R[F] to R[P] to R[F] is the identity; promoted to face-projection-section.
- **`AddMonoidAlgebra.faceProjection_coefficient_change`** (functoriality): For every ring homomorphism R to S, coefficient change commutes with pi; promoted to face-projection-coefficient-change.

**Unit tests.**

- **`AddMonoidAlgebra.faceProjection_zero_test`** (degenerate): The zero element of R[P] maps to zero in R[F].
- **`AddMonoidAlgebra.faceProjection_positive_test`** (computation): For R=Z/4, P=N and F={0}, pi(e_1)=0.
- **`AddMonoidAlgebra.faceProjection_nilpotent_test`** (non-example): For R=Z/4, P=N and F={0}, the zero-degree coefficient of pi(2 e_0) is 2, hence nonzero. The nonzero nilpotent scalar is retained.
- **`AddMonoidAlgebra.faceProjection_laurent_test`** (compatibility): For R=Z, P=Z and F=P, the coefficient in degree -1 of pi(e_(-1)) is 1. Invertible character directions are not discarded.

**Acceptance.**

- For R nonzero and P=N, F={0}, the positive-degree monomial maps to zero but the constant one does not.
- The face assumption cannot be dropped: restriction to the even submonoid of N kills e_1 but retains e_2, although e_1 squared is e_2.

### Coefficients of the face projection

**Node:** `ShimuraCompactifications:C0/face-projection-coeff`. **Declaration:** `AddMonoidAlgebra.faceProjection_coeff`. **Kind:** lemma.

For f in R[P] and m in F, coeff_m(pi_(R,F)(f))=coeff_m(f). This is the named coefficient API used by the kernel and base-change arguments.

**Hypotheses.**

- R is a commutative ring, including the zero ring; P is an additive commutative monoid.
- F is an existing additive submonoid of P with the explicit face condition: for all a,b in P, a+b belongs to F if and only if both a and b belong to F. No replacement face or monoid carrier is introduced.

**Construction or proof.**

1. Evaluate the coefficient restriction used in face-projection at the subtype element m. Injectivity of the subtype inclusion makes this precisely the coefficient at its underlying element. No summation of distinct degrees occurs.

**Direct prerequisites.** `ShimuraCompactifications:C0/face-projection`, `mathlib:MonoidAlgebra.comapDomain`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.6, homogeneous components of the quotient: Makes the degreewise content of the source quotient explicit.

**Acceptance.**

- The formula also holds when R is zero or when the coefficient is nilpotent.

### A section of the face projection

**Node:** `ShimuraCompactifications:C0/face-projection-section`. **Declaration:** `AddMonoidAlgebra.faceProjection_comp_inclusion`. **Kind:** lemma.

Let i_F:R[F] to R[P] be the existing monoid-algebra map induced by the subtype inclusion. Then pi_(R,F) composed with i_F is the identity R-algebra homomorphism. In particular pi_(R,F) is surjective.

**Hypotheses.**

- R is a commutative ring, including the zero ring; P is an additive commutative monoid.
- F is an existing additive submonoid of P with the explicit face condition: for all a,b in P, a+b belongs to F if and only if both a and b belong to F. No replacement face or monoid carrier is introduced.

**Construction or proof.**

1. Use the existing mapDomainAlgHom for the inclusion. On a coefficient monomial r e_m, the inclusion gives the same monomial with its underlying P-degree.
2. Apply face-projection-coeff and coefficient extensionality. This proves the identity on arbitrary finite sums; it supplies an actual right inverse, not only an existence assertion. Surjectivity is the immediate elementwise consequence.

**Direct prerequisites.** `ShimuraCompactifications:C0/face-projection-coeff`, `mathlib:MonoidAlgebra.mapDomainAlgHom`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.6, quotient algebra on the orthogonal characters: The retained homogeneous summands provide the explicit section in a trivialized chart.

**Acceptance.**

- An arbitrary finite F-supported polynomial, not just the unit, is recovered.

### The monomial ideal of the face complement

**Node:** `ShimuraCompactifications:C0/face-projection-kernel`. **Declaration:** `AddMonoidAlgebra.ker_faceProjection`. **Kind:** lemma.

The kernel of pi_(R,F) is the ideal J_F generated by e_p for p outside F. Equivalently, a polynomial lies in J_F exactly when all its F-coefficients vanish. The statement is about the actual Ideal.span in R[P], not the radical of this ideal.

**Hypotheses.**

- R is a commutative ring, including the zero ring; P is an additive commutative monoid.
- F is an existing additive submonoid of P with the explicit face condition: for all a,b in P, a+b belongs to F if and only if both a and b belong to F. No replacement face or monoid carrier is introduced.

**Construction or proof.**

1. The coefficient formula identifies the kernel with the polynomials whose retained coefficients vanish.
2. Each generator e_p outside F is killed. Therefore its ideal span lies in the kernel.
3. Conversely expand an element of the kernel as its finite monomial sum. Every nonzero term has degree outside F and is a scalar multiple of one of the indicated generators. Thus it belongs to that ideal span. This proof also establishes the coefficient characterization.

**Direct prerequisites.** `ShimuraCompactifications:C0/face-projection-coeff`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.6, displayed homogeneous ideal: Provides a coefficient-level proof and retains nilpotent coefficients under arbitrary base change.

**Acceptance.**

- Over Z/4, J_{0} in (Z/4)[N] is the positive-degree ideal; it does not contain 2 e_0.
- For F=P, the generating set is empty and the kernel is the zero ideal.

### The integral stratum quotient algebra

**Node:** `ShimuraCompactifications:C0/face-quotient`. **Declaration:** `AddMonoidAlgebra.faceQuotientEquiv`. **Kind:** construction.

Construct the canonical R-algebra equivalence R[P]/J_F with R[F], where J_F is the ideal span of the off-face monomials from face-projection-kernel. It takes the class of f to pi_(R,F)(f). Use the existing ideal-quotient carrier and the pinned first isomorphism theorem.

**Hypotheses.**

- R is a commutative ring, including the zero ring; P is an additive commutative monoid.
- F is an existing additive submonoid of P with the explicit face condition: for all a,b in P, a+b belongs to F if and only if both a and b belong to F. No replacement face or monoid carrier is introduced.

**Construction or proof.**

1. Apply Ideal.quotientKerAlgEquivOfRightInverse using the explicit inclusion section from face-projection-section.
2. Transport the quotient along face-projection-kernel to the specified monomial ideal J_F. The resulting equivalence has its quotient-map formula fixed, so it is not an unspecified isomorphism of rings.

**Direct prerequisites.** `ShimuraCompactifications:C0/face-projection-section`, `ShimuraCompactifications:C0/face-projection-kernel`, `mathlib:Ideal.quotientKerAlgEquivOfRightInverse`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.6, quotient defining the closed stratum: Identifies the specified monomial quotient, using the existing generic first isomorphism theorem instead of replanning it.

**Uses.**

- **ShimuraCompactifications:C0/relative-stratum-quotient**: Identifies the affine-local coordinate algebra of the relative closed orbit.
- **ShimuraCompactifications:C0/relative-boundary-coordinates**: Computes scheme-theoretic boundary intersections after local trivialization.

**API.**

- **`AddMonoidAlgebra.faceQuotientEquiv_mk`** (simp): The equivalence evaluated at the quotient class of f is pi_(R,F)(f).
- **`AddMonoidAlgebra.faceQuotientEquiv_symm_single`** (simp): The inverse sends r e_m for m in F to the quotient class of r e_m in R[P].
- **`AddMonoidAlgebra.faceQuotientEquiv_coeff`** (projection): The m-coefficient of the image of the class of f equals coeff_m(f), for m in F.
- **`AddMonoidAlgebra.faceQuotient_mk_eq_iff`** (characterisation): The quotient classes of f and g are equal exactly when their coefficients agree in every F-degree.

**Unit tests.**

- **`AddMonoidAlgebra.faceQuotient_zero_test`** (degenerate): The class of zero maps to zero.
- **`AddMonoidAlgebra.faceQuotient_positive_test`** (computation): For R=Z/4, P=N and F={0}, the class of e_1 maps to zero.
- **`AddMonoidAlgebra.faceQuotient_nilpotent_test`** (non-example): For R=Z/4, P=N and F={0}, the image of the class of 2 e_0 has zero-degree coefficient 2, not zero.
- **`AddMonoidAlgebra.faceQuotient_laurent_test`** (compatibility): For R=Z, P=Z and F=P, the image of the class of e_(-1) has degree -1 coefficient 1.

**Acceptance.**

- The equivalence preserves the R-algebra structure, including nonzero nilpotents in R.

### Coefficient change commutes with face restriction

**Node:** `ShimuraCompactifications:C0/face-projection-coefficient-change`. **Declaration:** `AddMonoidAlgebra.faceProjection_coefficient_change`. **Kind:** lemma.

For every unital ring homomorphism phi:R to S, the two ring homomorphisms R[P] to S[F] obtained by projecting then changing coefficients, or changing coefficients then projecting, are equal. There is no flatness, injectivity or surjectivity hypothesis on phi.

**Hypotheses.**

- R is a commutative ring, including the zero ring; P is an additive commutative monoid.
- F is an existing additive submonoid of P with the explicit face condition: for all a,b in P, a+b belongs to F if and only if both a and b belong to F. No replacement face or monoid carrier is introduced.
- S is any commutative ring and phi:R to S is a ring homomorphism.

**Construction or proof.**

1. The pinned monoid-algebra coefficient map sends r e_p to phi(r) e_p.
2. Compare the two composites on each coefficient monomial. Membership of p in F is unchanged by phi, and phi(0)=0. Finite-sum or algebra-homomorphism extensionality gives equality.

**Direct prerequisites.** `ShimuraCompactifications:C0/face-projection-coeff`, `mathlib:MonoidAlgebra.mapRingHom`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.1–6.1.2.6, homogeneous algebra construction: The arbitrary-ring naturality is a direct verification on the source homogeneous construction. It does not assert any tensor/inverse-limit interchange.

**Acceptance.**

- Apply to Z/4 to Z/2 and to identity and composite coefficient maps.

### The face ideal commutes with coefficient change

**Node:** `ShimuraCompactifications:C0/face-kernel-coefficient-change`. **Declaration:** `AddMonoidAlgebra.ker_faceProjection_map`. **Kind:** lemma.

For phi:R to S, extension of the ideal ker(pi_(R,F)) along the existing coefficient map R[P] to S[P] is ker(pi_(S,F)). Consequently the specified stratum quotient has its expected coefficient-base-change comparison. This is extension of this monomial ideal, not a claim that arbitrary kernel formation commutes with tensoring.

**Hypotheses.**

- R is a commutative ring, including the zero ring; P is an additive commutative monoid.
- F is an existing additive submonoid of P with the explicit face condition: for all a,b in P, a+b belongs to F if and only if both a and b belong to F. No replacement face or monoid carrier is introduced.
- S and phi are as in face-projection-coefficient-change.

**Construction or proof.**

1. Rewrite both kernels using face-projection-kernel.
2. The image of each generating monomial e_p is the same e_p since phi(1)=1. Extension of an ideal generated by a set is generated by its image. This proves the equality even if phi is nonflat.
3. For the quotient comparison, apply face-quotient on both bases and use the naturality square. The ordinary monoid-algebra coefficient extension is computed from its free monomial basis; no completion is involved.

**Direct prerequisites.** `ShimuraCompactifications:C0/face-projection-kernel`, `ShimuraCompactifications:C0/face-projection-coefficient-change`, `ShimuraCompactifications:C0/face-quotient`, `mathlib:MonoidAlgebra.mapRingHom`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.6, monomial description of the stratum ideal: This proves the needed coefficient-change property of the displayed ideal, rather than claiming it for all kernel or completion functors.

**Acceptance.**

- The nonflat map Z/4 to Z/2 passes the ideal-generator test.
- Keep the distinction from a general ideal kernel: the argument uses the fixed monomial generating set and the explicit split coefficient basis.

### Relative torus embeddings from the actual torsor algebra

**Node:** `ShimuraCompactifications:C0/relative-torus-embedding`. **Declaration:** `TauCeti.Toric.Relative.torusEmbedding`. **Kind:** construction.

Construct T(sigma)=Spec_Z(A_sigma), where A_sigma is the homogeneous O_Z-subalgebra direct-summing L_m over m in P_sigma inside the actual torsor algebra. Its multiplication and unit are inherited from O_T. The construction is functorial under base change and is equivariant for the given split torus. It extends the unchanged finite-complex toric chart, not its lattice or cone carrier.

**Hypotheses.**

- Z is a scheme, or an algebraic space treated on its actual etale atlas. H is a split torus with finite free character lattice M; T to Z is a right H-torsor in the fppf topology.
- Use the common toric lattice/cone vocabulary and its dual additive monoids. For a rational polyhedral salient closed cone sigma in the real cocharacter space, P_sigma consists of the integral characters nonnegative on sigma.
- Let L_m be the weight-m subsheaf of the actual pushforward of O_T: right translation by h acts on a local function by multiplication by m(h). Its unit and multiplication maps L_m tensor L_n to L_(m+n) are those of O_T, not arbitrary rigidifications.
- Lan's cone convention is relatively open; its nonnegative character monoid agrees with that of our closed cone. Strict positivity, when comparing the source ideal notation, is tested on the relative interior, not on the origin. The zero-cone case is treated separately.

**Construction or proof.**

1. Import the actual graded torsor algebra and its coherent multiplication from the generic torsor/descent owner SF.1. In particular identify L_0 with O_Z and prove that character-line multiplication is an isomorphism; do not select incompatible trivializations.
2. Nonnegativity is closed under addition and includes zero, so the indicated homogeneous direct sum is a quasi-coherent subalgebra. Use SF.0 relative Spec for this algebra, not a new scheme or gluing carrier.
3. Trivialize a basis of character lines on a cover of Z. The multiplication-compatible trivialization identifies A_sigma there with O_Z[P_sigma]. Two trivializations differ by character units and give the actual descent cocycle.
4. Pullback commutes with direct sums and the individual character lines. The cocycle respects multiplication, so relative Spec base change and the torus action descend. No C4 object is a prerequisite: this is the generic construction that C4 instantiates.

**Direct prerequisites.** `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `mathlib:MonoidAlgebra.domCongr`, `tauceti:TauCeti.SplitTorus.groupScheme`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.1, Remark 6.1.2.2, Definition 6.1.2.3, printed pp. 443–444: Keeps the actual multiplication isomorphisms and the relative Spec construction, with split-torus rather than unrestricted nonsmooth multiplicative-type hypotheses.
- [FARB-KISIN-WOLFSON-2024](https://arxiv.org/pdf/2110.05534v2), 3.2.1; Proposition 3.2.7 proof, printed pp. 24–25: Torus torsors and character-line compactifications over an abelian base; the generic torsor carrier is requested from SF.1.

**Uses.**

- **ShimuraCompactifications:C4**: Supplies the relative torus embeddings used in actual degeneration charts.
- **ShimuraCompactifications:C0/relative-regular-coordinates**: Provides the scheme whose ordinary integral coordinates are identified.
- **ShimuraCompactifications:C5/neat-boundary-intersection-smooth**: Its coordinate form is pulled to the ordinary good algebraic models.
- **PAPER-FARB-KISIN-WOLFSON-24/089**: Specializes the same generic torus-torsor/character-line supplier over an abelian variety; no second torsor definition.

**API.**

- **`TauCeti.Toric.Relative.embedding_trivialization`** (compatibility): A multiplication-compatible trivialization of the torsor identifies T(sigma) with Spec of the existing monoid algebra over that open of Z.
- **`TauCeti.Toric.Relative.embedding_baseChange`** (functoriality): For Zprime to Z, pullback of T(sigma) is canonically the embedding of the pulled-back torsor, compatibly with identity and composition.
- **`TauCeti.Toric.Relative.embedding_torusAction`** (structure): The given H-action extends to T(sigma), and the structural morphism to Z is invariant.
- **`TauCeti.Toric.Relative.embedding_zeroCone`** (compatibility): For the zero cone, P_sigma=M and T(sigma) is canonically the original torsor T.
- **`TauCeti.Toric.Relative.embedding_changeTrivialization`** (relation): If local torsor sections satisfy t_beta=t_alpha g_alpha_beta, the weight-m coordinate functions satisfy q_beta,m=m(g_alpha_beta)^(-1) q_alpha,m. These transitions preserve multiplication, boundary ideals and all face maps.
- **`TauCeti.Toric.Relative.embedding_homEquiv`** (universal-property): For a Z-scheme Y, maps Y→T(sigma) over Z correspond to maps from the pulled-back graded character algebra A_sigma to O_Y; evaluation on homogeneous characters respects its inherited multiplication.

**Unit tests.**

- **`TauCeti.Toric.Relative.embedding_rankOne_test`** (computation): For a trivial G_m-torsor and its positive ray, the embedding is A1_Z with its usual G_m open.
- **`TauCeti.Toric.Relative.embedding_zeroCone_test`** (degenerate): The zero-cone embedding is the given torsor, even if that torsor is nontrivial.
- **`TauCeti.Toric.Relative.embedding_lineDual_test`** (compatibility): For rank one with weight-one function line L, the positive-ray embedding is Spec_Z Sym(L), the total space of L dual under the convention V(E)=Spec Sym(E dual). Do not replace it by the total space of L.
- **`TauCeti.Toric.Relative.embedding_nilpotentBase_test`** (non-example): For the trivial rank-one torsor over Z/4, the positive-ray coordinate ring is (Z/4)[q], and restriction to q=0 retains the nonzero nilpotent scalar 2.

**Acceptance.**

- On a trivial torsor over Spec R, the construction is the actual affine spectrum of R[P_sigma].
- A nontrivial torsor need not admit a global monomial function of every degree.

**Planet:** Relative torus embedding.

### Ordinary face charts are relative open subspaces

**Node:** `ShimuraCompactifications:C0/relative-face-open`. **Declaration:** `TauCeti.Toric.Relative.faceOpenImmersion`. **Kind:** theorem.

For a face tau of sigma, construct the canonical equivariant open immersion T(tau) to T(sigma). On a multiplication-compatible trivialization it is the monomial localization R[P_sigma] to R[P_tau]; these immersions obey identity and composition and have the expected common-face intersections. This is an ordinary scheme statement, not a morphism between completions at different strata.

**Hypotheses.**

- Z is a scheme, or an algebraic space treated on its actual etale atlas. H is a split torus with finite free character lattice M; T to Z is a right H-torsor in the fppf topology.
- Use the common toric lattice/cone vocabulary and its dual additive monoids. For a rational polyhedral salient closed cone sigma in the real cocharacter space, P_sigma consists of the integral characters nonnegative on sigma.
- Let L_m be the weight-m subsheaf of the actual pushforward of O_T: right translation by h acts on a local function by multiplication by m(h). Its unit and multiplication maps L_m tensor L_n to L_(m+n) are those of O_T, not arbitrary rigidifications.
- Use the common integral supporting-character and face-localization theorem from the toric anchor: choose m in P_sigma exposing tau, so P_tau=P_sigma+N(-m).
- Lan's cone convention is relatively open; its nonnegative character monoid agrees with that of our closed cone. Strict positivity, when comparing the source ideal notation, is tested on the relative interior, not on the origin. The zero-cone case is treated separately.

**Construction or proof.**

1. On a trivialized chart, apply the anchor supporting-character/monoid identity and the generic monoid-algebra localization universal property. A character algebra map extends exactly when the exposed monomial is invertible.
2. Relative Spec gives a principal open on each trivializing chart. On overlaps the monomial is multiplied by a unit, so the opens and their structural maps agree and descend.
3. Identity, successive localization and overlap formulas follow by the same character maps, hence descend. Do not infer a map between completions along two distinct stratum ideals from this open immersion.

**Direct prerequisites.** `ShimuraCompactifications:C0/relative-torus-embedding`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Lemma 6.1.2.4 and Theorem 6.1.2.8(2): The base-ring/torsor extension of the ordinary face-open theorem is proved by localization and descent, while the finite-complex subproblem stays with the anchor.

**Acceptance.**

- For the quadrant and its first-coordinate ray face, the face chart inverts the second coordinate.
- For sigma the zero cone, the identity face gives the identity torsor map.
- For nontrivial character lines the open is defined locally by a monomial, not by a falsely chosen global q.

### Integral regular coordinates on a relative torus chart

**Node:** `ShimuraCompactifications:C0/relative-regular-coordinates`. **Declaration:** `TauCeti.Toric.Relative.regularCoordinateIso`. **Kind:** comparison.

If sigma is regular of dimension r in a rank-n cocharacter lattice, a supplied integral basis extending its primitive rays and a multiplication-compatible local torsor trivialization give an algebra isomorphism A_sigma with R[x_1,...,x_r,y_1^(+-1),...,y_(n-r)^(+-1)]. On monomials it is the character-exponent map from the existing dual-monoid identification P_sigma with N^r times Z^(n-r). The associated scheme isomorphism is over the actual local base.

**Hypotheses.**

- Z is a scheme, or an algebraic space treated on its actual etale atlas. H is a split torus with finite free character lattice M; T to Z is a right H-torsor in the fppf topology.
- Use the common toric lattice/cone vocabulary and its dual additive monoids. For a rational polyhedral salient closed cone sigma in the real cocharacter space, P_sigma consists of the integral characters nonnegative on sigma.
- Let L_m be the weight-m subsheaf of the actual pushforward of O_T: right translation by h acts on a local function by multiplication by m(h). Its unit and multiplication maps L_m tensor L_n to L_(m+n) are those of O_T, not arbitrary rigidifications.
- Regularity includes rationality, salience and the primitive-basis condition; it is not merely simpliciality. The ring R can be nonreduced.
- Lan's cone convention is relatively open; its nonnegative character monoid agrees with that of our closed cone. Strict positivity, when comparing the source ideal notation, is tested on the relative interior, not on the origin. The zero-cone case is treated separately.

**Construction or proof.**

1. Use the existing anchor lattice/regular-cone theorem to obtain the additive equivalence of dual monoids. The choice of basis is a hypothesis of this coordinate comparison, not the definition of the global embedding.
2. Apply the pinned monoid-algebra equivalence induced by that degree equivalence. This operation is already general in the coefficient ring; no new generic algebra congruence is planned.
3. Identify the product monoid algebra as the stated polynomial/Laurent polynomial algebra by its monomial basis and generic free-algebra interfaces. Transport the actual relative algebra trivialization, then relative Spec.
4. A change of basis or torsor trivialization is the induced character monomial map and units. Compose these maps using existing functoriality; coordinates never canonize one basis.

**Direct prerequisites.** `ShimuraCompactifications:C0/relative-torus-embedding`, `mathlib:MonoidAlgebra.domCongr`, `SchemeAndStackFoundations:SF.0`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.1.11 and Theorem 6.1.2.8(5): Makes the ordinary integral-coordinate proof explicit under the free character lattice and regular-cone hypotheses.

**Acceptance.**

- A full regular rank-two cone gives R[x_1,x_2]; a rank-one cone in rank two gives R[x_1,y^(+-1)].
- The zero cone gives the whole split torus, not affine space.
- The cone generated by (1,0) and (1,2) is simplicial but its ray generators are not an integral basis; it is not admitted by the regular-coordinate theorem.

### The scheme-theoretic relative toric stratum

**Node:** `ShimuraCompactifications:C0/relative-stratum-quotient`. **Declaration:** `TauCeti.Toric.Relative.stratumQuotientIso`. **Kind:** theorem.

For a split torus chart T(sigma), the homogeneous quotient by the sum of L_m over m in P_sigma outside F_sigma=M intersect sigma-perp is canonically Spec_Z of the direct sum of L_m over F_sigma. It is the induced torsor for the split quotient torus with character lattice F_sigma. Its ideal and the quotient construction commute with arbitrary base change. This is the relative scheme-theoretic stratum; identify it with a reduced complement only under the needed reducedness hypotheses.

**Hypotheses.**

- Z is a scheme, or an algebraic space treated on its actual etale atlas. H is a split torus with finite free character lattice M; T to Z is a right H-torsor in the fppf topology.
- Use the common toric lattice/cone vocabulary and its dual additive monoids. For a rational polyhedral salient closed cone sigma in the real cocharacter space, P_sigma consists of the integral characters nonnegative on sigma.
- Let L_m be the weight-m subsheaf of the actual pushforward of O_T: right translation by h acts on a local function by multiplication by m(h). Its unit and multiplication maps L_m tensor L_n to L_(m+n) are those of O_T, not arbitrary rigidifications.
- Lan's cone convention is relatively open; its nonnegative character monoid agrees with that of our closed cone. Strict positivity, when comparing the source ideal notation, is tested on the relative interior, not on the origin. The zero-cone case is treated separately.

**Construction or proof.**

1. Nonnegative real character evaluations show that a+b vanishes on sigma precisely when both a and b do. Thus F_sigma is a face submonoid, and in this case is a saturated subgroup of M.
2. On a torsor trivialization apply face-projection, face-projection-kernel and face-quotient. The quotient ideal is the off-face homogeneous ideal, not its radical.
3. Character-unit transitions preserve the retained summands and the projection. Descend the ideal, quotient and isomorphism through the actual torsor cocycle.
4. The retained character algebra with its inherited multiplication is the pushout torsor for the quotient torus. Obtain this generic torsor/graded-algebra identification from SF.1, rather than defining a second torsor.
5. Apply face-kernel-coefficient-change and relative Spec base change locally, then descend the comparison. Neither reducedness nor completion commutes with arbitrary base change by this argument.

**Direct prerequisites.** `ShimuraCompactifications:C0/relative-torus-embedding`, `ShimuraCompactifications:C0/face-projection-kernel`, `ShimuraCompactifications:C0/face-quotient`, `ShimuraCompactifications:C0/face-kernel-coefficient-change`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Lemma 6.1.2.6 and Definition 6.1.2.7: Uses the homogeneous quotient formula for the relative base-change-compatible stratum. The comparison with the source reduction notation is kept under explicit reducedness hypotheses.

**Acceptance.**

- The full positive ray has closed stratum Z; the zero cone has stratum the whole torsor.
- Over Z/4 the full-ray stratum has ring Z/4, not Z/2.
- For a rank-one cone in a rank-two lattice the stratum retains a rank-one torus direction.

**Planet:** Toric stratum.

### Coordinate ideals of relative boundary intersections

**Node:** `ShimuraCompactifications:C0/relative-boundary-coordinates`. **Declaration:** `TauCeti.Toric.Relative.boundaryCoordinateIso`. **Kind:** comparison.

In the regular coordinates of relative-regular-coordinates, the scheme-theoretic intersection of the coordinate boundary components indexed by J has ideal (x_j : j in J) and coordinate algebra R[x_i : i outside J, y_1^(+-1),...,y_(n-r)^(+-1)]. Its exact boundary open is the principal open obtained by inverting the product of x_i for i outside J. These identifications are compatible with base change and with the character-unit transition maps.

**Hypotheses.**

- Z is a scheme, or an algebraic space treated on its actual etale atlas. H is a split torus with finite free character lattice M; T to Z is a right H-torsor in the fppf topology.
- Use the common toric lattice/cone vocabulary and its dual additive monoids. For a rational polyhedral salient closed cone sigma in the real cocharacter space, P_sigma consists of the integral characters nonnegative on sigma.
- Let L_m be the weight-m subsheaf of the actual pushforward of O_T: right translation by h acts on a local function by multiplication by m(h). Its unit and multiplication maps L_m tensor L_n to L_(m+n) are those of O_T, not arbitrary rigidifications.
- Use the supplied regular cone basis and actual torsor trivialization, and J a subset of the r boundary-coordinate indices.
- Lan's cone convention is relatively open; its nonnegative character monoid agrees with that of our closed cone. Strict positivity, when comparing the source ideal notation, is tested on the relative interior, not on the origin. The zero-cone case is treated separately.

**Construction or proof.**

1. The degrees whose J coordinates are zero form a face submonoid. The complement monomial ideal is exactly generated by the x_j with j in J: every off-face monomial contains such a variable, and every multiple of such a variable is off-face.
2. Apply face-quotient to that face and the regular monoid coordinates. This computes the scheme-theoretic intersection with its actual base coefficients.
3. Removing the other boundary components is precisely localization at the product of the remaining x_i. Multiplication by this monomial is injective by shifting the exponent basis, over every coefficient ring and after every base change. Thus this open is universally schematically dense; ordinary topological density follows as well.
4. Polynomial and Laurent polynomial algebras are smooth over R. The quotient algebra therefore gives smoothness of each intersection over the local base. Descend these particular coordinate descriptions and consequences through SF.0/SF.1. Smoothness over the arithmetic base additionally requires smoothness of the cusp base.
5. Transport each ideal and open using the actual character-unit changes. Do not apply the conclusion to identified global boundary branches without C5 neat branch separation and label-preserving ordinary charts.

**Direct prerequisites.** `ShimuraCompactifications:C0/relative-regular-coordinates`, `ShimuraCompactifications:C0/face-quotient`, `ShimuraCompactifications:C0/face-kernel-coefficient-change`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.2.6–6.1.2.8 and the ordinary charts used in 6.3.2.5: The ideal and exact-open calculation is a direct algebraic refinement of the regular relative toric chart, and provides the concrete C0 input to the existing C5 nodes.

**Acceptance.**

- For a quadrant, J empty, one coordinate and both coordinates give the plane, a line and the base, respectively.
- When no remaining boundary coordinate is present, the product is 1 and the exact open is the whole intersection.
- The coordinate quotient over Z/4 retains 2; passing to a radical ideal would fail the test.
- For G_m over F_2, density is a scheme-theoretic statement, not a claim about the number of rational points.

### Arithmetic-admissible cone systems

**Node:** `ShimuraCompactifications:C0/arithmetic-admissible-fan`. **Declaration:** `TauCeti.ShimuraCompactifications.C0.arithmetic_admissible_fan`. **Kind:** definition.

Extend the common fan incidence data by a possibly infinite set of rational polyhedral salient cones, an integral arithmetic action and finitely many cone orbits. For every cusp the support lies in the rational closure C* of its positivity cone; completeness means support=C*. Require local finiteness on compact subsets of the OPEN positivity domain, closure under faces, intersections as common faces, stabilizer invariance, and compatibility under the actual rational boundary restriction and level actions. The finite specialization is the pinned Fan; finite orbit count is never substituted for a finite set of cones.

**Hypotheses.**

- The lattice and PointedCone, IsToricCone and IsFaceOf predicates are the pinned common carriers. Supply integral linear actions preserving the lattice and C*.
- The arithmetic quotient action is its effective image on the lattice. Global cusp compatibility includes the finite double-coset indexing, not just one fan at one cusp.

**Construction or proof.**

1. Keep the shared incidence fields of Fan, replacing only finite_cones by the arithmetic action/orbit-finiteness package. Assemble cusp-indexed cones with Pink 6.4 equivariance under rational conjugation, boundary restriction and right level action.
2. Express support and local finiteness in the positivity domain. The origin lies in every cone and cannot have an ambient locally finite neighbourhood for an infinite arithmetic fan.
3. Restriction to a boundary component preserves incidence and equivariance; separately check completeness and orbit finiteness, which Pink 6.6 does not grant automatically.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ShimuraVarieties:V2/rational-boundary`, `tauceti:TauCeti.Toric.Fan.ext`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.4–6.6, printed pp. 96–99: Arithmetic cone system, finiteness and restriction qualifications.

**Uses.**

- **ShimuraCompactifications:C2**: Supplies cusp support and arithmetic finiteness for quotient gluing.
- **ShimuraCompactifications:C3**: Supplies compatible refinement data rather than a fixed Hecke-stable fan.

**API.**

- **`ArithmeticFan.ext`** (extensionality): Two systems with the same cusp lattices, actions and cone sets agree; proof witnesses do not create a second cone carrier.
- **`ArithmeticFan.toFiniteFan`** (compatibility): If the cone set is finite, forgetting the action/support data gives the pinned Fan with exactly that cone set.
- **`ArithmeticFan.restrict`** (functoriality): Boundary and level restriction preserve incidence and equivariance; completeness and orbit finiteness are transported only under the established source hypotheses.
- **`ArithmeticFan.support`** (characterisation): Completeness is the equality of union of cones with the specified rational closure C*, not all ambient vectors.

**Unit tests.**

- **`ArithmeticFan.zero_test`** (degenerate): For the rank-zero lattice C*={0}, the complete system has exactly the zero cone.
- **`ArithmeticFan.finite_test`** (compatibility): For a finite quadrant fan and trivial action, toFiniteFan has exactly its original cones.
- **`ArithmeticFan.origin_test`** (non-example): A genuinely infinite fan with common vertex 0 fails ambient local finiteness at 0 and remains allowed when locally finite on C.
- **`ArithmeticFan.support_test`** (non-example): The single positive ray fan in R has support R>=0 and is not a complete fan with prescribed support R.

**Acceptance.**

- An infinite arithmetic fan can have finitely many orbits; the API must not coerce it to a finite Fan.
- Restriction never asserts completeness without a hypothesis.

**Planet:** Admissible cone decomposition.

### Common refinements and compatible fan maps

**Node:** `ShimuraCompactifications:C0/compatible-common-refinement`. **Declaration:** `TauCeti.ShimuraCompactifications.C0.compatible_common_refinement`. **Kind:** construction.

For two complete admissible cusp systems and a specified finite family of boundary-compatible integral lattice maps, construct a common admissible refinement by intersections sigma1 intersect phi^-1(sigma2), closing under faces. Preserve support, finite arithmetic orbits and cusp/level compatibility under Pink 9.22 hypotheses. The construction is coarsest for the cone-containment relation; no common refinement is claimed for infinitely many unrelated Hecke maps.

**Hypotheses.**

- Both systems satisfy arithmetic-admissible-fan, and the maps send the source positivity domain into the required target domain.
- For the relative comparison, use the same cusp support or the inverse-image support appropriate to the specified map.

**Construction or proof.**

1. Use finite cone representatives and Pink 6.19 finite-overlap reduction to check orbit finiteness for the intersection collection.
2. Intersections are rational polyhedral cones on the shared carrier; their faces and incidence are inherited. Verify the support identity and equivariance under the specified arithmetic maps.
3. The containment universal property gives identity and common-refinement comparison maps, compatible with boundary restrictions.

**Direct prerequisites.** `ShimuraCompactifications:C0/arithmetic-admissible-fan`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`, `ShimuraCompactifications:C1/arithmetic-stabilizer`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 9.22–9.23, printed pp. 156–157: Finite family of compatible morphisms and common refinements.

**Uses.**

- **ShimuraCompactifications:C3/choice-comparison**: Compares independently chosen toroidal compactifications.
- **ShimuraCompactifications:C0/smooth-projective-refinement**: Provides input for a simultaneous smooth/projective refinement.

**API.**

- **`ArithmeticFan.commonRefinement_le`** (structure): Each resulting cone is contained in a cone of both original systems.
- **`ArithmeticFan.commonRefinement_universal`** (universal-property): A compatible fan refining both systems refines the intersection system.
- **`ArithmeticFan.commonRefinement_support`** (compatibility): The resulting system has the required common or inverse-image support.

**Unit tests.**

- **`ArithmeticFan.commonRefinement_self_test`** (degenerate): The common refinement of a system with itself is the same cone collection.
- **`ArithmeticFan.quadrant_refinement_test`** (computation): Intersecting the quadrant fan with its subdivision by (1,1) yields the two diagonal cones and their faces.
- **`ArithmeticFan.commonRefinement_level_test`** (compatibility): A specified level restriction induces the same cone-containment maps on the common refinement.

**Acceptance.**

- Two refinements compare through a third without being literally equal.
- For the quadrant and its diagonal subdivision, the common refinement is the diagonal subdivision.

### Smooth projective compatible refinements

**Node:** `ShimuraCompactifications:C0/smooth-projective-refinement`. **Declaration:** `TauCeti.ShimuraCompactifications.C0.smooth_projective_refinement`. **Kind:** theorem.

Every complete admissible system at neat level has a complete smooth projective admissible refinement, compatible with any specified finite family of fan maps. Projectivity carries an invariant integral piecewise-linear polarization, with domains of linearity exactly the cones. Record Lan's superadditive/concave convention pol(x+y)>=pol(x)+pol(y). If a global no-self-identification condition is required, impose the extra barycentric refinement of Pink 9.20; neatness and smoothness alone prove local normal crossings.

**Hypotheses.**

- The arithmetic system and maps satisfy compatible-common-refinement. Use rational polyhedral positivity cones attached to the actual boundary data.
- A projective polarization is continuous, positive on nonzero points, homogeneous, arithmetic-invariant and integral on the lattice, with the required cusp restriction compatibility.

**Construction or proof.**

1. Pink 9.18–9.19 construct invariant rational piecewise-linear functions: perturb a common function on finitely many arithmetic cone representatives, average over finite effective cone stabilizers and extend over faces.
2. Resolve singular cones by primitive integral subdivisions, retaining orbit and boundary compatibility; barycentrically refine when the separate no-self-identification property is requested.
3. Pink 9.21 and 9.23 give the complete smooth projective output and finite simultaneous compatibility. Compare the sign with Lan 2017 Definitions 2.5 and 2.7 instead of importing an opposite convexity convention.

**Direct prerequisites.** `ShimuraCompactifications:C0/compatible-common-refinement`, `ShimuraCompactifications:C1/arithmetic-stabilizer`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 9.18–9.23, printed pp. 153–157: Existence proof and simultaneous compatibility.
- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Definitions 2.5, 2.7 and Proposition 2.8: Integral polarization and cusp compatibility.

**Acceptance.**

- The cone generated by (1,0),(1,2) needs a genuine regular subdivision; simpliciality alone fails.
- A prescribed finite Hecke span admits compatible refinements; an arbitrary universal fixed fan is not asserted.

**Planet:** Smooth projective refinement.

### Toric charts over arbitrary commutative rings

**Node:** `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`. **Declaration:** `TauCeti.ShimuraCompactifications.C0.arbitrary_ring_toric_charts`. **Kind:** construction.

For the shared lattice and dual monoid P_sigma, construct U_sigma,R=Spec R[P_sigma] for every commutative ring R, by base change of Spec Z[P_sigma]. Glue a FINITE fan using the ordinary face localizations to obtain X_Sigma,R, with its split torus action and stratum ideals. All chart, overlap and action maps commute with arbitrary coefficient change, including non-Noetherian valuation rings; this extends the complex anchor rather than constructing its finite complex case again.

**Hypotheses.**

- Sigma is a finite rational polyhedral fan on the common lattice; singular cones are permitted.
- R is any commutative ring. Arithmetic infinite-fan quotients require their separate finiteness and gluing arguments.

**Construction or proof.**

1. Identify R[P] with Z[P] tensor_Z R using its native monomial basis and algebra universal property; do not quotient nilpotent coefficients.
2. Use integral supporting-character localization for every face, transport through Spec and glue the finite open-cover cocycle. The overlap for sigma,tau is their common-face chart.
3. The monomial comultiplication supplies the actual split torus action. Tensor the ordinary coordinate ideals and maps to obtain base-change comparisons; reducedness is a separate assertion.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`, `ShimuraCompactifications:C0/face-projection-coefficient-change`, `ShimuraCompactifications:C0/face-kernel-coefficient-change`, `SchemeAndStackFoundations:SF.0`, `tauceti:TauCeti.SplitTorus.groupScheme`, `mathlib:AlgebraicGeometry.Spec`, `mathlib:AlgebraicGeometry.Spec.map`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.1.1.7–6.1.2.8; ordinary character algebra construction: Relative monoid charts specialize to the trivial torsor; universal coefficient extension is proved by the monomial basis.

**Uses.**

- **AnalyticToricGeometryNonarchimedeanPartII, PAPER-BINDA-KATO-VEZZANI-25/092**: Imports a uniform toric scheme over the valuation rings used for formal/adic charts.
- **ShimuraCompactifications:C4**: Uses the base-ring chart in relative degeneration models.

**API.**

- **`Toric.affineChart_baseChange`** (compatibility): U_sigma,R base changed along R→S is canonically U_sigma,S, with monomial coefficient map.
- **`Toric.finiteFan_baseChange`** (functoriality): Finite-fan gluing commutes with arbitrary base change and the comparisons obey identity and composition.
- **`Toric.finiteFan_anchor`** (compatibility): For a finite complex fan, the new integral realization base changed to C is the anchor realization, not a second complex toric space.
- **`Toric.finiteFan_torusAction`** (structure): The split torus action extends its translation action on the dense open torus.
- **`Toric.finiteFan_glue_hom`** (universal-property): Maps from the finite-fan scheme to a Z-scheme correspond to compatible maps from its affine monoid charts, with agreement on the ordinary face-open overlaps.

**Unit tests.**

- **`Toric.affineChart_ray_Z4_test`** (computation): The positive ray over Z/4 has coordinate ring (Z/4)[q], and its closed stratum has coordinate ring Z/4.
- **`Toric.affineChart_zero_test`** (degenerate): The zero cone yields Spec R[M], the split torus rather than affine n-space.
- **`Toric.affineChart_valuation_test`** (compatibility): For an arbitrary valuation ring V, U_sigma,V is the base change of U_sigma,Z and the same face-open maps apply.
- **`Toric.affineChart_nilpotent_test`** (non-example): Replacing R by its reduction would kill the nonzero scalar 2 over Z/4 and is rejected.

**Acceptance.**

- Over Z/4, U_ray has ring (Z/4)[q] and its q=0 stratum retains 2.
- Finite complex specialization compares to the original anchor through the same monomials.

**Planet:** Integral toric chart.

### Relative fan maps and support properness

**Node:** `ShimuraCompactifications:C0/relative-fan-properness`. **Declaration:** `TauCeti.ShimuraCompactifications.C0.relative_fan_properness`. **Kind:** theorem.

An integral lattice map and a compatible equivariant map of split torus torsors with FINITE fans induce the relative toric map over the same base scheme. The inverse-image support criterion implies properness over every base. Conversely, over a NONEMPTY base, properness implies that criterion by testing a geometric fibre. Over the empty base every map is proper and support is not detected. For arithmetic quotients separately require finite-type separated quotient charts and compatible arithmetic support; orbit finiteness alone never makes the infinite unquotiented toric space proper.

**Hypotheses.**

- Use finite fans and an actual morphism of torsors equivariant for the torus homomorphism. The base morphism in the relative assertion is the identity; composing with another proper base morphism preserves properness.
- The arithmetic variant uses the actual separated finite-type quotient model from C2 or C5 and complete compatible cusp systems.

**Construction or proof.**

1. Locally trivialize the torsors and prove the integral finite-fan support criterion by valuation extension of character monomials; the same lattice inequalities hold over arbitrary coefficients.
2. Glue the local morphisms through torus transition units. Properness descends fpqc locally on the base.
3. For the arithmetic assertion apply the criterion on the finite quotient-chart presentations and separately prove the quotient is finite type and separated. Compare over C to L5.

**Direct prerequisites.** `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`, `ShimuraCompactifications:C0/relative-torus-embedding`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-5-toric-maps-and-properness`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.25 and 6.27, printed pp. 113–115: Arithmetic compatibility and compactness supply the additional quotient hypotheses.

**Acceptance.**

- A complete P1 fan gives a proper relative P1; a single positive ray gives A1, which is not proper.
- A subdivision with unchanged support gives a proper map.
- An empty base is permitted in the sufficient direction; the necessary direction explicitly requires a nonempty geometric fibre.

## C1

Enrich the rational boundary data supplied by V2. Distinguish the weight-minus-two central subgroup from the weight-minus-one quotient. Pink 4.12 compares an ambient rational representation restricted to the boundary group at corresponding points; it does not extend an arbitrary boundary representation. Boundary mixed Hodge structures instantiate the native carrier and its actual induced graded filtration. Cusp labels quotient rational and level equivalence with the actual lattice transport.

### Mixed Shimura boundary datum

**Node:** `ShimuraCompactifications:C1/mixed-boundary-datum`. **Declaration:** `TauCeti.ShimuraCompactifications.C1.mixed_boundary_datum`. **Kind:** definition.

Enrich V2's existing rational boundary component by Pink's admissible parabolic Q, the associated connected group P1, its unipotent radical W1, distinguished central weight-minus-two subgroup U1, V1=W1/U1 and pure quotient G1=P1/W1. The boundary domain X1 is the specified homogeneous finite-cover space with h1:S_C→(P1)_C; retain its finite fibers, real descent modulo U1, central weight cocharacter, Cartan-involution/no-compact-Q-factor and center conditions. Ad on Lie P1 has only weights 0,-1,-2 with W_-2=Lie U1, W_-1=Lie W1 and W_0=Lie P1. U1 and W1 are distinct inputs.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. No universal abelian scheme is assumed for this datum.
- V2 supplies the rational boundary component; D4 supplies the ambient pure Shimura datum and its algebraic morphisms; the parabolic/Lie structure is imported from ReductiveGroups Layer 7. The homogeneous finite cover X1 is not replaced by the image of h1.
- Mixed Hodge structures, filtrations and strictness are the pinned Hodge carriers and HodgeStructures L2, not new generic definitions.

**Construction or proof.**

1. Apply Pink 4.7–4.12 boundary homomorphism construction to the existing rational boundary/parabolic datum, and obtain P1,W1,U1 by the specified weight filtration.
2. Verify Pink 2.1 axioms from the boundary representation and the Hodge filtration comparison in 4.12. Use the corrected Lie filtration rather than the misprinted author-copy 2.1(v).
3. Identify the analytic boundary component through the pure quotient, retaining the finite homogeneous cover and incidence data.

**Direct prerequisites.** `ShimuraVarieties:V2/rational-boundary`, `ShimuraData:D3`, `ShimuraData:D4`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne`, `tauceti:TauCeti.Hodge.MixedHodgeStructure`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 2.1; 4.7–4.12, printed pp. 29–30 and 59–62: Boundary construction and axioms, with author-copy filtration misprint recorded in E1.

**Uses.**

- **ShimuraCompactifications:C2/partial-boundary-charts**: Supplies the actual mixed boundary torsor and parabolic quotient.
- **AutomorphicBundles:B3**: Uses the same boundary datum for canonical coefficient charts.

**API.**

- **`MixedBoundaryDatum.pureQuotient`** (projection): The quotient P1/W1 with its induced domain is the existing pure boundary datum.
- **`MixedBoundaryDatum.weightFiltration`** (characterisation): The three steps are exactly Lie U1, Lie W1 and Lie P1; V1 identifies with gr_-1.
- **`MixedBoundaryDatum.conjugation`** (functoriality): Rational conjugation transports the groups, domain cover, h1 and filtrations with the V2 boundary label.
- **`MixedBoundaryDatum.h_finiteFibers`** (structure): The map h1 has finite fibers; the definition keeps X1 rather than setting X1=image h1.
- **`MixedBoundaryDatum.ext`** (extensionality): With the ambient datum and homogeneous cover fixed, equality of the algebraic subgroup embeddings P1,W1,U1 and the boundary h1/domain data determines equality of boundary data; axiom proofs add no extra carrier.

**Unit tests.**

- **`MixedBoundaryDatum.siegel2_rank1_test`** (computation): At a genus-two rank-one cusp, U1 has rank 1 and V1 dimension 2, so W1 has dimension 3.
- **`MixedBoundaryDatum.pure_test`** (degenerate): When W1=1, U1=1 and the Lie algebra of P1 is entirely weight zero.
- **`MixedBoundaryDatum.hodge_test`** (compatibility): The induced graded structures are the supplied HodgeStructure on the native weight-graded quotient.
- **`MixedBoundaryDatum.radical_center_test`** (non-example): Using all W1 as the torus character group gives rank 3 instead of 1 at the genus-two rank-one cusp and fails.

**Acceptance.**

- For the rank-one Siegel cusp of genus 2, dim U1=1 while dim W1=3.
- For a pure datum the unipotent radical is zero and the entire adjoint Lie algebra remains in weight zero.

**Planet:** Mixed Shimura boundary datum.

### Boundary weight and Hodge filtrations

**Node:** `ShimuraCompactifications:C1/boundary-mixed-hodge-structure`. **Declaration:** `TauCeti.ShimuraCompactifications.C1.boundary_mixed_hodge_structure`. **Kind:** construction.

For a rational representation of the boundary group P1 and a chosen invariant integral lattice, construct the native mixed Hodge structure induced by h1, with its genuine rational/complex base changes. If the representation is the restriction of a rational representation of the original group P, Pink 4.12 compares corresponding points x and x1: the Hodge filtration is unchanged while the weight filtration changes. This comparison is not asserted for an arbitrary P1 representation that does not extend to P. For the boundary adjoint representation, the weight steps are Lie U1, Lie W1 and Lie P1, with graded types (-1,-1), {(-1,0),(0,-1)} and {(-1,1),(0,0),(1,-1)}.

**Hypotheses.**

- Use mixed-boundary-datum and the chosen rational/integral representation with genuine rational and complex base-change models. Do not postulate a canonical integral lattice in every rational representation.
- For Hodge-filtration agreement, fix an ambient rational P representation, restrict it to P1, and use the associated points x and x1 of Pink 4.12. The independent boundary adjoint calculation does not assert that the P1 adjoint representation extends to P.

**Construction or proof.**

1. Factor the boundary homomorphism through Pink's standard H0 construction and transport the induced filtrations on the representation.
2. Identify the induced pure Hodge structure on each weight quotient through the existing graded carrier. The adjoint weight statements follow from the unipotent groups.
3. Apply Pink 4.12 only to an ambient P representation restricted to P1 at corresponding points; import strictness and filtered tensor/morphism APIs from HodgeStructures L2 for boundary representations themselves.

**Direct prerequisites.** `ShimuraCompactifications:C1/mixed-boundary-datum`, `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne`, `tauceti:TauCeti.Hodge.MixedHodgeStructure.gradedHodgeStructure`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 4.7–4.12, especially 4.12, printed pp. 59–62: Constructs boundary filtrations and proves Hodge-filtration agreement.

**Uses.**

- **ShimuraCompactifications:C1/boundary-torsor-tower**: Identifies torus and abelian pieces of the actual boundary neighbourhood.

**API.**

- **`BoundaryMHS.weight_adjoint`** (characterisation): Its weight steps identify with the three specified Lie subobjects.
- **`BoundaryMHS.hodge_boundary_eq`** (compatibility): For a rational representation of P restricted to P1 and the corresponding x,x1 of Pink 4.12, the original and boundary Hodge filtrations agree on the same complexified representation.
- **`BoundaryMHS.map`** (functoriality): Representation maps are morphisms of the native mixed Hodge structures and are strict by the owner API.
- **`BoundaryMHS.native_filtrations`** (compatibility): The returned native mixed Hodge structure has exactly the h1-induced WQ and F on the specified base-change models; its graded Hodge filtration is the induced quotient filtration of the pinned carrier.

**Unit tests.**

- **`BoundaryMHS.pure_test`** (degenerate): For a pure boundary group W1=1, W_-1=0 and W_0=Lie P1.
- **`BoundaryMHS.siegel2_test`** (computation): At a genus-two rank-one cusp, gr_-2 has dimension 1 and gr_-1 dimension 2.
- **`BoundaryMHS.graded_test`** (compatibility): The graded Hodge filtration is exactly the induced quotient filtration, not an unrelated pure structure.

**Acceptance.**

- The pure quotient has weight zero adjoint Lie algebra.
- The commutator lands in the weight-minus-two piece rather than identifying it with gr_-1.

**Planet:** Boundary mixed Hodge structure.

### Pure quotients and boundary torsors

**Node:** `ShimuraCompactifications:C1/boundary-torsor-tower`. **Declaration:** `TauCeti.ShimuraCompactifications.C1.boundary_torsor_tower`. **Kind:** construction.

At a neat boundary level, construct the mixed arithmetic boundary quotient as a torus torsor over an abelian-scheme torsor over a finite cover of the pure boundary Shimura variety. Its torus comes from the arithmetic lattice in U1, and its abelian directions from W1/U1. The commutator determines the Poincare/cubical torsor class. This is the boundary part of mixed Shimura theory; canonical models of the special mixed torsors required for descent are a separate supplier request.

**Hypotheses.**

- Use mixed-boundary-datum, its Hodge structure and the actual arithmetic lattices from K. Assume neatness for the asserted torsor form; at non-neat level retain finite stabilizer quotients.
- Use the exact central lattice Gamma_U(-1) and the weight-minus-one lattice; they are not interchangeable.

**Construction or proof.**

1. Pink 3.12–3.19 express the U quotient as an algebraic torus and the V/F0 quotient as a complex torus with the supplied polarization.
2. Apply the abelian-algebraization/polarization input to the compact weight-minus-one torus, and construct the commutator torsor through its line-bundle class.
3. Assemble the quotients over the pure arithmetic boundary quotient, compare transition maps and keep the finite level cover; pass to non-neat finite quotients separately.

**Direct prerequisites.** `ShimuraCompactifications:C1/mixed-boundary-datum`, `ShimuraCompactifications:C1/boundary-mixed-hodge-structure`, `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A5`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`, `ShimuraVarieties:V0/component-decomposition`, `tauceti:TauCeti.SplitTorus.groupScheme`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 3.12–3.22; 6.1–6.7; 7.2–7.5: Central torus and abelian-torsor tower with finite homogeneous-cover and stabilizer qualifications.

**Uses.**

- **ShimuraCompactifications:C0/relative-torus-embedding**: Instantiates the generic torsor chart without reversing the C0→C1 dependency.
- **ShimuraCompactifications:C2**: Supplies the mixed neighbourhood of each existing rational boundary.

**API.**

- **`BoundaryTorsor.torusCharacters`** (characterisation): The character lattice is dual to the actual integral U1 lattice.
- **`BoundaryTorsor.abelianQuotient`** (projection): The quotient by the central torus is the constructed abelian torsor over the pure boundary base.
- **`BoundaryTorsor.levelChange`** (functoriality): Specified level changes induce the lattice/torsor maps and commute with rational conjugation.

**Unit tests.**

- **`BoundaryTorsor.siegel2_klingen_test`** (computation): The genus-two rank-one cusp has torus rank 1 and an elliptic abelian direction.
- **`BoundaryTorsor.siegel2_siegel_test`** (degenerate): The maximal genus-two cusp has torus rank dim Sym²(Z²)=3 and abelian dimension zero.
- **`BoundaryTorsor.nontrivial_test`** (non-example): A nontrivial character line gives a nontrivial torus torsor, not a chosen product with G_m.

**Acceptance.**

- At a genus-two rank-one Siegel cusp the abelian fibre has dimension 1 and the torus rank is 1.
- At a maximal genus-two cusp the torus rank is 3 and there is no positive-dimensional abelian fibre.

**Planet:** Boundary torus torsor.

### Cusp labels and their equivalence

**Node:** `ShimuraCompactifications:C1/cusp-label`. **Declaration:** `TauCeti.ShimuraCompactifications.C1.cusp_label`. **Kind:** definition.

Define an adelic cusp label from the existing rational boundary component/parabolic, its boundary mixed datum and the finite-adelic level representative. Quotient by the actual rational conjugation, boundary arithmetic action and right-K action. A cone label adds a cone in that cusp's common lattice and uses the compatible induced equivalence. Neither a representative nor a connected/irreducible component of its boundary base is identified with the entire equivalence class.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- The mixed boundary datum and the finite adelic double-coset description are supplied; use Pink's finite cover X1.

**Construction or proof.**

1. Define the equivalence relation by Pink 6.10–6.12 elementary actions and boundary identifications; prove the displayed commutation relations give a consistent quotient.
2. Compute the stabilizing action on the central lattice and transport cone membership, preserving the actual cusp datum.
3. Use arithmetic double-coset finiteness and finite cone orbits for the finite set of stratum labels used in a complete compactification.

**Direct prerequisites.** `ShimuraCompactifications:C1/mixed-boundary-datum`, `AdelicAlgebraicGroups:AA.3`, `ShimuraCompactifications:C0/arithmetic-admissible-fan`, `ShimuraVarieties:V2/rational-boundary`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.10–6.12 and 7.2–7.5, printed pp. 100–102 and 118–120: Actual label equivalence and stratum quotients.

**Uses.**

- **ShimuraCompactifications:C2/arithmetic-gluing**: Indexes quotient charts and their overlaps.
- **ShimuraCompactifications:C5/formal-completion**: Preserves the cusp/cone labels in formal charts.

**API.**

- **`CuspLabel.representative_invariant`** (relation): All elementary rational/level transformations give the same cusp class.
- **`CuspLabel.cone_transport`** (functoriality): The label equivalence transports cones through the specified integral map.
- **`CuspLabel.finite`** (structure): At finite level the cusp classes are finite; complete admissible cone systems have finitely many cone-label orbits.
- **`CuspLabel.mk`** (constructor): A genuine boundary/cusp representative with its finite-adelic level data defines its class in the equivalence quotient.
- **`CuspLabel.eq_iff`** (characterisation): Two representatives have equal cusp labels exactly when they are related by the source's specified rational/level elementary equivalence; no chosen representative is part of a quotient label.

**Unit tests.**

- **`CuspLabel.modular_test`** (computation): For GL2-type modular data cusp labels reduce to the standard rational-cusp double cosets with their level width.
- **`CuspLabel.representative_test`** (compatibility): Right multiplication by K gives the identical cusp class.
- **`CuspLabel.component_test`** (non-example): A cusp base with two connected components has one admissible cusp class but two possible component strata; they are not collapsed.

**Acceptance.**

- Changing a representative by an allowed action does not change the stratum label.
- Labels never force a disconnected boundary base to be irreducible.

**Planet:** Cusp label.

### Effective arithmetic stabilizers and finite overlap

**Node:** `ShimuraCompactifications:C1/arithmetic-stabilizer`. **Declaration:** `TauCeti.ShimuraCompactifications.C1.arithmetic_stabilizer`. **Kind:** theorem.

Construct the cusp normalizer quotient Delta1 and its effective action on U1/lattices. For polyhedral cones sigma,tau in the rational closure, the set of EFFECTIVE arithmetic images gamma for which gamma(sigma) intersects tau in the open positivity cone is finite. Identify the ineffective kernel up to the specified central/arithmetic subgroups. Cone stabilizers act through finite groups; neatness removes the relevant effective finite cone action. Do not assert that the full normalizer is finite or that a merely neat level removes every central kernel.

**Hypotheses.**

- Use Pink 6.18 definitions and the positivity cone from the actual boundary datum. Both cones are in the appropriate rational closure.
- The finite-overlap conclusion uses the arithmetic reduction input for the homogeneous positivity cone, requested from AA.3/V2.

**Construction or proof.**

1. Pass to the image rho(Q) of the cusp normalizer on U1; identify the kernel using Pink 6.20 rather than counting every ineffective element.
2. Apply Pink 6.19(a) arithmetic reduction to cone intersections and 6.19(b) a rational polyhedral reduction domain.
3. Derive finite cone stabilizer images; use neatness on the finite effective action and retain the ineffective quotient in the torsor/stack model.

**Direct prerequisites.** `ShimuraCompactifications:C1/mixed-boundary-datum`, `ShimuraVarieties:V2/rational-boundary`, `AdelicAlgebraicGroups:AA.3`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.18–6.21, printed pp. 105–109: Effective finite-overlap argument; AMRT reduction proof remains a named source leaf.

**Acceptance.**

- An infinite central kernel does not contradict finite effective overlap.
- The quotient action must preserve the central lattice.

**Planet:** Cusp stabilizer.

### Positivity cones and boundary incidence

**Node:** `ShimuraCompactifications:C1/boundary-incidence`. **Declaration:** `TauCeti.ShimuraCompactifications.C1.boundary_incidence`. **Kind:** theorem.

Identify the positivity cone C(P1,X1) and its rational closure as the union of the cones of incident rational boundary data. For a pure initial datum the cone is open convex nondegenerate homogeneous self-adjoint in U1(R); general mixed reductions may carry lineality and require the quotient in Pink 4.15. Prove nested-boundary and rational-conjugation formulas on groups, central lattices, torsors and cones, preserving the V2 analytic incidence relation.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. No universal abelian scheme is assumed for this datum.
- Use the exact embedded central spaces and quotient maps of Pink 4.22–4.25; C* need be neither open nor closed.

**Construction or proof.**

1. Pink 4.15 identifies the pure-boundary cone using the Hodge representation and Cartan involution.
2. Pink 4.22–4.25 give the rational closure and intersection/quotient identities for incident components.
3. Transport through conjugation and the cusp-label equivalence, producing the face/stratum order for the toroidal charts.

**Direct prerequisites.** `ShimuraCompactifications:C1/mixed-boundary-datum`, `ShimuraCompactifications:C1/boundary-mixed-hodge-structure`, `ShimuraVarieties:V2/rational-boundary`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 4.15 and 4.22–4.25, printed pp. 63–64 and 68–69: Positivity and rational closure, with pure/mixed lineality distinction.

**Acceptance.**

- For Siegel maximal cusps C is the positive-definite symmetric cone; C* includes positive-semidefinite forms with rational radical.
- Do not replace C* by the topological closure with irrational-radical boundary points.

## C2

Construct the continuous toroidal-to-minimal map before compactness; properness and its algebraic comparison follow after compactness and algebraization. Partial charts and controlled identifications need the nilpotent-preserving analytic-space supplier. A proper-scheme Hom comparison does not give algebraization existence or the algebraic-space extension. Neat smooth fans give the stated local normal-crossings result; the separate no-self-identification condition remains explicit. Canonical boundary models require the special mixed supplier.

### Partial compactifications of boundary torsors

**Node:** `ShimuraCompactifications:C2/partial-boundary-charts`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.partial_boundary_charts`. **Kind:** construction.

Construct the local partial analytic compactification attached to each C1 boundary torus torsor and its C0 cone system. On ordinary finite regular split charts it is the analytification of the supplied toric relative embedding, with the same character functions, face opens and orbit strata. For nonregular cones use the actual monoid-algebra analytic chart, retaining its singular and nilpotent structure; do not define every analytic chart to be a polydisc.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Complex analytic spaces include nilpotents, structure sheaves, open gluing, fibre products and group actions. These are supplied by ComplexComparisonPartII:C0, with its still-open carrier gap exposed.

**Construction or proof.**

1. Analytify the finite-type relative monoid charts through the owner functor and identify the regular coordinate specializations with L2.
2. Glue ordinary face opens using the torsor transition functions and L3 finite-chart comparisons; nonregular charts require the recorded analytic monoid-algebra extension.
3. Retain the boundary lattice, cusp representative and group action for the subsequent arithmetic quotient, with the stratum comparison from L4.

**Direct prerequisites.** `ShimuraCompactifications:C1/boundary-torsor-tower`, `ShimuraCompactifications:C1/cusp-label`, `ShimuraCompactifications:C0/relative-torus-embedding`, `ShimuraCompactifications:C0/relative-face-open`, `ComplexComparisonPartII:C0/repair-analytification`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-2-affine-analytic-charts-of-regular-cones`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-3-finite-fan-analytic-gluing`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-4-torus-actions-strata-and-the-boundary`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.6–6.17, especially the construction in 6.13 and elementary identifications in 6.14–6.17, printed pp. 98–105: Partial torus embeddings and transition maps.

**Uses.**

- **ShimuraCompactifications:C2/arithmetic-gluing**: Supplies the actual local chart, not an unspecified resolution.

**API.**

- **`PartialBoundaryChart.openTorsor`** (structure): The original boundary torsor is an equivariant open subspace.
- **`PartialBoundaryChart.faceOpen`** (functoriality): A face gives the same ordinary open immersion as analytification of the relative toric face map.
- **`PartialBoundaryChart.anchor`** (compatibility): A finite regular trivialized complex chart identifies with the anchor chart, preserving characters and strata.
- **`PartialBoundaryChart.glue_hom`** (universal-property): Compatible analytic maps on the finite-type monoid charts agreeing on the face-open cocycle glue uniquely to the partial boundary space, in the nilpotent-preserving analytic category.

**Unit tests.**

- **`PartialBoundaryChart.zero_test`** (degenerate): The zero cone adds no boundary.
- **`PartialBoundaryChart.rankOne_test`** (computation): The trivial positive-ray chart is analytically A1_C with its G_m open.
- **`PartialBoundaryChart.nilpotent_test`** (non-example): Analytification of a nonreduced finite-type base keeps the epsilon class; passing to the reduced manifold fails.

**Acceptance.**

- The zero-cone chart is the original torsor.
- The analytic image of Spec C[epsilon]/epsilon² retains its nilpotent structure.

**Planet:** Partial toroidal compactification.

### Arithmetic quotient neighbourhoods and separation

**Node:** `ShimuraCompactifications:C2/quotient-separation`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.quotient_separation`. **Kind:** theorem.

The elementary relation on partial boundary charts admits actual local quotient neighbourhoods by the cusp normalizer, has closed graph, and yields a Hausdorff complex analytic quotient with finite effective local stabilizers. Quotient invariant sheaves supply the local analytic structure. Neatness removes the effective finite stabilizer at smooth cone charts; arbitrary level retains the finite quotient, without asserting smoothness.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Use Pink's controlled neighbourhoods V1→V2→V3 in the rational Satake space, with V2/satake-compactness and its local topology/reduction contract.
- The ineffective center is removed through the specified quotient action; finiteness of the full cusp group is not assumed.

**Construction or proof.**

1. Pink 6.19 finite effective overlap gives discontinuity on the cone charts; use the controlled Satake neighbourhoods of 6.22 rather than all boundary completions.
2. Identify the chart equivalence relation on those neighbourhoods with the cusp-normalizer action; Pink 6.23 then proves its graph closed.
3. Construct the invariant analytic sheaf on the finite local quotient. Closed graph and the local separation results prove Hausdorffness; smoothness requires the neat/regular hypotheses.

**Direct prerequisites.** `ShimuraCompactifications:C2/partial-boundary-charts`, `ShimuraCompactifications:C1/arithmetic-stabilizer`, `ShimuraVarieties:V2/satake-compactness`, `ComplexComparisonPartII:C0/repair-analytification`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-3-finite-fan-analytic-gluing`, `SchemeAndStackFoundations:SF.1`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.20–6.24, printed pp. 107–112: Controlled neighbourhood quotient and closed graph; AMRT neighbourhood proof is a recorded source leaf.

**Acceptance.**

- A finite nontrivial stabilizer may give a normal singular quotient.
- Closed graph is a proved input, not an automatic consequence of finite cone orbits.

### Arithmetic toroidal gluing

**Node:** `ShimuraCompactifications:C2/arithmetic-gluing`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.arithmetic_gluing`. **Kind:** construction.

Glue the local arithmetic quotient charts by Pink's rational conjugation, adelic-level and nested-boundary transitions to construct the actual analytic toroidal space Sh_K^tor(Sigma). It contains the original Sh_K(C), has the cone/cusp orbit stratification, and agrees with each controlled quotient neighbourhood. The gluing cocycle and effective quotient are part of the construction.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Use the actual analytic-space category, quotient charts and their open transition maps. Completeness is not needed for the local construction; it is needed for compactness.

**Construction or proof.**

1. Form the disjoint union of partial charts with their original interior and the elementary equivalence relation of Pink 6.10–6.12.
2. Use quotient-separation to descend structure sheaves and open charts through the controlled local equivalence relation.
3. Apply open analytic gluing and the transition cocycle to obtain the space and its atlas; identify the original interior and the cusp/cone orbit strata.

**Direct prerequisites.** `ShimuraCompactifications:C2/partial-boundary-charts`, `ShimuraCompactifications:C2/quotient-separation`, `ShimuraCompactifications:C1/boundary-incidence`, `ShimuraCompactifications:C1/cusp-label`, `ComplexComparisonPartII:C0/repair-analytification`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-3-finite-fan-analytic-gluing`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.10–6.12 and 6.24, printed pp. 100–102 and 112: Actual quotient/gluing construction.

**Uses.**

- **ShimuraCompactifications:C2/minimal-boundary-map**: Constructs the source of the comparison to V2's minimal compactification.
- **ShimuraCompactifications:C3**: Constructs sources and targets of refinement maps.

**API.**

- **`ToroidalSpace.chart`** (structure): Each controlled arithmetic quotient neighbourhood embeds as its stated open chart.
- **`ToroidalSpace.interior`** (structure): The original analytic Shimura quotient is the given open subspace.
- **`ToroidalSpace.strata`** (characterisation): The strata are the actual cone-label quotients with the nested-boundary incidence rule.
- **`ToroidalSpace.chart_overlap`** (compatibility): Transition maps on a triple overlap satisfy the cocycle inherited from elementary label actions.
- **`ToroidalSpace.descend_hom`** (universal-property): Compatible invariant maps on the controlled quotient charts, agreeing under all elementary boundary/level identifications, descend uniquely to the glued arithmetic toroidal quotient.

**Unit tests.**

- **`ToroidalSpace.compact_interior_test`** (degenerate): If the pure Shimura variety has no rational boundary, the toroidal space is the interior.
- **`ToroidalSpace.modular_q_test`** (computation): A modular cusp of width w gives the usual punctured q-disc plus its q=0 point.
- **`ToroidalSpace.anchor_test`** (compatibility): A trivialized finite regular chart has the anchor's face-open overlap rather than an unrelated gluing.

**Acceptance.**

- An interior point is not identified with an unrelated cusp representative.
- The construction depends on Sigma through the specified chart system.

**Planet:** Toroidal compactification.

### Normality and the dense open interior

**Node:** `ShimuraCompactifications:C2/normal-open-dense`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.normal_open_dense`. **Kind:** theorem.

The actual analytic toroidal space is normal and contains Sh_K(C) as an open dense analytic subspace. Nonregular rational saturated monoid charts remain allowed. Normality comes from normal toric chart algebras and finite invariant quotients, not from assuming a smooth compactification exists.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Complex boundary bases are the actual smooth/normal mixed quotient bases; dual monoids are saturated in their character lattices.

**Construction or proof.**

1. Use integral saturated monoid normality on each complex chart and normality of the boundary base.
2. Finite stabilizer invariant rings/sheaves preserve normality. Descend this through the quotient neighbourhood atlas.
3. The ordinary torus is schematically dense in each monoid chart; transport the interior identification through the elementary chart relation.

**Direct prerequisites.** `ShimuraCompactifications:C2/arithmetic-gluing`, `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`, `ShimuraCompactifications:C2/quotient-separation`, `SchemeAndStackFoundations:SF.0`, `ComplexComparisonPartII:C0/repair-analytification`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.7 and 6.24, printed pp. 98–99 and 112: Normal finite quotient charts and their open dense interior.

**Acceptance.**

- A singular saturated cone gives a normal chart without being smooth.
- Normality is not claimed over every nonnormal coefficient ring of C0.

### Complete admissible fans give proper toroidal models

**Node:** `ShimuraCompactifications:C2/compactness-properness`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.compactness_properness`. **Kind:** theorem.

If the cusp fan system is complete and admissible, the analytic toroidal space is compact. Once algebraized, the resulting algebraic model is proper over its characteristic-zero field. Finite arithmetic orbit control, complete cusp support and the compact minimal/Satake base are all retained.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- The system is complete with the required finite cone/cusp orbit conditions. Use the algebraization theorem when asserting algebraic properness.

**Construction or proof.**

1. Map the constructed space to the compact rational Satake quotient.
2. Pink 6.27 uses controlled quotient charts and the torus valuation/support criterion to prove compactness above a finite cover of the Satake base.
3. Compactness over C supplies analytic properness to a point, and also properness of the comparison to the Hausdorff minimal space. After a separate algebraization, apply the owner's properness comparison; no integral properness follows from this step.

**Direct prerequisites.** `ShimuraCompactifications:C2/arithmetic-gluing`, `ShimuraCompactifications:C2/minimal-boundary-map`, `ShimuraCompactifications:C0/relative-fan-properness`, `ShimuraVarieties:V2/satake-compactness`, `ComplexComparisonPartII:C2`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.27, printed pp. 114–115: Compactness proof for complete admissible arithmetic cone systems.

**Acceptance.**

- Deleting a needed boundary cone can destroy compactness.
- Properness of an integral C5 model requires its own valuative argument.

**Planet:** Toroidal properness.

### Neat smooth fans and normal crossings

**Node:** `ShimuraCompactifications:C2/smooth-normal-crossings`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.smooth_normal_crossings`. **Kind:** theorem.

At neat level with a smooth admissible fan, the analytic toroidal space is smooth and its boundary is a normal-crossings divisor in the local sense. A global simple/no-self-intersection assertion requires the separate face no-self-identification condition. Compare its regular quotient coordinates with the ordinary coordinate hyperplanes supplied by L4.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- K is neat; every cone is regular in the actual central lattice. For the stronger global branch separation impose Pink 7.12(*)/9.20 explicitly.

**Construction or proof.**

1. Identify each regular torsor chart with polynomial/Laurent coordinates over the smooth boundary base.
2. Apply the effective stabilizer result at neat level to preserve smoothness and local coordinate branches under the quotient.
3. The boundary is locally a union of coordinate hyperplanes. Trace face identifications separately before asserting global simple normal crossings.

**Direct prerequisites.** `ShimuraCompactifications:C2/arithmetic-gluing`, `ShimuraCompactifications:C0/relative-regular-coordinates`, `ShimuraCompactifications:C0/relative-boundary-coordinates`, `ShimuraCompactifications:C1/arithmetic-stabilizer`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-4-torus-actions-strata-and-the-boundary`, `ComplexComparisonPartII:C0/repair-analytification`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.26; 9.20–9.21, printed pp. 113–114 and 155–156: Local smoothness and extra refinement for no self-identification.

**Acceptance.**

- Simplicial nonregular cones do not satisfy this smoothness theorem.
- Two locally separate branches can still be globally identified without the extra fan condition.

**Planet:** Normal crossings boundary.

### Algebraization for projective admissible fans

**Node:** `ShimuraCompactifications:C2/projective-algebraization`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.projective_algebraization`. **Kind:** theorem.

A smooth projective admissible fan at neat level gives a projective algebraization of the complete analytic toroidal space, whose ample line comes from the invariant piecewise-linear polarization. For arbitrary level construct the finite quotient algebraic model and its descended ample power. For a general admissible fan without the ample-cover condition construct the algebraic-space algebraization; do not call every proper toroidal algebraic space a projective scheme.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- For the projective conclusion use complete projective admissible Sigma. The general algebraic-space conclusion uses the effective analytic/algebraic descent contract and Pink's local ample charts.

**Construction or proof.**

1. Pink 9.18–9.24 attach polarization line bundles to the arithmetic torus charts and prove their quotient compatibility.
2. An invariant ample power gives the neat projective realization through the complex comparison owner's Chow/GAGA algebraization theorem.
3. For a non-neat level descend from a normal neat subgroup through a finite quotient; for nonprojective systems use algebraic-space charts and Pink 12.5 instead of assuming an ample global line.

**Direct prerequisites.** `ShimuraCompactifications:C2/arithmetic-gluing`, `ShimuraCompactifications:C0/smooth-projective-refinement`, `ShimuraCompactifications:C2/normal-open-dense`, `ComplexComparisonPartII:C2`, `ComplexComparisonPartII:C4`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`, `ShimuraCompactifications:C2/compactness-properness`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 9.24; 12.4–12.5, printed pp. 157–158 and 197–198: Scheme algebraization needs ample cover; algebraic spaces have the unconditional version.

**Acceptance.**

- Projectivity records an actual ample line, not only compactness.
- A nonprojective complete fan is not forced into a projective scheme.

**Planet:** Projective toroidal algebraization.

### Comparison with the existing minimal compactification

**Node:** `ShimuraCompactifications:C2/minimal-boundary-map`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.minimal_boundary_map`. **Kind:** theorem.

Construct the continuous analytic comparison from the actual toroidal quotient to the already-owned minimal compactification. On each boundary cone stratum it is the map through the associated pure boundary quotient; its cone-stratum restriction is the specified torus/abelian-torsor quotient map. Preserve the cusp equivalence classes and incidence order; do not assume each entire boundary fibre or stratum is irreducible. Properness is a later consequence of compactness-properness for complete fans and a Hausdorff minimal target; its algebraic form is obtained after projective-algebraization. Neither conclusion is an input to constructing the continuous map.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Use V2's actual Baily–Borel/Satake algebraization and its boundary strata. The source toroidal model is the C2 construction, not a resolution chosen from an existence theorem.

**Construction or proof.**

1. The ordinary partial embedding has the canonical map to its pure boundary quotient.
2. Pink 6.22–6.24 show these maps agree under elementary identifications and are continuous for the rational Satake topology; glue them on the constructed quotient.
3. Identify the cone-stratum restriction using Pink 7.2–7.5. The continuous comparison is constructed before compactness. Once compactness-properness and algebraization have been established, the same map is proper and the proper-morphism GAGA interface algebraizes it; these are subsequent consequences, not prerequisites of this construction.

**Direct prerequisites.** `ShimuraCompactifications:C2/arithmetic-gluing`, `ShimuraCompactifications:C1/boundary-torsor-tower`, `ShimuraCompactifications:C1/boundary-incidence`, `ShimuraVarieties:V2/baily-borel`, `ComplexComparisonPartII:C4`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.21–6.24, printed pp. 109–112; 7.2–7.5, printed pp. 118–120: The toroidal-to-minimal map and actual quotient strata.

**Acceptance.**

- A cone-label quotient maps to its existing pure boundary stratum.
- The map is independent of the chosen cusp representative.

### Canonical models of toroidal compactifications

**Node:** `ShimuraCompactifications:C2/canonical-toroidal-model`. **Declaration:** `TauCeti.ShimuraCompactifications.C2.canonical_toroidal_model`. **Kind:** construction.

For a datum class with the actual pure canonical model and the special mixed-boundary canonical torsors supplied, descend the constructed toroidal algebraization to its reflex field E. The canonical model restricts to the supplied pure canonical model and has the specified completed boundary torsor charts. It is a scheme when Pink 12.4's ample-cover condition holds and otherwise an algebraic space as in 12.5. Canonical-model uniqueness on the dense interior determines morphisms after existence; it does not by itself construct boundary descent.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Supply the canonical models of the actual boundary pure data and their special mixed torus/abelian torsors, reflex-field compatibility and dense special mixed points. V8 supplies pure functoriality; its general completion is instantiated only in C2.general.
- The fan is rational and compatible with the descent actions. Scheme effectivity requires the explicit ample-line-cover hypothesis.

**Construction or proof.**

1. Pink 12.1 identifies boundary reflex fields. Compare Galois transports of the special mixed canonical torsor charts and their formal neighbourhoods.
2. Pink 12.6–12.8 use special mixed-point density and normality to extend the descent isomorphisms from the interior; check the overlap cocycle on the actual charts.
3. Descend as an algebraic space by effective descent. Use the ample cover of 12.4 only for scheme effectivity and identify the restricted pure model by V8 uniqueness. The unread density proof 12.13–12.17 is exposed as a supplier/source gap.

**Direct prerequisites.** `ShimuraCompactifications:C2/projective-algebraization`, `ShimuraCompactifications:C2/minimal-boundary-map`, `ShimuraVarieties:V8`, `SchemeAndStackFoundations:SF.1`, `ComplexComparisonPartII:C4`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.1–12.8, printed pp. 196–199: Construction and effectivity conditions; density proof is explicitly not claimed read.

**Uses.**

- **ShimuraCompactifications:C2.general**: Instantiates the same construction with general pure canonical models.
- **ShimuraCompactifications:C3**: Provides algebraic sources and targets for descended refinement and Hecke maps.

**API.**

- **`ToroidalCanonicalModel.interior`** (compatibility): Restriction to Sh_K is the actual canonical model over E.
- **`ToroidalCanonicalModel.boundaryCompletion`** (characterisation): Each labelled completed neighbourhood is the specified mixed canonical torsor embedding over E.
- **`ToroidalCanonicalModel.descent_cocycle`** (structure): The Galois descent isomorphisms obey the cocycle and preserve the labelled boundary maps.
- **`ToroidalCanonicalModel.unique`** (extensionality): Two effective descent models with the prescribed complex comparison and mixed boundary canonical identifications have the unique comparison isomorphism compatible with those data, by the specified descent/uniqueness theorem.

**Unit tests.**

- **`ToroidalCanonicalModel.empty_boundary_test`** (degenerate): For a compact Shimura variety the construction is its original canonical model.
- **`ToroidalCanonicalModel.baseChange_C_test`** (compatibility): Base change and analytification recover the C2 toroidal quotient with its original charts.
- **`ToroidalCanonicalModel.modular_cusp_test`** (computation): For a modular cusp the descended completed ring is the cyclotomic cusp ring with its width-normalized q parameter.

**Acceptance.**

- The dense-open pure canonical model agrees with the supplied one.
- An arbitrary formal chart isomorphism is not taken as an ordinary open overlap.

**Planet:** Canonical toroidal model.

## C2.general

Import the same C2 construction and the general canonical-model supplier, including the special mixed boundary torsor models and their descent compatibilities. The general interface does not introduce a second toroidal gluing construction.

### Toroidal canonical models for general pure data

**Node:** `ShimuraCompactifications:C2.general/general-toroidal-descent`. **Declaration:** `TauCeti.ShimuraCompactifications.C2_general.general_toroidal_descent`. **Kind:** theorem.

Instantiate the C2 descent construction for every pure Shimura datum using V8.general's actual general canonical tower/minimal models and the requested general boundary mixed canonical torsors. Preserve the existing rational boundary, cusp stabilizer and cone labels, together with the algebraic-space versus ample-cover scheme distinction. This adds no universal abelian scheme and no integral model at bad primes.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Use ShimuraVarieties:V8.general/general-tower and general-minimal, plus the special mixed-boundary canonical supplier in exactly the datum class needed by Pink 12.4–12.5.

**Construction or proof.**

1. Specialize the pure canonical and minimal inputs of canonical-toroidal-model to V8.general.
2. Identify each boundary pure datum and its canonical special mixed torsors with the unchanged C1 labels; the remaining mixed-model source leaf is recorded, not absorbed into general pure uniqueness.
3. Apply the same effective descent and ample-cover criterion, comparing the finite complex charts through L0/L2/L3/L4.

**Direct prerequisites.** `ShimuraCompactifications:C2/canonical-toroidal-model`, `ShimuraVarieties:V8.general/general-tower`, `ShimuraVarieties:V8.general/general-minimal`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-2-affine-analytic-charts-of-regular-cones`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-3-finite-fan-analytic-gluing`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-4-torus-actions-strata-and-the-boundary`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.4–12.5, printed pp. 197–198: General toroidal canonical descent with scheme/algebraic-space distinction.

**Acceptance.**

- The boundary pure datum is unchanged by choosing V7 auxiliary canonical-model data.
- No PEL moduli family is introduced for a general datum.

**Planet:** General toroidal canonical model.

## C3

Refinement maps use unchanged cusp support and commute with the specified finite family of datum/level maps. Structure-sheaf and higher-direct-image statements distinguish subdivisions from the toroidal-to-minimal contraction. Boundary ideal pullback can carry multiplicities; it is not identified with the reduced boundary ideal. Coefficient-specific vanishing and ordinary/formal comparisons retain their hypotheses.

### Proper arithmetic refinement maps

**Node:** `ShimuraCompactifications:C3/refinement-map`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.refinement_map`. **Kind:** construction.

For a compatible refinement Sigma′ of Sigma at fixed datum and level, construct the canonical proper map Sh_K^tor(Sigma′)→Sh_K^tor(Sigma), restricting to the identity on the interior and to the shared ordinary toric refinement maps in each finite regular split chart. Identity and composition are canonical equalities of maps. The C5 integral version uses its actual degeneration-chart atlas and is a separate instantiation of this map contract.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Sigma′ refines Sigma with unchanged cusp support. Use the actual C2 algebraic models, or the C5 integral models, and compatible boundary torsor data.

**Construction or proof.**

1. Define the chart maps by the common character-monoid inclusion and the supplied finite-chart L5 map.
2. The elementary rational, boundary and level identifications commute with these chart maps; descend and glue them on the arithmetic models.
3. Support equality gives properness on local charts. Identity/composition hold there and hence globally, with canonical descent over the reflex field.

**Direct prerequisites.** `ShimuraCompactifications:C2/canonical-toroidal-model`, `ShimuraCompactifications:C0/relative-fan-properness`, `ShimuraCompactifications:C1/cusp-label`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-3-finite-fan-analytic-gluing`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-4-torus-actions-strata-and-the-boundary`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-5-toric-maps-and-properness`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.25 and 9.22–9.23: Functorial compatible fan maps and refinements.
- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.4.2.2–6.4.2.3; 7.1.1.4: Integral instantiation and proper chart maps.

**Uses.**

- **ShimuraCompactifications:C3/coherent-cohomology-invariance**: Supplies the actual map for derived sheaf comparison.

**API.**

- **`ToroidalRefinement.interior`** (compatibility): The open restriction is the identity of the original Shimura model.
- **`ToroidalRefinement.comp`** (functoriality): Maps for successive refinements compose to the map for the composite refinement.
- **`ToroidalRefinement.proper`** (structure): The map is proper under the stated support and model hypotheses.
- **`ToroidalRefinement.id`** (simp): The map for the identity refinement is the identity of the actual toroidal model.

**Unit tests.**

- **`ToroidalRefinement.identity_test`** (degenerate): Refinement by the identical cone system gives the identity map.
- **`ToroidalRefinement.star_test`** (computation): The (1,1) star subdivision of the quadrant is the blow-up of A² at the origin.
- **`ToroidalRefinement.anchor_test`** (compatibility): On a finite regular complex chart the map is exactly the supplied L5 monomial map.

**Acceptance.**

- A nontrivial star subdivision gives a proper birational map, not an isomorphism.
- The zero refinement is the identity.

**Planet:** Toroidal refinement map.

### Compatible level and datum maps

**Node:** `ShimuraCompactifications:C3/level-datum-functoriality`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.level_datum_functoriality`. **Kind:** theorem.

Extend a specified level map, rational datum map or Hecke translation to the toroidal models when its induced central lattice maps send every source cone into a target cone. Maps are over the stated reflex-field compositum, preserve labelled boundary strata, and satisfy the source's ordered composition laws. The corresponding normal-level finite quotient is constructed under its exact invariant-fan hypotheses; a level map is not declared etale at the boundary from interior etaleness.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Provide compatible source and target fans for this particular map; use V8's pure finite-level/datum/translation maps and the actual C1 boundary lattice maps.

**Construction or proof.**

1. Use the induced monomial/torsor chart maps and Pink 6.25 compatibility with elementary identifications.
2. Descend and glue on the actual models, checking the same interior map and the boundary cone labels.
3. Prove composition and normal-level quotient by local chart comparison plus dense-open uniqueness. Record any boundary ramification in the lattice map.

**Direct prerequisites.** `ShimuraCompactifications:C3/refinement-map`, `ShimuraCompactifications:C0/compatible-common-refinement`, `ShimuraCompactifications:C1/boundary-incidence`, `ShimuraVarieties:V8`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-5-toric-maps-and-properness`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.25, printed pp. 113–114: Compatible fan maps, finite normal-level quotients and composition.

**Acceptance.**

- The Tate cusp map q↦q^p has boundary ramification even though its generic torus map is etale in characteristic zero.
- A datum map carries the specified reflex-field base change.

### Toroidal Hecke correspondences

**Node:** `ShimuraCompactifications:C3/hecke-span`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.hecke_span`. **Kind:** construction.

For a specified Hecke double coset choose compatible fans on its intermediate level and the two endpoints, and construct the ordered toroidal span extending V8's open Hecke span. A common refinement compares any two choices. The construction never claims one fixed fan admits every Hecke operator.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Use the two actual maps at the intersection level K intersect gKg^-1 with the ordered translation convention of V8/hecke-span.

**Construction or proof.**

1. Apply the finite-family compatible-refinement theorem to the two boundary lattice maps.
2. Construct both toroidal arrows by level-datum-functoriality, preserving their open restrictions.
3. Compare different intermediate fans through refinement-map and identify the spans after refinement.

**Direct prerequisites.** `ShimuraCompactifications:C3/level-datum-functoriality`, `ShimuraCompactifications:C0/smooth-projective-refinement`, `ShimuraVarieties:V8/hecke-span`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.25 and 9.23: Compatible finite family of morphisms supplies the toroidal span.

**Uses.**

- **AutomorphicBundles:B3**: Supplies the correspondence geometry for canonical/cuspidal coefficient maps.
- **IntegralCoherentHeckeComplexes**: Imports the actual refined span before defining trace maps.

**API.**

- **`ToroidalHeckeSpan.openRestriction`** (compatibility): The interior span is V8's ordered Hecke span.
- **`ToroidalHeckeSpan.commonRefinement`** (functoriality): Two compatible fan choices compare through a canonical refined span.
- **`ToroidalHeckeSpan.boundaryMap`** (structure): Each arrow maps its cone stratum through the stated cusp/lattice map.

**Unit tests.**

- **`ToroidalHeckeSpan.identity_test`** (degenerate): The identity double coset gives the identity span after the identity fan choice.
- **`ToroidalHeckeSpan.q_power_test`** (computation): A rank-one p-isogeny cusp arrow has the prescribed q↦q^p or q′^p=q map, not an etale extension by assumption.
- **`ToroidalHeckeSpan.refinement_test`** (compatibility): A further intermediate refinement leaves the open Hecke span unchanged.

**Acceptance.**

- The order of the two arrows agrees with the open correspondence.
- An incompatible fan is first refined.

**Planet:** Toroidal Hecke correspondence.

### Independence through common refinements

**Node:** `ShimuraCompactifications:C3/choice-comparison`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.choice_comparison`. **Kind:** theorem.

Any two admissible toroidal choices at fixed datum/level admit proper comparison maps from a common compatible refinement. Further common refinements give the same comparison diagrams. Choice independence means these maps and induced sheaf/cohomology identifications; it never means literal equality of all toroidal compactifications.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Both fans satisfy the stated support and compatibility requirements.

**Construction or proof.**

1. Apply compatible-common-refinement and construct the two refinement maps.
2. Apply the identity/composition API to compare two common refinements through a third.
3. Use the resulting commutative diagrams for the sheaf comparison theorems, separating map existence from higher-direct-image vanishing.

**Direct prerequisites.** `ShimuraCompactifications:C3/refinement-map`, `ShimuraCompactifications:C0/compatible-common-refinement`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 9.22–9.23: Comparison through common compatible refinements.

**Acceptance.**

- A blow-up and its target differ as spaces but compare through the stated proper map.

### Universal toric structure-sheaf acyclicity

**Node:** `ShimuraCompactifications:C3/toric-structure-sheaf-vanishing`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.toric_structure_sheaf_vanishing`. **Kind:** theorem.

For a finite rational fan subdivision Sigma′→Sigma with equal support, the proper toric map over any commutative ring R satisfies O→pi_*O as an isomorphism and R^i pi_*O=0 for i>0. State the two assertions independently. The integral monomial Cech proof is universal in R; finite regular complex maps supplied by L5 alone do not contain this cohomological theorem.

**Hypotheses.**

- Use the arbitrary-ring C0 toric realization. Check finite subdivision and support equality; the source need not be asserted smooth for the universal monomial argument.
- The required integral graded Cech exactness/contractibility lemma is a recorded proof leaf; the source quotation establishes the smooth-refinement applications, and the stronger universal argument must be verified before implementation.

**Construction or proof.**

1. Localize on an affine target cone and cover its subdivision inverse image by finitely many affine cone charts.
2. Grade the monomial Cech complex by the character lattice. Identify each weight complex with the integral relative polyhedral nerve complex and prove its augmentation exact with torsion-free/split terms.
3. Tensor that exact graded complex with arbitrary R, identify degree-zero functions and higher cohomology, then sheafify. The unread KKMS Ch. I §3 Corollaries on p44 remain an explicit source leaf.

**Direct prerequisites.** `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`, `ShimuraCompactifications:C0/relative-fan-properness`, `SchemeAndStackFoundations:SF.2`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-5-toric-maps-and-properness`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 7.1.1.4 and proof, printed pp. 532–533: Both degree-zero and higher assertions after coefficient base change.
- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Proposition 7.5, proof (7.13)–(7.14): Reduction to toric affine chart maps.
- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 3.4, proof of Proposition 3.4.1, author-copy pp. 15–16: Uses KKMS toric vanishing before the separately owned analytic comparison.

**Acceptance.**

- For the blow-up of the quadrant, pi_*O=O and positive higher direct images vanish.
- Normality alone proves neither universal coefficient change nor higher vanishing.

**Planet:** Toric refinement vanishing.

### Arithmetic structure-sheaf pushforward

**Node:** `ShimuraCompactifications:C3/refinement-structure-sheaf`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.refinement_structure_sheaf`. **Kind:** theorem.

For refinement maps of the actual normal arithmetic toroidal models, O_X→f_*O_X′ is an isomorphism. This degree-zero theorem also holds on the C5 integral models and normalization charts in the exact Lan 2017 setup. It is kept separate from positive-degree vanishing.

**Hypotheses.**

- Use the genuine proper refinement map and the actual ordinary/formal quotient charts. For changed levels include the finite-group invariant formulation of Lan 7.5 rather than identifying all functions outright.

**Construction or proof.**

1. On equal-level toric charts apply the degree-zero part of toric-structure-sheaf-vanishing.
2. Descend through the torsor and arithmetic quotient charts; for normalization-base comparisons use the noetherian normal Zariski-main input of Lan 7.5.
3. Glue the canonical map and verify that it restricts to the identity on the interior.

**Direct prerequisites.** `ShimuraCompactifications:C3/refinement-map`, `ShimuraCompactifications:C3/toric-structure-sheaf-vanishing`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Proposition 7.5, (7.6) and proof: Degree-zero map and normal-level invariant statement.

**Acceptance.**

- A finite level change generally gives invariant functions, not equality without taking invariants.

### Arithmetic higher direct-image vanishing

**Node:** `ShimuraCompactifications:C3/refinement-higher-structure-sheaf`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.refinement_higher_structure_sheaf`. **Kind:** theorem.

For a same-level refinement of the exact C2 or C5 toroidal models, R^i f_*O_X′=0 for every i>0, locally on the target, with the specified coefficient-base-change hypotheses. For Lan 2017 normalized integral models use its projective cone and lattice-collection setup, including the changed-level version only as stated there.

**Hypotheses.**

- The map has the quotient/torsor chart descriptions of the actual construction. Integral coefficient comparisons use the universal toric result or the exact Noetherian/Dedekind reduction of Lan 7.1.1.4.
- Formal comparison requires proper coherent formal functions; it is not obtained merely by recognizing completed coordinate rings.

**Construction or proof.**

1. Apply positive-degree toric acyclicity on each inverse image of an affine target chart.
2. Use proper formal functions and the torsor/finite quotient model to compare the completed pushforward, tracking the arithmetic action.
3. Faithful local descent proves the sheaf vanishing on the target. State it separately from the degree-zero result.

**Direct prerequisites.** `ShimuraCompactifications:C3/refinement-map`, `ShimuraCompactifications:C3/toric-structure-sheaf-vanishing`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`.

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Proposition 7.5, (7.8) and proof: Positive-degree structure-sheaf vanishing on normalized integral toroidal models.

**Acceptance.**

- The proof identifies every R^i locally, rather than deducing it from f_*O=O.

### Boundary ideal and its derived pushforward

**Node:** `ShimuraCompactifications:C3/refinement-boundary-ideal`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.refinement_boundary_ideal`. **Kind:** theorem.

For the same actual toroidal refinement maps, f_*I_D′=I_D and R^i f_*I_D′=0 for i>0. On a relative toric chart use the strict-positive monomial ideal of the UNION of boundary divisors, distinct from the face ideal of a closed stratum. Over a nonreduced coefficient base this is the base-changed boundary ideal, not its radical. On the good integral models it agrees with the stated reduced Cartier boundary ideal. In general f*I_D is only a subsheaf of I_D′.

**Hypotheses.**

- Use the same map/chart/coefficient hypotheses as refinement-higher-structure-sheaf. Cartierty of the boundary twist is asserted only for the stated regular toroidal models.
- The vanishing concerns the ideal on the source, not a falsely equal pullback ideal.

**Construction or proof.**

1. Use the strict-positive character grading in the toric Cech proof, retaining the relative boundary ideal in degree zero.
2. Lan 2017 Proposition 7.5(7.7),(7.9) descends both assertions through the actual completed toroidal charts.
3. On regular coordinates compare pullback vanishing orders of the reduced boundary with the new exceptional ray; the blow-up test rejects the printed pullback equality in Pilloni E40.

**Direct prerequisites.** `ShimuraCompactifications:C3/refinement-map`, `ShimuraCompactifications:C3/toric-structure-sheaf-vanishing`, `ShimuraCompactifications:C0/relative-boundary-coordinates`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`.

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Proposition 7.5, (7.7),(7.9): Derived boundary-ideal comparison.
- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 5.3; Theorem 6.1.5.1(2), author-copy pp. 24 and 29: Use the corrected derived pushforward, not the printed pullback equality.

**Acceptance.**

- Blow up (x,y)=(0,0): pullback of (xy) has exceptional order 2 while the new reduced boundary ideal has exceptional order 1.
- For the quadrant the boundary-union ideal is (xy), whereas its closed-stratum ideal is (x,y).

**Planet:** Boundary ideal pushforward.

### Canonical and cuspidal cohomology under refinement

**Node:** `ShimuraCompactifications:C3/coherent-cohomology-invariance`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.coherent_cohomology_invariance`. **Kind:** theorem.

For a canonical locally free coefficient E with the supplier comparison f*E=E′, refinement induces isomorphisms H^i(X,E)→H^i(X′,E′) and H^i(X,E tensor I_D)→H^i(X′,E′ tensor I_D′) for every i. Over the good integral base these remain valid for E0 tensor_B M for EVERY B-module M under Lan 7.1.1.4's Dedekind/field and the stated universal-chart hypotheses; M is not silently assumed flat.

**Hypotheses.**

- Canonical/subcanonical bundles and their refined comparison are supplied by AutomorphicBundles:B3/B4, with the requested integral formally-canonical extension. The geometric maps and O/I_D derived comparisons are independently available.
- For arbitrary modules use the exact coefficient argument: filtered colimits and finite generated module reduction over the Dedekind/field base, or universal integral chart exactness.

**Construction or proof.**

1. Apply the derived projection formula for locally free E to the O and I_D comparisons.
2. For integral arbitrary M follow Lan 7.1.1.4: reduce by filtered colimits to finitely generated modules, split torsion and projective parts over the Dedekind base, and check quotient-ring coefficients by the universal local chart argument.
3. Compare two fans through a common refinement and prove functoriality of the cohomology isomorphisms. The subcanonical step uses Rf_*I_D′=I_D, not pullback equality.

**Direct prerequisites.** `ShimuraCompactifications:C3/refinement-structure-sheaf`, `ShimuraCompactifications:C3/refinement-higher-structure-sheaf`, `ShimuraCompactifications:C3/refinement-boundary-ideal`, `ShimuraCompactifications:C3/choice-comparison`, `AutomorphicBundles:B3/refinement-canonical-extension`, `AutomorphicBundles:B4`, `SchemeAndStackFoundations:SF.2`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 7.1.1.4–7.1.1.5, printed pp. 532–533: Arbitrary coefficient-module proof and canonical Hodge comparison.
- [CG-2020](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), 5.2, published pp. 821–822; A.3.2, pp. 886–888: All-degree coherent coefficients including torsion.
- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 5.3, author-copy p. 24: Cuspidal coherent cohomology.

**Acceptance.**

- Take M=B/pi^n; the result must survive this nonflat coefficient change.
- It applies to every degree, not just H0.

**Planet:** Cohomology independence of the fan.

### Local vanishing for ordinary Igusa formal charts

**Node:** `ShimuraCompactifications:C3/partial-ordinary-formal-invariance`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.partial_ordinary_formal_invariance`. **Kind:** theorem.

Export the O and boundary-ideal derived refinement comparisons locally on each target toroidal chart and on compatible p-adic completions. After the ordinary Igusa owner constructs its actual finite-level/profinite-flat chart towers and quotients, these local comparisons give the independence of canonical and cuspidal coherent cohomology on its partial toroidal compactifications under the specified completed-coefficient and limit hypotheses. No unconstrained inverse-limit/tensor interchange or construction of Igusa varieties is included.

**Hypotheses.**

- Formal bases are the Noetherian p-adic chart models with proper comparison maps. For a profinite-flat or perfectoid limit, require the owner's finite-level descent, completion exactness, inverse-system and completed-tensor theorem.
- Pilloni's analytic plus-sheaf comparison and completed valuation coefficients belong to AdicSpacesPartII:R3; C3 supplies its algebraic toric input.

**Construction or proof.**

1. Complete the locally proved O/I_D comparisons using proper formal functions, retaining all finite quotient actions.
2. Restrict to the ordinary open on the target; locality preserves the finite-level comparison.
3. Supply the resulting local maps to the Igusa and adic comparison owners. Only after their proved limit/coefficient comparison may one deduce the stated partial-toroidal cohomology invariance.

**Direct prerequisites.** `ShimuraCompactifications:C3/refinement-higher-structure-sheaf`, `ShimuraCompactifications:C3/refinement-boundary-ideal`, `ShimuraCompactifications:C3/coherent-cohomology-invariance`, `SchemeAndStackFoundations:SF.2`, `AdicSpacesPartII:F0`, `AdicSpacesPartII:R3`.

**Source match.**

- [BP-2026](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), 3.4.15–3.4.16, author copy p. 39: Partial Igusa refinement application of Lan 7.5.
- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 3.4, author-copy pp. 15–16: Completed coefficient application, with analytic comparison owned elsewhere.

**Acceptance.**

- The export states vanishing locally on the target, before passing to a limit.
- A completed tensor with a non-Noetherian valuation coefficient is not exchanged with cohomology without the adic owner's comparison.

### Compactified Klingen correspondences

**Node:** `ShimuraCompactifications:C3/klingen-correspondence-compactification`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.klingen_correspondence_compactification`. **Kind:** construction.

At the analytic Klingen p^n levels constructed by the integral-boundary/adic owners, choose compatible cone systems and compactify the correspondence of (G,H_n,L) from Pilloni 13.2.1. Here L⊂G[p²] is totally isotropic of etale type (Z/p)² direct-sum Z/p² and disjoint from H_n; t1=(G,H_n) and t2=(G/L,([p]^-1(H_n)+L)/L) at level p^(n+1). Extend both arrows through the actual toroidal chart maps. Its asserted positive-degree acyclicity is a separate target.

**Hypotheses.**

- Use exactly the characteristic-zero analytic models/levels of Pilloni 13.2.1. Their integral Klingen/paramodular models are owned by the Part II supplier and are not generalized good-prime C5 models.

**Construction or proof.**

1. Identify the open correspondence and its boundary lattice maps through the supplied degeneration comparison.
2. Apply the finite-family fan refinement theorem and glue the two toroidal arrows.
3. Transport to the specified analytic spaces through the adic comparison owner. Correct the printed H/C_n and subgroup parentheses as recorded by the reviewed extraction.

**Direct prerequisites.** `ShimuraCompactifications:C3/hecke-span`, `ShimuraCompactifications:C4/boundary-level-comparison`, `AdicSpacesPartII:R3`.

**Source match.**

- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 13.2.1, author-copy p. 85: Two compactified arrows with the corrected subgroup formula.

**Uses.**

- **HigherHidaAndColemanTheory**: Imports the compactified analytic correspondence before its cohomological operator construction.

**API.**

- **`KlingenToroidalCorrespondence.t1_open`** (compatibility): The first arrow sends (G,H_n,L) to (G,H_n).
- **`KlingenToroidalCorrespondence.t2_open`** (compatibility): The second arrow is the quotient and inverse-p-image level subgroup stated above.
- **`KlingenToroidalCorrespondence.fanComparison`** (functoriality): Further compatible cone refinements compare the compactified spans.

**Unit tests.**

- **`KlingenToroidalCorrespondence.t1_test`** (computation): For a triple at level p^n, t1 forgets exactly L and retains H_n.
- **`KlingenToroidalCorrespondence.t2_test`** (compatibility): The new level subgroup is the image of [p]^-1(H_n)+L in G/L.
- **`KlingenToroidalCorrespondence.empty_test`** (degenerate): On a base where no eligible L exists, the correspondence fibre is empty rather than an arbitrary chosen subgroup.

**Acceptance.**

- The target of t2 is level p^(n+1), not p^n.
- The two arrows extend the same ordered open maps.

### Acyclicity of the Klingen first projection

**Node:** `ShimuraCompactifications:C3/klingen-correspondence-acyclicity`. **Declaration:** `TauCeti.ShimuraCompactifications.C3.klingen_correspondence_acyclicity`. **Kind:** theorem.

For the exact compactified analytic correspondence of klingen-correspondence-compactification, prove (t1)_*O_C→R(t1)_*O_C is a quasi-isomorphism, equivalently R^i(t1)_*O_C=0 for i>0. This is not claimed to follow from properness or from the open map being finite; the boundary chart factorization and analytic-coherent comparison must be supplied.

**Hypotheses.**

- Use the exact source, level, coefficient structure sheaf and analytic comparison setting of Pilloni 13.2.1; integral parahoric vanishing is not inferred.

**Construction or proof.**

1. Determine the first projection on every boundary degeneration chart, factoring its finite normalization and toroidal subdivision pieces.
2. Apply the local toric vanishing only after this factorization has been proved, then the proper analytic coherent comparison.
3. Glue the local vanishing. Pilloni recalls this without a reference, and the missing boundary factorization/proof is recorded as a concrete gap rather than a proved consequence.

**Direct prerequisites.** `ShimuraCompactifications:C3/klingen-correspondence-compactification`, `ShimuraCompactifications:C3/toric-structure-sheaf-vanishing`, `AdicSpacesPartII:R3`, `SchemeAndStackFoundations:SF.2`.

**Source match.**

- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 13.2.1, author-copy p. 85: Asserted acyclicity; supporting boundary proof is explicitly open.

**Acceptance.**

- The theorem names the actual first arrow and all positive degrees.
- No vanishing for arbitrary proper Hecke correspondences is asserted.

## C3.general

Descend the compatible refinement, level and Hecke span interfaces through the same general canonical-model boundary supplier. The stated reflex field or compositum and the actual source/target fan compatibility remain part of each contract.

### General-data toroidal maps and correspondences

**Node:** `ShimuraCompactifications:C3.general/general-map-descent`. **Declaration:** `TauCeti.ShimuraCompactifications.C3_general.general_map_descent`. **Kind:** theorem.

Descend the C3 compatible refinement, level, datum and ordered Hecke maps to the C2.general toroidal canonical models, using V8.general functoriality over the prescribed reflex-field composita. Preserve boundary labels and the common-refinement comparisons, and prove identity/composition after descent. The coefficient vanishing theorems retain their own hypotheses and are not strengthened by this general-data instantiation.

**Hypotheses.**

- Fix a pure Shimura datum (G,X), compact open K and its actual arithmetic component quotients from V0. Cones and lattices are the common toric carriers; the fans are compatible arithmetic-admissible systems from C0. No universal abelian scheme is assumed for this datum.
- Use the actual general canonical models and the special mixed-boundary descent input, with compatible source/target cone systems for each specified map.

**Construction or proof.**

1. Apply the unchanged C3 chart maps to the C2.general models and identify their open restrictions with the V8.general maps.
2. Use canonical descent of the boundary torsors and dense-interior uniqueness to descend the maps.
3. Check identity/composition and common-refinement diagrams after complex base change, then reflect equality over the reflex field.

**Direct prerequisites.** `ShimuraCompactifications:C2.general/general-toroidal-descent`, `ShimuraCompactifications:C3/level-datum-functoriality`, `ShimuraCompactifications:C3/hecke-span`, `ShimuraCompactifications:C3/choice-comparison`, `ShimuraVarieties:V8.general/general-tower`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-2-affine-analytic-charts-of-regular-cones`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-3-finite-fan-analytic-gluing`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-4-torus-actions-strata-and-the-boundary`, `tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-5-toric-maps-and-properness`.

**Source match.**

- [PINK-1990](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 6.25; 12.4–12.8: Functorial fan maps and toroidal canonical-model descent.

**Acceptance.**

- A general datum map uses the specified field compositum.
- No all-prime integral extension is added.

**Planet:** General toroidal functoriality.

## C4

Use Lan’s smooth separated fibrewise semi-abelian notion without adding global finite presentation. The extension classification is the negative-character Poincare anti-equivalence. Polarized degeneration data are DD_pol, not DD_ample; the auxiliary construction doubles the displayed polarization. Effectivity compares isomorphism groupoids. The local Raynaud construction is imported from R11.3, with its ownership cycle recorded. Faltings–Chai I.2.7 and I.2.10 were directly read for this revision; their native Neron, torsion, constructible-sheaf and descent interfaces remain requested.

### Semi-abelian schemes

**Node:** `ShimuraCompactifications:C4/semi-abelian-scheme`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.semi_abelian_scheme`. **Kind:** definition.

A semi-abelian scheme G over S is a separated smooth commutative group scheme whose geometric fibres are extensions of abelian varieties by tori. Keep the relative dimension and constructible character sheaf of the maximal fibrewise torus. A single global exact sequence by a torus exists under the additional locally constant toric-rank hypothesis; it is not part of the definition for a degenerating family. Smoothness supplies local finite presentation. When an application needs global finite presentation or finite type, retain that additional hypothesis in the application rather than inserting it into Lan's fibrewise definition.

**Hypotheses.**

- Work over the scheme or algebraic-space bases supplied by SF.1, using the existing group-scheme and abelian-scheme carriers. For Lan character/extension theorems retain his locally Noetherian base hypotheses.

**Construction or proof.**

1. Use the existing smooth separated commutative group-scheme structure and impose the stated geometric-fibre condition.
2. The maximal tori and their characters are identified fibrewise; descent supplies the constructible character sheaf.
3. Relate the constant-rank case to an extension by a relative torus and abelian scheme.

**Direct prerequisites.** `AbelianSchemesAndArithmeticModuli:A2`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `tauceti:TauCeti.SplitTorus.groupScheme`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 3.3.1.1–3.3.1.4, printed pp. 191–192: Definition and constructible character data.

**Uses.**

- **ShimuraCompactifications:C4/polarized-degeneration-data**: Supplies the genuine group family reconstructed by degeneration data.
- **ShimuraCompactifications:C5/integral-toroidal-space**: Supplies the universal boundary extension.

**API.**

- **`SemiAbelianScheme.baseChange`** (functoriality): Every base change preserves the geometric-fibre condition and its smooth group structure, with identity/composition comparisons.
- **`SemiAbelianScheme.characterSheaf`** (projection): Returns the constructible character sheaf with its restriction to each geometric fibre.
- **`SemiAbelianScheme.abelianEmbedding`** (compatibility): An existing abelian scheme gives a semi-abelian scheme with zero character sheaf.
- **`SemiAbelianScheme.constantRankExtension`** (characterisation): Under the locally constant character-rank hypothesis the family is an extension of an abelian scheme by a torus.
- **`SemiAbelianScheme.ofGroup`** (constructor): A genuine separated smooth commutative group scheme with the stated geometric-fibre torus-extension property gives a semi-abelian scheme, without choosing a global torus extension for a rank-jumping family.
- **`SemiAbelianScheme.ext`** (extensionality): On a fixed group-scheme carrier and structure maps, two semi-abelian structures agree because the smooth/separated and geometric-fibre requirements are properties; equality does not require equality of chosen local torus splittings.

**Unit tests.**

- **`SemiAbelianScheme.abelian_test`** (degenerate): An abelian scheme has toric rank zero.
- **`SemiAbelianScheme.splitTorus_test`** (compatibility): The pinned rank-r SplitTorus is semi-abelian with character sheaf Z^r and zero abelian quotient.
- **`SemiAbelianScheme.tate_rank_test`** (computation): The Tate family has generic toric rank zero and boundary toric rank one.
- **`SemiAbelianScheme.additive_test`** (non-example): G_a is excluded: its geometric fibre is not an extension of an abelian variety by a torus.

**Acceptance.**

- A Tate degeneration can have toric rank zero generically and one at the boundary.
- A constant-rank extension has the expected relative torus but a rank-jumping family need not.

**Planet:** Semi-abelian scheme.

### Character sheaves and homomorphisms from tori

**Node:** `ShimuraCompactifications:C4/constructible-character-sheaf`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.constructible_character_sheaf`. **Kind:** theorem.

For a semi-abelian scheme G over a locally Noetherian base, construct its etale constructible character sheaf X(G), restricting to the free character lattice of the maximal torus in every geometric fibre. Identify morphisms from a torus T to G with the dual character-sheaf maps in Lan 3.3.1.9, with the exact sheaf direction and specializations retained. On the constant-rank locus this recovers the usual anti-equivalence for tori.

**Hypotheses.**

- Use Lan's constructible etale sheaf setting; no locally constant character lattice is assumed across a rank jump.

**Construction or proof.**

1. Faltings–Chai I.2.9 extends a generic subtorus over a normal base. On the DVR test bases its characters specialize by the quotient map from special to generic characters.
2. Use the sheaf construction of I.2.10: sections are fibrewise Galois-invariant characters satisfying the DVR specialization condition. The proof uses reduction to a reduced finite-type base, conductor gluing and Noetherian induction; its auxiliary descent and torus-rigidity inputs must be supplied by the owners.
3. Compare this sheaf with Lan 3.3.1.9 and check the contravariant torus-to-semi-abelian Hom identification and arbitrary base change. A constructible sheaf may have jumping rank; it is not silently replaced by a local system.

**Direct prerequisites.** `ShimuraCompactifications:C4/semi-abelian-scheme`, `SchemeAndStackFoundations:SF.1`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 3.3.1.8–3.3.1.10, printed pp. 192–193: Character sheaf and torus-to-semi-abelian Hom comparison.
- FALTINGS-CHAI-1990 (cleared restricted reference), Chapter I, Proposition 2.9, Theorem 2.10 and Corollary 2.11, printed pp. 11–13 / PDF pp. 23–25: Directly inspected character-sheaf construction, specialization and constant-rank global-extension consequence.

**Acceptance.**

- For G=T, the comparison is the native contravariant character-lattice Hom.
- For an abelian scheme G, every torus-to-G group homomorphism is zero.

### Relative torus extensions and Poincare classes

**Node:** `ShimuraCompactifications:C4/poincare-extension-classification`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.poincare_extension_classification`. **Kind:** theorem.

For an abelian scheme A and an isotrivial torus H with finite-free character sheaf X(H), classify commutative group scheme extensions 0→H→G→A→0 by homomorphisms c:X(H)→A^dual. Lan 3.1.5.1 gives an anti-equivalence of the source categories (and, for fixed A,H, the corresponding classification of extension classes). In Lan's convention the rigidified invertible sheaf for chi corresponds to pushout of the torsor by -chi. Retain this negative-character/inverse-Poincare sign in reconstruction, multiplication, base change and duality; dual abelian schemes and biextensions remain A3/A5 inputs.

**Hypotheses.**

- Use the locally Noetherian base and isotrivial finite-free character data of Lan 4.2.1; do not assert a globally split torus without an etale trivialization.

**Construction or proof.**

1. For each character chi, take the rigidified invertible sheaf associated to the G_m-torsor obtained by pushout by -chi, as in Lan 3.1.5.1; the group-extension law puts its class in Pic^0=A^dual.
2. Reconstruct the graded character-line algebra using the Poincare biextension and its coherent multiplication.
3. Use the rigidifications to check the inverse constructions and contravariance of the character-sheaf description; retain the negative-character sign before defining degeneration trivializations.

**Direct prerequisites.** `ShimuraCompactifications:C4/semi-abelian-scheme`, `ShimuraCompactifications:C4/constructible-character-sheaf`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A5`, `SchemeAndStackFoundations:SF.1`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Proposition 3.1.5.1, printed p. 183; 4.2.1.7 and 4.2.1.13, printed pp. 210 and 213: Anti-equivalence and negative-character pushout; inverse-biextension convention for degeneration data.

**Acceptance.**

- A trivial c gives the split extension A×T.
- A nonzero c gives a genuinely nontrivial character line, retained by C0 torsor charts.

### Polarized relative degeneration data

**Node:** `ShimuraCompactifications:C4/polarized-degeneration-data`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.polarized_degeneration_data`. **Kind:** definition.

In the relative setting R,I,S,eta, define the polarized degeneration datum DD_pol of Lan Definition 4.4.6 (using the entries and positivity from 4.2.1.13): an abelian scheme A with polarization lambda_A, isotrivial finite-free sheaves X,Y, an injective phi:Y→X with finite cokernel, maps c:X→A^dual and c^dual:Y→A satisfying lambda_A c^dual=c phi, and a bilinear rigidified trivialization tau of the pullback of the INVERSE Poincare biextension on the generic fibre. Require its cubical/symmetry relations and the I-adic positivity condition: diagonal trivializations yield sections vanishing along I for nonzero y. The period lattice lives on the generic fibre; it is not silently an everywhere-defined map Y→G over S. Its associated generic polarized 1-motive is the complex [Y to G_eta], where G is the torus extension determined by c and the lift of c^dual is the period map determined by tau. This names the degeneration datum already being constructed, not a second generic motivic theory. This polarized tuple omits the additional ample-line and Y-action fields L^sharp and psi of DD_ample; when Mumford reconstruction uses them, derive the auxiliary data as in Remark 4.4.7, keeping track that its displayed choice induces 2 lambda_A.

**Hypotheses.**

- Let R be a Noetherian normal domain, complete for a radical ideal I, S=Spec R and eta=Spec Frac R. Use the isotrivial torus hypothesis and the cubical rigidifications of Lan 4.1 and 4.2.1.1; this relative setting is stronger and more general in its base than the complete-DVR local R11.3 specialization.
- Retain Lan's ampleness/polarization, positivity and base-change conditions. Use the same local lattice and Raynaud carriers as R11.3 when R is a complete DVR.

**Construction or proof.**

1. Assemble the extension of A by T through c and the supplied Poincare biextension.
2. Express the period map through tau, fixing the inverse-biextension and phi compatibility convention.
3. State positivity on the ideal of degeneration and compare the complete-DVR restriction to the imported polarized Raynaud datum.

**Direct prerequisites.** `ShimuraCompactifications:C4/poincare-extension-classification`, `NeronModelsAndSemistableAbelianVarieties:R11.3`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A5`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Definition 4.4.6 and Remark 4.4.7, printed p. 251; 4.2.1.7 and 4.2.1.13–4.2.1.14, printed pp. 210 and 213–214: The DD_pol tuple, its positivity, and its relation to the larger DD_ample tuple.

**Uses.**

- **ShimuraCompactifications:C4/mumford-quotient**: Supplies periods and ample gluing data.
- **ShimuraCompactifications:C4/formal-universal-degeneration**: Instantiates the universal cusp family.

**API.**

- **`PolarizedDegenerationData.extension`** (projection): Returns the actual torus extension of A determined by c.
- **`PolarizedDegenerationData.baseChange`** (functoriality): Admissible complete base changes preserving the ideal and positivity transport all data and rigidifications.
- **`PolarizedDegenerationData.localRaynaud`** (compatibility): For a complete DVR, identifies the datum with the R11.3 polarized Raynaud/lattice input.
- **`PolarizedDegenerationData.period_pairing`** (relation): The period trivialization is bilinear and symmetric with the prescribed phi and inverse-Poincare convention.
- **`PolarizedDegenerationData.genericOneMotive`** (projection): Returns [Y to G_eta] with the actual tau-defined period map and polarization comparison lambda_A c^dual=c phi; it is compatible with admissible base change.
- **`PolarizedDegenerationData.iso_iff`** (extensionality): Structure-preserving isomorphisms of the abelian scheme and the character/period sheaves identify two DD_pol objects precisely when lambda_A,phi,c,c^dual and the rigidified tau commute with those isomorphisms and retain the same positivity data.
- **`PolarizedDegenerationData.toAmple`** (constructor): Remark 4.4.7 derives auxiliary DD_ample data from DD_pol: M=(Id,lambda_A)^*P_A, L^sharp=pi^*M and psi=(Id_Y,phi)^*tau, with the displayed 2phi and induced 2lambda_A retained. This auxiliary construction is not an equality of the two categories.

**Unit tests.**

- **`PolarizedDegenerationData.rankZero_test`** (degenerate): X=Y=0 gives A with its existing polarization.
- **`PolarizedDegenerationData.tate_test`** (computation): For X=Y=Z and period q, positivity is v(q)>0 and reconstruction gives the Tate degeneration.
- **`PolarizedDegenerationData.local_test`** (compatibility): The complete-DVR specialization retains the same character and period lattices as R11.3.
- **`PolarizedDegenerationData.negative_test`** (non-example): Period q^-1 for v(q)>0 fails the diagonal positivity condition.

**Acceptance.**

- The no-torus case X=Y=0 recovers the polarized abelian scheme A.
- A negative Tate parameter valuation violates positivity and cannot define the stated proper degeneration.

**Planet:** Polarized degeneration datum.

### Relative Mumford quotient and algebraization

**Node:** `ShimuraCompactifications:C4/mumford-quotient`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.mumford_quotient`. **Kind:** construction.

From positive polarized degeneration data and a compatible rational polyhedral decomposition, construct the relatively complete torus model, its formal period-lattice quotient and ample descent line. Algebraize the projective formal quotient over the complete base to obtain the semi-abelian degeneration and its generic polarized abelian scheme. The finite-index subgroup Y0 used to make an intermediate ample quotient is comparison data; the final construction descends the full lattice action.

**Hypotheses.**

- Let R be a Noetherian normal domain, complete for a radical ideal I, S=Spec R and eta=Spec Frac R. Use the isotrivial torus hypothesis and the cubical rigidifications of Lan 4.1 and 4.2.1.1; this relative setting is stronger and more general in its base than the complete-DVR local R11.3 specialization.
- Choose the compatible polarization and fan, preserving the cubical identities and I-adic positivity. Formal schemes and effectivity are imported from their owners, not reconstructed by ad hoc inverse limits.

**Construction or proof.**

1. Build the relatively complete torus model from C0 relative torsor charts, with line-bundle multiplication induced by tau.
2. Use positivity to prove period translations are locally discrete on the formal model, and descend the ample line after a finite-index lattice restriction.
3. Apply Lan 4.5.2.15–4.5.2.18 to the projective formal quotient and algebraize; compare the intermediate quotient with the full-lattice output. Relatively complete model/theta lemmas not read in full are explicit gaps.

**Direct prerequisites.** `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C0/relative-torus-embedding`, `ShimuraCompactifications:C0/smooth-projective-refinement`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`, `NeronModelsAndSemistableAbelianVarieties:R11.3`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 4.5.2.15–4.5.2.18, especially Corollary 4.5.2.16, printed pp. 273–275: Projective formal quotient and ample effectivity.

**Uses.**

- **ShimuraCompactifications:C4/degeneration-effectivity**: Constructs the quasi-inverse to extracting degeneration data.
- **ShimuraCompactifications:C5/good-algebraic-model**: Supplies the universal formal degeneration charts.

**API.**

- **`MumfordDegeneration.genericFibre`** (compatibility): The generic fibre is the polarized abelian scheme uniformized by the specified Raynaud extension and period lattice.
- **`MumfordDegeneration.formalCompletion`** (characterisation): The completion is the constructed formal period quotient with its descended ample line.
- **`MumfordDegeneration.fanComparison`** (functoriality): Compatible subdivisions induce the canonical comparison maps, agreeing on the generic fibre.

**Unit tests.**

- **`MumfordDegeneration.rankZero_test`** (degenerate): The zero-period-lattice datum returns the original abelian scheme.
- **`MumfordDegeneration.tate_test`** (computation): The rank-one period q gives G_m/q^Z on the generic analytic fibre.
- **`MumfordDegeneration.refinement_test`** (compatibility): Changing to a compatible subdivision changes the model by its toroidal comparison, preserving the generic uniformization.

**Acceptance.**

- Torus rank zero returns A.
- A positive rank-one datum gives the Tate family and its proper formal quotient.

**Planet:** Mumford degeneration construction.

### Polarized degeneration equivalence

**Node:** `ShimuraCompactifications:C4/degeneration-effectivity`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.degeneration_effectivity`. **Kind:** theorem.

Under Lan's complete normal-base and positivity hypotheses, the functor extracting polarized degeneration data from semi-abelian degenerations with polarized abelian generic fibre is an equivalence with the groupoid DD_pol(R,I) of Definition 4.4.6. Prove full faithfulness and essential surjectivity separately, retaining the auxiliary cubical line construction and the structure-preserving isomorphisms used as morphisms in the polarized categories. The complete-DVR local specialization is imported from R11.3; this target is its relative effectivity extension.

**Hypotheses.**

- Let R be a Noetherian normal domain, complete for a radical ideal I, S=Spec R and eta=Spec Frac R. Use the isotrivial torus hypothesis and the cubical rigidifications of Lan 4.1 and 4.2.1.1; this relative setting is stronger and more general in its base than the complete-DVR local R11.3 specialization.
- Use exactly the degeneration categories and polarization requirements of Lan 4.4.1–4.4.16. An arbitrary singular complete ring outside this normal-domain setting is not covered.
- For the polarized equivalence the morphisms are structure-preserving isomorphisms in DEG_pol and DD_pol. This is not an equivalence of categories with all generic homomorphisms as arrows.

**Construction or proof.**

1. Extend a structure-preserving generic isomorphism and its inverse by homomorphism-extension; uniqueness makes their composites identities. Identify the compatible polarization, character, period and biextension maps. Full faithfulness concerns precisely the source's polarized isomorphism groupoids.
2. Essential surjectivity uses mumford-quotient and the relatively complete model/theta inputs in Lan 4.5.
3. Compare extraction and reconstruction on the actual objects and morphisms, including polarizations. The chapter's uninspected construction lemmas are named proof gaps, not an inferred equivalence from the statement alone.

**Direct prerequisites.** `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/mumford-quotient`, `ShimuraCompactifications:C4/homomorphism-extension`, `NeronModelsAndSemistableAbelianVarieties:R11.3`, `SchemeAndStackFoundations:SF.3`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 4.4.1–4.4.16, printed pp. 250–255: Categories and equivalence theorem, with relative construction proof obligations.

**Acceptance.**

- The functor is fully faithful on morphisms, not just a bijection of isomorphism classes.
- The complete-DVR comparison uses the imported local theory.

**Planet:** Polarized degeneration equivalence.

### Universal degeneration on a cusp chart

**Node:** `ShimuraCompactifications:C4/formal-universal-degeneration`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.formal_universal_degeneration`. **Kind:** construction.

For the PEL cusp label, construct the universal positive degeneration datum over the formal completion of its relative torus embedding and apply the relative effectivity equivalence. Obtain the formal semi-abelian family with its polarization, torus characters, abelian quotient and generic PEL family, compatible with admissible faces and changes of cusp representative.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Complete along the specified positive monomial degeneration ideal; use the exact cusp base and formal chart rather than the completion of the entire boundary without isolating its stratum.

**Construction or proof.**

1. Take the universal c,c^dual,phi,tau from the cusp torsor and its graded monomials.
2. Verify positivity using the interior cone and apply degeneration-effectivity on the normal complete chart.
3. Identify face restrictions and representative changes by full faithfulness, preserving all rigidifications.

**Direct prerequisites.** `ShimuraCompactifications:C1/boundary-torsor-tower`, `ShimuraCompactifications:C0/relative-torus-embedding`, `ShimuraCompactifications:C4/degeneration-effectivity`, `PELModuli:M1`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.2.5.25–6.2.5.28; 6.3.2.5: Universal formal degeneration and its good algebraic-model comparison.

**Uses.**

- **ShimuraCompactifications:C5/good-algebraic-model**: Supplies the formal object to algebraize.
- **ShimuraCompactifications:C5/log-kodaira-spencer**: Supplies the boundary Hodge and logarithmic differential comparison.

**API.**

- **`UniversalDegeneration.character`** (projection): The toric character sheaf is the cusp label's specified X.
- **`UniversalDegeneration.genericPEL`** (compatibility): Its generic restriction identifies with the given PEL family and polarization.
- **`UniversalDegeneration.faceRestriction`** (functoriality): Allowed face and representative maps preserve the universal degeneration datum and its reconstruction.

**Unit tests.**

- **`UniversalDegeneration.rankZero_test`** (degenerate): At zero toric rank the family is the lower-dimensional universal abelian family.
- **`UniversalDegeneration.tate_test`** (computation): For a modular cusp the universal period is q and the invariant fibre differential is du/u.
- **`UniversalDegeneration.representative_test`** (compatibility): Equivalent cusp representatives induce isomorphic families through the prescribed descent map.

**Acceptance.**

- The generic fibre has the prescribed PEL moduli meaning.
- Face comparison preserves the actual character and period lattices.

**Planet:** Universal boundary degeneration.

### Extension of semi-abelian homomorphisms

**Node:** `ShimuraCompactifications:C4/homomorphism-extension`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.homomorphism_extension`. **Kind:** theorem.

Let S be a locally Noetherian normal scheme, U a dense open and G,H semi-abelian schemes over S. Restriction Hom_S(G,H)→Hom_U(G_U,H_U) is bijective: every generic-open homomorphism extends uniquely. State the same result over the algebraic-space bases by effective etale descent. Smoothness of an unrelated open moduli space does not supply this extension theorem.

**Hypotheses.**

- Retain normality of S, dense U and the semi-abelian family hypotheses of Lan 3.3.1.5 / Faltings–Chai I.2.7.

**Construction or proof.**

1. Faltings–Chai I.2.7 reduces the Noetherian normal scheme case to DVRs by the closure of the generic graph, the valuative criterion and Stein factorization. The geometric-fibre graph is determined by torsion, not by properness of the semi-abelian scheme.
2. Over a DVR, extend maps to the abelian part using the connected Neron model. For a split torus target the divisor of the multiplicative function is vertical; compatibility with the group law forces its multiplicity to vanish. The general case uses the torus extension and semistable base change.
3. Use dense-open uniqueness for identities, composition and the etale descent cocycle. The locally Noetherian version is obtained on Noetherian opens; the algebraic-space version still needs the actual descent supplier. The source proof was read, but its Neron, torsion and graph/Stein formal interfaces are still requested.

**Direct prerequisites.** `ShimuraCompactifications:C4/semi-abelian-scheme`, `SchemeAndStackFoundations:SF.1`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 3.3.1.5, printed p. 192: Quoted Faltings–Chai I.2.7 extension theorem.
- [BP-2026](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Lemma 4.2.2, printed p. 43: Routed use of the extension theorem.
- FALTINGS-CHAI-1990 (cleared restricted reference), Chapter I, Proposition 2.7 and proof, printed pp. 9–11 / PDF pp. 21–23: Normal Noetherian dense-open Hom extension; the proof separates graph reduction, abelian target, torus target and general extension cases.

**Acceptance.**

- The restriction is a bijection on actual homomorphisms.
- No finite-flat kernel follows just from existence of the extension.

### PEL endomorphisms and Rosati compatibility

**Node:** `ShimuraCompactifications:C4/endomorphism-extension`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.endomorphism_extension`. **Kind:** theorem.

Extend the generic O-action on the universal semi-abelian family uniquely across the normal boundary base. The extension remains a ring action and preserves the specified polarization/Rosati relations because these identities hold densely. Keep polarization morphisms and their duality in the actual degeneration category; no nonexistent dual semi-abelian scheme is presumed.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use the family from formal-universal-degeneration and its admissible algebraizations; its endomorphism identities are checked on the common dense generic restriction.

**Construction or proof.**

1. Extend each endomorphism by homomorphism-extension.
2. Reflect sums, products, identity and involution/polarization relations by uniqueness.
3. Verify compatibility with character and period maps in the degeneration datum and with chart descent.

**Direct prerequisites.** `ShimuraCompactifications:C4/homomorphism-extension`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `PELModuli:M1`, `AbelianSchemesAndArithmeticModuli:A3`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.3.2.5–6.3.2.6, printed pp. 503–504: PEL algebraizations carry the extended structures.

**Acceptance.**

- The O-action is a ring homomorphism after extension.
- The Rosati identity is transported with the given polarization datum.

### Boundary comparison of level structures

**Node:** `ShimuraCompactifications:C4/boundary-level-comparison`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.boundary_level_comparison`. **Kind:** theorem.

Compare the prescribed prime-to-S level data on the generic PEL family with the degeneration lattice/torus data on a cusp chart and extend the allowed finite-etale tame part. At p-power level retain the actual higher-level normalization and its ramified monomial map. An etale level torsor on the open locus need not extend etale over the boundary; do not replace a q↦q^p cusp map by an etale cover.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- For p-level comparison use a fixed normalization model with its actual generic level map; the formal degeneration statement alone does not identify that model with a parahoric moduli problem.

**Construction or proof.**

1. Identify tame torsion through the polarized degeneration datum and the character/period lattices.
2. For p-level maps compare the normalized monomial charts and their ramification, using the imported interior normalization construction.
3. Check the open level maps and representative descent. Record the remaining explicit boundary-normalization comparison as a proof gap.

**Direct prerequisites.** `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/homomorphism-extension`, `PELModuli:M4/higher-level-normalization`, `ModularCurvesPartII:R13.1`, `ModularCurvesPartII:R13.2`, `ModularCurvesPartII:R13.3`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.2.5; 6.4.1.1(5): Degeneration level and formal boundary descriptions.
- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 13.2.1, author-copy p. 85: Routed correspondence uses the precise level subgroup formula.

**Acceptance.**

- The Tate p-isogeny has ramified base map q↦q^p.
- The comparison preserves tame level data and does not assert p-level etaleness.

### Quasi-finite flat boundary isogenies

**Node:** `ShimuraCompactifications:C4/extended-isogeny-kernel`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.extended_isogeny_kernel`. **Kind:** theorem.

For the semi-abelian boundary families and the isogenies in Boxer–Pilloni Lemma 4.2.2, extend the isogeny and a chosen inverse up to multiplication. Prove the asserted quasi-finite flat morphism and kernel properties under those exact degeneration hypotheses. The kernel can fail to be finite and its order can jump at the boundary; it is not a finite locally free group of constant rank over the whole base.

**Hypotheses.**

- Use the source's normal boundary base, compatible family and generic p-power isogeny. Extension is supplied by homomorphism-extension; quasi-finiteness/flatness require the further semi-abelian degeneration argument.

**Construction or proof.**

1. Extend the isogeny and its inverse up to [m] by uniqueness.
2. Use the induced toric/abelian/lattice maps to show zero-dimensional fibres and flatness in the stated family; isolate the group-flatness argument as a supplier proof obligation.
3. Compute the Tate example: G_q^p→G_q induced by identity on the multiplicative coordinate has generic kernel of order p and trivial special kernel. This disproves a global finite-flat strengthening.

**Direct prerequisites.** `ShimuraCompactifications:C4/homomorphism-extension`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.

**Source match.**

- [BP-2026](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), 4.1.1 and Lemma 4.2.2, printed pp. 41 and 43: Semi-abelian isogeny chain and unique extension; the further quasi-finite/flat boundary argument is a recorded proof obligation, not an assertion proved by Lemma 4.2.2 alone.

**Acceptance.**

- The asserted kernel is quasi-finite flat in the source setting.
- The rank-jumping Tate specialization rules out a blanket finite-flat kernel claim.

### Comparison with Tate curves and n-gons

**Node:** `ShimuraCompactifications:C4/tate-degeneration-comparison`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.tate_degeneration_comparison`. **Kind:** theorem.

Restrict the relative polarized construction to toric rank one and identify it with the Tate curve/generalized elliptic degeneration and n-gon objects imported from R13.1–R13.3. Compare periods, polarization, invariant relative differential du/u, torsion and the actual base-parameter maps under the two standard p-isogenies. Keep the generic torsion exact sequence and special-fibre rank loss visible.

**Hypotheses.**

- Use the dimension-one generalized elliptic curve and Tate n-gon suppliers; those objects are not constructed again here.
- For a Tate parameter q with positive valuation, distinguish u↦u^p and identity-on-u quotient maps and their corresponding period/base changes.

**Construction or proof.**

1. Identify the rank-one period datum with the imported q-uniformization.
2. Compare invariant differentials by the homomorphism on u and compute the lattice/torus contributions to torsion.
3. Compare the compactified fibre to the prescribed n-gon after its level/base change, retaining ramification in q.

**Direct prerequisites.** `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ModularCurvesPartII:R13.1`, `ModularCurvesPartII:R13.2`, `ModularCurvesPartII:R13.3`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 4.4 and 4.5, rank-one specialization: Relative degeneration construction; exact dimension-one model is imported.

**Acceptance.**

- For u↦u^p, pullback of du/u is p du/u.
- Identity on u from period q^p to period q has generic kernel of order p and trivial special kernel.

### Tate logarithmic Kodaira–Spencer comparison

**Node:** `ShimuraCompactifications:C4/tate-log-kodaira-spencer`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.tate_log_kodaira_spencer`. **Kind:** theorem.

For the imported Tate family, its polarization and invariant Hodge line E, compute the Kodaira–Spencer comparison E^tensor2→Omega^1_base(log boundary) with the source's normalization: (du/u)^tensor2 maps to dq/q up to the explicitly fixed sign/unit convention. Under q↦q^p the base logarithmic differential pulls back to p dq/q. This is a Kodaira–Spencer isomorphism between the stated bundles, not an equality between the relative fibre differential sheaf and the base differential sheaf.

**Hypotheses.**

- Use the normalized polarization and Tate parameter of R13.1–R13.3 and the logarithmic Kodaira–Spencer supplier; retain characteristic and level conditions where p is not invertible.

**Construction or proof.**

1. Import the dimension-one logarithmic Kodaira–Spencer construction and fix its sign using the chosen polarization and period.
2. Compute the period derivative and the two isogeny pullbacks separately on the fibre and base coordinates.
3. Compare the higher-dimensional log-Kodaira–Spencer chart formula with this rank-one restriction.

**Direct prerequisites.** `ShimuraCompactifications:C4/tate-degeneration-comparison`, `AutomorphicBundles:B4`, `SchemeAndStackFoundations:SF.0`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.4.1.1(4), printed pp. 519–520: Logarithmic Kodaira–Spencer supplies the higher-dimensional comparison.

**Acceptance.**

- du/u belongs to invariant relative differentials; dq/q belongs to base logarithmic differentials.
- The ramification factor p appears in pullback of dq/q.

### Tate modules of semi-abelian extensions

**Node:** `ShimuraCompactifications:C4/semiabelian-tate-module`. **Declaration:** `TauCeti.ShimuraCompactifications.C4.semiabelian_tate_module`. **Kind:** construction.

For a semi-abelian variety J over a characteristic-zero field k in an exact sequence 0→T→J→A→0, form the full profinite Tate module TJ=inverse-limit_n J[n](kbar), indexed by positive integers under divisibility with transition [n/m] from n-torsion to m-torsion. Import the general compact coefficient carrier and prove the continuous G_k-equivariant exact sequence 0→TT→TJ→TA→0. Primewise restriction gives the same exact sequence of Z_l-modules; for split T=G_m^r, TT=Zhat(1)^r. The generalized Jacobian and its anabelian application remain consumer constructions.

**Hypotheses.**

- Characteristic zero, a chosen algebraic closure and the actual torus extension J. Each torsion group is taken on geometric points with its finite discrete topology; compact inverse-limit exactness is imported from R02.1.
- The transition maps are multiplication n/m, not inclusions of torsion sets. No extension of this all-prime characteristic-zero statement to a rank-jumping family is asserted.

**Construction or proof.**

1. Use surjectivity/divisibility of T(kbar) and the finite torsion sequence for the torus extension to obtain 0→T[n]→J[n]→A[n]→0.
2. Apply the supplied compact inverse-limit exactness theorem to the finite surjective torsion systems, retaining Galois action and topology.
3. Use the Chinese-remainder decomposition of n-torsion to identify the full inverse limit with the product of its prime-power factors. Prime powers are not cofinal in the full divisibility index. Identify split-torus torsion with roots of unity; the generalized Jacobian imports this sequence.

**Direct prerequisites.** `ShimuraCompactifications:C4/semi-abelian-scheme`, `ShimuraCompactifications:C4/poincare-extension-classification`, `AbelianSchemesAndArithmeticModuli:A3`, `AbelianSchemesAndArithmeticModuli:A4`, `ArithmeticGaloisDuality:R02.1`.

**Source match.**

- [BRESCIANI-2024](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf), Lemma 8 proof, published p. 138: Full Tate extension used by the generalized Jacobian consumer.

**Uses.**

- **JacobianChallengePartIIGeneralizedAlbanese, PAPER-BRESCIANI-24/57**: Imports the general Tate extension for its curve-specific semi-abelian Jacobian.
- **ArithmeticGaloisDuality:R02.1**: Uses the continuous extension in the subsequent compact-coefficient cohomology sequence.

**API.**

- **`SemiAbelianTateModule.exact`** (structure): The maps induced by T→J→A give the continuous exact full Tate sequence.
- **`SemiAbelianTateModule.primewise`** (compatibility): The l-primary factor is the usual inverse limit of J[l^n], compatible with the exact sequence.
- **`SemiAbelianTateModule.map`** (functoriality): Homomorphisms of torus extensions induce continuous equivariant maps, preserving identity and composition.
- **`SemiAbelianTateModule.splitTorus`** (characterisation): For G_m^r the module is Zhat(1)^r with the cyclotomic Galois action.
- **`SemiAbelianTateModule.torsionProjection`** (projection): The full module maps continuously to each J[n] in the divisibility-indexed system; for n|m the transition is multiplication by m/n, and these maps agree with the imported primewise comparison.

**Unit tests.**

- **`SemiAbelianTateModule.Gm_test`** (computation): For J=G_m, the full Tate module is Zhat(1), not the trivial-action Zhat.
- **`SemiAbelianTateModule.abelian_test`** (degenerate): For T=0 the construction is the supplied abelian full Tate module TA.
- **`SemiAbelianTateModule.product_test`** (compatibility): For J=T×A the exact sequence splits as TT×TA with the supplied actions.
- **`SemiAbelianTateModule.transitions_test`** (non-example): An inclusion J[m]→J[n] when m divides n has the wrong direction and does not define this inverse system.

**Acceptance.**

- The full sequence is continuous, exact and Galois-equivariant.
- The transition direction and split-torus Tate twist are explicit.

## C5

Keep the two good-model maps from the algebraic chart ring to the completed strict local ring distinct. Glue the normalization of the interior fibre-product relation, using smooth compatible fans and the standing PEL conditions. Neat output is a space; non-neat output is initially a stack. Same-fan finite normalization and normalization of a blow-up of the minimal model are distinct constructions. Formal Koecher uses the actual minimal Stein equality and proper formal functions, together with the special-fibre comparison. Hodge generation still needs the direct theta proof, beyond the inspected Faltings–Chai V.2.1 reduction.

### Good algebraic models of formal cusp charts

**Node:** `ShimuraCompactifications:C5/good-algebraic-model`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.good_algebraic_model`. **Kind:** construction.

For each chosen complete cone/cusp degeneration chart, construct Lan's ordinary good algebraic model with its extended PEL semi-abelian family and the prescribed formal identification. Retain both ring embeddings i_nat,i_alg:R_alg→R^hat, where R^hat is the completion of the strict local toric-chart ring at the selected geometric point along its stratum ideal; they need not agree. The model must be a strata-preserving etale finite-type neighbourhood of the toric chart with the specified dense interior, rather than a formal model declared to be algebraic.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use Lan 6.3.2.5 including its normal base, comparison of natural and algebraic embeddings, and the approximation hypotheses corrected by the author's errata.
- The cone is nondegenerate and smooth, as in Definition 6.3.2.5. Retain conditions (3a),(3b) for the PEL/degeneration comparisons under the two R_alg embeddings and (3c) for the logarithmic Kodaira–Spencer isomorphism; these embeddings are not merely maps of a common fraction field.

**Construction or proof.**

1. Apply the relative effectivity/approximation construction to the universal formal family and all its PEL structures.
2. Apply Lan 6.3.2.6–6.3.2.9 to the selected good model, retaining i_nat and i_alg as distinct ring maps R_alg→R^hat and the comparisons of families/degeneration data and logarithmic differentials required in 6.3.2.5.
3. Take the permitted finite collection of good algebraic models covering the formal boundary labels. The approximation lemmas 6.3.1–6.3.2.4 not read in full remain a named gap.

**Direct prerequisites.** `ShimuraCompactifications:C4/formal-universal-degeneration`, `ShimuraCompactifications:C4/endomorphism-extension`, `ShimuraCompactifications:C4/boundary-level-comparison`, `PELModuli:M2/representability`, `PELModuli:M2/universal-family`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.3.2.5–6.3.2.9, printed pp. 503–505: Good algebraic-model definition and existence with two embeddings.
- [LAN-ERRATA](https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf), Items 60–77, especially approximation and etaleness corrections: Retain the corrected approximation and descent hypotheses.

**Uses.**

- **ShimuraCompactifications:C5/etale-chart-relation**: Supplies ordinary charts with universal families.
- **ShimuraCompactifications:C5/integral-toroidal-space**: Supplies the finite-type atlas.

**API.**

- **`GoodCuspModel.formalComparison`** (equivalence): Completion at the specified boundary ideal identifies with the given universal formal chart, preserving PEL data.
- **`GoodCuspModel.openPEL`** (compatibility): The dense open maps etale to the M2 PEL space with its actual universal family.
- **`GoodCuspModel.embeddings`** (projection): Returns the two actual maps R_alg→R^hat separately, together with conditions (3a),(3b) for the PEL/degeneration structures and (3c) for logarithmic Kodaira–Spencer.

**Unit tests.**

- **`GoodCuspModel.rankZero_test`** (degenerate): A zero-rank chart recovers an etale chart of the open M2 space.
- **`GoodCuspModel.tate_test`** (computation): The rank-one completion has the actual q-adic Tate degeneration.
- **`GoodCuspModel.twoEmbeddings_test`** (non-example): Forcing i_nat=i_alg as part of the definition rejects the source's permitted approximation models.

**Acceptance.**

- Formal identification preserves the family and level data.
- The natural and algebraic ring embeddings R_alg→R^hat and their three comparison conditions are recorded separately.

### Etale relation on integral degeneration charts

**Node:** `ShimuraCompactifications:C5/etale-chart-relation`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.etale_chart_relation`. **Kind:** theorem.

Let U_H be the finite disjoint union of the chosen smooth good algebraic models and the open PEL atlas, and let U_H[0] be its interior. Form R_H[0]=U_H[0]×_(M_H)U_H[0], representing interior PEL-family identifications. Define R_H as the relative normalization of U_H×_B U_H in R_H[0], as in Lan 6.3.3.7. Extend the tautological interior family isomorphism to R_H; prove both projections R_H→U_H etale and verify the diagonal, symmetry and composition of Corollary 6.3.3.14. This construction uses normalization of the interior relation, not the entire unrestricted isomorphism functor of all boundary families.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use Lan's selected charts and equivalence-class labels; charts with unrelated function-field embeddings cannot simply be identified pointwise.
- Use the smooth compatible cone collection of Definition 6.3.3.4 and the selected etale models of Definition 6.3.2.5. The normalizations and overlap laws use the exact source embeddings and component labels.

**Construction or proof.**

1. Construct the interior fibre-product relation and its normalization over U_H×_B U_H using the generic normalization interface; extend its tautological semi-abelian PEL isomorphism by homomorphism-extension and uniqueness.
2. Use the good-model etale recognition and Lan 6.3.3.13 for both projections.
3. Use the completed-local-chart comparison to prove the normal relation is etale (6.3.3.13), then extend the interior diagonal, inverse and composition as in Corollary 6.3.3.14 and apply the SF.1 effective quotient interface.

**Direct prerequisites.** `ShimuraCompactifications:C5/good-algebraic-model`, `ShimuraCompactifications:C1/cusp-label`, `ShimuraCompactifications:C4/homomorphism-extension`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.3.3.7–6.3.3.14, printed pp. 514–518: Normalization of the interior relation, extended tautological isomorphism, etale projections and relation laws.

**Acceptance.**

- Both projections are etale.
- The cocycle is an ordinary algebraic-space relation, not a stipulated formal quotient.

### Integral PEL toroidal algebraic spaces

**Node:** `ShimuraCompactifications:C5/integral-toroidal-space`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.integral_toroidal_space`. **Kind:** construction.

For the smooth compatible collection Sigma of Lan Definition 6.3.3.4, form M_H,Sigma^tor=[U_H/R_H] over the stated good base B with its descended semi-abelian PEL family and cusp/cone stratification. The quotient is a finite-type separated smooth algebraic stack; it is an algebraic space at neat level. Complete fans give properness through valuative-properness. Projective choices give a scheme through ample descent. Keep finite stabilizer quotients at non-neat level before taking any coarse space; this theorem does not assert smoothness of that coarse space. The ordinary construction here does not cover arbitrary nonsmooth fans; the normalized projective construction is separate.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Sigma is the complete compatible collection of SMOOTH admissible cone decompositions in Definition 6.3.3.4, satisfying Condition 6.2.5.25 and the surjection compatibility in Condition 6.3.3.2. Retain Lan's standing PEL conditions, including Condition 1.4.3.10 and Convention 6.2.1.1. The neat no-self-intersection assertion uses the source's actual compatibility condition, rather than neatness alone on an arbitrary fan.

**Construction or proof.**

1. Take the effective etale quotient of etale-chart-relation and descend the family and all its rigidified PEL structures.
2. Identify the open locus with M2 and descend the cusp/cone strata.
3. Prove finite type, separatedness and smoothness on the actual charts; combine formal-completion and valuative-properness for the complete compactification. For non-neat level apply the actual finite quotient-stack construction.

**Direct prerequisites.** `ShimuraCompactifications:C5/etale-chart-relation`, `ShimuraCompactifications:C0/relative-regular-coordinates`, `ShimuraCompactifications:C4/endomorphism-extension`, `PELModuli:M2/representability`, `SchemeAndStackFoundations:SF.1`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Definition 6.3.3.4; 6.3.3.15–6.3.3.16; Theorem 6.4.1.1, printed pp. 512–513 and 518–520: Ordinary smooth compatible fan quotient, neat algebraic-space case, and the universal structures.

**Uses.**

- **ShimuraCompactifications:C5/integral-minimal-space**: Supplies the proper toroidal source and Hodge line.
- **PerfectoidShimuraVarieties:S1**: Imports the higher-level normalization charts after their separate comparison.
- **ArakelovGeometryAndAbelianHeights:R35.5**: Uses the good-base moduli realization and Hodge line.

**API.**

- **`IntegralToroidalModel.openImmersion`** (projection): The interior is an open immersion of the actual good-prime PEL moduli space.
- **`IntegralToroidalModel.universalSemiAbelian`** (projection): Returns the descended universal semi-abelian family with polarization and O-action.
- **`IntegralToroidalModel.chart`** (characterisation): The chosen good algebraic models are its etale boundary atlas with the prescribed family identifications.
- **`IntegralToroidalModel.genericComparison`** (compatibility): Characteristic-zero base change agrees with the C2 canonical toroidal model for the same PEL datum and fan.
- **`IntegralToroidalModel.descend_hom`** (universal-property): For the neat effective etale quotient, maps to an algebraic space correspond to maps from U_H compatible with its ACTUAL normalized relation R_H and its two projections. Retain quotient-stack descent at non-neat level.

**Unit tests.**

- **`IntegralToroidalModel.interior_test`** (compatibility): Restricting the atlas and family to the interior returns the M2 moduli object.
- **`IntegralToroidalModel.modular_test`** (computation): At a dimension-one cusp the completion carries the imported Tate generalized elliptic degeneration.
- **`IntegralToroidalModel.badPrime_test`** (non-example): Removing a prime dividing the level from the good-prime restriction does not produce a smooth model by this construction.

**Acceptance.**

- The open subspace is the actual M2 algebraic space.
- The family restricts to its universal abelian family and becomes semi-abelian at the boundary.

**Planet:** Integral PEL toroidal compactification.

### Formal completion along integral boundary strata

**Node:** `ShimuraCompactifications:C5/formal-completion`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.formal_completion`. **Kind:** theorem.

For each cusp/cone equivalence class, identify the completion of its appropriate open stratum neighbourhood in M_H,Sigma^tor with the specified universal formal torus-embedding chart modulo its actual stabilizer. Remove closures of the other strata as in Lan 6.4.1.1(5) before completing. Preserve the family, Hodge bundles, O-action and level data. Do not infer a map between completions along different centers from an unrelated chart inclusion.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use the same smooth compatible Sigma as integral-toroidal-space, and the exact stratum neighbourhood with its ordinary scheme-theoretic ideal. At non-neat level retain the source stack and stabilizer quotient; singular higher-level normalizations require their separate formal comparison.

**Construction or proof.**

1. Apply the good-model formal identification on each atlas chart.
2. Restrict to the source's stratum neighbourhood and descend along the etale relation.
3. Identify the stabilizer quotient and structures; use these local comparisons to establish compatible completion maps only for the stated centers.

**Direct prerequisites.** `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/good-algebraic-model`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.4.1.1(5) and proof, printed pp. 519–523: Exact completion neighbourhood and structural comparison.

**Acceptance.**

- The center and excluded stratum closures are named.
- The identification preserves ordinary nilpotent thickenings.

### Properness of integral toroidal compactifications

**Node:** `ShimuraCompactifications:C5/valuative-properness`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.valuative_properness`. **Kind:** theorem.

For the complete smooth compatible cusp system of the ordinary construction and good-prime PEL data, M_H,Sigma^tor is proper over B. Prove separatedness and the valuative extension/uniqueness for the actual finite-type algebraic space. After the allowed finite DVR base extension, semistable reduction and the degeneration period pairing determine a cone chart; completeness supplies the extension and the separated relation plus the source's valuative descent argument supply uniqueness/descent.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Sigma is the complete smooth compatible collection used in integral-toroidal-space; use the precise admissible valuation criterion and the semistable-reduction theorem of R11.3. The non-neat conclusion is properness of the source stack; the neat conclusion is properness of its algebraic space.

**Construction or proof.**

1. Extend a generic PEL family after the permitted DVR extension using semistable reduction, retaining its polarization and O-action.
2. Locate its positive valuation datum in a cone of Sigma and use the formal/good algebraic chart to extend the moduli point.
3. Use separatedness and the etale relation together with the source's valuative/fpqc descent argument, rather than deriving descent from equality of labels alone. Proposition 6.3.3.17 (printed p. 518) proves properness. Theorem 6.4.1.1(6) is the more precise all-traits cone extension criterion, not the properness statement by itself; the semistable-reduction and descent leaves remain requests.

**Direct prerequisites.** `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C0/arithmetic-admissible-fan`, `ShimuraCompactifications:C4/degeneration-effectivity`, `NeronModelsAndSemistableAbelianVarieties:R11.3`, `SchemeAndStackFoundations:SF.1`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Proposition 6.3.3.17 and the opening assertion of Theorem 6.4.1.1, printed pp. 518–519; (6), printed pp. 520–521: Properness theorem, with the distinct all-traits cone extension criterion.

**Acceptance.**

- Every allowed DVR test has existence and uniqueness.
- An incomplete fan is excluded.

### Smooth relative boundary intersections

**Node:** `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`. **Declaration:** `ShimuraCompactification.neat_boundary_intersection_smooth`. **Kind:** lemma.

Every D_J is smooth over B. Empty intersections are allowed; no claim is made that a nonempty intersection is connected.

**Hypotheses.**

- Work on the actual good-prime PEL toroidal algebraic space X=M_H,Sigma^tor of Lan 6.3.3.15, over the indicated regular Noetherian arithmetic base B=Spec R. H is neat; Sigma satisfies 6.3.3.4, including 6.2.5.25. Retain 1.4.3.10 and the good-prime/level hypotheses of 1.4.1.2 and M2. The source construction and its ordinary etale chart/stratification theorem are required inputs, not implemented objects or arbitrary smooth resolutions.
- D_i are the finitely many irreducible components of the reduced boundary. For a subset J of their index set, D_J is their scheme-theoretic intersection (D_empty=X), and D_J^o=D_J minus the union of D_i with i outside J. These are subspaces of the actual X, not new boundary carriers.

**Construction or proof.**

1. Use the actual ordinary etale presentation from 6.3.2.5-6.3.3.16. At neat level the cone stabilizers act trivially as in 6.2.5.27. Do not replace this presentation by formal completions alone.
2. Apply the new relative-regular-coordinates and relative-boundary-coordinates nodes on the ordinary chart. Their integral monoid-algebra calculation is over the smooth abelian-torsor base and retains the actual torsor multiplication. The source model still needs its ordinary chart identification.
3. The source fan condition and neat no-self-intersection clause identify distinct global branches through a point with distinct coordinate hyperplanes. Scheme-theoretic intersection quotients by the corresponding coordinate variables, leaving another smooth polynomial/Laurent chart.
4. Smoothness composes with the smooth cusp base and descends through the actual etale cover by SF.0/SF.1. Work with algebraic spaces throughout; minimal compactification and projectivity are not premises.

**Direct prerequisites.** `ShimuraCompactifications:C0/relative-regular-coordinates`, `ShimuraCompactifications:C0/relative-boundary-coordinates`, `PELModuli:M2`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/valuative-properness`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.3.2.5(2), 6.3.3.14-6.3.3.16; 6.4.1.1(3), pp. 503, 517-520: Uses the ordinary relative charts and the specific neat fan hypotheses; the proof of the intersection conclusion is expanded here.
- [STACKS-NC](https://stacks.math.columbia.edu/tag/0CBN), 41.21.2: Only the absolute intersection criterion is compared; relative smoothness comes from the arithmetic-base charts.

**Acceptance.**

- For a two-ray affine chart the three cases J=empty, one ray, both rays yield affine plane, affine line and the base.
- Disconnected intersections remain smooth and are not renamed a single stratum.
- An irreducible nodal boundary divisor cannot be treated as one smooth global branch: the no-self-intersection premise is essential. This is a generic warning, not a PEL counterexample.

### Density of exact boundary opens in every geometric fiber

**Node:** `ShimuraCompactifications:C5/neat-boundary-open-fiberwise-dense`. **Declaration:** `ShimuraCompactification.neat_boundary_open_fiberwise_dense`. **Kind:** lemma.

For every geometric point b of B and every J, the open (D_J^o)_b is dense in (D_J)_b. In particular, it meets each nonempty geometric-fiber component of each open-and-closed subspace of D_J.

**Hypotheses.**

- Work on the actual good-prime PEL toroidal algebraic space X=M_H,Sigma^tor of Lan 6.3.3.15, over the indicated regular Noetherian arithmetic base B=Spec R. H is neat; Sigma satisfies 6.3.3.4, including 6.2.5.25. Retain 1.4.3.10 and the good-prime/level hypotheses of 1.4.1.2 and M2. The source construction and its ordinary etale chart/stratification theorem are required inputs, not implemented objects or arbitrary smooth resolutions.
- D_i are the finitely many irreducible components of the reduced boundary. For a subset J of their index set, D_J is their scheme-theoretic intersection (D_empty=X), and D_J^o=D_J minus the union of D_i with i outside J. These are subspaces of the actual X, not new boundary carriers.

**Construction or proof.**

1. Base-change the ordinary etale chart and the scheme-theoretic boundary intersections. Smoothness and the coordinate descriptions survive this base change.
2. Apply relative-boundary-coordinates: the exact open in the coordinate quotient inverts the remaining boundary monomial. Multiplication by that monomial is injective on its exponent basis over every base ring. Thus the local open is schematically dense after every base change; in particular it is topologically dense on the geometric fiber. This strengthens the preceding reduced-base coordinate argument without changing the target.
3. For clarity, use the generic open-map proof rather than counting rational points: the inverse image of a dense open under an open map is dense, because any nonempty open has nonempty open image. Etale maps are open.
4. Apply this to the etale chart maps and descend density using their jointly surjective cover. Restriction to an open-and-closed component preserves it. Density after extension to an algebraic closure also implies density in an ordinary residue fiber.

**Direct prerequisites.** `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`, `ShimuraCompactifications:C0/relative-boundary-coordinates`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/valuative-properness`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.3.2.5 and 6.4.1.1(2)-(3): A deduction from the relative coordinate-orbit description, with the base change and density steps made explicit; not inferred from total open density alone.

**Acceptance.**

- In A1 over a field, G_m is dense even when that field has finitely many rational points; no rational-point cardinality proof is admissible.
- If J contains every boundary coordinate, the remaining product is 1 and the exact open equals the entire coordinate intersection.
- Over a DVR, deleting the closed fiber from a boundary section gives a total-space dense open that is NOT fiberwise dense. The arbitrary dense-open statement is false.

### A labelled stratum component is an exact boundary open

**Node:** `ShimuraCompactifications:C5/neat-stratum-closure-component`. **Declaration:** `ShimuraCompactification.neat_stratum_closure_component`. **Kind:** theorem.

For every nonempty irreducible component Z of a labelled stratum, let J consist of the global boundary components containing Z. There is a unique connected component W of D_J with Z = W intersect D_J^o. Consequently the reduced closure of Z in X is W.

**Hypotheses.**

- Work on the actual good-prime PEL toroidal algebraic space X=M_H,Sigma^tor of Lan 6.3.3.15, over the indicated regular Noetherian arithmetic base B=Spec R. H is neat; Sigma satisfies 6.3.3.4, including 6.2.5.25. Retain 1.4.3.10 and the good-prime/level hypotheses of 1.4.1.2 and M2. The source construction and its ordinary etale chart/stratification theorem are required inputs, not implemented objects or arbitrary smooth resolutions.
- D_i are the finitely many irreducible components of the reduced boundary. For a subset J of their index set, D_J is their scheme-theoretic intersection (D_empty=X), and D_J^o=D_J minus the union of D_i with i outside J. These are subspaces of the actual X, not new boundary carriers.

**Construction or proof.**

1. The source closure/incidence theorem makes each boundary component a union of stratum components. Thus Z lies wholly inside or wholly outside each D_i, so it lies in the indicated exact-pattern open D_J^o.
2. On the ordinary relative toric chart, an exact coordinate pattern is a face-orbit stratum, now described by relative-face-open, relative-stratum-quotient and relative-boundary-coordinates. Good algebraic models preserve these labels (6.3.2.5 and 6.3.2.16), and the two projections of the quotient groupoid preserve their equivalence classes (6.3.3.16). Thus, on D_J^o, every labelled stratum is open: around each point it is the image of the appropriate exact-pattern etale chart.
3. All label subsets in D_J^o are open, so their complements are open as well. A stratum is smooth over the regular base; its irreducible components are open and closed. Hence the partition of D_J^o into stratum components is a partition by open-and-closed subsets. No assertion about arbitrary refinements of a stratification is used.
4. By neat-boundary-intersection-smooth, D_J is regular and Noetherian. Its connected components are irreducible and open and closed. By neat-boundary-open-fiberwise-dense, each nonempty component W has a nonempty dense open W intersect D_J^o, which is irreducible.
5. An irreducible space admits no partition into two nonempty open-and-closed subsets. Therefore W intersect D_J^o is exactly the stratum component it meets. Conversely the connected Z lies in one W. Its closure is W, which is already reduced. This proves existence and uniqueness without assuming that all of D_J is one stratum closure.

**Direct prerequisites.** `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`, `ShimuraCompactifications:C5/neat-boundary-open-fiberwise-dense`, `ShimuraCompactifications:C0/relative-face-open`, `ShimuraCompactifications:C0/relative-stratum-quotient`, `ShimuraCompactifications:C0/relative-boundary-coordinates`, `SchemeAndStackFoundations:SF.1`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/valuative-properness`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.3.2.16; 6.3.3.16; 6.4.1.1(2)-(3): Refines the source open-dense intersection assertion using its ordinary stratum-preserving charts. The exact-pattern and connected-component argument is this blueprint deduction; it needs the stated no-self-intersection and label-descent inputs.

**Acceptance.**

- A smooth quadrant has one exact zero/nonzero pattern for each subset of its two rays, with the usual face-incidence order.
- Over a base where 2 is invertible, on P1_z times P1_w the divisors w=1 and w=z^2 meet in two disjoint sections z=1 and z=-1. One must choose a connected component of their intersection, not identify the whole intersection with one stratum closure.
- For J empty, this includes a connected component of the open moduli stratum and its closure in the corresponding component of X. It does not manufacture a boundary cusp when the boundary is empty.

### Properness of the neat stratum closure

**Node:** `ShimuraCompactifications:C5/neat-stratum-closure-proper`. **Declaration:** `ShimuraCompactification.neat_stratum_closure_proper`. **Kind:** lemma.

The reduced closure W of each nonempty stratum component Z is proper over B. Together with the preceding nodes it is smooth over B, and Z_b is dense in W_b for every geometric point b.

**Hypotheses.**

- Work on the actual good-prime PEL toroidal algebraic space X=M_H,Sigma^tor of Lan 6.3.3.15, over the indicated regular Noetherian arithmetic base B=Spec R. H is neat; Sigma satisfies 6.3.3.4, including 6.2.5.25. Retain 1.4.3.10 and the good-prime/level hypotheses of 1.4.1.2 and M2. The source construction and its ordinary etale chart/stratification theorem are required inputs, not implemented objects or arbitrary smooth resolutions.
- D_i are the finitely many irreducible components of the reduced boundary. For a subset J of their index set, D_J is their scheme-theoretic intersection (D_empty=X), and D_J^o=D_J minus the union of D_i with i outside J. These are subspaces of the actual X, not new boundary carriers.

**Construction or proof.**

1. Identify W with the connected component of D_J supplied by neat-stratum-closure-component. No arbitrary closure smoothness principle is invoked.
2. Since D_J is Noetherian and regular, W is open and closed in D_J; D_J is a closed subspace of X. Thus W to X is a closed immersion.
3. Compose with the actual proper structural morphism X to B from the early toroidal construction. Smoothness follows from the first node, and fiberwise density from the second after restricting to W.
4. Do not use the integral minimal compactification, an ample Hodge power, scheme representability or any projectivity theorem. Those are separate C5 targets.

**Direct prerequisites.** `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`, `ShimuraCompactifications:C5/neat-boundary-open-fiberwise-dense`, `ShimuraCompactifications:C5/neat-stratum-closure-component`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/valuative-properness`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.3.3.17 and 6.4.1.1, combined with the preceding stratum identification: Imports properness of the actual constructed toroidal model; it does not re-prove the valuative compactification construction in this checkpoint.

**Acceptance.**

- A boundary section in P1_B is proper over B; its open obtained by deleting a special fiber is not a replacement for the proper closure.
- A disconnected boundary intersection gives separate proper closures, not an assertion of their geometric connectedness.
- The proof applies to proper algebraic spaces without first proving that the toroidal model is a scheme.

### Neat strata detect geometric-fiber components

**Node:** `ShimuraCompactifications:C5/neat-strata-detect-geometric-components`. **Declaration:** `ShimuraCompactification.neat_strata_detect_geometric_components`. **Kind:** theorem.

For a finite family of nonempty labelled strata of the actual neat model X, assume their union meets every irreducible component of X. Then for every geometric point b of B, their base changes meet every irreducible component of X_b. This supplies the residue-component hypothesis required by the B5 prime-quotient expansion argument at neat level.

**Hypotheses.**

- Work on the actual good-prime PEL toroidal algebraic space X=M_H,Sigma^tor of Lan 6.3.3.15, over the indicated regular Noetherian arithmetic base B=Spec R. H is neat; Sigma satisfies 6.3.3.4, including 6.2.5.25. Retain 1.4.3.10 and the good-prime/level hypotheses of 1.4.1.2 and M2. The source construction and its ordinary etale chart/stratification theorem are required inputs, not implemented objects or arbitrary smooth resolutions.
- D_i are the finitely many irreducible components of the reduced boundary. For a subset J of their index set, D_J is their scheme-theoretic intersection (D_empty=X), and D_J^o=D_J minus the union of D_i with i outside J. These are subspaces of the actual X, not new boundary carriers.

**Construction or proof.**

1. Split the chosen strata into their finitely many irreducible components, using Noetherianity and smoothness. This does not change their union.
2. Apply the preceding closure and density nodes to obtain smooth proper W_a and opens Z_a dense in every geometric fiber of W_a. This is the specific PEL instance missing from a mere total-space density assertion.
3. Import the generic smooth-closure component detector from SF.2, after its SF.1 algebraic-space and proper coherent cohomology inputs. Its proof uses the arithmetic-base Stein factor X to E to B with E finite etale. Each W_a to E is proper and smooth, so its image is clopen; the total-component hypothesis makes these images cover E.
4. Over a geometric b, the fibers of X over the points of the discrete E_b are the connected regular, hence irreducible components of X_b. The corresponding nonempty W_a fibers are open and closed in W_a,b, so the dense Z_a,b meets them. This describes the exact imported detector, not a second C5 definition or independent copy of Stein theory.
5. Export the conclusion directly to AutomorphicBundles B5. The owner order is early spaces/descent, then SF.2 Stein/detection, then early C5, then B5. Do not insert a B5-to-C5 edge or use the C5 minimal-compactification endpoint.

**Direct prerequisites.** `ShimuraCompactifications:C5/neat-boundary-open-fiberwise-dense`, `ShimuraCompactifications:C5/neat-stratum-closure-component`, `ShimuraCompactifications:C5/neat-stratum-closure-proper`, `SchemeAndStackFoundations:SF.2`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/valuative-properness`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 7.1.2.14(1), geometric component hypothesis, read with 6.4.1.1: Neat-level geometric input to the source expansion theorem, not a proof of its arbitrary-coefficient or non-neat cases.
- [STACKS-STEIN](https://stacks.math.columbia.edu/tag/0A18), 76.36.1, 76.36.4 and 76.36.9; also tag 0E0D: Supplies Stein factorization; the smooth-closure detector is assigned once to SF.2 and applied here to the actual PEL stratum closures.

**Uses.**

- **AutomorphicBundles:B5/fj-injectivity-cyclic**: Supplies the geometric residue-component premise at neat level. Formal-chart coefficient comparison and coefficient devissage remain B5/F0 obligations.

**Acceptance.**

- For two disjoint proper smooth curves, selecting strata on only one curve fails the total-component hypothesis.
- For P1_B with either whole standard boundary section, the condition and conclusion both hold on every geometric fiber.
- A connected finite etale Stein cover may have several points in a geometric fiber. The proof must reach every point, not confuse connectedness over B with geometric connectedness.
- No conclusion for arbitrary non-neat level is asserted: a neat cover need not preserve the detecting collection on every lifted component, and a toroidal level map need not be etale at the boundary.

**Planet:** Boundary component detection.

### Non-neat boundary and component descent

**Node:** `ShimuraCompactifications:C5/nonneat-boundary-descent`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.nonneat_boundary_descent`. **Kind:** theorem.

At non-neat good level, construct the toroidal quotient stack and its coarse boundary using the actual finite stabilizer actions. Descend the ordinary stratum ideals and chart incidences, keeping branch normalization and possible self-identifications. Transfer the neat component-detection conclusion only after proving every geometric component is covered by the chosen proper branch/level cover and its stratified descent. Coarse quotient smoothness and global simple normal crossings are not asserted.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use a specified neat normal subgroup and compatible cone system, the quotient stack and actual finite stabilizers; keep residue-characteristic restrictions on coarse-space exactness.

**Construction or proof.**

1. Apply finite-level quotient descent to the neat atlas and family, then construct the coarse space with its ordinary boundary ideals.
2. Normalize boundary branches when self-identifications occur and prove the chosen proper cover meets every geometric component.
3. Descend the component detection only under that proved coverage. The branch-coverage and relative stack theorem are an explicit gap; the Stacks scheme normalization lemma is only a lead.

**Direct prerequisites.** `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/neat-strata-detect-geometric-components`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.4.1.1 and non-neat finite-level descent: Source neat theorem plus specified quotient-stack extension.
- [STACKS-NC](https://stacks.math.columbia.edu/tag/0CBN), Lemma 41.21.6, tag 0CBN: Scheme branch-normalization lead, not a relative stack theorem.

**Acceptance.**

- No smooth coarse quotient is assumed.
- Component detection requires an actual covering argument.

### Logarithmic Kodaira–Spencer on PEL models

**Node:** `ShimuraCompactifications:C5/log-kodaira-spencer`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.log_kodaira_spencer`. **Kind:** theorem.

On a neat smooth good-prime integral toroidal model, construct the logarithmic Kodaira–Spencer comparison with the PEL relation quotient of the tensor of invariant differentials, as in Lan 6.4.1.1(4). In the principally polarized Siegel case it is Sym² E ≅ Omega^1_M/B(log D), where E=e^*Omega^1_G/M is the invariant Hodge bundle of the universal semi-abelian family and D is the reduced toroidal boundary. Require the stated smooth chart and polarization conditions; do not replace a general PEL quotient by Sym² E.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- The level is neat, Sigma smooth, and the required no-self-identification condition is imposed when a global boundary divisor presentation is used.

**Construction or proof.**

1. Define the Hodge bundle via the identity section of the universal semi-abelian family.
2. Compute the period derivative on each universal formal degeneration chart, with ordinary logarithmic differentials dq_i/q_i.
3. Use the PEL relations and etale descent to glue the source's comparison. Check the rank-one Tate normalization against tate-log-kodaira-spencer.

**Direct prerequisites.** `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C4/tate-log-kodaira-spencer`, `AutomorphicBundles:B4`, `SchemeAndStackFoundations:SF.0`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 6.4.1.1(4), printed pp. 519–520: PEL logarithmic comparison.

**Acceptance.**

- The Siegel rank-g Hodge bundle gives differential rank g(g+1)/2.
- The rank-one logarithmic base differential is dq/q, distinct from the fibre differential du/u.

### Semiampleness of the integral Hodge line

**Node:** `ShimuraCompactifications:C5/hodge-semiampleness`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.hodge_semiampleness`. **Kind:** theorem.

For the good-prime integral toroidal PEL compactification, a positive tensor power of omega=det E is generated by global sections relative to B. This is semiampleness on the toroidal model; omega can have degree zero on boundary contraction fibres and is not assumed ample there. Retain the source's polarized PEL hypotheses and their finite-level descent.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use the proper toroidal model and its universal polarized degeneration. For a coarse non-neat model first prove descent of a positive power.

**Construction or proof.**

1. Apply the theta/polarized-family construction quoted in Lan 7.2.1.1 to produce sections separating the required degeneration data.
2. Use properness and the boundary chart comparison to obtain a uniform positive generating power.
3. Faltings–Chai V.2.1, printed p. 149, was read: it reduces to Moret-Bailly IX.2.1 and explains the role of theta constants. Its direct theta proof in V.3 and the cited Moret-Bailly theorem were not read; these remain the requested generation inputs. The Siegel statement is not by itself the full PEL extension.

**Direct prerequisites.** `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/valuative-properness`, `ShimuraCompactifications:C4/degeneration-effectivity`, `AutomorphicBundles:B4`, `AbelianSchemesAndArithmeticModuli:A5`, `SchemeAndStackFoundations:SF.2`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Proposition 7.2.1.1 and 7.2.1.2, printed pp. 540–541: Semiampleness and degree-zero/isotriviality criterion.
- FALTINGS-CHAI-1990 (cleared restricted reference), Chapter V, Proposition 2.1, printed p. 149 / PDF p. 161; Theorem 2.3 construction, pp. 150–152 / PDF pp. 162–164: Siegel Hodge semiampleness and the Stein/section-ring minimal construction, with the original theorem reference separated from the unread direct theta proof.

**Acceptance.**

- A uniform positive power is relatively generated.
- Boundary contraction fibres can have Hodge degree zero.

**Planet:** Hodge line semiampleness.

### Finite generation of the Hodge section algebra

**Node:** `ShimuraCompactifications:C5/graded-section-finite-generation`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.graded_section_finite_generation`. **Kind:** theorem.

For the proper toroidal model with semiample omega, prove the nonnegative section algebra S=direct-sum_(k>=0) H^0(M^tor,omega^k) is a finitely generated B-algebra under the Noetherian proper/semiample hypotheses of Lan 7.2.2.6. Apply the foundations Proj and Stein-factor results rather than planning those generic constructions here. Preserve base change and the positivity/constant-term inputs needed for identifying the PEL strata of its Proj.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use the relatively generated positive power and the proper algebraic-space coherent finiteness theorem. Generic finite generation alone does not imply an integral finite-type section algebra.

**Construction or proof.**

1. Map by a generated positive power and take the finite Stein factor using SF.2.
2. Use coherent direct image under the ample line on the Stein target to show finite generation of every residue class of graded degrees.
3. Combine the finitely many residue classes into S; apply the exact Noetherian argument of Lan 7.2.2.6. Import B5 only for subsequent boundary/constant-term identification.

**Direct prerequisites.** `ShimuraCompactifications:C5/hodge-semiampleness`, `ShimuraCompactifications:C5/valuative-properness`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.3`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Corollary 7.2.2.6; 7.2.3.1–7.2.3.3, printed pp. 544–546: Noetherian section-algebra argument and its compactification use.

**Acceptance.**

- All nonnegative degrees occur, with a finite Veronese argument.
- The result is over the good arithmetic base, not only over its fraction field.

### Integral minimal compactification

**Node:** `ShimuraCompactifications:C5/integral-minimal-space`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.integral_minimal_space`. **Kind:** construction.

Construct M_H^min=Proj_B S from the Hodge section algebra, with its proper map pi:M_H,Sigma^tor→M_H^min and its canonical open PEL immersion. Prove projectivity, normality and the stated flatness over the good base, identify the minimal boundary strata through constant terms, and prove independence of Sigma and agreement with the characteristic-zero minimal model. The map contracts the toroidal boundary directions; it is not a toric chart isomorphism. In its Stein-factor construction retain the canonical isomorphism O_(M_H^min)≅pi_*O_(M_H,Sigma^tor); special-fibre and formal transfers require their own base-change comparison.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use Lan's PEL compactification hypotheses, the semiample Hodge line and the exact constant-term/positivity inputs from B5. The first construction of the proper toroidal source does not import B5.

**Construction or proof.**

1. Form Proj of the finitely generated section algebra using the supplied foundations construction.
2. Use the Stein factor of the semiample Hodge morphism as in the construction preceding Lemma 7.2.3.1. Keep O_min≅pi_*O_tor as part of that construction; then establish normality, projectivity, open immersion and the prescribed arithmetic flatness.
3. Identify images and fibres of boundary strata through the B5 constant-term decomposition and Lan 7.2.3.5–7.2.3.9; compare different fans through C3 and their section maps.

**Direct prerequisites.** `ShimuraCompactifications:C5/graded-section-finite-generation`, `ShimuraCompactifications:C3/coherent-cohomology-invariance`, `AutomorphicBundles:B5`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.3`, `ShimuraVarieties:V2/baily-borel`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 7.2.3 construction preceding Lemma 7.2.3.1 and 7.2.3.1–7.2.3.9, printed pp. 544–548: Integral minimal construction, boundary images and independence.

**Uses.**

- **ShimuraCompactifications:C5/open-quasiprojectivity**: Realizes the open arithmetic moduli as an open in a projective scheme.
- **ArakelovGeometryAndAbelianHeights:R35.5**: Supplies the compactified Hodge line and good-base realization.

**API.**

- **`IntegralMinimalModel.fromToroidal`** (projection): The Hodge morphism has the specified restriction to the interior and boundary contraction.
- **`IntegralMinimalModel.fanIndependent`** (characterisation): The target and open immersion are canonically independent of the chosen compatible complete fan.
- **`IntegralMinimalModel.genericComparison`** (compatibility): Fraction-field base change gives the existing minimal Shimura variety for the same PEL datum.
- **`IntegralMinimalModel.levelMap`** (functoriality): Specified compatible level maps descend through the Hodge section algebra and obey composition.
- **`IntegralMinimalModel.structureSheaf`** (structure): For the algebraic Stein-factor contraction pi, O_min→pi_*O_tor is a canonical isomorphism. Completion or special-fibre comparison is a separate theorem with its own properness, coefficient and base-change hypotheses.

**Unit tests.**

- **`IntegralMinimalModel.interior_test`** (compatibility): The composition of the open immersion with the toroidal-to-minimal map is the canonical PEL open immersion.
- **`IntegralMinimalModel.modular_test`** (computation): In dimension one the cusp contraction agrees with the imported compactified modular curve.
- **`IntegralMinimalModel.fan_test`** (degenerate): Replacing Sigma by a compatible refinement preserves the minimal target and its open immersion.

**Acceptance.**

- The map restricts to the prescribed identity on the open PEL moduli.
- Different compatible fans produce the same minimal target.

**Planet:** Integral minimal compactification.

### Ample Hodge line on the minimal model

**Node:** `ShimuraCompactifications:C5/minimal-hodge-ampleness`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.minimal_hodge_ampleness`. **Kind:** theorem.

A specified positive power of the Hodge line descends to an ample invertible sheaf on the neat integral minimal compactification, whose pullback to the toroidal model is that power of omega. On coarse finite-level quotients record the descended Q-line/positive tensor power and stabilizer restrictions. For the Siegel coarse minimal variety this supplies the ample Hodge Q-line used by Yuan; it does not assert ampleness of omega on the toroidal source.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- For a coarse quotient prove descent through an auxiliary sufficiently fine level and use the source's stabilizer/characteristic restrictions.

**Construction or proof.**

1. Use Proj/Stein factor and the semiample generating power to identify the descended ample line.
2. Compare its toroidal pullback and normalize the positive tensor power.
3. Descend through the specified finite-level quotient to the ample Q-line statement; Yuan's cited Faltings–Chai construction is a supplier proof leaf.

**Direct prerequisites.** `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C5/hodge-semiampleness`, `AutomorphicBundles:B4`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 7.2.3 construction preceding Lemma 7.2.3.1 and 7.2.3.1–7.2.3.4, printed pp. 544–546: The finite Stein-factor map to projective space and pullback of its ample O(1); ampleness is a deduction from finiteness.
- [YUAN-2024](https://arxiv.org/pdf/2108.05625v4), 3.4, end; arXiv v4 printed pp. 55–56: Coarse Siegel minimal compactification and ample Hodge Q-line.

**Acceptance.**

- The descended line is ample on the minimal model.
- The toroidal pullback has the required positive power, without toroidal ampleness.

### Quasi-projectivity of good-prime PEL moduli

**Node:** `ShimuraCompactifications:C5/open-quasiprojectivity`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.open_quasiprojectivity`. **Kind:** theorem.

Deduce that the neat good-prime PEL moduli algebraic space of M2 is a quasi-projective scheme over B, using its canonical open immersion in the projective minimal compactification. This is Lan revised-book Corollary 7.2.3.10. Export the resulting arithmetic moduli realization and Hodge line to the height/finiteness owners with all good-prime conditions; their bad-prime correction estimates are not supplied by this theorem.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use the actual M2 algebraic space and its open immersion; do not assume scheme/quasi-projective representability in M2 to prove C5.

**Construction or proof.**

1. Apply the open immersion into the projective minimal model.
2. Use the scheme/open-subspace criterion to identify the open algebraic space as a scheme and restrict the ample line.
3. State the relative quasi-projectivity endpoint with its exact good-base PEL data and identify the height consumers' exported bundle.

**Direct prerequisites.** `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C5/minimal-hodge-ampleness`, `PELModuli:M2/representability`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

**Source match.**

- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Corollary 7.2.3.10, printed p. 548: Precise arithmetic moduli endpoint.

**Acceptance.**

- The endpoint is a scheme and relatively quasi-projective.
- No bad-prime or general Hodge/abelian-type integral model is asserted.

**Planet:** Quasi-projectivity of PEL moduli.

### Higher-level normalized toroidal models

**Node:** `ShimuraCompactifications:C5/higher-level-toroidal-normalization`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.higher_level_toroidal_normalization`. **Kind:** construction.

For the fixed good-prime base-level toroidal model and SAME-fan finite generic higher-level cover of M4, take relative normalization in the generic function algebra. Its map to the base toroidal model is finite over the excellent base and its interior is M4's normalization. Pull back the good-level universal semi-abelian family; its higher p-level structure is specified on the generic fibre, not automatically over the special fibre. The changed-lattice boundary description and identification with the normalized toroidal charts require the exact source comparison. This is the Siegel normalization lane described in BPS 5.1–5.2, extended to other PEL data only when that comparison is supplied. It is not automatically the parahoric moduli model or Lan's full ramified projective-fan construction.

**Hypotheses.**

- Let p be a GOOD prime for the base PEL datum and v|p. Take a neat prime-to-p level K^p, base p-level K_p^0=G(Z_p), and K_p contained in K_p^0 open. The base model is the ordinary good-level toroidal model over O_(F0,v); the higher level itself may have p-power index. Import the generic finite etale cover and its interior normalization from M4. Do not impose the base model's prime-to-p-level restriction on K_p.
- Fix the chosen good-level fan and its inverse-image cones in the changed higher-level character lattices. This is normalization of that SAME fan model in the finite generic function algebra over an excellent base. A compatible refinement of the fan instead gives a proper modification, not a finite normalization map to the old fan. General projective compatible nonsmooth fans at ramified primes use projective-normalized-blowup below, with different input models.

**Construction or proof.**

1. Import the interior normalization from M4 and extend by integral closure in the finite generic algebra.
2. For the changed integral lattices, prove the normalized character-line chart comparison in the specific same-fan situation; BPS 5.1–5.2 states the Siegel normalization result. Identifying this finite normalization with the projective normalized-blowup construction of Lan 2017 requires the recorded model-comparison gap, not just an appeal to Theorem 6.1.
3. Descend the family and finite map; compare compatible refinements. The model-identification theorem belongs to the separate parahoric owner.

**Direct prerequisites.** `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `PELModuli:M4/higher-level-normalization`, `PELModuli:M4/normalization-finite-normal-flat`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Theorem 6.1, printed pp. 22–24, as a comparison target with a DIFFERENT normalized-blowup construction: Lan's projective model is not defined merely by finite normalization of a fixed good-level toroidal model; the comparison is an explicit gap.
- [BPS-2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf), 5.1–5.2, printed pp. 1009–1010: Routed normalization compactification, with moduli identification kept separate.

**Uses.**

- **PerfectoidShimuraVarieties:S1**: Supplies normalized finite-level charts for its tower argument.
- **ShimuraCompactifications:C5/normalized-koecher**: Supplies the normalization model to which the routed integral Koecher theorem applies.

**API.**

- **`NormalizedToroidalModel.finiteMap`** (projection): For the SAME-fan relative normalization, the structural map to the chosen good-level toroidal model is finite. A subsequent fan refinement is a separate proper modification.
- **`NormalizedToroidalModel.openNormalization`** (compatibility): Its interior is canonically the M4 normalization, before any parahoric moduli identification.
- **`NormalizedToroidalModel.chartIntegralClosure`** (characterisation): When the exact changed-lattice/completed-chart comparison is supplied, the normalization chart identifies with its specified integral closure, torsor units and saturated character monoids; no arbitrary fan modification is inferred finite.
- **`NormalizedToroidalModel.refinement`** (functoriality): Compatible further fan refinements give proper comparison maps agreeing on the same generic higher-level cover; this functoriality is separate from finiteness of the fixed-fan normalization map.
- **`NormalizedToroidalModel.desc`** (universal-property): A normal flat algebraic space over the good-level toroidal model with the specified generic lift to the finite higher-level cover factors uniquely through its relative normalization, using the exact generic-compatibility and normalization descent hypotheses.

**Unit tests.**

- **`NormalizedToroidalModel.identity_test`** (degenerate): The identity generic cover of a normal base model returns that model.
- **`NormalizedToroidalModel.tate_ramification_test`** (computation): A cusp cover q=t^p is finite but ramified at t=0 and can have inseparable special behavior.
- **`NormalizedToroidalModel.open_test`** (compatibility): Restricting to the interior agrees with the M4 normalization carrier.
- **`NormalizedToroidalModel.smoothness_test`** (non-example): A higher-level normalized chart is not declared smooth merely because its good-level target is smooth.

**Acceptance.**

- The normalization map is finite and its open locus is the M4 normalized cover.
- The boundary model may be singular or ramified.

**Planet:** Higher-level toroidal normalization.

### Normalized chart finiteness and formal comparison

**Node:** `ShimuraCompactifications:C5/normalized-chart-finiteness`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.normalized_chart_finiteness`. **Kind:** theorem.

For the projective normalized-blowup model, prove the completed boundary chart identification of Lan 2017 Theorem 6.1(3)–(4), with the actual torus-torsor base and changed lattices. For the SAME-fan higher-level normalization, prove the separate finite integral-closure map and compare its completed charts with that source model when the input models agree. Export precisely these finite-type, normality and chart properties to the tower owner. A map induced by an arbitrary fan subdivision is proper and can have positive-dimensional fibres; it is not asserted finite.

**Hypotheses.**

- Retain separately the exact good-prime SAME-fan hypotheses of higher-level-toroidal-normalization and the projective compatible, possibly nonsmooth/ramified hypotheses of projective-normalized-blowup. Their model identification is a recorded gap. No all-prime general Hodge-type model is included.

**Construction or proof.**

1. Use finite integral closure on excellent charts in the same-fan normalization case; for the general projective model use the normalized-blowup construction and its formal chart theorem instead.
2. Apply Lan Theorem 6.1(3)–(4) for the projective model's completed torus-torsor chart. Relate it to the finite normalization chart only after the precise model-identification input has been supplied.
3. Verify overlap descent and the compatibility maps consumed by the tower. Lan's referenced global normalization/completion proof is an explicit unread leaf.

**Direct prerequisites.** `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`, `ShimuraCompactifications:C4/boundary-level-comparison`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`, `ShimuraCompactifications:C5/projective-normalized-blowup`.

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Theorem 6.1(3)–(4), printed pp. 22–23; Construction 4.5, printed p. 11: Normal formal torus-torsor charts; finite normalization maps require the separate same-fan argument.

**Acceptance.**

- The completed character lattice is the changed higher-level lattice.
- No unjustified inverse-limit/completion interchange is asserted.

### Integral canonical and subcanonical coefficient charts

**Node:** `ShimuraCompactifications:C5/integral-coefficient-extension`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.integral_coefficient_extension`. **Kind:** application.

Instantiate B3/B4 canonical coefficient extensions on the actual good-prime and normalized toroidal models. The canonical extension has the prescribed character-line Fourier–Jacobi completion; its subcanonical extension is the canonical sheaf tensor the ordinary boundary ideal, not an incorrectly identified pullback line on every refinement. Identify the formally canonical/subcanonical conditions of Lan 2017 Definition 8.5, including its finite exhaustive coefficient filtration with finite R-module graded pieces.

**Hypotheses.**

- Use the exact coefficient sheaf and finite-module filtration required by Definition 8.5, not an arbitrary boundary sheaf. Integral/normalized coefficients are requested from B3/B4 rather than inferred from their characteristic-zero construction.

**Construction or proof.**

1. Use the universal semi-abelian family to identify the B3/B4 coefficient functor on each boundary torsor chart.
2. Compare its completion with the character-line sum and the base coefficient E0, retaining the finite filtration condition.
3. For subcanonical coefficients impose strictly boundary-positive degrees/ordinary boundary ideal; use the C3 derived ideal comparison on refinements.

**Direct prerequisites.** `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraCompactifications:C5/formal-completion`, `AutomorphicBundles:B3`, `AutomorphicBundles:B4`, `ShimuraCompactifications:C3/refinement-boundary-ideal`, `ShimuraCompactifications:C5/projective-normalized-blowup`.

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Definition 8.5, printed p. 34: Exact completed coefficient form and finite-filtration hypothesis.
- [BPS-2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf), 5.1–5.2, printed pp. 1009–1010: Routed automorphic extension on the normalization model.

**Acceptance.**

- Canonical coefficients satisfy the exact formal condition used by Koecher.
- The subcanonical refinement map retains boundary multiplicities.

### Koecher principle on normalized PEL models

**Node:** `ShimuraCompactifications:C5/normalized-koecher`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.normalized_koecher`. **Kind:** theorem.

Let O tensor_Z Q be simple, R any O_F0,(p)-algebra, and E a quasi-coherent formally canonical coefficient sheaf on the normalized toroidal model in Lan 2017 Definition 8.5. For every open U_min of its minimal compactification, restriction Gamma(U_tor,E)→Gamma(U,E) is bijective, except when both dim(M_H)=1 and U_min minus U is nonempty. This includes the source's mod pi^n coefficients satisfying the formal hypothesis and BPS normalization model. It does not establish the model's separate identification with X_Iw.

**Hypotheses.**

- Use the projective normalized model and the exact Definition 8.5 completed character-line form plus finite filtration. Retain the simple-algebra hypothesis and the dimension-one exception.

**Construction or proof.**

1. Apply the positive Fourier–Jacobi rank/growth results of Lan 2017 Propositions 8.3–8.4 to the exact coefficient filtration.
2. Use the same formal extension argument as the source's cited Koecher theorem and glue over U_min.
3. Specialize to R=O/pi^n and the BPS normalization model after verifying the coefficient condition. The cited Lan [17] proof and positivity inputs are recorded as unresolved proof leaves; normal generic-fibre Hartogs alone does not prove torsion coefficients.

**Direct prerequisites.** `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraCompactifications:C5/integral-coefficient-extension`, `ShimuraCompactifications:C5/integral-minimal-space`, `AutomorphicBundles:B5`, `SchemeAndStackFoundations:SF.2`, `ShimuraCompactifications:C5/projective-normalized-blowup`.

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Theorem 8.7 and Remarks 8.9–8.10, printed pp. 34–35: Exact normalized-model theorem, exception and boundary of higher variants.
- [BPS-2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf), 5.2, printed p. 1010: Routed mod pi^n theorem for normalization model.
- [LAN-2017-ERRATA](https://www.kwlan.org/articles/cpt-ram-nbl-err.pdf), Item (3), p. 1: The explicit dimension-one/nonempty-boundary exception to Koecher, already retained in the node.

**Acceptance.**

- The theorem applies to arbitrary stated R, not merely its fraction field.
- Dimension-one boundary poles are the genuine excluded case.

### Siegel Koecher with arbitrary coefficients

**Node:** `ShimuraCompactifications:C5/siegel-koecher-arbitrary-coefficients`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.siegel_koecher_arbitrary_coefficients`. **Kind:** theorem.

For the neat good-prime genus-two Siegel model, E of rank two and integers a>=b, set omega(a,b)=Sym^(a-b) E tensor (det E)^b using the B3/B4 coefficient construction. For EVERY O-module M, restriction H^0(X,omega(a,b) tensor_O M)→H^0(Y,omega(a,b) tensor_O M) is bijective. Derive the arbitrary-module assertion through finite modules and filtered colimits, preserving torsion; the result is independent of the chosen compatible toroidal model.

**Hypotheses.**

- Use the precise smooth proper good-prime genus-two setup of Calegari–Geraghty 5.2. For higher normalized models instead invoke normalized-koecher with its exact coefficient hypotheses.

**Construction or proof.**

1. Verify the formally canonical condition for finite coefficient modules and apply the integral Koecher theorem.
2. Pass to arbitrary modules by filtered colimits on the finite-type quasi-compact separated models, using the exact coefficient construction.
3. Compare fans via the common refinement; preserve the derived boundary-ideal distinction for cuspidal coefficients.

**Direct prerequisites.** `ShimuraCompactifications:C5/normalized-koecher`, `ShimuraCompactifications:C5/integral-coefficient-extension`, `ShimuraCompactifications:C3/coherent-cohomology-invariance`, `SchemeAndStackFoundations:SF.2`.

**Source match.**

- [CG-2020](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), 5.2, published pp. 821–822: H0 with arbitrary O-module coefficients.
- [LAN-2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), 7.1.1.4–7.1.1.5, printed pp. 532–533: Arbitrary coefficient-module reduction and fan independence.

**Acceptance.**

- Torsion M=O/pi^n is included.
- No equality of all open and compactified higher cohomology follows from H0 Koecher.

### Ordinary-locus Koecher principle

**Node:** `ShimuraCompactifications:C5/ordinary-koecher`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.ordinary_koecher`. **Kind:** theorem.

For the exact ordinary minimal open and its toroidal inverse image in Pilloni 11.1.1, prove restriction of sections of the stated canonical coefficient sheaf to the open ordinary locus is bijective, retaining its integral/mod p setting. Prove the formal coefficient condition and special-fibre extension theorem on that open. The characteristic-zero whole-space Koecher assertion alone does not imply this ordinary mod p statement, and it is not exported to an unidentified arbitrary parahoric model.

**Hypotheses.**

- Use the specified good-prime ordinary geometry and finite-level coefficient construction. Establish normality/S2 and the codimension or Fourier–Jacobi extension inputs on the relevant special-fibre/formal model.

**Construction or proof.**

1. Identify the ordinary minimal open and toroidal preimage through the actual Hodge map.
2. Prove the special-fibre/formal extension input for the exact coefficient sheaf, then pass to the stated finite thickenings/completions.
3. Compare with the source's restriction map. Pilloni states this without proof/reference; the special-fibre/formal extension is recorded as a gap.

**Direct prerequisites.** `ShimuraCompactifications:C5/normalized-koecher`, `ShimuraCompactifications:C5/integral-coefficient-extension`, `AdicSpacesPartII:R2`, `AdicSpacesPartII:R3`, `SchemeAndStackFoundations:SF.2`.

**Source match.**

- [PILLONI-2020](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), 11.1.1, author-copy p. 66: Ordinary version asserted without a proof reference.

**Acceptance.**

- The ordinary mod p/formal setting is proved separately.
- No general parahoric model or higher-cohomology Koecher theorem is inferred.

### Codimension of genus-two Hilbert–Siegel boundary

**Node:** `ShimuraCompactifications:C5/hilbert-siegel-boundary-codimension`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.hilbert_siegel_boundary_codimension`. **Kind:** theorem.

For the exact genus-two Hilbert–Siegel minimal compactification over a totally real field of degree d in BCGP 8.2, the open has dimension 3d and every maximal nonempty boundary stratum has dimension at most d, hence boundary codimension at least 2d>=2. Preserve the inequality under the specified finite normalizations and on the normal formal model needed in the source. A toroidal boundary is a divisor; this codimension assertion concerns the minimal target.

**Hypotheses.**

- Use the source's normal characteristic-zero/minimal and normal formal setup; arbitrary bad-prime special-fibre codimension/S2 is not assumed from it.

**Construction or proof.**

1. Classify the genus-two rational parabolic boundary: rank-one pure quotient has Hilbert modular dimension d and maximal-rank cusp has dimension zero.
2. Compare to dimension 3d and use finite normalization to preserve dimensions of the specified closed strata.
3. Verify the normal formal charts used for the Hartogs argument; do not transport the inequality to the toroidal divisor.

**Direct prerequisites.** `ShimuraCompactifications:C1/boundary-incidence`, `ShimuraCompactifications:C2/minimal-boundary-map`, `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraVarieties:V2/rational-boundary`.

**Source match.**

- [BCGP-2021](https://arxiv.org/pdf/1812.09269v3), arXiv:1812.09269v3, Section 8.2, printed/PDF p. 240; publisher pagination not collated: Minimal boundary codimension and normal formal geometry.

**Acceptance.**

- For d=1, a rank-one boundary stratum has dimension 1 inside a threefold.
- The corresponding toroidal boundary has codimension one and is not confused with this minimal boundary.

### Formal Hilbert–Siegel Koecher principle

**Node:** `ShimuraCompactifications:C5/formal-hilbert-siegel-koecher`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.formal_hilbert_siegel_koecher`. **Kind:** theorem.

In BCGP 8.2, on the NORMAL formal minimal scheme and for its stated invertible sheaf and toroidal pullback, extend H0 sections uniquely across the codimension-at-least-two minimal boundary. Prove the formal Hartogs statement with its precise normality/local-finiteness hypotheses and compare the toroidal pushforward of the line. This does not imply equality of arbitrary higher cohomology or all torsion coefficient sections.

**Hypotheses.**

- Use the exact normal formal model, line bundle and finite-level comparison of the source; special-fibre S2/normality cannot be replaced by normality of a generic fibre.
- Supply O_formal-min≅pi_hat_*O_formal-tor for the ACTUAL formal contraction in BCGP, and a projection formula for its specified invertible sheaf. The good-level algebraic Stein equality in integral-minimal-space must be transported to this normalized/ordinary formal model; neither generic-fibre equality nor the fan-refinement theorem proves that transport.

**Construction or proof.**

1. Apply the foundations formal Hartogs theorem for an invertible sheaf on the normal formal model and the proved minimal boundary codimension.
2. Start with the toroidal-to-minimal Stein structure-sheaf comparison, then use AdicSpacesPartII:F0/formal-direct-image-comparison only after verifying its proper locally-Noetherian scheme hypotheses (or supplying the exact algebraic-space extension). The identification with BCGP's normalized/ordinary formal contraction, and any special-fibre transfer, remain the explicit comparison gap. Apply the projection formula for the specified line only once this comparison is supplied.
3. Identify the source's H0 restriction. Record the formal Hartogs theorem and normal formal-model verification as requests/gaps.

**Direct prerequisites.** `ShimuraCompactifications:C5/hilbert-siegel-boundary-codimension`, `AdicSpacesPartII:R2`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `ShimuraCompactifications:C5/integral-minimal-space`, `AdicSpacesPartII:F0/formal-direct-image-comparison`.

**Source match.**

- [BCGP-2021](https://arxiv.org/pdf/1812.09269v3), arXiv:1812.09269v3, Section 8.2, printed/PDF p. 240; publisher pagination not collated: Formal H0 extension on the specified normal model.

**Acceptance.**

- The normal formal model and invertible sheaf are the asserted carriers.
- The conclusion is H0 extension, with no blanket higher-cohomology statement.

### Prime-to-base cyclic level group at the boundary

**Node:** `ShimuraCompactifications:C5/prime-Q-subgroup-extension`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.prime_Q_subgroup_extension`. **Kind:** theorem.

For the Calegari–Geraghty K0(Q) Siegel toroidal model with Q a prime invertible on the arithmetic base, extend the specified open cyclic subgroup H⊂A[Q] AS A FINITE FLAT GROUP SCHEME over the compactification, as in Pilloni 2012 4.1.2. The extension is finite etale of rank Q and is the group used for the generator Isom cover. No closed inclusion of this extended group into the identity-component semi-abelian family is asserted: the source states a finite-flat group extension, and boundary torsion can lose rank. Retain the generic inclusion only on the open locus.

**Hypotheses.**

- Use the fixed K0(Q) model, compatible fans and subgroup with the source's extension construction; Q is invertible on the entire base.

**Construction or proof.**

1. Use the level degeneration datum to construct the finite flat cyclic level group H on each cusp chart, with its generic subgroup identification. The Faltings–Chai chapter V construction quoted by Pilloni remains a recorded proof leaf.
2. Descend the finite group and its generic identification through the ordinary chart relation; do not assert that the generic inclusion extends into the semi-abelian identity component.
3. Apply the finite-group order-invertible etaleness theorem and compare the generic restriction. Pilloni 4.1.2 gives this group-extension case.

**Direct prerequisites.** `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C4/boundary-level-comparison`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.

**Source match.**

- [PILLONI-2012](https://smf.emath.fr/system/files/2017-08/smf_bull_140_335-400.pdf), 4.1.2, printed pp. 350–351: The open subgroup extends as a finite flat group scheme; the text does not assert a boundary inclusion into the semi-abelian family.
- [CG-2020](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), 5.2, published p. 822: The compactified cyclic level group used for the next finite-etale cover.

**Acceptance.**

- H has rank Q on every fibre and is finite etale.
- The statement is not applied to a rank-losing boundary kernel, even when its generic degree is invertible on the base.

### Toroidal generator cover of a cyclic subgroup

**Node:** `ShimuraCompactifications:C5/prime-Q-generator-cover`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.prime_Q_generator_cover`. **Kind:** construction.

On the specified compactified K0(Q) model, define X_K1(Q)=Isom_X(Z/Q,H) for the extended finite-etale cyclic rank-Q level group. It is a finite-etale torsor under Delta=(Z/Q)^×, restricts to the specified K1(Q) level cover on the open, and inherits the pulled-back universal family and coefficient sheaves. The proof uses Q invertible and the actual extended finite group; it requires no inclusion of H into the semi-abelian identity component over the boundary.

**Hypotheses.**

- Use prime-Q-subgroup-extension, with Q prime and invertible on the base, and the constant cyclic group scheme Z/Q.

**Construction or proof.**

1. Represent the finite-etale group-scheme isomorphism functor by the foundations finite-etale Isom construction.
2. Check simple transitivity of generators under multiplication by (Z/Q)^× and finite-etale rank Q-1.
3. Compare the open level meaning and descend/pull back the family and coefficient data.

**Direct prerequisites.** `ShimuraCompactifications:C5/prime-Q-subgroup-extension`, `SchemeAndStackFoundations:SF.1`.

**Source match.**

- [CG-2020](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), 5.2, published p. 822: Exact compactified generator-cover construction.

**Uses.**

- **AutomorphicGaloisRepresentationsPartII**: Supplies compactified level covers for the coherent Hecke module construction.
- **CG-2020, 5.2**: Pulls back coefficient sheaves along the exact finite-etale level cover.

**API.**

- **`PrimeQGeneratorCover.torsor`** (structure): Multiplication of a generator by Delta gives a simply transitive action on each geometric fibre.
- **`PrimeQGeneratorCover.openLevel`** (compatibility): The interior is the stated K1(Q)→K0(Q) level map.
- **`PrimeQGeneratorCover.baseChange`** (functoriality): The Isom cover and its action commute with base change, with identity/composition comparisons.
- **`PrimeQGeneratorCover.isomSections`** (characterisation): Sections of the cover over T correspond to group-scheme isomorphisms (Z/QZ)_T→H_T; an arbitrary point of H or the zero section is not a generator.

**Unit tests.**

- **`PrimeQGeneratorCover.Q3_test`** (computation): For Q=3 and constant H=Z/3 there are two generators, permuted freely by (Z/3)^×.
- **`PrimeQGeneratorCover.Q2_test`** (degenerate): For Q=2 the generator cover has degree one.
- **`PrimeQGeneratorCover.open_test`** (compatibility): Restriction to the open gives the original level cover.
- **`PrimeQGeneratorCover.noninvertible_test`** (non-example): A p-kernel with rank loss at a characteristic-p boundary cannot be inserted as H to deduce a finite-etale cover.

**Acceptance.**

- The cover is finite etale of degree Q-1.
- It agrees with the prescribed open K1(Q) cover.

### Canonical bundle of a Siegel threefold

**Node:** `ShimuraCompactifications:C5/siegel-canonical-bundle`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.siegel_canonical_bundle`. **Kind:** theorem.

For a neat smooth genus-two Siegel toroidal threefold X/B with boundary D and invariant Hodge bundle E of rank two, det Omega^1_X/B(log D)=(det E)^3 and the relative dualizing line is (det E)^3 tensor O_X(-D). Derive this from the logarithmic Kodaira–Spencer isomorphism and the local normal-crossings coordinate formula; D is the actual boundary divisor. These are smooth-model bundle identities, not automatic dualizing formulas for singular p-level normalizations.

**Hypotheses.**

- Fix the PEL datum, its order, lattice, pairing and reflex field F0 from M1. Let B=Spec(O_F0,(S)) for a set S of good primes in Lan 1.4.1.1: no prime divides the level integer n, Ibad or Disc[L# : L]. Retain the order/unramifiedness, polarization-defect and quaternionic p=2 restrictions of M2; H has the specified prime-to-S level. No bad-prime smoothness is inferred.
- Use relative dimension three, principal Siegel polarization, smooth cone system and the specified boundary normal-crossings hypotheses.

**Construction or proof.**

1. Take determinants in Sym² E≅Omega^1(log D); compute det Sym² E=(det E)^3 by a rank-two basis/transition calculation.
2. Use the local logarithmic coordinate wedge to identify det Omega^1(log D)=det Omega^1 tensor O(D).
3. Identify det Omega^1 with the relative dualizing line in the smooth setting and descend the local comparison.

**Direct prerequisites.** `ShimuraCompactifications:C5/log-kodaira-spencer`, `AutomorphicBundles:B4`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`.

**Source match.**

- [CG-2020](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), 5.3, published pp. 830–831: Canonical/subcanonical duality bundle identity.

**Acceptance.**

- For a diagonal change of basis, Sym² has determinant (t1 t2)^3.
- Removing the logarithmic poles contributes O(-D).

### Good-reduction boundary geometry for cohomology

**Node:** `ShimuraCompactifications:C5/good-boundary-cohomology-export`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.good_boundary_cohomology_export`. **Kind:** application.

Export the exact good-prime toroidal family, smooth proper model, open Siegel moduli locus and normal-crossings boundary with the hyperspecial/tame level conditions used in BCGP 2025 Theorem 1.8.29. The cohomology owner must supply Lan–Stroh nearby-cycle/open comparison and duality to obtain the stated unramified cohomology conclusion. Smoothness of the nonproper open alone is not a proof of unramifiedness.

**Hypotheses.**

- At ell distinct from p use the theorem's hyperspecial ell-level, prime-to-ell auxiliary level and exact automorphic coefficient system; export only the model satisfying those hypotheses.

**Construction or proof.**

1. Choose the compatible good-prime smooth projective toroidal model and its universal semi-abelian extension.
2. Identify its interior, boundary and coefficient extension with the theorem's Siegel variety and local system inputs.
3. Pass the geometry to the etale/cohomology supplier, naming the nearby-cycle/open comparison and duality separately. The cited Lan–Stroh Corollary 5.20 proof is not read and is not a new theorem in C5.

**Direct prerequisites.** `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/valuative-properness`, `ShimuraCompactifications:C5/log-kodaira-spencer`, `AutomorphicBundles:B3`, `AutomorphicGaloisRepresentationsPartII:AG2.4`.

**Source match.**

- [BCGP-2025](https://arxiv.org/pdf/2502.20645v1), Theorem 1.8.29 and beginning of proof, arXiv v1 p. 17: Boundary geometry supplied here; nearby cycles and duality supplied by the cohomology owner.

**Acceptance.**

- The geometry retains hyperspecial good-reduction conditions.
- No cohomological conclusion is inferred from smoothness of the open alone.

### Projective normalized-blowup compactification

**Node:** `ShimuraCompactifications:C5/projective-normalized-blowup`. **Declaration:** `TauCeti.ShimuraCompactifications.C5.projective_normalized_blowup`. **Kind:** construction.

For Lan 2017's integral PEL/lattice-collection setting at a prime p, construct the projective toroidal model for a compatible PROJECTIVE cone system Sigma, without imposing smoothness or good reduction at p. Choose its compatible polarization function pol and a smooth refinement over the characteristic-zero reflex field. Push the pol-weighted boundary ideal to the minimal model, take its schematic closure J_tilde_(H,dpol) in the supplied p-integral minimal model, and form the normalization of its blow-up. For sufficiently divisible d the resulting models stabilize to the normal projective flat scheme M_tilde_(H,Sigma)^tor of Theorem 6.1, with the stated formal torus-torsor charts and tautological degenerating families indexed by the auxiliary lattice collection. This is a normalized blow-up of a minimal model; it is not defined as a finite cover of a fixed good-level toroidal model.

**Hypotheses.**

- Use the integral PEL datum (O,*,L,pairing,h0) and Condition 1.4.3.10 as in Lan 2017 Section 2. Let H be open compact in G(Zhat) with NEAT image H^p away from p, and retain the collection (g_j,L_j,pairing_j) indexed by J as in the source's reference [18], Section 2.
- Work over S_tilde_0=Spec(O_(F0,(p))). Sigma is complete admissible and compatible as in Definition 2.1/Condition 6.2.5.25, and projective as in Definitions 2.5 and 2.7. A compatible invariant polarization function is supplied; individual cones need not be smooth.
- The ramified normalized interior, minimal model and auxiliary lattice families of [18], Propositions 6.1 and 6.4 are requested from M4. The currently inspected M4 nodes cover only the good-prime normalization case, so this wider supplier interface is an explicit gap.

**Construction or proof.**

1. Use C0 projective refinements and Lan Construction 3.1 to form the boundary ideal whose ray multiplicities are dpol; Definition 3.5 pushes it to the characteristic-zero minimal model. Keep the invariant piecewise-linear function and its lattice-valued ray multiplicities.
2. Construction 3.12 takes the schematic closure of that ideal in the supplied p-integral minimal model and the normalization of its blow-up, yielding normality, projectivity and flatness. Generic normalization and blow-ups are foundations inputs, rather than new private carriers.
3. Lan Sections 4–5 identify the completed ideals and torus-torsor charts and establish stabilization for sufficiently divisible d; Theorem 6.1(1)–(6) supplies the resulting families, strata and uniqueness. The complete Sections 4–5 proof and [18] supplier constructions were not read, so their precise proof leaves remain a gap. When using Lemma 2.12 allow its nonvertex lattice generators as required by Remark 2.15.

**Direct prerequisites.** `ShimuraCompactifications:C0/smooth-projective-refinement`, `ShimuraCompactifications:C2/projective-algebraization`, `ShimuraCompactifications:C2/minimal-boundary-map`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `PELModuli:M4`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.3`.

**Source match.**

- [LAN-2017](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Construction 3.1, Definition 3.5 and Construction 3.12, printed pp. 7–9; Theorem 6.1, printed pp. 22–24: Normalized-blowup construction, local reflex base, projective compatible fan, and stabilized model theorem.

**Uses.**

- **ShimuraCompactifications:C5/normalized-chart-finiteness**: Supplies the projective source model whose formal chart theorem must be distinguished from a finite same-fan normalization.

**API.**

- **`ProjectiveToroidalModel.toMinimal`** (projection): Returns the canonical proper map to the supplied normalized minimal model, with the source's boundary stratum images.
- **`ProjectiveToroidalModel.completion`** (characterisation): The completed neighbourhood of the labelled stratum is the formal torus-torsor chart of Theorem 6.1(3)–(4), with its actual normal flat torsor base and all indexed families.
- **`ProjectiveToroidalModel.auxiliaryIndependent`** (extensionality): For sufficiently divisible d, the comparison identifies models for different d and polarization functions inducing the same Sigma; retain the fixed PEL lattice-collection data.
- **`ProjectiveToroidalModel.refinement`** (functoriality): Compatible projective refinements induce canonical proper maps with identity/composition, as in Theorem 6.1(2) and Proposition 7.1.
- **`ProjectiveToroidalModel.valuativeExtension`** (universal-property): For an irreducible Noetherian normal S over the local reflex base carrying the specified indexed degenerating families and generic level map, the map extends uniquely when, at each geometric point, ALL dominating complete-DVR valuation pairings lie in one corresponding cone, exactly as in Theorem 6.1(6).

**Unit tests.**

- **`ProjectiveToroidalModel.rankZero_test`** (degenerate): When there is no boundary and the minimal model is already the proper interior, the ideal is the unit ideal and its normalized blow-up returns that normal model.
- **`ProjectiveToroidalModel.blowup_test`** (non-example): The normalized blow-up of (x,y) in a regular two-dimensional affine chart has exceptional P1 and a positive-dimensional fibre; declaring every normalized blow-up a finite normalization fails this local construction test.
- **`ProjectiveToroidalModel.stabilization_test`** (compatibility): Two sufficiently divisible d giving the same source Sigma yield the canonical comparison preserving the labelled completed chart and each auxiliary family.

**Acceptance.**

- Every lattice index j has its own tautological semi-abelian family; higher-level structures are specified only where the source defines them.
- The output is projective over the local reflex base and maps properly to the supplied minimal model; no general finiteness to a different fan is claimed.

## Sources and version boundaries

The dated reading records below retain the earlier worker and reviewer provenance. This revision rechecked the 15 public PDF binary hashes and read the additional selected Faltings–Chai passages; it does not claim a new complete reading of all sources. Source results and proof steps are stated in our own words.

### STACKS-NC

[Normal crossings divisors](https://stacks.math.columbia.edu/tag/0CBN), The Stacks Project Authors. Section 41.21, tag 0CBN, read in the preceding checkpoint on 26 September 2026.

Recorded passages:

- Definitions 41.21.1 and 41.21.4, Lemma 41.21.2 and proof
- Lemma 41.21.6, branch normalization, read only as a possible non-neat lead

Preserved source provenance. These are absolute scheme criteria; relative smoothness uses the actual arithmetic-base charts.

### STACKS-STEIN

[Stein factorization for algebraic spaces](https://stacks.math.columbia.edu/tag/0A18), The Stacks Project Authors. Section 76.36, tag 0A18, and Lemma 76.36.9 at 0E0D, read in the preceding checkpoint on 26 September 2026.

Recorded passages:

- Lemma 76.36.1, Theorem 76.36.4 and its proof
- Lemma 76.36.9 and its proof, also opened at https://stacks.math.columbia.edu/tag/0E0D

Generic component detection is assigned to SF.2 after spaces/descent and proper coherent cohomology. Its C5 specialization is a deduction, not a separately numbered theorem claimed in Lan.

### BRESCIANI-2024

[On the birational section conjecture with strong birationality assumptions](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf), Giulio Bresciani. Publisher open-access PDF, Inventiones 235 (2024), pp. 129–150.

Binary SHA-256: `77c20bc77743abd3cabedbe6259a4bd686cb94823481bce724c3517b1c30e148`.

Recorded reading date: 2026-10-06.

Recorded passages:

- Lemma 8 proof, published p. 138: semi-abelian extension and full profinite Tate modules; no full-paper reading claimed

The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### FARB-KISIN-WOLFSON-2024

[Essential dimension via prismatic cohomology](https://arxiv.org/pdf/2110.05534v2), Benson Farb, Mark Kisin and Jesse Wolfson. arXiv:2110.05534v2, 27 February 2024; publisher copy not collated.

Binary SHA-256: `f281f903f7a1836ef0eb7abe718c78e72f481d059cecb91dd237e6ecfe83b26b`.

Recorded reading date: 2026-10-06.

Recorded passages:

- 3.2.1 and Lemma 3.2.2, printed p. 24; Proposition 3.2.7 proof, p. 25: torus torsors over abelian varieties, character lines and locally trivial compactified torsors

The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### LAN-2021

[Arithmetic compactifications of PEL-type Shimura varieties](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), Kai-Wen Lan. Author-hosted thesis revision, 14 March 2021; publisher edition not inspected.

Binary SHA-256: `a7a454f5d0735f4bf11f00a8afc14c361c5fc2cefd691d7466f7620ab4c3a079`.

Recorded reading date: 2026-10-06.

Recorded passages:

- 1.4.1.1 and standing good-prime restrictions; 3.3.1.1–3.3.1.10, printed pp. 191–193; selected 3.3.2 semistable-reduction context
- 4.1, printed pp. 207–208; 4.2.1.13–4.2.1.14, pp. 213–214; 4.4.1–4.4.16, pp. 250–255; 4.5.2.15–4.5.2.18, pp. 273–275; 4.5.3.6 and surrounding graph proof; 4.5.4.17 numerical lemma
- 6.1.1.2–6.1.1.11 and 6.1.2.1–6.1.2.8: relative torus charts, ordinary embeddings and coordinate ideals, retained checkpoint analysis
- 6.2.5.25–6.2.5.28 formal degeneration/stabilizers; 6.3.2.5–6.3.2.9, pp. 503–505, freshly read two-embedding good algebraic-model definition and existence
- 6.3.3.13 proof and 6.3.3.14–6.3.3.16, pp. 514–518, freshly read ordinary etale relation and quotient descent
- 6.4.1.1 and proof, pp. 519–523, freshly read; 7.1.1.4–7.1.1.5 and proof, pp. 532–533, arbitrary coefficient modules
- 7.2.1.1–7.2.1.2, pp. 540–541; 7.2.2.6 and 7.2.3 construction, pp. 544–546; 7.2.3.5–7.2.3.10, pp. 547–548; selected 7.1.2 Fourier–Jacobi consumer context
- Independent review: Proposition 3.1.5.1 (p. 183), 4.2.1.7 (p. 210), Definition 4.4.6/Remark 4.4.7 (p. 251), Definitions 6.3.3.4/6.3.3.7 and Proposition 6.3.3.17 (pp. 512–518), and the explicit Stein structure-sheaf equality (p. 544).

The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### LAN-ERRATA

[Arithmetic compactifications of PEL-type Shimura varieties: errata](https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf), Kai-Wen Lan. Author-hosted list, 14 March 2021.

Binary SHA-256: `14343693efbc34ef8e9fa63e65ac9586c663d1c731409c0db64ec39a7e84eb88`.

Recorded reading date: 2026-10-06.

Recorded passages:

- Items 60–77, approximation/etaleness, label and torsor corrections

The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### LAN-2017

[Integral models of toroidal compactifications with projective cone decompositions](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Kai-Wen Lan. Author-hosted published-paper copy, IMRN 2017.

Binary SHA-256: `ff2229d32fc6dd99174d8ff392ebdf6c93c3a455118bd7d54f54a74a967d31ac`.

Recorded reading date: 2026-10-06.

Recorded passages:

- Definitions 2.1, 2.2, 2.5, 2.7 and Proposition 2.8: compatible projective fans and concave/superadditive convention
- Theorem 6.1(1)–(6) and beginning of proof, printed pp. 22–24: normalized integral models; not the full referenced normalization proof
- Proposition 7.5 and proof 7.10–7.14, pp. 27–29: structure sheaf, boundary ideal and higher direct-image vanishing; KKMS Corollary 2, p. 44, remains unread
- Definition 8.5, Theorems 8.6–8.7, Remarks 8.9–8.10, pp. 34–35: exact coefficient form, simple-algebra hypothesis and dimension-one exception; Propositions 8.3–8.4/the cited [17] proof are incomplete proof leaves
- Independent review also read Sections 1–2 setup (pp. 3–5), Construction 3.1, Definition 3.5, Construction 3.12 (pp. 7–9), Construction 4.5 (p. 11), and Proposition 7.1 setup (p. 27); full Sections 4–5 proof remains a gap.

The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### PINK-1990

[Arithmetical compactification of mixed Shimura varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), Richard Pink. Author-hosted dissertation text; publisher edition not compared.

Binary SHA-256: `6f8aa447ccf54368d465a9d45f44bc91f0d35440cba04e20061c576145ca8669`.

Recorded reading date: 2026-10-06.

Recorded passages:

- 2.1, printed pp. 29–30, with rendered p. 30 inspection; 3.12–3.22, pp. 47–53, torus/abelian torsor and polarization construction
- 4.7–4.16, pp. 59–64; 4.22–4.25, pp. 68–69: boundary datum, filtrations and positivity/incidence
- 6.4–6.7, pp. 96–99; 6.10–6.12, pp. 100–102; 6.18–6.21, pp. 105–109; 6.22–6.27, pp. 110–115: charts, quotient topology, gluing/maps and compactness
- 7.2–7.5, pp. 118–120: strata; 9.17–9.25, pp. 153–158: smooth/projective refinements and finite compatibility
- 12.1–12.8, pp. 196–199: toroidal canonical models and descent; 12.13–12.17 special mixed-model construction not read

The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### BPS-2016

[Classicite de formes modulaires surconvergentes](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf), Stephane Bijakowski, Vincent Pilloni and Benoit Stroh. Publisher PDF, Annals of Mathematics 183 (2016) no. 3.

Binary SHA-256: `13c159cde16c09c98de6b29ed1cf0e293ae78e5dc250399a1ee9203b3601d92c`.

Recorded reading date: 2026-10-06.

Recorded passages:

- 5.1–5.2, printed pp. 1009–1010: normalization model compactification, coefficient extension and mod pi^n Koecher; identification with the moduli model remains a separate Part II target

The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### BP-2026

[Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), George Boxer and Vincent Pilloni. Author copy built 5 November 2025, 65 pages; Springer version of record not compared.

Binary SHA-256: `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6`.

Recorded reading date: 2026-10-06.

Recorded passages:

- 3.4.15–3.4.16, p. 39: toric/coherent vanishing in the partial ordinary tower setting
- 4.1.1, p. 41, semi-abelian isogeny chains; 4.2.2, p. 43, extension/quasi-finite flat isogenies; routed kernel-finiteness correction

The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### PILLONI-2020

[Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Vincent Pilloni. Author copy dated 17 June 2019, 113 pages; Duke version of record not compared.

Binary SHA-256: `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58`.

Recorded reading date: 2026-10-06.

Recorded passages:

- Selected 3.4, pp. 15–16, monoidal/adic vanishing setting; 5.3, p. 24, coherent cohomology and boundary ideals
- Theorem 6.1.5.1, p. 29: refinement pullback error, corrected derived boundary-ideal comparison
- 11.1.1, p. 66: ordinary Koecher assertion; 13.2.1, p. 85: exact Klingen correspondence, subgroup formula and asserted acyclicity

The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### PILLONI-2012

[Sur la theorie de Hida pour le groupe GSp4](https://smf.emath.fr/system/files/2017-08/smf_bull_140_335-400.pdf), Vincent Pilloni. Publisher PDF, Bulletin de la SMF 140 (2012), pp. 335–400.

Binary SHA-256: `605f046df3f91c6405fa5b18d377e0ef3eb913398220238291a76bc16ed266c2`.

Recorded reading date: 2026-10-06.

Recorded passages:

- 4.1.2, printed pp. 350–351: compactified subgroup extension at prime-to-base level

The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### CG-2020

[Minimal modularity lifting for non-regular symplectic representations](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), Frank Calegari and David Geraghty. Author-hosted Duke typeset copy, 96 pages; page numbers offset by 800 in publisher pagination.

Binary SHA-256: `fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5`.

Recorded reading date: 2026-10-06.

Recorded passages:

- 5.2, published pp. 821–822: Siegel compactification, arbitrary coefficients, fan independence, Koecher and compactified generator cover
- 5.3, published pp. 830–831: canonical/subcanonical duality identity
- A.3.2, published pp. 886–888: ordinary/refinement coherent comparison setting

The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### BCGP-2021

[Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3), George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni. arXiv:1812.09269v3; publisher edition not collated.

Binary SHA-256: `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed`.

Recorded reading date: 2026-10-06.

Recorded passages:

- 8.2, published locator p. 240: genus-two Hilbert–Siegel minimal boundary codimension, normal formal model and H0 Hartogs

The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### BCGP-2025

[Modularity of abelian surfaces](https://arxiv.org/pdf/2502.20645v1), George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni. arXiv:2502.20645v1; publisher edition not collated.

Binary SHA-256: `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`.

Recorded reading date: 2026-10-06.

Recorded passages:

- Theorem 1.8.29 and beginning of proof, p. 17: hyperspecial good-reduction geometry and Lan–Stroh nearby-cycle/open comparison plus duality

The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### YUAN-2024

[Arithmetic bigness and a uniform Bogomolov-type result](https://arxiv.org/pdf/2108.05625v4), Xinyi Yuan. arXiv:2108.05625v4, 30 April 2024, text dated 1 May 2024; requested 2026 publisher edition not compared.

Binary SHA-256: `a4e4c3d79e0912b62961a4b45b08e1e5c6957b0b64af7da74647c8ff9361e11e`.

Recorded reading date: 2026-10-06.

Recorded passages:

- 3.4, end, printed pp. 55–56: minimal Siegel coarse compactification and ample Hodge Q-line; author-hosted requested copy connection refused

The named passages were read, not the whole source. Unread supporting proofs and version comparisons are listed explicitly in gaps. The SHA-256 records the inspected PDF binary.

### LAN-2017-ERRATA

[Kai-Wen Lan, Integral models of toroidal compactifications with projective cone decompositions — errata](https://www.kwlan.org/articles/cpt-ram-nbl-err.pdf), Kai-Wen Lan. Author-hosted one-page errata, inspected independently.

Binary SHA-256: `e0ecf94c74332660867965dc9877836ef97f2a03161c53b5f0ff1a1a7f616b04`.

Recorded reading date: 2026-10-06.

Recorded passages:

- One-page author errata, items (1)–(3); finite etale group scheme averaging and the dimension-one exception in Theorem 8.7.

Linked from the author academic bibliography; all three numbered corrections read. Publisher version not compared.

### FALTINGS-CHAI-1990

Degeneration of Abelian Varieties (cleared restricted reference), Gerd Faltings and Ching-Li Chai. Ergebnisse der Mathematik und ihrer Grenzgebiete, third series, volume 22, Springer, 1990; maintainer-cleared reference copy.

Recorded reading date: 2026-10-10.

Recorded passages:

- Chapter I, Definitions 2.1 and 2.3, Propositions 2.7 and 2.9, Theorem 2.10 and Corollary 2.11, printed pp. 7–13 (PDF pp. 19–25)
- Chapter V, Propositions 2.1–2.2 and the construction in Theorem 2.3, printed pp. 149–152 (PDF pp. 161–164); the direct theta proof in section 3 was not read

Selected passages read in the cleared reference copy. This restricted source has no freely readable URL here. No source file or extracted passage is included in the repository. Earlier proof references, the direct theta construction and the level-group extension leaves remain explicit.

## Source issues

The two independently confirmed findings remain scoped to the inspected editions. The recorded descriptions are paraphrases.

### ShimuraCompactifications/E1

Pink author-hosted dissertation, Definition 2.1(v), printed p. 30, PDF p. 31 (one-based); binary SHA-256 as PINK-1990. Publisher text not compared.

**Printed claim (paraphrased).** The source assigns Lie V to n = -1 and Lie W to n >= 0.

**Correction.** Use Lie W for n=-1 and Lie P for n>=0. The weight-minus-one graded quotient is Lie V=Lie W/Lie U.

**Reason.** The displayed filtration is on Lie P. For a pure datum W=1 and nonzero Lie P, its printed top step would be zero, contradicting exhaustivity. The printed middle line also places a quotient Lie V where a Lie P subspace is required. The surrounding weight convention gives the stated correction; the rendered author-copy p. 30 was inspected.

**Version and correction search.** New finding for the inspected author-hosted binary; no formal published correction located, and no error in an uninspected publisher edition is asserted.

- Pink dissertation download and author dissertation bibliography at https://people.math.ethz.ch/~pink/dissertation.html, read 2026-10-06; no errata link found.
- Search for Pink Definition 2.1 mixed Shimura Lie filtration errata; primary definitions use Lie W and Lie P. No author erratum found.

### ShimuraCompactifications/E2

Author-hosted revision dated 14 March 2021, Lemma 6.1.2.6, printed p. 444/PDF p. 472 (one-based); SHA-256 recorded as LAN-2021. Publisher edition uninspected.

**Printed claim (paraphrased).** The source identifies the closed complement, after reduction, with Spec of the orthogonal-character algebra without reduction, allowing arbitrary Z.

**Correction.** Use the scheme-theoretic off-face monomial quotient as the stratum. If a reduced stratum is wanted, reduce that quotient too; identifying it with the unreduced character algebra requires reducedness of the relevant base/chart.

**Reason.** Remark 6.1.2.2 explicitly permits arbitrary Z. For Z=Spec(Z/4Z), a trivial G_m-torsor and its positive ray, the displayed orthogonal quotient is Spec(Z/4Z) whereas the reduced closed complement of G_m in A1_Z is Spec(F2). The nonzero nilpotent 2 survives the monomial quotient and is killed by reduction. The packet's C0 quotient and nilpotent tests already use the scheme-theoretic version.

**Version and correction search.** New finding for the inspected hashed author revision; no corresponding correction was located in the author errata searched. No claim about an uninspected publisher edition.

- The 14 March 2021 book errata at https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf was inspected, including its toroidal and stratum corrections; this arbitrary-base reduced-stratum discrepancy was not located.
- The author bibliography https://www.kwlan.org/academic.html and its linked thesis errata https://www.kwlan.org/articles/cpt-PEL-type-thesis-errata.pdf were searched for the toroidal/reduced-stratum correction on 2026-10-06.

## Supplier requests

- **`AbelianSchemesAndArithmeticModuli:A2`**: Existing relative abelian/group-scheme carriers, invariant differentials and family maps; fibrewise semi-abelian extension statements are new C4 targets. Needed by `ShimuraCompactifications:C1/boundary-torsor-tower`, `ShimuraCompactifications:C4/semi-abelian-scheme`.
- **`AbelianSchemesAndArithmeticModuli:A3`**: Dual abelian schemes and polarization/Rosati morphisms with their actual finite-kernel hypotheses; not a nonexistent dual of every semi-abelian scheme. Needed by `ShimuraCompactifications:C4/poincare-extension-classification`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/endomorphism-extension`, `ShimuraCompactifications:C4/semiabelian-tate-module`.
- **`AbelianSchemesAndArithmeticModuli:A4`**: Abelian finite torsion and full/primewise Tate modules with continuous Galois action in characteristic zero, their multiplication transition maps and functoriality. C4 imports these and only adds the semi-abelian torus-extension instance. Needed by `ShimuraCompactifications:C4/semiabelian-tate-module`.
- **`AbelianSchemesAndArithmeticModuli:A5`**: Poincare/cubical biextensions, polarized complex-torus algebraization and relative line-bundle identities, plus the theta-generation input for the Hodge semiampleness theorem. These generic abelian constructions are imported rather than duplicated. Needed by `ShimuraCompactifications:C1/boundary-torsor-tower`, `ShimuraCompactifications:C4/poincare-extension-classification`, `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C5/hodge-semiampleness`.
- **`AdelicAlgebraicGroups:AA.3`**: Rational boundary arithmetic lattices, effective stabilizers, finite cusp double-coset sets and the AMRT reduction input used in Pink 6.19/6.22. Full arithmetic stabilizers may have infinite ineffective kernels. Needed by `ShimuraCompactifications:C1/cusp-label`, `ShimuraCompactifications:C1/arithmetic-stabilizer`.
- **`AdicSpacesPartII:F0`**: For the completed ordinary Igusa charts in BP 3.4.15–3.4.16, supply a basis of affine formal opens and the finite-thickening coherent sheaves, their local higher-cohomology vanishing and surjective/Mittag-Leffler transition maps. Apply F0/cohomology-of-mittag-leffler-limit only with ALL its local/global hypotheses; prove the comparison for the actual refinement before passing to completed cohomology. The formal-functions theorem alone does not imply chart acyclicity. Needed by `ShimuraCompactifications:C3/partial-ordinary-formal-invariance`.
- **`AdicSpacesPartII:R2`**: Normal formal/rigid geometry and exact ordinary/minimal open comparison, formal Hartogs for line bundles and verified special-fibre hypotheses; no unproved interchange of inverse limit and cohomology. Needed by `ShimuraCompactifications:C5/ordinary-koecher`, `ShimuraCompactifications:C5/formal-hilbert-siegel-koecher`.
- **`AdicSpacesPartII:R3`**: Pilloni coherent analytic comparison, partial ordinary/formal charts and Klingen correspondence compactification in the exact level/coefficient setting. The boundary factorization needed for first-arrow acyclicity remains explicit. Needed by `ShimuraCompactifications:C3/partial-ordinary-formal-invariance`, `ShimuraCompactifications:C3/klingen-correspondence-compactification`, `ShimuraCompactifications:C3/klingen-correspondence-acyclicity`, `ShimuraCompactifications:C5/ordinary-koecher`.
- **`ArithmeticGaloisDuality:R02.1`**: Actual compact/profinite coefficient carrier, continuous Galois modules and exactness of inverse limits of the finite surjective torsion systems; full-versus-primewise product comparison. No private general inverse-limit or topological Galois cohomology theory is constructed in C4. Needed by `ShimuraCompactifications:C4/semiabelian-tate-module`.
- **`AutomorphicBundles:B3`**: Integral good-prime and normalized canonical/subcanonical coefficient functors with their exact formal character-line form and finite coefficient filtration. The present characteristic-zero canonical-extension/refinement nodes supply that case only. Subcanonical pullback must use C3 derived boundary-ideal comparison. Needed by `ShimuraCompactifications:C5/integral-coefficient-extension`, `ShimuraCompactifications:C5/good-boundary-cohomology-export`.
- **`AutomorphicBundles:B4`**: Invariant Hodge bundle of the universal semi-abelian family, determinant line, Siegel rank-two coefficient functors, and normalized integral base change. The logarithmic Kodaira–Spencer and ample minimal-line instances belong to C4/C5, not a redefinition of the bundles. Needed by `ShimuraCompactifications:C3/coherent-cohomology-invariance`, `ShimuraCompactifications:C4/tate-log-kodaira-spencer`, `ShimuraCompactifications:C5/log-kodaira-spencer`, `ShimuraCompactifications:C5/hodge-semiampleness`, `ShimuraCompactifications:C5/minimal-hodge-ampleness`, `ShimuraCompactifications:C5/integral-coefficient-extension`, `ShimuraCompactifications:C5/siegel-canonical-bundle`.
- **`AutomorphicBundles:B5`**: Exact Fourier–Jacobi coefficient, positivity/constant-term and finite-growth inputs for minimal boundary identification and Koecher. Consume these only after the early toroidal/properness construction; no return import of all C5 to an early C5 node. Needed by `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C5/normalized-koecher`.
- **`AutomorphicGaloisRepresentationsPartII:AG2.4`**: The Lan–Stroh nearby-cycle/open comparison and etale duality for the hyperspecial good-reduction Siegel cohomology theorem. C5 exports the precise smooth proper boundary geometry; smoothness of a nonproper open does not prove unramified cohomology. Needed by `ShimuraCompactifications:C5/good-boundary-cohomology-export`.
- **`ComplexComparisonPartII:C2`**: For an actual finite-type separated complex algebraic scheme or algebraic space, supply analytic properness/compactness equivalence with algebraic properness and compatibility with the nilpotent-preserving analytification carrier. For projective toroidal algebraization supply the compact analytic-space theorem with the actual positive/ample line, rather than assuming that every compact analytic space is algebraic. No matching C2 node was found, so these are requested interfaces, not verified existing results. Needed by `ShimuraCompactifications:C2/compactness-properness`, `ShimuraCompactifications:C2/projective-algebraization`.
- **`ComplexComparisonPartII:C4`**: Import C4/repair-proper-morphism-algebraicity only for its stated proper complex SCHEMES. Additionally supply Pink 12.4–12.5 algebraic-space algebraization from the compact toroidal charts/ample-cover data and the effective descent extension for algebraic spaces. The existing proper-scheme Hom comparison does not provide either existence of an algebraization or the algebraic-space extension. Specify the boundary canonical descent compatibility before using this interface for canonical models. Needed by `ShimuraCompactifications:C2/projective-algebraization`, `ShimuraCompactifications:C2/minimal-boundary-map`, `ShimuraCompactifications:C2/canonical-toroidal-model`.
- **`ModularCurvesPartII:R13.1`**: The existing dimension-one generalized elliptic/Tate n-gon family, period q, invariant relative differential du/u, torsion and the actual isogeny/base-parameter maps. Also supply its normalized logarithmic Kodaira–Spencer comparison. The file named R13.3 currently contains only R14 targets, so no absent Tate node is invented. Needed by `ShimuraCompactifications:C4/boundary-level-comparison`, `ShimuraCompactifications:C4/tate-degeneration-comparison`.
- **`ModularCurvesPartII:R13.2`**: The existing dimension-one generalized elliptic/Tate n-gon family, period q, invariant relative differential du/u, torsion and the actual isogeny/base-parameter maps. Also supply its normalized logarithmic Kodaira–Spencer comparison. The file named R13.3 currently contains only R14 targets, so no absent Tate node is invented. Needed by `ShimuraCompactifications:C4/boundary-level-comparison`, `ShimuraCompactifications:C4/tate-degeneration-comparison`.
- **`ModularCurvesPartII:R13.3`**: The existing dimension-one generalized elliptic/Tate n-gon family, period q, invariant relative differential du/u, torsion and the actual isogeny/base-parameter maps. Also supply its normalized logarithmic Kodaira–Spencer comparison. The file named R13.3 currently contains only R14 targets, so no absent Tate node is invented. Needed by `ShimuraCompactifications:C4/boundary-level-comparison`, `ShimuraCompactifications:C4/tate-degeneration-comparison`.
- **`NeronModelsAndSemistableAbelianVarieties:R11.3`**: Binding RS-32 local Raynaud/lattice uniformization and semistable reduction with the exact complete-DVR/polarization hypotheses. Its current raynaud-extension-comparison text verbally imports early C4; resolve that ownership interface to give an independently usable local supplier before the C4 relative extension. Do not close a C4→R11.3→C4 carrier cycle. Checkpoint interface retained: Binding RS-32 transfer: C4 imports the existing local polarized Raynaud/lattice uniformization construction and proves its relative cusp/effectivity extension using the same carriers. No duplicate local uniformization, and no inference that the local result already constructs the universal PEL charts. Needed by `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/mumford-quotient`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C5/valuative-properness`.
- **`PELModuli:M1`**: The existing PEL order, lattice, pairing, reflex field, endomorphism and Rosati data, with their compatibility on families. C4 constructs the universal degeneration; this request imports its PEL input rather than asking M1 to construct that degeneration again. Needed by `ShimuraCompactifications:C4/formal-universal-degeneration`, `ShimuraCompactifications:C4/endomorphism-extension`.
- **`PELModuli:M2`**: The actual good-prime moduli stack/algebraic-space and universal abelian family, including the unramified-order, lattice/polarization-defect, quaternionic p=2 and prime-to-p-level restrictions. Supply smoothness over the arithmetic base, including for the lower-dimensional cusp moduli. Do not assume integral scheme representability or quasi-projectivity before C5. Needed by `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`.
- **`SchemeAndStackFoundations:SF.0`**: Relative Spec of graded quasi-coherent character-line algebras; ordinary localization/closed ideal and arbitrary coefficient base change; generic valuative properness and relative-affine morphism criteria; smooth/log differential coordinates, finite group order-invertible etaleness and schematic/fibrewise density. Native quotient/ideal arithmetic already in this owner is imported, not replanned. Checkpoint interface retained: Reuse generic coordinate-algebra quotients/localizations, relative Spec of quasi-coherent algebras with its universal property and base change, base change of closed intersections, smooth polynomial/Laurent charts, smooth composition and etale locality. Supply the local sheaf test for schematic density from injectivity of localization, and the open-map density argument. Existing monoid algebras and ideal quotients remain native carriers. No tensor/inverse-limit interchange is requested. Current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 already has CategoryTheory.CommMon.relativeSpec, CategoryTheory.CommMon.relativeSpecToBase and CategoryTheory.CommMon.relativeSpecIsoSpec (with the TauCeti.AlgebraicGeometry.relativeSpec functor on QuasicoherentAlgebra) in AlgebraicGeometry/RelativeSpec. Adopt those declarations through the existing owner, with graded subalgebra and arbitrary-base-change comparisons; never reconstruct relative Spec here. Those modules are absent at this job’s f790474 pin. Needed by `ShimuraCompactifications:C0/relative-torus-embedding`, `ShimuraCompactifications:C0/relative-face-open`, `ShimuraCompactifications:C0/relative-regular-coordinates`, `ShimuraCompactifications:C0/relative-stratum-quotient`, `ShimuraCompactifications:C0/relative-boundary-coordinates`, `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`, `ShimuraCompactifications:C0/relative-fan-properness`, `ShimuraCompactifications:C2/normal-open-dense`, `ShimuraCompactifications:C3/refinement-structure-sheaf`, `ShimuraCompactifications:C4/semi-abelian-scheme`, `ShimuraCompactifications:C4/extended-isogeny-kernel`, `ShimuraCompactifications:C4/tate-log-kodaira-spencer`, `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`, `ShimuraCompactifications:C5/neat-boundary-open-fiberwise-dense`, `ShimuraCompactifications:C5/neat-stratum-closure-proper`, `ShimuraCompactifications:C5/log-kodaira-spencer`, `ShimuraCompactifications:C5/formal-hilbert-siegel-koecher`, `ShimuraCompactifications:C5/prime-Q-subgroup-extension`, `ShimuraCompactifications:C5/siegel-canonical-bundle`.
- **`SchemeAndStackFoundations:SF.1`**: Effective etale/fpqc descent for relative affine algebras, ideals and families; character-line grading of a split torus torsor with coherent multiplication and pushout along quotient tori; finite group quotients/stacks/coarse spaces and finite-etale group Isom torsors; separated/proper algebraic-space criteria. Its algebraic-space/atlas carrier nodes are imported; these additional torsor, quotient and descent APIs are not supplied by the carrier alone. Checkpoint interface retained: Actual algebraic-space etale atlases and effective descent for quasi-coherent algebras, affine relative schemes, closed ideals and their maps. For a split torus torsor, supply its character-line grading with inherited coherent multiplication and its equivalence with the actual torsor; include pushout along a split quotient torus and compatible local trivializations. This generic input precedes C0 and is not imported from the C4 consumer. Also retain the C5 stratified etale descent and connected-regular component topology; the scheme-only baseline is not already the algebraic-space theorem. Needed by `ShimuraCompactifications:C0/relative-torus-embedding`, `ShimuraCompactifications:C0/relative-face-open`, `ShimuraCompactifications:C0/relative-stratum-quotient`, `ShimuraCompactifications:C0/relative-boundary-coordinates`, `ShimuraCompactifications:C0/relative-fan-properness`, `ShimuraCompactifications:C1/boundary-torsor-tower`, `ShimuraCompactifications:C2/quotient-separation`, `ShimuraCompactifications:C2/projective-algebraization`, `ShimuraCompactifications:C2/canonical-toroidal-model`, `ShimuraCompactifications:C3/refinement-structure-sheaf`, `ShimuraCompactifications:C3/refinement-higher-structure-sheaf`, `ShimuraCompactifications:C3/refinement-boundary-ideal`, `ShimuraCompactifications:C4/semi-abelian-scheme`, `ShimuraCompactifications:C4/constructible-character-sheaf`, `ShimuraCompactifications:C4/poincare-extension-classification`, `ShimuraCompactifications:C4/mumford-quotient`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `ShimuraCompactifications:C4/homomorphism-extension`, `ShimuraCompactifications:C4/extended-isogeny-kernel`, `ShimuraCompactifications:C5/good-algebraic-model`, `ShimuraCompactifications:C5/etale-chart-relation`, `ShimuraCompactifications:C5/integral-toroidal-space`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/valuative-properness`, `ShimuraCompactifications:C5/neat-boundary-intersection-smooth`, `ShimuraCompactifications:C5/neat-boundary-open-fiberwise-dense`, `ShimuraCompactifications:C5/neat-stratum-closure-component`, `ShimuraCompactifications:C5/neat-stratum-closure-proper`, `ShimuraCompactifications:C5/nonneat-boundary-descent`, `ShimuraCompactifications:C5/minimal-hodge-ampleness`, `ShimuraCompactifications:C5/open-quasiprojectivity`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraCompactifications:C5/normalized-chart-finiteness`, `ShimuraCompactifications:C5/prime-Q-subgroup-extension`, `ShimuraCompactifications:C5/prime-Q-generator-cover`.
- **`SchemeAndStackFoundations:SF.2`**: Proper algebraic-space coherent finiteness, formal-functions/projection formula and coefficient/filtered-colimit comparisons with exact module hypotheses; finite etale Stein factor and geometric-component detector for smooth proper closures with fibrewise-dense stratum opens; finite-generation/Stein application for a semiample line. Formal Hartogs and special-fibre S2/normality must be provided for the exact formal models, separately from generic-fibre Hartogs. The cohomology of a nonproper open is not inferred from the proper theorem. Checkpoint interface retained: After SF.1 spaces/descent and proper coherent cohomology, implement the generic smooth-closure detector: for smooth proper X over a regular Noetherian base and smooth proper closed W_a with opens Z_a fiberwise dense, total-component detection by Z_a implies geometric-fiber detection. Use the finite etale Stein factor, clopen images of W_a, and density on its discrete fibers. It is one foundations theorem, not a reverse import of B5 or all SF.2 into early SF.1. Needed by `ShimuraCompactifications:C3/toric-structure-sheaf-vanishing`, `ShimuraCompactifications:C3/refinement-higher-structure-sheaf`, `ShimuraCompactifications:C3/refinement-boundary-ideal`, `ShimuraCompactifications:C3/coherent-cohomology-invariance`, `ShimuraCompactifications:C3/partial-ordinary-formal-invariance`, `ShimuraCompactifications:C3/klingen-correspondence-acyclicity`, `ShimuraCompactifications:C5/neat-strata-detect-geometric-components`, `ShimuraCompactifications:C5/nonneat-boundary-descent`, `ShimuraCompactifications:C5/hodge-semiampleness`, `ShimuraCompactifications:C5/graded-section-finite-generation`, `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C5/normalized-koecher`, `ShimuraCompactifications:C5/siegel-koecher-arbitrary-coefficients`, `ShimuraCompactifications:C5/ordinary-koecher`, `ShimuraCompactifications:C5/formal-hilbert-siegel-koecher`, `ShimuraCompactifications:C5/siegel-canonical-bundle`, `ShimuraCompactifications:C5/projective-normalized-blowup`.
- **`SchemeAndStackFoundations:SF.3`**: Relative formal schemes and projective formal algebraization/effectivity over a complete Noetherian normal base; compatible completions and normalized finite chart comparison; Proj of the finite section algebra and ample line descent. Generic coherent duality/Proj infrastructure remains owned here, while the Shimura instance is in C5. Needed by `ShimuraCompactifications:C1/boundary-torsor-tower`, `ShimuraCompactifications:C2/projective-algebraization`, `ShimuraCompactifications:C4/mumford-quotient`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/formal-universal-degeneration`, `ShimuraCompactifications:C5/good-algebraic-model`, `ShimuraCompactifications:C5/formal-completion`, `ShimuraCompactifications:C5/graded-section-finite-generation`, `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C5/minimal-hodge-ampleness`, `ShimuraCompactifications:C5/open-quasiprojectivity`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraCompactifications:C5/normalized-chart-finiteness`, `ShimuraCompactifications:C5/etale-chart-relation`, `ShimuraCompactifications:C5/projective-normalized-blowup`.
- **`ShimuraData:D3`**: Existing polarizable Shimura variation and boundary representation input with the supplied Hodge carrier, not an assumed universal abelian scheme. Needed by `ShimuraCompactifications:C1/mixed-boundary-datum`.
- **`ShimuraData:D4`**: D4 supplies the AMBIENT pure Shimura datum and its algebraic morphisms (D4/shimura-datum and D4/datum-morphism). Its inspected nodes do not supply the rational boundary or mixed boundary datum: import the former from V2/rational-boundary and the parabolic/unipotent/Lie structure from ReductiveGroups Layer 7; C1 constructs the latter. Needed by `ShimuraCompactifications:C1/mixed-boundary-datum`.
- **`ShimuraVarieties:V8`**: Actual pure canonical tower/model for the datum and reflex field; C2 additionally needs the special mixed-boundary torus/abelian-torsor canonical models and dense special points of Pink 12.13–12.17. Pure canonical models alone do not canonically descend arbitrary mixed spaces. Needed by `ShimuraCompactifications:C2/canonical-toroidal-model`, `ShimuraCompactifications:C3/level-datum-functoriality`.
- **`tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier`**: The unchanged common cone/lattice/dual-monoid/regular-basis vocabulary, finite complex affine anchor, intrinsic dual-monoid equivalence for a regular cone and integral face-localization P_tau=P_sigma+N(-m). C0 adds arbitrary coefficient rings/torsors and arithmetic infinite cone collections; no second finite fan or cone definition. Checkpoint interface retained: Use the existing lattice/cone, primitive-ray, regular-basis, dual-monoid and finite-complex toric vocabulary. Require the intrinsic additive dual-monoid equivalence for a regular cone, and the integral supporting-character/face-localization identity P_tau=P_sigma+N(-m). The C0 extension changes the coefficient base and descends actual torus-torsor algebras; it does not define a second cone, lattice, finite fan or dual monoid. The arithmetic fan is not the finite Fan carrier, and admissible-refinement existence remains additional C0 work. Needed by `ShimuraCompactifications:C0/relative-torus-embedding`, `ShimuraCompactifications:C0/relative-face-open`, `ShimuraCompactifications:C0/relative-regular-coordinates`, `ShimuraCompactifications:C0/relative-stratum-quotient`, `ShimuraCompactifications:C0/arithmetic-admissible-fan`, `ShimuraCompactifications:C0/compatible-common-refinement`, `ShimuraCompactifications:C0/smooth-projective-refinement`, `ShimuraCompactifications:C0/arbitrary-ring-toric-charts`, `ShimuraCompactifications:C1/boundary-incidence`, `ShimuraCompactifications:C2/partial-boundary-charts`, `ShimuraCompactifications:C2.general/general-toroidal-descent`, `ShimuraCompactifications:C3/refinement-map`, `ShimuraCompactifications:C3.general/general-map-descent`.
- **`tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-2-affine-analytic-charts-of-regular-cones`**: Finite regular complex analytic affine toric charts and monomial face maps. Singular/nonreduced relative boundary instances additionally require the analytic-carrier supplier and separate chart extension, not an inferred manifold chart. Needed by `ShimuraCompactifications:C2/partial-boundary-charts`, `ShimuraCompactifications:C2.general/general-toroidal-descent`, `ShimuraCompactifications:C3.general/general-map-descent`.
- **`tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-3-finite-fan-analytic-gluing`**: Finite complex fan gluing and its actual overlap cocycle; C2 adds arithmetic quotient gluing of these local charts, not another finite toric gluing theory. Needed by `ShimuraCompactifications:C2/partial-boundary-charts`, `ShimuraCompactifications:C2/quotient-separation`, `ShimuraCompactifications:C2/arithmetic-gluing`, `ShimuraCompactifications:C2.general/general-toroidal-descent`, `ShimuraCompactifications:C3/refinement-map`, `ShimuraCompactifications:C3.general/general-map-descent`.
- **`tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-4-torus-actions-strata-and-the-boundary`**: The finite regular complex torus actions, orbit strata and boundary comparison. C0/C2 use this as the complex specialization anchor; relative integral charts and finite arithmetic quotient strata retain their additional descent hypotheses. Checkpoint interface retained: Retain the finite regular complex orbit/coordinate-boundary comparison as a specialization anchor. Compare the new relative integral formulas after the specified trivialization and extension to C. This complex theorem alone is not the arithmetic quotient or geometric-fiber theorem. Needed by `ShimuraCompactifications:C2/partial-boundary-charts`, `ShimuraCompactifications:C2/smooth-normal-crossings`, `ShimuraCompactifications:C2.general/general-toroidal-descent`, `ShimuraCompactifications:C3/refinement-map`, `ShimuraCompactifications:C3.general/general-map-descent`.
- **`tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-5-toric-maps-and-properness`**: Finite regular complex toric maps and support-properness/refinement comparison. C0/C3 extend to arbitrary coefficients and arithmetic quotients; integral PEL properness still uses degeneration and the valuative construction. Checkpoint interface retained: Retain the RS-32 finite regular complex support-properness and refinement-map supplier for C0/C3. The actual integral properness input in C5 comes from its degeneration/valuative construction, not from this special case. Needed by `ShimuraCompactifications:C0/relative-fan-properness`, `ShimuraCompactifications:C3/refinement-map`, `ShimuraCompactifications:C3/level-datum-functoriality`, `ShimuraCompactifications:C3/toric-structure-sheaf-vanishing`, `ShimuraCompactifications:C3.general/general-map-descent`.
- **`tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne`**: Existing native mixed Hodge carrier, strict morphisms, induced graded filtration and tensor/representation compatibility. C1 constructs boundary instances through h1 and preserves the supplied F; no second generic mixed Hodge structure. Needed by `ShimuraCompactifications:C1/mixed-boundary-datum`, `ShimuraCompactifications:C1/boundary-mixed-hodge-structure`.
- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`**: Existing parabolic/unipotent/centralizer Lie and rational quotient-group structure needed for the mixed boundary group and its arithmetic action; C1 only enriches the existing rational boundary datum. Needed by `ShimuraCompactifications:C0/arithmetic-admissible-fan`, `ShimuraCompactifications:C1/mixed-boundary-datum`, `ShimuraCompactifications:C1/arithmetic-stabilizer`, `ShimuraCompactifications:C1/boundary-incidence`.
- **`AdicSpacesPartII:F0/formal-direct-image-comparison`**: For the ACTUAL BCGP normal formal toroidal-to-minimal contraction, transfer O_min≅pi_*O_tor through proper completion and the specified normalized/ordinary restriction. Check the F0 node's proper locally-Noetherian SCHEME hypotheses, extend to algebraic spaces only through a separately supplied comparison, and establish any special-fibre transfer rather than using generic normality. Supply the projection formula for its specified invertible sheaf. This is not a fan-refinement morphism. Needed by `ShimuraCompactifications:C5/formal-hilbert-siegel-koecher`.
- **`PELModuli:M4`**: Beyond the inspected good-prime higher-level-normalization node, provide Lan 2017 reference [18] Proposition 6.1 ramified p-integral normalized interior with its indexed lattice families and Proposition 6.4 projective normal minimal model over Spec O_(F0,(p)), for H with neat H^p and the exact Section 2 lattice collection. No moduli interpretation at parahoric level is assumed. The wider input is presently absent and is recorded as a gap. Needed by `ShimuraCompactifications:C5/projective-normalized-blowup`.

## Explicit gaps

### Native geometric signatures and supplier carrier interfaces

Seven coefficient-algebra nodes have full typed signatures. Added native affine coefficient-change and local arithmetic-fan/refinement components, with explicit action, orbit representatives, compact-intersection predicates and finite-overlap hypothesis. These local components do not provide global cusp/adelic restrictions. The 83 remaining full node signatures still require the actual anchor dual-monoid/gluing or torsor, mixed-boundary, analytic, formal, algebraic-space and cohomology supplier interfaces. ComplexComparisonPartII explicitly omits its analytic carrier at the pin; SF.1 has an algebraic-space prototype but no pinned import. Every full omitted contract is retained in the ledger. Replanning another owner or hiding missing geometry in an opaque proposition would violate the protocol.

Needed by `ShimuraCompactifications:C0`, `ShimuraCompactifications:C1`, `ShimuraCompactifications:C2`, `ShimuraCompactifications:C2.general`, `ShimuraCompactifications:C3`, `ShimuraCompactifications:C3.general`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`.

### Analytic carrier and nonreduced chart extension

Use ComplexComparisonPartII:C0/repair-analytification, which is a planned repair, not an existing analytic-space implementation. Require the nilpotent-preserving local analytic-space carrier, morphisms, gluing/products and actual scheme analytification. Its current infrastructure/PR196 integration remains unfinished. Extend regular finite anchor charts to singular/nonreduced charts through that same carrier.

Needed by `ShimuraCompactifications:C2/partial-boundary-charts`, `ShimuraCompactifications:C2/arithmetic-gluing`, `ShimuraCompactifications:C2/projective-algebraization`.

### Arithmetic reduction and controlled quotient neighbourhoods

Pink 6.19 and 6.22 use AMRT reduction/controlled Satake-neighbourhood input. Those proof passages were not read; AA.3/V2 must supply finite cusp indexing, effective stabilizer control and the stated separated quotient-neighbourhood theorem. Finite cone orbits alone do not prove separatedness or finiteness of stabilizers.

Needed by `ShimuraCompactifications:C1/arithmetic-stabilizer`, `ShimuraCompactifications:C2/quotient-separation`, `ShimuraCompactifications:C0/smooth-projective-refinement`.

### Special mixed canonical boundary models

Pink 12.13–12.17 constructing special mixed boundary canonical models and the special-point descent input were not read. The pure V8 model does not supply these models by itself. Request the torus/abelian-torsor boundary subclass as the explicit descent supplier; the C2/C2.general and C3.general outputs remain conditional on it.

Needed by `ShimuraCompactifications:C2/canonical-toroidal-model`, `ShimuraCompactifications:C2.general/general-toroidal-descent`, `ShimuraCompactifications:C3.general/general-map-descent`.

### Universal toric subdivision cohomology

Supply the integral monomial Cech/contractibility proof for structure sheaves and strictly boundary-positive degree ideals, including arbitrary coefficient base change and the derived boundary-ideal version. Lan 2017 Proposition 7.5 reduces to KKMS Corollary 2 p. 44, which was not read. A real-cone contractibility observation without the coefficient complex is insufficient.

Needed by `ShimuraCompactifications:C3/toric-structure-sheaf-vanishing`, `ShimuraCompactifications:C3/refinement-higher-structure-sheaf`, `ShimuraCompactifications:C3/refinement-boundary-ideal`.

### Relative effectivity construction proof leaves

Lan 4.4 equivalence and 4.5.2 projective quotient statements/proofs were read, but the earlier relatively complete model and theta construction lemmas were not read in full. Supply those precise lemmas, cubical descent and ample effectivity through the formal-scheme/abelian owners; do not infer essential surjectivity solely from an equivalence statement.

Needed by `ShimuraCompactifications:C4/mumford-quotient`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C4/formal-universal-degeneration`.

### Local Raynaud supplier ownership repair

The accepted RS-32 imports R11.3 into C4, but R11.3/raynaud-extension-comparison currently says its algebraic semi-abelian extension is supplied by early C4. Its recorded stage edge alone is not a closed independent carrier interface. Resolve the local construction and its exact statement in the Neron owner; C4 extends it to the relative complete normal-base/cusp setting.

Needed by `ShimuraCompactifications:C4/polarized-degeneration-data`, `ShimuraCompactifications:C4/degeneration-effectivity`, `ShimuraCompactifications:C5/valuative-properness`.

### Semi-abelian extension and quasi-finite flatness proof

Faltings–Chai I.2.7 and its proof, I.2.9–2.11 and the character-sheaf proof were inspected in the cleared copy on 10 October 2026. The remaining inputs are the actual semi-abelian/non-split-torus, constructible etale sheaf, Neron, torsion and graph/Stein/descent interfaces. The extra quasi-finite/flat group argument for the particular boundary isogeny and chapter V finite-flat cyclic level-group extension cited in Pilloni 2012 remain unread leaves. The Tate rank-loss example still excludes a finite-flat-kernel strengthening.

Needed by `ShimuraCompactifications:C4/constructible-character-sheaf`, `ShimuraCompactifications:C4/homomorphism-extension`, `ShimuraCompactifications:C4/extended-isogeny-kernel`, `ShimuraCompactifications:C5/prime-Q-subgroup-extension`.

### Good algebraic-model approximation

Lan 6.3.2.5–6.3.2.9 and 6.3.3.13–6.3.3.16 were read; the earlier approximation/versality lemmas in 6.3.1–6.3.2.4 and complete 6.3.2.10 proof were not. Supply their corrected etale finite-type hypotheses and keep i_nat/i_alg distinct.

Needed by `ShimuraCompactifications:C5/good-algebraic-model`, `ShimuraCompactifications:C5/etale-chart-relation`.

### Non-neat branch and geometric-component coverage

The neat five-target argument is retained. A non-neat transport requires actual relative branch normalization or a proper finite-level cover meeting every geometric component, its stratified descent and coarse-space restrictions. Stacks 41.21.6 is only an absolute scheme lead. Neatness alone does not establish a globally simple normal-crossings coarse boundary.

Needed by `ShimuraCompactifications:C5/nonneat-boundary-descent`.

### Hodge theta generation and minimal constant terms

Faltings–Chai V.2.1 and the Stein/section-ring construction in V.2.3 were read in the cleared copy. V.2.1 quotes Moret-Bailly IX.2.1; that proof and the direct theta construction in V.3 remain unread. Supply the PEL theta-generation input, graded finite-generation/Stein interfaces and B5 constant terms, keeping B5 downstream of early toroidal properness. Coarse Hodge Q-line descent still requires auxiliary level/stabilizer checks.

Needed by `ShimuraCompactifications:C5/hodge-semiampleness`, `ShimuraCompactifications:C5/graded-section-finite-generation`, `ShimuraCompactifications:C5/integral-minimal-space`, `ShimuraCompactifications:C5/minimal-hodge-ampleness`.

### Higher-level normalized chart proof and moduli identification

Lan 2017 Theorem 6.1(1)–(6) and its beginning were read, not the complete cited global normalization proof. Supply the exact finite chart/completion/lattice comparison. BPS items 34/36 apply to the normalization model; identifying it with the parahoric moduli model (item 35) belongs to the separate Part II and is not assumed here.

Needed by `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraCompactifications:C5/normalized-chart-finiteness`, `ShimuraCompactifications:C5/integral-coefficient-extension`.

### Integral coefficient and Koecher positivity proof

Provide B3/B4 normalized integral coefficient functors satisfying all of Lan 2017 Definition 8.5, and B5 positivity/finite-growth inputs in Propositions 8.3–8.4 plus Lan [17] Theorem 2.3 proof, not read in full. Theorem 8.7's simple-algebra and dimension-one exception are retained. Generic normal Hartogs does not prove torsion coefficient extension.

Needed by `ShimuraCompactifications:C5/normalized-koecher`, `ShimuraCompactifications:C5/siegel-koecher-arbitrary-coefficients`, `ShimuraCompactifications:C3/coherent-cohomology-invariance`.

### Ordinary and formal special-fibre extension

Pilloni 11.1.1 ordinary Koecher is asserted without a proof/reference; BCGP 8.2 uses a normal FORMAL model. Supply exact formal Hartogs, the normality/S2/codimension verification on those models and finite-thickening coefficient comparisons. Generic characteristic-zero Hartogs and H0 extension do not imply higher Koecher or all mod p conclusions.

Needed by `ShimuraCompactifications:C5/ordinary-koecher`, `ShimuraCompactifications:C5/formal-hilbert-siegel-koecher`, `ShimuraCompactifications:C3/partial-ordinary-formal-invariance`.

### Klingen first-projection acyclicity

Pilloni 13.2.1 recalls acyclicity without a reference. Determine and prove the actual boundary-chart factorization of the corrected compactified first projection, then use the toric vanishing and analytic coherent comparison. Properness of the correspondence alone does not imply vanishing.

Needed by `ShimuraCompactifications:C3/klingen-correspondence-acyclicity`.

### Etale good-reduction cohomology comparison

BCGP 2025 Theorem 1.8.29 proof uses Lan–Stroh Corollary 5.20 and duality, whose original proofs were not read. C5 supplies the good-prime smooth proper boundary geometry; the cohomology owner supplies nearby cycles/open comparison and duality. This is not a consequence of smoothness of the nonproper interior.

Needed by `ShimuraCompactifications:C5/good-boundary-cohomology-export`.

### Version-of-record and source collation boundary

Hashes and exact read sections identify every inspected PDF. Pink/Pilloni/Boxer–Pilloni/Yuan and arXiv BCGP texts were not collated against their publishers. Yuan's requested author copy refused connection; arXiv v4 is used with its own date. Supporting AMRT, KKMS, the uninspected Faltings–Chai passages and Lan [17]/Lan–Stroh original proofs remain the specific leaves above; no complete book reading or publisher-wide error claim is made. Selected Faltings–Chai I.2 and V.2 passages were read in the cleared reference copy for this revision; no complete-book reading is claimed.

Needed by `ShimuraCompactifications:C0`, `ShimuraCompactifications:C1`, `ShimuraCompactifications:C2`, `ShimuraCompactifications:C2.general`, `ShimuraCompactifications:C3`, `ShimuraCompactifications:C3.general`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`.

### Semi-abelian full Tate extension supplier interfaces

The Bresciani routed characteristic-zero target requires the existing abelian torsion/Tate construction and the actual compact/profinite full-versus-primewise inverse-limit exactness interface from A4/R02.1. Its current cochain and lim1 nodes do not alone provide exactness of the underlying torus-extension systems. The finite torsion proof is sketched explicitly and the missing generic interface is requested, not replaced by a private topological carrier.

Needed by `ShimuraCompactifications:C4/semiabelian-tate-module`.

### Actual formal minimal-contraction structure-sheaf comparison

C3/refinement-structure-sheaf concerns a fan subdivision and cannot prove O_formal-min≅pi_hat_*O_formal-tor. C5/integral-minimal-space records its algebraic Stein equality. To use it in BCGP 8.2, identify the source's normalized/ordinary formal contraction with that completed algebraic model and verify the proper formal-functions, projection-formula and special-fibre comparisons. These identifications remain requested; no generic-to-special transfer is inferred.

Needed by `ShimuraCompactifications:C5/formal-hilbert-siegel-koecher`.

### Normalized blow-up and finite normalization are distinct models

The good-prime SAME-fan finite normalization and Lan 2017's possibly ramified normalized blow-up of a minimal model use different inputs. Supply the exact comparison on their common locus, including changed lattices and formal torus-torsor charts. M4 currently supplies only the good-prime interior normalization; the ramified lattice-collection interior/minimal models of Lan [18] and the complete Sections 4–5 stabilization/completion proofs remain leaves for the newly added projective-normalized-blowup target. No general subdivision map is inferred finite.

Needed by `ShimuraCompactifications:C5/projective-normalized-blowup`, `ShimuraCompactifications:C5/higher-level-toroidal-normalization`, `ShimuraCompactifications:C5/normalized-chart-finiteness`, `ShimuraCompactifications:C5/integral-coefficient-extension`, `ShimuraCompactifications:C5/normalized-koecher`.

### Analytic algebraization beyond the inspected proper-scheme Hom theorem

ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity supplies only Hom comparison for proper complex schemes. The compact positive-line existence theorem and Pink algebraic-space algebraization/effective-descent extension still need the precise C2/C4 contracts now requested. They are not established merely by the existing proper-scheme morphism node.

Needed by `ShimuraCompactifications:C2/projective-algebraization`, `ShimuraCompactifications:C2/minimal-boundary-map`, `ShimuraCompactifications:C2/canonical-toroidal-model`.

## Structure and ownership proposals

- **split ShimuraCompactifications**: Keep all current ids. Separate the early C1 mixed group/stabilizer exports needed for C0 admissible fans from late C1 arithmetic cusp/cone labels; their declaration graph is acyclic though coarse whole-stage edges can hide a cycle. Propose C1.boundary-data and C1.labels modules without moving the rational boundary owner or changing scope ids.
- **split ShimuraCompactifications**: Early C5 toroidal charts/properness supply B3/B5 coefficient inputs; late C5 minimal/positivity uses B5 constant terms. Whole-stage reverse imports can hide a cycle. Keep C5 ids; propose early toroidal, normalized-level and late minimal/Koecher sublayers, with the listed declaration edges as the contracts.
- **extend ComplexComparisonPartII**: RT-AREA-algebraicgeometry/3 requires the complex analytic carrier before comparison. Current repair node plans it but integration remains unfinished. Place a first carrier/gluing/analytification layer before C0; it owns nonreduced analytic spaces and imports available ringed-space gluing. Record PR196 agreement and explicit outgoing consumers.
- **narrow AnalyticToricGeometryNonarchimedeanPartII**: RT-AREA-algebraicgeometry/34 duplicates the arbitrary-ring finite-fan toric scheme. Its first scheme target imports C0/arbitrary-ring-toric-charts and starts new work at formal completion/adic generic fibre/perfectoid geometry. The arithmetic introduction starts at coefficient/torsor/arithmetic quotient extension of the finite complex anchor.

- **RT-AREA-algebraicgeometry/3**: C2 consumes the actual ComplexComparisonPartII:C0/repair-analytification node, with its nilpotent-preserving carrier/gluing/representing functor request kept explicit. Propose a first carrier layer before its comparison C0 and retain agreement with PR196 if it merges. The other requested outgoing owner links to V2, M3 and R12.3 are outside this issue's editable paths.
- **RT-AREA-algebraicgeometry/27**: C1 has the exact HodgeStructures L2 stage prerequisite and two freshly checked native MHS baselines. The outgoing Hodge links to D1/D3, Selmer L4 and Abelian A5 remain a link-map owner action outside this packet.
- **RT-AREA-algebraicgeometry/34**: C0 owns the single uniform arbitrary-ring finite-fan scheme, including valuation rings. The proposed BKV Part II must start at formal completion/adic/perfectoid geometry and import this node. No second repository file was edited.
- **R11.3 local interface**: The accepted RS-32 direction is preserved but the current local Raynaud node verbally requires early C4. A local supplier ownership repair is requested before relative C4 consumes it; no global acyclicity is claimed from the packet-local check.
- **Current toric and relative-Spec library boundary, checked 2026-10-10**: At current Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, IsIntegralLattice.realCharacter and dualSemigroup, affineToricScheme, Fan.algebraicRealization/affineToricChartι and CategoryTheory.CommMon.relativeSpec/relativeSpecToBase/relativeSpecIsoSpec and the TauCeti.AlgebraicGeometry.relativeSpec functor are implemented. Their actual sources and current AnalyticToricGeometry/AlgebraicVectorBundles roadmaps were read. The finite complex supplier and relative Spec are imported work, not new targets. These modules are absent at the f790474 pin; they are not added as pinned baselines. Uniform arbitrary coefficients, actual torsor-weight subalgebras, arithmetic quotients and supplier comparisons remain the extension targets.

## Suggested-file boundary

The [Suggested file](../suggested/ShimuraCompactifications--C0.lean) elaborates with only proof-placeholder warnings in the shared pinned build. Seven complete node signatures, eleven complete API items and twelve complete packet tests are typed. Three additional nodes have local or affine components, with six local API specializations and five local test specializations. They do not count as complete global contracts. The 83 outstanding full node signatures, 102 other API items and 75 other packet tests remain enumerated in the ledger; the six local APIs and five local tests additionally need their global or explicit-instance contracts.

The analytic carrier is explicitly absent from the analytic supplier’s own prototype. The algebraic-space carrier is a separate foundations prototype, not a pinned import; it must not be substituted by a scheme. Current native toric gluing and relative Spec must be adopted through their existing owners. These concrete supplier boundaries block completion of the required full geometric file while preserving the no-duplication rule. The [revision handoff](../handoff/BP-ShimuraCompactifications--C0~2.md) lists the exact resume points.
