# REV-PAPER-MARTIN-25 — independent review of the Martin extraction

**Verdict: accept, with one correction made in place.** Reviewer: Claude Code, session `cc-fb70e5`, 21 September 2026. This reviewer did no part of the extraction.

**Paper.** Daniel E. Martin, *A new proof of Chen's theorem for Markoff graphs*, Inventiones mathematicae 241 (2025), 623–626, DOI 10.1007/s00222-025-01346-9.

**Which version was read.** The publisher PDF could not be retrieved here: the Springer link returned an HTML paywall page, not the file whose SHA-256 the extraction records. The statements were therefore checked against the arXiv source of 2502.15960, the only arXiv version, dated 21 February 2025 (SHA-256 of the e-print `2efa0416722635545863a9db217cfe7dba02753c1faaad16aadf318c0620974c`). Its conjecture, Bourgain–Gamburd–Sarnak (BGS) theorem, Chen theorem and §2 proof correspond to the published Conjecture 1.1, Theorems 1.2–1.4 and (2.1)–(2.5) that the extraction cites. The published version evidently splits the BGS theorem into Theorems 1.2 and 1.3. Item 43 states the exceptional-prime bound as "at most X^ε primes below X". The arXiv text says only "natural density 1", but X^ε is what BGS prove, and it presumably follows the published wording.

**Checks run.**

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-MARTIN-25.result.json` reports `ok` on the corrected file.
- Library claims were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- The cited roadmaps were checked against `data/restructure/` and `data/roadmap-retirements.json`. The only mention is RS-29, which adds a link into ArithmeticDynamics DY.5 and changes nothing here.

## 1. Items

All 54 items match the source. The four-page proof is fully itemised: the extended Penner weights (2.1), the sum-to-one identity (2.2), the complementary weights on edges in both the nonzero and the zero-coordinate cases (2.3)–(2.4), fixed points, the balance identity on an invariant set (2.5), and the final cancellation 3/2·|C| = |C|. So are its inputs: Markoff's tree, Baragar's conjecture, the BGS theorems, the effective bound of Eddy–Fuchs–Litman–Martin–Tripeny, and the conventions for the BGS group Γ.

The extraction's correction of the printed scope was re-derived independently:

- **p = 3.** The equation reduces to x₁² + x₂² + x₃² = 0. Squares are 0 or 1, so the nonzero solutions are exactly the eight triples in {±1}³. Each Vieta move x_i ↦ 3x_jx_k − x_i = −x_i flips one sign, so the graph is the cube: one component of size 8, not divisible by 3. The printed "for every prime" is false at p = 3.
- **p = 2.** The nonzero solutions are (1,1,1), (0,1,1), (1,0,1) and (1,1,0). The Vieta moves connect them, so there is one component of size 4, divisible by 2.
- **The proof needs p > 3,** since it divides by 2 and 3. The corrected statement "p ≠ 3" (items 31–34) is therefore right.

## 2. Statuses

All six library citations were confirmed at the pinned commit:

- `ZMod`, `ZMod.fintype` and `ZMod.card`;
- `SimpleGraph.Reachable`, `SimpleGraph.ConnectedComponent` and `ConnectedComponent.supp`;
- `SimpleGraph.reachable_fromEdgeSet_fromRel_eq_reflTransGen`, which the extraction uses to pass from a loop-carrying move relation to a simple graph;
- `Fintype.sum_equiv`, the additive form of `Fintype.prod_equiv` (Algebra/BigOperators/Group/Finset/Defs.lean:742);
- `ZMod.natCast_eq_zero_iff`.

No planned items were claimed. A search of the whole catalogue for Markoff, Bourgain–Gamburd and strong approximation finds only unrelated group-theoretic strong approximation, so the 48 missing statuses stand.

## 3. Correction made in place

- **Route 2's `area`** changed from `diophantine` to `arithmeticgeometry`. PROTOCOL.md §16 and the design template require a galaxy id of `data/galaxies.json`. `diophantine` is ArithmeticDynamics' atlas group, not a galaxy. `arithmeticgeometry` is the galaxy whose MSC classes include 11D (the paper is 11D25) and 37P (arithmetic dynamics). The paper checker accepts any non-empty string here, so it cannot catch this.

## 4. Routes

Both routes are accepted; the reasons are in `PAPER-MARTIN-25.review.json`.

1. **Source of ClassicalArithmeticCompletion CA.4.** It covers the integer Markoff equation, Vieta involutions, descent, the Markoff tree and the reduction map.
2. **Part II of ArithmeticDynamics.** It covers Markoff actions modulo p, Penner weights, Chen divisibility, the BGS inputs and eventual connectivity. DY.0–DY.6 treat iterated, mostly polarized, morphisms, and nothing in the atlas treats affine group actions on the Markoff surface, so a Part II in that direction is justified. The brief correctly keeps the BGS group Γ, which includes coordinate permutations, distinct from the Vieta-only graph, and relates the two through the root orbit.
