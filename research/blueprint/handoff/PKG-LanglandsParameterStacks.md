# PKG-LanglandsParameterStacks — blocked checkpoint, codex-Uo2VNv

Issue [#7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909).
Worker: Codex (GPT-6), session `codex-Uo2VNv`, 10 October 2026.
Branch: `codex-Uo2VNv-langlands-parameter-stacks`.
[Bot claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6096185670).
No manager-priority issue was available in the available-swarm listing; this
focus package followed the permitted WORKERS fallback order. Only this job
was claimed. **Incomplete: blocked by supplier specifications.**

## Current outcome and resumption gate

The inherited blockers remain after checking the newer current upstream
revision `35abcbde930414647dad7cc22ee03e6464c7ae26`, whose latest change concerns
IntegralHeckeAndGaloisDeterminants. Its relevant invariant and continuity
interfaces still do not provide the required LP contracts. The current native
Tau Ceti revision is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The accepted LP and IHG plans and the E5 suggested input retain exactly the
hashes recorded in the preceding checkpoint below.

The stopping condition is a specification mismatch, not an implementation
wait or the run's time limit. The issue explicitly says: **“Change no packet;
if the plan has a mistake, describe it in the handoff note.”** Its permitted
files are the three package artifacts and this note. PROTOCOL §§3, 13, 15
and 20 require precise supplying statements, faithful suggested signatures
and one owner for shared foundations. Repairing the owner contracts and
reconciling their consumers requires edits outside those files. No ownership
move is made, and no complete package is claimed.

## Fresh contract checks

| Consumer | Inspected supplier | Required repair before packaging |
| --- | --- | --- |
| LP2c.1 prescribed-projection pseudocharacters and their reconstruction | Current upstream IHG README §0.7; `InvariantCoordinateInput.ring`, Suggested.lean lines 795–804 | Export the invariant tuple algebras for conjugation by H=J⁰ on J=H⋊Q, their regular evaluation, reindexing and ordered multiplication, and reconstruction up to H-conjugacy. The current input quantifies over all conjugating J-points over every coefficient algebra and yields O[Jⁿ]^J. |
| LP2c.3 characteristic-zero continuity | Accepted IHG.1 `reductive-valued-continuity`; current upstream `IsContinuous`, `continuous_ofRepresentation`, `continuous_dense_ext`, lines 948–965 | State the finite-Q reconstruction-to-continuity theorem for relatively discrete condensed coefficients, including the local finite-type Z_l-module bounds on compact inertia. The accepted IHG theorem is connected, profinite and rank-one-valued. The upstream constructor assumes representation continuity; dense extensionality does not reverse that constructor. |
| LP1 derived parameter stack, LP2 categorical Hecke datum, LP3 mapping approximation, LP4 representation bundles | `suggested/EnhancedDerivedSheaves--E5.lean`, lines 76–115 and 141–147 | Supply genuine enhanced monoidal, stable, algebra-object and Ind interfaces from E0/E5, and the animated stack/Perf interfaces from SF.1/S.1. `True` structure conditions, `CAlg = Unit` and `IndInfty : True` cannot express the required coherence or category-valued universal property. |

Read the LP consumer statements, hypotheses, proof routes and prerequisites,
including the exact category-valued mapping approximation and the prescribed
component-idempotent equations. The accepted LP review explicitly accepts
eight planned, unclosed stages with G1–G4 and G6 retained. Its `complete`
status describes a finished target-level planning pass, not closure.

Independently re-fetched and read Quast, *Deformations of G-valued
pseudocharacters*, Definition 3.1, printed p.11, Lemmas 3.4–3.5, pp.12–13,
and Theorem 3.7 and proof, pp.13–15. The definition uses identity-component
invariants and the reconstruction uniqueness is identity-component conjugacy.
The [author PDF](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf)
has SHA-256 `67eb82118e49df3f7da6c1e211ad9961fc7323fc4d09d0559bcbc2434eead827`,
matching the preceding receipt. No new source erratum or audit of its cited
auxiliary papers is claimed.

Read the existing `IdentityComponentCoordinateChecks` proofs, lines 2204–2342.
For nonzero R, f=(x,0) in R[x,x⁻¹]×R[x,x⁻¹] is H-invariant but fails the
component-switch invariant equation; e=(1,0) satisfies both. This proves why
imposing component idempotents on whole-J coordinates does not restore the
missing H-invariant function. The fixture and both package artifacts are
unchanged; their preceding receipts and continuation worklist are retained
below. Read the current AlgebraicVectorBundles and ReductiveGroups READMEs
in full and the eight reviewed AUDIT-21 LP entries. Ordinary scheme bundles
do not state the enhanced quotient-stack operations required here. This
session makes no comprehensive absence claim about the newer library.

## Validation in this session

- `check_blueprint.py` on the LP and IHG plans: both exit 0, zero errors
  and warnings. LP retains 79 nodes, 140 API items, 90 tests, five gaps,
  sixteen requests and zero closed stages. No plan was edited.
- `lean-check research/blueprint/packages/LanglandsParameterStacks/Suggested.lean`:
  exit 0, no errors, 295 warnings, all `declaration uses sorry`, no other
  warnings. Memory before compilation: 104 GB available. Compilation used
  the managed atlas build advertised at Tau Ceti `f790474` and Mathlib
  `082e2d3`; it does not validate the omitted enhanced signatures.
- Only this handoff is changed. The README remains 189428 bytes and the
  suggested file 116156 bytes. `metadata.toml` remains absent; this is a
  checkpoint, not a package ready for review.
- Scoped intake `check-files`: one authorized file, zero problems.
  `git diff --check`: passed. No source passage or private path was added.

Resume after owner-authorized repairs actually provide the contracts in the
table and reconcile the LP/IHG supplier edges. Then follow the missing
signature inventory and remaining worklist below, complete all target/API/test
comparisons, add metadata and repeat the package checks. No scratch file is
needed for resumption, and no Lean process remains running.

---

## Preserved preceding checkpoint

The record below belongs to session `codex-VVFmI4`; its changes and source
readings are retained as that session's work, not attributed to this one.

# PKG-LanglandsParameterStacks — blocked checkpoint

Issue [#7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909).
Worker: Codex (GPT-6), session `codex-VVFmI4`, 10 October 2026.
Branch: `codex-VVFmI4-langlands-parameter-stacks`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6095989082).
No manager-priority issue was available at selection. This available focus
package was selected under the permitted WORKERS fallback order.
Only this job was claimed. **This is an incomplete, blocked checkpoint.**

## This session's concrete progress

Added the fully proved regular-coordinate fixture
`IdentityComponentCoordinateChecks` for LP2c.1, extending the rational-point
fixture from checkpoint [#8322](https://github.com/CBirkbeck/tauceti-explorer/pull/8322).
It uses actual native Laurent/additive monoid algebras over an arbitrary
commutative ring R:

- O[G_m⋊C₂] is represented by R[x,x⁻¹]×R[x,x⁻¹], with one factor per component.
  O[G_m×(G_m⋊C₂)] uses two copies of R[h,h⁻¹,x,x⁻¹].
- Algebra homomorphisms for conjugation and projection act on exponents by
  n↦(0,n) on the identity component and n↦(2n,n) for conjugation on the other
  component. The component-switch pullback acts by n↦−n on each factor.
- f=(x,0) belongs to the conjugation/projection equalizer, but is not fixed by
  the component switch for any nonzero R. The coefficient proof also applies
  in characteristic two: it compares Laurent exponents, not the scalars ±1.
- (0,x) is not H-invariant for nonzero R. This catches a coaction incorrectly
  made trivial on the nonidentity component.
- e=(1,0) is an idempotent fixed by both actions. The rational evaluation algebra
  maps at 2 and 1/2 send e to 1 in both cases and send f to 2 and 1/2.

The equalizers are Mathlib's `AlgHom.equalizer`; no second general invariant
construction is introduced. The fixture contains no `sorry`. Standalone
axiom diagnostics for the two noninvariance proofs, H-invariance, component
invariance and coordinate evaluation report only `propext`, `Classical.choice`
and `Quot.sound`, with no `sorryAx`. It demonstrates the missing supplier's
required discrimination using regular functions, beyond the inherited
rational-point check. It does not supply a general pseudocharacter carrier,
semisimple reconstruction, enhanced stacks or their missing signatures.

Updated LP2c.1's README with the algebra maps, explicit positive and negative
checks and their scope. Corrected its FS VIII.3.7–VIII.3.8 page range to
pp.288–290 after reading the start of VIII.3.7 on p.288. No packet changed.

Freshly inspected IHG's whole-group coordinates, its continuity signatures,
and the E5 enhanced supplier's actual placeholder declarations. These still
block a faithful complete package outside this issue's authorized files.
The package remains incomplete; `metadata.toml` is intentionally absent because
`issues.deliverables_complete` otherwise treats a package with every output path
as complete without inspecting its mathematical coverage. Add the intended
`topic = "math.NT"` only when the whole package is ready.

## Previous affine-interface checkpoint retained

This branch started from main at `295239bbc27bea4e395f6dc15265210b69434af7`,
which already includes checkpoints #8311 and #8322. Both are retained. The
rational-point fixture from #8322 proves distinct H-gauge classes at the same
projection and equal whole-J invariant evaluations in every tuple arity.
The source-reading claims in the affine-interface account below belong to
that earlier worker, rather than this session.

Session `codex-PuvOdI`’s merged checkpoint [#8311](https://github.com/CBirkbeck/tauceti-explorer/pull/8311) completed the ordinary affine interface of LP2e.1 in README and Suggested.lean:

- `ParameterInvariantAlgebra` now specializes Mathlib's `AlgHom.equalizer`
  rather than defining a second equalizer. Read its native submodule comparison.
- Added equivariant restriction of coordinate maps, its value equation,
  identity and composition. Two actual commuting coaction squares are required.
- Added `ParameterCoarseQuotient` as the actual `AlgebraicGeometry.Spec` of the
  invariant algebra, its quotient map, descent to affine targets and uniqueness
  among scheme morphisms with the specified composite. Inflation has the
  correct contravariant direction and a commuting quotient square.
- Added the canonical tensor base-change homomorphism and invariant comparison,
  their pure-tensor equations, and the algebra isomorphism under
  `Module.Flat R S`. This follows from exactness, independently of good primes;
  nonflat parameter-specific comparison remains a separate target.
- Added suggested checks for affine unique descent, the invariant inclusion,
  trivial coaction, self-base-change and a nonflat failure. For the sign action
  of C₂ on Z[x], mod-2 reduction makes x invariant although x is outside the
  image of the extended invariant algebra. This is a check of the general
  equalizer adapter, not a connected-reductive GIT counterexample.

That worker reports reading the relevant pinned statements of `AlgHom.equalizer`, `AlgHom.liftEquiv`,
`Module.Flat.lTensor_exact`, `Module.Flat.lTensor_preserves_injective_linearMap`,
`Spec.homEquivAlgHom` and the affine spectrum comparison before using them.
That worker also reports reading BHKT Proposition 3.10(iv), pp.15–16, and FS VIII.3, pp.285–290, for the
flat and coarse quotient conventions. Its suggested signatures elaborated;
their roadmap proofs use `sorry`. No formalisation is claimed.

## Blocking supplier contracts, freshly inspected

The stopping condition is a mathematical contract mismatch outside this
issue's authorized files.

### Identity-component coordinates and reconstruction

Current upstream IntegralHeckeAndGaloisDeterminants README §0.7 states that
`InvariantCoordinateInput.ring` uses whole-group conjugation and that its
reductive applications use connected groups. Its Suggested.lean definition
quantifies over every point of the group represented by the supplied Hopf
algebra as the conjugating element (`ring`, lines 795–804). For the Hopf
algebra O[J] this gives O[Jⁿ]^J, whereas LP2c.1 requires O[Jⁿ]^H with H=J⁰. The README explicitly
distinguishes the disconnected identity-component input from its own input.
The example added here shows why neither restricting the coefficient field nor
imposing the component idempotents fixes that mismatch.

The accepted atlas IHG plan describes generalized-reductive algebraic
reconstruction. That remains distinct from the current upstream interface:
LP's package must cite an actual lower-tier roadmap contract of the required
scope. Do not silently substitute whole-group invariant algebras for the
accepted LP target or introduce another generic reconstruction owner here.
The IHG owner must export identity-component coordinate algebras, their
reindexing and ordered multiplication maps, compatible evaluation, component
idempotents and generalized reconstruction up to H-conjugacy. Then an
authorized LP plan repair must reconcile its citations with that export.

Freshly fetched and read Quast, Definition 3.1, printed p.11; Lemmas 3.2 and
3.4–3.5, pp.12–13; Theorem 3.7 and its proof, pp.13–15; and the continuity
Theorem 3.8 discussion, pp.15–16. Definition 3.1 uses identity-component
invariants, and Theorem 3.7 uses identity-component conjugacy. The cited
BHKT/BMR inputs were not independently re-audited here, and the inherited
IHG E13 compactness objection is not resolved. No new source erratum is claimed.

### G4: reconstruction-to-continuity, with the right coefficients

Read the full LP `characteristic-zero-continuity` node and request and the full
atlas IHG `IHG.1/reductive-valued-continuity` node. The latter covers connected
split reductive H, profinite source and rank-one-valued characteristic-zero
coefficients. LP asks for H-conjugation on H⋊Q with prescribed Q projection
and relatively discrete condensed coefficients.

Current upstream §0.7 and Suggested.lean give
`ReductivePseudocharacter.IsContinuous`, `continuous_ofRepresentation` and
`continuous_dense_ext` (Suggested.lean, lines 948–965). The displayed
representation constructor assumes continuity of the representation and invariant evaluation. It cannot provide
the converse reconstruction-to-continuity theorem or a finite-type coefficient
bound. Its dense equality lemma cannot provide those conclusions either.

Freshly fetched and read Fargues–Scholze Definition VIII.1.1 and Remark VIII.1.2,
printed pp.278–279, and Proposition VIII.3.8 and its proof, printed p.290.
The coefficient convention requires inertia-coordinate functions to take values
in finite-type Z_l-submodules and be continuous; the proof invokes Lafforgue's
finite-anchor argument. Valuation continuity alone does not state this finite-type
module requirement. The actual LP node acknowledges that step as unresolved G4.

The required owner export is: from compatible relatively discrete condensed
invariant evaluations on J=H⋊Q with prescribed η, reconstruct a semisimple
condensed parameter with that projection; on compact inertia, finite-anchor
coordinate lifting preserves locally finite-type Z_l-submodules. Translate to
Weil cosets by the crossed law, without imposing finite full Weil image. State
the rank-one-valued specialization separately. Include restriction, coefficient
transport and conjugacy independence. Checks must retain Q=1, nontrivial finite
action, infinite-image characteristic-zero inertia characters and infinite
cyclic unramified Frobenius image. Do not use Quast Theorem 3.8 without resolving
the accepted IHG E13 compactness objection.

### Enhanced categories and animated geometry

Freshly read the current atlas `EnhancedDerivedSheaves--E5.lean` prefix.
Its `SymMonInftyCat` has `toFinPointed`, `coCartesian` and `segal` fields
of type `True` (lines 79–81); `InftyOperad` similarly has three `True` fields
(lines 94–96). `CAlg` is defined to be `Unit` (line 104), and `IsStable`
has only `True` conditions (lines 113–115). The stated `IndInfty` is also
`True`. The genuine quasicategory carrier declared immediately before these
fields does not make these enhanced operations faithful.

Consequently those displayed exports cannot type the category-valued mapping
approximation, animated parameter stacks, enhanced Perf/IndPerf, coherent
categorical Hecke data or universal representation bundles in the accepted
LP targets. Ordinary categories and ordinary algebraic vector bundles do not
supply their higher mapping/coherence data. E0/E5 and SF.1/S.1 remain the
owners: repair their actual interfaces, then import them here. Do not replace
these LP targets by ordinary shadows or create generic enhanced foundations
in LP's package to work around the mismatch. This is evidence about these
specific exports, not a claim that every current-library declaration was
exhaustively searched.

### Why this job cannot repair those contracts

Issue #7909 allows the package README, Suggested.lean, metadata and this handoff,
and says: “Change no packet; if the plan has a mistake, describe it in the
handoff note.” PROTOCOL §§3, 13, 15 and 20 require adequate suppliers, faithful
signatures and single ownership. Exporting the missing generic IHG interfaces
and repairing their owner edges requires files outside these deliverables.
Current upstream Tau Ceti roadmaps are read-only and are never re-planned here.
Resume after checking an authorized supplier/consumer repair's actual statements;
a merge or changed review label alone is insufficient.

## Remaining signature and ownership worklist

The accepted LP review accepted a complete target-level planning pass with
explicit gaps; it did not certify a closed package. Its inventory is 79 nodes,
140 API items, 90 tests, 31 planets, 31 baseline declarations, eight planned
stages, zero closed stages, five gaps and sixteen requests.

Preserve the current SR.6 ownership already recorded in the package README:

| Imported target | Current upstream supplier | LP addition |
| --- | --- | --- |
| Ordinary crossed cocycles and section/gauge laws | SR.6.1 crossed-cocycles | Restriction and condensed comparisons |
| Dense finite-wild model and l-adic extension | SR.6.1 finite-wild-discretization, ell-adic-extension | Geometric degree and relatively discrete interface |
| Integral cocycle scheme | SR.6.1 finite-wild-representability | All-depth gluing, derived and condensed comparisons |
| Excursion algebra and coefficient identities | SR.6.3 excursion-algebra | Arbitrary-source extensions and enhanced operator realization |
| Universal homeomorphism and invariant comparison | SR.6.3 excursion-invariant-comparison | Enhanced colimit, cohomology and stronger base change |

Checkpoint #8322 records reading the current SR.6.1–SR.6.3 target statements;
this run did not repeat that audit. SR.6.2 wild strata are finite at one fixed
cutoff, not across all depths. No ownership move was made. The ordinary local
prototypes still need migration to actual owner imports when the accepted LP
plan is reconciled.

The inherited minimum missing-signature inventory remains:

| Target | Required signatures and tests |
| --- | --- |
| LP0 extended wild parameters | `ExtendedWildParameter`, `WildParameterClasses`, `restrictEnhancedParameter`, `ExtendedWildParameter.forget`; `extended_wild_unramified`, `extended_wild_conjugacy`, `extended_wild_forget` |
| LP1 derived parameter stack | `DerivedParameterStack`, `.framed`, `.forgetFraming`, `.classicalPoints`, `.perfectPullback`; `derived_stack_trivial_group`, `derived_stack_free_group`, `derived_stack_gauge` |
| LP2 categorical Hecke datum | `CategoricalHeckeDatum`, `.unit`, `.reindex`, `.create`, `.annihilate`; `hecke_empty_set`, `hecke_fold`, `hecke_zero_category` |
| LP3 good-filtration t-structure | `goodFiltrationTStructure`, `.connective_iff`, `.coconnective_iff`, `.tensorConnective`, `.homotopy`; `good_torus`, `good_zero`, `good_induced`, `good_shift_sign` |
| LP3 induced perfect complexes | `InducedPerfectComplexes`, `.pullback`, `.retract`, `.moduleFunctor`, `.minimal`; `induced_point`, `induced_trivial_group`, `induced_retract`, `induced_not_all_bad_prime` |
| LP3 mapping approximation | `ParameterMappingApproximation`, `.compare`, `.finiteTorsor`, `.leftKan`, `.ind`; `approx_point`, `approx_coproduct`, `approx_bad_prime` |
| LP4 universal bundles | `UniversalRepresentationBundle`, `.unit`, `.tensor`, `.reindex`, `.act`, `.baseChange`; `rep_bundle_unit`, `rep_bundle_at_parameter`, `rep_bundle_tensor` |

Recover these 35 API items and 23 tests, then audit every other target/API/test
for actual signature fidelity. Their names in README or an elaborating ordinary
shadow do not express the enhanced target. Preserve the following contracts:

- Good-filtration connective means D^{≤0} on IndPerf. Truncations need not preserve
  Perf; dualizable perfect complexes differ from compact objects of unrestricted
  quotient-stack derived categories in positive characteristic.
- Mapping approximation is a category-valued sifted left Kan extension. Its
  base set is finite, while a total Γ-torsor need not be finite. Preserve the
  bad-prime PGL_l, Γ=ℤ exclusion of the unit skyscraper.
- Universal representation bundles precede good-prime generation and do not
  inherit its prime restriction. They need coherent action and exact tensor,
  fusion and coefficient-pullback comparisons.
- Extended wild enhancements restrict admissible complex parameters; their
  restriction need not remain irreducible. Keep the actual algebraic component
  denominator and embedded invariant dual centre.

E0/E5 and SF.1/S.1 own the enhanced category, animation, descent and QCoh/Perf
foundations. The concrete E5 mismatch is freshly recorded above; this run did
not review PR #8009. This run read current ordinary AlgebraicVectorBundles and
ReductiveGroups READMEs in full for upstream style and scope.
AlgebraicVectorBundles' ordinary scheme/sheaf tensor contract does not supply
quotient-stack enhanced Perf.

Other inherited plan repairs to retain:

1. G1: structural reductive/admissible-complex extensions need actual owner
   contracts. Integral highest-weight theory extends
   ReductiveGroupsIntegralRepresentationsPartII via its registered parent Layer 9
   until design stage ids exist. Neither that parent nor RG2.5 supplies all
   Jantzen/Donkin/Koppinen/TvdK inputs. Do not invent RG2.6 as a general GIT owner.
2. G6: reconcile the generic IHG prerequisites still referencing all LP3 with
   unconditional field invariant theory and exact regular-function inputs.
   General reconstruction must not inherit the good-prime generation branch.
   Shared Seshadri/Haboush/power-lifting inputs need one declared owner shared
   with the deformation-ring direction.
3. G2: FS proves discretization independence for the l-torsion-free excursion
   quotient. Full torsion-sensitive independence at arbitrary bad primes remains
   an open source question; do not promote it to a theorem.
4. Complete the condensed tensor, derived Weil cochain/duality, cotangent and
   support, parabolic/Levi and invariant quotient signatures. Chapter X
   action/application targets remain with ExcursionOperatorsAndSpectralAction.
5. Preserve coaction invariants rather than H(R)-point invariants; normal wild
   kernels must lie in the action kernel. Geometric degree negates arithmetic
   degree on the same Weil carrier, giving Tate values q⁻¹ and q respectively.
6. Keep the inherited source corrections: the characteristic-two swapping
   example concerns the prime-to-characteristic order of P (FS VIII.5.18, p.308),
   and Lafforgue Proposition 10.8 uses pp.138–139. These were not freshly verified
   source findings in this session.
7. After owner/plan repair, finish the package's faithful signatures, add metadata,
   run lean-check and scoped submission checks, then submit the complete package.

## Validation and reproducibility

- `python3 scripts/check_blueprint.py research/blueprint/packets/LanglandsParameterStacks.json`:
  zero errors, zero warnings. No packet was changed.
- `lean-check research/blueprint/packages/LanglandsParameterStacks/Suggested.lean`:
  exit 0, zero errors, 295 warnings, all `declaration uses sorry`; no other warnings.
  Available memory before the final compilation was 108 GB. This checks the
  declarations present; geometric and enhanced signatures remain omitted.
- The standalone regular-coordinate fixture was checked with lean-check:
  exit 0, zero errors or warnings. Axiom diagnostics had no `sorryAx`. The final
  full-file check includes every new coordinate proof as well as the inherited
  rational-point and arbitrary-codomain tuple proofs.
- Scoped intake `check-files`: three authorized files, zero problems.
  `git diff --check`: passed.
- Managed compilation pins are Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. The latter is the wrapper's advertised
  prepared build, not a fresh git receipt: the prepared Tau Ceti directory has
  no `.git`. Current read-only upstream is
  `201bcaee1f4014c91897d50cdb7631fc6d6a6d71`; current read-only native Tau Ceti is
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- Source receipts fetched on 2026-10-10: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
  SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`;
  [Quast](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf),
  SHA-256 `67eb82118e49df3f7da6c1e211ad9961fc7323fc4d09d0559bcbc2434eead827`.
  Both match the accepted packet. The earlier affine-interface worker also
  reports [BHKT](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf),
  SHA-256 `15c4b9668e335f75225215bb367c1051769990595232f8015f441d2e2c86ba2c`.
  That receipt is retained from #8311 and was not re-fetched here.
  Source readings are scoped above; no full
  source audit, new source erratum or private-book use is claimed.
- Unchanged LP input SHA-256:
  `e3554e4ad95f573e992965939391157a755455b65305fd34508538b52e7b8087`.
- Unchanged atlas IHG input SHA-256:
  `1d06c30103ac2c17a0c2964e2c7721d66c5e939b6b9898f7441d9abdf01a782b`.
- README.md: 189428 bytes, SHA-256
  `1408a112b14aa45ec2f54559642421e8b618a48d3b7a3e13e4a0760ed004e6f8`.
- Suggested.lean: 116156 bytes, SHA-256
  `464ffa446ddb69316d6974eb41eded73630657aeb242715e0b882f6016303fba`.
- Unchanged inspected E5 suggested input SHA-256:
  `e8119768303f20e9952f0576d1ea163903060e1bfccfd4b9fe97528a32f8ac7c`.

Only the two package artifacts and this handoff changed. No owner file or
read-only tree was edited; no Lake build/update/cache command or language server
ran. All lean-check processes finished. All continuation information is above;
no scratch file is needed by the next worker.
