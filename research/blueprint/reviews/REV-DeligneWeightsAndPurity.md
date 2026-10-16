# REV-DeligneWeightsAndPurity

**Verdict: accepted after correction.** Claude (Opus 5.5), session `claude-C5RmmL`, 16 October 2026. Refs #9920. This session wrote neither the whole-roadmap plan (BP-DeligneWeightsAndPurity, session `claude-qmSWO4`, #9918) nor either imported part.

Reviewed the [whole-roadmap packet](../packets/DeligneWeightsAndPurity.json), its [reader](../readmes/DeligneWeightsAndPurity.md) and its [suggested Lean file](../suggested/DeligneWeightsAndPurity.lean). The packet's `review.checked` gives one verdict for each of the **76 effective targets**: **58 verified, 18 corrected, none added, none unverifiable**. All eleven stages stay **planned**, none closed, with 27 supplier requests and 2 gaps. Implementation statuses stay `unchecked`.

## What the plan is

The packet carries 6 own targets and an `assembly` record. The effective plan consists of:

- the 70 surviving targets of the accepted parts `DeligneWeightsAndPurity--DWP.0` (reviewed by REV-…--DWP.0~2, 2026-10-08) and `DeligneWeightsAndPurity--DWP.7` (REV-…--DWP.7, 2026-10-06);
- `assembly.importedPrerequisites` (47 lists) and `assembly.importedNodeCorrections` (now 37 nodes) applied to those 70 targets;
- the 6 new targets.

The 65 targets that EtaleDualityAndPerverseSheaves EDC.7 took over on 2026-10-14 are retired. The effective plan has 56 theorems, 13 lemmas, 4 definitions and 3 constructions. Its 7 definitions and constructions carry 61 API items and 34 tests, at least three each. There are 27 planets, at most six per layer (DWP.9 has six). This review checked the effective plan, not the historical part files, which still show the retired targets until their next revision.

## Assembly and graph

- **Hashes.** Both part packets (`d0b8ae53…`, `6f7839db…`) and EDC.7 (`c5ccec9d…`) match `assembly.imports` and `ownershipTransfer`.
- **Inventory.** The 70 imported and 65 retired ids are exactly the 135 part nodes, and the metadata of `importedNodes` matches the parts.
- **Retired targets.** `retiredByTransfer` agrees with EDC.7's `ownershipTransfers` in all 65 entries, except one receiving target, now corrected (see Corrections).
- **Receivers.** Each retired statement was compared, assertion by assertion, with its receiver; a Sonnet subagent made the first pass, and I judged every flag. Fifty-nine are covered verbatim or nearly so. Six differ, but only harmlessly:
  - positivity is stated for real rather than rational coefficients, a generalisation;
  - π†π = q is stated without the polarisation formula it is equivalent to;
  - two convention or pointer remarks are omitted;
  - the q-Frobenius was mapped to the stage `SF.0`.
- **Effective graph.** I checked it by script.
  - Every prerequisite resolves to a node or stage that exists; every stage prerequisite has a request.
  - No retired id is cited anywhere in the effective text or prerequisites.
  - Every citation outside this roadmap is to Mathlib, Tau Ceti or a roadmap of tier 10 or below in `upstream/CaraianiNewton.md` (this roadmap is tier 11).
  - Restricted to the roadmaps of the order, the graph through this roadmap has no cycle. The only cycle through DWP in the whole atlas runs through WeilConjectures and FunctionFieldArithmetic, which are consumers outside the order, and LefschetzPencilsAndVanishingCycles LPV.5's upward FA.5 citation.
- **Prerequisite rewrites.** All 47 replacement lists were diffed against the parts. Every removed retired citation is replaced by its receiver; the other changes swap WeilConjectures/FunctionFieldArithmetic citations for the moved-down nodes, and each was read.

## Corrections

| Target or field | Correction and reason |
| --- | --- |
| DWP.3/function-field-chebotarev | Re-derived the degree-r bound from Kosters. The proof summed "over the classes of the smaller group"; Kosters's estimate is per element, so the sum is over γ ∈ C, with #C ≤ #N bounding the genus term and ramified places changing the count by at most R. Locators now give arXiv v2 (Theorem 1.2, Corollary 1.3, Lemmas 1.5–1.6, pp. 2–6), the latest version, with v1's numbers. The source record moves to v2. |
| DWP.0/weight-separated-factor-extraction | Milne locator narrowed from 27.14(c)–(d) to 27.14(d); Milne's argument for (c) is incomplete (E11). |
| DWP.0/rational-zeta-descent-and-fatou | Recorded that Milne's proof of 27.10 prints a strict inequality (E10). |
| DWP.7/purity-of-smooth-proper-dm-stacks | The non-example "B𝔾_m-type stacks have mixed weights" was wrong: B𝔾_m is not Deligne–Mumford and its cohomology is pure. Replaced by 𝔾_m, whose H¹ = ℚ_ℓ(−1) has weight 2. |
| DWP.10/finite-field-sato-tate | Weil II (3.5.7) is stated over a normal geometrically connected base of dimension N with normalisation q^{−nN} ((3.5.1), pp. 210–212); the node had narrowed it to curves. Statement and proof restored to that generality. |
| DWP.10/frobenius-equidistribution | Proof credited "DWP.7's" compact-support bounds; Weil II 3.3.1/3.3.10 are EDC.7's. Now names DWP.7/cohomological-bounds-3-3-2-3-3-6 and EDC.7/weight-iota-mixed-direct-image-3-3-10. |
| Eleven further imported targets | Their text still credited DWP.0, DWP.5, DWP.6, DWP.7 or the stage SF.0 for results that EDC.7 (or SF.0/absolute-frobenius) now owns: Weil II (1.8.9)–(1.8.11), (1.11.1), the monodromy-weight interpretation, Weil numbers, the eigenvalue multiset, punctual purity, sharp curve purity and the base-extension property of Frobenius. Each now names the owning node, which was already among its prerequisites. The targets are DWP.8/intermediate-direct-image-purity-6-2-5cd, DWP.8/weight-decomposition-modulo-z-3-4-1-i, DWP.8/punctual-weight-filtration-3-4-1-ii, DWP.8/potentially-pure-lisse-sheaves-are-semisimple-3-4-12, DWP.8/nearby-cycles-preserve-mixedness-6-1-13, DWP.10/mixed-nearby-and-newton-exports, DWP.7/integral-sheaf (API), DWP.7/newton-couples-3-3-7, DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves, DWP.2/coarse-bound-on-compact-cohomology and DWP.1/the-frobenius-and-points-over-extensions. |
| DWP.6/compact-support-curve-bound | Its proof claimed to feed the dévissage of Rf_! "in DWP.7". That dévissage is now EDC.7's and does not use it; the step is rewritten. |
| assembly.retiredByTransfer, restructure, coverage | DWP.1/frobenius-endomorphism-over-a-finite-field now goes to the node `SchemeAndStackFoundations:SF.0/absolute-frobenius`, which EDC.7's transfer and the surviving prerequisite lists name, instead of the bare stage. The DWP.1 import list in the reader also mislabelled A6/frobenius-semisimplicity. |
| requests | The LPV.7:invariant-cycles request cited the retired DWP.8/potentially-property-p-3-4-10; it now cites EDC.7/weight-potentially-property-p-3-4-10. |
| incomingRequests | Added answers where the answering node exists: EDC.7/weight-local-monodromy-purity (FiniteFieldsAndCharacterSums DWP.5; LPV DWP.5), EDC.7 eigenvalue and trace targets (FFCS DWP.8), DWP.7 proper purity and DWP.4 Theorem 1.6 (GlobalShtukas DWP.7), and DWP.7 proper purity with EDC.7 endomorphism weights (WeilConjectures DWP.10). Notes say where the rest lives: AbelianSchemes A6 for P(π_A) = 0 and isogeny invariance, and the consumer for Honda–Tate. A Sonnet first pass compared every request with its answers. |
| maintainerSources | (3.5.7) note updated for the restored generality; YU-23/041 also points to the acceptance suite, which checks the reciprocal pairs. |
| baseline | Removed 24 entries cited only by retired targets; all 24 are in EDC.7's baseline. |
| restructure | Added two rescope entries: two overlaps with lower-tier EDC.7 targets, and the eventual tier-10 owner of the curve Chebotarev theorem; see Questions. |
| Lean file | Two tests of the new section were tautologies (`¬ Even 3`; a commutativity identity) and are replaced: `swapped_lines_count` now computes the fixed-point counts c₃ = 0, c₂ = 2 of the swap; `weight_separation_needed` exhibits the two families and shows that their weight-one factors differ. `elliptic_seven_points` is added and computes #E(𝔽₇) = 5 by enumeration. All three are proved. |

## Sources

Read at the locators of the new and corrected targets, from public copies whose SHA-256 sums match the packet:

- Weil I: §1 (1.4)–(1.7) with the proof of (1.7) ⇒ (1.6), pp. 274–277; §6 (6.5)–(6.13), pp. 296–298; Théorème (8.1), pp. 301–302.
- Weil II: (3.3.4)–(3.3.11), pp. 206–207; (3.4.9)–(3.4.14) and (3.5.1)–(3.5.7), pp. 210–212.
- Kosters, arXiv:1404.6345: v1 in full, with p. 2 checked on the page image; v2 in full (SHA-256 `a7576fd7…`).
- Milne, LEC v2.21: pp. 155–159, with pp. 158–159 checked on the page images; the author's errata page.
- Bergström–Faber–Payne, arXiv:2206.07759v2: pp. 6–7.

All prose added is my own. No source excerpt or section-by-section summary was added. The imported targets keep the source checks of their accepted part reviews. Of them, I re-read at their locators those whose assembly changes touch the mathematics: DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 (Weil II (3.3.9), (3.3.11)), DWP.3/exceptional-frobenius-set-has-density-zero (Weil I (6.13)) and the two DWP.10 equidistribution targets.

The new targets:

- **rational-zeta-descent-and-fatou.** (a) is the Hankel/linear-system descent of Weil I p. 276 and Milne 27.9. (b) is Milne 27.10 with the bound ≤ 1. (c) is the global normalisation; Deligne calls it "un lemme de Fatou".
- **weight-separated-factor-extraction.** Weil I p. 277: coprimality from purity, a Galois-stable root set, then rational and, by Gauss, integral coefficients.
- **integral-cohomological-factors.** Weil I Théorème (1.6), which does not assume geometric connectedness.
- **point-count-bounds.** Weil I (1.5.1) with purity; the endpoint traces are the permutation counts c_r and c_r q^{dr}.
- **purity-of-smooth-proper-dm-stacks.** Weil II (3.3.11), with the algebraic-space step left as the recorded gap.
- **function-field-chebotarev.** Kosters, as corrected above.

I recomputed the worked examples by hand, among them #E(𝔽₇) = 5 for y² = x³ + x + 1 and the factors of ℙ¹ over 𝔽_{q²} viewed over 𝔽_q.

## Source issues

The packet had none of its own; the parts' E1–E8 (DWP.0) and E2–E6 (DWP.7) were confirmed by their reviews and are inherited by reference. Added, with confirmed verdicts:

| Entry | Finding |
| --- | --- |
| E9 | Kosters v1 Corollary 1.2 (p. 2) sums over all places; as the proof shows, only rational places are meant, and the sum over all places diverges for a geometric extension. Misprint, corrected in v2 Corollary 1.3. |
| E10 | Milne LEC v2.21, proof of Lemma 27.10 (p. 158), concludes that the reciprocal roots satisfy \|c\| < 1; the argument gives ≤ 1, which is what is needed, and f = 1/(1 − t) attains equality. Misprint; nothing on the errata page. |
| E11 | Milne LEC v2.21, Summary 27.14(c) (p. 159), deduces integer coefficients of the factors from pairwise coprimality for one ℓ, because their reciprocal roots are algebraic integers. That only gives algebraic-integer coefficients in ℚ_ℓ: over ℚ₇, 1 − 2t² = (1 − √2 t)(1 + √2 t). Rationality needs the Galois-stable description of the roots that purity provides (Weil I p. 277). The proof of (d) as written goes through (c). Gap affecting the proof; nothing on the errata page. |

## Baseline and libraries

The 21 remaining baseline entries were confirmed by name in their modules at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474` (the lean-check build). The four the plan added were read in full and supply what their nodes use:

- `PowerSeries.ext`;
- `IsIntegrallyClosed.eq_map_mul_C_of_dvd`, Gauss's lemma for a divisor of a monic integral polynomial, applied to the monic reverse of a constant-term-one factor;
- `IsGalois.mem_range_algebraMap_iff_fixed`, for a finite Galois extension;
- `norm_sum_le`.

The other 17 were confirmed for their citing nodes by the part reviews. None of the new targets is in the libraries: Mathlib has power series and Gauss's lemma, but no Fatou lemma for rational series, no zeta-factor extraction and no function-field Chebotarev theorem. The six new targets are owned nowhere else after the moves recorded in restructure entry 2.

## Closure, requests and gaps

Every planned stage's targets are effective nodes or EDC.7 imports listed in its coverage. The 27 requests are those of the parts, restricted to surviving consumers, plus one new contract to EDC.1:biduality. Each is precise, and each supplier is at tier 10 or below or is Tau Ceti. Both gaps are honest:

- the unavailable geometric carriers of the suggested signatures;
- Weil II (3.3.11) for proper algebraic spaces with quotient singularities, which the stack-purity target needs.

## Red-team findings

- **RT-AREA-etale/1.** Weil II §3.5 is planned at DWP.10 (frobenius-equidistribution, finite-field-sato-tate). Its inputs are DWP.5's abstract equidistribution and EDC.7's compact form, and the sublayer DWP.8:equidistribution is proposed in restructure. Schiffmann's [D1] label and half-twist normalisation are the parts' E2–E3. The Katz–Sarnak universal-curve monodromy is left to the LPV Part II. Correct.
- **RT-AREA-etale/9.** The edge is now EDC.7 → RD.6, since Weil numbers and ι-weights moved to EDC.7, and DWP.10's export text now says so. Correct.

## Lean

`lean-check research/blueprint/suggested/DeligneWeightsAndPurity.lean` at the pinned build gives exit 0 and 131 warnings, all for proofs left open; there are no other diagnostics before or after the test changes. The file now has 1,995 lines. It imports only Mathlib, and its new section matches the packet's new targets. Weil I Theorem 1.6, stack purity and Chebotarev are stated in the reader only, because their carriers are not at the pins. The EDC.7-owned definitions it restates are listed in its name ledger.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/DeligneWeightsAndPurity.json --index <pinned declarations.tsv>`: 0 errors, 0 warnings. The checker sees only the 6 own nodes; the effective-plan checks above were made by script.
- The reader was synchronised with every correction by replacing each changed field's rendered text inside its node's section, using the reader's own escaping. A lint of the added lines finds no unintended emphasis, mathematics or links.

## Questions for the orchestrator

1. **Retired ids cited elsewhere.** Fourteen packet files of eleven other roadmaps still cite 29 retired DWP ids and should be repointed to their EDC.7 receivers (the mapping is `assembly.retiredByTransfer`):
   - EtaleDualityAndPerverseSheaves EDC.4;
   - LefschetzPencilsAndVanishingCycles LPV.7;
   - WeightsInEtaleCohomology;
   - PadicDifferentialEquationsAndRigidCohomology (whole packet, RD.6, RD.7);
   - WeilConjectures WC.0, WC.6;
   - DeligneWeightsAndPurityPartII;
   - ExcursionOperatorsAndSpectralAction ES7;
   - EndoscopicTransferAndUnitaryTraceComparison ET.0;
   - EllipticModularityEffectiveComparisons;
   - HilbertModularVarietiesAndShimuraCurves R18.4;
   - LogarithmicPotentialTheoryAndAlgebraicIntegers.

   The EDC.4 and LPV.7 citations are in this roadmap's tier-10 bundle and resolve once repointed.
2. **The part files** still contain the retired targets (restructure entry 1). The accepted package and Tau Ceti draft #929 predate the transfer, so a package revision should follow this effective plan.
3. **Overlaps (new restructure entry).** DWP.6/compact-support-curve-bound is the case Y = Spec 𝔽_q of EDC.7's Weil II 3.3.1 together with sharp curve purity. DWP.8/intermediate-direct-image-purity-6-2-5cd is the codimension-one case of EDC.7/intersection-complex-purity (b). Neither has a consumer. The entry keeps them as named Weil statements whose proofs cite EDC.7.
4. **Owner of the curve Chebotarev theorem.** LPV.5 (tier 10) cites FA.5 for the same finite-quotient Chebotarev theorem (Weil II 4.4.5–4.4.7) that this plan moved down to DWP.3 (tier 11). A further restructure entry proposes that the tier-10 bundle own it when LPV's citations outside the order move down, with DWP.3 importing it then. Until that revision DWP.3 owns it, and LPV.5 must not cite it upward.
