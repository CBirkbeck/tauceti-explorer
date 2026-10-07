# RT-AREA-iwasawa-2: fixes, round 2

Fixer: Claude Code, session `claude-6ZAIEy`, 7 October 2026 (issue #6218, job `FIX-RT-AREA-iwasawa-2~2`).
Input: origin/main `67731dad`.
- Findings: `RT-AREA-iwasawa-2.result.json`, verdicts `RT-AREA-iwasawa-2.review.json`, review report `reviews/REV-RT-AREA-iwasawa-2.md`.
- Round 1: `RT-AREA-iwasawa-2.fixes.md`. Round 1 could not edit any blueprint and described the edits as changes to `content/campaign/` for the maintainer.
- This round applies those described changes in the finished blueprints the issue lists, wherever they still belong there. The edited files are:
  - `research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json`;
  - `research/blueprint/readmes/PadicMeasuresIwasawaAlgebras.md`;
  - `research/blueprint/suggested/PadicMeasuresIwasawaAlgebras.lean`.
- The DirichletPadicLFunctions--L3 files are not changed (see /1 and /2). No file under `content/campaign/` or `data/` is touched.

| Finding | Outcome |
|---|---|
| /1 Morita Γ_p and Gross–Koblitz (DirichletPadicLFunctions L3) | Already planned in the accepted L3 packet and its follow-up part L3-2; handed to the L3-2 review. No edit. |
| /2 Ferrero–Greenberg (DirichletPadicLFunctions L3) | Planned in the follow-up part L3-2 (BP-DirichletPadicLFunctions--L3-2, as the issue assigns); one range question handed to its review. No edit. |
| /3 Fontaine–Messing–Kato log-syntomic package (PadicHodgeRegulators D.2) | Carried by BP-PadicHodgeRegulators--D.1 (#966), as the issue assigns. No edit here. |
| /4 Dasgupta–Kakde ring theory (PadicMeasuresIwasawaAlgebras L6) | **Fixed.** 25 new L6 nodes, a request to StableReduction Layer 1, source finding E17, reader section and suggested Lean. |
| /5 finite slope for perfect complexes (LocallyAnalyticDistributions L4) | Carried by BP-LocallyAnalyticDistributions (#641), as the issue assigns. No edit here. |

## /1 (medium, missing): Morita's Γ_p and the Gross–Koblitz formula

**Where it went.** The issue hands /1 and /2 to `BP-DirichletPadicLFunctions--L3-2`.
- That follow-up part is written (`packets/DirichletPadicLFunctions--L3-2.json`, issue #6340, 79 nodes) and awaits its review, `REV-DirichletPadicLFunctions--L3-2` (#6297).
- The accepted L3 packet (`DirichletPadicLFunctions--L3.json`, 1,663 nodes, review `independent-review-REV-DirichletPadicLFunctions--L3`, accepted 5 October 2026) already plans Γ_p and Gross–Koblitz.

**Round 1's contract, item by item, against the existing nodes** (all `DirichletPadicLFunctions:L3/…`):

| Contract item (round 1, /1) | Node(s) |
|---|---|
| Γ_p on Z_p as the continuous extension of (−1)^n ∏_{0<j<n, p∤j} j; values are units | `morita-natural-values`, `morita-gamma-value`, `morita-gamma`, `morita-gamma-value-unit-norm`, `morita-natural-unit-norm` |
| Wilson congruence Γ_p(n + p^k m) ≡ Γ_p(n) mod p^k, continuity | `morita-natural-congruence`, `morita-natural-buffered-congruence`, `morita-gamma-value-continuous` |
| Uniqueness | `morita-gamma-unique` |
| Γ_p(x+1) = −xΓ_p(x) on units, −Γ_p(x) on pZ_p | `morita-gamma-functional-equation` (unit and non-unit branches; test `functional_nonunit_branch`) |
| Tests Γ_p(0) = 1, Γ_p(1) = −1, natural values | `SuggestedMoritaContinuousTests.raw_zero`, `raw_first`, `SuggestedMoritaNatTests.deleted_factor_three`, `unsigned_formula_rejected` |
| Γ_p is not one analytic function on the closed disc | hypotheses of `morita-gamma-functional-equation` |
| π with π^{p−1} = −p and π ≡ ζ_p − 1 mod (ζ_p − 1)², depending only on Ψ | `gross-koblitz-integral-pi-existence`, `gross-koblitz-field-pi-existence`, `gross-koblitz-normalized-field-pi`; in L3-2, `rjw2-gk-root-ideals`, `rjw2-gk-root-congruence`, `rjw2-gk-dyadic-root` |
| Theorem 1.7 with the source's negative Gauss sum, and the dictionary with Mathlib's positive `gaussSum` | `robert-gross-koblitz-comparison`, `robert-negative-gauss-coefficient-sum`, `robert-series-gauss-comparison`, `gross-koblitz-gauss-pair-comparison`, `gross-koblitz-actual-elementary-gauss-pair`, `gross-koblitz-gamma-source-product` |
| The trivial character lies outside Theorem 1.7 | `gross-koblitz-negative-gauss-zero` (the negative Gauss sum of the exponent-0 character is 1) |

**What remains open.** The L3 packet's own coverage list records what remains:
- the Dwork coefficient-bound and splitting inputs, requested from PadicDifferentialEquationsAndRigidCohomology RD.6, on which `robert-gross-koblitz-comparison` is conditional;
- the dyadic comparison.

These are supplier requests, not omissions of this layer. Nothing in the round-1 contract is missing from L3 together with L3-2, so the accepted L3 files are left unchanged. Editing them would only reopen an accepted packet.

**For the L3-2 review (#6297):**
- confirm that the L3-2 root nodes give the chosen-root compatibility that the L3 coverage item for /1 still lists;
- confirm the odd-p scope of the Gross–Koblitz statement (Gross–Koblitz assume p odd).

**Elsewhere.**
- The paper extraction PAPER-DASGUPTA-KAKDE-VENTULLO-18 can move items `padic-gamma` and `gross-koblitz` to planned at DirichletPadicLFunctions:L3 when it is next regenerated. This is not a deliverable of this job.
- The EulerSystemsCyclotomicMainConjecture gap on `L4/greither-gauss-sum-vectors` stays open: L3 covers odd p only. Round 1 already noted this. That packet is not a deliverable of this job.

## /2 (medium, missing): the Ferrero–Greenberg derivative formula

**Where it went.** `BP-DirichletPadicLFunctions--L3-2` (issue #6340), as the issue assigns. The planned nodes are in `DirichletPadicLFunctions--L3-2.json`:
- `rjw2-fg-gamma-sum`, `rjw2-fg-count`, `rjw2-fg-permutation`, `rjw2-fg-log-antidifference`, `rjw2-fg-sum-expression`, `rjw2-fg-differentiation` and `rjw2-fg-count-character-sum`;
- **`rjw2-ferrero-greenberg`**: L_p′(χω, 0) = S_(Γ,χ,N) + (1 − χ(p))B_{1,χ} log_p N, with the correction term kept;
- `rjw2-fg-exceptional-zero` and `rjw2-fg-exceptional-derivative`: the χ(p) = 1 case without a nonvanishing claim;
- nonvanishing is kept apart, as a separate lemma `rjw2-fg-nonvanishing`, with its own gap "Arithmetic nonzero character projection".

This matches the contract of round 1 and of the verdict.

**For the L3-2 review (#6297).** `rjw2-ferrero-greenberg` states the formula for every prime p and cites Zhao, *Sum expressions for Kubota–Leopoldt p-adic L-functions* (Proc. Edinb. Math. Soc. 65 (2022)).
- Ferrero–Greenberg Proposition 1 itself is stated for odd p with p ∤ N. The verdict asks for the general formula "only with its correction term and source range".
- The review should therefore confirm that Zhao §4 proves the p = 2 case it is cited for. Otherwise the p = 2 case belongs in its own qualified node.
- I did not read Zhao and do not judge the point.

L3-2 is not a deliverable of this job, and the accepted L3 packet needs no change. No edit was made.

## /3 (high, missing): the classical log-syntomic package

**Where it went.** `BP-PadicHodgeRegulators--D.1` (issue #966), as the issue assigns. Its packet `PadicHodgeRegulators--D.1.json` (written 6 October 2026, review `needs_changes`) already carries the verified contract.
- **D.2 nodes.** `PadicHodgeRegulators:D.2/log-syntomic-complex` and `D.2/fontaine-messing-kato-period-map` preserve the interfaces without claiming ownership. The finding is cited in their annotations: "RT-AREA-iwasawa-2/3 is confirmed, but its verifier explicitly rejects generic D.2 ownership".
- **Request.** The packet's request to `CohomologyComparisons:CP.4` asks that the integral and open log-syntomic construction be routed to "an EARLY prefix of CohomologyComparisons Part II after CR.5/CR.6, as required by the accepted RT-AREA-iwasawa-2/3 verification". It lists the required contracts: the complexes S_n(r), the period morphism into the modified twist, the small-range comparison and the syntomic exponential.

**For the maintainer.** Round 1's proposal for a CohomologyComparisons Part II stands. Two Part II requests for it are already pending as revisions:
- CohomologyComparisonsPartIISyntomicNearbyCycles, from PAPER-COLMEZ-NIZIOL-17 route 1;
- SyntomicCohomologyAndSteinComparison, from PAPER-COLMEZ-DOSPINESCU-NIZIOL-20 route 1.

No edit was made here.

## /4 (medium, missing): the Dasgupta–Kakde ring theory in PadicMeasuresIwasawaAlgebras L6

**Fixed in the packet, reader and suggested file.**
- The source is Dasgupta–Kakde, *On the Brumer–Stark conjecture*, arXiv:2010.00657v3. I read the PDF (SHA-256 `c1fe1cd8…3b63099`) and the TeX source (e-print SHA-256 `4a732681…ff25`, the hash recorded by the extraction and by round 1) on 7 October 2026. The PDF pages read are pp. 15–18, 25–26, 34, 40, 49, 85–86 and 93.
- The authors' copy of 15 February 2022 (SHA-256 `c5b1df5d…d69dcf`) was read for the Lemma 3.9 display.
- The published version in the Annals was not accessible.

**New L6 nodes** (`PadicMeasuresIwasawaAlgebras:L6/…`; ★ marks a planet):

| Node | Content | Source |
|---|---|---|
| `character-evaluation` | ev_ψ : O[G] → O and the joint evaluation; orthogonality; injectivity at all characters | §2.2 |
| `character-group-ring` ★ | R_Ψ as the **image** of O[G] in ∏_{ψ∈Ψ} O, with α_Ψ, restriction functoriality, R_∅ = 0, R_{1} ≅ O, R_Ĝ ≅ O[G]; tests include "not the full product" and "not Gorenstein" (the C_p × C_p example of round 1) | §2.2 |
| `character-group-ring-lattice` | #G·∏O ⊆ R_Ψ ⊆ ∏O, free of rank #Ψ, finite index; O[G] ↪ ∏_{Ĝ} O | §2.2 |
| `character-group-ring-nonzerodivisor` | x is a non-zerodivisor of R_Ψ ⇔ every ψ(x) ≠ 0 ⇔ x is a non-zerodivisor of ∏O | proof of Lemma 2.5 |
| `norm-element-kernel` | Lemma 2.2: ker α_Ψ = N_I·O[G] for Ψ = {ψ(I) ≠ 1} | Lemma 2.2 |
| `component-character-group-ring` | R_χ = e_χO[G] = R_{Ψ_χ} ≅ O[G_p]_χ, built from L4's character idempotents | §2.2 |
| `component-norm-quotient` | Corollary 2.3: R_χ/N_I ≅ R_Ψ | Corollary 2.3 |
| `character-group-ring-unit-criterion` | x is a unit ⇔ all ψ(x) are units; one ψ suffices inside one component | §5.1 |
| `character-group-ring-local` | R_Ψ ⊆ R_χ (Ψ ≠ ∅) is complete local noetherian, finite free over O | §7.2.9 |
| `character-group-ring-index` | Lemma 2.5: #R_Ψ/(x) = #O/(∏ψ(x)) | Lemma 2.5 |
| `sharp-involution` | # on O[G] (Mathlib antipode); R_Ψ ≅ R_{Ψ^{-1}} = R^#, an endomorphism only if Ψ^{-1} = Ψ (non-example test) | §6.1 |
| `contragredient-dual` | M^* with (r·φ)(x) = φ(r^#x), along a ring isomorphism σ : R^# → R | (80) |
| `quadratic-presentation` ★ | R^m →φ R^m → N → 0 with m ≥ 1; base change, sums, cokernels | §2.3 |
| `fitting-quadratic` | Fitt(N) = (det φ) | §2.3 |
| `locally-quadratic-presentation` | equal constant rank projective presentations; quadratic over finite products of local rings | Lemma A.5, Remark A.7 |
| `fitting-extension` | Lemma 2.6, both parts, with a direct block-matrix proof | Lemma 2.6 |
| `fitting-fibre-product` | Lemma 2.7, by the fibre product | Lemma 2.7 |
| `quadratic-cardinality` | Lemma 2.4, with the transfer of the non-zerodivisor to B′ made explicit (characteristic-zero factors) | Lemma 2.4 |
| `compound-matrix` ★ | C_r(A) as the matrix of ⋀^r A in Mathlib's exterior-power bases; Cauchy–Binet; column restriction | proof of Lemma 3.9 |
| `higher-adjugate` | adj_r(A) with C_r·adj_r = det·I = adj_r·C_r | proof of Lemma 3.9 |
| `exterior-cokernel-annihilator` | Lemma 3.9, with the corrected last step (E17) | Lemma 3.9 |
| `presentation-transpose` ★ | the transpose of a finite projective presentation, on the pinned `TauCeti.AuslanderReitenTranspose` cokernel, as an R^#-module; it depends on the presentation (non-example test) | §6.1, (81) |
| `transpose-stable-equivalence` | tr(f) ⊕ (Q_1 ⊕ P_0)^* ≅ tr(g) ⊕ (P_1 ⊕ Q_0)^* for any two finite projective presentations, with a proof | §6.1 |
| `transpose-fitting` ★ | Lemma 6.1: Fitt_{R^#}(M^tr) = Fitt_R(M)^# for the transpose of the given quadratic presentation | Lemma 6.1 |
| `transpose-higher-fitting` | (171): Fitt^0_{R^#}(M^tr) = Fitt^s_R(M)^# with s excess generators | proof of Lemma B.4 |

**Where the verdict's corrected contract departs from the red team's fix, it is followed:**
- R_Ψ is the image, not the product.
- # is an isomorphism R_Ψ ≅ R_{Ψ^{-1}}, not an involution of R_Ψ.
- R_Ψ is not assumed Gorenstein.
- The transpose depends on the presentation, and the Fitting identities concern the transpose of the stated presentation.
- The higher-adjugate step uses the right-sided identity.

**Boundaries kept:**
- **Basic Fitting carrier.** The basic Fitting carrier stays with Tau Ceti StableReduction Layer 1 (accepted RS-16). A new `requests` entry asks that layer for the higher Fitting ideals Fitt^i of finitely generated modules, with presentation independence, base change, monotonicity under surjections, Fitt^i ⊆ Fitt^{i+1} and Fitt^0 ⊆ Ann. The existing L4 request covers only Fitt₀. The entry is needed by the seven L6 nodes that use Fitting ideals. These are the extraction's upstream imports 19, 65, 78, 317 and 325. No second Fitting carrier is planned.
- **Transpose.** The transpose reuses the built Tau Ceti declaration `TauCeti.AuslanderReitenTranspose` (Transpose.lean:94), with `linearEquiv`, `mk` and `mk_eq_zero_iff`, as baseline citations, read at f790474.
  - Its minimal-presentation uniqueness (line 481) is not what Dasgupta–Kakde use. The projective-summand comparison of arbitrary presentations is proved here instead.
  - Minimal presentations, the stable category and D Tr are not rebuilt.
  - Because the declaration is cited from the library, no stage edge from QuiverRepresentations Layer 6 is needed. That replaces round 1's suggested link A4.
- **Other library reuse.** Mathlib is reused for exterior powers and their bases, the antipode, adjugates, `Set.powersetCard` and Smith normal form. 35 baseline declarations were added, each read at the pinned commits.
- **What stays in IntegralIwasawaTheory I.6/I.7.** The arithmetic remains there:
  - the trivial-zero character set;
  - ∇ with (P1)–(P4);
  - Selmer and class-group comparisons;
  - Theorems 1.7/3.3, Corollary 6.2 and Lemma B.4.

**Source finding E17 (gap; affects the proof; new).**
- **What is wrong.** Lemma 3.9 prints adj_r(A′)·C_r(A)x̃ = adj_r(A′)·C_r(A′)x = det(A′)x and concludes that det(A′)x lies in the image of C_r(A). That conclusion needs the image to be stable under adj_r(A′).
- **Correction.** det(A′)x = C_r(A′)(adj_r(A′)x) = C_r(A)(ι_J(adj_r(A′)x)).
- **Where it was searched for:**
  - arXiv v3 and the authors' copy of 15 February 2022: the same display;
  - arXiv v1: the same display, according to round 1;
  - the atlas errata for PAPER-DASGUPTA-KAKDE-23: only E1.
- **Number.** Round 1 proposed the id E16, but E16 is now taken by an NSW misprint, so the finding is `PadicMeasuresIwasawaAlgebras/E17`.

**Two locator corrections to the paper extraction.** I recorded these in the node sources; the extraction file is not a deliverable of this job.
- The excess-generator identity that PAPER-DASGUPTA-KAKDE-23 item 332 and round 1 call "(175)" is printed as **(171)** in v3 (TeX label `e:selnab`). In v3, (175) is a different equation, in the proof of Lemma B.6.
- Item 202's "§7.2.10 Ordinary forms" is §7.2.9 in v3 (PDF p. 49).

**Packet bookkeeping.**
- L6 coverage goes from `not_read` to `partial`, and its `remaining` list now names what is left:
  - the Burns–Sakamoto–Sano Gorenstein-order, duality and exterior-bidual targets, including item 31;
  - item 20 (Ann(M^∨) = Ann(M)^#);
  - the Kolyvagin/Rubin IV items;
  - the upstream request;
  - the I.6/I.7 import.
- The L6 gap is updated, and a `fixHistory` entry records the job.
- No existing node, API item or test is changed. I checked this by comparing parsed JSON: the 436 earlier nodes are identical, and the earlier baseline, requests, coverage and gaps are unchanged apart from the L6 records.

**Reader** (`readmes/PadicMeasuresIwasawaAlgebras.md`):
- a front-matter paragraph on this round;
- the L6 coverage section, now `partial`;
- the Dasgupta–Kakde lines of the source-route register: 20 items marked planned with their nodes, three owner-boundary items noted, and item 44 annotated;
- a new section, *L6: character group rings, quadratic presentations, compound matrices and transposes*, with conventions, the E17 correction, the boundary, every node (statement, hypotheses, proof outline, prerequisites, acceptance, source, uses, API, unit tests), E17 and the new request;
- a validation note.

**Suggested file** (`suggested/PadicMeasuresIwasawaAlgebras.lean`):
- A block between `section L6` and `end L6` sits before the closing review comment. Nineteen imports were added, among them `TauCeti.Algebra.Module.AuslanderReiten.Transpose`.
- Every API item and unit test of the 25 nodes appears under its packet name. I checked this with a script over the packet; tests appear as `-- test <name> (<kind>) [<node>]` comments before their `example`s.
- `TauCeti.Module.fittingIdeal` writes the requested Fitting ideal out by minors, as `AdicSpacesPartII.lean` does. It stands in for the StableReduction supplier and is not an L6 node.

**For the maintainer and for BP-IntegralIwasawaTheory--I.1 (#759, which plans I.6/I.7).**
- I.6 must import the L6 nodes `character-group-ring`, `sharp-involution`, `quadratic-presentation`, `locally-quadratic-presentation`, `fitting-extension`, `fitting-fibre-product`, `quadratic-cardinality`, `presentation-transpose`, `transpose-fitting` and `transpose-higher-fitting`.
- I.7 imports them through I.6. No I.6/I.7 packet exists yet, so no file of this job can record the import.
- The stage edge PadicMeasuresIwasawaAlgebras:L6 → IntegralIwasawaTheory:I.6 is acyclic: neither I.6 nor I.7 reaches L6. Round 1 checked this, and the new L6 prerequisites add only edges from L4 (same roadmap) and from StableReduction Layer 1. Promotion draws the edge once I.6 nodes cite L6 nodes; until then it is a declared edge for the maintainer.
- Round 1's proposed sentences for the I.6 and I.7 stage texts still apply, as the brief for that job.

**Not done here.**
- The Gorenstein-order and exterior-bidual targets of L6 were not part of the finding.
- Items 20 and 31 were not decomposed; they stay in L6's `remaining`.
- Northcott, *Finite free resolutions*, Theorem 22 (cited by Dasgupta–Kakde for Lemma 2.6) was not read. `fitting-extension` carries its own block-matrix proof instead.

**Conflict note.** `BP-PadicMeasuresIwasawaAlgebras~2` (#6472, a revision of this packet) is open and edits the same three files. Whoever takes it should start from this version.

## /5 (medium, missing): finite-slope theory for perfect complexes

**Where it went.** `BP-LocallyAnalyticDistributions` (issue #641, available), as the issue assigns. Its partial packet `LocallyAnalyticDistributions.json` already carries the finding:
- **L4 coverage `remaining`:** "RT-AREA-iwasawa-2/5 is unresolved: read Pilloni §13, BCGP (2021) §6.1.1 and BCGP (2025) §§2.2,4.6, then add projective Banach complexes, representative-wise compact endomorphisms, the source's nonalternating characteristic-series product, derived finite-slope localization and Stein/quasi-Stein exhaustions …".
- **A gap:** "RT-AREA-iwasawa-2/5 is not discharged by module-level Fredholm theory …".

**For that job.** Round 1's detailed contract still applies. It covers:
- Urban's h-slope decomposition with the "at most h" complement;
- the representative-wise compactness and the cohomological spectral support;
- the separate L5 for BCGP25 §4.6.46 over the Stein character space;
- the generic Stein owner proposed for AdicSpacesPartII R3.

No edit was made here.

## Checks

- **`check_blueprint.py`.** `python3 scripts/check_blueprint.py research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json --index <pinned declarations.tsv>` reports 0 errors and 0 warnings. The packet has 461 nodes, 371 API items, 245 unit tests, 27 planets, 383 baseline declarations and 3 requests.
- **Source excerpts.** Every new source excerpt was matched to the v3 text layer (NFKC-normalised, whitespace-insensitive) on the page cited.
- **Lean.**
  - The L6 block elaborates against the pinned Mathlib 082e2d3 with `lean-check`, with proof placeholders as its only warnings. I checked it twice: alone, and with the `open scoped` declarations still active at the end of the suggested file.
  - The shared build has no Tau Ceti oleans for `TauCeti.Algebra.Module.AuslanderReiten.Transpose`, so the check used a verbatim local copy of the pinned definition (Transpose.lean:94 and its two instances).
  - The whole suggested file imports Tau Ceti modules that are not built in the shared build, so it was **not** re-elaborated as a whole.
  - The nineteen added imports are Mathlib modules plus the Tau Ceti module above.
- **Intake screen.** `research/blueprint/intake.py check-files` passes on all four changed files.
