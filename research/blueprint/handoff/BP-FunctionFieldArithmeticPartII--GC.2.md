# BP-FunctionFieldArithmeticPartII--GC.2

Completed target-level planning pass for issue #8911 by Codex (GPT-6), session
`codex-UzSYHa`. This is a complete blueprint submission, not an interrupted
checkpoint. Packet status is `complete`; the sole stage
`FunctionFieldArithmeticPartII:GC.2` is `planned`. Every node remains
`implementationStatus: unchecked`.

## Deliverables and counts

- [Packet](../packets/FunctionFieldArithmeticPartII--GC.2.json): 9 new nodes,
  comprising 2 definitions, 2 comparisons and 5 theorems; 15 API items;
  8 definition tests; 2 new planets; 19 baseline references; 0 gaps;
  1 precise supplier request.
- [Reader](../readmes/FunctionFieldArithmeticPartII--GC.2.md): full conventions,
  named targets, APIs, tests, proof routes and acceptance calculations.
- [Suggested Lean](../suggested/FunctionFieldArithmeticPartII--GC.2.lean):
  211 lines, real-bodied light specializations of native carriers, 10 theorem
  specifications and 4 example specifications. No admitted data definition.

The three inherited GC.2 targets remain owned by the parent packet:
`root-units`, `root-divisor-groupoid`, and `adelic-root-groupoid`. They are
imported by exact IDs; the parent is unchanged. Their 9 API items and 7 tests
are retained and explained in the reader, and are additional to the counts
above. The inherited two planets plus the new two give four GC.2 planets.

## Mathematical result and boundaries

The plan uses the actual equalizer group
\(H=\{(u,v):\bar u_x=v_x^2\}\), its noninjective homomorphism to all-place
ideles, and native labelled action categories. The signed right quotient
retains the generic frame; its separate Picard functor adds the (F^\times)
arrows. The intermediate generic-framed and fully framed groupoids have
explicit equivalences and labelled Hom descent. The gluing lattice is
\(a_xO_x\), the line is \(O_X(-E(a))\), and its degree is the negative
weighted valuation sum.

The right-quotient fibre over a signed divisor has a square-class torsor of
components and a labelled product of residue \(\mu_2\) stabilizers. Counting
is over closed branch points, not their degrees. Double-quotient stabilizers
are the extension of locally square constants by the root-sign group; the
reader includes an order-four example over \(\mathbb F_5\) that rules out
an unjustified splitting. The degree-two branch example over \(\mathbb F_3\)
rules out counting geometric points instead of closed points.

FA-ADELES is resolved by the existing FA.2 `projective-adeles`,
`projective-ideles`, and `idele-divisor-exact-sequence` nodes. Ordinary
Picard, divisor, degree, tensor and curve theory are imported from the
specified SF.3 nodes and the existing AlgebraicCurves, JacobianChallenge,
AlgebraicVectorBundles and completed RestrictedProducts roadmaps. The SF.3
part packet has a `needs_changes` review: its exact mathematical contracts
are imports, not accepted or proved baseline results. No ordinary supplier
theory or already planned root-line definition is replanned here. No
cross-roadmap ownership moves or restructuring are proposed.

## Exact remaining input

The only request is **GC2-COMPLETED-LATTICES**, to the existing
AlgebraicCurves Layer 12 dictionary. For signed (D), identify the generic
fibre and completed lattices of \(O_X(D)\), including the zero element,
with \(\pi_x^{-D_x}O_x\subset F_x\); identify their residues with the
algebraic fibres. For invertible sheaves with generic frames, rational
multiplication extends uniquely to a sheaf map exactly when it preserves
the completed lattices in the required direction. Require compatibility
with tensor, dual, rational multiplication and the point/place dictionary.
The packet gives the full supplier stage ID and consuming nodes.

This replaces the imprecise CURVE-GEOM obligation with a single concrete
interface. The stage is not marked closed while that request is open.
A follow-up must discharge that interface at its existing owner, then
connect the geometric comparison and degree targets to it. Expanding the
suggested file with invented sheaf carriers or admitted data is not a
remaining planning task: the README is definitive under WORKERS.md's
2026-10-12 compact-file policy.

## Sources and audit

Read the published author copy of Yun–Zhang, Annals 189 (2019), Definition A.1
p. 514, A.1.1 p. 515, A.1.6 and all of Lemma A.5/proof pp. 517–518;
§6.2.3 and Lemma 6.4 pp. 498–499; and the inverse-uniformizer character
consumer in Proposition A.12's proof p. 525. Collated A.1.6/Lemma A.5 in
arXiv:1712.08026v2, printed pp. 84–85. URLs, access date 18 October 2026,
hashes, and the exact reading scope are in the packet. No needed source
was inaccessible, and no restricted book was used.

Finding **EGC2-1** records the reciprocal transition coefficient in the
printed Lemma A.5 proof: with its stated frame directions, use
\(\tau_\eta\tau_x^{-1}\) for the inverse-uniformizer normalization. The
published page image and arXiv v2 agree on the discrepancy. The packet
records the concrete \(O_X(x)\) check and the journal/author/arXiv correction
search. The separate tuple notation finding E9 is imported from the parent.
No source passage or section-by-section summary is reproduced.

Read the reviewed library audit first. Checked cited Mathlib statements at
`082e2d37e8b0463410cdb532e111cd43d5a66174`, and checked six relevant Tau
Ceti source files byte-for-byte against raw source at
`f790474821cf4256814db967cb154e7af3d0c369`. Read current JacobianChallenge
and completed RestrictedProducts documents in full; inspected the relevant
AlgebraicCurves dictionary and AlgebraicVectorBundles suggested interfaces.
Searched current Tau Ceti and TauCetiRoadmap read-only for the target
objects. Ordinary rational trivializations already have an owner; no root
presentation supplying this layer was found. The packet records the link
screen and scoped Mathlib/Zulip design search.

## Validation

- `python3 scripts/check_blueprint.py` on the packet: **0 errors, 0 warnings**.
- `lean-check` on the suggested file at the pinned shared baseline:
  **exit 0**, with exactly 14 declaration-uses-`sorry` warnings and no others.
  This checks signatures and real-bodied data; it proves none of the targets.
- `python3 scripts/check_sorry_data.py` on the suggested file: passed.
- Submission `intake.py check-files`: passed for the three main deliverables;
  the handoff is checked with them before submission.
- Reader/packet inventory: all 9 target IDs and names, 15 API suffixes,
  8 test names, and local Markdown links agree. No excerpt fields or
  implementation claims.
- Direct finite-field arithmetic checks confirmed the nonsplit
  \(\mathbb F_5\) stabilizer and the two square classes/two root signs for
  a degree-two \(\mathbb F_9\) residue field.

The branch contains only the four authorized deliverables. Review can start
from the lattice convention, the two inverse Hom formulas, and the nonsplit
stabilizer test; their contracts and source locators are all preserved here
or in the packet, independently of disposable scratch notes.
