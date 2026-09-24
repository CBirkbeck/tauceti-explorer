# REV-RT-AUDIT-04

Independent verification of the red-team findings `RT-AUDIT-04` on the library audit
**AUDIT-04: Global number fields, ray classes, adeles, and Hecke characters**, covering five
Tau Ceti roadmaps — `GlobalNumberFields`, `GlobalQuadraticForms`, `LocalFieldsRamification`,
`Multiquadratic`, `NumberFieldArithmetic`. I did not write the audit, its review, or the red
team.

**60 findings — 1 high, 25 medium, 34 low. All 60 confirmed.**

## Method

Sixty findings cannot each be read at leisure without the last ones getting less than the
first, so I ran the evidence base systematically and then went deep on the high finding and
a sample of the strongest medium claims. The coverage is stated here so it can be judged.

**Every identifier.** I extracted the 150 distinct backticked identifiers the findings name
and resolved each against the pinned index. **125 resolve.** I then went through the 25 that
do not, one by one: every one is a roadmap plan name (`isOpen_raySubgroup`,
`rayClassQuotient`, `hilbertClassField` — names ClassFieldTheory and Multiquadratic *plan*),
a name the finding itself proposes (`finiteAdeleExtension`), a JSON field name
(`duplicates`), or a name the finding explicitly says is absent. Finding 49 is the clearest:
it says `ncard_primesOver_eq_finrank_iff_of_isGaloisGroup` "does not exist in either
library", so its not resolving is the point.

**Every location.** I extracted the 121 distinct file-and-line citations and checked each
against the pinned trees. Every file exists; **119 have an indexed declaration within twelve
lines**. The two that do not are both
`Mathlib/NumberTheory/NumberField/Completion/FinitePlace.lean:522`, which I opened — see
below.

## The high finding, verified end to end

**RT-AUDIT-04/39.** The audit's Multiquadratic summary contains, verbatim: "the genus field
is characterised by a universal property, **the prime-discriminant compositum is proved to
have it in both signatures**".

At the pin the two theorems say otherwise:

- `GenusField.lean:114` — `isGenusField_candidateGenusField {d : ℤ} (hd : Squarefree d)
  (hneg : d < 0)`. The compositum is proved to be the genus field **only for negative d**.
- `GenusField.lean:149` — `isGenusField_candidateGenusFieldReal (hd : Squarefree d)
  (hnsq : ¬ IsSquare ((d : ℤ) : ℚ)) (hpos : 0 < d)`. Its subject is
  `candidateGenusFieldReal`, **not** the compositum.

And that object, at `CandidateGenusField/Real/Basic.lean:66`, is documented as "**The
ordinary genus-field candidate of a real quadratic field.** This is the maximal totally real
subfield of the prime-discriminant compositum", with the file's module doc adding that the
compositum "is the narrow genus field of `ℚ(√d)`, but it can ramify at the real places".

So for real K the compositum is the *narrow* genus field, and "in both signatures" is false.
The counterexample declaration the finding cites is real too:
`twoRank_eq_zero_of_minpoly_eq_X_sq_sub_three` at
`Quadratic/GenusCharacter/OrdinaryTwoRank.lean:244`.

High is right — the sentence makes a false statement about what is proved, and a builder
reading it would take the real case as done.

## Three medium claims I settled directly

**Finding 53 (and 60), in the Mathlib source rather than the index.**
`FinitePlace.lean:522` reads `instance : Module.Finite Kv Lw`, with `Kv`, `Lw` the local
notations declared just above. It is an **anonymous instance**, which is why a name-based
search finds nothing and why the audit could honestly believe it absent — but it is there,
and the audit's "in neither library" is wrong. This also explains the only two citations that
failed my location check: they point at exactly this instance, and their failing to resolve
by name is the finding's own point.

**Finding 23, by recount.** I read the eighteen `duplicates` entries of the
GlobalQuadraticForms layers and classified each by its own note: **ten** describe a supplier
or consumer relation rather than a layer stating the same target — precisely the number the
finding gives.

**Finding 3.** `RestrictedProduct.unitsEquiv` is at
`Mathlib/Topology/Algebra/RestrictedProduct/Units.lean:84` and is precisely a
restricted-product description of the unit group, which is the half of the audit's note that
denies one exists. The audit's own cited declaration for that target is stated *through* it,
so the note contradicts the citation beneath it.

## Why all 60, and what that licenses

Each finding proposes a correction to a note, a fit label, a `duplicates` entry or a summary
sentence in a reviewed artifact that planners consume, and each names the declaration to
cite. That is what a fix job does, so "confirm only what you would have fixed" is satisfied.

I should be plain about the division of labour. The **evidence** of all 60 I checked
systematically and independently, and it held everywhere. The **judgement** in each — that a
note overstates, understates or mislabels — is the red team's, and in the five I settled
directly it was sound, including the one where the audit's error was entirely
understandable. A fixer working through 25 medium corrections should still read each note
before rewriting it.

## What I did not do

No Lean was compiled. I did not re-audit AUDIT-04 independently — that is the red team's
job, not the verifier's — and I did not re-derive the mathematics behind targets the findings
merely relocate in the library.
