# PKG-LanglandsParameterStacks — blocked checkpoint

Issue: #7909. Worker: Codex (GPT-6), session `codex-kKj5K3`.
Date: 2026-10-10. The claim was confirmed by the swarm bot against comment
6092865951. This continues the merged checkpoints #8167 and #8186.

## Outcome

This is a checkpoint, **not a completed package**. The continuation replaces
LP2's arbitrary supplied ring diagram with the actual free-cocycle coordinate
and scheme-invariant diagrams of a commutative Hopf coefficient model. Its
excursion algebra is now a colimit in commutative **R-algebras**, with canonical
group transport and a canonical comparison to the represented cocycle scheme.
The submitted signatures elaborate with only `sorry` warnings. Compilation
certifies neither proofs nor agreement with the still absent enhanced targets.

The README retains all 79 targets, 140 accepted API items and 90 accepted
definition/construction tests. New explanatory paragraphs spell out the word
maps, scheme coactions, coefficient-algebra colimit and comparison. The
accepted packet, original reader and original suggested file were not edited.
No source passage, source file or section-by-section source summary is included.

`metadata.toml` remains absent: the queue uses existence of all output paths
to detect package completion, and adding it would misclassify this checkpoint.
When all required signatures are present, its content is `topic = "math.NT"`.

## New interfaces and their characteristic equations

The new LP2 block follows `section FreeIndex`, before `section Pseudocharacters`
in the package's Suggested.lean. It uses the existing imported convolution
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

The new ordinary raw-colimit statement is the ordinary presentation argument
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
| LP0 wild enhancements | Weil/L-group projection, finite wild image, canonical central identification, quotient representations, conjugacy transport, admissible complex extensions with SL₂ and restriction of enhancements. |
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
AlgebraicVectorBundles READMEs in full, inspected DGAInfinity's suggested
forms, the E5 supplier and the reviewed audit of LP0–LP4. Earlier checkpoints'
broader source and 31-baseline readings remain inherited work, not additional
readings claimed here.

For the new excursion construction, FS §VIII.3.2 and Definition VIII.3.4,
p.287, and Propositions VIII.3.5–VIII.3.7 with their arguments, pp.288–289,
were read from the author-hosted Geometrization PDF. Its SHA-256 is
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`,
matching the accepted version. No restricted book was needed.

Shared-build source files were compared byte-for-byte with git objects at
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`: Tau Ceti PointsFunctor and
FunctorOfPoints, and Mathlib CommAlgCat/Basic, FreeGroup/Basic,
Limits/Shapes/Products, Limits/HasLimits, HopfAlgebra/MonoidAlgebra,
Bialgebra/Basic and TensorProduct/Maps. The point-functor, algebra-category,
colimit and free-group universal-property declarations used here were read at
that baseline. The shared build is not a git clone, so the comparison used
pinned git objects from the read-only library trees.

- `lean-check research/blueprint/packages/LanglandsParameterStacks/Suggested.lean`:
  **exit 0**, 204 warnings, all `declaration uses sorry`; zero errors and
  zero other warning classes. This checks the submitted forms, not the omitted
  enhanced/condensed ones.
- `python3 scripts/check_blueprint.py research/blueprint/packets/LanglandsParameterStacks.json`:
  zero errors and zero warnings; accepted input unchanged.
- README audit: 79 target headings, 79 source blocks, 79 prerequisite blocks;
  all 140 API names and 90 test names remain. All headings and the 147 internal
  links are unchanged; README size is 164,821 bytes, below 200 KB.
- `python3 research/blueprint/intake.py check-files` on the three changed
  deliverables: three files, zero problems.
- `git diff --check`: passed.

No Lake project, library build, cache download or language server was started.
No compilation remains running. Scratch contains no information required to
resume beyond this note and the submitted files.
