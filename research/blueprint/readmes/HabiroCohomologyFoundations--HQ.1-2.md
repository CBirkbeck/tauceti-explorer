# HQ.1, second pass: étale descent and derived torus connections

This document completes the target-level planning pass for the two obligations
left open by the accepted [HQ.1 packet](../packets/HabiroCohomologyFoundations--HQ.1.json):
étale descent of the global q-de Rham complex, and the derived quotient-stack
comparison for modified torus connections. It builds on that packet without
changing any of its declarations. The [follow-up packet](../packets/HabiroCohomologyFoundations--HQ.1-2.json)
contains seven new nodes: two theorems, two comparisons, two constructions
and one definition, with 21 API items and 11 unit tests. Two nodes are selected
as new planets. Every implementation status is unchecked. “Complete” describes
this planning pass. HQ.1 has coverage **planned**, with four precise generic
supplier requests. It is not a closed or implemented library.

The descent theorem is a consequence of Wagner's global functor and its
specialization, proved here by derived complete conservativity. Wagner's Appendix
A does not state it. The derived torus theorem is an application of Lurie's
general quasi-coherent descent construction to an explicit discrete lattice
action. It is not a theorem about an analytic Habiro stack and is not attributed
to Scholze's discussion of ordinary q-connections. These distinctions matter:
a correct algebraic descent argument cannot supply unwritten analytic comparison
theorems, and the coordinate independence of a complex does not prove the
coordinate independence of an entire category of connections.

## Conventions and the accepted starting point

For global q-de Rham descent, A is a commutative torsion-free arithmetic Λ-ring.
Here Λ means the arithmetic λ-ring structure, specified by commuting Adams
operations and their prime Frobenius congruences. Set h=q−1 and B=A[[h]]. Smooth
algebras in this pass are finitely presented. Perfectly covered Λ-rings, named
in the stage description, are within these hypotheses; perfect covering is not
required by Wagner Theorem A.1. Neither a smooth algebra nor its étale overlaps
needs a global Λ-structure. All completions and totalizations are derived and
enhanced. Ordinary de Rham degrees are cohomological, beginning in degree zero.

The accepted construction `HQ.1/the-global-q-de-rham-complex` gives the functor
qΩ(S/A) into derived h-complete E∞ B-algebras. It is constructed by arithmetic
gluing of the prime-complete objects and rational de Rham data, using a uniform
denominator bound. The accepted `HQ.1/what-the-global-complex-satisfies` gives
the natural reduction qΩ(S/A)/h ≃ Ω*(S/A), its primewise prismatic comparison
and its completed rational comparison. This pass imports these declarations;
it neither repeats their denominator estimates nor creates a global
q-crystalline site. Primewise comparisons retain the Frobenius twist and
adjoined ζ_p. The q-prism ideal is [p]_q, whereas h is the completion and
specialization parameter here.

The accepted `HQ.1/the-framed-description-of-the-global-complex` identifies
qΩ(S/A) with the coordinate-dependent framed complex as an underlying enhanced
B-module object. The accepted `HQ.1/framing-independence-and-the-cocycle-identity`
provides the comparison through the chart-free object for two and three
framings. Its `HQ.1/base-change-for-the-global-complex` remains the coefficient
base-change theorem. The present descent argument adds none of their statements
again. In particular, an étale cover of Spec S is not a coefficient base change
along A→A′: qΩ(S/A) is not an S-linear de Rham complex that one can tensor over
S to obtain qΩ(T/A).

For the torus, the coefficient ring B is instead **any** commutative ring and
q is a specified unit. This includes formal q=1+h, but the algebraic theorem
requires neither completeness nor a Λ-structure. Put C=B[Z^d], the native
additive group algebra, identified with B[x₁^{±1},…,x_d^{±1}]. The group of
labels is the discrete additive lattice G=Z^d. The constant group sheaf is the
coproduct of copies of Spec B. For d>0 it is not a finite group scheme and is
not the affine spectrum of the infinite product of function rings.

The accepted `HQ.1/modules-with-framed-q-connection` is Scholze's ordinary
framed q-connection interface on finite projective formal modules. The accepted
`HQ.1/modified-q-connections-on-a-torus` is the category of C-modules with
commuting **invertible** σ_i-semilinear Γ_i, where σ_i(x_j)=q^{δ_ij}x_j.
Its operators are ∇̃_i=x_i⁻¹(Γ_i−id), and its tensor uses Γ_i diagonally.
No condition Γ_i≡id modulo h is imposed. The accepted
`HQ.1/torus-descent-for-modified-q-connections` identifies this ordinary heart
with equivariant modules and modules over C⋊G. Its multiplication is
(f[a])(g[b])=fσ_a(g)[a+b]. Only the derived comparison from that node remains
to be supplied. These are the definitions used here; no identification with
the differently normalized operators of unread V5A4 notes is made.

## The proof interfaces and their owners

Two short arguments replace two much larger, unnecessary constructions.
First, derived reduction modulo h commutes with the whole Čech limit. This
does not follow from a general assertion that tensor product commutes with
infinite limits. It follows from h being regular in A[[h]]: the two-term
finite-free resolution identifies reduction with the cofiber of multiplication
by h. In a stable enhanced category that cofiber is also a finite-limit
construction, which commutes with arbitrary limits. Derived complete objects
are closed under limits and fibers. Reduction detects equivalences between
them. These precise principal-ideal assertions are imported from
`DerivedDeRhamCohomology:DD.1`, rather than reproving a completion theory here.

Ordinary de Rham descent comes from `DerivedDeRhamCohomology:DD.2`. If S→T is
faithfully flat and étale, each form module of T's Čech nerve is the scalar
extension of Ω^j(S/A). Faithfully flat Amitsur descent is exact in each row.
The differential between rows is A-linear and the form degree is uniformly
bounded. Totalizing this bounded bicomplex gives the ordinary derived descent
equivalence. The corresponding generic request includes finite products and
the smooth separated affine-cover computation of de Rham hypercohomology.
No calculation of q-divided-power envelopes enters this argument.

Second, the algebraic torus quotient is the sheafification of a prestack
colimit. `LanglandsParameterStacks:LP1` is the requested exporter of the enhanced
quotient and quasi-coherent pullback/descent interface. The ordinary effective
fpqc descent and quotient constructions are supplied by
`SchemeAndStackFoundations:SF.1`, as the verified
[routing of finding 27](../redteam/RT-AREA-geomlanglands.review.json) requires.
The LP1 request remains open: parameter-specific LP1 nodes do not supply the
arbitrary infinite discrete-group interface needed here. The request specifies
Lurie's cartesian-module QCoh∞ construction,
its affine values, its conversion of prestack colimits into categorical limits,
and its invariance under fpqc sheafification. The nerve components are copies
of the affine torus, indexed by G^n; taking QCoh∞ gives **products** of D(C).
The action-twisted totalization is exactly the imported E5 homotopy-fixed-point
construction. This proof works even when the atlas morphism is not
quasi-compact. A theorem requiring an affine diagonal, a finite constant
group or a single quasi-compact fpqc affine atlas would not provide this input.

`EnhancedDerivedSheaves:E5:presentability/coherent-group-actions` supplies the
definition of a coherent action and its limit. Only its arbitrary discrete
group portion is used; no statement about profinite continuity is used.
`EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`
and `E0/limits-colimits-and-slices` supply the enhanced coherent-diagram and
limit interfaces for transporting framed Čech diagrams. The generic
affine-basis sheaf extension is requested from `EnhancedDerivedSheaves:E2`,
within its cartesian descent direction. If its existing interface needs to be
enlarged, the packet records that extension as EnhancedDerivedSheaves, Part II.
Covering Čech descent suffices; unrestricted unbounded hyperdescent on an
arbitrary étale topos is not asserted.

The dependency chains below end either in these supplier declarations/requests,
in the accepted HQ.1 nodes, or in the pinned native algebra carriers. Each new
node is a target-level declaration. Its smaller routine algebraic and
categorical steps remain in the proof, following the issue's granularity.

## New declarations

The following subsections give every statement, proof outline, API and unit
test from this packet. IDs begin `HabiroCohomologyFoundations:HQ.1/descent-`;
none is an ID of the accepted packet. Proposed declaration names are names
for the planned library, not implementation claims.

### 1. Étale descent for the global q-de Rham complex

**Declaration:** `qOmega.etaleCechDescent` (theorem). **Node:** `HabiroCohomologyFoundations:HQ.1/descent-global-etale`.

Let A be a torsion-free arithmetic Λ-ring, h=q−1 and B=A[[h]]. If S is a smooth finitely presented A-algebra and S→T is faithfully flat, étale and finitely presented, the augmentation qΩ_{S/A}→Tot_{[n]∈Δ} qΩ_{T^{⊗_S(n+1)}/A} is an equivalence in derived h-complete E∞ B-algebras. More generally this holds for a finite jointly surjective family of finitely presented étale S-algebras, with the Čech terms the products over all multi-indices of the values on the corresponding tensor products. Tot is the enhanced limit, with the functorial augmentation and all simplicial maps.

**Hypotheses and scope.**

- Only A carries a Λ-structure; S, T and the overlaps need no compatible Adams operations. Perfectly covered bases are an admitted subclass, not an additional requirement of Theorem A.1.
- Use the existing global functor and its natural reduction modulo h, not a tensor product of qΩ over S: the de Rham differential is A-linear rather than S-linear.
- h is a nonzerodivisor in A[[h]], even if A has zero divisors. The ordinary smooth de Rham complexes have a common finite range of form degrees on this étale nerve.

**Construction or proof.**

1. Import qΩ, its derived h-completeness and the natural equivalence qΩ/h≃Ω* from the accepted global-complex and properties nodes (Wagner A.1(a)). Every overlap is smooth over A.
2. Import the DD.1 enhanced completion interface: arbitrary limits and fibres of complete objects are complete, and reduction modulo h detects equivalences between them. Thus the fibre of the augmentation is complete.
3. The two-term finite-free resolution B --h--> B of B/h identifies reduction with cofib(h). In a stable enhanced module category finite colimits are finite limits; hence cofib(h) commutes with every limit, including this infinite totalization. This is a property of this regular principal reduction, not of arbitrary tensor products.
4. Use DD.2 ordinary smooth étale descent: Ω^j_{T^{⊗(n+1)}/A} identifies with Ω^j_{S/A}⊗_S T^{⊗(n+1)}. Each augmented Amitsur row is exact by faithful flatness. The differential between rows is only A-linear. The finite range of form degrees makes totalization converge, giving Ω*_{S/A}≃Tot Ω*_{T•/A}.
5. The reduced augmentation is therefore an equivalence; derived complete conservativity annihilates its fibre. The forgetful functor from E∞ algebras creates limits and detects equivalences, proving the multiplicative statement.
6. For finite families, first prove qΩ_{∏ S_i/A}≃∏ qΩ_{S_i/A} by the same complete/reduction argument and the product identity for ordinary de Rham. The algebra T=∏ T_i is faithfully flat and étale over S; expand its Čech nerve as the finite disjoint union of the multi-index overlaps. This also proves the Zariski version by finite principal-open refinements.

**Acceptance.**

- The identity cover is an equivalence; a finite disjoint cover has the product Čech terms.
- For S=Z[x], the principal opens D(x), D(1−x) give the stated complete derived descent diagram.
- Modulo h the augmentation is ordinary de Rham descent. No interchange of rationalization with an infinite totalization is used.

**Direct prerequisites:** `HabiroCohomologyFoundations:HQ.1/the-global-q-de-rham-complex`, `HabiroCohomologyFoundations:HQ.1/what-the-global-complex-satisfies`, `HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations`, `DerivedDeRhamCohomology:DD.1`, `DerivedDeRhamCohomology:DD.2`.

**Source match:** Theorem A.1(a), printed p.69 ([wagner-v2](https://arxiv.org/pdf/2510.04782v2)): Input only. This descent theorem is a derived consequence proved by the six steps, not a theorem stated in Appendix A. Definition 15.93.4, subsequent closure assertion; Lemma 15.93.20 ([stacks-completion](https://stacks.math.columbia.edu/tag/091N)): Completion closure and derived Nakayama are imported from DD.1. Theorem 59.22.4, proof for affine U, and Lemma 59.22.1 ([stacks-etale](https://stacks.math.columbia.edu/tag/03OY)): The Amitsur-row argument supplies ordinary de Rham descent through DD.2; the extension to the bounded complex is spelled out here.

### 2. Coherent framed Čech comparisons

**Declaration:** `qOmegaFramed.etaleCechDescent` (comparison). **Node:** `HabiroCohomologyFoundations:HQ.1/descent-coherent-framed`.

Choose an étale framing □_U for S and for each multi-index overlap U in a finite affine étale Čech nerve whenever such a framing exists. Let e_U:qΩ_{U/A}≃qΩ*_{U/A,□_U} be the accepted underlying enhanced equivalence. Transport the entire qΩ Čech diagram through these equivalences: for a ring map f:U→V its arrow is e_V qΩ(f) e_U⁻¹. The transported augmented diagram satisfies all identities and higher coherences and has limit qΩ*_{S/A,□_S}. For another family e′_U, the objectwise comparisons e′_U e_U⁻¹ form an equivalence of augmented diagrams; three choices satisfy the inherited cocycle coherently.

**Hypotheses and scope.**

- The comparison is in the enhanced derived category of B-modules. No equality of strict differentials or commutative dg-algebra structure on the displayed framed Koszul complex is asserted.
- A cover need not admit one global framing on each overlap; refine by framed affine opens when necessary. The chart-free descent theorem itself requires no framing.
- The transported equivalence is relative to the chosen equivalence data e_U. It does not assert that arbitrary pointwise equivalences determine a unique natural transformation.

**Construction or proof.**

1. Import the framed-description equivalence and the accepted two-/three-framing comparison node. Fix equivalence data in the enhanced category, including their inverses and inverse homotopies.
2. Transport a functor along objectwise equivalences in the enhanced category. Composition coherences, degeneracies, faces and their higher compatibility data are transported together. Use the imported E0 coherent-diagram classification for Δ, intervals and refinement shapes to carry this transport, with its fibrewise naturality and mapping-space universal properties.
3. Apply the preceding global étale descent theorem; limits are invariant under equivalence of diagrams. Repeat the transport for e′ and obtain the comparison of diagrams; the three-choice cocycle is induced by composition with the same chart-free functor.
4. Distinguish this from applying a coordinate substitution to a q-differential: the latter need not be a chain map. It also says nothing about coordinate independence of ordinary q-connection categories (Scholze Conjecture 7.5).

**Acceptance.**

- Face-face and face-degeneracy relations hold with their coherent homotopies.
- Changing three families of framings gives the cocycle of diagram equivalences.
- For the identity cover and a fixed e_S the augmentation is the identity, with no coordinate substitution formula required.

**Direct prerequisites:** `HabiroCohomologyFoundations:HQ.1/descent-global-etale`, `HabiroCohomologyFoundations:HQ.1/the-framed-description-of-the-global-complex`, `HabiroCohomologyFoundations:HQ.1/framing-independence-and-the-cocycle-identity`, `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`.

**Source match:** Theorem A.1(d), printed p.69; proof printed p.75 ([wagner-v2](https://arxiv.org/pdf/2510.04782v2)): Input framed equivalences only. Čech coherence is a formal enhanced transport argument, explicitly not attributed to the source. Conjecture 7.5, printed p.16 ([scholze](https://arxiv.org/pdf/1606.01796)): Identifies the separate, unproved connection-category statement that this comparison does not establish.

### 3. The étale sheaf of global q-de Rham algebras

**Declaration:** `qOmegaEtale` (construction). **Node:** `HabiroCohomologyFoundations:HQ.1/descent-etale-sheaf`.

For a smooth separated finitely presented A-scheme X over a torsion-free Λ-ring A, qOmegaEtale(X/A) is the sheaf of derived h-complete E∞ B-algebras on X_et whose value on an affine étale object U=Spec S of finite presentation is qΩ_{S/A}. It is the unique extension, up to equivalence, of this sheaf on the affine basis. Write qOmegaEtale.sections(X)=RΓ(X_et,qOmegaEtale). For a finite affine open cover of X, sections are the limit of the affine Čech diagram; all finite intersections are affine by separatedness. The sheaf reduces to the ordinary de Rham sheaf complex; the derived reduction of its section object modulo h is RΓ(X,Ω*_{X/A}).

**Hypotheses and scope.**

- A, h and B have the conventions of the global descent theorem. This is a sheaf of B-algebras; its underlying complex is not claimed to be O_X-linear.
- The finite-presentation affine étale objects form a basis; arbitrary objects are evaluated by basis extension. RΓ is an enhanced limit, not a degreewise kernel.
- The construction states Čech sheaf descent. It makes no unrestricted hyperdescent claim for arbitrary unbounded sheaves.

**Construction or proof.**

1. Restrict the existing smooth affine qΩ functor to the affine étale basis. The global étale descent theorem supplies the covering condition on this basis.
2. Import the E2 basis-extension and sheaf-limit construction in the complete enhanced target. Limits of complete objects remain complete by DD.1. The extension is unique as an extension of the given basis functor.
3. Define global sections by the enhanced limit. Use a finite affine open cover for a concrete model; intersections are smooth affine A-schemes, and the sheaf condition identifies the model independently of the cover and its refinements.
4. Reduction modulo h commutes with these limits by the regular principal calculation in global-etale. Reduce the affine values using the accepted natural qΩ/h equivalence and use DD.2 ordinary de Rham descent/hypercohomology.

**Uses that determine the interface.**

- HabiroCohomologyFoundations:HQ.1 stage target: descent including cocycles: Gives the chart-free global object on schemes, with a concrete Čech model.
- HabiroCohomologyFoundations:HQ.2 and HQ.8: Provides the complete smooth affine/scheme descent interface; animated singular extensions and trace applications keep their own hypotheses.

**Planning API.**

| Name | Role | Mathematical statement |
|---|---|---|
| `qOmegaEtale` | constructor | The complete E∞ B-algebra sheaf determined by U=Spec S ↦ qΩ_{S/A} on the affine étale basis. |
| `qOmegaEtale.affine` | equivalence | For affine étale U=Spec S, RΓ(U_et,qOmegaEtale\|_U)≃qΩ_{S/A}, naturally in U. |
| `qOmegaEtale.sections` | projection | The enhanced global-section object RΓ(X_et,qOmegaEtale). |
| `qOmegaEtale.cech` | characterisation | For a finite affine open cover of separated X, global sections are Tot of the products of the affine qΩ values on intersections; compatible with refinement. |
| `qOmegaEtale.modH` | compatibility | The derived reduction of the sheaf is the ordinary de Rham sheaf complex, and sections/h≃RΓ(X,Ω*_{X/A}). |
| `qOmegaEtale.restrict` | functoriality | For U→V in X_et, the restriction RΓ(V_et,qOmegaEtale\|_V)→RΓ(U_et,qOmegaEtale\|_U) is a complete B-algebra map; on affine objects it is the existing qΩ map for the corresponding ring homomorphism. Identity and composition hold with all coherent functor laws. |
| `qOmegaEtale.ext` | universal-property | Restriction to the affine étale basis induces equivalences on mapping spaces between sheaves valued in complete E∞ B-algebras. A specified comparison of basis functors extends with contractible choice; in particular qOmegaEtale is characterized by its affine-value functor. |

**Unit tests.**

- `qOmegaEtale.identityCover` (degenerate): For X=Spec S and its identity affine cover, sections identify with qΩ_{S/A} and the restriction is identity.
- `qOmegaEtale.disjointCover` (computation): For X=Spec S₁ ⊔ Spec S₂, sections are qΩ_{S₁/A}×qΩ_{S₂/A}; cross intersections contribute the zero-ring value.
- `qOmegaEtale.principalCoverReduction` (compatibility): For Spec Z[x] covered by D(x), D(1−x), the section object modulo h is the ordinary de Rham Čech totalization, equivalent to Ω*_{Z[x]/Z}.

**Acceptance.**

- The affine-value equivalence intertwines all restrictions and reductions.
- The section object and its multiplicative structure are independent of the cover as enhanced objects.

**Direct prerequisites:** `HabiroCohomologyFoundations:HQ.1/descent-global-etale`, `HabiroCohomologyFoundations:HQ.1/the-global-q-de-rham-complex`, `EnhancedDerivedSheaves:E2`, `DerivedDeRhamCohomology:DD.1`, `DerivedDeRhamCohomology:DD.2`.

**Source match:** Theorem A.1(a), printed p.69 ([wagner-v2](https://arxiv.org/pdf/2510.04782v2)): Specifies the affine functor and reduction. The sheaf construction is this application of the imported basis-extension theorem. Theorem 59.22.4, including the separated affine-cover proof ([stacks-etale](https://stacks.math.columbia.edu/tag/03OY)): Each ordinary form sheaf is quasi-coherent; its bounded complex computes de Rham hypercohomology by the affine Čech argument.

### 4. Integer coordinate scaling on the torus

**Declaration:** `torusScale` (construction). **Node:** `HabiroCohomologyFoundations:HQ.1/descent-torus-scaling`.

Let B be any commutative ring, q a unit in B and d≥0. Reuse the native additive monoid algebra C=B[Z^d], equivalently B[x₁^{±1},…,x_d^{±1}]. For a∈Z^d define the B-algebra automorphism torusScale(q,a)=σ_a by σ_a(r x^m)=r q^{⟨a,m⟩}x^m, where ⟨a,m⟩=Σ_{i=1}^d a_i m_i∈Z. Thus σ_0=id, σ_{a+b}=σ_aσ_b and σ_{−a}=σ_a⁻¹. This packages the previously defined commuting coordinate automorphisms into the complete discrete group action, including negative powers.

**Hypotheses and scope.**

- q is a unit; integer powers are powers in B× followed by coercion to B. No inversion of h=q−1 and no Λ-structure or completeness of B is required.
- Z^d is the discrete lattice with additive notation. Its constant group sheaf is the coproduct of copies of Spec B, not Spec of the product function ring and not a finite constant group.
- This is the action for the accepted modified-q-connection definition. It does not define another framed q-derivative or Koszul complex.

**Construction or proof.**

1. Use AddMonoidAlgebra for C and its single-monomial multiplication. The map m↦q^{⟨a,m⟩} is a multiplicative character of the exponent lattice because the pairing is additive in m.
2. Multiply each finitely supported coefficient by that character. The convolution computation single m r · single n s = single (m+n) (r·s) proves multiplicativity; σ_a fixes coefficient monomials r x^0. The inverse is obtained by the opposite character, giving the native AlgEquiv.
3. Additivity in a proves the action law and negative-power identity on monomials, then on finite sums. Equality of coefficient-linear maps on every monomial gives uniqueness.
4. Compare σ_{e_i} with the existing coordinate-scaling automorphisms on the same Laurent algebra. This is a packaging/extension to all integer labels, not a new owner for the coordinate calculus.

**Uses that determine the interface.**

- Derived torus quotient comparison in this packet: Supplies all labels and the action law for the groupoid nerve.
- Accepted HQ.1 modified-q-connections-on-a-torus and torus-descent-for-modified-q-connections: Identifies integer iterates of the generator actions and pins the inverse convention.

**Planning API.**

| Name | Role | Mathematical statement |
|---|---|---|
| `torusScale` | constructor | The native B-algebra automorphism σ_a of AddMonoidAlgebra B (Fin d→Z). |
| `torusScale_single` | simp | σ_a(single m r)=single m (r·q^{Σ_i a_i m_i}), with integer powers of the unit q. |
| `torusScale_zero` | simp | σ_0 is the identity B-algebra equivalence. |
| `torusScale_add` | functoriality | σ_{a+b}(f)=σ_a(σ_b(f)) for every Laurent polynomial f. |
| `torusScale_neg` | relation | σ_{−a} equals the inverse equivalence σ_a⁻¹. |
| `torusScale_unique` | extensionality | Any B-algebra automorphism with the same single-monomial formula equals σ_a. |

**Unit tests.**

- `torusScale_rankZero` (degenerate): For d=0 every σ_a is the identity, using the native B[Z^0] carrier.
- `torusScale_qOne` (computation): For q=1 and any d,a, σ_a is identity. The group of labels still exists.
- `torusScale_negativeExponent` (computation): For d=1, a=(1), m=(−1), σ_a(single m 1)=single m q⁻¹.
- `torusScale_twoCoordinates` (computation): For d=2, a=(2,−1) and m=(−1,3), σ_a(single m 1)=single m q⁻⁵.

**Acceptance.**

- For each standard basis e_i, σ_{e_i}(x_j)=q^{δ_ij}x_j and σ_{e_i}(x_i⁻¹)=q⁻¹x_i⁻¹.
- The action remains meaningful at q=1 and at roots of unity; it is not assumed faithful.

**Direct prerequisites:** `mathlib:AddMonoidAlgebra`, `mathlib:AlgEquiv`, `HabiroCohomologyFoundations:HQ.1/modified-q-connections-on-a-torus`.

**Source match:** Definition 7.3 and its reference back to coordinate γ_i, printed p.15 ([scholze](https://arxiv.org/pdf/1606.01796)): Motivates the existing coordinate-scaling operators. The Laurent integer-lattice action is proved by the displayed character construction, not stated in this source.

### 5. Derived modified q-connections on a torus

**Declaration:** `derivedModifiedQConnections` (definition). **Node:** `HabiroCohomologyFoundations:HQ.1/descent-derived-modified`.

For C=B[Z^d], let F_a:D(C)→D(C) be pullback along Spec σ_a, namely C⊗^L_{C,σ_a}(−). Under its canonical identification with the same underlying complex, the C-action is twisted by σ_a⁻¹. The action law gives a coherent functor BZ^d→Cat∞. Define derivedModifiedQConnections(B,q,d)=lim_{BZ^d} D(C), using the enhanced unbounded derived module category. An object has an underlying M, equivalences θ_a:F_a(M)≃M, and the full homotopy-coherent group-law data, with θ_0=id and θ_{a+b}=θ_a∘F_a(θ_b) under the coherent action identification F_{a+b}≃F_aF_b. On a strict complex, Γ_a(m)=θ_a(1⊗m) is an invertible additive chain map with Γ_a(fm)=σ_a(f)Γ_a(m), and θ_a(c⊗m)=cΓ_a(m). Morphisms include all coherent equivariance data; they are not just maps commuting in the homotopy category.

**Hypotheses and scope.**

- The lattice is discrete. Only the arbitrary-group part of the imported coherent-group-actions node is used; its statements about profinite continuity are not used.
- All modules/complexes are permitted. Finite locally free and perfect subcategories are restrictions imposed by the heart/perfect comparison, not part of this definition.
- The notation is an enhanced limit, not a replacement of the previously defined ordinary ModifiedQConnection structure. The latter is its heart.

**Construction or proof.**

1. Apply the imported LP1 enhanced affine-module pullback construction to the explicit σ action. For an automorphism this pullback is exact and its ordinary tensor model agrees with derived tensor.
2. Identify C⊗_{C,σ_a}M with the underlying abelian object by η_a(c⊗m)=σ_a⁻¹(c)m. A C-linear map θ_a:F_a(M)→M corresponds to the positive σ_a-semilinear map Γ_a(m)=θ_a(1⊗m): the tensor relation 1⊗fm=σ_a(f)⊗m proves the formula, and conversely θ_a(c⊗m)=cΓ_a(m) respects that relation. A map M→F_a(M), followed by η_a, instead has σ_a⁻¹-semilinearity. The chosen orientation and cocycle therefore agree with the accepted ordinary modified connection.
3. Apply the existing E5 coherent-action/homotopy-fixed-point construction. Use its full limit and the compatible objectwise derived tensor products to obtain a B-linear stable symmetric monoidal category. This last enhanced monoidal interface is requested from LP1, not constructed generically in HQ.1.
4. Evaluation at the unique base object gives a conservative exact forgetful functor. The unit is C with Γ_a=σ_a; the tensor action is diagonal, respecting the balanced C-tensor relation. Mapping spectra are the limit of the equivariant mapping diagram, retaining higher group cohomology.
5. For the higher-cohomology test at q=1,d=1, unit endomorphisms are the cochains RΓ(Z,C) with trivial action. The free two-term C[t^{±1}]-resolution with differential t−1 is exact: augmentation evaluates t=1, and elementary Laurent coefficient calculation identifies its kernel with (t−1). Applying Hom gives C in degrees 0 and 1 with zero differential, whereas Ext_C^1(C,C)=0. This computes the test without importing or rebuilding a generic Koszul complex.
6. For the scalar-twist test take B=Q,q=2,d=1. The unit linearization θ_1(c⊗f)=cσ_1(f) sends 1⊗x to 2x. Its inverse is x↦x⊗1, and η_1(x⊗1)=x/2. This distinguishes the two orientations even though q=1 tests cannot.

**Uses that determine the interface.**

- Derived quotient-stack comparison and heart/perfect comparison in this packet: Names the exact enhanced category being compared, removing the earlier coherent-equivariance gap.
- AnalyticHabiroStack:HS.1 and HS.3 (draft); HabiroCohomologyFoundations:HQ.6: Exports the algebraic discrete-torus category, with no claim that it is the solid or analytic completed category.

**Planning API.**

| Name | Role | Mathematical statement |
|---|---|---|
| `derivedModifiedQConnections` | constructor | The enhanced limit of the explicit discrete lattice action on D(C). |
| `derivedModifiedQConnections.forget` | projection | Conservative exact evaluation functor to D(C). |
| `derivedModifiedQConnections.unit` | data | The tensor unit has underlying C and generator actions σ_{e_i}. |
| `derivedModifiedQConnections.tensor` | structure | The derived C-tensor with diagonal coherent action; on flat strict representatives Γ_i(m⊗n)=Γ_i(m)⊗Γ_i(n). |
| `derivedModifiedQConnections.linearization` | projection | For an object with underlying M, extract θ_a:F_a(M)≃M, θ_0, the coherent cocycle θ_{a+b}=θ_a∘F_a(θ_b), and all higher compatibilities. On strict complexes Γ_a(m)=θ_a(1⊗m); on tensors θ_a is the tensor of the two θ_a maps through monoidal pullback. |
| `derivedModifiedQConnections.fromStrict` | constructor | A C-complex with commuting invertible σ_i-semilinear chain maps gives an enhanced modified connection by integer iterates and their coherent action. Horizontal chain maps induce morphisms, coherently respecting identity and composition. This constructs examples without asserting an equivalence from the localization of strict models. |
| `derivedModifiedQConnections.mappingSpectrum` | characterisation | For M,N, the mapping spectrum is Map_{D(C)}(M,N)^{hZ^d}; the coherent action on the underlying mapping spectrum sends f to θ_a^N∘F_a(f)∘(θ_a^M)⁻¹. In particular the forgetful functor need not be faithful on homotopy-category morphisms. |
| `derivedModifiedQConnections.isLimit` | universal-property | For every enhanced category K, Fun(K,derivedModifiedQConnections)≃lim_{BZ^d} Fun(K,D(C)) naturally in K and compatibly with evaluation. A coherent cone of functors lifts with contractible choice. This is the specialized limit universal property imported from E5. |

**Unit tests.**

- `derivedModifiedQConnections.rankZero` (degenerate): For d=0 the category is D(B) via the native B[Z^0]≃B identification and the trivial group.
- `derivedModifiedQConnections.unitGenerators` (compatibility): For the unit, Γ_i(x^m)=q^{m_i}x^m, agreeing with the accepted ordinary modified connection.
- `derivedModifiedQConnections.higherCohomology` (non-example): For B=Q, q=1, d=1 and C=Q[x^{±1}], Hom(unit,unit[1])≅C, whereas the mapping group in D(C) is zero. The Z action has not been discarded.
- `derivedModifiedQConnections.positiveScalarTwist` (computation): For B=Q,q=2,d=1,C=Q[x^{±1}], the unit θ_1:F_1(C)→C sends 1⊗x to 2x. Under η_1(c⊗m)=σ_1⁻¹(c)m its inverse C→F_1(C) sends x to x/2. Reversing θ while retaining positive semilinearity fails this test.

**Acceptance.**

- The convention θ_a:F_a(M)→M gives Γ_a(fm)=σ_a(f)Γ_a(m). The q=2 scalar-twist test must distinguish it from inverse semilinearity of M→F_a(M).
- Strict semilinear complexes give examples, but no equivalence with their localization is assumed or needed.

**Direct prerequisites:** `HabiroCohomologyFoundations:HQ.1/descent-torus-scaling`, `EnhancedDerivedSheaves:E5:presentability/coherent-group-actions`, `LanglandsParameterStacks:LP1`, `HabiroCohomologyFoundations:HQ.1/modified-q-connections-on-a-torus`.

**Source match:** Section 2.7 opening, printed pp.69–70; Definition 2.7.8 and Remarks 2.7.10–12, printed pp.71–72; symmetric monoidal construction preceding Notation 2.7.27, printed p.75 ([dag-viii](https://people.math.harvard.edu/~lurie/papers/DAG-VIII.pdf)): Enhanced module and pullback convention. Applying them to the action gives this specialized category; generic homotopy fixed points are imported from E5.

### 6. Derived torus quotient comparison

**Declaration:** `modifiedQConnection.torusQuotientEquivalence` (theorem). **Node:** `HabiroCohomologyFoundations:HQ.1/descent-derived-quotient`.

Let Q=[Spec C/Z^d] be the fpqc sheafification of the discrete action prestack of σ, using the generic quotient-functor construction of LP1. Then QCoh∞(Q)≃derivedModifiedQConnections(B,q,d), naturally and as B-linear stable symmetric monoidal categories, with pullback to Spec C corresponding to forget. Explicitly QCoh∞(Q)≃Tot_{[n]∈Δ} ∏_{(a₁,…,a_n)∈(Z^d)^n} D(C), with the action-twisted face maps, degeneracies inserting the zero group label (identity pullback on each selected component) and their coherent compatibilities. Thus the algebraic meaning of QCoh∞((G_m/q^Z)^d) is the action quotient, with its stabilizers.

**Hypotheses and scope.**

- In DAG VIII’s functor-of-points convention, Spec C denotes the affine functor corepresented by the Eilenberg–Mac Lane E∞-ring HC on connective E∞-rings. Use the enhanced equivalence Mod_HC≃D(C), not merely its triangulated homotopy category; LP1 supplies compatibility with pullback and tensor.
- The enhanced QCoh functor is the functor-of-points construction of DAG VIII §2.7, which works for this arbitrary discrete-group quotient. No finite-type, affine-diagonal or perfect-stack theorem is substituted.
- The action nerve in degree n is the coproduct over (Z^d)^n of Spec C. For d>0 this is an infinite coproduct, not an affine scheme whose coordinate ring is an infinite product.
- The map Spec C→Q is a torsor under an infinite discrete constant group after base change; it need not be a quasi-compact fpqc morphism. The proof uses sheafification invariance and the prestack colimit, not the assertion that this single map is an fpqc affine cover.
- No freeness or genericity of q is assumed. At q=1 the quotient is Spec C×BZ^d. If q has finite order N, the subgroup NZ^d is retained as stabilizer.

**Construction or proof.**

1. Import from LP1 the action prestack, its fpqc sheafification and the QCoh∞ functor of DAG VIII Definition 2.7.8. The action prestack is the geometric realization of the simplicial action nerve.
2. Proposition 2.7.6 and the right Kan construction make QCoh∞ send prestack colimits to category limits. Proposition 2.7.14 / Remark 2.7.15 identify the QCoh categories before and after fpqc sheafification. These general assertions are the LP1 request, not new HQ nodes.
3. On each component of the nerve use QCoh∞(Spec HC)=Mod_HC≃D(C); a coproduct of affine functors gives a product of these categories. Identify the face restrictions using F_a and the fixed scalar-twist convention. The resulting bar totalization is exactly the E5 homotopy fixed points in derived-modified.
4. Pullback and tensor products are pointwise in the cartesian-module description, so the equivalence is B-linear symmetric monoidal and commutes with pullback to Spec C. Apply the nerve description to q=1 or finite order to verify the retained stabilizers.

**Acceptance.**

- For d=0 the comparison is the affine equivalence QCoh∞(Spec B)≃D(B).
- For q=1,d=1,B=Q the quotient still has Z stabilizer and the unit has Hom to its shift by 1 equal to Q[x^{±1}].
- Degree-one descent is σ-semilinear with inverses. Higher nerve degrees impose coherent compatibility rather than merely equality of isomorphism classes.
- The equivalence makes no analytic, solid, Habiro-complete, or ordinary connection-category assertion.

**Direct prerequisites:** `HabiroCohomologyFoundations:HQ.1/descent-torus-scaling`, `HabiroCohomologyFoundations:HQ.1/descent-derived-modified`, `LanglandsParameterStacks:LP1`, `EnhancedDerivedSheaves:E5:presentability/coherent-group-actions`.

**Source match:** Proposition 2.7.6, Definition 2.7.8, Remark 2.7.10, Proposition 2.7.14 and Remark 2.7.15, printed pp.71–72; symmetric monoidal construction preceding Notation 2.7.27, printed p.75 ([dag-viii](https://people.math.harvard.edu/~lurie/papers/DAG-VIII.pdf)): These general QCoh results imply the quotient comparison by the action-nerve argument above. Proposition 2.7.18 alone, for spectral Deligne–Mumford stacks, is not used as a substitute.

### 7. The heart, vector bundles and perfect complexes

**Declaration:** `modifiedQConnection.torusHeartAndPerfect` (comparison). **Node:** `HabiroCohomologyFoundations:HQ.1/descent-heart-perfect`.

The quotient equivalence is compatible with the t-structures detected after pullback to Spec C. Its heart identifies ordinary QCoh(Q) with the accepted category of all C-modules with commuting invertible σ_i-semilinear Γ_i, equivalently C⋊Z^d-modules. It restricts to vector bundles precisely when the underlying C-module is finite projective. It restricts to perfect complexes precisely when the underlying object of D(C) is perfect. Perfect here means locally a bounded complex of finite projectives; it is not asserted to equal the compact objects of the equivariant category.

**Hypotheses and scope.**

- Use the pullback-detected t-structure: each F_a is t-exact. Ordinary modified connections have no Γ_i≡id mod(q−1) restriction.
- The heart comparison and skew-group-ring multiplication are already owned by the accepted torus-descent-for-modified-q-connections node and are imported rather than reconstructed.
- Perfectness and finite local freeness descend under the quotient sheaf’s flat local presentations, supplied by LP1. No derived-category-of-the-heart equivalence is inferred.

**Construction or proof.**

1. The t-exact coherent action gives the componentwise t-structure on its limit: pointwise truncations preserve the descent data. The quotient QCoh t-structure agrees by the imported cartesian-module description.
2. Mapping spaces between heart objects are discrete, so the higher coherent data reduces to the ordinary group-law cocycle. Apply the accepted heart/skew-ring correspondence. Stacks Proposition 96.14.3 independently verifies the ordinary quotient-groupoid interpretation.
3. Use the action prestack’s cartesian-module description: each point pulls the underlying torus module back from C, so a base-change-stable property holds on every point if it holds on C. Conversely the torus point detects it. Passing to fpqc sheafification preserves and reflects fpqc-local properties (DAG VIII 2.7.24), through the requested LP1 interface. Perfectness is covered by 2.7.20(7), fpqc locality from Proposition 2.6.15(10) and 2.7.28; finite local freeness by 2.7.31–32. Over C these are perfect derived objects and finite projective modules, respectively. This uses no quasi-compact infinite-group atlas.
4. At q=1 the trivial geometric action still permits arbitrary commuting invertible C-linear Γ_i. Over Q[x^{±1}] the rank-one action Γ=2·id is a vector bundle on the quotient and is not the trivial linearization. For formal q=1+h its version Γ=2σ is not congruent to identity modulo h and does not arise from an ordinary q-connection.

**Acceptance.**

- Finite projectives are the vector-bundle subcategory, not the entire heart.
- At q=1 the rank-one linearizations Γ=1 and Γ=2 over Q are distinct equivariant objects.
- Underlying perfection is preserved under the comparison; no compact-generation theorem for this infinite-group quotient is claimed.

**Direct prerequisites:** `HabiroCohomologyFoundations:HQ.1/descent-derived-quotient`, `HabiroCohomologyFoundations:HQ.1/torus-descent-for-modified-q-connections`, `HabiroCohomologyFoundations:HQ.1/modified-q-connections-on-a-torus`, `LanglandsParameterStacks:LP1`.

**Source match:** Proposition 96.14.3 (tag 06WT), statement and groupoid cocycle proof ([stacks-quotient](https://stacks.math.columbia.edu/tag/06WT)): Ordinary QCoh/groupoid descent only; the derived step comes from the preceding theorem and imported LP1 interfaces. Definition 2.6.14 and Proposition 2.6.15, printed pp.66–68; Definition 2.7.8 and Remark 2.7.12, printed pp.71–72; Proposition 2.7.20(7), Example 2.7.23 and Remark 2.7.24, printed pp.73–74; Proposition 2.7.28 and Propositions 2.7.31–32, printed pp.75–76 ([dag-viii](https://people.math.harvard.edu/~lurie/papers/DAG-VIII.pdf)): The cartesian-module description, base-change and fpqc locality, and perfect/dualizable and finite locally free criteria supply the local detection framework. The t-structure follows from the t-exact action limit, not from a pointwise coconnectivity assertion for arbitrary prestacks.

## Supplier requests and coverage

The stage is planned because every original target is either imported from the
accepted packet or represented by the seven declarations above, and every new
prerequisite has a precise owner. The stage is not closed: four supplier
interfaces have no exact supplying node yet. The packet records no additional
unexplained mathematical gap. These requests are explicit endpoints of the
plan, not a claim that the suppliers are implemented or independently accepted.

**`DerivedDeRhamCohomology:DD.1`.** For B=A[[h]] with h regular, the enhanced derived h-complete module category is closed under arbitrary limits and fibres; reduction M↦M⊗^L_B B/h detects equivalences between complete objects. Its two-term finite-free resolution identifies reduction with cofib(h), so it commutes with all enhanced limits. Provide the forgetful creation/detection of limits/equivalences for complete E∞ B-algebras. This is the principal regular case of DD.1, not an arbitrary ordinary I-adic tower formula.

Consumed by `HabiroCohomologyFoundations:HQ.1/descent-global-etale`, `HabiroCohomologyFoundations:HQ.1/descent-etale-sheaf`.

**`DerivedDeRhamCohomology:DD.2`.** For smooth finitely presented A-algebras and finite affine étale covers, ordinary Ω*_{S/A}→Tot Ω*_{T•/A} is an equivalence in the enhanced derived A-category. Use étale base change of each Ω^j, faithful-flat Amitsur exactness and the common finite range of form degrees; include finite-product compatibility and the affine Čech computation of de Rham hypercohomology on smooth separated finite-presentation schemes. No S-linearity of the de Rham differential is presumed.

Consumed by `HabiroCohomologyFoundations:HQ.1/descent-global-etale`, `HabiroCohomologyFoundations:HQ.1/descent-etale-sheaf`.

**`EnhancedDerivedSheaves:E2`.** Sheaves valued in a complete enhanced stable module category and its E∞-algebra category extend uniquely from the affine étale basis by covering Čech descent, with section objects given by limits; a finite affine open cover of a separated scheme computes sections. No unrestricted unbounded hyperdescent is needed.

Consumed by `HabiroCohomologyFoundations:HQ.1/descent-etale-sheaf`.

**`LanglandsParameterStacks:LP1`.** Apply LP1’s generic fpqc quotient and quasi-coherent descent prefix to an arbitrary discrete group G acting on a commutative affine ring C, including infinite G=Z^d. Define QCoh∞ on prestacks by cartesian enhanced modules (DAG VIII 2.7.8), affine value Mod_HC≃D(C) for the affine functor corepresented by the Eilenberg–Mac Lane E∞-ring HC, compatibly with enhanced pullback and tensor, send prestack colimits/coproducts to category limits/products, and prove fpqc sheafification invariance (2.7.14). Supply pullback, its symmetric monoidal coherence and limit mapping spectra, plus the pullback-detected t-structure and flat local detection of finite local freeness/perfectness (DAG VIII 2.7.20, 2.7.23–24, 2.7.28 and 2.7.31–32). Do not require the atlas Spec C→[Spec C/G] to be a quasi-compact fpqc morphism or use an affine finite constant-group scheme in place of the discrete sheaf.

Consumed by `HabiroCohomologyFoundations:HQ.1/descent-derived-modified`, `HabiroCohomologyFoundations:HQ.1/descent-derived-quotient`, `HabiroCohomologyFoundations:HQ.1/descent-heart-perfect`.

## Ownership, findings and assembly

**RT-AREA-etale/28.** The current atlas has not installed QWittVectors. The
accepted RS-10 integration contract therefore keeps the framed formal prefix
at HQ.1, and the present pass imports its existing ID. There are no new
q-partial derivative, Leibniz or Koszul nodes here. At QW promotion the prefix
must move once to an independent `QW.6:framings`, preceding QW.5, with old IDs
forwarded. It must work for I-completely étale framings for I=(h) and I=(p,h),
with complete flatness and the regularity needed for division by hT_i.
PR.6 imports the same prefix and takes the prime-complete specialization;
PR.6 retains q-PD envelopes, the q-crystalline site and the twisted prismatic
comparison. HQ.1 imports that single prefix. The q-Witt-consuming remainder
does not make the generic framing prefix depend on QW.5. No draft-only stage
is used as a current atlas supplier.

**RT-AREA-etale/29.** Ordinary framed and modified connections and their torus
heart are already in the accepted packet. This pass supplies the derived
coherent equivariance and quotient comparison they need. The distinct framed
Habiro coefficient ring, its γ_i and its uncompleted Koszul complex belong to
HQ.4 under accepted RS-10; HQ.3 applies descent to that construction and
compares it with the q-Hodge object. The original atlas edge HQ.4→HQ.3 stays.
HQ.2 retains the twisted q-de Rham constructions and Nygaard applications,
as PLAN-HABIRO §6.5 and accepted RS-10 require. The h-complete framed complex
imported here has its existing owner; none of these HQ.2/HQ.3/HQ.4 targets is
repeated in this follow-up.
The algebraic comparison exports a usable input for the draft analytic
consumers while making no analytic conclusion.

**RT-AREA-etale/32.** The global descent declaration explicitly depends on
`HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations`. Thus the Λ-ring
base is an actual declaration dependency, even though the old coarse stage
description omitted it. On QWittVectors promotion, the HR.1 pointer and its
forwarding ID move atomically to QW.1; HR.1 keeps its étale Frobenius
applications. The transfer does not create a second Λ-ring definition.

The two new planets are **Étale descent for q-de Rham cohomology** and
**Derived torus quotient comparison**. Assembly selects six planets in the
whole HQ.1 layer: these two, and the inherited Rationalised q-crystalline
comparison, Global q-de Rham complex, Coordinate-dependent q-de Rham complex
and Framed q-connections. The inherited Properties of the global q-de Rham
complex and Derived commutative lift stay as declarations, without additional
planet labels in the assembly. The follow-up leaves their accepted packet
unchanged; `planetSelection` records the precise reconciliation for assembly.

The unproved ordinary q-connection framing-independence conjecture is still
Scholze Conjecture 7.5. Transport of a complex's framed Čech diagram does not
prove it. V5A4 lecture notes are unavailable to this worker and have not been
read. No theorem about the analytic Habiro stack, its solid modules, an
unwritten comparison, or equality of normalization conventions is asserted.
These exclusions preserve the accepted packet's scope; they are not concealed
proofs or silently discharged prerequisites.

## Pinned library check and suggested forms

The pinned commits are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed HQ.1
library audit was read before planning. The completed independent review's
source-tree and declaration-index searches found no q-connection, quotient-stack,
coherent homotopy-fixed-point or derived-completion implementation. The native `AddMonoidAlgebra` and
`AlgEquiv` statements were read at the pins and supply the carriers for
`torusScale`; they are not replanned. The convolution formula on single
monomials is the routine finite-sum computation used by the scaling proof.

Mathlib's ordinary derived category and its quasi-coherent sheaf machinery
are present. In particular `SheafOfModules.QuasicoherentData` gives local
presentations and `IsQuasicoherent` asserts their existence. These statements
were read and do not supply enhanced quotient descent. Tau Ceti's
`ConstantGroup.functionAlgEquiv` assumes a finite group. Its affine
finite-group function algebra cannot be used as the infinite discrete group
sheaf in this packet. Existing carriers and near misses are distinguished
from the missing interface.

The [suggested file](../suggested/HabiroCohomologyFoundations--HQ.1-2.lean)
gives `torusScale`, its five API lemmas and four tests as native signatures.
The [independent review](../reviews/REV-HabiroCohomologyFoundations--HQ.1-2.md)
records successful elaboration of this scaling subset against pinned Mathlib,
with ten expected placeholder-proof warnings. This revision checks agreement
without claiming a new compilation. The file uses no Tau Ceti imports.

Six enhanced nodes cannot yet be expressed at the pins: the global qΩ functor,
complete E∞ target, enhanced action limit and quotient/QCoh functor are absent.
The omission inventory names four theorem/comparison signatures, two object
signatures, twelve non-constructor enhanced API items and seven enhanced tests
with their exact mathematical forms. Together with the six native scaling API
items and four native tests, every one of the packet's 21 API names and eleven
tests is represented by a signature or an explicit omission. The fifteen enhanced
API entries include three constructor items: `qOmegaEtale`,
`derivedModifiedQConnections` and `derivedModifiedQConnections.fromStrict`.
The enhanced entries are comments, not elaborated declarations. No opaque
proposition, axiom or artificially weakened condition replaces them. This is
the omission permitted by PROTOCOL section 13; elaboration of the algebraic
prototype does not establish elaboration of the entire plan.

## Sources read

The public sources, versions, hashes and access dates checked in the
completed independent review are recorded in the packet. Revision 2 preserves
that source provenance; its additional reads and access limits are recorded
in the [revision handoff](../handoff/BP-HabiroCohomologyFoundations--HQ.1-2~2.md).
The central readings are Wagner arXiv:2510.04782v2 Appendix A,
Theorem A.1 and its proof, and Scholze arXiv:1606.01796 §7, Definition 7.3,
Remark 7.4 and Conjecture 7.5. Lurie's *DAG VIII*, dated November 5, 2011,
§2.7 was read for the general functor-of-points quasi-coherent construction,
especially Proposition 2.7.6, Definition 2.7.8 and Proposition 2.7.14.
The local-property argument also uses Definition 2.6.14 and Proposition 2.6.15,
Proposition 2.7.20(7), Example 2.7.23, Remark 2.7.24, the monoidal construction
before Notation 2.7.27, and Propositions 2.7.28 and 2.7.31–32.
The latter, rather than a quasi-compact spectral-stack representability
theorem, provides the required sheafification argument. The Stacks Project
readings were tag 091N (complete limits and derived Nakayama), tag 03OY
(ordinary affine Čech descent), and tag 06WT (ordinary groupoid QCoh).
No current error was found in the passages used; `sourceIssues` is empty.

The upstream HodgeStructures and AdicSpaces documents were read for the
standard of exact conventions, reusable APIs, examples and ownership
boundaries. The accepted earlier packet, the reviewed library audit,
PLAN-HABIRO §6.5, accepted RS-10 round 2 and the relevant supplier stage
descriptions were read as planning inputs. They are not replacements for
primary mathematical sources. The remaining work is to resolve the four
supplier requests and assemble their exact declaration IDs with this pass
and the accepted packet; all mathematical targets in this follow-up already
have statements and explicit proof chains.
