# Review of AUDIT-23

**Job** REV-AUDIT-23 · **Date** 2026-09-17 · **Verdict `accepted`** · **97 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the five roadmaps of `research/blueprint/audit/AUDIT-23.json`:
- `tauceti:TauCetiRoadmap/ProfiniteCohomology` (PC, 14 layers)
- `tauceti:TauCetiRoadmap/StablePeriodicCurved` (SPC, 9 layers)
- `AutomorphicCongruences` (AC, 10 layers)
- `AutomorphicPadicLFunctions` (APL, 8 layers)
- `ColemanIntegration` (CI, 4 layers)

That is 45 layers and 303 targets, with 522 distinct citations (616 uses) and 33 duplicate claims.

**The audit's picture holds.**
- Tau Ceti has built most of ProfiniteCohomology's explicit low-degree theory:
  - discrete modules, continuous sections and the smooth-discrete dictionary;
  - the complex with its functoriality;
  - the long exact sequence through H², corestriction and Shapiro;
  - the six cup shapes;
  - the Kummer sequence.
- SPC has its foundations (ideal quotients, exact structures, Frobenius algebras, complexes of any shape) but none of its stable, periodic or curved content.
- AC, APL and CI are absent from both libraries apart from general infrastructure.

**Most important finding: neither "built" verdict survives.**
- **PC Layer 0.** Neither library equips a G-stable subgroup of a discrete G-module, or the quotient by one, with its induced action.
- **PC Layer 2.** Its two worked examples are absent. The layer's API paragraph names H¹(ℤ_p, ℤ/pᵏ) ≅ ℤ/pᵏ and H¹(ℤ_p, ℤ) = 0, and README §6 assigns both to Layer 2 as acceptance criteria.

Both layers are now "partly built".

The rest of the audit needed repair in four places, all fixable in place:
1. Thirteen target labels were wrong.
2. Sixty-six notes denied or misdescribed library content. Most were sentences of the form "nothing exists" or "grep finds nothing" that fail against general infrastructure outside the roadmap's home directories.
3. Five summaries needed updating.
4. Ten duplicate entries needed changing.

## Corrections

### Verdicts (2) and an added target (1)
- **PC L0: built → partly built.** Target "finite products, subgroups and quotients are discrete G-modules" goes from `both` to `partial`.
  - Present: finite products are Mathlib instances (`Pi.discreteTopology` with `[Finite ι]`, `Pi`/`Prod.continuousSMul`).
  - Present: the topological half for subobjects and quotients (subspace discreteness, `QuotientAddGroup.discreteTopology`, Tau Ceti `Submodule.Quotient.discreteTopology`, `SMulMemClass.continuousSMul`).
  - Missing: neither library packages a G-stable additive subgroup or its quotient with the induced `DistribMulAction` and continuous action. `DiscreteRep` and `DiscreteContAction` have no subobjects or cokernels.
- **PC L2: built → partly built.** Added the target "worked examples H¹(ℤ_p, ℤ/pᵏ) ≅ ℤ/pᵏ and H¹(ℤ_p, ℤ) = 0" as `partial`.
  - Present: only the reduction `H1EquivOfSmulEqSelf`.
  - Missing: no file combines ℤ_p with continuous cohomology, and the roadmap's STATUS file lists "the ℤ_p examples" as Layer 2's remainder.
  - I added only this pair of §6 examples, because it alone decides a verdict. The other §6 examples are not listed by the audit either (Ẑ, C₂/G_ℝ, Kummer over ℚ, C₄, the cohomological Brauer group of a finite field). None exists in either library in the stated cohomological form, and none would change a verdict.

### Labels (13)
- **absent → partial (7)**
  - **PC L9, field-extension bridge.** Mathlib has the pieces in intermediate-field form:
    - `IntermediateField.fixingSubgroup_isOpen`;
    - `finrank_eq_fixingSubgroup_index` ([L:K] equals the index);
    - `fixingSubgroupEquiv`, a MulEquiv only.
    The embedding-indexed interface, the topological isomorphism and the 𝔽₂ adapters are absent.
  - **PC L10, all-degree finite-quotient colimit.** `TauCeti.finiteQuotientSystem` is the system U ↦ Hⁿ(G ⧸ U, A^U) in every degree, and `finiteQuotientSystemFunctor` makes it natural in the coefficients. The note had called it a system of coefficient objects and said no cohomology-level system exists. The canonical TopModuleCat cocone and its universality are missing.
  - **APL L0, Hecke characters.** Finite-order Hecke characters of ℚ are Dirichlet characters. Mathlib has them with `conductor`, parity, `MulChar.ringHomComp` and Euler factors. This follows the audit's own F = ℚ convention (L1 T0, L3 T0, L3 T1).
  - **APL L4, coherent cohomology.** Tau Ceti's `Scheme.Modules.Cohomology` gives Hⁱ of 𝒪_X-modules with the long exact sequence and Mayer–Vietoris. It is more general than the target but has no Shimura variety to be applied to, the same ground on which the audit labels L0 T3 partial.
  - **SPC L0 T15 and L2 T0, module Frobenius theorem.** Tau Ceti's `Module.Baer.of_isIdempotentElem` shows that principal projectives over a self-injective ring are injective. That is one direction for the building blocks of finitely generated projectives.
  - **SPC L8, comparison functors.** Functor 2 exists in weaker form. `HomologicalComplexUpToQuasiIso.Qh` is, for every complex shape, the localization of the homotopy category at quasi-isomorphisms, with instances for ZMod n shapes. It is not a Verdier quotient or a triangle functor.
- **partial → absent (2)**
  - **AC L0, automorphic classes satisfying local conditions.** The two citations labelled "special case" are Selmer groups defined by valuations or local points, not special cases of the target.
  - **CI L0, the p-adic logarithm.** All three citations are related only. Tau Ceti's `logOneAdd` converges only under `[ContinuousSMul ℚ≥0 𝕂]`, which no p-adic field satisfies.
- **PC L0 T4: both → partial.** See the verdicts above.
- **PC L1 T8, the M^U API: tauceti → partial.** The comparison of M^U with `Rep.quotientToInvariants` through the dictionary is not stated. The cited isIso lemma is (X^S)^{G/S} ≅ X^G.
- **PC L3 T3: both → tauceti.** Every citation, and the subquotient-discreteness lemmas they use, are Tau Ceti's. Mathlib has no `DiscreteTopology C(X, Y)` instance.
- **PC L4 T1, naturality of the system in M: partial → tauceti.**
  - The cited `finiteQuotientSystemFunctor` is not on TopRep, as the note said, but `Rep k G ⥤ ((OpenNormalSubgroup G)ᵒᵖ ⥤ ModuleCat k)`.
  - README §2 (the export table) and §3 name exactly this `transitionPair`/`finiteLevelTransition` system as "the finite-quotient system".

### Notes that denied or misdescribed library content (66)
Every new citation was opened at its file and line, its namespace checked, and its file checked for `sorry`.

**PC (23)**
- **Layer 0**
  - `openActionKernel` needs no compactness or total disconnectedness.
- **Layer 1**
  - Closure of smooth discrete objects can be stated: TopRep k G ≌ Action (TopModuleCat k) G, and the Action category has all limits and colimits.
- **Layer 2**
  - res/infl coefficient naturality comes from the general `explicitMap*_comp`.
- **Layer 3**
  - The quotient presentation of the canonical side exists (`ShortComplex.homologyIsoCoker`).
  - Inflation transport in degree 0 reduces to `explicitH0Iso_map`.
- **Layer 4**
  - Mathlib's `Module.fgSystem.equiv` and Tau Ceti's `exists_orbitMap_quotient` exist.
- **Layer 6**
  - "grep for cor with trans" matches names; the right claim is "no transitivity lemma".
  - Tau Ceti's representation-level Mackey decomposition (`Rep.mackeyDecomposition`, `mackeyQuotientEquiv`) is not cohomological.
- **Layer 7**
  - The canonical embedding M ↪ C(G, M) exists (`TopRep.coind₁ι`).
  - Mathlib has the discrete dimension-shifting criterion `groupCohomology.isIso_δ_of_isZero`.
  - Degree-1 acyclicity needs an unstated H¹(⊥, A) = 0.
- **Layer 9**
  - Cofinality exists in substance (`krullTopology_mem_nhds_one_iff_of_isGalois`).
  - Hilbert 90's prescribed reduction step exists (`subsingleton_H1_of_forall_openNormalSubgroup`).
  - Square-class restriction maps exist (`RingHom.multiplicativeSquareClassMap`).
  - A note named a private declaration (`kummerMapAdd`).
- **Layer 10**
  - The trace morphism exists for discrete groups (counit of `Rep.coindResAdjunction`).
  - Layer 6 is not the only transfer: Tau Ceti has Tate corestrictions in degrees 0, −1 and ≤ −2.
  - Mathlib has discrete acyclicity tools.
- **Layer 11**
  - `IsPGroup p (Multiplicative M)` is the torsion predicate.
  - The relevant Ẑ inputs are the finite cyclic computations, not finite Hilbert 90.
- **Layer 12**
  - Mathlib's Yoneda product is the only all-degree product.
  - `cup_coeffMap` exists in no shape.
  - Graded cohomology of DG algebras exists.
- **Layer 13**
  - Degree-1 conjugation exists.
  - Module-level symmetric tensor actions exist (`PiTensorProduct.reindexRepresentation`).
  - The WreathProduct question is resolved: symmetric and permutation groups only, with no RegularWreathProduct comparison.

**SPC (15)**
- **Layer 0**
  - Generic natural-transformation descent exists (`Quotient.natTransLift`, `lift_unique'`).
  - Mathlib's first isomorphism theorem for quotient categories (anonymous instances, `Quotient.lean:355-370`) is the route to T5.
- **Layer 1**
  - Tau Ceti's exact-functor API (`ExactStructure.IsConflationExact`).
- **Layer 2**
  - `tateComplex` is not a complete resolution.
  - `TauCeti.IsExtBoundedOn` expresses a uniform Ext bound.
- **Layer 3**
  - The zero object of `HomotopyCategory V c` exists for every shape.
  - Localization of the homotopy category at quasi-isomorphisms is proved for every shape.
- **Layer 4**
  - The prescribed composition is `ShiftedHom.comp`, not the cited cochain shift isomorphism.
  - Exactness of the ε-complex is derivable publicly (`ProjectiveResolution.exact_succ`).
- **Layer 5**
  - `IsDGRightModule` is the uncurved case.
- **Layer 6**
  - `colimitsClosure`/`limitsClosure` exist, contrary to "no coproduct- or product-closed closures".
  - The generic comparison exists as `trW_monotone` + `LocalizerMorphism.localizedFunctor` + `isTriangulated_of_precomp_iso`.
- **Layer 7**
  - "potential" does match; the Sylvester/adjugate factorization identities exist.
  - Rees's theorem and the hypersurface dimension formula exist (depth itself is a Mathlib TODO; `Regular/Depth.lean` is an empty deprecated module).

**AC (10)**
- **L0**
  - Tau Ceti's H² classification of group extensions.
  - "Fitting" names are only Lie-module, decomposition and Fitting-lemma results; ℤ_p⟦X⟧ is a UFD.
- **L1**
  - The q-expansion principle and Tau Ceti's eigenform and newform coefficient lemmas are further coefficient-detection results beyond the Sturm bound.
- **L2**
  - Corestriction exists in degrees 0-2 with δ-compatibility and projection formulas.
- **L3**
  - Regular sequences, the Rees theorem, formal smoothness and `H1Cotangent` exist.
- **L4**
  - Krull's valuation-ring intersection theorem and the height-one UFD criterion.
  - `Rep.Tor` exists besides the monoidal Tor.
- **L5**
  - Néron–Tate height, pairing and regulator.
- **L5a**
  - The Amice transform.
- **L5b**
  - `quadraticTwistPointEquiv`.

**APL (7)**
- **L0**
  - Generic `ProfiniteGrp.limit`, G_K^ab and the ℚ cyclotomic reciprocity.
  - The Néron–Tate regulator is a second regulator, and the finite-level image of global units exists.
  - Mahler interpolation contradicts "no p-adic interpolation of any kind".
- **L2**
  - `AnalyticAt` works over ℚ_p; only the function and distribution spaces are missing.
- **L3**
  - Mathlib's normalized derivative.
- **L4**
  - ℤ_p⟦X⟧ is a ring; what is missing is ℤ_p[[G]] and convolution.
- **L5**
  - Mixed Hodge structures, polarizations and Tate structures.

**CI (11)**
- **L0**
  - The Gauss-norm result is over ultrametric normed rings.
  - Mathlib's formal residue pairing exists; Weil-differential residues exist only as an abstract theorem.
  - Exact differentials and primitives with a base value exist over ℂ (`Complex.IsExactOn`, `DifferentiableOn.isExactOn_ball`, `IsExactOn.with_val_at`).
- **L1**
  - The residue disc of the origin on an elliptic curve is characterized (`range_formalPointHomAdicCompletion`).
  - Mathlib's Frobenius-lift predicate `AlgHom.IsArithFrobAt`.
  - Analytic `extDeriv` works over ℚ_p.
  - Grep sentences with literal but irrelevant hits.
- **L2**
  - Real and formal logarithm series.
- **L3**
  - `AbstractMeasure` is defined on any space; `PadicInt.continuousAddCharEquiv`.
  - The Néron–Tate regulator is not archimedean.

### Summaries (5)
All five summaries were updated to match the corrected entries.

### Duplicates (10)
- **Removed (1)**
  - **PC L5 → EllipticCurves Layer 7.** That layer lists continuous inflation–restriction only among missing upstream packaging it "is stated against once it exists". That makes it a dependency, not a target.
- **Added (7)**
  - **PC L9 → QuadraticFormInvariants 7A.** 7A owns the mod-2 Kummer class, the square-class isomorphism and h2MuToUnits.
  - **PC L10 and PC L12 → ClassFieldTheory Layer 0.** That layer asks for Tate corestriction with cor∘res, and for the Tate cup product with associativity, commutativity, restriction and the projection formula, all for finite groups.
  - **APL L0 → PadicMeasuresIwasawaAlgebras L0a.** Rigid character spaces.
  - **APL L4 → AutomorphicBundles B2.** Automorphic vector bundles.
  - **CI L0 → PadicHodgeTheory P7:annulus-foundations.** Laurent series on annuli.
  - **CI L2 → Polylogarithms P.1.** The complex Li_n with distribution relations.
- **Notes corrected (2)**
  - **APL L4 → AutomorphicBundles B3.** APL L4 does not list canonical and subcanonical extensions itself.
  - **AC L5w → PadicFamilies L5.** The note now says that L5 is a declared prerequisite of L5w.

After correction:
- **Verdicts:** 0 built, 14 partly built, 31 not built, 0 process.
- **Targets:** 304 in total: 7 mathlib, 53 tauceti, 5 both, 55 partial, 184 absent.
- **Duplicates:** 39.

## What was checked

**Mechanical.**
- All 45 batch layers are present, with no extras.
- Every citation resolves in `declarations.tsv` at its stated file and line: 522 distinct before correction, 588 after.
  - `ModularForm.L` is the exception, because the index drops its namespace. It is correct at `Mathlib/NumberTheory/ModularForms/LFunction.lean:134`.
- A resolver that ignores comments confirmed every namespace.
- No cited declaration is private or deprecated.
- No cited file contains `sorry`, and Tau Ceti has none in code at this pin.

**Presence claims (66 present targets).** I read every present target at source with its `variable` lines and hypotheses:
- **PC Layers 0-10:**
  - the discrete-module, section, internal-hom and extension files;
  - SmoothDiscrete and the canonical functoriality, degree-zero and additivity files;
  - LowDegree, ExplicitFunctoriality, Inflation, Conjugation, GroupCohomologyIso, CompactDiscrete;
  - FiniteQuotient/{Basic, Explicit, Colimit, DegreeTwoDescent};
  - ShortExact, LongExact, DeltaNaturality, TransversalWord, Corestriction, ProjectionFormula, Coinduced, Shapiro;
  - Cup/{Product, Restriction, Inflation};
  - AbsoluteGaloisGroup and GaloisCohomology/{Coefficients, Kummer}.
- **SPC Layers 0 and 3:** MorphismIdeal, Exact/{Projective, Injective, Frobenius}, Frobenius/Basic, Mathlib's Quotient API, `ComplexShape.refl` and `up'`.
- **CI L0 T0:** restricted power series and radius of convergence.

Layer 2's conjugation target holds, because the README's export table names only `explicitConj1` and `explicitConj1_eq_id_of_mem`. The degree-2 homotopy is present at cochain level.

**Absent and partial claims (237).** Six independent concept sweeps re-searched all of them, one per roadmap and two for PC. Each sweep searched Mathlib-style names, synonyms and docstrings in `declarations.tsv` and both source trees, and tested every negative sentence in the notes. I re-opened every hit before using it. Confirmed absent in both libraries:
- **Profinite cohomology:** the degree-1/2 canonical comparison, the degree-2 colimit universality, filtered-colimit compatibility, transgression and the five-term sequence, transitivity and Mackey for cohomology, degree-2 Shapiro, the all-degree long exact sequence, cohomological dimension, all-degree cups, Bockstein, profinite Hilbert 90, Kummer surjectivity, the Evens norm.
- **Stable, periodic and curved algebra:** Stable E, Happel, Gorenstein-projectives, singularity categories, periodic shifts and triangulations, compression and orbit categories, curved DG objects, coderived and contraderived categories, matrix factorizations, depth and Cohen–Macaulay modules.
- **Automorphic congruences:** congruence modules, pseudorepresentations, characteristic and Fitting ideals, unitary Shimura varieties, Hida theory, Beilinson–Flach, Yager, deformation functors and R = T, determinant lines, Heegner points.
- **Automorphic p-adic L-functions:** Hecke characters over number fields, Leopoldt, locally analytic distributions, arithmetic-group cohomology, modular symbols, Hilbert and Bianchi forms, Deligne–Ribet, Katz, Hsieh, EHLS and Eischen–Wan.
- **Coleman integration:** a convergent p-adic logarithm, non-archimedean annuli and Laurent rings, overconvergent algebras, Frobenius lifts on curves, rigid and de Rham cohomology, Coleman functions, p-adic polylogarithms, p-adic L-functions.

**Duplicates.**
- All 33 original ids exist, and none belongs to a retired roadmap.
- I read every named layer's full description against the listing layer's targets.
- Kept on purpose:
  - declared owners and suppliers where the target is restated (AC L4 → ModularIwasawaMainConjectures L2/L4; APL L0 → LocallyAnalyticDistributions L3);
  - F = ℚ or special-case restatements (PC L0 → ProfiniteProPGroups L5; APL L1/L2/L3 → ModularSymbolsPadicLFunctions and DirichletPadicLFunctions).
- Keyword sweeps of the atlas, with over 100 search terms, found the seven additions.
- Candidates rejected as consumers or different objects:
  - ProfiniteProPGroups L6, DiamondEtaleCohomology C8, ArithmeticGaloisDuality D7, SelmerIwasawaCohomology L0, ClassFieldTheory L5;
  - InductionRestriction L3, CompletedCohomologyPartII CC.1, ZigzagPreprojective L2, GrothendieckEulerForms L0, DGAInfinity L11;
  - TropicalAndBerkovichArithmetic TB.1/TB.7, EffectiveDiophantineMethods ED.4, ModularIwasawaMainConjectures L1/L6, HeegnerPointEulerSystems HE.8b.

## Reading

ProfiniteCohomology is the only roadmap in this batch that the libraries substantially serve. There the audit's inventory is accurate, down to declaration names. The two corrected "built" verdicts are small but real remainders: induced actions on subgroups and quotients, and the ℤ_p acceptance examples. A planner should not treat Layers 0 and 2 as closed.

The recurring weakness elsewhere was a negative sentence written from a name grep ("no trace morphism", "no closures", "no exact differentials", "the only regulator is archimedean") that general infrastructure contradicts. Examples are Mathlib's discrete group cohomology, category-theory closures and localizations, complex analysis, and Tau Ceti's Tate cohomology and elliptic-curve arithmetic. None of these corrections turns an absent roadmap target into a present one. The labels that move to partial record special cases or more general tools that a planner would reuse.
