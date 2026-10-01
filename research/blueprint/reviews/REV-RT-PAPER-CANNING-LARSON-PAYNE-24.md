# REV-RT-PAPER-CANNING-LARSON-PAYNE-24

Independent verification of the red team RT-PAPER-CANNING-LARSON-PAYNE-24 (Codex, session `codex-rtOQ9t`, PR #5404) on the
extraction PAPER-CANNING-LARSON-PAYNE-24 (Canning–Larson–Payne, *Extensions of tautological rings and motivic structures in
the cohomology of M̄_{g,n}*, Forum Math. Pi 12 (2024)), for issue #4217.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-7b31c4`, PR #1930);
- its review REV-PAPER-CANNING-LARSON-PAYNE-24 (`cc-fb70e5`, PR #3313);
- the red team.

None of the findings cites work of mine.

**Result: all five findings confirmed.** /1–/3 are high, /4 and /5 medium. In /4 I correct two of the red team's own
bindings.

## What I read

- **The paper.** arXiv:2307.08830v3 (<https://arxiv.org/pdf/2307.08830v3>), the version the extraction read. I read:
  - §4, Lemma 4.3 and its proof (pp. 12–13);
  - §5.3, (5.10)–(5.13) and Lemma 5.13 (pp. 21–23);
  - the end of the proof of Lemma 7.3 (p. 29);
  - the reference list.
- **The extraction.** Items /2, /13, /60 and /75; route 1's brief; prerequisites 4, 7, 9, 10, 15 and 16.
- **The bindings.** The arXiv API for the cited identifiers, and Crossref for the article number and the Mukai DOIs.

## /1 (high): the half-spin bundle on BSO_10. Confirmed.

**What the paper says.** It describes the spinor representation of SO_10 as a rank-16 bundle on BSO_10, and it writes
M°_7 ≅ [(Gr(7,S+)∖∆)/SO_10]. Item /60 copies both.

**Why both are wrong.**
- **No such bundle.** Spin_10 acts faithfully on S+ through its centre μ_4, so −1 ∈ ker(Spin → SO) acts by −Id. Hence S+
  does not descend to SO_10.
- **The quotient is a gerbe.** −I_10 lifts to a central element acting by a scalar, so it acts trivially on PS+ and on
  Gr(7,S+). The SO_10 quotient is therefore a μ_2-gerbe over the PSO_10 quotient, not M°_7.

**What survives.** The paper's results are rational, and they survive. A*(BSpin_10)_Q ≅ A*(BSO_10)_Q, and finite gerbes
are invisible to rational Chow groups and cohomology. The corrected presentation still has to be written down and
compared.

## /2 (high): the grading of the cycle class map. Confirmed.

The paper's Chow groups are graded by dimension: the diagonal lies in A_d(X × X). Lemma 4.3 is ungraded. Item /13's
A_i → H^{2i} would send a point of P² to H^0, so it is false and incompatible with pushforward.

## /3 (high): the open moduli stack is not proper. Confirmed.

Route 1's brief asks for M_{g,n} as a smooth proper stack. But M_{0,4} ≅ P¹ ∖ {0,1,∞} is not proper, and the paper's §4
exists precisely for the non-proper M_{g,n}.

## /4 (medium): the prerequisite bindings. Confirmed, with two corrections.

**Confirmed.**
- **Unrelated arXiv identifiers.** 1310.3859, 1408.4509 and 2110.11061 resolve to papers on SPH simulation, GRB jets and
  polyadic sets.
- **Article number.** Crossref gives e23, not e22.
- **Mukai DOI.** The DOI 10.2307/2374777 does not resolve; Mukai I is 10.2307/2375032.

**Corrections to the red team's bindings.**
- **Petersen–Tavakol–Yin.** It is CLP [29], not [30].
- **CLP [30].** It is Petersen–Tommasi (Invent. Math. 196, 2014), cited on pp. 3 and 8. Prerequisite 9 conflates the two,
  so both should be listed.

## /5 (medium): the induction subgroup in Lemma 7.3. Confirmed.

**The dimension mismatch.** Ind_{S10}^{S12}(sgn) has dimension 132, while the printed summands V_{2,1^10} and V_{3,1^9}
have dimensions 11 + 55 = 66.

**The correct induction.** The pairs {i,j} are unordered, so the right induction is from S_10 × S_2, of dimension 66. By
Pieri it gives exactly those two summands. The 836-dimensional conclusion stands.
