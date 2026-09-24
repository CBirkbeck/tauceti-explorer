# Handoff: BP-ArithmeticStatistics

**Job** `BP-ArithmeticStatistics` (issue #1038) · Claude Code, session `cc-2aeb03` · 24 September 2026.
Baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. Follows the accepted restructuring RS-07.

## Deliverables

- **Packet:** `research/blueprint/packets/ArithmeticStatistics.json`, status `partial`.
  - Scope ST.0–ST.5, `part` null.
  - 409 nodes (157 theorems, 149 lemmas, 84 definitions, 15 constructions, 2 comparisons, 2 applications), with 778 API items and 364 unit tests.
  - 36 planets, six per stage.
  - 261 baseline declarations, each statement read at its pinned line.
  - 51 sources, 75 source issues, 52 requests and 48 gaps.
  - `python3 scripts/check_blueprint.py` against the pinned declaration index reports 0 errors and 0 warnings.
- **Roadmap document:** `research/blueprint/readmes/ArithmeticStatistics.md`, about 47,000 words. It has an introduction
  (purpose, scope, conventions, boundaries, sources) and one section per stage, and it agrees with the packet.
- **Suggested Lean file:** `research/blueprint/suggested/ArithmeticStatistics.lean`. It imports only Mathlib; where a Tau Ceti module would be imported, a comment says so. It was compiled against Mathlib 082e2d3 with `lake env lean`, and elaborates with 1125 warnings, all `declaration uses sorry`, and no errors. Each object is declared once, by its owning stage, and every one of the packet's API items and unit tests occurs in it under the packet's name. Two overlaps between stages remain as separate packet names, to be consolidated by the review: ST.0's congruence weights against ST.2's congruence conditions, and ST.5's family densities against ST.0's upper and lower densities.

## What is decomposed

- **ST.0.** Families with their equivalence relations, height orderings, weights and local conditions; densities and their
  comparisons; bounded-height finiteness. Also:
  - the binary-quartic invariants I and J, their weights, the discriminant, the eligible pairs and the height, with
    27Δ = 4I³ − J² and 27·H_E = 4·H′;
  - Burungale–Tian's squareclass-height family of quadratic twists, the positive-squarefree subfamily and the density
    comparison;
  - number fields ordered by discriminant.

  ST.0 has no gaps.
- **ST.1.**
  - The parametrization of 2-Selmer elements by locally soluble binary quartics, with stabilizers and the comparison to the
    cohomological Selmer group, as the Tau Ceti EllipticCurves layers 6–7 interface.
  - The embedding into pairs of ternary quadratic forms.
  - The Delone–Faddeev correspondence and Bhargava's quartic parametrization, with maximality criteria and
    Davenport–Heilbronn sets.
  - The quintic parametrization at statement level.
- **ST.2.**
  - The geometric sieve and local densities.
  - For binary quartic forms: fundamental domains, averaging, cutting off the cusp, reducible forms, the count by height,
    and the uniformity estimate for infinitely many congruence conditions.
  - For binary cubic forms: Davenport's count, the index-p switching and the Bhargava–Shankar–Tsimerman counts.
- **ST.3.**
  - Davenport–Heilbronn, the count of cubic fields and the mean of the 3-torsion of quadratic class groups, by the
    Bhargava–Shankar–Tsimerman route.
  - The classical binary quadratic and cubic counts.
  - The quartic and quintic counts, the 2-torsion means and Fouvry–Klüners, stated with their sources.
  - Cohen–Lenstra (moment form) and Malle as definitions no theorem assumes, and Klüners' counterexample.
- **ST.4.** Bhargava–Shankar §3 in full:
  - local solubility and the change of measure;
  - local masses and the Tamagawa number of PGL₂;
  - the average 3, with every local mass required positive (a missing hypothesis of the source);
  - the average-rank bound 3/2.
- **ST.5.**
  - The 3-, 4- and 5-Selmer averages, the Poonen–Rains and BKLPR models, and the Cohen–Lenstra measure with its moment
    theory.
  - Local statistics and function-field results, including EVW as a stated input.
  - Burungale–Tian's two inputs:
    - **Smith's 2^∞ theorem** is a stated input. A gap names its owner, ArithmeticStatisticsPartIISmithMethod, which imports
      ST.5, so there is no request and no cycle.
    - **The BKLOS 3^∞ corank consequence** is carried in full. Corank, parity and CM inputs are requested from
      SelmerIwasawaCohomology and ComplexMultiplicationAndExplicitReciprocity.
  - The step from Smith's law to Burungale–Tian's Theorem 3.3 is proved here, with Assumption 1.1, the signed-integer to
    squarefree conversion and 2-parity explicit.

## What remains

The coverage `remaining` lists and the gaps are precise. The main items:

- **ST.3:** proofs of the quartic and quintic counts, the class-group moment theorems and the second-order terms.
- **ST.2:** Bhargava's 2005 Proposition 23 and the O(X^{1/4}) bound behind the quartic counts.
- **ST.5:** the orbit parametrizations and counts for the 3-, 4- and 5-Selmer averages; Kane's estimates; BKLOS §§3–8; the
  Cassels–Tate adjointness; Dokchitser–Dokchitser's local lemmas; Rubin's CM lemmas (not public); EVW homological stability;
  de Jong's bound.
- **Placeholder prerequisites:** 40 bare stage ids remain, mostly in ST.5, where the supplying node does not exist yet. Each
  is named in a gap.
- **Other accepted paper routes.** The source routes of papers accepted after this job was queued are not yet in its
  instructions: Wood 2019, Bhargava–Gross–Wang 2017, Bhargava–Shankar–Wang 2022 and 2025, Lemke Oliver–Wang–Wood 2025,
  Koymans–Milovic, Koymans–Pagano, EVW 2016, Browning–Le Boudec–Sawin, Lipnowski–Tsimerman, Shende–Tsimerman, Castella et
  al., Skinner and Skorobogatov–Sofos. A later queue will add them.

## Requests made to other roadmaps

The packet's `requests` list records all 52, each with a precise need and its consumers:

- **GeometryOfNumbersAndQuadraticArithmetic:** GN.0, GN.2, GN.3, and GN.4 (Davenport's lemma).
- **AnalyticNumberTheory:** AN.5 (the divisor bound) and AN.8 (the p-adic orbit volume).
- **SelmerIwasawaCohomology** L1, L2 and L4; **ArithmeticGaloisDuality** R02.4.
- **ComplexMultiplicationAndExplicitReciprocity** CM.1 and CM.3.
- **AbelianSchemesAndArithmeticModuli** A2, A3 and A6.
- **InverseGaloisAndArithmeticFundamentalGroups** IG.0, IG.1, IG.2, IG.4 and IG.5.
- **FunctionFieldArithmetic** FA.4, **SchemeAndStackFoundations** SF.2, **EtaleDualityAndPerverseSheaves** EDC.2,
  **DeligneWeightsAndPurity** DWP.7, **SieveMethodsAndPrimePatterns** SV.2 and **DiophantineApproximationAndTranscendence**
  DT.4.
- **Tau Ceti roadmap layers:** EllipticCurves (13 requests across layers 1 and 4–8), NumberFieldArithmetic, PolynomialGaloisGroups,
  ClassFieldTheory, GlobalQuadraticForms, GlobalNumberFields, LocalFieldsRamification, ModularForms, Multiquadratic and
  JacobianChallenge.

## Restructure proposals

These are recorded in the packet's `restructure`:

- drop the atlas edge GN.1 → ST.0, which no ST.0 node uses;
- rescope the SV.2 → ST.2 edge, since no step of the sources uses a large sieve;
- split ST.2 into three sub-layers: the geometric sieve, binary quartic forms and binary cubic forms;
- split ST.5 into four strands: random groups and matrix models, Selmer statistics of elliptic curves, local statistics and
  abelian varieties over finite fields, and function-field analogues.

## Sources

- **Read:** all public, with URLs and hashes in the packet. The main ones are Bhargava–Shankar (arXiv:1006.1002v3),
  Bhargava–Shankar–Tsimerman (arXiv:1005.0672) and Burungale–Tian (arXiv:2506.03465v2), with Bhargava's Higher Composition
  Laws and density papers where public.
- **Not public, and used only through public accounts:** Davenport–Heilbronn 1971, Cohen–Lenstra (LNM 1068), Cremona's and
  Birch–Swinnerton-Dyer's descent, Rubin's CM lemmas and Nesterenko-type results.
