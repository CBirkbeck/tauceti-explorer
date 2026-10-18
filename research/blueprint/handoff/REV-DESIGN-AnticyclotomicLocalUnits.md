# Handoff: REV-DESIGN-AnticyclotomicLocalUnits

Job #1717 completed by Codex session `codex-q34rWa`, 2026-10-18.
Independent review accepted the corrected target-level plan: 50 nodes
(31 verified, 19 corrected), nine planned layers and eleven explicit gaps.
The report and packet contain the evidence and all per-node verdicts.
No proof-closure or formalisation claim is made.

Changes are confined to the reviewed packet and roadmap, the review report
and this handoff. The suggested file was checked and retained unchanged.
All nine exact-pin baseline declarations were independently confirmed.
No nodes were added; 16 API entries were added, test kinds and one
procedural test were corrected, and supplier requests now total 16.
All 13 source issues have verdicts: 12 confirmed and E7 rejected.

The critical new contract is G11. Scalar CM reciprocity vanishing cannot
be descended coordinatewise through arbitrary finite free coefficients.
The corrected API uses tensor-valued kernels, and the optimal-unit argument
requires membership in that tensor extension before taking O-basis
coordinates. An early CM coefficient comparison or a suitable tensor-valued
reciprocity theorem is still needed. Do not use later plus freeness to
justify that step. G1–G10 retain the other missing inputs.

Reuse the current general completed group algebra and compact-module action
through ProfiniteProPGroups Layer 9, and the current pro-p scalar action
through ProfiniteArithmetic. They are newer than the implementation pin.
The coefficient-O coordinate extension remains with the Iwasawa supplier.
Generic cyclic Herbrand formalism belongs to ClassFieldTheory Layer 0;
ArithmeticGaloisDuality R02.1 supplies only the coefficient limits requested
separately. No higher-tier target was moved or duplicated.

Follow-ups outside the allowlist: reconcile BKO errata E3 (actual p.958
degree-label typo) and E7 (no printed false equality on p.960); update the
reader during packaging from the reviewed packet, especially G11 and the
changed suppliers. Resolve/register G1–G3 owners and the remaining contracts
before claiming closure. Public source URLs, hashes and locators survive in
the packet; no scratch file is needed by the next worker.

Checks: packet checker has zero errors and warnings. The unchanged
79-line suggested file elaborated with `lean-check` at the pinned Mathlib
and Tau Ceti; only the intended `sorry` warnings at lines 38 and 48 remain.
No source text, repository copy or separate Lean project is retained.
