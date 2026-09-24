# REV-RT-AUDIT-01

Codex, session `codex-7e92bd`, 24 September 2026. Refs #1551.

**52 confirmed; 2 rejected; all 54 findings checked.** The confirmations comprise both high findings, all 13 medium findings and 37 low findings. This review did not write or review AUDIT-01, REV-AUDIT-01 or RT-AUDIT-01 (the latter report identifies Claude Code session `cc-39fac3`). The claim was won by comment 5807947942, confirmed by bot comment 5807949252, and the whole issue was reread after confirmation.

The high corrections are justified: C6 is mathematical computation rather than process, and the 12C isogeny/place clause already has a substantive function-field component. The reviewed audit needs more accurate descriptions of existing library ingredients and clearer stage-level supplier boundaries. This verification checks the 54 findings and their proposed fixes; it does not claim a new audit of all 482 targets.

**Rejected findings.** Finding 36 equates two Riemann–Roch programmes without the comparison of their objects: one uses function-field repartitions over arbitrary exact constants, the other analytic cohomology of compact Riemann surfaces without GAGA. Finding 42 calls partial status inconsistent with related evidence, although that is permitted by the audit rules, and promotes a normalized differential eta to an already-built cotrace/derivation specialization without its formal identification. The current note already accurately records eta and the missing cotrace.

**Fix qualifications.** Use every finding’s reason below when applying its correction. In particular:

- 2: the place clause is present, not the whole scheme correspondence.
- 3–4: generic derived functors and group actions instantiate here; no scheme-specific higher-direct-image package or quotient-stack algebraicity is inferred.
- 7–8 and 23: representable-diagonal criteria are conditional; Dedekind/DVR and integral-closure finiteness are ring-level inputs, not completed scheme resolution.
- 13: compare a completed valuation ring with the completion of the original local ring, not with that generally incomplete ring itself; preserve the five-citation limit.
- 14–15: retain all tower/finiteness hypotheses in the different formula; split the infinity-fixed and infinity-not-fixed cases in the Mobius fixed-point argument.
- 21: the base-change target must also be an integral domain.
- 27: A5 uses weight-minus-one homology; C6 uses dual weight-plus-one cohomology. Track the polarization sign and dual lattice.
- 29: Artin’s representable-diagonal input is not a theorem that every moduli functor has a representable diagonal.
- 32, 46: two-open vanishing assumes acyclicity; both affine acyclicity and the cohomology-of-restriction comparison remain obligations.
- 43–44: the general even-degree irreducibility criterion is missing, not all even-degree examples; the Eisenstein condition is additive order one, not multiplicative valuation one.
- 16, 24–26, 48–51 and 54: distinguish a shared target, an existing supplier, a compatibility theorem and a separate extension. Preserve actual dependencies when removing a duplicate label. Share the SNC predicate without merging different boundary theorems.

The paired corrections 6/29 and 19/34 should be applied together. Low-severity findings remain verified observations; PROTOCOL section 17 automatically queues fixes for the confirmed high and medium findings.

**Evidence and validation.** Read the cited pinned declarations with their section variables and the affected audit entries. Compared the relevant stage descriptions and accepted RS-02, RS-06, RS-18, RS-25 and RS-32 decisions, with reverse audit entries where material. Recomputed the eight verdict counts in finding 18 and checked their merged coverage projection. The generated AUDIT-01 prompt is not tracked in this snapshot; its tracked generator supplies the same binding grading and fit rules. Source URLs below identify the public pinned material. No compiled Lean environment at these pins was available, and no Lean compilation or elaboration is claimed.

Atlas input snapshot: `ae16efd59f8727140b163dd6a3318e0da593cd2a`. Pinned source integrity was checked independently against Git blobs for all 9,055 tracked Mathlib Lean files and all 5,489 Tau Ceti Lean files. This byte-identity check is distinct from reading theorem statements and is not a proof-compilation claim.

**PASS:** red-team review checker; exactly one verdict for each of the 54 original finding IDs; exact two-file intake with zero problems. All 37 captured input blobs and both absent-output guards matched fresh main `4510889c25555f3ed51d8eb7509082a8396cbe18`. The issue body and bot-confirmed claim were unchanged before publication. No Lean compilation was run.

Public atlas sources: [research/blueprint/redteam/RT-AUDIT-01.result.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/research/blueprint/redteam/RT-AUDIT-01.result.json), [research/blueprint/audit/AUDIT-01.result.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/research/blueprint/audit/AUDIT-01.result.json), [data/atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json), [research/blueprint/make_audit_jobs.py](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/research/blueprint/make_audit_jobs.py), [scripts/library_coverage.py](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/scripts/library_coverage.py), [data/library-coverage.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/library-coverage.json).

Accepted restructuring sources: [RS-02](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/restructure/RS-02.result.json), [RS-06](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/restructure/RS-06.result.json), [RS-18](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/restructure/RS-18.result.json), [RS-25](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/restructure/RS-25.result.json), [RS-32](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/restructure/RS-32.result.json).

## Finding-by-finding decisions

### RT-AUDIT-01/1 — confirmed (high)

C6 asks for O(n), nonreduced-point, elliptic Hodge/differential, logarithmic-residue and modular differential comparison computations. These are mathematics, not process. Its eight audit targets are five absent and three partial. make_audit_jobs.py lines 52 and 63–68 gives the binding verdict convention; library_coverage.py lines 58–60 hides process layers. The quoted Part II proposal sentence describes the document's integration scope, not the nature of C6. Set C6 to not built, retaining all targets. The cited generated prompts/AUDIT-01.md is not tracked in this snapshot; its tracked generator independently supplies the rule.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/2 — confirmed (high)

InfinityPlace.lean lines 76, 146–151 and 219–233 prove the valuation-equivalence clause and converse for function-field pullbacks under Field F, without ellipticity or separability. This is a substantive built component of 12C, so partial is appropriate and the scheme correspondence must remain missing. Qualify the proposed exact fit labels: they are exact for the explicitly named place clause, not for the whole isogeny/scheme-morphism target; use special case/related if the audit fit is measured against the whole target. These are Mathlib valuation places, not an already-proved TauCeti.Place dictionary.

Sources: [InfinityPlace.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/InfinityPlace.lean).

### RT-AUDIT-01/3 — confirmed (medium)

Sheaf.lean supplies Abelian and IsGrothendieckAbelian X.Modules (lines 45–53), pushforward at 165 and its Additive instance at 198. EnoughInjectives.lean:380 and Injective/Resolution.lean:346 provide the instances required by Functor.rightDerived at RightDerived.lean:109. Thus higher direct images are available by specialization, even though no dedicated scheme-relative package exists. RightDerivedFunctorPlus.lean:29–38 also applies after choosing the derived-category instances. Correct the blanket denial, preserve the proper coherent/base-change gaps, and say no scheme-specific API rather than no API at all (the generic derived-functor API already exists). No elaboration was run.

Sources: [RightDerivedFunctorPlus.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean), [Sheaf.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Modules/Sheaf.lean), [EnoughInjectives.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/GrothendieckCategory/EnoughInjectives.lean), [Resolution.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/Injective/Resolution.lean), [RightDerived.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/RightDerived.lean).

### RT-AUDIT-01/4 — confirmed (medium)

ModObj at Monoidal/Mod.lean:59 is precisely an action with unit/associativity laws; selfLeftAction at Action/Basic.lean:174 specializes the action to tensor product. Pullbacks.lean:711 supplies the cartesian structure on Over S, and Group/Abelian.lean:132 uses GrpObj for group schemes. Cartesian/Mod.lean:62 gives the action on generalized points. The additional fppf kernel-pair theorem at Torsor.lean:372 is explicitly for a normal Hopf ideal and the sheafified quotient. Correct the action denial and retain those hypotheses; quotient stacks and their algebraicity remain absent.

Sources: [Abelian.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Group/Abelian.lean), [Pullbacks.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Pullbacks.lean), [Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Action/Basic.lean), [Mod.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Cartesian/Mod.lean), [Mod.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Mod.lean), [Torsor.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Torsor.lean).

### RT-AUDIT-01/5 — confirmed (medium)

The full A0-extension stage explicitly calls for verifying the Artin inputs in every PEL application. M2 separately lists the diagonal, presentation, limits, deformation/obstruction, effectivity and openness checks; H1 checks representability for Hilbert–Blumenthal moduli; A0 explicitly assigns these verifications to the consuming milestone. Neither application stage appears in A0-extension's audit overlap list. Add both scoped cross-references and make the producer/consumer boundary explicit. This should route the application checks to M2/H1, not duplicate their proofs in A0-extension.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/6 — confirmed (medium)

Confirmed as a missing supplier/overlap assignment. A0-extension explicitly owns proving Artin’s criterion. R09.6 repeats the theorem as an absent audit target and requests a proof or assigned supplier; no edge joins these two stages. SF.4 repeats the deformation/algebraization inputs. Add the links and name A0-extension as R09.6’s supplier. The absence of an edge alone would not prove duplication, and R09.6 already permits importing a proof; the fix should use that option rather than describe two mandatory independent constructions.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/7 — confirmed (medium)

Representable.lean:567–675 proves of_diag, diag_of_map_from_obj and diag_iff under the displayed fullness, binary-product and pullback hypotheses. This is a general criterion available to the scheme Yoneda functor, and the same accepted audit already cites it in R09.6. Correct SF.1’s blanket missing-diagonal claim. It is a criterion conditional on representability of the maps/diagonal, not a theorem that arbitrary sheaves have representable diagonals. Keep partial and the algebraic-space/stack assembly gap.

Sources: [Representable.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/MorphismProperty/Representable.lean).

### RT-AUDIT-01/8 — confirmed (medium)

Confirm the omitted Dedekind/DVR ingredient, with a narrower fix than the proposed wording. TauCeti.IsIntegralClosure.isDedekindDomain at IntegralClosure.lean:90 proves the finite-fraction-field-extension result without separability; Mathlib’s version at line 220 uses separability. Dvr.lean:129 characterizes Dedekind domains by Noetherianity and DVR localizations at nonzero primes. These are reusable ring-level ingredients for curve normalization. Do not call them a completed affine or scheme resolution theorem: identifying a curve normalization with this integral closure, finiteness/properness and the scheme comparison still require their own bridges. The inseparable Tau Ceti theorem explicitly does not prove module finiteness. Keep partial; qualify Dedekind as dimension at most one in general, with actual dimension one in the curve case.

Sources: [Dvr.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DedekindDomain/Dvr.lean), [IntegralClosure.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean), [NoetherNormalization.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/NoetherNormalization.lean), [IntegralClosure.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/IntegralClosure.lean).

### RT-AUDIT-01/9 — confirmed (medium)

SF.3 integrates the function-field owners and explicitly requests genus-zero/one and scalar-extension checks. AlgebraicCurves Layer 3 defines divisors, classes and genus; Layer 8 states genus invariance under its perfect-constant-field/separably-generated hypotheses; Layer 10 requests genus one for elliptic Weierstrass curves. SF.3’s current overlap list misattributes divisors/genus to Layer 4 and omits those three precise suppliers. RS-25 keeps the integration but does not resolve these stage-level links. Add the scoped links and retain the function-field-to-scheme comparison as separate work.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/10 — confirmed (medium)

StableReduction Layer 0 explicitly owns the finite-DVR-extension package, compatible common refinements, generic/special fibres and model base-change functors. These are exactly the remaining model inputs in the SF.4 target note. AUDIT-02 records no overlap for Layer 0, and RS-25’s SF.4 suppliedBy lists reduction theorem layers 7–9, not Layer 0. Add the supplier link while leaving the model-comparison target partial.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/11 — confirmed (medium)

The actual R09.7/R09.7a descriptions own characteristic-zero embedded resolution and Rees-algebra blowups/transforms; StableReduction Layer 4 owns relative-Proj blowups and the stated Lipman-type normal-model resolution, including the required finiteness qualification over general DVRs. SF.4’s audit list has neither owner, and RS-25 retains proved resolution settings without assigning these inputs (its SR4 assignment concerns SF.5 intersection theory). Add the scoped supplier links; do not merge their distinct characteristic-zero and arithmetic-surface hypotheses.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/12 — confirmed (medium)

The full AlgebraicCurves Layer 2 text asks for finiteness of normalization of k[X] in every finite extension of k(X), allowing an exactly scoped one-dimensional route. A0-extension explicitly asks for finite normalization under excellence; its audit identifies the absent excellent/Nagata machinery. Neither overlap list records the relationship. Add the two links and coordinate the general theorem with this specialization. Do not force the curve roadmap to wait for a stronger excellence theorem if its allowed direct one-dimensional proof is sufficient; reuse it in the general programme through an explicit comparison.

Sources: [IntegralClosure.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean), [FinitePolynomialModel.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/IntegralClosure/FinitePolynomialModel.lean), [NormalizationFinite.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/IntegralClosure/NormalizationFinite.lean), [PurelyInseparable.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/IntegralClosure/PurelyInseparable.lean).

### RT-AUDIT-01/13 — confirmed (medium)

WithVal.lean:477 constructs Valuation.Completion for any valuation; ValuedField.lean:514 and 566 give the extended valuation and its restriction formula. TauCeti.Place has exactly the required normalized valuation field at Place/Basic.lean:99, so this instantiates at every place without an affine model. AdicValuation.lean:602 wraps the same completion and RatFunc/Valuation.lean:138 constructs the infinity case. Correct the denial and keep partial. Crucial fix correction: the completed valuation ring is compared with the completion of O_P, not identified with the generally incomplete O_P itself. The remaining interfaces are its dense/injective map, completed maximal ideal/valuation filtration, residue-field equivalence and uniformizer compatibility. Also respect the audit’s five-citation cap: the target already has five entries, so replace redundant evidence or put additional locators in its note.

Sources: [Valuation.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/RatFunc/Valuation.lean), [AdicValuation.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DedekindDomain/AdicValuation.lean), [ValuedField.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Valued/ValuedField.lean), [WithVal.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Valued/WithVal.lean), [Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/Place/Basic.lean).

### RT-AUDIT-01/14 — confirmed (medium)

LinearDisjoint.lean:83 and 130 prove the cited different divisibility/product formulas, and Different.lean:958 relates divisibility to unramifiedness. They supply additional ideal-level arithmetic infrastructure beyond the two formal-unramifiedness citations. Correct the note and preserve absent status for the unrestricted place/Galois-closure target. Retain all section hypotheses in the new note: separable fraction-field towers, the integral-closure/Dedekind structures, module finiteness and the freeness/localization assumptions, as well as linear disjointness; linear disjointness alone is not the full Lean theorem.

Sources: [Different.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DedekindDomain/Different.lean), [LinearDisjoint.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DedekindDomain/LinearDisjoint.lean).

### RT-AUDIT-01/15 — confirmed (medium)

ProjectiveLine.lean:126, 145 and 174 supplies the GL(2,K) action, infinity fixed-point condition and the quadratic finite-fixed-point criterion; FinTwo.lean:229–244 gives the polynomial and its zero-iff-scalar result. Projectivization/Action.lean:247 gives the PGL action. Hence the only-two-pretransitivity note omits substantial existing input. Correct it while retaining the unproved PGL rigidity and function-field-automorphism identifications. When infinity is fixed, the quadratic coefficient vanishes, so the finite fixed-point bound is one; otherwise it is at most two. This is the needed case split, not three finite roots plus a possible extra infinity.

Sources: [FinTwo.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/FinTwo.lean), [Action.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Projectivization/Action.lean), [ProjectiveLine.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean).

### RT-AUDIT-01/16 — confirmed (low)

R09.3 and C3 both explicitly state algebraic effective descent of coherent modules, and the audit omits their link in both directions. C3 already imports R09.3. Confirm the missing scoped overlap entry, describing it as an existing supplier/consumer handoff rather than competing ownership; analytic descent remains C3 work.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/17 — confirmed (low)

The full LP1 stage constructs derived fpqc quotients and the cocycle-scheme quotient; its listed prerequisites omit R09.4. The affine classical quotient is shared with R09.4, whose audit omits LP1; AUDIT-21 likewise omits the reverse link. Add the classical-truncation comparison and reuse boundary. Do not equate the derived quotient formalism with the entire classical target.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/18 — confirmed (low)

Independently counted all eight layers: A0-extension has 9 absent/2 partial; R09.1 6/3; R09.3 6/2; C0 8/2; C3 2/1; C4 4/2; C5 7/2; SF.5 6/3. None has a fully present target. The tracked make_audit_jobs.py COMMON rule explicitly requires a present target for partly built. Set these to not built and retain their partial evidence. This local verification does not rely on the claimed corpus-wide counts or an untracked generated prompt.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/19 — confirmed (low)

Read the namespace boundaries and definitions in Subscheme.lean:652–788: the names are AlgebraicGeometry.Scheme.Hom.image, AlgebraicGeometry.Scheme.Hom.toImage and AlgebraicGeometry.Scheme.kerAdjunction. The source and declaration index also contain Algebra.Smooth.exists_finiteType (NoetherianDescent.lean:261) and Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete (AdicCompletion.lean:94). The three short citations and the index-absence explanations in the audit are stale. Correct the audit; let the orchestrator regenerate coverage.

Sources: [Subscheme.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean).

### RT-AUDIT-01/20 — confirmed (low)

GammaSpecAdjunction.lean:398 supplies the stated adjunction; Sites/Representability.lean:193–208 constructs a representing object. CommHopfAlgCat/Yoneda.lean:684 proves affine-group points representability. ComponentGroup/Representable.lean:409 gives the component quotient isomorphism under its finite-type and algebraically closed-field assumptions. These contradict the audit’s sole-example assertion. Qualify the remaining absence as the requested parameter spaces and their exported universal properties, and retain the hypotheses of the examples.

Sources: [GammaSpecAdjunction.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/GammaSpecAdjunction.lean), [Representability.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Representability.lean), [Yoneda.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/CommHopfAlgCat/Yoneda.lean), [Representable.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Connected/ComponentGroup/Representable.lean).

### RT-AUDIT-01/21 — confirmed (low)

Aut.lean:146–246 is the integral-domain section; autGroupMulEquiv at 222 and the dichotomy at 178 do not require a field. Correct that restriction. Qualify the proposed base-change wording: the injective map theorem at 191 also requires its target ring to be an integral domain. The computed automorphism group is the admissible Weierstrass variable-change group; a general scheme-automorphism comparison is not proved by this citation. Keep the level-rigidification target absent.

Sources: [Aut.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Aut.lean).

### RT-AUDIT-01/22 — confirmed (low)

Read Grassmannian.lean:68,123,188 and its complete TODO list. The constructions provide the module quotient functor on R-algebras, not a representing scheme, universal quotient sheaf or general quasi-coherent base. Relative to this composite target their fits are special case, not exact. The universal quotient sheaf is missing but is not literally on that TODO list. Keep partial and apply the proposed wording correction.

Sources: [Grassmannian.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Grassmannian.lean).

### RT-AUDIT-01/23 — confirmed (low)

IntegralClosure.lean:175 proves Module.Finite A C with the finite separable fraction-field extension, integral-closure, integrally closed and Noetherian hypotheses; line 220 gives Dedekindness. These apply to the polynomial-base model over C and are relevant ring-level inputs. The C4 note should acknowledge them. Keep partial: the finite scheme-normalization comparison, projective closure, smooth proper model and dense-open/finite-complement interfaces are not supplied by these two declarations. In particular, do not read the claim’s word only as deleting those remaining gaps.

Sources: [IntegralClosure.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean), [IntegralClosure.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/IntegralClosure.lean).

### RT-AUDIT-01/24 — confirmed (low)

The SF.3 audit calls R11.4 another Picard construction, while accepted RS-25 explicitly separates smooth Picard integration from the semistable/generalized-Jacobian degeneration extension. Confirm the misleading overlap classification. Prefer retaining an explicitly nonduplicate extension/consumer note if useful; do not transfer all smooth Picard theory to R11.4.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/25 — confirmed (low)

LPV.0 constructs nearby cycles and proves their proper-pushforward/smooth-base-change compatibilities, explicitly using EtaleBaseChange Layers 3–8. SF.2 integrates the upstream cohomological owners, as RS-25 confirms. These are not a second proof of the global base-change theorem. Reword the entry as a consumer of that theorem, or remove it from duplicates; preserve LPV.0’s genuinely new nearby-cycle transformations.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/26 — confirmed (low)

The full ModularCurves 5C passage explicitly treats connectedness comparison as an external hypothesis. C4 explicitly supplies it, and RS-06 assigns 5C the twisted curve and conditional irreducibility reduction. The current audit itself says external supplier contract. Confirm a presentation correction: label this a consumer/supplier contract, not another construction. Do not delete the dependency itself.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/27 — confirmed (low)

A5 expressly includes the genus-one differential/pairing comparison, while C6 lists those computations; neither the C6 overlap list nor AUDIT-08 A5 records this link. Add the scoped overlap. Preserve the sign convention: A5 uses homological types (-1,0),(0,-1), hence weight -1; C6’s first cohomology is dual and weight +1. The comparison must track dual lattices and polarization signs, as A5 requires, rather than literally identifying the two conventions.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/28 — confirmed (low)

EDC.2 explicitly builds finite-flat and smooth traces, relative purity and the displayed Poincare pairings. SF.6 asks for trace/cycle compatibility but only lists EDC.3 for cycle classes. AUDIT-18 EDC.2 also lacks SF.6. Add EDC.2 as the etale trace supplier; do not infer that it supplies coherent traces or all comparison compatibilities.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/29 — confirmed (low)

A0-extension explicitly includes representable-diagonal, deformation/obstruction and algebraization inputs in its Artin route; the SF.1/SF.4 audit lists omit it. Confirm these missing cross-references, coordinating the SF.4 correction with finding 6. Narrow the proposed SF.1 note to the diagonal criterion/input and its application: Artin’s criterion assumes the appropriate representable-diagonal condition, and does not prove that arbitrary moduli functors have representable diagonals.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/30 — confirmed (low)

JacobianChallenge Layer E explicitly owns T₀Pic⁰ ≅ H¹, dim Jac = g and theta principal polarization, while SF.3 asks for the Jacobian as an abelian variety. SF.3 lists A/B/D/F but omits E. Add the scoped upstream supplier. The general abelian-variety baseline does not itself implement the missing Jacobian specialization.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/31 — confirmed (low)

Span.lean:38 proves invariant spanning for a semilinear action with finite automorphism group; Injective.lean:42 supplies injectivity after base change under a finite Galois extension and the scalar-tower hypotheses. Together these give vector-space descent. Torus.lean:103 supplies the descended coordinate-Hopf-algebra isomorphism for a finitely generated exponent group (torsion-free for a torus). These are genuine object-descent special cases omitted by SF.1. Keep partial and respect the five-citation cap by replacing an entry or using the note.

Sources: [Torus.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/GroupAlgebra/Galois/Torus.lean), [Injective.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/GaloisDescent/Injective.lean), [Span.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/GaloisDescent/Span.lean).

### RT-AUDIT-01/32 — confirmed (low)

The scheme MayerVietoris.lean:115,152 and site MayerVietoris.lean:44,56 prove the claimed epimorphism and higher vanishing under explicit cohomology-acyclicity assumptions. This is more than the audit’s sole long-exact-sequence description. Add the conditional two-open result; keep the general analytic Leray/Cech comparison absent. Neither theorem automatically supplies acyclicity of analytic opens, affine opens, or the missing H-prime/restricted-sheaf cohomology comparison.

Sources: [MayerVietoris.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/Cohomology/MayerVietoris.lean), [MayerVietoris.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/Sites/SheafCohomology/MayerVietoris.lean).

### RT-AUDIT-01/33 — confirmed (low)

ConstantSheaf.lean:101,115 constructs the abelian-group presheaf and proves fpqc descent; Proetale.lean:79,82 gives the topology inclusions. The actual proofs supersede the stale fpqc TODO in the file header. For discrete Z/n the locally constant-functions interpretation is available, but the identification with the categorical constant sheaf is still expressly TODO. Qualify the audit note accordingly and keep the small-etale restriction/cohomology API gap; do not report that comparison as formalized.

Sources: [ConstantSheaf.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/ConstantSheaf.lean), [Proetale.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Proetale.lean).

### RT-AUDIT-01/34 — confirmed (low)

Subscheme.lean:661 is inside AlgebraicGeometry.Scheme; Smooth/Basic.lean:270 opens Algebra.FormallySmooth and its line 371 proves iff_comp_surjective. C4/C6 really contain Hom.image and SF.4 contains the doubled Algebra namespace. Replace these three names with the fully qualified source names. This is complementary to finding 19, not a request to change their mathematical fits.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/35 — confirmed (low)

DivisorClass.lean:79 visibly composes Point.toClassEquiv with the inverse of degreeZeroClassGroupEquiv specialized to W.CoordinateRing, discharging the unique-infinity premise with line 47 and degree_infinity. The general-equivalence audit note incorrectly says this instantiation is absent. Apply the correction while retaining the displayed Dedekind-coordinate-ring and DecidableEq hypotheses and avoiding a claim of a separately named W-specific intermediate equivalence.

Sources: [DivisorClass.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/DivisorClass.lean).

### RT-AUDIT-01/36 — rejected (low)

Rejected as a duplication finding. The full ModularForms 10B text explicitly constructs analytic structure sheaves, analytic cohomology and residue duality without GAGA. AlgebraicCurves Layer 4 constructs repartitions and Weil differentials for function fields over arbitrary exact constants, including positive characteristic. The equal-looking formulas are statements about different objects, whose comparison is separate mathematics; no shared construction or omitted supplier contract is demonstrated. RS-06 deliberately preserves 10B as the analytic owner. A comparison cross-reference could be useful, but is not evidence that either roadmap replans the other’s target. Moreover, the frozen AUDIT-16 now explicitly labels its JacobianChallenge overlap as an algebraic/analytic distinction.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/37 — confirmed (low)

The current index contains all three exact qualified names and lines. Read Luroth.lean:482,496 and Dvr.lean:129; their public modifier no longer prevents indexing. Delete only the index-absence parentheticals. The field-equivalence statement continues to require E nonbottom.

Sources: [Luroth.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/RatFunc/Luroth.lean), [Dvr.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DedekindDomain/Dvr.lean).

### RT-AUDIT-01/38 — confirmed (low)

Different/Divisor.lean:98 takes Module.finBasis F F-prime, then removes the finite bad set where basis vectors are not integral or its discriminant has nonzero order. Its header explicitly says no local integral basis is required. Replace global integral basis by arbitrary global field basis integral at almost every place; retain finite separability and the function-field hypothesis.

Sources: [Divisor.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/Different/Divisor.lean).

### RT-AUDIT-01/39 — confirmed (low)

InfinityPlace/Basic.lean:268 proves the valuation restriction equals the square of the rational-function infinity valuation under Field F. This supplies the quadratic Weierstrass cover’s index-two infinity datum, contrary to the blanket denial. Add it as related evidence and retain the missing general Kummer ramification/different/genus work. The characteristic-not-two conversion to a square-completed equation is an interpretation of this special case, not a newly checked formal bridge.

Sources: [Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/InfinityPlace/Basic.lean).

### RT-AUDIT-01/40 — confirmed (low)

LaurentSeries.lean:1154 identifies power series with their image subring in Laurent series and alone states no completion. Line 1229 is precisely the algebra equivalence to the X-adic completed valuation ring. Correct the fits and cite the latter special case; the general complete-DVR/local-expansion construction remains absent. The corrected note should be read together with finding 13: the generic valuation completion itself exists, while its place-specific power/Laurent-series comparison remains missing.

Sources: [LaurentSeries.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/LaurentSeries.lean).

### RT-AUDIT-01/41 — confirmed (low)

FunctionField/Basic.lean:116 proves trdeg one. TranscendenceBasis.lean:423 equates basis cardinality with transcendence degree, and SeparablyGenerated.lean:312 supplies a finite separating basis over a perfect field under EssFiniteType. Thus the one-element conclusion reduces to extracting the singleton and transporting the adjoin statement. Add those exact ingredients to both notes; do not claim that a separately named single-element theorem or its Lean elaboration has been checked.

Sources: [SeparablyGenerated.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/SeparablyGenerated.lean), [TranscendenceBasis.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AlgebraicIndependent/TranscendenceBasis.lean), [Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/Basic.lean).

### RT-AUDIT-01/42 — rejected (low)

Rejected. The audit already explicitly records that eta on k(x) and its normalization are built, and that the cotrace/derivation remains unavailable. The protocol defines partial as something close existing; it does not require any particular fit label, so partial plus related is not a contradiction. RatFunc.lean:145,181 constructs a single normalized Weil differential, not a function x mapping to Cotr(eta), a cotrace-identity theorem, or the derivation laws. Mathematically eta is the expected value at the rational generator, but without the stated identification it is related input under PROTOCOL section 1. Do not replace this honest note by a claim that the delta specialization is already built.

Sources: [RatFunc.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/Differential/RatFunc.lean).

### RT-AUDIT-01/43 — confirmed (low)

KummerExtension.lean:145–151 expressly excludes p=2 from the prime-power criterion; KummerPolynomial.lean:124 covers prime degree, including two. The audit’s unrestricted phrase prime powers therefore overstates coverage. Say odd degree and prime degree including two. Qualify the proposed final sentence as the general irreducibility criterion for even n>=4 being unprovided here; individual even-degree examples can still be proved by other criteria, so not every such polynomial is an unproved case.

Sources: [KummerExtension.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/KummerExtension.lean), [KummerPolynomial.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/KummerPolynomial.lean).

### RT-AUDIT-01/44 — confirmed (low)

Place/Extension/Eisenstein.lean:150 defines the valuation conditions and line 402 proves total ramification from a simple-extension generator with Eisenstein minimal polynomial. For positive n and ord_P(u)=1, T^n-u satisfies those conditions once identified with the minimal polynomial; then e=[F-prime:F]=n. Correct the only-tame-result note. Keep this a conditional application and retain the unresolved general gcd formula, different, constants and genus targets. Here v_P(u)=1 must mean additive order, not the multiplicative valuation being one.

Sources: [Eisenstein.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/Place/Extension/Eisenstein.lean).

### RT-AUDIT-01/45 — confirmed (low)

IntegralClosure.lean:175 gives separable normalization finiteness; FinitePolynomialModel.lean:141 provides the integral separating-polynomial-model form; PurelyInseparable.lean:167 proves finiteness over a finite-variable polynomial ring for finite purely inseparable fraction-field extensions. The audit’s Layer 2 already records those cases, so 12B should not erase them. Keep the general mixed-separability assembly and finite scheme-morphism bridge unproved in this record; this review does not claim either follows immediately from the three displayed statements.

Sources: [IntegralClosure.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean), [FinitePolynomialModel.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/IntegralClosure/FinitePolynomialModel.lean), [PurelyInseparable.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/IntegralClosure/PurelyInseparable.lean).

### RT-AUDIT-01/46 — confirmed (low)

MayerVietoris.lean:152 has exactly the claimed two-open, intersection-acyclicity hypotheses and n>=2 conclusion. It is useful conditional input for the two-chart curve model. Amend the blanket vanishing denial while keeping the comparison target absent. Explicitly retain both the affine acyclicity input and the missing comparison between Sheaf.H-prime on an open and cohomology of its restriction, which the source docstring flags; the two-open theorem alone establishes neither.

Sources: [MayerVietoris.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/Cohomology/MayerVietoris.lean).

### RT-AUDIT-01/47 — confirmed (low)

KrullDimension/FiniteType.lean:54 proves dim A equals the number of variables under an injective integral polynomial-algebra map; it does not even require a separate finite-type assumption. OfValuationSubring.lean:217,289 proves the DVR recognition and constructs a place from a proper valuation subring containing k. These are relevant omitted bridge ingredients. Add related evidence while retaining the scheme dimension/trdeg and stalk-to-valuation-subring/residue comparisons. The original scheme-specific absence statements are not themselves refuted; confirmation is of missing useful ring/valuation-level evidence.

Sources: [OfValuationSubring.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/Place/OfValuationSubring.lean), [FiniteType.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/KrullDimension/FiniteType.lean).

### RT-AUDIT-01/48 — confirmed (low)

AlgebraicCurves Layer 10’s four Weierstrass compatibility milestones concern genus, coordinate-ring normalization, arithmetic points versus places and divisor class groups. E.1 concerns the scheme model/points/isogeny dictionary, and accepted RS-18 narrows it further to integration of ModularCurves and AlgebraicCurves 12 suppliers. Remove the Layer-10 duplicate entry; retain the scoped Layer-12 relationship without describing E.1 as independently rebuilding its imported scheme.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/49 — confirmed (low)

12E explicitly imports JacobianChallenge A–B, introduces no new objects and states only the comparison, with smoothness/separable-generation scope. Layer B supplies cohomological RR and duality, not another proof of 12E’s dictionary. Confirm the classification correction. Delete the B entry from duplicates or relabel it as a supplier, while preserving its actual prerequisite; a dependency must not be removed merely because it is not duplication.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/50 — confirmed (low)

The full EllipticCurves 0.5 text owns translation pullbacks and their fixed-field theorem; AlgebraicCurves 11 includes that special case of its general automorphism/fixed-field programme and currently lists no overlaps. The cited translationHom and finite-translation fixed-field statements also exist at Basic.lean:314 and FixedField.lean:155. Add the scoped supplier/special-case link. Neither the elliptic stage nor those citations settle normality and finite quotient for the entire abstract elliptic function-field target.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/51 — confirmed (low)

EllipticCurves Layer 1 explicitly constructs omega in the same Mathlib Kahler module with dimension one and basis omega, while AlgebraicCurves 9 supplies the general separating-element basis and the Weil-divisor compatibility. Its list omits this elliptic specialization. Add the scoped shared-dimension/differential interface; retain the comparison from Kahler to Weil differentials and the zero-divisor conclusion as additional work, not results already supplied by the invariant-differential construction.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

### RT-AUDIT-01/52 — confirmed (low)

GammaSpecAdjunction.lean:611 uses one universe u for R,A,B. AffinePoint.lean:77 permits a monoid S in Type*, and Fan/Basic.lean:74 similarly permits a higher-universe lattice. With raw C as R=B the cited equivalence directly fits only universe zero. Confirm the missing implementation qualification: choose small models or lift/transport the coefficients and morphisms to a common universe. The underlying algebra/scheme correspondence remains valid, so retain mathlib; no Lean elaboration is asserted.

Sources: [GammaSpecAdjunction.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/GammaSpecAdjunction.lean), [Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean), [AffinePoint.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Toric/Analytic/AffinePoint.lean).

### RT-AUDIT-01/53 — confirmed (low)

Ray/Equiv.lean:194,218 uses only real-linear equivalences of the ambient spaces. Lines 260,276 separately add the compatible lattice map; the canonical-generator theorem also uses integral-lattice and toric-cone hypotheses. Correct the conflated note and mark ray transport more general relative to lattice equivalences. The primitive-generator fits keep their additional hypotheses.

Sources: [Equiv.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Toric/Algebraic/Ray/Equiv.lean).

### RT-AUDIT-01/54 — confirmed (low)

Both full stage descriptions construct complex charts identifying boundary components with coordinate hyperplanes; the toric README fixes the PartialDiffeomorph convention. RS-32 handles toric-to-Shimura integration but not R09.7d’s compactification interface. Add a scoped overlap for the shared analytic SNC chart predicate. These remain distinct toric and resolution/compactification theorems, so share the predicate and compatibility API without treating the full boundary theorems as duplicates. Searches in both pinned trees found no corresponding SNC predicate.

Sources: [atlas.json](https://github.com/CBirkbeck/tauceti-explorer/blob/ae16efd59f8727140b163dd6a3318e0da593cd2a/data/atlas.json).

