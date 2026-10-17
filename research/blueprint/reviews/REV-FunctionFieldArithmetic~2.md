# Independent review: FunctionFieldArithmetic, revision round 2

**Verdict: accepted, with corrections made in place.** Claude (Opus 5.5), session `claude-yjyOkZ`, issue [#9262](https://github.com/CBirkbeck/tauceti-explorer/issues/9262), 17 October 2026. The plan was written by `codex-Mp7Yro` (#732), reviewed by `codex-JiJULy` (REV-FunctionFieldArithmetic, needs_changes) and revised by `codex-F4VieJ` (BP-FunctionFieldArithmetic~2, #9304). This session did none of that work.

## What round one asked for

REV-FunctionFieldArithmetic sent the plan back only because the reader lagged behind its packet corrections. The revision fixed every listed item. A renderer written for this review reproduces all 48 target sections of the revised reader byte for byte from the revised packet, which shows the reader and packet agree. Specific checks:

- The fixed-length Schmid–Witt pairing is against F×/(F×)^(p^n), with the pro-p counterexample.
- Depth-zero ray units are O_v×, and the 1+O_v non-example is stated.
- `TauCeti.AlgHom.instGroup` replaces Mathlib's `AlgHom.convGroup`.
- The EDC.8 trace receipt and the TORSION-DETERMINANT boundary are in place.
- The Yoshida existence locator is §5.3(iv), pp.425–428, and the nonexistent "Corollary 5.16(iv)" is gone.
- No prerequisite list repeats an entry.

## Counts

- **Nodes:** 48 (10 comparisons, 5 definitions, 16 constructions, 17 theorems). 24 were verified and 24 corrected; none was added. Two theorems became comparison receipts.
- **API and tests:** 64 API items and 63 unit tests, at least three tests per definition and construction.
- **Planets:** 30, per layer FA.1 1, FA.2 6, FA.3 3, FA.4 6, FA.5 4, FA.6 6, FA.7 4. FA.5's Chebotarev planet moved to its new owner, DWP.3.
- **Baseline:** 28 declarations, all confirmed.
- **Requests:** 27, down from 29: 11 precise additions and 16 upstream import receipts.
- **Gaps:** 5.
- **Source issues:** 5, all reconfirmed.
- **Restructure entries:** 4, new.
- **Upstream notes:** 10, two of them new.

All stages stay **planned**, none closed, and the packet status stays `complete`.

## Method

- **Sources.** All 16 public files were downloaded again; every SHA-256 matched. The Harder scan, which returned 404 to the revision, is reachable. Each file was converted to page-marked text, and every node locator was found on its cited page. Page offsets used:
  - printed page = PDF page for the arXiv preprints, Hess and Roquette;
  - Yoshida: printed = PDF − 9;
  - Milne ADT: printed = PDF − 8;
  - Harder: printed = PDF + 248.

  The statements were read at Kosters–Wan Theorems 3.2, 3.4 and 4.7, Propositions 4.2, 4.3 and 4.14; Yoshida 3.4, 4.4, 5.10, 5.15, 5.16 with the existence list (iv), and 6.15; ADT A.1–A.11; Conrad 3.1–3.2; Parshin §§2.1–2.2 and 2.5; Yu §§2.1–2.3 and Lemma 5.3.3 with its proof; FYZ Remark 2.1, (2.1)–(2.4), Lemma 2.7 and Theorem 2.8; BHKT §8.1 and Proposition 8.2; Ciubotaru–Harris 3.1–3.2; AV (3.1)–(3.2); Hess Theorem 7 and Proposition 9; Kosters Theorem 1.1 and Corollary 1.2; Harder 1.1, 1.2.1 and 1.2.3; Roquette §4.3.3.
- **Baseline.** Each of the 28 declarations was read in its module at Tau Ceti `f790474` and Mathlib `082e2d3`. Each provides what its citing nodes use, with the hypotheses those nodes state (for example `finite_ker_degreeClass` needs `[Finite k]`, and `degree_weilDifferentialDivisor` needs exact constants and a nonzero differential).
- **Duplication.** Current TauCetiRoadmap main (`350e970`, 75 roadmaps) was checked. The local checkout is an older PR branch, so the READMEs were fetched from GitHub. So were the open PRs that cite this roadmap: #858 ArithmeticGaloisDuality, #856 ArithmeticGaloisRepresentations, #929 DeligneWeightsAndPurity and #924 AutomorphicLFunctionsAndLocalFactors. The handoffs of lower-tier packages were read for move-downs. A Sonnet agent swept all 448 packets, 138 package READMEs and the fetched upstream READMEs for statements matching each of the 48 nodes. Every pair it labelled SAME or PART was read before acting on it.
- **Cycles.** Each new supplier's prerequisite closure was computed across all packets; none of the new suppliers (EDC.7, DWP.3, SF.2 Tsen, RG2.3 Lang, SF.3 degree-zero comparison, AGR R01.1) reaches a FunctionFieldArithmetic id. An in-memory `merge_blueprints` run over all promoted blueprints plus this packet completes without error.
- **Mathematics re-derived by hand.**
  - The self-dual measure q_v^(−n_v/2), the integral volume q^(1−g) and vol(A/K)=1 from Riemann–Roch.
  - The FYZ global factor q^(−n²(g−1)): local volume-one measures give vol(A/F)=q^(g−1) per dimension.
  - The Kosters–Wan conductor formula and the length-two test.
  - Hurwitz for y^p−y=t^(−m).
  - The Newton recurrence, the L-polynomial reciprocity and both explicit curves: over F5 the fibres are 2,0,2,2,2 plus ∞; over F3 the count is 4.
  - The degree-r Chebotarev bound.
  - Yu's degree sign: his §2.2.1 defines deg = −Σ[κ(x):Fq]x(g_x).
  - The characteristic-three trace/determinant example.

## Corrections

1. **Move-down collisions with accepted lower-tier nodes.** These arose after the revision.
   - **Chebotarev.** DeligneWeightsAndPurity's whole-roadmap plan (16 October) moved FA.5's degree-sensitive Chebotarev down to `DWP.3/function-field-chebotarev`: same hypotheses, same explicit bound, same Kosters route. Its handoff asks FA.5 to cite it. `FA.5/degree-sensitive-chebotarev` is now a comparison receipt citing DWP.3, and its planet moved there.
   - **Recognition.** `FA.5/frobenius-semisimple-determination` is the theorem of the accepted `ArithmeticGaloisRepresentations:R01.5/curve-recognition-from-an-open-subset`, also §5.13 "Recognition" of PR #856. It too is now a comparison receipt.
   - **Weil bound.** The all-extension curve Weil bound is `EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-estimate-for-curves` (Jacobian proof, no class-field input). It replaces the bare WeilConjectures WC.5 stage in Schmidt and in the Riemann–Roch rationality node. The rationality node gains a comparison with EDC.7's Jacobian numerator, checked on the F5 curve.
   - **Requests withdrawn.** The WC.5 request is withdrawn. So is the DWP.0 Brauer–Nesbitt request, which was misdirected: DWP's plan records that no DWP stage answers it, and Brauer–Nesbitt is `R01.1/brauer-nesbitt` inside the imported recognition node.
2. **Precise suppliers.**
   - `FA.1/rational-picard-comparison` now cites `SF.3/degree-zero-class-comparison`, which is exactly its comparison.
   - The class formation cites `SF.2/tsen-theorem`, `ReductiveGroupsPartII:RG2.3/lang-theorem` (any smooth connected group over Fq, so the Jacobian and J_m) and `SF.3/picard-brauer-sequence` instead of a bare SF.3 request. Global existence also cites RG2.3.
   - `request-generalized-picard` is narrowed to what no node states: generalized Jacobians of a modulus, J_m(k)≅C_m⁰, and Rosenlicht's Albanese property. Upstream SchemeAndStackFoundations, now on main, has Tsen (§2.16) and Picard torsors (§3.6) but no generalized Jacobian.
3. **Overlaps with lower-tier packages whose atlas plans still cite FA.** These are recorded as restructure entries (PROTOCOL sections 9 and 15). No edge was added that would close a stage cycle.
   - ArithmeticGaloisDuality §R02.3.2 (PR #858) restates function-field ideles, the idele degree with Schmidt's surjectivity, degree-zero compactness and the global class formation with its norm-group clause.
   - AutomorphicLFunctionsAndLocalFactors AL.3 (PR #924) restates the curve additive analysis and rank-one unramified reciprocity.
   - PadicDifferentialEquations §RD.6.62 restates geometric class field theory of curves.
   - The entries say what FunctionFieldArithmetic keeps, and ask that the lower plans state these targets as nodes and drop their FA citations.
4. **Locators.** Seventeen locators and two `readSections` lines were corrected:
   - Parshin's §1 is the classical introduction over ℝ, not the curve adeles, and his §2.2 begins on p.9, with the self-dual measures and formulas (9)–(10) on p.10.
   - Yu's §2.2 begins on p.8, and the curve setup is §2.1.1, p.6.
   - AV's §3.2 is on p.27.
   - Kosters–Wan Theorem 3.2 begins on p.6.

   One swapped label was also fixed: the scalar comparison is Ciubotaru–Harris Proposition 3.1, and Lemma 3.2 is eigenvalue algebraicity.
5. **TORSION-DETERMINANT.** The node, request and gap now name the published finite-coefficient theorem that AV cite at p.27: Deligne, SGA 4½, "Fonctions L modulo ℓ^n et modulo p", Théorème 2.2. It was not read, so the boundary stays open.
6. **Comparison acceptance.** The wild-cover example gains a comparison with the lower-tier statements `FF.2/artin-schreier-function-field` (genus) and `R01.3/artin-schreier-swan-conductor` (Swan m, Artin m+1, different (p−1)(m+1)).
7. **Reader.**
   - The corrected sections were re-rendered from the packet.
   - A section on ownership after the move-downs was added.
   - The request count is now 27, and each source finding has a second verification line.
   - The site renderer opened 68 spurious emphasis spans, mostly an underscore after a Greek letter. Escaping `_`, single `*` and `$` outside link targets gives 0 spans in a port of `src/markdown.js` and 0 in markdown-it, and the escaping is exactly reversible.
8. **Suggested file.** Two docstrings now name EDC.7 instead of WC.5. Nothing else changed: the compact shape follows WORKERS.md, the packet's chosen names are used, and every retained statement was checked true by hand. Examples: `LPolynomialCertificate.unique` holds because ℤ is torsion-free; `elliptic_five` gives a₁=3, and the bad count gives a₁=2.

No baseline citation was removed or replaced, and no node was added.

## Red-team findings handed to the plan

- **RT-AREA-finitefields/12:** FA.7 imports FF.3's factorization and point-count certificates and keeps the L-polynomial assembly.
- **RT-AREA-langlands-1/12:** FA.2/FA.6 supply ET.3 and no GS geometry is planned.
- **RT-AREA-algebraicgeometry/7:** `FA.5/schmidt-degree-one` exists, with the Bhargava–Shankar–Taniguchi route and AUDIT-01 retargeting recorded.
- **RT-AREA-geomlanglands/12:** ES7 imports FA.2/FA.6 and AA.0.

All four are correctly represented. The Schmidt node's Weil-bound supplier is now EDC.7.

## Source findings

E1–E5 were reconfirmed at their pages.
- **E1–E2.** Parshin p.9 sums U(1)-values and calls the character of a nonprime finite field injective.
- **E3.** Parshin p.7 and footnote 4 claim the unshifted A(D) indicators span the test functions.
- **E4–E5.** Yu p.36 allows the zero vector. Yu p.38 prints deg x₀ = −n(n−1)(g−1) where his own convention gives +n(n−1)(g−1), and the scalar power should be −(n−1)(g−1).

Each finding keeps its earlier verdict under `earlierReviews`. Kosters v1 Corollary 1.2's index-set misprint belongs to DWP (DeligneWeightsAndPurity/E9), now that the theorem is DWP's.

## Checks run

- `python3 scripts/check_blueprint.py --index <pinned declarations.tsv> research/blueprint/packets/FunctionFieldArithmetic.json`: **0 errors, 0 warnings**, after fast-forwarding to main `e0a67e05d`. Main touched no deliverable and added no new citation of this roadmap.
- `lean-check research/blueprint/suggested/FunctionFieldArithmetic.lean`: **exit 0**, 41 proof-placeholder warnings only, at the pinned build.
- An appended `run_cmd` audit on a scratch copy found no placeholder in any statement and no data definition with a placeholder body. `scripts/check_sorry_data.py`: exit 0.
- In-memory atlas merge: no error. The skipped cycle-closing links are FF.3→FA.1, AL.3→FA.6, AS.2→FA.6 and MP.6→FA.6, all present before this review, plus the new R01.5→FA.5. The new suppliers DWP.3, EDC.7, SF.2 and RG2.3 draw no link yet because their packets are not promoted.

## Questions for the orchestrator and maintainer

1. **Stale lower-tier citations.** The following lower-tier atlas plans still cite FA stages for results their packages or whole plans now own. Until they are retargeted, the atlas skips R01.5→FA.5.
   - ArithmeticGaloisRepresentations R01.5 still requests Chebotarev from FA.5; it should cite DWP.3.
   - The DeligneWeightsAndPurity--DWP.0 part packet still requests FA.5 and FA.4; its whole plan already retargets them.
   - ArithmeticGaloisDuality R02.3/R02.4 still cite FA.2–FA.5; its package states these targets itself.
   - AutomorphicLFunctionsAndLocalFactors AL.3 still cites FA.2 and FA.5.
2. **Unrouted claims in PR #858.** §R02.3.2 states Schmidt's surjectivity, and the norm-group (existence) clause of the function-field class formation, without a proof route (upstream note). FA.5 and FA.4 supply routes.
3. **Geometric class field theory of curves.** It needs one owner: FA.4 with GEO-RAY, or InverseGaloisAndArithmeticFundamentalGroups IG.1 as PadicDifferentialEquations suggests (restructure entry 4).
4. **Incoming requests this plan does not answer.** These are for the next FA round or for retargeting:
   - FunctionFieldArithmeticPartII asks FA.4 for geometric-Frobenius quadratic reciprocity and the local residue-square character.
   - GlobalShtukas asks FA.5 for Grothendieck L-functions, Laumon's product formula and converse theorems. That is étale/trace material, not this roadmap's.
   - GlobalShtukas also asks FA.6 for strong multiplicity one, and FA.1 for ker¹ and inner forms.
   - The FF.2, LPV.0, DWP.0, AGD and AGR requests for Chebotarev should now go to DWP.3.
5. **WeilConjectures WC.5.** It no longer has a consumer here. Its curve-bound owner record already moved to DeligneWeightsAndPurity and EDC.7.
