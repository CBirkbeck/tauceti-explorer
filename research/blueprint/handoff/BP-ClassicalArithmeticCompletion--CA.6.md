# BP-ClassicalArithmeticCompletion--CA.6

Agent: Codex. Session: codex-fier75. Issue: #9670. Date: 14 October 2026.

This is a completed target-level planning pass. Packet status is `complete`; the only stage, `ClassicalArithmeticCompletion:CA.6`, is `planned`, not `closed`. No implementation is claimed. The [packet](../packets/ClassicalArithmeticCompletion--CA.6.json), [reader](../readmes/ClassicalArithmeticCompletion--CA.6.md) and [suggested file](../suggested/ClassicalArithmeticCompletion--CA.6.lean) are the deliverables. The parent packet and reader were not edited.

## Inventory and validation

There are 30 new nodes: 8 definitions, 4 constructions, 11 theorems, 5 lemmas and 2 applications. Definitions and constructions have 69 planning API items and 46 discriminating tests in total; each has at least three tests and a uses record. All 45 existing CA.6 targets are imported by their existing IDs. Their six planets are inherited, and no new planet is proposed. There are 36 individually checked baseline declarations, four gap records and one inherited supplier request.

`python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalArithmeticCompletion--CA.6.json` passes with zero errors and zero warnings. The 215-line suggested file elaborated with `lean-check` at the pinned Mathlib and Tau Ceti, with declaration-uses-placeholder warnings only. A second successful check followed removal of duplicated Möbius-factor and normalized-map planning. Its nine light definitions have real bodies on existing carriers; heavy constructions remain precise reader targets. The file is a statement prototype, not a development or proof of the roadmap.

## What this pass supplies

The Smyth chain now specifies real Schur coefficient sequences on the open disc, bounded numerator/denominator factorization of the parent's integral quotient, exact first- and doubled-index coefficient estimates, and the finite Parseval contraction after polynomial multiplication. The Parseval proof works first on radius r<1 and then takes r to 1, so it requires no boundary extension of the original bounded functions.

The first-index reduction has c=M(P)⁻¹, S=1−c², first two positive nonzero quotient coefficients at k<l, and coefficients of absolute value one in the relevant range. The weak endpoint M=(1+√17)/4 is excluded using integrality of the monic polynomial's exponential Mahler measure. For l>2k, the doubled-index bounds and quotient coupling give c³+c²≤1. The l=2k case reduces through the inverse quotient: its new coefficient is 1−a_(2k), hence 0 or 2; 2 contradicts the first-index coefficient bound. Do not swap the quotient back merely to make its first coefficient positive, which would undo that reduction.

The k<l<2k target records the quartic 40c⁴−93c²+40≥0, but explicitly does not claim verification of the two source multipliers yielding it. The conversion from that quartic to the sharp plastic-number bound is specified independently. Thus the parent Smyth target's old missing-public-proof gap is narrowed rather than erased.

For Dimitrov, the new analytic chain includes finite Fekete diameters, transfinite diameter, monic Chebyshev norms, their common limit, monic inverse-image diameter, and smooth polynomial-lemniscate enclosures. Capacity-zero compact sets are covered by the additive enclosure d(L)<r for every r>d(K).

The radial chain specifies hedgehogs, conformal radius using existing normalized Riemann maps, finite-cut Dirichlet condenser capacity and its change-of-variables contract, the shrinking-disc asymptotic, and Dubinin's piecewise rotational desymmetrization. Inversion relates exterior radius to diameter. Extending spikes to their common maximum length and comparing with the regular hedgehog yields d(K)≤R·4^(−1/n), including repeated and zero endpoints. Length capacity and condenser capacity have different normalizations: d([0,a])=|a|/4, d(closedBall(0,R))=R, and condenser capacity of an annulus is 2π/log(R/r).

The rationality chain uses the shifted Hankel determinant D_n=det(a_(i+j+1)), with D_0=1. The actual Laurent germ must belong to the holomorphic continuation witness. A monic contour basis gives |D_n|≤n! Bⁿ r^(n(n−1)) for each r>d(K). Integer coefficients and d(K)<1 force eventual determinant vanishing; Kronecker then gives rationality over the rationals. A single vanishing determinant is insufficient.

The square-root continuation uses the principal logarithms of 1−β_i/z off the radial cuts, with value 1 at infinity. Integer coefficients are an explicit imported hypothesis, not a consequence of analytic branching. The final application uses 2d endpoints α_i², α_i⁴ and R≤H⁴, giving R^(2d)<4 under the parent's strict house inequality. Rationality alone does not prove cyclotomicity: the parent's arithmetic square-factor and smaller-degree induction remain required. Its corrected cyclotomic level is 4∤N, not odd N.

## Ownership and existing-library reconciliation

CA.6 owns the finite Fekete/transfinite-diameter and monic Chebyshev-norm notions needed here. `LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1` must import those notions from CA.6 under the current upstream tier order. LP.1 retains general logarithmic-energy capacity and its equality with transfinite diameter. No upward LP dependency is introduced. The specialized Dubinin and Bertrandias inputs belong to CA.6.

Pinned Tau Ceti already provides `unitDiscMoebius`, the scalar formula mapping and derivative API, and `IsNormalizedRiemannMapOn` with existence and on-domain uniqueness. None is replanned. Mathlib's canonical-factor boundary norm, existing continuous-map sup norm, real affine segments and determinant transport are reused explicitly. Only conformal radius is newly defined on the existing normalized-map witness.

Current TauCetiRoadmap main and the current Tau Ceti library were inspected for overlap, including Completed ContourIntegration and EffectiveBounds, OperatorTheory and DifferentialGeometry. Concrete relied-on signatures were then read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet records the individual declarations. The 32-entry parent review frontier is historical; preserve the latest assessments instead of treating all 32 as open proofs. In particular do not reopen the corrected integer-norm rounding, root-power exterior-product construction or cyclotomic-level findings.

## Sources and access limits

The packet's six source records contain public URLs, versions, page locators, access dates, scope and hashes where a local PDF was actually read:

- Smyth (1971), published pp. 169–175: author-uploaded public PDF text extraction, especially §§2–5. The coefficient lemma and long-gap algebra were independently checked. The extraction omits mathematical displays; direct retrieval and page rendering were denied. No complete scan reading is claimed.
- Dimitrov, arXiv:1912.12545v1, §3 Theorem 3 and §4 Theorem 4, Corollary 5 and Theorem 1 proof, pp. 12–16.
- Bertrandias, published Numdam seminar scan, §§1.1–1.5 pp. 1–3, §2.1 p. 6, §2.6 pp. 10–12 and §3 pp. 12–13; selected page images checked.
- Saff, arXiv:1010.3760, especially Definition 1.8 and Theorems 1.9, 1.18, Definition 3.4, Theorem 3.5 and Example 3.6; condenser normalization in §5.
- Dubinin (1985 English translation), Math-Net public text extraction, §1 Lemmas 1–2, Theorem 1 and its conformal-radius corollary, pp. 268–271. Only the comparison inequality is used, not an equality classification.
- Iribar López's ETH-hosted Carlson–Pólya notes, §2 Theorem 1 proof, PDF pp. 2–3, checked as images.

Five source findings are recorded for independent review: Bertrandias's universal inverse-image quantifier and the capacity-zero exception in his multiplicative enclosure; Iribar López's reversal signs, block coefficient index and homogeneous recurrence right side. The new plan uses the corrected statements. Searches of the primary item/current notes and author page found no linked corrections. No restricted book or source passage was copied into the repository.

## Precise remaining work

1. Obtain readable Smyth §4, printed pp. 172–173. Verify the two three-term multipliers, the selected coefficients in both Parseval contractions and the completing-square step producing 40c⁴−93c²+40≥0 for 3/4≤c<(√17−1)/4 and k<l<2k. This is the sole newly narrowed analytic verification gap; the sharp end statement in the Lean prototype does not close it.
2. Preserve the parent's Smith 1–3 contracts: trace ratio, finite-exception threshold and auxiliary-resultant bound with coprimality. Its BKK 69 request needs an asymptotic Dobrowolski constant and uniform bounded-degree completion stronger than the recorded 1/11700. BKK 70 needs a count of degree-dropping primes, not merely a degree-drop construction. Do not promote the historical λ_SSS=2 assertion to a current conjecture or theorem.
3. Supply the inherited explicit dyadic-prime count for real x≥41/2, with the parent's prime-count convention: π(2x)−π(x)>3x/(5 log x). The Rosser–Schoenfeld attribution remains unverified; the needed input is CA.6-owned under the tier rule.
4. Preserve genuine imported mathematical interfaces after consulting each latest parent assessment. In particular the power-map height target still needs a typed projective infinity contract: specify its projective carrier and [x:y]↦[x^d:y^d], identify ∞=[1:0], and prove that infinity is fixed and both its height and Tate-limit sequence are zero. Existing affine and preperiodic signatures remain imported. ArithmeticDynamics consumes this computation; it is not a supplier.
5. Complete the inherited `DiophantineApproximationAndTranscendence:DT.0` request for the embedding-product form of Siegel's lemma with rational-integer unknowns, needed by `CA.6/dobrowolski-auxiliary-polynomial`. A uniform house bound loses the exact embedding product and does not suffice. The full quantitative request is preserved in the packet and reader.

The next independent reviewer should check the mathematical comparisons, source corrections, import bindings and honest gap boundaries. A follow-up should address the remaining inputs at their existing owners rather than reconstructing the supplied analytic definitions. No scratch file is needed to resume: the packet, reader, source URLs and this note carry the durable information.
