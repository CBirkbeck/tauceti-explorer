# Handoff: BP-GeometryOfNumbersAndQuadraticArithmetic--GN.1

Job #9325, Claude (Opus 5.5), session claude-hNXLjc, 2026-10-12.

## What was done

Follow-up plan for Layer GN.1, in its own packet
`research/blueprint/packets/GeometryOfNumbersAndQuadraticArithmetic--GN.1.json` (part `GN.1`, scope
`GN.1`, status `complete`, coverage `planned`), with the reader
`research/blueprint/readmes/GeometryOfNumbersAndQuadraticArithmetic--GN.1.md` (rendered from the
packet, about 11,000 words) and the suggested file
`research/blueprint/suggested/GeometryOfNumbersAndQuadraticArithmetic--GN.1.lean` (661 lines).

The base packet's 53 GN.1 nodes (successive minima, attainment, both sharp halves of Minkowski II,
linear forms, ordered-product and ball bounds) are cited by id and not re-planned. The three items its
coverage record left open are now planned:

1. **Supplier convention** ("reconcile Fin/real-valued minimum indexing"): the supplier is Tau Ceti's
   integral-lattice successive minima (IntegralLattices milestone 2F; on Tau Ceti main, not at the pin,
   `TauCeti.IntegralLattice.successiveMinimum L i : ℕ` with `i : Fin (finrank ℤ L)`, zero-based,
   norm-valued). `integral-norm-minima-comparison` proves that the squared Euclidean minima of an
   isometric realisation satisfy exactly that declaration's defining condition (`successiveMinimum_le_iff`),
   so the two agree index by index. Also planned: `successive-minimum-partial-product` (the a_k of
   Eskin–Katznelson as used by Shankar–Shankar–Tang–Tayou and Maulik–Shankar–Tang) and
   `definite-minima-discriminant` (covol ≤ ∏μ_i ≤ (2^r/V_r) covol; SSTT item 78).
2. **Hermite basis and John ellipsoid** (Evertse §2.3, read in full with the proof of Theorem 2.11):
   `basis-from-minima` (Exercise 2.8), `hermite-basis` (Theorem 2.11), `hermite-minima-product`
   (Corollaries 2.12–2.13, Exercise 2.12), `central-ellipsoid` (definition with 11 API items and 5 tests),
   `maximal-inscribed-ellipsoid`, `john-decomposition` and `john-ellipsoid` (Theorem 2.14, proof from
   Ball's Lecture 3), `john-weak-minkowski-second` (Corollary 2.15 with explicit constant).
3. **Smith's items** (PAPER-SMITH-24/21, /23, /68): `evaluation-polytope`, `evaluation-polytope-volume`,
   `evaluation-polytope-minima` (Proposition 3.4); `cofactor-polynomials`, `cofactor-integer-functional`,
   `real-cofactor-basis` (the algebra of the proof of Theorem 3.2); and, under GN.4,
   `gaussian-directional-tail`, `gaussian-coordinate-tails`, `l1-covering-transference` and
   `smith-cofactor-adjustment` (Theorem 3.2 with explicit constant 9n log(2n)).

Counts: 21 nodes (3 definitions, 2 constructions, 11 theorems, 4 lemmas, 1 comparison), 48 API items,
22 unit tests, 4 planets, 47 baseline declarations (each read at the pins), 0 gaps, 0 requests.

## Decisions a reviewer should check

- **Layer placement of Smith's covering step.** Theorem 3.2 needs the lattice Gaussian sums, Poisson
  summation and shift bound that this roadmap plans in GN.4 §4.4, and GN.4 already depends on GN.1. The
  four covering nodes therefore have `parentStageId` GN.4 (they realise GN.4), so Layer 1 never depends on
  Layer 4. Recorded as the first `restructure` entry. **The GN.4 follow-up (#9328) must cite these four
  ids and not plan them again.**
- **BLPS flatness (routed item 68) is not planned.** Smith only needs a covering bound for a symmetric
  cross-polytope. BLPS's proof of their Lemma 2.1 (and hence of Corollary 2.5) rests on Talagrand's
  majorizing-measure theorem, which no roadmap plans. The cross-polytope case follows from Banaszczyk's
  ℓ¹ and sup-norm Gaussian tail inequalities (proofs read in Peikert, ECCC TR06-148 rev. 1, Lemma 5.3 with
  d = 1; Lemmas 3.1, 3.3, 3.5, 2.7), giving μ₁(Λ)·λ₁^∞(Λ*) ≤ 3n√(log(8n)/π). Recorded in `routing`.
- **Source issues.** E1: Smith Prop. 3.4 "least real" should be "least nonnegative real" (already
  PAPER-SMITH-24/E3). E2 (new, gap): Smith's proof of Theorem 3.2 cites the flatness theorem for
  *simplices* for a *cross-polytope*; the missing step (a simplex of lattice width ≥ 1 inside it) is
  written out.
- **Planets.** The base packet already has six GN.1 planets; the second `restructure` entry proposes a
  sub-layer GN.1b "Bases, ellipsoids and polynomial lattices" for this packet's four planets. No planet is
  put on the GN.4 nodes (GN.4 also has six).

## Red-team finding RT-AREA-algebraicnt-1/1

Roadmap-level metadata is outside this job's files. The packet states the GN.1-level dependency on
TauCetiRoadmap/IntegralLattices (milestones 2B, 2E, 2F) in the nodes that use it, and the third
`restructure` entry adds tauceti:TauCetiRoadmap/IntegralLattices to the four prerequisites the base
packet already proposes, with reciprocal consumers. An `upstreamNotes` entry tells the maintainer that the
IntegralLattices README indexes minima from 1 while the implementation indexes from 0.

## Consumers to update

- LogarithmicPotentialTheoryAndAlgebraicIntegers requests R1 and R2 (supplier stage GN.1, "Part II"
  suggested) are supplied in this roadmap: cite `GN.1/evaluation-polytope-minima`,
  `GN.1/evaluation-polytope-volume` (R1) and `GN.4/smith-cofactor-adjustment` (R2). No Part II is needed.
- GN.4's counting results (SSTT item 79, MST item 75) should import `GN.1/successive-minimum-partial-product`.

## Checks run

- `python3 scripts/check_blueprint.py` on the packet (with the pinned declaration index): 0 errors,
  0 warnings.
- `lean-check` of the suggested file at Tau Ceti f790474 / Mathlib 082e2d3: exit 0, 90 warnings, all
  "declaration uses `sorry`", no errors or other warnings. Every packet API item, unit test (as a
  docstring `Test \`name\`` example) and theorem name (`library.name`) occurs in the file.
- The reader is rendered from the packet (every node appears once) and contains none of the words
  "optional", "deferred", "later".

## Sources read (all free)

Evertse, *Geometry of numbers* (dio19-2.pdf), §2.3–2.4; Ball, *An elementary introduction to modern
convex geometry*, Lecture 3; Smith, arXiv:2111.12660v2, §3; Peikert, ECCC TR06-148 rev. 1, §§2–3, 5;
Banaszczyk–Litvak–Pajor–Szarek, author copy, §§1–4; Shankar–Shankar–Tang–Tayou, arXiv:1909.07473v3, §7;
Maulik–Shankar–Tang, arXiv:2011.08887v1, §7; TauCetiRoadmap IntegralLattices README (0d144d0) and the
Tau Ceti documentation page of `IntegralLattice.PosDef.SuccessiveMinima`. Not read: Banaszczyk 1995/1996
(DCG, not free; their lemmas are used as presented by Peikert and BLPS), Schmidt's LNM 785, Cassels.

## What remains

Nothing at target level. At lemma level: split `hermite-basis` (Evertse Lemmas 2.16–2.19) and
`john-decomposition` (Ball pp.17–19); when `IntegralLattice.successiveMinimum` reaches the pinned Tau
Ceti commit, restate `integral-norm-minima-comparison` as an equality with it.
