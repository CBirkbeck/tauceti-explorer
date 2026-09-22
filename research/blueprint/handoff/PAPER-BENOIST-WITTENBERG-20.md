# PAPER-BENOIST-WITTENBERG-20 handoff

Issue #1296 · first checkpoint Codex · codex-a71f92 · 2026-09-22
Second checkpoint · Claude Code · cc-7b31c4 · 2026-09-22

## Checkpoint

The full published 77-page BW I paper is read, including every proof and reference. The result now has
184 items (7 library, 9 planned, 168 missing), seven routes taking **all 168** missing items exactly
once, and **two recorded source issues**. Forty-six definitions/constructions have APIs and three tests
each. Status is partial because the transitive proof inventory is not closed. No formalization is
claimed; no Lean file is authorized or compiled.

All source URLs, SHA-256 values, precise read extents, classification evidence, dependency IDs,
APIs/tests and the named gaps are in the result JSON. The report explains source corrections and
ownership. Do not restart by treating this as an unread paper.

## What the second checkpoint changed

1. **`sourceIssues` now exists**, with two entries, both verified independently against the published
   PDF (hash re-checked) and the LaTeX source of arXiv:1801.00872v3.
   * `E1`, kind `error`, affects a stated result: Theorem 3.16 (ii), p. 55, and Theorem A (ii), p. 4,
     are false as printed when dim(X) = 1 and X(R) ≠ ∅. Counterexample verified in full: E : y² = x³ − x
     over ℝ with its rational point. The proof's use of Proposition 3.9, which assumes dimension ≥ 2,
     is where the hypothesis is lost.
   * `E2`, kind `misprint`, affects nothing: the constant-class paragraph before Example 2.5 says
     "k ≥ 0 even"; both of its assertions fail at k = 0, where ω⁰ is the unit, not a torsion class.
   No erratum exists for either: Benoist's publication page lists one only for a different paper of the
   two authors, and Part II does not revisit either statement.
2. **`printed-even-genus` is removed.** A mistake found in a source belongs under `sourceIssues`
   (PROTOCOL §18) and items use the corrected statements (§16); carrying the false signature as an
   unrouted item put the same record in two places, one of them wrong. `main-even-genus` still carries
   the corrected statement, `dim X ≥ 2 or X(R) = ∅`. **`GAP-DIMENSION` is resolved.**
3. **The three unextracted secondary remarks are extracted and routed**: `remark-barred-gamma`
   (Remark 1.9, the formula x ↦ xγ̃ + β(x)β(γ̃) and the failure of additivity of the derived integral cup
   product) into the equivariant Part II; `karpenko-quadric` (Remark 3.13, the quadric threefold over
   ℂ((t))((u))((v)) with form ⟨1,t,u,tu,v⟩) into MC.0; `k3-h1-nonalgebraic` (Remarks 3.21(ii), real K3
   surfaces) into MC.7. Two new gaps, `GAP-KARPENKO` and `GAP-MANGOLTE`, record that both rest on
   results BW quotes rather than proves.
4. **Three mechanical audits of the LaTeX source, all clean**: no duplicate `\label`, no undefined
   `\ref`, and no cross-reference whose introducing word disagrees with the environment it points at.
   Note that the published PDF's extracted text silently drops the third Laurent variable in
   Remark 3.13; the LaTeX is authoritative there.

## First checks on resumption

1. Follow the live WORKERS claim protocol; never reuse an old claim. Re-read the latest issue, main
   WORKERS/PROTOCOL and accepted changes.
2. Check whether the seven routes have acquired a reviewed design/owner. Coalesce both Part II IDs with
   PAPER-BENOIST-19: EquivariantTopologyRealVarieties and QuadraticFormsRealFunctionFields. Do not
   propose a second C2 topology or real-function-field roadmap.
3. Do **not** reopen `GAP-DIMENSION` or re-derive the two source issues; they are verified and recorded.
   An independent reviewer should still check them, as for any finding.
4. Run the paper checker after every structural edit. Preserve the API/test obligations and single
   ownership.

## Priority proof work

The two literal criteria of PROTOCOL §16 for `complete` are met — the whole paper is extracted and every
missing item is routed. What remains, and what keeps the status at partial, is that several items state
results as BW quote them rather than as their primary sources prove them. Start with a coherent depth
path, not another breadth-only summary.

- GAP-EFFACEABILITY: CHK §§5.1 and 5.3 are read, including the exact infinite-field axioms and the
  homotopy→key-lemma proof. Read §§2–4 geometric presentation/effacement, then verify BW's concrete
  semialgebraic excision and homotopy axioms. The source is publicly available at Bruno Kahn's linked
  author PDF. This closes the mechanism behind BW's E2 identification.
- GAP-ABEL-JACOBI: CTSS Corollaire 1 and its coefficient-limit argument, pp. 772–773, are read. Read
  Proposition 1 and the construction identifying its maps with Bloch's λ; preserve the up-to-sign
  diagram. Locate/read van Hamel Theorem 3.1 (Utrecht metadata found; PDF fetch returned 403), including
  the general-real-closed-field adapter. Finish image = N^{d−2} and low-dimensional injectivity before
  declaring Theorem 5.4 closed.
- GAP-SEMIALG/GAP-COMPARE/GAP-STEENROD: finish Delfs, Scheiderer, Edmundo–Prelli §§2–3, and Krasnov/Wu.
  Edmundo–Prelli arXiv v3 numbers the orientation theorem 4.9, while BW cites published 4.10. Integral
  and mod-two products are different.
- GAP-PICARD/GAP-QUADRATIC: extract Brauer/Picard descent, Jacobian divisibility and Witt/Pfister. The
  generic representation-theoretic Shapiro lemma and real-closed-field carrier do not supply these
  statements.
- GAP-DIAGONAL/GAP-GERSTEN: finish Bloch–Srinivas, CTV's correspondence appendix and Kerz, keeping the
  universal extension quantifier on CH0 support. Import M.5 norm-residue; do not duplicate it.
- GAP-KARPENKO/GAP-MANGOLTE (new): read Karpenko, Theorems 5.3 and 3.8, for the order and generator of
  CH₁(X)_tors of the Remark 3.13 quadric, and Mangolte, *Variétés algébriques réelles*, Exemple 4.5.9,
  for the real K3 surface with H¹(X(ℝ),ℤ/2ℤ) ≠ 0 and H¹_alg = 0.
- GAP-CAMPEDELLI/GAP-SURFACES/GAP-QUARTIC/GAP-PART-II: perform the omitted example computations and read
  BW II §7/Proposition 7.7. Every coordinate in the Example 4.4 map is conjugated. The no-real quartic
  torsion formula is conditional over general R. Remark 5.10's full Chow/Fermat assertions require
  additional work.

## Remaining inventory and integration

Nothing from the main paper is left unextracted. Questions 2.1, 2.6, 2.16, 4.9 and the generalized Bloch
conjecture are not theorem targets. Bredon factorization in Remark 2.4(i) is not used by the Borel proof
and has not been turned into an implementation target.

SF.2/MC.2/MC.7 are broad source owners; split their sublayers in a separate authorized integration job
before adding dependencies. In particular, early SF.2 sites precede M.5 and its coniveau suffix follows
M.5. Early MC.2 cycle classes precede the divisor/zero-cycle results used by later applications. Avoid
blanket stage cycles. The current item dependency graph is acyclic.

## Checks at submission

The paper checker passed at both checkpoints, and `intake.py check-files` reports no problems. The first
checkpoint's read-only check covered ID/reference/gap resolution, acyclicity, single routing,
planned/source ownership and parent checks, all 46 APIs with 138 test contracts, ten source hashes,
no-local-path scans, and finite parity/valuation/antilinearity/genus/rank calculations. The second added
the three LaTeX audits, the re-download and hash check of the published PDF, and the full verification of
both source issues. No Lean test contract was executed. Recheck latest main and the exact three-file diff
before any subsequent submission.
