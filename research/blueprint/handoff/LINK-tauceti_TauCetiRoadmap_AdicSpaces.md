# LINK-tauceti_TauCetiRoadmap_AdicSpaces: handoff

**Status:** `complete`. The whole catalogue has been screened. `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_AdicSpaces.json` reports 0 errors and 0 warnings.
**Output:** `research/blueprint/links/tauceti_TauCetiRoadmap_AdicSpaces.json`, with:

- 33 links (27 explicit, 6 inferred);
- 8 overlaps (7 rescope, 1 keep);
- 218 examined entries: the 211 other atlas roadmaps, the six roadmaps in `research/blueprint/roadmaps/`, and the focal roadmap itself.

This job continued an earlier partial checkpoint (18 links, 1 overlap, 12 examined entries). It replaced that file and this note. Only these two files and the job's scratch notes were written. One read-only `git status` was run by mistake during the final check; it changed nothing, and no other git command was run.

## Inputs

- **Atlas.** `data/atlas.json`, edition `2026-09-15-comprehensive-roadmap-revision`.
  - The focal document has sha256 prefix `7122aa4b7675d547`, from repository snapshot `faa5423b9259`.
  - No `stageEdges` touch any AdicSpaces stage.
  - Roadmap-level consumers declared in the atlas: AdicSpacesPartII, PadicHodgeTheory, RelativeFarguesFontaine.
- **New roadmaps.** MordellLawrenceVenkatesh, SolidAnalyticRings, AnalyticStacks, QWittVectors, RingStacksAndTransmutation and AnalyticHabiroStack. Five of them appeared during the job; all were read or screened (see below).
- **Other link packets.** None records a link or overlap touching an AdicSpaces stage, so no link here duplicates one. Several record AdicSpaces as examined with result "none", which agrees with this screen.
- **Placeholders.** The atlas `external` registry lists `UPSTREAM:ECD:ADIC`, consumed by AdicEtaleGeometry A0 and A1 and by PerfectoidSpaces P1, and `UPSTREAM:ECD:FF_ADIC`, consumed by FarguesFontaineDiamonds F0. Neither has a canonical stage owner. The links L0 and L2 → A0, L5 → A1, L0 and L4 → P1, and L6 → F0 name the actual AdicSpaces suppliers.

## Read scope

- **Focal roadmap.** The whole document and all seven layer descriptions were read. The inputs and outputs of each layer are in the scratch notes, and a condensed version is below.
- **Read in full (README and every stage):**
  - AdicSpacesPartII, PerfectoidSpaces, AdicEtaleGeometry.
  - FarguesFontaineDiamonds, RelativeFarguesFontaine, TropicalAndBerkovichArithmetic.
  - LocallyAnalyticDistributions, ColemanIntegration, PadicMeasuresIwasawaAlgebras, PadicHodgeTheory.
  - AInfCohomology, ClassicalAdicEtaleCohomology, PerfectoidQuotients, DiamondsAndVStacks.
  - PadicDifferentialEquationsAndRigidCohomology, AdicCoefficientsAndComparisons, CohomologyComparisons.
  - CrystallineCohomology, DerivedDeRhamCohomology, PrismaticCohomology, VectorBundlesAndIsocrystals.
  - PerfectoidShimuraVarieties, OverconvergentAutomorphicForms, HodgeTateAndCanonicalSubgroups.
  - PadicFamilies, TorsionCohomologyInfrastructure, PhiGammaModulesAndIwasawaCohomology.
  - FoundationsAndLibraryIntegration, SchemeAndStackFoundations, LogicAndDefinabilityInNumberTheory.
  - SolidAnalyticRings, AnalyticStacks.
  - DeformationAndDerivedPatchingAlgebra (all stages).
- **Targeted reads:**
  - MordellLawrenceVenkatesh: README, LV.0 and LV.3.
  - QWittVectors: README and QW.0–QW.2.
  - DiamondEtaleCohomology C6 and C7; DiamondSixOperations S5; EtaleDualityAndPerverseSheaves EDC.6.
  - PadicHodgeRegulators L0, D.1 and KU-padicreg.
  - HigherLocalFields HL.0; RingStacksAndTransmutation RS.2.
  - EllipticCurves: conventions and Layer 4.
  - LocalFieldsRamification: Layer 0 valuative-structure passages. The earlier checkpoint read the whole document.
- **Screened only.** Every other roadmap, including every upstream Tau Ceti roadmap, was screened by summary, stage titles and a keyword-context search of its README and stage texts. The terms were:
  - Huber, Tate ring or algebra, affinoid, power-bounded, pseudouniformiser, restricted series;
  - strongly noetherian, open mapping, Spv or valuation spectrum, continuous valuation;
  - spectral, pro-constructible, patch, Spa, rational subset or localisation or cover;
  - sheafy, stably uniform, Buzzard–Verberkmoes, pre-adic or adic space, rigid, Wedhorn;
  - A_inf or W(𝒪_F), Fargues–Fontaine, unit disc or polydisc, interval ring, Berkovich, perfectoid;
  - a second pass for nonarchimedean, Robba, overconvergent, eigenvariety, weight space, period map, generic fibre, formal model, analytification, tube, dagger, diamond and tilt.

  Every match was read in context. False positives included "Schubert" for Huber, "rigidifier", "diamond operator" and "A∞". In each `examined` note, "none" means no edge was found within the recorded read scope.

## Focal layers: inputs and outputs (condensed)

- **Inputs.** Mathlib only: nonarchimedean topological algebra, `ValuativeRel`, `SpectralSpace`, `GlueData`, Witt vectors and the mathlib4 PRs for boundedness, Huber rings and Spv. No inward link exists.
- **Layer 0.** Bounded sets; A° and A°°; pairs of definition; Huber and Tate rings; Huber pairs; completion. Weighted restricted series; topological localisation A(T/S) and A⟨T/S⟩; restricted series over Tate rings. Weierstrass division and preparation, K⟨X⟩ noetherian, strong noetherianness; Henkel's open mapping theorem.
- **Layer 1.** Spv A with support and pullback; spectrality; pro-constructible subspaces; Spv(A,I); Cont A.
- **Layer 2.** Spa(A,A⁺) is spectral, with functoriality; rational subsets and their calculus (7.30, 7.34, 7.53, 8.2(2), 7.54). A⁺ is recovered from Spa; emptiness criterion; analytic points and the analytic locus with Tate rational charts. Quotient pairs (7.38); affinoid algebras (7.56); closed polydiscs.
- **Layer 3.** A_U = A⟨T/s⟩ with its universal property, A_U⁺, and presentation independence. The category CompleteSeparatedTopCommRingCat; structure presheaves 𝒪_X and 𝒪_X⁺ with local stalks. Pre-adic spaces 𝒱^pre and 𝒱; the sheafiness predicates; basis sheaf criteria.
- **Layer 4.** For strongly noetherian Tate rings: M⊗A⟨X⟩ ≅ M⟨X⟩, flat rational restriction maps, all-degree augmented Čech exactness, stable sheafiness (8.28, 8.35). Uniform and stably uniform rings; the Buzzard–Verberkmoes theorem.
- **Layer 5.** Adic spaces in 𝒱. Open immersions, and closed immersions by a closed J with A/J sheafy. Morphisms locally of finite type; gluing. Spa(K,K°), closed polydiscs, and the open unit disc as a union of rational discs.
- **Layer 6.** F is perfect, complete and rank one. A_inf = W(𝒪_F) is (p,[ϖ])-adic and not Tate; 𝒴 = D(p) ∩ D([ϖ]). Power comparison, κ(φv) = pκ(v), windows U_n and V_n, the quotient 𝒳 = 𝒴/φ^ℤ. Interval rings B^I (strongly noetherian); the quotient sheaf; window charts ≅ Spa(B^I,B^{I,+}) in 𝒱; independence of ϖ.

## Links (all out of AdicSpaces)

| Source layer | Target | Confidence | Content |
|---|---|---|---|
| 0 | AdicSpacesPartII:R0 | explicit | Huber pairs and completion for completed tensor products |
| 3 | AdicSpacesPartII:R0 | explicit | universal property of A_U for localisation compatibility |
| 4 | AdicSpacesPartII:R0 | explicit | strongly noetherian Tate ⇒ stably sheafy, for affinoid products (**new**) |
| 5 | AdicSpacesPartII:R0 | explicit | gluing to fibre products |
| 4 | AdicSpacesPartII:F0 | explicit | same, for F0's analytic fibre-product paragraph (**new**) |
| 5 | AdicSpacesPartII:F0 | explicit | gluing for F0's analytic fibre products (**new**) |
| 2 | AdicSpacesPartII:R2 | explicit | rational subsets for line-bundle rational subdomains |
| 4 | AdicSpacesPartII:R3 | explicit | flatness and all-degree Čech exactness ⇒ coherent acyclicity (**new**) |
| 0 | PerfectoidSpaces:P1 | explicit | Tate rings, R°, pseudouniformisers |
| 4 | PerfectoidSpaces:P1 | explicit | the uniformity predicate in ECD Definition 3.1 (**new**) |
| 2 | PerfectoidSpaces:P2 | explicit | Spa and rational subsets for the tilting homeomorphism |
| 3 | PerfectoidSpaces:P2 | explicit | rational localisations and structure presheaf |
| 5 | PerfectoidSpaces:P2 | explicit | adic-space carrier and gluing |
| 0 | AdicEtaleGeometry:A0 | explicit | tensor topology from pairs of definition (**new**) |
| 2 | AdicEtaleGeometry:A0 | explicit | analytic locus with Tate charts (**new**) |
| 5 | AdicEtaleGeometry:A1 | explicit | generalised presentations versus sheafy adic spaces |
| 4 | AdicEtaleGeometry:A4 | explicit | uniformity for uniform completion (**new**) |
| 6 | FarguesFontaineDiamonds:F0 | explicit | the fixed-field ℚ_p curve and its charts |
| 3 | RelativeFarguesFontaine:RF0:integral-Y | explicit | completed chart rings with integral-closure plus rings |
| 4 | RelativeFarguesFontaine:RF0:annuli | explicit | Buzzard–Verberkmoes for non-noetherian annuli |
| 6 | RelativeFarguesFontaine:RF0:annuli | explicit | fixed-field ring comparison with B^I |
| 5 | RelativeFarguesFontaine:RF1 | explicit | gluing Y_S |
| 2 | TropicalAndBerkovichArithmetic:TB.0 | inferred | Huber spectrum of a strictly affinoid algebra |
| 5 | LocallyAnalyticDistributions:L3 | explicit | affinoid and open-gluing APIs for character spaces |
| 5 | ColemanIntegration:L1 | explicit | open subspaces and gluing for wide opens |
| 5 | PadicMeasuresIwasawaAlgebras:L0a | inferred | rigid character and weight spaces from polydisc charts (**new**) |
| 1 | DiamondsAndVStacks:D0 | inferred | pro-constructible sets (**new**) |
| 1 | SolidAnalyticRings:SA.3 | explicit | valuation spectra, via the stage's `requires` (**new**) |
| 2 | SolidAnalyticRings:SA.3 | explicit | Spa and rational subsets of discrete pairs, via `requires` (**new**) |
| 3 | SolidAnalyticRings:SA.3 | inferred | discrete structure presheaves (**new**) |
| 0 | SolidAnalyticRings:SA.4 | explicit | Huber rings and Tate algebras, via `requires` (**new**) |
| 2 | AdicCoefficientsAndComparisons:L1 | inferred | adic realisation of characteristic-p schemes as discrete Spa (**new**) |
| 2 | AdicCoefficientsAndComparisons:L4 | inferred | test space {x ≠ 0} ⊂ Spa O[[x]] (**new**) |

Confidence is `explicit` when the consumer's stage or document names AdicSpaces, and each such link carries that naming sentence as a third evidence item. It is `inferred` when neither text names the other.

**Changes from the checkpoint.** 17 of the 18 links were confirmed and kept, with reasons and evidence rewritten. **L1 → PerfectoidSpaces:P2 was dropped.** The tilting homeomorphism is a statement about Spa(R,R⁺) and its rational subsets, which L2 → P2 already covers. The map x ↦ x♭ goes through the multiplicative sharp map, not a ring homomorphism, so Layer 1's pullback of valuations is not what P2 uses.

## Overlaps and recommendations

1. **Layer 5 / AdicSpacesPartII:R0 (rescope).** Both construct open and closed immersions.
   - R0 should import Layer 5's immersions and add only the comparison with coherent closed analytic subspaces.
   - Tensors, fibre products and separated, finite, smooth and étale maps stay in R0.
2. **Layer 5 / AdicEtaleGeometry:A2 (rescope; canonical owner PartII).** Both construct locally finite-type morphisms and balls.
   - A2 should import Layer 5.2's morphisms and Layer 5.4's polydiscs.
   - A2 keeps tori, relative balls, differentials, the Jacobian criterion, smoothness, and separated, proper and partially proper maps.
3. **Layer 5 / PerfectoidSpaces:P4 (rescope).** P4 should reuse Layer 5's open immersions.
   - It should compare perfectoid closed immersions with Layer 5 closed immersions whose quotient is perfectoid.
   - Zariski closed immersions, diagonals and the valuative criteria stay in P4.
4. **Layer 6 / FarguesFontaineDiamonds:F2 (rescope).** F2's "q is locally an isomorphism on the existing wandering charts" and "relation is the disjoint union of Frobenius graphs" restate Layer 6 §6.4, items 1–5.
   - F2 should cite them through F0.
   - It keeps α_F-equivariance, effectiveness of the diamond étale relation, q^♢ as a quotient cover, and β_F.
5. **Layer 6 / RelativeFarguesFontaine:RF1 (keep).** This is the absolute quotient versus the relative one.
   - Proposal: RF1 adds an adic-level isomorphism X_S ≅ 𝒳 for E = ℚ_p and S = Spa(F,𝒪_F), extending RF0:annuli's ring comparison.
   - At present RF1 compares with the fixed-field curve only through FFD's diamonds.
6. **Layer 6 / AInfCohomology:AI.0 (rescope).** Both form A_inf = W(𝒪_F) with Frobenius and completeness; for F = C♭ they are the same ring.
   - AI.0 should take A_inf and its (p,[ϖ])-adic completeness from Layer 6.1, or both should share one Witt-vector lemma.
   - AI.0 keeps θ, μ, ξ, the Breuil–Kisin twists and A_cris.
7. **Layer 1 / DiamondsAndVStacks:D0 (rescope).** D0 should import Layer 1.3's pro-constructible sets and spectrality theorem, and add generalisation, limits and the ECD §2 quotient criteria.
8. **Layer 3 / SolidAnalyticRings:SA.3 (rescope).** SA.3 lists structure presheaves on discrete Spa (RC 5.6.5–5.6.6) among its targets, but Layer 3 already builds them.
   - SA.3 should import Layer 3, specialised to A_U = R[1/s], and keep the solid structures and Theorem 5.6.8.
   - Its inputs should add Layer 3.

**Merges.** None proposed: AdicSpaces is a coherent foundation and every consumer adds genuinely new mathematics. The rescopes above keep ownership of immersions, finite-type maps, pro-constructible sets, discrete structure presheaves, the curve's quotient charts and A_inf in AdicSpaces.

## Candidates considered and not recorded

- **Layer 0 → MordellLawrenceVenkatesh:LV.3.** LV.3 proves Strassmann's theorem for K_v⟨X⟩, which follows from Layer 0.5's Weierstrass preparation. LV.3 does not name that route, and an elementary proof suffices.
- **Layer 5 → PadicFamilies:L2a.** L2a glues eigenvarieties over affinoids, but the rigid carrier reaches it through PadicMeasuresIwasawaAlgebras:L0a, which is linked.
- **Layer 2 → LocallyAnalyticDistributions:L4.** L4 uses affinoid K-algebras, but that roadmap explicitly limits its use of AdicSpaces to the geometric interpretation of character spaces.
- **Layer 2 → AdicEtaleGeometry:A4** (Spa invariance), **Layer 5 → DiamondsAndVStacks:D6**, **PerfectoidSpaces:P7** (Huber tilde-limits) and **Layer 6 → FarguesFontaineDiamonds F1–F4.** The carrier arrives through the linked entry stages, and no separate AdicSpaces result is used.
- **Layer 6 → AInfCohomology:AI.2.** Its "existing Fargues–Fontaine curve/patching carriers" are routed through RelativeFarguesFontaine RF4.
- **Layer 2 → PerfectoidQuotients:Q4.** The spectrum of a Zariski-closed perfectoidisation could use Wedhorn 7.38, but Q4 does not say so.
- **PadicHodgeTheory.** Its P7 Robba rings are not Layer 6's B^I, and R06.1 takes A_inf from AInfCohomology.

## Observations for other jobs (outside this packet)

- **AdicSpacesPartII.** F0's second paragraph constructs analytic fibre products, which duplicates R0, and F0 has no edge from R0. If PartII moves the paragraph into R0, drop L4 and L5 → F0.
- **Duplicate character spaces.** LocallyAnalyticDistributions L3 and PadicMeasuresIwasawaAlgebras L0a both construct rigid character spaces.
- **Missing geometric suppliers.** PadicMeasuresIwasawaAlgebras L0a, PadicFamilies L2a and ColemanIntegration L1 also need AdicSpacesPartII (R1, R2 generic fibres and tubes; R0 products; R3 coherent sheaves), which they do not list.
- **PadicHodgeTheory P8.** It says FarguesFontaineDiamonds owns the curve's vector bundles, but bundle classification is owned by VectorBundlesAndIsocrystals.

## Validation

- The scratch builder checked every quote against the atlas and the new roadmap files, using the checker's whitespace normalisation, before writing.
- It also checked for cycles against the atlas `stageEdges` and every other link packet: none.
- `scripts/check_links.py` on the written file: `0 error(s), 0 warning(s)`.
