# DESIGN-HabiroCohomologyFoundationsPartII

Issue: #11334. Agent: Codex. Session: `codex-y8e6bP`.
Branch: `codex-y8e6bP-habiro-foundations-ii`.
Claim confirmed by the bot on 2026-10-20 at 10:35:17 UTC; the full issue was
read again after confirmation. This submission completes the single design
pass. It is not a checkpoint or an independent review.

## Result and coverage

The five authorized deliverables define a Part II after RefinedTraceMethods:

- HT.1: **planned**. Chosen trace-pair Habiro descent and the relative
  perfected-spherical-lift criterion; exact imports preserve the E₁ resolution,
  ku-lift boundary and independent Nygaard/trace construction targets.
- HT.2: **planned**. Canonical/framed trace agreement on the full common framed
  domain and the degree-zero number-field specialization export.

The packet is `complete`, with four new target nodes: two constructions and
two theorems, 14 API items, 11 construction unit tests, four planets and one
baseline declaration. It has no mathematical gaps and three explicit supplier
requests. The theorem acceptance lists add nine further checks; imported
boundaries and all retained Part I example clauses are routed below. Neither
stage is marked closed while its supplier requests remain open. No target is
claimed to be implemented; all implementation statuses are `unchecked`.

The small node count is deliberate: the reviewed audit identifies the trace
existence/comparison material as already owned by RT. It would be a duplicate
to reproduce those theorems as new local nodes. `importedTargets` records each
moved paragraph's precise destination, including its non-theorem boundaries.

## Exact relocation manifest for the maintainer

Only this job's five files were edited. The following supplier/order edits
must be applied by the maintainer's integration work; they are not performed
by this branch. The package paragraph numbers are those of
`research/blueprint/packages/HabiroCohomologyFoundations/README.md`.

| Original package material | Destination and retained content |
| --- | --- |
| Layer 6 §6.1 | Part II HT.1 structured-input section and `trace-habiro`; the existence theorem remains the imported RT.4:q-Hodge `q-hodge-global` node. Preserve the absolute 2-inverted theorem, the full relative spherical base `(tC_p)`, prime-dependent E₂/E₁ branches, R2, completed graded comparison, four pair axioms and conditional E_(n−1) structure. |
| §6.2 | HT.1 imported boundary, request HT-RT-boundary, and `traceHabiro_kuLiftInsufficient`. The algebraic exponent-one failure stays Part I HQ.5. Preserve the actual E₁ ku-lift counterexample, absence of a known E₂ ku-counterexample, and the unconstructed image-of-J equivariant diagram. |
| §6.3 | HT.1 structured-input section, imported RT `spherical-lift`, `p-complete-comparison-odd`, `p-complete-comparison-two`, `quasi-regular-quotients`. Preserve p-torsion-freeness, the p-quasisyntomic semiperfect cover, entire lifted augmented Čech nerve, limit of τ≥2i THH and then residual homotopy fixed points. Preserve the all-p Nikolaus proof, identity-cover independence/E∞ structure, and the general-cover multiplication boundary. |
| §6.4 | `HabiroCohomologyFoundationsPartII:HT.1/perfected-lift-naive`. Preserve QH 4.22(b), completed flat descent to perfection, the lift of R_∞ rather than R, its role as an existence criterion, higher-power ranges at odd p/2, and the toric x−1 example with its q-divided powers. |
| §6.5 | HT.2 §2.2: import RT.4:Habiro-comparison `number-field-habiro`, then `number-field-trace-exports` transports its coefficient maps. Preserve arbitrary number fields, Δ divisible by 6 and disc(F), periodic KU, genuine fixed points before residual-circle homotopy fixed points before spectral limit before π₀, and the degree-zero scope. |
| Layer 6 Examples/Dependencies | HT.1 Checks preserve the spherical E₂ example, separate E₁-resolution hypotheses and ku-lift failure. The new stage dependencies replace the old backward dependency. |
| §8.1 **trace clause only** | `HabiroCohomologyFoundationsPartII:HT.2/canonical-framed-trace`, particularly Check 1 with ℤ[1/2][x] and its explicit spherical lift. General framed scope is requested from RT instead of restricting the theorem to this Check. |
| §9.15 | HT.1 independent-construction subsection and imported target route: PR.3 Frobenius divisibility/descent, RT.6 double-Postnikov descent and subsequent comparison, Nygaard completion, independent AI.1/HQ.4 squares, early-input direction for trace existence, syntomic ownership in RT.6. |

The old assembled blueprint has `/plan/` between stage and node suffix;
`HabiroCohomologyFoundations--HQ.1.json` uses the same suffixes without
`/plan/`. Retire both old aliases as local owners according to this table:

| Old node under `HabiroCohomologyFoundations:HQ.5-trace/` (also its `/plan/` alias) | Replacement |
| --- | --- |
| `trace-theoretic-existence-of-q-hodge-filtrations` | RT.4:q-Hodge `spherical-lift`, `compatible-spherical-lifts`, `q-hodge-global`; consumer export is Part II HT.1 `trace-habiro` |
| `a-lift-over-connective-complex-k-theory-is-not-enough` | Part I HQ.5 algebraic counterexample plus RT request HT-RT-boundary; Part II HT.1 records their combined boundary |
| `the-one-disc-refinement-and-the-prime-two` | RT.4:q-Hodge `spherical-lift`, `p-complete-comparison-odd`, `p-complete-comparison-two`, `quasi-regular-quotients` |
| `the-spherical-e1-lift-case-of-the-well-behavedness-theorem` | Part II HT.1 `perfected-lift-naive` |
| `the-number-field-ring-from-periodic-complex-k-theory` | RT.4:Habiro-comparison `number-field-habiro`; usable maps in Part II HT.2 `number-field-trace-exports` |

Also retire
`HabiroCohomologyFoundations:HQ.8/the-staging-rule` and its `/plan/` alias
as local comparison owners, replacing their use by HT.1's explicit imported
construction directions. Split **only the trace clause** from
`HabiroCohomologyFoundations:HQ.7/the-acceptance-tests`; keep its polynomial,
étale, scheme, torsion, tensor-domain and Laurent clauses in Part I. The
assembled plan has no separate §8.1 node to wholesale rekey.

Remove `HQ.5` from the old spherical-lift node's `realises`: its algebraic
criterion remains Part I §5.19, whereas the trace criterion is now an HT.1
target. Part I's quasi-regular section requires the local deformation property
as its input; it must not acquire a prerequisite on the new trace criterion.

**Keep in Part I:** Layers 0–5 in full, including the algebraic higher-power
criterion and §5.26's corrected finite-coefficient arithmetic pullback; Layer
7's analytic comparison problem; all trace-free parts of §8.1 and all §8.2;
§§9.1–9.14 and §§9.16–9.19. In particular, §9.18/§9.19 canonical θ/Witt map
compatibilities remain separate Part I targets, with their existing gaps.
Do not move all Layer 9 because its aggregate Dependencies paragraph names RT.
After §9.15 and the trace example move, delete the stale RT references in the
retained aggregate layer and roadmap dependency summaries.

### Check conservation

| Original Check or boundary | Where retained |
| --- | --- |
| Spherical E₂ with 2 inverted gives a pair; E₁ needs a coherent cover | HT.1 structured input, `trace-habiro` acceptance and Checks 4–5 |
| E₁ ku-lift does not imply the naive deformation | HT.1 boundary/Check 4, HT-RT-boundary, Part I algebraic failure |
| Nikolaus's local argument includes 2; identity cover is naive and lift independent | HT.1 structured input, imported RT identity-cover and prime-two nodes |
| Higher-power criterion versus spherical-lift ranges, including 2 | HT.1 §1.2 Checks 1–3 |
| Toric x−1 quotient has the lift criterion without a higher-power presentation | HT.1 §1.2 Check 2 |
| Finite-coefficient m=1 rational corner and m=4 outside the high-powered spherical range | Stay Part I §5.26; HT.1 §1.2 Check 4 and source finding E2 prohibit dropping the rational corner or replacing its algebraic proof by the restricted spherical route |
| Polynomial q-integer versus q-Hodge differential | HT.1 Check 3 and HT.2 §2.1 Check 3, imported from Part I |
| H⁰(M/^Lh) versus H⁰(M)/h and H¹(M)[h] | HT.2 §2.1 Check 3; original construction stays Part I |
| Étale arithmetic coefficients and q-Witt reductions | HT.1 Check 1 and HT.2 §2.2 Checks 1–4, with HR.5/HR.6 imports |
| Smooth scheme with primes ≤dimension inverted, both supplied specializations | Retained Part I §8.1; no trace prerequisite added to this example |
| ℤ[x] tensor square leaves the canonical class without 2 inverted | HT.2 §2.1 Check 4; algebraic multiplication/domain test stays Part I |
| Explicit ℤ[1/2][x] spherical comparison | HT.2 §2.1 Check 1 |
| Laurent ℚ: qdR differs from qΩ | HT.2 §2.1 Check 5, imported from Part I |
| Trace-independent algebraic/analytic boundary | Retained Part I §8.1; no analytic premise enters any Part II node |
| Independent prismatic and trace constructions, comparison afterwards | HT.1 independent-construction acceptance, exact RT.6 imports and HT-PR-independent |
| Number-field Δ, genuine/residual/limit order, π₀-only output | HT.2 §2.2 definition and Checks 1,5,6 |

### Order and consumer edits

The required order is:

1. The trace-free Part I pair/descent foundations (package §§2.1–2.7 and
   Layer 4), together with the other independent algebraic/prismatic suppliers.
2. RefinedTraceMethods' trace comparisons and genuine arithmetic realization.
3. HabiroCohomologyFoundationsPartII HT.1, then HT.2.
4. The trace-consuming HabiroNahmSeries/HabiroNumberFields applications.

For stage edges, redirect the old
`RefinedTraceMethods:RT.4:q-Hodge → HabiroCohomologyFoundations:HQ.5-trace`
to the appropriate HT.1/HT.2 stages. Redirect
`RefinedTraceMethods:RT.6 → HabiroCohomologyFoundations:HQ.8`
to HT.1's imported independent-construction interface. Keep
`HabiroCohomologyFoundations:HQ.3 → RefinedTraceMethods:RT.4:q-Hodge`.
Retained Part I nodes have no direct RT prerequisites after the six moved
owner nodes are removed and the HQ.7 acceptance node is split.

In the order inputs that generate `upstream/CaraianiNewton.md`,
`upstream/MergeQueue.md` and `upstream/merge_waves.json`, insert this sequel
strictly after RT and point only trace consumers at it; recompute the order
rather than choosing a numerical tier in this job. The current Caraiani–Newton
94-roadmap list contains neither HCF nor RT as an owned item, so it needs an
external-supplier annotation when relevant, not a fabricated tier assignment.
The Habiro family in `focus.json` should include the new sequel alongside Part I
when the maintainer registers it. Generic coefficient or algebraic consumers
remain pointed at Part I/HR; no new global dependency of the full arithmetic
module or Nahm-series construction on the trace realization is asserted.

## Requests and closure boundaries

- **HT-RT-framed**, RT.4:q-Hodge, consumed by `canonical-framed-trace`:
  expose all of KU 6.10, with the framed comparison maps, pair coherences and
  prime-two resolution verification. The existing polynomial node has only
  the ℤ[x] statement. This is an RT scope refinement, not a duplicate node here.
- **HT-RT-boundary**, RT.4:q-Hodge, consumed by HT.1's two targets:
  expose the E₁ ku-lift counterexample's trace-side input and the structured
  quotient ranges; preserve the limits on E₂/image-of-J claims. The algebraic
  failure is imported from its existing Part I owner.
- **HT-PR-independent**, PR.3, consumed by HT.1's independent-construction
  acceptance: expose the stage's independent Frobenius-divisibility and
  descent constructions, relative Frobenius twist, divided Frobenius and
  completion distinction as exact nodes. The packet currently has no suitable
  PR.3 node. The trace comparison itself is already an exact RT.6 node.

An independent reviewer must check the mathematics and these supplier
contracts. When owners supply the exact nodes, replace stage prerequisites
and resolve the requests before calling the stages closed. The plan assumes
the imported supplier statements; it does not certify implementations or
silently discharge supplier-internal outstanding proof obligations.

## Sources and source findings

Read fixed public PDFs QH v2, KU v1, TC v4, GSWZ v2, BS v4 and BMS2 v2.
The packet records exact sections read, printed pages, URLs, access date
2026-10-20 and SHA-256 hashes. No required source is missing. No uncleared book
was used. Repository prose and matches are in our own words; no source passages
or PDF text are included.

- **E1:** KU proof of Corollary 6.15, p.86, refers to QH 3.12 instead of
  Corollary 3.13, p.27. This known reference slip is already independently
  recorded in HCF/E304 and RT/E12. This packet records its own read version,
  not an inherited independent-review verdict.
- **E2:** TC v4 §§3.5/3.7, pp.31–32, drops the nonzero rational corner of
  the uncompleted finite-coefficient pair. Part I §5.26 already repairs it by
  an arithmetic pullback; m=1 detects the failure. The constant rational
  filtration completes to zero, so TC Corollary 3.8's completed trace comparison
  is unchanged. This finding is scoped to the read preprint; it makes no
  allegation against an unread published version. The packet explains the
  uncompleted derived-de-Rham calculation and records the correction search.

QH Remark 4.23, p.63, was checked carefully: its theorem-case implication is
consistent with constructing a spherical lift from higher powers. This is not
recorded as an erratum or as a converse between the hypotheses.

No instruction-like content requiring action was encountered in untrusted
comments, other authors' work or source pages. Sources were read as data.

## Baseline and upstream audit

Read the reviewed audit records in `data/library-coverage.json`, particularly
Part I HQ.5-trace (not built, duplicates RT.4:q-Hodge) and HQ.8's duplicated
trace/Nygaard comparison with RT.6. The generic enhanced and spectral
foundations are supplier inputs.

The native unit theorem was read in its actual Mathlib file at pin
`082e2d37e8b0463410cdb532e111cd43d5a66174`; the Tau Ceti pin is
`f790474821cf4256814db967cb154e7af3d0c369`. Source searches at both pins
found none of the required Habiro/q-Hodge/Nygaard/quasisyntomic/spectral
carriers. Also searched the current Tau Ceti checkout at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` with no target matches.

Read-only TauCetiRoadmap main was checked at
`0d144d044dacebca17b654695b6f1ad58f159b27`. Screened all nine newer
roadmaps (AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices,
LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions,
ProfiniteArithmetic, RealAlgebraicGeometry), their Lean suggestions where
present and other Lean where needed, plus the named Completed roadmaps
ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts.
No target here is already planned there. DGAInfinity and StablePeriodicCurved
were read as enhanced-category/convention style exemplars. All existing link
entries mentioning HCF were screened; none supplied an additional mathematical
contract replacing these imports. No upstream checkout was changed or built.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCohomologyFoundationsPartII.json`: **0 errors, 0 warnings**.
- Source issue shape and source-version requirements checked with the repository
  validators. All prerequisite IDs resolve; the local node graph is acyclic.
- Suggested Lean file elaborated using `lean-check` at the shared pinned build:
  **success, no warnings**. The file contains one proved native coefficient
  example, no placeholders, and no artificial carriers. The README carries
  all four heavy targets under the current WORKERS shape rule.
- API/test names were checked against the reader document; all 14 API items
  and all 11 construction tests are represented, with the theorem and imported
  acceptance checks stated separately. Both source findings are version-scoped.
- `git diff --check` and authorized-path inventory passed. The source pass
  specifically checked the p=2 branch, completed/uncompleted distinction,
  filtered quotient, multiplicative level, fixed-point order, rational corner,
  trace-free staging, and no added canonical θ/Witt equality.

The submission is ready for the independent design review and the maintainer's
ownership/order edits above. No other job was claimed after this one.
