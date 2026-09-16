# LINK-tauceti_TauCetiRoadmap_LocalFieldsRamification: handoff

**Status:** `complete`. The whole catalogue has been screened. `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_LocalFieldsRamification.json` reports 0 errors and 0 warnings.

**Output:** `research/blueprint/links/tauceti_TauCetiRoadmap_LocalFieldsRamification.json`. It contains:

- **48 links**: 45 out of LocalFieldsRamification (LFR) and 3 into it; 40 explicit and 8 inferred.
- **11 overlaps**: 7 rescope, 4 keep, no merge.
- **217 examined entries**: the 211 other atlas roadmaps and the 6 roadmaps now in `research/blueprint/roadmaps/`. Five of those (AnalyticHabiroStack, AnalyticStacks, QWittVectors, RingStacksAndTransmutation, SolidAnalyticRings) appeared during this job and were screened before the packet was finalized.

There was no earlier checkpoint for this job. Only the links file and this note were written in the repository. No git command was run.

## Inputs

- **Atlas:** `data/atlas.json`, edition `2026-09-15-comprehensive-roadmap-revision`, sha256 `62ab6c2c…6361c56`.
  - No `stageEdges` touch any LFR stage.
  - The declared roadmap edges LFR → ArithmeticGaloisRepresentations, LanglandsParameterStacks, LefschetzPencilsAndVanishingCycles, ReductiveGroupsPartII, RelativeFarguesFontaine and VectorBundlesAndIsocrystals have stageCount 0.
  - The UPSTREAM:LocalFieldsRamification pseudo-stage feeds LP0, LPV.1 and VB0.
- **Focal document:** `content/tau-ceti/LocalFieldsRamification/README.md`, sha256 `2f2d0d97…5017bf`, 1,101 lines, read in full. The five stage descriptions are verbatim slices of it; the #226 consumer contract, dependency order and LeanBridge audit are README-only.
- **Other link packets present at the end of the job:**
  - AlgebraicCurves (complete): LFR L3 → AlgebraicCurves L8, and the rescope overlap of AlgebraicCurves L7–L8 with LFR L3.
  - NumberFieldArithmetic (complete): LFR L0 → NFA L5 and L6; L2 → NFA L5 (inferred, unramified branch); L3 → NFA L5 and L6; the rescope overlap of LFR L3 with NFA L4.
  - ClassFieldTheory (**partial, "work in progress"**, appeared at 13:00 during this job): 15 links from LFR L0–L4 into CFT L5, L6, L7, L8, L9, L12, L13, plus a rescope overlap (ProfiniteCohomology L9, LFR L4, CFT L5) on the algebraic-closure against separable-closure Galois group.
- **Deduplication:** all of these are confirmed by this screen and not duplicated. My screen had found 14 of the 15 CFT pairs independently; they were removed from this packet because the CFT packet records them:
  - L1 → CFT 5, 6, 7, 8, 12;
  - L2 → CFT 5, 6, 7, 9;
  - L3 → CFT 6, 7;
  - L4 → CFT 7, 9;
  - L0 → CFT 7.

  If the partial CFT packet later drops any of them, restore it from this list. The CFT packet's inferred L3 → CFT 13 (local conductor–discriminant formula) was not in my set; I leave it to that packet.

## Method and read scope

1. **Own stages.** Inputs and outputs of each layer were written down in precise terms before searching.
2. **Candidate search.**
   - All roadmap documents and stage descriptions were dumped to text.
   - Keyword searches covered: local field, nonarchimedean, unramified, ramification group/index/filtration, upper/lower numbering, inertia, tame/wild, fundamental character, uniformizer, unit filtration, principal units, Teichmüller, Herbrand, Hasse–Arf, Swan/Artin conductor, different, Eisenstein polynomial, monogenic, K^ur/E-breve, Frobenius element/lift, arithmetic/geometric Frobenius, Weil group, Weil–Deligne, norm group, local reciprocity, Lubin–Tate, Hilbert symbol, Hensel/Krasner, ℚ_p/ℤ_p, and every spelling of "LocalFieldsRamification" and "local fields and ramification".
   - All 212 summaries and stage-title lists were read. Hits were read in context, stage by stage.
3. **Whole documents or every stage read:**
   - ClassFieldTheory (entire README);
   - QuadraticFormInvariants (contract tables, Layers 6, 6A–6E, 7A, ordering and ownership);
   - ProfiniteProPGroups (contract, Layers 0–5 and 7);
   - NumberFieldArithmetic (boundaries, Layers 5–8);
   - ArithmeticGaloisRepresentations, LanglandsParameterStacks, LefschetzPencilsAndVanishingCycles (LPV.0–LPV.2), ReductiveGroupsPartII, RelativeFarguesFontaine, VectorBundlesAndIsocrystals (VB0–VB2);
   - ColemanPowerSeries, ColemanIntegration, DirichletPadicLFunctions, IntegralIwasawaTheory, PadicMeasuresIwasawaAlgebras, SelmerIwasawaCohomology, KTheoryFiniteLocalFields, PadicHodgeRegulators;
   - HigherLocalFieldsAndHigherClassFieldTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory, SmallRamificationAndAbelianVarietyBaseCases, MordellLawrenceVenkatesh.
4. **Targeted stage reads:**
   - Upstream: AlgebraicCurves L5–L8 and L12; GlobalNumberFields L0, L7, L10; GlobalQuadraticForms ownership and L2/L4; Chebotarev L1, L2, L4, L7, L8; EllipticCurves L4 (full), L7, L8; ModularCurves L10; BelyiMaps L9, L12; StableReduction L0–L1; PolynomialGaloisGroups L5; AdicSpaces L0, L5, L6; ProfiniteCohomology L9.
   - Campaign: FunctionFieldArithmetic FA.3–FA.5; EulerSystemsAndKolyvaginSystems ES.1–ES.2; PhiGamma PG.0, PG.1, PG.6; FoundationsAndLibraryIntegration LI.4; K2SymbolsBrauer T.3, T.5, T.7; SmoothRepresentationsOfLocalGroups SR.0–SR.6; AutomorphicLFunctions AL.1–AL.5; GL2Automorphic R16.2–R16.3; EndoscopicTransfer ET.3, ET.6, ET.7; ExcursionOperators ES1, ES6, ES7; BunG BG0–BG1; LocalGaloisDeformationRings L7, R08.2, R08.3; ClassicalSerre R27.1, R33.2, R33.3; SerreWeight R20.2–R20.3; Néron R11.1, R11.5; PadicHodgeTheory R06.3; AutomorphicGaloisRepresentations R19.1, R19.4, R19.5; AG2.5; DWP.5; R34.3; ArithmeticGaloisDuality D7/R02; DiamondEtaleCohomology C8; AdicCoefficients L6; ComputationalNumberTheory CN.2; ClassicalArithmeticCompletion CA.1, CA.5, CA.7; InverseGalois IG.1, IG.6.
   - Keyword contexts of the remaining campaign hits; the `examined` notes say what was read for each.
5. **Decisions.** Each candidate pair was decided on the full descriptions. Quotes were machine-checked against the atlas and new-roadmap texts.
6. **Confidence.** Per the job instruction, a link is **explicit** when either text names the other roadmap or stage (including a roadmap-level dependency statement in the consumer's document). It is **inferred** when neither does but the match is exact.

## Links

### Into LFR (3, explicit)

| Supplier | Consumer | Content |
|---|---|---|
| ProfiniteProPGroups L3 | L1 | `IsProP`; pro-p as a limit of finite p-groups, for `U(K,1)` |
| ProfiniteProPGroups L2 | L4 | `exists_isProPSylow`, containment, `IsProPSylow.eq_of_normal`, images, for wild inertia |
| ProfiniteProPGroups L4 | L4 | `freeProfiniteGroup` with `lift`, `presentedProfiniteGroup`, for the Iwasawa presentation |

### Out of LFR (45)

- **QuadraticFormInvariants (7, explicit):** L0, L1, L2 → 6A; L0, L1 → 6B; L0, L1 → 6C. 6D and 7A consume LFR only through 6A.
- **ReductiveGroupsPartII (4, explicit):** L0 → RG2.0, RG2.1; L2 → RG2.1, RG2.3. The document says "LocalFieldsRamification supplies valuations and unramified extensions".
- **ColemanPowerSeries L0 (4, explicit):** L0 (local structure of ℚ_p(μ_{p^n})), L1 (principal units, U = μ × U¹), L2 (unramified coefficient extension), L3 (Eisenstein total ramification).
- **FoundationsAndLibraryIntegration LI.4 (3, explicit):** L2, L3, L4, the layers carrying the audited topics (norms, arithmetic/geometric Frobenius, ramification).
- **MordellLawrenceVenkatesh (3):** L2 → LV.1 (explicit; in LV.1's `requires`, not in the atlas); L2 → LV.2 and LV.6 (inferred; K_v/ℚ_p unramified with σ the arithmetic Frobenius; unramified extensions of degree r ≥ 8).
- **PadicHodgeRegulators (3, explicit):** L1 → D.1 and L2 → D.1 (Teichmüller, unit decompositions and Frobenius must be the existing local-field objects); L2 → D.3 (finite unramified extensions of ℚ_p).
- **ClassFieldTheory (2, inferred; the other 14 are in the CFT packet):** L0 → CFT 9 (residue degree in `weilDegree_weilTransfer`); L2 → CFT 13 (norm surjectivity on unramified units in `principalIdele_mem_range_ideleNormMap_iff`).
- **ArithmeticGaloisRepresentations (2, explicit):** L4 → R01.2 (inertia, tame character, Frobenius lifts for Weil–Deligne); L3 → R01.3 (ramification filtration for Artin/Swan conductors).
- **RelativeFarguesFontaine (2, explicit):** L0 → RF0 (ℚ_p and its finite, possibly ramified, extensions as coefficient fields); L2 → RF2:untilts (E^ur and Frobenius behind Spd(Ĕ)/φ^ℤ).
- **SelmerIwasawaCohomology (2, explicit):** L4 → L2 (unramified local conditions) and L3 (control theorems with inertia terms).
- **One each:**
  - L4 → LanglandsParameterStacks LP0 (explicit);
  - L4 → LefschetzPencilsAndVanishingCycles LPV.1 (explicit);
  - L2 → VectorBundlesAndIsocrystals VB0 (explicit);
  - L1 → DirichletPadicLFunctions L3 (explicit);
  - L1 → IntegralIwasawaTheory L1 (explicit);
  - L0 → PadicMeasuresIwasawaAlgebras L0 (explicit);
  - L1 → KTheoryFiniteLocalFields L.3 (explicit);
  - L3 → SmallRamificationAndAbelianVarietyBaseCases R25.1 (explicit);
  - L3 → FunctionFieldArithmetic FA.3 (explicit);
  - L3 → FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6 (inferred);
  - L4 → EulerSystemsAndKolyvaginSystems ES.1 (inferred);
  - L2 → PhiGammaModulesAndIwasawaCohomology PG.6 (inferred);
  - L1 → GlobalNumberFields L7 (inferred).

By supplying layer: L0 9, L1 9, L2 14, L3 6, L4 7.

## Overlaps and restructuring proposals (no merge)

1. **LFR L0 ↔ QuadraticFormInvariants 6A (rescope).** 6A defines its own `IsUniformizer` and the Irreducible-equivalence. Move the predicate into LFR L0's normalized-valuation API.
2. **LFR L1 ↔ QFI 6A (rescope).** 6A freezes dyadic-level restatements of the sharp local square theorem and the square-class counts, because LFR's versions assume `[Algebra ℚ_[2] K]`. The odd-residue sharpness is not stated in LFR. State them in L1 at `natCastValuation K 2` under `Invertible (2 : K)`.
3. **LFR L4 ↔ ArithmeticGaloisRepresentations R01.2 (rescope).** R01.2 says to construct tame characters. It should import L4's tame character and ℓ-specialization, and build only the fundamental characters of levels one and two as composites with μ_{q^n−1} ≅ 𝔽_{q^n}ˣ.
4. **LFR L4 ↔ LefschetzPencilsAndVanishingCycles LPV.1 (rescope).** LPV.1 constructs I, P and t_ℓ over henselian traits with possibly infinite residue fields. Keep that, add a comparison with L4 at local fields, and use L4's declarations at finite residue fields.
5. **LFR L1 ↔ DirichletPadicLFunctions L3 ↔ ColemanIntegration L0 (rescope).** Three logarithms on principal units. L1 exports `localLogarithm` on all of `U(K,1)`. One stage (DirichletPadicLFunctions L3 is natural) defines the log_p(p) = 0 branch from it. ColemanIntegration L0 adds only rigid-analytic continuation on annuli.
6. **LFR L1 ↔ ProfiniteProPGroups L7 (keep).** PPG L7 defines U^(f) = 1 + 2^f ℤ₂ and 1 + 4ℤ₂ ≅ ℤ₂ via log, and must stay free of local fields. Add comparison lemmas in LFR L1.
7. **LFR L3 ↔ FunctionFieldArithmetic FA.3 (rescope).** FA.3 rebuilds lower and upper filtrations and the wild different. It should import upper numbering, Herbrand and Hasse–Arf at completions from L3, and the global filtration and Hurwitz from AlgebraicCurves L7–L8.
8. **LFR L3 ↔ HigherLocalFieldsAndHigherClassFieldTheory HL.4 (keep).** HL.4 must pick an indexing convention that restricts at n = 1 to LFR's `upperRamificationGroup`, with a named comparison.
9. **LFR L3 ↔ ClassFieldTheory L7 (rescope).**
   - LFR L3 item 5 concludes "c(L/K) = t + 1" with no carrier, while CFT L7 owns `conductorExponent`.
   - State LFR's result as a norm-group lemma (U(K,t+1) ⊆ N, U(K,t) ⊄ N) and derive the conductor in CFT L7.
   - Fix CFT's ownership table: conductor carriers belong to CFT (norm-group) and ArithmeticGaloisRepresentations R01.3 (Artin/Swan).
10. **LFR L2 ↔ ClassFieldTheory L8 (keep).** `normGroup L/K` (field norm) and `localNormSubgroup V` (formation norm) are the same subgroup. Add `localNormSubgroup V = normGroup (fixedField V)` in CFT L8.
11. **LFR L4 ↔ DiamondEtaleCohomology C8 (keep).** C8 proves the wild-inertia pro-p lemma and the tame embedding for general complete valued fields. Add C8's specialization to L4 at local fields; L4 does not import C8.

Overlaps already recorded elsewhere, not duplicated:

- AlgebraicCurves L7–L8 ↔ LFR L3 (AlgebraicCurves packet).
- NFA L4 ↔ LFR L3, the discriminant ideal (NFA packet).
- ProfiniteCohomology L9 ↔ LFR L4 ↔ CFT L5, the algebraic- against separable-closure Galois group (CFT packet).

## Gaps and source issues for the orchestrator

1. **Named consumers missing from the atlas.** LFR's README names `LocalGaloisGroups`, "Counting Totally Ramified Extensions #226" (`TotallyRamified`) and `ProfiniteArithmetic` as consumers or boundaries. None exists as an atlas roadmap, so those contracts, including the #226 adapter table, could not be linked.
2. **Ĕ is unowned.** The completion of K^ur with its Frobenius is used by RelativeFarguesFontaine RF2:untilts, VectorBundlesAndIsocrystals VB0 and BunGAndNewtonStrata BG0. LFR L2 constructs only K^ur ⊆ AlgebraicClosure K and Gal(K^ur/K) ≅ Ẑ. The links above carry that caveat.
3. **Infinite-level upper numbering is unowned.** SmoothRepresentationsOfLocalGroups SR.6 uses the wild filtration P_F^e of the Weil group. LFR L3 has upper numbering only for finite Galois extensions, and L4 has I_K and P_K but no G_K^u. No link was recorded.
4. **Inertia beyond finite residue fields.** EllipticCurves L4 (Néron–Ogg–Shafarevich over complete DVRs with perfect residue field) and FiniteFlatGroups R07.1/R07.3 (Raynaud's tame inertia characters; absolutely unramified bases with perfect residue field) need inertia and tame characters for complete discretely valued fields with perfect residue field. LPV.1 and DiamondEtaleCohomology C8 need them for henselian or general valued fields. LFR is scoped to `IsNonarchimedeanLocalField`, so no exact links were recorded. The AlgebraicCurves handoff independently proposes stating LFR L3 for complete DVFs with separable residue extension; the same question arises for L4.
5. **`tateH` and `unitsRep`.** LFR L2 and L3 name `ClassFieldTheory.tateH` and `ClassFieldTheory.unitsRep`. CFT Layer 0 forbids a new `tateH` definition, and the CFT packet flags the mismatch. LFR's consumer references should be updated.
6. **QuadraticFormInvariants inconsistency.** Its ordering section says 6B–6D depend on nothing outside the roadmap beyond Layers 0–3, but 6B and 6C list "[Local Fields Ramification, Layers 0 and 1]" as prerequisites. Links follow the stage prerequisites.
7. **ClassicalArithmeticCompletion CA.7** proves Noether's tame normal-integral-basis theorem without saying whether tameness is local (LFR L3 `IsTamelyRamified`) or ideal-theoretic (NFA), so no link was recorded.
8. **ColemanIntegration** names LFR as a dependency, but its only local-field object (the log_p(p) = 0 branch on annuli) is not an LFR output as stated. It is recorded as part of overlap 5, not as a link.
9. **FoundationsAndLibraryIntegration LI.4** integrates LFR wholesale. The three links pick the layers carrying the audited topics; a reviewer may prefer a single roadmap-level edge.

## Suggested next steps

- The reviewer should check especially the inferred links and the two thin explicit links (L2 → ColemanPowerSeries L0, L0 → RelativeFarguesFontaine RF0), whose uses are stated only at hypothesis or acceptance level.
- When the ClassFieldTheory packet becomes complete, reconcile the 14 omitted pairs listed above.
