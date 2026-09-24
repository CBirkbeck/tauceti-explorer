# REV-ERRATA-PAPER-HARPAZ-WITTENBERG-20

**Verdict: both findings confirmed with corrections, only in the public manuscript versions checked.**

Reviewer: Codex — codex-hjdg0j, 23 September 2026. The errata author was Claude Code — cc-442dc5. I wrote neither that errata file nor the underlying extraction. This completed review concerns the two recorded findings; it does not claim a new full-paper census.

## Sources and version boundary

Freshly downloaded and read the [author manuscript](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), PDF4 and PDF12–18, including the complete proofs of Propositions3.1/3.3 and Theorem4.2. Compared PDF4 and PDF12–17 with [arXiv v2](https://arxiv.org/pdf/1802.09605v2): their text agrees after whitespace normalization. The two finding passages were also rendered and visually inspected.

| Source | SHA-256 | Reading |
| --- | --- | --- |
| HW author manuscript | `2e425ee63d77e6fc53ddd76aca8c8b7ab36be95b078fbcec5e2a8d7f325e6ad9` | PDF4,12–18; rendered PDF4/17 |
| HW arXiv v2 | `54cd8757102b7e67437486c35e26a48597a6686c117031ff57c09c433f19f1de` | PDF4,12–17 comparison |
| [Demarche author manuscript](https://webusers.imj-prg.fr/~cyril.demarche/articles/BMgroupes.pdf) | `3b4b0665958266bf8e79f10989dcc30be1c59c3711201727a380c25877dbe929` | PDF12 and §8 PDF26; rendered PDF26 |
| [Wittenberg survey](https://www.math.univ-paris13.fr/~wittenberg/slc.pdf) | `30f4bdcf95ad848ff133f71903fd7541bc3f160e650fe09359e0f10e4bd5923a` | PDF21–22, Theorem3.7, Corollary3.8, Remark3.9 |

The [published AMS PDF](https://www.ams.org/jams/2020-33-03/S0894-0347-2020-00943-2/S0894-0347-2020-00943-2.pdf), its journal-path alias and its HTML viewer returned HTTP403. The correct article identifier ends in **00943-2**. The [JSTOR record](https://www.jstor.org/stable/26937518) did not supply readable full text either. These failed comparisons are not evidence of agreement: neither verdict asserts that the journal version retains the manuscript wording.

Fresh correction checks: the [arXiv history](https://arxiv.org/abs/1802.09605) ends at v2, 15 October 2019; [Wittenberg's publication page](https://www.math.univ-paris13.fr/~wittenberg/) lists no correction for this paper; [Crossref](https://api.crossref.org/works/10.1090/jams/943) has no update-to/updated-by entries and an empty relation object. Exact-title correction and erratum searches located no relevant correction. “New” is limited to this search and these manuscript versions.

## E1: confirm the citation-scope gap; narrow its reach

The literal application of Theorem4.2(i) lacks a check of its standing rational-connectedness hypothesis. That is the finding confirmed here. The former classification as affecting a stated result, and the presentation of rational connectedness as the required correction, went beyond the evidence.

There are two separate mathematical points:

1. A torsor under a split torus over an integral variety is trivial over its function field, so its total space is birational to the variety times a split torus. Consequently the geometric fibres used in the remark do not become rationally connected merely by being universal torsors. Adding rational connectedness of X is a sufficient restricted repair of the literal theorem application.
2. A geometric section is a weaker input. Proposition3.3(i) constructs one by splitting the exact character-module sequence when its quotient is free; it does **not** assume rational connectedness. The remark explicitly invokes this construction. Thus it would be unjustified to conclude that the original implication needs rational connectedness or is false without it.

I also read a transcription of Skorobogatov1990, Theorem1 and proof, pp.205–209 (Skorobogatov, On the fibration method for proving the Hasse principle and weak approximation, Séminaire de théorie des nombres, Paris 1988-89, Progress in Mathematics 91, Birkhäuser, pp. 205-219). The copy read was an unauthorised transcription, which this project does not cite and does not link; the passage needs re-reading in a legitimate copy before this reading is relied on. The geometric condition there is the existence of a smooth point over the function field of a general geometric affine line, denoted (Sect). A geometric section on a dense open supplies this condition on general lines. This explains why GHS and rational connectedness can be sufficient ways to obtain the input without being necessary conditions. The transcription hash is `f4d20f4c717e3821c9c0d1d77d1e58c88f8498e3dab6e78a49ea47643519dfbb`; its scan images were not inspected.

This review does not silently substitute Sko90's geometrically integral-fibre statement for the split-fibre variant cited as Sko96. That full extension was not certified here. To preserve the remark's original generality, the source argument needs its section-based fibration variant stated and justified. Alternatively the rationally connected special case is justified by the theorem as printed. Wittenberg's earlier Remark3.9 also states the broad implication, so simply deleting that generality is not an established correction of a false result.

The JSON now records **gap / the proof**, explains the distinction, and retains the former assessment as history. No counterexample to the implication or the main zero-cycle and approximation statements is asserted.

## E2: confirm the endpoint slip; retain Demarche's cyclic endpoint

The manuscript's lower bound m≥1 is outside the range of the presentation in its cited source. However, replacing it by m≥3 is unnecessarily restrictive in that source's convention. Demarche's public manuscript, §8 PDF26, explicitly starts at n≥2 and discusses the n=2 case as a valid rational case. Its numbering differs from the journal reference; this review does not pretend otherwise.

At m=2 the presentation is

\[
x^2=1,\qquad y^2=x,\qquad yxy^{-1}=x^{-1}.
\]

Eliminating x gives a cyclic group of order4: conversely a generator of C4 with x=y² satisfies all three relations. At m=1 the exponent 2^(m−2) is not an integer, so the same presentation does not define Q2. An additional convention would be needed for that endpoint.

The corrected entry therefore uses **m≥2 with Q4=C4**, or **m≥3 if nonabelian generalized quaternion groups are explicitly intended**. The latter is a valid narrower convention, but it is not forced by Demarche or by the phrase that the known cases have m≤4. The mathematical weak-approximation conclusions for the existing groups are unaffected.

As a finite diagnostic, I checked the normal-form multiplication

\[
(i,j)(k,l)=\bigl(i+(-1)^j k+2^{m-2}jl\bmod 2^{m-1},\ j+l\bmod2\bigr),
\]

for m=2,3,4. It has orders4,8,16, satisfies the defining relations and all 4,672 associativity triples, and is abelian exactly in the first case. This supports the endpoint calculation; the argument reducing m=2 to C4 already proves that case.

## Changes and validation

Added the two job-attributed review verdicts. Corrected E1's reach and E2's range, preserved their IDs and superseded assessments, and made the unverified journal-version boundary explicit on each finding. No additional finding was established in the inspected passages. The underlying extraction and central register are outside this job's edits; the intake handles propagation.

Checks passed:

- `python3 scripts/check_errata.py research/blueprint/errata/PAPER-HARPAZ-WITTENBERG-20.json`
- Four-file intake check, including the job handoff.
- `git diff --check`.
- Seven page-level manuscript comparisons and the finite group diagnostic described above.

No Lean file was required or compiled. Source downloads and diagnostic code stay outside the repository.
