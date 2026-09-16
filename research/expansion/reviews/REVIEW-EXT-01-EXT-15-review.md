# Independent review REVIEW-EXT-01-EXT-15

Reviewer: independent-review-REVIEW-EXT-01-EXT-15. Date: 2026-09-15. Scope: the EXT-01 and
EXT-15 draft packets named in the review assignment, plus the packets present in those job
directories when the review started. Method: every node statement, hypothesis list, proof
step, acceptance item, locator and excerpt was compared with the cited passage of the source;
every link was checked for direction, for the place where the consumer uses the source node's
output, for the existence of both endpoints, and (for cross-roadmap and cross-packet links) for
whether the supplier's stated scope covers the consumer's need. Every `parentStageId` and
coverage `stageId` was checked against `data/atlas.json`. Implementation status was left
`unchecked`. Packet `status` stays `partial`; each packet carries a top-level `review` object
with per-node verdicts. Validation: `json.load`, then `scripts/decompositions.py`
`merge_decompositions` run on a scratch copy of the atlas (structure, endpoints, hierarchy and
global acyclicity).

Sections are appended packet by packet as each packet is saved.

---

## 1. GeneralAlgebraicKTheory.json (EXT-01)

**Review status: accepted.** Nodes: 24 (6 verified, 18 corrected, 0 unverifiable). Links: 55
(all endpoints exist; 17 point to StableHomotopyKTheory packet nodes; 7 reasons rewritten or
annotated). Gaps: 7 → 8 (one added, three extended). Coverage: 15 stage records, all ids exist
and belong to the roadmap.

### Sources checked

All six PDFs are in the library; SHA-256 of each matches the packet entry. Text layers were
extracted to the reviewer's scratch directory.

| Source | Passages read by the reviewer |
| --- | --- |
| Quillen, Higher algebraic K-theory I (LNM 341) | Introduction; §2 complete; §3; §4; §5 (PDF 2, 15–32). Scan: PDF page = LNM page − 84. |
| Weibel, K-book II | §9.1–9.3 (pp. II.87–93) |
| Weibel, K-book IV | 1.10, 1.11.1–1.11.3, Ex. 1.14–1.22 (pp. IV.7–9, 16); 2.10.1–2.10.2 (p. IV.22); §6 with exercises; §7; §8 with exercises; §10 (pp. IV.53–81) |
| Weibel, K-book V | §1 complete; §2 complete; §3 through 3.7.3 and exercises; §4; §5; Example 6.1.2 (pp. V.1–38) |
| Waldhausen, Algebraic K-theory of spaces (LNM 1126) | §1.3–§1.5, printed pp. 328–347, every page read from 80 dpi renderings (the OCR text layer is unreliable, and several of the packet's excerpts from these pages could not be matched in it) |
| Schlichting, Negative K-theory of derived categories (2003 preprint) | complete |

### Corrections made in place

1. **K.3/resolution-theorem.** Transfers: Quillen's hypothesis is B ∈ P_∞(A) (a finite
   resolution by *finitely generated* projective A-modules), not "finite projective
   dimension"; the projection formula (5) is for x ∈ K₀A, y ∈ K_iB, via
   (B ⊗_A X) ⊗_B Y ≅ X ⊗_A Y (the packet had the tensor factors in the wrong roles). The
   acceptance item citing Weibel V Example 3.5.1 named the wrong map: the vanishing transfers
   are f_*: K(R) → K(R[s]) and G(R) → G(R[s]) for f: R[s] → R, s ↦ 0. OCR artefact in an
   excerpt normalized.
2. **K.5/relative-K-theory-and-excision-boundary.** The claim that support K-theory K(R on S)
   "differs from the relative theory of R → S⁻¹R in degree zero" is contradicted by Weibel V
   Theorem 2.6.3, which proves K(R on S) → K(R) → K(S⁻¹R) is a homotopy fibration. Replaced by
   what the source says: the cokernel of K₀(R) → K₀(S⁻¹R) is invisible to the connective fibre
   (Waldhausen's relative theory records it as K₋₁(f)), and H_S(R) need not model the fibre when
   S has zero divisors (Ex. 2.9).
3. **K.3/cofinality-degree-zero-correction.** Weibel IV Exercise 6.6 was presented as the proof
   of exact-category cofinality 6.4.1; it proves only the special case B = {B : φ[B] = 0}.
   Weibel (p. IV.56) says the general case needs Waldhausen cofinality 8.9.1; the step now says
   so.
4. **K.6/agreement-and-vanishing-of-negative-K.** "R must be noetherian (or coherent)":
   Theorem 9.3 needs a *noetherian* abelian category, so "(or coherent)" was removed. Gabber's
   Remark 9.8 was misread as saying vanishing needs the noetherian hypothesis; it says
   noetherian vanishing plus filtered colimits does not give Conjecture 9.7. Imports behind
   agreement for noncommutative rings ([CP97], [Kar71], [Ped84]) named.
5. **K.7/invariance-products-and-colimits.** Schlichting Lemma 6.3 (filtered colimits) holds
   only for IK_n, n ≤ 0. The spectrum-level derived invariance now cites Theorem 11.10, as
   Schlichting does in 11.14, since 11.15 is a statement about spaces.
6. **K.3/abelian-localization-theorem.** Quillen's reduction of assertion (a) to the maps
   i_{V!}: 0 ↣ V (factorization, duality, composition; LNM p. 114) was missing and was added.
   The "abelian categories only" remark now cites Quillen's introduction; [Swan, p. 115] recorded.
7. **K.6/schlichting-set-up-and-negative-localization.** Remark 1.9 concerns the Verdier
   quotient of the *idempotent completions*.
8. **K.6/frobenius-pairs-flasque-envelope-and-suspension.** Theorem 2.9 also requires R to be
   c-compactly generated.
9. **K.1/Q-construction-universal-property.** The packet-authored proof step had the
   composition order reversed; it is j′^! i_! (injective followed by surjective) that relation
   (b) rewrites. Quillen gives no proof ("it is clear").
10. **K.1/pi1-BQ-equals-K0.** Loop notation corrected to Weibel's 0 ↣ A ↠ 0 (6.2.1).
11. **K.4/waldhausen-additivity-theorem.** In the sublemma homotopy the forced map is A → Ā
    (the packet had Ā → A). Imports named: Waldhausen Proposition 1.1.4 (pp. 332, 340), the
    end of §1.6 (N simp(Y) → Y, p. 337) and the degreewise realization lemma (p. 336).
12. **K.4/gillet-waldhausen-comparison.** Remark 2.2.1 restated with its change of ambient
    quasi-isomorphisms (computed in left exact functors), rather than "replace A by A′".
13. **K.4/waldhausen-approximation-theorem.** The change-of-cofibrations item (V 2.5.1) lacked
    its saturation and cylinder hypotheses.
14. **K.4/waldhausen-localization-fibration-theorem.** Weibel's proof cites IV Ex. 8.14; the
    statement used (co wC ≃ wC) is IV Ex. 8.15. Noted.
15. **K.2:plus/plus-equals-Q.** Exercise 7.10 is stated for commutative R (added); the Ex. 7.4
    remark concerns every A, not only non-split ones.
16. **K.3/additivity-for-exact-categories.** The graded-ring acceptance item needs a
    non-negatively graded ring (Quillen §3 Proposition; Weibel V 1.8.1).
17. **K.4:construction/waldhausen-categories-and-S-construction.** "Objectwise cofibrations do
    not suffice" reworded: the sources *define* the latching condition; the insufficiency of
    objectwise cofibrations is the roadmap's warning, not a proved statement.
18. **K.7/biexact-pairings-and-products.** The swallowing lemma (§1.6, unread) named; the Loday
    acceptance item restated to what IV Theorem 1.10 actually says (plus-construction product).

### Links

- `K.4/waldhausen-approximation-theorem → K.4/gillet-waldhausen-comparison`: the reason cited
  perfect complexes (V 2.7.2), which belong to the approximation node, and Theorem 2.2 does not
  use approximation. Re-pointed to the actual use: the node's split-cofibration comparison
  (V Ex. 2.3) is a change of cofibrations, derived from approximation in V 2.5.1.
- `StableHomotopyKTheory:H.2/bisimplicial-realization-lemma → K.4/waldhausen-additivity-theorem`:
  **supplier scope does not cover the use.** Waldhausen uses the *degreewise* realization lemma
  (a degreewise homotopy equivalence of simplicial spaces realizes to a homotopy equivalence);
  the supplier node states only the homeomorphism between iterated and diagonal realizations.
  Annotated; new gap "Degreewise realization lemma for simplicial spaces".
- `StableHomotopyKTheory:H.4/quillen-localization-of-homology → K.2:plus/plus-equals-Q`: the
  supplier states Theorem 4.8 (group completion) but not Exercises 4.6, 4.7 and 4.7.1, which
  Proposition 7.6 and the proof of 7.1 also use. Annotated; those exercises stay in the
  K.2:plus coverage.
- Cross-roadmap links annotated as exercise-level or with scope notes: `→ KTheoryLowDegrees:U.6`
  (Ex. 7.9), `→ K2SymbolsBrauer:T.3:localization-comparison` (Ex. 5.1),
  `→ K2SymbolsBrauer:T.2:graded-map` (associativity of products quoted),
  `→ SchemeKTheoryOperations:S.2` (S.2's text does not mention negative degrees; the supply
  matters through the nonconnective K(X) of K.6).
- All other links verified at the cited proof location (Quillen, Weibel, Waldhausen page images,
  Schlichting).

### Unverifiable items

None among the node statements. Content resting on imports that were not read is flagged in
the nodes and gaps. The main imports are Waldhausen §1.1, §1.6 and §1.9; Waldhausen 1978
Lemma 5.2; Suslin's excision theorem; Thomason–Trobaugh 1.9.8, 1.11.7 and 6.6(b); Thomason 1993
and 1997; Balmer–Schlichting; Cárdenas–Pedersen; Keller; Popescu; [Swan]; [SGA 6]; [Bass]; and
Loday and Gillet for products.

### Sources fetched

None for this packet (all sources in the library).

### Validation

`json.load` passes. `merge_decompositions` with this packet alone passes, with the 17 links into
StableHomotopyKTheory deferred as designed. Jointly with StableHomotopyKTheory (placeholder
review, in memory only) it passes with no deferred links and no cycle.

### Questions and decisions for the orchestrator

1. **Additivity versus S.-delooping ordering.** The atlas has
   `StableHomotopyKTheory:H.5:S-delooping → GeneralAlgebraicKTheory:K.4`. Waldhausen (§1.3
   p. 330, Proposition 1.5.3 via 1.5.5) and Weibel (IV 8.5.5 via V 1.7) prove the delooping
   *from* additivity. The packet routes node-level links the right way. The stage-level edge
   should be reversed, or additivity moved into K.4:construction. Waldhausen's remark on p. 333
   notes that, given §1.3, the two statements are equivalent, but the proof read goes additivity
   ⇒ delooping.
2. **New stage-level edges implied by links:** `GeneralAlgebraicKTheory:K.3 → ArithmeticKTheory:N.1`
   (transfer; N.1 currently requires only K.7) and
   `GeneralAlgebraicKTheory:K.6 → SchemeKTheoryOperations:S.3` (nonconnective localization;
   S.3 currently requires K.3 and S.2). Both are acyclic in the joint validation.
3. **Supplier request:** a statement and proof of the degreewise realization lemma for
   simplicial spaces. StableHomotopyKTheory:H.2 could own it; it is used by Waldhausen §§1.4–1.5
   and Weibel V 1.3.

---

## 2. StableHomotopyKTheory.json (EXT-01)

**Review status: accepted.** Nodes: 25 (17 verified, 8 corrected, 0 unverifiable). Links: 28
(one re-pointed, one annotated; all endpoints exist). Gaps: 7 (two extended). Coverage: 12
stage records, all ids exist and belong to the roadmap (three `remaining` lists extended).

### Sources checked

| Source | Passages read by the reviewer |
| --- | --- |
| Quillen, Higher algebraic K-theory I | §1 complete (PDF 5–15; OCR text layer) |
| Weibel, K-book IV | §1 (1.1–1.16 and Exercises 1.1–1.15), §2 complete, §3 complete with exercises, §4 complete with Exercises 4.1–4.14, §8 (pp. IV.2–75) |
| Carlsson, Deloopings in algebraic K-theory (Handbook of K-theory I.1) | §1.1–§1.2 (printed pp. 3–10); SHA-256 of the library copy matches |
| Hatcher, Algebraic Topology | §4.2 pp. 373–374 and p. 420 (PDF 382–383, 429) |

### Sources fetched (provenance)

- Hatcher, *Algebraic Topology*, author's online edition: fetched on 2026-09-15 at 22:11 UTC from
  https://pi.math.cornell.edu/~hatcher/AT/AT.pdf into the reviewer's scratch directory (not the
  repository). SHA-256 `bebb3032bf9021b956da3bd070eb6c67dc662cf849be9cdf6679f677560e5618` is
  identical to the packet entry; PDF CreationDate is 26 October 2022. This provenance is recorded
  in the packet's source entry.

### Corrections made in place

1. **H.6/l-adic-completion-milnor-sequence.** An acceptance item used Weibel's printed example
   "K₁(C; Z_ℓ) is Z_ℓ" (p. IV.22). By the formula of 2.9 itself, the Tate module of π_{n−1}(E)
   contributes to π_n(E; Z_ℓ), so the Tate module of K₁(C) = C^× lies in K₂(C; Z_ℓ). The item
   was replaced by an index check, and the printed example is flagged as unusable as a test.
2. **H.3/plus-construction-universal-property.** The statement said the reduction of
   Theorem 1.5(3) to (2) was source-checked, but Weibel gives only "in particular". The
   argument is now marked as packet-authored. Exercise 1.3 was misdescribed as being about
   "an H-space map"; it concerns any map between H-spaces of CW type.
3. **H.5:S-delooping/iterated-S-construction-omega-spectrum.** The pairing K(A) ∧ K(B) → K(C)
   needs the biexact cofibration condition of Weibel IV 8.11 (added). The V.1.7 input is now
   decomposed in GeneralAlgebraicKTheory and linked.
4. **H.4/gl-telescope-plus-comparison.** Theorem 4.10 imports the perfectness and normality of E
   from [Bass, p. 355] (added as an unread import).
5. **H.2/bisimplicial-realization-lemma.** Scope note added: the node is Quillen's
   diagonal/iterated-realization homeomorphism, not the levelwise-equivalence theorem (Weibel IV
   3.6.1(i)) that Waldhausen §§1.4–1.5 need.
6. **H.2/quasi-fibration-lemma.** An acceptance item said the lemma "yields the levelwise
   equivalences" in the proof of Theorem A; in fact it promotes them to an equivalence of
   realizations.
7. **H.5:spectra/omega-spectra-and-eilenberg-maclane.** Traceability note: the Ω-spectrum and
   connectivity conventions and the integral colimit formula for π_n are used, not defined, in
   the passages read. Weibel IV 2.3.1 displays the formula only with Z/ℓ coefficients.
8. **H.1/nerve-and-classifying-space.** OCR garbage in a Quillen excerpt normalized.

### Links

- **Re-pointed:** `H.1/homology-of-small-categories → H.3/acyclic-map-homology-criterion`.
  Lemma 1.6 is stated and proved for arbitrary connected CW complexes and does not use the
  comparison of bar homology with the homology of BC. The genuine use is in Lemma 1.3.1, whose
  Serre spectral sequence is written with group homology H_p(G; H_q(F̃; Z)). The link now
  targets `H.3/acyclic-spaces-and-maps`, with locator Weibel IV 1.3.1 proof, 3.4.2 and 3.5.1.
- `H.3/acyclic-map-homology-criterion → H.3/plus-construction-universal-property` annotated:
  Weibel indicates Remark 1.8.1 through Exercise 1.3 (relative Hurewicz), so routing
  acyclicity through Lemma 1.6 is packet-authored.
- Cross-roadmap scope checks passed: `KTheoryLowDegrees:U.1` (GL, E(R) perfect normal, Whitehead)
  supplies Theorem 4.9's needs; `KTheoryLowDegrees:Z.1` (projectives as summands of free modules)
  supplies the cofinality input; the consumers `K2SymbolsBrauer:T.1:plus`, `K3BlochGroups:V.1`
  (exercise-level supply, flagged), `GeneralAlgebraicKTheory:K.2:plus` and
  `KTheoryFiniteLocalFields:L.1` all state the needs the links claim. Weibel IV Theorem 1.12 and
  Corollary 1.13 (p. IV.10), cited by the L.1 link, were checked.

### Unverifiable items

None among node statements. Unread imports stay recorded as gaps: Dold–Lashof, Milnor 1957/1959,
Tornehave, Gabriel–Zisman, Segal 1968/1974, CCMT, Grayson, Berrick, Gersten, [Bass, p. 355],
May–Thomason, and the Milnor lim¹ sequence.

### Validation

`json.load` passes. `merge_decompositions` on this packet alone passes. Jointly with
GeneralAlgebraicKTheory (both carrying accepted reviews) it passes with no deferred links and no
cycle.

### Questions and decisions for the orchestrator

1. **New stage-level edges implied by links:** `KTheoryLowDegrees:U.1 → StableHomotopyKTheory:H.4`,
   `KTheoryLowDegrees:Z.1 → StableHomotopyKTheory:H.4` and
   `StableHomotopyKTheory:H.2 → KTheoryFiniteLocalFields:L.1`. The atlas has them only
   transitively or not at all; the joint validation shows them acyclic.
2. **Levelwise realization lemma.** Assign an owner (H.2 is natural). It is required by
   GeneralAlgebraicKTheory:K.4 and is only cited in Weibel IV 3.6.1(i).
3. **Weibel IV Exercises 4.6, 4.7 and statement 4.7.1** (invertible actions and the fibration
   S⁻¹S → S⁻¹X → ⟨S, X⟩) are used by the + = Q proof but live in no node. Decide whether H.4
   should own them.

---

## 3. EulerSystemsCyclotomicMainConjecture.json (EXT-15)

**Review status: accepted.** Nodes: 16 (4 verified, 12 corrected, 0 unverifiable). Links: 16 → 15
(one removed, three annotated). Gaps: 6 → 7 (one added, two corrected or extended). Coverage:
5 stage records (L0–L4), all ids exist and belong to the roadmap.

### Sources checked

All three sources are in the library, and their SHA-256 values match the packet.

| Source | Passages read by the reviewer |
| --- | --- |
| Rubin, *Euler systems* (author draft) | Ch. II §2 (Hyp(K,T), Hyp(K,V), Def. 2.1, Thms. 2.2, 2.3, 2.10 with proof, Remarks 2.4–2.13) and §3 (to Prop. 3.7 with proof), pp. 23–29; Ch. III §1 (Lemma 1.1 with proof), §2 complete, §3, pp. 33–40 |
| Greither 1992 | §1 pp. 451–454, §2 pp. 455–465, §3 pp. 468–472; pp. 451, 452, 468, 469 and 470 re-read from page images because the text layer garbles formulas |
| Rodrigues Jacinto–Williams, arXiv:2309.15692v2 | §13.2–13.4, pp. 66–68 |
| Kato, Astérisque 295 | Example 13.2, to check the atlas-text gap |

### Corrections made in place

1. **L1/finite-level-error-tolerant-bound-and-its-hypotheses.** The statement gave the conditions
   of the *weaker* Hyp(K,V) (dim_Φ V/(τ−1)V = 1, V irreducible) under the name Hyp(K,T).
   Rubin's Thm. II.2.2 needs Hyp(K,T): T/(τ−1)T free of rank one over O and T ⊗ k irreducible.
   The standing hypothesis loc^s_{Σp}(c_K) ≠ 0 of Thm. II.2.10 was also added.
2. **L4/greither-odd-character-main-conjecture-with-half-normalisation.** The draft's
   normalisation "G_p(u^s − 1, ψ) = L_p(1 − s, ψ)" is wrong; the page image of p. 452 gives
   L_p(s, ψ) = G_p(u^s − 1, ψ) (s ≠ 1 for ψ trivial), consistent with the pole factor (T − q₀).
   The integrality statements concern (1/2)G_p. In the proof of 3.1 ⇒ 3.2, the Cor. 2.14 step
   lacked the twist (1) and the involution *, and Prop. 3.4 gives char(Y_ρ) = char(X_χ^*(1)),
   not char(A_∞(1)). The same normalisation error was corrected in the L4 coverage item and in
   the normalisation-dictionary gap.
3. **L0/character-twist-and-the-restriction-dictionary.** Formula (4) was transliterated with
   ζ_f^{δp} where Rubin has ζ_{fp}^δ. The statement also said C_{n,χ} is generated by "the same
   product formula", although by (6) the n = 0 generator differs from c_Q by the exponent
   1 − χ⁻¹(p).
4. **L3/unconditional-statement-versus-the-vandiver-isomorphism.** RJW define
   X∞⁺ = Gal(M∞⁺/F∞⁺) with F_n = Q(μ_{p^n}); the draft had "F_n the real cyclotomic fields" and
   a base field L∞⁺. The claim that Thm. 13.8 is "exactly" Rubin III.2.10 ignored the trivial
   character of Gal(Q(μ_p)/Q), which Rubin excludes. A new gap records it.
5. **L2/cyclotomic-iwasawa-divisibility.** The claim that Thm. III.2.7 holds at p = 2 stretched
   Rubin's remark, which is only about Thm. II.3.3; it was softened. The node now flags the
   clash between Rubin's semilocal Y∞ = lim (L_{n,p}^×)^ and the atlas's class-group Y∞.
6. **L1/vanishing-of-the-error-terms-in-the-cyclotomic-twist.** Lemma III.1.1(ii) needs χ not
   congruent to ε_cyc; for p > 2 evenness supplies this, not nontriviality.
7. **L3/local-unit-index-and-the-p-adic-L-function.** Greither's Cor. 2.14 holds over Q_pΛ_ρ, so
   it fixes the characteristic ideal only up to powers of p. For an even χ of arbitrary
   conductor, Rubin attributes Thm. III.2.9(ii) to Gillard.
8. **L3/main-conjecture-endpoint-for-the-p-ramified-galois-group.** Rubin states multiplicativity
   of char for all finitely generated modules. The real implicit requirement is
   char(A∞^χ) ≠ 0 for the cancellation.
9. **L1/analytic-class-number-upgrade-at-finite-level.** The product-of-components mechanism,
   stated as fact, is packet-authored, and it must handle the χ(p) = 1 components that
   Thm. 2.3 excludes (Rubin, Remarks 2.5).
10. **L2/iwasawa-theoretic-euler-system-bound.** The "Euler system for (T, K∞)" requirement was
    added, and a misreading of Rubin's elliptic-unit footnote was fixed.
11. **L0/cyclotomic-unit-euler-system-for-Zp-one.** "For every prime ℓ ≠ p" added; the
    compatibility remark is marked packet-authored.
12. **L4/greither-arithmetic-consequences-at-p-equals-2.** Thm. B is not "equivalent" to Thm. A
    in Greither; he shows that B implies A.

### Links

- **Removed:** `L3/main-conjecture-endpoint-for-the-p-ramified-galois-group →
  L4/greither-even-character-divisibility`. Its own reason says "No statement is transported
  across this edge". Greither's proof of Thm. 3.1 uses Rubin's appendix to Lang (Lemma 2.3), not
  Rubin III.2.10. The comparison stays open under the normalisation gap.
- `ColemanPowerSeries:L4 → L3/local-unit-index-…` annotated. The supplier (RJW Thm. 12.23)
  covers the tower Q(μ_{p^∞})⁺, which is what the L3 stage endpoint needs, but not Rubin's
  statement for general conductor f (Gillard).
- `IntegralIwasawaTheory:L1 → L3/main-conjecture-endpoint-…` annotated similarly: the supplier
  states the four-term sequence for RJW's tower.
- `L3/main-conjecture-endpoint-… → L3/unconditional-statement-…` annotated: the trivial character
  and the I(Γ⁺)ζ_p/L_χ dictionary are not covered.
- All other internal links verified at the cited proof locations.

### Unverifiable items

None among node statements. Unread imports remain as gaps: Rubin Ch. IV, V, VII and Appendix D;
[Ru3]; [MW]; [Iw3]; Gillard; Greither's proof of Thm. 3.1 and §4; Washington 2nd edition
(catalogue record present but no file, as the packet says).

### Validation

`json.load` passes. `merge_decompositions` on this packet passes with no deferred links and no
cycle.

### Questions and decisions for the orchestrator

1. **Trivial-character component** of the plus-part main conjecture (RJW Thm. 13.8). Neither
   Rubin III.2.10 nor the removed Greither link supplies it; assign it (L3 or
   IntegralIwasawaTheory).
2. **Supplier scope.** ColemanPowerSeries:L4 and IntegralIwasawaTheory:L1 state the
   Q(μ_{p^∞})⁺ case only. If the atlas wants Rubin's general-conductor statements, a
   Gillard-type local-unit theorem needs an owner.
3. **New stage-level edge** implied by a link: `ColemanPowerSeries:L4 →
   EulerSystemsCyclotomicMainConjecture:L3`. The atlas has it only transitively, through L0;
   it is acyclic in validation.

---

## 4. GrossZagierAndArithmeticHeights.json (EXT-15)

**Review status: accepted.** Nodes: 9 (2 verified, 7 corrected, 0 unverifiable). Links: 12, all
kept (one reason made precise). Gaps: 6 (two corrected, one extended). Coverage: 10 stage records
(GZ.0-GZ.9), all ids exist and belong to the roadmap; GZ.9 is honestly `not_read`.

### Sources checked

Both sources are in the supplied library and their SHA-256 values match the packet
(`6a87b131...` for the monograph, `e4c4eaeb...` for the erratum).

| Source | Passages read by the reviewer |
| --- | --- |
| Yuan-Zhang-Zhang, *The Gross-Zagier Formula on Shimura Curves* | Chapter 1, pp. 1-19 in full; Chapter 7 opening and Sec. 7.1, pp. 206-215 in full (7.1.1-7.1.7). Additionally, to check locators the packet cites without claiming to have read them: Thm. 3.15 (p. 84), the two descriptions of Z(x)_U (p. 93), Thm. 3.21 (p. 105), and pp. 23, 33, 43 for the three passages the erratum's measure items correct |
| Yuan-Zhang-Zhang, *Erratum* (28 June 2026) | Items 1-64 in full, and Sec. 2 on the definition of the special cycle |

A rendering of printed p. 17 was inspected with `pdftoppm` because the assumption on degenerate
Schwartz functions names `S^1` twice where one expects `S^2`.

### Fetched sources

None. No source was fetched from the network for this packet.

### Corrections made in place

1. **GZ.8/general-quaternionic-gross-zagier-identity.** The statement had "B a quaternion algebra
   over F" and "E a quadratic field extension of F", dropping the two standing hypotheses the
   whole theory rests on: B is an **incoherent** quaternion algebra over the adeles with #Sigma
   odd, totally definite at infinity (Sec. 1.2.1), and E/F is **totally imaginary** (Sec. 1.3.1).
   Corrected in the statement and hypotheses, with a source entry for the two subsections.
2. **GZ.7/degenerate-schwartz-functions-....** The last step of the proof was recorded as
   "automorphy plus density forces it to vanish". The source says the opposite: density upgrades
   the approximation to the identity (1.5.6), whose right-hand side is *a priori not zero* and is
   killed only by being perpendicular to sigma via Thm. 1.3, because each nearby B(v) has the
   wrong ramification set. Statement, proof step and one acceptance item rewritten.
3. **GZ.4/saito-tunnell-dichotomy-....** The spherical value alpha = 1 was recorded without the
   source's first condition, B = M_2(F) split. Added to the statement, the excerpt and an
   acceptance item.
4. **GZ.0/root-number-and-measure-normalisation-corrections.** Erratum item 15 was placed "in the
   main theorem"; it corrects a sentence at book p. 43, inside the Chapter 2 proof of the
   Waldspurger formula, where vol(T(F)Z(A)\T(A)) = 2L(1,eta) produces the factor 4L(1,eta)^2.
5. **GZ.0 and GZ.4 acceptance items.** Both asserted that rescaling a local pairing by c changes
   alpha_v by c^{-1}. The pairing enters the defining integral linearly, so alpha_v changes by c;
   it is the global compatibility that pins the product of the local rescalings to 1.
6. **GZ.6/generating-series-....** An acceptance item asserted that the constant of (1.5.5) "is
   the bridge" converting 8L(1,eta)^2 into 4L(1,eta)^2. The packet does not derive that, and the
   sections where it is derived were not read; restated as a check with those sections named.
7. **GZ.3/normalised-hodge-class-....** The standing setting of Sec. 1.2.1 (totally real F,
   incoherent totally definite B) was not recorded; a hypothesis and a source entry were added.
8. **GZ.2/hodge-index-theorem-....** Nothing recorded was wrong. The node was *extended* with
   Secs. 7.1.2-7.1.3 and 7.1.6-7.1.7, read during this review and previously listed as unread:
   the curve-case factor of one half, the Gillet-Soule formula (7.1.1) with the log Nv convention,
   the admissible pairing -(1/[L:F]) D1.D2 and its non-canonical decomposition into i and j (the
   vertical-correction term the stage text asks for). Its coverage record was updated.
9. **Gap "Saito-Tunnell and Waldspurger ... absent from the library."** The claim "a CATALOGUE.json
   search found no record" is false: the catalogue carries the placeholder `LocalToricAndWaldspurger`
   ("Saito-Tunnell local distinction and Waldspurger toric-period primary papers",
   `source_family_not_fully_acquired`, priority 2). What is missing is a file; the other Tunnell,
   Saito and Waldspurger records are different papers.
10. **Gap "The published erratum materially changes statements...".** It had
    `HeegnerPointEulerSystems:HE.1` as a consumer of GZ.4/GZ.6/GZ.8. The atlas has HE.1 *requiring*
    GZ.3 (its text names "GZ.0 and GZ.3's Hodge class only"), and GZ.6 *requiring* HE.1. Rewritten
    so the direction of supply is right: HE.1 consumes the GZ.0 conventions; the push-forward
    correction and the #Sigma > 1 restriction bind GZ.6 where it consumes HE.1's CM divisors.
11. **Summary and `readSections`.** "Chapter 1 and Sec. 7.1 read in full" contradicted the GZ.2
    coverage record, which said Secs. 7.1.2-7.1.3 were unread. Both were made precise, and the
    passages read during this review are marked as such.

### Checked and left alone

- **S^1 versus S^2 at the split places.** The OCR shows `S^1` in both clauses of the assumption on
  book p. 17. The page rendering confirms the book prints `S^1` twice, although `S^2` is defined
  immediately above and is not used there. The packet is faithful, so the reading was not
  "repaired"; it is now recorded as an open boundary to be settled in Chapter 5 Sec. 5.2.
- Thm. 3.15 (p. 84) and Thm. 3.21 (p. 105) carry exactly the constants and the form the packet
  quotes from Chapter 1, and book p. 93 does read "can also be defined as the image of the
  morphism", which is what erratum item 30 corrects.
- Library claims in the gaps hold: `BSD_GrossZagier.txt` is 4 lines and `BSD_ZhangAdmissible.txt`
  36, so neither scan has a usable text layer; `BSD_ConradGZ.txt` (4684 lines),
  `BSD_ZhangHeights.txt` (6430), `BSD_BDP`, `R02_Brooks_ShimuraPadicL`, `BSD_JSW` and
  `BSD_YZZExplicit` are present and extracted, with BDP Thm. 5.13 (Sec. 5, printed pp. 1127-1139),
  Brooks Prop. 8.13 and JSW Props. 5.1.6-5.1.7 where the packet says they are.

### Links

All 12 links are internal to the roadmap. Every endpoint exists, every direction runs prerequisite
to consumer, and each cited locator does use the source node's output; none was removed. The
GZ.0 -> GZ.5 reason was made precise about which erratum item corrects what. The packet asserts no
cross-roadmap link, so no supplier scope had to be endorsed.

### Unverifiable items

None among the node statements. The unread imports remain as gaps: Chapters 2-6 and 8 and
Secs. 3.1-3.6, 7.2-7.4 of the monograph; Serre's book for Thms. 7.1-7.2; Faltings and Hriljac for
Thm. 7.4; Zhang's *Admissible pairing on a curve* (no text layer); Tunnell, Saito and Waldspurger.

### Validation

`json.load` passes. `merge_decompositions` on this packet passes: 9 nodes, no deferred links, no
cycle.

### Questions and decisions for the orchestrator

1. **Supplier direction around HE.1.** The atlas has HE.1 requiring GZ.3 and GZ.6 requiring HE.1.
   The GZ.6 stage text also says "Construct the CM divisors/correspondences on X_U from HE.1".
   Confirm that HE.1, not GZ.6, owns the CM points, and that GZ.6 owns the special cycles; the
   erratum's push-forward correction has to land on exactly one of them.
2. **Acquisition.** Either acquire the primaries behind `LocalToricAndWaldspurger` (Tunnell,
   *Local epsilon-factors and characters of GL(2)*; Saito, *On Tunnell's formula*; Waldspurger,
   *Sur les valeurs...*), or rule that YZZ Chapter 2 plus Cai-Shu-Tian suffices for GZ.4-GZ.5.
3. **OCR.** `BSD_GrossZagier.pdf` and `BSD_ZhangAdmissible.pdf` are scans with no text layer.
   Either schedule OCR or accept Conrad's *Gross-Zagier revisited* and Zhang's *Heights of Heegner
   points* (both fully extracted) as the working sources.
4. **S^1 versus S^2.** Whoever reads Chapter 5 Sec. 5.2 should settle whether the split-place
   assumption is S^1 as printed, and report it back to GZ.7.
5. **GZ.9 and BDP Thm. 5.13.** GZ.9 is unstarted, and the packet says it shares BDP Thm. 5.13 with
   the EXT-15 GeneralizedHeegnerCycles packet. Decide which roadmap decomposes that theorem so it
   is not done twice with different hypotheses.

---

## 5. KatoEulerSystems.json (EXT-15)

**Review status: accepted.** Nodes: 22 (14 verified, 8 corrected, 0 unverifiable). Links: 15, all
kept. Gaps: 6 -> 7 (one added, three corrected). Coverage: 5 stage records (L0-L4), all ids exist
and belong to the roadmap.

### Sources checked

Both sources are in the library and their SHA-256 values match the packet (Kato `3c6e14b1...`,
Rubin draft `de47655d...`). Nothing was fetched from the network.

| Source | Passages read by the reviewer |
| --- | --- |
| Kato, Astérisque 295 | §1 (1.1-1.10 with the proofs), §2 (2.1-2.7 and the proofs 2.11-2.13), §8 (8.1-8.8 with the proof of Lemma 8.5), §9 (9.2-9.7), §10 opening, §12 (12.1-12.2, Thms. 12.4-12.6, Remark 12.8, 12.9, Conj. 12.10), §13 (13.1-13.7), §17 (17.1-17.5) |
| Rubin, *Euler systems* (draft) | Ch. II §3: Hyp(K∞/K), Hyp(K∞,T), Hyp(K∞,V), Def. 3.1, Thms. 3.2-3.4 |

The Numdam text layer garbles displayed formulas, so printed pp. 124, 125, 126, 221 and 225 were
rendered with `pdftoppm` and read as images. Three of the corrections below come from those pages.

### Fetched sources

None.

### Corrections made in place

1. **L3/zeta-class-interpolation-of-complex-L-values.** Thm. 12.5(1) interpolates
   `L_{p}(f*, χ, r)` — the L-function of the **dual** form f\* — and the packet recorded f. The
   constant, which the packet had left untranscribed as "not legible", is legible in the PDF:
   `(2πi)^{k-r-1} · L_{p}(f*, χ, r) · γ^±`, with the twisted period map landing in `V_C(f)^±` and
   γ taken in `V_F(f)`, not in all of `V_{F_λ}(f)`. Statement, hypothesis, excerpt and acceptance
   item corrected; the corresponding gap was rewritten.
2. **L2/euler-system-datum-for-the-modular-lattice.** A proof step carried a literal `?` in an
   exponent. The printed Euler polynomial is `P_ℓ(t) = 1 - ā_ℓ ℓ^{1-r} t + ε̄(ℓ) ℓ^{k+1-2r} t²`,
   with `P_ℓ(ℓ^{-1}σ_ℓ^{-1}) = 1 - ā_ℓ ℓ^{-r} σ_ℓ^{-1} + ε̄(ℓ) ℓ^{k-1-2r} σ_ℓ^{-2}`. Reading the
   page also exposed a **source-internal discrepancy**: 13.1 defines `P_ℓ` with `Fr_ℓ^{-1}`, while
   Example 13.3 computes with `Fr_ℓ`. That is now flagged in the statement and in a new acceptance
   item. The same node described the index set as allowing m prime to Σ; since
   `prime(m) ∩ Σ = {p}` is an equality, every m is divisible by p, as Kato's own gloss in
   Example 13.2 confirms.
3. **L4/cohomological-divisibility-one-direction.** A proof step said hypothesis (v) of Thm. 13.4
   is verified "by the large-image results of 12.8". Kato says only that (ii), (iii), (iv) hold and
   that (v) **fails** in the CM case; he does not discharge (v) anywhere in §§12-13. The step now
   records the inference as the packet's own, with a new gap and an acceptance item.
4. **L1/euler-factor-norm-relation-at-auxiliary-primes.** The node deferred the power of ℓ in the
   quadratic term to §2.5 because the text layer drops it. The rendering of p. 126 gives the
   operator exactly: `(1 - T'(ℓ)⟨1/ℓ,1⟩* + ⟨1/ℓ,1/ℓ⟩*·ℓ)`.
5. **L1/beilinson-element-in-K2-of-Y-M-N.** "Matrices congruent to the identity modulo the
   relevant entries" replaced by Kato's explicit subgroup `a ≡ 1, b ≡ 0 mod M; c ≡ 0, d ≡ 1 mod N`,
   with `Y(N,N) = Y(N)` for N ≥ 3.
6. **L1/K2-norm-projection-formula.** Prop. 2.3's coprimality is printed at the lower level,
   `(c,6M) = 1` and `(d,6N) = 1`; recorded as printed, with the equivalence noted.
7. **L0/siegel-units-and-c-independent-rationalisation.** The q-expansion exponent was asserted as
   `a²/(2N²)`. Kato calls it w and prints `w = 1/12 - a/2N + (1/2)(a/N²)`. The packet's value is
   the Bernoulli-consistent reading of an ambiguous display, but it is a reading; both are now
   recorded and the ambiguity flagged.
8. **L4/imported-euler-system-bound** (extension, no error). Rubin's `Hyp(K∞/K)` is automatic over
   Q — the draft says "it is satisfied if K = Q" — so the Kato/Rubin hypothesis mismatch is
   confined to `Hyp(K∞,T)` and to identifying the bounded objects.
9. **Gap corrections.** The [KK3] gap claimed the catalogue holds only three Kato records; it also
   holds Kings-Loeffler-Zerbes, *Rankin-Eisenstein classes and explicit reciprocity laws*, and
   Huber-Kings (both downloaded, neither text-extracted). [KK3] itself is genuinely absent, and KLZ
   is the natural substitute. The Rubin-comparison gap now records that `Hyp(K∞/K)` is harmless.

### Links

All 15 checked. The 14 internal links run prerequisite to consumer, both endpoints exist, and each
cited locator does use the source node's output. The cross-roadmap link
`EulerSystemsAndKolyvaginSystems:ES.8 → L4/imported-euler-system-bound` is **endorsed**: Kato
states plainly that Thm. 13.4 is imported from Perrin-Riou, Rubin and [KK4], and the ES.8 stage
text names this adapter explicitly ("Kato classes plus explicit reciprocity produce a modular
divisibility"). This is supply, not shared vocabulary. No link was removed.

### Unverifiable items

None among the node statements. The unread imports remain as gaps: [KK3]; Kato §§4-7, 10, 11,
14-16; the proofs of Thm. 13.4 in Perrin-Riou, Rubin and [KK4]; and the definition of `per_f`.

### Validation

`json.load` passes. `merge_decompositions` passes: 22 nodes, no deferred links, no cycle — so the
proposed ES.8 → L4 edge does not create one.

### Questions and decisions for the orchestrator

1. **Missing atlas edge.** `data/atlas.json` has `KatoEulerSystems:L4` requiring
   `EulerSystemsCyclotomicMainConjecture:L2`, `KatoEulerSystems:L3` and
   `SelmerIwasawaCohomology:L3` — but **not** `EulerSystemsAndKolyvaginSystems:ES.8`, although the
   packet's (endorsed) link asserts exactly that supply and both stage texts describe it. Add the
   stage edge, or rule that the ES.8 adapter is consumed only through ESCMC:L2.
2. **Acquisition: [KK3].** Kato's *Generalized explicit reciprocity laws* is the load-bearing
   external input to Thm. 9.5 and is absent from the library. Either acquire it, or accept
   Kings-Loeffler-Zerbes (present, unextracted) as the working source and re-anchor L3.
3. **Hypothesis (v) of Thm. 13.4** has no owner: Kato verifies (ii)-(iv) and notes (v) fails for CM
   forms, but never discharges it for non-CM forms in §§12-13. Assign whoever reads §§14-15.
4. **`per_f` and f\*.** The interpolation constant is now transcribed, but the period normalisation
   `per_f` and the dual form f\* are unread. They are what the L3 stage text's "normalization
   dictionary" actually needs; assign them with §16.
5. **Text-layer policy.** This paper's Numdam digitisation silently drops exponents and whole
   displays. Any packet quoting Kato from the text layer should be re-checked against page
   renderings; three errors here came from exactly that.

---

## 6. GeneralizedHeegnerCycles.json (EXT-15)

**Review status: accepted.** Nodes: 6 (1 verified, 5 corrected, 0 unverifiable). Links: 6, all
kept. Gaps: 6 (four corrected or partly discharged). Coverage: 9 stage records (GH.0-GH.8), all
ids exist and belong to the roadmap; GH.7 and GH.8 are honestly `not_read` and GH.3 carries no node.

### Sources checked

All four SHA-256 values were recomputed from the library files and match the packet exactly: BDP
`223bfdad...`, Castella-Hsieh `5c85ea3c...`, its erratum `2a8b615d...`, Longo-Vigni `afc1a214...`.
Nothing was fetched from the network. Three of the four have **no pre-extracted text in the
library**, so their PDFs' own text layers were extracted into scratch and read there.

| Source | Passages read by the reviewer |
| --- | --- |
| Bertolini-Darmon-Prasanna | Sec. 0 in full (pp. 1033-1039), including the three simplifying assumptions and the MAIN THEOREM; Prop. 2.4, Remark 2.6 and Prop. 2.7 (p. 1063) |
| Castella-Hsieh (revised) | Thm. 3.9 with proof; Remark 4.8; Thm. 4.9; Thm. 5.7 with proof; Cor. 5.8; (6.1); Thms. 6.1-6.4 with proofs; Sec. 7: Lemma 7.5, Prop. 7.8 with its correcting footnote, Thms. 7.7 and 7.9, Lemma 7.10 |
| Castella-Hsieh erratum | The whole one-page erratum |
| Longo-Vigni | Xi, Def. 2.1, Remark 2.2, Assumption 2.3; (H.0)-(H.5) in full; Assumption 3.2 in full; Thm. 3.5 with proof; Lemma 4.2 with proof; Cor. 4.3; Prop. 4.5; Thm. 4.12 |

### Fetched sources

None.

### Corrections made in place

1. **GH.1/generalized-heegner-cycles-....** A source entry presented a *paraphrase inside a
   quotation*: "[and a correction is needed]". BDP state the r = 0 correction explicitly — replace
   Δ_φ by Δ_φ − ∞₁ for an arbitrary cusp — and homological triviality is **Prop. 2.7**, not
   Prop. 2.4 (which is the projector computation supplying the cohomological vanishing). Excerpt,
   statement, hypothesis and acceptance item corrected, and Remark 2.6's precise field of
   definition added.
2. **GH.2/local-condition-at-p-....** Prop. 7.8's subject is the collection `c^{heeg,†}` of
   **specialised** Heegner classes with `c^{heeg,†}_K = z_f^{χ⁻¹}`, not "the collection of derived
   classes"; it is axiom (E5) whose verification needs the derivative classes' local condition.
   Also, Lemma 7.5 as printed already assumes L′/L/K_{c,w} unramified **relative** to K_{c,w}; the
   erratum's added hypothesis is **absolute** unramifiedness over Q_p, which is exactly where the
   original argument fails. A source entry with both printed statements was added.
3. **GH.4/castella-hsieh-abel-jacobi-....** The excerpt for (6.1) transcribed the base of the power
   as (−1); the source has (√−1). A hypothesis recording how the sign is assembled from local root
   numbers was added.
4. **GH.5/longo-vigni-....** Extended: (H.0)-(H.5) and Assumption 3.2 were read in full, and
   Assumption 3.2's three clauses are now recorded in the statement (crystalline ordinary
   filtration with both graded pieces free of rank one and inertia trivial on Fil⁻; the exact
   annihilator condition; finiteness of both H⁰ groups) — which is exactly what the stage text
   demands. Two hypotheses sharpened: Remark 2.2's expectation for condition (4) carries the
   proviso "at least if F ≠ Q", and Longo-Vigni's own cross-references to "condition (5) in
   Assumption 2.3" do not match Def. 2.1's **four** conditions — a source-internal numbering slip,
   now flagged.
5. **GH.6/selmer-consequences-....** Extended: Thm. 7.7 also identifies the Selmer group with the
   Bloch-Kato one; Thm. 7.9 reads "if loc_p(z^χ_f) ≠ 0 then Sel(K, V⊗χ) = {0}"; and Thm. 3.9, the
   nonvanishing input, assumes (N_f, D_K) = 1 and invokes **[Hsi14, Theorem C]** through an
   auxiliary prime with absolutely irreducible residual restriction. That is the precise interface
   the stage text asks to be preserved.
6. **A recurring factual error about the library.** Four follow-on sources (Kobayashi-Ota,
   Hsieh 2014, Castella 2020, and Longo-Vigni itself) were described as "text-extracted", with line
   counts. The library holds **no extraction for any of them** — `CATALOGUE.json` records no
   `text_path` and `references/text/` has no such files — although each PDF does carry a usable
   text layer, and the quoted line counts do not match a direct extraction (LV: 1600 not 1174;
   Castella 2020: ~2900 not 2022). Corrected in four gaps and three coverage records. The reads are
   budget-limited, not access-limited, but a worker looking for `references/text/` files will not
   find them. Kobayashi-Ota's Lemma 4.10 was located in the acquired copy, which strengthens that
   gap.

### Links

All 6 links are internal to the roadmap. Every endpoint exists, every direction runs prerequisite
to consumer and matches the atlas's own stage requirements, and each cited locator does use the
source node's output. The GH.5 → GH.6 link is the weakest: its reason states openly that neither
statement is derived from the other in the sources read, and records only the direction in which
the atlas asks them to be combined. That is honest, and the atlas has GH.6 requiring GH.5, so it
was kept as written. No cross-roadmap link is asserted.

### Unverifiable items

None among the node statements. Unread imports remain as gaps: Kobayashi-Ota Lemma 4.10; BDP
Secs. 1-5 including Thm. 5.13; Hsieh's Theorem C; Longo-Vigni's verification of (H.1)-(H.5) and
Assumption 3.2 for T_P, and its Props. 3.3, 3.4 and Lemma 2.4(3); and all of GH.7 and GH.8.

### Validation

`json.load` passes. `merge_decompositions` passes: 6 nodes, no deferred links, no cycle.

### Questions and decisions for the orchestrator

1. **Extraction policy.** Four sources this packet depends on have PDFs but no library extraction.
   Either extract them into `references/text/` centrally, or state that workers should run
   `pdftotext` themselves — right now packets describe such files as "text-extracted" when they are
   not, which will mislead the next reader.
2. **Kobayashi-Ota is the critical path.** Castella-Hsieh Prop. 7.8 — and therefore Thm. 7.7,
   Thm. 6.1(1) and everything GH.6 exports — currently rests on a proof the authors have withdrawn.
   Assign Kobayashi-Ota Lemma 4.10, or restrict GH.2/GH.6 to the unramified range until it is read.
3. **BDP Thm. 5.13 is shared with GrossZagierAndArithmeticHeights GZ.9** (see §4 above). One
   roadmap should decompose it; the other should consume it.
4. **GH.3 has no node** although its coverage is `partial`: the universal-norm targets (LV
   Lemma 4.2, Prop. 4.5) are recorded only inside GH.5. If GH.3 is to own them, the next worker
   should move them.

---

## 7. HeegnerPointEulerSystems.json (EXT-15)

**Review status: accepted.** Nodes: 8 (5 verified, 3 corrected, 0 unverifiable). Links: 8, all
kept. Gaps: 7 (two extended). Coverage: 12 stage records (HE.0-HE.8c), all ids exist and belong to
the roadmap; HE.0, HE.7, HE.7s and HE.8b are honestly `not_read`.

### Sources checked

Both SHA-256 values were recomputed from the library files and match the packet (Howard
`d2d06e85...`, Cornut-Vatsal `bdf258c7...`). Nothing was fetched from the network.

| Source | Passages read by the reviewer |
| --- | --- |
| Howard, *The Heegner point Kolyvagin system* | Sec. 0 in full; Sec. 1.3 (H.0-H.5 with the following remarks); Prop. 1.5.9; Thm. 1.6.1; Thm. 1.6.5 with its complete proof; Sec. 1.7 in full; Sec. 2.3 including Lemmas 2.3.2-2.3.3, Lemma 2.3.4's proof in all three local cases, and the opening of the proof of Thm. 2.3.7 |
| Cornut-Vatsal, *Nontriviality of Rankin-Selberg L-functions and CM points* | Sec. 1.1 in full (Def. 1.3, the structure of G(∞) and G₀, Thms. 1.4 and 1.5), and Sec. 1.3's reduction of Thm. 1.5 to Thm. 1.10 |

The five verified nodes quote the source with unusual accuracy: Lemmas 1.7.1-1.7.3, Prop. 1.7.4 and
Thm. 1.7.5 match clause by clause, including every place where Howard himself flags an import.

### Fetched sources

None.

### Corrections made in place

1. **HE.8/lambda-adic-heegner-kolyvagin-system-and-theorem-B.** Lemma 2.3.4's proof has **four**
   parts, and the node recorded two. Missing were the transverse part at primes dividing n
   ("exactly as in the proof of Lemma 1.7.3") and the whole of **case (iii), v | p** — the longest,
   which introduces the ordinary filtration `Fil_w(T) = ker(T → T_p(Ẽ))` and turns on the
   finiteness of `Ẽ(F[n])[p^∞]`. Case (ii) was also completed with Rubin Prop. B.3.4 and the
   prime-to-p degree argument.
2. **HE.8, continued.** Thm. 2.3.7 — what makes Theorem B non-vacuous — is **not self-contained**:
   "by the main result of [Cor02], one of the points Norm_{K_k[1]/K_k}P_k[1] has infinite order, and
   so Proposition 10 of section 3 of [PR87] implies that H is free of rank one". Cornut's theorem
   and Perrin-Riou's proposition are both imports, and `p ∤ h_K` is used there as the absence of
   p-torsion in the class group.
3. **HE.8c/cornut-vatsal-nonvanishing-....** "Exceptional" is **defined** (Def. 1.3) by
   π ≅ π ⊗ η; the double-zero factorisation is the *motivation* for excluding such pairs, not the
   definition. Also extended: Thm. 1.5 is reduced, via Zhang's Gross-Zagier formula, to Thm. 1.10
   (a special case of the paper's Thm. 4.1), the CM-point statement — neither was read.
4. **HE.6/clean-rank-one-descent-theorem-A** (extension, no error). The packet nowhere recorded
   that the hypothesis κ₁ ≠ 0 is discharged by **Gross-Zagier**, although Howard states it twice:
   "ord_{s=1} L(s, E/K) = 1 iff κ₁ has infinite order", and κ′₁ "is nonzero provided that
   L′(E/K,1) ≠ 0". Without it Theorem A is vacuous, so it belongs in the hypotheses.

### Every library and atlas claim in the packet was checked, and all hold

- `references/text/BSD_GrossKolyvagin.txt` is **0 lines**, and re-running `pdftotext` on the PDF
  produces a **12-byte** file — exactly as the packet says. So Gross's Prop. 3.7 (the norm relation)
  and Prop. 6.2 (the local conditions away from n) are genuinely unreadable here.
- The Howard extraction is 2036 lines, as stated.
- `CATALOGUE.json` has **no** Perrin-Riou [PR87] record (only *Fonctions L p-adiques des
  représentations p-adiques*, a different paper) and **no** McCallum record; and it does carry
  `Kolyvagin`, `KolyvaginLogachev` and `R02_KI_RubinCM1987` entries with **no resolved file**.
- The stage records `HE.8` and `HE.8b` have **byte-identical** descriptions (titles differ).
- `HE.8c` requires `HE.8` and `HE.8b`, so the packet's "reversed edge" finding is correct, and its
  decision to **withdraw** the prerequisite edge HE.8c → HE.8 rather than introduce a cycle is
  right: adding it closes HE.8 → HE.8c → HE.8 and, through HE.8b, `RankZeroOneBSD:BSD.7a` and
  `AutomorphicCongruences:L5a`, exactly three further cycles.

### Links

All 8 checked. The 7 internal links run prerequisite to consumer with both endpoints present. The
cross-roadmap link `GrossZagierAndArithmeticHeights:GZ.8 → HE.8c` is **endorsed**: Cornut and Vatsal
say they prove their theorems "using Gross-Zagier formulae to reduce the nonvanishing of
L-functions and their derivatives to the nontriviality of certain CM points", and that Thm. 1.5's
extra hypotheses exist only because those formulae were not then general; GZ.8 owns exactly that
general formula, and HE.8c's own stage text says "Prove the geometric CM distribution before
applying GZ's formula". Supply, not shared vocabulary.

### Unverifiable items

None among the node statements. Unread imports remain as gaps: Gross [Gro91] (no text layer);
McCallum [Mc91]; Perrin-Riou [PR87]; Howard Secs. 1.4-1.6 and 2.1-2.2; Cornut-Vatsal Secs. 2-8 and
Cornut's own theorems; and the whole of HE.0, HE.7, HE.7s, HE.8b.

### Validation

`json.load` passes. `merge_decompositions` passes: 8 nodes, no deferred links, no cycle — the
proposed GZ.8 → HE.8c edge does not create one.

### Questions and decisions for the orchestrator

1. **HE.8 / HE.8b are duplicates in the atlas.** Byte-identical descriptions, both declaring
   "Milestone: HE.8". Either write HE.8b's distinct scope or merge it; until then HE.8b cannot be
   decomposed without copying HE.8.
2. **Edge direction HE.8 ↔ HE.8c.** The atlas makes HE.8c a consumer of HE.8, but Cornut-Vatsal
   nonvanishing is an *input* to Theorem B. Decide whether HE.8c is a downstream "source
   hypotheses" note (then the input relation must be recorded inside HE.8's text) or an upstream
   supplier (then both existing edges must be reversed).
3. **Missing atlas edge GZ.8 → HE.8c** (endorsed above, acyclic). Add it, or rule that the
   Gross-Zagier input is consumed only through HE.3.
4. **Acquisitions, in priority order:** Gross's *Kolyvagin's work on modular elliptic curves* needs
   OCR (two load-bearing propositions); McCallum's Lemma 4.1 and Prop. 4.4 are quoted verbatim by
   Howard and are absent; Perrin-Riou [PR87] supplies both the alternative norm relation and the
   Prop. 10 used by Thm. 2.3.7; Kolyvagin, Kolyvagin-Logachev and Rubin's CM paper are catalogued
   with no file and block HE.7/HE.7s entirely.

---

## 8. DeformationAndDerivedPatchingAlgebra.json (EXT-01)

**Review status: accepted.** Nodes: 18 (**18 verified, 0 corrected, 0 unverifiable**). Links: 30,
all kept. Gaps: 5, all accurate. Coverage: 9 stage records (R03.1-R03.6, P7-P9), all ids exist and
belong to the roadmap.

This is the most accurate packet in the assignment: the cited passage was read for **every** node
and every quoted excerpt is verbatim, down to the exclamation mark in Stacks Lemma 15.76.6
("unique up to isomorphism(!)").

### Sources checked

All six SHA-256 values were recomputed from the files on disk and match the packet exactly: Stacks
`e44ecf82...`, Calegari-Geraghty `c0ba8de0...`, ACC+ `c5429e4f...`, Kisin `076f8bb6...`,
Khare-Wintenberger II `53f45f8b...`, Khare-Wintenberger 2009 `154c0c2a...`. Nothing was fetched
from the network.

| Source | Passages read by the reviewer |
| --- | --- |
| Stacks Project | Ch. 90 §§90.3-90.4 and §§90.10-90.19; Algebra §10.72 and §10.111; More on Algebra §15.69, §§15.75-15.76, §15.92 |
| Calegari-Geraghty | §2.1-2.2 (Defs. 2.1-2.2, Prop. 2.3 with full proof); §6 (Lemmas 6.1-6.2, Thms. 6.3-6.4, Remark 6.5, Prop. 6.6) |
| ACC+ | §6.2.22-6.2.25; §6.3 (Lemmas 6.3.2-6.3.4, Assumption 6.3.6, Lemma 6.3.7, Prop. 6.3.8, Cor. 6.3.9); §6.4 (set-up, Def. 6.4.3, Props. 6.4.10-6.4.12) |
| Kisin | (3.3) Prop. (3.3.1) and Lemma (3.3.4) with proofs |
| KW II | §4.2 (Def. 4.2, Prop. 4.5, Lemma 4.6, Cor. 4.7 with proofs); §9.1 (Lemma 9.6 and the finiteness conclusion); Thm. 10.1 |
| KW 2009 | Lemma 3.6 |

**Provenance note.** Five of the six sources are in `references/papers`, but the Stacks book is at
`revised_campaign/upstream/WeilConjectures/WeilConjectures/references/book.pdf` (7641 pages) with
**no** library text extraction, so the cited page ranges were extracted from the PDF directly for
this review.

### Fetched sources

None.

### Corrections

None were needed. Two habits in this packet deserve to be recorded, because they are exactly what
the protocol asks for and are rare:

1. **It marks its own reasoning as its own.** The R03.4 characteristic-zero node writes
   "(Argument supplied here; KW II only asserts that p is not nilpotent and hence some prime I has
   p ∉ I)" instead of presenting the three-line argument as the source's.
2. **It records unwritten proofs as unwritten** — CG Prop. 6.6 ("we omit the details"), Stacks
   Lemma 90.10.2 ("Proof omitted. Hints"), the omitted details in Stacks Lemmas 90.4.3-90.4.4 and
   the body of Lemma 90.13.4 — and collects them into a gap rather than quietly filling them in.

Spot-checks that could have gone wrong and did not: KW II's `δ_p` convention is Definition 4.2
("δ_p = 0 if p > 2 and δ_2 = 1"); the 4|S| dimension count behind Prop. 4.5 is the source's own;
Stacks Thm. 90.18.2's three conditions (a)-(c) and the note that (c) is empty for separable k′/k;
and ACC+ Assumption 6.3.6's three clauses.

### Links

All 30 checked. The 23 internal links run prerequisite to consumer with both endpoints present, and
each cited locator is a place where the consumer really uses the supplier's output. Of the 7
cross-roadmap links, **5 already correspond to stage edges** in `data/atlas.json`
(R03.2 → `GlobalGaloisDeformations:R04.1` and → `LocalGaloisDeformationRings:R08.1`; R03.5 →
`OrdinaryAutomorphicFormsAndModularityLifting:R21.4`; P9 → `PotentialAutomorphyInfrastructure:PA.3`;
P7 → `CompletedCohomologyPartII:CC.4`). **Two do not** — see the decisions below. Both are genuine
supply relations, not shared vocabulary, and neither creates a cycle.

### Unverifiable items

None. The unread material is recorded in the gaps: Khare-Thorne and Gee-Newton's ultrapatching
lemmas, the Tor spectral sequence and derived-limit comparisons, the CM/CI and excellence inputs,
the omitted proofs above, and the arithmetic suppliers behind KW II Prop. 4.5 and ACC+ Prop. 6.2.25.

### Validation

`json.load` passes. `merge_decompositions` passes: 18 nodes, no deferred links, no cycle.

### Questions and decisions for the orchestrator

1. **Missing atlas edge `DerivedDeRhamCohomology:DD.1 → P7`.** The atlas has P7 requiring only
   R03.1 and R03.3, but the packet (correctly) cites DD.1 for derived completeness and derived
   Nakayama, which DD.1's own stage text owns. Add the edge or move that dependency.
2. **Missing atlas edge `R03.4 → PotentialModularityAndCompatibleSystems:R24.1`.** The atlas routes
   R24.1 through R03.6, yet R24.1's text *is* KW II Theorem 10.1, whose finiteness criterion is the
   R03.4 node. Decide which stage supplies it.
3. **The Stacks book is outside the reference library** and unextracted. Either register it in
   `references/` with a text extraction or record in the protocol that packets may cite it from
   `upstream/`; otherwise every future reviewer repeats the 7641-page extraction.
4. **An abstract obstruction-theory relation bound is missing.** The packet's own R03.2 coverage
   says so: only the Galois instance (KW II Lemma 4.6) and ACC+'s variable count are decomposed.
   If the roadmap wants the general statement, it needs an owner and a source.
