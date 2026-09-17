# Review of AUDIT-21

**Job** REV-AUDIT-21 · **Date** 2026-09-17 · **Verdict `accepted`** · **67 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the five roadmaps of `research/blueprint/audit/AUDIT-21.json`:
- `GeometricSatakeAndFusion`
- `HeckeStacksAndLocalShtukas`
- `LanglandsParameterStacks`
- `VStackSheavesAndLisseCategories`
- `tauceti:TauCetiRoadmap/CFSGStatement`

That is 42 layers and 181 targets, with 183 citations and 50 duplicate claims.

**The audit's picture holds.**
- `CFSGStatement` is substantially built in Tau Ceti. I0, S0 and S1 are built. Thirteen of the seventeen Lie-type constructors reach a candidate group on the carriers the L0 table designates. A0's universe lowering is proved for any indexed family.
- The four diamond roadmaps are unbuilt, apart from VS2's condensed foundation in Mathlib. Neither library has diamonds, v-stacks, loop groups, Schubert or perverse geometry, Satake, shtukas, Weil groups, parameter stacks or perfect complexes.
- No verdict changes.

The audit needed repair in four places, all fixable in place:
1. Its notes on the CFSG Lie-type lane missed what Tau Ceti has built on the Geck carrier and at root-datum and torus level.
2. Several diamond-roadmap notes denied general infrastructure: B_dR⁺, regular sequences and the homeomorphism criterion.
3. The duplicate lists mixed in suppliers and consumers.
4. There were a few citation slips.

## Corrections

### Labels (3)
- **CFSG L0, tripled D₄ carrier: `absent` → `partial`.** The note said "there is no group-level triality". That is false:
  - `GraphTwistedIndex.geckGraphAut` realizes triality on the Geck point group of every ³D₄ index, with γ³ = 1 (`OrdinarySteinberg.lean:133, 194`).
  - The generic numbered-symmetry automorphism of toral Kostant carriers exists (`kostantToralNumberedSymmetryIso`, `ToralClosure/NumberedSymmetry.lean:301`).
  - The designated tripled carrier is still missing, and the roadmap rules out the Geck carrier for ³D₄.
- **CFSG L1, Frob_q and γ∘Frob_q: `tauceti` → `partial`.** The note itself excluded ³D₄ at group level, and T1 and T3 were marked partial for that same gap.
- **CFSG L1, uniqueness of γ (pinned isomorphism theorem): `absent` → `partial`.**
  - What exists: `kostantToralGroupScheme_hom_ext` (`ToralClosure/Rigidity.lean:148`). A homomorphism out of any toral Kostant carrier is determined by the ± simple root subgroups and the weight torus. The file documents this as the uniqueness step of Layer 9's theorem on the explicit carriers.
  - Missing: the existence half and the pinned groups.

### Citations (5)
- CFSG L2: `rootLength_eq_characteristic_of_isLongSimpleRoot` (a root-length lemma) is replaced by `SuzukiReeIndex.exponent_of_isLongSimpleRoot` and `exponent_mul_exponent_lengthPerm`. The note had named a nonexistent `SuzukiReeIndex.rootLength`.
- GS0 and GS0:Witt-geometry: `Ring.Perfection` is a `@[deprecated]` alias, replaced by `Perfection`.
- GS4:integral-dual-group: the helper `TannakaDuality.FiniteGroup.equivApp` is replaced by the theorem `TannakaDuality.FiniteGroup.equiv`.
- HS1: `Condensed.freeForgetAdjunction` was fit `exact` for a continuous W_E^I action. It is now `related`.

### Notes that denied or overstated library content (17)
- **CFSG L1 T1 and T3.** The claims "3D4 has no group-level γ" and that its equations are "missing" were wrong. On the Geck carrier, γ³ = 1, commutation with Frobenius and the simple-root equations are all proved (`geckGraphAut_pow_twistOrder`, `geckGraphAut_comp_geckFrobenius`, `geckSteinberg_geckRootSubgroup`), though on an inadmissible carrier.
- **CFSG L2 T3.** "The G2 and F4 special isogenies are not in the library" was too strong. They exist on the pinned root datum (`DynkinType.g2SpecialIsogeny`, `f4SpecialIsogeny`) and on the split torus, where τ² is Frobenius (`g2SpecialTorusEnd`, `f4SpecialTorusEnd`). Only the group-level isogeny is missing.
- **CFSG L0 T4.** The long/short lemma for `carrierNode` is private. The public content is `rootGeneratorWeight_carrierNode_eq_root_simpleIndex`.
- **CFSG L0 T7.** `DynkinType.geckGroupScheme` is an explicit group scheme over ℤ for every valid Dynkin type, expected to be the adjoint form. It is now cited.
- **CFSG L5 T0.** "No identification for any family" hid existing identifications with classical groups: the type-A carrier with SL_{r+1} over algebraically closed fields, and the rank-two type-C carrier with Sp₄.
- **CFSG I0 T7.** The examples are proved by `norm_num`, not `decide`.
- **GS0:loop-geometry T2.** "No B_dR⁺ at all" was false. Mathlib has `BDeRhamPlus` and `BDeRham` with `WittVector.fontaineTheta` (`RingTheory/Perfectoid`). The relative B_D⁺ are absent.
- **GS0:Witt-geometry T2.** Mathlib also has fppf and fpqc sites, and fpqc descent of morphism properties. There is still no h- or v-descent for vector bundles.
- **GS4:integral-dual-group T6.** `geckChevalleyInvolution` is an involution of Geck's Lie algebra, not of a group carrier.
- **GS4:classical-Satake-comparison T1.**
  - Mathlib's Hecke-ring file is definitions only; the ring structure is Tau Ceti's.
  - Tau Ceti proves Shimura's Theorem 3.20 for GL₂: the p-local Hecke ring is ℤ[X₁, X₂] (`HeckeRing.GLn.polynomialRingEquivTwo`).
- **LP1 T2.** "lci cannot even be stated" is wrong: Mathlib has `RingTheory.Sequence.IsRegular`.
- **LP2:excursion-presentation T2.** Mathlib has no named universal-homeomorphism property, but `MorphismProperty.universally` states one, and the Stacks 0BR8 criterion `PrimeSpectrum.isHomeomorph_comap` is there.
- **Aggregates (4).** GS0, GS2, GS3 and LP2 said "every target … is absent" while their substages list partial targets.

### Summaries (3)
The CFSG, GS and LP summaries were updated to match the entries above. The LP summary now separates the missing dual group scheme from the existing dual root datum (`RootPairing.flip`).

### Duplicates (39)
The rule applied is REV-AUDIT-20's reading of the prompt. A layer that consumes, imports or supplies a target does not duplicate it. Owners of inputs that the audit itself made targets are kept.

- **Removed 30.**
  - Consumers:
    - GS0:Schubert-smoothness → BG2:smooth-Artin; GS4:integral-dual-group → ES6:functoriality
    - HS1 → ES0; HS2 → ES7:equal-characteristic; HS4 → ES1:finite-ramification and ES6:functoriality
    - LP0 → ES1:finite-ramification; LP2:excursion-presentation → ES0; LP2:semisimple-characters → ES5; LP2:integral-invariants → ES1:spectral-center; LP3 → ES3; LP4 → ES2
    - VS0 → BG2:smooth-Artin; VS2 → HR.2; VS5 → ES6:duality
  - Suppliers:
    - CFSG L0 → RootSystems Layer 6; CFSG L5 → ReductiveGroups Layer 9
    - GS1 → ET.2; GS4:rational-reductivity → EDC.7
    - HS3 → VS5; LP1 → DD.0
    - VS0 → DiamondSixOperations:S2; VS3 → AdicCoefficientsAndComparisons:L0; VS4 → SR.0
  - Claimed overlap not in the named layer:
    - GS1 → EDC.4: weak Lefschetz, not perversity.
    - GS4:classical-Satake-comparison → GS.5.
    - LP2:excursion-presentation → GS.5: REV-AUDIT-20 removed the reverse link.
    - VS3 → C7.
    - VS4 → C9: a different characterization of compact objects.
    - VS5 → SR.5: Bernstein–Zelevinsky derivatives, not the duality.
- **Added 6.**
  - GS0:loop-geometry → RelativeFarguesFontaine:RF2:integral-divisors: v-descent for bundles on the divisor and B_D⁺.
  - GS4:integral-dual-group → GlobalShtukasAndFunctionFieldLanglands:GS.1: the equal-characteristic Satake identification with the dual group.
  - GS4:integral-dual-group → MotivesAndAlgebraicCycles:MC.6: abstract Tannakian reconstruction.
  - LP0 → AnabelianGeometryAndNonabelianChabauty:NC.3: nonabelian H¹.
  - LP2:semisimple-characters → GS.5: parameters from excursion characters.
  - LP3 → PotentialAutomorphyInfrastructure:PA.1: integral Weyl and dual-Weyl modules.
- **Three notes corrected.**
  - CFSG L0 → Layer 9: Layer 9 restates L0's missing tripled-D₄ and short-root carriers as its own targets.
  - HS1 → GS.4: the overlap is the product-group action.
  - HS2 → ET.6a: the Lubin–Tate and Drinfeld towers are built twice.

After correction: 3 built, 6 partly built, 33 not built, 0 process. Targets: 1 mathlib, 28 tauceti, 41 partial, 111 absent. There are 26 duplicates and 199 citations (177 distinct).

## What was checked

**Mechanical.**
- All 42 batch layers are present.
- Every citation resolves in `declarations.tsv` at its stated file and line, both before and after correction.
- No cited declaration is private.
- The only deprecated citation was `Ring.Perfection`.
- None of the 101 cited files contains `sorry` or `axiom` outside comments.

**Presence claims (30 present, 38 partial).**
- CFSG was read at source declaration by declaration: `Index.lean`, `Closure.lean`, the diagram permutations, TypeA/B/C/D/E6/E7, Unimodular, Geck, the Suzuki branch, HalfFrobenius, SpecialIsogeny, the Datum files, `FixedSubgroup`, `FixedPointCandidate`, the Relator and GroupPresentation files, the sporadic dispatcher, and the Monster and Baby Monster rows (Y₄₄₃ with 80 relators; Y₄₃₃ with 69).
- VS2's condensed citations and IsSolid's TODOs say what the audit claims.

**Absent claims.** All were searched again by concept, name and synonym, with about 70 sweeps; every hit was opened before use. Confirmed absent in both libraries:
- **Geometry:** perfectoid spaces, diamonds, v-sheaves, Artin v-stacks, the Fargues–Fontaine curve, Beauville–Laszlo gluing, loop and arc groups, affine and BD Grassmannians, Schubert cells, Demazure resolutions, ample, nef and semiample bundles, h/v-descent.
- **Sheaf theory:** perverse sheaves and IC complexes, the decomposition theorem, ULA, hyperbolic localization, six operations and f^!, semiorthogonal decompositions, solid tensor and Hom, D_lis.
- **Representation theory and Langlands:** smooth representations and compact induction, Bernstein–Zelevinsky and Verdier duality, Satake, shtukas, B(G), Rapoport–Zink spaces, Weil and Weil–Deligne groups, L-groups and dual group schemes, nonabelian cocycles (Mathlib's multiplicative cocycles need `CommGroup`), quotient stacks, GIT, perfect complexes, animated rings, good filtrations and Weyl modules for group schemes, Drinfeld's lemma.
- **CFSG:** the uniform `ValidLieTypeIndex.Group`, `CFSGIndex.Group` and `ClassificationStatement` exist only in docstrings.

**Duplicates.**
- All 50 ids exist and none belongs to a retired roadmap.
- Every named layer's description was read against the listing layer's targets.
- Keyword sweeps of the atlas found the six additions.

## Most important finding

The audit said Tau Ceti has no group-level triality and no ³D₄ group-level γ. In fact, `CFSG/OrdinarySteinberg.lean` constructs the graph automorphism and γ∘Frob_q for all thirteen ordinary constructors on the Geck carrier, including triality with γ³ = 1. Two further pieces exist that the audit also missed:
- the generic numbered-symmetry automorphism of toral Kostant carriers, which is the mechanism the missing tripled D₄ carrier needs;
- the rigidity theorem behind the pinned isomorphism theorem.

The ³D₄ branch still lacks its admissible carrier. But the remaining work is the tripled carrier's data, not triality itself. And L1's Steinberg-map target was only partial, not built.
