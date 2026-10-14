# Independent review: the first-order theory of free groups (DESIGN-FGFO)

Job `REV-DESIGN-FGFO`, issue #9802. Reviewer: Claude, session `claude-U9PXIW`, 14 October 2026. The design (issue #9801, PR #9815) was written by session `claude-n3h6OP`; this reviewer did none of it. **Accepted, with corrections made in place.**

## Counts

- **Nodes.** 65 nodes: 19 definitions, 11 constructions and 35 theorems. 35 were verified and 30 corrected; none were added or left unverifiable.
- **Definitions and constructions.** 173 API items (172 before) and 123 unit tests; every definition and construction keeps at least three tests.
- **Planets and baseline.** 36 planets, at most six per layer. 38 baseline declarations: the 36 cited were confirmed at Mathlib 082e2d3, and 2 were added.
- **Gaps, requests and source issues.** 7 gaps (one new, one narrowed), 1 request, and 14 source issues: 9 confirmed and 5 added.
- **Coverage.** FO1 is closed and FO2–FO7 are planned, each with a precise `remaining` list.
- **Checks.** `check_blueprint`, run with the pinned declaration index, reports 0 errors and 0 warnings. `lean-check` on the suggested file exits 0, and its only warnings are unproved-declaration (`sorry`) warnings: 26, against 24 before.

## Sources read

Every source was fetched fresh, and its hash agrees with the packet:

- **QE-FREE** (arXiv:1207.1900v4): read in full.
- **HYP** (arXiv:1303.0760v8): read at every cited locator.
- **IFT** (arXiv:math/0312509v2): §2.3, §3.1 (Lemma 3 to Corollary 7), §4.4 and §7.6 (pp. 137–142).
- **SELA-VI** (the author's copy): pp. 1–14, read as page images.
- **SELA-ICM**: read in full.
- **KM-RESPONSE**: read in full.
- **SELA-REPORT**: §2 items (1)–(5), §3 items (1)–(5), (12) and (57), and the references.
- **LPS** (arXiv:1208.2858v1): §3 and p. 12.
- **ERA98**: the AMS PDF of the published announcement, which confirms the page numbers. The design had read the EMIS TeX, which has no page numbers. The packet now cites the PDF.
- **PERIN** (arXiv:0903.0945v3), added as a source: the version with Proposition 5.11 corrected. Read §1, §5.1 (Definitions 5.2–5.4 and the remarks, pp. 16–17) and Proposition 5.11 (p. 19). Its proof in §7 was not re-checked.

KM06 was not read: ScienceDirect still refuses automated access. The design's scoping of every KM06 statement through the later texts was kept.

## Baseline

All 36 cited declarations exist under their names at the pin, and their statements provide what the nodes use. One API item misused `Formula.iAlls`: its signature is `iAlls (β) [Finite β] (φ : L.Formula (α ⊕ β)) : L.Formula α`, so the printed `iAlls id` does not typecheck. It was restated with a relabelling into `Empty ⊕ Fin k`.

Added to the baseline:

- `REPred`, in `Mathlib/Computability/RE.lean`;
- `ComputablePred.computable_iff_re_compl_re'`, Post's theorem without a decidability instance, in the same file.

## Main corrections

1. **The ∀∃ decider no longer rests on a gap of the parent roadmap.**
   - The design decided whether a formula solution exists over a correcting extension through FreeGroupsAndLimitGroups FG10/`equations-over-limit-groups`. That node rests on a recorded gap of FreeGroupsAndLimitGroups: the elimination process over NTQ groups, KM06 Theorem 32. That roadmap's gap record says nothing downstream may use the node as an oracle.
   - FO5/ae-tree now searches for formula solutions instead. The search halts whenever the sentence is true, by the parametrization theorem; IFT Theorem 12 finds the solution effectively under that hypothesis.
   - FO5/ae-tree-correct now states:
     - (3) on true sentences, the construction halts with every branch closed;
     - (4) falsity means a counterexample X̄, at which a universal sentence with constants holds.
   - FO5/ae-decider runs the tree alongside a counterexample search that uses FG7's universal decider. Truth and falsity are both recursively enumerable, and Post's theorem gives the computable decider.
   - The test `AETree.false` and the worked example were updated to match.
2. **The parametric tree does need the gapped supplier.**
   - QE-FREE §5, p. 27, describes *all* formula solutions over correcting extensions of NTQ groups by fundamental sequences. That is a complete Hom-diagram over a limit group.
   - FG10/`equations-over-limit-groups` is now a prerequisite of FO6/parametric-tree, FG10 is in FO6's `requires`, and a new gap, "all formula solutions over NTQ groups", records the dependence.
   - The elimination, and through it the decidability of Th(F(A)) and the uniformity statements, rest on that gap until FreeGroupsAndLimitGroups closes it. The ∀∃ theory does not.
3. **Coefficient-free uniformity.**
   - FO1/standard-form had a single word S_i, T_i per disjunct "in every group". In general a disjunct is a system of equations and inequations (IFT p. 5). The single equation and single inequation exist only over the CSA/Vaught class, through the Malcev and commutator encodings with the constants a, b (IFT Corollary 7, p. 13).
   - The node now has a general form, which is coefficient-free for coefficient-free formulas, and a merged form.
   - The FO6 API item asserting that qeAE preserves coefficient-freeness was false as specified, since qeAE uses the merged form. It is replaced by the coefficient-free run.
   - FO7/uniform-qe and FO5/ae-rank-independence are restated for that run. The obstacle is recorded in the existing gap "rank independence in KM's route".
4. **FO7/necessary-conditions.**
   - Counting cosets of squares in a centralizer separates ℤ² from F only when centralizers are free abelian of finite rank. An abelian group containing ℤ² can have just two such cosets, as ℤ[1/2] × ℤ shows.
   - The step now uses that the group is a limit group, so FG8/frf-properties (3) applies. FG1/centralizer-cyclic was added as a prerequisite, and FG1 to FO7's `requires`.
5. **Tower classification.**
   - The "only if" direction now cites Perin's corrected Proposition 5.11 (arXiv v3, p. 19), which yields extended floors.
   - SELA-VI's locators are corrected: Theorem 7 is on p. 14, and the proof of Proposition 6 runs from p. 9 to p. 14.
   - The gap is narrowed to the "if" direction for extended floors whose lower floor is cyclic. LPS (Remark 3.7) and PERIN (p. 17) assert it only on Sela's authority.
6. **Tests and acceptance items.**
   - `not_isStrict_kills_edge`: the edge group ⟨[a, b]⟩ lies in F and cannot be killed by an F-homomorphism.
   - `FundSeq.isStrict_mono`: HYP Definition 5's envelope has no isolators, so only one implication holds.
   - `correctingExt.not_identity` and the corresponding acceptance item: HYP's counter-example concerns Sela's formulation over a non-free hyperbolic group. They are replaced by a free-group example that needs a correcting extension, U = {[x₁, a] = 1, [x₂, a] = 1} with ∃y (y² = x₁ ∨ y² = x₂ ∨ y² = x₁x₂). IFT Lemma 75 is added as that node's key source.
   - `induced.finite_index_surface`: the claim was unsupported; it now states the finite-index property of QE-FREE p. 10.
   - `tightEnvelope.kuroshRank_le_example`: an unsupported equality clause was removed.
   - Also corrected: the FO5 first-step acceptance item, the FO4 θ₁ acceptance item, a garbled FO4/reducing-quotient acceptance item, and the FO6/qe-measure step (a Boolean combination of ∀∃-formulas has at most two blocks).
7. **Dimension.**
   - QE-FREE p. 8, and HYP p. 28, index the free variables cumulatively but define the dimension as k₁ + ⋯ + k_n. The uses on QE-FREE p. 13 fix k_i as the number of variables added at level i.
   - FO2/well-aligned is clarified accordingly, and the misprint is recorded as E12.
8. **Locators and notes.**
   - QE-FREE Theorem 7 is on p. 25, not p. 24. The opening of QE-FREE §5 is on p. 26, not p. 25.
   - SELA-REPORT numbers its §2 and §3 items separately, so "item (4), p. 6" becomes §3 item (4), p. 7.
   - KM-RESPONSE §4(f) concerns Theorem 3.8 of Sela's hyperbolic-group paper, not Diophantine geometry III, Theorem 2.9. FO4/algebraic-solution-bound's notes are corrected.
   - Added sources: LPS §3.4, p. 9 (the genus-4 non-orientable surface group as a tower) and PERIN Definitions 5.2–5.4.
   - FO4/max-equivalence's proof sketch now names the compatibility that symmetry and transitivity need.

The node-by-node record is in the packet's `review.checked`.

## Source issues

- **E1–E9 confirmed** at their locators, each with an individual verdict.
  - E3's SELA-REPORT locator is now §3 item (3), p. 7.
  - E7's QE-FREE locator is now p. 25.
  - E8's locator is now Theorem 7, p. 14, with the tower definition on pp. 8–9. The printed first-level exception, the non-orientable surface of genus 2, was checked on SELA-VI p. 8.
- **Added:**
  - **E10:** KM06, p. 518, says to continue with each free factor separately; the authors call this a misprint (SELA-REPORT §3 item (12); KM-RESPONSE item (12)).
  - **E11:** QE-FREE says "formulas of type (4)" on pp. 23, 33 and 37, where formula (1), the conjunctive ∃∀-formulas, is meant; formula (4) is the quadratic relation.
  - **E12:** the dimension indexing (item 7 above).
  - **E13:** IFT Definition 13 says "G" for F and appends "= 1" to a formula; the proof of Theorem 4 cites "Theorem 4" for the argument of Merzljakov's theorem.
  - **E14:** LPS p. 8 cites Theorem 6 of SELA-VI for the classification, which is Theorem 7 there.

## Suggested Lean file

- It now imports individual Mathlib modules instead of `import Mathlib`, as PROTOCOL.md section 13 asks.
- Two layer milestones statable at the pins were added, both proved by `sorry`:
  - Sacerdote's theorem, `realize_iff_of_isForallExists_freeGroup`;
  - the uniform coefficient-free elimination, `exists_isBoolCombAE_equivOver_freeGroup`.
- The existing definitions (the quantifier classes, `EquivOver`, `HasAEQE`, `groupLang` as in FG3, the closed surface groups) and the theorem statements were checked for truth and fidelity.
- `lean-check` exits 0, with sorry warnings only.

## Reader and roadmap

- **Reader.** The reader was regenerated from the corrected packet with a renderer, after checking that the renderer reproduces the original reader byte for byte. It covers the node sections, the per-layer dependencies and coverage, gaps, requests, mistakes and references. The hand-written introduction was updated: supplier contracts (Post's theorem, FG1, the FG10 caveat), conventions (the two standard forms), build order, proof route (Perin) and worked examples.
- **Roadmap definition.** FG10 was added to FO6's `requires` and FG1 to FO7's. One sentence on the FG10 gap was added to the scope, and Perin to the sources.

## Structure and scope

- The layer order FO1 → FO2 → FO4 → FO3 → FO5 → FO6 → FO7 is forced, as the design argued, and the stage graph is acyclic. The node-level dependencies respect the `requires` lists, which a script checked after the corrections.
- The suppliers are right, and nothing duplicates FreeGroupsAndLimitGroups, any other atlas roadmap, the TauCetiRoadmap roadmaps or the Tau Ceti library.
- The scope is honest: the decidability and uniformity theorems are stated as targets, with every unproved input a recorded gap.

## Questions for the orchestrator

1. FreeGroupsAndLimitGroups' gap on equations over limit groups (FG10/equations-over-limit-groups) now also carries FO6, and through it FO7's decidability and uniformity statements. A follow-up on that gap serves both roadmaps.
2. The request that limit groups without ℤ² be hyperbolic goes to FreeGroupsAndLimitGroups FG8. That roadmap is already packaged, so the request needs a home: a fix or a Part II.
3. If the maintainer can clear KM06 (J. Algebra 302) into the private library, the KM06-dependent gaps and E1–E7, E9 and E10 can be checked against the paper itself.
