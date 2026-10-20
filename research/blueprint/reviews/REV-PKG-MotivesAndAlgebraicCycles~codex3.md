# Independent review: algebraic cycles, pure and mixed motives (round after the second fix)

Job `REV-PKG-MotivesAndAlgebraicCycles~codex3`, issue #11428. Claude, session `claude-4ePRiC`, 2026-10-20. Base commit `d87793305`. I did not write the package, its first fix (#11382) or its second fix (`FIX-PKG-MotivesAndAlgebraicCycles~adv2`, #11426), and I did not write either earlier review. All five earlier commits on the package are by Codex sessions.

I read the following: WORKERS, PROTOCOL §§0, 5, 13, 20, PACKAGE_REVIEW, UPSTREAM_GUIDE, the codex2 review report, the adv2 fix handoff, the accepted packets and the whole package.

## Verdict

**`accepted`**, with the corrections below applied in place. Every finding of the codex2 review is closed. The local effective foundations are stated as this roadmap's own targets, with locators and Checks. No supplier depends on this roadmap. Generality is as wide as the cited proofs allow, and where it was narrower without reason I widened it. Suggested.lean follows the 2026-10-19 rules and elaborates. No theorem of Tate's thesis appears.

## Earlier findings

| Finding | Status | Evidence |
| --- | --- | --- |
| R1, real torsion descent | Closed (unchanged) | The Layer 7 mathematics is the text the codex2 review checked. This review changes one word in §7.19 ("later" became "subsequent"). |
| R2, primitive heights | Closed (unchanged) | Same as R1. The §7.17 exponents, parity sign and normalisations are as checked there. |
| R3, effective foundations taken from the downstream MotivicEtaleKTheory | **Closed** | New §§4.1–4.10 state the foundations as own targets. They cover finite correspondences and `SmCor`; transfer presheaves, representables, the transfer tensor and smash objects; Nisnevich transfer sheaves with sheafification and Ext/hypercohomology; Suslin complexes, `Z(q)`, and weight one; the boundary Picard group, relative finite cycles and standard triples; excision, contraction, strict invariance and the Gersten resolution; bounded-above and unbounded effective localization with the derived transfer tensor; Bloch complexes; moving, localization, homotopy and higher-Chow transfers, with a descent adapter for non-quasiprojective schemes; cancellation; and exact cdh pullback with the complex comparison. Each has a construction, an API, a locator, and at least three Checks (82 new). §§4.11–4.20 and §5.8 now consume these sections. The scope section and the Downstream consumers section make MotivicEtaleKTheory an importer. |

I compared the README before and after the fix (`ac4a79ae7` against base). All 408 earlier bullet lines survive verbatim, so no Check was lost. A word-level diff of the 26 rewritten paragraphs shows only supplier wording, section renumbering and cross-references changed. The cdh-vanishing and complex-comparison text moved from old §4.5 into §4.10, and new §4.15 cites it with its resolution hypothesis.

## Supplier order

A Sonnet cross-check listed every roadmap the README names and classified each mention. It then searched the suppliers' packets, package READMEs, `data/atlas.json` edges (prerequisite→consumer) and `merge_waves.json`. I read its evidence.

| Supplier | Depends on this roadmap? |
| --- | --- |
| SchemeAndStackFoundations (wave 0) | No. Its packets mention MC only on the consumer side (`uses`, `consumerRequests`, restructure notes). The atlas edges run SF→MC. |
| EtaleDualityAndPerverseSheaves (wave 20) | No. It has one consumer-side `uses` note. |
| ComplexComparisonPartII (wave 9) | No. It lists MC.2 as a consumer. |
| SchemeKTheoryOperations (wave 9) | No mention of MC. |
| Tau Ceti suppliers | No mention of MC, MotivicEtaleKTheory, PeriodsAndSpecialValues or HodgeStructuresPartII. These are DifferentialGeometry, AlgebraicTopology, ReductiveGroups, ModularCurves, GrothendieckEulerForms (its Part II contract), the Hodge modules and QuaternionicStructure. |

One level further down, none of these suppliers cites MC, MotivicEtaleKTheory, PeriodsAndSpecialValues or HodgeStructuresPartII. MotivicEtaleKTheory (scope section and Downstream consumers) and PeriodsAndSpecialValues (scope section, §6.7 and Downstream consumers) appear only as consumers. HodgeStructuresPartII is not cited. There is no `FoundationsAndLibraryIntegration` or `UPSTREAM:` reference.

**Stale plan data for the maintainer (outside this job's files):**
- The accepted packets still list `MotivicEtaleKTheory:M.5a` / `:M.4` as node prerequisites and request suppliers. This affects 36 nodes (22 in the base packet, 11 in MC.4, 3 in MC.5) and two nodes of `MotivesAndAlgebraicCyclesPartII` (BM.10).
- MC.7 lists `PeriodsAndSpecialValues:PS.6` for five Beilinson–Bloch and Li–Liu nodes. The README treats the analytic L-data as stated hypotheses (§7.16), so it needs no supplier there.
- `data/atlas.json` keeps the stage edges `MotivicEtaleKTheory:M.4→MC.4` and `M.5a→MC.4`.

These contradict the maintainer's ordering that the README now follows. The next plan revision should reverse them, and MotivicEtaleKTheory's packets should import §§4.1–4.10 rather than plan them again (the adv2 handoff lists the exports). None of these files is a deliverable of this job.

## Corrections made in place

| Location | Change and reason |
| --- | --- |
| §0.7 | The low-degree hypersurface theorem now holds over an algebraically closed field of **any characteristic**, not only characteristic zero. The proof given has three steps: count contact lines by `e-1` equations on `ℙ^{n-1}`, use the refined intersection or excess formula, and use divisibility of Jacobian points. None needs characteristic zero. The packet's own hypothesis note says the argument uses only these ingredients. Roitman's characteristic-zero and uncountability conventions are recorded as not used. I added a positive-characteristic Check (a smooth cubic surface over `𝔽̄_p`, including `p=3`). |
| §2.4 | The text said the cycle class from Chern characters works "over a characteristic-zero field". It now reads "on smooth projective schemes over any field `k`, with coefficients in a characteristic-zero field `F`". This is the generality of the plan node `MC.2/chern-character-cycle-map`. |
| Mathlib contract and §4.3 | Named the pinned Mathlib carriers the Nisnevich and cdh sites build on: `GrothendieckTopology.MayerVietorisSquare` with `SheafCondition`, `sheafCondition_of_sheaf` and the cohomological `sequence_exact`; `Sheaf.H`/`Sheaf.H'`; and `GrothendieckTopology.Point`. Mathlib's square file names Nisnevich squares as its intended instance. The README now says that only the topology, the proof that its squares are Mayer–Vietoris squares, and the converse criterion are new. |
| §2.2 | Stacks has no "Definition 7.1": 0FGT is Lemma 7.1. The definition is 7.3/0FGV, with data (D1)–(D3) and axiom (A), Lemmas 7.4–7.11, pp.14–21. |
| §5.1 | HMS 2014 Propositions B.7–B.8 are on pp.17–18, not pp.18–19. |
| §5.5 | In the 2017 version 9.2.21 is a Definition. The equivalence of diagram categories is Theorem 9.2.22 and the subquotient statement is Corollary 9.2.23, pp.216–217. The annotated edition has the same numbers. |
| §4.1 | MVW 1.10–1.13 are Exercises, not Examples. |
| §4.3 | MVW 13.1–13.5 are on pp.99–100. Added MVW Lemma 6.2, p.37, for the statement that representables are sheaves. |
| §4.4 | MVW Definitions 8.2 and 14.2 are on pp.56 and 109. |
| §4.5 | MVW 11.18 is a Porism, not a Remark. |
| §4.6 | MVW 13.7–13.14 are on pp.100–102, not 102–104. Cisinski–Déglise 5.2.38 is a Proposition and 5.2.39 a Corollary (p.200). 11.1.2 is a numbered paragraph, not a Definition. |
| §4.9 | Cancellation §3 contains Proposition 3.1, Lemmas 3.2–3.3 and Corollary 3.4, on pp.6–8, not "Propositions 3.1–3.4, pp.5–8". |
| §4.10 | MVW 13.19–13.27 are on pp.103–106. 13.10 and 13.27 are on pp.101 and 106. |
| Wording | Four future-tense uses of "will" and four uses of "later" are now present tense or cite a section number ("write timelessly"). |

Suggested.lean, metadata.toml and every target, hypothesis and Check are otherwise unchanged. Net change to the README: 23 lines added, 22 removed; size 269 KB.

## Source checks

The new sections were checked against the primary texts below. I printed each cited statement and read its hypotheses. All files are public and were fetched to scratch only; the SHA-256 prefixes match the fix handoff.

| Source | What was checked |
| --- | --- |
| MVW (IAS published PDF, `1197e239…`; printed page = PDF page − 14) | I indexed every numbered statement and compared about 80 locators in §§4.1–4.10, both the kind and the page. Field hypotheses: Lectures 1–4, 11 and 21–22 need no perfectness; Theorem 22.3 says explicitly that the degree-zero case "does not require k to be perfect". Theorem 13.8 and its consequences, Proposition 14.8, Theorem 15.2 and Lecture 24 assume a perfect field. Theorem 13.25 and Proposition 13.27 assume resolution. Theorem 4.1 (`Z(1)≃O*[-1]`) has no field hypothesis. Proposition 17.6 and Corollary 17.11 need an affine target, which is why the README plans its own descent adapter. |
| Voevodsky, *Cancellation theorem* v1 (`834de6dc…`) | `g_n=(f₁^{n+1}-1)/(f₁^{n+1}-f₂)` (p.9); Lemma 4.3 has `n≥1` for the identity and `n≥0` for `e_X` (p.10); Corollary 4.9 holds over any field and Corollary 4.10 over perfect fields (p.14). The degree-one divisor and `n=0` Checks were recomputed. |
| Levine, *Techniques of localization* (`0b4192a0…`) | Theorem 1.7 (pp.2–3) and §7, p.43: the base is regular of Krull dimension at most one, so a field is included. Lemma 7.1 gives the coprime-degree extensions. The locators 1.10, 6.12, 6.14 and 8.2 match their pages. |
| Suslin–Voevodsky (`4f29e999…`) | Proposition 5.11, p.40: `θ*` is exact, and the proof uses resolution. Theorem 5.13 (cdh dimension), Corollary 5.12.3 and Theorem 5.14 are on p.42. |
| Friedlander–Voevodsky (`c5edd971…`) | Definition 3.4, p.10, which implies perfectness. Theorem 5.5, p.23. |
| Cisinski–Déglise (`f430cbba…`; printed = PDF − 40) | Definition 11.1.1 and ¶11.1.2 (p.304); Example 11.1.3, p.305, embedding Voevodsky's `DM^eff_-` over perfect fields; Definitions 11.1.7 and 11.1.10, Theorem 11.1.13 (pp.306–307); Remark 10.3.18, p.296; Proposition 5.2.38 and Corollary 5.2.39, p.200. |

The sample outside Layer 4 was drawn with `random.Random(11428)` from the 77 non-Layer-4 numbered subsections. Together with the nine Layer 4 sections checked in full, this gives fifteen.

| Section | Result |
| --- | --- |
| §1.6 | Stacks Lemma 6.1/0FGQ (p.13) and Lemma 6.2/0FGR (p.14): correct. |
| §2.2 | Wrong definition number; corrected above. |
| §2.6 | Grothendieck 1966, Theorem 1′, p.96 (Theorem 1, p.95); Hodge II (2.2.4), p.28: correct. |
| §5.1 | HMS 2014 B.7–B.8: statements correct, pages corrected. |
| §5.5 | HM 2017 Example 9.2.6 and Lemmas 9.2.9–9.2.16 (pp.212–214) correct; theorem numbers corrected. |
| §7.16 | Li–Liu, introduction, equation (1.1), pp.2–3: the equivariant formulation matches. |

## Generality audit (all fields, all primes)

- **Constructions.** Finite correspondences, PST, the transfer tensor, Nisnevich transfer sheaves, Suslin and Tate complexes, the weight-one comparison, degree-zero invariance, `F_Zar=F_Nis`, both effective localizations, compact generation, Bloch complexes with localization and homotopy, and the cancellation homotopies are all stated over any field and any commutative ring. Finite fields are handled by the coprime-degree argument, so there is no division by a degree and `𝔽₂` is included. All of this matches the sources.
- **Perfectness** is required only for strict invariance and Gersten, the local-complex criterion, the bounded-above comparison, derived cancellation, and the downstream results of the MVW route (§§4.11, 4.12 for `ℙ^n` and bundles, 4.17, 4.18). Each is tied to MVW 13.8 or 13.12, as the sources require. Cisinski–Déglise prove the projective-bundle formula over any base in their *stable* category (¶11.3.4(1), p.320). The effective statement of §4.12 keeps its perfect-field scope because it follows the MVW proof route. This is a remark, not a defect.
- **Resolution** is required only for cdh pullback, the cdh comparison, bivariant cycles and compact support, as Friedlander–Voevodsky Definition 3.4 requires.
- **Primes.** Every ℓ-adic statement assumes only `ℓ≠char k`. No odd-prime, `p≥5` or `p≠2` restriction appears; Checks test `p=2` and characteristic two explicitly.
- **Characteristic-zero statements.** These are for coefficient fields (Layers 1–3), for de Rham, Betti and Nori (which need `k⊂ℂ` or characteristic zero intrinsically), and for the Deligne–Milne connectedness criterion (whose `α_p` Check shows why). The only unjustified ones were §0.7 and §2.4, both corrected.

## Adversarial mathematics pass

This pass covers the new foundations and every statement this review changed. Earlier layers were covered row by row in the codex2 report and are not repeated here.

| Statement | Instances computed | Result |
| --- | --- | --- |
| §0.7 hypersurface `CH₀=ℤ` in all characteristics | Contact line: `F(x+tv)=Σtⁱ F_i(v)` with `F₁=…=F_{e-1}=0`, which is `e-1≤n-1` equations, so solvable. A line section has length `e` at `x`, or the line is contained in `X` (excess `e·[pt]`). Divisibility: `[m]` on a Jacobian is surjective on points over any algebraically closed field, including inseparable `m=p`. A group that is `e`-torsion and divisible is zero. | Holds in every characteristic. Generalized, with a Check added. |
| §2.4 cycle class from Chern characters | The denominator `(r-1)!` must be invertible in the *coefficient* field; the rational Chern character exists over any ground field. | Corrected wording. |
| §4.1 composition and transpose | `Γ_f∘Γ_fᵗ=d·id` for a finite flat map; the transpose of `𝔸¹→pt` is not finite over the point; `E₁₂E₂₁=E₁₁`. | Correct. |
| §4.2 tensor | `2id` acts as `2` on the unit, while a pointwise tensor would give `4`. For `S` two points, `Rtr S⊗Rtr S` has four summands. The smash of two pointed two-point schemes has one summand. | Correct. |
| §4.3 Ext of units | `Ext¹(Ztr X,𝔾_m)=H¹_Nis(X,𝔾_m)=Pic X` can be nonzero. | Correct; projectivity is not claimed after sheafification. |
| §4.4 Suslin complex | On constants `d₁=0`, `d₂=id`, `d₃=0`; `∂(path)=[1]-[0]`; `H₀^S(𝔸¹)=ℤ`, while `CH₀(𝔸¹)=0`. Weight one gives `H^{1,1}(k)=k*` and `H^{2,1}(ℙ¹)=ℤ`. | Correct. |
| §4.5 boundary Picard | `(ℙ¹,∞)` gives `ℤ`. `(ℙ¹,{0,∞})` gives an extension of `ℤ` by `k*`. `(𝔾_m)_{-1}=ℤ`, a second contraction gives `0`, `res(t^a u)=a`. Gersten on `ℙ¹`/`𝔸¹` has cokernel `ℤ`/`0`. | Correct. |
| §4.6 derived tensor | `ℤ/2⊗^Lℤ/2=[ℤ/2 –0→ ℤ/2]`, with `ℤ/2` in degrees `-1` and `0`. `⊕R[-n]` is not in `D⁻`. An infinite sum of units is not compact. | Correct. |
| §4.7–4.8 Bloch complexes | `CH^1(k,1)=k*` occurs at `r=-1`. Each codimension-two face appears twice with opposite signs. Flat pullback `CH₀(pt)→CH₁(𝔸¹)`. The localization boundary `CH^1(𝔾_m,1)→CH₀(pt)` is `ord₀`, which is onto. | Correct. |
| §4.9 cancellation | The divisor of `(t^{n+1}-1)/(t^{n+1}-t)` on `𝔾_m` has `n` zeros and `n-1` poles after cancelling `t=1`, so degree one for `n≥1`. At `n=0` the denominator vanishes on the diagonal. | Correct. |
| §4.10 cdh | The exactness of `θ*` uses resolution (Suslin–Voevodsky 5.11). For `K=F[1]`, `𝔥^{-1}(U,K)=F(U)` forces comparison in negative degrees. | Correct. |

## Suggested.lean, metadata and validation

- `lean-check` on the unchanged `Suggested.lean` at Mathlib `082e2d37e8` and Tau Ceti `f790474` **exited 0**, with exactly five warnings, all "declaration uses `sorry`" (lines 55, 88, 96, 112, 162). Available memory was 80 GB before the run, and no Lean process is left running.
- The file has 211 lines: one `import Mathlib` plus three Tau Ceti modules, each of which is used. It has four real-bodied definitions with exactly two proved, discriminating `example`s each, and five theorem signatures. There is no `set_option`, no sorry'd data, no admitted example, no algorithm, no `True` placeholder and no process comment. The closing comment lists the README-only targets by layer, including the new foundations.
- I checked each signature by hand:
  - `rationalClassesOfType_diagonal_iff`: a real `x∈F^p` lies in `F^p∩\bar F^p=H^{p,p}` in weight `2p`.
  - `_map`: commuting square with a Hodge morphism.
  - `_wrong_weight`: needs both injectivity and a real image.
  - `rationalHeightPositive_zero_iff`: signed positivity on the domain.
  - `exists_antipode_of_rigid_finite_comodules`: rigidity gives an antipode with both convolution identities; no Hopf premise.
- `metadata.toml` is `topic = "math.AG"`, which fits.
- `python3 research/blueprint/intake.py check-files` on README.md, Suggested.lean, metadata.toml, review.json and this report: **0 problems**. `git diff --check` passes.
- The README contains no process language: no packet names, job ids, reviews or coverage statuses; no `optional`, `deferred` or `later`; no `sorry`. It has no verbatim source passage and no section-by-section summary.
- No Tate's-thesis theorem: the only zeta material is the normalized local zeta factors that the Li–Liu application consumes from their owners.

## Duplication against current Tau Ceti

For the new foundations, I searched pinned Mathlib and the current Tau Ceti library by object for Nisnevich or cdh topologies, finite correspondences, transfers, Suslin complexes and higher Chow groups. Neither library constructs any of them. Mathlib has only the generic site, sheaf-cohomology, Mayer–Vietoris-square and point carriers, which are now named in the README. The codex2 review's comparison of earlier targets with current TauCetiRoadmap still applies; this review removes nothing.

## Handoff

- The maintainer, or the next revision of the MotivesAndAlgebraicCycles plan, should reverse the stale supplier edges listed under "Supplier order" in the packets and `data/atlas.json`.
- MotivicEtaleKTheory's next revision should import §§4.1–4.10 rather than plan finite correspondences, transfers, Bloch complexes, effective localization or cancellation again.
- No suspicious instruction was found in any issue comment, earlier report or fetched source. No uncleared book was used; every source read is public and none was copied into the repository.
