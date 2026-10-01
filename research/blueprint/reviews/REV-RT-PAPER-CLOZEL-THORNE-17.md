# REV-RT-PAPER-CLOZEL-THORNE-17

Independent verification of the red team RT-PAPER-CLOZEL-THORNE-17 (Codex, session `codex-rtOQ9t`, PR #5472) on the
extraction PAPER-CLOZEL-THORNE-17 (Clozel–Thorne, *Level-raising and symmetric power functoriality, III*, Duke Math. J.
166 (2017), 325–402), for issue #4199.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-442dc5`, PR #2018);
- its review REV-PAPER-CLOZEL-THORNE-17 (`cc-38267a`, PR #2449);
- the red team.

/5 mentions PAPER-HE-21, whose red team this session verified (PR #5401). It is cited only for its existing brief, and
my verdict does not depend on it.

**Result: all five findings confirmed.**
- /1 and /2 are high.
- /3 is filed as high; I would grade it medium.
- /4 and /5 are medium.

## What I read

- **The paper.** The accepted manuscript dated 10 December 2015, from the Cambridge repository
  (<https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download>), 53 pages, SHA-256
  `fb88e83c…6094742`, equal to the extraction's record. I read:
  - §2.1 (pp. 6–7);
  - Remark 2.7 and Proposition 2.9 (pp. 17–18);
  - the deformation data and Lemma 5.3 (pp. 39–40);
  - Theorem 5.7 (p. 44);
  - Theorem 6.2 and its proof (pp. 45–46).
- **The extraction.** Items 006, 008, 013, 015, 040, 049, 064 and 065; sourceIssues E6, E21 and E22; routes 2, 4 and 6.
- **Other extractions.** PAPER-KISIN-PAPPAS-18 routes 10 and 11.
- **Tau Ceti** at f790474: the degree homomorphism `deg` and `deg_single` in
  `TauCeti/NumberTheory/HeckeRing/Degree.lean`.

## The findings

- **/1 (high): the integral Iwahori–Matsumoto presentation.** The paper presents H_B as a quotient of Z[B_W], the group
  algebra of the braid group. Item 006 fixes the sign of the quadratic relation (E6) but keeps the group algebra.
  - **Why it is false over Z.** In the group algebra T_s is invertible, so in the quotient q = T_s(T_s − (q − 1))
    becomes a unit. But the degree map sends [BsB] to q, which is not a unit of Z.
  - **What holds.** The presentation is right with the positive braid monoid, or after inverting q.
  - **The fix.** Record a new sourceIssue, separate from E6.
- **/2 (high): the integral duality.** The paper's duality on Y_K^B is K-valued (p. 18); item 065 claims a perfect
  pairing on Y^B_O.
  - **Why the item is ill-posed.** Item 015 defines Y^B_O only when q is a primitive root mod l. Proposition 2.9 assumes
    q ≡ −1 mod l, which is never a primitive root for l ∈ {5, 7}. So the lattice is not even defined where the item is
    used.
  - **The projector.** e_P = [P]/(q + 1) is not in H_{B,O} when q + 1 is not a unit.
- **/3 (I would grade it medium): E22's gap does not exist.** Hypothesis (3) of Theorem 6.2 makes q_{u₀} a primitive
  root mod l, so [F(ζ_l) : F] = l − 1, which is 4 or 6.
  - **Why the gap cannot occur.** The projective image's abelianisation has order at most 2, and the S-split choice of
    E₀ (p. 45) keeps E₀ linearly disjoint from L. So Theorem 5.7(4) holds.
  - **Why medium.** Item 049's statement is right, and the brief says "must add, or verify". The error is a wrong
    sourceIssue and its notes, not a false item.
- **/4 (medium): Lemma 5.3.** Item 040 still states the lemma for arbitrary R_v at R₀, although the confirmed E21
  restricts it to unipotent types. PROTOCOL §18 puts corrected statements in the item.
- **/5 (medium): the owner of the Iwahori presentation.** Route 6 says the parahoric-centers Part II owns the Iwahori
  Bernstein presentation. PAPER-KISIN-PAPPAS-18 routes 10–11, after the fix for its red-team finding 18 (PR #5262), put
  it at SR.1/SR.4 and make that Part II import it.
