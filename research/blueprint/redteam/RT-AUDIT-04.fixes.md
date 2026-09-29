# RT-AUDIT-04: fixes

Fixer: Claude Code, session `cc-58621d`, 29 September 2026 (issue #3999, job FIX-RT-AUDIT-04).
- Findings: `RT-AUDIT-04.result.json`.
- Verdicts: `RT-AUDIT-04.review.json`.
- This job covers the 26 confirmed findings of high or medium severity (1 high, 25 medium). The 34 low-severity findings do not become fix jobs (PROTOCOL.md section 17) and are not handled here.

The only file changed besides this report is `research/blueprint/audit/AUDIT-04.result.json`. Every declaration I added or kept was read at the pins: Mathlib 082e2d3 and Tau Ceti f790474, the baseline trees and their declaration index. Every layer verdict is unchanged. `data/library-coverage.json` is left for the orchestrator to regenerate.

**Two schema constraints shaped several edits.** The audit format (`make_audit_jobs.py`) allows at most five `declarations` per target, and a `fit` must be one of `exact`, `more general`, `special case` or `related`.
- Where a finding asked for more citations than fit, I kept the five that carry the target. The finding's other declarations are named in the note, with their file lines.
- Where a finding proposed a qualified fit such as "special case (perfect residue field)", I used `special case` and put the qualifier in the note.

**Two Mathlib instances are anonymous.** The pinned index cannot name them, so I took their automatically generated names from a compiled Mathlib whose source files are byte-identical to the pinned ones and whose toolchain is the same (Lean v4.34.0-rc2):
- `NumberField.HeightOneSpectrum.instFiniteAdicCompletionRingOfIntegers`, at `Mathlib/NumberTheory/NumberField/Completion/FinitePlace.lean:522`;
- `Ideal.instNormalSubtypeMemSubgroupStabilizerInertia`, at `Mathlib/RingTheory/Ideal/Pointwise.lean:173`.

## Global number fields

**RT-AUDIT-04/1 (Layer 0, functoriality of local absolute values).**
- **Citations.** Added `NumberField.FinitePlace.equivHeightOneSpectrum_symm_apply_algebraMap` (FinitePlace.lean:478, special case: the finite-place half) and `NumberField.InfinitePlace.comap_apply` (InfinitePlace/Ramification.lean:60). To stay within five, I dropped `InfinitePlace.comap` (which `comap_apply` subsumes) and `completionAlgHom_comp`.
- **Note.** Rewritten as the finding asks.
  - At finite places, Mathlib proves |x|_w = |x|_v^(e·f) for the normalized adic absolute value, which is `normalizedAbsValue (Sum.inl v)` by `rfl`.
  - At infinite places, `comap_apply` with `mult_mul_finrank` gives the exponent [L_w : K_v].
  - Missing: the `Place`-level statement, and the identification of e·f with `Module.finrank (v.adicCompletion K) (w.adicCompletion L)`, which neither library states.
- **Review correction.** In the review block, the correction for this target said "only the passage to normalized absolute values (absNorm w = absNorm v ^ f) is missing". It now says that this passage is also in Mathlib, and it is marked "corrected under RT-AUDIT-04/1".
- **Not changed.** `partial` is kept.

**RT-AUDIT-04/2 (Layer 4, placewise API).**
- **Citations.** Cited Mathlib's general restricted-product API in place of the three weakest citations (`Support.finite`, the bare `RestrictedProduct`, and Tau Ceti's everywhere-integral lemma):
  - `RestrictedProduct.evalRingHom` (Basic.lean:346);
  - `RestrictedProduct.single`, the additive form of `mulSingle` (Basic.lean:483);
  - `RestrictedProduct.isOpenEmbedding_structureMap` (TopologicalSpace.lean:383).

  The Tau Ceti lemma is still named in the note.
- **Note.** It now credits projections, single-place elements and the open integral part. It says that none of this is specialised to `FiniteAdeleRing` and that there is no integral `Subring`; I checked the pinned RestrictedProduct and FiniteAdeleRing files for one.
- **Not changed.** `partial` is kept.

**RT-AUDIT-04/3 (Layer 4, unit group).**
- **Citation.** Added `RestrictedProduct.unitsEquiv` (Units.lean:84, more general).
- **Note.** It now credits the algebraic restricted-product description and the units topology. Missing: that `unitsEquiv` is a homeomorphism, and the topological-group API of the finite ideles.

**RT-AUDIT-04/4 (Layer 8, adele extension maps).**
- **Library.** `absent` → `partial`.
- **Citations.** The target now cites:
  - `RestrictedProduct.mapAlongRingHom` (Basic.lean:458);
  - `RestrictedProduct.mapAlong_continuous` (TopologicalSpace.lean:655);
  - `NumberField.LiesOver.completionMap` (LiesOverInstances.lean:31);
  - Tau Ceti's `adicCompletionExtension_mem_adicCompletionIntegers` (AdicCompletionExtension.lean:393);
  - the existing `completionAlgHom`.

  I checked that `completionAlgHom` is `adicCompletionExtension` as a ring map, so it preserves integers.
- **Note.** It describes the assembly: `finiteAdeleExtension` is `mapAlongRingHom` along `HeightOneSpectrum.under`, whose fibres are finite by `primesOver_finite`, and `infiniteAdeleExtension` is a finite product of `completionMap`. It names what is still missing.
- **Not changed.** The layer verdict stays `not built`, as the finding allows.

**RT-AUDIT-04/5 (Layer 7, duplicates).** Added `ClassFieldTheory#layer-13-norm-theorems-and-class-fields` with the finding's note. I read that stage: it plans `isOpen_raySubgroup` and `finiteIndex_raySubgroup` for the same `RaySubgroup 𝔪`.

**RT-AUDIT-04/6 (Layer 11, maps of orders).**
- **Note.** The sentence endorsing half of the roadmap's warning is replaced. Both `Pic` and `NarrowPic` are induced by an arbitrary ring homomorphism of orders, because such a map is injective and extends uniquely to the fraction fields:
  - its kernel is prime, and a nonzero prime of an order contains a nonzero integer, which cannot map to 0 in characteristic zero;
  - the extension preserves total positivity (`IsReal.comap`).

  So `NumberFieldOrder.Hom` is a packaging, not a necessity.
- **Not changed.** `partial` is kept.
- See the maintainer notes below.

**RT-AUDIT-04/7 (Layer 3, 3C fundamental domain).**
- **Fit.** `fundamentalCone`'s fit is now `related`.
- **Note.** It now says that the cone is a fundamental domain for (𝓞 K)ˣ modulo torsion and is stable under torsion (`torsion_smul_mem_of_mem`). A set meeting each orbit once is a 1/w_K part of it, so the trivial modulus does not recover the cone, and w_K must be divided out of the main term, as Mathlib's count divides by `torsionOrder K`. I read the cone's docstring and `torsion_smul_mem_of_mem` at the pin.
- See the maintainer notes below.

## Global quadratic forms

**RT-AUDIT-04/18 (0.1 tower item).**
- **Library and fits.** The target is now `partial`. `atFinitePlaceBaseChange` is `special case`, and so is `atFinitePlaceBaseChange_tmul`, which states the same finite-place isometry on pure tensors.
- **Citation.** Added `NumberField.InfinitePlace.comap_embedding_of_isReal` (Ramification.lean:92).
- **Note.** It names the missing real-place comparison `atRealPlace (Q.baseChange L) w ≃ atRealPlace Q (w.comap (algebraMap K L))`. I read `CompletionTower.lean`: it has no infinite-place counterpart.
- **Other notes.** The 5.1 quaternary note now says that the field-generic descent has its inputs built, but that its local-to-global use needs the tower at every place and so waits on the real-place comparison. The roadmap summary is corrected in the same way.

**RT-AUDIT-04/19 (discriminant carriers).**
- **3.1.** Mathlib `QuadraticForm.discr` is replaced by `TauCeti.SquareClassGroup` (exact for the discriminant field) and `TauCeti.RegularFormClass.discr`, and `RingHom.squareClassMap` is added.
- **3.1 note.** It now says the structure is absent but every field type is available. Only the structure and its API are missing.
- **Renamed citation.** The kept signature citation was `QuadraticForm.sigPos`. At the pin, Mathlib declares `sigPos` in the root namespace (`Signature.lean:65`, before `namespace QuadraticForm` at :139), so this entry now uses the name `sigPos`.
- **0.1 and 1.1.** `TauCeti.RegularFormClass.discr` is now cited next to Mathlib's `QuadraticForm.discr`. The notes say that the Mathlib declaration is a basis-dependent Gram determinant valued in K, not a square class.
- **2.1.** `QuadraticMap.orthogonalDetSquareClass` (a determinant of isometries, unrelated to the discriminant) is replaced by `TauCeti.RegularFormClass.discr_baseChange` (RegularFormClass/BaseChange.lean:334), and the note has the same caveat.

**RT-AUDIT-04/20 (summary).** The middle of the summary is rewritten.
- **Two missing suppliers.** It now names both, with their pinned names from the roadmap's contract tables:
  - Quadratic Form Invariants: `hilbertSymbol`, `localHasse`, the local classification and `wittRing`;
  - Class Field Theory: `card_ideleClassNormQuotient` with the idele norm maps and `isGlobalNorm_iff_isLocalNormEverywhere`, and `hilbertProductFormula`.
- **What can be built now.** It lists:
  - the 3.1 carrier and the 3.2 `IsAdmissible` (only 3.3 needs `finiteHasse`);
  - 4.1 from `weakApproximation_denseRange` with `DenseRange.piMap` (NhdsWithin.lean:436);
  - 4.5 away from the dyadic places;
  - the field-generic quaternary descent (O'Meara 58:7) and O'Meara 42:12;
  - the Layer 7 rank-zero class.
- **Corrected claim.** "Layer 3 cannot define its carrier" now reads "Layer 3 cannot construct globalInvariants Q (3.3)".

**RT-AUDIT-04/21 (0.1 basic API).**
- **New target.** Added the target "0.1 basic API: scalar extension of an isometry and of a representation, compatibility with `prod`, negation and scaling, preservation of rank and regularity", library `tauceti`. It sits after the definitions target, in the README's order.
- **Citations.** The five declarations the finding names, all in `TauCeti/LinearAlgebra/QuadraticForm/BaseChange.lean` and all `more general`:
  - `QuadraticMap.IsometryEquiv.baseChange` (:108);
  - `QuadraticMap.IsRepresentedBy.baseChange` (:326);
  - `QuadraticForm.baseChangeProd` (:248);
  - `QuadraticForm.baseChange_smul` (:306);
  - `QuadraticForm.Nondegenerate.baseChange` (:412).
- **Note.** It gives each lemma's hypotheses and names the bridges `atFinitePlace_def`, `atRealPlace_def` and `atComplexEmbedding_def`. It also names `baseChange_neg`, `Represents.baseChange`, `Equivalent.baseChange` and Mathlib's `Module.finrank_baseChange`.
- **Not changed.** The layer verdict stays `partly built`.

**RT-AUDIT-04/22 (4.5).** Added `QuadraticMap.represents_mul_sq_iff` (Representation.lean:282) and `QuadraticMap.mem_unitValueSet_mul_sq_iff` (:289), both `more general`. The note now says that stability under unit squares is built, and that the missing items are dyadic openness and the two continuity items.

**RT-AUDIT-04/23 (duplicates).**
- **Removed.** The ten supplier entries the finding lists:
  - layer 0 → GlobalNumberFields layer 0;
  - layer 1 → QuadraticFormInvariants layer 3;
  - layers 2, 3, 4, 5 and 7 → QuadraticFormInvariants 6c;
  - layer 4 → GlobalNumberFields layer 1;
  - layer 4 → ClassFieldTheory layer 14;
  - layer 8 → QuadraticFormInvariants layer 4.

  I kept the eight `GeometryOfNumbersAndQuadraticArithmetic:GN.2` entries and checked that exactly those eight remain.
- **Dependencies kept.** As the finding suggests, the dependency information moved into target notes where no note named the supplier already:
  - 0.1 definitions: consumes Global Number Fields Layer 0;
  - 1.1 determinant-sign: Quadratic Form Invariants Layer 3 owns the discriminant;
  - 4.1: Global Number Fields Layer 1 supplies `weakApproximation_denseRange`;
  - 4.4: Quadratic Form Invariants 6C and Class Field Theory Layer 14;
  - 8.3: `wittRing` is from Quadratic Form Invariants Layer 4.

## Local fields and ramification

**RT-AUDIT-04/29 (Layer 3, different and discriminant).**
- **Citations.** The target now cites `differentIdeal` and the finding's Dedekind-level results:
  - `pow_sub_one_dvd_differentIdeal` (Mathlib, Different.lean:742);
  - `TauCeti.not_pow_ramificationIdx_dvd_differentIdeal` (Different.lean:121);
  - `TauCeti.relDiscr` (Discriminant/Basic.lean:35);
  - `TauCeti.multiplicity_differentIdeal_tower` (Different/Tower.lean:60).

  `not_dvd_differentIdeal_iff`, `differentIdeal_eq_differentIdeal_mul_differentIdeal` and `TauCeti.dvd_relDiscr_iff_exists_not_isUnramifiedAt` are named in the note. `conductor_mul_differentIdeal` was dropped to stay within five.
- **Note.** The last sentence is replaced by the finding's account: d ≥ e − 1, and d = e − 1 in the tame case with separable residue extension. The missing list now names the local exponents, δ = f·d, the Hilbert formula, the converse (the wild bound e ≤ d) and the mixed-characteristic upper bound.
- **Not changed.** `partial` is kept.

**RT-AUDIT-04/30 (Tau Ceti places are not only function-field places).**
- **What I checked.** At f790474, `TauCeti.Place` is a normalized ℤᵐ⁰-valued valuation trivial on a subfield k, and nothing in its extension files assumes `IsFunctionField`. So it covers equal-characteristic local fields, with k the prime field, whose nonzero elements are torsion. It does not cover mixed characteristic.
- **Layer 0 e/f target.**
  - Cites `Valuation.ordIndex` (Normalize.lean:55, more general).
  - Cites, as `special case`: `TauCeti.Place.ramificationIdx` (Extension/Basic.lean:294), `TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isSeparable` (Extension/Fundamental.lean:77) and `TauCeti.Place.ramificationIdx_restrict_mul` (Extension/Tower.lean:80).
  - Keeps Mathlib's `Ideal.sum_ramification_inertia_eq_finrank`.
  - The note names `ordIndex_eq_mul_of_forall_ord_eq`, `ord_algebraMap_restrict`, `relativeDegree`, `ramificationIdx_mul_relativeDegree_le_finrank` and `relativeDegree_restrict_mul`. It asks for `ramificationIndex K L` through `ordIndex`, with a comparison to `TauCeti.Place.ramificationIdx` in equal characteristic.
  - Dropped from the citation list: `Ideal.ramificationIdx` and `Ideal.inertiaDeg`, which the note still names as the comparison targets; the deprecated `Ideal.sum_ramification_inertia`; and `Ideal.ramificationIdx_algebra_tower`.
- **Finite extensions II.** Added the optional `TauCeti.Place.instMulActionAlgEquiv` (Extension/Galois.lean:90, special case), with a sentence in the note.
- **Other notes.** The phrase "places of a (global) function field" is replaced by "places trivial on a constant subfield (`TauCeti.Place`), which include equal-characteristic local fields but not mixed-characteristic ones" in:
  - the AlgebraicCurves#layer-6 duplicate note;
  - the Layer 2 residue-correspondence note;
  - the Layer 3 notes on Eisenstein, the lower filtration and the quotient embeddings;
  - the summary, whose "no intrinsic e and f" now says "at the local-field level".
- **The lower-filtration note.** I read `Place/Extension/RamificationGroup.lean`. It credits only what that file proves: integer-index groups that are normal, antitone, have G_0 = inertia, and are eventually trivial. The real index and subgroup compatibility stay missing.

**RT-AUDIT-04/31 (Layer 1, unit filtration).**
- **Note.** "The whole API list is present" is corrected. The second missing API item is now named: stability of U(L,i) under every K-automorphism of a Galois extension, which needs Layer 0.II's action on 𝒪[L].
- **What I checked.** `git grep` of `TauCeti/NumberTheory/LocalField/` at the pin finds no automorphism statement, only a private helper.
- **Not changed.** The library stays `tauceti`, as the finding says.

## Multiquadratic fields

**RT-AUDIT-04/39 (high: the genus field in the real case).**
- **What I checked, at f790474.**
  - `isGenusField_candidateGenusField` (GenusField.lean:114) assumes d < 0.
  - `isGenusField_candidateGenusFieldReal` (:149) is about `candidateGenusFieldReal` (CandidateGenusField/Real/Basic.lean:66), the maximal totally real subfield of the compositum.
  - `nonempty_algHom_candidateGenusField` (Unramified/Maximality.lean:176) quantifies only over fields unramified at the finite primes.
  - ℚ(√3) is a counterexample. disc = 12 = (−4)(−3), so the compositum ℚ(i, √3) has degree 2 over K. But h(ℚ(√3)) = 1, and `twoRank_eq_zero_of_minpoly_eq_X_sq_sub_three` is at OrdinaryTwoRank.lean:244, so the genus field is K itself.
- **Summary.** Replaced "proved to have it in both signatures" with the finding's text:
  - the compositum is the genus field for imaginary K and the narrow genus field for either signature;
  - for real K, the genus field is the maximal totally real subfield, which is the fixed field of complex conjugation (`fixedField_zpowers_candidateGenusFieldConj`, Real/FixedField.lean:188).
- **L3-T1 note.** Rewritten as the finding asks: the target holds for imaginary K, and for real K only in the narrow reading. "The largest such field" now reads "the largest abelian extension unramified over K at the finite places (the narrow genus field)". The note records the ℚ(√3) counterexample and says that multiquadraticity of the real genus field follows from the two cited theorems but is not stated as a named theorem.
- **Citations.** `genusPrimeDiscriminants` (already cited under L1-T3) is replaced by `isNarrowGenusField_candidateGenusField` (Unramified/NarrowGenusField.lean:140, exact for the narrow reading). Also added `exists_squarefree_root_adjoin_range_eq_top_of_isUnramifiedIn_over_quadratic` (Unramified/Basic.lean:64, more general).
- **Not changed.** As the finding's fix specifies, the target's library (`tauceti`) and the layer verdict (`built`) are unchanged. The note now says exactly which reading is built.
- See the maintainer notes below.

**RT-AUDIT-04/43 (Layer 3, duplicates).** Added `GlobalNumberFields#layer-2-moduli-and-ray-class-carriers`, which plans the narrow class group. The note names the shared object `NumberField.NarrowClassGroup` (NarrowClassGroup/Basic.lean:83) and Global Number Fields' identification of it with the ray class group at `narrowModulus`, `TauCeti.GlobalNumberFields.narrowEquivNarrowClassGroup` (RayClass/Narrow.lean:134). I read that identification at the pin.

## Number field arithmetic

**RT-AUDIT-04/47 (1.3).**
- **What I checked.** At the pins:
  - Mathlib's decomposition-field e/f/degree theorems sit under `variable [Ring.HasFiniteQuotients A]` (HilbertTheory.lean:168-170 and :285);
  - Tau Ceti's inertia-field e and f sit under `[PerfectField (P.under A).ResidueField]` (Tau Ceti HilbertTheory.lean:105).
- **Citations.** The five citations are now:
  - `IsDecompositionField.primesOver_eq_singleton` (:258, exact);
  - `TauCeti.IsInertiaField.primesOver_eq_singleton` (exact);
  - `IsDecompositionField.ramificationIdx_eq` (:328, special case);
  - `IsDecompositionField.rank_right` (:190, special case);
  - `TauCeti.IsInertiaField.ramificationIdx_eq_one` (special case; previously exact).

  The note names, with lines, the field predicates, `inertiaDeg_eq` (:341), `IsInertiaField.rank_left` (:206), `rank_decompositionField` (:230) and `TauCeti.IsInertiaField.inertiaDeg_eq_inertiaDegIn` (:156). The last was cited as exact before; it moved into the note to stay within five, and the note records that it also assumes a perfect residue field. For each declaration the note gives the hypothesis it assumes.
- **Note.** The missing list is the finding's (i)–(iii).
- **Not changed.** `partial` is kept.

**RT-AUDIT-04/48 (1.4).**
- **Target text.** Restored in full: the e-index under residue separability, and Σ_σ |HσD|/|H| = [L:K].
- **Library.** `tauceti` → `partial`.
- **Citations.** Added `NumberField.ramificationIdx_under_eq_one_iff_inertia_le` (Tau Ceti, NumberField/Inertia.lean:117, related). `card_doubleCosetQuotient_eq_card_primesOver` moved into the note to stay within five.
- **Note.** It marks `Ideal.inertiaDeg_under_fixedField_eq_relIndex` as unramified-only, and names the e-index formula and the sum identity as missing.
- **Summary.** The summary's 1.4 clause is corrected in the same way.

**RT-AUDIT-04/50 (2.6).**
- **Fit.** `isArithFrobAt_apply_sqrt_eq_self_iff` is now `related`: it is the input, not the criterion.
- **Citation.** Added `NumberField.isArithFrobAt_multiquadratic_eq_one_iff` (Multiquadratic/Frobenius.lean:66, more general). Its singleton case is the criterion Frob Q = 1 ↔ legendreSym p d = 1.
- **Note.** The sentence is rewritten to match.
- **Not changed.** The library stays `tauceti`.

**RT-AUDIT-04/52 (3.10).** The note now points to Tau Ceti's `Polynomial.Monic.discr_mul` (Resultant/Discriminant.lean:196) and `Polynomial.Monic.separable_map_zmod_iff_not_dvd_discr` (:526). Both are cited as `related`. At the pin, Mathlib's Resultant/Basic.lean has no disc(fg) formula.

**RT-AUDIT-04/53 (5.2).**
- **Missing list.** `Module.Finite` is removed from it.
- **Citation.** Mathlib's anonymous instance is cited as `NumberField.HeightOneSpectrum.instFiniteAdicCompletionRingOfIntegers` (FinitePlace.lean:522, more general). To stay within five, `completionIsScalarTower` moved into the note, next to `completionContinuousSMul`.
- **Note.** The instance needs an algebra structure, `ContinuousSMul` and `IsScalarTower K K_v L_w`, which Tau Ceti's scoped `AdicCompletionExtension` instances supply. I read those instances at Completion.lean:122 and :135, and the instance's variable block at FinitePlace.lean:512-522.
- **Summary.** Corrected in the same way.

**RT-AUDIT-04/54 (6.2).**
- **Citations.**
  - `Ideal.inertia` (Ideal/Defs.lean:154, more general: the carrier at I = Q^(i+1));
  - `Ideal.inertia_smul` (Pointwise.lean:159);
  - `Ideal.inertia_le_stabilizer` (:167);
  - the normality instance `Ideal.instNormalSubtypeMemSubgroupStabilizerInertia` (:173);
  - `TauCeti.Place.ramificationGroup`, kept as the parallel for places trivial on a constant subfield.
- **Note.** It gives what exists and what is missing: the named group, G_0 as a lemma, normality inside stabilizer Q (the instance gives it inside the stabilizer of Q^(i+1)), eventual triviality, the ℚ(i) example, and the comparison theorem, which is blocked on 6.1.
- **Summary.** Its Layer 6 sentence is replaced.

**RT-AUDIT-04/58 (8.2).** The last sentence of the note is replaced by the finding's list of rows whose supplying milestone is missing: 3.9, 7.1, 7.4, 6.4, 5.3 and 3.11. It adds that the "none" rows are out of scope, not gaps. I read the README §8.2 table to confirm the row labels.

**RT-AUDIT-04/60 (summary).** All four edits are made:
- the 1.4 clause (see 48);
- `Module.Finite` (see 53);
- the Layer 6 sentence (see 54);
- the 1.3 caveat: Mathlib's decomposition-field half assumes `Ring.HasFiniteQuotients`, and Tau Ceti's inertia-field half a perfect residue field.

## For the maintainer

These are errors in the Tau Ceti roadmap documents themselves, which this atlas does not edit (PROTOCOL.md section 15). They should go to the roadmap owners.
1. **GlobalNumberFields Layer 11, the ⚠ paragraph** ("An arbitrary ℤ-algebra homomorphism O →ₐ[ℤ] O' does not induce a map on Pic or NarrowPic, so a functoriality statement quantified over one is a false theorem"). The claim is false for orders in number fields. Such a map is injective, extends uniquely to the fraction fields, and preserves total positivity, so it induces maps on both Pic and NarrowPic (RT-AUDIT-04/6).
2. **GlobalNumberFields 3C** ("the trivial modulus recovers Mathlib's `NumberField.mixedEmbedding.fundamentalCone`"). The cone is a fundamental domain for the units modulo torsion. A set meeting each orbit of the full unit group once is a 1/w_K part of it (RT-AUDIT-04/7).
3. **Multiquadratic Layer 3** ("K_gen … Prove it is multiquadratic (the compositum of the ℚ(√p*) …)"). The compositum is the narrow genus field. For real K, the genus field in the all-places sense is its maximal totally real subfield. ℚ(√3) is the library's own counterexample (RT-AUDIT-04/39).

**A citation name outside this job's findings.** Eight other citations in the audit still name Mathlib's signature as `QuadraticForm.sigPos`. At the pin it is the root-level `sigPos`, although the module docstring spells it `QuadraticForm.sigPos`. I renamed only the one entry I rewrote (3.1). The other eight are for a later red team or fix, since no confirmed finding names them.

## Checks

- `python3 research/blueprint/intake.py check-files` on both deliverables: 0 problems.
- A structural diff of the audit, old against new, shows changes only at the paths named above.
- The file still round-trips through `json.dumps(indent=1, ensure_ascii=False)` without a trailing newline, as before.
- Every target has at most five declarations, and every `fit` and `library` value is one the audit format allows.
- No Lean was written or compiled. Every cited declaration was read in the pinned source. The two anonymous instances' names were taken from the compiled index of a byte-identical source file, as explained at the top.
