# Handoff: BP-DiophantineApproximationAndTranscendence

Issue #1027 · Codex session `codex-a71f92` · 26 September 2026.
Continues the checkpoint from PR #2769 by Claude Code `cc-2aeb03`.

## This checkpoint

The packet remains `partial`, scope DT.0–DT.5, part null. All 348 inherited node IDs
are retained; 346 inherited node objects are unchanged. Five new DT.2 lemma nodes
decompose Evertse 1996, Lemma 25:

1. `grid-floor-capacity`: the corrected degree/multiplicity budget, including B < 1.
2. `univariate-integer-grid-jet`: root multiplicity over a characteristic-zero integral domain.
3. `partial-specialization-jet`: compatibility of Hasse jets with evaluation of the first variable.
4. `nonzero-partial-grid-specialization`: preserve nonzeroness and residual coordinate degrees.
5. `rectangular-integer-grid-jet`: induction on variables, including zero variables.

No definition or carrier is introduced. The chain consumes DT.1's Hasse derivatives and
pinned Mathlib root-count, floor and polynomial-equivalence APIs. The parent
`nonvanishing-on-grids` now imports the grid lemma and identifies exactly the unfinished
hyperplane and nonzero-block steps.

A source-fit correction changes `sharp-roths-lemma` to use the already planned `height2`
for both the polynomial coefficient vector and the points. Evertse 1996 §1 p. 2 defines
Euclidean, not maximum, norms at infinite places. Packet, reader and Lean signature now
agree. This correction does not close the sharp-Roth/Faltings proof gap.

Source findings E215 (degree of the multiplicity product) and E216 (strict threshold in
the index definition) are recorded with preprint and published locators, checksums,
counterexamples and a bounded search for existing corrections. Both formulas were checked
visually in both versions. No independent-review verdict is claimed.

## Inventory and checks

- 353 nodes: 39 definitions, 5 constructions, 176 lemmas, 128 theorems, 5 applications.
- 331 API items and 189 tests across all nodes. The validator reports 326 API items and
  184 tests because its counters cover definitions/constructions only.
- 36 inherited planets, unchanged; 378 baseline declarations, 33 sources, 68 source issues,
  21 gaps, 4 requests and 11 restructure proposals.
- Full packet validator with the pinned declaration index: 0 errors, 0 warnings.
- Four-file intake validation: passed.
- Full suggested Lean file: elaborates against pinned Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`; 731 warnings, all declarations using
  `sorry`, and no errors. The helper checked all 8,482 reached Mathlib source files against
  the pin before using cached objects. No Tau Ceti module is imported.
- Separate scratch Lean checks prove the general floor-capacity inequality and the cubic
  value-only counterexample with no `sorry` and no warnings. They are checks, not published
  implementations.
- Exact integer/rational checks passed: 55,760 floor-capacity cases, 2,292 rectangular-grid
  witnesses, 2,286 nonzero partial specializations and 7,620 jet-specialization identities.
  Value-only and positive-characteristic counterexamples passed. These finite checks are
  not proofs of the general planned lemmas.
- Every new API and test has its named signature/example in the suggested file. All nodes
  remain `implementationStatus: unchecked`.
- Read the six reviewed AUDIT-07 rows before planning; respected the accepted RS-03
  ownership boundary; no new absolute-height foundation or numerical enumeration work.
  Read the roadmap, applicable links, and EffectiveBounds/GlobalNumberFields style models.

## Where to resume

Start with the narrowed grid gap in DT.2. The public author preprint
[95-subspace.pdf](https://pub.math.leidenuniv.nl/~evertsejh/95-subspace.pdf), §7 pp. 63–68,
contains the full proof, including the reduction credited to Schmidt.

1. **Lemma 24, pp. 64–67:** normalize an annihilating hyperplane covector; bound its H₂
   by the product of binary coordinate heights; select a large-height binary direction.
   Extract successive lowest powers in the remaining variables, preserving the vanishing
   of low-weight jets and coefficient-height bounds. Restore the binary multihomogeneous
   degrees by monomial multiplication, then apply sharp Roth.
2. **Lemma 26, p. 68:** compose a nonzero restricted derivative with hyperplane basis
   coordinates. Apply `rectangular-integer-grid-jet` with B = N/ε and per-coordinate
   degrees r_h. Decompose the linear-substitution chain rule and prove the extra weighted
   derivative order is at most m(N−1)ε/N, yielding a total strictly below 2mε.
3. **Nonzero blocks:** EF Proposition 12.1 excludes the zero vector in each block;
   Lemma 26's displayed grid does not. Formalize the multihomogeneity argument: a
   derivative nonzero at a zero block has residual block degree zero and is independent
   of that block, so replacing zero by a basis vector preserves its value and stays in
   the grid. Do not silently infer nonzero coordinates from a nonzero jet.
4. **Index boundaries:** use vanishing for weights strictly below the threshold.
   A nonzero jet gives index ≤ its weight, not a strict inequality. Keep the final
   strict bound separate.

The original 21 gaps remain in number; one is narrowed. DT.2 and the whole roadmap are
not closed. The existing DT.1 closure and DT.3 qualitative decomposition are inherited,
not newly reverified in full here. Other remaining inputs are the absolute Minkowski and
Davenport arguments, sharp Roth/Faltings, Bombieri–Vaaler, the EF internal lemmas,
ESS §§6–12, Schmidt's norm-form proof, explicit logarithmic-form proofs, equation-specific
DT.4 proofs, and the listed DT.5 inputs. Four cross-roadmap requests remain unchanged.

The inherited absolute-height API gap remains subject to RS-03's single-owner boundary:
consume existing/planned upstream height APIs rather than create a second foundation.
DT.3 owns logarithmic-form bounds, DT.4 their equation-specific conversion, and ED.2 the
certified numerical evaluation and exhaustive enumeration.

## Earlier checkpoint context

The earlier work supplied the complete DT.1 Liouville/Thue/Roth chain, the DT.0 height and
approximation comparisons, the DT.3 qualitative transcendence arguments, and the DT.4/DT.5
statement inventory. Its source reading and unresolved requests are retained in the packet.
This continuation does not claim to have reread all 33 sources or independently checked
every inherited proof outline. The present source reading covers Evertse 1996 §1 p. 2 and
§7 pp. 63–68, with published checks of pp. 290 and 294.
