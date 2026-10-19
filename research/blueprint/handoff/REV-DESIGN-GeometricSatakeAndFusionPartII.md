# REV-DESIGN-GeometricSatakeAndFusionPartII — completed independent review

Worker: Claude, session `claude-iW3aXv`. Issue: [#3538](https://github.com/CBirkbeck/tauceti-explorer/issues/3538); claim confirmed by the swarm bot on 19 October 2026 at 12:03 UTC. Branch: `claude-iW3aXv-rev-geometric-satake-partii`. The design was written by the separate session `codex-JDW4oj` (#3354). This finishes the review; it is not a checkpoint. This process claims no second job.

## Result

The packet is accepted as a complete target-level pass: 60 verdicts, 39 verified and 21 corrected, no added or unverifiable nodes. All nine layers remain planned, none closed, every node unchecked. The review report `research/blueprint/reviews/REV-DESIGN-GeometricSatakeAndFusionPartII.md` lists every change. Changed files: the packet, the reader, the roadmap definition (Levin read-sections only), the suggested Lean file (two added statements), the review report and this note.

## What the next worker needs

- One planned proof route was wrong. `LM.7/acceptable-good-embedding` (KZ Proposition 3.1.9) needs the local-model map M^loc_(𝒢,μ)→M^loc_(𝒢_(K/F),μ_(K/F))⊗O_E to be a closed immersion (KZ Lemma 3.1.10). A closed map of v-sheaves with normal full faithfulness, like FHLR Lemma 5.27, gives only a finite universal homeomorphism onto the image, that is, the normalization of the image. The new gap "Closedness of Weil-restriction local-model maps" records what is needed: a closed immersion on special fibres plus the Nakayama argument of PZ Proposition 8.1, or normality of the closure (D10/uniqueness-of-integral-models(2)). Source issue E6's correction now says this. `LM.7/admissible-lattice-test` inherits the gap.
- Two definitions were restated faithfully: the Finkelberg–Mirković bound (`LM.4/fm-lattice-bound`, Weyl module versus associated bundles) and the EL/PEL chains (`LM.6/pel-lattice-chains`, local module types of M_Λ and of adjacent quotients, not ranks only; a non-example test was added).
- New source findings E13 (KPZ Proposition 4.3.10 Case (2) needs p≠2) and E14 (PZ arXiv v4 §9.d.3(a): exponent of q has the wrong sign in the minuscule A_μ). E14 is scoped to arXiv v4; the Inventiones text was not collated.
- Version notes: Levin's ind-projectivity is Theorem 4.2.10 (p. 28) in the arXiv text, 4.2.11 in the published version cited by KPZ. AGLR v2 numbers differ from those cited by KZ (KZ's AGLR 7.21 and 7.23 are not the v2 statements). Printed-page offsets: KP = PDF + 120, AGLR = PDF − 6, SW cleared copy = PDF − 10, the others equal PDF pages.

## Validation

`python3 scripts/check_blueprint.py` on the packet: 0 errors, 0 warnings. `lean-check` on the suggested file at Mathlib 082e2d3 and Tau Ceti f790474: exit 0, twelve `declaration uses sorry` warnings and nothing else. `git diff --check` passes. Reader sections were re-rendered from the corrected packet after confirming that the old rendering matched the old reader exactly. No language server or library build was started, and nothing is left running.

## Sources

Public PDFs only, plus the cleared Scholze–Weinstein copy read in place; all SHA-256 values match the packet. No source file or passage is in the repository, and the scratch copies are deleted when the run ends.
