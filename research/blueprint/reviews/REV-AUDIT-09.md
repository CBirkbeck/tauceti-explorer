# Review of AUDIT-09

**Reviewer:** REV-AUDIT-09 · **Date:** 2026-09-16 · **Verdict:** `accepted` · **Corrections:** 61
(18 to citations or notes, 13 layer verdicts, 22 added duplicates, 1 removed duplicate, 1 duplicate
note, 6 summary edits). **No target status changed.**

Batch: `research/blueprint/audit/AUDIT-09.json`. It covers five roadmaps:
ComplexMultiplicationAndExplicitReciprocity, EffectiveDiophantineMethods,
FaltingsFinitenessAndIsogenyTheorems, HeightsRationalPointsAndObstructions and
InverseGaloisAndArithmeticFundamentalGroups. That is 34 layers, 136 targets, 273 citations and 83
duplicates. Baseline: tauceti `f790474`, mathlib `082e2d3`. The roadmap documents contain their layer
texts word for word. Their other sections (scope, sources, completion contract and, for Faltings, an
implementation handoff with acceptance conditions) were read as well.

## What was checked

**Citations: all 273.** They name 231 distinct declarations in 178 files.
- Every one is at the claimed library, file and line.
- Every full name was recomputed from the `namespace`/`section`/`end` structure of its source file,
  and all are correct.
- Two are not in the pinned index as cited, and in both cases the audit is right and the index is
  wrong:
  - `fermatLastTheoremFour` is absent from the index.
  - `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` is indexed without its
    `TauCeti.` prefix.
- No citation is `private`, and every cited instance is explicitly named.
- The only `sorry` tokens in cited files sit in a TODO comment block of
  `Mathlib/GroupTheory/FiniteAbelian/Basic.lean`.

**Statements.** Every citation was opened and read against its target, together with its `variable`
lines and hypotheses. Two fit labels were wrong:
- `Projectivization.mulHeight` is the height over a fixed field, not the absolute height.
- `NonemptyInterval.div_mem_div` is division in ordered groups and does not apply to ℚ or ℝ.

The presence claims that carry weight hold:
- Mathlib's ℘-function file is sorry-free and stops at ℘′² = 4℘³ − g₂℘ − g₃.
- `autGroupMulEquiv` gives Aut E ≅ ℤ/2 for j ∉ {0, 1728}.
- `selmerGroup₂` and the rank bound `pow_rank_le_card_of_range_μ_le` exist for any finite S ⊇ im μ,
  and Mordell–Weil over number fields is proved.
- The canonical height satisfies the exact parallelogram law.
- Mathlib has the SGA 1 theory of Galois categories.
- Tau Ceti has permutation triples, dessins and the combinatorial genus.
- Mathlib has Weierstrass preparation over complete local rings, and Tau Ceti has the Gauss-norm
  Strassmann index.
- Mathlib's Brauer group of a field is as described, and Tau Ceti makes it a group with
  Br(ℝ) ≅ ℤ/2.

**Absences.** Every absent or partial target was searched again. Each search went by concept, under
Mathlib naming conventions and synonyms, over the index and both source trees, with output saved and
read in full. The reviewer re-ran a sample of the load-bearing searches with case-sensitive patterns.

No status changed. None of the following exists in either library:
- CM: a CM type or reflex norm; an order of a number field other than ℤ[θ]; the modular j-function
  (Tau Ceti's ModularForms roadmap plans it, but it is not in the baseline); a Hilbert, ring or ray
  class field; a Hecke character or infinity type; a Tate module; a supersingular predicate or
  isogeny graph.
- Effective methods: LLL or a Sturm sequence; a p-adic logarithm; an S-unit, Thue or Siegel theorem;
  Sha; a Chabauty or Coleman integral.
- Faltings: a Faltings height; p-divisible groups; Néron models; Zarhin's trick; Jordan–Zassenhaus
  beyond rank one; Shafarevich finiteness.
- Heights and obstructions: adelic points of schemes; the Brauer–Manin pairing; Hasse–Minkowski;
  Parshin's construction; Mordell–Lang, Manin–Mumford or Bogomolov.
- Inverse Galois: an étale π₁; Hilbert irreducibility; Riemann existence; Belyi's theorem; embedding
  problems; Hurwitz spaces.

Several notes misstated what exists. They are corrected below.

**Verdicts.**
- **The three `process` layers hold.** CM.6 is exports, documentation and examples, RP.6 is interfaces
  and a register of conjectures, and IG.6 is export, consumption and a solved-family list.
- **The `partly built` verdicts did not follow the rule.** The audit instructions say `partly built`
  means at least one target is present and one missing, and `built` means no target is partial or
  absent. REV-AUDIT-03 recorded the same convention. 13 of the 14 `partly built` layers had only
  partial and absent targets, and are now `not built`: CM.0, CM.1, ED.0, ED.2, ED.3, R28.1, RP.0,
  RP.1, RP.2, RP.3, IG.1, IG.3, IG.4.
- IG.0, whose Galois-category target is in Mathlib, stays `partly built`.
- After review the batch has 1 `partly built`, 30 `not built` and 3 `process` layers.

**Duplicates.**
- All 83 listed layers are live, unretired layers of other roadmaps, and each was read.
- DT.4 was removed from ED.1. DT.4 hands lattice reduction to ED.2 and states none of ED.1's targets;
  it stays listed for ED.2.
- The NC.0 note at IG.0 now names the real overlap, which is base-point change.
- Declared supplier or consumer links whose notes say so were kept, following REV-AUDIT-08: R28.1 →
  R35.5, R28.2 → R11.6, R28.4 → R01.6, R28.5 → RP.4 and IG.1 → NC.0.
- The whole atlas was searched for other owners of each layer's targets, including reverse links
  recorded in AUDIT-01 to AUDIT-12. 22 were missing and are added.

## Corrections

**Citations and notes (18).**

| Layer | Target | Correction |
|---|---|---|
| CM.0 | orders, conductor | `RingOfIntegers.exponent θ` is `absNorm (under ℤ (conductor ℤ θ))`, the least positive integer in the conductor, not the conductor's norm (for ℤ[fω] it is f, not f²). |
| CM.2 | ideal/idele reciprocity | The note said Tau Ceti's Artin map comes with "no kernel or reciprocity statement". For the genus field of a quadratic field it does: `artinHomAway_candidateGenusField_eq_one_iff` (kernel = square narrow classes, now cited) and `artinHomAway_candidateGenusField_surjective`. Still absent. |
| CM.3 | class polynomial | Mathlib has `ModularForm.discriminant` (Δ = η²⁴), `discriminant_ne_zero` and `discriminant_eq_E₄_cube_sub_E₆_sq` (Δ = (E₄³ − E₆²)/1728), so j = E₄³/Δ is one definition away. Cited; still absent. |
| CM.3 | ring class field | The note's "compatibly with the Artin map" was true but cited only the sign-pattern isomorphism, whose docstring says the Artin identification "is not proved here". The proof is `autCandidateGenusFieldEquivNarrowElementaryTwoQuotient_artinHomAway` (Relative/Artin.lean:345). Cited. |
| ED.0 | error bounds | Interval multiplication and division need monotone multiplication or an ordered group; Interval/Basic.lean:124 and 370 say they "do not apply to ℚ or ℝ". `div_mem_div` becomes related. Mathlib's `Data/FP` floats are `unsafe` and have no theorems about them. |
| ED.1 | short-vector certificates | "No statement that no nonzero lattice vector lies in a region" was false. Mathlib has `ZLattice.le_norm_of_le_abs_repr`, with a non-explicit `normBound`, and `NumberField.one_le_house_of_isIntegral`. Cited; still absent, since there is no checkable certificate. |
| ED.5 | combination certificate | "No group structure of E(𝔽_q)" was false: Mathlib's `AddCommGroup W.Point` holds over any field (`Point.add` cited). What is missing is the ℤ/m × ℤ/mn structure. |
| R28.1 | moduli points → isomorphism classes | The genus-one shadows are now cited: `exists_variableChange_of_j_eq` (Mathlib) and the quadratic-twist descent `exists_smul_eq_or_exists_smul_eq_quadraticTwist` (Tau Ceti). Still absent. |
| R28.2 | isogeny-height estimate | "Finite locally free group schemes are the only related material" was false. `TauCeti.Isogeny.degree` and `pullbackDifferential_invariantDifferential` are cited, as REV-AUDIT-08 did at R35.4. |
| R28.2 | p-divisible groups | `WeierstrassCurve.formalGroup`, the formal group over any ring, is cited. Still absent. |
| R28.5 | semistable-extension reduction | "Only the combinatorics of numerical types" was false. `TauCeti.Model` (models over a DVR) and `TauCeti.FiniteDVRExtension` are cited. Still absent. |
| RP.0 | absolute heights | `Projectivization.mulHeight` changed from exact to special case: it is not normalised by [K:ℚ]. The Mathlib Northcott TODO is for projective points over a fixed field. |
| RP.0 | height machine | `SchemeWeilDivisor.toInvertibleSheaf` needs dimension ≤ 1 and DVR codimension-one stalks, not just "integral Noetherian". |
| RP.3 | finite étale descent | "No finite étale covers of a scheme" was false: Mathlib has `AlgebraicGeometry.IsFinite` and `Etale`. What is missing is their Galois theory and descent. |
| IG.0 | finite étale Galois category | `FiniteEtale.equivOfIsSepClosed` is an equivalence only for finite étale Ω-algebras. Mathlib also has `Scheme.pointSmallEtale`, the fibre functor X ↦ Hom_S(Spec Ω, X), now cited. |
| IG.0 | π₁(Spec K) | `Algebra.Etale.iff_exists_algEquiv_prod` moved here from the target above, where it made room for `pointSmallEtale`. |
| IG.5 | Hurwitz spaces | "No regular-extension notion" was too strong: Mathlib has `AlgebraicGeometry.GeometricallyIntegral` (cited). |
| IG.6 | exported Galois groups | Mathlib's Morse-polynomial S_n criterion `Splits.surjective_toPermHom_of_iSup_inertia_eq_top` is cited in place of the X⁵ − X − 1 factor-degree lemma. Its number-field case is still a TODO. |

**Added duplicates (22).**

| Layer | Added | Overlap |
|---|---|---|
| CM.3 | ModularForms layer 0 | owns j = E₄³/Δ, its invariance, q-expansion and orders at ρ and i |
| ED.4 | ColemanIntegration:L0 | the unique primitive on a disc (residue-disc integrals) |
| R28.2 | R07.1 | defines p-divisible groups, the R07 input R28.2 names |
| R28.3 | R07.1 | finite-flat closure of a generic subgroup and divisible groups |
| R28.5 | R25.3 | no abelian variety over ℚ with everywhere good reduction |
| RP.0 | GZ.2 | local height decomposition and Faltings–Hriljac for Jacobians |
| RP.1 | GZ.1 | general Mordell–Weil "through weak descent and the height argument" |
| RP.1 | NC.3 | depth-one Kummer/Selmer agreement; the reverse link was accepted in REV-AUDIT-08 |
| RP.2 | GlobalQuadraticForms layer 5 | Hasse–Minkowski, the conic test |
| IG.0 | ModularCurves 0D | finite étale K-schemes ≃ finite continuous Gal(Kˢ/K)-sets |
| IG.1 | BelyiMaps layer 12 | 1 → π₁ᵍᵉᵒ → Gal(Ω/ℚ(t)) → Gal(ℚ̄/ℚ) → 1, inertia subgroups, tame character |
| IG.1 | LPV.1 | tame/wild inertia and t_ℓ : I → ℤ_ℓ(1) |
| IG.1 | AlgebraicCurves layer 8 | decomposition/inertia and G₀/G₁ cyclic prime to p (the layer behind the cited `Place` declarations) |
| IG.1 | FA.3 | decomposition/inertia and lower/upper ramification filtrations for function fields |
| IG.1 | R01.2 | decomposition groups by restriction and tame characters |
| IG.1 | LocalFieldsRamification layer 2 | Gal(K^ur/K) ≅ Ẑ with Frobenius ↦ 1 |
| IG.3 | BelyiMaps layer 0 | permutation triples, relabeling, genus (the declarations cited as exact) |
| IG.3 | BelyiMaps layer 2 | dessins ↔ triples bijection |
| IG.3 | BelyiMaps layer 5 | π₁ of the thrice-punctured sphere ≅ F₂ on the peripheral loops |
| IG.3 | BelyiMaps layer 7 | compactification to topological branched covers |
| IG.3 | BelyiMaps layer 9 | algebraic Belyi pairs, algebraization, comparison contract |
| IG.6 | BelyiMaps layer 11 | Galois conjugation of Belyi pairs, field of moduli versus definition |

The five roadmap summaries were aligned with these corrections (6 edits). The full `was`/`now`/`why`
of every correction is in the `review` object of `AUDIT-09.result.json`.

## Most important finding

**13 of the 14 `partly built` layers had nothing fully built.** Their targets were all partial or
absent. The audit's own instructions define `partly built` as "at least one target is present and
one is missing", and most audits in the atlas follow that rule. After correction only IG.0 is
`partly built`, so the batch reads as 30 `not built` layers rather than 17. The partial material
itself is still recorded, target by target.

The most significant library content the audit missed is in Tau Ceti. It proves Artin reciprocity for
the genus field of a quadratic field: the Artin map is surjective, and its kernel is the ideals whose
narrow class is a square (`CandidateGenusField/Relative/Artin.lean`). CM.2 said no such kernel or
reciprocity statement exists. CM.3 cited only an isomorphism whose own docstring says the Artin
identification "is not proved here"; the proof is in a separate file.

Process points for later batches:
- **`index_declarations.py` counts `/-` inside a line comment as the start of a block comment.** In
  `Mathlib/NumberTheory/FLT/Four.lean` the comment `-- r = +/- j ^ 2` (line 229) makes it skip the
  rest of the file, so `not_fermat_42`, `fermatLastTheoremFour` and
  `FermatLastTheorem.of_odd_primes` are missing. Eleven other files have `/-` inside a line comment,
  and may lose declarations the same way.
- **The index drops the enclosing namespace when `namespace` or `end` has its name on the next
  line.** The bare `end` at `CartierDuality/FiniteLocallyFree.lean:217` closes `TauCeti`, which is how
  `cartierDuality` lost its `TauCeti.` prefix.
- **A docstring's "not proved here" is local to its file.** Search the declaration's uses before
  recording the property as absent.
