# PKG-ExponentialSumsAndCircleMethod~2 — blocked checkpoint

Status: **partial; not ready for upstream or independent acceptance**. Issue #10765.
Worker: Codex, session `codex-yqyA3C`, 20 October 2026. Branch:
`codex-yqyA3C-exponential-sums-package`. The claim bot confirmed this session's
claim comment 6294754177. No other job was claimed.

This checkpoint repairs the weighted Siegel–Walfisz contract and brings the Lean
examples into the current package shape. Six prerequisite contracts still lack
matching exports. Resolving them requires work in their owners and upstream
routing, outside this issue's permitted files. They have not been replaced by
assumptions that restate the conclusions, weakened, or declared closed.

## Changes completed

- Replaced the old `AN.2/siegel-walfisz` citation with **AnalyticNumberTheory
  Part I §0.32**, whose representative `siegel_walfisz` signature actually uses
  the inclusive von Mangoldt sum `psiAP`. Read the supplier's definition and
  signature, including the constants before the varying modulus and residue.
- Added the local targets `mangoldt_interval_progression` and
  `mangoldt_nonunit_progression`. The former keeps all real endpoints
  `0≤u≤v≤N`, logarithmic modulus growth, and an error measured against `N`.
  Its endpoint proof splits at `Y=N(log N)^(-A-2)` and applies the supplier with
  exponents `A+2,B+1` above that cutoff. Below it, the elementary Mangoldt bound
  controls the sum. Thus an arbitrarily small endpoint does not silently
  inherit an invalid modulus hypothesis. Nonunits instead receive the explicit
  prime-power bound `ω(q) log N`, with no reduced-class main term. The major-arc
  target now names these adapters and its phase-variation cost.
- Distinguished the integral Markoff continuation from the newly available
  **ArithmeticDynamicsPartII, MD.0–MD.7**. That plan studies the zero fiber over
  finite fields and its prime/primitive-squarefree lifting, not the varying
  integral fibers required here. Its final routing section proposes
  `ArithmeticDynamicsIntegralOrbits`; no packet or layer under that proposed
  name exists in this checkout. No dependency on a fictitious layer was added.
- Replaced all 111 admitted examples: 69 are now proved discriminating examples;
  35 boundary cases are named theorem targets with `sorry`, listed beside the
  relevant README Checks; seven extra examples were removed from the Lean
  selection. Every original README Check remains. Proved controls include
  correlation conjugation signs, negative Fourier phase, VMV counts 6 and 20,
  wrapped/closed/denominator-dependent arcs, positive ordered Waring counts,
  residue normalization, Markoff masses and projective representatives.
  The difficult density, series, geometric and sector boundaries remain honest
  theorem targets, including the review's negative controls.

The README retains all 53 definition blocks, all 153 original `Prove` targets,
all 242 named API bullets, all 185 README Checks, and all six original worked
example sections verbatim. The accepted packet has 206 nodes and 182 tests;
the README's three extra Checks were already present after the prior review.
The two pre-existing Gaussian/restriction proof-input targets also remain.
The Lean file retains its original 50 real-bodied definitions and 30 theorem
signatures; with the 35 boundary targets it now has 65 theorem signatures and
69 proved examples in 997 lines. There are no admitted examples, sorry'd data,
new carriers, auxiliary-lemma chains or extra imports. `metadata.toml` is
unchanged. No packet, original suggested file, reader, review or atlas data was
edited; `review.json` remains the independent `needs_changes` verdict.

## Blocking contracts and exact consumers

The independent review's seven-row closure table is reduced by the AN repair
above to these **six unresolved rows**:

| Supplier boundary | Matching export still required | Exact consumers and evidence |
| --- | --- | --- |
| FunctionFieldLatticesAndShrinking, Part II | Independent symmetric gamma-count shrinking with strict polynomial/fractional balls and adjoint minima. | `iterated_function_field_shrinking`. No roadmap, packet or supplying layer under this owner was found in the atlas or current upstream tree. The consumer cannot supply its own independent input. |
| Early GeometricCircleMethodAndMappingSpaces | Componentwise affine intersection dimension; coefficient-uniform polynomial-box bounds including cutoff zero; independent Padé/Hankel excluded-kernel equivalence. | `polar_dimension_bound`, `uniform_function_field_minor_count`. No exact early supplying prefix exists. Mapping-space cohomology must remain downstream of this arithmetic branch. |
| IntegralLattices extension | A maximal integral nondegenerate local quadratic lattice of rank at least five contains the integral `xy` plane, including at two. | `maximal_lattice_local_positivity`, `maximal_lattice_eventual_representation`. Current IntegralLattices Layer 3A–3D provides local carriers/forms, Jordan splitting and odd/dyadic descriptions, not the maximal-integrality hyperbolic-plane theorem. Reuse its carriers and match the quadratic half-norm convention. The prior review identifies SSTT Lemma 4.6, p.18 and its Gerstein Lemma 6.36 input. |
| ArithmeticDynamics integral-orbit continuation | Varying-target integral Markoff congruence classification, geometric integral-point density and generic orbit-growth comparison, over the existing CA.4 moves. | `markoff_reciprocal_mass`, `markoff_almost_all_representation`, `markoff_orbit_growth`. The current Part II is the finite-field zero-fiber branch. Its routing section proposes the integral-orbit continuation but does not supply these exports. |
| FiniteFieldsAndCharacterSums FF.2 | Complete Burgess `2r`-th moments and iterated Graham–Ringrose correlations, including repeated-factor exceptions, distinguished primitivity and dependence on `r`. | `burgess_character_bound`, `graham_ringrose_bound`. The revised FF.2 `trace-correlation-main-term` and `mobius-autocorrelation-bound` retain their actual sheaf hypotheses and geometric main terms; they are not these moment interfaces. The exact specialization and exceptional-tuple accounting still need target-level exports. |
| SchemeAndStackFoundations geometric extension | Degree-controlled projection and integral generic sections for possibly singular geometrically integral curves/surfaces, plus coefficient-uniform exceptional/Fano-locus bounds. | `projective_space_curve_bound`, `surface_linefree_bound`, `surface_all_points_bound`. SF.5 isolated plane Bézout and smooth-surface Bertini do not state this contract. SF.4 generic projection, citing de Jong 2.11, pp.56–57, does not add the quantitative elimination bounds. |

This roadmap is outside the 94-roadmap Caraiani–Newton order. No tier or bundle
was inferred from owner names. The next routing action must identify real
supplying layers and the upstream slot before these contracts can be replaced
by exact exports. Changing other owners or creating their plans is outside
#10765's allowed deliverables.

## Reading, provenance and limits

Read WORKERS.md, the blueprint/source-faithfulness/package/upstream protocols,
the complete prior independent review and handoff, the relevant library audit
entries, and the current EffectiveBounds and OperatorTheory/OrthogonalGeometry
models. Checked current upstream at `0d144d044dacebca17b654695b6f1ad58f159b27`
and the current Tau Ceti library read-only; no build was run in either tree.
The prior review's current-library observations use the same upstream revision.
This revision rechecked the supplier boundaries above rather than claiming a
fresh full source audit of every unchanged target.

Read Tao's public **254A Notes 8, §2, Proposition 24 and its complete proof** for
the changed major-arc interface. The web notes have no page numbers. The
explicit endpoint cutoff and sharper nonunit bound are the local deductions
written above, rather than claimed verbatim source theorems. Read the native
Mathlib `ArithmeticFunction.vonMangoldt_le_log`, `_apply`, and `_apply_pow`
statements used by those deductions. No source passage was copied into the
repository. Checked the cleared-library index; no uncleared book copy was used.
The prior handoff's unread original Burgess/Graham–Ringrose, Lieb, Gerstein and
other external proof obligations remain; neither the adapter nor a Lean
elaboration certifies those proofs. No suspicious instruction aimed at the
worker was encountered in the consulted untrusted material.

## Verification

- `lean-check research/blueprint/packages/ExponentialSumsAndCircleMethod/Suggested.lean`:
  **exit 0; 65 warnings, all and only declaration uses of `sorry`; no errors**.
  Used the existing shared build at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. Memory preflight had 79 GB
  available. Only one Lean check was run at a time, and none remains running.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ExponentialSumsAndCircleMethod.json`:
  **exit 0; 0 errors, 0 warnings**. The packet was checked read-only.
- Mechanical before/after inventory: the README targets/APIs/Checks and worked
  examples described above are preserved; the original Lean declarations are
  preserved; all 35 renamed boundary targets occur in the README; no `example`
  contains `sorry`; at most two proved examples occur per kept definition.
- `python3 research/blueprint/intake.py check-files` over the two changed package
  files and this handoff: **3 files, 0 problems**.
- `git diff --check`: **exit 0**.

## Submission handling

Open this as a **draft checkpoint**, not a completed package. The current
`issues.deliverables_complete` function tests only file existence for package
jobs; all three package files already exist, so it cannot express the six
closure blockers. The draft keeps that automatic existence test from turning
this checkpoint into a misleading completion. WORKERS.md's submitting section
leaves draft PRs to the maintainer. The PR body explicitly records partial
status and the required owner routing. No intake code, queue status, review
verdict or issue label was changed by this worker.
