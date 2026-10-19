# Handoff: independent Hitchin mirror design review

Job `REV-DESIGN-TopologicalMirrorSymmetryForHitchinSystems`, issue #3621.
Codex session `codex-tSfAVq`, 19 October 2026. **Complete; accepted planning
pass.** Bot confirmation:
https://github.com/CBirkbeck/tauceti-explorer/issues/3621#issuecomment-6260187096.
The design was by the independent session `codex-CFlcUI`.

## What is complete

The [review report](../reviews/REV-DESIGN-TopologicalMirrorSymmetryForHitchinSystems.md)
records the scope, all corrections, exact baseline boundaries, source
readings, supplier checks and validation. The packet now has a top-level
accepted review with 44 individual checks: 43 verified and one corrected.
All 29 source findings have independently confirmed verdicts with reasons
scoped to the published locators. Prior extraction-review and search
provenance is retained separately.

Corrected `TMS.1/relative-splitting` acceptance and three API entries: Gm
differences are line bundles; μr differences retain μr-torsor data and the
rth-power trivialization. Added the real μ2-torsor check in both packet and
reader. Counts are now 44 nodes, 83 API items, 57 definition checks, 32
planets, 27 requests, three supplier contracts and twelve gaps. No node or
baseline citation was added or removed. The current completed-Hodge reading
path and pending-review metadata were corrected. The roadmap JSON and the
Suggested Lean file were checked and needed no edits.

All nine exact baseline statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Current upstream read-only
checks used roadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27`
and library commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Completed/HodgeStructures and AlgebraicVectorBundles readers were read
fully, with relevant Suggested declarations and ownership searches. Their
existing theory remains imported.

The four public primary PDFs were fetched independently and match every
recorded hash: GWZ20's published DOI PDF; HT03 math/0205236v1; Ito
math/0211378v3; Bittner math/0111062v1. Public URLs, exact versions,
theorem/section/page locators and hashes remain in the packet and reader.
The report extends the reading receipt to every source-finding locator.
No private text, source passage or PDF is committed.

## Remaining mathematics and routing

All six stages stay **planned**, none closed, all implementations
**unchecked**. This review leaves no unfinished review step. The accepted
plan deliberately retains these twelve obligations:

| Gap | Next work |
|---|---|
| G-ETII | Register generic integration/transgression owner; discharge action-groupoid, tame orientation, weighted trace and the E15/E16 proof repairs under the actual root bound. |
| G-MHS | Register geometric MHS owner separately from the existing nonabelian Hodge Part II; construct compact-support and finite-monodromy realizations. |
| G-Groth | Supply equivariant Bittner/weak-factorization interface in LD.3. |
| G-HT | Supply equivariant fractional period realization, specialization and character projectors through CP.3. |
| G-unitary | Extend H.1 to the rank-one family-coherent unitary/Pic0 comparison. |
| G-local | Extend R02.4 from characteristic zero to prime-to-p equal-characteristic local duality. |
| G-moduli | Supply relative general-D fixed-determinant Higgs existence/properness and the spectral/Picard/codimension certificates. |
| G-lowgenus | Treat the full genus range separately where the generic stable spectral torsor certificate fails, especially g=1,D=ω,n>1. |
| G-HT-descent | Prove coherent arithmetic descent and degree-power dependence of Hausel–Thaddeus μn-gerbes and both splitting torsors. |
| G-Kummer | Prove any extra Pic/n vanishing needed for literal μn-neutrality; the sufficient local-Brauer mirror comparison does not depend on this stronger condition. |
| G-Higgs-purity | Extend CB.9 to fixed determinant/general D and canonical fixed-sector torsor-cover cohomology with MHS and integral symplectic age. |
| G-Galois | Supply a geometric comparison or semisimplicity plus valid degree separation for the stronger actual fibrewise representation target. |

The 27 existing supplier requests and three contracts specify consumers and
exact extensions. Their referenced 24 distinct supplier nodes and twelve
broader stage specifications were checked. No supplier file or generated
atlas data was changed. Primary Nitsure/Faltings and Ngô proof closure is
still part of the stated supplier obligations, not a claim of this review.

## Checks and submission

- `python3 scripts/check_blueprint.py research/blueprint/packets/TopologicalMirrorSymmetryForHitchinSystems.json`:
  **0 errors, 0 warnings**.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/TopologicalMirrorSymmetryForHitchinSystems.lean`:
  **passed**.
- Source-issue/version schema and all packet/reader node-content, review and
  routed-item membership checks: **passed**.
- `lean-check research/blueprint/suggested/TopologicalMirrorSymmetryForHitchinSystems.lean`:
  **exit 0**, exactly 15 expected `sorry` proof warnings and no other warnings
  or errors. Memory checked first: 83 GiB available. No background compiler
  remains; no language server or library build ran.

Only the packet, reader, review report and this handoff change. Submission
uses a branch beginning `codex-tSfAVq` and `Refs #3621`. The run records its
PR URL in the external job receipt, deletes disposable scratch after opening
the PR, and stops without claiming another issue. The durable source
receipts, checks and remaining mathematics are all preserved here and in the
reviewed deliverables.
