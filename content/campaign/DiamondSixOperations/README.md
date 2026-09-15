# Roadmap: six operations, cohomological smoothness and biduality

This specification uses the shared [diamond conventions](../../campaign-guide/DIAMONDS_CONVENTIONS.md),
[source contracts](../../campaign-guide/DIAMONDS_SOURCE_CONTRACTS.md), and
[65-milestone source graph](../../campaign-guide/DIAMONDS_DEPENDENCY_ORDER.md). The original ECD source
coverage is retained in the 328-item index.
Canonical campaign ownership takes precedence over historical supplier paths in the source index.

This component proves ECD §§22–25. It consumes the actual enhanced category and four
operations from C2–C3, proper base change from C5, and the cohomological bounds and
constructibility statements from C7–C9. The main coefficient ring is commutative and killed
by an integer prime to `p`; the smoothness refinements use `ℓ ≠ p`.

## S0. Compactifiable morphisms

Define compactifiability by an open immersion followed by a partially proper morphism. Prove
ECD 22.3 using C4's canonical compactification: the equivalence with separatedness and the
natural map being open, base change, v-locality on the target, composition, open-locality on
the source in the stated separated/representable scope, the separated étale case and the
cancellation statement.

The source-descent theorem 22.3(vii) requires a separated surjective map that has **local
sections after pullback to strictly totally disconnected spaces**. Store and prove that local
splitting condition in each use. A universally open or cohomologically smooth cover is not,
by definition, evidence for it. The supplied revision explicitly corrects an older overstrong
statement; that older statement is not a target here.

Package the eligible class for the subsequent construction by the three predicates:
compactifiable, representable in locally spatial diamonds, locally finite `dim.trg`. Separate
local finite bounds from one globally finite bound. Prove the closure properties actually
needed, while retaining extra hypotheses in cancellation and descent statements.

## S1. Quasicompact proper-support pushforward and the dimension estimate

For a compactifiable morphism representable in **spatial** diamonds of finite `dim.trg`, use
the canonical factorization `Y ↪ Ȳ → X` and define `Rf! = R\bar f_* j!`. The envelope `Ȳ`
need not be spatial; its `D_ét` and pushforward are the general ones already constructed.
Prove compatibility with the chosen factorization and canonical comparisons.

Prove Theorem 22.5 in its actual strength. For `d = dim.trg f`, the general bound is
`R^i\bar f_* = 0` for `i > 3d`. The improved `2d` bound has the **additional** spatiality
hypothesis on the canonical compactification. Follow the reduction through its maximal
Hausdorff quotient and prove Propositions 22.6–22.7 on proper `dim.trg = 0` diamonds over
strictly totally disconnected spaces. Include the spectral-space cohomological bound and the
comparison of ordinary topological sheaves used in this reduction. A proof of the spatial
case alone does not establish the general theorem.

Use this estimate to justify unbounded base change and the direct-sum statements. Prove
22.8–22.12: base change, composition, agreement with the étale left adjoint, projection formula,
and preservation of coproducts. For the projection formula, use `A` on the base and `B` on the
source. The exactness of the direct image along the relevant qc separated quasi-pro-étale
open inclusion must come from C8, not from a blanket claim that every open pushforward is exact.

## S2. Non-quasicompact maps and small v-stacks

First handle compactifiable maps of quasiseparated locally spatial diamonds. Define the full
enhanced subcategory of objects of the form `j_V!j_V*A` with `V` an open subspace quasicompact
over the target. Define `Rf!` by left Kan extension from this subcategory (22.13), and prove
its filtered-support formula, colimit preservation and base change (22.14–22.15). Do not
replace the Kan extension by an ordinary unstructured choice of representatives of complexes.

Next choose a simplicial v-hypercover of an arbitrary small v-stack by quasiseparated locally
spatial diamonds. Construct the coherent diagram of coefficient categories and support
subcategories. Apply E3's fibrewise left Kan extension theorem to prove 22.16, then prove
preservation of coCartesian edges (22.17). Descend along the hypercover to construct 22.18.
Prove independence of the cover through common refinements and compatible equivalences.

Prove base change 22.19, colimit preservation 22.20, composition 22.21, étale agreement 22.22,
and projection formula 22.23 at the enhanced level before passing to homotopy categories.
All transformation/pasting equations are part of the public interface, including iteration
through products of simplicial indexing categories. In results printed first for v-sheaves,
include the explicit hyperdescent passage needed for the small-v-stack formulation advertised
in the introduction.

## S3. Exceptional inverse image and the formal identities

Use presentability and colimit preservation to construct the enhanced right adjoint `Rf^!`
to `Rf!` (23.1). Prove coefficient restriction compatibility (23.2) and the two internal-Hom
adjunction identities (23.3). Prove identity and composition laws and their compatibility with
the corresponding laws for `Rf!`.

At this point prove the **formal** exceptional base-change identity 23.16(i) by taking right
adjoints of 22.19. This identity is used earlier in the printed proof of 23.4, so it must not
be postponed until after cohomological smoothness. For a cartesian square with horizontal
eligible map `g`, it reads `Rg^! Rf* ≃ Rf'* Rg'^!`; the other map `f` need not acquire
extra eligibility assumptions for this identity.

Construct units, counits, trace maps, evaluation and coevaluation, tensor–Hom adjunction, the
projection transformation and mates. Test their composition and base-change compatibility on
finite étale maps and open immersions before using them in smoothness proofs.

## S4. Cohomological smoothness with the revised descent hypotheses

Prove 23.4–23.7, including the equivalences of criteria over strictly totally disconnected
bases, the profinite-projection calculation and the compactness/direct-sum criterion. Define
`ℓ`-cohomological smoothness exactly as in 23.8: a separated map representable in locally
spatial diamonds, compactifiable and locally of finite `dim.trg`, for which after every strictly
totally disconnected base change the exceptional inverse image is tensor with an invertible
object followed by pullback.

Prove that the a priori unspecified equivalence becomes the **canonical** tensor transformation
and that the dualizing object is `Rf^!Λ`. Prove universal openness, change of coefficients,
base change of the dualizing object and preservation of perfect-constructible complexes under
**quasicompact cohomologically smooth** `Rf!` (23.10–23.12). Do not assert constructible
preservation for an arbitrary proper diamond map without a separate theorem.

Prove composition and the precise reverse implication of 23.13. In the reverse direction,
keep the assumptions that the intermediate map is representable in diamonds and compactifiable,
as well as surjectivity of the cohomologically smooth source map. Prove target v-descent as
in 23.15, retaining **local finiteness of `dim.trg f` as an assumption on `f` itself**. The
paper does not establish that condition by checking it on an arbitrary v-cover.

Prove smooth base change and the remaining identities of 23.16–23.17. Whenever `Rf^!`
appears, its defining eligibility hypotheses are present. In particular, when applying
23.16(iii), provide the hypotheses making the vertical map's exceptional inverse image
available, rather than relying on an ill-typed standalone formula.

## S5. Examples: the ball, quotients and analytic smooth maps

Prove Theorem 24.1 for the absolute perfectoid-ball functor `B(R,R⁺) = R⁺`. After perfectoid
base change this is the perfected ball. Use H3's curve trace/duality and H4's relative
constructibility input to obtain the canonical normalization `Rf^!Λ ≃ Λ(1)[2]`. This is not
initially the assertion about an arbitrary ordinary analytic unit disc.

Prove 24.2 for free actions of a profinite group of pro-order prime to `ℓ`, including the
normalized `Λ`-valued Haar measure and compatibility of finite-level traces. Prove 24.3 in the
nonfree case with its 0-truncated qcqs image-relation and fibrewise smoothness hypotheses.
It is needed in the mixed-characteristic argument; do not keep only the free case. For the
quotient projection `q`, do **not** assert `Rq^! = q*`: the source explicitly describes a
distribution-valued counterexample. State the comparison after composing with the quotient
structural map in the form actually proved.

Deduce 24.4 for separated smooth analytic adic morphisms over `ℤ_p` by local ball/torus
presentations, characteristic-`p` comparison and the compatible-root `ℤ_p`-quotient argument.
Deduce 24.5 for `Spd ℚ_p → *` using the cyclotomic `ℤ_p`-extension and the punctured
perfectoid disc. Prove the alternate geometric-base criterion 24.6. Question 24.7 about
regular integral bases is not promoted to a theorem.

## S6. Biduality and conservativity

Prove Theorem 25.1 for `X` separated and `ℓ`-cohomologically smooth over
`Spa(C,𝒪_C)`, with `C` complete algebraically closed of characteristic `p`, and bounded
constructible `𝔽_ℓ` coefficients. Prove biduality and the finiteness of cohomology when `X`
is quasicompact. Follow the reduction to `j!𝔽_ℓ`, strict-localization/approximation, the ball,
and H5's smooth-curve compactification, keeping the actual biduality map throughout.

Prove the perfect-constructible extension to general `ℓ`-power-torsion commutative coefficients
in Remark 25.3, including coefficient change for the relevant direct image. The resulting
perfect global-sections complex is a complex of **coefficient-ring** modules. Prove the Verdier
dual conservativity assertion 25.4 in its stated compactifiable finite-dimensional setting.

Implement the counterexample of Remark 25.2 over `Spa(C,C⁺)` with `C⁺ ≠ 𝒪_C` and an
appropriate proper open immersion: the double dual of `j!𝔽_ℓ` need not recover it. Thus the
base hypothesis `C⁺ = 𝒪_C` is essential and remains in the public theorem. The general-ring
conservativity discussion in Remark 25.6 is conditional, not an unconditional extension.

## Completion

Export the six functors with their eligible domains and coherence; explicit classical examples
must instantiate those domains. No component may finish with “assume a six-functor formalism”.
A test on the Fargues–Fontaine curve uses the operations whose map hypotheses have actually
been proved; its existence as a diamond alone does not prove that its structural map is
cohomologically smooth or admits every particular compactification.

## Completion contracts added on 2026-09-15

**Applies to:** `S0`, `S1`, `S2`, `S3`, `S4`, `S5`, `S6`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

For every geometric consumer supply a witness of compactifiability, locally spatial representability and locally finite dim.trg for its exact morphism. S2 constructs the coherent support diagram, fiberwise Kan extension and refinement independence before descent. S3 proves the exceptional base-change identity by adjoint mates before using it in S4. Keep S0's local-section condition on source descent explicit.

### Producer–consumer contract

Export six functors together with their eligible domains and canonical exchange maps. S1's 3d bound and its stronger 2d bound under spatial compactification are separate declarations. S6's biduality retains C+=O_C; stack structural maps require VS0 rather than a falsely representable ECD operation.

### Acceptance and source route

Use a finite étale map, an open immersion with nonspatial compactification and the valued-plus-ring biduality counterexample. Verify that a pro-ℓ quotient cannot use prime-to-ℓ averaging.

**Source route:** ECD 22.3/22.5/22.16–23.1, 23.16, 24.2–24.3 and 25.1–25.2. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
