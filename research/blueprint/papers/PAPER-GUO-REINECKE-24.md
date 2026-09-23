# PAPER-GUO-REINECKE-24: extraction and routing

Issue #1226. Claude Code, session cc-442dc5. The extraction is complete. Implementation and proof closure are not claimed.

Haoyang Guo and Emanuel Reinecke, *A prismatic approach to crystalline local systems*, Invent. Math. 236 (2024), 17–164 (doi 10.1007/s00222-024-01238-4; arXiv 2203.09490).

The result has **274 items: 2 library, 52 planned and 220 missing**. The missing items are routed exactly once, by nine routes:

- two Part IIs (the main vehicles);
- two existing proposals, reused;
- five source routes.

The paper was read in full, and thirty-five mistakes are recorded under `sourceIssues`: 23 misprints, 6 errors and 6 gaps. None of them overturns a main theorem. (The review of this extraction, issue #1227, confirmed all thirty-five and added one more misprint, E36, so the file now carries thirty-six: 24 misprints, 6 errors and 6 gaps. See `research/blueprint/reviews/REV-PAPER-GUO-REINECKE-24.md`.)

## What the paper proves

**Theorem A.** Let X be a smooth p-adic formal scheme over O_K, with K discretely valued and possibly ramified. The étale realization T is an equivalence from analytic prismatic F-crystals to crystalline Z_p-local systems on X_η, in Faltings' sense. An analytic F-crystal is a vector bundle on Spec(A) ∖ V(p,I) at each prism (A,I), with a Frobenius isomorphism after inverting I. This extends Bhatt–Scholze's theorem for Spf(O_K).

- **Full faithfulness** (§4.1) reduces, by a Čech argument, to Fargues' classification of Breuil–Kisin–Fargues modules. The paper generalizes that classification to integral perfectoid rings (the "lattice realization").
- **Essential surjectivity** (§4.2) starts from the filtered F-isocrystal of T. A vector bundle is glued over 𝒴 = Spa(Δ_{S,perf}) ∖ V(p,I) from the crystalline side (on 𝒴_{[1/p,∞]}) and the étale side (on 𝒴_{[0,∞)}). The descent data is extended across the boundary using the Beilinson fibre square.

**Theorem B.** Let f : X → Y be a smooth proper morphism of smooth formal O_K-schemes and T a crystalline local system. Then R^i f_{η,*}T is crystalline, and it is associated with R^i f_{s,crys,*}E_s. **Corollary C** is the absolute case, for geometric cohomology H^i(X_C, T).

The proof of Theorem B runs as follows.

1. Theorem 5.10 embeds analytic F-crystals into prismatic F-crystals in perfect complexes.
2. The étale comparison (Theorem 6.1) and the crystalline comparison (Theorem 6.4, Corollaries 6.8 and 6.14) are proved with coefficients.
3. Poincaré duality for prismatic pushforwards is proved in two forms. Theorem 7.8 needs no trace. Theorem 7.16 normalizes a trace by an étale trace. Corollary 1.17 is the resulting p-adic Poincaré duality.
4. Duality then gives the Frobenius isogeny: Rf_{Δ,*}E is again a prismatic F-crystal (Theorem 8.1).
5. The strong étale comparison over 𝔸_inf[1/μ] (Theorem 9.1) is proved by an arc-local analysis over A = ∏ A_inf(V_j). With the crystalline side this gives the comparison over 𝔹_crys (Theorem 9.15).
6. Compatibility with filtrations after 𝔹_dR (Theorem 10.13) is proved through infinitesimal cohomology over 𝔹⁺_dR, compared with Scholze's relative de Rham comparison.

## Sources inspected

- [arXiv 2203.09490v3](https://arxiv.org/abs/2203.09490v3) (27 October 2023, 110 pages, "Revision based on referee comments").
  - PDF SHA-256 `3c49a5f2…6b28d26`; TeX source SHA-256 `039db4d2…5fb36`.
  - The full TeX source (5372 lines) and the bibliography were read.
  - All locators and page numbers refer to this version.
- The published Inventiones PDF is paywalled and was not read.

All sources were accessed on 22 September 2026.

The paper was read by section: introduction and §2, §3–4, §5–6, §7–8, and §9–10 with the bibliography. The result was then assembled from one consolidated item list. Each recorded mistake was checked against the TeX source before it was kept.

## Mistakes found (`sourceIssues`)

The ones that change a statement or an argument:

| Id | Where | Kind | What is wrong | Repair or consequence |
| --- | --- | --- | --- | --- |
| E12 | Proposition 3.7 | error | Restriction of prismatic F-crystals to the analytic locus is full only for X flat over O_K. For X = Spec k, the endomorphisms of the unit object are Z_p on one side and Q_p on the other. | Every later use has X smooth over O_K. |
| E14 | Proposition 4.11, proof | error | The lift s : R → Δ_S cannot exist when K is ramified. An Eisenstein relation in A_inf(S) would force a unit into pA_inf(S). | Lift the unramified model R_0, as Construction 2.28 does. |
| E9 | Proposition 2.29, proof | error | The invariants computed are R ⊗_{K₀} K, not R. The printed chain would give B_crys^{G_K} = K when K ≠ K₀. | The proposition survives because B_crys ∩ K = K₀. |
| E10 | Proposition 2.29, Corollaries 2.30 and 2.35 | gap | They need X quasi-compact. For ⊔_n Spf O_K, one side is (∏ Z_p)[1/p] and the other ∏ Q_p. | Add the hypothesis. |
| E8 | Construction 2.28 | gap | The independence argument admits lifts that agree only modulo p. A lift can then differ by p, which is not in Fil¹. | Require lifts compatible with θ. |
| E6 | Definition 2.3 | gap | θ̃ is not W(k)-linear when k ≠ F_p. | Use the φ-twisted W(k)-structure. |
| E15 | Theorem 5.10 | error | Pushforward at every prism does not give perfect complexes: it fails at crystalline prisms. | Push forward only at Breuil–Kisin-type prisms and base change. |
| E17 | Theorem 6.13(ii) | gap | The cited Ogus–Shiho comparisons concern enlargements of finite type, but they are applied at A_crys(S). | An extension of the comparison to such bases is needed. |
| E24 | Theorem 7.16, proof | gap | It uses Proposition 7.1 without the hypothesis f_*O = O. | Use Stein factorization, as in Proposition 7.13. |
| E27 | Lemma 9.7(ii), proof | gap | It claims every ideal of F_p^J is principal, which fails for non-principal ultrafilters. | An ultrafilter argument closes the gap. |
| E26, E35 | Theorems 9.1 and 10.16, proofs | error | Two false side remarks: the image of I is (p), not 0; R′ → R′_∞ is not integrally pro-finite-étale. | Neither affects the conclusion. |

The rest are misprints whose intended meaning is clear:

- Corollary C should use the geometric fibre (E1).
- Theorem 1.24 needs "proper" (E4); Theorem 1.13 needs the relative dimension n (E3); Theorem 7.16 needs "smooth" (E23).
- Δ⟨I/p⟩ is defined as the p-completion of Δ[I/p], not of Δ[1/p] (E5).
- The annuli in Example 1.8 (E2).
- Construction 4.2's Ξ must be φ*E ⊗ 𝔹⁺_dR (E13).
- Various indices, shifts and cross-references (E7, E11, E16, E18–E22, E25, E28–E34).

No published correction was found; the places searched are listed in each entry. Further candidate slips that could not be settled are listed in the handoff note as leads for the reviewer, not recorded here.

## What the atlas and the libraries already have

**Library (2).** Two commutative-algebra inputs: surjective endomorphisms of finitely generated modules (`mathlib:OrzechProperty`) and associated primes (`mathlib:associatedPrimes`). Mathlib's A_inf and Fontaine θ are cited in notes.

**Planned (52 items).**

| Topic | Planned in |
| --- | --- |
| Prisms, the Bhatt–Scholze comparisons, perfect prisms, qrsp initial prisms, arc-descent on perfectoids, envelopes | PrismaticCohomology PR.0–PR.4 |
| Bhatt–Lurie's absolute site, Breuil–Kisin twists and Hodge–Tate crystals | PrismaticCohomology PR.5 |
| Bhatt–Scholze's F-crystals over O_K, the étale realization, Laurent F-crystals as local systems, and the boundary analysis over O_K | PrismaticCohomology PR.7 |
| BKF modules, Fargues' theorem, A_inf-cohomology | AInfCohomology AI.0–AI.5 |
| Relative period sheaves (𝔸_inf, 𝔹⁺_dR, O𝔹_dR, 𝔸_crys, 𝔹_crys), Brinon's exact sequence, Scholze's relative comparison | PadicHodgeTheory P8 |
| Crystals, isocrystals, F-isocrystals, crystalline duality and Frobenius isogeny | CrystallineCohomology CR.1–CR.3 |
| Pro-étale sites and lisse sheaves | AdicSpacesPartII R4 |
| The Beilinson fibre square | RefinedTraceMethods RT.3b |
| Beauville–Laszlo gluing | RelativeFarguesFontaine RF4 |
| The Witt affine Grassmannian | GeometricSatakeAndFusion GS0 |
| C_crys for constant coefficients | CohomologyComparisons CP.2 |
| Infinitesimal cohomology over B_dR⁺ in the absolute case | CohomologyComparisons CP.3 |
| Scheme and étale foundations | SchemeAndStackFoundations, EtaleDualityAndPerverseSheaves |

## Routes

1. **Prismatic cohomology, Part II: prismatic F-crystals and crystalline local systems on smooth formal schemes** (`PrismaticCohomologyPartIICrystallineLocalSystems`, 167 items). PR.7 stops at Spf(O_K). This Part II covers:
   - the higher-dimensional equivalence;
   - the calculus of prismatic F-crystals in perfect complexes: comparisons, duality, Frobenius isogeny and the strong étale comparison;
   - the relative C_crys conjecture.

   It also owns three inputs nothing else plans: Drinfeld–Mathew descent, the higher-dimensional Breuil–Kisin prisms of Du–Liu–Moon–Shimizu, and Tian's Hodge–Tate crystal duality.
2. **P-adic Hodge theory, Part II: crystalline local systems on smooth formal schemes** (`PadicHodgeTheoryPartIIRelativeCrystallineLocalSystems`, 32 items). It covers Faltings' crystalline sheaves, the sheaves 𝔹_crys(E) and 𝔹_dR(E) with their filtrations, and the full faithfulness of crystalline local systems into filtered F-isocrystals (Propositions 2.29–2.38). This is p-adic Hodge theory independent of prisms, so it belongs to PadicHodgeTheory's direction, and route 1 imports it.
3. **ArcTopologyAndDescent** (reused new roadmap, 2 items). The p-complete arc-topology and arc_p-descent for étale cohomology of generic fibres. This is the roadmap proposed by the Bhatt–Mathew and Bhatt–Scholze extractions.
4. **SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry** (reused Part II, 1 item). Bhatt's theorems on absolute integral closures, already routed there by the Bhatt et al. extraction.
5. **Source routes.**
   - PadicDifferentialEquationsAndRigidCohomology RD.3/RD.5/RD.7 (13 items): Ogus's convergent isocrystals, Berthelot's equivalence, Xu's higher direct images, the Ogus–Shiho comparisons and Theorem 6.13.
   - RelativeFarguesFontaine RF0/RF4: Kedlaya's algebraization of vector bundles on punctured spectra, and freeness of φ-modules.
   - CohomologyComparisons CP.3: Guo's infinitesimal cohomology over B_dR⁺.
   - ClassicalAdicEtaleCohomology H3: the Berkovich–Zavyalov trace.
   - SchemeAndStackFoundations SF.1/SF.3: coherent duality for smooth proper formal schemes, and Bhatt's algebraization on products.

No Tau Ceti roadmap is involved.

## Coverage crosswalk

Item numbers are the suffixes after `PAPER-GUO-REINECKE-24/`.

| Paper block | Items |
| --- | --- |
| Main results (Theorems A, B, Corollaries C, 1.17), with Du–Liu–Moon–Shimizu | 002–006 |
| Imported prismatic, A_inf and period-sheaf inputs | 001, 007–046 |
| §2.2 convergent isocrystals | 047–055 |
| §2.1, 2.3–2.4: crystalline local systems | 056–087 |
| §3–§4: analytic F-crystals and Theorem A | 088–134 |
| §5–§6: F-crystals in perfect complexes and comparisons | 135–169 |
| §7–§8: Poincaré duality and Frobenius isogeny, with their inputs | 170–211 |
| §9–§10: strong étale comparison, 𝔹_crys comparison, filtrations, Theorem B | 212–274 |

## Prerequisite papers the atlas does not cover

- Du–Liu–Moon–Shimizu (arXiv 2203.03444).
- Tian (J. reine angew. Math. 2023).
- Mathew (J. Pure Appl. Algebra 2022).
- Faltings (1989).
- Tan–Tong (Algebra Number Theory 2019).
- Shimizu (Compositio Math. 2022).
- Brinon (Mém. SMF 112).
- Ogus (1984, 1990).
- Xu (Compositio Math. 2019).
- Shiho (arXiv 0707.1742).
- Guo (arXiv 2112.14304).
- Kedlaya, and Kedlaya–Liu.
- Zavyalov, and Berkovich.
- Liu–Zhu, which is queued as issue #1302.

Links are in `prerequisites`.
