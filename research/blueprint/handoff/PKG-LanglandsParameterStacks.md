# PKG-LanglandsParameterStacks — blocked checkpoint

## Current run: codex-0eBLPA, 10 October 2026

Issue [#7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909).
Worker: Codex (GPT-6), session `codex-0eBLPA`.
Branch: `codex-0eBLPA-langlands-parameter-stacks`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6097056546).

**Blocked; this is not a completed package.** The manager's priority issues
were checked individually; none was available. The available-swarm listing
contained 746 issues, with this package the first eligible focus job in the
worker ordering. The bot confirmed the claim before research began. No second
job was claimed.

The obstruction is unchanged at the current read-only revisions recorded
below. The LP packet, IHG packet, E5 suggested input, package README and
package Suggested.lean have exactly the hashes in the inherited receipt
table. A successful elaboration cannot discharge the missing signatures or
correct the supplier's mathematical scope. The issue explicitly restricts
changes to package outputs and this handoff and says to describe plan mistakes
here. PROTOCOL sections 3, 13, 15 and 20 require adequate supplier contracts,
faithful signatures and single ownership. The required owner changes fall
outside this job. This stopping condition is a specification conflict, not
missing implementation of a sufficiently specified prerequisite or lack of
time for a long job.

### Concrete repair contract for the generic invariant supplier

The accepted IHG.0 definition uses identity-component invariants for a
generalized reductive group. In contrast, current upstream IHG README
section 0.7 explicitly supplies connected reductive applications, and its
`InvariantCoordinateInput.ring` quantifies the conjugating point over the
whole represented group. Passing `J = H ⋊ Q` to that definition gives
`O[J^n]^J`, not the required `O[J^n]^H`. Passing only `H` instead changes the
tuple space to `H^n` and loses the nonidentity component tuples. Neither
substitution implements the accepted LP prescribed-projection fibre.

The smallest useful owner repair must separate the represented tuple group
from the acting identity component. For noetherian coefficient ring O and
generalized reductive J, supply J's coordinate Hopf algebra, the closed
subgroup J⁰ and its inclusion, and the subalgebra of `O[J^n]` fixed under
simultaneous conjugation by J⁰. Define its invariance over every commutative
O-algebra, retaining nonreduced test points. Supply actual regular-function
evaluation, coordinate reindexing and ordered multiplication with their
evaluation equations. For a split finite-Q semidirect product, expose the
component idempotents and their evaluation at the component projection.
Then state reconstruction with J⁰-conjugacy and the algebraically closed-field
hypotheses of Quast Theorem 3.7 (p.13). This is an extension of the generic IHG
owner; LP should import it and impose its eta-fibre rather than duplicate it.

Use these three discriminating checks when repairing that supplier:

1. For connected J, recover the existing whole-group invariant coordinate
   algebra and the same evaluation, reindexing and multiplication maps.
2. For `J = G_m ⋊ C₂` with inversion action over ℚ, the regular function
   `(x,0)` in `ℚ[x,x⁻¹] × ℚ[x,x⁻¹]` belongs to the identity-component
   invariant algebra but fails whole-J invariance. It evaluates to 2 and 1/2
   on the two trivial-projection lifts of Z already in the package fixtures.
3. In that same example, the component idempotent `(1,0)` evaluates to 1 on
   both lifts. Thus imposing the projection on whole-J invariants cannot
   recover the lost distinction between their H-conjugacy classes. Keep the
   existing proof that they are J-conjugate and not H-conjugate.

These tests identify the mathematical distinction; the inherited fixtures
are unchanged and no new generic implementation is claimed. Quast
Definition 3.1 (p.11), Lemma 3.5 (pp.12–13) and Theorem 3.7 (p.13) were
freshly read from the author PDF. Fargues–Scholze Proposition VIII.3.7
(pp.288–289) uses the same H-conjugation tuple quotient, and Proposition
VIII.3.8 (p.290) keeps H-conjugacy in its classification. Both fresh downloads
match the inherited source SHA-256 receipts. The coefficient convention
preceding Definition VIII.1.1 (p.278) and the matrix description (p.279)
require finite-type Z_l-module values on inertia as well as continuity; the
current connected, profinite, rank-one-valued IHG continuity contract does
not state this finite-Q condensed extension.

The other owner repair remains necessary: E5's `SymMonInftyCat` has `True`
fibration/Segal conditions, `CAlg` and `AnimatedAlg` are `Unit`, and
`IndInfty` is `True`. These are insufficient interfaces for the accepted
derived-stack, coherent Hecke, IndPerf and universal-bundle signatures.
The current AlgebraicVectorBundles roadmap, read in full with ReductiveGroups,
develops ordinary scheme sheaves and vector bundles; its L0–L2 do not extend
those signatures to derived quotient stacks. The retained worklist below
identifies the exact owners and missing signature families.

### Fresh validation in this run

- Read-only upstream roadmap revision:
  `48cda9fcc5dbdc8f8d51e717f6a3090e0c4cd688`; native Tau Ceti revision:
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither tree was changed.
- Read all eight LP library-audit entries and the exact LP/IHG consumer and
  supplier statements involved in the obstruction. The LP acceptance text
  expressly retains G1–G4, G6 and omitted enhanced signatures.
- Both LP and IHG `check_blueprint.py` checks: exit 0, zero errors and
  warnings. LP still has 79 targets, 140 API entries, 90 tests, five gaps,
  sixteen requests and eight planned, unclosed stages.
- `lean-check research/blueprint/packages/LanglandsParameterStacks/Suggested.lean`:
  exit 0, zero errors, 291 warnings, all `declaration uses sorry`.
  Available memory before elaboration: 105 GB. The check finished; no Lean
  process was left running. It used the managed Mathlib 082e2d3 baseline.
- Scoped intake file check: one authorized handoff, zero problems.
  `git diff --check` passes.
- No source passage or private source file was copied into the repository.
  No additional source erratum, ownership move or supplier fix is asserted.

Only this handoff is changed. Metadata remains absent so the incomplete
package is not misclassified as complete by the existence-based package
intake. The repair contract above and all inherited resumption information
are in this file; no scratch artifact is needed by the next worker.

## Inherited checkpoint and resumption detail

The following records the preceding worker's work. Claims of isolated fixture
elaboration and axiom reports in this section are that worker's receipts;
this run rechecked the whole package and the source distinctions, without
rerunning those isolated reports.

Issue [#7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909).
Worker: Codex (GPT-6), session `codex-LQHe2n`, 10 October 2026.
Branch: `codex-LQHe2n-langlands-parameter-stacks`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6097138012).

**Incomplete: completion requires changes to supplier contracts and the accepted
plan outside this issue's deliverables.** This checkpoint adds finite-projective
ordinary excursion-data reindexing, external tensors, coefficient laws and
concrete checks; it also synchronizes README §§LP2e.14–15. No second job was
successfully claimed.

## Work and stopping condition

The manager's list had no available issue in the available-swarm listing.
A claim attempt on #5702 lost to another worker before work began. Under the
fallback order this focus package was then claimed, with bot confirmation.
Only this package and its handoff have been changed.

Read the worker and blueprint/expansion protocols, upstream guide, issue,
accepted inputs, inherited handoff and the reviewed library audit. Inspected
current upstream supplier declarations and primary sources to check the
obstructions below, rather than treating previous checkpoint conclusions as
sufficient. Read AlgebraicVectorBundles and ReductiveGroups READMEs in full.

The useful local extension is the ordinary linear-algebra part of FS
Definition VIII.4.2 and the proof of Proposition VIII.4.1 (pp.291–292):

- `ExcursionDatum` now requires finite I and finite-projective V through
  Mathlib's existing `Fintype`, `Module.Finite` and `Module.Projective`.
- `ExcursionDatum.reindex` pulls back the representation along J-tuples→I-tuples;
  `reindex_tuple` records the tuple-compatibility hypothesis required for an
  operator comparison. A newly chosen tuple does not automatically preserve
  the old operator.
- `ExcursionDatum.tensor` uses `Representation.tprod`, tensor α, the functional
  β⊗β′ followed by `TensorProduct.lid`, and the ordered concatenated tuple.
  Mathlib's `Module.Finite.tensorProduct` and `Module.Projective.tensorProduct`
  supply closure, rather than a second tensor representation construction.
- The two matrix-coefficient comparison laws have actual proofs. The
  `coefficient_product` test is present. Named rational tests distinguish
  2×3=6 from addition or a unit, retain distinct tuple entries 2 and 3, and
  fold only after specifying the common tuple 5. The fold-compatibility
  equation is checked separately. `ExcursionDatum.scalar` supplies the
  trivial-representation fixtures.

This remains an ordinary point-group representation interface. Algebraic
regularity, canonical matrix-coefficient presentations and categorical Hecke
operators are not supplied by it. Existing genuine base-change, nonflat
reduction and identity-component proof fixtures have been preserved.

The issue says “Change no packet; if the plan has a mistake, describe it in the
handoff note.” Its only allowed outputs are the three package files and this
handoff. PROTOCOL §§3, 13, 15 and 20 require adequate supplier statements,
faithful signatures, shared ownership and agreement with the accepted plan.
The owner changes below cannot be made inside those outputs. This is a
specification obstruction, independent of the eight-hour limit; implementation
of an already adequate supplier is not the stopping condition.

The accepted LP packet still has 79 nodes, 140 API items, 90 tests, eight
planned stages, zero closed stages, five gaps and sixteen requests. Its review
retains G1–G4, G6, supplier extensions and omitted enhanced signatures.
Structural acceptance does not supply the missing contracts.

## Contracts that must change before completion

Current upstream roadmap revision inspected:
`8acc80159cfd301db68bde9393a52668efdd8c8c`.
Current native Tau Ceti revision inspected:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
These differ from the pinned elaboration baseline. IHG, AlgebraicVectorBundles
and ReductiveGroups have no diff from the preceding handoff's upstream revision
`48cda9fcc5dbdc8f8d51e717f6a3090e0c4cd688`. Read IHG §0.7 and its relevant
suggested signatures, all eight LP library-audit records, and named
consuming/supplying nodes. The inherited limited native-library name search
found no declarations named `DerivedParameterStack`,
`ProjectedPseudocharacter`, `IndInfty`, `SymMonInftyCat`, `AnimatedAlg`,
`ReductivePseudocharacter` or `InvariantCoordinateInput`; this is a limited
name search, not a comprehensive audit of the newer library.

| Consumer | Actual inspected contract | Required owner change |
| --- | --- | --- |
| LP2c.1 projected pseudocharacters; LP2c.2 algebraic reconstruction | Upstream IHG README §0.7 restricts reductive applications to connected groups. `InvariantCoordinateInput.ring`, Suggested.lean lines 795–804, tests conjugation by every point of the represented group over every coefficient algebra. For J=H⋊Q this supplies O[Jⁿ]^J, whereas LP requires O[Jⁿ]^H and uniqueness up to H-conjugacy. | At the generic owner, supply the identity-component tuple algebra with regular evaluation, reindexing, multiplication, and generalized-reductive reconstruction. Reconcile the LP supplier edges. Component-idempotent conditions alone cannot repair the whole-J invariant algebra. |
| LP2c.3 relatively discrete characteristic-zero continuity | The accepted IHG `IHG.1/reductive-valued-continuity` node is connected/profinite/rank-one-valued. Upstream `IsContinuous`, `continuous_ofRepresentation` and `continuous_dense_ext`, Suggested.lean lines 948–965, test coordinate continuity, assume continuous representation input, and give dense uniqueness. None proves continuity of an algebraically reconstructed lift or the required finite-type inertia coefficient bounds. | At IHG, add the finite-Q reconstruction-to-continuity theorem with H-conjugation and the relatively discrete finite-type Z_l-module condition; then reconcile G4 and LP's prerequisites. |
| LP1 derived parameter stack; LP2 categorical Hecke data; LP3 mapping approximation; LP4 universal bundles | `EnhancedDerivedSheaves--E5.lean`, lines 76–115 and 141–199, has `True` monoidal/stability/coherent-action conditions, `Unit` for `CAlg` and `AnimatedAlg`, and `True` for `IndInfty`. Ordinary AlgebraicVectorBundles L0–L2 does not supply enhanced quotient-stack Perf. | E0/E5 must specify genuine enhanced monoidal, stable, animated and Ind carriers and coherence; SF.1/S.1 must supply derived-stack QCoh/Perf and descent. LP specializes those interfaces. |

The accepted IHG `IHG.1/reductive-reconstruction` node does state generalized
reductive reconstruction with identity-component uniqueness, but its
prerequisites still include the entire LP3 stage and its invariant-evaluation
input. Its broad theorem statement does not change the upstream whole-group
coordinate definition. Reconcile both the carriers and the prerequisite
contracts; reconstruction over algebraically closed fields must not acquire
LP3's good-prime generation hypothesis.

## Primary-source verification and concrete distinction

This session read the author PDFs through the browser and inspected Quast,
*Deformations of G-valued pseudocharacters*, Definition 3.1 (p.11),
Lemmas 3.4–3.5 (pp.12–13), and Theorem 3.7 with the opening reconstruction
argument (pp.13–14). Tuple invariants and reconstructed conjugacy classes use
the identity component. Agreement of whole-group and identity-component
orbit closedness does not identify their orbit sets.

Inspected Fargues–Scholze, *Geometrization of the local Langlands
correspondence*, the coefficient convention and Definition VIII.1.1 (p.278),
Propositions VIII.3.7–VIII.3.8 and their proof discussion (pp.288–290).
Also read Definition VIII.4.2 and the proof of Proposition VIII.4.1
(pp.291–292) for the new ordinary coefficient constructions.
The local invariant tuples use H-conjugation in H⋊Q with a prescribed
component projection. Continuity of the reconstructed cocycle requires its
own finite-anchor argument; relatively discrete coefficients also impose
finite-type Z_l-module bounds on profinite test sets.

These are targeted source checks, not a new audit of every auxiliary proof.
No new source erratum is asserted. The following SHA-256 receipts are
retained from the preceding worker's fetch, not fresh hash checks in this run:

- [Quast author PDF](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf),
  SHA-256 `67eb82118e49df3f7da6c1e211ad9961fc7323fc4d09d0559bcbc2434eead827`.
- [Fargues–Scholze author PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
  SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.

The existing `IdentityComponentChecks` uses H=G_m, Q=C₂ acting by inversion,
and J=H⋊Q. Two lifts of Z with trivial Q-projection send its generator to 2
and 1/2. H-conjugation cannot identify them; a component-switching element of
J conjugates one lift to the other. Thus whole-J invariant tuple functions
identify them in every arity. The regular coordinate fixture uses the actual
two-factor Laurent algebra O[J]: the function (x,0) is H-invariant and
separates those generator values, but component switching sends it to
(x⁻¹,0). The component idempotent (1,0) is invariant under both actions.
Its prescribed value does not restore the lost coordinate.

The preceding checkpoint's isolated elaboration of these unchanged fixtures
had no errors or warnings. Its axiom reports for `lifts_not_h_conjugate`,
`whole_group_invariants_equal`, `coordinate_h_invariant` and
`coordinate_not_switch_invariant` contain only `propext`, `Classical.choice`
and `Quot.sound`, with no `sorryAx`. These are verified boundary checks,
not a generic reconstruction or pseudocharacter implementation.

## Signature inventory for resumption

A fresh screen compared all 140 API names and 90 test names in the accepted
LP packet against the whole Suggested.lean, including comments. The following
42 API entries have even their final name component absent as a word token;
42 test identifiers remain absent after adding `coefficient_product`.
`ExcursionDatum.operator` remains absent as a declaration, although the new
reindexing comment contains the word “operator”. This is a conservative
absence worklist, not a signature-coverage certificate. A common
name such as `unit`, `map` or `tensor` elsewhere in the file cannot certify an
API entry, and a name appearing only in a comment cannot certify a test.
Check the exact statements in the cited node after the owner contracts change.

Every target suffix in the tables is relative to `LanglandsParameterStacks:`.

### API entries with absent final name components

| Target suffix | Required API entries |
| --- | --- |
| `LP0/condensed-cocycles-and-L-parameters` | `condensedCoefficients`, `LParameter.matrixCriterion` |
| `LP0/finite-wild-ramification` | `LParameter.finiteWild` |
| `LP0/wild-enhancement-group` | `wildEnhancementGroup.restrictRep` |
| `LP0/extended-wild-parameters` | `ExtendedWildParameter`, `WildParameterClasses`, `restrictEnhancedParameter` |
| `LP1/derived-parameter-stack` | `DerivedParameterStack`, `DerivedParameterStack.forgetFraming`, `DerivedParameterStack.classicalPoints`, `DerivedParameterStack.perfectPullback` |
| `LP1/singularities-and-singular-support` | `ParameterSingularities`, `ParameterSingularities.fiber`, `ParameterSingularities.embed`, `ParameterSingularities.smoothPullback` |
| `LP2:excursion-presentation/complete-reducibility` | `IsStronglyReductive`, `IsAbsolutelyGCompletelyReducible`, `IsStronglyGIrreducible` |
| `LP2:semisimple-characters/semisimple-parameters-and-closed-orbits` | `IsSemisimpleParameter`, `IsSemisimpleParameter.leviCriterion`, `IsSemisimpleParameter.GL` |
| `LP2:excursion-presentation/categorical-hecke-datum` | `CategoricalHeckeDatum`, `CategoricalHeckeDatum.create`, `CategoricalHeckeDatum.annihilate` |
| `LP2:excursion-presentation/invariant-function-and-independence` | `excursionMatrixCoefficient.canonicalPresentation`, `excursionMatrixCoefficient.operatorIndependent` |
| `LP2:semisimple-characters/reductive-pseudocharacters` | `ProjectedPseudocharacter.ofLift` |
| `LP2:semisimple-characters/GL-trace-pseudocharacters` | `GroupTraceAdapter.equiv` |
| `LP3/good-filtration-t-structure` | `goodFiltrationTStructure`, `goodFiltrationTStructure.connective_iff`, `goodFiltrationTStructure.coconnective_iff`, `goodFiltrationTStructure.tensorConnective`, `goodFiltrationTStructure.homotopy` |
| `LP3/induced-perfect-complexes` | `InducedPerfectComplexes`, `InducedPerfectComplexes.retract`, `InducedPerfectComplexes.moduleFunctor`, `InducedPerfectComplexes.minimal` |
| `LP3/mapping-approximation` | `ParameterMappingApproximation`, `ParameterMappingApproximation.finiteTorsor`, `ParameterMappingApproximation.leftKan`, `ParameterMappingApproximation.ind` |
| `LP4/rep-action-on-perf` | `UniversalRepresentationBundle` |

### Absent test identifiers

| Target suffix | Required tests |
| --- | --- |
| `LP0/condensed-cocycles-and-L-parameters` | `parameter_char_l`, `parameter_not_discrete_Ql` |
| `LP0/extended-wild-parameters` | `extended_wild_unramified`, `extended_wild_conjugacy`, `extended_wild_forget` |
| `LP1/finite-presentation-over-Z-invert-p` | `scheme_l_adic` |
| `LP1/derived-parameter-stack` | `derived_stack_trivial_group`, `derived_stack_free_group`, `derived_stack_gauge` |
| `LP1/singularities-and-singular-support` | `singularities_smooth`, `singularities_torus_Ql`, `singularities_torus_mod_l`, `singularities_dual` |
| `LP2:excursion-presentation/coarse-quotient` | `coarse_torus`, `coarse_not_orbit_set` |
| `LP2:excursion-presentation/complete-reducibility` | `cr_torus`, `cr_unipotent`, `cr_GL` |
| `LP2:semisimple-characters/semisimple-parameters-and-closed-orbits` | `semisimple_split_GL`, `semisimple_unipotent` |
| `LP2:excursion-presentation/categorical-hecke-datum` | `hecke_empty_set`, `hecke_fold`, `hecke_zero_category` |
| `LP2:excursion-presentation/excursion-datum` | `datum_zero_alpha`, `datum_tensor_operator` |
| `LP2:semisimple-characters/reductive-pseudocharacters` | `projected_rank_one`, `projected_conjugate`, `projected_unipotent` |
| `LP3/good-filtration-t-structure` | `good_torus`, `good_zero`, `good_induced`, `good_shift_sign` |
| `LP3/induced-perfect-complexes` | `induced_point`, `induced_trivial_group`, `induced_retract`, `induced_not_all_bad_prime` |
| `LP3/mapping-approximation` | `approx_point`, `approx_coproduct`, `approx_bad_prime` |
| `LP4/rep-action-on-perf` | `rep_bundle_unit`, `rep_bundle_at_parameter`, `rep_bundle_tensor` |

The seven enhanced/admissible families in earlier checkpoints also require
semantic recovery of their complete APIs, even where a final-name token
occurs elsewhere: extended wild parameters; derived parameter stacks;
categorical Hecke data; good-filtration t-structures; induced perfect
complexes; mapping approximation; universal representation bundles. For
example, `DerivedParameterStack.framed`, `CategoricalHeckeDatum.reindex`,
`InducedPerfectComplexes.pullback`, and the universal bundle's unit/tensor/
reindex/action/base-change comparisons are not certified by this screen.
Retain these additional entries from the previous semantic worklist even
though their final name components occur elsewhere in the file:

| Family | Additional API obligations |
| --- | --- |
| Extended wild parameters | `ExtendedWildParameter.forget` |
| Derived parameter stack | `DerivedParameterStack.framed` |
| Categorical Hecke datum | `CategoricalHeckeDatum.unit`, `CategoricalHeckeDatum.reindex`, `ExcursionDatum.operator` |
| Induced perfect complexes | `InducedPerfectComplexes.pullback` |
| Mapping approximation | `ParameterMappingApproximation.compare` |
| Universal representation bundles | `UniversalRepresentationBundle.unit`, `UniversalRepresentationBundle.tensor`, `UniversalRepresentationBundle.reindex`, `UniversalRepresentationBundle.act`, `UniversalRepresentationBundle.baseChange` |

The generic `InvariantTupleShadow` and its projected fibre remain explicitly
ordinary prototypes with missing geometric inputs.

## Retained mathematical worklist

1. **G1 — supplier extensions.** Register and verify the actual reductive,
   admissible-complex, root-system and highest-weight inputs. Integral
   highest-weight theory extends the accepted
   ReductiveGroupsIntegralRepresentationsPartII direction through its
   registered ReductiveGroups Layer 9 parent until design stage ids exist.
   Neither that parent nor RG2.5 supplies all Jantzen, Donkin, Koppinen,
   TvdK, Procesi and related inputs. Do not invent a general GIT RG2.6 owner.
2. **G2 — source-open independence.** Keep the canonical independence theorem
   for the l-torsion-free excursion quotient. Full torsion-sensitive
   independence at arbitrary bad primes remains an open source question.
3. **G3 — faithful carriers.** Complete condensed coefficients, admissible
   enhancements, derived Weil cochains/duality, cotangent and singular-support,
   parabolic/Levi, regular invariant quotients, and enhanced category
   signatures only against their actual owner interfaces. Preserve the
   distinction between ordinary shadows and the full definitions.
4. **G4 — continuity.** Add finite-Q, H-conjugacy reconstruction continuity
   with locally finite-type coefficients. Dense extensionality is insufficient;
   the accepted IHG source issue E13 prevents treating Quast Theorem 3.8's
   printed argument as an unchecked replacement.
5. **G6 — ownership and prerequisite reconciliation.** Replace broad LP3
   inputs to IHG generic reconstruction by precise unconditional
   regular-function and field-GIT inputs. Give shared Seshadri/Haboush/
   power-lifting inputs one owner across LP and deformation-ring consumers.
   No ownership move has been made in this package run.
6. On IndPerf, good-filtration connective means D^{≤0}; truncations need not
   preserve Perf. In positive characteristic, dualizable perfect complexes
   differ from compact objects of unrestricted quotient-stack categories.
7. Mapping approximation is a category-valued sifted left Kan extension.
   The base set is finite, while the total Γ-torsor need not be. Keep the
   bad-prime PGL_l, Γ=Z exclusion of the unit skyscraper.
8. Universal representation bundles precede good-prime generation and carry
   no inherited prime restriction. Keep coherent action, tensor/fusion,
   evaluation at a parameter and coefficient-pullback comparisons.
9. Wild enhancements restrict admissible complex parameters and their
   enhancement representations; restriction need not remain irreducible.
   Keep the algebraic component denominator and embedded invariant dual centre.
10. Use coaction invariants over all test algebras. Normal wild kernels must
    lie in the action kernel. Geometric degree negates arithmetic degree on
    the same Weil carrier, with Tate values q⁻¹ and q respectively.
11. Chapter X actions and applications remain with
    ExcursionOperatorsAndSpectralAction. Preserve inherited locator corrections:
    FS VIII.5.18, p.308 uses prime-to-characteristic order of the acting group
    P; Lafforgue Proposition 10.8 is on pp.138–139. These two locator checks
    were not repeated in this session.

Keep the existing SR.6 supplier boundaries:

| Imported target | Supplier | LP addition |
| --- | --- | --- |
| Crossed cocycles, section/gauge laws | SR.6.1 crossed-cocycles | Restriction and condensed comparisons |
| Dense finite-wild model and l-adic extension | SR.6.1 finite-wild-discretization, ell-adic-extension | Geometric degree and relatively discrete interface |
| Integral cocycle scheme | SR.6.1 finite-wild-representability | All-depth gluing, derived/condensed comparisons |
| Excursion algebra and coefficient identities | SR.6.3 excursion-algebra | Arbitrary-source extensions and enhanced operators |
| Universal homeomorphism and invariant comparison | SR.6.3 excursion-invariant-comparison | Enhanced colimit, cohomology and stronger base change |

Checkpoint [#8322](https://github.com/CBirkbeck/tauceti-explorer/pull/8322)
records the SR.6.1–SR.6.3 inspection; it was not repeated here. SR.6.2 strata
are finite at a fixed wild cutoff, not across all depths. Migrate ordinary
local prototypes to owner imports when the LP plan is reconciled. The common
invariant equalizer already uses Mathlib.

## Preserve existing proof work

The package also contains the preceding worker's actual canonical
`ParameterInvariantAlgebra.baseChangeMap`: it restricts scalar extension of
the invariant inclusion to Mathlib's equalizer, for every coefficient change.
Its `baseChangeHom_tmul` and `baseChangeMap_tmul` equations are proved.
`NonflatReductionChecks.nonflat_reduction` uses the sign action on Z[X]:
integer invariants have zero X-coefficient, whereas reduction modulo 2 makes
1⊗X invariant with no preimage under the genuine tensor comparison.
`flat_nonflat_reduction` invokes that theorem. It concerns a general invariant
adapter for a disconnected acting group, not the parameter-specific good-prime
theorem. The earlier isolated axiom checks had no `sorryAx`; this session
re-elaborated the whole package but did not repeat those four isolated reports.

The preceding BHKT fetch receipt, retained for source work but not re-fetched
here, is the
[Acta PDF](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf),
SHA-256 `15c4b9668e335f75225215bb367c1051769990595232f8015f441d2e2c86ba2c`.

## Validation and output state

- `check_blueprint.py` for LP and IHG: both exit 0, zero errors and warnings.
  These structural checks do not certify the semantic supplier contracts.
- Final `lean-check research/blueprint/packages/LanglandsParameterStacks/Suggested.lean`:
  exit 0, no errors; 291 warnings, all `declaration uses sorry`, no other
  warnings. Available memory before the final check: 86 GB.
- The isolated matrix-coefficient section also elaborates. Its five warnings
  are the inherited unit, evaluation, unit/zero coefficient and bi-invariance
  proofs, all `sorry`. Nine axiom reports exclude `sorryAx`: `scalar`,
  `reindex`, `tensor`, both coefficient comparison theorems and all four named
  `MatrixCoefficientChecks` tests. Their only axioms are `propext`,
  `Classical.choice` and `Quot.sound`. Available memory: 88 GB.
- Managed elaboration baseline advertised by `lean-check`: Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The Mathlib source-tree git
  revision agrees. The prepared Tau Ceti build has no `.git`; its advertised
  pin is not a new source-tree git receipt.
- Scoped intake check: three authorized files, zero problems.
  `git diff --check` passes. README is 191851 bytes, within the 200 KB limit.

Unchanged input and final artifact SHA-256 receipts:

| File | Bytes | SHA-256 |
| --- | ---: | --- |
| LP packet | 375204 | `e3554e4ad95f573e992965939391157a755455b65305fd34508538b52e7b8087` |
| IHG packet | 891679 | `1d06c30103ac2c17a0c2964e2c7721d66c5e939b6b9898f7441d9abdf01a782b` |
| E5 suggested input | 10410 | `e8119768303f20e9952f0576d1ea163903060e1bfccfd4b9fe97528a32f8ac7c` |
| Package README | 191851 | `894abc8701db52f1ffaffccde1146c753d38f9608ffe0ca42a7878f90003058f` |
| Package Suggested.lean | 127901 | `7d455c73c4813aa6e83d5117f2e40d9a8bd2970ee4e739601e2e789c6b7782ac` |

`metadata.toml` remains absent. Its intended content is `topic = "math.NT"`;
add it when the package meets its mathematical and signature obligations.
`issues.deliverables_complete` currently checks existence of package output
paths, so adding it to this incomplete package would misclassify the job.

For completion, obtain owner-authorized changes supplying the contracts above,
then reconcile all 79 targets, 140 APIs and 90 tests. Check dependency order,
keep the README within 200 KB, add metadata, run Lean and scoped intake checks,
and submit the complete package. Additional ordinary signatures may be filled
independently, but cannot discharge the supplier obstruction. All resumption
information is in this handoff; no scratch file is needed. No owner file or
read-only tree was edited, no private book was used, no Lake build/update/cache
command or language server ran, and all Lean checks have finished.
