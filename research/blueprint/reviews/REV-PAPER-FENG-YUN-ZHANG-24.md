# REV-PAPER-FENG-YUN-ZHANG-24: review of the Feng–Yun–Zhang extraction

**Verdict: accept, after corrections made in place.**
- **Routes.** All three are accepted. The Part II brief gets review additions.
- **Items.** Twenty-two items are corrected and one is added (item 34). No status changes.
- **Source issues.** E1–E3 are confirmed. Twenty-five new issues are added. The main one is E22: Lemma 10.5's claim that u_1 is étale fails, although the maps actually used are étale.
- **Paper.** Feng–Yun–Zhang, *Higher Siegel–Weil formula for unitary groups: the non-singular terms*, Invent. Math. 235 (2024) 569–668.
- **Extraction.** cc-fb70e5, issue #1230.
- **Reviewer.** Claude Code, session cc-442dc5, which took no part in the extraction.

## Sources read

- **arXiv v4.** Read whole; its SHA-256 matches the extraction's.
- **The published article.** It is open access (CC BY) at Springer, but Springer's bot protection blocked every download here, and the eScholarship copy is the author version. So statement, section and equation numbers were checked against arXiv v4, which the extraction reports has the same numbered statements. The extraction's journal-page numbers could not be re-checked.
- **Errata.** Crossref records no correction.
- **Method.** Three read-only helper agents of this session split the paper:
  - §§1–5;
  - §§6–9;
  - §§10–12.

  They checked by computer:
  - brute-force local densities (split n = 2, inert n = 1) against Theorem 2.3 and the functional equation;
  - W_d character identities for d ≤ 6 (Lemma 12.4, (11.5) and the graded identity);
  - the §§6–10 dimension counts.

  The reviewer checked every finding at the page image or in the text, and re-derived the Lemma 10.5 counterexample and the Frobenius action in Lemma 6.7.

## 1. Items

**Errors in the extraction:**
- **Item 15** had the modification convention reversed. Definitions 6.3(3) and 6.6(3) have F_{i−1} ⇢ F_i lower of length 1 at x′_i and upper at σ(x′_i), and later proofs use the same convention.
- **Item 14** wrote the standard bundle as ν_*ω^{1/2}_{X′}, which is a rank-two bundle on X. The intended bundle is ν^*ω_X^{1/2}; the paper itself prints ν^*ω^{1/2}_{X′} (E15). The item now records the ω_{X′}-dual convention and dim Bun_{U(n)} = n²(g − 1).
- **Item 17** gave the fibre bound of Proposition 9.1(2) as a bound on each stratum. The bounds are now placed correctly, with n ≥ 2 and Claim 9.2.
- **Item 23** repeated Lemma 10.5 as printed. It is now stated for w_1 and h_1 only (E22).

**Other corrections:**
- **Item 5.** The corrected weight of Remark 2.4 (E4), the unramified-or-split hypothesis, and a note that the paper proves the functional equation only in the inert case. The split case was checked numerically.
- **Item 8.** k̄-points.
- **Item 12.** The global Den(T, Q).
- **Item 16.** Lemma 7.8 is stated, and the codimension is at least r.
- **Item 18.** The ° classes.
- **Item 19.** Hk^r_M is not a Frobenius fibre product, and (8.3) involves Sht^r_M.
- **Item 22.** The logic of [Z^r_E(a)]; "geometrically connected".
- **Item 24.** Proposition 10.9 needs a representable map; Lemma 10.10 holds on Z^♡; §10.5 covers the geometrically disconnected cases.
- **Item 25.** The Lagrangian shtuka classes.
- **Item 26.** The definition of ρ_i.
- **Item 29.** sgn̄_j.
- **Item 31.** [YZ17, Prop. A.12].
- **Item 33.** χ = 1.
- **Notes.** Items 1, 4 and 6.
- **Locators.** Items 13, 15, 16, 17 and 27 (statement and section numbers).

**New item 34 (missing, routed to the Part II).** The U(n)-specific Lemmas 6.7 and 6.9: Sht^r_{U(n)} is empty iff r is odd, and Hk^1_{U(n)} is a P^{n−1}-bundle. They are the dimension input for §§7–8, and GS.2 plans only general smoothness.

## 2. Statuses

Unchanged. Every planned stage id exists in data/atlas.json:
- GS.0, GS.1 and GS.2 for Bun_{U(n)} and the Hecke and shtuka stacks;
- EDC.5 and EDC.7 for perverse sheaves;
- EDC.8 and R34.1 for correspondences and traces;
- SF.5 for Chow groups.

## 3. Routes

Every missing item is routed exactly once (25 + 2 + 2 = 29). All three routes are accepted. The Part II keeps the id, parent, title and area shared with PAPER-YUN-ZHANG-17 and PAPER-YUN-ZHANG-19.

## 4. Mistakes in the paper

**E1–E3 are confirmed.**

**E22 (error, affects a stated result): Lemma 10.5.**
- **What is printed.** The lemma says w_1, u_1 and h_1 are étale. Its proof embeds A_{d,e} into A_d ×_{X_d} (X′_{d−e} × X_e)^♡, but a very good framing does not force Div(s) into the ♡ locus.
- **Counterexample for u_1.** Take n = 2 and a split point x with both x′ and σx′ in Div(s). Then (⊕L_i)^∨/⊕L_i is k² at each of x′ and σx′. Every line ℓ at x′, paired with ℓ^⊥ at σx′, gives a self-dual E with the same (L_i, a′), Div(s) and D_a. So the fibre of u_1 contains a curve.
- **The proof's isomorphism also fails.** M_{d,e} ≅ M_d ×_{A_d} A_{d,e} is false even for n = 1.
- **The corrected argument.** w_1 and h_1 are étale because M_{d,e} is an open substack of M_d ×_{X_d} (X_{d−e} × X_e)^{disj}, and addition of disjoint divisors is étale.
- **Why the theorems stand.** Lemma 10.7 and Theorems 10.1, 10.2 and 1.1 use only w_1 and h_1.

**Proof gaps:**
- **E13.** The proof of Lemma 6.7 says the Lang map lands in the identity component when X′ is geometrically disconnected. For X_{k′}, Frobenius swaps the components, so it lands in the components indexed by 2Z. The parity conclusion stands.
- **E19.** Lemma 7.6 reduces to an algebraically closed field, but that step fails for imperfect κ (counterexample over F_q(t)). A direct F_q-independence argument proves the lemma for every κ.
- **E18.** The k^×-torsor claim in the proof of Proposition 7.5: the fibres are {±1}.

**False sentences that are not used:**
- E8: Remark 4.8's d′.
- E9: (X′_{2d})^σ ≅ X_d needs ν étale.
- E11: the middle map of (4.1).
- E20: the "local complete intersections" claim at the start of §9, which Remark 7.10 disclaims.
- E21: Proposition 9.5(1) says "partition" for a cover.
- E27: a display in the proof of Lemma 12.4 (it gives 3 instead of 1 at g = 1 ∈ W_1). The lemma is verified for d ≤ 6.

**Misprints:**
- E4: Remark 2.4's weight m(t′(Q′)) should be m(t′(Q′^⊥/Q′)); read literally it gives Den = 1 instead of 1 − T.
- E5: Isom to L′_k.
- E6: split-dual notation.
- E7: (2.1) for α ∈ M_n(F).
- E10: the discriminant multiplicity.
- E12: §§2–5 slips.
- E14: the sign in Lemma 6.7's square.
- E15: F_1.
- E16, E17: §§6–9 slips.
- E23: the rank in Lemma 10.4.
- E24: S^{r+1}.
- E25: §11 slips.
- E26: sgn̄_j.
- E28: §10 slips.

**None affects Theorem 1.1.**

**Where corrections were sought.** Crossref, the arXiv versions and Unpaywall. None was found, so all are recorded as new.

## 5. Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-FENG-YUN-ZHANG-24.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four changed files: ok.
- Every missing item is routed exactly once (29).
- The paper's files did not contain the reviewer's session id before the review.
