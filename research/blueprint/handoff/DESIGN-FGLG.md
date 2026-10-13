# Handoff: DESIGN-FGLG (FreeGroupsAndLimitGroups)

Issue #9461. Worker: Claude (Opus 5.5), session claude-mk47Qn. Date: 2026-10-13.

## What was delivered

- `research/blueprint/roadmaps/FreeGroupsAndLimitGroups.json`: the new roadmap, area `grouptheory`, no parent,
  eleven layers FG1–FG11 with the titles of the maintainer's specification and its exclusions as non-goals.
- `research/blueprint/packets/FreeGroupsAndLimitGroups.json`: status `complete`, every stage `planned`.
  124 nodes (23 definitions, 28 constructions, 72 theorems, 1 comparison), 275 API items, 212 unit tests,
  57 planets (at most 6 per layer), 66 baseline declarations (all Mathlib, all found in the pinned index),
  2 gaps, 0 requests, 1 source issue. `python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings
  (with the pinned declaration index).
- `research/blueprint/readmes/FreeGroupsAndLimitGroups.md`: the reader document (about 340 KB), generated from the
  packet so that the two agree: scope and ownership, conventions, exact supplier contracts, then every layer
  with each target's statement, hypotheses, proof sketch, API, Checks, examples, uses, sources and needs.
- `research/blueprint/suggested/FreeGroupsAndLimitGroups.lean`: written to the 2026-10-12 shape (light
  real-bodied definitions over Mathlib carriers, milestone theorems and examples proved by `sorry`, no
  sorry'd data). Lean names live in `namespace TauCetiRoadmap.FreeGroupsAndLimitGroups`; the packet's API
  names give the intended library names (for instance the packet's `FreeGroup.isTrivialWord` is the file's
  `isTrivialWord`). Heavy constructions are README targets, listed in the file's closing comment.
  Compilation result: see the last section.

## Algorithms

Following the specification, every algorithm is planned as an encoded procedure (a construction node), an
interpretation statement, computability, termination on the stated input class and correctness of both
answers; for the large algorithms (FG7 solver) these are separate nodes, for total primitive-recursive
procedures (FG1, FG2) termination is part of the computability node. Algorithms for limit groups (FG10, FG11)
are stated on a promised input class (a finite presentation promised to present a finitely generated fully
residually free group); none recognises the class.

## What remains (precisely)

- **Gap 1 (FG7/minimal-solution-bound).** Makanin's papers (Izv. 1982, 1984) were not read: Math-Net.ru did
  not respond. The bound on minimal solutions is planned from the account of Makanin's process in IFT §5 and
  VAR-II §§1–3, which cite Makanin and Razborov for the exponent-of-periodicity bound. A follow-up must read
  that bound and the termination of the process at declaration level, or plan the independent route of
  Diekert–Jeż–Plandowski (RECOMP Theorem 1, Corollary 1, Proposition 1), before the solver is formalised.
- **Gap 2 (FG10/equations-over-limit-groups).** The specification asks to resolve the prerequisite cited by
  KM06 Theorem 32 or to supply a proved replacement. KM06 could not be read (the publisher refused automated
  access). The available replacement route — embed the limit group in an NTQ group with a free regular
  ℤⁿ-length function (JSJ Theorem 12.7) and run the elimination process over NTQ groups (JSJ Theorem 14.1,
  only sketched there and cited from another paper) — is recorded, not assumed. Nothing downstream uses this
  target.
- Refinements recorded in the coverage `remaining` lists: FG6/finite-index-surface at lemma level (the
  combinatorial classification of polygon gluings is planned only through FG6/quadratic-standard-form);
  FG7 as in Gap 1; FG10 as in Gap 2, and the split of FG10 into dependency-checked subpackages
  (presentations and basic algorithms; Grushko and JSJ; Makanin–Razborov diagrams; equations over limit
  groups) that the specification asks for when the layer is refined; FG11/generic-families at lemma level
  (the Nielsen-property lemmas of IFT §§7.1–7.3).

## Requests and moves

No requests: no atlas roadmap plans free groups, Bass–Serre theory, equations over groups or limit groups,
and every prerequisite is Mathlib or an earlier layer. No notion was moved between roadmaps.

Neighbours checked and not used: Tau Ceti roadmaps AlgebraicTopology (van Kampen, Euler characteristic of CW
complexes), FuchsianOrbifolds (Fuchsian presentations), GeometricTopology (JSJ of 3-manifolds, a different
notion), ProfiniteProPGroups and PeripheralActions (free pro-p groups). The current Tau Ceti library (newer
than the pin) proves residual finiteness of free groups (`FreeGroup.instResiduallyFinite`) and the inequality
rank H ≤ 1 + [G : H](rank G − 1); the first is cited for FG6.2, the exact Schreier formula is planned in FG2
because only the inequality exists.

## Sources

Read (public, hashes in the packet): FOLD (arXiv:math/0302206v2), KM02 (arXiv:math/0202285v1, added: the
standard source for Stallings graphs), ALG, VAR-I, VAR-II, SUBGROUPS and MRS-REGULAR (authors' copies from
A. Myasnikov's publication page; MRS-REGULAR added for infinite words), RECOMP (arXiv:1405.5133v2), LIMITS
(arXiv:math/0401042v2), GL-JSJ (arXiv:1602.05139v2), JSJ (arXiv:math/0407089v2), LENGTH (arXiv:0907.2356v2),
SELA-I (Numdam), IFT (arXiv:math/0312509v2), LIFT (arXiv:math/0407110v4). Locators were checked in these texts
(PDF or printed pages as each source entry says).

Not read: TREES (Serre's *Trees* is neither free nor in the cleared library; its standard locators are cited
alongside FOLD §2 and GL-JSJ §1, which were read and support every claim), MAK (Math-Net.ru unreachable),
INFINITE-WORDS (IJAC 2006, not freely available; used through SUBGROUPS §2.4 and MRS-REGULAR), KM06
(publisher refused access). A reviewer with access should check the TREES locators (Chapter I §§1–6).

## Source issues

FreeGroupsAndLimitGroups/E1 (IFT §4.4, proof of Corollary 9, p. 26): the proof refers to ‘Proposition 4’, but the
result used is Merzljakov's Theorem proved just before; Proposition 4 appears only in §7. A misprint that
affects nothing.

## Lean

`lean-check research/blueprint/suggested/FreeGroupsAndLimitGroups.lean` (shared build at Tau Ceti f790474 and
Mathlib 082e2d3) exits 0; the only warnings are the 51 `declaration uses 'sorry'` warnings. The file has no
sorry'd data definition (`scripts/check_sorry_data.py` reports none).

## Where to resume

The review job checks this packet. After review, the follow-ups are the two gaps and the refinements listed
above; the packet is generated from compact per-layer data, but the JSON is the source of truth and can be
edited directly.
