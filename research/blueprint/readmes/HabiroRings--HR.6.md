# Habiro rings — HR.6: coefficient and cohomology interfaces

This follows the accepted [HabiroRings packet](../packets/HabiroRings.json), whose five HR.6 nodes remain the target declarations. The [part packet](../packets/HabiroRings--HR.6.json) adds an order-one fibre construction, a proof route for completion-triviality, and the supported field scalar comparison. Every declaration is unchecked. HR.6 is **planned**, with the four gaps below; the planning pass is complete.

The reviewed AUDIT17 entry in `data/library-coverage.json` finds HR.6 unbuilt at the pins. Mathlib already has ordinary invertible modules, the Picard group and its scalar-extension maps. These are imports. The cohomology functor, complete-module categories and actual K₃-indexed modules are imports from their owners, with their outstanding supplier conditions retained.

## Conventions and ownership

For a perfectly covered Λ-ring A and an étale A-algebra R, write H_{R/A} for HR.5's relative Habiro ring. Its coefficient origin is A[q], and its completion at q−1 is R[[X]], where X denotes q−1. A ring homomorphism H_{R/A}→R exists by the constant coefficient of that completion. An R-algebra structure on H_{R/A} by constant families generally does not exist.

For the regulator interfaces let F be a number field, let Δ be positive with 6|disc F| dividing Δ, and put R=O_F[1/Δ]. Use the Taylor-compatible comparison

κ_R : H_{R/Z} ≅ H_R

from `HabiroRings:HR.5-number-field-comparison/the-number-field-ring`. The parent explicitly extends the printed discriminant-only Corollary 2.13 to any multiple of the discriminant; the stronger factor 6 is needed by the indexed modules. For ξ∈K₃(F), HB.7 owns the actual module L_ξ=H_{R,ξ}. Its restriction through κ_R is M_ξ over H=H_{R/Z}. A base change of M_ξ is an ordinary tensor over H. Expressions S⊗_R M_ξ have no general meaning here.

Mathlib's `CommRing.Pic` is written multiplicatively: tensor product is multiplication and the trivial class is 1. Thus a zero regulator after completion is written as Pic(c)(ρ(ξ))=1. K₃ retains its imported additive convention. No K₃ group or indexed-line definition is made in this part.

The accepted [HB.7 follow-up](../packets/HabiroNumberFields--HB.7.json) sharpens the source's Theorem 2. Global additive closure, finite projectivity, actual chart base changes and conservative descent remain its `G-global-descent`. Its tensor bijectivity and Picard character are conditional on that contract. Its supported field-change equivalence additionally needs `G-arithmetic-naturality`. Those conditions apply everywhere below.

The stage is a late return: HR.1–5 construct coefficients, HQ.3–5 construct cohomology, and HR.6 compares them. The current accepted HQ.3 coordinate/étale nodes and HQ.5 scheme-cohomology node have no HR.6 prerequisite. Their generic specialization is not another construction here. HQ.8 owns crystalline, A_inf, prismatic and period comparisons. Accepted RS-10 has not installed its proposed QWittVectors and AnalyticHabiroStack stage graph in the assembled atlas; retain the existing suppliers until that migration is atomic.

## Retained coefficient targets

### Étale degree-zero identification

Retain `HabiroRings:HR.6/the-degree-zero-identification`. For the empty framing of an étale R/A, the chosen filtration is the (q−1)-adic filtration. The Habiro–Hodge descent object is H_{R/A}, as an E∞ coefficient algebra. The comparison must preserve multiplication, every reduction modulo q^m−1 and Φ_m(q), q−1 completion, and morphisms of pairs.

[Wagner, Corollary 3.13](https://arxiv.org/pdf/2510.04782v2), printed p.27, proves this from the degree-zero calculation of q-de Rham–Witt forms and complete étale deformation uniqueness. The parent source issue `HabiroRings/E6` corrects the proof's reference to Theorem 3.11(a): the exhaustive quotient filtration is part **(b)**. Its positive graded pieces vanish for an étale algebra; its degree-zero piece is qW_m(R/A). Comparison with the independently constructed HR.4 lift then gives a unique marked equivalence at every m, compatible with transition maps. Taking the Habiro limit gives the comparison. The accepted HR.4 follow-up now plans `complete-principal-deformation-universality` and `cyclotomic-ghost-lift-coherence`, conditional on their exact enhanced suppliers. A formally étale map-lifting theorem alone does not supply this object-deformation argument.

The empty framing has a multiplicative adic filtration. This argument does not invoke an unpublished multiplicative upgrade for every framed smooth algebra. Use HQ.3's chosen-pair and multiplicative interfaces and HQ.4's étale q-Witt comparison. In particular, the comparison is not a statement that all higher-dimensional cohomology is concentrated in degree zero.

Acceptance checks: for A=R=Z recover the classical Habiro ring; at m=1 recover R[[X]]; every cyclotomic square and pair-functoriality square commute. The explicit finite-projective chosen-pair base-change work in HQ.3 remains owned there; it is not enlarged here to arbitrary base changes of cohomology.

### Complete modules and perfect coefficients

Retain `HabiroRings:HR.6/completed-scalar-extension`. For the ring map h:H→H′ induced by a pair morphism, its functor on Habiro-complete modules is

h* M = Habiro-completion of (H′⊗ᴸ_H M).

It is left adjoint to restriction, symmetric monoidal for completed tensor, preserves the unit, and has coherent identity and composition comparisons. A perfect H-complex is a retract of a finite complex of finite free H-modules. After base change it is a finite retract of the complete unit H′, so completion is inert in this range. An ordinary invertible module is finite projective; its derived tensor is its ordinary tensor, and its Picard comparison is Mathlib's existing scalar extension. Ordinary Picard classes inject into the invertible objects of the complete derived category; this is not a claim that every derived invertible object is an unshifted line.

The parent's complete API and tests remain the specification: adjunction, unit, identity, composition, tensor comparison, perfectness and ordinary invertible-module compatibility. HR.2 owns complete modules and completed monoidality; its enhanced carrier and supplier conditions remain imports. This part does not define another derived category, completion or perfect-complex theory.

Acceptance checks: tensor-unit base change for H, composition through H′→H″, finite-projective degree-zero compatibility, and agreement with the existing Picard map. Scheme properness and the source's smooth-proper perfectness assertion remain HQ.5 obligations; this coefficient interface does not prove them.

### Actual transported regulator and ring-level information loss

Retain `HabiroRings:HR.6/the-transported-regulator`. It sends ξ to [M_ξ], using HB.7's actual modules and conditional tensor character. Retain `HabiroRings:HR.6/the-q-minus-one-completion-is-not-injective`: the actual ring map

c : H_{R/A} → R[[X]]

is injective for A=R=Z but need not be injective after changing coefficients. For R=Z[1/p], HC.5 decomposes the cyclotomic completion into factors indexed by the sets S_a of orders with p-adic valuation a. The q=1 factor is a=0. Each nonzero factor idempotent for a≥1 is killed by c. This is a concrete ring-level loss, using the parent and HC.4–5 suppliers, rather than a general claim about losing higher cohomology classes.

A nonzero ring-kernel element proves neither that Pic(c) has a nonzero kernel nor that the regulator meets it. The line-completion calculation below is separate; its nontrivial pre-completion witness remains a gap.

## Order-one fibre trivialization

The new construction is `HabiroRings:HR.6/followup-order-one-fibre`, with suggested name `OrderOneFibre.trivialization`. Put v=constantCoeff∘c. The integral constant-evaluation interface requested from HB.7 gives

e_ξ : R⊗_{H,v}M_ξ → R, r⊗f ↦ r f₁(0).

At m=1 the Kummer torsor is canonically trivial. [GSWZ, Proposition 1.5(f)](https://arxiv.org/pdf/2412.04241v2), printed p.11, places f₁(0) in R. Only that constant is needed; an arbitrary full f₁(X) may have denominators. Addition, H-semilinearity and compatibility with graded multiplication are small API obligations for HB.7, which owns the actual sections.

Under HB.7's effective descent, `followup-tensor-bijectivity` supplies a finite inverse certificate: sections f_i∈M_ξ and g_i∈M_{−ξ} with Σ f_i g_i=1. Evaluating constants gives Σ f_i(0)g_i(0)=1. The fibre element z=Σ g_i(0)⊗f_i therefore has e_ξ(z)=1, and e_ξ(rz)=r. No individual f_i need be a global unit section.

The fibre is invertible by existing ordinary base change. A surjective linear map between invertible modules is bijective (`Module.Invertible.bijective_of_surjective`). Consequently e_ξ is the underlying map of a unique R-linear equivalence t_ξ. Its inverse image of 1 is independent of the inverse certificate. This constructs a canonical **fibre** trivialization, without assuming M_ξ free over H.

The ordinary suggested signature takes a genuine commutative H-algebra R, an invertible H-module M, a genuine R-linear e:R⊗_H M→R, and a preimage of 1. In the application these are exactly v, M_ξ, e_ξ and the finite certificate above; they are not a substitute definition for the missing indexed modules.

Its API follows the two consumers: completion needs the fibre generator, and field pullback needs normalization by evaluation.

| API name | Statement |
| --- | --- |
| `OrderOneFibre.map_eq_eval` | t(x)=e(x) for every fibre element. |
| `OrderOneFibre.inverse_one` | e(t⁻¹(1))=1. |
| `OrderOneFibre.coordinates` | e(x)·t⁻¹(1)=x. |
| `OrderOneFibre.unique` | An equivalence whose underlying map is e equals t. |
| `OrderOneFibre.rescale` | Replacing e by u e, for u∈Rˣ, replaces t by u t. |

Four tests distinguish normalization, the necessary nonzero input and the correct fibre:

1. `OrderOneFibreTests.identity`: for H=R and M=R, tensor-unit evaluation gives t(1⊗r)=r, agreeing with `TensorProduct.lid`. This models the zero K₃ grade.
2. `OrderOneFibreTests.negativeUnit`: for H=R=Z and negative tensor-unit evaluation, t(1⊗3)=−3. A normalization ignoring the supplied evaluator fails.
3. `OrderOneFibreTests.inverseGenerator`: t(r·t⁻¹(1))=r for every r. This tests a generator of the fibre, with no generator of M required.
4. `OrderOneFibreTests.zeroEvaluation`: the zero map on Z⊗_Z Z has no preimage of 1, so it cannot supply this construction.

## Completion-triviality of the regulator

`HabiroRings:HR.6/followup-completed-regulator-triviality` refines the parent's unproved completion assertion. Let B=R[[X]] and P_ξ=B⊗_{H,c}M_ξ. Under the same HB.7 contract,

P_ξ ≅ B, Pic(c)(ρ(ξ))=1.

This supplies a downstream proof route for [Wagner paragraph 1.4](https://arxiv.org/pdf/2510.04782v2), printed p.4, which asserts this without a proof. It does not discharge HB.7 global descent.

The proof uses ordinary modules at the pins. P_ξ is invertible, hence finite. The kernel of constant coefficient is (X), by `PowerSeries.X_dvd_iff`, and constant coefficient is surjective. Thus B/(X)≅R. `RingHom.quotientKerEquivOfSurjective`, `TensorProduct.quotTensorEquivQuotSMul` and `TensorProduct.AlgebraTensorModule.cancelBaseChange` identify P_ξ/XP_ξ with R⊗_H M_ξ, trivialized above. Lift the fibre generator to s∈P_ξ. The map a:B→P_ξ sending b to b s is surjective modulo (X).

For every y∈B, 1+yX has constant coefficient 1 and is a unit by `PowerSeries.isUnit_iff_constantCoeff`. `Ideal.mem_jacobson_iff` therefore gives (X)⊆Jac(B). Apply `LinearMap.surjective_of_surjective_comp_mkQ` to the finite target P_ξ: a is surjective. Since B and P_ξ are invertible, `Module.Invertible.bijective_of_surjective` makes a an isomorphism. `CommRing.Pic.mk_eq_one_iff` gives the Picard identity. No noetherian or local-ring hypothesis on R is used.

The suggested theorem `completedRegulatorTriviality` states this ordinary core for any commutative R and invertible B-module P with P/XP≅R. It retains the existing B-action on R through constant coefficient. In the actual application the preceding base-change identification supplies its hypothesis.

A full trivialization is not canonical. Multiplication by any B-unit changes it; even requiring its reduction to equal t_ξ leaves the units reducing to 1. Over Z, 1+X is a nonconstant unit reducing to 1, whereas X is not a unit. Both sanity checks appear as additional suggested examples. They prevent interpreting the lifted generator as a uniquely normalized integral Taylor series.

The two new planets are **Order-one fibre trivialization** and **Triviality of the completed regulator**. The parent target nodes are imported without duplicate planet nodes.

## Supported field scalar comparison

`HabiroRings:HR.6/followup-regulator-scalar-square` uses a field embedding F→E and one positive Δ divisible by both 6|disc F| and 6|disc E|. Put S=O_E[1/Δ] and H′=H_{S/Z}. HB.7's `followup-field-pullback` and `followup-scalar-equivalence`, conditional on descent and arithmetic naturality, give an actual module equivalence. Conjugating by κ_R and κ_S gives

H′⊗_H M_ξ ≅ M_{res ξ}, Pic(H→H′)(ρ_F(ξ))=ρ_E(res ξ).

The ring-comparison square commutes on Taylor coordinates: coefficient pullback fixes the abstract ζ_m and X. Evaluation consequently commutes with R→S, as do c and c′ with the induced R[[X]]→S[[X]]. The fibre comparison and completed Picard comparison commute. Identity and successive field embeddings use the inherited tensor unit and associator coherences. This comparison does not include an unsupported linear transfer of sections or arbitrary coefficient-base-change theorem.

The typed suggested `regulatorScalarSquare_of_ringSquare` isolates the existing Picard functoriality step for an actual commutative square of ring maps. The actual indexed-line theorem is listed as an omitted signature until HB.7's carriers and arithmetic contracts are supplied. A formal Picard square is not evidence for those contracts.

## Closure, source status and executable boundary

The [packet](../packets/HabiroRings--HR.6.json) cites 22 exact Mathlib declarations at 082e2d37e8b0463410cdb532e111cd43d5a66174. All tracked TauCeti sources at f790474821cf4256814db967cb154e7af3d0c369 were searched for Habiro/q-Hodge/q-Witt terms without a match. The complete coefficient and cohomology objects therefore remain the imported planned interfaces, not baseline declarations. The suggested file imports only the individual Mathlib modules it uses, so its elaboration does not depend on a newer TauCeti checkout.

The four gaps are precise:

- **G-global-descent:** HB.7's actual additive modules, finite projectivity, chart base changes and conservative descent, needed for the inverse tensor certificate.
- **G-arithmetic-naturality:** HB.7's supported field restriction/scalar equivalence with its existing D.1/D.4/M.8 supplier contracts.
- **G-nonzero-regulator:** find F, Δ and ξ with a rigorously nonfree actual M_ξ. The numerical knot discussion on GSWZ printed p.10, Wagner's introductory assertion, nonzero K₃ and ring noninjectivity do not supply a proof.
- **G-signatures-and-enhanced-inputs:** install genuine imported K₃, indexed-line and enhanced coefficient carriers and discharge the inherited HR.2/HR.4/HQ supplier refinements. The omitted signatures are named in the suggested file, following Protocol §13.

There is one request to HB.7 for the integral order-one semilinear evaluation and graded multiplication API, retaining its descent and supported arithmetic conditions. Existing generic foundational requests remain with their owners. No new restructuring is needed; the historical cycle issue is accounted for by the current accepted HQ packets.

Read sources include GSWZ v2 §1.5 and §§3.2–3.3, Wagner v2's introduction and Theorem 3.11–Corollary 3.13, GSWZ’s detailed knot computations in §§4.5–4.6, and the q-de Rham–Witt paper v5's étale base-change proof. The [current author copy](https://ferdinand-wagner.github.io/papers/q-Habiro.pdf), dated 14 January 2026, was checked at the corresponding introductory and comparison passages. It retains the completion assertion and inherited reference misprint E6. Inherited HB source issues E23, E24 and E26 are referenced, not duplicated. No new source error is asserted. No unavailable source was used to fill a gap; the missing rigorous nonfreeness argument is recorded as missing evidence.

The [suggested file](../suggested/HabiroRings--HR.6.lean) elaborated using `lean-check` at the pinned Mathlib, with intentional proof-hole warnings only. It contains the construction, all five API items and all four tests, the ordinary completion theorem, two unit sanity examples and the formal Picard square. Its exact omission ledger identifies the unavailable actual signatures. Elaboration establishes type correctness of these ordinary interfaces, not a formalization or proof of the imported mathematics.
