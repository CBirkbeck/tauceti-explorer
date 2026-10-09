# PKG-PadicMeasuresIwasawaAlgebras — handoff

Package written 2026-10-09 into `research/blueprint/packages/PadicMeasuresIwasawaAlgebras/`
(`README.md`, `Suggested.lean`, `metadata.toml`) from the revision-2 packet as corrected and
accepted by its independent review on branch `cc-016ff0` (commit 3b2977c5: 487 nodes, status
complete, review accepted). That branch's packet, reader and suggested file were read in place;
nothing on it was edited, and the packet on this branch (486 nodes, before the review) was not
used for the final generation. The review's changes relevant here: the new node
`L2/cartier-power-series` (owner of the power-series Cartier operators), the three residue-psi
nodes citing it instead of the higher tier, and fourteen L4 declarations and twelve L4 tests
added to the suggested file.

## What was done

- `README.md` (198,922 bytes): generated from the packet by a script (layers → sections by
  proposed Tau Ceti module → targets in dependency order), then given hand-written front matter
  (purpose, scope table, boundaries, conventions, how to read), layer introductions, the two
  layers without a plan (L0a, L5) at target level, and references.
  Definitions, constructions, theorems and comparisons (180) are rendered as full targets:
  statement, assumptions not already standing, API (at most 6 items), tests (at most 3, definitions
  and constructions), uses by target identifier, sources by locator. Lemma nodes (307) are listed by
  identifier under *Supporting lemmas* in their section; their full statements are the
  signatures of the same names in `Suggested.lean`. Hypothesis sentences shared by several
  targets are hoisted to section, layer or roadmap level. Proof steps, acceptance paragraphs,
  reader coverage text and all process fields were left out.
- `Suggested.lean` (353 KB): the `cc-016ff0` suggested file, re-headed, with the process
  narrative removed from comments (section `ReviewCompletion` renamed `FurtherInterfaces`), and a
  closing comment naming the L0a and L5 statements that cannot be typed at the pins. No
  declaration was added or removed.
- `metadata.toml`: `topic = "math.NT"`.

## Moved-down notion (higher tier → target here)

`ClassicalArithmeticCompletion:CA.2/cartier-operators` (tier 5) was the prerequisite of three L2
nodes (`residue-psi`, `residue-psi-coefficient`, `residue-psi-semilinear`). The review on
`cc-016ff0` moved the notion down as the packet node `L2/cartier-power-series` (construction,
`PowerSeries.cartier`, 8 API items, 5 tests, sourced to Rowland–Stipulanti–Yassawi Proposition 4,
PDF p. 5, and RJW Lemma 12.13), and the three nodes now cite it. The README renders that node as
the first section of L2 ("Cartier operators on power series"); no citation of
ClassicalArithmeticCompletion remains anywhere in the package. The Rowland–Stipulanti–Yassawi PDF
was fetched into scratch on 2026-10-09 and its SHA-256 matches the packet's record; the
definition and Proposition 4 were checked against the node's statement.

## Layer changes the README makes relative to the packet

- Three L1 nodes (`unit-measures-weak-compact`, `unit-coordinates-weak-closed-embedding`,
  `unit-joint-coordinates-weak-closed-embedding`) depend on L2 nodes
  (`integral-measures-weak-compact`, `intrinsic-unit-restriction-*`). They are rendered at the end
  of L2 ("Weak compactness of unit measures in coordinates") so that no target uses a later layer.
- The comparison of integral measures with `completedGroupAlgebra p Γ` (ProfiniteProPGroups,
  layer 9), which the L1 stage description names as its endpoint, is not a packet node. The README
  states it as two targets at the end of L2 (`L2/measure-completed-algebra-equiv`,
  `L2/completed-algebra-coefficients`), after the weak compactness they rest on, sourced to RJW
  Proposition 3.16. They are not in `Suggested.lean`.
- The ten forward references inside L4 were resolved by a topological sort within the layer.

## What the README could not support from the plan

- L0a and L5 have no packet nodes. Their sections are written at target level from the atlas
  stage descriptions: L0a from RJW Remark 3.47 (p. 135) and pp. 160–161 (character space of
  ℤ_pˣ, its discs, bounded and meromorphic functions, the universal character); L5 as the
  standard properties of determinant lines of perfect complexes, specialization with Tor
  correction, exactness of inverse limits of compact modules (RJW Proposition 13.13, p. 193, whose
  proof's appeal to finite generation is replaced by compactness) and topological Nakayama. The
  determinant-line targets have no source in the plan's register; they are stated as the
  specification. The stage text's references to SchemeKTheoryOperations:S.1 and
  DeformationAndDerivedPatchingAlgebra:P7 (outside the 94 / tier 10) were not used; the targets
  rest on Mathlib carriers only. The stage text's "finite-error control for coinvariants" is not
  stated (no source and no precise hypotheses). None of the L0a/L5 statements is typed in
  `Suggested.lean` (no rigid spaces, no graded invertible modules at the pins); they are named in
  its closing comment.
- API items beyond six per target and tests beyond three per definition are only in
  `Suggested.lean`. Acceptance paragraphs and proof routes of the packet are not in the README.
- The package directory holds no `review.json`; the packet on this branch is the pre-review
  revision, so the package and the packet differ by the review's four node edits until the two
  branches are merged.
- The 59 `…-api-N` split nodes: the 48 lemma ones are not listed separately (they are the
  parent's API items, as "How to read" says); the 11 non-lemma ones are targets with their own
  API and tests.
- The L6 stage text names IntegralHeckeAndGaloisDeterminants (tier 3), the open roadmap
  GorensteinHomologicalAlgebra and GlobalNumberFields; none is cited. L6's Fitting-ideal carrier is
  Tau Ceti StableReduction, layer 1, as the packet requests; the higher Fitting ideals are L6's.
- The Loeffler Mathlib PR 41961 is kept as a source for the shape of the convolution targets.
- Packet references to higher-tier consumers (Dirichlet, Coleman, locally analytic distributions,
  Euler systems, PadicFamilies, OverconvergentAutomorphicForms) appear only as subject
  boundaries, not by roadmap id.

## Lean check

`atlas-workers/bin/lean-check` on the final `Suggested.lean` (Tau Ceti f790474 +
Mathlib 082e2d3): exit 0, 0 errors, 1,075 warnings, all `declaration uses sorry`
(run 2026-10-09 on the committed file). The `cc-016ff0` suggested file it was built from gave the
same count before the comment-only edits.

## Checker

`python3 research/blueprint/intake.py check-files` on the three package files and this note: 0 problems.
No `/home/` paths in the deliverables.

## Open points for the maintainer

- The README is at the 200 KB ceiling with the lemma targets listed by identifier only; if the
  reviewer wants lemma statements in the README, the plan is too large for one package at the
  size limit and would need a split (L0–L3 and L4–L6 are natural halves).
- Two packet requests to Tau Ceti roadmaps remain as cited prerequisites: ProfiniteProPGroups
  layer 9 (coordinate O⟦Γ⟧ ≅ O⟦T⟧ for general O, which L4 states as its own target on the carrier)
  and StableReduction layer 1 (Fitt⁰). The reconciliation of the higher-Fitting owner recorded in
  the packet's third request is unchanged.
