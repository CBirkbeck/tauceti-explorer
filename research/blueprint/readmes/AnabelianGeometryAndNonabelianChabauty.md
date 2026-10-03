# Source-group naturality of twisting — current checkpoint

For a continuous homomorphism φ:H→*G, with explicit compatible actions on U, this continuation identifies the actual inner twists and directly constructs cocycle and H¹ pullbacks. The twisting translations commute with those maps; canonical comparison between cohomologous representatives also commutes with restriction. Surjectivity of φ implies injectivity. A constant source map can kill a nonneutral class, so restriction alone supplies no reflection theorem.

G and H carry arbitrary group topologies. U is a topological group and its actions are jointly continuous. No compactness, discreteness, commutativity or topological-group assumption on either source is inserted. The three constructions reuse the actual continuous cocycles, gauge-orbit H¹, inner actions and native group equivalences. Neither the direct cocycle map nor its quotient lift is defined by assuming its translation square.

The packet has 196 nodes, including these 21 new declarations and ten tests. All 175 inherited mathematical contracts remain; only the existing functoriality node gains three prerequisites and one proof step. NC.0 and NC.3 remain partial, and the five other incoming coverage statuses remain not_read. All nodes remain unchecked. The all-coefficient/all-degree K(π,1) owner and its qualified raw-homotopy comparison, RT8 NS/ρ ownership, Chen /57–58, complete BDMTV routes, E9/E10 and all existing requests remain intact.

The native proofs elaborate against the pinned Mathlib build. The complete canonical suggested file remains uncompiled because its actual Tau Ceti LowDegree import object is absent; its exact Mathlib projection is checked separately. These receipts support this checkpoint’s signatures and calculations, without closing the source or geometric obligations.

The selected primary reading is Kim’s exact [arXiv:math/0409456v1](https://arxiv.org/pdf/math/0409456v1), complete continuous cochain/cocycle/gauge definitions and Proposition 1 proof on printed pp.5–7, with the coefficient-functor paragraph and opening Proposition 2. The new source-group identities are authored deductions from those conventions, not printed geometric classification or representability theorems. Broader source routes and the genuine additive comparison remain open.

Write res_φ for inherited source restriction, j_c for the underlying group identification, τ_c for right-multiplication translation of cocycles, T_c for the resulting orbit-set equivalence and C_c,d=T_d⁻¹∘T_c for [c]=[d]. T_c sends the twisted neutral class to [c]. Identity and composition keep their actual dependent twist targets visible through these translation squares.

## Source comparison of actual inner twists

TauCeti.NonabelianCohomology.Twist.sourceEquiv

Construct e_φ,c:Twist(c)≃*Twist(res_φ c) as j_(res_φ c)⁻¹∘j_c. The underlying topological groups coincide; the following semiequivariance lemma compares their source actions.

Proof route: Compose the existing native group identifications, using the inverse in the target direction.

API:

- TauCeti.NonabelianCohomology.Twist.sourceEquiv_apply: For x∈Twist(c), j_(res_φ c)(e_φ,c(x))=j_c(x).
- TauCeti.NonabelianCohomology.Twist.sourceEquiv_symm_apply: For y∈Twist(res_φ c), j_c(e_φ,c⁻¹(y))=j_(res_φ c)(y).
- TauCeti.NonabelianCohomology.Twist.sourceEquiv_continuous: The function underlying e_φ,c is continuous for the actual inherited topologies.
- TauCeti.NonabelianCohomology.Twist.sourceEquiv_symm_continuous: The inverse function e_φ,c⁻¹ is continuous. Thus the actual group equivalence is also a homeomorphism.
- TauCeti.NonabelianCohomology.Twist.sourceEquiv_smul: For h∈H and x∈Twist(c), e_φ,c(φ(h)⋆_c x)=h⋆_(res_φ c)e_φ,c(x), using the actual G and H inner actions.
- TauCeti.NonabelianCohomology.Twist.sourceEquiv_gauge: For b∈U and x∈Twist(c), j_(res_φ(b•c))(e_φ,b•c(e_c,b(x)))=j_(b•res_φ c)(e_(res_φ c),b(e_φ,c(x))). Ordinary restriction identifies res_φ(b•c)=b•res_φ c; the equality is stated under the actual underlying identifications to retain the exact dependent targets.

Tests:

- Twist.sourceEquiv.test_inverse: For every φ,c,x, the actual inverse of e_φ,c applied to e_φ,c(x) is x.
- Twist.sourceEquiv.test_semilinear: For h∈H and x∈Twist(c), j_(res_φ c)(h⋆e_φ,c(x))=c(φ(h))(φ(h)•j_c(x))c(φ(h))⁻¹.
- Twist.sourceEquiv.test_noncommutative_action: Give S₂ and S₃ discrete topologies and the trivial original S₂-action on S₃; let c(nonidentity)=(01), φ=id, g=(01)∈S₂ and x=(12)∈Twist(c). Then j_(res_id c)(e_id,c(g⋆x))=(02), which differs from j_c(x)=(12). This rejects reuse of the raw trivial action on the inner twist.

## Value of the source comparison

TauCeti.NonabelianCohomology.Twist.sourceEquiv_apply

For x∈Twist(c), j_(res_φ c)(e_φ,c(x))=j_c(x).

Proof route: Unfold the composed native equivalence.

## Inverse source comparison

TauCeti.NonabelianCohomology.Twist.sourceEquiv_symm_apply

For y∈Twist(res_φ c), j_c(e_φ,c⁻¹(y))=j_(res_φ c)(y).

Proof route: Unfold the inverse native equivalence.

## Continuity of source comparison

TauCeti.NonabelianCohomology.Twist.sourceEquiv_continuous

The function underlying e_φ,c is continuous for the actual inherited topologies.

Proof route: Under j_c and j_(res_φ c) the function is the identity on U; use continuity of the identity.

## Continuity of inverse source comparison

TauCeti.NonabelianCohomology.Twist.sourceEquiv_symm_continuous

The inverse function e_φ,c⁻¹ is continuous. Thus the actual group equivalence is also a homeomorphism.

Proof route: The inverse is the same identity map on the inherited topology.

## Source semiequivariance of inner twists

TauCeti.NonabelianCohomology.Twist.sourceEquiv_smul

For h∈H and x∈Twist(c), e_φ,c(φ(h)⋆_c x)=h⋆_(res_φ c)e_φ,c(x), using the actual G and H inner actions.

Proof route: Apply j_(res_φ c) injectively. Both sides contain the same c(φ(h)) and its inverse; replace h•j_c(x) by φ(h)•j_c(x) using the explicit action compatibility.

## Pullback of actual twisted cocycles

TauCeti.NonabelianCohomology.Z1.twistRes

Construct R¹_φ,c:Z¹(G,Twist(c))→Z¹(H,Twist(res_φ c)) by R¹_φ,c(z)(h)=e_φ,c(z(φ(h))). This is a directly defined continuous cocycle, prior to proving the translation square.

Proof route: Compose continuous maps. Apply the actual cocycle equation to φ(h)φ(k), use multiplicativity of e_φ,c and its semiequivariance.

API:

- TauCeti.NonabelianCohomology.Z1.twistRes_apply: For every h∈H, R¹_φ,c(z)(h)=e_φ,c(z(φ(h))).
- TauCeti.NonabelianCohomology.Z1.twistRes_one: R¹_φ,c sends the constant one cocycle to the constant one cocycle.
- TauCeti.NonabelianCohomology.Z1.twistRes_smul: For x∈Twist(c) and z∈Z¹(G,Twist(c)), R¹_φ,c(x•z)=e_φ,c(x)•R¹_φ,c(z). This uses the actual gauge actions for their distinct inner source actions.
- TauCeti.NonabelianCohomology.Z1.twistRes_translation: For z∈Z¹(G,Twist(c)), τ_(res_φ c)(R¹_φ,c(z))=res_φ(τ_c(z)) as actual continuous cocycles.
- TauCeti.NonabelianCohomology.Z1.twistRes_injective: If φ is surjective as a function, then R¹_φ,c is injective. Neither continuity nor group-homomorphism structure alone implies this conclusion.

Tests:

- Z1.twistRes.test_identity: For φ=id and every twisted cocycle z and g, j_(res_id c)(R¹_id,c(z)(g))=j_c(z(g)).
- Z1.twistRes.test_gauge_translation: For x∈Twist(c) and z a twisted cocycle, τ_(res_φ c)(R¹_φ,c(x•z))=j_c(x)•res_φ(τ_c(z)).
- Z1.twistRes.test_surjective_detection: For surjective φ, R¹_φ,c(z)=1 iff z=1; the actual cocycle pullback detects the neutral cocycle.

## Value of twisted cocycle pullback

TauCeti.NonabelianCohomology.Z1.twistRes_apply

For every h∈H, R¹_φ,c(z)(h)=e_φ,c(z(φ(h))).

Proof route: Unfold the directly defined cocycle map.

## Neutral twisted cocycle pullback

TauCeti.NonabelianCohomology.Z1.twistRes_one

R¹_φ,c sends the constant one cocycle to the constant one cocycle.

Proof route: Use cocycle extensionality and multiplicativity of the native equivalence at one.

## Gauge compatibility of twisted pullback

TauCeti.NonabelianCohomology.Z1.twistRes_smul

For x∈Twist(c) and z∈Z¹(G,Twist(c)), R¹_φ,c(x•z)=e_φ,c(x)•R¹_φ,c(z). This uses the actual gauge actions for their distinct inner source actions.

Proof route: Evaluate at h. Expand the ordered gauge formula, preserve products/inverses with e_φ,c, and use its semiequivariance.

## Twisting and source restriction square

TauCeti.NonabelianCohomology.Z1.twistRes_translation

For z∈Z¹(G,Twist(c)), τ_(res_φ c)(R¹_φ,c(z))=res_φ(τ_c(z)) as actual continuous cocycles.

Proof route: Evaluate at h. The left side is j_c(z(φ(h)))c(φ(h)); this is the right side by ordinary restriction and the inherited translation formula.

## Source restriction on twisted orbit sets

TauCeti.NonabelianCohomology.H1.twistRes

Construct R_φ,c:H¹(G,Twist(c))→H¹(H,Twist(res_φ c)) by [z]↦[R¹_φ,c(z)] on the actual native gauge-orbit quotient.

Proof route: Lift the directly constructed cocycle pullback to the native quotient. A gauge witness x maps to the witness e_φ,c(x), by cocycle gauge compatibility.

API:

- TauCeti.NonabelianCohomology.H1.twistRes_mk: For every actual twisted cocycle z, R_φ,c([z])=[R¹_φ,c(z)].
- TauCeti.NonabelianCohomology.H1.twistRes_one: R_φ,c(1)=1 in H¹(H,Twist(res_φ c)). The target neutral point is in the twisted target, while T_(res_φ c)(1)=[res_φ c] in the original coefficient H¹.
- TauCeti.NonabelianCohomology.H1.twistRes_translation: For every a∈H¹(G,Twist(c)), T_(res_φ c)(R_φ,c(a))=res_φ(T_c(a)) in the original H¹(H,U). This square is proved for the direct quotient lift, not inserted into its definition.
- TauCeti.NonabelianCohomology.H1.twistRes_injective: If φ is surjective as a function, then R_φ,c is injective on the actual H¹ orbit sets. In particular it reflects their neutral classes.
- TauCeti.NonabelianCohomology.H1.twistRes_representative: If [c]=[d], then R_φ,d∘C_c,d=C_(res_φ c),(res_φ d)∘R_φ,c. The target class equality is res_φ([c])=res_φ([d]); no gauge witness or canonical coefficient-group isomorphism is chosen.
- TauCeti.NonabelianCohomology.H1.twistRes_identity_translation: For the identity source map on G, T_(res_id c)(R_id,c(a))=T_c(a). This states the identity law with the actual dependent twist targets visible; no arbitrary identification of actions is suppressed.
- TauCeti.NonabelianCohomology.H1.twistRes_comp_translation: For ψ:K→*H and φ:H→*G with continuous maps and compatible K,H,G actions, T_(res_ψ(res_φ c))(R_ψ,res_φ c(R_φ,c(a)))=res_(φ∘ψ)(T_c(a)). The composite compatibility is k•x=ψ(k)•x=φ(ψ(k))•x. Applying the one-step square to φ∘ψ gives the same translated value; comparisons of dependent twist targets are explicit.

Tests:

- H1.twistRes.test_neutral: T_(res_φ c)(R_φ,c(1))=[res_φ c], retaining the repointed target; this value need not be neutral in the original coefficient H¹.
- H1.twistRes.test_gauge_classes: For x∈Twist(c) and a cocycle z, R_φ,c([x•z])=R_φ,c([z]) on the actual gauge-orbit quotient.
- H1.twistRes.test_surjective_reflection: For surjective φ, R_φ,c(a)=1 iff a=1 on the actual twisted H¹ orbit sets.
- H1.twistRes.test_nonsurjective_loss: If φ(h)=1 for every h and [c]≠1 in the original H¹, then a=T_c⁻¹(1) is nonneutral but R_φ,c(a)=1. The existing discrete S₂→S₃ cocycle supplies a consistent nonneutral c, with trivial original actions and the constant homomorphism. This rejects injectivity or neutral reflection without surjectivity.

## Representative of twisted H¹ restriction

TauCeti.NonabelianCohomology.H1.twistRes_mk

For every actual twisted cocycle z, R_φ,c([z])=[R¹_φ,c(z)].

Proof route: Unfold the native quotient lift.

## Pointedness of twisted source restriction

TauCeti.NonabelianCohomology.H1.twistRes_one

R_φ,c(1)=1 in H¹(H,Twist(res_φ c)). The target neutral point is in the twisted target, while T_(res_φ c)(1)=[res_φ c] in the original coefficient H¹.

Proof route: Use the representative formula and the neutral cocycle pullback.

## Source naturality of the twisting equivalence

TauCeti.NonabelianCohomology.H1.twistRes_translation

For every a∈H¹(G,Twist(c)), T_(res_φ c)(R_φ,c(a))=res_φ(T_c(a)) in the original H¹(H,U). This square is proved for the direct quotient lift, not inserted into its definition.

Proof route: Choose a cocycle representative of a; use quotient evaluation and the actual cocycle translation square.

## Source comparison and gauge conjugation

TauCeti.NonabelianCohomology.Twist.sourceEquiv_gauge

For b∈U and x∈Twist(c), j_(res_φ(b•c))(e_φ,b•c(e_c,b(x)))=j_(b•res_φ c)(e_(res_φ c),b(e_φ,c(x))). Ordinary restriction identifies res_φ(b•c)=b•res_φ c; the equality is stated under the actual underlying identifications to retain the exact dependent targets.

Proof route: Both sides are b j_c(x)b⁻¹. Use the native identification formulas and the ordinary cocycle restriction/gauge identity.

## Surjective source maps detect twisted cocycles

TauCeti.NonabelianCohomology.Z1.twistRes_injective

If φ is surjective as a function, then R¹_φ,c is injective. Neither continuity nor group-homomorphism structure alone implies this conclusion.

Proof route: Translate both inputs by τ_c, apply ordinary source restriction injectivity, and use the proved cocycle translation square and injectivity of τ_c.

## Surjective source maps detect twisted classes

TauCeti.NonabelianCohomology.H1.twistRes_injective

If φ is surjective as a function, then R_φ,c is injective on the actual H¹ orbit sets. In particular it reflects their neutral classes.

Proof route: Compare after T_c; ordinary H¹ restriction is injective for a surjective φ. Apply the translation square and cancel T_c.

## Source naturality of representative comparison

TauCeti.NonabelianCohomology.H1.twistRes_representative

If [c]=[d], then R_φ,d∘C_c,d=C_(res_φ c),(res_φ d)∘R_φ,c. The target class equality is res_φ([c])=res_φ([d]); no gauge witness or canonical coefficient-group isomorphism is chosen.

Proof route: Apply injectivity of T_(res_φ d). The representative square and the two source translation squares identify both sides with res_φ(T_c(a)).

## Identity law under twisting translation

TauCeti.NonabelianCohomology.H1.twistRes_identity_translation

For the identity source map on G, T_(res_id c)(R_id,c(a))=T_c(a). This states the identity law with the actual dependent twist targets visible; no arbitrary identification of actions is suppressed.

Proof route: Use the source translation square and the ordinary H¹ identity law.

## Composition law under twisting translation

TauCeti.NonabelianCohomology.H1.twistRes_comp_translation

For ψ:K→*H and φ:H→*G with continuous maps and compatible K,H,G actions, T_(res_ψ(res_φ c))(R_ψ,res_φ c(R_φ,c(a)))=res_(φ∘ψ)(T_c(a)). The composite compatibility is k•x=ψ(k)•x=φ(ψ(k))•x. Applying the one-step square to φ∘ψ gives the same translated value; comparisons of dependent twist targets are explicit.

Proof route: Apply the two source translation squares successively, then the ordinary H¹ source composition law.

## Remaining work

Source-group naturality is supplied for continuous φ:H→*G with explicit action compatibility on U: the underlying actual inner twists, direct continuous cocycle pullback, native H¹ quotient lift, repointed translation squares, gauge conjugation and canonical representative comparison are compatible. Surjective φ gives injectivity and neutral reflection; a constant source map can kill a nonneutral class. Identity/composition are stated with actual dependent twists via their translations. Twisted subgroup/normal-quotient realizations, geometric local conditions, genuine additive comparison, unipotent point topologies, torsor classification, representability and all source/supplier obligations remain open.

The actual arithmetic supplier R02.6 is about adjoint patching inequalities, including infinity and p=2, rather than an automatic supplier for all nonabelian Selmer geometry. This abstract continuation consumes no new Galois/Selmer theorem from it.

---

# Gauge transport and cocycle representatives — continuation

Partial anabelian checkpoint with 175 declaration-sized nodes. Nineteen new native interfaces give continuous equivariant gauge conjugation between actual inner twists and the canonical pointed H¹ comparison for cohomologous representatives, with identity, inverse, composition and concrete gauge realization. Six tests retain the noncommutative conjugation direction and the class-equality requirement. All 156 inherited contracts and every key/source/supplier/omission boundary remain. All seven stages remain partial; no geometric torsor, K(π,1), Selmer or source route is closed.

Kim’s [exact v1 PDF](https://arxiv.org/pdf/math/0409456v1), §1, pp.5–7 gives the continuous cocycle/gauge conventions and the statement that equivalent cocycles yield isomorphic actions. The following general topological-group identities are authored deductions. They concern the actual inner twist of a coefficient group; no geometric torsor or Selmer comparison is inferred.

G is a group with a topology; U is a topological group with a jointly continuous G-action by automorphisms. G itself need not be a topological group. Every c,d,e named below is an actual continuous cocycle. No finiteness, discreteness, compactness or commutativity hypothesis is assumed.
The gauge action is (b•c)(g)=b c(g) g(b)⁻¹. Twist(c) has the underlying group/topology U and action g⋆x=c(g)g(x)c(g)⁻¹. Write j_c:Twist(c)≃*U for the inherited underlying identification, τ_c(z)(g)=j_c(z(g))c(g), and T_c:H¹(G,Twist(c))≃H¹(G,U) for the actual gauge-orbit equivalence. T_c sends 1 to [c].
The comparison C_c,d requires the equality h:[c]=[d] in the actual original H¹. Its underlying formula is T_d⁻¹∘T_c; the equality h ensures preservation of the neutral class. A gauge element is not chosen to define C_c,d. The coefficient-group conjugation isomorphism depends on a supplied b and is not claimed independent of b.

For clarity, e_c,b depends on b and acts on the actual coefficient group. In contrast, C_c,d is defined directly on the two native cohomology orbit sets by the common original target. The equality [c]=[d] is the reason it preserves the neutral class. Conjugation acts nontrivially on S₃ even in examples where an induced action on cohomology is canonical.

## Continuous gauge transport between inner twists

`TauCeti.NonabelianCohomology.Twist.gaugeEquiv` — For c∈Z¹(G,U) and b∈U, construct the native group equivalence e_c,b:Twist(c)≃*Twist(b•c) whose underlying map is x↦b j_c(x)b⁻¹. Its inverse is conjugation by b⁻¹; the following API proves continuity and G-equivariance.

Proof: Reuse MulAut.conj b on the existing twist synonyms; their group structures and topologies are the inherited ones on U. No new general conjugation or topological-group carrier is introduced.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-underlying-group`, `mathlib:MulAut.conj`.

## Gauge transport value

`TauCeti.NonabelianCohomology.Twist.gaugeEquiv_apply` — For x∈Twist(c), j_(b•c)(e_c,b(x))=b j_c(x)b⁻¹.

Proof: Evaluate the native conjugation map and the inherited underlying identifications.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/gauge-equivalence`.

## Inverse gauge transport value

`TauCeti.NonabelianCohomology.Twist.gaugeEquiv_symm_apply` — For y∈Twist(b•c), j_c(e_c,b⁻¹(y))=b⁻¹ j_(b•c)(y)b, where e_c,b⁻¹ denotes the inverse equivalence, not transport to an unspecified twist.

Proof: Evaluate the inverse function of the same native MulAut.conj equivalence.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/gauge-equivalence`.

## Continuity of gauge transport

`TauCeti.NonabelianCohomology.Twist.gaugeEquiv_continuous` — The monoid homomorphism underlying e_c,b is continuous for the actual inherited topologies.

Proof: Use continuity of multiplication with the two constant factors b,b⁻¹ and the identity function.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/gauge-value`.

## Continuity of inverse gauge transport

`TauCeti.NonabelianCohomology.Twist.gaugeEquiv_symm_continuous` — The inverse function of e_c,b is continuous for the actual inherited topologies. Thus the group equivalence is a homeomorphism as well as an algebraic isomorphism.

Proof: Use the explicit inverse formula and continuity of multiplication by the constants b⁻¹ and b.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/gauge-inverse-value`.

## Equivariance of gauge transport

`TauCeti.NonabelianCohomology.Twist.gaugeEquiv_smul` — For every g∈G and x∈Twist(c), e_c,b(g⋆_c x)=g⋆_(b•c)e_c,b(x). Both sides use their actual, generally different, inner actions.

Proof: Expand both inner actions and (b•c)(g)=b c(g)g(b)⁻¹. Distribute g over products/inverses, then cancel adjacent inverse pairs without commuting factors.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/gauge-value`, `AnabelianGeometryAndNonabelianChabauty:NC.3/twisting`, `AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles`.

## Identity gauge transport

`TauCeti.NonabelianCohomology.Twist.gaugeEquiv_one` — Under the native underlying identifications, e_c,1 is the identity: j_(1•c)(e_c,1(x))=j_c(x).

Proof: Evaluate the conjugation formula at the group identity.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/gauge-value`.

## Ordered composition of gauge transports

`TauCeti.NonabelianCohomology.Twist.gaugeEquiv_comp` — For a,b∈U and x∈Twist(c), j_(a•(b•c))(e_(b•c),a(e_c,b(x)))=j_((ab)•c)(e_c,ab(x)). The resulting gauge element is ab; the cocycle targets agree by the gauge action law.

Proof: Expand both conjugations and cancel the middle b⁻¹a⁻¹ against the inverse of ab in the prescribed order. Compare through the existing underlying identifications to avoid an implicit choice of dependent transport.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/gauge-value`, `AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles`.

## Cocycle translation under gauge transport

`TauCeti.NonabelianCohomology.Z1.twistEquiv_gaugeMap` — For z∈Z¹(G,Twist(c)), τ_(b•c)((e_c,b)_*z)=b•τ_c(z), where the pushforward is the existing continuous equivariant coefficient map on cocycles. This is equality of actual cocycles, with the ordered products unchanged.

Proof: Apply cocycle extensionality; expand the coefficient map, τ and the gauge formula. The adjacent b⁻¹b cancels, leaving b(j_c(z(g))c(g))g(b)⁻¹.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/gauge-equivariance`, `AnabelianGeometryAndNonabelianChabauty:NC.3/gauge-continuity`, `AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-cocycle-map`, `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-cocycle-value`, `AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles`.

## Cohomology translation under gauge transport

`TauCeti.NonabelianCohomology.H1.twistEquiv_gaugeMap` — For every a∈H¹(G,Twist(c)), T_(b•c)((e_c,b)_*a)=T_c(a), with the pushforward supplied by the actual coefficient map on H¹.

Proof: Choose a native cocycle representative, apply the cocycle square and use that a gauge translate has the same original H¹ class.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/gauge-cocycle-square`, `AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-h1-map`, `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-h1-representative`, `AnabelianGeometryAndNonabelianChabauty:NC.3/h1-gauge-class`.

## Canonical comparison for cohomologous representatives

`TauCeti.NonabelianCohomology.H1.changeRepresentative` — For c,d∈Z¹(G,U) with h:[c]=[d], construct C_c,d:H¹(G,Twist(c))≃H¹(G,Twist(d)) by T_d⁻¹∘T_c. The formula makes no choice of a gauge witness; its pointedness is proved separately using h.

Proof: Compose the inherited actual orbit-set equivalences T_c and T_d⁻¹ using native Equiv composition. The original class equality is retained as an input to the comparison API.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-h1-equivalence`, `mathlib:Equiv.trans`, `mathlib:Equiv.symm`.

## Representative comparison value

`TauCeti.NonabelianCohomology.H1.changeRepresentative_apply` — For h:[c]=[d] and a∈H¹(G,Twist(c)), C_c,d(a)=T_d⁻¹(T_c(a)).

Proof: Evaluate the native composite equivalence.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/representative-equivalence`.

## Neutral class under representative comparison

`TauCeti.NonabelianCohomology.H1.changeRepresentative_one` — For h:[c]=[d], C_c,d(1)=1. Equality of the original classes is essential; the raw composite for arbitrary unrelated cocycles need not be pointed.

Proof: Apply injectivity of T_d; its value on the left is T_c(1)=[c] and its value on the right is [d]. Use h.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/representative-value`, `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-h1-equivalence`, `mathlib:Equiv.injective`, `mathlib:Equiv.apply_symm_apply`.

## Representative comparison equals gauge pushforward

`TauCeti.NonabelianCohomology.H1.changeRepresentative_gauge` — For b∈U and h:[c]=[b•c] supplied by the actual gauge-class lemma, C_c,b•c equals the existing H¹ pushforward induced by e_c,b, as a function on H¹(G,Twist(c)).

Proof: Apply injectivity of T_(b•c) to each argument. Both sides become T_c(a), by cancellation of inverse equivalences and the proved H¹ gauge square.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/representative-value`, `AnabelianGeometryAndNonabelianChabauty:NC.3/gauge-h1-square`, `AnabelianGeometryAndNonabelianChabauty:NC.3/h1-gauge-class`, `mathlib:Equiv.injective`, `mathlib:Equiv.apply_symm_apply`.

## Identity representative comparison

`TauCeti.NonabelianCohomology.H1.changeRepresentative_id` — C_c,c is the native identity equivalence of H¹(G,Twist(c)).

Proof: Use equivalence extensionality and cancel T_c⁻¹ after T_c at each point.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/representative-value`, `mathlib:Equiv.symm_apply_apply`.

## Composition of representative comparisons

`TauCeti.NonabelianCohomology.H1.changeRepresentative_comp` — Given h_cd:[c]=[d] and h_de:[d]=[e], composing C_c,d followed by C_d,e equals C_c,e for h_cd.trans(h_de), as native equivalences.

Proof: Expand the composites at an arbitrary class and cancel the adjacent T_d∘T_d⁻¹. No gauge representatives or group multiplication choices enter.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/representative-value`, `mathlib:Equiv.apply_symm_apply`.

## Inverse representative comparison

`TauCeti.NonabelianCohomology.H1.changeRepresentative_symm` — For h:[c]=[d], the inverse of C_c,d is C_d,c with the symmetric class equality.

Proof: Unfold the inverse of the native composite equivalence; its two functions are the reversed pair of twisting equivalences.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/representative-equivalence`, `mathlib:Equiv.symm`.

## Common translation of representative comparisons

`TauCeti.NonabelianCohomology.H1.changeRepresentative_twistEquiv` — For h:[c]=[d] and a∈H¹(G,Twist(c)), T_d(C_c,d(a))=T_c(a).

Proof: Cancel T_d after its inverse in the defining formula.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/representative-value`, `mathlib:Equiv.apply_symm_apply`.

## Uniqueness from the twisting comparison square

`TauCeti.NonabelianCohomology.H1.changeRepresentative_eq_map` — Fix h:[c]=[d]. If f:Twist(c)→*Twist(d) is continuous and G-equivariant and its actual H¹ pushforward satisfies T_d(f_*a)=T_c(a) for every a, then f_* equals C_c,d. The square is an explicit hypothesis for this uniqueness lemma, and is already proved for the concrete gauge maps above.

Proof: At each a, compare C_c,d(a) and f_*a by injectivity of T_d, using the representative square and the given square for f.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/representative-square`, `AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-h1-map`, `mathlib:Equiv.injective`.

## Tests for continuous gauge transport between inner twists

- `Twist.gaugeEquiv.test_inverse` (compatibility): For any c,b,x, the inverse of e_c,b applied to e_c,b(x) is x.
- `Twist.gaugeEquiv.test_identity` (degenerate): For b=1, gauge transport is the identity under the actual underlying group identifications.
- `Twist.gaugeEquiv.test_noncommutative_direction` (non-example): Give S₂ and S₃ discrete topologies and the trivial original S₂-action on S₃. Let c send the nonidentity element to (01), and let b=(01)(12). Then e_c,b sends (01) to (12), whereas b⁻¹(01)b is not (12). This rejects conjugation in the reverse direction.

## Tests for canonical comparison for cohomologous representatives

- `H1.changeRepresentative.test_neutral` (degenerate): For equal original classes [c]=[d], the actual comparison C_c,d sends the neutral twisted class to the neutral twisted class.
- `H1.changeRepresentative.test_nonneutral` (non-example): If [c]=[d] is nonneutral, C_c,d(T_c⁻¹(1)) is nonneutral in H¹(G,Twist(d)), even though its translation by T_d is the original neutral class. The comparison cannot be replaced by the constant neutral map.
- `H1.changeRepresentative.test_class_hypothesis` (non-example): If [c] is nonneutral, the raw composite T_1⁻¹∘T_c sends the neutral twisted class to a nonneutral class. Dropping equality of the original classes invalidates pointedness.

## Boundary and ownership

Continuous gauge conjugation between inner twists and the canonical pointed H¹ comparison for cohomologous representatives are now specified with checked native proofs, including the gauge-pushforward comparison and composition law. The group isomorphism still depends on a supplied gauge element; only the specified H¹ comparison avoids a gauge-witness choice. Source-group naturality, actual twisted subgroup/quotient realization, compatibility with local conditions, the genuine additive comparison, unipotent point topologies and all geometric/representability/source obligations remain open.

The reserved all-coefficient/all-degree étale K(π,1) node, its restricted raw-homotopy comparison, the NS/Picard-number import from A2, and the Chen/BDMTV obligations including E9/E10 are unchanged. NC.6 remains a process endpoint. This slice adds no foreign stage requirement or generic conjugation/cohomology carrier. The fresh R02.6 stage read specifies patching adjoint inequalities; these abstract gauge results use no new Galois or Selmer theorem from that stage, and the broader inherited geometric arithmetic interfaces remain open.

The two new constructions have seventeen API records and six tests. All nineteen signatures are represented in the suggested file; the separate proof archive checks their actual native implementations. The canonical file retains its inherited Tau Ceti import boundary, so only the explicitly documented Mathlib projection can be checked in the available build.

---

# Preserved incoming reader

# Coefficient naturality of inner twisting

This continuation specifies actual continuous equivariant coefficient homomorphisms between inner twists and their cocycle/H¹ squares. All implementation statuses remain unchecked.

G is a group with a topology. U,V,W are topological groups with jointly continuous G-actions by automorphisms. c∈Z¹(G,U) is an actual continuous cocycle. G need not be a topological group for these formulas.

f:U→*V is continuous and G-equivariant; where used f′:V→*W has the same hypotheses. Neither map is assumed injective, surjective, closed or split.

Twist(c) has the original underlying group/topology and inner action g⋆x=c(g)g(x)c(g)⁻¹. Write j_c for its native underlying group identification, τ_c(d)(g)=j_c(d(g))c(g), and T_c for the induced actual H¹ gauge-orbit equivalence. The target is repointed at [c]; no preservation of its original neutral point is asserted.

## Coefficient homomorphism between inner twists

Declaration: `TauCeti.NonabelianCohomology.Twist.map` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-map`).

Construct the continuous equivariant group homomorphism f_c:Twist(c)→*Twist(f∘c) with j_(f∘c)(f_c(x))=f(j_c(x)). Its underlying homomorphism is exactly f.

Proof plan: Use the existing underlying group/topology synonyms and the actual mapped cocycle f∘c. Reuse f as the group homomorphism. Continuity is hf; equivariance expands to f(c(g)g(x)c(g)⁻¹)=f(c(g))g(f(x))f(c(g))⁻¹ by multiplicativity, preservation of inverse and the given original equivariance.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twisting`, `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-underlying-group`, `AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-cocycle-map`.

API `TauCeti.NonabelianCohomology.Twist.map_apply`: For every x∈Twist(c), j_(f∘c)(f_c(x))=f(j_c(x)).

API `TauCeti.NonabelianCohomology.Twist.map_continuous`: The actual coefficient homomorphism f_c:Twist(c)→Twist(f∘c) is continuous.

API `TauCeti.NonabelianCohomology.Twist.map_smul`: For every g∈G and x∈Twist(c), f_c(g⋆x)=g⋆f_c(x), with the target action twisted by f∘c.

API `TauCeti.NonabelianCohomology.Twist.map_id`: For every c, the twisted coefficient map induced by id_U equals id_(Twist(c)) as a native group homomorphism.

API `TauCeti.NonabelianCohomology.Twist.map_comp`: For every c, (f′∘f)_c=(f′)_(f∘c)∘f_c as native group homomorphisms, with the actual composite continuity and equivariance proofs.

API `TauCeti.NonabelianCohomology.Z1.twistEquiv_map`: For every d∈Z¹(G,Twist(c)), τ_(f∘c)((f_c)_*d)=f_*(τ_c(d)) as actual continuous cocycles.

API `TauCeti.NonabelianCohomology.H1.twistEquiv_map`: For every a∈H¹(G,Twist(c)), T_(f∘c)((f_c)_*a)=f_*(T_c(a)).

## Value of a twisted coefficient map

Declaration: `TauCeti.NonabelianCohomology.Twist.map_apply` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-value`).

For every x∈Twist(c), j_(f∘c)(f_c(x))=f(j_c(x)).

Proof plan: Evaluate the actual homomorphism on the underlying synonym; the equality is definitional.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-map`.

## Continuity of a twisted coefficient map

Declaration: `TauCeti.NonabelianCohomology.Twist.map_continuous` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-continuity`).

The actual coefficient homomorphism f_c:Twist(c)→Twist(f∘c) is continuous.

Proof plan: Both topologies are the inherited coefficient topologies. The actual continuity proof is hf.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-map`.

## Equivariance between the two twisted actions

Declaration: `TauCeti.NonabelianCohomology.Twist.map_smul` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-equivariance`).

For every g∈G and x∈Twist(c), f_c(g⋆x)=g⋆f_c(x), with the target action twisted by f∘c.

Proof plan: Apply injectivity of j_(f∘c) to compare values in V. Expand both actual inner actions, apply map_mul twice, map_inv, and original G-equivariance. Do not commute any factors.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-map`, `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-value`.

## Identity coefficient map under twisting

Declaration: `TauCeti.NonabelianCohomology.Twist.map_id` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-identity`).

For every c, the twisted coefficient map induced by id_U equals id_(Twist(c)) as a native group homomorphism.

Proof plan: The mapped cocycle under the identity and both underlying homomorphisms agree definitionally.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-map`.

## Composition of twisted coefficient maps

Declaration: `TauCeti.NonabelianCohomology.Twist.map_comp` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-composition`).

For every c, (f′∘f)_c=(f′)_(f∘c)∘f_c as native group homomorphisms, with the actual composite continuity and equivariance proofs.

Proof plan: Use the definitional equality of mapped cocycles under composition and the original native homomorphism composition. The topology/action proof arguments do not change the underlying homomorphism.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-map`.

## Coefficient naturality of the cocycle twisting equivalence

Declaration: `TauCeti.NonabelianCohomology.Z1.twistEquiv_map` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-cocycle-square`).

For every d∈Z¹(G,Twist(c)), τ_(f∘c)((f_c)_*d)=f_*(τ_c(d)) as actual continuous cocycles.

Proof plan: Apply actual cocycle extensionality. At g the left side is f(j_c(d(g)))f(c(g)), while the right side is f(j_c(d(g))c(g)); map_mul identifies them in exactly this order.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-continuity`, `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-equivariance`, `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-cocycle-equivalence`, `AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-cocycle-map`.

## Coefficient naturality of inverse cocycle twisting

Declaration: `TauCeti.NonabelianCohomology.Z1.twistEquiv_symm_map` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-inverse-cocycle-square`).

For every e∈Z¹(G,U), τ_(f∘c)⁻¹(f_*e)=(f_c)_*(τ_c⁻¹(e)) as actual continuous cocycles.

Proof plan: Apply injectivity of the actual equivalence τ_(f∘c), then use the forward square and both actual inverse identities. No injectivity of f is used.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-cocycle-square`.

## Coefficient naturality on the actual H¹ orbit quotient

Declaration: `TauCeti.NonabelianCohomology.H1.twistEquiv_map` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-h1-square`).

For every a∈H¹(G,Twist(c)), T_(f∘c)((f_c)_*a)=f_*(T_c(a)).

Proof plan: Choose an actual cocycle representative via H1.mk_surjective. Evaluate both native quotient maps on that representative using map_mk and twistEquiv_mk; the actual cocycle square identifies their images.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-cocycle-square`, `AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-h1-map`, `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-h1-equivalence`.

## Coefficient naturality of inverse H¹ twisting

Declaration: `TauCeti.NonabelianCohomology.H1.twistEquiv_symm_map` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-inverse-h1-square`).

For every a∈H¹(G,U), T_(f∘c)⁻¹(f_*a)=(f_c)_*(T_c⁻¹(a)).

Proof plan: Apply injectivity of the actual orbit equivalence T_(f∘c), use the forward H¹ square and its actual inverse identities.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-h1-square`.

## Mapped base point of the twisted H¹ equivalence

Declaration: `TauCeti.NonabelianCohomology.H1.twistEquiv_map_one` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-repointed-neutral`).

For every c and f, f_*(T_c(1))=[f∘c]. The image is the mapped chosen class, not necessarily the original target neutral point.

Proof plan: Use T_c(1)=[c] and the coefficient quotient map on the actual representative c.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-h1-square`, `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-h1-equivalence`, `AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-h1-map`.

## Neutral fibre after coefficient twisting and repointing

Declaration: `TauCeti.NonabelianCohomology.H1.twistEquiv_map_fibre` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-repointed-fibre`).

For every a∈H¹(G,Twist(c)), f_*(T_c(a))=[f∘c] if and only if (f_c)_*(a)=1. This identifies the actual fibre over the mapped chosen class without asserting injectivity of the coefficient map.

Proof plan: Rewrite f_*T_c(a) using the proved coefficient/H¹ square. The actual equivalence T_(f∘c) sends exactly the source neutral class to [f∘c], so its neutral-fibre criterion gives the equivalence.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-coefficient-h1-square`, `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-h1-neutral-fibre`.

Acceptance `twistCoefficientTests.value` (compatibility): For every x, the actual twisted coefficient value is f(j_c(x)) under the target underlying-group identification.

Acceptance `twistCoefficientTests.identity` (degenerate): The actual twisted identity coefficient map fixes every x.

Acceptance `twistCoefficientTests.constant` (non-example): The constant-one coefficient homomorphism maps every twisted x to 1; no coefficient injectivity can be inferred from the twisting square.

Acceptance `twistCoefficientTests.cocycle_square` (compatibility): The actual continuous cocycle coefficient square commutes, with multiplication by c(g) on the right.

Acceptance `twistCoefficientTests.repointed_neutral` (characterisation): The image of T_c(1) under the actual coefficient H¹ map is the gauge class [f∘c].

Source: [Kim, exact v1 PDF](https://arxiv.org/pdf/math/0409456v1), §1, complete PDF pp.5–7 read 2026-10-03; these are authored deductions from its ordered cocycle/gauge conventions and coefficient functor. Geometric/local-condition comparisons are not certified.

Required continuation: Coefficient naturality of the actual inner twist, both cocycle/H¹ equivalences, identity/composition and the fibre over [f∘c] are specified by this checkpoint. Twisted subgroup and normal-quotient realization, source-group naturality, genuine additive comparison, unipotent point topologies, geometric torsors, representability and local conditions remain required constructions. The reserved all-coefficient/all-degree étale K(pi,1), its qualified raw-homotopy comparison, Chen /57–58, complete BDMTV NC.2/NC.5 routes and E9/E10 obligations are unchanged.

---

# Actual inner twisting — 2026-10-03 checkpoint

This continuation specifies the continuous action, cocycle bijection and actual quotient bijection underlying the existing twisting target. The underlying group comparison is a native identity-equivalence specialization; the original and twisted G-actions can differ. Multiplication and division occur on the right. All implementations remain unchecked.

G is a group with a topology. U is a topological group with a jointly continuous action of G by automorphisms and c is an actual continuous cocycle c(gh)=c(g)·g(c(h)). No compactness, discreteness, finite coefficients or unipotent realization is assumed. The inherited parent twisting contract retains its stated topological-group hypothesis on G; these abstract formulas need only a topology on G.
Twist(c) is the existing underlying-group/topology synonym, with action g⋆x=c(g)·g(x)·c(g)⁻¹. Its underlying group identification j_c is native MulEquiv.refl, with the original multiplication and topology; it is not asserted equivariant for the original action. Twisted cocycles and gauge orbits use the actual constructed action.
H¹ is the existing native gauge-orbit quotient with gauge x·d(g)=x d(g)(g(x))⁻¹. The resulting equivalence is of underlying sets and sends the source neutral element to [c]; call it pointed only after repointing the target at [c]. No local-condition, algebraic torsor, representability or geometric comparison is assumed.


## Underlying group of a cocycle twist

Declaration: `TauCeti.NonabelianCohomology.Twist.toOriginal` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-underlying-group`).

The actual underlying group identification j_c:Twist(c)≃*U is native MulEquiv.refl U. It preserves multiplication and the original topology, but need not preserve the original G-action.

Proof plan: Use the inherited underlying group and topology instances on the existing type synonym. Specialize native MulEquiv.refl; its two inverse identities and multiplicativity are the native ones, not stored comparison oracles. The action remains twisted.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twisting`, `mathlib:MulEquiv.refl`.

## Continuous cocycles under inner twisting

Declaration: `TauCeti.NonabelianCohomology.Z1.twistEquiv` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-cocycle-equivalence`).

Construct τ_c:Z¹(G,Twist(c))≃Z¹(G,U) with τ_c(d)(g)=j_c(d(g))·c(g), and inverse e(g)·c(g)⁻¹ viewed in Twist(c). Both maps return actual continuous cocycles.

Proof plan: The constructed twisted action obeys its unit/product/automorphism laws by the actual cocycle equation; joint continuity follows from c and the ambient action. Multiply the twisted cocycle equation by c(gh) on the right; cancel the adjacent c(g) inverse to get the original cocycle equation in exactly the stated order. The inverse divides on the right by c(g), with continuity from inversion and multiplication; cancellation gives both inverse identities.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twisting`, `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-underlying-group`, `AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles`.

API `TauCeti.NonabelianCohomology.Z1.twistEquiv_apply`: For every d∈Z¹(G,Twist(c)) and g∈G, τ_c(d)(g)=j_c(d(g))·c(g).

API `TauCeti.NonabelianCohomology.Z1.twistEquiv_symm_apply`: For every e∈Z¹(G,U) and g∈G, τ_c⁻¹(e)(g) is e(g)·c(g)⁻¹, viewed in Twist(c).

API `TauCeti.NonabelianCohomology.Z1.twistEquiv_smul`: For every x∈Twist(c) and d∈Z¹(G,Twist(c)), τ_c(x·d)=j_c(x)·τ_c(d). The same underlying gauge witness is used on both sides.

## Value of the twisting equivalence

Declaration: `TauCeti.NonabelianCohomology.Z1.twistEquiv_apply` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-cocycle-value`).

For every d∈Z¹(G,Twist(c)) and g∈G, τ_c(d)(g)=j_c(d(g))·c(g).

Proof plan: Evaluate the actual forward cocycle construction. This fixes the multiplication order in a noncommutative group.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-cocycle-equivalence`.

## Value of the inverse twisting equivalence

Declaration: `TauCeti.NonabelianCohomology.Z1.twistEquiv_symm_apply` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-cocycle-inverse-value`).

For every e∈Z¹(G,U) and g∈G, τ_c⁻¹(e)(g) is e(g)·c(g)⁻¹, viewed in Twist(c).

Proof plan: Evaluate the actual inverse cocycle construction; its inverse is on the right.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-cocycle-equivalence`.

## Gauge compatibility of inner twisting

Declaration: `TauCeti.NonabelianCohomology.Z1.twistEquiv_smul` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-gauge-equivariance`).

For every x∈Twist(c) and d∈Z¹(G,Twist(c)), τ_c(x·d)=j_c(x)·τ_c(d). The same underlying gauge witness is used on both sides.

Proof plan: Expand the actual twisted and original ordered gauge actions. Use g⋆x=c(g) g(j_c(x)) c(g)⁻¹ and cancel in U. Both sides equal j_c(x) j_c(d(g)) c(g) g(j_c(x))⁻¹.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-cocycle-equivalence`, `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-cocycle-value`, `AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1`.

## Gauge-orbit bijection under twisting

Declaration: `TauCeti.NonabelianCohomology.H1.twistEquiv` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-h1-equivalence`).

Construct the actual quotient equivalence H¹(G,Twist(c))≃H¹(G,U) induced by τ_c. It is a bijection of underlying sets; it carries the source neutral point to [c].

Proof plan: Prove equivalence of the two native orbit relations using exactly the same underlying gauge witness and the proved cocycle equivariance. For the reverse implication apply τ_c injectivity to the witness equation. Use native Quotient.congr to construct the quotient equivalence with both inverse identities. The trivial twisted cocycle maps pointwise to c, hence its gauge class maps to [c].

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-cocycle-equivalence`, `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-gauge-equivariance`, `AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1`, `mathlib:Quotient.congr`, `mathlib:MulAction.orbitRel_apply`.

API `TauCeti.NonabelianCohomology.H1.twistEquiv_mk`: For every d∈Z¹(G,Twist(c)), H¹.twistEquiv(c)([d])=[τ_c(d)].

API `TauCeti.NonabelianCohomology.H1.twistEquiv_eq_class_iff`: For every a∈H¹(G,Twist(c)), H¹.twistEquiv(c)(a)=[c] if and only if a=1.

API `TauCeti.NonabelianCohomology.H1.twistEquiv_one`: The actual quotient equivalence sends the source neutral class to the class [c].

## Twisting on an actual H¹ representative

Declaration: `TauCeti.NonabelianCohomology.H1.twistEquiv_mk` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-h1-representative`).

For every d∈Z¹(G,Twist(c)), H¹.twistEquiv(c)([d])=[τ_c(d)].

Proof plan: Evaluate the actual native quotient congruence on a representative.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-h1-equivalence`.

## Neutral source fibre under twisting

Declaration: `TauCeti.NonabelianCohomology.H1.twistEquiv_eq_class_iff` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-h1-neutral-fibre`).

For every a∈H¹(G,Twist(c)), H¹.twistEquiv(c)(a)=[c] if and only if a=1.

Proof plan: The constructed orbit equivalence maps 1 to [c]. Apply its injectivity to compare a with 1. This does not say the equivalence preserves the original target neutral point.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-h1-equivalence`.

## Actual invariants of the twisted action

Declaration: `TauCeti.NonabelianCohomology.Twist.mem_fixed_iff` (`AnabelianGeometryAndNonabelianChabauty:NC.3/twist-invariant-criterion`).

For x∈Twist(c), x belongs to H⁰(G,Twist(c)) if and only if c(g)·g(j_c(x))=j_c(x)·c(g) for every g∈G.

Proof plan: Apply the native underlying group identification to the fixed-point equality g⋆x=x. Multiply on the right by c(g) to obtain the stated commutation equation; conversely divide by c(g) and use the native equivalence injectivity.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/twisting`, `AnabelianGeometryAndNonabelianChabauty:NC.3/twist-underlying-group`, `mathlib:FixedPoints.subgroup`.

## Acceptance checks

`TauCeti.NonabelianCohomology.tests.twist_unit_value` (degenerate): For every c and g, τ_c(1)(g)=c(g); the source neutral cocycle becomes the chosen cocycle.

`TauCeti.NonabelianCohomology.tests.twist_untwist` (compatibility): For every original continuous cocycle e, τ_c(τ_c⁻¹(e))=e as actual cocycles, with no new representative choice.

`TauCeti.NonabelianCohomology.tests.twist_translation_order` (compatibility): For every twisted continuous cocycle d and g, τ_c⁻¹(τ_c(d))(g)=d(g). Division on the right exactly cancels multiplication on the right.

`TauCeti.NonabelianCohomology.tests.twist_neutral_fibre` (characterisation): The inverse actual orbit equivalence sends [c] to the source neutral class.

`TauCeti.NonabelianCohomology.tests.twist_class_representative` (compatibility): For every actual twisted cocycle d, the quotient equivalence applied to [d] is the class of the actual cocycle τ_c(d).

`TauCeti.NonabelianCohomology.tests.twist_not_neutral` (non-example): Take discrete G=S₂ acting trivially on U=S₃ and c(g)=1 for g=1, otherwise the transposition τ=(01). Then H¹.twistEquiv(c)(1)≠1. A bijection claimed to preserve the original target neutral point fails this example.

`TauCeti.NonabelianCohomology.tests.twist_commutative_action` (compatibility): If the original multiplication on U commutes, the actual twisted action g⋆x agrees with the original action g(x), for every c.

`TauCeti.NonabelianCohomology.tests.twist_transposition_invariants` (computation): For the same discrete S₂→S₃ transposition cocycle with trivial original action, x∈H⁰(G,Twist(c)) if and only if x=1 or x=τ. The twisted action has exactly these two invariants, whereas the original trivial action fixes all six elements.

Source: [Kim, exact v1 PDF](https://arxiv.org/pdf/math/0409456v1), §1 cocycle/gauge definitions and complete Proposition 1 proof, PDF pp.5–7, freshly read 2026-10-03. The inner-action and orbit formulas here are authored deductions; this prototype certifies neither algebraic torsor classification nor representability.

Current codex-J6LwjP twisting checkpoint supplies the actual continuous inner action, right-multiplication cocycle equivalence, gauge-orbit quotient equivalence, representative/neutral-fibre formulas and twisted-invariant criterion, with checked native prototypes and the nonneutral S₃ example. Subgroup/quotient and source/coefficient naturality of twisting, genuine additive comparison, unipotent point topologies, representability, local conditions and all geometric/source/supplier obligations remain open. The orbit bijection is pointed only after repointing its target at [c].

The full canonical file still depends on an unavailable compiled Tau Ceti low-degree module. Its Mathlib-only extraction removes only Tau Ceti imports and the named Abelian section, preserving all other signatures and examples. No missing native object is replaced by a stub.

---

# Source restriction on continuous nonabelian cohomology


Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group.

For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required.

Precomposition along a continuous source homomorphism defines the cocycle map. The pulled-back action makes its cocycle identity well-typed, and gauge transformation commutes with it using the same coefficient element. Hence it descends to the existing native orbit quotient. Restriction is contravariant in the source and commutes with coefficient maps; invariant restriction is the actual inclusion of fixed subgroups.

Surjectivity of the source homomorphism lets one recover both cocycles and gauge witnesses by choosing a preimage of each element. Without surjectivity, restriction may kill a nonneutral class: the discrete S₂→S₃ transposition cocycle becomes trivial after precomposition with the constant-one source map. No commutative coefficient group or finite/discrete hypothesis is used in the general maps.

Mathlib already supplies the pulled-back automorphism action and its joint continuity: use MulDistribMulAction.compHom and MulAction.continuousSMul_compHom. The compatibility test constructs that action directly. No private action class is added.

[Kim2009](https://arxiv.org/pdf/math/0510441v4), §4 Comments II, printed p.25 motivates restriction and local-condition inverse images. The inherited citation said §3; the current packet corrects that locator. [Kim2005](https://arxiv.org/pdf/math/0409456v1), §1 pp.5–7 supplies the cocycle/gauge convention. General source laws and coefficient squares are authored deductions from those definitions, with no geometric representability claim.

The existing [Mathlib PR31613](https://github.com/leanprover-community/mathlib4/pull/31613) has algebraic H0/Z1/H1 and coefficient maps in additive notation. The continuous multiplicative interface extends the inherited carriers; no external code is copied. The [bundled restriction discussion](https://leanprover-community.github.io/archive/stream/113489-new-members/topic/Restriction.20of.20a.20bundled.20function.20to.20a.20subset.html) supports composing native homomorphisms.

## Declaration contracts


### Restriction along a continuous source homomorphism


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-restriction` — `TauCeti.NonabelianCohomology.Z1.res`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. Construct res_φ:Z¹(G,U)→Z¹(H,U) by c↦c∘φ.

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles`, `mathlib:Continuous.comp`, `mathlib:map_mul`.

Proof: Compose the actual continuous function with φ. The homomorphism identity and action compatibility turn the G-cocycle identity into the H-cocycle identity.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

API `TauCeti.NonabelianCohomology.Z1.res_apply` (projection): Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For h∈H, res_φ(c)(h)=c(φ(h)).

API `TauCeti.NonabelianCohomology.Z1.res_one` (functoriality): Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. res_φ(1)=1.

API `TauCeti.NonabelianCohomology.Z1.res_id` (functoriality): Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. res_id is the identity on Z¹(G,U).

API `TauCeti.NonabelianCohomology.Z1.res_comp` (functoriality): Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For continuous ψ:K→H with k·u=ψ(k)·u, res_(φ∘ψ)=res_ψ∘res_φ, using the composite action compatibility.

API `TauCeti.NonabelianCohomology.Z1.res_injective` (characterisation): Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. If φ is surjective, res_φ is injective on actual cocycles.

API `TauCeti.NonabelianCohomology.Z1.res_subgroup` (compatibility): Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For every subgroup N≤G with induced topology and action, res along N.subtype equals the existing Z1.restrict N. No closedness is needed for this cocycle equality.

API `TauCeti.NonabelianCohomology.Z1.res_smul` (functoriality): Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. With jointly continuous actions on topological U, res_φ(x·c)=x·res_φ(c) for x∈U.

API `TauCeti.NonabelianCohomology.Z1.res_map` (compatibility): Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For a continuous G-equivariant f:U→V and pulled-back H-actions on U,V, res_φ∘map_f=map_f∘res_φ on cocycles. The H-equivariance of f follows from G-equivariance and the two action equalities.

Test `sourceCocyclesTests.value` (computation): For every compatible φ,c,h, res_φ(c)(h)=c(φ(h)).

Test `sourceCocyclesTests.identity` (compatibility): For every actual cocycle c, restriction along id_G sends c to c.

Test `sourceCocyclesTests.constantSource` (degenerate): If H acts through the constant-one source homomorphism H→G, then res_1(c) is the neutral cocycle for every c.

Test `sourceCocyclesTests.subgroup` (compatibility): For every N≤G, general restriction along N.subtype agrees with the existing subgroup cocycle restriction on every c.

### Values of source restriction


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-value` — `TauCeti.NonabelianCohomology.Z1.res_apply`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For h∈H, res_φ(c)(h)=c(φ(h)).

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-restriction`.

Proof: Evaluate the defining precomposition.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### The neutral restricted cocycle


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-neutral` — `TauCeti.NonabelianCohomology.Z1.res_one`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. res_φ(1)=1.

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-restriction`.

Proof: Precomposing the constant-one function leaves it constant one.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### Identity source restriction on cocycles


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-identity` — `TauCeti.NonabelianCohomology.Z1.res_id`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. res_id is the identity on Z¹(G,U).

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-restriction`, `mathlib:MonoidHom.id`.

Proof: Function and subtype extensionality reduce to c(id(g))=c(g).

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### Contravariant composition on cocycles


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-composition` — `TauCeti.NonabelianCohomology.Z1.res_comp`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For continuous ψ:K→H with k·u=ψ(k)·u, res_(φ∘ψ)=res_ψ∘res_φ, using the composite action compatibility.

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-restriction`, `mathlib:MonoidHom.comp`, `mathlib:Continuous.comp`.

Proof: Evaluate both functions at k∈K: each has value c(φ(ψ(k))).

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### Surjective sources detect cocycles


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-surjective-injection` — `TauCeti.NonabelianCohomology.Z1.res_injective`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. If φ is surjective, res_φ is injective on actual cocycles.

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-value`.

Proof: Choose an H-preimage of each g∈G and evaluate equality of restricted cocycles there.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### Agreement with subgroup cocycle restriction


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-subgroup` — `TauCeti.NonabelianCohomology.Z1.res_subgroup`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For every subgroup N≤G with induced topology and action, res along N.subtype equals the existing Z1.restrict N. No closedness is needed for this cocycle equality.

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-restriction`, `AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-restriction`, `mathlib:Subgroup.subtype`.

Proof: Both maps evaluate c on the underlying element of N.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### Gauge compatibility of source restriction


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-gauge` — `TauCeti.NonabelianCohomology.Z1.res_smul`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. With jointly continuous actions on topological U, res_φ(x·c)=x·res_φ(c) for x∈U.

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-value`, `AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1`.

Proof: Expand x c(φ(h)) (φ(h)·x)⁻¹ and replace φ(h)·x by h·x.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### Restriction on nonabelian cohomology


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-h1-restriction` — `TauCeti.NonabelianCohomology.H1.res`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group. Construct the pointed-set map res_φ:H¹(G,U)→H¹(H,U) from actual cocycle precomposition.

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-gauge`, `AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1`, `AnabelianGeometryAndNonabelianChabauty:NC.3/h1-gauge-class`, `mathlib:MulDistribMulAction.compHom`, `mathlib:MulAction.continuousSMul_compHom`.

Proof: Use native Quotient.lift on gauge orbits. The same coefficient element x witnesses equivalence after precomposition.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

API `TauCeti.NonabelianCohomology.H1.res_mk` (projection): Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group. res_φ([c])=[c∘φ].

API `TauCeti.NonabelianCohomology.H1.res_one` (functoriality): Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group. res_φ(1)=1 in H¹(H,U).

API `TauCeti.NonabelianCohomology.H1.res_id` (functoriality): Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group. res_id is the identity on H¹(G,U).

API `TauCeti.NonabelianCohomology.H1.res_comp` (functoriality): Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group. For continuous ψ:K→H with compatible jointly continuous action, res_(φ∘ψ)=res_ψ∘res_φ.

API `TauCeti.NonabelianCohomology.H1.res_injective` (characterisation): Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group. If φ is surjective, res_φ is injective on H¹(G,U).

API `TauCeti.NonabelianCohomology.H1.res_subgroup` (compatibility): Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group. For every subgroup N≤G, res along N.subtype equals the existing H1.restrict N, with induced topology and action.

API `TauCeti.NonabelianCohomology.H1.res_map` (compatibility): Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group. For a continuous G-equivariant f:U→V between topological groups with jointly continuous compatible actions, res_φ∘map_f=map_f∘res_φ on H¹.

Test `sourceClassesTests.one` (degenerate): For every compatible continuous φ, H1.res φ sends the neutral class to the neutral class.

Test `sourceClassesTests.gauge` (characterisation): For every x∈U and c∈Z¹(G,U), res_φ([x·c])=[res_φ(c)].

Test `sourceClassesTests.subgroup` (compatibility): For every N≤G and a∈H¹(G,U), general restriction along N.subtype equals the existing H1.restrict N a.

Test `sourceClassesTests.surjectiveReflection` (characterisation): If φ:H→G is surjective, then res_φ(a)=1 iff a=1.

Test `sourceClassesTests.noninjective` (non-example): Let G=S₂ and U=S₃ be discrete with trivial action, and c send the nonidentity permutation to (01). Its class is nonneutral, but restriction along the constant-one homomorphism G→G sends it to the neutral class. General source restriction is not asserted injective.

Test `sourceClassesTests.nativePullbackAction` (compatibility): For every continuous φ:H→G, using native MulDistribMulAction.compHom and MulAction.continuousSMul_compHom to pull back a jointly continuous G-action, H1.res φ sends the neutral class to neutral.

### Restriction on a cocycle class


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-h1-representative` — `TauCeti.NonabelianCohomology.H1.res_mk`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group. res_φ([c])=[c∘φ].

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-h1-restriction`, `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-restriction`.

Proof: Evaluate the native quotient lift on a representative.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### The neutral restricted class


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-h1-neutral` — `TauCeti.NonabelianCohomology.H1.res_one`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group. res_φ(1)=1 in H¹(H,U).

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-h1-representative`, `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-neutral`.

Proof: Use the representative of the neutral class and the constant-one cocycle formula.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### Identity restriction on cohomology


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-h1-identity` — `TauCeti.NonabelianCohomology.H1.res_id`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group. res_id is the identity on H¹(G,U).

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-h1-representative`, `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-identity`, `AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1`.

Proof: Use class-map surjectivity and the cocycle identity restriction.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### Contravariant composition on cohomology


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-h1-composition` — `TauCeti.NonabelianCohomology.H1.res_comp`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group. For continuous ψ:K→H with compatible jointly continuous action, res_(φ∘ψ)=res_ψ∘res_φ.

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-h1-representative`, `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-composition`, `AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1`.

Proof: Choose a cocycle representative and apply the cocycle composition law.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### Surjective sources detect cohomology classes


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-h1-surjective-injection` — `TauCeti.NonabelianCohomology.H1.res_injective`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group. If φ is surjective, res_φ is injective on H¹(G,U).

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-h1-representative`, `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-gauge`, `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-surjective-injection`, `AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1`.

Proof: Choose representative cocycles. Equality after restriction gives a gauge witness x∈U. Gauge compatibility and surjective-source injectivity on cocycles give x·c=d before restriction.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### Agreement with subgroup cohomology restriction


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-h1-subgroup` — `TauCeti.NonabelianCohomology.H1.res_subgroup`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group. For every subgroup N≤G, res along N.subtype equals the existing H1.restrict N, with induced topology and action.

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-h1-representative`, `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-subgroup`, `AnabelianGeometryAndNonabelianChabauty:NC.3/h1-restriction`.

Proof: Reduce to a cocycle representative; both quotient maps use the same actual restricted cocycle.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### Coefficient change commutes with source restriction


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-coefficient-cocycle-square` — `TauCeti.NonabelianCohomology.Z1.res_map`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For a continuous G-equivariant f:U→V and pulled-back H-actions on U,V, res_φ∘map_f=map_f∘res_φ on cocycles. The H-equivariance of f follows from G-equivariance and the two action equalities.

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-cocycle-restriction`, `AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-cocycle-map`.

Proof: Both maps have value f(c(φ(h))) at h; rewrite the action equalities to provide the induced H-equivariance proof.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### The source and coefficient square on cohomology


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-coefficient-h1-square` — `TauCeti.NonabelianCohomology.H1.res_map`.

Let G,H,K be groups with topologies, U a group with a topology and actions by automorphisms, φ:H→G a continuous homomorphism, and h·u=φ(h)·u. Write res_φ for precomposition on continuous cocycles. For H¹, require U to be a topological group and the actions jointly continuous; H¹ is the actual gauge-orbit pointed set, not a group. For a continuous G-equivariant f:U→V between topological groups with jointly continuous compatible actions, res_φ∘map_f=map_f∘res_φ on H¹.

Hypotheses: No compactness, discreteness, finite coefficient group, commutativity or geometric realization is assumed. H¹ and gauge assertions require jointly continuous actions on topological coefficient groups.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-h1-representative`, `AnabelianGeometryAndNonabelianChabauty:NC.3/source-coefficient-cocycle-square`, `AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-h1-map`, `AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1`.

Proof: Choose a cocycle representative and use the commuting cocycle square; quotient lifting preserves equality.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### Restriction of invariant subgroups


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-invariant-restriction` — `TauCeti.NonabelianCohomology.H0.res`.

For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required. Construct the homomorphism res_φ:U^G→U^H sending an invariant element to the same element of U.

Hypotheses: For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles`, `mathlib:FixedPoints.subgroup`.

Proof: The G-fixed element is fixed by φ(h), hence by h. Multiplication and identity are inherited from the common ambient group.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

API `TauCeti.NonabelianCohomology.H0.res_apply` (projection): For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required. The underlying U-element of res_φ(x) is x.

API `TauCeti.NonabelianCohomology.H0.res_id` (functoriality): For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required. Restriction along id_G is the identity homomorphism of U^G.

API `TauCeti.NonabelianCohomology.H0.res_comp` (functoriality): For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required. For ψ:K→H with compatible action, res_(φ∘ψ)=res_ψ∘res_φ as group homomorphisms.

API `TauCeti.NonabelianCohomology.H0.res_injective` (characterisation): For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required. The map res_φ:U^G→U^H is injective for every φ, without a surjectivity hypothesis.

API `TauCeti.NonabelianCohomology.H0.res_map` (compatibility): For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required. For G-equivariant f:U→V and compatible H-actions, res_φ∘map_f=map_f∘res_φ as group homomorphisms between native fixed subgroups.

Test `sourceInvariantsTests.one` (degenerate): For every compatible φ, invariant restriction sends 1 to 1.

Test `sourceInvariantsTests.identity` (compatibility): For every x∈U^G, restriction along id_G returns x.

Test `sourceInvariantsTests.value` (computation): For every compatible φ and x∈U^G, the underlying U-element of res_φ(x) is exactly x.

### Underlying invariant restriction


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-invariant-value` — `TauCeti.NonabelianCohomology.H0.res_apply`.

For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required. The underlying U-element of res_φ(x) is x.

Hypotheses: For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-invariant-restriction`.

Proof: Unfold the inclusion between actual fixed subgroups.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### Identity restriction of invariants


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-invariant-identity` — `TauCeti.NonabelianCohomology.H0.res_id`.

For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required. Restriction along id_G is the identity homomorphism of U^G.

Hypotheses: For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-invariant-restriction`, `mathlib:MonoidHom.id`.

Proof: The underlying function is identity, and proof fields agree by proof irrelevance.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### Composition of invariant restrictions


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-invariant-composition` — `TauCeti.NonabelianCohomology.H0.res_comp`.

For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required. For ψ:K→H with compatible action, res_(φ∘ψ)=res_ψ∘res_φ as group homomorphisms.

Hypotheses: For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-invariant-restriction`, `mathlib:MonoidHom.comp`.

Proof: Both homomorphisms preserve the underlying element of U.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### Invariant restriction is injective


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-invariant-injection` — `TauCeti.NonabelianCohomology.H0.res_injective`.

For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required. The map res_φ:U^G→U^H is injective for every φ, without a surjectivity hypothesis.

Hypotheses: For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-invariant-value`.

Proof: Take underlying U-values of an equality and apply subtype extensionality.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

### The source and coefficient square on invariants


`AnabelianGeometryAndNonabelianChabauty:NC.3/source-coefficient-invariant-square` — `TauCeti.NonabelianCohomology.H0.res_map`.

For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required. For G-equivariant f:U→V and compatible H-actions, res_φ∘map_f=map_f∘res_φ as group homomorphisms between native fixed subgroups.

Hypotheses: For H⁰, only groups and automorphism actions are needed, with h·u=φ(h)·u; no topology or continuity is required.

Prerequisites: `AnabelianGeometryAndNonabelianChabauty:NC.3/source-invariant-restriction`, `AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-invariant-map`, `mathlib:MonoidHom.comp`.

Proof: Both homomorphisms send x to f(x); H-equivariance follows by rewriting the compatible actions.

Acceptance: Use the actual continuous-cocycle subtype, native fixed subgroup and existing gauge-orbit quotient. Preserve multiplication order. No local unramified/crystalline condition, geometric torsor comparison or representability result follows from this abstract topological calculation.

---


The preceding reader follows unchanged. The source-restriction statements above supersede only its claim that the abstract source-variable functoriality is still missing; its additive, geometric, local-condition and supplier boundaries remain.

## Current NC.3 checkpoint: equivariant coefficient maps

Codex — codex-J6LwjP, 2026-10-02, issue #1020. The current packet contains 112 unchecked nodes: 3 definitions, 20 constructions, 56 lemmas, 27 theorems and 6 comparisons. It has 125 raw APIs (113 required definition/construction APIs), 107 tests (96 required definition/construction tests), 123 baseline entries and 11 planets. All seven stages stay partial, with the same nine gaps and sixteen supplier requests.

The coefficient part of the inherited bundled functoriality contract now has eleven declaration-sized leaves. They specify actual maps on continuous cocycles, native invariant subgroups and gauge-orbit H¹, gauge compatibility and identity/composition laws. A continuous equivariant homomorphism f maps c to f∘c. Its action on gauge witnesses is f(x), so it induces the actual pointed-set map [c]↦[f∘c]. H¹ is not made into a group, and a general coefficient map is not asserted injective. The nonneutral S₂→S₃ transposition class maps to the neutral class under the constant-one coefficient homomorphism. For invariant subgroups, topology is unnecessary: equivariance alone restricts the native group homomorphism.

All 101 inherited mathematical contracts and 100 entire node objects remain unchanged. The one refined old object, functoriality, gains these leaves as inputs and an explicit scope note; its original statement, hypotheses, API, sources and acceptance are unchanged. The twelve added tests include actual transposition computations and the noninjective coefficient map, in addition to identity, neutral, pointwise and gauge formulas. No reserved étale K(π,1), source-route, ownership, gap, request or planet contract changes.

The separate native proof passes with 65 proved examples and 80 kernel audits, without errors, warnings or admissions. The exact Mathlib-only extraction of the submitted signatures passes with 107 examples and 253 admission warnings, without errors or other warnings. The complete geometric suggested file is uncompiled because the shared exact-pin build lacks the Tau Ceti continuous low-degree cohomology artifact. The handoff supplies immutable proof recovery and actual assembler receipts.

Arbitrary source-group restriction, the genuine additive cocycle comparison, compatibility with Tau Ceti's additive finite-quotient machinery, representability, local conditions, and the geometric source/supplier obligations remain open. The earlier reader below is preserved verbatim as historical checkpoint material.

### Added coefficient-map declaration plans

#### Coefficient map on continuous cocycles

Declaration: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-cocycle-map. Proposed name: TauCeti.NonabelianCohomology.Z1.map. Kind: construction.

For a continuous G-equivariant homomorphism f:U→U′, construct the actual cocycle map c↦f∘c on the inherited continuous cocycle subtypes. Its exact evaluation, neutral cocycle and gauge formulas determine the induced pointed-set map.

Hypotheses: G is a group with a topology; coefficient groups U,U′,U″ have topologies and G-actions by automorphisms. For H¹ and gauge compatibility, each coefficient group is a topological group and the action is jointly continuous. Coefficient homomorphisms are continuous and G-equivariant. No compactness, discreteness, commutativity, finiteness, or topology of a unipotent algebraic group is assumed. The H⁰ maps require only group structures and equivariant homomorphisms; no topology or continuity hypothesis enters them.

Inputs: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles, mathlib:Continuous.comp, mathlib:map_mul.

Construction or proof:

1. Continuity is composition. Apply f to the ordered cocycle identity and use its multiplication law and equivariance.
2. The actual map is evaluated at every g; it is not an arbitrary choice of a cocycle with the same class.

Uses:

- AnabelianGeometryAndNonabelianChabauty:NC.3/functoriality — Supply the declaration-sized coefficient part of the inherited bundled functoriality contract.
- AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-h1-map — Gauge compatibility descends this exact map to cohomology classes.

API:

- TauCeti.NonabelianCohomology.Z1.map (constructor): For a continuous G-equivariant homomorphism f:U→U′, construct the actual cocycle map c↦f∘c on the inherited continuous cocycle subtypes. Its exact evaluation, neutral cocycle and gauge formulas determine the induced pointed-set map.
- TauCeti.NonabelianCohomology.Z1.map_apply (simp): The exact cocycle-map value at g is f(c(g)).
- TauCeti.NonabelianCohomology.Z1.map_trivial (simp): The trivial cocycle maps to the trivial cocycle.
- TauCeti.NonabelianCohomology.Z1.map_smul (compatibility): For every x∈U and cocycle c, mapping the gauge transform x·c equals the gauge transform f(x)·(f∘c).
- TauCeti.NonabelianCohomology.Z1.map_id (functoriality): The actual coefficient cocycle map induced by id_U is the identity function.
- TauCeti.NonabelianCohomology.Z1.map_comp (functoriality): The actual cocycle map induced by f′∘f equals the composite of the cocycle maps induced by f and f′, in that order.

Unit tests:

- coefficientCocyclesTests.identity (compatibility): The identity coefficient homomorphism fixes every actual continuous cocycle.
- coefficientCocyclesTests.constant (degenerate): The coefficient homomorphism with constant value one takes every cocycle to the trivial cocycle.
- coefficientCocyclesTests.value (characterisation): For every f,c,g the actual cocycle-map value is exactly f(c(g)).
- coefficientCocyclesTests.transposition (computation): For the actual S₂→S₃ transposition cocycle with trivial action, the identity coefficient map sends the source transposition to the same target transposition.

Acceptance: Use the actual inherited continuous cocycles, native fixed subgroups and gauge-orbit quotient. These are coefficient maps only. The arbitrary source-group restriction, additive conversion, finite-quotient additive compatibility, representability, local conditions and geometric source/supplier obligations remain separate.

Source: kim-siegel-2005, §1, continuous cocycles and gauge orbits, printed pp.5–6; coefficient-functor paragraph after Proposition1, printed p.7. The general maps for continuous equivariant coefficient homomorphisms and their explicit laws are authored deductions from the displayed cocycle/gauge definitions. No representability or geometric torsor-comparison theorem is claimed.

#### Gauge compatibility of coefficient cocycle maps

Declaration: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-cocycle-gauge. Proposed name: TauCeti.NonabelianCohomology.Z1.map_smul. Kind: lemma.

For every x∈U and cocycle c, mapping the gauge transform x·c equals the gauge transform f(x)·(f∘c).

Hypotheses: G is a group with a topology; coefficient groups U,U′,U″ have topologies and G-actions by automorphisms. For H¹ and gauge compatibility, each coefficient group is a topological group and the action is jointly continuous. Coefficient homomorphisms are continuous and G-equivariant. No compactness, discreteness, commutativity, finiteness, or topology of a unipotent algebraic group is assumed. The H⁰ maps require only group structures and equivariant homomorphisms; no topology or continuity hypothesis enters them.

Inputs: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-cocycle-map, AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, mathlib:map_inv.

Construction or proof:

1. Apply cocycle extensionality, keeping factor order, and expand f(x c(g) (g·x)⁻¹).
2. Use homomorphism multiplication/inverse preservation and G-equivariance.

Acceptance: Use the actual inherited continuous cocycles, native fixed subgroups and gauge-orbit quotient. These are coefficient maps only. The arbitrary source-group restriction, additive conversion, finite-quotient additive compatibility, representability, local conditions and geometric source/supplier obligations remain separate.

Source: kim-siegel-2005, §1, continuous cocycles and gauge orbits, printed pp.5–6; coefficient-functor paragraph after Proposition1, printed p.7. The general maps for continuous equivariant coefficient homomorphisms and their explicit laws are authored deductions from the displayed cocycle/gauge definitions. No representability or geometric torsor-comparison theorem is claimed.

#### Identity coefficient map on cocycles

Declaration: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-cocycle-identity. Proposed name: TauCeti.NonabelianCohomology.Z1.map_id. Kind: lemma.

The actual coefficient cocycle map induced by id_U is the identity function.

Hypotheses: G is a group with a topology; coefficient groups U,U′,U″ have topologies and G-actions by automorphisms. For H¹ and gauge compatibility, each coefficient group is a topological group and the action is jointly continuous. Coefficient homomorphisms are continuous and G-equivariant. No compactness, discreteness, commutativity, finiteness, or topology of a unipotent algebraic group is assumed. The H⁰ maps require only group structures and equivariant homomorphisms; no topology or continuity hypothesis enters them.

Inputs: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-cocycle-map, mathlib:MonoidHom.id.

Construction or proof:

1. The underlying pointwise function is the identity; the subtype proofs are propositionally irrelevant.

Acceptance: Use the actual inherited continuous cocycles, native fixed subgroups and gauge-orbit quotient. These are coefficient maps only. The arbitrary source-group restriction, additive conversion, finite-quotient additive compatibility, representability, local conditions and geometric source/supplier obligations remain separate.

Source: kim-siegel-2005, §1, continuous cocycles and gauge orbits, printed pp.5–6; coefficient-functor paragraph after Proposition1, printed p.7. The general maps for continuous equivariant coefficient homomorphisms and their explicit laws are authored deductions from the displayed cocycle/gauge definitions. No representability or geometric torsor-comparison theorem is claimed.

#### Composition of coefficient cocycle maps

Declaration: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-cocycle-composition. Proposed name: TauCeti.NonabelianCohomology.Z1.map_comp. Kind: lemma.

The actual cocycle map induced by f′∘f equals the composite of the cocycle maps induced by f and f′, in that order.

Hypotheses: G is a group with a topology; coefficient groups U,U′,U″ have topologies and G-actions by automorphisms. For H¹ and gauge compatibility, each coefficient group is a topological group and the action is jointly continuous. Coefficient homomorphisms are continuous and G-equivariant. No compactness, discreteness, commutativity, finiteness, or topology of a unipotent algebraic group is assumed. The H⁰ maps require only group structures and equivariant homomorphisms; no topology or continuity hypothesis enters them.

Inputs: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-cocycle-map, mathlib:MonoidHom.comp, mathlib:MonoidHom.comp_apply.

Construction or proof:

1. Both sides evaluate exactly as f′(f(c(g))). Composition supplies continuity and equivariance of the composite.

Acceptance: Use the actual inherited continuous cocycles, native fixed subgroups and gauge-orbit quotient. These are coefficient maps only. The arbitrary source-group restriction, additive conversion, finite-quotient additive compatibility, representability, local conditions and geometric source/supplier obligations remain separate.

Source: kim-siegel-2005, §1, continuous cocycles and gauge orbits, printed pp.5–6; coefficient-functor paragraph after Proposition1, printed p.7. The general maps for continuous equivariant coefficient homomorphisms and their explicit laws are authored deductions from the displayed cocycle/gauge definitions. No representability or geometric torsor-comparison theorem is claimed.

#### Coefficient map on nonabelian cohomology

Declaration: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-h1-map. Proposed name: TauCeti.NonabelianCohomology.H1.map. Kind: construction.

The continuous equivariant coefficient homomorphism f induces the actual map on gauge-orbit H¹, taking [c] to [f∘c]. It preserves the distinguished class and obeys identity and composition; H¹ remains a pointed set. No injectivity is asserted for arbitrary f.

Hypotheses: G is a group with a topology; coefficient groups U,U′,U″ have topologies and G-actions by automorphisms. For H¹ and gauge compatibility, each coefficient group is a topological group and the action is jointly continuous. Coefficient homomorphisms are continuous and G-equivariant. No compactness, discreteness, commutativity, finiteness, or topology of a unipotent algebraic group is assumed. The H⁰ maps require only group structures and equivariant homomorphisms; no topology or continuity hypothesis enters them.

Inputs: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-cocycle-gauge, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-orbit-criterion.

Construction or proof:

1. Lift the actual cocycle-map class through the native orbit quotient.
2. If the source relation relates representatives via x, gauge compatibility relates their images via f(x), with inversion where the orbit-relation orientation requires it.
3. Compute on representatives; surjectivity of the actual class map proves the stated identity/composition laws.

Uses:

- AnabelianGeometryAndNonabelianChabauty:NC.3/functoriality — Supply the declaration-sized coefficient part of the inherited bundled functoriality contract.

API:

- TauCeti.NonabelianCohomology.H1.map (constructor): The continuous equivariant coefficient homomorphism f induces the actual map on gauge-orbit H¹, taking [c] to [f∘c]. It preserves the distinguished class and obeys identity and composition; H¹ remains a pointed set. No injectivity is asserted for arbitrary f.
- TauCeti.NonabelianCohomology.H1.map_mk (simp): The actual map takes the class of c to the class of the actual cocycle f∘c.
- TauCeti.NonabelianCohomology.H1.map_one (simp): The actual H¹ coefficient map sends the neutral class to the neutral class.
- TauCeti.NonabelianCohomology.H1.map_id (functoriality): The H¹ map induced by id_U is the identity of the actual pointed set.
- TauCeti.NonabelianCohomology.H1.map_comp (functoriality): The actual pointed-set map on H¹ induced by f′∘f equals H¹(f′)∘H¹(f).

Unit tests:

- coefficientClassesTests.identity (compatibility): The identity coefficient map fixes every actual H¹ class.
- coefficientClassesTests.gauge (characterisation): A gauge-transformed representative maps to the class of f∘c, independently of the gauge witness.
- coefficientClassesTests.one (degenerate): Every actual coefficient map takes the neutral class to the neutral class.
- coefficientClassesTests.noninjective (non-example): The actual S₂→S₃ transposition class is nonneutral but maps to the neutral class under the constant-one coefficient homomorphism. Arbitrary coefficient maps are not injective.

Acceptance: Use the actual inherited continuous cocycles, native fixed subgroups and gauge-orbit quotient. These are coefficient maps only. The arbitrary source-group restriction, additive conversion, finite-quotient additive compatibility, representability, local conditions and geometric source/supplier obligations remain separate.

Source: kim-siegel-2005, §1, continuous cocycles and gauge orbits, printed pp.5–6; coefficient-functor paragraph after Proposition1, printed p.7. The general maps for continuous equivariant coefficient homomorphisms and their explicit laws are authored deductions from the displayed cocycle/gauge definitions. No representability or geometric torsor-comparison theorem is claimed.

#### Neutral class under coefficient maps

Declaration: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-h1-one. Proposed name: TauCeti.NonabelianCohomology.H1.map_one. Kind: lemma.

The actual H¹ coefficient map sends the neutral class to the neutral class.

Hypotheses: G is a group with a topology; coefficient groups U,U′,U″ have topologies and G-actions by automorphisms. For H¹ and gauge compatibility, each coefficient group is a topological group and the action is jointly continuous. Coefficient homomorphisms are continuous and G-equivariant. No compactness, discreteness, commutativity, finiteness, or topology of a unipotent algebraic group is assumed. The H⁰ maps require only group structures and equivariant homomorphisms; no topology or continuity hypothesis enters them.

Inputs: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-h1-map, mathlib:map_one.

Construction or proof:

1. The actual cocycle map sends the constant-one cocycle to itself, because f(1)=1. Take its class.

Acceptance: Use the actual inherited continuous cocycles, native fixed subgroups and gauge-orbit quotient. These are coefficient maps only. The arbitrary source-group restriction, additive conversion, finite-quotient additive compatibility, representability, local conditions and geometric source/supplier obligations remain separate.

Source: kim-siegel-2005, §1, continuous cocycles and gauge orbits, printed pp.5–6; coefficient-functor paragraph after Proposition1, printed p.7. The general maps for continuous equivariant coefficient homomorphisms and their explicit laws are authored deductions from the displayed cocycle/gauge definitions. No representability or geometric torsor-comparison theorem is claimed.

#### Identity coefficient map on cohomology

Declaration: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-h1-identity. Proposed name: TauCeti.NonabelianCohomology.H1.map_id. Kind: lemma.

The H¹ map induced by id_U is the identity of the actual pointed set.

Hypotheses: G is a group with a topology; coefficient groups U,U′,U″ have topologies and G-actions by automorphisms. For H¹ and gauge compatibility, each coefficient group is a topological group and the action is jointly continuous. Coefficient homomorphisms are continuous and G-equivariant. No compactness, discreteness, commutativity, finiteness, or topology of a unipotent algebraic group is assumed. The H⁰ maps require only group structures and equivariant homomorphisms; no topology or continuity hypothesis enters them.

Inputs: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-h1-map, AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-cocycle-identity.

Construction or proof:

1. Use actual class-map surjectivity and compute on each cocycle representative.

Acceptance: Use the actual inherited continuous cocycles, native fixed subgroups and gauge-orbit quotient. These are coefficient maps only. The arbitrary source-group restriction, additive conversion, finite-quotient additive compatibility, representability, local conditions and geometric source/supplier obligations remain separate.

Source: kim-siegel-2005, §1, continuous cocycles and gauge orbits, printed pp.5–6; coefficient-functor paragraph after Proposition1, printed p.7. The general maps for continuous equivariant coefficient homomorphisms and their explicit laws are authored deductions from the displayed cocycle/gauge definitions. No representability or geometric torsor-comparison theorem is claimed.

#### Composition of coefficient cohomology maps

Declaration: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-h1-composition. Proposed name: TauCeti.NonabelianCohomology.H1.map_comp. Kind: lemma.

The actual pointed-set map on H¹ induced by f′∘f equals H¹(f′)∘H¹(f).

Hypotheses: G is a group with a topology; coefficient groups U,U′,U″ have topologies and G-actions by automorphisms. For H¹ and gauge compatibility, each coefficient group is a topological group and the action is jointly continuous. Coefficient homomorphisms are continuous and G-equivariant. No compactness, discreteness, commutativity, finiteness, or topology of a unipotent algebraic group is assumed. The H⁰ maps require only group structures and equivariant homomorphisms; no topology or continuity hypothesis enters them.

Inputs: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-h1-map, AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-cocycle-composition.

Construction or proof:

1. Use actual class-map surjectivity and the ordered cocycle composition formula.

Acceptance: Use the actual inherited continuous cocycles, native fixed subgroups and gauge-orbit quotient. These are coefficient maps only. The arbitrary source-group restriction, additive conversion, finite-quotient additive compatibility, representability, local conditions and geometric source/supplier obligations remain separate.

Source: kim-siegel-2005, §1, continuous cocycles and gauge orbits, printed pp.5–6; coefficient-functor paragraph after Proposition1, printed p.7. The general maps for continuous equivariant coefficient homomorphisms and their explicit laws are authored deductions from the displayed cocycle/gauge definitions. No representability or geometric torsor-comparison theorem is claimed.

#### Coefficient homomorphism on invariant groups

Declaration: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-invariant-map. Proposed name: TauCeti.NonabelianCohomology.H0.map. Kind: construction.

A G-equivariant group homomorphism f:U→U′ induces the actual group homomorphism U^G→(U′)^G with value x↦f(x). No topology or continuity condition is needed. It preserves the group operations and obeys identity and composition.

Hypotheses: G and U,U′,U″ are groups, with G acting by automorphisms on each coefficient group. Coefficient homomorphisms are G-equivariant. No topology or continuity hypothesis is required.

Inputs: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles, mathlib:FixedPoints.subgroup, mathlib:FixedPoints.mem_subgroup, mathlib:map_one, mathlib:map_mul.

Construction or proof:

1. For fixed x, equivariance identifies g·f(x) with f(g·x)=f(x).
2. Bundle the pointwise restriction as the existing native MonoidHom between actual fixed subgroups; its multiplication and unit laws come from f.

Uses:

- AnabelianGeometryAndNonabelianChabauty:NC.3/functoriality — Supply the declaration-sized coefficient part of the inherited bundled functoriality contract.

API:

- TauCeti.NonabelianCohomology.H0.map (constructor): A G-equivariant group homomorphism f:U→U′ induces the actual group homomorphism U^G→(U′)^G with value x↦f(x). No topology or continuity condition is needed. It preserves the group operations and obeys identity and composition.
- TauCeti.NonabelianCohomology.H0.map_apply (simp): The underlying invariant-subgroup value is exactly f(x).
- TauCeti.NonabelianCohomology.H0.map_id (functoriality): The invariant-group homomorphism induced by id_U is the native identity homomorphism.
- TauCeti.NonabelianCohomology.H0.map_comp (functoriality): The invariant-group homomorphism induced by f′∘f equals the native composite of the restricted invariant homomorphisms.

Unit tests:

- invariantCoefficientsTests.identity (compatibility): The identity homomorphism fixes every element of the actual invariant subgroup.
- invariantCoefficientsTests.constant (degenerate): The constant-one coefficient homomorphism sends every invariant element to one.
- invariantCoefficientsTests.value (characterisation): The restricted invariant homomorphism has value f(x) in the ambient coefficient group.
- invariantCoefficientsTests.transposition (computation): For S₃ with trivial S₂-action, the invariant transposition is fixed by the native identity coefficient homomorphism.

Acceptance: Use the actual inherited continuous cocycles, native fixed subgroups and gauge-orbit quotient. These are coefficient maps only. The arbitrary source-group restriction, additive conversion, finite-quotient additive compatibility, representability, local conditions and geometric source/supplier obligations remain separate.

Source: kim-siegel-2005, §1, continuous cocycles and gauge orbits, printed pp.5–6; coefficient-functor paragraph after Proposition1, printed p.7. The general maps for continuous equivariant coefficient homomorphisms and their explicit laws are authored deductions from the displayed cocycle/gauge definitions. No representability or geometric torsor-comparison theorem is claimed.

#### Identity coefficient homomorphism on invariants

Declaration: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-invariant-identity. Proposed name: TauCeti.NonabelianCohomology.H0.map_id. Kind: lemma.

The invariant-group homomorphism induced by id_U is the native identity homomorphism.

Hypotheses: G and U,U′,U″ are groups, with G acting by automorphisms on each coefficient group. Coefficient homomorphisms are G-equivariant. No topology or continuity hypothesis is required.

Inputs: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-invariant-map, mathlib:MonoidHom.id.

Construction or proof:

1. The underlying map and fixed-subgroup witnesses agree; proof irrelevance identifies the bundled data.

Acceptance: Use the actual inherited continuous cocycles, native fixed subgroups and gauge-orbit quotient. These are coefficient maps only. The arbitrary source-group restriction, additive conversion, finite-quotient additive compatibility, representability, local conditions and geometric source/supplier obligations remain separate.

Source: kim-siegel-2005, §1, continuous cocycles and gauge orbits, printed pp.5–6; coefficient-functor paragraph after Proposition1, printed p.7. The general maps for continuous equivariant coefficient homomorphisms and their explicit laws are authored deductions from the displayed cocycle/gauge definitions. No representability or geometric torsor-comparison theorem is claimed.

#### Composition of invariant coefficient homomorphisms

Declaration: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-invariant-composition. Proposed name: TauCeti.NonabelianCohomology.H0.map_comp. Kind: lemma.

The invariant-group homomorphism induced by f′∘f equals the native composite of the restricted invariant homomorphisms.

Hypotheses: G and U,U′,U″ are groups, with G acting by automorphisms on each coefficient group. Coefficient homomorphisms are G-equivariant. No topology or continuity hypothesis is required.

Inputs: AnabelianGeometryAndNonabelianChabauty:NC.3/coefficient-invariant-map, mathlib:MonoidHom.comp.

Construction or proof:

1. Compute both underlying homomorphisms as x↦f′(f(x)), using the actual subgroup carriers.

Acceptance: Use the actual inherited continuous cocycles, native fixed subgroups and gauge-orbit quotient. These are coefficient maps only. The arbitrary source-group restriction, additive conversion, finite-quotient additive compatibility, representability, local conditions and geometric source/supplier obligations remain separate.

Source: kim-siegel-2005, §1, continuous cocycles and gauge orbits, printed pp.5–6; coefficient-functor paragraph after Proposition1, printed p.7. The general maps for continuous equivariant coefficient homomorphisms and their explicit laws are authored deductions from the displayed cocycle/gauge definitions. No representability or geometric torsor-comparison theorem is claimed.

---

# Anabelian geometry and nonabelian Chabauty

The NC.0 plan develops the finite-étale cohomological criterion for étale K(π,1), its transfer to covers, finite-étale invariance, coefficient dévissage and the characteristic-zero smooth-curve proof by connected prime covers and separable descent. It retains the reserved definition and the NC.3 nonabelian subgroup exactness on actual invariant cosets. The NC.3 finite-quotient layer also specifies reverse-inclusion transitions and the inflation-induced colimit for compact G and discrete U. Every declaration is a plan, and no stage is closed.

## Scope, ownership and conventions

The reviewed library audit shows that neither pinned library has nonabelian group cohomology: Mathlib lists it as a TODO in `GroupCohomology/LowDegree.lean`. The only nonabelian H¹ in Mathlib is the Čech one of presheaves of groups on a site. Tau Ceti has explicit continuous cohomology in degrees 0–2 for topological modules (`TauCeti.ContCohomology`). The RP.3 audit row records that NC.3 owns the torsor-valued H¹ and its twists. This component therefore builds nonabelian H¹ for continuous actions of topological groups and compares it with Tau Ceti's abelian version, without duplicating it.

The conventions follow Kim, *The motivic fundamental group of P¹ ∖ {0, 1, ∞} and the theorem of Siegel*, §1:

- The coefficient group U is an arbitrary topological group on which a topological group G acts continuously by automorphisms.
- A 1-cocycle is a continuous map with c(gh) = c(g)·g•c(h). The factor order matters when U is not commutative, and Mathlib's commutative `IsMulCocycle₁` uses the other order.
- U acts on cocycles by (u·c)(g) = u·c(g)·(g•u)⁻¹, and H¹(G, U) is the orbit set, a pointed set.

The algebraic structure Kim puts on H¹ (representability by pro-varieties, from his weight filtrations and inductive-limit topologies) is not part of this component. Neither are local conditions or Selmer varieties. They are listed in the coverage.

The exact sequence for a subgroup A ≤ B that need not be normal, H⁰(G, B/A) → H¹(G, A) → H¹(G, B), is included because Kim uses it for the crystalline condition. It needs no continuous section. The connecting map to H² for a central extension does need one; for unipotent groups an algebraic splitting supplies it.


## NC.0 — the owned étale K(π,1) interface

The owner is the reserved node AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1. The finite-coefficient predicate is meaningful for connected locally noetherian schemes. The raw pro-homotopy comparison has its own geometric-unibranch variety hypotheses. Do not interchange full finite coefficients, p-primary coefficients, constant Fₚ, and maximal-pro-p fundamental groups.

The canonical comparison, its actual source and target, and all degrees are part of the contract. Testing only degrees zero and one falsely accepts the projective line. Conversely nonzero higher étale cohomology does not itself disprove K(π,1): group cohomology may be nonzero too. Only the comparison's being an isomorphism is tested.

### Étale K(π,1) for a specified finite coefficient class

Declaration: TauCeti.EtaleKPiOne.Is. Node: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1.

Let X be a connected locally noetherian scheme with geometric point x. Put π = π₁ᵉᵗ(X,x), the profinite SGA fundamental group. Let C specify an isomorphism-invariant class of finite discrete abelian groups with continuous π-action, transported along pointed fundamental-group isomorphisms. Define Is(X,x;C) to mean that, for every M in C and every integer n ≥ 0, the canonical comparison εⁿ_M : Hⁿ_cont(π,M) → Hⁿ_et(X,L_x(M)) is an isomorphism of abelian groups. L_x(M) is the finite locally constant étale sheaf corresponding to M, not an arbitrary constructible sheaf. The default full property uses all finite continuous π-modules. The p-primary property uses those whose underlying finite group has p-power order, with p prime; the constant-Fₚ comparison is a separately named specialization, not the definition of either full property. None of these coefficient restrictions changes π to its maximal pro-p quotient.

Hypotheses:

- Connected locally noetherian X; an actual geometric point x and profinite finite-étale fibre-functor fundamental group.
- C is invariant under coefficient isomorphisms and transported by fundamental-group isomorphisms. No invertibility assumption on coefficient orders in this definition.

Proof or construction:

1. Import the non-affine finite-étale category, geometric-point fibre functor and profinite π from IG.0, building on the native abstract Galois-category API and affine finite-étale fibres.
2. Import the exact finite continuous π-module / finite locally constant sheaf dictionary and its natural canonical cohomology comparison from SF.2, with the π-action from IG.0. Native continuousCohomology already supplies all cochain degrees; its agreement with derived discrete continuous cohomology for these coefficients is a requested comparison, not a new cohomology definition.
3. Quantify over every allowed coefficient and every nonnegative degree; take isomorphism of the canonical map, not existence of an unrelated group isomorphism. Restriction of C is a logical implication. Geometric/base-point transports are separate lemma nodes.
4. The cohomological predicate makes sense on all connected locally noetherian schemes. Identification with Schmidt–Stix's raw pro-homotopy definition is the separately scoped raw-homotopy-comparison node; no such identification is asserted outside its verified hypotheses.

Required uses:

- PAPER-SCHMIDT-STIX-16/14: State the curve and product K(π,1) contracts and the finite-cover cohomological criterion.
- PAPER-SCHMIDT-STIX-16/31: Compare the full property with the classifying morphism and higher raw étale homotopy, with the profiniteness hypotheses visible.
- PAPER-SCHMIDT-STIX-16/68: Certify characteristic-zero Artin neighbourhoods, without reconstructing moduli schemes.
- PAPER-FARB-KISIN-WOLFSON-24/005; §2.3.1: Supply the actual constant-Fₚ comparison in every degree, while retaining the larger coefficient class.
- PAPER-FARB-KISIN-WOLFSON-24/091 and /146; Lemma 3.2.2: Provide the full K(π,1) interface consumed by torus torsors over abelian varieties; the special pro-p inflation is an additional theorem, not built into the definition.

API:

- TauCeti.EtaleKPiOne.Is.edgeIso (projection): From Is(X,x;C), for M in C and n ≥ 0, obtain the inverse of the canonical εⁿ_M with both inverse identities; it is natural in equivariant coefficient homomorphisms.
- TauCeti.EtaleKPiOne.Is.iff_all_comparisons (characterisation): Is(X,x;C) holds exactly when εⁿ_M is an isomorphism for every M in C and every n ≥ 0; checking only n ≤ 1 is not sufficient.
- TauCeti.EtaleKPiOne.Is.of_subclass (functoriality): If C′ ⊆ C, then Is(X,x;C) implies Is(X,x;C′); in particular full finite coefficients imply p-primary coefficients and constant-Fₚ comparison.
- TauCeti.EtaleKPiOne.Is.pointedIso_iff (functoriality): For a pointed scheme isomorphism f:(X,x) ≅ (Y,y), Is(X,x;f*D) iff Is(Y,y;D), using transported coefficients and the natural comparison square.
- TauCeti.EtaleKPiOne.Is.basePoint_iff (compatibility): For geometric points x,y and an étale path between their finite-étale fibre functors, Is(X,x;C) iff Is(X,y;transport C); full and p-primary classes are invariant under every such transport.
- TauCeti.EtaleKPiOne.Is.zero_coefficients (simp): For the class containing only the zero π-module, every comparison is 0 → 0 and Is(X,x;C) holds; this case is not evidence for the full property.
- TauCeti.EtaleKPiOne.Is.constantFp_edgeIso (compatibility): For p prime, the full or p-primary property supplies Hⁿ_cont(π,Fₚ) ≅ Hⁿ_et(X,Fₚ) via ε in every degree, with trivial π-action; the group in the source is still π.

Discriminating tests:

- TauCeti.EtaleKPiOne.tests.field (degenerate): For every field K and separable geometric point, Is(Spec K,x;all finite coefficients) holds and π identifies with Gal(K_sep/K), with ε equal to the Galois-cohomology comparison.
- TauCeti.EtaleKPiOne.tests.projective_line_degree_two (non-example): For algebraically closed k and prime ℓ invertible in k, π₁ᵉᵗ(P¹_k)=1 and H²_et(P¹_k,Z/ℓ) ≅ Z/ℓ is nonzero, while H²_cont(1,Z/ℓ)=0; hence the full property and the ℓ-primary property both fail although degrees zero and one agree.
- TauCeti.EtaleKPiOne.tests.affine_curve (characterisation): For a geometrically connected smooth affine curve over a characteristic-zero field, including Gₘ and P¹ minus {0,1,∞}, the full finite-coefficient property holds; no claim that every open immersion preserves it is involved.
- TauCeti.EtaleKPiOne.tests.positive_genus (characterisation): For a geometrically connected smooth proper curve of genus at least one over a characteristic-zero field, the full property holds. Nonzero H²_et of an elliptic curve does not contradict it: its profinite fundamental group need not have vanishing H².
- TauCeti.EtaleKPiOne.tests.product_char_zero (compatibility): For two geometrically connected geometrically unibranch characteristic-zero varieties with the full property, their product has it; over a non-algebraically-closed field the arithmetic π₁ of the product is the fibre product over Gal(k_sep/k), not the ordinary product.
- TauCeti.EtaleKPiOne.tests.artin_tower (characterisation): A finite characteristic-zero tower of smooth elementary curve fibrations ending in Spec k has the full property; this includes M₀,n for n ≥ 4 after importing its moduli construction and forgetting-mark fibrations.
- TauCeti.EtaleKPiOne.tests.pro_p_not_coefficient_restriction (non-example): The finite group C₂ acts on F₃ by negation. This is a 3-primary continuous coefficient with invariants 0. Its action does not descend to the trivial maximal pro-3 quotient of C₂; putting F₃ with trivial action on that quotient gives invariants F₃ instead. A p-primary coefficient restriction is not a licence to replace π by π^(p).
- TauCeti.EtaleKPiOne.tests.zero_class (degenerate): The zero-coefficient class passes on P¹, whereas the full and invertible-prime primary classes fail there. The class argument must not be erased.

Acceptance:

- Spec K passes for any field K; P¹ over an algebraically closed field fails full finite coefficients in degree two.
- Farb–Kisin–Wolfson §2.3.1 only consumes the constant-Fₚ edge comparison. Their Lemma 3.2.2 proves an additional pro-p comparison for its particular torus-torsor fundamental groups; it is not a general consequence of the coefficient restriction.

Prerequisites: mathlib:AlgebraicGeometry.Scheme, mathlib:AlgebraicGeometry.IsLocallyNoetherian, mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology, mathlib:continuousCohomology, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.2, mathlib:CategoryTheory.PreGaloisCategory.IsFundamentalGroup, mathlib:CommAlgCat.FiniteEtale, mathlib:CommAlgCat.FiniteEtale.fiber, mathlib:ZMod.instIsSimpleAddGroup, mathlib:ZMod.card, mathlib:ZMod.natCast_self, mathlib:ZMod.addOrderOf_one, mathlib:ZMod.unitOfCoprime, mathlib:ZMod.coe_unitOfCoprime, mathlib:Nat.card_zmod.

Sources:

- schmidt-stix-2016, §2.3, pp. 826–827; cohomological criterion in Lemma 2.7(b). Full finite coefficients are related to the raw homotopy definition under the separate comparison hypotheses.
- farb-kisin-wolfson-2024-v2, §2.3.1, p. 16; Lemma 3.2.2, p. 24. The constant-Fₚ edge map and the specially justified maximal-pro-p inflation are different inputs.

### Restriction of the allowed finite coefficients

Declaration: TauCeti.EtaleKPiOne.Is.of_subclass. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/coefficient-restriction.

If C′ ⊆ C, then Is(X,x;C) implies Is(X,x;C′); in particular full finite coefficients imply p-primary coefficients and constant-Fₚ comparison.

Hypotheses:

- The key definition applies; C′ ⊆ C on the same profinite π-module category.

Proof or construction:

1. For M in C′ use the inclusion to view M in C, then apply the same canonical εⁿ_M in each degree. No cohomological theorem or quotient of π is used.

Acceptance:

- Apply to all finite modules → p-primary modules → the trivial-action Fₚ module; do not assert either reverse implication.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1.

Sources:

- farb-kisin-wolfson-2024-v2, §2.3.1, p. 16. The constant-Fₚ comparison is obtained by specializing the full coefficient comparison.

### Invariance under pointed scheme isomorphism

Declaration: TauCeti.EtaleKPiOne.Is.pointedIso_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/pointed-isomorphism.

For a pointed scheme isomorphism f:(X,x) ≅ (Y,y), Is(X,x;f*D) iff Is(Y,y;D), using transported coefficients and the natural comparison square.

Hypotheses:

- A pointed scheme isomorphism; coefficient class transported along the induced π-isomorphism.

Proof or construction:

1. Use IG.0's fibre-functor transport and SF.2's naturality to form the comparison square with vertical cohomology isomorphisms.
2. Conjugate ε across this square. Its being an isomorphism is equivalent on the two schemes, for each coefficient and degree; reverse f for the converse.

Acceptance:

- The identity transport gives the same canonical comparison; composition of two pointed isomorphisms agrees with their composite.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.2.

Sources:

- schmidt-stix-2016, §2.3, p. 826; Appendix A.3. The K(π,1) condition is an isomorphism-invariant property; this node uses the cohomological interface.

### Change of geometric base point

Declaration: TauCeti.EtaleKPiOne.Is.basePoint_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/basepoint-transport.

For geometric points x,y and an étale path between their finite-étale fibre functors, Is(X,x;C) iff Is(X,y;transport C); full and p-primary classes are invariant under every such transport.

Hypotheses:

- An étale path, meaning an isomorphism between the two actual finite-étale fibre functors; transport of C along its profinite π-isomorphism.

Proof or construction:

1. Import IG.0's path-induced conjugacy transport of π-actions and SF.2's compatible locally constant sheaf identifications.
2. The induced cohomology isomorphisms commute with ε. Thus one canonical comparison is an isomorphism iff the other is.
3. A different path differs by an inner π-isomorphism. The transported finite module and sheaf are naturally isomorphic, so the all-finite and p-primary assertions do not depend on that path. This does not construct rational-point sections or tangential specializations.

Acceptance:

- Full and p-primary coefficient classes are unchanged by conjugacy; an arbitrary non-invariant class must be transported, not silently identified.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.2.

Sources:

- schmidt-stix-2016, §2.3, p. 826, sentence following the definition. The raw version has a separately stated geometric-unibranch base-point assertion; this node is the finite-fibre-functor cohomological transport.

### Finite-cover effacement criterion

Declaration: TauCeti.EtaleKPiOne.iff_finiteCover_effacement. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/finite-cover-effacement.

For a connected noetherian scheme X with geometric point x and a set of primes P, Is(X,x;P-supported finite coefficients) holds iff, for every connected finite étale cover Y→X, every finite abelian group A whose order has prime factors in P, every q≥2 and α∈H^q_et(Y,A) for the constant sheaf A, there exists a finite étale surjective Z→Y killing α. All primes recover the previous full-coefficient criterion for geometrically unibranch varieties. Every finite cover Y is quantified; constant coefficients only on X are insufficient.

Hypotheses:

- X is a connected noetherian scheme with a geometric point x; π is its full profinite finite-étale fundamental group.

- P is any set of primes. Allowed coefficients are finite locally constant abelian étale sheaves whose stalk orders have prime factors in P. No invertibility hypothesis on those primes is imposed.

Construction or proof:

1. For the forward direction, finite-etale-invariance gives the property on every connected finite cover. Apply all-coefficient-effacement to its constant coefficient A.

2. For the reverse direction, first trivialize each finite locally constant F on a finite étale cover of X. Split into finitely many connected components. The hypothesis kills all q≥2 classes on every component; q=1 classes die on their finite étale torsors. The two-cover extension lemma also permits reduction to constant prime-field tests on every finite cover.

3. Compose the trivializing and class-killing covers and use the natural pullback composition law. This gives the all-coefficient killing condition on X. Apply all-coefficient-effacement.

4. The direct cohomological proof uses the exact finite-direct-image/base-change and ρ/Leray inputs, not the raw-homotopy comparison. Ordinary étale-local coverings in place of finite étale covers are insufficient.

Acceptance:

- The cover X′ is part of the quantifier; replacing finite covers by arbitrary étale coverings or allowing only X′=X is not this criterion.

- The group-cohomology/finite-direct-image distinction is tested by C₂⊂S₃ with F₂ coefficients; the finite group model is a regression, not geometric certification.

- No raw-homotopy/profinite-completion equivalence outside geometric-unibranch varieties is inferred from this broader cohomological statement.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/all-coefficient-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-etale-invariance, AnabelianGeometryAndNonabelianChabauty:NC.0/effacement-extension, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.2.

Sources:

- schmidt-stix-2016, Lemma 2.7(b), proof, p. 827; finite-cover convention p. 821. Retains the original constant-coefficient, all-finite-cover statement in its narrower variety scope; the fresh Achinger sources supply its direct cohomological proof and explicitly broader prime-supported noetherian form.

- achinger-effacement-2014-v1, Proposition 3.4(a–b), pp. 7–8. Supplies the broader noetherian cohomological route; constant coefficients require quantifying all finite covers.

- achinger-all-primes-2017, Proposition 4.2(a–c); Lemma 4.3. All-prime convention and prime-field dévissage, without geometric-unibranch hypotheses for this cohomological criterion.

### Comparison with raw étale K(π,1)

Declaration: TauCeti.EtaleKPiOne.iff_raw_etale_aspherical. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison.

For a connected geometrically unibranch variety X with geometric point x, the full finite-coefficient property agrees with the raw étale K(π,1) condition π⁽raw⁾ₙ(X_et,x_et)=0 for every n ≥ 2, equivalently the canonical classifying morphism X_et → Bπ₁(X_et,x_et) is an isomorphism in Ho(pro-ss_*). Here π₁(X_et,x_et) is profinite in this scope and identified with the SGA finite-étale π used by the cohomological definition. This equivalence is not asserted for an arbitrary non-geometrically-unibranch locally noetherian scheme.

Hypotheses:

- Connected geometrically unibranch variety, not an arbitrary locally noetherian scheme.
- Full finite coefficients; a p-primary coefficient comparison alone is not an assertion about all raw higher homotopy groups.

Proof or construction:

1. Use the finite-cover-effacement node and the cohomological weak-equivalence criterion of Artin–Mazur Theorem 4.3, as invoked for this precise scope by Schmidt–Stix §2.3.
2. Import, rather than rebuild in NC.0, the raw étale pro-space and homotopy groups, their profinite-π identification in the stated scope, and the classifying morphism. These types/theorems are a recorded generic étale-homotopy foundation gap.
3. Schmidt–Stix Proposition A.16 constructs the map corresponding to id_π₁ through the nerve of the fundamental groupoid. Corollary A.18 then tests isomorphism on all homotopy groups: the π₁ map is the identity and Bπ₁ has no higher groups. The model-category and cohomological-detection proof leaves remain explicit, not routine automation.

Acceptance:

- The canonical map is essential, not an arbitrary equivalence. Outside the geometric-unibranch scope raw π₁ may be a non-profinite pro-group, even though its profinite completion is the SGA π₁.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-cover-effacement, InverseGaloisAndArithmeticFundamentalGroups:IG.0.

Sources:

- schmidt-stix-2016, §2.3, pp. 826–827; Proposition A.16, Definition A.17 and Corollary A.18, pp. 864–866. Relates the full coefficient interface to the paper's actual raw definition, without identifying all pro-groups with their profinite completions.

### Fields are étale K(π,1)

Declaration: TauCeti.EtaleKPiOne.field. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/field.

For every field K, with a separable geometric point x of Spec K, Is(Spec K,x;all finite coefficients) holds. Under π ≅ Gal(K_sep/K), its comparison εⁿ_M is the canonical Galois-cohomology isomorphism in every degree and for every finite discrete continuous Galois module M.

Hypotheses:

- K is a field; choose a separable closure inside the geometric-point field.

Proof or construction:

1. IG.0 identifies finite étale K-schemes and their fibre functor with finite continuous Galois sets.
2. SF.2 imports Stacks 03QQ: abelian étale sheaves on Spec K correspond to discrete continuous Galois modules, global sections correspond to invariants, and their derived functors identify in every degree.
3. Restrict that actual derived-functor comparison to finite modules. Its direction agrees with ε, so the quantified definition holds; invoke coefficient-restriction for every subclass.

Acceptance:

- For separably closed K, π=1 and all positive cohomology vanishes. For general K, higher Galois cohomology need not vanish: K(π,1) does not mean Hⁿ_et=0.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/coefficient-restriction, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.2.

Sources:

- stacks-etale-tests, 03QQ. The complete selected section gives the sheaf/module equivalence and canonical derived global-sections comparison.

### The degree-two obstruction on the projective line

Declaration: TauCeti.EtaleKPiOne.not_projectiveLine. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/projective-line-obstruction.

For algebraically closed k and prime ℓ invertible in k, P¹_k does not have the full finite-coefficient property, and does not have the ℓ-primary property. For M=Z/ℓ with trivial action, ε²_M has source zero and target isomorphic to Z/ℓ; it is not an isomorphism.

Hypotheses:

- Algebraically closed k; prime ℓ distinct from char k, so ℓ ≥ 2 and its constant coefficient is nonzero.

Proof or construction:

1. Import the geometric finite-étale fundamental-group computation π₁(P¹_k)=1 from IG.0.
2. Import SF.2's canonical smooth projective curve computation H²_et(P¹_k,μ_ℓ) ≅ Z/ℓ (Stacks 03RQ); a choice of primitive ℓth root gives the corresponding noncanonical identification for the constant Z/ℓ sheaf.
3. The continuous cohomology of the trivial group in degree two is zero by the requested native/derived comparison and trivial-group calculation. The target is nonzero, so ε² cannot be an isomorphism; its coefficient belongs to both classes.

Acceptance:

- Degrees zero and one agree in this example. A definition checking only these degrees would falsely accept P¹. Do not use μ_p ≅ constant Z/p in characteristic p.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.2.

Sources:

- stacks-etale-tests, 03RQ. The selected statement and proof give the higher cohomology of a smooth projective curve with invertible torsion coefficients.

### Smooth curves of affine or positive-genus type

Declaration: TauCeti.EtaleKPiOne.smooth_curve_charZero. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/smooth-curve.

For a geometrically connected smooth curve C over a characteristic-zero field k, if C is affine or its smooth proper model has genus at least one, then Is(C,x;all finite coefficients) holds for every geometric point x.

Hypotheses:

- Smooth geometrically connected curve over a characteristic-zero field; affineness or positive genus of its smooth proper model.

- The genus-zero proper curve is excluded.

Proof or construction:

1. Base change C to the fixed separable closure k_s. In characteristic zero k_s is algebraically closed; SF.3 preserves smoothness, geometric connectedness, affineness and genus of the smooth proper model.

2. Apply geometric-smooth-curve. Its proof works on every connected finite étale cover: affine higher cohomology vanishes, while positive-genus projective degree-two classes die on connected prime-degree covers. The degree-one canonical comparison is used to obtain covers and does not assume K(π,1).

3. Apply separable-base-change to descend the full finite-coefficient property to C, and use basepoint-transport for the chosen geometric point. No raw-homotopy theorem or identification of arithmetic and geometric étale cohomology is used.

4. Schmidt 1996 Proposition 15 and Schmidt–Stix Lemma 2.7(a) give the broader raw any-field result. This node retains its original characteristic-zero geometric-curve scope. Generic supplier inputs and typing gaps remain open; the direct cohomological proof does not close raw-homotopy-comparison.

Acceptance:

- Gₘ and P¹ minus {0,1,∞} pass. A smooth proper genus-one curve passes; P¹ fails by the separate degree-two obstruction.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/geometric-smooth-curve, AnabelianGeometryAndNonabelianChabauty:NC.0/separable-base-change, AnabelianGeometryAndNonabelianChabauty:NC.0/basepoint-transport, SchemeAndStackFoundations:SF.3.

Sources:

- schmidt-stix-2016, Lemma 2.7(a), p. 827, citing Schmidt 1996 Proposition 15. The source asserts an any-field raw theorem. The retained characteristic-zero cohomological conclusion now has the separate prime-cover/effacement/descent proof decomposition, while raw and generic supplier leaves remain open.

- schmidt-curve-1996, Proposition 15, proof, printed pp. 243–244. The proof needs finite étale covers of p-divisible degree; this node explicitly supplies a connected prime-degree cover instead of assuming that assertion.

- achinger-effacement-2014-v1, Proposition 3.4(c), p. 8. The direct separable-closure reduction replaces the inherited raw-homotopy dependency without changing the theorem statement.

### One cover kills a finite family of positive-degree classes

Declaration: TauCeti.EtaleKPiOne.exists_connected_cover_kills_finiteFamily. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/positive-family-effacement.

Let W be a connected noetherian scheme with a geometric point and the full finite-coefficient étale K(π,1) property. For any finite index set I, primes p_i, positive degrees q_i and classes a_i in H^{q_i}_et(W,F_{p_i}), with constant coefficients, there is a pointed connected finite étale surjective f:W′→W such that f*a_i=0 for every i. The cover may depend on the entire finite family.

Hypotheses:

- The full canonical finite-coefficient property of W; I is finite and every q_i>0. A lift of the geometric point is selected on each cover. No uniform cover for all classes or degrees is asserted.

Proof or construction:

1. Use all-coefficient-effacement with each constant finite F_{p_i} sheaf to choose one finite étale surjective cover killing a_i. This criterion covers every q_i>0, including degree one; the prime-field criterion stated only in degrees at least two cannot replace it here.
2. Use IG.0's pointed finite-cover dictionary and connected-component/refinement contract: take the finite fibre product of the chosen covers over W and its connected component through the tuple of chosen geometric lifts. That component is finite étale surjective over connected noetherian W and maps to every chosen cover.
3. Use SF.2's canonical pullback composition and zero-preservation: each class remains zero after refinement. For I empty choose id_W. The connected component is selected using the chosen point, not a normality assumption.

Acceptance:

- The empty family is killed by the identity cover; a family of zero classes also needs no enlargement.
- A family containing a degree-one class is included. In the elementary H¹ torsor argument, the finite étale F_p torsor acquires a section after pullback to itself and then to its chosen connected component.
- Only finitely many killing covers are intersected. No claim of an open subgroup simultaneously killing infinitely many classes is used.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.0/all-coefficient-effacement, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.2.

Sources:

- schmidt-stix-2016, Lemma 2.7(b), full printed proof, p.827. Explicit finitary decomposition of the cited product argument; this intermediate assembly is a deduction, not a separately printed theorem.

### Prime-field effacement on every cover of a product

Declaration: TauCeti.EtaleKPiOne.exists_product_refinement_kills_primeField_class. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/product-cover-effacement.

Let X,Y be geometrically connected geometrically unibranch varieties over an algebraically closed characteristic-zero field k, each with the full finite-coefficient étale K(π,1) property. For a pointed connected finite étale cover Z→X×_kY, a prime p, q>0 and c∈H^q_et(Z,F_p), there are pointed connected finite étale covers X″→X and Y″→Y and a finite étale surjective map h:X″×_kY″→Z over X×_kY such that h*c=0. The two covers may depend on Z,p,q,c; Z itself need not be a product or a Galois cover.

Hypotheses:

- Algebraically closed k of characteristic zero; separated finite-type geometrically connected geometrically unibranch X and Y; their full canonical finite-coefficient properties; constant F_p with p prime and q>0.

Proof or construction:

1. IG.0 supplies the projection-compatible geometric π₁ product isomorphism and pointed covers/finite-continuous-set dictionary. If K is the open subgroup for Z in G×H, take U=i_G⁻¹K and V=i_H⁻¹K with i_G(g)=(g,1), i_H(h)=(1,h). Use native OpenSubgroup.comap/prod, Subgroup.prod_le_iff and map_le_iff_le_comap to obtain U×V≤K, maximal among such rectangles. Compactness makes both coset sets finite without requiring K normal.
2. The same IG.0 dictionary realizes U,V as connected covers X′,Y′, and the equivariant surjection (G×H)/(U×V)→(G×H)/K as a finite étale surjective map X′×Y′→Z. This realizes a domination, not an isomorphism with Z.
3. Pull c back to X′×Y′. SF.2 supplies the canonical, pullback-natural external-product isomorphism ⊕_{i+j=q} H^i_et(X′,F_p)⊗_{F_p}H^j_et(Y′,F_p)→H^q_et(X′×Y′,F_p). It is the constant-prime-field specialization of Stacks 59.97.9 followed by the generic complexes-over-a-field comparison. Every tensor and the direct sum have finite support; no choice of cohomology basis or finite-dimensionality is needed.
4. Write the pulled-back class as a finite sum of a_s×b_s. For each summand choose a_s if its degree is positive, and otherwise b_s, whose degree is then q>0. Finite-etale-invariance gives the full property of X′ and Y′. Apply positive-family-effacement to the two finite designated families to get X″→X′ and Y″→Y′. Degree one, including an H¹⊗H¹ summand in degree two, must be included.
5. Naturality and bilinearity of the actual external product make every pulled-back summand zero, hence kill c. Compose the refinement with X′×Y′→Z. Product/base-change/composition preservation of finite étaleness and surjectivity are imported from IG.0/SF.2, as are connectedness and geometric-unibranch stability.

Acceptance:

- For the diagonal K in C₂×C₂, the quotient has two cosets while the largest contained product subgroup is trivial and has four cosets. The proof requires a product refinement, not that the original cover be a product.
- The diagonal in S₃×S₃ is nonnormal, yet its finite coset set and the rectangular domination are valid. No quotient-group structure is required.
- For graded F₂ spaces having generators in degrees 0,1,2, maps killing degree two but preserving degree one retain the nonzero H¹⊗H¹ coordinate in total degree two. Killing every positive-degree designated factor removes it.
- For R=Z/4 and the free cochain complex C=[R --2→ R] in degrees 0,1, both H⁰(C)⊗_R H⁰(C) and H⁰(C⊗_R C) have order two, but the canonical map is zero: the generating cycles 2⊗2 map to 4=0. An abstract isomorphism or a degreewise tensor formula over arbitrary torsion coefficients cannot replace the prime-field canonical map.

Regression contracts:

- TauCeti.EtaleKPiOne.ProductSmoke.diagonal_C2 (non-example): For the diagonal K in C₂×C₂, the quotient has two cosets while the largest contained product subgroup is trivial and has four cosets. The proof requires a product refinement, not that the original cover be a product.
- TauCeti.EtaleKPiOne.ProductSmoke.diagonal_S3_nonnormal (non-example): The diagonal in S₃×S₃ is nonnormal, yet its finite coset set and the rectangular domination are valid. No quotient-group structure is required.
- TauCeti.EtaleKPiOne.ProductSmoke.mixed_degree_one (non-example): For graded F₂ spaces having generators in degrees 0,1,2, maps killing degree two but preserving degree one retain the nonzero H¹⊗H¹ coordinate in total degree two. Killing every positive-degree designated factor removes it.
- TauCeti.EtaleKPiOne.ProductSmoke.nonfield_canonical_map (non-example): For a,b in Z/4 with 2a=2b=0, ab=0; nevertheless 2 is nonzero and satisfies 2·2=0. This exact arithmetic fixture detects the zero canonical cycle-product map in the free complex [Z/4 --2→ Z/4]; its homology/tensor bridge is an explicitly untyped generic input.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.0/positive-family-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-etale-invariance, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.2, mathlib:Subgroup.prod, mathlib:Subgroup.prod_le_iff, mathlib:Subgroup.map_le_iff_le_comap, mathlib:OpenSubgroup.comap, mathlib:OpenSubgroup.prod, mathlib:Subgroup.quotient_finite_of_isOpen.

Sources:

- schmidt-stix-2016, Lemma 2.7(b), full printed proof, p.827. Explicit finitary decomposition of the cited product argument; this intermediate assembly is a deduction, not a separately printed theorem.
- stacks-product-kunneth-20261002, Section 59.97, Lemma 59.97.9 and printed proof; canonical map in 59.97.8. The natural derived comparison permits nonproper factors and invertible coefficient order. Its field-coefficient degreewise specialization and all transitive proof leaves remain explicit supplier obligations.

### Binary geometric products preserve the full property

Declaration: TauCeti.EtaleKPiOne.product_algebraicallyClosed. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/geometric-product.

Over an algebraically closed characteristic-zero field k, the product X×_kY of two geometrically connected geometrically unibranch k-varieties with the full finite-coefficient étale K(π,1) property has that full property, defined by the canonical comparisons in all degrees and with its full profinite fundamental group.

Hypotheses:

- Both factors are separated finite-type geometrically connected geometrically unibranch k-varieties; k algebraically closed of characteristic zero; all finite coefficients.

Proof or construction:

1. Use the imported product-stability contracts to ensure the product is connected noetherian and geometrically unibranch.
2. For every connected finite étale Z→X×Y, every prime p and q≥2, product-cover-effacement supplies a finite étale surjective refinement killing each constant-F_p class.
3. Apply the already owned prime-field-effacement criterion with P the set of all primes. Its coefficient trivialization and dévissage recover every finite continuous coefficient module, not merely constant F_p. Preserve the canonical comparison and the full fundamental group.

Acceptance:

- The conclusion is not the vanishing of H^q_et(X×Y,F_p). It is that the canonical group-to-sheaf comparison is an isomorphism.
- The two factors may be nonproper. No maximal-pro-p quotient or universal one-cover killing assertion is substituted.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/product-cover-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/prime-field-effacement, InverseGaloisAndArithmeticFundamentalGroups:IG.0, SchemeAndStackFoundations:SF.2.

Sources:

- schmidt-stix-2016, Lemma 2.7(b), full printed proof, p.827. Explicit finitary decomposition of the cited product argument; this intermediate assembly is a deduction, not a separately printed theorem.

### Characteristic-zero products of étale K(π,1) varieties

Declaration: TauCeti.EtaleKPiOne.product_charZero. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/products.

Over a characteristic-zero field k, a finite product of geometrically connected geometrically unibranch k-varieties having the full finite-coefficient property again has that property.

Hypotheses:

- Each factor is a geometrically connected geometrically unibranch variety; k has characteristic zero; full finite coefficients.

Proof or construction:

1. Use the already owned separable-base-change equivalence to pass to the algebraic closure of k; characteristic zero identifies the separable and algebraic closures. Its finite-cover/class descent and eventual-zero continuity inputs remain open, and no restriction-map injectivity is asserted.
2. For two geometric factors apply geometric-product. Its product-cover-effacement proof kills one prime-field class on every arbitrary connected finite cover, using connected product refinements and finite families including degree one.
3. Induct on the finite number of factors. The empty product is Spec k by field; the one-factor case is the hypothesis. Import product stability of the geometric conditions so every induction step satisfies geometric-product.
4. Apply separable-base-change back over k. The geometric rectangular-subgroup argument is not applied to the two arithmetic groups: their product group over k is a fibre product over G_k.

Acceptance:

- Over nonclosed k the arithmetic product π₁ is a fibre product over G_k, not a direct product. No positive-characteristic product theorem is asserted.
- The empty product is Spec k and the one-factor product is the original variety. Every binary step imports geometric connectedness and geometric-unibranch stability.
- No further universal-cover filtered cohomology interchange is needed specifically for this product assembly; affine-transition continuity remains necessary in its separable-base-change prerequisite.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/geometric-product, AnabelianGeometryAndNonabelianChabauty:NC.0/separable-base-change, AnabelianGeometryAndNonabelianChabauty:NC.0/field, InverseGaloisAndArithmeticFundamentalGroups:IG.0, InverseGaloisAndArithmeticFundamentalGroups:IG.1, SchemeAndStackFoundations:SF.2.

Sources:

- schmidt-stix-2016, Lemma 2.7(b) and proof, p. 827. The proof explicitly uses SGA 1 XIII Proposition 4.6 and étale Künneth; their full proof audits remain requested.

### Elementary curve fibrations preserve étale K(π,1)

Declaration: TauCeti.EtaleKPiOne.elementary_fibration_charZero. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/elementary-fibration.

Let f:X→Y be an elementary fibration of smooth connected varieties over a characteristic-zero field: X is the complement of a divisor D, finite étale over Y, in a smooth proper geometrically connected curve family X̄→Y, and each fibre of X→Y is a nonempty affine curve. If Y has the full finite-coefficient property, then X has it.

Hypotheses:

- Smooth connected varieties and the specified elementary curve fibration; characteristic zero; full finite coefficients on Y.

Proof or construction:

1. Use raw-homotopy-comparison to turn the hypothesis on Y into vanishing of its higher raw étale homotopy. The geometric fibre is a smooth affine curve, hence has the raw property by smooth-curve.
2. Pull f back over the filtered pointed finite étale covers of Y. The missing generic homotopy foundation must supply Friedlander Theorem 11.5's long homotopy exact sequence here, and Schmidt–Stix Lemma 2.1's invariance of higher groups under finite covers.
3. That sequence, together with π₁ of the universal finite-cover system of Y being trivial, identifies the higher homotopy exact sequence for X_y → X → Y. In each degree n ≥ 2 the fibre and base terms vanish, hence so does πₙ(X).
4. Convert back with raw-homotopy-comparison. The higher homotopy sequence is explicitly a gap; the arithmetic π₁ exact sequence of IG.1 alone cannot replace it.

Acceptance:

- An iterated tower must retain the smooth/proper compactification and finite étale boundary data; a general smooth morphism is not covered.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison, AnabelianGeometryAndNonabelianChabauty:NC.0/smooth-curve.

Sources:

- schmidt-stix-2016, Proposition 2.8 and proof, pp. 827–828; Lemma 2.1, pp. 821–822. The full selected proof uses a generic homotopy fibration theorem, not just arithmetic π₁ exactness.

### Artin towers give étale K(π,1) examples

Declaration: TauCeti.EtaleKPiOne.artin_tower_charZero. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/artin-neighbourhood.

For a finite tower X=X_r→⋯→X₀=Spec k of smooth connected characteristic-zero varieties with each arrow an elementary curve fibration as specified in elementary-fibration, X has the full finite-coefficient property. In particular this applies to strongly hyperbolic Artin neighbourhoods of Schmidt–Stix Definition 6.1, whose additional product-embedding condition must not be omitted when naming that stronger notion.

Hypotheses:

- Characteristic-zero field; finite tower with actual elementary-fibration data at every arrow.

Proof or construction:

1. The initial field is K(π,1) by the field node.
2. Induct on the length, applying elementary-fibration at each arrow. The stronger hyperbolicity and product embeddings are not required for this induction but are required to call the object strongly hyperbolic.
3. For M₀,n with n ≥ 4, import the moduli scheme and its forgetting-mark elementary fibrations from the reserved StableReductionPartII moduli-curves owner. That supplier is not yet a typed input, so the instance remains an acceptance obligation rather than a fabricated local moduli construction.

Acceptance:

- M₀,4=P¹ minus {0,1,∞}; the n-to-n−1 forgetting-mark tower gives the higher-n example once its supplier is available. This does not prove the anabelian reconstruction theorem of Schmidt–Stix §6.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.0/field, AnabelianGeometryAndNonabelianChabauty:NC.0/elementary-fibration.

Sources:

- schmidt-stix-2016, Definition 6.1 and following M₀,n example, p. 845. Separates the elementary-fibration K(π,1) induction from the additional product-embedding hypothesis of strongly hyperbolic Artin neighbourhoods.

### Why the proof leaves stay visible

The finite-cover criterion quantifies connected finite covers before their constant-coefficient classes. Its cohomological proof is the all-coefficient criterion, finite-direct-image transport and two-cover dévissage developed below. The canonical all-degree group interfaces come from ProfiniteCohomology; SF.2 supplies the finite-étale topos, actual base-change/derived maps and Leray. These generic interfaces are requested with their precise maps, while NC.0 owns their K(π,1) assembly.

The product proof specializes the canonical derived Künneth comparison to constant prime-field coefficients, kills finitely many designated positive-degree factor classes, and applies the all-covers criterion. A tensor-only formula for arbitrary finite coefficients is not asserted. Degree-one classes must be included: an H¹⊗H¹ summand can contribute in degree two. Its arithmetic fundamental group over a nonclosed field is a fibre product over G_k. The elementary-fibration proof needs a higher étale homotopy exact sequence on universal-cover pullbacks. IG.1's arithmetic π₁ sequence does not supply that result.

The selected Schmidt–Stix proofs explicitly delegate important leaves. Schmidt 1996 Proposition 15, Artin–Mazur 4.3/11.1, Friedlander 11.5 and the SGA inputs were not separately read here, so their exact statements and roles are requests/gaps. No new node is advertised as closed.

## The nonabelian cohomology component

### Continuous 1-cocycles and invariants with nonabelian coefficients

Declaration: TauCeti.NonabelianCohomology.Z1. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles.

Let G be a topological group and U a topological group on which G acts by group automorphisms, continuously (G × U → U continuous). The invariants are H⁰(G, U) := U^G = {u ∈ U : g•u = u for all g}, a subgroup of U (Mathlib FixedPoints.subgroup). The continuous 1-cocycles are Z¹(G, U) := {c : G → U continuous : c(gh) = c(g)·(g•c(h)) for all g, h ∈ G}, with the trivial cocycle 1 (the constant map to the identity) as base point.

Hypotheses: G is a topological group and U a topological group with an action of G by group automorphisms (MulDistribMulAction G U) such that the action map G × U → U is continuous (ContinuousSMul G U). No commutativity of U; for U commutative written additively the definitions agree with Tau Ceti's explicit continuous cohomology (NC.3/abelian-comparison).

Proof or construction:

1. Definition as stated; H⁰ is FixedPoints.subgroup for the MulDistribMulAction.
2. Elementary identities: c(1) = 1 (put g = h = 1), c(g⁻¹) = g⁻¹•(c(g)⁻¹) (put h = g⁻¹), and the coboundaries g ↦ u·(g•u)⁻¹ are cocycles: u·(gh•u)⁻¹ = u(g•u)⁻¹·g•(u(h•u)⁻¹) because g acts by automorphisms. The coboundary of u is continuous since g ↦ g•u is continuous.
3. Trivial action: then the cocycle condition says c is a homomorphism, so Z¹(G, U) is the set of continuous homomorphisms G → U (ContinuousMonoidHom).

The required uses are:

- AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1: H¹ is the orbit set of Z¹ under twisted conjugation.
- AnabelianGeometryAndNonabelianChabauty:NC.3/torsor-classification: A point of a torsor gives a cocycle.
- AnabelianGeometryAndNonabelianChabauty:NC.4: The global and local Selmer maps take a rational point to the class of the cocycle of its path torsor.

The API supplies:

- TauCeti.NonabelianCohomology.H0: H⁰(G, U) = FixedPoints.subgroup G U, the subgroup of G-invariant elements.
- TauCeti.NonabelianCohomology.Z1: The type of continuous maps c : G → U with c(gh) = c(g)·g•c(h).
- TauCeti.NonabelianCohomology.Z1.mem_iff: c ∈ Z¹ iff c is continuous and satisfies the cocycle identity.
- TauCeti.NonabelianCohomology.Z1.one: The trivial cocycle g ↦ 1, the base point.
- TauCeti.NonabelianCohomology.Z1.map_one: c(1) = 1 for every cocycle.
- TauCeti.NonabelianCohomology.Z1.map_inv: c(g⁻¹) = g⁻¹•(c(g)⁻¹).
- TauCeti.NonabelianCohomology.Z1.coboundary: For u ∈ U, the cocycle g ↦ u·(g•u)⁻¹.
- TauCeti.NonabelianCohomology.Z1.equivContinuousMonoidHomOfTrivial: If G acts trivially, Z¹(G, U) ≃ (G →ₜ* U), continuous homomorphisms.
- TauCeti.NonabelianCohomology.Z1.ext: Two cocycles are equal iff they agree at every g.

Discriminating tests:

- TauCeti.NonabelianCohomology.tests.trivial_group (degenerate): If G is the trivial group, Z¹(G, U) = {1}.
- TauCeti.NonabelianCohomology.tests.trivial_action_hom (computation): For G = ℤ/2 (discrete) acting trivially on the symmetric group S₃ (discrete), Z¹(G, S₃) has exactly 4 elements: the trivial map and the three maps sending the generator to a transposition.
- TauCeti.NonabelianCohomology.tests.factor_order (non-example): For G = U = S₃ with the trivial action, the identity map satisfies c(gh) = c(g)·(g•c(h)) but not c(gh) = (g•c(h))·c(g) (it is a homomorphism, not an anti-homomorphism): the factor order of the cocycle condition matters for nonabelian U.
- TauCeti.NonabelianCohomology.tests.invariants (computation): For G = ℤ/2 acting on U = ℤ by negation, H⁰(G, U) = {0}; for the trivial action H⁰ = U.
- TauCeti.NonabelianCohomology.tests.continuity (non-example): For G = ∏_{n ∈ ℕ} ℤ/2 (profinite) acting trivially on U = ℤ/2 (discrete), Z¹(G, U) is countable (continuous characters factor through finitely many coordinates), whereas the abstract homomorphisms G → ℤ/2 are uncountable: dropping continuity changes Z¹.

Acceptance cases:

- The order of the factors matters when U is not commutative: the condition c(gh) = (g•c(h))·c(g) of Mathlib's commutative IsMulCocycle₁ defines a different set for nonabelian U (test below).
- Continuity is part of the definition. For compact G and discrete U, every continuous cocycle is identically1 on some open normal N, is constant on its cosets and takes values in the actual U^N. The quotient is finite. Descent must retain U^N; the action on all U need not factor through G/N. The native quotient-action/descent/inflation interfaces remain separate obligations.

Prerequisites: mathlib:MulDistribMulAction, mathlib:FixedPoints.subgroup, mathlib:ContinuousSMul, mathlib:IsTopologicalGroup, mathlib:ContinuousMap, mathlib:ContinuousMonoidHom, mathlib:groupCohomology.IsMulCocycle₁.

Sources:

- Kim 2005, §1, p. 6. The continuous 1-cocycle condition with nonabelian coefficients, in the factor order used here.
- Kim 2005, §1, p. 6. The base point.
- Poonen, §1.3.5, Definition 1.3.14, p. 11. Nonabelian cohomology exists in degrees 0 and 1 only.

### Nonabelian first cohomology as a pointed set

Declaration: TauCeti.NonabelianCohomology.H1. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1.

In the situation of NC.3/continuous-cocycles, U acts on Z¹(G, U) by (u·c)(g) := u·c(g)·(g•u)⁻¹. The first cohomology H¹(G, U) is the orbit set of this action (Mathlib MulAction.orbitRel.Quotient U (Z¹ G U)), pointed by the class of the trivial cocycle; two cocycles in one orbit are called cohomologous. The class of c is trivial iff c is a coboundary g ↦ u·(g•u)⁻¹.

Hypotheses: G is a topological group and U a topological group with an action of G by group automorphisms (MulDistribMulAction G U) such that the action map G × U → U is continuous (ContinuousSMul G U).

Proof or construction:

1. The formula defines a group action: (u·(v·c))(g) = u v c(g) (g•v)⁻¹ (g•u)⁻¹ = (uv) c(g) (g•(uv))⁻¹, since g acts by automorphisms; 1·c = c.
2. u·c is again a cocycle: (u·c)(gh) = u c(g) g•c(h) (gh•u)⁻¹, and (u·c)(g)·g•((u·c)(h)) = u c(g) (g•u)⁻¹ g•u g•c(h) g•(h•u)⁻¹, which agree. Continuity: u·c is a product of continuous maps (g ↦ g•u is continuous).
3. The orbit of the trivial cocycle is the set of coboundaries g ↦ u·(g•u)⁻¹, by definition of the action.
4. H¹ is a pointed set, not a group: there is no natural composition law when U is not commutative.

The required uses are:

- AnabelianGeometryAndNonabelianChabauty:NC.3/exact-sequence: The exact sequences are sequences of these pointed sets.
- AnabelianGeometryAndNonabelianChabauty:NC.3/central-extension: The abelian group H¹(G, Z) acts on H¹(G, B) for central Z.
- AnabelianGeometryAndNonabelianChabauty:NC.3/torsor-classification: Torsors are classified by H¹.
- AnabelianGeometryAndNonabelianChabauty:NC.4: Selmer varieties are subsets of H¹(G_T, U_n) cut out by local conditions.

The API supplies:

- TauCeti.NonabelianCohomology.Z1.instMulAction: The action (u·c)(g) = u·c(g)·(g•u)⁻¹ of U on Z¹(G, U).
- TauCeti.NonabelianCohomology.H1: H¹(G, U) = MulAction.orbitRel.Quotient U (Z¹ G U).
- TauCeti.NonabelianCohomology.H1.mk: The class map Z¹(G, U) → H¹(G, U).
- TauCeti.NonabelianCohomology.H1.mk_surjective: Every class has a representing cocycle.
- TauCeti.NonabelianCohomology.H1.mk_eq_mk_iff: mk c = mk c′ iff c′ = u·c for some u ∈ U.
- TauCeti.NonabelianCohomology.H1.instOne: The base point, the class of the trivial cocycle.
- TauCeti.NonabelianCohomology.H1.mk_eq_one_iff: mk c = 1 iff there is u ∈ U with c(g) = u·(g•u)⁻¹ for all g.
- TauCeti.NonabelianCohomology.H1.equivOfTrivial: For trivial action, H¹(G, U) ≃ (G →ₜ* U) modulo conjugation by U.

Discriminating tests:

- TauCeti.NonabelianCohomology.tests.h1_trivial_group (degenerate): If G is the trivial group, H¹(G, U) is a single point.
- TauCeti.NonabelianCohomology.tests.h1_S3 (computation): For G = ℤ/2 acting trivially on S₃ (both discrete), H¹(G, S₃) has exactly 2 elements: the base point and the class of the transpositions.
- TauCeti.NonabelianCohomology.tests.not_coboundary_quotient (non-example): In the same example, identifying cocycles c, c′ when c′(g) = c(g)·u(g•u)⁻¹ for some u gives 4 classes (the action is trivial, so every such b is trivial), not 2: the correct relation is twisted conjugation.
- TauCeti.NonabelianCohomology.tests.h1_abelian (compatibility): For G = ℤ/2 acting on U = ℤ/3 (additive, discrete) by negation, H¹ is a single point, agreeing with Tau Ceti's ContCohomology.H1 (the orders are coprime).

Acceptance cases:

- For trivial action, H¹(G, U) is the set of continuous homomorphisms G → U modulo conjugation by U.
- Cohomologous means related by the action; for nonabelian U this is not 'c′ = c·b for a coboundary b' (test below).

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles, mathlib:MulAction.orbitRel, mathlib:MulAction.orbitRel.Quotient.

Sources:

- Kim 2005, §1, p. 6. The twisted-conjugation action and H¹ as its orbit set.
- Kim 2009, Introduction, p. 4. The role of the nonabelian H¹ in Chabauty–Kim.

### Functoriality of nonabelian H⁰ and H¹

Declaration: TauCeti.NonabelianCohomology.H1.map. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/functoriality.

(a) A continuous G-equivariant group homomorphism f : U → U′ induces a homomorphism H⁰(G, U) → H⁰(G, U′) and maps Z¹(G, U) → Z¹(G, U′), c ↦ f ∘ c, and H¹(G, U) → H¹(G, U′), preserving base points, compatible with identities and composition, and with f(u·c) = f(u)·(f ∘ c). (b) A continuous group homomorphism φ : G′ → G, with G′ acting on U through φ, induces the restriction maps H⁰(G, U) → H⁰(G′, U) (inclusion) and Z¹(G, U) → Z¹(G′, U), c ↦ c ∘ φ, and H¹(G, U) → H¹(G′, U), base point preserving and functorial; in particular for a closed subgroup H ≤ G there is restriction H¹(G, U) → H¹(H, U). Maps of pointed sets that are compatible in this way are what the exact sequences (NC.3/exact-sequence) are built from.

Hypotheses: G is a topological group and U a topological group with an action of G by group automorphisms (MulDistribMulAction G U) such that the action map G × U → U is continuous (ContinuousSMul G U). In (a) U′ satisfies the same hypotheses and f is continuous with f(g•u) = g•f(u); in (b) φ is continuous and G′ acts on U by g′•u = φ(g′)•u.

Proof or construction:

1. (a) f ∘ c is continuous and f(c(gh)) = f(c(g))·f(g•c(h)) = f(c(g))·g•f(c(h)); f(u·c) = f(u)·(f∘c) because f(u c(g) (g•u)⁻¹) = f(u) f(c(g)) (g•f(u))⁻¹. So the map descends to orbits and sends the trivial cocycle to the trivial cocycle.
2. (b) c ∘ φ is continuous and (c∘φ)(g′h′) = c(φg′)·φ(g′)•c(φh′); the U-actions correspond, so the map descends.
3. Identities and composition hold on cocycles, hence on classes.

The API supplies:

- TauCeti.NonabelianCohomology.H1.map: The map H¹(G, U) → H¹(G, U′) induced by a continuous equivariant homomorphism.
- TauCeti.NonabelianCohomology.H1.map_one: H1.map f sends the base point to the base point.
- TauCeti.NonabelianCohomology.H1.map_id: H1.map id = id.
- TauCeti.NonabelianCohomology.H1.map_comp: H1.map (f′ ∘ f) = H1.map f′ ∘ H1.map f.
- TauCeti.NonabelianCohomology.H1.res: The restriction H¹(G, U) → H¹(G′, U) along a continuous homomorphism G′ → G.
- TauCeti.NonabelianCohomology.H1.res_comp: Restriction along a composite is the composite of restrictions.
- TauCeti.NonabelianCohomology.H0.map: The homomorphism of invariants induced by an equivariant homomorphism.

Acceptance cases:

- Restriction to the decomposition group at a place v, H¹(G_T, U) → H¹(G_v, U), is the case (b) of the inclusion G_v → G_T used for Selmer conditions.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, mathlib:ContinuousMonoidHom.

Sources:

- Kim 2009, §3, p. 25. Restriction maps and their functoriality, as used for local conditions.
- Kim 2005, §1, p. 7. Functoriality in the coefficients.

### Comparison with abelian continuous cohomology

Declaration: TauCeti.NonabelianCohomology.H1.equivContCohomology. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/abelian-comparison.

Let M be a commutative topological group written additively, with a continuous action of G by additive automorphisms, and U = Multiplicative M. With the induced action on U (Mathlib has no instance for it, so one is supplied), Z¹(G, U) is Tau Ceti's group of explicit continuous 1-cocycles ContCohomology.Z1 G M (cocycles c(gh) = c(g) + g•c(h), in Mathlib's IsCocycle₁ convention), the action of U on Z¹ is translation by the coboundaries d⁰(m)(g) = g•m − m up to sign, and the class map induces a bijection of pointed sets H¹(G, U) ≅ ContCohomology.H1 G M, sending the base point to 0. Consequently H¹(G, U) inherits a commutative group structure, H⁰(G, U) = ContCohomology.H0 G M, and for discrete G the cocycles are Mathlib's groupCohomology.IsMulCocycle₁ maps (the factor order being immaterial for commutative M).

Hypotheses: M a commutative topological additive group with a continuous DistribMulAction of G; G a topological group.

Proof or construction:

1. The multiplicative cocycle identity for Multiplicative M is additive: c(gh) = c(g) + g•c(h); continuity is the same condition. This is Tau Ceti's d¹-kernel description (ContCohomology.d1_apply: d¹f(g,h) = g•f(h) − f(gh) + f(g)).
2. The action: (m·c)(g) = m + c(g) − g•m = c(g) − (d⁰m)(g), so orbits are cosets of B¹ = range d⁰ (Tau Ceti ContCohomology.B1) inside Z¹, and the orbit set is Z¹/B¹ = ContCohomology.H1 G M.
3. Invariants: FixedPoints.subgroup of the multiplicative action is FixedPoints.addSubgroup of the additive one (Tau Ceti ContCohomology.H0).
4. For discrete G and commutative M, c(gh) = c(g)·g•c(h) and Mathlib's IsMulCocycle₁ c(gh) = g•c(h)·c(g) coincide.

The API supplies:

- TauCeti.NonabelianCohomology.instMulDistribMulActionMultiplicative: A DistribMulAction of G on the additive group M induces a MulDistribMulAction of G on Multiplicative M (not an instance in Mathlib at the pin), and continuity of the action transfers.
- TauCeti.NonabelianCohomology.Z1.equivContCohomology: Z¹(G, Multiplicative M) ≃ ContCohomology.Z1 G M, the identity on underlying functions.
- TauCeti.NonabelianCohomology.H1.equivContCohomology: H¹(G, Multiplicative M) ≃ ContCohomology.H1 G M, compatible with the class maps.
- TauCeti.NonabelianCohomology.H1.equivContCohomology_one: The base point goes to 0.
- TauCeti.NonabelianCohomology.H0.equivContCohomology: H⁰(G, Multiplicative M) corresponds to ContCohomology.H0 G M.

Acceptance cases:

- For trivial action, both sides are the continuous homomorphisms G → M (Tau Ceti ContCohomology.H1EquivOfSmulEqSelf).

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, tauceti:TauCeti.ContCohomology.Z1, tauceti:TauCeti.ContCohomology.B1, tauceti:TauCeti.ContCohomology.H1, tauceti:TauCeti.ContCohomology.H1pi, tauceti:TauCeti.ContCohomology.H0, tauceti:TauCeti.ContCohomology.d0, tauceti:TauCeti.ContCohomology.d1, tauceti:TauCeti.ContCohomology.H1EquivOfSmulEqSelf, mathlib:groupCohomology.IsMulCocycle₁, mathlib:Multiplicative.

Sources:

- Kim 2005, §1, p. 6. For commutative (vector-group) coefficients the nonabelian definitions agree with the conventional abelian ones.

### Connecting cocycle of an invariant coset lift

Declaration: TauCeti.NonabelianCohomology.connectingCocycle. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-cocycle.

For b ∈ B with b⁻¹(g•b) ∈ i(A) for every g ∈ G, construct the continuous A-valued cocycle c_b uniquely specified by i(c_b(g)) = b⁻¹(g•b). The membership condition expresses that the left coset b i(A) is G-invariant. No normality of i(A), quotient group structure or continuous quotient section is assumed.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups.
- Continuous actions of G on A and B by automorphisms; i:A → B is a closed embedding and group homomorphism commuting with G.

Proof or construction:

1. For each g choose the unique preimage in A of b⁻¹(g•b), using membership and injectivity of i.
2. The composite with i is continuous by continuity of the action at the fixed b and multiplication by b⁻¹. Apply Topology.IsEmbedding.continuous_iff to the embedding underlying i, obtaining continuity into A; pointwise choices need no continuous section.
3. Apply i to c_b(gh) and c_b(g)(g•c_b(h)); equivariance and cancellation give the same element b⁻¹((gh)•b). Injectivity proves the cocycle identity. Package the function and both properties in the existing continuous Z¹ carrier.

Required uses:

- Kim 2005 §1, printed p. 9; Kim 2009 §3 crystalline kernel: Construct the class mapping invariant cosets to H¹ without a continuous quotient section.
- AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-change-lift: Its image identity determines the change-of-lift gauge element and supplies representative independence.
- AnabelianGeometryAndNonabelianChabauty:NC.3/exact-sequence: Produce a canonical continuous preimage cocycle for each class killed in H¹(G,B).


API:

- TauCeti.NonabelianCohomology.connectingCocycle_apply (projection): For every g, i(c_b(g)) = b⁻¹(g•b). This item is promoted to connecting-cocycle-image for downstream proofs.
- TauCeti.NonabelianCohomology.connectingCocycle_unique (universal-property): Every A-valued continuous cocycle c with i(c(g)) = b⁻¹(g•b) for all g equals c_b, independent of the proof of membership or pointwise preimage choices.
- TauCeti.NonabelianCohomology.connectingCocycle_eq_one_of_fixed (simp): If b is G-fixed, c_b is the constant identity cocycle.


Tests:

- TauCeti.NonabelianCohomology.tests.connecting_fixed_lift (base-case): A G-fixed lift b gives c_b = 1 for every equivariant closed embedding i.
- TauCeti.NonabelianCohomology.tests.connecting_identity_embedding (comparison): For i the identity embedding of B and arbitrary b, c_b = coboundary(b⁻¹), with coboundary(u)(g)=u(g•u)⁻¹.
- TauCeti.NonabelianCohomology.tests.connecting_proof_independence (compatibility): Two proofs that b⁻¹(g•b) lies in i(A) yield equal cocycles for the same b.
- TauCeti.NonabelianCohomology.tests.connecting_right_lift (compatibility): Whenever b and b i(a) satisfy membership, their connecting H¹ classes agree, although their cocycles differ by the gauge a⁻¹.


Acceptance:

- Works for nonnormal closed G-stable subgroups and arbitrary continuous automorphism actions.
- The formula uses b⁻¹(g•b); reversing the factors is invalid for noncommutative B.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles, AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, mathlib:Topology.IsEmbedding.continuous_iff.

Source: Kim, arXiv:math/0409456v1, §1, printed pp. 5–6 and 9; exact lift and gauge calculations stated above.

### Image of the connecting cocycle

Declaration: TauCeti.NonabelianCohomology.connectingCocycle_apply. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-cocycle-image.

Under the connecting-cocycle hypotheses, i(c_b(g)) = b⁻¹(g•b) for every g.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups.
- Continuous actions of G on A and B by automorphisms; i:A → B is a closed embedding and group homomorphism commuting with G.

Proof or construction:

1. Unfold the pointwise preimage construction and its membership witness. The defining equation survives the packaging as a continuous cocycle.

Acceptance:

- The identity is in B and retains the displayed factor order.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-cocycle.

Source: Kim, arXiv:math/0409456v1, §1, printed pp. 5–6 and 9; exact lift and gauge calculations stated above.

### Change of lift for a connecting cocycle

Declaration: TauCeti.NonabelianCohomology.connectingCocycle_change_lift. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-change-lift.

For a ∈ A and an admissible b, b i(a) is also admissible and c_{b i(a)} = a⁻¹•c_b under the cocycle action (u•c)(g)=u c(g)(g•u)⁻¹. Consequently the H¹ class depends only on the left coset b i(A).

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups.
- Continuous actions of G on A and B by automorphisms; i:A → B is a closed embedding and group homomorphism commuting with G.

Proof or construction:

1. Expand (b i(a))⁻¹(g•(b i(a))) as i(a⁻¹) b⁻¹(g•b) i(g•a); subgroup closure proves membership.
2. Apply connecting-cocycle-image to both lifts, expand the gauge action and use injectivity pointwise. This proves the cocycle equality.
3. The inherited H¹ orbit quotient identifies cocycles in the same A-orbit. No normality is used.

Acceptance:

- The gauge is a⁻¹, not a; a nonabelian finite test distinguishes them.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-cocycle-image, AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1.

Source: Kim, arXiv:math/0409456v1, §1, printed pp. 5–6 and 9; exact lift and gauge calculations stated above.

### Trivial connecting class and fixed lifts

Declaration: TauCeti.NonabelianCohomology.connecting_eq_one_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-class-zero.

For an admissible b and any c ∈ Z¹(G,A) with i(c(g))=b⁻¹(g•b), [c]=1 if and only if there is a ∈ A for which b i(a) is G-fixed.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups.
- Continuous actions of G on A and B by automorphisms; i:A → B is a closed embedding and group homomorphism commuting with G.

Proof or construction:

1. Use the inherited orbit-quotient characterisation: [c]=1 iff c(g)=a(g•a)⁻¹ for one a and all g.
2. After applying i, rearrange b⁻¹(g•b)=i(a)(g•i(a))⁻¹ into g•(b i(a))=b i(a). Reverse the calculation for the converse.

Acceptance:

- This is exactness at invariant cosets expressed entirely in actual group carriers.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1.

Source: Kim, arXiv:math/0409456v1, §1, printed pp. 5–6 and 9; exact lift and gauge calculations stated above.

### Fibres of the connecting class

Declaration: TauCeti.NonabelianCohomology.connecting_classes_eq_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-fixed-orbits.

Suppose c,c′ ∈ Z¹(G,A) and b,b′ ∈ B satisfy i(c(g))=b⁻¹(g•b) and i(c′(g))=b′⁻¹(g•b′) for all g. Then [c]=[c′] if and only if there exist a G-fixed t ∈ B and a ∈ A such that b′ = t b i(a). Thus equal connecting classes correspond exactly to the left B^G-orbits of invariant left cosets.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups.
- Continuous actions of G on A and B by automorphisms; i:A → B is a closed embedding and group homomorphism commuting with G.

Proof or construction:

1. By the orbit quotient [c]=[c′] iff c′=a⁻¹•c for some a ∈ A (invert the gauge variable in the inherited equality characterisation).
2. Apply i and the displayed cocycle formulas. Direct cancellation shows t=b′ i(a)⁻¹ b⁻¹ is G-fixed; rearrange to b′=t b i(a).
3. Conversely fixedness of t and b′=t b i(a) give i(c′(g))=i(a⁻¹ c(g)(g•a)); injectivity and cocycle extensionality give the gauge equality and hence equal classes.

Acceptance:

- No commutativity or normality is assumed. The B^G action is on the left, while lift changes multiply by i(a) on the right.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles.

Source: Kim, arXiv:math/0409456v1, §1, printed pp. 5–6 and 9; exact lift and gauge calculations stated above.

### Exactness for a normal coefficient subgroup

Declaration: TauCeti.NonabelianCohomology.exact_H1_of_normal. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/normal-h1-kernel.

Let π:B → C be a continuous open surjective equivariant homomorphism to a topological G-group C, with ker π=i(A). For y ∈ H¹(G,B), π_*(y)=1 if and only if y lies in the image of i_*:H¹(G,A) → H¹(G,B). No continuous section of π is required.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups.
- Continuous actions of G on A and B by automorphisms; i:A → B is a closed embedding and group homomorphism commuting with G.
- C is a topological group with continuous G-action by automorphisms; π is equivariant, continuous, open, surjective and has kernel i(A).

Proof or construction:

1. Choose a continuous cocycle d representing y. Triviality of π_*y supplies x ∈ C with π(d(g))=x(g•x)⁻¹.
2. Lift the single element x to b ∈ B by surjectivity; the gauge b⁻¹•d takes values in ker π=i(A). Restrict it to A using unique pointwise preimages, and transfer continuity with the embedding continuous_iff theorem. The cocycle law follows by equivariance and injectivity.
3. Its H¹ class maps to y because it is a gauge transform of d. Conversely π∘i=1, so every class in the image is killed. Openness allows application to the canonical topological-group quotient; it is not used to lift a whole function.

Acceptance:

- Canonical quotient by a closed normal subgroup is an instance; the H⁰ connecting cocycle for a nonnormal subgroup does not require this theorem.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/functoriality, mathlib:Topology.IsEmbedding.continuous_iff, mathlib:QuotientGroup.continuous_mk, mathlib:QuotientGroup.isOpenMap_coe.

Source: Kim, arXiv:math/0409456v1, §1, printed pp. 5–6 and 9; exact lift and gauge calculations stated above.

### Kernel of inclusion in nonabelian cohomology

Declaration: TauCeti.NonabelianCohomology.exact_H1_of_subgroup. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/exact-sequence.

For an equivariant closed embedding i:A → B of topological G-groups and x ∈ H¹(G,A), i_*(x)=1 if and only if there exist b ∈ B and c ∈ Z¹(G,A) such that x=[c] and i(c(g))=b⁻¹(g•b) for every g. Equivalently, the classes killed by inclusion are exactly the connecting classes of invariant left cosets. Normality and a continuous quotient section are not required.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups.
- Continuous actions of G on A and B by automorphisms; i:A → B is a closed embedding and group homomorphism commuting with G.

Proof or construction:

1. Represent x by c. By the inherited H¹ basepoint characterisation, i_*x=1 iff i(c(g))=u(g•u)⁻¹ for one u ∈ B and all g. Put b=u⁻¹ to obtain the displayed formula.
2. Conversely that formula makes the image cocycle the B-coboundary of b⁻¹, so its class is the basepoint.
3. The formula supplies membership in i(A) for each g and therefore an admissible connecting-cocycle input. Its image identity and injectivity identify it with c. Change of lift and the separate fixed-orbit theorem give the coset interpretation.

Acceptance:

- Kim's crystalline condition: for U_n(R) ≤ U_n(B_cr ⊗ R), the image of H⁰(G_v, U_n(B_cr ⊗ R)/U_n(R)) → H¹(G_v, U_n(R)) is the set of crystalline torsors (Kim 2009, §3); this is (a) for a subgroup that is not normal.
- Exactness is of pointed sets: two elements of H¹(G, A) with the same image in H¹(G, B) need not differ by an element of (B/A)^G unless one of them is the base point; the fibres over other points are described after twisting (NC.3/twisting).

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/functoriality, AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-cocycle-image, AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-change-lift, AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-fixed-orbits.

Source: Kim, arXiv:math/0409456v1, §1, printed pp. 5–6 and 9; exact lift and gauge calculations stated above.

### Central extensions: the action of H¹(G, Z) and the connecting map to H²

Declaration: TauCeti.NonabelianCohomology.H1.map_eq_map_iff_central. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/central-extension.

Let Z ≤ B be a closed G-stable subgroup contained in the centre of B, and C := B/Z. (a) The abelian group H¹(G, Z) (NC.3/abelian-comparison) acts on H¹(G, B) by [z]·[c] := [g ↦ z(g)c(g)], and the fibres of H¹(G, B) → H¹(G, C) are exactly the orbits of this action. (b) Suppose the projection B → C has a continuous (set-theoretic) section s. Then there is a connecting map δ² : H¹(G, C) → H²(G, Z), Tau Ceti's explicit continuous H² (ContCohomology.H2 of Z written additively), sending the class of c̄ to the class of the 2-cocycle (g, h) ↦ c(g)·(g•c(h))·c(gh)⁻¹ for the continuous lift c = s ∘ c̄; and the image of H¹(G, B) → H¹(G, C) is δ²⁻¹(0). (c) If, for every c ∈ Z¹(G, B), the group C twisted by the image of c (NC.3/twisting) has only the trivial G-invariant element, then the action in (a) is free, so each nonempty fibre is a principal homogeneous space of H¹(G, Z).

Hypotheses: G is a topological group and B a topological group with an action of G by group automorphisms (MulDistribMulAction G U) such that the action map G × U → U is continuous (ContinuousSMul G U). Z closed, G-stable and central in B. For (b), a continuous section of B → C (for unipotent algebraic groups an algebraic splitting of the extension exists, as in Kim's proof). For (c), the stated vanishing of twisted invariants.

Proof or construction:

1. (a) z·c is a continuous cocycle because Z is central: z(gh)c(gh) = z(g)(g•z(h))c(g)(g•c(h)) = (z(g)c(g))·g•(z(h)c(h)). The action is compatible with twisted conjugation by B (central z commutes with u), so it descends to classes; it preserves the image in H¹(G, C). Conversely if [c₁], [c₂] have the same image, replace c₂ by u·c₂ so that the images in Z¹(G, C) agree (lift one element of C); then z := c₁⁻¹c₂ is Z-valued, continuous and, Z being central, a cocycle.
2. (b) For the lift c = s ∘ c̄, the defect (g, h) ↦ c(g)(g•c(h))c(gh)⁻¹ lies in Z (its image in C is 1), is continuous, and satisfies the 2-cocycle identity in Z (a direct computation using centrality). Changing c̄ within its class or changing the lift by a Z-valued continuous 1-cochain changes the defect by a 2-coboundary of a continuous cochain, so δ² is well defined into Z²/B² with Tau Ceti's B² (coboundaries of continuous cochains). δ²[c̄] = 0 iff the lift can be corrected by a continuous Z-valued cochain to a cocycle, i.e. iff [c̄] lifts to H¹(G, B).
3. (c) If z·c = u·c with u ∈ B, then projecting to C gives ū·c̄ = c̄, i.e. ū is invariant for the action twisted by c̄; by hypothesis ū = 1, so u ∈ Z and z(g) = u(g•u)⁻¹ is a coboundary of Z (Kim's argument).

Acceptance cases:

- For the lower central series of a unipotent group U with H⁰(G, U^i/U^{i+1}) = 0, (c) applies at every step, which is how Kim shows H¹(G, U_{n+1}) ≅ H¹(G, U^{n+1}/U^{n+2}) × δ²⁻¹(0) (Kim 2005, Proposition 2).
- Without the section hypothesis, H¹(G, C) → H²(G, Z) need not be definable with continuous cochains; (a) and (c) do not need it.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/abelian-comparison, AnabelianGeometryAndNonabelianChabauty:NC.3/exact-sequence, AnabelianGeometryAndNonabelianChabauty:NC.3/normal-h1-kernel, AnabelianGeometryAndNonabelianChabauty:NC.3/twisting, tauceti:TauCeti.ContCohomology.H2, tauceti:TauCeti.ContCohomology.H2pi, tauceti:TauCeti.ContCohomology.Z2, tauceti:TauCeti.ContCohomology.B2, mathlib:Subgroup.center.

Sources:

- Kim 2005, §1, proof of Proposition 2, p. 8. The connecting map H¹(G, U_n) → H²(G, U^{n+1}/U^{n+2}) built from an algebraic splitting and the coboundary of a lift.
- Kim 2005, §1, proof of Proposition 2, p. 9. The action of H¹ of the central subgroup, its orbits and its freeness under vanishing invariants.
- Kim 2009, §3, p. 26. The same structure for Selmer varieties.

### Twisting by a cocycle

Declaration: TauCeti.NonabelianCohomology.Twist. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/twisting.

Let c ∈ Z¹(G, U). The twisted group ₍c₎U is U with the action g ⋆ u := c(g)·(g•u)·c(g)⁻¹, again a continuous action by automorphisms. The map τ_c : Z¹(G, ₍c₎U) → Z¹(G, U), c′ ↦ (g ↦ c′(g)·c(g)), is a bijection carrying the trivial cocycle to c and the twisted-conjugation action of U on the left to that on the right; it induces a bijection of underlying sets H¹(G, ₍c₎U) ≅ H¹(G, U) sending the source base point to [c]; it becomes a pointed equivalence only when the target is repointed at [c]. Twisting is compatible with G-stable subgroups (for cocycles with values in them) and with quotients by normal ones, so that fibres of the maps in NC.3/exact-sequence over [c] become fibres over the base point after twisting.

Hypotheses: G is a topological group and U a topological group with an action of G by group automorphisms (MulDistribMulAction G U) such that the action map G × U → U is continuous (ContinuousSMul G U). c a continuous cocycle.

Proof or construction:

1. g ⋆ − is an automorphism of U (conjugation composed with the automorphism g•−), and (gh) ⋆ u = c(gh)(gh•u)c(gh)⁻¹ = c(g) g•c(h) g•(h•u) g•c(h)⁻¹ c(g)⁻¹ = g ⋆ (h ⋆ u) by the cocycle identity; continuity from continuity of c and of the action.
2. τ_c(c′) is a cocycle for U: c′(gh)c(gh) = c′(g)·(g ⋆ c′(h))·c(g)·g•c(h) = c′(g)c(g)·g•(c′(h)c(h)). The inverse is c″ ↦ c″·c⁻¹. For u ∈ U, τ_c(u·c′)(g) = u c′(g)(g ⋆ u)⁻¹ c(g) = u c′(g) c(g) (g•u)⁻¹ = (u·τ_c(c′))(g).
3. Hence the bijection of orbit sets; the trivial cocycle maps to c.
4. Compatibility with subgroups and quotients: twisting by a cocycle with values in a G-stable subgroup A preserves A; if A is normal every twist preserves A, and the quotient map U → U/A is equivariant for the twists by c and by its image.

The required uses are:

- AnabelianGeometryAndNonabelianChabauty:NC.3/central-extension: The freeness hypothesis is stated for twisted invariants.
- AnabelianGeometryAndNonabelianChabauty:NC.3/exact-sequence: Fibres over non-base points are fibres over base points of twisted sequences.
- AnabelianGeometryAndNonabelianChabauty:NC.4: Local conditions at a point are compared through twisting by the class of that point.

The API supplies:

- TauCeti.NonabelianCohomology.Twist: The type synonym ₍c₎U of U with the twisted action g ⋆ u = c(g)(g•u)c(g)⁻¹.
- TauCeti.NonabelianCohomology.Twist.smul_def: g ⋆ u = c(g)·(g•u)·c(g)⁻¹.
- TauCeti.NonabelianCohomology.Twist.continuousSMul: The twisted action is continuous.
- TauCeti.NonabelianCohomology.Z1.twistEquiv: The bijection Z¹(G, ₍c₎U) ≃ Z¹(G, U), c′ ↦ c′·c.
- TauCeti.NonabelianCohomology.H1.twistEquiv: The induced bijection H¹(G, ₍c₎U) ≃ H¹(G, U).
- TauCeti.NonabelianCohomology.H1.twistEquiv_one: twistEquiv sends the base point to the class of c.
- TauCeti.NonabelianCohomology.Twist.self: Twisting by the trivial cocycle is the original action.

Discriminating tests:

- TauCeti.NonabelianCohomology.tests.twist_trivial (degenerate): Twisting by the trivial cocycle gives back U with its action, and twistEquiv is the identity.
- TauCeti.NonabelianCohomology.tests.twist_abelian (computation): For U commutative, g ⋆ u = g•u for every c, and twistEquiv is translation by c.
- TauCeti.NonabelianCohomology.tests.twist_S3 (computation): For G = ℤ/2 acting trivially on S₃ and c sending the generator to a transposition τ, the twisted action is conjugation by τ, whose invariants form the subgroup {1, τ} of order 2.
- TauCeti.NonabelianCohomology.tests.twist_changes_invariants (non-example): A twist need not be isomorphic to U as a G-group: for G = ℤ/2 acting trivially on S₃ and c(σ) = τ a transposition, H⁰(G, ₍c₎S₃) = {1, τ} has order 2 while H⁰(G, S₃) = S₃ has order 6; and twistEquiv sends the base point to [c], not to the base point.

Acceptance cases:

- For trivial action and U commutative, twisting by any c does not change the action, and τ_c is translation by c.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles, mathlib:MulAut.conj, mathlib:MulDistribMulAction.toMulAut.

Sources:

- Kim 2005, §1, proof of Proposition 1, p. 6. Twisting an action by a cocycle.
- Poonen, §4.5, p. 105. Twists are classified by nonabelian H¹.

### Torsors under U with compatible G-action are classified by H¹(G, U)

Declaration: TauCeti.NonabelianCohomology.Torsor.classOf. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/torsor-classification.

A (G, U)-torsor is a topological space P with a continuous right action of U that is free and transitive, such that for one (equivalently every) p ∈ P the orbit map U → P, u ↦ p·u, is a homeomorphism, together with a continuous left action of G satisfying g•(p·u) = (g•p)·(g•u). For p ∈ P let c_p(g) ∈ U be the unique element with g•p = p·c_p(g). Then c_p ∈ Z¹(G, U), c_{p·u} = u⁻¹·c_p under the twisted-conjugation action, so [P] := [c_p] ∈ H¹(G, U) is independent of p and of the isomorphism class of P; P ↦ [P] is a bijection from isomorphism classes of (G, U)-torsors to H¹(G, U), the trivial torsor U corresponds to the base point, and P has a G-fixed point iff [P] is the base point. The inverse sends [c] to U with the twisted G-action g ∗ u := c(g)·(g•u).

Hypotheses: G is a topological group and U a topological group with an action of G by group automorphisms (MulDistribMulAction G U) such that the action map G × U → U is continuous (ContinuousSMul G U). Torsors are topological, with the orbit maps homeomorphisms; isomorphisms of torsors are homeomorphisms compatible with both actions.

Proof or construction:

1. Cocycle: (gh)•p = g•(p·c_p(h)) = (g•p)·(g•c_p(h)) = p·c_p(g)·g•c_p(h), and freeness gives c_p(gh) = c_p(g)·g•c_p(h). Continuity: c_p is the composite of g ↦ g•p with the inverse of the orbit homeomorphism.
2. Change of point: g•(p·u) = p·c_p(g)·(g•u) = (p·u)·u⁻¹c_p(g)(g•u), so c_{pu}(g) = u⁻¹c_p(g)(g•u) = (u⁻¹·c_p)(g). An isomorphism of torsors carries p to a point with the same cocycle.
3. Inverse: for c ∈ Z¹, the formula g ∗ u := c(g)(g•u) is a continuous action (cocycle identity) compatible with right multiplication, and its cocycle at the point 1 is c. Cohomologous cocycles give isomorphic torsors (left multiplication by u), and a torsor is isomorphic to the one built from c_p via the orbit map at p.
4. A G-fixed point p has c_p = 1; conversely, if c_p(g) = u·(g•u)⁻¹ for all g, then g•(p·u) = p·c_p(g)·(g•u) = p·u, so p·u is fixed.

Acceptance cases:

- Path torsors: for a rational point x of a curve and a base point b, the torsor of paths from b to x, with the Galois action, has class [P(x)] ∈ H¹(G_K, U); this is the map from rational points to H¹ used in NC.4 (Kim 2009, introduction).
- Poonen's classification of torsors under a smooth algebraic group G over k by H¹(k, G) (§5.12.4) is the algebraic version with G = Gal(k_s/k) and U = G(k_s) discrete.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles, mathlib:MulAction.toPerm, mathlib:Topology.IsQuotientMap.

Sources:

- Kim 2005, §1, Proposition 1, p. 5. The classification of torsors by continuous H¹.
- Kim 2005, §1, proof of Proposition 1, p. 6. The cocycle of a point and its independence of the point.
- Poonen, §5.12.4, Remark 5.12.13, p. 154. The cocycle of a torsor with a chosen point.

## Remaining source and construction work

### AnabelianGeometryAndNonabelianChabauty:NC.0 — partial

Fundamental groupoids and sections: import the finite-étale fibre functor and Galois category from InverseGaloisAndArithmeticFundamentalGroups IG.0 and the arithmetic exact sequence from IG.1; construct path torsors (torsors in the sense of NC.3/torsor-classification) and the section of a rational point, base-point change and conjugacy independence; tangential base points on P¹ ∖ {0, 1, ∞} from PeriodsAndSpecialValues PS.9. Settle the path-torsor ownership overlap with IG.6.

### AnabelianGeometryAndNonabelianChabauty:NC.1 — not_read

Source-qualified anabelian reconstruction: acquire and read Mochizuki's theorem and proof; decompose decomposition-group recovery, covers, linear systems and effectivity; state Isom and Hom versions separately.

### AnabelianGeometryAndNonabelianChabauty:NC.2 — not_read

Unipotent fundamental groups: Tannakian construction of unipotent étale and de Rham fundamental groups, central series and finite quotients, path torsors with filtration, Frobenius and Galois structures (tensor-isomorphism torsors from MotivesAndAlgebraicCycles MC.6; rigid/de Rham input from ColemanIntegration L1), and the depth-one comparison with the Jacobian.

### AnabelianGeometryAndNonabelianChabauty:NC.3 — partial

Representability: Kim 2005 Propositions 2–3 (H¹(G, U) and H⁰(G, U(B)/U) represented by affine pro-varieties under finite-dimensionality and H⁰-vanishing hypotheses), with the topologies on U(B ⊗_K R) of Kim §1 Lemmas 1–5; the unipotent-group inputs (lower central series, algebraic splittings of central extensions).

Local conditions and Selmer varieties: unramified and crystalline conditions (Kim 2009 §3, Lemma 5: the image of H⁰(G_v, U(B_cr ⊗ R)/U(R)) → H¹(G_v, U(R))), bad-place conditions, the global Selmer variety, and dimension calculations; depth-one agreement with the Kummer map and Selmer group of the Jacobian (HeightsRationalPointsAndObstructions RP.1) and a nontrivial depth-two obstruction.

Inflation–restriction for nonabelian H¹ (Serre, Galois Cohomology I §5.8), not in a freely readable source consulted here.

### AnabelianGeometryAndNonabelianChabauty:NC.4 — not_read

Unipotent Albanese maps and Chabauty–Kim loci: iterated integrals (ColemanIntegration L1), the global-to-local Selmer map and the finiteness theorem under its hypotheses; depth one recovers classical Chabauty.

### AnabelianGeometryAndNonabelianChabauty:NC.5 — not_read

Quadratic Chabauty: Balakrishnan–Dogra I and II, depth-two quotients, p-adic heights with all local terms, and a worked curve.

### AnabelianGeometryAndNonabelianChabauty:NC.6 — not_read

Reconstruction and rational-point handoff to EffectiveDiophantineMethods ED.6, keeping the section conjecture and eventual Chabauty–Kim completeness conjectural.

## Gaps

- **Topologies on points of unipotent groups over topological algebras**: Kim's H¹(G, U(B ⊗_K R)) uses the inductive-limit topology on B-vector spaces and the induced topology on points of affine schemes (Kim 2005, §1, Lemmas 1–5). The nodes here take U as an abstract topological group; the construction of these topologies and the continuity of the Galois action on points are not built and are needed before the Selmer varieties.
- **Unipotent algebraic groups: lower central series and splittings**: The continuous-section hypothesis of NC.3/central-extension (b) holds for central extensions of unipotent groups over a field of characteristic 0 by an algebraic splitting (Kim 2005, proof of Proposition 2). Tau Ceti has unipotent-group theory, but this splitting and the lower-central-series quotients as vector groups are not decomposed here.

## Sources and baseline

The inherited component's source receipts, recorded by Claude Code cc-fb70e5 on 2026-09-28, are:

- **Kim, *The motivic fundamental group of P¹ ∖ {0, 1, ∞} and the theorem of Siegel*** (arXiv:math/0409456v1; Invent. Math. 2005). §1 was read in full.
- **Kim, *The unipotent Albanese map and Selmer varieties for curves*** (arXiv:math/0510441v4; Publ. RIMS 2009). The introduction and the local-condition passages of §3 were read.
- **Poonen, *Rational points on varieties*** (author PDF). §1.3.5, Exercise 1.9, §4.5, §5.11 and §5.12.4 were read.

The sha256 of each file is in sourceVersions. Serre's *Galois Cohomology*, the standard reference for nonabelian H¹, is not freely available. Its inflation–restriction sequence is therefore listed as remaining work rather than cited. The other statements here are proved from first principles, and their proof steps say so. The inherited checkpoint recorded no source mistakes. This continuation makes no fresh whole-source errata claim for those texts; no new source mistake was identified in the selected K(π,1) passages.

The pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The preceding worker recorded the original 32 baseline declarations in the pinned index and read their heads; those historical checks are preserved, not claimed as fresh primary reads here. Among them are Mathlib's actions, orbit quotients, fixed-point subgroups and quotient groups, and Tau Ceti's explicit continuous cohomology: `ContCohomology.Z1`, `B1`, `H1`, `H2`, `Z2` and `B2`. Mathlib does not provide the `MulDistribMulAction` on `Multiplicative M` that the comparison needs, so the comparison node supplies it.

The planets are:

- Nonabelian cohomology set H¹(G, U);
- Exact sequence of nonabelian cohomology;
- Central extensions and the connecting map to H²;
- Torsors and nonabelian H¹.

The inherited suggested file gives partial native prototypes for nonabelian cohomology, exact sequences, twisting and torsors. It is not compiled. The continuation appends a complete name-by-name signature-or-omission audit: a comment naming an API or test is not a signature, and the inherited multi-declaration nodes are not claimed complete.

## Continuation coverage, ownership and handoff

### AnabelianGeometryAndNonabelianChabauty:NC.0 — partial

- Fundamental groupoids and sections: import the finite-étale fibre functor and Galois category from InverseGaloisAndArithmeticFundamentalGroups IG.0 and the arithmetic exact sequence from IG.1; construct path torsors (torsors in the sense of NC.3/torsor-classification) and the section of a rational point, base-point change and conjugacy independence; tangential base points on P¹ ∖ {0, 1, ∞} from PeriodsAndSpecialValues PS.9. Settle the path-torsor ownership overlap with IG.6.
- Close exact IG.0/SF.2/SF.3/ProfiniteCohomology inputs of the coefficient dictionary, canonical ε, finite direct image/base-change/ρ/Leray, all-degree class killing, coefficient long exact sequences, Kummer/Picard curve cohomology, degree/genus formulas and separable limit/property descent. The curve proof is now granular and cohomological; type all six new curve/descent declarations and six tests once genuine interfaces exist. Raw-homotopy comparison, products and elementary fibrations remain separately open.
- Read/decompose Chen 2024 /57–58 tangential specialization ⟨γ_t⟩\Y_t ≅ Y_x, functorial in finite covers, and good/symmetric-path consumers, distinct from reconstruction.

### AnabelianGeometryAndNonabelianChabauty:NC.1 — not_read

- Source-qualified anabelian reconstruction: acquire and read Mochizuki's theorem and proof; decompose decomposition-group recovery, covers, linear systems and effectivity; state Isom and Hom versions separately.

### AnabelianGeometryAndNonabelianChabauty:NC.2 — not_read

- Unipotent fundamental groups: Tannakian construction of unipotent étale and de Rham fundamental groups, central series and finite quotients, path torsors with filtration, Frobenius and Galois structures (tensor-isomorphism torsors from MotivesAndAlgebraicCycles MC.6; rigid/de Rham input from ColemanIntegration L1), and the depth-one comparison with the Jacobian.
- Read BDMTV 2019 Appendix A, Theorem 4.2, Lemma 4.3, Corollary 4.4, Hadian Theorem 4.5, Lemma 5.2 and nonabelian Berthelot–Ogus bridge; account individually for 17 routed items and E9/E10. Do not merge local iterated-integral word expansion /58(40) with global comparison /93(41).

### AnabelianGeometryAndNonabelianChabauty:NC.3 — partial

- Representability: Kim 2005 Propositions 2–3 (H¹(G, U) and H⁰(G, U(B)/U) represented by affine pro-varieties under finite-dimensionality and H⁰-vanishing hypotheses), with the topologies on U(B ⊗_K R) of Kim §1 Lemmas 1–5; the unipotent-group inputs (lower central series, algebraic splittings of central extensions).
- Local conditions and Selmer varieties: unramified and crystalline conditions (Kim 2009 §3, Lemma 5: the image of H⁰(G_v, U(B_cr ⊗ R)/U(R)) → H¹(G_v, U(R))), bad-place conditions, the global Selmer variety, and dimension calculations; depth-one agreement with the Kummer map and Selmer group of the Jacobian (HeightsRationalPointsAndObstructions RP.1) and a nontrivial depth-two obstruction.
- Inflation–restriction for nonabelian H¹ (Serre, Galois Cohomology I §5.8), not in a freely readable source consulted here.
- Split inherited multi-declaration nodes and supply all API/test forms explicitly omitted by the appended suggested-file audit; no stage is closed here.

### AnabelianGeometryAndNonabelianChabauty:NC.4 — not_read

- Unipotent Albanese maps and Chabauty–Kim loci: iterated integrals (ColemanIntegration L1), the global-to-local Selmer map and the finiteness theorem under its hypotheses; depth one recovers classical Chabauty.

### AnabelianGeometryAndNonabelianChabauty:NC.5 — not_read

- Quadratic Chabauty: Balakrishnan–Dogra I and II, depth-two quotients, p-adic heights with all local terms, and a worked curve.
- Import NS=Pic/Pic⁰, injection into symmetric Hom and finite-generation/rank data from AbelianSchemesAndArithmeticModuli:A2; logically retarget BDMTV /9 to this owner without locally rebuilding it.
- Read/decompose BDMTV 2019 §3 split-Cartan-level-13 pairs/determinants, nice correspondences and U_Z, A_Z twists/D_cris, specialized height (17), Lemmas 3.2/3.7, Corollary 3.8 and splitting/character independence. Preserve all 19 routed items including four applications; generic heights/mixed extensions/local terms come from the pending Part II owner, with no reverse NC.5 dependency.

### AnabelianGeometryAndNonabelianChabauty:NC.6 — not_read

- Reconstruction and rational-point handoff to EffectiveDiophantineMethods ED.6, keeping the section conjecture and eventual Chabauty–Kim completeness conjectural.
- Process-only handoff: propose removal in restructure, retaining actual reconstruction in NC.1 and rational-point outputs in NC.5/EffectiveDiophantineMethods:ED.6. No process nodes or unaccepted closed coverage.

### Exact cross-roadmap requests

1. InverseGaloisAndArithmeticFundamentalGroups:IG.0: The actual category of finite étale schemes over a connected locally noetherian X, geometric-point fibre functor, its profinite automorphism group and equivalence with finite continuous π-sets; finite-cover subgroups, geometric-point path transport and induced coefficient transport, compatible with native abstract IsFundamentalGroup and the opposite affine FiniteEtale.fiber. Include the transitive F_p-translation π-set/connected degree-p cover criterion and torsor interpretation for nonzero continuous characters; the zero character is not a connected cover. Consumers: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/pointed-isomorphism, AnabelianGeometryAndNonabelianChabauty:NC.0/basepoint-transport, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-cover-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison, AnabelianGeometryAndNonabelianChabauty:NC.0/field.
2. SchemeAndStackFoundations:SF.2: Finite continuous π-module / finite locally constant abelian sheaf dictionary on native smallEtaleTopology, natural in coefficients, pointed scheme isomorphisms and fibre-functor paths; actual canonical εⁿ in every degree. Compare derived continuous cohomology of finite discrete modules to native all-degree TopRep homogeneous continuousCohomology rather than define a second cohomology theory. Consumers: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/pointed-isomorphism, AnabelianGeometryAndNonabelianChabauty:NC.0/basepoint-transport.
3. SchemeAndStackFoundations:SF.2: Spec K: exact stalk equivalence for discrete continuous G_K-modules and derived global-sections/invariants comparison of Stacks 03QQ Lemmas 59.59.1–2, identifying its map with ε. Also positive-degree trivial-group continuous cohomology calculation. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/field, AnabelianGeometryAndNonabelianChabauty:NC.0/projective-line-obstruction.
4. InverseGaloisAndArithmeticFundamentalGroups:IG.0: For algebraically closed k, π₁ᵉᵗ(P¹_k)=1 by classification of connected finite étale covers; retain characteristic and geometric-point hypotheses. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/projective-line-obstruction.
5. SchemeAndStackFoundations:SF.2: For smooth projective curves over algebraically closed k and n invertible in k, canonical H²_et(X,μ_n) ≅ Z/n of Stacks 03RQ, with noncanonical constant Z/n identification after choosing roots of unity. Specialize to P¹ and prime ℓ≥2 without constructing Picard/NS theory here. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/projective-line-obstruction.
6. SchemeAndStackFoundations:SF.2: The canonical finite-étale topos X_fet≃Bπ, ρ:X_et→X_fet, its unit and finite-coefficient dictionary, derived comparison with the pinned canonical continuousCohomology, and R^qρ_*F as sheafification of (Y→X)↦H^q_et(Y,F|Y), with Leray identifying its edge with ε. Supply finite-coefficient trivialization, degree-one finite étale torsors/diagonal killing, degree-zero invariants comparison and finite component/sum compatibility. NC.0 assembles these into the two effacement equivalences; do not duplicate the NC.0 criterion in the supplier or require raw Artin–Mazur homotopy for this route. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/all-coefficient-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-cover-effacement.
7. InverseGaloisAndArithmeticFundamentalGroups:IG.0: Characteristic-zero geometric product π₁ theorem for geometrically connected geometrically unibranch varieties over algebraically closed k, SGA 1 XIII Proposition 4.6; cofinality of product finite covers by profinite open subgroups. Arithmetic π₁ over nonclosed k is not an ordinary product. Supply the projection-compatible isomorphism, not merely an abstract group isomorphism. The pointed finite π-set/cover dictionary must realize each open subgroup (not only normal subgroups), inclusions as finite étale surjective maps of connected covers, geometric lifts and connected components of finite common refinements. The canonical rectangle is given by existing subgroup comaps, not a new NC carrier. Its product cover dominates the given cover. Preserve the strong-desingularizability/characteristic-zero resolution boundary in SGA 1 XIII 4.6; no unrestricted positive-characteristic theorem is inferred. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/products, AnabelianGeometryAndNonabelianChabauty:NC.0/positive-family-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/product-cover-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/geometric-product.
8. InverseGaloisAndArithmeticFundamentalGroups:IG.1: Arithmetic π₁ exact sequence for geometrically connected varieties over k, with product/fibre-product compatibility needed in the characteristic-zero geometric-base-change reduction; not a higher homotopy fibration theorem. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/products.
9. SchemeAndStackFoundations:SF.2: Retain the natural derived finite-torsion Künneth contract, with its Tor concerns and the original SGA 4½ finitude 1.11 source obligation. For this product assembly export precisely the canonical, pullback-natural external-product isomorphism ⊕_{i+j=q}H^i_et(W,F_p)⊗_{F_p}H^j_et(T,F_p)→H^q_et(W×T,F_p), for finite-type W,T over algebraically closed characteristic-zero k, p prime. Ordinary étale cohomology is intended; neither factor is required proper. Read Stacks 59.97.9's derived map, import/audit the generic complexes-over-a-field bridge from its homological owner, and verify that it induces external products and commutes with pullbacks. This supplier integrates that general bridge rather than NC.0 constructing a parallel derived category. Establish bilinearity, zero-preservation, pullback composition and stability of the geometric/product conditions. The product proof now uses finitary class killing and the already owned separable-base-change node; it does not need a new universal-finite-cover cohomology interchange specifically for products. The original separable-cover/class descent and coefficient continuity obligation is retained in request 16. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/products, AnabelianGeometryAndNonabelianChabauty:NC.0/positive-family-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/product-cover-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/geometric-product.
10. SchemeAndStackFoundations:SF.3: Smooth geometric curves, smooth proper models and genus, and smooth ⇒ geometrically unibranch in the needed scope. Import these scheme-theoretic curve objects, not a second NC.0 construction. Also export connected finite-étale smooth/projective/affine preservation; proper-versus-affine dichotomy for separated smooth finite-type curves; unramified Riemann–Hurwitz g(D)=1+deg(D/C)(g(C)−1), composing the existing AlgebraicCurves function-field and JacobianChallenge scheme dictionaries; genus under characteristic-zero base extension; Pic⁰ as the actual Jacobian and its prime-to-characteristic n-torsion order n^(2g). No numerical-type Picard group can replace Pic⁰(C). Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/smooth-curve.

### New open gaps

- Generic raw étale homotopy foundations and fibration theorem: Raw étale pro-spaces, pro-homotopy groups, profinite-π identification in the stated geometrically-unibranch variety scope, classifying morphisms/Bπ₁ and Isaksen's weak-equivalence test are absent at the pins. Elementary fibrations additionally need Friedlander Theorem 11.5 on universal finite-cover pullbacks, finite-cover higher-homotopy invariance (Schmidt–Stix Lemma 2.1) and smooth profiniteness (Artin–Mazur Theorem 11.1). IG.0/IG.1 do not state this higher theory. The reviewed Schmidt–Stix extraction already retains an UNACCEPTED EtaleHomotopyTypes candidate, with no registered stages or design job. Reconcile its foundational core, rather than create a parallel owner: it imports generic pro-categories, ordinary homotopy, sites and IG.0/IG.1; it must not depend on NC.0/NC.1 for the generic inputs consumed here. Keep its source-qualified anabelian orbit results downstream. No unregistered stage is a prerequisite. Needed by AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison, AnabelianGeometryAndNonabelianChabauty:NC.0/elementary-fibration.
- Raw homotopy comparison outside geometric-unibranch varieties: The cohomological predicate is planned on all connected locally noetherian schemes. Its raw equivalence is sourced here only for connected geometrically unibranch varieties. Raw π₁ is not automatically profinite on arbitrary locally noetherian schemes; replacing it with its profinite completion changes the target. Establish broader exact hypotheses or retain distinct cohomological and raw notions; never export this restricted equivalence universally. Needed by AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison.
- Delegated raw-homotopy, curve and product proof leaves: The characteristic-zero smooth-curve node now uses the freshly split direct cohomological route (connected prime-degree covers, actual degree-two killing and separable-closure descent), not raw-homotopy-comparison. Its SF.2/SF.3/IG.0 inputs remain precise open requests, including generic Kummer/cohomology and curve-degree/genus facts and the limit/property-descent proofs. Schmidt 1996 Proposition 15's parsed proof was read, but its scanned degree diagram was not visually inspected. Artin–Mazur 4.3/11.1 and raw comparison remain separate proof leaves, and products still use SGA 1 XIII 4.6 and SGA 4½ finitude 1.11. No delegated leaf is closed merely by the new assembly. The product proof now has three finitary nodes: positive families, class killing on an arbitrary product cover, and geometric binary closure. SGA geometric π₁ product/dictionary, canonical prime-field external products with the field-complex bridge, connected common refinements and geometric-condition stability remain open. Their exact supplier contracts have been refined; no leaf is certified closed. Needed by AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison, AnabelianGeometryAndNonabelianChabauty:NC.0/smooth-curve, AnabelianGeometryAndNonabelianChabauty:NC.0/products.
- Typed étale comparison carrier and suggested signatures: Native schemes, local noetherianity, small étale topology, abstract Galois categories, affine finite étale fibres and all-degree continuousCohomology exist. Actual non-affine profinite π, finite-coefficient/sheaf dictionary and canonical all-degree ε are not supplied at the pins. Every new declaration/API/test has an explicit mathematical omission entry in the suggested file, not a dummy Prop field, invented carrier or fabricated signature. Native smoke forms test only existing carriers. The key is planned, not formalised. The five finite-cover assembly contracts and the constant-F₃ degree-three boundary test have explicit mathematical omission entries. Actual μ_f, bc, ρ/Leray and ε interfaces are missing; no fabricated Lean carrier is introduced. Native discrete Shapiro smoke forms are separate existing-library type checks, not signatures of geometric results. The six curve/descent declarations and six new exact tests are mathematical omission contracts. Existing arithmetic smoke examples test ZMod carriers only, not geometric covers, H² or descent. The three product assembly declarations remain explicit mathematical omissions for genuine scheme/finite-cover/cohomology interfaces. Four finite-group/graded/nonfield regression examples and seven baseline smoke signatures elaborate only on existing carriers; they do not type the geometric assemblies. Needed by AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/coefficient-restriction, AnabelianGeometryAndNonabelianChabauty:NC.0/pointed-isomorphism, AnabelianGeometryAndNonabelianChabauty:NC.0/basepoint-transport, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-cover-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison, AnabelianGeometryAndNonabelianChabauty:NC.0/field, AnabelianGeometryAndNonabelianChabauty:NC.0/projective-line-obstruction, AnabelianGeometryAndNonabelianChabauty:NC.0/smooth-curve, AnabelianGeometryAndNonabelianChabauty:NC.0/products, AnabelianGeometryAndNonabelianChabauty:NC.0/elementary-fibration, AnabelianGeometryAndNonabelianChabauty:NC.0/artin-neighbourhood, AnabelianGeometryAndNonabelianChabauty:NC.0/effacement-finite-cover-transfer, AnabelianGeometryAndNonabelianChabauty:NC.0/all-coefficient-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-etale-invariance, AnabelianGeometryAndNonabelianChabauty:NC.0/effacement-extension, AnabelianGeometryAndNonabelianChabauty:NC.0/prime-field-effacement.
- M₀,n moduli and forgetting-mark fibrations are imported: StableReductionPartII:key/moduli-curves is a reserved owner with no packet node at this audit tree. Its M₀,n scheme, M₀,4 identification and characteristic-zero forgetting-mark elementary fibrations must be imported/checked before the named instance is typed. No moduli construction is added here; the reserve is not an established theorem. Needed by AnabelianGeometryAndNonabelianChabauty:NC.0/artin-neighbourhood, AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1.
- Routed Chen and BDMTV additions remain source inventory obligations: This continuation reads the K(π,1) sources, not the full Chen 2024 tangential specialization /57–58 or BDMTV 2019 universal-connection/Frobenius and quadratic-height proofs. The issue's 17 NC.2 and 19 NC.5 route items, E9/E10 and four applications still require individual source-to-node/import records. NC.5 imports NS from AbelianSchemesAndArithmeticModuli:A2 and generic mixed extensions/local heights from the pending SelmerComplexesAndPadicHeightsPartII owner, which must not depend on NC.5. No provisional height stage or duplicate is inserted. Needed by AnabelianGeometryAndNonabelianChabauty:NC.0, AnabelianGeometryAndNonabelianChabauty:NC.2, AnabelianGeometryAndNonabelianChabauty:NC.5.
- Inherited NC.3 declaration/API granularity remains open: The eight inherited nodes and their source receipts are retained, not re-audited or closed. continuous-cocycles, functoriality, exact-sequence and central-extension bundle independent declarations and need granular continuation. Several inherited API/test forms are absent or only comment-level in the old suggested file. The appended omission audit accounts for every such name. Twisting's target must be repointed at [c] to make its set bijection pointed. Needed by AnabelianGeometryAndNonabelianChabauty:NC.3.

### Structural proposals

- NC.6 is a process handoff, not a mathematical layer, in the reviewed audit. Remove NC.6 after maintainer acceptance; retain reconstruction in NC.1 and rational-point exports in NC.5, supplying EffectiveDiophantineMethods:ED.6 directly. Keep section and eventual Chabauty–Kim completeness conjectural. Current NC.6 coverage remains pending acceptance.
- The Schmidt–Stix extraction already retains an unaccepted EtaleHomotopyTypes candidate. Its generic foundational targets overlap the raw inputs needed here; its NC.1 centre-free input would create a cycle if used by the NC.0 foundation. Reconcile and narrow the existing unaccepted Étale homotopy types and pro-spaces candidate into a generic foundational core: import existing pro-category/ordinary homotopy/site/IG.0/IG.1 owners, resolve its G1/G3/G7 closure obligations and supply raw étale pro-spaces, classifying pro-spaces, coefficient detection and elementary-fibration homotopy inputs without any dependency on NC.0 or NC.1. Leave source-qualified anabelian monodromy/orbit results to the downstream anabelian component. This packet alone owns the reserved K(π,1) predicate. Do not create a duplicate IG Part II owner or treat this candidate as a registered supplier stage.

### Fresh source and baseline receipts

The selected primary reading used [Schmidt–Stix's publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf), [Farb–Kisin–Wolfson v2](https://arxiv.org/pdf/2110.05534v2), and Stacks [03QQ](https://stacks.math.columbia.edu/tag/03QQ) and [03RQ](https://stacks.math.columbia.edu/tag/03RQ). URLs, dates, hashes and exact selected sections are in the packet. Historical Kim/Poonen receipts are retained unchanged. The continuation does not claim to have read the whole essential-dimension or reconstruction arguments.

- schmidt-stix-2016: Personally read the finite-cover convention and Lemma 2.1 with proof (pp. 821–822); §2.3, definition, Lemma 2.7 and Proposition 2.8 with their printed proofs (pp. 826–828); Appendix A.3, Lemmas A.14–A.15, Proposition A.16 and Definition A.17/Corollary A.18 with proofs (pp. 861–866); Definition 6.1 and M₀,n example (p. 845). Schmidt 1996 Proposition 15, Artin–Mazur Theorems 4.3/11.1, Friedlander Theorem 11.5, Isaksen model-category leaves and cited SGA Künneth proofs were not separately acquired/read; their exact roles are requests/gaps. Reconstruction proofs in §4–§6 were not read.
- farb-kisin-wolfson-2024-v2: Personally read §2.3.1 (p. 16), the constant-Fₚ canonical cohomology map and its finite-quotient use, and Lemma 3.2.2 with proof (p. 24), for torus torsors over abelian varieties and their specific maximal-pro-p inflation comparison. Prismatic and essential-dimension arguments outside these selected passages were not read for this continuation. The paper does not define our p-primary coefficient-class predicate.
- stacks-etale-tests: 03QQ: personally read Lemmas 59.59.1–2 and their proofs identifying abelian étale sheaves with continuous Galois modules and derived cohomology on Spec K. 03RQ: personally read Lemma 59.69.1 and its proof giving H²(X,μ_n) ≅ Z/n for algebraically closed smooth projective curves with n invertible; referenced Picard/Kummer inputs are imported from SF.2. 03N8 was read as supporting motivation for the projective-line test; its introductory sketch is not a substitute for the curve-cohomology theorem.

Seven positive native declarations were personally read at the pinned Mathlib commit: mathlib:AlgebraicGeometry.Scheme, mathlib:AlgebraicGeometry.IsLocallyNoetherian, mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology, mathlib:continuousCohomology, mathlib:CategoryTheory.PreGaloisCategory.IsFundamentalGroup, mathlib:CommAlgCat.FiniteEtale, mathlib:CommAlgCat.FiniteEtale.fiber. All-degree continuous cohomology and the small étale site are native; their mere existence does not supply the geometric π/sheaf/ε bridge. The affine finite-étale fibre functor is contravariant in algebras. A full-tree spelling search at both pins found no K(π,1)/étale-homotopy declaration; negative searches do not replace the exact open supplier contracts.

The JacobianChallenge and StableReduction upstream documents were read during this continuous worker run. The reviewed NC audit, all seven atlas stage descriptions, the seventeen touching stage edges, and the reserved definition contracts were examined. Screening every blueprint link file found no entries mentioning this roadmap at the audit tree; the atlas stage edges were read separately.

### Suggested file boundary

Every new node, API item and test has an exact named omission entry because the actual geometric coefficient and comparison carriers are missing. These are mathematical omissions, not Lean signatures. The appended native smoke examples mention only real smallEtaleTopology, IsLocallyNoetherian, FiniteEtale.fiber and continuousCohomology carriers. They do not test the missing K(π,1) definition. The inherited prototypes and two inherited examples remain; no Lean compilation or implementation is claimed.

## Exact routed source inventory

This is an inventory of catalogue contracts, not a claim to have freshly read the Chen or BDMTV primary proofs. The reserved key assignment takes precedence over historical SF.2 or unaccepted étale-homotopy candidate placements of the K(π,1) predicate; generic cohomology and raw homotopy remain imports. The unaccepted candidate has no registered supplier stage. Its generic foundation must not depend on NC.1, which consumes NC.0.

### PAPER-SCHMIDT-STIX-16 — partial

- PAPER-SCHMIDT-STIX-16/14. Selected primary definition/Lemma 2.7 read; exact delegated proof gaps remain. Planned nodes: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-cover-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/smooth-curve, AnabelianGeometryAndNonabelianChabauty:NC.0/products.
- PAPER-SCHMIDT-STIX-16/31. Selected Appendix A.3 primary proofs read. General pro-classifying space machinery is imported via the unaccepted foundation candidate, not rebuilt in the key node. Planned nodes: AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison.
- PAPER-SCHMIDT-STIX-16/68. Only the K(π,1) consequence is planned here. Generic strongly hyperbolic Artin neighbourhood construction and reconstruction remain with the downstream candidate route. Planned nodes: AnabelianGeometryAndNonabelianChabauty:NC.0/artin-neighbourhood.

### PAPER-FARB-KISIN-WOLFSON-24 — partial

- PAPER-FARB-KISIN-WOLFSON-24/005. Reserved owner supersedes the historical SF.2 key-definition placement. SF.2 supplies cohomology, not a duplicate K(π,1) predicate. Planned nodes: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1.
- PAPER-FARB-KISIN-WOLFSON-24/091. Selected Lemma 3.2.2 proof read. Torus-torsor-over-abelian-variety full K(π,1) theorem remains to be decomposed into fibre-fibration cohomology/π₁ suppliers and the owned predicate. Its pro-p inflation also needs the separately proved prime-to-p kernel, not just p-primary coefficients. No corresponding node is claimed complete.
- PAPER-FARB-KISIN-WOLFSON-24/146. Abelian varieties and split tori over algebraically closed characteristic-zero fields: full finite-coefficient geometric instances remain to be decomposed, importing A5 uniformization/comparison rather than rebuilding it. The key interface is supplied, not a completed instance. No corresponding node is claimed complete.

### PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19 → AnabelianGeometryAndNonabelianChabauty:NC.5 — not_read

- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/11: Quadratic Chabauty pair (Published §1.4, (5), pp.890–891). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/12: Lemma 1.5: the determinant criterion (Published Lemma 1.5, (6), p.891). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/13: Equivariant heights reduce the number of points (Published Remark 1.6, §1.7, Remark 1.7, Remark 3.9, pp.892, 895, 908). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/22: Lemma 2.4 (Published Lemma 2.4, p.900). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/28: Lemma 3.2 (Published Lemma 3.2, p.903). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/32: The height formula (17) (Published (16)–(17), pp.905–906). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/33: A_Z(b), twisting and the pair (θ, Υ) (Published §3.4, (18)–(19), pp.906–907). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/35: Lemma 3.7 (Published Lemma 3.7, pp.907–908). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/36: Corollary 3.8 (Published Corollary 3.8, p.908). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/37: Independence of the splitting and the character (Published Remarks 3.10, 3.12, (20), pp.908–909). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/38: Chow–Heegner points (Remarks 3.11, 5.6) (Published Remark 3.11, Remark 5.6, (47), pp.908, 925). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/46: Admissible Tate classes Z (Published §4.4, p.913). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/47: Lemma 4.7 (corrected) (Published Lemma 4.7, pp.913–914 (arXiv v1 Lemma 4.5)). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/48: The filtered connection A_Z (Published (25), p.914). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/62: Lemma 5.4: comparison for A_Z (Published Lemma 5.4, (46), pp.923–924). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/20: Theorem 2.3 (Balakrishnan–Dogra) (Published Theorem 2.3, p.899 (arXiv v1 Lemma 2.3)). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/21: Symmetric and nice correspondences (Published §2.3, p.900). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/23: The depth-two quotient U_Z (Published §2.3, Remark 2.5, pp.900–901). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/34: Theorem 3.6 (Kim–Tamagawa) (Published Theorem 3.6, p.907). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.

### PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19 → AnabelianGeometryAndNonabelianChabauty:NC.2 — not_read

- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/40: The universal unipotent connection on Y (Published §4.2, (21), p.910). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/41: Theorem 4.2 (Kim): universality (Published Theorem 4.2, p.910 (arXiv v1 Theorem 4.1)). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/42: Lemma 4.3: the trivialisation respects composition (Published (22)–(24), Lemma 4.3, p.911). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/43: Corollary 4.4 (Published Corollary 4.4, pp.911–912). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/44: Filtered connections (Published §4.3, p.912). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/45: Theorem 4.5 (Hadian) (Published Theorem 4.5, Remark 4.6, pp.912–913 (arXiv v1 Theorem 4.4)). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/54: Unipotent isocrystals and the Frobenius structure (Published §5.1, (37), pp.918–919). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/55: Lemma 5.2 (Published Lemma 5.2, (38), p.919). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/56: Theorem 5.3 (Chiarellotto–Le Stum) (Published Theorem 5.3, p.920 (arXiv v1 Theorem A.7)). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/57: Frobenius operators on de Rham path torsors (Published §5.2, (42), pp.920–921). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/67: Unipotent Tannakian categories and the universal objects A_n(C, ω) (Published §A.1, Definition A.1, pp.934–935). Use correction E10: invariant-vector condition only for nonzero objects; primary proof not freshly read here. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/68: Universal pointed objects (Published Definition A.2, p.935). Use correction E9: unique filtration/point-preserving universal morphism; primary proof not freshly read here. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/69: Lemma A.3 (Published Lemma A.3, p.935). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/70: Path torsors of the universal objects (Lemma A.4) (Published §A.1.2, Lemma A.4, pp.936–937). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/63: Olsson's non-abelian comparison (Published proof of Lemma 5.4, p.923 (arXiv v1 Theorem A.8)). Catalogue route inventory only; exact primary source decomposition remains. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/58: Local iterated-integral word expansion (40) (Published §5.2.1, (40), p.921 (arXiv v1 §5.1, (20))). Import ColemanIntegration:L1/word-algebra-local-expansion for (40); not the global path-torsor bridge. No corresponding node is claimed complete.
- PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19/93: Tannakian path transport and Besser’s global Frobenius path (Published §5.2.1, (39),(41), p.921; Lemma 4.3 p.910; Theorem 5.3 pp.919–920; Besser, arXiv:math/0011269, Theorem 3.1 and Corollaries 3.2–3.3, pp.7–9). Own the missing global identification (41)/Besser bridge in NC.2, importing L1 rather than rebuilding integrals. No corresponding node is claimed complete.

### PAPER-CHEN-24 → AnabelianGeometryAndNonabelianChabauty:NC.0 — not_read

- PAPER-CHEN-24/57. Tangential specialization/inertia orbit bijection for finite ramified curves, functorial in covers; catalogue corrected contract read, primary proof not freshly read. Import analytic-to-algebraically-closed-char-zero transfer /129. No corresponding node is claimed complete.
- PAPER-CHEN-24/58. Good symmetric fibre-functor paths on P¹ minus {0,1,∞}, their existence and conjugation conventions; catalogue corrected contract read, primary proof not freshly read. These paths are not reconstructed by the K(π,1) predicate. No corresponding node is claimed complete.

### Néron–Severi ownership request

AbelianSchemesAndArithmeticModuli:A2: For an abelian variety A, define NS(A)=Pic(A)/Pic⁰(A), factor L↦φ_L through NS and prove its injection into symmetric Hom(A,A∨), with finite generation from the A6 Hom finite-rank result and ρ as the rank. The current A6/hom-is-free-of-finite-rank node states the NS conclusion but does not replace this A2 definition/injection. NC.5 imports these data for BDMTV /9 and its rank criterion; never rebuild NS in this packet.

For BDMTV /67 apply E10 (nonzero objects); for /68 apply E9 (unique filtration/point-preserving morphism). These corrections are taken from the catalogue's existing findings, not newly discovered or independently re-reviewed here. The extraction files and their original findings remain unchanged.


## Connecting-map continuation — codex-J6LwjP

Six new nodes separate the connecting cocycle, its image equation, right lift change, trivial-class criterion, fixed-orbit fibres and normal-kernel exactness. The preserved exact-sequence ID is now the single inclusion-kernel theorem. All twenty inherited IDs and the complete NC.0, Chen and BDMTV source inventories remain. Every new declaration, construction API and four tests has a native suggested form.

The actual quotient-set connecting map on invariant left cosets and the initial exactness at A^G and B^G still need native packaging. They remain explicit targets, recorded as an additional gap. A quotient group cannot replace a nonnormal coset space. Representability, topologies on unipotent points, central obstructions, local conditions and Selmer varieties remain open.

Fresh primary reading covers Kim arXiv:math/0409456v1, printed pp. 5–10, including the subgroup exactness passage. The PDF hash agrees with the historical receipt; earlier and later source sections were not freshly read. Topology.IsEmbedding.continuous_iff was read at the pinned Mathlib commit. Twenty-nine current link-map examined entries are negative catalogue screens, with no asserted matching dependency.

The Mathlib-only cocycle/H¹/exactness excerpt of the suggested file elaborated at the pinned Mathlib commit with zero errors, 31 admitted-proof warnings and no other warnings. All new signatures, three construction API forms and four tests are included. The complete file was not compiled because its Tau Ceti dependency has no existing build at the required pin. Reproduction boundaries and hashes are in the handoff. This is signature validation, with admitted bodies.


## Invariant-coset continuation — codex-rtOQ9t

The packaging targets left by the preceding connecting-map checkpoint are now outlined below. The source and implementation statements in its paragraph are historical receipts. All twenty-six inherited nodes and their omissions survive. These eleven new nodes use Mathlib’s existing nonnormal coset set, descended action and fixed-point subset; the abbreviation InvariantCosets only instantiates those carriers. The two new constructions give actual maps π⁰ and δ, with the base point of the source specified as π⁰(1).

### Equivariant subgroup coset action

Declaration: TauCeti.NonabelianCohomology.quotientAction_range. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-action.

Equivariance of i makes the existing G-action on B descend to Mathlib’s left coset set B/i(A), by supplying MulAction.QuotientAction G i(A). Its action on representatives is g·[b]=[g·b]. This quotient is a set even when i(A) is nonnormal.

Hypotheses:

- Groups G,A,B, actions by automorphisms on A and B, and an equivariant homomorphism i. Topology and injectivity are unnecessary for this set-action lemma.

Proof or construction:

1. If b⁻¹b′=i(a), then (g·b)⁻¹(g·b′)=g·(b⁻¹b′)=i(g·a). This is exactly the existing QuotientAction compatibility field.
2. Install that proposition locally and use the pinned MulAction.quotient instance. Do not rebuild a quotient relation or assert group operations on B/i(A).

Acceptance:

- The subgroup generated by a transposition in S₃, with trivial G-action, qualifies and gives three left cosets. Normality would wrongly exclude it.

Prerequisites: mathlib:MulDistribMulAction, mathlib:MulAction.QuotientAction, mathlib:MulAction.quotient, mathlib:QuotientGroup.leftRel_apply.

Source: [Kim arXiv:math/0409456v1](https://arxiv.org/pdf/math/0409456v1), §1, printed pp. 5–6 (continuous cocycle and gauge conventions) and p. 9 (subgroup exactness). Direct elementary derivation in the stated topological-group scope, using Kim’s cocycle convention and nonnormal-subgroup exactness motivation. This is not a separately named theorem of Kim or a claim of representability.

### Invariant coset membership criterion

Declaration: TauCeti.NonabelianCohomology.fixed_coset_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/fixed-coset-criterion.

With the descended action, [b] belongs to the existing fixed-point set (B/i(A))^G if and only if b⁻¹(g·b) lies in i(A) for every g. This identifies the genuine invariant-coset carrier with the membership hypothesis of connectingCocycle.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups. G acts continuously on A and B by automorphisms.
- i:A → B is a group homomorphism, a closed embedding and G-equivariant. No normality of i(A) and no continuous section of the coset projection are assumed.

Proof or construction:

1. Use MulAction.mem_fixedPoints to test each g. Quotient.smul_mk identifies g·[b] with [g·b].
2. Apply QuotientGroup.eq to [b]=[g·b], reversing the fixedness equality if necessary. The difference is b⁻¹(g·b), in that order.

Acceptance:

- For C₂ acting by negation on C₄ with subgroup {0,2}, both cosets are invariant, although the odd coset has no fixed representative.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-action, mathlib:MulAction.fixedPoints, mathlib:MulAction.mem_fixedPoints, mathlib:MulAction.Quotient.smul_mk, mathlib:QuotientGroup.eq.

Source: [Kim arXiv:math/0409456v1](https://arxiv.org/pdf/math/0409456v1), §1, printed pp. 5–6 (continuous cocycle and gauge conventions) and p. 9 (subgroup exactness). Direct elementary derivation in the stated topological-group scope, using Kim’s cocycle convention and nonnormal-subgroup exactness motivation. This is not a separately named theorem of Kim or a claim of representability.

### Projection of invariant elements to cosets

Declaration: TauCeti.NonabelianCohomology.invariantCoset. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/invariant-coset-projection.

Construct π⁰:B^G → (B/i(A))^G by sending the actual fixed element b to its left coset [b]. Here B^G is the native fixed-point subgroup and (B/i(A))^G is the native fixed-point subset of the native coset type. The base point is π⁰(1); no group structure is imposed on the coset set.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups. G acts continuously on A and B by automorphisms.
- i:A → B is a group homomorphism, a closed embedding and G-equivariant. No normality of i(A) and no continuous section of the coset projection are assumed.

Proof or construction:

1. The quotient class of b is fixed because every g fixes b. Package the class and this proof in the existing fixed-point subset.
2. Use a local abbreviation InvariantCosets only to instantiate the two existing Mathlib carriers with the descended action; it is not a second invariant or quotient definition.
3. The representative projection is literal. Right multiplication by an element of i(A^G) changes no left coset.

Uses:

- AnabelianGeometryAndNonabelianChabauty:NC.3/invariants-kernel: Its base-point fibre is exactly the image of A^G in B^G.
- AnabelianGeometryAndNonabelianChabauty:NC.3/invariant-coset-kernel: Its image is exactly the kernel of the connecting map.
- Kim §1, printed p. 9; NC.3 crystalline-condition consumer: Prepares the initial invariant-group portion of the subgroup exact sequence.

API:

- TauCeti.NonabelianCohomology.invariantCoset_apply (projection): The underlying coset of π⁰(b) is exactly [b]. Promoted to invariant-coset-image.
- TauCeti.NonabelianCohomology.invariantCoset_one (simp): The underlying coset of π⁰(1) is [1], specifying the distinguished point without assuming a quotient group.
- TauCeti.NonabelianCohomology.invariantCoset_mul_image (compatibility): For b∈B^G and a∈A^G, π⁰(b·i(a))=π⁰(b).

Tests:

- TauCeti.NonabelianCohomology.tests.invariantCoset_identity (degenerate): For i=id_B and every b∈B^G, π⁰(b)=π⁰(1): the coset space is a singleton.
- TauCeti.NonabelianCohomology.tests.invariantCoset_trivial_subgroup (characterisation): If i(A) is the trivial subgroup, π⁰:B^G → (B/i(A))^G is injective. A constant projection fails whenever B^G has two elements.
- TauCeti.NonabelianCohomology.tests.invariantCoset_nonnormal (computation): For discrete G=C₂ acting trivially on B=S₃ and A the subgroup {1,(01)}, the native invariant-coset type has cardinality three. The subgroup is nonnormal; a quotient-group requirement is invalid.

Acceptance:

- The construction accepts a nonnormal subgroup. π⁰ is a pointed-set map, not claimed to be a homomorphism on a nonexistent quotient group.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-action, AnabelianGeometryAndNonabelianChabauty:NC.3/fixed-coset-criterion, AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles, AnabelianGeometryAndNonabelianChabauty:NC.3/functoriality, mathlib:FixedPoints.subgroup, mathlib:QuotientGroup.eq.

Source: [Kim arXiv:math/0409456v1](https://arxiv.org/pdf/math/0409456v1), §1, printed pp. 5–6 (continuous cocycle and gauge conventions) and p. 9 (subgroup exactness). Direct elementary derivation in the stated topological-group scope, using Kim’s cocycle convention and nonnormal-subgroup exactness motivation. This is not a separately named theorem of Kim or a claim of representability.

### Underlying invariant coset projection

Declaration: TauCeti.NonabelianCohomology.invariantCoset_apply. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/invariant-coset-image.

For b∈B^G, the underlying coset of π⁰(b) equals [b] in B/i(A).

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups. G acts continuously on A and B by automorphisms.
- i:A → B is a group homomorphism, a closed embedding and G-equivariant. No normality of i(A) and no continuous section of the coset projection are assumed.

Proof or construction:

1. Unfold the subtype packaging of invariantCoset. The underlying value is the existing canonical quotient class.

Acceptance:

- The identity representative gives the distinguished coset [1].

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/invariant-coset-projection.

Source: [Kim arXiv:math/0409456v1](https://arxiv.org/pdf/math/0409456v1), §1, printed pp. 5–6 (continuous cocycle and gauge conventions) and p. 9 (subgroup exactness). Direct elementary derivation in the stated topological-group scope, using Kim’s cocycle convention and nonnormal-subgroup exactness motivation. This is not a separately named theorem of Kim or a claim of representability.

### Connecting map on invariant cosets

Declaration: TauCeti.NonabelianCohomology.connecting. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-map.

Construct δ:(B/i(A))^G → H¹(G,A) on the actual invariant coset set. For an invariant coset q choose a representative b and put δ(q)=[c_b], where i(c_b(g))=b⁻¹(g·b). The result is independent of the representative. The source is a pointed set with point π⁰(1); δ sends that point to the H¹ base point.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups. G acts continuously on A and B by automorphisms.
- i:A → B is a group homomorphism, a closed embedding and G-equivariant. No normality of i(A) and no continuous section of the coset projection are assumed.

Proof or construction:

1. Choose b as the existing quotient representative q.out. QuotientGroup.out_eq′ and fixed-coset-criterion turn q’s actual fixedness proof into the membership required by connectingCocycle.
2. Apply the previously planned continuous connectingCocycle and take its class in the previously planned orbit quotient H¹. Continuity is already supplied by the embedding argument; this definition is not an arbitrary function admitted into H¹.
3. Any second representative is b·i(a) for some a by QuotientGroup.eq and range membership (or mk_out_eq_mul). The old change-of-lift theorem gauges c_b by a⁻¹ and hence preserves its H¹ class.
4. An invariant representative has trivial connecting cocycle; apply this to 1 to get preservation of the distinguished point. No topology on the coset set or continuous quotient section is needed for the set-valued map.

Uses:

- Kim §1, printed p. 9: The actual boundary in the displayed nonnormal coefficient-subgroup exact sequence.
- AnabelianGeometryAndNonabelianChabauty:NC.3/invariant-coset-kernel and AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-image-kernel: Use the actual function’s fibres and image to express pointed-set exactness.
- AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-quotient-fibres: Compute its fibres as left B^G-orbits.

API:

- TauCeti.NonabelianCohomology.connecting_mk (projection): For an admissible representative b of q, δ(q)=[c_b]. Promoted to connecting-map-lift.
- TauCeti.NonabelianCohomology.connecting_invariantCoset (simp): For b∈B^G, δ(π⁰(b))=1. In particular δ preserves the distinguished point.
- TauCeti.NonabelianCohomology.connecting_change_representative (compatibility): If q and q′ have representatives b and b·i(a), then δ(q′)=δ(q). This compares actual coset inputs, not only their lift cocycles.

Tests:

- TauCeti.NonabelianCohomology.tests.connecting_coset_fixed (degenerate): For every equivariant closed embedding i and b∈B^G, the actual coset-map value δ(π⁰(b)) is the base point.
- TauCeti.NonabelianCohomology.tests.connecting_coset_identity (compatibility): For i=id_B, δ(q)=1 for every invariant coset q, agreeing with c_b=coboundary(b⁻¹).
- TauCeti.NonabelianCohomology.tests.connecting_coset_nontrivial (non-example): For discrete G=C₂, A=C₂ with trivial action, B=C₄ with negation action, and i(a)=2a (doubling natural representatives modulo 4), the invariant odd coset q=[1] has δ(q)≠1. Its cocycle sends the nonidentity of G to the nonidentity of A; A-coboundaries are trivial. No fixed lift of q exists.

Acceptance:

- The negation action on C₄ gives a nontrivial boundary on its odd invariant coset modulo {0,2}. A constant boundary map fails this test.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/fixed-coset-criterion, AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-cocycle, AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-change-lift, AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, mathlib:QuotientGroup.out_eq', mathlib:QuotientGroup.mk_out_eq_mul.

Source: [Kim arXiv:math/0409456v1](https://arxiv.org/pdf/math/0409456v1), §1, printed pp. 5–6 (continuous cocycle and gauge conventions) and p. 9 (subgroup exactness). Direct elementary derivation in the stated topological-group scope, using Kim’s cocycle convention and nonnormal-subgroup exactness motivation. This is not a separately named theorem of Kim or a claim of representability.

### Representative formula for the connecting map

Declaration: TauCeti.NonabelianCohomology.connecting_mk. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-map-lift.

If q∈(B/i(A))^G is represented by b and b⁻¹(g·b)∈i(A) for every g, then δ(q)=[c_b] with the already planned continuous connecting cocycle. This holds for every proof of membership and every representative.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups. G acts continuously on A and B by automorphisms.
- i:A → B is a group homomorphism, a closed embedding and G-equivariant. No normality of i(A) and no continuous section of the coset projection are assumed.

Proof or construction:

1. Compare the chosen representative q.out with b using equality of their actual left cosets. The existing coset equality criterion provides a∈A with q.out=b·i(a).
2. The old connectingCocycle_change_lift identifies the two cocycles by the gauge a⁻¹; the inherited H¹ orbit quotient gives equality of classes. Proof irrelevance and uniqueness of the lifted cocycle dispose of membership witnesses.

Acceptance:

- Both even lifts represent the even coset of C₄/{0,2}, and both odd lifts represent the odd coset. The class remains unchanged within each pair.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-map, AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-change-lift, mathlib:QuotientGroup.eq, mathlib:QuotientGroup.out_eq'.

Source: [Kim arXiv:math/0409456v1](https://arxiv.org/pdf/math/0409456v1), §1, printed pp. 5–6 (continuous cocycle and gauge conventions) and p. 9 (subgroup exactness). Direct elementary derivation in the stated topological-group scope, using Kim’s cocycle convention and nonnormal-subgroup exactness motivation. This is not a separately named theorem of Kim or a claim of representability.

### Injectivity on invariant subgroups

Declaration: TauCeti.NonabelianCohomology.H0.map_injective. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/invariants-injection.

The map i⁰:A^G → B^G induced by an equivariant closed embedding i is injective. Thus its base-point fibre is {1}, giving the initial exactness at A^G in 1 → A^G → B^G → (B/i(A))^G.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups. G acts continuously on A and B by automorphisms.
- i:A → B is a group homomorphism, a closed embedding and G-equivariant. No normality of i(A) and no continuous section of the coset projection are assumed.

Proof or construction:

1. Equality of mapped fixed elements gives equality of their values under i. A closed embedding is injective. Apply that injectivity and subtype extensionality.

Acceptance:

- For the doubling C₂ ↪ C₄ with the actions above, A^G=C₂ maps bijectively onto B^G={0,2}.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/functoriality, AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles.

Source: [Kim arXiv:math/0409456v1](https://arxiv.org/pdf/math/0409456v1), §1, printed pp. 5–6 (continuous cocycle and gauge conventions) and p. 9 (subgroup exactness). Direct elementary derivation in the stated topological-group scope, using Kim’s cocycle convention and nonnormal-subgroup exactness motivation. This is not a separately named theorem of Kim or a claim of representability.

### Exactness at the invariant ambient group

Declaration: TauCeti.NonabelianCohomology.invariantCoset_eq_base_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/invariants-kernel.

For b∈B^G, π⁰(b)=π⁰(1) if and only if b lies in the image of i⁰:A^G → B^G. This is pointed-set exactness at B^G for a subgroup that need not be normal.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups. G acts continuously on A and B by automorphisms.
- i:A → B is a group homomorphism, a closed embedding and G-equivariant. No normality of i(A) and no continuous section of the coset projection are assumed.

Proof or construction:

1. By invariant-coset-image and the native quotient equality criterion, π⁰(b)=π⁰(1) says b∈i(A). Choose a∈A with i(a)=b.
2. Since b is fixed, equivariance gives i(g·a)=g·i(a)=i(a); injectivity of i proves that a is fixed. Its subtype is a preimage under i⁰.
3. Conversely an image element has coset [1], directly by range membership. Subtype extensionality identifies the actual fixed-coset elements.

Acceptance:

- With trivial C₂-action on S₃ and the transposition subgroup, the base-coset fibre has two elements, precisely A^G, while there are three invariant cosets.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/invariant-coset-image, AnabelianGeometryAndNonabelianChabauty:NC.3/functoriality, AnabelianGeometryAndNonabelianChabauty:NC.3/invariants-injection, mathlib:QuotientGroup.eq.

Source: [Kim arXiv:math/0409456v1](https://arxiv.org/pdf/math/0409456v1), §1, printed pp. 5–6 (continuous cocycle and gauge conventions) and p. 9 (subgroup exactness). Direct elementary derivation in the stated topological-group scope, using Kim’s cocycle convention and nonnormal-subgroup exactness motivation. This is not a separately named theorem of Kim or a claim of representability.

### Exactness at invariant cosets

Declaration: TauCeti.NonabelianCohomology.connecting_eq_one_iff_mem_range. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/invariant-coset-kernel.

For q∈(B/i(A))^G, δ(q)=1 if and only if q is in the image of π⁰:B^G → (B/i(A))^G. Thus vanishing of the actual connecting class is equivalent to existence of a G-fixed representative of the coset.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups. G acts continuously on A and B by automorphisms.
- i:A → B is a group homomorphism, a closed embedding and G-equivariant. No normality of i(A) and no continuous section of the coset projection are assumed.

Proof or construction:

1. Choose b=q.out and use connecting-map-lift to evaluate δ(q). The old connecting_eq_one_iff says [c_b]=1 exactly when b·i(a) is fixed for some a∈A.
2. Such a fixed lift t represents q by the native coset equality criterion. Package t in B^G and use invariant-coset-image to obtain q=π⁰(t).
3. Conversely q=π⁰(t) is represented by fixed t; evaluate δ by connecting-map-lift and use connectingCocycle_eq_one_of_fixed.

Acceptance:

- For negation on C₄ modulo {0,2}, only the even coset is in this kernel: the odd coset is invariant but has no fixed lift.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-map-lift, AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-class-zero, AnabelianGeometryAndNonabelianChabauty:NC.3/invariant-coset-image, mathlib:QuotientGroup.eq.

Source: [Kim arXiv:math/0409456v1](https://arxiv.org/pdf/math/0409456v1), §1, printed pp. 5–6 (continuous cocycle and gauge conventions) and p. 9 (subgroup exactness). Direct elementary derivation in the stated topological-group scope, using Kim’s cocycle convention and nonnormal-subgroup exactness motivation. This is not a separately named theorem of Kim or a claim of representability.

### Exactness at nonabelian first cohomology

Declaration: TauCeti.NonabelianCohomology.H1.map_eq_one_iff_mem_range_connecting. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-image-kernel.

For x∈H¹(G,A), i_*(x)=1 in H¹(G,B) if and only if x lies in the image of the actual map δ:(B/i(A))^G → H¹(G,A). This is the lift-form inclusion-kernel theorem transported to the native coset carrier.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups. G acts continuously on A and B by automorphisms.
- i:A → B is a group homomorphism, a closed embedding and G-equivariant. No normality of i(A) and no continuous section of the coset projection are assumed.

Proof or construction:

1. The existing exact_H1_of_subgroup supplies b and a continuous cocycle c with x=[c] and i(c(g))=b⁻¹(g·b). This proves membership for each g.
2. Use fixed-coset-criterion to package [b] as an invariant coset. Uniqueness of connectingCocycle and connecting-map-lift show that δ([b])=[c]=x.
3. Conversely choose a representative of an invariant coset. Its connecting cocycle maps to the B-coboundary of b⁻¹, so the already planned inclusion-kernel theorem kills its class.

Acceptance:

- For C₂ ↪ C₄ as above, both H¹(C₂,C₂) classes are killed in H¹(C₂,C₄), and the two invariant cosets supply precisely those two classes. This concerns the fibre over 1, not arbitrary untwisted fibres.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/exact-sequence, AnabelianGeometryAndNonabelianChabauty:NC.3/fixed-coset-criterion, AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-map-lift, AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-cocycle-image.

Source: [Kim arXiv:math/0409456v1](https://arxiv.org/pdf/math/0409456v1), §1, printed pp. 5–6 (continuous cocycle and gauge conventions) and p. 9 (subgroup exactness). Direct elementary derivation in the stated topological-group scope, using Kim’s cocycle convention and nonnormal-subgroup exactness motivation. This is not a separately named theorem of Kim or a claim of representability.

### Invariant ambient group orbits in boundary fibres

Declaration: TauCeti.NonabelianCohomology.connecting_eq_connecting_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-quotient-fibres.

For invariant cosets q,q′, δ(q)=δ(q′) if and only if q′=[t·b] for some t∈B^G and a representative b of q. Equivalently the fibres of δ are exactly the left B^G-orbits on the existing coset set. In the suggested form b is q.out; the condition is independent of that choice.

Hypotheses:

- G, A and B are groups with topologies; A and B are topological groups. G acts continuously on A and B by automorphisms.
- i:A → B is a group homomorphism, a closed embedding and G-equivariant. No normality of i(A) and no continuous section of the coset projection are assumed.

Proof or construction:

1. Represent q and q′ by b and b′ and evaluate both boundaries by connecting-map-lift.
2. The old connecting_classes_eq_iff gives a fixed t∈B and a∈A with b′=t·b·i(a). The native coset equality criterion erases the right i(a) factor, giving q′=[t·b].
3. Conversely q′=[t·b] supplies a right factor i(a) between representatives. Apply the same fixed-orbit criterion and connecting-map-lift.
4. Left translation is well-defined because (t·b)⁻¹(t·b′)=b⁻¹b′. If t is fixed, g·[t·b]=[t·(g·b)]=[t·b]. This is the existing left coset action restricted to B^G, not quotient multiplication.

Acceptance:

- With trivial G-action on S₃ all three transposition-subgroup cosets form one left B^G-orbit and δ is trivial. For negation on C₄, B^G={0,2} fixes both cosets individually; their δ values differ.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-map-lift, AnabelianGeometryAndNonabelianChabauty:NC.3/connecting-fixed-orbits, mathlib:QuotientGroup.eq, mathlib:MulAction.left_quotientAction.

Source: [Kim arXiv:math/0409456v1](https://arxiv.org/pdf/math/0409456v1), §1, printed pp. 5–6 (continuous cocycle and gauge conventions) and p. 9 (subgroup exactness). Direct elementary derivation in the stated topological-group scope, using Kim’s cocycle convention and nonnormal-subgroup exactness motivation. This is not a separately named theorem of Kim or a claim of representability.

### Evidence and remaining work

Fresh reading covers the selected Kim passages and pinned Mathlib coset/action declarations listed in the new receipt. JacobianChallenge and Multiquadratic were read in full. ProfiniteCohomology was only partly read. All seven reviewed audit rows and stage contracts, seventeen touching stage edges and applicable RS-29/RS-03 ownership/forwarding entries were read. A current screen of link packets found 29 negative examined entries and no asserted matching link; accepted restructure links were checked separately.

The only removed gap is the addressed invariant-coset map and initial exactness packaging gap. This earlier NC.3 checkpoint retained nine gaps, eleven supplier requests, the reserved K(π,1) contract and the complete Chen/BDMTV inventory. The current NC.0 supplier accounting is given below. No stage closes. Generic coset topology is not required by these set-valued maps. Unipotent-point topologies, representability, local conditions, Selmer varieties, central H² obstructions and the inherited missing signatures still require continuation. The full suggested file was not compiled: no existing combined build at both pins was found. Finite computations and static signature checks are recorded in the handoff; historical compilation receipts are not fresh certificates for these additions.


## NC.0 — finite-étale cohomological assembly

Fix a connected noetherian scheme X, a geometric point x and the full profinite
finite-étale group π. The coefficient class for this assembly consists of all
finite locally constant abelian sheaves whose stalk orders have prime factors
in a fixed set P. It is preserved by pullback, finite-étale direct image,
subquotients and extensions. All primes gives full finite coefficients; {p}
gives the p-primary class. The prime set does not restrict the fundamental
group to its maximal pro-p quotient. No invertibility assumption is required
for this formal cohomological criterion.

This scope is deliberately narrower than the arbitrary coefficient-class
argument of the reserved definition: its restriction and pointed-transport API
still accepts every isomorphism-invariant class, but finite-cover invariance
uses the closure properties just stated. A singleton chosen representation
need not supply the induced coefficients of a nonnormal cover.

There are two equivalent class-killing tests. One tests every allowed locally
constant coefficient on X in every positive degree. The other tests constant
finite coefficients in degrees at least two on every connected finite cover
of X. The second form keeps its cover quantifier. The degree-one gap between
the forms is supplied by the finite étale torsor of a class: its pullback to
itself has the diagonal section. Degree zero is the canonical invariants and
global-sections comparison. A constant coefficient test only on X has neither
the cover quantifier nor a way to see all finite monodromy.

### The canonical maps in the proof

Let f:Y→X be finite étale. Étale locally it is a finite disjoint union of
copies of the base. Its direct image on abelian sheaves is therefore a finite
product functor and is exact. The stalk of f_*F is the product of the stalks
over all geometric sheets; the π action permutes those factors. This is a
finite locally constant sheaf, but is not generally a constant product.
The requested SF.2 result identifies the actual cohomology map

μ_f:H^q_et(X,f_*F) → H^q_et(Y,F)

as an isomorphism. Its definition is pullback followed by the adjunction
counit; isomorphism follows from vanishing of the higher direct images. For
α on Y choose α′=μ_f⁻¹(α), then kill α′ by g:X′→X. In the cartesian square
Y′=Y×_X X′, the base-change isomorphism is bc:g*f_*F≅f′_*g′*F.
The equality used to kill α is

g′*μ_f(α′) = μ_f′(bc_*(g*α′)).

The right side is zero. The equality follows from naturality of cohomological
pullback, naturality in coefficients and the adjunction triangle identities.
It cannot be replaced by the existence of some group isomorphism between
the two cohomology groups. This argument requires neither a Galois cover nor
an inverse of its degree. It also works for a disconnected Y; the finite
disjoint union of covers of its components is still a finite surjective cover.

The morphism ρ:X_et→X_fet to the finite-étale topos then finishes the reverse
implication. For q>0 the higher direct image R^qρ_*F is the sheafification of
the presheaf sending Y→X to H^q_et(Y,F|Y). Transfer of effacement supplies the
killing condition at every object of that site, so this sheaf vanishes. In
degree zero the unit identifies a finite π-module with ρ_* of its associated
sheaf. The requested Leray comparison identifies the resulting edge with the
canonical ε^q after X_fet≃Bπ. No Artin–Mazur homotopy detection is used here.
The homotopy comparison and fibration nodes retain their distinct source leaves.

For the forward implication, the all-degree canonical continuous-cohomology
package supplies finite-quotient descent. A class is inflated from π/N with
coefficients fixed by N. Its restriction to N factors through the trivial
group, whose positive-degree cohomology vanishes. For finite coefficients one
can refine N by the open action kernel. Naturality of ε translates this into
finite-cover killing. This reasoning is an application of the upstream
ProfiniteCohomology all-degree package. It is not a new NC.0 construction of
continuous cochains, and low-degree descent alone does not prove every degree.

### Coefficient extensions and the order of the covers

For 0→F′→F→F″→0, fix α∈H^q(Y,F|Y), q>0. Kill its image with F″ coefficients
on a first cover h:Z→Y. The long exact sequence on Z now gives a lift
η∈H^q(Z,F′|Z) of h*α. The lift need not exist on Y. Kill η on a second cover
j:W→Z; naturality in coefficients makes (h∘j)*α zero. Thus the assumptions
for the two end coefficients must hold after every finite base change.

An arbitrary finite π-module need not be an iterated extension of trivial
one-dimensional π-modules. Trivialize its finite monodromy on a finite cover
first. Then use the primary decomposition of its finite abelian group and
the filtration by p-power multiples. The successive layers are finite
F_p-vector spaces. Constant vector coefficients are finite direct sums of
F_p, and classes in finitely many summands can be killed by a common finite
refinement. This provides the constant prime-field criterion on every finite
cover. The exact sequence 0→F_p→Z/p²→F_p→0 tests the proof’s ability to use
the long exact sequence without assuming a splitting.

The five declarations below are NC.0 applications of generic interfaces.
They define no new sheaf, fundamental-group or continuous-cohomology carrier.
The actual geometric μ, bc, ρ and ε maps are still supplier inputs, so their
suggested signatures are explicitly omitted with mathematical contracts until
those types are available. The reserved K(π,1) definition keeps its exact ID.

### Transport of class effacement to finite covers

Declaration: TauCeti.EtaleKPiOne.effacement_of_finiteEtale. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/effacement-finite-cover-transfer.

Assume every positive-degree étale cohomology class on X with every allowed coefficient can be killed by some finite étale surjective cover of X. For a finite étale map f:Y→X, any allowed coefficient F on Y, q>0 and α∈H^q_et(Y,F), there exists a finite étale surjective g:X′→X such that its base change g′:Y×_X X′→Y kills α. Y need not be connected and f need not be normal or surjective. The specified equality is g′* μ_f(α′)=μ_f′(bc_*(g*α′)), where μ_f:H^q_et(X,f_*F)→H^q_et(Y,F) is the pullback/counit isomorphism and α′=μ_f⁻¹(α).

Hypotheses:

- X is a connected noetherian scheme with a geometric point x; π is its full profinite finite-étale fundamental group.

- P is any set of primes. Allowed coefficients are finite locally constant abelian étale sheaves whose stalk orders have prime factors in P. No invertibility hypothesis on those primes is imposed.

Construction or proof:

1. Import from SF.2 exact finite-étale direct image, preservation of finite locally constant coefficients, the actual base-change isomorphism bc:g*f_*F≅f′_*g′*F and the pullback/counit cohomology map μ_f. Locally f is a finite disjoint union of copies of X, so exact finite products supply R^j f_*F=0 for j>0; these are generic sheaf-theoretic inputs, not local NC definitions.

2. The stalk of f_*F at x is a finite product over the sheets, with sheet-permutation monodromy. Prime support is preserved under finite products. Apply the hypothesis to α′=μ_f⁻¹(α); choose g killing α′.

3. Use SF.2’s (2.4.2) square: g′* μ_f(α′)=μ_f′(bc_*(g*α′)). Its proof factors through cohomological pullback, base change and the adjunction counit; the last square is the triangle identity, not an arbitrary isomorphism of cohomology groups.

4. The right side is zero by the choice of g. Finite étaleness and surjectivity survive base change, so g′ is the required cover of Y. For the empty Y the class is already zero.

Acceptance:

- For f=id_X, μ and the base-change identification are identities; the chosen cover is the original class-killing cover.

- For the nonnormal index-three subgroup C₂⊂S₃ and F₂ coefficients, direct image is the permutation module F₂[S₃/C₂], with H⁰,H¹,H² dimensions (1,1,1). The constant rank-three module has (3,3,3), so replacing monodromy by a constant product fails.

- For C₃⊂S₃ and F₂ coefficients the cover degree is two, which is zero in F₂, but the direct-image comparison still works. No division by the degree is used.

Prerequisites: SchemeAndStackFoundations:SF.2, InverseGaloisAndArithmeticFundamentalGroups:IG.0.

Sources:

- achinger-effacement-2014-v1, §§2.1–2.6, (2.4.1–2); Proposition 3.4(a), pp. 5–8. The general naturality square and the printed finite-direct-image argument give this NC.0 specialization.

### All-coefficient finite-cover criterion

Declaration: TauCeti.EtaleKPiOne.iff_allCoefficient_effacement. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/all-coefficient-effacement.

Is(X,x;P-supported finite coefficients) holds iff for every allowed finite locally constant abelian sheaf F, every q>0 and every α∈H^q_et(X,F), some finite étale surjective g:X′→X satisfies g*α=0. The K(π,1) side uses the canonical ε^q, all nonnegative degrees and the full π; the killing cover may depend on F,q,α. This equivalence is asserted for connected noetherian schemes without a geometric-unibranch restriction.

Hypotheses:

- X is a connected noetherian scheme with a geometric point x; π is its full profinite finite-étale fundamental group.

- P is any set of primes. Allowed coefficients are finite locally constant abelian étale sheaves whose stalk orders have prime factors in P. No invertibility hypothesis on those primes is imposed.

Construction or proof:

1. For the forward direction use ProfiniteCohomology Layer 10’s canonical all-degree finite-quotient colimit and natural restriction/inflation. Any class is inflated from a finite quotient π/N with coefficients M^N. On restriction to N its class factors through positive cohomology of the trivial group, which vanishes. For finite M one may refine N by its open action kernel. IG.0 identifies N with a pointed finite étale cover, and naturality of ε kills the corresponding étale class.

2. For the reverse direction apply effacement-finite-cover-transfer to every object Y of the finite-étale site. This gives killing of all allowed classes on every such object, including coefficients not descended from X. For disconnected Y treat its finitely many components and combine their covers.

3. Import ρ:X_et→X_fet and the SF.2 description of R^qρ_*F as the sheafification of (Y→X)↦H^q_et(Y,F|Y). Finite-cover effacement at every site object makes this sheaf zero for q>0. The unit is an isomorphism in degree zero by the finite-coefficient/sheaf dictionary.

4. Leray for ρ now identifies the comparison from H^q(X_fet,M) to H^q(X_et,L(M)) with ε^q. Under X_fet≃Bπ and the canonical continuous-cohomology comparison it is an isomorphism. Generic sites, derived direct image, Leray and the group-cohomology package are exact supplier inputs; no raw Artin–Mazur homotopy theorem is used.

Acceptance:

- P=∅ admits only the zero finite coefficient and both sides hold on every X.

- P={p} retains all p-primary modules and their monodromy; π is not replaced by its maximal pro-p quotient.

- Degree-one classes die on their finite étale torsors via the diagonal section. Arbitrary small-site covers in place of finite covers would turn this into ordinary local effacement and fail to distinguish P¹.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/effacement-finite-cover-transfer, SchemeAndStackFoundations:SF.2, InverseGaloisAndArithmeticFundamentalGroups:IG.0, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees.

Sources:

- achinger-effacement-2014-v1, Definition 3.3; Proposition 3.4(a), pp. 7–8. Prime-supported finite-coefficient effacement and the higher-direct-image proof.

- achinger-all-primes-2017, Definition 4.1; Proposition 4.2(a); Lemma 4.3. The version-of-record explicitly includes noninvertible torsion. This plan assembles the canonical cohomological, rather than raw-homotopy, formulation.

### Finite étale invariance of étale K(π,1)

Declaration: TauCeti.EtaleKPiOne.finiteEtale_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/finite-etale-invariance.

For f:Y→X finite étale surjective, Is(X,x;P-supported finite coefficients) holds iff every connected component of Y has the corresponding property at any geometric point above it. This includes full and p-primary coefficients. It is not asserted for an arbitrary coefficient class lacking closure under finite-étale direct image and pullback; Y may be disconnected.

Hypotheses:

- X is a connected noetherian scheme with a geometric point x; π is its full profinite finite-étale fundamental group.

- P is any set of primes. Allowed coefficients are finite locally constant abelian étale sheaves whose stalk orders have prime factors in P. No invertibility hypothesis on those primes is imposed.

Construction or proof:

1. Use all-coefficient-effacement to express the property of X by killing allowed classes. The transfer lemma gives that same killing condition on Y; split into components and apply the criterion there, proving ascent.

2. For descent, pull an allowed F and class α on X back along f. On each of the finitely many components of Y choose a finite étale surjective class-killing cover. Their finite disjoint union Z→Y kills f*α. The composite Z→X is finite étale surjective and kills α by functoriality.

3. Apply all-coefficient-effacement to X. Basepoint independence is the inherited transport theorem. Every coefficient still lies in the same prime-supported class, because pullback preserves its stalks and finite direct image has finite product stalks.

Acceptance:

- For Y=X⊔X over X the property agrees componentwise, with no arbitrary choice of a distinguished component.

- For Y empty and X nonempty, the map is not surjective and does not satisfy the theorem. Surjectivity must remain a hypothesis.

- A connected nonnormal finite étale cover has the same equivalence; no Galois action on the cover and no inverse of its degree is required.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1, AnabelianGeometryAndNonabelianChabauty:NC.0/all-coefficient-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/effacement-finite-cover-transfer, AnabelianGeometryAndNonabelianChabauty:NC.0/basepoint-transport, SchemeAndStackFoundations:SF.2, InverseGaloisAndArithmeticFundamentalGroups:IG.0.

Sources:

- achinger-effacement-2014-v1, Proposition 3.4(b), statement and proof, pp. 7–8. Both implications use finite-cover killing; ascent is the same direct-image argument as (a).

- achinger-all-primes-2017, Proposition 4.2(b). All finite coefficients and componentwise formulation in §4.

### Two-cover dévissage of coefficients

Declaration: TauCeti.EtaleKPiOne.effacement_of_shortExact. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/effacement-extension.

Let 0→F′→F→F″→0 be a short exact sequence of allowed finite locally constant abelian sheaves on X. Assume that for every finite étale Y→X and every q>0 every class with coefficients F′|Y and every class with coefficients F″|Y dies after a finite étale surjective cover of Y. Then the same property holds for F|Y. No filtration by trivial one-dimensional π-modules is assumed.

Hypotheses:

- X is a connected noetherian scheme with a geometric point x; π is its full profinite finite-étale fundamental group.

- P is any set of primes. Allowed coefficients are finite locally constant abelian étale sheaves whose stalk orders have prime factors in P. No invertibility hypothesis on those primes is imposed.

Construction or proof:

1. Fix Y,q and α∈H^q(Y,F|Y). Kill its image β∈H^q(Y,F″|Y) on h:Z→Y, using the F″ assumption at Y. Exactness of pullback preserves the coefficient short exact sequence.

2. By the cohomology long exact sequence on Z, h*α lifts to a class η∈H^q(Z,F′|Z). This is existence of a lift after the first cover; it does not claim a splitting of F→F″.

3. Apply the F′ assumption at Z to η and choose a second cover j:W→Z killing it. Coefficient-map naturality gives (h∘j)*α=0. The composite is finite étale surjective. The order and bases of the two covers are essential.

Acceptance:

- The zero end coefficient reduces to the other end without creating a spurious obstruction.

- The constant exact sequence 0→F_p→Z/p²→F_p→0 need not split. The two-cover argument still applies; a chosen lift need not be killed by the first cover.

- For q=1 the finite étale torsor already kills each class. In q=0 a nonzero invariant constant section cannot be killed by a surjective cover, so the positive-degree restriction is necessary.

Prerequisites: SchemeAndStackFoundations:SF.2, InverseGaloisAndArithmeticFundamentalGroups:IG.0.

Sources:

- achinger-all-primes-2017, Proposition 4.2(c), complete proof. The long-exact-sequence proof requires killing after every finite base change; the layers are F_p-vector sheaves, not necessarily trivial representations.

### Constant coefficients still do not permit a pro-p quotient

The reserved definition retains the existing C₂ sign-action/F₃ degree-zero
test. Its additional test is
TauCeti.EtaleKPiOne.tests.constantFp_not_pro_p_cohomology. Write S₃ as pairs
(a,e)∈Z/3×Z/2 with multiplication (a,e)(b,f)=(a+(−1)^e b,e+f). Let a(g) be
the representative in {0,1,2} and s(g)=(−1)^e. The sign-valued normalized
2-cocycle is β(g,h)=(a(g)+s(g)a(h)−a(gh))/3 modulo 3. The quotient is an
integer because the numerator is zero modulo 3. The constant-valued
3-cocycle is c(g,h,k)=a(g)s(g)β(h,k) modulo 3. The cocycle identity follows
by the cup product of the sign-valued 1-cocycle a and sign-valued β; the two
sign actions multiply to the trivial coefficient action. This also has a
direct finite differential check, independent of an imported cup convention.

For r=(1,0), the normalized bar 3-chain
z=[r|r|r]+[r|r²|r] has boundary zero modulo 3. The four-term bar boundary
formula gives cancellations of [r|r], [r²|r] and [r|r²], and terms with the
identity vanish in the normalized complex. Pairing c with z gives 1 modulo 3.
A coboundary pairs to zero with a cycle, hence the class of c is nonzero.
The maximal pro-3 quotient of S₃ is trivial: an image of each transposition
in a 3-group has order dividing both 2 and a power of 3 and is trivial,
while transpositions generate S₃. Its positive-degree F₃ cohomology is zero.
Thus even constant F₃ cohomology need not agree with that quotient. The test
concerns group cohomology; it does not assert the existence of a K(π,1)
scheme with fundamental group S₃.

### Native library boundary and finite regression

At the recorded pins, Mathlib’s groupCohomology.coindIso supplies discrete
Shapiro in every degree. Tau Ceti supplies explicitShapiro0 by evaluation at
one and explicitShapiro1 for a profinite group and closed subgroup with
discrete coefficients. Its exists_openNormalSubgroup_descendZ2 and
exists_explicitInfl2_eq provide strict degree-two descent and inflation
surjectivity. The native openActionKernel supplies the common open subgroup
fixing every coefficient of a finite discrete action. These six new baseline
records retain their exact scopes; they are not new roadmap nodes.

ArithmeticGaloisDuality:R02.1/carrier-comparison was inspected. It extends
the upstream discrete comparison to compact and rational coefficients; its
mention of finite discrete coefficients does not transfer ownership of the
generic discrete package. This assembly imports the precise all-degree
ProfiniteCohomology stage, and does not build a parallel complex. The carrier
continuousCohomology by itself is not proof of all-degree class killing.

The executable S₃ regression retained in the historical handoff was run
afresh using exact modular integer linear algebra. Eight cases cover one
subgroup from each conjugacy class, at primes 2 and 3. Evaluation at the
identity coset gives 24 chain-map equalities and 24 induced isomorphisms in
degrees 0–2. For the nonnormal C₂ subgroup its coinduced F₂ module has
dimensions (1,1,1); the constant rank-three F₂ module has (3,3,3).
Separately, 216 β identities and 1296 c identities pass, z is a cycle, the
pairing is 1 and H³(S₃,F₃) has computed dimension one. The nonzero-class
argument above only needs the cycle pairing. These finite checks are
regressions for monodromy and coefficient conventions, not proofs of the
geometric theorem or a Lean elaboration receipt.

Fresh source reading is precisely Achinger arXiv:1407.0337v1, §§2.1–2.6,
3.1–3.3 and Proposition 3.4(a–b), pp.5–8, including both complete proofs and
the rendered pp.7–8 diagrams; and the version-of-record 2017 HTML §4,
Definition 4.1, Proposition 4.2 and Lemma 4.3 with their printed proofs.
The broader raw-homotopy Proposition 4.4 was inspected without claiming to
discharge its Artin–Mazur inputs. The 2014 arbitrary-prime-set formulation
is used because its unqualified shorthand excludes noninvertible primes.
The 2017 text explicitly adopts all primes. Primary hashes are in the packet.

The packet has 51 nodes (3 definitions, 4 constructions, 16 lemmas, 22 theorems and 6 comparisons), 52 API items, 42 test contracts, 11 planets and 69 baseline records. The four product-regression contracts are finite algebraic falsifiers, in addition to the 38 definition/construction tests. Definition/construction APIs account for 40 of the 52 items. Nine gap groups and sixteen requests remain, and no stage is closed. The full suggested file has not compiled against a combined exact-pin build. Separate Mathlib-only blocks check the inherited discrete Shapiro carriers and the twelve arithmetic smoke examples, not geometric statements. The direct curve proof is decomposed; generic supplier maps, raw homotopy, products, elementary fibrations, unipotent/representability/local conditions, Chen and BDMTV routes, NS and the height boundary remain explicit work.

Additional exact supplier interfaces:

- SchemeAndStackFoundations:SF.2: For any finite étale f:Y→X and finite locally constant abelian F, preserve finite locally constant coefficients and prime support under f_*; exactness of f_* and the pullback/counit isomorphism μ_f in every degree. In a cartesian square supply bc:g*f_*F≅f′_*g′*F and g′*μ_f(α)=μ_f′(bc_*(g*α)), with its triangle-identity proof. The stalk product retains sheet-permutation monodromy, and no Galois, normal-cover, invertible-degree or trace-division assumption is permitted. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/effacement-finite-cover-transfer, AnabelianGeometryAndNonabelianChabauty:NC.0/all-coefficient-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-etale-invariance.

- SchemeAndStackFoundations:SF.2: Natural étale cohomology long exact sequences of short exact finite locally constant abelian coefficients, exact pullback along finite étale maps, naturality in coefficient maps and composition of pullbacks. The extension effacement assembly kills the quotient class on a first cover, lifts after that cover and kills the subobject lift on a second cover; do not assume the coefficient sequence splits. Also supply the generic finite abelian coefficient filtration by finite F_p-vector layers, constant finite-sum cohomology and finite common refinements of class-killing covers, after monodromy trivialization; NC.0 imports this coefficient infrastructure. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/effacement-extension.

- tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees: Reuse the canonical all-degree finite-quotient colimit, restriction/inflation naturality and positive-degree trivial-group vanishing to show that every class for finite discrete coefficients dies on some open normal subgroup. The killing subgroup depends on the class. The native pin supplies H⁰/H¹ Shapiro and explicit H² finite-quotient descent, but not this all-degree conclusion. No second continuous-cohomology carrier or generic group-cohomology construction is planned in NC.0. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/all-coefficient-effacement.


### Constant prime-field tests on all finite covers

Declaration: TauCeti.EtaleKPiOne.iff_primeField_effacement. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/prime-field-effacement.

For a connected noetherian scheme X with geometric point x and a set of primes P, Is(X,x;P-supported finite coefficients) holds iff for every connected finite étale cover Y→X, every p∈P, every q≥2 and every α∈H^q_et(Y,F_p) with constant coefficients, there is a finite étale surjective Z→Y killing α. The prime-field and cover quantifiers are both essential. No assumption of a composition series of trivial π-modules is made.

Hypotheses:

- X is a connected noetherian scheme with a geometric point x; π is its full profinite finite-étale fundamental group.

- P is any set of primes. Allowed coefficients are finite locally constant abelian étale sheaves whose stalk orders have prime factors in P. No invertibility hypothesis on those primes is imposed.

Proof:

1. For necessity use finite-etale-invariance and all-coefficient-effacement on Y with its constant F_p sheaf.

2. For sufficiency, on every finite étale Y→X trivialize a finite locally constant coefficient F by a further finite étale cover. On its connected components the finite abelian coefficient group has a finite filtration with factors finite F_p-vector spaces for p∈P. Import the finite-group filtration through the coefficient supplier interface; it is not an invented filtration by trivial representations before monodromy is killed.

3. Cohomology of constant finite vector coefficients is the finite direct sum of F_p cohomologies. Kill the finitely many component classes by taking a finite common refinement of their covers. Apply effacement-extension along the filtration; its end-coefficient assumptions hold at every finite cover because the hypothesis quantifies them all.

4. Degree-one classes die on finite étale torsors; the degree-zero comparison is invariants. Compose the trivializing and killing covers, apply all-coefficient-effacement on X, and keep the canonical ε maps.

Acceptance:

- For P empty the criterion and the zero-coefficient property both hold.

- Constant F_p tests only on X do not state this theorem; Y must vary over connected finite covers, including nonnormal covers.

- The nonsplit sequence 0→F_p→Z/p²→F_p→0 uses two-cover effacement, and finite F_p-vector layers use common refinements; checking only simple coefficients in degree zero cannot replace the q≥2 tests.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.0/all-coefficient-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-etale-invariance, AnabelianGeometryAndNonabelianChabauty:NC.0/effacement-extension, SchemeAndStackFoundations:SF.2, InverseGaloisAndArithmeticFundamentalGroups:IG.0.

Source: Achinger 2017, Proposition 4.2(c), proof; finite-cover form assembled using Proposition 3.4(a–b) of the 2014 preprint.

The coefficient infrastructure request to SF.2 includes a finite abelian filtration by finite prime-field vector layers, constant finite-sum cohomology and common finite refinements after trivializing monodromy.

## NC.0 — prime-cover curve proof and separable descent

Generic curve geometry and Picard data come from SchemeAndStackFoundations:SF.3, integrating the existing AlgebraicCurves and JacobianChallenge dictionaries. Generic Kummer cohomology, degree-pullback and affine-transition continuity come from SF.2. Finite continuous π-sets and their connected covers come from IG.0. NC.0 owns the use of those maps to kill classes and prove the reserved K(π,1) predicate, not a second theory of curves or cohomology.

Let d_C denote the canonical degree coordinate on H²(C,μ_n). The imported identity d_D(f*α)=deg(f)·d_C(α) is the actual map, not a cardinality comparison. Coherent Serre vanishing is not affine étale torsion vanishing. A choice of roots of unity converts μ_n to constant coefficients noncanonically and must be pulled back consistently. The prime-degree torsor is obtained from degree-one cohomology, which agrees with fundamental-group characters for every connected scheme; using the K(π,1) theorem to obtain it would be circular.

A nonproper smooth separated finite-type curve over a field is affine. Thus the nonaffine positive-genus case is projective, and finite connected étale covers remain in the required alternatives. Unramified Riemann–Hurwitz and the Kummer map are distinct imported facts. The new route neither needs nor proves raw étale homotopy equivalence.

### A connected prime-degree étale cover

Declaration: TauCeti.EtaleKPiOne.exists_connected_primeDegree_cover. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/connected-prime-degree-cover.

For a connected smooth projective curve C of genus g≥1 over an algebraically closed characteristic-zero field k and a prime p, there exists a connected finite étale surjective k-morphism f:D→C of degree exactly p. The cover can be chosen to be a torsor under the constant additive group F_p; its translation action is induced by a nonzero continuous character of the full π₁ᵉᵗ(C,x).

Hypotheses:

- k is algebraically closed of characteristic zero; C is a connected smooth projective k-curve of genus g≥1.

- p is a prime number, so p is invertible in k. The fundamental group is the full profinite π₁ᵉᵗ(C,x).

Proof or construction:

1. Import the natural Kummer calculation H¹_et(C,μ_p)≅Pic⁰(C)[p] and the Jacobian p-torsion order p^(2g) from SF.2/SF.3. Choose a primitive pth root in k only to identify μ_p with the constant F_p sheaf. Since p≥2 and g≥1, this H¹ group has a nonzero class.

2. Import the degree-one canonical comparison for any connected scheme, H¹_et(C,F_p)≅Hom_cont(π,F_p) for trivial action, from SF.2/IG.0. This is not an invocation of the all-degree K(π,1) property. Let χ be the nonzero character corresponding to the chosen class.

3. The image of χ is a nonzero additive subgroup of F_p and therefore all of F_p, using the existing prime-order simple additive group of ZMod p. Under IG.0's finite continuous π-set classification, the translation action g·a=χ(g)+a is transitive and has p elements. Its associated finite étale cover D is connected of degree p and surjective.

4. Translation by F_p commutes with π and is simply transitive on every fibre, giving the indicated torsor. A zero character gives p disconnected copies of C and must not be used.

Acceptance:

- For p=2 and genus one the cover is connected of degree 2, not multiplication-by-2 on an elliptic curve, whose degree is 4.

- For g=0, Pic⁰[p] is zero and this argument produces no nonzero character; the trivial torsor is disconnected.

Prerequisites: SchemeAndStackFoundations:SF.2, SchemeAndStackFoundations:SF.3, InverseGaloisAndArithmeticFundamentalGroups:IG.0, mathlib:ZMod.instIsSimpleAddGroup, mathlib:ZMod.card.

Sources:

- schmidt-curve-1996, Proposition 15, proof, printed pp. 243–244. The proof needs finite étale covers of p-divisible degree; this node explicitly supplies a connected prime-degree cover instead of assuming that assertion.

- stacks-curve-effacement-continuation, 03RQ Lemma 59.69.1; 03RP Proposition 39.9.11(7). The degree-one Kummer and torsion calculations produce the nonzero character; their generic constructions remain supplier inputs.

### Prime-degree covers kill degree-two prime torsion

Declaration: TauCeti.EtaleKPiOne.primeDegree_cover_kills_H2. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/prime-cover-degree-two-killing.

Let f:D→C be a connected finite étale cover of degree p between connected smooth projective curves over an algebraically closed characteristic-zero field, with p prime. Then f*:H²_et(C,μ_p)→H²_et(D,μ_p) is the zero homomorphism. After choosing one primitive pth root on the common base field, the same holds for constant F_p coefficients. This conclusion does not require genus≥1 once the cover is given.

Hypotheses:

- Both curves are connected, smooth and projective over the same algebraically closed characteristic-zero field.

- f is finite étale surjective of degree p, p prime; the same coefficient identification is pulled back to D.

Proof or construction:

1. Import SF.2's canonical Kummer-degree isomorphisms d_C:H²(C,μ_p)≅Z/p and d_D, and their natural degree-pullback identity d_D(f*α)=deg(f)·d_C(α). These are the generic curve computations of Stacks 03RQ and 0AMB, not a second Picard or cohomology definition in NC.0.

2. Since deg(f)=p and p=0 in ZMod p, the right side vanishes for every α. Injectivity of d_D gives f*α=0. The map being zero, not merely its source and target having equal order, is the assertion.

3. Pull back the single chosen μ_p≅F_p coefficient isomorphism to D. Naturality conjugates the zero μ_p map into the constant-F_p zero map; no independent roots of unity or transfer divided by p are used.

Acceptance:

- With p=3, degree 3 acts as zero on Z/3; degree 2 acts invertibly and does not kill its generator.

- On an elliptic curve, multiplication-by-p has degree p² and also kills H²(μ_p), but it is not the exact degree-p witness of connected-prime-degree-cover.

Prerequisites: SchemeAndStackFoundations:SF.2, SchemeAndStackFoundations:SF.3, mathlib:ZMod.natCast_self.

Sources:

- stacks-curve-effacement-continuation, 0AMB Lemma 59.69.2, statement and Kummer-boundary proof. Apply the supplied canonical degree formula to a prime-degree finite étale cover; the nonzero H² group itself is not claimed to vanish.

- schmidt-curve-1996, Proposition 15, proof, printed pp. 243–244. The proof needs finite étale covers of p-divisible degree; this node explicitly supplies a connected prime-degree cover instead of assuming that assertion.

### Prime-power towers kill higher prime-power torsion

Declaration: TauCeti.EtaleKPiOne.exists_primePower_cover_kills_H2. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/prime-power-degree-two-killing.

For C a connected smooth projective curve of genus g≥1 over an algebraically closed characteristic-zero field k, a prime p and a≥0, there exists a connected finite étale surjective f:D→C of degree p^a, given by a tower of a connected degree-p covers, such that f*:H²_et(C,μ_(p^a))→H²_et(D,μ_(p^a)) is zero. For a=0 the identity cover and the zero coefficient μ_1 give the assertion. The composite cover need not be Galois over C.

Hypotheses:

- k is algebraically closed of characteristic zero; C is a connected smooth projective k-curve of genus g≥1.

- p is a prime number, so p is invertible in k. The fundamental group is the full profinite π₁ᵉᵗ(C,x).

- a is a natural number, including zero; no common witness for all a is claimed.

Proof or construction:

1. For a=0 choose C itself. For the induction step apply connected-prime-degree-cover to the current curve. SF.3's finite-étale Riemann–Hurwitz formula g(D)=1+p(g(C)−1) guarantees genus≥1, so the induction can be repeated.

2. Use the supplier's composition and degree-multiplicativity of finite étale covers. A tower of a degree-p covers is connected and its composite has degree p^a; connectedness of each chosen source is retained. Do not assert that successive Galois covers have a Galois composite.

3. Apply the generic Kummer-degree pullback formula from SF.2 with n=p^a≥1. Multiplication by p^a in Z/(p^a) is zero, so the map kills every class at once. A single degree-p cover only multiplies H²(μ_(p^a)) by p and does not suffice when a>1.

4. With a primitive p^a-th root chosen on k the same conclusion holds for constant Z/(p^a) coefficients. Higher coefficient dévissage of arbitrary monodromy is a different step, supplied by prime-field-effacement.

Acceptance:

- At p=3,a=2, the degree-3 map on Z/9 sends 1 to 3≠0; the degree-9 tower map sends every class to zero.

- At genus 2,p=3, one prime-degree step has genus 4 and the two-step source genus 10; at genus one all sources have genus one.

- a=0 corresponds to n=1, not n=0; the latter coefficient is not part of the finite Kummer calculation.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.0/connected-prime-degree-cover, AnabelianGeometryAndNonabelianChabauty:NC.0/prime-cover-degree-two-killing, SchemeAndStackFoundations:SF.2, SchemeAndStackFoundations:SF.3, mathlib:ZMod.natCast_self.

Sources:

- schmidt-curve-1996, Proposition 15, proof, printed pp. 243–244. The proof needs finite étale covers of p-divisible degree; this node explicitly supplies a connected prime-degree cover instead of assuming that assertion.

- stacks-curve-effacement-continuation, 0AMB Lemma 59.69.2; 03RQ Lemma 59.69.1. The degree formula and induction, with Riemann–Hurwitz imported, give the explicit prime-power killing witness.

### Geometric smooth-curve finite-cover effacement

Declaration: TauCeti.EtaleKPiOne.smooth_curve_algebraicallyClosed. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/geometric-smooth-curve.

For a connected smooth separated finite-type curve C over an algebraically closed characteristic-zero field, if C is affine or its smooth projective compactification has genus≥1, then Is(C,x;all finite coefficients) holds at every geometric point x. More explicitly, on every connected finite étale Y→C every class α∈H^q_et(Y,F_p), p prime and q≥2, dies on a finite étale surjective cover of Y. In the affine case and in degrees q≥3 the identity cover suffices.

Hypotheses:

- k algebraically closed, characteristic zero; C connected smooth separated finite-type of dimension one.

- C affine or its smooth projective compactification has positive genus; genus-zero projective C is excluded.

Proof or construction:

1. Use SF.3's dichotomy: a nonproper smooth separated curve is affine, so the positive-genus nonaffine case is projective. For every connected finite étale Y→C, the affine case stays affine. In the projective case Y is smooth projective and unramified Riemann–Hurwitz gives g(Y)=1+deg(Y/C)(g(C)−1)≥1.

2. Import constant-coefficient curve cohomology from SF.2: for affine Y, H^q(Y,F_p)=0 for q≥2 (Stacks 03RR); for projective Y, H^q(Y,F_p)=0 for q≥3 and H²(Y,μ_p)≅Z/p (03RQ). Use one root-of-unity identification for the constant F_p statements.

3. Only q=2 on projective positive-genus Y remains. Obtain a connected degree-p cover Z→Y by connected-prime-degree-cover; prime-cover-degree-two-killing kills the specified class. No use of the desired K(π,1) theorem is hidden in obtaining this cover.

4. The quantifier covers every Y and every prime p, not just C and one p. Apply prime-field-effacement with P all primes to reach the canonical all-degree full finite-coefficient predicate. Basepoint-transport gives the statement at any geometric point. The raw pro-homotopy comparison is not a prerequisite.

Acceptance:

- G_m and P¹ minus {0,1,∞} use affine vanishing; a smooth projective elliptic curve uses actual covers despite nonzero H².

- A finite étale cover of a genus-2 curve of degree 3 has genus 4, so the prime-cover construction remains available after the first cover.

- P¹ is not accepted: every connected finite étale cover is an isomorphism and the nonzero degree-two generator survives.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.0/prime-field-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/connected-prime-degree-cover, AnabelianGeometryAndNonabelianChabauty:NC.0/prime-cover-degree-two-killing, AnabelianGeometryAndNonabelianChabauty:NC.0/basepoint-transport, SchemeAndStackFoundations:SF.2, SchemeAndStackFoundations:SF.3, InverseGaloisAndArithmeticFundamentalGroups:IG.0.

Sources:

- schmidt-curve-1996, Proposition 15, proof, printed pp. 243–244. The proof needs finite étale covers of p-divisible degree; this node explicitly supplies a connected prime-degree cover instead of assuming that assertion.

- stacks-curve-effacement-continuation, 03RQ and 03RR, complete Kummer proofs. Generic projective/affine computations are imported; NC.0 assembles them into the criterion on all finite covers.

### A geometric killing cover descends to a finite extension

Declaration: TauCeti.EtaleKPiOne.descend_separable_killing_cover. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/separable-killing-descent.

Let k have characteristic zero with fixed separable closure k_s, X a separated finite-type k-scheme, F a finite locally constant abelian étale sheaf, q>0 and α∈H^q_et(X,F). If a finite étale surjective cover h_s:Z_s→X_(k_s) kills α_(k_s), then there exist a finite separable k⊆k′⊆k_s and a finite étale surjective h′:Z′→X_(k′), whose base change is h_s up to X_(k_s)-isomorphism after a possible further finite extension, such that h′*α_(k′)=0. Thus the composite Z′→X is finite étale surjective and kills α. Neither Z_s nor Z′ is required to be connected.

Hypotheses:

- X separated of finite type over a characteristic-zero field; in particular X is quasi-compact and quasi-separated.

- F finite locally constant and α a fixed positive-degree class; a genuine finite étale surjective killing cover over k_s is given.

Proof or construction:

1. Write k_s as the filtered union of its finite separable k-subextensions. Import the SF.2 finite-presentation descent interface: the finite étale cover Z_s and its morphism descend to some X_(k₀). Finite étale and surjectivity persist or descend after enlarging k₀; do not assume that descending equations alone proves these properties.

2. The descended Z₀ is quasi-compact and quasi-separated. Apply SF.2's canonical continuity isomorphism colim_(k′/k₀ finite) H^q_et(Z₀×_(k₀)k′,h₀*F_(k′))≅H^q_et(Z_s,h_s*F_(k_s)), natural in pullback. The image of h₀*α_(k₀) is zero.

3. A representative mapping to zero in a filtered colimit of abelian groups becomes zero at some later finite stage. Enlarge to that k′ and base change Z₀. This second enlargement is necessary: descent of h_s alone does not make h₀*α vanish.

4. Since Spec k′→Spec k is finite étale surjective, X_(k′)→X and the composite Z′→X are finite étale surjective. Pullback composition proves that the composite kills α. No injectivity of restriction to k_s, proper base change or arbitrary field-extension invariance is used.

Acceptance:

- For the zero class the identity cover suffices; no field extension is forced.

- A class that vanishes over k_s need not vanish over k. The conclusion supplies a finite extension/cover that kills it, not injectivity of the original restriction map.

- The killing field may depend on F,q,α and the chosen cover; a single field killing all classes is not asserted.

Prerequisites: SchemeAndStackFoundations:SF.2, InverseGaloisAndArithmeticFundamentalGroups:IG.0.

Sources:

- achinger-effacement-2014-v1, Proposition 3.4(c), finite-separable and separable-closure proof paragraph, p. 8. Spell out the separate cover-descent and zero-class descent steps used in the finite-cover criterion.

- stacks-separable-continuity-continuation, 09YQ Theorem 59.51.3; 03RV Lemma 59.64.4; 07RR Lemma 32.8.15. The canonical cohomology colimit and finite-cover/sheaf descent are supplier inputs; this node assembles the class-killing consequence.

### Separable-closure invariance of finite-coefficient K(π,1)

Declaration: TauCeti.EtaleKPiOne.separableClosure_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.0/separable-base-change.

For a geometrically connected separated finite-type scheme X over a characteristic-zero field k, with separable closure k_s and a geometric point x over k_s, Is(X,x;all finite coefficients) holds iff Is(X_(k_s),x;all finite coefficients) holds. Both sides use their own full profinite fundamental groups and their canonical ε maps; their étale cohomology groups are not asserted to be equal.

Hypotheses:

- X geometrically connected, separated and finite type over a characteristic-zero field; chosen separable closure and geometric point.

- The coefficient class is all finite locally constant abelian coefficients, not an arbitrary unstable class.

Proof or construction:

1. For descent, take F,q>0,α on X. If the geometric property holds, all-coefficient-effacement supplies a finite étale cover of X_(k_s) killing α_(k_s). Apply separable-killing-descent and then all-coefficient-effacement on X.

2. For ascent, let F_s,q>0,β_s be geometric coefficient/class data. SF.2's finite coefficient descent, including its addition/zero/inverse maps, gives F₀ on X_(k₀) for a finite separable k₀/k. Its canonical cohomology continuity supplies a class β₁ at a possibly larger finite k₁ representing β_s.

3. X_(k₁) is connected by geometric connectedness; finite-etale-invariance transfers the property of X to X_(k₁). Apply all-coefficient-effacement to β₁, then base change its finite étale surjective killing cover to k_s. Naturality kills β_s.

4. Apply the all-coefficient criterion on X_(k_s) and preserve its canonical comparison. The proof never replaces π by its geometric subgroup or pro-p quotient; nor does it identify H^q(X,F) with H^q(X_(k_s),F_s).

Acceptance:

- For Spec k the equivalence agrees with the field test, though positive-degree Galois cohomology over k need not agree with the zero positive-degree étale cohomology of Spec k_s.

- The separable closure need not be finite; replacing its projection by a finite étale morphism is false.

- An open curve is allowed: the argument uses affine-transition continuity and finite-presentation descent, not properness.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.0/all-coefficient-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/finite-etale-invariance, AnabelianGeometryAndNonabelianChabauty:NC.0/separable-killing-descent, SchemeAndStackFoundations:SF.2, InverseGaloisAndArithmeticFundamentalGroups:IG.0.

Sources:

- achinger-effacement-2014-v1, Proposition 3.4(c), separable-closure case, p. 8. Precisely the algebraic separable-extension case; arbitrary extensions and purely inseparable steps are not exported by this node.

### Additional tests of the reserved definition

- TauCeti.EtaleKPiOne.tests.prime_degree_cover (computation): For a smooth projective genus-one curve over algebraically closed characteristic-zero k and prime p=3, a nonzero character π₁→F₃ gives a connected degree-3 étale cover; the zero character gives three disconnected copies. Multiplication-by-3 on an elliptic curve has degree 9, not 3.

- TauCeti.EtaleKPiOne.tests.prime_to_degree_does_not_kill (non-example): For a smooth projective elliptic curve over algebraically closed characteristic-zero k, multiplication-by-2 has degree 4 and induces multiplication by 4=1 on H²_et(E,μ₃)≅Z/3. Thus this finite étale cover does not kill a nonzero degree-two class.

- TauCeti.EtaleKPiOne.tests.prime_power_tower (computation): For genus≥1, p=3,a=2, a degree-3 étale cover multiplies H²(μ₉) by 3 and does not kill the generator; a tower of two connected degree-3 covers has degree 9 and kills all H²(μ₉) classes.

- TauCeti.EtaleKPiOne.tests.tower_exponent_zero (degenerate): At a=0 the prime-power tower is the identity, coefficient μ₁ is zero and H²(C,μ₁)=0. This boundary is not the infinite coefficient n=0.

- TauCeti.EtaleKPiOne.tests.genus_after_prime_cover (compatibility): For a connected étale degree-3 cover of a smooth projective genus-2 curve over an algebraically closed characteristic-zero field, unramified Riemann–Hurwitz gives genus 4; a second degree-3 step gives genus 10. For genus one every such step retains genus one.

- TauCeti.EtaleKPiOne.tests.arithmetic_restriction_not_injective (non-example): For k=R, k_s=C and X=Spec R with constant Z/2 coefficients, H²_et(X,Z/2)≅Z/2 but H²_et(Spec C,Z/2)=0. Both spectra have the full K(π,1) property. Separable-closure invariance is not injectivity of cohomology restriction; the finite cover Spec C→Spec R kills the nonzero class.

For the arithmetic restriction test, write Gal(C/R)=C₂={0,1} additively with trivial F₂ action. The normalized cocycle c(g,h)=gh has c(1,1)=1. Its cocycle identity follows by expanding over F₂. A normalized one-cochain has coboundary zero at (1,1), so this cocycle is not a coboundary. This gives the nonzero H²(C₂,F₂) class through the imported field dictionary; restriction to the trivial group kills it. It is not evidence that geometric restriction is injective.

### Exact curve and limit supplier contracts

Supplier: SchemeAndStackFoundations:SF.2.

Canonical smooth-projective curve Kummer H¹(μ_n)≅Pic⁰[n], H²(μ_n)≅Z/n via degree and vanishing in q≥3 (Stacks 03RQ), together with the actual pullback identity d_D(f*α)=deg(f)d_C(α) for nonconstant finite maps (0AMB), proved by Kummer-boundary naturality and SF.3's line-bundle degree formula. For smooth affine curves, H^q(μ_n)=0 for q≥2 (03RR), distinct from coherent Serre vanishing. Retain n≥1 invertible and a single chosen root-of-unity identification for constant coefficients. Supply the canonical degree-one H¹_et(C,F_p)=Hom_cont(π,F_p) for every connected curve without assuming K(π,1). Import Picard/Jacobian objects from SF.3, never duplicate them or the NC.0 K(π,1) assemblies.

Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/connected-prime-degree-cover, AnabelianGeometryAndNonabelianChabauty:NC.0/prime-cover-degree-two-killing, AnabelianGeometryAndNonabelianChabauty:NC.0/prime-power-degree-two-killing, AnabelianGeometryAndNonabelianChabauty:NC.0/geometric-smooth-curve.

Supplier: SchemeAndStackFoundations:SF.2.

For X separated finite type over k and an algebraic separable closure k_s=colim k_i, export finite-presentation descent of finite étale covers, morphisms and surjectivity; finite locally constant abelian sheaves descend with their group operations (03RV plus finite-étale morphism descent). Supply natural canonical colim_i H^q_et(X_(k_i),F_i)≅H^q_et(X_(k_s),F_s) for every degree, and the same formula on the descended killing cover (09YQ/59.51.3 or 59.51.5, with qcqs schemes and affine transition maps). Descent of a class representative and eventual vanishing of a representative mapping to zero are separate consequences. Generic 32.10.1/32.8 finite-presentation/property descent and 21.16.6 inverse-site cohomology proof leaves are not read to closure here. No injectivity of restriction, properness, arbitrary field-extension invariance or NC.0 theorem may be inserted as a supplier assumption.

Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/separable-killing-descent, AnabelianGeometryAndNonabelianChabauty:NC.0/separable-base-change.

The suggested file keeps every geometric name as an explicit mathematical omission contract while genuine π/coefficient/ε, curve Kummer-degree and continuity interfaces are absent. Its twelve arithmetic examples only exercise the existing ZMod library. They do not elaborate any of the geometric definitions, tests or statements. No stage is closed.

### Additional pinned native arithmetic baseline

- mathlib:ZMod.instIsSimpleAddGroup — The existing simple additive group of prime-order ZMod p, used to show a nonzero character onto F_p is surjective. Statement read at the exact pin in Mathlib/GroupTheory/SpecificGroups/Cyclic.lean.

- mathlib:ZMod.card — Fintype.card (ZMod n)=n with a Fintype instance; identifies the prime-degree fibre cardinal. Statement read at the exact pin in Mathlib/Data/ZMod/Defs.lean.

- mathlib:ZMod.natCast_self — (n:ZMod n)=0; the degree-n multiplication in the canonical H² coordinate vanishes. Statement read at the exact pin in Mathlib/Data/ZMod/Basic.lean.

- mathlib:ZMod.addOrderOf_one — addOrderOf (1:ZMod n)=n, including n=0; no new cyclic-coefficient group is introduced. Statement read at the exact pin in Mathlib/Data/ZMod/Basic.lean.

- mathlib:ZMod.unitOfCoprime — For Nat.Coprime d n the native unit in ZMod n whose value is d; provides the inverse of prime-to-coefficient degree multiplication. Statement read at the exact pin in Mathlib/Data/ZMod/Basic.lean.

- mathlib:ZMod.coe_unitOfCoprime — The value of ZMod.unitOfCoprime d h is (d:ZMod n), hence multiplication by d is bijective when d,n are coprime. Statement read at the exact pin in Mathlib/Data/ZMod/Basic.lean.

- mathlib:Nat.card_zmod — Nat.card (ZMod n)=n; for n=0 the cardinal-to-natural convention gives zero and is not finiteness. Statement read at the exact pin in Mathlib/SetTheory/Cardinal/Finite.lean.

### Degree-one supplier refinement for finite-family killing

SchemeAndStackFoundations:SF.2: Natural étale cohomology long exact sequences of short exact finite locally constant abelian coefficients, exact pullback along finite étale maps, naturality in coefficient maps and composition of pullbacks. The extension effacement assembly kills the quotient class on a first cover, lifts after that cover and kills the subobject lift on a second cover; do not assume the coefficient sequence splits. Also supply the generic finite abelian coefficient filtration by finite F_p-vector layers, constant finite-sum cohomology and finite common refinements of class-killing covers, after monodromy trivialization; NC.0 imports this coefficient infrastructure. The degree-one finite étale F_p torsor pullback has its diagonal section; choosing its pointed connected component still trivializes the class. This is an explicit leaf of the existing all-positive-degree effacement criterion, needed by finite-family product killing. Consumers: AnabelianGeometryAndNonabelianChabauty:NC.0/effacement-extension, AnabelianGeometryAndNonabelianChabauty:NC.0/prime-field-effacement, AnabelianGeometryAndNonabelianChabauty:NC.0/positive-family-effacement.

## Product proof boundaries and the native regressions

The canonical rectangle is U=i_G⁻¹K and V=i_H⁻¹K. Its maximality follows directly from the native subgroup product criterion and map/comap connection. Open comaps provide the topology, and compactness makes coset sets finite. These are baseline specializations, not new roadmap objects. The four regression contracts test domination rather than an isomorphic product, nonnormal stabilizers, a surviving mixed degree-one term, and the zero canonical map over Z/4. The other native examples test only subgroup signatures, bilinearity, positive total degree and the arithmetic fibre-product cardinality. They do not represent a geometric cover or étale cohomology.

SF.2's exact derived-to-prime-field export includes the generic complexes-over-a-field bridge and pullback naturality of the actual external product. Its proof leaves, and the resolution boundary of SGA 1 XIII 4.6, remain open supplier work. No additional universal-cover cohomology interchange is needed for this finitary assembly; the existing separable-base-change node still needs continuity and eventual finite-stage vanishing. The predecessor handoff's two version-qualified apparent SGA formula slips require their own version/history verification before integration into sourceIssues; this checkpoint makes no new source-error finding.

The product-only Mathlib fragment contains eleven admitted examples and has been elaborated with zero errors and no other warnings. The complete suggested file has not been compiled at both pins; the four finite product regressions remain algebraic tests, and the three geometric assembly signatures remain explicitly omitted.


## NC.3 — discrete cocycle descent preliminaries

Codex codex-J6LwjP; Refs #1020. The current packet has62 declarations:3 definitions,5 constructions,24 lemmas,24 theorems,6 comparisons;56 API entries(44 required definition/construction APIs),50 test entries(41 required definition/construction tests),11 planets,79 baseline declarations,9 gap groups and16 requests. All51 inherited mathematical statements and50 complete node objects are preserved. The continuous-cocycles acceptance sentence now retains the invariant target U^N and the quotient-action boundary. All implementation statuses remain unchecked; NC.0/NC.3 stay partial and the other five stages stay not_read. The reserved étale K(π,1) definition, every coefficient class, source route, request and planet remain unchanged.

These declarations refine the previous handoff's discrete degree-one descent proof. The original general topological coefficient groups, including Kim's unipotent groups, remain general. Only the clopen and compact normal-open killing conclusions impose discreteness. No degree-one geometric torsor dictionary is constructed here, and no dependency from NC.3 back to NC.0 is added.

### Identity value of a nonabelian cocycle

Node: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-map-one. Declaration: TauCeti.NonabelianCohomology.Z1.map_one. Kind: lemma.

For every continuous nonabelian cocycle c, c(1)=1. This promotes the already owned continuous-cocycles API without changing its convention.

Hypotheses: G is a topological group; U is a group with topology and a G-action by group automorphisms. c is the existing continuous nonabelian cocycle with c(gh)=c(g)(g•c(h)). U need not be abelian or finite. Only the clopen and normal-open killing assertions assume discrete coefficients; compactness is used only for the normal-open choice/finite quotient. Normality of N is explicitly required for left-coset and invariant-value conclusions. General unipotent coefficient topologies are not replaced by discrete ones.

Proof outline:

1. Use c(1)=c(1)c(1) from the cocycle identity at(1,1) and cancel the left factor.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles.

Source: [Poonen §1.3.5](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Definition1.3.14 and opening proof of Proposition1.3.15, printedp.11. The specific compact/discrete argument is an authored deduction from the fixed cocycle convention and native group/topology facts, rather than a numbered theorem printed there.

### Inverse value of a nonabelian cocycle

Node: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-map-inverse. Declaration: TauCeti.NonabelianCohomology.Z1.map_inv. Kind: lemma.

For every c and g, c(g⁻¹)=g⁻¹•c(g)⁻¹.

Hypotheses: G is a topological group; U is a group with topology and a G-action by group automorphisms. c is the existing continuous nonabelian cocycle with c(gh)=c(g)(g•c(h)). U need not be abelian or finite. Only the clopen and normal-open killing assertions assume discrete coefficients; compactness is used only for the normal-open choice/finite quotient. Normality of N is explicitly required for left-coset and invariant-value conclusions. General unipotent coefficient topologies are not replaced by discrete ones.

Proof outline:

1. Evaluate the cocycle identity at(g⁻¹,g). Since c(1)=1, c(g⁻¹) is the inverse of g⁻¹•c(g). The native automorphism action preserves inverses.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles, AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-map-one.

Source: [Poonen §1.3.5](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Definition1.3.14 and opening proof of Proposition1.3.15, printedp.11. The specific compact/discrete argument is an authored deduction from the fixed cocycle convention and native group/topology facts, rather than a numbered theorem printed there.

### One-fibre subgroup of a nonabelian cocycle

Node: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-one-fibre. Declaration: TauCeti.NonabelianCohomology.Z1.oneFibre. Kind: construction.

Construct K_c={g∈G:c(g)=1} as a native Subgroup G. This is a cocycle-specific subgroup on the existing carrier; it is not a kernel of a homomorphism unless a native homomorphism has been identified. No normality is part of the construction.

Hypotheses: G is a topological group; U is a group with topology and a G-action by group automorphisms. c is the existing continuous nonabelian cocycle with c(gh)=c(g)(g•c(h)). U need not be abelian or finite. Only the clopen and normal-open killing assertions assume discrete coefficients; compactness is used only for the normal-open choice/finite quotient. Normality of N is explicitly required for left-coset and invariant-value conclusions. General unipotent coefficient topologies are not replaced by discrete ones.

Proof outline:

1. The identity belongs by the promoted identity-value lemma.
2. If c(g)=c(h)=1, the actual cocycle law gives c(gh)=1. If c(g)=1, the promoted inverse-value formula gives c(g⁻¹)=1. Package these laws in the native subgroup.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles, AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-map-one, AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-map-inverse, mathlib:Subgroup, mathlib:ConjAct, mathlib:ConjAct.toConjAct, mathlib:ConjAct.toConjAct_smul.

Consumer API:

- TauCeti.NonabelianCohomology.Z1.mem_oneFibre (characterisation): g∈K_c iff c(g)=1.
- TauCeti.NonabelianCohomology.Z1.oneFibre_eq_ker (compatibility): If an actual native homomorphism f:G→U has c(g)=f(g) for all g, K_c=f.ker.
- TauCeti.NonabelianCohomology.Z1.oneFibre_eq_top (characterisation): If c is identically1, its one-fibre is all G.
- TauCeti.NonabelianCohomology.Z1.oneFibre_isClopen (compatibility): With discrete U, the actual subgroup carrier is clopen in G.

Uses: AnabelianGeometryAndNonabelianChabauty:NC.3/discrete-normal-killing: The actual one-fibre subgroup gives the clopen neighbourhood on which the continuous discrete cocycle is identically1. AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-values-invariants: For a chosen normal N inside the one-fibre, values lie in the imported native N-fixed coefficient subgroup. The one-fibre itself need not be normal.

Typed acceptance tests:

- TauCeti.NonabelianCohomology.Z1.oneFibre.test_trivial (degenerate): The actual trivial cocycle has one-fibre⊤.
- TauCeti.NonabelianCohomology.Z1.oneFibre.test_native_kernel (compatibility): Under a trivial action, the actual continuous homomorphism cocycle has one-fibre its native kernel, using the given continuous f.
- TauCeti.NonabelianCohomology.Z1.oneFibre.test_nonnormal (non-example): For S₃ acting on itself by the native ConjAct conjugation action and τ=(01), the cocycle c(g)=τ(g•τ)⁻¹ has one-fibre containingτ but missing its conjugate by(12). Hence its native subgroup is not normal. The actual two permutation values are computed in Lean.

Source: [Poonen §1.3.5](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Definition1.3.14 and opening proof of Proposition1.3.15, printedp.11. The specific compact/discrete argument is an authored deduction from the fixed cocycle convention and native group/topology facts, rather than a numbered theorem printed there.

### Discrete cocycle one-fibres are clopen

Node: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-one-fibre-clopen. Declaration: TauCeti.NonabelianCohomology.Z1.oneFibre_isClopen. Kind: lemma.

If U has the discrete topology, the actual one-fibre K_c is clopen in G; compactness and finiteness of U are not needed.

Hypotheses: G is a topological group; U is a group with topology and a G-action by group automorphisms. c is the existing continuous nonabelian cocycle with c(gh)=c(g)(g•c(h)). U need not be abelian or finite. Only the clopen and normal-open killing assertions assume discrete coefficients; compactness is used only for the normal-open choice/finite quotient. Normality of N is explicitly required for left-coset and invariant-value conclusions. General unipotent coefficient topologies are not replaced by discrete ones.

Proof outline:

1. The singleton{1} is clopen in discrete U. Pull it back through the actual continuous cocycle map; the preimage is the exact native subgroup carrier.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-one-fibre, mathlib:isClopen_discrete, mathlib:IsClopen.preimage.

Source: [Poonen §1.3.5](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Definition1.3.14 and opening proof of Proposition1.3.15, printedp.11. The specific compact/discrete argument is an authored deduction from the fixed cocycle convention and native group/topology facts, rather than a numbered theorem printed there.

### An open normal subgroup kills a discrete cocycle

Node: AnabelianGeometryAndNonabelianChabauty:NC.3/discrete-normal-killing. Declaration: TauCeti.NonabelianCohomology.Z1.exists_openNormal_killing. Kind: theorem.

If G is compact and U is discrete, there exists a native OpenNormalSubgroup N of G on which c is identically1. Its quotient G/N is finite by the imported native open-subgroup theorem. Neither total disconnectedness of G nor finiteness of U is required.

Hypotheses: G is a topological group; U is a group with topology and a G-action by group automorphisms. c is the existing continuous nonabelian cocycle with c(gh)=c(g)(g•c(h)). U need not be abelian or finite. Only the clopen and normal-open killing assertions assume discrete coefficients; compactness is used only for the normal-open choice/finite quotient. Normality of N is explicitly required for left-coset and invariant-value conclusions. General unipotent coefficient topologies are not replaced by discrete ones.

Proof outline:

1. Apply the existing compact-group clopen-neighbourhood theorem to K_c and its identity member. It returns an open normal subgroup contained in K_c.
2. Membership in K_c is precisely c(n)=1. The existing native compact/open quotient theorem makes G/N finite. No normality of K_c is inferred.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-one-fibre-clopen, AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-map-one, mathlib:IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one, mathlib:Subgroup.quotient_finite_of_isOpen.

Typed acceptance tests:

- TauCeti.NonabelianCohomology.Z1.exists_openNormal_killing.test_finite_quotient (compatibility): For every native open normal subgroup N of compact G, the actual quotient G/N is finite by the existing native theorem; no coefficient cardinality hypothesis is inserted.

Source: [Poonen §1.3.5](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Definition1.3.14 and opening proof of Proposition1.3.15, printedp.11. The specific compact/discrete argument is an authored deduction from the fixed cocycle convention and native group/topology facts, rather than a numbered theorem printed there.

### Trivial restriction gives right-coset constancy

Node: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-right-cosets. Declaration: TauCeti.NonabelianCohomology.Z1.mul_right_eq_of_trivial. Kind: lemma.

For any subgroup N on which c is identically1, c(gn)=c(g) for all n∈N. Normality, compactness and discrete U are not needed.

Hypotheses: G is a topological group; U is a group with topology and a G-action by group automorphisms. c is the existing continuous nonabelian cocycle with c(gh)=c(g)(g•c(h)). U need not be abelian or finite. Only the clopen and normal-open killing assertions assume discrete coefficients; compactness is used only for the normal-open choice/finite quotient. Normality of N is explicitly required for left-coset and invariant-value conclusions. General unipotent coefficient topologies are not replaced by discrete ones.

Proof outline:

1. Use c(gn)=c(g)(g•c(n)) and c(n)=1. This is the right-coset relation, not a homomorphism property.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles.

Source: [Poonen §1.3.5](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Definition1.3.14 and opening proof of Proposition1.3.15, printedp.11. The specific compact/discrete argument is an authored deduction from the fixed cocycle convention and native group/topology facts, rather than a numbered theorem printed there.

### Normality gives left-coset constancy

Node: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-left-cosets. Declaration: TauCeti.NonabelianCohomology.Z1.mul_left_eq_of_trivial. Kind: lemma.

If N is normal and c|N=1, then c(ng)=c(g) for all n∈N.

Hypotheses: G is a topological group; U is a group with topology and a G-action by group automorphisms. c is the existing continuous nonabelian cocycle with c(gh)=c(g)(g•c(h)). U need not be abelian or finite. Only the clopen and normal-open killing assertions assume discrete coefficients; compactness is used only for the normal-open choice/finite quotient. Normality of N is explicitly required for left-coset and invariant-value conclusions. General unipotent coefficient topologies are not replaced by discrete ones.

Proof outline:

1. Normality places g⁻¹ng in N. Rewrite ng=g(g⁻¹ng) and apply right-coset constancy.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-right-cosets, mathlib:Subgroup.Normal.conj_mem'.

Source: [Poonen §1.3.5](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Definition1.3.14 and opening proof of Proposition1.3.15, printedp.11. The specific compact/discrete argument is an authored deduction from the fixed cocycle convention and native group/topology facts, rather than a numbered theorem printed there.

### Trivial normal restriction fixes each value

Node: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-values-fixed. Declaration: TauCeti.NonabelianCohomology.Z1.values_fixed_of_trivial. Kind: lemma.

If N is normal and c|N=1, then n•c(g)=c(g) for all g∈G and n∈N. This fixes the coefficient target for quotient descent; it does not say N acts trivially on all U.

Hypotheses: G is a topological group; U is a group with topology and a G-action by group automorphisms. c is the existing continuous nonabelian cocycle with c(gh)=c(g)(g•c(h)). U need not be abelian or finite. Only the clopen and normal-open killing assertions assume discrete coefficients; compactness is used only for the normal-open choice/finite quotient. Normality of N is explicitly required for left-coset and invariant-value conclusions. General unipotent coefficient topologies are not replaced by discrete ones.

Proof outline:

1. The cocycle identity gives c(ng)=n•c(g). Normal left-coset constancy gives c(ng)=c(g). Compare them.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-left-cosets, AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles.

Source: [Poonen §1.3.5](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Definition1.3.14 and opening proof of Proposition1.3.15, printedp.11. The specific compact/discrete argument is an authored deduction from the fixed cocycle convention and native group/topology facts, rather than a numbered theorem printed there.

### Values lie in the native invariant coefficient subgroup

Node: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-values-invariants. Declaration: TauCeti.NonabelianCohomology.Z1.values_mem_fixedPoints. Kind: lemma.

If N is normal and c|N=1, every c(g) belongs to the existing native FixedPoints.subgroup N U under the restricted subgroup action. This is U^N, which can be a proper subgroup and can be infinite.

Hypotheses: G is a topological group; U is a group with topology and a G-action by group automorphisms. c is the existing continuous nonabelian cocycle with c(gh)=c(g)(g•c(h)). U need not be abelian or finite. Only the clopen and normal-open killing assertions assume discrete coefficients; compactness is used only for the normal-open choice/finite quotient. Normality of N is explicitly required for left-coset and invariant-value conclusions. General unipotent coefficient topologies are not replaced by discrete ones.

Proof outline:

1. Use the imported fixed-subgroup membership criterion; for each actual n:N, the preceding pointwise invariance theorem gives its scalar action fixing c(g). No parallel fixed-point carrier is introduced.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-values-fixed, mathlib:FixedPoints.subgroup, mathlib:FixedPoints.mem_subgroup.

Typed acceptance tests:

- TauCeti.NonabelianCohomology.Z1.values_mem_fixedPoints.test_top_trivial (degenerate): The trivial cocycle at any g is1 and belongs to the actual U^G even when U^G is proper; the target is not all of U.

Source: [Poonen §1.3.5](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Definition1.3.14 and opening proof of Proposition1.3.15, printedp.11. The specific compact/discrete argument is an authored deduction from the fixed cocycle convention and native group/topology facts, rather than a numbered theorem printed there.

### A same-stage gauge witness is already invariant

Node: AnabelianGeometryAndNonabelianChabauty:NC.3/gauge-witness-fixed. Declaration: TauCeti.NonabelianCohomology.Z1.gauge_witness_fixed. Kind: lemma.

Let c,d be continuous cocycles both identically1 on N. If d(g)=x c(g)(g•x)⁻¹ for a fixed x∈U and every g, then n•x=x for every n∈N. No refinement of N is needed, and no normality, discreteness or compactness is required for this pointwise assertion. This is the witness lemma for same-stage H¹ inflation injectivity; it does not by itself construct inflation or prove quotient pointed-set injectivity.

Hypotheses: G is a topological group; U is a group with topology and a G-action by group automorphisms. c is the existing continuous nonabelian cocycle with c(gh)=c(g)(g•c(h)). U need not be abelian or finite. Only the clopen and normal-open killing assertions assume discrete coefficients; compactness is used only for the normal-open choice/finite quotient. Normality of N is explicitly required for left-coset and invariant-value conclusions. General unipotent coefficient topologies are not replaced by discrete ones.

Proof outline:

1. Evaluate the gauge equation at n∈N. It becomes1=x(n•x)⁻¹. Native group cancellation forces n•x=x. The inverse/gauge factor order is retained.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles.

Typed acceptance tests:

- TauCeti.NonabelianCohomology.Z1.gauge_witness_fixed.test_full_subgroup (compatibility): If1=x(g•x)⁻¹ for every g, then x is an actual member of FixedPoints.subgroup G U, even for nonabelian U.

Source: [Poonen §1.3.5](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Definition1.3.14 and opening proof of Proposition1.3.15, printedp.11. The specific compact/discrete argument is an authored deduction from the fixed cocycle convention and native group/topology facts, rather than a numbered theorem printed there.

### Simultaneous killing for finite discrete cocycle families

Node: AnabelianGeometryAndNonabelianChabauty:NC.3/finite-family-normal-killing. Declaration: TauCeti.NonabelianCohomology.Z1.exists_openNormal_killing_family. Kind: theorem.

Let G be compact. For a finite index type I, discrete groups U_i with automorphism actions and continuous cocycles c_i∈Z¹(G,U_i), there is one native open normal N with c_i(n)=1 for all i and n∈N. Groups and actions may vary with i, and U_i need not be finite. The empty family is included. Infinite families and nondiscrete coefficients do not satisfy this conclusion in general.

Hypotheses: G is a topological group; U is a group with topology and a G-action by group automorphisms. c is the existing continuous nonabelian cocycle with c(gh)=c(g)(g•c(h)). U need not be abelian or finite. Only the clopen and normal-open killing assertions assume discrete coefficients; compactness is used only for the normal-open choice/finite quotient. Normality of N is explicitly required for left-coset and invariant-value conclusions. General unipotent coefficient topologies are not replaced by discrete ones.

Proof outline:

1. Intersect the finitely many actual clopen one-fibre carriers; native finite-intersection topology gives a clopen set containing1.
2. Apply the existing compact-group clopen-neighbourhood theorem once and read each coordinate membership from the actual intersection. No infinite intersection or uniform choice of subgroup for all cocycles is used.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-one-fibre-clopen, AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-map-one, mathlib:isClopen_iInter_of_finite, mathlib:IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one.

Typed acceptance tests:

- TauCeti.NonabelianCohomology.Z1.exists_openNormal_killing_family.test_empty (degenerate): For I=Fin0 the class-killing condition is vacuous and a native open normal subgroup exists.
- TauCeti.NonabelianCohomology.Z1.exists_openNormal_killing_family.test_single (computation): Specializing the actual varying-coefficient family theorem to Fin1 and one c gives its pointwise normal-open killing conclusion.

Source: [Poonen §1.3.5](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Definition1.3.14 and opening proof of Proposition1.3.15, printedp.11. The specific compact/discrete argument is an authored deduction from the fixed cocycle convention and native group/topology facts, rather than a numbered theorem printed there.

### Hypothesis boundaries and next descent steps

For G=∏ over n∈ℕ of C₂ and discrete U=C₂ with trivial action, the coordinate characters are continuous cocycles. Their common one-fibre is the identity subgroup: killing all coordinates forces every component to be1. That subgroup is not open, since every basic product neighborhood restricts only finitely many coordinates and contains a nonidentity element in an unrestricted coordinate. Thus the finite-family assertion does not extend to arbitrary infinite families. With the same product G, take U=G with its product topology, trivial coefficient action and c the identity homomorphism. It is continuous but its one-fibre is again nonopen{1}. This shows why the discrete hypothesis cannot be removed. These are mathematical boundary arguments, not typed Lean examples or general new cohomology carriers.

The right- and left-coset/invariant lemmas are the pointwise inputs of quotient descent. The native G/N action on U^N, actual quotient cocycle and its uniqueness remain to be constructed against existing quotient/action interfaces. The gauge-witness lemma only supplies the same-stage fixed witness; actual H¹ inflation, injectivity, image=neutral restriction fibre and reverse-inclusion transition/colimit identities remain open. The geometric finite-étale degree-one proof uses the existing IG.0/SF.2 torsor and component requests directly; similarity to this argument supplies no NC.3→NC.0 prerequisite. The predecessor handoff preserves its detailed D2–D5 and G1 proofs for integration.

### Native reuse and scoped verification

The reviewed NC.0–6 AUDIT08 rows were read before planning. NC.3 owns the missing nonabelian cocycle layer; native compact-group normal-open existence, subgroups, fixed groups and finite quotients are imported. The full current campaign README, original seven stages and seventeen touching edges were read. All29 accepted link entries mentioning the roadmap were read; they are qualified negative screens and add no new edge. A focused search of other packets found the nonabelian Weil-restriction/Shapiro application in ExcursionOperatorsAndSpectralAction--ES5; it does not supply these generic compact/discrete preliminaries. No whole-library absence assertion follows from this search.

The ten added baseline declarations and relevant ambient hypotheses were read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174. Earlier unrelated pinned-source and source-reading receipts retain their attribution.

| Native declaration | Exact contribution |
| --- | --- |
| mathlib:ConjAct | The existing type alias of a group equipped with its native action on that group by conjugation; used only in the S₃ boundary fixture. |
| mathlib:ConjAct.toConjAct | Native multiplicative equivalence from a group to its ConjAct alias. |
| mathlib:ConjAct.toConjAct_smul | The native conjugation action sends(g,h) to ghg⁻¹. |
| mathlib:Subgroup | The native subgroup carrier consists of a subset of an existing group closed under multiplication, identity and inversion; no new group carrier is constructed. |
| mathlib:IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one | For a compact topological group, every clopen set containing1 contains a native OpenNormalSubgroup; no total disconnectedness hypothesis. |
| mathlib:isClopen_discrete | Every subset of a discrete topological space is clopen. |
| mathlib:IsClopen.preimage | The preimage of a clopen set under a continuous map is clopen. |
| mathlib:isClopen_iInter_of_finite | The intersection of a family of clopen sets indexed by a finite type is clopen. |
| mathlib:Subgroup.Normal.conj_mem' | For normal H and n∈H, g⁻¹ng belongs to H. |
| mathlib:FixedPoints.mem_subgroup | Membership in the native automorphism-action fixed subgroup is equivalent to every scalar fixing the member. |

[Immutable actual proof source](https://github.com/CBirkbeck/tauceti-explorer/blob/7244a1e04a8dd65f6fabb2614cf1070cd1a99d4e/research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty.lean), commit 7244a1e04a8dd65f6fabb2614cf1070cd1a99d4e. The exact native proof and its8 typed examples compiled with0 errors/0 warnings, and all15 axiom prints show no admission dependency. The submitted20 new bodies are admitted under PROTOCOL§13, preserving their mathematical signatures. Its narrow native extraction elaborates with24 admission warnings and0 errors/other warnings; the broader Mathlib-only extraction excludes precisely the TauCeti import and named Abelian comparison section, and elaborates with112 admission warnings and0 errors/other warnings. The broad check repaired inherited topology/action binders, twisting target coercion, torsor scope/instance fields and a duplicate universe; their mathematical contracts are unchanged. **The full TauCeti-importing file was not compiled**: the required pinned LowDegree artifact is absent from the existing build. Geometry remains an explicit omission ledger. No library build, dependency update, cache or language server was used.

Fresh source verification is limited to parsed Poonen Definition1.3.14/opening Proposition1.3.15 on printedp.11 and [Stacks0A2H](https://stacks.math.columbia.edu/tag/0A2H), its discrete/continuous coefficient conventions in Definitions59.57.1–2 and the stabilizer paragraph. The Poonen PDF hash agrees with the inherited author-hosted version. Screenshot tools returned no viewable PDF image; no fresh visual inspection or full-source collation is claimed. The earlier Kim and other source readings remain attributed. The previous45-action finite regression was not rerun; the new eight examples are exact Lean checks. Source/extraction hashes, resource receipts and the public reproduction recipe are in the current handoff.

Final read-only atlas check:3,018 stage/planet vertices(including51 existing virtual endpoints),8,655 stage edges;62 packet nodes,119 internal prerequisite edges;3,069 combined vertices,8,809 stage/planet-plus-reachable-prerequisite edges. All graphs acyclic;0 unresolved/pending/skipped own edges; all38 touching stage edges and unrelated skipped/deferred links unchanged. Indexed checker0 errors/0 warnings, four-file intake0 problems, whitespace and preservation/signature/reader checks pass.


## Current continuation — actual quotient cocycle descent

Codex — codex-a71f92, 2October2026, issue #1020. This section extends, rather than replaces, the historical 62-node checkpoint above. All its statements, complete node objects, source inventories, reserved keys, supplier requests and planets are preserved.

The quotient action on the native fixed subgroup U^N already exists in Mathlib.GroupTheory.GroupAction.OfQuotient. It is not a new definition to plan. Using it, a continuous cocycle trivial on any normal N descends continuously to the actual quotient topology, with values in that actual subgroup. Continuity follows from the native quotient-map criterion, not a chosen continuous section. The factor order is the inherited nonabelian order throughout. These cocycle-level arguments do not require compactness, openness/closedness of N, discrete/finite U or joint continuity of the action; such assumptions remain separate in the general H¹ and compact finite-quotient arguments.

### Descent of a cocycle to the native quotient

AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-descent

Declaration: TauCeti.NonabelianCohomology.Z1.descend.

For a normal subgroup N of G and a continuous nonabelian cocycle c with c(n)=1 for every n∈N, construct the actual continuous cocycle d:G/N→U^N with d([g])=c(g). Here U^N is Mathlib FixedPoints.subgroup N U with its existing quotient automorphism action and subspace topology; G/N has the existing quotient topology. Neither compactness, openness of N, discreteness nor finiteness of U is required.

Hypotheses: G and U are groups endowed with topologies; G acts on U by group automorphisms. c is the actual existing Z¹ cocycle, continuous with ordered law c(gh)=c(g)(g•c(h)); no invented cocycle or cohomology carrier is used. N is an arbitrary normal subgroup. Descent requires c(n)=1 for every n∈N. Compactness, closedness/openness of N, finiteness/discreteness of U, and continuity of the action or group operations are not needed for these cocycle-level maps. All generic H¹/topological-action and colimit assertions stay separate.

Dependencies: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles; AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-right-cosets; AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-values-invariants; mathlib:MulAction.coe_quotient_smul_fixedPoints; mathlib:coe_smul_fixedPoints_of_normal; mathlib:QuotientGroup.leftRel_apply; mathlib:QuotientGroup.isQuotientMap_mk; mathlib:Topology.IsQuotientMap.continuous_iff; mathlib:QuotientGroup.induction_on; mathlib:QuotientGroup.mk_mul.

Proof: The existing quotient action on the existing fixed-point subgroup is native baseline, not a new planned action. Send g to the actual subtype element c(g)∈U^N. The native coset relation a⁻¹b∈N and right-coset constancy prove representative independence, so use the ordinary native quotient lift, not a quotient homomorphism lift of the nonhomomorphic c. The quotient-map continuity criterion reduces continuity to the original continuous c valued in the native subtype. Quotient induction on both arguments proves the ordered cocycle law using the actual representative action.

Source: author-hosted Poonen, Definition1.3.14 and full Proposition1.3.15 proof, printedpp.11–12; the exact quotient-cocycle proof is a derived construction, not a numbered assertion printed there.

API:

- TauCeti.NonabelianCohomology.Z1.descend_apply (simp): For every g, inclusion into U sends descended c([g]) to c(g).
- TauCeti.NonabelianCohomology.Z1.descend_unique (extensionality): Any actual quotient cocycle with the prescribed included value on every representative equals descent.
- TauCeti.NonabelianCohomology.Z1.descend_one (simp): Descending the actual trivial cocycle gives the actual trivial quotient cocycle.
- TauCeti.NonabelianCohomology.Z1.descend_proof_independent (compatibility): The actual descended cocycle is independent of the proof that c is trivial on N.
- TauCeti.NonabelianCohomology.Z1.inflate_descend (compatibility): Inflating the descended actual cocycle recovers c.
- TauCeti.NonabelianCohomology.Z1.descend_gauge_iff (compatibility): Global gauge witnesses between c and d trivial on N are exactly N-fixed quotient gauge witnesses.

Tests:

- TauCeti.NonabelianCohomology.Z1.descend.test_one (degenerate): The descent of the actual trivial cocycle is the actual quotient trivial cocycle.
- TauCeti.NonabelianCohomology.Z1.descend.test_representative (compatibility): For n∈N, the actual descended values at [gn] and [g] agree in U^N.
- TauCeti.NonabelianCohomology.Z1.descend.test_proper_invariants (non-example): For native ConjAct S₃ acting on S₃ and N=G, the transposition(01) is not in U^N: conjugation by(12) changes it. The native coefficient target cannot be replaced by all U.
### Uniqueness of actual quotient cocycle descent

AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-unique

Declaration: TauCeti.NonabelianCohomology.Z1.descend_unique.

Under the descent hypotheses, any actual cocycle d:G/N→U^N whose value at [g], included in U, is c(g) for every g equals the constructed descent. Equality is in the existing cocycle type, not merely equality of classes.

Hypotheses: G and U are groups endowed with topologies; G acts on U by group automorphisms. c is the actual existing Z¹ cocycle, continuous with ordered law c(gh)=c(g)(g•c(h)); no invented cocycle or cohomology carrier is used. N is an arbitrary normal subgroup. Descent requires c(n)=1 for every n∈N. Compactness, closedness/openness of N, finiteness/discreteness of U, and continuity of the action or group operations are not needed for these cocycle-level maps. All generic H¹/topological-action and colimit assertions stay separate.

Dependencies: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-descent; mathlib:QuotientGroup.induction_on.

Proof: Apply cocycle extensionality; lift each quotient element to a representative by native quotient induction and apply subtype extensionality to the given value equality.

Source: author-hosted Poonen, Definition1.3.14 and full Proposition1.3.15 proof, printedpp.11–12; the exact quotient-cocycle proof is a derived construction, not a numbered assertion printed there.
### Inflation of actual quotient cocycles

AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation

Declaration: TauCeti.NonabelianCohomology.Z1.inflate.

For any normal N≤G and any continuous cocycle d:G/N→U^N with the existing quotient action, construct its inflation c:G→U by c(g)=d([g]) included in U. It is continuous, satisfies the ordered cocycle law, and is identically1 on N. No H¹ pointed-set map is asserted.

Hypotheses: G and U are groups endowed with topologies; G acts on U by group automorphisms. c is the actual existing Z¹ cocycle, continuous with ordered law c(gh)=c(g)(g•c(h)); no invented cocycle or cohomology carrier is used. N is an arbitrary normal subgroup. Descent requires c(n)=1 for every n∈N. Compactness, closedness/openness of N, finiteness/discreteness of U, and continuity of the action or group operations are not needed for these cocycle-level maps. All generic H¹/topological-action and colimit assertions stay separate.

Dependencies: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles; AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-map-one; mathlib:MulAction.coe_quotient_smul_fixedPoints; mathlib:coe_smul_fixedPoints_of_normal; mathlib:QuotientGroup.continuous_mk; mathlib:QuotientGroup.eq_one_iff; mathlib:QuotientGroup.mk_mul.

Proof: Compose the continuous native projection G→G/N, the actual continuous d and native subgroup inclusion U^N→U. The quotient multiplication/action representative formulas turn d's ordered cocycle law into the ordered G-law after applying subgroup inclusion. For n∈N the quotient class is1, and d(1)=1; no coefficient action on all U is forced to factor through G/N.

Source: author-hosted Poonen, Definition1.3.14 and full Proposition1.3.15 proof, printedpp.11–12; the exact quotient-cocycle proof is a derived construction, not a numbered assertion printed there.

API:

- TauCeti.NonabelianCohomology.Z1.inflate_apply (simp): At g the inflated cocycle is inclusion of d([g]) from the actual fixed subgroup.
- TauCeti.NonabelianCohomology.Z1.inflate_trivialOn (characterisation): Every inflated cocycle is identically1 on N.
- TauCeti.NonabelianCohomology.Z1.inflate_one (simp): Inflation sends the actual quotient trivial cocycle to the actual G-trivial cocycle.
- TauCeti.NonabelianCohomology.Z1.descend_inflate (compatibility): Descending inflation recovers every actual quotient cocycle.
- TauCeti.NonabelianCohomology.Z1.inflate_injective (extensionality): Inflation is injective on actual cocycles, using native quotient representatives; no H¹ injectivity is asserted.

Tests:

- TauCeti.NonabelianCohomology.Z1.inflate.test_one (degenerate): Inflation preserves the actual trivial cocycle.
- TauCeti.NonabelianCohomology.Z1.inflate.test_native_projection (compatibility): Inflation evaluates as the actual d composed with the native quotient projection and subgroup inclusion.
- TauCeti.NonabelianCohomology.Z1.inflate.test_subgroup (compatibility): At any actual n∈N the inflated cocycle is1; no arbitrary chosen quotient representative is used.
### Recovery after quotient descent

AnabelianGeometryAndNonabelianChabauty:NC.3/inflate-descended-cocycle

Declaration: TauCeti.NonabelianCohomology.Z1.inflate_descend.

For c trivial on normal N, inflating its actual descent recovers c exactly in Z¹(G,U).

Hypotheses: G and U are groups endowed with topologies; G acts on U by group automorphisms. c is the actual existing Z¹ cocycle, continuous with ordered law c(gh)=c(g)(g•c(h)); no invented cocycle or cohomology carrier is used. N is an arbitrary normal subgroup. Descent requires c(n)=1 for every n∈N. Compactness, closedness/openness of N, finiteness/discreteness of U, and continuity of the action or group operations are not needed for these cocycle-level maps. All generic H¹/topological-action and colimit assertions stay separate.

Dependencies: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-descent; AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation.

Proof: Cocycle extensionality and the actual quotient-lift computation at [g] make the equality pointwise definitional.

Source: author-hosted Poonen, Definition1.3.14 and full Proposition1.3.15 proof, printedpp.11–12; the exact quotient-cocycle proof is a derived construction, not a numbered assertion printed there.
### Recovery after cocycle inflation

AnabelianGeometryAndNonabelianChabauty:NC.3/descend-inflated-cocycle

Declaration: TauCeti.NonabelianCohomology.Z1.descend_inflate.

For every actual d∈Z¹(G/N,U^N), descend its inflation using the proved triviality on N; the result equals d in Z¹(G/N,U^N).

Hypotheses: G and U are groups endowed with topologies; G acts on U by group automorphisms. c is the actual existing Z¹ cocycle, continuous with ordered law c(gh)=c(g)(g•c(h)); no invented cocycle or cohomology carrier is used. N is an arbitrary normal subgroup. Descent requires c(n)=1 for every n∈N. Compactness, closedness/openness of N, finiteness/discreteness of U, and continuity of the action or group operations are not needed for these cocycle-level maps. All generic H¹/topological-action and colimit assertions stay separate.

Dependencies: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-unique; AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation.

Proof: Use uniqueness of descent and the pointwise inflation formula on every native representative.

Source: author-hosted Poonen, Definition1.3.14 and full Proposition1.3.15 proof, printedpp.11–12; the exact quotient-cocycle proof is a derived construction, not a numbered assertion printed there.
### Equivalence of actual cocycle spaces

AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-equivalence

Declaration: TauCeti.NonabelianCohomology.Z1.descendEquiv.

For any normal N≤G, the subtype of actual continuous G-cocycles trivial on N is equivalent to Z¹(G/N,U^N). Forward map is descent and inverse is inflation together with its proved triviality on N; both inverse identities hold. This is a cocycle-level equivalence, not a full H¹ equivalence.

Hypotheses: G and U are groups endowed with topologies; G acts on U by group automorphisms. c is the actual existing Z¹ cocycle, continuous with ordered law c(gh)=c(g)(g•c(h)); no invented cocycle or cohomology carrier is used. N is an arbitrary normal subgroup. Descent requires c(n)=1 for every n∈N. Compactness, closedness/openness of N, finiteness/discreteness of U, and continuity of the action or group operations are not needed for these cocycle-level maps. All generic H¹/topological-action and colimit assertions stay separate.

Dependencies: AnabelianGeometryAndNonabelianChabauty:NC.3/inflate-descended-cocycle; AnabelianGeometryAndNonabelianChabauty:NC.3/descend-inflated-cocycle.

Proof: Package the two existing actual cocycle maps and their inverse identities in native Equiv. Subtype extensionality removes only the proof of triviality, not the genuine condition.

Source: author-hosted Poonen, Definition1.3.14 and full Proposition1.3.15 proof, printedpp.11–12; the exact quotient-cocycle proof is a derived construction, not a numbered assertion printed there.

API:

- TauCeti.NonabelianCohomology.Z1.descendEquiv_apply (simp): The forward equivalence is the actual descent of the cocycle component using its stored proof of triviality.
- TauCeti.NonabelianCohomology.Z1.descendEquiv_symm_apply (simp): The inverse equivalence has actual cocycle component inflate d.
- TauCeti.NonabelianCohomology.Z1.descendEquiv_left_inv (extensionality): The inverse after forward is equality in the genuine subtype of actual cocycles trivial on N.
- TauCeti.NonabelianCohomology.Z1.descendEquiv_right_inv (extensionality): Forward after inverse is equality in the actual quotient cocycle type.
- TauCeti.NonabelianCohomology.Z1.descendEquiv_one (simp): The equivalence sends the actual trivial cocycle with its triviality proof to the actual quotient trivial cocycle.

Tests:

- TauCeti.NonabelianCohomology.Z1.descendEquiv.test_left_inverse (compatibility): The actual subtype element c is recovered by inverse after forward, including independence of its proof of triviality.
- TauCeti.NonabelianCohomology.Z1.descendEquiv.test_right_inverse (compatibility): Every actual quotient cocycle d is recovered by forward after inverse.
- TauCeti.NonabelianCohomology.Z1.descendEquiv.test_proof_irrelevance (degenerate): For one actual cocycle and two triviality proofs, the forward equivalence gives the identical descended cocycle.
### Exact N-fixed gauge witnesses after descent

AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-gauge

Declaration: TauCeti.NonabelianCohomology.Z1.descend_gauge_iff.

For continuous cocycles c,d both trivial on normal N, there exists x∈U with d(g)=x c(g)(g•x)⁻¹ for all g if and only if there exists x∈U^N with descended d(q)=x descended c(q)(q•x)⁻¹ for every q∈G/N. No refinement of N or H¹ quotient construction is used.

Hypotheses: G and U are groups endowed with topologies; G acts on U by group automorphisms. c is the actual existing Z¹ cocycle, continuous with ordered law c(gh)=c(g)(g•c(h)); no invented cocycle or cohomology carrier is used. N is an arbitrary normal subgroup. Descent requires c(n)=1 for every n∈N. Compactness, closedness/openness of N, finiteness/discreteness of U, and continuity of the action or group operations are not needed for these cocycle-level maps. All generic H¹/topological-action and colimit assertions stay separate.

Dependencies: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-descent; AnabelianGeometryAndNonabelianChabauty:NC.3/gauge-witness-fixed; mathlib:FixedPoints.mem_subgroup; mathlib:MulAction.coe_quotient_smul_fixedPoints; mathlib:coe_smul_fixedPoints_of_normal; mathlib:QuotientGroup.induction_on.

Proof: The inherited actual gauge-witness lemma proves any global witness x is N-fixed from triviality of both cocycles. Package x in the native fixed subgroup and prove the quotient gauge equation by native quotient induction, subtype extensionality and the representative action. Conversely, evaluate the quotient equation at [g] and apply the native subgroup inclusion. This establishes the pointwise witness bridge but does not define quotient H¹ inflation.

Source: author-hosted Poonen, Definition1.3.14 and full Proposition1.3.15 proof, printedpp.11–12; the exact quotient-cocycle proof is a derived construction, not a numbered assertion printed there.

### Native baseline and exact boundaries

- tauceti:TauCeti.ContCohomology.descendZ1 — Existing additive, commutative-coefficient cocycle descent to the native fixed additive subgroup. This is positive nearest prior art, not a nonabelian supplier. No duplicate additive theory is planned.
- tauceti:TauCeti.ContCohomology.coe_descendZ1_apply_mk — The existing additive descent computes on a quotient representative as the original additive cocycle.
- tauceti:TauCeti.ContCohomology.explicitInfl1_descendZ1 — Existing additive H¹ class recovery after descent; not a theorem for the generic nonabelian pointed set.
- mathlib:QuotientGroup.induction_on — Native induction on every coset element using representatives.
- mathlib:MulAction.coe_quotient_smul_fixedPoints — The existing quotient action of G/N on native N-fixed points evaluates on a representative exactly as the existing G-action. The surrounding pinned file supplies the automorphism-action instance on FixedPoints.subgroup N U; it is baseline, not a new planning node.
- mathlib:coe_smul_fixedPoints_of_normal — The existing action of G on the fixed-point subtype agrees after coercion with the original action on U; normality ensures stability.
- mathlib:QuotientGroup.eq_one_iff — For a normal subgroup, the native quotient class of g is1 exactly when g belongs to N.
- mathlib:QuotientGroup.mk_mul — For a normal subgroup, the native quotient of a product equals the product of quotient representatives.
- mathlib:QuotientGroup.isQuotientMap_mk — The native projection from G to its coset type with quotient topology is a quotient map, without normality, closedness or compactness assumptions.
- mathlib:Topology.IsQuotientMap.continuous_iff — A function on a quotient is continuous exactly when its composite with the given quotient map is continuous.

The existing additive TauCeti descent, its representative formula and H¹ recovery were read with all ambient hypotheses at the exact TauCeti pin. They do not supply the noncommutative ordered cocycle law. The canonical comparison through genuine additive/multiplicative cocycle conversion is still open; no second additive descent is planned. The new native quotient formulas, inverse identities and proof irrelevance are actual compatibility tests. The S₃ test computes that U^N can be proper, excluding replacement by all U.

The native proof extraction has no admissions and includes eight inherited and nine new typed examples. All nineteen new declaration audits are free of admission dependencies. The suggested file retains admitted signatures under PROTOCOL§13. Its broader Mathlib-only extraction, excluding exactly the TauCeti import and named Abelian section, elaborates; the full TauCeti-importing file remains uncompiled because the pinned LowDegree compiled artifact is missing. The source/extraction receipts and exact reproduction recipe are in the current handoff.

The reserved étale K(π,1) key stays partial. NC.0/NC.3 stay partial and five other stages stay not_read. All nine gaps and sixteen requests remain. In particular this is not a constructed H¹ inflation map, H¹ injectivity, neutral-fibre theorem, finite-quotient transition system or filtered colimit. General unipotent coefficient topologies are unchanged. All Chen/BDMTV routes, the NS supplier A2 and generic-height Part II boundaries remain as stated earlier.

## Actual nonabelian H¹ inflation — codex-rtOQ9t

The preceding checkpoint descends actual cocycles; this continuation descends their gauge classes. The coefficient object is the existing fixed subgroup U^N and the source is the genuine native orbit quotient. All six declarations below have a checked actual proof archive, but the canonical file remains a suggested signature file and all implementation statuses remain unchecked. NC.3 remains partial.

Assume a topological coefficient group U, a group G endowed with a topology, and a jointly continuous G-action by group automorphisms. For normal N, use the native quotient topology on G/N and the native multiplicative action on U^N, **with joint continuity of that quotient action explicit**. This is required to act on continuous quotient cocycles. The pinned TauCeti Invariants helpers inspected here use additive coefficient groups; they are positive prior art and do not automatically give this instance for arbitrary noncommutative U. No compactness, discrete coefficient hypothesis or subgroup refinement is hidden.

### Equality of nonabelian cohomology classes

Declaration: TauCeti.NonabelianCohomology.H1.mk_eq_mk_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-orbit-criterion.

For actual continuous cocycles c,c′, their classes in H¹(G,U) are equal if and only if there is x∈U with x·c=c′, where (x·c)(g)=x c(g)(g•x)⁻¹. The equality criterion uses the genuine gauge action, not multiplication by a coboundary.

Hypotheses: G is a group endowed with a topology. U is a topological group with a group-automorphism action of G whose joint action is continuous. H¹ is the actual twisted-conjugation orbit set of continuous nonabelian cocycles, with the class of the constant identity cocycle as base point.

Proof: Unfold the native orbit-set class map. Native quotient equality is the orbit relation; reverse its arguments to match the stated x·c=c′ orientation. Use the native orbit-relation membership and orbit witness formulas. This promotes the already planned H1.mk_eq_mk_iff API without changing it.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, mathlib:MulAction.orbitRel_apply, mathlib:MulAction.mem_orbit_iff.

Acceptance: Two gauge-related cocycles have equal classes even if their functions differ. For a trivial action the criterion is conjugacy of homomorphisms.

Source: Kim, arXiv:math/0409456v1, §1 printed p.6, for the ordered cocycle/gauge definitions; the inflation proof is the deduction above, not a numbered source theorem.

### Gauge equivariance of cocycle inflation

Declaration: TauCeti.NonabelianCohomology.Z1.inflate_smul. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-inflation-equivariance.

For x∈U^N and d∈Z¹(G/N,U^N), inflate_N(x·d)=x·inflate_N(d), with x included in U on the right. The products and inverses stay in their printed order.

Hypotheses: G is a group endowed with a topology. U is a topological group with a group-automorphism action of G whose joint action is continuous. H¹ is the actual twisted-conjugation orbit set of continuous nonabelian cocycles, with the class of the constant identity cocycle as base point. N is any normal subgroup of G; G/N has the native quotient topology and acts by the native multiplicative action on the existing subgroup U^N. The joint quotient action on U^N is explicitly assumed continuous. No compactness, openness/closedness of N, finite/discrete coefficient group or commutativity assumption is imposed.

Proof: Evaluate the actual cocycles at any g∈G. The native quotient representative and fixed-subgroup inclusion formulas identify both gauge expressions. Apply actual cocycle extensionality. No representative section or coefficient action on all U through G/N is introduced.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, mathlib:MulAction.coe_quotient_smul_fixedPoints, mathlib:coe_smul_fixedPoints_of_normal.

Acceptance: A nonidentity fixed gauge element gives the same equality; the assertion holds for noncommutative U.

Source: Kim, arXiv:math/0409456v1, §1 printed p.6, for the ordered cocycle/gauge definitions; the inflation proof is the deduction above, not a numbered source theorem.

### Same-subgroup reflection of gauge witnesses

Declaration: TauCeti.NonabelianCohomology.Z1.inflate_gauge_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-inflation-gauge-reflection.

For d,e∈Z¹(G/N,U^N), there is x∈U with x·inflate_N(d)=inflate_N(e) if and only if there is x∈U^N with x·d=e. This is the same N on both sides, with no replacement by a smaller subgroup.

Hypotheses: G is a group endowed with a topology. U is a topological group with a group-automorphism action of G whose joint action is continuous. H¹ is the actual twisted-conjugation orbit set of continuous nonabelian cocycles, with the class of the constant identity cocycle as base point. N is any normal subgroup of G; G/N has the native quotient topology and acts by the native multiplicative action on the existing subgroup U^N. The joint quotient action on U^N is explicitly assumed continuous. No compactness, openness/closedness of N, finite/discrete coefficient group or commutativity assumption is imposed.

Proof: Evaluate a global gauge equality on each n∈N. Both inflated cocycles take value1, so the existing gauge_witness_fixed theorem forces that very witness into U^N. Use this genuine subgroup element and quotient representative induction, then subtype/cocycle extensionality, to obtain x·d=e. The converse follows by inflation equivariance and inclusion of the fixed gauge witness.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/gauge-witness-fixed, AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-inflation-equivariance, AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, mathlib:QuotientGroup.induction_on.

Acceptance: The forward implication keeps the original witness, rather than assuming a fixed witness or refining N. Infinite U is allowed.

Source: Kim, arXiv:math/0409456v1, §1 printed p.6, for the ordered cocycle/gauge definitions; the inflation proof is the deduction above, not a numbered source theorem.

### Trivial cocycle under inflation

Declaration: TauCeti.NonabelianCohomology.Z1.inflate_one. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation-one.

Inflation of the actual constant identity cocycle on G/N with coefficients U^N is the actual constant identity cocycle on G with coefficients U.

Hypotheses: G and U are groups endowed with topologies, G acts on U by group automorphisms, and N is an arbitrary normal subgroup. The native quotient action on the existing subgroup U^N is used. Joint action continuity and continuous group operations are not required for this identity of actual cocycles.

Proof: Evaluate at every g; the native fixed-subgroup inclusion sends1 to1. Apply cocycle extensionality. This promotes the existing inflate_one API for its consumption by the pointed-set map.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation.

Acceptance: The identity value is that of the coefficient group, rather than an arbitrary selected cocycle.

Source: Kim, arXiv:math/0409456v1, §1 printed p.6, for the ordered cocycle/gauge definitions; the inflation proof is the deduction above, not a numbered source theorem.

### Inflation of nonabelian cohomology classes

Declaration: TauCeti.NonabelianCohomology.H1.inflate. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation.

Construct the pointed-set map inflate_N:H¹(G/N,U^N)→H¹(G,U) by sending the class of d to the class of the actual inflated cocycle g↦d([g]) included in U. It descends the existing cocycle inflation through the actual native gauge-orbit quotients and sends the base point to the base point.

Hypotheses: G is a group endowed with a topology. U is a topological group with a group-automorphism action of G whose joint action is continuous. H¹ is the actual twisted-conjugation orbit set of continuous nonabelian cocycles, with the class of the constant identity cocycle as base point. N is any normal subgroup of G; G/N has the native quotient topology and acts by the native multiplicative action on the existing subgroup U^N. The joint quotient action on U^N is explicitly assumed continuous. No compactness, openness/closedness of N, finite/discrete coefficient group or commutativity assumption is imposed.

Proof: Lift the actual cocycle-to-class function through the native orbit quotient. If the native relation says d=x·e, equivariance and the inverse gauge element show that their inflated classes agree; the native relation has this argument orientation. The representative formula is the quotient-lift computation. The promoted identity-cocycle inflation theorem gives preservation of the distinguished point. Reflection of the distinguished point follows from the separately promoted same-N injectivity result and point preservation. No group structure, additive law, image=fibre assertion or colimit is included in the construction.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-orbit-criterion, AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-inflation-equivariance, AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation-one, mathlib:inv_smul_smul.

Acceptance: The map is independent of the actual quotient cocycle representative. The concrete discrete S₂→S₃ transposition class at N={1} has nonneutral inflation; a constant-basepoint map fails the test.

- API: TauCeti.NonabelianCohomology.H1.inflate_mk. At the actual class of d, H¹ inflation is the actual class of cocycle inflation.
- API: TauCeti.NonabelianCohomology.H1.inflate_one. Inflation preserves the distinguished class of the identity cocycle.
- API: TauCeti.NonabelianCohomology.H1.inflate_injective. For this fixed normal subgroup N, inflate_N:H¹(G/N,U^N)→H¹(G,U) is injective. Equality of inflated classes implies equality of source classes at the same N.
- API: TauCeti.NonabelianCohomology.H1.inflate_eq_one_iff. For a∈H¹(G/N,U^N), inflate_N(a)=1 if and only if a=1. This reflects the neutral point; it does not assert image=neutral restriction fibre.

- Unit test: TauCeti.NonabelianCohomology.H1.inflate.test_one. Inflation of the source distinguished point is the target distinguished point.
- Unit test: TauCeti.NonabelianCohomology.H1.inflate.test_gauge. For any actual quotient cocycle d and any x∈U^N, inflation of the class of x·d equals inflation of the class of d.
- Unit test: TauCeti.NonabelianCohomology.H1.inflate.test_neutral_reflection. For every actual source class a, inflate_N(a)=1 if and only if a=1.
- Unit test: TauCeti.NonabelianCohomology.H1.inflate.test_nonabelian_transposition. Let G=S₂ and U=S₃ with discrete topologies and trivial G-action, N={1}, and c the homomorphism sending the nonidentity element of S₂ to the transposition(01) of S₃. If d is the actual quotient descent of c, then inflate_N([d])≠1. Thus the construction cannot be a constant-basepoint map; the coefficient group is genuinely noncommutative.

- Use: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-injective. Supplies the genuine orbit-set map and representative computation for fixed-N injectivity.
- Use: AnabelianGeometryAndNonabelianChabauty:NC.3 — open inflation–restriction and filtered-colimit targets. Supplies the actual pointed-set inflation needed before restriction-fibre exactness and reverse-inclusion transitions. It does not supply those later interfaces.

Source: Kim, arXiv:math/0409456v1, §1 printed p.6, for the ordered cocycle/gauge definitions; the inflation proof is the deduction above, not a numbered source theorem.

### Injectivity of nonabelian inflation

Declaration: TauCeti.NonabelianCohomology.H1.inflate_injective. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-injective.

For this fixed normal subgroup N, inflate_N:H¹(G/N,U^N)→H¹(G,U) is injective. Equality of inflated classes implies equality of source classes at the same N.

Hypotheses: G is a group endowed with a topology. U is a topological group with a group-automorphism action of G whose joint action is continuous. H¹ is the actual twisted-conjugation orbit set of continuous nonabelian cocycles, with the class of the constant identity cocycle as base point. N is any normal subgroup of G; G/N has the native quotient topology and acts by the native multiplicative action on the existing subgroup U^N. The joint quotient action on U^N is explicitly assumed continuous. No compactness, openness/closedness of N, finite/discrete coefficient group or commutativity assumption is imposed.

Proof: Apply actual quotient induction to representatives d,e of the two source classes. The representative computation is definitional. The promoted class equality criterion gives a global gauge witness for the inflated cocycles. Same-N gauge reflection gives a genuine U^N witness between d,e, and the same class criterion identifies their source classes.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-orbit-criterion, AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-inflation-gauge-reflection.

Acceptance: Inflation reflects the neutral point. Neither replacing N by a refinement nor injectivity of the underlying cocycle map alone proves this assertion.

Source: Kim, arXiv:math/0409456v1, §1 printed p.6, for the ordered cocycle/gauge definitions; the inflation proof is the deduction above, not a numbered source theorem.

### Native interfaces and exact limits

At Mathlib082e2d3 the native orbit relation takes its first argument in the orbit of its second. MulAction.orbitRel_apply and MulAction.mem_orbit_iff make that orientation explicit; inv_smul_smul handles the inverse witness needed by the quotient lift. Their ambient declarations were read at the pin before citation. Full OfQuotient.lean was read, including the actual multiplicative normal-fixed-subgroup action. Selected TauCeti Invariants additive continuity interfaces were read at f790474; they are not replanned or presented as the generic coefficient-action discharge.

The S₂→S₃ example uses the actual finite permutation groups, discrete topologies, actual cocycle and actual quotient descent. Its nonidentity class cannot be a coboundary because the action is trivial and every coboundary is the identity function. Thus always returning the base point fails. The gauge test additionally checks that the map respects the genuine orbit relation.

Current frontier: Actual H¹ inflation on the native gauge-orbit set, its representative/basepoint formulas and same-N injectivity/neutral-point reflection are now supplied. Joint continuity of the native quotient action on U^N is an explicit hypothesis; the additive native continuous-action helper is not a general multiplicative proof. Still establish that continuity in any intended broader coefficient topology, actual restriction and image=neutral restriction fibre, reverse-inclusion transitions and compact-discrete filtered-colimit bijection, and genuine additive cocycle comparison. All inherited representability, local-condition, source-proof, API/granularity and geometric obligations remain open. The reserved étale K(π,1) contract, all nine pre-existing gaps, sixteen requests, eleven planet objects, every routed source inventory and the RT-AREA-algebraicgeometry/8 A2 Néron–Severi ownership remain binding. Generic height/mixed-extension/local-term work remains with its shared Part II owner; no reverse NC.5 or NC.3→NC.0 dependency is added. The previous reader sections describe their historical checkpoint frontier; this paragraph is the current inflation frontier.

The independently downloaded [exact Kim v1 PDF](https://arxiv.org/pdf/math/0409456v1) retains SHA25600efa6e96091d564f7afa2ad9fb917a34cc0a55b7e258164383519b4e93ba941. Fresh reading covers the full continuous-cocycle and gauge-orbit definitions on p.6 and Proposition1 statement on p.5; no full-paper reading, published-version collation, new erratum or torsor-classification closure is claimed.


## NC.3 continuation: the neutral restriction fibre

This continuation proves pointed-set inflation–restriction for arbitrary normal N under the explicit joint-continuous native quotient-action hypothesis. All earlier checkpoint descriptions are historical; the frontier below supersedes their D4-open wording. H¹ remains the actual gauge-orbit quotient of continuous ordered nonabelian cocycles. No Selmer variety, dimension theorem, torsor-classification proof or geometric étale comparison is inferred.

### Restriction of continuous nonabelian cocycles

Declaration: TauCeti.NonabelianCohomology.Z1.restrict. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-restriction.

Construct res_N:Z¹(G,U)→Z¹(N,U) by res_N(c)(n)=c(n), using the actual subgroup inclusion and restricted action. This keeps continuity and the ordered cocycle law.

Hypotheses: G is a group endowed with a topology; U is a group endowed with a topology and G acts on U by group automorphisms. N is an arbitrary subgroup with its native subtype topology and restricted action.

Proof: Compose the actual continuous cocycle with native subgroup inclusion. The inherited automorphism action on N evaluates through that inclusion; the ordered cocycle law specializes to n,m∈N.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/continuous-cocycles, mathlib:continuous_subtype_val, mathlib:Continuous.comp.

Acceptance: Restriction is genuine evaluation on the subgroup, not a constant cocycle. The bottom subgroup sees only c(1)=1.

- API: TauCeti.NonabelianCohomology.Z1.restrict_apply. For n∈N, res_N(c)(n)=c(n) through native subgroup inclusion.
- API: TauCeti.NonabelianCohomology.Z1.restrict_one. Restriction sends the identity cocycle to the identity cocycle.
- API: TauCeti.NonabelianCohomology.Z1.restrict_smul. Under the stronger joint-continuous action/topological-group hypotheses, restriction commutes with every U-gauge action: res_N(x·c)=x·res_N(c).

- Unit test: TauCeti.NonabelianCohomology.Z1.restrict.test_one. Restriction of the identity cocycle to any subgroup is the identity cocycle.
- Unit test: TauCeti.NonabelianCohomology.Z1.restrict.test_subgroup_value. At any actual subgroup element n, restriction evaluates to the original c(n).
- Unit test: TauCeti.NonabelianCohomology.Z1.restrict.test_bottom. Every cocycle restricts to the identity cocycle on N={1}.

- Use: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-restriction. Supplies the actual continuous restricted cocycle whose orbit class defines restriction.
- Use: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-restriction-inflation. Tests actual inflation at each subgroup element.

Source: [Kim, exact arXiv v1](https://arxiv.org/pdf/math/0409456v1), §1 pp.5–6, for continuous cocycle and gauge definitions. The restriction, normalization and fibre arguments are authored deductions from these definitions and the listed interfaces, not numbered theorems attributed to Kim.

### Gauge equivariance of cocycle restriction

Declaration: TauCeti.NonabelianCohomology.Z1.restrict_smul. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-restriction-equivariance.

For x∈U and c∈Z¹(G,U), res_N(x·c)=x·res_N(c). The gauge element belongs to all U, not necessarily U^N.

Hypotheses: G is a group endowed with a topology; U is a group endowed with a topology and G acts on U by group automorphisms. N is an arbitrary subgroup with its native subtype topology and restricted action. U is a topological group and the joint G-action on U is continuous. No normality, compactness, openness, closedness, discreteness or commutativity is required for restriction and inverse-gauge normalization.

Proof: Native restricted scalar multiplication evaluates through subgroup inclusion. Both cocycle values are x c(n)(n•x)⁻¹; equality is definitional.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-restriction, AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, mathlib:Subgroup.continuousSMul.

Acceptance: A non-N-fixed witness is allowed; imposing fixedness here would change restriction on classes.

Source: [Kim, exact arXiv v1](https://arxiv.org/pdf/math/0409456v1), §1 pp.5–6, for continuous cocycle and gauge definitions. The restriction, normalization and fibre arguments are authored deductions from these definitions and the listed interfaces, not numbered theorems attributed to Kim.

### Neutral class as an actual coboundary

Declaration: TauCeti.NonabelianCohomology.H1.mk_eq_one_iff. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-neutral-criterion.

For any actual continuous cocycle c, [c]=1 if and only if there is x∈U with c(g)=x(g•x)⁻¹ for all g. This promotes the existing H¹ API for its use on the restricted cocycle.

Hypotheses: G is a group endowed with a topology; U is a group endowed with a topology and G acts on U by group automorphisms. N is an arbitrary subgroup with its native subtype topology and restricted action. U is a topological group and the joint G-action on U is continuous. No normality, compactness, openness, closedness, discreteness or commutativity is required for restriction and inverse-gauge normalization.

Proof: Apply the genuine orbit criterion with the identity cocycle as source. Evaluate the actual gauge action on that cocycle and use cocycle extensionality for the converse.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-orbit-criterion.

Acceptance: Neutrality is gauge triviality; it does not require the chosen representing function to equal1.

Source: [Kim, exact arXiv v1](https://arxiv.org/pdf/math/0409456v1), §1 pp.5–6, for continuous cocycle and gauge definitions. The restriction, normalization and fibre arguments are authored deductions from these definitions and the listed interfaces, not numbered theorems attributed to Kim.

### Gauge invariance of the cohomology class

Declaration: TauCeti.NonabelianCohomology.H1.mk_smul. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-gauge-class.

For every x∈U and c∈Z¹(G,U), [x·c]=[c].

Hypotheses: G is a group endowed with a topology; U is a group endowed with a topology and G acts on U by group automorphisms. N is an arbitrary subgroup with its native subtype topology and restricted action. U is a topological group and the joint G-action on U is continuous. No normality, compactness, openness, closedness, discreteness or commutativity is required for restriction and inverse-gauge normalization.

Proof: The existing orbit criterion identifies [c] and [x·c] using the actual witness x; reverse the equality.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-orbit-criterion.

Acceptance: This is invariance under the whole coefficient gauge group, without an abelian quotient law.

Source: [Kim, exact arXiv v1](https://arxiv.org/pdf/math/0409456v1), §1 pp.5–6, for continuous cocycle and gauge definitions. The restriction, normalization and fibre arguments are authored deductions from these definitions and the listed interfaces, not numbered theorems attributed to Kim.

### Inverse-gauge normalization on a subgroup

Declaration: TauCeti.NonabelianCohomology.Z1.normalize_trivialOn. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-inverse-gauge-normalization.

If c(n)=x(n•x)⁻¹ for every n∈N, then (x⁻¹·c)(n)=1 for every n∈N. This constructs a representative identically1 on the same N.

Hypotheses: G is a group endowed with a topology; U is a group endowed with a topology and G acts on U by group automorphisms. N is an arbitrary subgroup with its native subtype topology and restricted action. U is a topological group and the joint G-action on U is continuous. No normality, compactness, openness, closedness, discreteness or commutativity is required for restriction and inverse-gauge normalization.

Proof: Evaluate the gauge formula at n and substitute the given coboundary formula: x⁻¹ x (n•x)⁻¹ (n•x⁻¹)⁻¹=1. Automorphisms preserve inverses; cancel in the given factor order.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1.

Acceptance: The inverse of x is essential. For G=ConjAct(S₃), U=S₃, both discrete, x=(01)(12) and c=x·1, the cocycle x⁻¹·c is1 but x·c is not1. No commutativity or order-two simplification is used.

- Unit test: TauCeti.NonabelianCohomology.Z1.normalize_trivialOn.test_inverse_gauge. For discrete U=S₃ and G=ConjAct(U), let x=(01)(12) and c=x·1. Then x⁻¹·c=1 and x·c≠1; evaluating at the conjugating transposition(01) detects the latter.

Source: [Kim, exact arXiv v1](https://arxiv.org/pdf/math/0409456v1), §1 pp.5–6, for continuous cocycle and gauge definitions. The restriction, normalization and fibre arguments are authored deductions from these definitions and the listed interfaces, not numbered theorems attributed to Kim.

### Restriction of nonabelian cohomology classes

Declaration: TauCeti.NonabelianCohomology.H1.restrict. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-restriction.

Construct the pointed-set map res_N:H¹(G,U)→H¹(N,U) sending [c] to [res_N(c)]. It uses the native gauge-orbit quotients and the whole U-gauge action on both sides.

Hypotheses: G is a group endowed with a topology; U is a group endowed with a topology and G acts on U by group automorphisms. N is an arbitrary subgroup with its native subtype topology and restricted action. U is a topological group and the joint G-action on U is continuous. No normality, compactness, openness, closedness, discreteness or commutativity is required for restriction and inverse-gauge normalization.

Proof: Lift c↦[res_N(c)] through the genuine orbit quotient. Its native relation c=x·d and restriction equivariance give [res_N(c)]=[x·res_N(d)]=[res_N(d)]. Representative evaluation is the quotient-lift computation. Identity-cocycle restriction proves basepoint preservation.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-restriction, AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-restriction-equivariance, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-gauge-class, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-neutral-criterion, AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1, mathlib:Subgroup.continuousSMul, mathlib:MulAction.orbitRel_apply, mathlib:MulAction.mem_orbit_iff.

Acceptance: Restricting to the top subgroup detects the neutral class. A neutral restricted class can have a nonidentity restricted representing cocycle.

- API: TauCeti.NonabelianCohomology.H1.restrict_mk. Restriction of [c] is the actual class of res_N(c).
- API: TauCeti.NonabelianCohomology.H1.restrict_one. Restriction preserves the distinguished point.
- API: TauCeti.NonabelianCohomology.H1.restrict_mk_eq_one_iff. For an actual representing cocycle c, res_N([c])=1 if and only if there is x∈U with c(n)=x(n•x)⁻¹ for every n∈N.

- Unit test: TauCeti.NonabelianCohomology.H1.restrict.test_one. Restriction of the distinguished class to any subgroup is distinguished.
- Unit test: TauCeti.NonabelianCohomology.H1.restrict.test_gauge. For x∈U, restricting [x·c] gives the same class as restricting [c].
- Unit test: TauCeti.NonabelianCohomology.H1.restrict.test_bottom. Every H¹ class restricts to the distinguished point on N={1}.
- Unit test: TauCeti.NonabelianCohomology.H1.restrict.test_top_detects. For N=G, res_N(a)=1 if and only if a=1.
- Unit test: TauCeti.NonabelianCohomology.H1.restrict.test_neutral_not_pointwise. For discrete U=S₃ and G=ConjAct(U), x=(01)(12), c=x·1 and N=G, res_N([c])=1 while the actual restricted cocycle res_N(c)≠1. Neutrality cannot be tested by literal triviality of a chosen representative.

- Use: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-restriction-image. The actual neutral fibre of this map is identified with the actual inflation image.
- Use: AnabelianGeometryAndNonabelianChabauty:NC.3 local-condition targets. Subgroup restriction is an input to genuine local maps; decomposition-group embeddings and Selmer conditions remain separate work.

Source: [Kim, exact arXiv v1](https://arxiv.org/pdf/math/0409456v1), §1 pp.5–6, for continuous cocycle and gauge definitions. The restriction, normalization and fibre arguments are authored deductions from these definitions and the listed interfaces, not numbered theorems attributed to Kim.

### Restriction of an inflated cocycle

Declaration: TauCeti.NonabelianCohomology.Z1.restrict_inflate. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-restriction-inflation.

For d∈Z¹(G/N,U^N), res_N(inflate_N(d)) is the actual identity cocycle on N.

Hypotheses: G is a group endowed with a topology; U is a group endowed with a topology and G acts on U by group automorphisms. N is an arbitrary subgroup with its native subtype topology and restricted action. N is normal; use the native quotient action and topology. Joint continuity of the quotient action is unnecessary for this cocycle identity.

Proof: Evaluate at each n∈N. The existing inflate_trivialOn API gives value1. Apply actual cocycle extensionality.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-restriction, AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation.

Acceptance: The triviality is literal at the cocycle level and holds for the same normal subgroup.

Source: [Kim, exact arXiv v1](https://arxiv.org/pdf/math/0409456v1), §1 pp.5–6, for continuous cocycle and gauge definitions. The restriction, normalization and fibre arguments are authored deductions from these definitions and the listed interfaces, not numbered theorems attributed to Kim.

### Neutrality of restriction after inflation

Declaration: TauCeti.NonabelianCohomology.H1.restrict_inflate. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-restriction-inflation.

For every a∈H¹(G/N,U^N), res_N(inflate_N(a))=1 in H¹(N,U).

Hypotheses: G is a group endowed with a topology; U is a group endowed with a topology and G acts on U by group automorphisms. N is an arbitrary subgroup with its native subtype topology and restricted action. U is a topological group and the joint G-action on U is continuous. No normality, compactness, openness, closedness, discreteness or commutativity is required for restriction and inverse-gauge normalization. For inflation and its neutral restriction fibre, N is normal and the joint native G/N-action on U^N is explicitly assumed continuous. The native quotient topology and native fixed subgroup/action are used.

Proof: Induct on an actual orbit representative. Apply the representative APIs of inflation and restriction, then the promoted cocycle identity.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-restriction, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-restriction-inflation.

Acceptance: This gives the forward image-in-neutral-fibre inclusion without assuming the reverse inclusion.

Source: [Kim, exact arXiv v1](https://arxiv.org/pdf/math/0409456v1), §1 pp.5–6, for continuous cocycle and gauge definitions. The restriction, normalization and fibre arguments are authored deductions from these definitions and the listed interfaces, not numbered theorems attributed to Kim.

### Nonabelian inflation–restriction exactness

Declaration: TauCeti.NonabelianCohomology.H1.mem_range_inflate_iff_restrict_eq_one. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-restriction-image.

For every a∈H¹(G,U), a belongs to the set-theoretic image of inflate_N:H¹(G/N,U^N)→H¹(G,U) if and only if res_N(a)=1. This is equality with the neutral restriction fibre as pointed sets, not equality of group kernels.

Hypotheses: G is a group endowed with a topology; U is a group endowed with a topology and G acts on U by group automorphisms. N is an arbitrary subgroup with its native subtype topology and restricted action. U is a topological group and the joint G-action on U is continuous. No normality, compactness, openness, closedness, discreteness or commutativity is required for restriction and inverse-gauge normalization. For inflation and its neutral restriction fibre, N is normal and the joint native G/N-action on U^N is explicitly assumed continuous. The native quotient topology and native fixed subgroup/action are used.

Proof: An inflated class has neutral restriction by the preceding lemma. For the reverse implication choose an actual cocycle representative c. The representative restriction API and neutral-class criterion give an actual x∈U with c(n)=x(n•x)⁻¹ on N. The promoted inverse-gauge normalization constructs c′=x⁻¹·c identically1 on N. Existing actual descent produces d∈Z¹(G/N,U^N), and inflate(descend(c′))=c′. Representative inflation and gauge invariance give inflate([d])=[c′]=[c]=a. The subgroup is never refined; no hypothetical cohomology bridge or chosen cocycle representative is built into the statement.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-restriction-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-neutral-criterion, AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-inverse-gauge-normalization, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-gauge-class, AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-descent, AnabelianGeometryAndNonabelianChabauty:NC.3/inflate-descended-cocycle, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-restriction, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation.

Acceptance: The coefficient group can be noncommutative. The S₃ conjugation test shows why the reverse implication needs gauge normalization before literal cocycle descent. No compactness or discreteness is required under the explicit quotient-action continuity hypothesis.

Source: [Kim, exact arXiv v1](https://arxiv.org/pdf/math/0409456v1), §1 pp.5–6, for continuous cocycle and gauge definitions. The restriction, normalization and fibre arguments are authored deductions from these definitions and the listed interfaces, not numbered theorems attributed to Kim.

### Unique inflated class in the neutral fibre

Declaration: TauCeti.NonabelianCohomology.H1.existsUnique_inflate_of_restrict_eq_one. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-unique-preimage.

If res_N(a)=1, there is a unique b∈H¹(G/N,U^N) with inflate_N(b)=a, for this same normal subgroup N.

Hypotheses: G is a group endowed with a topology; U is a group endowed with a topology and G acts on U by group automorphisms. N is an arbitrary subgroup with its native subtype topology and restricted action. U is a topological group and the joint G-action on U is continuous. No normality, compactness, openness, closedness, discreteness or commutativity is required for restriction and inverse-gauge normalization. For inflation and its neutral restriction fibre, N is normal and the joint native G/N-action on U^N is explicitly assumed continuous. The native quotient topology and native fixed subgroup/action are used.

Proof: The image theorem supplies an actual source class. If another class has the same inflation, use the existing same-N injectivity.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-restriction-image, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-injective.

Acceptance: Uniqueness is of the quotient cohomology class; a normalizing gauge element or a cocycle representative need not be unique.

Source: [Kim, exact arXiv v1](https://arxiv.org/pdf/math/0409456v1), §1 pp.5–6, for continuous cocycle and gauge definitions. The restriction, normalization and fibre arguments are authored deductions from these definitions and the listed interfaces, not numbered theorems attributed to Kim.

The existing H¹ definition gains the API TauCeti.NonabelianCohomology.H1.mk_smul: [x·c]=[c], serving the promoted gauge-class node and class recovery after normalization. Its other APIs and tests are retained.

The two S₃ regressions use the order-three permutation x=(01)(12) and actual conjugation. They separately distinguish inverse-gauge normalization from applying x again, and orbit neutrality from literal identity of a chosen restricted cocycle. The bottom and top subgroup tests preserve the native subgroup action and topology.

Current frontier: Actual subgroup restriction on continuous cocycles and native H¹ orbit sets, inverse-gauge normalization, image=neutral restriction fibre and unique same-N inflated class are supplied under explicit joint quotient-action continuity. General multiplicative quotient-action continuity discharge, reverse-inclusion transitions, compact-discrete filtered-colimit bijection and genuine additive cocycle conversion remain open. All representability, local-condition, source-proof, inherited API/granularity and geometric obligations remain open. The reserved étale K(π,1) owner, its coefficient classes/all-degree comparison, eleven existing planet objects, sixteen requests and nine gaps remain. RT-AREA-algebraicgeometry/8 remains the existing A2 Néron–Severi request; generic heights/mixed extensions/local terms stay with their shared owner. No NC.3→NC.0 or reverse NC.5 dependency is introduced.

## Native quotient action and the neutral restriction fibre

Let G be a group with separately continuous multiplication, U a group with a jointly continuous G-action by automorphisms, and N any normal subgroup. Equip G/N with its native quotient topology and U^N with the topology induced by the subgroup inclusion into U. Normality makes the action of G preserve U^N; N acts trivially there, so the native quotient action sends ([g],u) to g•u. The action and its coercion formula are already provided by the pinned library. What is required here is continuity of this particular action on the actual fixed subgroup, not a replacement coefficient type or a new general theory of quotient spaces.

Separate continuity of multiplication on G ensures that the native quotient projection is open. It is weaker than requiring G to be a topological group. The group U need not have continuous multiplication for the action-continuity lemma itself. For the subsequent nonabelian cohomology equivalence, U is a topological group, as needed for the actual coefficient gauge action on continuous cocycles. Neither statement requires N to be open or closed, coefficients to be discrete or finite, or G or U to be commutative. No compactness hypothesis is introduced.

### Joint continuity

The projection π:G→G/N is an open quotient map. Its product with the identity on U^N is an open quotient map as well; this product property uses openness, not an assertion that arbitrary quotient maps are stable under products. Therefore the action on (G/N)×U^N is continuous exactly when its composite with π×id is continuous. After including the range U^N into U, that composite is (g,u)↦g•u. The first projection and the subgroup-valued second projection followed by inclusion are continuous, and joint continuity of the ambient G-action gives continuity of their action. The induced topology on the fixed subgroup brings the result back to U^N.

This argument is joint in the quotient variable and coefficient variable. Knowing continuity separately for each fixed coefficient would not justify the conclusion. It also does not assert that the quotient is Hausdorff when N is not closed. The conclusion is precisely the continuity class for the existing action and topology. Use the resulting proof locally when applying the existing inflation and restriction interfaces; no additional globally overlapping instance is required.

### Genuine pointed sets and the specified forward map

Use the existing continuous ordered cocycle law c(gh)=c(g)(g•c(h)) and the gauge action (x·c)(g)=x c(g)(g•x)⁻¹. H¹(G,U) is the native quotient by that coefficient action, with distinguished point the class of the identity cocycle. The neutral restriction fibre consists of actual classes a with res_N(a)=1, not cocycles whose chosen representative is literally the identity on N. It is a subtype of the existing H¹, rather than a new cohomology carrier or a kernel in a nonexistent group structure.

The actual inflation sends a quotient cocycle d to g↦d([g]) included in U, and the quotient map on H¹ has the same representative rule. Restriction of an inflated class is neutral. This proves that the specified forward map lands in the neutral fibre. Same-N injectivity of inflation proves injectivity of this map into the subtype. For surjectivity, the existing image theorem supplies a quotient class for every neutral restricted class: choose a cocycle c, use the genuine neutrality criterion to obtain a gauge x, normalize by x⁻¹ so the new cocycle is identically 1 on N, and apply actual quotient descent. Gauge invariance returns the original ambient class. This uses the existing proof, not an additional assumed comparison bridge.

Apply the native equivalence constructor to this actual bijective map. Its forward map remains exactly inflation equipped with the proved restriction identity. Its inverse is determined at the level of cohomology classes; a chosen gauge witness or cocycle representative is neither canonical nor part of the output. The normal subgroup is the same throughout. The existing inflation basepoint API is promoted to its own dependency node without a new signature, and gives preservation of the distinguished point.

The two inverse laws provide source and target round trips. The forward evaluation API allows users to forget the neutral-fibre proof without unfolding the equivalence. These equations specify the interface needed when quotient classes are used as input to further constructions. They do not make inflation surjective onto all ambient H¹, do not impose a group law on H¹, and do not supply reverse-inclusion transitions, filtered colimits, representability or local Selmer conditions.

### Joint continuity of the fixed-subgroup quotient action

The native action (G/N) × U^N → U^N, ([g],u) ↦ g•u, is jointly continuous. Thus the native fixed subgroup with its induced topology has ContinuousSMul for G/N, without a separate quotient-action continuity input.

Proposed declaration: TauCeti.NonabelianCohomology.quotientFixedContinuousSMul.

Hypotheses:

- G is a group with a topology and separately continuous multiplication; in particular every topological group satisfies this assumption.
- U is a group with a topology and a jointly continuous G-action by group automorphisms.
- N is an arbitrary normal subgroup. Use the native quotient topology on G/N and the native topology and quotient action on the fixed subgroup U^N. No compactness, open/closed N, discrete/finite coefficients or commutativity is assumed.

Proof route:

1. QuotientGroup.isOpenQuotientMap_mk and IsOpenQuotientMap.id, followed by IsOpenQuotientMap.prodMap, provide the open quotient map G × U^N → (G/N) × U^N.
2. Apply IsOpenQuotientMap.continuous_comp_iff. The native quotient-action coercion law identifies the lifted action included in U with (g,u) ↦ g•u.
3. Use continuous_induced_rng for the native subgroup topology. Continuous.smul applied to continuous_fst and continuous_subtype_val composed with continuous_snd proves continuity of this ambient map in both arguments.

Tests:

- TauCeti.NonabelianCohomology.quotientFixedContinuousSMul.test_joint (compatibility): Under the stated hypotheses the actual map (G/N) × U^N → U^N sending (q,u) to q•u is continuous in the native product topology.

Acceptance:

- N need not be closed; no Hausdorffness of G/N is asserted.
- No topology on U is changed to the discrete topology; continuity is joint, not just fixed-vector continuity.

Dependencies: mathlib:FixedPoints.subgroup; mathlib:MulAction.coe_quotient_smul_fixedPoints; mathlib:ContinuousSMul; mathlib:continuous_subtype_val; mathlib:Continuous.comp; mathlib:QuotientGroup.isOpenQuotientMap_mk; mathlib:IsOpenQuotientMap.prodMap; mathlib:IsOpenQuotientMap.id; mathlib:IsOpenQuotientMap.continuous_comp_iff; mathlib:continuous_induced_rng; mathlib:Continuous.smul; mathlib:continuous_fst; mathlib:continuous_snd.

### Inflation preserves the distinguished cohomology class

Inflation sends the distinguished class of H¹(G/N,U^N) to the distinguished class of H¹(G,U). This promotes the existing inflation API without changing its signature.

Proposed declaration: TauCeti.NonabelianCohomology.H1.inflate_one.

Hypotheses:

- G is a group endowed with a topology. U is a topological group with a group-automorphism action of G whose joint action is continuous. H¹ is the actual twisted-conjugation orbit set of continuous nonabelian cocycles, with the class of the constant identity cocycle as base point.
- N is any normal subgroup of G; G/N has the native quotient topology and acts by the native multiplicative action on the existing subgroup U^N. The joint quotient action on U^N is explicitly assumed continuous. No compactness, openness/closedness of N, finite/discrete coefficient group or commutativity assumption is imposed.

Proof route:

1. Represent the distinguished class by the actual identity cocycle. Use the inflation representative API and quotient-cocycle-inflation-one, then identify the resulting identity-cocycle class with the distinguished point by definition.

Acceptance:

- The equality concerns the native gauge-orbit classes and the same normal subgroup.

Dependencies: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation; AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation-one; AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1.

### Inflation equivalence with the neutral restriction fibre

Construct the native pointed-set equivalence H¹(G/N,U^N) ≃ {a ∈ H¹(G,U) | res_N(a)=1}. Its forward map is exactly a ↦ (inflate_N(a), res_N(inflate_N(a))=1), and its inverse recovers the unique same-N source class. Joint continuity of the quotient action follows from quotient-fixed-action-continuity, not an extra hypothesis. This is not an equivalence with all of H¹(G,U), nor a group isomorphism.

Proposed declaration: TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.

Hypotheses:

- G is a group with a topology and separately continuous multiplication; in particular every topological group satisfies this assumption.
- U is a group with a topology and a jointly continuous G-action by group automorphisms.
- N is an arbitrary normal subgroup. Use the native quotient topology on G/N and the native topology and quotient action on the fixed subgroup U^N. No compactness, open/closed N, discrete/finite coefficients or commutativity is assumed.
- U is a topological group; this makes the actual coefficient gauge action on continuous cocycles available.

Proof route:

1. Provide the native quotient action's ContinuousSMul by quotient-fixed-action-continuity locally, without a global overlapping instance; the fixed subgroup inherits its native topological group structure.
2. Use h1-restriction-inflation to define actual inflation into the neutral-fibre subtype. h1-inflation-injective proves injectivity after forgetting the subtype proof.
3. h1-inflation-restriction-image provides an actual source class for every neutral restricted class; subtype extensionality gives surjectivity. Apply Equiv.ofBijective with this specified forward map.
4. Forward evaluation is definitional. Equiv.symm_apply_apply and Equiv.apply_symm_apply give the inverse APIs; forgetting the subtype proof yields their H¹ equalities. h1-inflation-one proves pointedness.

API:

- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv_apply: For every a ∈ H¹(G/N,U^N), the underlying ambient class of inflateNeutralEquiv_N(a) is inflate_N(a).
- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv_symm_inflate: For every a ∈ H¹(G/N,U^N), the inverse at the neutral-fibre element defined by inflate_N(a) equals a.
- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv_apply_symm: For every b in the neutral restriction fibre, inflating its inverse image gives the underlying class of b.
- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv_one: inflateNeutralEquiv_N sends the distinguished source class to the distinguished ambient class with its proved neutral restriction.

Tests:

- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.test_one (degenerate): The forward equivalence sends the distinguished quotient class to the neutral-fibre element with underlying class 1.
- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.test_representative (compatibility): For each actual quotient cocycle d, the underlying class of inflateNeutralEquiv_N([d]) is the genuine class [inflate_N(d)].
- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.test_target_round_trip (characterisation): For an actual class a with res_N(a)=1, inflating the inverse image of (a,res_N(a)=1) gives a.
- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.test_nonneutral (non-example): Each quotient class a≠1 maps to an ambient class different from 1. The inherited kernel-checked discrete S₂→S₃ example supplies a genuinely nonneutral source class; collapsing the source to 1 fails this property.
- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.test_gauge_neutral (compatibility): For every x∈U the inverse at the neutral-fibre class represented by the genuine coboundary x·1 is the distinguished quotient class. The representing cocycle need not literally be 1, as the inherited S₃ conjugation example exhibits.

Acceptance:

- The inverse returns a class, not a preferred gauge element or cocycle representative.
- No surjectivity of inflation onto all of H¹(G,U) is asserted.

Dependencies: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-fixed-action-continuity; AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-one; AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation; AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-injective; AnabelianGeometryAndNonabelianChabauty:NC.3/h1-restriction; AnabelianGeometryAndNonabelianChabauty:NC.3/h1-restriction-inflation; AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-restriction-image; AnabelianGeometryAndNonabelianChabauty:NC.3/h1-gauge-class; mathlib:Equiv.ofBijective; mathlib:Equiv.apply_symm_apply; mathlib:Equiv.symm_apply_apply; mathlib:Equiv.injective.

### Source and library boundary

Kim's arXiv:math/0409456v1 §1, printed pp.5–7, supplies the motivating continuous cocycle and gauge definitions (short verification excerpt: “continuous 1-cocycles”). The continuity adapter and pointed equivalence are authored deductions from these definitions and the listed native library and packet statements, not numbered results attributed to Kim. The standard open-quotient, induced-topology and native equivalence theories are imported from Mathlib, not planned anew. The prior additive fixed-point and inflation interfaces are not declared identical to these multiplicative carriers; a genuine additive comparison remains a separate obligation.

The quotient-action continuity conclusion applies in the separately-continuous-multiplication scope. Earlier results stated for a group carrying an arbitrary topology retain their explicit quotient-action continuity assumption outside that scope. Source-proof closure for representability, points of topological unipotent groups, the geometric K(π,1) key definition, Chen and BDMTV additions, and existing supplier requests is unchanged. No additional planet is needed for these supporting declarations: the existing eleven planet choices and all seven stage targets remain in place.


## NC.3 — finite-quotient transitions and the inflation colimit

Let G be a compact topological group and U a discrete group with a jointly continuous action of G by automorphisms. For every open normal N, the native fixed subgroup U^N has its native G/N-action. The diagram is indexed by reverse inclusion: N→M means M≤N. Its value at N is H¹(G/N,U^N). The comparison sends the native colimit class of a quotient cocycle to the class of its actual inflation.

The cocycle transition is obtained by inflating from N and descending to M. Thus its value at [g]_M is the inclusion of d([g]_N). Inflation of the transitioned cocycle equals inflation of the original. That identity descends through the actual gauge-orbit quotients, using same-subgroup inflation injectivity to establish well-definedness. The identity and composition laws give a native functor, and the comparison maps give a native cocone with apex H¹(G,U).

Every ambient class has a finite-level representative: choose an actual continuous cocycle, find an open normal subgroup in its identity fibre by the compact/discrete killing lemma, and descend the cocycle itself. If two finite-level classes inflate equally, transition both to the intersection of their subgroups. Their inflations are equal, so same-subgroup injectivity makes the transitioned classes equal. Mathlib’s existing filtered-colimit criterion now proves universality of this specified cocone. Native colimit uniqueness supplies the equivalence E, with E(ι_N(a))=inflate_N(a). The inverse at an inflated class is its native colimit inclusion, and all distinguished classes map to 1.

Only the surjectivity and finite-quotient conclusions use compactness/discreteness. Cocycle transitions work for arbitrary normal subgroups of groups with topologies. Class transitions require the continuous gauge actions; separately continuous multiplication on G supplies quotient-action continuity. Neither U’s commutativity nor finiteness is imposed. There is no group structure asserted on H¹, no assumption that the G-action on all U factors through G/N, and no assertion that p-adic unipotent coefficients are discrete.

Poonen’s §1.3.5, printed pp.11–12, motivates the finite-to-infinite passage; Kim’s §1 fixes the continuous cocycle/gauge convention. The detailed compact/discrete argument is an authored deduction from the specified interfaces. TauCeti already has the additive transition and colimit in ContCohomology.FiniteQuotient. Those are existing abelian mathematics; the canonical cocycle conversion and commuting comparison of the two transition/colimit systems remain required here. Generic additive cohomology is not rebuilt.

The open [Mathlib nonabelian cohomology PR #31613](https://github.com/leanprover-community/mathlib4/pull/31613), inspected at 9dc1e337689fa7ba4fefa52b4874660bdd3a3619, develops algebraic cocycles and gauge classes in additive notation. It is not part of this baseline and does not impose continuity in the inspected definitions. Its API is the upstream comparison target upon adoption; the continuous-carrier bridge must carry both the cocycle law and gauge convention.

The tests use the actual carriers throughout. In particular, for discrete S₂ acting trivially on S₃, the homomorphism taking the nonidentity element to (01) gives a nonneutral H¹ class: every coboundary for a trivial action is identity. The native colimit therefore has distinct preimages of this class and the distinguished class. A singleton substitute for the colimit fails this test.

### Injectivity of actual quotient-cocycle inflation

Declaration: TauCeti.NonabelianCohomology.Z1.inflate_injective. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation-injective.

For every normal N, inflation Z¹(G/N,U^N)→Z¹(G,U) is injective.

Hypotheses:

- G and U are groups with topologies, with a G-action on U by group automorphisms. Use the actual continuous ordered cocycles c(gh)=c(g)(g•c(h)), native quotient topologies and native fixed coefficient subgroups.
- N is a normal subgroup of G. No compactness, openness/closedness, discrete coefficients, continuity of the action or commutativity is required for cocycle inflation injectivity.

Construction or proof:

1. If two cocycles have equal inflations, descend both to N and apply the existing descend-inflate identity. This promotes the inherited API without changing its signature or adding a second declaration.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/descend-inflated-cocycle.

Sources: Kim, arXiv:math/0409456v1 §1, pp.5–7 (definitions); Poonen, §1.3.5, pp.11–12 (finite-to-infinite motivation). The proof above is a deduction from the named inputs.

### Reverse-inclusion transition of quotient cocycles

Declaration: TauCeti.NonabelianCohomology.Z1.transition. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-transition.

For M≤N, construct tᴺ_M:Z¹(G/N,U^N)→Z¹(G/M,U^M) by descending inflate_N(d) to M. On representatives its underlying U-value at [g]_M is d([g]_N). Thus it combines pullback along G/M→G/N with inclusion U^N→U^M.

Hypotheses:

- G and U are groups with topologies, with a G-action on U by group automorphisms. Use the actual continuous ordered cocycles c(gh)=c(g)(g•c(h)), native quotient topologies and native fixed coefficient subgroups.
- M≤N are normal subgroups of G. Neither openness/closedness nor compactness, commutativity or discreteness is required for cocycle transitions.

Construction or proof:

1. inflate_N(d) is identically 1 on N, hence on M. Apply the existing actual descent to M; its representative formula gives the stated value.
2. Inflating the result recovers inflate_N(d). Same-subgroup cocycle injectivity then proves identity, composition, preservation of the identity cocycle and injectivity. No choice of quotient representative or new coefficient action is introduced.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-descent, AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/inflate-descended-cocycle, AnabelianGeometryAndNonabelianChabauty:NC.3/descend-inflated-cocycle, AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation-injective, AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-inflation-one.

API:

- TauCeti.NonabelianCohomology.Z1.transition_apply: The underlying U-value of tᴺ_M(d) at [g]_M is d([g]_N).
- TauCeti.NonabelianCohomology.Z1.inflate_transition: inflate_M(tᴺ_M(d))=inflate_N(d).
- TauCeti.NonabelianCohomology.Z1.transition_refl: tᴺ_N(d)=d.
- TauCeti.NonabelianCohomology.Z1.transition_trans: For P≤M≤N, tᴹ_P(tᴺ_M(d))=tᴺ_P(d).
- TauCeti.NonabelianCohomology.Z1.transition_one: tᴺ_M(1)=1.
- TauCeti.NonabelianCohomology.Z1.transition_injective: Each transition on actual quotient cocycles is injective.

Tests:

- TauCeti.NonabelianCohomology.Z1.transition.test_one: The identity quotient cocycle maps to the identity cocycle.
- TauCeti.NonabelianCohomology.Z1.transition.test_value: At the class of each actual g∈G, the underlying value is exactly d([g]_N). Reversing the subgroup inclusion or forgetting the fixed coefficient target fails this interface.
- TauCeti.NonabelianCohomology.Z1.transition.test_identity: The self-transition fixes every actual cocycle, including nonidentity ones.

Sources: Kim, arXiv:math/0409456v1 §1, pp.5–7 (definitions); Poonen, §1.3.5, pp.11–12 (finite-to-infinite motivation). The proof above is a deduction from the named inputs.

### Inflation commutes with cocycle transition

Declaration: TauCeti.NonabelianCohomology.Z1.inflate_transition. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-transition-inflation.

For M≤N, inflate_M(tᴺ_M(d))=inflate_N(d).

Hypotheses:

- G and U are groups with topologies, with a G-action on U by group automorphisms. Use the actual continuous ordered cocycles c(gh)=c(g)(g•c(h)), native quotient topologies and native fixed coefficient subgroups.
- M≤N are normal subgroups of G. Neither openness/closedness nor compactness, commutativity or discreteness is required for cocycle transitions.

Construction or proof:

1. Apply recovery after actual descent to the inflated N-level cocycle. This promotes the transition API for use in orbit descent.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-transition, AnabelianGeometryAndNonabelianChabauty:NC.3/inflate-descended-cocycle.

Sources: Kim, arXiv:math/0409456v1 §1, pp.5–7 (definitions); Poonen, §1.3.5, pp.11–12 (finite-to-infinite motivation). The proof above is a deduction from the named inputs.

### Reverse-inclusion transition on nonabelian cohomology

Declaration: TauCeti.NonabelianCohomology.H1.transition. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-transition.

For M≤N, construct the pointed map tᴺ_M:H¹(G/N,U^N)→H¹(G/M,U^M) sending [d] to [tᴺ_M(d)]. These are actual gauge-orbit sets; no group law on H¹ is imposed.

Hypotheses:

- G and U are groups with topologies, with a G-action on U by group automorphisms. Use the actual continuous ordered cocycles c(gh)=c(g)(g•c(h)), native quotient topologies and native fixed coefficient subgroups.
- M≤N are normal subgroups of G. Neither openness/closedness nor compactness, commutativity or discreteness is required for cocycle transitions.
- U is a topological group. The joint ambient G-action and joint native quotient actions on U^M and U^N are continuous. For a third subgroup P≤M the same continuity is required at P. Separately continuous multiplication on G supplies all quotient-action instances via quotient-fixed-action-continuity.

Construction or proof:

1. Lift the cocycle transition through the native orbit quotient. For gauge-equivalent representatives, their M-level images have equal inflations by cocycle-transition-inflation and well-defined N-level inflation. Same-M H¹ inflation injectivity makes the images equal.
2. The representative formula is definitional. Identity, composition and injectivity follow by applying same-subgroup inflation injectivity. Basepoint preservation uses inflation of the identity class.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-transition, AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-transition-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-injective, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-orbit-criterion, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-one.

API:

- TauCeti.NonabelianCohomology.H1.transition_mk: tᴺ_M([d])=[tᴺ_M(d)].
- TauCeti.NonabelianCohomology.H1.inflate_transition: inflate_M(tᴺ_M(a))=inflate_N(a).
- TauCeti.NonabelianCohomology.H1.transition_refl: tᴺ_N(a)=a.
- TauCeti.NonabelianCohomology.H1.transition_trans: For P≤M≤N, tᴹ_P(tᴺ_M(a))=tᴺ_P(a).
- TauCeti.NonabelianCohomology.H1.transition_one: The distinguished class maps to the distinguished class.
- TauCeti.NonabelianCohomology.H1.transition_injective: Each pointed-set transition is injective.

Tests:

- TauCeti.NonabelianCohomology.H1.transition.test_one: tᴺ_M(1)=1.
- TauCeti.NonabelianCohomology.H1.transition.test_gauge: For every x∈U^N and d, transitioning [x·d] gives [tᴺ_M(d)].
- TauCeti.NonabelianCohomology.H1.transition.test_nonneutral: For every a≠1, tᴺ_M(a)≠1. The actual S₂→S₃ transposition class supplies a nonneutral input; collapsing classes to the basepoint fails.

Sources: Kim, arXiv:math/0409456v1 §1, pp.5–7 (definitions); Poonen, §1.3.5, pp.11–12 (finite-to-infinite motivation). The proof above is a deduction from the named inputs.

### Inflation commutes with cohomology transition

Declaration: TauCeti.NonabelianCohomology.H1.inflate_transition. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-transition-inflation.

For M≤N and every class a, inflate_M(tᴺ_M(a))=inflate_N(a).

Hypotheses:

- G and U are groups with topologies, with a G-action on U by group automorphisms. Use the actual continuous ordered cocycles c(gh)=c(g)(g•c(h)), native quotient topologies and native fixed coefficient subgroups.
- M≤N are normal subgroups of G. Neither openness/closedness nor compactness, commutativity or discreteness is required for cocycle transitions.
- U is a topological group. The joint ambient G-action and joint native quotient actions on U^M and U^N are continuous. For a third subgroup P≤M the same continuity is required at P. Separately continuous multiplication on G supplies all quotient-action instances via quotient-fixed-action-continuity.

Construction or proof:

1. Choose a representative and apply the cocycle identity, then take its actual gauge class.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-transition, AnabelianGeometryAndNonabelianChabauty:NC.3/cocycle-transition-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation.

Sources: Kim, arXiv:math/0409456v1 §1, pp.5–7 (definitions); Poonen, §1.3.5, pp.11–12 (finite-to-infinite motivation). The proof above is a deduction from the named inputs.

### Identity law for quotient cohomology transition

Declaration: TauCeti.NonabelianCohomology.H1.transition_refl. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-transition-identity.

For every class a at N, tᴺ_N(a)=a.

Hypotheses:

- G and U are groups with topologies, with a G-action on U by group automorphisms. Use the actual continuous ordered cocycles c(gh)=c(g)(g•c(h)), native quotient topologies and native fixed coefficient subgroups.
- M≤N are normal subgroups of G. Neither openness/closedness nor compactness, commutativity or discreteness is required for cocycle transitions.
- U is a topological group. The joint ambient G-action and joint native quotient actions on U^M and U^N are continuous. For a third subgroup P≤M the same continuity is required at P. Separately continuous multiplication on G supplies all quotient-action instances via quotient-fixed-action-continuity.

Construction or proof:

1. Both classes have the same N-level inflation by the promoted compatibility. Apply its injectivity.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-transition-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-injective.

Sources: Kim, arXiv:math/0409456v1 §1, pp.5–7 (definitions); Poonen, §1.3.5, pp.11–12 (finite-to-infinite motivation). The proof above is a deduction from the named inputs.

### Composition law for quotient cohomology transition

Declaration: TauCeti.NonabelianCohomology.H1.transition_trans. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-transition-composition.

For P≤M≤N, tᴹ_P(tᴺ_M(a))=tᴺ_P(a).

Hypotheses:

- G and U are groups with topologies, with a G-action on U by group automorphisms. Use the actual continuous ordered cocycles c(gh)=c(g)(g•c(h)), native quotient topologies and native fixed coefficient subgroups.
- M≤N are normal subgroups of G. Neither openness/closedness nor compactness, commutativity or discreteness is required for cocycle transitions.
- U is a topological group. The joint ambient G-action and joint native quotient actions on U^M and U^N are continuous. For a third subgroup P≤M the same continuity is required at P. Separately continuous multiplication on G supplies all quotient-action instances via quotient-fixed-action-continuity.

Construction or proof:

1. Inflate both sides from P. Use the promoted compatibility twice on the left and once on the right, then same-P injectivity.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-transition-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-injective.

Sources: Kim, arXiv:math/0409456v1 §1, pp.5–7 (definitions); Poonen, §1.3.5, pp.11–12 (finite-to-infinite motivation). The proof above is a deduction from the named inputs.

### The reverse-inclusion quotient cohomology diagram

Declaration: TauCeti.NonabelianCohomology.H1.quotientDiagram. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-quotient-diagram.

Construct the native functor F from the order dual of OpenNormalSubgroup G to types, with F(N)=H¹(G/N,U^N) and F(N→M)=tᴺ_M. Identity and composition are the promoted transition laws.

Hypotheses:

- G is a group with a topology and separately continuous multiplication. U is a topological group with a jointly continuous G-action by automorphisms.
- Index by the order dual of native open normal subgroups: an arrow N→M means M≤N. At N use H¹(G/N,U^N), not coefficients U unless N acts trivially. No compactness or discreteness is required for the diagram or inflation cocone.

Construction or proof:

1. Use the native preorder category on the order dual. Its arrow N→M is exactly M≤N.
2. Supply quotient-action continuity locally from the existing lemma. Set object and map fields to the actual H¹ carrier and transition; fill the functor laws from their promoted declarations.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-transition, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-transition-identity, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-transition-composition, AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-fixed-action-continuity.

API:

- TauCeti.NonabelianCohomology.H1.quotientDiagram_map_apply: The diagram map for N→M applied to a is exactly tᴺ_M(a).
- TauCeti.NonabelianCohomology.H1.quotientDiagram_obj: The object at N is exactly H¹(G/N,U^N).
- TauCeti.NonabelianCohomology.H1.quotientDiagram_map_id: The identity diagram arrow fixes each class.

Tests:

- TauCeti.NonabelianCohomology.H1.quotientDiagram.test_identity: The identity arrow acts as the identity on every quotient class.
- TauCeti.NonabelianCohomology.H1.quotientDiagram.test_composition: On every class, F(f≫g)=F(g)∘F(f).
- TauCeti.NonabelianCohomology.H1.quotientDiagram.test_coefficients: The object at N is exactly H¹(G/N,U^N), with the native fixed subgroup, not H¹(G/N,U) with an assumed action.

Sources: Kim, arXiv:math/0409456v1 §1, pp.5–7 (definitions); Poonen, §1.3.5, pp.11–12 (finite-to-infinite motivation). The proof above is a deduction from the named inputs.

### The native inflation cocone

Declaration: TauCeti.NonabelianCohomology.H1.inflationCocone. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-cocone.

Construct a native cocone on F with apex H¹(G,U) whose leg at N is exactly inflate_N. Its naturality is inflate_M∘tᴺ_M=inflate_N.

Hypotheses:

- G is a group with a topology and separately continuous multiplication. U is a topological group with a jointly continuous G-action by automorphisms.
- Index by the order dual of native open normal subgroups: an arrow N→M means M≤N. At N use H¹(G/N,U^N), not coefficients U unless N acts trivially. No compactness or discreteness is required for the diagram or inflation cocone.

Construction or proof:

1. Take the actual ambient H¹ as apex and inflation as each leg. The promoted compatibility proves the cocone naturality equation on every class.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-quotient-diagram, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-transition-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation.

API:

- TauCeti.NonabelianCohomology.H1.inflationCocone_app: The leg at N applied to a is inflate_N(a).
- TauCeti.NonabelianCohomology.H1.inflationCocone_pt: The apex is the actual ambient H¹(G,U).
- TauCeti.NonabelianCohomology.H1.inflationCocone_naturality: For each arrow N→M, its transition followed by the M-leg equals the N-leg on each class.

Tests:

- TauCeti.NonabelianCohomology.H1.inflationCocone.test_representative: At [d], the cocone leg is the actual class [inflate_N(d)].
- TauCeti.NonabelianCohomology.H1.inflationCocone.test_one: Every leg sends the distinguished quotient class to the distinguished ambient class.
- TauCeti.NonabelianCohomology.H1.inflationCocone.test_commutes: Every transition followed by its target leg equals its source leg on every input class.

Sources: Kim, arXiv:math/0409456v1 §1, pp.5–7 (definitions); Poonen, §1.3.5, pp.11–12 (finite-to-infinite motivation). The proof above is a deduction from the named inputs.

### Every compact-discrete class comes from a finite quotient

Declaration: TauCeti.NonabelianCohomology.H1.exists_quotient_class. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-finite-quotient-surjectivity.

For every a∈H¹(G,U), there exist an open normal N and b∈H¹(G/N,U^N) with inflate_N(b)=a.

Hypotheses:

- G is a compact topological group, with no total-disconnectedness or Hausdorff assumption required by this proof. U is a discrete group with a jointly continuous G-action by automorphisms; U need not be finite or abelian.
- The diagram and cocone are the specified native ones on reverse inclusion of all open normal subgroups. Compactness makes every G/N finite. This assertion does not replace the non-discrete topologies used for unipotent p-adic coefficients.

Construction or proof:

1. Choose an actual continuous cocycle representative c of a.
2. The existing compact/discrete normal-killing theorem supplies N with c identically 1 on N. Descend c to G/N with values in U^N. Inflation recovers c literally, so its orbit class inflates to a. No coboundary correction is needed in this step.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-orbit-criterion, AnabelianGeometryAndNonabelianChabauty:NC.3/discrete-normal-killing, AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-cocycle-descent, AnabelianGeometryAndNonabelianChabauty:NC.3/inflate-descended-cocycle, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-fixed-action-continuity.

Sources: Kim, arXiv:math/0409456v1 §1, pp.5–7 (definitions); Poonen, §1.3.5, pp.11–12 (finite-to-infinite motivation). The proof above is a deduction from the named inputs.

### Filteredness of reverse-inclusion open normal subgroups

Declaration: TauCeti.NonabelianCohomology.H1.quotientIndex_isFiltered. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-quotient-index-filtered.

The native preorder category on the order dual of OpenNormalSubgroup G is filtered.

Hypotheses:

- G is a group with a topology; no continuity, compactness or coefficient group is required.

Construction or proof:

1. The top subgroup is an open normal subgroup, so the indexing type is nonempty. Its existing infimum gives N∩M and the two reverse-inclusion arrows. Parallel arrows in a preorder agree. Apply the existing semilattice-sup filteredness instance to the order dual; do not construct a competing category.

Prerequisites: mathlib:OpenNormalSubgroup.instSemilatticeInfOpenNormalSubgroup, mathlib:CategoryTheory.IsFiltered.

Sources: Kim, arXiv:math/0409456v1 §1, pp.5–7 (definitions); Poonen, §1.3.5, pp.11–12 (finite-to-infinite motivation). The proof above is a deduction from the named inputs.

### Nonabelian finite-quotient colimit theorem

Declaration: TauCeti.NonabelianCohomology.H1.inflationCoconeIsColimit. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-colimit.

The specified inflation cocone is a colimit of F in the native category of types. For any cocone with apex X there is a unique map H¹(G,U)→X whose composite with every inflate_N is the specified N-leg.

Hypotheses:

- G is a compact topological group, with no total-disconnectedness or Hausdorff assumption required by this proof. U is a discrete group with a jointly continuous G-action by automorphisms; U need not be finite or abelian.
- The diagram and cocone are the specified native ones on reverse inclusion of all open normal subgroups. Compactness makes every G/N finite. This assertion does not replace the non-discrete topologies used for unipotent p-adic coefficients.

Construction or proof:

1. Apply the native isColimitOf criterion to the actual inflation cocone. Its surjectivity input is h1-finite-quotient-surjectivity.
2. For a at N and b at M with equal ambient inflations, take K=N∩M. The two transitioned classes at K have equal inflations by h1-transition-inflation, so they are equal by same-K inflation injectivity.
3. The native criterion constructs the universal map using a finite-level representative; common refinement proves independence and uniqueness. This proves universality of the named maps, not merely existence of an abstract bijection.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-cocone, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-finite-quotient-surjectivity, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-quotient-index-filtered, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-transition-inflation, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-injective, mathlib:CategoryTheory.Limits.Types.FilteredColimit.isColimitOf, mathlib:OpenNormalSubgroup.instSemilatticeInfOpenNormalSubgroup.

Sources: Kim, arXiv:math/0409456v1 §1, pp.5–7 (definitions); Poonen, §1.3.5, pp.11–12 (finite-to-infinite motivation). The proof above is a deduction from the named inputs.

### The inflation-induced finite-quotient equivalence

Declaration: TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv. Node: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-finite-quotient-equivalence.

Construct E:colim_N H¹(G/N,U^N) ≃ H¹(G,U) from the native colimit and the proved inflation cocone. Specify E(ι_N(a))=inflate_N(a), E⁻¹(inflate_N(a))=ι_N(a), and E(ι_N(1))=1 for every N.

Hypotheses:

- G is a compact topological group, with no total-disconnectedness or Hausdorff assumption required by this proof. U is a discrete group with a jointly continuous G-action by automorphisms; U need not be finite or abelian.
- The diagram and cocone are the specified native ones on reverse inclusion of all open normal subgroups. Compactness makes every G/N finite. This assertion does not replace the non-discrete topologies used for unipotent p-adic coefficients.

Construction or proof:

1. Use the library-generated colimit dual of native limit uniqueness to compare the chosen colimit with the actual inflation cocone. Convert that native type isomorphism to an equivalence with Iso.toEquiv.
2. The generated cocone-leg compatibility fixes the forward map at every ι_N(a). Apply the native equivalence inverse law to get the inverse formula. Basepoint preservation follows from h1-inflation-one.
3. The indexed baseline entries name the source declarations whose to_dual attributes generate IsColimit.coconePointUniqueUpToIso, its leg compatibility and colimit.isColimit; the generated declarations were exercised by the checked proof.

Prerequisites: AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-colimit, AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-one, mathlib:CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso, mathlib:CategoryTheory.Limits.IsLimit.conePointUniqueUpToIso_inv_comp, mathlib:CategoryTheory.Limits.limit.isLimit, mathlib:CategoryTheory.Iso.toEquiv, mathlib:Equiv.symm_apply_apply, mathlib:Equiv.apply_symm_apply.

API:

- TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv_ι: E(ι_N(a))=inflate_N(a).
- TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv_symm_inflate: E⁻¹(inflate_N(a))=ι_N(a).
- TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv_one: E(ι_N(1))=1 for every N. These images define the common distinguished colimit class.

Tests:

- TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv.test_target_round_trip: For every actual ambient class a, E(E⁻¹(a))=a.
- TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv.test_one: E maps the distinguished class coming from any level to 1.
- TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv.test_inflated_inverse: The inverse at an inflated class is exactly its native colimit inclusion.
- TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv.test_nonneutral: For a≠1 at any quotient level, E(ι_N(a))≠1.
- TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv.test_transposition: Give S₂ and S₃ discrete topologies and let S₂ act trivially on S₃. The cocycle sending the nonidentity element of S₂ to (01)∈S₃ defines a class c≠1. In the actual native colimit E⁻¹([c])≠E⁻¹(1), as checked by evaluating a hypothetical coboundary at the transposition.

Sources: Kim, arXiv:math/0409456v1 §1, pp.5–7 (definitions); Poonen, §1.3.5, pp.11–12 (finite-to-infinite motivation). The proof above is a deduction from the named inputs.

Required continuation: Reverse-inclusion cocycle and H¹ transitions, their native type-valued diagram, actual inflation cocone and compact/discrete finite-quotient equivalence are specified. The colimit requires discrete U and does not extend the unipotent p-adic topology by assumption. Genuine additive cocycle conversion, compatibility with the existing TauCeti additive transition/colimit, representability, local conditions, inherited API/granularity and all geometric source/supplier obligations remain open. All existing stage scope, reserved étale K(π,1) contracts, planets, requests and source inventories are retained.
