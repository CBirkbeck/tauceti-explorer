# Mistakes in Bhargava–Shankar–Taniguchi–Thorne–Tsimerman–Zhao, *Bounds on 2-torsion in class groups of number fields and integral points on elliptic curves*

Job ERRATA-PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20. Worker: Claude Code, session `cc-442dc5`, 23 September 2026. The findings are in `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.json` beside this file.

**Paper and versions read.** J. Amer. Math. Soc. 33 (2020), 1087–1099, DOI 10.1090/jams/945.
- **What was read.** The findings were located in Taniguchi's author copy of 18 February 2017 and in arXiv 1701.02458v1, the only arXiv version. Some formulas were checked on page images.
- **What could not be read.** The published JAMS text: the AMS PDF returned HTML, and Unpaywall lists no open copy.
- **Consequence.** It is not known whether the published version already corrects any of these. Each finding therefore records the version it was checked in.

**Earlier work.**
- The extraction PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20 (complete; its last continuation was this session) recorded eleven findings.
- Four are mistakes in cited papers and are left to those papers: its E1–E3 in the Bombieri–Pila preprint, and its E10 in Sedunova's function-field Bombieri–Pila bound.
- Its E4–E9 and E11 are E1–E7 here, kept with everything they say.

**Existing corrections.** None was found. Crossref registers no update, and arXiv has only v1. All seven findings are new relative to the versions read.

**Effect on the main results.** The main bound h_2(K) ≪ |Disc(K)|^{1/2 − δ_n + ε} for degree-n fields is unaffected, and so are the integral-points and elliptic-curve applications. Three findings matter:
- **E5 (affects the proof).** The index-two step needs the relative genus bound with h_2(F)², which the checkpoint routes.
- **E6 (a stated result).** Theorem 1.3 is false with Disc(K) and true with Disc(C).
- **E7 (a stated result).** The second assertion of Theorems 1.7 and 7.1 is not established.

## E1 — the proof of Theorem 2.1: the complex-place radius (p. 4)

- **The misprint.** A complex coordinate contributes a disc of area πR_v², not √π·R_v.
- **The correction.** The body volume is 2^r π^s √|D_K|/N(I).
- **A check.** For K = Q(i), the printed value falls below Minkowski's threshold, but the correct one does not. The argument uses the correct volume.

## E2 — §5.1: missing absolute values (p. 7)

- **The misprint.** The bounds should read |B| ≤ |Disc(K)|^{2/3} and |C| ≤ |Disc(K)|. B and C take both signs, like A, which is printed with absolute values.

## E3 — Remark 7.2: a missing factor in the class number formula (p. 10)

- **The misprint.** The formula should be |Pic⁰(C)(k)| = |k|^g (1 − |k|^{−1}) log|k| · Res_{s=1} ζ_C(s).
- **Why.** The residue of ζ_C at s = 1 contributes the factor 1 − |k|^{−1}.

## E4 — Remark 7.3: 2-torsion in characteristic 2 (p. 10)

- **The misprint.** The 2-torsion of a Jacobian in characteristic 2 has size 2^f, where f ≤ g is the 2-rank. The size 2^g holds only in the ordinary case.
- **Effect.** Only the upper bound is used.

## E5 — §4: the index-two case of Theorem 1.1 (p. 6)

- **The gap.** The step bounds h_2(K) by h_2(F) times O(2^t) "by genus theory" and gives no reference.
- **What is actually known.** The published relative bounds (Cornell; Klüners–Wang, Theorem 2.1) carry h_2(F)².
- **The repair.** With Theorem 1.1 for F, the relative bound still gives the claimed exponent. The conclusion stands, but the printed justification is not a proof.

## E6 — Theorem 1.3 with Disc(K) is false (pp. 2–3)

- **The error.** K = Q[x]/(f) does not see the twists of C.
- **The counterexample.** For f = x³ − N²x, K ≅ Q³, so Disc(K) = h_2(K) = 1. The bound would then make |Sel_2| bounded over the congruent-number curves, whose 2-Selmer ranks are unbounded (Heath-Brown; Swinnerton-Dyer; Kane).
- **The correction.** With |Disc(C)|^ε, as the remark after the theorem allows, both parts hold.

## E7 — Theorems 1.7 and 7.1, second assertion: not established (pp. 3, 11–12)

- **The gap.** The one-sentence proof points to the §4 argument with Sedunova's function-field Bombieri–Pila bound.
- **Why it does not give the statement.** That bound has an ε-loss and a constant depending on q, so it cannot give the ε-free, n-only bound as printed.
- **What stands.** The first assertion of Theorem 7.1 is proved in full.
