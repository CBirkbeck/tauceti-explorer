# REV-RS-08 — review of the RS-08 restructuring (Galois deformations, modularity lifting, Selmer groups and motives)

**Verdict: accepted, with corrections made in place.**

- **Reviewer:** Claude Code, session `cc-2aeb03`, 23 September 2026 (issue #815).
- **Author:** ChatGPT Pro, session `cg-6b83f1` (PR #941). This reviewer took no part in it.

**What was read.**

- **The family file:** `RS-08.json` — 11 members, 3 anchors, 198 evidence rows (98 unordered pairs).
- **The proposal** `RS-08.result.json`, with 35 narrowed layers, 385 links and 59 owner records, and its report `RS-08.md`.
- **The member documents:** all eleven, and the atlas descriptions of all 98 member stages, listed or not.
- **The anchor documents:** ProfiniteCohomology, ModularForms and ModularCurves.
- **Outside the family:** the descriptions of every stage the proposal names as a supplier or consumer outside the family.
  Examples: ClassFieldTheory Layers 5 and 10, DirichletPadicLFunctions L4, SchemeAndStackFoundations SF.5 and
  PadicHodgeRegulators L1/D.2.
- **Other proposals:** the accepted restructurings that touch this family (RS-16, RS-18, RS-26, RS-28), for consistency.

**Checks run.**

- **Checker.** `python3 scripts/check_restructure.py research/blueprint/restructure/RS-08.result.json` reports `ok`, before
  and after the corrections.
- **Application.** `apply_restructurings` was run with the sixteen accepted proposals applied first, including RS-16 and
  RS-18, which are not yet promoted.
  - Before: all 385 links resolve and 342 new edges apply.
  - After: all 417 links resolve and 374 new edges apply.
  - No link is skipped for a cycle, and none touches a layer an accepted proposal drops. No accepted proposal changes an
    RS-08 member stage.
- **Forwarding (§15).** For every narrowed layer, each supplier was checked for a link to each atlas consumer. There are no
  gaps, before or after the corrections.
- **Evidence.** 92 of the 98 evidence pairs share an owner record.
  - Five of the other six are deliberate supplier/consumer handoffs, checked individually (§1).
  - The sixth pair, (ModularCurves 7B, R03.2), lost its record because that record was wrong. The report's §5 already calls
    it a false identification.

## 1. Duplication

**The architecture is right.**

- **Cohomology.** The steps are separated:
  - the anchor owns the discrete carrier and its operations;
  - R02.1 owns compact coefficients and derived limits;
  - R02.2 owns the full Hochschild–Serre spectral sequence;
  - R02.3/R02.4 own arithmetic finiteness and Poitou–Tate;
  - D7 owns the derived and compact extension of duality.
- **Selmer formalism.** It is built once, in Selmer L2. R02.5, D8, M.1, M.2 and M.8 apply it.
- **Deformation theory.** General algebra is separated from arithmetic theorems:
  - DeformationAndDerivedPatchingAlgebra R03/P owns coefficients, representability, depth and patching;
  - R04.1 owns the generic deformation functor;
  - R08.1 and R04.2 are its local and global applications.
- **Motives.** Pure and mixed motives are kept apart from K-theory: M.4 owns higher Chow, M.5a the effective motivic
  category, and MC.0/MC.1 Chow correspondences and pure motives.

**Duplicates the proposal missed, now given owners.**

- **Compact coefficients.**
  - The finite-coefficient compact-support fibre (R02.3; D7 also constructed it).
  - Restriction/corestriction identities for compact coefficients (R02.2).
  - The compact Shapiro lemma, projection formula and single sign normalization (D7). Selmer L0's narrowed keeps had claimed
    both of the last two.
- **Discrete anchor layers.** All-degree discrete corestriction (anchor Layer 10) and the all-degree cup product (Layer 12),
  consistent with accepted RS-28.
- **Selmer-complex duality** (Selmer L1; D8 planned it too).
- **The ACC+ problem.** The ACC+ Definition 6.2.2 unpolarized variable-determinant problem belongs to G8; G7 had planned its
  presentation. The polarized functors belong to G7; G8 had planned "polarized variants".
- **Level-one Eichler–Shimura** (ModularForms Layer 11). This is a special case of Symbols L0's general-level theorem, which
  now cites it.
- **Ordinary Chow groups** (SchemeAndStackFoundations SF.5, consistent with RS-18/RS-25). They are the degree-zero case of
  M.4.

**The six evidence pairs without a shared record.**

- **(G7, R08.6), (R32.3, R08.6) and (R32.1, R04.6):** local conditions or the deformation-to-Hecke map exported by one stage
  and consumed by the other.
- **(R32.4, R21.3):** Pan's reducible lifting uses the ordinary Galois data it imports.
- **(ModularCurves 4, R03.3):** R03.3 imports 4D's local-ring toolkit. That pair now shares the retargeted 4D record.
- **(7B, R03.2):** a false identification. 7B applies 4D's theorems and constructs no representability theory.

## 2. Nothing lost

**This is where the proposal fell short.** §15 makes `keeps` "exactly what remains", and a blueprint job plans a narrowed
layer only as far as it keeps. 30 of the 35 narrowed layers needed corrected keeps. Most had silently dropped targets of the
original layer that no named supplier plans. Examples:

- **ArithmeticGaloisDuality D7:** restricted products and unramified subgroups in each coefficient regime, and the single
  sign normalization.
- **Selmer L0 and L1:** the units/S-units comparison, the bad-prime comparison terms, and the Selmer-complex duality map.
- **DeformationAndDerivedPatchingAlgebra P7:** derived specialization, and Hecke actions surviving the inverse system, which
  P8 and RS-16's consumers need.
- **R03.1 and R03.3:** Artinian presentation, residue-field extension, dimension formulas and associated primes.
- **R04.1, R08.1, G7 and G8:** pseudorepresentation functors, archimedean rings at p = 2, fixed-determinant variants and the
  ACC+ hypotheses.
- **GL2ModularityLifting R22.3, R22.5:** framing and determinant tracking; the "potentially Barsotti–Tate" class.
- **Ordinary modularity lifting R21.2–R21.4:**
  - Skinner–Wiles' p-distinguishedness and tame-character hypotheses;
  - the ordinary deformation rings consumed by R21.4;
  - individual hypothesis bookkeeping.
- **PadicFamilies:**
  - L0: the ordinary Eisenstein family;
  - L1: the two-variable ordinary measure and congruence modules. L1 had also added an unsupported claim of family flatness;
  - L2: the scalar-family hypotheses.
- **ModularSymbolsPadicLFunctions:**
  - L0: the comparison with the analytic modular curve;
  - L1: algebraicity of critical values, which RankZeroOneBSD BSD.5 uses.
- **Motives and K-theory:**
  - MC.4: the localization, homotopy and projective-bundle theorems and the worked Tate computations, which PS.9 needs;
  - M.1: the realization of K-theory's coefficients;
  - M.2: the verification of cohomological-dimension hypotheses;
  - M.8: the Chern-character compatibilities and the Euler-system interface.

**Other corrections.** Each corrected keeps was checked against the original stage text and the supplier descriptions.
Besides restoring dropped targets:

- **Silent changes of scope undone:**
  - R02.5 had claimed the local tangent calculations that its own text assigns to R08. The owner record now names R08.6,
    matching the proposal's link R08.6 → R02.5.
  - R08.4 had absorbed R08.5's dyadic hypotheses.
  - M.8 had claimed p-adic regulators, which its text leaves to PadicHodgeRegulators.
  - PadicFamilies L1 had claimed family flatness.
- **Wrong suppliers fixed:**
  - Selmer L3 is not a supplier of D8. D8 never uses Iwasawa cohomology, and the three forwarded links L3 → D8, G7 and G8 made
    GL_n deformation rings wait on Iwasawa theory; all three are removed.
  - ModularCurves 7F plans no coefficient category; it is removed from R03.1's suppliers.
  - Added as suppliers: R03.6 to R21.4 (abstract support transport); G8 and R02.6 to G7; ModularForms Layer 11 to Symbols L0;
    D7 and anchor Layers 10 and 12 to Selmer L0.
- **Missing narrowing.** GL2ModularityLifting R22.6 was unlisted, but the proposal's own owner records move its local
  Barsotti–Tate geometry and dyadic calculations to R08.4/R08.5. It is now narrowed, with forwarding links to its five
  consumers. All ten links follow paths that already exist.

## 3. Extensions, anchors, format

- **ArithmeticGaloisDuality** becomes "Continuous cohomology of profinite groups, Part II: compact coefficients and arithmetic
  duality".
  - The title is exact.
  - The start point is right: the anchor's stated exclusions are exactly the Hochschild–Serre spectral sequence and
    non-discrete coefficient modules, which is where R02.1 and R02.2 begin.
  - Links were added from the anchor's Layers 0, 11 and 12 and from ClassFieldTheory Layers 5 and 10 to the stages that
    instantiate them.
- **ModularSymbolsPadicLFunctions** becomes "Modular forms — Hecke theory, newforms, and L-functions, Part II: cohomological
  symbols and analytic p-adic L-functions".
  - **Title corrected.** It read "Modular forms, Part II: …", but the base title is the full one, as RS-06 and RS-21 use it.
  - **Start point.** Right for Layers 7 and 8. Layer 8 builds the symbols homologically, "no cohomological comparison". The
    extension now also builds on two base outputs in its direction: Layer 11 (the level-one Eichler–Shimura isomorphism) and
    Layer 10A (the analytic curve).
- **Anchors.** No anchor stage is narrowed or changed.
- **Format.** The JSON follows PROTOCOL §15. The review object is added.

## 4. Corrections made

Every change is listed in `review.corrections` of the proposal. In summary:

- **Title:** one.
- **Layers:** 31 layer entries corrected: the keeps of 30 narrowed layers and of the newly narrowed R22.6, 7 suppliedBy lists and 2 reasons.
- **Links removed:** the three from Selmer L3 (to D8, G7 and G8).
- **Links added (35):**
  - **§15 forwarding:**
    - D7 → EulerSystemsCyclotomicMainConjecture L0 and PadicHodgeRegulators L0;
    - ProfiniteCohomology Layer 10 → EulerSystemsCyclotomicMainConjecture L0, PadicHodgeRegulators L0 and Selmer L1;
    - Layer 12 → EulerSystemsCyclotomicMainConjecture L0, PadicHodgeRegulators L0, Selmer L0 and L1;
    - R03.6 → R21.4 and R21.5;
    - R08.4 and R08.5 → ClassicalSerreModularity R26.1 and R27.1, GL2ModularityLifting R32.1, and PotentialModularity R23.4
      and R24.1;
    - ModularForms Layer 11 → Symbols L0 and L1.
  - **Imports named in corrected keeps:**
    - Layer 12 → D7 and R02.4;
    - Layer 0 → R02.4;
    - Layer 11 → R02.3;
    - ClassFieldTheory Layers 5 and 10 → R02.4;
    - R02.5 → D8;
    - G8 → G7;
    - ModularForms 10A → Symbols L0;
    - DirichletPadicLFunctions L4 → PadicFamilies L0;
    - SchemeAndStackFoundations SF.5 → M.4;
    - R08.2 → L7 (L7's rank-n conditions build on R08.2's; §15 last rule).
- **Owner records (28 changes):**
  - 17 retargeted, so that each target is what its owner actually plans. Examples: the anchor Layers 5, 6, 10 and 11
    records; R02.3; D8; R02.6 (rank two); Selmer L4 (propagation only, after accepted RS-26); the ModularForms 8 and
    Symbols records.
  - One owner changed: the local tangent spaces now belong to R08.6, which the atlas says owns them.
  - One wrong record removed: the 7B record.
  - Ten added (§1).

## Questions for the orchestrator

1. **Rank n versus rank two in LocalGaloisDeformationRings.** This correction was not made.
   - *The overlap:* L7 plans, "for every finite rank n", the fixed-type potentially semistable deformation rings and the
     away-p semistable/Steinberg/minimally ramified conditions. R08.3 and R08.2 plan the same constructions without a rank
     restriction, but for the roadmap's GL2 sources.
   - *Option X (recommended by one reader):* R08.2/R08.3 own them in every rank and L7 is narrowed to import them.
   - *Option Y:* R08.2/R08.3 stay rank two and L7 owns rank n, building on them. §15's last rule allows this, and the edge
     R08.3 → L7 and the new R08.2 → L7 express it.
   - *Current state:* the proposal's own owner record for away-p types (owner R08.2) and G7's import "from R08.2 in the
     required rank" lean to X, but nothing in the documents settles it. Decide before the LocalGaloisDeformationRings
     blueprint.
2. **Étale Chern regulator.** MotivicEtaleKTheory M.8 and PadicHodgeRegulators D.2 both construct it. Accepted RS-26
   deferred the overlap and RS-08 leaves it. D.2 → M.8 exists, so only D.2 can own it; that needs cross-family coordination.
3. **The `formerly` convention.** RS-08 lists "former or apparent" co-owners, including leads its report rejects. §15
   lists in `owners` only mathematics that appeared more than once. Examples: the Serre–Tate record (formerly R03.1/R03.2),
   and the Chow-correspondence and pure-motive records. Keep them as a record of rejected leads, or drop them? This review
   removed only the one record whose owner was wrong.
4. **Mittag–Leffler lemmas.** RS-16 (accepted) names P7 owner of the complete-local derived Mittag–Leffler algebra; RS-08
   gives the generic module/complex lemmas to R02.1, and P7 imports them. With P7's corrected keeps, the split is "generic
   lemmas in R02.1, complete-local applications in P7". Confirm this reading of RS-16's record.
5. **Smaller scope questions for the blueprint jobs:**
   - GlobalGaloisDeformations R04.5 (unlisted) still says "prove the required dual-Selmer dimension reduction", which R02.6
     owns in rank two.
   - Derived base change of Galois cochains is planned by both D8 and Selmer L3; D7 is the natural owner.
   - M.5 and M.6 contain their children's full text; they could be narrowed to assemblies.
   - M.8 now imports Selmer L4 and so waits on the Iwasawa layers.
6. **Cross-family reconciliation.**
   - RS-05 swaps the R02.1/R02.2 labels, as RS-08's report notes.
   - ModularCurvesPartII R14.3 (RS-06) and Symbols L0 both plan the parabolic/compactly supported cohomology comparison;
     no link joins them.
   - RS-27 has still to settle the Grassmannian owner (R09.1 versus ModularCurves 0G) that L7 uses.
