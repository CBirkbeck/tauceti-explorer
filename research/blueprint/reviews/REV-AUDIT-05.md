# Review of AUDIT-05

**Job** REV-AUDIT-05 · **Date** 2026-09-16 · **Verdict `accepted`** · **73 corrections**

Baseline: tauceti `f790474`, mathlib `082e2d3`.

Scope: the five roadmaps of `research/blueprint/audit/AUDIT-05.json`: PolynomialGaloisGroups,
QuadraticFormInvariants, Completed/ContourIntegration, Completed/OrthogonalL2Bases and
ConformalMapping. That is 49 layers, 238 targets (239 after one addition), 678 declaration
citations and 36 duplicate claims. The audit is careful on the completed roadmaps and mostly
right elsewhere. Its errors run both ways: some `tauceti` and `built` labels are stronger than
the Lean, and some `absent` claims miss results that one of the libraries already proves. Every
error could be fixed in place.

## What was checked

**Every citation, mechanically.** All 678 citations resolve in the pinned index at the cited
file and line, and no cited declaration body contains `sorry` or `admit`. At the pin Tau Ceti has
no `sorry` token outside comments and declares no axiom. After correction there are 695
citations, all resolving at file and line, with at most five per target.

**Every citation, by reading.** Each cited statement was compared with the layer text,
including hypotheses and generality. The reviewer read PolynomialGaloisGroups,
QuadraticFormInvariants and ConformalMapping directly. ContourIntegration and OrthogonalL2Bases
were checked target by target in two delegated read-only passes. Every issue those passes raised
was re-verified at source before it was applied, and a sample of the targets they passed was
re-read.

**Presence claims that overstated the Lean (7 targets now `partial`):**

| Roadmap · layer · target | What is missing |
|---|---|
| PGG 1 · general wreath products | primitivity of the product action and the comparison with `RegularWreathProduct`; the audit's own note listed both |
| PGG 3 · discriminant field `F(√disc f)` | base-field functoriality: `discrField_map` is naturality in the ambient extension `E ≃ₐ[F] E′` |
| QFI 1 · Witt decomposition | degenerate forms (the radical summand) and Lam I.4.4; neither library has totally isotropic subspaces of a quadratic form |
| QFI 1 · functoriality | monotonicity of the Witt index under base change (only `not_anisotropic_baseChange` exists) |
| QFI 3 · discriminant, two descriptions | the Gram-determinant description was credited to `orthogonalDetSquareClass`, which is the determinant of an orthogonal map mod squares; only the diagonal `discr'_weightedSumSquares` exists |
| QFI 7A · Kummer map, consumed | `kummerIso`, `hilbert90` and `h2KummerToUnits`; Tau Ceti has only the injective `kummerClassMap` |
| QFI 7A · corestriction, consumed | the Galois-level transfer (`G_L ≤ G_K`, `galoisCor`, Mackey); only abstract open-subgroup corestriction in degrees 0–2 exists |

As a result, **PGG Layer 3** and **QFI Layer 1** go from `built` to `partly built`.

**Absence claims contradicted by the libraries (5 targets now `partial`):**

| Roadmap · layer · target | Audit said | In the baseline |
|---|---|---|
| PGG 0 · conjugate fields | absent; grep found only Multiquadratic lemmas | Mathlib `IsGalois.map_fixingSubgroup` and Tau Ceti `Subgroup.fixedField_map_conj` (conjugate subfields ↔ conjugate subgroups, any extension), `IntermediateField.algHomAdjoinIntegralEquiv` (embeddings ↔ roots), `MulAction.orbitEquivQuotientStabilizer` |
| PGG 4 · root enumerations | absent | Mathlib `Polynomial.splits_iff_card_roots` and `nodup_roots_iff_of_splits`: only the enumeration-shaped statements are missing |
| QFI 5 · Clifford invariant | absent | Mathlib `CliffordAlgebra.equivOfIsometry` (isometry invariance); Tau Ceti central simplicity of `CliffordAlgebra Q` for polarized even-dimensional `Q` |
| QFI 6A · uniformizer and level `e` | absent, "no IsUniformizer for a local field" | Mathlib `Valuation.IsUniformizer`, with existence and the maximal-ideal comparison, applies to a local field's valuation, and Tau Ceti uses it so; `e` is still missing |
| QFI 6A · local square theorem and counts | absent | the `e = 0` case, `unitFiltration_one_le_range_powMonoidHom_of_isUnit`; the dyadic case, sharpness and counts are missing |

Other entries were corrected:

- **ConformalMapping L3.** The square-root step is `both`, not `mathlib`. Mathlib gives only
  continuous branches; the holomorphic root is Tau Ceti's `exists_differentiableOn_pow_eq`.
- **One target added.** QFI 9 "which functional" (the `Lˣ`-torsor of `K`-functionals) had no
  target. It is now `partial`: Mathlib has `Algebra.trace_ne_zero` and `traceForm_nondegenerate`.
- **Wrong objects cited.**
  - CM L2 derivative Schwarz–Pick cited the automorphism *equality*. The inequality is
    `norm_deriv_div_one_sub_norm_sq_le`.
  - QFI 9 trace form cited the trace form of `gl_n`. It now cites `Algebra.traceForm` and
    `TauCeti/FieldTheory/Trace`'s diagonalization lemmas.
  - OL2B C cosine basis cited a lemma true by definition. It now cites
    `coeFn_chebyshevCosineHilbertBasis`.
  - OL2B A2 ladder operators cited definitions. It now cites the theorems
    `hermiteAnnihilationCLM_apply_hermiteSchwartzMap` and `hermiteCreationCLM_apply_hermiteSchwartzMap`.
- **Private declarations.** 19 private citations were removed or replaced by public ones: 9 in
  OrthogonalL2Bases, 4 in ConformalMapping, 3 in the QFI 1 Cartan–Dieudonné entry (which now
  cites the public `reflection` API), 2 for `RegularFormClass` cancellation (QFI 1 and 4) and 1
  in PGG 3.
- **Fit labels** were lowered where the cited statement adds or weakens hypotheses:
  - the ContourIntegration winding-decomposition lemmas need a basepoint `γ a ≠ s`;
  - the arc FTC lemmas need differentiability at every interior point;
  - the OrthogonalL2Bases B1 and B2 citations prove the `L²(w)` form where the target is the
    `√w`-envelope form.
- **Notes that misstated Mathlib or the proof.**
  - Mathlib has `meromorphicOrderAt_logDeriv_eq_neg_one`, C²-homotopy invariance of curve
    integrals and primitives on convex sets.
  - `hermite_succ` is the defining recursion, not the three-term one.
  - The Hermite pairing recursion does not use Mathlib's Rodrigues formula.
  - Moment determinacy goes through `withDensityᵥ` (a signed-measure step), not a Fourier-integral
    argument.
- **Summaries.** The PGG, QFI and OL2B roadmap summaries were brought in line with the corrected
  entries.

**The absent claims that stand.** The remaining absent claims were searched again by name, by
Mathlib naming convention and by docstring grep over both trees, all of them for QFI and PGG. None
of the following exists: a resolvent theory, the classification of transitive groups in degree ≤ 5,
Jordan's p-cycle theorem, a Witt ring, Pfister forms, a Hilbert symbol, the quadratic defect, a
Hasse or Clifford invariant class, the H²–Brauer comparison, Stiefel–Whitney classes, the Scharlau
transfer, prime ends, or the converse Schwarz–Christoffel theorem.

## Duplicates

All 36 original duplicate ids resolve to atlas stages, and none points at the retired
FoundationsAndLibraryIntegration.

- **Removed 8 entries, in 4 layers,** that listed the layer's own sub-layers: QFI 6 → 6A and 6C,
  QFI 7 → 7B, OL2B Part A → A1 and A3, Part B → B1–B3. The parent link is already recorded as
  `parentStageId`, and three of the four lists named only some of the children.
- **Added 10:**
  - ProfiniteCohomology Layer 13, whose first Evens-norm milestone is the permutation wreath
    product, for PGG 1.
  - NumberFieldArithmetic 3 §3.2, `Algebra.discr` of a power basis = `Polynomial.discr` of the
    minimal polynomial, for PGG 3.
  - NumberFieldArithmetic 7 §7.1, the embedding action and the subfield dictionary, for PGG 0 and 2.
  - SpinRepresentations 2, where Pin → O surjectivity rests on Cartan–Dieudonné, for QFI 1.
  - GN.6, Grothendieck–Witt and Witt groups, for QFI 4.
  - ClassFieldTheory 5, the cohomological local Hilbert pairing with bilinearity, for QFI 6C.
  - LocalFieldsRamification 0, the supplier of `normalizedValuation` and `natCastValuation`, for
    QFI 6A.
  - ModularForms 1, the valence formula with the HW weights ½ and 1/6, for ContourIntegration 1
    and 4.

Left unchanged: two explicitly out-of-scope items are still listed as `absent` targets, each with
a remark saying so: CM L5 prime ends and OL2B Part D Laguerre/Jacobi.

## Most important finding

**A `built` or `tauceti` label was sometimes resting on a nearby declaration rather than the
milestone itself.**

- QFI Layer 1 was `built`, but Witt decomposition exists only for regular forms, with no Lam I.4.4
  and no Witt-index functoriality.
- PGG Layer 3 was `built`, but `discrField` has no base-field functoriality.
- The QFI discriminant's Gram-determinant description was credited to a declaration about the
  determinant of an orthogonal transformation.

In the other direction, the audit declared absent results whose substance is already in Mathlib:
the uniformizer predicate for a local field, the Galois conjugation equivariance behind conjugate
fields, and the split and nodup criteria behind root enumerations.

Later batches should read each cited statement's conclusion against the milestone, and not only
its name. They should also grep Mathlib's general theory, not only the roadmap's own vocabulary,
before writing "absent".
