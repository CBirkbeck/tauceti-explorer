# PKG-LanglandsParameterStacks — blocked checkpoint

Issue [#7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909).
Worker: Codex (GPT-6), session `codex-oKXRhB`, 10 October 2026.
Branch: `codex-oKXRhB-langlands-parameter-stacks`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6095733708).
No manager-priority issue was available at selection. This available focus
package was selected under the permitted WORKERS fallback order.
Only this job was claimed. **This is an incomplete, blocked checkpoint.**

## This session's concrete progress

Replaced the admitted `projected_identity_component_shadow` calculation with a
proof and added a fully proved rational-point fixture `IdentityComponentChecks`
for LP2c.1. It uses Mathlib's actual `SemidirectProduct` with H=ℚˣ, Q=C₂ acting
by inversion and honest homomorphisms Γ=Multiplicative ℤ→J. Its checks establish:

- Both lifts have the same trivial component projection on every element of Γ.
- No H-conjugation identifies the lifts with generator values 2 and 1/2.
- The component switch conjugates one lift to the other on all of Γ; therefore
  every whole-J invariant tuple function, in every arity and with any codomain,
  gives equal values on the two parameter tuples.
- The Laurent coordinate on the identity component, extended by zero, is
  H-invariant on rational points and takes generator values 2 and 1/2.

The README now describes these checks and their boundary. They illustrate the
existing target's H-conjugation convention, without introducing a generic
invariant-algebra owner. They do not construct a geometric invariant algebra,
prove semisimple reconstruction or close the package's missing signatures.
The fixture has no admitted proofs. A standalone diagnostic showed its action,
nonconjugacy, tuple-invariance and coordinate-invariance proofs depend only on
`propext`, `Classical.choice` and `Quot.sound`, with no `sorryAx`.

Freshly rechecked the current supplier mismatch and continuity scope below.
Retained the prior worker's continuation inventory, distinguishing inherited
findings from this run's readings. The accepted LP packet is unchanged.
The package remains incomplete; `metadata.toml` is intentionally absent because
`issues.deliverables_complete` otherwise treats a package with every output path
as complete without inspecting its mathematical coverage. Add the intended
`topic = "math.NT"` only when the whole package is ready.

## Previous affine-interface checkpoint retained

That checkpoint reached main after this clone's initial snapshot. During PR
submission, the current main changes were merged into this branch. Its README
and Lean additions are retained alongside this run's regression fixture; its
source-reading claims below belong to the earlier worker.

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
3.4–3.5, pp.12–13; and Theorem 3.7 and the beginning of its proof, p.13.
The invariant action is by the identity component, and the reconstruction
statement uses identity-component conjugacy. This is a scoped reading, not a
full reconstruction-proof audit; no error in the definition is asserted.

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

Read the current SR.6.1–SR.6.3 target statements in this session. SR.6.2 wild
strata are finite at one fixed cutoff, not across all depths. No ownership move
was made. The ordinary local prototypes still need migration to actual owner
imports when the accepted LP plan is reconciled.

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
foundations. The inherited E5 supplier warning, repeated by session `codex-PuvOdI`, reports
monoidal coCartesian
and Segal fields declared as `True` and `CAlg` declared as `Unit` in the prefix
inspected by session `codex-7brC83`; it also reports that
`SSet.Quasicategory` alone does not supply the needed enhanced operations.
This run did not re-review E5 or PR #8009. Recheck their actual current
signatures before importing them; those inherited shadows are insufficient.
This run read the current ordinary AlgebraicVectorBundles and ReductiveGroups
READMEs in full for upstream style and scope. AlgebraicVectorBundles' ordinary
scheme/sheaf tensor contract does not supply quotient-stack enhanced Perf.

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
  Available memory before the final compilation was 111 GB. This checks the
  declarations present; geometric and enhanced signatures remain omitted.
- The standalone regression fixture was checked with lean-check: exit 0, zero
  errors or warnings. Axiom diagnostics had no `sorryAx`. The final full-file
  check includes the arbitrary-codomain tuple statement and every fixture proof.
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
- README.md: 187959 bytes, SHA-256
  `01c7217b31482abcf474c05473fba53f8cb5e69397de2ca7334b942d4b20fd11`.
- Suggested.lean: 110186 bytes, SHA-256
  `3bc56bc25a5ddc7f4c96c3793c27f6cbdefb9ce6c75a6224d32eacb2388a12a1`.

Only the two package artifacts and this handoff changed. No owner file or
read-only tree was edited; no Lake build/update/cache command or language server
ran. All lean-check processes finished. All continuation information is above;
no scratch file is needed by the next worker.
