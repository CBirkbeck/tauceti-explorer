# Review of AUDIT-22

**Job** REV-AUDIT-22 · **Date** 2026-09-17 · **Verdict `accepted`** · **38 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the four roadmaps of `research/blueprint/audit/AUDIT-22.json`:
- `ProfiniteProPGroups` (12 layers)
- `EnhancedDerivedSheaves` (11)
- `DGAInfinity` (12)
- `GrothendieckEulerForms` (8)

That is 43 layers and 281 targets, with 444 distinct citations (497 uses) and 16 duplicate claims.

**The audit's picture holds.**
- Tau Ceti has built most of profinite Layers 0–3, the algebra-level core of DG/A∞ Layers 0–3 and most of the Grothendieck-group roadmap. The roadmaps' 1 September STATUS files understate all three, as the audit says.
- Enhanced derived sheaves, cohomological dimension and Demushkin theory, and DG categories as a theory are absent from both libraries.
- Every present label was re-read at source. None is sorry-backed or wrongly named, and no absent target turned out to be fully present.

The audit needed repair in five places, all fixable in place:
1. One layer counted an input it only reuses as its present target, and one "process" layer states a comparison nobody owns. Two verdicts change.
2. Six labels were wrong: four absences are partial, one presence covers only a special case, and one Mathlib label is really both libraries.
3. One target text overstated what exists.
4. Twenty-two notes denied or understated library content.
5. Two duplicates were missing, and one duplicate note was wrong.

## Corrections

### Verdicts and targets (4)
- **`EnhancedDerivedSheaves:E0`: partly built → not built; T0 removed.** E0 says "Reuse Mathlib's `SSet.Quasicategory`, inner horn-filling, inner fibrations and categorical-nerve API; construct the additional …". The audit listed those reused inputs as E0's only present target, which made E0 partly built although nothing E0 owns exists. The inputs are now recorded in T1's note.
- **`EnhancedDerivedSheaves:E5:cotangent-export`: process → not built.** The stage mostly re-exports DD.0, but it also says "in positive characteristic, compare with E-infinity algebras only in proved ranges". DD.0 does not mention E∞-algebras, no other layer owns the comparison, and neither library has E∞-algebras. As with REV-AUDIT-19's WC.0, a layer that is only partly bookkeeping is not `process`.
- **`DGAInfinity` L1 T4: target text.** "cohomology as graded modules over the cohomology algebra" became "module cohomology as a module over the cohomology algebra". Tau Ceti's module cohomology is ungraded (`IsDGLeftModule.instModuleCohomology`; the grading is recorded only on cycles), and the layer does not ask for more.

### Labels (6)
- **EDS E2 T1, replete topoi: absent → partial.**
  - Mathlib proves that sequential limits of epimorphisms are epimorphic for coherent-topology sheaves, under a hypothesis on the site (`coherentTopology.epi_π_app_zero_of_epi`), and for light condensed modules (`LightCondensed.epi_π_app_zero_of_epi`).
  - Postnikov convergence, unbounded descent and the dimension criterion are absent.
- **EDS E1 T7: absent → partial.** Isomorphisms in D(A) are detected by cohomology (`DerivedCategory.isIso_iff`) and by quasi-isomorphisms, and change of coefficients exists underived. The audit labels such 1-categorical shadows partial elsewhere in this roadmap.
- **DGA L4 T0, bar–cobar: absent → partial.**
  - The bar half exists in pieces: the coaugmented tensor coalgebra with its filtration, the A∞ algebra on the augmentation ideal (`Augmentation.reducedAlgebra`), and its square-zero bar differential.
  - Cobar, twisting cochains and the adjunction are absent.
- **GEF L1 T2, choice independence: absent → partial.**
  - `PresentedK0.mapEquiv` compares presentations across independent smallness universes and across equivalences. It is characterized on classes and has `mapEquiv_refl`/`mapEquiv_trans`.
  - A named comparison and its naturality are missing.
- **GEF L5 T1, Euler–Poincaré: tauceti → partial.** Tau Ceti proves it for invariants additive on a whole abelian category. The layer asks for invariants on an exact subcategory, with closure conditions on cycles and boundaries.
- **PPG Layer 9 prerequisites T0, bilinear-form basics: mathlib → both.** Tau Ceti names the left and right radicals (`TauCeti.leftRadical`, `rightRadical`), which the note said no library does. Mathlib has `LinearMap.BilinForm.Equivalent`.

### Notes that denied or understated library content (22)
- **Profinite and pro-p groups.**
  - **L9-prerequisites T8.** The note said neither library supplies topological nilpotence of pℤ_p or the linear topology of ℤ_[p].
    - Nilpotence is immediate from the norm (`PadicInt.norm_lt_one_iff_dvd`, `tendsto_pow_atTop_nhds_zero_of_norm_lt_one`).
    - `IsLinearTopology ℤ_[p] ℤ_[p]` follows from `Ideal.isLinearTopology` with Tau Ceti's `isAdic_maximalIdeal`.
  - **L9-prerequisites T1.** `TauCeti.BilinForm.eq_zero_of_isSymm_of_isAlt` proves that a symmetric alternating form vanishes when 2 is left-regular. That is the odd-p case the note called unstated.
  - **L6 T2.** "No all-degree continuous cohomology tool" is wrong: Mathlib's `continuousCohomology n`, Tau Ceti's `finiteQuotientSystem` and the discrete Shapiro isomorphism `groupCohomology.coindIso` all work in every degree. What is missing is continuous Shapiro past degree 1, the long exact sequence past H², and dimension shifting.
  - **L4 T5.** Mathlib has ℤ_p-exponentiation of topologically unipotent elements in complete normed ℤ_p-algebras (`PadicInt.addChar_of_value_at_one`), though not on pro-p groups.
  - **L4 T4 and T6.**
    - T4: `PadicInt.lift` is a universal property for ring homomorphisms, with no topology.
    - T6: uniqueness of the rank and of the elementary divisors is also missing.
- **Enhanced derived sheaves.**
  - **E0 T1.** Mathlib has the homotopy 2-category of quasicategories (`SSet.QCat.bicategory`), in which equivalences can be expressed, but no API for them.
  - **E2 T0.** The Postnikov tower of a t-structure exists as a functor (`TStructure.eTruncGE`). Its limit, its convergence and the left completion are missing.
  - **E5.** The cotangent-export T0 note now records the unowned E∞ comparison. The presentability T2 note records that the layer defers that item to E5:spectra-comparison.
- **DG and A∞.**
  - **L2 T0 and L8 T1.** `AInfinityAlgebra` stores the operations and their suspended Taylor map side by side. The Taylor map is unique, but nothing builds an A∞ algebra from a square-zero coderivation alone. So "A∞ structure = coderivation" is a comparison of stored presentations, not a bijection.
  - **L5 T4.** Mathlib has the triangulated thick closure `ObjectProperty.triangEnvelope`, not only the additive Karoubi envelope.
  - **L6 T3.** Mathlib's underived bimodule bicategory `Bimod.monBicategory` exists, though it is not instantiated for complexes.
  - **L11 T0 and L4 T3.**
    - L11 T0: a second quadratic ideal, `preprojectiveIdeal`, exists.
    - L4 T3: Mathlib has ring filtrations, though not complete filtered A∞ algebras.
  - **L0 T9.** The A∞ signs go through Tau Ceti helpers over `Int.negOnePow`, not through Mathlib's `ComplexShape.TensorSigns`, which the layer names as the accepted endpoint. The mathematics is present, but the instruction is not followed.
- **Grothendieck groups and Euler forms.**
  - **L0 T7.** Exact equivalences are used unbundled: `ExactK0.mapEquiv` takes an equivalence with both functors conflation-exact.
  - **L3 T3.** Padding and isomorphism invariance of the Euler class hold for any extension-closed P, not only for projectives.
  - **L4 T3 and T6.**
    - T3: the multiplicity formula also assumes P finite-dimensional.
    - T6: Mathlib has object-level `projectiveDimension`; only global dimension is missing.

### Duplicates (3)
- **Added:**
  - PPG Layer 7 → `LocalFieldsRamification` Layer 1. That layer proves 𝒪[K]ˣ ≃ μ_{q−1} × U¹ and the deep-unit logarithm; at ℚ_p these are T5's splitting of ℤ_pˣ and 1 + pℤ_p ≅ pℤ_p.
  - PPG Layer 9 prerequisites → `IntegralIwasawaTheory:I.1`. I.1 identifies ℤ_p[[Γ]] with ℤ_p[[T]] after choosing a generator, with generator-change formulas and the finite-level kernels (T7).
- **Note corrected:** the E5:cotangent-export → DD.0 note said DD.0 constructs every mathematical object of the stage. It does not construct the E∞ comparison.

### Summaries (3)
The EDS, DGA and GEF summaries were updated to match the corrected entries.

## What was checked

**Mechanical.**
- All 43 batch layers are present, with no extras, and no duplicate names a retired roadmap.
- All 444 distinct citations resolve at their file and line; four priority instances were checked in source. Namespaces were confirmed by a comment-stripping resolver.
- No cited declaration is private or deprecated, and no cited file contains `sorry` or an axiom.
- After correction there are 470 distinct citations, rechecked the same way.

**Presence claims.** Every mathlib, tauceti, both and partial citation was opened with its `variable` lines and hypotheses, by me or by one of five search agents. Every agent finding used above was re-verified at source. I checked these directly:
- the instance chain and closed-quotient instances of profinite Layer 0;
- `exists_continuous_section` (normalized, for any closed subgroup);
- the trivial 𝔽_p coefficient object over `continuousCohomology`;
- `SheafOfModules` as a Grothendieck abelian category with enough injectives;
- `Contraction.normalize`;
- the projective-cover multiplicity formula;
- `PresentedK0.mapEquiv`.

**Absent claims.** All 154 were searched again by concept in `declarations.tsv` and both trees. I re-ran these standard-name searches myself: residual finiteness of free groups, symplectic bases, Koszul complexes, unbounded K-injective replacements, presentable adjoint functor theorems, Sylow images under surjections, the p-adic logarithm and the splitting of ℤ_pˣ, the linear topology of ℤ_[p], and repleteness. Confirmed absent in both libraries:
- **Profinite and pro-p groups:**
  - Ẑ; topological generator rank and convergent generating sets; Gaschütz; the Schreier bound.
  - Free profinite, pro-C and pro-p groups; ℤ_p-modules on abelian pro-p groups.
  - Continuous extensions and embedding problems; cohomological dimension.
  - The lower p-series and Hall–Petrescu; Golod–Shafarevich; Demushkin groups.
  - Symplectic normal form over arbitrary fields; completed group algebras.
- **Enhanced derived sheaves:**
  - dg nerves, stable ∞-categories, straightening, presentable ∞-categories.
  - Unbounded K-injective and K-flat replacements, derived tensor, n-hypercovers.
  - Left completion, derived completion and Koszul complexes.
  - ∞-operads and E∞-algebras, animated rings, spectra.
- **DG and A∞:**
  - DG categories as a theory, bimodules, general A∞ morphisms, A∞ categories and modules.
  - Homological transfer and Kadeishvili, cobar and Maurer–Cartan twisting, twisted complexes.
  - Derived Morita theory, DG quotients, Hochschild theory, Massey products.
  - Calabi–Yau structures, Serre functors, Koszul duality.
- **Grothendieck groups:**
  - Admissible morphisms, K₀ of product categories, resolving subcategories and the common-refinement theorem.
  - Graded and linear resolutions, the Cartan matrix and unimodularity.
  - Ext-Euler naturality and the quiver comparison, and the q = ±1 specialization.

**Duplicates.**
- The 15 unchanged entries were confirmed against the named layers. Suppliers such as DD.0 and DD.1 are kept where the listing layer re-exports their objects as targets, as in REV-AUDIT-08 and REV-AUDIT-09.
- Keyword sweeps of the atlas otherwise found consumers, not duplicates: ProfiniteCohomology Layers 5, 10 and 11; BelyiMaps; LocalFieldsRamification Layer 4; the zigzag roadmap; StablePeriodicCurved; DiamondEtaleCohomology.

After correction: 1 built, 18 partly built, 24 not built, 0 process. Targets: 5 mathlib, 5 both, 61 tauceti, 59 partial, 150 absent (280 in all). There are 18 duplicates.

## Reading

Tau Ceti serves GrothendieckEulerForms most: every layer is partly built, and what remains is mostly generality (exact subcategories, resolving subcategories, graded resolutions) and the Cartan matrix. ProfiniteProPGroups is built through its Sylow and Frattini layers. From free pro-p groups onward, only scattered inputs exist: continuous sections, low-degree continuous cohomology and bilinear-form basics. DGAInfinity has its algebra-level core, but no DG or A∞ categories as a theory.

The most important correction is to `EnhancedDerivedSheaves:E0`. The audit scored the enhancement layer, which six other layers consume, as partly built only because it counted Mathlib's quasicategories as a present target, and E0 merely reuses them. The same roadmap's `E5:cotangent-export` hid an unowned positive-characteristic E∞ comparison behind a `process` verdict.
