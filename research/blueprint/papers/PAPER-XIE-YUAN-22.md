# PAPER-XIE-YUAN-22: Geometric Bogomolov conjecture in arbitrary characteristics

Junyi Xie and Xinyi Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*, Invent. Math. 229 (2022), 607–637 ([doi](https://doi.org/10.1007/s00222-022-01112-1), [arXiv:2108.09722](https://arxiv.org/abs/2108.09722v1)).

Extraction by Claude Code, session `cc-39fac3`, 29 September 2026 (issue #1270). Status: **complete**. Every missing item is routed exactly once.

The machine-readable extraction is [PAPER-XIE-YUAN-22.result.json](PAPER-XIE-YUAN-22.result.json). It has:
- 65 items: 4 library, 9 planned, 52 missing;
- 4 routes: three source routes and one Part II, which coalesces with an existing proposal;
- 10 prerequisite entries;
- 15 source issues.

## Source read

arXiv:2108.09722v1 (22 August 2021, 29 pages; SHA-256 `2587e703…`), read completely. It is the only arXiv version. The Inventiones article (received 31 August 2021, accepted 3 March 2022, 31 pages) is subscription-only. It was not collated, which the `published-version` gap records.

## What the paper proves

**Theorem 1.1 (geometric Bogomolov conjecture).**
- Setting: k is algebraically closed of any characteristic, K/k is finitely generated with trdeg ≥ 1, and A is an abelian variety over K.
- Claim: a closed subvariety X ⊂ A_{K̄} containing a dense set of small points is *special*, i.e. X = tr(Y ⊗ K̄) + T with T a torsion subvariety and Y a subvariety of the K/k-trace.

Earlier results were partial: Gubler proved the totally degenerate case, Yamaki the reductions and small cases, Gao–Habegger characteristic 0 over curves, and Cantat–Gao–Habegger–Xie all of characteristic 0 via Betti maps. This paper is the first proof in positive characteristic, and it uses no Betti map.

**The proof in four steps.**

1. **Lowering the transcendence degree (§3).**
   - The field K is kept. Instead, a pencil in |M| on a projective model S gives a subfield k′ = k(s₁/s₀) ⊂ K of transcendence degree 1, and the generic member H polarizes K/k′.
   - Heights do not increase under this change (Lemma 3.7).
   - Fields of definition up to isogeny have a smallest member (Proposition 3.2, Lemmas 3.3–3.4, Corollary 3.5). So the fields over which X becomes special are exactly those containing one field k_{A,X} (Proposition 3.6).
   - Two different pencils then force k_{A,X} = k (Proposition 3.1).
2. **Yamaki's reduction.** Yamaki's theorem reduces to A with good reduction and trivial trace over a curve.
3. **Numerical class of torsion (§4).** On the abelian scheme 𝒜 → S, a torsion multi-section 𝒯 is numerically (deg 𝒯/S / deg ℒ_η)·ℒ^g for a symmetric rigidified ℒ (Proposition 4.2).
4. **Non-proper intersections and the summation map (§§2, 5).**
   - The sums X_r stabilize at a torsion subvariety A′ (Lemma 5.3), and f : X_{r−1} × X → A′ has relative dimension e < dim X.
   - For a prime-to-p torsion multi-section 𝒯, §2's inequality Σ m_i[𝒵_i] ≤ h*[𝒯]·[𝒴] (Proposition 2.1) bounds the dominant components of f⁻¹(𝒯).
   - Combined with step 3 and ĥ(X_{r−1} × X) = 0, this gives height 0 for the fibres over torsion points (Proposition 5.4).
   - By induction on dimension those fibres are torsion. Manin–Mumford for trivial trace (Hrushovski; Pink–Roessler) then makes X torsion.

## What the atlas and libraries already have

- **Library (4 items).**
  - Tau Ceti has abelian varieties over a field, with products and base change, isogenies and [n] (`TauCeti.AlgebraicGeometry.AbelianVariety`, `.prod`, `.baseChange`, `.IsIsogeny`, `.mulBy`).
  - Mathlib has the transcendence degree (`Algebra.trdeg`).
  - Nothing else is in either library: there are no abelian schemes, no Chow groups with intersection products, and no heights beyond elliptic curves over fields with product formula.
- **Planned (9 items).**
  - Torsion subvarieties and stabilizers: HeightsRationalPointsAndObstructions RP.5.
  - Chow groups and Serre multiplicities: SchemeAndStackFoundations SF.5.
  - Numerical equivalence: MotivesAndAlgebraicCycles MC.0.
  - Étaleness of prime-to-p torsion: AbelianSchemesAndArithmeticModuli A3.
  - Poincaré reducibility: A6.
  - Good reduction as an abelian scheme: NeronModelsAndSemistableAbelianVarieties R11.1.
  - Semistable reduction: R11.3.
- **Not planned anywhere.** No atlas layer proves a Bogomolov theorem over function fields: RP.5's small-points theorem is explicitly over number fields.

## Routes

1. **Source of HeightsRationalPointsAndObstructions RP.0, RP.1 and RP.5 (9 items).**
   - RP.0 gets the geometric heights over a finitely generated K/k:
     - projective and integral models;
     - naive and canonical heights of subvarieties (Gubler);
     - the quadratic bound;
     - the good-reduction formula of §4.3;
     - height zero means torsion for trivial trace.
   - RP.1 gets the K/k-trace.
   - RP.5 gets the positive-characteristic Manin–Mumford theorem, quotients by abelian subvarieties and the minimal torsion subvariety T_X.
   - This follows PAPER-GAO-HABEGGER-19, which routed the curve case of the function-field heights and the trace the same way.
2. **Source of SchemeAndStackFoundations SF.0, SF.4 and SF.5 (12 items).**
   - SF.5 gets §2's intersection theory: Proposition 2.2 (Bertini-type choice through V), Lemma 2.3, the proper part and Proposition 2.4, Lemma 2.5 and Proposition 2.1. It also gets nef line bundles and Jouanolou's Bertini integrality.
   - SF.0 gets the fibre-dimension loci Y_l and the openness of geometric integrality.
   - SF.4 gets the resolution of a pencil by blowing up its base locus.
3. **Source of AbelianSchemesAndArithmeticModuli A1 and A2 (5 items).** Lemma 4.1 and the vocabulary of symmetric and rigidified line bundles:
   - parts (1)–(2) come from the theorem of the cube (A1);
   - parts (3)–(4), nefness, come from polarization theory (A2).
4. **Part II `HeightsRationalPointsAndObstructionsPartII`, "Heights, rational points and obstructions, Part II: uniform Bogomolov and uniform Mordell–Lang" (26 items).**
   - Coalesced with the Part II that PAPER-YUAN-26, PAPER-GAO-GE-KUHNE-26, PAPER-DIMITROV-GAO-HABEGGER-21 and PAPER-GAO-HABEGGER-19 propose. The pending DESIGN-HeightsRationalPointsAndObstructionsPartII folds all Part IIs of this parent.
   - Gao–Habegger already put the characteristic-0 geometric Bogomolov conjecture there, so the full conjecture joins it rather than opening a new roadmap.
   - The brief asks for:
     - small points and special subvarieties;
     - §3 in full, with Proposition 3.6 repaired (E1) and two distinct pencils (E5);
     - Yamaki's theorem;
     - multi-sections and Proposition 4.2;
     - the fundamental inequality with Lemma 5.2 and its converse;
     - Lemma 5.3 for dim X ≥ 1;
     - Proposition 5.4 for prime-to-p torsion;
     - the §5.3 induction;
     - Theorem 1.1.

   Its acceptance tests are:
   - special subvarieties have dense small points;
   - any two torsion sections of an elliptic scheme over a curve are numerically equivalent;
   - the result agrees with Gao–Habegger in characteristic 0.

## Prerequisites not covered by the atlas

- Yamaki, Crelle 2018 (Theorem 1.5); checked against arXiv:1405.0896v5.
- Hrushovski 2001 and Pink–Roessler 2004 (Manin–Mumford in every characteristic).
- Gubler 2007 (Theorem 3.6, Lemma 4.1 and Corollary 4.4); read in arXiv:math/0609387v2.
- Gubler 2003 (Theorem 11.18).
- Conrad 2006 (the trace and Theorem 9.15).
- Grushevsky–Zakharov 2014 (the rational-equivalence form of Proposition 4.2).
- Jia–Shibata–Xie–Zhang (Lemma 3.3).
- Cantat–Gao–Habegger–Xie 2021 (the characteristic-0 alternative).
- Jouanolou 1983 (Bertini).

Links were checked through Crossref, the arXiv API and the publishers' pages.

## Source issues

All page references are to arXiv v1, and each finding was checked on the page image.

| id | kind | where | finding |
|----|------|-------|---------|
| E1 | error | Proposition 3.6, proof, first case | The claim "X is special for k′ iff k_A ⊆ k′" is false in the direction ⇐. Counterexample: K the algebraic closure of k(s, t), A = E ⊗ K with E: y² = x(x−1)(x−s) over k′ the algebraic closure of k(s), and X = {P} with x(P) = t. Here k_A = k′ but X is not special over k′. The proposition still holds: run the second case over k_A, with k_{A,X} the field of definition of Φ(X) (Corollary 3.5(ii) for K/k_A). |
| E2 | gap | Proposition 5.4 | Stated for every torsion t, but the proof uses only torsion multi-sections of order prime to char k (smoothness of 𝒯 is needed for Proposition 2.1). §5.3 needs only those, which are dense. |
| E3 | gap | §5.3 | The induction applies Theorem 1.1 to components of *height 0*, but its hypothesis is *dense small points*. The missing converse of Lemma 5.2 is Gubler 2007, Cor. 4.4. |
| E4 | error | Lemma 5.3 | False for dim X = 0: for a torsion point no r has dim X_{r−1} < dim X_r. It needs dim X ≥ 1, the only case §5.3 uses. |
| E5 | gap | Lemma 3.7 / Proposition 3.1 | "Infinitely many k′" and k₁ ≠ k₂ are not argued. Two pencils ⟨s₀, s₁⟩, ⟨s₀, s₂⟩ with s₁/s₀, s₂/s₀ algebraically independent give them. |
| E6 | misprint | Proposition 2.4, proof | The last display ends H₁⋯H_{r−1}·V·H_r, which should be ·X·; two index slips. |
| E7 | misprint | Proposition 2.1, proof | O_B(f*H_i) should be O_B(g*H_i). |
| E8 | misprint | Corollary 3.5, proof | k′ ∩ k_A ⊆ I should be ∈ I. |
| E9 | misprint | Lemma 3.7, proof | π₁ : S × P¹ → P¹ should be → S. |
| E10 | misprint | Proposition 3.1, proof | "Then X is special for A/K/k_i" should be "is not special". |
| E11 | misprint | Proposition 4.2, proof | The symmetric/anti-symmetric decomposition is of ℳ, not ℒ. |
| E12 | misprint | Lemma 5.3, proof | p₂ : B × C → B should be → C. |
| E13 | misprint | Proposition 5.4, proof | The factor a appears twice in the displayed chain. |
| E14 | misprint | Proposition 5.4, proof | "This forces [𝒵_i]·[ℒ_ℬ]^{e+1}" is missing "= 0". |
| E15 | misprint | §1.1 | The integral model is written (𝒜, m, ℒ) instead of (𝒜, π, ℒ). |

None of these affects Theorem 1.1.
- E1–E5 affect proofs or one stated lemma, and each has a short repair; the items carry the corrected statements.
- No erratum was found: the Springer page lists none, and Crossref records no update. This is not an exhaustive novelty claim.

## Gap

- `published-version` (open): collate the locators and E1–E15 with the Inventiones text when a copy is available.

## Corrections by the independent review

The review `REV-PAPER-XIE-YUAN-22` (Claude Code, session `cc-fb70e5`, 29 September 2026) accepts the extraction. All 15 source issues are confirmed at their locators on the page images of arXiv v1, and it adds none. For E1 it gives an explicit counterexample to the printed first case of Proposition 3.6. For E3 it checks the cited converse in Gubler's arXiv:math/0609387v2, Corollary 4.4.

One note was added, on `manin-mumford`. The positive-characteristic version for all torsion is Pink–Roessler 2004 and Scanlon (arXiv:math/0303340, Theorem 2.2). With trivial trace, Scanlon's special subvarieties are torsion translates, which gives Theorem 5.1 as stated. No status, statement or route changed.
