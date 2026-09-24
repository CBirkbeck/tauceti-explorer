# RT-AUDIT-04 — red team of library audit AUDIT-04

**Result: 60 findings: 1 high, 25 medium, 34 low.** Every cited declaration exists at the
pins.

- **The high finding.** Multiquadratic's summary, and its target L3-T1, claim that the prime-discriminant compositum is the genus
  field in both signatures. For real quadratic fields Tau Ceti proves only that it is the narrow genus field.
- **The medium findings:**
  - library material that the notes call missing;
  - "exact" fits whose declarations are narrower than their targets;
  - wrong carriers or attributions;
  - two errors in the roadmaps' own text;
  - `duplicates` lists that miss owners or record supplier relations.

**Red team:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #1558).

**Target:** `AUDIT-04`, the library audit of five Tau Ceti roadmaps: GlobalNumberFields, GlobalQuadraticForms,
LocalFieldsRamification, Multiquadratic and NumberFieldArithmetic.

**Baseline:** tauceti `f790474` and mathlib `082e2d3`, both read at exactly those commits.

**Eligibility:** `cc-2aeb03` wrote neither `AUDIT-04` nor its review.

## Method

- **Every declaration claim.** All 639 `declarations` entries (244 targets, 39 layers) were
  located at the pins. Mathlib was read at `082e2d3`, and Tau Ceti with `git show f790474:<file>`. All exist at the cited
  line, with three special cases:
  - two are anonymous instances, whose generated names do not appear in the source;
  - `Ideal.ramificationIdx_algebra_tower` is a deprecated alias (a low finding).
- **What each declaration says.** For every target marked `mathlib`, `tauceti` or `partial`, each cited declaration was read at
  the pin and compared with the target and the note: generality, hypotheses and the `fit` label.
- **The absence claims.** Every target marked `absent` and every `not built` layer was searched for in both libraries under
  other names.
- **Verdicts, summaries and duplicates.** Each layer verdict was checked against its targets, each roadmap summary against its
  layers, and each `duplicates` entry against the atlas.

Each roadmap was attacked separately. The `checked` field of the result file records what was read, roadmap by roadmap.

## Findings


### tauceti:TauCetiRoadmap/GlobalNumberFields — 17 findings (7 medium, 10 low)

- **RT-AUDIT-04/1** (library-claim, medium). The note says 'there is no theorem relating `normalizedAbsValue` over L at w to `normalizedAbsValue` over K at w|K with the local degree as exponent', and the review's correction to this target says 'only the passage to normalized absolute values (absNorm w = absNorm v ^ f) is missing'. Mathlib already proves that passage at finite places, for the very absolute value that Tau Ceti's `normalizedAbsValue (Sum.inl v)` is by `rfl` (Mathlib's `adicAbv K v`), and the declaration is not cited.
- **RT-AUDIT-04/2** (library-claim, medium). The note says 'there is no integral subring, no single-place support API, and only the one TauCeti lemma'. `FiniteAdeleRing R K` is by definition `Πʳ v, [v.adicCompletion K, v.adicCompletionIntegers K]`, and Mathlib's RestrictedProduct API, which the target cites only as the carrier, already supplies projections as ring homomorphisms, the additive single-place elements (value x at v, 0 elsewhere) with their multiplication rules, and the everywhere-integral part as an open embedding of the product of the local integer rings.
- **RT-AUDIT-04/3** (library-claim, medium). The note says Mathlib has the unit criterion and the embedding of Kˣ 'but not the topology on the unit group or its restricted-product description'. Both halves are wrong.
- **RT-AUDIT-04/4** (library-claim, medium). Marked 'absent', with a note saying only the placewise local map exists and 'no extension map on adele rings is assembled'. Every ingredient of the assembly is in the libraries: Mathlib's restricted-product functoriality `mapAlongRingHom` with its continuity theorem, the index map on height-one primes with finite fibres, Tau Ceti's local maps with their continuity and integrality, and Mathlib's archimedean local map `LiesOver.completionMap` with continuity.
- **RT-AUDIT-04/5** (duplicate, medium). The duplicates list ClassFieldTheory Layer 12 only, as a consumer.
- **RT-AUDIT-04/6** (error, medium). The note asserts that 'the layer's warning that an arbitrary ring homomorphism induces no map applies to `NarrowPic` but not to `Pic`'. For orders in number fields the warning applies to neither.
- **RT-AUDIT-04/7** (error, medium). `NumberField.mixedEmbedding.fundamentalCone` is cited with fit 'special case', and the note calls it the trivial-modulus case ('Mathlib has the trivial-modulus case (`fundamentalCone`, for the full unit group, with measurability)'). `rayFundamentalDomain 𝔪` is to meet each orbit of the congruence unit group exactly once.
- **RT-AUDIT-04/8** (missing, low). The 3C and 3E notes omit Mathlib's norm-one section of the fundamental cone, `normLeOne`. Mathlib proves it measurable and bounded, with a frontier of volume zero and an explicit volume, which is the trivial-modulus form (torsion caveat as above) of 3C's 'the norm-one section is bounded and measurable'. The volume formula is the computation behind 3E's main term.
- **RT-AUDIT-04/9** (other, low). `ZLattice.covolume.tendsto_card_le_div'`, `tendsto_card_div_pow` and `tendsto_card_le_div''` are cited with fit 'special case'. They are not special cases of the target.
- **RT-AUDIT-04/10** (library-claim, low). The note cites `MulChar.sum_eq_zero_of_ne_one` as the available 'finite-character orthogonality'. That lemma is about a multiplicative character of a finite commutative ring (a `MulChar R R'`, zero off the units), not a homomorphism from a finite abelian group such as `RayClassGroup 𝔪 →* ℂˣ`. The orthogonality 3F needs is Mathlib's `sum_hom_units_eq_zero`.
- **RT-AUDIT-04/11** (library-claim, low). The note cites `Ideal.sum_ramification_inertia` as the finite-place degree formula, but that declaration is deprecated at the pin in favour of `Ideal.sum_ramification_inertia_eq_finrank`. The archimedean local-degree formula, which Mathlib also has, is not cited.
- **RT-AUDIT-04/12** (missing, low). Tau Ceti's ideal-theoretic Artin map is not cited.
- **RT-AUDIT-04/13** (other, low). Both layers are 'not built', although each has a target largely in the libraries.
- **RT-AUDIT-04/14** (other, low). The target is labelled 'mathlib' while its note says 'only the *agreement* statement (that the idelic proof gives the same result) would be new work'. The job's labels reserve 'mathlib' for targets present in the libraries and use 'partial' when something named is missing.
- **RT-AUDIT-04/15** (library-claim, low). The target cites two `private` Tau Ceti theorems, `exists_mixed_approximation` with fit 'exact' and `mixedAbsoluteValue_pairwise_not_isEquiv` with fit 'related'. The audit job forbids citing private declarations.
- **RT-AUDIT-04/16** (missing, low). The target lists omit several targets the layer descriptions state.
- **RT-AUDIT-04/17** (other, low). The summary says the libraries lack 'the entire adelic development beyond bare definitions' and lists 'adele base change' as genuinely missing.

### tauceti:TauCetiRoadmap/GlobalQuadraticForms — 11 findings (6 medium, 5 low)

- **RT-AUDIT-04/18** (library-claim, medium). The target is marked library 'tauceti' with `QuadraticForm.atFinitePlaceBaseChange` at fit 'exact', and the note says it is 'what the quaternary case of 5.1 consumes'. The declaration covers finite places only.
- **RT-AUDIT-04/19** (library-claim, medium). For the global discriminant class, the audit cites Mathlib's `QuadraticForm.discr`. The note says that 'two of the four fields have carriers (the discriminant and the positive index) and two do not.' That declaration is not a discriminant class.
- **RT-AUDIT-04/20** (error, medium). The summary says 'everything from Layer 2 on is blocked on one missing supplier' and 'Layer 3 cannot define its carrier'. Both statements are false, and the first contradicts the summary itself.
- **RT-AUDIT-04/21** (missing, medium). The audit splits roadmap item 0.1 into targets for the definitions, the discriminant, the Hasse invariant, the real signature and the tower.
- **RT-AUDIT-04/22** (missing, medium). One of this target's four items is 'stability of represented values under squares'. Tau Ceti proves it exactly, over any commutative ring.
- **RT-AUDIT-04/23** (duplicate, medium). Ten of the eighteen `duplicates` entries are supplier relations, not layers that 'state the same targets', which is how make_audit_jobs.py step 4 defines the field.
- **RT-AUDIT-04/24** (error, low). The note says that 'the Hasse-invariant and real-signature halves of this API item are blocked on the missing supplier invariants'. The real-signature half is not blocked on any supplier.
- **RT-AUDIT-04/25** (library-claim, low). The target cites `TauCeti.GlobalNumberFields.exists_mixed_approximation`, which is a `private theorem`. The audit's own instructions say: 'A `private` declaration is not the library's version of anything; do not cite it.' A downstream file cannot use it.
- **RT-AUDIT-04/26** (missing, low). The roadmap sends 6.1 through Layer 5: 'Apply Layer 5 to ⟨-a⟩⊥Q', using the supplier's 'Layer 0 representation criterion' ('A regular form represents a ∈ Kˣ exactly when its orthogonal sum with ⟨−a⟩ is isotropic'). 5.3 and 5.4 also use the fact that an isotropic regular form is universal.
- **RT-AUDIT-04/27** (other, low). The target is 'partial' only because 'base-change independence along two representatives of one real place is not stated'. The note does not say that Mathlib already reduces this item to a rewrite.
- **RT-AUDIT-04/28** (other, low). The note says 'the Legendre-symbol input is in Mathlib' and cites the definition `legendreSym`. The residue-field fact the example needs, that -1 is a nonsquare mod p exactly when p ≡ 3 mod 4, is a separate named Mathlib theorem and is not cited.

### tauceti:TauCetiRoadmap/LocalFieldsRamification — 10 findings (3 medium, 7 low)

- **RT-AUDIT-04/29** (library-claim, medium). The note ends 'Missing: the local exponents d(L/K), δ(L/K), δ = f·d, the Hilbert formula d = Σ(#G_i − 1), the tame equality and the wild bounds' and cites only Mathlib's differentIdeal lemmas.
- **RT-AUDIT-04/30** (library-claim, medium). The audit treats TauCeti's place-extension theory as function-field-only: 'TauCeti has the same equivalence for places of a *function* field', 'TauCeti has the lower-numbering groups G_i(P) only for places of a function field', the AlgebraicCurves#layer-6 note 'over a global function field rather than at a local field, a parallel development', and the summary 'TauCeti has lower-numbering groups only for places of function fields'. At f790474 these declarations assume only a field extension F'/F and a TauCeti.Place, which is 'a normalized discrete valuation ... trivial on the constants', with no IsFunctionField hypothesis.
- **RT-AUDIT-04/31** (error, medium). The note says 'The whole API list is present ... only the covariant `map_unitFiltration_le K L i` contract along an extension is missing'. The stage's API list has a second item that is absent at f790474: 'stability under every K-automorphism of a Galois extension, which Layer 3 uses'. No statement about automorphisms exists anywhere in TauCeti/NumberTheory/LocalField/. The item needs Layer 0.II's action of L ≃ₐ[K] L on 𝒪[L], which the audit marks partial.
- **RT-AUDIT-04/32** (library-claim, low). The cited tower lemma is a deprecated alias (since 2026-07-01), and it is not a tower law for the Ideal.ramificationIdx that the same target cites and that the roadmap's comparison lemma is stated against.
- **RT-AUDIT-04/33** (missing, low). Two groups of relevant carriers are not cited.
- **RT-AUDIT-04/34** (missing, low). The note credits Mathlib's IsArithFrobAt only 'with existence and conjugation'. Mathlib/RingTheory/Frobenius.lean also has a chosen Frobenius element arithFrobAt, and uniqueness of the Frobenius at an unramified prime, AlgHom.IsArithFrobAt.eq_of_isUnramifiedAt.
- **RT-AUDIT-04/35** (missing, low). The note cites only PowerBasis and addVal as related.
- **RT-AUDIT-04/36** (library-claim, low). Several fit labels contradict their own notes or the stage.
- **RT-AUDIT-04/37** (error, low). The milestone is not wholly done.
- **RT-AUDIT-04/38** (other, low). The summary's closing inventory says the libraries miss 'all of Layer 2 ..., and all of Layers 3 and 4'. That contradicts the Layer 4 verdict 'partly built' and the summary's own earlier sentence crediting TauCeti with 'the separable-closure comparison that Layer 4 asks for as its ambient model'. It also overstates the gap in Layer 3, where the Dedekind-level different and discriminant material of RT/1 exists.

### tauceti:TauCetiRoadmap/Multiquadratic — 8 findings (1 high, 1 medium, 6 low)

- **RT-AUDIT-04/39** (error, high). The summary says 'the genus field is characterised by a universal property, the prime-discriminant compositum is proved to have it in both signatures'. That is false.
- **RT-AUDIT-04/40** (library-claim, low). Two cited declarations are `private` but carry fit 'exact': TauCeti.Multiquadratic.primeDiscriminant_eq_sq_mul_radicand and TauCeti.DedekindDomain.exists_transversal_family_of_sdiff_pair.
- **RT-AUDIT-04/41** (library-claim, low). In three targets the declaration cited as 'exact' does not state the target, although the library has a declaration that does.
- **RT-AUDIT-04/42** (other, low). The target includes 'the inversion/commutator argument', and the note does not say that the commutator half is absent.
- **RT-AUDIT-04/43** (duplicate, medium). Layer 3's duplicates list names only ClassFieldTheory#layer-13. It omits GlobalNumberFields#layer-2-moduli-and-ray-class-carriers, which plans 'the narrow class group, its surjection to the wide group, and its kernel formula', while this layer says 'defining the narrow class group is part of this layer'. AUDIT-04 records this duplicate on the GlobalNumberFields side, so the two entries are inconsistent.
- **RT-AUDIT-04/44** (duplicate, low). Layer 2's duplicates is empty, but the migration of units_sq_index_le is also planned by Completed/EffectiveBounds layer 1. The roadmap document itself calls it 'shared with the effective-bounds roadmap', and the declaration lives in EffectiveBounds' directory.
- **RT-AUDIT-04/45** (duplicate, low). The note says NumberFieldArithmetic Layer 2 'Owns the general arithmetic Frobenius `IsArithFrobAt`'. It does not: IsArithFrobAt is a Mathlib definition, and that layer's text says it uses Mathlib's with no second definition.
- **RT-AUDIT-04/46** (other, low). Three generality claims misread the roadmap.

### tauceti:TauCetiRoadmap/NumberFieldArithmetic — 14 findings (8 medium, 6 low)

- **RT-AUDIT-04/47** (library-claim, medium). The note says Mathlib's HilbertTheory.lean supplies 'the decomposition-field half' and TauCeti 'adds the inertia-field half (uniqueness of the prime above, e and f under the inertia field)', and it labels TauCeti.IsInertiaField.ramificationIdx_eq_one and TauCeti.IsInertiaField.inertiaDeg_eq_inertiaDegIn fit 'exact'. At the pins, all the e/f/degree statements carry a residue hypothesis stronger than the roadmap allows.
- **RT-AUDIT-04/48** (library-claim, medium). The target is marked library 'tauceti' (fully built). The audit's paraphrase of milestone 1.4 drops two of its three invariant formulas, and neither exists.
- **RT-AUDIT-04/49** (other, low). The note cites `ncard_primesOver_eq_finrank_iff_of_isGaloisGroup`, which does not exist in either library.
- **RT-AUDIT-04/50** (library-claim, medium). The note says 'the quadratic criterion is exactly the landed theorem the layer names' and cites NumberField.isArithFrobAt_apply_sqrt_eq_self_iff with fit 'exact'. The roadmap says the opposite: the landed theorem is the input, and the milestone is the corollary for the Frobenius element.
- **RT-AUDIT-04/51** (other, low). The target's declarations omit four of the roadmap's frozen contract names.
- **RT-AUDIT-04/52** (library-claim, medium). The note says 'the discriminant-resultant factorization it needs is available in Mathlib'. It is not in Mathlib at 082e2d3: Mathlib has no formula for disc(fg). It is in Tau Ceti, as Polynomial.Monic.discr_mul.
- **RT-AUDIT-04/53** (library-claim, medium). The note says `Module.Finite K_v L_w` for this instance is missing 'in neither library', and the roadmap summary repeats 'no Module.Finite'. Both are false at the pins.
- **RT-AUDIT-04/54** (missing, medium). The note says 'No ramification group for a prime of a number field exists; the closest object in the baseline is the function-field one'. The summary adds that 'the only ramification filtration in the baseline is TauCeti's for places of a function field' and that Layer 6 'cannot be stated'. All three miss that Mathlib's Ideal.inertia is defined for an arbitrary ideal.
- **RT-AUDIT-04/55** (other, low). The target is labelled library 'partial', but the note says 'none of the six named objects exists', and all four cited declarations are Mathlib prerequisites with fit 'related'. The roadmap summary also lists 7.1 among the missing milestones.
- **RT-AUDIT-04/56** (other, low). One cited declaration, NumberField.algebraMap_four_mul_mem_conductor, is private at the pin.
- **RT-AUDIT-04/57** (other, low). The target is marked fully built ('tauceti'). The roadmap's basic API for 7.3 includes the edge case 'Dedekind's cubic, which is not' monogenic, and its prerequisite 3.11 (common index divisors) is absent.
- **RT-AUDIT-04/58** (error, medium). The note says 'The rows it marks "worked only" or "none" — Frobenius cycle type (3.9), fundamental units and regulator (7.4), the subfield dictionary (7.1) — are exactly the ones that are still missing.' This misreads the table in two ways.
- **RT-AUDIT-04/59** (other, low). The note cites only Ideal.relNorm and relDiscr.
- **RT-AUDIT-04/60** (other, medium). The roadmap-level summary carries three statements that the layer findings above make false.


## For the verifier and the fixer

- **The high finding.** At `f790474` the two theorems differ in scope:
  - `isGenusField_candidateGenusField` (`TauCeti/NumberTheory/Multiquadratic/GenusField.lean:114`) requires `d < 0`;
  - for `d > 0`, the genus field is `candidateGenusFieldReal` (`:149`), the compositum's maximal totally real subfield.

  The module documentation says the compositum is only the narrow genus field there. Tau Ceti's own ℚ(√3) computation is a
  counterexample to the audit's wording.
- **Errors in the roadmaps.** Two findings concern the roadmaps' own text, not only the audit, and their owners should hear of
  them:
  - maps of orders do act on NarrowPic;
  - `fundamentalCone` is not the trivial-modulus case.
- **What the fixes change.** They are to notes, `library`/`fit` labels (for example, NumberFieldArithmetic target 1.4 goes
  from `tauceti` to `partial`), cited declarations and the `duplicates` lists, as each finding states.
