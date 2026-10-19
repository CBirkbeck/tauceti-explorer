# Independent review — Hochschild, cyclotomic and refined trace methods (full-scope continuation)

**Verdict: accepted.** The continuation packet is a correct complete target-level pass. Its twelve
new targets (eleven in RT.2 for Cartier modules, the cyclotomic t-structure, TR detection and graded
cyclotomic spectra, and one in RT.6 for the uncompleted graded trace) state what Antieau–Nikolaus
and Antieau–Mathew–Morrow–Nikolaus prove, with their hypotheses, and close the two consuming gaps
that the accepted RT.1 part had left for RT.3b. All twelve were corrected in place: prerequisites,
one unit test, scope, API items and locators. None needed to be sent back. The four amendments to
imported targets are right. The 238 imported targets keep the verdicts of their accepted part
reviews. For them, this review checked reader parity field by field, the resolution of every
prerequisite against the current packets, and the amendments.

Reviewer: Claude (Opus 5.5), session `claude-Hpbiea`; job `REV-RefinedTraceMethods`; issue #10798;
2026-10-19. This session did none of `BP-RefinedTraceMethods` (Codex, `codex-kaAOOx`) or of the
part jobs and their reviews.

## Counts

| Check | Result |
|---|---|
| New targets in this packet | 12: 12 corrected, 0 added, 0 unverifiable |
| Amended imported targets | 4 verified |
| Imported targets | 238 (154 from the RT.1 part, 84 from the RT.5 part), reader parity and prerequisite resolution checked |
| Effective totals | 250 targets: 58 definitions, 50 constructions, 126 theorems, 13 comparisons, 3 applications |
| API items / unit tests / planets (effective) | 525 (+5) / 353 / 41 |
| Baseline declarations | 36: all 34 inherited confirmed at the pins, 1 `provides` corrected, 2 added |
| Requests | 2 → 1 (one redundant request removed; one consumer list narrowed) |
| Gaps / gap dispositions | 11 / 2 (one disposition updated) |
| Source issues | 1 new (E101, confirmed); 32 inherited from the parts unchanged; 2 known atlas errata cited |
| Stages | 10 planned, 0 closed |
| Checker | `check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings |
| Suggested file | `lean-check` exit 0, four theorem-body `sorry` warnings only |

## Sources read

- Antieau–Nikolaus, *Cartier modules and cyclotomic spectra*, arXiv:1809.01714v2,
  https://arxiv.org/pdf/1809.01714v2, SHA-256 `9ca2657c…63`, the recorded hash. Read: §1.1
  (Theorems 1–2, pp. 2–3), §2.1 (pp. 8–10, Theorem 2.1 with proof, Examples 2.2–2.3, Remark 2.5,
  Warnings 2.6 and 2.9, Lemmas 2.10–2.11), §3.1–3.4 (pp. 15–30), Theorem 6.14 (p. 60). Printed page
  = PDF page. v1 (https://arxiv.org/pdf/1809.01714v1, SHA-256 `9a984b92…bf`) was read only for E101.
- Antieau–Mathew–Morrow–Nikolaus, *On the Beilinson fiber square*, arXiv:2003.12541v2,
  https://arxiv.org/pdf/2003.12541v2, SHA-256 `2a0224b2…fd`, the recorded hash. Read: §2.3
  (Definition 2.18, p. 12), §3.1–3.2 (Propositions 3.1–3.7, pp. 15–17), §5 (Theorem 5.1,
  Definitions 5.3–5.6, Proposition 5.32, proof of Theorem 5.1(2), Construction 5.33, pp. 25–35),
  §6.3 (Construction 6.16, Theorem 6.17 and proof, pp. 44–45), Appendix A (pp. 54–60).
- Meyer–Wagner, arXiv:2410.23115v4 (SHA-256 `4479788e…d4`), §3.3, p. 30, to check the
  `HighPowered` definition in the suggested file: odd exponents 0 or at least 2, the 2-adic
  exponent 0 or even and at least 4. The file agrees.

No source file or passage is in the repository.

## Corrections, target by target

**RT.2/cartier-module.** The only prerequisite was the stage `EnhancedDerivedSheaves:E5:abstract`
(with no request listing this consumer), for a definition about abelian groups with two additive
operators. It now cites `mathlib:AddCommGroup` and `mathlib:AddMonoidHom`, both read at the pin and
added to the baseline. The hypotheses no longer claim coherent ∞-categorical data. The no-VF test is
restated on (ℤ/p)² with F(x,y)=(x,0) and V(x,y)=(0,x): FV=0=p·id, but VF(1,0)=(0,1). It is now a
proved example in the suggested file. The locator adds AN footnote 5 (VF=p deliberately not
imposed). The isogeny argument was rechecked: both defects land in ker f, which N₀ kills.

**RT.2/circle-ptypical-cyclotomic.** The statement had added a bounded-below hypothesis that AN do
not need. AN Remark 2.5 and Warning 2.6 compare the circle TC with the C_{p^∞} equalizer
p-adically for every X. The statement and API now keep the source's scope. Added API: `forget`
(stable, presentable, conservative, preserves and detects colimits) and `trivial` (X^triv and the
unit S^triv, AN Example 2.2). The Hℚ convention test was recomputed: Hℚ^{hT} has π₋₂≠0, while the
C_{p^∞} equalizer is Hℚ.

**RT.2/topological-cartier-module.** `EnhancedDerivedSheaves:E0/limits-colimits-and-slices` is the
simplicial-join node. It is replaced by the exact E0 nodes for enhanced limits and colimits and for
functor quasicategories. Added API: `ofCartier` (AN Example 3.2) and `forget` (AN Proposition 3.11:
stable, presentable, limits and colimits computed underlying). The proof sketch records the defect
map gV_M−V_N g_{hC_p} of Proposition 3.8, with E101. The test `modV_is_derived` was recomputed from
the long exact sequence of M_{hC_p}→M→M/V.

**RT.2/cartier-v-completion.** Same E0 replacement. The locator adds Example 3.27 for the Prüfer
test. All three tests were recomputed; the derived completion of ℚ_p/ℤ_p is ℤ_p[1].

**RT.2/cyclotomic-t-structure.** The test `CyclotomicTStructure.zero` claimed that left
separatedness detects zero from homotopy objects. That needs bounded-below objects: finite
Postnikov induction followed by left separatedness. The test now says so. Added API
`forget_rightTExact`. The locator adds Example 2.2 and Warning 2.9. The statement matches
Theorem 2.1, its proof and Lemmas 2.10–2.11. The request to E5:abstract names exactly HA 1.4.4.11
and 1.2.1.19 as used there.

**RT.2/tr-cartier-comparison.** The locator adds Remark 2.5, which supplies the genuine
bounded-below comparison in the statement, and fixes "Propositions 3.17".

**RT.2/cyclotomic-cartier-heart.** Theorem 1 is on p. 2, not p. 3. The match now attributes the
π_i^cyc↔π_iTR correspondence to the §3 introduction and Theorem 3.21, and the W(k) computation to
Theorem 6.14.

**RT.2/tr-detects-quasi-isogenies.** Verified against AMMN Definition 2.18 and Proposition 3.1 and
the TC(−;ℤ_p) remark in §3.1. Remark 2.5 begins on p. 8 (locator). It is no longer listed as a
consumer of the E5:abstract request: it does not cite that stage, and reaches the t-structure
through RT.2/cyclotomic-t-structure.

**RT.2/null-frobenius-tr.** The splitting TR(X)≃∏X_{hC_{p^n}} identifies
(X^{tC_p})^{hC_{p^{n−1}}} with X^{tC_{p^n}} for bounded-below X (NS Corollary II.4.7, cited by
AMMN). `RT.2/tate-cpn-via-cp` is added as a prerequisite, and the proof sketch says so. The
uniform-annihilator argument for the product is right.

**RT.2/graded-cyclotomic-spectrum and RT.2/graded-cyclotomic-quasi-isogeny.** Both use the
corrected readings of two AMMN slips already in the atlas errata:
- PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22/E6, p. 15: the Day convolution is additive in the weight.
- PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22/E7, p. 16: the truncation has (X_{≤i})_j=X_j.

They are cited, not copied into `sourceIssues`, so the register is not duplicated. The graded
locator is corrected: the truncations are in the proof of Proposition 3.3, and the graded THH
structure is Corollary A.9 with Examples A.10 and A.16 (Appendix A starts on p. 54). The hypotheses
of Proposition 3.3 match exactly.

**RT.6/uncompleted-graded-trace.** AMMN Construction 6.16 and Theorem 6.17 are stated for
R∈qSyn_Zp, the p-torsion-free quasisyntomic rings. The target stated the factorization for every
quasisyntomic ring. Statement and hypotheses are restricted to qSyn_Zp; the only consumer,
RT.3b/graded-beilinson-square, needs only this case. The left Kan extension input is exactly
`PrismaticCohomology:PR.4/syntomic-connectivity` (1) of the accepted PR.0 packet. Tests were
recomputed: for R=ℤ_p and i=1 the rational reduction fiber is ℚ_p[−1], and LΩ^{≥i} vanishes above
the dimension for polynomial algebras.

## Amendments of imported targets

All four were checked against the imported statements and the supplier nodes:

- RT.3b/reduction-quasi-isogeny now has the AMMN Proposition 3.1–3.3 inputs as exact RT.2 targets.
  Its imported proof step still calls them a recorded gap. The amendment carries a `proofNote`, and
  the reader states the effective step.
- RT.3b/graded-beilinson-square trades the whole-RT.6 edge for RT.6/uncompleted-graded-trace. This
  removes the square and the filtered interface from the all-packet stage-level cycle they were in.
- RT.5/torsion-qhodge and RT.5/pro-qhodge-idempotence cite H.6/burklund-quotient-tower. That node is
  the tower MW 3.3 actually uses: v=4 and v=p, exponent at least n+1. torsion-qhodge also cites
  H.6/burklund-moore-multiplicative.

## Baseline

A mechanical cross-check (Sonnet) read all 34 inherited declarations at the pinned trees. I read
every flagged entry myself. All exist under the recorded names, and every source link points at
the declaration line. `mathlib:CategoryTheory.Limits.PreservesFilteredColimits` quantifies over
filtered categories in the morphism universe of the **target** category; the `provides` text said
source, as Mathlib's own docstring does. It is corrected. The other flags concern imported targets
and are listed under questions. `mathlib:AddCommGroup` and `mathlib:AddMonoidHom` were added for
the classical Cartier target. No library already has Cartier modules, cyclotomic t-structures or
TR: the audit and the current Tau Ceti and TauCetiRoadmap checks recorded by the plan were not
contradicted.

## Closure, suppliers and cycles

Every prerequisite of the 250 effective targets resolves to a current packet node, a stage or a
baseline declaration: 1051 node edges, 136 stage edges, 49 baseline edges. These supplier nodes,
cited by the new targets and the amendments, were read and supply what is used:

- DD.2/p-completed-derham.
- E0/limits-colimits-universal-properties and E0/coherent-functors.
- E1/enhanced-derived-category.
- E3/kan-extensions-along-functors.
- E5:abstract/stable-infinity-category and E5:abstract/symmetric-monoidal-infinity-category.
- E5:presentability/presentable-categories.
- E5:animation/universal-property-of-animation.
- H.5:spectra/postnikov-sections.
- H.6/burklund-quotient-tower and H.6/burklund-moore-multiplicative.
- PR.4/syntomic-connectivity.

The request for that last node was redundant: it named an exact node of an accepted packet that the
consumer already cites. It is removed, and its contract stays in the proof sketch. The E5:abstract
request remains: the E5 packets have no generic t-structure node.

Node-level, the all-packet prerequisite graph with the amendments applied has no cycle. With stages
expanded to their members, one strongly connected component meets this roadmap; it is described in
question 2.

## API, tests, planets

Every definition and construction has at least three tests that a plausible wrong definition
fails. Five API items were added where consumers use the structure: the forgetful functors, the
trivial objects, discrete topological Cartier modules, and right t-exactness. No planets were
added: RT.2 already has six, the maximum, and the new targets are interface targets of an existing
layer.

## Suggested Lean file

The file was rewritten in place:

- It imports individual Mathlib modules instead of `import Mathlib`.
- It uses the packet's names `CartierStructure.IsMorphism` and
  `CartierModule.isogeny_iff_underlying`. The latter is now stated as the packet's equivalence, with
  the N² argument in its docstring.
- The packet tests `CartierModule.zero`, `integer` and `no_vf_axiom` are proved examples.

`HighPowered` and `TracePresentation` were checked against MW 3.3 and the imported RT.5-part
targets. `lean-check` exits 0 at the pinned build. The four warnings are all theorem bodies:
`isogeny_iff_underlying`, `highPowered_fourth_power`, `universal_property` and
`can_and_frobenius`. `check_sorry_data.py` passes.

## Reader

The reader is generated. A renderer written for this review reproduces 243 of the 250 target
sections and every layer Dependencies paragraph byte for byte from the effective packet. The other
seven differ only by process-word edits (or one doubled full stop). Only the changed parts were
regenerated:

- the twelve new target sections and the amended RT.3b/reduction-quasi-isogeny step;
- the RT.2 Dependencies paragraph;
- the E5:abstract consumers;
- the baseline list;
- the removed PR.4/syntomic-connectivity contract section;
- the new E101 correction.

Three generated slips were also fixed: "tHH", "constructs cyclonic arithmetic comparison" and
"constructs exporting". A field-by-field check of every effective target against the reader passes,
apart from those intended edits.

## Source issues

**RefinedTraceMethods/E101 (new, confirmed; the same text in v1).** On AN p. 19 the defect map in
the nullhomotopy carries a lowercase subscript on the target Verschiebung. Remark 3.9 on p. 20
writes it with V_n and f_{hC_p}. In both places the map meant is gV_M−V_N g_{hC_p}, as displayed
just before. This was checked on the rendered pages. The AMS server refused the published PDF, so
the finding is scoped to the arXiv texts.

The inherited E1–E24 (RT.1 part) and E1–E8 (RT.5 part) keep their accepted verdicts, keyed by
(packet, id). E20 is the AMMN Proposition 3.1 slip used by RT.2/cartier-module.

## Questions for the orchestrator

1. **Amendments are not applied by promotion.** `scripts/promote.py` and `scripts/blueprints.py`
   merge the three packets by union. They ignore `amendments`, `requestUpdates` and
   `gapDispositions`. The atlas will show the four amended targets with their old prerequisites,
   and the RT.1 part's two consuming gaps. The parts' packets can only change through a job that
   owns them; this review could not edit them. One fix job with those packets as deliverables
   could apply the four amendments, the two request updates and the gap closures.
2. **A stage-level cycle in another roadmap.** HabiroCohomologyFoundations
   `HQ.5-trace/trace-theoretic-existence-of-q-hodge-filtrations`, in both the HQ.1 part and the
   main HabiroCohomologyFoundations packet, cites the whole stage `RefinedTraceMethods:RT.6`. That
   closes the cycle RT.6 ∋ RT.6/habiro-trace-interface → RT.4:Habiro-comparison/number-field-habiro
   → HabiroRings HR.6/the-degree-zero-identification → HQ.5 ∋ HQ.5-trace/… → RT.6. Its request
   asks for the THH/prismatic comparison and the Nygaard and syntomic filtrations. These are exact
   targets with no path back to HQ.5:
   - RT.6/motivic-filtrations;
   - RT.6/syntomic-graded-tc;
   - RT.6/trace-prismatic-comparison;
   - RT.6/graded-motivic-comparison.

   Citing them instead removes the cycle. That is an edit to the HabiroCohomologyFoundations
   packets.
3. **Minor baseline follow-ups for imported targets** (RT.1 part):
   - RT.2/tate-of-eilenberg-maclane cites `Rep.FiniteCyclicGroup.tateCohomologyIsoEven` for full
     2-periodicity. That declaration covers even degrees only; `tateCohomologyIsoOdd` (line 182)
     and `periodicIso` (line 341) in the same file supply the rest.
   - `normalizedMooreComplex` is the kernel model of the normalized complex, which is isomorphic to
     the quotient by degeneracies that RT.1/connes-operator describes.
   - `VectorBundle` fixes one fibre model, so locally constant rank needs a sum over components.
4. **Tiers.** RefinedTraceMethods is outside the 94 Caraiani–Newton roadmaps. AInfCohomology,
   PrismaticCohomology and CohomologyComparisons cite it, and the upstream order file already lists
   those citations. Nothing here changes that.
