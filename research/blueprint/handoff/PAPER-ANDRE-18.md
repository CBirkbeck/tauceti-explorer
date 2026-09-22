# Handoff: PAPER-ANDRE-18 — second checkpoint

**Status: partial; not ready for acceptance of the complete paper extraction.**

Issue #1464. ChatGPT Pro, session `cgp-0922-b7d49a`, 22 September 2026.
Continues merged #1639 by GPT-6 Astra Pro, session `g6ap-0921-andre-7c4e`.
Branch: `cgp-0922-b7d49a-paper-1464`.

## Saved work and preservation

The JSON now contains **85 items: 8 library, 35 planned and 42 missing**.
All **72 inherited item objects**, both original routes, prerequisite
candidates, conventions and library pins are preserved without modification.
The earlier verification object is preserved in `verificationHistory` and
is not attributed to the current worker. All 37 inherited missing items
retain their unique provisional Part II route. Four valid comparison
lemmas and one diagnostic are explicitly unrouted in the new gap records.

The paper report retains the entire original report as a historical
prefix and appends “Second checkpoint: spectral-radius imports and the
topology hypothesis”. The old counts and old statement that no library
items have been identified refer to the first checkpoint and are superseded
by the supplement and current JSON. Do not discard the previous
ramification analysis or repeat the newly completed spectral-radius work.

The baseline JSON/report Git blobs were verified locally before editing:

```text
Original JSON: 856b5edca7c6bb961e7743c35950a654b2b96355
Original report: cd58baba6415cbbc2b4e3dcbcce738c258ed2ff1
Updated JSON: 0d414bf4580d0400f02c17fcbf7ec24eb69a16a1
Updated report: 30864efb5bbb6176af9c265ef26be38703f376d2
```

GitHub returned the updated content hashes above, matching the locally
parsed and tested files. An intermediate JSON escaping typo was corrected
before submission; use the final JSON blob above.

## New mathematics and exact library boundary

The eight library imports come from
`Mathlib/Analysis/Normed/Unbundled/SmoothingSeminorm.lean` at Mathlib commit
`082e2d37e8b0463410cdb532e111cd43d5a66174`, file blob
`dac8aa822d6a8c72df11777ae9c25ebd02c0cbfa`. They use the existing
`smoothingFun`, its positive-index infimum, convergence and domination,
the bundled `smoothingSeminorm`, its ultrametric inequality and power
multiplicativity, and the fixed-point/multiplicative-element lemmas. The
actual signatures and surrounding hypotheses were read, not every private
proof in the file. The report lists the exact declaration names.

The minpoly-based `spectralNorm` for algebraic extensions of fields is a
different API. It does not provide uniqueness for an arbitrary abstract
Banach algebra. No new ring-seminorm carrier or private spectral theory
has been proposed. Nilpotents can be in the spectral-radius kernel, and
scalar wrappers, separation and completeness must not be inferred merely
from the ring-seminorm constructor.

The four new comparison lemmas, with full mathematical proofs in the
report, are:

- A bounded ring homomorphism contracts spectral radii, by applying its
  bound to powers and taking nth-root limits.
- Comparable seminorms have equal spectral-radius functions.
- Two power-multiplicative K-algebra norms giving a fixed topology are
  equal; explicit scalar rescaling supplies both norm bounds.
- If both norms are complete, continuity of the identity in one direction
  suffices, using open mapping for the inverse.

Their exact packaged declaration matches and final generic owner remain
pending. The foundations-of-adic-spaces Layer 0 supplies the relevant
boundedness, completion and open-mapping interfaces; a `source` route is
not allowed to re-plan that upstream Tau Ceti roadmap. Do not resolve the
gap by putting a generic norm API privately in PerfectoidRamification or
by inventing a tiny duplicate roadmap. These four items are intentionally
unrouted in this partial extraction.

## Source issue E1 needs independent review

`PAPER-ANDRE-18/E1` records the stronger norm-uniqueness assertion in
published §2.2.4, second paragraph, p.13, also present in arXiv v1 §2.2.4,
p.12. The full counterexample and corrected statements are in the report.
On the abstract Q_p-algebra C_p, choose a noncontinuous automorphism fixing
the dense algebraic closure of Q_p and carrying a transcendence-basis
element t to pt. The original absolute value and its pullback are distinct
complete multiplicative Q_p-algebra norms. Their maximum is not complete:
a sequence from the fixed dense subfield is Cauchy for the maximum but
has different limits for the two norms. This identifies the missing
completeness step in the printed maximum-norm argument.

The valid fixed-topology assertion remains. The report supplies the
transcendence-basis and algebraic-closure extension argument, and carefully
distinguishes completeness of each norm from completeness of their maximum.
This is a worker's finding, **not an independently confirmed erratum**.
No independent-review field was added. No failure of the main perfectoid
Abhyankar theorem is claimed; a complete audit of downstream uses of this
auxiliary assertion is still required.

The auxiliary source is Brian Conrad's three-page official Math 248A
handout, “Completion of algebraic closure”, §1/Theorem 1.1. All three pages
were read and its first page was visually checked. It proves algebraic
closedness of the completion and recalls noncompleteness of Q_p-bar with a
reference to BGR 3.4.3/1. That original noncompleteness proof was **not**
read here. No executed test constructs the noncontinuous automorphism,
and no Lean counterexample or exact automorphism-extension API is claimed.

The JSON contains the required locator, short printed quotation,
correction, mathematical reason, known-status boundary and searched
sources. Published/preprint comparison and the recorded web/repository
searches found no correction, but are not an exhaustive novelty claim.

## Source provenance and ownership read

The source remains the published 70-page version:
https://www.numdam.org/item/10.1007/s10240-017-0096-x.pdf
DOI `10.1007/s10240-017-0096-x`. Use published locators. This continuation
reread §§2.1–2.3 in parsed text and compared both versions of §2.2.4;
it did not reread or extract the whole paper.

The main-paper PDF-byte and screenshot gaps remain: direct retrieval did
not supply bytes, and published/preprint screenshot attempts failed.
`source.sha256` is intentionally null. The successful auxiliary Conrad
screenshot does not substitute for main-paper visual verification.

The current PerfectoidSpaces and AdicSpacesPartII documents were read in
full; foundations of adic spaces was read through its complete Layer 0.
AdicSpacesPartII R0 supplies completed Huber tensors under its stated
hypotheses, not arbitrary Banach uniformization or all inverse limits.
Earlier PerfectoidQuotients and integrated-decomposition reading remains
in the inherited verification record. The full reviewed per-stage library
audit and global catalogue/reserved-ID check are still outstanding.

The Tau Ceti pin remains `f790474821cf4256814db967cb154e7af3d0c369`.
Only the newly enumerated Mathlib declarations are freshly certified as
library imports. No inherited planned/missing item was reclassified, and
no complete two-library absence audit is asserted.

## Checks actually run

Local Python checks passed: exact original Git blobs, preservation of all
72 item objects and both routes, candidates/conventions/pins/verification
history, 85 unique IDs with the stated counts, 37 uniquely routed missing
items, five explicitly enumerated unrouted gaps, all new library/API/test
records, and the structured E1 schema with no self-review field. The
original report is an exact byte prefix of the updated report.

Exact finite regressions passed: **4,704 product-norm power tests**, the
product zero-divisor test distinguishing power multiplicativity from
multiplicativity, a nonzero square-zero degeneration, and **81 scalar
rescaling windows**. These checks are not proofs of the general theorems
and do not compute or test the C_p automorphism.

The unmodified full-catalogue paper checker and intake checker were **not
run locally**, because a clone/full catalogue could not be acquired in
this environment. Read the actual **Swarm submission check** result and
logs on the PR; its observed result is recorded in the PR discussion.
Do not infer a CI pass from the local checks. No checker or workflow was
modified. The relevant full-clone commands are:

```sh
python3 scripts/check_paper.py research/blueprint/papers/PAPER-ANDRE-18.result.json
python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-ANDRE-18.result.json research/blueprint/papers/PAPER-ANDRE-18.md research/blueprint/handoff/PAPER-ANDRE-18.md
```

No Lean file was requested or compiled. No independent review was done.
Only the three authorized deliverable/handoff paths are modified.

## Resume in this order

1. Inspect this PR's actual canonical checks and resolve any genuine
   catalogue/intake error on its branch while open. Independently review
   E1 and audit later uses of the stronger abstract-algebra uniqueness
   assertion. Keep the corrected comparison lemmas separate from the
   invalid diagnostic; acquire the missing main-source visual evidence.
2. Continue the remaining §2 extraction: Banach categories, uniformization,
   integral models and complete almost-category adjoints, then §§2.4–2.9
   integrality/root saturation, rational localization, tensors and limits.
   The new §2.2 entries are not a substitute for these constructions.
   Read/extract §§3.1–3.4 completely, including tilting and the unramified
   almost-purity proof; finish §3.9, §4.1, §4.2 examples and §5.4. In §5.4
   retain the choices of Noether normalization and étale locus and any
   conditional perfectoidness hypothesis.
3. Split the inherited multi-assertion §1 packages: adjoints, algebra
   limits, exterior powers/trace, flatness transport and Galois base
   change/descent. Preserve old IDs or provide explicit successor links.
4. Finish the reviewed library audit and exact pinned supplier matches,
   including generic Galois-envelope and rigidity inputs. Resolve the four
   norm-comparison owners and the general uniform-limit supplier without
   duplicate development. Inspect proposed roadmaps, packets, reserved
   IDs and overlaps before approving PerfectoidRamification.
5. Screen the original prerequisite candidates and remaining bibliography.
   The empty `prerequisites` array means unresolved, not fully covered:
   Gabber–Ramero almost ring theory, Scholze's torsion paper Proposition
   II.3.1 and Roos's derived inverse-limit results still need exact
   source/supplier verification. Preserve the corrected Roos DOI
   `10.1112/S0024610705022416` and version-numbering distinctions.
6. Complete main-source provenance with actual PDF bytes/SHA-256 and
   visual checks. Run the full repository validator and mark complete
   only after exhaustive source coverage, correct routing of all genuine
   missing items, and all other protocol requirements are met.

## Preserve the ramification boundaries

Root saturation `g^(-1/p^∞)A°` is an intersection. Complete integral
closure is neither ordinary integral closure nor topological completion.
The almost-perfectoid uniform limit, its integral closure description and
its maximal perfectoid right coreflection D^♮ are separate objects.
Proposition 4.3.1 has only `(1)⇔(2)⇐(3)⇔(4)⇔(5)`. Theorem 4.4.2 is
fully faithful with a right adjoint, not arbitrary essential surjectivity.
Proposition 5.2.3 changes almost base between its conclusions. Theorem
5.2.1 is finite étale modulo every p^m, not unconditionally integrally.
Proposition 5.3.1(3) needs faithfulness of the punctured finite étale
algebra. The prismatic André flatness theorem is not this theorem.

Do not self-review, merge manually or `/unclaim` a submitted job. The
ordinary partial-checkpoint intake handles the release for continuation.
