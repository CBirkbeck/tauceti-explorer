# Independent review of ERRATA-PAPER-BENOIST-19

Reviewer: Codex, session `codex-hjdg0j`, 23 September 2026.
Issue: #1877. Original errata author: Claude Code, session `cc-442dc5`.
**Complete: 17 confirmed findings, two rejected (E16, E19).** Each entry
has a verdict naming this review. Corrections and reach were revised in
place; the [mathematical report](../errata/PAPER-BENOIST-19.md) gives the
independent arguments. No new source finding was added.

## Sources and version check

All downloads below were accessed on 23 September 2026. PDFs and diagnostic
code remain in scratch, outside the repository.

| Source | SHA-256 | Scope read |
| --- | --- | --- |
| [Published Numdam PDF](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf) | `8dfc0f221ab510ba1ecfe7c5b5fde12c217019f33d704ea89ce1a0c144398d3b` | All finding locators and surrounding arguments, including §§1–5, 6.2–6.4, 7.1–7.5 and 8.2 passages needed below |
| [Current author PDF](https://www.math.ens.psl.eu/~benoist/articles/realperiodindex.pdf) | `e4c90a314c6d9ea38d3bd8498a6ec050aa763c4150890c98cc295390ef4ece2a` | The same finding pages; 48-page journal layout with page numerals omitted |
| [ArXiv v2](https://arxiv.org/pdf/1804.03642v2) | `5dc12ae78790cfc5f2fb3ce9921269cbf593c38022a41a0c7da798795c9c3cda` | Corresponding passages listed in the concordance below; 39 pages |
| [Benoist–Wittenberg, arXiv v2](https://arxiv.org/pdf/1801.00872v2), the exact version cited as [9] | `80f5cc3eb5359f6535541eacf4d7d81efdc009c62226ed279f46054baadf8655` | (1.22), (1.33), Proposition 1.22 and Proposition 2.9, pp.13,15,28,34 |

The author and published finding pages have identical extracted text apart
from the printed page numerals; individual disputed formulas were also
inspected in published page images, including pp.72,84,85 and 103. This is
a targeted review of the errata, not a full-paper mathematical certification.
The original Jannsen input behind (4.5) was not independently re-proved or
certified here. Neither earlier extraction items nor their completion label
were treated as mathematical evidence.

## Individual verdicts and concordance

| Finding | Published page(s) | ArXiv v2 page(s) | Verdict and revised scope |
| --- | --- | --- | --- |
| E1 | 76,86 | 12,19 | Confirmed: error / stated result. P¹ fibre contradicts finiteness; strict-transform wording is already correct. |
| E2 | 70 | 6–7 | Confirmed: gap / proof. Make the integral lift compatible before taking its trace. |
| E3 | 81–84 | 16–18 | Confirmed: gap / proof. Missing evaluation factor; narrowed the inherited reach. |
| E4 | 84–85 | 18 | Confirmed: gap / proof. Coefficient mismatch; supplied a typed uniform-case repair. |
| E5 | 85 | 18 | Confirmed: gap / proof. Add the curve-class correction. |
| E6 | 98,103 | 29,33 | Confirmed: misprint / nothing. Correct sign, unchanged trace. |
| E7 | 99 | 30 | Confirmed: misprint / nothing. Target injectivity follows immediately from density. |
| E8 | 95 | 27 | Confirmed: misprint / nothing, only the odd-period formulation. Exact restricted period is correct by corestriction. |
| E9 | 95–96 | 27 | Confirmed: gap / proof. Include a transcendence basis in K₀. |
| E10 | 96 | 28 | Confirmed: gap / proof. Corrected theorem locator; gave a counterexample to the parameter criterion and an explicit repair. |
| E11 | 72 | 8 | Confirmed: misprint / nothing. Relative-dimension twist. |
| E12 | 88 | 21 | Confirmed: misprint / nothing. Normal-sequence boundary degree. |
| E13 | 108 | 37 | Confirmed: gap / proof. Corrected inherited point; gave the generic-point and specialization argument. |
| E14 | 107 | 37 | Confirmed: misprint / nothing. Base field K in the Brauer group. |
| E15 | 106–107 | 36 | Confirmed: misprint / nothing. Restore nonzero. |
| E16 | 103 | 33 | Rejected: the alleged word is absent; all copies already say cokernel. |
| E17 | 69,71 | 6–7 | Confirmed: misprint / nothing. Undefined degree parameter. |
| E18 | 77 | 12 | Confirmed: misprint / nothing. Switch v to w at the singular centre. |
| E19 | 86–87 | 19–20 | Rejected: an unfixed scalar in the eigensummand identification permits the printed formula. |

## Changes to the inherited mathematical conclusions

The JSON and report no longer say all nineteen findings are new mistakes.
E16 was a transcription error; E19 imposed a normalization absent from the
source. E1 retains the false finiteness assertion but removes the accusation
that the source confuses a strict transform with the full inverse image.

E3 and E4 are classified as affecting the proof, since no counterexample to
the propositions was established. The omitted Bockstein factor leaves the
specific residual (1+a)[e]₁; nonconstant evaluation alone does not establish
failure. The source defines Θ by nonzero evaluation. In the main induction,
the half-period class has constant evaluation (n/2) mod 2 on Ψ=Θ, so both
uniform values must be considered. The report derives the typed repair of
E4 from the actual coefficient sequence (7.2), the trace-zero map ψ and BW's
Picard primitivity theorem. It does not assume an integral lift downstairs
or full vanishing of the Brauer class upstairs. General evaluation remains
unresolved by this review; the preceding homological comparison remains a
cited input. The earlier assertion that all main results were fully certified
has therefore been removed.

E7's correct target monomorphism has a direct dense-open proof, and E8's
restricted-period equality follows from restriction/corestriction. Those
entries now identify minor slips rather than unresolved proof gaps. E9 is
an omitted field choice with an explicit finite-generation repair. E10's
repair uses a Newton step for w²+1; exact symbolic checks verified its
identity, residue and the two-dimensional linear counterexample to the
printed parameter criterion. E13's argument uses general points on both real
arcs, factors out orders along D and compares signs off D. It also explains
why the simultaneous specialization is valid on the required dense open set.

## Correction search

The [Numdam record](https://numdam.org/articles/10.1007/s10240-019-00108-7/)
and [journal record](https://pmihes.centre-mersenne.org/articles/10.1007/s10240-019-00108-7/)
identified no correction. [Crossref](https://api.crossref.org/works/10.1007/s10240-019-00108-7)
has an empty relation and no update-to entry. The
[author's current page](https://www.math.ens.psl.eu/~benoist/) links this
paper without an erratum, and the current PDF retains the checked passages.
[ArXiv history](https://arxiv.org/abs/1804.03642) ends at v2, 15 May 2019.
Exact-title searches with erratum and correction found no matching item.
These checks are dated 23 September 2026 and bound the use of “new”; they
are not a guarantee that no correction exists elsewhere. ArXiv v1 was not
needed for the named-version comparison and was not read.

## Validation and limits

`check_errata.py`, the four-file `intake.py check-files` check, and
`git diff --check` pass. A scratch SymPy diagnostic passes for the Newton
identity/residue, the parameter counterexample, the two uniform cancellations
and the degree-four sign/trace computation. These are algebraic diagnostics,
not proof-assistant certification. No Lean file is part of this job, no Lean
compilation was run, and no result is claimed to be formalized. The paper
extraction and generated register were left for their respective workflows.
