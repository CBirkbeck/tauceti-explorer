# Roadmap: étale cohomology of diamonds and its four operations

This specification uses the shared [diamond conventions](../../campaign-guide/DIAMONDS_CONVENTIONS.md),
[source contracts](../../campaign-guide/DIAMONDS_SOURCE_CONTRACTS.md), and
[65-milestone source graph](../../campaign-guide/DIAMONDS_DEPENDENCY_ORDER.md). The original ECD source
coverage is retained in the 328-item index.
Canonical campaign ownership takes precedence over historical supplier paths in the source index.

This component constructs ECD §§14, 16–21 using D0–D6, the enhanced sheaf theory E0–E3,
and the classical analytic inputs H0–H5. The order below deliberately differs from the printed
chapter order. The end result includes the geometry and finiteness estimates needed for `Rf!`,
but does not assume that operation in its generality.

## C0. Sites and bounded comparison

Construct the étale site of a locally spatial diamond, the quasi-pro-étale site of a diamond,
and the v-site of a small v-stack (14.1). Use the stated locally separated convention. Prove
algebraicity/coherence in the appropriate size setting, enough geometric points, and comparison
with the respective bases of perfectoid objects. Construct the morphisms of topoi, their
pullbacks and units/counits.

Prove 14.4–14.11: the limit-preservation assertions, fully faithful pullbacks and vanishing of
higher direct images for sheaves pulled back from the étale site, continuity of étale cohomology,
and the bounded-below derived comparisons. The vanishing in 14.7 is **not** claimed for all
quasi-pro-étale sheaves. Its proof uses H2's geometric connectedness result and the section
lemma for balls, whose ownership is D3.

Verify repleteness and left-completeness for the actual v-sites and quasi-pro-étale sites by
constructing the countable lifting towers; apply E2, rather than assuming those properties for
all topoi. Prove the unbounded comparison for strictly totally disconnected spaces. The general
v-locality theorem 14.12 is **not yet available** at the end of this stage.

## C1. General base change, before v-locality

Prove ECD Theorem 16.1 and its corollaries using D6's analytic comparison, H2's valued-field
invariance, and C0. Retain its separate cases: degree zero, the quasi-pro-étale case, and the
prime-to-`p` torsion-cohomology case. Do not collapse them into an unqualified theorem for
arbitrary coefficients and degrees. In the reduction to strictly totally disconnected bases,
prove the geometric-field, relative-ball approximation and extension-by-zero assertions,
including Lemmas 16.2–16.5 and the continuity steps.

Construct the comparison natural transformations explicitly and prove their compatibility with
composition and restriction. Prove Propositions 16.6 onwards in their stated bounded/category
range. The derivation may use the already established **bounded** comparison, but not the
general étale subcategory defined using the result being proved.

## C2. The left-completed étale category and descent

Now prove Theorem 14.12, using C1 exactly where its proof invokes 16.1. Define `D_ét` as the
full subcategory of the enhanced v-derived category tested on strictly totally disconnected
perfectoids (14.13). Prove that it can be tested on one v-cover, the cohomology-sheaf criterion,
and the identification with the left completion of the ordinary étale derived category for
locally spatial diamonds (14.15–14.16).

Prove presentability and stability with the size bounds and generating/localization argument of
17.1; it is not enough that the ambient category is presentable. Work in an adequate cutoff `D(Y_v,κ,Λ)` as in 17.1; do not assume the entire large
v-derived category is presentable. Construct compatible right adjoints at the cutoffs to
obtain the right adjoint to the inclusion (17.2), and enhanced hyperdescent (17.3). Supply all functorial comparison data
under change of cutoff and under pullback. An equivalence of homotopy categories alone does
not give the coherent diagram needed later in §22.

## C3. Four operations

Construct derived tensor and `f*` as the allowed restrictions of v-operations; construct internal
Hom and `Rf*` using étale coreflection where required. Prove the adjunctions, functoriality,
identity and composition laws, and compatibility with change of coefficients. In function
notation, for `f : Y → X`, `g : Z → Y`, the pullback law is
`(f ∘ g)* ≃ g* ∘ f*`. Use Lean's composition convention consistently when naming this law.

Prove Proposition 17.6: for qcqs `f` and `nΛ = 0` for some `n` prime to `p`, comparison with v-pushforward and base change on `D⁺`;
then its unbounded version under the stated finite-cohomological-dimension hypothesis. Prove
all the tensor/Hom identities of §17 with the correct source and target categories. No proof
may identify arbitrary v-internal-Hom with étale internal Hom without the comparison theorem.

## C4. Proper, partially proper, and canonical compactification

Build ECD §18 on D5's small-v-stack geometry. Define properness, prove the valuative criteria,
and construct the partially proper envelope/canonical compactification with its universal
property. Prove its functoriality, base-change compatibility, the affinoid formula over a
strictly totally disconnected base, and the behavior of qc maps. Distinguish universal
closedness, separatedness, properness and partial properness.

Prove the tautness comparison in its stated locally spatial scope. Do **not** assert that the
canonical compactification of a spatial morphism is spatial. Maintain its actual small
v-stack/diamond type and use D5's maximal-Hausdorff quotient when required later. Keep these
constructions separate from the later predicate compactifiable: the natural map into the
envelope is not automatically an open immersion.

## C5. Extension by zero and proper base change

Construct the exact left adjoint to pullback for étale maps (19.1), first on perfectoid/étale
sites and then by enhanced hyperdescent. Prove its base-change law and its agreement with
extension by zero for an open immersion. It is available here without general `Rf!`.

Prove Theorem 19.2. For `f : Y' → Y` proper and `j : U ↪ Y` open, let `g : U' → U` and
`j' : U' ↪ Y'` be its pullback. Construct

\[
j_!Rg_* A\longrightarrow Rf_*j'_!A.
\]

It is an equivalence on `D⁺` when `f` is quasi-pro-étale or the coefficient ring has a
prime-to-`p` annihilator; retain these hypotheses when using a cohomological-dimension bound
to pass to the unbounded case. This is not a repetition of the ordinary qcqs base-change
statement in C3. The complement of `U` need not define a closed sub-v-sheaf.

Follow the proof through proper hypercovers by canonical compactifications of strictly totally
disconnected spaces, valued-field reductions, Zariski–Riemann spaces, and proper base change
for schemes. Construct the Zariski–Riemann models and their limit/cohomology comparisons,
including the henselian-ring result cited as Huber [Hub93b]; its proof is owned jointly by H1's
classical input and this application, not assumed as a new axiom. Prove compatibility of the
exchange map through all reductions.

## C6. Algebraically closed base-field invariance

Prove all three cases of Theorem 19.5: discrete algebraically closed base extension in
characteristic `p`, passage from such a field to an algebraically closed nonarchimedean field,
and extension of algebraically closed nonarchimedean fields with the specified plus rings and
surjectivity. The conclusion is full faithfulness of pullback on `D_ét`; it does not assert that
every étale object over the larger base descends.

Use the annulus/open-ball calculations in H4 and the extension-by-zero result C5. This is the
global diamond theorem. It is not the classical field-invariance input H2 that was already
needed to get C1 started.

## C7. Constructible and perfect-constructible coefficients

Implement all of §20's sheaf-level constructibility and descent results with **spectral**
constructible stratifications. Prove finite-stage descent, stability under the appropriate
operations, and the filtration by extensions of local systems supported on locally closed
constructible subsets. A noetherian algebraic stratification is not automatically a spectral
constructible stratification on an adic space.

For arbitrary commutative `Λ`, define perfect-constructible complexes by the appropriate finite
stratifications and constant perfect complexes. Prove the equivalent stalk/perfectness and
locally bounded Tor-amplitude conditions with their hypotheses, and v-descent. Keep
perfect-constructible distinct from bounded constructible over a general coefficient ring.

There is a proof-order subtlety in 20.15–20.16: first prove the **full-faithfulness** portion of
the limit comparison, then the filtration theorem, then use that filtration for **essential
surjectivity**. Do not make the two propositions circular dependencies. Derived compact-object
characterizations are postponed to C9, after the vanishing lemma needed in their proofs.

## C8. Dimension and cohomological bounds

Implement §21: topological dimension, topological transcendence degree of complete fields,
the **modified** invariant used in Definition 21.7, `dim.trg` of a morphism and its local-finiteness
predicate. Preserve the minimum over further complete algebraically closed extensions in
`tr.c-tilde`, and separately the suprema over points/presentations in 21.5/21.7. Do not
replace it by ordinary transcendence degree, or assume the monotonicity asked about in
Question 21.4. Prove the local, base-change, composition and analytic dimension comparisons
actually stated in the section.

First establish Lemma 21.13 and Remark 21.14: degree-zero direct image along a qc separated
quasi-pro-étale map. This result uses C1 and disconnected spaces, not the compact-object theorem
that later invokes it.

For the remaining cohomological bounds, import canonical continuous cohomology and its
closed-subgroup/Shapiro dimension API from ProfiniteCohomology, and Sylow/pro-`p` structure
from ProfiniteProPGroups. Import the general all-degree continuous Hochschild–Serre
spectral sequence, discrete/compact coefficient comparison, and its convergence/edge-map
API from [ArithmeticGaloisDuality R02.1–R02.2](../ArithmeticGaloisDuality/README.md).
Instantiate its discrete torsion specialization and prove the extension inequality for
cohomological dimension used here. Identify its actual maps with the canonical upstream
continuous-cohomology carrier and the diamond quotient computation below. The five-term
sequence alone is insufficient; the general spectral sequence is proved only by its
shared owner.

Prove the point-as-profinite-quotient description and identify its sheaf cohomology with continuous
cohomology. Prove the wild-inertia pro-`p` lemma 21.17, the tame-inertia embedding, the residue
field transcendence bound for Galois cohomological dimension, and the valuation-theoretic
inequality bounding residue transcendence plus rationalized value-group rank. Own the
field-theoretic/Kummer and Galois-cohomological proofs not provided by the suppliers.

Prove the spectral-space cohomological-dimension result cited from Scheiderer, including the
quasi-augmented simplicial-space argument required for Corollary 4.6, and then ECD 21.11–21.16.
These statements are needed to justify later unbounded operations, not ornamental numerical
bounds. The `3d` estimate for a canonical compactification is proved in S1.

## C9. Compact generation in the correct scope

With C7 and the degree-zero lemma of C8, prove 20.10 and 20.17 and their prerequisites.
Compact generation and the characterization of compact objects require the stated uniform
bounds on the cohomological dimension of the relevant qc separated étale objects. Prove
these hypotheses in each application, rather than declaring every `D_ét` compactly generated
by constructible objects. For `𝔽_ℓ`, the compact objects are the bounded constructible
complexes under these hypotheses; for general coefficients use perfect-constructible objects.

## Completion

The source-index assignments cover all definitions and results of the owned ECD sections;
proofs left to the reader there are still tasks. Tests must include a nonspatial diamond, a
strictly totally disconnected space, the failure of a point/complement stratification of a
closed disc to be spectral-constructible, a field extension satisfying the plus-ring condition,
and a bounded-to-unbounded promotion that explicitly invokes its dimension bound.

## Completion contracts added on 2026-09-15

**Applies to:** `C1`, `C2`, `C3`, `C7`, `C8`, `C9`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Build a dependency witness for the C1→C2 transition: C1 uses only bounded comparison and classical valued-field invariance, then C2 proves v-locality and left completion. In C7 implement full faithfulness of finite-stage descent before the filtration lemma and use that lemma for essential surjectivity. C9 must supply a uniform bound on the cohomological dimensions of the qc separated étale test objects used as compact generators.

### Producer–consumer contract

Return the actual comparison transformations with cutoff-independence isomorphisms. An étale coreflection is a right adjoint; it cannot be substituted for left completion. Internal Hom and direct image are constructed in the étale category, with their comparison to v-operations proved separately.

### Acceptance and source route

Test a nonspatial diamond, a qc morphism without the required finite dimension bound, and a spectral stratification rather than an arbitrary decomposition into point and complement.

**Source route:** ECD 14.12–17.6, 20.15–20.17 and 21.13. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
