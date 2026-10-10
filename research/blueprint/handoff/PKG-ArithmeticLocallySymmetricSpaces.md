# PKG-ArithmeticLocallySymmetricSpaces — checkpoint

Agent: Codex, session `codex-4S61wT`. Issue: #7888.

## Summary

Prepared the package's README, metadata and a compiling suggested file. The
README retains all 66 accepted targets, 132 API items and 88 mathematical tests,
at less than 200 KB, without programme history. It uses current upstream owners
and records the mathematical content needed to remove upward dependencies.
The suggested adapters elaborate at the shared pinned build with only `sorry`
warnings. This is a **blocked checkpoint**, not a complete package: the accepted
input explicitly lacks 114 API signatures, 80 full executable tests and 44
theorem signatures, as well as the supplier interfaces needed to state them.
The named catalogue preserves all 238 obligations honestly. Neither compilation
nor target-name coverage establishes that those obligations have been met.
The immutable accepted inputs and all other jobs' files were left untouched.

## Blocking condition and scope

PROTOCOL §13 requires every specified API and test to appear as a Lean
signature or `example`, while forbidding empty substitutes for unstated
conditions. §20 requires that coverage in the complete package. The accepted
suggested file already records the omissions explicitly, and the accepted
packet has 16 gaps and 19 supplier requests. Its `complete` status denotes an
accepted planning pass, not supplied typed interfaces or proof closure.

The first missing interfaces are the arithmetic real-point/Cartan/split-centre
datum, the supported linear equivariant sheaves and their derived functors,
and the geometric associated local-system construction. The later missing
interfaces depend on these: they cannot be remedied by wrapping arbitrary
spaces, graded modules or ring actions and giving the wrappers the target names.
In particular, the arithmetic Hecke action and duality require actual supported
complexes and their comparisons, rather than unrelated complexes assumed as
parameters. AA's existing Cartan prototype does provide matrix-real-point
data, but does not discharge the accepted general twisted-real-form predicate
and the reductive/disconnected horospherical extension. AF.1a's relative
complex does not discharge the requested absolute E-linear cochains and
algebraic Levi-equivariant Kostant modules.

Completing those supplier exports requires work in the supplier owners; this
issue authorizes only the three package files and this note. Replanning the
existing upstream theories here would violate WORKERS and PROTOCOL §15.
Consequently the package cannot be honestly certified complete in this scope.
Resolve or authorize the supplier interfaces before replacing the catalogue.

## What changed

- README: upstream-style purpose, boundaries, conventions, library vocabulary,
  all eight mathematical layers and every accepted target/API/test, with sources
  and prerequisites. The accepted packet is the mathematical source of truth;
  the older reader still has the source and coefficient inaccuracies identified
  in its latest review, so those passages were not used as specifications.
- Suggested: reused the existing individual imports and substantive adapters.
  Corrected import placement, the upper-half-plane topology import, matrix-index
  and coefficient universes, `Rep`/`ModuleCat` universe agreement, invariants
  module instances, the reserved monodromy binder, and finite-field matrix
  constructors. The invariants-object adapter now accepts a bundled `Rep`,
  avoiding a conflicting implicit integer-module instance. Construction proofs
  remain `sorry`, as required for suggested forms.
- Replaced the repeated mathematical prose in the suggested-file catalogue by
  the same 238 unstated names and their required earlier interfaces; the README
  carries the full mathematical specification. Comments are not counted as
  declarations or executable tests. No `True` theorem, opaque `Prop` field or
  `def ... : Prop := sorry` was introduced.
- Metadata: `topic = "math.NT"`.

## Current upstream and library reuse

Read AlgebraicTopology and DifferentialGeometry in full at current
TauCetiRoadmap main (`d6f707516e7ede3181dac4b2420ba25c0799d22d`). Inspected the
relevant AdelicAlgebraicGroups, LieGroups and
IntegralHeckeAndGaloisDeterminants targets and prototypes. Read current Tau Ceti
sources and the actual baseline declaration statements. The shared build's
cited Tau Ceti source modules were byte-compared with commit
`f790474821cf4256814db967cb154e7af3d0c369`; they agree. Mathlib's source checkout
is `082e2d37e8b0463410cdb532e111cd43d5a66174`.

Reuse the current local-coefficient/monodromy and relative-singular APIs;
do not repeat the older audit's absence claims. DG Layer 8 supplies real
constant-coefficient de Rham comparison, not the arithmetic flat-bundle and
support comparison automatically. IHG.2 owns the general finite derived image,
ghosts, local factors and localization. IHG.3a–3b already own Hecke polynomials
and residual Galois-type/non-Eisenstein predicates. The corresponding ALS
targets are arithmetic applications and adapters.

## Downward ownership changes requiring follow-through

These changes remove disallowed citations from the package, but do not claim
that a complete replacement proof graph or Lean prototype has been provided.
The following exact inputs still need closure, and their higher consumers
must be pointed at the new owner by an authorized follow-up.

1. **AdditiveCombinatorics AC.3 → ALS.2:** only the arithmetic compact
   nilmanifold `Γ_N\N(ℝ)` and its transported-level fibration. Use AA.3's
   unipotent arithmetic compactness, not the separate filtered-nilmanifold
   theory. ALS.4 retains the lattice Nomizu comparison.
2. **AutomorphicSpectralTheory AS.5 → ALS.5:** the Franke quasi-isomorphism
   and cuspidal-support decomposition used in automorphic-comparison and
   cuspidal-cohomology. AF.1a/AF.3 remain the same-bundle cochain and coefficient
   owners. The analytic moderate-growth/weighted-complex construction and
   its supporting theorem graph are still missing, not established merely by
   replacing an owner name. Franke §7.4, Theorem 18 is on pp.255–256.
3. **AG2.2/AG2.3/AG2.4 → ALS.5 supporting comparison:** the GL and degree-2m
   unitary characteristic-zero Galois systems needed to exclude proper cuspidal
   supports, their Hecke-polynomial/modulus normalization and the residual
   constituent comparison. The supporting subsection specifies these outputs,
   based on ACC+ Theorems 2.3.2–2.3.3, pp.935–937. Its classical parameter,
   base-change, p-adic and local comparison inputs still need a permitted
   lower-tier proof chain. A torsion Galois attachment cannot replace them.
   The unitary middle-degree target now spells out the condition on S from
   ACC+ Theorem 2.3.8, p.939.

There is no completed-cohomology prerequisite in the accepted finite-level
targets; none was added. The GL_n boundary theorem retains the ordinary and
orientation-compatible Galois-type assumptions. It does not assert the general
real-place boundary theorem from the ordinary assumption alone.

## Source checks and limitations

Read the cleared ACC+ author copy at the specified theorem pages directly;
no copy or extracted passage was saved. Checked public source copies for
Franke's comparison, Sella's main theorem, the NT discrete derived/composite
comparison and correspondence formula, and the relevant CG/CN locators.
Added published NT page numbers: Lemmas 2.3, 2.4, 2.7, Proposition 2.18 and
Lemma 2.19 occur on pp.12–17 and 24; Proposition 3.4 is on pp.44–45.
The Borel–Serre page ranges were checked against the public archive's contents
page. Versioned arXiv page locators are labelled as such.

The sources do not by themselves close all extensions: Sella's p.2 theorem is
constant-coefficient cohomology, not the entire supported derived local-system
comparison. Harder–Raghuram v2 gives the totally real GL_N specialization;
the general reductive target remains an E₂ sequence without an asserted
canonical splitting. The accepted source issues and exact hypotheses remain
essential. The Scholze locator still uses its numbered arXiv/published
corollary without a pinpoint page; tighten it in the final pass.

## Checks and restart instructions

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json`:
  0 errors, 0 warnings; 66 nodes, 132 API items, 88 tests, 8 planned stages,
  0 closed stages. This validates the immutable input, not package readiness.
- `lean-check research/blueprint/packages/ArithmeticLocallySymmetricSpaces/Suggested.lean`:
  exit 0; 64 warnings, all `declaration uses sorry`; no errors or other warnings.
  Both the final reduced catalogue and corrected adapters were elaborated.
- README coverage check: every target anchor, every API name and every test name
  is present; all internal links resolve. README is 181,312 bytes; Suggested is
  68,577 bytes. Scan found no upward dependency names or workflow history in
  the README. `git diff --check` passes.

Resume at the first arithmetic supplier interface in the suggested catalogue,
not by adding more assumed-complex adapters. Keep the corrected conventions
and compiled code. Supply the supported equivariant model and AF.1a absolute
cochains, then replace the 114 API, 80 test and 44 theorem omissions with their
exact forms. Close the three ownership moves above and audit every remaining
dependency against actual lower-tier package exports. Only after that work,
source precision and a final Lean check can this become a complete package.
