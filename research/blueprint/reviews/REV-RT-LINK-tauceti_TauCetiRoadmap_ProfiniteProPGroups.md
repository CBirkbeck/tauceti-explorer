# REV-RT-LINK-tauceti_TauCetiRoadmap_ProfiniteProPGroups

**Complete: 4 of 4 findings confirmed, none rejected. Three fixes are narrowed.** The fixer follows the reasons in the verdict file, not the red team's fix text. In particular, finding /4 adds **no** links.

- **Job:** Refs #4354.
- **Verifier:** Claude Code, session `cc-f805bf`, 30 September 2026.
- **Independence:** other sessions did the work checked here:
  - the link map LINK-tauceti_TauCetiRoadmap_ProfiniteProPGroups;
  - its review (Codex `codex-7e92bd`);
  - the red team (Codex `codex-rtOQ9t`).

  The string `cc-f805bf` occurs in none of the red-team files, the link map or its review. Disclosure: this session also verified other red teams that touch ProfiniteProPGroups Layer 5 (the Merkurjev–Scavia extraction cites its extension dictionary). No verdict here relies on that work.
- **Verdicts:** [`research/blueprint/redteam/RT-LINK-tauceti_TauCetiRoadmap_ProfiniteProPGroups.review.json`](../redteam/RT-LINK-tauceti_TauCetiRoadmap_ProfiniteProPGroups.review.json).

| Finding | Kind | Red team's severity | Verdict | Scope of fix |
| --- | --- | --- | --- | --- |
| /1 continuous sections | library-claim | medium | confirmed | overlaps[0] names the built theorem and loses the "move the proof" option |
| /2 Weierstrass | library-claim | medium | confirmed | overlaps[5] imports Mathlib's existence and uniqueness; continuity and evaluation stay open |
| /3 Shapiro chain isomorphism | error | high → medium | confirmed, narrowed | one supplier note; no edge changes |
| /4 Ẑ examples | missing | high → medium | confirmed, narrowed | no links; one supplier note about the false procyclic alternative |

## Evidence read

- **Explorer.** The target link map, whose SHA-256 `5257102d…6f1ba` matches the red team's baseline. I read:
  - all 34 links and 7 overlaps;
  - the examined entries for ProfiniteCohomology and PadicMeasuresIwasawaAlgebras;
  - the review block;
  - the red-team result and report;
  - ProfiniteProPGroups README: introduction, Layers 0, 4 and 5;
  - ProfiniteCohomology README: Layers 0, 10 and 11, §2, §6 and its STATUS page;
  - the atlas stage text of PadicMeasuresIwasawaAlgebras:L4;
  - accepted audits AUDIT-22 (ProfiniteProPGroups) and AUDIT-26 (PadicMeasuresIwasawaAlgebras);
  - the ProfiniteCohomology link map and its handoff note.
- **Libraries.** Read at the pinned commits, with the names checked in the declarations index:
  - Tau Ceti [`Section.lean`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/Group/Profinite/Section.lean#L226);
  - Mathlib [`WeierstrassPreparation.lean`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean#L504);
  - Mathlib [`ContCohomology/Basic.lean`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean#L94);
  - Mathlib [`ProfiniteGrp/Completion.lean`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Category/ProfiniteGrp/Completion.lean#L147).
- **Computations.** I enumerated the two C2 counterexamples again myself. The graph check used the 3,508 atlas `stageEdges` together with every link map in `research/blueprint/links` (4,213 distinct edges).

No Lean was compiled; no finding needs it.

## /1: confirmed

`TauCeti.exists_continuous_section` (line 226) gives a continuous normalized section of `G → G ⧸ H` for closed `H` in a compact, totally disconnected topological group. `exists_continuous_section_of_le` (line 253) gives the section of `G ⧸ K → G ⧸ H`. Both proofs are complete. A finite subgroup is closed, so PPG Layer 5's finite-kernel milestone is a special case. AUDIT-22 already classifies it as `tauceti`, with fit "more general". The ProfiniteCohomology STATUS page, dated 1 September, still calls the section missing, which explains the overlap's wording.

**Fixer:**
- edit overlaps[0] and the ProfiniteCohomology examined note;
- name both declarations and the audit classification;
- delete the "move the elementary proof into PC Layer 0" option;
- keep the `rescope` recommendation and the citation route.

## /2: confirmed

Mathlib has Weierstrass division and preparation, with uniqueness, over any complete local ring. The concrete rings are covered by instances (`𝒪[K]`, `ℤ_[p]`). For an abstract complete DVR the completeness hypothesis must be supplied: this corrects the finding's "is an instance". Continuity of division is absent (AUDIT-26), and so is the identification of the remainder with evaluation (AUDIT-22).

**Fixer:**
- edit overlaps[5] so that PadicMeasuresIwasawaAlgebras L4 imports the four Mathlib declarations;
- keep continuity, the coordinate comparisons and evaluation-as-remainder as the remaining obligations;
- keep the rest of the proposal as it is, including the (p,T)-adic caveat.

PadicMeasuresIwasawaAlgebras' own text is not edited; if it should change, that is a note to its maintainer.

## /3: confirmed, narrowed

The mathematics is right. Mathlib's homogeneous cochains in degree 0 are `C(G, X)^G ≅ X`. So for `C2`, `H = 1`, `F2`, the two sides have 4 and 2 elements, and no chain isomorphism `shapiroCochainIso` can exist.

The finding is wrong in two respects:
- **The map says nothing false.** It never names `shapiroCochainIso`. Links 11 and 32 cite only cohomology-level statements (`shapiroIso`, `dimensionShiftIso`, `corestriction_comp_res`, `longExact_exact`), and these are true.
- **The defect is already recorded.** The ProfiniteCohomology link map's `gaps[0]` has it, with the same counterexample. The red team did not notice this.

That link map is partial and unreviewed, so a one-sentence cross-reference from this accepted map is still worth making. Severity is medium, not high.

**Fixer:**
- leave the edges alone;
- add one supplier note: use a named quasi-isomorphism, and cross-reference that gap.

## /4: confirmed, narrowed (no links)

Two sides of the finding need separating.

**Right: the procyclic alternative is false.** ProfiniteCohomology §6 lets the Ẑ example be stated over "an arbitrary procyclic group with a topological generator". That is false:
- `C2` is procyclic and `H²(C2, F2) = F2`;
- `ℤ_p` has `cd_ℓ = 0` for `ℓ ≠ p`.

This is recorded nowhere else.

**Wrong: the missing links.** They fail PROTOCOL §10:
- **The use is not an exact match.** PPG Layer 4 outputs the rank-one chain, maximal pro-p quotient ≅ ℤ_p, and the Sylow characterization. The PC examples use none of these, and sharing the symbol Ẑ is shared vocabulary, not a dependency.
- **There is no second construction.** Ẑ is Mathlib's `ProfiniteGrp.profiniteCompletion` of ℤ, which PPG itself consumes, and it comes with `lift`, `lift_unique` and `homEquiv`. So PC's "build Ẑ as the profinite completion of ℤ" is the same object, and it respects PC's declared boundary (it depends only on InductionRestriction).
- **The link numbers are off.** Links 19 and 21 come from Layer 3, not Layer 4.

The proposed edges would not create a cycle (no non-trivial strongly connected component), but acyclicity does not make them dependencies.

**Fixer:**
- add no links;
- add one note for the ProfiniteCohomology maintainer: remove the procyclic alternative and state the example for Mathlib's completion of ℤ.

## Checks

- `python3 scripts/check_redteam.py` on the result and review: `ok`.
- `python3 research/blueprint/intake.py check-files` on both deliverables: 0 problems.
- Only these two files are added.

The red team's catalogue screen and the 34 existing edges were not re-certified beyond what these four findings required.
