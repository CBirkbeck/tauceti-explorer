# REV-StableHomotopyKTheory~2: handoff (checkpoint)

Issue #7095. Claude (Claude Code, model Opus 5.5), session `claude-qMTtSD`, 8 October 2026. Base commit
`e6b4dd3e0`. This checkpoint changes the packet, the reader, the suggested file and the review report. It
writes no verdict: the packet's `review` object is still the first review's (`needs_changes`). The next
worker continues the same review job and may be anyone who did none of `BP-StableHomotopyKTheory`,
`REV-StableHomotopyKTheory` or `BP-StableHomotopyKTheory~2`.

Read the report first: `research/blueprint/reviews/REV-StableHomotopyKTheory~2.md`. It lists every
correction made, the findings recorded but not applied, the fifteen source-issue verdicts and the state of
each of the 213 nodes.

## Done

- **The first review's requirement.** The reader is regenerated from the packet, and that is verified. The
  reader's node sections and tail follow a fixed format, rendered from the packet field by field: heading
  with planet; kind-labelled statement; Hypotheses; Construction or proof outline; API; Unit tests; Uses;
  Acceptance; Prerequisites; Sources; Suggested home. Regenerating them after any packet change keeps the
  two in agreement. All 4,685 packet strings appear in the reader. The hand-written prose is corrected.
- **Sources and source issues.** All fifteen SHA-256 values reproduced. E1–E15 are confirmed at their
  locators. The verdict texts are in the report, ready to go into the `review` objects. Weibel's
  published errata list was checked (Internet Archive copy) and has no entry for these passages.
- **Library.** All 88 baseline names exist. Entries 1–59 were read against their citing nodes and
  corrected; 21 entries were added. The checker passes with the pinned index (set `TAUCETI_BASELINE` to
  the workers' baseline directory so that `declarations.tsv` is found).
- **Requests.** Every `neededBy` is recomputed from the prerequisites. The orphan request to
  AlgebraicTopology stage 3 is removed. Four needs are made precise.
- **Nodes checked in full (29):** H.1/nerve-and-classifying-space, H.1/realisation-boundary-inclusion-disk,
  H.1/coverings-fundamental-group-local-coefficients, thirteen nodes of H.2 (weak-homotopy-equivalence to
  homotopy-cartesian-pasting and comma-category-to-homotopy-fibre), five of H.4 (group-completion-acyclic
  to cofinality-projective-modules), H.5:spectra derived-smash-product, twist-sign and
  homotopy-group-pairing, and H.6 moore-spectrum, p-complete-criteria, rationalisation,
  rational-spectra-generalized-eilenberg-maclane and arithmetic-fracture-square. The report's last table
  marks each node.
- **Checks at this checkpoint.** check_blueprint: 0 errors, 0 warnings. No node-level cycle. Trial atlas
  build succeeds. `lean-check` exit 0, with only `sorry` warnings.

## Where to resume

1. **Node check.** 184 nodes are not yet checked in full; 33 of them were partly checked through the
   baseline, reader or Lean passes. Untouched so far: most of H.1 (after the first three nodes), H.2 from
   bisimplicial-realization-lemma to group-extension-fibration, all of H.3, H.4 up to
   gl-telescope-plus-comparison and after cofinality-projective-modules, most of H.5:spectra, most of H.6,
   and H.5:S-delooping. Check each against the issue's items 1–6: source at the locator, truth, closure at
   lemma level, granularity, API, tests and planets.
2. **Baseline entries 60–88.** In the base packet's order these run from CategoryTheory.Functor.Elements
   to Matrix.vecMulLinear (all added by the first review). Read each statement against its citing nodes. The names are
   already confirmed.
3. **Findings recorded but not applied** (report table). Turn the six gaps added here into nodes:
   - H.2/hurewicz-fibration (definition);
   - relative homotopy lifting for Serre fibrations (lemma);
   - relative homotopy groups of coverings (lemma, for H.3/relative-hurewicz-trivial-action);
   - flat symmetric spectra, with Schwede I Prop. 5.50 and 5.54 (definition and two lemmas);
   - H.6/first-stable-stems and π₂(S/2) ≅ ℤ/4 (theorem and lemma);
   - the (p)-adic completion of ℤ as ℤ_p (lemma).

   Then do the splits:
   - H.6/p-complete-criteria into five lemmas, keeping the id for the holim criterion, because other
     packets cite it;
   - H.2/mapping-path-space-fibration into two declarations;
   - exactness of the derived smash product into its own node.

   Then the API work: rationalisation as S_ℚ ∧ᴸ E with functoriality and its universal property; the
   orderComplex compatibility for posets; moving the CW-structure construction out of
   H.1/realisation-boundary-inclusion-disk. Every new node gets `"addedBy": "REV-StableHomotopyKTheory~2"`,
   at least three tests, and a Lean form.
4. **Red-team findings (issue item 9a).** RT-AREA-ktheory-1/4, 1/5, 1/15, 1/16, 1/22, 1/23, 1/30 and 2/29
   were not re-checked in this round. Check each against the packet and the reader, using the first
   review's table and the BP~2 handoff as the record of earlier dispositions.
5. **Library audit, restructure, upstream notes and gaps.** Not yet checked. This covers the AUDIT-30
   layers, the two restructure proposals, the three upstream notes and the 35 older gaps (each must name an
   exact missing input and its consumers).
6. **Suggested file.** The H.1 part was checked, and its fixes are applied: canonical maps instead of bare
   `Nonempty` statements, the missing covering-essential-surjectivity statement, the exactness of the
   category-homology long exact sequence, and the loop and map lemmas of BG. Lines for H.2–H.6 (from the
   H.2 header on) have not been checked against the packet. One deferred item: generalise
   `classifyingSpace_homology_filtered_colimit` from ℤ to an arbitrary coefficient module.
7. **Finish.**
   - Write the source-issue verdicts (the report's texts, or your own) into the fifteen `review` objects,
     by `REV-StableHomotopyKTheory~2`.
   - Write the packet's `review` object, keeping the first review's object under `reviewHistory`, and its
     `checked` list: every node's verdict and note, including the corrections listed in the report.
   - Rewrite the report as the final report.

The questions for the orchestrator are in the report: the register's handling of `known`, the declaration
index's missing names, and the skipped K.4 link.
