# PAPER-BRIGHT-NEWTON-23: Evaluating the wild Brauer group

Martin Bright and Rachel Newton, *Evaluating the wild Brauer group*, [Inventiones mathematicae 234 (2023), 819–891](https://doi.org/10.1007/s00222-023-01210-8), open access; arXiv [2009.03282](https://arxiv.org/abs/2009.03282).

Extraction by Claude Code, session `cc-39fac3`, 22 September 2026 (issue #1239). Status: **complete**. The whole paper was read, and every missing item is routed once.

The machine-readable extraction is [PAPER-BRIGHT-NEWTON-23.result.json](PAPER-BRIGHT-NEWTON-23.result.json). It has:
- 113 items: 4 planned, 109 missing;
- 5 routes: 3 source routes and 2 Part II candidates;
- 13 prerequisite entries;
- 7 recorded source issues.

**Sources read.**
- **arXiv v5** (5 October 2023, "Final version"), read in full from its TeX source.
- **The published Inventiones PDF** (73 pages), read in full. A word-level diff against v5 finds only typesetting and reference formatting.

Statement numbers are the same in both versions. Page numbers are the journal's (pp. 819–891).

## What the paper proves

**Setting.**
- k is a finite extension of Q_p, with residue field 𝔽, absolute ramification index e, and e′ = ep/(p−1).
- X/k is smooth and geometrically irreducible, with a smooth model 𝒳/O_k, not necessarily proper, whose special fibre Y is geometrically irreducible.
- F is the function field of Y.
- A class A ∈ Br X of p-power order evaluates on 𝒳(O_{k′}) for every finite extension k′/k.

**Main results.**
- **The evaluation filtration.** Ev_n Br X consists of the classes whose evaluation is constant on every disc B(P, e(k′/k)(n+1)). Ev_{−1} means constant everywhere, and Ev_{−2} means zero everywhere.
- **Theorem A.** Ev_n equals a modification fil~_n of Kato's Swan-conductor filtration:
  - Ev_{−2} = ker ∂;
  - Ev_{−1} = ∂^{−1}H¹(𝔽, Q/Z);
  - Ev_0 = fil_0;
  - for n ≥ 1, Ev_n = {A ∈ fil_{n+1} : rsw_{n+1}(A) ∈ [Ω²_F, 0]}.

  Unramified extensions k′ suffice.
- **Theorem B / Theorem 8.1.** Write rsw_n(A) = [α, β]_{π,n}. Then α and β are regular at P₀, and:
  - inv A(Q) = inv A(P) + (1/p) Tr β_{P₀}(v_n(P, Q)) on B(P, n), so the refined Swan conductor is exactly the "derivative" of the evaluation map;
  - when β = 0, a bilinear formula in α_{P₀} governs the next discs;
  - under explicit bounds on n, evaluation surjects onto Br k[p^{t+1}].
- **Theorem C.** If H⁰(V, Ω²) ≠ 0, every prime of good ordinary reduction of V/L carries a Brauer–Manin obstruction to weak approximation after a finite extension. So Swinnerton-Dyer's Question 1.3 has a negative answer.
- **Theorem D.** If Pic V̄ is finitely generated and torsion-free, evaluation of all of Br V is constant outside an explicit finite set of places. These are:
  - the archimedean places;
  - the places of bad reduction;
  - the places with e_𝔭 ≥ p − 1;
  - the places with H⁰(𝒱(𝔭), Ω¹) ≠ 0.

  For K3 surfaces over Q this leaves ∞, the bad primes and 2.
- **§10.** fil~ is not generated from any filtration on H¹ (Proposition 10.2). It is not the non-logarithmic Abbes–Saito filtration (10.8), nor the logarithmic one (10.9).

**How it is proved.**
- §2 sets up Kato's theory for a Henselian DVF K with imperfect residue field F:
  - V^q(A) = H^q(i*Rj_*);
  - fil_n H^q(K), tested by {χ, 1 + π^{n+1}T} = 0;
  - λ_π and δ_r, through Bloch–Kato's filtration on p-adic vanishing cycles;
  - rsw_n.

  It also proves new lemmas: base change (2.16), dβ = (−1)^q nα (2.17), and Swan conductors of pχ (2.19).
- §3 handles tame classes: A ∈ fil_0 evaluates through its residue ∂A ∈ H¹(Y, Q/Z).
- §4 recalls Kato's geometric results on regular local rings: Theorem 7.1 (integrality) and Theorem 8.1 (blowups).
- §§5–7 compute residues of log forms after blowing up a point, on P^n, and on tangent vectors.
- §8 proves Theorem 8.1 by induction. Blowing up P₀ lowers the Swan conductor along the exceptional divisor E by 1, or by 2 when β = 0 (Lemmas 8.3–8.4). At conductor 0 the residue is an explicit Artin–Schreier class on E ∖ Z (Lemmas 8.6–8.7), and Lemma 3.3 turns it into a trace.
- §9 deduces Theorem A; §11 deduces Theorems C and D.

## What the atlas already has

**Planned.**
- The local Brauer group and its invariant, with restriction multiplying by the degree: Class field theory, Layer 5.
- The Brauer–Manin pairing: HeightsRationalPointsAndObstructions:RP.2.
- De Rham–Witt complexes with dlog: CrystallineCohomology:CR.4, with logarithmic coefficients at HigherLocalFieldsAndHigherClassFieldTheory:HL.2.
- The Cartier operator: DerivedDeRhamCohomology:DD.3.

**Not in the atlas or the libraries.**
- Kato's Swan conductor for imperfect residue fields.
- Bloch–Kato p-adic vanishing cycles.
- Refined Swan conductors.
- Abbes–Saito ramification.
- Any evaluation theory of wild Brauer classes.

Searches covered "Swan", "Kato … filtration", "refined Swan", "evaluation", "Abbes–Saito", "imperfect residue", "Bloch–Kato", "vanishing cycle", "de Rham–Witt", "Cartier", "Brauer" and "Hochschild–Serre", across data/atlas.json, the proposed roadmaps and every earlier paper extraction.

**Nearest existing owners.**
- ArithmeticGaloisRepresentations:R01.3 is the perfect-residue numerical Swan conductor.
- HL.4 plans ramification filtrations for higher local fields.
- LefschetzPencilsAndVanishingCycles:LPV.0 plans the strict-Henselian RΨ.

None of these plans Kato's filtration on H^q of a general Henselian DVF.

**Libraries.**
- Mathlib has Kähler differentials, Witt vectors, Henselian local rings and the Brauer group of a field as classes of central simple algebras.
- Tau Ceti adds the base-change API for that Brauer group.
- Neither has the cohomological Brauer group of a scheme, étale cohomology, the de Rham differential on Ω^•, log differentials, the Cartier operator or Galois-cohomological Swan conductors.

So no item is marked `library`.

## Routes

1. **Source → SchemeAndStackFoundations:SF.2** (5 items). These are general étale-cohomology inputs:
   - Gabber's affine proper base change;
   - invariance of H^q of proper varieties under extension of algebraically closed fields;
   - purity Br 𝒳 = Br X ∩ Br O_{𝒳,Y} (the Česnavičius extraction already sends Brauer purity here);
   - the Hochschild–Serre sequence for H¹ over a finite field (as in the Harpaz–Wittenberg extractions);
   - Lemma 11.4 (vanishing of H¹ specialises).
2. **Source → WeilConjectures:WC.5** (1 item). Lang–Weil, as PAPER-HARPAZ-WITTENBERG-16 already routed it.
3. **Source → HeightsRationalPointsAndObstructions:RP.2** (1 item). The one-place Brauer–Manin test: non-constant local evaluation obstructs weak approximation, and surjective evaluation does not obstruct the Hasse principle. RP.2 plans exactly such effective tests.
4. **Part II → LocalFieldsPartIIKatoSwanConductors**, "Local fields and ramification, Part II: Kato's Swan conductors for imperfect residue fields" (44 items; parent tauceti:TauCetiRoadmap/LocalFieldsRamification).
   - **Contents:**
     - Kato's coefficients and V^q(A);
     - fil_n and sw, λ_π, δ_r and rsw_n;
     - Kato's Propositions 6.1 and 6.3 and Theorem 5.1;
     - Bloch–Kato's gr⁰ of p-adic vanishing cycles and Lemma 3.4;
     - the paper's Lemmas 2.7–2.23;
     - the geometric results of §4 (Kato's 7.1, 7.3, 7.4, 8.1 and Lemmas 4.5–4.7);
     - the modified filtration fil~_n;
     - all of §10 (the Abbes–Saito filtrations, Kato–Saito, and Propositions 10.2–10.9).
   - **Why a separate owner:** this is local ramification theory that stands on its own, and other wild-ramification papers will need it. Keeping it out of the Brauer-evaluation roadmap avoids planning it twice. HL.4 should import it, not define a second Swan filtration.
5. **Part II → HeightsRationalPointsPartIIWildEvaluation**, "Heights, rational points and obstructions, Part II: wild Brauer evaluation over p-adic fields" (58 items; parent HeightsRationalPointsAndObstructions).
   - **Contents:**
     - the evaluation filtration and Theorem A;
     - tame evaluation (§3);
     - the blowup, P^n and tangent-vector lemmas (§§5–7);
     - Theorem 8.1 with its lemmas;
     - §9;
     - Theorems C and D with Lemmas 11.1–11.3, Bloch–Kato's ordinary theorem and Colliot-Thélène–Skorobogatov's Proposition 2.4;
     - Questions 1.3–1.5 as questions;
     - Remarks 1.6 and 11.5.
   - **Why a Part II of this roadmap:** RP.2 owns the pairing, not how local evaluation varies on discs. None of the existing RP Part II candidates (homogeneous Massey, zero-cycles, random norm and conic fibrations) is about local evaluation.
   - **Gaps it must flag:**
     - Remark 1.6(1) needs Fontaine–Messing's mod-p comparison and Deligne–Illusie degeneration. Neither is planned, but no proof uses the remark.
     - Theorem D's "H¹(O) = 0 ⇒ H⁰(Ω¹) = 0" needs Hodge symmetry in characteristic 0, which has no located owner.

## Source issues (`sourceIssues` E1–E7)

All seven appear identically in arXiv v5 and the published version. No correction was found:
- arXiv has versions v1–v5 only;
- Crossref records no update relation;
- the Springer article page shows no correction.

- **E1 (misprint, Lemma 6.1(3) proof, p. 859).**
  - **Printed:** "X_i² d(X_j/X_j) form a basis for H⁰(H, Ω¹(2))".
  - **Correction:** X_i² d(X_j/X_i).
  - **Why:** d(X_j/X_j) = 0. Lemma 6.1(2) and the preceding computation both give X_i² d(X_j/X_i).
- **E2 (misprint, Lemma 9.2 proof, p. 879).**
  - **Printed:** "res_{k′/k}A ∈ fil_n Br X_{k′}".
  - **Correction:** fil_{n+1}.
  - **Why:** A ∈ fil_{n+1} and k′/k is unramified. The next sentence uses rsw_{n+1}(res A) = [α, 0] with α ≠ 0, which would vanish if res A were in fil_n.
- **E3 (misprint, Lemma 9.5, p. 880).** The statement opens "For every r ≥ 1", but r appears nowhere.
- **E4 (gap, Corollary 9.8(2) proof, p. 882).**
  - **Printed step:** in the case α = 0, p ∤ e, the proof infers res A ∉ Ev_{en−1} from rsw_{en}(res A) ≠ 0.
  - **Why it fails:** that only excludes fil_{en−1}. With β′ = 0 ≠ α′, res A would lie in Ev_{en−1}.
  - **Why the statement survives:** β′ ≠ 0 always holds because A ∉ fil~_{n−1}. The proof of Lemma 9.2 says so, so the case table is right.
- **E5 (misprint, Proposition 10.8 proof, p. 886).**
  - **Printed:** "the equality does not hold for n = e′".
  - **Correction:** the witness {ψ, π} satisfies f_K ≤ e′ = (e′ − 1) + 1 but lies outside fil~_{e′−1}. So the failure is at n = e′ − 1.
- **E6 (error in the proof, Proposition 10.9, p. 886).**
  - **Printed:** "Let L/K be any wildly ramified extension of degree p", followed by e′_L = pe′ and rsw_{e′_L}(res A) = [c̄_L ω, 0] with c̄_L ≠ 0.
  - **Why it fails:** this is false for ferociously ramified L (e(L/K) = 1, a term the paper itself uses in Lemma 10.5). For L = K(x̃^{1/p}), res A = (x̃, ỹ)_p = 0.
  - **Correction:** take L totally ramified, e.g. K(π^{1/p}). The proposition needs only one L, so it stands.
- **E7 (gap, introduction before Theorem C, p. 823).**
  - **Printed:** "It gives a positive answer to that question" (Wittenberg's Question 1.4).
  - **Why this overstates it:** Theorem C assumes a prime of good ordinary reduction and uses ordinarity through Bloch–Kato's Theorem 0.7(iii). The paper itself notes that such primes are only conjectured in general (Serre, via Joshi); they are known for abelian surfaces and K3 surfaces.
  - **Correction:** the answer to Question 1.4 is positive for varieties with an ordinary prime. The negative answer to Question 1.3 remains unconditional.

The items use the corrected statements.

## Prerequisites not yet covered

1. Kato 1989, Contemp. Math. 83, the source of fil_n and rsw_n. The paper cites it 67 times.
2. Bloch–Kato 1986, IHÉS 63.
3. Illusie 1979.
4. Abbes–Saito 2002.
5. Kato–Saito 2019.
6. Saito, arXiv:2004.03770.
7. Matsuda 1997.
8. Bright 2015 (bad reduction).
9. Colliot-Thélène–Skorobogatov 2013.
10. Colliot-Thélène–Saito 1996.
11. Gabber 1994.
12. Borger 2004.
13. Kato's local class field theory II (1980).

DOIs were checked against Crossref. The Colliot-Thélène–Saito DOI resolves through doi.org to OUP but has no Crossref record, and Kato 1980 has no DOI.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BRIGHT-NEWTON-23.result.json` passes.
- The generator asserts that every missing item is routed exactly once and that planned items carry no route.
- **Checked by hand:**
  - Lemma 2.19's binomial valuations and Remark 2.20;
  - Lemma 3.3;
  - the residue computations of Lemmas 5.1 and 6.1;
  - the first steps of the §8 blowup induction;
  - all of §9, including the use of Lemma 2.16's base-change formula in Corollary 9.8;
  - Lemma 10.1 and Proposition 10.2;
  - the conductor values of Lemmas 10.4–10.7 against Proposition 10.3 (for example, K(π^{1/p}) has sw = e′ with β ≠ 0, hence f_K = e′ + 1);
  - Propositions 10.8 and 10.9;
  - Lemmas 11.1–11.4 and the proofs of Theorems C and D.
- Kato's and Bloch–Kato's cited theorems were used as quoted.
- No Lean was written or compiled; this is an extraction.
