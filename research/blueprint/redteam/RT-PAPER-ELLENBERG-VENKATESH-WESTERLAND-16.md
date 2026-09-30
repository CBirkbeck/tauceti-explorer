# Red team: PAPER-ELLENBERG-VENKATESH-WESTERLAND-16 (Ellenberg–Venkatesh–Westerland, *Homological stability for Hurwitz spaces and the Cohen–Lenstra conjecture over function fields*)

Job `RT-PAPER-ELLENBERG-VENKATESH-WESTERLAND-16` (issue #4124), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-ELLENBERG-VENKATESH-WESTERLAND-16.result.json`, in the format of PROTOCOL section 17.

**Result:** 16 findings: 9 medium and 7 low.

- The extraction is careful: 137 items, 3 routes and 19 source issues. All 19 source issues stand. I recomputed the ones that rest on a calculation.
- The published paper has no correction. The famous withdrawal is of the sequel, EVW II. Its gap is in combining this paper's stabilization operator U with the sequel's operator V. It does not affect this paper, and the extraction records this correctly.
- **Routes.** The medium findings are mostly about routes:
  - two dependency cycles between the routes;
  - four places where the Part II or ArithmeticStatistics re-plans mathematics that IG.3/IG.5, Wood 19, Landesman–Litt 24 or Tau Ceti AlgebraicCurves already own;
  - two comparison theorems the paper uses with no item.
- **A missed source issue.** The published abstract claims the result for all large q. The proof fails for q ≡ 1 (mod ℓ).

## Independence

- **Who did the work.**
  - The extraction is by Codex `codex-a71f92` (#1843) and `codex-c83e7a` (#2039). Claude Code `cc-442dc5` completed it (#2109, 23 September).
  - The review, REV-PAPER-ELLENBERG-VENKATESH-WESTERLAND-16, is by `cc-7b31c4` (#2774, commit 51aab105, 24 September).
  - There is no separate errata file for this paper.
  - `cc-f805bf` appears in none of these files, nor in the register entries for this paper.
- **Disclosure.**
  - This session wrote PAPER-DELIGNE-74 and PAPER-DELIGNE-80 (Weil conjectures, purity).
  - It red-teamed Browning–Sawin 20 (PR #4792) and Koymans–Pagano (PR #4705).
  - No finding here relies on that work. Items /92 and /93 were checked against the atlas text itself.
  - RT-PAPER-BROWNING-SAWIN-20/3 already raised the question of who owns configuration spaces (EVW /8 and /66 against Browning–Sawin and Wood 19). It is not repeated here.

## What was read

- **The version of record.** Ann. of Math. 183 (2016), 729–786, from the Annals site, fetched 30 September 2026.
  - SHA-256 `6c10d770…a7f6`, the extraction's hash.
  - I read all of it through pdftotext.
  - I rendered p. 729 (the abstract) and p. 754 (Proposition 4.13) as images.
- **arXiv 0912.0325.**
  - The listing has v1 (2 December 2009), v2 (3 December 2009), v3 (2 July 2014, "substantial edits of sections 1–6") and v4 (1 December 2015, "final version").
  - None of them is withdrawn. I read v4's abstract.
- **The known published issue.**
  - arXiv 1212.0923 (EVW II) was withdrawn on 19 November 2013 "owing to a gap ... the homological stabilization maps used in this paper and the previous paper are not exactly the same".
  - Ellenberg's post of 23 November 2013 explains it. Randal-Williams found that EVW I proves U is eventually an isomorphism and EVW II proves V^k = 0, but the two cannot be combined. In the post's words: "We prove (and there is no problem here) that U is an isomorphism", and "the main theorems of both papers are correct".
  - Landesman–Levy (arXiv 2410.22210, §1.3 footnote) describe the gap the same way. Their 2503.03861 uses EVW16's Theorem 6.1 argument with no correction.
  - The extraction's Part II brief already insists on "the actual central operator U".
- **The repository.**
  - All items, routes, prerequisites, remaining work and source issues.
  - The review report and its table of changes.
  - The REGISTER entries for this paper.
  - The atlas text of every cited layer: FA.4, EDC.2:pairings, DWP.7, SF.2 (with the CohomologicalPointCounting externals), R09.4, and IG.0–IG.6. Also ST.0–ST.5, EDC.6 and the ComplexComparisonPartII stages.
  - The Tau Ceti READMEs:
    - AlgebraicCurves, Layers 3 and 10;
    - GeometricTopology, Layer 3 and the inventory;
    - UniversalCovers, Stage 4;
    - BelyiMaps and JacobianChallenge.
  - The ArithmeticStatistics and InverseGalois packets, and the queue.
- **Neighbouring extractions.** Wood 19, Liu–Wood–Zureick-Brown 24, Landesman–Litt 24, Klevdal–Patrikis 25, Chen 24, Browning–Sawin 20 and Bergström–Faber–Payne 24.
- **The pinned libraries,** Mathlib `082e2d3` and Tau Ceti `f790474`.
  - All 15 cited declarations exist.
  - I searched `declarations.tsv` for every topic of the paper: Hurwitz spaces, braids, configurations, quandles, Cohen–Lenstra, GSp and similitudes, the Weil pairing, the arc complex, asphericity, Tor, Lagrangians, CW complexes, trace formulas and squarefree counts.

## What holds up

- **The source issues, recomputed.**
  - **E6.** X = C9×C3 has 48 surjections onto C3², of which only 12 lift to C9×C3. The aggregate inequality 108 ≥ 96 still holds.
  - **E15.** ⟨[[0,1],[8,0]], [[1,7],[6,7]]⟩ ⊂ SL2(Z/9) has order 24 and maps isomorphically onto SL2(F3).
  - **E5.** Generators outside Q enlarge the monodromy, so U ≡ U_Q with coefficient 1.
  - **E8.** |S_1| = 2q.
  - **E10.** −I ∈ Sp(V) keeps the orbit count.
  - **E13.** ∏(1−3^{−i}) ≈ 0.560.
  - **E11.** The Kummer parametrization and tame A⋊Z/2 covers exclude characteristic 2, and §8 assumes ℓ ∤ q.
  - The others stand as read at their locators. E16–E19 were checked for soundness only.
- **The paper's own arguments,** re-derived:
  - the degree bookkeeping (6.1.4)–(6.1.5), and the ranges needed for Proposition 5.1;
  - the chain of estimates in Theorem 4.2;
  - Lemma 3.5, the estimate (8.8.3) and Lemma 8.9;
  - q ≡ −1 (mod ℓ) is correctly not excluded.
- **Statuses.**
  - The 15 library citations resolve at the pinned commits.
  - All 8 planned statuses are right. Item /93 at SF.2 is right because SF.2 is the integration owner of the CohomologicalPointCounting externals.
  - The §4 items are rightly missing. Mathlib has no noncommutative Tor, since TensorProduct needs a commutative ring, and Tau Ceti's Lagrangian API is over ℝ only.
- **Routes and counts.**
  - Every missing item is routed once (53 + 23 + 46 = 122).
  - No route goes into a finished blueprint: BP-ArithmeticStatistics, BP-InverseGalois… and DESIGN-InverseGalois…PartII are pending.
- **The errata bookkeeping.** The register has 19 entries for this paper, with no duplicates.

## Findings

| # | Severity | Kind | Where | What |
|---|---|---|---|---|
| 1 | medium | error | routes 1–2; items 15, 16, 65 | IG items depend on Part II items 10, 12 and 14, and the Part II's parent is IG. This is a cycle. |
| 2 | medium | error | routes 2–3; items 137, 100 | IG item 137 needs ArithmeticStatistics item 100 (GSp), while route-3 items need IG items. This is a cycle; it also closes through the Part II. |
| 3 | medium | duplicate | route 1: items 11–14, 17, 22, 24–26 | IG.3 plans the braid action and IG.5 the Hurwitz moduli. Wood 19/255 (IG.3, accepted a day earlier) plans the braid-orbit monoid and its central power-block element, using the same Fried–Völklein lemma as Prop. 3.4. LWZB even says EVW routes these to IG. |
| 4 | medium | duplicate | item 69 | Proposition 7.8's comparison (7.8.2) is Wood 19/86 and /259 at IG.5. |
| 5 | medium | duplicate | items 9, 10 (and 50–52) | The punctured-disc mapping class group and its action on π_1 belong to Landesman–Litt 24's new MappingClassGroups roadmap (items 113, 51) and Tau Ceti GeometricTopology Layer 3. |
| 6 | low | library-claim | items 9, 13 | Tau Ceti's `IsAspherical`, `IsEilenbergMacLaneSpaceOne` and `IsCoveringMap.isEilenbergMacLaneSpaceOne_totalSpace` are uncited. The §1.3 fact that Hurwitz components are K(π,1) with π ⊆ B_n has no item. |
| 7 | medium | duplicate | items 83, 96 | The bridge Cl(O_L) ≅ Pic⁰ for one rational place at ∞ (Layer 3) and the genus formula for y² = f(x) (Layer 10) are Tau Ceti AlgebraicCurves'. |
| 8 | medium | missing | §§7.4, 7.8 | No item for Artin's comparison theorem (SGA 4 XI 4.4) or for the étale/topological π_1 comparison (SGA 1 XII 5.1). |
| 9 | medium | missing | item 97; prerequisites | No item or prerequisite for Katz–Lang's classification: A-covers of a curve correspond to surjections Jac[ℓ^k] ↠ A. |
| 10 | low | missing | items 106, 135 | No item for the reduction to the lattice: Sur(V,A) = Sur(T,A), and GSp_q(T) ↠ GSp_q(V). |
| 11 | medium | other | sourceIssues | The published abstract and p. 730 claim the result for every q > Q. The proof fails for q ≡ 1 (mod ℓ): with A = (Z/ℓ)² there are ℓ rational components. The arXiv listing abstract has the congruence, the PDF does not. |
| 12 | low | other | sourceIssues; item 43 | A misplaced parenthesis in Proposition 4.13 is not recorded. |
| 13 | low | error | items 51, 54 | The review's locator "Lemma 5.4" for arc connectivity is wrong. Lemma 5.4 is the d_1 formula, which belongs to item 54. |
| 14 | low | duplicate | item 68 | The horizontal-tameness step is Klevdal–Patrikis 25/019, in the IG Part II accepted 13 hours earlier. |
| 15 | low | other | sourceVersions; REGISTER | sourceVersions is missing although four findings affect stated results. E15–E19, which are mistakes in Achter–Pries and Vasiu, are filed under EVW in the register. |
| 16 | low | other | the .md | The report still says "Proposition 8.9" for E12, and says every numbered statement is an item although Conjecture 1.5 is not one. |

## The main points in more detail

**The route cycles (1, 2).**
- The review checked that the 243 item-level edges are acyclic, but not the edges between routes.
- **Finding 1.** Route 2 sends /15, /16 and /65 into IG. They depend on /10, /12 and /14, which route 1 sends into a Part II whose first prerequisite is IG itself. The fix moves the §2 vocabulary into IG.3 and IG.5, which own it anyway (finding 3).
- **Finding 2.** /137 (the arithmetic/geometric monodromy quotient) goes to IG but needs GSp from /100 in ArithmeticStatistics. Meanwhile ArithmeticStatistics needs IG's /63, /131–/133 and /137. The fix moves /137 to ST.5, its only consumer (/99) being there.

**Duplicates (3, 4, 5, 7, 14).**
- **Findings 3 and 4.** IG.3 plans "the braid action" and IG.5 "Hurwitz moduli with braid/Nielsen-class components". Wood 19 and LWZB 24, accepted the day before, routed the braid monoid, the stable orbit classification and the Hurwitz-scheme comparison there. LWZB's reason even states that EVW does the same.
- **Finding 5.** The mapping class group of the n-punctured disc is the case g = 0, b = 1, p = n of Landesman–Litt's PMod_{g,b,p}.
- **Finding 7.** The Tau Ceti AlgebraicCurves roadmap plans both general facts that items /83 and /96 contain. Tau Ceti roadmaps are never re-planned.
- In each case the fix keeps the EVW-specific part and imports the rest.

**Missing inputs (8, 9, 10).**
- **Finding 8.** Proposition 7.8 cites "the comparison of étale and analytic cohomology [6, Th. 4.4, Exposé XI]", and Lemma 7.4 cites "comparison of étale and topological π1 [31, Exp. XII, Th. 5.1]". Neither appears as an item.
- **Finding 9.** On p. 779 the generic fibre is identified with surjections from Jac(C)[ℓ^k] through Katz–Lang (2.4). That is the only link between the Hurwitz fibre and the symplectic module, and the extraction has neither an item nor a prerequisite for it.

**The missed source issue (11).**
- The abstract reads: "for q greater than Q, a positive fraction of quadratic extensions of F_q(t) have the ℓ-part of their class group isomorphic to A".
- The sentence after Theorem 1.2 reads: "for q > Q_0(ℓ), a positive fraction … divisible by ℓ, and a positive fraction … indivisible by ℓ".
- Neither carries Theorem 1.2's condition q ≢ 1 (mod ℓ). The paper offers only "the method of proof still works" for q ≡ 1.
- **Why the method does not go through.** Take A = (Z/ℓ)² and q ≡ 1 (mod ℓ).
  - GSp_q(V/ℓ) = Sp, so the identity fixes every surjection, and every Sp-orbit is Frobenius-stable.
  - The orbits are separated by the pairing value ω(f₁*, f₂*) ∈ F_ℓ, so there are ℓ of them.
  - So the moment tends to ℓ, not 1, and Proposition 8.3 does not apply.
- This is a gap in a stated result, beyond E11, which covers only characteristics 2 and ℓ.
- The arXiv listing abstract (all versions) states the congruence and the printed PDF does not, so the fix is to record it rather than to call the claim false.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-ELLENBERG-VENKATESH-WESTERLAND-16.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both files: 0 problems.
