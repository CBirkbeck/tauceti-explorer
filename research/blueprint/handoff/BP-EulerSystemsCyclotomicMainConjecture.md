# BP-EulerSystemsCyclotomicMainConjecture — handoff

## Checkpoint 9 (Claude Code, session cc-fb70e5, 29 September 2026): the rest of Greither §3 (3 nodes)

Refs #725. **Status: partial.** L0 and L2 are `source_decomposed`; L1, L3 and L4 are `partial`.

**Source.** Greither 1992, §3 from Lemma 3.5 to the end of the proof of Theorem 3.1 (pp. 470–482), from the same Numdam scan. The formulas on pp. 475–481 were checked on the page images, and the exponent bookkeeping of the induction was rechecked.

**New L4 nodes:**
- `greither-chebotarev-at-two`: Theorem 3.7, its Complement and Corollary 3.8, with Claims (a)–(c).
- `greither-finite-level-links`: Lemmas 3.9–3.11.
- `greither-kolyvagin-step`: Lemmas 3.12–3.13.

`greither-real-main-conjecture` (Theorem 3.1) now carries the whole induction and depends on these three nodes.

**Source issue E17 (misprint, new):** on p. 480, N = (γ − 1)^{2^t}(…) should read (γ − 1)^{2^{i−1}}(…). No t is defined there, and Lemma 3.12 is applied with η = (γ − 1)^{2^{i−1}}.

**Requests.**
- Extended: IntegralIwasawaTheory L2 (Rubin's 1988 Lemma 1.2).
- Consumers added: IntegralIwasawaTheory L1 and L4, ES.4, and the Tau Ceti ClassFieldTheory and ProfiniteCohomology requests.

**Lean.** One new checked example, the exponent sum Σ_{i<k} 2^{i+1} + 2 = 2^{k+1} used in the induction. The file compiles with exit 0; the only warnings are the existing planned stubs.

**Checks.** `check_blueprint --index`: 0 errors, 0 warnings. `check-files`: 0 problems. Every new excerpt was checked by script.

**Next.**
- L4: the (G2) Gross–Koblitz gap.
- L3: the finite-layer stabilisation gap ([MW] §1.6 or Lang's appendix).
- L1: the derivative classes (Rubin IV–V).

## Checkpoint 8 (Claude Code, session cc-fb70e5, 29 September 2026): Greither §2 decomposed (6 nodes)

Refs #725. **Status: partial.** L0 and L2 are `source_decomposed`; L1, L3 and L4 are `partial`.

**Source.** Greither 1992, §2 in full (pp. 455–468), from the same Numdam scan. Formulas were checked on the page images of pp. 455–456, 459–460, 462–463 and 465–467.

**New L4 nodes:**
- `greither-semilocal-norm-descent`: Lemmas 2.1–2.2 and the Corollary.
- `greither-circular-unit-limit`: Lemma 2.3, with Sinnott's remarks.
- `greither-coleman-sequence-all-p`: Theorems 2.4–2.6 and Corollary 2.7, over unramified 𝒪 and with p = 2.
- `greither-semilocal-coleman-map`: Theorem 2.8, Lemma 2.9 and Proposition 2.10.
- `greither-circular-unit-generators`: Lemma 2.11 and Corollary 2.12.
- `greither-stickelberger-image`: Theorem 2.13, Lemma 2.15 and the evaluation proof.

`greither-semilocal-units` (Corollary 2.14) now depends on these.

**Corrections to earlier checkpoints.** The checkpoint 5 L4 statements wrote K_n = F(μ_{p^{n+1}}), which is wrong at p = 2 (it gives K_0 = F). They now use Greither's K_n = F(ζ_{2p^{n+1}}). The ColemanPowerSeries L4 request no longer asks for Greither's §2. Coleman's own theorems (Division values, Theorem 2.2, Theorem 16 and Corollary 17; Local units mod circular units, Lemma 2 and Theorem 3) are requested from ColemanPowerSeries L1 and L3 for unramified 𝒪, including p = 2.

**Source issues (new):**
- E14: Lemma 2.11 writes F′ = F ∩ ℚ(M), with M undefined.
- E15: Lemma 2.15(b) needs ζ_m^p in its second term. Checked numerically in four cases; the proof's own computation has ζ_m^p.
- E16: R is 𝒪[[Γ′]] on p. 460 but ℤ_p[[Γ′]] from Lemma 2.11 on.

**Observation, not a source issue.** For F/F′ unramified above p the semilocal units are cohomologically trivial, so the norm in Lemma 2.1 is an isomorphism. Greither's bound is weaker than necessary but correct.

**Lean.** One new checked example: the polynomial identity behind Lemma 2.15(a), (Σ_{a≤N} a·x^a)(1 − x)² = x(1 − (N + 1)x^N + N·x^{N+1}). The file compiles with exit 0; the only warnings are the existing planned stubs.

**Checks.** `check_blueprint --index`: 0 errors, 0 warnings. `check-files`: 0 problems. Every new excerpt was checked by script.

**Next.**
- L4: §3's Lemmas 3.11–3.13, and the (G2) gap.
- L3: the finite-layer stabilisation gap.
- L1: the derivative classes.

## Checkpoint 7 (Claude Code, session cc-fb70e5, 29 September 2026): L3's equivalent formulations (2 nodes)

Refs #725. **Status: partial.** L0 and L2 are `source_decomposed`; L1, L3 and L4 are `partial`. L3's only remaining item is the finite-layer stabilisation gap.

**Sources.**
- RJW arXiv v2 (SHA-256 efa1e101…): Remark 13.9, §13.5 in full (pp. 69–72), and Appendix B.2.3.
- The version of record (Essential Number Theory 4 (2025), msp.org PDF, SHA-256 78d0479b…), compared at the same passages.

**New L3 nodes:**
- `odd-character-formulation` (comparison): the odd-character main conjecture at odd p. It is equivalent to Theorem 13.8 by Kummer duality, and is the odd-p, F = ℚ case of Greither 3.2.
- `tate-twisted-selmer-formulation` (planet): Greenberg's conjecture for ℚ_p(n), RJW §13.5.
  - The corank statement holds for every n (rank 1 exactly for odd n ≥ 1).
  - The characteristic ideals are given for even n ≥ 2 and odd n ≤ −1.
  - For even n the node carries the factor Tw_n(I(Γ⁺)) that Example 13.22's "essentially" leaves out: ∂^nζ_p has a pole at x^{−n}. At p = 3, X_∞⁺ = 0 separates the two statements.

**Source issues (new; unchanged in the published version):**
- E12: §13.5.2(3), "for n ≥ 0" should read n ≤ 0.
- E13: Remark 13.23, L_∞(ℚ_p^∨, s) = L_∞(ℚ_p, 1 − s) should read s − 1.

Definition 13.19's G_ℚ-invariance is already SelmerIwasawaCohomology/E2. That entry's `searched` says the published version was not accessed; it has the same text (ENT p. 196).

**Requests.**
- New: SelmerIwasawaCohomology L4, for the identification of the Greenberg Selmer groups of W_n (RJW §13.5.2), which that stage lists as its own item.
- Extended: IntegralIwasawaTheory L1, with Iwasawa's rank theorem for X_∞.

**Lean.** One new checked example: the pole count, 1 = n − 2k for some k ≥ 0 iff n is odd and n ≥ 1. The file compiles with exit 0; the only warnings are the existing planned stubs.

**Checks.** `check_blueprint --index`: 0 errors, 0 warnings. `check-files`: 0 problems. Every new excerpt was checked by script against its page's text.

**Next.**
- L1: the explicit derivative classes (Rubin IV–V).
- L3: the finite-layer stabilisation gap ([MW] §1.6 or Lang's appendix).
- L4: §2 and §3 details, and the (G2) gap.

## Checkpoint 6 (Claude Code, session cc-fb70e5, 29 September 2026): L4, Greither §4 planned (11 nodes)

Refs #725. **Status: partial.** L0 and L2 are `source_decomposed`; L1, L3 and L4 are `partial`.

**Source.** Greither 1992, the same Numdam scan (SHA-256 8e4db974…). Read: §1 Remarks a)–b), the deduction of A from B, and Theorem C (pp. 453–454); §4 in full (pp. 482–497). Formulas were checked on the page images, since the OCR garbles them.

**New L4 nodes:**
- Theorem B (= 4.1) at p = 2 in six nodes:
  - `greither-split-prime-divisor-classes` (Lemma 4.2, Corollary 4.3);
  - `greither-trivial-zero-reduction` (Lemma 4.4, Proposition 4.5, (***));
  - `greither-split-units-quotient` (Proposition 4.7);
  - `greither-gauss-sum-vectors` (construction: (G1), (G2), Lemma 4.8);
  - `greither-trivial-zero-formula` (Lemmas 4.9–4.10, Theorem 4.6);
  - `greither-relative-class-group-bound` (4.1, both cases of χ(2)).
- `greither-iwasawa-leopoldt-two` (planet): Theorem A with Remarks a)–b). k_L = 1 is proved in the node, because L/L^+ is ramified at an odd prime.
- `greither-ray-class-real-fields` (Theorem 4.11) and `greither-ray-class-transfer` (Lemma 4.13).
- `greither-real-iwasawa-leopoldt` (planet): Theorem C = 4.12.
- `greither-gras-conjecture` (planet): 4.14–4.15.

**Source issues E4–E11 (new; no corrigendum on Numdam, Centre Mersenne or the web):**
- E4: Remark b) (p. 453) is missing the exponent d(χ₂); ℚ(ζ₅) shows it is needed.
- E5 (error, affects the proof): "Then g ∈ F" (p. 490) is false. The Gauss sum lies in the decomposition field D of 2. For m = 217 with an odd sextic χ, χ(2) = 1, σ₁₂₀ fixes F but not g. This was checked by Stickelberger digit sums (5 against 6) and numerically over 𝔽_{2^{15}}. The node uses N_{D/F}(g), which is what Greither's sums over all b compute.
- E6: (G1) has an extra factor m and drops b in the exponent. m is odd, so this is harmless.
- E7: "L′₂(s, χ̌) = G₂(u^s − 1, χ̌)" should read L₂.
- E8: ζ₂(b/s) should read ζ₂(b, s).
- E9: Theorem 4.12 omits χ|Δ₀ ≠ ε, which Theorem C has.
- E10: Theorem 4.14's factor 2^{d(χ′)|Δ_p|} is wrong for odd p; the correct factor is |((ℤ_p/2)[Δ])_{χ′}|.
- E11 (error, affects nothing): "no p-power roots of unity in F" is false at p = 2, but the cocycle step survives since N ≥ 2.

All are also logged in the swarm's published-errata list.

**New gap.** The Gross–Koblitz and Ferrero–Greenberg inputs and Gross's λ_χ ≠ 0 behind (G2) are cited to Gross 1981 and not planned by any roadmap.

**New requests:**
- IntegralIwasawaTheory L1: the class field theory of §4.
- IntegralIwasawaTheory L2: the coinvariant lemma and Washington pp. 277–278.
- IntegralIwasawaTheory L4: Leopoldt for abelian fields.
- DirichletPadicLFunctions L3: L_p(s, χ) = G_p(u^s − 1, χ) and the p-adic class number formula.

**Extended requests:** IntegralIwasawaTheory L0 (the minus class number formula; Sinnott's circular units and index) and the Tau Ceti ClassFieldTheory request (idèlic, for Proposition 4.7). Stickelberger is imported as `FiniteFieldsAndCharacterSums:FF.1/stickelberger-relation`.

**Lean.** Three new checked examples:
- Solomon's order identity |A/βα(A)|·|B| = |A|;
- Φ_{p^{k+1}} as the norm element;
- the ℚ(ζ₅) Bernoulli computation for E4.

The file compiles with exit 0; the only warnings are the existing planned stubs.

**Checks.** `check_blueprint --index`: 0 errors, 0 warnings. `check-files`: 0 problems. Every new excerpt was checked by script against its page's text.

**Next for L4.**
- §2's lemmas and §3's Lemmas 3.11–3.13 in detail.
- The (G2) gap.

## Checkpoint 5 (Claude Code, session cc-fb70e5, 29 September 2026): L4 started from Greither §§1–3 (5 nodes)

Refs #725. **Status: partial.** L0 and L2 are `source_decomposed`; L1, L3 and L4 are `partial`.

**Source.** Greither, Ann. Inst. Fourier 42 (1992), 449–499. This is the Numdam scan (SHA-256 8e4db974…; journal page = PDF page + 447), read on its OCR text layer, with the main-conjecture statement (p. 452) checked on the page image.

**New L4 nodes:**
- `greither-chi-parts` (definition; 4 API items, 3 tests): properties (a)–(g), with a non-exactness example at p = 2.
- `greither-semilocal-units`: Theorem 2.13 and Corollary 2.14 (Coleman, requested).
- `greither-real-main-conjecture`: Theorem 3.1 for all p, including the p = 2 Chebotarev modification (Theorem 3.7, Claims (a)–(c)).
- `greither-kummer-duality`: Lemma 3.3 and Proposition 3.4.
- `greither-main-conjecture-all-p` (planet): Theorem 3.2 with the one-half normalisation.

**No new source issues.**

**Lean.** One new checked example (the p = 2 χ-part computation). The file compiles with exit 0; the only warnings are the existing planned stubs.

**Checks.** `check_blueprint --index`: 0 errors, 0 warnings. `check-files`: 0 problems. Every new excerpt was checked by script against its page's text.

**Next for L4.**
- §4: Theorem A (p = 2 Leopoldt–Iwasawa), Theorem B (= 4.1) and Theorem C (= 4.12), and the Gras conjecture (4.14–4.15).
- §2's lemmas in detail.

## Checkpoint 4 (Claude Code, session cc-fb70e5, 29 September 2026): L3 planned (4 nodes)

Refs #725. **Status: partial.** L0 and L2 are `source_decomposed`, L1 and L3 are `partial`, and L4 is `not_read`.

**Sources.**
- Rubin III §2.8–2.10 (the same PDF as before).
- RJW arXiv v2 (SHA-256 efa1e101…): §7 (Theorem 7.1, Lemma 7.2), §11.2–11.3, Theorem 12.23, §13.1–13.4.
- RJW's Proposition 13.13 and Corollary 13.14 carry three findings already in the register: PadicMeasuresIwasawaAlgebras/E5 (the quotient orientation), E6 (Mittag-Leffler) and E7 (the Leopoldt rank). The nodes use the corrected forms. No new source issue.

**New L3 nodes:**
- `galois-unit-four-term-sequence`: RJW 13.13–13.14, with the E5 orientation and the E6 compactness repair.
- `trivial-character-component`: e₁X⁺ = e₁Y⁺ = 0. The unit value −(1 − p⁻¹)log_p(a) of ([a] − [1])ζ_p at the trivial character (RJW 7.1(ii), 7.2(ii)) makes e₁(I(Γ⁺)ζ_p) the unit ideal.
- `componentwise-iwasawa-equality`: Rubin III.2.8, with a new gap. The finite-layer stabilisation is cited by Rubin to [MW] and Lang's appendix, neither read.
- `cyclotomic-main-conjecture` (planet): RJW 13.8 for every odd p, and Rubin III.2.10 in χ-parts. The Vandiver statement 13.11 is not asserted.

**New requests:**
- ColemanPowerSeries L4: RJW 12.23 and Rubin III.2.9(ii).
- DirichletPadicLFunctions L1: ζ_p as a pseudo-measure and its residue.
- Extended: IntegralIwasawaTheory L0 (class number formula, control, char multiplicativity) and the ClassFieldTheory layer (Washington Corollary 13.6).

**L1's Corollary III.2.4 gap** is annotated. At the Iwasawa level the equality needs no condition on χ(p); Greenberg's descent is still unread.

**Lean.** Two new checked examples, the valuation bookkeeping and the cancellation step. The file compiles with exit 0; the only warnings are the existing planned stubs.

**Checks.** `check_blueprint --index`: 0 errors, 0 warnings. `check-files`: 0 problems. Every new excerpt was checked by script against its page's text.

**Next.**
- L3: the odd-character/class-group and Greenberg Selmer formulations (RJW §13.5).
- L4: Greither (Numdam), including p = 2.

## Checkpoint 3 (Claude Code, session cc-fb70e5, 29 September 2026): L2 source-decomposed (4 nodes)

Refs #725. **Status: partial.** L0 and L2 are `source_decomposed`, L1 is `partial`, and L3–L4 are `not_read`.

**Source.** Rubin, *Euler systems* (the same PDF, SHA-256 de47655d…). Read: Chapter II §3 (printed pp. 26–29) and Chapter III §2.5–2.10 (pp. 37–39).

**New L2 nodes (p odd, χ even, nontrivial, of order prime to p; no hypothesis on χ(p)):**
- `iwasawa-hypotheses-cyclotomic`: Hyp(ℚ_∞, T*) with τ = 1, Hyp(ℚ_∞/ℚ), and no split primes. This gives Theorem II.3.3, char(X_∞) | ind_Λ(c).
- `limit-unit-diagram`: Proposition III.2.6 (i)–(iii). Y_∞^χ/U_∞^χ is 0 or O according as χ(p) ≠ 1 or χ(p) = 1.
- `lambda-index-of-cyclotomic-units`: ind_Λ(c) = char((E′_∞)^χ/C_{∞,χ}), which divides J·char(E_∞^χ/C_{∞,χ}).
- `cyclotomic-iwasawa-divisibility` (planet): Theorem III.2.7, char(A_∞^χ) | char(E_∞^χ/C_{∞,χ}). The J² is removed through Leopoldt for L.

**New requests:** EulerSystemsAndKolyvaginSystems ES.8 (Theorems II.3.2–3.4, Proposition II.3.7) and SelmerIwasawaCohomology L3 (Iwasawa cohomology, Corollary B.3.4). The IntegralIwasawaTheory L0 request now also asks for Iwasawa's rank-one theorem for Y_∞^χ ([Iw3] Theorem 25) and Leopoldt for real abelian fields.

**Source issue E3 (new, misprint, affects nothing).** The proof of Theorem III.2.10 (p. 39) ends "proves the corollary"; it proves the theorem. It was found while reading ahead for L3.

**For L3 (next):**
- Corollary III.2.8 (equality, by the class number formula) holds for every even χ, including χ(p) = 1. This also fills L1's gap: Greenberg's descent to Corollary III.2.4 for ψ(p) = 1.
- Also Theorem 2.9 (L_χ, char(U_∞^χ/C_{∞,χ}) = L_χΛ), Theorem 2.10, and RJW §13.

**Lean.** One new checked example: coprime to J and dividing J²b implies dividing b. The file compiles with exit 0; the only warnings are the existing planned stubs.

**Checks.** `check_blueprint --index`: 0 errors, 0 warnings. `check-files`: 0 problems. Every new excerpt was checked by script against its page's text.

## Checkpoint 2 (Claude Code, session cc-fb70e5, 29 September 2026): L1 planned (5 nodes)

Refs #725; the bot confirmed the claim. **Status: partial.** L0 is `source_decomposed`, L1 is `partial`, and L2–L4 are `not_read`.

**Source.** Rubin, *Euler systems* (the same PDF, SHA-256 de47655d…, printed page = PDF page − 10). Read: Chapter I Lemma 3.2 and Proposition 6.1; Chapter II §2 (Hypotheses, Definition 2.1, Theorems 2.2–2.3, Remarks 2.4–2.9); Chapter III Lemma 1.1 and §2.1–2.5.

**New L1 nodes:**
- `cyclotomic-hypotheses-and-error-terms`: Hyp(ℚ, T*) with τ = 1, Ω = L(μ_{p^∞}), and n_{W*} = n*_{W*} = 0 by Lemma III.1.1.
- `chi-units-rank-one-and-index`: E_L^χ free of rank one, and ind_O(c) = ℓ_O(E_L^χ/C_{L,χ}).
- `selmer-is-class-group`: H¹_f(ℚ_p, W) = 0, and S_{Σ_p}(ℚ, W) = Hom_O(A_L^χ, D).
- `kolyvagin-class-group-divisibility` (planet): Theorem III.2.3.
- `mazur-wiles-chi-equality`: Corollary III.2.4, with a gap. It is cited to [Ru3], and the class-number argument needs ψ(p) = 1 through L3.

**New requests:** EulerSystemsAndKolyvaginSystems ES.4 (Theorem II.2.2 with ES.1/ES.3), and SelmerIwasawaCohomology L2 (Selmer groups and Proposition I.6.1). The IntegralIwasawaTheory L0 request now also asks for the Galois-module unit theorem and the ψ-parts of the class number formula.

**Findings.** No new source issues. Corollary III.2.4 as printed ("with hypotheses as in Theorem 2.3") relies on its cited proof for the characters ψ with ψ(p) = 1. It is recorded as a planning gap, not as a mistake.

**Lean.** Two new checked examples: 1 ≠ −1 in 𝔽_p for p > 2, and the length-to-order divisibility. The file compiles with exit 0; the 60 `sorry` warnings are the existing planned stubs.

**Checks.** `check_blueprint --index`: 0 errors, 0 warnings. `check-files`: 0 problems. Every new excerpt was checked by script against its page's text.

**Next.**
- L1: the explicit derivative classes for cyclotomic units (Rubin IV–V).
- L2: Rubin II §3 and III §2.5–2.7.

## Checkpoint 1 (cc-39fac3)

Agent: Claude Code — cc-39fac3. Issue #725. First checkpoint.

## What is done

**Layer L0 is source-decomposed**, with 27 nodes:
- 7 constructions, 14 lemmas, 4 theorems and 2 comparisons;
- 28 API items and 23 unit tests;
- 6 planets;
- 26 baseline declarations;
- 6 requests and no gaps.

L0 covers:
- the distribution relation for 1 − ζ over any cyclotomic step, with the sign dictionary to Rubin's
  ζ − 1 form;
- the p-extended numbers c̃_m and their real norms, with the tower and auxiliary relations;
- non-torsion of the family;
- the comparison with the smoothed units c(a) and the smoothing divisor θ_a;
- the verification of Rubin's Definition II.1.1 for (ℚ^ab, p);
- the Kummer classes and the Euler-system theorem;
- χ-components, twisted sums and the Frobenius-factor identity;
- ξ_{n,χ}, which is shown to be a unit, and C_{n,χ};
- Rubin's (4) and (6), and the generation lemma.

**Source findings** (`sourceIssues`, both new):
- **E1.** Rubin's display (III.2) is false at ℓ = 2 in his ζ − 1 convention, for example
  N_{ℚ(i)/ℚ}(i − 1) = 2 ≠ −2. It affects nothing downstream for odd p.
- **E2.** RJW §10.5's c_m = (ξ⁻¹ − 1)/(ξ − 1) equals −ξ⁻¹, which is torsion. Its relation
  "(1 − ℓ⁻¹)c_m" should use the Galois operator 1 − σ_ℓ⁻¹.

## Requests

1. `IntegralIwasawaTheory:L0` for the tower, Galois groups, real subfields, norms, units of
   subfields and the index formula. The suggested file uses stand-ins `zeta`, `Qmu`, `QmuPlus` and
   `unitsTensorRep` only to state signatures.
2. `IntegralIwasawaTheory:I.1` for ℚ_∞, the layers L_n and decomposition groups.
3. `EulerSystemsAndKolyvaginSystems:ES.2` for the carrier, hypotheses, conductor presentation and
   twisting. That roadmap's blueprint issues are blocked.
4. `SelmerIwasawaCohomology:L0` for H¹(F, ℤ_p(1)) and the restriction isomorphism (3).
5. Tau Ceti ProfiniteCohomology Layer 9 for the Kummer norm square.
6. Tau Ceti ClassFieldTheory Layer 12 for the ray class fields of ℚ.

The two Tau Ceti stage requests are carried in `requests` with `neededBy`, not as node
prerequisites, because the checker reads `tauceti:` prerequisites as declarations.

## Lean

`research/blueprint/suggested/EulerSystemsCyclotomicMainConjecture.lean` compiles with exit 0. The
only warnings are `sorry` warnings. It was a single run of the pinned Lean v4.34.0-rc2 against the
prebuilt Mathlib at 082e2d3, with no lake and at least 20 GB free.

The file imports Mathlib only. No Tau Ceti build at f790474 exists on this server, so the Kummer,
Euler-system and twisted-class signatures (nodes `qab-euler-hypotheses`,
`cyclotomic-kummer-classes`, `cyclotomic-euler-system`, `twisted-class-formula`) are recorded in a
comment block against `TauCeti.kummerMap` and the requested suppliers.

## Checks

- `scripts/check_blueprint.py` with the pinned index: 27 nodes, 0 errors, 0 warnings.
- The tower and auxiliary relations were checked numerically in 812 cases (p ∈ {2, 3, 5, 7},
  m < 30, ℓ ≤ 13), with no failure.
- The sign failures of Rubin's (2) were confirmed: exactly the cases with ℓ = 2, for m < 40.

## Sources

**Read:**
- Rubin, *Euler systems*, the author draft; its SHA-256 matches the integrated decomposition's
  record. Sections:
  - I §2 Example 2.1;
  - I §6.2;
  - II §1 and §4;
  - III §1 Lemma 1.1;
  - III §2.1–2.4.
- RJW, arXiv:2309.15692v2, §10.1–10.2 and §10.5.

**Not accessed:**
- the published monograph (Annals Studies 147);
- the published RJW (Essential Number Theory 4);
- Lang's *Cyclotomic Fields*, Theorem 6.3.1. The distribution relation is proved here from the
  minimal polynomials, so this citation is not needed.

## Next steps

L1–L4 are `not_read`, and their coverage records list the sections to read:
- L1: Rubin III §2.3–2.4 with Chapters IV–V.
- L2: Rubin II §3 and III §2.5–2.7.
- L3: Rubin III §2.8–2.10 and RJW §13.
- L4: Greither 1992, §§1–4, on Numdam.

The integrated decomposition's L1–L4 nodes are reviewed leads: reuse their locators and ids.
