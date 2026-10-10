# REV-FIX-RT-AREA-topology~4 handoff

Issue #6521; Codex (GPT-6), session `codex-dN8Riv`; 10 October 2026.
Claim confirmed for comment 6099316779. Branch
`codex-dN8Riv-review-topology`; atlas base `aa195923d`.
Continues PR #8459. This session did none of the reviewed fix, its predecessors,
red team/verification, or original blueprints/assemblies. Only #6521 claimed.

## Completed authorized work

All 27 findings retain explicit dispositions in the report. The three
issue-named bounded reviews are complete: Polylogarithms accepted;
HabiroNahmSeries accepted; QSeriesPartitionsAndMockModularForms needs_changes.
A needs_changes verdict completes a review. The previous top-level reviews
are archived in reviewHistory; broader blueprint objections, all gaps,
requests and planned coverage remain. No suggested declaration changed.

Fresh correction: HB.8/fgi-collection now cites GSWZ §2.5, Definition 2.11,
equations (117)–(119), printed pp. 29–30, the following periodicity paragraph,
and critical-value equations (115)–(116), p. 29. Replaced internal TeX labels
and claims of verbatim transcription with source support in our own words.
No hypothesis, normalization obligation, API or dependency changed.

Freshly checked the relevant GZ/GSWZ, quantum-modular and dilogarithm
interfaces; public PDF hashes agree with the preceding report. Other source
readings in its evidence table are explicitly attributed to the earlier audit.
Milnor's AMS Appendix remains inaccessible (HTTP 403); do not claim a fresh
reading from this run. Current upstream main is
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The relevant volume,
forms/Stokes, corner and homogeneity interfaces are owned there. Nothing was
edited or built in the read-only upstream environment. Pinned Gaussian and
PDCode files match f790474; covariance needs PosSemidef and density law PosDef.

Fresh checks: the three packet validators report zero errors/warnings
(75/109/537 nodes). Sequential lean-check runs at the prescribed shared pinned
build all exit 0 with only sorry warnings: Polylogarithms 462, HabiroNahmSeries
441, QSeries 1469. Memory exceeded 100 GB. Extra-file compilation/check results
in the report are retained earlier evidence. No next step needs scratch files.

## Concrete correction found in read-only QT inspection

Finding /7's supplier is sound, but current
`ArithmeticQuantumTopology:QT.5/volume-and-chern-simons` explicitly uses the
P.2 tetrahedron identity without listing
`Polylogarithms:P.2/hyperbolic-volume` as a prerequisite. The current QT graph
contains no edge to that exact supplier. Its broad open P.2 request is not a
substitute under PROTOCOL §3. After authorization, add the exact node id to
that theorem's prerequisites. Keep the geometric comparison request and
G4/G5 open; adding a planned theorem edge does not close their gaps. Also
check the ordered-vertex/sign translation between QT's shape coordinate and
P.2: their written normalizations differ, which by itself proves no sign error.
This gives a specific continuation rather than another complete supplier audit.

## Remaining reader corrections (separate scope)

The QSeries reader must add the ninth scalar cocycle export near line 2964,
name the lower-boundary inverse eta multiplier at 2972, fix Taylor scaling
near 2818/2987, and remove the obsolete unwritten/no-nodes QT.7 statement near
4166–4168. The trefoil comparison is already qualified. Preserve its broader
native-form, fifth-order and proof/supplier objections. Reader edits are
outside both this issue and its queue outputs.

## Blocking scope mismatch

The GitHub issue and its full instructions name only this report, three base
supplier packets and their three suggested files. WORKERS.md explicitly says:
“Edit only the files the issue names, plus your own scratch space.”
The queue additionally requires four files:

- research/blueprint/packets/ArithmeticQuantumTopology.json
- research/blueprint/suggested/ArithmeticQuantumTopology.lean
- research/blueprint/packets/Polylogarithms--P.2.json
- research/blueprint/suggested/Polylogarithms--P.2.lean

The queue prompt is absent. issues.py:deliverables_complete requires this
job's reviewer on all five packets, while the extra packets have accepted
full reviews by REV-ArithmeticQuantumTopology~2 and REV-Polylogarithms--P.2.
The seven-output GitHub predicate passes and the eleven-output queue predicate
fails. Do not alter queue/intake logic to hide that mismatch.

Explicit authorization was requested during this run and has not arrived.
The PR is therefore a checkpoint blocked on file scope. Resolve that scope
with the manager before repeating any mathematical audit. After authorization,
independently finish the QT /1–/16 and P.2 /7 bounded reviews, make the precise
QT dependency correction above, preserve their full reviews in history, and
record this job's bounded verdicts. Keep QT's 8 gaps/19 requests and P.2's
2 gaps/3 requests. Resolve Milnor access before claiming a fresh Appendix
reading. Earlier unchanged signatures already elaborate.

Submit this run's single checkpoint PR and stop; do not claim another job.
