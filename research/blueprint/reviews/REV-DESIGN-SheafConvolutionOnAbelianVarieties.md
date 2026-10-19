# REV-DESIGN-SheafConvolutionOnAbelianVarieties

Independent review of DESIGN-SheafConvolutionOnAbelianVarieties (Codex, session `codex-00yeZm`, PR #10441), issue #3611. Reviewer: Claude (Opus 5.5), session `claude-DGRXf2`, 19 October 2026. The reviewer did none of the design work.

**Verdict: accepted, with corrections made in place.** The packet, roadmap definition, reader and suggested Lean file were all edited. The plan is mathematically sound at target level, and its two proof gaps (G1, G3) are recorded honestly. The corrections are bookkeeping and ownership fixes, a test-kind sweep, one added node and four new source findings. None of them sends the plan back.

## Counts

| | Design | After review |
| --- | --- | --- |
| Nodes | 51 | 52 (one added: `SC.7/jordan-finite-linear-groups`) |
| Definitions / constructions / theorems / comparisons | 8 / 9 / 33 / 1 | 8 / 9 / 34 / 1 |
| API items | 69 | 69 |
| Unit tests | 52 | 52 (all kinds corrected) |
| Planets | 44 | 45 |
| Baseline declarations | 10 | 13 |
| Requests | 17 | 19 |
| Gaps | 2 | 2 |
| Source findings | 20 | 24 (E21–E24 added; E1–E20 confirmed) |

Review verdicts by node: 19 verified, 32 corrected, 1 added.

## Sources and method

I downloaded all nine sources again into scratch: LS (arXiv:2004.09046v5) and its ancillary `eulerian.py`, KW (1111.4947v6), K1 (1604.02389v3), K2 (1807.01929v2), W (1111.6095v1), EHS (author PDF), CDK (alg-geom/9402009v1) and Milne's *Jacobian Varieties* (2021 notes). All nine SHA-256 fingerprints match the packet. I read LS §§2–4 (pp. 14–38) in full and Appendices B–C at every cited lemma (pp. 93–118), and I read the ancillary program in full. In the other sources I checked every cited result at its locator. I added Breuillard's exposition of Jordan's theorem (author notes, SHA-256 `262d3471…`) for the new node. Page images were viewed where the text layer was ambiguous (LS p. 36).

Checks run:

- `python3 scripts/check_blueprint.py research/blueprint/packets/SheafConvolutionOnAbelianVarieties.json --index <pinned declaration index>`: 0 errors, 0 warnings, both before and after the review.
- `source_issues.check_issues` and `check_errata.versions_checked` on the packet: no problems.
- `scripts/check_sorry_data.py` on the suggested file: no problems.
- `lean-check research/blueprint/suggested/SheafConvolutionOnAbelianVarieties.lean`: exit 0, at Mathlib 082e2d3 and Tau Ceti f790474. The only warnings are 23 placeholder-proof warnings: the original 22, plus Jordan's theorem.
- In a separate scratch file, every `example` of the suggested file was evaluated with `native_decide` and is true. So are the histogram 1,23,1 at k=5 (row 8855, 35420, 8855), the Pell invariant for j<6, and exactness of the division by 6 for 1≤j<6.
- Every comparison listed in `SC.6/eulerian-comparisons` was checked in exact integer arithmetic, with 120-digit square roots, for 5≤n≤260: all hold. Lemma C.4's inequality also holds at the omitted endpoint r=n−1. The "for all n" claims fail at the small n stated in E15.
- A Sonnet agent cross-checked, against the saved upstream READMEs and the local TauCetiRoadmap checkout, every claim the rewritten requests make about what a supplier already states or lacks. It found no contradiction. It flagged five imprecise citations, all corrected:
  - R2: the upstream recollement identifies the quotient by objects supported on a closed subset, but has no general Serre-quotient comparison.
  - R5: stabilizer finiteness comes from K(L) finite, §§A2.4 and A3.6, not from §A3.10. §A1.8 states Weil extension only over a Dedekind base.
  - R6: the torsor property of an isogeny is already upstream, §§A3.1 and A3.3.
  - R3: the decomposition theorem gives semisimple local systems, hence reductive monodromy.
  - R10: the isomorphism theorem for pinned groups is in Layer 9, not Layer 8.

## Item-by-item

**1. Sources.** Every node was checked at its locator. The statements keep the sources' hypotheses. The few strengthenings are deliberate and recorded: Lemma 4.8 is restricted to characters of order prime to p (E6), and the hypothesis n>2 is carried where Lemma 3.9 is used (E2, E18). There were no `excerpt` fields. The `match` fields were in the designer's own words and not copies of the statements. Corrections:

- K2: the clean characteristic cycle is Definition 2.2.1, p. 13, in arXiv v2. LS (p. 22) and the packet cited Definition 2.1.1. Fixed in `SC.4/characteristic-cycle` and in the K2 source's read sections.
- Page ranges: `SC.4/clean-cycle-ring` (K2 pp. 8–9), `SC.4/almost-simple` (LS pp. 21–23), `SC.4/minuscule-alternatives` (Lemma 3.10 p. 23, Lemma 3.12 p. 24), `SC.4/microlocal-factorization` (pages added). `SC.0/generic-vanishing` now cites KW Lemma 11.2(b)–(c): (b) gives the union of translates for semisimple sheaves, and (c) gives torsion translates for geometric origin.
- Second-source citations that sat inside one `locator` string are split into their own source entries in twelve nodes. Examples: LS+KW in SC.0–SC.1, LS+EHS in SC.2, K2+LS and K1+LS in SC.4, JV+LS and LS+CDK in SC.9. The nonstandard `additionalSources` field of `SC.0/derived-convolution` is merged into `sources`.
- Citations added where the source actually uses the result: LS's uses of KW Proposition 10.1 in the proofs of Lemmas 3.11 and 4.1, KW's microlocal index formula (proof of Proposition 10.1, p. 22) in `SC.4/characteristic-cycle`, and the K2 argument behind `SC.4/almost-simple`.

**2. Baseline.** All ten declarations exist at the pins and provide what the packet says. I read them in the lean-check build's Mathlib 082e2d3 and Tau Ceti f790474 sources. Several recorded kinds were wrong: `Finset.card_powersetCard` is a theorem; `TauCeti.AlgebraicGeometry.AbelianVariety` is a structure; the two `SerreClassLocalization.preserves…` declarations are lemmas. These are fixed. Three declarations were added for Jordan's theorem: `Matrix.GeneralLinearGroup` (Defs.lean:43), `Subgroup.index` (Index.lean:57) and `Subgroup.Normal` (Subgroup/Defs.lean:604). No near misses were found. The pinned Tau Ceti `MinusculeWeightTable` builds Chevalley generators from a given minuscule weight table but does not classify minuscule weights, so R18 is still needed.

**3. Closure and suppliers.** This is the main correction. Several suppliers are no longer atlas-plannable: EtaleDualityAndPerverseSheaves (TauCetiRoadmap PR #1040), AbelianSchemesAndArithmeticModuli (#849), ComplexComparisonPartII (#848) and PadicHodgeTheory (#1062) are TauCetiRoadmap pull requests, and SchemeAndStackFoundations is merged (#779). Several requests were also addressed to Tau Ceti roadmaps (ReductiveGroups, LieHighestWeight, SpinRepresentations, JacobianChallenge), which are never planned here. I fetched the current heads of the four pull requests and the merged SF README, and read the local TauCetiRoadmap checkout. Then:

- R1, R2, R5, R6, R7, R8 and R9 now say what the upstream document already states, cited as it stands. Whatever it lacks is routed to a Part II or extension of that direction, not yet designed, at the same supplier stage id (the precedent of DESIGN-BCGP18/25). Part (d) of the old R1, the exact tensor pushforward to a coordinate, concerns convolution rather than the six operations; it moved into `SC.7/independent-coordinate-factors`, where it follows from proper base change and the projection formula (LS Corollary 4.3).
- R3 (EDC.7): every object from SC.3 to SC.9 is of geometric origin, and for those the decomposition theorem over ℂ/ℚ̄_ℓ already exists as `EtaleDualityAndPerverseSheaves:EDC.7/decomposition-theorem-complex` (upstream §5.10). `SC.2/arithmetic-geometric-categories`, `SC.7/relative-generic-vanishing` and `SC.7/generic-big-monodromy` now cite that node. R3 asks only for Kashiwara's conjecture, which LS Lemma 2.7 needs for arbitrary geometrically semisimple objects. The node's hypotheses record that the geometric-origin restriction suffices for every downstream use.
- R10–R14 and R17 now cite the Tau Ceti layers as they stand: ReductiveGroups Layers 6–8, LieHighestWeight Layers 4, 6 and 8 (Layer 8 has the 27- and 56-dimensional E₆ and E₇ representations), SpinRepresentations Layer 4, and JacobianChallenge Layer F. What these layers lack moved elsewhere:
  - The classification of minuscule weights is requested from `LieHighestWeightPartII:N2` (new R18).
  - The relative pointed Abel–Jacobi property over a parameter space is requested from `JacobianChallengePartII:JC2` (new R19).
  - Jordan's theorem on finite linear groups is owned by no roadmap, and no packet mentions it. It is planned here as `SC.7/jordan-finite-linear-groups` (addedBy this review), together with the reduction to subgroups that are finite modulo scalars. That reduction is a short argument through (F^×B)∩SL(V), and LS uses it in Lemma 4.5.
  - The exterior-power normalizer (Lemma 3.14) and the unbounded Cartan powers (Lemma 4.5) are now proof steps in `SC.5/hodge-wedge-constraint` and `SC.7/detecting-representations`.
- **Overlap.** `SpringerResolutionAndCharacteristicCycles:D/characteristic-cycle` (DESIGN under review, #3617) plans the characteristic cycle of a coherent D-module. `SC.4/characteristic-cycle` now imports it, and R8 is narrowed to regular holonomic Riemann–Hilbert, the index theorem and its compatibilities.
- Every request's consumers list the supplier stage. The coverage `remaining` lists are regenerated from the open requests and gaps, and the roadmap's stage `requires` are recomputed from node prerequisites (SC.4 gains `LieHighestWeightPartII:N2` and `SpringerResolutionAndCharacteristicCycles:D`; SC.9 gains `JacobianChallengePartII:JC2`). The roadmap prerequisites gain the three roadmaps.
- Closure of the proofs: the corrected microlocal degree argument (E5) is right; my own check of the step is recorded under E5. The surface Torelli route of `SC.9/surface-period-finiteness` is sound. G3 is an honest record of the unproved trace compatibility in LS's period argument. LS say Proposition 4.11 is not used elsewhere in the paper.

**4. Granularity.** Target level is right for this roadmap. Each node is one target or one key input. No node hides a non-routine argument without a named source or request; the one exception was Jordan's theorem, which is now a node.

**5. API.** The outlines of the 17 definitions and constructions are adequate for target level. They cover characterisation, structure, compatibility and functoriality, and for the quotient the universal property. Nothing was added.

**6. Unit tests, suggested file, planets.** All 52 tests had kind `example`, which is not among PROTOCOL §12's kinds. Each now has one of the five: computation, degenerate, characterisation or non-example (compatibility is not used). I checked every test statement for correctness. All are correct and discriminating; for example, `negligible_no_cancellation`, `group_same_summand` and `period_no_ns_substitution` catch the natural wrong definitions. The suggested file has the compact 2026-10-12 shape: three real-bodied light definitions over pinned carriers, theorem signatures and examples. Jordan's theorem is added because it is statable at the pins. Planets are within six per layer; SC.7 now has six.

**6a. Source findings.** All twenty were checked at their locators; every one is **confirmed**, and the verdicts are in the packet. Three `affects` fields were corrected:

- E4 becomes "nothing": every use in LS concerns sheaves of geometric origin.
- E8 becomes "the proof": the counterexample lies outside §B.2's standing n≥5, and the lemma's root bounds follow from the non-strict form.
- E15 becomes "nothing": every use has n≥5, where all the comparisons hold.

Four findings were added, each searched against the arXiv version history and the existing findings:

| Id | Kind | Locator | Finding |
| --- | --- | --- | --- |
| E21 | misprint | App. B–C, pp. 101–117 | The appendices cite the checks as bound-A3a…bound-A5f and bound-B; none of these labels occurs in the v5 ancillary file, whose checks carry other names. |
| E22 | misprint | Thm 3.5, Rem 3.6, p. 21 | The exception n=2, d=28 is vacuous under the theorem's own hypothesis n>2. |
| E23 | misprint | Lemma 4.9, p. 36 | ℓ^(2kn) is the number of characters of order dividing ℓ^k, not of the ℓ^(2k)-torsion ones. |
| E24 | misprint | pp. 26, 34 | The citations "Lemma 2.9(2)" (Lemma 2.9 has no parts) and "Lemma 4.3" (it is Corollary 4.3). |

**7. Library audit.** Nothing the pinned libraries contain is planned again. `data/library-coverage.json` has no entry for this roadmap. Mathlib's `GroupTheory/GroupAction/Jordan.lean` is Jordan's theorem on primitive permutation groups, a different result.

**8. New roadmap.** The layer order SC.0→SC.9 is acyclic and correct. Scope is honest: the final Diophantine argument belongs to MordellLawrenceVenkateshPartII, and the n=2 monodromy theorem is explicitly not claimed. The area `algebraicgeometry` is appropriate.

**9. Checker.** 0 errors and 0 warnings throughout.

**10. Reader.** The reader is regenerated from the corrected packet: every node section, request, gap and finding, with the review verdicts. The head, conventions, worked checks and crosswalk are kept and updated. Text is escaped for `src/markdown.js`: `*`, `_`, `$`, backslash and backtick are escaped outside code spans and links, and `[`/`]` are left alone, because `\[` opens display mathematics in that renderer. In the design's reader many `K*L`, `i_*` and `Dᵇ_c` spans would have rendered as italics. Unit tests now show their kinds. A lint confirmed that every node statement, proof step, request and correction of the packet appears in the reader.

## Questions for the orchestrator

1. **Part II design jobs.** The rewritten requests point at directions that are not yet designed:
   - EtaleDualityAndPerverseSheavesPartII: character sheaves and algebraically closed extension (R1), the Serre-quotient heart comparison (R2), and Kashiwara's conjecture (R3).
   - An extension of AbelianSchemesAndArithmeticModuli beyond #849 and the accepted Part II: the Albanese of an ample divisor and stabilizer quotients (R5), and the deck-character decomposition of [m] (R6).
   - An extension of SchemeAndStackFoundations: Chern–Gauss–Bonnet and conormal cycles in T*A (R7).
   - An extension of ComplexComparisonPartII: regular holonomic Riemann–Hilbert and the index theorem (R8).
   - PadicHodgeTheoryPartII: the Hodge–Tate cocharacter of a Zariski closure (R9).

   These are recorded under `restructure` and `upstreamNotes` in the packet.
2. **D-module characteristic cycles** now have one planned owner, `SpringerResolutionAndCharacteristicCycles:D`, which is still under review (#3617). If that review renames or moves the node, `SC.4/characteristic-cycle` must be retargeted. A more foundational D-module roadmap could own both it and R8.
3. **R9 consumer.** The designer's note stands: the Lawrence–Venkatesh Part II consumer of the Hodge–Tate cocharacter should point at the same owner as R9.
4. **Kashiwara's conjecture.** If the maintainer prefers not to open an EDC Part II for it, `SC.2/arithmetic-geometric-categories` could be restricted to objects of geometric origin, which is enough for every downstream target, and R3 dropped. The node's hypotheses record this option.
