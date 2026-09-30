# FIX-RT-RS-06

Codex · `codex-5ebb6f` · issue #5044 · 2026-09-30 · complete repair.

The single confirmed medium finding, `RT-RS-06/1`, is fixed in the
restructuring proposal and its reader. The revision awaits a new independent
review before promotion. This completes the component-routing fix; it does
not complete the mathematical blueprints or close their source gaps.

## /1 — Preserve the mixed source node and route its components

Replaced the classification-only migration row for
`ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`
with five explicit source-linked component contracts in the JSON and reader:

| Source component | Owner and phase |
| --- | --- |
| Dickson classification and KW Lemma 6.1 | `ArithmeticGaloisRepresentations:R01.4`, early image prefix; retain the finite-field, irreducibility, solvability and characteristic-two conditions. |
| KW Lemma 6.2(i), odd-characteristic modularity construction | `GL2AutomorphicRepresentationsAndTransfer:R17.5`, using the existing monomial/soluble Artin modularity contract after the image result. |
| KW Lemma 6.2(i), characteristic-two modularity construction | `GL2AutomorphicRepresentationsAndTransfer:R17.6`, retaining the Serre-trick/Wiese branch and its actual coefficient/lifting/ramification conditions. |
| Exact classical weight and level | The applicable `SerreWeightAndLevelOptimisation:R20.2`, `R20.3`, `R20.4` contracts, assembled at `R20.5` after a modularity witness; retain the assigned Wiese Theorem 1 dihedral dyadic refinement and the separate Buzzard/Q(i) contracts. |
| KW Lemma 6.2(ii) / DP Lemma 1.14 weight calculation | `AlgebraicModularFormsAndSerreWeights:R15.4/bad-dihedral-normalized-weight-application`, a named application after the R01.4 image prefix and R15.4 local recipe prefix. |

The original stable node remains an aggregation/source alias. Its full
statement, hypotheses, source matches, proof steps, acceptance, implementation
status, review history and every incident reference must survive component
integration. The original reviewed packet is byte-for-byte unchanged. The
JSON records that packet's hash and lists the fields to preserve. Neither
classification nor modularity is re-planned at R27.1.

Added the weight application to R15.4's retained construction, with one
ownership slice and one scoped R01.4 → R15.4 supplier link. Its contract
records S-type, odd characteristic `p >= 3`, normalized
`2 <= k(rho-bar) <= p+1`, cyclotomic-restriction reducibility, and the
bad-dihedral identification through the existing image owner. It names
the two KW weight possibilities and the DP niveau-one/two labels, includes
the proof route, planned theorem interfaces, arithmetic specializations and
negative controls. A normalized twist must establish its own hypotheses;
the assertion is not extended to an arbitrary unnormalized weight or to p=2.

This is a proposed blueprint application inside an existing stage, not an
integrated new stage or a completed packet node. Its `proposedNodeId` makes
the destination concrete for the owning blueprint. It reuses the existing
weight and bad-dihedral definitions. The narrowed layer's `suppliedBy`
list continues to describe its original removed mathematics; the new
direct edge feeds the added application and does not impose that application
on all old recipe consumers.

Corrected the `ClassicalSerreModularity:gaps[4]` migration: the unread
Ribet Proposition 2.2 boundary follows the named weight application,
with R01.4 supplying image identification. The original gap's details and
`neededBy` alias remain authoritative. DP's fuller proof does not silently
close the Ribet source action. Reading KW also does not establish the cited
Serre/Wiese inputs: the modularity/optimisation owners must read their proofs.

Added a phase guard to the reader. No R17 modularity, R20 refinement or final
Serre theorem enters early R01.4 or the R27.1/R33.2 image prefix. No late
R27.4 scalar-dyadic completion becomes an early R20.5 premise. Existing
supplier links and all 74 layer decisions retain their earlier scope;
only R15.4's named application is added. Counts are now 89 owner slices and
596 links.

Archived the former accepted review, verbatim, under `reviewHistory` and set
the current review to pending for `REV-FIX-RT-RS-06`. This repair makes no
independent verdict on itself and does not change the promoted `data/`
proposal or any base campaign document.

## Evidence inspected

Base: `acff23dea53b8cf950b2ac4009b5ad99e07ca216`. Read the complete finding
and confirmed verifier verdict; the original mixed node and gap; the
affected source ledger, layer/owner/import contracts and phase table; and
the actual R01.4, R17.5/R17.6, R15.4/R15.6 and all R20 stage descriptions.

Fresh public primary-source reading on 2026-09-30:

- Khare–Wintenberger, *Serre's modularity conjecture (I)*,
  [author's preprint](https://math.ucla.edu/~shekhar/papers/results.pdf):
  S-type and weight conventions on p.2; Section 6's Dickson paragraph,
  Lemma 6.1 and Lemma 6.2 with both proofs on pp.10–11. Checked the
  p.11 page image. PDF SHA256:
  `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82`.
- Dieulefait–Pacetti, *A simplified proof of Serre's conjecture*,
  [arXiv:2108.07577v2](https://arxiv.org/pdf/2108.07577v2):
  Definition 1.12, Lemma 1.13, normalization paragraph, and Lemma 1.14
  with proofs on pp.7–9. Checked the p.9 page image. PDF SHA256:
  `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6`.

Both PDF hashes match the original source register. The reviewed source
packet hash remains
`53c3f399ec1077dde93486dbf91f7ee9bf2b17dc28c874268c377433d6383131`.
The sources are read only over the passages listed here. No fresh reading
of Ribet Proposition 2.2, Serre Proposition 10, Wiese Lemma 2/Theorem 1,
or the original proposal's other primary sources is claimed.

Read the relevant reviewed `data/library-coverage.json` entries from
AUDIT-31 (R01.4), AUDIT-14 (R17.5/R17.6), and AUDIT-13 (R15.4), including
their existing algebraic carriers and duplicate-owner boundaries. R20.5
has no entry in that generated reviewed map. A targeted search of both
pinned source trees for bad-dihedral, Serre weight, Dickson and
Langlands–Tunnell spellings produced unrelated Dickson-name hits; this is
not an exhaustive absence proof. The fix relies on already assigned owners
and makes no new claim that a cited Lean declaration implements these
advanced results. Mathlib/Tau Ceti pins remain 082e2d3/f790474.

## Validation

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-06.result.json`:
  no errors.
- `python3 research/blueprint/intake.py check-files` on the three deliverables:
  no problems.
- Conservation comparison against the base: all eight roadmap decisions,
  74 stable layers, original 595 links, original 88 owner slices, and all
  83 source-node ledger IDs retained. Every other layer decision is
  unchanged, the original source packet and gap remain byte-identical,
  and the historical accepted review is preserved verbatim.
- In-memory production-assembler simulation replacing only the promoted
  RS-06 proposal: 2,840 stages / 8,255 distinct edges before, 2,840 /
  8,256 after. Exactly R01.4 → R15.4 is added, no edge is lost, and the
  new source appears in the consumer's `requires`. Both complete graphs
  are acyclic across all 2,891 endpoints, including external proof nodes.
  The added edge is not among the proposal's 29 skipped UPSTREAM links.
- The fine source-phase graph is acyclic; negative controls reject an
  odd- or dyadic-modularity-to-image reverse edge and a late-scalar-to-early-
  optimisation reverse edge. These are structural checks, not proof closure.
- Promotion eligibility rejects the current pending review; the simulation
  is scratch-only and changes no promoted data.
- JSON validation, exact deliverable scope and `git diff --check` pass.

The official restructuring checker does not validate the additional
component-contract fields; these were checked against the sources and
conservation/phase controls above and require independent mathematical
review. No Lean compiled: this fix has no Lean deliverable and no library
build was started. Scratch sources and checks are removed after submission.
