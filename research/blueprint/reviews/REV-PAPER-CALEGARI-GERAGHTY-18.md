# Review: PAPER-CALEGARI-GERAGHTY-18 (Calegari–Geraghty, Modularity lifting beyond the Taylor–Wiles method)

Job `REV-PAPER-CALEGARI-GERAGHTY-18` (issue #1299), by Claude Code, session `cc-38267a`, 23 September 2026. The extraction was written by Claude Code, session cc-72825f. **Verdict: accept**, after the corrections below, which were made in place. All 23 routes are accepted.

## What was read

- **The published article.** The author-hosted Springer PDF (CG.pdf, 137 pages, SHA-256 c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5), the extraction's file.
- **arXiv v2.** The accepted version (SHA-256 67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb) and its TeX source (https://arxiv.org/e-print/1207.4224v2, SHA-256 dae71c67a65b2c42c7229350e9ef01b6c87f0c5aa73873926bae4eb68fbee457).
- **Method.** Ten checkers split the published pages: 297–312, 313–324, 325–334, 335–350, 351–362, 363–373, 374–389, 390–406, 407–415 and 416–433. Each:
  - compared every item and every recorded mistake in its range with the rendered page images and the TeX;
  - opened every cited declaration in Mathlib 082e2d3 and Tau Ceti f790474;
  - read every cited layer description and searched the atlas for the missing items.

  I re-derived the substantive new findings in the TeX myself (see "Mistakes"). I also opened the eight library citations and read the three Part II briefs and the route claims.
- **Sources the items depend on.** Checkers read:
  - CHT, Definitions 2.5.1 and 2.5.7 and Corollary 2.4.3;
  - Taylor 2008, Proposition 3.1;
  - BLGHT II, Theorem 6.4, Proposition 6.2 and §4;
  - BLGHT11, Lemma 3.3;
  - HSBT, Theorems 4.1–4.2.

  Skinner–Wiles, CDT and DDT were not read. The items that rest on them say so.
- **Queue behaviour.** I read `research/blueprint/make_queue.py`. It appends one `DESIGN-<id>` job per accepted part-ii or new route and does not merge two papers' routes that share an id. This is why route 1 keeps a distinct id beside PAPER-IYENGAR-KHARE-MANNING-24's GL2ModularityLiftingPositiveDefect.

## Items

**Corrected: 78 items.** Each item's note says what changed. The material ones:

- **L_σ at Taylor–Wiles level** (L-sigma-at-level-Q, hecke-operators-L-sigma, thm-3-30-step1-level-raising). The sheaf is now defined at level V, and the Hecke operators go through L′_σ and the level-V trace (E221).
- **The §4.1 support claim** (components-in-support-of-S-phi, kisin-patching-R-phi, R-tilde-equals-T-phi-m). Each is flagged as false at v ≡ −1 mod p mod-p Steinberg primes (E224).
- **Lemma 9.6's key step** (lemma-9-6-key-isomorphism). Restated with localization at m̃ (E229).
- **§10.** The bound is N₂ > 2n + 1 (E213). sec10-auxiliary-curve-lemma and sec10-general-case now follow E216's relabelling of p and q. moret-bailly-blght-prop-6-2 states BLGHT II's Proposition 6.2 as printed. The HSBT items gain the simultaneity hypothesis (E214). blght-thm-6-4 records Theorem 6.4.
- **Commutative algebra.** lem-4-2-completed-tensor-ci now reads "B or C O-flat" (E72), and group-ring-O-Delta-ci depends on it. restriction-injective-finite-index-char-0 has the hypothesis that H acts trivially on V.
- **Duality.** dual-cohomology-homology-Y1 needs χ⁻¹ (E207). poincare-duality-bm and dual-maximal-ideal-m-star record that U_x* at x ∈ Q needs the Atkin–Lehner element.
- **Other statements:**
  - rem-3-10-stacks was cut to Remark 3.10 and footnote 3;
  - lemma-5-8 pins the diamond characters (E226);
  - maximal-ideal-m-of-Tuniv maps to k;
  - tw-prime-splitting-and-diamond-map: λ(α) is defined on p. 306;
  - ext-cht-prop-2-5-9 gains the two missing conditions of CHT Definition 2.5.7;
  - rmk-9-3's editorial is corrected (Lemma 5.9(1) covers the imaginary-quadratic case);
  - lemma-7-2's "i.e." was fixed.
- **Status changes:**
  - fricke-w-x and tw-local-selmer-dimension are now **missing**, routed to routes 6 and 5, because their cited layers do not plan them.
  - Planned lists were corrected for prop-2-3-R-presentation, patching-rings, prop-3-3-TW-primes, rem-3-10-stacks, assumption-3-9-no-vexing-primes, thm-3-19-1-kisin, prop-6-6 and lemma-7-1.
- **Names and locators:** thm-1-3, thm-1-4, thm-5-16, unramified-rings-presentation, the D_v^1 and D_v^χ items, taylor-ihara-avoidance, and others. betti-poincare-duality-identification, gl1-taylor-wiles-primes and thm-9-19 were renamed to what the paper states.
- **Duplicates:** canonical-module-regular-sequence-facts, a word-for-word duplicate of three p. 355 items, was **removed**. prop-8-5-proof-dual-selmer-sequence now cites tw-dual-selmer-exact-sequence instead of restating it.

**New: 16 items.** The totals are now 510 items: 8 library, 224 planned and 278 missing.

- **Planned (5):** each against a layer description that was read.
  - weight-one modularity with Deligne–Serre finiteness (R19.1, R15.5);
  - the q-expansion principle with torsion coefficients (R15.2);
  - the dual Selmer change at Taylor–Wiles primes over an imaginary quadratic field (R02.5, R04.5);
  - regular algebraic cuspidal π with trivial infinitesimal character (AG2.0);
  - the Borel–Serre compactification and boundary (ALS.2, ALS.4).
- **Missing (11):**
  - route 1: the deduction of Theorem 1.2 from 1.3, the cartesian degeneracy squares, and the two steps of Theorem 3.30(4);
  - route 2: "Serre modular of minimal level" for GL_n;
  - route 5: the non-smooth cases of Lemma 4.11, with the fourth case;
  - route 6: Edixhoven's Kodaira–Spencer isogeny lemma;
  - route 15: parahoric invariants of n-ind_B^G, and Ext between distinct torus characters;
  - route 16: the twisted modular curve X_E(q);
  - route 18: dévissage and cofiniteness for K/O coefficients.

**Library.** All eight library items were checked at the pins. Every cited declaration exists and provides the item.
- restriction-injective-finite-index-char-0 is a short corollary of them, with Maschke, rather than a single declaration.
- top-cohomology-base-change is a composite of six Mathlib declarations.

## Routes

1. **Part II `GL2ModularityLiftingDefectOne`: accept.** No atlas layer proves R = T in defect one.
   - An addendum to the brief records E221, E224 and E226.
2. **Part II `AutomorphyLiftingBeyondTaylorWiles`: accept.** The conditional GL_n theory over arbitrary number fields is planned nowhere.
   - The addendum records E229, E213 and E214.
3. **Part II `IntegralCoherentHeckeComplexes`: accept.** PAPER-CALEGARI-GERAGHTY-20 routes to the same id.
4. **Sources of existing layers (routes 4–23): accept.** The review added items to routes 4, 5, 6, 15, 16 and 18.

## Mistakes in the paper (`sourceIssues`)

**Recorded by the extraction: E1–E217, all confirmed.** Each was checked at its locator on the page image and in the TeX. The 12 known entries from the 2022 Correction had their brackets seen on the images. Field corrections:

- **Scope.** Parts that duplicated other entries were removed:
  - E2: its "length" part is E3.
  - E14: now only p. 306 and its copy on p. 384.
  - E21: only the W_x² claim; the rest is E22.
  - E24: its −f part is E28.
  - E81: re-scoped to the p. 361 "k = 2" slip; the rest is E83.
  - E84: only the ψ half (Φ is correct as printed).
  - E96: only point (i); the rest is E97 and E99–E100.
  - E146: its "H_i i" part is E145.
  - E148: its "d on D" part is E149.
  - E155: only point (a); the rest is E159 and E161.
  - E176: only the N − 1 misprint; the rest is E177.
  - E208: its p. 427 display is E210.
- **Kind or affects.**
  - E26 now affects the proof, consistent with E27.
  - E147 is a misprint that affects nothing.
  - E180 affects the proof: it makes Theorem 9.19 vacuous rather than false.
- **Other fixes.**
  - E27's correction: x is a unit because x ≠ p.
  - E88's and E205's locators.
  - E89's printed field wrongly called O[Δ] a bracket misprint.
  - E142 gains the S∞^□-linearity of Proposition 6.6's conclusion.
  - Wrong page references in the reasons of E2, E9, E24, E51, E72, E111, E117, E120, E126, E139 and E177 are corrected in the verdicts.

**New: E218–E230.** Three affect proofs, and I checked each in the TeX myself.

- **E221 (error, the proof; §3.9.1, p. 344).** The paper says that, by flatness, the pullback of L_σ is the level-V invariant sheaf, and builds φ(σ)_12 and the Hecke operators on that.
  - When T(ρ̄) ≠ ∅, the cover X(V) → X_U ramifies at every cusp (Lemma 3.28), and the degeneracy maps ramify with coprime index at some cusps.
  - There the fibre product is locally O⟦s, r⟧/(s^x − r^e). This is not normal, and X_0(V; x) is its normalisation. So the pullback is a proper subsheaf wherever a non-trivial χ-part of W_σ is non-zero.
  - The paper itself notes that the pullback of L_σ^sub is only a subsheaf.
  - Repair: define L_σ at level V throughout. No stated result changes.
- **E224 (error, the proof; §4.1, p. 363).** Take v | N with v ≡ −1 mod p and ρ̄|G_v a ramified twist of (ω̄ ∗; 0 1). This is the case E89 adds to Lemma 4.11.
  - The unrestricted ring R_{v,φ} has components of lifts Ind_{Q_{v²}}ψ, of conductor v². No twist by a character ≡ 1 mod ϖ lowers the conductor, because p ∤ v − 1.
  - These components are outside the support of S_φ, whose local components at v are Steinberg.
  - Since the kernel of R_loc⟦x⟧ → R^□ is generated by part of a system of parameters, R_φ[1/p] ≅ T^an_{φ,m}[1/p] and R̃ ≅ T_{φ,m} fail as printed.
  - Repair: use the formally smooth Steinberg quotient at such v. Theorem 4.8 survives.
- **E229 (gap, the proof; §9.3, pp. 417–418).** The proof of Lemma 9.6 deduces H^i(Y)²_m ≅ H^i(Y_0(x))_m at the anaemic m. The argument inverts U_{x²} − 1 only on the old part.
  - Repair: localizing at m̃ = (m, U_x − α_x), where α_x² − 1 is a unit, gives what Conjecture B(5) needs.
- **The other ten (E218–E220, E222, E223, E225–E228, E230) are misprints.** Two of them:
  - E226: "the maximal ideal" in Lemma 5.8 is not unique, because T_Q contains the diamond operators at Q.
  - E228: Definition 9.1 reuses k for the degree and the Hecke index, and n for the coefficient exponent and the rank.

**Not recorded:** low-confidence doubts the checkers could not settle. Among them:
- DDT Theorem 2.18 versus 2.19 (pp. 311, 370);
- whether the boundary hypothesis is needed for the §9.5 duality;
- the U_x adjoint at Taylor–Wiles level in Proposition 5.10, which does not affect its dimension count;
- CDT's normalisation behind E61;
- Proposition 5.2 at p = 5 with projective image PSL₂(F₅);
- the need to enlarge O for the geometric integrality in Lemma 8.2.

**Published corrections:** Crossref records only the 2022 Correction (doi:10.1007/s00222-021-01095-5), re-checked on 23 September 2026.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CALEGARI-GERAGHTY-18.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: no problems.
- Every missing item is routed exactly once, and item ids are unique.
- Every changed item carries a review note, and every source issue carries a review verdict.
- Lean: none (a review of an extraction).
