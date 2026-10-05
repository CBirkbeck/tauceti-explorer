# HB.3 planning handoff

Agent: Codex, session `codex-G5RbR1`.
Branch: `codex-G5RbR1-habiro-nahm-hb3`.

The target-level pass is finished. Packet status is `complete`; the sole scope
entry, `HabiroNahmSeries:HB.3`, is `planned`, with precise remaining work.
It is not closed. This is a completed planning submission for independent
review, not a checkpoint and not an implementation.

## What is supplied

The four deliverables are the HB.3 packet, reader, suggested file and this note.
The accepted parent packet is unchanged. All twelve parent HB.3 target nodes
are imported by their existing identifiers, and seven distinct nodes refine
their missing interfaces:

- One definition: the polynomial system clearing denominators and negative
  exponents, with five API items and five discriminating tests.
- One construction: the positive coherent root lift and its existing adjoin
  field, with eight API items and four tests.
- Four theorems: the exact polynomial Jacobian, the coordinate-field
  differential/unramified bridge, the coherent-root exterior boundary, and
  the boundary left by the signed formal equations.
- One comparison: coordinate/root fields, rationalized Bloch classes,
  embedding evaluations, torsion detection and the CGZ Rogers normalization.

There are thirteen API items, nine unit tests, two new planets and sixteen
pinned baseline citations. The two new planets plus the parent's three give
five HB.3 planets in assembly.

The former local algebraicity gap is resolved at the planning level:
differentiate the polynomial equations, invert the Jacobian, kill all
coordinate differentials, extend that vanishing through field generation,
then use the pinned essential-finite-type and unramified finite-module
theorems. The proof verifies every hypothesis of
`Algebra.FormallyUnramified.finite_of_free`, rather than assuming finite
generation as an algebra or inferring algebraicity from analytic isolation.

The public Zagier chapter was obtained. Its HB.3 source-access gap is resolved;
no claim is made about the parent HB.4 or HB.5 gaps. The formerly ownerless
Rogers extension is assigned precisely to Polylogarithms P.1.

## What remains and where to resume

There are four gaps and four corresponding owner requests, all with exact
statements and consuming node identifiers in the packet:

1. `Polylogarithms:P.1`: the real Rogers function on the projective real line,
   CGZ continuation, period π²/2, endpoint values, projective five-term
   descent to the corrected integral CGZ convention, and normalization tests.
2. `BorelRegulators:R.4`: regulator injectivity modulo torsion. Existing
   rational comparison up to a nonzero scalar suffices for zero detection.
3. `K3BlochGroups:V.4`: unique divisibility over algebraically closed
   characteristic-zero fields and transport through the convention comparison.
4. `K3BlochGroups:V.3`: the integral class intended by the signed GSWZ
   equations, its exact relation to the antisymmetric and corrected CGZ
   conventions, and any integral K-theory lift used for the Habiro twist.

The last request is exposed by the calculation
∂Σ[z_i]=Σ M_ii z_i∧(−1) in the true exterior square. Twice this boundary
vanishes. The calculation certifies a doubled integral class and a
rationalized class, and does not identify the unmultiplied integral class
claimed by the parent's `general-nondegenerate-class`. Reconcile that
interpretation before using its integral torsion order in HB.9.

A follow-up imports the suppliers' exact new node identifiers, checks that
their statements discharge these requests, and updates the mathematical
comments for unavailable supplier types into actual suggested signatures.
It must preserve F=Q(x)⊆E=Q(chosen roots), retain all Jacobian scaling
factors, and apply the circle-valued Rogers map only to integral classes.
No further local proof decomposition is requested at target level.

## Sources and correction

Read on 5 October 2026:

- CGZ arXiv:1712.04887v3, §§1.1, 1.3, 2.1, 7.1.
- Zagier, *The Dilogarithm Function*, public Durham chapter, II.1A and II.3A–B.
- GSWZ arXiv:2412.04241v2, §§1.7 and 3.1.
- Stacks Lemma 10.148.3, tag 00UO, statement and proof.

URLs, access dates and PDF hashes are in the packet. No local source is missing.
The requested supplier theorems are not claimed independently established.
The upstream Multiquadratic and Completed/ContourIntegration documents were
read in full for style. The reviewed HB.3 audit and every link-map entry
mentioning the roadmap were inspected; no extra structural overlap was found.

`HabiroNahmSeries/E-HB3-rank-one` records the misprint in Zagier II.3B(a),
printed p.44 / PDF p.42. The listed solutions for A=1/2 and A=2 are reversed.
Direct substitution verifies the corrected values used throughout. Visual
inspection of the source confirms the printing; no existing published
correction was located in the recorded searches. The rank-one classification
itself is unaffected. This finding awaits independent review.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNahmSeries--HB.3.json`:
  **zero errors, zero warnings**, including checks against the available
  declaration index.
- `lean-check research/blueprint/suggested/HabiroNahmSeries--HB.3.lean`:
  **elaborated successfully**, exit 0, only the expected declaration-uses-`sorry`
  warnings. Memory was checked before each invocation; there was one
  elaboration at a time and no language server or library build.
- The compilation used Mathlib commit
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The suggested file imports only
  Mathlib modules. Tau Ceti baseline `f790474821cf4256814db967cb154e7af3d0c369`
  was searched at that revision; no Tau Ceti declaration is cited or imported.
- All seven declaration names, thirteen API names and nine test names agree
  across packet, reader and suggested file. New node IDs are disjoint from
  the parent; its twelve HB.3 nodes are listed as imports. Source excerpts
  are at most 300 characters, and every node remains `unchecked`.
- `git diff --check` passed. Only this job's four authorized deliverables
  are included.

The suggested file fully types the polynomial, root, differential and exterior
statements. Its Bloch-class consequences and `regulatorConventionComparison`
are explicit mathematical comments because the supplier types do not exist at
the pinned baseline. No replacement Bloch-group structure, invented Rogers
type or proposition-valued placeholder condition is used. Successful
elaboration therefore validates the available signatures, not those unsupplied
interfaces or any proof.

Scratch sources and working notes are disposable. All information needed to
review or continue this part is in the four deliverables and their cited public
sources.
