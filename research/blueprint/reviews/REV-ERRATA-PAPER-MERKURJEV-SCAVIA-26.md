# Independent review of ERRATA-PAPER-MERKURJEV-SCAVIA-26

Codex, session `codex-hjdg0j`, 23 September 2026; issue #1867.
Original errata author: Claude Code, `cc-7b31c4`. Neither the original
errata nor its extraction was written by this reviewer.

**Complete:** E1–E8 confirmed, E9 rejected, E10–E15 added and confirmed.
There are fourteen confirmed findings and one rejection. All are scoped to
the two accessible manuscripts. The [JSON](../errata/PAPER-MERKURJEV-SCAVIA-26.json)
contains individual verdicts naming this review; the
[report](../errata/PAPER-MERKURJEV-SCAVIA-26.md) gives the checked arguments.

## Provenance and limits

| Public source, accessed 23 September 2026 | SHA-256 | Use |
| --- | --- | --- |
| [ArXiv v1 PDF](https://arxiv.org/pdf/2410.12560v1) | `699028a3a64729eeee85305c12962d1db2bee1cca0816ce3a7c4d7a6b65788ac` | 21-page preprint; finding passages and their definitions/applications |
| [Merkurjev author PDF](https://www.math.ucla.edu/~merkurev/papers/Negligible.pdf) | `e1049ad7b42d25e27211316e860e762762a4508052c3593d5fc7022d364a8eb3` | 21 pages; compared every finding passage |
| [Crossref record](https://api.crossref.org/works/10.1090/jams/1059) | `4fa28d9f44ca9e494170c263b604ef68b78d27538f007eee62b706b9f503b855` | Journal bibliographic data, version-of-record URL and update relations |
| [Scavia's current page](https://www.math.univ-paris13.fr/~scavia/) | `8a509f23242fbf2a67c5a31d3ae60b6b1ccbad9362c78964fe59e1c850d611b1` | Current publication listing and linked version |

The [AMS article](https://www.ams.org/journals/jams/2026-39-01/S0894-0347-2025-01059-9/)
and both its /journals/jams/ PDF and the /jams/ PDF linked by Crossref were
inaccessible. PDF requests returned HTTP 403 with HTML, and browser
retrieval failed. **The published text was not read.** Neither publisher
corrections nor persistence of these findings in JAMS is certified.

Read the manuscript statements, definitions and arguments on pp.1–19 as
needed for the findings, including the whole proof of Lemma 4.1 and its use,
the coefficient sequences in §3, and Claims 5.4–5.7. All finding pages
(pp.4–8,11–13,15,17–19) match between the two PDFs after whitespace,
ligature and hook-arrow encoding normalization. Image inspection included
pp.4,5,8,12,13,15,19. The initial automated collation detected a hook-arrow
encoding difference on p.15; inspection showed no mathematical difference,
and normalization of that encoding completed the comparison. No e-print
source archive was used for this review.

## Verdicts

| ID | Verdict | Scope and independent check |
| --- | --- | --- |
| E1 | Confirmed | Error / stated result. The real sign-action example has a proposed generator that is not invariant. Checked the roots-of-unity repair and its precise use in Theorem 1.3. |
| E2 | Confirmed | Misprint / nothing. Inflation targets K; only middle exactness of the five-term segment is needed. |
| E3 | Confirmed | Misprint / nothing. Restriction gives u′, corestriction/projection formula returns u. |
| E4 | Confirmed | Misprint / nothing. Sequence (3.3) is the trivial-module sequence with boundary ∂₂. |
| E5 | Confirmed | Error / proof. I+pE₃₁ does not preserve Ṽ; top-left block multiplicativity modulo p² repairs the map. |
| E6 | Confirmed | Misprint / nothing. Inverse torus character, including the p=3 coincidence. |
| E7 | Confirmed | Misprint / nothing. Projection formula requires the relative norm, which is zero. |
| E8 | Confirmed | Misprint / nothing. Ambient group U before restriction to N. |
| E9 | Rejected | Correct optional remark; its omitted routine calculation is not a source error. Verified using both the carry cocycle and Galois lifts. |
| E10 | Added, confirmed | Misprint / nothing. Reversed action phrase after Theorem 1.3. |
| E11 | Added, confirmed | Misprint / nothing. Kummer quotient and Galois group must use the variable extension K. |
| E12 | Added, confirmed | Misprint / nothing. Sum over the r coset representatives, not undefined k. |
| E13 | Added, confirmed | Misprint / nothing. Div(V), not undefined Div(X). |
| E14 | Added, confirmed | Misprint / nothing. Coefficient pushforward, then group restriction, in the opening proof of Theorem 5.1. |
| E15 | Added, confirmed | Misprint / nothing. Missing n in the Kummer coset and wrong field label in Lemma 3.2. |

The inherited E2–E4,E6–E7 classifications said “affects the proof” despite
recording unambiguous notation slips whose intended computations already
occur in the surrounding text. They now affect nothing. E5 remains an actual
failed proof step with a different, explicitly verified map as its repair.
E1 remains a false unrestricted lemma; its hypotheses as used in the main
proof suffice. No claim is made that all external inputs or main theorems
have been certified by this review.

For E9, the least-residue section of N produces the two carry terms. Both
matrix directions have pairwise-zero products, so independent Kummer lifts
supply a lift of every Galois representation into N when μ_{p²} is present.
The report goes further: cyclotomic-valued cocycles over K(μ_p), followed
by restriction/corestriction of the p-torsion obstruction, prove the same
assertion without that stronger assumption. This checks the mathematical
content instead of classifying every omitted proof in a remark as an erratum.

## Correction search

[ArXiv history](https://arxiv.org/abs/2410.12560) still ends at v1,
16 October 2024. Crossref identifies JAMS 39 (2026), 73–94, with online
publication on 22 May 2025; relation is empty and there is no update-to or
updated-by entry. [Merkurjev's publication page](https://www.math.ucla.edu/~merkurev/publicat.htm)
links the unchanged manuscript without an erratum. The inherited Google
Sites address was not a usable publication list, but Scavia's current
Sorbonne Paris Nord page is readable: it links arXiv v1 with the JAMS
citation and no correction. Searches by title/author with erratum and
correction found no matching item. All checks are dated 23 September 2026.
“New” is bounded by these checks and especially by the unavailable journal
text; all locators explicitly preserve manuscript-only scope.

## Validation

The errata schema, four-file intake check and whitespace check pass.
A scratch diagnostic over F₃,F₅,F₇ independently computed centralizer
dimensions dim A^U=2, dim A^N=3 and dim A^Z=5; the torus weights and
p=3 exception; and the zero relative norm of E₁₂. It checked all 81,625,2401
pairs respectively in the carry-cocycle calculation. A generic symbolic
block multiplication verified the p² cross term, and explicit I+pE₃₁
matrices checked the preservation counterexample. These finite calculations
support the general arguments written in the report, rather than replacing
them. PDFs, images, scripts and raw provenance remain outside the repository.

No Lean file is required by this issue, no Lean compilation was run, and
no formalization claim is made. Only this review's named deliverables and
handoff are changed; generated registers are left to intake.
