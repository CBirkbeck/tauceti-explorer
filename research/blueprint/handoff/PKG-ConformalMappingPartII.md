# PKG-ConformalMappingPartII — complete package

Issue: #7537. Worker: Codex (GPT-6), session `codex-j8UyP2`. The bot confirmed
the claim on 10 October 2026. This submission completes the package job; it does
not assert that its mathematical targets have been formalized.

## Deliverables

- `research/blueprint/packages/ConformalMappingPartII/README.md`: all 98
  accepted targets, in ten dependency-ordered layers O0, U0, S0, L0, H0, R0,
  F0, V0, G0 and M0; all 68 planning API entries and 54 specified examples.
  Each of the 18 definition/construction targets retains at least three
  examples. Every target has a source locator and prerequisites. The
  introduction fixes scope, ownership, normalization, native scalar-germ
  conventions and effectivity requirements. Within-layer ordering follows
  prerequisites, including the logarithmic derivative and pole-count inputs
  to the reciprocal-cover estimate in M0.
- `research/blueprint/packages/ConformalMappingPartII/Suggested.lean`: one
  import block and a consistent `TauCeti.ConformalPartII` namespace, with the
  general Schwarzian in `TauCeti`. Expanded the inherited scalar prototype
  with native complex ODE, germ, cover, projective subgroup and quantitative
  interfaces. It elaborates at the required pins.
- `research/blueprint/packages/ConformalMappingPartII/metadata.toml`:
  `topic = "math.CV"`.

Only these deliverables and this handoff were changed. The accepted packet,
older reader document and inherited suggested file were left intact.

## Input and source provenance

The source of truth is the accepted target-level packet
`research/blueprint/packets/ConformalMappingPartII.json`, including the
independent review dated 5 October 2026. The package uses its corrected
statements rather than several stale statements in the older reader document.
In particular it retains the representative-continuity guard for pointwise
analyticity, the phase `G(0)/|G(0)|`, the outer radius `(1+r)/2`, the corrected
horoball bound `4h_N²/D`, the zero-balanced logarithmic constant and the
explicit small-radius part of effective fixed-level completion. Rational
polynomial pole clearing does not require the original finite image set to be
Galois-saturated.

Primary source: Frank Calegari, Vesselin Dimitrov and Yunqing Tang,
[*The unbounded denominators conjecture*](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf),
JAMS 38 (2025), 627–702, DOI
[10.1090/jams/1053](https://doi.org/10.1090/jams/1053).
The author-hosted published offprint was checked against the accepted packet's
SHA-256: `867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e`.
The relevant material read was §1.1.6 (p.632), the proof of Corollary 2.0.5
(p.636), Lemma 2.3.1 and its proof (pp.639–641), and §§5–6 (pp.667–684).
Statements in the deliverables are mathematical specifications in our own
words, not source excerpts or a section-by-section account of the paper.

Hempel's accessory-parameter argument, the original special-function
references, and the cited classical fixed-puncture growth proofs were not
independently read in this packaging run. Their inputs remain explicit proof
obligations from the accepted plan, with precise invocation locators in CDT;
the package does not treat these citations as existing Lean results. The
fixed-level effective constants also require the stated constructive estimates,
including the range `0 < r ≤ 1/4`. An existence theorem or the large-N estimate
alone does not discharge that target.

## Current upstream audit and correction to the plan

Read the current ConformalMapping and FuchsianOrbifolds READMEs in full and
their suggested files. Checked the nine roadmaps newer than the atlas snapshot
and the Completed roadmaps for overlapping targets. UniversalCovers is now
in `Completed`; its carrier and local-sheet construction are Stage 0, the deck
identification Stage 1, and based lifting Stage 2. Package links and stage
locators use this current organization. Audited the current Tau
Ceti sources in addition to the pinned baseline.

- TauCetiRoadmap commit:
  `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`.
- Current Tau Ceti commit:
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- Its Mathlib commit:
  `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.

Current Tau Ceti already has the Cayley map in
`TauCeti.Analysis.Complex.UpperHalfPlane.Cayley`, including
`TauCeti.bijOn_I_mul_one_add_div_one_sub_ball` and the inverse identity
`TauCeti.I_mul_one_add_sub_I_div_add_I_div_one_sub`. U0 cites and reuses this
coordinate; its local name is for compatibility with the scalar formulas.

The generic Shimizu inequality requested as a supplier extension in the packet
already exists in `TauCeti.Analysis.Complex.Fuchsian.Shimizu` as
`Subgroup.inv_le_abs_apply_one_zero_of_upperRightHom_mem`. The package imports
that result mathematically and plans only the roots-group specialization
involving both matrix entries. Neither current module is available in the
required pinned build, so the suggested file gives admitted compatibility and
specialization statements against the older native interfaces; it does not
import a module unavailable at those pins. Generic Fuchsian polygons and cusp
data remain owned by FuchsianOrbifolds. No ownership was moved from a higher
tier.

One additional convention error was found in the accepted packet's
`U0/rotation-equivariance`: for the standard left action
`τ ↦ (aτ+b)/(cτ+d)` and `C(z)=i(1+z)/(1−z)`, the displayed matrix
`[[cos(π/N),−sin(π/N)],[sin(π/N),cos(π/N)]]` conjugates to multiplication
by `ζ_N⁻¹`, rather than `ζ_N`. Its derivative at `i` is `exp(−2πi/N)`.
The README states the correct compatibility and the native suggested matrices
retain this displayed lift. Its inverse corresponds to the positive rotation.
Both have projective order N; reversing the generator permutes the complete
family of conjugate cusp generators, so the subgroups, widths, indices and
quantitative conclusions are unchanged. The half-rotation lift has the same
clockwise convention; the involution on `F_N^N` holds for either direction.
This is a correction to the packet's explicit coordinate compatibility, not a
claim of an erratum in the published paper. The packet was not edited because
it is outside this job's permitted paths.

## Lean validation and its limits

Command:

```text
lean-check research/blueprint/packages/ConformalMappingPartII/Suggested.lean
```

Final result: exit 0, no errors, and 166 warnings, all exactly
`declaration uses 'sorry'`. No other warnings. This used the shared build at
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Memory was checked before compiling;
only one compiler was run at a time, and no build, update, cache download or
language server was started.

The file contains 28 definitions, four structures, 117 named lemmas and 51
Lean examples. It uses native `Filter.Germ`, `Module.Basis`, `IsCoveringMap`,
`Complex.UnitDisc`, analytic continuation, meromorphic order/divisors, proximity,
circle averages, `SL(2, ℝ)` and `PSL(2, ℝ)`. The meromorphic-basis structure
requires a genuine full basis of punctured solution germs. The pointed-cover
structure is a scalar realization of a cover from the native disc, not another
topological universal-cover construction. The projective subgroups are
concretely generated by the displayed matrices rather than proposition-valued
stand-ins. The scalar spike example is proved and distinguishes a removable
punctured germ from an incorrectly assigned point value.

The standard header makes the README definitive and the suggested file
nonexhaustive. Some targets remain precise prose specifications in that file:
complex charts and uniformization on the existing universal-cover carrier,
global ODE dimension, the supplier polygon/cusp interfaces, full hypergeometric
continuation and log-Gamma/zeta expansions, and portions of the cusp geometry.
The README contains their full targets, API and examples. In particular the
hyperbolic area example uses the supplier area interface in prose rather than a
private placeholder carrier. Elaboration verifies only types; admitted
statements and effective constants still require proofs. No empty `Prop`
fields or admitted proposition definitions were introduced.

## Other checks and next step

`python3 scripts/check_blueprint.py research/blueprint/packets/ConformalMappingPartII.json`
reported zero errors and zero warnings. This checks the unchanged input, not
the package's mathematical truth. A separate target/API/example comparison
confirmed 98/98 targets, 68/68 API entries and 54/54 planned examples in the
README. All 98 targets have source and prerequisite paragraphs. Package size,
scope, metadata, absence of private paths and process language in the README,
and whitespace were checked.
`python3 research/blueprint/intake.py check-files` on the four deliverables
reported `4 file(s), 0 problem(s)`.

Resume at the independent package review. Re-run `lean-check`, check the
rotation convention above, and assess the exact README statements against the
accepted packet and sources. There is no unfinished package edit or checkpoint
to resume. Future formalization should use the current Cayley and Shimizu
imports and the supplier geometric interfaces rather than reproducing them.
