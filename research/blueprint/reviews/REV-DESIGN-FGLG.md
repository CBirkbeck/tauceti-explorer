# Independent review: FreeGroupsAndLimitGroups (REV-DESIGN-FGLG)

**Verdict: accepted, with corrections applied in place.** Reviewer: Claude (Opus 5.5), session
`claude-ZxsF8d`, 13 October 2026. Job: `REV-DESIGN-FGLG`
([#9489](https://github.com/CBirkbeck/tauceti-explorer/issues/9489)). The design `DESIGN-FGLG` was written
by a different session, `claude-mk47Qn`
([#9461](https://github.com/CBirkbeck/tauceti-explorer/issues/9461),
[#9469](https://github.com/CBirkbeck/tauceti-explorer/pull/9469)).

Files reviewed and corrected:

- the roadmap definition `research/blueprint/roadmaps/FreeGroupsAndLimitGroups.json`;
- the packet `research/blueprint/packets/FreeGroupsAndLimitGroups.json`;
- the reader `research/blueprint/readmes/FreeGroupsAndLimitGroups.md`;
- the suggested file `research/blueprint/suggested/FreeGroupsAndLimitGroups.lean`.

## Counts

The corrected packet has **126 nodes**: 25 definitions, 28 constructions, 72 theorems and 1 comparison. Of
these, 124 come from the design and 2 were added by this review.

- **Review verdicts:** 62 verified, 62 corrected, 2 added, none unverifiable.
- **Size:** 291 API items, 223 unit tests and 58 planets, with at most six per layer.
- **Baseline and links:** 68 baseline declarations (66 from the design plus 2 added), no requests, and 1 gap
  (2 before the review).
- **Status:** all eleven stages are `planned` and none is `closed`. The packet keeps `status: complete`.
- **Checks:** `scripts/check_blueprint.py` with the pinned index reports 0 errors and 0 warnings. A separate
  pass found no node prerequisite that skips the roadmap's layer order and no cycle.

## What was checked

1. **Sources.** Every public source was fetched again, and all recorded SHA-256 hashes match. Each of the 241
   citations was looked up at its locator in the text layer. Every reported mismatch was then checked by hand
   in the source.
   - The designer could not obtain Makanin's papers. They are now read in the English translations served by
     Math-Net.ru:
     - [MAK] Math. USSR-Izv. 25 (1985), 75–88, at pp. 76–88;
     - the new source [MAK82], *Equations in a free group*, Math. USSR-Izv. 21 (1983), 483–546, at
       statement level (Lemma 1.1, Lemma 1.4, Theorem 10.3, §11).
   - A new free source [KMS-ACTIONS] (arXiv:1211.3207v2) was added for Λ-trees.
   - Serre's *Trees*, INFINITE-WORDS (IJAC 2006) and KM06 are still unavailable. Every claim that cites them is
     also supported by a source that was read. KM06 stays behind the recorded gap.
2. **Baseline.** The 66 declarations were read at Mathlib 082e2d3. All exist under the cited name, module and
   kind. Eight `provides` texts were made precise:
   - `BoundedFormula.listEncode`: fixed n, and no Encodable instance on formulas;
   - `reduceCyclically`: defined on every list;
   - `HNNExtension.NormalWord` and `Monoid.PushoutI.NormalWord`: transversals, noncomputable `equiv`, and
     Britton's lemma is a separate theorem;
   - the ping-pong lemma: its hypotheses;
   - `Group.rank`: needs `[Group.FG]`;
   - `Subgroup.rank_le_index_mul_rank`: its instance hypotheses;
   - `FreeGroup.reduce`: computable.

   Two declarations were added:
   - `HNNExtension.ReducedWord.toList_eq_nil_of_mem_of_range` (Britton's lemma), cited by
     FG4/normal-form-theorem;
   - `SimpleGraph.Dart`, for the new compatibility API `SerreGraph.ofSimpleGraph`.

   No citation was removed. A baseline sub-agent proposed citing `FreeGroup.injective_lift_of_ping_pong` for
   FG5/free-group-linear. This was rejected: that form needs four ping-pong sets whose complements are mapped
   inside, which Sanov's cones do not provide, so the cited two-set lemma `Monoid.CoprodI.lift_injective_of_ping_pong`
   is the right one.
3. **Closure, granularity, API, tests and planets** were checked node by node at target level. The design's
   numerical and group-theoretic examples were recomputed by hand. Planets are named from the sources.
4. **Library and atlas.** None of the planned notions exists in Mathlib at the pin, in Tau Ceti f790474, in
   current Tau Ceti or in current TauCetiRoadmap main. A sub-agent sweep over all four found only neighbours:
   - current Tau Ceti now has `FreeGroup.instResiduallyFinite` and the inequality
     `Subgroup.rank_le_one_add_index_mul_rank_sub_one`. The packet now says that FG6 uses the first only in a
     proof sketch, and that FG2 plans just the equality;
   - the Tau Ceti roadmaps AlgebraicTopology (Euler characteristics of CW complexes), BelyiMaps (π₁ of the
     thrice-punctured sphere), FuchsianOrbifolds and ReductiveGroupsPartII (the Ihara amalgam) are neighbours,
     not owners.

   No atlas roadmap plans Bass–Serre theory, Stallings graphs, equations over groups or limit groups. The
   roadmap is in no upstream tier and has no requests, which is correct.
5. **Lean.** `lean-check` was run at the pinned build (Mathlib 082e2d3).
   - The design's file elaborated with 51 `sorry` warnings.
   - The corrected file elaborates with 56, and nothing else.
   - `scripts/check_sorry_data.py` passes.

## Corrections of mathematics

1. **FG4/induced-splitting.** The example and the test `induced_cyclic` were wrong. The subgroup ⟨a b⟩ of
   ⟨a⟩ ∗ ⟨b⟩ translates its axis by two edges, so its induced graph of groups is a two-vertex cycle, not a
   one-vertex loop.
2. **FG5/zariski-topology.** The topology is T₁ only when ι : G → H is onto, for instance H = G.
   - In general it fails. With G = 1 and H = F(a, b), the closure of {a} is H.
   - ALG Theorem 3 states T₁ for every G-group. This is recorded as source issue **E2**.
   - The API item `zariski_t1` and two tests were corrected.
   - The test `zariski_not_algebraic_abelian` was false: over ℤ² in one variable the union of the axes is not
     closed. It was replaced by the closed, non-algebraic set {0, 1} ⊂ ℤ.
3. **FG6/regular-quadratic.** IFT Definition 6 gives an "equivalent" κ-formulation that misses
   [x₁,y₁][x₂,y₂] = 1, which has κ = 4 but only commutative solutions. This is source issue **E3**, and the
   statement and the API item `isRegular_iff` were corrected.
   - In FG6/quadratic-equation the test `general_position_example` was false: (a, b, b, a) is commutative.
     It was replaced by a non-example and by a checked genus-three solution in general position.
   - FG11/generic-families now excludes this equation, as IFT does on p. 99, and its example uses
     [x, y] = [a, b] instead of the old non-general-position solution.
4. **FG11/lift-characterisation (3)** was false. It claimed that a G-discriminated coordinate group lets every
   compatible equation lift, but the packet's own example S = [x, y] contradicts this. It now states that
   discrimination does not suffice and that lifts come from generic families (IFT Definition 44).
5. **FG11/ift-regular-quadratic** claimed an extension to finitely generated fully residually free coefficient
   groups, citing IFT Corollary 12. That corollary is a discrimination statement, so the claim was removed. The
   roadmap's FG11 description was corrected to match.
6. **FG8/limit-group-equivalences (3).** A limit group has the universal theory of *some* free group (LIMITS
   Theorem 1.1). Requiring a nonabelian one fails for ℤⁿ.
7. **FG2/howson-intersection.** The product graph computes H ∩ K only at the pair of base vertices.
8. **FG2/finite-index-schreier.** The formula is now stated in ℤ. The old hypothesis "for α empty both sides
   vanish" was wrong: both sides are −1.
9. **FG1/conjugacy-procedure.** The search range is now stated so that it includes the empty splitting, as
   the degenerate test needs.
10. **FG1/maximal-cyclic-malnormal.** The proof sketch only gave |m| = |n|. The case n = −m is now excluded,
    since a nontrivial element of a free group is not conjugate to its inverse.
11. **FG4/collapse-and-refinement.** The unsupported claim that every equivariant map factors through a
    collapse followed by folds was replaced by GL-JSJ Remark 2.3, with its finite-generation hypothesis.
12. **FG4/one-edge-compatibility.** The edge-to-`t` convention is now fixed (e ↦ t⁻¹) against Mathlib's
    relation t a t⁻¹ = φ a.
13. **FG10 examples of JSJ decompositions** (jsj-existence, effective-jsj). The group
    F(a,b) ∗_{a=[x,y]⁻¹} F(x,y) is free of rank 3, so the stated decomposition holds only relative to
    ℋ = {F(a,b)}.
    - FG10/effective-grushko is now stated for one subgroup H, as in JSJ Theorem 10.1. The family version
      became a coverage item.
    - The modular group in the Makanin–Razborov example is now placed at a non-root vertex, as the
      definition requires.
    - The effective-components example now uses a finite system.
14. **FG7.** Corrections across the layer:
    - elementary-transformations: ET4 is "removal of a lonely base", and D4–D6 are "kernel", "entire
      transformation" and "identifying closed constant sections";
    - transformations-correct: backward preservation of graphical solutions is stated only for ET1–ET3, as
      in the source;
    - solver-computable: the unsupported claim that Makanin's bound is not primitive recursive was removed;
    - reduction-correct: the direction of the induced map was corrected;
    - solver-procedure, positive-normal-form, merzljakov-theorem and the deciders: Makanin's lemmas and
      theorems are now cited at their pages.
15. **FG6.** Torsion-freeness of closed surface groups moved from bounded-surface-free to surface-splittings,
    which removes a hidden dependency cycle. The amalgam example in regular-quadratic-coordinate-group was
    corrected to a = p.
16. **Smaller fixes.** The FG9 test `undefined_product` was false, since a^t ∗ (a⁻¹)^{t′} is defined. The
    `basic-automorphisms` count now includes K = m − 1 for n = 0. Several test explanations were corrected,
    as was the wording that carried scope-hedging words.

## Nodes and prerequisites added

- **FG1/csa-group** (definition): malnormal subgroups, CSA groups and commutation transitivity. FG1, FG5, FG7
  and FG8 use these notions, but the packet defined them nowhere. It is now cited by:
  - FG1/maximal-cyclic-malnormal;
  - FG5/domain-examples;
  - FG7/positive-normal-form;
  - FG8/frf-properties, centralizer-extension and centralizer-extension-discriminated.
- **FG9/lambda-tree** (definition, planet "Λ-trees"): Λ-metric spaces, Λ-trees and free actions. The
  length-function correspondence and the layer description use them. Its source is KMS-ACTIONS §§4.2–4.4.
- **Prerequisites** added where proof sketches used results not listed:
  - FG6/finite-index-surface ← FG6/quadratic-standard-form;
  - FG8/frf-properties ← FG8/embedding-theorems;
  - FG6/surface-splittings ← FG4/elliptic-hyperbolic-dichotomy and FG4/bass-serre-tree;
  - FG1/maximal-cyclic-malnormal ← FG1/commuting-elements;
  - FG4/normal-form-theorem ← Britton's lemma.

## Locators

25 locators were corrected and 7 sources added at nodes. The main ones:

- **KM02:** §11 is on pp. 31–33, and Lemma 6.1 is on p. 12.
- **FOLD:**
  - Convention 2.1 (FOLD has no Definition 2.1);
  - Proposition 4.15 for subgroup preservation under folding (Lemma 4.16 is different);
  - Theorem 5.8 is on p. 22.
- **GL-JSJ:** the Dehn twists are on pp. 97 and 46, not pp. 15–18.
- **SELA-I:** modular groups are Definition 5.2 on p. 62, and Proposition 5.6 is on p. 67.
- **IFT:**
  - "Definition 9 of VAR-II as recalled there" does not exist;
  - Lemma 14(4) on p. 23 is the solution-transfer statement;
  - Propositions 2–3 on pp. 65–67 for lifts.
- **LIFT:** the basic sequence is on pp. 230–232.
- **VAR-II:** "Lemma 3 (Bulitko)" does not exist; that lemma is about residually free sequences. It was
  replaced by Makanin's Lemma 1.4.
- **JSJ:** the transformations run to p. 143.
- **Matches reworded:** several match texts that described the source inaccurately (SUBGROUPS §2.1, KM02 §8,
  VAR-I Lemma 5, LENGTH §2.3).

## Source issues

- **E1** (IFT, proof of Corollary 9 cites "Proposition 4"): confirmed. Proposition 4 is in §7.2, p. 100, and
  concerns quadratic equations.
- **E2** (new, ALG Theorem 3, p. 32): the Zariski topology over a G-group is not T₁ in general.
- **E3** (new, IFT Definition 6 and the remark after it, p. 9): [x₁,y₁][x₂,y₂] = 1 is missing from the
  κ-formulation of regularity. IFT itself treats this equation separately on p. 99.

## Gaps and coverage

- **Closed:** the gap on Makanin's minimal-solution bound. The bound is now sourced to MAK82 Lemma 1.4,
  Theorem 10.3 and §11 (Theorem 11.5). MAK §6 corrects that proof and MAK §5 extends it to alphabet
  constraints. The lemma-level refinement of Makanin's process is the FG7 `remaining` item.
- **Kept:** the gap on equations over a represented limit group (KM06 Theorem 32 and the elimination process
  over NTQ groups). Its target node is not used downstream.
- **New `remaining` items:**
  - FG10: effective Grushko relative to a finite family of subgroups;
  - FG11: LIFT's stronger notion of effective lift, which also decides whether a lift exists. The packet's
    `liftSolve` is a search on the promised class.

## Questions for the orchestrator

1. **Area.** The roadmap's area is `grouptheory`. That area's description in `data/galaxies.json` ("finite
   simple groups, profinite and pro-p groups") does not yet cover combinatorial and geometric group theory.
   The maintainer may wish to widen it.
2. **Splitting FG10.** The specification asks for FG10 to be split into dependency-checked sub-packages
   before any refinement. The packet records this as `remaining`. A follow-up job for it, and for the
   refinement of Makanin's process, would be the natural next steps.
3. **Sources only the maintainer can supply.** Serre's *Trees* and KM06 are the only cited sources no
   worker can read. Clearing *Trees* in the reference library would let a future job verify the 15 TREES
   locators, which all have independent support.
