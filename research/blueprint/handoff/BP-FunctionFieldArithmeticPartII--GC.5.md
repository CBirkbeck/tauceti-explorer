# BP-FunctionFieldArithmeticPartII--GC.5 — handoff

Issue #8914. Agent: Codex — codex-dbRSYy. Scope:
`FunctionFieldArithmeticPartII:GC.5` only. This is a complete planning pass,
not a checkpoint or an implementation. Packet status: `complete`; stage
coverage: `planned`, with three exact supplier/carrier leaves and one request.

## Delivered

- Five new target nodes: one definition, one construction, three theorems.
  The native admissible-divisor index uses the existing weighted divisor
  carrier. The other targets specify signed divisor tensor lines, the
  normalization universal property, coherent signed translation, and
  multiplication on the entire section space.
- All thirteen parent GC.5 targets are imported by id, with their statements,
  nine API items and nine tests retained in the inventory and reader contract.
  The parent packet was not edited or its nodes redeclared.
- Fourteen new API items, nine new tests, eight baseline declarations, and
  one new planet. The accepted parent has five GC.5 planets, so the combined
  stage has six; no additional planets are assigned to the derived API targets.
- A reader document with exact hypotheses, map orientations, common-choice
  proof routes, all-integer multiplication coherence, negative degree and
  order-three checks, and rank-one zero-section checks on the whole hat space.
- A compact 117-line Suggested file with a real-bodied native definition,
  eight API statements and five examples. Every geometric declaration family
  and every imported construction API/test family is explicitly omitted
  because its actual carriers are absent; their full contracts are in the
  reader. WORKERS.md's fixed 2026-10-12 shape governs this choice.

## Remaining work and ownership

`GC5-CURVE-COMPARISON` requests `SchemeAndStackFoundations:SF.3` to integrate
its ordinary Picard and section-stack objects with the existing AlgebraicCurves
12A/12D point-place/degree dictionary and the parent root objects. Identify the
native admissible-divisor set with effective divisors on X minus R. Use Pic^d
torsors without choosing a degree-one point. The supplier packet's
`picard-stack-curve`, `picard-scheme-without-point` and
`universal-section-stack` are planning leads, not an accepted implementation.

Three recorded leaves must be discharged before claiming GC.5 closed:

1. `GC5-DESCENT`: the inherited actual nonproper high-degree Abel–Jacobi
   effective descent/full-faithfulness theorem, with its locally trivial
   affine fibre charts. Connected fibres alone do not establish it.
2. `GC5-LISSE-OPS`: the inherited rank-one Qbar_ell lisse categories and
   Frobenius-equivariant tensor, dual, inverse-image and external-tensor
   operations, including associators, symmetry, evaluation and units on the
   actual root curve, root Picard and section stacks.
3. `GC5-LEAN-CARRIERS`: actual stack/lisse types for the geometric end
   statements and checks. Once suppliers fix those types, state and elaborate
   the compact geometric end signatures. Do not replace them by arbitrary
   carriers, predicate placeholders or admitted data definitions.

The parent ST-LISSE/ST-OPS/LEAN-GEOMETRY leaves are not silently closed. A
provisional stacks proposal with unregistered stage ids is not cited as an
existing dependency. This part creates no new roadmap, upward move or
restructuring. Generic coherent Scheme.Modules tensor/dual theory stays in
AlgebraicVectorBundles; generic curves, divisors, family geometry and ordinary
Picard theory stay in AlgebraicCurves/JacobianChallenge and SF.3.

## Evidence and validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmeticPartII--GC.5.json`:
  zero errors and zero warnings, including declaration-index validation of
  all eight baseline references.
- `lean-check research/blueprint/suggested/FunctionFieldArithmeticPartII--GC.5.lean`:
  exit 0; only thirteen declaration-uses-admission warnings. The real-bodied
  definition itself has no admitted data. The shared build's Mathlib commit
  is `082e2d37e8b0463410cdb532e111cd43d5a66174`; the three direct native
  divisor/place source files checked match the exact Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369` source bytes. This compiles the
  native fragment, not the geometric omission ledger.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/FunctionFieldArithmeticPartII--GC.5.lean`:
  passes.
- Submission path/JSON and whitespace checks are recorded in the pull request.

The reviewed `AUDIT-20` FA.0/FA.1 entries were read; they show arithmetic
divisors and weighted degree already built, while the scheme dictionary is
owned by upstream AlgebraicCurves. Current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and current TauCetiRoadmap at
`0d144d044dacebca17b654695b6f1ad58f159b27` were checked read-only.
JacobianChallenge and AlgebraicVectorBundles READMEs were read in full,
representative Suggested interfaces and AlgebraicCurves Layer 12 were read,
and the nine roadmaps missing from the atlas snapshot were searched for the
relevant carriers. No actual root-Picard lisse interface was located. Their
existing targets are imported, not replanned.

Source read: Yun–Zhang, published author-hosted Annals PDF,
https://math.mit.edu/~zyun/GZW_ramified_published.pdf, read 2026-10-14;
SHA-256 `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c`.
Read A.1–A.2.3, printed pp. 514–523, and §6.2.1, pp. 496–497; inspected
printed page images 522–523. This does not claim a reading of the whole
paper or Appendix A.3. There is no missing source and no private book was
used. All source descriptions are in our own words.

Four source misprints are inherited from the accepted parent review and
rechecked in the selected published passages: arbitrary global monodromy
in Lemma A.8, the product Abel–Jacobi map in Proposition A.11, effectivity
in Lemma A.10, and Picard decorations in Proposition A.11. The packet gives
corrections with source locators; historical searches for published errata
are explicitly inherited, not newly claimed. These are not self-reviews or
new independent review verdicts.

The next independent reviewer can start with the signed-line cancellation
and signed-translation composition formulas, then the normalization map
orientation and whole-space zero-section comparison. Future mathematical
closure must discharge the three named leaves above. All information needed
for that work is in the four deliverables; scratch files are not required.
