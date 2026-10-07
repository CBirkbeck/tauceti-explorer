# Hodge structures, Part II — H.3: General period manifolds and period-map derivatives

This is the definitive reader document for BP-HodgeStructuresPartII--H.3, issue #6941. It covers exactly **HodgeStructuresPartII:H.3**. The planning pass is complete; its coverage is **planned**, not closed or formalized. The packet has 43 nodes: 13 definitions/constructions, 13 promoted API lemmas and 17 theorem, comparison or application nodes. The constructions have 54 API items and 39 tests. Six planets name the principal objects. The five recorded gaps and twenty-three supplier requests are part of the plan, not completed library results.

## Starting point and ownership

Tau Ceti's upstream Hodge Structures roadmap already owns pure and mixed Hodge structures, their linear algebra, polarizations and period-domain **points**. In particular its L3 point carrier fixes the lattice, its abstract complexification, an integral pairing and all-integer Hodge type. H.3 gives that precise carrier its general period geometry and connects period-map derivatives with the already planned connection/Higgs operators. It does not create a second polarized Hodge point or variation carrier.

The pinned starting point is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The reviewed library audit was read for upstream Hodge L0–L3, ShimuraData D3 and R09.1. Statements and ambient hypotheses of the 28 cited baseline declarations were then read in the pinned source. Native Hodge decomposition, inverse-comap transport, bilinear isometry groups, Tate points and group-action orbit sets are reused. Mathlib's Grassmannian is a carrier/functor with **quotient rank**; its source explicitly lists charts and representability as future work. The audited point carrier has no general period-manifold atlas. Neither a name search nor an audit label is used as evidence that this geometry already exists.

The common real/rational variation, polarized integral variation, flat-bundle local description and transversality/tangent equivalence are imported from the exact ShimuraData D3 nodes. That supplier packet currently needs changes, so this is a mathematical interface contract, not a claim of an accepted formal implementation. H.2 owns geometric variations, canonical logarithmic extensions, de Rham comparisons and degeneration. R09.1 owns universal flags and Grassmannians, ComplexComparison Part II owns analytic/coherent comparison, and the generic Lie geometry is imported from the upstream Lie Groups/Reductive Groups roadmaps. The additional complex parabolic-quotient and exponential dictionary is recorded as a **Lie groups, Part II** extension proposal. No upstream roadmap is replanned or edited here.

H.4 consumes the trace derivative for rank estimates. H.6 consumes compact-dual and exponential coordinates for limits and supplies any limiting mixed complement. H.7 consumes the specified domain, component, tensor constraints and monodromy quotient for tame period maps. H.8 consumes each filtration-step connection symbol. None of those consumers is a prerequisite for constructing its H.3 input.

## Conventions that determine the statements

Fix a pure Hodge type h of weight n, with h(p) finite-supported on **all integers**, symmetric under p↦n−p. On a complex vector space W its filtration has dim F^p=Σ_{r≥p}h(r). The compact-dual orthogonality relation is Q(F^p,F^(n+1−p))=0. Opposedness is the separate complement relation between F^p and the conjugate of F^(n+1−p). The Hodge piece is F^p intersect the conjugate of F^(n−p).

A native polarization uses the strict inequality i^(2p−n)Q(x,conjugate x)>0 on every nonzero vector of that piece. There is no additional weight sign in the pinned predicate. Sources that normalize their bilinear form differently must be translated into this exact Q convention. Thus the rank-two alternating form Q(x,y)=x₁y₂−x₂y₁ is positive on the period line C(1,i), while the real line C(1,0) belongs only to the compact dual. Tate Z(m) has weight −2m and a filtration jump at −m, including positive m.

There are three distinct objects: the **full compact dual**, the **full ambient native period carrier**, and the **represented Mumford–Tate orbit** through a selected reference point. The ambient carrier can have several connected components. A connected real MT orbit is open in its own complex orbit; its inclusion in the full ambient domain can be proper and lower dimensional. A marked CM elliptic H¹ provides the essential counterexample: its represented torus has point orbits while the ambient component is an upper half-plane and the compact dual is P¹. Only the full-isometry specialization identifies an orbit with the chosen ambient component.

The Mumford–Tate group uses the full Deligne torus map, with its faithful representation retained. An adjoint group is not automatically a representation on V. In a fixed pure polarized datum its connected real action may be by positive similitudes; scalar normalization gives real Q-isometries with the same flag orbit. The weight scalar centre acts trivially on flags and is noncompact. Compact isotropy is asserted for the effective normalized isometry action, not for the full MT centralizer. For the represented Hodge cocharacter acting by z^(−p), the t→0 dynamic parabolic is P(μ inverse); its full subgroup stabilizes the filtration. Its quotient uses right cosets.

For the logarithmic curve specialization, keep a smooth proper connected curve family, smooth contractible analytic base, disjoint marked sections and a **unitary complex** local system. Its two-step cohomological Grassmannian map need not have an integral lattice or be a pure polarized period-domain map. If its F¹ has subspace rank s in rank r, the pinned Grassmannian index is r−s. The trace target is ω²(D), with a single divisor twist. For an arbitrary family the cotangent formula retains the deformation factor κ dual; equality of trace rank and period-derivative rank needs an injective deformation factor, for example an étale classifying map.

## Dependency structure

The point-to-flag adapter and real transport first reuse native Hodge data. Represented real and complex orbits then fix the actual representation and component. The Lie-Hodge filtration controls their tangent quotient, horizontal distribution and negative exponential coordinates. Generic quotient geometry and the complex inverse-function theorem supply the analytic atlas; positivity/opposedness supplies the ambient open subset. Imported holomorphic subbundles and flat markings produce the period map, and the quotient connection symbol calculates its derivative.

The curve branch imports H.2 logarithmic cohomology, defines the logarithmic connecting class, and computes the derivative by contraction. Compatible vector-bundle Serre duality identifies its adjoint with trace multiplication. The stable pointed moduli dictionary identifies κ dual with classifying-map cotangent pullback. The abelian branch separately checks the general marked period map against normalized weight-one matrices and supplied Riemann relations. Small construction identities used by other nodes have their own lemma nodes below.

## H.3.1 — Compact dual and native point transport

### Polarized compact-dual filtrations

Node `HodgeStructuresPartII:H.3/polarized-compact-dual` (definition). Planet: **Compact dual**.

Fix a finite-dimensional complex vector space W, a HodgeType h of weight n with total dimension dim W, and a nondegenerate (−1)^n-symmetric complex bilinear form Q. CompactDualFlag(h,Q) is the set of decreasing filtrations F indexed by all integers, with dim F^p=Σ_{r≥p}h(r), bounded by W and zero, and Q(F^p,F^{n+1−p})=0. It imposes neither opposedness nor positivity. Its topology, universal subbundles and analytic charts are inherited from the supplied finite flag parameter space. The full isometry group, including its components, is retained.

Proof or construction route:

1. Use finite support to select finitely many distinct ranks; repeat the corresponding universal subbundles at all integer indices.
2. Impose the nested-subspace and Q-orthogonality equations inside the supplied flag scheme. These are closed algebraic equations; construct the carrier as this subspace, not as a new general flag functor.
3. The tail-rank conditions force boundedness. Never impose effective Hodge indices.

Planning API (the shared namespace is `TauCeti.Hodge.PeriodGeometry`):

- `CompactDualFlag.F` — Return F^p as a complex submodule of W.
- `CompactDualFlag.ext` — Flags agree iff all their filtration steps agree.
- `CompactDualFlag.rank` — dim F^p=Σ_{r≥p}h(r), including p below and above the support.
- `CompactDualFlag.transport` — A Q-isometry e of W sends F^p to e(F^p); identity and composition commute with transport.
- `CompactDualFlag.grassmannian` — The p-th step is a point of Module.Grassmannian over C with quotient rank dim W−Σ_{r≥p}h(r), not subspace rank.

Discriminatory tests:

- `compactDual_tate` (computation) — For h the Tate type of Z(m) on W=C, its unique flag has F^p=W for p≤−m and F^p=0 for p>−m.
- `compactDual_zero` (degenerate) — On W=0 and h identically zero there is exactly one compact-dual flag.
- `compactDual_realLine` (non-example) — For weight one on C² with h(1)=h(0)=1 and the standard alternating form, the flag F¹=C(1,0) belongs to the compact dual although F¹ equals its conjugate and gives no period point.

Uses that determine the API:

- Schmid §3 (3.5), (3.19): supplies the domain of the universal filtration and the ambient analytic embedding.
- HodgeStructuresPartII:H.6 and H.7: permits holomorphic limits and exponential actions before positivity is restored.

Acceptance: The statement holds with all the specified ranks, coefficient fields and component choices.

Prerequisites: `tauceti:TauCeti.Hodge.HodgeType`, `mathlib:Module.Grassmannian`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3, pp.221–222, before (3.2). The polarized compact dual is cut out by the first bilinear relation; this is its all-integer carrier adapter.

### The existing point carrier in the compact dual

Node `HodgeStructuresPartII:H.3/point-compact-dual-map` (construction).

For the existing free finite integral lattice V, abstract complexification hC:V→W, fixed integral Qint and HodgeType h of weight n, toCompactDual sends an existing PeriodDomain.Point(hC,n,Qint,h) to its filtration in CompactDualFlag(h, integralFormBaseChange(hC,Qint)). It is injective. No new carrier of polarized Hodge structures is introduced.

Proof or construction route:

1. The pinned orthogonal field supplies the first bilinear relation.
2. Use the pinned decomposition of F^p into pieces of index at least p and prescribed Hodge numbers to obtain the tail ranks.
3. Use the pinned point extensionality after filtration extensionality.

Planning API (the shared namespace is `TauCeti.Hodge.PeriodGeometry`):

- `toCompactDual` — Construct the compact-dual flag of an existing period point.
- `toCompactDual_F` — Its p-th filtration is exactly point.hs.F p.
- `toCompactDual_injective` — Equality of image flags implies equality of the original points.

Discriminatory tests:

- `toCompactDual_tate` (computation) — The image of the existing tatePoint(m) has its jump at −m, with no restriction m≤0.
- `toCompactDual_fixedForm` (compatibility) — For any point the image annihilates F^p×F^{n+1−p} under precisely integralFormBaseChange(hC,Qint).
- `toCompactDual_separates` (characterisation) — Points whose filtration steps differ at some integer have different image flags.

Uses that determine the API:

- HodgeStructuresPartII:H.3 ambient-domain-open: transports the manifold structure to the exact existing carrier.
- ShimuraData:D3/polarized-integral-variation: identifies each marked fibre with its already supplied Hodge point.

Acceptance: The statement holds with all the specified ranks, coefficient fields and component choices.

Prerequisites: `HodgeStructuresPartII:H.3/polarized-compact-dual`, `tauceti:TauCeti.Hodge.PeriodDomain.Point`, `tauceti:TauCeti.Hodge.PeriodDomain.Point.ext`, `tauceti:TauCeti.Hodge.HodgeStructureOn.F_eq_iSup_piece`, `tauceti:TauCeti.Hodge.integralFormBaseChange`, `tauceti:TauCeti.Hodge.IsPolarization`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3, pp.221–222, compact-dual/domain correspondence. Extend the pinned point carrier by its filtration, rather than defining another Hodge structure.

### Faithful filtration inclusion

Node `HodgeStructuresPartII:H.3/point-compact-dual-injective` (lemma).

Equality of image flags implies equality of the original points.

Hypotheses: Retain all hypotheses and coefficient/component conventions of HodgeStructuresPartII:H.3/point-compact-dual-map.

Proof or construction route:

1. Equality of compact-dual flags gives equality of each filtration step.
2. Apply the existing HodgeStructureOn extensionality and PeriodDomain.Point.ext.

This is the promoted API statement `TauCeti.Hodge.PeriodGeometry.toCompactDual_injective`; its construction-level API and this lemma must be one declaration.

Acceptance: The API equality holds on the exact carrier of its construction, with the supplied generic realization where required.

Prerequisites: `HodgeStructuresPartII:H.3/point-compact-dual-map`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3, pp.221–222, compact-dual/domain correspondence. Extend the pinned point carrier by its filtration, rather than defining another Hodge structure.

### Real isometries acting on period points

Node `HodgeStructuresPartII:H.3/period-isometry-transport` (construction).

A complex linear automorphism e of W that commutes with the lattice-induced conjugation and preserves Q_C=integralFormBaseChange(hC,Qint) acts on existing period points by F^p↦e(F^p). This permits real Q-isometries without assuming they preserve the lattice. Preserve weight, Hodge numbers and the same fixed Qint. Lattice isometries give the integral specialization through existing scalar extension.

Proof or construction route:

1. Use the inverse of e in the pinned comap transport so the resulting filtration is the image e(F).
2. Transport each Hodge component, its dimension and Q-orthogonality. Conjugation compatibility transports positivity with the pinned factor i^(2p−n).
3. Check action laws on filtrations and apply pinned extensionality; extend an integral isometry via abstract base change.

Planning API (the shared namespace is `TauCeti.Hodge.PeriodGeometry`):

- `transportPoint` — From e, conjugation compatibility and Q_C-isometry, construct the transported native period point.
- `transportPoint_F` — The new F^p is the image of the original F^p under e.
- `transportPoint_one_comp` — Transport by identity fixes every point and transport by e∘f is transport by e after f.
- `transportPoint_compactDual` — The compact-dual map commutes with transport on the nose.

Discriminatory tests:

- `transportPoint_one` (degenerate) — Identity transport fixes a native period point.
- `transportPoint_inverse` (characterisation) — Transport by e followed by e inverse returns the original point.
- `transportPoint_tateMinus` (computation) — The real isometry −1 fixes the existing Tate point and preserves its jump at −m.

Uses that determine the API:

- Schmid (3.6), (3.25): forms real period orbits and expresses monodromy equivariance.
- HodgeStructuresPartII:H.7: supplies arithmetic actions without confusing them with complex representation actions.

Acceptance: The statement holds with all the specified ranks, coefficient fields and component choices.

Prerequisites: `HodgeStructuresPartII:H.3/point-compact-dual-map`, `tauceti:TauCeti.Hodge.HodgeStructureOn.comap`, `tauceti:TauCeti.Hodge.IsPolarization`, `tauceti:TauCeti.BilinForm.isometryGroup`, `tauceti:TauCeti.BilinForm.isometryGroupBaseChange`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3 (3.3)–(3.7), p.222. Real isometries act on the full domain, while lattice isometries supply monodromy.

### Point and compact-dual transport

Node `HodgeStructuresPartII:H.3/transport-compact-dual` (lemma).

The compact-dual map commutes with transport on the nose.

Hypotheses: Retain all hypotheses and coefficient/component conventions of HodgeStructuresPartII:H.3/period-isometry-transport.

Proof or construction route:

1. Both sides have p-th step e(F^p), by inverse-comap transport.
2. Use compact-dual extensionality. This is the exact native inclusion compatibility used by the orbit construction.

This is the promoted API statement `TauCeti.Hodge.PeriodGeometry.transportPoint_compactDual`; its construction-level API and this lemma must be one declaration.

Acceptance: The API equality holds on the exact carrier of its construction, with the supplied generic realization where required.

Prerequisites: `HodgeStructuresPartII:H.3/period-isometry-transport`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3 (3.3)–(3.7), p.222. Real isometries act on the full domain, while lattice isometries supply monodromy.

## H.3.2 — Represented orbits and Lie coordinates

### Represented Mumford–Tate period orbits

Node `HodgeStructuresPartII:H.3/represented-real-orbit` (definition). Planet: **Mumford–Tate domain**.

Take a polarizable rational pure Hodge structure with chosen lattice and reference point F0 in the native ambient domain. Import G=MT(V), its connectedness and reductivity, together with its faithful representation on V. Let H be the identity component of the real isometry image of G(R), equivalently the image of G(R)^+ after discarding scalar weight action. RealPeriodOrbit(H,F0) is the subtype {F in the existing ambient carrier | F=h·F0 for some h in H}. The representation and base orbit are part of the datum. Positive rational similitudes have the same filtration orbit: after a positive scalar rescaling they are real Q-isometries. G^ad may parameterize the orbit but is not assumed to act on V.

Proof or construction route:

1. Import the full Mumford–Tate group and representation, and normalize positive similitudes on the real connected component by scalar square roots.
2. Use transportPoint to form the image of the real identity component. Retain its inclusion in the ambient point carrier.
3. Two representatives give the same point iff their quotient stabilizes every filtration step; do not replace the image by all tensor-compatible ambient points.

Planning API (the shared namespace is `TauCeti.Hodge.PeriodGeometry`):

- `RealPeriodOrbit` — The real orbit subtype for a specified acting group and native reference point.
- `RealPeriodOrbit.mem_iff` — Membership means existence of a real-group representative sending F0 to F.
- `RealPeriodOrbit.base` — The reference point is in its orbit.
- `RealPeriodOrbit.rebase` — If F1=h·F0, the orbit subsets based at F1 and F0 coincide, with identity map on their ambient points.
- `RealPeriodOrbit.inclusion` — The inclusion is injective into the full existing ambient period carrier.

Discriminatory tests:

- `realOrbit_trivial` (degenerate) — A trivial acting group gives exactly the singleton {F0}.
- `realOrbit_baseChange` (compatibility) — Rebasing by h changes representatives by multiplication by h and preserves the ambient point of each orbit element.
- `realOrbit_CM` (non-example) — For a marked CM elliptic H¹ whose represented MT group centralizes its Hodge decomposition, the connected real period orbit is a singleton; the weight-one ambient component has all upper-half-plane period lines.

Uses that determine the API:

- BKT §1.3 p.920: distinguishes the Mumford–Tate domain from its full ambient period space.
- HodgeStructuresPartII:H.7 special pullbacks: requires an actual orbit/component, not an unnamed tensor locus.

Acceptance: The statement holds with all the specified ranks, coefficient fields and component choices.

Prerequisites: `HodgeStructuresPartII:H.3/period-isometry-transport`, `ShimuraData:D1/mumford-tate-group`, `ShimuraData:D1/mumford-tate-connected`, `ShimuraData:D1/mumford-tate-reductive`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`, `HodgeStructuresPartII:H.3/transport-compact-dual`.

Source: [PINK](https://www.math.ethz.ch/~pink/ftp/phd/Chapter_1.pdf), §§1.6–1.8, printed pp.12–14, pure specialization. The real filtration image has a canonical orbit manifold; retain the representation and selected component.

### The represented compact-dual orbit

Node `HodgeStructuresPartII:H.3/represented-complex-orbit` (construction).

For the same represented pure Mumford–Tate datum, ComplexPeriodOrbit is the image G(C)·F0 in the supplied full flag carrier. It is G(C)/P_F0 with right cosets, where P_F0 preserves all F0^p. A Q-similitude preserves the zero orthogonality equations, so this embeds in the polarized compact dual even when the group is not an isometry group. Its parabolic and projective manifold structures are imported from generic reductive/flag geometry. It need not be the full compact dual.

Proof or construction route:

1. For the represented Hodge cocharacter with action z^(−p), use its inverse for the t→0 dynamic-parabolic convention; identify its stabilizer on the filtration.
2. Use the supplied represented parabolic quotient and orbit-to-flag map. Faithfulness identifies the stabilizer, including its subgroup rather than just its Lie algebra.
3. The compactness and smoothness of G_C/P come from the generic parabolic-flag supplier, not from an assumed Hermitian symmetric domain.

Planning API (the shared namespace is `TauCeti.Hodge.PeriodGeometry`):

- `ComplexPeriodOrbit` — The subtype of flags in the complex represented orbit.
- `ComplexPeriodOrbit.mem_iff` — A flag is in the carrier iff it is g·F0 for some g∈G(C).
- `ComplexPeriodOrbit.rebase` — Rebasing by a complex representative identifies the orbit by identity on flags; identity and composition agree.
- `ComplexPeriodOrbit.inclusion` — Its inclusion into CompactDualFlag is injective and equivariant.

Discriminatory tests:

- `complexOrbit_trivial` (degenerate) — The trivial complex group gives a singleton compact-dual orbit.
- `complexOrbit_transitive` (characterisation) — When the supplied group action is transitive on the full compact-dual flag carrier, its orbit inclusion is surjective.
- `complexOrbit_CM` (non-example) — The complexified CM elliptic torus fixes the reference Hodge line; its orbit is a point inside the ambient P¹ compact dual.

Uses that determine the API:

- Pink 1.7: provides the complex orbit in which the real orbit is open.
- HodgeStructuresPartII:H.6: keeps the correct complex orbit when taking period limits.

Acceptance: The statement holds with all the specified ranks, coefficient fields and component choices.

Prerequisites: `HodgeStructuresPartII:H.3/polarized-compact-dual`, `HodgeStructuresPartII:H.3/represented-real-orbit`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat`.

Source: [PINK](https://www.math.ethz.ch/~pink/ftp/phd/Chapter_1.pdf), Proposition 1.7 proof, printed p.13, pure case. The faithful flag image factors through the complex homogeneous quotient; this is the period-specific image construction.

### Filtration on the represented period Lie algebra

Node `HodgeStructuresPartII:H.3/lie-hodge-filtration` (definition).

For the complex Lie algebra g of a represented group stable under the reference Hodge action, put F^a g={X∈g | X(F^p)⊆F^{p+a} for every integer p}. In the pure decomposition, g^{r,−r} consists of endomorphisms carrying H^{p,n−p} into H^{p+r,n−p−r}. Then F^a g=⊕_{r≥a}g^{r,−r}. Use the inherited commutator Lie bracket and the existing Hodge tensor/Hom decomposition; F⁰g is a Lie subalgebra, while F^a for arbitrary a is only a submodule.

Proof or construction route:

1. Take the intersections of the subspaces defined by each image containment.
2. Restrict the imported End-Hodge decomposition to the Hodge-stable Lie subalgebra; decompose its endomorphism blocks.
3. Composition adds filtration shifts, so the commutator has shift a+b. At a=0 this supplies the Lie-subalgebra structure without the Shimura SV1 restriction.

Planning API (the shared namespace is `TauCeti.Hodge.PeriodGeometry`):

- `lieFiltration` — The complex submodule F^a g with the specified image-containment property.
- `mem_lieFiltration` — Membership iff X maps F^p into F^{p+a} for every p.
- `lieFiltration_antitone` — a≤b implies F^b g⊆F^a g.
- `lieFiltration_bracket` — [F^a g,F^b g]⊆F^{a+b}g; in particular F⁰g is bracket-closed.

Discriminatory tests:

- `lieFiltration_one` (computation) — The identity endomorphism is in F⁰End(W), but on a nonzero single-jump filtration it is not in F¹End(W).
- `lieFiltration_zero` (degenerate) — For g=0 every filtration step is zero.
- `lieFiltration_lower` (computation) — For W=C² with F¹=C e1, F⁰=W and F²=0, the endomorphism e1↦e2, e2↦0 is in F^(−1)End(W) and not F⁰End(W).

Uses that determine the API:

- Schmid (3.18)–(3.22): identifies the tangent quotient and horizontal subbundle.
- HodgeStructuresPartII:H.8: supplies each filtration-step derivative without imposing a Hermitian type restriction.

Acceptance: The statement holds with all the specified ranks, coefficient fields and component choices.

Prerequisites: `HodgeStructuresPartII:H.3/polarized-compact-dual`, `tauceti:TauCeti.Hodge.HodgeStructureOn.piece`, `tauceti:TauCeti.Hodge.HodgeStructureOn.F_eq_iSup_piece`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `mathlib:Submodule.mkQ`, `tauceti:TauCeti.Hodge.HodgeStructureOn.internalHom`, `tauceti:TauCeti.Hodge.HodgeStructureOn.internalHom_piece`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3 (3.9)–(3.15), pp.223–224. Generalize the represented Lie filtration beyond adjoint types −1,0,1.

### Lie filtration bracket

Node `HodgeStructuresPartII:H.3/lie-filtration-bracket` (lemma).

[F^a g,F^b g]⊆F^{a+b}g; in particular F⁰g is bracket-closed.

Hypotheses: Retain all hypotheses and coefficient/component conventions of HodgeStructuresPartII:H.3/lie-hodge-filtration.

Proof or construction route:

1. For x∈F^p, Yx∈F^(p+b), then X(Yx)∈F^(p+a+b); do the same in reversed order.
2. Subtract the two terms. Lie-subalgebra bracket closure is inherited, not a new Lie-algebra definition.

This is the promoted API statement `TauCeti.Hodge.PeriodGeometry.lieFiltration_bracket`; its construction-level API and this lemma must be one declaration.

Acceptance: The API equality holds on the exact carrier of its construction, with the supplied generic realization where required.

Prerequisites: `HodgeStructuresPartII:H.3/lie-hodge-filtration`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3 (3.9)–(3.15), pp.223–224. Generalize the represented Lie filtration beyond adjoint types −1,0,1.

### Horizontal period tangent subspaces

Node `HodgeStructuresPartII:H.3/horizontal-subspace` (definition).

For a represented Hodge-stable Lie subalgebra g at a polarized compact-dual flag F, horizontalSubspace(F,g) is the image of F^(−1)g under g→g/F⁰g. Thus it is canonically F^(−1)g/F⁰g. At a pure point it is the grade (−1,1) summand. It is a subspace of the full negative tangent, not the whole tangent in general. Stabilizer-conjugation equivariance lets the tangent-horizontal theorem assemble these fibres into the horizontal holomorphic subbundle.

Proof or construction route:

1. Use the existing canonical linear quotient and map the submodule F^(−1)g into it.
2. Antitonicity gives F⁰g⊆F^(−1)g and hence the canonical subquotient description.
3. Conjugation by a represented filtration stabilizer preserves every filtration-shift condition and descends to the quotient.

Planning API (the shared namespace is `TauCeti.Hodge.PeriodGeometry`):

- `horizontalSubspace` — Return the image of lieFiltration(F,g,−1) in the quotient g/lieFiltration(F,g,0).
- `horizontalSubspace_mem` — A tangent class is horizontal iff it has a representative X carrying every F^p into F^(p−1).
- `horizontalSubspace_quotient` — The quotient F^(−1)g by its submodule induced from F⁰g is canonically linearly equivalent to horizontalSubspace(F,g), with the class map X↦[X].
- `horizontalSubspace_transport` — A represented linear Lie equivalence preserving F⁰ and F^(−1) induces a quotient equivalence carrying horizontalSubspace onto horizontalSubspace. Identity and composite transports agree.

Discriminatory tests:

- `horizontal_tate` (degenerate) — For a Tate flag all endomorphisms have Hodge degree zero, so the quotient tangent and horizontal subspace are zero.
- `horizontal_weightOne` (compatibility) — For the weight-one C² line flag and g=End(C²), F^(−1)g=g and the horizontal subspace is the whole one-dimensional quotient tangent; GL₂ is the similitude group of the alternating form.
- `horizontal_twoStep` (non-example) — For weight two with dimensions h(2)=h(0)=2,h(1)=1, choose basis e1,e2,e3,e4,e5, F²=span(e1,e2), F¹=span(e1,e2,e3), and Q(e1,e4)=Q(e2,e5)=−1,Q(e3,e3)=1. In the Q-skew Lie algebra, X(e1)=e5,X(e2)=−e4 and X(e3)=X(e4)=X(e5)=0 has grade −2. Its nonzero class in g/F⁰g is not horizontal.

Uses that determine the API:

- Schmid §3 (3.15), (3.18) and (3.19): defines the distinguished period tangent distribution and tests Griffiths transversality.
- HodgeStructuresPartII:H.6, H.7 and H.8: imposes horizontality on period derivatives without imposing it on all domain directions.

Acceptance: The statement holds with all the specified ranks, coefficient fields and component choices.

Prerequisites: `HodgeStructuresPartII:H.3/lie-hodge-filtration`, `mathlib:Submodule.mkQ`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3 (3.11)–(3.15) and Lemma (3.18), pp.223–226. Retains the full negative tangent quotient and singles out grade −1; no SV1 hypothesis is smuggled into a general period manifold.

### Horizontal tangent representatives

Node `HodgeStructuresPartII:H.3/horizontal-representative` (lemma).

A tangent class is horizontal iff it has a representative X carrying every F^p into F^(p−1).

Hypotheses: Retain the represented flag and Lie algebra hypotheses of the horizontal-subspace construction.

Proof or construction route:

1. Unfold the image under the quotient map: a class is in the image exactly when it has a representative in F^(−1)g.
2. Use the defining filtration-shift containment, with index p−1, for that representative.

This is the promoted API statement `TauCeti.Hodge.PeriodGeometry.horizontalSubspace_mem`; its construction-level API and this lemma must be one declaration.

Acceptance: The API equality holds on the exact carrier of its construction, with the supplied generic realization where required.

Prerequisites: `HodgeStructuresPartII:H.3/horizontal-subspace`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3 (3.11)–(3.15) and Lemma (3.18), pp.223–226. Retains the full negative tangent quotient and singles out grade −1; no SV1 hypothesis is smuggled into a general period manifold.

### Negative exponential period coordinates

Node `HodgeStructuresPartII:H.3/negative-exponential-map` (construction). Planet: **Exponential period coordinates**.

At a pure represented reference point choose q=⊕_{r<0}g^{r,−r}, a complex complement to F⁰g. NegativeOrbitMap(X)=exp(X)·F0 for X∈q, as a map to the represented compact-dual orbit. The exponential is the supplied complex Lie exponential, agreeing with the matrix exponential in the representation. At a general flag the same construction uses a specified complex linear complement to its stabilizer; the H.6 mixed/limiting splitting determines such a complement externally. Local invertibility is a separate theorem, not assumed in the map definition.

Proof or construction route:

1. Use the imported exponential and representation action, landing in the complex orbit by construction.
2. For the pure reference decomposition use q as the negative summand and q⊕F⁰g=g.
3. For a supplied different complement use the identical map; no canonical mixed splitting or monodromy data is selected here.

Planning API (the shared namespace is `TauCeti.Hodge.PeriodGeometry`):

- `negativeOrbitMap` — Form exp(X)·F0 on the supplied complement q.
- `negativeOrbitMap_zero` — The value at zero is F0.
- `negativeOrbitMap_F` — The p-th filtration is exp(X)(F0^p).
- `negativeOrbitMap_rebase` — For a represented complex group element g, transporting exp(X)·F0 gives exp(Ad(g)X)·gF0; the complement is transported as well.

Discriminatory tests:

- `negativeOrbit_zero` (degenerate) — Zero is mapped to the reference flag.
- `negativeOrbit_shear` (computation) — For F¹=C e1 and N(e1)=e2,N(e2)=0, exp(tN) sends F¹ to C(e1+t e2); this is not the line C(e1) for t≠0.
- `negativeOrbit_scalar` (compatibility) — For a Tate flag the negative Lie summand is zero, hence its exponential parameterization has just the reference flag in its image.

Uses that determine the API:

- HodgeStructuresPartII:H.3 local charts: constructs charts with derivative q→g/F⁰g.
- HodgeStructuresPartII:H.6 exponential corrections: accepts a chosen complement without duplicating limiting mixed Hodge theory.

Acceptance: The statement holds with all the specified ranks, coefficient fields and component choices.

Prerequisites: `HodgeStructuresPartII:H.3/represented-complex-orbit`, `HodgeStructuresPartII:H.3/lie-hodge-filtration`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-0-the-exponential-map-and-one-parameter-subgroups`, `mathlib:NormedSpace.exp`.

Source: [PINK](https://www.math.ethz.ch/~pink/ftp/phd/Chapter_1.pdf), Proposition 1.7 proof, p.13, tangent quotient; Schmid §3 (3.5). Exponential coordinates are the local inverse-function consequence of the homogeneous tangent quotient; the global map is not a chart on all q.

### Exponential action on filtration steps

Node `HodgeStructuresPartII:H.3/exponential-filtration` (lemma).

The p-th filtration is exp(X)(F0^p).

Hypotheses: Retain all hypotheses and coefficient/component conventions of HodgeStructuresPartII:H.3/negative-exponential-map.

Proof or construction route:

1. The represented action on the universal flag sends each step to its image under exp(X).
2. The supplied complex exponential agrees with the matrix exponential; quotient into the orbit subtype does not change its flag.

This is the promoted API statement `TauCeti.Hodge.PeriodGeometry.negativeOrbitMap_F`; its construction-level API and this lemma must be one declaration.

Acceptance: The API equality holds on the exact carrier of its construction, with the supplied generic realization where required.

Prerequisites: `HodgeStructuresPartII:H.3/negative-exponential-map`.

Source: [PINK](https://www.math.ethz.ch/~pink/ftp/phd/Chapter_1.pdf), Proposition 1.7 proof, p.13, tangent quotient; Schmid §3 (3.5). Exponential coordinates are the local inverse-function consequence of the homogeneous tangent quotient; the global map is not a chart on all q.

### Period tangents and horizontal subspaces

Node `HodgeStructuresPartII:H.3/tangent-horizontal` (theorem).

At F in a represented pure compact-dual orbit, T_F Dcheck≅g_C/F⁰g_C≅⊕_{r<0}g^{r,−r}. The horizontal holomorphic subbundle is F^(−1)g_C/F⁰g_C≅g^(−1,1); at every point it consists of the tangent classes represented by X with X(F^p)⊆F^{p−1} for all p. Under the full flag inclusion its derivative is the collection s↦X(s) mod F^p. Brackets have grade sum: [g^(−1,1),g^(−1,1)]⊆g^(−2,2), so horizontal integrability is not asserted in general.

Proof or construction route:

1. Apply the generic homogeneous-space tangent identification and identify the stabilizer Lie algebra by filtration preservation.
2. Use the pure Hodge negative complement and the membership formula defining F^(−1). Translate the subspace by the group action; the parabolic preserves the quotient subspace.
3. Differentiate the representation orbit map and compare each universal Grassmannian quotient. General graded commutators need not vanish.

Acceptance: For a one-step-lowering endomorphism the class is horizontal; an endomorphism lowering two nonzero filtration steps need not be horizontal. For weight-one symplectic periods the full tangent is horizontal. The Lie algebra need only be reductive, not simple; small orthogonal examples are retained.

Prerequisites: `HodgeStructuresPartII:H.3/lie-hodge-filtration`, `HodgeStructuresPartII:H.3/represented-complex-orbit`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat`, `HodgeStructuresPartII:H.3/lie-filtration-bracket`, `HodgeStructuresPartII:H.3/exponential-filtration`, `HodgeStructuresPartII:H.3/horizontal-subspace`, `HodgeStructuresPartII:H.3/horizontal-representative`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3 (3.11)–(3.15) and Lemma (3.18), pp.223–226. Retains the full negative tangent quotient and singles out grade −1; no SV1 hypothesis is smuggled into a general period manifold.

### Local biholomorphism of exponential coordinates

Node `HodgeStructuresPartII:H.3/negative-chart-local` (theorem).

For a specified complex linear complement q to F⁰g_C, negativeOrbitMap has derivative at zero the isomorphism q→g_C/F⁰g_C. There are open neighborhoods of zero and F0 on which it is a biholomorphism. Negative grading provides a canonical such complement at a pure reference point. Chart transitions between translates and complements are holomorphic; these charts are only local. No boundedness or global injectivity is asserted.

Proof or construction route:

1. The derivative of the imported complex Lie exponential at zero is the identity; the orbit-map derivative is the quotient projection.
2. The direct-sum complement makes this derivative invertible. Apply the complex holomorphic inverse-function theorem to obtain source and target neighborhoods.
3. Restrict chart intersections and compose holomorphic maps with local holomorphic inverses.

Acceptance: For N²=0 on C² the chart sends t to the line C(e1+t e2), with derivative the class of N. The zero-dimensional Tate orbit has the unique chart from the zero vector space. A limiting mixed flag uses a supplied complement; the limiting structure/splitting theorem belongs to H.6.

Prerequisites: `HodgeStructuresPartII:H.3/negative-exponential-map`, `HodgeStructuresPartII:H.3/tangent-horizontal`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-0-the-exponential-map-and-one-parameter-subgroups`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat`, `SeveralComplexVariablesKahlerGeometry:CV.1`, `HodgeStructuresPartII:H.3/exponential-filtration`.

Source: [PINK](https://www.math.ethz.ch/~pink/ftp/phd/Chapter_1.pdf), Proposition 1.7 proof, p.13, tangent map and open image. A local-chart consequence of the displayed tangent map; the inverse-function input is supplied, not hidden in the map definition.

## H.3.3 — General period manifolds and period maps

### The full ambient period manifold

Node `HodgeStructuresPartII:H.3/ambient-domain-open` (theorem). Planet: **Period domain**.

For a nonempty native period carrier with fixed (V,Qint,h), its toCompactDual image is exactly the set of compact-dual flags that are n-opposed to lattice conjugation and satisfy the pinned strict Hodge–Riemann inequalities i^(2p−n)Q_C(x,conj x)>0 on each nonzero Hodge piece. This subset is open in the complex analytic topology and gives the entire native carrier a complex manifold structure, with possibly several connected components. The compact-dual carrier is smooth projective, and the full real Q-isometry group acts transitively on the full native domain; its identity component acts transitively on each chosen connected component. Stabilizers are compact; they need not be maximal compact.

Proof or construction route:

1. The point-to-flag map and native fields identify the positive opposed subset exactly.
2. Use flag graph coordinates: opposedness is invertibility of a finite block determinant; strict positive-definiteness of each restricted Hermitian matrix is open. This proves openness, including the empty-domain case without inventing a basepoint.
3. Use polarization-orthogonal Hodge-adapted real bases to transport any two points by a real isometry. Retain the components of the full orthogonal group when necessary.
4. Transport the inherited complex manifold structure to the native point carrier. A stabilizer preserves the positive Hodge Hermitian form and is closed, hence compact.

Acceptance: For type (1,0)+(0,1) on a polarized rank-two lattice, one chosen component is the upper half-plane; the compact dual also contains real and opposite-sign lines. On a Tate line the domain is one point and a zero-dimensional complex manifold. Types whose dimensions do not sum to the rank have no native points.

Prerequisites: `HodgeStructuresPartII:H.3/point-compact-dual-map`, `HodgeStructuresPartII:H.3/period-isometry-transport`, `HodgeStructuresPartII:H.3/negative-chart-local`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `ComplexComparisonPartII:C0`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat`, `HodgeStructuresPartII:H.3/point-compact-dual-injective`, `HodgeStructuresPartII:H.3/transport-compact-dual`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3 pp.221–223, (3.2)–(3.8). The full-isometry homogeneous construction supplies the ambient manifold, without a Mumford–Tate restriction.

### Mumford–Tate orbit manifolds

Node `HodgeStructuresPartII:H.3/mt-orbit-open` (theorem).

For the represented polarizable pure datum, RealPeriodOrbit is a connected complex manifold open in its own represented ComplexPeriodOrbit, and its inclusion into the full ambient domain is a holomorphic immersion and locally closed embedding. Its real homogeneous description is G(R)^+/Z_{G(R)^+}(h), with scalar centre acting trivially. This isotropy is compact only after quotienting the positive scalar centre, or on the normalized real isometry image. The full centralizer in MT(R) need not be compact. The complex-orbit tangent is g_C/F⁰g_C. These assertions are independent, by canonical isomorphism, of the faithful representation used to realize the same Hodge datum.

Proof or construction route:

1. Use Pink 1.8 in the pure case to identify the real filtration stabilizer with the Hodge centralizer.
2. The Lie algebra is a pure weight-zero Hodge structure. The real tangent map g_R/(g_R∩F⁰g_C)→g_C/F⁰g_C is surjective as a real map because g_C=g_R+F⁰g_C by conjugate negative/positive dimensions.
3. Apply the imported local submersion theorem, so the real orbit is open in the complex flag orbit. The complex flag orbit is closed in the full flag variety; restrict to the ambient positive domain.
4. Use faithful representation comparison in Pink 1.7(b),(c); do not infer that the ambient domain is this orbit.

Acceptance: The CM elliptic domain and compact dual are both points; their inclusions into the ambient upper-half-plane component/P¹ are proper. For MT of a Tate line, the real scalar centre is noncompact but its filtration orbit and normalized isotropy are points.

Prerequisites: `HodgeStructuresPartII:H.3/represented-real-orbit`, `HodgeStructuresPartII:H.3/represented-complex-orbit`, `HodgeStructuresPartII:H.3/tangent-horizontal`, `HodgeStructuresPartII:H.3/negative-chart-local`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat`.

Source: [PINK](https://www.math.ethz.ch/~pink/ftp/phd/Chapter_1.pdf), Proposition 1.7(a)–(c), proof p.13; Lemma 1.8 pure-case proof p.14. The tangent-surjectivity proof and faithful-representation comparison are read in full.

### Tensor constraints on a specified orbit

Node `HodgeStructuresPartII:H.3/orbit-hodge-tensors` (theorem).

Import the Hodge tensor operations and a represented rational group G acting on them. If a rational tensor t in a finite tensor construction from V,V∨ and explicit Tate twists is fixed by G and is of type (0,0) at F0, then it is of type (0,0) at every flag in the chosen real G-orbit. Its period-symbol evaluation vanishes in normal directions that would violate t. Conversely a tensor-defined locus is identified with the orbit only after supplying its group-stabilizer theorem and selecting the required homogeneous component; no equality with the entire ambient domain is claimed. An untwisted type (p,p) tensor for p≠0 is not a type-(0,0) Hodge tensor.

Proof or construction route:

1. Transport tensor filtrations functorially under the faithful representation, using G-fixedness to leave t unchanged.
2. Use rationality and conjugation to transport the (0,0) piece, with Tate twists retained.
3. Differentiate the locally constant tensor condition. The converse would require a supplied exact stabilizer and component, so it is not asserted as an unconditional test.

Acceptance: A CM endomorphism remains a Hodge endomorphism along its singleton period orbit. Polarization is a Hodge tensor only after its indicated Tate normalization; a raw nonzero-weight form is not declared untwisted (0,0).

Prerequisites: `HodgeStructuresPartII:H.3/represented-real-orbit`, `HodgeStructuresPartII:H.3/period-symbol`, `ShimuraData:D1/mumford-tate-group`, `HodgeStructuresPartII:H.2`, `tauceti:TauCeti.Hodge.HodgeStructureOn.tensorProduct`, `tauceti:TauCeti.Hodge.HodgeStructureOn.dual`, `tauceti:TauCeti.Hodge.HodgeStructureOn.internalHom`, `tauceti:TauCeti.Hodge.HodgeStructureOn.internalHom_piece`.

Source: [K17](https://arxiv.org/pdf/1711.09387v1), §2.3, pp.7–8, rational Hodge tensors and Mumford–Tate groups. Carries fixed rational (0,0) tensors along the specified orbit; tensor-stabilizer theory belongs to the imported MT supplier.

### Ambient components and proper subdomains

Node `HodgeStructuresPartII:H.3/full-isometry-specialization` (comparison).

When the represented normalized acting group is the full identity component of the real Q-isometry group and its complex group is the corresponding full isometry group with the components needed for the selected flag orbit, RealPeriodOrbit(F0) identifies with the ambient connected component through F0. The full ambient carrier is the union of these orbits over representatives of its connected components. For a general MT subgroup only the orbit inclusion is supplied; it is not asserted surjective or open in the full ambient domain.

Proof or construction route:

1. Use full real-isometry transitivity and the componentwise identity-component transitivity in ambient-domain-open.
2. The orbit map has the same stabilizer and filtration, so use the injected native carrier, not a new isomorphic point record.
3. Show the failure in the CM rank-two example: its torus fixes F0 while the ambient component contains distinct period lines.

Acceptance: No claim that a chosen connected orbit equals a disconnected ambient carrier. The CM point is a proper zero-dimensional subdomain in the one-dimensional elliptic ambient domain.

Prerequisites: `HodgeStructuresPartII:H.3/ambient-domain-open`, `HodgeStructuresPartII:H.3/mt-orbit-open`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3 (3.4)–(3.6), p.222. The equality with the ambient component is confined to the full-isometry specialization.

### When the tautological filtration is a variation

Node `HodgeStructuresPartII:H.3/tautological-transversality` (theorem).

On a represented pure period orbit with constant underlying local system and its universal holomorphic filtration, Griffiths transversality holds in all tangent directions iff the adjoint Hodge grading has no grades r<−1, equivalently by reality no grades r>1. Thus the allowed adjoint types are {(-1,1),(0,0),(1,-1)}. In the general case the universal filtered bundle is not a VHS on the full domain; a map from a base is a VHS only when its derivative lies in the horizontal subbundle.

Proof or construction route:

1. The universal second fundamental form is X modulo F^p, by differentiating exp(tX)F.
2. Its values are horizontal for every tangent exactly when g/F⁰g=F^(−1)g/F⁰g.
3. Read the pure grading and use conjugation. The Shimura homogeneous variation is its restricted specialization, already owned by D3.

Acceptance: Weight-one Siegel domains pass the criterion. A nonzero grade −2 tangent fails universal transversality even though the filtration is holomorphic.

Prerequisites: `HodgeStructuresPartII:H.3/tangent-horizontal`, `ShimuraData:D3/variation`, `ShimuraData:D3/transversality-tangent`.

Source: [PINK](https://www.math.ethz.ch/~pink/ftp/phd/Chapter_1.pdf), Proposition 1.10 and full proof, p.15, pure specialization. The proof tests F^(−1)g=g and yields the pure three-type criterion.

### Marked fibrewise period maps

Node `HodgeStructuresPartII:H.3/marked-period-map` (construction). Planet: **Period map**.

For an imported polarized integral variation on a connected complex manifold B, restrict to a simply connected patch U with a flat marking of the lattice and parallel pairing to fixed (V,Qint). Let h be its locally constant Hodge type. markedPeriodMap sends b to the existing PeriodDomain.Point obtained by transporting its Hodge filtration with this marking. For a merely real or rational variation the same construction lands in the conjugation-parametric domain with fixed real or rational polarization; it does not choose an integral lattice. The point-valued construction does not itself assert holomorphicity.

Proof or construction route:

1. Import the common variation and flat marking, including the reference fibre complexification.
2. Assemble the native point using fibrewise opposedness, the same parallel form, constant type and existing Hodge carrier.
3. On overlapping markings the two point maps differ by the constant real isometry relating the markings.

Planning API (the shared namespace is `TauCeti.Hodge.PeriodGeometry`):

- `markedPeriodMap` — Build the point map from the marked native Hodge structures, fibre polarizations and fixed Hodge-number witnesses.
- `markedPeriodMap_F` — Its p-th filtration at b is precisely the marked F_b^p.
- `markedPeriodMap_changeMarking` — Changing a flat marking by a constant real Q-isometry e applies transportPoint(e) to the map.
- `markedPeriodMap_compactDual` — The compact-dual composite is the classifying flag map of the marked holomorphic filtration.

Discriminatory tests:

- `markedPeriod_constant` (degenerate) — A constant marked family is sent to a constant native point map.
- `markedPeriod_tate` (computation) — The constant family Z(m) maps to the existing tatePoint(m), including m>0.
- `markedPeriod_steps` (characterisation) — If two marked families have different F^p at one base point, their period maps differ there.

Uses that determine the API:

- BKT §1.3 and §4.2: supplies locally liftable period maps before nilpotent/definable arguments.
- Gao–Habegger §4: uses the marked H¹ flag before constructing holomorphic period matrices.

Acceptance: The statement holds with all the specified ranks, coefficient fields and component choices.

Prerequisites: `ShimuraData:D3/variation`, `ShimuraData:D3/polarized-integral-variation`, `ShimuraData:D3/flat-bundle-local`, `HodgeStructuresPartII:H.3/period-isometry-transport`, `tauceti:TauCeti.Hodge.PeriodDomain.Point`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3 pp.227–228, (3.23)–(3.27). The marked filtration defines the native point map; variation and local-system objects are imported.

### Change of flat marking

Node `HodgeStructuresPartII:H.3/change-marking` (lemma).

Changing a flat marking by a constant real Q-isometry e applies transportPoint(e) to the map.

Hypotheses: Retain all hypotheses and coefficient/component conventions of HodgeStructuresPartII:H.3/marked-period-map.

Proof or construction route:

1. Two flat lattice markings differ by a constant integral Q-isometry on a connected patch.
2. Its complexification changes every transported filtration step by that isometry. Use native point extensionality, and verify identity/composition through action laws.

This is the promoted API statement `TauCeti.Hodge.PeriodGeometry.markedPeriodMap_changeMarking`; its construction-level API and this lemma must be one declaration.

Acceptance: The API equality holds on the exact carrier of its construction, with the supplied generic realization where required.

Prerequisites: `HodgeStructuresPartII:H.3/marked-period-map`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3 pp.227–228, (3.23)–(3.27). The marked filtration defines the native point map; variation and local-system objects are imported.

### Holomorphic horizontal period maps

Node `HodgeStructuresPartII:H.3/period-map-holomorphic` (theorem).

For the imported polarized integral variation and a flat marking on a simply connected patch, markedPeriodMap is holomorphic into the full ambient period manifold and its derivative takes values in the horizontal subbundle. For an imported rational variation and a represented MT orbit, factorization into that orbit requires supplied flat Hodge tensors, constant generic datum and a chosen component; with this supplied factorization the induced orbit-valued map is holomorphic and horizontal. Local holomorphicity alone does not add an integral lattice.

Proof or construction route:

1. The universal flag map of the holomorphic Hodge subbundles is holomorphic by the supplied flag/Grassmannian dictionary.
2. Its values belong to the positive opposed image by the imported fibre polarizations; restricting to an open complex submanifold is holomorphic.
3. Apply the imported transversality-tangent equivalence and restrict to the represented Lie horizontal subspace when a factorization has been supplied.

Acceptance: A constant variation has zero period derivative. A merely holomorphic curve in a general flag domain need not be horizontal.

Prerequisites: `HodgeStructuresPartII:H.3/marked-period-map`, `HodgeStructuresPartII:H.3/ambient-domain-open`, `HodgeStructuresPartII:H.3/mt-orbit-open`, `HodgeStructuresPartII:H.3/tangent-horizontal`, `ShimuraData:D3/transversality-tangent`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), Corollary (3.22) and Theorem (3.27), pp.227–228. The complete local proof is the flag map plus the existing Griffiths-transversality condition.

### Monodromy equivariance and quotient descent

Node `HodgeStructuresPartII:H.3/monodromy-descent` (theorem).

For a connected base with universal cover and the imported polarized integral variation, the marked lift P satisfies P(γb)=ρ(γ)·P(b), with ρ valued in the existing integral Q-isometry group. It descends to B→Γ\D for any discrete subgroup Γ containing the monodromy image and preserving the chosen domain/component. With compact isotropy in the effective real isometry group, discrete Γ acts properly discontinuously. If its action is free (for instance effective torsion-free Γ), the quotient is a complex manifold and the descended map is holomorphic with horizontal local lifts. Without freeness retain an analytic orbifold/quotient space, not a manifold. The monodromy subgroup need not itself be a finite-index arithmetic lattice.

Proof or construction route:

1. Flat marking transported by a deck transformation changes by ρ(γ); apply the change-marking formula.
2. Use compact stabilizers and discreteness to prove proper discontinuity on the real homogeneous space.
3. Use the supplied free discrete quotient charts to descend local holomorphic lifts and their horizontal derivatives. Rational/complex variations do not produce integral arithmetic Γ without a separate lattice.

Acceptance: The identity deck transformation fixes P; product deck transformations match the monodromy product. Finite stabilizers are allowed only in the orbifold variant.

Prerequisites: `HodgeStructuresPartII:H.3/period-map-holomorphic`, `HodgeStructuresPartII:H.3/period-isometry-transport`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`, `ShimuraData:D3/polarized-integral-variation`, `ComplexComparisonPartII:C0`, `HodgeStructuresPartII:H.3/transport-compact-dual`, `HodgeStructuresPartII:H.3/change-marking`.

Source: [SCHMID](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), §3 (3.8), (3.23)–(3.27), pp.222–223 and 227–228. The quotient conclusion is kept at the proper level of freeness and arithmetic hypotheses.

## H.3.4 — Connection symbols and logarithmic curve derivatives

### The filtration-step period symbol

Node `HodgeStructuresPartII:H.3/period-symbol` (construction).

Let a local flat holomorphic trivialization of the imported bundle identify it with W. At b, choose a graph chart for the holomorphic subbundle F^p with fixed fibre S=F_b^p and quotient W/S. The differential defines periodSymbol_b^p:T_bB→Hom_C(S,W/S). Equivalently it sends (v,s) to the quotient of the first jet at b of any local holomorphic lift of s in F^p. For a supplied endomorphism jet J:T_bB→End_C(W), the symbol is q_S∘J(v) restricted to S. The symbol glues under changes of flat frame. The global connection equality is a separate theorem.

Proof or construction route:

1. Use the supplied Grassmannian graph tangent equivalence, noting the pinned quotient-rank convention.
2. At a graph origin differentiate the graph function and view its value in W/S; the derivative of a changed section differs by an element of S.
3. Use the chain rule for flat changes of coordinates. In the endomorphism-jet adapter take q_S∘J(v)∘incl_S, with genuine complex linear maps.

Planning API (the shared namespace is `TauCeti.Hodge.PeriodGeometry`):

- `periodSymbol` — For S⊆W and a C-linear lift jet J:T→Hom_C(S,W), return v↦q_S∘J(v). An endomorphism jet is restricted to S first.
- `periodSymbol_apply` — On v,s it evaluates to S.mkQ(J(v)(s)).
- `periodSymbol_frame` — Conjugating J and S by a constant complex automorphism transports the symbol by its induced quotient equivalence.
- `periodSymbol_kernel` — For each v, the symbol at v vanishes iff J(v)(s)∈S for every s∈S; hence the whole symbol is zero iff this holds for every v.
- `periodSymbol_liftCorrection` — Adding a C-linear lift-jet correction K:T→Hom_C(S,W) whose values lie in S does not change periodSymbol. This is the quotient calculation behind independence of a local lift.

Discriminatory tests:

- `periodSymbol_preserving` (characterisation) — If J preserves S for every tangent vector, the symbol is zero, including a nonzero scalar jet.
- `periodSymbol_zeroStep` (degenerate) — At S=0 or S=W the symbol is zero for every jet.
- `periodSymbol_shear` (computation) — At S=C e1 in C² and J(t)e1=t e2,J(t)e2=0, the value at t=1,e1 is the nonzero class of e2 in W/S.

Uses that determine the API:

- LL Lemma A.1.1: identifies quotient Gauss–Manin with the Grassmannian derivative.
- HodgeStructuresPartII:H.8: obtains the F²→F¹/F² derivative and its normal-boundary restriction.

Acceptance: The statement holds with all the specified ranks, coefficient fields and component choices.

Prerequisites: `HodgeStructuresPartII:H.3/marked-period-map`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `mathlib:Submodule.mkQ`, `mathlib:HasFDerivAt`, `mathlib:Submodule.Quotient.equiv`, `mathlib:LinearEquiv.submoduleMap`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), Lemma A.1.1 and proof, p.54. The derivative is the quotient jet of a local section, independent of the lift.

### Period symbols and lift frames

Node `HodgeStructuresPartII:H.3/period-symbol-frame` (lemma).

Conjugating J and S by a constant complex automorphism transports the symbol by its induced quotient equivalence.

Hypotheses: Retain all hypotheses and coefficient/component conventions of HodgeStructuresPartII:H.3/period-symbol.

Proof or construction route:

1. A constant complex linear equivalence carries S to e(S), its restricted jet to eJe inverse and its quotient through the native Submodule.Quotient.equiv.
2. Apply the quotient map to the conjugated jet and use its commuting square with e. Identity and composition follow from the native induced equivalences.

This is the promoted API statement `TauCeti.Hodge.PeriodGeometry.periodSymbol_frame`; its construction-level API and this lemma must be one declaration.

Acceptance: The API equality holds on the exact carrier of its construction, with the supplied generic realization where required.

Prerequisites: `HodgeStructuresPartII:H.3/period-symbol`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), Lemma A.1.1 and proof, p.54. The derivative is the quotient jet of a local section, independent of the lift.

### Independence of the lifted period jet

Node `HodgeStructuresPartII:H.3/period-symbol-lift-independence` (lemma).

Adding a C-linear lift-jet correction K:T→Hom_C(S,W) whose values lie in S does not change periodSymbol. This is the quotient calculation behind independence of a local lift.

Hypotheses: Retain all hypotheses and coefficient/component conventions of HodgeStructuresPartII:H.3/period-symbol.

Proof or construction route:

1. For every v,s the correction K(v)(s) lies in S.
2. The canonical quotient S.mkQ kills it, so quotient jets agree. Apply linear-map extensionality.

This is the promoted API statement `TauCeti.Hodge.PeriodGeometry.periodSymbol_liftCorrection`; its construction-level API and this lemma must be one declaration.

Acceptance: The API equality holds on the exact carrier of its construction, with the supplied generic realization where required.

Prerequisites: `HodgeStructuresPartII:H.3/period-symbol`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), Lemma A.1.1 and proof, p.54. The derivative is the quotient jet of a local section, independent of the lift.

### Period derivative as the connection symbol

Node `HodgeStructuresPartII:H.3/derivative-connection` (theorem).

For an imported variation and p∈Z, under the universal Grassmannian tangent identification, dP_b^p(v)(s)=∇_v(tilde s) mod F_b^p for any local holomorphic F^p-lift of s. The quotient of ∇ on F^p is O_B-linear because the Leibniz term s⊗df lies in F^p⊗Ω¹. For a Griffiths-transverse variation the value lies in F^{p−1}/F^p and depends only on s modulo F^{p+1}; this is precisely the existing H.0 graded-Higgs operator. The curried and uncurried derivative and its cotangent dual agree under the canonical Hom/tensor/dual identifications.

Proof or construction route:

1. In a flat trivialization the connection is ordinary differentiation, so the lift-jet definition of the tangent gives the formula.
2. For two lifts subtract a section vanishing at b; its derivative modulo F^p vanishes. The scalar derivative term of Leibniz is killed in the quotient.
3. Transversality on F^p and F^{p+1} gives the horizontal target and descent to the associated graded, exactly the parent H.0 construction.
4. Curry and dualize the same complex linear map, without inserting a sign.

Acceptance: A nonzero connection preserving F^p gives zero period derivative. For a weight-two variation the p=2 symbol lands in F¹/F², as needed by H.8.

Prerequisites: `HodgeStructuresPartII:H.3/period-symbol`, `ShimuraData:D3/flat-bundle-local`, `ShimuraData:D3/transversality-tangent`, `HodgeStructuresPartII:H.0/griffiths-filtration`, `HodgeStructuresPartII:H.0/graded-higgs`, `HodgeStructuresPartII:H.3/period-symbol-frame`, `HodgeStructuresPartII:H.3/period-symbol-lift-independence`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), Lemma A.1.1 with full proof p.54; §5.1 (5.3), p.29. The derivative is the quotient Gauss–Manin operator, with the source filtration and quotient target retained.

### Unitary logarithmic curve period specialization

Node `HodgeStructuresPartII:H.3/curve-hodge-filtration` (comparison).

For π:Cbar→B smooth proper connected curves over a smooth contractible complex analytic base, disjoint marked sections D, and a finite-rank unitary complex local system V on C°=Cbar−D, import its Deligne canonical extension (E,∇), relative logarithmic de Rham comparison and unitary Hodge-to-de Rham degeneration. Then H=(R¹π°_*V)⊗O_B, F¹H=π_*(E⊗ω_Cbar/B(D)), and H/F¹H=R¹π_*E are the imported locally free two-step data. A flat marking defines a holomorphic Grassmannian period map of subspace rank s=rank F¹ and total rank r, which uses the pinned Module.Grassmannian with quotient rank r−s. This complex two-step period map is not assumed to be a pure integral polarized-domain map.

Proof or construction route:

1. Import, without replanning, the canonical extension, logarithmic comparison, degeneration and cohomology/base-change identifications from H.2.
2. Use the contractible-base flat marking and the supplied Grassmannian classifying map for a holomorphic rank-s subbundle.
3. Convert the paper subspace-rank convention to the pinned quotient-rank convention; use the universal S and Q tangent Hom(S,Q).

Acceptance: For V=C and D empty the filtration is H⁰(ω_C)⊂H¹(C,C) with quotient H¹(O_C). Unitarity is not replaced by an arbitrary regular-singular connection. No lattice is inferred for a general unitary complex local system.

Prerequisites: `HodgeStructuresPartII:H.2`, `ShimuraData:D3/flat-bundle-local`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `HodgeStructuresPartII:H.3/period-symbol`, `mathlib:Module.Grassmannian`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), Notation 5.1.1 and §§5.1.2–5.1.5, pp.27–29, (5.1)–(5.3). All geometric, boundary and unitary hypotheses are retained; the common variation and canonical-extension constructions stay with H.2.

### Logarithmic curve Kodaira–Spencer map

Node `HodgeStructuresPartII:H.3/log-curve-kodaira-spencer` (construction).

For a smooth proper connected complex curve family π:Cbar→B over a smooth analytic base, with disjoint marked sections D and b∈B, define logCurveKS_b:T_bB→H¹(C_b,T_Cb(−D_b)) as the connecting homomorphism of 0→T_Cb(−D_b)→T_Cbar(−log D)|Cb→O_Cb⊗T_bB→0 after the canonical H⁰ identification. Smoothness, connected proper fibres and disjoint sections are retained. It is the curve-family adapter of the supplied coherent connecting map, not a second general deformation theory.

Proof or construction route:

1. Use the exact logarithmic tangent sequence dual to the smooth-family relative logarithmic cotangent sequence.
2. Apply the existing sheaf-cohomology connecting-map machinery, supplied for this analytic coefficient sequence.
3. H⁰(O_Cb)=C identifies the domain. For a smooth lifting v tangent to D, its barpartial class represents the connecting map; independence follows by changing v by a vertical field.

Planning API (the shared namespace is `TauCeti.Hodge.PeriodGeometry`):

- `logCurveKS` — Compose the supplied cohomology connecting map with T_bB≅H⁰(O_Cb⊗T_bB).
- `logCurveKS_boundary` — Its value is the connecting class of the constant tangent section.
- `logCurveKS_lift` — A smooth tangent-to-D lift v gives logCurveKS(u)=[barpartial v].
- `logCurveKS_baseChange` — Pullback of a smooth pointed family gives κ_new=κ_old∘d(base map), under the fibre cohomology identification.

Discriminatory tests:

- `logCurveKS_split` (degenerate) — For a product pointed family the logarithmic tangent sequence splits and κ=0.
- `logCurveKS_identityBase` (compatibility) — Pullback along the identity base map preserves κ and the marked divisor.
- `logCurveKS_verticalLift` (characterisation) — If a base vector has a holomorphic tangent-to-D lift, its connecting class is zero; changing any smooth lift by a vertical field changes barpartial v by an exact class.

Uses that determine the API:

- LL Proposition A.1.7: contracts first Hodge sections to calculate dP.
- HodgeStructuresPartII:H.4: distinguishes versal pointed families from constant families in rank arguments.

Acceptance: The statement holds with all the specified ranks, coefficient fields and component choices.

Prerequisites: `HodgeStructuresPartII:H.2`, `ComplexComparisonPartII:C0`, `mathlib:CategoryTheory.Sheaf.H`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), Definition A.1.5 and Remark A.1.6, p.56. Defines the exact logarithmic connecting map used in the derivative proof.

### Dolbeault logarithmic lift class

Node `HodgeStructuresPartII:H.3/log-kodaira-spencer-lift` (lemma).

A smooth tangent-to-D lift v gives logCurveKS(u)=[barpartial v].

Hypotheses: Retain all hypotheses and coefficient/component conventions of HodgeStructuresPartII:H.3/log-curve-kodaira-spencer.

Proof or construction route:

1. Use the supplied Dolbeault resolution and the logarithmic tangent exact sequence.
2. A smooth tangent-to-D lift v of u has barpartial v vertical and in T_C(−D). The connecting-map convention sends u to [barpartial v].
3. Two lifts differ by a vertical field; their representatives differ by a Dolbeault boundary.

This is the promoted API statement `TauCeti.Hodge.PeriodGeometry.logCurveKS_lift`; its construction-level API and this lemma must be one declaration.

Acceptance: The API equality holds on the exact carrier of its construction, with the supplied generic realization where required.

Prerequisites: `HodgeStructuresPartII:H.3/log-curve-kodaira-spencer`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), Definition A.1.5 and Remark A.1.6, p.56. Defines the exact logarithmic connecting map used in the derivative proof.

### Logarithmic Kodaira–Spencer pullback

Node `HodgeStructuresPartII:H.3/log-kodaira-spencer-base-change` (lemma).

Pullback of a smooth pointed family gives κ_new=κ_old∘d(base map), under the fibre cohomology identification.

Hypotheses: Retain all hypotheses and coefficient/component conventions of HodgeStructuresPartII:H.3/log-curve-kodaira-spencer.

Proof or construction route:

1. Pull back the logarithmic tangent exact sequence along a smooth analytic base map, with the divisor sections and relative tangent bundle identified.
2. Naturality of its connecting homomorphism gives κ_pullback(u)=κ_original(df(u)). Identity and composite pullbacks follow.

This is the promoted API statement `TauCeti.Hodge.PeriodGeometry.logCurveKS_baseChange`; its construction-level API and this lemma must be one declaration.

Acceptance: The API equality holds on the exact carrier of its construction, with the supplied generic realization where required.

Prerequisites: `HodgeStructuresPartII:H.3/log-curve-kodaira-spencer`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), Definition A.1.5 and Remark A.1.6, p.56. Defines the exact logarithmic connecting map used in the derivative proof.

### Gauss–Manin through logarithmic contraction

Node `HodgeStructuresPartII:H.3/gauss-manin-contraction` (theorem).

Under the curve-family hypotheses and supplied logarithmic smooth de Rham/Dolbeault resolutions, let σ be a smooth E-valued logarithmic one-form whose restriction to every fibre near b is closed. If u∈T_bB and v is a smooth lift along C_b tangent to D, then ∇GM([σ])_b(u) is the class of (ι_v d_tot σ)|Cb, where d_tot=∇+barpartial. Its class is independent of the lift and of exact changes of representative. Contraction occurs before restriction to the fibre.

Proof or construction route:

1. Use the supplied Ehresmann trivialization respecting disjoint sections and coefficients; write σ=Φ+Σdt_i ψ_i with Φ containing no base differentials.
2. Fibrewise closedness kills the purely vertical d_totΦ term. Contract d_totσ and restrict: the ψ_i correction is d_tot-exact, so it does not change the fibre cohomology class.
3. For another lift, the difference is vertical. Its contraction of the restricted closed fibre form is zero; exact representative changes give an exact correction by the contraction identity.

Acceptance: On a product family with a base-independent closed representative the Gauss–Manin derivative is zero. Restricting d_totσ before inserting the horizontal lift would erase base terms and is not the formula.

Prerequisites: `HodgeStructuresPartII:H.3/curve-hodge-filtration`, `HodgeStructuresPartII:H.2`, `SeveralComplexVariablesKahlerGeometry:CV.4`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), Lemma A.1.4 and full proof, p.55. The proof is the fibrewise-closed Ehresmann computation; smooth/log resolutions and trivialization are explicit supplier inputs.

### The curve derivative and Kodaira–Spencer

Node `HodgeStructuresPartII:H.3/curve-kodaira-spencer-derivative` (theorem).

Under the unitary logarithmic curve hypotheses, at b write C=C_b,D=D_b,E=E|C. For σ∈H⁰(C,Eω(D)) and u∈T_bB, the uncurried Grassmannian period derivative satisfies dP_b(u)(σ)=eval_*(κ_b(u) cup σ) in H¹(C,E), where κ_b is logCurveKS and eval contracts ω(D)⊗T_C(−D)→O_C. The sign is positive with κ=[barpartial v], d_tot=∇+barpartial and the source cup order specified; interchanging a degree-zero σ introduces no graded sign.

Proof or construction route:

1. Use the supplied locally free F¹=π*(Eω_rel(D)) and fibre cohomology/base-change isomorphism to extend σ to a local holomorphic section of F¹ near b. Evaluation gives a relative holomorphic E-valued logarithmic one-form on the family. The absolute-to-relative logarithmic one-form sequence is a surjection of holomorphic vector bundles; a smooth splitting gives an absolute C∞ logarithmic lift with precisely this relative restriction. It is fibrewise holomorphic and closed, since relative fibres have complex dimension one. This gives the lift needed by LL A.1.7 without using an unread logarithmic harmonic theorem.
2. By gauss-manin-contraction and the connection-symbol equality project to the (0,1) component; on a relative curve the vertical (2,0) part vanishes.
3. Apply barpartial(ι_v σ)=−ι_v barpartial σ+ι_barpartial(v)σ. The barpartial-exact term vanishes in cohomology.
4. The remaining class is contraction with [barpartial v]=κ(u); identify Dolbeault and sheaf cohomology.

Acceptance: A product pointed family has κ=0, hence dP=0 even if the trace pairing on global sections is nonzero. When D is empty and E=O_C this specializes to the usual infinitesimal curve period formula.

Prerequisites: `HodgeStructuresPartII:H.3/derivative-connection`, `HodgeStructuresPartII:H.3/log-curve-kodaira-spencer`, `HodgeStructuresPartII:H.3/gauss-manin-contraction`, `HodgeStructuresPartII:H.2`, `SeveralComplexVariablesKahlerGeometry:CV.4`, `HodgeStructuresPartII:H.3/log-kodaira-spencer-lift`, `ComplexComparisonPartII:C0`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), Proposition A.1.7 and complete proof, p.56. The complete A.1.7 cup/contraction proof is read. Its invoked harmonic-lift input is realized here from the explicit H.2 direct-image base-change identification plus a supplied smooth splitting of the logarithmic vector-bundle sequence; the source Voisin proof is not claimed read.

## H.3.5 — Trace pairing and cotangent factorization

### Trace multiplication for the curve period derivative

Node `HodgeStructuresPartII:H.3/trace-multiplication` (construction). Planet: **Trace pairing**.

For any holomorphic finite-rank vector bundle E on a smooth proper connected complex curve C and reduced divisor D, define B_E:(E⊗ω_C(D))×(E∨⊗ω_C)→ω_C²(D) by evaluation E⊗E∨→O_C, with the two line factors multiplied. Its induced global-section map μ_E:H⁰(Eω(D))⊗H⁰(E∨ω)→H⁰(ω²(D)) is trace after tensor product of sections. The sheaf pairing is perfect between these two mutually twisted dual bundles; neither nondegeneracy nor surjectivity of μ_E on global sections is asserted.

Proof or construction route:

1. Use the imported holomorphic bundle dual/evaluation and invertible ω(D),ω line factors.
2. In local dual frames evaluate Σ_i s_i t_i and multiply the line factors. Inverse frame transformations cancel, so the maps glue.
3. Apply global sections, tensor their sections into the sheaf tensor, then evaluate. Tensor products of global sections are not identified with all global sections of the tensor bundle.

Planning API (the shared namespace is `TauCeti.Hodge.PeriodGeometry`):

- `PeriodTrace.multiply` — Construct B_E and its global-section bilinear map μ_E.
- `PeriodTrace.eval` — In dual frames μ_E(s,t)=Σ_i s_i t_i, as a section of ω²(D).
- `PeriodTrace.frame` — Under E-frame change A and inverse-dual frame change, trace multiplication is invariant; identity and compositions agree.
- `PeriodTrace.rankOne` — For E=O_C the map is ordinary multiplication H⁰(ω(D))⊗H⁰(ω)→H⁰(ω²(D)).

Discriminatory tests:

- `periodTrace_rankTwo` (computation) — In a rank-two frame s=(1,2),t=(3,4) with unit line factors, B_E(s,t)=11.
- `periodTrace_zero` (degenerate) — For the rank-zero bundle μ_E is zero even when H⁰(ω²(D)) is nonzero.
- `periodTrace_divisor` (compatibility) — With local coordinate z at a reduced marked point, s=e⊗dz/z and t=e∨⊗dz evaluate to dz²/z, not dz²/z².

Uses that determine the API:

- LL Theorem 5.1.6: computes the cotangent of the Grassmannian period map.
- HodgeStructuresPartII:H.4 §5.2 bounds: takes the global bilinear pairing as input to rank estimates.

Acceptance: The statement holds with all the specified ranks, coefficient fields and component choices.

Prerequisites: `ComplexComparisonPartII:C0`, `ComplexComparisonPartII:C2`, `HodgeStructuresPartII:H.2`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), §5.2 equation (5.5), p.29; Lemma A.1.8, p.57. The derivative-specific trace multiplication has one marked-divisor twist, not two.

### Evaluation formula for trace multiplication

Node `HodgeStructuresPartII:H.3/trace-evaluation` (lemma).

In dual frames μ_E(s,t)=Σ_i s_i t_i, as a section of ω²(D).

Hypotheses: Retain all hypotheses and coefficient/component conventions of HodgeStructuresPartII:H.3/trace-multiplication.

Proof or construction route:

1. In local dual E-frames, evaluation pairs the i-th vector with the i-th dual vector.
2. Multiply the ω(D) and ω line factors, obtaining ω²(D), and sum the coefficient products.

This is the promoted API statement `TauCeti.Hodge.PeriodGeometry.PeriodTrace.eval`; its construction-level API and this lemma must be one declaration.

Acceptance: The API equality holds on the exact carrier of its construction, with the supplied generic realization where required.

Prerequisites: `HodgeStructuresPartII:H.3/trace-multiplication`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), §5.2 equation (5.5), p.29; Lemma A.1.8, p.57. The derivative-specific trace multiplication has one marked-divisor twist, not two.

### Trace multiplication under dual frames

Node `HodgeStructuresPartII:H.3/trace-frame` (lemma).

Under E-frame change A and inverse-dual frame change, trace multiplication is invariant; identity and compositions agree.

Hypotheses: Retain all hypotheses and coefficient/component conventions of HodgeStructuresPartII:H.3/trace-multiplication.

Proof or construction route:

1. An E-frame change A and the inverse-dual frame change pair by evaluation to the same scalar.
2. Tensor with both line factors and glue the local identities. Identity/composition compatibility is inherited from dual functoriality.

This is the promoted API statement `TauCeti.Hodge.PeriodGeometry.PeriodTrace.frame`; its construction-level API and this lemma must be one declaration.

Acceptance: The API equality holds on the exact carrier of its construction, with the supplied generic realization where required.

Prerequisites: `HodgeStructuresPartII:H.3/trace-multiplication`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), §5.2 equation (5.5), p.29; Lemma A.1.8, p.57. The derivative-specific trace multiplication has one marked-divisor twist, not two.

### Serre adjoint of the Kodaira–Spencer contraction

Node `HodgeStructuresPartII:H.3/serre-trace-adjoint` (theorem).

For a smooth proper connected complex curve C, reduced D and holomorphic vector bundle E, the cup-contraction map H¹(T_C(−D))⊗H⁰(Eω(D))→H¹(E) is adjoint to μ_E:H⁰(Eω(D))⊗H⁰(E∨ω)→H⁰(ω²(D)). Use Serre duality H¹(E)∨≅H⁰(E∨ω), H¹(T_C(−D))∨≅H⁰(ω²(D)) with the trace H¹(ω)→C and its cup/evaluation description. The statement is about vector bundles and proper curves, not arbitrary nonproper curves or only line-bundle duality.

Proof or construction route:

1. Import the natural vector-bundle Serre dualities and their analytic/coherent compatibility, including trace and cup-evaluation normalization.
2. Pair both sides with t∈H¹(T_C(−D)). The first yields tr((σ·β) cup t), the second tr(β cup(σ cup t)).
3. Use cup associativity, evaluation and degree-zero commutativity to identify the values; perfect duality gives equality of maps.

Acceptance: For E=O_C,D empty this is the adjointness of multiplication of canonical forms and the infinitesimal period derivative. The twist on the second section is ω, so the product twist is ω²(D).

Prerequisites: `HodgeStructuresPartII:H.3/trace-multiplication`, `SchemeAndStackFoundations:SF.2/serre-proper`, `ComplexComparisonPartII:C2`, `HodgeStructuresPartII:H.3/trace-evaluation`, `HodgeStructuresPartII:H.3/trace-frame`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), Lemma A.1.8 and full proof, p.57. The complete proof identifies both linear functionals by the same Serre trace, not by dimension alone.

### Trace formula for the period derivative

Node `HodgeStructuresPartII:H.3/trace-period-derivative` (theorem).

For the unitary logarithmic family, the cotangent period derivative is dP_b∨=κ_b∨∘μ_E under the stated vector-bundle Serre dualities: H⁰(Eω(D))⊗H⁰(E∨ω)→H⁰(ω²(D))→T_bB∨. Here κ_b∨ denotes the Serre identification followed by the linear dual of logCurveKS. If 2g−2+n>0 and a supplied analytic classifying map c:B→M_g,n with the universal deformation/cotangent dictionary is chosen, κ_b∨ is exactly c_b*:H⁰(ω²(D))→Ω¹_B,b, giving the factorization of Landesman–Litt Theorem 5.1.6. The derivative is adjoint to the quotient Gauss–Manin map.

Proof or construction route:

1. Apply the cup-contraction formula and its Serre adjoint, keeping the same tangent vector u and Hodge section σ.
2. Dualize κ and compose with μ_E. The connection adjointness is the derivative-connection theorem, not a separate unrelated map.
3. In the stable pointed classifying-map specialization use the supplied universal deformation identification to equate κ∨ with c*. The κ∨ factorization does not require a constructed global moduli space.

Acceptance: For a constant family c* and κ vanish, so dP∨=0 while μ_E may have positive rank. For E=O_C,D empty, the multiplication map factors through Sym² H⁰(ω_C).

Prerequisites: `HodgeStructuresPartII:H.3/curve-kodaira-spencer-derivative`, `HodgeStructuresPartII:H.3/serre-trace-adjoint`, `HodgeStructuresPartII:H.3/derivative-connection`, `StableReductionPartII:MC.2`, `ComplexComparisonPartII:C0`, `HodgeStructuresPartII:H.3/log-kodaira-spencer-base-change`, `StableReductionPartII:key/moduli-curves`, `StableReductionPartII:MC.0/universal-curve`, `StableReductionPartII:MC.2/pointed-dm-theorem`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), Theorem 5.1.6 p.29 and §A.2 full proof p.57. The two-step trace/cotangent factorization and its Gauss–Manin adjointness are the main derivative target.

### Rank of a derivative and its trace factorization

Node `HodgeStructuresPartII:H.3/trace-derivative-rank` (application).

In the finite-dimensional fibre spaces of the trace formula, rank dP_b=rank dP_b∨=rank(κ_b∨∘μ_E)≤rank μ_E. If the classifying map is étale at b, κ_b∨ is an isomorphism and equality rank dP_b=rank μ_E holds. More generally equality requires injectivity of κ_b∨ on im μ_E. The statement supplies the interface for H.4; it does not prove that every family is versal or any Clifford/rank bound.

Proof or construction route:

1. Use finite-dimensional linear duality to preserve rank and the factorization to compute the image.
2. An injective restriction of κ∨ to the trace image preserves its dimension; in the étale case use the universal cotangent isomorphism.
3. Pass these equalities as hypotheses to the consumer rank estimates without duplicating their arguments.

Acceptance: A product family provides strict inequality whenever μ_E is nonzero. The versal case recovers the trace rank used by H.4.

Prerequisites: `HodgeStructuresPartII:H.3/trace-period-derivative`.

Source: [LL](https://arxiv.org/pdf/2205.15352v4), §5.1.4–5.1.6 pp.28–29 and §6 use of Theorem 5.1.6, p.32. An elementary finite-dimensional consequence of the proven cotangent factorization, with the base-deformation factor retained.

## H.3.6 — Abelian period matrix comparison

### Normalized abelian period matrices

Node `HodgeStructuresPartII:H.3/abelian-normalized-periods` (construction).

For a principally polarized complex abelian scheme of relative dimension g on a simply connected patch, choose a symplectic integral marking and a holomorphic frame of relative one-forms. Write its integration period matrix Ω=[A B] and shrink so A is invertible. With row-form convention put τ=A^(−1)B. It is independent of a holomorphic change of one-form frame, depends on the symplectic marking, and records the weight-one period line/plane. The map to Siegel space, symmetry and Im(τ)>0 are subsequent comparison assertions; arbitrary polarization type is not silently made principal.

Proof or construction route:

1. Import the geometric H¹ variation and holomorphic invariant forms from H.2 and the polarized fibre Riemann relations from A5.
2. Integrate each local holomorphic form against the flat marked cycles to obtain Ω.
3. Use the invertible A-block to form τ; changes of one-form frame left-multiply both A and B and cancel in A inverse B.

Planning API (the shared namespace is `TauCeti.Hodge.PeriodGeometry`):

- `AbelianPeriod.normalize` — For square matrices A,B and an invertibility witness for A, return A inverse B.
- `AbelianPeriod.normalize_one` — Normalization of [I τ] is τ.
- `AbelianPeriod.frame` — An invertible left frame change C preserves normalization: (CA) inverse(CB)=A inverse B.
- `AbelianPeriod.graph` — The row plane of [A B] equals the row plane of [I τ]; its subspace rank is g and its pinned Grassmannian quotient rank is also g.

Discriminatory tests:

- `abelianPeriod_rankOne` (computation) — For g=1, A=1,B=i the normalized period is i.
- `abelianPeriod_scaled` (computation) — For g=1, A=2,B=2i normalization still gives i; taking B alone would fail.
- `abelianPeriod_zeroRank` (degenerate) — At g=0 the empty invertible block normalizes to the unique empty matrix.

Uses that determine the API:

- Gao–Habegger §4 local uniformization: provides local holomorphic periods without constructing the consumer Betti map.
- HodgeStructuresPartII:H.3 weight-one acceptance: checks the general period map against the familiar Siegel matrix chart.

Acceptance: The statement holds with all the specified ranks, coefficient fields and component choices.

Prerequisites: `HodgeStructuresPartII:H.3/marked-period-map`, `HodgeStructuresPartII:H.2`, `AbelianSchemesAndArithmeticModuli:A5`, `mathlib:Matrix.inv`.

Source: [GH](https://arxiv.org/pdf/1801.05762v3), §4, printed pp.15–17, especially the proof that Ω(s) is holomorphic on p.17. The local holomorphic integration argument supplies the abelian period-matrix adapter; normalization is the usual principal-polarization specialization.

### Normalized period graph plane

Node `HodgeStructuresPartII:H.3/abelian-period-graph` (lemma).

The row plane of [A B] equals the row plane of [I τ]; its subspace rank is g and its pinned Grassmannian quotient rank is also g.

Hypotheses: Retain all hypotheses and coefficient/component conventions of HodgeStructuresPartII:H.3/abelian-normalized-periods.

Proof or construction route:

1. Left multiplication by the invertible A inverse changes the row generators of [A B] to those of [I A inverse B].
2. The identity first block makes the graph projection an isomorphism onto C^g. Thus subspace dimension and quotient dimension in C^(2g) are both g.

This is the promoted API statement `TauCeti.Hodge.PeriodGeometry.AbelianPeriod.graph`; its construction-level API and this lemma must be one declaration.

Acceptance: The API equality holds on the exact carrier of its construction, with the supplied generic realization where required.

Prerequisites: `HodgeStructuresPartII:H.3/abelian-normalized-periods`.

Source: [GH](https://arxiv.org/pdf/1801.05762v3), §4, printed pp.15–17, especially the proof that Ω(s) is holomorphic on p.17. The local holomorphic integration argument supplies the abelian period-matrix adapter; normalization is the usual principal-polarization specialization.

### Weight-one period matrix comparison

Node `HodgeStructuresPartII:H.3/abelian-period-holomorphic` (comparison).

For the principally polarized abelian family and local symplectic marking, Ω and τ are holomorphic; τ is symmetric and Im τ positive definite, so the weight-one period map is the corresponding holomorphic map to Siegel upper half space. Its graph plane is the marked F¹ in the row-period convention. For a changed symplectic cycle marking M with blocks a,b,c,d acting on the right on [I τ], the new normalized matrix is (a+τc)^(−1)(b+τd). A left column-plane convention instead gives the familiar (aτ+b)(cτ+d)^(−1); these are not mixed. General polarization type retains its elementary-divisor matrix rather than being forced to this principal convention.

Proof or construction route:

1. Use the holomorphic marked F¹ subbundle and a holomorphic one-form frame. Its expansion in a fixed cohomology basis is holomorphic.
2. Integrate against flat cycles: the coefficients multiply fixed integrals, proving Ω holomorphic as in Gao–Habegger §4. Inverting the nonvanishing A-block preserves holomorphicity.
3. Import the polarized fibre Riemann relations to obtain symmetry and positivity, with the cohomology/cycle orientation and Q sign fixed.
4. Multiply [I τ] by the right-acting symplectic block matrix and normalize its first block; keep this row convention distinct from the column convention.

Acceptance: In rank two, A=1,B=i gives the upper-half-plane period i and a nonreal Hodge line. The constant abelian family has constant Ω and τ. Holomorphic local periods do not choose a global flat marking on a base with monodromy.

Prerequisites: `HodgeStructuresPartII:H.3/abelian-normalized-periods`, `HodgeStructuresPartII:H.3/period-map-holomorphic`, `AbelianSchemesAndArithmeticModuli:A5`, `HodgeStructuresPartII:H.2`, `HodgeStructuresPartII:H.3/abelian-period-graph`.

Source: [GH](https://arxiv.org/pdf/1801.05762v3), §4, printed pp.16–17, holomorphic Hodge planes and Ω computation. The local proof is read through (4.2); the general geometric variation and fibre Riemann relations are imported.

## Supplier contracts and closure

These are directed supplier→H.3 contracts. Reusing a supplied definition does not mean its future Lean interface is present. Exact external node references are checked by the packet validator; the broader stage requests below spell out their required extension. In particular real closed-subgroup theory does not automatically supply a complex holomorphic quotient, and generic stack construction does not automatically supply stable pointed curve deformation geometry.

- **`AbelianSchemesAndArithmeticModuli:A5`**: Supply local polarized analytic uniformization, flat integral symplectic cycle markings for principal polarization, holomorphic one-form frames and fibre Riemann bilinear relations identifying the normalized graph plane with the marked H¹ filtration. For other polarization types retain the elementary-divisor matrix.
- **`AlgebraicModuliForArithmeticGeometry:R09.1`**: Supply the finite all-integer-to-finite-rank flag parameter scheme with universal nested subbundles and closed bilinear isotropy loci, smooth projective polarized flags including orthogonal components; after analytification supply the universal Grassmannian tangent Hom(S,W/S), subbundle classifying-map holomorphicity and quotient-rank conversion. Reuse the existing Grassmannian functor; do not treat its carrier as an existing scheme/atlas.
- **`StableReductionPartII:MC.2`**: Import the existing pointed curve moduli carrier and the full stable-range Deligne–Mumford theorem from StableReductionPartII, then supply the analytic realization and natural deformation/cotangent dictionary for its smooth locus: T≅H¹(T_C(−D)), Ω¹≅H⁰(ω²(D)), universal logarithmic Kodaira–Spencer equal to identity, and κ_b∨ equal to cotangent pullback for a classifying map. MC.0/key and MC.2 already own M_g,n; do not reconstruct it at R09.4 or in H.3. The analytic and trace-normalized deformation realization is the remaining MC.2/C0/C2 interface gap.
- **`ComplexComparisonPartII:C0`**: Supply the complex-manifold/analytic-space and holomorphic vector-bundle dictionary for analytified smooth flag spaces, subbundles, duals, universal bundles, pullbacks, tangent/cotangent and open submanifolds. Also free properly discontinuous discrete quotient charts and the orbifold distinction. C0 currently supplies only conditional analytification repairs; this stronger analytic dictionary is an open interface, not a completed C0 theorem. For the smooth pointed family provide the actual exact sequence of locally free logarithmic one-form bundles from absolute to relative forms, its evaluation/restriction maps and the paracompact smooth realization.
- **`ComplexComparisonPartII:C2`**: Supply coherent analytic global sections and C-linear cohomology of vector bundles on smooth proper complex curves, GAGA compatibility with sheaf tensor/evaluation, cup products, connecting maps, Serre trace and duality. The additive Sheaf.H carrier alone does not supply this interface. For proper analytic curves either supply their algebraic realization before invoking projective GAGA, or provide analytic vector-bundle Serre duality directly; GAGA alone does not construct that realization.
- **`HodgeStructuresPartII:H.2`**: Supply geometric variations and their common D3 carrier, local flat marking/connection, flat tensor/Hom and Tate operations extending the existing native fibre operations; for a smooth proper pointed curve family and unitary complex local system supply the chosen Deligne extension, logarithmic de Rham/Dolbeault comparison, degeneration/base change F¹=π*(Eω(D)), quotient R¹π*E, and an Ehresmann trivialization respecting sections and coefficients. Require the actual fibre cohomology/base-change isomorphism for the locally free F¹ direct image and its evaluation map, so a fibre holomorphic section extends relatively near b. Combined with smooth splitting of the absolute-to-relative logarithmic one-form sequence this supplies the LL A.1.7 lift; no logarithmic adaptation of an unread harmonic theorem is assumed. Use exactly the Del70 Remarques 5.5(i)/LL Notation 5.1.1 extension and its parabolic zero-step normalization, not a freely shifted logarithmic lattice.
- **`SchemeAndStackFoundations:SF.2/serre-proper`**: Supply the existing planned proper derived Serre duality specialized to vector bundles on smooth proper complex curves, with the trace/cup/evaluation normalization; compose its analytic realization with C2. Line-bundle dimension formulas alone do not supply the required natural vector-bundle adjunction.
- **`SeveralComplexVariablesKahlerGeometry:CV.1`**: Supply the finite-dimensional complex holomorphic inverse/submersion theorem for the represented exponential/orbit derivative and holomorphic inverse/transition restrictions; require an actual derivative isomorphism, not a chosen local-inverse datum.
- **`SeveralComplexVariablesKahlerGeometry:CV.4`**: Supply smooth/Dolbeault E-valued forms, Lie/contraction operations and the identity barpartial(ι_v σ)=−ι_v barpartial σ+ι_barpartial(v)σ, compatible with sheaf cohomology. H.2 supplies the logarithmic relative extension, direct-image fibre/base-change identification and evaluation map. Supply smooth splitting of a surjection of complex vector bundles on a paracompact complex manifold, using a smooth Hermitian metric, including the locally free absolute-to-relative logarithmic one-form sequence supplied by H.2/C0.
- **`ShimuraData:D1/mumford-tate-connected`**: Import the exact mathematical interface of ShimuraData:D1/mumford-tate-connected from research/blueprint/packets/ShimuraData.json, without a second common variation or Mumford–Tate definition. That packet has review status needs_changes; its global signatures/readiness cannot be assumed implemented. D3 is used only for general variation/flat marking/transversality; its Shimura-specific compact dual and SV1 condition are not used to construct the general period manifold.
- **`ShimuraData:D1/mumford-tate-group`**: Import the exact mathematical interface of ShimuraData:D1/mumford-tate-group from research/blueprint/packets/ShimuraData.json, without a second common variation or Mumford–Tate definition. That packet has review status needs_changes; its global signatures/readiness cannot be assumed implemented. D3 is used only for general variation/flat marking/transversality; its Shimura-specific compact dual and SV1 condition are not used to construct the general period manifold.
- **`ShimuraData:D1/mumford-tate-reductive`**: Import the exact mathematical interface of ShimuraData:D1/mumford-tate-reductive from research/blueprint/packets/ShimuraData.json, without a second common variation or Mumford–Tate definition. That packet has review status needs_changes; its global signatures/readiness cannot be assumed implemented. D3 is used only for general variation/flat marking/transversality; its Shimura-specific compact dual and SV1 condition are not used to construct the general period manifold.
- **`ShimuraData:D3/flat-bundle-local`**: Import the exact mathematical interface of ShimuraData:D3/flat-bundle-local from research/blueprint/packets/ShimuraData.json, without a second common variation or Mumford–Tate definition. That packet has review status needs_changes; its global signatures/readiness cannot be assumed implemented. D3 is used only for general variation/flat marking/transversality; its Shimura-specific compact dual and SV1 condition are not used to construct the general period manifold.
- **`ShimuraData:D3/polarized-integral-variation`**: Import the exact mathematical interface of ShimuraData:D3/polarized-integral-variation from research/blueprint/packets/ShimuraData.json, without a second common variation or Mumford–Tate definition. That packet has review status needs_changes; its global signatures/readiness cannot be assumed implemented. D3 is used only for general variation/flat marking/transversality; its Shimura-specific compact dual and SV1 condition are not used to construct the general period manifold.
- **`ShimuraData:D3/transversality-tangent`**: Import the exact mathematical interface of ShimuraData:D3/transversality-tangent from research/blueprint/packets/ShimuraData.json, without a second common variation or Mumford–Tate definition. That packet has review status needs_changes; its global signatures/readiness cannot be assumed implemented. D3 is used only for general variation/flat marking/transversality; its Shimura-specific compact dual and SV1 condition are not used to construct the general period manifold.
- **`ShimuraData:D3/variation`**: Import the exact mathematical interface of ShimuraData:D3/variation from research/blueprint/packets/ShimuraData.json, without a second common variation or Mumford–Tate definition. That packet has review status needs_changes; its global signatures/readiness cannot be assumed implemented. D3 is used only for general variation/flat marking/transversality; its Shimura-specific compact dual and SV1 condition are not used to construct the general period manifold.
- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`**: Supply the represented Hodge-stable reductive Lie algebra and general cocharacter parabolic P(μ⁻¹), its Lie algebra F⁰g and filtration stabilizer subgroup, root/parabolic structure and the general parabolic flag quotient. Reuse upstream tori/Borels/parabolics; geometric/analytic quotient realization remains R09.1 and the LieGroups extension.
- **`tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-0-the-exponential-map-and-one-parameter-subgroups`**: Supply the complex Lie-group exponential compatible with the matrix representation, its derivative identity at zero, conjugation identity and local analytic behavior. The upstream real Lie exponential is reused. The genuinely complex holomorphic compatibility is an extension beyond that roadmap, recorded as a LieGroups Part II proposal rather than replanned in H.3.
- **`tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`**: Supply real matrix Lie subgroups, identity components, effective homogeneous-space quotients, stabilizers and compact-isotropy proper discontinuity of discrete actions. Complex homogeneous quotient and holomorphic descent need the separately recorded complex extension/C0 interface; a real closed-subgroup theorem alone does not prove them.
- **`tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-8-borel-weil-flag-manifolds-and-bruhat`**: Reuse upstream G/B/Borel–Weil flag geometry. Supply the extension to represented parabolic G_C/P, universal flag bundles, faithful orbit embedding and tangent quotient g_C/Lie(P) with right cosets. General parabolic quotients and complex analytic compatibility are beyond the explicit G/B layer and require the recorded LieGroups Part II/R09.1 contract.
- **`StableReductionPartII:key/moduli-curves`**: Import the exact mathematical statement read at StableReductionPartII:key/moduli-curves in research/blueprint/packets/StableReductionPartII.json: the pointed groupoid, universal family with canonical base-change identification, or full stable-range smooth stack, respectively. This is a planned supplier with geometric stages remaining partial; its scheme/stack carrier must not be duplicated in H.3. The analytic deformation/cotangent dictionary is the separate MC.2 request.
- **`StableReductionPartII:MC.0/universal-curve`**: Import the exact mathematical statement read at StableReductionPartII:MC.0/universal-curve in research/blueprint/packets/StableReductionPartII.json: the pointed groupoid, universal family with canonical base-change identification, or full stable-range smooth stack, respectively. This is a planned supplier with geometric stages remaining partial; its scheme/stack carrier must not be duplicated in H.3. The analytic deformation/cotangent dictionary is the separate MC.2 request.
- **`StableReductionPartII:MC.2/pointed-dm-theorem`**: Import the exact mathematical statement read at StableReductionPartII:MC.2/pointed-dm-theorem in research/blueprint/packets/StableReductionPartII.json: the pointed groupoid, universal family with canonical base-change identification, or full stable-range smooth stack, respectively. This is a planned supplier with geometric stages remaining partial; its scheme/stack carrier must not be duplicated in H.3. The analytic deformation/cotangent dictionary is the separate MC.2 request.

The stage remains planned for these concrete reasons:

- **Analytic flag and complex Lie quotient interfaces remain open**. The mathematical construction and complete local proof routes are planned, but the pinned Grassmannian is only a functorial carrier and the upstream LieGroups roadmap explicitly develops real Lie groups/G/B. The complex exponential, parabolic quotient charts, analytic universal filtration and free quotient descent must be supplied at the requests above. Omitted global manifold theorem signatures in the suggested file reflect this interface gap, not proof completion.
- **Common variation and represented Mumford–Tate supplier is not accepted/implemented**. The exact D1/D3 mathematical nodes are imported from the needs_changes ShimuraData packet. Native point/orbit/marking assembly is typed below, but its identification with represented algebraic groups and holomorphic local-system bundles is conditional on supplier review and concrete interfaces. CM-action test fixtures and global change-marking provenance are omitted signatures, not synthetic carriers.
- **Logarithmic direct-image base change and cohomology dictionary**. LL A.1.7 invokes Voisin 9.22, whose book proof was not read. The H.3 proof instead derives its required fibre-holomorphic absolute C∞ lift from the specified F¹ direct-image fibre/base-change isomorphism, evaluation and a smooth splitting of the logarithmic one-form bundle sequence. These exact H.2/C0/CV.4 interfaces are not present at the pins; merely having a smooth bundle does not supply fibre base change. Unitarity remains required for H.2 degeneration/comparison. The entire logCurveKS signature/API/tests remain explicit omissions until coherent analytic C-linear cohomology and the log tangent sequence types exist.
- **Vector-bundle trace/Serre and stable curve classifying map**. Proper derived Serre duality is already planned at SF.2/serre-proper, but compatible analytic trace/cup/evaluation and vector-bundle section types are not available. The M_g,n identification additionally needs the R09.4 deformation extension. PeriodTrace.multiply, its API/tests and the global derivative theorem signatures are omitted, with full mathematical statements retained; no local dot product is relabelled as the global sheaf construction. The actual moduli carrier and stable-range theorem are imported from StableReductionPartII:key/moduli-curves and MC.2/pointed-dm-theorem. Their analytic cotangent realization is the open contract, not a new moduli construction.
- **Suggested file elaboration unavailable at the supplied build**. The user-prescribed lean-check was attempted on 2026-10-07 after free -g showed 96 GB available. It stopped at the first import because TauCeti.Geometry.Hodge.PeriodDomain.olean is absent. Mathlib in that build is at the exact pin, but its TauCeti checkout is cf386627e9176a3827c1a5fe804989fd94a4d216, beyond the pinned f790474. No library build, cache fetch or language server was started. Suggested signatures are unchecked and no successful whole-file elaboration is claimed.

The suggested file imports individual modules and gives native point-to-flag, point transport, orbit, Lie-filtration, exponential-map, marked-point, quotient-symbol and matrix-normalization forms. Its marked-point and orbit signatures take actual supplied filtrations/actions; they do not replace the common variation or represented algebraic group. For the trace and logarithmic connecting constructions the global sheaf/cohomology signatures are explicitly omitted with exact names and mathematical statements. Their tests remain in that omission ledger. No local dot product or arbitrary linear map is named as the global trace/Kodaira–Spencer object. The global manifold and derivative theorem declarations are also explicit omissions until the exact supplier types are available. All implementation statuses remain unchecked.

Whole-file elaboration was attempted with the prescribed `lean-check` after the available-memory check. The supplied build lacks the compiled native PeriodDomain import and its Tau Ceti checkout is beyond the recorded pin. No library was built or cache fetched. Thus this file is **not compiled**. This limitation is separate from the mathematical supplier gaps. The extracted Mathlib-only quotient-symbol and normalized-matrix signatures elaborate separately with proof placeholders as their only warnings. This partial check does not establish the full file or any global supplier interface. The packet checker at the pinned declaration index reports zero errors and warnings.

## Source reading and routing

Each source was accessed on 2026-10-07. Exact versions, hashes, read sections and limits appear in the packet. The main H.3 proofs read in full are Pink 1.7/1.8/1.10, Schmid's §3 period/horizontal discussion, Landesman–Litt Appendix A through A.2, and the Gao–Habegger local holomorphic integration argument through (4.2). Invoked general Lie/flag, Ehresmann and Deligne extension/degeneration results are supplier inputs. The Voisin harmonic theorem invoked in LL A.1.7 was not independently read. This plan realizes the needed lift by extending a relative section through the stated direct-image fibre/base-change isomorphism and then smoothly splitting the absolute-to-relative logarithmic one-form sequence. Those are explicit supplier inputs; no unread logarithmic harmonic theorem is presumed. BKT's nilpotent and definability proofs are not claimed read for this part.

- [SCHMID: Variation of Hodge Structure: The Singularities of the Period Mapping](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf) — Wilfried Schmid. Inventiones mathematicae 22 (1973), 211–319, published scan. Read: §3, printed pp.221–228: period domain and compact dual, Lie-Hodge filtration, tangent/horizontal construction, complete proofs of (3.18), (3.21), (3.22), local/global marked period maps; Printed p.223 statement after (3.9) additionally checked visually against the scan. Limits: Generic Lie/flag facts cited within §3 are supplier interfaces, not newly proved here.
- [PINK: Arithmetical compactification of mixed Shimura varieties, Chapter 1](https://www.math.ethz.ch/~pink/ftp/phd/Chapter_1.pdf) — Richard Pink. Bonner Mathematische Schriften 209 (1989); original scanned thesis chapter. Read: §1.5 and §1.6 setup, printed pp.11–12; Proposition 1.7, printed p.13, statement and complete faithful-representation/tangent proof; Lemma 1.8, printed p.14, statement and complete proof; Proposition 1.10, printed p.15, statement and complete transversality proof. Limits: Only the pure specialization is owned here; mixed Shimura structures and limiting mixed flags are external.
- [LL: Canonical representations of surface groups](https://arxiv.org/pdf/2205.15352v4) — Aaron Landesman and Daniel Litt. arXiv:2205.15352v4, 2025-02-23; preprint of Annals of Mathematics 199 (2024), 823–897. Read: §5.1, pp.27–29, including Notation 5.1.1 and Theorem 5.1.6; §5.2 opening and (5.5), p.29; Appendix A, pp.54–57, complete proofs of A.1.1, A.1.4, A.1.7, A.1.8 and A.2; §6.1 p.32, the setup and paragraph applying Theorem 5.1.6; not the rest of the rank/representation proof. Limits: Tim87 degeneration, Del70 canonical extension/comparison, EH16 Grassmannian tangent and Voisin 9.22 harmonic lifting are invoked in the source. Their underlying cited proofs were not read here; exact H.2/R09.1 requests record the imported comparison/tangent inputs. For A.1.7 the lift is obtained from explicit direct-image fibre base change and smooth logarithmic bundle splitting; the unread harmonic proof is not needed by this route.
- [GH: Heights in families of abelian varieties and the geometric Bogomolov conjecture](https://arxiv.org/pdf/1801.05762v3) — Ziyang Gao and Philipp Habegger. arXiv:1801.05762v3, 2019-01-28. Read: §4, printed pp.15–17, the local trivialization and holomorphic Hodge-plane/period-matrix proof through (4.2). Limits: Ehresmann, geometric variation and fibre Riemann bilinear relations remain supplier inputs. Betti-map applications are outside H.3.
- [K17: Hodge loci and atypical intersections: conjectures](https://arxiv.org/pdf/1711.09387v1) — Bruno Klingler. arXiv:1711.09387v1, 2017-11-26. Read: §§2.3–2.6, printed pp.7–9, Hodge tensors, generic MT datum, period interpretation; §3.1, Proposition 3.1 and Definitions 3.3–3.5, p.10; §3.2 Proposition 3.6, p.11; Definitions 3.14–3.18, pp.13–14. Limits: Tensor stabilizer theory is imported from ShimuraData:D1; dependent atypical-intersection results are consumers rather than targets.
- [BKT: Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://par.nsf.gov/servlets/purl/10200187) — Benjamin Bakker, Bruno Klingler and Jacob Tsimerman. Journal of the American Mathematical Society 33 (2020), 917–939, published copy. Read: §1.3, p.920, complete period/Mumford–Tate domain setup; §4.2, pp.928–929, period-map setup and lift expression only; §4.4, p.931, splitting/norm setup only; Theorem 1.1(1), p.919, compared with the published erratum. Limits: Nilpotent-orbit arguments belong to H.6 and definability to H.7; their complete proofs were not read for H.3.
- [BKT-ERR: Erratum: Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArithErr.pdf) — Benjamin Bakker, Bruno Klingler and Jacob Tsimerman. Author copy of the 2023 published JAMS erratum. Read: Entire four-page erratum, §§1.1–1.5. Limits: Fix the maximal compact K for the semialgebraic structure/functoriality; the period-map definability theorem remains valid with the canonical Hodge choice.

BKT's general period setup supplies the domain/component and marked-lift interfaces here. Its nilpotent asymptotics go to H.6 and its tame period/Hodge-locus assertions to H.7. LL §5.1 and Appendix A supply the derivative and trace identities; its §5.2 rank inequalities and dependent representation applications go to H.4. Gao–Habegger §4 supplies the holomorphic local matrix comparison; its Betti-map, height and Bogomolov applications remain with the routed consumers. Pink's mixed data are not built here: only its pure orbit/tangent/transversality specialization is used.

## Published-source issues found while reading

These findings await the independent reviewer. They are recorded against the exact published text read, without silently correcting it. H.3 uses the corrected statements.

### HodgeStructuresPartII/EH3-1

Published scan, §3, printed p.223, sentence immediately following (3.9).

Printed: “It is a simple complex Lie algebra”.

Correction: The complex isometry Lie algebra is reductive; simplicity requires restrictions on the form and dimension. No H.3 statement uses simplicity.

Check: Choose weight zero, h(0)=4 and a positive definite symmetric form on R⁴, which is allowed by the §3 setup. Its complex isometry Lie algebra is so₄(C)≅sl₂(C)⊕sl₂(C), hence has two proper nonzero ideals. Dimension two gives the abelian so₂(C) as another allowed failure. The filtration, tangent quotient and openness proofs do not require simplicity.

Status: new. Searches: Published article metadata/erratum links at https://doi.org/10.1007/BF01389674; Public search on 2026-10-07 for Schmid Variation Hodge Structure 1973 errata simple Lie algebra p.223; no published correction located; The published scan at the recorded SHA, with this sentence checked visually.

### HodgeStructuresPartII/EH3-2

Published JAMS 33 (2020), Theorem 1.1(1), p.919; compared with 2023 erratum §1.1.

Printed: “admits a natural structure”.

Correction: For the Ralg-definable structure specify a maximal compact subgroup K containing M; the corrected functoriality requires compatible K data. The canonical Hodge K is available in the period application, whose definability conclusion is unchanged.

Check: The published erratum §1.1 explicitly withdraws the claimed K-independent natural structure and explains the failure of unrestricted functoriality; §§1.2–1.5 give the corrected statement and the canonical Hodge choice. H.3 uses only the analytic orbit/period setup, not the erroneous definable-quotient conclusion.

Status: Bakker–Klingler–Tsimerman, 2023 published erratum; author copy https://benjamin-bakker.github.io/DefArithErr.pdf, §§1.1–1.5. Searches: Original published version at https://par.nsf.gov/servlets/purl/10200187; Author erratum page https://benjamin-bakker.github.io/DefArithErr.pdf.

### HodgeStructuresPartII/EH3-3

Original published thesis scan, §1.9(a), printed p.15; the handwritten correction is visible in this scanned copy.

Printed: “in each stalk”.

Correction: Use the vector-bundle fibre, equivalently the sheaf stalk tensored with its residue field, to obtain the finite-dimensional fibre Hodge filtration.

Check: The stated locally free coherent sheaf has stalk an O_X,x-module; the Hodge structure of its local system is on the complex vector-space fibre. The scan itself strikes out stalk and writes fibre. The fibre convention is already used by the imported common variation and H.3 point assembly.

Status: Handwritten replacement by fibre in the publicly linked original Chapter 1 scan; attribution of the annotation is not known.. Searches: Richard Pink author dissertation page https://people.math.ethz.ch/~pink/dissertation.html and its linked original chapter; §1.9(a) of https://www.math.ethz.ch/~pink/ftp/phd/Chapter_1.pdf at the recorded SHA, including its visible handwritten correction.

## Acceptance and next implementation boundary

The reviewer should first test the CM singleton against the ambient upper-half-plane component, the non-opposed real compact-dual line, the Tate jump at every integer, the effective versus full MT isotropy, and the horizontal grade −1 versus full negative tangent. Then check the logarithmic single-divisor twist and positive Kodaira–Spencer cup sign. A constant family must have zero derivative even when global trace multiplication is nonzero. The weight-one matrix calculation must preserve row-form normalization under left frame changes and use the right-acting cycle marking formula stated above.

The next implementation boundary is the supplier dictionary, rather than another period-point carrier: representable analytic flags and complex parabolic quotients first, common holomorphic variations and log coherent comparison and fibre base change next, then the trace-compatible vector-bundle Serre inputs. Only after these contracts exist can the omitted global signatures be filled and closure strengthened. The Lie groups Part II ownership proposal is recorded in the packet’s restructure field; the discovered pointed-curve moduli supplier is imported from StableReductionPartII. The source decomposition, six planet choices and complete conditional proof routes are ready for independent review.
