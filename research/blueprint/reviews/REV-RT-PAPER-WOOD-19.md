# Verification of RT-PAPER-WOOD-19

Codex, session `codex-J6LwjP`; issue #4195; 30 September 2026.
Review base: `5a2aecc`. This worker performed none of the extraction,
its original review, or the red-team job.

All four findings are confirmed: **two medium and two low**. The exact
verdicts and implementation guidance are in
[the review JSON](../redteam/RT-PAPER-WOOD-19.review.json).
This is a verification of those four findings, not a repeat of the complete
paper extraction or every successful red-team check.

## Evidence independently checked

The result and report attacked by the red team are byte-identical at its
`c9e1212b` snapshot and this review base:

| File under `research/blueprint/papers/` | SHA-256 |
| --- | --- |
| `PAPER-WOOD-19.result.json` | `a4285ae2ef43425c8ad1c25b85bc7f4eeff32e803e56caccd40203cf07c0547c` |
| `PAPER-WOOD-19.md` | `1822afce10a49be3fed766cad7741f761caa10f691cf437cbdac5328f8203930` |

I read both complete red-team deliverables, extraction items /34, /77, /79,
/255, /298 and /315–319, their routes and notes, all 14 prerequisite records,
the two recorded gaps, the ten source-issue locators, the source and historical
source records, the library-pin metadata, and the relevant original review
passages. I also read the accepted ST.3, IG.3, IG.5 and R09.4 stage descriptions,
the reviewed ST.3/IG.3/IG.5 library-coverage records, and searched the current
partial inverse-Galois packet for a supplier of the required marked moduli.
That packet supplies no replacement for the missing interface.

Both PDFs below were fetched independently on 30 September 2026, their bytes
hashed, and the listed passages read. Printed pagination is used unless a PDF
page is explicitly identified.

| Public source | Reading in this verification | SHA-256 |
| --- | --- | --- |
| [Wood, published Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050) | Title/end pages 377 and 427; admissibility/goodness p.378; Definition 3.1 p.388; Theorem 4.5 pp.403–404; conjecture context pp.410–411. 52 PDF pages, last blank. | `154e700c1b634b9e9bde4334a19678d05ff98ca18efb6b07cb5b809f2da9c03d` |
| [Seguin, Fields of Definition of Components of Hurwitz Spaces](https://beranger-seguin.fr/assets/pdf/articles/fielddef.pdf) | pp.4–10, Theorem 3.3 and context p.12, and §6 pp.23–24; selected bibliography. 26-page author version. | `bd2084d9af14256e1bbca39d085ebcb73d7a0f191d1d13b68e16e2059484712c` |

The preprint and companion-note version records in finding /4 were inspected
in the extraction and earlier report. I did not fetch or reread those two
texts in this verification, and do not adopt the earlier workers' readings
as my own. The original Emsalem, Kanev and Cau proofs were not read here.

## Finding-specific assessment

**/1 — characteristic restriction.** The finite-group witness can be checked
directly: the swap acts by inversion on the anti-diagonal C3; the three
outside involutions are conjugate and generate S3, and the kernel projects
onto C3. Thus goodness and admissibility do not exclude the characteristic-3
input. The correction belongs in /298's explicit context and dependency,
with the existing ST.3 route retained. This is a domain defect in the
extraction's corrected statement; no stronger source-error claim is needed.

**/2 — moduli supplier.** The local dependency mismatch is real even though
the extraction already acknowledges general moduli closure debt. IG.5 is
the existing owner; R09.4 supplies general moduli foundations, not this
particular cover classification. The repair should expose the required
contract and construction dependency there. The elementary tuple `(τ,τ)`
has product one and monodromy C2, so deleting proper-monodromy components
would remove a block needed by /317 and /319. Keep the arithmetic action's
exact-subgroup guarantee and continuity. Do not strengthen it to a monoid
action: /315 correctly avoids that claim.

**/3 — pagination and pins.** Correct the review paragraph using the
verified page range and `parityContinuation.pins`. The absence of one
preferred key does not erase metadata in another key. The original review
report repeats the same provenance errors; its report of the reviewer's
own method must not be rewritten as a newly verified historical fact.
No finding here alleges an incorrect pinned declaration, and none requires
a new declaration-level audit. I therefore do not claim to have repeated
the red team's 31-statement check.

**/4 — source collation.** The required `sourceVersions` list is absent even
though version evidence is present elsewhere. Preserve historical dates
and failed retrievals when normalizing it. The companion text must remain
an author copy unless published-version collation is actually performed.
This is a protocol omission independent of the current checker's acceptance.

## Validation and limits

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-WOOD-19.review.json` — passed.
- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-WOOD-19.result.json` — unchanged input passed.
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-PAPER-WOOD-19.review.json research/blueprint/reviews/REV-RT-PAPER-WOOD-19.md` — passed.
- JSON parsing, exact one-verdict-per-finding coverage, and `git diff --check` — passed.

Only the two assigned review files change. No packet or Lean file is a
deliverable of this job, so no blueprint packet check or Lean compilation is
applicable. No library build, GAP calculation, or repetition of the inherited
finite Python diagnostics was performed. Those checks are not evidence for
these four verdicts.
