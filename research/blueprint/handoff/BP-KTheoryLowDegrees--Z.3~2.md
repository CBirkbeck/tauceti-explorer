# BP-KTheoryLowDegrees--Z.3~2

Codex — `codex-u29mo2`, 5 October 2026. Refs #6504. Branch:
`codex-u29mo2-k0-z3-revision`.
[Claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6504#issuecomment-6005114200)
and [bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6504#issuecomment-6005117024).
The full issue was reread after confirmation. This is the completed revision
pass, with the existing supplier gaps retained; it is not a checkpoint.

## Result and input

The independent [review](../reviews/REV-KTheoryLowDegrees--Z.3.md) corrected the
packet and suggested file but could not change the reader within its authorized
paths. Its `needs_changes` verdict identified the reader's stale virtual
determinant formula, missing added declarations and omitted source findings.
This revision reconciles the reader against all 260 current nodes, their
statements, hypotheses, proof steps, prerequisites, uses, APIs, tests, acceptance
conditions and source locators. It also renders all 375 baseline declarations,
coverage records, three gaps, sixteen requests, sixteen restructuring entries
and twenty-eight confirmed source findings.

The incoming revision state is commit
`6f92f5501511d0f3b9b49da7d6f2ba2f1dbcdfa6`. The review's earlier mathematical
input is `550acd5d97804b879f9f9472201894ab402e01c8`. The current 260-node input,
including the review's twenty added nodes, is retained without changes to the
nodes, baseline, coverage, gaps, requests, restructuring or source-issue objects.
The old independent `review` object is also preserved. A fresh independent
review must replace its verdict; this worker does not self-accept the revision.

The packet adds only the revision summary, six scoped source receipts and
`revisionAudit`. The suggested file adds nine missing API outlines: index-image
membership and elementary evaluation; pre-lambda homomorphism extensionality;
quotient uniqueness; the weak-line total-series and zero lemmas; composition
polynomial uniqueness; and the Newton defining identity and uniqueness.
Nineteen test names now label their examples, with a concrete binomial identity
test supplied. The index-ideal localisation API remains a named omission
contract requiring actual dual/tensor/range transports. The header no longer
says that the reader needs regeneration.

## Mathematical checks

All 56 review-ledger corrections were checked against their repaired packet
nodes and suggested statements. Important distinctions now present in the
reader are:

- For an actual finite projective P of constant rank r, the determinant is the
  Picard class of its top exterior power. For the virtual class [L]−[R] with
  nontrivial invertible L, rank is zero and determinant is [L] in Pic, whereas
  its zeroth lambda operation is the K₀ unit. No virtual top-coefficient formula
  is asserted.
- `IsLineElement` is the weak degree-one-series predicate and includes zero;
  Weibel's positive line elements additionally have augmentation one and are
  units. The reader does not identify these notions.
- Exterior-power finiteness uses projective retracts of finite free modules.
  Vanishing for a negative free class is separated from the nonnegative case.
  Stalk-rank and tensor assertions retain the finite/flat, freeness and
  nontriviality inputs inspected in the pinned sections.
- Localisation of K₀ is jointly detecting; individual local maps need not be
  injective. Picard and rank–determinant nonexamples keep their nontrivial-Picard
  hypotheses. The index definition, evaluation/injectivity, congruence, free
  calculation and localisation are separate declarations.
- Cancellation, classification and class injectivity are separate. Curve
  ampleness, resolution, affine diagonal, point ideal, exact sequence and
  inverse line are separate. Point classes and the nonzero square-zero
  computation use their actual regular-curve hypotheses.
- The p² Witt determinant uses a two-layer filtration and does not claim a
  universally nonzero Picard class. The regular-ring approximation input to
  BS17 Corollary 5.6 stays open. Spectra, support and coherent extension
  uniqueness are not replaced by proposition-valued surrogates.

All 28 source issues retain the independent review's `confirmed` findings,
including E19/E21 proof gaps and E24's positive-rank nonprincipal-ideal
counterexample. E23 requires finite presentation for the finite-free-stalk
criterion; E25 distinguishes the hyperplane ideal O(−1) from O(1); E26 separates
uniqueness of a valuation centre from existence; E27 corrects the quotient-class
sign; E28 excludes projective dimension zero. The source limitations and the
reviewer's attribution are preserved.

RS-18 remains binding. Early lambda and determinant algebra belongs to Z.3;
general regular-curve rank–determinant belongs to Z.5; the origin-dependent
elliptic test and general projective-bundle theorem are imported from their
owners. No general categorical Grothendieck group, exact category, Euler class,
Cartan map or upstream Tau Ceti roadmap is replanned.

The two confirmed red-team findings are handled by the retained correction
nodes and restructuring proposals:

- **RT-AREA-ktheory-1/31:** the doubled-origin line has Pic = ℤ and
  K₀(Vect) = G₀ = ℤ². The doubled-origin plane supplies the comparison
  counterexample K₀(Vect) = ℤ and G₀ = ℤ². The source misprint is recorded by
  its GeneralAlgebraicKTheory owner rather than duplicated here.
- **RT-AREA-ktheory-2/41:** replace S.6→Z.5 by Z.3→Z.5 and S.2→Z.5;
  remove S.7→Z.6 and retain S.2/S.5→Z.6. The broader S.6→M.4 to S.6→M.6b
  correction remains a supplier-family proposal. No atlas or application
  files were changed. The current assembly mechanism only adds edges, so
  removals require promotion of the existing proposals.

## Counts, checks and compilation

| Stage | Coverage | Nodes | Planets |
| --- | --- | ---: | ---: |
| Z.3 | planned | 152 | 6 |
| Z.4 | source_decomposed | 43 | 6 |
| Z.5 | planned | 40 | 5 |
| Z.6 | planned | 25 | 1 |

The packet status is `complete`: its target-inventory pass is complete, and
all four stages have empty `remaining` lists. No stage is mathematically
closed. All 260 implementation statuses remain `unchecked`.

There are 41 theorem, 119 lemma, 53 construction, 19 definition, 12 application
and 16 comparison nodes. The 72 definition/construction nodes have 450 API items
and 280 tests, with at least three tests apiece. Across all nodes there are
455 API items and 283 tests, 18 planets and 375 baseline citations.

`python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--Z.3.json`
reports zero errors and zero warnings. `git diff --check` passes. A separate
`intake.py check-files` check reports four files and zero problems. A separate
revision check verified:

- Exact incoming-object preservation for nodes, baseline, review, coverage,
  gaps, requests, restructure and sourceIssues.
- One reader heading for each node and exact statement, hypothesis, proof-step,
  acceptance, prerequisite, use, API, test and source-locator parity.
- Reader coverage of every baseline `provides`, coverage note, gap, request,
  restructuring description and source correction/reason/verdict.
- All 260 full node tags and all 283 full test names in the suggested file;
  API names represented by native declarations, fields or omission contracts.
  No duplicate API/test names and no internal prerequisite cycles.
- All 75 imports exist at the pins; the 195 modules used by imports or baseline
  citations have bytes equal to their pinned Git objects. This is a source
  check, not an elaboration result or a fresh 375-declaration semantic audit.

The suggested file **was not compiled**. The exact pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The source checkouts at those pins
have no existing build, and the available compiled Tau Ceti checkouts are at
other commits. WORKERS.md forbids constructing a build for this job. No Lean
process, language server or Lake build was started. Historical compiled
excerpts and whole-file receipts in earlier handoffs do not certify this file.
When both-pin builds become available, check this suggested file with
`lean-check research/blueprint/suggested/KTheoryLowDegrees--Z.3.lean` and repair
integration errors without replacing missing carriers by opaque propositions.

There are 31 node-level omission contracts: 30 omitted and one partial.
Their precise targets and missing transports are in the suggested file:

- Z.3: graded-line-groupoid, graded-line-tensor, graded-line-inverse,
  graded-line-pullback, graded-line-components, graded-line-automorphisms,
  graded-line-fibre, forget-grade, graded-self-braiding,
  projective-block-swap (**partial**), projective-graded-det, ring-spectrum-det,
  determinant-truncation, local-det-equivalence, zariski-sheafified-det and
  graded-pic-v-descent.
- Z.4: index-ideal-localisation.
- Z.5: curve-ample-line-bundle, point-ideal-sheaf and
  point-skyscraper-exact-sequence.
- Z.6: scheme-spectrum-det, determinant-triangle, bounded-complex-det,
  graded-det-pi-zero, witt-supported-input, witt-regular-perfection-comparison,
  v-sheafified-first-k, witt-supported-det, witt-det-uniqueness,
  witt-filtration-det and finite-length-det-trivial.

These do not exhaust outline-only supplier interfaces: the use-site comments
also identify missing projective-line/elliptic/conic, stalk and comodule inputs.

## Sources and recovery

The six added source receipts record scoped readings on 5 October 2026; their
public URLs and SHA-256 values are in both packet and reader. Physical PDF
pages checked in this run:

| Public source | Pages |
| --- | --- |
| Kbook.II, September 2012 chapter | 5, 8, 11, 26–33, 35–36 |
| Cohen, author manuscript 11 July 2001 | 23–24, 29–30, 94–95 |
| Serre, NUMDAM published scan | 9–10, 15–17 |
| Soulé, current Cambridge scan | 1–6 |
| Kbook.2013, 29 August 2013 author draft | 54–55, 58, 64–66, 70, 134, 154, 395 |
| Bhatt–Scholze, arXiv:1507.06490v3 | 19, 56–59 |

Current Stacks tags 09N9, 09NZ, 0F8A, 0FDS and 0BXJ were also checked.
Historical whole-source readings and individual source-issue reviews remain
the earlier workers' evidence. This revision does not claim a fresh complete
read or a published/preprint collation. The published Weibel/Cohen editions,
published Bhatt–Scholze collation and Totaro version of record were not
acquired. The timestamped Cambridge download differs from both recorded
historical hashes; no full-content or byte collation is asserted. The older
receipts are retained.

The reviewed library audit and accepted RS-18 proposal were read. Fresh semantic
checks cover the seven repaired baseline descriptions and three added
primitives, including their section hypotheses. The full 375-declaration
semantic audit remains the independent review's evidence. Two nearby upstream
documents were read in full: GrothendieckEulerForms and
RepresentationTheory/SchurWeyl.

All recovery information is in the four deliverables and the linked review.
The packet is authoritative for the reader's field ordering and content;
reader sections follow baseline, coverage, stage nodes, gaps, requests,
restructure, sourceIssues and suggested-file coverage. The revision generator
and downloaded PDFs are disposable scratch and are not required to resume.

## Precisely open supplier work

The three retained gaps and sixteen requests are not discharged by this revision:

1. **General scheme Picard interfaces:** JacobianChallenge layer A must supply
   dual evaluation, inverse classes and coherent tensor/pullback for arbitrary
   invertible sheaves. `LineBundleClass` is only a commutative monoid at the pin;
   taking its units does not prove all line classes have the required inverses.
2. **Serre over ℤ and arbitrary fields:** prove integral GL coefficient
   freeness or supply the needed finite-hull theorem, transport finite-comodule
   exact categories and their K₀ along the coefficient equivalence, and prove
   the character comparison, arbitrary-field classification/descent and equal
   integral character images. The product-coordinate square and complex
   ClassicalGroups comparison alone do not discharge these steps.
3. **Coherent spectra, support and v-descent:** H.4/H.5 must supply enhanced
   group completion, mapping spaces, truncations and Picard 1-types; SF.1 the
   perfect v-site, line v-descent and alteration covers; S.1/S.2/S.3 and K.4 the
   enhanced perfect/support models, descent and filtered additivity. The
   regular-ring smooth approximation and supported continuity needed by
   BS17 Corollary 5.6 remain included in this boundary.

The sixteen request records identify: ClassicalGroups layer 4;
JacobianChallenge A; AlgebraicCurves 12; GrothendieckEulerForms 4 and 3;
AlgebraicModuliForArithmeticGeometry R09.1; H.5:spectra; H.4; SF.1;
GeneralAlgebraicKTheory K.4:construction; S.3; KTheoryLowDegrees U.3; S.1; S.2;
GeneralAlgebraicKTheory K.3; and K.7. They include the actual categorical
Cartan/Euler compatibility and the K.7 tensor-product pairing; the nonexistent
old K.7 node is not treated as a supplier.

The next independent reviewer should verify reader agreement with the 56-item
correction ledger, the twenty added declarations and all 28 source findings;
then inspect the nine added native API signatures and their tests. Subsequent
supplier follow-ups must close the three boundaries above. No second job was
claimed in this run.
