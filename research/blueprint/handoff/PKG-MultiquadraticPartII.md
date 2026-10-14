# PKG-MultiquadraticPartII — completed package

Issue: #9183. Agent: Codex, session `codex-sjtWGe`. Date: 2026-10-14.
The bot confirmed the claim from comment 6160801570. The branch is
`codex-sjtWGe-pkg-multiquadratic`.

## Delivered

- `research/blueprint/packages/MultiquadraticPartII/README.md`: the complete
  four-layer roadmap, with all nine accepted theorem targets, exact hypotheses,
  source locators, proof routes, prerequisites, acceptance checks and worked
  examples. It introduces no definition or construction target.
- `research/blueprint/packages/MultiquadraticPartII/Suggested.lean`: 267 lines,
  nine named theorem signatures and eighteen examples on existing carriers,
  under `TauCetiRoadmap.MultiquadraticPartII`. No new data definitions,
  constructions or auxiliary theorem development.
- `research/blueprint/packages/MultiquadraticPartII/metadata.toml`:
  `topic = "math.NT"`.

The accepted packet, reader and original suggested file were not changed.
This is a complete packaging job, not a checkpoint or a formalization claim.

## Target retention and mathematics

| Layer | Retained endpoints | Principal checks |
| --- | --- | --- |
| 0 | `ker_toClassGroup_eq_pair`, `existsUnique_wideCharacter_iff` | Coincident kernel entries allowed; trivial and odd character descent; norm minus one unit collapses the kernel. |
| 1 | `card_genusFiber_mul_twoPow` | Narrow class number; one, two and four genera; cyclic-eight fibres have four elements, two-torsion only two. |
| 2 | `genusCharacter_J_eq_sign_prod`, `primeDiscriminants_positive_iff`, `fundamental_sumTwoSquares_iff`, `J_square_iff_sumTwoSquares`, `J_ne_one_of_prime_threeModFour` | Negative dyadic factors; empty factor; D=1 arithmetic boundary; D=9 rejects dropping fundamentality; D=136 separates square J from trivial J; negative D rejects equal complementary signs. |
| 3 | `formCharacter_eq_idealCharacter` | Oriented D=12 dictionary and positive represented value; full inverse/J coefficient table; D=48 imprimitive zero case remains outside the comparison. |

The first two signatures require only the quadratic presentation and hence
also apply to imaginary fields. The genus-cardinality signature requires
squarefreeness and the factorization, but likewise does not require positivity.
The README explicitly states these generalities rather than silently giving
the Lean signatures a broader scope. The sign and square/arithmetic field
targets require the real quadratic presentation. The independent arithmetic
targets include D=1; the field presentation excludes it.

The adversarial pass checked the collapsed kernel, empty subproducts, one
prime discriminant, all three even prime discriminants, a nonfundamental
two-square integer, positive versus negative represented values, inverse
classes, proper versus full integral equivalence, and the general character's
zero domain. An independent finite arithmetic sweep checked all 303 positive
fundamental discriminants D ≤ 1000, including 1: exhaustive two-square search,
the prime-divisor criterion and positivity of the signed prime-discriminant
factorization agree. Direct cyclic-eight enumeration checks square-subgroup
cardinality four and two-torsion cardinality two. These finite checks support
the conventions; they do not prove the general statements.

## Current upstream ownership and duplicate audit

Read the current upstream checkout at commit
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, without running Lake there.
Read the two complete upstream README models Completed/Multiquadratic and
Completed/EffectiveBounds, and the two complete Suggested.lean models
Completed/EffectiveBounds and AdicSpaces. Read the relevant current
IntegralLattices B1–B3 and GlobalNumberFields Layer 11 statements and suggested
interfaces. Searched the newer roadmaps and completed roadmaps, and current
library statements by narrow-class, genus, discriminant and character objects,
not just proposed declaration names. No retained endpoint needed removal as
an already supplied theorem. The singleton J-value and the positivity square
criterion are imports throughout, not duplicate targets.

The package corrects stale supplier prose in the input reader, following the
accepted packet and its review:

- IntegralLattices B1–B3 owns the generic binary carrier/content, proper
  equivalence and oriented form/ideal dictionary. The a<0 sign clause is
  indispensable, witnessed by Q and -Q at discriminant twelve.
- GlobalNumberFields Layer 11 owns orders and Pic/NarrowPic, the named
  forgetful map and maximal-order comparison.
- GN.3 is asked only for remaining specialization, DIT coefficient-convention
  and positive coprime norm-witness adapters. It must consume those owners,
  including any already sufficient maximal-order comparison.
- GN.2 remains the one requested owner of the general form genus character.

No notion was moved upward or duplicated. The current atlas package for
GeometryOfNumbersAndQuadraticArithmetic does not expose the required concrete
form-character or positive norm-witness interface. The exact laws remain
explicit supplier requirements, not claims about implemented declarations.

## Preserved interface gap

The accepted packet already records one gap and two GN.2/GN.3 requests for
the canonical comparison. This package preserves that boundary. The README
states the canonical theorem and all supplier laws, including the general
character's content-zero branch and the proper oriented association. The Lean
theorem is the accepted explicit witness version: an actual quadratic form,
an actual integer-valued function with its positive represented-value law,
a positive coprime represented integer, and a nonzero integral ideal of that
norm in the inverse narrow class. It never assumes the desired comparison.

The remaining formalization work is to bind the canonical GN.2 character,
specialize IntegralLattices through GlobalNumberFields, discharge the GN.3
witness arguments and instantiate the canonical imprimitive zero test. The
Lean file only checks the discriminant, content and nonfundamentality of the
D=48 example; it does not purport to test a missing canonical character.
This is not a newly discovered gap or a reason to reassign the generic
dictionary. No untyped carrier or sorry-defined data conceals it.

## Sources and baseline

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau
Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 41 declarations recorded
by the accepted packet were read at those commits before using them; the
package names the precise quotient, character and arithmetic interfaces.
One package spelling was corrected to the actual generic declaration
`TauCeti.elementaryTwoQuotientMk_eq_zero_iff`.

Read Duke–Imamoḡlu–Tóth, *Geometric invariants for real quadratic fields*,
Ann. Math. 184 (2016), 949–990,
[final public PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf),
accessed 2026-10-14, SHA-256
`a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61`.
The algebraic passages read are §2 pp.950–952, §4 pp.959–960, §7 pp.970–972
and §9 pp.977–978. The page images for pp.952 and 971 were also inspected:
the norm-form inverse has -b, the three coefficient actions have the class
labels recorded in the README, and the sign sentence needs its real qualifier.
The package uses the positive-discriminant version and keeps D=-4 as the
negative control. Source finding E1 was already recorded in the packet;
no source-finding registry was edited.

All exposition is in our own words, organized by targets rather than source
sections. No source passage or source file is committed. No restricted book
was needed.

## Validation

- `lean-check research/blueprint/packages/MultiquadraticPartII/Suggested.lean`:
  exit 0 in the supplied pinned build; 27 warnings, all `declaration uses
  sorry`; no errors or other warnings. Memory was checked before compilation.
- `python3 scripts/check_blueprint.py research/blueprint/packets/MultiquadraticPartII.json`:
  0 errors, 0 warnings; nine theorem nodes, nine planets, one preserved gap,
  two supplier requests.
- `python3 research/blueprint/intake.py check-files` on the three package
  files and this handoff: 0 problems.
- Named-endpoint cross-check: all nine Lean names occur in the README; all
  accepted acceptance properties and worked examples are retained; no new
  definitions require a new API/test inventory.
- Control-character and mathematical-delimiter checks pass; `git diff --check`
  passes. Only the three package files and this handoff are submitted.

Nothing remains for the package author before submission. The next independent
package review should retain the supplier distinction and the explicit
canonical/witness boundary when assessing readiness for upstream.
