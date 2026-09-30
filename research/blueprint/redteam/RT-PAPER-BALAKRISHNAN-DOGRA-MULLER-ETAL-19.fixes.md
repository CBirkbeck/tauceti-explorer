# FIX-RT-PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19

Issue [#5018](https://github.com/CBirkbeck/tauceti-explorer/issues/5018). Codex, session `codex-5ebb6f`, 30 September 2026. Base `e30645732fe21531ce139f72fd4230e1f4b06f51`. Claim comment 5916309573 was confirmed by bot comment 5916311821; the whole issue was reread after confirmation.

This repairs all nine confirmed findings of `RT-PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19`, including the low-severity findings /7–/9, using the independent verifier's qualifications. Only the three named deliverables change: this report and the paper JSON/Markdown. No roadmap, accepted packet, link file, campaign content, generated data or upstream Tau Ceti file is edited.

The extraction remains complete as an extraction: **97 items, 1 library, 21 planned, 75 missing; eight routes, every missing item taken exactly once**. All 92 original IDs are retained. Seventy-four original item records are unchanged verbatim; eighteen receive the scoped statement/status/note fixes below. The original source block, unrelated prerequisites and existing /92 Balakrishnan–Tuitman integration input are preserved. Complete extraction does not claim that its proofs or supplier blueprints are closed.

## /1 — Join the shared height design; keep NC.5 downstream

Move /24, /25, /26, /27, /30 and /31 together out of NC.5 into the existing `SelmerComplexesAndPadicHeights` Part II proposal. Route 5 uses exactly the identity of `PAPER-DISEGNI-LIU-24` route 2: parent `SelmerIwasawaCohomology`, title “Selmer groups, continuous integral cohomology, and Iwasawa cohomology, Part II: p-adic height pairings and bi-extensions of cycles”, area `iwasawa`. The shared design is pending at #3430 and has **no atlas stages**, so all six items remain missing. A proposal is not planned coverage. No evidence is taken from the rejected Disegni-22 reuse attempt.

The brief retains the shared proposal's cycle-height/Panchishkin branch and explicitly adds Nekovář's general chosen Hodge splitting and idèle character. BDMTV's curve V is not required ordinary or Panchishkin. Both generic mixed-extension categories move with the pairing and its local terms; otherwise the foundation would depend on NC.5. The Galois local conditions, duality and p-adic Hodge/comparison machinery are imports. NC.5 keeps AZ twisting, the specialised formula (17), Lemma 3.2 and the quadratic Chabauty application, and imports the shared height supplier. The H¹_f/Mordell–Weil distinction of E8 remains explicit.

**Maintainer handoff:** join this source to the pending shared design and its future blueprint. Its identity already existed before the original BDMTV extraction; this fix does not create a competing height roadmap or invent stage IDs.

## /2 — Correct compactified modular-curve coverage and algebraic ownership

/1 becomes missing: Tau Ceti ModularCurves Layer 9D supplies affine coarse quotients, while Layer 10 explicitly quantifies over diamond quotients of Γ₁(N), **N ≥ 5 prime**. That contract neither constructs compactified arbitrary-H Cartan quotients nor covers ℓ=2,3. The old two-layer planned claim is removed.

Route 6 requests the R13.4a source extension for compactified X_H over Z[1/ℓ], H ≤ GL₂(F_ℓ), −I∈H and surjective determinant, including split and non-split Cartan normalisers. /71 moves out of bad-fibre R13.5 into this algebraic owner: import refined general-level Γ₀(ℓ²) from R13.2, extend w_{ℓ²}, form the quotient and construct the Q-isomorphism with X_s(ℓ). The non-cuspidal rational-point criterion restricts to j≠0,1728; those omitted j-values are CM, and −I∈H removes any need for a twist.

The analytic conjugation by diag(ℓ,1) is recorded as downstream R13.4b compatibility, not an input to the algebraic construction. R13.5 retains /72–/76 and consumes the algebraic isomorphism for its models.

**Maintainer handoff:** the pending `EllipticCurveModularityImaginaryQuadratic` design from `PAPER-CARAIANI-NEWTON-23` route 2 should import this Cartan supplier. No upstream roadmap is altered, consistent with the current Tau Ceti ownership boundary.

## /3 — Split local integration from path transport

/58 now contains only the same-residue-disc word expansion (40), planned by `ColemanIntegration:L1/word-algebra-local-expansion`. New missing /93 at NC.2 contains (41), its identification with the universal de Rham path object through (39), and the global Frobenius-equivariant transport theorem. Its good-reduction pair and unipotent category hypotheses remain visible.

NC.2 imports L1's local expansion, word-algebra Frobenius and Coleman realisation; it does not reconstruct iterated integration. Besser's preprint labels the canonical fixed-path statement **Corollary 3.2**, following Lang-map Theorem 3.1, and its composition property Corollary 3.3. The global bridge is needed for cross-residue-disc basepoint transport in Lemma 5.7 (49) and §6.6. The tiny transports from a Teichmüller point in §5.3.2 need only the local formula; this fix does not attach the global theorem to that local computation.

## /4 — Split rank inputs and leave the modular-factor assembly missing

/79 becomes the **missing Gross–Zagier lower bound** at GZ.8: for the weight-two modular factor A_f of dimension m, simple zeros of all conjugate L-functions yield rank at least m. It joins the broader source input `PAPER-GROSS-ZAGIER-86/304`; the two contracts are not asserted identical.

New planned /94 states the **conditional** HE.7 Kolyvagin–Logachev contract for the specified admissible RM modular quotient and Heegner field: a non-torsion Heegner point gives rank over K equal to m and finiteness of the whole Sha, hence a rank upper bound over Q. The admissibility, Hecke/local and field hypotheses are retained; HE.7 does not establish analytic rank → non-torsion by itself.

New missing /97 preserves the formerly bundled analytic-rank-one result as a separate modular-factor assembly: choose an admissible K, produce the non-torsion point through Gross–Zagier, apply /94 and descend rank and Sha. Route 7 requests GZ.8's modular A_f extension and maintainer coordination with `RankZeroOneBSD` and `PAPER-SKINNER-20/2`. BSD.3 is elliptic-only and cannot cover this assembly. /82 retains Proposition 6.2 but names /79, /94 and /97 separately, plus its still-unproved certified numerical input. Its existing AS05 input and /92's BT17 input are not duplicated.

## /5 — Put the general Tuitman algorithm at RD.7

New missing /95 records the general certified Frobenius/reduction algorithm, owned by `PadicDifferentialEquationsAndRigidCohomology:RD.7`. Its current Kedlaya hyperelliptic certification node is not coverage for this general-curve algorithm. Import RD.0's dagger Frobenius lift and RD.4's Monsky–Washnitzer comparison; ED.4/ED.6 consume the resulting data. /60, /84 and /87 now name this provider rather than implicitly rebuilding it inside the worked example.

The contract specifies a finite separable map to P¹, monic plane equation, good characteristic-zero lift, bases integral in both generic and reduced charts, and the separated branch/boundary hypotheses of Tuitman II Assumption 1. **The author's June 2020 erratum corrects part (3): require unit discriminants for the reduced parts of the boundary algebras**, not the potentially nonreduced whole algebras. That erratum is added to the prerequisite and source provenance; it is not alleged as a new error in BDMTV.

The outputs include Φ(x)=x^p, the Frobenius matrix and exact primitives Φ*ω=Fω+df, semilinear q-Frobenius iteration and certified reconstruction. /95 records Proposition 4.7's bound using the lattice denominator loss δ and Proposition 4.9's working-precision condition with Definition 4.8. The precision displays were checked on page images 14–15. Remark 6.1's p=17 integrality shortcut is not imposed on the general algorithm; denominator losses must be accounted for. This is one cited algorithm item; full supplier proof decomposition remains blueprint work.

## /6 — Require unique pointed morphisms

/68 now requires **existence and uniqueness** of a pointed filtration-preserving morphism to every pointed n-unipotent object. New E9 records the omission of uniqueness in published Definition A.2 p.935 and arXiv v1 p.34. Existence alone is satisfied by A_n⊕1 pointed by (1,0), with E₀=A_n⊕1 and E_i=I^i A_n for i≥1, so it cannot imply uniqueness up to unique isomorphism. At n=0 the two maps (a,b)↦a and (a,b)↦a+b both send (1,0) to 1. Theorem 4.2, Lemma 5.2 and Lemma A.4 use the intended unique-map property. E9 is a misprint affecting no result after correction; it remains independently unreviewed.

## /7 — Supply small-prime existence separately

New missing /96 is routed with /6 to ED.6. For ℓ=2,3,5,7, the algebraic /1 and /71 imports identify X_s(ℓ) with X₀⁺(ℓ²), which has genus zero and a rational cusp. The blueprint must supply the explicit genus/fixed-point computations: X₀(4), X₀(9), X₀(25) have genus zero; X₀(49) has genus one and w₄₉ has four fixed points, giving quotient genus zero by Riemann–Hurwitz. The rational cusps 0 and ∞ are exchanged and give a rational quotient point. Removing finitely many cusps and rational CM points leaves infinitely many admissible j-values.

This derived proof route is not written out in BDMTV. The genus inputs and finiteness of rational CM j-values remain obligations, not certificates supplied by this fix. /75 only treats ℓ≡1 mod12 and is not used for these small primes. For j≠0,1728 and −I in the normaliser, no twist is needed.

## /8 — Record the additional source slips and the away-from-13 repair

- /67's unipotence criterion now quantifies over every **nonzero** object. New E10 names both published Definition A.1 p.934 and arXiv v1 p.34. The zero object admits no nonzero map from 1.
- E11 records the published [Nek93] DOI error. Fresh Crossref metadata identifies `10.1007/s10107-005-0696-y` as van der Laan–Talman–Yang's *Solving discrete zero point problems*. The correct Nekovář chapter DOI is `10.1007/978-1-4757-4271-8_8`, already used in the extraction's prerequisites. arXiv v1 has no DOI there. E13 separately records the published BL04 “Barieties” title typo, correctly spelled in arXiv v1; the two bibliographic slips are atomic findings.
- E12 records the incomplete proof of Corollary 6.7 p.929: Theorem 6.6 covers the 13-adic part, not good reduction at every other prime. /76 explicitly imports the **first Baran plane-quartic model on p.930**, which has good reduction away from 13, including 2. The second monic model is bad at 2 and 13. Theorem 6.6's tame-involution argument cannot replace the first model at 2.

E10–E13 affect no stated result and await independent review. Their version/article-page/bibliography searches are recorded individually through `searched`; no fresh review verdict is manufactured.

## /9 — Record versions, restore the existing review, correct numerics

Top-level `sourceVersions` now records the original extraction's historical full readings on **2026-09-23 by cc-442dc5**, with the published and arXiv-v1 hashes. Fresh retrieval by codex-5ebb6f reproduced both hashes on 30 September; current targeted reading is recorded separately under `fixSourceChecks`, without claiming a fresh whole-paper reading.

E1–E8 gain only their missing recorded review blocks. Each quotes the original independent review's explicit confirmation and names `REV-PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19`, cc-7b31c4. The already corrected E3 quotation and E5 version note are unchanged. This restores the prior record; it does not give this fix or E9–E13 a new independent verdict. Neither the original review file nor generated errata register is edited.

`G-numerics` names **ComputationalNumberTheory:CN.4** as the validated L-value/derivative supplier and **ED.6** as the stage certifying the particular bound for every embedding. ED.0 supplies exact arithmetic only. The existing CN.4→ED.2→ED.6 path is available; the separate modular-factor rank assembly remains /97.

## Sources and checks

The complete hashes and retrieval metadata are in `fixSourceChecks`; primary files were freshly retrieved from:

| Source | URL | SHA-256 prefix |
|---|---|---|
| Published BDMTV, 60 pages | [Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf) | `e1aa5f9662b48754` |
| BDMTV arXiv v1, 41 pages | [1711.05846v1](https://arxiv.org/pdf/1711.05846v1) | `77c57b0307c89159` |
| Tuitman I, arXiv v2 | [1402.6758](https://arxiv.org/pdf/1402.6758) | `8b033e59abf52aad` |
| Tuitman II, arXiv v2 | [1412.7217](https://arxiv.org/pdf/1412.7217) | `6e0f37d14ab1a46f` |
| Tuitman June 2020 erratum | [Author PDF](https://jtuitman.github.io/erratum.pdf) | `0c883f5ef047fa2c` |
| Besser preprint | [math/0011269](https://arxiv.org/pdf/math/0011269) | `35d1b109d891dea7` |

The reading scope is explicit in the JSON: affected BDMTV pages and arXiv definitions/bibliography; Tuitman assumptions, Frobenius and precision statements, plus the complete one-page erratum; Besser's Lang/fixed-path/composition statements and Corollary 3.2 proof. The Annals article page has no erratum link, and arXiv's submission history lists only v1. Both DOI metadata responses were read. A separate Crossref lookup of the BDMTV DOI returned HTTP 429 and supplies no new evidence; the successful independent article/history/DOI checks are recorded. No full reading of Tuitman or Besser is claimed.

The reviewed library audit was read for NC.2, NC.5, ED.6, R13.4a, CN.4, GZ.8 and HE.7; all are “not built”, with the recorded partial foundations imported. Current NC.2/NC.5 and ED.6 packets are not read for those stages, and RD.7's partial packet certifies Kedlaya, not general Tuitman. Limited searches in Mathlib `082e2d3` and Tau Ceti `f790474` found no Nekovář, Tuitman, Cartan-normaliser or unipotent-connection/path-torsor implementation. The existing library item is unchanged; no new declaration is cited without reading it.

Validation:

- `scripts/check_paper.py`: pass; 75 missing items occur exactly once in eight routes, with no invented planned stage.
- Explicit `check_errata.versions_checked`: pass, including E5's stated-result finding; all thirteen source findings pass `source_issues.check_issues`.
- Read-only errata collector: eight confirmed by the original independent review, five awaiting review; no generated register is written.
- Preservation/hash checks: all 92 original IDs present; 74 item records unchanged; E1–E8 payloads unchanged apart from restored reviews; all seven downloaded source hashes reproduced; original source and unrelated prerequisites preserved.
- In-memory assembled graph: 2,891 endpoints and 8,258 baseline edges, acyclic. Eight proposed existing-owner import directions are acyclic, including HE.7→GZ.8, RD.7→ED.4/ED.6, R13.4a→R13.5/ED.6 and CN.4→ED.6. A temporary test vertex for the pending shared height proposal, fed by Selmer/p-adic Hodge inputs and feeding NC.5, also remains acyclic. This vertex is not written as an atlas stage or claimed as coverage.
- Elementary negative checks: two distinct pointed maps in the n=0 uniqueness counterexample; Riemann–Hurwitz arithmetic for genus one with four involution fixed points gives quotient genus zero. The latter checks arithmetic only, not the source's genus/fixed-point computations.
- `research/blueprint/intake.py check-files` for the exact three deliverables and `git diff --check`: pass.

The original Magma computations, genus/fixed-point proofs, full cited prerequisite proofs and example certificates were not rerun or closed. **No Lean compiled.** The fix is ready for independent `REV-FIX`; it is not independently accepted by this worker.
