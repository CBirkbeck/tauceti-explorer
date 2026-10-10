# REV-PKG-ArithmeticLocallySymmetricSpaces — completed review

Issue #7915. Reviewer: Codex (GPT-6), session `codex-jDhOOy`, 2026-10-10.
The package author was `codex-4S61wT`; this reviewer did none of that job.

Final verdict: **needs_changes**. All six requested checks and all 66 targets
were reviewed. The review job is complete, rather than a checkpoint. The
package is not accepted. See the report for the complete target table,
source checks and findings F1–F4, and `review.json` for the recorded verdict.

## Completed work

- Audited the unchanged accepted packet, the full package README and actual
  Lean declarations, including every target/API/test label and the 238
  unstated comment entries.
- Corrected three LieGroups paths, a self-prerequisite and duplicate
  prerequisites/references; expanded the boundary-stratum hypothesis line;
  fixed the NT pullback and Scholze pinpoint locators and version conventions.
- Made the Hecke invariants object's carrier the actual invariant submodule
  in `ModuleCat` and its functor maps the restricted intertwiners. The explicit
  local integer-module instances agree with bundled `Rep` instances. Laws and
  convolution linearity remain `sorry`, as appropriate for suggested forms.
- Marked the GL₁ symmetric-space specialization as an adapter test. The other
  partial adapter labels remain honest about their scope.
- Checked current upstream/library owners read-only and added native
  ordinary/twisted/relative cochain reuse with the correct coefficient variance.
- Read the source-critical passages directly. The report records locators,
  versions, public PDF hashes and the limits of those checks. No source
  passages, cleared source files or extracted cleared text were added.

## Checks

- `lean-check research/blueprint/packages/ArithmeticLocallySymmetricSpaces/Suggested.lean`:
  exit 0; 63 warnings, all `declaration uses sorry`; no errors or other warnings.
  Only a test-label comment changed in Lean after that successful check.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json`:
  0 errors and 0 warnings. Counts: 66 nodes, 132 APIs, 88 tests, eight planned
  stages, zero closed stages. These counts do not certify package completion.
- README: 181,646 bytes; all 66 target anchors, 132 API names and 88 test names
  present; local links resolve; each of the 22 definition/construction targets
  has four named mathematical tests; no programme-process markers.
- Intake changed-file checks, JSON/metadata validation and `git diff --check`
  pass. The accepted packet and all other jobs' files were left unchanged.

## Where the package revision must resume

Start with the typed AA.1–AA.4 arithmetic datum and the real algebraic
Cartan/split-centre comparison. An arbitrary `Datum` action space does not
state those hypotheses. Keep LieGroups Layer 9 as the existing owner; retain
the algebraic compact-twisted-real-form condition, central correction and
component conventions.

Next construct the actual arithmetic associated linear system/sheaf,
supported equivariant complexes, normal-refinement comparisons and coherent
restriction/corestriction, using the whole-inverse loop convention. Then
replace the 114 API, 80 full-test and 44 theorem omissions with the exact
typed contracts. The 18 labelled API forms and eight labelled tests are
partial forms, not evidence that the remaining arithmetic specialization is
complete. Retain the distinctions between a ring action in an endomorphism
ring and a strict equivariant derived object.

AF.1a remains the absolute E-linear Lie-cochain/Kostant supplier; ALS.4 owns
the arithmetic lattice comparison. Preserve transported parabolic levels,
the coefficient direct-summand requirement, totally real GL_N scope for the
Harder–Raghuram specialization, and an E₂ statement for general reductive
groups without an extra splitting theorem. Keep early orientation-sensitive
duality, supported boundary gluing, non-neat averaging/base-change conditions
and the dual-orientation Galois-type hypothesis.

## Current native material to reuse

Reviewed current TauCetiRoadmap commit
`dea8191cc6047d6142a65872ebce6eeeb841a29b` and current Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The pinned build uses Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Current Tau Ceti already exports `TopCat.singularCochainComplex`,
`TauCeti.LocalCoefficientSystem.twistedCochainComplex`,
`TopPair.twistedCochainComplex`, their coefficient/space maps and the relative
exact sequence with `TopPair.twistedCohomologyδ`. The twisted cochain files
postdate the pin. They apply `Hom(-, M)` to twisted chains, so identify the
arithmetic coefficient system with the right variance; do not import
unavailable modules into a pinned check or duplicate this existing theory.

Reuse native local-coefficient/monodromy and relative-chain APIs. Type-valued
covering monodromy is not linear arithmetic sheaf descent. DG Layer 8's real
constant-coefficient de Rham comparison needs the arithmetic flat-bundle and
support extension. The native orientation groupoid does not by itself provide
the arithmetic orientation sheaf or Verdier comparison. IHG.2/3a/3b remain
the derived-image/localization and Galois-predicate owners.

## Preserve the required downward ownership moves

1. AC.3 → ALS.2 only for compact arithmetic nilmanifold fibres and their
   transported-level fibration, from AA.3 unipotent reduction. Filtered and
   additive-combinatorial generalizations stay with AC.3.
2. AS.5 → ALS.5 for Franke comparison and cuspidal support. Supply the
   moderate-growth/weighted and spectral construction chain behind Franke
   §7.4, Theorem 18, pp.255–256. AF.1a/AF.3 are inputs, not that proof.
3. AG2.2–AG2.4 → ALS.5 supporting characteristic-zero GL/unitary comparisons,
   with the exact ACC+ Theorems 2.3.2–2.3.3 systems, pp.935–937, their classical
   parameter/local inputs, Hecke normalization and residual constituent map.
   The unitary residual target retains Theorem 2.3.8's p.939 S-condition.

These moves still need complete permitted lower-tier chains and higher
consumers pointed at the new owners in an authorized follow-up. Do not restore
upward citations or replace a characteristic-zero system by a torsion
attachment. Finite-level descent remains distinct from completed towers and
continuous profinite comparisons.

All durable evidence and restart instructions are in this note and the
report. No scratch artifact is needed by the next worker. The review PR is
the sole submission for this session; no second job was claimed.
