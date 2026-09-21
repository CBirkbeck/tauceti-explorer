# Independent review: Multiquadratic links

**Accepted with corrections.** Reviewer: Codex — codex-c83e7a, 2026-09-21.
Job `REV-LINK-tauceti_TauCetiRoadmap_Multiquadratic`, issue #118.
Original author: ChatGPTPro — cgp-9dbda3a312c1, issue #51, PR #790.
This reviewer did not write the original packet.

The revised packet retains all three links and both overlaps. Both ownership
recommendations now require importing existing pinned library code. No dependency
was added or removed. Original author/screening provenance remains historical;
`reviewSpotCheck` and `reviewBaseline` record this review.

## Inputs and extent

Read PROTOCOL §§9–10, WORKERS, the original packet and handoff, the full
Multiquadratic README, all eight distinct original endpoint stages, and all four
reviewed AUDIT-04 entries in `data/library-coverage.json`. The review baseline is
atlas commit `285d7c12ff41928b78f38c003c82cad979515702`, Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

The issue requests at least five own stages. **Only four canonical stages exist.**
All four were read in full, and seven separate contracts were searched. No fifth
stage was invented. The search covers the 218-roadmap, 2,007-stage comparison
inventory, including the six proposed roadmaps; this is a completeness spot check,
not full verification of every document.

## Every link

| Supplier → consumer | Decision and boundary |
|---|---|
| Multiquadratic 0 → QuadraticFormInvariants 0 | Keep, explicit. The consumer names the landed square-class interface. The input is the additive quotient, its `ZMod 2` structure and finite-subset independence criterion. Multiplicative-quotient, field-map and cardinality adapters remain with the consumer. This does not require the tower, genus theory or characteristic not two. |
| Multiquadratic 0 → ClassFieldTheory 10 | Keep, inferred and example-only. Degree four and the sign-change group for `Q(√13,√17)` supply the extension used in the obstruction example. Independence reduces to nonsquareness of 13, 17 and 221. This supplies neither idele-class cohomology nor `globalInv`. |
| Multiquadratic 1 → ClassFieldTheory 10 | Keep, inferred and example-only. The singleton splitting law proves 13 splits in `Q(√17)` and 17 in `Q(√13)`: use `2² ≡ 17 mod 13` and `8² ≡ 13 mod 17`. Together with the separately owned ramification/completion dictionary and the degree-four exponent-two group, these give the local-degree bound. The two-radicand unramified formula must not be applied at a ramified prime of the full compositum. |

All nine original evidence excerpts are verbatim in their named roadmap documents;
all directions and scopes survive reading the complete supplying/consuming stages.
Added raw-file line locators. The original qualifications excluding genus fields,
ClassFieldTheory 13, and the proof that 25 is not a global norm from the
ClassFieldTheory 10 input remain essential.

## Every overlap and correction

**EffectiveBounds 1 / Multiquadratic 2: retain `rescope`.** Both source descriptions
assign the unit-square bound. The pin already has
`NumberField.units_sq_index_le` in
`TauCeti/NumberTheory/EffectiveBounds/UnitSquares/Basic.lean:62`, with bound
`2 ^ Module.finrank ℚ F`. Its proof imports the shared algebra lemma. Replace future
port language with import language; the exponent is the field degree, not the
number of ramified primes. `Cl/Cl²` and `Cl[2]` remain different objects. The
EffectiveBounds packet already records the incoming edge and this overlap; the
local overlap corroborates its boundary without creating another link. Request
MQ-LINK-R2 is resolved by the pinned library.

**GlobalNumberFields 2 / Multiquadratic 3: retain `rescope`, correct the owner
boundary.** The general carrier is already
`NumberField.NarrowClassGroup` in
`TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean:83`, with
`toClassGroup:150`, `toClassGroup_surjective:159` and `toClassGroup_ker:206`.
Both roadmaps must consume this API. GlobalNumberFields owns the remaining
ray-class/narrow-modulus and unit-sign comparisons; it must not plan another
carrier or forgetful map. The checked kernel theorem describes the image of the
principal-class map; this review does not assert that every desired sign-quotient
adapter is already present. MQ-LINK-R3 is narrowed accordingly.

The original source-correction request MQ-LINK-R1 remains valid: the full
prime-discriminant compositum for `D = 12 = (−4)(−3)` contains `i`, so it is not
unramified at the real places of `Q(√3)`. The ordinary real genus field requires
the maximal totally real subfield. The pin already distinguishes
`isGenusField_candidateGenusField` for negative radicands from
`isGenusField_candidateGenusFieldReal` for positive nonsquare radicands, at
`TauCeti/NumberTheory/Multiquadratic/GenusField.lean:114` and `:149`.
The README correction is outside this review's edit scope.

**Audit qualification.** All four audit entries have verdict `built`, but the
pinned `GenusField.lean:55–57` explicitly says a separately packaged narrow
finite-places genus-field predicate remains future work. Existing narrow class
groups and candidate-field results do not establish that packaged predicate.
The revised packet records this limit rather than making a blanket built claim.
This is a direct reading of that file, not a whole-library absence proof.

## Completeness spot-check

The seven contracts were square classes/independence; degree/Galois group;
splitting/Frobenius; prime discriminants/transversals; the unit-square bound;
elementary-two quotients/ambiguous classes; and ordinary/narrow genus fields/rank.
Searches used their names and mathematical synonyms across all stage descriptions.
Eight additional candidate stages were read in full:

- ClassFieldTheory 12 and 13: general Kummer existence and norm/class-field
  applications. The existing ClassFieldTheory 13 → Multiquadratic 3 link describes
  the README's abstract Hilbert-class-field argument. It is not an implementation
  prerequisite for the pin's already completed explicit genus construction.
- NumberFieldArithmetic 2 and 8: the Frobenius overlap is already recorded in that
  packet; the invariant table explicitly imports the narrow-class library.
- EllipticCurves 5 and 6: twists consume the Kummer isomorphism, already recorded
  as ProfiniteCohomology 9 → EllipticCurves 5. The finite S-unit/S-class and étale
  algebra descent contract is not a multiquadratic genus-theory theorem.
- ProfiniteCohomology 9: general continuous-cohomological Kummer theory has a
  different output from the finite multiquadratic degree theorem. Shared square
  quotient notation does not justify duplicating that cohomological dependency.
- GlobalQuadraticForms 2: local discriminant/Hasse adapters consume the explicit
  QuadraticFormInvariants interfaces; shared square classes do not supply a new
  direct multiquadratic dependency.

The existing EffectiveBounds dependency and NumberFieldArithmetic overlap were
checked against their current packets. No additional exact, independent edge
survived this screening and deduplication.

## Direct pin checks and validation

Read the declarations (including hypotheses) at the programme pins:
`TauCeti.SquareClassGroup`, its `ZMod 2` instance and
`linearIndependent_squareClass_iff`; Mathlib `Subgroup.square` and `mem_square`;
`finrank_adjoin_range`, `galoisGroupEquiv`,
`NumberField.ncard_primesOver_multiquadratic_iff`; and the unit, narrow-class and
genus-field declarations discussed above. The splitting theorem is even more
general than the source's squarefree presentation, but still requires an odd
prime dividing none of the chosen integral radicands. The packet contains exact
pinned URLs and SHA-256 hashes of the inspected files.

Validation:

- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_Multiquadratic.json`:
  **0 errors, 0 warnings**; three links, two overlaps, 218 original screening records.
- All 13 evidence excerpts, including four added overlap excerpts, checked as raw
  substrings at their recorded line locators; endpoint IDs checked.
- No duplicate link against the atlas or other current link packets; dependency
  endpoints unchanged, so this review introduces no new cycle.
- Only the issue-authorized link JSON and this report are submitted; valid JSON
  and no private paths. No Lean file is required or compiled for this link review.

The issue's full instructions require editing the link JSON and adding its review
object, but the generated deliverable list/queue names only this report. Both
explicitly instructed files are submitted. This metadata conflict is disclosed
for maintainer intake; no queue, label or merge operation is performed by the worker.
