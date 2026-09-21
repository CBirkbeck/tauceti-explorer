# Handoff: PAPER-ANDRE-18

**Status: partial checkpoint, not ready for acceptance.**
Issue #1464; GPT-6 Astra Pro; session `g6ap-0921-andre-7c4e`;
21 September 2026. Continue the same paper job after the checkpoint is
merged and the queue makes it available; follow the ordinary claim rules.

## Saved work

The two paper deliverables contain 72 source-based items, a report, and a
provisional `PerfectoidRamification` Part II brief. There are 35 `planned`
items in PerfectoidSpaces P0/P3/P8 and 37 provisional `missing` items, each
routed once. None is claimed library-implemented. The status must remain
`partial` until the work below is completed.

The source is the **published 70-page version**:
https://www.numdam.org/item/10.1007/s10240-017-0096-x.pdf
DOI `10.1007/s10240-017-0096-x`. Use published locators. The preprint is
arXiv:1609.00320, but no identity of numbering between versions was assumed.

## Resume in this order

1. **Repair the access/provenance boundary.** Obtain the PDF bytes, record
   URL, retrieval date and SHA-256, and visually inspect the formula-heavy
   statements. Parsed text was available; direct downloads failed DNS and
   screenshot requests failed. The null hash is intentional. Read the
   reviewed library audit through a working large-file route; the file
   reader returned empty content for `data/library-coverage.json`.

2. **Finish source extraction, not just the main theorem.** Section 1 was
   read and entered, but split the remaining multi-assertion packages
   (module adjoints, algebra limits, exterior powers/trace, flatness
   transport, and Galois base change/descent). Most of §2 and §3 is not
   extracted. In particular start with §2.1–2.3 (Banach categories,
   uniformization, integral models and the complete almost-category
   adjoints), then §§2.4–2.9 (integrality, root saturation, rational
   localization, tensor products and limits). Read §3.1–3.4 completely,
   including the field/tilting inputs and the unramified almost-purity
   proof. The selected §3.5–3.8 items are not a substitute for those
   sections. Finish §3.9, §4.1, §4.2 examples and §5.4. Section 5.4 was
   read but not entered: retain its choice of Noether normalization and
   étale locus, and do not turn its conditional perfectoidness into an
   unconditional conclusion. Extract all boundary examples and imported
   key theorems as required by PROTOCOL §16.

3. **Complete the pinned-library audit.** Pins: Mathlib
   `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti
   `f790474821cf4256814db967cb154e7af3d0c369`. Current-branch searches are
   leads only. Only lines 1–115 of the pinned FontaineTheta file were
   opened; do not cite later declarations as already checked. Check
   general algebraic results such as the Galois-envelope and rigidity
   lemmas as well as the obvious perfectoid terms. Change statuses and
   routes where actual pinned declarations supply an item.

4. **Finish ownership and prerequisite screening.** The complete current
   PerfectoidSpaces and PerfectoidQuotients documents were read. The
   AdicSpaces document and integrated PerfectoidSpaces decomposition
   were only partly read. Read the remaining closest upstream roadmap
   references required by the guide. Inspect proposed roadmaps, packets,
   reserved IDs and reviewed overlaps. Resolve the general uniform-limit
   construction's supplier before retaining it in the Part II. The
   `PerfectoidRamification` keyword search had no result, but its name
   has not been exhaustively collision-checked. Screen the separate
   prerequisite candidates and the remaining bibliography; an empty
   `prerequisites` array currently means unresolved, not fully covered.

5. **Validate and submit continuation.** Run the actual repository
   `check_paper.py` against the full atlas and new-roadmap catalogue.
   Review every source statement, especially those with shared context,
   and split multipart results. Mark complete only when the whole paper
   is covered and every genuinely missing item is routed exactly once.
   Do not add an independent review of your own work.

## Do not lose these mathematical distinctions

`g^(-1/p^∞)A°` is an intersection. Complete integral closure is not ordinary
integral closure or topological completion. The almost-perfectoid uniform
limit, its integral closure description, and its maximal perfectoid
coreflection are separate objects. Proposition 4.3.1 has the one-way arrow
`(1)⇔(2)⇐(3)⇔(4)⇔(5)`. Theorem 4.4.2 is fully faithful with a right
adjoint, not arbitrary essential surjectivity. Proposition 5.2.3 changes
almost base between its two conclusions. Theorem 5.2.1 is modulo every
`p^m`, not unconditionally finite étale integrally. Proposition 5.3.1(3)
needs faithfulness of the punctured finite étale algebra. The prismatic
André flatness theorem is not this ramification theorem.

## Checks already run

The unmodified repository checker was executed successfully with a scoped
local catalogue containing the verified PerfectoidSpaces P0–P9 IDs. Its
Git blob hash matched `cf3cae9e7d2d41209bf9fa4d719fd6fe17a69f1f`.
That is a schema/owner-ID/multiplicity check, not a full-atlas or baseline
validation. No Lean file was required, generated or compiled. Only the
three issue-authorized deliverable paths belong in this checkpoint.
