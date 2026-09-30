# REV-PAPER-GAROUFALIDIS-SCHOLZE-WHEELER-ETAL-24

Independent review of the extraction of Garoufalidis, Scholze, Wheeler and Zagier, *The Habiro ring of a number field*
(arXiv:2412.04241), for issue #4516. The extraction is by Claude Code, session `cc-58621d` (issue #4515, PR #4564).

Reviewer: Claude Code, session `cc-c2c06b`, 30 September 2026. I did not write the extraction, its report, or any of
the Habiro blueprints.

**Verdict: accept, after corrections made in place.** All four routes are accepted. The corrections are listed below
and recorded in the files.

## What I read

- **arXiv v2** (<https://arxiv.org/abs/2412.04241v2>), all 73 pages, with its LaTeX source. The PDF's SHA-256 is
  `308d1dd1…73de9`, the file the extraction read.
- **The v1 LaTeX source.** I diffed it against v2: §§2–5 are identical, and §1 differs only in §§1.1 and 1.8 and in
  wording.
- **Where a finding relies on a cited source:**
  - Habiro, *Cyclotomic completions of polynomial rings*, Publ. RIMS 40 (2004), and its arXiv version;
  - Calegari–Garoufalidis–Zagier, arXiv:1712.04887, v1–v3;
  - Besser–de Jeu and Weibel, only as cited.
- **No published correction.** On 30 September 2026 arXiv lists only v1 and v2, and Crossref has no journal version,
  erratum or corrigendum.
- **The atlas side:**
  - the descriptions of all 35 stages the items cite;
  - the reviewed Habiro blueprints in `data/blueprints/`;
  - the declaration index at Mathlib `082e2d3` and Tau Ceti `f790474`.

I split the checking into five parallel passes, run by this session:
- the items of §§1–2;
- the items of §§3–5;
- findings E1–E22, E23–E45 and E46–E67.

Every numerical claim was recomputed with sympy and mpmath.

## Items

**Locators.** All 151 locators are right. The one exception is item 63, which lacked "Lemma 2.5".

**Statements corrected in place** (33 items):

- **Missing hypotheses:**
  - 43 (Theorem 5): K = Q(z) and R = O_K[1/Δ], with Δ divisible by disc(K), by 6 and by the exceptional primes of CGZ
    Theorem 1.6, and every z_j a unit;
  - 113 (Theorem 12): the scheme condition at t = 1, and Δ as in Theorem 5;
  - 143–144: R = O_K[1/Δ] with disc(K) | Δ;
  - 94, 96, 100 and 101: p odd, or p > 3;
  - 102, 104, 105 and 108: p > 3, p ∤ Δ, and the E38 restriction to roots of unity with every component ≠ 1;
  - 74: Λ invertible;
  - 66: A > 0 in the closed form for V_A;
  - 89: Z_(p), as finding E37 requires.
- **Formulas copied wrongly or from a misprint:**
  - 75: (114), now finding E76;
  - 77: the dropped t^{k/m} of (121);
  - 107: (210);
  - 111: (216) has P_i(w^m), not P_i(w)^m;
  - 126: (278) has /3³;
  - 136: (315), where D_2(n) needs the factor n/m to give the tabulated 2 and 72;
  - 147: (343) has (qw;q)_k³;
  - 148: (349)–(350), now finding E81;
  - 127: c² is given exactly;
  - 125: μ(K_5) ≅ μ_24 × μ_4, and ζ_24 generates only the μ_24 factor.
- **Precision:**
  - 11: H_R is the intersection only through the Frobenius-twisted map;
  - 48: which Habiro ring;
  - 49: the symplectic matrix is 2N × 2N, finding E75;
  - 84 and 87: what F and the invariants are;
  - 123: Hensel's step, finding E78;
  - 142: R^∧_p for p | Δ, finding E77.
- **Item 17** is narrowed to the function D_p on C_p ∖ {0, 1}. The combined map B(K) → K_p stays in item 91.

**Splits** (seven new items, 152–158):
- Theorem 2, into (i), which is proved, and (ii), the isomorphism, which is unproved (E41);
- Corollary 2.4 (a)/(b)/(c);
- Theorem 9 (a)/(b);
- the Bloch–Wigner five-term relation, out of the definition in item 90;
- Besser–de Jeu Corollary 4.9 out of Lemma 3.1 (item 92), which had presented the cited input as a consequence;
- Weibel's K_3(K_p; Z_p) computation out of item 97.

**Kind.** Item 120 is a theorem, not a construction.

**Missing items added** (159–168), each on the way to a main result and planned by an existing layer:

| Item | What | Layer |
|---|---|---|
| 159 | Balanced products do not see the polar part of f̂ (used for Proposition 1.5(e) and Theorem 2) | HB.7 |
| 160 | The level-m q-difference equation of the congruence sums and its unique solution (Theorems 7–8) | HB.8, HB.9 |
| 161 | The Galois shift (124) (Lemma 2.12, Theorem 5) | HB.8 |
| 162 | Integrality of the shift ratios G_j (proof of Theorem 6) | HB.8 |
| 163 | The intersection identity (57) (Proposition 2.2(a)) | HB.9 |
| 164 | The first-order q-difference equation (138) (Lemma 2.15) | HB.8 |
| 165 | The ψ^{(γ)} system (211)–(213) and its uniqueness, which gives the gluing in Theorem 5 | HB.9 |
| 166 | CGZ Theorem 1.6 with Hutchinson: the constant terms (cited) | HB.2, HB.9 |
| 167 | The Kashaev–Mangazeev–Stroganov identity (cited, Corollary 1.11(b)) | HB.2 |
| 168 | The families f_{A,μ,ν}, Ψ_{A,μ,ν} and their system (222)–(226), on which Theorem 12 is stated | HB.9 |

The result has 168 items: 6 library, 150 planned and 12 missing.

**Standing assumption.** Item 8's note now records Remark 1.8: throughout, only p > 3 is considered and 2, 3 | Δ.

## Statuses

**Library.** All six declarations exist at the pins.

- Item 96 was restated for p odd and non-zero residues. The Tau Ceti declarations give μ_{q−1}(O) ≅ k^×, and the
  absence of p-power roots of unity in an unramified extension is a one-line addition.
- Item 142's statement was corrected (E77). Its note says that the Mathlib declaration covers finite modules over a
  Noetherian ring, so the localisation O_K[1/Δ] needs one extra line.

**Planned.** I read the descriptions of all 35 cited stages: HB.1–HB.10, HC.1–HC.6, HR.4, HR.5 and its
number-field comparison, D.1–D.4, L2, P.1–P.2, V.3–V.4, M.7–M.8, N.2, QT.5 and QT.6. Each plans the items that cite it.
Most were written for this paper.

**Missing.** All 12 missing items are routed, each exactly once.

## Routes

1. **HabiroCyclotomicCompletions HC.2/HC.4/HC.6: accept.** This is the congruence description of §5.1. I recomputed
   Proposition 5.1 in its corrected form: det M_5 = 1327104 = D(4), and |det M_N| = D(N − 1) for N ≤ 7. The accepted
   HabiroNumberFields node `HB.6/ring-operations-and-the-classical-comparison` already quotes (310) for its lattice
   step. When HC.2/HC.4 plan Propositions 5.1–5.2, HB.6 should import them rather than repeat the computation.
2. **HabiroNumberFields HB.6/HB.7: accept.** Proposition 5.4, Remark 5.5 and Remark 3.8 extend the layers built on
   Definitions 1.1–1.4. The route's corrections E2, E5, E9 and E41 are confirmed. Theorem 2's unproved part is now item
   152.
3. **HabiroNahmSeries HB.8–HB.10: accept.** §5.4's series are examples of HB.9's residue machinery. The route's
   corrections E64–E66 are confirmed, and E81 is added for the x-coefficient in (349)–(350).
4. **PadicHodgeRegulators D.1/D.3/D.4: accept.** The paper is D.3's source. The route records:
   - E39, the unproved containment D_p(K_3(K_p; Z_p)) ⊆ p²O;
   - E38, as corrected here: no ord(ζ) factor is needed, since ζ ∧ (1 − ζ) = 0 in each factor Q_{p^s};
   - E56, recomputed here to 5^22.

   Items 155, 157 and 158 were added to it, and E79–E80 record that p must be odd.

## Mistakes in the paper

**E1–E67: all confirmed.** Every quotation matches v2, and every "same in v1" claim holds. Fifteen findings had a field
corrected:

| Finding | Correction |
|---|---|
| E1, E3, E6 | (14)'s last term is the calligraphic ring of Definition 1.1, so the missing step is that the glued families over R_p are the naive ring. |
| E10 | The failure depends on how K_p is read for p \| Δ. |
| E14 | The two constants must agree exactly, not modulo p. |
| E18 | Now an **error**, with counterexamples. For A = (3 −1; −1 3) and z = (ζ_6, ζ_6), N(δ) = 39 with Δ = 6; for A = (1 2; 2 1) over the cubic field of discriminant −23, N(δ) = −115. |
| E20 | The same p^N slip is also in the sentence before (54). |
| E30 | (100) inherits the missing sign; locator and quotation made exact. |
| E38 | The ord(ζ) part is dropped. |
| E42 | Hutchinson proves R_ζ = c_ζ². |
| E45 | Literally, S^{(m)}[1/(mΔ)]. |
| E51 | The constant term is also off, by a factor e^{V/2}. |
| E59 | Corollary 3.7 extends the sections to all roots of unity; the subscript is still a slip. |
| E61 | The error is in (290) (G_m = −2 when 4 \| m), not in (289). |
| E67 | v2 added one duplicate key. |

**E68–E83: new, checked here and confirmed.** They are 12 misprints and 4 errors. One, E73, affects a stated result;
the rest affect nothing.

| Finding | Where | What |
|---|---|---|
| E68 | p. 7, after (15) | 𝓗_R̂ ≅ 𝓗_{Z[1/Δ]} ⊗ R̂ needs a completed tensor product. |
| E69 | (107), p. 27 | The factor is m, not −am. |
| E70 | (101)–(102), p. 27 | The coefficient of a_n carries q^{k(ℓ−1)}. |
| E71 | (103)–(104), p. 27 | Φ_d(q)^{−1}, not Φ_d(q). |
| E72 | p. 53 | Li^{(p)}_n(t/(1 + t)), not t/(1 − t). |
| E73 | p. 57 (**error, affects a stated result**) | The (−2,3,7) series is not in H_{O_K[1/7]}, by the paper's own denominators. |
| E74 | p. 4 | (q;q)_n = 0 for n ≥ m, not m > n. |
| E75 | p. 16 (v2 only) | The symplectic matrix is 2N × 2N. |
| E76 | (114)–(116), p. 29 | The denominators mh and 2h, the sign of the constant sum, and the critical data at t^m. |
| E77 | pp. 5, 65 | R^∧_p ≅ R ⊗ Z_p fails for p \| Δ. |
| E78 | p. 53 (**error**) | Hensel's step needs p ∤ disc(P). Counterexample: ξ = 5√2 in Q(√2) at p = 5. |
| E79 | Corollary 3.5 (**error**) | p = 2 fails: exp(2) diverges 2-adically. |
| E80 | Proposition 3.2 | ζ = −1 at p = 2. |
| E81 | (349)–(350) (**error**) | The x-coefficient is t²wPP′/(1 − tP)³. |
| E82 | p. 61 | 𝓗_R ≅ 𝓗_Z ⊗ R holds only at finite level. |
| E83 | (317), p. 63 | The domain is P_R^N. |

## Checks

- `python3 scripts/check_paper.py` on the extraction: ok.
- `research/blueprint/intake.py check-files` on the deliverables: no problems.
- No Lean is involved in a paper review, and none was run.

## For the maintainer

- **E73** is the only new finding that affects a stated result. The paper's own figures show the claim of §4.6 to be
  false as printed.
- **E18** is now an error with explicit counterexamples. It is already recorded in the HabiroNahmSeries packet as
  HabiroNahmSeries/E55, and the packet's copy should take the counterexamples.
- **The extraction's report** (`PAPER-GAROUFALIDIS-SCHOLZE-WHEELER-ETAL-24.md`) now has a section summarising this
  review. Its original analysis is unchanged.
