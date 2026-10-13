# Handoff: PKG-AutomorphicBundles~2 — issue #7890

Codex, session `codex-vaCTOP`, 11 October 2026. Branch
`codex-vaCTOP-automorphic-bundles`. The bot confirmed the claim in
[comment 6106051616](https://github.com/CBirkbeck/tauceti-explorer/issues/7890#issuecomment-6106051616),
responding to claim comment 6106050615. This run took one job only.

**Blocked checkpoint; the package is not complete.** The independent review's
missing geometric-signature defect remains. The accepted plan explicitly
requires a separately assigned torsor-associated-bundle supplier, and the
assembly requires integral B2–B4 planning changes. Those changes belong to
files this package issue may not edit. The current upstream roadmaps and
library still do not supply the missing associated-coefficient functor.

## Changes and provenance

The earlier draft [#8163](https://github.com/CBirkbeck/tauceti-explorer/pull/8163),
by Codex session `codex-SeMZZW`, was open and unmerged when this run began.
Its README and Suggested.lean repairs are carried forward here, with their
provenance retained in this note. Its old handoff is replaced by this current
continuation note. These carried-forward repairs are:

- A concrete holomorphic `AutomorphyFactor` on a finite-dimensional complex
  manifold and coefficient space, distinct from `FunctionalAutomorphyFactor`.
  Its holomorphy field uses `MDifferentiable`, and the seven planned factor
  APIs retain the shifted cocycle and the holomorphic action/frame conditions.
  Inverse-factor holomorphy and the slash-action preservation signatures are
  retained. Examples include noncommuting shears, a shifted exponential frame
  and rejection of the conjugate-exponential functional frame.
- The three previously disabled Tau Ceti imports and their `#check`s, now
  available in the shared pinned build.
- Explicit reuse of upstream AlgebraicVectorBundles for finite locally free
  sheaves, tensor/dual and polynomial operations, relative Spec and geometric
  total spaces. Automorphic representation comparisons remain additional
  structure on those existing categories.

This run adds the following independently checked work in
`AutomorphicBundles.FJCoefficient.SchemeChart`:

1. `sheafFunctor` is an actual composite of `tilde.functor R`,
   `Scheme.Modules.pullback p`, and Tau Ceti's existing sheaf tensor functor.
   For a supplied scheme map p:C→Spec R and degree/boundary sheaf E, its value
   is E⊗p* M̃ for an arbitrary R-module M. It imposes no flatness, finite
   generation or projectivity on M and takes sections after tensoring.
2. `coefficientMap` takes an actual coefficient-module morphism M→N, rather
   than requiring a preconstructed sheaf morphism. `family` is the unrestricted
   degree-indexed product of these section modules. `familyMap` applies
   coefficient change componentwise. Identity, composition and evaluation
   laws are active signatures with proofs from the existing functors.
3. `affineLineSheafIso` and `affineLineSectionsIso` are constructed from
   identity pullback, the tensor unit and `tilde.isoTop`. They identify the
   trivial-line affine coefficient with M̃ and its sections with M. Naturality
   is stated as an admitted theorem on the actual functor maps.
4. Four examples test a nonzero section killed by 2 for M=ℤ/2, vanishing for
   the zero module, reduction ℤ→ℤ/2 on the entire coefficient family, and an
   infinite family whose every component is one. The zero-module example is
   proved using the constructed affine isomorphism; the other three are
   checked signatures with admitted proofs.
5. The original `FJCoefficient.map` now extracts the actual linear map from
   `φ.val.app`; its identity and composition laws are proved by definitional
   equality. There is no replacement linearity assumption.

These are scheme-chart helpers, not the full planned cusp construction.
E still needs identification with the actual boundary coefficient sheaf.
The product is formed before full-stabilizer invariants; there is no invented
stack atlas, descent equalizer, cusp transport or Fourier–Jacobi expansion.
The README states both the scheme construction and this geometric boundary.
The new helpers do not count as previously missing target APIs.

## Blocker, ownership and current upstream check

The first gap of `packets/AutomorphicBundles--B0.json` is
“Generic algebraic associated-bundle interface has no nominated stage.”
It nominates the ReductiveGroupsPartII direction for principal algebraic
G-torsors, contracted products, associated finite locally free coefficients,
descent, pullback and exact tensor/dual coherence. It explicitly requires an
assigned extension stage, rather than another construction here.

Its consumers begin with B0's compact-dual coefficient, homogeneous Hodge
torsor, analytic coefficient, equivariant-section and analytification
comparison targets. B1's tensor-frame torsor and B2/B2.general's associated
coefficient and tensor-Hecke constructions also depend on it. This is an
earlier obstruction than the global expansions or logarithmic comparisons.

The current upstream roadmap checkout inspected was at
`070dc2becd74419e76303ede84b465ed4a69461f`. For upstream form, this run read
the AlgebraicVectorBundles and HodgeStructures READMEs in full. It inspected
the current AlgebraicVectorBundles Suggested.lean and ReductiveGroupsPartII
stage declarations for the relevant suppliers. AlgebraicVectorBundles already
plans the finite locally free sheaf and geometric bundle categories and their
operations. ReductiveGroupsPartII's RG2.0–RG2.5 stages cover rational-point
topologies, Weil restriction, roots, buildings, integral models, local
decompositions and dual data. Neither supplies the required arbitrary
principal-torsor associated-representation functor.

The current Tau Ceti checkout inspected was at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Its homogeneous fppf quotient
torsor file supplies the following useful existing declarations, whose
statements were read:

- `CommHopfAlgCat.fppfHomogeneousQuotientSheafProjection`;
- `CommHopfAlgCat.isLocallySurjective_fppfHomogeneousQuotientSheafProjection`;
- `CommHopfAlgCat.isPullback_fppfHomogeneousQuotientTorsor`.

They construct a quotient projection and its torsor square in fppf sheaves
for an affine Hopf-algebra group and a closed subgroup. They do not construct
the representable associated vector bundle of an arbitrary principal torsor,
its exact tensor functor or analytification comparison. The current vector
bundle files are also existing work; they are not re-planned here. Searches
for principal/associated bundle and contracted-product constructors found
no replacement for the specific missing interface. This finding agrees with
the accepted plan and the independent package review, rather than inferring
absence from a failed import alone.

The assembly's separate integral residuals also remain:

| Residual | Required interface and owner |
|---|---|
| R1 | B4: arbitrary-module integral canonical/subcanonical section functors, coefficient maps and qcqs colimits |
| R2 | B3: coefficient-sensitive fan and Hecke comparison with the reduced boundary |
| R5 | B2/B3: finite-projective integral Levi coefficients and their actual boundary bundles and Hecke cocycles |
| R6 | B2/B4 with H2/C6: ramified Hilbert coefficient lines for general integer pairs over Noetherian coefficient algebras |

The new scheme-chart helper does not close R1: its scheme and sheaf are
supplied, without their identification with the canonical integral models.
The assembly handoff already identifies nine B5 consumers and the required
packet edits. Those packets, the assembly, the independent review and all
upstream files are unchanged here.

## Validation and exact limits

Source reading for the new helper used Lan's 14 March 2021 revised
*Arithmetic Compactifications of PEL-Type Shimura Varieties*, Definition
7.1.1.1 and Remark 7.1.1.3, p.532; Lemma 7.1.1.4, pp.532–533; and
7.1.2.1–7.1.2.7, pp.534–537, especially (7.1.2.3), p.535. The arbitrary
module belongs inside the coefficient sheaf, and the full target is a product
with stabilizer invariants. Source SHA-256:
`a7a454f5d0735f4bf11f00a8afc14c361c5fc2cefd691d7466f7620ab4c3a079`.
All added roadmap prose is in our own words. No book or source passage was
copied into the repository. The current library index clears Faltings–Chai;
older handoffs saying otherwise are obsolete. This run did not use that book
to certify a BGG/logarithmic comparison.

Pinned declarations were read before use. The shared source files of all
three restored imports, plus the sheaf tensor functor dependency used by the
new helper, match their git objects at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` byte for byte. The Mathlib build
is at `082e2d37e8b0463410cdb532e111cd43d5a66174`.

Final command:

```text
lean-check research/blueprint/packages/AutomorphicBundles/Suggested.lean
```

Exit 0; no errors; 77 warnings, all `declaration uses sorry`. All three
Tau Ceti imports and their checks are active. Available memory exceeded
20 GB before every run; this worker ran one check at a time. No language
server, library build, update or cache download was started. Elaboration
checks types and does not prove admitted theorems or elaborate comments.

Both unchanged packets pass `scripts/check_blueprint.py` with 0 errors and
0 warnings. README name checks find all 154 original API specifications and
all 102 original test specifications after normalizing the root namespace.
The README is 170,183 bytes, below the 200 KB cap. Metadata remains exactly
`topic = "math.NT"` with a terminal newline. Intake file checks and
`git diff --check` pass.

The census removes nested block and line comments and respects namespaces:

| Input | Planned API names | Active planned names | Missing active declarations |
|---|---:|---:|---:|
| B0–B4 | 128 | 22 | 106 |
| B5 | 26 | 3 | 23 |
| Total | 154 | 25 | 129 |

Name presence is weaker than agreement with the required geometric carrier.
`classicalForms` still acts on a supplied scheme and coefficient. The original
three FJCoefficient APIs remain supplied-sheaf interfaces; the new module-change
helper handles the scheme-chart specialization only. Canonical extensions,
geometric Hecke operators, global expansions and the cohomological Siegel
comparisons still require actual geometric signatures.

## Submission and where to resume

Submit this as a **draft checkpoint**. The package completeness predicate
in `issues.deliverables_complete` checks output existence for this job;
the required files therefore exist even though geometric closure fails.
WORKERS.md leaves drafts to the maintainer. Keeping this PR draft prevents
automatic intake from treating this blocked revision as a complete package.
The existing `review.json` remains `needs_changes` for the next independent
reviewer. No review verdict is changed by this worker.

First assign and plan the generic associated-bundle extension in its owner,
using AlgebraicVectorBundles and the existing fppf quotient results, and
record its exact supplier stage in the accepted plan. Resolve the integral
B2–B4 residuals in a job authorized to edit their packets, following
`handoff/ASM-AutomorphicBundles.md`. Then replace the geometric comment
inventory with actual constructors, named APIs and discriminating tests on
those carriers. Preserve the holomorphic/functional distinction and the
scheme-chart module-change helper. Check every active signature against the
README and run the full pinned elaboration again. The maintainer must handle
this blocked draft and its continuation explicitly; do not mark the package
complete based on file existence. No scratch artifact is needed to resume.
