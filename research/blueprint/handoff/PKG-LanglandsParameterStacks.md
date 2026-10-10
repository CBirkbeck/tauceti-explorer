# PKG-LanglandsParameterStacks — blocked supplier checkpoint

## Current result: 10 October 2026, codex-5BTJxN

Codex (GPT-6), session `codex-5BTJxN`, claimed
[issue #7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909).
The bot [confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6098658473)
after the [claim comment](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6098657343).
The full issue was reread after confirmation. Branch:
`codex-5BTJxN-langlands-parameter-stacks`; starting atlas commit:
`1e062ce59b84a6c96f7d9bd36528d931e7636a28`.
None of the forty manager-priority issues appeared in the 733 available swarm
issues. The eligible fallback list had no top issue and no focus plan/package
review; #7909 was its available focus package. Only this job was claimed.

**Blocked checkpoint; the package remains incomplete.** Only this handoff
changes. The inherited README and Suggested.lean are preserved. Metadata is
still absent because output-existence checks would otherwise mark this
incomplete package complete. The obstruction is the unavailable specification
of supplier interfaces, rather than a demand for implemented proofs or a time
limit. The issue permits package outputs and this note and says to change no
packet. PROTOCOL §§3, 13, 15 and 20 require faithful signatures and shared
constructions in their owners; supplier repairs cannot be made in this job.

This note consolidates the duplicated checkpoint history into the current
verification and the inherited actionable worklist. Historical source receipts
and broader investigations remain in the
[preceding handoff at the starting commit](https://github.com/CBirkbeck/tauceti-explorer/blob/1e062ce59b84a6c96f7d9bd36528d931e7636a28/research/blueprint/handoff/PKG-LanglandsParameterStacks.md).

## What was independently verified

The accepted LP plan has 79 targets, 140 API entries and 90 tests. Its review
accepts a target-level pass with eight planned but unclosed stages and expressly
retains five gaps, sixteen requests and omitted enhanced Lean signatures.
Read those gaps and the E5:abstract, E5:animation and E5:presentability requests.
In particular, the plan explicitly imports the general quotient-stack and
category machinery rather than constructing it in LP.

Read the complete statements, hypotheses, proof routes, direct prerequisites,
APIs and tests for these two constructions and compare their README targets
with the entire package Suggested.lean:

| Target | Required interface | Required tests absent from Lean |
| --- | --- | --- |
| LP1/derived-parameter-stack | Mapping stack over BQ, framed fibre, H-quotient, classical points and perfect pullback | `derived_stack_trivial_group`, `derived_stack_free_group`, `derived_stack_gauge` |
| LP3/mapping-approximation | Category-valued sifted left Kan extension, actual mapping-category comparison, finite-base torsor agreement and Ind completion | `approx_point`, `approx_coproduct`, `approx_bad_prime` |

All ten API names of these two nodes are absent even as text from the package
Suggested.lean, as are all six test identifiers. The README retains both
constructions. This is a scoped absence check, not an exhaustive fresh census
or a claim that a token elsewhere certifies a declaration. The inherited wider
signature inventory below still needs semantic reconciliation.

The current E5 packet remains partial, with 22 targets, no review object,
ten gaps and sixteen requests. Read its suggested file in full: the
`SymMonInftyCat` fibration/Segal fields are `True`, `CAlg` and `AnimatedAlg`
are `Unit`, and `IndInfty` is `True`. These do not supply the LP contracts.

The open [E5 repair PR #8009](https://github.com/CBirkbeck/tauceti-explorer/pull/8009)
remains at head `b0b9344dd7b7a1f3b2d6dc0f767a81d331ffa95f` in
`tauceti-ai-for-science/tauceti-explorer`.
[Issue #720](https://github.com/CBirkbeck/tauceti-explorer/issues/720)
remains submitted; this proposal is not in the current checkout. Read the
proposal's `signatureOmissions` and the relevant suggested interfaces:

- `HEquiv` records only homotopy-category equivalence. `SymMonData` omits
  cocartesian/inner-fibration and inert mapping-space axioms.
- `CategoryDiagramData` records fibres and transitions and explicitly omits
  coherent composition. Its action/module data omit the corresponding higher
  coherence and preservation predicates.
- The animation signatures provide algebra objects and polynomial/Tor tests,
  but no derived fpqc quotient-stack QCoh/Perf interface meeting LP's request.

These are checks against this package's consumer contracts, not an independent
review of the other worker's job. Merging #8009 alone is not a sufficient
restart condition; verify the precise missing LP-facing exports.

## Library and upstream boundary

Read all eight LP entries in the reviewed library audit. Read upstream
**AlgebraicVectorBundles** and **DGAInfinity** READMEs in full and inspect the
related suggested interfaces. AlgebraicVectorBundles L0–L2 treats scheme
sheaves, finite locally free bundles and relative Spec. DGAInfinity Layers 5–6
treats DG/A-infinity modules, perfect envelopes and Morita comparison. These
scopes do not supply LP's animated fpqc quotient-stack Perf and coherent
category-valued sifted extension.

Current read-only upstream revision:
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`.
Current native Tau Ceti revision:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
A bounded exact-name search of their Lean trees found neither principal API
name from the table nor its six test identifiers. This is not a comprehensive
mathematical absence proof.

At pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, read
`SSet.Quasicategory` (inner horn filling) and `DerivedCategory`
(localization of cochain complexes at quasi-isomorphisms). They do not by
themselves specify the missing coherent monoidal or derived-stack contracts.
The managed Lean driver identifies its Tau Ceti baseline as
`f790474821cf4256814db967cb154e7af3d0c369`; the shared Mathlib revision was
independently checked. The shared Tau Ceti source directory has no Git metadata,
so its revision was not independently derived from Git in this run.

Also read the current upstream IHG `InvariantCoordinateInput`,
`tensorCoordinates`, `tensorEvaluate` and `ring`: tuple entries and conjugating
points use the same Hopf group. It still does not supply the separate acting
identity component needed for O[(H ⋊ Q)^n]^H. Preserve the three-artifact
comparison and the proved distinguishing fixtures in the inherited worklist.

## Required next action

Route the LP-facing enhanced contracts to E5 and its declared dependencies,
then reconcile LP's requests and suggested forms with those actual exports.
This requires an authorized supplier/plan repair. Preserve the framed versus
unframed tests and the finite base set versus possibly infinite total torsor
distinction. The identity-component invariant, continuity and highest-weight
owner gates below remain necessary; this run did not resolve them. No owner
move was made.

Resume package work after those contracts change: reconcile all 79 targets,
140 API items and 90 tests, retain the existing proved fixtures, add
`topic = "math.NT"` metadata, and rerun Lean and intake checks. Rechecking the
unchanged ordinary prototypes cannot discharge the missing enhanced tests.

## Fresh validation

- `lean-check` on the unchanged package Suggested.lean: exit 0, 286 warnings,
  all uses of `sorry`; zero errors and zero other warnings. Available memory
  before launch was 103 GB. This checks existing signatures, not omitted ones.
- LP and current E5 packet checkers: zero errors and zero warnings each.
- Permitted-file intake check and whitespace check: passed before submission.

Unchanged package SHA-256:

| File | SHA-256 |
| --- | --- |
| README.md | `82cd627d281459fd163411f0986d82bb12365ad6302f551db349d71593a761be` |
| Suggested.lean | `e715f1da933448bd2e8acb1c83343f68e5ddbad5ca3da60377be9bc11b116730` |

No paper or private book was reread in this run. The source receipts and
mathematical source checks below are historical and are not recertified here.
No source passage was copied. No supplier, packet, reader, library or upstream
file was changed or built. No Lean language server or background check remains.
All resumption information is in this note and its immutable predecessor links;
no scratch artifact is required.

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
