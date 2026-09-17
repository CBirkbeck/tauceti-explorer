# Review of AUDIT-20

**Job** REV-AUDIT-20 · **Date** 2026-09-17 · **Verdict `accepted`** · **89 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the five roadmaps of `research/blueprint/audit/AUDIT-20.json`:
- `DrinfeldModulesAndTModules`
- `FunctionFieldArithmetic`
- `GlobalShtukasAndFunctionFieldLanglands`
- `BunGAndNewtonStrata`
- `ExcursionOperatorsAndSpectralAction`

That is 49 layers and 240 targets, with 158 distinct citations (192 uses) and 108 duplicate claims.

**The audit's picture holds.**
- Tau Ceti has built Stichtenoth's function-field theory, so FA.1 is largely done, FA.3 is half done, and the function-field side of FA.0 is done.
- Drinfeld modules, t-motives, shtukas, Bun_G on the Fargues–Fontaine curve, excursion operators and the spectral action are absent from both libraries. The declarations behind the positive claims about Riemann–Roch, the canonical class, Cl⁰, places, extensions and the different were re-read at source and say what the audit says, with one exception: the wild half of the different theorem is not proved.

The audit needed repair in four places, all fixable in place:
1. Five target labels and two verdicts were wrong.
2. Twenty-seven notes denied or overstated what the libraries contain, mostly general infrastructure outside the roadmaps' home directories.
3. One citation was a deprecated alias.
4. The duplicate lists were unreliable: 43 of the 108 entries named layers of the same roadmap, suppliers, consumers, or layers that do not contain the claimed overlap.

## Corrections

### Labels (5)
- **`DM.2` C_∞: `absent` → `partial`.** The note said "no analogue of C_p exists in either tree". In fact:
  - Mathlib builds ℂ_p exactly the way C_∞ is built (`PadicComplex`, `Padics/Complex.lean:137`).
  - The spectral norm it uses has no characteristic hypothesis (`spectralNorm.normedField`).
  - Two gaps remain. `RatFunc.CompletionAtInfty` is only a `Valued ℤᵐ⁰` field, with no normed or rank-one structure. `IsAlgClosed.of_denseRange` (`Analysis/Normed/Field/Dense.lean:45`) assumes characteristic zero.
- **`ES0` centre of the category: `absent` → `partial`.**
  - Mathlib's `CategoryTheory.CatCenter C` is `End (𝟭 C)`, commutative, with the scalar map `Linear.toCatCenter`.
  - Missing: the enhanced version, and D_lis(Bun_G) itself.
- **`FA.0` closed points ↔ valuations: `tauceti` → `partial`.** The audit's own note said the scheme-theoretic identification is missing, and FA.0's T2 records that no curve object exists. What is built is the valuation side plus the affine-model dictionary (`Place.heightOneSpectrumEquiv`, `Place.ratFuncEquiv`).
- **`FA.0` finite morphisms: `tauceti` → `partial`.** Only the place-level shadow exists: restriction of places, e, f and residue extensions. There are no morphisms of curves.
- **`FA.0` constant field: `partial` → `both`.** `finiteDimensional_algebraicClosure` (Tau Ceti) combined with `Module.finite_of_finite` (Mathlib) gives finiteness over a finite k; the general statements cover the case.

### Verdicts (2)
- **`FA.2`: partly built → not built.** Every target is partial or absent. The audit flagged this as its own judgement call, but the batch definition of "partly built" requires a present target.
- **`FA.7`: process → not built.** FA.7 asks for certified finite-field factorization, place enumeration and Riemann–Roch linear algebra. That is mathematics: `FiniteFieldsAndCharacterSums:FF.3` states the same factorization content and was audited as not built. This follows REV-AUDIT-19's WC.0 precedent.

### Citation (1)
- `FunctionField.FqtInfty` is `@[deprecated]` (2026-04-14). It is replaced by `RatFunc.CompletionAtInfty` (`FieldTheory/RatFunc/Valuation.lean:138`).

### Notes that denied or overstated library content (27)
Every new citation was opened, and its namespace was checked by a comment-stripping resolver.

- **FA.4, Artin map.** "No Artin map in either library" is wrong. Tau Ceti has the ideal-theoretic Artin homomorphism for abelian extensions of number fields (`NumberFieldArithmetic.artinHomAway`).
- **FA.4, ray classes.** Ray class groups are not confined to the multiquadratic files. Tau Ceti has ray class groups of number fields with the class number formula (`GlobalNumberFields.RayClassGroup`, `card_rayClassGroup`). No reciprocity law or ray class field exists.
- **FA.3, different.** "Dedekind's different theorem in both halves… equality exactly in the tame case" overstates. Only d ≥ e−1, and tame ⇒ d = e−1, are proved. The wild converse is only remarked in `Different/Tame.lean`.
- **FA.2, Fourier theory.**
  - Fourier inversion and double duality exist for finite abelian groups (`ZMod.dft_dft`, `AddChar.doubleDualEquiv`), not only on real inner product spaces.
  - Tau Ceti's local-field instance for adic completions supplies local compactness at every finite place (`isNonarchimedeanLocalField_adicCompletion`).
- **FA.3 and FA.6, smaller points.**
  - FA.3: Frobenius-subfield degrees [K(X):K(X)^q] = q are in Tau Ceti.
  - FA.3: the `artinSchreier` lemmas live in a general polynomial file as well as the elliptic-curve files.
  - FA.6: Hecke rings are abstract (Mathlib `HeckeRing` for any Hecke pair), not only elliptic-modular. `satake` still has no hits.
- **DM.1 T4, DM.0, DM.4, DM.8, DM.6.**
  - DM.1 T4: Tau Ceti represents G/G° by the finite étale π₀(G), over algebraically closed fields.
  - DM.0: Tau Ceti has G_a with its Frobenius endomorphism and α_p = ker F. It also has kernels of isogenies as finite flat group schemes over any base; the note had said "over a base field". No Frobenius `MulSemiringAction` instance exists, so L{τ} must still be instantiated.
  - DM.4: Tate algebras and affinoid-type algebras exist (Mathlib `MvPowerSeries.IsRestricted.subring`; Tau Ceti `Huber.restrictedMvPowerSeriesSubring`).
  - DM.8: `AlgebraicIndependent` is not "only the definition": the transcendence-degree API and Liouville's theorem are there.
  - DM.6: Mathlib's Euler products take values in any complete normed field.
- **DM.2 T2, DM.3.** `IsZLattice` is over any normed field, and `Submodule.IsLattice` exists. Mathlib's `HeckeRing` is general.
- **BG0.** "No Levi subgroup theory" is wrong: Tau Ceti has dynamic Levi and parabolic subgroups of cocharacters, with a Levi decomposition (`Cocharacter.levi`).
- **BG1.** The dominance cone exists (`TauCeti.posRootCone`). The `'newton polygon'` grep claim is literally true: the only occurrence is hyphenated prose.
- **ES3.** "No dual group, so the hypothesis cannot even be stated" is wrong: `RootPairing.flip` gives the dual root datum.
- **ES6:functoriality.** Mathlib has no Schreier index formula for Nielsen–Schreier, contrary to the note. Abelian Shapiro (`groupCohomology.coindIso`) exists, although the note said "nothing else".
- **ES7:parabolic.** Tau Ceti's dynamic parabolics give P(E) ⊂ G(E) on points, although the note said "no parabolic subgroup of a p-adic group".
- **ES7:GLn-comparison.** Semisimple trace determination is Tau Ceti's, not Mathlib's, and covers only finite groups in characteristic 0. Mathlib has only the converse direction.
- **GS.0.** Tau Ceti builds nonsplit tori by Galois descent.
- **GS.2.** The representability criterion is for Zariski sheaves, not fpqc sheaves.
- **GS.4.** Abstract Galois categories with a fundamental-group recognition theorem, and finite étale algebras with a fibre functor, exist. No étale π₁ of a scheme exists.

### Summaries (4)
The DM, FA, BG and ES summaries were updated to match the corrected entries.

### Duplicates (50)
- **Removed 14 same-roadmap entries.** These are the parent/sublayer pairs of BG2, ES1, ES6 and ES7, plus ES3 → ES2. The batch asks for other roadmaps' layers.
- **Removed 29 entries that are not duplicates under the prompt's rule** that a layer which only consumes or imports a target does not duplicate it.
  - Suppliers:
    - FA.0 → SF.3; FA.5 → DWP.1 and WC.5:surface-alternative; GS.0 → FA.6
    - GS.3 → EDC.5; GS.6 → DWP.7; GS.7 → HS3
    - BG2 → VS0 and GS0:Schubert-smoothness; BG2:smooth-Artin → VS0; BG2:uniformization → RF4
    - ES0 → LP2:excursion-presentation; ES0:classical-center → SR.3
    - ES1 and ES1:spectral-center → LP2:integral-invariants
    - ES4 → HS3; ES6 and ES6:functoriality → FA.4; ES6:duality → VS5
  - Consumers or deferrals: FA.6 → GS.0; FA.7 → ES7:function-field-automorphic; BG3 → VS4 (BG3 defers to it explicitly); ES7:equal-characteristic → HS3.
  - Claimed overlap not in the named layer:
    - FA.1 → TB.3: graph Riemann–Roch.
    - FA.4 → HL.7: HL.7 only calls 1-dimensional CFT a design guide.
    - FA.7 → GS.7.
    - GS.1 → GS4:classical-Satake-comparison: a function–sheaf trace comparison, not MV Satake.
    - GS.5 → LP2:excursion-presentation.
    - ES7:parabolic → SR.1: Hecke algebras; induction is SR.2's.
- **Replaced 1.** FA.3 → LocalFieldsRamification Layer 1 (unit filtration) becomes Layer 3 (lower and upper numbering, Herbrand functions).
- **Added 4.**
  - FA.0 → AlgebraicCurves Layer 8: constant-field extensions keep exact constants; absolute-irreducibility criterion.
  - FA.3 → AlgebraicCurves Layer 10: Artin–Schreier covers with genus and different.
  - GS.4 → `VStackSheavesAndLisseCategories:VS1`: Drinfeld's lemma, FS IV.7.
  - FA.7 → `FiniteFieldsAndCharacterSums:FF.3`: certified finite-field factorization.
- **Two notes corrected.**
  - FA.4 → ClassFieldTheory Layer 12: that layer excludes function fields in terms.
  - BG1 → IG.0: IG.0 has the Newton map but not the partial order or semicontinuity.

After correction: 4 partly built, 45 not built, 0 process. Targets: 1 mathlib, 8 tauceti, 4 both, 22 partial, 205 absent. There are 69 duplicates.

## What was checked

**Mechanical.**
- All 49 batch layers are present, with no extras.
- Every citation resolves in `declarations.tsv` at its stated file and line: 158 distinct before correction, 188 after.
- Every name was compared with the namespace computed from the source by a resolver that ignores comments.
- No cited declaration is `private`, and no cited file contains `sorry` or an `axiom`.
- The only deprecated citation was `FqtInfty`.

**Presence claims (14 present, 19 partial).** All were re-read at source with their `variable` lines.
- The Riemann–Roch statement is the ∀-D identity `IsRiemannRochDivisor`, under `IsFunctionField` and exact constants only.
- `finite_ker_degreeClass` needs only `[Finite k]`.
- The fundamental identity, decomposition and inertia counts, and the lower ramification groups say what the notes claim.
- The Tau Ceti `FunctionField` directory has no `sorry`.
- `SkewPolynomial.X_mul` gives Xp = φ(p)X under `MulSemiringAction (Multiplicative ℕ) R`.

**Absent claims.** All 207 were searched again, by concept rather than by name. Four independent sweeps covered about 60 concepts across `declarations.tsv` and both source trees, and I opened every hit used above. Confirmed absent in both libraries:
- **Drinfeld modules and periods:** Drinfeld, Carlitz and Anderson modules and motives; Tate modules as modules; Newton polygons; nonarchimedean entire functions; A-lattices; Goss and Taelman values; Fitting ideals; Fredholm determinants; difference Galois theory; transcendence theorems for periods.
- **Stacks, sheaves and Bun_G geometry:** algebraic stacks; Harder–Narasimhan filtrations; loop groups and affine Grassmannians; Beauville–Laszlo gluing; perverse sheaves, IC complexes and six functors; étale π₁; the Grothendieck–Lefschetz trace formula; nearby cycles; Weil and Weil–Deligne groups.
- **p-adic and Bun_G inputs:** perfectoid spaces, the Fargues–Fontaine curve, diamonds, Banach–Colmez spaces; higher-rank Dieudonné–Manin; σ-conjugacy, B(G), the Kottwitz map and π₁(G).
- **Automorphic and representation theory:** smooth representations of p-adic groups; the Bernstein centre; L-parameters; local Langlands and Jacquet–Langlands; Weil restriction; nonabelian Shapiro; z-extensions; δ_P; trace formulas and orbital integrals; D-elliptic sheaves; Hochschild–Serre.
- **Function-field arithmetic:** the function-field adele ring and its cocompactness (not proved even for number fields); idele norms; Pontryagin duality for LCA groups; Riemann–Hurwitz; upper numbering and Herbrand functions; Artin–Schreier–Witt theory; local class field theory and Lubin–Tate; function-field zeta functions and Chebotarev; Satake; certified factorization; arithmetic of division algebras.

**Duplicates.**
- All 108 ids exist and none belongs to a retired roadmap.
- I read every named layer's description against the listing layer's targets.
- Keyword sweeps of the atlas found the four additions.
- Kept on purpose:
  - Same statements over another class of fields or another curve: number-field adeles, class field theory and Chebotarev; Bun_G on the Fargues–Fontaine curve versus the global curve; local versus global excursions.
  - Owners of inputs that the audit itself made targets: BG4 → VS1, ES5 → LP2:semisimple-characters, ES7:GLn-comparison → ET.6.

## Reading

The function-field roadmap is the only one in this batch that the libraries substantially serve. There the audit is right that FA.1 and most of FA.3 are done. It had, however, credited FA.0 with curve-side results that do not exist without a curve object; `AlgebraicCurves` Layer 12 owns that side. Elsewhere, the audit's absences are real at the level of the roadmaps' own objects. Its notes missed general infrastructure that a planner would reuse, and the correction notes above record it.
