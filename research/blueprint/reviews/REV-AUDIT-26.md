# REV-AUDIT-26 — review of the library audit of AUDIT-26

**Verdict: accepted.** 4 corrections. 178 targets checked across 38 layers of 5 roadmaps
(ModularIwasawaMainConjectures, ModularSymbolsPadicLFunctions, NoncommutativeAndEquivariantIwasawa,
PadicHodgeRegulators, PadicMeasuresIwasawaAlgebras), against the pinned baseline
(tauceti `f790474`, mathlib `082e2d3`).

## What I checked

**Every claim that a target is in the libraries.** All 150 cited declarations were matched
programmatically against `declarations.tsv`: 146 agreed on name, library, file *and* line. The four
misses are artefacts of the index, not of the audit — two anonymous `PowerSeries` instances
(`IsNoetherianRing R⟦X⟧`, `UniqueFactorizationMonoid R⟦X⟧`) and `ModularForm.L`, all confirmed by
hand at the cited lines. Every one of the 83 distinct cited files is free of `sorry`. I opened each
declaration in context and compared its hypotheses with the target. The audit's statements about
generality are accurate, including the delicate ones:

* Weierstrass division/preparation hold over any `IsAdicComplete` local ring, so they cover a
  complete DVR `O`; continuity of the division is genuinely not proved (only additivity and scalar
  compatibility).
* `R⟦X⟧` is Noetherian for Noetherian `R` but a UFD only for a principal ideal domain `R`, and
  `IsRegularLocalRing` has an instance only for local PIDs — so `dim O[[T]] = 2` and regularity
  really are missing, with only `ringKrullDim R + 1 ≤ ringKrullDim R⟦X⟧` available.
* `amiceTransform` is defined over any topological `ℤ_p`-algebra, but `invTransform` and
  `amiceTransformEquiv` exist only for `O = ℤ_p`; the file itself lists general coefficients as a TODO.
* Mahler's theorem is for complete ultrametric normed `ℤ_p`-modules; `prodMk_eq_prodMk'` is the
  Fubini interchange for profinite spaces; no convolution or algebra structure on measures exists.
* Banach–Alaoglu applies via `ProperSpace 𝕜`, which finite extensions of `ℚ_p` satisfy; both measure
  topologies are `def`s, not instances, exactly as the audit says.
* Tau Ceti's Shapiro lemma is degrees 0 and 1 only; its primitive central idempotents need an
  algebraically closed field with `|G|` invertible; its self-injectivity results need an algebra over
  a *field* carrying a perfect associative form, so they do not reach `R/aR` for an order over `O`.
* Tau Ceti's `logOneAdd` exists, but its radius/ball theorems carry `[ContinuousSMul ℚ≥0 𝕂]`, which
  fails p-adically — so there is no p-adic logarithm, let alone a normalised branch.

**Layers marked "built" or "process".** No layer is marked built. Both `process` verdicts are
supported by the layer text: `PadicHodgeRegulators:L0` only imports the period rings from
PadicHodgeTheory R06.1–R06.2 and checks conventions ("No additional period-ring carrier is
introduced"), and `ModularIwasawaMainConjectures:L6` re-exports branch theorems whose "arithmetic
proofs have the sole owners" HE.8b, BSD.6a and BSD.7a, plus a replacement-source concordance. L6 is
the borderline case in this batch — its map-level identifications of coefficient rings, periods and
the BDP square convention are not pure bookkeeping — but since it claims no theorem of its own,
`process` stands.

**Absent and partial claims.** I re-searched independently, by Mathlib naming convention and by
concept, in `declarations.tsv` and in both Lean trees (`grep -rn -i`, reading hits in context):
Fitting ideals of modules (only the Lie-theoretic `posFittingComp` exists), perfect complexes, `K₁`,
relative `K₀`, `SK₁` and reduced norms (only `QuaternionAlgebra.normForm`), determinant functors on
complexes, pseudo-isomorphisms and characteristic ideals, completed group rings and Iwasawa algebras
(no `completedGroupAlgebra` anywhere in Tau Ceti — its profinite work stops at pro-p group theory),
pseudo-measures, convolution of measures, modular and Manin symbols, Eichler–Shimura, parabolic
cohomology, p-stabilisation, Tate modules, Greenberg and signed Selmer groups, Iwasawa cohomology,
Coleman maps and Coleman integration, polylogarithms, dilogarithms and Bloch groups, higher K-theory
and Chern classes, syntomic cohomology, `B_cris`/`B_st`, (φ,Γ)-modules, Robba rings, Wach modules,
Bloch–Kato exponentials, Poitou–Tate and local Tate duality, Kubota–Leopoldt and p-adic L-functions,
rigid weight and character spaces, locally analytic distributions, topological Nakayama, Matlis
duality, Gorenstein orders and self-injectivity over `O`, ordinary/supersingular reduction, and the
unit-group product decompositions (`𝒪ˣ ≅ μ_{q−1} × U¹`, `ℤ_2^× = {±1} × (1+4ℤ_2)`). Every one is
genuinely absent.

**Duplicates.** All 43 claims confirmed: each cited layer exists in the atlas, none belongs to the
single retired roadmap (FoundationsAndLibraryIntegration), and each description really does state the
overlapping target. I then keyword-swept all ~1960 atlas layer descriptions for this batch's
characteristic phrases and subtracted what the audit already claims. Only one genuine duplicate had
been missed (below). The layers left without duplicates are correctly left so: PadicHodgeTheory P7 and
PhiGammaModulesAndIwasawaCohomology PG.5/PG.6 explicitly hand the Bloch–Kato exponential, the
Perrin-Riou regulators and the signed Coleman maps *back* to PadicHodgeRegulators, and no other layer
in the atlas states `F ⊗ ℚ_p ≅ ∏_{v|p} F_v` or the Bloch–Kato local condition.

**Verdict consistency.** Layers marked `partly built` each have at least one fully present target;
layers whose targets are only `partial` and `absent` are marked `not built`. That matches the
convention of the 25 already-accepted audit results (341 such layers are `not built` there against 15
`partly built`).

## Corrections

1. **PadicMeasuresIwasawaAlgebras:L0a, rigid character space.** The note attributed hypotheses to
   `PadicInt.continuousAddCharEquiv` that the file does not carry. `Mathlib/NumberTheory/Padics/AddChar.lean`
   assumes only `[NormedRing R] [Algebra ℤ_[p] R] [IsBoundedSMul ℤ_[p] R] [CompleteSpace R]`; there is
   no ultrametric hypothesis, and the open-unit-disc description `‖r‖ < 1` is the separate
   `continuousAddCharEquiv_of_norm_mul`, which needs `NormMulClass`. Note rewritten; verdict unchanged.

2. **PadicHodgeRegulators:D.4, `F ⊗ ℚ_p ≅ ∏_{v|p} F_v`.** Added
   `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian` as a related declaration: Mathlib does prove
   `AdicCompletion I R ⊗_R M ≅ AdicCompletion I M` for a finite module over a Noetherian ring, which
   supplies `ℤ_p ⊗_ℤ 𝒪_F`. Only the splitting over the places above `p` is missing, so the target stays
   `absent`, but the note now says which half exists.

3. **ModularIwasawaMainConjectures:L3, the analytic L-function of E.** The note was a bare "Not
   present." Mathlib's `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` defines
   `WeierstrassCurve.LFunction` and `WeierstrassCurve.localEulerFactor` — the Euler product over the
   height-one spectrum with the good / split multiplicative / nonsplit multiplicative / additive local
   polynomials, sorry-free. Cited with a note distinguishing this complex L-series (no continuation)
   from the p-adic L-function the layer needs. Target stays `absent`.

4. **NoncommutativeAndEquivariantIwasawa:NE.3, missed duplicate.** Added `KTheoryLowDegrees:U.3`
   ("Determinant, units and SK₁"), which defines `SK₁` as the kernel of the stable determinant, proves
   its vanishing for fields and commutative semilocal rings, and uses the Dieudonné determinant for
   division rings — the same `SK₁` target, owned by a roadmap NE.3 does not list as an input.

## Most important finding

The audit is sound: its verdicts and its absence claims all survive independent re-search, and the
noncommutative-Iwasawa, modular-symbol and regulator roadmaps are genuinely unbuilt end to end. The
substantive gap was in the opposite direction — three "not present" entries understated what the
pinned Mathlib now contains (the elliptic-curve Euler product, the adic-completion/tensor comparison,
the precise character-space hypotheses), and one cross-roadmap duplicate (NE.3 / KTheoryLowDegrees
U.3) had been missed. None of these changes a layer verdict.
