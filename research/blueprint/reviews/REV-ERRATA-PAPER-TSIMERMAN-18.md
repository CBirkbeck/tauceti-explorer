# REV-ERRATA-PAPER-TSIMERMAN-18

**Verdict: confirmed with corrections.**

Reviewer: Codex, session `codex-7e92bd`, 23 September 2026. Original errata author: Claude Code, session `cc-fb70e5`. I did not write the errata or contribute to this paper’s extraction.

## Sources and version comparison

I downloaded the [final Annals article](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) and [arXiv 1506.01466v5](https://arxiv.org/pdf/1506.01466v5), and read the affected definitions, arguments and consumers: published pp.380–386 and v5 pp.2–7. I checked the relevant page images, including the introductory claim, the final field-of-definition proof, the reflex-ideal paragraph and the earlier degree notation. Exact SHA-256 hashes are in the errata JSON and explanation.

The original comparison contained two factual slips: v5 is dated **1 December 2015**, not 5 December, and its pp.6–7 already contain the reflex-ideal quotient-notation error. The final version makes the erroneous norm subscript explicit but does not introduce the entire issue.

I rechecked the Annals page, arXiv history, Crossref metadata, the author’s publication page and title/erratum/corrigendum searches. No separate correction of E1–E4 was located. E5 records corrections directly visible in the final article. The arXiv comment about a serious error in v2’s general-Shimura claim is distinct from these findings and is not evidence that they have been corrected.

## Individual verdicts

| Finding | Verdict and check |
| --- | --- |
| E1 | **Confirmed.** The ideal I is from the reflex field K*, so its norm and quotient ring must come from K*. The ideal identity uses t, not the induced map r on classes. I checked the product with the conjugate reflex norm and the resulting unit ratio. Added the necessary qualification that a quotient cardinality requires an integral ideal representative; fractional ideals use their rational norm. Corrected the claim that this occurs only in publication. |
| E2 | **Confirmed, reclassified as a misprint.** The proposition states existence of a pair, while the consumer fixes A. The immediately preceding proof already fixes arbitrary A. I supplied the uniform estimate a_E(n)≤d_{2g}(n), summed through X, and checked that the class-number lower bound gives the required distant B for every A. This is an understated quantifier, not a missing mathematical ingredient. |
| E3 | **Confirmed under the usual regulator normalization.** Derived R_E/R_E₀=2^(g−1)/Q_E from the logarithmic unit lattices. Derived Q_E≤2 from u/bar(u) and roots of unity. In degree six the ratio is 2 or 4, so literal equality fails. The ratio is bounded in terms of g; it need not be determined by g alone. The relative Brauer–Siegel exponent is unchanged. |
| E4 | **Confirmed; added.** The introductory literal equality of fields of moduli fails for CM elliptic curves of discriminant −23. I checked the Hilbert polynomial in the official Sage reference and verified that it is irreducible modulo 2 with negative discriminant. One j-invariant is real and two are nonreal, so their Q(j) fields are distinct as embedded subfields of C, even though they have the same degree. The final detailed proof already supplies the bounded common-definition-field argument needed instead. |
| E5 | **Confirmed for v5; already corrected in publication.** Direct comparison verifies four earlier definition slips: the Hodge section must be nonzero, the dimension is half the CM degree, the later CM field has degree 2g, and the normal closure is that of K over Q. These are recorded as known published corrections, not new published errors. |

I also examined a possible reflex-embedding type error suggested by extracted text. The page images have a bar over K in the target of the embeddings; that candidate was an extraction artifact and is excluded. This avoids adding a false finding from flattened mathematical text.

## Scope and changes

The three original IDs are preserved, each with a review object. E4 and E5 have their own independent verdicts. The JSON and explanation now agree on version scope, classifications, repairs and correction searches. The proof of E2’s stronger statement is already present, and the final detailed field-of-definition argument handles E4; none of these findings changes the André–Oort theorem.

This is a review of the specified errata and adjacent passages, not a complete new audit of the paper or its prerequisites. In particular, the unrelated exact degree equalities in the reflex-reciprocity discussion are not certified by E1’s notation check. No extraction, library audit or generated register is edited.

## Verification

Exact scratch diagnostics checked the Hilbert polynomial’s reduction modulo 2 and its discriminant

`−5^18 · 7^12 · 11^4 · 17^2 · 19^2 · 23`.

The general counting and regulator repairs are proved in the findings; they do not rely on numerical sampling. Required repository checks passed:

- `python3 scripts/check_errata.py research/blueprint/errata/PAPER-TSIMERMAN-18.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/reviews/REV-ERRATA-PAPER-TSIMERMAN-18.md research/blueprint/errata/PAPER-TSIMERMAN-18.json research/blueprint/errata/PAPER-TSIMERMAN-18.md`
- `git diff --check`

No Lean file is required or compiled. Only the three issue deliverables are changed; source downloads and diagnostics remain in scratch.
