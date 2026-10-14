# Handoff: independent field-symbol review

Job `REV-K2SymbolsBrauer--T.2-symbols`, issue #9268. Codex / GPT-6, session
`codex-6ghlte`; completed 2026-10-14. The claim was confirmed by the bot on
2026-10-13. This run reviewed one job and took no second claim.

**Accepted as a completed planning pass**, with the existing three proof gaps
open and the stage planned rather than closed. The independent verdict is in
[the packet](../packets/K2SymbolsBrauer--T.2-symbols.json), with a check for all
15 nodes; [the review report](../reviews/REV-K2SymbolsBrauer--T.2-symbols.md)
records every correction and its evidence. The reader and compact suggested
file were corrected in place. No predecessor, upstream roadmap, library,
atlas data or promotion file was edited.

## Completed checks and corrections

Read every local node's source locator in the identified public Weibel Chapter
III author PDF and Matsumoto's published 1969 paper, as well as the inherited
node statements, supplier contracts and reviewed stage audit. Confirmed all
18 original baseline declarations at the required pins. Added the existing
pinned `TensorAlgebra.equivDirectSum`, making 19 verified citations.

Corrected the field-sign and torus locators and separated mixed-source
references. The homogeneous bridge consumes the tensor-power equivalence and
no longer depends on the graded result it supplies. The rank-two proof now
establishes commutation and regularity on subsystem fibers before transferring
relations globally. The normalizer graph quotient and its injection into the
permutation group are explicit. Torus actions use torus lifts, and the fiber
has added extensionality, torsor and square/inverse API. Replaced the vacuous
zero-map check with a real sign detector and added the nonzero opposite-root
branch check. Restricted the Q/ℤ counterexample to p>1. The suggested file's
README-only index excludes names already declared there.

Confirmed `K2SymbolsBrauer/E-field-symbol-factor-order` at the rendered Weibel
Exercise III.5.9, p.46. For the recorded commutator convention, the inverse
factors are ordered r then s; Matsumoto Lemma 5.4(c), p.26, agrees. The tame
value on {t,2} separates the symbol from its inverse. The verdict is scoped to
the identified author chapter, not an unread edition. Its independent source
review is in the packet. Source versions and hashes remain recorded; no source
passage or downloaded file is submitted.

Final inventory: 15 nodes (11 corrected, 4 verified), 49 API items, 27 checks,
6 planets, 19 baseline citations, 3 proof gaps and 2 supplier entries. No node
was added. All implementation statuses remain unchecked.

## What the later closing/package work needs

1. **G-finite-classical:** read a primary finite-field Steinberg presentation
   and stable-kernel proof. Milnor quotient vanishing is established by the
   cyclic annihilator input but does not replace classical symbol generation.
   Keep small-rank exceptional extensions separate from the stable group.
2. **G-Bass-Tate:** obtain an authorized primary proof of the number-field
   signature theorem and positive-characteristic global vanishing in degrees
   n≥3. Weibel III.7.2(a),(d), pp.61–62, supplies statements only. The source
   lead is Bass–Tate, *The Milnor ring of a global field*, LNM 342 (1973),
   pp.349–446. Its finite-symbol-tuple reduction is already in the reader.
3. **G-stable-witness:** supply the predecessor's group-colimit criterion that
   a finite word trivial stably becomes trivial after some finite
   stabilization. Stable separation remains conditional on it.
4. **Ordinary SL_m supplier contract:** current ReductiveGroups Layer 7 owns
   Bruhat/BN-pair structure but does not explicitly state the exact requested
   coordinate and (R1)–(R3) presentation API. The request now includes signed
   monomial coordinates, transformation and inversion formulas, length-additive
   multiplication, parabolic-orbit compatibility and the ordinary type-A
   Weyl identification. This is a requested output, not an implemented theorem.
5. **Consume current Coxeter work:** current Tau Ceti already exports
   `TauCeti.matsumoto`, `CoxeterSystem.existsUnique_mem_parabolic_mul` and
   `CoxeterSystem.length_mul_of_forall_not_isLeftDescent`. Read and use their
   statements through the RootSystems Layer 3 owner. They are absent at
   f790474 and must not be cited as pinned declarations or planned again.
   Their specialization depends on the separate ordinary Weyl contract.

At integration, retain the 19 inherited authoritative target ids and attach
`suppliesProofInputFor` in the output-to-proof direction. In particular,
Matsumoto/generation and graded Milnor theory consume these inputs; they must
not become prerequisites of their own proofs. The combined predecessor and
new graph, including these attachment edges, was checked for cycles.
HigherLocalFields HL.1 already consumes the K2 owner. No ownership move or
second Milnor construction is required. The maintainer's remaining routing
questions are the exact ReductiveGroups contract and the current RootSystems
exports; the review itself is complete.

## Validation

- Blueprint checker on the final packet: **0 errors, 0 warnings**.
- `lean-check` at the pinned shared build: **exit 0**, 33 warnings, all
  “declaration uses `sorry`”; no other warning or error. Memory was checked
  before compiling and exceeded the 20 GB threshold. No build or language
  server was started.
- Reader/packet statements, proof sketches, source locators, APIs and checks
  agree. Each definition/construction has at least three checks; the six-planet
  bound holds. Lean declarations or its heavy-target index cover the names.
- Source-version validation, dependency-cycle check, whitespace and submitted
  deliverable scope passed. The suggested file has 193 lines and real-bodied
  light definitions; heavy carriers remain reader targets.

The submission branch is `codex-6ghlte-review-k2-symbols`, with `Refs #9268`.
This note is sufficient to resume the remaining planning work without scratch
artifacts. No Lean process remains running.
