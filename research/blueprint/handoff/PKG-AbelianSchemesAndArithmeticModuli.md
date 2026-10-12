# PKG-AbelianSchemesAndArithmeticModuli — roadmap package

Issue [#8887](https://github.com/CBirkbeck/tauceti-explorer/issues/8887). Agent: Claude (Opus 5.5), session
**claude-nN1YWY**, branch **claude-nN1YWY-pkg-abelian-schemes**. The bot confirmed the claim on 2026-10-12.
This is the complete package job, not a checkpoint.

## Deliverables

- `research/blueprint/packages/AbelianSchemesAndArithmeticModuli/README.md` — about 185 KB, 2,380 lines, in the
  2026-10-12 shape: **Summary**, *Scope and ownership*, *Conventions*, *Exact supplier contracts*, *How to read
  the build*, layers A0–A6 (92 subsections; each target has exact hypotheses, a source locator and *Needs*; each
  definition has its API and at least three **Checks**; each layer ends with *Examples* and *Dependencies*),
  *Worked examples*, *Downstream consumers*, *References*. Layer ids stay A0–A6 so that consumer citations
  (`AbelianSchemesAndArithmeticModuli:A4` and so on) still resolve.
- `research/blueprint/packages/AbelianSchemesAndArithmeticModuli/Suggested.lean` — 575 lines, `import Mathlib` plus
  seven pinned Tau Ceti modules. Real-bodied light definitions: `AbelianScheme` (with `baseChange`, `identity`,
  `ofAbelianVariety`, `toAbelianVariety`, `mulBy`), `IsAbelianIsogeny`, `OverField.Hom.deg` (Mathlib
  `Scheme.Hom.finrank`), `OverField.IsSimple`, `CoefficientHom` (`id`, `units`), `LocalizedHom`, `RiemannForm`
  (`hermitian`, `IsPrincipal`, `scale` with proved fields), `SiegelUpperHalfSpace`, `siegelAction`. Theorems
  statable at the pins (commutativity, rigidity, multiplication ranks, torsion density, degree API, abelian
  images, Poincaré reducibility, degree polynomial, Hom finiteness, semisimplicity, characteristic polynomial,
  the two polynomial lemmas, Milne's Lemma 14.5, alternating elementary divisors, the Siegel action) and
  discriminating `example`s. No sorry'd data, no `True`/`Prop := sorry`. A closing comment lists every README
  target not typed at the pins, grouped by missing carrier.
- `research/blueprint/packages/AbelianSchemesAndArithmeticModuli/metadata.toml`: `topic = "math.AG"`.

## Validation

- `lean-check research/blueprint/packages/AbelianSchemesAndArithmeticModuli/Suggested.lean`: **exit 0, 41
  `declaration uses 'sorry'` warnings, no other warnings or errors** (shared pinned build, Mathlib 082e2d37e8 +
  Tau Ceti f790474; about 105 GB free; one check at a time).
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems. No local paths.
- Coverage: all 89 plan nodes map to a README target (script-checked; the Weil-restriction functor and
  quasi-projective comparison share A6.30). Every `*Needs:*` reference points to an earlier subsection
  (script-checked: no forward references); every `A k.n` reference in the text resolves.
- Locators checked at packaging: Milne, *Abelian Varieties* v2.00 (2008) — fetched the public PDF (SHA-256
  `f5ca4e63e5092a4b102daad1470e4cbed5fe8f82115e3a28c8881e3f67f6aaef`, 2026-10-12), printed page = PDF page − 6
  confirmed for Lemma 10.6 (p.45), Theorem 10.9 (p.46), Remark 10.11, Lemma 10.12, Proposition 10.13 (p.47),
  Theorem 10.15 (p.49), Proposition 10.20 (p.50), Lemmas 10.21–10.22 (p.51), Proposition 10.23 (p.52),
  Theorem 11.1 (p.54), Remark 13.9 (p.60), Theorem 14.3 and Proposition 14.4 (p.62), Lemma 14.5 (p.63).
  Stacks tags 0BEV (Lemma 33.45.9), 081I (Lemma 29.26.16), 0BF6 (Lemma 39.8.4), 047N (Lemma 39.8.2) fetched
  and confirmed. All other locators are the accepted plan's (its review checked them); the R09.4-derived ones
  (Olsson, Kass, Oort) come from the AlgebraicModuli R09.4 packet and were not re-opened.

## Structural decisions (recorded for the maintainer)

1. **The abelian carriers moved here.** The plan cited `AlgebraicModuliForArithmeticGeometry:R09.4/arith-*`
   (abelian scheme, relative rigidity and `[N]`, relative dual, polarization, local ample representatives,
   canonical bounded bundle, full level, polarized automorphism rigidity). The accepted AlgebraicModuli package
   does **not** contain them (its scope says abelian moduli are outputs for this roadmap; the R09.4 packet is
   `needs_changes`). They are planned here: `AbelianScheme` (A0.1), rigidity and `[N]` ranks (A1.2, A3.2), the dual
   and Poincaré bundle (A2.2, merged with `normalized-poincare-comparison`), `Polarization` (A2.5),
   representatives and the graph bundle with its cubic embedding and rank `d(6r)^g` (A2.6), `FullLevel` (A3.8),
   and polarized automorphism/level rigidity (A6.18). The polarized moduli stack `A_{g,d}` and its fine level
   schemes stay with PELModuli.
2. **New targets closing plan gaps:** `abelianPicardInputs` (A0.3, the plan's import-only
   `relative-moduli-imports` made into a theorem with exact supplier hypotheses); `ampleIntersectionPositive`
   (A2.7, Stacks 0BEV; SF.5 has no positivity statement); `abelianImage` (A6.3, the plan's gap
   G-abelian-image, with a proof through flat base change of scheme-theoretic images and Stacks 0BF6/047N).
3. **Layer moves to remove forward references:** Rosati involution, divisor ample criterion and principal
   quotients A2 → A3 (A3.9–A3.11); polarization type A2 → A5.4 (after Appell–Humbert); realization conventions
   A4 → A5.7; rational Néron–Severi and ample cone A2 → A6.15. AbelianSchemesAndArithmeticModuliPartII says
   "polarizations and Rosati involutions (A2)": the Rosati involution is now A3.9.
4. **Rosati positivity without étale cohomology.** A6.14 proves `Tr(α^†α) = 2g(D^{g−1}·α^*D)/(D^g)` by
   Riemann–Roch (`deg(nλ + α^∨λα) = χ(L^n ⊗ α^*L)²`), so it no longer depends on the étale exterior-cohomology
   step (the plan's G-etale-exterior); Milne 2022 §17 is cited as the alternative étale proof.
5. **Supplier ids remapped** to the accepted packages: AlgebraicModuli R09.1–R09.6/A0-extension → its Layers 1,
   2 (§2.1), 3 (§§3.4–3.5), 5 (§5.2), 7 (§§7.2, 7.3, 7.6, 7.8, 7.10) by declaration name;
   SchemeAndStackFoundations `SF.5/chern-projection`, `chern-commutation`, `degree`, `finite-flat-degree`,
   `hirzebruch-rr` (which do not exist there) → `first-chern-class`, `intersection-product`,
   `proper-pushforward`, `flat-pullback`, `grothendieck-riemann-roch`; ComplexComparisonPartII C3/C4/C5 repair ids
   → `derivedGagaProperSpace`, `projectiveChowNonreduced`, `properSourceMorphismAlgebraicity`,
   `familyMorphismInterface`, `sheafSingularComparison`, `properDeRhamBetti`, `GaussManin`, `relativeDeRhamBetti`.
6. **Cited instead of planned (Tau Ceti current library / roadmaps):** the Tate module of an abelian group
   (`TauCeti.TateModule`, current library) is the carrier of A4.1; group-scheme kernels (current
   `GroupScheme/Kernel`) are `A[n]` and `ker f`; `isMonHom_of_one_hom` and `IsAlbanese` (current) are the field
   cases of A1.2 and the input of A6.35; ModularCurves 7E PD-2 supplies the connected–étale sequence used by
   A4.5 and 7F ST-1 is the elliptic case of A4.9; ComplexComparisonPartII `familyMorphismInterface` (3) supplies
   algebraicity of homomorphisms in A5.1. Nothing in the plan duplicated a declaration of the current library
   outright; these are boundary statements in *Scope and ownership*.
7. **Unsourced proof steps kept explicit** (the plan's G-* obligations), each written into its target as "not
   proved in the cited sources and part of this target": G-picard-dual (A2.1), G-projective-normality (A2.8),
   G-theta-principal (A3.11), G-vector-extension (A4.2), G-exterior and G-etale-exterior (A4.4), G-pd (A4.6–A4.7),
   G-odd-level (A4.12), G-dyadic (A4.13), G-appell (A5.3), G-family (A5.6), G-normal-extension (A6.25), G-twist
   (A6.28), G-cm (A6.37); A2.6 also marks the very ampleness of `M³` (Milne refers to Mumford).

## Plan points for the maintainer

- Lower-tier packets still cite this roadmap upward: AlgebraicModuliForArithmeticGeometry (4 packets),
  SchemeAndStackFoundations (2) and AdicSpacesPartII (1). The packages were not changed here.
- Books cited by sources but not freely available and not read: Mumford, *Abelian Varieties*; Mazur–Messing
  (LNM 370); Messing (LNM 264); Berthelot–Breen–Messing II; Bosch–Lütkebohmert–Raynaud, *Néron Models*; Wedhorn's
  lifting paper. They back the explicitly marked proof steps above.
- No packet was edited.
