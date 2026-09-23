# Review: PAPER-NEWTON-THORNE-26 (Newton–Thorne, Symmetric power functoriality for Hilbert modular forms)

Job `REV-PAPER-NEWTON-THORNE-26` (issue #1054), by Claude Code, session `cc-38267a`, 23 September 2026. The extraction was written by ChatGPT Pro (session cp-2109-planets01-f7c2) and completed by Claude Code (session cc-442dc5). **Verdict: accept**, after the corrections below, which were made in place. There are now 17 routes, all accepted:

- routes 1–4, 6–12 and 14 are the extraction's, with additions;
- route 2 keeps only the endpoint obligations of ML.3;
- routes 5, 13, 15, 16 and 17 were added or replaced by the review.

## What was read

- **The arXiv v2 PDF and TeX source**, read in full:
  - https://arxiv.org/pdf/2212.03595v2, SHA-256 6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c;
  - https://arxiv.org/e-print/2212.03595v2, SHA-256 86e98ac0032bbf65888448fea5f9a4da04731ccea146bb91cf762e008add80fb.

  v2 (19 February 2025) is the last arXiv version. The Annals article (203 (2026), no. 1) is available only to subscribers, so the published text was not compared.
- **Method.** Three checkers split the paper: §§1–2 and 6; §3; §§4–5. Each compared every item's statement and locator with the TeX and the page images, listed what no item covers, and checked the recorded mistakes and looked for new ones. I verified the substantive findings myself (see "Mistakes"). BLGGT14 Theorem 4.2.1 and Lemmas 1.4.1 and 1.4.3 were read in the arXiv source of BLGGT14 (1010.2561).
- **Libraries.** Every library declaration was read at Mathlib 082e2d3:
  - `Representation` (RepresentationTheory/Basic.lean);
  - `Subgroup.goursat` and `Subgroup.goursat_surjective` (GroupTheory/Goursat.lean);
  - `Nat.exists_prime_lt_and_le_two_mul` (NumberTheory/Bertrand.lean);
  - `NumberField.exists_not_isUnramifiedIn` and `finrank_eq_one_of_unramified` (NumberTheory/NumberField/ExistsRamified.lean), which give the new Minkowski item.

  Mathlib 082e2d3 and Tau Ceti f790474 were searched for Hilbert symbols, Dickson's classification, Chebotarev's density theorem, adequacy, pseudocharacters and linear algebraic groups. Tau Ceti has the Chebotarev Frobenius prime sets but not the density theorem; none of the others is present.
- **The atlas.** I read, in `data/atlas.json`, the description of every layer cited by a route or by a planned item, old or new. I also compared the other two Newton–Thorne extractions and their reviews, and the briefs of the four pending Part IIs this extraction now uses.

## Items

**Statements corrected (25), with 3 locators and one status.** Each item's note says what changed. The material corrections:
- **iota-ordinary-automorphic** (Definition 2.5(1)): ι^{−1}χ_{v,i}(ϖ_v) for the printed ιχ_i(ϖ_v) (E4). I checked the formula at n = 1.
- **galois-representation-attached:** the character χ with π^∨ ≅ π^c ⊗ (χ∘N∘det) and χ_v(−1) = (−1)^n, without which the G_{F⁺}-extension does not follow.
- **lemma-3-7-technical:** the residual bars were missing, and without them the item is false (s|G_{K′} is irreducible); it also needs F′ ⊇ F₁.
- **lemma-3-4-auxiliary-fields:** d₀ is the rank of ker(Δ → Δ₀)^{c=−1}. Three conditions were restored: BC(π) unramified away from pv₀, the p-adic places of F₁ split in F₂, and the Hodge–Tate condition at u₀ that makes π₁ ⊞ π₂ regular.
- **deformation-problems-3:** the residual representation, the multiplier ε^{1−n}δ^n, the sets S and S̃, and Λ.
- **blggt-alt:** BLGGT14 Theorem 4.2.1 with its actual hypotheses (irreducibility over F(ζ_l), not adequacy; l ≥ 2(d + 1)).
- **all-primes-large-residual-image and local-conditions-large-image:** the E1 bounds (see below). In Theorem 5.9 the printed p^a > M is correct and was restored.
- **prop-4-9-patching-two:** Proposition 4.9(2) replaces 4.8(2), and δ is equivariant for the square of the standard action.
- **theorem-4-1-reductions:** the parity of the ramified set, and "S-split and everywhere unramified".
- **Minor:** continuous-lattice-reduction, adequacy-large-characteristic, section-3-hypotheses, maire-antiunits, lemma-3-6, tho15-steinberg-domain, tho24-level-raising, connectedness-dimension (its definition), prop-3-12, remove-extra-steinberg (∼, not equality), two-residual-blocks (all three replaced hypotheses of Tho24 Proposition 7.4), tamely-dihedral and ordinary-replacement (source misprints, not HTML artefacts), zariski-closure-image, kw-taylor-wiles-primes-two.
- **Locators:** bertrand-postulate, chebotarev-density, tho24-alt-and-level-raising.
- **Status:** prop-4-4-quaternionic-forms is planned in GL2ModularityLifting R22.2 and R17.3, as the same statement is in PAPER-NEWTON-THORNE-21-B (item 11).

**New items (34).** The totals are now 164 items: 4 library, 24 planned and 136 missing.
- **Library (1):** Minkowski's theorem that ℚ has no everywhere unramified extension, used to generate Γ_π by inertia.
- **Planned (14)**, each against a layer description that was read:
  - regular algebraic and weight (AG2.0); RAESDC/RAECSDC (AG2.0); the Hodge–Tate formula (AG2.6); type-A₀ characters (AG2.0, AF.5);
  - local Langlands and Weil–Deligne representations (ET.6, R16.3, R01.2); base change and soluble descent (R17.4, ML.5, ET.7a);
  - adequacy (G7); SP_n for n ≤ 5 (ML.5); essentially discrete series of weight k (R16.6, R16.3); inertial types with monodromy (R08.2); Dickson (R01.4);
  - global Jacquet–Langlands (R17.3); local Hilbert symbols (Tau Ceti ClassFieldTheory layer 14); the quaternionic forms of §4 (R22.1, R22.2, R17.3).
- **Missing (19):**
  - route 3: the algebraic-group facts of Lemma 2.2;
  - route 5: ∼ and potential diagonalisability;
  - route 6: [CHT08, Lemma 4.1.4] and the independence of ι for tensor automorphy;
  - route 7: the formula for d₀;
  - route 15, thirteen items: the auxiliary data of §3, the polarized s and its sets, "s is of type 𝒮_{F₁}", residual automorphy of the constituents, the set 𝒫, the comparison diagram, the contexts S5-global and S5-local, the §4 setup (π_K, σ_K, T), the unitary forms of §4, Δ_Q/R_Q/P_Q, the component argument of Theorem 4.1, and the intermediate claim of Proposition 6.1.

**Prerequisites.** The extraction kept a register of prior papers (`priorPapers`) but no `prerequisites` list. The review corrected the expected owners in the register to match the routes. It added the 28 cited papers the atlas does not yet cover, with DOIs checked on Crossref where they exist.

## Routes

The extraction routed its whole method, and the general inputs it imports, as sources of ModularityAndLanglandsExtensions ML.3/ML.5. ML.3 plans the endpoint ("integrate Newton–Thorne source-scoped symmetric-power automorphy"), not the proof. The reviews of PAPER-NEWTON-THORNE-21 and PAPER-NEWTON-THORNE-21-B gave each Newton–Thorne method its own Part II and each general input one owner. This review does the same, so the three extractions now agree.

1. **Source of R16.3/R16.4: accept.**
2. **Source of ML.0/ML.3/ML.5: accept, reduced.** It keeps the endpoint obligations: the automorphy predicate, the convention bridge, Lemma 2.1, Theorem 6.5(2) and the Clozel–Thorne reductions. It names the planned endpoints and the planned low-rank transfers and base change. ML.2 was dropped from its stages.
3. **Source of ArithmeticGaloisRepresentations G7/R01.1/R01.4: accept.** Dimitrov moved to route 13. The NT23 enormous-image criterion and the Lemma 2.2 facts joined it. The design job must compare NT23 Definition 2.23 with ACC+ Definition 6.2.29 before treating them as one.
4. **Source of LocalGaloisDeformationRings: accept.**
5. **Coalesced PolarizedAutomorphyLifting: added**, replacing the extraction's routes to PA.2/PA.3 and IHG.0.
   - PA.2 and PA.3 follow ACC+ in the unpolarized setting, and IHG.0 plans determinants in general.
   - The route gains the ι-ordinary notions, Thorne 2015 and Allen–Newton–Thorne 2020 (generic primes, finiteness, R_𝔭 = T_𝔭, Hecke algebras), and the Newton–Thorne 2020 ring P and its adjoint Selmer vanishing.
   - It also gains BLGGT14 Theorem 4.2.1 with ∼ and potential diagonalisability.
6. **Source of AutomorphicGaloisRepresentationsPartII: accept.**
7. **Source of ArithmeticGaloisDuality R02.3: accept.**
8. **Source of ET.6: accept.**
9. **Source of GlobalGaloisDeformations: accept.**
10. **Source of R24.2: accept.**
11. **Source of R03.6: accept.**
12. **Source of R21.2: accept.**
13. **Source of AutomorphicGaloisRepresentations R19.3 (Dimitrov's large image): added**, as for Ribet–Momose in the other two reviews.
14. **Source of R07.3: accept.**
15. **New Part II `SymmetricPowersByTensorFunctorialityLifting`: added.** No layer or pending candidate plans the method's three new elements:
    - the untwisted tensor of §3, by congruent deformation problems and generic primes;
    - a functoriality lifting theorem for tensor products (Theorem 4.1);
    - propagation over the coefficient field's Galois group (§5).

    The brief states Theorems 3.2, 4.1, 5.5 and 5.9 and Propositions 6.1 and 6.3 as printed, lists the layers and every import, and records the corrections, above all E24.
16. **Coalesced SymmetricPowerAutomorphyLifting: added.** It takes the Newton–Thorne II patching template, which §4 follows.
17. **Coalesced SymmetricPowersByUnitaryLevelRaising: added.** It takes Thorne 2024, which continues Clozel–Thorne. The results used are Theorem 6.11, Theorem 7.5, Proposition 7.4, Theorem 7.6, Corollary 7.2, Lemma 7.3 and Theorem 8.1.

## Mistakes in the paper (`sourceIssues`)

**E1 (gap, Proposition 5.4): confirmed and narrowed.**
- From t₁ | ℓ^a ± 1: for odd ℓ, ℓ^a ± 1 is even and t₁ is odd, so ℓ^a ≥ 2t₁ − 1 > M, and the printed strict bound holds.
- Only ℓ = 2 can fail, exactly when t₁ = 2^a + 1 is a Fermat prime with t₁ − 1 ≤ M (M = 16, t₁ = 17).
- Theorem 5.9 at p ≥ 5 is unaffected.

**E2 (misprint, Lemma 5.8): confirmed and extended.** The same ι-for-ι_l slip is in checks (7) and (9).

**New: E3–E31.** Each was checked in the TeX, and the substantive ones on page images; I re-derived the reasoning of those marked below.

- **E24 (gap, proof of Theorem 4.1): the most important finding.**
  - The proof takes Σ to be the ramification of π only and S = S_p ∪ Σ. It builds P from G_{K,S}, and takes the level V₀ maximal outside Σ.
  - In Lemma 5.8 the theorem is applied with π = γπ, tamely dihedral at v₀, and σ = Sym^{r−1}σ′ with σ′ Steinberg at v₀. After the base change in (12), γπ is unramified above v₀. Sym^{r−1} of a Steinberg twist keeps N ≠ 0, so σ stays ramified there.
  - So t is not a point of P, the map P → R of Corollary 4.3 is not defined, and T has no spherical vectors at those places.
  - The printed route through Theorem 5.5 to Theorems 5.9, 6.4 and A therefore has a gap. The repair is routine: add σ's ramified places to S, with unramified local conditions for r̃. No stated result is shown false.
- **E25 (gap, Lemma 5.7(4)):** [BLGGT14, Theorem 4.2.1] needs residual irreducibility over F(ζ_t), but only irreducibility over G_F is proved.
- **E22 (gap, end of Theorem 3.2):** s must be unramified outside S_{F₁}, but §3 arranges this only for π. It follows from Lemma 3.1(5).
- **E8 (gap, Proposition 6.1):** t must be prime to the conductor of π_a, not of π. Otherwise v₁ | t is possible, and potential diagonalisability at t fails.
- **E16 (gap, Lemma 3.3):** "α of order > 4r" does not give ord(−α²) > 2r (r = 2, ord α = 12). The lemma holds, by a direct check or with α a generator.
- **E27 (error, remark on p. 33):** a quadratic character unramified away from Q need not be trivial on det U₁(Q; N) at v ∈ Σ.
- **E26 (misprint, p. 32):** the generator of m_{G,Q} misses ∏_{j=1}^r γ_{v,j}. I recomputed the eigenvalue product.
- **E9 (gap, Lemma 2.1):** for odd n, the Hodge–Tate weights fix the archimedean parameter only up to sgn. The central character fixes it.
- **E4 (misprint, Definition 2.5(1)):** ι for ι^{−1}.
- **E10–E12, E15, E17, E19, E23 and E28:** small gaps with direct repairs. They are the uncited base case n ≤ 5, the ι-ordinarity of π₁ in Theorem 6.4, SP₀, the reading of Proposition 6.1(7), the determinant in Lemma 3.1, the undefined K and the domain of s̄ in §3, the choice of F₂, and v₁ ∤ p.
- **Misprints:** E3, E5–E7, E13, E14, E18, E20, E21, E29 and E30 (BLGGT14 Lemma 1.4.1 for 1.4.3(2)), and E31 (the bibliography entry [Lab11] names the wrong Labesse article).

**Not recorded:** two points the checkers raised but could not settle.
- The adaptation of the p > 2 Taylor–Wiles primes to the new eigenvalue condition is not spelled out.
- Whether ANT20 Lemma 3.9 applies to R_{𝒮_{F₁}} in Proposition 3.11.

**Published corrections:** none found. Crossref has no update relation for doi:10.4007/annals.2026.203.1.4, arXiv v2 is the last version, and the Annals page lists no erratum.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: no problems.
- Every missing item is routed exactly once, and every planned and route stage id exists in the atlas.
- Lean: none (a review of an extraction).
