# RT-AUDIT-09: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #4004, job FIX-RT-AUDIT-09).
- Findings: `RT-AUDIT-09.result.json`.
- Verdicts: `RT-AUDIT-09.review.json`.
- **Scope.** The red team made 23 findings. The review confirmed 16 and rejected 7 (/6, /17–/20, /22, /23). This job covers the seven confirmed findings of medium severity: /1–/5, /7 and /8. The nine confirmed low-severity findings are outside the fix job (PROTOCOL.md section 17).

**Where the changes are.** Findings /1–/4 are applied in `research/blueprint/audit/AUDIT-09.result.json`; nothing else is edited. The review redirects /5, /7 and /8 away from the audit to the draft roadmap MordellLawrenceVenkatesh. That file belongs to another job (#10, submitted), so those three are recorded below as maintainer notes rather than edits.

**Verification.** I read every added declaration at Mathlib 082e2d3 / Tau Ceti f790474, at the stated file and line, and each one resolves in the pinned `declarations.tsv` under the stated full name. Every target still has at most five declarations. The audit's `review` object and all verdicts are unchanged.

## RT-AUDIT-09/1 (medium, library-claim): End(E) is not a ring in Tau Ceti (CM.5)

In the target "Endomorphism-ring verification as a separate certificate":
- **Citations added.** `TauCeti.Isogeny.Hom.add_comp` (TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Add.lean:282, related) and, as the review asks, `TauCeti.AlgebraicGeometry.AbelianVariety.End` (TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:83, related).
- **Note.** It is replaced with the finding's text: `Isogeny.Hom W W` is a monoid with zero and an additive group, and only right distributivity is proved, so End(E) is not a ring. The note adds the review's warning: Tau Ceti's ring `AbelianVariety.End`, with `instRing` at :168, is for abstract abelian varieties, and no Weierstrass curve is made an `AbelianVariety` at this baseline, so it is not End(E).
- **Library value.** Stays `absent`.

## RT-AUDIT-09/2 (medium, library-claim): the number-field input to the Morse criterion (IG.6)

In the target "Exported checked polynomials, field extensions, cover maps and Galois-group isomorphisms…":
- **Citations added.** `NumberField.iSup_inertia_eq_top` (TauCeti/NumberTheory/NumberField/Inertia.lean:234) and `Polynomial.X_pow_sub_X_sub_one_irreducible_rat` (Mathlib/RingTheory/Polynomial/Selmer.lean:69), both related.
- **Citations displaced.** To stay within five, `IsCyclotomicExtension.Rat.galEquivZMod` and `Polynomial.Monic.isSquare_discr_iff_range_le_alternatingGroup` leave the list. Both remain cited, with file and line, in the note. `galEquivZMod` is also still a declaration under IG.4.
- **Note.** The parenthetical is replaced as the finding asks. Tau Ceti proves the number-field input, and only its composition with the Morse criterion is unstated. Gal(X^n − X − 1) = S_n is absent; Mathlib proves only irreducibility.
- **Library value.** Stays `partial`.

## RT-AUDIT-09/3 (medium, library-claim): field-level regularity (IG.5)

In the target "Hurwitz moduli spaces with braid/Nielsen-class components, descent and specialization to regular extensions":
- **Citations added.** `TauCeti.algebraicClosure_eq_bot_iff_isIntegrallyClosedIn` (TauCeti/FieldTheory/FunctionField/ConstantField.lean:95) and `TauCeti.finrank_constantCompositum_eq_finrank_of_isSeparable` (TauCeti/FieldTheory/FunctionField/GeometricDegree.lean:251), both related.
- **Note.** The clause is rewritten with the review's adjustment. Mathlib's geometric integrality of Spec F → Spec k is regularity in every characteristic, but has no bridge to field extensions, and the note no longer calls it a lesser fallback. The field-level content is also available: `IsIntegrallyClosedIn k F`, identified by Tau Ceti with algebraicClosure k F = ⊥. Tau Ceti's theorem gives the degree form [F·k′ : F] = [k′ : k] of linear disjointness. In characteristic 0 the predicate is regularity, and BelyiMaps layer 9 uses it as its exact-constants hypothesis.
- **Library value.** Stays `absent`.

## RT-AUDIT-09/4 (medium, duplicate): PolynomialGaloisGroups layer 6 (IG.4, IG.6)

I added `tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-6-transitive-subgroups-of-sₙ-for-n--5-and-the-label-predicates` to the `duplicates` of both layers, with the review's narrowed notes:
- **IG.4.** The layer realizes explicit low-degree instances (C₃, C₄, D₄, C₅, D₅) over ℚ, not IG.4's general cyclic and dihedral families.
- **IG.6.** The note does not say "certificates for every transitive group of degree ≤ 5". It says: HasGaloisLabel classification in degrees 3–4, sound quintic certificates in degree 5, and worked realizations over ℚ of every transitive group of degree 4 and 5 and of C₃ and S₃.

## RT-AUDIT-09/5, /7 and /8 (medium, duplicate): redirected to the draft MordellLawrenceVenkatesh roadmap; no audit edit

The review confirms all three overlaps. For each, it redirects the fix away from AUDIT-09, for two reasons:
- **The entry would be dropped.** MordellLawrenceVenkatesh is a draft (`status: draft`, review `needs_changes`) and is not in `data/atlas.json`. `scripts/merge_library_audit.py` keeps a `duplicates` entry only if its layer is an atlas stage (I checked the filter: `d.get("layer") in stage_ids`). An entry in AUDIT-09 would therefore never reach `data/library-coverage.json`.
- **The later proposal must import.** Under PROTOCOL.md section 15, the later proposal imports what an existing roadmap plans.

`research/blueprint/roadmaps/MordellLawrenceVenkatesh.json` is the deliverable of another job (#10, state `submitted`). This job may edit only the files the findings name, so I did not edit it. **For the maintainer (or the LV revision after REV-DESIGN-LV):**
- **/5, LV.8.** LV.8's `requires` has IG.0, IG.1 and IG.3 but not IG.5 or RP.4.
  - LV.8 should import IG.5's Hurwitz moduli with Nielsen-class components and descent, rather than rebuild them: add `InverseGaloisAndArithmeticFundamentalGroups:IG.5` to LV.8's `requires`.
  - It should import the Parshin covering construction of `HeightsRationalPointsAndObstructions:RP.4`, or a restructuring should settle who owns the Parshin / Kodaira–Parshin construction.
  - The review notes that LV.8's Hurwitz space is not plainly a case of IG.5's. LV.8 covers a fixed genus-g curve with one moving branch point; IG.5 is aimed at regular realizations over P¹. The import should say which part of IG.5 LV.8 uses.
- **/7, LV.3.** LV.3 plans Strassmann's theorem, with packet node `MordellLawrenceVenkatesh:LV.3/strassmann`. The only atlas stage that plans a residue-disc zero bound is `EffectiveDiophantineMethods:ED.4`. Name one owner, ED.4 or a general owner of p-adic power series, and have LV.3 import it (a restructure entry in the LV packet, or a revision of LV.3).
- **/8, LV.1.** LV.1 plans Faltings's finiteness lemma: Brauer–Nesbitt with the Faltings–Deligne finite test set. This is the finite-Frobenius-data step of `FaltingsFinitenessAndIsogenyTheorems:R28.5`, and the accepted RS-06 already makes R28.5 its owner ("Own finite Frobenius-data isogeny-class finiteness"). State the lemma once, in LV's general form for semisimple representations, in R28.5 (or another owner the maintainer chooses), and have LV.1 import it. LV.1 already requires R28.1 but not R28.5.
- **When LV is promoted.** Once LV is promoted into the atlas, the audit entries these findings proposed become mergeable: LV.8 under IG.5 and RP.4, LV.3 under ED.4, and LV.1 under R28.5. A later audit of LV should record them.

## Checks

- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-09.result.json`: 0 problems. The file parses, and every target has at most five declarations.
- Every declaration added resolves in the pinned `declarations.tsv` as (library, name, file, line). The PolynomialGaloisGroups layer-6 id is an atlas stage (`research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_PolynomialGaloisGroups.json`).
- Every text substitution was asserted to match exactly once. The diff touches only the four targets and two `duplicates` lists named above.
- No Lean file is involved, so nothing was compiled.
