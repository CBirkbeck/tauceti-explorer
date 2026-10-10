# PKG-LanglandsParameterStacks — blocked checkpoint

Issue: #7909. Worker: Codex, session `codex-eMVz7a`.
Date: 2026-10-10. Claim confirmed by bot comment 6093268965 in reply to
6093267983. Continues checkpoints #8167, #8186, #8197 and #8204.

## Current outcome

This is a checkpoint, **not a completed package**. The continuation adds actual
normal-quotient descent for the ordinary continuous cocycle interface and the
finite-coordinate open-kernel argument used in discrete Weil continuity. The
README explains their hypotheses, maps and counterexamples. General enhanced
foundations remain blocked at their existing suppliers; the new statements do
not stand in for the absent condensed or enhanced targets.

Only the package README, Suggested.lean and this handoff change. The accepted
packet, original reader and original suggested file remain unchanged.
`metadata.toml` remains absent because existence of all deliverables signals a
completed package. Add `topic = "math.NT"` only once the required interfaces
and examples are actually supplied.

## New interfaces and where to resume

The new Lean block is between `end Continuous` and `section Wild`.

- `CrossedCocycle.descend` and `quotientEquiv` use the actual group Γ/P, with
  P normal and P≤ker(α). The subtype requires c|P=1. The evaluation equation
  fixes the descended cocycle; the inverse equation fixes inflation. Gauge
  descent retains the action-kernel hypothesis explicitly in
  `gauge_trivial_on` rather than allowing Lean to drop that section variable.
- `LParameter.quotientEquiv` uses the quotient topology, with evaluation and
  inverse equations. Its gauge equation retains the orbit-map continuity
  assumptions on the original and quotient actions.
- `FiniteWildPiece.cutoffMap` is the canonical map Γ/P′→Γ/P when P′≤P.
  `quotient_inflate` identifies its pullback with the existing inflation of
  wild pieces, and `inflate_injective` records injectivity. These statements
  do not prove open-and-closed scheme inclusions or the condensed comparison.
- `finiteWild_iff_finite_range` assumes a continuous cocycle, a compact
  subgroup P and a T₁ target. An open cocycle kernel gives finitely many right
  cosets and hence finite image; finite image makes the identity fibre open.
  The separate pro-p/ℓ-adic argument establishing this condition for every
  parameter is still required.
- `DiscreteWeilContinuity.inertia_kernel_open` uses finitely many discrete
  coordinate functions evaluated on the same lift. Equality to their values
  at 1 must separate the lift from 1 on inertia. Compact inertia then gives
  `finite_inertia_image`. Open inertia and a discrete target give
  `continuous_lift`, without any finite-image assertion for the whole Weil
  group. Specializing these lemmas still requires the IHG anchor and actual
  invariant-generator separation theorem, not arbitrary test functions.

The new examples check the identity and full cutoffs, the finite-image
comparison, the failure of action descent for the unit cocycle with C₂
negation action, trivial lifts, an empty separating family, and a constant
nonseparating coordinate on C₂. `unramifiedPower` is the actual homomorphism
from multiplicative ℤ to ℚˣ sending k to 2^k. Its examples test Frobenius value
2, degree-zero and inverse values, trivial identity inertia image and infinite
full image. ℚˣ has its usual
Mathlib topology here; a discrete degree source makes the map continuous.
This model demonstrates why compact-inertia finiteness cannot be extended to
full-Weil finiteness; it is not a condensed-coefficient specialization.

## Independently confirmed blocker

G3 remains a supplier design/signature blocker. The current
`research/blueprint/suggested/EnhancedDerivedSheaves--E5.lean` was read in full:
monoidal coherence is represented by `True` at lines 79–81, `CAlg` by `Unit`
at line 104, stability by `True` at lines 113–115, compactness/Ind by `True`
at lines 141/145, and `AnimatedAlg` by `Unit` at line 199. Searches of current
upstream suggested files and current Tau Ceti found no faithful replacement.
The required animated stacks, stable symmetric monoidal infinity categories,
Perf/IndPerf and coherent actions therefore have no usable supplier contracts.

PROTOCOL §§13 and 20 require these actual interfaces; §15 gives their general
foundations to the existing owners. This issue permits no edits to those
owners. Complete packaging therefore needs the supplier contracts settled
first. Adding local general foundations or using unconstrained predicates
would not resolve this gap faithfully. Stopping is due to this independently
confirmed blocker, rather than the four-hour time limit.

G1, G4 and G6 also retain the obligations recorded below. In particular, the
finite-coordinate argument does not prove LP2c.3 characteristic-zero
relatively discrete continuity. No accepted gap is marked resolved, and no
ordinary signature is counted as completion of an enhanced target.

## Sources and library checks in this continuation

Read the current upstream ReductiveGroups and AlgebraicVectorBundles READMEs
in full, the E5 suggested file, accepted plan, library audit and existing
package interfaces. Read-only upstream roadmap commit:
`dea8191cc6047d6142a65872ebce6eeeb841a29b`; current Tau Ceti library commit:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

For the new mathematical arguments, read:

- Fargues–Scholze, §VIII.1.1 and Theorem VIII.1.3 with its proof, printed
  pp.278–280, from the author-hosted Geometrization PDF. SHA-256:
  `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
- Böckle–Harris–Khare–Thorne, Proposition 4.7(iii), printed pp.23–24, from
  the published Acta PDF. The profinite-group proof is applied only to compact
  inertia; openness then transports continuity to Weil cosets. SHA-256:
  `15c4b9668e335f75225215bb367c1051769990595232f8015f441d2e2c86ba2c`.
- Quast, Theorem 3.7, Claims A–C, printed pp.13–15, from the author-hosted
  pseudocharacters PDF, for the disconnected anchor/extension argument. This
  does not rely on Theorem 3.8's compactness argument. SHA-256:
  `67eb82118e49df3f7da6c1e211ad9961fc7323fc4d09d0559bcbc2434eead827`.

Read the needed Mathlib quotient lift/evaluation, quotient topology,
open-subgroup finite-quotient and continuity-at-one declarations at
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Compared pinned git objects with
the shared build byte-for-byte for Group/Quotient, Group/Neighborhood,
OpenSubgroup, QuotientGroup/Defs and Instances/Rat; all match. Earlier
31-baseline and source readings remain inherited verification, not fresh
claims of this continuation. No restricted book was needed, and no source
passage or source file is included in the repository.

## Final validation

- `lean-check research/blueprint/packages/LanglandsParameterStacks/Suggested.lean`:
  exit 0, 262 warnings, all `declaration uses sorry`; zero errors and zero
  other warning classes. This certifies elaboration of signatures with
  admitted proofs, not their proof correctness or absent supplier targets.
- Packet checker: zero errors and zero warnings; accepted input unchanged.
- README audit: 79 target headings, 79 source blocks and 79 prerequisite
  blocks; all 140 accepted API names and 90 accepted test names retained.
  Target headings and all 147 internal links are unchanged. README size:
  171,138 bytes, below 200 KB. Coverage does not certify missing
  signatures.
- Intake `check-files`: three changed deliverables, zero problems.
- `git diff --check`: passed.

No Lake project, library build, cache download or language server was started.
No compile remains running. All information needed to resume is in this note
and the submitted files; scratch may be deleted after opening the PR.

The historical note below preserves the mathematical interfaces and supplier
obligations from #8204. Its readings and counts describe that earlier
checkpoint; the current continuation's validation above is authoritative.

---

# Inherited checkpoint #8204 — codex-XDEuv3

Issue: #7909. Worker: Codex, session `codex-XDEuv3`.
Date: 2026-10-10. The claim was confirmed by the swarm bot against comment
6093067320. This continues the merged checkpoints #8167, #8186 and #8197.

## Outcome

This is a checkpoint, **not a completed package**. This continuation replaces
LP0's arbitrary enhancement denominator with the actual invariant dual centre
and gives the centre and quotient identifications, with their characteristic
maps and required hypotheses. It corrects the ordinary wild-restriction and
centralizer examples to use the framed lift p↦(1,p), and transports quotient
representations under dual-group conjugation. The submitted signatures
elaborate with only `sorry` warnings. This certifies their Lean forms, not their
proofs or the still absent enhanced/condensed targets.

The README retains all 79 targets, 140 accepted API items and 90 accepted
definition/construction tests. Its new paragraphs explain the intrinsic
denominator, fixed-centre identification, trivial Weil-centre hypothesis and
conjugation equations. The accepted packet, original reader and original
suggested file were not edited. No source passage, source file or
section-by-section source summary is included.

`metadata.toml` remains absent: the queue uses existence of all output paths
to detect package completion, and adding it would misclassify this checkpoint.
When all required signatures are present, its content is `topic = "math.NT"`.

## New LP0 group interfaces

The new block follows `section TwistedCentralizer` in the package's
Suggested.lean. It uses Mathlib's actual semidirect product, centres and group
quotients. It plans no second reductive-group or admissible-parameter theory.

- `WildEnhancement.standardWild` is `inr.comp P.subtype`; its projection is
  the wild inclusion. With trivial P-action on H, its intrinsic twisted
  centralizer is the entire L-group. A nonexample shows why the constant
  homomorphism cannot replace this framed lift when P is nontrivial.
- `invariantDualCenter` is precisely the subgroup of central h∈H satisfying
  α(w)(h)=h for every w. `dualCenterEmbedding` maps it into the actual centre
  of the twisted centralizer by h↦(h,1), with an injectivity statement.
- `denominator` is that embedding's image, not a caller-selected subgroup.
  `wildEnhancementGroup` is the centre modulo that image. `mk_eq_one` states
  that a representative is killed exactly when its ambient value is (h,1)
  for an invariant dual-centre element; `mk_dualCenter` is the forward case.
- `dualCentralizer` is the subgroup of H whose embedded points commute with
  ρ(P). `fixedCentralizerCenter` takes its centre and imposes commutation
  with the extending φ(W). `centerEquiv` identifies the intrinsic centre
  with this subgroup, assuming φ has the identity Weil projection, restricts
  to ρ, and Z(W)=1. Its value equation fixes the identification h↦(h,1),
  and `centerEquiv_denominator` fixes the denominator correspondence.
- `wildEnhancementGroup.centerIdentification` descends that identification
  to a quotient equivalence; its equation on `mk` fixes the descended map.
- `conjugateWild`, `centralizerConjugateEquiv` and `centerConjugateEquiv`
  are dual-group conjugations by (h,1). They fix the embedded invariant dual
  centre, so `wildEnhancementGroup.conjugateEquiv` is defined on quotients,
  with an equation on every centre representative. `transportRep` pulls a
  quotient representation across the inverse equivalence.

The enhancement examples test the trivial framed lift, annihilation of the
invariant dual centre, and evaluation of a transported quotient representation.
An additional example with H=1 and W=ℤ shows that triviality of the enhancement
quotient fails without the trivial-Weil-centre hypothesis. These are admitted
signature examples. The full accepted restriction and conjugation tests for
representations from S_φ are **not yet supplied**: they require the actual
complex admissible-parameter and algebraic identity-component carrier. Do not
count the group-level examples as completing that interface.

## Inherited LP2 work

Checkpoint #8197 added the LP2 block following `section FreeIndex`, before
`section Pseudocharacters` in the package's Suggested.lean. It uses the existing imported convolution
group of Hopf points, and the previous checkpoint's algebraic action and affine
cocycle equations. It introduces no replacement reductive-group model or
second generic pseudocharacter theory.

- `FreeCocycleIndex.coordinates` is the coproduct of n copies of C=O(H).
  `universal` is the actual free crossed cocycle on the coproduct inclusions.
  `pointsEquiv_apply` identifies its evaluation under every algebra-valued point.
- `gaugeAction` is constructed by gauge-transforming the universal cocycle at
  the universal H-point. Evaluation, counit and coassociativity signatures fix
  the scheme action; invariants are not invariants of H(R)-points alone.
- `wordPullback` evaluates the universal target cocycle at the indexing word
  of each source generator. Its generator, identity, composition and gauge
  equations give the covariant coordinate maps and equivariance square.
- `coordinateDiagram` is the **raw** coordinate diagram used by free-resolution
  comparisons. `invariantCoordinates`, `invariantPullback` and
  `invariantCoordinateDiagram` restrict it to equalizers of the gauge coaction
  and the map a↦1⊗a. Both diagrams are in `CommAlgCat R`.
- `ExcursionAlgebra` takes the actual algebraic action, not a supplied functor.
  `ofFree`, `lift`, `lift_eval`, `lift_unique` and `hom_ext` expose its colimit
  universal property. All three accepted excursion tests now use actual
  Hopf-model diagrams, including C=R for the trivial dual group.
- `FreeCocycleIndex.mapGroup` postcomposes tuples with a group map f.
  `invariantCoordinateTransport_val` pins transport to identity on the
  underlying generator coordinates, for the pulled-back action.
  `ExcursionAlgebra.mapGroup` is constructed by colimit descent from these
  transported structure maps. Its tuple equation and identity/composition
  laws fix its direction and functoriality.
- For Γ given by a finite presentation, `evaluateFree` restricts the
  represented universal cocycle to each indexing tuple. Its generator, word
  and gauge formulas give `rawComparisonCocone`, `rawCompare` and
  `rawCompare_isIso` for the ordinary coordinate-algebra presentation.
  `evaluateInvariantFree` restricts that cocone to the invariant equalizers;
  `comparisonCocone` and `compare` are canonical. `compare_ofFree`,
  `compare_eval` and the final algebra-valued-cocycle example fix evaluation.

Additional examples check crossed multiplication, action-dependent inversion,
coordinate-map direction, and trivial gauge coaction for a split torus with
trivial action. The existing C₂-negation and torus inversion tests retain the
nontrivial-action checks. These are signatures with admitted proofs, not
implemented mathematical tests.

The inherited ordinary raw-colimit statement is the ordinary presentation argument
of FS §VIII.3.2, p.287. It does not assert the animated comparison of
Proposition VIII.3.5, the equivariant IndPerf comparison of Theorem VIII.3.6,
universal homeomorphism, invariant base change, or continuity. Those retain
their own targets and hypotheses. No good-prime restriction was added to the
ordinary excursion construction.

These signatures use small coefficient algebras and small groups (`Type`).
The integral coefficient rings and Weil models needed here are small. The
owner's dual Hopf algebra and finite-action quotient still need specialization,
as does the finite-wild presentation; generic Hopf data alone establishes no
Weil-specific geometry or continuity.

## Blocking condition and resolution

The accepted plan's G3 remains a **supplier design/signature blocker**. It
requires faithful animated parameter and quotient stacks, stable symmetric
monoidal infinity categories, Perf/IndPerf, the full cotangent complex,
coherent singular support and relatively discrete condensed coefficient tensors.
A comment inventory or an ordinary-category shadow does not supply these
contracts. PROTOCOL §§13 and 20 require the actual named interfaces; §15
assigns the general contracts to their existing owners.

This continuation independently inspected the only E5 suggested file,
`research/blueprint/suggested/EnhancedDerivedSheaves--E5.lean`:

- `SymMonInftyCat` has `True` fields at lines 79–81;
- `CAlg` is `Unit` at line 104;
- stability has `True` fields at lines 113–115;
- compactness and Ind-completion are `True` at lines 141 and 145;
- `AnimatedAlg` is `Unit` at line 199.

The E0 quasicategory carrier is not the missing monoidal, stable, animation or
descent contract. Searches of current Tau Ceti and current upstream suggested
files found no replacement for these enhanced carriers. DGAInfinity's concrete
DG/A-infinity operations also do not provide them. The current upstream
roadmap and library commits are unchanged from the preceding checkpoint:
`dea8191cc6047d6142a65872ebce6eeeb841a29b` and
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` respectively; both were read only.

The required resolution is to settle faithful carrier/coherence contracts at
EnhancedDerivedSheaves and the other existing owners, then import them into
this package. Building general enhanced foundations in this package would
violate the ownership rule; changing the owners would violate this issue's
explicit permitted-file list. Replacing the missing conditions by `True`,
`Unit` or an unconstrained proposition would violate the signature rule.
This is why this run submits a checkpoint without pretending the job is done;
the stopping reason is a blocker, not elapsed-time exhaustion.

## Remaining interfaces

Resume against the exact statements, names, API and tests in the accepted
packet and the README; symbol counts do not certify agreement.

| Targets | Remaining work |
| --- | --- |
| LP0 condensed parameters | Actual relatively discrete coefficient functors, natural coefficient maps and finite-type module conditions; full matrix criterion and finite-wild existence/continuity signatures. The ordinary continuous LParameter remains a shadow. |
| LP0 wild enhancements | The intrinsic quotient, canonical centre identification and quotient-representation conjugation now have group-level signatures. Still provide the actual admissible complex W_F×SL₂(C) carrier, finite wild image, S_φ with its algebraic identity-component denominator, restriction from S_φ and its naturality, and extended wild parameters. WildInertialParameter itself remains an ordinary extendibility shadow, without the admissibility or prescribed-projection condition. |
| LP1 affine specialization | Specialize the existing affine equations to the owner dual-group Hopf algebra and finite-wild Weil presentation; actual condensed point comparison and the accepted `scheme_l_adic` test. |
| LP1 derived parameters | Animated quotient descent, classical truncation, perfect pullback, continuous derived Weil cochains and duality, full cotangent dual with shift/Tate twist, coherent support and relative Hochschild action. |
| LP1 Weil–Deligne | General pinned-dual cocycles and Lie(H)-valued monodromy, geometric degree, quasi-unipotent/logarithmic comparison; current signatures are split GLₙ shadows. |
| LP2 quotient and closed orbits | Reductive specialization of actual coaction invariants, coarse quotient universal maps, scheme parabolic/Levi families, absolute/strong reducibility and semisimple-parameter APIs. |
| LP2 free presentation | Ordinary coordinate/invariant diagrams, excursion colimit, group maps and represented comparison are now present. Still supply the animated free resolution, universal-homeomorphism theorem, rational isomorphism, finite-Q Θ-presentation and condensed torsion-free transition theorem. |
| LP2 categorical excursion | Coherent finite-set stable monoidal Hecke datum, creation/annihilation/reindexing, actual excursion operators, invariant-function presentation independence and the enhanced centre map. |
| LP2 pseudocharacters/traces | Projected H⋊Q/H fibre adapter over the actual IHG carrier, prescribed component evaluations, reconstruction and continuity; connect group-basis traces to IHG's algebra-linear pseudocharacters. |
| LP3 | Enhanced good-filtration t-structure, induced-perfect subcategory, bar/adjoint-unit/generation, fixed-locus and mapping-approximation/gerbe signatures; structural reductive centralizer/slice inputs. |
| LP2 integral/LP4 | Enhanced continuous/condensed invariants, higher cohomology/base change, exact monoidal universal bundles, good-prime generation and module-category equivalences. |

Inherited boundaries remain in force: eight Chapter X action/application targets
belong to ExcursionOperatorsAndSpectralAction; two generic finite-anchor and
reconstruction targets belong to IHG; general highest-weight theory belongs to
ReductiveGroupsIntegralRepresentationsPartII. Do not recreate them locally.

The accepted input also records G1's structural reductive/highest-weight and
complex-enhancement supplier obligations, G4's missing characteristic-zero
relatively discrete continuity calculation on compact inertia, and G6's
external field-GIT/ownership edge reconciliation. Field reconstruction must
not acquire the entire good-prime LP3 generation branch. G2 is a source-level
open question about full excursion-algebra independence at arbitrary bad
primes; only the torsion-free assertion is planned. Do not invent a stronger
theorem to fill it.

Two inherited corrections still require the plan owner, rather than package
edits to the accepted packet: the LP3 characteristic-two swapping example
obstructs the prime-to-characteristic order of P, not a separate π₁ condition
(FS VIII.5.18, p.308); Lafforgue Proposition 10.8's locator must include p.138
(use pp.138–139). The package retains these corrected descriptions.

## Reading and validation

This continuation read the current upstream ReductiveGroups and
AlgebraicVectorBundles READMEs in full, the E5 suggested file in full, the
accepted plan and LP0–LP4 library audit, and the existing package signature
file. Searches checked current Tau Ceti and upstream suggested files for
replacement enhanced interfaces. Earlier checkpoints' broader source and
31-baseline readings remain inherited work, not additional readings claimed
here.

For the new wild-enhancement construction, KSS §1.20–§1.21, equation (1.1),
pp.8–9, were read from the public arXiv PDF, identifier `1611.02667`. Its SHA-256
is `1cbcbb779d8d4ba8f3339d749b3dd7bc3d2555e6792491338a861d45009d9092`,
matching the accepted source. The KSS instance retains quasi-split classical
groups, odd residual characteristic, complex coefficients and admissible
extensions; no wild local Langlands conjecture is asserted. The new abstract
group identities isolate only the algebraic hypotheses actually used. No
restricted book was needed.

This continuation read Mathlib's SemidirectProduct, Subgroup/Center,
QuotientGroup/Defs and RepresentationTheory/Basic declarations at
`082e2d37e8b0463410cdb532e111cd43d5a66174`, and compared those source files
byte-for-byte with the shared build. Inherited baseline checks from #8197
cover Tau Ceti PointsFunctor and FunctorOfPoints at
`f790474821cf4256814db967cb154e7af3d0c369`, and Mathlib CommAlgCat/Basic,
FreeGroup/Basic, Limits/Shapes/Products, Limits/HasLimits,
HopfAlgebra/MonoidAlgebra, Bialgebra/Basic and TensorProduct/Maps. The shared
build is not a git clone; comparisons used pinned git objects in the read-only
library trees.

Checkpoint #8197 read FS §VIII.3.2 and Definition VIII.3.4, p.287, and
Propositions VIII.3.5–VIII.3.7 with their arguments, pp.288–289, from the
author-hosted Geometrization PDF, SHA-256
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
That is the source of the inherited LP2 construction, not a new reading
claimed in this continuation.

- `lean-check research/blueprint/packages/LanglandsParameterStacks/Suggested.lean`:
  **exit 0**, 232 warnings, all `declaration uses sorry`; zero errors and
  zero other warning classes. This checks the submitted forms, not the omitted
  enhanced/condensed ones.
- `python3 scripts/check_blueprint.py research/blueprint/packets/LanglandsParameterStacks.json`:
  zero errors and zero warnings; accepted input unchanged.
- README audit: 79 target headings, 79 source blocks, 79 prerequisite blocks;
  all 140 API names and 90 test names remain. All headings and the 147 internal
  links are unchanged; README size is 166,267 bytes, below 200 KB. This is a
  coverage audit, not certification of the missing signatures.
- `python3 research/blueprint/intake.py check-files` on the three changed
  deliverables: three files, zero problems.
- `git diff --check`: passed.

No Lake project, library build, cache download or language server was started.
No compilation remains running. Scratch contains no information required to
resume beyond this note and the submitted files.
