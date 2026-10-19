# REV-AutomorphicPadicLFunctions — independent review

Job `REV-AutomorphicPadicLFunctions`, issue #364. Reviewer: Claude (Opus 5.5), session `claude-HjdCBb`, 19 October 2026.
The work under review is the complete target-level pass `BP-AutomorphicPadicLFunctions` (Claude session `claude-YFzskK`, PR #10463, continuing the ChatGPT Pro checkpoint of PR #3100). This reviewer wrote none of it.

Files under review, all corrected in place:

- `research/blueprint/packets/AutomorphicPadicLFunctions.json`
- `research/blueprint/suggested/AutomorphicPadicLFunctions.lean`
- `research/blueprint/readmes/AutomorphicPadicLFunctions.md`

**Verdict: accepted**, after corrections to 24 nodes. The packet stays `complete`, with every stage `planned`. It has 105 nodes, 22 planets, 16 baseline declarations, 12 requests, 6 gaps and 7 source findings.

## Counts

| | Before | After |
| --- | --- | --- |
| Nodes | 105 | 105 (none added or removed) |
| Nodes corrected | — | 24 |
| Baseline declarations | 16 | 16 (all confirmed) |
| Requests | 13 | 12 (Chebotarev request removed) |
| Gaps | 4 | 6 |
| Source findings | 5 | 7 (E1–E5 confirmed; E6, E7 new) |
| Planets | 22 | 22 (one moved within L2) |
| API items / unit tests | 256 / 180 | 256 / 180 (one test renamed) |

`python3 scripts/check_blueprint.py` against the pinned declaration index gives 0 errors and 0 warnings.

## What was checked

**Sources.** All 17 sources were downloaded to scratch. Each matches the SHA-256 recorded in the packet. They were read as follows:

- **Barrera Salazar–Williams (arXiv v3):** read in full, so every L0–L2 statement was compared with its definition or theorem.
- **Deligne–Ribet:** read on rendered page images: §0 (pp. 230–232), §1 (p. 233), Theorem (4.5) and its proof (pp. 255–257), (5.10)–(5.15) (pp. 265–266), Theorem (6.1) (p. 267), and §8 ((8.1)–(8.4), pp. 277–278; the proof of (8.2), p. 282).
- **Katz:** read on page images: the contents (pp. 199–200), (2.4)–(2.4.5) (p. 238), (2.5.3)–(2.5.12) (p. 240), (2.6.2)–(2.6.8) (p. 241), (4.2.0)–(4.2.6) (p. 260), and (5.3.0)–(5.4.6) (pp. 274–275, with zoomed crops of (5.3.5)).
- **Hsieh 2014:** the introduction, Theorems A–C (pp. 709–716), Theorems 6.1 and 6.2, Lemma 6.3, Remark 6.4 (pp. 756–758) and Theorem 7.1 (p. 759). The arXiv v3 preprint was used to compare Theorem C.
- **Hida 2010:** §1 with (1.1)–(1.3), checked on the page image, and Theorem I with (V) and (M1)–(M3) (pp. 43–45); Theorem 3.20 and Corollary 3.21.
- **Hsieh 2012 (non-vanishing):** the introduction, Theorems A and B, Theorem 6.8 and Remark 6.9.
- **Hsieh 2012 (µ-invariant):** Theorems A and B, and Theorem 6.5.
- **EHLS:** Theorem 4.3.10 (p. 64), Theorem 4.6.1 (p. 78), §6.6 with Hypothesis 6.6.4 (pp. 99–100), Theorem 7.3.1 and Hypotheses 7.3.2–7.3.3 (p. 110), Corollaries 9.1.8 and 9.2.1, Main Theorem 9.2.2 and Remark 9.3.1 (pp. 144–145).
- **Eischen–Wan:** §1.3 and Theorem 1.2 (pp. 3–4), Lemma 4.17 (p. 29) and Corollary 5.9 (p. 37).
- **Disegni–Liu:** Theorem 3.37 (p. 35) and Proposition 3.39 (p. 38).
- **Dasgupta–Kakde:** §§7.2.1–7.2.8 with Lemma 7.2 (pp. 44–48), §7.3 (p. 49), Definitions 8.2–8.3, Proposition 8.4 (checked on the page image, p. 52), Proposition 8.14, Lemma 8.16 and Corollary 8.19.
- **Dasgupta–Kakde–Ventullo:** §1 (pp. 2–3).
- **Castella–Grossi–Lee–Skinner:** Theorems 2.1.1–2.1.2 (pp. 12–13).
- **Panchishkin:** §5.5 and §6 with Conjecture 6.2, read on page images (pp. 1004–1006).
- **Finis:** §1 and Theorem 1.1 (pp. 768–769).
- **Williams:** Definitions 5.10 and 6.14, Proposition 6.15, Theorem 6.10 and Theorem 7.4.
- **Bergdall–Hansen:** Theorem 1.1.2 and §1.8.

The remaining locators in text-layer sources (80 node–source pairs) were cross-checked mechanically against the extracted text. Each item flagged there was then re-read by the reviewer; see "Locator cross-check".

**Baseline.** All 16 `baseline.declarations` were read in the pinned trees (Mathlib 082e2d3, Tau Ceti f790474):

- the Tau Ceti ray-class declarations `Modulus`, `RayClassGroup`, `classMap`, `classMap_comp_classMap`, `classMap_surjective`, `finite_rayClassGroup`, `unitsResidueSignHom` and `mulExact_unitsCongruenceSubgroup_unitsResidueSignHom`;
- the Mathlib declarations `Subgroup.topologicalClosure`, `Set.EqOn.closure`, `ProfiniteGrp.limit`, `NumberField.Units.rank`, `NumberField.Units.finrank_modTorsion`, `ContinuousMonoidHom`, `gaussSum` and `NumberField.IsCMField`.

Each provides what its citing nodes use, and none was removed. The two exactness lemmas named in the proof of `L0/ray-class-unit-sequence` also exist at the pin (`Exact.lean`, line 295 and following).

**Closure.**

- Every cross-roadmap prerequisite resolves to an accepted packet node, or to a stage with a request: ALS.4, HilbertModularVarietiesAndShimuraCurves H2, ML.3, PadicMeasuresIwasawaAlgebras L0a/L1 and SR.4.
- The supplier statements of the ALS, AutomorphicBundles B5, AF, AL, LocallyAnalyticDistributions and IntegralIwasawaTheory nodes were read against their uses.
- The Tau Ceti layer anchors (GlobalNumberFields 2, 7, 9, 10; ClassFieldTheory 11; ModularForms 0) exist in the current roadmaps.
- One missing supplier was added, and one wrong proof route was replaced (see below).

**Library audit.** No construction planned here exists at the pins. This was checked by name searches for Hecke characters, Leopoldt, Iwasawa algebras, overconvergent and locally analytic objects, and CM types, and against the AUDIT-23 entries for this roadmap.

**Red-team findings.** The eight findings handed to the blueprint were read in `RT-AREA-*.result.json` with their verifier verdicts (all confirmed):

- automorphic-1/13 is handled;
- iwasawa-1/7 is handled by the L3m sub-layer, with the unread Hida 2004 and Vatsal 2003 recorded as gaps;
- iwasawa-1/11 is handled;
- iwasawa-1/32 is handled;
- iwasawa-1/33 is handled and is now completed by the Barrera Salazar gap below;
- iwasawa-1/34 is handled, with ALS.4 requested;
- langlands-1/8 is handled through HodgeTateAndCanonicalSubgroups T5 and HilbertModularVarietiesAndShimuraCurves H2;
- ktheory-2/26 is handled.

**Granularity, API, tests and planets.**

- The packet is at target level, as `detail.json` sets.
- Every definition and construction has an API outline and at least three tests.
- The computational tests were recomputed, for example:
  - ζ_{ℚ(√5)}(−1) = 1/30 and −2/15 after depletion at √5;
  - L\*(1, −1) = −(1 − p)/12;
  - the rank 9 of V_{(2,2)} over ℚ(i);
  - the 1/16 discrepancy of the uninverted weighted twist;
  - the split and inert examples in ℚ(√−7) and ℚ(i).
- Planets are at most five per layer.

**Suggested file.**

- One test was renamed, to follow the packet.
- All 436 packet API and test names occur in the file.
- The light definitions (the tower subgroup, weighted inversion, refined eigenvalues and normalisation, admissible weights, Euler-factor elements, the Panchishkin unit condition) were read and are sound.
- `lean-check` at the pins exits 0, with 18 admitted-proof warnings and no other warning, both before and after the edit.

**Reader.** A renderer was written and checked first. It reproduces from the committed packet all 105 node sections, every "Dependencies" and "Refinements" section, and the source-correction, gap and request lists of the committed reader, byte for byte. The corrected sections were then re-rendered from the corrected packet, so the reader agrees with the packet node by node. The L2 planet line and the red-team paragraph for iwasawa-1/33 were edited by exact replacement.

## Corrections

### L0

- **`L0/ray-class-unit-sequence`, `L0/ray-class-distributions`: tame modulus.** With a tame modulus 𝔫, the fibres of Cl⁺_F(𝔫p^∞) over a level f are indexed by Cl⁺_F(𝔫f), and each is the congruence units modulo Ē_+(𝔫f). The packet indexed them by Cl⁺_F(f), which is right only for 𝔫 = (1), the case of BSW §9.2.1. The statement, the proof step, the descent step and the gluing API were corrected.
- **`L0/ray-class-distributions`: Mellin image.** The Mellin transform was said to give "bounded-below analytic functions". The cited LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism, and Schneider–Teitelbaum, give the ring of all rigid analytic functions on the character space; measures correspond to the bounded ones.
- **`L0/locally-algebraic-characters`.** BSW §1.2.1 (p. 6) says that r + c·r parallel is necessary but not sufficient for r ∈ Ξ, and the statement read as if it defined admissibility. It now names Weil's set Ξ, with that condition as necessary only.
- **`L0/leopoldt-dimension-formula`.** For ℚ(∛2) the Leopoldt defect is automatically zero, since the unit rank is 1, so the assumption was dropped from the acceptance test.
- **`L0/odd-character-l-zero-nonvanishing`.** The proof uses L(χ̄, 1) ≠ 0 for a nontrivial ray-class character, and no prerequisite supplied it. AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one (accepted) was added.

### L1

- **`L1/automorphic-cycles`.** BSW eq. (6) multiplies by the matrix (γ 0; 0 1) ∈ GL₂(F), not by γ. The proof step was corrected.

### L2

- **`L2/up-compactness`.** The Hecke operator U_p of the double coset of (1 0; 0 p) agrees with ∏U_𝔭^{e_𝔭} only up to the action of the unit p·∏π_𝔭^{−e_𝔭}. The statement now says so.
- **`L2/bsw-interpolation`.** The formula agrees with Theorem 11.1. The acceptance test now says that Λ(Φ, 1) is the L-value of the level-𝔫 eigenform: for a p-stabilised newform it already contains the second Euler factor, so the one factor (1 − α^{-1}) is right.
- **`L2/growth-uniqueness-totally-real-imaginary-quadratic` (case b).** The node claimed that BSW's µ_Φ agrees with Bergdall–Hansen's L^ε_p(π, α) over a totally real field. That needs a growth bound for µ_Φ:
  - BSW prove none;
  - Bergdall–Hansen prove growth only for their own construction;
  - both credit the growth of the overconvergent-cycle construction to Barrera Salazar (BSW §12, p. 39; Bergdall–Hansen §1.8, p. 12).

  Bergdall–Hansen's uniqueness clause (f) uses the variation property (e) as well as growth. Under vanishing Leopoldt defect, Amice–Vélu gives uniqueness from growth and interpolation in small slope (their §1.8). The statement, hypotheses, proof and sources were corrected. A gap records Barrera Salazar's result (not read). Williams' split-prime admissibility (Definition 6.14, Proposition 6.15) was added to case (a).
- **Planets.** The planet moved from `L2/inversion-weight-twist`, a technical device of BSW Definition 9.4, to `L2/overconvergent-modular-symbols` ("Overconvergent modular symbols over F"), the layer's key definition.

### L3

- **`L3/hilbert-eisenstein-series`.** Dasgupta–Kakde §7.3 (p. 49) give the constant term of E_k(ψ_S, 1) at the cusps (1, λ) as 2^{−[F:ℚ]}ψ^{-1}(λ)L(ψ^{-1}, 1 − k) only when the level n is (1), and as 0 otherwise, for k > 1. The node stated the level-one value unconditionally. It was corrected, with the k = 1 values of DK (98) and the coefficient field Frac O added. Note that DK use n both for [F:ℚ] and for the level.
- **`L3/igusa-irreducibility` (Deligne–Ribet (4.5)).** Deligne–Ribet prove the surjectivity of the monodromy character (pp. 256–257) as follows:
  - they compute ρ at Frobenius elements of ordinary points, as the image of the unit part of the Frobenius endomorphism of the formal group;
  - they then construct ordinary Hilbert–Blumenthal abelian varieties over finite fields with any prescribed unit, level and polarisation module, from Deligne's equivalence between ordinary abelian varieties over F_q and lattices with a Frobenius endomorphism (Deligne, Invent. Math. 8 (1969));
  - Chebotarev is mentioned only as a heuristic.

  The node cited Tau Ceti's Chebotarev layer 9 and two CM-theory nodes of ShimuraVarieties V5, which this proof does not use. The proof steps were rewritten and those three prerequisites removed, with the Chebotarev request. A gap records that no layer of the atlas plans Deligne's equivalence: AbelianSchemesAndArithmeticModuliPartII F3 has Honda–Tate only.
- **`L3/katz-padic-l-function`.** Katz (5.3.5) (p. 274, zoomed) has ∏_𝔓(1 − χ̌(𝔓̄))(1 − χ(𝔓̄)), with χ̌(𝔓̄) = 1/(χ(𝔓)N𝔓). The node had χ̌(𝔓).
- **`L3/katz-hida-tilouine-tame`.** Hida 2010 (1.3) (p. 44, page image) differs from the node in three places, all corrected:
  - it has a factor π^κ, which the node dropped;
  - its Euler product runs over 𝔏 | C, and over 𝔉 the product is empty by condition (i);
  - its second factor at Σ_p uses the dual λ*(x) = λ(x^c)^{-1}|x|.
- **`L3/cm-periods`.** In the acceptance test, Ω_∞ for ℚ(i) is a nonzero algebraic multiple of the lemniscate value, not merely a real multiple.

### L3h

- **`L3h/theorem-c`.** Hsieh's Theorem C (p. 713) does not require p to be unramified in F. Theorem 7.1 (p. 759), which proves it, assumes the hypotheses of Theorem 6.2, and these include p unramified in F. The node now carries that hypothesis (new finding E6). It already used the conductor of χ in the local condition, which the published Theorem C misprints (new finding E7).
- **`L3h/finis-divisibility`.** Equation (1) of Finis' Theorem 1.1 has the ℓ-adic root number W_ℓ(λ) = N(l)^{−e(l)}G(δ, λ_l), not the global root number W(λ), which equals +1 by hypothesis. Case (2) has its own left side, Ω_∞^{-1}D^{1/4}L(0, λ). The inequality excludes ℚ(√−3) with ℓ = 3. All three points were corrected.

### L4

- **`L4/ehls-hypotheses`.** A test claimed that global multiplicity one holds when the bad places split and the base change is cuspidal. EHLS p. 100 only expects this, and for the stronger Hypothesis 6.6.4. On p. 110 they note that Hypothesis 7.3.3 follows from Mok and Kaletha–Mínguez–Shin–White, which rest in part on announced results of Arthur. The test now separates 7.3.3 from 6.6.4, and the proof step reports EHLS accurately.
- **`L4/ehls-ordinary-forms-hecke`.** The control isomorphism of Theorem 7.3.1(ii) needs κ sufficiently regular. The API item was corrected.

### L5

- **`L5/cpr-panchishkin-proposition`.** Panchishkin (§5.5 and Conjecture 6.2, page images) defines h as max_σ[P_Newton,σ(d^±) − P_Hodge,σ(d^±)] + 1, with the integer part. He predicts a bounded function when M is admissible, that is, when the polygons meet at d^±; in general, growth o(log_p^h), with uniqueness when h ≤ m\* − m\_\* + 1.

  The node dropped the integer part and tied boundedness to h = 1. Its supersingular test claimed h = 2: in fact h = [1/2] + 1 = 1, M is not admissible, and the prediction is o(log_p).

  The statement, acceptance test and API were corrected. The test was renamed `cprp_supersingular_not_admissible`, in the packet and in the suggested file.

## Source findings

The five findings of the blueprint were checked at their locators and confirmed. Each verdict is in the packet:

- **E1.** BSW §9.2.1 identifies G_y with G by a_y^{-1}, so the fibre function is z ↦ φ(a_y z). With the weight action, Propositions 9.6 and 9.9 and equation (13) need this forward chart, while §9.2.2 and Proposition 9.3 print the inverse one. This is a misprint; the results are unaffected.
- **E2.** The identity lies in GL₂(F) ∩ Σ₀(p) and is not compact, so Lemma 6.7 as stated is false. Only the representatives of (1 0; 0 p) are used.
- **E3.** Lemma 8.1(iii) needs an open bounded lattice stable under the integral Hecke algebra. Corollary 8.4 supplies one.
- **E4.** BSW divide by the image of the units rather than its closure; Katz (5.4.6) divides by the closure.
- **E5.** Eischen–Wan's "Proposition 4.17" is Lemma 4.17.

Two findings are new, found by this review (scoped to the published Documenta text and compared with arXiv v3; `sourceVersions` updated):

- **E6** (error, affects a stated result). Hsieh's Theorem C omits the hypothesis that p is unramified in F. The hypothesis is present in Theorem 7.1, through Theorem 6.2, and is used by Hida's linear independence and density theorems. The arXiv version omits it too.
- **E7** (misprint). Condition (3) of the published Theorem C indexes the product of #∆_{χ,v} by the conductor of λ. It should be the conductor of χ, as in Theorem 7.1 and in arXiv v3.

## Baseline citations removed or fixed

None. All 16 were confirmed.

## Prerequisites and requests changed

- **Added:** AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one, to `L0/odd-character-l-zero-nonvanishing`.
- **Removed from `L3/igusa-irreducibility`:** ShimuraVarieties:V5/cm-frobenius, ShimuraVarieties:V5/cm-potential-good-reduction and tauceti:TauCetiRoadmap/Chebotarev#layer-9-abelian-chebotarev. The Chebotarev request was removed with them.
- **Gaps added:**
  - Barrera Salazar's growth bound for the totally real construction, needed by `L2/growth-uniqueness-totally-real-imaginary-quadratic`;
  - Deligne's equivalence for ordinary abelian varieties over finite fields, needed by `L3/igusa-irreducibility`.

  The coverage `remaining` lists of L2 and L3 name both.

## Nodes added

None.

## Locator cross-check

The 80 node–source locators in the text-layer sources that the reviewer had not opened at their statements were cross-checked mechanically. The sources were Hsieh 2014 §§2–5, EHLS, Eischen–Wan, Disegni–Liu, Dasgupta–Kakde §1, Castella–Grossi–Lee–Skinner, Panchishkin §§3–4, Finis, Hida, Hsieh 2012 and Williams. For each locator the check confirmed that the cited number exists, that it lies on the cited page (or the next, for proofs) and that the passage is the one the `match` describes.

77 matched. The reviewer re-read the three flagged items and fixed each:

- `L5/evaluation-principle-instances` cited Panchishkin §4.1 for placing every p-adic L-function on X_p. §4.1 only defines Gal_p and X_p; the placement is Conjecture 6.2 (p. 1006), now added to the locator.
- The Hsieh 2014 match of `L3h/hsieh-hecke-nonvanishing` tied [Hsi12] to Wan's use on p. 714. [Hsi12] appears only in the list on p. 713. Corrected.
- The Castella–Grossi–Lee–Skinner match of `L0/euler-factor-elements` was made precise: the removed Euler factors are the factors over ℓ | C in Theorem 2.1.2.

These three nodes are among the 24 corrected.

## Questions for the orchestrator

1. **Owner for Deligne's equivalence.** Deligne's equivalence for ordinary abelian varieties over finite fields has no owner. A finite-field layer of AbelianSchemesAndArithmeticModuliPartII, next to its Honda–Tate stage, is the natural owner. The gap in `L3/igusa-irreducibility` can then become a prerequisite.
2. **Barrera Salazar's admissibility.** The growth bound for BSW's construction over totally real fields (thesis, Lille 2013; Ann. Inst. Fourier 68 (2018)) should be read and routed, to close the new L2 gap.
3. **PadicMeasuresIwasawaAlgebras.** This roadmap is now on TauCetiRoadmap main. When this roadmap is packaged, its citations of PadicMeasuresIwasawaAlgebras nodes and of stages L0a/L1 become citations of the Tau Ceti roadmap.
4. **Unread sources.** Hida 2004, Vatsal 2003, Hida–Tilouine 1993 and Williams' thesis remain unread gaps, as the blueprint recorded. The first two need the maintainer's copies.
