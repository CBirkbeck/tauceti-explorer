# Review: ArithmeticKTheory (K-theory of number fields and S-integers), part N.1, stages N.1–N.6

Job `REV-ArithmeticKTheory--N.1` (issue #352), by Claude Code, session `cc-38267a`, 25 September 2026. The packet was written by Claude Code, session cc-7b31c4 (`BP-ArithmeticKTheory--N.1`); I had no part in it. **Status: accepted**, after the corrections below, which were made in place. The packet stays `partial`: its open gaps and requests are recorded.

## What was checked

- **Sources.**
  - Weibel, *The K-book*, author-hosted draft of 29 August 2013 (`https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf`, SHA-256 a04f53c9…).
  - Weibel's errata to the published GSM 145 printing. The live file returns 404, so it was read from the Wayback Machine copy (SHA-256 ef7ed6d0…).
  - For the wild kernel, Weibel's preprint *Higher wild kernels and divisibility in the K-theory of number fields* (`https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf`, SHA-256 2675756f…), which the K-book cites as [225].
  - The published edition was not read, so every finding is scoped to the draft; `sourceVersions` records all three files.
- **Checkers.** Three worked in parallel:

  | Checker | Scope |
  |---|---|
  | C1 | N.1 and N.2 (9 nodes) |
  | C2 | N.3, N.3:finite-generation, N.3:ranks and N.4 (11 nodes) |
  | C3 | N.5 and N.6 (8 nodes), plus the 22 baseline declarations, the gaps, the restructure entries, the coverage records and a stage-level cycle check over the whole packet |

  Each checker:
  - compared every locator and excerpt with the draft's text layer, and with rendered pages where formulas mattered;
  - opened every cited declaration at Mathlib 082e2d3 and Tau Ceti f790474;
  - read every supplier stage in `data/atlas.json`;
  - wrote its corrections as a machine-applicable patch.

  I applied the patches and resolved their overlaps, then validated the result. C1 and C2 both moved Soulé's theorem out of N.2, while C3 had kept it there. C3 had also rewritten requests, gaps and coverage for other checkers' stages.
- **What I checked myself.**
  - **w_i(ℚ).** I recomputed w₂(ℚ) = 24 and w₁₀(ℚ) = 264 as the largest m for which (ℤ/m)^× has exponent dividing i. For i = 10: 2³ from (ℤ/8)^×, 3 from 2 | 10, 11 from 10 | 10, and no factor 5 since 4 ∤ 10. The source's 1320 is wrong (E9).
  - **Node-level cycles.** None.
  - **Stage-level cycles.** None from the atlas (`requires` and `stageEdges`) plus this packet. Then with every other packet on main added, and the reviewed K2SymbolsBrauer T.3 packet of PR #2893 (see "Cycles" below).
  - **Baseline.** Every baseline declaration is in the pinned index under its module, and every one is cited by a node.
- **Checks.**
  - `python3 scripts/check_blueprint.py --index <pinned declaration index> research/blueprint/packets/ArithmeticKTheory--N.1.json`: 0 errors, 0 warnings. The original packet also passed; the checker does not test test kinds, stage-level cycles or whether a statement is true.
  - My own validation:
    - every test has a §12 kind;
    - every excerpt is literal and at most 300 characters;
    - every gap and every request has `neededBy`.

## Counts

| | before | after |
|---|---|---|
| nodes | 28 | 44 (25 added, 19 corrected, 9 removed) |
| API items | 26 | 51 |
| unit tests (all with a §12 kind) | 16 (none with a kind) | 38 |
| planets | 9 | 13 (at most 4 per layer) |
| baseline declarations | 22 | 73 (54 added, 3 removed) |
| requests (all with `neededBy`) | 11 (none with `neededBy`) | 22 |
| gaps (all with `neededBy`) | 5 (with stage ids as `neededBy`) | 6 |
| restructure entries | 3 | 14 |
| source issues | none recorded | 24 |

**Verified unchanged:** none. Every original node needed a correction.

**Removed, with their content moved.** All nine were registers of imports, notes about what is not covered, or duplicates:
- N.1/K0-of-S-integers: a register of KTheoryLowDegrees Z.4. Its content went to the Z.4 request and the N.1 coverage note.
- N.2/exactness-gives-no-injectivity: a note, with the wrong degree-zero witness. It is replaced by N.2/even-degree-injectivity.
- N.2/soule-odd-isomorphism: moved to N.5/soule-theorem (see below).
- N.3/what-the-combination-does-not-give: a note. Its content went to the N.3 coverage note.
- N.3:finite-generation/the-two-inputs-and-their-owners: a register. Its content went to the requests to R.1, H.2, K.1 and L.1 and to the rewritten gap.
- N.3:ranks/the-first-K-group-is-not-covered: a note, with wrong numbers. The two ranks agree exactly when |S| = 1.
- N.4/the-invariant-is-not-the-roots-of-unity: a note. It is now a non-example test of N.4/the-w-invariant.
- N.5/naturality-of-the-e-invariant-and-extensions: a rule, not a declaration.
- N.5/odd-groups-of-ring-and-field-agree: a restatement of Soulé's theorem.

## The main corrections

**Throughout.**
- **Page numbers.** Every locator gave the book page, sometimes one page low, as the "PDF page". PDF page = book page + 8.
- **Excerpts.** Most were ASCII paraphrases ("(+)", "=" for ≅, "Soule"). Several were over 300 characters. One silently corrected a misprint.
- **The fix.** All are now literal excerpts, with both page numbers.

**N.1: the carriers.**
- **S-integers-as-a-localisation.** It planned a construction whose API duplicated Mathlib's `Set.integer`, Tau Ceti's Dedekind instance and `integerClassGroupEquiv`. It is now a theorem: `IsLocalization M (S.integer K)` holds exactly when every element of M is a unit in O_S and every v ∈ S contains an element of M.
- **Added lemmas:** monotonicity in S, the finite-extension statement, and the case of a torsion class group.
- **K1-of-S-integers-and-the-determinant.** It cited `fg_units_integralClosure`, which concerns the units of an integral closure. The right declaration is `Set.unit_fg_of_units`. The node is narrowed to what N.1 owns: F^× is not finitely generated, while the S-units are.
- **norms-transfers-and-pullbacks.** It claimed that transfer after pullback is multiplication by the degree on K₀, which is false. Ex. II.2.2 gives multiplication by the class [O_{F′,S′}], and on the class group c ↦ c^d. Degree one is split off as N.1/transfer-and-norm-on-units.

**N.2: localisation.**
- **localisation-sequence-for-a-dedekind-domain.** It now has a proof: the sequences for R → R[1/s], dévissage and the colimit, with regularity from flatness.
- **finite-support.** It is re-proved from dévissage for each s plus K.7's colimit over rings, so it now precedes the sequence instead of depending on it.
- **the-three-classical-rows.** It was a note that imported K2SymbolsBrauer T.5, which closed the stage cycle N.2 → T.5 → N.2. It is now a genuine comparison of the end of (6.6) with the divisor, unit and class-group sequences. The class map is e_𝔭 ↦ [𝔭]⁻¹, a sign it now fixes. The degree-two row (6.6.1) is stated with the boundary of (6.6).
- **The tame symbol stays on the K2SymbolsBrauer side.** The identification of ∂ with the tame symbol is K2SymbolsBrauer T.3/localization-boundary's, and T.5 combines the two into the tame-kernel sequence. Importing it into N.2 closed a second cycle through the other packets (see "Cycles").
- **Soulé's theorem.** Its proof uses Quillen's finite generation ("the fact that Kn(R) is finitely generated (IV.6.9)", PDF p. 420), and N.3:finite-generation requires N.2. It therefore moves to N.5 as N.5/soule-theorem, with its finite-coefficient input N.5/soule-mod-l-surjectivity (Prop. V.6.8.1).
- **Added:** N.2/even-degree-injectivity, proved from K_{2j}(𝔽_q) = 0; the transfer morphism of sequences; and the S-unit and class-group sequence.

**N.3: finite generation and ranks.**
- **IV.6.9 covers rings of integers, not S-integers:** "an integrally closed subring of a number field F, finite over Z". The node is split into:
  - Quillen's finiteness criterion;
  - Quillen's theorem for 𝓞_F;
  - the passage to O_{F,S} by localisation, dévissage and L.1.
- **The finite-field input** is KTheoryFiniteLocalFields L.1's, not GeneralAlgebraicKTheory K.1's.
- **borel-rank-theorem.** It called every ring of S-integers an order, which is false: an order is finitely generated over ℤ. It now applies IV.1.18 with A = F and passes to O_{F,S} by tensoring the localisation sequence with ℚ.
- **The rank formula** was recomputed for n ≥ 2: r₁ + r₂ for n ≡ 1 and r₂ for n ≡ 3 (mod 4), and 0 for n even.

**N.4: the numbers w_i(F).**
- **the-w-invariant.** It bundled the e-invariant, which needs K-theory and moved to N.5.
- **The twists.** It took the twists from K2SymbolsBrauer T.7. Their owner is MotivicEtaleKTheory M.1, which N.4 requires in the atlas.
- **Restriction and transfer** are built on Tau Ceti's `ContCohomology.explicitRes0`, `explicitCor0` and `explicitCor0_comp_res0`.
- **Added:** the exponent criterion (Lemma VI.2.2.1), finiteness, and the 2-primary Proposition VI.2.3.
- **exceptional-fields-at-two.** It is now a definition with tests. Its claim that the Harris–Segal summand exists only for non-exceptional fields contradicted Remark 2.5.1.
- **w2-of-the-rationals-and-the-divisibility-tests.** Its prerequisite SpecialValuesBirchTate B.3 closed the cycle N.4 → B.2 → B.3 → N.4. B.3 consumes w₂(ℚ) = 24 rather than supplying it.

**N.5: the odd groups.**
- **Added:** N.5/soule-theorem, the e-invariant, the Harris–Segal summand, and the odd rows of Theorem VI.8.2 at primes where the cohomological dimension is two.
- **totally-imaginary-integral-structure.** It is restricted to the odd row n = 2i − 1 ≥ 3, because the even row of Theorem 8.4 needs the even row of Theorem 8.2, which is N.6's.
- **the-real-case-modulo-eight.**
  - It claimed that the table degenerates to the totally imaginary one when r₁ = 0, which is false: K₃(ℤ[i]) ≅ ℤ ⊕ ℤ/24, not ℤ/48.
  - The table is now exact, with the r₁ > 0 hypothesis shown to be essential.
  - Theorem VI.9.4 is imported from M.7.

**N.6: the even groups.**
- **the-two-primary-corrections.**
  - Its Theorem VI.9.12 excerpt was fabricated: the source has no "2^{r₁} divides |K₂ᵢ₋₂(O_S)|", and the claim is false (|K₆(ℤ)| is odd).
  - It is rewritten with the exact eight-row table of Theorem 9.11 and its twists.
  - The signature defect (Definition 9.6.1) and the true order-ratio Theorem 9.12 are added as separate nodes.
- **tame-and-wild-kernels.** It duplicated K2SymbolsBrauer T.5's tame kernel. It asserted "div K₂ᵢ(F) ≅ wild kernel" as a theorem, but Weibel 2006 (Theorem A, Example 5.6) shows the index is 2 for odd i and special F. It is re-scoped to the wild kernel, with the divisible subgroup and the comparison added.
- **certificate-driven-computation.** It duplicated T.5's `OrderCertificate` on Mathlib's `Module.Presentation`. It is re-scoped to the cohomological lower bound built on that format.
- **even-groups-at-odd-primes.** It is split by degree; the odd rows go to N.5.

**Requests.**
- None of the 11 original requests had `neededBy`; all 22 now do, and each need quotes the supplier stage's text.
- **Corrected:**
  - K.1 does not own the finite-field K-theory (L.1 does) or the colimits (K.7 does);
  - K.3 does not own the projection formula;
  - R.3 does not own the higher regulator (R.4 does);
  - T.7 does not supply the twists (M.1 does).
- **Removed:** the request to B.3, which closed a cycle.
- **Added:** L.1, L.2, L.3, L.7, M.1, M.2, M.3, H.2, H.6, U.3, U.5 and K.7.

**Coverage.** N.2, N.3, N.3:finite-generation, N.5 and N.6 had claimed `source_decomposed` with nothing remaining while carrying gaps. They are now `partial`, with the remaining items listed.

## Cycles

- **Within this packet, against the atlas:** none after the corrections.
- **Before, two cycles:**
  - N.2 → K2SymbolsBrauer T.5 → N.2 (the reviewed T.5 imports N.2);
  - N.4 → SpecialValuesBirchTate B.2 → B.3 → N.4.
- **With every other packet on main added,** one loop remains, and this packet no longer contributes to its first form:
  - **Form 1:** N.2 → K2SymbolsBrauer T.3:localization-comparison → T.2:graded-map → K3BlochGroups V.2 → N.3:finite-generation → N.2. The first edge (N.2 importing T.3/localization-boundary) was removed here.
  - **Form 2:** N.5 → MotivicEtaleKTheory M.8 → BorelRegulators R.7 → Polylogarithms P.2 → K3BlochGroups V.3 → V.2 → N.5.
- **The shared edge** is K3BlochGroups:V.2/k3-rank-borel importing N.3:finite-generation and N.5. The atlas has N.5 → K3BlochGroups V.6, not V.2. V.2 needs only the rank of K₃ of the field, which Borel's theorem for fields gives directly (K-book IV.1.18 with A = F; BorelRegulators R.3).
- **Disclosure.** I reviewed the K3BlochGroups packet (REV-K3BlochGroups, PR #2861), and its stage check covered the atlas and that packet only, so it did not see this loop.

## Source issues

The packet recorded none. The review adds 24, each checked at its locator and marked `confirmed`. The errata list was searched for every one.

| id | kind | locator | finding |
|---|---|---|---|
| E1 | misprint | III.2.5 | Bass–Milnor–Serre needs I to be a nonzero ideal |
| E2 | misprint | V.6.6 | "R and F and regular" should be "are regular" |
| E3 | misprint | V.6.6.1 | "∂ in K∗(R)-linear" should be "is" |
| E4 | gap | proof of V.6.8 | it applies IV.6.9 to any Dedekind domain with global fraction field; K₁(ℤ₍₂₎) is not finitely generated, so a colimit argument is needed |
| E5 | error | after Prop. V.6.8.1 | "false for n = 1" overstates it: the cokernel is Pic(R)/ℓ, and the map is onto for R = ℤ |
| E6 | misprint | proof of V.6.8.1 | missing ℤ/ℓ coefficients; ∂(x) should be ∂(s) |
| E7 | error (known) | V.6.8.2 | div K₂ᵢ(F) is the wild kernel only up to index 2; corrected in the cited [225] |
| E8 | misprint | Ex. VI.2.1.1 | w_i(𝔽_q) = q^i − 1 holds for i ≥ 1 only |
| E9 | error | Ex. VI.2.1.2 | w₁₀(ℚ) = 264, not 1320 |
| E10 | misprint | Rem. VI.2.1.3 | the degree should be 8k + 4 (π_odd(BU) = 0) |
| E11 | misprint | proof of Lemma VI.2.2.1 | "exponent i" should be "exponent dividing i" |
| E12 | misprint | after Ex. VI.2.2.2 | (ℤ/2^ν)^× contains three involutions for ν ≥ 3, not two |
| E13 | error | after Prop. VI.2.3 | ℝ is not exceptional under the printed definition; the claim holds for number fields |
| E14 | misprint (known) | VI.8.1 | rank r₂ + \|S\| − 1 should be r₁ + r₂ + \|S\| − 1 (errata p. 564) |
| E15 | misprint | VI.8.1 | "K_n(F) are finite when n is even" should be K_n(O_S): K₂(ℚ) is infinite |
| E16 | error | (8.1.1) | the sequence is not exact for S = ∅ |
| E17 | misprint | proof of VI.8.2 | K_{n−1}(R/𝔭) should be O_S/𝔭 |
| E18 | error | Birch–Tate 8.6 | "a pole of order r₂ at s = −1" should be a zero |
| E19 | misprint | proof of VI.8.8 | O_F[1/ℓ] should be O_F[1/2] |
| E20 | misprint | Thm VI.9.4 | ℤ/w₄ₖ(F) should be ℤ/w₄ₖ⁽²⁾(F) |
| E21 | misprint | proof of VI.9.11 | the twist i should be i + 2 |
| E22 | misprint | proof of VI.9.11 | H¹(R; ℤ₂(i)) should have ℤ/2^∞ coefficients |
| E23 | misprint | proof of VI.9.12 | h¹ⁱ(2) should be h²ⁱ(2) |
| E24 | gap | proof of VI.9.12 | Ex. 8.3, stated for odd ℓ, is used at ℓ = 2 |

## Suggested Lean file

**The old file.** It did not compile: at line 64 a `variable` follows a docstring. Most of its statements were `: True := by sorry`, and three definitions were Prop-valued placeholders (`arithmeticTransfer`, `eInvariant`, `tameKernel`). It violated §13.

**The new file.**
- **Size.** It is 1672 lines, rewritten by a separate agent against the corrected packet. It imports 25 Mathlib and 16 Tau Ceti modules one by one.
- **Header.** It states the pinned conventions:
  - `O_{F,S}` is `Set.integer`;
  - the class map is e_𝔭 ↦ [𝔭]⁻¹;
  - w_i(F) = |H⁰(F, ℚ/ℤ(i))|;
  - the rank formula goes by n mod 4;
  - PDF page = book page + 8.
- **Stand-ins.** These are honest local definitions, each documented against its supplier:
  - K₀ is Tau Ceti's split Grothendieck group of finitely generated projectives;
  - K₁ is the abelianisation of the stable general linear group;
  - ℚ/ℤ(i) is the roots of unity of a separable closure with g acting by ζ ↦ g^i(ζ), a real Galois module linked to Tau Ceti's `KummerCoeff` and Mathlib's `modularCyclotomicCharacter`;
  - W_i(F) is Tau Ceti's `ContCohomology.H0` of that module.
- **What is stated in Lean.**
  - 33 of the 51 API items and 23 of the 38 tests, as `example`s.
  - The N.1 S-integer statements: the localisation criterion, monotonicity, the finite extension, and the Steinitz-class formula on K₀.
  - N.2's S-unit and class-group sequence, and row (a) of the classical rows.
  - All of N.4: the exponent criterion, Propositions VI.2.2 and VI.2.3, finiteness, and w₂(ℚ) = 24 and w₁₀(ℚ) = 264.
  - The signature defect and the divisible subgroup of N.6.
  - A few easy statements are actually proved rather than `sorry`, for example `res_injective`, `cor_comp_res` and the S-unit sequence's exactness.
- **What is a comment instead.** Every statement about K_n for n ≥ 2, the localisation sequence, étale cohomology or the e-invariant names its missing carrier and supplier (K.1, K.3, K.7, M.1–M.3, M.7, M.8, L.1, L.2, L.7, T.5, T.7). All 133 packet names (44 node ids, 51 API names, 38 test names) appear in the file.
- **Checks.**
  - It has no `True`, `Unit` or opaque carriers, no `set_option` and no root imports.
  - It elaborates with exit code 0 against Mathlib 082e2d3 and the Tau Ceti f790474 sources. The only warnings (124) are uses of `sorry`.
  - The Tau Ceti modules it imports are not built in the local Mathlib-082e2d3 project. The needed modules were therefore compiled with `lean -o` from the f790474 sources and placed first on `LEAN_PATH`; the file header says so.

**Corrections to the packet found while formalising.** Each was applied in the packet and noted in the node's `checked` entry.
- **The signature defect.** Defined as the cokernel of α¹ on H¹_et(R; ℤ/2) with no assumption that 1/2 ∈ R, it contradicts the node's own API. H¹_et(Spec ℤ; ℤ/2) = 0, so j(ℤ) = 1 = r₁, against `signatureDefect_lt_nrRealPlaces` and against j = u − t = 0 for ℚ. j is now r₁ − dim sign(F⟮S, 2⟯), with Mathlib's Selmer group. When 1/2 ∈ R it agrees with Definition VI.9.6.1, which is the setting of Theorem VI.9.11.
- **Restriction and transfer of W_i.** For an abstract extension they are not canonical when i ≠ 1: two embeddings into F^s differ by ζ ↦ ζ^{χ(σ)}, which is non-trivial on W₂(ℚ) = μ₂₄. They are now taken along intermediate fields of F^s.
- **The sign of Tau Ceti's `Set.unitValuation`.** It records −ord, so the pinned class map reads f ↦ ∏[v]^{f(v)} in its coordinates. This is recorded on N.2/S-unit-and-class-group-sequence.
- **"F ∩ ℚ(ζ_{2^∞}) is totally real".** It needs an ambient field, now named.

## Questions for the orchestrator

1. **Cross-packet cycle.** The K3BlochGroups packet's V.2/k3-rank-borel should import BorelRegulators R.3 for the rank of K₃(F), instead of ArithmeticKTheory N.3 and N.5 (see "Cycles"). That packet is outside this job's deliverables.
2. **Stage texts.**
   - N.2's stage text should point to N.5 for Soulé's odd-degree isomorphism.
   - N.1's text should name the owners of its two imported computations (KTheoryLowDegrees Z.4 and U.4).
   - Ownership overlaps: BorelRegulators R.3 and N.3:ranks both claim the S-integer rank formula, and SpecialValuesBirchTate B.1 re-plans W₂(F). These are recorded as restructure entries.
3. **Part README.** `research/blueprint/readmes/ArithmeticKTheory--N.1.md` is not a deliverable of this job, so it was not edited. It repeats three statements corrected here and should be regenerated from the corrected packet:
   - IV.6.9 covers O_{F,S};
   - the false Theorem 9.12 claim;
   - the table degenerating when r₁ = 0.
4. **Missing suppliers.** No stage owns K-theory with finite coefficients or Suslin's computation of the torsion in K_*(F^s). These are recorded as gaps.
