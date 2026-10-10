# REV-RelativeFarguesFontaine--RF0~2

**Verdict: accepted.** Codex session `codex-BBQE5k` completed the independent review of revision 2 on 10 October 2026, for [issue #7087](https://github.com/CBirkbeck/tauceti-explorer/issues/7087). This session authored neither input blueprint. This is a completed review, not a checkpoint.

All nineteen objections in the [first review](REV-RelativeFarguesFontaine--RF0.md) have been resolved. Three further corrections were made in place. The [packet](../packets/RelativeFarguesFontaine--RF0.json) records a new verdict for every node and every source finding; the [reader](../readmes/RelativeFarguesFontaine--RF0.md) and [suggested Lean file](../suggested/RelativeFarguesFontaine--RF0.lean) agree with those corrections. Acceptance concerns the target-level plan. Every implementation status remains `unchecked`, and the geometric omissions in the Lean proposals remain explicit.

## Counts and closure

| Item | Reviewed result |
|---|---:|
| Nodes | 73 |
| Verified / corrected / added / unverifiable | 70 / 3 / 0 / 0 |
| Definitions / constructions / theorems / comparisons | 3 / 28 / 36 / 6 |
| API items / proposed unit tests / planets | 137 / 97 / 25 |
| Baseline declarations | 31, all confirmed |
| Sources / source-item routes | 17 / 69 |
| Source findings | 14: 13 confirmed, 1 rejected |
| Explicit gaps / requests | 9 / 19 |
| Scoped stages planned / closed | 8 / 0 |

No node, API item, test or planet was added or removed. No baseline citation was removed or replaced. The exact eight-stage scope agrees with the integrated decomposition and accepted RS-20 restructuring: this extends AdicSpaces as relative period geometry, with RF4 and VectorBundlesAndIsocrystals retaining their later work. Every scoped target has an owned node, an identified import/request or a precise remaining gap. Internal prerequisites are acyclic. The `complete` packet status denotes a finished planning pass under PROTOCOL §0; its eight `planned` stages do not claim supplier implementation or closed proofs.

Every definition/construction has at least three tests. I checked what they test, including torsion ghosts, coefficient congruences, the integral special fibre, repeated legs, the actual quotient unit, disconnected spectra, constructed curve functors and rational module base change. All 137 API names, 97 test names and 73 declaration names occur in the Lean file and reader. The reader's catalogue statements, hypotheses, proof steps, acceptance conditions, API statements and test statements match the packet. Planet counts are within the stage budget, and names describe the mathematical objects or central results.

## Corrections made in this review

1. **Witt diagonal and unramified coefficient action.** The proposed action formerly accepted an unrelated coefficient ring and asserted a bijection to arbitrary ramified Witt vectors. Following FF §1.2.1, printed p.55, it now constructs the composite `W(c) ∘ Δ` from the coefficient ring `W_OE(k)` to `W_OE(A)`, where `c` is the specified coefficient inclusion. The test takes `c=w_0` and checks the identity composite on the actual Witt ring. Packet, reader and Lean are synchronized. Identifying `W_OE(F_q′)` with the maximal unramified coefficient DVR is the stated strict-lift comparison.
2. **Lubin–Tate diamond presentation.** FF Preface Remark 3.19, printed p.38, distinguishes the completed LT-tower product from the product over E. The punctured perfected disc presents `Spd(F) × Spd(E_LT∞)`. Its coefficient-unit reciprocity quotient gives `Y_F`, and the subsequent Frobenius quotient gives the curve. The packet and reader now state both quotients; the Lean comment identifies the omitted geometric descent. The LT torsion tower remains separate from the root extension of the whole ratio `π/[ϖ]`.
3. **Period-sheaf locator.** KL Lemma 5.3.2 begins on printed p.121, before Theorems 5.3.3 and 5.3.6 on pp.122–123. Expanded the cited range to pp.121–123 in packet and reader. The twelve sheaves, nine acyclic variants and three Kiehl cases are unchanged.

The current TauCetiRoadmap ownership note was refreshed to commit `cd03e06852a13216ad246d0623492c4beac39af2`. Historical source-version hashes were retained. Replaced the historical review objects, including inaccurate old reasons for E5, E6 and E9, with this session's independent checks.

## The nineteen previous objections

The table identifies the repaired contracts rather than merely reporting successful elaboration. The packet's per-node notes include the remaining boundaries.

| Previously blocked node | Contract checked in revision 2 |
|---|---|
| ramified-witt-universal-property | Separate all-E strict-lift carrier; equal-characteristic restriction; actual PadicInt complete-DVR comparison with perfect residue input. |
| q-twisted-witt-functor | The same `Q mod π = X^q` hypothesis controls carrier, operations and functoriality. |
| q-teichmuller-lift | That congruence is retained, with the actual adic iteration limit and inverse q-power roots. |
| lubin-tate-teichmuller-lift | Actual FormalGroup laws and shared scalar series on both rings, with convergence; LT module vocabulary remains a named supplier need. |
| integral-rational-chart-rings | Constructed chart and its coordinate maps; denominator unit and topological nilpotence tests distinguish it from the original non-Tate adic ring. |
| root-extension-chart-model | Three linked root streams with identified zeroth terms; variable-only perfection after reduction, and localization before the special-fibre quotient. |
| classical-points-of-integral-period-disc | Evaluation kernels and a distinct Gauss support, tied to the actual constructed points. |
| gauss-disc-fibre | Nonzero convergent power series, coefficient decay and `0<ρ<1`; the strict estimate uses finite-level approximation. |
| div-d-moduli-v-sheaf | Symmetric orbit presheaf, its sheafification and unit; the repeated-leg test distinguishes a discrete sheaf section from stack stabilizers. |
| relative-degree-criterion | Actual product ideal and geometric DVR module-length test; the early integral-family converse is an explicit independent gap. |
| div1-moduli-and-properness | Actual Frobenius orbit presheaf and sheafification; inverse-image base change requires compatible coefficient and Frobenius identifications. |
| lubin-tate-divisor-section | Actual bilateral sum with Frobenius/root hypotheses; translated logarithm and nonzero linear coefficient detect a simple zero and a squared length-two zero. |
| witt-seminorm-lambda-mu | Bounded normalized spectra and constructed maps, with a primitive-quotient nonidentity test. |
| relative-extended-robba-rings | Witt-growth subring and specified interval completion, plus ring and infinity construction. |
| relative-period-presheaves | Rational basis, coefficient, prime, norm, plus and radius data; restrictions and plus inclusion use the same construction. |
| berkovich-period-deformation | Constructed lambda-mu endpoint, fixed image and mu preservation; the disconnected idempotent test involves the actual homotopy. |
| global-period-sheaves-and-etale-functoriality | Global coefficient/radius data; the split test applies the actual curve functor to a coproduct. |
| stein-exhaustion-and-higher-acyclicity | Compatible sections, projections and global-section comparison; complete Banach spaces with dense continuous restrictions support one-minus-shift surjectivity. The imported geometric cohomology vocabulary is explicitly omitted. |
| local-generation-on-period-annuli | Actual finite-projective module rational base change, residue map and neighborhood; source is KL Lemma 5.1.7, printed p.116. |

Additional definition-independent tests criticized in the old report now refer to their constructed topology, chart, quotient, divisor, period ring or curve functor. Missing geometry is named in `suggestedForm` and Lean comments under PROTOCOL §13, rather than represented by arbitrary property fields asserting the conclusion.

## Pinned baseline and current ownership

I read the declaration statements and their enclosing hypotheses at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 31 recorded names exist. The following restrictions matter to their consumers:

| Baseline declarations | Verified provision and limit |
|---|---|
| AdicCompletion; IsAdicComplete; IsAdicComplete.liftRingHom | Ideal-adic completion and compatible lifts into a complete target; finite generation and comparison with analytic completion are retained where required. |
| Algebra.FormallyEtale.comp_bijective; Algebra.FormallyEtale.of_isSeparable | Square-zero lifting and separable coefficient algebras. Successive quotient steps, not arbitrary ideals in one step. |
| LocallyRingedSpace; Scheme; ProjectiveSpectrum; projIsoSpec | Existing algebraic geometry and standard positive-degree Proj opens. Analytic section-covered charts still need their comparison maps. |
| GradedAlgebra | Internal graded decomposition and multiplication; the section algebra supplies its own graded pieces and sign convention. |
| Ideal.span; Ideal.span_singleton_mul_left_unit | Generated ideals and invariance under a unit change of generator; intrinsic conormal lines are not thereby globally trivial. |
| IsDiscreteValuationRing; PadicInt | Local nonfield PID and the actual p-adic integer coefficient ring, its p-generated maximal ideal and complete-DVR instances. |
| IsLocalization | Algebraic localization universal property; plus rings, norms and topological completions are additional data. |
| PerfectRing | Bijective power map under the specified characteristic context; not an analytic perfectoid criterion. |
| PreTilt; PreTilt.untilt; WittVector.fontaineTheta; BDeRhamPlus | Algebraic perfection of O/(p), multiplicative sharp and theta under prime/nonunit/completeness hypotheses, and the p-localized kernel completion. Marked geometric tilts and Cartier kernels require the recorded comparisons. |
| WittVector; WittVector.frobenius; WittVector.ghostComponent; WittVector.teichmuller | P-typical coordinates and maps under the prime hypothesis; no automatic ramified q-coefficient identification or additive Teichmuller map. |
| Valuation | Multiplicative ultrametric valuation; continuity and plus bounds are checked separately. |
| TauCeti.Huber.Pair; TauCeti.ValuationSpectrum.spa | Huber pair and the bounded continuous valuation subset. The structure sheaf and quotient ringed space are not supplied by the carrier. |
| FormalGroup; MvPowerSeries.eval₂ | Existing one-dimensional laws and evaluation. Continuous coefficient maps, summability/HasEval and complete compatible topology remain necessary; LT OE-actions are extra structure. |
| Module.length | Extended-natural module length, used on the actual geometric product-parameter quotient. |
| CategoryTheory.presheafToSheaf | Sheafification under its existence hypothesis with the unit; the orbit construction is a sheaf rather than an action stack. |

The reviewed library audit has no direct RF entry. Relevant AdicSpacesPartII, AdicCoefficientsAndComparisons and BunGAndNewtonStrata rows were read together with the GS0 loop-geometry evidence. Existing p-typical Witt/de Rham carriers and later bundle owners are imported, not proposed again.

I also read the current read-only libraries and roadmap sources. Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already supplies Witt Huber/Tate topology, `spaY`, Frobenius homeomorphism, compact wandering windows, and the open topological quotient `spaX` with its compact/T0 properties. These are documented in `upstreamNotes` as implementation anchors; the all-E, relative-completion and ringed-space payload remains new. Current AdicSpaces Layers 3–6 own rational localization, sheaf foundations, absolute p-typical windows and the absolute quotient. LocalFieldsRamification Layers 2 and 4 own unramified Frobenius and inertia. ClassFieldTheory excludes LT theory.

The nine post-snapshot roadmaps and four Completed roadmaps named in WORKERS were screened in their current README/Suggested files. None already provides the proposed relative ramified Witt, integral root-chart, relative Robba or divisor geometry. In particular the algebraic vector-bundle roadmap does not implement the relative adic targets here.

Exact supplier statements were checked in AdicSpacesPartII R0/R3/R5, DiamondsAndVStacks D0/D2/D3/D5/D6, FarguesFontaineDiamonds F0/F1/F2/F4, PerfectoidSpaces P1/P2/P3 and PadicHodgeTheory R06.1. The important boundaries remain explicit: R0 assumes adic coefficient maps; the integral Witt coefficient map needs its requested extension. R5 splits continuous modules, not rings. D6 currently supplies analytic-Tate Spd, not the requested pre-adic Spd(OE). D3's space descent is not ordinary vector-bundle descent. P1's marked generic untilt classification needs the specified ramified extension. Later VB2/VB3/RF4 and DerivedDeRham owners are outward requests, not early circular prerequisites.

## Public source evidence

Locators below refer to printed pages. These checks support the packet's mathematical claims and findings; this report does not reproduce source passages or give a chapter-by-chapter summary.

| Public text | Evidence checked |
|---|---|
| [Fargues–Scholze](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), 2024 author copy | II.1 pp.47–56; II.2 opening and LT argument pp.57–61; II.2.5 proof p.63; Proj comparison pp.64–67; VI.1.1–4 pp.190–192 and VI.1.10–11 pp.194–195. |
| [Scholze–Weinstein](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf) | Proposition 13.1.1, Remark 13.1.2 and Theorem 13.1.3 pp.108–109; Lemma 17.1.8 and Corollary 17.1.9 pp.150–151; Proposition 19.5.3 and proof pp.180–181. Pre-adic extensions were checked against the supplier boundary. |
| [Bhatt–Morrow–Scholze](https://arxiv.org/abs/1602.03148) | Lemma 3.10(ii) pp.22–23 and Lemma 3.21 p.27: the integral root/Frobenius criterion and almost integral-elements comparison. |
| [Stacks 09XI](https://stacks.math.columbia.edu/tag/09XI), [09ZL](https://stacks.math.columbia.edu/tag/09ZL) | Henselian lifting and finite-etale equivalence, including the proofs and adic-completeness use. |
| [Kedlaya–Liu II](https://arxiv.org/abs/1602.06899), v3 | Appendix A pp.189–191; corrected Theorem 3.3.13 and Remark 3.3.14 pp.61–62, including strict-kernel injectivity and inverse maps. |
| [Fargues–Fontaine](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), 2017 author copy | §1.2 pp.53–58 for Witt, diagonal, twisted and LT constructions; perfect strict-lift context; §1.4 pp.63–65 for norms/topology; Preface Remark 3.19 p.38. |
| [Kedlaya–Liu Foundations](https://arxiv.org/abs/1301.0792), v5 | Definition 3.3.2/Lemma 3.3.3 p.76; primitive conventions p.88; §§5.1–5.5 pp.113–132; Proposition 8.2.20 pp.163–164, Definition 8.3.4 p.166, Lemma 8.7.15/Remark 8.7.16 p.180; Conjecture 8.8.20 pp.186–187. |
| [Fargues divisor paper](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf) | Definition 2.6 p.6 and Proposition 2.18 p.11, including its later Picard/Banach–Colmez dependencies; this does not close the early all-E converse. |
| [Hansen–Kedlaya](https://kskedlaya.org/papers/criteria.pdf) | Definitions 7.1/Remark 7.2 p.24 and Lemmas 7.3–7.5 p.25: continuous module splitting, weighted Tate presentation and sheafiness. |
| [Kedlaya A-inf](https://arxiv.org/abs/1602.09016) | Hypothesis 3.4/Definition 3.5 p.7, Proposition 3.6/Theorem 3.8 pp.8–9 and Example 3.14 p.10; stable uniformity is not transferred to unsupported rings. |
| [Kedlaya Witt geometry](https://arxiv.org/abs/1004.0466) | §4 pp.19–23 and Definition 7.5/Theorem 7.8 with proof pp.33–34 for seminorm extension and the actual deformation. |
| [Zhu](https://annals.math.princeton.edu/2017/185-2/p02) | §0.5 pp.411–412: coefficient extension over Witt vectors of the residue field on perfect algebras. |
| [Bhatt–Scholze Witt Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf) | §9 p.36: the coefficient convention preceding Definition 9.1. |
| [Guo–Reinecke](https://par.nsf.gov/servlets/purl/10534610) | Theorem 4.15 proof pp.74–75: both analytic ends of the punctured A-inf input. |
| [Scholze period rings](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeTheory.pdf) | Definition 6.1, Lemma 6.3 and Corollary 6.4 pp.35–36: affinoid completion over a characteristic-zero perfectoid field and its principal regular kernel. |
| [Corrected FF author copy](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), 2018 | Lemma 1.2.3 p.7 and Proposition 1.4.9 p.16, checked through indexed public text for the Frobenius placement and leading exponent. |
| [FS Fargues author copy](https://webusers.imj-prg.fr/~laurent.fargues/Geometrization.pdf), 2021 | II.1.1 p.48, checked through indexed public text for the corrected whole-ratio root coordinate. |

Fourteen public source files were downloaded in this run, and each SHA-256 matches the corresponding recorded value. The three IMJ-hosted copies (Fargues divisors, corrected FF and FS2021) could be read through publicly indexed text, but direct binary requests failed. Their historical hashes were retained and were **not** independently revalidated here. No unavailable published Astérisque text was used to broaden a finding beyond the named author/preprint version. No restricted book was needed.

## Independent source-finding verdicts

All fourteen finding review objects now name `REV-RelativeFarguesFontaine--RF0~2`.

| Finding | Verdict | Check |
|---|---|---|
| E1 | confirmed | FS2024 II.1.1 p.48 reverses the ratio required by the chart relation; FS2021 has the bounded whole ratio. |
| E2 | confirmed | FF2017 Lemma 1.2.3 p.55 places the Frobenius iterate incorrectly; outer ghost index `fn−1` and FF2018 p.7 put it before the comparison. |
| E3 | rejected | FS II.1.10 p.52 already requires membership in the open disc, excluding radius one. |
| E4 | confirmed | KL v5 Conjecture 8.8.20(b) pp.186–187 cannot give a uniform Tate ring to a squared simple-zero divisor with nonzero nilpotent. No claim about unavailable published text. |
| E5 | confirmed | KL Lemmas 5.2.8/5.2.10 pp.118–119 have decomposition sign slips. These are not listed in KLII Appendix A, contrary to the previous review reason. |
| E6 | confirmed | KL Corollary 5.2.12 p.120 needs the iteration factor in the eigenweight exponent; KLII Appendix A p.190 corrects that estimate, not Lemma 5.2.10. |
| E7 | confirmed | KL primitive convention p.88 needs the zeroth coefficient to be a unit, as explicitly added by KLII Appendix A p.190. |
| E8 | confirmed | KL Lemma 5.5.5 p.131 needs the x expansion coefficient and spectral norm; KLII Appendix A p.191 supplies those replacements. |
| E9 | confirmed | KL Proposition 8.2.20 p.164 needs named targets for the finite-etale map and open immersion; KLII Appendix A p.191 supplies them. The previous review reason described a different correction. |
| E10 | confirmed | KLII Appendix A p.190 reports the old incomplete proof; Theorem 3.3.13/Remark 3.3.14 pp.61–62 restore injectivity. |
| E11 | confirmed | KL Lemma 5.5.2 p.128 must initialize the residual at the element being expanded, not zero. |
| E12 | confirmed | Leading product exponents add in FF Proposition 1.4.9 p.64; the corrected 2018 proof p.16 agrees. |
| E13 | confirmed | KL Lemma 5.5.2 p.129 expands an element of the extension ring over S, not merely the base ring over R. |
| E14 | confirmed | KL Proposition 5.5.3 p.129 needs a scalar period ring, not the finite-etale category in its place. |

No additional source finding was added. E11/E13/E14 and the conjecture finding remain scoped to arXiv v5. Mathematical formulas and paraphrases are recorded in our own words; source passages are not reproduced.

## Seven handed red-team findings

| Finding | Resolution checked |
|---|---|
| RT-AREA-padic-1/3 | Integral/pre-adic Spd(OE) is a D6 extension request, separate from analytic-Tate Spd(E); no nonexistent supplier node is cited. |
| RT-AREA-padic-1/8 | P1 owns marked generic untilt classification. The all-E ramified primitive/Cartier extension is explicit, with fixed-Qp F4 only an anchor. |
| RT-AREA-padic-1/16 | Div1 over F_q uses Spd(E)/Frobenius; over the algebraic residue closure it uses the completed unramified coefficient field and a compatible base-change comparison. |
| RT-AREA-padic-1/17 | Div1 construction does not assert its later representability/properness. The precise VB3 general-BC request records that owner and inputs. |
| RT-AREA-padic-1/18 | Whole analytic union and generic intersection remain distinct; whole-locus algebraicity belongs to RF4. The independent two-chart boundary Cech input precedes the LT section. |
| RT-AREA-padic-1/20 | R06.1 is an affinoid p-typical comparison under its geometric hypotheses; the relative completion and intrinsic filtration are not defined by the field-only model. |
| RT-AREA-padic-2/21 | P1 supplies the marked theta/primitive-kernel comparison and R06.1 the affinoid period comparison. Integral characteristic-p legs are retained; conormal lines need not be globally free. |

## Validation and orchestrator handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/RelativeFarguesFontaine--RF0.json`: **0 errors, 0 warnings**.
- Embedded findings passed `source_issues.check_issues` and `check_errata.versions_checked`. The standalone errata CLI is for a separate errata-v1 document, not this packet.
- Reader/packet catalogue and Lean declaration/API/test name checks passed; substantive test contracts were checked as described above.
- `lean-check research/blueprint/suggested/RelativeFarguesFontaine--RF0.lean`: **exit 0**, 352 warnings, all declarations using `sorry`; no errors or other warning classes. Available memory was 110 GB. One check ran at a time and no check remains running.
- The shared build is the supplied pinned build. Its Mathlib HEAD equals the full recorded pin; both direct Tau imports and their 14-file transitive Tau import cone are byte-identical to the recorded Tau pin. No library build, update or language server was started.
- Only this issue's four deliverables and its own handoff note were changed. No upstream or atlas data was edited or promoted.

No review correction remains. Packaging can proceed under the normal supplier-tier/bundle rules. The nine recorded mathematical gaps and nineteen requests remain work for their owners: LT/Cohen input, all-E norm and coefficient tensor extensions, pre-adic and ordinary-descent interfaces, independent early degree factorization, strict completion base change, geometric completion comparisons and later global moduli/Proj properties. They must remain visible in the package. There is no new higher-tier ownership move. See the [handoff](../handoff/REV-RelativeFarguesFontaine--RF0~2.md) for the next worker's entry point.
