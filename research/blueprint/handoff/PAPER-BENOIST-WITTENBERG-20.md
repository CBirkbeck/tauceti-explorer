# PAPER-BENOIST-WITTENBERG-20 handoff

Issue #1296 · Codex codex-c83e7a · third checkpoint,2026-09-22.
Prior merged work: PR#1675 codex-a71f92 and PR#1975 cc-7b31c4.

## Saved result

189 items:7 library,9 planned,173 missing; seven routes cover every missing item
once. All48 definitions/constructions have APIs and three tests. Nine source
findings E1–E9 await independent review. Status remains partial; no Lean file
was authorized or compiled.

The entire published77-page paper has been reread, including all proofs and
references. Do not restart this as an unread-paper extraction. Exact source
hashes and prior/current read provenance are in the JSON. The arXivv3 source
agrees with the printed Example4.4. The p.34 projection arrow is correct.

## Critical correction on resumption

**Do not try to finish the old invariant-Bertini task for the displayed data.**
E3 proves that no f-stable smooth complete intersection of the prescribed four
eigenquadrics exists. On Λ_2=span(x0x4,x1x5,x2²,x3²), conjugate pullback has
matrix blocks [[0,1],[-1,0]] followed by scalar conjugation, hence square−id.
It cannot preserve a complex line. The quadratic vanishing ideal of a smooth
four-quadric complete intersection is the four-dimensional defining span;
f-stability would preserve its one-dimensional weight-four intersection.
The report proves the ideal statement via the twisted Koszul resolution and
projective-space cohomology. No independent-review verdict is claimed.

`campedelli-descent` retains its ID but now states the obstruction. Four new
items expose the eigenspaces, operator, no-line argument and ideal calculation.
`GAP-CAMPEDELLI` is an open replacement-construction problem for the intended
real-empty Picard-torsion example, not a claim that all such surfaces are
impossible. Read Reid§2.1/Godeaux§6 or a correction before making any replacement
an unconditional theorem. Those primary proofs were not obtained in this pass.

E4 corrects δ=−i*(γ−π*α) in Lemma2.14. The minus sign does not affect
admissibility or the induction in(2.5). Its sign calculation is finished;
general Gysin/coherent foundations remain open. E5–E9 are notation/variance
slips with page locators in the report. Preserve E1/E2 and the corrected
dimension/positive-even guards. The earlier categorical assertion that no
erratum exists has been replaced by a bounded-search statement.

## Where to continue

Follow the live WORKERS claim protocol and reread the latest deliverables.
Recheck whether the two shared Part II proposals have acquired accepted owners;
coalesce with PAPER-BENOIST-19 rather than duplicating either.

For a coherent depth pass, choose one remaining primary proof path:

- CHK§§2–4 geometric presentation/effacement, after the already-read §§5.1/5.3.
- CTSS Proposition1 and the actual Bloch λ comparison; van Hamel Theorem3.1
  and its arbitrary-real-closed-field adapter remain unread.
- Delfs/Scheiderer/Edmundo–Prelli foundations and Steenrod/Wu comparisons,
  keeping integral multiplication distinct from mod-two convolution.
- Witt/Pfister and Picard descent; Bloch–Srinivas/CTV and Kerz Gersten;
  Karpenko Theorems5.3/3.8 or Mangolte Exemple4.5.9.
- BWII§7/Proposition7.7 and the remaining quartic/Fermat computations.

Resolve exact supplying nodes for the shared Koszul construction, coherent
projective-space cohomology and Gysin self-intersection. They are explicit in
GAP-FOUNDATION-GRANULARITY. The new local ideal adapter does not create a
generic Koszul owner. SF.2 and MC.2 require fine sublayers to avoid the broad
stage cycles described in the report; the item graph itself is acyclic.

## Checks

Paper and intake checks passed, together with IDs, internal references,
acyclicity, single routing, API/test and gap checks. The2706-case exact
algebra diagnostic passed. It is not a Lean or geometric-existence check.
All144 mathematical test contracts remain unexecuted in Lean. Check latest
input hashes and the exact three authorized paths before submitting again.
