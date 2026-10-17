# FIX-PKG-ShimuraCompactifications~adv

Completed by Codex, session `codex-bxggJv`, 2026-10-17. Refs #10217.

## Scope and result

The issue's final manager instruction fixes the order as
**ShimuraCompactifications → AutomorphicBundles** and says to change nothing else.
The package now makes that order explicit. Canonical and subcanonical extensions
remain AutomorphicBundles' constructions on the compactifications built here.
The package review status is `accepted`, with reviewer
`fix-FIX-PKG-ShimuraCompactifications~adv`.

The issue names `REV-PKG-ShimuraCompactifications~adv.md`, but that file is absent
from this checkout. The extant report is
`research/blueprint/reviews/REV-PKG-ShimuraCompactifications.md`; it accepts the
prior mathematical corrections and contains their full finding dispositions and
155-target adversarial table. Those corrections are preserved. This submission
addresses the manager's remaining ordering finding and checks the touched
interfaces; it does not claim to repeat that entire independent review.

## Finding dispositions

| Finding or location | Change and ownership |
| --- | --- |
| C3.9 proof refers to AutomorphicBundles B3.5 | Moved the canonical-extension application to Downstream consumers. The theorem still quantifies over every finite-rank locally free `E` with `E′ = f^*E`; C3.6–C3.8 and the SF.2 projection formula prove it without an automorphic construction. |
| Layer C3 Dependencies contains B3.5 | Removed that consumer from the dependency paragraph. All genuine suppliers are unchanged. |
| C5.21 proof refers to AutomorphicBundles B3.10 | Moved the application to Downstream consumers and specified its good-prime PEL scope. The local formally canonical condition and its verification for the Hodge bundle and tensor constructions remain here, using C4.1, C4.7, the chart comparisons and C3.8. |
| Downstream consumers says the roadmaps are developed together | Replaced that phrase with the explicit construction order. Retained the B3.5 and B3.10 application links and the Hodge, scalar expansion, component-detection and Hilbert interfaces. |
| Other AutomorphicBundles occurrences | Inspected every occurrence: Scope and ownership assigns extensions to the consumer; C4.1, C5.10, C5.15, C6.12, C6.27 and C6.38 explicitly describe uses or generalizations by it. None is a supplier or a premise. Left these correct ownership/application statements unchanged. |
| Suggested.lean | Contains no AutomorphicBundles citation or import. Its signatures and existing negative controls are unchanged; reran elaboration successfully. |

No new mathematical input was needed. The geometric comparison, Hodge bundle,
scalar Fourier–Jacobi morphism and formal coefficient condition already have
named targets here (C3.5–C3.9, C4.1, C5.15, C5.21). No target moved into an earlier
roadmap and no new supplier was introduced.

## Adversarial pass on the touched statements

| Statement/interface | Instances and computation | Result |
| --- | --- | --- |
| C3.9 ordinary and cuspidal comparisons | Identity refinement; zero-rank `E`; zero coefficient module; empty boundary. Identity induces the identity, zero coefficients give zero groups, and an empty boundary has ideal `O`. | The comparisons retain their hypotheses and every cohomological degree; no canonical-extension premise is required. |
| C3.9 boundary-ideal input | Blow up the crossing `xy = 0`: the pullback of `xy` has exceptional order two, whereas the reduced new boundary has order one. The pushforward comparison uses C3.8. | No equality of pulled-back boundary ideals is introduced. The existing README checks and Lean `x ∉ (xy)` and empty-boundary examples are retained. |
| C3.9 coefficient generality | Field base, DVR base and `M = B/ϖ^n`; also zero `M`. The nonflat coefficient case still uses the stated Dedekind/field hypotheses and integral toric comparison. | No characteristic-zero, ordinary or degree-zero restriction added. No division by a coefficient or interchange with completed tensor products added. |
| C5.21 local condition | Zero coefficient module; rank-zero torus with determinant line `O`; characteristic two and nilpotent coefficients. The zero module gives zero completed sums, and the Hodge construction is over the stated coefficient base. | The condition is stated intrinsically on the existing charts. General automorphic associated-bundle constructions are downstream. |
| C5.21 positive weights | A zero cone imposes no positivity constraint; in the quadrant `xy` is positive on both rays and `x` is zero on one ray. | The nonzero-face convention and all existing Checks remain intact. No sign, multiplicity or indexing convention changes. |
| Downstream B3.5/B3.10 | Read their actual statements: B3.5 identifies canonical pullbacks but only maps subcanonical pullbacks; B3.10 constructs finite locally free good-prime PEL coefficients. | The relocated applications have the same scope as the consumer's targets; no reverse supplier edge is needed. |

The trivial arithmetic action, identity lattice change and rank-zero charts do
not introduce a consumer dependency. Conditions on completeness, neatness,
projective cone systems and non-neat quotients are unchanged. There is no new
denominator, sign, `p`-adic normalization or parameter `q` to audit.

For the affected geometric inputs, read Lan's author revision of *Integral models
of toroidal compactifications with projective cone decompositions*, Proposition
7.5 and proof, author pp. 28–29, and Definition 8.5, p. 34
([public source](https://www.kwlan.org/articles/cpt-ram-nbl.pdf)). They separate
the structure/boundary direct-image statements from the local coefficient
condition. No quotation was recorded. Read the consumer's B3.5 and B3.10 and the
current AlgebraicVectorBundles and AnalyticToricGeometry boundaries/signatures.
The current roadmap checkout is `0d144d044dacebca17b654695b6f1ad58f159b27` and
current Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the reviewed
library-coverage entries for C0–C6 were inspected. No new construction duplicates
them, because no construction was added.

## Validation

- `lean-check research/blueprint/packages/ShimuraCompactifications/Suggested.lean`:
  exit 0, 36 warnings, all `declaration uses sorry`; no other diagnostics.
  Available memory exceeded 20 GB. The shared pinned build uses Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474`.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraCompactifications.json`:
  0 errors, 0 warnings. The packet is unchanged; this does not upgrade its own
  recorded gaps or requests.
- `python3 research/blueprint/intake.py check-files` on this handoff and the
  package README, Suggested file and review JSON: 0 problems.
- Structural comparison against the starting commit: all 155 target headings
  match in order, every complete Check block is identical, and Suggested.lean
  is byte-for-byte unchanged. No AutomorphicBundles reference occurs in an
  Exact supplier contracts subsection, Needs clause or Dependencies paragraph.
- `git diff --check`: passed.

## Handoff

No work remains on #10217. The older AutomorphicBundles package still uses
joint-bundle terminology for its import of these compactifications; that file
is outside this issue's deliverables. The maintainer's separate upstream
submission of AutomorphicBundles should describe the same settled order. No
change to that package, to atlas data or to upstream files is included here.
