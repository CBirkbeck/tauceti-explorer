# AutomorphicGaloisRepresentations: independent package review, revision 3

Issue #9778; Codex, session `codex-9dBi8M`; 14 October 2026.
Complete review, verdict **accepted**. No second job claimed.

## Result and next step

The package is ready for the maintainer's upstream draft roadmap PR. The earlier
general-multiweight ordinary-character defect is closed: §§4.10–4.11 identify
the finite and algebraic unit factors, local normalized root and
change-of-uniformizer law, prove the selected period line admissible, descend
its Galois line, recover the second character from the determinant, and transport
all four source conventions and arbitrary central-weight twists. Section 5.1
uses that rational comparison before taking the fixed-lattice intersection.

The review corrected one worked check from a twist by η to η⁻¹, added the
current LocalGaloisGroups cyclotomic reciprocity ownership, supplied the pinned
Dirichlet nonvanishing theorem's nonzero-modulus hypothesis, and added a closing
Lean comment listing definitions with unavailable arithmetic/geometric carriers.
No new carrier or construction was introduced into Lean. Metadata is unchanged.

The full independent report is
`research/blueprint/reviews/REV-PKG-AutomorphicGaloisRepresentations~3.md`.
It records the previously flagged source obligations, all locators from the
15-node random sample, critical source hashes, ownership checks, the adversarial
pass over every target/convention and the Lean signature comparison. Source files
are disposable scratch and are not needed to resume; public URLs, versions and
locators are retained in the package/report.

## Boundaries and accepted-input notation

No further duplicate target was removed. Current upstream commit checked:
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti commit checked:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Generic determinant scaling/duality
belongs to IntegralHeckeAndGaloisDeterminants Layer 3a.1; whole-ring determinant
descent and reconstruction to its existing layers; cyclotomic reciprocity to
ClassFieldTheory/LocalGaloisGroups Layer 5; generic rank-one and admissible-period
comparison to PadicHodgeTheory. The new application is the modular character
identification. Analytic `EigenformAwayFromLevel`/`Newform` and the elliptic
Tate-module determinant remain library inputs.

Retain the revision handoff's two accepted-input notation corrections in any
future packet synchronization:

- The source's global normalized T₀ includes embeddings at other p-places.
  Divide out `c_out` to get the root of the local Galois character; equal unit
  valuation does not mean equal eigenvalue.
- Raw modified finite-level `λ(S_x)` differs from its algebraic specialization
  at positive central weight. The determinant uses
  `λ^alg(S_x)=λ(S_x)θ_SW(x)⁻¹∏τ(x)^{−µ}`, as derived in §4.11.
  Do not replace it by the raw finite unit value or attribute that intervening
  comparison literally to Skinner–Wiles equation (3.2).

The packet was not edited. Its twelve implementation gaps and fifty-one supplier
requests remain explicit development obligations, with no new package blocker.
Original Taylor, Momose, Saito 1997, Wintenberger 1995 and BR93 proofs were not
freshly read in this review. The report names the public primary alternatives
that directly source the retained conclusions and distinguishes those statements
from detailed imported proofs. No restricted book was used.

## Validation

All 66 original targets, 90 API names and 66 named tests are retained in 71
numbered sections. Definitions have at least three discriminating Checks.
The final 377-line Suggested.lean has ten real-bodied definitions, nine theorem
signatures and twenty examples. Final `lean-check` exited 0 with exactly twenty
sorry warnings and no other warnings/errors. Initial elaboration also passed.
Every definition signature and the theorem hypotheses were compared with the
README; heavy definitions are named in the closing comment.

The original packet check, sorry-data/size check, intake check of every submitted
file and `git diff --check` passed. Exhaustive GL₂ matrix counts over F₂, F₃ and
F₅ verified the three characteristic-polynomial fibre formulas, with group
orders 6, 48 and 480. There is no unfinished work in this review and no Lean
process left running.
