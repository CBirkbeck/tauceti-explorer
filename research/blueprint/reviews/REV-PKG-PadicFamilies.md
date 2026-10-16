# REV-PKG-PadicFamilies

Independent package review of `research/blueprint/packages/PadicFamilies/` (README, Suggested.lean, metadata.toml) against the accepted plan `research/blueprint/packets/PadicFamilies.json`. Reviewer: Claude (Opus 5.5), session `claude-eLKfuw`, 2026-10-16, issue #9889. I did none of the package job, which Codex (`codex-1f0cyN`) wrote.

**Verdict: accepted**, with the corrections below applied in place. One ordering point for the maintainer is not fixable inside the package: KatoEulerSystems, which Layer 4 cites, has no place in the upstream order (see "For the maintainer").

## What was checked

1. **Upstream form.** The README has the TauCetiRoadmap shape: an opening **Summary**, then Scope and ownership, Conventions, Exact supplier contracts and How to read the build. Layers 0a, 0, 1, 2a, 2, 3, 4 and 5 follow, each subsection in prose with its hypotheses, proof route, API list, Checks and locators, and every layer ends with Examples and Dependencies. Downstream consumers and References close it. I compared it with upstream IntegralHeckeAndGaloisDeterminants and ModularForms.
   - Upstream writes formulas in Unicode. The README's front matter (Conventions and the supplier Checks) used `\(…\)` LaTeX delimiters, which GitHub shows as literal brackets. I rewrote them in Unicode.
   - Two standing sentences were repeated in 20 hypothesis paragraphs of Layers 2 and 3, and a third block in 5. They are now a **Standing conventions** paragraph at the head of each of those layers.
   - Ten filler lines ("The additional construction is used through these maps and identities.") were removed.
2. **Fidelity to the plan.** A script paired the 121 plan nodes with README sections by title and compared statements, hypotheses, tests, API names and acceptance lines word by word.
   - 119 nodes have their own section. The other two are the supplier-only nodes: the factorial idempotent of a finite algebra and the projective characteristic polynomial. They sit in the supplier contracts by design.
   - All 263 plan API names occur in the README.
   - Every definition and construction section has at least three Checks.
   - Most of the 35 statement differences are node ids renumbered as `§k.n`. I checked the substantive ones against the sources:
     - §1.2 writes H¹ with ℚ_p/ℤ_p coefficients where the plan has H₁. EPW (4.2), p.29, has H¹, so the README is right.
     - §4.9 uses α = α_F with ‖α‖ ≤ 1 and the module R_A(α⁻¹), where the plan has α = α_F⁻¹ and R_A(α). The README agrees with LZ Definition 6.2.1, Lemma 6.2.2 and (6.2.1), p.29.
     - §5.6 states projectivity over O[[G(U)]] and then freeness over Λ′, not Skinner–Wiles' constant-rank formula. This is the plan's recorded gap: the proof of Proposition 3.3, p.36, says the operator e may be ignored, which gives projectivity only.
     - §0.9 extends Hida's Theorem 4.2 to p = 5 as an explicit proof target.
     - §0.2 is fixed below.
   - The packager turned the plan's 21 gaps into named construction targets: `familySymb_chartDescent`, `parallelHilbertOrdinary_control`, `ordinaryIhara_*`, `quaternionicOrdinary_*` and others. Each is supported by the gap it closes.
   - The acceptance lines the README drops are process lines (move-down notes, red-team ids, "RS-08").
3. **Sources.** All 18 public PDFs were fetched, and their SHA-256 hashes equal the packager's. The Pilloni, ACC and Conrad-IC copies in the cleared library were read in place, and their hashes also match.
   - A script checked every `See …` locator, 327 label–page pairs in all. It tests that the cited label occurs on the cited page, using a printed-page offset for each source.
   - 185 labels were confirmed in the text layer. The rest were split parenthetical clauses with no page of their own, Hida equation numbers that the Numdam OCR garbles, and the misses listed under correction 6.
   - I read the Hida equation labels on page images: (1.6)–(1.9), (1.12), (1.13), (1.16), (1.17a–b), (3.9a–b), (5.1), and the hypotheses of Theorem 3.1, Corollary 3.2, Theorem 3.6 and Corollary 3.7.
   - By hand I also read the following against their statements:
     - EPW: Proposition 4.1.1 with its proof, Definition 2.8.1, Definition 4.3.1, Lemmas 4.5.1–4.5.3 with the maps ε_ℓ*, and Theorems 2.3.1 and 2.3.4.
     - Bellaïche09: Propositions 2.14 and 2.15, and Theorem 2.
     - IKM: Proposition 2.10 and Example 2.11.
     - Pilloni: Definition 2.1.1, Lemmas 2.1.1–2.1.3, Proposition 2.3.1 and Remark 2.3.1.
     - KT: Proposition 2.15.
     - Skinner–Wiles: Proposition 3.3 and Corollary 3.4.
     - Ochiai: the determinant and Frobenius conventions of §1 and Proposition 1.2.
     - LZ: §6.2. Pollack: Lemma 3.2 and Theorem 3.3.
     - Conrad: Theorem A.1.2. Conrad-IC: Corollaries 2.2.7 and 2.2.9, and Theorems 4.2.2 and 4.3.2.
4. **Gaps and suppliers.** Every cited atlas roadmap is in a lower tier than PadicFamilies (tier 16, bundled with ModularSymbolsPadicLFunctions): PadicMeasuresIwasawaAlgebras is tier 1, AdicSpacesPartII 3, LocallyAnalyticDistributions 4, ArithmeticGaloisDuality and SelmerIwasawaCohomology 8, DeformationAndDerivedPatchingAlgebra 10, ModularCurvesPartII 11, HilbertModularVarietiesAndShimuraCurves 14, and DirichletPadicLFunctions, GlobalGaloisDeformations and GL2AutomorphicRepresentationsAndTransfer 15. IntegralHeckeAndGaloisDeterminants, ModularForms and ProfiniteProPGroups are upstream Tau Ceti roadmaps. The exception is KatoEulerSystems; see "For the maintainer". No `FoundationsAndLibraryIntegration` or `UPSTREAM:` id remains.
   - All 97 node ids cited in `This uses` lines resolve to plan nodes.
   - A Sonnet agent then compared every supplier-contract item with the supplier's package README, or with its packet, or with the upstream README where the supplier is already upstream. I read each flag.
   - Several "supplies" claims were not in the suppliers. They are listed under correction 1.
5. **Duplication.** A Sonnet sweep by mathematical object found no duplicate of any target. It searched the current TauCetiRoadmap: the nine newer roadmaps, ModularForms, ModularCurves, IntegralHeckeAndGaloisDeterminants, ProfiniteCohomology and ProfiniteProPGroups. It also searched the Tau Ceti library at a91d3aaf, including the compact-module and Fitting-ideal files and HeckeSlash. I confirmed the absence of a compact Nakayama lemma upstream.
   - IntegralHeckeAndGaloisDeterminants §2.3 already proves the factorial idempotent for commutative finite algebras. The README uses it as a supplier and plans only the extensions.
6. **Lean.** `lean-check` exits 0 with 21 warnings, all `declaration uses sorry`; I ran it before and after the README edits, and the file is unchanged. A `run_cmd` audit over all 33 `TauCetiRoadmap` constants found no `sorry` in any type and no sorry-valued data. `scripts/check_sorry_data.py` passes.
   - The file is 176 lines and imports only Mathlib. It holds light real-bodied definitions: `ordinaryProjector`, `ordinaryPart`, `nonOrdinaryPart`, `IsLocallyFiniteEnd`, `augmentationAnnihilator`, `congruenceSubmodule`, `congruenceModule` and `congruenceIdeal`. It states five milestones and has 16 examples.
   - I checked every signature against the README and recomputed every example value: 2^{720} ≡ 4 mod 6, the ℤ × ℤ and ℤ[X] augmentations, and the others.
   - The milestones and the two definitions the README did not name are now named in their README sections.
   - The other layers have no carriers at the pins, so their statements are README targets, as the 2026-10-12 shape requires.
7. **Own words.** A 10-word-shingle comparison of the README with all 21 source texts found only reference titles and formula fragments (at most 18 words). There is no source passage and no section-by-section summary.
8. **metadata.toml** is `topic = "math.NT"`, which fits.
9. **`intake.py check-files`** reports 0 problems on the five deliverables.

## Corrections made

1. **Supplier contracts rewritten as *Uses* and *Required in addition*, supplier by supplier.**
   - **IntegralHeckeAndGaloisDeterminants.** Upstream §2.3 (*Factorial powers*) proves the idempotent only for commutative finite algebras, with "eventually" convergence. It has no `ordinaryIdempotent*` names, no explicit threshold, no module-action or functoriality statement and no noncommutative case. Those items are now "required in addition, proved here", each with its one-line proof.
     - The threshold n ≥ |A/𝔪^kA| follows from §0a.1 applied to multiplication by t on A/𝔪^kA.
     - Similarly, §0.6 gives the determinant law of a finite projective module, and none of the `projCharpoly*` statements. These are now targets, proved by localising to Mathlib's `LinearMap.charpoly` and `LinearMap.aeval_self_charpoly`.
     - The atlas ids `IHG.2/…` and `IHG.4/…` are replaced by upstream section citations: §2.2 for the specified idempotent summands and the finite local factors, §2.3 for ordinary finiteness, and §4.2 for finite-quotient witnesses.
   - **AdicSpacesPartII.**
     - The stage attribution is corrected: rigid spaces and admissible coverings are R1, finite-module limits F0, coherent sheaves R3.
     - AdicSpacesPartII has no theory of irreducible components of rigid spaces, though the README said R3 supplied it. Conrad-IC Corollaries 2.2.7 and 2.2.9 and Theorems 4.2.2 and 4.3.2 are now a stated requirement of §2a.14.
     - Tate algebras at real radii are now a stated request to R0.
   - **ModularCurvesPartII.** It does not state four things the README attributed to it. These are now listed as *Required in addition*, matching the plan's open requests:
     - the ordinary Igusa tower (R13.2), with Tate curves cited from R13.3;
     - integral relative homology with path classes (R14.3);
     - Wiles's mod-p multiplicity one at ordinary level (R14.6);
     - the ordinary p-divisible connected–étale filtration (R14.6).
   - **LocallyAnalyticDistributions.** Layer 4 has no radius links. They are constructed here (§2a.11, §2.2), and the closed-submodule criterion is the target `familySymb_pr`.
   - **GlobalGaloisDeformations R04.3.** It supplies only the adjoint-Selmer tangent space. The refined tangent constraints are now a request.
   - **DeformationAndDerivedPatchingAlgebra P7.** "Good complexes" is Khare–Thorne's term, so it is now cited to KT §2.2, and the gluing is stated for A/𝔪ⁿ.
   - **ModularForms.** Semisimplicity of the newspace Hecke algebra is upstream Layer 8G, not Layer 4. This is fixed in Scope, the contracts, §0.15 and the Layer 0 Dependencies, and the raw anchor link is gone.
2. **§1.3 proof.** The sketch said rational Eichler–Shimura and control "identify M_m[1/p] as free of rank two over T_m[1/p]", which is the statement to be proved. EPW's own proof (p.29) also asserts it without argument. The sketch now proves what is needed at the generic points:
   - pick a weight k whose prime P_k avoids the support of the Λ-torsion of M_m;
   - control and Eichler–Shimura then give rank_Λ M_m = 2 rank_Λ T_m;
   - so the kernel of T_m² ↠ M_m is Λ-torsion inside a Λ-free module, hence zero;
   - the two signs are free summands of generic rank one each.
3. **§0.2.** The statement had been narrowed to "p ≥ 5" while its hypothesis line kept "N₀ ≥ 3 or p ≥ 5". Katz's Theorem 1.1, p.240, assumes N₀ ≥ 3 or p ≥ 5, which is restored, noting that Layer 0 works with p ≥ 5. The citation "Katz [16]" (Hida's bibliography number) now names the paper: Higher congruences between modular forms, Ann. of Math. 101 (1975).
4. **§1.8 hypothesis.** The identification Ψ_λ(A) ≅ O/η_λ needs only the double-annihilator identity, as the statement and the Lean milestone say. The hypothesis line had required A reduced. It now gives the identity, with reduced noetherian A and 𝔭_λ minimal as one sufficient case.
5. **§0.15 notation.** L denoted both Frac(Λ_K) and the lattice 𝒦 ∩ h. The lattice is now h_𝒦.
6. **Locators.**

   | Section | Was | Now |
   | --- | --- | --- |
   | §2.3, Buzzard | Lemma 2.11 and Theorem 3.3, pp. 11–20 | Lemma 2.11, p. 19; Theorem 3.3, p. 24 |
   | §2.5, Buzzard | Lemma 5.10, p. 43 | p. 42 |
   | §4.1, EPW | Theorem 2.3.1, p. 13 | p. 10 |
   | §4.2, EPW | Theorem 2.3.4(3), p. 16 | p. 13 |
   | §0.3, Hida | (1.12), p. 240 | p. 242 |
   | §0.1, Hida | (1.6)–(1.9), p. 238 | pp. 238–239 |
   | §0.16, Hida | proof of Corollary 4.2, p. 258 | pp. 258–259 |
   | Conrad-IC | internal manuscript pages | pages of the free Numdam journal scan (pp. 499, 500, 524–527) |

   - Bibliography numbers taken from the sources ("[17]", "[19]", "[34]", "[H2]") are replaced by the works themselves.
   - Duplicated locators in §§0a.5, 0a.12, 0a.14 and 0a.17 were merged.
7. **References.** The Buzzard entry now gives LMS Lecture Note Ser. 320 (2007), 59–120, and the Conrad entry Pure Appl. Math. Q. 2 (2006), 29–110. Process wording ("the maintainer's cleared library", "inherited arXiv v2") was removed from the Pilloni, ACC and Conrad-IC entries.
8. **Smaller items.**
   - §0a.20 now says the Lean predicate `IsLocallyFiniteEnd I T` is stated for any ideal, and why it agrees with Pilloni's definition for noetherian R.
   - §1.7 now says the definitions need neither surjectivity nor a domain.
   - A dangling name in §0a.22 was fixed, and "planned here" in §4.6 was reworded.
   - Words glued to numbers ("Lemma2.10", "pp.999", "byϖ", "Layer4": 225 in all) were spaced.

## Adversarial pass

| Statement | Instances tried | Outcome |
| --- | --- | --- |
| §§0a.1–0a.4, `finite_ordinary_milestone` | ℤ/6 with U = 2 (U^{720} = 4, 4² = 4); ℤ/8 with U = 0, 2, 3; the zero module (|M| = 1); kernel chain stabilising by ⌊log₂ m⌋ | holds; nilpotence on M_nord with exponent |M| holds |
| §0a.5 uniqueness | U = diag(1, 0) on (ℤ/2)², complement span(e₁ + e₂) | correctly excluded |
| §0a.6 naturality | common exponent max(|M|, |N|)! | holds |
| §0a.10 non-example | left shift on ∏𝔽₂: every stable open submodule contains L^N(U_N), which is everything | holds |
| §0a.12, supplier Check | U = (1 1; 0 p): eigenlines (1, 0) and (1, p − 1); projector (1 (1 − p)⁻¹; 0 0); s_m = (1 − p^m)/(1 − p) | holds |
| §§0a.20–0a.23 | shift on the completed ⊕ℤ_p (not locally finite); diag(pⁱ) (locally finite, e the e₀-projection, no T^{N!} = e); (3) with r_i = i(i+1)/2 makes T the right shift on M₁ | holds; the Lean predicate agrees with Pilloni Def. 2.1.1 for noetherian R |
| §0a.26 | R[0] ⊕ R[−1] with T = (1, a), a ∈ 𝔪; T = 1 on the completed ⊕ℤ_p | holds |
| §§1.7–1.8 and their Lean examples | ℤ with id; ℤ × ℤ with fst; ℤ_p ×_{ℤ/pⁿ} ℤ_p; O[t]/t²; ℤ[X] augmentation (I = 0 and Ψ = 0, but O/η = ℤ); IKM Ex. 2.11 (M[t] = ϖ²M, M[ϖ²] = (ϖ, t)M, quotient O/ϖ); I·𝔭 = 0 kills Ψ | every value recomputed; hypothesis line corrected (fix 4) |
| §1.3 freeness | EPW p.29 | proof repaired (fix 2) |
| §1.5 additivity | (1 b; 0 p) sends {∞, a/p^r} to {∞, (a + bp^r)/p^{r+1}} | holds |
| §1.12 Euler factors, ε_ℓ* | EPW Def. 2.8.1, Def. 4.3.1, Lemma 4.5.1 | match, including D_ℓ ≠ [ℓ]_cyc |
| §0.5 Checks | τ(11) = 534612 ≡ 1 mod 11; τ(2) = −24 gives Newton slopes 3 and 8 | holds |
| §0.7, §0.9, §0.12 | P_k − P_{k′} ∈ p^{m+1} when k ≡ k′ mod p^m; p = 5 gives j(a) = 4, 5, 6, 3; ⟨d⟩^k d⁻¹ specialises to ψω^{−k}(d)d^{k−1} | holds |
| §0.11 ranges | Hida Thm 3.1 (k ≥ 3), Cor. 3.2 (k ≥ j(a) for forms, k ≥ 2 for cusp forms) | consistent |
| §0.16 compact Nakayama | open U contains some 𝔪ⁿM; 𝔪ⁿM is compact, hence closed | holds; absent upstream |
| §§2a.1, 2a.7, 2a.16 conventions | φ = a gives T = 1/a; (1 1; 0 1) gives (1 − T)²; A²[0] with U = 1 gives P̃ = (1 − X)², Ann = (1 − X); cone of the identity; d = w | holds |
| §2a.5 inequalities | the cases n = 0, 0 < n < d, d < n < N and n ≥ N, and strictness on V | holds |
| §2.1 non-example | evaluation at z = T: the moments Tⁿ mod p span an infinite-dimensional space | holds |
| §3.6 | k = 0, μ(zⁿ) = 1, ν(z^m) = 1/(m + 1), unbounded at m + 1 = p^a | holds |
| §3.12 paired lemma | valuations (n + 1)(v(a₁) − v(a₂)) against bounded terms; finitely many zeros forces boundedness (Newton polygon) | holds without a growth hypothesis |
| §3.13 diagonal vector | (t ⊗ 1 − 1 ⊗ t)Ψ = u ⊗ 1 − 1 ⊗ u = 0 | holds; for e = 2 the specialisation gives t |
| §§3.3, 3.4, 3.11 | Bellaïche Prop. 2.14(c), Prop. 2.15(iii), Thm 2 exceptional case | match |
| §4.1, §4.5 | Ochiai: det = χ⁻¹χ̃²χ̃′⁻¹; P_q(X) = det(1 − Frob_q X; T) with Frob_q geometric | match |
| §4.9 regulator | LZ: φ(e) = α⁻¹e on R_A(α⁻¹), ‖α‖ ≤ 1, α − 1 a nonzerodivisor | README matches |
| §5.1 | δ_F = 1 + Leopoldt defect; F = ℚ gives 2 variables, real quadratic abelian F gives 3 | holds |
| §5.2 | constants at level a ≥ 1 (eigenvalue N𝔭) and a = 0 (eigenvalue N𝔭 + 1) | holds |
| §5.6 | SW Prop. 3.3 proof drops e | README's projective, then Λ′-free formulation is correct |

## For the maintainer

- **KatoEulerSystems is outside the 94-roadmap order** (the order file already flags "cites outside the 94: KatoEulerSystems (8)"). §§4.3 and 4.5–4.9 use its zeta elements, dual exponentials, explicit reciprocity and Euler-system bound.
  - There is no cycle: the KatoEulerSystems package states that it takes nothing from PadicFamilies.
  - Restating Kato's theory here would duplicate a roadmap. So either KatoEulerSystems has to be placed below tier 16, or Layer 4 of this package waits for it.
  - The other seven layers do not depend on it.
- **Open supplier requests** (PROTOCOL §3), now visible in the README as *Required in addition*:
  - ModularCurvesPartII (R13.2, R14.3, R14.6);
  - AdicSpacesPartII (R0 real radii, and the irreducible components of rigid spaces);
  - LocallyAnalyticDistributions L4 (closed-submodule criterion and descent; also planned here as `familySymb_pr` and `familySymb_chartDescent`);
  - GlobalGaloisDeformations R04.3 (refined tangent constraints);
  - PadicMeasuresIwasawaAlgebras L0a (analytic charts and radii).
- **Primary proofs not read.** The packager could not obtain these, and the README cites them through EPW, Ochiai, DKV and Bellaïche: Hida, Invent. Math. 85 (1986), Amer. J. Math. 110 (1988), Invent. Math. 79 (1985) and Ann. of Math. 128 (1988); Wiles, Invent. Math. 94 (1988); Coleman's overconvergent forms; Liu, Andreatta–Iovita–Stevens and Kedlaya–Pottharst–Xiao. The corresponding targets say so.
