# Automorphic bundles: coefficients and left/right conventions

**Partial mathematical checkpoint for `BP-AutomorphicBundles--B0`.** This document develops the algebraic convention comparison inside `AutomorphicBundles:B4`. It accompanies `research/blueprint/suggested/AutomorphicBundles--B0.lean`. It does not replace the campaign roadmap or the accepted three-node decomposition, and it does not close any of the eight stages assigned to this part. A JSON blueprint packet has not been produced in this checkpoint.

The part's scope is `AutomorphicBundles:B0`, `B1`, `B1.general`, `B2`, `B2.general`, `B3`, `B3.general`, and `B4`. B5 has its own part. The objects below are functions and linear automorphisms, not sheaves on Shimura varieties. The geometric associated-bundle functor, canonical torsors, coefficient-field descent, holomorphy, and boundary growth are separate obligations, identified below.

The library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. In particular, the existing `SlashAction` carrier and its right-action law are inputs, not new definitions or theorem targets. The new construction gives one explicit way to supply that carrier's fields.

## 1. Objects and conventions

Let G be a monoid acting on the left on a set X. Let R be a semiring and V an R-semimodule; V is an additive commutative monoid. Let B be a set of weight indices. No topology, finite-dimensionality, field hypothesis, or finite-generation hypothesis is required in this section.

A coefficient family is a function J assigning an R-linear automorphism J(k,g,x) of V to each k in B, g in G and x in X. The required conditions are

\[
J(k,1,x)=1,
\qquad
J(k,gh,x)=J(k,g,hx)\circ J(k,h,x).
\]

Composition is ordinary function composition: the rightmost automorphism acts first. These conditions are explicit inputs to the adapter. There is no new bundled coefficient type in this checkpoint. Thus no parallel representation carrier, analytic sheaf, or geometric torsor is introduced.

For a function f:X→V, set

\[
(T_{k,g}f)(x)=J(k,g,x)^{-1}\bigl(f(gx)\bigr).
\]

The base action is left-handed; the induced action on functions is right-handed:

\[
T_{k,gh}=T_{k,h}\circ T_{k,g}.
\]

This is exactly the orientation of Mathlib's `SlashAction.slash_mul` [M1]. It is not an action obtained by silently replacing gx with g⁻¹x. The distinct operation of turning a left base action into a right base action is treated in Section 4.

Mathlib's `LinearEquiv.trans` applies its first argument and then its second. Consequently the displayed cocycle condition is expressed in the prototype by taking the trans-composition of J(k,h,x) with J(k,g,hx), in that order [M2]. The multiplication on linear automorphisms instead satisfies (a*b)(v)=a(b(v)) [M3]. The distinction is made observable by the noncommuting tests in Section 6.

## 2. The convention adapter

### C1. `AutomorphicBundles.slashActionOfAutomorphyFactor`

**Construction.** For the objects and hypotheses in Section 1, construct an instance of the existing indexed right-action structure on the additive monoid of functions X→V. Its map is T, its identity is the identity operator, and its addition and zero laws are pointwise.

**Proof outline.** Invert the cocycle identity using `LinearEquiv.trans_symm` [M2]. At a point x this gives

\[
\begin{aligned}
T_{k,gh}f(x)
 &=J(k,h,x)^{-1}\left(J(k,g,hx)^{-1}(f(g(hx)))\right)\\
 &=T_{k,h}(T_{k,g}f)(x).
\end{aligned}
\]

The equation g(hx)=(gh)x is the left-action law. The identity follows from the normalization of J. The zero and addition laws follow because an inverse linear equivalence preserves zero and addition. Extensionality turns the pointwise equalities into function equalities. No descent, localization, analytic theorem or existence of a section is used.

**Prerequisites.** Existing `SlashAction`, `LinearEquiv.trans`, `LinearEquiv.trans_symm`, and the evaluation, inverse-cancellation, zero and addition laws of linear equivalences [M1–M3]. The group-action axioms and function extensionality supply the remaining routine steps. The construction produces the right-action law required by `SlashAction`; it does not introduce another theorem asserting the already existing class law.

**Uses.** The classical transformation-law comparison in B4 must agree with Mathlib's slash action, including its order of composition. B0's eventual equivariant-section comparison can consume this functional calculation after its geometric torsor and coefficient maps have been supplied. Lan's scalar-versus-vector discussion motivates retaining noncommutative linear coefficients rather than testing only scalar factors [L]. Neither use makes this construction a substitute for the geometric functor.

### C1 API

The prototype specifies five API entries. The first two are also the separately named leaves L1 and L2, since other statements consume them.

| Declaration suffix | Role | Mathematical contract |
| --- | --- | --- |
| `map_apply` | Evaluation | The action map evaluated at x is J(k,g,x)⁻¹(f(gx)). |
| `invariant_iff` | Characterisation | Invariance under every g is equivalent to the original transformation law, as stated in L2. |
| `map_smul` | Linearity | T(k,g)(r·f)=r·T(k,g)f for every r in R. |
| `congr` | Extensionality | Pointwise equal coefficient families give equal `SlashAction` structures, regardless of the proofs chosen for their laws. |
| `map_of_trivial` | Compatibility | With every J equal to the identity, the operator is precomposition f↦(x↦f(gx)). |

All suffixes above extend `AutomorphicBundles.slashActionOfAutomorphyFactor_`. Linearity is a property of this particular R-linear construction, not of every arbitrary `SlashAction`. For `congr`, coefficient extensionality identifies J and K; the remaining identity and composition witnesses are proposition-valued. The trivial-coefficient formula follows by evaluation of the identity automorphism.

## 3. Evaluation and invariance

### L1. `AutomorphicBundles.slashActionOfAutomorphyFactor_map_apply`

**Statement.** For any k, g, f and x under C1's hypotheses, the constructed action has the pointwise value specified in Section 1.

**Proof and dependencies.** This is the defining equation of C1. Its purpose is to expose the convention without making users unfold the full right-action record. It is the prerequisite of L2 and of the concrete scalar comparison.

### L2. `AutomorphicBundles.slashActionOfAutomorphyFactor_invariant_iff`

**Statement.** Fix k and f. Then

\[
(\forall g,\ T_{k,g}f=f)
\quad\Longleftrightarrow\quad
(\forall g,x,\ f(gx)=J(k,g,x)(f(x))).
\]

There is no nonzero-section hypothesis, no faithfulness hypothesis and no restriction to scalar-valued functions.

**Proof and dependencies.** Apply L1 and function extensionality. At each g,x, use `LinearEquiv.symm_apply_eq` to move the inverse automorphism across the equality [M2]. The cancellation concerns an invertible linear map, not the value f(x). This argument remains valid for a zero function and for the zero semimodule. It must not be confused with attempting to recover the cocycle law itself from a single transforming function; that is Section 5.

## 4. The right action on the base

### L3. `AutomorphicBundles.inverse_base_action_cocycle`

Assume here that G is a group. Let H be any group, not assumed commutative, and let J:G×X→H satisfy the left cocycle law. Define the right base action and its coefficient by

\[
x\cdot g=g^{-1}x,\qquad J_R(x,g)=J(g^{-1},x).
\]

**Statement.** The right coefficient satisfies

\[
J_R(x,gh)=J_R(x\cdot g,h)\,J_R(x,g).
\]

**Proof.** Since (gh)⁻¹=h⁻¹g⁻¹, apply the left cocycle law to h⁻¹ and g⁻¹. No normalization hypothesis is needed for this composition identity. A normalized coefficient also has J_R(x,1)=1 by evaluation of its normalization, but that assertion is not bundled into L3.

This formula expresses the transport on the total space for a right action. In contrast, C1's right action is on functions while its base action stays left-handed. Interchanging these two meanings of “right action” is precisely the convention error that the separate lemma prevents. Scalar examples alone cannot test the multiplication order, since their values commute.

**Prerequisites.** The given left cocycle equation, inversion of a group product, and the left-action structure. All proof steps are group algebra and substitution; no theorem about a Shimura variety is assumed.

## 5. What a single section can detect

### L4. `AutomorphicBundles.cocycle_at_of_automorphy_of_ne_zero`

Let G be a monoid acting on X, K a field, J:G×X→K a function, and f:X→K a function satisfying f(gx)=J(g,x)f(x). No cocycle or normalization is assumed of J in this lemma.

**Statement.** At a point x for which f(x)≠0,

\[
J(gh,x)=J(g,hx)J(h,x).
\]

**Proof.** Compute f((gh)x) directly and by applying h and then g. The action law identifies the arguments, and associativity of multiplication gives

\[
J(gh,x)f(x)=J(g,hx)J(h,x)f(x).
\]

Cancel the nonzero scalar f(x). The nonvanishing assumption is necessary for this argument. Over a general ring it can be replaced by injectivity of multiplication by f(x), but that generalization is not an additional declaration in this prototype.

**Negative test.** Take G=C₂, the one-point trivial action, K=ℚ, J(1)=1 and J(s)=2 for the nonidentity element s. The zero function satisfies every transformation equation and every factor is nonzero. Nevertheless J(s²)=1 while J(s)²=4. Thus normalization and nonzero coefficients do not allow a zero section to detect the cocycle. This does not change the intrinsic definition of an automorphy factor, where the cocycle is an independent requirement.

Lan's printed left cocycle on p. 49 omits the shifted argument. The accepted decomposition already records that typographical error, and the present source reading confirms it visually [L]. L4 additionally makes the cancellation hypothesis explicit when explaining the correction using a particular transforming section. It does not allege a new source error in the intrinsic definition.

## 6. Eight prototype acceptance tests

The suggested file contains eight explicit examples, not implementations of proofs.

1. **Trivial coefficient.** The constructor's map is precomposition by g, using actual identity linear equivalences. This rejects a construction which unnecessarily inverts the base element.
2. **Zero function.** The constructed action sends zero to zero. No nonzero-function assumption is hidden in the definition.
3. **Changing a frame.** For u:X→Aut_R(V), take J(g,x)=u(gx)u(x)⁻¹. The operator is u(x)u(gx)⁻¹f(gx). This is a genuinely point-dependent coefficient family and exposes the shifted base argument.
4. **Noncommuting coefficients.** On ℚ² let U(a,b)=(a+b,b) and V(a,b)=(a,a+b). Use the automorphism group acting by evaluation on ℚ² and the coefficient J(g,x)=g. Applied to the constant function (1,0), the operators at UV and VU give (1,−1) and (2,−1), respectively.
5. **The inverse factor.** In the same model, the U-operator applied to the constant function (0,1) gives (−1,1), not (1,1).
6. **The Mathlib scalar comparison.** For SL₂(ℤ) acting on the upper half-plane, use the actual linear automorphism multiplying ℂ by denom(g,z)^k. Nonvanishing of denom makes it invertible. C1 gives precisely Mathlib's existing weight-k slash action, by `ModularForm.SL_slash_apply` [M1].
7. **A zero section does not force a cocycle.** The normalized C₂ factor in Section 5 fails the multiplicative law despite transforming the zero function.
8. **The semilinear boundary.** For full GL₂(ℝ), Mathlib's scalar formula is (c·f)|g=σ(g)(c)·(f|g), as supplied by `ModularForm.smul_slash`. This is retained as an existing comparison boundary, not presented as an instance of the ℂ-linear adapter [M1].

The last distinction matters for negative determinants: complex conjugation enters the full GL₂(ℝ) action. The SL₂(ℤ) comparison has determinant one and contains no such twist. Extending C1 to semilinear coefficients requires explicit scalar automorphisms and compatibility conditions; this checkpoint does not identify the two constructions.

Finite sanity tests, separate from the Lean examples, evaluated two coefficient families for GL₂(𝔽₃) acting on 𝔽₃². All 41,472 left cocycle checks, 41,472 right-base checks and 373,248 pointwise slash-composition checks passed. Incorrect variants produced 14,904 failures when the shifted argument was omitted, and 222,912 failures for each of reversed inverse-factor order and omitted inverses. These counts test the two selected families, not all cocycles, and do not constitute formal proofs. The handoff gives their exact construction and enumeration.

## 7. Geometric targets and ownership boundaries

**B0 — associated bundles and coefficient descent.** Import the generic associated-bundle functor from the designated ReductiveGroupsPartII supplier. The actual torsor, quotient relation, tensor/dual/determinant and pullback maps must be identified before relating geometric sections to C1. The analytic descent comparison, compact-dual bundles, homogeneous Hodge torsor, neat-level descent, ineffective-center criterion and semilinear coefficient-field descent remain unconstructed. A function satisfying a transformation rule is not itself proof that a locally free sheaf descends through a coarse quotient.

**B1 — canonical principal bundles.** The canonical torsor over the correct coefficient field, its filtration reduction, special-point description, Hecke compatibility, and algebraicity and descent remain unconstructed. The Hodge/abelian cases require their own realization and absolute-Hodge comparisons. No arbitrary analytic bundle is descended merely because the base variety has a canonical model.

**B1.general.** The general-data canonical-principal-bundle and conjugation theorem must consume the precise ShimuraVarieties V7 contract in addition to the preceding class-specific inputs. The scope does not collapse to the earlier Hodge/abelian case.

**B2 — automorphic bundles and realizations.** Construct the bundle associated to the actual parabolic/Levi representation over its field of definition, then compare it with B0's analytic construction. Whole-group representations provide the additional local-system, connection and filtration structure; arbitrary Levi representations do not acquire those data from C1. The highest-weight, tensor and Hecke comparisons remain open.

**B2.general.** The construction must use the general canonical principal bundle and the correct Gᶜ representation category, with realization comparisons. It is not a second independently defined associated-bundle functor.

**B3 — canonical and subcanonical extensions.** The degeneration-chart construction, gluing, twist by the reduced boundary, refinement compatibility and section-independence theorem remain unconstructed. The minimal-compactification pushforward is first a coherent sheaf, not automatically a vector bundle. The logarithmic connection retains its whole-group-representation hypothesis.

**B3.general.** The general-data extension requires B2.general and ShimuraCompactifications C3.general. The present functional calculation does not supply those prerequisites.

**B4 — classical forms and explicit weights.** C1–L4 settle only an algebraic planning slice of the action convention. The geometric spaces of sections, growth and cuspidality comparison, GL₂ Hodge line, Hilbert coefficient tensors and parity conditions, and Siegel and unitary examples remain to be decomposed. The comparison with Mathlib must retain its existing bundled `ModularForm` and `CuspForm` carriers once holomorphy and cusp conditions enter. Raw functions are used here only for the action calculation, not as a replacement definition of modular forms.

No planets, supplier requests, or revised ownership assignments are registered by this checkpoint. The eventual packet must give precise requests for missing suppliers and reconcile all three accepted decomposition identifiers before replacing that decomposition.

## References and baseline receipts

**[L]** Kai-Wen Lan, *An Example-Based Introduction to Shimura Varieties*, §4.2.7, printed pp. 49–50, https://www.kwlan.org/articles/intro-sh-ex.pdf. Read on 27 September 2026; the two page images were inspected, including the printed cocycle. The scalar/vector distinction and the extension discussion motivate the construction and its geometric boundaries. The general linear-coefficient adapter and L3–L4 are elementary deductions spelled out above, not assertions that the source states those Lean signatures. No fresh source-file digest verification is claimed.

**[M1]** Mathlib, `Mathlib/NumberTheory/ModularForms/SlashActions.lean`, lines 1–210 at the recorded pin; blob `3c085f78c1b970786e5f3f922ec4673bcf35a026`. Actual definitions and proofs read: `SlashAction`, its composition law, the GL₂ action and semilinearity, and the SL₂ formula and transformation-law comparison.

**[M2]** Mathlib, `Mathlib/Algebra/Module/Equiv/Defs.lean`, lines 270–575 at the recorded pin; blob `14a412f258926e23c5df61bea11e0afc254aaa83`. Actual definitions and proofs read: composition and its evaluation, inversion of a composition, inverse cancellation, `symm_apply_eq`, and zero/addition/scalar preservation.

**[M3]** Mathlib, `Mathlib/Algebra/Module/Equiv/Basic.lean`, lines 1–130 at the recorded pin; blob `9c54387d3cbce50725b34efe18e010eee528c846`. Actual definitions and proofs read: the automorphism-group structure, multiplication as function composition, and the evaluation action.

The reviewed AUDIT-13 entries for B0–B4 and the general-data interfaces were used as the library/ownership starting point. The accepted integrated decomposition remains unchanged. The suggested file has not been compiled; its proof placeholders are not evidence that these signatures elaborate at the pin.
