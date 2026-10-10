# PKG-LanglandsParameterStacks — blocked checkpoint

## Current status, 10 October 2026

Issue [#7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909).
Worker: Codex (GPT-6), session `codex-DLfuYt`.
Branch: `codex-DLfuYt-langlands-parameter-stacks`.
[Claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6097830924);
[bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6097832149).
The bot confirmed the claim before work began. All 40 issues in the manager's
priority list were queried directly: none was available. Among the permitted
fallback kinds, no top issue was available, and this was the only focus
package or plan issue. Only this job was claimed.

**Incomplete; blocked by supplier specifications outside this job's four
authorized paths.** The job forbids changing the LP packet or any supplier.
The accepted review describes a complete target-level planning pass with
unclosed stages and omitted enhanced signatures; it does not certify the
complete package specification asserted in the generated issue.

This checkpoint corrects the package README's citation of Fargues–Scholze
VIII.4.1 from a proposition to a theorem. The mathematical targets and the
Suggested.lean are unchanged. Metadata remains absent: adding it would make
`issues.deliverables_complete` recognize the package by output existence,
despite the missing signatures. No result or supplier is certified complete.

## Findings checked in this run

- Read the current upstream AlgebraicVectorBundles and ReductiveGroups
  READMEs in full and all eight LP entries of the reviewed library audit.
  The scheme vector-bundle targets do not replace derived quotient-stack
  Perf or its enhancement; pinned integral groups do not supply the needed
  highest-weight representation theory.
- Read the entire E5 suggested file and the exact LP specifications for the
  derived parameter stack, categorical Hecke datum and projected
  pseudocharacter. E5 still has `True` fields for monoidal fibration, Segal
  conditions, stability and coherent actions, `Unit` for `CAlg` and
  `AnimatedAlg`, and a proof of `True` for `IndInfty`. Twenty-five LP nodes
  directly cite an E5 stage. These contracts cannot express their enhanced
  objects, APIs and tests. A declaration-text search in the current native
  Tau Ceti library found none of `SymMonInftyCat`, `AnimatedAlg`, `IndInfty`,
  `CategoricalHeckeDatum`, `DerivedParameterStack`, `InvariantCoordinateInput`
  or `ReductivePseudocharacter`; this is a limited interface search, not a
  comprehensive library audit.
- Read current upstream IHG §0.7 and its actual `ring`, `tensorEvaluate`,
  `reindex` and `multiply` signatures, then the atlas IHG input and evaluation
  signatures. The upstream constructor uses a single Hopf algebra for both
  tuple points and conjugating points. LP requires separate tuple group
  J=H⋊Q and conjugating group H. The atlas prototype instead accepts an
  arbitrary ring diagram; it does not construct that diagram from the two
  represented groups. Neither contract supplies the missing LP input.
- Reopened the exact public PDFs below and inspected Quast Definition 3.1,
  p.11, Lemma 3.5, pp.12–13, Theorem 3.7 and the opening reconstruction argument,
  pp.13–14; and FS VIII.3.8, p.290, and VIII.4 setup, Theorem VIII.4.1 and
  Definition VIII.4.2, pp.290–292. The former uses identity-component
  conjugation and the latter requires actual representation functors and
  their equivariance. The ordinary categorical formulation in FS VIII.4 is
  meaningful independently of the further stable enhancement in the LP plan.
  No source passage is committed.

**Boundary clarification for the maintainer:** current upstream IHG
explicitly scopes its reductive applications to connected groups. This is
an intentional narrower contract, not an error repaired by this job. Treat
it as existing work. An authorized plan repair must assign the additional
identity-component invariant construction and generalized reconstruction
once, as an extension of the generic owner, and update LP's dependency to
that extension. Do not silently cite the connected construction for
O[Jⁿ]^H, rebuild the generic theory inside LP, or change the upstream
roadmap through this atlas job. The inherited owner gates below specify the
needed mathematical interface, not permission to edit upstream files.

The existing semidirect-product and Laurent-coordinate fixtures demonstrate
why imposing the Q-projection after whole-J invariants cannot recover the
H-conjugacy distinction. They remain unchanged and were included in this
run's full-file elaboration. In particular, retain
`coordinate_not_projected_switch_invariant` and
`identity_restriction_not_surjective`, which work over any nonzero
coefficient ring, including characteristic two.

## Validation and receipts

- `lean-check research/blueprint/packages/LanglandsParameterStacks/Suggested.lean`:
  exit 0, no errors, 291 warnings, all `declaration uses sorry`; no other
  diagnostics. Available memory before compilation: 96 GB. The managed
  wrapper advertises Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`;
  its Mathlib source revision is
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The elaboration verifies
  retained signatures and fixtures, not omitted enhanced signatures.
- `check_blueprint.py` on LP and IHG: each exit 0, zero errors and warnings.
  LP has 79 nodes, 140 API items, 90 tests, five gaps, sixteen requests,
  eight planned stages and no closed stage. IHG has 38 recorded gaps.
  These structural checks permit recorded gaps and do not close them.
- Scoped intake `check-files` and `git diff --check` pass for the two
  changed authorized files. No supplier, packet, campaign or data file is
  changed.
- Current read-only upstream roadmap revision:
  `670582c502e1d4497d9ccd492b36c67028ef6666`; native Tau Ceti revision:
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both were read, never edited
  or built.
- Package README: 192334 bytes, within 200 KB, SHA-256
  `7e62353b9ec117bb8413c5c15fdbfdc92495c2e2f2d0657fa4cf95705c8a03a5`.
- Suggested.lean remains 129172 bytes, SHA-256
  `1fa52ab0bd2df3ce469ddfb775dd85396aa5f18bf55fdce4d0a3ecfa8e35423a`.
- LP packet SHA-256:
  `e3554e4ad95f573e992965939391157a755455b65305fd34508538b52e7b8087`;
  atlas IHG packet:
  `1d06c30103ac2c17a0c2964e2c7721d66c5e939b6b9898f7441d9abdf01a782b`;
  E5 suggested input:
  `e8119768303f20e9952f0576d1ea163903060e1bfccfd4b9fe97528a32f8ac7c`.
  These unresolved inputs are unchanged from the prior checkpoint.

Public source receipts, fetched and hash-matched on 10 October 2026:

| Source | Version and inspected locators | SHA-256 |
| --- | --- | --- |
| [Quast, Deformations of G-valued pseudocharacters](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf) | Author-hosted arXiv v1, 23 October 2023; Definition 3.1, p.11; Lemma 3.5, pp.12–13; Theorem 3.7 and opening reconstruction argument, pp.13–14 | `67eb82118e49df3f7da6c1e211ad9961fc7323fc4d09d0559bcbc2434eead827` |
| [Fargues–Scholze, Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) | Author-hosted 356-page version; VIII.3.8, p.290; VIII.4 setup, Theorem VIII.4.1 and Definition VIII.4.2, pp.290–292 | `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` |

## Where to resume

First obtain authorized supplier and LP-plan repairs that supply genuine
E5 enhanced interfaces and the generalized invariant input described above.
The plan already records the further highest-weight, condensed-continuity
and field-GIT boundary work. Implementation of every supplier is not a
prerequisite to writing a roadmap; adequate non-vacuous specifications and
usable prototype contracts are. These four package paths cannot repair the
owner specifications.

Then reconcile the signature inventory below, preserve the existing proved
fixtures, finish the package and add `topic = "math.NT"` metadata only when
all required signatures are covered. Rerun Lean and intake checks. No new
owner, ownership move or additional claim was made in this run.

The remaining detailed worklist is inherited from the prior checkpoint and
retained for resumption; entries beyond the checks above are not newly
certified. Its previous receipt is available in the
[immutable predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/5cf3e3cc49802c9c4f3b0beee2e565dc34fc91b1/research/blueprint/handoff/PKG-LanglandsParameterStacks.md).
No scratch artifact is needed to resume; all receipts and restart gates are
in this note. No private book or source passage was copied. No language
server or background compile remains.

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
unchanged package Suggested.lean. No generic invariant construction is claimed.

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

The unchanged Suggested.lean includes the identity-component fixtures above,
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


## Completion and cleanup

After the owner repairs, reconcile all 79 targets, 140 API items and 90 tests
against actual declarations and examples, retain the dependency order and the
existing proved fixtures, keep the README within 200 KB, and create metadata
with `topic = "math.NT"`. Rerun Lean and intake checks. Until then metadata
remains absent: `issues.deliverables_complete` otherwise recognizes a package
by output existence and would mark an incomplete package complete.

All resumption information is here or in the linked immutable predecessor.
No scratch artifact is required. No private book or source passage was copied,
no supplier file was edited, and no Lean language server or background compile
remains. The submission changes this handoff note and the README citation
correction described above.
