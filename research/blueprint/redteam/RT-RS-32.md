# RT-RS-32 — red-team report

Agent: Codex. Session: `codex-c83e7a`. Issue: #1633. Date: 2026-09-24.
Status: **complete**. Findings: **none substantiated**.

The accepted restructuring survives the attacks below. All nine stages remain,
the seven ownership assignments match their source roadmaps, and the 72 links
preserve the scoped suppliers without introducing a return path. This conclusion
concerns restructuring: it does not certify source-proof closure or formalisation.

## Independence and reproducible scope

The original work is [PR #900](https://github.com/CBirkbeck/tauceti-explorer/pull/900),
session `astra-7c41e9`; its accepted review is
[PR #1052](https://github.com/CBirkbeck/tauceti-explorer/pull/1052), session
`codex-a71f92`. Neither is this session's work. I checked that against both file
histories, PR authorship metadata and this session's prior-submission archive.

Read the complete [family](../restructure/RS-32.json),
[result](../restructure/RS-32.result.json), [original report](../restructure/RS-32.md)
and [accepted review](../reviews/REV-RS-32.md). The review explicitly supersedes
the original report's three-narrow/six-owner/20-link counts and deferred C4 note;
those historical paragraphs are not additional, conflicting accepted decisions.
The live result has four narrow decisions, seven owners and 72 links.

Inputs were acquired at `ec19e9e415faad54e28ab4133babc44b382212c0` and refreshed
at `579c4c50a2ffe081438bdad6f5f1ff5a2274c427`. No acquired input changed. The read-only working set covers the
atlas, current campaign documents, integrated audits, proposed roadmaps, link
packets and restructuring proposals; source bytes and input hashes are recorded
in the worker's scratch evidence. Only the two RT-RS-32 deliverables are submitted.

## Nothing-lost attack

Read the entire [member roadmap](../../../content/campaign/ShimuraCompactifications/README.md),
including the completion and implementation-handoff paragraphs, and the entire
[analytic toric anchor](../../../content/tau-ceti/AnalyticToricGeometry/README.md),
including all seven layers, conventions, exclusions and acceptance tests.

| Stage | Original targets checked against the accepted disposition |
| --- | --- |
| C0 | Cone/face/intersection vocabulary comes from L0. Arithmetic action, finite orbit count, positivity-domain local finiteness, cusp compatibility, common/smooth/projective refinement existence, parabolic/level compatibility, base-ring charts, torsor descent and qualified relative properness remain C0. |
| C1 | V2 boundary enrichment, radicals and their centres, mixed data and Hodge inputs, pure quotient, torsors, incidence, labels and stabilizers remain; the existing Hodge/cone vocabulary is imported. |
| C2 | Relative charts, arithmetic transition/separation/quotient/gluing, normality/properness/open immersion, the neat smooth-fan boundary, conditional projectivity, minimal-map boundary fibres and reflex-field descent remain. Nonregular-cone obligations are expressly retained. |
| C2.general | General-data descent still uses C2 and V8.general and preserves rational boundary components and stabilizers. |
| C3 | Arithmetic refinement and compatible Hecke/datum maps, their laws and common-refinement comparisons remain, together with structure-sheaf pushforward, normality and coefficient-specific higher-direct-image statements. The owner of finite toric proper maps is not presented as a proof of the whole arithmetic construction. |
| C3.general | General-data level/refinement/Hecke and boundary comparisons remain, without adding an all-prime integral assertion. |
| C4 | Relative semi-abelian schemes, character/extension data, biextensions, polarized 1-motives, algebraization/effectivity, universal formal charts, endomorphisms and levels remain. The R11.3 local case is imported and compared. All dimension-one boundary comparisons remain. |
| C5 | Good-prime PEL toroidal algebraic spaces, universal extension, formal completions, properness, Hodge positivity, section finite generation, minimal projectivity/open quasi-projectivity, higher-level normalization bounds and height exports remain. |
| C6 | Hilbert ordinary-neighborhood models, cusp/unit and polarization quotients, semi-abelian/Hasse data, scoped modular comparisons, Koecher extension and the boundary ideal remain; ramified Hilbert input still uses H2. |

The explicit-ring/completed-chart acceptance contract is preserved. No generic
Shimura datum is given a universal abelian scheme. No fixed fan is asserted to
support every Hecke operator. The relative differential `du/u`, base differential
`dq/q`, p-level cusp ramification, and the restricted prime-level modular
comparison all survive. I also read R13.1–R13.3 and R13.4b in the
[modular continuation](../../../content/campaign/ModularCurvesPartII/README.md):
these remain imports and comparisons, not a second generalized-elliptic construction.

## Ownership attacks

The six finite-toric rows match L0's common algebraic carriers, L2's regular
analytic charts, L3's finite gluing/separation, L4's toric strata and local
boundary form, and L5's support criterion and toric maps. The anchor's global
finite-regular-complex restriction continues to qualify those imports. The
proposal does not assign infinite arithmetic fans, quotient separation, integral
properness, relative effectivity or coefficient vanishing to those layers.

Three tempting transfers fail, and the proposal correctly avoids them:

- A subdivision definition does not prove existence of common, smooth or
  projective admissible refinements. C0 keeps that existence work.
- A holomorphic coordinate-hyperplane model before quotienting does not by
  itself prove a global simple-normal-crossings boundary after arithmetic
  identifications. C2 keeps descent and the original normal-crossings scope.
- Degree-zero pushforward or properness alone does not discharge the
  coefficient-specific higher-direct-image contract. That work remains C3/B3.

For the seventh owner, I read the complete
[Néron-model roadmap](../../../content/campaign/NeronModelsAndSemistableAbelianVarieties/README.md)
and the R11.3 decision/owner rows in [RS-25](../restructure/RS-25.result.json).
R11.3 explicitly constructs Raynaud extension and source-scoped uniformisation
with polarization and lattice conditions. RS-32 imports that local construction;
its C4 `keeps` text explicitly reserves relative cusp effectivity and universal
PEL degeneration. It does not infer a relative theorem merely from a local one.

The audit's C3/B3 and C6/O6 leads are supplier/application boundaries. B3 builds
its canonical/subcanonical coefficient extension on the actual arithmetic
boundary; O6 uses C6's Koecher and boundary-ideal geometry in its coefficient
and Hecke setting. These are not competing owners of the generic geometry.

## Consumer and graph attacks

All 30 extracted member/owner/consumer descriptions checked are literal text
in their source documents. Read the actual stages R35.5, B3/B3.general, AG2.4,
H5/R18.2, T0/T3/T6:comparison, IG.2, O6, S1/S2/S5/S6, and the additional
R28.1 height-finiteness interface. I also read all 109 campaign line contexts
selected by named-member, C-stage, toroidal, Raynaud and semi-abelian searches;
unrelated C-numbering was discarded rather than made into dependencies.

The explicit B3 C1–C6, S1 C4–C5, S2 C2–C5 (where applicable), and
S6/T6:comparison C1–C3 dependencies agree with the review's added rows.
The scope qualifiers remain attached: these inputs alone prove neither
arbitrary Hodge-type smooth integral models nor general perfectoid representability.
R28.1's moduli-height route continues through R35.6 and its existing suppliers;
C5's unchanged PEL scheme/quasi-projectivity output remains available as well.

| Narrowed layer | Direct consumers in the checked union | Missing direct supplier handoffs |
| --- | --- | --- |
| C0 | C1, C2, C3, C4 | 0 |
| C2 | C2.general, C3, B3, S2, S6, T6:comparison | 0 |
| C3 | C3.general, C5, B3, S2, S6, T6:comparison | 0 |
| C4 | C5, C6, R35.5, T0, IG.2, B3, S1, S2 | 0 |

The graph combines atlas edges, stage dependency/consumer fields, proposed-roadmap
edges and all current link packets. It has **4,440** distinct pairs before
RS-32 and **4,509** afterwards; three of the 72 proposal pairs already exist.
For each proposed source→target edge I searched for target→source reachability
in the whole union: **none**. Repeating with the links of all other accepted
restructurings gives **7,053** pairs and again no return path for an RS-32 edge.
This checks the proposal's contribution; it is not an assertion that every
unrelated edge in the atlas has passed an independent mathematical review.
All endpoints are live and non-retired. All nine member IDs survive. No decision
alters an upstream roadmap, and the Part II title names the unchanged anchor
as its first prerequisite.

## Library checks, validation and limits

Read all **102** targets and their notes in the **16** integrated reviewed audit
records for the member and anchor, including the duplicate leads. This is a
check of the evidence used by RS-32, not a fresh verification of every declaration
or every absence assertion in those audits.

Independently read and byte-verified these two load-bearing pinned source files:

- [Fan/Basic.lean, lines 78–94](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean#L78-L94):
  `Fan` contains `finite_cones : cones.Finite`, distinct from arithmetic orbit
  finiteness. SHA-256 `ec2884ef9afe244681207ee300f4a1068c5a2666114b4a1c217aa37dbecd440f`.
- [SplitTorus/Scheme.lean, lines 65–81](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/SplitTorus/Scheme.lean#L65-L81):
  `groupScheme` assumes `CommRing R` and `Finite sigma`; it is not field-only.
  SHA-256 `93da528133b53869b9b06f4a3066b1167e700063d364d1fa45ac65071c1938e9`.

Mathlib's paired pin remains `082e2d37e8b0463410cdb532e111cd43d5a66174`.
No new library-absence assertion is made. This red team did not redo the source
proofs of AMRT, Pink, Faltings–Chai or Lan: the blueprint must still state their
exact fan, base, descent and coefficient hypotheses and discharge the retained
proof leaves. Those obligations have owners and are not treated as completed.

Validation:

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-32.result.json`: passed.
- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-32.result.json`: passed.
- `python3 research/blueprint/intake.py check-files` on the two deliverables: passed.
- Independent source-text, live-endpoint, uniqueness, supplier-handoff, graph,
  pinned-source and input-immutability checks: passed.

No Lean file was required, created or compiled; no theorem is claimed formalised.
No git command was run. The accepted proposal and its review remain unchanged.
