# BP-GrossZagierAndArithmeticHeights--GZ.8 — GZ.8 and GZ.9, complete pass

Agent: Claude (Claude Code), session claude-MJcHy7, 2026-10-06. Refs #745; the claim is comment 6012248667. No packet for this part existed before this job.

## Deliverables and status

- `research/blueprint/packets/GrossZagierAndArithmeticHeights--GZ.8.json` — status `complete`, part `GZ.8`, scope GZ.8 and GZ.9, both `planned`.
- `research/blueprint/readmes/GrossZagierAndArithmeticHeights--GZ.8.md` — the roadmap document for the two layers (about 20,000 words), generated from the packet with hand-written introduction, conventions, ownership and layer overviews; it agrees with the packet.
- `research/blueprint/suggested/GrossZagierAndArithmeticHeights--GZ.8.lean` — every definition, API item and unit test of the packet under its packet name (checked by script: none missing).

36 nodes at target level: 19 in GZ.8, 17 in GZ.9 (3 definitions, 4 constructions, 20 theorems, 6 lemmas, 3 comparisons); 46 API items; 28 unit tests; 10 planets (6 in GZ.8, 4 in GZ.9); 24 baseline declarations; 14 requests; 2 gaps; 4 restructuring proposals; 4 new source issues (E2–E5).

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/GrossZagierAndArithmeticHeights--GZ.8.json` with the pinned declaration index: 0 errors, 0 warnings.
- **The suggested file compiled.** `lean-check` (the shared build, Mathlib 082e2d3) elaborates it with exit status 0; the only warnings are the 70 `declaration uses 'sorry'` warnings. The file imports Mathlib only: the shared build has not built the Tau Ceti modules this plan cites (`CanonicalHeight`, `ModularForms/Petersson/Basic`), so they are named in docstrings and reproduced from their Mathlib ingredients (`QuadraticMap.polar`; the set integral of `UpperHalfPlane.petersson`).
- New stage edges proposed in `restructure` were checked acyclic against `research/blueprint/atlas/stage-edges.json` (no path from GZ.8/GZ.9 to GH.1, L3h, L0, L3, R18.1, R17.3, A4, ColemanIntegration L1, PadicHodgeRegulators L1, DT.3, R19.1, AL.3, HE.1 or GZ.5).
- The document contains no Lean code and none of the words the protocol forbids; no local paths in any deliverable.

## What is planned

**GZ.8.** The χ-isotypic space A(χ) (sign fixed so that P_χ(f) ∈ A(χ)), the L-linear Néron–Tate pairing, the χ-Heegner point in integral (toric volume 2L(1, η)) and finite form and their ratio, toric equivariance; the Yuan–Zhang–Zhang formula as an identity of invariant bilinear forms (decomposition node id kept); the vacuous case; the sign −1; the nonvanishing criterion with simultaneous vanishing of conjugate derivatives through Rosati positivity; Gross–Zagier's main identity ⟨c, T_m c^σ⟩ = u² a_{m,𝒜} and Theorem I (6.1)–(6.2); the X₀(N) formula for ring-class characters (Cai–Shu–Tian Theorem 1.1, with Gross–Zagier I (6.3)/(6.5) as the original route); Corollaries V (1.1)–(1.3); the Petersson–period–degree–Manin-constant lemma; the elliptic formula (Gross–Zagier V (2.1)); Cai–Shu–Tian's admissible orders, test-vector line, explicit formula and its variation; the Shimura-curve formula over ℚ (Skinner Prop. 2.5.1, from YZZ Thm. 3.13); non-torsion of the trace point on a parametrised GL(2)-type quotient.

**GZ.9.** The BDP p-adic L-function (JSW (5.1.a), N⁻ = 1 and N⁻ > 1, f not necessarily ordinary); the Petersson ratio α(f, f_B); the square-root comparison with L3h; Brooks's quaternionic construction and his CM-value Waldspurger formula; membership in O^ur⟦Γ⟧ (Skinner item 35); the dictionary between Skinner's L^S_𝔭(f) and BDP/Brooks (item 36); the Euler factor at the BDP point; weight-two Abel–Jacobi = formal logarithm; the BDP weight-two formula with finite-order characters (imported from GH.1's Theorem 5.13 at r = j = 0); Brooks Prop. 8.13 = JSW Prop. 5.1.6 with the square restored; JSW Prop. 5.1.7 (p-optimal quotient); the formula at a multiplicative prime (Castella); logarithm detects non-torsion points (elementary for elliptic curves); Heegner points have nonzero logarithm in every eigencomponent (Skinner item 82, from Burungale–Skinner–Wan via DT.3); the Bloch–Kato/Kummer comparison; compatibilities with isogenies, differentials, characters and anticyclotomic specialisation.

## Red-team finding

**RT-AREA-iwasawa-1/11 (medium, duplicate)** — resolved by ownership, as the fix asks. (a) The GL(2) square-root distribution is AutomorphicPadicLFunctions L3h's (specialised to F = ℚ, n⁻ = 1): GZ.9 does not construct it; `bdp-square-root-comparison` squares it and records the square/square-root distinction, and a request to L3h states the exact export. (b) BDP Theorem 5.13 has one owner, GeneralizedHeegnerCycles GH.1, for every r ≥ 0; GZ.9 imports its r = j = 0 case in `bdp-weight-two-heegner-formula` and requests GH.1 to state it under BDP's Assumption 5.12 in full (the decomposition node is stated under three simplifying hypotheses). GZ.9 keeps what the finding lists as new: Brooks's quaternionic construction and Proposition 8.13 (= JSW 5.1.6), the JSW comparisons, the Bloch–Kato/Kummer identification with HE.3, and the multiplicative branch. Edges L3h → GZ.9 and GH.1 → GZ.9 are proposed in `restructure` (both acyclic). The edge ModularSymbolsPadicLFunctions L2 → GZ.9 is not used by any node and is proposed for removal.

## Maintainer-added sources

- **Gross–Zagier 1986, items routed to GZ.8** (PAPER-GROSS-ZAGIER-86): the main identity (items 52/282, 26), Theorem (6.3)/(6.5) (28, 31), the eigencomponents c_χ, c_{χ,f} (27/284, in `chi-heegner-point`), the Manin constant (292, data of HE.1 used in `petersson-norm-and-parametrisation-degree`), Theorem V (2.1) (295), the Chapter V §1 corollaries (`derivative-corollaries`), and the announced indefinite identity (307, recorded in `coefficient-identity` as the F = ℚ specialisation of the YZZ formula). Theorem I (7.3) (item 35) is RankZeroOneBSD BSD.5's; `elliptic-curve-heegner-height-formula` supplies its Gross–Zagier input. Items 21, 24, 25, 49, 99, 112, 114, 274 are shared with GZ.6/GZ.7/AL.3 and are cited inside the GZ.8 proofs through those owners. The paper was read from the public scan as page images (pp. 229–230, 307–309, 311).
- **Skinner 2020, items 35, 36, 82** — planned as `bdp-measure-integrality`, `imprimitive-function-dictionary` and `eigenlogarithm-nonvanishing`; item 82 imports Burungale–Skinner–Wan Theorem 1.1 and 2.8(i) from DiophantineApproximationAndTranscendence DT.3 (request). This corrected an error in the first draft of `logarithm-detects-heegner-point`: for [M_f : ℚ] > 1, freeness of A_f(K) ⊗ ℚ_p does not give a nonzero logarithm in every eigencomponent; the node now proves the elliptic case directly and the general case through BSW.

## The exceptional-zero clause of GZ.9

The weight-two formula at a multiplicative prime p ∥ N split in K has the factor (1 − a_p p⁻¹)², which never vanishes; it is planned (`multiplicative-prime-formula`) because Castella's multiplicative p-part of BSD consumes it. The L-invariant appears only in Castella's derivative formula for Howard's big Heegner points (a Hida-family statement, GeneralizedHeegnerCycles GH.7), which the multiplicative BSD proof does not use. `restructure` proposes rewording the GZ.9 clause accordingly and asks that PadicHodgeTheory R06.6's recorded use name GH.7.

## Requests made

GeneralizedHeegnerCycles GH.1 (Theorem 5.13 in full generality); AutomorphicPadicLFunctions L3h, L0, L3; PadicMeasuresIwasawaAlgebras L1; PadicHodgeRegulators L1; AbelianSchemesAndArithmeticModuli A4 (the p-adic logarithm of an abelian variety — no roadmap plans this general notion); ColemanIntegration L1; HilbertModularVarietiesAndShimuraCurves R18.1; GL2AutomorphicRepresentationsAndTransfer R17.3; AutomorphicLFunctionsAndLocalFactors AL.3; AutomorphicGaloisRepresentations R19.1; Tau Ceti EllipticCurves Layer 3; DiophantineApproximationAndTranscendence DT.3. HeegnerPointEulerSystems' request to GZ.8 (HE.0 packet, for HE.7/admissible-rm-kolyvagin-logachev) is answered by `totally-real-trace-point-nontorsion`.

## Overlap noted

The unreviewed GeneralizedHeegnerCycles--GH.8 checkpoint plans weight-two comparisons (`weight-zero-cycle`, `differential-evaluation`) that coincide with GZ.9's `weight-two-abel-jacobi-is-logarithm` and `isogeny-and-differential-compatibility`. GZ.9 precedes GH.8 in the stage graph (GZ.9 → HE.8 → GH.8), so GH.8 should import them; recorded in `restructure`.

## Source issues (new)

- E2 — Brooks, Props. 8.12–8.13: the logarithm is printed without its square (JSW Prop. 5.1.6 restates it squared).
- E3 — JSW §5.1: the weight-two Petersson norm printed with dx dy/y² (not invariant); should be |g|² dx dy.
- E4 — Brooks, end of proof of Thm. 8.11: Δ_χ = Σ χ⁻¹(a)N(a)P_χ should sum P_a.
- E5 — Castella (multiplicative primes) proof of Thm. 3.1: L_p(f) := Tw(L_{p,ψ}(f)) omits the square of the Castella–Hsieh square-root measure.

## Gaps and what a follow-up must do

1. **YZZ book and erratum not re-read.** No public copy was reachable and the erratum host did not answer; the YZZ statements rest on the accepted decomposition's verified excerpts, cross-checked against Zhang 2010, CST and Skinner. Re-read Chapter 1, Sec. 3.3 and the erratum, and confirm whether L(1, η) in the toric volume is complete or finite.
2. **Burungale's quaternionic measure not read.** Read Burungale (Shimura curves) §§2–4 for the measure construction behind `quaternionic-bdp-construction` and `bdp-measure-integrality`.
3. Refinements for lemma level (coverage `remaining`): split the YZZ projector-form reduction and CST's Petersson-pairing formula into their own nodes.

## Sources read

Gross–Zagier 1986 (public scan, page images); Cai–Shu–Tian arXiv:1408.1733v2 §1; Skinner arXiv:1405.7294v1 §§2.4–2.6; Jetchev–Skinner–Wan arXiv:1512.06894v1 §§3, 4.1–4.2, 5.1 (p. 32 also as an image); Brooks IMRN 2015 (published) §§1, 6.4, 7, 8 (pp. 62–63 as images); Bertolini–Darmon–Prasanna Duke 2013 (published) introduction and §5; Castella–Hsieh arXiv:1505.08165v2 §§3.3, 4.5; Castella arXiv:1507.04260v1 and arXiv:1704.06608v2; Burungale–Skinner–Wan arXiv:2603.20886v2 §§1–2.3; Zhang, Sci. China Math. 2010 §§3.2–4.3. Missing: the YZZ book and erratum (inaccessible), Burungale's Shimura-curve paper and Hsieh's Documenta paper (not fetched; L3h owns Hsieh's construction).
