# PAPER-DEMARCO-KRIEGER-YE-20: Uniform Manin–Mumford for a family of genus 2 curves

Laura DeMarco, Holly Krieger and Hexi Ye, *Uniform Manin–Mumford for a family of genus 2 curves*, [Annals of Mathematics 191 (2020), 949–1001](https://doi.org/10.4007/annals.2020.191.3.5); arXiv [1901.09945](https://arxiv.org/abs/1901.09945).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1127). Status: **complete**. The whole of arXiv v2 was read and every missing item is routed once. The machine-readable extraction is [PAPER-DEMARCO-KRIEGER-YE-20.result.json](PAPER-DEMARCO-KRIEGER-YE-20.result.json): 53 items (3 library, 10 planned, 40 missing), 3 routes, 12 prerequisite entries and 13 recorded source issues. The independent review (REV-PAPER-DEMARCO-KRIEGER-YE-20) corrected it in place; its changes are listed at the end.

**Source.** arXiv v2 (3 December 2019, the latest and post-referee version; 49 pages), [PDF](https://arxiv.org/pdf/1901.09945v2), SHA-256 `8fc51ac36f9fc4b406c7bb44cdeccf31386e81e0a471176a69e80a1a0766bab8`, read in full on 2026-09-22. Locators refer to v2. The review later read the published Annals version, which is freely available from the journal site; its differences are listed at the end.

## What the paper proves

- **Theorem 1.4.** Take the Legendre curves E_t : y² = x(x−1)(x−t) with projection π(x,y) = x. Then |π(E_{t₁}^tors) ∩ π(E_{t₂}^tors)| ≤ B uniformly for t₁ ≠ t₂ in ℂ ∖ {0,1}. Corollary 8.2 is the case of the Bogomolov–Fu–Tschinkel conjecture in which three branch values are shared.
- **Theorem 1.1.** Every bielliptic genus-2 curve X over ℂ has |j_P(X) ∩ J(X)_tors| ≤ B at every Weierstrass point P.
- **Theorem 1.9.** For the same curves over Q̄, there is a uniform bound on the points of j_P(X) with Néron–Tate height at most b.

The method treats the Lattès heights ĥ_t (the Néron–Tate height pushed down to ℙ¹) as adelic heights, and bounds their Arakelov–Zhang pairing ĥ_{t₁} · ĥ_{t₂}, a distance between heights, from both sides:

1. **Lower bounds (§§3–6).**
   - At finite places the local energies are computed exactly from interval measures (Theorem 3.1).
   - At archimedean places, as the parameters run into the cusps, the energies are estimated by degenerating to a Berkovich line in the hybrid space, using Favre's and DeMarco–Faber's theorems (Theorems 5.1–5.5).
   - Balancing good and bad places gives ĥ_{t₁} · ĥ_{t₂} ≥ α h(t₁,t₂) − β (Theorem 1.6, α = 1/512), and then a uniform δ > 0 (Theorem 1.5).
2. **Upper bound (§7).** Many common small points force the two heights to be close to the height of a regularized finite set. This uses Fili's triangle inequality, Proposition 4.4 and the positivity of mutual energy, and gives ĥ_{t₁} · ĥ_{t₂} ≤ 4b + (ε + C(ε)/|S|)(h + 1) (Theorem 7.1).
3. **Counting (§§8–9).** Combining the two gives Theorem 8.1 over Q̄, and specialization gives Theorem 1.4 over ℂ. Bielliptic genus-2 curves are lifts of the diagonal of ℙ¹ × ℙ¹ (Proposition 9.1), which gives Theorems 1.1 and 1.9.

## What the atlas already has

- **Library.**
  - Mathlib has Weierstrass curves (the Legendre family is an instance), division polynomials `WeierstrassCurve.ψ`, and the Weil height `Projectivization.logHeight`.
  - Tau Ceti has the Néron–Tate height on elliptic curves, `WeierstrassCurve.Affine.Point.canonicalHeight`, which vanishes exactly on torsion.
- **Planned.**
  - ArithmeticDynamics DY.1 (canonical heights of polarized maps, which includes ĥ_t) and DY.4 (equidistribution).
  - TropicalAndBerkovichArithmetic TB.0–TB.1 (the Berkovich line).
  - HeightsRationalPointsAndObstructions RP.0 (heights under rational maps, and Néron–Tate functoriality) and RP.5 (Manin–Mumford).
  - Tau Ceti AlgebraicCurves layer 7 (Riemann–Hurwitz) and JacobianChallenge layers D–F (Jacobian and Abel–Jacobi).

## Routes

1. **Source of ArithmeticDynamics DY.2, DY.4 and DY.6.**
   - DY.2 gets the escape rates at all places and the canonical measures of the Lattès maps.
   - DY.4 gets adelic metrics on O(1), the Arakelov–Zhang pairing with its local energies, Fili's metric, Zhang's essential-minimum inequality, the product formula for finite-set energy, and the regularized finite-set heights.
   - DY.6 asks for "proven dynamical Mordell–Lang or unlikely-intersection cases as separate source-bound endpoints" with Lattès examples. The core of the paper is exactly such an endpoint: the energy estimates (Theorems 3.1 and 5.1–5.5, Lemmas 6.1–6.3), the hybrid degenerations (§4), Theorems 1.4–1.8, 7.1 and 8.1, and Corollary 8.2.
   - A source route is therefore preferred to a new Part II.
2. **Source of TropicalAndBerkovichArithmetic TB.0, TB.1 and TB.6.** It covers potential theory on the Berkovich line (Laplacian, Hsia kernel, mutual energy and its positivity) and the Boucksom–Jonsson hybrid space.
3. **Part II `HeightsRationalPointsAndObstructionsPartII`**, reusing the id of YUAN-26, GAO-GE-KUHNE-26, DIMITROV-GAO-HABEGGER-21 and GAO-HABEGGER-19.
   - It takes Proposition 9.1 and Theorems 1.1 and 1.9: uniform Manin–Mumford and Bogomolov for the bielliptic genus-2 family.
   - Its acceptance test is that they follow from the general uniform bounds already in that Part II (Kühne; Gao–Ge–Kühne).

No new roadmap id is minted.

## Source issues (`sourceIssues` E1–E13)

E9–E13 were added by the review, and the corrections of E5 and E7 were revised; see the end.

- **E7** (error, affects the proof of Theorem 7.1).
  - **Claim.** The proof asserts that at every finite place the potentials of µ_{t_i,v} are constant on disks of radius η_v = min{1, |t₁(t₁−1)|_v, |t₂(t₂−1)|_v}, so a non-archimedean term of Proposition 7.3 vanishes.
  - **Why it fails.** At places over 2 with |t_i(t_i−1)|_v = 1, η_v = 1, but µ_{t_i,v} is a point mass at a type II point of diameter |2|^{2/3} < 1.
  - **Counterexample.** Take ω a primitive cube root of 1 and t₁ ≠ t₂ the roots of t² − (6ω² − 4)t − (3ω − 4) = 0. Then x = ω is a common 3-torsion image, so x ∈ F, and the term is log(1/R) > 0.
  - **Consequence.** That positive term is not divided by |F|, and would break the small-height case of Theorem 8.1.
  - **Repair.** Take η_v := |2|_v · min{…} at v | 2. This is at most the diameter |Δ_t|^{1/6} of the support, and costs only log 2/(2|F|) in (7.5). All theorems stand.
- **E8** (gap, affects the proof). The proof of Theorem 1.9 restricts to j_P(X) "so that π(Φ(x)₁) = π(Φ(x)₂)". That identity holds only for the Weierstrass point Q of Proposition 9.1. For other P, translate by the 2-torsion point [Q − P], which leaves ĥ_{L_X} unchanged; §9.3 does exactly this for Theorem 1.1.
- **E1–E6** (misprints):
  - **E1:** "h_{E_t}" should be "ĥ_{E_t}", and "max{|x|,|y|}" should be "max{|z|,|w|}".
  - **E2:** a sign in (2.16).
  - **E3:** "lim_{t→∞}" should be "lim_{n→∞}" in (4.1).
  - **E4:** the constant 1/8 in the proof of Theorem 1.5 should be 1/16.
  - **E5:** (7.5) is misprinted; the review's corrected form is at the end.
  - **E6:** the application of Proposition 4.4 on p.41 drops the 1 from the maximum.

The Theorem 3.1 energy integrals, the constant α = 1/512, the Lemma 6.1 case analysis and the counting in Theorem 8.1 were recomputed and are correct. No erratum is listed on the Annals page, and Crossref has no correction relation.

## Prerequisites not yet covered

- Favre–Rivera-Letelier 2006, and the Baker–Rumely book.
- Zhang 1995 (adelic metrics), and Fili.
- Petsche–Szpiro–Tucker.
- Favre on the hybrid space, Boucksom–Jonsson, and DeMarco–Faber.
- DeMarco–Wang–Ye (the Lattès family).
- Bogomolov–Fu–Tschinkel.
- Shaska–Völklein and McMullen (the bielliptic locus).
- Raynaud.

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DEMARCO-KRIEGER-YE-20.result.json`: ok.
- Every missing item appears in exactly one route, and no source route takes a planned or library item. The Part II brief is 206 words.
- Library citations were read at the pinned commits:
  - Mathlib 082e2d3: `DivisionPolynomial/Basic.lean:401` and `NumberTheory/Height/Projectivization.lean:51`;
  - Tau Ceti f790474: `EllipticCurve/CanonicalHeight.lean:124, 338`.
- Planned layer ids were checked against `data/atlas.json`. Prerequisite DOIs were checked against Crossref.
- No Lean was written or compiled; none is a deliverable of this job.

## Independent review corrections (REV-PAPER-DEMARCO-KRIEGER-YE-20, 23 September 2026)

The review read the whole of arXiv v2 (the same SHA-256) and the published version: Ann. Math. 191 (2020) 949–1001, 53 pages, from annals.math.princeton.edu, SHA-256 `7a4bd817…07df`. Statuses and routes were confirmed, and all eight recorded issues were confirmed.

**The published version** has the same text at every recorded mistake, but differs from v2 in three ways:
- **Numbering.** It inserts Remark 1.3, so v2's Conjecture 1.3 and Theorems 1.4–1.9 become Conjecture 1.4 and Theorems 1.5–1.10, and Proposition 1.8 becomes 1.9.
- **§8.4.** New: Proposition 8.3 (no uniform bound on the order of common torsion images).
- **§9.5.** New: Proposition 9.2 (no uniform bound on the order of the torsion points in Theorem 1.1).

The locators of the main items now also give the published numbering and pages.

**Items corrected in place:**
- **Item 2.** Now includes the curve-in-an-abelian-variety form of Raynaud's theorem that p.2 uses.
- **Item 4.** Its note now requires t₁ transcendental.
- **Items 15–16 (the Berkovich line).** The hyperbolic metric needs r₁ ≥ r₂. The Laplacian is distribution-valued. The positivity of the mutual energy is misprinted in the paper (E9).
- **Item 18.** The metric is unique only up to constants; the height is unique.
- **Item 19.** Adds the equality case of Proposition 2.2 and the continuity of E_v, which the proof of Theorem 1.5 uses.
- **Item 22.** States its hypotheses.
- **Item 26.** (3.1) holds for |t(t − 1)|_v ≥ 1.
- **Item 27.** Gives the ranges of (3.4)–(3.5) and the proof of the diameter formula.
- **Items 29 and 31.** Restore the hypotheses C > 1, a ≥ b and M > 1.
- **Item 34.** Starts on p.27.
- **Item 40.** Counts multiplicity.
- **Item 46.** Records where the origins lie and describes ker Φ exactly.
- **Item 49.** Now covers Néron–Tate heights on abelian varieties, including their invariance under torsion translation.

**New items:**
- **50.** Standard projections of arbitrary elliptic curves; missing, to DY.6.
- **51.** The hyperelliptic involution and Weierstrass points of genus-2 curves; planned by Tau Ceti AlgebraicCurves layers 10–11.
- **52–53.** Propositions 8.3 and 9.2 of the published version; missing, to DY.6 and the uniformity Part II. The Part II brief now mentions Proposition 9.2 and the Tau Ceti imports.

**Revised issues:**
- **E5.** The corrected (7.5) is Σ_v −r_v log η_v ≤ **4**(h(t₁) + h(1 − t₁) + h(t₂) + h(1 − t₂)) − log c(ε′). The extraction's version, with coefficient 2, is still false: K = ℚ(ω), t₁ = 2, t₂ = −ω is a counterexample. The next display on p.41 is right.
- **E6.** The paper's own ε′ < ε/16 already absorbs the missing term.
- **E7.** Confirmed as an error that matters, and the repair (η_v times |2|_v above 2) was checked.
  - The reason is reworded. Supersingularity is not what puts the 3-torsion in the bad disk.
  - The loss is shown not to be O(1/|F|): for |t_i(t_i − 1)|_v = 1 above 2, ĥ_{t_i} · h_{F,η} ≥ (1/3) log 2 whatever F is.
- **E8.** The reason is narrowed: the identity holds for the partner of Q and fails for the other four Weierstrass points.

**Five new issues, all confirmed:**
- **E9** (misprint, p.12). "(ν₁, ν₂)_v ≥ 0 with equality iff ν₁ = ν₂" should be (ν, ν)_v ≥ 0 with equality iff ν = 0.
- **E10** (misprint, p.8). Type II and III points are distinguished by whether r lies in |ℂ_v^×|, not by whether r is rational.
- **E11** (gap, p.10). The justification of (2.7) gives only the direction measures ⇒ height. The converse follows from equidistribution or [PST].
- **E12** (misprint, (3.5), p.17). The middle range is printed backwards, so it is empty.
- **E13** (misprint, (5.4)–(5.5), p.29). i = 0, …, n should be n − 1.

**Noted but not registered:**
- the Diag in (2.14) must be the diagonal of ℂ_v × ℂ_v;
- the curve C after Conjecture 1.3 is singular only when the branch sets meet;
- "Néron-Tate canonical height on ĥ_{E_t}" (p.47);
- the missing weights r_v in "2h(x) = Σ_v |log|x|_v|" (p.41);
- the bound 16|S| in §9.3, which is true but loose (the exact count is 4|S| − 2|S ∩ branch values|).

**Post-review correction (cc-442dc5, 23 September 2026).** Item 10, the logarithmic Weil height on ℙ¹(Q̄) and 𝔸²(Q̄), moves from library to planned by HeightsRationalPointsAndObstructions RP.0. Mathlib's `Projectivization.logHeight` is the height relative to a field with admissible absolute values (for a number field, not normalized by the degree) and has no Q̄ version; RP.0 plans the normalized absolute height. The review had accepted the library status.
