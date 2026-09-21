# Handoff: PAPER-XIE-YUAN-22

Refs #1270. ChatGPT Pro — cg-6b83f1.

## Checkpoint delivered

Read every section, proof and reference of arXiv:2108.09722v1. The packet has 107
items, including every numbered statement; 3 verified library carriers, 11 exact
planned interfaces and 93 missing items, each routed once. There are seven source
routes and two proposed Part IIs. The report includes the source/read ledger,
normalization conventions and concrete field-descent and intersection-multiplicity
diagnostics. No atlas or other roadmap has been modified.

The input atlas is pinned to `aa74d637a0cb9d88e38aa8da265dcec2a8c87ee1`; Mathlib and
Tau Ceti pins are recorded in the packet. The Pages archive was obtained and hashed,
but original paper-byte downloads failed. No paper SHA-256 was invented.

## Required resumption

1. Obtain and hash the exact final author/journal text. Compare it to the 29-page v1,
   especially Propositions 2.1, 3.2, 3.6 and 5.4. Do not attribute the v1 diagnostics
   to the published text without that comparison.
2. Check the generic Legendre-point counterexample to the k_(A,X)=k_A shortcut and
   the noninjectivity example for the intermediate-field intersection map. The
   report supplies an independent-fields candidate bypass for Proposition 3.1.
   Prove its quotient, trace and isogeny-descent prerequisites; retain the general
   Proposition 3.6 target as unresolved unless it is actually repaired.
3. Resolve the m_i convention in Proposition 2.1. The report gives a finite projective
   surface cover of generic degree four with a fibre of length six. Serre multiplicity
   is four. Expected dimension alone does not identify these. A consistently positive
   Serre-weighted inequality may suffice for the height argument, but needs proof.
4. Finish the original Gubler/Conrad/Yamaki/Manin–Mumford source-proof ledger. The
   converse height-zero ⇒ dense-small-points is Gubler 4.3/4.4, not XY Lemma 5.2 alone.
   Preserve the trace quotient and one-variable hypotheses.
5. Verify the pencil's generic-member/normality and spreading details, the zero-
   dimensional branch of Lemma 5.3, and the finite-base-change-to-a-section bridge for
   p-primary torsion. Do not replace p-primary multisections by étale ones.
6. Reconcile the shared height routes with the partial PAPER-YUAN-26 packet and the
   then-current accepted restructurings before creating duplicate design jobs.

Use the existing item IDs and gaps G-SOURCE/G-FIELD/G-INTERSECTION/G-INPUTS/G-PENCIL/
G-OWNERS. The report is not an instruction to silently weaken the theorem or drop
unverified source targets.

## Validation and status

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-XIE-YUAN-22.result.json`
returned **ok**. Additional local checks passed for IDs, known suppliers, exactly-once
routing, the recorded dependency DAG, numbered coverage, a monomial basis and several
symbolic normalization identities. These do not prove the geometric diagnostics or
close the source-proof gaps. **Lean not run**; there is no Lean deliverable in this job.

Status stays **partial**. This is a checkpoint, not a complete extraction or a request
to activate its Part II briefs before independent review. After intake merges the
checkpoint the queue may release the job for resumption; no manual label change,
issue closure or merge is part of this submission.
