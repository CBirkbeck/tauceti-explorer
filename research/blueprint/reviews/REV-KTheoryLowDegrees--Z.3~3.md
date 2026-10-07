# Independent review: KTheoryLowDegrees Z.3–Z.6, round 3

**Accepted as a finished planning pass.** Codex, session `codex-aqyVCP`, independently reviewed revision `BP-KTheoryLowDegrees--Z.3~3` for [issue #7070](https://github.com/CBirkbeck/tauceti-explorer/issues/7070), on 7 October 2026. This session did none of the original plan or its revisions. The claim was [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/7070#issuecomment-6044048933).

All 260 nodes are justified: 240 verified and 20 corrected. There are no added or unverifiable nodes, no removed or replaced baseline citations, and no unresolved packet/reader contradiction. Acceptance covers mathematical statements and planning contracts. Three supplier gaps, 16 requests and 31 explicit native omission contracts remain open; every implementation is unchecked. The full suggested file did **not** elaborate.

## Counts and scope

| Item | Independently checked |
| --- | ---: |
| Nodes in Z.3 / Z.4 / Z.5 / Z.6 | 152 / 43 / 40 / 25 |
| Definitions / constructions | 19 / 53 |
| API items / tests on those 72 nodes | 450 / 280 |
| API items / tests including the additional lemma owner | 455 / 283 |
| Exact-pin declarations, Mathlib / Tau Ceti | 217 / 158 |
| Distinct cited module files | 172 |
| Distinct node source locator/excerpt pairs | 292 |
| Direct external node / stage contracts | 45 / 13 |
| Source issues, all confirmed by this review | 30 |
| Planets in Z.3 / Z.4 / Z.5 / Z.6 | 6 / 6 / 5 / 1 |
| Native node omissions, omitted / partial | 30 / 1 |

I read the complete packet, reader, suggested file and omission contracts, the round-2 review and round-3 revision handoff, the relevant reviewed library audit, accepted RS-18, both supplied red-team findings, and the upstream GrothendieckEulerForms and SchurWeyl documents. Every definition/construction has at least three meaningful tests. The planets name central definitions, constructions and theorems, within the six-per-stage bound.

`complete` means the finished pass under the 300-node budget. Z.4 is `source_decomposed`; Z.3, Z.5 and Z.6 are `planned` with precise remaining work. No stage is closed. Source-decomposition coverage and conditional supplier contracts do not assert implemented theorems.

## Prior requested repairs

The round-3 revision carries all eleven mathematical/source/supplier corrections from the round-2 review into the reader. In particular, it distinguishes the actual-projective top exterior determinant formula from virtual rank-zero classes, retains the necessary index-ideal prerequisites, supplies the regular-curve resolution/localization route, corrects the skyscraper source page and principal-divisor sign, and uses the actual degree-zero ring functor.

The elementary projective-line calculation imports S.5's basis but no S.6/S.7 operations: for `z=1−[O(−1)]=[O(1)]−1`, `z²=0`, `λ_t(dz)=1+dz·t/(1+t)`, and `γ_t(dz)=1+dz·t`. Thus the higher γ-filtration and SK₀ vanish in this example without the old circular dependencies.

The two contradictions that caused the round-2 `needs_changes` are repaired. Reader E13 now identifies the plus-normalized Witt correction as already known in Weibel's author errata. E14 gives the author's **positive** exponential in that normalization; a negative exponential is explicitly limited to the separately retained minus convention. The packet and reader agree.

## Corrections made in this review

1. **Z.3/exterior-extension-filtration.** The proof said images commute with scalar extension by right exactness. Right exactness only supplies a surjection from `S⊗Fⁱ` onto the filtration of the base-changed first map. It need not preserve the injection into `S⊗⋀ⁿM`. The statement, proof, API and native documentation now specify equality of images; flatness of S or a split original sequence gives the stronger isomorphism. For example, `2ℤ↪ℤ` with `S=ℤ/2`, `n=i=1`, has nonzero `S⊗2ℤ` but zero image in `S⊗ℤ`. The existing native range-equality signature already expresses the correct generality and is retained.
2. **Z.3/determinant-kills-gamma-two.** Both binomial coefficient sums are bounded by `j≤min(n, k)`, avoiding negative coefficient indices. The generating-function sum is finite, `1≤j≤n`, and rank zero is handled first. Factors γ⁰ are discarded before separating the single-factor and multiple-factor cases. For `n≥1`, the exponent series is `t(t+(1−t))^{n−1}=t`; consequently its coefficients in degrees at least two vanish. The native theorem statement is unchanged.
3. **Z.4/pic-norm.** Cohen Proposition 2.2.13 is printed p. 82, physical PDF p. 96, in the 11 July 2001 manuscript, rather than printed p. 81/PDF p. 95. The corrected source comparison records denominator clearing for its fractional-ideal proof (E29). The construction continues to transport the pinned `ClassGroup.relNorm`, so the flawed printed proof is not an imported prerequisite.
4. **Seventeen test labels.** Five `value` and twelve `example` kinds become the protocol kind `computation`. Their names and mathematical statements are unchanged. The affected nodes are:

   - Z.3/integral-comodule-generic-map, integral-comodule-residue-inclusion, integral-comodule-generic-quotient, integral-comodule-euler-reduction and integral-comodule-decomposition-map;
   - Z.3/graded-line-groupoid, graded-line-tensor, graded-line-inverse, graded-line-pullback, forget-grade, projective-graded-det and ring-spectrum-det;
   - Z.6/scheme-spectrum-det, witt-supported-input and witt-supported-det;
   - Z.3/lambda-ideal and lambda-line-element.

The reader includes each correction. Suggested Lean edits are documentation and omission-test labels; no native mathematical declaration is changed or replaced by a proposition-valued surrogate. Previous review/version receipts remain historical records, and the current review supplies all 260 verdicts and all 30 errata verdicts.

## Sources and additional findings

All 292 distinct node locator/excerpt pairs were checked in their public source context, including hypotheses. A normalized text screen matched 216; the other 76 required actual page/formula/context inspection. A literal match on a common word was not used as a substitute for reading the cited passage.

The readings include the relevant passages of Weibel's [2012 Chapter I](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf), [2012 Chapter II](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf), and [29 August 2013 combined author draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf); [Cohen's 11 July 2001 manuscript](https://www.math.utoronto.ca/~ila/Cohen%20--%20Advanced%20topics%20in%20computational%20number%20theory.pdf); the published [Serre scan](https://www.numdam.org/item/PMIHES_1968__34__37_0.pdf), including every cited context on printed pp. 37–52; Soulé's [journal archive](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427), §1.1–1.6; [Milne's version 3.08 notes](https://www.jmilne.org/math/CourseNotes/ANT.pdf?download=1); [Totaro's arXiv v1](https://arxiv.org/pdf/math/0207210); [Bhatt–Scholze v3](https://arxiv.org/pdf/1507.06490v3), pp. 18–20, 24–25, 54–59; the Handbook §5.2 class-group passage; and all cited Stacks tag contexts. Download hashes and bounded reading scopes are appended to `sourceVersions` and the reader. The new Soulé hash differs from the historical receipt. Author drafts, preprints and published texts remain distinguished; no full publisher/preprint collation is claimed.

I independently checked the mathematical reasons and source contexts of E1–E28, including rank-zero, nonzero-ideal and disconnected-ring boundaries, the invalid transfer composite, finite-free-stalk counterexample, divisor signs and valuation centres, and the BS17 smooth-lifting gap. Their current `review.by` is this job. Cohen's [three-page author errata DVI](https://www.math.u-bordeaux.fr/~hecohen/errataadv1.dvi) was decoded and read. The Weibel errata PDF returned 404; the search-indexed opening page corroborated the known E4/E13/E14 corrections. This is not a full fresh errata-PDF reading.

Two additional mistakes are recorded and confirmed:

- **E29, Cohen Proposition 2.2.13 proof, printed 82/PDF 96.** The proof asks for integral β with the valuations of a fractional ideal I. With `L=K=ℚ` and `I=(1/2)ℤ`, it requires `v₂(β)=−1`, impossible for an integer. Dropping integrality alone does not fix the earlier membership argument when fractional valuations above a base prime cancel. First make `δI` integral, prove the integral case, then divide element norms by `N(δ)`. The norm-span theorem remains true. This is an error affecting the proof, scoped to the manuscript read. The author page, all public DVI errata pages and targeted primary-source searches yielded no existing correction; no publisher-edition claim is made.
- **E30, Stacks [0FDJ](https://stacks.math.columbia.edu/tag/0FDJ), Derived Categories of Schemes Lemma 38.5 proof, physical `perfect.pdf` p. 99, ed88ff78.** The second acyclic sequence should continue to `F^{a+2}`, the Euler-class sum needs `(−1)^n`, and the constructed cone is `C(a)`. Exactness, alternating cancellation and the named chain map determine the corrections. The current HTML retains them, has no comments, and its [history](https://stacks.math.columbia.edu/tag/0FDJ/history) lists no proof change after August 2019. Targeted official-domain correction searches found none. These are misprints affecting nothing; the packet and supplier already use the correct alternating Euler characteristic.

No finding is inferred from a source's missing hypothesis without checking its standing context. In particular, an arbitrary augmented λ-ring example was rejected as an attack on K-book II Theorem 4.8 because the source works under its positive structure/splitting-principle assumptions.

## Baseline, closure and ownership

I read all 375 declaration statements, including enclosing hypotheses, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, and checked every consumer. All citations exist and supply the claimed interfaces at the required generality. Particular checks include right-comodule coefficient base change, flat tensor exactness, finite local bases, invertible-module evaluation, complete orthogonal idempotents, binomial-ring torsion freeness and the projectivity required by Euler-class independence. No citation needed removal or replacement.

Direct supplier closure was checked against 45 actual external nodes and 13 stage contracts, rather than name matching. Existing SplitK0, ExactK0, Cartan maps, module Euler classes, class-group norms and divisor constructions are reused. Ring K₀ and representation exact K₀ are distinguished; a free underlying comodule is not assumed projective in its comodule category. The source and pinned finite-hull argument retain a **free** integral coefficient coalgebra. The GL coefficient square does not itself supply integral freeness, categorical/K₀ transport or equality of arbitrary-field character images. These remain in the Serre gap.

Vector bundles use the exact Grothendieck group and finite local bases. Pullback exactness comes from locally split bundle sequences. The regular-curve route uses affine diagonal in dimension at most one, resolution, the actual K/G comparison and generic localization, and permits nonseparated curves. Picard duality/coherence for arbitrary schemes remains a supplier request; the regular-curve divisor dictionary is proved separately. The coherent determinant/support interfaces require more than H.5's homotopy-category surface or SF.1's fpqc/fppf surface; those additions remain precise requests and rescope proposals, not supplied theorems.

Both confirmed red-team findings are represented correctly:

- **RT-AREA-ktheory-1/31.** The doubled line is a valid regular-curve example with vector-bundle K₀ and G₀ both ℤ². The doubled plane supplies the failure of the vector-bundle/coherent comparison outside the resolution-property hypotheses. The GeneralAlgebraicKTheory K.3 owner correction stays in `upstreamNotes`; this job does not edit that roadmap.
- **RT-AREA-ktheory-2/41.** No S.6/S.7 prerequisite is imported. Abstract λ-ring algebra stays in Z.3; the early vector-bundle foundations do not import S.2/S.3. Enhanced perfect/support determinant comparisons are downstream in Z.6. Existing atlas edge removals and the early sub-layer proposal remain assembly/maintainer work under RS-18, rather than being falsely reported as applied by this review.

## Validation and remaining work

`python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--Z.3.json` reports **0 errors and 0 warnings**. Independent structural checks also cover unique/current verdicts, test-kind enums, the internal prerequisite DAG, unchanged baseline identifiers, reader field parity, suggested node/API/test names and all 31 omission contracts. Small coefficient calculations check the repaired finite determinant sum and the rank-zero boundary.

`lean-check` was attempted in the shared build and stopped before any declaration at the missing prebuilt import `TauCeti.Algebra.AlgebraicGroup.GeneralLinear.DiagonalTorus.Basic`. Its Mathlib pin matches; the Tau Ceti checkout does not match the recorded Tau Ceti pin. No existing build at both pins was available. No library build, cache operation or language server was started. Accordingly, this review makes no successful whole-file elaboration claim.

For the orchestrator: retain the three explicit supplier gaps and precise stage remaining lists, arrange the owner/assembly work described above, and obtain full-file elaboration when a build at both pins is available. There is no unresolved question preventing acceptance of this finished planning pass. This review neither applies promotion nor changes another job's files.
