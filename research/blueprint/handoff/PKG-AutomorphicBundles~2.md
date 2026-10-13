# Handoff: PKG-AutomorphicBundles~2 — issue #7890

Codex, session `codex-SeMZZW`, 10 October 2026. Branch
`codex-SeMZZW-automorphic-bundles`. The bot confirmed the claim in
[comment 6092121367](https://github.com/CBirkbeck/tauceti-explorer/issues/7890#issuecomment-6092121367).

**Blocked checkpoint. This revision is not a completed package.** The independent
review's geometric-signature defect remains. The earliest supplier is explicitly
unassigned in an accepted input packet; assigning its stage and repairing the
integral plan require files outside this job's permitted outputs. No second job
was claimed, and no packet, assembly, review, atlas file or upstream file was edited.

## Completed repairs

1. `Suggested.lean` now uses the name `AutomorphyFactor` for a genuinely
   holomorphic factor. Its base is a finite-dimensional complex manifold; its
   coefficient is a finite-dimensional complex normed vector space. For each
   weight, group element and vector, complex-manifold differentiability of the
   coefficient evaluation is a concrete `MDifferentiable` field. Normalization
   and the shifted cocycle remain concrete linear-equivalence equations.
2. The seven planned `AutomorphyFactor_*` APIs are active signatures on that
   carrier. Gauge change requires holomorphy of the base action and frame;
   forgetting returns `FunctionalAutomorphyFactor`. The earlier semiring/module
   functional definition and its tests remain under that distinct name.
   Additional signatures express compatibility of forgetting with gauge change,
   holomorphy of inverse coefficients, and preservation of holomorphic functions
   by the existing inverse-factor `SlashAction` adapter.
3. Five examples check the holomorphic definition: the identity factor, frame
   change, two noncommuting complex shears, the base-point shift for an
   exponential frame under the sign action, and rejection of the frame
   `u(z)v = exp(conj(z))v`. The last frame gives a normalized functional cocycle
   whose coefficient at the sign element is `exp(-2 conj(z))`, which fails
   complex differentiability. Removing holomorphy changes the non-example.
   The rational shear tests still test the functional forgetting.
4. Restored the three Tau Ceti imports and their three `#check`s. The shared
   `lean-check` build now supplies their compiled objects. The imported source
   files were compared byte-for-byte with their git objects at the Tau Ceti pin;
   all three match. The obsolete explanation that their objects are unavailable
   was removed.
5. README statements, hypotheses, APIs and tests now agree with the holomorphic
   carrier. The scope and supplier contracts explicitly import the current
   upstream AlgebraicVectorBundles categories and operations: finite locally
   free sheaves, tensor/dual and polynomial operations, relative Spec and
   geometric total spaces. Those foundations are not re-planned here.

`metadata.toml` retains exactly `topic = "math.NT"`. The submission workflow
rejected an initial attempt to withhold it because submissions may not delete
deliverables. That deletion has been reversed. `issues.deliverables_complete`
uses output existence for package jobs, without inspecting geometric closure;
with the inherited package outputs and this required handoff present, its result
is true even though this job is incomplete. Therefore the PR is a **draft
checkpoint**, the route WORKERS.md leaves to the maintainer. Do not send it
through automatic complete-package intake. The maintainer must handle the
checkpoint and continuation explicitly, or retain the draft until the owning
planning work supplies the missing carriers. The existing `review.json` remains
unchanged with its `needs_changes` verdict.

## Earliest blocker and current upstream evidence

The first gap in `packets/AutomorphicBundles--B0.json` requires a separately
assigned stage for algebraic principal torsors, contracted products,
G-equivariant associated bundles, descent, pullback and exact tensor/dual
coherence. It nominates the reductive-group direction and expressly requires an
extension stage rather than a private replacement in AutomorphicBundles.
The current ReductiveGroupsPartII RG2.0–RG2.5 layers do not assign that interface.
The gap lists the compact-dual coefficient, homogeneous Hodge torsor, analytic
coefficient, equivariant sections and coefficient comparisons in B0, the tensor
frame torsor in B1, and associated coefficients/tensor-Hecke constructions in
B2 and B2.general as consumers.

The current upstream AlgebraicVectorBundles README and Suggested file provide
`FiniteLocallyFreeSheaf`, tensor/dual and polynomial operations, `relativeSpecEquiv`,
`GeometricVectorBundle`, `totalSpaceEquiv` and the universal property of total
spaces. They do not provide the missing torsor-associated representation functor.
Both its README and the current ReductiveGroups README were read in full for
upstream form and ownership. The upstream roadmap checkout examined was at
`d6f707516e7ede3181dac4b2420ba25c0799d22d`.

The current Tau Ceti checkout examined was at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Its
`TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Torsor.lean`
already provides a homogeneous-quotient sheaf projection, local surjectivity
and a torsor kernel-pair square:

- `CommHopfAlgCat.fppfHomogeneousQuotientSheafProjection`;
- `CommHopfAlgCat.isLocallySurjective_fppfHomogeneousQuotientSheafProjection`;
- `CommHopfAlgCat.isPullback_fppfHomogeneousQuotientTorsor`.

These are sheaf statements for an affine group and closed subgroup. Their types
do not construct a representable associated vector bundle for an arbitrary
principal torsor, its representation-valued exact tensor functor, or the
analytification comparison. They are useful supplier inputs; do not duplicate
or describe them as absent. They were read in the current checkout, not added
to the pinned import block. The topological `BalancedProduct` covering-space
interface requires discrete fibre and is not a substitute for these algebraic
and analytic vector-bundle constructions. Likewise QCoh descent alone does not
identify a supplied scheme/sheaf with the required Shimura coefficient.

This prevents active signatures for `compactDualCoefficient_map` and subsequent
geometric constructors on their actual supplier carriers. Giving arbitrary
`Type` parameters, opaque propositions or the desired theorem as a premise
would reproduce the defect the independent review rejected. The accepted
packet cannot be repaired by this package issue.

## Further unresolved work

The assembly handoff `handoff/ASM-AutomorphicBundles.md` already records the
B2–B4 plan changes needed for nine B5 consumers:

| Residual | Required owner/interface |
|---|---|
| R1 | B4: integral canonical/subcanonical section functors with arbitrary modules inside the sheaf, functoriality and qcqs colimits |
| R2 | B3: coefficient-sensitive fan and Hecke comparison, including reduced-boundary transport |
| R5 | B2/B3: finite-projective integral Levi coefficients, canonical/subcanonical extension, Hecke cocycle and boundary bundle |
| R6 | B2/B4 with H2/C6: ramified Hilbert coefficient lines for general integer pairs over Noetherian coefficient algebras |

Retain that handoff's proposed packet patch and its distinction between an
answered field interface and an integral residual. The 24 accepted-packet gaps
and 50 requests remain prerequisites. This checkpoint neither resolves nor
withdraws their target-level acceptance.

The post-edit active-declaration census, with nested block and line comments
removed, is still:

| Input | Planned API names | Active names | No active declaration |
|---|---:|---:|---:|
| B0–B4 | 128 | 22 | 106 |
| B5 | 26 | 3 | 23 |
| Total | 154 | 25 | 129 |

The holomorphic repair strengthens existing active names; it does not inflate
coverage by moving the inventory into dummy declarations. In particular
`classicalForms` still means sections of a supplied coefficient on a supplied
scheme. The three active `FJCoefficient` APIs still act on supplied coefficient
sheaves. Canonical extensions, geometric Hecke operators, global expansions
and the cohomological Siegel comparisons still lack their geometric signatures.
Integer weight calculations and algebraic diagram chases do not supply those
constructions.

## Source discipline and validation

Source checks for this repair used Lan's example-based introduction,
§4.2.7 pp.49–50, for holomorphic factors and boundary conditions, and Milne's
corrected canonical-model notes, III §2 Remark 2.3(a) pp.54–56, for the algebraic
associated-coefficient contract. Statements and examples are in our own words.
This run does not claim a fresh proof-closure review of all 96 targets.

The current maintainer library index **does clear Faltings–Chai**. The older
package and review handoffs' clearance statement is therefore obsolete.
No book file or passage was copied, and this run did not attempt to close the
BGG/logarithmic comparison proof by reading that book.

Validation of the final Lean file:

```text
lean-check research/blueprint/packages/AutomorphicBundles/Suggested.lean
```

Exit 0; no errors; exactly 76 warnings, all `declaration uses sorry`. The check
includes all three restored Tau Ceti imports and checks. The shared build is
at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Available memory exceeded 100 GB
before the final check. One compilation ran at a time. No server, library build,
update or cache download was started, and no compilation remains running.
Elaboration checks signatures; it proves no admitted theorem and does not
elaborate the final geometric comment inventory.

Both unchanged input packets pass `scripts/check_blueprint.py` with 0 errors
and 0 warnings. Intake file checks and `git diff --check` pass. The README
remains below 200 KB and retains all 96 target names and 154 planned API names.

## Where to resume

First obtain a planning assignment for the generic torsor-associated-bundle
extension and record its exact supplier stage in the accepted plan, importing
AlgebraicVectorBundles and current fppf quotient interfaces. Also resolve the
assembly's B2–B4 integral residuals in a job authorized to edit those packets.
Then replace the geometric comment inventory with constructors, named API
signatures and discriminating tests on the resulting carriers. Preserve the
concrete holomorphic factor and its functional forgetting. Reconcile all
remaining declarations with the README and re-run the full pinned elaboration.
Keep the independent review file for its next reviewer. The maintainer must
handle this draft as a checkpoint, and it must remain a draft until the package
can safely enter complete-package intake. All resumption information is committed here;
no scratch file is needed by a later worker.
