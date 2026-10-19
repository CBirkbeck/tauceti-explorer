# DESIGN-EffectiveBoundsPartII handoff

Job [#3402](https://github.com/CBirkbeck/tauceti-explorer/issues/3402), completed by
Codex (GPT-6), session `codex-t0cpUz`, on 19 October 2026. The
[claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/3402#issuecomment-6258004536)
belongs to this session. This is a complete target-level design submission, not
a checkpoint or a formalisation.

The five deliverables define six layers, EB.0–EB.5. The packet maps all 25 items
routed to the arithmetic continuation in `PAPER-COUVEIGNES-20.result.json` to
stable nodes and adds the bounded equation-system definition used in counting.
There are 26 nodes: 7 constructions, 2 definitions and 17 theorems; 51 API items,
34 distinguishing unit tests, 18 planets, and 25 pinned baseline declarations.
Every definition and construction has uses, an API, and at least three tests.
All implementation statuses remain `unchecked`.

The reader contains every target, hypothesis, proof route, API, Check and source
locator, together with worked boundary examples. The suggested Lean file has
231 lines: four light definitions with actual bodies, selected milestones and
examples. Heavy constructions remain mathematical targets in the reader.

## Coverage and exact remaining interfaces

| Stage | Status | Remaining |
|---|---|---|
| EB.0 | closed | None at target level |
| EB.1 | closed | None at target level |
| EB.2 | closed | None at target level |
| EB.3 | planned | GN.1 intrinsic unit-ball volume interface |
| EB.4 | planned | Integrate that interface through EB.3 |
| EB.5 | planned | Integrate that interface and the SF.5 isolated-point interface |

The packet has no gaps and two open supplier requests. It is `complete`, not
`closed`. The requests are recorded in the packet; no separate issue was opened.

1. **GeometryOfNumbersAndQuadraticArithmetic:GN.1.** In every ell-dimensional
   Euclidean space, ell≥1, intrinsic volume of the closed unit ball is at least
   `2^ell ell^(−ell/2)`. Use the cube with coordinate radius `1/sqrt(ell)` and
   orthonormal-coordinate invariance. The exact consumers and argument are in
   EB.3/independent-short-relations. Existing second-Minkowski, attaining-witness
   and ordered-product nodes are already imported by their exact ids.
2. **SchemeAndStackFoundations:SF.5.** The sum of isolated local intersection
   lengths for r equations of degree at most d in affine r-space is at most
   `d^r`, even with positive-dimensional components elsewhere. This is the
   isolated-component consequence of the existing upstream general
   `bezout-inequality` target T436. The plane-only atlas node is insufficient.
   EB.5/components-to-classes is its direct consumer. This is a supplier
   interface clarification, not a new intersection-theory plan.

The next worker should independently review the design and the two supplier
boundaries, then integrate the supplied interfaces when available. No source
research or arithmetic target was silently left for a continuation. No new
roadmap ownership move or restructuring proposal is needed.

## Reuse boundaries and review points

- Completed/EffectiveBounds is the first prerequisite. Its existing fixed-ambient
  Hermite–Minkowski count, root discriminant and finiteness are consumed.
- GN.0 supplies primitive orthogonal covolumes, saturation and Hermitian
  Hadamard. GI.0/GI.1/GI.5 supply coefficient geometry and generic first jets.
- The arithmetic embedding substitution has complex coefficients. Apply the
  pinned grid lemma over C after proving the parameter map invertible. Do not
  apply GI.5's integer-coefficient parameter-pullback export to it.
- SF.0/jacobian-etale-algebra already supplies the generic localized algebra,
  finite etaleness and component projection compatible with evaluation. Only
  the arithmetic evaluation and bounds are new here.
- ArithmeticStatistics:ST.0 owns the isomorphism-family carrier. Count exact-degree
  Q-isomorphism classes without automorphism weights. The final Lean signature
  uses finite pairwise nonisomorphic families because the ST.0 carrier is absent
  from the pins; the reader specifies the finiteness and quotient bridge.
- Keep the weighted canonical measure separate from the house gauge and the
  coefficient Euclidean metric. Short integral elements give a rational basis,
  not an integral basis. Retain the index of the transpose image and the
  absolute field-discriminant denominator in the Gram identity.
- Dropping exactly n−1 relations gives one full gradient block. The determinant
  of the same selected integer equations is then nonzero at all embeddings.
  A model can have several nonisomorphic field factors; count pairs of models
  and factors. The least admissible central-binomial rank depends only on n.

## Sources and library checks

Couveignes, [*Enumerating number fields*](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf),
Annals of Mathematics 192 (2020), 487–497, was read in full: Proposition 1,
§2 p. 490; Proposition 2, §3 pp. 491–495; Theorems 1–2, pp. 487–488 and their
quantitative proof in §4 pp. 495–496. The packet records the version-of-record
URL, read date and SHA-256. No source errors were identified. All source
statements and proof descriptions are written in our own words.

The generic supplier statements and the reviewed library audit were read.
The upstream completed EffectiveBounds reader and suggested file, the current
GlobalNumberFields reader and the relevant IntegralLattices covolume statement
were checked. Current Tau Ceti effective-bounds source was also read
(revision `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`). Existing results are cited,
not planned again. The local current roadmap checkout was read only.

Every baseline declaration was read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The private reference-library index
was consulted; no uncleared book was used. No independent read of Siegel,
Martinet or Fulton's books is claimed. Their generic consequences are imported
from the existing owners, with the two precise requests above. No required
arithmetic source remains unread.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/EffectiveBoundsPartII.json`:
  zero errors and zero warnings, including declaration-index resolution.
- `lean-check` on `research/blueprint/suggested/EffectiveBoundsPartII.lean`:
  exit 0 at the pinned shared build; the only warnings are uses of `sorry` in
  proposition proofs. No admitted data, new build or language server was used.
- `scripts/check_sorry_data.py`, intake file checks, JSON parsing, exact source-item
  coverage, reader/API/test consistency and whitespace checks pass.

Only the four issue deliverables and this handoff are submitted. No scratch
files, source passages, private paths or library copies are required to resume.
