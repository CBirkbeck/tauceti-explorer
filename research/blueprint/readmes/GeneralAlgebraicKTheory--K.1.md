# GeneralAlgebraicKTheory — K.1

The blueprint for the first six layers of the general algebraic K-theory roadmap: K.1, the Q-construction and its smallness; K.2 with its two parts, the early ring model and plus comparison (K.2:plus) and the late low-degree comparison; K.3, the fundamental theorems for exact categories; K.4 with its early construction part (K.4:construction) and its late part; and K.5, relative and nonunital theories. Thirty-seven nodes written from five sources: four chapters of Weibel's K-book (the Grothendieck group, K₁ and K₂, the definitions of higher K-theory and the fundamental theorems) and Bühler's survey of exact categories. The chapters II, IV and V reproduce the hashes recorded in the reviewed integrated decomposition data/decompositions/GeneralAlgebraicKTheory.json, which is the base this packet builds on. The pinned exact-category carriers are imported, never redefined: TauCeti.ExactStructure with its base-change and bicartesian lemmas, ExactK0 with its class map, conflation relation and universal property, the category of conflations, and the finite-projective exact structure with its split-structure theorem and essentially small instance. K.1 gets the Q-construction, with composition proved from those carriers and no use of Quillen's axiom (c); its universal property; the small-model transport with its universe discipline; the identification of π₁ of the Q-construction with ExactK0 through ExactK0.lift and the covering classification rather than by counting; the K-groups K_n = π_n ΩBQ = π_(n+1) BQ; and the generic elementary properties. K.2:plus gets the exact scalar-extension functor on finitely generated projectives along arbitrary unital ring maps (the noncommutative functor itself is KTheoryLowDegrees Z.1's), the single early ring-model node (K(R) as a functor on rings with its degree-zero group, finite products, filtered colimits through idempotent matrices and opposite rings), the extension category EA of Q-type morphisms with its fibration, the plus-equals-Q theorem, and group-completion cofinality for free modules; K.2 records what the product description does not say, and K.2:low-degree-comparisons is a register of imports. Early K.3 gets the 3×3 lemma, the exact category of conflations, additivity, resolution with transfers and the degree-zero comparison with Tau Ceti's resolutionEquiv, dévissage and Quillen's localisation theorem for a Serre subcategory, all resting on K.1 and StableHomotopyKTheory H.1–H.2; the general cofinality theorem with its degree-zero correction keeps its K.3 id but belongs to a proposed late K.3:cofinality after K.4. K.4:construction gets Waldhausen categories, the S-construction with its latching condition and its iteration, the K-theory space, the comparison with Q, Waldhausen additivity and the relative S-fibration with the iterated deloopings, whose realisation step is requested from StableHomotopyKTheory H.2 with its hypotheses checked; H.5:S-delooping assembles the spectrum. Late K.4 keeps the fibration, approximation and Gillet–Waldhausen theorems. K.5 gets relative K-theory as a homotopy fibre, the distinction from support K-theory, the unitisation, excision with its failure, and Milnor's K₁–K₀ Mayer–Vietoris sequence for a Milnor square, assembled from KTheoryLowDegrees Z.1's patching and three exactness positions with the fourth proved here, and with no higher excision asserted. Round2 FIX-RT-AREA-ktheory-1~2 expands the proof inputs described in the fix report, updates source-reading boundaries and retains precisely named supplier gaps. The revised plan awaits independent review; it is not a formalization.

FIX-RT-AREA-ktheory-1~2, issue #5541. Codex, session codex-5ebb6f, 2026-10-02. The five revised packets await independent review. Earlier review decisions are preserved as history. This document is the planning roadmap; the suggested Lean signatures remain unchecked and were not compiled.

This packet has 83 nodes, 122 API items, 83 unit-test obligations and 1 explicitly remaining gaps. A complete disposition of an assigned fix does not assert closure of the entire roadmap.

## Scope and pinned library inputs

`GeneralAlgebraicKTheory:K.1`, `GeneralAlgebraicKTheory:K.2`, `GeneralAlgebraicKTheory:K.2:low-degree-comparisons`, `GeneralAlgebraicKTheory:K.2:plus`, `GeneralAlgebraicKTheory:K.3`, `GeneralAlgebraicKTheory:K.4`, `GeneralAlgebraicKTheory:K.4:construction`, `GeneralAlgebraicKTheory:K.5`

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.

- `mathlib:CategoryTheory.Core` — Mathlib/CategoryTheory/Core.lean. The maximal subgroupoid of a category, the groupoid of isomorphisms that the plus comparison localises. No additional read assertion recorded.

- `mathlib:CategoryTheory.Idempotents.Karoubi` — Mathlib/CategoryTheory/Idempotents/Karoubi.lean. The idempotent completion, the standard witness that cofinality changes the group in degree zero. No additional read assertion recorded.

- `mathlib:CategoryTheory.Limits.HasFilteredColimits` — Mathlib/CategoryTheory/Limits/Filtered.lean. Filtered colimits of categories, the input to K.1's generic colimit statement. No additional read assertion recorded.

- `mathlib:CategoryTheory.Limits.HasPushouts` — Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean. Pushouts, which the cofibration axioms of a Waldhausen category require along cofibrations. No additional read assertion recorded.

- `mathlib:CategoryTheory.ObjectProperty.IsSerreClass` — Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean. Serre classes in an abelian category, the hypothesis of Quillen's localisation theorem; the localisation long exact sequence itself is absent. No additional read assertion recorded.

- `mathlib:CategoryTheory.nerve` — Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean. The nerve of a category, the first ingredient of the K-theory space. No additional read assertion recorded.

- `mathlib:HomotopyGroup` — Mathlib/Topology/Homotopy/HomotopyGroup.lean. The homotopy groups of a pointed space, the third; no K-theory space is built from these three at the pins. No additional read assertion recorded.

- `mathlib:LinearMap.ker_eq_range_of_comp_eq_id` — Mathlib/Algebra/Module/Submodule/Range.lean. The complement is the image of the complementary idempotent, the other half. No additional read assertion recorded.

- `mathlib:Module.Finite.exists_comp_eq_id_of_projective` — Mathlib/RingTheory/Finiteness/Projective.lean. A finitely generated projective module is a retract of a finite free module, the module-theoretic half of K.2:plus's cofinality node. No additional read assertion recorded.

- `mathlib:ModuleCat.extendScalars` — Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean. Extension of scalars between module categories, pinned between commutative rings only. The functor along an arbitrary unital ring map is KTheoryLowDegrees:Z.1/extend-scalars, which agrees with this one for commutative rings; K.2:plus cites this declaration only for that comparison. No additional read assertion recorded.

- `mathlib:SSet.toTop` — Mathlib/AlgebraicTopology/SingularSet.lean. The realisation of a simplicial set, the second ingredient. No additional read assertion recorded.

- `mathlib:Unitization` — Mathlib/Algebra/Algebra/Unitization.lean. The canonical unitisation of a nonunital ring with its universal property, exactly the unitisation K.5 specifies; nothing K-theoretic is built on it at the pins. No additional read assertion recorded.

- `tauceti:TauCeti.ExactK0` — TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean. The Grothendieck group of an exact category, which the fundamental-group theorem of K.1 identifies with the first homotopy group of the Q-construction. No additional read assertion recorded.

- `tauceti:TauCeti.ExactK0.mapEquiv` — TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean. Invariance of that group under an exact equivalence, likewise. No additional read assertion recorded.

- `tauceti:TauCeti.ExactK0.ofLE_surjective` — TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean. The comparison of the Grothendieck groups of two exact structures on one category, which the audit records is NOT cofinality; K.3's cofinality node says so. No additional read assertion recorded.

- `tauceti:TauCeti.ExactK0.transportEquiv` — TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean. Invariance of that group under the transport, the degree-zero form of the independence K.1 states in every degree. No additional read assertion recorded.

- `tauceti:TauCeti.ExactStructure` — TauCeti/CategoryTheory/Exact/ExactStructure.lean. Quillen exact structures on an additive category, with conflations and admissible monomorphisms and epimorphisms. This is the stated input of K.1 and it is fully built; the Q-construction is built ON it, not instead of it. No additional read assertion recorded.

- `tauceti:TauCeti.ExactStructure.isConflationExact_split` — TauCeti/CategoryTheory/Exact/Functor.lean. Every additive functor is conflation-exact for split exact structures. This is why scalar extension on finitely generated projectives needs no flatness hypothesis, which is what K.2:plus asks for. No additional read assertion recorded.

- `tauceti:TauCeti.ExactStructure.resolutionEquiv` — TauCeti/CategoryTheory/GrothendieckGroup/ProjectiveResolution.lean. The degree-zero resolution isomorphism, proved under the stronger hypothesis that every resolving object is projective; K.3 states the general theorem in every degree and cites this as the pinned special case. No additional read assertion recorded.

- `tauceti:TauCeti.ExactStructure.transport` — TauCeti/CategoryTheory/Exact/Equivalence.lean. Transport of an exact structure along an additive equivalence, the pinned half of K.1's small-model target. No additional read assertion recorded.

- `tauceti:TauCeti.moduleResolutionEquiv` — TauCeti/Algebra/Category/ModuleCat/CartanMap.lean. The instance of that isomorphism for modules with finite projective resolutions. No additional read assertion recorded.

- `tauceti:TauCeti.simpleClassBasis` — TauCeti/RepresentationTheory/GrothendieckGroup/SimpleBasis.lean. The Grothendieck group of finitely generated modules over an artinian ring is free on the simple classes, which is devissage in degree zero; K.3 states the theorem in every degree. No additional read assertion recorded.

- `tauceti:TauCeti.finiteProjectiveModules` — TauCeti/Algebra/Category/ModuleCat/CartanMap.lean. Object property of finitely generated projective R-modules, R : Type u. Its full subcategory has an anonymous EssentiallySmall.{u} instance in this pinned file (CartanMap.lean, section 'Essential smallness'; not indexed by name), which fixes the universe of ExactK0 and of K(R) at u. No additional read assertion recorded.

- `tauceti:TauCeti.finiteProjectiveModulesExactStructure` — TauCeti/Algebra/Category/ModuleCat/CartanMap.lean. Existing exact structure on the full subcategory of finitely generated projectives; import this carrier rather than reconstruct it. No additional read assertion recorded.

- `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split` — TauCeti/Algebra/Category/ModuleCat/CartanMap.lean. The induced exact structure is equal to the split structure. This is the input that makes arbitrary scalar extension exact on projectives. No additional read assertion recorded.

- `tauceti:TauCeti.finiteProjectiveModulesExactStructure_conflation_iff` — TauCeti/Algebra/Category/ModuleCat/CartanMap.lean. Conflations are exactly short exact sequences after inclusion in ModuleCat R. No additional read assertion recorded.

- `tauceti:TauCeti.ExactK0.of` — TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean. Existing object-class map to ExactK0; the π₁ comparison must preserve this map. No additional read assertion recorded.

- `tauceti:TauCeti.ExactK0.of_conflation` — TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean. Existing conflation-additivity relation for the class map. No additional read assertion recorded.

- `tauceti:TauCeti.ExactK0.liftEquiv` — TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean. Existing universal property: conflation-additive invariants are additive homomorphisms out of ExactK0. No additional read assertion recorded.

- `tauceti:TauCeti.ExactK0.lift` — TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean. The homomorphism out of ExactK0 induced by a conflation-additive invariant; the map from ExactK0 to the fundamental group of the Q-construction is this lift of the two-edge loops. No additional read assertion recorded.

- `tauceti:TauCeti.ExactK0.hom_ext` — TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean. Two homomorphisms out of ExactK0 agreeing on object classes are equal; it checks one composite of the fundamental-group comparison. No additional read assertion recorded.

- `tauceti:TauCeti.ExactK0.AdditiveInvariant` — TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean. An isomorphism-invariant, conflation-additive function on objects with values in an abelian group: the datum ExactK0.lift consumes. Its values must lie in a commutative group, which is why the fundamental-group node proves commutativity before lifting. No additional read assertion recorded.

- `tauceti:TauCeti.ExactStructure.conflation_baseChange` — TauCeti/CategoryTheory/Exact/BaseChange.lean. Base change of a conflation along any morphism is a conflation with the same kernel: the admissible-epimorphism half of composition in Q, and the dual step of the exact category of conflations. No additional read assertion recorded.

- `tauceti:TauCeti.ExactStructure.conflation_cobaseChange` — TauCeti/CategoryTheory/Exact/BaseChange.lean. Cobase change of a conflation along any morphism is a conflation with the same cokernel (Bühler, Proposition 2.12); an input of the 3×3 lemma and of the exact category of conflations. No additional read assertion recorded.

- `tauceti:TauCeti.ExactStructure.conflation_comp_of_isPullback` — TauCeti/CategoryTheory/Exact/BaseChange.lean. The pullback of a deflation along an inflation is a kernel of the composite deflation, so the pullback of an admissible monomorphism along an admissible epimorphism is an admissible monomorphism (Bühler, Proposition 2.15). It is the admissible-monomorphism half of composition in Q and is proved from E1op and the kernel property alone, without Quillen's axiom (c). No additional read assertion recorded.

- `tauceti:TauCeti.ExactStructure.exists_conflation_comp` — TauCeti/CategoryTheory/Exact/BaseChange.lean. The Noether isomorphism for a composite of two inflations (Bühler, Lemma 3.5), the last step of the 3×3 lemma. No additional read assertion recorded.

- `tauceti:TauCeti.ExactStructure.bicartesianSq_of_isPushout_of_isInflation` — TauCeti/CategoryTheory/Exact/Bicartesian.lean. A pushout of an inflation is a bicartesian square (Bühler, Proposition 2.12), used in the 3×3 lemma. No additional read assertion recorded.

- `tauceti:TauCeti.ExactStructure.conflation_biprod` — TauCeti/CategoryTheory/Exact/Biproduct.lean. A biproduct of two conflations is a conflation; it makes the coproduct functor into the exact category of conflations exact. No additional read assertion recorded.

- `tauceti:TauCeti.ExactStructure.ConflationCategory` — TauCeti/CategoryTheory/Exact/Conflation.lean. The category of conflations of an exact structure: the full subcategory of short complexes on the conflations, with its three projection functors and functoriality in conflation-exact functors. It is the carrier of the extension category E(A) that K.3 makes exact; the pinned file puts no exact structure on it. No additional read assertion recorded.

- `mathlib:RingHom.pullback` — Mathlib/RingTheory/LocalRing/Pullback.lean. The pullback of two ring maps as a subring of the product, for arbitrary (noncommutative) rings: the ring B of a Milnor square. No additional read assertion recorded.

- `mathlib:RingHom.pullback_comm_sq` — Mathlib/RingTheory/LocalRing/Pullback.lean. The pullback square of rings commutes, which makes the composite of the first two maps of the Milnor sequence vanish. No additional read assertion recorded.

- `mathlib:Ideal.Quotient.ring` — Mathlib/RingTheory/Ideal/Quotient/Defs.lean. The quotient of a possibly noncommutative ring by a two-sided ideal ([I.IsTwoSided]) is a ring; it is the quotient map through which K.5 treats a pair (A, I) without narrowing to commutative rings. No additional read assertion recorded.

- `tauceti:TauCeti.ExactStructure.abelian` — TauCeti/CategoryTheory/Exact/Abelian.lean. The canonical exact structure of all short exact sequences on an abelian category: the ambient structure of Gillet–Waldhausen's closure hypothesis, where the ambient abelian category is data. No additional read assertion recorded.

- `tauceti:TauCeti.ExactStructure.fullSubcategory` — TauCeti/CategoryTheory/Exact/ExtensionClosed.lean. The exact structure induced on an extension-closed full subcategory; with ExactStructure.abelian it presents an exact category inside a given abelian category, the form in which the K-book's Definition II.7.0 is used here. No additional read assertion recorded.

## Sources and actual reading coverage

### The K-book: An introduction to algebraic K-theory, Chapter II: The Grothendieck group K_0

Charles A. Weibel. Author's online chapter file Kbook.II.pdf, 106 pages; chapter page numbers equal PDF page numbers..

[Source](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf)

SHA-256: `529ea8a5853e9fa55279e7ad79047155409b10847bd924b56f708f0950ebc607`.

**Read scope.**

- Downloaded and hashed on 24 September 2026; the hash reproduces the value recorded in the reviewed integrated decomposition of this roadmap, so this is the file its accepted review checked.
- §9.1, 9.1.1, 9.1.2, 9.1.3 and 9.1.8, pp. II.87 to II.88: categories with cofibrations (W0 to W2), Waldhausen categories with the gluing axiom, the saturation axiom, the Grothendieck group of a Waldhausen category, an exact category as a Waldhausen category, and exact functors.
- §9.2 and 9.3, pp. II.89 to II.92, read for the complex and extension examples that K.4 uses.
- NOT read: the rest of the chapter, in particular §§1 to 8 on the Grothendieck group itself, which the other roadmaps and Tau Ceti's pinned ExactK0 own.
- FIX-RT-AREA-ktheory-1: independently re-fetched, SHA-256 matched, and read II.8.2.4 p.77 and II.Ex.9.10(d) p.100 on 2026-09-29. Earlier readSections are provenance of the earlier workers.
- FIX-RT-AREA-ktheory-1 (cc-c2c06b, 2026-09-30): re-fetched from https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf, SHA-256 matched; read Definition 7.0 with (7.0.1) p. II.60, Exercise 7.8 pp. II.70–71 (Quillen's axioms (1)–(3), with (3) the axiom Keller shows redundant), Exercise 7.9 p. II.71, and Extension Categories 9.3 with Proposition 9.3.1 pp. II.92–93.

### The K-book: An introduction to algebraic K-theory, Chapter III: K_1 and K_2 of a ring

Charles A. Weibel. Author's online chapter file Kbook.III.pdf, 73 pages; chapter page numbers equal PDF page numbers..

[Source](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf)

SHA-256: `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307`.

**Read scope.**

- FIX-RT-AREA-ktheory-1 (cc-c2c06b): downloaded on 30 September 2026 from https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf and hashed.
- §2, pp. III.13–16, in full: GL(I) and E(R, I), the Relative Whitehead Lemma 2.1, Definition 2.2, Remark 2.2.1, Proposition 2.3 with its proof, Lemma 2.4, the Mayer–Vietoris Theorem 2.6 with its proof, and Exercises 2.1–2.3 (Swan's failure of excision for K_1).
- §4, pp. III.29–32: Definition 4.1 and 4.1.1 and the Mayer–Vietoris Theorem 4.3 with the paragraph before it, read for the boundary with K.6 and not decomposed here.
- Theorem 5.8 with its proof, p. III.41, read for the statement that the sequence extends to K_2 only for two ideals with I ∩ J = 0.
- NOT read: the rest of the chapter, whose classical K_1 and K_2 are owned by KTheoryLowDegrees and K2SymbolsBrauer.

### The K-book: An introduction to algebraic K-theory, Chapter IV: Definitions of higher K-theory

Charles A. Weibel. Author's online chapter file Kbook.IV.pdf, 93 pages; chapter page numbers equal PDF page numbers..

[Source](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf)

SHA-256: `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248`.

**Read scope.**

- Downloaded and hashed on 24 September 2026; the hash reproduces the decomposition's record.
- §1.11.1 to 1.11.3 and Exercises 1.15 to 1.17, pp. IV.8 to IV.9 and IV.16: relative groups as homotopy fibres with their long exact sequence and abelian structure, absolute excision with the criteria of Suslin and Suslin-Wodzicki, suspension rings, and the identification of the low relative groups.
- §6, pp. IV.53 to IV.61: Definition 6.1 with 6.1.1, subobjects 6.1.2, Proposition 6.2 with its proof and 6.2.1, Definition 6.3 and 6.3.1 to 6.3.5, Elementary properties 6.4 and Cofinality 6.4.1.
- §7, pp. IV.61 to IV.65: Theorem 7.1, Corollary 7.2, Definition 7.3 with (7.3.1), and the exercises 7.6 to 7.10 that record the low-degree consequences. The proofs of Lemma 7.5, Proposition 7.6, Lemma 7.7 and Theorem 7.8 were read only in outline.
- §8, pp. IV.66 to IV.75: Definitions 8.1, 8.2 with the extension axiom 8.2.1, 8.3 with (8.3.0) and 8.3.1, Proposition 8.4 with its proof, Definition 8.5 with 8.5.1, the infinite loop structure 8.5.5, the cylinder functors 8.8, Waldhausen Cofinality 8.9 with 8.9.1, and the exercises 8.5 to 8.15.
- §10.1 to 10.4, pp. IV.79 to IV.80, read for the boundary with K.6 and not decomposed here.
- NOT read: §§2 to 5, 9, 11 and 12.
- FIX-RT-AREA-ktheory-1: independently re-fetched, SHA-256 matched, and read IV.6.3–6.4 pp.54–56 and IV.8.5.3–8.5.5 p.69 on 2026-09-29. Earlier readSections are provenance of the earlier workers.
- FIX-RT-AREA-ktheory-1 (cc-c2c06b, 2026-09-30): re-fetched from https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf, SHA-256 matched; read Cofinality Theorem 4.11 and Corollary 4.11.1 pp. IV.44–45, Proposition 6.2 with its proof and Example 6.2.3 p. IV.54, Elementary Properties 6.4 and Cofinality 6.4.1 pp. IV.55–56, Exercise 6.6 p. IV.60, Definition 7.3 to Remark 7.5.2 pp. IV.62–63 (to separate the category EA from the exact category of conflations), 8.5 to 8.5.5 pp. IV.68–69, and Waldhausen Cofinality 8.9 with Remark 8.9.1 p. IV.72.
- FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f: pp.IV.62–65 read in full 2026-10-01, including proofs 7.5–7.8 and Exercises 7.2–7.5. Page63 also rendered and read as an image; two proof-line misprints recorded under E-extension-base-change-direction. Product comparison 7.9 is read as a statement only and remains K.7’s separate supplier work.

### The K-book: An introduction to algebraic K-theory, Chapter V: The fundamental theorems of higher K-theory

Charles A. Weibel. Author's online chapter file Kbook.V.pdf, 90 pages; chapter page numbers equal PDF page numbers..

[Source](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf)

SHA-256: `52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8`.

**Read scope.**

- Downloaded and hashed on 24 September 2026; the hash reproduces the decomposition's record.
- §1, pp. V.2 to V.10: the Additivity Theorem 1.2 with the opening of its proof, Corollary 1.2.1, Remark 1.2.2, Example 1.2.3, Proposition 1.7 with its proof, Proposition 1.8 with its proof, and 1.9 on flasque categories.
- §2, pp. V.12 to V.19: the Waldhausen Localization Theorem 2.1, the Gillet-Waldhausen Theorem 2.2 with the opening of its proof and Remark 2.2.1, the Cofinality Theorem 2.3 with its proof, the Approximation Theorem 2.4 with the opening of its proof, Remark 2.4.2, Changing cofibrations 2.5.1, the localisation sequences 2.6.1 to 2.6.3, the models 2.7.1 to 2.7.4 and Exercise 2.9.
- §3, pp. V.20 to V.30: the Resolution Theorem 3.1 with the opening of its proof, the transfer maps and base-change maps of 3.2 to 3.5, Example 3.5.3 on the projection formula, and Exercises 3.1 to 3.2.
- §4, pp. V.33 to V.34: the Devissage Theorem 4.1 with the opening of its proof, Open Problem 4.1.1, Corollary 4.2 and Applications 4.3 to 4.4.
- §5, pp. V.35 to V.38: the Abelian Localization Theorem 5.1 with (5.1.1) and the shape of its proof, Corollary 5.2, Open Problem 5.3 and Exercise 5.1.
- §7.1.1, p. V.52, for the caveat that the map of Grothendieck groups is not onto.
- NOT read: §§6, 8, 9 and 10, and the detailed proofs of 2.1, 2.4 and 5.1, which the source itself in part refers to Waldhausen for.
- FIX-RT-AREA-ktheory-1: independently re-fetched, SHA-256 matched, and read V.1.2–1.3 pp.2–4, V.1.7 p.8, and V.3.4.2 p.22 on 2026-09-29. Earlier readSections are provenance of the earlier workers.
- FIX-RT-AREA-ktheory-1 (cc-c2c06b, 2026-09-30): re-fetched from https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf, SHA-256 matched; read in full Definition 1.1 to Corollary 1.3.1 pp. V.1–4 (both proofs of the Extension Theorem), Proposition 1.7 with its proof and Remark 1.7.1 p. V.8, Exercises 1.1 and 1.7 p. V.10, Cofinality Theorem 2.3 with its proof and Corollary 2.3.1 pp. V.14–15, and the Resolution Theorem 3.1 with its full proof and Exercise 3.1 pp. V.20–21 and V.30.
- FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f, 2026-10-02: pp.V.12–17 read in full (fibration proof, approximation statement and omitted-proof warning, Gillet–Waldhausen and localisation instances); pp.V.35–37 read in full (all Claims5.1.2–5.1.7); IV.Exercise8.15 p.75 supplies the cylinder comma contraction. The K-book’s omitted approximation step is supplied by the freshly read Waldhausen proof, not claimed to be printed here.

### Exact categories

Theo Bühler. arXiv:0811.1480v2 (22 April 2009), 67 pages, the preprint of Expositiones Mathematicae 28 (2010), 1–69; printed page numbers equal PDF page numbers of the arXiv file. The journal version was not read..

[Source](https://arxiv.org/pdf/0811.1480v2)

SHA-256: `b7eaa8df7b6e572e2615776be4ab1930907f6c64b6a6610286d9ea5abc51d295`.

**Read scope.**

- FIX-RT-AREA-ktheory-1 (cc-c2c06b): downloaded on 30 September 2026 and hashed.
- §2, pp. 5–11: Definition 2.1 (axioms E0–E2 and their duals), Remarks 2.2–2.5, Lemma 2.7, Propositions 2.9–2.12, Proposition 2.15, Proposition 2.16 (the obscure axiom) with Remark 2.17 and Keller's proof, Corollary 2.18 and Exercise 2.19.
- §3, pp. 11–16: Proposition 3.1, the Five Lemma 3.2, Lemma 3.5 (Noether), Corollary 3.6 (the 3×3 lemma) with its proof, and Exercises 3.7–3.9 with Remark 3.10.
- §5, p. 18: Exercises 5.3 and 5.5 with the hint to 5.5.
- NOT read: §§4 and 6–13 and the appendices.

### Algebraic K-theory of spaces

Friedhelm Waldhausen. 1985 LNM1126, pp.318–419; public101-page scan. Explicit PDF/printed-page pairs are given at each locator; the scan omits a later page, so no global offset is used..

[Source](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kspaces.pdf)

SHA-256: `2f452696998132a438fe7596deb681fefcf829829b4604ca1029083e4dcb1c6e`.

**Read scope.**

- FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f: §1.4, printed pp.335–340 (PDF18–23), read in full; PDF18–19 text, PDF20–23 rendered images. Explicit fibre contractions and their pointwise-pushout coherence decomposed. No claim yet to have read the other sections.
- FIX-RT-AREA-ktheory-1~2, Codex codex-5ebb6f, 2026-10-02: Lemma1.6.5 printed352/PDF35 image; Lemma1.6.6 printed353/PDF36 text; Theorem1.6.7 printed354–359/PDF37–42, text at354 and images at355–359; §1.9 printed375–376/PDF57–58 images. Read and decomposed fully at those locators. Printed351/PDF34 fibration proof read as text; no claim to have read all cylinder definitions or all of§1.6.
- Product S-grid p342 and double-weak swallow p352 also read2026-10-02.

### Negative K-theory of derived categories

Marco Schlichting. Author preprint dated16June2003,28pages; no assertion about the published2006 edition..

[Source](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf)

SHA-256: `f59620e3ba25d5a8591a108d2b9647b68b5caf04794745862d2aa71e178b5aa6`.

**Read scope.**

- AppendixA.1–A.11,pp.24–27, including proofs of finite-diagram factorization, approximation and fibration. A.4’s cofinality proof refers to TT90; its original proof is being read separately, and no completed cofinality decomposition is claimed here. Remark11.2,p.20, for the actual Frobenius factorization.

### Higher algebraic K-theory of schemes and of derived categories

Robert W. Thomason and Thomas Trobaugh. Published chapter in The Grothendieck Festschrift, vol.III (1990), pp.247–435; institutional two-page-spread scan, not a preprint..

[Source](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/tt.pdf)

SHA-256: `48cdb707515c4d2e3a525610f4ff2b5b3d579dbec3ddc01b508922a5e7a50a7b`.

**Read scope.**

- §1.9.6–1.9.8, pp.270–275/PDF13–15, including the full proof, roof diagram1.9.8.3 and its strictification; §1.10.1 and full proof, pp.275–277/PDF15–16. Read rendered scan images because the PDF has no text layer. Other portions of the paper are not claimed read for this fix.

### Higher algebraic K-theory:I

Daniel Quillen. LNM341 (1973); Rochester-hosted scan; top typescript and bottom publication pagination differ.

[Source](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf)

SHA-256: `5d2db42d3fec06156da4e6f6d5a85fb9a04358df59141d3abe74a57b815bae04`.

**Read scope.**

- Sections2–5, PDF15–32, publication pp99–116 (typescript pp91–108), all page images read2026-10-02. The exact embedding argument on publication p100 explicitly omits details; use the previously read Bühler embedding/axiom input instead of claiming Quillen proves that step. Section8.1–8.3 was read previously; sections1 and6–7 are not claimed read here.

## Declarations and proof obligations

### Exact categories and Quillen's category Q(A)

`GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction` · construction · parent `GeneralAlgebraicKTheory:K.1` · implementation unchecked

For an exact category A the category Q(A) has the objects of A; a morphism from A to B is an equivalence class of diagrams in which A is received by an admissible epimorphism out of a subobject of B and that subobject is an admissible monomorphism into B, two such diagrams being equivalent when an isomorphism between them is the identity on A and on B. Composition is by pullback of the two middle objects. Equivalently a morphism from A to B is an admissible subobject of B together with an admissible epimorphism from it onto A. Two kinds of morphism are distinguished, the admissible monomorphisms and the oppositely oriented admissible epimorphisms; both are closed under composition, every morphism factors as one of the second kind followed by one of the first, uniquely up to isomorphism, the morphisms from the zero object to B correspond to the admissible subobjects of B, and the isomorphisms of Q(A) correspond to the isomorphisms of A.

**Hypotheses.**

- Import TauCeti.ExactStructure on a preadditive category with a zero object and binary biproducts: its ConflationClass supplies the kernel–cokernel pairs and its E0/E1/E2 fields with their duals the composition and base/cobase-change axioms. No competing exact-category carrier is defined. Composition in Q needs exactly two pinned facts: base change of a conflation along any map is a conflation with the same kernel (ExactStructure.conflation_baseChange), and the pullback of an admissible monomorphism along an admissible epimorphism is an admissible monomorphism, being a kernel of the composite deflation (ExactStructure.conflation_comp_of_isPullback; Bühler, Proposition 2.15). Both are proved from E1op, E2op and the kernel–cokernel property.
- Quillen's axiom (c) (Weibel, Exercise II.7.8(3); Bühler's 'obscure axiom', Proposition 2.16) is used by no node of this packet: every proof step is phrased in E0–E2, their duals and the kernel–cokernel property, as the composition step above shows. For the pinned carrier that axiom holds only for a morphism that has a cokernel (dually, a kernel), which is the hypothesis of Bühler's Proposition 2.16. The K-book defines exact categories inside an ambient abelian category (Definition II.7.0), which the pinned carrier does not have; the proofs here are intrinsic, and where a statement needs an ambient abelian category (the closure hypothesis of Gillet–Waldhausen) that category is part of the data, with the pinned induced structure.
- The equivalence classes of the defining diagrams must form a set; this is guaranteed for a small exact category, and the next node says how a small model is chosen.
- Composition uses the pullback of an admissible epimorphism along an arbitrary map, which exists and is again an admissible epimorphism by the base-change axiom; this is where the exactness axioms are used.

**Proof outline.**

1. Define the morphisms as equivalence classes of the displayed diagrams and check that the relation is an equivalence relation.
2. Define composition: for A ↞ B₂ ↣ B and B ↞ C₂ ↣ C form the pullback B₂ ×_B C₂ of the admissible epimorphism C₂ ↠ B along B₂ ↣ B (E2op). Its map to C₂ is an admissible monomorphism by ExactStructure.conflation_comp_of_isPullback and its map to B₂ an admissible epimorphism by ExactStructure.conflation_baseChange, so the composite A ↞ B₂ ×_B C₂ ↣ C is again of the required form by E1 and E1op.
3. Prove associativity and the identity laws from the universal property of the pullback, which is the representative-independence the stage text asks for.
4. Prove the subobject description: a morphism determines and is determined by an admissible subobject of the target together with an admissible epimorphism from it, so that morphisms out of the zero object are the admissible subobjects.
5. Prove the factorisation of every morphism into an oppositely oriented admissible epimorphism followed by an admissible monomorphism, unique up to isomorphism.
6. Prove that the isomorphisms of Q(A) are exactly those of A, and that Q of the opposite category is isomorphic to Q(A) with the two kinds of morphism exchanged.
7. Record the instance: the split exact structure on an additive category, where the admissible epimorphisms are the split surjections, and check that the construction does not silently identify it with a non-split one.

**Acceptance.**

- Morphisms from the zero object to B correspond to the admissible subobjects of B.
- Isomorphisms of Q(A) correspond to isomorphisms of A, so the construction does not collapse the automorphism groups.
- Q of the opposite exact category is isomorphic to Q(A), which is the symmetry the later comparisons use.
- For the split exact structure the admissible epimorphisms are the split surjections; a definition that used all epimorphisms would fail this.

**Prerequisites.**

- `tauceti:TauCeti.ExactStructure`
- `tauceti:TauCeti.ExactStructure.conflation_baseChange`
- `tauceti:TauCeti.ExactStructure.conflation_comp_of_isPullback`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `QCat` | data | The category Q(A) attached to an exact structure. |
| `QCat.hom_equiv_subobject` | characterisation | A morphism is an admissible subobject together with an admissible epimorphism onto the source. |
| `QCat.inflation` | data | The morphism attached to an admissible monomorphism. |
| `QCat.deflation` | data | The oppositely oriented morphism attached to an admissible epimorphism. |
| `QCat.factor` | characterisation | Every morphism factors as a deflation followed by an inflation, uniquely up to isomorphism. |
| `QCat.hom_zero` | characterisation | Morphisms out of the zero object are the admissible subobjects. |
| `QCat.isoQ_equiv_iso` | relation | The isomorphisms of Q(A) are those of A. |
| `QCat.op` | compatibility | Q of the opposite exact category is isomorphic to Q(A). |

**Consumers.**

- K.1, the universal property — The factorisation is exactly what makes a functor out of Q(A) determined by its values on the two kinds of morphism.
- K.1, the K-groups — The K-groups are the homotopy groups of the realisation of the nerve of this category.
- K.3, all four fundamental theorems — Each is proved by showing that a functor between Q-categories is a homotopy equivalence.
- K.4, the comparison with the S-construction — The comparison is a statement about this category.

**Unit tests.**

- `hom_from_zero` (degenerate) — Morphisms from the zero object to B are the admissible subobjects of B.
- `split_case` (non-example) — For the split exact structure the admissible epimorphisms are the split surjections; the construction must not use arbitrary epimorphisms.
- `iso_correspondence` (computation) — The isomorphisms of Q(A) are those of A.
- `op_iso` (computation) — Q of the opposite category is isomorphic to Q(A), exchanging the two kinds of morphism.

**Sources.**

- `Weibel.KBook.IV`: Definition 6.1 with 6.1.1, p. IV.53. The construction with its composition, verbatim.
- `Weibel.KBook.IV`: 6.1.2 (Subobjects) and the paragraph after it, p. IV.53. The subobject description and the two consequences, verbatim.
- `Weibel.KBook.IV`: 6.1, the paragraph on the two distinguished kinds of morphism, p. IV.53. The factorisation, verbatim; it is what the universal property of the next node rests on.
- `Buhler.ExactCategories`: Proposition 2.15, p. 10, and Proposition 2.16 with Remark 2.17, pp. 10–11 (arXiv v2). Proposition 2.15 is the composition step, proved from E1op and the kernel property; Proposition 2.16 is Quillen's axiom (c), valid only under its cokernel hypothesis and used by no node here.
- `Weibel.KBook.II`: Exercise 7.8, pp. II.70–71. Quillen's axiom (c) in the source's numbering, with its kernel and cokernel hypotheses.
- `Quillen.Higher1973`: Section2, PDF15–20/publication pp99–104, full images read. Original Q spans, universal property, K0 relation calculation, small skeleton transport and finite-data continuity checked. The embedding paragraph omits details and is not cited as its proof.

### The universal property of Q(A)

`GeneralAlgebraicKTheory:K.1/Q-construction-universal-property` · lemma · parent `GeneralAlgebraicKTheory:K.1` · implementation unchecked

To give a functor out of Q(A) it is enough to give an object for each object of A, a map for each admissible monomorphism and a map for each admissible epimorphism, such that each of the two assignments is functorial and such that for every bicartesian square with admissible monomorphisms horizontally and admissible epimorphisms vertically the two composites agree; the functor is then unique. In particular an exact functor of exact categories induces a functor of the Q-categories, and hence a map of K-groups. The proof is the factorisation of the previous node together with the rewriting of a deflation followed by an inflation into the normal form, which is what the bicartesian condition supplies.

**Hypotheses.**

- A is an exact category and the target is any category.
- The bicartesian squares in question are those coming from an admissible layer, that is from a pair of composable admissible monomorphisms.
- Uniqueness is up to equality of functors, not merely up to isomorphism, because the factorisation is unique up to unique isomorphism.

**Proof outline.**

1. Observe that every morphism of Q(A) is a deflation followed by an inflation, so a functor is determined by its values on those two classes.
2. Check that the two functoriality conditions make the assignment well defined on each class separately.
3. Check that a composite of two morphisms in normal form is again put in normal form by the bicartesian condition, which is what gives functoriality of the whole assignment.
4. Deduce that an exact functor induces a functor of Q-categories, since it carries admissible monomorphisms, admissible epimorphisms and bicartesian squares to the same.
5. Record the two uses the layer makes of it: the functor to the Grothendieck group used in the next node, and the functoriality of the K-groups.

**Acceptance.**

- An exact functor induces a functor of Q-categories and hence maps of all K-groups.
- The functor sending every inflation to the identity and every deflation to translation by the class of its kernel exists, by this property; it is what proves the fundamental-group theorem.
- The bicartesian condition cannot be dropped: without it the assignment is not functorial on composites.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `QCat.lift` | data | The functor out of Q(A) determined by the data. |
| `QCat.lift_inflation` | compatibility | Its value on an inflation. |
| `QCat.lift_deflation` | compatibility | Its value on a deflation. |
| `QCat.lift_unique` | characterisation | Uniqueness of the functor. |
| `QCat.map` | functoriality | The functor induced by an exact functor. |

**Consumers.**

- K.1, the fundamental group — The comparison with the Grothendieck group is built with this property, not by counting.
- K.1, functoriality of the K-groups — Every map of K-groups in this roadmap comes from an exact functor through this lemma.

**Unit tests.**

- `exact_functor_induces` (computation) — An exact functor induces a functor of Q-categories.
- `determined_by_two_classes` (compatibility) — Two functors agreeing on inflations and deflations are equal.
- `bicartesian_needed` (non-example) — Without the bicartesian condition the assignment is not functorial; the condition is not decorative.

**Sources.**

- `Weibel.KBook.IV`: 6.1, the factorisation, and 6.2, the proof, pp. IV.53 to IV.54. The factorisation this lemma turns into a universal property, and the use Weibel makes of it in the next node. Weibel does not state the universal property as a numbered result; the statement here is assembled from the factorisation and from the construction of the functor in the proof of Proposition 6.2, and the packet says so rather than attributing a numbered theorem to the source.
- `Quillen.Higher1973`: Section2, PDF15–20/publication pp99–104, full images read. Original Q spans, universal property, K0 relation calculation, small skeleton transport and finite-data continuity checked. The embedding paragraph omits details and is not cited as its proof.

### Small models, transport of the exact structure and independence

`GeneralAlgebraicKTheory:K.1/small-models-and-transport` · comparison · parent `GeneralAlgebraicKTheory:K.1` · implementation unchecked

The K-groups are defined for a small exact category. An exact category with only a set of isomorphism classes is replaced by an equivalent small subcategory, and the choice is irrelevant because an equivalence of exact categories induces a homotopy equivalence of the realisations; the comparison is natural in exact functors. Tau Ceti already has the algebraic half of this: it transports an exact structure along an additive equivalence and proves that the Grothendieck group is invariant under that transport and under exact equivalences, with the small-model choice fixed once. What is missing is the same statement for Q(A) and for the higher groups, and this node states it.

**Hypotheses.**

- The exact category has a set of isomorphism classes; the small subcategory is equivalent to it as an exact category, that is by an equivalence carrying conflations to conflations in both directions.
- Naturality is in exact functors: a square of exact functors and equivalences commutes up to a natural isomorphism, and isomorphic exact functors induce the same map.
- The pinned Tau Ceti transport is along an additive equivalence with the exact structure carried across; that is the hypothesis this node reuses.
- Universe discipline: the pinned ExactK0 E lives in Type w for [EssentiallySmall.{w} C], so the small model, its Q-category, nerve and realisation are taken w-small and every K-group lives in universe w. For a ring R : Type u the pinned EssentiallySmall.{u} instance of the finitely generated projectives fixes w = u. No universe is raised silently when passing to the model.

**Proof outline.**

1. Record the pinned statements: transport of an exact structure along an equivalence, invariance of the Grothendieck group under that transport, and invariance under an exact equivalence.
2. Prove that an exact equivalence induces an isomorphism of Q-categories and hence a homotopy equivalence of realisations.
3. Prove that isomorphic exact functors induce isomorphic functors of Q-categories and therefore the same maps of K-groups.
4. Deduce independence of the small model, and state the naturality in exact functors, which is the part the audit records as missing above degree zero.
5. Record that the basepoint may be taken to be any zero object, since there is a unique map between two zero objects in Q(A) and hence a canonical path.

**Acceptance.**

- The K-groups do not depend on the choice of small model, and the isomorphism is natural in exact functors.
- In degree zero the statement is Tau Ceti's pinned invariance of the Grothendieck group, and the two must agree.
- The choice of zero object does not matter.
- The comparison of the fundamental group with ExactK0 E : Type w is made on a w-small model, so the two groups live in the same universe.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`
- `tauceti:TauCeti.ExactStructure.transport`
- `tauceti:TauCeti.ExactK0.transportEquiv`
- `tauceti:TauCeti.ExactK0.mapEquiv`

**Sources.**

- `Weibel.KBook.IV`: Definition 6.3.1 and the surrounding remark, p. IV.55. Functoriality and the independence of the model up to isomorphic functors, verbatim.

### The fundamental group of the Q-construction is the Grothendieck group

`GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0` · theorem · parent `GeneralAlgebraicKTheory:K.1` · implementation unchecked

For an exact structure E on an essentially w-small category, with the pinned ExactK0 E : Type w, the realisation of the nerve of Q(E) on the w-small model of the previous nodes is a connected complex whose fundamental group at the zero object is ExactK0 E; the element corresponding to ExactK0.of A is the based loop made of the two edges from the zero object to A, the admissible monomorphism and the oppositely oriented admissible epimorphism. Both directions of the isomorphism come from universal properties: ExactK0.lift of the two-edge loops in one direction, and in the other the map on fundamental groups induced, through the classification of coverings, by the functor from Q(E) to ExactK0 E that the universal property of Q provides. No counting argument is used.

**Hypotheses.**

- C is preadditive with a zero object and binary biproducts and [EssentiallySmall.{w} C], as the pinned ExactK0 E : Type w requires. The realisation is formed on a w-small model and transported by K.1/small-models-and-transport, whose degree-zero part is ExactK0.transportEquiv.
- The orientation of the loop is fixed once and for all as in the source, and every later comparison uses that orientation.
- The Grothendieck group is the pinned ExactK0 E, generated by the objects with a relation for each conflation; its class map is ExactK0.of, its universal property ExactK0.lift (with liftEquiv) out of an ExactK0.AdditiveInvariant with values in a commutative group, and its extensionality ExactK0.hom_ext.

**Proof outline.**

1. Choose the distinguished inflation edge 0 ↣ A for each nonzero vertex A of the small Q-model as a maximal tree. These edges form a star. Do not take every morphism out of 0: the distinct edge represented by A ↠ 0 supplies the K₀ generator loop and must remain outside the tree.
2. Read off the presentation of the fundamental group from the maximal tree (StableHomotopyKTheory:H.1/coverings-fundamental-group-local-coefficients): it is generated by the morphisms of Q(E), modulo [t] = 1 for t in the tree and [f][g] = [f ∘ g] for composable pairs.
3. Reduce the generators: [B₂ ↣ B] = 1, so [A ↞ B₂ ↣ B] = [A ↞ B₂], and [A ↞ B][0 ↞ A] = [0 ↞ B]; hence the fundamental group is generated by the classes ℓ(A) = [0 ↞ A], represented by the two-edge loops of the statement.
4. For a conflation A ↣ B ↠ C the composite 0 ↣ C ↞ B equals 0 ↞ A ↣ B in Q(E), which gives ℓ(B) = ℓ(A)ℓ(C). Applied to the two split conflations with middle term A ⊞ C it gives ℓ(A)ℓ(C) = ℓ(C)ℓ(A), so the group, being generated by the ℓ(A), is commutative; isomorphic objects give equal ℓ. Hence ℓ is an ExactK0.AdditiveInvariant with values in the fundamental group written additively, and φ := ExactK0.lift ℓ : ExactK0 E → π₁ sends ExactK0.of A to ℓ(A).
5. Construct ψ : π₁ → ExactK0 E from the functor from Q(E) to ExactK0 E, regarded as a one-object groupoid, that K.1/Q-construction-universal-property gives: every inflation goes to 0 and every deflation, as a morphism of Q(E), to the class of its kernel (Weibel, Example 6.2.3). A morphism-inverting functor to a groupoid induces a homomorphism on fundamental groups by the covering classification of H.1.
6. Prove ψ ∘ φ = id by ExactK0.hom_ext, since ψ(ℓ(A)) is the class of the kernel of A ↠ 0, which is ExactK0.of A; prove φ ∘ ψ = id on the generators ℓ(A). No comparison of cardinalities enters.
7. Transport to an essentially small category through K.1/small-models-and-transport and ExactK0.transportEquiv, and check that the resulting isomorphism still sends ExactK0.of A to ℓ(A) and each conflation relation (ExactK0.of_conflation) to the relation ℓ(B) = ℓ(A)ℓ(C). The library has ExactK0 but not this comparison.

**Acceptance.**

- The class ExactK0.of A corresponds to the two-edge loop, with the orientation fixed here.
- The isomorphism is built from ExactK0.lift and the covering classification, as the stage text demands; equality of cardinalities is not a proof.
- The relation coming from a conflation is the additivity relation ExactK0.of_conflation, so the comparison is compatible with the pinned Tau Ceti presentation.
- The fundamental group and ExactK0 E live in the same universe w.
- For finite-dimensional vector spaces, the two Q-morphisms 0 → F corresponding to the subobjects 0 and F are distinct. The first is the chosen tree edge; killing both would incorrectly kill the generator of K₀(F) = ℤ.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/Q-construction-universal-property`
- `GeneralAlgebraicKTheory:K.1/small-models-and-transport`
- `StableHomotopyKTheory:H.1/coverings-fundamental-group-local-coefficients`
- `tauceti:TauCeti.ExactK0`
- `tauceti:TauCeti.ExactK0.of`
- `tauceti:TauCeti.ExactK0.of_conflation`
- `tauceti:TauCeti.ExactK0.AdditiveInvariant`
- `tauceti:TauCeti.ExactK0.lift`
- `tauceti:TauCeti.ExactK0.liftEquiv`
- `tauceti:TauCeti.ExactK0.hom_ext`
- `tauceti:TauCeti.ExactK0.transportEquiv`
- `mathlib:CategoryTheory.nerve`
- `mathlib:SSet.toTop`
- `mathlib:HomotopyGroup`

**Sources.**

- `Weibel.KBook.IV`: Proposition 6.2 with its proof, p. IV.54. The theorem, the representative of a class and the maximal-tree proof, verbatim.
- `Weibel.KBook.IV`: Proof of Proposition 6.2 and Example 6.2.3, p. IV.54. The generators, the additivity relation and the functor to the Grothendieck group from which the inverse map is built.
- `Quillen.Higher1973`: Section2, PDF15–20/publication pp99–104, full images read. Original Q spans, universal property, K0 relation calculation, small skeleton transport and finite-data continuity checked. The embedding paragraph omits details and is not cited as its proof.

### The K-groups of an exact category

`GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories` · definition · parent `GeneralAlgebraicKTheory:K.1` · implementation unchecked

For a small exact category A, define BQ(A) as the realisation of the nerve of Q(A), and KSpace(A) = ΩBQ(A) based at the zero object. Define K_n(A) = π_n KSpace(A) = π_(n+1) BQ(A), for n ≥ 0. The groups are abelian, including degree zero by the preceding ExactK0 comparison. Exact functors give maps and naturally isomorphic exact functors give homotopic maps. Essentially small inputs use the preceding small-model transport. The ring specialisation and its scalar-extension functor belong to the early K.2:plus ring node; scheme specialisations belong to SchemeKTheoryOperations:S.2.

**Hypotheses.**

- A is small, or has a set of isomorphism classes and is replaced by a small model as in the earlier node.
- The basepoint is a zero object, and the choice does not matter.
- Indexing: K_n(A) = π_n KSpace(A) = π_(n+1) BQ(A). Degree zero is π₀ of the loop space and π₁ of BQ, compared with ExactK0.

**Proof outline.**

1. Construct BQ(A), then its based loop space KSpace(A); define KGroup(A,n) as π_n of that loop space, equivalently π_(n+1) of BQ(A).
2. Prove that the groups are abelian in every degree, in degree zero by the previous node and above by the standard argument for homotopy groups in degree at least two.
3. Prove functoriality from the universal property, and that isomorphic exact functors give the same maps.
4. Keep this node generic in exact categories; import the early ring specialisation in its consumers and leave scheme specialisations to S.2.
5. Record what is pinned: the nerve of a category, the realisation of a simplicial set and the homotopy groups of a pointed space all exist in Mathlib, and no K-theory space is built from them.

**Acceptance.**

- In degree zero the definition agrees with the Grothendieck group.
- The zero exact category has contractible K-theory, so all its groups vanish.
- BQ(A) is connected even when ExactK0(A) is nonzero; KSpace(A) has π₀ = ExactK0(A). Confusing BQ with its loop space fails this test.
- The groups of a category and of its opposite agree.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0`
- `GeneralAlgebraicKTheory:K.1/small-models-and-transport`
- `mathlib:CategoryTheory.nerve`
- `mathlib:SSet.toTop`
- `mathlib:HomotopyGroup`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `KSpace` | data | The based loop space ΩBQ(A), whose π₀ is ExactK0(A). |
| `KGroup` | data | π_n KSpace(A), equivalently π_(n+1) BQ(A). |
| `KGroup.addCommGroup` | structure | The abelian group structure, in every degree including zero. |
| `KGroup.map` | functoriality | The map induced by an exact functor. |
| `KGroup.map_of_natIso` | compatibility | Isomorphic exact functors induce the same map. |
| `KGroup.zero_eq_exactK0` | relation | In degree zero the group is the pinned Grothendieck group. |

**Consumers.**

- Every later layer of this roadmap — K.2 compares these groups with the plus construction, K.3 proves the fundamental theorems about them, K.4 compares them with the Waldhausen construction and K.5 makes them relative.
- K.6 and K.7 — The nonconnective extension takes this connective theory as input, and the invariance and product statements are about it; their ring forms go through the early ring model of K.2:plus.
- The consumer roadmaps — ArithmeticKTheory, K2SymbolsBrauer, K3BlochGroups and the rest import these groups by name.

**Unit tests.**

- `degree_zero` (degenerate) — The zeroth group is the Grothendieck group.
- `zero_category` (degenerate) — The zero exact category has vanishing K-groups.
- `loop_indexing` (non-example) — BQ(A) is connected but π₀ KSpace(A) = ExactK0(A); the two spaces must not be identified.
- `opposite` (compatibility) — The groups of a category and of its opposite agree.

**Sources.**

- `Weibel.KBook.IV`: Definition 6.3, p. IV.54. Formula in Definition 6.3; the preceding sentence defines KA as ΩBQA. The former packet transcription omitted Ω.
- `Quillen.Higher1973`: Section2, PDF15–20/publication pp99–104, full images read. Original Q spans, universal property, K0 relation calculation, small skeleton transport and finite-data continuity checked. The embedding paragraph omits details and is not cited as its proof.

### Elementary properties: opposites, finite products and filtered colimits

`GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups` · theorem · parent `GeneralAlgebraicKTheory:K.1` · implementation unchecked

The K-groups of an exact category and of its opposite agree, since the two Q-categories are isomorphic; the direct sum of two exact categories is exact with Q of the sum the product of the Q-categories, so the K-groups of a finite direct sum are the products of the K-groups; and the K-groups commute with filtered colimits of exact categories, because the filtered colimit carries an exact structure, Q commutes with it and so do the classifying space and its homotopy groups. The direct sum makes the realisation a homotopy-commutative H-space, and the induced addition is the group operation. These are statements about exact categories only; their ring forms (finite products of rings, filtered colimits of rings through idempotent matrices, opposite rings) belong to the early ring model K.2/functorial-K-theory-of-a-ring.

**Hypotheses.**

- The products are finite; the colimits are over small filtering categories of exact categories and exact functors, and the colimit carries the exact structure whose conflations are the images of conflations at some stage (Weibel, Exercise II.7.9, through the axioms of Exercise II.7.8(1)–(2)).
- The H-space structure is the one induced by the direct sum, and the identification with the group structure is part of the statement.

**Proof outline.**

1. Prove that Q of the opposite category is isomorphic to Q(A), exchanging the two kinds of morphism, and read off the first statement.
2. Prove that Q of a direct sum of exact categories is the product of the Q-categories and that the realisation preserves finite products, and read off the second.
3. Equip a filtered colimit of exact categories with its exact structure, prove that Q commutes with the filtered colimit, and read off the third from the commutation of classifying spaces and homotopy groups with filtered colimits of small categories (StableHomotopyKTheory:H.1/filtered-colimits-of-categories).
4. Prove that the direct sum makes the realisation a homotopy-commutative H-space, and that the addition it induces on the homotopy groups is the group operation, using that the two inclusions are isomorphic to the identity.
5. Leave the ring instances to K.2/functorial-K-theory-of-a-ring, which needs the idempotent-matrix model to make the filtered colimit a functor of rings.

**Acceptance.**

- The K-groups of a direct sum of two exact categories are the products of the K-groups.
- The K-groups of a filtered colimit of exact categories are the colimit of the K-groups.
- Infinite products are not claimed; only finite ones.
- The H-space addition agrees with the group operation on homotopy groups.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`
- `StableHomotopyKTheory:H.1/filtered-colimits-of-categories`
- `mathlib:CategoryTheory.Limits.HasFilteredColimits`

**Sources.**

- `Weibel.KBook.IV`: Elementary properties 6.4, pp. IV.55 to IV.56. All three statements with their proofs, verbatim; the ring examples in the same passage are the ring model's (K.2/functorial-K-theory-of-a-ring).
- `Quillen.Higher1973`: Section2, PDF15–20/publication pp99–104, full images read. Original Q spans, universal property, K0 relation calculation, small skeleton transport and finite-data continuity checked. The embedding paragraph omits details and is not cited as its proof.

### Scalar extension as an exact functor of finitely generated projectives, without a flatness hypothesis

`GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality` · construction · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For a unital ring homomorphism f from A to B, possibly noncommutative, the scalar-extension functor f_! = B ⊗_A − of KTheoryLowDegrees Z.1 (Z.1/extend-scalars, the left adjoint of restriction of scalars, for arbitrary unital rings) restricts to an additive functor from the finitely generated projective A-modules to the finitely generated projective B-modules (Z.1/extend-scalars-finite-projective). This node makes it an exact functor of the pinned exact categories: the exact structure on finitely generated projectives is the split one (finiteProjectiveModulesExactStructure_eq_split), and every additive functor is exact for split structures (ExactStructure.isConflationExact_split), so no flatness hypothesis is needed. The identity and composition natural isomorphisms of Z.1/extend-scalars make f ↦ f_! a pseudofunctor into exact functors, which is what makes the K-theory of a ring functorial in K.2/functorial-K-theory-of-a-ring. Neither the arbitrary-ring functor nor its preservation of finitely generated projectives is in the pinned libraries; they are Z.1's, and this node does not rebuild them.

**Hypotheses.**

- The ring map is unital and the rings need not be commutative; the extension of scalars is Z.1's ExtendScalars (in the K-book's right-module notation P ↦ P ⊗_A B), not Mathlib's ModuleCat.extendScalars, which is stated for commutative rings and is used only for the comparison in the commutative case.
- No flatness is assumed. Flatness would be needed to preserve arbitrary exact sequences, and is not needed here because the exact structure on finitely generated projectives is the split one.
- The categories are the pinned full subcategories (finiteProjectiveModules R).FullSubcategory with finiteProjectiveModulesExactStructure R, each with the pinned EssentiallySmall.{u} instance, for rings in one universe u.

**Proof outline.**

1. Import from KTheoryLowDegrees Z.1 the functor ExtendScalars f with its unit and composition natural isomorphisms, and its restriction to an additive functor between the finitely generated projectives (Z.1/extend-scalars-finite-projective (b) and (d)).
2. Prove that the restriction is conflation-exact for the pinned structures: rewrite both with finiteProjectiveModulesExactStructure_eq_split and apply ExactStructure.isConflationExact_split; record that this is where the absence of a flatness hypothesis comes from.
3. Transport the unit and composition isomorphisms of Z.1/extend-scalars to natural isomorphisms of exact functors, so that f ↦ f_! respects identities and composites up to the specified isomorphisms.
4. For commutative rings, compare f_! with Mathlib's ModuleCat.extendScalars through Z.1's natural isomorphism.
5. Record the contrast on all finitely generated modules, where exactness of base change genuinely needs flatness.

**Acceptance.**

- Base change along any unital ring map, including noncommutative ones, induces an exact functor of the categories of finitely generated projectives, with no flatness hypothesis.
- Base change on all finitely generated modules is exact only under a flatness hypothesis; the two must not be confused.
- The exact functors attached to an identity and to a composite of ring maps are the identity and the composite, up to the natural isomorphisms of Z.1/extend-scalars.

**Prerequisites.**

- `KTheoryLowDegrees:Z.1/extend-scalars`
- `KTheoryLowDegrees:Z.1/extend-scalars-finite-projective`
- `mathlib:ModuleCat.extendScalars`
- `tauceti:TauCeti.ExactStructure.isConflationExact_split`
- `tauceti:TauCeti.ExactStructure`
- `tauceti:TauCeti.finiteProjectiveModules`
- `tauceti:TauCeti.finiteProjectiveModulesExactStructure`
- `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split`
- `tauceti:TauCeti.finiteProjectiveModulesExactStructure_conflation_iff`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `projBaseChange` | data | The exact functor f_! between the pinned exact categories of finitely generated projectives, for a unital ring map f. |
| `projBaseChange_exact` | characterisation | It is conflation-exact, by additivity alone, for the split structure. |
| `projBaseChange_id` | functoriality | The exact functor of the identity ring map is naturally isomorphic to the identity. |
| `projBaseChange_comp` | functoriality | Compatibility with composition of ring maps, through Z.1's composition isomorphism. |
| `projBaseChange_no_flat` | relation | No flatness hypothesis is needed here, unlike on all finitely generated modules. |
| `projBaseChange_comm` | compatibility | For commutative rings it is naturally isomorphic to the restriction of Mathlib's ModuleCat.extendScalars. |

**Consumers.**

- K.2:plus, the ring model — K.2/functorial-K-theory-of-a-ring defines the map of K-theory spaces of a ring map as K of this exact functor.
- K.2:plus, the plus comparison — The comparison is asserted to commute with ring maps, which needs this functor.
- K.5 — Relative K-theory of a ring map is the homotopy fibre of the map this functor induces.

**Unit tests.**

- `no_flatness` (computation) — The functor is exact without any flatness hypothesis.
- `free_case` (computation) — It carries a finite free module to a finite free module of the same rank.
- `composition` (compatibility) — It is compatible with composition of ring maps.
- `modules_need_flat` (non-example) — On all finitely generated modules exactness does need flatness; a formalisation that dropped it there would be wrong.
- `noncommutative_map` (computation) — For the inclusion of a field k into the matrix ring M₂(k), neither ring being commutative in the second case, the functor sends k to M₂(k), free of rank one over M₂(k); in K₀(M₂(k)) ≅ ℤ, generated by the simple module k², the class of M₂(k) is twice that generator, so the induced map ℤ = K₀(k) → K₀(M₂(k)) = ℤ is multiplication by 2.

**Sources.**

- `Weibel.KBook.IV`: Definition 6.3.2, p. IV.55. The definition of the K-theory of a ring for an arbitrary ring with unit, and the transfer in the opposite direction, verbatim; the arbitrary-ring scope is why the noncommutative functor of Z.1 is used.
- `Weibel.KBook.IV`: Definition 6.3.3, p. IV.55. The flatness hypothesis where it is genuinely needed, on all finitely generated modules, verbatim; the contrast with finitely generated projectives is the point of this node.

### The extension category and the fibration over Q(A)

`GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration` · construction · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For a small exact category A, EA has objects its conflations A₀ ↣ B ↠ C and Q-type three-row diagrams (IV.7.3.1) as morphisms, modulo isomorphism of the intermediate quotient. The right column defines t : EA → QA. Its fibre E_C is a groupoid: its arrows are pairs of isomorphisms on the kernel and middle terms over id_C. The functor Core(A) → E_0, A₀ ↦ (A₀ = A₀ ↠ 0), is an equivalence. Direct sum on kernel and middle terms defines a Core(A)-action leaving t fixed. This EA is distinct from the ordinary category of conflations used in exact-category additivity; it has no ordinary kernel-term or middle-term projection to A. The following nodes construct its fibre products, cartesian lifts and localised fibration separately.

**Hypotheses.**

- A is a small exact category with its pinned ExactStructure; this construction and the fibre-zero equivalence require no split-exactness assumption.
- Q-type morphisms have the orientation of IV.7.3.1: the target kernel embeds in the source kernel, and the source middle term embeds in the target middle term.

**Proof outline.**

1. Define the extension category with the source's morphisms (7.3.1) and the functor t to Q(A) taking a sequence to its quotient term, the right column of (7.3.1) being a morphism of Q(A). Record that the left column is an admissible monomorphism from the sub term of the target into that of the source and the middle column an admissible monomorphism from the total term of the source into that of the target, so that EA carries no exact sub- or total-term functors to A.
2. Prove that the quotient functor to Q(A) is fibred and identify the fibre over the zero object with the groupoid of isomorphisms.
3. Over id_C, the intermediate quotient is C and the kernel and middle arrows are isomorphisms by the kernel–cokernel property. Over C=0, the map from the kernel to the middle term is an isomorphism, giving the displayed equivalence with Core(A).
4. Use biproducts of conflations for the Core(A)-action; the action commutes with t and with its morphisms. The pullback, fibre-localisation and contractibility arguments are separate nodes below.

**Acceptance.**

- E_0 is equivalent to Core(A), preserving automorphisms.
- The quotient-column functor and direct-sum action preserve identity and composition.
- For a nonzero object X, the ordinary conflation (X = X → 0) has a zero endomorphism, while its EA fibre has only invertible endomorphisms.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`
- `mathlib:CategoryTheory.Core`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `ExtCat` | data | The extension category of an exact category. |
| `ExtCat.quot` | data | The quotient-term functor, which is the one fibred over Q(A). |
| `ExtCat.fibre_zero` | characterisation | The fibre over the zero object is the groupoid of isomorphisms. |

**Consumers.**

- K.2:plus, the plus-equals-Q theorem — The theorem is proved by applying the fibration criterion to the localised extension category.
- Weibel IV.7.3 to 7.5, as distinct from V.1.1.1 — The category of conflations with ordinary morphisms, not this one, is the extension category of the Additivity Theorem and the second term of the S-construction; the two are kept apart.

**Unit tests.**

- `fibre_is_iso_groupoid` (degenerate) — The fibre over the zero object is the groupoid of isomorphisms.
- `split_needed` (non-example) — For a non-split exact category the comparison category is not connected, so the hypothesis cannot be dropped.
- `quotient_functor_to_Q` (computation) — The right column of every morphism (7.3.1) is a morphism of Q(A), and composing morphisms of EA composes these columns, so taking the quotient term is a functor t from EA to Q(A).
- `not_directly_fibred` (non-example) — The fibration criterion does not apply to the extension category over Q(A) itself unless the category is zero; the localised functor must be used.
- `not_the_conflation_category` (non-example) — EA is not the category of conflations: its morphisms over an identity of Q(A) are pairs of isomorphisms (Weibel 7.4), whereas a conflation X ↣ X ↠ 0 with X nonzero has the zero endomorphism in the category of conflations; a formalisation that reused the category of conflations here would lose the identification of the fibre over 0 with the groupoid of isomorphisms.

**Sources.**

- `Weibel.KBook.IV`: Definition 7.3 with (7.3.1), p. IV.62. The extension category, verbatim.
- `Weibel.KBook.IV`: §7, the opening of the section, p. IV.61. The place where the source fixes the split-exactness hypothesis of this construction, verbatim.

### The plus-equals-Q theorem

`GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q` · theorem · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For a split exact category with isomorphism groupoid S, the LOOP SPACE of the realisation of Q(A) is the realisation of the localisation of S at itself, so the K-groups of A are those of the symmetric monoidal groupoid S in every non-negative degree. For the finitely generated projective modules over a ring this gives that the loop space of the realisation of Q is the product of the zeroth K-group with the plus construction on the classifying space of the stable general linear group, and hence that the K-groups defined from the Q-construction agree with those defined from the plus construction in every degree. The product description is a description of the space after choosing representatives of the components; it is not a claim that the infinite-loop structure splits as a product, and the translations between components are not natural.

**Hypotheses.**

- A is split exact and S is its groupoid of isomorphisms; the localisation is the one at the translation action, which is faithful.
- The identification with the product is at the level of spaces, after a choice of component representatives, exactly as the stage text demands.
- The comparison commutes with ring maps and with block sum; it is not asserted to commute with the noncanonical translations between components.

**Proof outline.**

1. State the theorem for a split exact category and record that the localised groupoid is the group completion of the groupoid.
2. Apply the fibration criterion to the localised extension category over Q(A), using that the two base changes attached to the two morphisms out of an object compose with the equivalence of the localised fibre to the identity and to the direct sum with that object, both homotopy equivalences.
3. Use the contractibility of the localised extension category to conclude that the loop space of the realisation of Q is the realisation of the localised groupoid.
4. Specialise to the finitely generated projectives over a ring, where the localised groupoid is the product of the zeroth K-group with the plus construction, and read off the comparison of the two definitions.
5. State the naturality: the comparison commutes with maps induced by ring homomorphisms and with block sum, and say explicitly that nothing is claimed about translations between components.
6. Record the degree-one and degree-two consequences the source gives as exercises, namely that the fundamental group is the zeroth group of the groupoid and that the second homotopy group carries the class of an automorphism to its class in the first K-group of the groupoid.

**Acceptance.**

- For every ring the loop space of the realisation of Q of the finitely generated projectives is the product of the zeroth K-group and the plus construction, and the two definitions of the K-groups agree in every degree.
- The product description holds after choosing component representatives; no natural product splitting of infinite-loop spaces is claimed.
- The identification in degree one carries the class of an automorphism to its class in the first K-group of the isomorphism groupoid.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration`
- `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`
- `StableHomotopyKTheory:H.4`
- `GeneralAlgebraicKTheory:K.2:plus/localised-extension-fibration`
- `GeneralAlgebraicKTheory:K.2:plus/extension-category-contractibility`

**Sources.**

- `Weibel.KBook.IV`: Theorem 7.1 and Corollary 7.2, pp. IV.61 to IV.62. The theorem, verbatim: it is the LOOP SPACE ΩBQA that is B(S⁻¹S); the previous excerpt had dropped the Ω. Prose verbatim from the text layer of the author's chapter file; formulas transcribed.

### Cofinality: a finitely generated projective has a complement making the sum free

`GeneralAlgebraicKTheory:K.2:plus/cofinality-of-projective-modules` · lemma · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

Every finitely generated projective module over a ring is a direct summand of a finite free module, so it has a complement whose sum with it is free, and that complement is again finitely generated projective. Consequently the monoidal inclusion of the finite free modules into the groupoid of finitely generated projectives is cofinal, and the group-completion cofinality theorem (Weibel, Cofinality Theorem IV.4.11, owned by StableHomotopyKTheory H.4) gives, through the plus-equals-Q theorem, that the K-groups of the split exact category of finite free modules and of the finitely generated projectives agree in every positive degree, while their zeroth groups need not. This is why the stable general linear group, which sees only free modules, detects the higher K-groups of a ring even when projectives are not free. Mathlib has the module-theoretic half; this node adds the K-theoretic consequence without using the late exact-category cofinality theorem of K.3, which comes after K.4.

**Hypotheses.**

- The ring has a unit; the module is finitely generated and projective.
- The complement is the kernel of the surjection from the finite free module, which is finitely generated and projective because the surjection splits.
- The finite free modules form a full subcategory of the finitely generated projectives closed under extensions (an extension of free modules splits), so it is a split exact category, and its automorphism groups are those computed in the projectives; these are the hypotheses of Cofinality Theorem IV.4.11(b).
- The K-theoretic conclusion is only for the groups in positive degrees; in degree zero the free category has a proper subgroup in general.

**Proof outline.**

1. Record Mathlib's statement: a finitely generated projective module is a retract of a finite free module, with the two maps composing to the identity.
2. Deduce that the kernel of the retraction is the image of the complementary idempotent, hence finitely generated and projective, and that the sum of the module with it is free.
3. Conclude that the inclusion of the groupoid of finite free modules into the groupoid of finitely generated projectives is a cofinal monoidal functor with the same automorphism groups.
4. Apply the group-completion cofinality theorem (H.4) to identify the basepoint components of the two group completions, and transport through the plus-equals-Q theorem for the two split exact categories to get the agreement of the positive K-groups.
5. For a counterexample in degree zero, choose a projective whose K₀ class is outside the subgroup generated by free modules, for example a nonprincipal invertible ideal over a Dedekind domain with nontrivial Picard group. Its determinant detects the missing class. Non-freeness alone is insufficient: a non-free stably free module has a free K₀ class. The general exact-category cofinality theorem, K.3/cofinality-degree-zero-correction, recovers the positive-degree statement after K.4 and is not needed here.

**Acceptance.**

- Every finitely generated projective has a complement making the sum free.
- The higher K-groups of the free and of the projective categories agree; the zeroth ones need not.
- The degree-zero counterexample uses a nontrivial determinant class over a Dedekind domain; a non-free stably free module is not a counterexample.
- The proof uses only group completion and the plus comparison, not Waldhausen K-theory.

**Prerequisites.**

- `mathlib:Module.Finite.exists_comp_eq_id_of_projective`
- `mathlib:LinearMap.ker_eq_range_of_comp_eq_id`
- `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`
- `StableHomotopyKTheory:H.4`

**Sources.**

- `Weibel.KBook.IV`: Cofinality Theorem 4.11 with its proof, and the paragraph before Corollary 4.11.1, pp. IV.44–45. The cofinality this node proves and the group-completion theorem it applies, verbatim; Corollary 4.11.1 is the resulting product description.

### The explicit models in degrees one, two and three

`GeneralAlgebraicKTheory:K.2:low-degree-comparisons/explicit-low-degree-models` · comparison · parent `GeneralAlgebraicKTheory:K.2:low-degree-comparisons` · implementation unchecked

Combining the plus-equals-Q theorem with the low-degree roadmaps identifies the first three K-groups of a ring with their classical models: the first is the quotient of the stable general linear group by its elementary subgroup, the second is the second homology of that elementary subgroup, equivalently the kernel of the Steinberg group over it, and the third is described by Suslin's sequence relating it to the Bloch group. None of the three is proved here: each is owned by another roadmap, and this node is the register that records which, states the combination, and fixes what the combination does and does not assert. The identifications are unconditional for the class of rings the owning statements are proved for; they are not field-specific.

**Hypotheses.**

- The ring has a unit; the stable general linear group and its elementary subgroup are the colimits of the finite ones.
- The identification in degree one is the statement of KTheoryLowDegrees, in degree two that of K2SymbolsBrauer and in degree three that of K3BlochGroups; this node only combines them with the plus comparison.
- Neither pinned library has the stable elementary subgroup, the stable general linear group, the Steinberg group, the Bloch group or any of the three K-groups, which is what makes this a register rather than a construction.

**Proof outline.**

1. Record the plus comparison of the previous layer as the bridge: the homotopy groups of the plus construction are the K-groups of the ring.
2. Record the degree-one identification with its owner, and state the compatibility with determinant and transfer that the owner proves.
3. Record the degree-two identification with its owner, and that it is the one compatible with the symbol description.
4. Record the degree-three identification with its owner, and that it goes through Suslin's exact sequence rather than being an isomorphism onto the Bloch group.
5. State the combination as a single statement and record that it is what the low-degree comparisons of the atlas consume.
6. Record what is absent from the pinned libraries, so that a reader does not look for these groups there.

**Acceptance.**

- The three identifications hold for the ring classes their owners state them for, and are not restricted to fields.
- The degree-three statement is an exact sequence, not an isomorphism with the Bloch group.
- None of the three is proved in this roadmap; each is imported by name.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`
- `KTheoryLowDegrees:U.6`
- `K2SymbolsBrauer:T.1:plus`
- `K3BlochGroups:V.4`

**Sources.**

- `Weibel.KBook.IV`: Corollary 7.2 and Definition 6.3.2, pp. IV.55 and IV.62. The bridge this register rests on, verbatim; the low-degree identifications themselves are the other roadmaps’ statements and are not quoted from this source.

### Matsumoto's presentation is field-specific, and the other identifications are not

`GeneralAlgebraicKTheory:K.2:low-degree-comparisons/matsumoto-is-field-specific` · comparison · parent `GeneralAlgebraicKTheory:K.2:low-degree-comparisons` · implementation unchecked

The identifications of the first three K-groups with their classical models hold for the stated class of rings. Matsumoto's presentation of the second K-group by symbols subject to the Steinberg relation is a different kind of statement: it is a theorem about FIELDS and does not extend to general rings. This node states the distinction, names the owner of each half, and records the error it exists to prevent, namely quoting the symbol presentation as though it were part of the general low-degree comparison.

**Hypotheses.**

- Matsumoto's theorem is for a field; the second K-group of a general commutative ring is not presented by symbols in this way.
- The general identification of the second K-group with the second homology of the stable elementary subgroup is unconditional for rings with a unit and is a different statement.
- Neither statement exists in the pinned libraries, which have no symbol presentation of any K-group.

**Proof outline.**

1. State the general identification and its owner.
2. State Matsumoto's presentation and its owner, with the field hypothesis explicit.
3. Record that the first is used unconditionally in the atlas and the second only over a field.
4. Record the non-example: for a general commutative ring the symbol map from the tensor square of the units need be neither injective nor surjective onto the second K-group, so the presentation fails.
5. Record that the Dennis-Stein symbols, which do present the second K-group of a suitable local ring, are the other roadmap's answer to the general case.

**Acceptance.**

- The general low-degree identifications are unconditional for their stated ring class.
- Matsumoto's presentation is a theorem about fields and is quoted as such wherever it is used.
- The symbol map for a general commutative ring is not an isomorphism onto the second K-group.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.2:low-degree-comparisons/explicit-low-degree-models`
- `K2SymbolsBrauer:T.2:symbols`

**Sources.**

- `Weibel.KBook.IV`: §7, the opening and Corollary 7.2, pp. IV.61 to IV.62. The unconditional half, verbatim. Matsumoto’s theorem is in chapter III of the same book, which was not read for this job; it is imported from K2SymbolsBrauer and the packet does not quote it.

### The early ring model: functorial connective K-theory of unital rings

`GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring` · construction · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For every unital, possibly noncommutative ring R : Type u, let P(R) be the pinned full subcategory (TauCeti.finiteProjectiveModules R).FullSubcategory with the pinned exact structure finiteProjectiveModulesExactStructure R, which is the split one (finiteProjectiveModulesExactStructure_eq_split), and the pinned EssentiallySmall.{u} instance. Set K(R) := KSpace(P(R)) = ΩBQ(P(R)) on the K.1 small model and K_n(R) := KGroup(P(R), n), in universe u. A unital ring map f : R → S induces K(f) := K(f_!) through the exact scalar-extension functor of K.2:plus/scalar-extension-and-functoriality, with K(id) ≃ id and K(g ∘ f) ≃ K(g) ∘ K(f) through its unit and composition isomorphisms. The model has four further properties, each the ring form of a generic K.1 statement: (i) π₀ K(R) ≅ RingK0 R ≅ ExactK0(P(R)), sending [P] to the class of P, naturally in R; (ii) the projections induce K_n(R × S) ≅ K_n(R) × K_n(S) for every n ≥ 0; (iii) for a small filtered diagram of unital rings with colimit R, colim K_n(R_i) ≅ K_n(R), computed on the equivalent categories of idempotent matrices, which are strictly functorial; (iv) Hom_R(−, R) is an exact equivalence P(R)^op ≃ P(R^op), so K_n(R^op) ≅ K_n(R). This one node owns the ring model: it depends neither on the plus comparison nor on the nonconnective theory, K.5 imports it, and the late K.6 and K.7 import it rather than rebuilding it.

**Hypotheses.**

- Unital associative rings and unital maps in one universe u; no commutativity, noetherian, flatness or invariant-basis-number hypothesis. The noncommutative scalar extension is KTheoryLowDegrees:Z.1/extend-scalars and is not in the pinned libraries.
- Universe and smallness: P(R) is essentially u-small by the pinned instance, K(R) is formed on its K.1 small model, and K(R), K_n(R) and ExactK0(P(R)) live in universe u; the choice of model is irrelevant by K.1/small-models-and-transport.
- Filtered diagrams are small; finite idempotent matrices, the matrices between them and the finitely many equations among these descend to a stage. The transition maps of the diagram need not be injective; the source's instance is a filtered union of subrings.
- Duality: for P in P(R), Hom_R(P, R) is a finitely generated projective right R-module, that is a left R^op-module, and P → Hom_{R^op}(Hom_R(P, R), R) is an isomorphism; the functor is contravariant.

**Proof outline.**

1. Import the pinned exact category P(R) with its essentially small instance and apply K.1 to its small model. Construct K(f) from the exact functor f_! of K.2:plus through K.1's functoriality, and obtain K(id) ≃ id and K(g ∘ f) ≃ K(g) ∘ K(f) from the natural isomorphisms of f_!, since isomorphic exact functors induce homotopic maps (K.1).
2. Degree zero: K.1/pi1-BQ-equals-K0 gives π₀ K(R) ≅ ExactK0(P(R)), and KTheoryLowDegrees:Z.1/ring-k0-exact gives RingK0 R ≃ ExactK0(P(R)); both send [P] to the class of P, and naturality in f holds because RingK0.map f (Z.1/ring-k0-map) and the map of f_! agree on classes (ExactK0.hom_ext).
3. Products: the central idempotents (1, 0) and (0, 1) of R × S split each finitely generated projective module as the sum of its two parts; scalar extension along the two projections is an exact equivalence P(R × S) ≃ P(R) × P(S), and K.1/elementary-properties-of-K-groups for direct sums gives the product formula in every degree.
4. Filtered colimits: replace P(R) by the equivalent idempotent-matrix category, the idempotent completion of the finite free modules (KTheoryLowDegrees:Z.1/projective-karoubi), which is strictly functorial in ring maps by applying them to matrix entries and is compatible with f_! because the scalar extension of the idempotent module P(e) is P(f(e)) (KTheoryLowDegrees:Z.1/extend-scalars-finite-projective (c)); objects, morphisms and equations descend to a stage, so it commutes with filtered colimits of rings as an exact category, and K.1's filtered-colimit statement with the small-model independence gives colim K_n(R_i) ≅ K_n(R).
5. Opposite ring: Hom_R(−, R) is additive, sends R to R^op and hence finite free modules to finite free modules and summands to summands, and the evaluation map to the double dual is an isomorphism (checked on R and extended to summands), so it is an equivalence P(R)^op ≃ P(R^op), exact for the split structures. K.1's statement for opposite categories then gives K_n(R^op) ≅ K_n(R).
6. Leave the naturality of the plus comparison to its own node, and record that K.5's relative ring theory uses this K(R) and the actual map K(f).

**Acceptance.**

- The two projections R × S → R, S give the product isomorphism in degree zero and every higher degree.
- Identity and two composable ring maps give the same K-map as the corresponding tensor unit and associativity isomorphisms.
- In degree zero the model is RingK0 R, with K₀(f) = RingK0.map f.
- An idempotent matrix over a filtered colimit, and an equality between two maps, descend at a sufficiently large stage.
- The isomorphism K_n(R^op) ≅ K_n(R) is induced by the contravariant duality, not by an identification of the two categories.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`
- `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`
- `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`
- `GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0`
- `GeneralAlgebraicKTheory:K.1/small-models-and-transport`
- `KTheoryLowDegrees:Z.1/projective-karoubi`
- `KTheoryLowDegrees:Z.1/extend-scalars-finite-projective`
- `KTheoryLowDegrees:Z.1/ring-k0-exact`
- `KTheoryLowDegrees:Z.1/ring-k0-map`
- `tauceti:TauCeti.finiteProjectiveModules`
- `tauceti:TauCeti.finiteProjectiveModulesExactStructure`
- `tauceti:TauCeti.finiteProjectiveModulesExactStructure_eq_split`
- `tauceti:TauCeti.ExactK0.hom_ext`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `KSpace.ofRing` | data | The K-theory space K(R) = ΩBQ(P(R)) of a unital ring, in the ring's universe. |
| `KSpace.ofRing_map` | functoriality | The map K(f) induced by a unital ring homomorphism through projBaseChange. |
| `KSpace.ofRing_map_id` | functoriality | The identity ring homomorphism induces the identity, with the small-model comparison. |
| `KSpace.ofRing_map_comp` | functoriality | Composition of unital ring maps induces composition of K-space maps up to the specified natural homotopy. |
| `KGroup.ofRing_zero_equiv` | compatibility | π₀ K(R) ≅ RingK0 R ≅ ExactK0(P(R)), natural in R, sending [P] to its class. |
| `KGroup.ofRing_prod` | compatibility | Compatibility with finite products of rings. |
| `KGroup.ofRing_colimit` | compatibility | Compatibility with filtered colimits of rings, through the idempotent-matrix model. |
| `KGroup.ofRing_op` | equivalence | K_n(R^op) ≅ K_n(R), induced by the exact duality P(R)^op ≃ P(R^op). |

**Consumers.**

- K.5 — Relative K-theory is the homotopy fibre of the map this functor induces, and the Milnor-square sequence identifies its K₀ end through the degree-zero comparison.
- K.6 and K.7 — The nonconnective extension, Morita invariance and the product and colimit statements for rings import this functor instead of redefining it.
- The consumer roadmaps — Every roadmap that speaks of the K-theory of a ring imports this functor.

**Unit tests.**

- `product_ring` (computation) — The two projections R × S → R,S give the product isomorphism in degree zero and every higher degree.
- `scalar_identity_composition` (compatibility) — Identity and two composable ring maps give the same K-map as the corresponding tensor unit/associativity isomorphisms.
- `nonflat_projectives` (non-example) — ℤ → ℤ/2 induces exact scalar extension on the split projective category although it is not flat on all modules.
- `filtered_idempotent_descent` (computation) — An idempotent matrix over a filtered colimit and an equality between two maps descend at a sufficiently large stage.
- `degree_zero_ring` (compatibility) — The degree-zero group of K(R) is RingK0 R, and K₀(f) is RingK0.map f; for R = ℤ it is ℤ generated by [ℤ].
- `duality_not_identity` (non-example) — For a commutative ring the isomorphism K₀(R^op) ≅ K₀(R) induced by duality, composed with R^op = R, sends [P] to [Hom_R(P, R)]; for a Dedekind domain it inverts the ideal class of an invertible ideal, so it is not the identity when the class group has an element of order greater than two.

**Sources.**

- `Weibel.KBook.IV`: Definition 6.3.2 and Elementary properties 6.4, pp. IV.55 to IV.56. The functor and the two compatibilities, verbatim.
- `Weibel.KBook.IV`: Elementary Properties 6.4, the ring instances, pp. IV.55–56. The opposite-ring statement and the idempotent-matrix model, verbatim (formulas transcribed from the text layer); the source states the colimit for a filtered union of subrings, and the node proves it for filtered colimits by the same descent.

### What the product description does not say

`GeneralAlgebraicKTheory:K.2/no-natural-product-splitting` · comparison · parent `GeneralAlgebraicKTheory:K.2` · implementation unchecked

The loop space of the realisation of Q of the finitely generated projectives over a ring is homotopy equivalent to the product of the discrete zeroth K-group with the plus construction on the classifying space of the stable general linear group. The equivalence is of spaces and depends on a choice of representative in each component. It is not an equivalence of infinite-loop spaces splitting the K-theory spectrum as a product, and the translations used to move between components are not natural in the ring. This node records the distinction as a non-example, because the product formula is exactly the kind of statement that is easy to over-read, and because the stage text names it.

**Hypotheses.**

- The ring is unital; the zeroth K-group is taken with its discrete topology.
- A choice of a finitely generated projective module in each class is made once and the equivalence depends on it.
- The infinite-loop structure on the left is that of the connective Ω-spectrum that StableHomotopyKTheory:H.5:S-delooping assembles from the K.4:construction deloopings, or that of the group completion (H.4); the statement is about that structure.

**Proof outline.**

1. State the product description with the choice made explicit.
2. State what is natural: the comparison commutes with ring maps and with block sum.
3. State the non-example: the splitting is not one of infinite-loop spaces, and no natural choice of component representatives exists in general.
4. Record the consequence for computations: a class in a non-zero component is compared with one in the zero component only after a translation, and the translation must be carried along in any argument.

**Acceptance.**

- The description is of spaces after a choice, not of infinite-loop spaces.
- The translations between components are not natural in the ring.
- Statements proved in the zero component do not transport to the other components for free.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`

**Sources.**

- `Weibel.KBook.IV`: Corollary 7.2, p. IV.62. The product description, verbatim, with the Ω the previous excerpt had dropped. Prose verbatim from the text layer of the author's chapter file; formulas transcribed.

### The 3×3 lemma for exact categories

`GeneralAlgebraicKTheory:K.3/three-by-three-lemma` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For the pinned exact structure, consider a commutative 3×3 diagram whose three columns are conflations. If either (i) the middle row and one of the outer rows are conflations, or (ii) the two outer rows are conflations and the composite of the two maps of the middle row is zero, then the remaining row is a conflation.

**Hypotheses.**

- E is the pinned TauCeti.ExactStructure; no ambient abelian category, no weak idempotent completeness and no form of Quillen's axiom (c) is assumed.
- In case (ii) the vanishing of the middle composite is a hypothesis: it is what identifies the first map of the middle row as a kernel, and without it the middle row need not be a complex.

**Proof outline.**

1. Case (i) with the first two rows conflations (the other case is dual): push out the first row along A′ → A (E2) to factor the morphism of the first two rows through a conflation A ↣ D ↠ C′ with the same quotient (ExactStructure.conflation_cobaseChange; Bühler, Proposition 3.1); both squares of the factorisation are bicartesian (ExactStructure.bicartesianSq_of_isPushout_of_isInflation and its dual).
2. Identify the cokernels of B′ ↣ D and of D ↣ B through the maps induced out of the pushout, and prove the one commutativity not given by construction from the pushout property of the square on A′, B′, A and D.
3. Conclude with the Noether isomorphism for exact categories (ExactStructure.exists_conflation_comp; Bühler, Lemma 3.5) that the third row is a conflation.
4. Case (ii): push out under the second map of the first row and the middle column, obtain a map to the third term of the middle row and show, by the pullback characterisation (Bühler, Proposition 2.12), that it is a deflation and that the middle row's second map is one; then use the vanishing composite and the dual characterisation with the kernel of a composite deflation (ExactStructure.conflation_comp_of_isPullback; Bühler, Proposition 2.15) to show that the first map of the middle row is its kernel.

**Acceptance.**

- Both cases hold in every exact category, with no abelian embedding.
- In case (ii) the hypothesis that the middle composite vanishes cannot be dropped.
- For the canonical exact structure of an abelian category the statement is the classical nine lemma.

**Prerequisites.**

- `tauceti:TauCeti.ExactStructure`
- `tauceti:TauCeti.ExactStructure.conflation_cobaseChange`
- `tauceti:TauCeti.ExactStructure.conflation_baseChange`
- `tauceti:TauCeti.ExactStructure.bicartesianSq_of_isPushout_of_isInflation`
- `tauceti:TauCeti.ExactStructure.exists_conflation_comp`
- `tauceti:TauCeti.ExactStructure.conflation_comp_of_isPullback`

**Sources.**

- `Buhler.ExactCategories`: Corollary 3.6 (3 × 3-Lemma) with its proof, pp. 13–14 (arXiv v2). The statement, verbatim; the proof steps follow Bühler's two cases.
- `Buhler.ExactCategories`: Proposition 3.1 and Lemma 3.5, pp. 12–13 (arXiv v2). The factorisation of case (i); Lemma 3.5 is the Noether isomorphism that Tau Ceti already has.

### The exact category of conflations

`GeneralAlgebraicKTheory:K.3/exact-category-of-conflations` · construction · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For an exact structure E on a preadditive category A with a zero object and binary biproducts, the pinned category of conflations (TauCeti.ExactStructure.ConflationCategory: the full subcategory of short complexes on the conflations, with all morphisms of short complexes) carries an exact structure whose conflations are the sequences σ′ → σ → σ″ of conflations whose sub-term, total-term and quotient-term components are E-conflations. With it, written E(A), the three projection functors s, t, q to A are exact, the coproduct functor ∐ : A × A → E(A), (X, Z) ↦ (X ↣ X ⊞ Z ↠ Z), is exact, s ↣ t ↠ q is a short exact sequence of exact functors, and it is universal: exact functors B → E(A) correspond to short exact sequences of exact functors B → A. This is the extension category of Weibel V.1.1.1 and II.9.3, on which the Additivity Theorem is proved; it is not the category EA of IV.7.3 that K.2:plus uses for the plus comparison.

**Hypotheses.**

- E is the pinned TauCeti.ExactStructure; the construction is intrinsic in E0–E2, with no ambient abelian category and no form of Quillen's axiom (c).
- A conflation of E(A) is a sequence σ′ → σ → σ″ of objects and morphisms of the pinned category of conflations whose three columns are E-conflations; its rows are conflations because they are objects of that category.
- For K-theory, A is essentially small; then so is E(A).

**Proof outline.**

1. Kernel–cokernel pairs: a morphism of conflations whose composite into σ″ vanishes factors uniquely through σ′ componentwise, because each column is a kernel–cokernel pair, and the components commute with the row maps because the column inflations are monomorphisms; dually for cokernels. Closure under isomorphism is componentwise.
2. E0 and E0op: the identity of a conflation is componentwise the identity, whose columns are conflations.
3. E1: a composite of two inflations of E(A) is componentwise a composite of inflations (E1), and its componentwise cokernels form a conflation by the 3×3 lemma (i) applied to the first two rows (K.3/three-by-three-lemma). E1op is dual.
4. E2: for an inflation σ′ ↣ σ with cokernel σ″ and any morphism σ′ → ρ take componentwise pushouts, which exist by E2 in A. Each new column is a conflation with the old cokernel (ExactStructure.conflation_cobaseChange), the two maps of the pushout row compose to zero by the pushout property, and the pushout row is a conflation by the 3×3 lemma (ii), its outer rows ρ and σ″ being conflations. The componentwise pushout is a pushout in E(A) because morphisms of conflations are determined componentwise. E2op is dual, with componentwise pullbacks (ExactStructure.conflation_baseChange).
5. Exactness of s, t and q is the definition of the conflations of E(A); ∐ is exact because a biproduct of conflations is a conflation (ExactStructure.conflation_biprod).
6. Universal property: an exact functor F : B → E(A) gives the short exact sequence s∘F ↣ t∘F ↠ q∘F of exact functors, and a short exact sequence F′ ↣ F ↠ F″ gives B ↦ (F′B ↣ FB ↠ F″B), exact because the conflations of E(A) are componentwise (Weibel, Definition V.1.1(a)).
7. Essential smallness: a conflation is determined up to isomorphism by three objects of a small skeleton of A and two morphisms between them.

**Acceptance.**

- The conflations of E(A) are exactly the componentwise ones.
- (s, q) ∘ ∐ is the identity of A × A and t ∘ ∐ is the biproduct functor.
- ExactK0 of E(A) is ExactK0 A × ExactK0 A through (s, q), with inverse induced by ∐: the degree-zero shadow of the Extension Theorem (Weibel, Proposition II.9.3.1).
- For the canonical structure of an abelian category, E(A) is not abelian (Bühler, Remark 3.10), so no abelian-category argument may be applied to it.

**Prerequisites.**

- `tauceti:TauCeti.ExactStructure`
- `tauceti:TauCeti.ExactStructure.ConflationCategory`
- `tauceti:TauCeti.ExactStructure.conflation_cobaseChange`
- `tauceti:TauCeti.ExactStructure.conflation_baseChange`
- `tauceti:TauCeti.ExactStructure.conflation_biprod`
- `GeneralAlgebraicKTheory:K.3/three-by-three-lemma`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `ConflationCategory.exactStructure` | structure | The exact structure on E.ConflationCategory whose conflations are the componentwise ones. |
| `ConflationCategory.conflation_iff` | characterisation | A sequence of conflations is a conflation of E(A) exactly when its three columns are E-conflations. |
| `ConflationCategory.isConflationExact_sub` | functoriality | The sub-term functor s : E(A) → A is exact. |
| `ConflationCategory.isConflationExact_total` | functoriality | The total-term functor t : E(A) → A is exact. |
| `ConflationCategory.isConflationExact_quot` | functoriality | The quotient-term functor q : E(A) → A is exact. |
| `ConflationCategory.coprod` | constructor | The exact functor ∐ : A × A → E(A), (X, Z) ↦ (X ↣ X ⊞ Z ↠ Z). |
| `ConflationCategory.sub_quot_coprod` | simp | (s, q) ∘ ∐ = id and t ∘ ∐ ≅ ⊞. |
| `ConflationCategory.exactFunctorEquiv` | universal-property | Exact functors B → E(A) correspond to short exact sequences of exact functors B → A. |
| `ConflationCategory.essentiallySmall` | instance | E(A) is essentially small when A is. |

**Consumers.**

- K.3/additivity-for-exact-categories (Weibel V.1.1.1 and the proof of V.1.2) — Additivity is proved in this universal case: t is homotopic to s ∐ q on K(E(A)), by the Extension Theorem V.1.3 for this category.
- Weibel V.1.4 and Exercises V.1.5–1.6 — The categories of admissibly exact sequences of length n are iterated extension categories of this kind.
- Weibel II.9.3 and IV.8.3 — For an exact category regarded as a Waldhausen category, the second term of the S-construction is this category with the cofibrations of II.9.3.

**Unit tests.**

- `componentwise_conflations` (characterisation) — A sequence of conflations is a conflation of E(A) if and only if its three columns are E-conflations; a sequence that is a kernel–cokernel pair of short complexes but has a column that is not an E-conflation is not one.
- `coprod_section` (computation) — (s, q) ∘ ∐ is the identity of A × A, and t ∘ ∐ is naturally isomorphic to the biproduct functor.
- `k0_of_extension_category` (compatibility) — (s, q) induces ExactK0 (E(A)) ≃ ExactK0 A × ExactK0 A, with inverse induced by ∐ (Weibel, Proposition II.9.3.1).
- `not_abelian` (non-example) — For the category of abelian groups with its canonical exact structure, E(Ab) is not an abelian category (Bühler, Remark 3.10), so its exact structure is not the canonical structure of an abelian category.

**Sources.**

- `Weibel.KBook.V`: Universal Example 1.1.1, p. V.1. The object and the claim that it is exact, which the source does not prove.
- `Buhler.ExactCategories`: Exercise 3.9 (Heller) and Remark 3.10, p. 16 (arXiv v2). The componentwise exact structure, stated as an exercise; the proof steps are this packet's, from Bühler's Corollary 3.6 and Proposition 2.12.
- `Weibel.KBook.II`: Extension Categories 9.3 and Proposition 9.3.1, pp. II.92–93. The three functors and the degree-zero test.

### The Additivity theorem

`GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories` · theorem · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

Let E(A) be the exact category of conflations of an exact category A (K.3/exact-category-of-conflations), with the exact functors s, t and q taking the sub, total and quotient terms. The functor (s, q) from Q(E(A)) to the product of two copies of Q(A) is a homotopy equivalence (the Extension Theorem); equivalently, for a short exact sequence of exact functors the middle one induces the sum of the maps induced by the outer two, as maps of H-spaces and hence on all K-groups. Two corollaries follow at once: for an admissible filtration of an exact functor with exact quotients the induced map is the sum of the maps of the quotients, and for a bounded admissibly exact sequence of exact functors the alternating sum of the induced maps is zero. This node is the exact-category theorem, proved by Quillen's Theorem A; the Waldhausen form is K.4/waldhausen-additivity, proved separately in K.4:construction.

**Hypotheses.**

- The functors are exact and the sequences of functors are pointwise conflations; A is essentially small, and so is E(A).
- For the filtration corollary the successive quotient functors must themselves be exact.
- The equivalence is of H-spaces, so the conclusion is an equality of maps of K-groups and not merely of their effect on classes.

**Proof outline.**

1. Reduce to the universal case: a short exact sequence of exact functors from B to A is an exact functor from B to E(A), so it suffices to show that t is homotopic to s ∐ q on K(E(A)); since t and s ∐ q agree after composing with the coproduct functor ∐, this follows once (s, q) is a homotopy equivalence with homotopy inverse ∐.
2. Prove that (s, q) induces a homotopy equivalence of Q-categories by Quillen's Theorem A (StableHomotopyKTheory:H.2/quillen-theorem-a): for objects A and C the comma category T of triples (u, E, v), with E an extension A₀ ↣ B₀ ↠ C₀ and u : A₀ → A, v : C₀ → C morphisms of Q(A), is contractible.
3. Contract T: pushing E out along the admissible-monomorphism part of u (ExactStructure.conflation_cobaseChange, the source's II Exercise 7.8(2)) is a functor p to the subcategory where u is an admissible epimorphism, left adjoint to its inclusion; pulling back along the admissible-epimorphism part of v (ExactStructure.conflation_baseChange) is a functor q to the subcategory where v is an admissible monomorphism, right adjoint to its inclusion (Weibel, Exercise V.1.1). Natural transformations give homotopies (StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility), and the intersection of the two subcategories has an initial object, so T is contractible.
4. Deduce the filtration corollary by induction on the length of the filtration.
5. Deduce the alternating-sum corollary by induction on the length of the sequence.
6. Record that the source states the exact and Waldhausen forms together; the Waldhausen form, with its simplicial proof, is K.4/waldhausen-additivity and is not deduced from this node.

**Acceptance.**

- For the split sequence of functors the theorem gives that the total functor induces the sum, which is the sanity check.
- The alternating sum of a bounded exact sequence of exact functors vanishes.
- A flasque category, one with an endofunctor carrying an object to the sum of itself with that endofunctor's value, has contractible K-theory by additivity; this is the Eilenberg swindle in this layer.
- The hypothesis that the quotient functors are exact cannot be dropped in the filtration corollary.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`
- `GeneralAlgebraicKTheory:K.3/exact-category-of-conflations`
- `StableHomotopyKTheory:H.2/quillen-theorem-a`
- `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`
- `tauceti:TauCeti.ExactStructure.conflation_cobaseChange`
- `tauceti:TauCeti.ExactStructure.conflation_baseChange`

**Sources.**

- `Weibel.KBook.V`: Additivity Theorem 1.2 with its proof, p. V.2. The theorem and the first line of its proof, verbatim, in the form that covers exact and Waldhausen categories at once.
- `Weibel.KBook.V`: Extension Theorem 1.3 and its proof for exact categories, pp. V.2–4. The theorem and the Theorem A argument the proof steps follow.
- `Weibel.KBook.V`: Corollary 1.2.1 and Proposition 1.8, pp. V.2 and V.9. The two corollaries with their proofs, verbatim.

### The Resolution theorem

`GeneralAlgebraicKTheory:K.3/resolution-theorem` · theorem · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

Let P be a full exact subcategory of an exact category H, closed under extensions and under kernels of admissible surjections in H, and suppose every object of H has a finite resolution by objects of P. Then the inclusion induces a homotopy equivalence of K-theory spaces and isomorphisms of all K-groups. The proof reduces to resolutions of length one by filtering H by the subcategories of objects with resolutions of bounded length, and the length-one case is handled by a comma-category argument. The standing instances are the finitely generated projectives inside the modules of finite projective dimension, and, for a regular noetherian ring, the finitely generated projectives inside all finitely generated modules, which gives the agreement of K-theory and G-theory.

**Hypotheses.**

- P is full in H, closed under extensions and under kernels of admissible surjections in H; finite resolutions exist for every object of H.
- For the ring instance, use the finite-projective-resolution hypotheses of the adopted regular noetherian theorem. The vector-bundle scheme comparison needs the global-resolution hypotheses of V.3.4; separatedness is part of that stated sufficient scope. The failure example is the doubled-origin affine plane, not the line.
- The closure under kernels of admissible surjections is essential and is what makes the filtration argument work.

**Proof outline.**

1. Filter H by the full subcategories of objects admitting a resolution of length at most n, and prove that each successive inclusion satisfies the hypotheses in the length-one form.
2. Prove the length-one case by factoring the inclusion of Q-categories through the full subcategory on the objects of P and applying Quillen's Theorem A (StableHomotopyKTheory:H.2/quillen-theorem-a) twice, once with a contraction by natural transformations and once dually, the dual step using a right adjoint (StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility).
3. Assemble the general case from the filtration and the fact that K-theory commutes with the filtered union of the subcategories (K.1/elementary-properties-of-K-groups).
4. Record the instances: the finitely generated projectives inside the modules of finite projective dimension; for a regular noetherian ring the agreement of K and G; for a regular noetherian separated scheme the corresponding agreement.
5. Record the degree-zero comparison with the pinned Tau Ceti resolution theorem, which is proved only under the stronger hypothesis that every resolving object is projective for the exact structure, and say that the general statement here is what is missing.

**Acceptance.**

- For a regular noetherian ring the K-groups and the G-groups agree in every degree.
- The pinned Tau Ceti resolution isomorphism in degree zero is the special case in which every resolving object is projective; the general statement is not pinned.
- For X obtained by gluing two affine planes along the punctured plane, K₀(VB(X)) ≅ ℤ while G₀(X) ≅ K₀(Perf(X)) ≅ ℤ² (II.8.2.4 and II.Ex.9.10(d)). This tests the distinction between vector-bundle and perfect-complex models.
- For the doubled-origin affine line, gluing t^m produces Pic(X) ≅ ℤ, so rank and determinant forbid the assertion K₀(VB(X)) ≅ ℤ. Do not reuse V.3.4.2’s author-copy misprint as an acceptance test.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`
- `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`
- `StableHomotopyKTheory:H.2/quillen-theorem-a`
- `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`
- `tauceti:TauCeti.ExactStructure.resolutionEquiv`
- `tauceti:TauCeti.moduleResolutionEquiv`
- `GeneralAlgebraicKTheory:K.3/bounded-resolution-filtration`

**Sources.**

- `Weibel.KBook.V`: Resolution Theorem 3.1 with the opening of its proof, p. V.20. The theorem and the structure of its proof, verbatim.
- `Weibel.KBook.II`: Example 8.2.4, p. II.77; Exercise 9.10(d), p. II.100. The exercise and dimension n ≥ 2 in Example 8.2.4 identify the intended scheme; see the scoped sourceIssues entry.

**Source issues.**

- `GeneralAlgebraicKTheory/E-double-origin`

### Transfer maps and the projection formula

`GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

If a ring map makes the target a module admitting a finite resolution by finitely generated projectives over the source, then restriction of scalars gives an exact functor between the categories H(S) and H(R) of modules admitting finite resolutions by finitely generated projectives, and through the resolution isomorphisms a transfer map of K-groups in the direction opposite to the ring map. Transfers compose when both maps satisfy the hypothesis. For commutative rings the projection formula holds: the transfer of the product of a pulled-back class with a class upstairs is the product of the class with the transfer. The hypothesis is finite projective dimension WITH finitely generated resolving modules; finite projective dimension alone is not the source's hypothesis.

**Hypotheses.**

- The target ring is, as a module over the source, of finite projective dimension with finitely generated resolving projectives.
- For the projection formula the rings are commutative. Weibel V.3.3.2 states the formula in all nonnegative degrees; it uses the biexact pairings requested from the early products prefix of K.7, not merely the K₀ action.
- Composition of transfers requires the same hypothesis for the second map.

**Proof outline.**

1. Define H(R) to mean modules admitting finite resolutions by finitely generated projectives (not arbitrary modules of finite projective dimension). Restriction sends P(S) to H(R) because S has such a resolution. More generally it sends H(S) to H(R) by resolving its finitely many resolving S-projectives over R; it is exact on the inherited exact structures.
2. Compose with the two resolution isomorphisms of the previous node to obtain the transfer.
3. Prove functoriality of the transfer under composition, using the resolution isomorphisms again.
4. Prove the projection formula from the natural isomorphism of exact functors expressing the tensor product over the target of a pulled-back module with a module upstairs.
5. Record the module form of the same statement, which makes the K-groups upstairs a module over those downstairs.
6. Record the source's worked example in which a transfer vanishes, obtained from additivity applied to multiplication by the variable on a polynomial ring, so that the formalisation has a non-trivial test.

**Acceptance.**

- Transfers compose when both ring maps satisfy the hypothesis.
- The projection formula holds for commutative rings.
- The transfer along the evaluation of a polynomial ring at zero is the zero map, by additivity; this is the source's own test.
- Finite projective dimension without finite generation is not enough.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.3/resolution-theorem`
- `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`
- `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`

**Sources.**

- `Weibel.KBook.V`: V.3.2 and V.3.3.2, p. V.21. The K-theory transfer with the finite resolution by finitely generated projectives hypothesis. The former V.3.5 excerpt instead described G-theory and its finite-flat-dimension base change.
- `Weibel.KBook.V`: V.3.3.2, p. V.21, projection-formula paragraph. All-degree projection formula via H(S) × P(R) → H(R) and the resolution equivalences. Its biexact pairing must be available through the requested early K.7 products prefix.

### The Devissage theorem

`GeneralAlgebraicKTheory:K.3/devissage-theorem` · theorem · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

Let an exact abelian subcategory of an abelian category be closed under subobjects and quotients, and suppose every object of the ambient category has a finite filtration whose successive quotients lie in the subcategory. Then the inclusion induces a homotopy equivalence of K-theory spaces and isomorphisms of all K-groups. The proof is again by the comma-category criterion, the comma category being equivalent to the ordered set of layers with quotient in the subcategory, contracted by two explicit intersections. The standing instances are the identification of the G-theory of a ring modulo a nilpotent ideal with that of the quotient, and the G-theory of the torsion modules for an element as a colimit.

**Hypotheses.**

- The subcategory is abelian, exact in the ambient category, and closed under subobjects and quotients; both categories have a set of isomorphism classes.
- Every object of the ambient category has a finite filtration with successive quotients in the subcategory.
- The successive-quotient functors attached to the filtration are NOT assumed exact, which is exactly why additivity for filtrations does not prove this theorem; the source gives an example.

**Proof outline.**

1. Apply Quillen's Theorem A (StableHomotopyKTheory:H.2/quillen-theorem-a): it suffices that the comma category of the inclusion over each object is contractible.
2. Identify the comma category with the ordered set of layers whose quotient lies in the subcategory.
3. Reduce, using the finite filtration, to the case of an object whose quotient by a subobject lies in the subcategory.
4. Define the two maps on layers, intersecting both terms with the subobject and intersecting only the lower term, which are well defined because the subcategory is closed under subobjects and finite products, and use the natural transformations between them to contract. The contraction is by natural transformations (StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility).
5. Record the finite-length corollary: for an ambient category in which every object has finite length the K-groups are the direct sum over the simple objects of the K-groups of their endomorphism division rings.
6. Record the two standing instances and the source's statement that the Waldhausen analogue is an open problem.

**Acceptance.**

- For a nilpotent ideal in a noetherian ring the G-groups of the ring and of the quotient agree.
- The G-groups of the modules of finite length over a ring are the sum over the simple modules of the K-groups of the corresponding division rings.
- Additivity for filtrations does not prove this theorem, because the successive-quotient functors need not be exact.
- The source records that the analogue for Waldhausen categories is an open problem, so no such statement may be asserted.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`
- `StableHomotopyKTheory:H.2/quillen-theorem-a`
- `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`
- `tauceti:TauCeti.simpleClassBasis`
- `GeneralAlgebraicKTheory:K.3/devissage-intersection-contraction`

**Sources.**

- `Weibel.KBook.V`: Devissage Theorem 4.1 with the opening of its proof, p. V.33. The theorem and the criterion its proof uses, verbatim.
- `Weibel.KBook.V`: Open Problem 4.1.1, p. V.33. The open problem, verbatim; it is why no Waldhausen form of this node exists in K.4.

### Quillen's localisation theorem for a Serre subcategory

`GeneralAlgebraicKTheory:K.3/abelian-localization-theorem` · theorem · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For a Serre subcategory of a small abelian category, the sequence of K-theory spaces of the subcategory, of the category and of the quotient is a homotopy fibration, so there is a long exact sequence of K-groups ending in the right-exact sequence of Grothendieck groups. It is natural for exact functors of pairs. The theorem is asserted for ABELIAN categories: the stage text's warning is that it may not be asserted for an arbitrary exact subcategory of an exact category without the extra hypotheses the chosen exact-category localisation theorem requires, and this packet keeps localisation for exact and Waldhausen categories in K.4, where those hypotheses are stated.

**Hypotheses.**

- The ambient category is small abelian and the subcategory is Serre, that is closed under subobjects, quotients and extensions.
- The quotient is the abelian quotient category, whose construction Mathlib supports through Serre classes and the localisation of a category.
- The theorem is not asserted for exact categories that are not abelian; the corresponding statements are the Waldhausen localisation theorem of K.4 and the nonconnective localisation of K.6.

**Proof outline.**

1. K.3/localization-isomorphic-comma-subcategory identifies the comma fibre over zero with QB.
2. K.3/localization-filtered-models proves all base-change maps of comma fibres are realisation equivalences, with the model category, epic-kernel comparison and image-poset fibration supplied by its prerequisite nodes.
3. Apply H.2’s Theorem B to Qloc:QA→Q(A/B), loop the fibre sequence and take homotopy groups. Since every quotient object is represented by an A-object, K₀(A)→K₀(A/B) is surjective.
4. The degree-one connecting map retains the existing packet’s sign convention; downstream residue comparisons must identify the actual boundary map, not just the abstract groups.

**Acceptance.**

- The long exact sequence ends in the right-exact sequence of Grothendieck groups.
- The boundary from the first K-group of the quotient sends the class of an endomorphism invertible modulo the subcategory to the difference of the classes of its cokernel and kernel, with the sign fixed here.
- The statement is for abelian categories; it may not be quoted for an arbitrary exact subcategory.
- For a Dedekind domain the sequence relates the K-groups of the ring, of its fraction field and of its residue fields.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.3/devissage-theorem`
- `GeneralAlgebraicKTheory:K.3/resolution-theorem`
- `GeneralAlgebraicKTheory:K.1/Q-construction-universal-property`
- `StableHomotopyKTheory:H.2/quillen-theorem-b`
- `StableHomotopyKTheory:H.1/filtered-colimits-of-categories`
- `mathlib:CategoryTheory.ObjectProperty.IsSerreClass`
- `GeneralAlgebraicKTheory:K.3/localization-filtered-models`
- `GeneralAlgebraicKTheory:K.3/localization-isomorphic-comma-subcategory`

**Sources.**

- `Weibel.KBook.V`: Abelian Localization Theorem 5.1 with (5.1.1), p. V.35. The theorem and the sequence, verbatim.
- `Weibel.KBook.V`: Exercise 5.1, pp. V.37–38. The boundary map in degree one, verbatim; the source states it as an exercise and this packet fixes the sign here.

### Cofinality, with the correction in degree zero

`GeneralAlgebraicKTheory:K.3/cofinality-degree-zero-correction` · theorem · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

Proposed parent: `GeneralAlgebraicKTheory:K.3:cofinality`; maintainer integration is pending.

For an exact subcategory closed under extensions and cofinal in an exact category, the realisation of the smaller Q-category is the covering space of the larger corresponding to the subgroup of the Grothendieck group; hence the K-groups agree in every positive degree, while the zeroth group of the subcategory is only a subgroup of that of the category. There is a Waldhausen form with a surjection from the Grothendieck group, giving a homotopy fibration onto the discrete quotient and a short exact sequence in degree zero. The idempotent completion is the standard example where the zeroth group genuinely changes: an exact category is cofinal in its idempotent completion and the positive K-groups agree, so no statement of agreement in degree zero may be made.

**Hypotheses.**

- The subcategory is exact, closed under extensions and cofinal, meaning every object of the ambient category has a complement making the sum lie in the subcategory.
- The Waldhausen form requires a cylinder functor satisfying the cylinder axiom, which K.4 defines. The route of the general exact-category form through Waldhausen Cofinality IV.8.9 needs the subcategory to be saturated as well as cofinal (the author's correction, recorded as GeneralAlgebraicKTheory/E-cofinality-saturated); for an exact category the weak equivalences are the isomorphisms, which are saturated, so the exact-category statement is unaffected.
- The degree-zero group of the subcategory is a subgroup of the ambient one, and the inclusion is generally proper.
- The general proof needs the late K.4 fibration theorem and the comparison of the S- and Q-constructions, so this node belongs after K.4. It keeps its id and the parent K.3 because no stage K.3:cofinality exists yet, and records the proposed late parent in proposedParentStageId. The special case of Weibel's Exercise IV.6.6, the subcategory cut out by a surjection from K₀ to a group, needs only Theorems A and B. ExactK0.ofLE_surjective compares exact structures on one category and does not prove cofinal-subcategory K₀ injectivity.

**Proof outline.**

1. Prove the special case of Exercise IV.6.6 with Theorems A and B (StableHomotopyKTheory:H.2): for a surjection φ from K₀ of the ambient category onto a group G, the functor from Q of the ambient category to G sending a deflation to φ of the class of its kernel has homotopy fibre Q of the subcategory cut out by φ.
2. State the Waldhausen form (Weibel V.2.3) with a surjection from the Grothendieck group and the resulting fibration onto the discrete quotient, proved from the fibration theorem.
3. Deduce the general exact-category form from the Waldhausen form and Waldhausen Cofinality IV.8.9 for a saturated subcategory, transporting to Q-groups through K.4:construction/iS-versus-Q.
4. Read off the agreement of the positive K-groups and the short exact sequence in degree zero.
5. Record the idempotent completion example: the category is cofinal in its completion, the positive groups agree, and the zeroth group can change.
6. Record the free-versus-projective example, in which the free modules are cofinal in the finitely generated projectives but not strictly so; K.2:plus obtains its positive-degree agreement earlier from the group-completion cofinality theorem, so it does not depend on this late node.

**Acceptance.**

- The positive K-groups of a cofinal subcategory closed under extensions agree with those of the ambient category.
- The zeroth group need not agree, and the idempotent completion is the standard witness.
- A statement of agreement in degree zero for a merely cofinal subcategory is false and may not be recorded.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4/fibration-theorem`
- `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`
- `GeneralAlgebraicKTheory:K.4:construction/iS-versus-Q`
- `StableHomotopyKTheory:H.2/quillen-theorem-a`
- `StableHomotopyKTheory:H.2/quillen-theorem-b`
- `mathlib:CategoryTheory.Idempotents.Karoubi`

**Sources.**

- `Weibel.KBook.IV`: Cofinality 6.4.1, p. IV.56. The exact-category form, with the source’s own note that its general proof goes through the Waldhausen form, verbatim.
- `Weibel.KBook.V`: Cofinality Theorem 2.3, p. V.14. The Waldhausen form with the degree-zero correction, verbatim.
- `Weibel.KBook.IV`: Exercise 6.6 (Gersten), p. IV.60, and Waldhausen Cofinality 8.9, p. IV.72. The Theorem A and B special case, and the Waldhausen cofinality theorem through which the source proves the general case; the missing saturation hypothesis of 8.9 is recorded under sourceIssues.

**Source issues.**

- `GeneralAlgebraicKTheory/E-cofinality-saturated`

### Categories with cofibrations, Waldhausen categories and their extra axioms

`GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories` · definition · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

A CATEGORY WITH COFIBRATIONS is a category with a subcategory of cofibrations such that every isomorphism is a cofibration, there is a distinguished zero object whose map to every object is a cofibration, and pushouts along cofibrations exist with cofibrations stable under cobase change. A WALDHAUSEN CATEGORY adds a subcategory of weak equivalences containing the isomorphisms, closed under composition and satisfying the gluing axiom, that the pushout of a map of cofibration squares whose components are weak equivalences is a weak equivalence. Three further axioms are used only by later theorems and are stated separately: SATURATION, that in a composable pair whose composite is a weak equivalence one factor is a weak equivalence exactly when the other is; the EXTENSION axiom, that a map of cofibration sequences whose sub and quotient maps are weak equivalences has total map a weak equivalence; and the CYLINDER axiom for a cylinder functor. An exact category is a Waldhausen category with the admissible monomorphisms as cofibrations and the isomorphisms as weak equivalences.

**Hypotheses.**

- The categories are small, so that the weak-equivalence classes form a set and the Grothendieck group is defined.
- An exact functor preserves the zero object, cofibrations, weak equivalences and the pushouts along cofibrations.
- Saturation, extension and the cylinder axiom are NOT part of the definition; each theorem of K.4 names the ones it uses.

**Proof outline.**

1. State the three cofibration axioms and the gluing axiom, in the source's order.
2. Define exact functors and Waldhausen subcategories.
3. Define the Grothendieck group of a Waldhausen category by generators the weak-equivalence classes and relations from the cofibration sequences, which is the degree-zero invariant the whole layer refines.
4. State saturation, the extension axiom and the cylinder axiom separately, each with the theorem that uses it.
5. Record the two standing examples: an exact category with admissible monomorphisms and isomorphisms, whose cofibration sequences are the admissible exact sequences; and bounded complexes over an exact category with degreewise admissible monomorphisms and quasi-isomorphisms.
6. Record the warning the source attaches to the second example: the Grothendieck group of the unbounded complexes vanishes by the Eilenberg swindle, so boundedness is not decorative.
7. Record what the pinned libraries have: Mathlib's model categories have cofibrations, fibrations and weak equivalences but are not Waldhausen categories, and the gluing axiom is not isolated anywhere.

**Acceptance.**

- An exact category is a Waldhausen category, and its cofibration sequences are the admissible exact sequences.
- The Grothendieck group of a Waldhausen category specialises to that of an exact category in the first example.
- The Grothendieck group of the unbounded complexes over an exact category vanishes; the bounded ones give the group of the category.
- Saturation, extension and the cylinder axiom are separate hypotheses and no theorem here may assume them silently.

**Prerequisites.**

- `mathlib:CategoryTheory.Limits.HasPushouts`
- `tauceti:TauCeti.ExactStructure`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `CategoryWithCofibrations` | structure | The three cofibration axioms. |
| `WaldhausenCategory` | structure | Cofibrations together with weak equivalences and the gluing axiom. |
| `WaldhausenCategory.IsSaturated` | data | The saturation axiom, as a separate hypothesis. |
| `WaldhausenCategory.HasExtensionAxiom` | data | The extension axiom, as a separate hypothesis. |
| `WaldhausenCategory.CylinderFunctor` | structure | A cylinder functor and its axiom. |
| `WaldhausenCategory.K0` | data | The Grothendieck group. |
| `WaldhausenCategory.ofExact` | example | An exact category as a Waldhausen category. |
| `WaldhausenCategory.exactFunctor` | data | Exact functors between Waldhausen categories. |

**Consumers.**

- K.4:construction, the S-construction — The construction consumes exactly this data.
- K.4, the fibration and approximation theorems — Each names which of the three extra axioms it uses.
- K.6 and K.7 — The nonconnective spectrum and the derived invariance statement are about the K-theory of a Waldhausen category.

**Unit tests.**

- `exact_is_waldhausen` (computation) — An exact category is a Waldhausen category with the stated structure.
- `K0_agrees` (compatibility) — Its Grothendieck group is that of the exact category.
- `unbounded_complexes_vanish` (non-example) — The Grothendieck group of the unbounded complexes vanishes, so a definition that forgot boundedness would be wrong.
- `axioms_separate` (non-example) — Saturation, extension and the cylinder axiom are independent extra hypotheses, not part of the definition.

**Sources.**

- `Weibel.KBook.II`: Definition 9.1 with (W0) to (W2), p. II.87. The cofibration axioms, verbatim.
- `Weibel.KBook.II`: Definition 9.1.1 and Definition 9.1.2, pp. II.87 to II.88. The definition and the degree-zero invariant, verbatim.
- `Weibel.KBook.IV`: Extension axiom 8.2.1, p. IV.67. The extension axiom, verbatim.

### Waldhausen's S-construction and the induced cofibrations

`GeneralAlgebraicKTheory:K.4:construction/S-construction` · construction · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

For a category with cofibrations, the n-th term of the S-construction is the category whose objects are sequences of n cofibrations together with a compatible choice of all subquotients, with morphisms the natural transformations of such diagrams; the zeroth term is trivial, the first is the category itself, and the second is the extension category, whose three face maps are the quotient, total and sub functors. The faces delete a row and a column and the degeneracies duplicate, and they are exact, so the terms form a simplicial category with cofibrations; taking the subcategories of weak equivalences gives a simplicial category whose realisation is the object of the next node. The cofibrations of the n-th term are NOT the objectwise ones: a map is a cofibration when for every triple of indices the induced map of cofibration sequences is a cofibration of the second term, which is a condition on the canonical maps out of the pushouts. The stage text's warning is exactly this, and this node states it as a hypothesis rather than a remark.

**Hypotheses.**

- The ambient category is a small category with cofibrations; for the weak-equivalence subcategories it is a Waldhausen category.
- The choices of subquotients are part of the data of an object and must be compatible with the displayed staircase diagram.
- The cofibrations of the n-th term are defined by the latching condition stated above; objectwise cofibrations do not in general satisfy the pushout conditions required.

**Proof outline.**

1. Define the objects of the n-th term with their compatible choices of subquotients.
2. Define the morphisms and the latching condition that makes a morphism a cofibration, and prove that the resulting structure is a category with cofibrations.
3. Define the faces and degeneracies by deleting and duplicating rows and columns and prove that they are exact and satisfy the simplicial identities.
4. Identify the second term with the extension category E(C) of Weibel II.9.3, the category of cofibration sequences with the cofibrations of II.9.3, and its three faces with the quotient, total and sub functors. For an exact category regarded as a Waldhausen category this is the pinned category of conflations, TauCeti.ExactStructure.ConflationCategory, not the category EA of IV.7.3 with its Q-type morphisms. It is the category Waldhausen additivity is about.
5. Define the subcategories of weak equivalences and check that they are preserved.
6. Record the warning as a non-example: a map that is objectwise a cofibration need not satisfy the latching condition, and a formalisation that defined the cofibrations objectwise would not have a category with cofibrations.

**Acceptance.**

- The zeroth term is trivial, the first is the category itself and the second is the extension category.
- The three faces from the second term to the first are the quotient, the total and the sub functors.
- The cofibrations of the n-th term are given by the latching condition; the objectwise definition is a non-example.
- For an exact category the second term is the pinned category of conflations with the cofibrations of II.9.3, not the category EA of K.2:plus.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`
- `tauceti:TauCeti.ExactStructure.ConflationCategory`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `SConstruction` | data | The n-th term of the S-construction. |
| `SConstruction.cofibration` | characterisation | The latching condition defining its cofibrations. |
| `SConstruction.face` | data | The face functors. |
| `SConstruction.degeneracy` | data | The degeneracy functors. |
| `SConstruction.simplicial` | compatibility | The simplicial identities. |
| `SConstruction.two_eq_ext` | relation | The second term is the extension category. |

**Consumers.**

- K.4:construction, the K-theory space — The space is built from the weak-equivalence subcategories of these terms.
- K.4:construction, additivity and the relative S-construction — Both are statements about this simplicial category and its relative version S.f.
- K.6 — The nonconnective spectrum applies this construction to a Frobenius pair.

**Unit tests.**

- `S2_is_extension` (computation) — The second term is the extension category of the ambient category.
- `faces_exact` (computation) — The faces and degeneracies are exact.
- `latching_not_objectwise` (non-example) — A map that is objectwise a cofibration need not be a cofibration of the n-th term.
- `S1_trivial` (degenerate) — The first term is the ambient category and the zeroth is trivial.

**Sources.**

- `Weibel.KBook.IV`: Definition 8.3 with (8.3.0), p. IV.67. The construction, verbatim.
- `Weibel.KBook.IV`: Definition 8.3.1, p. IV.67. The faces and degeneracies. Prose verbatim from the text layer of the author's chapter file; formulas transcribed.
- `Weibel.KBook.IV`: §8.3, the low terms, p. IV.67. The low terms: S0C = 0 and S1C = C. Prose verbatim from the text layer of the author's chapter file; formulas transcribed.

### The K-theory space of a Waldhausen category

`GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category` · definition · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

The K-theory space of a small Waldhausen category is the loop space of the realisation of the weak-equivalence S-construction, and its K-groups are the homotopy groups of that loop space, so the n-th K-group is the (n+1)-st homotopy group of the realisation. The fundamental group of the realisation is the Grothendieck group of the category, which fixes the indexing; the realisation is an H-space under coproduct. Applying the S-construction degreewise gives the iterated multisimplicial categories S.ⁿC; the equivalences between the realisations of consecutive ones are K.4/delooping-and-the-spectrum, and their assembly into the connective Ω-spectrum is StableHomotopyKTheory:H.5:S-delooping.

**Hypotheses.**

- The category is small and Waldhausen; no extra axiom is needed for the definition.
- The basepoint is the trivial object of the zeroth term, whose realisation is a point.
- The iterated construction S.ⁿC is formed here, as the stage text's 'iterate S'; the identification of consecutive realisations is K.4/delooping-and-the-spectrum, and the Ω-spectrum is assembled by StableHomotopyKTheory:H.5:S-delooping. Neither is claimed by this node, which precedes both.

**Proof outline.**

1. Define the bisimplicial object and its realisation, and define the K-theory space as its loop space.
2. Prove that the fundamental group of the realisation is the Grothendieck group, by the presentation of the fundamental group of a simplicial space whose zeroth term is a point.
3. Define the K-groups with the stated shift and prove that they are abelian.
4. Record the H-space structure induced by the coproduct.
5. Construct the iterated S-construction S.ⁿC degreewise, as multisimplicial Waldhausen categories with their weak-equivalence nerves; the equivalences |wS.ⁿC| ≃ Ω|wS.ⁿ⁺¹C| are proved in K.4/delooping-and-the-spectrum and the spectrum is assembled in H.5:S-delooping.
6. Record the canonical map from the realisation of the weak-equivalence subcategory to the K-theory space, and that it is not a homotopy equivalence in general.

**Acceptance.**

- The fundamental group of the realisation is the Grothendieck group, which is what fixes the indexing.
- For an exact category the groups agree with those of K.1, by the comparison of the next node.
- The canonical map from |wC| to K(C) need not be a homotopy equivalence or a group completion; the split exact case is supplied by K.2:plus/H.4.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/S-construction`
- `mathlib:CategoryTheory.nerve`
- `mathlib:SSet.toTop`
- `mathlib:HomotopyGroup`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `WaldhausenCategory.KSpace` | data | The K-theory space. |
| `WaldhausenCategory.KGroup` | data | Its K-groups, with the stated shift. |
| `WaldhausenCategory.pi1_eq_K0` | characterisation | The fundamental group of the realisation is the Grothendieck group. |
| `WaldhausenCategory.KSpace_map` | functoriality | The map induced by an exact functor. |
| `WaldhausenCategory.hSpace` | structure | The H-space structure from the coproduct. |
| `WaldhausenCategory.iteratedS` | data | The multisimplicial Waldhausen categories S.ⁿC obtained by applying the S-construction degreewise n times, with their weak-equivalence nerves; the deloopings between them are K.4/delooping-and-the-spectrum's. |

**Consumers.**

- K.4, every theorem of the layer — Additivity, delooping, fibration and approximation are all statements about this space.
- K.5 — The relative theory is the homotopy fibre of a map of these spaces.
- K.6 — The nonconnective spectrum is built from this space applied to the iterated suspension of a Frobenius pair.

**Unit tests.**

- `pi1_is_K0` (computation) — The fundamental group of the realisation is the Grothendieck group.
- `exact_category_case` (compatibility) — For an exact category the groups agree with the Q-construction groups.
- `not_group_completion` (non-example) — The map from the weak-equivalence subcategory is not a homotopy equivalence in general.
- `trivial_category` (degenerate) — The K-theory space of the zero Waldhausen category is contractible.

**Sources.**

- `Weibel.KBook.IV`: Proposition 8.4 and Definition 8.5, p. IV.68. The degree-zero identification and the definition, verbatim.
- `Weibel.KBook.IV`: Infinite Loop Structure 8.5.5, p. IV.69. The iteration of the construction, verbatim; the delooping equivalences it invokes are K.4/delooping-and-the-spectrum's and the spectrum is H.5:S-delooping's.

### Comparison of the S-construction with the Q-construction

`GeneralAlgebraicKTheory:K.4:construction/iS-versus-Q` · comparison · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

For a small exact category A with isomorphisms as weak equivalences, |iS.A|≃BQA naturally in exact functors. Use edgewise subdivision of iS.A and its degreewise equivalence with iQ.A; the swallowing lemma identifies BQA with |iQ.A|. The object-S map gives the same comparison, including the automorphism class in π₂. No additivity, relative delooping or spectrum is required.

**Hypotheses.**

- A is small exact; cofibrations are its admissible inflations and weak equivalences its isomorphisms.
- H.2 owns the generic edgewise realisation homeomorphism and the swallowing lemma for double nerves.

**Proof outline.**

1. H.2’s edgewise realisation homeomorphism identifies |iS.A| with |iS.^e A|. The edgewise-S-Q diagram node gives |iS.^e A|≃|iQ.A| by degreewise equivalence.
2. Apply the swallowing lemma to Core(QA)⊂QA to identify BQA with |iQ.A|. Its proof evaluates a string at the first object and uses its successive arrows as a natural transformation from the constant string.
3. The object-S equivalence gives a commuting square with the same diagonal-subquotient map δ.^e A→NQA, so this is the object comparison as well.
4. The automorphism’s two-dimensional cell is sent to its Q square by the displayed diagonal spans, identifying the π₂ automorphism classes. Naturality follows by applying an exact functor to every quotient and pullback.

**Acceptance.**

- For an exact category the Waldhausen and Quillen K-groups agree in every degree.
- The class of an automorphism corresponds under the comparison.
- The comparison is natural in exact functors.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`
- `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`
- `GeneralAlgebraicKTheory:K.4:construction/edgewise-S-Q-diagrams`
- `GeneralAlgebraicKTheory:K.4:construction/object-S-isomorphism-homotopy`
- `StableHomotopyKTheory:H.2`

**Sources.**

- `Weibel.KBook.IV`: §8.6, p. IV.69. The comparison and its attribution. Prose verbatim from the text layer of the author's chapter file; formulas transcribed.
- `Weibel.KBook.IV`: Exercise 8.5(c) and the opening of Exercise 8.6, p. IV.74. The two middle steps, which the source leaves as exercises. Prose verbatim from the text layer of the author's chapter file; formulas transcribed.
- `Waldhausen.KSpaces`: §1.9, printed pp.375–376 (PDF57–58); read 2026-10-02. The comparison and commuting object/category square.

### Additivity for Waldhausen categories

`GeneralAlgebraicKTheory:K.4/waldhausen-additivity` · theorem · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

For a Waldhausen category the map from the weak-equivalence S-construction of the extension category to the product of two copies of that of the category, taking a cofibration sequence to its sub and quotient terms, is a homotopy equivalence. Equivalently, for a cofibration sequence of exact functors the middle induces the sum of the outer two. No saturation, extension or cylinder axiom is needed. This is the Waldhausen form; its simplicial proof is required here and is not deduced merely from the exact-category theorem; with a cylinder functor satisfying the cylinder axiom it gives that the cone is null-homotopic and hence that suspension is a homotopy inverse on K-theory.

**Hypotheses.**

- The category is a small Waldhausen category; the theorem needs none of the three extra axioms.
- The extension category is the second term S₂C of the S-construction, the category of cofibration sequences with the cofibrations of Weibel II.9.3; for an exact category it is the pinned category of conflations.
- A cofibration sequence of functors requires the canonical map out of the pushout to be a cofibration for every cofibration of the source, which is a condition on the functors, not only on their values.
- The suspension consequence does need a cylinder functor satisfying the cylinder axiom.

**Proof outline.**

1. Apply object-S-additivity to C(m,w), the category of strings of m composable weak equivalences in C with objectwise cofibrations. The gluing axiom makes pushouts of these strings weak-equivalence strings, so C(m,w) is a category with cofibrations.
2. The extension and S-constructions commute with this string construction: δ_n C(m,w)=N_m(wS_n C), and the same for E(C). These are natural identifications in both m and n.
3. The object theorem gives an equivalence δ.E(C(m,w))→δ.C(m,w)² for every m. Realise in m using H.2’s levelwise-equivalence theorem and bisimplicial realisation lemma, yielding |wS.E(C)|≃|wS.C|².
4. For a cofibration sequence of exact functors use the universal functor to E(C); the inverse of (sub,quotient) is the split sum, giving the middle-functor additivity relation. Apply repeatedly for filtrations and alternating sums.
5. With a cylinder satisfying its axiom, the cone is weakly equivalent to zero and its cofibration sequence id↣cone↠suspension gives suspension=−id on K-theory. This consequence is kept under its extra hypothesis.

**Acceptance.**

- A cofibration sequence of exact functors gives the additivity relation on all K-groups.
- Under the cylinder axiom the cone is null-homotopic and suspension induces minus the identity.
- The theorem needs none of the three extra axioms; the corollaries about the cone do need the cylinder axiom.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/S-construction`
- `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`
- `StableHomotopyKTheory:H.2/quillen-theorem-a`
- `StableHomotopyKTheory:H.2/quillen-theorem-b`
- `GeneralAlgebraicKTheory:K.4:construction/object-S-additivity`
- `StableHomotopyKTheory:H.2/bisimplicial-realization-lemma`

**Sources.**

- `Weibel.KBook.V`: Additivity Theorem 1.2 and Example 1.2.3, p. V.2. The theorem in the form that covers Waldhausen categories, and the suspension consequence, verbatim.
- `Waldhausen.KSpaces`: Theorem 1.4.2, printed p.336 (PDF19); read 2026-10-01. The passage from cofibration-only additivity to weak-equivalence strings.

### Relative S-construction fibration and iterated delooping

`GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum` · theorem · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

For an exact functor f : B → C of small Waldhausen categories let S.f be the simplicial Waldhausen category with Sₙf = SₙB ×_{SₙC} Sₙ₊₁C (Weibel IV.8.5.3): its objects are pairs (B∗, C∗) with f(B∗) = ∂₀C∗, C sits inside it as the objects (0, C = ⋯ = C), and the projection Sₙf → SₙB is exact. Realising the wS.-direction first, the levelwise sequences |wS.C| → |wS.(Sₙf)| → |wS.(SₙB)| realise to a homotopy fibration sequence Ω|wS.(S.B)| → |wS.C| → |wS.(S.f)| → |wS.(S.B)| based at the zero objects (Weibel V.1.7), whose first map, composed with the equivalence |wS.B| ≃ Ω|wS.(S.B)| of the case f = id_B, is homotopic to the map induced by f (Weibel, Exercise V.1.7). For f = id the relative term is the simplicial path object of wS.S.C and is contractible (IV.8.5.4), so |wS.C| ≃ Ω|wS.(S.C)| naturally in exact functors; applied to S.ⁿC this gives natural equivalences |wS.ⁿC| ≃ Ω|wS.ⁿ⁺¹C| for every n ≥ 1. StableHomotopyKTheory:H.5:S-delooping imports these maps and assembles the connective Ω-spectrum; this node does not re-plan spectrum assembly or products. The initial map |wC| → Ω|wS.C| is canonical but is not generally a group completion: Waldhausen K-theory also imposes the cofibration-sequence relations. The group-completion comparison for split exact categories with isomorphisms as weak equivalences is K.2:plus/H.4’s separate theorem.

**Hypotheses.**

- B and C are small Waldhausen categories and f is exact; no saturation, extension or cylinder axiom is needed.
- Degreewise input: Sₙf is equivalent to the extension category E(C, Sₙf, SₙB) of SₙB by C (Weibel II.9.3), so Waldhausen additivity in the form of Corollary V.1.3.1 (K.4/waldhausen-additivity) makes (sub, quotient) : wS.(Sₙf) → wS.C × wS.(SₙB) a homotopy equivalence. Hence each |wS.C| → |wS.(Sₙf)| → |wS.(SₙB)| is a split homotopy fibration sequence over the zero object, its fibre inclusion induced by C ↦ (0, C = ⋯ = C), naturally in n.
- Realisation input: the realisation theorem for levelwise homotopy fibration sequences of simplicial spaces, requested from StableHomotopyKTheory:H.2 (Waldhausen 1978, Lemma 5.2, as the K-book quotes it; Bousfield–Friedlander 1978, Theorem B.4). Its hypotheses hold here: (a) the levelwise sequences are homotopy fibration sequences, by the previous hypothesis; (b) every base term |wS.(SₙB)|, and every total term |wS.(Sₙf)|, is connected, because the zeroth term of an S-construction is the zero category (Weibel IV.8.4), which gives the connectivity form of the theorem and makes the π∗-Kan and π₀ conditions of the bisimplicial form automatic; (c) every space is the realisation of a multisimplicial set, so the simplicial spaces n ↦ |wS.(Sₙ−)| have cellular degeneracies and are good and proper, and realising in the wS.-direction first is legitimate by the bisimplicial realisation lemma (StableHomotopyKTheory:H.2/bisimplicial-realization-lemma).
- The relative K-theory space of f is Ω²|wS.(S.f)|, K.5's Waldhausen relative theory (Weibel IV.8.5.3).
- In the proof of V.1.7 the source exchanges the roles of B and C; the roles above follow IV.8.5.3 and the statement, and the misprint is recorded as GeneralAlgebraicKTheory/E-relative-S-proof-roles.
- For f = id_C the relative construction is the simplicial path object P(S.C), with degree n equal to S_{n+1}C. Its contraction uses the extra degeneracy and augmentation to S₀C, not the false equality S₀f = 0 printed in IV.8.5.4 (source issue E-relative-S-zero-term).

**Proof outline.**

1. Define S.f by the pullback SₙB ×_{SₙC} Sₙ₊₁C with the Waldhausen structure of IV.8.5.3, with the exact maps C → S.f → S.B, and record that for f = id it is the simplicial path object of S.C, contractible by the extra degeneracy of the augmented simplicial path construction, whose augmentation target is S₀C = 0 (IV.8.5.4, corrected). Its degree-zero term S₀(id_C) is S₁C ≃ C, not 0.
2. Prove the equivalence Sₙf ≃ E(C, Sₙf, SₙB), natural in n, and apply K.4/waldhausen-additivity to obtain the split fibration sequences |wS.C| → |wS.(Sₙf)| → |wS.(SₙB)|.
3. Check the hypotheses of the H.2 realisation theorem as listed (levelwise fibration sequences, connected base and total terms, realisations of multisimplicial sets, basepoints at the zero objects), realise in the wS.-direction first, and conclude that Ω|wS.(S.B)| → |wS.C| → |wS.(S.f)| → |wS.(S.B)| is a homotopy fibration sequence, the fibre of |wS.(S.f)| → |wS.(S.B)| over the zero object being identified with |wS.C| by the canonical map from the levelwise fibres (StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence).
4. Identify the first map: the map of sequences S.id_B → S.f given by id_B on B and f on the second factor is compatible with the two fibration sequences, so the first map is the equivalence |wS.B| ≃ Ω|wS.(S.B)| of the case f = id followed by the map induced by f (Weibel, Exercise V.1.7, whose hint is this naturality).
5. Specialise to f = id to get |wS.C| ≃ Ω|wS.(S.C)|, natural in exact functors; iterate on S.ⁿC for n ≥ 1 and export these maps to H.5:S-delooping, which alone assembles the spectrum.
6. Record the non-example: the first map from |wC| to Ω|wS.C| need not be a group completion for an arbitrary Waldhausen category; a group-completion theorem requires the separate split exact hypotheses of K.2:plus/H.4.
7. Record the degree-minus-one consequence the source gives, that the first homotopy group of the relative realisation is the cokernel of the map of Grothendieck groups, which is where negative K-theory first appears.

**Acceptance.**

- For every n ≥ 1 the natural map |wS.ⁿC| → Ω|wS.ⁿ⁺¹C| is an equivalence; these are the maps the spectrum-assembly owner consumes.
- After the identification |wS.B| ≃ Ω|wS.(S.B)|, the first map of the fibration sequence is the map induced by f.
- No group-completion equivalence is claimed for arbitrary Waldhausen categories: for finite abelian p-groups with their usual exact structure, [ℤ/p²] = 2[ℤ/p] in exact K₀, but these classes are independent in the group completion of the direct-sum monoid.
- The first homotopy group of the relative realisation is the cokernel of the map of Grothendieck groups.
- The realisation step is not asserted for arbitrary levelwise fibrations of simplicial spaces: the connectivity and goodness hypotheses are checked here.
- For f = id_C, S₀f ≃ C while the augmented path object contracts to S₀C = 0; a nonzero category C distinguishes these two terms.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4/waldhausen-additivity`
- `GeneralAlgebraicKTheory:K.4:construction/S-construction`
- `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`
- `StableHomotopyKTheory:H.2`
- `StableHomotopyKTheory:H.2/bisimplicial-realization-lemma`
- `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`

**Sources.**

- `Weibel.KBook.V`: Proposition 1.7 with its proof, p. V.8. The displayed sequence (its first term looped; the earlier transcription omitted Ω) and the realisation lemma the proof invokes, verbatim; the proof's exchange of B and C is recorded under sourceIssues.
- `Weibel.KBook.IV`: Relative K-theory spaces 8.5.3 and Lemma 8.5.4, p. IV.69. The relative construction and the roles of B and C used here, verbatim.
- `Weibel.KBook.IV`: Infinite Loop Structure 8.5.5, p. IV.69. Natural delooping equivalence in IV.8.5.5, whose fibration input is V.1.7.
- `Weibel.KBook.V`: Exercise 1.7, p. V.10. The identification of the first map, verbatim; the source leaves it as an exercise and the proof steps carry it out.

**Source issues.**

- `GeneralAlgebraicKTheory/E-relative-S-proof-roles`

### The Waldhausen localisation (fibration) theorem

`GeneralAlgebraicKTheory:K.4/fibration-theorem` · theorem · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

Let a category with cofibrations carry two classes of weak equivalences, the smaller inside the larger, each making it a Waldhausen category, and let the subcategory of objects that are trivial for the larger class carry the smaller class. If the larger structure has a cylinder functor satisfying the cylinder axiom and the larger class satisfies saturation and the extension axiom, then the three K-theory spaces form a homotopy fibration, with the expected long exact sequence ending in the right-exact sequence of Grothendieck groups. Every hypothesis is used, and this node lists them as hypotheses rather than as background.

**Hypotheses.**

- Two classes of weak equivalences on the same category with cofibrations, the smaller contained in the larger.
- The larger structure has a cylinder functor satisfying the cylinder axiom; the larger class satisfies saturation and the extension axiom.
- The subcategory is the full Waldhausen subcategory of objects whose map from the zero object lies in the larger class, with the smaller class of weak equivalences.

**Proof outline.**

1. Form the bicategory v·w.C of commuting squares. The inclusion of wC as vertically constant squares is a realisation equivalence by H.2’s swallowing lemma: at vertical nerve degree m, evaluation at the first object is a retraction and the arrows of the string give a natural transformation from its composite with the constant string to identity.
2. For each m identify the horizontal category with wC(m,v). Apply K.4/trivial-cofibration-nerve with pointwise cylinder to replace it by co_w C(m,v). Repeat for S_nC and realise both directions.
3. Use K.4/localization-relative-S-comparison to identify |v·co_w.S.C| with |vS.(S.f)|, compatibly with |vS.C|. The relative S-fibration now identifies its homotopy fibre with |vS.C^w|. Loop to obtain K(C^w,v)→K(C,v)→K(C,w).
4. The long exact sequence ends with K₀(C^w,v)→K₀(C,v)→K₀(C,w)→0. The last map is surjective because both categories have the same objects and w adds relations to their Grothendieck presentation.
5. General exact-functor localisation and central ring localisation have a separate possible cokernel in degree zero when the target contains new projectives. That qualification must not be transferred to this same-object change-of-weak-equivalences theorem.

**Acceptance.**

- The localisation sequence for a central multiplicative set of non-zero-divisors holds with the support term.
- Thomason's cofinality theorem is the special case with the Grothendieck-class weak equivalences.
- None of the four hypotheses may be dropped; the source's counterexamples show the statement fails without them.
- The map K₀(C,v)→K₀(C,w) is surjective for this same-object change of weak equivalences; central localisation of rings with new projectives is a separate statement.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`
- `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`
- `GeneralAlgebraicKTheory:K.4/trivial-cofibration-nerve`
- `GeneralAlgebraicKTheory:K.4/localization-relative-S-comparison`
- `StableHomotopyKTheory:H.2`
- `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`

**Sources.**

- `Weibel.KBook.V`: Waldhausen Localization Theorem 2.1, p. V.12. The theorem with all four hypotheses, verbatim.
- `Weibel.KBook.V`: Theorem 2.6.3 and Caveat 7.1.1, pp. V.17 and V.52. The standing instance and the warning that motivates K.6, verbatim.

### The Approximation theorem

`GeneralAlgebraicKTheory:K.4/approximation-theorem` · theorem · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

Let an exact functor of saturated Waldhausen categories detect weak equivalences, and suppose the approximate lifting property holds: every map out of the image of an object factors as the image of a map followed by a weak equivalence. If the source has a cylinder functor satisfying the cylinder axiom, then the functor induces homotopy equivalences of the weak-equivalence S-constructions and of the K-theory spaces. The theorem is what produces the standard models of K-theory by complexes, and the source records that it fails without the cylinder hypothesis, with an explicit pair of categories whose Grothendieck groups differ.

**Hypotheses.**

- Both categories are saturated; the functor detects weak equivalences in both directions.
- The approximate lifting property holds, and the factoring map may be taken to be a cofibration.
- The source has a cylinder functor satisfying the cylinder axiom. The source records that without it the conclusion fails.

**Proof outline.**

1. Apply K.4/approximation-comma-contractibility and H.2’s Theorem A to get |wA|≃|wB|.
2. K.4/approximation-lifts-S-filtrations verifies the same hypotheses for every S_nF, including the induced pointwise cylinder and reflection of weak equivalences. Thus |wS_nA|≃|wS_nB| for all n.
3. Realise the degreewise equivalences by H.2’s bisimplicial realisation theorem and loop, giving K(A)≃K(B).
4. The cylinder-free App counterexample remains: the split-exact and nonsplit-exact models of an exact category can have distinct K₀. The strong cylinder and saturation hypotheses have not been replaced by a mere objectwise approximation property.

**Acceptance.**

- The K-theory of a ring is that of its perfect complexes.
- The K-theory of an abelian category is that of its bounded complexes.
- Without the cylinder hypothesis the theorem is false, and the source's counterexample witnesses it.
- Enlarging the cofibrations with the same weak equivalences does not change K-theory.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4/fibration-theorem`
- `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`
- `GeneralAlgebraicKTheory:K.4/approximation-comma-contractibility`
- `GeneralAlgebraicKTheory:K.4/approximation-lifts-S-filtrations`
- `StableHomotopyKTheory:H.2/quillen-theorem-a`
- `StableHomotopyKTheory:H.2/bisimplicial-realization-lemma`

**Sources.**

- `Weibel.KBook.V`: Waldhausen Approximation Theorem 2.4 with its proof, p. V.15. The theorem with its three conditions and the first step of the proof, verbatim.
- `Weibel.KBook.V`: Changing cofibrations 2.5.1, p. V.16. The consequence about changing cofibrations, verbatim.
- `Waldhausen.KSpaces`: Theorem1.6.7, printed pp.354–359 (PDF37–42); read 2026-10-02. The previously omitted finite-diagram argument is now decomposed into separate nodes.

### The Gillet-Waldhausen comparison

`GeneralAlgebraicKTheory:K.4/gillet-waldhausen` · theorem · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

For an exact category closed under kernels of surjections in an ambient abelian category, the inclusion into the bounded complexes, with degreewise admissible monomorphisms as cofibrations and QUASI-ISOMORPHISMS as weak equivalences, induces a homotopy equivalence of K-theory spaces. The closure hypothesis is what makes the acyclic objects the admissibly exact complexes; without it the source gives a repaired statement in which quasi-isomorphisms are computed in the category of left exact functors and cofinality is used. Quasi-isomorphisms may not be replaced by chain homotopy equivalences in categories where the two differ.

**Hypotheses.**

- The exact category is given as a full subcategory of an abelian category M, closed under extensions and carrying the pinned induced structure (ExactStructure.fullSubcategory of ExactStructure.abelian M), and closed under kernels of surjections in M, in the source's sense (Weibel II.7.0.1). The ambient M is part of the data, since the pinned carrier has no Gabriel–Quillen embedding.
- The weak equivalences are the quasi-isomorphisms computed in M, not chain homotopy equivalences. The repaired statement without the closure hypothesis computes them in the category of left exact functors (the Gabriel–Quillen embedding of Weibel's Exercise II.7.8), which neither library has; that statement is recorded, not decomposed.
- The proof uses the fibration theorem and a cylinder functor on the complexes, namely the mapping cylinder.

**Proof outline.**

1. Record the Waldhausen structure on the bounded complexes and the mapping cylinder that makes the fibration theorem applicable.
2. Prove that for a bounded range the acyclic objects are the admissibly exact complexes, using the closure hypothesis.
3. Compute the K-theory of the categories of complexes concentrated in a bounded range by additivity, and identify the cofibre of the comparison map with the K-theory of the category through the Euler characteristic.
4. Pass to the colimit over the range and apply the fibration theorem to the inclusion of the isomorphisms in the quasi-isomorphisms.
5. Record the repaired statement without the closure hypothesis and what it costs: the quasi-isomorphisms must be computed in the left exact functors and cofinality must be invoked.
6. Record the degree-zero shadow, that the Grothendieck group of the bounded complexes is that of the category with the alternating-sum formula, and the non-example about chain homotopy equivalences.

**Acceptance.**

- The K-theory of an exact category is that of its bounded complexes with quasi-isomorphisms.
- In degree zero the comparison is the alternating-sum formula for the class of a complex.
- Replacing quasi-isomorphisms by chain homotopy equivalences changes the statement and needs its own argument.
- Without the closure hypothesis the naive statement can fail in degree zero; the repaired form is the one to use.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4/approximation-theorem`
- `GeneralAlgebraicKTheory:K.4/fibration-theorem`
- `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`
- `tauceti:TauCeti.ExactStructure.abelian`
- `tauceti:TauCeti.ExactStructure.fullSubcategory`

**Sources.**

- `Weibel.KBook.V`: Theorem 2.2 (Gillet-Waldhausen) with the opening of its proof, p. V.13. The theorem and the structure of its proof, verbatim.
- `Weibel.KBook.V`: Remark 2.2.1, p. V.14. The repaired statement without the closure hypothesis, verbatim.

### Relative K-theory as a homotopy fibre

`GeneralAlgebraicKTheory:K.5/relative-K-theory` · definition · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

For a unital ring homomorphism f the RELATIVE K-THEORY space K(f) is the homotopy fibre, at the basepoint of the target, of the induced map K(f) of the ring model (K.2/functorial-K-theory-of-a-ring), and the relative groups are its homotopy groups; they fit into a long exact sequence with the absolute groups, ending in the zeroth relative group mapping to the zeroth group of the source. All the relative groups, the zeroth one included, are abelian, because the functorial H-space structure on the K-theory space makes the fibre one. A pair consisting of a possibly noncommutative ring and a two-sided ideal is treated through the quotient map A → A/I. For an exact functor of Waldhausen categories the relative theory is the double loop space of the relative S-construction of K.4:construction, and its sequence ends one step further, with the cokernel of the map of Grothendieck groups appearing as a first negative group. The identification of the relative groups of a pair in degrees zero and one with the classical groups K₀(I) and K₁(A, I) = GL(I)/E(A, I) is KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison, which imports this node; it is not asserted here.

**Hypotheses.**

- The rings are unital and the map is unital; for a pair the ideal is two-sided (Mathlib's Ideal with [I.IsTwoSided], whose quotient ring is Ideal.Quotient.ring), and no commutativity is assumed.
- The homotopy fibre is taken at the basepoint of the target, and the H-space structure used for the group laws is the functorial one.
- The Waldhausen version needs the relative S-construction and its fibration, which is K.4:construction's theorem K.4/delooping-and-the-spectrum.
- The classical relative groups are KTheoryLowDegrees U.5's, and their comparison with this fibre is U.6's; both lie downstream of this node, so no statement of this node uses them.

**Proof outline.**

1. Define the relative space as the homotopy fibre (StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence) and the relative groups as its homotopy groups.
2. Record the long exact sequence and its end in degree zero.
3. Prove that every relative group is abelian, from the functorial H-space structure.
4. Define the relative theory of a pair through the quotient map by a two-sided ideal. When the quotient map has a ring section, the fibre sequence splits and the relative groups are the kernels of K_n(A) → K_n(A/I).
5. Record the Waldhausen version, the double loop space of the relative S-construction, and the extra term at the end of its sequence.
6. Record what the pinned libraries have: Mathlib has the homotopy fibre of a map of complexes but no K-theory space, so nothing of this exists at the pins.

**Acceptance.**

- The relative groups are abelian in every degree, including degree zero.
- For a pair whose quotient map has a ring section the relative groups are the kernels of K_n(A) → K_n(A/I).
- The Waldhausen relative sequence has one more term than the ring one, the cokernel of the map of Grothendieck groups.
- The relative theory of the identity map is trivial.
- No identification of the relative groups of a pair with K₀(I) or K₁(A, I) is asserted here; that comparison is KTheoryLowDegrees U.6's.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`
- `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`
- `mathlib:Ideal.Quotient.ring`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `relativeK` | data | The relative K-theory space of a ring map. |
| `relativeK.group` | data | The relative groups. |
| `relativeK.addCommGroup` | structure | Their abelian group structure, degree zero included. |
| `relativeK.les` | characterisation | The long exact sequence with the absolute groups. |
| `relativeK.ofPair` | example | The relative theory of a ring and a two-sided ideal, through the quotient map; its identification in degrees zero and one with K₀(I) and K₁(A, I) is KTheoryLowDegrees U.6's. |
| `relativeK.waldhausen` | relation | The Waldhausen relative theory and its extra term. |

**Consumers.**

- K.5, excision — Excision is the question of when the relative groups depend only on the ideal.
- K.6 — The extra term at the end of the Waldhausen sequence is the first negative K-group, which is where the nonconnective theory starts.
- K.7 — The products are asserted compatible with the relative groups.
- KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison — Identifies π₀ and π₁ of the fibre for a pair with the classical K₀(I) and K₁(A, I).

**Unit tests.**

- `identity_map` (degenerate) — The relative theory of the identity is trivial.
- `split_pair` (computation) — When the quotient map A → A/I has a ring section, the fibre sequence splits: π_n K(A, I) is the kernel of K_n(A) → K_n(A/I) and K_n(A) ≅ K_n(A/I) ⊕ π_n K(A, I) naturally; for the double ring A ⊕ I with its projection to A this gives π₀ K(A ⊕ I, 0 ⊕ I) = ker(K₀(A ⊕ I) → K₀(A)).
- `abelian_in_degree_zero` (degenerate) — The zeroth relative group is abelian; it is a homotopy set made a group by the H-space structure, and that structure must be carried.
- `waldhausen_extra_term` (computation) — The Waldhausen relative sequence has the cokernel of the map of Grothendieck groups as an extra term.

**Sources.**

- `Weibel.KBook.IV`: Relative groups 1.11.1, p. IV.8. The definition, the sequence and the abelian-group statement, verbatim.
- `Weibel.KBook.IV`: Exercise 1.15, p. IV.16. The identification of the low relative groups for a pair, stated by the source as an exercise with hints; KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison owns it and imports this node, which does not assert it.

### Relative K-theory is not support K-theory

`GeneralAlgebraicKTheory:K.5/relative-versus-support` · comparison · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

For a central multiplicative set the SUPPORT theory is the K-theory of the bounded complexes of finitely generated projectives that become exact after localising. It sits in a homotopy fibration with the K-theory of the ring and of the localisation, which looks like the relative sequence but is a different construction: the support theory is defined from a Waldhausen category, not as a homotopy fibre, and the map of zeroth K-groups at the end is not surjective, so the connective fibre does not see the cokernel. The source also records that when the multiplicative set contains zero divisors the category of torsion perfect modules does not model the fibre. This node states the distinction the stage text asks for and records both failure modes.

**Hypotheses.**

- The multiplicative set is central; for the identification with the torsion modules its elements are non-zero-divisors.
- The support category is the bounded complexes of finitely generated projectives whose localisation is exact.
- The fibration is the one the fibration theorem of K.4 produces, with the approximation theorem used to identify the third term.

**Proof outline.**

1. Define the support category and record the fibration the fibration theorem gives.
2. Compare the sequence with the relative sequence of the localisation map and record where they differ: the third term is the K-theory of a category of modules over the localisation that is only cofinal in all finitely generated projectives.
3. Record the source's caveat that the map of zeroth groups is not onto and that continuing the sequence needs the nonconnective spectra of K.6.
4. Record the second failure mode: for a multiplicative set with zero divisors the category of torsion perfect modules is not the fibre, which the source gives as an exercise.
5. State the resulting rule: support theory is used where the stage text says support, relative theory where it says relative, and neither is substituted for the other.

**Acceptance.**

- For a central set of non-zero-divisors there is a homotopy fibration with the support term.
- The map of zeroth K-groups is not surjective in general, so the connective sequence stops.
- For a set containing zero divisors the torsion perfect modules do not model the fibre.
- Support theory and relative theory are different constructions and are not interchangeable.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.5/relative-K-theory`
- `GeneralAlgebraicKTheory:K.4/fibration-theorem`
- `GeneralAlgebraicKTheory:K.4/approximation-theorem`

**Sources.**

- `Weibel.KBook.V`: Theorem 2.6.3, p. V.17. The support fibration, verbatim.
- `Weibel.KBook.V`: Caveat 7.1.1, p. V.52. Both failure modes, verbatim.

### Nonunital rings, the unitisation and the comparison with the unital theory

`GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation` · construction · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

A ring without unit is treated through a specified unitisation, the canonical augmented ring obtained by adjoining the integers, and its K-theory is defined as the relative theory of the augmentation. The unitisation is pinned in Mathlib with its universal property, and nothing K-theoretic is built on it there. The comparison with the usual theory is the statement that for a nonunital ring contained as a two-sided ideal in a unital ring there is a map from the theory defined this way to the relative theory of the pair, and the question of when it is an isomorphism is exactly excision, which is the next node's subject.

**Hypotheses.**

- The nonunital ring is an associative ring without unit; the unitisation is the canonical one over the integers, which is the pinned construction.
- The augmentation is the ring map to the integers and the relative theory is that of the augmentation.
- The comparison map exists for any unital ring containing the nonunital one as a two-sided ideal, and no claim is made about its being an isomorphism here.

**Proof outline.**

1. Record the pinned unitisation with its universal property and record that nothing K-theoretic is built on it at the pins.
2. Define the K-theory of a nonunital ring as the relative theory of the augmentation.
3. Construct the comparison map to the relative theory of a pair, using functoriality of the relative theory in maps of pairs.
4. Prove the elementary properties: the construction agrees with the usual one when the ring happens to be unital and the inclusion is split, and it is functorial for maps of nonunital rings.
5. Record that the question of when the comparison is an isomorphism is excision, and hand it to the next node.

**Acceptance.**

- For a unital ring the construction agrees with the usual theory.
- The comparison map to the relative theory of a pair exists for every unital ring containing the nonunital one as an ideal.
- The construction is functorial for maps of nonunital rings.
- No excision statement is made here.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.5/relative-K-theory`
- `mathlib:Unitization`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `nonunitalK` | data | The K-theory of a nonunital ring through its unitisation. |
| `nonunitalK.map` | functoriality | Functoriality in maps of nonunital rings. |
| `nonunitalK.compare` | data | The comparison map to the relative theory of a pair. |
| `nonunitalK.of_unital` | compatibility | Agreement with the usual theory for a unital ring. |
| `nonunitalK.unitization_pinned` | relation | The unitisation is Mathlib’s, with its universal property. |

**Consumers.**

- K.5, excision — Excision is the statement that the comparison map is an isomorphism.
- K.6 — The four axioms for negative K-theory are stated for nonunital rings, and the ideal axiom uses this construction.

**Unit tests.**

- `unital_case` (compatibility) — For a unital ring the construction agrees with the usual theory.
- `functorial` (computation) — It is functorial for maps of nonunital rings.
- `comparison_exists` (computation) — The comparison map exists for every unital ring containing the ring as an ideal.
- `no_excision_claimed` (non-example) — The comparison map is not asserted to be an isomorphism; that is the next node’s hypothesis-laden statement.

**Sources.**

- `Weibel.KBook.IV`: Absolute Excision 1.11.2, p. IV.9. The unitisation and the comparison map, verbatim; the excision question itself is the next node.

### Excision holds under hypotheses, and fails without them

`GeneralAlgebraicKTheory:K.5/excision-and-its-failure` · theorem · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

A nonunital ring satisfies absolute excision in degree n when the comparison map of the previous node is an isomorphism for every unital ring containing it as an ideal. Every nonunital ring satisfies it in degree zero. In degree one it holds exactly when the ring is idempotent, that is equal to its own square, which is both the criterion and the counterexample: a nonunital ring with a proper square fails excision for the first K-group. In general it holds in degrees one to n exactly when the first n torsion groups of the integers over the unitisation vanish, and a ring for which all of them vanish, called homologically unital, satisfies excision in all degrees. The criteria are quoted from Suslin and Suslin-Wodzicki as the source quotes them, with their proofs outside what was read.

**Hypotheses.**

- The nonunital ring is associative; the unitisation is the canonical one and the torsion groups are taken over it.
- Absolute excision is quantified over ALL unital rings containing the ring as a two-sided ideal, which is what makes it a property of the ring alone.
- The criteria are quoted, not proved: the source attributes them to Suslin and to Suslin and Wodzicki and does not prove them, and neither does this packet.

**Proof outline.**

1. Define absolute excision in each degree, quantified over all ambient unital rings.
2. Record that every nonunital ring satisfies it in degree zero.
3. Record the criterion in degree one: excision holds exactly when the ring equals its square, and note that the first torsion group is the quotient of the ring by its square, so the general criterion contains this one.
4. Record the general criterion and the notion of a homologically unital ring, with excision in all degrees.
5. Give the counterexample the criterion yields: a nonunital ring with a proper square, for instance a square-zero ring, fails excision for the first K-group, which is the explanatory test the stage text asks for.
6. State the rule this layer exports: no unconditional excision instance may be created, and every use must name the hypothesis it relies on.

**Acceptance.**

- Excision holds in degree zero for every nonunital ring.
- Excision in degree one holds exactly when the ring is idempotent; a square-zero ring is the counterexample.
- A homologically unital ring satisfies excision in all degrees.
- No unconditional excision statement may be asserted; the stage text forbids it and the criterion shows why.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation`
- `GeneralAlgebraicKTheory:K.5/relative-K-theory`

**Sources.**

- `Weibel.KBook.IV`: Absolute Excision 1.11.2, p. IV.9. The definition, the degree-zero statement, the degree-one criterion, the general criterion and the notion of an H-unital ring, verbatim.

### Milnor's sequence is exact at the pair of K₁-groups

`GeneralAlgebraicKTheory:K.5/milnor-square-K1-exactness` · lemma · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

For a Milnor square, the sequence K₁(B) → K₁(S) × K₁(T) → K₁(C) of classical K₁-groups, with first map (K₁(p), K₁(q)) and second map (x, y) ↦ K₁(φ)(x) · K₁(ψ)(y)⁻¹, is exact at K₁(S) × K₁(T). This is the one exactness position of Milnor's K₁–K₀ sequence that KTheoryLowDegrees Z.1 does not decompose.

**Hypotheses.**

- A Milnor square: unital, possibly noncommutative rings S, T and C in one universe, a surjective unital map φ : S → C, a unital map ψ : T → C, and B = RingHom.pullback φ ψ with its projections p : B → S and q : B → T, the convention of KTheoryLowDegrees Z.1. Equivalently (Weibel III.2.6), a unital map f : R → S carrying a two-sided ideal I of R isomorphically onto a two-sided ideal of S, with T = R/I and C = S/I; then B ≅ R.
- Surjectivity of φ is essential: it is what makes the patched modules finitely generated projective and what lets elementary matrices over C lift to S.
- K₁ is the classical GL/E of KTheoryLowDegrees U.2, written multiplicatively; its identification with π₁ of the ring model is KTheoryLowDegrees U.6's and is not used.

**Proof outline.**

1. The composite is trivial: φ ∘ p = ψ ∘ q (RingHom.pullback_comm_sq) and K₁ is functorial (KTheoryLowDegrees:U.2/K1-map).
2. Let x = [g] and y = [h] with K₁(φ)(x) = K₁(ψ)(y). Represent g and h in one GL_n (KTheoryLowDegrees:U.1/finite-representatives) and enlarge n until φ(g) = ψ(h) · ē with ē in E_n(C) (the stable elementary subgroup, KTheoryLowDegrees:U.1/stable-elementary-subgroup).
3. Lift ē to e in E_n(S), which is possible because φ is surjective (KTheoryLowDegrees:U.1/elementary-surjective-map); then φ(g e⁻¹) = ψ(h).
4. A pair of invertible matrices over S and T with equal images in C is an invertible matrix over the pullback B, its inverse being the pair of inverses; so (g e⁻¹, h) lies in GL_n(B), and its class in K₁(B) maps to ([g], [h]) because e is elementary.

**Acceptance.**

- Every pair of classes with the same image in K₁(C) comes from K₁(B).
- The lemma uses the surjectivity of φ only through the lifting of elementary matrices; the lifting of invertible matrices is neither needed nor true in general.
- No exactness at K₁(B) is asserted: the sequence starts there.

**Prerequisites.**

- `KTheoryLowDegrees:U.2/K1`
- `KTheoryLowDegrees:U.2/K1-map`
- `KTheoryLowDegrees:U.1/finite-representatives`
- `KTheoryLowDegrees:U.1/stable-elementary-subgroup`
- `KTheoryLowDegrees:U.1/elementary-surjective-map`
- `mathlib:RingHom.pullback`
- `mathlib:RingHom.pullback_comm_sq`

**Sources.**

- `Weibel.KBook.III`: Proof of Theorem 2.6, the last step, p. III.15. The argument of the proof steps, verbatim (formulas transcribed); in the notation here S is S, T is R/I and C is S/I.

### Milnor's K₁–K₀ Mayer–Vietoris sequence for a Milnor square

`GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris` · theorem · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

For a Milnor square the sequence K₁(B) → K₁(S) × K₁(T) → K₁(C) → K₀(B) → K₀(S) × K₀(T) → K₀(C) is exact at each of its four interior terms. Its maps are (K(p), K(q)), then (x, y) ↦ K(φ)x − K(ψ)y (written multiplicatively on K₁), then the Milnor boundary ∂ of KTheoryLowDegrees:Z.1/milnor-boundary, which sends a gluing matrix a ∈ GL_n(C) to [FreePatch(a)] − n[B] with the gluing orientation fixed there, then (K₀(p), K₀(q)), then the difference of K₀(φ) and K₀(ψ). The K₀-groups are RingK0, which is the degree-zero group of the ring model (K.2/functorial-K-theory-of-a-ring), and the K₁-groups are the classical GL/E. The sequence is natural in morphisms of Milnor squares. It is the low-degree excision statement for a Milnor square: in the ideal form f : R → S, exactness at K₀(R) and at K₀(S) × K₀(R/I) carries the classical excision for K₀, and exactness at K₁(S) × K₁(R/I) the degree-one surjectivity of K₁(R, I) → K₁(S, I) (Weibel, Remark III.2.2.1); nothing further is asserted. Bass's continuation into negative degrees (Weibel III.4.3) is K.6's.

**Hypotheses.**

- A Milnor square: unital, possibly noncommutative rings S, T and C in one universe, a surjective unital map φ : S → C, a unital map ψ : T → C, and B = RingHom.pullback φ ψ with its projections p : B → S and q : B → T, the convention of KTheoryLowDegrees Z.1. Equivalently (Weibel III.2.6), a unital map f : R → S carrying a two-sided ideal I of R isomorphically onto a two-sided ideal of S, with T = R/I and C = S/I; then B ≅ R.
- Surjectivity of φ is essential: it is what makes the patched modules finitely generated projective and what lets elementary matrices over C lift to S.
- The K₀-groups are Z.1's RingK0 and are identified with π₀ of the ring model by K.2/functorial-K-theory-of-a-ring; the K₁-groups are KTheoryLowDegrees U.2's GL/E. The identification of the latter with π₁ of the ring model (KTheoryLowDegrees U.6 with the plus comparison) lies downstream of K.5 and is not used, so the sequence is not stated for the homotopy groups of the ring model in degree one.
- No surjectivity onto K₀(C) is asserted, and no term to the left of K₁(B).

**Proof outline.**

1. Pass between the two forms of the hypothesis: in the pullback form q is surjective, its kernel is carried isomorphically by p onto the kernel of φ, and B → S is the ideal form; conversely the ideal form is the pullback of S → S/I and R/I → S/I.
2. Exactness at K₀(S) × K₀(T) is KTheoryLowDegrees:Z.1/milnor-exact-at-pair, which rests on Milnor patching (Z.1/milnor-finite-projective); exactness at K₀(B) is Z.1/milnor-exact-at-k0; exactness at K₁(C) is Z.1/milnor-boundary-kernel, since ∂ is additive and kills the image of K₁(S) × K₁(T).
3. Exactness at K₁(S) × K₁(T) is K.5/milnor-square-K1-exactness.
4. Identify the K₀-terms with the degree-zero groups of the ring model and K₀(p), K₀(q), K₀(φ), K₀(ψ) with its maps, through the degree-zero comparison of K.2/functorial-K-theory-of-a-ring.
5. Naturality: a morphism of Milnor squares induces maps of all six terms commuting with the first, second, fourth and fifth maps by functoriality, and with ∂ because a morphism of squares carries FreePatch(a) to FreePatch of the image of a after scalar extension (Z.1/milnor-boundary).
6. Record what is not asserted: exactness does not extend to a K₂-term in general (the continuation to K₂ of Weibel III.5.8 needs two ideals with I ∩ J = 0), and in the ideal form the classical K₁(R, I) → K₁(S, I) is onto but need not be injective (Swan's example, Weibel Exercise III.2.3), so no excision in degree one beyond surjectivity, and none in higher degrees, may be derived; the conditions under which excision holds are K.5/excision-and-its-failure's.

**Acceptance.**

- The six-term sequence is exact at K₁(S) × K₁(T), K₁(C), K₀(B) and K₀(S) × K₀(T).
- For two-sided ideals I and J of R with I ∩ J = 0 the square R → R/J, R/I → R/(I + J) is a Milnor square, and the sequence is the K₁–K₀ part of Weibel's Theorem III.5.8.
- For the rim square ℤC_p → ℤ[ζ_p], ℤ → 𝔽_p (Weibel Exercise III.2.2) it gives an exact sequence K₁(ℤC_p) → K₁(ℤ[ζ_p]) × K₁(ℤ) → K₁(𝔽_p) → K₀(ℤC_p) → K₀(ℤ[ζ_p]) × K₀(ℤ) → K₀(𝔽_p).
- Nothing asserts excision for K₁ or higher K-groups; Swan's example (Weibel Exercise III.2.3) shows the classical relative K₁ depends on the ambient ring.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.5/milnor-square-K1-exactness`
- `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`
- `KTheoryLowDegrees:Z.1/milnor-finite-projective`
- `KTheoryLowDegrees:Z.1/milnor-boundary`
- `KTheoryLowDegrees:Z.1/milnor-boundary-kernel`
- `KTheoryLowDegrees:Z.1/milnor-exact-at-k0`
- `KTheoryLowDegrees:Z.1/milnor-exact-at-pair`
- `mathlib:RingHom.pullback`

**Sources.**

- `Weibel.KBook.III`: Theorem 2.6 (Mayer–Vietoris) with its proof, p. III.15. The theorem, verbatim with the arrows' labels dropped; its proof derives the K₀ positions from II.2.9 (Milnor patching, owned by KTheoryLowDegrees Z.1) and the K₁ positions from the lifting of elementary matrices.
- `Weibel.KBook.III`: Remark 2.2.1 and Exercise 2.3, pp. III.13 and III.16. The degree-one surjectivity and the failure of degree-one excision that bound what this node asserts.
- `Weibel.KBook.III`: Theorem 5.8, p. III.41. The only extension to K₂ the source gives, under its hypothesis.

### Monoidal products in the extension fibres

`GeneralAlgebraicKTheory:K.2:plus/extension-fibre-product` · construction · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For E_i=(A_i ↣ B_i ↠ C) in E_C, define E_1 * E_2=(A_1⊕A_2 ↣ B_1×_C B_2 ↠ C). Its unit is (0 ↣ C = C). This is a symmetric monoidal groupoid. The split-extension functor η_C : Core(A) → E_C, A ↦ (A ↣ A⊕C ↠ C), is faithful and strong symmetric monoidal. If A is split exact every object of E_C is isomorphic to η_C(A); consequently the action category ⟨Core(A), E_C⟩ is connected.

**Hypotheses.**

- Pullbacks of admissible epimorphisms and the pinned kernel–cokernel and biproduct lemmas are used.
- Split exactness is required only for the last connectedness assertion.

**Proof outline.**

1. Pull back B_1↠C along B_2↠C. The induced map to C is a deflation and its kernel is A_1⊕A_2: the two inclusions identify the kernel through the pullback universal property.
2. Define products of arrows by the same universal property. Obtain unit, associator and symmetry from iterated pullbacks over C; verify the coherence diagrams by their projections.
3. The pullback of two split extensions identifies with (A_1⊕A_2)⊕C. These identifications make η_C strong monoidal. Its middle arrow retains the original isomorphism of A, so it is faithful.
4. A chosen splitting of E identifies it with η_C(A). In the action category, translation by A relates this object to the unit, proving connectedness. No such argument is made for a nonsplit extension.

**Acceptance.**

- At C=0, * is direct sum on Core(A).
- The product retains the common quotient C rather than replacing it by C⊕C.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration`
- `tauceti:TauCeti.ExactStructure.conflation_baseChange`
- `tauceti:TauCeti.ExactStructure.conflation_biprod`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `ExtFibre.tensor` | data | The displayed pullback product in E_C. |
| `ExtFibre.unit` | data | The sequence 0 ↣ C = C. |
| `ExtFibre.split` | functoriality | The faithful symmetric monoidal split-extension functor η_C. |
| `ExtFibre.splitEssentiallySurjective` | characterisation | For split exact A, every E_C-object is isomorphic to η_C(A₀). |

**Consumers.**

- The consuming nodes listed in this packet — For E_i=(A_i ↣ B_i ↠ C) in E_C, define E_1 * E_2=(A_1⊕A_2 ↣ B_1×_C B_2 ↠ C). Its unit is (0 ↣ C = C). This is a symmetric monoidal groupoid. The split-extension functor η_C : Core(A) → E_C, A ↦ (A ↣ A⊕C ↠ C), is faithful and strong symmetric monoidal. If A is split exact every object of E_C is isomorphic to η_C(A); consequently the action category ⟨Core(A), E_C⟩ is connected.

**Unit tests.**

- `fibre_product_zero` (degenerate) — At C=0 the product identifies with direct sum.
- `fibre_product_split` (computation) — η_C(A₁)*η_C(A₂) ≅ η_C(A₁⊕A₂), compatibly with quotient C.
- `nonsplit_fibre` (non-example) — A nonsplit extension is not isomorphic to η_C of its kernel.

**Sources.**

- `Weibel.KBook.IV`: Lemma 7.5 and Remark 7.5.2, pp. IV.62–63; read in full 2026-10-01. The product, unit, faithful split functor and split-exact connectedness.

### Cartesian lifts of Q-morphisms in the extension category

`GeneralAlgebraicKTheory:K.2:plus/extension-cartesian-lifts` · construction · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For φ:C′→C represented by C′↞C″↣C and E=(A↣B↠C), form B′=B×_C C″ and let A′ be the kernel of the composite deflation B′↠C″↠C′. Then φ*E=(A′↣B′↠C′) and the induced Q-type diagram gives a cartesian arrow φ*E→E over φ. Pullback choices yield canonically isomorphic functors E_C→E_C′; identity and composition hold up to coherent natural isomorphism. The Core(A)-action commutes with these lifts, so localisation by it remains fibred with fibre Core(A)⁻¹E_C.

**Hypotheses.**

- Choose representatives and pullbacks; do not assert literal choice-free equality of functors.
- Kernel inclusions and middle inclusions are admissible by base change and composition of deflations.

**Proof outline.**

1. Base change the conflation along C″↣C. Compose the resulting deflation with C″↠C′ and take its admissible kernel A′. The induced A→A′ and B′→B are inflations; the diagram has the orientation of IV.7.3.1.
2. For any EA-arrow whose base factors through φ, its middle arrow factors uniquely through B′ by the pullback, and the kernel arrow then factors by the kernel universal property. This proves the cartesian universal property, not just existence of a diagram.
3. Apply universal properties to maps in E_C. Uniqueness gives representative independence, natural isomorphisms for id and composition, and the associativity coherence for triple composition.
4. Pullback along C″ commutes with adding a split summand on kernel and middle terms. The resulting natural isomorphisms respect the action and cartesian arrows; use H.4’s cartesian-action localisation theorem to identify the localised fibres.
5. For 0↣C the lift sends (A↣B↠C) to A=A→0. For 0↞C it sends it to B=B→0. These two calculations are used in the fibration criterion.

**Acceptance.**

- The cartesian arrow projects to φ:C′→C, hence must run from φ*E to E.
- The two lifts from zero recover kernel and middle term respectively.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration`
- `tauceti:TauCeti.ExactStructure.conflation_baseChange`
- `tauceti:TauCeti.ExactStructure.conflation_comp_of_isPullback`
- `StableHomotopyKTheory:H.4`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `ExtCat.baseChange` | data | The fibre functor φ* defined by pullback and composite kernel. |
| `ExtCat.cartesianArrow` | data | The canonical cartesian arrow φ*E→E over φ. |
| `ExtCat.baseChange_comp` | compatibility | Coherent natural isomorphism (ψφ)*≅φ*ψ*, with conventions fixed by domains. |
| `ExtCat.baseChange_zero_inflation` | simp | Base change along 0↣C extracts the kernel. |
| `ExtCat.baseChange_zero_deflation` | simp | Base change along 0↞C extracts the middle term. |

**Consumers.**

- The consuming nodes listed in this packet — For φ:C′→C represented by C′↞C″↣C and E=(A↣B↠C), form B′=B×_C C″ and let A′ be the kernel of the composite deflation B′↠C″↠C′. Then φ*E=(A′↣B′↠C′) and the induced Q-type diagram gives a cartesian arrow φ*E→E over φ. Pullback choices yield canonically isomorphic functors E_C→E_C′; identity and composition hold up to coherent natural isomorphism. The Core(A)-action commutes with these lifts, so localisation by it remains fibred with fibre Core(A)⁻¹E_C.

**Unit tests.**

- `cartesian_identity` (degenerate) — Lifting id_C gives a sequence canonically isomorphic to E.
- `cartesian_direction` (non-example) — An arrow E→φ*E would project from C to C′ and cannot lie over φ when C′ and C differ.
- `zero_lifts` (computation) — For a split extension A↣A⊕C↠C the two zero lifts yield A and A⊕C respectively.

**Sources.**

- `Weibel.KBook.IV`: Lemma 7.7, Exercise 7.2 and Exercise 7.5, pp. IV.63–65; text and p.63 image read 2026-10-01. The cartesian construction; the final proof sentence reverses the arrow and is corrected by source issue E-extension-base-change-direction.

### Contractibility of the localised extension-action category

`GeneralAlgebraicKTheory:K.2:plus/localised-extension-fibre-equivalence` · theorem · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For split exact A and S=Core(A), the map B(S⁻¹S)→B(S⁻¹E_C) induced by η_C is a homotopy equivalence. The action-category fibre L=⟨S,E_C⟩ is contractible: its monoidal product makes BL a connected H-space and the diagonal gives id≃[2]; the homotopy inverse cancels one summand to give id≃0.

**Hypotheses.**

- The generic action-localisation fibration S⁻¹S→S⁻¹E_C→⟨S,E_C⟩ is supplied by H.4 under its faithful-action and translation-injectivity conditions.
- Use CW realisation and the connected, homotopy associative H-space inverse supplied by H.4.

**Proof outline.**

1. Apply the product and connectedness node. The action-category product is induced by *; direct sums give the compatible action.
2. For E=(A↣B↠C), the maps A→A⊕A and B→B×_C B are diagonals. Their target is E*E, and the action-category morphism gives a natural transformation from identity to doubling.
3. Realise to obtain id_BL≃[2]. Compose with the H-space inverse in one summand: x*(inverse x) is null and (x*x)*(inverse x)≃x by associativity and the inverse laws, proving id_BL null-homotopic.
4. Use the generic localisation fibration and contractibility of its base to identify its fibre with its total space.

**Acceptance.**

- The diagonal contraction takes place in the action category, not in E_C itself.
- For a nonsplit A, connectedness fails and this argument is unavailable.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.2:plus/extension-fibre-product`
- `StableHomotopyKTheory:H.4`
- `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`

**Sources.**

- `Weibel.KBook.IV`: Proposition 7.6, p. IV.63; read in full 2026-10-01. The diagonal contraction and localisation fibration; the generic homotopy and action results have supplier requests.

### The localised extension category fibres over Q

`GeneralAlgebraicKTheory:K.2:plus/localised-extension-fibration` · theorem · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For split exact A and S=Core(A), B(S⁻¹S)→B(S⁻¹EA)→BQA is a homotopy fibration based at 0. Every base-change functor between localised fibres is a homotopy equivalence.

**Hypotheses.**

- The fibre-localisation and fibre-equivalence constructions above are used.
- Quillen Theorem B and Q-factorisation are imported.

**Proof outline.**

1. For 0↣C, compose η_C with base change. On S it extracts A, so after localisation it is identity. Fibre equivalence makes this base change an equivalence.
2. For 0↞C, the same composite is translation A↦A⊕C on S⁻¹S. Translation is invertible in the localised group-completion category, so this base change is an equivalence.
3. For any φ:C′→C, use φ∘(0↣C′)=(0↣C) or φ∘(0↞C′)=(0↞C) for the two distinguished classes; apply two-out-of-three to the coherent base-change composites. Factor a general Q-arrow into those two classes.
4. Apply Theorem B to the fibred localised functor and identify the fibre at zero with S⁻¹E_0≃S⁻¹S.

**Acceptance.**

- The middle fibre functor is localised: Theorem B is not applied directly to EA→QA.
- Naturality is up to the coherent isomorphisms of cartesian lifts.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.2:plus/extension-cartesian-lifts`
- `GeneralAlgebraicKTheory:K.2:plus/localised-extension-fibre-equivalence`
- `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`
- `StableHomotopyKTheory:H.2/quillen-theorem-b`
- `StableHomotopyKTheory:H.4`

**Sources.**

- `Weibel.KBook.IV`: Theorem 7.8 and proof, pp. IV.63–64; read in full 2026-10-01. The two zero lifts and the homotopy-fibration criterion.

### Contractibility of the extension category and its localisation

`GeneralAlgebraicKTheory:K.2:plus/extension-category-contractibility` · theorem · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For every exact A, BEA is contractible. For split exact A, B(S⁻¹EA) is also contractible; combined with the localised fibration it identifies B(S⁻¹S) with ΩBQA.

**Hypotheses.**

- Let iQA have the objects of A and only admissible inflations as arrows.
- Subdivision preserves realisation by H.1–H.2, and H.4 supplies invariance under localising an already invertible action.

**Proof outline.**

1. Send A↣B↠C to the arrow A↣B of iQA. Quotient objects are unique up to the kernel–cokernel isomorphism, and the diagram (7.3.1) is precisely a subdivision morphism with the source end reversed. This gives EA≃Sub(iQA).
2. The zero object is initial in iQA; apply H.1’s initial-object contraction and H.2’s subdivision equivalence to obtain BEA contractible.
3. On a contractible classifying space each translation of the S-action is a homotopy equivalence. H.4’s action-localisation theorem therefore makes EA→S⁻¹EA an equivalence on realisation.
4. Combine with the localised fibration and its canonical connecting map to get the plus-versus-Q comparison, naturally in split-exact functors.

**Acceptance.**

- No split-exactness assumption is used for contractibility of BEA.
- The equivalence with subdivision respects the unusual variance of EA morphisms.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.2:plus/extension-category-and-the-fibration`
- `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`
- `StableHomotopyKTheory:H.2`
- `StableHomotopyKTheory:H.4`

**Sources.**

- `Weibel.KBook.IV`: Proof of Theorem 7.1 and Exercise 7.3, pp. IV.64–65; read in full 2026-10-01. The subdivision equivalence and the contraction; exercise 7.3 is expanded here.

### Isomorphic exact functors induce homotopies on object S

`GeneralAlgebraicKTheory:K.4:construction/object-S-isomorphism-homotopy` · lemma · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

An isomorphism between exact functors of categories with cofibrations induces a simplicial homotopy on δ.C=Ob(S.C). Consequently δ.C→N(iS.C) is a realisation equivalence, natural in C.

**Hypotheses.**

- C is small with cofibrations; the functor isomorphism has invertible components.
- The object homotopy is stronger than merely a homotopy of category nerves.

**Proof outline.**

1. Write the isomorphism as F:C×[1]→C′. For α:[n]→[1], send an S_n-object A:Ar[n]→C through (A,Ar(α)), then through Ar[1]→[1], then F. The functor Ar[1]→[1] sends (0,0) to 0 and (0,1),(1,1) to 1.
2. Invertibility of F along [1] ensures the resulting square diagram still has its cofibrations and quotient squares. Compatibility with order maps gives a simplicial homotopy with the two required endpoints.
3. For each m, isomorphism strings C(m,i) are exactly equivalent to C by evaluation and the constant string. Their composites are naturally isomorphic to identity. The first part makes every face and degeneracy of δ.C(m,i) a homotopy equivalence.
4. Realise the bisimplicial object to identify δ.C with N(iS.C), using H.2’s levelwise-equivalence theorem.

**Acceptance.**

- At constant α=0 and α=1 the homotopy is δ.f and δ.f′.
- A noninvertible natural transformation is not substituted for the isomorphism hypothesis.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/S-construction`
- `StableHomotopyKTheory:H.2/bisimplicial-realization-lemma`

**Sources.**

- `Waldhausen.KSpaces`: Lemma 1.4.1 and its corollary, printed pp.335–336 (PDF18–19); read 2026-10-01. The explicit interval construction and its realisation consequence.

### The simplex fibres in Waldhausen additivity

`GeneralAlgebraicKTheory:K.4:construction/additivity-simplex-fibre` · construction · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

Let f:δ.E(C)→δ.C send a cofibration sequence to its subobject. For y∈δ_nC define F_y=Δ[n]×_{δ.C}δ.E(C). An m-simplex is (u:[m]→[n], A↣D↠B) in E(S_mC) with A=u*y. Quotient projection p_y:F_y→δ.C has a section q_y given by the last vertex n and the sequence 0↣B=B; p_yq_y=id. The next node contracts q_yp_y to identity.

**Hypotheses.**

- E(C) has the induced cofibration structure of S₂C; fibre diagrams are literal simplicial pullbacks.
- Every vertex restriction of an S_n-object is the zero S_0-object, so q_y is defined.

**Proof outline.**

1. Identify Ob S_m E(C) with Ob E(S_m C) via the exchange of the two arrow-index categories and the latching pushout condition.
2. Define F_y and p_y by projection to the quotient filtration B; check faces and degeneracies using the fixed quotient diagrams.
3. At the constant order map to n the subfiltration is zero. Send B to the sequence 0↣B=B over that map, defining q_y. Its quotient is B, giving p_yq_y=id.
4. At n=0 the fibre consists of sequences 0↣B′↠B with B′→B an isomorphism. The previous exact-equivalence homotopy identifies it with δ.C.

**Acceptance.**

- For n=0, F_y≃δ.C; it is not assumed contractible.
- p_yq_y=id on quotient filtrations, including their chosen quotient squares.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/S-construction`
- `GeneralAlgebraicKTheory:K.4:construction/object-S-isomorphism-homotopy`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `AdditivityFibre` | data | The simplicial pullback over y of the subobject projection. |
| `AdditivityFibre.quotient` | projection | Its map p_y to the quotient filtration. |
| `AdditivityFibre.lastVertexSection` | constructor | The section q_y at the last vertex with zero subobject. |
| `AdditivityFibre.quotient_section` | simp | p_y∘q_y=id. |

**Consumers.**

- The consuming nodes listed in this packet — Let f:δ.E(C)→δ.C send a cofibration sequence to its subobject. For y∈δ_nC define F_y=Δ[n]×_{δ.C}δ.E(C). An m-simplex is (u:[m]→[n], A↣D↠B) in E(S_mC) with A=u*y. Quotient projection p_y:F_y→δ.C has a section q_y given by the last vertex n and the sequence 0↣B=B; p_yq_y=id. The next node contracts q_yp_y to identity.

**Unit tests.**

- `additivity_fibre_zero` (degenerate) — For n=0 all subobjects are zero and the fibre is equivalent to δ.C.
- `additivity_quotient_section` (computation) — The quotient of (0↣B=B) is B.
- `additivity_fibre_not_point` (non-example) — With nontrivial K₀(C), δ.C and these fibres need not be contractible.

**Sources.**

- `Waldhausen.KSpaces`: Proof of Lemma 1.4.3, printed pp.337–338 (PDF20–21); page images read 2026-10-01. The explicit simplicial fibre, quotient projection and split section.

### The pushout contraction of an additivity fibre

`GeneralAlgebraicKTheory:K.4:construction/additivity-pushout-homotopy` · lemma · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

For each y, the maps id_Fy and q_yp_y are simplicially homotopic. For (u,E) and v:[m]→[1], put ū(j)=u(j) if v(j)=0 and ū(j)=n if v(j)=1. The natural map u*y→ū*y induces E→Ē by cobase change in S_mC. This homotopy fixes q_y and keeps the quotient filtration B unchanged, making p_y and q_y homotopy inverses.

**Hypotheses.**

- Choose pushouts in C once, including identity and zero cases, rather than independently in each S_mC.
- The map u*y→ū*y is uniquely determined by the order-category morphism u≤ū.

**Proof outline.**

1. The coordinate formula ū is monotone, commutes with precomposition in Δ/[1], starts at u and ends at the constant n. The induced map of arrow categories gives A=u*y→Ā=ū*y.
2. Push out A↣D along A→Ā in S_mC, obtaining Ā↣D̄↠B̄. The pointwise pushouts in C give S_mC’s required pushouts and preserve the quotient filtration: B̄ canonically identifies with B.
3. Choose identity pushouts literally when A→Ā is identity, and the quotient pushout when Ā=0. This makes the v=0 endpoint identity and the v=1 endpoint q_yp_y. It also fixes the image of q_y.
4. Uniqueness of the arrow-category morphism ensures the first step commutes with every order map. Fixed pointwise pushout choices commute with deletion and repetition of coordinates; hence the second step does too. These verify the full simplicial homotopy identities, not only endpoint maps.

**Acceptance.**

- The two endpoints and the fixed-section condition hold as simplicial maps.
- Independent pushout choices in each degree do not suffice: compatibility under face and degeneracy maps is required.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/additivity-simplex-fibre`
- `GeneralAlgebraicKTheory:K.4:construction/S-construction`

**Sources.**

- `Waldhausen.KSpaces`: Proof of the sublemma to Lemma 1.4.3, printed pp.339–340 (PDF22–23); page images read 2026-10-01. The last-vertex contraction lifted by pointwise pushout, including choices and simplicial compatibility.

### Additivity for object simplicial S-constructions

`GeneralAlgebraicKTheory:K.4:construction/object-S-additivity` · theorem · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

For any small category with cofibrations, (sub,quotient):δ.E(C)→δ.C×δ.C is a realisation homotopy equivalence.

**Hypotheses.**

- No weak-equivalence, cylinder, saturation or extension axiom is used.
- H.2 supplies the simplicial form of Quillen Theorem B via the category of simplices.

**Proof outline.**

1. Each vertex restriction F_0→F_y is an equivalence: quotient projections p_0 and p_y are homotopy equivalences by the pushout contraction and commute with that restriction.
2. Any order map [m]→[n] sits in a triangle with a map [0]→[m]. Two-out-of-three therefore proves every change-of-simplex map F_{u*y}→F_y is an equivalence.
3. Apply the simplicial Theorem B criterion. It follows from categorical Theorem B on the category of simplices, identifying its comma fibres with the simplex categories of F_y, together with the subdivision-realisation equivalence from H.2.
4. At the unique zero simplex, the homotopy fibre is δ.C, via B↦(0↣B=B). Compare this fibration to the product fibration with the split section (A,B)↦(A↣A∨B↠B). It is identity on base and fibre, hence an equivalence of total spaces.
5. The split map is a section of (sub,quotient). Since it is an equivalence, its retraction is the desired equivalence.

**Acceptance.**

- The comparison is identity on fibre and base, rather than an unsupported appeal to a split section alone.
- The statement applies even when C has no specified weak equivalences.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/additivity-pushout-homotopy`
- `GeneralAlgebraicKTheory:K.4:construction/object-S-isomorphism-homotopy`
- `StableHomotopyKTheory:H.2/quillen-theorem-b`
- `StableHomotopyKTheory:H.2`

**Sources.**

- `Waldhausen.KSpaces`: Lemma 1.4.3 and Lemmas 1.4.A–B, printed pp.336–338 (PDF19–21); text and images read 2026-10-01. The simplex-fibre criterion and comparison to the product fibration.

### Trivial cofibrations compute the weak-equivalence nerve

`GeneralAlgebraicKTheory:K.4/trivial-cofibration-nerve` · lemma · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

In a saturated Waldhausen category with a cylinder satisfying the cylinder axiom, the inclusion co_w C→wC of weak-equivalence cofibrations is a realisation equivalence.

**Hypotheses.**

- Both categories have every object of C; their morphisms differ.
- Cylinder cofibration and naturality axioms are required, not just an arbitrary functorial factorisation.

**Proof outline.**

1. In the comma category over B, an object is a weak equivalence f:A→B. Its mapping cylinder T(f) has projection p:T(f)→B a weak equivalence and front/back inclusions j₁:A→T(f), j₂:B→T(f) cofibrations.
2. Since p∘j₁=f and p∘j₂=id, saturation makes both inclusions weak equivalences. Mapping-cylinder naturality for a cofibration A→A′ gives a weak-equivalence cofibration T(f)→T(f′), using the cylinder cofibration axiom and saturation.
3. These data define a functor T on the comma category, with natural transformations id→T←constant(B,id). Its nerve is therefore contractible.
4. Apply H.2’s Theorem A to the inclusion. The same construction applies to C(m,v) and S_nC, with pointwise cylinders.

**Acceptance.**

- Both comma natural transformations consist of trivial cofibrations.
- No cylinder-free factorisation hypothesis is substituted.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`
- `StableHomotopyKTheory:H.2/quillen-theorem-a`
- `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`

**Sources.**

- `Weibel.KBook.IV`: Exercise 8.15, p.IV.75; read 2026-10-02; Waldhausen Lemma1.6.3 proof is the same cylinder contraction. The exercise’s comma-cylinder argument expanded with front and back inclusions.

### Relative S identifies the change-of-equivalences bicategory

`GeneralAlgebraicKTheory:K.4/localization-relative-S-comparison` · comparison · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

For v⊂w on the same cofibration category C satisfying the fibration theorem hypotheses, let f:(C^w,v)→(C,v). Forgetting chosen quotients gives equivalences S_nf ≃ co_w,n C and vS_m(S_nf) ≃ v·co_w,n(S_mC), natural in m,n. Thus |vS.(S.f)| ≃ |v·co_w.S.C| compatibly with |vS.C|.

**Hypotheses.**

- C^w consists of objects with 0→C in w.
- The extension axiom and saturation identify w-cofibrations with cofibrations whose quotient lies in C^w.

**Proof outline.**

1. For a cofibration A↣B with quotient Q, compare its sequence to A=A→0. If Q is w-trivial, extension gives A→B in w. Conversely, compare to 0→Q=Q using the w-equivalence A→B and saturation to obtain Q w-trivial.
2. An object of S_nf is a filtration C₀↣⋯↣C_n with all consecutive quotients w-trivial, together with choices of those quotients and their S-diagrams. Forget them to a chain of w-cofibrations.
3. The fibre over each such chain is the groupoid of choices of cokernels and quotient squares. Any two choices have a unique compatible isomorphism fixing the chain, so forgetting is fully faithful and essentially surjective.
4. Exchange S_m with the chain direction and apply the same argument objectwise. The universal property of quotients makes the comparisons natural in both simplicial directions and compatible with the map from vS.C.
5. Realise the resulting bisimplicial equivalences using H.2.

**Acceptance.**

- S₀f retains the object C₀ of C; it is not set to the zero category.
- The comparison commutes with the relative-sequence maps, so an abstract equivalence of spaces alone is insufficient.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/S-construction`
- `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`
- `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`
- `StableHomotopyKTheory:H.2/bisimplicial-realization-lemma`

**Sources.**

- `Weibel.KBook.V`: Proof of Theorem2.1, pp.V.12–13; read in full 2026-10-02. The relative-S comparison and its naturality, used after the cylinder nerve reduction.

### Approximation lifts filtered objects

`GeneralAlgebraicKTheory:K.4/approximation-lifts-S-filtrations` · lemma · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

If F:A→B has Waldhausen’s approximation property, so does S_nF:S_nA→S_nB for every n.

**Hypotheses.**

- F reflects weak equivalences and every F(A)→B factors as F of a cofibration followed by a weak equivalence.
- S_n weak equivalences are objectwise; gluing extends the comparison to quotient diagrams.

**Proof outline.**

1. Induct on the filtration length. Having lifted A′_{0,n−1} and its map to B_{0,n−1}, form A_{0,n} ∪_{A_{0,n−1}} A′_{0,n−1}.
2. The given filtration map induces F of this pushout → B_{0,n}. Apply approximation to obtain a cofibration to A′_{0,n} and a weak equivalence F(A′_{0,n})→B_{0,n}.
3. The composite A′_{0,n−1}↣pushout↣A′_{0,n} defines the next filtration cofibration. Choose quotient objects; the gluing axiom identifies their images up to weak equivalence with the target quotient objects.
4. Objectwise reflection of weak equivalences gives App1 for S_nF. The induction supplies App2, including the latching pushout condition.

**Acceptance.**

- For n=1 the assertion is the original approximation property.
- The construction lifts quotients and the latching cofibration, not only individual filtration objects.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/S-construction`
- `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`

**Sources.**

- `Waldhausen.KSpaces`: Lemma1.6.6, printed p.353 (PDF36); read 2026-10-02. The filtration-length induction with its pushout.

### Iterated mapping cylinders of a simplex diagram

`GeneralAlgebraicKTheory:K.4/iterated-mapping-cylinder` · construction · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

For A₀→⋯→A_n define T(A₀)=A₀ and T(A₀→⋯→A_n)=T(T(A₀→⋯→A_{n−1})→A_n). It has a natural projection to A_n and compatible maps from every face cylinder. These give a functor from the nondegenerate face poset of Δ[n] to A. On a weak-equivalence string the projection and every face map are weak equivalences.

**Hypotheses.**

- A has the Waldhausen cylinder with its exactness/cofibration axiom and cylinder weak-equivalence axiom.
- The two-variable cylinder is applied to the composite of the earlier projection and the last string map.

**Proof outline.**

1. Define the object and projection recursively. The last-face map is the front cylinder inclusion; for n=1 the first-face map is the back inclusion.
2. For i<n and n>1 define the face map by applying the cylinder functor to the already constructed face-cylinder map over id_A_n. Naturality of the front inclusion and the induction prove all ∂_i∂_j=∂_{j−1}∂_i identities.
3. Projections commute with face maps. The cylinder axiom makes each projection weak; on a weak-equivalence string, saturation then makes every face map weak.
4. For a finite nonsingular simplicial set X and q:X→N(wF/B), apply the construction to each nondegenerate simplex’s string. Nonsingularity makes its face category a poset, so the face identities glue to a functor T_q:simp^nd(X)→wF/B, with projection natural transformation T_q→q_*.

**Acceptance.**

- For a one-arrow string the construction is the original mapping cylinder with its two inclusions.
- Two ways of passing to a codimension-two face give the same cylinder map.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`
- `StableHomotopyKTheory:H.2`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `IteratedCylinder` | data | The recursive cylinder object of a composable string. |
| `IteratedCylinder.projection` | projection | The natural weak-equivalence projection to the final vertex. |
| `IteratedCylinder.face` | functoriality | Compatible cylinder maps for nondegenerate faces. |
| `IteratedCylinder.face_comp` | compatibility | The face identities and their naturality. |
| `Approximation.cylinderDiagram` | data | The functor T_q to wF/B and its projection to q_*. |

**Consumers.**

- The consuming nodes listed in this packet — For A₀→⋯→A_n define T(A₀)=A₀ and T(A₀→⋯→A_n)=T(T(A₀→⋯→A_{n−1})→A_n). It has a natural projection to A_n and compatible maps from every face cylinder. These give a functor from the nondegenerate face poset of Δ[n] to A. On a weak-equivalence string the projection and every face map are weak equivalences.

**Unit tests.**

- `iterated_cylinder_vertex` (degenerate) — At a vertex the cylinder is the object itself.
- `iterated_cylinder_edge` (computation) — At an edge it is T(A₀→A₁), with front and back inclusions.
- `iterated_cylinder_faces` (computation) — The two codimension-two face maps agree.
- `iterated_cylinder_weak` (computation) — For a weak-equivalence string all face maps and projections are weak equivalences.

**Sources.**

- `Waldhausen.KSpaces`: Proof of Theorem1.6.7, printed pp.356–357 (PDF39–40); images read 2026-10-02. The recursive cylinder, face maps and natural transformation.

### The cylinder boundary is a cofibration

`GeneralAlgebraicKTheory:K.4/approximation-cylinder-boundary` · lemma · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

The cylinder diagram T_q on a finite nonsingular X extends in F/B to its poset of simplicial subsets, taking inclusions to cofibrations and unions to pushouts. The critical boundary map t(∂x)→t(x) is a cofibration for every nondegenerate simplex x.

**Hypotheses.**

- Use the preceding iterated cylinder and the exactness/cofibration axiom Cyl1.
- The extension is in F/B, not necessarily wF/B, because a union colimit need not map weakly to B.

**Proof outline.**

1. Induct on skeleton dimension, setting t of a union to the pushout of the two pieces over their intersection. For a simplex x, T_q already supplies t(x); the only obstruction is its boundary latching map.
2. Let Λ^n_n x be the union of all proper faces except the last. The cylinder recursion and pushout preservation identify t(Λ^n_n x) with T(t(∂d_nx)→A_n). Its attachment to d_nx identifies t(∂x)→t(x) with t(d_nx) ∪_{t(∂d_nx)} T(t(∂d_nx)→A_n) → T(t(d_nx)→A_n).
3. The arrow-category map (t(∂d_nx)→A_n)→(t(d_nx)→A_n) is a cofibration by the induction and identity on A_n. The cylinder axiom says its front-inclusion arrow map is a cofibration in the arrow category; its latching condition is exactly the displayed boundary map.
4. Thus all attachments exist. Fixed pushouts and their universal properties give the union law and compatibility with inclusions; the object maps to B are induced from the original simplex maps.

**Acceptance.**

- The last-face attachment is checked explicitly, rather than assuming all finite colimits exist in A.
- The extension is asserted in the larger comma category F/B.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4/iterated-mapping-cylinder`
- `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`

**Sources.**

- `Waldhausen.KSpaces`: Proof of the sublemma to Theorem1.6.7, printed pp.357–358 (PDF40–41); images read 2026-10-02. The horn decomposition, union pushout and cylinder latching calculation.

### Approximation comma categories are contractible

`GeneralAlgebraicKTheory:K.4/approximation-comma-contractibility` · lemma · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

For F satisfying approximation between saturated Waldhausen categories, with a cylinder on A satisfying its axiom, every comma category wF/B has contractible classifying space.

**Hypotheses.**

- H.2 supplies the last-vertex equivalence from the simplex-category nerve, its nonsingular face-poset variant, simplicial approximation of maps from finite subdivided spheres, and the CW Whitehead theorem.
- The iterated-cylinder diagram and boundary construction are specific to F; the topological detection lemmas belong to H.2.

**Proof outline.**

1. App2 applied to 0→B makes wF/B nonempty. Coproducts in F/B and App2 give a common target for any two objects; saturation and reflection show the arrows to it belong to wF/B, proving connectedness.
2. More generally, if a diagram in wF/B has a cone in F/B with vertex (A′,F(A′)→B), apply App2 to that vertex to get (A″,F(A″)≃B). Saturation in B and reflection by F make all cone arrows weak equivalences. The cone therefore exists in wF/B.
3. For q:X→N(wF/B), X finite and nonsingular, replace its face-poset diagram by T_q using the projection natural transformation. The boundary construction extends T_q to simplicial subsets of X; since X is terminal in that poset, it gives a cone in F/B.
4. Use the previous cone-improvement step to contract T_q in wF/B. The natural transformation contracts q_*, and the last-vertex equivalences transfer the contraction to q.
5. Represent every homotopy class by a map from a finite subdivided sphere using H.2. All such maps contract; the connected CW classifying space is weakly contractible, hence contractible by Whitehead.

**Acceptance.**

- Connectedness alone is not used to conclude contractibility.
- The contraction covers every finite subdivided sphere, giving vanishing in all degrees.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4/iterated-mapping-cylinder`
- `GeneralAlgebraicKTheory:K.4/approximation-cylinder-boundary`
- `StableHomotopyKTheory:H.2`
- `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`

**Sources.**

- `Waldhausen.KSpaces`: Theorem1.6.7, printed pp.354–359 (PDF37–42); text and images read 2026-10-02. The cone-improvement observation, finite nonsingular detection and last-vertex conclusion.

### Edgewise S-diagrams and composable Q-spans

`GeneralAlgebraicKTheory:K.4:construction/edgewise-S-Q-diagrams` · construction · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

For an exact A, the functor iS_{2n+1}A→iQ_nA sends a filtration indexed by n′<⋯<0′<0<⋯<n to the Q-chain with vertices A(j′,j), and arrows A(j′,j)↞A((j+1)′,j)↣A((j+1)′,j+1). It is an equivalence in every degree and these functors commute with the edgewise simplicial operators.

**Hypotheses.**

- iQ_nA is the groupoid of length-n composable Q-arrows and their componentwise isomorphisms.
- Q-arrows are isomorphism classes of admissible spans; quotient choices are retained in S and forgotten only modulo those isomorphisms.

**Proof outline.**

1. Read off the diagonal and near-diagonal subquotients to form the spans. Quotient exactness gives deflation and inflation legs. The intermediate squares are pullbacks, so removing a diagonal vertex gives exactly composition in Q. This proves compatibility with every face; duplication gives the degeneracies.
2. Reconstruct a flag inductively from a Q-chain. At the last span X↞U↣Y, pull back the previously reconstructed flag in X along U↠X, prepend its kernel and append Y. Base n=0 is the single object. Exact base change gives a flag of length 2n+1.
3. Choose its quotient objects. The reconstructed diagonal spans recover the given Q-chain. Changing span representatives or pullbacks gives the unique compatible isomorphism fixing the diagonal objects.
4. A componentwise isomorphism of Q-chains uniquely extends to all intermediate pullbacks, kernels and quotients. Conversely a flag isomorphism restricts to that chain isomorphism. This gives full faithfulness as well as essential surjectivity.
5. The forward functor is independent of reconstruction choices and strictly respects operators because equal composite spans are equal in Q’s isomorphism-class hom sets.

**Acceptance.**

- At n=0 the functor is identity on Core(A).
- At n=1 a span X↞U↣Y recovers the flag ker(U→X)↣U↣Y.
- The comparison does not require additivity, delooping or a spectrum.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/S-construction`
- `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`
- `tauceti:TauCeti.ExactStructure.conflation_baseChange`
- `StableHomotopyKTheory:H.2`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `SConstruction.edgewiseQ` | data | The simplicial functor given by diagonal subquotients and the displayed spans. |
| `SConstruction.edgewiseQ_degreeEquiv` | characterisation | The degree-n equivalence iS_{2n+1}A≌iQ_nA. |
| `SConstruction.edgewiseQ_faces` | compatibility | Face operators agree with span composition by the intermediate pullback square. |
| `SConstruction.edgewiseQ_degeneracies` | compatibility | Duplicating an index inserts an identity Q-arrow. |

**Consumers.**

- The consuming nodes listed in this packet — For an exact A, the functor iS_{2n+1}A→iQ_nA sends a filtration indexed by n′<⋯<0′<0<⋯<n to the Q-chain with vertices A(j′,j), and arrows A(j′,j)↞A((j+1)′,j)↣A((j+1)′,j+1). It is an equivalence in every degree and these functors commute with the edgewise simplicial operators.

**Unit tests.**

- `edgewise_Q_zero` (degenerate) — At n=0 this is identity on objects and isomorphisms.
- `edgewise_Q_span` (computation) — At n=1 the inverse flag is ker(U→X)↣U↣Y.
- `edgewise_Q_composition` (computation) — Deleting a diagonal index composes the adjacent Q-spans by pullback.

**Sources.**

- `Waldhausen.KSpaces`: §1.9, printed pp.375–376 (PDF57–58); page images read 2026-10-02. The triangular subquotient diagram, degreewise equivalence and edgewise simplicial map.

### Isomorphic quotient objects compute localization comma categories

`GeneralAlgebraicKTheory:K.3/localization-isomorphic-comma-subcategory` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For B Serre in a small abelian A and L∈A/B, let F_L⊂L\Qloc contain (A,u) with u:L≅loc(A). Then BF_L≃B(L\Qloc). In particular F_0≃QB.

**Hypotheses.**

- Use the pinned Serre quotient infrastructure and its calculus-of-fractions supplier from H.1–H.2.
- The exact structure is the full abelian one.

**Proof outline.**

1. An object of the comma fibre of F_L→L\Qloc can be represented by a layer A₁⊂A₂⊂A whose quotient in A/B is the prescribed object L with its prescribed structure map. Modulo the unique representative isomorphisms this fibre is the poset of such layers.
2. The quotient construction lifts the relevant subobject, giving nonemptiness. Two layers have a common refinement using intersection on the lower terms and sum on the upper terms; kernels and cokernels of changes vanish in A/B because B is Serre. Retain the quotient identification with L.
3. Thus each fibre poset is directed and its nerve contractible. Apply Theorem A. At L=0, loc(A)=0 exactly when A∈B, so F_0 is QB with the same Q-spans.

**Acceptance.**

- For L=0 the inclusion QB→0\Qloc is the specific fibre equivalence.
- The full quotient identification is retained in each layer; a bare poset of arbitrary subobjects is insufficient.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`
- `GeneralAlgebraicKTheory:K.1/Q-construction-universal-property`
- `StableHomotopyKTheory:H.2/quillen-theorem-a`
- `StableHomotopyKTheory:H.1/filtered-colimits-of-categories`
- `mathlib:CategoryTheory.ObjectProperty.IsSerreClass`

**Sources.**

- `Weibel.KBook.V`: Claims5.1.2–5.1.3, p.V.36; read in full 2026-10-02. The directed layer-poset fibres, including F_0≃QB.
- `Quillen.Higher1973`: Section5 Theorem5 and Lemmas1–5, PDF29–32/publication pp113–116, full proof read. Checked the layers/intersection directed poset, epimorphic kernel pushout, filtered image models, postcomposition natural transformation and final zero-inflation square against these decomposed nodes.

### Models of a quotient object with kernel functor

`GeneralAlgebraicKTheory:K.3/localization-model-category` · construction · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For N∈A define E_N with objects h:A→N invertible modulo B and Q-span morphisms making the two maps to N agree. The kernel of h belongs to B and defines k_N:E_N→QB. Its full subcategory E′_N consists of epimorphic h. Postcomposition by a map g:N→N′ invertible modulo B defines g_*:E_N→E_N′.

**Hypotheses.**

- A is abelian and B Serre; kernel and cokernel of h lie in B.
- Kernel maps of Q-spans are formed with the abelian exact structure.

**Proof outline.**

1. Restrict each admissible span over N to its kernels. Pullback and kernel universal properties give an admissible span in B, with independence and composition inherited from Q.
2. Postcompose object maps and preserve the same span; invertibility modulo B is stable under composition. For g, ker(h)⊂ker(gh) gives a natural Q-inflation k_N→k_N′g_*.
3. Identity and composition of postcomposition are literal functor laws. Define E′_N as the epimorphic-object full subcategory.

**Acceptance.**

- For h=id_N the kernel is zero.
- For g=id_N the postcomposition functor is identity.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`
- `GeneralAlgebraicKTheory:K.1/Q-construction-universal-property`
- `mathlib:CategoryTheory.ObjectProperty.IsSerreClass`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `LocalizationModel` | data | The category E_N of quotient-isomorphism lifts h:A→N and Q-spans over N. |
| `LocalizationModel.kernel` | projection | The kernel functor k_N to QB. |
| `LocalizationModel.epimorphic` | data | The full subcategory E′_N. |
| `LocalizationModel.postcompose` | functoriality | The functor g_* for g invertible modulo B. |
| `LocalizationModel.postcompose_id` | simp | Postcomposition by identity is identity. |
| `LocalizationModel.postcompose_comp` | compatibility | Postcomposition by g′g is the composite. |
| `LocalizationModel.kernel_postcompose` | compatibility | Natural inflation ker(h)→ker(gh). |

**Consumers.**

- The consuming nodes listed in this packet — For N∈A define E_N with objects h:A→N invertible modulo B and Q-span morphisms making the two maps to N agree. The kernel of h belongs to B and defines k_N:E_N→QB. Its full subcategory E′_N consists of epimorphic h. Postcomposition by a map g:N→N′ invertible modulo B defines g_*:E_N→E_N′.

**Unit tests.**

- `localization_identity_model` (degenerate) — The kernel of (N,id_N) is zero.
- `localization_model_epic` (computation) — If h is onto, its kernel gives the exact sequence 0→ker(h)→A→N→0.
- `localization_model_postcomposition` (computation) — The displayed kernel inclusion lies in B and is natural in Q-spans.

**Sources.**

- `Weibel.KBook.V`: Definitions before Claim5.1.4 and Claim5.1.6, pp.V.36–37; read in full 2026-10-02. The model category, epimorphic part, kernel functor and postcomposition.
- `Quillen.Higher1973`: Section5 Theorem5 and Lemmas1–5, PDF29–32/publication pp113–116, full proof read. Checked the layers/intersection directed poset, epimorphic kernel pushout, filtered image models, postcomposition natural transformation and final zero-inflation square against these decomposed nodes.

### The kernel functor on epimorphic models is an equivalence on realisation

`GeneralAlgebraicKTheory:K.3/localization-epimorphic-kernel-equivalence` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

The kernel functor k′:E′_N→QB induces a homotopy equivalence.

**Hypotheses.**

- Use Q-morphism factorisation in both orders in an abelian category and pushouts of kernels.

**Proof outline.**

1. For T∈QB, consider k′/T. Its full subcategory of objects with structure Q-arrow a distinguished reversed deflation is contractible, with initial object (N,id_N,0↞T).
2. Write a general structure Q-arrow ker(h)→T in the alternate form ker(h)↣T₀↞T, obtained by pushing out its usual span. Push out ker(h)↣A along ker(h)↣T₀ to obtain A₀→N with kernel T₀. The resulting object has the distinguished reversed-deflation structure arrow T₀↞T.
3. The pushout universal property gives a left adjoint from k′/T to that subcategory. Its unit and counit give a realisation equivalence. Hence k′/T is contractible and Theorem A applies.

**Acceptance.**

- The subcategory’s initial object is (N,id_N,0↞T), with the correct Q-direction.
- The new model remains epic onto N and has kernel T₀.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.3/localization-model-category`
- `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`
- `StableHomotopyKTheory:H.2/quillen-theorem-a`
- `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`

**Sources.**

- `Weibel.KBook.V`: Claim5.1.4, p.V.36; read in full 2026-10-02. The distinguished-deflation subcategory, pushout adjoint and Theorem A.
- `Quillen.Higher1973`: Section5 Theorem5 and Lemmas1–5, PDF29–32/publication pp113–116, full proof read. Checked the layers/intersection directed poset, epimorphic kernel pushout, filtered image models, postcomposition natural transformation and final zero-inflation square against these decomposed nodes.

### Epimorphic models compute all localization models

`GeneralAlgebraicKTheory:K.3/localization-epimorphic-models` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

The inclusion E′_N→E_N is a realisation equivalence, and k_N:E_N→QB is one. If g:N→N′ is invertible modulo B, then g_* is a realisation equivalence.

**Hypotheses.**

- Let I_N be the poset of subobjects N_i⊂N with N/N_i∈B. It has terminal object N.

**Proof outline.**

1. The image functor E_N→I_N is fibred. Its fibre at N_i is E′_{N_i}; base change for N_j⊂N_i takes h to h⁻¹(N_j)→N_j and preserves its kernel.
2. The epimorphic-kernel equivalence therefore makes every base change an equivalence. Theorem B identifies a fibre over N with E_N because BI_N is contractible. This proves E′_N≃E_N and the kernel equivalence.
3. For g use the natural inflation k_N→k_N′g_* from the model construction. Its realised homotopy and the two kernel equivalences give g_* an equivalence by two-out-of-three.

**Acceptance.**

- The fibre at terminal subobject N is precisely the epic-model category.
- The postcomposition result uses kernel naturality, not arbitrary inversion of g in A.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.3/localization-model-category`
- `GeneralAlgebraicKTheory:K.3/localization-epimorphic-kernel-equivalence`
- `StableHomotopyKTheory:H.2/quillen-theorem-b`
- `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`

**Sources.**

- `Weibel.KBook.V`: Claims5.1.5–5.1.6, pp.V.36–37; read in full 2026-10-02. The image-poset fibration and natural kernel comparison.
- `Quillen.Higher1973`: Section5 Theorem5 and Lemmas1–5, PDF29–32/publication pp113–116, full proof read. Checked the layers/intersection directed poset, epimorphic kernel pushout, filtered image models, postcomposition natural transformation and final zero-inflation square against these decomposed nodes.

### Filtered models compute the quotient-isomorphism fibre

`GeneralAlgebraicKTheory:K.3/localization-filtered-models` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For L∈A/B let I_L contain lifts (N,loc(N)≅L), with maps over L. It is filtered; F_L is the filtered colimit of E_N. Each E_N→F_L is a realisation equivalence, and the base-change map L\Qloc→0\Qloc for 0↣L is a realisation equivalence.

**Hypotheses.**

- Use the quotient calculus of fractions to refine finitely many representatives and equalities.
- Use H.1’s compatibility of nerves/classifying spaces and homotopy groups with filtered colimits.

**Proof outline.**

1. The quotient fraction representation gives a common model for two lifts and a refinement equalising any two maps; hence I_L is filtered. Send h:A→N to the inverse of loc(h) followed by the chosen loc(N)≅L, giving the object of F_L.
2. Every object and morphism of F_L is represented after such a refinement, and any equality of representatives holds after a further refinement. This proves the colimit identification on objects and Q-hom sets.
3. All transition maps g_* are realisation equivalences by the preceding node. Filtered-colimit compatibility therefore makes every E_N→F_L a realisation equivalence.
4. The composite E_N→F_L→L\Qloc→0\Qloc sends h to (A,0↣loc(A)); the kernel functor followed by QB→0\Qloc sends it to (ker(h),0). The kernel inflation gives a natural transformation between these composites.
5. The kernel route and the F_L inclusion route are equivalences. Two-out-of-three proves the zero-inflation base-change equivalence. Opposite-category symmetry supplies the zero-deflation case; factorisation and two-out-of-three supply every Q-arrow.

**Acceptance.**

- For L=0 the comparison recovers QB.
- The quotient-object lift and its isomorphism are part of I_L; arbitrary objects N are not the indexing category.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.3/localization-isomorphic-comma-subcategory`
- `GeneralAlgebraicKTheory:K.3/localization-epimorphic-models`
- `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`
- `StableHomotopyKTheory:H.1/filtered-colimits-of-categories`
- `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`

**Sources.**

- `Weibel.KBook.V`: Claim5.1.7 and conclusion of Theorem5.1, p.V.37; read in full 2026-10-02. The filtered model colimit and kernel-inflation homotopy.
- `Quillen.Higher1973`: Section5 Theorem5 and Lemmas1–5, PDF29–32/publication pp113–116, full proof read. Checked the layers/intersection directed poset, epimorphic kernel pushout, filtered image models, postcomposition natural transformation and final zero-inflation square against these decomposed nodes.

### Non-functorial Waldhausen factorizations

`GeneralAlgebraicKTheory:K.4:construction/waldhausen-factorization` · definition · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

A Waldhausen category has factorization if every morphism f:A→B is a composite A↣Z→B of a cofibration and a weak equivalence. This is an existence property; no functorial assignment of Z is part of it.

**Hypotheses.**

- C is a small Waldhausen category. This property is independent of specifying a cylinder functor.

**Proof outline.**

1. Define the explicit quantified factorization property on the existing Waldhausen structure.
2. A cylinder functor satisfying the cylinder axiom gives this property by its factorization of any f.
3. The Frobenius-pair verification is owned by the consumer K.6/frobenius-pair-factorization, which imports this existence property. It is not an input from K.6 to early K.4.

**Acceptance.**

- The condition records existential cofibration–weak-equivalence factorizations, without constructing a cylinder or importing the later Frobenius-pair theory.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `Waldhausen.HasFactorization` | characterisation | Every map admits the specified cofibration–weak-equivalence composite. |
| `Waldhausen.HasFactorization.factor` | constructor | For a given map, obtain an existential intermediate object and the two arrows. |
| `Waldhausen.HasFactorization.ofCylinder` | compatibility | A cylinder satisfying its axiom supplies this existence property. |

**Consumers.**

- K.6 Frobenius-pair K-theory; Schlichting11.2,11.15–11.18 — Supplies approximation and fibration without choosing a functorial cylinder.

**Unit tests.**

- `factor_cofibration` (degenerate) — For a cofibration f, factor it as f followed by identity.
- `factor_identity` (compatibility) — The identity map factors through its own source, with both arrows identity.
- `factor_not_automatic` (non-example) — Finite pointed sets with monomorphism cofibrations and isomorphism weak equivalences fail the property: the collapse from a two-element pointed set to a point cannot be a monomorphism followed by an isomorphism.

**Sources.**

- `Schlichting.NegativeK.2003`: AppendixA.1 and A.5 p.24–25; Remark11.2 p.20. Read AppendixA in full, pp.24–27. The packet owns the general non-functorial factorization apparatus in early K.4; K.6 imports it. Generic finite-poset nerve and realization facts remain precise H.1/H.2 requests.

### Cofibrant diagrams on a finite poset

`GeneralAlgebraicKTheory:K.4:construction/cofibrant-poset-diagrams` · construction · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

For a finite poset P, define the cofibrations in C^P by the latching condition: X→Y is cofibrant at p if the colimit over ({0}×{p})∪([1]×P_{<p}) exists and its map to Y(p) is a cofibration. Weak equivalences are pointwise. Cofibrant diagrams have colimits, assembled by finitely many pushouts along cofibrations.

**Hypotheses.**

- C has cofibrations and a zero object; P is finite. Predecessor-closed subposets, not arbitrary subposets, are used in the induction.

**Proof outline.**

1. For predecessor-closed S′⊂S⊂P_{<p}, induct on |S| to construct the relative colimit I(S,p). Remove a maximal q outside S′; glue Y(q) to the smaller colimit along its latching object. The map from I(S′,p) remains a cofibration under this pushout and composition. This is A.7.
2. Add a new terminal element with X=0 to obtain the colimit of any cofibrant P-diagram.
3. If X’s structural arrows are cofibrations, A.8’s pushout comparison shows that Y’s structural arrows are cofibrations as well. For maximal q∈S the map Y(q)→I(S,p) is a cofibration. This supplies the arrowwise cofibrations used in the comma contraction.

**Acceptance.**

- For P=[1], the condition is X(0)↣Y(0) and X(1)⊔_{X(0)}Y(0)↣Y(1).

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `CofibrantPosetDiagram` | data | The finite-poset diagram with the specified latching cofibrations. |
| `CofibrantPosetDiagram.latching` | projection | The relative colimit at each vertex. |
| `CofibrantPosetDiagram.colimit` | universal-property | The colimit exists and is built by cofibration pushouts. |
| `CofibrantPosetDiagram.structural_cof` | characterisation | The target’s structural arrows are cofibrations if those of the source are. |
| `CofibrantPosetDiagram.map` | functoriality | Natural transformations satisfying the latching condition are its cofibrations. |

**Consumers.**

- K.6 Frobenius-pair K-theory; Schlichting11.2,11.15–11.18 — Supplies approximation and fibration without choosing a functorial cylinder.

**Unit tests.**

- `poset_diagram_empty` (degenerate) — For empty P the colimit is the zero object.
- `poset_diagram_singleton` (compatibility) — For singleton P the latching condition is exactly the original cofibration condition.
- `poset_diagram_objectwise_not_enough` (non-example) — In finite pointed sets on [1], take X constant at a point and Y(0) a two-element pointed set, Y(1) a point, with collapse structural map. The map X→Y is objectwise injective, but its latching map is the collapse Y(0)→Y(1), hence is not a cofibration.

**Sources.**

- `Schlichting.NegativeK.2003`: AppendixA.6–A.8 pp.25–26. Read AppendixA in full, pp.24–27. The packet owns the general non-functorial factorization apparatus in early K.4; K.6 imports it. Generic finite-poset nerve and realization facts remain precise H.1/H.2 requests.

### Factor a finite diagram without a cylinder

`GeneralAlgebraicKTheory:K.4/finite-poset-factorization` · lemma · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

If C has factorization, every map X→Y of finite-poset diagrams factors X↣Z→Y into a latching cofibration and a pointwise weak equivalence.

**Hypotheses.**

- P is finite; no global functorial choice is asserted.

**Proof outline.**

1. Remove a maximal p and factor on P\{p} by induction.
2. Form the relative latching colimit at p using cofibrant-poset-diagrams. Its map to Y(p) factors by the objectwise existence property as a cofibration to Z(p) followed by a weak equivalence.
3. The universal property gives all structural arrows into Z(p) and extends the natural transformation. This supplies the required latching condition and finishes the finite induction.

**Acceptance.**

- This factors a fixed finite diagram without constructing a cylinder functor on all C.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/waldhausen-factorization`
- `GeneralAlgebraicKTheory:K.4:construction/cofibrant-poset-diagrams`

**Sources.**

- `Schlichting.NegativeK.2003`: AppendixA.9 p.26. Read AppendixA in full, pp.24–27. The packet owns the general non-functorial factorization apparatus in early K.4; K.6 imports it. Generic finite-poset nerve and realization facts remain precise H.1/H.2 requests.

### Contract the approximation comma categories

`GeneralAlgebraicKTheory:K.4/approximation-factorization-comma` · lemma · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

Suppose F:A→B satisfies approximation, A has factorization, and both weak-equivalence classes are saturated. Then every comma category (wF↓B) is contractible.

**Hypotheses.**

- F preserves cofibrations, their pushouts and weak equivalences; it reflects weak equivalences and satisfies App2.
- The finite-poset nerve test is imported from H.1, not asserted as an already built baseline fact.

**Proof outline.**

1. App2 applied to 0→B gives an object of (wF↓B). For a functor P→(wF↓B) with P finite, factor 0→X as a cofibrant diagram Y→X, pointwise weak, by finite-poset-factorization.
2. Its colimit exists and is preserved by F because it is assembled from cofibration pushouts. The quotient maps induce F(colimY)→B; App2 factors this through F(Z) weakly equivalent to B.
3. For each p, F(Y(p))→F(Z) is weak by saturation, because both map weakly to B. Reflection gives Y(p)→Z weak. Thus X←Y→constant(Z) is a diagramwise contraction in the actual comma category.
4. For two objects the finite discrete-poset case gives connectedness. Every finite sphere map into the nerve factors, after subdivision, through a finite-poset nerve and is null by the preceding construction. The requested H.1/H.2 finite-poset/CW test gives contractibility. No inference uses an infinite discrete poset of all components.

**Acceptance.**

- The weak arrows of the contraction lie over B and use the actual weak-equivalence comma category.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4/finite-poset-factorization`
- `StableHomotopyKTheory:H.1`
- `StableHomotopyKTheory:H.2`

**Sources.**

- `Schlichting.NegativeK.2003`: Proof of ApproximationA.2 and LemmaA.10 pp.26–27. Read AppendixA in full, pp.24–27. The packet owns the general non-functorial factorization apparatus in early K.4; K.6 imports it. Generic finite-poset nerve and realization facts remain precise H.1/H.2 requests.

### Approximation without a functorial cylinder

`GeneralAlgebraicKTheory:K.4/approximation-with-factorizations` · theorem · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

Under the preceding saturation, factorization and App1/App2 hypotheses, F:wA→wB and wS.F:wS.A→wS.B induce equivalences on nerve realizations and hence on K-theory.

**Hypotheses.**

- A and B are Waldhausen categories; A has factorization and F satisfies approximation. No factorization assumption on B or functorial cylinder on A is imposed beyond these hypotheses.

**Proof outline.**

1. Apply TheoremA to the contracted comma categories for F.
2. approximation-lifts-S-filtrations proves App1/App2 for S_nF by its pushout induction. Applying it to id_A shows S_nA has factorization. Saturation is inherited degreewise.
3. Repeat the comma argument for every S_nF; H.2’s realization contract promotes degreewise nerve equivalences to a weak-equivalence S-construction equivalence. Loop to obtain the K-map equivalence.

**Acceptance.**

- The usual cylinder approximation theorem is a specialization; Frobenius pairs need only the weaker factorization hypothesis.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4/approximation-factorization-comma`
- `GeneralAlgebraicKTheory:K.4/approximation-lifts-S-filtrations`
- `StableHomotopyKTheory:H.2`

**Sources.**

- `Schlichting.NegativeK.2003`: AppendixA.2 p.24 and its proof pp.26–27. Read AppendixA in full, pp.24–27. The packet owns the general non-functorial factorization apparatus in early K.4; K.6 imports it. Generic finite-poset nerve and realization facts remain precise H.1/H.2 requests.

### Acyclic cofibrations have the weak-equivalence nerve

`GeneralAlgebraicKTheory:K.4/acyclic-cofibrations-with-factorizations` · lemma · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

For a saturated Waldhausen category with factorization, the inclusion wC∩cofC→wC induces a nerve equivalence.

**Hypotheses.**

- The factorization is existential and saturation is required.

**Proof outline.**

1. For each B, the comma category of acyclic cofibrations mapping weakly to B contains identity(B). A finite-poset diagram gives X→constant(B).
2. Factor X∨constant(B)→constant(B) by finite-poset-factorization through Y. The structural arrows of X are cofibrations, and cofibrant-poset-diagrams makes Y’s structural arrows cofibrations.
3. Saturation with Y→constant(B) makes every structural arrow of Y weak. The maps X→Y and constant(B)→Y are pointwise cofibrations and weak equivalences, so they form a contraction in the actual comma category.
4. Use the finite-poset nerve test and TheoremA. This supplies the cylinder-free replacement for K.4/trivial-cofibration-nerve.

**Acceptance.**

- Dropping saturation would not justify weak equivalences on Y’s structural arrows.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4/finite-poset-factorization`
- `GeneralAlgebraicKTheory:K.4:construction/cofibrant-poset-diagrams`
- `StableHomotopyKTheory:H.1`
- `StableHomotopyKTheory:H.2`

**Sources.**

- `Schlichting.NegativeK.2003`: AppendixA.11 p.27. Read AppendixA in full, pp.24–27. The packet owns the general non-functorial factorization apparatus in early K.4; K.6 imports it. Generic finite-poset nerve and realization facts remain precise H.1/H.2 requests.

### Fibration without a functorial cylinder

`GeneralAlgebraicKTheory:K.4/fibration-with-factorizations` · theorem · parent `GeneralAlgebraicKTheory:K.4` · implementation unchecked

Let v⊂w be weak equivalences on the same cofibration category, with both Waldhausen structures. If the w structure has factorization and w satisfies saturation and extension, K(C^w,v)→K(C,v)→K(C,w) is a homotopy fibration. The K₀ map of the last two terms is surjective.

**Hypotheses.**

- Only w-factorizations are needed. C^w consists of the objects whose zero map is in w, equipped with v.

**Proof outline.**

1. Use the same swallowing/relative-S proof as K.4/fibration-theorem, replacing only the cylinder contraction by acyclic-cofibrations-with-factorizations. Apply this in finite v-diagram categories and S_nC, using their finite factorization and filtration contracts.
2. The relative-S comparison uses quotient choices, saturation and extension, and does not use a cylinder. Its relative S-fibration identifies the homotopy fibre as before.
3. Loop and take the long exact sequence. Since the same objects generate both Grothendieck groups and w adds relations, K₀(C,v)→K₀(C,w) is onto. This does not assert degree-zero surjectivity for a ring localization whose target has new projectives.

**Acceptance.**

- Frobenius-pair change of weak equivalences gives Schlichting11.18 without a functorial cylinder.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4/acyclic-cofibrations-with-factorizations`
- `GeneralAlgebraicKTheory:K.4/finite-poset-factorization`
- `GeneralAlgebraicKTheory:K.4/approximation-lifts-S-filtrations`
- `GeneralAlgebraicKTheory:K.4/localization-relative-S-comparison`
- `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`
- `StableHomotopyKTheory:H.2`

**Sources.**

- `Schlichting.NegativeK.2003`: AppendixA.3 p.25 and its proof p.27; compared with read Waldhausen§1.6. Read AppendixA in full, pp.24–27. The packet owns the general non-functorial factorization apparatus in early K.4; K.6 imports it. Generic finite-poset nerve and realization facts remain precise H.1/H.2 requests.

### Weak equivalences detected by a Grothendieck quotient

`GeneralAlgebraicKTheory:K.3/grothendieck-class-weak-equivalences` · definition · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

Proposed parent: `GeneralAlgebraicKTheory:K.3:cofinality`; maintainer integration is pending.

For p:K₀(C,v)↠G define w_p by f:A→B ∈w_p iff p[B]=p[A]. For a cofibration this is equivalent to p[B/A]=0. Then v⊂w_p, the new structure has factorization, and w_p is saturated and satisfies extension. Its acyclic objects form C₀={A | p[A]=0}.

**Hypotheses.**

- C is a small pointed Waldhausen category with factorization; v denotes its original weak equivalences.
- p:K₀(C,v)→G is onto, with G an abelian group. This is the late cofinality component, after K.4, not a prerequisite of early exact-category localization.

**Proof outline.**

1. The Grothendieck presentation gives [B]=[A]+[B/A] for a cofibration and [A]=[B] for v-equivalences. Thus the displayed equality is independent of any factorization chosen for f.
2. Two-of-three is transitivity/cancellation of equality in G. In a diagram of conflations, additivity of Grothendieck classes shows that if the two outer arrows preserve p-class, the middle does too; the same equality proves the gluing axiom under cofibration pushouts.
3. The original factorization of f is still a factorization for w_p, since v⊂w_p. The zero-map condition is precisely p[A]=0, giving C₀ with its inherited cofibrations and v weak equivalences.

**Acceptance.**

- For p=0, every map is in w_p and every object is acyclic. For p=id, w_p preserves the actual K₀ class rather than only its image in a further quotient.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.4:construction/waldhausen-factorization`
- `GeneralAlgebraicKTheory:K.4:construction/K-theory-space-of-a-waldhausen-category`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `KTheory.classWeakEquivalences` | data | A map lies in w_p exactly when p[B]=p[A]. |
| `KTheory.classWeakEquivalences_cof` | characterisation | On cofibrations it is the zero class of the quotient. |
| `KTheory.classWeakEquivalences_contains` | compatibility | The original weak equivalences are contained in w_p. |
| `KTheory.classWeakEquivalences_saturated` | structure | The new structure satisfies saturation, extension and the Waldhausen gluing axiom. |
| `KTheory.classAcyclic` | characterisation | The acyclic objects are exactly the kernel-class objects. |

**Consumers.**

- K.6 Schlichting11.17 and11.7; K.3/cofinality-degree-zero-correction — Supplies cofinality after K.4 without assuming a cylinder functor.

**Unit tests.**

- `class_weak_zero` (degenerate) — For p=0, every map is class-weak.
- `class_weak_identity` (compatibility) — Identity maps always preserve p-class.
- `class_weak_cof_quotient` (computation) — A cofibration with quotient D is class-weak exactly when p[D]=0.
- `class_weak_not_all` (non-example) — For bounded complexes of finite-dimensional k-vector spaces with quasi-isomorphisms and p=Euler characteristic:K₀≅Z, the map0→k concentrated in degree0 is not class-weak.

**Sources.**

- `ThomasonTrobaugh.1990`: Theorem1.10.1 and full proof, printed pp.275–277/PDF15–16; read scan images2026-10-02. The source’s cylinder proof is adapted exactly as SchlichtingAppendixA.4 specifies: use existential factorizations and the read A.3 fibration. Suspensions are chosen only for fixed finite filtrations; no functorial suspension is assumed.

### The class-weak S-construction realizes the quotient group

`GeneralAlgebraicKTheory:K.3/grothendieck-class-fibre-nerve` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

Proposed parent: `GeneralAlgebraicKTheory:K.3:cofinality`; maintainer integration is pending.

For each n, w_pS_nC→G^n sends a filtration to its successive p-class increments and induces a nerve equivalence. These equivalences are compatible with simplicial faces and degeneracies, and identify |w_pS.C| with BG.

**Hypotheses.**

- C is a small pointed Waldhausen category with factorization; v denotes its original weak equivalences.
- p:K₀(C,v)→G is onto, with G an abelian group. This is the late cofinality component, after K.4, not a prerequisite of early exact-category localization.

**Proof outline.**

1. Every g∈G is represented by an object: a difference [A]−[B] becomes [A⊕ΣB], choosing B↣I→0 by factorization, so [ΣB]=−[B]. Surjectivity of p and finite sums give all g.
2. For a tuple (g₁,…,g_n), choose representing objects C_i and their cumulative-sum filtration C_g. Factor the map C_g→0 in S_nC, using approximation-lifts-S-filtrations for identity, to choose a quotient filtration ΣC_g with increments −g_i.
3. The zero-tuple fibre has an initial zero filtration: 0→A_i is w_p for every component because all increments and hence all p[A_i] vanish. Adding C_g takes the zero fibre into the g fibre; adding ΣC_g takes the g fibre into the zero fibre.
4. Their composites add a fixed filtration whose increments are zero. The summand inclusion from each original filtration to that sum is a natural w_p transformation, so both composites are naturally homotopic to identity. Thus every fibre is contractible.
5. The increment map’s faces add adjacent increments and its degeneracies insert0, exactly the bar faces and degeneracies of G. H.2’s realization result gives |w_pS.C|≃BG. Only the class map is required to be simplicially natural; the choices of C_g and its suspension prove equivalence degreewise and need not form a functorial suspension.

**Acceptance.**

- Negative classes require the chosen suspension; surjectivity of p alone does not make all group elements represented by a positive direct sum without this step.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.3/grothendieck-class-weak-equivalences`
- `GeneralAlgebraicKTheory:K.4/approximation-lifts-S-filtrations`
- `GeneralAlgebraicKTheory:K.4:construction/S-construction`
- `StableHomotopyKTheory:H.1`
- `StableHomotopyKTheory:H.2`

**Sources.**

- `ThomasonTrobaugh.1990`: Theorem1.10.1 and full proof, printed pp.275–277/PDF15–16; read scan images2026-10-02. The source’s cylinder proof is adapted exactly as SchlichtingAppendixA.4 specifies: use existential factorizations and the read A.3 fibration. Suspensions are chosen only for fixed finite filtrations; no functorial suspension is assumed.

### Cofinality with non-functorial factorizations

`GeneralAlgebraicKTheory:K.3/cofinality-with-factorizations` · theorem · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

Proposed parent: `GeneralAlgebraicKTheory:K.3:cofinality`; maintainer integration is pending.

For C₀={A | p[A]=0}, K(C₀,v)→K(C,v)→G_discrete is a homotopy fibration. Hence K_i(C₀,v)≅K_i(C,v) for i>0 and K₀(C₀,v) identifies with ker(p)⊂K₀(C,v).

**Hypotheses.**

- C is a small pointed Waldhausen category with factorization; v denotes its original weak equivalences.
- p:K₀(C,v)→G is onto, with G an abelian group. This is the late cofinality component, after K.4, not a prerequisite of early exact-category localization.

**Proof outline.**

1. Apply fibration-with-factorizations to v⊂w_p, using the proved saturation/extension/factorization hypotheses.
2. The class-weak fibre nerve identifies its third K-space as ΩBG≃G_discrete by the H.1 bar/loop contract.
3. The long exact sequence gives the positive-degree isomorphisms and degree-zero injection with image ker(p). The map to G is p by the actual Grothendieck presentation, so the degree-zero identification is map-level.
4. The spectrum version is obtained later by H.5’s assembly and the bar-model Eilenberg–MacLane spectrum; no H.5 spectrum construction is an input of this space-level theorem.

**Acceptance.**

- For p=0 it gives the identity inclusion C₀=C. For p=id it gives K₀(C₀)=0 while all positive groups agree; degree-zero equality with C is not asserted.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.3/grothendieck-class-fibre-nerve`
- `GeneralAlgebraicKTheory:K.4/fibration-with-factorizations`
- `StableHomotopyKTheory:H.1`

**Sources.**

- `ThomasonTrobaugh.1990`: Theorem1.10.1 and full proof, printed pp.275–277/PDF15–16; read scan images2026-10-02. The source’s cylinder proof is adapted exactly as SchlichtingAppendixA.4 specifies: use existential factorizations and the read A.3 fibration. Suspensions are chosen only for fixed finite filtrations; no functorial suspension is assumed.

### Swallowing a second weak-map nerve direction

`GeneralAlgebraicKTheory:K.4:construction/weak-double-nerve-swallow` · lemma · parent `GeneralAlgebraicKTheory:K.4:construction` · implementation unchecked

If A⊂B is a wide subcategory, the double category AB of commuting squares with vertical arrows in A and horizontal arrows in B has nerve realization equivalent to NB via constant vertical strings. Applied to wS_nC it removes the extra weak-map nerve direction in the pairing.

**Hypotheses.**

- A and B have the same objects; vertical and horizontal composition preserve the commuting squares. Small categories and the H.2 good-realization convention are used.

**Proof outline.**

1. For each fixed vertical nerve degree m, evaluate A₀→⋯→A_m at A₀ to define A_mB→B. The constant-string inclusion is its right inverse.
2. The composites A₀→A_i give a natural transformation from the constant-string composite to the identity on A_mB, with horizontal maps in B. The nerve therefore gives a homotopy equivalence in every vertical degree.
3. Realize degreewise using H.2. Apply this with the same weak-map subcategory in both directions of S_nC, naturally in n and exact functors. This gives |wwS^(2)C|≃|wS^(2)C|.

**Acceptance.**

- There is no cylinder, saturation or extension hypothesis for this particular nerve comparison. The wide-subcategory condition is explicit.

**Prerequisites.**

- `StableHomotopyKTheory:H.1`
- `StableHomotopyKTheory:H.2`

**Sources.**

- `Waldhausen.KSpaces`: Swallowing Lemma1.6.5, printed p.352/PDF35, image inspected; pairing paragraph p.342/PDF25. Read the full evaluation/constant-string proof against the image and its product application. The needed same-object hypothesis is explicit here.

### Relative triples for an additive functor

`GeneralAlgebraicKTheory:K.3/additive-functor-relative-K0` · construction · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For an additive functor T:C→D between small additive categories, define K₀^cl(T) by triples(P,α,Q), α:TP≅TQ, modulo isomorphism, direct-sum additivity and [(P,α,Q)]+[(Q,β,R)]=[(P,βα,R)]. Its difference map sends the triple to[P]−[Q] in split K₀(C). The convention for idempotent completions is stated with each application.

**Hypotheses.**

- Classical additive K₁ is generated by object automorphisms with direct-sum and composition relations. This is independent of nonsplit exact K₁ until its comparison theorem is invoked.

**Proof outline.**

1. The commuting-square morphisms make the triple category additive. Impose its split exact relations and the composition relation.
2. Composition with identity shows [(P,id,P)]=0. An isomorphism γ:P≅Q in C gives [(P,Tγ,Q)]=0 by isomorphism of triples with an identity triple.
3. The inverse of[(P,α,Q)] is[(Q,α⁻¹,P)]. A triangular shear changes neither class: conjugate/stabilize its off-diagonal block and use the elementary Whitehead relations. This also allows the negative-inverse convention used in Ex2.17(a).
4. The difference map respects both relations. Functorial commuting squares induce maps on triples; a specified natural isomorphism of the square gives the same induced map.
5. This classical additive construction uses its stated automorphism presentation directly. It does not import the later Quillen K1/K2 comparison aggregator.

**Acceptance.**

- Use the split exact additive structure here. No identification with the homotopy fibre of an arbitrary exact functor is silently used.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `RelativeAdditiveTriple` | constructor | Objects P,Q of C and an isomorphism TP≅TQ. |
| `ClassicalRelativeK0` | constructor | The abelian group presented by triple sum and composition relations. |
| `ClassicalRelativeK0.difference` | projection | The map to split K0(C),[(P,α,Q)]↦[P]−[Q]. |
| `ClassicalRelativeK0.map` | functoriality | Maps from additive commuting squares with a specified comparison isomorphism. |

**Consumers.**

- K.6 finite-defect index and flasque cone comparison — Provides the classical K1/K0 exact germ before the negative construction.

**Unit tests.**

- `relative_identity` (degenerate) — For T=id, every triple is induced by an isomorphism in C and its class is zero.
- `relative_zero_functor` (computation) — For C→0, the difference map identifies this group with split K0(C).
- `relative_not_nonsplit` (non-example) — On finite abelian p-groups the split group remembers cyclic-length summands; do not impose all short exact sequences unless using the exact version.

**Sources.**

- `Weibel.KBook.II`: II2.10,combinedPDF85/printed77;Exercise2.17(a–b),PDF89/printed81. Read Definition2.10 and all parts of Exercise2.17. General additive-category formulation is the stable-object version of the projective-module argument; Karoubi1970 Theorem2.1 states it.

### The stable automorphism boundary of a cofinal additive functor

`GeneralAlgebraicKTheory:K.3/additive-functor-stable-boundary` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

If every object of D is a direct summand of some TP, there is a natural boundary δ:K₁^cl(D)→K₀^cl(T). Choose X⊕Y≅TP and extend α∈Aut(X) by id_Y; send it to[(P,α⊕id_Y,P)]. The result is independent of complements and transports.

**Hypotheses.**

- Cofinality here means direct-summand density, not surjectivity on objects. Use idempotent-completed categories if that is the application’s convention.

**Proof outline.**

1. Given two choices P,P′, add their complements and use the swap on TP⊕TP′. The stabilized extended automorphisms differ by conjugation and an identity summand, which do not change the triple class.
2. The composition relation proves δ(αβ)=δ(α)+δ(β); direct-sum additivity proves compatibility with stabilization. Hence δ descends from object automorphisms to classical K1.
3. If α=Tγ, its triple class is zero by the preceding node. The complement argument also proves naturality for cofinal additive squares: use the transported complement rather than new independent choices.

**Acceptance.**

- Use the split exact additive structure here. No identification with the homotopy fibre of an arbitrary exact functor is silently used.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.3/additive-functor-relative-K0`

**Sources.**

- `Weibel.KBook.II`: II2.10.2 and Exercise2.17(c),PDF85,89. Read Definition2.10 and all parts of Exercise2.17. General additive-category formulation is the stable-object version of the projective-module argument; Karoubi1970 Theorem2.1 states it.

### The classical five-term sequence of an additive functor

`GeneralAlgebraicKTheory:K.3/additive-functor-five-term` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For a cofinal additive T:C→D, K₁^cl(C)→K₁^cl(D)→K₀^cl(T)→K₀^split(C)→K₀^split(D) is natural and exact at its three interior terms. No surjectivity onto the last K0(D) is asserted.

**Hypotheses.**

- The split additive groups are those in the two preceding nodes. Karoubi’s convention replaces both categories by their idempotent completions.

**Proof outline.**

1. At K0(C), if[TP]=[TQ], group-completion equality supplies X with TP⊕X≅TQ⊕X. Cofinality puts X into a summand of TH; adding the complementary summand gives an actual triple(P⊕H,α,Q⊕H) mapping to[P]−[Q].
2. At relative K0, direct sums and inverse triples put any element into one triple. If its difference is zero, stabilize until P⊕H≅Q⊕H in C; this replaces the triple by an automorphism triple, which is in the image of δ.
3. At K1(D), δ(α)=0 means that after adding identity triples the chosen automorphism triple is a product of induced isomorphism triples and elementary block changes. Whitehead’s stabilized elementary block matrices represent zero in classical K1. Thus the class of α is induced from a C-automorphism. Conversely induced automorphisms have zero boundary.
4. The maps are the actual difference, scalar functor and stable automorphism boundary, so the preceding naturality gives a natural exact sequence rather than a group-order coincidence.

**Acceptance.**

- Use the split exact additive structure here. No identification with the homotopy fibre of an arbitrary exact functor is silently used.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.3/additive-functor-stable-boundary`

**Sources.**

- `Weibel.KBook.II`: II2.10/Exercise2.17(d–e),PDF85,89;Karoubi1970 Theorem2.1,PDF27 (stated with proof referred to Bass). Read Definition2.10 and all parts of Exercise2.17. General additive-category formulation is the stable-object version of the projective-module argument; Karoubi1970 Theorem2.1 states it.

### Relative projective triples are components of the K-fibre

`GeneralAlgebraicKTheory:K.5/relative-triples-to-components` · lemma · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

For f:R→S, the natural triple/path comparison K₀^cl(f*)→π₀fib(K(R)→K(S)) is an isomorphism. It takes(P,α,Q) to the virtual difference[P]−[Q] with the path to zero supplied by α:f*P≅f*Q. It respects the K1(S) boundary.

**Hypotheses.**

- Unital associative rings and unital maps. Only relative degree zero is compared here; the spectrum degree-one comparison remains U.6.

**Proof outline.**

1. Use the exact-projective K model of early K2; projective exact sequences are split. The canonical path of an object isomorphism in the S/Q model gives the proposed fibre point. Direct-sum additivity and composition of paths verify the defining triple relations.
2. Scalar extension has cofinal image because free S-modules are images of free R-modules and every projective S-module is a summand of a free one. Thus the classical five-term sequence applies.
3. Compare K1(R)→K1(S)→K0^cl(f*)→K0(R)→K0(S) with the fibre long exact sequence. Early degree0/degree1 comparisons identify the four absolute terms. The middle boundary sends a stabilized automorphism α to its loop and hence to[(R^n,α,R^n)], exactly the stable triple boundary.
4. Exactness and the outer isomorphisms give the middle isomorphism by the five lemma. This proves only the required degree0 contract and does not assume π1 of the fibre equals the classical relative K1 group.

**Acceptance.**

- The comparison uses the actual automorphism boundary and projective patching, rather than a negative absolute exact sequence.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.5/relative-K-theory`
- `GeneralAlgebraicKTheory:K.3/additive-functor-five-term`
- `GeneralAlgebraicKTheory:K.2:plus/zero-one-ring-comparison`

**Sources.**

- `Weibel.KBook.II`: II2.10 and Ex2.17;IV Ex1.16,chapterp16. ExerciseII2.3 and DefinitionII2.10/Ex2.17 read; the homotopy comparison is ExerciseIV1.15–1.16, whose full statement and hint were read. The proof below combines those inputs, and is a worker derivation, not a claimed verbatim proof in the source.

### Ideal K-zero through the augmented-ring patching square

`GeneralAlgebraicKTheory:K.5/ideal-zero-patching` · lemma · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

For I⊂R, the classical triple group K0^cl(R→R/I) is naturally ker(K0(R⋉I)→K0(R)), where(R⋉I) has multiplication(r,i)(s,j)=(rs,rj+is+ij). The two projections are r and r+i. The comparison respects the automorphism boundary and the map to K0(R).

**Hypotheses.**

- Unital associative rings and unital maps. Only relative degree zero is compared here; the spectrum degree-one comparison remains U.6.

**Proof outline.**

1. R⋉I is the pullback R×_(R/I)R. Patch a triple(P,α,Q) along this square to its projective module M(P,α,Q). Subtract the diagonal patched Q; under the Q-projection the difference vanishes, and under the P-projection it is[P]−[Q].
2. Split-sum relations follow from direct sums of patched modules. For composition, the three-way patched object gives[M(P,α,Q)]+[M(Q,β,H)]−[diagonalQ]=[M(P,βα,H)] after stabilization; this is the standard Milnor patching calculation.
3. Conversely any projective over the pullback is a patched pair with an isomorphism of its reductions. A virtual class whose Q-projection is zero becomes, after adding a diagonal projective, a difference of a patched triple and its diagonal Q. Stable changes and elementary matrices give precisely the triple relations.
4. The gluing of a free automorphism triple is the Milnor boundary. Hence this isomorphism commutes with both the K1(R/I) boundary and the difference map. Compose with relative-triples-to-components.

**Acceptance.**

- The comparison uses the actual automorphism boundary and projective patching, rather than a negative absolute exact sequence.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.5/relative-triples-to-components`
- `GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris`

**Sources.**

- `Weibel.KBook.II`: ExerciseII2.3(c),II2.10 and ExerciseIV1.15 (augmented-ring hint),combinedPDF86 andIVp16. ExerciseII2.3 and DefinitionII2.10/Ex2.17 read; the homotopy comparison is ExerciseIV1.15–1.16, whose full statement and hint were read. The proof below combines those inputs, and is a worker derivation, not a claimed verbatim proof in the source.

### Excision for components of relative K-theory

`GeneralAlgebraicKTheory:K.5/ideal-degree-zero-excision` · lemma · parent `GeneralAlgebraicKTheory:K.5` · implementation unchecked

If f:R→S identifies I with an ideal J of S, then π0K(R,I)→π0K(S,J) is an isomorphism. Its proof is early K5 and does not depend on late U6 relative π1.

**Hypotheses.**

- Unital associative rings and unital maps. Only relative degree zero is compared here; the spectrum degree-one comparison remains U.6.

**Proof outline.**

1. The square R⋉I→S⋉J over R→S is a pullback with surjective right augmentation. Its K1(S⋉J)→K1(S) map is onto because augmentation has the diagonal section.
2. Milnor K1–K0 exactness therefore gives 0→K0(R⋉I)→K0(R)⊕K0(S⋉J)→K0(S) exact, including surjectivity of the last map from the S⋉J section.
3. Take kernels of the split augmentations. The induced map ker(K0(R⋉I)→K0R)→ker(K0(S⋉J)→K0S) is an isomorphism. Apply ideal-zero-patching and relative-triples-to-components to obtain the natural fibre-component statement.
4. Applying this to Z⋉I→R identifies relative π0 with the nonunital unitization model. This is the degree-zero input used by K6’s downward contraction argument.

**Acceptance.**

- The comparison uses the actual automorphism boundary and projective patching, rather than a negative absolute exact sequence.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.5/ideal-zero-patching`
- `GeneralAlgebraicKTheory:K.5/milnor-square-mayer-vietoris`
- `GeneralAlgebraicKTheory:K.5/nonunital-rings-and-unitisation`

**Sources.**

- `Weibel.KBook.II`: ExerciseII2.3(a),combinedPDF86/printed78;the split augmented-ring square realizes its hint. ExerciseII2.3 and DefinitionII2.10/Ex2.17 read; the homotopy comparison is ExerciseIV1.15–1.16, whose full statement and hint were read. The proof below combines those inputs, and is a worker derivation, not a claimed verbatim proof in the source.

### Base change of a finite field transfer through an Artin algebra

`GeneralAlgebraicKTheory:K.3/finite-field-transfer-base-change` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For E/F finite and F′/F any field extension, write B=E⊗F F′=∏B_j, with residue fields E_j and local lengths ℓ_j=length_(B_j)B_j. Then res_(F′/F) Tr_(E/F)=Σ_j ℓ_j Tr_(E_j/F′)res_(E_j/E) on every connective K_n. Multiplicity is local module length, not the nilpotence exponent of the maximal ideal.

**Hypotheses.**

- Finite-dimensional vector spaces carry their existing split exact structure. B need not be reduced; F′ need not be finite or algebraic over F.

**Proof outline.**

1. Both composites of scalar extension and restriction of scalars are represented by the naturally isomorphic exact functors V↦V⊗E(E⊗F F′) and V↦V⊗F F′ from finite E-vector spaces to finite F′-vector spaces.
2. Decompose B into its Artin local factors and select a finite composition series of each B_j as an E–F′ bimodule, using its B_j-module composition series. Every subquotient is E_j. Tensoring over the field E preserves its short exact sequences.
3. Apply exact-functor additivity to this finite filtration. The subquotient functor is scalar extension E→E_j followed by restriction E_j→F′; its ℓ_j copies give the displayed sum.
4. A different series has the same multiplicities by Jordan–Hölder. The source’s G-theory base-change theorem also gives the square in the finite/flat case, but no scheme K-theory is used by this derivation.

**Acceptance.**

- The ring-level statement is upstream of symbol comparisons; scheme analogues consume it later.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`
- `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`
- `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`

**Sources.**

- `Weibel.KBook.V`: V3.5.3 and3.7.2 pp23–25 (exact tensor functors);V4.2.1 pp34 (Artin filtrations);worker derivation of arbitrary field base change. Read the indicated source statement and its proof or exercise hint. The exact-functor decomposition below supplies the explicit ring case; it is not attributed to a scheme-only theorem.

### Compute the first localization boundary by kernel and cokernel

`GeneralAlgebraicKTheory:K.3/localization-degree-one-index` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For a Serre subcategory B⊂A and α:X→X becoming invertible in A/B, the boundary of its K1 class is[cokerα]−[kerα] in K0(B). For a central element s inverted in a noetherian ring, this gives ∂[s]=[R/sR]−[ann_R(s)] in the torsion Grothendieck group.

**Hypotheses.**

- Use the source’s positive cokernel-minus-kernel orientation, and the actual localization fibration of K3.

**Proof outline.**

1. Represent the automorphism class by the Q-construction square 0↣X↠0 with vertical α, as in IVEx7.9. Its side and exterior edges collapse to the basepoint.
2. Lift the square through the localized-model category. The endpoint discrepancy of the lift is the kernel and cokernel conflations of α, now objects of B. The maximal-tree K0 computation gives their difference[cokerα]−[kerα]. Additivity makes it independent of stabilized representatives.
3. For multiplication by s on R, substitute its kernel ann_R(s) and cokernel R/sR. If R is a domain or s a non-zero-divisor the kernel vanishes.
4. The class of an automorphism is its explicit Q-construction square here; an identification of all exact-category K1 with a classical presentation is unnecessary.

**Acceptance.**

- The ring-level statement is upstream of symbol comparisons; scheme analogues consume it later.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`
- `GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0`

**Sources.**

- `Weibel.KBook.V`: VEx5.1 p38 andExample6.1.2 p38;IVEx7.9 p75 (square representing the automorphism). Read the indicated source statement and its proof or exercise hint. The exact-functor decomposition below supplies the explicit ring case; it is not attributed to a scheme-only theorem.
- `Quillen.Higher1973`: Section5 Theorem5 and Lemmas1–5, PDF29–32/publication pp113–116, full proof read. Checked the layers/intersection directed poset, epimorphic kernel pushout, filtered image models, postcomposition natural transformation and final zero-inflation square against these decomposed nodes.

### The DVR boundary is the normalized valuation

`GeneralAlgebraicKTheory:K.3/dvr-degree-one-boundary` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For a DVR R with fraction field F, residue field k and uniformizer π, the K1(F)=F×→K0(k)=Z boundary sends π to1 and a to v(a). This is the ring-level supplier of the tame-symbol comparison; S3 imports its scheme version.

**Hypotheses.**

- Normalized additive valuation has v(π)=1. Torsion dévissage identifies[R/πR] with the one-dimensional k-space.

**Proof outline.**

1. Apply localization-degree-one-index to multiplication by π. Its cokernel is k and its kernel is zero.
2. Units lift from R and therefore have zero boundary. Write a=uπ^m and use the boundary homomorphism to get v(a)=m, including negative m.
3. This computation needs only abelian ring localization, resolution and dévissage; it has no prerequisite in SchemeKTheoryOperationsS3.

**Acceptance.**

- The ring-level statement is upstream of symbol comparisons; scheme analogues consume it later.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.3/localization-degree-one-index`
- `GeneralAlgebraicKTheory:K.3/devissage-theorem`
- `GeneralAlgebraicKTheory:K.3/resolution-theorem`

**Sources.**

- `Weibel.KBook.V`: V6.1.2 p38 andDedekind sequence6.6 p41. Read the indicated source statement and its proof or exercise hint. The exact-functor decomposition below supplies the explicit ring case; it is not attributed to a scheme-only theorem.

### Transport the right product action through the localization boundary

`GeneralAlgebraicKTheory:K.3/localization-product-boundary` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

A biexact pairing A×C→A′ preserving the Serre subcategories induces ∂(x·y)=∂x·y on the right for x in K(A/B) and y in K(C). On the left the graded formula is ∂(y·x)=(−1)^deg(y)y·∂x. Thus δ_n=(−1)^(n−1)∂_n is the uniformizer-last Milnor boundary normalization in degree n.

**Hypotheses.**

- Choose the right-module suspension convention of VEx5.3. The alternative boundary δ_n is a degreewise normalization of the LES, not a competing definition of the symbol.

**Proof outline.**

1. The exact pairing gives a map of the localization fibration tensored with K(C), via early biexact products. The generic H5 homotopy-fibre pairing commutes with the right boundary; require that supplier with its suspension convention.
2. Commuting a degree-i class across the degree−1 boundary yields the left sign(−1)^i. Multiplying ∂_n by(−1)^(n−1) cancels this sign for left coefficient products.
3. For DVR symbols {u1,…,u_(n−1),π}, the coefficient class lifts from R and δ_n returns the reduced unit symbol. δ_n vanishes on symbols of units; these formulas and bilinear relations determine all Milnor-symbol residues.

**Acceptance.**

- The ring-level statement is upstream of symbol comparisons; scheme analogues consume it later.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`
- `GeneralAlgebraicKTheory:K.7/biexact-stabilized-pairing`
- `StableHomotopyKTheory:H.5:spectra`
- `GeneralAlgebraicKTheory:K.3/dvr-degree-one-boundary`

**Sources.**

- `Weibel.KBook.V`: VEx5.3 p38,IVEx1.23 (generic fibration pairing);V6.6.1 pp41–42. Read the indicated source statement and its proof or exercise hint. The exact-functor decomposition below supplies the explicit ring case; it is not attributed to a scheme-only theorem.
- `Quillen.Higher1973`: Section5 Theorem5 and Lemmas1–5, PDF29–32/publication pp113–116, full proof read. Checked the layers/intersection directed poset, epimorphic kernel pushout, filtered image models, postcomposition natural transformation and final zero-inflation square against these decomposed nodes.

### Contract both comma categories in one-step resolution

`GeneralAlgebraicKTheory:K.3/one-step-resolution-comma` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For a resolving full exact P⊂H, closed under extensions and kernels of admissible epimorphisms, and with P-epimorphisms onto every H-object, QP→QH is a homotopy equivalence.

**Hypotheses.**

- The exact structure on P is induced from H. The full subcategory C of QH on P-objects need not equal QP on morphisms.

**Proof outline.**

1. Factor QP→C→QH. For QP→C, the over-comma at P is the poset of H-admissible layers (P0,P1) with quotient in P and both P/P1 and P1/P0 in P. Kernel closure puts P0,P1 in P.
2. The functor (P0,P1)↦(0,P1) has natural comparisons to the identity and to the constant (0,0); hence this comma category contracts.
3. For C→QH, the under-comma at M consists of Q-arrows M→P. Factor such an arrow as i_! j^!, with j:P̄↠M and i:P̄↣P. Kernel closure puts P̄ in P. Removing i is the right-adjoint retraction onto the epimorphic subcategory.
4. In the opposite epimorphic category, choose P*↠M. The functor (P↠M)↦(P×_M P*↠M) compares to the identity and the constant P*. Its objects are in P: the pullback is an extension of P* by ker(P↠M), both in P. This kernel argument is required; an arbitrary pullback of P-objects need not be in P.
5. Apply the imported Theorem A twice; the adjunction and natural transformations are the actual contractions.

**Acceptance.**

- Check the actual maps and the stated scope, rather than only equality of cardinalities.
- For finite-dimensional vector spaces the identity inclusion gives the identity equivalence.
- For a category lacking kernel closure, the pullback contraction is not licensed.
- A full exact inclusion need not induce a full inclusion of Q-categories; retain C as an intermediate category.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`
- `StableHomotopyKTheory:H.2/quillen-theorem-a`
- `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`

**Sources.**

- `Quillen.Higher1973`: Section4 Theorem3 full proof, PDF24–25/publication pp108–109. Read at the stated locator; worker deductions and quoted upstream inputs are distinguished in the proof outline.

### Resolution dimensions and successive exact subcategories

`GeneralAlgebraicKTheory:K.3/bounded-resolution-filtration` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

Under the resolving hypotheses, H_n={M:resolution length≤n by P} is extension closed, H_n⊂H_(n+1) satisfies the one-step theorem, and K(P)≃K(H) if every H-object has finite P-resolution.

**Hypotheses.**

- Use admissible resolutions. P is extension closed, kernel closed, and supplies epimorphic covers.

**Proof outline.**

1. Prove the three inequalities by induction from n=0: M∈H_n,M″∈H_(n+1)⇒M′∈H_n; M′,M″∈H_(n+1)⇒M∈H_(n+1); M′,M∈H_n⇒M″∈H_(n+1).
2. For the first, pull back a P-cover of M″ and use the resulting short exact rows. For the second lift a P-cover of M″ through M after enlarging it, add a P-cover of M′ and use the horseshoe diagram. For the third the kernel of a P-cover of M maps to M′ and the preceding inequalities bound the new kernel.
3. Apply one-step-resolution-comma to each H_n→H_(n+1). Every object of the latter has a cover from P whose kernel is in H_n.
4. The essentially small filtered union is H; use the earlier finite-data continuity of Q and K. No functorial choice of finite resolutions is assumed.

**Acceptance.**

- Check the actual maps and the stated scope, rather than only equality of cardinalities.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.3/one-step-resolution-comma`
- `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`

**Sources.**

- `Quillen.Higher1973`: Section4 Corollary1 and its three-inequality proof, PDF25–27/publication pp109–111. Read at the stated locator; worker deductions and quoted upstream inputs are distinguished in the proof outline.

### The actual two intersection functors in dévissage

`GeneralAlgebraicKTheory:K.3/devissage-intersection-contraction` · lemma · parent `GeneralAlgebraicKTheory:K.3` · implementation unchecked

For B⊂A closed under subobjects, quotients and finite sums, with a finite B-filtration of each A-object, the layer comma category J(M) is contractible and QB→QA is a homotopy equivalence.

**Hypotheses.**

- A is abelian, B is a full exact abelian subcategory. B need not be closed under extensions in A.

**Proof outline.**

1. Identify (QB→QA)/M with layers (M0,M1)⊂M for which M1/M0 lies in B.
2. If M/M′ lies in B, define r(M0,M1)=(M0∩M′,M1∩M′) in J(M′) and s(M0,M1)=(M0∩M′,M1) in J(M).
3. The quotient for s embeds into (M1/M0)⊕(M/M′), so belongs to B by the stated closure, without extension closure. There are natural arrows ir→s←id and ri=id.
4. Thus J(M′)→J(M) is a homotopy equivalence. Iterate along a finite filtration to J(0), the one-object poset, and apply Theorem A.
5. For finite-length A choose B semisimple: the division-ring corollary follows using finite sums and filtered unions. For nilpotent ideals this is a G-theory assertion; it does not imply nilinvariance of projective-module K-theory.

**Acceptance.**

- Check the actual maps and the stated scope, rather than only equality of cardinalities.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`
- `StableHomotopyKTheory:H.2/quillen-theorem-a`
- `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`

**Sources.**

- `Quillen.Higher1973`: Section5 Theorem4 full proof, PDF28–29/publication pp112–113. Read at the stated locator; worker deductions and quoted upstream inputs are distinguished in the proof outline.

### Early absolute K0/K1 comparison for rings

`GeneralAlgebraicKTheory:K.2:plus/zero-one-ring-comparison` · comparison · parent `GeneralAlgebraicKTheory:K.2:plus` · implementation unchecked

For every unital associative ring R, the exact-projective K-space has π0 naturally RingK0(R) and π1 at zero naturally GL(R)/E(R). The π1 comparison sends a stabilized automorphism to its plus/Q loop; scalar extension commutes with both comparisons. This is the degree0/1 adapter, not a new classical K0/K1 construction.

**Hypotheses.**

- Use finite projectives with their split exact structure. Classical projective K0 and stable GL/E are supplied by KTheoryLowDegrees U.1/U.2.

**Proof outline.**

1. The maximal-tree Q calculation supplies π0 of ΩBQ(P(R)) as projective K0.
2. Apply the early plus-equals-Q comparison and group-completion cofinality of free modules to identify the basepoint component with BGL(R)+.
3. The plus fundamental-group theorem identifies π1 with GL(R)/E(R), with the quotient induced by the actual BGL map. In the plus/Q comparison the automorphism square represents this loop, as IV7.2 and Ex7.9 specify.
4. Ring maps induce the stable matrix map, preserve E, and induce scalar extension on projectives. Naturality of the comparison proves the two commuting squares without choosing a natural splitting of all components.

**Acceptance.**

- Available before K.5 and U.6. Neither the relative π1 theorem nor the K2/Steinberg/Suslin aggregator is used.

**Prerequisites.**

- `GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0`
- `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`
- `GeneralAlgebraicKTheory:K.2:plus/cofinality-of-projective-modules`
- `KTheoryLowDegrees:U.1`
- `KTheoryLowDegrees:U.2`
- `StableHomotopyKTheory:H.3`

**Sources.**

- `Weibel.KBook.IV`: Definition1.1–1.1.2,chapterpp2–3;Theorem7.1/Cor7.2,pp61–62;Ex7.9,p75. Degree0/1 statements and ring-map proof read in the author chapter; the automorphism-square identification was read with Ex7.9. This node combines those inputs, without importing the later relative comparison.

## Remaining gaps

### The excision criteria are quoted, not proved

The criteria that excision in degree one is equivalent to the ring being idempotent, and that excision in degrees up to n is equivalent to the vanishing of the first n torsion groups over the unitisation, are quoted by the source from Suslin and from Suslin and Wodzicki without proof, and this packet quotes them the same way. The counterexample they yield, a square-zero ring, is therefore also conditional on them. NEXT SOURCE ACTION: read Suslin and Wodzicki, 'Excision in algebraic K-theory' (Annals 136, 1992), and Suslin's 1995 sequel, and decompose the proof of the criterion in degree one at least, which is the one the counterexample uses.

Needed by: `GeneralAlgebraicKTheory:K.5`.

## Requests to existing owners

- `StableHomotopyKTheory:H.4` — Group completion of a symmetric monoidal groupoid, the plus construction, the stable general linear group and the cofinal stabilisation argument, including the Cofinality Theorem for a cofinal monoidal functor with the same automorphism groups (Weibel IV.4.11(b)), which K.2:plus/cofinality-of-projective-modules now uses instead of the late exact-category cofinality. AUDIT-28 records H.4 as owning exactly the comparison K.2:plus needs, so this packet states the plus-equals-Q theorem and cites H.4 for the group-completion side rather than building it.

- `StableHomotopyKTheory:H.1` — The homotopy-theoretic apparatus the K.1 and K.3 proofs use: the classification of coverings by morphism-inverting functors with the maximal-tree presentation of π₁, the fact that a natural transformation gives a homotopy (so adjoints are homotopy equivalences and categories with an initial object are contractible), and the commutation of classifying spaces with filtered colimits. The nodes cite the integrated H.1 nodes coverings-fundamental-group-local-coefficients, natural-transformations-adjoints-contractibility and filtered-colimits-of-categories by id.

- `StableHomotopyKTheory:H.5:S-delooping` — Assemble the connective Ω-spectrum from the iterated S-construction and the natural deloopings |wS.ⁿC| ≃ Ω|wS.ⁿ⁺¹C| supplied by K.4:construction (K.4/delooping-and-the-spectrum), with its indexing π_i = K_i for i ≥ 0. Spectrum assembly consumes that prefix; it is not a prerequisite of additivity or of the relative S-fibration. Generic smash products belong to H.5:spectra, and the K-theory-specific biexact pairings and their coherence to K.7, so the pairing clause of the integrated H.5:S-delooping node should move to K.7.

- `KTheoryLowDegrees:U.6` — The identification of the first homotopy group of the plus construction with the quotient of the stable general linear group by its elementary subgroup, compatibly with determinant and transfer. K.2:low-degree-comparisons imports it by name and does not re-plan it. U.6 also owns the comparison of π₀ and π₁ of K.5's relative fibre for a pair with K₀(I) and K₁(A, I) (U.6/relative-K1-homotopy-comparison); K.5 does not assert it, and U.6 should cite this packet's node GeneralAlgebraicKTheory:K.5/relative-K-theory rather than the integrated decomposition id.

- `KTheoryLowDegrees:Z.1` — Finitely generated projective modules as summands of finite free modules, with complements, scalar extension along arbitrary (noncommutative) unital ring maps and the ring Grothendieck group, and Milnor patching with the K₀ end of the Mayer–Vietoris sequence. These are planned in the KTheoryLowDegrees--U.1 packet and cited here by node id: Z.1/extend-scalars and Z.1/extend-scalars-finite-projective (K.2:plus scalar extension), Z.1/projective-karoubi, Z.1/ring-k0-exact and Z.1/ring-k0-map (the ring model), and Z.1/milnor-finite-projective, Z.1/milnor-boundary, Z.1/milnor-boundary-kernel, Z.1/milnor-exact-at-k0 and Z.1/milnor-exact-at-pair (K.5's Mayer–Vietoris node). The one missing position of Milnor's sequence, exactness at K₁(S) × K₁(T), is planned in K.5 because KTheoryLowDegrees U.5, its natural owner, lies downstream of K.5 (through SchemeKTheoryOperations S.3).

- `K2SymbolsBrauer:T.1:plus` — The identification of the second K-group with the second homology of the stable elementary subgroup and with the second homotopy group of the K-theory space.

- `K2SymbolsBrauer:T.2:symbols` — Matsumoto's presentation of the second K-group of a FIELD by symbols. K.2:low-degree-comparisons states that it is field-specific and imports it from here.

- `K3BlochGroups:V.4` — Suslin's exact sequence relating the third K-group to the Bloch group, which is the explicit degree-three model K.2:low-degree-comparisons registers.

- `GeneralAlgebraicKTheory:K.6` — The nonconnective spectrum and negative groups extend K.5 relative exact-functor fibres and central ring localisation when new projectives cause a degree-zero cokernel. K.4’s same-object change-of-weak-equivalences theorem has a surjective K₀ map and needs no such correction. General cofinality and nonunital adapters still use K.6 as separately stated.

- `StableHomotopyKTheory:H.2` — RT-AREA-ktheory-1/15. The realisation theorem for levelwise homotopy fibration sequences of simplicial spaces, stated and proved in a model the relative S.-construction satisfies: for maps V. → W. → X. of simplicial spaces with compatible basepoints such that each Vₙ → Wₙ → Xₙ is a homotopy fibration sequence (Vₙ → hofib(Wₙ → Xₙ) over the basepoint is a weak equivalence), every Xₙ is connected, and the simplicial spaces are good (degeneracies closed cofibrations, automatic for realisations of multisimplicial sets), the sequence |V.| → |W.| → |X.| is a homotopy fibration sequence, the fibre identification being the canonical map into the homotopy fibre over the realised basepoint, so Ω|X.| → |V.| → |W.| → |X.| is one with the canonical connecting map. Either standard form may be adopted: Waldhausen 1978 (Algebraic K-theory of generalized free products, Lemma 5.2, as quoted in Weibel V.1.7) or Bousfield–Friedlander 1978 (Theorem B.4, for bisimplicial sets, with the π∗-Kan condition and the π₀ fibration condition, both implied when every Xₙ and Wₙ is connected); the locators are the red team's and verifier's and were not re-read here. This is neither the diagonal lemma nor the levelwise-equivalence theorem H.2 already plans, and it must not be stated for arbitrary levelwise fibrations without the connectivity (or π∗-Kan) hypothesis. Consumer: K.4/delooping-and-the-spectrum, which verifies the hypotheses for n ↦ (|wS.C| → |wS.(Sₙf)| → |wS.(SₙB)|).

- `StableHomotopyKTheory:H.4` — Consumers K.2:plus/localised-extension-fibre-equivalence, extension-cartesian-lifts and extension-category-contractibility need the generic monoidal action-localisation results of Weibel IV.4.7.1 and Exercises 4.6–4.7, 4.11: a faithful compatible action with injective automorphism translations gives the homotopy fibration S⁻¹S→S⁻¹E→⟨S,E⟩; a cartesian action localises a fibred functor with localised fibres; if translations already induce realisation equivalences then E→S⁻¹E is a realisation equivalence. H.4 also supplies a homotopy inverse for connected homotopy-associative CW H-spaces. These are generic supplier obligations; the new nodes verify the specific extension-category constructions and do not purport to close H.4.

- `StableHomotopyKTheory:H.2` — Consumer K.4:construction/object-S-additivity needs Waldhausen’s simplicial Theorem-B form (K-spaces Lemma 1.4.B, printed p.337): for f:X→Y, if every order-map pullback between simplex fibres Δ[n]×_Y X is a realisation equivalence, each such pullback square is homotopy cartesian. Obtain this by categorical Theorem B on the category of simplices, its comma-fibre identification, and the natural equivalence from the simplex-category nerve to realisation. This is a generic translation of the existing H.2 Theorem B, not a second K-theory owner.

- `StableHomotopyKTheory:H.2` — K.4/fibration-theorem and K.4:construction/iS-versus-Q need the generic swallowing lemma for double nerves (Waldhausen1.6.5, printed p.352/PDF35): for A⊂B, the double category of A-vertical and B-horizontal squares realises equivalently to B, proved by first-object evaluation and the string natural transformation. The S-Q comparison also needs the generic edgewise realisation homeomorphism for d[n]=[n]^op*[n], d[n]=[2n+1]. These are general simplicial/categorical results; K.4 owns only the specific triangular Q-span diagram.

- `StableHomotopyKTheory:H.2` — K.4/approximation-comma-contractibility and K.4/iterated-mapping-cylinder need the last-vertex map |N simp(X)|→|X| and its realisation equivalence, the left-adjoint retraction to nondegenerate simplex posets for nonsingular X, representation of homotopy classes by finite subdivided sphere maps into a simplicial realisation, and CW Whitehead for weakly contractible classifying spaces (Waldhausen proof1.6.7, printed pp.355,359/PDF38,42). These are generic homotopy supplier results, independent of K-theory. The finite sphere and connectedness hypotheses must be retained.

- `StableHomotopyKTheory:H.1` — For a nonempty small category, if every functor from a finite poset contracts by natural-transformation zigzags, its nerve realization is contractible. Use finite two-point posets for connectedness and finite subdivisions of sphere maps for higher groups; do not apply the hypothesis to an infinite discrete component set. Also provide TheoremA for the weak-equivalence comma categories.

- `StableHomotopyKTheory:H.1` — For an abelian discrete group G, the realization of its bar nerve BG has loop space equivalent to G_discrete, with the loop class map equal to the bar generator. The finite class-weak filtration proof imports this elementary space result; spectrum assembly belongs to H.5 later.

- `StableHomotopyKTheory:H.1` — Nerve homotopies from natural transformations and the good degreewise-realization lemma for the evaluation/constant-string swallowing comparison, naturally in the S direction.

- `StableHomotopyKTheory:H.2` — Nerve homotopies from natural transformations and the good degreewise-realization lemma for the evaluation/constant-string swallowing comparison, naturally in the S direction.

- `StableHomotopyKTheory:H.5:spectra` — A homotopy-fibre sequence of right E-module spectra retains its module boundary. Specify the suspension orientation: right multiplication has no sign, moving a degree-i left coefficient across a degree−1 boundary contributes(−1)^i. K3/localization-product-boundary applies this generic fact to exact-category localisation; early ring products alone do not prove it.

- `KTheoryLowDegrees:U.1` — Early classical projective K0 and stable-matrix elementary/Whitehead calculus, used by K.2:plus/zero-one-ring-comparison. These are imported constructions, not owned anew here.

- `KTheoryLowDegrees:U.2` — Classical ring K1=GL/E and its stabilized automorphism class with scalar-extension naturality, for K.2:plus/zero-one-ring-comparison. The relative U.6 comparison is not a prerequisite.

- `StableHomotopyKTheory:H.3` — The based plus fundamental-group quotient π1(X+) = π1(X)/P and its map-level naturality, with P perfect normal, for the absolute degree0/1 ring comparison. No rational Hurewicz theorem is requested here; that belongs to H.6.

## Stage proposals awaiting maintainer integration

### K.2:low-degree-comparisons owns nothing and its stage text should say so

Every target this layer lists is owned by another roadmap, and AUDIT-28 names all four owners. The layer's real content is the combination: that the plus comparison of K.2:plus turns those three identifications into statements about the K-groups defined here, and that one of the four, Matsumoto's presentation, is field-specific while the others are not. The stage text should be narrowed to that, with the four owners named in it, so that a reader is not led to plan the identifications here. Nothing is dropped: the layer keeps two nodes and four requests.



### The localisation theorems of K.3 and K.4 are different theorems and should stay apart

K.3's stage text warns against asserting localisation for arbitrary exact subcategories. This packet honours that by keeping Quillen's theorem, which is for a Serre subcategory of an abelian category, in K.3, and the Waldhausen theorem, which needs a cylinder functor with the cylinder axiom and saturation and extension for the larger class, in K.4. The two stage texts should each point at the other, because a reader who finds only one of them will be tempted to use it outside its hypotheses; that is exactly the error the K.3 text names.



### RT-AREA-ktheory-1/4: Waldhausen additivity and the relative S-fibration belong to K.4:construction

The atlas orders K.4:construction → H.5:S-delooping → K.4 but put Waldhausen additivity and the relative S-fibration in late K.4, although H.5:S-delooping's Ω-spectrum needs the deloopings they prove; K.4 also claimed 'the delooping theorem' that H.5:S-delooping proves, and the biexact K-pairing was planned both in H.5:S-delooping and in K.7. This packet now parents K.4/waldhausen-additivity and K.4/delooping-and-the-spectrum to K.4:construction and gives them the realisation input they need from H.2. The comparison with Q needs neither additivity nor the delooping, and the verifier's narrowing keeps late only the comparison results that need them, so the packet keeps K.4:construction/iS-versus-Q in the early part although the stage text lists the comparison among the late theorems.

K.4:construction's text owns Waldhausen categories, the S-construction and its iteration, the K-theory space, the comparison with Q, Waldhausen additivity and the relative S-fibration with the iterated deloopings, and its handoff row matches. H.5:S-delooping imports K.4:construction and H.5:spectra and only assembles the connective Ω-spectrum; its integrated node's biexact-pairing clause moves to K.7, the single owner of K-theory products, while generic smash products stay in H.5:spectra. Late K.4 keeps the fibration and approximation theorems and Gillet–Waldhausen, and its text drops 'and the delooping theorem'. Edges: keep K.1 → K.4:construction and K.4:construction → H.5:S-delooping → K.4, now acyclic; add StableHomotopyKTheory:H.2 → K.4:construction; drop EnhancedDerivedSheaves:E5:abstract → K.4:construction and StableHomotopyKTheory:H.5:spectra → K.4:construction, which no K.4:construction node uses (enhanced and derived invariance keeps its own prerequisites in K.6 and K.7).

### RT-AREA-ktheory-1/20: early K.3 and a late K.3:cofinality

K.3 required all of K.4 although only its cofinality theorem uses Waldhausen theory, so every consumer of Quillen's 1973 theorems (K2SymbolsBrauer T.3:localization-comparison and T.5, ArithmeticKTheory N.2, SchemeKTheoryOperations S.3, KTheoryFiniteLocalFields L.1) inherited K.4, H.5 and the enhanced-category stages. In this packet early K.3 (the 3×3 lemma, the exact category of conflations, additivity, resolution with transfers and the degree-zero comparison with Tau Ceti's resolutionEquiv, dévissage and Serre-subcategory localisation) cites only K.1, StableHomotopyKTheory H.1 and H.2 and the pinned exact-category API; the general cofinality theorem needs the late fibration theorem and the S-versus-Q comparison.

Drop the edge K.4 → K.3. Create K.3:cofinality after K.4, requiring K.4 and K.4:construction, and move K.3/cofinality-degree-zero-correction there with its id unchanged (the node records proposedParentStageId). Keep K.3 → T.3:localization-comparison, T.5, N.2, S.3 and L.1. Retain the dependency of K.5 on K.4 explicitly: add K.4:construction → K.5 and K.4 → K.5 (K.5/relative-K-theory uses the relative S-fibration, K.5/relative-versus-support the fibration and approximation theorems). The edges K.3 → K.5 and StableHomotopyKTheory:H.5:spectra → K.5 are used by no K.5 node.

### RT-AREA-ktheory-1/19 and 18: the early ring model and Milnor squares feed K.5

The ring model is one node, K.2/functorial-K-theory-of-a-ring, in K.2:plus, and K.5, K.6 and K.7 import it; K.2:plus no longer depends on the late exact-category cofinality, since its cofinality node uses group-completion cofinality from StableHomotopyKTheory H.4. K.5's Milnor-square nodes import KTheoryLowDegrees Z.1 (patching, boundary, K₀ exactness), U.1 and U.2 (elementary lifting and classical K₁), all upstream of K.5. They cannot import U.5 or U.6: U.5 cites SchemeKTheoryOperations S.3, which follows S.2 and K.6, and U.6 imports K.5's relative fibre, so either import would close a cycle.

Add K.2:plus → K.5, KTheoryLowDegrees:Z.1 → K.5, KTheoryLowDegrees:U.1 → K.5 and KTheoryLowDegrees:U.2 → K.5; K.6 and K.7 require K.2:plus as well. The spectrum-level form of degree-one surjectivity for a Milnor square (Clausen–Mathew–Morrow, Proposition 4.34), which needs π₁ of the ring model to be GL/E (KTheoryLowDegrees U.6), must be placed after U.6, not in K.5 or K.6.

### Late cofinality includes the non-functorial class-weak proof

The three new K.3 Grothendieck-class/cofinality nodes use K.4’s factorization fibration and cannot belong before it.

Move K.3/grothendieck-class-weak-equivalences, K.3/grothendieck-class-fibre-nerve and K.3/cofinality-with-factorizations to the proposed K.3:cofinality after K.4, keeping node ids stable. K.6 imports this cofinality component. Early K.3 localization and resolution retain their prior inputs and do not import these nodes.

### Early product pairing before localization consumers



Create K.7:products requiring K.4:construction and H.5:spectra only for the generic smash/suspension interface. Move the four K.7 product-construction nodes in the K.6 packet there with ids unchanged. Generic module-fibre boundary signs are H.5 inputs, independent of K-theory localization. K.3/localization-product-boundary imports this early product component; neither product S-grid construction nor its stabilization imports K.3 localization. Keep later Morita/derived and scheme operations downstream.

### Absolute degree0/1 adapter precedes the low-degree comparison aggregator



K.2:plus/zero-one-ring-comparison imports classical K0 and GL/E from U.1/U.2 and the early plus/Q theorem. K.5/relative-triples-to-components imports this adapter. K.3 classical additive triples and its Q automorphism-boundary calculation do not require K.2:low-degree-comparisons, whose K2 and relative U.6 clauses remain late. Add U.1,U.2,H.3 → K.2:plus. No dependency from K.3 or K.5 to that late aggregator is introduced.

## Source discrepancies

### GeneralAlgebraicKTheory/E-double-origin

Author chapter Kbook.V.pdf, Remark 3.4.2, p. V.22; version hashed in sourceVersions, read 2026-09-29

Use the affine plane with a double origin: glue two copies of Spec(k[x,y]) along the punctured plane. Then K₀(VB(X)) ≅ ℤ and G₀(X) ≅ K₀(Perf(X)) ≅ ℤ². The cited II.8.2.4 explicitly assumes dimension n ≥ 2, and II.Ex.9.10(d) uses the plane.

The line has a nontrivial Picard group: transition units k[t,t⁻¹]× modulo the two copies of k[t]× give Pic(X) ≅ ℤ. Rank and determinant show that the class of a nontrivial line bundle cannot equal the class of O_X, so K₀(VB(X)) cannot be just the rank group ℤ. The plane is the actual example in both of the cited chapter-II locations. The equivalence of vector-bundle categories for the plane is quoted there from EGA IV(5.9); its proof is not claimed read or formalised here.

No correction located in the searches listed; novelty is not established. Scoped to the author chapter copy, not the published edition.

- Weibel author K-book page and its errata link, checked 2026-09-29; the linked Kbook.errata.pdf returned HTTP 404 on both math.rutgers.edu host variants.
- Author chapter II, Example 8.2.4 (p. II.77) and Exercise 9.10(d) (p. II.100), read 2026-09-29: both already give the correct dimension.
- Public search for Weibel K-book errata and affine-line/double-origin correction, including AMS-domain results, 2026-09-29; no published correction located. The version of record was not obtained.

### GeneralAlgebraicKTheory/E-relative-S-proof-roles

Author chapter Kbook.V.pdf, proof of Proposition 1.7, p. V.8; version hashed in sourceVersions, read 2026-09-30

For f : B → C with Sn f = Sn B ×_{Sn C} Sn+1 C as in IV.8.5.3, Sn f is equivalent to the extension category E(C, Sn f, Sn B) of Sn B by C; (s, q) : wS.(Sn f) → wS.C × wS.(Sn B) is a homotopy equivalence; the degreewise fibration sequences are |wS.C| → |wS.(Sn f)| → |wS.(Sn B)|, with Xn = |wS.C| for all n. Realising these gives the sequence Ω|wS.(S.B)| → |wS.C| → |wS.(S.f)| → |wS.(S.B)| that the proposition states.

In IV.8.5.3 an object of Sn f is a pair (B∗, C∗) with f(B∗) = ∂0 C∗, the subcategory C sits inside Sn f as the objects (0, C = ··· = C), and the exact projection is Sn f → Sn B; so the sub term of the extension is C and the quotient term Sn B. With the roles as printed the realisation would be Ω|wS.(S.C)| → |wS.B| → |wS.(S.f)| → |wS.(S.C)|, contradicting the displayed statement and Exercise V.1.7, which identifies the first map as the one induced by f : B → C.

No correction located in the searches listed; novelty is not established. Scoped to the author chapter copy, not the published edition.

- Weibel's K-book page https://sites.math.rutgers.edu/~weibel/Kbook.html, 2026-09-30: its errata link Kbook.errata.pdf returns HTTP 404 on both host variants.
- Wayback Machine capture of http://www.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf dated 2 December 2014 (two pages, SHA-256 9944293478d96b349d8f0864c11bbae849d86aaddac0c9c1b1bc9c67fd320567), read 2026-09-30; later captures are redirects.
- Chapter IV of the same author copy, 8.5.3 p. IV.69, which states the fibration with the roles as corrected here.

### GeneralAlgebraicKTheory/E-cofinality-saturated

Author chapter Kbook.IV.pdf, Waldhausen Cofinality 8.9, p. IV.72, and Kbook.V.pdf, Corollary 2.3.1, p. V.15; versions hashed in sourceVersions, read 2026-09-30

Both statements need B to be saturated as well as cofinal: 'If B is a saturated, cofinal Waldhausen subcategory' and 'Let B be a saturated, cofinal Waldhausen subcategory'.

Taken from the author's own correction list, which amends GSM 145 p.372 (IV.8.9), p.417 (V.2.3.1), p.180 (II.9.4) and p.189 (Ex. II.9.14) in this way; the packet did not re-derive the necessity of the hypothesis. The packet uses 8.9 only through the proof of Cofinality 6.4.1 for exact categories, whose weak equivalences are the isomorphisms and hence saturated, so no statement of the packet is affected.

Corrected in the author's errata list for The K-book (AMS Graduate Studies in Mathematics 145, 2013), as preserved in the Wayback Machine capture of 2 December 2014 of Kbook.errata.pdf; the corrections are given against the published pagination and the author chapter files read here still carry the uncorrected text.

- Weibel's K-book page https://sites.math.rutgers.edu/~weibel/Kbook.html, 2026-09-30: its errata link Kbook.errata.pdf returns HTTP 404 on both host variants.
- Wayback Machine capture of http://www.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf dated 2 December 2014 (two pages, SHA-256 9944293478d96b349d8f0864c11bbae849d86aaddac0c9c1b1bc9c67fd320567), read 2026-09-30; later captures are redirects.

### GeneralAlgebraicKTheory/E-relative-S-zero-term

Author chapter Kbook.IV.pdf, proof of Lemma 8.5.4, p. IV.69; SHA-256 in sourceVersions; read 2026-09-30

For f = id_C, S₀f ≃ S₁C ≃ C. The augmented simplicial path construction contracts by its extra degeneracy to the original degree-zero term S₀C = 0; after applying wS in the other direction the augmentation target wS.S₀C is likewise contractible.

Substitution of n = 0 in the defining pullback Sₙf = SₙC ×_{SₙC} Sₙ₊₁C gives S₀f ≃ C. The immediately preceding path-space identification proves the intended conclusion with augmentation to S₀C. IV.8.9.2 on p. IV.72 also correctly uses s₀B, rather than s₀id_B, as the point.

Novelty not established; scoped only to the inspected author chapter. The live author errata PDF returned HTTP 404; search-result snippets do not establish absence from published corrections.

- Author chapter IV.8.5.3–8.5.4, p.69, and IV.8.9.2, p.72, read 2026-09-30.
- https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf opened 2026-09-30: HTTP 404.
- Web searches of the author site for errata and 8.5.4 on 2026-09-30; no correction established from the returned snippets.

### GeneralAlgebraicKTheory/E-extension-base-change-direction

Author chapter Kbook.IV.pdf, Lemma7.7 proof, p.IV.63, final two lines; read text and page image 2026-10-01; hash in sourceVersions.

The cartesian arrow is η_E:φ*(E)→E, as in the lemma statement. Its middle-term arrow is β:B′→B, the pullback inclusion, not B′→B′.

The quotient functor takes the cartesian arrow to φ:C′→C. Its source must therefore have quotient C′, namely φ*E. The defining pullback gives β:B′=B×_C C″→B. Taking C′=0 and φ the inflation 0↣C gives φ*E=(A=A→0), whose middle term is A, distinguishing it from B for a nonzero quotient C.

Novelty not established; only the inspected author chapter is implicated. The current author errata URL returned404; no assertion about the published book or absence from its corrections.

- Author chapter IV.7.3 diagram and IV.7.7 statement and proof, freshly read 2026-10-01.
- https://sites.math.rutgers.edu/~weibel/Kbook.html opened 2026-10-01 and author-site searches for K-book errata and7.7.
- https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf opened 2026-10-01:404.
