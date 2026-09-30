# REV-RT-PAPER-BETTS-STIX-25

**Complete: all fourteen findings confirmed.** Several fixes are corrected below. One secondary point of /14 is rejected.

- **Job:** Refs #4325.
- **Verifier:** Claude Code, session `cc-48533a`, 30 September 2026.
- **Independence:** the extraction (`cc-442dc5`), its review (`cc-7b31c4`) and the red team (`cc-f805bf`) were done by other sessions.
- **Verdicts:** in `research/blueprint/redteam/RT-PAPER-BETTS-STIX-25.review.json`. `python3 scripts/check_redteam.py` reports it `ok`.

## Evidence and scope

- **Paper.** The text read is arXiv:2204.13674v1, the only arXiv version and the file the extraction read (SHA-256 reproduced), with its LaTeX source and page images. The published Ann. of Math. 201 (2025) text is not openly readable. For finding 4, Shimizu's arXiv:2003.10951v2 source was read.
- **Division of work.** Three verifiers worked in parallel: findings 2, 3, 5 and 6; findings 1, 4 and 11–14; and findings 7–10.
- **What was checked:**
  - the queue and `make_queue.py`;
  - the cited stage descriptions;
  - the libraries at the pinned commits;
  - the arithmetic, redone with the verifiers' own code (sympy was not available).

## /1: confirmed (medium). The paper is queued for design twice

`make_queue.py` drops a generated design job only when its id matches a maintainer-fixed job's id. Both DESIGN-BETTS-STIX (#952, order 7) and the generated DESIGN-AnabelianGeometryAndNonabelianChabautyPartII (#3475, order 145) therefore survive. Both are pending and available, and neither waits for the other; #952 never mentions the extraction. The Part III check looks only for the literal id `<base>PartII`, so the problem does not resolve itself.

**Errors in the finding:**
- It says the LV source routes import from GaloisSectionsPadicPeriodMaps by id. Nothing supports that.
- It asks route 1 to name DESIGN-BETTS-STIX, which it already does.

**Right fix:**
- Fold any route whose roadmap belongs to a fixed design job into that job, with a pointer to the extraction, instead of dropping the route.
- Make the Part III check recognise a recorded parent, and retire #3475.

**The bug is wider than this paper.** Three other fixed design jobs have generated twins:
- DESIGN-BCGP18 and DESIGN-BCGP25 (orders 142 and 143, same roadmap and outputs);
- DESIGN-SKINNER, twinned with DESIGN-RankZeroOneBSDPartII (order 9);
- DESIGN-PAN, twinned with DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII (order 129).

The dedupe fix should check each route's roadmap against all fixed jobs. This is for the maintainer.

## /2: confirmed (high). Item /24 is false with Q̄_p-values

The paper states Proposition 2.19 for characters G_K → Q_p^× (TeX and the p. 13 image). Item /24 states it for Q̄_p^×, and that version is false. Each step of the counterexample was checked:
- p ≡ 3 mod 4 is inert in Q(i), so v = (p) is self-conjugate under Definition 2.17 and Remark 2.18(2).
- y² = x³ − x has good reduction away from 2, and its CM by Z[i] is defined over K.
- The associated character is pure of odd weight. At v it is a Lubin–Tate character with Hodge–Tate weights 1 and 0 at the two embeddings, so "n even, r_v = n/2" fails.

With Q_p-values the algebraic part is Galois-invariant, which gives r_v + r_{v′} = n, so the paper's version holds. The Q̄_p-version holds when K has no CM subfield, so the error matters exactly in the CM case that Theorem 6.5 covers. (In the paper's conventions V_pE has weight −1; either way n is odd.)

**Fix:** restore Q_p^× in /24, and name the Q_p^×-valued character explicitly in /25, which inherits the error.

## /3: confirmed (medium). Σ_A must be Q_p-points

The paper defines Σ_A as Hom_{Q_p-alg}(A, Q_p). Items /77 and /78 silently switch to Q̄_p-points.

**E1's second repair is false.** A = Q_{p²} with trivial action over K = Q is an S-good pair with Σ_A empty, so condition (c) as printed asks 0 ≥ 1. The repair "A reduced, hence étale" does not help, and the right hypothesis is "A split". The #Σ_A repair and E1's own ε³ counterexample are right.

**Fix, with one change:** leave Definition 6.8(c) in /79 as printed. It is a definition and is applied only to H⁰, which is split, so there dim A = #Σ_A. Change /78's note from "every use has A étale" to "every use has A split".

## /4: confirmed (medium). A citation in the fix is wrong

No item states the fact the proof of Theorem 3.22 rests on (a full horizontal basis implies potentially horizontal semistable), and none states Shimizu's Proposition 4.9. No atlas stage plans a relative p-adic monodromy theorem.

The citation is wrong, though. In Shimizu's arXiv:2003.10951v2, the version the paper cites, Lemma 8.9 only translates between local systems and representations; the theorem is Theorem 7.4. Theorem 9.7 is not used in Theorem 3.22's proof at all. It appears only in §3.1, where item /27 already cites it.

**Fix:** cite "Theorem 7.4, via Lemma 8.9". The pending DESIGN-PadicHodgeTheoryPartII is a third possible owner.

## /5: confirmed, with corrected reasoning (medium)

**The counterexample holds** under the reading "F^pA^n = A^n for p ≪ 0". It still holds when the filtration is also exhaustive and separated; the verifier built a second example.

**The finding overstates.** Under the other reading, "F^pA^n = 0 for p ≫ 0 in each degree", the lemma is true and its printed proof is valid. So the lemma is ambiguous, not false in the reading its proof uses.

**The real gap is on p. 22,** in the proof of Theorem 3.12(2). There it is never justified that OB_dR ⊗ Rπ_dR*E has filtered cohomology. Either Lemma A.2 is applied to a filtration bounded in neither direction and not complete, or it is applied to Rπ_dR*E and the step to the tensor product is left silent.

**Fix:**
- Restate /99 with "F^pA^n = 0 for p ≫ 0 in each degree", or with a finite filtration.
- The repair must cite flatness of every quotient Fil^a/Fil^b of OB_dR over O_U, not just of OB_dR.
- The E₁-degeneration step needs a citation, not a new argument: the proof already points to [Sch13, Theorem 8.8].

## /6: confirmed (low)

The period map pulls the filtration back along T, so the filtration is spanned by columns of T⁻¹. For T = [[1,0],[t,1]] the point is (1 : −t), not (1 : t). T⁻¹ has coefficients in the same rings, so nothing downstream changes.

The P^N_{K_v} → P^N_ℂ misprint in the proof of Lemma 5.6 is also real. The fix should record it too.

## /7: confirmed (low)

For r₀ = 101, the least positive q in the required residue class is q = 3458351945918277637129653220997634107. It is provably prime, not just a probable prime: q − 1 = 2 · 2423 · 2749 · 142475239163 · 1822097631939243653, each factor is proven prime, and base 2 passes Pocklington's test for every factor.

Since 2749 ≡ 1 mod 12, both Q(√2749) and the cubic subfield of Q(ζ₂₇₄₉) lie in Q(ζ_{q−1}). Both are Galois, totally real and satisfy the Remark's hypotheses, so the claimed linear disjointness fails, and in the cubic case with odd degree.

**Fix, with one change:** "nontrivial whenever such a prime ramifies in K′" should read "only if". Ramification is necessary for a nontrivial intersection, not sufficient.

## /8: confirmed, with two changes (low)

All seven unrecorded mistakes are real.

**(1) Remark 5.11.** Its compactness argument needs Y proper. The Legendre-family counterexample is valid, since a closed disc is bounded and so contains only finitely many points p^{−n}.
- Record it as an **error**, not a gap, because the claim is false as stated.
- In /70, add "Y proper" only to the Remark 5.11 part. Corollary 5.10 is correct for any smooth curve.

**(2) Lemma 4.7.** It needs π proper for the base-change identification. The finding's example fails only in degree 1; (A² ∖ 0) × G_m → A¹ gives a failure in degree 2. The lemma's content survives if "identify" is read as the base-change map, so this one is a gap that affects nothing.

**(3)–(7) Genuine misprints.** None affects anything, since §6 fixes Y as a smooth projective curve with proper families.
- The Poincaré bundle should live on X ×_{Y′} X^∨.
- The index in (4.3) is wrong.
- p. 29 has "Theorem 3.3" where Theorem 3.22 is meant.
- The proof of Lemma 6.17 has "for all i" where "for all j" is meant.
- Remark 6.23(I) has "prime factors of q" where q − 1 is meant.

## /9: confirmed (low)

- "q − 1 prime to 4" can never hold for an odd prime q. The paper says "not divisible by 4".
- At q = 11, condition (3) fails with n_v = 7 (0.0570 against 1/26 ≈ 0.0385) and holds with n_v = 2 (0.0163).
- Without the good-reduction qualifier, the least q for (1)–(3) would be 23, the same as for Lawrence–Venkatesh's conditions. The dropped qualifier is what makes the comparison in (III) work.

## /10: confirmed (low)

Each of these items drops hypotheses the paper states:
- /32: smooth proper π, and a closed polydisc with a full horizontal basis.
- /44 and /45: smooth proper throughout, and geometrically connected of dimension n in (5)–(6). For /44 the omission is only presentational.
- /68: Y smooth and geometrically connected.
- /79: constant relative dimension d > 0 and a suitable S.

## /11: confirmed (low)

The extraction's library check missed Mathlib's `BDeRhamPlus`, `BDeRham`, `WittVector.fontaineTheta` and `Matrix.symplecticGroup`, and Tau Ceti's `TauCeti.Symplectic.groupScheme`. Neither library has a Galois action or filtration on these rings, or GSp.

For /33 the note should say "sections over affinoid perfectoids", not "stalks".

## /12: confirmed (low)

DWP.4 plans Weil I only for smooth projective varieties, and LV.1 covers only H¹ of abelian varieties. Every use in the paper is projective.

**Fix:** keep the paper's statement, add DWP.7 to the planned layers, and record a low source issue about the Weil I citation, rather than narrowing the statement.

## /13: confirmed (low)

LV.3 plans only unramified residue disks of a good model. Definition 3.1 is fully general, so /28 becomes missing, and the totals become 1 library, 18 planned and 81 missing.

Item /63 may have the same problem. That was not assessed here.

## /14: confirmed for the footnote; secondary point rejected (low)

Footnote 1 says the K-centred analysis falls short of the paper's finiteness statement (2°), not of Lawrence–Venkatesh's proof of Mordell. Route 4's reason should be reworded for this.

The secondary point, that "without a model" misdescribes §5, is rejected: §5 does work on model-free rigid neighbourhoods at any place. So reword only the footnote sentence.

## For the fix job

Findings 1–5 are high or medium and become FIX-RT-PAPER-BETTS-STIX-25. Apply them with the corrections above:
- /1: fold the route into the fixed job, fix the Part III check, and pass the generator bug and its three other cases to the maintainer;
- /3: keep Definition 6.8(c) as printed, and use "A split" as the hypothesis;
- /4: cite Shimizu's Theorem 7.4;
- /5: restate /99 and add the p. 22 gap.
