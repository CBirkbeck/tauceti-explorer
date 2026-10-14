# NC.1 revision 2 handoff

Codex, session `codex-KnjqSB`, 2026-10-14. Job
`BP-AnabelianGeometryAndNonabelianChabauty--NC.1~2`, issue #9315.
This is a completed target-level revision, not a checkpoint or an implementation.
The packet remains `complete`; the single scoped stage
`AnabelianGeometryAndNonabelianChabauty:NC.1` remains `planned`, with G1–G4.
Every node retains `implementationStatus: unchecked`.

## What changed

The reader now agrees with all 46 packet contracts, including hypotheses,
proof routes, locators, direct prerequisites, uses, APIs, discriminatory tests
and acceptance conditions. It includes all 32 supplier requests and 34 retained
supplier-interface receipts. The two blocking reader errors are repaired:

- `completed-differential-comparison` retains the weight-zero summand in the
  completed comparison of M99 Proposition 11.3, author-copy pp. 61–62. After
  scalar completion and p-inversion, the differential projection has that
  kernel; the embedding is of its quotient. The completed differential target
  and the bound independent of finite puncture sets remain explicit.
- `prime-to-p-line-bundle` assumes the **target** family is irreducibly
  splittable, as in M99 Definition 6.3 and Proposition 7.4, author-copy
  pp. 35–36 and 44–45. The induced source and the common normal disk
  refinement retain the section and geometrically irreducible fibre conditions.

One further supplier claim needed correction. At current upstream main,
ProfiniteArithmetic §2.3 constructs an outer action; it does not state the
centre-free extension pullback or the corresponding restriction bijection.
The packet, reader, G4, reuse notes and fifth restructuring proposal now request
that additional theorem from **ProfiniteArithmetic, Part II**, reusing its
Aut/Inn/Out and topology. The `geometric-outer-comparison` node explicitly
assumes centre-free, topologically finitely generated profinite geometric
kernels and asks for a continuous inverse. T97 §7A, Lemma 7.1, p. 188 gives
the mathematical pullback argument. This is the only node whose payload changed
from the reviewed packet; no node id was changed or removed.

The historical `review` object is preserved exactly, as this issue requires.
Its claim that §2.3 already supplies the pullback is historical, not the revised
supplier contract. A new independent reviewer must assess this correction and
the synchronization; this revision supplies no independent-review verdict.

The 2026-10-12 shape in WORKERS and PACKAGE_REVIEW supersedes the original
instruction to force every planned geometric carrier into Suggested. The file
now has 395 lines, five native interfaces, 16 API signatures and nine examples.
Relative projection/kernel identification and unique factorization are stated
as existence milestones. Chosen projections, lifts and composition are reader
API targets. The omission ledger retains the other 37 APIs, 24 tests, six
geometric objects and all 35 theorem/comparison targets with their packet ids.
No geometric carrier is invented and no data definition is filled by an
admitted term. The full geometric contracts stay in the reader at packaging.

## Checks of the reviewer's in-place corrections

All 27 corrected nodes were checked against the original source locators and
the actual supplier boundaries. The 19 other nodes and their accepted ids were
retained. The main correction groups and their evidence are:

| Nodes | Evidence and contract checked |
| --- | --- |
| `relative-pro-p` | M99 §0, pp. 14–16; the pinned pro-p functoriality and native quotient APIs. Complete only the geometric kernel, retain the entire base, qualify projection surjectivity and compact Hausdorff kernel identification, and retain unique continuous factorization. |
| `log-admissible-system` | M96 Definitions 2.1, 2.4, 2.5, 2.7, Lemma 2.6 and Corollary 2.8, pp. 580–585; M95 §§3.3–3.13, pp. 18–25. Correct labels and distinguish invertible node indices from invertible total degree. |
| `finite-field-decomposition`, `linear-system-addition`, `finite-field-tame-isom` | T97 Proposition 2.8, Lemma 2.9, Corollary 2.10 and §§3–4, pp. 151–175. Correct Proposition/Lemma/Corollary/Remark/Claim labels; retain all-cover recovery, valuations, principal units and possible constant-field automorphisms. |
| `sturdy-cover`, `component-recovery`, `node-branch-recovery`, `thickness-log-gluing` | M96 Definition 1.1, Lemma 2.9, Propositions 3.1, 4.1–4.2, 5.1–5.2, Corollaries 5.3–5.4, Proposition 6.1, Lemmas 6.2–6.3 and Proposition 6.4, pp. 574–600. Correct labels, ordinary-special-quotient inputs, branch incidence and the December 2012 incidence-kernel correction. |
| `finite-field-log-isom`, `local-admissible-recovery`, `degree-normalization` | M96 Theorem 7.2, Propositions 8.1–8.4, Lemma 9.1 and Theorem 9.2's cover argument, pp. 600–619. Use the tame base, StableReduction Layer 7's curve/Jacobian criterion and an independent cover producing a graph loop before trace/pairing comparison. |
| `number-field-isom` | M96 §10, pp. 624–626; current R09.2 Hom/Isom representability. Finite unramified loci and shrinking to finite étale need the hyperbolic-curve specialization, not blanket representability. |
| `weight-zero-quotient`, `j-geometric-section`, `nondegenerate-section`, `arithmetic-chern-comparison` | M99 §§2–4 and §9, pp. 20–30 and 47–50. Correct P8 ownership, Definition 4.3, and geometric trace/duality inputs. Keep actual Picard/Kummer objects, twists, the proper-curve cup relation and the integral nondegeneracy target. |
| `geometric-splitting`, `open-map-j-geometric` | M99 Propositions 4.4, 5.1 and 5.4, pp. 30–34. The universal family is the fine level scheme supplied by MC.4; relative comparison is requested from P8. J-geometry alone does not yield a curve point. |
| `prime-to-p-line-bundle` | M99 Definition 6.3, Proposition 6.5 and Proposition 7.4, pp. 35–45. Target splittability and actual Kummer p-division are retained. |
| `completed-differential-comparison`, `canonical-relation-vanishing`, `inertia-and-regularity` | M99 Lemmas 11.1–11.2, Proposition 11.3, Propositions 13.1–13.4 and §14, pp. 57–73. Retain completed scalars, the weight-zero kernel, the particular node/graph Q-Cartier calculation and relation vanishing in every degree. Normality alone does not prove the graph calculation. |
| `canonical-effectivity`, `finitely-generated-hom`, `sub-p-adic-hom`, `full-profinite-hom` | M99 §§14–16, pp. 71–80 and 85–87. Correct the centre-freeness dependencies, R09.2 ownership and relative-pro-p edge. Keep dominant Hom loci, fixed arithmetic bases and recovery on all finite covers, including non-p covers. |

The native Suggested statements were also checked mathematically: relative
conjugators lie in the target kernel; tower cofinality exposes its fixing
hypothesis; canonical multiplication factors through its image, without an
assumption of surjectivity. The generic adapters do not assert realization as
étale curve groups or canonical section spaces.

## Sources and baseline receipts

All seven public PDFs were fetched again and matched the seven hashes in
`sourceVersions`. No new source version, private text or verbatim passage was
put in a deliverable. The reader records the URLs, hashes, dates and selected
readings: M96 pp. 574–619 and 624–626; M99 author-copy pp. 14–16, 18–80 and
85–87; T97 pp. 144–175 and 188–189; M95 author-copy pp. 18–25; all three
correction notes in full. These are checks of target and proof locators, not
claims to have re-read each whole paper. The three source issues are retained:
dominant Hom restriction in M99's finiteness proof, M96's corrected incidence
kernel and the weak node-index bound in M95. M95's August 2017 comments do not
correct that bound. No source required for this revision remains unread.

The ten baseline declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. They supply continuous maps and
equivalences, quotient lifting, the pro-p kernel/quotient and its two
functoriality results, stabilizers and linear kernels. Elaborating Suggested
used the shared pinned build, with more than 20 GB available; no library build,
update, cache fetch or language server was run.

Current upstream was checked read-only at TauCetiRoadmap commit
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. ProfiniteArithmetic and
AlgebraicCurves reader documents were read in full and their relevant Suggested
interfaces inspected. StableReduction and ProfiniteCohomology supplier
boundaries were checked. The reviewed audit, parent packet, stage edges,
campaign document and tier order were read. No link/overlap/request entry in
the link packets names an NC stage; catalogue screens mentioning the roadmap
are not dependency contracts.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnabelianGeometryAndNonabelianChabauty--NC.1.json`: zero errors and warnings.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty--NC.1.lean`: passed.
- `lean-check research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty--NC.1.lean`: elaborated; exactly 20 admitted-proof warnings, no other warnings or errors.
- An errata-v1 wrapper of the three retained source issues and seven versions passed `scripts/check_errata.py`.
- Mechanical coherence checks covered every reader contract field, all 53 APIs and 33 tests, 32 requests, 34 receipts, four gaps and five ownership proposals. The live Lean declarations and omission ledger partition the API/test obligations exactly. All 86 internal prerequisite edges form an acyclic graph. Node ids, unchecked statuses and the entire prior review object match the input.
- Submission path check and `git diff --check`: passed for the four authorized deliverables.

Totals: 46 nodes (eight definitions, three constructions, 33 theorems, two
comparisons), 53 API items, 33 discriminatory tests across 11 objects, six
planets, ten pinned baseline declarations, 32 structured requests, four gaps.
The additional unindexed ProfiniteArithmetic extension is recorded separately
in G4/restructure, not counted as a fictitious indexed request.

## Where the next worker resumes

The next step is independent review of this revision, especially the two
formerly contradictory reader contracts, compact Suggested shape and the new
ProfiniteArithmetic supplier qualification. The old `needs_changes` object
must be replaced only by that reviewer.

Implementation closure requires G1's geometric realizations; G2's relative/log
and uniform integral comparison from P8 and R07.1; G3's pro-p effacement,
completed coefficients, inverse limits and arithmetic Hochschild–Serre;
and G4's exact effectivity, centre and geometric supplier extensions. A scalar
Hodge–Tate decomposition or full profinite K(π,1) theorem does not close these
stronger contracts.

Before assembly, enforce all five ownership proposals: extend
ProfiniteProPGroups for centre-freeness; extend IG.5 for invertible local
ramification indices; separate the independent two-step Malcev/cup-relation
foundation from the NC.2 applications; extend ProfiniteCohomology for completed
coefficients and Hochschild–Serre; and extend/index ProfiniteArithmetic for
centre-free extension reconstruction. The accepted NC.2 `central-quotients`
node concerns unipotent group-scheme quotients; it does not by itself give the
relative geometric pro-p Malcev/cup comparison needed here. Its reuse must
preserve the earlier-foundation split and avoid a stage cycle.

Place the existing FunctionFieldArithmetic reciprocity supplier below NC.1
before upstream packaging, since it is outside the current 94-roadmap tier
list. Keep the exact R09.2 dominant Hom/Isom specialization, MC.4 fine family,
StableReduction Layer 7 criterion, generalized-Jacobian extension and regular
disk-completion comparison as explicit supplier contracts. No parent, supplier,
tier, atlas-data or upstream file was edited by this revision.
