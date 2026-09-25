# BP-HabiroCohomologyFoundations--HQ.1 — handoff

Part one of two for *q-Hodge filtrations and Habiro cohomology*. All eight stages
in scope carry coverage **`source_decomposed`** with empty `remaining`.

- Packet: `research/blueprint/packets/HabiroCohomologyFoundations--HQ.1.json`
- Document: `research/blueprint/readmes/HabiroCohomologyFoundations--HQ.1.md`
- Suggested Lean: `research/blueprint/suggested/HabiroCohomologyFoundations--HQ.1.lean`

**66 nodes** — 9 definitions, 14 constructions, 1 lemma, 28 theorems,
12 comparisons, 2 applications — with **127 API items**, **92 unit tests**,
**28 planets** (at most six per layer), **20 baseline declarations** and
**25 requests**. `check_blueprint.py`: 0 errors, 0 warnings.

**No Lean was compiled**; the Mathlib build here is a shared cache.

## The sources, and the numbering question the previous job got wrong

Three papers by Ferdinand Wagner, all obtained as LaTeX from the arXiv e-print
endpoint and hashed:

| paper | arXiv | SHA-256 (gzipped e-print) |
| --- | --- | --- |
| *q-Hodge complexes over the Habiro ring* | 2510.04782v2 | `9c338455…` |
| *q-Witt vectors* | 2410.23078v5 | `800822a7…` |
| *ku and q-de Rham cohomology* | 2510.06057v1 | `9a23a2b0…` |

The second and third are the ones the **BP-HabiroRings** handoff recorded as
missing; they are now in hand, and the q-Witt paper closes the part of that
roadmap's gap 1 that concerns the no-restriction obstruction and the ghost
description.

**The stage texts' numbering is the source's numbering**, contrary to what the
HabiroRings packet originally said. The source runs one counter per section,
shared by its numbered paragraphs (`numpar`) and its theorem environments alike,
and letters its appendix sections. Counted that way every citation lands on the
statement it describes — Definition 1.6, Definition 3.2, Lemma 3.3, Theorem 3.11,
Corollary 3.31, Proposition 3.47, Theorem 4.11, Corollary 4.16, Theorem 4.22,
Theorem 4.29, and in the q-Witt paper Definitions 3.1/3.6/3.9 and §3.11 — and the
companion paper's own cross-references (`Definition 3.2`, `Theorem 3.11`,
`Example 4.24` of the Habiro paper) confirm it independently. A separate pull
request corrects the HabiroRings packet, document and handoff.

## What is decomposed, layer by layer

- **HQ.1** (8 nodes). The import boundary with `PrismaticCohomology:PR.6`; then
  Appendix A in full — the coordinate-free rationalised q-crystalline comparison,
  the divided-power denominator estimates, the bound `N_n` **uniform in the
  prime**, the framed comparison with the logarithmic formula and its
  compatibility square, the global complex as a pullback, its four properties
  with base change, and the derived commutative lift through cosimplicial PD
  realisations.
- **HQ.2** (9 nodes). Conventions; the graded presentation `A[β,t]/(βt−(q−1))`;
  the quotient convention placing `q^m−1` in **filtration degree one**; the
  derived complex by animation, with where animation changes the answer; base
  change with its completion; the two rational comparisons and the source's own
  statement that the p-completed one **does not appear to follow**; the décalage
  import; and Proposition 3.47.
- **HQ.3** (13 nodes). Definition 3.2 with every coherence datum; Lemma 3.3; the
  q-Hodge complex; symmetric monoidality; the conjugate filtration and the
  abstract graded lemma; the twisted q-Hodge filtration p-adically and globally;
  the partial descents; the Habiro–Hodge complex; **Theorem 3.11** in both
  clauses; the explicit Koszul model and the étale case; the multiplicative
  upgrades with the Bockstein identification.
- **HQ.4** (13 nodes). The three categories of systems; the proof that no
  restriction exists and the Langer–Zink observation that replaces it; the
  q-de Rham–Witt complex with both universal properties; ghost maps with the
  actual torsion hypotheses; étale base change; the p-completion; twisted
  q-de Rham complexes; the Nygaard filtration; Lemma 3.30 and **Corollary 3.31**
  with its shift; the fracture squares; and the discipline on multiplicativity.
- **HQ.5** (14 nodes). The truncation adjunction; the canonical smooth filtration;
  **Theorem 4.11**; **Corollary 4.16** with the `2d` and `rd` bounds; algebraic
  Habiro cohomology with perfectness over the Habiro completion of the localised
  ring; condition (R); the naive filtration; **Theorem 4.22** with both
  conditions; flat base change; **Theorem 4.29**; uniqueness; the export.
- **HQ.5-trace** (4 nodes). The ku theorem in both its introductory and its body
  form; the proved counterexample that a `ku` lift does not suffice; the `E₁`
  refinement; the number-field ring from periodic complex K-theory.
- **HQ.6** (3 nodes). The comparison problem as a named problem, the three
  recorded differences, and the discipline about the analytic machinery.
- **HQ.7** (2 nodes). The acceptance suite and the executable boundary.

## Three misprints in the source

All three are misprints whose intended meaning is clear; none affects a proof,
and the nodes use the corrected statements.

1. **Definition 1.6's display** writes the first two filtration steps as both
   `fil⁰`; the second should be `fil¹`. The body definition is correct.
2. **Proposition 3.47(b)** writes `qΩ_{R/A}` where the statement is about `S`;
   the letter `R` does not occur in the proposition.
3. **Paragraphs 3.32, 3.34 and 3.35** write the q-Witt Hodge filtration symbol
   `fil_{Hhodge}` where they mean the twisted q-Hodge filtration
   `fil_{qHhodge}` — three times, applied to the twisted q-de Rham complex. The
   two symbols filter different objects, so the printed form does not typecheck;
   the neighbouring displays and the global construction use the intended one.

One further **precision, not an error**: the introduction's Theorem 1.19(b) asks
for an `E₁`-lift of `R` itself, while the body's Theorem 4.22(b) asks for one of
`R_∞ = (R ⊗_A A_∞)^∧_p`. The introduction's condition implies the body's; the
packet states the body's, since it is the weaker and the one actually proved.

## Gaps

1. **The proofs of the long technical lemmas were read only as statements**
   (HQ.3–HQ.5). The Nygaard fibre sequences, the two compatibility lemmas, the
   partial descent proposition, the truncation lemma, the pushout lemmas, the
   cartesian-lift lemma, and the proof of Theorem 4.22 beyond the worked example.
   The `proofSteps` record the source's own outline, not a verified reading.
2. **The trace-theoretic construction was imported, not decomposed**
   (HQ.5-trace). The ku paper's §§2, 3 and 5 — the solid even filtration, solid
   THH, and genuine equivariant descent — were not read. That is `RT.4`'s job.
3. **The analytic side has no source and no atlas owner** (HQ.6). The analytic
   Habiro stack is attributed to a lecture series that was not obtained, and
   `AnalyticHabiroStack` exists only as a draft under
   `research/blueprint/roadmaps/`, so the request filed against `HS.3` has no
   accepted owner.
4. **The thesis and the Meyer manuscript were not obtained** (HQ.3, HQ.5).
5. **The solid condensed appendix was read only at its final statement**.

## Requests

Twenty-five, the substantial ones being: `PrismaticCohomology:PR.6` for the whole
local theory including the relative Frobenius equivalence;
`DerivedDeRhamCohomology:DD.1`/`DD.2`/`DD.6`; `AInfCohomology:AI.1` for décalage;
`CrystallineCohomology:CR.4` for ordinary de Rham–Witt **with** its restrictions;
`EnhancedDerivedSheaves:E1`/`E4`/`E5`; `RefinedTraceMethods:RT.4:q-Hodge` and
`RT.6`; `HabiroRings:HR.1`–`HR.6`; `HabiroCyclotomicCompletions:HC.1`/`HC.3`;
`HabiroNumberFields:HB.6`/`HB.7`; and `AnalyticHabiroStack:HS.3`, which has no
accepted owner.

## Structural notes

- **RS-10 is not accepted** (`review.status` is *needs changes*), so this packet
  follows the current atlas. A worker who picks the roadmap up after RS-10 is
  accepted must not plan HQ.4's thirteen nodes a second time in `QWittVectors`.
- **HQ.2 is asked to prove a statement about objects HQ.3 defines** (Proposition
  3.47). Either add a supply edge `HQ.3 → HQ.2` or move the statement.
- **HQ.5 carries three independent bodies of work** and would read better as
  three sub-layers; the fourteen nodes already fall into groups of six, six, two.
- **HQ.7's audit verdict is *process***, yet it is planned here as two nodes, as
  the coefficient roadmap's acceptance layer was; the note explains the trade-off.

## Where to resume, for the companion part HQ.8

HQ.8 is the comparison atlas. Everything it needs from this part is in place: the
global complex and its four properties (HQ.1), the décalage import boundary
(HQ.2), the descent theorem and the Habiro–Hodge complex (HQ.3), the twisted
complexes and the Nygaard filtration (HQ.4), and the existence theorems (HQ.5).
What HQ.8 must add is, for each square, the base prism or perfectoid base, the
smooth/proper or quasi-syntomic hypotheses, the derived completion ideal, what is
inverted, the Frobenius linearisation, the filtration and the twist — and it must
respect the ordering the stage text fixes: `RT.6` after `PR`, and the trace proof
importing the *local* prismatic stages rather than the completed atlas, so that no
filtration is defined by the comparison theorem it is meant to prove.

The single most valuable next source action for this roadmap is gap 1: read the
proofs of the Nygaard comparison (Proposition 3.22 and Lemmas 3.23–3.27) and of
Theorem 4.22. Those are the two places where a Lean implementation would first
need more than the statement.
