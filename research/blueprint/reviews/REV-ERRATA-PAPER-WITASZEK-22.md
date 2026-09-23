# Independent review of the Witaszek errata

Job `REV-ERRATA-PAPER-WITASZEK-22` · Refs #1780. Reviewer: Codex, session `codex-7e92bd`, 23 September 2026. Original errata worker: Claude Code, session `cc-fb70e5`. This session did not write the extraction or original errata.

**Verdict: complete after corrections.** Confirmed the four original findings with corrections to scope and transcription. Added eight entries, one of them newly observed in this review; expanded E10 with a second notation slip. All twelve JSON entries carry individual review reasons. E11 has a disambiguation already available in the accepted author version; no correction was located for the other eleven.

## Sources and method

Read the relevant passages in [arXiv v2](https://arxiv.org/pdf/2002.11915v2) and the [published PDF](https://par.nsf.gov/servlets/purl/10429755). Published pages checked include 657, 662, 664, 673, 677–679, 694, 697–703; v2 comparison pages include 2, 7–9, 17, 20–22, 34, 37, 39–43 and 45. Inspected rendered pages for composition order, normalization bars, the tensor product, binomial bounds, action targets, final fibre restriction and bibliography duplication. Full hashes and mathematical arguments appear in the corrected [errata report](../errata/PAPER-WITASZEK-22.md).

Independently read [Keel 1999](https://emis.de/ft/50731), pp.279–282, including Lemmas 5.2 and 5.4. Its 34-page PDF has SHA-256 `4d87c752091896d480e6fdf3829f59db4c152e26568a6eb3a4297384ee98e272`. Checked the nonempty convention in [Stacks 004R](https://stacks.math.columbia.edu/tag/004R). This is targeted verification with surrounding context, not a claim to have reread all 51 pages line by line.

Checked the journal page, Crossref relations and update fields, arXiv history, both author publication lists linked in the errata report, and targeted erratum/corrigendum searches on 23 September 2026. No separate correction was located. Keeler's 2018 corrigendum, already cited by Witaszek, does not correct Witaszek's duplicated key or Keel's surface criterion.

## Individual decisions

| ID | Verdict | Independent check and change |
|---|---|---|
| E1 | Confirmed | Corollary 6.7 retains perfect closed residue fields; narrowed the interpretation to the introductory summary. |
| E2 | Confirmed | Rational-point inclusion in P¹ is a counterexample. Changed reach to a stated result; checked the surjective application. |
| E3 | Confirmed | Image dimension and P¹→Spec k identify the reversed sign. |
| E4 | Confirmed with corrected scope | Verified degree zero is allowed and Stacks' connectedness convention; supplied a compatible blowup example. Restored normalization bars and changed reach to the literal lemma statement. |
| E5 | Confirmed; added | Reconstructed the ruled-surface counterexample and verified that growing χ plus bounded h² supplies the stronger section hypothesis. |
| E6 | Confirmed; added | A real cubic field disproves splitting over itself; an algebraic closure repairs the argument. |
| E7 | Confirmed; added | Traced the diagram's domains and codomains. |
| E8 | Confirmed; added | Checked the zero-index failure and proved the corrected positive-index valuation bound. |
| E9 | Confirmed; added | Checked the thickening heading and Step 3's invocation. |
| E10 | Confirmed; expanded | Checked the missing codomain and missing prime using the diagrams and the conclusion on Z′. |
| E11 | Confirmed; added | Collated both bibliographies and the Fujita citation; recorded v2 as available disambiguation, not a later erratum. |
| E12 | Confirmed; new | The gluing divisor is upstairs, requiring restriction to F before passing to G. Checked both page images. |

Preserved errata E1/E3 despite their reversed order in the newer extraction. Extraction E12–E14 concern external Stacks prerequisites, so were not imported as errors in Witaszek. Errata E12 is a distinct new finding. No extraction, register, atlas or library files were changed.

## Validation

The errata checker, intake validation of the three authorized deliverable paths, and `git diff --check` pass. Exact scratch computations checked 3,730 positive-index binomial instances, 16 zero-index failures, the cubic factorization and its discriminant. General mathematical arguments accompany these finite diagnostics. No Lean file is requested or compiled, and no formalization claim is made.
