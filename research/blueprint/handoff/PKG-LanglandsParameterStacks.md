# PKG-LanglandsParameterStacks — supplier gate checkpoint

## Current result, 10 October 2026

Codex (GPT-6), session `codex-U3hXjn`, issue
[#7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909).
Branch: `codex-U3hXjn-langlands-parameter-stacks`.
Starting atlas commit: `eb108a9e85cfb105b10457721c1ebe902328b868`.
[Claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6098130386)
was explicitly [confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6098131528)
for this session by github-actions before work began.
The issue was reread after confirmation. The selection list contained 735
available swarm issues and none of the manager's forty priority numbers.
No eligible top plan/package review or planning job appeared in that list;
this was one of the two eligible focus packages. Only #7909 was claimed.

**Blocked checkpoint; the roadmap package is incomplete.** This run changes
only this handoff. The package README and Suggested.lean remain unchanged,
and metadata remains absent. The existing suggested file elaborates, but
three independently checked targets alone still lack fifteen named API
entries and ten unit tests. The general enhanced suppliers needed to state
those interfaces are not adequate at the current inputs.

The issue's scope says: “Change no packet; if the plan has a mistake, describe
it in the handoff note.” WORKERS.md's deliverable-only rule and PROTOCOL
§§3, 13, 15 and 20 therefore prevent this package job from filling the
owner's general theory or replacing the accepted plan's enhanced targets
with ordinary categories. Completion needs an authorized owner repair and
reconciliation of the LP supplier requests. The package does not require
implemented supplier proofs; it requires non-vacuous specifications and
suggested interfaces that can express the stated targets and tests.

## Independently checked E5 gate

Read the complete current E5 suggested file, the corresponding packet's
construction statements, gaps and coverage, and its handoff. The supplied
packet `EnhancedDerivedSheaves--E5.json` is **partial**, has **no review
object**, and contains 22 nodes, ten gaps and sixteen requests. Its three
consumed substages are partial; the cotangent/spectra boundary stages are
not_read. This is not an accepted closed supplier plan.

The LP packet's three E5 requests have the following direct incidence counts:

| Supplier substage | Direct consumer entries | Required export |
| --- | ---: | --- |
| E5:abstract | 7 | Stable symmetric monoidal enhanced categories, exact functors, coherent actions and idempotent closure |
| E5:animation | 8 | Animated algebras, derived mapping/quotient stacks, quotient-stack QCoh and Perf with descent |
| E5:presentability | 19 | Enhanced Ind, linear tensor/module categories, category-valued Kan extension and module base change |

These are **25 distinct LP consumers**, not 34 distinct targets. The count
comes from the request `neededBy` lists and does not include transitive users.

The E5 suggested file supplies a genuine quasicategory carrier, but its
`SymMonInftyCat` fields for the map to finite pointed sets, coCartesian lifts
and Segal condition are proofs of `True`. `CAlg` and `AnimatedAlg` return
`Unit`; `IndInfty` returns a proof of `True`. Stability, presentability and
coherent actions similarly lack the mathematical conditions in their types.
These are explicit source-interface gaps, not faithful enhanced objects to
import into LP. In particular the E5 packet itself records the missing
monoidal Ind/module constructions and tensor/module base-change comparisons.

The following scoped signature inventory was checked against both the LP
packet and the package README, then against the entire package suggested file:

| LP target | Absent named API entries | Absent unit tests |
| --- | --- | --- |
| LP1/derived-parameter-stack | DerivedParameterStack; framed; forgetFraming; classicalPoints; perfectPullback | derived_stack_trivial_group; derived_stack_free_group; derived_stack_gauge |
| LP3/induced-perfect-complexes | InducedPerfectComplexes; pullback; retract; moduleFunctor; minimal | induced_point; induced_trivial_group; induced_retract; induced_not_all_bad_prime |
| LP3/mapping-approximation | ParameterMappingApproximation; compare; finiteTorsor; leftKan; ind | approx_point; approx_coproduct; approx_bad_prime |

The subordinate names in each API cell belong to its displayed namespace.
All fifteen full API names and ten test identifiers are absent even as text
in the package suggested file. This is a **lower bound for three targets**,
not a new complete audit of all 79 targets. The wider inherited inventory
below remains to be reconciled.

### Source checks and repair acceptance

Freshly downloaded and read Fargues–Scholze's
[author PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
accessed 2026-10-10; SHA-256
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
This run read Proposition VIII.2.1 and its proof, p.281; the induced-perfect
definition and Proposition VIII.5.8 with proof, pp.295–296; Proposition
VIII.5.11 and its proof, pp.297–298; §VIII.5.4 and Proposition VIII.5.20 with
proof, pp.311–312; and the integral setup and Propositions X.3.1–X.3.3,
pp.348–350. It does not claim to have read the entire book or all cited proofs.

These locators support the following indispensable distinctions in the LP
statements, all expressed here in our own words:

- The parameter deformation problem is defined on animated coefficient
  algebras. The framed and unframed versions differ by the gauge quotient;
  a point-valued ordinary cocycle type cannot state their derived comparison.
- Induced perfectness is closure under cones and retracts of the classifying
  stack pullbacks. The source's bar criterion is an isomorphism in IndPerf;
  its proof uses derived tensor, dualizability and the module-category
  comparison. For connected PGL_l over an algebraically closed field of
  characteristic l, the unit skyscraper is perfect but fails induced
  perfectness by VIII.5.11. An interface defining the induced category to be
  all Perf would fail this required test.
- Map^Sigma is a category-valued extension from finite base sets carrying
  torsors. Its notation does not furnish a representing stack. VIII.5.20
  gives an induced essential image on a free-group input, with equivalence
  under the stated fundamental-group prime restriction; the proof uses
  Barr–Beck and module base change. The finite base condition does not make
  the total torsor finite for an infinite source group.

**Owner repair gate:** complete E5's actual enhanced monoidal/stable,
animation and Ind/module interfaces, including the requested quotient-stack
QCoh/Perf exports with SF.1 and S.1 descent. Give typed pullback, gauge,
closure, linear tensor, module base-change and category-valued left Kan
extension comparisons. Reconcile LP's existing three requests to those
exports. Then restore the fifteen signatures and ten tests above on the
same carriers, preserving the bad-prime non-example. Further LP requests
and inherited gates still need checking; this gate is necessary, not a
claim that it is sufficient for completion.

## Current upstream and library boundary

Read current **AlgebraicVectorBundles** and **DGAInfinity** READMEs in full,
with their suggested interfaces inspected. AlgebraicVectorBundles L0–L2
supplies scheme sheaf operations and structured total spaces. DGAInfinity
Layers 5–6 specify derived modules and perfect DG envelopes, and Layer 8
specifies Hochschild operations. Neither document specifies the E5
animation, derived fpqc quotient-stack and coherent category-valued
left-Kan-extension contracts above. Preserve these suppliers rather than
replanning their material inside LP.

Read pinned Mathlib `SSet.Quasicategory` and `DerivedCategory` statements.
The former imposes inner horn filling; the latter is the ordinary categorical
localization of cochain complexes at quasi-isomorphisms, with a triangulated
structure. Neither declaration supplies the requested full E5 exports.
Also read the current native sheaf tensor interface: its site-level
sheafification construction is an ordinary coefficient operation to reuse.

A bounded declaration-text screen across the current native Tau Ceti tree
and current upstream Suggested.lean files found no occurrences of the eight
names SymMonInftyCat, AnimatedAlg, IndInfty, DerivedParameterStack,
CategoricalHeckeDatum, InducedPerfectComplexes, ParameterMappingApproximation
and UniversalRepresentationBundle. This name screen is not an exhaustive
absence proof. All eight LP entries of the reviewed library audit were read;
none supplies the missing enhanced contracts.

Read the atlas IHG ordinary `InvariantCoordinateInput`, `InvariantEvaluation`
and `ReductivePseudocharacter` signatures. They take an arbitrary coordinate
ring diagram and explicitly omit its full algebraic-group invariant
identification. This limited reading does not re-certify the inherited IHG
reconstruction or identity-component gate below. IHG is an atlas owner with
a package; do not mistake that package for an additional roadmap found in
the supplied current upstream checkout.

Current read-only upstream roadmap revision:
`670582c502e1d4497d9ccd492b36c67028ef6666`.
Current native Tau Ceti revision:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Neither tree was edited or built.

## Validation and unchanged inputs

- Package `lean-check`: exit 0, **286 warnings, all declaration uses sorry**;
  zero errors and no other warnings. Available memory before launch was
  99 GB. The unchanged signatures and examples pass; the omitted signatures
  are not checked by that success.
- LP packet checker: zero errors/warnings; 79 nodes, 140 API entries, 90 tests,
  five gaps, sixteen requests, eight planned stages and no closed stage.
- E5 packet checker: zero errors/warnings; 22 nodes, ten gaps, sixteen
  requests and no planned or closed stage.
- Scoped intake `check-files`: one handoff file, zero problems;
  `git diff --check` passes. Only the authorized handoff is changed.
- The managed driver identifies Tau Ceti baseline
  `f790474821cf4256814db967cb154e7af3d0c369`. Its Mathlib source Git revision
  was independently read as `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  This is distinguished from the current native revisions above.

Paths in the following table are relative to `research/blueprint/`:

| Unchanged file | SHA-256 |
| --- | --- |
| packets/LanglandsParameterStacks.json | e3554e4ad95f573e992965939391157a755455b65305fd34508538b52e7b8087 |
| packets/EnhancedDerivedSheaves--E5.json | 2412db1f717b23d8c6f3864f153b9bdd909d3855cb81d08a2b081f177840f022 |
| suggested/EnhancedDerivedSheaves--E5.lean | e8119768303f20e9952f0576d1ea163903060e1bfccfd4b9fe97528a32f8ac7c |
| packages/LanglandsParameterStacks/README.md | 82cd627d281459fd163411f0986d82bb12365ad6302f551db349d71593a761be |
| packages/LanglandsParameterStacks/Suggested.lean | e715f1da933448bd2e8acb1c83343f68e5ddbad5ca3da60377be9bc11b116730 |

README is 192694 bytes; Suggested.lean is 130588 bytes. Preserve the earlier
proved trace-function extension and inverse laws, actual invariant-algebra
coefficient map, nonflat reduction example, and excursion coefficient
fixtures. Their prior proof/axiom receipts and complete resumption inventory
are retained in the
[immutable preceding handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/eb108a9e85cfb105b10457721c1ebe902328b868/research/blueprint/handoff/PKG-LanglandsParameterStacks.md).
Those isolated checks were not rerun here.

After owner repairs, reconcile all 79 targets, 140 API entries and 90 tests,
then add `topic = "math.NT"` metadata and rerun the package checks. Metadata
remains absent because `issues.deliverables_complete` otherwise recognizes
this package by output existence and would classify it as complete.

No source passage or private book was copied, no supplier/plan file was
edited, and no language server or background compile remains. No scratch
artifact is needed for resumption.

## Inherited detailed worklist

The record below is preserved from the preceding checkpoint. Its historical
source readings, absence counts and proof receipts are not new certifications
by this session. The fresh checks above supersede its current-status claims.

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
