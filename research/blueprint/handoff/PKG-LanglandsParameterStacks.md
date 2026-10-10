# PKG-LanglandsParameterStacks — normal wild cutoffs and blocked supplier checkpoint

## Current result: 10 October 2026, codex-JmoW45

Codex (GPT-6), session `codex-JmoW45`, claimed
[issue #7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909).
The bot [confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6099046483)
after the [claim comment](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6099045326).
The full issue was reread after confirmation. Branch:
`codex-JmoW45-langlands-parameter-package`; starting atlas commit:
`8a07284fc1d2dcc904eadd7f5c462690c1cf5470`.
None of the forty manager-priority issues was available in the listing of
726 available swarm issues. No eligible top or focus review preceded the two
available focus packages; this run chose this package. Exactly one job was claimed.

**Blocked checkpoint; the package remains incomplete.** This run supplies
an explicit normal wild cutoff, its proofs and three discriminating examples.
The enhanced targets still lack supplier specifications. The issue permits
only package outputs and this note, and forbids packet changes. PROTOCOL
§§3, 13, 15 and 20 require faithful signatures and shared constructions in
their owners. Repairing E5's enhanced contracts and reconciling LP's imports
requires an authorized supplier/plan repair outside these permitted outputs.
This is a dependency obstruction, not a request for implemented supplier
proofs or an elapsed-time checkpoint. Metadata remains absent because the
intake's output-existence check would otherwise mark the incomplete package
complete.

The inherited actionable worklist follows below. The preceding worker's
finite-image proof, tests and source receipts remain in the
[handoff at the starting commit](https://github.com/CBirkbeck/tauceti-explorer/blob/8a07284fc1d2dcc904eadd7f5c462690c1cf5470/research/blueprint/handoff/PKG-LanglandsParameterStacks.md).
Claims of fresh reading and inventory counts in the inherited sections belong
to earlier workers unless explicitly verified here. No scratch artifact is
needed to resume.

## New mathematical work

`NormalWildCutoff.lift` constructs the homomorphism
s_c:Γ→H⋊Q, γ↦(c(γ),η(γ)), for β:Q→Aut(H), η:Γ→Q and a
crossed cocycle for β∘η. Its unit and multiplication proofs use the
crossed multiplication law directly, without the existing `sorry`-proved
cocycle API. `NormalWildCutoff.subgroup` is U=P∩ker(s_c).

The new API proves:

- `mem_subgroup`: membership is exactly membership in P together with
  c(γ)=1 and η(γ)=1.
- Normality in the whole Γ when P is normal; containment in P and ker(η);
  and vanishing of the cocycle on U.
- `isOpen` and `exists_cutoff`: U is relatively open in P when c is
  continuous with finite image on P into a T₁ space, and η restricted to P
  is continuous into discrete Q. The finite closed set of nonidentity
  c-values and the open identity fibre of η give the two open factors.
- `subgroup_mono` and `subgroup_inf`: restriction and refinement inside a
  preassigned subgroup preserve the explicit common-kernel construction.
- `LParameter.exists_normalWildCutoff`: compact P and finite wild
  ramification supply finite image through the preceding worker's proved
  `finiteWild_iff_finite_range`, yielding the same normal-open cutoff.

There is no infinite intersection of conjugates. The prescribed Q-projection
is killed even if its action on H has a kernel. The new assertions do not
prove every relatively discrete parameter has finite wild ramification, and
do not replace the condensed or derived parameter problem.

Three proved examples distinguish wrong cutoffs:

- `cutoff_fixed_projection`: Γ=Q, η=id and unit cocycle give U={1},
  including a trivial action. Killing only the action fails for nontrivial Q.
- `cutoff_cocycle_kernel`: trivial Q and identity cocycle Γ→Γ give
  U={1}; merely intersecting P with ker(η) fails.
- `cutoff_retains_wild`: trivial H and Q give U=P; taking ker(s_c)
  without intersecting with P fails.

Read the pinned declarations used: `SemidirectProduct` and its actual
multiplication in `GroupTheory/SemidirectProduct`,
`MonoidHom.normal_ker` in `Algebra/Group/Subgroup/Ker`,
`Subgroup.normal_inf_normal` in `Algebra/Group/Subgroup/Basic`,
`Set.Finite.isClosed` in `Topology/Separation/Basic` (T₁ spaces), and
`isOpen_discrete` in `Topology/Order`. These generic library constructions
are used directly, not re-planned.

Fresh primary-source reading used
[Fargues–Scholze's author PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf):
Definition VIII.1.1 (p.278), Remark VIII.1.2 and the proof of Theorem VIII.1.3
(pp.279–280), and Proposition VIII.2.1 (p.281). The README explains the
normal-cutoff step in our own words and separates its assumptions from the
coefficient argument establishing finite wild image. Also read §VIII.5.4 and
Proposition VIII.5.20 (pp.311–312) to check the mapping-approximation contract.
No source passage or section-by-section summary is stored in the repository.
No restricted book was used; the cleared-source index was inspected.
The public PDF was accessed on 10 October 2026; SHA-256:
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.

## Independently verified blocking contracts

The accepted LP packet still has 79 targets, 140 API entries and 90 tests,
with eight planned but unclosed stages, five gaps and sixteen requests.
Its accepted review describes a target-level pass and retains omitted
enhanced signatures. Read the complete statements, hypotheses,
prerequisites, APIs and tests of these two constructions:

| Target | Required interface | Missing suggested tests |
| --- | --- | --- |
| LP1/derived-parameter-stack | Animated fpqc mapping stack over BQ, framed fibre, H-quotient, classical points and enhanced perfect pullback | `derived_stack_trivial_group`, `derived_stack_free_group`, `derived_stack_gauge` |
| LP3/mapping-approximation | Category-valued sifted left Kan extension from finite bases with torsors, coherent comparison to the actual Perf mapping category, and Ind completion | `approx_point`, `approx_coproduct`, `approx_bad_prime` |

Their ten required API names and six test identifiers remain absent from the
package Suggested.lean; the README retains the targets. This scoped check
is not a certification of the other signatures. Finite torsor bases must
not be confused with finite total torsors, and an arbitrary ordinary category
cannot supply either required construction.

The current E5 packet remains partial: 22 targets, ten gaps and sixteen
requests. Its suggested file was read in full. `SymMonInftyCat` has `True`
fibration/Segal fields, `CAlg` and `AnimatedAlg` use `Unit`, and `IndInfty`
uses `True`; these do not specify the consumer contracts.
The open [E5 repair PR #8009](https://github.com/CBirkbeck/tauceti-explorer/pull/8009)
was rechecked at head `b0b9344dd7b7a1f3b2d6dc0f767a81d331ffa95f` in
`tauceti-ai-for-science/tauceti-explorer`. Its proposed suggested file uses
homotopy-category equivalences for `HEquiv`; `SymMonData` omits the
cocartesian-fibration and inert mapping-space requirements. It does not
supply the derived fpqc quotient-stack QCoh/Perf interface. This is a scoped
consumer dependency check, not a review of that job. Merging that PR alone
is not a sufficient restart gate.

## Current library and upstream boundary

Read all eight LP entries of the reviewed library audit. Read upstream
AlgebraicVectorBundles and ReductiveGroups READMEs in full. Ordinary scheme
sheaves, finite locally free bundles and relative Spec in AlgebraicVectorBundles
L0–L2 do not supply animated quotient-stack Perf. The ReductiveGroups roadmap
does not supply the missing enhanced-category constructions.
Fresh Git revision checks on the read-only current sources gave:

- TauCetiRoadmap: `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`.
- Native Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

A bounded exact-name search found no replacements for `SymMonInftyCat`,
`AnimatedAlg`, `IndInfty`, `DerivedParameterStack`,
`ParameterMappingApproximation` or `ParameterSingularities` in those trees.
The identity-component invariant, continuity and highest-weight owner gates
below are inherited and remain actionable; this run does not claim a fresh
full audit of those interfaces. No owner move was made. The read-only
upstream and native trees were never built or modified.

## Required next action

An authorized supplier/plan repair must provide the LP-facing enhanced
contracts in E5 and its dependencies, then reconcile LP's requests with the
actual exports. Preserve framed versus unframed tests, higher coherence and
finite base versus total torsor distinctions. The identity-component invariant,
continuity and highest-weight owner gates below also remain necessary.
After those contracts change, reconcile all 79 targets, 140 API items and
90 tests; retain the proved fixtures, finite-image comparison and normal
cutoff; supply `topic = "math.NT"` metadata; rerun Lean and intake checks.
Reassigning this package without changing its supplier contracts cannot
close the enhanced targets.

## Fresh validation

- Full package `lean-check`: exit 0, zero errors, 285 warnings, all uses of
  `sorry`; zero other warnings. Available memory before launch was 101 GB.
  This validates existing signatures, not the omitted enhanced signatures.
- The new cutoff and three examples re-elaborated in isolation with no
  errors or warnings. Axiom reports for `exists_cutoff` and `mem_subgroup`
  list only standard logical axioms and no `sorryAx`.
- LP and current E5 packet checkers: zero errors and zero warnings each.
- Permitted-file intake: three files, zero problems. `git diff --check`: passed.

Final package SHA-256:

| File | SHA-256 |
| --- | --- |
| README.md | `67f9e18b7ec5b192b15d0c46b8e64d17edccf16b5c58a2bfddd2c0e80510e16f` |
| Suggested.lean | `bce4a9a41252e26aebc21611e66f9c386d586e62d0ab9de14efb52e53b5351ac` |

The managed Lean driver identifies pinned Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The shared Mathlib revision was
independently checked; the driver's Tau Ceti source has no Git metadata.
No supplier, packet, reader or library file was changed. No Lean language
server was started. All resumption information is retained in this note and
its predecessor links; no scratch artifact is needed after submission.

## Inherited actionable worklist

The following sections retain the preceding workers' mathematical work and
receipts. References to fresh reading and inventory counts describe those
workers' runs, except where independently checked above.

## Supplier obstruction and exact restart gates

### Identity-component invariants: keep three artifacts distinct

LP's `LP2:semisimple-characters/reductive-pseudocharacters` uses the projected
fibre of pseudocharacters on O[J^n]^H, where J = H ⋊ Q and H is the identity
component. Component idempotents impose the prescribed projection to Q.
Reconstruction is up to H-conjugacy, without imposing a prime-to-|Q| condition
on this algebraically closed field statement.

The three available supplier artifacts currently say different things:

| Artifact | Actual contract | Consequence for LP |
| --- | --- | --- |
| Current upstream `IntegralHeckeAndGaloisDeterminants/README.md` §0.7 and `Suggested.lean` lines 765, 795–806 | `InvariantCoordinateInput` is a single `CommHopfAlgCat`; tuple entries and conjugating points belong to the same represented group. Invariants are tested over every coefficient algebra. The README restricts these applications to connected groups. | Substituting J yields O[J^n]^J; substituting H yields O[H^n]^H. Neither is O[J^n]^H. |
| Atlas `research/blueprint/packages/IntegralHeckeAndGaloisDeterminants/README.md`, target `Invariant coordinate algebras under conjugation` (anchor `target257`, around line 505) | It separates the tuple group from a closed acting subgroup through a Hopf surjection, and chooses the identity component for generalized reductive groups. | The mathematical description has the required scope, but is not the current upstream signature. |
| Atlas IHG package `Suggested.lean` around line 572 and promoted `roadmaps/IntegralHeckeAndGaloisDeterminants/Suggested.lean` around line 623 | The input holds a ring diagram with reindexing and multiplication maps. It does not construct that diagram from the group/subgroup Hopf data; the promoted file assigns the coordinate pullbacks to LP3. | This does not provide the missing construction or reconcile its ownership. The accepted IHG packet also retains broad LP3 prerequisites for generic pseudocharacters and reconstruction. |

The distinction is observable in existing proved package fixtures. For
J = G_m ⋊ C₂ with inversion action over Q, the Z-lifts sending a generator
to 2 and 1/2, both with trivial Q-projection, are J-conjugate and not
H-conjugate. In O[J] = Q[x,x⁻¹] × Q[x,x⁻¹], the H-invariant function (x,0)
distinguishes them; component switching sends it to (x⁻¹,0). The component
idempotent (1,0) has value 1 on both. Imposing the Q-projection after taking
whole-J invariants cannot recover the lost coordinate. See
`IdentityComponentChecks` and `IdentityComponentCoordinateChecks` in the
existing package Suggested.lean. No generic invariant construction is claimed.

**Owner repair gate:** supply the generalized construction once in its generic
owner, with separate tuple-group and acting-subgroup data, actual coordinate
coactions or equivalent invariance over all test algebras, regular evaluation,
reindexing and ordered multiplication. Provide the identity-component
specialization, component idempotents and reconstruction with H-conjugacy.
Recover the connected specialization and retain the inversion example as a
distinguishing test. Reconcile IHG's LP3 prerequisites with precise unconditional
coordinate and field-GIT inputs, and update LP's imports through an authorized
plan repair. Adding an arbitrary ring diagram in the LP package does not meet
this gate.

The inherited investigation read [Quast's author-hosted v1](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf),
Definition 3.1 (p.11), Lemmas 3.4–3.5 (pp.12–13), Theorem 3.7 and the opening
reconstruction proof (pp.13–14). They use identity-component invariants and
identity-component conjugacy. Freshly read
[Fargues–Scholze's author PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
VIII.3.5–VIII.3.8 (pp.288–290): the presentation retains H-conjugation on
(H ⋊ Q)^n, component compatibility and a separate continuity argument.
These locators support the obstruction; no source excerpt is stored here.

### Enhanced interfaces: real missing specifications

The unchanged `research/blueprint/suggested/EnhancedDerivedSheaves--E5.lean`
has a real quasi-category carrier, but its `SymMonInftyCat` fibration and Segal
fields at lines 77–81 are `True`, `CAlg` at line 104 and `AnimatedAlg` at
line 199 are `Unit`, and `IndInfty` at line 145 is a proof of `True`.
Presentability, stability and coherent actions likewise need actual interfaces.
These signatures cannot express LP's enhanced objects faithfully.

The inherited investigation checked the exact statements, hypotheses, prerequisites and API/test
requirements of `LP1/derived-parameter-stack`,
`LP2:excursion-presentation/categorical-hecke-datum`,
`LP3/good-filtration-t-structure`, `LP3/induced-perfect-complexes`,
`LP3/mapping-approximation` and `LP4/rep-action-on-perf`. Read all eight LP
entries of the reviewed library audit and the current upstream
AlgebraicVectorBundles and ReductiveGroups READMEs in full.
AlgebraicVectorBundles L0–L2 supply ordinary scheme sheaves, duals, finite
locally free modules and total spaces, without these derived quotient-stack
categories. A limited current native-library declaration search for
`SymMonInftyCat`, `AnimatedAlg`, `IndInfty`, `CAlg` and `IsStable` found no
supplier; this is not a comprehensive current-library audit.

Fresh source checks also included FS Theorem VIII.4.1 and Definition
VIII.4.2 with their coefficient relations (pp.291–292), and VIII.5.1–VIII.5.2
(p.293). The categorical data and enhanced generation/module comparison
need the actual enhanced categories. The existing ordinary point-group
matrix-coefficient prototype cannot supply categorical creation/annihilation.

**Owner repair gate:** replace the E5 placeholder contracts with enhanced
symmetric monoidal stable categories, animation, Ind completion, coherent
actions and the required quotient-stack QCoh/Perf interfaces; reconcile their
SF.1/S.1 dependencies and the LP plan's owner references. Ordinary categories,
`True` fields, `Unit` carriers and unconnected arbitrary category parameters
are insufficient. This package issue does not authorize editing those owners.

## Signature inventory for resumption

A fresh word-token screen of all 140 API names and 90 test names against the
whole package Suggested.lean, including comments, confirms 42 API entries
whose final name component is absent and 42 absent test identifiers.
This is a conservative absence worklist, not a signature-coverage certificate.
A common final component such as `unit`, `map` or `tensor` elsewhere cannot
certify its API entry; a comment cannot certify a test. In particular,
`ExcursionDatum.operator` is not a declaration despite “operator” occurring
in a reindexing comment. Check the precise node statements after owner repairs.

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

1. **G1 — supplier extensions.** Verify the reductive, admissible-complex,
   root-system and highest-weight inputs. Integral highest-weight theory
   extends ReductiveGroupsIntegralRepresentationsPartII through the registered
   ReductiveGroups Layer 9 parent until design stage ids exist. Neither that
   parent nor RG2.5 provides every required Jantzen, Donkin, Koppinen, TvdK
   and Procesi input. Do not invent a general GIT RG2.6 owner.
2. **G2 — source-open independence.** Keep canonical independence for the
   l-torsion-free excursion quotient. Full torsion-sensitive independence at
   arbitrary bad primes remains an open source question (FS VIII.3.7, p.289).
3. **G3 — faithful carriers.** Complete relatively discrete condensed
   coefficients, admissible enhancements, derived Weil cochains/duality,
   cotangent and singular support, parabolic/Levi inputs, regular invariant
   quotients and enhanced categories against their actual owner interfaces.
4. **G4 — continuity.** Supply finite-Q reconstruction continuity up to
   H-conjugacy with relatively discrete coefficients, retaining finite-type
   Z_l coefficient modules on inertia. Dense extensionality and the connected
   IHG rank-one-valued-field theorem do not supply this. Retain the accepted
   IHG source issue E13 when assessing Quast Theorem 3.8's printed argument.
5. **G6 — ownership.** Replace broad LP3 inputs to generic IHG reconstruction
   with unconditional coordinate and field-GIT inputs. Shared
   Seshadri/Haboush/power-lifting facts require one owner across LP and
   deformation-ring consumers. No owner move was made in this run.
6. On IndPerf, good-filtration connective means D^{≤0}. Truncations need not
   preserve Perf. In positive characteristic, dualizable perfect complexes
   differ from compact objects of unrestricted quotient-stack categories.
7. Mapping approximation is a category-valued sifted left Kan extension.
   Its base set is finite; its total Γ-torsor need not be. Retain the
   bad-prime PGL_l, Γ=Z exclusion of the unit skyscraper.
8. Universal representation bundles precede good-prime generation and have
   no inherited prime restriction. Retain coherent action, tensor/fusion,
   evaluation at a parameter and coefficient-pullback comparisons.
9. Wild enhancements restrict admissible complex parameters and their
   enhancement representations; restriction can lose irreducibility. Retain
   the algebraic component denominator and embedded invariant dual centre.
10. Test coaction invariants over all coefficient algebras. Normal wild kernels
    must lie in the action kernel. Geometric degree negates arithmetic degree
    on the same Weil carrier, with Tate values q⁻¹ and q respectively.
11. Chapter X actions remain with ExcursionOperatorsAndSpectralAction.
    Inherited locator corrections: FS VIII.5.18, p.308 requires the acting
    group's prime-to-characteristic order; Lafforgue Proposition 10.8 is
    pp.138–139. These two checks were not repeated in this run.

Preserve the existing SR.6 ownership and imports; this run re-read the LP
consumer/delegation records without re-auditing the full supplier packet:

| Imported target | Supplier | LP addition |
| --- | --- | --- |
| Crossed cocycles, section/gauge laws | SR.6.1 crossed-cocycles | Restriction and condensed comparisons |
| Dense finite-wild model and l-adic extension | SR.6.1 finite-wild-discretization, ell-adic-extension | Geometric degree and relatively discrete interface |
| Integral cocycle scheme | SR.6.1 finite-wild-representability | All-depth gluing, derived/condensed comparisons |
| Excursion algebra and coefficient identities | SR.6.3 excursion-algebra | Arbitrary-source extensions and enhanced operators |
| Universal homeomorphism and invariant comparison | SR.6.3 excursion-invariant-comparison | Enhanced colimit, cohomology and stronger base change |

Checkpoint [#8322](https://github.com/CBirkbeck/tauceti-explorer/pull/8322)
records the prior SR.6.1–SR.6.3 inspection. SR.6.2 strata are finite at a fixed
wild cutoff, not across all depths. Migrate ordinary local prototypes to owner
imports when the LP plan is reconciled; do not rebuild these suppliers.

## Preserve existing proof work

The existing Suggested.lean includes the identity-component fixtures above,
the genuine invariant-algebra coefficient-change map
`ParameterInvariantAlgebra.baseChangeMap` using Mathlib's equalizer, its
proved pure-tensor equations, and `NonflatReductionChecks.nonflat_reduction`.
The latter uses the sign action on Z[X]: reduction modulo 2 has an invariant
X-coordinate with no preimage under the actual tensor comparison. It concerns
a general disconnected-group invariant adapter, not the parameter-specific
good-prime theorem.

The existing `ExcursionDatum` has finite I and finite-projective V, genuine
`reindex` and external `tensor` constructions using Mathlib's
`Representation.tprod`, proved coefficient comparisons, and rational tests
for multiplication, ordered tuples and fold compatibility. It is an ordinary
point-group prototype; regular algebraic representations and categorical
operators remain separate obligations.

The [previous handoff at the starting commit](https://github.com/CBirkbeck/tauceti-explorer/blob/468675f045a6b1e831057097569fef6e1b8579aa/research/blueprint/handoff/PKG-LanglandsParameterStacks.md)
retains the earlier isolated elaboration and axiom reports, source findings,
and BHKT fetch receipt. Those isolated reports were not rerun here. The inherited investigation read the pertinent definitions/proofs and
elaborated the whole package.
