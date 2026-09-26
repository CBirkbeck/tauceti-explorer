# BP-PrismaticCohomology--PR.0 — elaborated algebra and p-local coefficients

Codex — codex-7e92bd. Issue #978. This continues the merged checkpoint in
PR #3121; the predecessor author/session and access records remain provenance,
not claims of independent review by this worker. Status is **partial**.
Scope stays PR.0–PR.7, with PR.8 outside this issue. Only the four authorized
packet, reader, suggested-file and handoff paths are submitted.

## What changed

All 39 preceding node objects, 45 baseline records, 16 source records,
36 API items and 38 tests are retained. The seven unrefined integrated IDs
remain in `inheritedWork`, with their R2 corrections and gaps. They are not
claimed to have typed signatures in this file or to be completed by this prefix.

The whole suggested file now elaborates. Its original eleven errors were in
concrete examples: the integer square-zero ring lacked an opposite module
action, and a let-bound alias in the completion example needed its existing
ring instance. The file now restricts scalars along the actual opposite-ring
equivalence and installs the central-action instance. It preserves nonzero
p-torsion, every theorem premise and all predecessor acceptance examples.

Seven nodes are added, including two promotions of existing API:

- Frobenius image-unit detection under the target Jacobson-radical condition.
  The target need not have a delta structure and the ring map need not be delta
  compatible; this avoids assuming a Frobenius on a ring whose operation is
  being constructed.
- The first-coordinate Witt unit criterion under the radical hypothesis.
- `localizeJacobson`, the unique compatible operation on an existing ordinary
  localization whose target has p in its radical, with three API items and
  three tests.
- Promotion of the integer Frobenius identity already in the file.
- `intAtPrime`, on Mathlib's actual localization of Z at (p), with three API
  items and four tests, including delta_2(1/3)=1/9 and delta_2(-1)=-1.
- Promotion of its integer-base compatibility API.
- Initiality of Z_(p) in the source coefficient category, with torsion allowed
  in the target; the proof uses integer-cast compatibility and the established
  delta-localization universal property.

Totals: 46 nodes (3 definitions, 11 constructions, 25 lemmas, 7 theorems),
42 API items, 45 tests, 5 planets, 51 baseline references, 3 gaps, no new
supplier requests, and no closed stage. Two promoted API names occur once in
Lean. Every implementation status remains `unchecked`.

## Evidence and ownership

The issue was read before and after the winning bot confirmation. The owner
README, the entire four-file checkpoint, the eight integrated nodes and their
R2 correction/gap records, the accepted AUDIT-38 and its review, scoped RS-01
decisions and incident links were read. The global library-coverage file has
no per-layer reviewed records for this roadmap; the accepted audit shard is
the relevant reviewed evidence. Its advanced absence claims were not converted
into baseline declarations. Relevant upstream GrothendieckEulerForms and
JacobianChallenge documents were previously read in full and their bytes
matched at this snapshot.

All 45 inherited baseline statements were reread directly at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174, together with the six added Jacobson,
prime-ideal and localization-at-prime declarations. The opposite-action
construction uses the existing restriction-of-scalars machinery. Tau Ceti
remains pinned to f790474821cf4256814db967cb154e7af3d0c369; no Tau Ceti module
is imported by this file.

Fresh BS arXiv:1905.08229v4 PDF bytes were acquired:
SHA-256 `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a`.
Printed pp.13–17 were read in full, and pp.14,16–17 rendered and inspected. This
includes Example 2.6, the full localization proof, Remark 2.16, and the full
classical-completion proof. The first paragraph of the Lemma 2.18 proof was
read; its continuation and Elkik/van der Kallen inputs are not certified.
Historical source-access records are retained without attributing them to this
worker. The source issue register, arXiv history, author papers page and Annals
article landing page were screened. No publisher full-text collation or
whole-paper reading is claimed. One editorial misprint in the preprint proof
of Remark 2.5 is recorded as E1, with no mathematical effect and no novelty or
publisher-text claim. No new mathematical source error was found
in the newly developed range; existing findings outside it remain their owners'
work and were not independently verified.

## Validation

The complete suggested file compiled with Lean 4.34.0-rc2: zero errors and
117 warnings, all declarations using `sorry`. It contains 75 distinct named
declarations and 45 acceptance examples; API promotions do not duplicate Lean
declarations. All 2,090 reached Mathlib source files were byte-matched to the
pinned tree. No Tau Ceti module is imported. These are signature checks only.

The indexed blueprint checker reports zero errors and zero warnings; the
four-file intake reports zero problems. API/test parity, exact preservation of
all 39 predecessor nodes, source-issue/version checks and mutation checks pass.
The internal graph has 97 edges and is acyclic. Every explicit prerequisite
is internal or a checked Mathlib reference; this is not a global atlas-cycle
certificate. The reader has 8,160 words.

The publication guard matched all 76 captured inputs and all four
predecessor deliverable blobs at main `3b2d4cc136827f0fca362a1eeb44fa922f1a6101`, and confirmed the unchanged
issue body and winning bot claim. Two global source-issue files were refreshed:
the nine changed records were read and the fresh register was screened for the
focal source and locators; no changed correction affects this work. Their fresh
copies remain in scratch. Exactly four files are submitted through Git Data
REST; no git commands were used.

Finite exact arithmetic checked all 199 Witt vectors over Z/p^k for
(p,k)=(2,1),(2,2),(2,3),(3,1),(3,2),(5,1), comparing existence of an actual
Witt-product inverse with invertibility of coordinate zero. The negative
control (1,1) at p=2 over Z/6 fails the first-coordinate-only criterion.
Another 2,378 rational inputs with denominator prime to p checked that
(x-x^p)/p remains in Z_(p), including the two explicit dyadic values above.
These are acceptance calculations, not proofs or executions of Lean bodies.

## Exact remaining work and resume point

The completed signature check closes the prototype-elaboration gap. Proofs
are still a plan. First implement the typed delta, Witt-coordinate,
localization and classical-completion constructions on their actual carriers.
The one-power continuity modulus and the finite-generation condition for
unconditional completion uniqueness are preserved.

For Remark 2.16, `localizeJacobson` assumes the radical target; it does not
construct the universal localization along V(p). Construct that ring and its
ordinary initial property, prove its radical condition, compare with the
monoid generated by all Frobenius iterates of S, then establish the completed
variant. An arbitrary S^(-1)A may have no delta structure, so applying the
completion constructor directly to it would leave a missing premise. This
still feeds the integrated local-distinguished-generator theorem.

Free delta-algebras, perfect delta/Witt classification, actual prism ideals and
examples, rigidity, envelopes and perfect-prism/perfectoid equivalence remain
required. Preserve the six other integrated PR.0 IDs and the PR.1 structure
sheaf ID. Their accepted R2 radical, derived-completeness, regularity and
source-correction conditions remain binding. PR.1–PR.7 retain their full site,
comparison, animated, Nygaard, absolute, q-crystalline and F-crystal worklists.
No ordinary completion statement supplies the derived Lemma 2.18.
