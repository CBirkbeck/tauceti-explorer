# REV-PKG-TropicalAndBerkovichArithmetic — completed review

Issue #10910. Agent: Codex. Session: `codex-lYNq4v`. Date: 2026-10-20.
The claim bot confirmed this session's claim; the package was written by the
independent session `codex-Ey3gzr`. Verdict: **accepted with corrections**.
Only this one job was claimed.

The package README, review.json and independent report are the deliverables.
Suggested.lean and metadata.toml are unchanged. The accepted packet was read
and checked, never edited. The report contains the 15-source sample, both
previously unverified original-source checks, an adversarial row for every
one of the 103 targets, the ownership audit and 12 Lean-signature comparisons.

## Mathematical corrections

- Gelfand evaluation lands in the bounded residue-field product, with finite
  supremum norm. Zero-ring isometry and nonzero maximum attainment remain
  separate.
- Radius-zero Gauss point is a closed analytic subspace; only positive radii
  use the Tate-algebra disc-domain construction. Tate universal evaluation
  now specifies the target norm, completeness, nonarchimedean inequality and
  contractive scalar map.
- Multiplicity-one canonical lift uses positive relative multiplicity. An
  isolated tropical vertex has many arbitrary isometric singleton lifts;
  unrestricted uniqueness needs a graph without isolated vertices.
- Schottky group/action hypotheses replace a circular figure definition.
  Genus-zero trivial group has empty limit hull; the hull-skeleton formula
  applies to positive genus.
- Nonsplit nodes use stable geometric genus. Chosen-graph nodes and canonical
  nodes are distinguished. The compact minimal-node triangulation requires
  nonempty nodes, not just a nonempty skeleton: a split Tate circle has none.
  General prescribed-vertex triangulation over complete fields is stated
  separately and supplies the ℂ_p integration covers.
- Exact ℂ_p residue harmonicity now uses the wide-open Cauchy theorem. The
  reduction-only argument failed for `p·dt/t`; inversion negates residues
  and both ends of a loop are counted.
- Strengthened the topology, empty-mark vertex-set, hybrid monomial and
  model-measure checks with explicit computations or failed alternatives.
  Corrected source labels/pages and removed stale research-status wording.

Original sources resolving the author's limitations: the BPR published
Offprint, Definition 3.1/Lemma 3.2 pp. 101–102 and Corollary 4.23 p. 112;
Huber (1994) Proposition 4.5(iv) p. 543, read in the original cleared scan.
That proposition is categorical equivalence, not properness. The latter uses
Zavyalov Appendix A. Huber (1996) pp. 313–314 and 422–425 were also read in
place. New residue locators are Coleman, Proposition 4.3 p. 226, and de Shalit
§0.3 equations (0.11)–(0.13) pp. 327–328. Ducros §§4.5.2, 5.1.12–14 and
5.4.12 pp. 271, 292–295, 318–320 supply the stable-genus and triangulation
corrections. No cleared source or source passage was copied.

## Ownership and build order

All 103 target names, 192 original API names and 131 original check names
remain. Every one of 41 definition/construction targets has at least three
checks. No exact duplicate requiring a target deletion was found against the
current roadmaps or library. Existing native seminorms, the power trick,
rank-one coarsening existence, restricted Gauss multiplicativity, algebraic
Riemann–Roch, nodal multigraphs and algebraic Tate curves remain imports.

Current upstream roadmap commit:
`0d144d044dacebca17b654695b6f1ad58f159b27`.
Current Tau Ceti commit:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The search included all nine newer roadmaps and every Completed roadmap,
using mathematical objects and hypotheses, with relevant declarations read.

Corrected the Néron boundary after reading its existing package:
R11.3/rigid-uniformisation already provides the complete-DVR analytic quotient,
and R11.4/graph-monodromy supplies the DVR pairing. They are imported rather
than requested anew. The requested R11.3 extension covers arbitrary complete
rank-one bases, split descent, valuation kernel and lattice. The comparison
with arbitrary-real-length skeleta and the analytic Abel–Jacobi square remains
here. General-field toric embeddings stay AnalyticToricGeometry, Part II;
rank-one model intersection/projection stays the explicit SF.5 extension.
The report records where all 22 inherited proof obligations are planned.

Local prerequisites now precede their consumers. Two targets changed layers:

- Old §0.31 connectedness → §1.4, following path geometry.
- Old §6.8 Tate measure calibration → §7.2, following the Tate quotient.

The other changes in order are within layers. Target/API/check identifiers
were preserved and local links were updated. Reduced-divisor construction
and graph-part continuity now precede finite tests and Riemann–Roch.
General proper analytification/GAGA belongs to §0.22; it does not depend on
the later strict adic equivalence. General preadic real quotients use the
gauge and rank-one quotient inputs directly.

No inter-roadmap target was moved upward. The roadmap is outside the
Caraiani–Newton 94-roadmap order. No FoundationsAndLibraryIntegration or
UPSTREAM pseudo-supplier remains, and later perfectoid/diamond/dynamical
consumers are not used as prerequisites.

## Verification and next action

- `lean-check` on the unchanged 130-line Suggested.lean exited 0 against
  Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. Exactly seven warnings,
  all `declaration uses sorry`; all four examples proved. Available memory
  exceeded 20 GB before compilation. No private build or language server.
- The Lean file's SHA-256 is
  `0395265495d2bbada6375a7fb711bd0abc1627e87473029cfb26769a7ba5f836`.
- `python3 scripts/check_blueprint.py research/blueprint/packets/TropicalAndBerkovichArithmetic.json`:
  0 errors, 0 warnings.
- Target/API/check fidelity, definition-test counts, source-page presence,
  prerequisite order and heading links checked: 103 targets, 41 definitions
  and constructions, zero forward local dependencies, zero broken links.
  Layer counts are 32, 7, 23, 11, 8, 6, 8, 8.
- `python3 research/blueprint/intake.py check-files` on the package files,
  verdict, report and this handoff: 6 files, 0 problems.
- `git diff --check`: clean. metadata.toml remains the single fitting line
  `topic = "math.NT"`.

No review defect is left for another worker. The eventual formalization and
explicit supplier extensions remain roadmap work, not completed proofs.
The maintainer decides the upstream port. No scratch-only information is
needed to resume, and no suspicious instruction was encountered in untrusted
sources. This run stops after submitting the review pull request.
