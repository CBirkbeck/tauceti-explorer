# REV-HabiroNumberFields--HB.2 handoff

Completed independent review, issue #6446, 2026-10-06. Codex (GPT-6), session
`codex-5w7FQz`; input author was session `codex-in1rju`. This is a finished
review, not a checkpoint. No second job was claimed.

Verdict **needs_changes**. The [review report](../reviews/REV-HabiroNumberFields--HB.2.md)
contains the evidence, counts and exact corrections required in the definitive
[reader](../readmes/HabiroNumberFields--HB.2.md). That reader was not editable
under this issue's deliverable list, so the report hands those changes to the
revision job. All six baseline declarations were confirmed at the pins; one
new node was verified and three corrected. No nodes or baseline citations
were removed or added.

Corrections made in the [packet](../packets/HabiroNumberFields--HB.2.json):

- Specify the bilateral-series domain as a small neighborhood of
  `(X,Y)=(1/5,2)`, `Z=−4/5`, preserving `|X/Y|<|Z|<1` and `Re S>0`.
  Align the QM.0 and P.1 requests; handle removable negative-index summand
  singularities by the backward recurrence. The reader's blanket implication
  from `0<X<1<Y` fails at `(9/10,2,−1/10)`.
- Explain compatibility between the 2013 left homogeneous and 2024 right
  bar resolutions through their degree-three chains and positive degree-two
  Bocksteins. Preserve the `[0]` correction and determinant-one conjugation.
- State explicitly that ℓ is an odd prime and m≥1 for the signed Chern
  evaluation. Correct Proposition 4.6 to Hutchinson v4 p.7 and add p.6
  for the explicit Bott Chern value. Qualify parent imports so no fixed
  CGZ/GSWZ map is constructed by choosing its desired value at eta.
- Confirm all four supplied source issues. Reclassify EHB2.3 as `error`
  because its leading constant is wrong. Add EHB2.5, the published p.236
  reference to (56) where the KMS identity (55) is intended. Preserve the
  inherited E14 comparison gap without modifying the parent packet.

The [suggestion](../suggested/HabiroNumberFields--HB.2.lean) uses the current
Mathlib Complex import and records the limited elaboration result. The full
`lean-check` attempt failed at the missing PowerClassGroup object file in
the existing shared build. That build has the pinned Mathlib but a different
Tau Ceti checkout. A Mathlib-only extraction through `kms_oddOrder` passed
with only `sorry` warnings; the full suggestion and Tau Ceti power-class
example remain unelaborated. No library build, update, cache fetch, language
server or checkout mutation was performed.

Independent checks passed for 6354 admissible triples at orders 3,5,7,9
over F19,F31,F43,F73 (one fixed primitive ζ per field), every primitive
Dedekind phase at those orders, the corrected Gaussian constants via
Ramanujan product evaluation, and all eight proposed edge insertions
against the extracted atlas graph. All five downloaded source hashes
matched the packet. The review report includes exact public URLs, parameters,
counts and numerical errors, so the disposable scratch files are unnecessary.

Next revision must be authorized to edit the reader. Align its convergence
domain, prime hypothesis, Bott citation, left/right resolution convention,
source-finding count and validation provenance with the corrected packet.
Then obtain independent revision review. Keep the seven precise supplier
requests and three honest gaps: generic analytic exports, the V.4 bar map,
the early M.8 split and fixed-map sign comparison, Bass–Tate proof closure,
and downstream HB.5/HB.9 assembly remain planned work. Apply the HB.5
scalar-two/planet rescope through the family assembly, not by adding HB.4
as an HB.2 prerequisite.
