# PKG-LanglandsParameterStacks — blocked checkpoint

Issue [#7909](https://github.com/CBirkbeck/tauceti-explorer/issues/7909).
Worker: Codex (GPT-6), session `codex-CFZU3T`, 10 October 2026.
Branch: `codex-CFZU3T-LanglandsParameterStacks`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6096279559).
None of the manager-priority issues was in the available-swarm listing. This
focus package was selected under the permitted WORKERS fallback order. Only
this job was claimed. **Incomplete: supplier specifications still prevent a
faithful complete package.**

## Work completed in this checkpoint

The existing LP2e.1 nonflat comparison test is now proved against the actual
`ParameterInvariantAlgebra.baseChangeMap`, rather than proved with `sorry`.

- Constructed the canonical comparison by restricting the scalar extension of
  the invariant inclusion to Mathlib's `AlgHom.equalizer`. Tensor induction
  proves that its image satisfies the equalizer equation. This constructs the
  map for every scalar extension, independently of flatness.
- Proved `baseChangeHom_tmul` and `baseChangeMap_tmul`. The statements and
  variance of the existing interface are unchanged.
- Added `ParameterInvariantAlgebra.NonflatReductionChecks`: for the sign
  action on the actual polynomial algebra over the integers, an invariant's
  coefficient of X is zero. The genuine polynomial reduction map on the tensor
  algebra preserves this obstruction for every tensor, not just reductions of
  individual invariant polynomials.
- Proved `nonflat_reduction`: over `ZMod 2`, `1 ⊗ X` is invariant but has no
  preimage under the canonical comparison. The existing
  `flat_nonflat_reduction` example invokes this theorem.
- Expanded the corresponding README check with the coefficient argument.
  No target, hypothesis, ownership boundary or source claim was changed.

An isolated check extracted the exact new definitions and proofs from the
package. Axiom diagnostics for `baseChangeHom_tmul`, `baseChangeMap`,
`baseChangeMap_tmul` and `NonflatReductionChecks.nonflat_reduction` report only
`propext`, `Classical.choice` and `Quot.sound`, with no `sorryAx`. The fixture
checks a general equalizer adapter for a disconnected acting group. It is not
a counterexample to the parameter-specific good-prime invariant theorem.
The package as a whole remains a suggested file, with unproved roadmap targets.

## Actual blockers and resumption requirements

Freshly inspected the current upstream revision
`48cda9fcc5dbdc8f8d51e717f6a3090e0c4cd688` and current native Tau Ceti revision
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the current
AlgebraicVectorBundles and ReductiveGroups READMEs in full, the relevant
IntegralHeckeAndGaloisDeterminants README and suggested interfaces, and the
reviewed AUDIT-21 entries for all eight LP layers. Read the native
`TauCeti.HopfAlgebra.points` interface and searched the native source for the
specific enhanced and pseudocharacter carriers; no comprehensive absence
claim about the newer library is made.

| Consumer | Inspected supplier | Contract needed before completion |
| --- | --- | --- |
| LP2c.1 prescribed-projection pseudocharacters and algebraic reconstruction | Current upstream IntegralHeckeAndGaloisDeterminants README §0.7; `InvariantCoordinateInput.ring`, Suggested.lean lines 795–804 | Invariant tuple algebras for conjugation by H=J⁰ on J=H⋊Q, regular evaluation, reindexing, ordered multiplication and reconstruction up to H-conjugacy. The inspected definition quantifies over all conjugating J-points over every coefficient algebra and gives O[Jⁿ]^J. |
| LP2c.3 characteristic-zero continuity | Accepted IHG `IHG.1/reductive-valued-continuity`; upstream `IsContinuous`, `continuous_ofRepresentation`, `continuous_dense_ext`, Suggested.lean lines 948–965 | Reconstruction-to-continuity with finite Q and relatively discrete condensed coefficients, preserving locally finite-type Z_l-module bounds on compact inertia. The accepted IHG node is connected/profinite/rank-one-valued; the inspected constructor assumes representation continuity. Dense extensionality supplies uniqueness, not reconstruction continuity. |
| LP1 derived stack, LP2 categorical Hecke datum, LP3 mapping approximation, LP4 universal representation bundles | `research/blueprint/suggested/EnhancedDerivedSheaves--E5.lean`, lines 76–115 and 141–147; SF.1 and S.1 supplier requests | Genuine enhanced monoidal, stable, algebra-object and Ind interfaces, together with animated stack and Perf interfaces. The inspected E5 declarations use `True` for structure conditions, `Unit` for `CAlg` and `True` for `IndInfty`; they cannot express the required higher coherence and category-valued universal properties. |

The existing `IdentityComponentChecks` and
`IdentityComponentCoordinateChecks` remain intact. They distinguish
H-invariant and whole-J-invariant regular functions even when the component
projection is fixed: in O[G_m⋊C₂], the function (x,0) is H-invariant but is not
fixed by component switching, while the component idempotent (1,0) is fixed
by both. Adding prescribed component-idempotent equations to whole-J
invariants cannot recover the missing function. The coefficient check works
in characteristic two as well. This run inspected those proofs; their
construction belongs to the preceding checkpoints.

Independently fetched and read Quast, *Deformations of G-valued
pseudocharacters*, Definition 3.1 on printed p.11, Lemmas 3.4–3.5 on pp.12–13,
and the statement and beginning of the proof of Theorem 3.7 on pp.13–14.
The definition uses identity-component invariants and reconstruction is
unique up to identity-component conjugacy. This run does not claim to have
re-audited the theorem's auxiliary BMR/BHKT inputs or the continuity proof.
Read Fargues–Scholze Definition VIII.1.1 and Remark VIII.1.2 on pp.278–279,
and Proposition VIII.3.8 and its proof on p.290: the coefficient convention
includes finite-type Z_l-module bounds on inertia, and the bijection uses
H-conjugation on H⋊Q. No new source erratum is claimed.

The stopping condition is a specification mismatch, not an implementation
wait or the time limit. The issue explicitly permits only the package
README, suggested file, metadata and this handoff and says: **“Change no
packet; if the plan has a mistake, describe it in the handoff note.”**
PROTOCOL §§3, 13, 15 and 20 require adequate supplier statements, faithful
signatures and one owner for shared foundations. Repairing generic IHG,
E0/E5, SF.1/S.1 contracts and reconciling the LP consumer edges requires
changes outside this issue's deliverables. Current upstream roadmaps are
read-only and are never re-planned here. No ownership move was made.

Resume when owner-authorized changes actually supply the contracts above.
Check their statements, not only their merge or review status. Then complete
the signature worklist below and the target/API/test comparison. The
metadata file remains absent: `issues.deliverables_complete` checks that
all package output paths exist, so adding it now would incorrectly classify
this incomplete package as finished. Its intended content is
`topic = "math.NT"`; add it when the package is complete.

## Remaining worklist from the preceding checkpoints

The accepted LP review accepted a complete target-level planning pass with
explicit gaps. The unchanged plan has 79 nodes, 140 API items, 90 tests,
31 planets, 31 baseline declarations, eight planned stages, zero closed
stages, five gaps and sixteen requests. Its `complete` status does not
certify closure. The original reader and suggested input are unchanged.

Preserve the SR.6 boundaries already recorded in the package:

| Imported target | Upstream supplier | LP addition |
| --- | --- | --- |
| Ordinary crossed cocycles, section and gauge laws | SR.6.1 crossed-cocycles | Restriction and condensed comparisons |
| Dense finite-wild model and l-adic extension | SR.6.1 finite-wild-discretization, ell-adic-extension | Geometric degree and relatively discrete interface |
| Integral cocycle scheme | SR.6.1 finite-wild-representability | All-depth gluing, derived and condensed comparisons |
| Excursion algebra and coefficient identities | SR.6.3 excursion-algebra | Arbitrary-source extensions and enhanced operator realization |
| Universal homeomorphism and invariant comparison | SR.6.3 excursion-invariant-comparison | Enhanced colimit, cohomology and stronger base change |

Checkpoint #8322 records the actual SR.6.1–SR.6.3 source inspection; this run
did not repeat it. SR.6.2 wild strata are finite at a fixed cutoff, not across
all depths. Migrate the ordinary local prototypes to owner imports when the
LP plan is reconciled. The common invariant equalizer already uses Mathlib;
do not introduce a second construction.

Minimum missing enhanced/admissible signature inventory retained from the
previous handoff: 35 API items and 23 tests.

| Target | Required signatures and tests |
| --- | --- |
| LP0 extended wild parameters | `ExtendedWildParameter`, `WildParameterClasses`, `restrictEnhancedParameter`, `ExtendedWildParameter.forget`; `extended_wild_unramified`, `extended_wild_conjugacy`, `extended_wild_forget` |
| LP1 derived parameter stack | `DerivedParameterStack`, `.framed`, `.forgetFraming`, `.classicalPoints`, `.perfectPullback`; `derived_stack_trivial_group`, `derived_stack_free_group`, `derived_stack_gauge` |
| LP2 categorical Hecke datum | `CategoricalHeckeDatum`, `.unit`, `.reindex`, `.create`, `.annihilate`; `hecke_empty_set`, `hecke_fold`, `hecke_zero_category` |
| LP3 good-filtration t-structure | `goodFiltrationTStructure`, `.connective_iff`, `.coconnective_iff`, `.tensorConnective`, `.homotopy`; `good_torus`, `good_zero`, `good_induced`, `good_shift_sign` |
| LP3 induced perfect complexes | `InducedPerfectComplexes`, `.pullback`, `.retract`, `.moduleFunctor`, `.minimal`; `induced_point`, `induced_trivial_group`, `induced_retract`, `induced_not_all_bad_prime` |
| LP3 mapping approximation | `ParameterMappingApproximation`, `.compare`, `.finiteTorsor`, `.leftKan`, `.ind`; `approx_point`, `approx_coproduct`, `approx_bad_prime` |
| LP4 universal bundles | `UniversalRepresentationBundle`, `.unit`, `.tensor`, `.reindex`, `.act`, `.baseChange`; `rep_bundle_unit`, `rep_bundle_at_parameter`, `rep_bundle_tensor` |

Keep these mathematical requirements when recovering the signatures:

- Good-filtration connective means D^{≤0} on IndPerf. Truncations need not
  preserve Perf. Dualizable perfect complexes differ from compact objects of
  unrestricted quotient-stack derived categories in positive characteristic.
- Mapping approximation is a category-valued sifted left Kan extension.
  Its base set is finite; a total Γ-torsor need not be finite. Retain the
  bad-prime PGL_l, Γ=ℤ exclusion of the unit skyscraper.
- Universal representation bundles precede good-prime generation and do not
  inherit its prime restriction. State the coherent action and exact tensor,
  fusion and coefficient-pullback comparisons.
- Extended wild enhancements restrict admissible complex parameters; their
  restriction need not be irreducible. Retain the actual algebraic component
  denominator and embedded invariant dual centre.
- E0/E5 and SF.1/S.1 own enhanced categories, animation, descent and
  QCoh/Perf. Ordinary AlgebraicVectorBundles L0–L2 does not supply enhanced
  quotient-stack Perf. Do not replace these targets by ordinary shadows.

Other inherited plan repairs remain:

1. **G1:** register actual reductive/admissible-complex and highest-weight
   supplier extensions. Integral highest-weight theory extends
   ReductiveGroupsIntegralRepresentationsPartII via its registered parent
   ReductiveGroups Layer 9 until design stage ids exist. Neither this parent
   nor RG2.5 supplies all Jantzen/Donkin/Koppinen/TvdK inputs. Do not invent
   RG2.6 as a general GIT owner.
2. **G6:** reconcile generic IHG prerequisites still naming all LP3 with
   unconditional field invariant theory and exact regular-function inputs.
   Algebraic reconstruction must not inherit the good-prime generation
   branch. Shared Seshadri/Haboush/power-lifting inputs need a single owner
   shared with the deformation-ring direction.
3. **G2:** FS proves discretization independence for the l-torsion-free
   excursion quotient. Full torsion-sensitive independence at arbitrary bad
   primes remains an open source question, not an available theorem.
4. Complete condensed tensor, derived Weil cochain/duality, cotangent/support,
   parabolic/Levi and invariant-quotient signatures. Chapter X action and
   application targets remain with ExcursionOperatorsAndSpectralAction.
5. Retain coaction invariants, not H(R)-point invariants. Normal wild kernels
   lie in the action kernel. Geometric degree negates arithmetic degree on
   the same Weil carrier; their Tate values are q⁻¹ and q respectively.
6. Retain the earlier locator corrections: FS VIII.5.18, p.308, uses the
   prime-to-characteristic order of the acting group P; Lafforgue Proposition
   10.8 is on pp.138–139. These are inherited readings, not freshly verified
   source findings in this run. LP2c.1's README already uses FS
   VIII.3.7–VIII.3.8, pp.288–290.
7. After supplier/plan repair, finish every target/API/test comparison, add
   metadata, run lean-check and scoped intake checks, and submit the package.

## Verification and receipts

- LP and IHG `check_blueprint.py`: both exit 0, zero errors and warnings.
  Neither packet was changed.
- `lean-check research/blueprint/packages/LanglandsParameterStacks/Suggested.lean`:
  exit 0, zero errors, 291 warnings, all `declaration uses sorry`, no other
  warnings. Memory before compilation: 108 GB available. This validates the
  signatures present, not the missing enhanced/admissible signatures.
- Exact extracted regression check: exit 0, no errors or warnings; the four
  axiom diagnostics above contain no `sorryAx`. Memory: 105 GB available.
- Scoped intake `check-files`: three authorized files, zero problems.
  `git diff --check`: passed.
- Compilation used the managed atlas build advertised at Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The prepared Tau Ceti build has
  no `.git`; its advertised pin is not a new source-tree git receipt.
- New source fetches on 2026-10-10:
  [Quast author PDF](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf),
  SHA-256 `67eb82118e49df3f7da6c1e211ad9961fc7323fc4d09d0559bcbc2434eead827`;
  [FS author PDF](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
  SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
  Both match the existing plan. No private book was used.
- Inherited BHKT receipt from #8311, not re-fetched here:
  [Acta PDF](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf),
  SHA-256 `15c4b9668e335f75225215bb367c1051769990595232f8015f441d2e2c86ba2c`.
- Unchanged LP packet SHA-256:
  `e3554e4ad95f573e992965939391157a755455b65305fd34508538b52e7b8087`.
- Unchanged IHG packet SHA-256:
  `1d06c30103ac2c17a0c2964e2c7721d66c5e939b6b9898f7441d9abdf01a782b`.
- Unchanged E5 suggested input SHA-256:
  `e8119768303f20e9952f0576d1ea163903060e1bfccfd4b9fe97528a32f8ac7c`.
- README: 190005 bytes, SHA-256
  `ceb36494a6fe337cb48864709601906287d0d2c6f23758bc6fdaf7043f6dc6a3`.
- Suggested file: 120143 bytes, SHA-256
  `405fc32238436643e5590a9f0d0766127c1b8952e65c00908c3d94477d86ebdd`.

Only the two package artifacts and this handoff changed. All information
needed for resumption is above; no scratch file is required. No owner file
or read-only tree was edited, no Lake build/update/cache command or language
server ran, and all lean-check processes finished.
