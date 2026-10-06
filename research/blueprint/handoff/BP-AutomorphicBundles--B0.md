# Handoff: BP-AutomorphicBundles--B0

Codex — `codex-zI7WN2`, 6 October 2026. Refs #680. Winning claim comment
[6013998429](https://github.com/CBirkbeck/tauceti-explorer/issues/680#issuecomment-6013998429)
was confirmed by the claim bot; the issue was reread before work began.
This replaces the September checkpoint with a **complete target-level pass**
under PROTOCOL §0. All eight scoped stages are planned; none is closed.
Every implementation status remains unchecked.

## Deliverables and coverage

The packet, reader document and suggested file agree on the following targets.
The three reviewed legacy IDs are preserved and refined, including the canonical
extension ID whose subcanonical construction now has its own node. B5, the
integrated decomposition, campaign files, ownership data and other packets were
not edited.

| Stage | Nodes | Coverage | Exact open boundary |
| --- | ---: | --- | --- |
| B0 | 9 | planned | Generic torsor/associated-bundle supplier; central quotient and representation interfaces; ineffective arithmetic centre; typed geometric carriers |
| B1 | 10 | planned | Absolute-Hodge CM proof, tensor frames and generic interfaces; period torsor and continuous effective descent; typed signatures |
| B1.general | 6 | planned | Corrected second-jet injection and adjoint/rank-one reduction; normalized period-torsor conjugation and effective descent; typed signatures |
| B2 | 9 | planned | Associated-bundle and full-group local-system/connection interfaces; representation conventions; Siegel analytic/solid comparison; AG integral CM tower; typed signatures |
| B2.general | 3 | planned | General full-group realization descent and rational Betti weight condition; typed signatures |
| B3 | 10 | planned | Canonical chart construction/gluing, logarithmic boundary comparison and rational descent; coherent section foundations; typed signatures |
| B3.general | 3 | planned | General-data canonical extension without an unspecified universal abelian family; regular singularity and functoriality; typed signatures |
| B4 | 18 | planned | Local analytic growth and proper coherent section foundations; actual group/weight descent and explicit coefficients; rational Hodge–Tate/VB Tate normalization; typed signatures |

Counts: **68 nodes** (21 constructions, 24 theorems, 15 comparisons, four
definitions, four lemmas), **82 API entries**, **80 unit-test records**, **27
planets**, **23 baseline declarations**, **12 gaps**, **31 supplier requests**.
There are 153 internal node prerequisite edges, 56 stage edges, 14 existing
blueprint-node edges and 27 baseline edges. API entries promoted to theorem
nodes are not additional API objects. All construction/definition nodes have at
least three discriminating tests. Every stage has a precise nonempty remaining
list; no gap or request was treated as discharged.

## Checks executed

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicBundles--B0.json`
  passed against the supplied pinned declaration index: **zero errors and zero
  warnings**. The pinned statements were read, rather than inferred from the
  index. The generated `SlashAction.slash_mul` field is covered by its indexed
  parent class; Lean also checked the field itself.
- `lean-check research/blueprint/suggested/AutomorphicBundles--B0.lean` passed:
  **exit zero, only declaration-uses-placeholder warnings**. Memory was checked
  before compilation and exceeded 20 GB available. The shared build has the
  exact Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`. Its Tau Ceti
  checkout differs from the programme pin, so the prototype deliberately imports
  only individual Mathlib modules, not Tau Ceti modules. No Tau Ceti elaboration
  at a different commit is claimed. The programme Tau Ceti pin remains
  `f790474821cf4256814db967cb154e7af3d0c369` and its source was accessed at that
  commit for the roadmap/interface audit.
- All 12 downloaded PDFs matched the fresh SHA-256 receipts recorded in the
  packet. All 100 short node excerpts occur literally after whitespace
  normalization in the downloaded text. This is an excerpt-presence check, not
  a proof that each source entails its proposed target. Locators and matches
  state where an item is a deduction or only a specialization.
- Every node, API and test name occurs in both the document and suggested file.
  This includes the prose inventory; name presence does not imply a typed
  geometric signature exists.
- A conservative stage dependency audit combined the atlas stage edges with the
  packet's direct dependencies. No scoped stage had a reachable return path.
  The packet validator separately checked its node dependencies. This does not
  certify unimplemented future supplier additions or all unrelated atlas graphs.
- The inherited exact GL2(F3) sanity program was rerun. Across the representation
  factor and point-dependent frame factor, all 41,472 left-cocycle checks,
  41,472 inverse-base checks and 373,248 pointwise slash-composition checks passed.
  It detected 14,904 failures of the unshifted cocycle and 222,912 failures each
  of the wrong inverse order and the operator without inverses. These finite
  families test the convention, not arbitrary coefficients or the Lean proofs.
- Submission file validation and whitespace checks are recorded in the pull
  request. Only the four authorized deliverables are included.

### Precisely what elaborated

The executable slice retains the checkpoint's actual SlashAction constructor,
evaluation/invariance/scalar/equality API, inverse-base cocycle and nonzero-section
cancellation guard, eight examples and five private concrete helpers. It adds a
functional normalized automorphy-factor structure with its gauge-change API,
arithmetic Hilbert weights with actual integer parity equations and determinant
exponents, and global sections of a supplied `Scheme.Modules` coefficient.
There are 13 typed examples in total. Their proofs are placeholders and remain
unproved.

The file **does not elaborate** canonical Shimura torsors, compact-dual
coefficients, boundary extensions, general local-system carriers, the geometric
form spaces with all their identifying conditions, or their 80 planned test
signatures. The precise named contracts are comments and the packet has an
explicit typed-signature gap. The functional factor omits holomorphy; the supplied
section type omits unavailable Shimura/canonical-extension conditions. No fake
proposition carriers, invented axioms or arbitrary geometric surrogates substitute
for those missing interfaces. A follow-up must turn the contracts into actual
signatures on the supplier carriers before any geometric closure claim.

## Supplier contracts and structural action

The packet's 31 `requests` give exact statements and `neededBy` node IDs. They
are recorded requests, not edits to other roadmaps or messages to their workers.

- AlgebraicModuliForArithmeticGeometry R09.5 supplies finite/tame coarse
  descent. Its R09.3 fpqc quasicoherent descent node is imported directly;
  local-freeness descent still needs the stronger interface. Neither alone
  constructs representable principal/associated bundles or removes an infinite
  ineffective arithmetic centre.
- AbelianSchemesAndArithmeticModuli A4 supplies degree-one family realizations
  and comparisons; PELModuli M0/M3/M5 supplies the actual PEL family,
  eigensummands and coefficient constructions. A4 is not cited as proving
  absolute Hodge cycles.
- ShimuraVarieties V3–V8 and V8.general supply actual level maps, CM reciprocity,
  canonical models, abelian/general reduction and coefficient towers.
  ShimuraData D3's compact dual, filtration parabolic, reflex-field flag form,
  Borel embedding and homogeneous variation nodes are imported directly.
- ShimuraCompactifications C1–C6, C2.general and C3.general supply actual
  minimal/toroidal models, cusp charts, semi-abelian degeneration, good-base
  PEL integral input and fan maps. They do not automatically prove canonical
  coefficient extension or the logarithmic dictionary.
- ComplexComparisonPartII C0/C2 supplies analytification and proper GAGA;
  AlgebraicModularFormsAndSerreWeights R15.1 supplies geometric GL2 forms.
  HilbertModularVarietiesAndShimuraCurves H0–H4 supplies the actual Hilbert
  groups, family and finite polarization-unit quotient.
- Upstream ClassicalGroups layers 2/3 supplies complex classical Schur and
  highest-weight results. General nonsplit rational groups, coefficient-field
  descent and integral Schur sheaves are explicitly beyond that input.
- The B5 request records the exact BCGP GSp4 four-term Hodge–Tate decomposition
  and its cuspidal version as a downstream consumer. Its `neededBy` list is
  empty: it is not a prerequisite of B1–B3. T2/T6 likewise consume these
  coefficients and were not reversed into early prerequisites.

The structural proposal assigns a genuinely missing associated-bundle extension
stage to the reductive-group direction. ReductiveGroupsPartII RG2.0–RG2.5 has
no covering principal-torsor/contracted-product stage. No stage ID was invented.
The maintainer must assign the actual scope; AutomorphicBundles keeps its
Shimura-specific coefficients, canonical models and boundary comparisons.
The current packet does not duplicate this generic construction privately.

## Source and audit evidence

WORKERS, both protocols, UPSTREAM_GUIDE and BROWSER_AGENTS were followed.
The complete campaign document, accepted integrated decomposition, library-audit
entries for all eight stages, relevant accepted RS-02/RS-14/RS-32 entries,
matching atlas links, reserved IDs and supplier statements were read. The two
upstream model documents read in full were ReductiveGroups and HodgeStructures.
The routed AG, CS and BCGP source items are individually accounted for under
`routedSourceCoverage`.

The packet records exact public URLs, accessed editions, fresh digests and
read sections for all 12 sources:

- Milne, corrected 2018 author revision of *Canonical models of (mixed) Shimura
  varieties and automorphic vector bundles*: III §§1–8, pp.52–64, and V §6,
  pp.90–91. The connected-bundles author copy: Proposition 3.9, Theorem 3.10,
  Corollary 3.11 and §§7/9, pp.18–20, 29–31, 33–34.
- Lan's public introduction: §4.2.7, pp.49–50, with visual confirmation of the
  actual p.49 cocycle; §5.3, pp.63–64.
- Andreatta–Goren–Howard–Madapusi Pera, Annals version of record: §§3.3–3.5,
  pp.418–422. Caraiani–Scholze, Annals version of record: §§2.2–2.3,
  pp.666–671.
- BCGP, arXiv 2502.20645v1: §§3.2.13–19, pp.44–45; §4.5, pp.72–74 and
  77–78; §§4.8.1–2, pp.101–102. The copy is explicitly a preprint, not
  a claimed journal collation.
- HLTT author manuscript: introduction pp.2–4, §3.4.1 pp.109–110 and
  Appendix B.8 pp.270–271. Harris localization author copy: §1.4, pp.10–11.
- Harris's course notes 4fibres and 8logarithmique were read in full;
  7torique pp.1–4 and the start of p.5 were read. Findings are scoped to those
  notes, not to the published Harris–Phong or toroidal theorems.
- Deligne, revised author copy of *Hodge cycles on abelian varieties*:
  Main Theorem 2.11 and Principle B, pp.19–21; Proposition 3.1 and Remark
  3.2, pp.22–23; Proposition 6.1 and its completed proof, pp.41–42.

Source proof work still missing is precise: Deligne's intermediate CM argument
in §§3–5 was not decomposed; Harris's corrected 1985 second-jet proof was not
freshly read; the full Deligne–Harris canonical/logarithmic boundary proof was
not decomposed; BCGP's cited RC22 Theorem 4.2.1 remains a rationality comparison
input requiring its own reading. These are recorded refinements, not proofs
silently supplied by references to variety-level models.

Five `sourceIssues` record the known Lan omitted shift and four course-note
findings (the excluded logarithmic exponent, mixed rapid/slow resolution,
missing Cauchy–Green boundary term and arbitrary-cone orthant claim).
Their reasons, corrections, versions and correction searches are recorded.
[Harris's annotated errata](https://www.math.columbia.edu/~harris/website/content/12-errata-publications-list-links-here/errata.pdf)
was consulted for the historical jet, continuity and Dolbeault issues. The new
course-copy findings have no independent verdict from this worker and await
review. No source text or PDF is included in the repository.

## Follow-up work

The pass stops because all eight target stages are planned, as required by
PROTOCOL §0, rather than because the time limit was reached. Independent review
must assess the mathematical statements, ownership, source findings and the
explicit limitation of the suggested file. Each accepted open stage needs a
follow-up that resolves its listed requests/gaps, decomposes the named missing
proofs at the required granularity, and replaces its geometric contract comments
with actual typed API/test signatures. The current packet is complete as a
planning pass and remains open as mathematics and interface refinement. There is
no next job claimed by this session and no scratch file needed to resume it.
