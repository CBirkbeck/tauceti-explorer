# Independent package review: Hilbert modular varieties and Shimura curves

Verdict: **needs_changes**. Completed by Codex (GPT-6), session
`codex-DzeQVX`, on 2026-10-10, for #7934. The package author was the separate
session `codex-lD9kHU`; this reviewer did none of the package job.

The README contains all 133 accepted targets and has a usable construction
order. The typed portion of `Suggested.lean` elaborates. Nevertheless, most
geometric definitions, APIs and tests remain prose inside one Lean block
comment. That is a concrete omission under PROTOCOL §§13 and 20, and prevents
acceptance of checklist item 5. This is a completed review, not a checkpoint.

## Checklist

| Item | Result | Evidence |
| --- | --- | --- |
| 1. Upstream form | Pass | The README is 193,639 bytes, below 200 KB. It has scope, conventions, layers, target statements, prerequisites, APIs, tests and numbered source locators. ClassFieldTheory and ModularCurves provide the upstream comparisons. |
| 2. Plan fidelity | Target coverage passes; mathematical qualifications retained | All 75 H0-part and 58 R18.2-part targets occur once. All 206 API entries and 157 test entries are present in the README. All 52 definition/construction targets have at least three tests. Local prerequisite links resolve and point backward. The finite-component field convention was clarified as described below. |
| 3. Own words and sources | Pass | No copied source passage or source-by-source synopsis was found. Target citations include section/theorem and page locators. Direct checks covered the newly owned Hodge, cusp and quaternionic-transfer scopes, and the connected PEL comparison. |
| 4. No process in the README | Pass | No job identifiers, packet paths, review histories, checkpoint instructions or coverage statuses occur in the reader. Mathematical hypotheses and construction requirements remain visible. |
| 5. Suggested Lean | Fail on signature coverage; elaboration passes | After corrections, `lean-check` exits 0 with 120 warnings, all `declaration uses sorry`, and no errors or other warnings. Comments do not elaborate the missing definitions, lemmas or examples. |
| 6. Metadata | Pass | Exactly `topic = "math.NT"` followed by a newline; parsed as TOML. |

## Corrections applied

1. `finiteGamma0_star_mem` now assumes prime `p` and positive exponent `n`,
   matching the finite prime-power level convention. The old unrestricted
   natural-number signature admitted `p = 0`, `n = 1`. In that case
   `ZMod 0` is the infinite residue ring and its `val` function is
   `Int.natAbs` (pinned `Mathlib.Data.ZMod.Basic`, `ZMod.val` and
   `ZMod.val_unit'`). It sends both units to 1, losing the negative scalar
   determinant in the intended scalar-image criterion. Compilation with a `sorry`
   proof did not detect this mathematical defect.
2. `ResidualHeckeIdeal.actingFactor` now states unique existence (`∃!`),
   matching the README's quotient universal property. The explicit relation
   ideal inclusion remains a hypothesis; no automorphic realization is assumed.
3. `integralTraceFamily_parameter_add` now includes the zero-parameter law
   as well as additivity, as its README API entry requires.
4. The finite PEL component comparison now distinguishes geometric
   components from connected arithmetic components over the fixed
   unramified completion `K`. At split `v` and principal `v^r` level, `r≥1`,
   the relevant geometric component field is Carayol's `F_v^r`, attached
   by reciprocity to `1 + v^r O_v`, completed over `K`. Its Galois orbit
   can be considered over `K`; this does not make a selected geometric
   component `K`-rational. Added the notation locator on p.155 and
   §§4.5.1–4.5.5, pp.188–189 to both affected README targets and their
   suggested-file documentation. Carayol §4.5.1 compares the preimages of
   the maximal-level components over the unramified field; §4.5.5 specifies
   the field for selected higher-level components. These are distinct
   statements. The amendment does not certify an unspecified descent cocycle.

The comparison with the accepted statements also checked the restricted
ownership moves required by the tier order. The characteristic-zero Hilbert
cusp construction cites Dimitrov Theorem 8.6(iv), p.548; open Hodge-line
splitting and scalar descent cite Diamond §§3.1–3.2, pp.9–12; quaternionic
transfer cites Badulescu–Renard Theorem 18.1(a)–(b), pp.44–45 of the author
preprint. General compactification, bundle and GL₂ classification theories
remain with their existing owners. Conditional characteristic-zero Galois
compatibility is explicit in auxiliary-level control. The formal residual
evaluation is distinguished from an eigensystem in the acting Hecke algebra.

## Required revision: elaborated geometric signatures and tests

After removing nested block comments and line comments, the suggested file
contains **93 named definitions/abbreviations/lemmas/theorems and 47
`example` commands**. Of the README's 206 API names, **154 have no native
named declaration**, allowing for the namespace prefix used by the typed
Hilbert section. The final comment beginning “Full mathematical signatures
and carrier requirements” contains the missing prose contracts. The presence
of a name in that comment is not a Lean signature.

Concrete failures, sufficient independently of the aggregate count:

| Target | Missing elaborated contract |
| --- | --- |
| `H1/c-polarization` | `CPolarization`, its evaluation/base-change/Rosati APIs, and the elliptic, negative and nonprincipal `example`s occur only in the comment. |
| `H1/tame-level-functors` | `HilbertTameLevel` and the torsion-level maps are comment entries, not the stated closed-immersion construction. |
| `H2/dp-integral-model` | `DelignePappasHilbertModel`, its moduli and generic-fibre APIs, and all three DP examples are untyped prose. |
| `R18.1/canonical-quaternionic-curve` | `QuaternionicShimuraCurve` and its complex/level comparisons, including the division-curve compactness example, have no declarations. |
| `R18.5/drinfeld-half-plane` | The projective complement's point set is typed, but the homography and analytic base-change APIs are not. A point set does not supply the rigid analytic open. |

Revise the suggested file against the actual supplier interfaces, preserving
the definitions' mathematical content and hypotheses, with their API lemma
signatures and at least three meaningful `example`s per definition or
construction. A partial arithmetic core must not stand in for an abelian
scheme, finite-flat group, moduli algebraic space, adelic action, integral
crystal or formal analytic space. Keep honest omissions where a condition
cannot yet be stated; do not replace them by arbitrary `Prop` fields or dummy
objects. Such an omission remains an omission for package acceptance. The
missing supplier interfaces identified in the package handoff explain why
this is more than a spelling repair.

The accepted packets still record 8 and 7 gaps and no closed stages. Their
successful validators check packet structure, not mathematical closure.
Preserve their restrictions: the global DP object is an algebraic space
until its scheme refinement is proved; ramified Γ₀ comparison retains its
ideal-annihilator/flat-closure construction; ramified crystalline comparisons
use saturated relative filtrations; integral Ihara requires the indefinite
theorem and saturation; localized coefficient control retains both residual
H⁰ vanishings. This review neither silently removes these qualifications nor
claims their proofs. In particular the component-field clarification above
does not close every bridge/descent obligation in those inputs.

## Library, dependency and validation checks

Read the reviewed `AUDIT-15` entries in `data/library-coverage.json` and the
relevant ModularCurves/ClassFieldTheory link records. The link screens predate
the package's explicit restricted CM-character input; the roadmap now cites
ClassFieldTheory directly rather than re-planning reciprocity.

The nine roadmaps absent from the atlas snapshot were screened in the current
read-only upstream tree, including OperatorTheory's nested suggested files.
General finite locally free sheaves, tensors and determinants are owned by
AlgebraicVectorBundles; general differential/local-coefficient material stays
with DifferentialGeometry and the current library. The actual current
`TauCeti.LocalCoefficientSystem` and twisted cochain/cohomology declarations
were read. No new duplicate general construction was added. The upstream
roadmap checkout was read at `d6f707516e7ede3181dac4b2420ba25c0799d22d`,
and refreshed at `dea8191cc6047d6142a65872ebce6eeeb841a29b`; the intervening
change concerns IntegralHeckeAndGaloisDeterminants. Current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These read-only ownership
checks are distinct from the pinned elaboration environment.

Checks completed:

- Both accepted packets: `python3 scripts/check_blueprint.py`, respectively
  75 and 58 nodes, 0 errors and 0 warnings. Packets were not edited.
- Initial and final `lean-check` of the package suggested file: exit 0,
  120 `sorry` warnings each, at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`.
- Full target/API/test membership, three-test minimum, internal anchor
  resolution, local prerequisite order, metadata shape and byte limit.
- `git diff --check`, review JSON parsing and deliverable-path checks.

The package is returned for the elaborated signature/test omission. The
successful Lean run remains useful evidence for the corrected typed portion;
it does not verify the mathematical contracts in comments.
