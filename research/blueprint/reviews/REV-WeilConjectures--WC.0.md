# Independent review: Weil conjectures, WC.0–WC.5 and the two WC.5 children

Job `REV-WeilConjectures--WC.0`, issue #503. Reviewer: Claude (Opus 5.5), session `claude-bN4pb9`, 6 October 2026. This session did not write or review the input: the planning pass `BP-WeilConjectures--WC.0` was done by Codex, session `codex-JaHWMR` (PR #6648, building on checkpoints #2943 and #2961).

**Verdict: accepted.** Every node is verified, or corrected in place where the fix was clear. All 57 baseline citations are confirmed at the pins, and no contradiction remains. The packet stays `complete`. WC.0–WC.5 and WC.5:surface-alternative are `planned`, and WC.5:power-sum-converse is `closed`; those statuses are correct. The seven gaps are precise, and they concern actual geometric carriers that do not exist yet, not missing planning. This accepts a plan. It certifies no implementation, and it does not close the suppliers' original proofs.

## Counts

| Item | Input | After review |
| --- | --- | --- |
| Nodes | 54 (3 definitions, 47 theorems, 4 lemmas) | 54: 10 verified, 44 corrected, 0 added |
| Baseline declarations | 57 | 57, all confirmed; none removed or replaced |
| API items / unit tests (definitions) | 15 / 13 | 19 / 14 |
| Requests / gaps | 12 / 7 | 12 (SF.1 extended) / 7 (two corrected) |
| Source issues | 10 | 12: 10 with verdicts (E5 partly rejected), 2 added |
| Planets | 30 (at most six per stage) | 30, unchanged |
| Source citations with a literal excerpt | 0 of 76 | 80 of 80 (four citations added) |
| Suggested Lean file | 74 `sorry` warnings, nothing else | 79 `sorry` warnings, nothing else (5 added declarations) |

Most of the 44 corrections are corrected locators. Ten nodes needed a change of substance, listed next.

## Corrections made in place

1. **Excerpts.** Every one of the 76 source citations had a one-word placeholder as its excerpt: "Frobenius" (Deligne I, 19 times), "27." (Milne, 14 times), "cohomology" (BFP 14 times, vdBE 6 times), "Layer", "Lemme.", "Theorem" and "theorem". These verify nothing. Each one is now a literal excerpt (at most 300 characters) read at the cited locator. Deligne I's excerpts were read from the page images, because the Numdam text layer is unreliable OCR.
2. **Locators.**
   - Milne's rationality descent is Lemma 27.9 on printed pp.156–157, not pp.157–158.
   - BFP Proposition 7.4 is on p.12, not p.11. The BFP definition used for the configuration coefficient is Definition 7.3, on pp.11–12.
   - vdBE Lemma 4.1 and its proof are on pp.6–7, not pp.7–9.
   - The Deligne I locators now name the paragraphs that carry the content: the point/orbit dictionary is (1.4) a)–d) and (1.4.1), not (1.1.1)/(1.2)–(1.3); the definition of geometric Frobenius is (1.15).
3. **PR196 convention bridge.** The bridge between pullback by the scheme q-Frobenius, the arithmetic descent action and geometric Frobenius is FrobeniusGeometry **Layer 7**, which EllAdicRealization Layer 8 consumes. It is not in Layers 4–5. The proof step and locator of `WC.0/geometric-frobenius-realization-comparison` and gap 3 are corrected.
4. **PR196 does not construct twisted forms.**
   - Gap 2 credited "TraceFormula Layers13,15" with "effective finite-order twists", and `WC.1/twisted-frobenius-point-comparison` cited Layer 15. At head `4bd7237`, Layer 15 is the worked curve factorization. Traces compatible with finite group actions are Layers 11 and 14, and no PR196 layer constructs a twisted form X^σ.
   - Correction: the gap and the locator now say this. Effective finite-order Galois descent of quasi-projective schemes is added to the existing `SchemeAndStackFoundations:SF.1` request, whose stage text is effective descent. SF.1 is added as a prerequisite of the twist node. ModularCurves 0E proves effective descent only for affine schemes, polarised relative curves and its other listed cases.
5. **Zeta integrality.** PR196 TraceFormula Layer 13 defines Z(X,t) over Q, by the exponential. The proof step that relied on "the supplier's locally finite integral construction" now derives integrality from the Euler product: each factor lies in 1+T·Z[[T]], and the product is coefficientwise finite.
6. **Hasse–Weil sieve.** `WC.1/hasse-weil-sieve-for-curve-families` required a *flat* family. BFP Proposition 7.5 has no flatness hypothesis, and the proof is fibrewise over V(F_q). The extra hypothesis narrowed the source statement, so it is removed.
7. **Source of the reciprocal-pairing step.** `power-sum-converse/reciprocal-pairing-forces-equality` cited Yu's negative-power lemma, which says nothing about reciprocal pairings. Its source is now Mustață Remark 3.7, the argument the node formalises. Mustață's equations (3.11)–(3.12), which are the actual generating-function and pole argument, are added as a second source of the four generating-function nodes.
8. **Library and baseline bookkeeping.** The two numerical nodes added in this pass gave the module `TauCeti/FiniteSpectrum`. The other twelve nodes in the same namespace use `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, so the two now do too. The little-o node's Lean citation now points to the Vandermonde source entry.
9. **API and tests** (marked `"addedBy": "REV-WeilConjectures--WC.0"`). Both definitions are used for exactly these facts, and the suggested file now states all five additions.
   - `groupoidMass_sum`: additivity of mass. BFP 1.3(i) needs it for stratifications.
   - `groupoidMass_actionCategory`: orbit–stabiliser, mass = #Y/#G. This is the numerical content of BFP 1.3(ii).
   - `groupoidMass_regular_action`: a test that catches summing over objects instead of isomorphism classes. None of the existing tests could tell the two apart.
   - `signedConfigurationCoefficient_sumCongr`: multiplicativity under disjoint union, BFP (9).
   - `signedConfigurationCoefficient_generating`: the generating polynomial is ∏ over orbits of (1−T^{#O}).
10. **Upstream notes.** Reformatted to the protocol's `{"roadmaps", "note"}` shape. Only the PR196 note concerns a Tau Ceti roadmap; the other two are marked atlas-internal.

## Source issues

All findings were checked at their locators in the texts listed under "Texts read".

| Finding | Verdict | Check |
| --- | --- | --- |
| E-WC0-1 Milne 27.5, logarithm over any field | confirmed | The displayed identity divides by m; F_p fails at m = p |
| E-WC0-2 Milne 27.10, "< 1" | confirmed | The argument only excludes > 1; take f = 1/(1−t) |
| E-WC0-3 Milne 27.14(c) proof | confirmed | 1 ∓ √2·t inside Q_7; (c) needs Galois stability, as in Deligne I p.277 |
| E-WC0-4 BFP 3.1 proof, d for s | confirmed | Read in arXiv v2 p.6 and the version of record p.1330 |
| E-WC0-5 Mustață Lemma 3.8 / (3.10) | confirmed in part | The g/q misprints are real. **The (3.10) claim is wrong and was removed**: the printed log Z = Σ log(1−ω_i t) − log(1−t) − log(1−qt) is correct |
| E-WC0-6 Kedlaya Def. 5.1.3 / Lemma 5.1.4 | confirmed | Reciprocal-root conventions, partner index and the N = 0 term |
| E-WC0-7 Kedlaya §5.2 matrix | confirmed | Re-expanded. The printed final bound fails for y² = x³+2x over F_5 (N = 2) |
| E-WC0-8 Kedlaya Lemma 5.2.3(2) | confirmed | With degree-e fibres the printed inequality fails for D = A−B, e = 2 |
| E-WC0-9 Kedlaya Theorem 5.1.5 | confirmed | The printed range is empty; the corrected range was re-derived |
| E-WC0-10 BFP Definition 9.1 | confirmed | Second example, geometrically irreducible: y² = x³+1 over F_7 with C₃ acting by x ↦ 2x has cubic twists with 12, 9 and 3 points |
| **E-WC0-11** (new) Mustață p.22 | confirmed | "ga² − ab(q+1−N₁) + gqb²" should read "+ab". Affects nothing |
| **E-WC0-12** (new) BFP §9.1 | confirmed | "There is a unique twisted form" fails for σ of infinite order. Twisting forces σⁿ = 1, and σ(x,y) = (y, x+y²) on A² has infinite order. Same text in the published version; the Annals page lists no erratum |

The Kedlaya HTML could be read with browser request headers. Its hash, `d87e8981…877f`, is added to `sourceVersions`.

## Mathematics checked

- **Numerical child.** Checked the Vandermonde recovery (orientation and the explicit β = (2,−2) inverse), the R = 0 and R > 0 branches, the grouped weights, and the characteristic-zero multiplicity step. Checked the formal identity over rings with zero divisors, the Laurent comparison and the pole criterion. The little-o and graded-moment lemmas agree with vdBE Lemma 4.1 in its range d ≤ r ≤ 2d and extend it as stated.
- **Functional equation.**
  - Re-derived P_i(1/(q^dT)) = (−1)^{b_i}det F_i·q^{−db_i}T^{−b_i}·P_{2d−i}(T), the multiplier (−1)^χΔT^χ, and Δ² = q^{dχ}.
  - Re-derived ε = (−1)^{b_d}(det F_d/q^{db_d/2})^{(−1)^d}. This gives +1 for odd d, and (−1)^{N₊} for even d, where N₊ is the generalized multiplicity of +q^{d/2}. This matches Deligne (2.6), read at the page image, and Milne 27.13.
  - The base-extension sign is (−1)^{(r+1)χ}ε^r.
  - Recomputed all examples: point, two-cycle, P¹, P², genus two.
- **Integral factors.** Deligne I's proof of (1.7)⇒(1.6), pp.276–277, read in full: Hankel descent, Fatou, Galois stability and Gauss. The generic extractor has the all-embeddings hypothesis it needs.
- **Surface route.** Recomputed every intersection number, D², E², D·E and orthogonality to A+B. The bound follows by Hodge index. The branch's ancestors avoid DWP.1, DWP.4, WC.3 and the RH-based WC.5 nodes.
- **BFP and vdBE.**
  - Propositions 1.3, 3.1, 7.1, 7.4 and 7.5, Remark 7.6, §9.1–9.2, Definition 9.1, Proposition 9.3 and Remark 9.4 read.
  - vdBE Theorem 2.1, Proposition 3.1, Lemmas 4.1–4.2 and the Minkowski step read.
  - Each node keeps or correctly sharpens the source hypotheses. The R06.2 request (pst with trivial constituents ⇒ unramified) holds in the stated generality: all slopes are zero, which forces N = 0.
- **Arithmetic checks.**
  - Möbius counts for A¹/F₄: 4, 6, 20.
  - Stack masses: B(C₂) = 1 and [A¹/G_m] = q/(q−1).
  - The nonreduced double-line sieve.
  - The elliptic recurrence and S₂ = a² − 2q.

## Baseline, closure, requests

- **Baseline declarations.**
  - All 57 were read in their modules at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` (the shared build's package checkout) and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` (read with `git show` from the commit object). Each exists under the cited name, and its hypotheses fit its use.
  - Notable hypotheses: `mem_virtualCharacters_iff` needs an algebraically closed field and invertible |G| (so it is applied over C). `repRingCharacter_injective` needs only a finite group and characteristic zero. `charpoly_inv` needs `IsUnit A`. `FiniteField.Extension` needs a positive degree. `hasProd_prod` carries the summation-filter argument of this pin.
- **Prerequisites.**
  - Every prerequisite chain ends in the baseline, in an own node, in a cited node of DWP.0/DWP.1/R06.5 or the integrated DWP.7 node (statements read), in a requested stage, or in a recorded gap.
  - The DWP.0 and R06.5 packets are still `partial` and unreviewed. Citing their node ids follows PROTOCOL section 3, but those statements could still change.
- **Requests.** All 12 were read against their suppliers' stage texts. The RG2.3 request follows the accepted PAPER-LIPNOWSKI-TSIMERMAN-18 routing of Lang's theorem. The SF.1 request, which now also covers twisted forms, is within SF.1's effective-descent scope.
- **Scope and coverage.**
  - The reviewed library audit (AUDIT-19) shows nothing for these stages that the packet plans again.
  - RS-17's narrowed scopes are respected.
  - Every target of every stage in scope is realised.
  - Every item from the maintainer-added sources for these stages is covered: BFP, Deligne I (1.1.1)/(8.1) and Yu. Schröer belongs to WC.7.

## Suggested Lean file

The file was compiled with `lean-check` in the shared build at the pinned Mathlib `082e2d37e8`, before and after the review's additions. The input gave exit 0 with 74 warnings, all `declaration uses 'sorry'`. The reviewed file gives exit 0 with 79 such warnings and nothing else. It imports only Mathlib, so no Tau Ceti module was elaborated.

Mathlib's `Groupoid (ActionCategory G Y)` instance does not yield `IsGroupoid` by instance search at this pin, and there is no `IsGroupoid` instance for a sum of groupoids. The two new mass lemmas therefore take that instance as an explicit argument, and their docstrings say so. The 25 geometric declarations the packet omits remain omitted, each with its recorded reason. That follows section 13's rule against stand-ins.

## Questions for the orchestrator

1. **Reader document.** `research/blueprint/readmes/WeilConjectures--WC.0.md` is outside this review's edit paths. It does not list the four added API items or the added test, and it repeats the removed claims: "flat" in the sieve, Layer 15 for twists, and the (3.10) remark. A follow-up edit of the reader should bring it into line with the reviewed packet.
2. **PR196 registration.** Gaps 2–4 can become prerequisite links only once PR196's layers have stable atlas identifiers.
3. **Unreviewed suppliers.** The packet imports eight nodes from the unreviewed `DeligneWeightsAndPurity--DWP.0` and `PadicHodgeTheory--R06.5` packets. If their reviews change those statements, the WC nodes that use them need re-checking.
4. **Later paper routes.** PAPER-SHENDE-TSIMERMAN-17 routes 9–10 (accepted) and PAPER-CARO-PASTEN-23 route 9 (unreviewed) point at WC.1, WC.2 and WC.5 but were not sources of this job. Their curve-zeta, reciprocity and curve-RH items correspond to `curve-zeta-numerator-without-rh`, `signed-zeta-functional-equation` and `curve-and-elliptic-bound-comparison`. Any extra comparison they need belongs in a later pass.

## Texts read

| Source | Version and hash (SHA-256) |
| --- | --- |
| Deligne, Weil I | Numdam PDF, `8392b345…8f42e5`; pp.273–277, 279, 281–282 and 301 as page images; the rest of §§1–2 and §8 from the text layer |
| Milne, LEC | v2.21, `ac4f122f…1c01077`; §27, pp.155–160 |
| BFP | arXiv v2, `36beb2d3…346758`; published author copy, `9843c296…b2d134bd3` (pp.1330 and 1351 collated) |
| vdBE | arXiv v3, `46559f04…442b3b`; §§2–4 |
| Mustață, zeta notes | `d83d5617…253b45`; pp.21–22 as page images |
| Yu | arXiv v5, `9383bcde…de1c`; Appendix C, the lemma and its proof, pp.80–81 |
| Kedlaya, Lecture 5 | HTML, `d87e8981…877f` |
| PR196 | TauCetiRoadmap head `4bd72379658126cbe9be935656396f0c9dac4de0`; FrobeniusGeometry, TraceFormula, EllAdicRealization, EtaleBaseChange and ComplexComparison READMEs, and the family README |
