# Red team: Multiquadratic link map

Worker: Codex — codex-a71f92. Date: 2026-09-24. Job: #1745.
Target: `LINK-tauceti_TauCetiRoadmap_Multiquadratic`.
Input revision: `1e11ed64db168259c7db04e914be380e4aa2548a`.
Status: complete; findings await an independent verifier.

The three links survive. Two medium-severity library-scope errors remain: the
narrow genus-field predicate and the generic square-class interop adapters
already exist at the programme pin. These are corrections to the
import-versus-build boundary, not reasons to remove or reverse the edges.

I neither authored the link job (ChatGPT Pro — cgp-9dbda3a312c1, PR #790)
nor reviewed it (Codex — codex-c83e7a, PR #1044). This submission changes
only the two red-team deliverables, not the accepted map or owner documents.

## Evidence and scope

I read the complete four-layer Multiquadratic document and the complete
EffectiveBounds document, the accepted map's links, overlaps, requests and review
metadata, the independent review report, and all four reviewed AUDIT-04 entries.
The aggregate “built” audit verdict is a lead, not a substitute for checking
the declaration implementing a particular interface.

The library baselines are Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. All nine SHA-256 hashes in the
map's `reviewBaseline.sources` match the pinned source copies. The two additional
files below were read completely, including the relevant proofs. Their local
Git blob hashes match GitHub's contents records at the pinned commit:

| File relative to TauCeti repository | Bytes | Git blob |
|---|---:|---|
| `TauCeti/NumberTheory/Multiquadratic/Unramified/NarrowGenusField.lean` | 7959 | `2fc11fbccaef6a953283fe671807402f5999b29a` |
| `TauCeti/FieldTheory/SquareClassGroup/Multiplicative.lean` | 9426 | `3a2772124edbb3ccd561427577586ea3dbf4da89` |

SHA-256 values, in table order:

- `bb1d50d8820f79047d0628023aacd18d79909cd2a61ad6fa7b84b15fe10c084f`
- `9d5d29847994ee730341e7e89b4c11ebab243b614baf1a49bd18a9284c838aba`

Sources were accessed on 2026-09-24. No Lean compilation is claimed.
Reading proof terms is not a fresh kernel check of the library.

## Finding 1 — the narrow predicate is already packaged

Identifier: `RT-LINK-tauceti_TauCetiRoadmap_Multiquadratic/1`.
Kind: library-claim. Severity: medium.

The accepted map's `MQ-LINK-R1` says “separately packaging a narrow genus-field
predicate is a distinct remaining obligation.” Its second overlap and
`reviewBaseline.qualification` refer to a future-work comment in
`GenusField.lean:55–57`. That comment really is present, but it does not describe
the full pinned tree.

The [pinned NarrowGenusField file](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Multiquadratic/Unramified/NarrowGenusField.lean#L68)
contains the missing-by-description construction:

- `TauCeti.Multiquadratic.IsNarrowGenusField`, line 68: for an integer `d`,
  number field `L` and chosen root `y`, the predicate includes `y²=d`,
  degree two for `Q(y)`, abelian Galoisness over `Q`, unramifiedness over
  `Q(y)` at every nonzero prime ideal, and maximality among number fields
  satisfying those conditions. There is **no infinite-place condition**.
  The maximality quantifier uses the same universe as `L`.
- `IsNarrowGenusField.exists_algEquiv_apply_eq`, line 100, and
  `IsNarrowGenusField.nonempty_algEquiv`, line 130: two such fields are
  isomorphic; the first theorem preserves the selected roots.
- `isNarrowGenusField_candidateGenusField`, lines 140–142:
  `Squarefree d` and `¬ IsSquare (d : Q)` imply the predicate for
  `candidateGenusField hd` and `candidateGenusFieldBaseRoot hd`.
  There is no positive/negative sign restriction. The proof supplies all
  structure fields, not an unproved placeholder.

This is stronger evidence than either the stale comment or an aggregate audit
label. The finding is deliberately limited: it does not infer an arbitrary
narrow-class-field comparison or every unit-sign adapter from this predicate.

Keep the legitimate source correction in R1. For discriminant
`12=(-4)(-3)`, the full prime-discriminant compositum is
`Q(i,sqrt(3))`; it contains `i`, so it is not unramified at the real places
of `Q(sqrt(3))`. The ordinary, all-places-unramified construction uses the
real candidate in the real case; the narrow construction permits that
infinite ramification. The map already records this distinction correctly.
Neither that observation nor the corresponding ordinary theorem is a new
red-team finding.

**Fix:** remove only the claimed narrow-predicate implementation obligation.
Import the existing predicate, candidate-field theorem and uniqueness API;
add the file to the baseline evidence; correct the overlap/request/qualification
consistently. Preserve the ordinary/narrow README correction and record the
change in the fix report without silently rewriting the historical review.
No edge or roadmap owner changes. Medium severity reflects a concrete,
bounded pending-work error rather than a failure of the dependency graph.

## Finding 2 — square-class interop is also a pinned import

Identifier: `RT-LINK-tauceti_TauCetiRoadmap_Multiquadratic/2`.
Kind: library-claim. Severity: medium.

The first link's reason supplies the additive quotient and independence API,
then says “the consumer adds multiplicative notation, field-map and cardinality
adapters.” QuadraticFormInvariants Layer 0, lines 615–620, has exactly those three
generic interop milestones. As a historical ownership description that is
understandable, but as the current import/build boundary it is incomplete.

The [pinned Multiplicative file](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/SquareClassGroup/Multiplicative.lean#L45)
implements all three:

| Consumer contract | Existing declarations |
|---|---|
| Literal multiplicative quotient and additive dictionary | `TauCeti.MultiplicativeSquareClassGroup` (45), `multiplicativeSquareClassEquiv` (65), its generator lemma (73), `elementaryTwoQuotientEquivSquareClassGroup` (80) |
| Pushforward along a field map | `RingHom.multiplicativeSquareClassMap` (118), `RingHom.squareClassMap` (148), their generator/identity/composition laws, and `multiplicativeSquareClassEquiv_map` (169) |
| Finiteness and cardinality transport | `TauCeti.finite_multiplicativeSquareClassGroup_iff` (99), `TauCeti.natCard_multiplicativeSquareClassGroup` (105) |

The multiplicative carrier is literally `Kˣ ⧸ Subgroup.square Kˣ`.
The field maps are actual quotient/linear maps, not a mere assertion that a map
should exist. The comparison commutes with pushforward. The hypotheses here
are fields and field homomorphisms, with no characteristic-two exclusion;
restrictions such as invertibility of two enter later form-theoretic uses.
The `Nat.card` equality is not a proof that every square-class group is finite:
finiteness transfers between its two presentations.

**Fix:** keep the explicit Multiquadratic-0 to QuadraticFormInvariants-0 edge.
Expand its pinned import boundary to include these generic adapters, add the
source to baseline evidence, and leave form-specific constructions/comparisons
with the consumer. If changing its upstream README is outside the fix job's
scope, record an owner source-correction request. This finding does not say
the whole quadratic-form layer is implemented. Its medium severity concerns
a specific duplication risk, not the validity of the historical dependency.

## All three links and both overlaps

All nine quotations were checked after whitespace normalization. Seven occur
in the named stage descriptions. The other two are the Multiquadratic
independence-contract paragraph and the QuadraticFormInvariants ownership
paragraph in the full roadmap documents; both were read in context.

| Link | Attack and outcome |
|---|---|
| Multiquadratic 0 → QuadraticFormInvariants 0 | Explicitly consumes the square-class language, not tower degree or genus theory. Any-field quotient/independence is the correct scope. Preserve the edge; apply finding 2 to its implementation boundary. |
| Multiquadratic 0 → ClassFieldTheory 10 | Inferred dependency for the specific `Q(sqrt(13),sqrt(17))` example. Independent rational square classes give degree four and sign-change group `C2 × C2`. It does not supply the global invariant map or the order-four cohomology calculation. |
| Multiquadratic 1 → ClassFieldTheory 10 | Inferred dependency for the splitting computations in that example, not the general Brauer sequence. At 13 use the single radicand 17; at 17 use 13. Preserve this restricted use. |

The rational independence test is elementary: each nonempty product of the
two radicands, namely 13, 17 and 221, has an odd prime valuation and is not a
rational square. The degree/Galois declarations were checked with their finite
indexing and characteristic/independence assumptions, not just by name.

For the splitting edge, `2² ≡ 17 (mod 13)` and `8² ≡ 13 (mod 17)`.
The actual pinned `ncard_primesOver_multiquadratic_iff` assumes a number field
generated by the specified roots, finite indexing, a prime `p ≠ 2`, and
nondivisibility of **each** radicand. It does not require independence for this
splitting criterion. Applying it to the full two-radicand compositum at 13 or 17
would violate nondivisibility; singleton applications give the needed quadratic
splitting statements instead. Elsewhere unramified decomposition groups are
cyclic and hence have order at most two in `C2 × C2`; the quadratic
discriminants 13 and 17 exclude ramification at 2; both radicands are positive,
so the field is totally real. These checks do not reprove the CFT cohomology or
the separate norm-obstruction calculation.

The EffectiveBounds-1 / Multiquadratic-2 overlap correctly imports
`NumberField.units_sq_index_le`: for a number field the index of integral
unit squares is at most `2^[K:Q]`. It is not a bound for the entire field
square-class group. The corresponding incoming link is already in the
EffectiveBounds packet, so no duplicate edge is proposed.

The GlobalNumberFields-2 / Multiquadratic-3 overlap correctly imports
`NumberField.NarrowClassGroup`, its forgetful `toClassGroup` map, surjectivity
and kernel API. Only its narrow-genus pending-work qualification fails.
Preserve the remaining ray-class/modulus comparison boundary. Also preserve
the distinction between `Cl/Cl²` and `Cl[2]`: equality of their finite
cardinalities does not identify the objects through inclusion followed by
quotient (that map can vanish for the cyclic group of order four).

## Omission and duplication search

The screening universe has 212 atlas roadmaps and six additional proposed
roadmaps, totaling 2,007 stages. I searched titles, full stage descriptions and
source documents for the seven supplier contracts: square classes/independence,
degree/sign-change Galois groups, splitting/Frobenius, prime discriminants and
transversals, unit-square bounds, elementary-two class quotients, and ordinary/
narrow genus fields. Secondary searches included quadratic fields,
elementary-abelian groups and two-torsion. This is a discovery screen, not
line-by-line proof review of 218 roadmaps.

Plausible candidates were followed into their actual contracts:

- CFT 12/13: the Hilbert-class-field input to Multiquadratic 3 is already
  recorded by the CFT packet. It belongs to the abstract README argument;
  the existing explicit candidate-field construction is not thereby made
  dependent on future CFT implementation.
- NumberFieldArithmetic 2/8: its packet already records the quadratic
  Frobenius/multiquadratic sign-vector overlap. General Artin symbols and
  specialized sign vectors remain distinct interfaces.
- EllipticCurves 5/6 and ProfiniteCohomology 9: Kummer cohomology supplies
  the twist classification; the existing ProfiniteCohomology-9 →
  EllipticCurves-5 edge carries it. Shared square-class terminology alone
  does not justify replacing this with a tower/genus dependency.
- GlobalQuadraticForms 2/3/5: localization of discriminants and finite
  Hasse signs imports QuadraticFormInvariants; the quadratic field in
  quaternary descent is not a use of a multiquadratic genus construction.
- Local power-class contracts and the ArithmeticStatistics/
  ComputationalNumberTheory scopes: local structure, selected counting
  theorems and certified algorithms do not by themselves establish a
  concrete missing edge from this four-layer roadmap.

No additional independent edge was established. I did not treat a no-hit search
as an absence proof or replace direct supplier contracts with thematic links.
The stage order `M0/M1 → CFT10 → CFT13 → M3` is consistent: the
example edges do not originate at M3 and introduce no genus-field cycle.

## Checks and verifier handoff

Submission preflight at `c9f7743d68920c3e15ef3776a8f8370265153d0c`
found no changes to this link map, its review, the atlas, reviewed coverage,
owner documents or validation scripts. The intervening proposed LV roadmap
revision still has 12 stages; its supplier-contract screen and Kummer-field
scope do not establish a new multiquadratic edge.

The unchanged input map passes `scripts/check_links.py`: three links,
two overlaps, 218 examined entries, zero errors and zero warnings, including
the checker’s other-packet cycle checks. Both new findings have explicit
statement-level evidence, hypotheses and bounded fixes; the independent
verifier should start with the two pinned files above, not the stale
`GenusField.lean` comment.

The companion result uses `redteam-v1` with status `complete`.
`scripts/check_redteam.py` passes; the intake deliverable-scope check reports
two files and zero problems; all 34 red-team/intake regression tests pass. No Lean
file is required, written or compiled. A complete red-team attack means this
bounded link-map job is finished; it is not a certification of every theorem,
library proof or negative search result in the surrounding atlas.
