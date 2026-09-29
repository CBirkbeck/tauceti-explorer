# REV-PAPER-KOENIGSMANN-16: review of the extraction of Koenigsmann, *Defining Z in Q*

**Verdict: accept.** Both routes are accepted. The review corrected route 2 by moving two items to route 1. All four recorded mistakes are confirmed, and three new ones are added and confirmed. One status is corrected from planned to library. One item is added.

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Claude Code, session `cc-39fac3`, issue #1174 (PR #3944). It had 41 items (5 library, 6 planned, 30 missing), 2 routes and 4 `sourceIssues`, with status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Ann. of Math. **183** (2016), 73–93, [doi:10.4007/annals.2016.183.1.2](https://doi.org/10.4007/annals.2016.183.1.2). I read the open publisher PDF, whose SHA-256 `f26c2e15…d3c93` matches the record, and arXiv [1011.3424v2](https://arxiv.org/abs/1011.3424) (`6f10efdd…58c541`, which also matches) at every locator below. For the degree comparison in Step 1, I also read Poonen's author copy of the published *Characterizing integers among rational numbers with a universal-existential formula* (math.mit.edu/~poonen/papers/ae.pdf) and arXiv math/0703907v1.

## 1. Items: complete, one added, one corrected

I read all 21 pages. Every numbered statement, from Observation 0 to Remark 24, appears in an item locator. Question 25 is an open question, and it is correctly left out. I compared the statements with the text, and with the page images at every finding and at the p = 2 table.

Then I checked the mathematics rather than only the transcription. The arguments of Propositions 6, 10, 16 and 18, Lemmas 13, 14, 17 and 20, and all five parts of Proposition 21 were checked by hand. Every case analysis that can be computed was also recomputed:

- **Observation 5.** Serre's dyadic formula gives exactly the 16 unordered square-class pairs with `(a,b)₂ = −1`, and they are the 16 printed pairs.
- **Proposition 6.** All 16 rows of the p = 2 table were computed in exact arithmetic. For p = 3, 5, 7, 11 the sets `U_p` are as printed, and `V_p + V_p = Z_p` holds modulo p². Fact (d), `U_p + U_p = F_p`, holds for every prime 13 ≤ p < 400.
- **Proposition 10(b).** `Δ_{−1,−p} ∩ Δ_{2,−p}`, `Δ_{−2,−p} ∩ Δ_{2,−p}` and `Δ_{−1,−p} ∩ Δ_{−2,p}` were computed for every integer 0 < |p| ≤ 300. They equal `P^{[k]}(p)` when p ≡ k mod 8, and add at most the prime 2 otherwise. There were no failures in 1,800 cases.
- **Proposition 16(a) and Lemma 20(b).** For all 199 pairs (p, q) ∈ Ψ with p < 400 and q < 200, the set `P(p,q)` is nonempty and avoids 2 and ∞. It lies in `P(p)` whenever q is a unit there.
- **Step 1's "degree 9244 to 8".** This looked wrong at first: Poonen's arXiv v1 formula has degree 4·2310 = 9240 in the existential variables. However, his published version multiplies by `(a + Σxᵢ²)(b + Σxᵢ²)`, which gives 2 + 2 + 9240 = 9244. Koenigsmann's polynomial has 2 + 2 + 4 = 8 in the same variables. The claim is right, and item 19's gloss (total degree 12 with a, b, t) is right too.

**Added: item 42.** Every "is diophantine" claim in the paper silently uses the closure properties of diophantine subsets of Q. These are conjunction (as a sum of squares), disjunction (as a product), `x ≠ 0` (x has an inverse) and `x ≥ 0` (four squares). Remark 24 also uses that diophantine sets are recursively enumerable. A blueprint needs these as a node, so they are now item 42, routed to LD.4.

**Corrected: item 26.** Lemma 13's "In particular" is false when Δ_{a,b} = ∅ (E5 below). The item states it with that hypothesis.

## 2. Statuses: one planned item is already built

I opened each library citation at the pinned commit, and each provides its item:

- `FirstOrder.Language.ring`, `Set.Definable`, `BoundedFormula.IsExistential` and `IsUniversal`;
- `legendreSym.quadratic_reciprocity`, `ZMod.exists_sq_eq_two_iff` (2 is a square iff p ≡ ±1 mod 8) and `ZMod.exists_sq_eq_neg_one_iff`;
- `Nat.forall_exists_prime_gt_and_eq_mod` (Dirichlet) and `Nat.sum_four_squares`;
- `Localization.AtPrime`, `Ideal.jacobson` and `padicValRat`;
- `QuaternionAlgebra`. Mathlib's algebra has i² = a + b·i, so the paper's H_{a,b} is `ℍ[ℚ,a,b] = QuaternionAlgebra ℚ a 0 b`, as the report says.

**Item 11 is library.** Tau Ceti f790474 has `TauCeti.GlobalNumberFields.weakApproximation_denseRange` (Global/Approximation/Weak.lean:202). It is Artin–Whaples weak approximation for a number field at finitely many finite and infinite places. GlobalQuadraticForms layer 4 was cited as planning it, and that layer in fact consumes this declaration. The item name also said "(and strong)", but no strong approximation argument occurs in the paper, so that is removed.

The planned items were checked against the full stage text:

- **Items 8 and 9** (Observation 5's explicit Hilbert symbols; Hilbert reciprocity) cited only ClassicalArithmeticCompletion CA.1, which merely says "record residue symbols at 2 and at infinite places". Tau Ceti's QuadraticFormInvariants 6C plans exactly these statements. Its item 9 is the odd-residue formula and Serre III Thm 1 at ℚ_p, item 10 is the formula over ℚ_2 and item 12 is the 8×8 dyadic table. Item 14 exports `hilbertSymbol_productFormula`, and GlobalQuadraticForms 4.4 proves the localized product formula. 6C is now cited first, and CA.1 is kept.
- **Item 10** used both halves of the local–global principle but cited only GlobalQuadraticForms layer 6, which covers representations (Fact (e)). The norm half used in Proposition 21(e) is layer 4.3, the quadratic Hasse norm adapter, so that stage is added.
- **Items 2 and 7** hold as cited. Item 2 now notes that Mathlib's `Dioph.pow_dioph` (from `Pell.matiyasevic`) supplies only the exponential step of MRDP, not "every r.e. set is diophantine".

For every missing item I searched both libraries (by declaration index and by file) for quaternion trace sets, definability in ℚ, Hilbert symbols, Hasse–Minkowski, global norms and preservation theorems. Nothing at the pins provides them. The one partial result is Mathlib's `IsExistential.realize_embedding`, which is the easy direction of item 39, and it is now noted there.

## 3. Routes: both accepted, the second corrected

**Route 1 → LD.4.** Accepted. LD.4 formalizes r.e. sets, Diophantine representations and MRDP. It says to "record other-field variants individually", and that each transfer from the integers needs its own interpretation theorem. Koenigsmann's universal definition of Z in Q, and the undecidability of Th_∀∃(Q) that follows from it, are exactly such a variant and transfer.

The paper-specific machinery has no other consumer, and a new roadmap for it is not justified. Its inputs all have owners: QuadraticFormInvariants, GlobalQuadraticForms, Tau Ceti's weak approximation, and MRDP in LD.4 itself.

**Route 2 → LD.0.** Accepted as corrected. As extracted, it carried items 39–41. Item 39, the preservation criterion ([Prestel–Delzell, Lemma 3.1.6]), is general model theory, and LD.0 owns it. Items 40 and 41 are different:

- Proposition 23(a) is Theorem 1's universal formula read in models, and (d) uses MRDP.
- Remark 24 uses recursively enumerable sets.

All of that is LD.4, and LD.4 requires LD.0. Routing items 40 and 41 to LD.0 would have made the foundational stage depend on the one built on it. I moved them to route 1 and rewrote both route reasons.

## 4. Mistakes in the paper: 4 of 4 confirmed, 3 added

The Annals article page, the Crossref record (no `update-to` or `updated-by`, and no updating works) and the arXiv listing (v2, 13 November 2013, is the last version) were checked on 29 September 2026. None records a correction.

- **E1**: confirmed. It is the p = 2 table on p. 78, row (6, 15). With x₂ = x₃ = 1 and x₄ = 0, the value is −21 ≡ 3 (mod 8), not −3; (1, 1, 1) gives 69 ≡ 5. I checked all 16 rows. The extraction said arXiv v2 has the row on its p. 5; it is on p. 7, and the searched entry is corrected.
- **E2**: confirmed. On p. 81 the definitions carry the subscripts (−2p, −p), (2p, −p), (−p, −p) and (2p, p), while the Δ-sets under the same intersection signs and Definition 7 use (−2, −p), (2, −p), (−1, −p) and (−2, p).
- **E3**: confirmed. On p. 88, "l ≡ 3 mod 8, so (2/l) = 1" should read −1. arXiv v2 p. 18 has −1.
- **E4**: confirmed. On p. 90, the formula writes R^{[k]}_p for k = 1, a set the published text never defines. It should be S_p: the proof cites Lemma 20, and arXiv v2's name for the set was R^{[1]}_p. Pairing `misprint` with `affects: a stated result` is right, because the displayed statement is not well formed as printed.

New, each checked on the page images:

- **E5** (error; p. 82, Lemma 13, "In particular"; also arXiv v2 p. 12). Take a = b = 1. Then Δ = ∅ and T = Q, and Lemma 13(d) with the paper's empty-intersection convention gives J_{1,1} = Q. But the Jacobson radical of the field Q is {0}, so the hypothesis Δ_{a,b} ≠ ∅ is missing. Lemma 14 carries it, and Corollary 15 and Proposition 16 only use Lemma 14 with nonempty Δ, so nothing further is affected.
- **E6** (error, affects the proof; p. 89, proof of Proposition 21(d)). The display reads "{x : P^{[3]}(x) = ∅} = {1,−1,2,−2}P₁P₅P₇ = ⋃_{k=1,5,7} Φ′_kΦ′_k". Here 35 = 5·7 has no prime ≡ 3 mod 8, yet it lies in none of the three products Φ′_kΦ′_k. Neither do −1 and 2, and the first equality drops the square factor (9 is on the left only). The companion claim `P_k·(ℚ^×)² = Φ′_kΦ′_k` also fails at 4.

  The correct identity is {±1, ±2}·(ℚ^×)²·Φ′₅Φ′₅·Φ′₇Φ′₇. Its proof is in the entry, and it is still diophantine, so (d) stands. arXiv v2 (p. 19) argued with an explicit formula instead, so the slip entered with the published rewriting.
- **E7** (misprint; p. 90). The proof of Proposition 21(e) cites "Observation 5(b) and (c)", but Observation 5 has no lettered parts. The odd-prime and archimedean clauses are meant.

## 5. Checks

`scripts/check_paper.py` passes on the corrected extraction. Every change is recorded in the item notes, in the route reasons, and in the report's section "Corrections by the independent review". The corrected file has 42 items (6 library, 5 planned, 31 missing), 2 routes (30 items and 1 item) and 7 source issues, all confirmed.
