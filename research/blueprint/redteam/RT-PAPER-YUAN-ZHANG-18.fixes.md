# Yuan–Zhang extraction: confirmed red-team fixes

Job `FIX-RT-PAPER-YUAN-ZHANG-18`, [issue #5502](https://github.com/CBirkbeck/tauceti-explorer/issues/5502). Worker: Codex — codex-J6LwjP, 1 October 2026. All four findings confirmed in `RT-PAPER-YUAN-ZHANG-18.review.json` are addressed. This is a consistency and propagation fix to the extraction; implementation and global proof closure are not claimed.

## RT-PAPER-YUAN-ZHANG-18/1 — relative Hodge ranks

`integral-ks` now defines W^t as the rank-two relative Hodge submodule of the rank-four O_℘-relative crystal. It explicitly identifies that submodule at unramified places with the τ-idempotent summand of the absolute Cartier-dual differential module, whose full rank is `4[F_℘:Q_p]−2`. W, W^t and N use one consistent convention.

`cotangent-tensor`, `determinant-cancellation` and `comparison-line` carry the same convention. Their unramified branch uses exact idempotent summands; their ramified branch requires a genuine relative theory or generic-image convention with proved local freeness, filtration, connection, tensor compatibility and determinant-lattice comparison. The latter is explicitly conditional. Neither generic rank nor good reduction implies local freeness of a raw τ-quotient. `selfdual-height` likewise retains all four local-freeness hypotheses and a separate torsion comparison obligation.

E3/E31 remain open in their existing owners/routes. No second generic Dieudonné owner, route or source issue is introduced. The accepted regular-model extension for E9 is now stated affirmatively in the proof plan, with the corrected equality `ω^{-2} = πN^∨`; it does not resolve the independent ramified-base comparison.

## RT-PAPER-YUAN-ZHANG-18/2 — order containment

`test-function` imports `quaternion-datum`: a chosen maximal order `Ô_𝔹 ⊇ Ô_E`, with `U = Ô_𝔹^×`, compactness and no common finite ramification. The weaker unit-containment implication is removed from the active statement and review paraphrase. It remains recorded as the rejected printed argument in E28.

`order-sandwich` explicitly uses that same chosen local order, its original integral 𝔧_v and the relative discriminant ideal. Its outline distinguishes the split-quaternion trace-discriminant computation from the division case, where E is unramified and the order equality is direct. `local-n` and `local-cancel-split` retain the same datum; the arithmetic-adjunction review paraphrase is corrected as well. E11's primitive O_E-generator condition is preserved. No duplicate erratum is added.

## RT-PAPER-YUAN-ZHANG-18/3 — finite supports before finite fields

`rev-hodge-class-terms-vanish-and` chooses H only after the finite CM supports of a coefficient or intersection calculation are fixed, taking their finite compositum unramified above Σ(𝔹_f). It requires Q-factoriality and ξ̂-admissible extensions on that model. It distinguishes the finite orbit C_U from the full varying-conductor set CM_U and does not demand a common finite field for the latter.

The statement and outline record normalized base-change independence: over a permitted extension H′/H, the total arithmetic pairing scales by `[H′:H]`, so division by `[H:F]` is independent of H. Local ramification/residue-degree weights and archimedean multiplicities belong in this total. Two choices are compared over a common permitted compositum; the resulting coefficients assemble to the height series. `height-decomposition-series` explicitly imports this input, and the CM-points definition clarifies its pointwise quantifier.

Both S2 conditions, normalized C_U averages and `log N_v = 1` at real places are retained. This repairs an extraction quantifier, not a new source error.

## RT-PAPER-YUAN-ZHANG-18/4 — stale proof plans

- **Determinant cancellation:** use the inverse W(I^t)-twists directly. A change of basis by a unit a contributes inverse O_L-determinant norm factors, which cancel. No identification of rank-two O_E-linear Hom with rank-one O_B-linear Hom is used. The ramified E3/E31 obligation remains.
- **Local n:** outside S2 use `n_φ = ½v(q(y))φ`; at S2 compute `n_ψ1 = 0`, `n_ψ2 = 1` on its support, hence `n_φ = −ψ2/(1+N+N²)`.
- **Split cancellation:** use the actual p. 626 convention `d_φ = 2n_φ log N − c_φ + log|u q(y)|φ`. Outside S2 the valuation/log terms cancel. At S2 use `c_φ = 2n_φ log N` and `log|u q(y)| = 0`; the different is a unit and the original 𝔧 has norm −1, so the stated right side is also zero.
- **Nonzero theta:** all constant-term summands are a common Weil-index sign ε times nonnegative numbers; the u = 1 term has strictly positive absolute value. The sum is nonzero even when ε is negative. The positive S2 volume is preserved.

The audit of all retained proof-outline fields also synchronized seven existing corrections: height-decomposition's established monogenicity over O_σ after residue-field enlargement; integral-ks's valid extension across codimension-two nodes; selfdual-height's local-freeness hypotheses; vertical-pseudo's direct norm kernel from the second p. 623 display and p. 624 support computation; pseudo-comparison's discriminant characters and full adelic δ; pseudo-weight-cancel's common-character hypothesis; and modified-projection's class-field, properness and stabilizer argument for CM sections and multiplicity. Historical assertions remain in the unchanged reviewed source-issue records. The audit supplies no new blueprint-level closure claim.

## Evidence and source scope

The [published main PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) and [December 2022 author erratum](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf) were accessed on 1 October 2026; SHA-256 hashes match the packet's recorded `29dfd5f1…` and `18b46acd…`. Selected main pages 546–548, 562, 568–570, 575–576, 581–583, 591–592, 603–604, 607–608, 619, 623–626, 628 and 633–635, and author-erratum page 10 were re-read. Images were inspected for main pages 568–569, 575–576, 591, 607, 619, 628 and author-erratum page 10. The author revision remains version-scoped; the final 12-page journal erratum has not been collated. This is not a new whole-paper read.

The reviewed library audit and existing owners were consulted: R18.2/R18.5 supply model and uniformization inputs, GZ7 supplies the height-comparison direction; the relative/ramified obligations remain there through the existing extraction routes. No new declaration is credited, no absence claim is strengthened, and no upstream roadmap is replanned.

## Validation and handoff

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-YUAN-ZHANG-18.result.json` passes.
- `python3 research/blueprint/intake.py check-files` passes on the three issue deliverables.
- Item IDs and statuses, all nine route memberships and all 55 source-issue objects are unchanged. There are 139 items: 6 library, 14 planned, 119 missing; all missing items remain routed exactly once. Every dependency resolves and the item dependency graph is acyclic.
- Exact Fraction/integer diagnostics check the S2 coefficient and cancellation, ordinary split valuation cancellation, positivity of the unsigned S2 volume for N ≥ 2 on representative residue sizes, negative common-sign summation, determinant basis cancellation, normalized degree scaling and the dyadic unit/order-containment witness. These are finite regressions, not proofs of arbitrary towers or arithmetic intersection theory. Reproduction formulas are the ones in the four sections above.
- No Lean file belongs to this job; none was created or compiled. Full formalization and the E3/E31 ramified-prime comparison remain for the owning plans and independent review.

The reader's headline counts are current, and its earlier continuation is explicitly historical. This complete fix is ready for independent `REV-FIX` review. All work is confined to the three authorized deliverables.
