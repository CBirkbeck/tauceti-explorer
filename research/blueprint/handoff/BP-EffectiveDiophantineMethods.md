# BP-EffectiveDiophantineMethods — complete pass

Issue #1028. Author: Claude (session claude-IYaPk6), claim comment 6031663394, confirmed by the bot.
This pass continues the merged checkpoint of Codex codex-hjdg0j (#3244), whose twenty ED.5 nodes are
kept under their ids (their placeholder excerpts "A(L)" are replaced by literal quotations from the
published Bruin–Stoll text, and four of their planets are reassigned).

## What is done

The packet is `complete`: all seven stages in scope are `planned`, within the RS-03 decisions
(accepted; RS-03 narrows ED.0, ED.1, ED.2, ED.3 and ED.6 and these nodes stay inside the `keeps`).

| Stage | Nodes | Content |
|---|---|---|
| ED.0 | 9 | precision contract; isolating-interval refinement; archimedean and Hensel embedding certificates; certified nonvanishing; valuation certificate; height enclosure; complete bounded-height enumeration of ℙ¹(L) (Doyle–Krumm; meets the ArithmeticDynamics DY.3 request). No CN.4 input (RS-03). |
| ED.1 | 11 | de Weger's real and p-adic approximation lattices on GN.5's LLL; reduced-basis distance bounds; homogeneous, inhomogeneous and p-adic reduction; Fincke–Pohst enumeration with completeness; lattice exclusion certificates and their soundness. |
| ED.2 | 32 | certified logarithm/argument enclosures; certified Matveev and Yu constants (DT.3 bounds imported, not restated); the full Tzanakis–de Weger method for Thue equations; the Thue–Mahler method (prime ideal removing lemma, S-unit covering, initial bounds, p-adic and real reduction, certificate); de Weger's S-unit method over ℚ; the three certified-solution-set theorems. |
| ED.3 | 29 | local images of 2-descent with the size test; certified 2-Selmer group equal to Tau Ceti's `selmerGroup₂`; rank upper bounds (full 2-descent and 2-isogeny); quartic local solubility; Silverman's explicit height-difference bound in the Tau Ceti normalisation; canonical-height enclosures, regulator, index bound, saturation, torsion, Mordell–Weil basis certificate; finite-index subgroup certificate for Jacobians; genus-two x − T descent; Lind–Reichardt torsor; Fermigier's rank-13 descent; ArithmeticDynamics's rank-zero curves and the FPS, Poonen and Stoll Jacobians. |
| ED.4 | 26 | abelian logarithm and integration pairing; annihilating differentials with certified precision; Chabauty's theorem; tiny integrals and disc constants; residue-disc zero bounds (McCallum–Poonen Lemma 5.1, Remark 5.2, certified Strassmann indices for exceptional discs); **Strassmann's theorem (owned here, see below)**; Coleman's bound; the bad-reduction bound; Chabauty–Coleman certificate and completeness; symmetric and relative symmetric-square Chabauty (Siksek, Box); the C₀(5), C₁(3₂) and X₀^dyn(6) certificates requested by ArithmeticDynamics (the last two conditional, labelled). |
| ED.5 | 41 | the 20 finite-sieve nodes; reduction square for a curve and its Jacobian; sieve soundness for curves; bad and deep information; the ED.3 handoff; iterated lifting and GetSubgroup; height separation and bounded-height points; the genus-two Kummer test (corrected, see E12, E13, E17); Siksek's lattice step and integral points on y² = f(x); the Chabauty–sieve combination; Box's relative symmetric sieve; the sieve certificate and its soundness; the small-curves application (conditional where the source is). |
| ED.6 | 39 | certified solution sets with conditionality labels; comparison of p-adic candidates with global points; BDMTV 2019 §§4–6 (all 29 routed items: connection, gauge, Hodge filtration algorithm, Frobenius structure, splitting, local height, base change, precision, X_s(13) model, Tate classes, Hodge and Frobenius data, the three charts, rank 3, Theorems 1.1, 1.2, Corollary 1.3, class number one); BDMTV 2021 Algorithm 3.12 with its failure outputs and the X₀⁺(N), X_S4(13) results; the worked Thue, Thue–Mahler, S-unit and elliptic integral-point examples. |

Totals: 187 nodes (24 definitions, 31 constructions, 103 theorems, 13 lemmas, 16 applications),
356 API items, 244 unit tests, 40 planets (at most six per layer), 194 baseline declarations, 25
sources, 21 source issues (E1 from the checkpoint, E2–E21 new), 34 requests, 12 gaps, 8 restructure
proposals.

## Decisions a reviewer should check

- **Strassmann's theorem is owned by ED.4** (`ED.4/strassmann-bound`). Importing
  `ArithmeticDynamics:DY.6/strassmann-theorem`, as the RT-AUDIT-09/7 verifier's options allowed,
  closes the stage cycle ED.4 → DY.3 → DY.6 → ED.4 (DY.3 consumes the ED.4 Chabauty certificates).
  The restructure entry asks DY.6 and MordellLawrenceVenkatesh LV.3 to import it from ED.4.
- **RS-03:** ED.0 has no CN.4 input; worked Thue/S-unit examples sit in ED.6, not ED.2; ED.3 reuses
  Tau Ceti's elliptic 2-descent (`selmerGroup₂`, the descent map, `pow_rank_le_card_of_range_μ_le`,
  canonical height, regulator) and only certifies.
- **New stage edges** (all checked acyclic against the atlas stage edges together with the edges
  implied by every research packet) are listed per target stage in `restructure`.
- The comparison "Coleman integral = abelian integral" is planned in ED.4
  (`ED.4/coleman-abelian-comparison`, by Dwork's principle), following the ColemanIntegration
  packet's own proposal; NC.4 can cite it.

## Requests (34)

To ComputationalNumberTheory CN.2 (class groups, units, prime factorisations), CN.3 (modular data
for X_s(13)), CN.4 (certified log/arctan enclosures, L-values), CN.5 (example schema);
HeightsRationalPointsAndObstructions RP.0 (Néron local heights, Néron–Tate height on Jacobians) and
RP.1 (Mordell–Weil for Jacobians, 2-isogeny Kummer maps); SchemeAndStackFoundations SF.3 (curve
inputs, specialisation, symmetric square); NeronModels R11.4; DeligneWeightsAndPurity DWP.1;
AnabelianGeometryAndNonabelianChabauty NC.2 and NC.5 (quadratic Chabauty theory, BDMTV items they
own); PadicDifferentialEquationsAndRigidCohomology RD.7 (Tuitman's Frobenius algorithm);
GrossZagierAndArithmeticHeights GZ.8; ModularCurvesPartII R13.4a, R13.5, R14.5; and the Tau Ceti
layers EllipticCurves 3, 4, 6, 7, JacobianChallenge D, E, F, AlgebraicCurves 10, StableReduction 5.

## Gaps (12)

Rank of E11 (no rational 2-torsion; no source read gives the full descent); the three genus-two
rank-zero curves of ArithmeticDynamics's request; the corrected 2-descent for Poonen's C₁(3₂)
(his erratum gives no computation); explicit points on Fermigier's homogeneous spaces; certified
finite presentations of Jacobians over finite fields (Mumford/Cantor, discrete logarithms, Smith
forms); the Cassels–Flynn model of genus-two Jacobians and Kummer surfaces; genus-two height
comparison constants; the small-curves experiment data; Bilu–Parent–Rebolledo; Baran's X_ns(13)
model and isomorphism; the X_S4(13) isogeny and reduction inputs; certified Coleman integrals
through ramified extensions (Balakrishnan–Tuitman 2017, not read).

## What a follow-up must do

Each stage's `remaining` list is precise. The main items: embeddings into finite extensions of ℚ_p
(ED.0, needed by the second special case of Thue–Mahler); the faster Doyle–Krumm generator; the
de Weger Lemma 3.17 sublattices; Thue–Mahler with gcd(Y, f₀) > 1; Cremona's quartic 2-descent and
local-height canonical heights; odd-degree isogeny descents and 4-descent; Stoll's rank-dependent
Coleman bound and Coleman's bound for p ≤ 2g (sources not read); Siksek's 2009 symmetric-power
paper (not downloadable; the symmetric-square proof steps are reconstructed from Box's statements);
the remaining BDMTV 2021 examples.

## Sources read (2026-10-07; URLs and SHA-256 in the packet)

McCallum–Poonen; Bruin–Stoll (version of record pp.272–306, arXiv v2, author copy); Tzanakis–de
Weger 1989 and 1992; de Weger's CWI Tract 65 (Chapters 2–6); Fincke–Pohst; Doyle–Krumm; Matveev
2000; Yu 1994; Silverman 1990; Cremona's book Chapter III; Aitken–Lemmermeyer; Flynn–Poonen–Schaefer;
Poonen's preperiodic-points paper (arXiv:math/9512217v1; the Math. Z. version was not read) and his
errata; Stoll 2008 and 2019; Prickett's thesis (rendered pages);
Siksek 2010; Box 2021; Caraiani–Newton v3 §7.4 (v1, v2 compared there); BDMTV 2019 (published) and
2021 (arXiv v4); Katz–Rabinoff–Zureick-Brown 2016 and Balakrishnan–Bradshaw–Kedlaya 2010 for the
ED.4 tiny integrals and Stoll's bound context. Not obtainable here:
Siksek, "Chabauty for symmetric powers of curves" (2009), and Siksek's 1995 saturation paper.

## Source issues

E2–E21 are new: de Weger Lemma 3.15 sign, Figure 2 index, Lemma 3.17(i) false; Tzanakis–de Weger
1989 Prop. 3.2 inequality, Lemma 2.1 transposition, test (3.8) gap, p.106 factor, p.123 swap;
Tzanakis–de Weger 1992 Lemma 1 corollary reference and Proposition 7 constants; Aitken–Lemmermeyer
Appendix B (y² = x³ + 17x, not −17x); Poonen 1998 p.15 (S± for R±); Bruin–Stoll Lemma 4.1 (missing
factor 3, a/b swap, and a gap in the last step, with the correction used in ED.5/kummer-curve-test)
and FindQSequence's ε for ε₁; BDMTV 2021 §4.1 (two) and Lemma 4.7, whose printed hypothesis
max{i : ord_p(F_i) + i = n} < m is too weak for its conclusion (E21; ED.6/root-determination-precision
uses ord_p(F_i) + i ≥ n for i ≥ m, which the proof needs); FPS Lemma 2 proof. Each was checked on the
rendered page. The Caraiani–Newton ⟨5G₁, …⟩ misprint is already PAPER-CARAIANI-NEWTON-23/E9 and is
cited, not duplicated.

## Checks

- `scripts/check_blueprint.py`: 0 errors, 1 warning (the index lists `Finset.mem_filter` under a
  doubled namespace; the pinned source and a Lean check give `Finset.mem_filter`; it comes from the
  checkpoint's ED.5 nodes).
- Every excerpt was compared with the downloaded text; the remaining non-literal matches are
  column-split or OCR-garbled lines of scanned sources, checked by hand.
- Independent second reading of every stage (fresh readers, 296 exact fixes applied), with numerical
  claims recomputed in exact arithmetic.
- Suggested Lean file: elaborated with `lean-check` (`lake env lean` in the shared build, Mathlib 082e2d3; the file imports Mathlib modules only and names the Tau Ceti declarations it builds on in comments): exit 0, 705 warnings, every one "declaration uses `sorry`", no errors. The file has 5,834 lines.
- Every packet definition, API item and unit-test name occurs in the suggested file.
