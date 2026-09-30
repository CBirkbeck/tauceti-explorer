# REV-FIX-RT-LINK-tauceti_TauCetiRoadmap_NumberFieldArithmetic

Independent review of FIX-RT-LINK-tauceti_TauCetiRoadmap_NumberFieldArithmetic (Codex, session `codex-5ebb6f`, issue
#5032) for issue #5173.

Reviewer: Claude Code, session `cc-c2c06b`, 30 September 2026. I did not write:
- the link map or its first review;
- the red team (Codex `codex-J6LwjP`) or its verification;
- the fix.

**Verdict: accepted.** No correction was needed.

**What I reviewed.** The file under review is `research/blueprint/links/tauceti_TauCetiRoadmap_NumberFieldArithmetic.json`.
I read:
- the findings and verdicts (`RT-LINK-tauceti_TauCetiRoadmap_NumberFieldArithmetic.result.json` and `.review.json`);
- the fixer's report;
- the fix commit's diff of the map.

**The fix, as a diff.**
- Exactly three links are added: `NFA-FIX-RT-1`, `-2a` and `-2b`.
- The original 61 links and ten overlaps are unchanged.
- Two examined entries (ArithmeticGaloisDuality, FaltingsFinitenessAndIsogenyTheorems) change from no-link notes to
  `links`.
- The summary is updated, and the accepted first review is kept under `reviewHistory`.

**Checks.**
- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_NumberFieldArithmetic.json`: 0 errors,
  0 warnings. The map has 64 links, 10 overlaps and 212 examined entries.
- `research/blueprint/intake.py check-files` on the two deliverables: no problems.
- All five endpoints are stages in `data/atlas.json`.
- **The quotations.** All six evidence quotes match their source files at the stated line locators:
  - NumberFieldArithmetic README, lines 607 (unramified compositum), 1139 (the relative-discriminant tower formula) and
    1817–1818 (the wild different bound);
  - ArithmeticGaloisDuality README, line 48 ("Define G_{F,S} …");
  - Faltings README, line 28 (R28.1's descent clause).
- **Order.** Reachability over the atlas stage edges and `requires`, plus every research link file: neither consumer
  reaches its supplier, so all three new links are acyclic.
- **Declarations.** The pinned declarations named in the reasons are in the declaration index at the cited places:
  - `TauCeti.relDiscr_tower`, `TauCeti/RingTheory/DedekindDomain/Discriminant/Separable.lean:50`;
  - `NumberField.finite_of_discr_bdd`, `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:496`;
  - `NumberField.isUnramifiedAway_of_intermediateField`, `TauCeti/NumberTheory/NumberField/UnramifiedTower.lean:53`.

## /1 (medium, missing): NFA Layer 1 → ArithmeticGaloisDuality R02.3. Right.

The link supplies only closure under finite composita of extensions unramified at the finite places outside S. The
reason leaves to R02.3 the normal closure, the infinite union, the Krull topology, the Galois quotient and continuous
cohomology, and it says that no infinite Galois group is supplied. That is the verifier's scope. The reason cites the
accepted analogue NFA1 → IntegralIwasawaTheory L1. Per the verifier, the pinned
`isUnramifiedAway_of_intermediateField` proves tower descent, not compositum closure, and the report keeps that
distinction.

## /2 (medium, missing): NFA Layers 4 and 6 → Faltings R28.1. Right.

**What the links supply.** Layer 4 supplies relative/absolute discriminant assembly and imports the landed tower theorem
rather than re-planning it. Layer 6 supplies the global wild different bound, e ≤ v_P(𝔡) ≤ e − 1 + v_P(e), with its
completion and multiplicity bridges.

**What stays open.** Both reasons name the accepted Hermite–Minkowski child of the integrated Faltings decomposition
and keep its gap open: the uniform bound in degree and S, the application of bounded-discriminant finiteness, and
counting in a fixed algebraic closure. Neither reason substitutes a tame-only bound. This is what the verifier required.

**Target stage.** The links target the stage R28.1, whose quoted descent clause is where the integrated child sits. That
agrees with the map's convention of stage-level endpoints.

## For the maintainer

- **Promotion.** Once this file is promoted, re-run the assembly to confirm that the three pairs appear in the
  consumers' `requires`, as the fixer notes. The fixer's scratch simulation found exactly these three new edges.
