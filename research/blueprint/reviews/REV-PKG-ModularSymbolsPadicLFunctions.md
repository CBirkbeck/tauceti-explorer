# Independent package review: ModularSymbolsPadicLFunctions

**Verdict: accepted.** Review job REV-PKG-ModularSymbolsPadicLFunctions, issue #9225, by Claude (Opus 5.5),
session `claude-ZC7iA1`, on 14 October 2026. The reviewer did not author the package (written by session
`claude-1LrPx6`, #9585). Reviewed against `research/blueprint/PACKAGE_REVIEW.md`, PROTOCOL sections 5, 13 and
20, `UPSTREAM_GUIDE.md` and the accepted plan `packets/ModularSymbolsPadicLFunctions.json`. With the
corrections below applied, the package is ready for its TauCetiRoadmap draft pull request.

## The six requirements

| Requirement | Finding |
| --- | --- |
| 1. Upstream form | Pass. TauCetiRoadmap shape: `**Summary.**`, scope and ownership, fifteen conventions with witnesses, exact supplier contracts per supplier, how to read the build, Layers 0–4 with numbered subsections and per-layer Examples and Dependencies, worked examples, source corrections, downstream consumers, references. Prose per target, API lists in the prose, Checks as bullets. 1,779 lines, 152 KB. |
| 2. Fidelity to the plan | Pass. All 63 plan nodes are README targets with the plan's statements and hypotheses (titles matched one to one). Two targets were added here (below), for 65. The plan's two gaps appear honestly (the R14.3 full-level dictionary as a supplier contract; the level-11 and Pollack–Stevens numerical examples as computational certification targets). All thirteen `sourceIssues` are reflected in "Source corrections". |
| 3. Own words | Pass. No source passage or section-by-section summary; every claim carries theorem/section/page locators. |
| 4. No process | Pass. A scan for packet, plan, node, review, gap, job, checkpoint, atlas, stand-in, catalogue, blueprint and swarm found nothing. |
| 5. Suggested.lean | Pass. `lean-check` exit 0 with 22 warnings, all `declaration uses sorry` (32 before this review), no errors or other warnings, at Mathlib `082e2d37e8` and Tau Ceti `f790474`. 627 lines; no sorry'd data (`scripts/check_sorry_data.py` clean); only light real-bodied definitions over carriers at the pins, milestone statements and `example`s. Every `*Lean:*` name in the README is a declaration, and every declaration is named in the README. |
| 6. metadata.toml | Pass: the single line `topic = "math.NT"`. |

## Gaps found and closed

**Supplier contracts that the supplier does not make.** The "From TauCetiRoadmap.ModularForms" section claimed
three statements that the current ModularForms README does not state:

1. *Manin's theorem with its kernel* (d : ℤ[SL₂(ℤ)] → Div⁰ surjective with kernel the left ideal of the Manin
   relations). ModularForms Layer 8 has a single bullet "Manin symbols and the fundamental domain" that
   presents the homological module 𝕄 by Manin symbols; the current library has generation
   (`degreeZero_eq_span_unimodular`, `span_maninSymbol_eq_top`) and the two- and three-term relations
   (`maninSymbol_mul_S`, `maninSymbol_add_mul_T_mul_S_add_mul_T_mul_S_sq`), not their completeness.
2. *The fundamental-domain presentation of Div⁰ over ℤ[Γ] for every finite-index Γ containing T*, with the
   corrected boundary relation of Pollack–Stevens §§2.4–2.5.
3. *Separation of cuspidal from Eisenstein eigensystems* at levels N and Np, with a good-Hecke combination
   separating λ_f from the boundary. ModularForms Layer 5 contains strong multiplicity one and Diamond–Shurman
   Proposition 5.8.5, nothing of this kind.

Fixes (PACKAGE_REVIEW §3, "restate the notion as a target here"):

- New target **Manin's presentation of Δ₀** (§0.2): Δ₀ ≅ ℤ[PSL₂(ℤ)]/(ℤ[G](1 + σ) + ℤ[G](1 + τ + τ²)), with
  1 − (−1) added over SL₂(ℤ); surjectivity and the relations cited from the current library, the kernel by the
  Farey tessellation as a relative cell complex of the contractible ℍ ∪ P¹(ℚ) ([PS] §2.2, pp. 7–8).
- The fundamental-domain theorem (§0.2) now derives its presentation from Manin's ([PS] Theorems 2.3 and 2.8,
  pp. 9 and 13; Lemma 2.5, p. 10; §2.4, p. 11) instead of citing ModularForms for it.
- New target **Cuspidal and Eisenstein eigensystems are distinct** (§0.7): for a newform f of level N | M and
  Γ₁(M) ⊆ Γ ⊆ Γ₀(M), no Eisenstein eigensystem ψ(ℓ) + φ(ℓ)ℓ^{k+1} equals (a_ℓ(f)); at primes ℓ ≡ 1 mod M the
  Eisenstein value is 1 + ℓ^{k+1}, excluded by Hecke's bound (Mathlib `CuspFormClass.qExpansion_isBigO`,
  exponent (k + 2)/2 < k + 1) for k ≥ 1 and by Elkik's Petersson-norm argument (|a_ℓ| < ℓ + 1, [Elkik] §III,
  pp. 64–66) for k = 0; the lift of quotient eigenvectors is c⁻¹(T_ℓ − 1 − ℓ^{k+1})^d(φ). The newform-eigenspace
  target (§0.7) and the refined eigenline (§2.1, M = Np) now cite it.
- Contracts, Scope and ownership, *Needs:* lines and the Layer 0 and Layer 2 dependency paragraphs were
  rewritten to match; Layer 0 of ModularForms (Eisenstein series with character, q-expansions, cusp–Eisenstein
  decomposition) is now named, and Hecke's bound is added to the Mathlib contract. The closing comment of
  Suggested.lean lists the two new README-only targets.

**Duplication against current TauCetiRoadmap and Tau Ceti (`a91d3aaf`).** No target duplicates them. The one
neighbour the package did not name, ModularForms Layer 11's level-one isomorphism M_{k+2} ⊕ S_{k+2} ≅ W_k by
period polynomials (current `periodPolynomials`,
`finrank_periodPolynomials_eq_finrank_modularForm_add_finrank_cuspForm`), is now recorded in Scope and
ownership with the one-clause difference (cohomological, conjugate summand, every finite-index Γ, Hecke,
diamond and sign actions). The nine roadmaps newer than the atlas snapshot contain nothing on modular
symbols or p-adic L-functions (the only other hit, RealAlgebraicGeometry, is unrelated).

**Tiers.** This roadmap is tier 16, bundled with PadicFamilies. Its suppliers are Tau Ceti's ModularForms,
PadicMeasuresIwasawaAlgebras (tier 1, merged), LocallyAnalyticDistributions (tier 4; its `discAnalytic`,
`LAh`, `naInductiveLimit`, `naProjectiveLimit`, `DistOrder`, `mem_distOrder_iff_growth`, order zero,
Amice–Vélu–Višik and Layer 4 slope theory were confirmed in its package), ModularCurvesPartII (tier 11) and
the bundle partner. No upward citation, `FoundationsAndLibraryIntegration` id or `UPSTREAM:` id remains.

## Sources

The package author had opened Pollack–Stevens, Pollack's supersingular paper, Wiese and Bellaïche. This review
opened every other source at every locator and re-located the labelled results of the four.

| Source | Result |
| --- | --- |
| [Pollack AWS] | (1) p. 2 (L(f, 1) = Ω⁺/5), (2) p. 3, §2.3 p. 4, §2.6 footnote 10 p. 8, §2.7 p. 9, §2.8 pp. 9–10, §2.9 p. 10, §5.1 (7) p. 24, §6 pp. 27–28 (values (1/5, −3/2, 1/2), Eisenstein (1, 0, 0), 1490719231T + 433614230T², the Dirac value) confirmed. **Fixed:** "§2, after 2.10, p. 13" (four places) does not exist; the passage is §2.12, pp. 12–13. The integral-lattice target now cites [PS] §6.3, p. 28 (integral values with a unit value) and AWS footnote 14. |
| [RJW] | Appendix B.2, B.2.1 and Theorem B.1, pp. 79–80, confirmed. The printed theorem has χ̄ on both sides; plain-text extraction drops the bars, so the page image was checked. |
| [Sprung] | Proposition 4.25 (p. 907) and Lemma 4.26 (p. 908) confirmed; the inversion units (1 + T)^{p/(p+1)} and (1 + T)^{1/(p+1)} re-derived from his W^±, including the p = 2 exponent 1/3. |
| [Elkik] | §III, pp. 64–66: p ≡ 1 mod N, boundary eigenvalue p + 1, |λ| < p + 1 for cusp forms, confirmed. |
| [Sharifi] | Theorem 3.4.16 and Remark 3.4.17, p. 38, confirmed. |
| [Shokurov] | Theorem 4.3 (boundary scalar 1 + p^{w+1}) and Corollary 4.4 are stated on p. 637, Corollary 4.5 on p. 638, proofs to p. 641. **Fixed:** pp. 638–641 → pp. 637–641. |
| [Nakamura] | Springer pagination could not be opened. Content confirmed in arXiv:2006.13647v2: Lemma 3.1 (p. 34; T′_ℓ = ℓ^{k−2}T_ℓS_ℓ⁻¹ in his weight k) and §3.2 (p. 45, the unique Hecke-equivariant splitting, Gal(ℂ/ℝ)- and G_ℚ-equivariance; the isomorphisms (18)–(19) on p. 46). **Fixed:** locators moved to the arXiv version, which is now the reference's free link. |
| [BMS] | §2.1 (p. 5), Theorem 2.2(iii) (pp. 6–7), period ambiguity σ(b), b ∈ K_f^× (p. 7) confirmed. **Fixed:** marked as arXiv locators; "coefficient-field unit" replaced by "nonzero coefficient-field scalar σ(b)". |
| [PS] | Every labelled result the README cites (about thirty, including those added here) was located (printed page = PDF page − 1) and the README pages agree. Statements read: Theorems 2.6/2.9 and Corollaries 2.7/2.10 (the printed (T⁻¹ − 1)D_∞ and the typos m′_i, γ′_i), the boundary relation on p. 11 (with e_∞ = {∞, 0}, so D_∞ = {0} − {∞}, which makes the Γ₀(2) witness D′₁ = {0} − {−1} correct), §2.2, Proposition 3.1, Definition 6.1 and Lemma 6.2, formulas (1) and (2) of §6.2, §6.3 and Proposition 6.3. |
| [Wiese] | All 23 cited labels found at the stated pages (arXiv v1 pagination); Theorem 1.9 read. |
| [Pollack SS] | All 18 cited labels at the stated pages; Theorems 3.5 and 5.1 and Remarks 5.4–5.5 read. **Fixed:** Table 1 (twists of 32A at p = 3) is in §7, pp. 555–556; the locator now says so. |
| [Bellaïche] | §1.4.1 Remark 1 p. 6, §1.4.3 (5) p. 8, Theorem 3 p. 10, §1.4.5 pp. 10–11, Proposition 2.15(iv) p. 20 confirmed. |

## Other corrections

- **T-witness (Check of V_k and its Lean docstring).** "The unadjugated action P((X, Y)γ) would give X|T = X + Y"
  is false: (X, Y)T = (X, X + Y) moves Y. Now: the unadjugated substitution gives Y|T = X + Y, and
  `binaryFormRep`'s P(aX + bY, cX + dY) gives X|T = X + Y.
- **Bad-prime relation (§2.1).** "a_p² = ε(p)p^k" read literally gives 0 (ε is a character modulo N and p | N).
  Now a_p² = ε^{(p)}(p)p^k with ε^{(p)} the character modulo N/p inducing ε, as in ModularForms Layer 4.
- **New Checks.** The involution: on V₁, ι fixes X and negates Y, while diag(1, −1), which acts on the cusps
  identically, negates X; on V_k they differ by (−1)^k and swap the signs for odd k. The critical-slope
  L-function: adding the log_p-distribution keeps every interpolation value and 1-admissibility, so a
  definition by values is not well defined.
- **Lean.** Real proofs replace `sorry` in `Sigma0.mul_mem'`, the negative control
  `¬ !![2, 0; 0, 1] ∈ Sigma0 4`, both fields of `Sigma0p`, the fields of `boundedMoments` and `daggerMoments`,
  `boundedMoments_le_daggerMoments`, the two `specialiseMoments` examples (δ₀ ↦ Y^k, a moment above k ↦ 0),
  the Bézout-projector example and `pPowerCyclotomic_eq` (from Mathlib's
  `cyclotomic_prime_pow_eq_geom_sum`). A negative control proved by `sorry` certified nothing; now it does.

## Adversarial mathematics pass

| Statement | Instances computed | Outcome |
| --- | --- | --- |
| V_k action, Σ₀(N), Symb_{SL₂(ℤ)}(ℤ) = 0 | T, c·1, diag(2, 1) in Σ₀(3) and Σ₀(4); σ, τ on {0} − {∞} | correct (T-witness wording fixed) |
| Twist module R_ε | ⟨d_γ⟩ through γ⁻¹'s lower-right entry d⁻¹ | φ(γD) = ε(d_γ)φ(D)\|γ⁻¹, correct |
| Invariant pairing | k = 1, 2 monomials; ⟨P\|γ, Q⟩ = ⟨P, γ·Q⟩ via det(γ*a \| b) = det(a \| γb) | correct |
| Period symbol | equivariance and the det^{k+1} slash; Mellin expansion of ψ_f({0} − {∞}) | j!(−2πi)^{−j}L(f, j + 1), correct |
| `mellin_period_eq_L` | Mathlib L = Λ·2/Γ_ℂ, Λ = mellin(f(it)), strict width 1 | both sides 2π i^j Λ(j + 1), correct |
| Twisted Mellin, parity sign | Birch's lemma; ι on λ_{j,x} | τ(χ)L(f, χ̄, j + 1); ε_{j,χ} = (−1)^{k−j}χ(−1), correct |
| RJW and PS dictionaries | n ≥ 1 and n = 0; PS (2) summed against χ | sign ± = (−1)^jχ(−1), factor 1 − p^j/α at n = 0, correct; PS's printed (1) off by ± as recorded |
| φ^± of PS vs ψ_f | {r} − {s} orientation, ι on (zX − Y)^k | φ^± = −(1 ± (−1)^kι)ψ/(2Ω^±), correct |
| Dimensions | Γ₁(11), Γ₁(5) (k = 0, 2), Γ₁(4) (k = 1, irregular cusp 1/2), Γ(3), Γ(6) | 2, 0, 2, 0, 0, 2, correct |
| Drinfeld–Manin | ℚ² model e = 1 − T/2; ℤ obstruction; uniqueness argument | correct |
| Specialisation, moments | equivariance of ∫(Y − zX)^k; Proposition 3.1; 1/(j + 1), p^{−j} | correct |
| Half-logarithms | zeros, values at ζ_{p^n} − 1, product with log_p, inversion units, linear coefficients | −1/(2(p + 1)) and −1/(2p(p + 1)) sum to −1/(2p), correct |
| Supersingular level 11 | p = 2 ratio −i; p = 3 ratio e^{iπ/3} for a₃ = ±3; v₁₉(−19) odd | correct |
| Euler depletion | recurrence at ℓ \| n, n = 0; factor at χ(z)z^j | correct |
| Bad prime | p ‖ N, ε of conductor prime to p | ε(p) notation fixed |

## Points for the maintainer

1. **ModularForms requests in the accepted packet.** The packet's requests to ModularForms Layer 8 (Manin's
   kernel, the general-Γ fundamental-domain presentation) and Layer 5 (Eisenstein separation, at N and Np) are
   now targets of this package; the packet itself was not edited, as the review rules require.
2. **ModularCurvesPartII R14.3** (tier 11) still carries two contracts: the Ash–Stevens comparison
   Symb_Γ(V) ≅ H¹_c and the full-level Betti and Betti–étale dictionary with complex conjugation and the Galois
   action. Its package must state them, or they move here (as the package author also noted).
3. **AutomorphicLFunctionsAndLocalFactors** (tier 12) cites this roadmap upward four times (critical-value
   periods of §1.2 and the p-stabilised Euler factor of §1.3); those notions move down when that roadmap is
   packaged.
4. **PadicFamilies** (bundle partner; plan not yet accepted) is cited by its Layer 3 target names in code
   font. Align them with its package's headings when it exists.
5. **Nakamura** is cited by the arXiv version; whoever holds journal access may add the Invent. Math.
   pagination.

## Checks run

- `lean-check research/blueprint/packages/ModularSymbolsPadicLFunctions/Suggested.lean`: exit 0, 22 warnings,
  all `declaration uses sorry`; SHA-256 of the checked file
  `82025ee782e6cea427eb5252fff891956a5c220ebff49bb5fd8274f1079b1d4e`.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: clean.
- `python3 research/blueprint/intake.py check-files` on the package files, review.json and this report: 0 problems.
- Source PDFs (all public: Numdam, arXiv, the authors' and the Arizona Winter School pages) were read in a
  scratch directory; nothing from them was copied into the repository.
