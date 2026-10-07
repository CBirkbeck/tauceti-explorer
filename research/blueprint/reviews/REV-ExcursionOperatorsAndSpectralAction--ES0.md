# Independent review: Excursion operators and the spectral action, ES0–ES4

**Verdict: needs_changes. This review is complete, not a checkpoint.**

Job: `REV-ExcursionOperatorsAndSpectralAction--ES0`, issue #403. Reviewer: Codex,
session `codex-WkTheX`, 7 October 2026. The input was written by a different
session, `codex-5lvIn3`; this reviewer did none of that work.

Reviewed [packet](../packets/ExcursionOperatorsAndSpectralAction--ES0.json),
[suggested Lean](../suggested/ExcursionOperatorsAndSpectralAction--ES0.lean), and
[reader](../readmes/ExcursionOperatorsAndSpectralAction--ES0.md). The reader is
not an authorized deliverable of this issue and was read without editing.
The packet contains a checked entry for every node; those verdicts concern its
mathematical statement, source, hypotheses and planning contracts. They do not
certify that the proposed full Lean signature exists.

## Counts and outcome

| Item | Reviewed | Final |
|---|---:|---:|
| Nodes | 42 | 42 |
| Definitions / constructions / theorems / comparisons | 7 / 3 / 29 / 3 | unchanged |
| Node verdicts | 42 | 38 verified, 4 corrected |
| Added / removed nodes | 0 / 0 | 0 / 0 |
| API items / unit tests | 38 / 31 | unchanged |
| Planets | 26 | unchanged |
| Baseline declarations | 18 | all independently confirmed |
| Stages planned / closed | 8 / 0 | 8 / 0 |
| Gaps / supplier requests | 5 / 20 | 6 / 21 |
| Source findings | 0 | 1 confirmed, author-copy scope |

The mathematical target coverage, ownership, source qualifications and existing
explicit refinement contracts are substantially sound. Open supplier work by
itself is not grounds for this verdict. The blocking defect is the suggested
file's signature coverage: a comment register does not provide the definitions,
API lemma signatures, examples and named theorem signatures required by
PROTOCOL section 13. Compilation succeeds because those statements are not
Lean declarations. There is also an unresolved false assertion in the LP2
supplier, now isolated by an exact correction request, and the reader must be
synchronized in revision.

## Corrections applied

1. `ES0/excursion-datum-and-operator`: replaced the excerpt “Excursion operators”
   with the literal `Definition VIII.4.2.` at the cited location. The heading with
   the original capitalization is on p. 290, outside that entry's range.
2. `ES0/excursion-algebra-to-bernstein-center`: clarified that coherent enhanced
   comparisons give equal classes in pi0. The statement no longer sounds like
   strict equality of enhanced morphisms or a map of algebra spectra. Its
   reindexing acceptance now explicitly requires commutativity.
3. `ES4/finite-wild-central-support`: placed the dual-number test in `Perf(k)`,
   with the central action of `R=k[epsilon]/epsilon²` through `R -> k`. The object
   `k` is compact there. It is not a perfect module over the dual numbers.
4. `ES4/elliptic-parameters-and-components`: corrected the explanation of
   `S_phi/Z(H)^Gamma`. Quotienting removes central stabilizers from the finiteness
   test. It does not remove unramified central twists of the parameter.

The mathematical register in the suggested file matches these corrections.
Its executable declarations are unchanged. The baseline description now says
*preadditive* for the ring structure; biproducts are not needed for that claim.
No planets, node identifiers, ownership assignments or implementation statuses
were changed. No imported roadmap file was edited.

## Source reading and newly found misprint

The full source read was the [author-hosted 356-page
manuscript](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), SHA-256
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
The precise full hash is recorded in the packet's source metadata. The audit
covered the statements, hypotheses and relevant arguments of I.9–I.10,
VI.12, VII.7's stratum/compactness/duality interfaces, VIII.3.5–VIII.4,
VIII.5.1–VIII.5.2's statements, IX.0–IX.5 and X.0–X.3. VIII.5 proof interiors
remain imported from LP3/LP4 and are not claimed independently reconstructed.
The roadmap-added support arguments were also checked directly.

The [publisher page](https://smf.emath.fr/publications/geometrisation-de-la-correspondance-de-langlands-locale)
lists Astérisque 466 (2026), DOI 10.24033/ast.1270. Its public sample contains
only front matter and contents; the VIII.4 passage was unavailable. The
[arXiv record](https://arxiv.org/abs/2102.13459) lists v4 as the accepted version.
No byte equivalence with the downloaded author copy is assumed. The finding is
scoped to the author copy, and `sourceVersions` records this publication limit.
The publisher, arXiv record and both authors' publication pages were checked
for a relevant correction; none was found in those accessible materials.

On author-copy p. 292, VIII.4's finite-set reindexing square is called
“cartesian.” It is generally only commutative. Take `H=Q=1`, `W=C2` and
`C=Vect_L` with the trivial Weil-equivariant tensor family. For the fold
`I={1,2} -> J={1}`, both left rings are `L` and the left arrow is identity.
The right arrow restricts functions on `W²` to the diagonal `W`; both
horizontal arrows send a scalar to a constant function. The pullback is

```text
{(a,f) : a in L, f : W² -> L, f(w,w)=a for every w}.
```

A function zero on the diagonal and nonzero off it gives a pullback element
outside the image of `L`. Over `F2`, direct enumeration gives eight pullback
elements and only two source elements. Thus the stronger assertion fails even
in the trivial reductive-group case. Commutativity is sufficient for the
subsequent fusion argument, so this is recorded as a misprint affecting
nothing in the intended mathematics, with an independent confirmed verdict.

`LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`
currently imports the stronger assertion in its statement, hypotheses,
`Theta.cartesian` API and `cartesian_square` test. This job cannot edit that
supplier. A new LP2 request names every affected item and a gap records the
correction. ES continues to import coefficient independence, commutative
reindexing, unit insertion and multiplication from their single LP2 owner.

## Stage coverage, closure and ownership

| Stage | Nodes | Target coverage and refinements |
|---|---:|---|
| ES0 | 6 | Enhanced center/comparison, Bun excursions, continuous evaluation, qualified discretization; abstract relations imported from LP2. |
| ES0:classical-center | 2 | Enhanced restriction/heart map and chosen complex field transport; SR1/SR3 exports requested. |
| ES1 | 1 | Spectral, geometric and Hecke-compatible center distinction. |
| ES1:finite-ramification | 4 | Uniform cutoff, enhanced full subcategory, components and transitions; HS1/E5 refinements explicit. |
| ES1:spectral-center | 3 | Conditional spectral map, change-of-data diagrams and excluded-prime excursion route. |
| ES2 | 8 | Objectwise support, universal family/action, both rational colimit halves, Bun action/center agreement and Whittaker sheaf. |
| ES3 | 9 | Approximation, universal action, DVR colimits, free/discrete groups, good-prime comparison, integral action and conditional scalar changes. |
| ES4 | 9 | Central support and its laws/localization, duality, local shtukas and elliptic component/basic consequences. |

Every in-scope roadmap target has a node or an explicitly imported owner. The
42 nodes have suitable target-level granularity; internal proof lemmas were
not split into artificial nodes. Adding Whittaker and elliptic context is
justified by Chapter X and does not turn the categorical/packet conjectures
into acceptance targets. All eight stages remain `planned`, with exact
`remaining` contracts. Their chains reach pinned declarations, nodes, or
explicit supplier requests/gaps; none is declared closed prematurely.

External prerequisite statements and stage contracts were read. In particular,
VS4's étale classifying-stack node alone is insufficient for a lisse stratum
embedding, so the explicit VII.7 request is necessary. Current VS5 lisse duality,
HS3 general multi-leg comparison, LP3 DVR filtration, LP1/VS3/HS1 derived scalar
comparisons, E5 higher action/animation interfaces, SR1 ring-valued center and
SR3 supercuspidal Ext refinements remain real work. They are explicitly named,
not silently supplied by ordinary categories or field good filtrations. The
elliptic component's deformation argument is likewise an explicit gap.

RT-AREA-geomlanglands findings 5, 6, 7 and 9 were checked against the verifier,
along with 34 and rejected 35. The packet follows the verifier's primary
Chapter X ownership fix: ES2/ES3 own universal actions, LP4 retains VIII.5.1,
and SR1 owns the abelian ring-valued center. ES2/ES4 carry the conditional-center
prerequisites; VS5/HS3 are recorded for ES4. General Psi^b is ES7's. The enhanced
center is not discarded in response to rejected finding 35. Atlas edge changes
and supplier removals remain proposals, consistent with this issue's scope.
No Tau Ceti roadmap is replanned.

## Pinned baseline

Each of the following 18 actual declaration statements was independently read
at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Module | Declarations and confirmed scope |
|---|---|
| `CategoryTheory/Center/Basic.lean` | `CatCenter`, `CatCenter.app`, `CatCenter.naturality`, `CatCenter.ext`: ordinary End(id), components, naturality and extensionality. |
| `CategoryTheory/Center/Linear.lean` | `Linear.toCatCenter`: scalar ring map for a linear preadditive category. |
| `CategoryTheory/Functor/Basic.lean` | `Functor`: objects/maps and identity/composition laws. |
| `CategoryTheory/NatTrans.lean` | `NatTrans`: components with naturality. |
| `CategoryTheory/Preadditive/Basic.lean` | `Preadditive`: additive Hom groups and bilinear composition. |
| `RingTheory/Ideal/Defs.lean` | `Ideal`: submodule-based ideal carrier. |
| `RingTheory/Spectrum/Prime/Defs.lean` | `PrimeSpectrum`: prime-ideal carrier. |
| `RingTheory/Spectrum/Prime/Basic.lean` | `zeroLocus`, `mem_zeroLocus`, `zeroLocus_radical`, `zeroLocus_inf`, `zeroLocus_mul`, `zeroLocus_subset_zeroLocus_iff`: existing zero-locus/radical calculus. |
| `RingTheory/Ideal/Maps.lean` | `RingHom.ker`, `RingHom.mem_ker`: evaluated action kernel and zero-evaluation criterion. |

The final radical criterion is `V(I) subset V(J)` iff `J <= radical(I)`;
this gives the stated localization direction. The triangle proof correctly
uses the product of endpoint annihilators. The coefficient-change equality
correctly requires flatness and the End comparison isomorphism.

No packet baseline declaration is attributed to Tau Ceti. Its recorded pin
`f790474821cf4256814db967cb154e7af3d0c369` and the reviewed AUDIT-20 entries in
`data/library-coverage.json` were inspected. Ordinary center coverage is partial;
these entries do not supply enhanced functor mapping objects, stacky Perf or
spectral actions. The two upstream granularity/API examples read were Character
Theory and Adic Spaces, in addition to WORKERS, both protocols and the upstream
guide.

## API, tests, planets and actual Lean signatures

All ten definitions/constructions have a use-derived API and at least three
mathematically discriminating tests (38 APIs, 31 tests total). Tests distinguish
central transformations from individual object endomorphisms, nonidentity
creation/annihilation composites, twisted two-leg coefficients, a product-switch
Hecke non-example, unbounded wild conductor, regular torus Whittaker induction,
nilpotent support and nonelliptic reducible GL_n parameters. The 26 planets are
key definitions/constructions/theorems, within the six-per-layer and 60-character
limits; no renaming is needed.

A nested-comment-aware inventory of the executable Lean gives:

| Signature class | Actual syntax | Required labels |
|---|---:|---:|
| Proposed node declarations | 7 | 42 |
| Proposed API declarations | 22 | 38 |
| Examples / test labels carried by examples | 12 / 13 | 31 labels |

These are **upper bounds on faithful signatures**. For example,
`support_exact_operations` only proves a zero-locus inclusion *assuming* an
ideal product containment; it does not state the actual triangle, shift,
direct-sum and retract laws. `universalHeckeFamily` is ordinary functor
composition; its point example is just the identity-functor comparison.
`finiteWild_mem` tests ordinary group-action triviality, not enhanced descent.
The elliptic torus example asserts finiteness of a group quotient by itself,
without a parameter, group scheme or semisimplicity.

The four full definitions `enhancedCenter`, `perfApprox`, `finiteWildCategory`
and `ellipticParameter` do not occur as declarations. No full named action,
colimit, comparison or duality theorem is declared. The register makes the
missing types explicit and avoids empty Prop stand-ins, which is correct, but
that does not convert prose into section 13's signatures.

Missing node declarations (35):

- `action_change_of_data`
- `approximation_commutes_with_colimits`
- `basic_decomposition_of_an_elliptic_component`
- `center_change_of_data`
- `center_on_finite_wild_pieces`
- `central_localization`
- `complex_block_comparison`
- `component_decomposition`
- `continuity_of_excursion_evaluations`
- `degree_zero_center_agreement`
- `derived_reduction_and_rationalization`
- `discrete_group_presentation`
- `discrete_integral_spectral_action`
- `discretisation_of_the_weil_group`
- `duality_and_the_chevalley_involution`
- `ellipticParameter`
- `elliptic_parameter_component`
- `enhancedCenter`
- `enhanced_to_homotopy_center`
- `excursion_algebra_to_bernstein_center`
- `excursion_algebra_without_the_coefficient_condition`
- `finiteWildCategory`
- `free_group_case`
- `integral_spectral_action`
- `integral_universal_action`
- `local_shtuka_excursion_compatibility`
- `map_to_the_classical_bernstein_center`
- `mapping_stack_commutes_with_sifted_colimits`
- `perfApprox`
- `pushout_of_affine_quotients`
- `spectral_action_rational`
- `spectral_to_geometric_center_map`
- `support_coefficient_change`
- `uniform_wild_subgroup`
- `universal_action_theorem`

Missing API declarations (16):

- `bunExcursionOperator_function`
- `bunExcursionOperator_fusion`
- `compactAction_finite_sum`
- `ellipticParameter_central_twist`
- `ellipticParameter_conjugate`
- `ellipticParameter_iff`
- `enhancedCenter_ind`
- `finiteWild_stable`
- `perfApprox_compare`
- `perfApprox_evaluation`
- `perfApprox_finite`
- `perfApprox_lift`
- `universalHecke_fusion`
- `universalHecke_unit`
- `whittakerSheaf_ind_action`
- `whittakerSheaf_support`

Test labels without any executable example (18):

- `center_module_category`
- `center_zero_category`
- `compactAction_unbounded_family`
- `compactAction_zero`
- `ellipticParameter_GL2_trivial`
- `ellipticParameter_GLn_irreducible`
- `excursion_nonsplit`
- `excursion_two_leg_trace`
- `finiteWild_regular_action`
- `finiteWild_tensor_generator`
- `finiteWild_zero`
- `perfApprox_empty`
- `perfApprox_point`
- `perfApprox_rational`
- `universalHecke_empty`
- `universalHecke_free_loop`
- `whittakerSheaf_torus`
- `whittakerSheaf_trivial_group`

The 13 example labels present are center_scalar_eval, heckeCenter_scalar,
excursion_trivial_rep, excursion_identity_tuple, heckeCenter_identity,
compactAction_single_piece, universalHecke_point, whittakerSheaf_stratum,
centralSupport_zero, centralSupport_free, centralSupport_nilpotent,
ellipticParameter_torus and heckeCenter_product_switch. The scalar example
carries two labels; comments inside the full register are not counted as tests.
Several present examples are only ordinary observations, as described above.

## Per-node evidence

All identifiers below have the `ExcursionOperatorsAndSpectralAction:` prefix.
The packet's 42 checked records contain the fuller reasoning and signature limits.

| Node | Verdict | Independent check |
|---|---|---|
| `ES0/bernstein-center-of-a-category` | verified | Enhanced End(id), E2/pi0, compact/Ind; not ordinary CatCenter. |
| `ES0/enhanced-to-homotopy-center` | verified | Natural projection to homotopy center; no general isomorphism. |
| `ES0/excursion-datum-and-operator` | corrected | Arbitrary matrix-coefficient maps and twisted HS4 fusion; literal excerpt corrected. |
| `ES0/excursion-algebra-to-bernstein-center` | corrected | Coherent relation comparisons yield equal pi0 classes; wording corrected. |
| `ES0/continuity-of-excursion-evaluations` | verified | Condensed continuity uses compact relatively discrete Hom. |
| `ES0/discretisation-of-the-weil-group` | verified | Intrinsic cocycle comparison; torsion-free qualification retained. |
| `ES0:classical-center/map-to-the-classical-bernstein-center` | verified | Enhanced j_! restriction then smooth heart; SR1 owns ordinary center. |
| `ES0:classical-center/complex-block-comparison` | verified | Chosen abstract field transport; no condensed-topology transport. |
| `ES1/spectral-and-geometric-centers` | verified | Spectral/geometric distinction and stronger Hecke compatibility. |
| `ES1:finite-ramification/uniform-wild-subgroup` | verified | One P for all I,V on each compact; tensor generator/pro-p argument. |
| `ES1:finite-ramification/component-decomposition` | verified | Clopen idempotents, compact direct sum and Ind product. |
| `ES1:finite-ramification/center-on-finite-wild-pieces` | verified | Compatible cutoff inclusions; invariant comparison only in range. |
| `ES1:spectral-center/spectral-to-geometric-center-map` | verified | IX.5.2 center-order condition; general Psi^b belongs to ES7. |
| `ES1:spectral-center/center-change-of-data` | verified | Conditional data-change diagrams, without invariant tensor isomorphism. |
| `ES1:spectral-center/excursion-algebra-without-the-coefficient-condition` | verified | Excursion-only route at excluded center primes. |
| `ES2/compactly-supported-actions` | verified | Objectwise orbit factorization, common finite refinement. |
| `ES2/universal-parameter-hecke-family` | verified | Universal derived evaluation with coherent finite-set transport. |
| `ES2/universal-action-theorem` | verified | Equivalence of full action anima, not just isomorphism classes. |
| `ES2/mapping-stack-commutes-with-sifted-colimits` | verified | Sifted/all colimits distinguished by target category. |
| `ES2/pushout-of-affine-quotients` | verified | Derived affine quotient pushout; pro-reductive rational hypotheses. |
| `ES2/spectral-action-rational` | verified | Rational Bun action, all ell != p, no full-faithfulness assertion. |
| `ES2/degree-zero-center-agreement` | verified | Same invariant generator evaluations; explicitly added comparison. |
| `ES3/sifted-colimit-approximation` | verified | Finite Q-torsor-set animation, not an actual approximate scheme. |
| `ES3/integral-universal-action` | verified | Universal action on approximation, before good-prime comparison. |
| `ES3/approximation-commutes-with-colimits` | verified | DVR highest-weight tensor identity; LP3 refinement explicit. |
| `ES3/free-group-case` | verified | Twisted free-group quotient; only representation-generated image. |
| `ES3/discrete-group-presentation` | verified | Sifted free-group resolution and animated equivariant algebra. |
| `ES3/discrete-integral-spectral-action` | verified | Good-prime generation is the actual-Perf comparison step. |
| `ES3/integral-spectral-action` | verified | Continuous universal theorem and Bun specialization; enrichment retained. |
| `ES3/action-change-of-data` | verified | Coherent action comparisons through supplied coefficient/Q/P functors. |
| `ES3/derived-reduction-and-rationalization` | verified | Derived reduction conditional on both Perf and geometric comparisons. |
| `ES1:finite-ramification/finite-wild-Hecke-category` | verified | Simultaneous enhanced quotient-equivariant descent; ordinary triviality weaker. |
| `ES2/whittaker-sheaf` | verified | Closed-subgroup Whittaker induction, j_!, no assumed compactness. |
| `ES4/finite-wild-central-support` | corrected | Kernel zero locus; nilpotent test corrected to compact object in Perf(k). |
| `ES4/support-exact-operations` | verified | Triangle annihilator product; finite sum, shift and retract laws. |
| `ES4/support-coefficient-change` | verified | Containment generally; equality needs flatness and actual End comparison. |
| `ES4/central-localization` | verified | Telescope power-annihilation criterion; correct radical direction. |
| `ES4/duality-and-the-chevalley-involution` | verified | Lisse BZ duality and rho-hat(-1) correction before quotient. |
| `ES4/local-shtuka-excursion-compatibility` | verified | Full multi-leg comparison; level/tower smooth actions distinguished. |
| `ES4/elliptic-parameters-and-components` | corrected | Semisimplicity and finite group-scheme quotient; stabilizer explanation corrected. |
| `ES4/elliptic-parameter-component` | verified | Unramified-twist component retains stack stabilizer; deformation gap explicit. |
| `ES4/basic-decomposition-of-an-elliptic-component` | verified | Basic/supercuspidal structure; conjectural packet indexing separate. |

## Revision requirements and validation

1. Supply genuine Lean signatures for the missing definitions, APIs, examples
   and named theorems, and replace weaker observations where they omit the
   actual mathematical relationship. Use honest typed mathematical interfaces;
   preserve the prohibition on empty Prop-valued fields or assumed arbitrary
   propositions. The existing prose is useful as a specification, not as
   evidence of elaborated signatures.
2. Have the LP2 owner correct the cartesian assertion and its API/test. The
   exact request and counterexample now specify the required export; do not
   duplicate LP2's abstract excursion construction in ES.
3. Synchronize the reader with the four corrections, source issue/version
   record and honest signature inventory in the revision job that owns it.
   Existing source assertions, conditions and supplier gaps should be retained.
4. Submit the revised artifacts for a fresh independent review. This report
   finishes #403; it does not leave part of this review for another worker.

Checks: `python3 scripts/check_blueprint.py` reports zero errors and zero
warnings on the final packet. The source issue and sourceVersions pass their
schema checks. All 42 checked records and 18 baseline entries were checked for
coverage; source excerpts were checked at their locators. A nested-comment-aware
comparison confirms the final executable Lean is identical to the compiled
input. `lean-check` at the pinned Mathlib completed successfully with only
`sorry` warnings, after the required memory check. This validates the ordinary
prototypes only. The fold-square counterexample was independently enumerated
over F2. Diff/path/JSON checks are recorded in the handoff.
