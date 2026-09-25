# REV-MotivesAndAlgebraicCycles — review of the blueprint of motives and algebraic cycles

**Verdict: `needs_changes`.**

- **The packet and the suggested Lean file are corrected in place.** Every node was checked at its source locator, and
  every baseline citation was read at the pins. `check_blueprint` reports no errors.
- **The only outstanding change is the roadmap document.** `research/blueprint/readmes/MotivesAndAlgebraicCycles.md` is
  outside this review's files, so it still describes the uncorrected packet. It must be regenerated from the corrected
  packet before promotion.

- **Reviewer:** Claude Code, session `cc-2aeb03`, 25 September 2026 (issue #520).
- **Author of the blueprint:** Claude Code, session `cc-7b31c4` (BP-MotivesAndAlgebraicCycles, #2836 and #2878). This
  reviewer took no part in it.
- **Baseline:** Mathlib `082e2d3`, Tau Ceti `f790474`.
- **Method:** four independent reviewers each took two layers (MC.0–MC.1, MC.2–MC.3, MC.4–MC.5, MC.6–MC.7) and wrote a
  patch. The coordinating reviewer merged the patches, resolved the conflicts between them, spot-checked the source
  mistakes that affect stated results, and had the suggested file rewritten and elaborated.

## What was read

- **Every source at every cited locator.** All nine recorded SHA-256 values match the files read:
  - the Stacks Project chapters Weil Cohomology Theories and Chow Homology (LaTeX at the pinned Stacks commit);
  - Jannsen, *Motives, numerical equivalence, and semi-simplicity*, Invent. Math. 107 (1992), the scan of the published
    article;
  - Huber–Müller-Stach, arXiv:1105.0865v5;
  - Mazza–Voevodsky–Weibel, the Clay PDF, with the authors' corrections list (read from the Internet Archive, since the
    live link returns 404);
  - Milne's *Motives — Grothendieck's Dream* (15 pages, not ten as the source entry said);
  - Deligne's Clay text on the Hodge conjecture;
  - Totaro's survey of the Tate conjecture;
  - Voevodsky's cancellation theorem (arXiv:math/0202012).
- **Two sources are added:**
  - the Stacks chapter Homological Algebra, for Lemmas 0FFT, 0FFU and 0FFV, which the Weil chapter's proofs cite;
  - Deligne–Milne, *Tannakian Categories* (Milne's corrected TeX version). It is the Tannakian reconstruction source that
    MC.6's stage text asks to select, and to which Huber–Müller-Stach defer.
- **`sourceVersions` now records what was read,** with its kind (published, preprint, author copy), as PROTOCOL §18
  requires for findings that quote stated results.
- **Libraries.** Every `mathlib:` and `tauceti:` citation was opened at the pinned commit. The reviewed audit and RS-08,
  which narrows MC.4, were read and followed.

## Counts

| | Before | After |
|---|---|---|
| Nodes | 96 | 173 (5 verified, 89 corrected, 79 added; 2 removed, 1 moved) |
| Baseline declarations | 48 | 99 (39 confirmed, 9 fixed, 3 removed; 57 added) |
| API items / unit tests | 206 / 132 | 426 / 233 |
| Planets | 44 | 47 (six per layer, five in MC.2) |
| Gaps | 8 | 21 |
| Requests | 6 | 14 |
| Source issues | 5 | 47 (E1–E5 confirmed; E6–E47 added, all confirmed) |
| Layers `source_decomposed` | 8 | 2 (MC.1, MC.3) |

`python3 scripts/check_blueprint.py --index <pinned index>`: 0 errors, 0 warnings.

## Main corrections

**Coverage was overstated.** Six of the eight layers were marked `source_decomposed` with nothing remaining while work
remained. They are now `partial`, each with its remaining list:

- **MC.0:** algebraic equivalence, which the stage asks for, is not planned.
- **MC.2:** the comparison of the Betti, de Rham and étale realisations is only requested.
- **MC.4:** the comparison with higher Chow groups (assigned to MC.4 by RS-08) was stated without proof. It is now
  decomposed through MVW 16.7–16.12 and 19.4–19.9. Friedlander–Voevodsky duality and the shifting theorem, which MVW cite
  without proof, are recorded as a gap.
- **MC.5:** the representation by singular cohomology and Nori's Basic Lemma are not proved in the source read.
- **MC.6:** the Artin and Tate subcategories are computed in no source read.
- **MC.7:** the primary proofs of the known cases are not obtained.

**Wrong statements corrected:**

- The numerical-equivalence node now excludes the trivial relation. Its elliptic-curve test was false and now uses
  Cremona's curve 37a1.
- Stacks's "left dual" is Mathlib's *right* dual. The rigidity node now uses `RightRigidCategory`, and the baseline entry
  is fixed.
- The realisation equivalence put F[2] in degree +2; it belongs in degree −2.
- The rank-of-a-motive test used a genus-1 curve, which has rank 0; it needs genus ≥ 2.
- Jannsen's implication (a) ⇒ (c) was stated in the reverse direction. His Theorem 1 is now split into its three
  implications.
- Conjecture C was stated as an equivalence the sources do not give. It is now an implication.
- The standard conjectures had been written from memory. The Lefschetz one is now Deligne's Example 2.
- The smash-nilpotence proof steps had been invented. They are replaced by the Stacks argument, with its two omitted steps
  recorded (E46, E47).
- MVW's integral Chow motives had been equated with MC.1's rational ones. The comparison now uses d = dim Y, a known
  erratum (E23).
- Nori diagrams are ℤ/2-graded, and a representation must send identity edges to identities.
- G_mot is now defined through singular cohomology in every node that uses it.
- The torsor axioms are restated exactly, and the class is renamed `Heap`, since Mathlib's `Torsor` is a torsor under a
  given group.
- One unit test, `numQuotient_not_faithful`, needed [p] − [0] of infinite order in CH_0(E), not merely p ≠ 0. With
  rational coefficients a torsion point gives the zero correspondence, and over the algebraic closure of a finite field
  every point is torsion. Found while formalising it; corrected.

**Structure:**

- **Motives are now the Karoubi envelope of a category of pairs (X, m).** That category is added.
- **Stacks Lemma 0FG0 is split** into one node per part.
- **Explicit projectors on ℙⁿ are added,** as the stage asks.
- **Moves to remove dependencies on later layers:**
  - `MC.0/homological-equivalence` depended on MC.2's Weil cohomology, so it moves to `MC.2/homological-equivalence`,
    realising MC.0 and MC.2.
  - The Künneth components move from MC.7 into MC.2 (`MC.2/kunneth-components`), which MC.7/kunneth-conjecture-C now cites.
- **A base-change node is added:** `MC.2/weil-cohomology-by-base-change` gives homological equivalence over a field that
  is not algebraically closed, which Jannsen's theorem uses. It resolves the gap one reviewer had opened for this.
- **Two nodes are removed:**
  - `MC.4/cancellation-over-a-perfect-field` duplicates MotivicEtaleKTheory M.5a, which RS-08 makes the owner and which the
    packet already requests;
  - `MC.4/nisnevich-versus-etale-and-rational-coefficients` lies outside MC.4 as RS-08 narrows it, and nothing cited it.
- **Missing inputs added in MC.3:** finite dimensionality, Jannsen's Remark 4, the quotient functor, and the definitions of
  Tannakian category, rank and semisimple category.

## Baseline

- **Removed (3):**
  - `TauCeti.wedderburn_data_unique`, which is about simple rings and is not used;
  - `CategoryTheory.Functor.IsLocalization`, since inverting the Tate twist is not a localisation at a class of morphisms;
  - `TauCeti.Tannaka.reconstructedPoint`, which only builds the point. It is replaced by `pointsFunctorIsoTensorAutFunctor`.
- **`CategoryTheory.yoneda`.** One reviewer removed it as unused by MC.1, but the added MC.6 node
  `rigid-bialgebra-is-hopf` uses it, so it is restored with a corrected description.
- **Fixed (9)**, among them:
  - `Idempotents.Karoubi` and `Karoubi.Hom`: the diagrammatic order of composition;
  - `ExactPairing` and `LeftRigidCategory`: the left/right naming;
  - `FGComoduleCat.instRigidCategory`: it goes from a Hopf algebra to rigidity, not the converse.
- **Added (57),** among them `karoubiUniversal`, `RightRigidCategory`, `ExactPairing.tensor`, `tensorRightHomEquiv`,
  `isIso_of_yoneda_map_bijective` and Tau Ceti's Tannakian API.
- **Kept as register entries.** Four original entries have no remaining consumer: `AlgebraicCycle.map`, `MorphismProperty`,
  `IsSemisimpleModule` and `TensorProduct`. They were confirmed at the pin.

## Mistakes in the sources (E1–E47)

The five original entries are confirmed. 42 new entries were added, each checked at its locator by the reviewer who
found it. The coordinating reviewer checked E9, E10 and E28 independently.

**Errors in stated results:**

- **E9, Stacks Lemma 0FGR.** The binomial coefficients in the formula for the diagonal of a projective bundle are wrong for
  r ≥ 3; every coefficient is 1. The proof's own top-degree expansion gives binom(j, j) = 1. On P² the printed formula gives
  h₁² + 2h₁h₂ + h₂², which meets L × L′ twice, where the diagonal meets it once.
- **E10, Jannsen p. 448.** "Numerical equivalence is the coarsest adequate relation" fails for the trivial relation. For
  that relation, (a) and (b) of Theorem 1 hold and (c) fails, so Theorem 1 must exclude it.
- **E28, Huber–Müller-Stach Lemma 1.12(2)–(3).** Z must be geometrically irreducible (respectively geometrically
  connected). Counterexample: Z = Spec ℚ(i) and V(t² + 1) in 𝔸¹, whose top cohomology is ℚ².
- **E42, Huber–Müller-Stach Propositions A.4 and A.6.** Both fail for the empty torsor.
- **E25, MVW Lecture 13.** Several results are stated without "k perfect" although their proofs use it.

**Gaps and errors in proofs:**

- **E38, Huber–Müller-Stach Theorem 2.6.** The spaces are quotients, not subspaces.
- **E37, Theorem 2.10.** It treats the comparison algebra of all pairs as an algebra, which works only through good pairs.
- **E36, the setting of Section 2.** The representations must be graded multiplicative, which the paper never assumes.
- **E39, Corollary 3.4.** Its G₁ = G_mot conflicts with Theorem 1.14's definition.
- **E29–E31.** The sign convention of Theorem 1.6 contradicts B.14, and the product on coboundary edges is undefined.
- **E21, MVW.** The Gysin triangle and the blow-up formula need resolution of singularities.
- **E13 and E18, Stacks 0FH3 and 0FH2.** Unproved "same thing" assertions.
- **E46 and E47, Stacks 0FH9 (smash nilpotence).** Two omitted steps.

The rest are misprints.

## The suggested Lean file

- **As submitted, it did not elaborate.** It had 54 errors, and about 150 occurrences of `True` stood in for statements.
- **It is rewritten against the corrected packet:** 9,058 lines in namespace `TauCeti.Motives`, one section per layer.
  - It elaborates at Mathlib `082e2d3` with `lake env lean`; the only messages are 788 `declaration uses 'sorry'`
    warnings.
  - Every API item and unit test of the packet occurs under its packet name, and no statement is `True`.
  - Objects that other roadmaps own (SF.2–SF.6, M.4, M.5a, EDC.2, EDC.3, C4, C5) are structure parameters, each with a
    docstring naming its owner.
- **Where the prototype had to narrow a statement,** the file says so in a comment:
  - SF.4's resolution of singularities cannot be stated against Mathlib, so MC.4's "perfect with resolution" statements
    are made in characteristic zero;
  - the normal-crossings conditions of MC.5 are dropped;
  - comodules in MC.3's non-faithfulness example are replaced by representations of finite groups;
  - some entries of MC.7's register of known cases are comments only.

## Questions for the orchestrator

1. **The roadmap document** must be regenerated from the corrected packet before promotion. This is the only reason for
   `needs_changes`. Points it must carry:
   - the MC.4 and MC.5 corrections listed above (the ℤ/2 grading, identity edges, the B.14 sign, geometric irreducibility
     in Lemma 1.12, the Gysin triangle under perfectness and resolution, M(X)^* = M^c(X)(−d)[−2d], the integral Chow
     comparison);
   - the Karoubi construction;
   - the moved and removed nodes.
2. **Neutrality of numerical motives.** Milne's MOT, §6, says numerical motives become Tannakian under Conjecture C alone,
   "neutral if k has characteristic zero". Neutrality seems to need more than Conjecture C, for instance a fibre functor
   over ℚ from Conjecture D. It concerns MC.7; MC.3's node claims no neutrality. No source settled it, so it is not
   recorded as a finding, and an expert should look.
3. **Ownership of formal periods.** PeriodsAndSpecialValues PS.2 says it constructs the algebra of formal periods, its
   comparison with the coordinate ring of the Nori period torsor, and the evaluation in ℂ; it also requires MC.6. The packet
   plans formal periods and the torsor in MC.6, which is defensible, since PS.2 imports MC.6. This review moves the
   evaluation map out of MC.6 and adds `MC.6/period-point`, the complex point of the torsor. PS.2 should import MC.6's
   formal-period, comparison-algebra, period-torsor and period-point nodes, and own the integration description and the
   Kontsevich–Zagier periods (Huber–Müller-Stach Corollary 2.12).
4. **`MC.2/graph-duality-compatibility`** is Stacks Lemma 0FG8, which no MC.0 node plans. It could be re-parented to MC.0.
5. **Resolution of singularities (SF.4) is a new request.** MVW's Gysin triangle and several MC.4 results depend on it,
   and no layer of the atlas plans it.
