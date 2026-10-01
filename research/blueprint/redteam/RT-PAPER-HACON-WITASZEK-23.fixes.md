# Hacon–Witaszek: confirmed red-team fixes

Job `FIX-RT-PAPER-HACON-WITASZEK-23`, [issue #5522](https://github.com/CBirkbeck/tauceti-explorer/issues/5522). Worker: Codex — codex-J6LwjP, 1 October 2026. This fixes the confirmed findings in the extraction and reader. Extraction completeness does not mean implementation or proof closure.

## RT-PAPER-HACON-WITASZEK-23/1

Added proof-gap source issue E12 against published Proposition 5.8, p.26, and `gap-embedded-transfer`, explicitly linked from `embedded-to-birational`. The P¹/A¹ example shows that the intermediate morphism cannot exist on the entire projective modification: H⁰(P¹,O)=k. It does not refute the proposition's conclusion, since A¹ already supplies a resolution.

The replacement plan maps first to a projective compactification Ȳ, principalizes the exceptional and boundary ideals under an explicitly stronger regular-ambient hypothesis, and restricts to the inverse image of Y. Properness over Y follows from the base-change square, even though the source open need not be proper over the ground field. Regularity, Cartier divisor structure and snc supports restrict to the open. The resolved compactification-boundary components lie outside it; the exceptional/inverse-W loci are restrictions of the resolved ones. In a local integral ring, invertibility of the product of the nonzero ideals implies invertibility of each factor by fractional-ideal inversion, so simultaneous principalization gives the individual divisor conditions.

The remaining transfer of the printed fixed-X hypothesis to the new regular ambient X1 is not supplied by the source and is left in the explicit gap. A provisional variant quantifies over all relevant regular ambient varieties and is labelled stronger than the printed proposition. A justified simultaneous construction entirely on X would be another way to close the gap. Neither is silently treated as a consequence of the printed hypothesis. The separate stronger non-snc-blowup construction used by the MMP is preserved.

The existing SF.4 route owns this interface; no new owner is needed. Pinned Mathlib already supplies properness under base change and restriction to a target open (`AlgebraicGeometry.IsProper.isStableUnderBaseChange` and the instance `IsProper (f ∣_ V)`, Proper.lean:72–85). These statements were read at commit 082e2d3; this fix reuses them. The reviewed SF.0/SF.4 audit and the actual SF.4 description were read. No upstream roadmap or library-status claim is changed.

## RT-PAPER-HACON-WITASZEK-23/2

The verifier confirmed parts (a) and (b), but explicitly rejected (c). The generated issue still requests all three; this fix follows the actual verified verdict, as required for confirmed red-team work.

- **(a), E13:** `echoes` now defines every recursive centre as the new exceptional divisor intersected with the strict boundary component over the generic point of C. It never takes another strict transform of the blown-up C. AHK07 v2 Example1.4, p.3, supplies this construction. The existing tests for ordinary discrepancy k(1−b), the b=0 endpoint and unique-boundary-component condition are unchanged.
- **(b), E14:** `witt-fourfold` defines `f_S=f∘u:S→Z` and the normalized version with codomain Z. The rational-Witt ideal sequence and higher direct images are used on Z, with the later Z→X pushforward and Leray step separate. A typed-target regression and the existing `gap-witt` supplier link are explicit. The intended theorem conclusion is unchanged.
- **(c), no erratum:** `partial-terminalization` removes its unsupported instruction to correct source ambient symbols. It spells out the valid comparison through `Δ_𝒴≥0` and the crepant equality in Claim6.8(4). For exceptional vertical E, `A_(𝒴,0) ≥ A_(𝒴,Δ_𝒴) = A_(𝒳,0) = A_(𝒳,X)+ord_E(X)>1`. Generic terminality treats the remaining divisors. The analogous computation using `(𝒴,Y)` is a valid alternative, not a source correction. This matches the verifier's page-image check.

All E1–E11 objects, including their accepted review verdicts, are unchanged. E12–E14 are new worker records awaiting independent review; no self-review verdict is inserted. All affect the proof, not the main MMP conclusions.

## Sources and correction search

On 1 October 2026 the [published Cambridge PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C2E369C389C6A7DFAD5F8FDEBE6AC4D1/S2050508623000069a.pdf/on-the-relative-minimal-model-program-for-fourfolds-in-positive-and-mixed-characteristic.pdf) was obtained (35 pages), SHA-256 `171a75813724cfb72fe0868dcf7ee73ca55a0586d1d28050d1a8297bb7a55afe`. Its per-download footer explains the changed hash. Only selected pp.12,19,25–26,29–30 were read for this fix; page images12,19,26,30 were inspected. Earlier whole-paper reading remains attributed to its original workers.

Selected [arXiv v2](https://arxiv.org/pdf/2009.02631v2) pp.13,21,28–29,33 were read, SHA-256 `161c63089dadc8f9aecd3da1753563fe8f7f9fc2b2722952307cd19bacda7c66`; published Proposition5.8 is preprint Proposition5.7. [AHK07 v2](https://arxiv.org/pdf/math/0605137v2) pp.3–4 were read, hash `1d1e5642fdb7b2a2c04ccf9800de13c7b3649eed344034538142116f09c7cf28`. Neither full collation nor positive-characteristic transfer of all AHK proofs is claimed.

The [arXiv history](https://arxiv.org/abs/2009.02631), [author publications page](https://sites.math.northwestern.edu/lro1793/publications.html), Crossref API metadata for DOI10.1017/fmp.2023.6 and bounded title/author correction searches were checked. No matching correction was located. The article-record renderer hit its content-length limit; the version-of-record PDF was accessible and checked. This search is bounded, not proof that no correction exists. Each new source issue records this exact scope.

## Validation and handoff

The paper checker and intake checker pass on the three authorized deliverables. The audit preserves all 163 item identities/statuses, all nine routes and all E1–E11 source records; 148 missing items remain routed once. Every item prerequisite and gap reference resolves, and the dependency graph is acyclic. There are 14 source issues and 15 named gaps, with the new fixed-X transfer gap explicitly recorded rather than closed.

Exact arithmetic regressions check the echo recurrence for rational b<1, the discrepancy comparison with an effective divisor and positive integer fibre order, and projective-line chart compatibility: a polynomial in t equals a polynomial in s=t^{-1} on the overlap only when both are constant. A typed morphism-composition check keeps S→Z distinct from S→X. These finite diagnostics support the stated guards, not a proof of resolution or geometric Witt vanishing. The mathematical P¹/A¹ argument and open-base-change reasoning are written above; no Lean file was authorized or compiled.

The 11,634 exact checks comprise 4,950 recurrence steps (b=n/d, 2≤d≤31, 0≤n<d, k=1,…,10), 120 effective-discrepancy inequalities (plt log discrepancy 1/100,1/5,1,3/2; fibre orders1,…,10; effective orders0,1/4,2), 6,561 pairs of degree≤3 chart polynomials with coefficients−1,0,1, and three target-composition checks. Source-issue and source-version schemas also pass. These ranges are reproduction data, not an assertion that the finite checks replace the general arguments.

This is a complete fix of the confirmed extraction defects. The remaining source proof gap is handed to the existing SF.4 design through its item and gap; no additional owner or blueprint closure is invented. Ready for independent `REV-FIX` review.
