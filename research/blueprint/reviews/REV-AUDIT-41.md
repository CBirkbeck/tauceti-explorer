# REV-AUDIT-41 — review of AUDIT-41

**Verdict: accepted.** 1 correction, 1 regrade. 248 targets, 421 declaration citations and 58
duplicates checked.

Batch: `ReductiveGroupsPartII`, `SmoothRepresentationsOfLocalGroups`,
`tauceti:TauCetiRoadmap/ReductiveGroups`, `tauceti:TauCetiRoadmap/RepresentationTheory/AdoIwasawa`,
`tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory` — 48 layers, 248 targets, 421
declaration citations, 58 duplicates. Baseline: tauceti `f790474`, mathlib `082e2d3`, matching the
audit's `baseline` field and the checkout at `workers/baseline`.

## What the audit claims

11 layers "built", 15 "partly built", 22 "not built". 90 of 248 targets are present (85 in Tau Ceti,
3 in Mathlib, 2 in both), 38 partial, 120 absent. This is the most "built" batch I have reviewed, and
the claim is correct: Tau Ceti's character theory and its Hopf-algebraic theory of affine group
schemes are largely finished, while the two proposed roadmaps — local structure (Bruhat–Tits) and
smooth representations of p-adic groups — have essentially nothing.

## 1. Every claim that something is in the libraries

**All 421 citations match `declarations.tsv` exactly on library, name, file and line — no
exceptions.** All 215 cited files (167 Tau Ceti, 48 Mathlib) exist and none contains a `sorry`. This
is the cleanest citation set of the four audits I have reviewed, and notably it hits neither of the
index defects reported in REV-AUDIT-36 and REV-AUDIT-32.

I read the source behind the built layers. Every target is matched by a declaration that states it:

* **CharacterTheory** — `ClassFunction` with `equivConjClasses` and `characterPairing`; the class
  sums with `classSumBasis` and `isIntegral_classSum`; Wedderburn as
  `exists_algEquiv_pi_matrix`; `card_irreducibleCharacters` (#irreducibles = #conjugacy classes);
  `basisOfIrreducibleCharacters`; the character table with second orthogonality
  (`sum_characterTable_mul_characterTable_inv`) and `characterTable_unique_rows`; the Dixon–Schneider
  specification `IsCharacterTableSpec` with the class-multiplication matrices; the Frobenius–Schur
  indicator with the trichotomy, `frobeniusSchurIndicator_eq_one_iff_isRealizableOverReal`, the
  involution count and `card_realValued_eq_card_realClasses`; and Frobenius's theorem, with
  `frobeniusKernelSubgroup`, `isometry_ind_of_isTISet` and the exceptional-character correspondence.
* **ReductiveGroups** — the three-way dictionary (`commHopfAlgCatOpEquivAffineGroupSchemeCat`,
  `pointsCorepresentableBy`), comodules with the fundamental theorem, the embedding theorem
  `exists_isClosedImmersion_generalLinear`, Tannakian reconstruction, Lie(G) with `Ad`, the Jordan
  decomposition, diagonalizable groups with `essImage_schemeFunctor`, and `μ_p` non-reduced.

**One correction, made in place, with the layer regraded.**
`…/CharacterTheory#layer-8-frobenius-groups-and-frobeniuss-theorem`'s target "Consequences:
|H| ∣ |N| − 1" was marked `library: tauceti`, but its only citations are two `related` lemmas and its
own note said the divisibility "follows from the complement structure". It is not stated anywhere: Tau
Ceti proves `IsTISubgroup.ncard_frobeniusKernel : (frobeniusKernel H).ncard = H.index`,
`isComplement'_of_coe_eq_frobeniusKernel` and `ncard_compl_frobeniusKernel`, and nothing of the form
`Nat.card H ∣ Nat.card N - 1` exists in either tree. That is precisely this auditor's own `partial`
convention — "the ingredients or special cases exist; the stated target does not", as used at RG2.0,
RG2.0a, RG2.2 and throughout Layers 7–9. The target is now `partial`, the note says exactly what is
proved and what step is missing, and the layer is regraded **built → partly built**. With that
change every one of the 48 verdicts follows its targets under a single rule; before it, this was the
only exception.

## 2. Layers marked "built"

Ten layers remain "built" after the regrade, and each has every target present. There is no "process"
layer in this batch.

## 3. Re-searching the absent and partial claims

I re-searched independently over `declarations.tsv` and both Lean trees. **Nothing turned up that the
audit missed.** Zero hits for Bruhat–Tits, buildings, apartments, parahoric and Iwahori subgroups,
Moy–Prasad filtrations, smooth or admissible representations of a p-adic group, Jacquet modules, the
Satake transform, supercuspidals, Whittaker models, and Ado's theorem.

The hits that look promising are not: `bernstein` matches only `IsBernsteinFunction` in analysis, not
Bernstein's theory of smooth representations; `admissible` and `levi` match unrelated order-theoretic
and Lie-theoretic vocabulary; `rootDatum`, `unipotentRadical` and `parabolicSubgroup` match Tau Ceti's
GL_n and Hopf-ideal material, which the audit already cites as `related`/`special case` in Layers 7–9.

The partial notes are unusually well sourced — several quote the Tau Ceti files' own disclaimers:
"no representability is asserted" (Layer 3), "no conjugacy statement is proved here" (Layer 7), and
`Kostant/RootSubgroup/NumberedSymmetry.lean` recording that it "is not the isomorphism theorem for
pinned groups". I checked each of those against the source and they are accurate.

## 4. Duplicates

**All 58 duplicate edges resolve in `data/atlas.json`**, and the three phrases the notes quote were
found in the stages they cite. Fourteen of the 58 name Tau Ceti layers, which is the right treatment
for a batch that has Tau Ceti roadmaps as members.

**No duplicate is missing.** The roadmaps that plan adjacent mathematics and are absent from the list
— `GlobalShtukasAndFunctionFieldLanglands`, `HeckeStacksAndLocalShtukas`, `PadicFamilies`,
`BunGAndNewtonStrata` — turn out to plan *different* objects: their "Satake" is geometric Satake (the
category of perverse sheaves on the affine Grassmannian, owned by `GeometricSatakeAndFusion`, which
the audit does cite), and their "Hecke algebra" is the classical one acting on modular forms, not the
convolution algebra of a p-adic group that `SmoothRepresentationsOfLocalGroups` owns. I read the
relevant stage text in each case before concluding.

## Checks

- 421 citations × (library, name, file, line): all match the pinned index.
- 215 cited files: all present, none with a `sorry`.
- 48 layer ids and 58 duplicate layer ids: all resolve in `data/atlas.json`.
- After the regrade, all 48 verdicts follow their targets under one rule.
- Lean: none.
