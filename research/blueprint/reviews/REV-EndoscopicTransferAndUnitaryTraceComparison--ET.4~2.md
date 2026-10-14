# Independent review: Endoscopic transfer and unitary trace comparison, ET.4 (revision 2)

**Verdict: accepted.** Review `REV-EndoscopicTransferAndUnitaryTraceComparison--ET.4~2`, issue #9762, by Claude (Opus 5.5), session claude-YeeGju, 2026-10-14. I did none of the planning (`BP-…--ET.4`, Claude claude-d0gQRk; `BP-…--ET.4~2`, Codex codex-tcAXQG) and none of the first review (`REV-…--ET.4`, Codex codex-qDQYFW). The verdict covers the ET.4 plan: a complete target-level pass with ET.4 *planned*. It certifies no proof that the recorded gaps leave open, and nothing here is formalised.

## Scope and counts

The revision under review held 78 nodes: the 33 ET.4 targets and 45 ET.5/ET.6 targets carried over unchanged from the first pass (I checked that they were byte-identical to the state the first review left). It had 156 API items, 92 tests, 18 planets, 18 gaps and 14 requests.

The reviewed packet has **34 nodes, all in ET.4**: 26 theorems, 2 definitions, 5 constructions and 1 application; 50 API items, 30 unit tests, 6 planets, 1 baseline declaration, 9 gaps and 5 requests. Verdicts: **16 verified, 17 corrected, 1 added, 0 unverifiable**. `python3 scripts/check_blueprint.py` (with the pinned declaration index) reports 0 errors and 0 warnings.

### Why the 45 ET.5/ET.6 records were removed

The packet's scope is ET.4 alone. Since the revision was written, the refined ET.5 packet (#9806) and ET.6 packet (#9809) plan those layers under new ids, and both ask that the coarse records not be published beside them (ET.5's supersession mapping: "rather than publish parallel definitions"; ET.6's restructure entry: "Do not publish both coarse and refined owners"). An accepted packet is promoted as it stands, and a later edit goes live only after another accepted review, so accepting this packet with the coarse records would have published two owners for ET.5 and ET.6. The coarse records were also the ones the first review had left with real closure gaps (upward BG/IG imports, the missing Igusa prefix, full Weil–Deligne factors), which the refined packets address and this packet never did. They were removed; their last reviewed text stays in the history of this file.

`provenance.supersededInheritedNodes` lists all 45 removed ids with their successors (the ET.5 packet's mapping; the ET.6 handoff's table). The accepted ET.6a packet still cites fourteen of them. It is not a file of this job, so it was not edited; its next edit (the roadmap assembly, whose outputs include it) must retarget:

| Removed id | Successor | ET.6a consumers |
| --- | --- | --- |
| `ET.5/acceptable-test-functions` | ET.5/acceptable-functions-with-geometry | `ET.7b/csnc-test-functions` |
| `ET.5/jb-endoscopic-levi-data` | ET.5/effective-levi-endoscopy | `ET.7b/newton-reduction` |
| `ET.5/transfer-at-p` | ET.5/acceptable-levi-pushforward | `ET.7b/csnc-test-functions`, `ET.7b/newton-reduction`, `ET.7b/red-trace-duality` |
| `ET.5/igusa-endoscopic-test-function` | ET.5/p-test-function | `ET.7b/csnc-test-functions`, `ET.7b/red-trace-duality` |
| `ET.5/acceptable-functions-determine` | ET.5/central-shift-character-separation | `ET.7b/red-trace-duality`, `ET.7b/signed-igusa-trace` |
| `ET.5/unitary-igusa-trace-formula` | ET.5/unitary-stable-specialization | `ET.7b/signed-igusa-trace` |
| `ET.6/zelevinsky-classification` | current SR.5.3 classification; full-wd-parameter consumes it | `ET.7a/local-unitary-base-change` |
| `ET.6/segment-wd-parameter` | segment-wd-adapter; special-block-factor-formulas | `ET.6a/tower-conventions`, `ET.6a/fs-normalization-contract` |
| `ET.6/llc-characterizing-properties` | functorial-weil-parameter; full-wd-correspondence | `ET.6a/tower-conventions` |
| `ET.6/drinfeld-level-deformation-spaces` | drinfeld-deformation-instance | `ET.6a/lubin-tate-tower` |
| `ET.6/full-wd-local-langlands` | full-wd-parameter; full-wd-correspondence | `ET.6a/tower-conventions`, `ET.6a/global-extraction`, `ET.6a/fs-normalization-contract`, `ET.7a/local-unitary-base-change` |
| `ET.6/semisimple-langlands-parameter` | semisimple-trace-parameter; inner parameter via inner-form-standard-parameter | `ET.6a/fs-normalization-contract` |
| `ET.6/local-jacquet-langlands` | esi-jacquet-langlands | `ET.6a/tower-conventions`, `ET.6a/global-extraction`, `ET.6a/fs-normalization-contract`, `ET.7/division-inner-form-check` |
| `ET.6/badulescu-langlands-jacquet-map` | additive-langlands-jacquet; jacquet-induction-quotient | `ET.7b/newton-reduction`, `ET.7/division-inner-form-check` |

Until then those fourteen prerequisites of ET.6a do not resolve when ET.6a is checked. The published atlas is not broken by this (unresolved cross-packet references are skipped when layers are linked).

Gaps and requests that served only the removed records (nine requests: R07.2, H1 formal-adic comparison, LPV.6, EDC.5, EDC.6, ClassFieldTheory layers 7 and 9, SR.5, AL.3; ten gaps) left with them; the refined ET.5/ET.6 packets carry their own. Sources used only by those records (Shin 2009, Zelevinsky 1980, Atobe–Kondo–Yasuda, Newton–Thorne, Badulescu) were dropped with their version receipts.

## The first review's requests

The first review (needs_changes) asked for: (1) the algebraic/Igusa prefix planned in ET at the current tier; (2) exact lower-tier geometric suppliers; (3) newvector and full Weil–Deligne factor inputs, archimedean base change and Hecke-character realizations; (4) the primary proof chains; (5) an updated reader. Items (1)–(3) concern ET.5 and ET.6 and are now handled in the refined ET.5 packet (ownership move of the G-isocrystal and Igusa prefix) and ET.6 packet, which have their own reviews (#9763, #9764); within ET.4 the archimedean dictionary for strong cyclic base change is imported from AF.1/archimedean-llc-gln, as the revision did. Item (4) is recorded honestly in the ET.4 gaps. Item (5) is done: the reader is regenerated from the corrected packet.

## Sources checked

Every source the ET.4 targets cite was fetched; the SHA-256 of each file equals the receipt in the packet (Liu–Tian–Xiao–Zhang–Zhu read only in the maintainer-cleared copy, nothing copied). Kottwitz 1986 and the Clozel–Labesse 1999 appendix have no text layer and were read on the page images.

| Source | Locators checked | Result |
| --- | --- | --- |
| Caraiani–Scholze, arXiv:1909.01898v2 | §5.2 p. 68, §5.4 pp. 69–72 (Prop. 5.4.2, Lemmas 5.4.3–5.4.4, Rem. 5.4.5), §5.5 pp. 72–74 (5.5.1, Prop. 5.5.1, Def. 5.5.2, Lemma 5.5.3, Rem. 5.5.4) | Agree; §5.2's exponents ε(n_i) are for even rank 2n only (see corrections); E2 confirmed |
| Caraiani–Scholze 2017, Annals | §5.3 Prop. 5.3.1–5.3.3; §5.5 pp. 745–746 | Agree; general-rank twist ε(n−n_i) |
| Shin 2011, author copy | §3.1 pp. 11–14 (Lemma 3.1, Rem. 3.2), §3.2 p. 14, §4.5 pp. 26–30 (Prop. 4.5, Cor. 4.7, Prop. 4.8, Rem. 4.10, Lemma 4.11, Cor. 4.14) | Lemma 3.1 does not give ker¹ = 1 in general (corrected); E4 confirmed |
| Shin 2010, author copy | (1.2) p. 4, (7.3) p. 26, Thm. 7.2 p. 27 | Agree |
| Kottwitz 1984, Duke | §5 (5.1.1)–(5.2.3) pp. 625–626, (4.2.2) p. 623 | Agree |
| Kottwitz 1986, Math. Ann. (images) | §9.1 p. 391, §§9.2–9.5 pp. 392–393, Thm. 9.6 p. 393, (9.6.1)–(9.6.6) pp. 394–395, Lemma 9.7 p. 396 | T_e misdefined in the packet (corrected); central-complement target honest |
| Lai 1980, Compositio | Thm. 7.1 pp. 186–187, §7.2 pp. 187–188 | "Theorem 7.2" is §7.2 (corrected) |
| Arthur I/II 1988 | I: (2.1), (3.1), Cor. 8.3, Prop. 9.1, Cor. 9.2; II: §1 p. 505, Thms. 3.3, 4.4, 5.1, §6, Thm. 7.1, Cor. 7.4 | Arthur II has no Theorem 6.4 (corrected) |
| Kottwitz–Rogawski 2000; Delorme–Mezo 2008 | KR intro p. 804, §6 Thm. 1; DM §7 Thm. 3, §9 Thm. 4 | Agree; KR assumes the archimedean trace Paley–Wiener theorem |
| Clozel–Labesse 2011, Clay 13 | Thm. 2.2 p. 109, Lemma 3.2, Prop. 3.3 pp. 111–112, §4 and Thm. 4.1 pp. 112–113, Thm. 5.1 pp. 113–114 | Wording and pages corrected; E3 re-attributed |
| Clozel–Labesse 1999 appendix, Astérisque 257 pp. 119–133 (added source) | Thm. A.1.1 p. 121, p. 120 | E3 confirmed there |
| Morel, arXiv v2 | Def. 3.1.1 p. 50, Prop. 8.2.3 and proof pp. 133–135, Rem. 8.2.4, Lemmas 8.2.5–8.2.6 | Agree |
| Clozel 1987, CJM; Kottwitz Clay 2005 | Thms. 1–3 pp. 153–154, §3.4; pp. 394–396, §7 | Agree |
| Arthur–Clozel 1989, Clay scan | Ch. 1 §§1–2, Def. 6.1, Thm. 6.2 p. 51, Props. 6.6–6.9 pp. 58–61, Lemma 6.10 p. 62; Ch. 3 Thm. 3.1 p. 201, Thm. 4.2 p. 202, Prop. 4.4 p. 210, Thm. 5.1 p. 212, Thm. 6.2 p. 215, Cor. 6.5 p. 218 | Three stale page references corrected |
| Labesse 1999 and 2011 | 1999 Prop. 2.5.3, Thm. 3.3.1, Prop. 3.3.2 as recalled by CSnc; 2011 Thm. 4.12 p. 40, Thm. 5.1 pp. 41–42, (*) p. 42, Cor. 5.3, Thm. 5.4 | Agree; one locator corrected |
| Scholze, arXiv:1010.1540v1 | §8 Lemma 8.1, Rems. 8.2–8.3 p. 19, Cor. 10.1 p. 26, Thm. 10.5 p. 27 | Agree |
| KMSW, arXiv:1409.3731v1 | Intro p. 6, Thm.* 1.6.1 p. 80, Prop. 1.6.2 p. 81, §1.6.3 p. 81, §1.6.4 pp. 86–87, Thm.* 1.7.1 p. 88, Rem. 1.7.2 p. 89 | Scope wording and one label corrected |
| Gee–Taïbi 2019; BCGP | Prop. 6.1.7, Rem. 6.1.8, Thm. 7.4.1; §1.6, §1.8.22 | Agree |
| Mœglin–Waldspurger 1989; Tadić 1986 | §I.1.1(3) pp. 607–608; §2.5 p. 346 | Basis of the added node |
| LTXZZ (cleared copy) | Prop. C.3.1 p. 363, Lemma D.2.2 p. 369 | Agree |

## Corrections

1. **Tamagawa numbers of G_n⃗** (`tamagawa-number-formula`). The packet said ker¹(ℚ,G_n⃗) is trivial for all these groups, so τ(G_n⃗) is the component count. Shin 2011 Lemma 3.1 only embeds ker¹(ℚ,Z(Ĝ_n⃗)) in a group of order 2 (order 1 when [F⁺:ℚ] is odd and some block is odd), giving τ(G_n⃗) ∈ {2^r, 2^(r−1)}; Remark 3.2 fixes the value when every block is even or [F⁺:ℚ] is odd. The case [F⁺:ℚ] even with an odd block is open in the sources; it is now stated so, recorded in the Tamagawa gap and in coverage, and the coefficients carry the ratio.
2. **Parity of the L-morphisms** (`base-change-groups`, `unramified-transfers`). The twist exponents ε(n_i) and N(n₁,n₂) were copied from Caraiani–Scholze's non-compact §5.2, which works with G_{2n}. In rank N the exponents are ε(N−n_i) (Shin 2011 §3.2; Caraiani–Scholze 2017 pp. 745–746); they agree with ε(n_i) only for even N, and the plan claims every rank. Corrected, with a new discriminating unit test `zetaLMorphism.parity` (N = 3) and its Lean form.
3. **Kottwitz's elliptic term** (`elliptic-stabilization`). T_e was written as τ(I₀) times a sum over adelic classes with e(γ) and no κ-sum. Replaced by Kottwitz's §9.1 definition (rational classes, τ(I_γ), component factor) and its (9.6.1) regrouping; the locator now gives §9.1 and Theorem 9.6 p. 393.
4. **Arthur II "Theorem 6.4"** (`twisted-trace-formula`). There is no such theorem: §6 is a convergence estimate (Lemmas 6.1–6.4, Corollary 6.5). The ordered spectral expansion is Theorem 4.4; statement, proof step, locator and source sections corrected.
5. **Lai 1980** (`classical-simply-connected-tamagawa`). The quasi-split result is §7.2, deduced from Theorem 7.1; wording and locator corrected. Lai §7.2 records the classical groups treated by Tamagawa, Weil and Mars, and Kottwitz 1988 proves the general case without E₈ factors; both are named in the gap as unread primary sources.
6. **Clozel–Labesse** (`archimedean-lefschetz-functions`, `twisted-geometric-side`, E3). Theorem 2.2 computes orbital integrals of the K-supported measure; it does not construct the Lefschetz function. The erratum is §4 pp. 112–113 and corrects Theorem A.1.1 of the Clozel–Labesse appendix to Astérisque 257 (pp. 119–133, a separate Numdam item), not Labesse's main text.
7. **KMSW scope** (`tempered-unitary-local-packets`, `unitary-endoscopic-classification`). "Unconditional" is KMSW's word relative to their own hypotheses; they take Mok's quasi-split classification and the weighted fundamental lemma as inputs (Introduction p. 6). Stated so. "Lemma 1.6.2" is Proposition 1.6.2 on p. 81.
8. **Page references**: Arthur–Clozel Ch. 1 §6 (pp. 58–64), Ch. 3 Theorem 3.1 (p. 201), Theorem 6.2/Corollary 6.5 (pp. 215, 218); Labesse 2011 Theorem 5.1 (pp. 41–42); Kottwitz 1986 Theorem 9.6 (p. 393).
9. **Wording**: process phrases in node texts ("previously attributed", "removed as an unrelated supplier", "not claimed in this revision", "in this packet") made timeless; cross-references to the removed coarse ids replaced by the refined ids.

## Closure, layer order and the added node

The node graph of the five ET packets is acyclic. Revision 2 introduced two edges from ET.4 into ET.6:

- `twisted-spectral-side` → `ET.6/tadic-unitary-dual`. The spectral side needs only Bernstein's irreducibility of unitary induction (Mœglin–Waldspurger §I.1.1(3), Shin 2011 p. 28), and the refined ET.6 owner explicitly plans no unitary-dual target. **Added** `ET.4/unitary-induction-irreducibility` (theorem; Tadić 1986 §2.5 p. 346 states Bernstein's theorem; Bernstein's proof, LNM 1041, is not freely available and is recorded in the residual-spectrum gap; the archimedean case stays the AF.1 request), and repointed the prerequisite.
- `tempered-unitary-local-packets` → `ET.6/full-wd-local-langlands`. This dependency is real: KMSW's packets and twisted character identity are stated through the GL_N correspondence. Repointed to the refined `ET.6/full-wd-correspondence`, recorded as a gap, and a restructure proposal moves the three packet/classification targets to ET.7a, their only consumer layer. No other ET.4 target depends on a later layer.

All other ET.4 proof sketches follow from their listed prerequisites at target level; the remaining unread primary proofs are the nine recorded gaps.

## Baseline and library audit

The single baseline citation, `mathlib:MeasureTheory.Measure.IsHaarMeasure` (Mathlib/MeasureTheory/Group/Measure.lean), was read at Mathlib 082e2d3 in the shared pinned build: a class extending finiteness on compacts, left invariance and positivity on open sets. Its `provides` text is accurate. None removed or added. The reviewed library audit has no ET.4 record; its notes on AS.6 and GL2 R17.2 (shared kernel/truncation machinery; R17.2 specializes the cyclic comparison) agree with the plan, which imports AS.6 and proposes ET.4b as the owner R17.x imports.

## API, unit tests, planets and suggested file

The seven definitions and constructions have API outlines serving their recorded uses and at least three tests each; the tests were recomputed (𝔾_m and R_{F/ℚ}GL₁ cuspidality, ϖ_∞(−1) = −1, ι(G,G) = 1, |Out(G_{n,n})| = 2, 𝒢_(1)(ℚ) = F₀^× × F^×, the A ↦ −A sign test). One test added. The six planets are key named theorems of the layer.

The suggested file was reduced to its ET.4 content (the segment, Weil–Deligne matrix and acceptability prototypes belonged to ET.5/ET.6 and are in those packets' files; the GL inner-form sign duplicated ET.0's `kottwitzSign`). It keeps the Tamagawa component counts, adds the kernel bound and its characterization, keeps ι(G,H) and the twisted determinant coefficient, and adds the parity exponents with the N = 3 test. `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474: **exit 0, 12 warnings, all `declaration uses 'sorry'`, no errors**; `scripts/check_sorry_data.py` passes; 131 lines.

## Source issues

- **E2** (Caraiani–Scholze non-compact §5.5 p. 72, transpose without inverse): confirmed.
- **E3**: confirmed, and corrected. The mistake is Théorème A.1.1 p. 121 of the Clozel–Labesse appendix to Astérisque 257 (new source `cl99app`, with version receipt), which gives the stable orbital integral of a Lefschetz function without Kottwitz's sign; Clozel–Labesse 2011 §4 pp. 112–113 call the result incorrect and give Theorems 4.1 and 5.1. Reclassified as an error affecting a stated result.
- **E4** (Shin 2011 p. 27, reversed cuspidality definition): confirmed; reach changed to nothing, since the next sentences use the correct definition.

No new source mistake is asserted.

## Confirmed red-team finding RT-AREA-langlands-1/10

Kottwitz's formula and the simply connected number-one input are ET.4 targets (`tamagawa-number-formula`, `classical-simply-connected-tamagawa`), with the values for G_n⃗ now stated as the sources support them and τ(𝒢_n⃗) = 1; ι(G,H) is in `stable-elliptic-distribution`. ET.5 imports them: the refined `ET.5/orbit-mass-counting` and `ET.5/prestabilization-awayp` cite `ET.4/tamagawa-number-formula`, and `ET.5/stable-trace-with-normalizations` cites `ET.4/stable-elliptic-distribution`. The finding is handled correctly in packet and reader.

## Reader

Regenerated from the corrected packet in the same per-target format: every statement, hypothesis, proof step, prerequisite, locator, API item, test and check of the 34 nodes, every request and gap, and the three source corrections appear verbatim (checked by script). The introduction now states the layer's scope and its boundaries with ET.5 and ET.6, the parity and Tamagawa conventions, and the proposed placement of the packet targets; it no longer narrates the revision history.

## Per-node ledger

Ids omit `EndoscopicTransferAndUnitaryTraceComparison:`. Full notes are in the packet's `review.checked`.

| Node | Verdict | Note |
| --- | --- | --- |
| `ET.4/padic-character-distributions` | corrected | Clozel 1987 checked; cross-reference to removed node replaced |
| `ET.4/twisted-characters` | verified | Clozel Thm. 1, AC Lemmas 1.1–1.5, Prop. 2.2 |
| `ET.4/tamagawa-number-formula` | corrected | ker¹ not trivial in general; τ(G_n⃗) ∈ {2^r, 2^(r−1)} |
| `ET.4/stable-elliptic-distribution` | corrected | Shin 2010 (7.3); use repointed to refined ET.5 |
| `ET.4/elliptic-stabilization` | corrected | Kottwitz §9.1 definition of T_e |
| `ET.4/base-change-groups` | corrected | ε(N−n_i); test and check added |
| `ET.4/unramified-transfers` | corrected | χ_ϖ exponent ε(N−n_i) |
| `ET.4/base-change-transfer-of-functions` | verified | CSnc 5.4.2–5.4.3, Labesse |
| `ET.4/small-level-transfer` | verified | CSnc 5.4.4–5.4.5, LTXZZ D.2.2 |
| `ET.4/archimedean-lefschetz-functions` | corrected | Clozel–Labesse wording and pages |
| `ET.4/twisted-trace-formula` | corrected | Arthur II Thm. 4.4 and §6, not "Thm. 6.4" |
| `ET.4/cuspidal-levi-subsets` | verified | CSnc Def. 5.5.2, Morel Def. 3.1.1 |
| `ET.4/no-proper-cuspidal-subsets` | verified | CSnc Lemma 5.5.3, Rem. 5.5.4 |
| `ET.4/twisted-geometric-side` | corrected | page range |
| `ET.4/twisted-spectral-side` | corrected | forward edge replaced by added node |
| `ET.4/stable-twisted-identity` | verified | CSnc Thm. 5.6.1, CS17 §5.3 |
| `ET.4/simple-division-algebra-trace-identity` | verified | Scholze §8, Cor. 10.1 |
| `ET.4/local-cyclic-base-change` | corrected | AC pages |
| `ET.4/global-cyclic-base-change` | corrected | AC page |
| `ET.4/cyclic-automorphic-induction` | corrected | AC pages |
| `ET.4/unitary-gl-base-change-descent` | verified | Scholze Thm. 10.5 |
| `ET.4/unitary-endoscopic-classification` | corrected | KMSW scope |
| `ET.4/gsp4-gl4-transfer` | verified | Gee–Taïbi 6.1.7, 6.1.8, 7.4.1 |
| `ET.4/acceptance-examples` | verified | checks recomputed |
| `ET.4/classical-simply-connected-tamagawa` | corrected | Lai §7.2 from Thm. 7.1 |
| `ET.4/central-elliptic-stabilization` | verified | Kottwitz §9.5, Thm. 9.6 |
| `ET.4/quadratic-character-extension` | verified | Shin §3.1, CS17 p. 746 |
| `ET.4/twisted-invariant-distributions` | verified | Arthur I, Kottwitz–Rogawski |
| `ET.4/twisted-character-support-and-paley-wiener` | verified | Kottwitz–Rogawski, Delorme–Mezo |
| `ET.4/archimedean-invariant-vanishing` | verified | Morel Prop. 8.2.3, Lemmas 8.2.5–8.2.6 |
| `ET.4/tempered-unitary-local-packets` | corrected | Prop. 1.6.2; dependency on ET.6 recorded |
| `ET.4/extended-unitary-local-packets` | verified | KMSW §1.6.4 |
| `ET.4/cohomological-unitary-weak-base-change` | corrected | Labesse 2011 locator |
| `ET.4/unitary-induction-irreducibility` | added | Bernstein, via Tadić §2.5 and MW §I.1.1(3) |

## Questions for the orchestrator

1. **ET.6a retargeting.** The fourteen ET.6a prerequisites in the table above must be repointed at the next edit of that packet (the assembly is the natural owner). Until then `check_blueprint.py` on ET.6a reports them as unresolved.
2. **Layer placement.** Restructure proposal 4 moves `tempered-unitary-local-packets`, `extended-unitary-local-packets` and `unitary-endoscopic-classification` to ET.7a. The assembly or package should apply it; otherwise the ET.4 layer of the package cites ET.6.
3. **Tamagawa number of G_n⃗** when [F⁺:ℚ] is even and some block is odd: the cited sources leave |ker¹(ℚ,G_n⃗)| ∈ {1,2}. Kottwitz 1992 §7 is the natural place to settle it; until then consumers (ET.5's coefficients) must carry the ratio.
4. **Primary sources not freely available**: Bernstein 1984 (LNM 1041), Kottwitz 1988 (Ann. of Math. 127), Weil's *Adeles and algebraic groups*, Harris–Taylor. Registering any of them in the cleared library would let the corresponding gaps be closed.
