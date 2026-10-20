# Independent package review: noncommutative and equivariant Iwasawa theory (round after FIX ~adv3)

Issue #11321, `REV-PKG-NoncommutativeAndEquivariantIwasawa~codex3`. Reviewer: Claude (Opus 5.5), session `claude-KkQWd3`, 20 October 2026. **Verdict: accepted**, with the in-place corrections listed below. This is a completed independent fixing review, not a checkpoint.

I did not write or review any earlier version of this package, its plan or its fixes. The fix worker's self-assigned `accepted` in `review.json` (FIX ~adv3) is replaced by this verdict. Inputs read: the package (`README.md`, `Suggested.lean`, `metadata.toml`), the previous independent review `REV-PKG-NoncommutativeAndEquivariantIwasawa~codex2.md` (needs_changes, six findings), the earlier unsuffixed review, and the handoffs of FIX ~adv, ~adv2 and ~adv3. Edits are confined to the package files, `review.json` and this report.

## The six findings of the previous review

| Finding (~codex2) | Where it is closed | Independent check |
|---|---|---|
| 1. Filtered homological transfer, §0.5 | `filtered_gldim_le` and `filtered_grade_ge`, with proofs | Re-derived: strict lifting of graded free resolutions; graded-projective syzygy by graded Schanuel; idempotent refinement x ↦ 3x²−2x³ in the complete ring of filtered endomorphisms, so the syzygy is a summand of a filtered free module; Auslander's sup. Sound. The convergence sentence of step 4 claimed the filtration is "finite in each degree"; replaced by the correct reason (complete, exhaustive, closed images by step 1, separated induced filtration). |
| 2. Nonuniform global dimension, §0.11 | `brumer_gldim` | Re-derived: semiperfect adic ring, pd via Tor against Λ/J, Ext between simples equals continuous cohomology after untwisting, Serre's theorem, lower bound by right exactness of H^d, change of rings along the central regular ϖ for O[[G]] with the Ext long exact sequence giving Ext^(d+1)_O[[G]](k,S) ≅ Ext^d_k[[G]](k,S). Sound for every O. Step 6 claimed a free resolution of ℤ_p over Λ(U) "of length d+1"; corrected to length d (pd ℤ_p = d; d+1 is attained by 𝔽_p). |
| 3. Determinant presentation, §§2.7, 2.9 | `chLocalized_bijective`, §2.9 step 5 (Muro–Tonks–Witte presentation and a fibre-groupoid five lemma) | Argument read and accepted. Its Checks recomputed: K₁(ℤ_p[[T]][1/T]) = T^ℤ × ℤ_p[[T]]^× (localization sequence), and the `matrix_inverse` orientation T/(T+p). Muro–Tonks–Witte locators verified on arXiv:1006.5399v2: Definition 1.5.1 pp. 17–18, (R9) p. 18, Theorem 1.5.4 p. 19; **Theorem 1.6.3 is on p. 23, not p. 20** (corrected in §§2.7, 2.9 and References). |
| 4. Finite Whitehead inputs and continuity, §§3.11, 6.5 | `k1Prime_equiv_limit` (compactness), `sk1_pGroup`, `sk1_vanish_abelianSylow`, `dressWall_induction`, §6.5 by characters; `k1_continuity` cited with no dependents | Every step re-derived (details in the adversarial table). All Chinburg–Pappas–Taylor, Kakde and Platonov–Rapinchuk–Rapinchuk locators verified (below). One precision fix: CPT II Theorem 4.3 is stated at the prime p; the every-prime-ℓ form used in step 4(d) is Serre's Theorem 28, which the README now says. |
| 5. Perfection with p-torsion, §4.5 | `iwasawaComplex_perfect_withPTorsion`, `iwasawaComplex_baseChange` | Re-derived: Shapiro to induced coefficients, flat cochains over the symmetric algebra (ℤ/p^n)[G/U], minimal complexes with Tor-amplitude [0,2] from cd_p ≤ 2, Pontryagin duality, Mittag-Leffler limit of minimal models. Witte Propositions 3.2 (p. 6) and 3.7 (p. 8) verified. |
| 6. Local determinant and height comparisons, §§7.15–7.17 | η_p by the two-term Bloch–Kato complex, cohomology-level duality, ε_dR by inertia descent; (C1) comparison from Nekovář 12.5.6; height defined as Nekovář's Bockstein pairing | Re-derived the (C1) comparison and the DVR-block rank count r(SC_U) = −h. Nekovář locators verified on the Numdam scan (printed = PDF − 9): 8.8.1 condition (U) p. 230, Proposition 8.10.1 p. 249, 11.1.3–11.1.4 pp. 354–355, 11.2.8–11.2.9 p. 363, Theorem 11.3.9 p. 370, 12.5.6.1–12.5.6.5 p. 447, Lemma 12.5.7 p. 448. Deligne, *Les constantes …*, §5, (5.2)–(5.4), p. 548, verified in the cleared Antwerp II copy. |

All six findings are closed by stated, sourced targets.

## Corrections made in this review

Supplier contracts (checked against TauCetiRoadmap main 5753fe0b and the heads of the ten open pull requests):

1. **AnalyticNumberTheoryPartI (#1126):** §2.18 is only the Euler-product comparison of Artin coefficients; Dedekind continuation and residue are its §2.5. Contract, §7.12 (proof and Needs) and the Layer 7 dependencies now cite §2.5.
2. **Atlas stage id removed:** §§6.17 and 6.18 cited "AnalyticNumberTheory AN.4", which is neither on TauCetiRoadmap main nor an open pull request; replaced by AnalyticNumberTheoryPartI §2.18 (and Clifford theory for §6.17).
3. **InductionRestriction:** Layer 5 states Clifford's theorem and correspondence, but neither the isotypic-or-induced dichotomy nor the monomiality of p-group representations. These are now targets of §6.17 (`clifford_isotypic_or_induced`, `pGroup_monomial`) with proofs (second-centre abelian normal subgroup, stabilizer of an isotypic component). §6.17's Lemma 92 now has the direct proof that a central Z ≅ ℤ_p acts by a finite-order scalar whose character extends to Γ. Layer 7 (factor sets), already cited in §§3.12 and 6.7, is added to the contract heading.
4. **AlgebraicKTheory A3 (#1142):** no statement about K₁ of a radical ideal; the README cited three anchor ids (`relative-K1`, …) that do not exist upstream. The contract now names what A3 states. The generation of K₁(R, I) by 1 + I for a radical ideal is CPT II Lemmas 2.1–2.2, now cited in the contract and in §6.11's Needs.
5. **CompletedCohomologyPartII F.2 (#1035):** no Hochschild–Serre spectral sequence for compact homology. §3.6 now constructs it as the target `hochschildSerre_compactHomology` (Shapiro to Λ_O(G/N) ⊗ P_•, then F.2's hyper-Tor sequence); §3.7 uses it.
6. **ProfiniteProPGroups / Tau Ceti:** Layer 9 uses `completedGroupAlgebra` with ℤ_p coefficients only, and no augmentation declaration exists; the augmentation is described as the projection to the trivial quotient. The zero-based indexing of `pLowerCentralSeries` is recorded in ProfiniteProPGroups, now said.
7. **Pin status:** `TauCeti.twistedMonoidAlgebra`, `TwistedMonoidAlgebra.basis`, `of_mul_of` and `isUnit_of` are already at the pin (`TauCeti/Algebra/MonoidAlgebra/Twisted.lean`); the README said main only. `TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary` is main only, now said.
8. **PadicHodgeTheory (#1062):** the nonexistent anchor `weil-deligne-parameter` replaced by §5.3 (D_pst and Fontaine's recipe); likewise `leopoldt-statement` in §7.10 replaced by a description of SelmerIwasawaCohomology §4.18.
9. **Downstream consumers and scope:** the sentence "every roadmap named in this file is on main or an open pull request" was false for the downstream list; it now speaks of the roadmaps imported from. CompletedCohomologyPartII and PadicMeasuresIwasawaAlgebras were listed as consumers but are suppliers (CompletedCohomologyPartII #1035 itself calls this roadmap its downstream consumer); removed, with a sentence saying so. The ScholzeFunctor bullet (it used only CompletedCohomologyPartII) and the StableReduction bullet (StableReduction on main uses no noncommutative determinant) are removed.

Mathematics and form:

10. §2.13 step 2 used an undefined Ω′(G) and omitted the surjectivity K₀(Ω(G)) → K₀(Ω(G)_{S′}). Now Ω′(G) = Λ(G)_S/p = Ω(G)_{S′}, the localization sequence is CFKSV (85), p. 191, and the surjectivity is McConnell–Robson Theorem 12.4.9, as CFKSV cite it on p. 192 (verified).
11. §0.10's Needs added CompletedCohomologyPartII §5.5, which its proof imports.
12. §6.28: the Check "Q = C_p²" was ambiguous (for the cyclic group the top Möbius coefficient is 0); now C_p × C_p with p+1 lines, and the cyclic case stated. A duplicated Needs entry removed.
13. §7.11's construction steps were numbered 1, 2, 2; renumbered.
14. Namespace: the README said declarations live in `TauCeti.NoncommIwasawa`, while `Suggested.lean` uses `TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa`; the README now states the file's namespace and calls `TauCeti.NoncommIwasawa` the suggested library layout.
15. `Suggested.lean` docstrings (no declaration changed): `saturatedSet` no longer suggests a centrality hypothesis the definition does not have; `carryExponent_cocycle` no longer claims more than the cocycle identity it states; the module docstring says the completed group algebra is on Tau Ceti main, not at the pin. §0.4 notes that `of_sub_one_pow_char` needs only z^p = 1.
16. Formatting: two Checks lists split by a stray blank line (§§2.9, 4.5) joined; source correction E41 moved to its place after E40.

## Sources

Reproducible sample: `random.Random(11321).sample` of the 134 numbered subsections gave 7.12, 3.8, 2.9, 3.14, 3.10, 3.7, 6.34, 2.4, 4.8, 0.9, 0.6, 6.3, 7.16, 3.6, 6.15. Every locator in their source paragraphs was checked against the text (pdftotext with page headers):

| Subsection | Locators checked | Result |
|---|---|---|
| 2.4, 2.9, 3.6, 3.7, 3.8, 3.10, 3.14 | CFKSV (Numdam, printed = PDF + 162): Lemma 3.1 p. 171; (24) p. 174; Theorem 3.6 p. 177; Theorem 3.8 p. 180; Lemma 3.9 p. 181; Theorem 3.10 pp. 183–184; Conjecture 4.8 and Lemma 4.9 p. 196, evidence p. 197 | all correct |
| 6.3, 6.15, 6.34 | Kakde v3 (printed = PDF): Theorem 11 p. 13, proof ends p. 90; Theorem 21 p. 19; Theorems 52–53 p. 36 (§5.2.3), proofs p. 65 | correct |
| 7.12, 7.16, 4.8 | Burns–Venjakob v2: Remark 5.4 p. 25; Conjecture 6.1 p. 28; Lemma 6.2 p. 30; Nekovář as above | correct |
| 0.9 | Ardakov–Brown v1 §3.1 Theorem p. 5, §3.4 Theorem p. 7; Venjakob 2002 Theorem 3.22 p. 17 (extra-powerful = [G,G] ⊆ G^{p²}, which at p = 2 is the uniform condition), Theorems 3.26, 3.29, 3.30 pp. 18–20 | correct |
| 0.6 | Schneider, *p-Adic Lie Groups* (cleared; printed = PDF − 6): Proposition 26.5 pp. 184–185, Corollary 26.12 p. 188; also Theorems 27.1 p. 192, 28.3 p. 199, 29.8 p. 206 | correct |
| 2.9 | Muro–Tonks–Witte v2 | Theorem 1.6.3 p. 23 (README had p. 20): corrected |

Locators of the new §3.11 material, all verified: CPT II (arXiv:1303.5337v3, printed = PDF) Theorems 1.2 and 1.5 p. 3, Theorem 1.6 p. 4, Lemma 2.1 p. 6, Lemma 2.2 and Proposition 2.3 p. 7, Proposition 4.2 p. 29, Theorem 4.3 p. 30, Example (i) of §4.c p. 31, Theorem 4.4 p. 32, Corollary 5.4 p. 35 (proof p. 36; its Standing Hypotheses require pR prime, so W unramified, as the README restricts); CPT I (arXiv:0904.2563v1) Propositions 5.1–5.2 p. 27, Theorem 5.4 p. 28; Kakde Definitions 6–7 p. 9, Lemma 17 p. 16, Lemma 19 p. 17, Fukaya–Kato 1.5.1 restated p. 18, Wall/Oliver 2.5 p. 19, Corollary 20 p. 19, Theorem 25 p. 20, Oliver Proposition 12.7 pp. 24, 26; Platonov–Rapinchuk–Rapinchuk vol. I (cleared, printed = PDF − 16) §1.4.3 p. 33, Theorem 1.23 p. 34.

Own words: a 9-word shingle comparison of the README with the extracted texts of CFKSV, Kakde, Burns–Venjakob, CPT I and II, Muro–Tonks–Witte, Witte, Venjakob 2002, Ardakov–Brown, Neeman–Ranicki and the cleared Schneider and Platonov–Rapinchuk–Rapinchuk excerpts finds no shared run longer than 23 words; every run of 13 or more words is a bibliographic title or a displayed formula. There is no section-by-section summary.

## Adversarial mathematics pass

| Statements | Instances computed | Outcome |
|---|---|---|
| §0.1 uniform groups | ℤ/p (powerful, indices p, 1); ℤ_p^d; Γ₁(GL_d(ℤ_p)) at odd p, level 4 at p = 2 | correct |
| §0.5 filtered transfer | ℤ_p[[T]] (bound 2 attained); ramified O with p-adic filtration (gr has infinite gl.dim) vs ϖ-adic | correct; convergence reason fixed |
| §0.7 p-valuations | ℤ_p with 1+v_p (saturated), 2+v_p (not saturated; saturation p⁻¹ℤ_p); p = 2 needs weight 2 | correct |
| §0.9 integral grading | a b a⁻¹ = b^{1+p}: [a−1, b−1] has leading term p(b−1); at p = 2, w⁴−1 ∈ m³ | correct |
| §0.11 global dimension | ℤ_p × ℤ/ℓ (2); ℤ/p (infinite); trivial ℤ_p over Λ(U) has pd d | step 6 corrected |
| §§1.4–1.10 canonical sets | G = Γ, H = 1: S = Λ ∖ pΛ, S* = Λ ∖ 0; prime radical of M₂(𝔽_p[ε]) | correct |
| §2.6 | ℤ_p² with H one factor: Λ_S = ℤ_p[[U,V]]_{(p,U)} | correct |
| §§2.7, 2.9 signs | ch[C_T] = T⁻¹, ∂ch = −[C]; T/(T+p); K₁(ℤ_p[[T]][1/T]) = T^ℤ × units | correct |
| §2.13 | definition of Ω′(G), surjectivity of K₀(Ω) → K₀(Ω_{S′}) | gap in the write-up closed |
| §3.3 zero/pole | p = 3, a = 4, b = 7: value −4/7 after cancelling T | correct |
| §3.6 | Λ/(T−p): χ = p = |−p|⁻¹; 𝔽_p: χ = 1; Λ/p: χ = p | correct |
| §3.9 / §5.4 X₁(11), p = 5 | 5¹²/… from Theorem 3.10 with n_ρ = 4; v₅ = −1/2 + 3/2 + 2 = 3 and −3/2 + 5/2 = 1 | correct |
| §3.10 twist | [γ] at η: a(1+T); inverse substitution gives a⁻¹(1+T) | correct |
| §3.11 SK₁ | γ^{p^n} invisible at levels ≤ n; S₃ at p = 2, 3, 7; C_p ⋊ C₂ kernel pro-p; ℓ-root argument in 4(c); ℓ-elementary groups have normal Sylow p | correct |
| §6.5 | ℤ₅[C₂]: torsion of K₁ has order 16 vs 8 | correct |
| §6.8 | θ([g]) = (1, g), nr(g) = 1 at odd p, −1 at p = 2; (u^p, u) with u^{p²} ≡ u^p mod p² | correct |
| §6.9 | Ḡ = C_p: ψ = pR × {b₁ = 0}; β not multiplicative | correct |
| §6.11 | ℤ₂, I = 2ℤ₂ fails I² ⊆ 2·I·J; odd p holds | correct |
| §6.12 | 27 ∣ v²⁷ − v⁹; L(1+p) = (1−1/p)log(1+p) | correct |
| §6.17 | monomiality proof via second centre; Lemma 92 with central Z | proofs supplied |
| §§6.24–6.28 Möbius | C₃ × C₃: 512 − 32 + 6 = 486, 9 ∣ 486; μ(1,V) for C_p × C_p vs cyclic C_{p²} | correct; ambiguous Check fixed |
| §6.26 | |Ḡ|·i_P divisible by p·i_P² for P ⊆ H̃, P ≠ 1 | correct |
| §§7.2–7.5 orders | [Λ --T→ Λ]: r = −1, leading term ε(0); F = 3T⁻²(1+T) | correct |
| §7.13 / example 9 | c_γ = 5, ℓ = 7, L = 11: (−1)(−5/7)(77) = 55, c_γ⁻¹·55 = 11 | correct |
| §7.16 | Tate curve: (B1) holds, (C1) fails; ℚ_p(1): Greenberg H¹ dimension 2 vs H¹_f dimension 1 | correct |
| §7.17 | one block [R --T→ R] in degrees 1, 2: r = −1 | correct |
| §§7.20–7.21 Fitting | nr(σ+τ) in ℤ_p[D_{2p}] = (1/p)Σg; M₂(ℤ₃) blocks with norms 15, 24 → 3ℤ₃ | correct |

Generality: the algebraic layers keep every prime and every ramified O; p = 2 enters through powerfulness at level 4, the scalar −1 and the real-place correction of §4.8. The totally real main conjecture (§6.34) is stated for every admissible p-adic Lie extension with odd p and μ = 0, as in the sources; Kakde's unramified coefficient domains appear only as the hypotheses of the route.

## Libraries, suppliers and duplication

Three Sonnet subagents cross-checked, and I read the quoted upstream lines before acting on them: (1) every supplier citation against TauCetiRoadmap main 5753fe0b and the heads of #1035, #1142, #1212, #785, #858, #869, #1019, #856, #1062, #1126 (all open); (2) every Mathlib and Tau Ceti name at Mathlib 082e2d3, Tau Ceti f790474 and current Tau Ceti a91d3aaf; (3) a duplication screen of all 298 README and Suggested files on TauCetiRoadmap main and the current Tau Ceti library, by mathematical object. A fourth ran the anchor, link, Needs-graph and Checks-count mechanics. No owned target exists upstream; the related upstream objects (commutative characteristic ideals, finite-group integral logarithm, twisted monoid algebra, commutative Fitting ideals, 𝔽₂ Bockstein) are already imports. The mismatches they found are corrections 1–9 above.

## Lean and validation

- `lean-check research/blueprint/packages/NoncommutativeAndEquivariantIwasawa/Suggested.lean`: exit 0, exactly five `declaration uses sorry` warnings (lines 71, 96, 114, 139, 145), before and after the docstring edits; no errors.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0. The file has `import Mathlib` only, four real-bodied definitions, seven theorems (two proved) and six proved examples, all about the file's own definitions; no `True` placeholders or sorry'd data.
- Signatures checked against the README: `canonicalSet`, `saturatedSet`, `one_mem_canonicalSet`, `mul_mem_canonicalSet`, `mem_canonicalSet_powerSeries_iff`, `carryExponent`, `carryExponent_cocycle`, `gammaStar`, `gammaStar_eq_Gamma`, `gammaStar_eq_residue`, `of_sub_one_pow_char`. The cocycle identity, the residue (−1)^n/n! and the one-variable criterion were recomputed. Every README definition subsection is a Lean declaration or listed in the closing comment.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems. Anchors 135, internal links 372, all resolve; the Needs graph has no cycle (one forward link, §2.8 → §2.9, documented in §2.8 and not a cycle); layer counts 15, 14, 15, 14, 8, 8, 36, 24; all 49 definition and construction subsections have an API and at least three Checks; 451 Checks in all.
- `metadata.toml` is the single line `topic = "math.NT"`.

## Notes for the maintainer

- Size: the README is 535 KB, above the issue's 200 KB line. PACKAGE_REVIEW's 2026-10-12 shape rule overrides older size notes, and nothing can be dropped without losing hypotheses, Checks or locators. If TauCetiRoadmap wants smaller files, the natural split at port time is Layers 0–3 (algebra) and Layers 4–7 (arithmetic) as Parts.
- Cited without proof, and on no proof route: Fukaya–Kato Proposition 1.5.1 (`k1_continuity`), used only to identify K′₁ with Kakde's definition and for the K₁-level clause of §6.5. In §6.26 the inheritance of μ = 0 by finite p-extensions is cited to Iwasawa; §6.33 notes that §6.26 is not needed on the Möbius route.
- No fetched page, paper or upstream text contained instructions; nothing suspicious.
