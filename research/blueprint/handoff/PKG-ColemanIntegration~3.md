# PKG-ColemanIntegration~3 — completed package revision

Codex, session `codex-S2PPVa`, 16 October 2026. Issue [#9880](https://github.com/CBirkbeck/tauceti-explorer/issues/9880). Branch `codex-S2PPVa-coleman-integration`. The bot confirmed this session's claim in [comment 6211866723](https://github.com/CBirkbeck/tauceti-explorer/issues/9880#issuecomment-6211866723).

## Status and scope

The revision is complete for independent package review. It addresses the mandatory shape rejection in `REV-PKG-ColemanIntegration~2`, preserves the positive-radius correction, and checks the source flags that the shape rejection left unexamined. Only the package README, its suggested file and this handoff change. The metadata remains `topic = "math.NT"`. The packet, reader, earlier handoffs, suppliers and `review.json` are unchanged.

This is a roadmap package, not a formalization. The Lean proofs are admitted; successful elaboration does not prove the statements. The accepted packet still has planned, unchecked layers and its historical gaps and requests. This revision does not mark them closed or claim that every source proof has been formally verified.

## Shape repair

The suggested file now has 604 lines. Removed the recursive shuffle product, new word ring and derivation, depth development, pre-Bloch quotient, tensor quotient, descending boundary, Bloch kernel and descending evaluation. Their complete specifications, APIs and Checks remain in README L1.12–L1.16 and L2.Fb. Also removed the Frobenius change-of-basis and iteration constructions and chosen valuation, logarithm and global polylogarithm constructions, with their dependent declarations. Those remain README targets rather than replacement opaque carriers.

Kept only direct coefficient/function formulas, a bundle of existing differential and algebra maps, concrete predicates, representative milestones and examples. Branch existence is an existential theorem about the explicitly stated logarithm laws. No chosen global branch or Coleman family is constructed. The projective reduction states the scalar-to-cyclic implication on Mathlib's existing projective line; it does not construct a Bloch group. The retained positive-radius disc definition and the fully proved radius-zero negative control are unchanged in substance.

The complex weight-one boundary value needed an additional repair. An unordered `tsum` of the alternating harmonic series in ℂ is zero because the series is not unconditionally summable. It cannot define Li₁(−1) = −log 2. `complexPolylog` now uses the principal logarithm in weight one and the absolutely convergent scalar series in weights at least two. README L2.Fa distinguishes ordered boundary convergence from `HasSum`; the suggested file tests Li₁(−1), Li₂(±1) and the value at zero.

## Mathematical and dependency corrections

1. **Higher K-theory is constructed, rather than assumed.** L3.Fa.1 now starts from the exact categories and finite vector bundles supplied by GrothendieckEulerForms and AlgebraicVectorBundles. It specifies Quillen's Q-category, nerve realization, pointed loop space, higher homotopy groups, K₀ comparison, exact-functor maps, homotopy fibres, relative long exact sequences, normalized exact cubes, their rational K-theory comparison and the Adams chain operations. Quillen §1–§2, published pp. 89–104, and Feliu v2 §1.2–§1.5, pp. 4–8, Definition 2.15/Lemma 2.16 p. 15, Proposition 3.17 p. 37 and §4 p. 40 supply the construction route. All new objects have APIs and concrete Checks. This replaces the previous handoff's explicit assumption of a K-theory interface.
2. **Import the existing Koszul complex.** IntegralHeckeAndGaloisDeterminants §6.4 already owns the linear-functional Koszul complex and its functoriality. L3.Fa.1 uses its homogeneous pieces for the tautological functional over Sym(E), glues them and proves the additional exactness and direct-sum statements needed for Adams operations. It does not plan a second general Koszul construction.
3. **Localization weights have the necessary hypothesis.** The simple codimension shift for an uncorrected pushforward is restricted to regular immersions with trivial normal bundle, sufficient for the coordinate cubes and a DVR's closed point. General supports use the homotopy fibre. The hyperplane in ℙ² gives a negative control: for h = 1 − [O(−1)], ψ²h = 2h − h², so that pushforward is not generally pure weight one.
4. **Foundation order is explicit.** Construct K-theory, the syntomic regulator, and the complex regulator/Borel theorem before deriving number-field vanishing and constructing the symbol comparisons. Define cyclotomic classes before proving their independence using the regulator calculations. L3.Fc.1 does not depend on the later rank criterion for its construction. This separates the construction, vanishing and basis arguments that the previous dependency prose conflated.
5. **Conjugation and weight one.** L3.Fc.3 now has Pₙ(z̄) = overline(Pₙ(z)) = (−1)^(n−1)Pₙ(z). The actual PDF's conjugation bar was lost by text extraction; this was an error in the inherited README, not evidence of a source error. The inversion law is restricted to n ≥ 2: P₁(2) = 0 but P₁(1/2) = log 2. The Bernoulli convention B₁ = −1/2 is explicit. L3.14 takes cⱼ = Bⱼ/j! in the parametrization of BBdJR (4.12), consistent with the displayed definition and inversion identity.
6. **The regulator lattice is integral.** L3.Fc.1 explicitly assumes n ≥ 2 and states Borel's lattice theorem for integral K-theory modulo torsion. The rational image is its rational span. The target is specified by a_(σ̄) = overline(a_σ), including the action on values as well as embeddings; this avoids applying the parity sign twice. Checks give the zero target for ℚ at n = 2, the real line at n = 3, and distinguish a lattice from its dense rational span. Discriminant invertibility requires every component to be nonzero; a single nonzero component is insufficient in a product algebra.
7. **Symbols at 1 are distinguished from extended K-classes.** L3.Fa.4's distribution assumes x ≠ 0 and xᵐ ≠ 1. Its Check uses x = 2 rather than the nonexistent raw symbol [1]. L3.Fa.5 separately defines the extended class [1]ₙ = 2^(n−1)/(1 − 2^(n−1))[−1]ₙ for n ≥ 2 and its regulator endpoint limit.
8. **Localized rational units use removed sections.** L3.Fa.3's `(1 + I)*` uses uⱼ in the chosen localization set U ⊆ O♭, before taking the direct limit, not arbitrary units of O. In ℤ₂, 3 and 1/3 are units whose product is 1, but neither is a special unit; their corresponding rational expression has uncancelled zeros on sections that were not removed. This tests the missing localization restriction in the inherited specification.
9. **Cone and regulator comparison signs.** The cone convention remains d(a,b) = (da, f(a) − db). Under (a,b) ↦ (a,−b) the isomorphic differential is (da, −f(a) − db). The previously proposed alternative with +db has square (0,−2f(da)) and is not a differential in general. L3.Fb.5 also corrects the weight-two comparison Check: the difference between L₂ and L₂^mod factors through the unreduced tensor differential by a symmetric logarithm pairing, not through the alternating exterior square. The pairing sends 4 ⊗ 4 to (log 4)²/2 ≠ 0 over ℂ₃ whereas 4 ∧ 4 = 0. The reduced comparison uses the H¹-isomorphism from the unreduced complex, as in BDJ p. 909.
10. **Endpoint and conductor restrictions.** L3.Fb.4 replaces the false assertion that every endpoint except 0 and ∞ breaks Frobenius invariance by an explicit nonfixed-endpoint example: q = 3, G(t) = −1/(t−1), endpoint 2 gives −2 before pullback and −8/7 after it. L3.36 reduces nontrivial imprimitive characters to their conductor field before using the algebraic basis and Gauss determinant. For N = 4, trivial χ and n = 3, πi = 0 although the K-space has dimension one; the rational-field bases work. The cyclotomic K-class remains valid, with [−1]₃ = 8[i]₃. Part (4), the unit assertions, remains a separate conjectural condition; the theorem proves parts (1)–(3).

## Source flags and plan issues for the maintainer

The packet is outside this issue's edit scope. These observations are in our own words and are scoped to the editions below; they are not a separate errata submission or a claim of novelty.

- **RJW twist, confirmed in two editions.** Theorem 6.7(ii), arXiv v2 p. 39 and the version of record p. 154, omits ω^(1−k) on the left in RJW's own normalization. Definition 5.18, Remark 5.19 and (5.7), v2 p. 35, give the required twist. For p = 5, θ = χ₋₃ and k = 2 the untwisted value vanishes by parity. The README now verifies the nonzero right side without relying on a numerical assertion: the four unit-coset masses of μ_θ are 2/3, −1/3, −1/3, 2/3; the negative second moment is 2 modulo 5. The correction is a twisted formula, not a restriction to k ≡ 1 modulo p−1.
- **Cyclotomic basis range, confirmed.** BBdJR v2 Example 4.10, p. 19, omits j = 1. At N = 5 its printed strict lower bound gives one element for a two-dimensional K-space. L3.Fa.5 retains the corrected range 1 ≤ j < N/2.
- **Dyadic scope, checked.** BBdJR Theorem 2.9 p. 6, (2.14), Remarks 2.12–2.13 p. 7, Proposition 4.17 pp. 22–23 and Remark 4.19 p. 23 distinguish the conductor-4 character, the dyadic domain, and the non-abelian value-existence assumption. L3.36(b) keeps a concrete dyadic proof obligation using principal units 1 + 4ℤ₂ and odd smoothing b. The odd-prime measure theorem is not silently reused at 2. The abelian theorem does not assert general p-adic nonvanishing.
- **Additional source cautions.** BBdJR v2 (4.3), p. 18, needs n ≥ 2; its P₁ definition supplies the counterexample above. Its Remark 2.5, p. 5, says odd where the zero-rank case in Theorem 2.2 requires even; the README uses the theorem's correct parity. BDJ (3.12), p. 883, must be read with the removed-section set of p. 881 when describing rational units on the localized curve. These findings have not been checked against a later published BBdJR correction or an author errata page.
- The accepted packet's distribution locator “BDJ Proposition 2.10” should be Proposition 2.11, published p. 879. The package uses the published locator.
- Preserve the earlier handoff's routing: higher Polylogarithms, BorelRegulators, PadicHodgeRegulators and AutomorphicPadicLFunctions consume the foundations now owned here. No higher-tier prerequisite was introduced. Historical plan gaps concerning unrestricted higher-pole tangential normalization and general geometric comparisons remain scoped by the explicit simple-pole, coordinate and descent hypotheses; they were not converted into unconditional claims.

## Coverage and mathematical checks

All 197 target subsection headings are preserved, including all 177 original numbered targets (98 lemmas, 19 definitions, 39 theorems, 11 constructions, 10 comparisons). All 257 original API names occur in the README. The packet has 152 named test specifications; the package expresses Checks in prose rather than repeating their names. No target or Check block was deleted. Check sections for 187 targets are byte-for-byte unchanged; the other ten were inspected and corrected or augmented as described above. All 43 sections labelled Definition or Construction have at least three Check bullets; there are 239 Check bullets in total. All 48 explicit `In Suggested.lean` references resolve to a declaration in the file.

The retained Lean statements were read in full and checked on small or degenerate inputs, including:

| Family | Discriminating cases |
| --- | --- |
| Formal series | q₁ coefficient 2; q₋₁ rational function; primitive of 1 and the alternating geometric series; failure in characteristic p |
| Disc analyticity | Positive and infinite radius; impossible radius-zero witness; a locally constant indicator versus one whole-disc series; failure on the closed boundary |
| Logarithms | Distinct branches already at p; zero function fails the series condition; nonzero input for the branch-change formula |
| Frobenius data | Constant algebra H0; a zero one-form cannot be an H1 basis; rank-zero Hw; eigenvalue 1 fails Hw; finite-dimensional affine orbit equation |
| Tangential normalization | CT(t⁻¹) = CT(t) = 0 but CT(t⁻¹t) = 1; scalar constant term |
| Polylogarithms | p-adic series at zero and divergence at 1+p; complex Li₁(−1), Li₂(±1), and Bernoulli inversion in weights at least two |
| Projective reduction | Standard and dependent determinant vectors; infinity outside the affine chart; r(∞,0,1,3) = −2; normalized five-tuple distinctness and scalar two-term hypotheses |
| Measures and smoothing | Geometric transform at 0, 1 and −1; restrictedness below versus at radius 1; evaluation at 0; ∂X = 1+X; unit indicator at 0 and 1; smoothing b = 1 and b = 2 at w = 1 |
| New K-theory specification | Zero exact category; split K₀ relation; cube d²; rank-one homogeneous Koszul differential; homotopy fibres of identity and maps to/from a point; ψ² of rank two versus squaring; nontrivial normal bundle |
| Regulators | Tensor versus exterior comparison; cone d²; real-place parity; integral versus rational lattice; nonzero versus invertible determinant; imprimitive algebraic basis failure |

A reproducible source sample used `random.Random(9880).sample(nodes, 15)`. The cited passages were inspected directly. Several targets are explicit deductions from a framework, not verbatim theorems in the cited paper:

| Target | Passage inspected and scope |
| --- | --- |
| L1.38 | F §2.1 pp. 7–9: continuation framework; the overconvergent correction is the roadmap's explicit deduction |
| L2.8 | BDJ (2.4) p. 876; BBdJR (4.11) p. 20: distribution and its excluded point |
| L2.34 | DJ Proposition 2.10 p. 6 and its proof p. 14: two-term and five-term laws; the defect transformation is derived |
| L3.6 | RJW Lemma 6.5/(6.5) p. 38 and (3.8)–(3.9) p. 21: restriction and negative moments; iterate for general k |
| L3.17 | RJW Proposition 4.4/Definition 4.5 pp. 26–27 and §3.5.2 p. 20: smoothing and rotation; the finite denominator argument is derived |
| L1.19 | BBK Theorem 5 p. 4; F Notation 2.6 p. 9; BT §5 p. 18: the integration properties |
| L2.46 | F §2.1 pp. 7–9: functoriality and uniqueness; the differential cancellation is the displayed deduction |
| L1.22 | BH Theorem 2 pp. 7–8; BT Corollary 3.2 p. 8 and §5 p. 18: lift independence and canonical continuation |
| L1.5 | BH §1.3.2 p. 6; BT §5 p. 18; BBK Algorithm 10 step 1 p. 7: Frobenius lifts; distinguish p-power semilinearity from q-power K-linearity |
| L2.40 | DJ pp. 6, 14: scalar relation; the separated-disc proof is the roadmap's deduction from continuation |
| L1.20 | BH Theorem 2 pp. 7–8 and BT §5 p. 18: normalized Frobenius-compatible integration |
| L3.5 | RJW Lemma 3.29 p. 19, Theorem 3.43/Remark 3.45 p. 25, §6.2 pp. 37–38; BF §1 p. 1: Amice differentiation and polylogarithm expansion |
| L3.14 | BDJ preprint (1.2) p. 3, Remark 1.5 pp. 3–4; BBdJR (4.12) p. 20: the modified combination and inversion constraint |
| L2.33 | DJ pp. 6, 14: the two-term laws used to derive the input-exchange identity |
| L2.29 | BDJ §2 p. 876 and BBdJR Proposition 4.17 p. 22: distribution and the character/Euler-factor comparison |

## Libraries and duplication

Read the reviewed library-coverage entry and the actual pinned declarations used by the representative signatures. In particular checked derivative coefficients and the formal logarithm, restricted power series and inverses, `FormalMultilinearSeries.ofScalars`, the `HasFPowerSeriesOnBall.r_pos` condition and uniqueness/recentring APIs, Amice transform coefficient restrictions, finite Fourier/Gauss identities, exponential zeta, Bernoulli formulas, the principal-log Taylor series, and Tau Ceti's `logOneAdd` and Teichmüller statements. Tau Ceti's pinned analytic radius theorem requires `ContinuousSMul ℚ≥0`; the new ultrametric radius milestone uses its existing series without assuming that incompatible action.

The current read-only upstream checkout was `0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches included both active roadmaps and Completed, the nine newer roadmaps named by the worker instructions, and their available suggested files. Followed mathematical matches through the exact-category/K₀, vector-bundle, Koszul, complex-residue, Artin-factor and representation-theory suppliers. Current local-field logarithms and Teichmüller lifts are consumed as compatibility inputs; they do not supply a branch on ℂ_p. Complex contour residues and unit-lattice regulators have different carriers and do not replace the p-adic annulus or higher K-theory regulator targets. Found no existing current Coleman/shuffle construction, Bloch group, scheme higher K-theory/Adams package or syntomic cohomology regulator supplying these targets. This is a targeted mathematical overlap audit, not a claim to have read the entire library.

The two upstream style models read in full were ArithmeticDirichletSeries and Completed/ContourIntegration, together with the latter's complete representative-signature file. No command built or modified either read-only checkout.

## Validation

- Final `lean-check research/blueprint/packages/ColemanIntegration/Suggested.lean`: **exit 0, 66 warnings, all `declaration uses sorry`; no errors or other warnings.** Shared pinned build: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Available memory before the final run: 87 GB. No compiler remains running.
- `python3 scripts/check_sorry_data.py` on the suggested file: no offenders.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ColemanIntegration.json`: no errors or warnings.
- `python3 research/blueprint/intake.py check-files` on the three package files and this handoff: no problems.
- `git diff --check`: clean. Only authorized deliverables change.

The inventory counts above are mechanical checks; the adversarial table and source sample describe the mathematical checks and their limits. The next action is independent package review, with particular attention to the now explicit higher K-theory and regulator construction routes. No second job was claimed.

## Public-source receipts

The listed editions were fetched publicly and inspected at the cited passages on 16 October 2026. Inspection of selected passages is not a claim to have reread every page of every paper. No restricted library source was needed. No PDF, extracted source text or verbatim source passage is committed. SHA-256 identifies the PDF actually inspected; full titles and links are in the package bibliography.

| Reference / edition | SHA-256 |
| --- | --- |
| Quillen, institutional copy of Higher algebraic K-theory I | `5d2db42d3fec06156da4e6f6d5a85fb9a04358df59141d3abe74a57b815bae04` |
| Feliu, arXiv:0808.3882v2 | `a5245befa213c2d23d41edcaa89c77f798a9594ca3909dce5b2d64fde1457f4d` |
| rjw (edition linked in the bibliography) | `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4` |
| furusho-pmzv1 (edition linked in the bibliography) | `fd2391bd4dbf328667f0fb1b46d979c4814892c2c2cd14051de8d674d4c5b9fb` |
| besser-tannakian (edition linked in the bibliography) | `35d1b109d891dea711d2b557c1e81f826d6da73498ee82c7732185283702e2b7` |
| bbk-explicit (edition linked in the bibliography) | `319f92f3f56635029df72c8a043e26d32d4f6d09cda94f705bb93cefed95f8da` |
| besser-finite-polylog (edition linked in the bibliography) | `10483e75bd3655eaef5e621e7c4090525ffd11939c2e0f0fd711740e72419769` |
| besser-heidelberg (edition linked in the bibliography) | `cbb50a0514044e71926bfc83e2f514ae12eefd1dc3c590f7948a8d187fdf7c12` |
| mccallum-poonen (edition linked in the bibliography) | `fb8d1a580def6365ebb979fd64e31d7f00d555399502b76035718112f21ab55a` |
| besser-dejeu-syntomic (edition linked in the bibliography) | `c269f455db5fc0b69452a620d639b3a9d44d56b59ce9d79ec78cd1e5a00fb872` |
| bbdjr-beilinson (edition linked in the bibliography) | `609a6f67a0cd5fc8b4ab67d4ec03a229c4a6ed673cc809d4f66c949058967a14` |
| bhyy-polylog (edition linked in the bibliography) | `e7d1204cc148dfa29b1a434de4faafd1cba0e20222ed68c0a56f92bad66c2f82` |
| gswz (edition linked in the bibliography) | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| wojtkowiak-functional (edition linked in the bibliography) | `3c29dd4f28f92bf84357ac423860d43b2aab91f840a3620333fabe84fd22e97e` |
| rjw-ent (edition linked in the bibliography) | `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6` |
| besser-dejeu-syntomic-arxiv (edition linked in the bibliography) | `67b19d01ef3da4fdc8c2a3406868fa93abd2ac49782fb536614b2f051f2ed498` |
| dejeu-functional (edition linked in the bibliography) | `6d96d3d58d55e4c55506271e5cd0058b8ea8406995ca642febe868be87440b68` |
| fpz (edition linked in the bibliography) | `cd19adfaaaffeade4e58710b759dc4268f8f55357c161bba8342277174cb8e84` |
| bc (edition linked in the bibliography) | `3fc53407b2644bf30eac3530910eaba18024d22ee48c7d85b2e8c53906e19d4e` |

Final package receipts:

- `README.md`: 412,328 bytes; SHA-256 `4d2618141c305716716f88f088801705e1929ee30a8598dcf2bc5a0fe8f1f253`.
- `Suggested.lean`: 26,995 bytes; SHA-256 `e480f75426760b0e9cbc6519132bcd046e9d6195b830f46710ec9a050d20d139`.
- `metadata.toml`: 18 bytes; SHA-256 `d303572d699e7ef5619039e39ca2cc23feb22354dad61e5014fe05151078b2a7`.
