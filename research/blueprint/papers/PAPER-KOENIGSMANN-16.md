# PAPER-KOENIGSMANN-16: Defining Z in Q

Jochen Koenigsmann, *Defining Z in Q*, [Ann. of Math. 183 (2016), 73–93](https://doi.org/10.4007/annals.2016.183.1.2); arXiv [1011.3424](https://arxiv.org/abs/1011.3424).

Extraction by Claude Code, session `cc-39fac3`, 29 September 2026 (issue #1174). Status: **complete**. Every missing item is routed once. Confirmed red-team fixes by Codex, session `codex-rtOQ9t`, 30 September 2026 (issue #4991); see [the fixes report](../redteam/RT-PAPER-KOENIGSMANN-16.fixes.md) for the targeted read scope, evidence and maintainer requests.

The machine-readable extraction is [PAPER-KOENIGSMANN-16.result.json](PAPER-KOENIGSMANN-16.result.json). It has:
- 49 items: 6 library, 6 planned, 37 missing after the confirmed red-team fixes;
- 2 source routes, both into LogicAndDefinabilityInNumberTheory (LD.4 with 34 items and LD.0 with 3);
- 7 prerequisite entries;
- 9 recorded source issues (3 errors, 6 misprints): E1–E7 carry the earlier independent review; E8–E9 were confirmed by the red-team verifier and added here without inventing new source-issue review metadata.

## Sources read

- **The published article**, the open publisher PDF from annals.math.princeton.edu (21 pages, SHA-256 `f26c2e15…`), read completely: §§1–4 and the references. Locators are journal pages.
- **arXiv v2** (13 November 2013, SHA-256 `6f10efdd…`), the last arXiv version, collated at every finding. It predates the published text and differs from it in §§3–4: Lemma 19 there becomes Definition 19 and Lemma 20, Corollary 21 becomes Corollary 22, and v2's conditional Corollary 23 (under Bombieri–Lang) is replaced by the model-theoretic Proposition 23 and Remark 24.
- **Poonen**, arXiv math/0703907v1, §§2 and 4, to identify the local facts (a), (b), (d) and the ∀∃-formula that Step 1 simplifies.
- **Errata:** the Annals article page lists none, and a web search for an erratum or corrigendum found none.

## What the paper proves

**Theorem 1.** Z is definable in Q by a universal formula of the ring language: there are n and g ∈ Z[t; x₁, …, x_n] with t ∈ Z ⟺ ∀x̄ g(t; x̄) ≠ 0. No quantifier-free formula defines Z.

**Consequences.**
- **Corollary 2 and 2′.** Q \ Z is diophantine. Equivalently, it is the image of the rational points of an affine variety under a morphism to A¹.
- **Corollary 3 and 3′.** The ∀∃-theory of Q is undecidable. Equivalently, surjectivity of V(Q) → W(Q) is undecidable for morphisms of affine varieties.

Together with Observation 0, this says that an existential definition of Z in Q would imply a universal one.

**The proof, in four steps.**
1. **Quaternion traces (Poonen, simplified).** For a, b ∈ Q^×, the set T_{a,b} is the set of sums of two traces of norm-one elements of the quaternion algebra H_{a,b}. It equals ∩_{p∈Δ_{a,b}} Z_(p) (Proposition 6), where Δ_{a,b} is the set of places where H_{a,b} does not split. This gives Poonen's ∀∃-definition of Z with a polynomial of degree 8 rather than 9244.
2. **One ring per residue class.** The sums R^{[3]}_p, R^{[5]}_p, R^{[7]}_p and R^{[1]}_{p,q} of T-sets pick out Z_(p) for primes p in each class mod 8 (Proposition 10). The class of p mod 8 and quadratic reciprocity decide which T-sets to add. Z is the intersection of all of them (Corollary 11).
3. **Existential Jacobson radicals.** The sets T^×, I^c and J cut out the Jacobson radicals of these semilocal rings existentially (Lemmas 13–14, Corollary 15, Proposition 16). The admissible parameters p (the sets Φ_k and Ψ) are diophantine.
4. **Existential to universal.** If J(R) is diophantine, then R̃ = {x : x has no inverse in J(R)} is universally definable, and R̃ = R for R = Z_(p) (Lemma 17). Proposition 18 assembles the universal formula.

**§3, further diophantine sets.** The published text first defines the one-parameter set S_p and proves S_p = Z_(p) for primes p ≡ 1 mod 8 (Definition 19, Lemma 20). Proposition 21 then shows the following are diophantine:
- disjointness of the prime sets P^{[k]}(x) and P^{[k]}(y);
- the non-squares, with an elementary proof of Poonen's theorem;
- "x ≡ k and x ∉ Φ_k";
- P^{[k]}(x) = ∅;
- the non-norms from Q(√y).

Corollary 22 gives an ∀∃-definition of Z with one universal quantifier.

**§4, models of Th(Q).** Z is diophantine iff Z* ⊆ Z** for all models Q* ⊆ Q** of Th(Q) ([Prestel–Delzell, Lemma 3.1.6]). Proposition 23 derives the closure properties that would follow. Remark 24 shows that Th(Q) is not model complete.

## What the atlas already has

- **Library (6 items).** Mathlib provides:
  - the language of rings, definable sets and existential and universal bounded formulas;
  - quadratic reciprocity with both supplements, and Dirichlet's theorem (`Nat.forall_exists_prime_gt_and_eq_mod`);
  - Lagrange's four squares;
  - localisations, Jacobson radicals, p-adic valuations and quaternion algebras.

  Tau Ceti provides weak approximation at finitely many places of a number field, `TauCeti.GlobalNumberFields.weakApproximation_denseRange` (item 11, corrected from planned by the review).

  Koenigsmann's H_{a,b} is `QuaternionAlgebra ℚ a 0 b`, since Mathlib's algebra has i² = a + b·i. Tau Ceti supplies `QuaternionAlgebra.normForm`, its coordinate formula and `QuaternionAlgebra.equivalent_normForm_weightedSumSquares`; item 16 builds only the trace sets and their arithmetic on this existing norm form.
- **Planned (6 items).**
  - The finite-place Hilbert symbols of Q (Observation 5) and the multiplicative reciprocity interface: Tau Ceti's QuadraticFormInvariants 6C. The archimedean symbol and localized product formula are GlobalQuadraticForms Layer 4.4; ClassicalArithmeticCompletion CA.1 records residue-symbol interfaces.
  - Quaternion splitting, the norm criterion and local Hilbert symbols: Tau Ceti's QuadraticFormInvariants, layers 2 and 6c.
  - Hasse–Minkowski for representations and the quadratic Hasse norm theorem (Fact (e) and Proposition 21(e)): Tau Ceti's GlobalQuadraticForms, layers 6 and 4.
  - MRDP, which Corollary 3 needs: LD.4.
  - Local square criteria (new item 47): LocalFieldsRamification Layer 1, consumed by QuadraticFormInvariants 6A. Mathlib Hensel is a base, not the whole sharp dyadic-square theorem.
- **Not planned anywhere.** Everything specific to the paper:
  - the quaternion trace sets and Poonen's local lemmas;
  - the R-rings and their prime-set identifications;
  - the existential Jacobson radicals;
  - the existential-to-universal step;
  - the four main results, the §3 predicates and the §4 model theory.

  The LD packet (`packets/LogicAndDefinabilityInNumberTheory.json`) so far has only the Diophantine-polynomial normal form of LD.4. PAPER-DITTMANN-POP-23 routes Rumely-style uniform definability in global fields to LD.0/LD.1 and a Part II, and does not cover Q specifically.

## Routes

### Route 1: source → LogicAndDefinabilityInNumberTheory, LD.4 (34 items)

LD.4, "Diophantine definability and undecidability", formalises r.e. sets, Diophantine representations and MRDP. Its specification says: "Record other-field variants individually", and "Integer undecidability is not copied to rational or arbitrary number fields; each transfer needs its own interpretation theorem."
- Koenigsmann's paper is the standard source for such a variant over Q:
  - a universal definition of Z in Q, with Robinson's and Poonen's as predecessors;
  - the diophantine sets Q \ Z, non-squares and non-norms;
  - undecidability of Th_∀∃(Q), which is exactly an interpretation-based transfer of MRDP.
- Its quadratic-form inputs have existing library bases or roadmap owners. The paper-specific work includes:
  - the trace sets S_{a,b} and T_{a,b} with Poonen's local facts;
  - the R-rings;
  - the existential Jacobson radicals;
  - the existential-to-universal lemma;
  - the §3 predicates.
- Those paper-specific quaternion and definability arguments belong in LD.4. The external non-n-th-power theorem is a distinct deep input, item 45, with Colliot-Thélène–Van Geel as its blueprint source; it is not claimed elementary.

The exact supplier stage ids are now recorded as mandatory imports in route 1's reason. They are **requests**, not existing graph links. The fixes report asks the maintainer to add QuadraticFormInvariants Layer 2 and 6C → LD.4 and GlobalQuadraticForms Layers 4 and 6 → LD.4. Item 11 directly reuses Tau Ceti's `TauCeti.GlobalNumberFields.weakApproximation_denseRange`; item 47 imports LocalFieldsRamification Layer 1. This issue does not edit the owning link maps.

A blueprint pass should keep the four steps as separate layers of nodes. Proposition 6 alone needs Poonen's Facts (a)–(d) and the explicit Hilbert symbols at 2 and ∞.

### Route 2: source → LogicAndDefinabilityInNumberTheory, LD.0 (3 items)

LD.0 owns the preservation criterion (39), existentially closed embeddings and model-complete theories (43), and the equivalence of model completeness with existential closedness and existential normal forms (44). Mathlib's `ElementaryEmbedding`, `IsExistential` and upward-preservation lemma are the bases; the criterion remains a missing theorem.

Proposition 23 and Remark 24 remain in LD.4 because they consume Theorem 1 and MRDP. Remark 24 now explicitly imports items 43–44 through the existing LD.0 → LD.4 edge. Proposition 23(c) imports item 45, the Colliot-Thélène–Van Geel theorem.

### Shared Diophantine foundations

LD.4 owns one finite-polynomial-system carrier for subsets of finite powers of a commutative ring (46), its general intersection/projection/preimage/composition API (42), and transfer of undecidability along a Diophantine integer subring (49). Items 1, 3, 46 and 47 of the Alpoge–Bhargava–Shnidman extraction are additional sources/consumers of these same interfaces. They have moved from its proposed Part II route to an LD.4 source route; the Part II brief imports them. That route's existing arithmetic rejection and G2/G3 obligations are not resolved by this ownership fix.

The hypotheses matter. Finite unions are asserted for integral domains; over `F₂ × F₂`, existential finite polynomial systems factor componentwise and cannot define the union `{0,1}` of the two Diophantine singleton sets. Single-equation reduction by sums of squares is asserted over Q, not every field. Nonzero uses an inverse over a field; over a ring that formula defines units. Recursive enumerability requires an effective presentation. Transitivity constrains free coordinates and witnesses to the Diophantine subring.

The new conditional rational undecidability item (48) is an application of the general transfer (49); it does not assert an existential definition of Z in Q. The unconditional ∀∃ result (15) retains its own quantifier-prefix argument.

## Prerequisites

These are papers the atlas does not cover:
- Poonen, AJM 2009, the ∀∃-definition and the local lemmas.
- Poonen, MRL 2009, non-squares.
- Colliot-Thélène–Van Geel 2015, non-n-th powers.
- Park, MRL 2013, the universal definition of O_K in every number field, the natural sequel.
- Robinson 1949.
- Cornelissen–Zahidi 2007, the earlier conditional Corollary 3.
- Prestel–Delzell's textbook, Lemma 3.1.6.

## Source issues

The original four findings below were checked on the page images of the published PDF. The first two are also in arXiv v2; the last two entered with the published revision. None changes a result as proved, but E4 leaves the printed Corollary 22 formula undefined as stated.

| id | kind | where | finding |
|----|------|-------|---------|
| E1 | error | p. 78, table in the proof of Proposition 6 | Row (6, 15) lists x₂, x₃, x₄ = 1, 1, 0, giving −6 − 15 = −21 ≡ 3 (mod 8), not −3 as the table requires. x₂ = x₃ = x₄ = 1 gives 69 ≡ −3. I checked every other row in exact arithmetic, and all are correct. |
| E2 | misprint | p. 81, proof of Proposition 10(b) | The proof writes R^{[5]}_p := T_{−2p,−p} + T_{2p,−p} and R^{[7]}_p := T_{−p,−p} + T_{2p,p}. Definition 7 and the Δ computations in the same displays use T_{−2,−p} + T_{2,−p} and T_{−1,−p} + T_{−2,p}. |
| E3 | misprint | p. 88, proof of Proposition 21(b) | "l ≡ 3 mod 8, so (2/l) = 1" should read (2/l) = −1, which the conclusion 2 ∉ (Q_l^×)² needs. v2 has −1. |
| E4 | misprint | p. 90, Corollary 22 | The formula uses R^{[k]}_p for k = 1, 3, 5, 7, but the published text only defines R^{[1]}_{p,q}. For k = 1 it should be S_p (Definition 19, Lemma 20). In v2 the set was called R^{[1]}_p, so the published rename to S_p missed the corollary. |

I also verified Observation 5's list of the 16 pairs of square classes (a, b) with 2 ∈ Δ_{a,b}. It is exactly the set of pairs with Hilbert symbol (a, b)₂ = −1.

## Corrections by the independent review

The review `REV-PAPER-KOENIGSMANN-16` (Claude Code, session `cc-fb70e5`, 29 September 2026) accepts the extraction and made these changes in place:

- **Item 11** (weak approximation) is `library`, not `planned`: Tau Ceti's pin has `TauCeti.GlobalNumberFields.weakApproximation_denseRange`. The name no longer mentions strong approximation, which the paper never uses.
- **Items 8 and 9** (explicit Hilbert symbols, Hilbert reciprocity) were changed to cite QuadraticFormInvariants 6C first; the red-team fix below separates the archimedean clause from that finite-place supplier; **item 10** also cites GlobalQuadraticForms layer 4 for the Hasse norm half.
- **Items 40 and 41** (Proposition 23, Remark 24) moved from route 2 to route 1. They use Theorem 1 and MRDP, and LD.4 requires LD.0, so routing them to LD.0 would have reversed that dependency. Route 2 keeps the general preservation criterion (item 39).
- **New item 42**: the closure properties of diophantine subsets of Q (conjunction, disjunction, x ≠ 0, x ≥ 0, recursive enumerability), which every "is diophantine" claim in the paper uses. It is routed to LD.4.
- **Item 26** states Lemma 13's "In particular" with the missing hypothesis Δ_{a,b} ≠ ∅ (E5). Notes were added to items 2, 36, 39 and 40.
- **Three new source issues**, each confirmed on the page images:

| id | kind | where | finding |
|----|------|-------|---------|
| E5 | error | p. 82, Lemma 13, "In particular" | For a = b = 1, Δ = ∅, T = Q and J_{1,1} = Q, which is not the Jacobson radical {0} of Q. The hypothesis Δ_{a,b} ≠ ∅ is missing; nothing afterwards uses the empty case. |
| E6 | error | p. 89, proof of Proposition 21(d) | "{x : P^{[3]}(x) = ∅} = {±1, ±2}P₁P₅P₇ = ⋃_{k=1,5,7} Φ′_kΦ′_k" is false (35, −1, 2 are on the left only). The correct identity is {±1, ±2}·(Q^×)²·Φ′₅Φ′₅·Φ′₇Φ′₇, which is still diophantine, so (d) holds. |
| E7 | misprint | p. 90, proof of Proposition 21(e) | It cites "Observation 5(b) and (c)", but Observation 5 has no lettered parts; the odd-prime and archimedean clauses are meant. |

E1's collation note is corrected: arXiv v2 has the table on its p. 7.

## Confirmed red-team corrections

The fixes report addresses all nine confirmed findings, including the five low-severity findings beyond the four listed in the generated fix issue. Items 43–49 add the missing logical definitions/criterion, external theorem, common ring carrier, local squares and interpretation transfers. Items 6, 7, 8 and 16 now identify the actual norm-form library base and the distinct finite/archimedean symbol owners. Item 42 generalizes only the operations valid over arbitrary rings; the stronger union assertion in the proposed fix is corrected with the product-ring counterexample above.

Two further source misprints were checked against published page images and arXiv v2 on 30 September 2026:

| id | kind | where | correction |
|----|------|-------|------------|
| E8 | misprint | Published p. 90, proof of Proposition 21(e); v2 p. 20 | The equality of `R_p^[k]` at the prime `p=l` is with the localization `Z_(l)`, not the l-adic integer ring `Z_l`. |
| E9 | misprint | Published p. 91, proof of Corollary 22; v2 p. 21 | The congruence class used from Proposition 21(c) is `k + 8Z_(2)`; the printed predicate omits 8. |

Both affect nothing: the first is a localization/completion notation slip, and the second's stronger congruence already follows under the sentence's stated assumption when p is a 2-adic unit. E1–E7 and their historical independent-review metadata are preserved. The source-version records describe the earlier full read; the dated `readSections` addition and fixes report describe this targeted reread.
