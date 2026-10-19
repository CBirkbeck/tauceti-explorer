# Independent review: small ramification and low-degree Hodge obstructions

**Job:** REV-DESIGN-SmallRamificationAndAbelianVarietyBaseCasesPartII · **Issue:** #3615  
**Reviewer:** Codex, session codex-OpprAP · **Date:** 2026-10-19  
**Verdict:** **accepted**, as a target-level plan with explicit supplier obligations. This session did not write the design being reviewed (DESIGN job #3379, session codex-MVSHUy).

All 24 nodes are justified: **20 verified, four corrected, none added, none unverifiable**. All six baseline citations are confirmed. No unresolved mathematical contradiction was found. Acceptance does not certify implementation or discharge the three recorded gaps. The roadmap remains a draft definition, with every layer planned and every node's implementation status unchecked.

## Inventory and corrections

The packet contains five definitions, two comparisons, fourteen theorems and three applications; 28 API items, 15 definition tests, thirteen planets, eleven supplier requests and three highlighted gaps. Planet counts are LH.0: 1, LH.1: 3, LH.2: 6, LH.3: 2, LH.4: 1. Each definition has three tests and an API derived from its consumers. The five layers cover their stated targets and respect the dependency order. No proof was split into extra lemma nodes.

Four nodes changed, with the reader synchronized in every case:

1. **LH.0/witt-good-reduction:** replaced the generic second test by the concrete curve E:y²=x³−x at 3. Its discriminant 64 is a unit in Z₃, so it has a smooth proper Z₃-model, while its bad reduction at 2 prevents everywhere Witt good reduction. This distinguishes the local predicate from one that incorrectly requires an everywhere-good global model. The existing negative test at 2 remains.
2. **LH.1/truncated-valuation-ring:** replaced the third test, which only checked the empty dyadic parameter range, by the admissible calculation p=3, r=1, π²=−3. The class [π] survives at valuation 1/2, belongs to Fil¹, and satisfies φ₁([π])=[π]. A denominator +p instead gives the distinct class −[π]. The dyadic exclusion remains in the boundary check.
3. **LH.1/solution-cardinality:** specified matrix lifts in W(k) for the fixed-point proof. These are Galois fixed, so unique exact-solution lifting gives the equivariant bijection needed for descent to E. The argument does not assume that invariants commute with the valuation quotient.
4. **LH.2/no-trivial-quotient:** extended the locator from printed p. 7 to pp. 7–8; the higher-torsion induction finishes on p. 8.

The packet summary, remaining-work notes and reader's final review state now distinguish completed independent review from supplier and proof work still to do. No baseline citation was removed or replaced. No source passage or excerpt was added. No theorem statement, roadmap layer, planet or suggested Lean declaration required correction. The roadmap definition and suggested file were reviewed and left unchanged.

## Source checks and mathematical boundaries

Read Fontaine's complete public author scan, including both main theorems, the global devissage, the filtered valuation calculation, both local ramification arguments and bibliography. All packet locators refer to its printed pages; PDF page number is printed page plus one. The downloaded scan's SHA-256 is `3a0d2b7a95db090438b43a86040d92b748e351a6461257dd083151864f33dc67`. Source: [Fontaine, Schémas propres et lisses sur Z](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), author preprint 91-02, later published in the 1993 Indo-French proceedings, pp. 43–56; accessed 2026-10-19.

The per-node `review.checked` entries record the source and supplier checks. Particular conclusions are:

- **Local theorem:** Theorem 2, printed p. 3, and §§3.2–3.8, pp. 8–12, support the safe range 0<r<p−1, the strict period cutoff, the distinct approximate-map cutoff, the denominator (−p)ⁱ and strict normalized different inequality. The cover's weaker inequality is compatible with the letter. The generic approximate-embedding criterion remains a requested export; the finite-flat theorem alone does not supply the higher-weight conclusion.
- **Global filtration:** §§2.1–2.7, pp. 4–8, support the order 3,2,1,0, the exceptional extension orientation quotient 1/sub χ³, arbitrary seven-power torsion and rational passage through stable lattices. The compact inverse-limit step needs compatible finite-level witnesses, as the plan states. The rank-one local unramified twist is removed globally before asserting scalar cyclotomic action.
- **Discriminant substitutions:** the existing R25.1 bound 287 gives n″≤6, enough for uniqueness of the seven-Sylow subgroup. The additional threshold below root discriminant seven is explicitly requested. For extension fields, degree 42 and root discriminant 7^(5/6)<5.72 contradict the existing degree-eight row in the unramified case. In the ramified cases a=1,2, the requested tame-conjugation formula and the new upper-break bound give b=a and discriminant exponent 41+6a≤53; hence root discriminant <12, contradicting the existing degree-at-least-36 row. Every such field contains Q(ζ₇), so the totally complex hypotheses apply. These replacements do not require an unverified class-number computation.
- **Geometry:** Theorem 1 and Remark (a), p. 3, permit independent Witt scheme models, including prime two. §§2.1 and its comparison footnotes, pp. 4–5, support the dual cohomology and Hodge–Tate signs. The proper smooth purity supplier includes the nonprojective case. Spreading X itself supplies an actual finite-field fibre; no finite unramified descent of an arbitrary Witt model is assumed. Purity eliminates all but the degree-two χ grade; the particular exhaustive filtration then gives scalar action on the whole space.

Read [Schröer's author revision of 19 July 2022](https://www.math.uni-duesseldorf.de/~schroeer/publications_pdf/EnriquesOverIntegers_Juli2022.pdf), §5, pp. 14–17, especially Proposition 5.5 proof, p. 16, for the Fontaine consumer and K3 value h²⁰=1. The shared K3 definition is projective and geometric. Coherent base change descends the dimension without descending a chosen two-form. The repaired Enriques package supplies projective Zₚ models; its canonical-cover and twisting arguments remain there. No algebraic-space model is silently used as a scheme model.

Checked [LMFDB 32.a3](https://www.lmfdb.org/EllipticCurve/Q/32/a/3), its minimal equation, invariants and local table at 2: discriminant 64, j=1728 and additive bad reduction at 2. These numerical values calibrate the two local-model tests; reduction criteria are imported from the existing EllipticCurves Layer 4. Both web sources were accessed 2026-10-19.

`sourceIssues` is empty. No mathematical error was established in the sources used here, so no confirmed or rejected source-issue entry was needed. The indirectly cited Fontaine 1985 ramification result is not represented as independently read. No cleared book was needed, copied or quoted.

## Baseline and ownership audit

Read the actual declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:

| Citation | Pinned module and line | Confirmed use |
| --- | --- | --- |
| `Representation` | Mathlib/RepresentationTheory/Basic.lean:49 | Monoid homomorphism into linear endomorphisms; continuity remains separate. |
| `Representation.invariants` | Mathlib/RepresentationTheory/Invariants.lean:74 | Vectors fixed by every group element. |
| `Submodule.comap` | Mathlib/Algebra/Module/Submodule/Map.lean:172 | Inverse images under semilinear maps; used with linear maps. |
| `Module.finrank` | Mathlib/LinearAlgebra/Dimension/Finrank.lean:62 | Natural-valued rank, used with the required finite-dimensionality. |
| `NumberField.rootDiscr` | Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:77 | Absolute discriminant to inverse degree. |
| `TauCeti.Hodge.tate_piece` | TauCeti/Geometry/Hodge/Tate/Basic.lean:110 | Sole Tate Hodge piece at the negative Tate index; a sign calibration. |

The shared Tau Ceti source file was also compared byte for byte with its pinned public GitHub version. A fresh index of the existing pinned trees contains 70,802 Tau Ceti and 246,008 Mathlib declarations; this was only a search aid, supplemented by the statement reads above.

Read the reviewed R25.1–R25.6 entries in `data/library-coverage.json`, the precise cited FL, p-adic comparison, continuous-representation, discriminant, proper smooth purity and K3 supplier statements, and the scheme/cohomology stage contracts. Existing nodes do not by themselves provide the new exact period model, generic P_m theorem or root-discriminant-seven certificate; the packet correctly requests these extensions.

Checked current read-only TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the relevant README and Suggested interfaces for LocalFieldsRamification, NumberFieldArithmetic, LocalGaloisGroups and EllipticCurves. Current ramification groups, local different/discriminant arithmetic, cyclotomic work, Hodge structures and finite-flat Cartier duality retain their existing owners. This plan's higher-weight period calculation and global Hodge obstruction are additional mathematics, not duplicate plans for those subjects.

## Validation and orchestrator follow-up

`python3 scripts/check_blueprint.py research/blueprint/packets/SmallRamificationAndAbelianVarietyBaseCasesPartII.json` passes with **zero errors and zero warnings**, including when supplied the freshly generated pinned declaration index. The **140-line suggested file elaborated successfully using `lean-check`**, with only its fifteen intended `sorry` warnings. Its real-bodied character step and finite filtration use actual pinned carriers. Missing geometric and period carriers remain reader targets. No Lean development, language server or library build was started.

The plan is accepted without closing any layer. Before proof closure, the orchestrator should discharge the eleven precise requests, particularly the three highlighted gaps: the certified rd<7 threshold, the exact A_cris/local-FL exports and the general P_m ramification implication. The certificate route offered for the first is a target for certified inequalities, not an already formalized numerical result.

Refresh the consuming historical route `EverywhereGoodReductionAndLowDegreeHodgeNumbers` to this roadmap's **LH.3/low-degree-hodge-vanishing** and **LH.4/k3-obstruction**, corresponding to PAPER-SCHROER-23/147 and /148. This review has no authority to edit the consumer. No new roadmap, issue, ownership move or reverse dependency is required.
