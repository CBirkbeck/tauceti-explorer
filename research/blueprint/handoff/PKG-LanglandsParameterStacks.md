# PKG-LanglandsParameterStacks — blocked checkpoint

Issue [#7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909).
Worker: Codex (GPT-6), session `codex-7brC83`, 10 October 2026.
Branch: `codex-7brC83-langlands-parameter-stacks`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6095132377).
No manager-priority issue was available at selection; the available focus package
was selected after the top review #5702 had been claimed by another session.
Only this job was claimed. **This is an incomplete, blocked checkpoint.**

## This session's concrete progress

Added an identity-component invariant check to README LP2c.1 and its rational
unit calculation `projected_identity_component_shadow` to Suggested.lean.
For H=G_m, Q=C₂ acting by inversion, Γ=ℤ and trivial η, the lifts with generator
values (2,1) and (1/2,1) are semisimple and not H-conjugate, but are J-conjugate
for J=H⋊Q. The Laurent coordinate on the identity component, extended by zero,
is H-invariant and separates them. Whole-J invariant families cannot separate
them, including after imposing the same η. This illustrates an existing target's
H-conjugation convention; it introduces no new owner or geometric construction.
The suggested example checks only the rational conjugation, inversion and
coordinate calculation. A separate scratch proof of that exact statement
elaborated with no `sorry`, errors or warnings.

Replaced the previous handoff's duplicated continuation notes and contradictory
current-tree receipts with this worklist. The accepted LP packet is unchanged.
The package remains incomplete; `metadata.toml` is intentionally absent because
`issues.deliverables_complete` otherwise treats a package with every output path
as complete without inspecting its mathematical coverage. Add the intended
`topic = "math.NT"` only when the whole package is ready.

## Blocking supplier contracts, freshly inspected

The primary stopping condition is a mathematical contract mismatch outside this
issue's authorized files, not lack of proofs of specified roadmap theorems.

### Identity-component coordinates and reconstruction

Current upstream IntegralHeckeAndGaloisDeterminants README §0.7 states that
`InvariantCoordinateInput.ring` uses whole-group conjugation and that its
reductive applications use connected groups. Its Suggested.lean definition
quantifies over every point of the group represented by the supplied Hopf
algebra as the conjugating element. For the Hopf algebra O[J] this gives
O[Jⁿ]^J, whereas LP2c.1 requires O[Jⁿ]^H with H=J⁰. The README explicitly
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

Freshly fetched and read Quast, Definition 3.1, printed p.11, and the surrounding
reconstruction discussion, pp.12–15. The invariant action there is by the
identity component. No error in that definition is asserted.

### G4: reconstruction-to-continuity, with the right coefficients

Read the full LP `characteristic-zero-continuity` node and request and the full
atlas IHG `IHG.1/reductive-valued-continuity` node. The latter covers connected
split reductive H, profinite source and rank-one-valued characteristic-zero
coefficients. LP asks for H-conjugation on H⋊Q with prescribed Q projection
and relatively discrete condensed coefficients.

Current upstream §0.7 and Suggested.lean give
`ReductivePseudocharacter.IsContinuous`, `continuous_ofRepresentation` and
`continuous_dense_ext`. The displayed representation constructor assumes
continuity of the representation and invariant evaluation. It cannot provide
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
foundations. Read the checked-in E5 prefix: its monoidal coCartesian and Segal
fields are `True`, and `CAlg` is `Unit`; those cannot be imported as the actual
structures. A metadata check on PR #8009 still finds it OPEN at
`b0b9344dd7b7a1f3b2d6dc0f767a81d331ffa95f`, the same head inspected by the previous
worker. This session did not re-review that PR. Read pinned `SSet.Quasicategory`:
it supplies inner horn filling, not those enhanced operations. Read the ordinary
AlgebraicVectorBundles and ReductiveGroups READMEs in full for the required
upstream style and boundaries. The current native sheaf tensor is ordinary
sheafification, not quotient-stack enhanced Perf.

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
  exit 0, zero errors, 277 warnings, all `declaration uses sorry`; no other warnings.
  Available memory before compilation was 113 GB. This checks the declarations
  present, not the omitted geometric and enhanced signatures.
- The new rational-unit statement was independently proved in scratch and checked
  with lean-check: exit 0, zero warnings, no `sorry`. That proof is not a new
  repository implementation.
- Scoped intake `check-files`: three authorized files, zero problems.
  `git diff --check`: passed.
- Managed compilation pins are Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. The latter is the wrapper's advertised
  prepared build, not a fresh git receipt: the prepared Tau Ceti directory has
  no `.git`. Current read-only upstream is
  `cd03e06852a13216ad246d0623492c4beac39af2`; current read-only native Tau Ceti is
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- Source receipts fetched on 2026-10-10: [FS](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
  SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`;
  [Quast](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf),
  SHA-256 `67eb82118e49df3f7da6c1e211ad9961fc7323fc4d09d0559bcbc2434eead827`.
  Both match the accepted packet. Source readings are scoped above; no full
  source audit, new source erratum or private-book use is claimed.
- Unchanged LP input SHA-256:
  `e3554e4ad95f573e992965939391157a755455b65305fd34508538b52e7b8087`.
- README: 183182 bytes, SHA-256
  `534f5ed76734d0e39511ae7c721deb203300a31a0d943290ac9cbdddc06ab22a`.
- Suggested.lean: 97841 bytes, SHA-256
  `d86fe069c04f7dbb31e895750deb4a6cef8d15dc8219d4d76172165c5de8a418`.

Only the two package artifacts and this handoff changed. No owner file or
read-only tree was edited; no Lake build/update/cache command or language server
ran. Both lean-check processes finished. All continuation information is above;
no scratch file is needed by the next worker.
