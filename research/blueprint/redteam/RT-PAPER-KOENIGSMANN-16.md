# RT-PAPER-KOENIGSMANN-16: red team of the Koenigsmann extraction

Red team: Claude Code, session `cc-f805bf`, 29 September 2026. Target: `PAPER-KOENIGSMANN-16`, the extraction of J. Koenigsmann, *Defining Z in Q*, Ann. of Math. **183** (2016) 73–93. The extraction is by `cc-39fac3`, and it was accepted by `REV-PAPER-KOENIGSMANN-16` (`cc-fb70e5`). I did neither job.

**Result: nine findings, four medium and five low.** The core of the extraction holds up:

- **Items.** All 42 statements match the paper.
- **Library.** Every library citation gives its item at the pin.
- **Source issues.** All seven recorded mistakes are right.
- **Routing.** Every missing item is routed exactly once, and the route owner is right.

The medium findings are about what the route into LD.4 leaves unconnected or unowned. The low findings are citations and two unrecorded misprints.

## Source

I re-fetched both texts the extraction read, on 29 September 2026:

| Version | URL | SHA-256 |
|---|---|---|
| Published | annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf | `f26c2e15…d3c93` |
| Preprint | arxiv.org/pdf/1011.3424v2 | `6f10efdd…58c541` |

Both hashes match the recorded values. I read all 21 published pages. I checked page images of p. 78 (the dyadic table), p. 90 (the proof of Proposition 21(e)) and p. 91 (the proof of Corollary 22). I collated arXiv v2 at every new locator.

## What held

**Statements.** Every numbered statement from Observation 0 to Remark 24 has a correct item. Question 25 is rightly left out. The review's corrections are right:

- item 26 carries the hypothesis Δ ≠ ∅ (E5);
- item 36 has the corrected identity (E6).

**Arguments.** I rechecked the arguments by hand. Some cases the extraction never states also come out right:

- Proposition 10(b) holds for negative p;
- Proposition 10(c)'s first statement needs no congruence condition;
- Lemma 14's hypothesis 2 ∉ Δ holds in Proposition 16(b), because (−2p, q)₂ = 1;
- Proposition 21(c)'s final characterization is sound;
- Corollary 22 covers every p ∈ Q^×.

**Computations.** In exact arithmetic I recomputed:

- the sets U_p for p ≤ 11;
- all 16 rows of the p = 2 table. Only (6, 15) fails, which is E1. Row (15, 15) has x₄ = 2/15, read off the page image; the text layer loses the numerator;
- Proposition 10(b)'s intersections Δ ∩ Δ′ for every integer 0 < |p| ≤ 300. There were no failures.

**Library.** I opened every cited declaration at Mathlib 082e2d3 and Tau Ceti f790474. Each exists and says what the item needs. In particular:

- Dirichlet is `Nat.forall_exists_prime_gt_and_eq_mod` (PrimesInAP.lean:442);
- weak approximation is `TauCeti.GlobalNumberFields.weakApproximation_denseRange` (Weak.lean:202).

**Planned stages.** I read each cited stage in full. Items 7, 9 and 10 are planned where they are cited, and items 2 and 39 fit LD.4 and LD.0. The one exception is finding 5.

**Routing.** The review moved items 40 and 41 to LD.4, which avoids a cycle through LD.0. That move is correct.

## Findings

**1. LD.4 has no link to the layers route 1 depends on (medium, error).** Route 1 sends 30 items to LD.4 and says their inputs are "already planned or built" in:

- QuadraticFormInvariants layer 2 and 6C;
- GlobalQuadraticForms layers 4 and 6;
- Tau Ceti's weak approximation.

But LD.4's inputs are only LD.0 and CA.4. The roadmap's prerequisites do not include either quadratic-form roadmap. The GlobalQuadraticForms link map records `"result":"none"` for this roadmap.

*Fix:* name the imported stages in the route, and ask the maintainer for the four stage links into LD.4.

**2. No item for model completeness (medium, missing).** Remark 24 turns on model completeness and existential closedness. It also uses the fact that in a model-complete theory every definable set is existential: that is how "not every definable set is diophantine" becomes "Th(Q) is not model complete". Nothing plans these notions. LD.0 lists languages, definable sets, ultraproducts and Łoś, and Mathlib has neither notion.

*Fix:* add an item, routed to LD.0 next to item 39.

**3. No item for the theorem behind Proposition 23(c) (medium, missing).** Proposition 23(c) rests entirely on Colliot-Thélène–Van Geel: non-n-th powers are diophantine in number fields. The paper appears under `prerequisites`, but the theorem is not an item. That leaves LD.4 with an unowned deep input.

*Fix:* add it as an item, routed with item 40.

**4. Diophantine sets planned for Q only (medium, duplicate).** Item 42 plans the closure properties of diophantine sets for Q only. PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26 plans the same notion for arbitrary commutative rings (its items /1, /3, /46 and /47), in a proposed Part II that "starts after LD.4". Its route is currently rejected pending revision. Section 15 asks for one owner, in the most general form.

*Fix:* state item 42 for arbitrary rings, with the Q-specific clauses separate, so that LD.4 owns the notion once and the Part II imports it.

**5. The archimedean Hilbert symbol is cited to the wrong layer (low, error).** Item 8's p = ∞ clause is cited to QFI 6C and CA.1. But 6C is nonarchimedean only. GlobalQuadraticForms 4.4 plans "the archimedean symbol", and says it does so because 6C cannot.

*Fix:* add GQF layer 4 to item 8.

**6. Tau Ceti's quaternion norm form is not cited (low, library-claim).** Tau Ceti already has the reduced norm on `ℍ[R,a,b]` and its diagonalization ⟨1, −a, −b, ab⟩: `QuaternionAlgebra.normForm` (NormForm.lean:72) and `equivalent_normForm_weightedSumSquares` (:171). S_{a,b} is defined by exactly this norm-one equation, and the audit records QFI layer 2 as partly built. Neither item 6 nor item 16 cites these declarations. The review says nothing quaternion-related exists.

**7. No item for the local square criterion (low, missing).** Several steps use it: 1 + 8Z₂ ⊆ (Q₂^×)² on p. 78, and the step x ∈ 2(Q^×)²(1 + lZ_l) ⇒ x ∈ 2(Q_l^×)² on p. 88. Mathlib's `hensels_lemma` supplies it, and QFI 6A plans the general form.

**8. Two unrecorded misprints (low, missing).** Both are also in arXiv v2, and both affect nothing.

- p. 90: "Then R_p^{[k]} = Z_l" should read Z_(l).
- p. 91: "p ∈ k + Z_(2)" should read "p ∈ k + 8Z_(2)". That is the predicate of the Proposition 21(c) the sentence cites, and the sentence's own assumption reads k + 8Z_(2).

**9. No item for the §1 transfer (low, missing).** The paper states: "If one had an existential … definition of Z in Q, then Th∃(Z) would be interpretable in Th∃(Q), and the answer would … again be no". This is the ∃-level interpretation theorem that LD.4's acceptance criterion asks for, and no item carries it.

## What was not done

- I did not reread Poonen's paper, so the "9244" degree claim rests on the review.
- I did not open [CTVG14], [PD11] or Park.
- No Lean was written or run.

The JSON's `checked` list records every check in detail.
