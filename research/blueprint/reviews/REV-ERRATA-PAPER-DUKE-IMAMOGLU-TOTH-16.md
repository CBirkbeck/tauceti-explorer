# Independent review of the Duke–Imamoḡlu–Tóth errata

Job `REV-ERRATA-PAPER-DUKE-IMAMOGLU-TOTH-16` · Refs #1786. Reviewer: Codex, session `codex-7e92bd`, 23 September 2026. Original errata worker: Claude Code, session `cc-fb70e5`. This session did not write the extraction or original errata.

**Verdict: complete after corrections.** Confirmed the ten existing entries, with a correction to E5's reach and substantial refinements to E6's explanation. Added three confirmed variable/index misprints and recorded a rejected candidate from the newer extraction. The JSON now has thirteen confirmed entries and one rejected entry, each with a review reason.

## Sources and scope

Independently collated the publisher PDF and the 29 July 2016 author preprint, including the relevant formulas on rendered page images. Published pages read include 951, 957–958, 961–963, 965–966, 968–970, 972, and 981–985; corresponding author pages include 2, 8–9, 11–12, 14–18 and 27–30. This is targeted verification, not a claim to have reread the entire article line by line.

The corrected [errata report](../errata/PAPER-DUKE-IMAMOGLU-TOTH-16.md) provides public source links, full paper hashes and mathematical checks. Additional primary sources read:

- Duke 1988, pp.77–79 and 85: Fourier convention, unit normalization and Theorem 5. PDF SHA-256 `3c468d0c0d79ec2ab29f96dcdda6094a4ceb6603a4caaae947c0bef443f9005f`.
- Humphries–Nordentoft, arXiv:2211.05890v2, pp.20–21: Remark 3.22 and norm relation (4.5). PDF SHA-256 `b77f82b7eb2dea80b9bae7ce143cad9dbecc32e6370267e514c57ad91d7d9c07`.
- Friedlander–Iwaniec (2010), pp.385–387, especially Theorem 2.1: the infinite squarefree family. Downloaded PDF SHA-256 `81d299f00992cac649416f98116adab956553514211dc773f8bb90a2313bb46b`.
- DLMF 5.12.6, 10.2.2 and 13.18.9: sine integral, Bessel series and Whittaker conversion.

Checked the journal page, Crossref relation/update fields, Duke's publication list, and title/arXiv/erratum searches on 23 September 2026. No separate correction was found. E5's coding objection is already known from Humphries–Nordentoft; the report distinguishes that observation from the independently verified counterexample family without asserting global novelty.

## Decisions

| ID | Verdict | Evidence and change |
|---|---|---|
| E1 | Confirmed | Applied the operator to y^s; compared (7.10). |
| E2 | Confirmed | Unit phase preserves the norm, Shimura relation and conjugated coefficient product; checked both page images. |
| E3 | Confirmed | Verified all five occurrences and recomputed the numerical eigenvalue. |
| E4 | Confirmed | Compared the sum with the individual area identity (3.3). |
| E5 | Confirmed | Proved the primitive period and exact monodromy; checked an unconditional squarefree-density input. Changed reach to the false stated bound; it is unused later. |
| E6 | Confirmed gap | Tracked the cosh factor from Duke's coefficient estimate and the cancelling norm from Rankin–Selberg. Corrected the explanation of c(φ) and removed an unnecessarily sharp L-value bound. |
| E7 | Confirmed | Euler expansion requires χ(𝔭). |
| E8 | Confirmed | Negative D is within scope; extended locator to the all-sign continuation on p.982. |
| E9 | Confirmed | Checked an exact sine-integral value and DLMF's general formula. |
| E10 | Confirmed | Derived the missing √2 and checked the subsequent displayed coefficient. |
| E11 | Rejected candidate | The paper already displays the requisite t^s power series. The nonsingular coefficient recurrence validates the intended argument even at s=1/2 and when c₀=0. |
| E12 | Confirmed; added | Norm variable x should be z; this is extraction E15. |
| E13 | Confirmed; added | Completed Eisenstein series needs z on the right; this is extraction E16. |
| E14 | Confirmed; added | Mixed summation indices in the Eisenstein L-series; checked both images and expanded the divisor sum. |

Preserved the ten existing IDs. Extraction E12–E14 concern external sources and were not added as DIT16 mistakes. The rejected extraction E11 candidate is retained here with an explicit rejected verdict, so it cannot enter the confirmed-error register. No extraction, atlas, register or library files were changed.

## Validation

`scripts/check_errata.py`, intake `check-files` on the three authorized deliverables, and `git diff --check` pass. Scratch diagnostics independently checked nine exact minus cycles and unit products, symbolic monodromy and Laplacian identities, the eigenvalue arithmetic and special-function constants, plus five high-precision Appendix integrals with relative errors below 1.1×10⁻²². General arguments accompany all numerical diagnostics. No Lean artifact is required or compiled; no formalization claim is made.
