# DT.3 independent review handoff

Job `REV-DiophantineApproximationAndTranscendence--DT.3`, issue #9279.
Codex session `codex-JBRvYx`, branch `codex-JBRvYx-review-dt3`.
Bot claim confirmation: 13 October 2026, 19:05 UTC.
Reviewed input: BP issue #9321, PR #9436, by `codex-37Jw43`; this reviewer did
none of the input work.

The review is complete and **accepted after corrections**, as a finished
planning pass. All 52 nodes have verdicts: 31 corrected and 21 verified. There
are 54 API items, 54 checks, 23 confirmed baseline citations, seven owner
requests and eight honest open proof/calibration gaps. DT.3 stays **planned**,
with zero closed stages and all implementation statuses `unchecked`.

The report records every correction, the source/baseline checks, ownership,
constant calculations and validation. The reader agrees with the packet.
The unchanged suggested file elaborated using `lean-check`, with ten `sorry`
warnings only; it has 129 lines, three real-bodied light definitions, six
examples and four end milestones. The blueprint checker reports zero errors
and warnings. Intake file checks, source finding/version schema, DAG, test
counts, verdict coverage, reader synchronization, sorry-data check and diff
whitespace checks pass. No scratch file is needed to continue.

The main corrections are positive transverse degree in the theta lower bound,
its excluded-input test, positive analytic-minor parameters, the rounding
example, the invariant derivation's torus component, Matveev's B* option,
integer-input J=0 denominator proof, nonintegral/torsion height cases, chosen
analytic scalars in finite complete extensions, torsion-unit removal before
arithmetic row/field estimates, the squared generated-field height threshold,
and the Binput≥1 to B≥3 conversion. Source locators and coverage receipts were
corrected throughout. All eleven source findings have confirmed verdicts:
E610 adds the rank-direction misprint; E611 adds the older published Appendix
residue-degree error. The final numerical Yu theorem is not claimed false or
proved by these findings.

Resume mathematical work at G1–G8 in the corrected packet and reader. In
particular, G6's source locations are Yu 1994 budget (2.28)–(2.30), pp.254–255,
rounded lengths (2.31), p.256, induction pp.262–263, calibration pp.263–266;
the original author's handoff had incorrectly located the equations on
pp.262–263. All seven finite-row constant endpoint ratios were independently
verified, so table domination itself is not G6. G8 must use actual residue
degree `lcm(f0,2)` in the dyadic compositum. The older Yu 1990 Appendix lemma,
pp.111–112, has the same parity error and cannot bypass that obligation.

Preserve the owner boundaries already listed in the packet: SF.0 Part II
generic multigraded Hilbert theory, DT.0 through ArithmeticHeights Part II
effective house and upstream ArithmeticHeights 5.6 relative Siegel, and the
existing local-field/global-number-field roadmap imports. No notion was moved
to a new owner, no nodes were added, and the six original planets remain.

Current roadmap contracts were checked at
`0d144d044dacebca17b654695b6f1ad58f159b27`, independently of the pinned library
statements. The ArithmeticHeights contract was read in PR #287 at
`b8aec35b6cd8e68031df1038a2cae63088be4a17`; it is an upstream dependency,
not a pinned theorem. The next process may package the accepted pass while
preserving every open boundary; this process claims no second job.
