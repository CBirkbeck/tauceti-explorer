# Handoff — BP-KatoEulerSystems

Job `BP-KatoEulerSystems`, issue #766. Agent: Claude Code, session `cc-7b31c4`, 24 September 2026.

Deliverables:

- `research/blueprint/packets/KatoEulerSystems.json` — 22 nodes, 33 API items, 21 unit tests, 16 planets,
  30 pinned baseline declarations, 8 gaps, 1 request, 1 structural proposal.
  `python3 scripts/check_blueprint.py`: **0 errors, 0 warnings**.
- `research/blueprint/readmes/KatoEulerSystems.md` — the roadmap document, 1557 lines.
- `research/blueprint/suggested/KatoEulerSystems.lean` — 202 lines of signatures.

## What this packet is

The roadmap already had a **reviewed integrated decomposition** of Kato's Astérisque 295, accepted after an
independent review. The job says to build on it, keep its node ids and reuse its verified locators. This packet
keeps all 22 identifiers with their statements, hypotheses, proof steps, acceptance tests and locators, and adds
prerequisites resolved to the pinned libraries or to a named supplier stage, an API outline with unit tests for
each of the seven constructions, 16 planets, a coverage record per layer with the decomposition's `remaining`
lists kept verbatim, and 30 baseline citations.

## What was checked in this session, and what was not

Both sources of this roadmap are **freely available**, which is the main difference from the other
decomposition-based packet this session produced.

- Both were **re-downloaded and re-hashed**, and both reproduce the recorded SHA-256 byte for byte: Kato's
  paper from Numdam (`3c6e14b1…`) and Rubin's Euler systems draft from the Arizona Winter School page
  (`de47655d…`).
- The **prose** of the five results the last layer turns on was re-read directly in the text layer and agrees
  with what the decomposition records: Theorem 12.4 with its three parts and the hypothesis in (3) that `p ≠ 2`
  and the residual representation is irreducible; the existence and uniqueness clause of Theorem 12.5(1);
  Theorem 13.6 with its attribution to Ash and Stevens, its hypothesis `L ≥ 3` and its generators indexed by
  `a ∈ GL₂(Z/L)` and `1 ≤ j ≤ k−1`; Rohrlich's finiteness statement in 13.5(2) for even `k`; and Proposition
  13.7 with the four results its proof cites.
- The **displayed formulas were not re-verified.** They are garbled in the Numdam text layer — the independent
  review said exactly this and read those pages from page renderings instead — and no page-rendering tool was
  available in this session. Every displayed formula in this packet therefore rests on the review's reading,
  not on one made here. This is recorded in the source entry and as a gap, so a reviewer can tell the two kinds
  of evidence apart.

## Coverage

All five layers keep the status the decomposition gave them, with a note added saying which sections of Kato
each layer decomposes and what the audit records as absent. The reviewed library audit records **all five
layers as not built**: neither pinned library has Siegel functions, the modular curves `Y(M,N)` as schemes with
their degeneracy maps, `K₂` of a curve, an étale Chern character, the modular local system, a dual exponential
map or a `p`-adic `L`-function of a modular form. Nothing here duplicates the libraries.

## The one request

`EulerSystemsAndKolyvaginSystems:ES.8` — the Iwasawa form of the generic Euler-system machine, an inverse-limit
bound over a Λ-algebra. Kato does **not** prove his Theorem 13.4; he imports it, and this packet imports it in
turn. The request says explicitly that the supplier must state which hypothesis package it provides, because
the decomposition records that Kato's package and Rubin's Theorem II.3.3 are not literally the same.

## Gaps

Seven are carried forward from the decomposition, and they are the honest boundary of the work:

1. the generalised explicit reciprocity law is imported by Kato from a companion paper that is unread;
2. Kato's Theorem 13.4 and Rubin's Theorem II.3.3 do not package the hypotheses identically;
3. the archimedean zeta-value input (Sections 4–7, Theorems 2.6 and 6.6) is unread;
4. the constant in Theorem 12.5(1) is transcribed but the period and the dual form are not sourced;
5. Sections 14–16 are unread;
6. candidate local formalisation primitives were not searched;
7. **hypothesis (v) of Theorem 13.4 is never verified for non-CM forms in the sections read** — this is the one
   a reviewer should look at first, because it is a hypothesis of the imported machine that the source's own
   argument needs and that the sections read do not establish.

The eighth is this job's own: the displayed formulas were not re-verified, for the reason above.

## Structural proposal

**L4 mixes an imported machine with the theorems it yields.** The imported Euler-system bound has a different
acceptance test from the three results that follow from it — it is checked against the supplier's hypothesis
package, and the two candidate packages differ — while the consequences are checked against Kato's own proofs.
Dividing the layer would make that boundary visible and would stop the imported theorem appearing to be part of
what this roadmap proves.

## What the packet deliberately does not plan

The **reverse divisibility**. Kato proves one direction; Conjecture 12.10 remains a conjecture in his paper, and
no node of this packet states the equality. The complex-multiplication case is excluded from the Euler-system
argument, and the reason for the exclusion is a node of its own rather than a footnote.

## Did the Lean file compile?

**No.** No Lean toolchain at the pinned commits was available and the shared Mathlib build on this machine is a
cache a worker must not rebuild. Every Mathlib name the file is written against was confirmed present in the
pinned declaration index. Because the audit records every layer as not built, almost every signature is opaque.
