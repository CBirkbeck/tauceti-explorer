# REV-RS-32 — independent review

Agent: Codex. Session: `codex-a71f92`. Issue: #863. Date: 2026-09-21.
Original author: ChatGPT, session `astra-7c41e9` (#864).
Verdict: **accepted after corrections**.

## Summary

The finite-complex/arithmetic boundary is sound, and all nine member stages
survive. I corrected incomplete supplier handoffs, exposed consumer dependencies
stated in prose, and made the anchor-first requirement explicit in the JSON.
I also resolved the previously deferred C4/R11.3 overlap: R11.3 supplies the
local Raynaud and polarized lattice-uniformisation construction; C4 extends
that same construction to its relative cusp setting and retains its additional
effectivity and comparison obligations. Nothing is assigned to an insufficient
finite-fan theorem. The aggregate audit matches the reviewed source records.
The corrected proposal has seven owner rows and 72 links, with no new cycle
against the conservative baseline graph. This accepts restructuring only, not
source-proof closure, implementation readiness or formalisation.

## Evidence and independence

Reviewed the submitted result blob `759d81ddd47f86031b9f2c19e9b5baa3877857b8`,
its complete [report](../restructure/RS-32.md), and the
[family](../restructure/RS-32.json). The mathematical snapshot is explorer
`3a9e9d7877bad538bc4e0ed202e88b8bc0fef8f0`; publication base
`e1d520110a3a3950d6011b1c762e0161f6f25e9b` changes only the queue since then.

Read the full [Shimura compactification document](../../../content/campaign/ShimuraCompactifications/README.md),
all nine extracted stages, and the full immutable
[analytic toric anchor](../../../content/tau-ceti/AnalyticToricGeometry/README.md),
including its conventions, exclusions, seven layers and acceptance tests.
Also read the complete [Fuchsian orbifolds roadmap](../../../content/tau-ceti/FuchsianOrbifolds/README.md):
quotient charts, cusp extension and ramification are separate constructions,
a useful check against silently transferring unquotiented chart conclusions.

Read every target and note in the member's nine AUDIT-10 records (43 targets)
and the anchor's seven AUDIT-01 records (59 targets), plus both accepted audit
reviews. A read-only reproduction of `merge_library_audit.py`'s projection
compared **all 16 aggregate records exactly**, including statuses, targets,
notes, evidence and live duplicate ids. The author's aggregate-access
limitation is therefore resolved; declarations are deliberately projected into
a capped evidence list, not copied wholesale into the aggregate.

Two load-bearing declarations were read with their namespaces and hypotheses,
and local source bytes were compared with the pinned remote files:

- [Fan/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean#L78):
  `TauCeti.Toric.Fan` stores `finite_cones`. This is not merely finite
  generation of individual cones or finiteness of arithmetic orbits.
  SHA-256: `ec2884ef9afe244681207ee300f4a1068c5a2666114b4a1c217aa37dbecd440f`.
- [SplitTorus/Scheme.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/SplitTorus/Scheme.lean#L64):
  `groupScheme` works over a commutative ring with a finite index type;
  characters are scheme morphisms. This is genuine base-ring infrastructure,
  not a field-only theory or the entire relative degeneration construction.
  SHA-256: `93da528133b53869b9b06f4a3066b1167e700063d364d1fa45ac65071c1938e9`.

Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`.
Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Other audit citations were treated as reviewed evidence, not newly re-proved
library absence assertions. No result is dropped on an absence search.

## Corrections

### Exact extension boundary

The title already uses the exact anchor title:
**Analytic toric geometry, Part II: arithmetic toroidal compactifications**.
The JSON reason now states that the unchanged anchor is the first prerequisite,
as the author's prose already required.

The original six toric owner rows are preserved. L0 supplies common
cone/lattice and finite-fan algebraic geometry; L2 regular affine complex
charts; L3 finite analytic gluing; L4 local toric boundary; L5 finite toric
maps and support-properness. The anchor is never narrowed, renamed or extended
in place. C0 owns arithmetic admissibility and relative/base-ring extensions;
C2 owns quotient/descent geometry; C3 owns arithmetic maps and pushforward.

### Complete consumer handoffs

The original table linked only selected pieces of each narrowed stage's
suppliers to its consumers. Section 15 requires the complete handoff.

Added **18 member-to-consumer dependency rows**, of which 15 were missing
from the conservative graph, from these actual dependency ranges:

| Consumer | Explicit imported stages |
| --- | --- |
| AutomorphicBundles B3 | C1–C6 |
| PerfectoidShimuraVarieties S1 | C4–C5 |
| PerfectoidShimuraVarieties S2 | C2–C5, where applicable |
| PerfectoidShimuraVarieties S6 | C1–C3 |
| HodgeTateAndCanonicalSubgroups T6:comparison | C1–C3 |

Added **25 finite-toric supplier handoffs** so every consumer of C0/C2/C3,
including these prose dependencies and the original proposal's C0→C2/C3,
has direct access to every named supplier. These are special-case compatibility
inputs; none replaces the actual C-stage arithmetic output.

### C4 and local Raynaud uniformisation

Read the complete
[Néron-model roadmap](../../../content/campaign/NeronModelsAndSemistableAbelianVarieties/README.md),
especially R11.3, and checked the R11.3 decision and owner row in RS-25.
R11.3 already constructs the local Raynaud extension and formal/analytic
uniformisation with polarization and lattice conditions. That is the existing
owner of the overlap flagged by AUDIT-10, not an unassigned future choice.

C4 now explicitly imports that scoped construction and proves the relative
cusp specialization/extension comparison. Its retained work includes the
relative semi-abelian schemes, character and extension data, biextensions,
polarized 1-motive data, relative algebraization/effectivity, universal formal
charts, endomorphisms and levels. Importing the local result does **not** prove
this stronger relative statement or the PEL degeneration theorem. The common
specialization uses the owner's carriers, not a second local uniformisation.

Added one owner row and **nine R11.3 links**: to C4 and to all eight of its
direct consumers (C5, C6, R35.5, T0, IG.2, B3, S1 and S2).
No R11.3 target, outside roadmap document or other job's deliverable is edited.

## Nothing-lost and external-consumer check

| Stage | Retained obligations checked |
| --- | --- |
| C0 | Positivity-domain local finiteness, arithmetic actions/orbits and cusp support; common/smooth/projective refinement existence; parabolic/level compatibility; base-ring and torsor descent; separately qualified properness |
| C1 | V2 boundary enrichment; radicals versus centres; mixed data/Hodge input, pure quotient and torus/abelian torsors; incidence, conjugation, labels, stabilizers |
| C2 / C2.general | Actual partial compactifications, arithmetic separation/quotients/gluing, normality/properness/open immersion, neat smooth-fan boundary, conditional projectivity, minimal-map fibres and canonical descent in the stated datum class |
| C3 / C3.general | Refinement identity/composition, compatible fans for datum/Hecke maps, common-refinement comparisons, normality/pushforward and separately qualified higher direct images; general-data maps |
| C4 | Relative degeneration/effectivity beyond the local imported theory; dimension-one comparisons, invariant fibre du/u distinct from base dq/q, and ramified p-level cusp maps |
| C5 | Good-prime integral PEL algebraic spaces and universal extensions, formal completions/properness, Hodge positivity/section finite generation, minimal projectivity/open quasi-projectivity, higher-p-level normalization bounds and height exports |
| C6 | Hilbert ordinary-neighborhood models, cusp/unit and polarization quotients, semi-abelian/Hasse data, scoped modular comparison, Koecher extension distinct from boundary vanishing; ramified H2 input |

Read the actual external stages R35.5, B3/B3.general, AG2.4, H5/R18.2,
T0/T3/T6:comparison, IG.2, O6 and S1/S2/S5/S6, and R28.1's existing
height-finiteness chain. All 17 pre-existing external edges to 14 distinct
consumer stages survive. The additional S2 prose dependency is now explicit.
Literal extracted descriptions were checked against their source documents.

No complex chart theorem proves integral properness. Smooth local boundary
coordinates do not automatically give global simple normal crossings after
quotienting. Refinement maps do not supply coefficient-specific higher
direct-image vanishing. No fixed fan is declared Hecke-stable for all operators.
No generic pure datum receives a universal abelian scheme. C6's prime-level
diamond-quotient comparison is not expanded to all modular levels.

The C3/B3 overlap is a supplier/application boundary: C3 supplies geometric
pushforward, B3 proves coefficient extension and invariance. Likewise C6/O6
separates the actual boundary/Koecher theorem from overconvergent coefficients
and trace operators; H5 and R13.4b retain their comparison obligations.

## Checks and limits

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-32.result.json`: **passed**.
- Independent checks: nine stages exhaust the member; four narrow decisions;
  seven unique owner rows; 72 distinct non-self links with live endpoints;
  exact Part II title and first prerequisite; no anchor edits; every narrowed
  supplier links to its stage and every direct consumer; every transferred
  owner links to the former stage.
- Conservative graph: 4,196 distinct baseline edges, combining atlas,
  per-roadmap dependencies/consumers and submitted link packets.
  Of the 72 proposal links, three already exist and 69 are new.
  No new link has a return path in the full union.
  Previously submitted but unmerged edits from this review session were
  excluded from this baseline.
- JSON, scoped-file and private-path checks passed. Only the corrected
  proposal, this review, and this job's handoff are submitted.
- No git command was run. No Lean file was required, changed or compiled.
  `check_blueprint.py` is not applicable to a restructuring proposal.

The blueprint must still transcribe the source-specific fan/properness,
relative effectivity and coefficient-vanishing hypotheses and proof leaves.
Those are retained mathematical work, not unresolved ownership or grounds to
mark any theorem formalized. The original RS-32 report is preserved as the
submission under review; this review and the corrected JSON supersede its
three-narrow/six-owner/20-link counts and its deferred C4 ownership note.
