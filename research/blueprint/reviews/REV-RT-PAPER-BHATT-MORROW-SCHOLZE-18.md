# REV-RT-PAPER-BHATT-MORROW-SCHOLZE-18

**Complete: all fifteen findings confirmed.** Several of the fixes are wrong or incomplete; the corrected versions are given below.

- **Job:** Refs #4309.
- **Verifier:** Claude Code, session `cc-48533a`, 30 September 2026.
- **Independence:** the extraction, its review and the red team (RT-PAPER-BHATT-MORROW-SCHOLZE-18, session `cc-f805bf`) were done by other sessions.
- **Verdicts:** in `research/blueprint/redteam/RT-PAPER-BHATT-MORROW-SCHOLZE-18.review.json`. `python3 scripts/check_redteam.py` reports it `ok`.

## Evidence and scope

**Sources read:**
- the published Publ. Math. IHÉS 128 (2018), 219–397 (open access, SHA-256 a924d36c…02bb);
- arXiv v3 (SHA-256 285f7d20…072a) and its LaTeX source.

Both hashes match the extraction's record. Every claimed mistake in the paper is in both texts.

**How the work was split.** Three verifiers worked in parallel:
- routing and ordering: findings 1–5 and 13;
- the mathematics: findings 7–10;
- missing items, statements, library claims and locators: findings 6, 11, 12, 14 and 15.

**How ordering claims were checked.** By reachability over the atlas stage edges, together with the links of every accepted restructuring and link map.

## Routing and ordering

**/1 (§4.2 algebra, RS-01): confirmed, but the proposed fix must not be applied.**

Two things are wrong with the current routing:
- Lemma 4.9 and Proposition 4.13 sit at AI.2, but they depend on the coherence of W_n(O♭), which is routed to AI.3. AI.3 is not upstream of AI.2.
- The statements are also planned a third time in the CohomologyComparisons packet.

The finding misreads RS-01. RS-01 moves only the lemmas "already tagged AI.5 supplier material in the partial CP decomposition", and the finding drops that qualifier. The accepted decomposition tags Proposition 4.13, with Lemmas 4.6–4.8, 4.10 and Corollary 4.12, as AI.2's. Moving them to AI.5 would create a cycle: AI.2's own Lemma 4.26 uses Proposition 4.13 (published p. 278), and AI.5 requires AI.2.

**Right fix:**
- Move items 051–056 to AI.0 and keep items 062–068 at AI.2.
- The CohomologyComparisons nodes become aliases of the AI.0 and AI.2 nodes.
- Lemma 4.9 is the only item RS-01 really gives to AI.5. AI.2 needs it, so its owner must be AI.2 or AI.0. This is a maintainer decision.

**/2 (the Proposition 13.21 cycle): confirmed, with a refined owner.**
The accepted CohomologyComparisons decomposition already flags this cycle. The Frobenius-isogeny part of the proof lives in the substage CR.3:Frobenius-isogeny (which requires CR.3 and CR.4), not in early CR.3. So the owner should be that substage, with a link CR.3:Frobenius-isogeny → AI.5; this link was checked to be acyclic.

The finding's alternative, giving the proposition to AI.5, needs the same link, because AI.5 has no CR.3 upstream.

**/3 (Theorem 5.7, the primitive comparison): confirmed, with two additions.**
- Item 085 (Scholze's finiteness theorem, routed by route 14 to P8) has the same cycle. Theorem 14.3 uses it through the hypothesis of Corollary 4.20, so it must move to the same upstream stage.
- P8:local-rational fits by order, but its text says to "construct only" local period-sheaf results. It needs widening, or a new early substage (maintainer note).

PAPER-ZAVYALOV-25 route 7 also sends the primitive comparison to P8 and should follow the same decision.

**/4 (the Witt-vector results at CR.4): confirmed, but the fix's premise is false.**
- AI.0 is not upstream of CR.4: AI.1 requires only DD.1 and E1.
- CR.4's own items also use these results (Lemma 10.8, Lemma 10.9(ii), Proposition 10.14). Moving them to AI.0 alone would just move the error to CR.4.

**Right fix:** move them to AI.0 and add a link AI.0 → CR.4, which is acyclic. The finding's alternative, a link CR.4 → AI.3, is valid but a worse choice, because it makes AI.3's AΩ construction wait on crystalline cohomology.

The Corollary 10.2 evidence is weaker than the finding says: it is cited only in a remark after Corollary 3.29, not in that corollary's proof.

**/5 (the §2 examples at AI.5): confirmed. CP.5 is the right owner.**
The alternative link CR.3 → AI.5 is not enough. Lemmas 2.5, 2.7 and 2.9 also need finite flat group schemes and their quotients, which are upstream of CP.5 but not of AI.5.
- Besides the Illusie and Bertini items, also add an item for Lang's lifting of singular Enriques surfaces to Z₂.
- AI.5's stage text uses these examples as tests, which is misordered (maintainer note).

**/13 (Lemma 6.1): confirmed (low).**
E1 plans K-flat replacements, and the AInfCohomology packet already asks E1 for the termwise-flat version, citing Lemma 6.1. If E1's text is judged not to cover flat terms, route the item to E1 by a source route instead of marking it planned.

## Mathematics

**/7 (the converse of Lemma 3.20): confirmed. Error; affects a stated result; new.**

Every step of the counterexample was checked:
- A is T-adically complete, so R = A[1/T] is a complete Tate ring.
- The Gauss valuations are multiplicative, so A is integrally closed in R, and R° = A.
- A is perfectoid by Lemma 3.10(ii).
- p is not topologically nilpotent in R: the map A → O_C taking the constant term kills TA and sends pⁿ to pⁿ ≠ 0.

Any ring that is perfectoid in Fontaine's sense has p topologically nilpotent, so R is not one. With that hypothesis added, the paper's proof goes through.

**Corrections to the fix:**
- "For example any Tate Q_p-algebra" is too loose. Q_p((T)), with Q_p[[T]] as ring of definition, is Tate but p is not topologically nilpotent in it. Require the map from Q_p to be continuous instead.
- The paragraph after the lemma is correct as printed and should not be "corrected".

**/8 (Lemma 11.11): confirmed. Three misprints, affecting nothing.**
- λ_r([T_i]) = U_i^{p^r}, not U_i. The group action sends U_i to [ζ_{p^r}]U_i, and [ζ_{p^r}] − 1 is a non-zero-divisor, so U_i is not invariant. The proof's identification and compatibility with R both give U_i^{p^r}.
- The domain should be W_r(O[T^{±1}]).
- The divisor in the proof of Lemma 11.9 should be ([ζ_{p^u}]−1)/([ζ_{p^r}]−1). It is printed wrongly three times; the r = 2, a = p example checks out.

§9 may have a similar U_i versus [T_i] normalization clash. This was not checked.

**/9 (three false proof steps): confirmed.**
- **Lemma 6.9:** the counterexample 𝓘 = (p), C = Z works. The correct statement is (η_𝓘C)^{n−1} = 𝓘^n C^{n−1} + 𝓘^{n−1} Z^{n−1}. Affects the proof.
- **Lemma 4.8:** the three listed cases miss {|x| ≤ p^{−√2}} over C^♭. The lemma survives, because a non-principal D satisfies 𝔪^♭D = D. The proposed rewording of E2's reason is right. Affects the proof.
- **Theorem 14.5:** the counterexample Q = W(k)[1/p]/W(k) works. It affects nothing, because the only Q it is applied to is finitely generated.

**/10 (misprints): confirmed, with corrections.**
- Lemma 12.8(iv) has four occurrences of ξ_r, not three. Lη_μ(C/ξ_r) is not "undefined": it is zero, since μ ∈ (ξ_r).
- The Lemma 2.12 entry (the sequence as printed is not exact, and a stated bound changes) and the Proposition 4.3 entry (the printed set is wrong when k ≠ F_p) are errors affecting the proof, not misprints. Both proofs still go through.
- The rest check out, including folding "as in (1)" into E17 and changing E18's locator to pp. 390–391.

## Missing items, statements, library, locators

**/6 (almost purity): confirmed, with part of the fix corrected.**

The four almost-purity comparisons the paper relies on are not items. They appear at:
- pp. 306–307;
- display (2) on p. 230;
- the proof of Corollary 9.11;
- Lemma 9.12(i), as used in Proposition 9.14 and Lemma 12.8.

They are nevertheless planned:
- AI.3 says "prove the almost purity comparison" and requires P3.
- Through the accepted PAPER-SCHOLZE-13: Scholze's Proposition 3.5 is at AdicEtaleGeometry:A1, Proposition 3.7(iii) at ClassicalAdicEtaleCohomology:H0, and Lemma 4.10(v) and Corollary 6.6 at AI.3.

The finding says the ideal W_r(𝔪) is not idempotent. It is idempotent (Corollary 10.2); only W(𝔪^♭) ⊂ A_inf is not, as p. 327 warns.

**Right fix:**
- P0 owns almost algebra only over idempotent ideals (RS-05). Plan the vocabulary at P0 for 𝔪, 𝔪^♭, [𝔪^♭] and W_r(𝔪).
- For W(𝔪^♭), record "killed by" as a plain annihilation statement in the notes of items 091, 092 and 140.

**/11 (inexact statements and notes): confirmed (low).**
All ten sub-claims hold. For item 132 the right wording is "Theorem 8.7 locally, Theorem 8.3 globally". Footnote 8 is on p. 236, not p. 237.

**/12 (external theorems): confirmed, but four inputs are not missing.**
Accepted work already plans:
- Beauville–Laszlo (RelativeFarguesFontaine:RF4:vector-bundles node);
- the vanishing of the cotangent complex of a perfect F_p-algebra (PerfectoidSpaces:P1 node);
- Kiehl finiteness (AdicSpacesPartII:R3 stage text);
- Scholze 2012 Lemma 5.6 (PAPER-SCHOLZE-12/63 at P1). BMS only adapts it, so it belongs in item 048's note.

The owners for Berthelot (CR.2), Illusie's comparison and the Cartier isomorphism (CR.4), and Kisin (R07.4) check out.

Only two inputs are really missing: "coherent with integrable connection ⇒ locally free", and the Gauss–Manin connection. Route both with Theorem 13.19 at CP.3.

**/14 (library citations): confirmed (low).**
- Mathlib's `BDeRhamPlus` is exactly the paper's B_dR^+ (p. 224).
- `fontaineTheta` carries the two hypotheses, which S satisfies, so no status changes.
- Lemma 3.25(i) also needs `Module.finitePresentation_of_surjective`. Part (ii), coherence, stays missing.
- `Module.FinitePresentation.trans` is at line 323, not 322.

**/15 (page locators): confirmed and incomplete.**
All the listed corrections are right. The same off-by-one error recurs in:
- items 007 and 008 (Theorem 14.5(ii),(iii), p. 393);
- item 013 (Theorem 14.3(iv), p. 392);
- items 015–017 (Theorem 14.1(ii)–(iv), p. 389);
- item 021 (Theorem 13.3(ii), p. 370);
- item 018 (Theorem 1.7 spans pp. 224–225, and Theorem 13.1 spans pp. 368–369).

## For the maintainer

Three problems sit in the accepted atlas itself:
- RS-01's assignment of Lemma 4.9 to AI.5, although AI.2 needs it.
- CP.2's stage text, which claims Proposition 13.21 although AI.5 needs it.
- P8:local-rational's "construct only" restriction.

## For the fix job

The medium findings /1–/8 become FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-18. Apply them with the corrections above:
- /1: AI.0 and AI.2, not AI.5.
- /2: CR.3:Frobenius-isogeny, with a link to AI.5.
- /3: move item 085 as well.
- /4: AI.0, with a link AI.0 → CR.4.
- /5: CP.5, plus Lang's lifting.
- /6: P0 vocabulary for the idempotent ideals only.
- /7: require continuity of Q_p → R.
