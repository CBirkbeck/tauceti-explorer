# Handoff — BP-K2SymbolsBrauer--T.4

Issue #10815; Codex, session `codex-AufC3B`; 19 October 2026.
The claim was confirmed by the bot. This is a completed target-level planning
pass, submitted for independent review, with packet status `complete` and
`K2SymbolsBrauer:T.4` coverage `planned`. It is not closed coverage or an
implementation claim.

## Scope and inventory

The current issue header and queue restrict the job to T.4. The embedded older
prompt also names T.5–T.7, which have separate jobs; no targets or files of those
stages were taken here. The four changed files are this note and the T.4 packet,
reader and suggested Lean file.

The packet adds 12 proof-completion nodes: 4 lemmas, 6 theorems and 2 comparisons.
It retains 26 existing target references from the broad T.3 packet, including
the simple transfer, section and general norm, without duplicating their node
records or copying an inherited review. `continuation.proofMap` and
`packageConsolidation` explain how assembly must merge the refinements into the
public target identifiers. The checker rejects duplicate node records across
packets; this continuation therefore imports the existing records and supplies
their completed proof plans here.

There are 21 API items and 13 construction tests on the retained section,
simple transfer and general norm interfaces. The proposed four-target DVR
supplier brief has another 19 API items and 12 tests. These are future
construction tests, specified in both packet metadata and reader. The standard
checker counts only the 12 new theorem/proof nodes and consequently reports
zero API items/tests on those nodes. Four planets are selected: Bass–Tate exact
sequence, Kato's theorem on Milnor norms, Milnor norm base change and Suslin
reciprocity. The baseline audit lists 28 declarations.

## What the completed pass establishes as a plan

- Polynomial filtration generation keeps mixed constant entries, handles
  repeated entries with the Milnor identity rather than exterior alternation,
  and proves the quotient section and Bass–Tate exactness.
- Simple norms use negative infinity residue. The reader specifies projection,
  degree, determinant norm in degree one and simple base change for arbitrary
  constant extensions before invoking Kato's theorem.
- Kato's proof now has a finite-normal-hull annihilator, prime-to-p detection,
  the normal-prime-degree residue calculation, finite descent, completion of
  the constant-extension square, and a compositum induction for towers.
  Infinite detector fields carry no asserted normalized discrete valuation.
- General transfer base change uses local Artinian composition lengths. The
  two-radical example distinguishes length `p²` from nilpotence index `2p−1`.
- The complete and finite-normalization residue squares retain inseparable
  residue extensions and their multiplicities. The general complete square
  uses explicit componentwise lattice lengths and Bézout descent, never
  cancellation of an index in a torsion Milnor group.
- Integral all-degree reciprocity is derived by pushdown to the projective
  line. The curve may be regular without being smooth over the constant field;
  no exact-constant-field hypothesis is imposed. The normed tame product and
  disjoint divisor-evaluation specialization use Tau Ceti's existing objects.

## Ownership, findings and remaining work

The single recorded gap is `G-T4-DVR-routing`. The complete-DVR substrate must
allow arbitrary, possibly imperfect residue fields. Existing
LocalFieldsRamification supplies finite-residue local fields. The registered
`LocalFieldsRamificationPartII` already owns the arbitrary-rank Temkin
GF.0–GF.6 direction, so reusing that name for DVR.0–DVR.3 would collide.
The packet instead proposes the distinct Part II module
`LocalFieldsPartIICompleteDiscreteValuations`, with four exact source-backed
contracts, proof plans, native carrier reuse, APIs and tests in
`restructure.supportPlan`. It does not invent registered prerequisite IDs.
Only the existing GF.0 maximal-extension field construction is imported from
the Temkin roadmap. The K₂ proofs depending on the DVR contracts remain
conditional until the maintainer routes and accepts that supplier.

There are three explicit requests: AlgebraicCurves Layer 2's finite
normalization/completion corollary, its Layer 12 regular-model/place/divisor
dictionary, and EllipticCurves Layer 2's evaluation milestone. Layer 5 supplies
the existing place-completion interfaces. These are requests for precise
exports of existing work, not replacement constructions. Current read-only
TauCetiRoadmap main, the relevant README and Suggested files, and current Tau
Ceti were checked. In particular the post-pin
`TauCeti.Algebra.norm_quotient_mk` must be reused by DVR.2.

The inherited confirmed findings are handled as follows:

- **RT-AREA-ktheory-1/12:** T.4 supplies the generator-independent norm and
  all-degree integral curve reciprocity for M.4. The proposed export is
  T.4 → M.4; M.4 is not used as a premise.
- **/28 and RS-28:** simple base change and the normal-prime-degree residue
  square precede Kato. General norm/residue compatibility follows it. The
  proposed order is T.3:symbols → T.4 → T.3:localization-comparison; the latter
  imports Milnor norms from T.4 and Quillen transfers from their existing owner.
  The historical `T.3/transfer-and-norm-residue` identifier is retained with
  its corrected T.4 mathematical ownership.
- **/32:** import AlgebraicCurves 12A/12B/12D; no valuation dictionary is
  reconstructed here. The new evaluation comparison explicitly specializes
  the general theorem to EllipticCurves Layer 2's milestone.
- **/8, /9, /26 and /27:** these concern T.5 or T.7 and remain with their
  separately queued jobs. This T.4 pass takes none of their arithmetic,
  certificate, Galois-symbol or Hilbert-symbol constructions.

An independent reviewer should check the integral descent and tower arguments,
the exact supplier contracts, and the continuation/import representation.
After review, route the distinct DVR supplier, confirm the three upstream
interfaces, and consolidate the retained targets at package assembly before
marking coverage closed. No additional T.4 target remains unread or unplanned.

## Sources and verification

Freshly read sources are Weibel's author-hosted combined draft of 29 August
2013 (III.6.1.4, III.6.5.3, Ex.III.6.2, III.7.1–7.6.4 and Ex.III.7.1–7.10;
PDF pp.240,244,251,253–258,265–266), Suslin's 1980 primary English scan
(§§1–2 through Theorem 2.6, printed pp.590–597/PDF pp.2–9), and the Stacks
lemmas/remarks and chapter PDF pages recorded in the reader. Source versions
and available PDF hashes are recorded in the packet. All mathematical
descriptions are in our own words; no source passages or source files enter
the deliverables.

The reader rechecks inherited K-book findings E5–E8, E10 and E11 against that
public draft and states the corrections in paraphrase. It recomputes E13's
Artinian counterexample without renewing its original restricted-edition
certification. No restricted Gille–Szamuely edition or published AMS K-book
edition was inspected. No missing book is needed for this pass: the proof
refinements explicitly distinguish derived arguments from source assertions.
Suslin's Corollary 1.10 is integral; his subsequent §2 works modulo torsion.
Theorem 2.6 is historical support for pushdown, not the sole justification of
the integral result.

The suggested Lean file elaborated with `lean-check` at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Its only warnings are two admitted
proofs, the end reciprocity theorems. Its six examples have no admissions of
their own; the elliptic specialization applies the admitted general theorem.
The order-zero residue argument and numeric checks are proved. There is no
admitted data, stand-in Milnor carrier, heavy construction or auxiliary proof
development in Lean. Elaborating signatures does not prove reciprocity.

The packet checker reports **0 errors, 0 warnings**. The admitted-data checker,
intake file checks and whitespace check pass. Only the four authorized
deliverables are submitted. The scratch directory contains no material needed
by a successor; all mathematical handoff information is in these files.
