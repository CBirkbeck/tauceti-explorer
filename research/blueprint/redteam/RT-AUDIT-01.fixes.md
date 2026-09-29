# RT-AUDIT-01: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #3997, job FIX-RT-AUDIT-01).
- **Findings and verdicts.** `RT-AUDIT-01.result.json` and `RT-AUDIT-01.review.json`. The red team made 54 findings: 2 high (/1, /2), 13 medium (/3–/15) and 39 low (/16–/54). The review confirmed 52 and rejected 2 (/36 and /42, both low).
- **Scope.** The 15 confirmed high and medium findings (/1–/15) are fixed here. The 37 confirmed low findings are out of scope for this job and are not applied; neither are the two rejected findings.
- **Where the changes are.** Everything is in `research/blueprint/audit/AUDIT-01.result.json`; no other file changes. The audit's `review` object is unchanged.
- **Verdict and library-value changes.**
  - ComplexComparisonPartII C6 goes from `process` to `not built` (/1).
  - AlgebraicCurves 12C acceptance target goes from `absent` to `partial` (/2). Layer 12 stays `partly built`.
  - Every other layer verdict and library value is unchanged.

**Verification.**
- I read every added declaration at Mathlib 082e2d3 / Tau Ceti f790474, at the stated file and line, and each one resolves in the pinned `declarations.tsv` under the stated full name, library, file and line. Every file:line locator written into a note was also read at the pinned commit.
- **Line corrections.** None were needed: every line given by the findings and the review is the declaration line. The Tau Ceti theorem cited for /12 is `IsIntegralClosure.finite_of_polynomial_model` (namespace `IsIntegralClosure` only, not `TauCeti.`), as the finding says. The AUDIT-01 review said `isDedekindDomain_iff_isDiscreteValuationRing_atPrime` was missing from `declarations.tsv`. The pinned index now lists it at `Mathlib/RingTheory/DedekindDomain/Dvr.lean:129`.
- **Five-citation cap.** One citation was displaced (/13). Every target has at most five declarations.
- **Duplicates.** Every added `duplicates` layer id is a stage in `data/atlas.json`.

## RT-AUDIT-01/1 (high, error): C6 is mathematics (ComplexComparisonPartII)

**Verdict.** `process` → `not built`.

**Justification.**
- The finding: "The verdict should be 'not built': it is mathematics, and none of its eight targets is present (three partial, five absent)."
- The review: "These are mathematics, not process. Its eight audit targets are five absent and three partial … Set C6 to not built, retaining all targets."
- The script asserted the target mix (five `absent`, three `partial`). By the audit convention in `make_audit_jobs.py`, "partly built" means that at least one target is present, so `not built` is right.

**Targets.** All eight are kept unchanged. The optional note change was not needed, because the eighth target's note already begins "Interface requirement on the exports of C2-C5".

## RT-AUDIT-01/2 (high, library-claim): the place clause of 12C (AlgebraicCurves Layer 12)

**Target "12C acceptance: … the place at O₁ restricting to the place at O₂".** `absent` → `partial`.

**Citations added.** The two existing citations are kept, and the target now has four:
- `TauCeti.Isogeny.isEquiv_comap_infinityPlace` (InfinityPlace.lean:146).
- `TauCeti.CoordinatePullback.mapsInfinity_iff_isEquiv_comap_infinityPlace` (InfinityPlace.lean:219).

**How the review shaped the fix.** The finding proposed fit `exact`. The review says the fit is exact only for the place clause, and should be special case or related when measured against the whole target. Audit fits are measured against the target, so both are cited as `related`. The note says that they prove exactly the place clause.

**Note.** The note is replaced by the finding's text, with the review's qualification:
- The places at infinity are Mathlib valuations, not `TauCeti.Place`, so this is not a `TauCeti.Place` dictionary.
- Neither ellipticity nor separability is assumed.
- Missing: the scheme morphisms and their correspondence with isogenies, which need 12B–12C.

**Layer verdict.** Layer 12 stays `partly built`, as the finding says: it already has `both` and `tauceti` targets as well as missing ones.

## RT-AUDIT-01/3 (medium, library-claim): higher direct images (A0-extension)

**Target "Proper-flat coherent cohomology and cohomology-and-base-change beyond curves …".**
- **Citation added.** `CategoryTheory.Functor.rightDerived` (Abelian/RightDerived.lean:109, related). The target now has four.
- **Note.** The first sentence is kept. The blanket "There are no higher direct images" is replaced:
  - R^i f_* is `(Scheme.Modules.pushforward f).rightDerived i`. This works because `X.Modules` is Grothendieck abelian (Modules/Sheaf.lean:52), so it has enough injectives, and pushforward is additive (Sheaf.lean:198).
  - Rf_* on D⁺ is `Functor.rightDerivedFunctorPlus` (DerivedCategory/RightDerivedFunctorPlus.lean:36), once derived-category instances are chosen.
  - The remaining gaps are unchanged: no finiteness for proper morphisms, no base-change map, no semicontinuity, no Tor-amplitude and no perfect complexes. The README assumption is still recorded.
- **Library value.** `absent`. As the finding allows, the construction is not counted, since no statement about coherence or base change exists.

**How the review shaped the fix.** Per the review, the note says there is no *scheme-specific* API beyond the generic derived-functor API, rather than "no API", and it adds the derived-category instance caveat for Rf_*.

**Layer verdict.** A0-extension is unchanged.

**Maintainer note.** The ComplexComparisonPartII roadmap summary also lists "higher direct images" among missing algebraic tools. By the same instantiation this is overstated. The finding names only the A0-extension note, so I did not edit that summary; it should be qualified in the same way.

## RT-AUDIT-01/4 (medium, library-claim): group-scheme actions (R09.4)

**Target "Quotient stacks and their algebraicity".** The target stays `absent`.

**Citations added.** The target now has three:
- `CategoryTheory.ModObj` (Monoidal/Mod.lean:59, related).
- `TauCeti.CommHopfAlgCat.isPullback_fppfQuotientTorsor` (Fppf/Quotient/Torsor.lean:372, related).

**Note.** The note is rewritten:
- Group-scheme actions are `ModObj G X` for a `GrpObj G` in the cartesian monoidal category `Over S` (AlgebraicGeometry/Pullbacks.lean:711). Mathlib already treats group schemes as `GrpObj` in `Over S` (Group/Abelian.lean:132).
- Such an action induces `MulAction` on generalised points (Monoidal/Cartesian/Mod.lean:62).
- There is no scheme-specific API.
- There are no quotient stacks, stacks of torsors or algebraicity statements.

**How the review shaped the fix.** Per the review, the Tau Ceti torsor theorem keeps its hypotheses in the note: a normal Hopf ideal I, and the sheafified fppf quotient projection G → G/V(I) of an affine group.

## RT-AUDIT-01/5 (medium, duplicate): PEL verification of the Artin inputs (A0-extension)

**Duplicates added to A0-extension.**
- `PELModuli:M2` and `HilbertModularVarietiesAndShimuraCurves:H1`, with the finding's notes.
- Each note adds that the check belongs to that stage, with A0-extension as supplier of the criterion.

**Target "Verification of the Artin inputs in every PEL application".** The note adds the following. The library value stays `absent`.
- M2 and H1 plan this verification for their own moduli problems.
- AbelianSchemesAndArithmeticModuli A0 assigns it to the consuming milestone.
- So the application checks belong to M2 and H1, and this layer supplies only the criterion.

**How the review shaped the fix.** The review says to "route the application checks to M2/H1, not duplicate their proofs in A0-extension". The producer/consumer boundary is therefore stated explicitly. AbelianSchemesAndArithmeticModuli A0 is named only in the note, not as a duplicate, because it assigns the work rather than planning it.

## RT-AUDIT-01/6 (medium, duplicate): the Artin criterion planned twice (A0-extension, R09.6)

**Duplicates added to A0-extension.**
- `AlgebraicModuliForArithmeticGeometry:R09.6`.
- `SchemeAndStackFoundations:SF.4`, with the finding's note.

**Duplicates added to R09.6.** `AlgebraicModuliForArithmeticGeometry:A0-extension`.

**R09.6 target "Artin representability with its hypotheses and a proof".** The note adds: "A0-extension, which proves the criterion, is the natural assigned supplier; R09.6 should import it rather than prove it again." The library value stays `absent`.

**How the review shaped the fix.** The review says that the missing edge alone does not prove duplication, and that R09.6 already allows "a proof or an assigned supplier". The two new entries between A0-extension and R09.6 therefore name A0-extension as the supplier. They do not describe two mandatory independent constructions.

**Not done here.** The matching SF.1 and SF.4 entries belong to /29, which is low severity and out of scope.

## RT-AUDIT-01/7 (medium, library-claim): the diagonal criterion (SF.1)

**Target "Representable morphisms of sheaves on Sch and representable diagonals".**
- **Citation added.** `CategoryTheory.Functor.relativelyRepresentable.diag_iff` (MorphismProperty/Representable.lean:670, more general). The target now has five.
- **Note.** The last sentence is replaced by the finding's text, with `of_diag` located at Representable.lean:588. Missing: the diagonal of a stack and its use to define algebraic spaces and stacks.
- **Library value.** `partial`.

**How the review shaped the fix.** Per the review, the note adds that this is a criterion, not a theorem that a given sheaf has a representable diagonal.

## RT-AUDIT-01/8 (medium, library-claim): ring-level normalization of curves (SF.4)

**Target "Resolution of singularities in a named proved setting (e.g. curves via normalization)".**
- **Citations added.** The target now has five:
  - `TauCeti.IsIntegralClosure.isDedekindDomain` (DedekindDomain/IntegralClosure.lean:90).
  - `isDedekindDomain_iff_isDiscreteValuationRing_atPrime` (DedekindDomain/Dvr.lean:129).
- **Library value.** `partial`.

**How the review shaped the fix.** The review asks for a narrower fix than the finding's wording.
- The note does not say that "the affine, ring-level form of normalization resolving curves is present". It calls these results the ring-level ingredients:
  - Tau Ceti proves the Dedekind property with no separability. Mathlib's version at Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean:220 assumes separability.
  - The result is Noetherian with DVR localizations at nonzero primes, of dimension at most one in general and exactly one for a curve.
- The note says that these are not a resolution theorem. Identifying a curve's normalization with this integral closure, its module finiteness (which the inseparable Tau Ceti theorem does not give) and the scheme comparison need their own bridges.
- For the same reason, both citations are `related`, where the finding proposed `special case` for the Tau Ceti theorem.

**Missing.** Kept as in the finding: a scheme-level regular/normal predicate, the scheme-level statement for curves, and surfaces.

## RT-AUDIT-01/9 (medium, duplicate): SF.3's AlgebraicCurves owners

**Duplicates added to SF.3.** AlgebraicCurves Layer 8, Layer 10 and Layer 3, each marked "Supplier" and carrying the finding's note. The review calls them "three precise suppliers".

**Existing Layer 4 entry.** Its note is corrected to "Owns repartitions, Weil differentials, the canonical class, duality and Riemann–Roch."

**Unchanged.** The review says to keep the function-field-to-scheme comparison as separate work. It stays in the existing Layer 12 entry.

## RT-AUDIT-01/10 (medium, duplicate): DVR models (SF.4)

**Duplicate added to SF.4.** StableReduction Layer 0, marked "Supplier", as the review asks ("Add the supplier link").

**Note.** The finding's note, with "this target" made precise as "this layer's DVR-model target", since duplicates are recorded per layer.

**Unchanged.** The target "Models over a DVR …" stays `partial`.

## RT-AUDIT-01/11 (medium, duplicate): resolution and blowups (SF.4)

**Duplicates added to SF.4.** Each is marked "Supplier" and carries the finding's note:
- `AlgebraicModuliForArithmeticGeometry:R09.7`.
- `AlgebraicModuliForArithmeticGeometry:R09.7a`.
- StableReduction Layer 4.

**How the review shaped the fix.** The review says not to merge the distinct characteristic-zero and arithmetic-surface hypotheses. The R09.7 note therefore adds "with its own hypotheses", and the StableReduction Layer 4 note adds "under that stage's arithmetic-surface hypotheses".

## RT-AUDIT-01/12 (medium, duplicate): finite normalization (AlgebraicCurves Layer 2, A0-extension)

**Duplicates.**
- AlgebraicCurves Layer 2 gets `AlgebraicModuliForArithmeticGeometry:A0-extension`, with the finding's note.
- A0-extension gets the reciprocal entry for AlgebraicCurves Layer 2.

**How the review shaped the fix.** Per the review, neither note makes the curve roadmap wait for the excellence theorem. Both say that Layer 2 may prove its one-dimensional case directly, and that the general theorem should reuse it through an explicit comparison.

**A0-extension target "Finite normalization under excellence".** The optional citation is added: `IsIntegralClosure.finite_of_polynomial_model` (IntegralClosure/FinitePolynomialModel.lean:141, special case). The target now has five.
- Its note records what the theorem proves. The integral closure of R in L is a finite R-module when L is finite separable over F(x) for some x ∈ L integral over R.
- The library value stays `partial`.

## RT-AUDIT-01/13 (medium, error): the completion at every place (AlgebraicCurves Layer 5)

**Target "Completion comparison at each place …".** The target stays `partial`.

**Five-citation cap.** The target already had five citations, and the review says to respect the cap. So:
- `Valuation.Completion` (Valued/WithVal.lean:477, related) replaces `IsDedekindDomain.HeightOneSpectrum.adicCompletion`, which is displaced to the note as (Mathlib/RingTheory/DedekindDomain/AdicValuation.lean:602). The finding itself says adicCompletion only wraps `Valuation.Completion`.
- The finding's other two proposed citations go in the note as locators rather than as declarations:
  - `Valued.valuedCompletion_apply` (Valued/ValuedField.lean:566).
  - `RatFunc.CompletionAtInfty` (RatFunc/Valuation.lean:138).
- The four Tau Ceti citations are kept, because they are the evidence for the partial status.

**Note.** The "Missing:" sentence is replaced:
- Mathlib already attaches a completion to every place, with no model: `P.valuation.Completion`, whose extended valuation restricts to v_P.
- The review's correction is applied: the completed valuation ring is compared with the *completion* of 𝒪_P (which is generally not complete), through the dense injective map, not identified with 𝒪_P itself.
- What remains missing is that comparison, the maximal ideal with the valuation-filtration description of its powers, the residue-field equivalence with F_P, and preservation of a chosen uniformizer.

## RT-AUDIT-01/14 (medium, library-claim): the different of a compositum (AlgebraicCurves Layer 8)

**Target "Unramified in both F₁, F₂ ⟹ unramified in F₁F₂ and in the Galois closure (Cor. 3.9.3)".** The target stays `absent`.
- **Citations added.** The target now has four, both `related`:
  - `IsDedekindDomain.differentIdeal_dvd_map_differentIdeal` (DedekindDomain/LinearDisjoint.lean:83).
  - `IsDedekindDomain.differentIdeal_eq_differentIdeal_mul_differentIdeal_of_isCoprime` (LinearDisjoint.lean:130).
- **Note.** The note is replaced by the finding's text, with `dvd_differentIdeal_iff` located at Mathlib/RingTheory/DedekindDomain/Different.lean:958.

**How the review shaped the fix.** The review says that linear disjointness alone is not the Lean theorem. Per the review, the note spells out the section hypotheses:
- F₁ ⊔ F₂ = L, with F₁ and F₂ linearly disjoint over K = Frac A, and A integrally closed.
- R₁, R₂ and B Dedekind, with B the integral closure of R₁ in L.
- F₂/K and L/F₁ separable.
- R₂ finite free over A, with F₂ its localization.
- For the product formula, module finiteness of B over A, R₁ and R₂, and separability of Frac B over Frac A.

## RT-AUDIT-01/15 (medium, error): Möbius action and fixed points (AlgebraicCurves Layer 11)

**Target "PGL₂ three-point rigidity".** The target stays `absent`.
- **Citations added.** The existing 2-pretransitivity citation is kept, and the target now has five. All four new citations are `related`:
  - `OnePoint.instGLAction` (OnePoint/ProjectiveLine.lean:126).
  - `Matrix.GeneralLinearGroup.fixpointPolynomial_aeval_eq_zero_iff` (ProjectiveLine.lean:174).
  - `OnePoint.smul_infty_eq_self_iff` (ProjectiveLine.lean:145).
  - `Matrix.GeneralLinearGroup.fixpointPolynomial_eq_zero_iff` (GeneralLinearGroup/FinTwo.lean:233).
- **Note.** The note is replaced by the finding's text, with the PGL action on ℙ(K²) located at Mathlib/LinearAlgebra/Projectivization/Action.lean:247 and the fixed-point polynomial written out.

**How the review shaped the fix.** Per the review, the note gives the correct case split. If g fixes ∞, the quadratic coefficient vanishes and at most one finite point is fixed; otherwise at most two finite points are. The rigidity statement itself (and sharp 3-transitivity) is recorded as missing in both libraries.

**Target "Aut(k(x)/k) ≅ PGL₂(k) …".**
- **Citation added.** `OnePoint.instGLAction` (related). The target now has four.
- **Note.** The note adds: "Mathlib's GL(2,K) acts on OnePoint K by Möbius maps, but not on RatFunc K."
- **Library value.** `absent`.

## Checks

- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-01.result.json research/blueprint/redteam/RT-AUDIT-01.fixes.md`: 0 problems.
- **Edits.** All edits were applied by one script:
  - Each target was located by roadmap, layer and target-text prefix, with the match asserted unique.
  - Each text substitution and each replaced note was asserted to match its original exactly once.
  - The script also asserted: no duplicate layer added twice, at most five declarations per target, the C6 target mix before its verdict change, and an unchanged `review` object.
  - The JSON was re-dumped in its original format (indent 1, no trailing newline). The unedited file round-trips byte for byte.
- **Citations.** Every added citation (17 across the ten targets) resolves in the pinned `declarations.tsv` at the stated file and line, and the source line there is the declaration. The only citation removed is the displaced adicCompletion (/13).
- **Duplicates.** Every added duplicates layer is an atlas stage.
- No Lean file is involved, so nothing was compiled.
