# Independent review REVIEW-EXT-10-EXT-07 — EXT-10 and EXT-07 packets

Reviewer: independent-review-REVIEW-EXT-10-EXT-07. Date: 2026-09-16.

Scope: the draft packets in `research/expansion/external/EXT-10/` (nine listed packets plus
`AutomorphicBundles.json`, found in the directory at the start of the review) and
`research/expansion/external/EXT-07/FaltingsFinitenessAndIsogenyTheorems.json`. They were
reviewed one at a time in the order set by the orchestrator.

Method, per `research/expansion/PROTOCOL.md`:

* Each node's statement, hypotheses, proof steps, acceptance items, locators and excerpts
  were compared with the cited passage of the source.
* Each link was checked for direction, for the place where the consumer uses the supplier's
  output, and for the existence of both endpoints (atlas stage or packet node). Cross-roadmap
  suppliers were checked by reading their `data/atlas.json` descriptions.
* Every `parentStageId` and coverage `stageId` was checked against the atlas for existence and
  owner. The union of the atlas `stageEdges` with the stage edges implied by the packet's links
  was checked for cycles.

Reading copies:

* **Library files.** SHA-256 re-verified. Text re-extracted by the reviewer in scratch
  (`pdftotext -layout`).
* **Scanned papers.** The OCR text layers drop inequality signs, primes and Greek letters.
  Every displayed formula, inequality and hypothesis that a node depends on was therefore
  read on page images rendered from the library PDF (`pdftoppm`).
* **DVI files.** Converted with `dvipdfmx`, which renders the mathematics that `dvi2tty`
  prints as `#`.

Nothing was copied into the repository. Each reviewed packet now has a top-level `review`
object with per-node verdicts. Packet `status` stays `partial` and `implementationStatus` stays
`unchecked`.

---

## 1. AlgebraicModularFormsAndSerreWeights.json (R15.1–R15.6)

**Verdict: accepted.**

| Item | Count |
| --- | --- |
| Nodes | 24: 2 verified, 22 corrected, 0 unverifiable |
| Links | 17 → 17: 13 kept (3 annotated), 2 removed, 1 re-targeted, 2 added |
| Gaps | 6 → 11 |
| Coverage | 6 stage records, all atlas stages of the roadmap; `remaining` lists extended |

No stage cycle.

### Sources and provenance

All five sources are library copies. Their SHA-256 hashes match the packet:

| Source | SHA-256 |
| --- | --- |
| Katz LNM 350 | `f9c14dc0…` |
| Serre, Duke 54 | `8048919d…` |
| Edixhoven DVI | `ff106eeb…` |
| Deligne–Serre | `65b390f6…` |
| Raynaud, Bull. SMF 102 | `05cad2f5…` |

No source was fetched.

**Edixhoven edition.** The DVI is dated 24 December 1998. The packet also claimed that its
Coleman–Voloch note (p. 3) "is not in the 1992 printing". The library has no printed copy, so
this claim is marked unverified in the source entry.

**Beyond the drafter's ranges, the reviewer read:**

* Katz 1.4, 1.10, 1.11.0 and bibliography item [7];
* Serre's bibliography ([35] = Raynaud 1974);
* Edixhoven §2.1–2.9, all of §7, the end of §8.3 and the references;
* the Deligne–Serre bibliography ([3] Curtis–Reiner, [25] Swinnerton-Dyer);
* Raynaud Prop. 3.2.1, 3.3.1, Thm 3.3.3 and Remarks 3.3.4–3.4.7.

### Main corrections

1. **Katz's weight-one base change is open for n ≥ 12, not n > 12.** The page image of p. 85
   prints "level n ≥ 12"; the text layer reads "n > 12". Level 12 is also open (deg ω = 2g−2
   there). Node title, statement, proof steps, excerpt and gap were corrected. HANDOFF
   correction 4 ("open above level 12") has the same error.
2. **The Hecke q-expansion formula was mis-transcribed.** Katz (1.11.1.2) reads
   `b_i(α_n) = ℓ^{k−1} a_{i/ℓ}(α_n′) + a_{ℓi}(α_n″)`. Here α_n′ and α_n″ are the modified
   level structures of 1.11.0.3–1.11.0.4. The node had `a_{i/ℓ}(ℓα_n) + a_{ℓi}(α_n)`. Katz
   explicitly declines the other natural choice α_n∘π̌ = ℓ·π(α_n).
3. **The sheaf ω is constructed for n ≥ 3, not n ≥ 1.** See Katz 1.4 and 1.10.
4. **The strong q-expansion principle rests on an admitted result.** Katz Thm 1.12.1 admits
   Result 1.12.0, a special case of Swinnerton-Dyer's structure theorem that is proved only in
   Katz 4.4.1 (unread). The node did not mention it. As printed, 1.12.0 also does not cover the
   characteristic-0 field case.
5. **Katz Thm 1.8.2 is stated over Z.** It reads `S(Z,1,k) ⊗ R_0 ≅ S(R_0,1,k)`. The node gave
   only the intermediate Z[1/6] step. Remark 1.8.2.2 concerns level one only.
6. **Hasse lifting at p = 2.** Katz's Remark gives a lifting for every n divisible by 3, 5, 7
   or 11. The node's "restricted to odd n with 3 ≤ n ≤ 11" was wrong. For p = 2, 3 the
   impossibility of a level-one lifting is over Q ∩ Z_p, not "over a p-adic ring".
7. **Hasse invariant.** The source has F*_abs(η_can) = η_can on the dual basis of H¹, and the
   value 1 comes only from the invariant-derivation argument.
8. **Von Staudt–Clausen acceptance item.** It asserted ord_p(2(p−1)/B_{p−1}) = −1. The correct
   statement is ord_p(B_{p−1}) = −1, so the ordinal of 2(p−1)/B_{p−1} is 1.
9. **Edixhoven Prop. 8.5.**
   * It says ε₁ = ε₂ for the unramified parts. The node wrote θ₁ = θ₂, which is false for odd
     p because the two characters differ by χ.
   * It allows m = 3 at p = 2, so it corrects Serre's Remark (1) at p = 2 rather than merely
     "sharpening" it.
10. **Edixhoven Prop. 8.2.**
    * The node attributed the equivalence "finite ⇔ peu ramifié" to the valuation dichotomy
      8.4.3. The actual proof is at the end of §8.3 and treats p = 2 explicitly.
    * 8.4.3 says "λ = 1 and ε trivial", not "χ trivial"; it proves Prop. 8.5.
    * The imports Raynaud [21] 2.2.3 and 3.3.3 are now named.
11. **Edixhoven Thm 3.4.**
    * Prop. 7.3 is a Hecke-compatibility of Φ: S(N,k) → M⁰(N,p+1−k)^∨.
    * The cases N = 1, p = 2, 3 are referred to Serre [25], Théorème 3 (Astérisque 24–25,
      unread); the node omitted them.
    * "i taken mod p−1" was not the source's statement.
12. **θ operator.** The derivation of T_p*(θf) = 0 was circular. It follows from
    T_ℓ*(θf) = ℓθ(T_ℓ*f) at ℓ = p. The relation itself is stated, not proved.
13. **Deligne–Serre §6.**
    * Thm 6.7 has k ≥ 1, and 6.9 uses n even > 2.
    * [25] is Swinnerton-Dyer, not Serre.
    * Deligne–Serre never argue that the O_λ-module M in 6.10 is free of finite type.
14. **Raynaud node.**
    * Standing hypotheses were overstated: strict henselianity belongs to §3.4.
    * Thm 3.3.3 (the result Edixhoven cites) and Remark 3.4.6 (nothing is learnt for e ≥ p−1;
      every F-vector space scheme then prolongs) were added.
    * Thm 3.4.3 is recorded as an iff.
15. **Serre §§2–3 details.**
    * The twisting formula k = k′ + a(p+1) is stated only in the level-2 case.
    * The p ≠ 2 restriction in Prop. 4 applies to case (ii) of one direction only.
    * The existence criterion for D and λ² = ε_prim(ℓ)ℓ^{k−2} are asserted without proof, and
      the latter needs v_ℓ(N) = 1 and v_ℓ(cond ε) = 0.
    * "A priori larger" (Katz's definition) is Serre's Remark (6).
    * Footnote 2 (the k ↦ k+p−1 inclusion fails for p = 2, 3 with the reduction definition) was
      added.
16. **Edixhoven minimality.** Edixhoven's minimality result concerns his k(ρ) for Katz forms,
    which differs from Serre's k_ρ. Proving Thm 4.5 is `SerreWeightAndLevelOptimisation:R20.3`'s
    obligation.

**Confirmed drafter findings.**

* **Serre's printed "Raynaud [35], th. 2.4.3".** Confirmed on the page image of p. 190. [35] is
  Bull. SMF 102 (1974). Its §2 has only 2.1–2.3, with numbered results 2.2.2, 2.2.3 and 2.3.1.
  Thm 3.4.3 is the plausible intended referent.
* **Why Serre's proof of Prop. 4 is written for p ≠ 2.** Raynaud Prop. 3.3.2(2) and
  Thm 3.3.3 need e < p−1. The drafter's explanation is correct.

### Links

**Verified:** R15.1 → q-expansion principle; q-expansion principle → Hecke operators
(Prop. 1.11.3 proof); θ → θ-cycles; Thm 3.4 → Thm 4.5 proof; Prop. 1 → tame weights;
peu/très ramifié → Prop. 4 (via (2.8.2)); Raynaud node → Prop. 4; finiteness → Def. 4.3;
lifting lemma → Serre (3.1.6); determinant → conjecture target.

**Annotated:**

* **Katz base change → Hecke operators.** At n = 2 the base change used is Thm 1.8.1.
* **Hasse invariant → θ/filtration.** Edixhoven cites Katz–Mazur §12.4 for A.
* **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1` → Prop. 4.** R07.1's description covers
  Cor. 3.3.6 and Thms 3.4.1/3.4.3, which is adequate. The reason now says that "th. 2.4.3" has
  no referent. This stage edge is new (R15.4 requires only R07.5); it creates no cycle.
* **`R07.5` → finiteness at p.** Scope overlap:
  * R07.5 describes the conclusion of Prop. 8.2.
  * The proof of 8.2 actually consumes Raynaud 2.2.3 and 3.3.3, which are R07.1-type material.
  * Kept as an existing atlas edge, with a gap.

**Removed:**

* **Katz Thm 1.7.1 → Deligne–Serre Lemme 6.11.** Deligne–Serre do not use Katz. The hypotheses
  of Thm 1.7.1 (full level invertible) are not those of Thm 6.7, where λ may divide N. The
  missing freeness argument is recorded as a gap.
* **Lemme 6.13 → residual-modularity definition.** Serre 3.1.7 uses ρ_f over F̄_p and never
  invokes 6.13. Re-targeting the link to `AutomorphicGaloisRepresentations:R19.1` would close
  the stage cycle R19.1 → R15.6 → R19.1. Recorded as a gap and a decision.

**Re-targeted:** the k(ρ) node → `SerreWeightAndLevelOptimisation:R20.1` became → `R20.3`.
R20.1 is level-changing algebra, while R20.3 "Prove[s] the Edixhoven/Serre weight theorem". The
edge R15.4 → R20.3 is new and acyclic.

**Added:**

* level-one descent → Hecke operators (proof of Cor. 1.11.4 and Prop. 1.11.3 at n = 2);
* Raynaud node (Thm 3.3.3) → finiteness at p (end of §8.3).

### Unverifiable items

None among node claims.

Two statements are recorded as unverifiable facts about sources rather than nodes:

* whether the Coleman–Voloch note is in the 1992 printing;
* whether Serre intended Raynaud Thm 3.4.3 by "th. 2.4.3". This is strongly indicated by
  content but cannot be settled from the paper.

### Gaps added

* Katz Result 1.12.0 (proved only in Katz 4.4.1);
* Edixhoven §7 small-level imports (Serre [25] Théorème 3; Robert [23] Thm B);
* finite freeness of the Deligne–Serre module M (not argued; Swinnerton-Dyer [25] unread);
* placement of Lemme 6.13;
* ownership of Edixhoven Prop. 8.2 and of Raynaud Cor. 2.2.3.

**Updated gaps:**

* **Weight-one boundary.** Now n ≥ 12, and the Deligne–Serre `neededBy` was removed.
* **Serre Prop. 4 at p = 2.** Action (a) was carried out: Edixhoven Prop. 8.2's proof covers
  p = 2 for the reducible shape (8.1.1). Two pieces remain open: the level-2 and tame cases
  need prolongation over Z₂ plus descent, and Edixhoven adds 1, not 2, at p = 2.
* **Fontaine/Gross imports.** Now also list Thm 2.5 (proof in Gross [10]) and Gross Prop. 4.12.

### Questions for the orchestrator

1. **Serre-weight dichotomy at p = 2.** Stage R15.4 demands "for p=2 prove that the classical
   weight is 2 exactly in the finite-flat case and 4 otherwise". No read source proves this
   whole statement. Edixhoven Prop. 8.2 covers the wild case. The irreducible and tame cases at
   p = 2 still need a written prolongation and descent argument over Z₂. Keep the gap, or assign
   a source.
2. **Ownership of Edixhoven Prop. 8.2.** Decide between `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`
   and R15.4. Also decide whether R07.1 should state Raynaud Cor. 2.2.3 and Thm 3.3.3 explicitly.
3. **Placement of Deligne–Serre Lemme 6.13.** Either move the node to R15.5 and link it to
   `AutomorphicGaloisRepresentations:R19.1`, or leave it without an outgoing edge.
4. **Edixhoven Thm 4.5.** Confirm with EXT-13 that `SerreWeightAndLevelOptimisation:R20.3`
   proves it and consumes the R15.4 recipe. Integrating the re-targeted link adds the stage
   edge R15.4 → R20.3.
5. **Correct the handoff.** EXT-10 HANDOFF correction 4 should read "open for level n ≥ 12".

---

## 2. ArithmeticGaloisRepresentations.json (R01.1–R01.6, G7)

**Verdict: accepted.**

| Item | Count |
| --- | --- |
| Nodes | 9: 3 verified, 6 corrected, 0 unverifiable |
| Links | 6 → 3: 2 kept with corrected reasons or locators, 1 re-targeted to a stage, 3 removed |
| Gaps | 5 → 8 |
| Coverage | 7 stage records, all atlas stages of the roadmap |

No stage cycle.

### Sources and provenance

All eight sources are library copies. Their SHA-256 hashes match the packet:

| Source | SHA-256 |
| --- | --- |
| Deligne LNM 349 | `b03f483c…` |
| Serre 1987 | `8048919d…` |
| KW I preprint | `3c389dc3…` |
| Dieulefait–Pacetti | `0c6850da…` |
| ACC+ | `c5429e4f…` |
| Chenevier | `f3c0e0d8…` |
| Deligne–Serre | `65b390f6…` |
| Faltings | `0b7fb3e5…` |

No source was fetched.

**Deligne scan.** The Deligne file is the IAS typescript scan. Its bibliography page carries a
later note citing Laumon (1984), so it is not a pristine 1973 printing; this is now recorded in
the source entry.

**Beyond the drafter's ranges, the reviewer read:**

* Deligne 2.2.1–2.2.4, 8.3.1–8.3.7 and the bibliography;
* Serre 1.1 and 3.3 on page images;
* KW I §5 remarks and the bibliography;
* Dieulefait–Pacetti Remark 4 and the bibliography;
* Chenevier pp. 1–4;
* Faltings Satz 5–6 (statements).

### Main corrections

1. **The Weil–Deligne normalisation is settled.** The drafter's gap (HANDOFF correction 13) is
   resolved.
   * **What the page images show.** The typescript's displays are legible on page images, though
     lost in the text layer. Thm 8.2 reads `ρ(w)Nρ(w)⁻¹ = q^{v′(w)}·N` and (8.4.1.1) reads
     `ρ′(w)Nρ′(w)⁻¹ = q^{v′(w)}N`.
   * **Deligne's notation.** By 2.2.2–2.2.4, v′ is reduction to Gal(k̄/k), W(k̄/k) ≅ ℤ is
     generated by the arithmetic Frobenius φ: x ↦ x^q, and the geometric Frobenius is F = φ⁻¹.
   * **Consequence.** ρ(Φ)Nρ(Φ)⁻¹ = qN for an arithmetic Frobenius lift Φ, and q⁻¹N for a
     geometric one. This is exactly the stage text's assertion.
2. **Deligne locators were off by eight pages.** The running marks coincide with PDF pages:
   Thm 8.2 is Del-66 (p. 566), Def. 8.4.1 is Del-68, and 8.4.2–8.4.3 are Del-69. The node had
   Del-58/59. The proof reference [13] is Serre–Tate, *Good reduction of abelian varieties*.
3. **Chenevier's warning about Rouquier was inverted.** The packet said the gap arises "where d!
   is required to be invertible". Footnote 5 says the opposite: Rouquier does not require d!
   invertible, and his Lemma 4.1 has a gap *without* that assumption.
4. **Faltings placement.** The Faltings theorems stated under R01.6 (Satz 3–4, Kor. 1–3,
   Shafarevich) are the obligations of `FaltingsFinitenessAndIsogenyTheorems:R28.4–R28.6`, and
   R28.4 *requires* R01.6. A placement note and a gap were added.
   * Satz 6 was read: it adds "of given dimension".
5. **Dieulefait–Pacetti proofs.**
   * Lemma 1.13's proof includes the normalizer-of-Cartan case.
   * Lemma 1.14's proof has the order-≤2 argument for the projective image of inertia, and the
     niveau-1 case.
   * The node omitted all three; they were added.
6. **Serre 3.3.** The irreducible ⇒ absolutely irreducible argument needs ρ valued in GL₂(F_p) with
   det ρ = χ. As printed it handles only decompositions into a direct sum; the indecomposable case
   is recorded as a gap.
7. **Dyadic dihedral case.** KW I does not hand it to Rohrlich–Tunnell as the node said. KW I's
   Lemma 6.2(i) cites Serre's Prop. 10 method, [34] and [42]; Dieulefait–Pacetti §3 cites [RT97].
   "Fails for odd p" is not in either source.
8. **R01.1 node.** Deligne–Serre 6.12 only asserts the conjugation into GL₂(Ô_λ). Lattice
   existence, Brauer–Nesbitt lattice independence and discrete-target descent are stage content
   not proved in the passages read, and are now marked as such. Serre 1.1 (finite image in
   GL₂(F_q)) was added as a source.

**Verified without change:** tame inertia (Serre 2.1, KW I 1.5); the Artin conductor (Serre 1.2,
on the page image); ACC+ Def. 6.2.29, Lemma 6.2.30 with proof and Remark 6.2.31 (verbatim).

### Links

**Removed:**

* **Tame inertia → Artin conductor.** Serre 1.2 defines tameness at ℓ ≠ p by G₁ = 1; the
  fundamental characters at p are not used. Shared vocabulary only.
* **Bad dihedral → enormity.** The drafter marked this link "requested" and unverified. ACC+
  Def. 6.2.29 and Lemma 6.2.30 do not use Dieulefait–Pacetti Lemma 1.13.
* **Faltings node → `EllipticCurveModularity:R29.1`.** The supply belongs to
  `FaltingsFinitenessAndIsogenyTheorems:R28.6`, which is already an atlas edge.

**Re-targeted:** Monodromy node → Artin-conductor node became → stage R01.3. The stage needs the
monodromy term; the node (finite image) does not use N.

**Corrected:** Dickson → bad dihedral now cites the proof of Lemma 1.13, where the solvable
classification is used. The dyadic refinement is unused, since p is odd.

**Annotated:** continuity → recognition. Deligne–Serre 6.12 applies Lemme 6.13 to the
semisimplified reduction.

### Unverifiable items

None among node claims. The identification of v′(w) with an integer is implicit in Deligne
2.2.3–2.2.4 rather than displayed; this is recorded in the resolved gap.

### Questions for the orchestrator

1. **Faltings node placement.** Move the Faltings-theorem node out of R01.6 (to the EXT-07 Faltings
   packet or R28), or cut it down to R01.6's own Tate-module API.
2. **HANDOFF correction 13.** It can be closed: the normalisation is established from Deligne's page
   images.
3. **R01.4 and oddness.** R01.4 asks for "odd, irreducible ⇒ absolutely irreducible" over a finite
   field in general. The only source read proves the decomposable case for ρ valued in GL₂(F_p)
   with det ρ = χ.

---

## 3. AutomorphicGaloisRepresentations.json (R19.1–R19.6)

**Verdict: accepted.**

| Item | Count |
| --- | --- |
| Nodes | 8: 0 verified, 8 corrected, 0 unverifiable |
| Links | 7 → 6: 2 verified, 2 corrected, 1 re-targeted, 1 annotated, 1 removed |
| Gaps | 5 → 8 |
| Coverage | 6 stage records, all atlas stages of the roadmap |

No stage cycle.

### Sources and provenance

The five cited sources are library copies. Their SHA-256 hashes match the packet:

| Source | SHA-256 |
| --- | --- |
| Deligne–Serre | `65b390f6…` |
| Deligne, Bourbaki 355 | `19509c19…` |
| Carayol 1986 | `d4a5fb6b…` |
| Saito arXiv v2 | `fb5b69b7…` |
| Chenevier | `f3c0e0d8…` |

**Added source.** The reviewer added Dieulefait–Pacetti as a sixth source (library copy,
`0c6850da…`) for the definitions of compatible systems.

**Page images.** The scanned sources were read on page images wherever a formula matters:
Deligne–Serre, Bourbaki 355 (printed page = PDF page + 137) and Carayol. Nothing was fetched.

**Beyond the drafter's ranges, the reviewer read:**

* Deligne–Serre introduction, 3.1–3.4 and 8.1–8.4;
* Bourbaki 355 Props 3.18–3.19, 4.8 and Lemmas 5.3, 5.5;
* Saito pp. 8–10 (recalled conventions).

### Main corrections

1. **Deligne's congruence relation (Bourbaki 355, Thm 4.9, p. 167).** The theorem reads
   `T_p = F + I_p* V`, `FV = p^{k+1}`, `1 − T_p X + p R_p X² = (1 − FX)(1 − I_p* V X)`, with
   R_p = p^k I_p* (Prop. 3.18).
   * The node's `T_p = F + V` is only the level-one specialisation used in the proof of Thm 5.6.
   * The sheaf is `Sym^k R¹f_*`, not the Tate module.
   * "Étale of degree p+1" holds over Spec Z[1/p].
   * Prop. 4.8(i) is referred to Houzel, SGA 5 XV.
   * The Kuga–Sato resolution used for Thm 5.1 is asserted, not proved.
2. **Deligne–Serre Thm 6.1 is admitted.** The introduction (p. 508) says it had no complete
   published proof and depended on SGA 5. [4] is Bourbaki 355, which covers only a special case.
3. **Carayol 0.2–0.5, read on the page image.**
   * **Characters of D_{k,w}.** The node had them wrong. The source has
     μ(t) = |t|^{(k−1−w)/2}·sgn(t)^k and ν(t) = |t|^{(−k+1−w)/2}.
   * **Kutzko characterisation.** It goes through the contragredient:
     L(χ·σ̌(π_p)) = L(χ·ω_p^{1/2}·π_p).
   * **Principal series.** σ(Ind(ξ₁,ξ₂)) = ξ₁⁻¹ω_p^{−1/2} ⊕ ξ₂⁻¹ω_p^{−1/2}. The node had
     ξ_i·ω_p^{1/2}.
   * **Theorem (A)** asserts an equivalence, not an F-semisimplified comparison.
4. **Carayol's even-degree hypothesis is standing.** The hypothesis on an auxiliary square-integrable
   place, when [F:Q] is even, is part of 0.3 and is retained in Theorem (A). The node said base
   change removes it; base change only passes from (B) to all places p.
5. **"Strictement compatible" is undefined in the passage read.**
   * Carayol uses the term but does not define it in 0.1–0.11. The node's gloss ("λ-independence
     away from the coefficient prime is the definition") was unsupported.
   * It was replaced by Dieulefait–Pacetti Def. 1.10 (after KW09b), which demands Weil–Deligne
     compatibility at every prime, including the coefficient prime, and by their definition of
     "almost strictly compatible".
   * No source read defines "weakly compatible".
6. **Chenevier's Rouquier footnote** was inverted here too; corrected as in packet 2.
7. **Saito's sign convention (reviewer finding, recorded as a gap).**
   * **What Saito prints.** p. 9 has `ρ(σ)Nρ(σ)⁻¹ = Np^{n(σ)}N`, with n(geometric Frobenius) = 1;
     p. 12 has φN = pNφ.
   * **The reviewer's computation.** For a geometric Frobenius F, t_ℓ(FσF⁻¹) = q⁻¹t_ℓ(σ). So the
     ℓ-adic formula Saito recalls on p. 10 forces ρ′(F)Nρ′(F)⁻¹ = q⁻¹N. This matches Deligne 8.2 and
     contradicts Saito's printed p. 9 convention.
   * **Also unchecked.** Whether Saito's σ̌_h equals Carayol's σ.

### Links

**Verified:**

* Theorem (A) → normalization node;
* purity (Saito Thm 2) → Saito Claim 1(2).

**Corrected:**

* **Bourbaki 355 → Thm 6.1.** This is a special case only, per Deligne–Serre Remarque 6.2.
* **Thm 6.1 → weight-one Artin representation.** Now verified: Deligne–Serre 8.2 uses Thm 6.7,
  whose proof (6.12) applies 6.1.

**Re-targeted:** `AlgebraicModularFormsAndSerreWeights:R15.5` → Thm 6.1 node became → weight-one
Artin node. Theorem 6.1 does not use 6.9–6.11; the proof of 6.7 does, and 8.2 uses 6.7.

**Annotated:** Carayol → Saito (the normalization question).

**Removed:** `AlgebraicModularFormsAndSerreWeights:R15.6` → determinants node. It was marked
"requested", Chenevier's Theorem B does not use Deligne–Serre Lemme 6.13, and R15.6's atlas
description does not state that lemma.

### Unverifiable items

None among node claims.

### Questions for the orchestrator

1. **Weil–Deligne sign convention.** Fix one convention project-wide, for example Deligne's, as
   recorded in the ArithmeticGaloisRepresentations packet. Have `AutomorphicGaloisRepresentations:R19.5`
   and its consumers check Saito's printed convention against it.
2. **Compatible systems in R19.3 / R24.** Specify which definition of "strictly compatible" is meant:
   Serre/Carayol, or KW/Dieulefait–Pacetti. The atlas text asks that the weak, almost-strict and strict
   distinction survive into R24.
3. **Supplier of Thm 6.1.** Decide which stage supplies a complete proof of Deligne–Serre Thm 6.1 in
   general level and character: R19.1 itself, or ModularCurvesPartII R14.3 with WeightsInEtaleCohomology
   R34.5.

---

## 4. AutomorphicGaloisRepresentationsPartII.json (AG2.0–AG2.7)

**Verdict: accepted.**

| Item | Count |
| --- | --- |
| Nodes | 7: 1 verified, 6 corrected, 0 unverifiable |
| Links | 6: 1 verified, 5 kept with annotations |
| Gaps | 5 → 7 |
| Coverage | 10 stage records, all atlas stages of the roadmap (AG2.1, AG2.1b, AG2.2, AG2.3 `not_read`) |

No stage cycle.

### Sources and provenance

All six sources are library copies. Their SHA-256 hashes match the packet:

| Source | SHA-256 |
| --- | --- |
| HLTT | `abecfd04…` |
| Chenevier–Harris II | `9b5e7679…` |
| Varma | `24076dfc…` |
| Caraiani, away from p | `769e68e2…` |
| Caraiani, l = p | `6ec69841…` |
| ACC+ | `c5429e4f…` |

No source was fetched.

**Beyond the drafter's ranges, the reviewer read:**

* Chenevier–Harris's description of the dominance order before their Thm 2.3;
* the bibliography keys: [Ch] = Chenevier, *Une application des variétés de Hecke des groupes
  unitaires*; Varma [9] = HLTT, [10] = Harris–Taylor, [16] = Scholze;
* the HLTT display on p. 2, on the page image.

### Main corrections

1. **Normalization node.** It claimed that "all four construction sources fix the same
   normalization", then described Caraiani's different, geometric one; rewritten.
   * The explanation of the |det|^{(1−n)/2} twist is not in any passage read and was removed.
   * Varma's rec is "as normalized in" Harris–Taylor.
2. **HLTT, p. 2.** The 2n-dimensional decomposition carries the cyclotomic character ε_p^{1−2n}; the
   node had p^{1−2n}.
   * The theorem concerns primes "above which π is unramified".
   * The "non-classical weight" clause is in Varma's summary, not in HLTT.
3. **Caraiani's case division.** "Already known when n is odd or slightly regular (Shin), or
   square-integrable (Harris–Taylor, Taylor–Yoshida)" refers to her Theorems 1.1–1.2, not to the
   existence of R_l(Π).
4. **Varma's proof.** Varma transfers the trace identity through congruences mod p^k and a
   pseudorepresentation, not through "continuity of the Bernstein centre".
5. **Purity upgrade.** The principle that there is at most one monodromy operator making a
   semisimple Weil representation pure is Taylor–Yoshida Lemma 1.4(4), as cited in Caraiani's l = p
   paper. The source is now given.

**Placement findings** (recorded as a gap; node ids unchanged):

* The atlas says AG2.0 builds its dictionary *without* local Langlands, and that AG2.1a is "raw
  cohomology before local Langlands".
* The AG2.0 node (rec-normalizations) and the AG2.1a node (Chenevier–Harris Thm 3.2.3: dominance
  order, de Rham, crystalline) contain post-local-Langlands material, which belongs to AG2.2, AG2.5
  and AG2.6.

**Discrete versus cuspidal.** HLTT apply [Sh1] and [CH] to *discrete* (isobaric) GL₂ₙ
representations. Chenevier–Harris's theorem as read is for cuspidal Π, so the discrete case is an
unread AG2.2 input; recorded as a gap.

### Links

**Verified:** HLTT → Varma.

**Annotated:**

* **Normalization → HLTT.** Records the normalization only; no mathematical input.
* **Polarized → HLTT.** Cuspidal versus discrete.
* **Polarized → Caraiani.** Caraiani describes Chenevier–Harris as "up to semisimplification", while
  Chenevier–Harris use the dominance order.
* **Caraiani away from p → coefficient prime.** Verified: the l = p paper uses Thm 1.2 of the
  away-from-p paper.
* **`ArithmeticGaloisRepresentations:G7` → AG2.7.** The AG2.7 node only restates G7's enormity for
  contrast; the AG2.7 stage text does not mention enormity. The new direct edge is acyclic but
  optional.

### Unverifiable items

None among node claims.

The dominance order itself is defined only in [Ch], which is not in the library. Chenevier–Harris
state one implication of it: s ≅ s′, and N lies in the closure of the orbit of N′.

### Questions for the orchestrator

1. **Re-home two nodes.** Move the AG2.0 normalization node and the AG2.1a polarized-construction node
   to AG2.5 and AG2.2, or amend their parentStageIds.
2. **G7 → AG2.7 edge.** Keep or drop it (restatement only).
3. **Dominance-order source.** Obtain Chenevier, *Une application des variétés de Hecke des groupes
   unitaires*, §3.1. AG2.5 requires implementing that partial order.

---

## 5. ClassicalSerreModularity.json (R26, R27, R33)

**Verdict: accepted.**

| Item | Count |
| --- | --- |
| Nodes | 21: 5 verified, 16 corrected, 0 unverifiable |
| Links | 16: 12 verified, 3 annotated, 1 re-pointed |
| Gaps | 8 → 10 |
| Coverage | 18 stage records, all atlas stages (R26.2, R26.4, R26.5, R33.6 `not_read`) |

No stage cycle.

### Sources and provenance

All seven sources are library copies. Their SHA-256 hashes match the packet:

| Source | SHA-256 |
| --- | --- |
| KW I preprint | `3c389dc3…` |
| KW Annals 2009 | `154c0c2a…` |
| Khare arXiv v1 | `3012a517…` |
| Böckle appendix | `67de08f6…` |
| Dieulefait–Pacetti | `0c6850da…` |
| KW II | `53f45f8b…` |
| Serre 1987 | `8048919d…` |

No source was fetched.

**Reading.** The reviewer re-read the following in full:

* KW I (including its bibliography);
* the Böckle appendix;
* Dieulefait–Pacetti.

Also read: Khare pp. 1–7 and 11–12, and KW Annals §6.2. Bars and inequalities were checked on
page images for DP Theorems 1.7 and 1.9, DP Lemma 1.15, DP Paso 6, and the KW Lemma 8.2 Remark.

### Main corrections

1. **KW I's [24] is Khare's level-one Duke paper, not the Annals paper [22].**
   * The corrected proof of Corollary 8.1(i) (= Khare Cor. 1.2 without p > 2) concludes with
     "(2) of Theorem 6.1 of [24]". The node had "Theorem 6.1(2) of the Annals paper".
   * The library's copy of [24] is arXiv v1. It has no Theorem 5.1 or 6.1 (its compatible-system
     result is Prop. 3.1), so these corrected references cannot be resolved from the library.
     New gap.
   * The KW I §7 Remark ("one can always find P with (i)") is also [24], not the Annals paper.
2. **Proof of Theorem 3.2.** The proof steps omitted the final argument that ρ̄′_P (resp. ρ̄′₅)
   is modular. That argument splits on p | N and uses a further lift plus the inductive
   hypothesis; it was added.
3. **Annals §6.2** is confirmed at pp. 250–251. Its Theorem 6.2 is conditional on the MLC and on
   Theorem 3.3 at k = p; the node did not say so.
4. **Hypothesis (H) branch.** In the proof of Theorem 9.1, the finite-flatness claim is printed "by
   Theorem 5.1(2)", although the system comes from 5.1(4).
   * The key step "très ramifié ⇒ not finite flat over any extension of Q₂ of odd ramification
     index" is asserted without reference in KW I and in DP Remark 6.
   * Serre 2.6 and Edixhoven 8.2 do not give it. New gap.
5. **Böckle appendix.**
   * Case (iv) smoothness is "implicitly shown" in Ramakrishna 2002, not in "the main text".
   * T_Q (not T_∅) is reduced by the choice of Q.
   * The final contradiction uses Carayol [3].
   * Lemma 1 rests on Conrad and Ramakrishna.
   * The printed "Krull intersection theorem" is a height statement.
6. **DP Theorem 1.7 (page image).** Only ρ̄^{ss} carries a bar. The conditions "ρ|D₃ ≠ id" and
   "ρ|I₃ ≅ (* *; 0 1)" concern ρ; the latter is ordinarity.
   * Paso 6 checks the D₃ condition residually and gets ordinarity for the 3-adic ρ̃₃ from
     Berger–Li–Zhu. The node had both statements on ρ̄₃.
7. **DP lemmas.**
   * Lemma 1.13's Cartan-normalizer case was restored in the lifting-inputs node.
   * Lemma 2.1 is "taken from KW I Lemma 6.3".
   * Lemma 1.15 is stated for GL₂(F_p), matching the rationality correction to KW I Lemma 8.2.
     That Remark was confirmed on the image: GL₂(F̄_p) was the withdrawn version.
8. **Smaller corrections.**
   * The q ≡ 1 mod 8 gloss was replaced by its actual use in Lemma 6.3.
   * The unsourced "level-2 character ⇒ level q²" explanation was removed.
   * A garbled acceptance item on (L_r)/(W_r) was rewritten.
   * The dihedral auxiliary case in 8.4 uses Diamond [12].
   * Langlands–Tunnell's lift to GL₂(C) is asserted without reference.

**Placement notes:**

* The KW I §7 prime estimates sit under R26.3 (Khare's level-one strand), but they are consumed by
  KW I Theorem 3.2, and the atlas asks R27.2 for "every prime estimate".
* The derivation of Theorem 1.2 from (D₀) and Theorem 3.4 is stated in the R27.3 assembly node,
  but the atlas assigns it to R27.4.

### Links

**Verified (12):**

* R26.1 → (W₁);
* (W₁) → assembly;
* Def. 2.1 → Lemma 6.3;
* Lemma 6.3 → Theorems 3.2 and 3.1;
* Theorems 3.2 and 3.1 → assembly;
* Theorem 3.4 → Theorem 9.1;
* Theorem 9.1 → Theorem 10.1;
* DP lifting theorems → Paso 4;
* Theorem 1.9 → Paso 6;
* Paso 6 → §3.

**Annotated:**

* **Böckle → Khare.** Khare cites Prop. 1 only; Corollary 2 is not cited at that location.
* **Prime estimates → Theorem 3.2.** Placement.
* **Assembly → Theorem 3.4.** Theorem 3.4 does not consume (D₀); the consumer is the Theorem 1.2
  derivation. Reversing the link would create a stage cycle.

**Re-pointed:** `AlgebraicModularFormsAndSerreWeights:R15.6` → Theorem 9.1 became → from R15.4.
R15.4 owns the p = 2 weight dichotomy; R15.6's description does not state it. The odd-index
strengthening remains a gap.

### Unverifiable items

None among node claims. The Duke-numbered theorems of [24] cannot be located in the library copy;
this is recorded as a gap.

### Questions for the orchestrator

1. **Duke version of [24].** Obtain the published Duke version of Khare's level-one paper, so that
   KW I's corrected references (Theorem 5.1(3), Theorem 6.1(2)) can be checked.
2. **Owner of the odd-ramification-index statement.** Assign "très ramifié mod 2 ⇒ not finite flat
   over any K/Q₂ of odd ramification index" to `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`
   or R15.4. Both KW I and DP need it.
3. **Two re-homes.** Decide whether to move the prime-estimate node to R27.2 and the Theorem 1.2
   derivation to R27.4.
4. **HANDOFF correction 5 (Annals §6.2 vs §5.2).** The reviewer confirms it: §5.2 is the numbering
   of the preprint that Khare cites.

---

## 6. CompletedCohomologyAndLocalGlobalCompatibility.json (R31.1–R31.6)

**Verdict: accepted.**

| Item | Count |
| --- | --- |
| Nodes | 5: 1 verified, 4 corrected, 0 unverifiable |
| Links | 5: 4 verified, 1 with corrected reason |
| Gaps | 5 → 6 |
| Coverage | 6 stage records (R31.2 and R31.5 `not_read`) |

No stage cycle.

### Sources and provenance

All three sources are library copies. Their SHA-256 hashes match the packet:

| Source | SHA-256 |
| --- | --- |
| Emerton draft, 23 March 2011 | `bf4f8556…` |
| Calegari–Emerton survey | `926a5de4…` |
| Serre 1987 | `8048919d…` |

No source was fetched.

**Beyond the drafter's ranges, the reviewer read:** Emerton §§1.1–1.3 (Thm 1.2.1 on the page
image) and §5.1; survey §1.1, pp. 2–4.

### Main corrections

1. **Theorem 1.2.1(1).** Σ contains the primes at which V, not V̄, is ramified (page image).
2. **The object of the conjecture.** Node and link claimed that Emerton's Ĥ¹_E "differs from
   completed cohomology H̃¹ by the Tate-module term" of the survey's (1.1). This is not supported.
   * **Definition in §5.1.** Ĥ¹(K^p)_O is the ϖ-adic completion of colim_{K_p} H¹_ét(Y(K_pK^p), O).
   * **Why the two agree.** (5.1.1) identifies it mod ϖ^s with H¹(K^p)_{O/ϖ^s}, so at each tame
     level it agrees with lim_s lim H¹(−, O/ϖ^s).
   * **The extra step.** Ĥ¹_E additionally takes a colimit over tame levels.
   * **Consequences.** The node gained the definition, the `CompletedCohomologyPartII:CC.2` link
     reason was rewritten, and a gap was added. CC.2's scope (inverse limits, reduction
     comparison, Banach module) is adequate for the object itself.
3. **Theorem 1.2.6** is derived by the source from the unread Theorem 6.2.13, the strong p-adic
   local–global result (R31.4 material).
   * **Placement conflict.** Placing it under R31.3 conflicts with the atlas order R31.3 → R31.4. A
     corrective link would close a cycle, so this is recorded as a placement note.
   * **Circularity wording.** The drafter's "not circular only because companion forms are avoided"
     was replaced by the source's wording, including the [86, Thm 2.1(ii)] exclusion.
4. **Removing Corollary 1.2.2(2)'s extra hypothesis.** The drafter said Theorem 1.2.4 removes it
   through hypothesis (c) of Theorem 1.2.3. That is a correct deduction but not stated in the
   source; now marked as a reviewer observation.

**Verified:** the globalisation audit, i.e. the attributions and hypotheses on which it rests.

### Unverifiable items

None among node claims. (5.1.1) and the admissibility of Ĥ¹(K^p)_O are referred by Emerton to
[36]; recorded in a gap.

### Questions for the orchestrator

1. **Placement of Theorem 1.2.6.** Move the mod p multiplicity node from R31.3 to R31.4 (or later),
   since it depends on Theorem 6.2.13.
2. **CC.2 and tame levels.** Should CC.2 or R31.1 own the colimit over tame levels and the
   (5.1.1)-type identification for the modular tower?

## 7. CompletedCohomologyPartII.json (CC.0–CC.8)

**Verdict: accepted.**

| Item | Count |
| --- | --- |
| Nodes | 8: 0 verified, 8 corrected, 0 unverifiable |
| Links | 6 drafted: 2 verified, 3 corrected or annotated, 1 removed; 1 added (6 in the packet) |
| Gaps | 6 → 9 |
| Coverage | 9 stage records (CC.1 and CC.4 `not_read`) |

No stage or node cycle. The implied new stage edges CC.0 → CC.2 and CC.0 → CC.5 are both already
transitive in the atlas.

### Sources and provenance

All sources are library copies. Their SHA-256 hashes match the packet:

| Source | SHA-256 |
| --- | --- |
| Calegari–Emerton, *Completed cohomology – a survey* (author's file) | `926a5de4…` |
| Scholze, *On torsion in the cohomology of locally symmetric varieties*, Annals 182 (2015) | `ebac854f…` |
| Emerton, local–global compatibility draft, 23 March 2011 (added for the R31.2 link check) | `bf4f8556…` |

No source was fetched. Page images: survey p. 3 (Theorem 1.1) and Scholze p. 1024 (Corollary 4.2.3).

**Beyond the drafter's ranges, the reviewer read:**

* the survey, pp. 2–15, in full;
* Scholze §4 opening (pp. 1017–1018), §4.2 including the proof of Theorem 4.2.1 (pp. 1021–1023), and
  the introduction (pp. 949–950);
* Emerton, Lemmas 5.3.6–5.3.8 and (5.7.10);
* Calegari–Geraghty §§2 and 7.1, and Emerton's interpolation paper, Theorems 2.1.5 and 2.1.12
  (statements only), to test the drafter's next source actions.

### Main corrections

1. **The first duality sequence of Theorem 1.1(3) is false as printed.**
   * **What the survey prints.** 0 → Hom_cont(H̃_{•−1}, Q_p/Z_p) → H̃^• → Hom_cont(H̃_•, Z_p) → 0
     (confirmed on the page image).
   * **Why it fails.** In the survey's own circle-tower example (§1.4), H̃_0 = Z_p and H̃^1 = 0,
     but Hom_cont(Z_p, Q_p/Z_p) ≠ 0.
   * **The reading used.** The node now uses the torsion form Hom_cont(H̃_{•−1}[p^∞], Q_p/Z_p). This
     is the form Scholze needs in Corollary 4.2.3 to get "H̃^BM_d p-torsion-free"; the printed form
     would force H̃^BM_d = 0.
   * **Status.** Recorded as a gap. The published LMS version, which Scholze cites, is not in the
     library.
2. **Scholze's invariants are swapped.** He prints "here l₀ = d and q₀ = 0". The survey's definitions
   give l₀ = 0 and q₀ = d, which is the only reading that matches Conjecture 1.5(1), (5) and (7).
   Direct check: Sp_{2g} gives l₀ = 0 and q₀ = g(g+1)/2.
3. **Theorem 4.2.1.** Its proof is printed right after the statement; the drafter said it was not
   read and that it used the Hodge–Tate map.
   * **What the proof uses.** The j_! comparison, [54, Th. 3.13], [52], Theorem 4.1.1(ii) and almost
     purity. It does not use the Hodge–Tate period map.
   * **Imports.** Now named in the node, coverage and gap.
   * **Locator.** Corollary 4.2.2 is on pp. 1023–1024, not pp. 1021–1022.
4. **Placement of Corollaries 4.2.2–4.2.3.** They are deduced from Theorem 4.2.1 (the CC.8 node).
   * **The drafted link.** CC.7 → CC.8 ran backwards; its own reason admitted this. It was removed,
     because reversing it closes a stage cycle.
   * **Stage texts.** Both CC.7 and CC.8 exclude arithmetic vanishing, so the corollaries stay under
     CC.7 with a placement note and a gap.
5. **Lemma 1.17.** The printed proof claims E^•(M)/p ≅ E^•_{F_p}(M/pM). That is too strong.
   * **Counterexample.** M = (p, T) ⊂ Z_p[[T]] in degree 0.
   * **What the lemma needs.** E^{codim}(M) must be p-torsion-free. This holds for G₀ = Z_p^k and
     was not checked in the noncommutative case (gap).
   * **Ext convention.** The p. 14 short exact sequences need Ext over Z_p[[G₀]].
6. **Descent node.**
   * **Borel–Serre.** The contrast with the Borel–Serre compactification is void, because the
     inclusion is a homotopy equivalence.
   * **Uses of Theorem 1.1(4).** The survey never applies it to Conjecture 1.5: its only use is the
     circle example, and Theorem 1.16(4) is used in Proposition 1.21.
   * **SL₂.** l₀ = 0 and q₀ = 1, not both 0 (Example 1.11). The spectral sequence cannot degenerate,
     since H³(G_r, Z_p) ≠ 0.
7. **Other corrections.**
   * **Unsourced claims removed.** "HS needs the torsor condition" and "N ≥ 3 for fine moduli".
   * **Footnote 1.** It cites R. Hill, not a companion paper.
   * **(1.1).** It is stated without proof. A reviewer derivation (vanishing lim¹) was added, and
     Remark 1.15 recorded.
   * **Moved consequence.** The Theorem 1.1(3) consequence moved from CC.2 to CC.3, with a new link
     CC.2 → CC.3.
   * **Next source actions.** Calegari–Geraghty does not prove Theorem 1.1: its §2 is balanced
     modules and its §7.1 works over O[Δ]. The next source actions now point to Emerton's
     interpolation paper, §2.1.

**Links.**

* **CC.6 → R31.2** is kept with an annotation. Emerton's Lemma 5.3.8 uses a finite-cover
  Hochschild–Serre spectral sequence with O/ϖ^s coefficients and then takes limits; it does not
  use Theorem 1.1(4).
* **CC.0 → CC.2 and CC.3 → codimension.** Their reasons were corrected.

### Unverifiable items

No node claim is unverifiable as quoted. Still unread:

* the proofs of the survey's Theorems 1.1, 1.4, 1.16 and 1.18, deferred to [4], [6] and [1];
* Scholze's Theorem 4.1.1;
* [52], [54], [41] and Venjakob [63]. Of these only [52] is in the library, as the arXiv version,
  whose numbering was not checked.

### Questions for the orchestrator

1. **Home of Scholze's Corollaries 4.2.2–4.2.3.** Candidate: TorsionCohomologyInfrastructure:TC.2,
   which requires CC.8. Should Theorem 4.2.1 itself move there too, as an automorphic-section
   comparison?
2. **Theorem 1.1(3) misprint.** Accept the torsion reading provisionally, or wait for the published
   version?
3. **CC.3/CC.5 order.** This remains undecided; see the existing gap.

## 8. EllipticCurveModularity.json (R29.1–R29.6)

**Verdict: accepted.**

| Item | Count |
| --- | --- |
| Nodes | 6: 2 verified, 4 corrected, 0 unverifiable |
| Links | 7 drafted: 5 verified, 1 corrected reason, 1 annotated; 2 supplier links added (9 in the packet) |
| Gaps | 4 → 5 |
| Coverage | 6 stage records (R29.5 `not_read`) |

No stage or node cycle. The new implied stage edges are all transitive in the atlas:
R15.4 → R29.2, R15.5 → R29.3, R27.6 → R29.2, R29.4 → R29.6, R28.6 → R29.4 and R19.4 → R29.4.

### Sources and provenance

All four sources are library copies. Their SHA-256 hashes match the packet:

| Source | SHA-256 |
| --- | --- |
| Serre 1987 | `8048919d…` |
| Faltings 1983 | `0b7fb3e5…` |
| Carayol 1986 | `d4a5fb6b…` |
| Deligne–Serre 1974 | `65b390f6…` |

No source was fetched.

**Catalogue claims confirmed:**

* Mazur's 1978 isogeny paper is absent.
* Mazur–Swinnerton-Dyer and Diamond–Shurman are present.
* The Shimura 1971 entry has no file.

**Beyond the drafter's ranges, the reviewer read:**

* Serre §1.3, Proposition 2, Proposition 4 with its proof, Proposition 5 with its proof, §§3.1.3–3.3,
  and §4.7 through (4.7.5);
* Carayol §§0.1–0.9;
* Faltings, Korollar 3.

### Main corrections

1. **Lemme 5's conductor criterion.** Serre gives it as "on vérifie", without proof.
   * **The drafted justification.** It went through Proposition 5 and v_p(j_E), but Proposition 5 is
     about the weight at p.
   * **The relevant computation.** The Tate curve at l, where ρ_p is unramified at l iff
     p | v_l(j_E).
   * **Status.** New gap, with Serre's references [18], [40], [41], [49] named; none is in the library.
2. **Conjectural labels.** Serre's "(3.2.6?)" is conjectural, like (3.3.1?): the "?" is Serre's own
   subscript label. It says F_p-rationality holds "sauf peut-être" in the unramified case; the drafter
   had "can fail exactly".
3. **Proposition 4 at p = 2.** Serre calls this case "un peu différent, mais se traite de façon
   analogue", so it is declared analogous rather than omitted. The Raynaud uniqueness it cites needs
   e < p − 1.
4. **The φ(N_E) exclusion** in the acceptance tests is not part of Serre's route: ε = 1 comes directly
   from det ρ_p = χ.
5. **R29.4 node.**
   * **Placement.** It contains the isogeny step, which the atlas assigns to R29.5. A placement note
     was added, and R29.5's coverage record now says so.
   * **Level exactness.** Serre does not spell out the exact level; the reconstruction through
     Carayol's Corollaire and Remarque (2) is marked as the reviewer's.
   * **Locator.** Korollar 2 is on p. 361.
6. **Missing cross-roadmap suppliers.** Two were added after reading the stage texts:
   * `FaltingsFinitenessAndIsogenyTheorems:R28.6`, which exports isogeny detection, for Korollar 2;
   * `AutomorphicGaloisRepresentations:R19.4`, whose text is "deduce conductor equality and the bad
     Euler factors", for Carayol's Corollaire.
7. **R29.6 node.**
   * **Unsourced remark.** "Now a theorem of Khare–Wintenberger and Kisin" is not in the source.
   * **Conditionality.** Theorem 5 is also conditional on (3.3.1?).

**Verified:** the oddness argument for absolute irreducibility (a note was added for the non-split
case) and the pigeonhole and norm argument, with the locator for (3.1.6)'s citation of Lemme 6.11
added.

### Unverifiable items

None among node claims as quoted. Still unread:

* Mazur 1978, which is not in the library;
* the Eichler–Shimura construction of E_F;
* the bad coefficients and the newform theory;
* Ogg's formula.

### Questions for the orchestrator

1. **The isogeny step.** Should it be split out of the R29.4 node into R29.5, to match the atlas?
2. **The φ(N_E) exclusion.** R29.2's stage text demands it, but Serre's route does not need it. Keep
   the stage text, or relax it?

## 9. EXT-07/FaltingsFinitenessAndIsogenyTheorems.json (R28.1–R28.6)

**Verdict: accepted.**

| Item | Count |
| --- | --- |
| Nodes | 32: 20 verified, 12 corrected, 0 unverifiable |
| Links | 40 drafted: 30 verified, 5 corrected or annotated, 3 re-pointed, 2 removed; 5 supplier links added (43 in the packet) |
| Gaps | 9 → 11 |
| Coverage | 6 stage records, all `partial` |

After the fixes there is no stage cycle, no node cycle and no dangling endpoint. The remaining new
implied stage edges are acyclic: R34.2 → R28.2, LI.4 → R28.2 and LI.4 → R28.4 are new; the others
are transitive in the atlas.

### Sources and provenance

All sources are library copies. Their SHA-256 hashes match the packet:

| Source | SHA-256 |
| --- | --- |
| Faltings 1983 | `0b7fb3e5…` |
| Erratum 1984 | `e9d9269b…` |
| Raynaud 1974 | `05cad2f5…` |
| SGA 7 I, `R02_SGA7I.pdf` (added by the reviewer) | `17286b0f…` |

No source was fetched.

**How the sources were read.**

* **Faltings.** The OCR layer is unusable for formulas, so all 18 pages and the erratum were read on
  page images. Zooms were used at p. 356 (Lemma 3), p. 361 (Q_l) and p. 365 (m > 2).
* **SGA 7 I.** The scan has no text layer. Exposé IX §§7.3–7.4 was located and read on page images.

### Structural fixes

1. **The stage cycle R28.3 → R28.4 → R28.3.** It was broken by re-parenting
   `…R28.4/reduction-to-a-principally-polarized-semiabelian-model` to R28.3; the id changed. This
   follows the HANDOFF suggestion and fits R28.3's text on "polarisations needed in the Tate-module
   argument". No packet or data file references the old id; `EXT-07/HANDOFF.md` still mentions it.
2. **The dangling link** from `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/determinant-…` was
   removed.
   * **Why.** That packet was absent when the review started, and no atlas stage owns Raynaud §4:
     R07.1's text covers §§2–3 only.
   * **Later development.** The EXT-07 continuation run then wrote
     `FiniteFlatGroupsAndIntegralPadicHodgeTheory.json`, which contains the node. That packet is
     unreviewed and outside this assignment.
   * **Status.** A gap records the link for restoration.
3. **Unsupported link removed:** Korollar 1–2 → Bemerkung 2. The source derives Bemerkung 2 from
   Satz 6 by Zarhin's method.
4. **RP.4 link re-pointed.** It now comes from the curve corollary, as its own reason requires.
   RP.4 owns the Parshin construction, which the Satz 7 node duplicates (gap).
5. **Supplier links added**, each after reading the supplier's stage text:
   * R34.2 (Weil bound) → the §4 determinant identity and → Satz 5. The drafted claim that the
     Weil-bound use in Satz 6 is the "only use" besides Satz 5 was false.
   * LI.4 (class field theory, Chebotarev) → the §4 determinant identity, → Korollar 2 and → the
     Raynaud determinant step.

### Main source corrections

1. **Q_l, not Z_l.** Both the quaternion coefficients a, b, c, d and the idempotent in
   End_K(A) ⊗ Q_l are over Q_l (p. 361, zoomed).
2. **Erratum.** Part (a) requires isomorphisms for **n ≧ 1**. Part (b) concerns G ∩ H_i and says only
   "wieder wie in a) weitermachen".
3. **Section 4 base extension.** It is K ⊆ K_i with G_i = G ∩ H_i. The §4 determinant node is now
   qualified by the erratum's shift to A_m.
4. **The principal-polarization reduction** needs no Zarhin trick. A maximal isotropic quotient of
   ker λ after a field extension gives exactly Faltings' "Isogenie vom Grad √d" (Korollar 3), so the
   gap was re-diagnosed. The drafter had also written the Korollar 3 isogeny as "l-power degree".
5. **Other printed details.**
   * Satz 5 has #(M/lM)* **≦** l^{8g²}, and its last step (traces → isogeny) is implicit.
   * The Parshin cover has degree **m > 2**.
   * Chart (b) in the log-singularity sketch uses ε.
   * Lemma 3's first estimate, as typeset, is log|ratio| ≤ …; it was annotated.
6. **SGA 7 orthogonality located.** IX (7.4.2)–(7.4.3), p. 409: the fixed-part pairing factors
   through the abelian parts. Its proof via VIII 3.5 was not read.
7. **R28.6 coverage.** The Faltings inputs for "finitely many rational prime-degree isogenies" are
   present: Satz 6 with d = 1 and Korollar 1. The rest is R29.1's elementary degree argument, not a
   further source.

### Unverifiable items

None among node statements. Still unread imports:

* Tate, *p-divisible groups*;
* Zarhin [16];
* Baily–Borel, Namikawa and Deligne–Mumford;
* Faltings [6];
* Hermite–Minkowski with ramification restricted to S;
* SGA 7 I VIII 3.5;
* Raynaud's appendix;
* Torelli, de Franchis and Parshin [9];
* local Jordan–Zassenhaus.

All of these are recorded in gaps.

### Questions for the orchestrator

1. **Re-parenting.** Confirm the re-parenting of the polarization-reduction node to R28.3; the
   HANDOFF text still cites the old id.
2. **Raynaud Théorème 4.1.1.** The FiniteFlatGroups packet now exists, unreviewed. After it is
   reviewed, extend R07.1 to Raynaud §4.1, as its HANDOFF proposes, and restore the removed link; or
   keep the theorem as an import here.
3. **Satz 7 versus RP.4.** Keep the Satz 7 node as Faltings' record of the Parshin construction, or
   merge it into RP.4.
4. **Korollar 3.** It sits under R28.4 but its content is "finiteness within an isogeny class" (the
   R28.3 title). It consumes Korollar 1, so moving it would need that dependency re-examined.

## 10. AutomorphicBundles.json (B0–B5; additional packet found in EXT-10)

**Verdict: accepted.**

| Item | Count |
| --- | --- |
| Nodes | 3: 1 verified, 2 corrected, 0 unverifiable |
| Links | 3: 2 verified, 1 annotated |
| Gaps | 4, with one detail updated |
| Coverage | 9 stage records; 6 are `not_read` (the summary said "Five"; corrected) |

No stage or node cycle, and no new implied stage edge.

### Sources and provenance

Both sources are library copies. Their SHA-256 hashes match the packet:

| Source | SHA-256 |
| --- | --- |
| Lan, *An Example-Based Introduction to Shimura Varieties* | `d9a3e755…` |
| Harris–Lan–Taylor–Thorne, *On the rigid cohomology of certain Shimura varieties* | `abecfd04…` |

No source was fetched.

**Catalogue and library claims confirmed:**

* Deligne's *Variétés de Shimura* text file is 43 bytes.
* Lan's PEL-compactifications thesis is present with text.
* The Milne items are as listed; Milne 1990 and Harris's vector-bundle paper are absent.

### Main corrections

1. **Lan's cocycle misprint.** Lan does print j(γ′γ, Z) = j(γ′, Z) j(γ, Z), as confirmed on the page
   image of p. 49. The drafter's correction to j(γ′γ, Z) = j(γ′, γZ) j(γ, Z) stands. Its evidence was
   two extractions of the same text layer, which cannot exclude an extraction artefact; it has been
   replaced by the page-image check.
2. **"Exactly those" bundles.** The drafter said bundles from G(C)-representations are *exactly*
   those with integrable connections. That is not in the source, which states one direction only; the
   B2 stage text also warns against the converse. The acceptance test "a representation not extending
   to G(C) gives a bundle with no integrable connection" was replaced: it is false, since every
   holomorphic bundle on the open modular curve is trivial.
3. **W^sub.** Lan says the global sections of W^sub are "(roughly speaking) useful for studying cusp
   forms"; the node had identified them with cusp forms. HLTT identifies them with cusp forms in its
   own setting.
4. **Link B3 → B4.** Kept, since the B4 stage text requires the comparison. What the source actually
   says is narrower: for neat Γ, bounded growth extends a *line-bundle* section over the *minimal*
   compactification. The link was annotated to say so.

### Unverifiable items

None among node claims. Still unread:

* the constructions of the canonical extension (Mumford, Harris) and of the log connection (Deligne);
* the canonical principal bundle (B0, B1);
* Hecke correspondences on compactifications (B5).

### Questions for the orchestrator

1. **Deligne's *Variétés de Shimura*.** The library copy has no text layer. Should it be read on page
   images, as was done here for SGA 7 I, to unblock B1?
