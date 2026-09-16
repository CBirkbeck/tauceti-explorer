# LINK-tauceti_TauCetiRoadmap_ProfiniteProPGroups: handoff

**Status:** `complete`. The whole catalogue has been screened. `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_ProfiniteProPGroups.json` reports 0 errors and 0 warnings.

**Output:** `research/blueprint/links/tauceti_TauCetiRoadmap_ProfiniteProPGroups.json`. It contains:

- **32 links**: 18 into ProfiniteProPGroups (PPG) and 14 out of it; 24 explicit and 8 inferred.
- **7 overlaps**, all `rescope`.
- **217 examined entries**: the 211 other atlas roadmaps and the 6 roadmaps in `research/blueprint/roadmaps/`.

There was no earlier checkpoint. Only the links file and this note were written in the repository, and no git command was run.

## Inputs

- **Atlas:** `data/atlas.json`, edition `2026-09-15-comprehensive-roadmap-revision`, sha256 prefix `62ab6c2ccb94ee9c`. No `stageEdges` touch a PPG stage, and the atlas records no internal PPG edges.
- **Focal document:** `content/tau-ceti/ProfiniteProPGroups/README.md`, sha256 prefix `8917e380c8f99602`, read in full. The 12 stage descriptions are verbatim slices of it.
- **Other link packets:**
  - LocalFieldsRamification already records three PPG links: Layer 3 → its Layer 1, Layer 2 → its Layer 4, and Layer 4 → its Layer 4. It also records the `keep` overlap of its Layer 1 with PPG Layer 7. These were confirmed against its contract audit and are not duplicated.
  - No other packet records a PPG link. The packets for AdicSpaces, AlgebraicCurves, ClassFieldTheory, EllipticCurves, ModularCurves, NumberFieldArithmetic, the representation-theory family, StablePeriodicCurved, StandardDistributions and ZigzagPreprojective all examined PPG and found `none`, which agrees with this screen.

## Method

1. **Own stages.** The inputs and outputs of each layer were written in precise terms before any search.
2. **Keyword screen.** Every roadmap document and stage text was dumped to text and screened in context. The keywords covered: profinite and pro-p groups, Sylow, supernatural order, Frattini and generator rank, free and presented objects, embedding problems, cd, Demushkin and Labute, lower p-series, completed group algebras and ℤ_p[[T]], Weierstrass, ẑ, maximal pro-p quotients, Nielsen–Schreier, residual finiteness, tame and wild inertia, symplectic and alternating forms, Hom_cont, pro-order, p-extensions and class field towers.
3. **Summaries.** All 218 summaries were read.
4. **Read in full or stage by stage:**
   - ProfiniteCohomology: the whole document and all 14 stages.
   - BelyiMaps: scope, boundaries, supplier table, Layers 12 and 13.
   - LocalFieldsRamification: contract audit, Layers 1 and 4.
   - ClassFieldTheory and QuadraticFormInvariants: ownership sections, 7A and the contract tables.
   - The Iwasawa family, all in full: PadicMeasuresIwasawaAlgebras, IntegralIwasawaTheory, ColemanPowerSeries and InverseGaloisAndArithmeticFundamentalGroups. NoncommutativeAndEquivariantIwasawa: NE.0–NE.2.
   - DiamondEtaleCohomology C8; ClassicalAdicEtaleCohomology H1; DiamondSixOperations S5; SmoothRepresentationsOfLocalGroups SR.1; ReductiveGroupsPartII RG2.3; VStackSheavesAndLisseCategories VS4–VS5; HeckeStacksAndLocalShtukas HS3; CompletedCohomologyPartII CC.0.
   - GrothendieckEulerForms Layer 5; ArithmeticGaloisDuality R02.1–R02.4; LefschetzPencilsAndVanishingCycles LPV.1 and LPV.5; LocallyAnalyticDistributions; DirichletPadicLFunctions.
5. **Baseline checks.** Baseline declarations were searched to exclude false suppliers:
   - The Tau Ceti baseline has the discrete-group factor-set/H² dictionary (`TauCeti.FactorSet.cohomologyClass`). ProfiniteCohomology's C₄ Evens example can use it, so PPG Layer 5 → ProfiniteCohomology Layer 13 is **not** recorded.
   - `HomologicalComplex.eulerChar_forgetFG_eq_homologyEulerChar` from GrothendieckEulerForms Layer 5 is already landed.
   - No symplectic-basis theorem exists in the baseline.
6. **Quotes.** Every quote was machine-checked against the normalized stage text or roadmap document.
7. **Confidence.** A link is **explicit** when either text names the supplier or consumer roadmap for that use. It is **inferred** when the stage-level use is unnamed and the match is exact.

## Links

### Into PPG (18)

| Supplier | PPG consumer | Content |
|---|---|---|
| ProfiniteCohomology L0 | L6 (inferred) | A finite discrete module's action factors through a finite quotient; used by the trivial-filtration theorem |
| ProfiniteCohomology L1 | L5 | `TopRep` and the `continuousCohomology` carrier for `trivialFp` and `cohomFp` |
| ProfiniteCohomology L1 | L7 | `coeffMap`: the reduction maps of the prescription property |
| ProfiniteCohomology L2 | L5 | Explicit 2-cocycles for the cocycle ↔ extension construction; H¹ as Hom_cont |
| ProfiniteCohomology L3 | L5 | Degree-one comparison for the H¹ interpretation |
| ProfiniteCohomology L5 | L5 | Five-term sequence and transgression for the H² (relation-rank) interpretation |
| ProfiniteCohomology L5 | L6 | Long exact sequence for dévissage and the two-term Euler formula |
| ProfiniteCohomology L5 | L7 | Transgression and five-term exactness (PPG labels them "PC-6"), connecting maps, long exact sequence |
| ProfiniteCohomology L7 | L6 | `Coind`, closed-subgroup Shapiro, Ind ≅ Coind for open U |
| ProfiniteCohomology L7 | L7 | Shapiro in degrees 0–2 for the three-term Euler formula |
| ProfiniteCohomology L8 | L7 (inferred) | Evaluation-cup duality pairings with Hom(M, N) coefficients; the C₂ cup square behind "ℤ/2 is Demushkin" |
| ProfiniteCohomology L10 | L6 | `corestriction`, `corestriction_comp_res`, `shapiroIso`, dimension shifting, all-degree long exact sequence |
| ProfiniteCohomology L11 | L6 | `cd_p` and its reductions, `cd_p_le_of_isClosed`, `cd_p_eq_of_index_not_dvd` |
| ProfiniteCohomology L11 | L7 | `cd_p` in `cd_p_eq_two_of_isDemushkin`, the recognition criteria and the open-subgroup theorem |
| ProfiniteCohomology L11 | L10 (inferred) | `cd_p_le_of_isClosed` for full pro-p Nielsen–Schreier on closed subgroups |
| ProfiniteCohomology L12 | L5 | `TopPairing`, `ofDiscreteModulePairing`, `cup`, `cup_gradedComm` for `cupFp` |
| ProfiniteCohomology L12 | L7 | `cup_projection`, the duality naturality ⟨res a, b⟩ = ⟨a, cor b⟩ |
| GrothendieckEulerForms L5 | L6 (inferred) | Finite-exact-sequence and Euler–Poincaré formulas; the finrank additivity of the Euler formula |

### Out of PPG (14)

| PPG supplier | Consumer | Content |
|---|---|---|
| L0 | BelyiMaps L12 | Unbundled completion universal property, used for `x ^ᶻ a` (12.1, 12.2, 12.6) |
| L3 | BelyiMaps L12 | Maximal pro-p quotient universal property (12.3) |
| L4 | BelyiMaps L12 | `zHat`; `maximalProPQuotient_zHat_equiv_padicInt`; `profiniteCompletion (FreeGroup (Fin 2))` |
| L3 | BelyiMaps L13 | `proPKernel` topologically characteristic |
| L4 | BelyiMaps L13 | `Δ_ℓ := freeProP ℓ (Fin 2)` |
| L9 prerequisites | IntegralIwasawaTheory I.1 | "The completed-group-algebra portion of ProfiniteProPGroups"; generator change |
| L4 | ColemanPowerSeries L0 | ℤ_p-module structure on the abelian pro-p inverse limit of principal units |
| L0 | PadicMeasuresIwasawaAlgebras L1 | Profinite-group and inverse-limit APIs for R[[G]] |
| L2 | DiamondEtaleCohomology C8 | "Sylow/pro-p structure from ProfiniteProPGroups" |
| L3 | DiamondEtaleCohomology C8 | Pro-p structure; the wild-inertia lemma 21.17 |
| L2 | ClassicalAdicEtaleCohomology H1:valuation-nearby-cycles (inferred) | Pro-p Sylow/tame comparison over valuation rings |
| L1 | DiamondSixOperations S5 (inferred) | Pro-order prime to ℓ; normalized Λ-valued Haar measure |
| L1 | SmoothRepresentationsOfLocalGroups SR.1 (inferred) | Compact opens of invertible pro-order; locally pro-p groups with p invertible |
| L3 | ReductiveGroupsPartII RG2.3 (inferred) | Pro-p congruence subgroups, proved as limits of finite p-groups |

## Overlaps (all rescope)

1. **ProfiniteCohomology L0 and PPG L5.** PPG's milestone "continuous sections along a finite kernel" is the normalized special case (H = N finite) of ProfiniteCohomology's continuous-section theorem (Ribes–Zalesskii 2.2.2). Proposal: PPG Layer 5 cites Layer 0; the elementary proof, if wanted, moves there.
2. **ProfiniteCohomology L11 and PPG L6.** Layer 11 uses, without stating it, the colimit of closed-subgroup cohomology over the open subgroups containing it (NSW 1.5.1), in `cd_p_le_of_isClosed`. PPG Layer 6 proves the same colimit inside its Sylow equality. Proposal: a named all-degree theorem in ProfiniteCohomology Layer 10, cited by both.
3. **ProfiniteCohomology L13 and PPG L5.** `trivialF2`/`f2Pairing` (TopRep ℤ) duplicate `trivialFp`/`fpPairing` (TopRep (ZMod p)) at p = 2, and no restriction-of-scalars comparison exists. Proposal: one trivial 𝔽_p object and pairing for all p, with that comparison, in ProfiniteCohomology Layer 12.
4. **PPG L4 and BelyiMaps L12.** Layer 4 exponentiates by ℤ_p only on abelian pro-p groups, while BelyiMaps 12.3 builds the ℤ_ℓ-power on all pro-ℓ groups. PPG Layers 8–9 need x₁^{2+α} (α ∈ 4ℤ₂) in the nonabelian free pro-2 group and name no supplier for it. Proposal: define x^λ on any pro-p group in PPG Layer 4, from freeProP p (Fin 1) ≅ ℤ_p. BelyiMaps and ProfiniteArithmetic keep only the ẑ comparison.
5. **PPG L9 prerequisites, PadicMeasuresIwasawaAlgebras L1 and L5, and NoncommutativeAndEquivariantIwasawa NE.0.** The completed group algebra is built three times as an inverse limit; the Λ-action and the compact-module exactness are built twice. Proposal: PPG keeps the ℤ_p carrier. PMIA L1 proves R[[G]] ≅ R ⊗̂ completedGroupAlgebra and makes `labuteSMul` an instance of its continuous-action universal property. NE.0 drops its separate construction.
6. **PPG L9 prerequisites and PadicMeasuresIwasawaAlgebras L2–L4.** Both develop the ℤ_p[[T]] coordinate and change of generator, the non-procyclic ℤ₂ˣ ≅ C₂ × ℤ₂ branch, evaluation, and the (T − c) division criterion inside Weierstrass division. Proposal: PMIA proves these identifications as comparison lemmas specializing to PPG's named declarations. PPG keeps its elementary proofs so it stays independent of a campaign roadmap.
7. **PPG L5 and InverseGaloisAndArithmeticFundamentalGroups IG.4.** Both define finite embedding problems and weak solutions, and both reduce kernels to abelian ones. Proposal: IG.4 imports `FiniteEmbeddingProblem`/`IsSolution` and adds only proper solutions and arithmetic constraints.

**Merge candidates:** none. **Rescope:** the seven above; the heaviest is the completed-group-algebra duplication with PadicMeasuresIwasawaAlgebras.

## Boundary gaps found (not links; for the orchestrator)

- **Unowned p-primary refinement.** ProfiniteCohomology Layer 10 assigns "the p-primary refinement for pro-p groups" of its torsion statement to PPG, but no PPG milestone states it.
- **`degreeCast`.** PPG Layer 5 (and QuadraticFormInvariants 7A) import `degreeCast` from PC-12, but it is not in ProfiniteCohomology's export table.
- **Label mismatches.** PPG cites transgression and five-term exactness as "PC-6" (they are ProfiniteCohomology Layer 5) and `shapiroIso` as "PC-7" (Layer 10). The links follow the supplier's layers.
- **𝔽₂ against 𝔽_p.** ProfiniteCohomology Layer 5 says PPG consumes the 𝔽₂ instance of the five-term sequence; PPG uses 𝔽_p for every p.
- **Named non-roadmaps.** `LocalGaloisGroups` and `ProfiniteArithmetic` are named by PPG, LocalFieldsRamification, ClassFieldTheory and BelyiMaps, but neither is an atlas roadmap, so no link can target them.

## Uses judged vocabulary, not recorded

- **Inherited pro-p hypotheses.** VStackSheavesAndLisseCategories VS4–VS5, HeckeStacksAndLocalShtukas HS3 and CompletedCohomologyPartII CC.0 inherit their pro-p levels from SmoothRepresentationsOfLocalGroups SR.1, where the averaging use is linked.
- **ArithmeticGaloisDuality R02.3.** Its cd bounds cite ProfiniteCohomology, not the PPG Sylow equality.
- **ℤ_pˣ decomposition.** LocallyAnalyticDistributions L3 and DirichletPadicLFunctions L3 use it from LocalFieldsRamification Layer 1. PMIA L3's ℤ₂ˣ = {±1} × (1 + 4ℤ₂) is folded into overlap 6.
- **Iwasawa-module structure.** IntegralIwasawaTheory's Λ-module algebra of L1–L3 comes from PMIA.
