# Independent review: REV-IgusaVarietiesAndTorsionConcentration~2

**Verdict: accepted, after the corrections recorded below.**

Job `REV-IgusaVarietiesAndTorsionConcentration~2`, issue [#6909](https://github.com/CBirkbeck/tauceti-explorer/issues/6909). Reviewer: **ChatGPT GPT-6 Astra Pro**, session `gpt6astra-e19d65722997`, 2026-10-07. This session did none of the original blueprint or its revision. The reviewed input is commit [`5f858d955d09e952285131fe6ccd62875ae14dcd`](https://github.com/CBirkbeck/tauceti-explorer/commit/5f858d955d09e952285131fe6ccd62875ae14dcd). Source checking was divided into three disjoint ranges (0–38, 39–85, 86–122), followed by a root review of integration, all pinned baseline statements, and every direct external supplier contract. All corrections were made in the four authorized deliverables; this report records the independent review rather than a checkpoint.

The acceptance is of a complete **target-level planning pass**. All eight stages remain `planned`, no stage is `closed`, every implementation status remains `unchecked`, and the explicit gaps and requests remain visible. The source targets are justified after the concrete repairs; unavailable general formal infrastructure is not silently treated as implemented. The unresolved stage-level LPV/IG dependency cycle is recorded with a concrete restructuring proposal, not advertised as already removed from the atlas.

## Counts and scope

| Item | Result |
|---|---|
| Nodes | 123: 51 verified, 72 corrected, 0 added, 0 unverifiable |
| Kinds | 12 definitions, 28 constructions, 75 theorems, 8 lemmas |
| API items / unit tests | 234 API items in all nodes (224 in definitions/constructions, as counted by the checker); 137 tests; every definition and construction has at least three |
| Planets | 34; at most six per layer; no new planet |
| Baseline declarations | 17 confirmed at the exact pins; none removed or replaced |
| External prerequisite identifiers | 181 distinct contracts checked; exact nodes or existing stages with precise requests |
| Remaining requests / gaps | 47 / 18 |
| Source issues | 18 confirmed: all 14 existing entries rechecked and four new preprint-scoped entries |
| Stage statuses | Eight planned; zero closed |

The node budget and target-level granularity are preserved: no gratuitous lemma splitting, no invented owner stages and no replanning of existing Tau Ceti roadmaps. The Adic Spaces and Modular Curves examples were studied for the expected mathematical density and interfaces. The repository’s protocol, upstream guide, browser workflow and supplied red-team findings were read. The directly linked Zulip topic was not retrievable through the public renderer; the substantive guidance quoted in UPSTREAM_GUIDE was used, without claiming to have read that inaccessible thread.

## Disposition of the six preceding blockers

| Previous unresolved node | Evidence and disposition |
|---|---|
| `IG.0/unramified-local-pel-datum` | The revised carrier has the unramified matrix-field decomposition, maximal order, full self-dual lattice and B-linear isotropic similitude cocharacter with the correct weight/slope convention. The integral representative is separated from rational data and nonemptiness is an explicit R07.2 supplier obligation. The source contract is verified. |
| `IG.2/ekedahl-oort-stratification` | The universal mixed-Newton non-example is gone. The EO/zip construction and actual finite examples were rechecked. This review additionally repairs the Raynaud-chart proof and the Hasse cotangent-map direction. |
| `IG.4/finite-level-formal-models` | The source finite-presentation/integrality argument was checked in CSnc pp.61–63. Freely constructible raw records could encode nonintegral polynomial projections, so they were replaced by genuine formal-model carriers, actual generic/raw/residue links and a literal minimal period-map pullback. Unavailable normalization/étaleness/diagram predicates are explicit prototype omissions. |
| `IG.4/semiperversity` | The lower bound is the geometric costalk criterion on finite-type residue-field targets, with precise integral-pushforward and uniformly bounded two-level continuity requests. Auxiliary ℓ-power descent uses derived Cartan–Leray, not exact invariants of an ℓ-group. The early geometry/cohomology split is now reflected in the actual node prerequisites and APIs. |
| `IG.7/koshikawa-local-vanishing` | The irrelevance application is an actual node. The integral/mod-ℓ spectral action, Satake localization and finite-generation/Nakayama passage have precise supplier requests. This review adds the missing finite-local-field HS2 realization boundary and corrects the source’s Satake dimension label. |
| `IG.7/koshikawa-generic-vanishing` | Corollary 8.2 and Proposition 1.7 are separate application nodes. Their proofs retain the ordinary support derived inverse limit, right adjoint, mixed smooth/costalk exchange, orientation/dualizing object, admissible smooth duality, opposite action and disjoint spectral support. The argument localizes at the local spherical ideal; it is not replaced by the away-p minimal-stratum argument. |

## Corrections with mathematical consequences

### Integral models, local groups and actions

The global moduli problem over ℤ[1/Δ_F] is initially a stack. The suggested Scheme carrier now restricts to the representable open base where the prime-to-residue-characteristic part of N is at least 3. Its good-p level transition has a common base, and complex uniformization uses its own generic-point transition. The former N=p non-smoothness test was outside this Scheme domain; the replacement detects the missing tame-level hypothesis directly.

The internal-Hom formula now has a zero branch when the slopes are in the forbidden order, and T_pH is the kernel of the universal-cover projection. Automorphisms embed through the pair (g,g⁻¹), rather than as an unjustified closed subset of one endomorphism copy. The ordinary GL₂ test uses an actual rank-two symplectic datum. Isoclinic underlying-group liftability is available for each EL graded piece, with explicit maps to Spec k, before imposing the additional structures.

Berthelot’s domain hypothesis is used through integral closure and descent, not applied to an arbitrary perfect domain. Central-leaf smoothness uses Mantovan’s completed-local Serre–Tate argument. The constructibility proof retains its finite-bound supplier instead of invoking Chevalley on an infinite-level condition. A compact monodromy image on a leaf is not asserted cocompact in a noncompact basic J_b.

Mantovan’s monoid is defined by δ⁻¹ being an isogeny and by its slope-separation inequalities. The source’s right action and the inverse perfect-Igusa trivialization are kept explicit. The full tower left action uses inverse prime-to-p level change; its diagonal scalar kernel is then correct. Factorization through the displayed central quotient does not claim faithfulness; extra CM units provide a counterexample to that stronger assertion.

### Compactifications, period maps and Mantovan’s filtration

Boundary tests exclude the open cusp and assume actual nonempty degeneration where required. Finite-level normalizations are finite, while the perfect tower is only integral. The level-zero normalization test now assumes a normal base, and the unsupported universal non-étaleness test is removed. The EO construction uses Raynaud charts and G-zips, with V*:ω→Frob*ω. A fundamental affine-Weyl representative is distinguished from its finite EO label; complete slope divisibility is kept as the separate recorded supplier obligation.

The local period-map fibre product and global product formula are now over one common completed cyclotomic base, with explicit forgetful maps. Cusp residue discs describe the rank-one complement, not an open complement containing all higher-rank points. At infinite basic Igusa level H⁰ consists of continuous functions, not a free group algebra. The perfect-scheme cohomology comparison distinguishes the canonical pullback from the original X over F̄_p to the formal-lift cohomology from restriction to the actual special fibre. In the residue-field variant, that restriction gives the opposite-direction display after identifying the reduced special fibre with X.

Scholze–Weinstein’s tuple exact sequence has rational kernel Q_p^h; the Tate trivialization remains integral over Z_p. The original space is preperfectoid, and perfectoidness is asserted after the appropriate perfectoid-field base change and strong completion. The tuple comparison itself is already over W(k)[1/p].

The Mantovan filtration retains the full automorphism group J̃_b. One first quotients by its connected positive Banach–Colmez kernel and then by J_b(Q_p). The dualizing coefficient carries its equivariant orientation character κ and shift [2d_b]. BG3 supplies the kernel geometry; VS4 already supplies coefficient invariance and the underlying trace computation. The remaining equivariant trace/orientation compatibility is requested from VS4, and the Haar-measure compact-torsor/derived-coinvariant dictionary from S2 and SR.1. This does not follow by naïvely dualizing the usual compactly supported formula.

### Cohomology, genericity and exports

The equivariant site/topos is separated from its derived category: slicing a derived category over a complex was the wrong construction. The formal models are genuine linked models, and the empty auxiliary proposition placeholder is removed. Unavailable comparison diagrams are documented as omitted signatures rather than represented by unconstrained propositions.

The LTXZZ sufficient criterion now uses mod-ℓ coefficients and a generic auxiliary prime avoiding every finite enlargement of the bad set. One prime for an arbitrary abstract Hecke character is insufficient: a character can agree with H⁰ degrees away from that prime and be generic only there, so enlarging the bad set restores H⁰. The automorphic/Galois version gets infinitely many witnesses from Chebotarev. The generic-lift proof also needs the finite-local Euler formula alongside local Tate duality; the exact owner is the existing ClassFieldTheory layer 5.

Ordinary Levi parameters may have higher-dimensional blocks. Boundary examples distinguish finite-level arithmetic-unit cohomology from the full adelic colimit. The restriction-of-scalars codomain and functor composition order are corrected. Missing prime hypotheses are present in the geometric F_ℓ theorems, and ACC’s coefficient-prime membership is explicit. The ACC/CN coefficient integer ring has an injective Z_ℓ scalar map, excluding the spurious characteristic-ℓ domain allowed by the earlier raw assumptions.

The first two level-descent prototype implications remain. The third, arbitrary-neat-level assertion is explicitly omitted pending genuine good-prime data and a normal-cover geometric Cartan–Leray interface. Its complete mathematical target and supplier request remain in the packet and reader. Rational-prime-saturated export signatures are identified as restricted prototypes of the source’s finite-place statements.

## Pinned baseline verification

Every declaration below was read in its Lean file at the stated pin. There is no baseline deletion or replacement. Existence alone was insufficient: the review also checked the hypothesis scope and the citing use. The checker lacked a local declaration index, so these are manual source checks rather than a claim that its form check established the declarations.

| Declaration | Pinned source and scope checked |
|---|---|
| `tauceti:TauCeti.ReductiveAffineGroupSchemeCat` | [Pinned file](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean). For a field k, the full subcategory of finite-type affine group schemes over Spec k whose coordinate Hopf algebra satisfies reductiveCommHopfAlgProperty (smooth, geometrically connected, and no nontrivial connected normal smooth unipotent closed subgroup over an algebraic closure). |
| `mathlib:Matrix.unitaryGroup` | [Pinned file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/UnitaryGroup.lean). For a commutative StarRing α and finite n, unitaryGroup n α := unitary (Matrix n n α), matrices with star A * A = 1 (relative to the star on α; no hermitian form parameter). |
| `mathlib:NumberField.IsCMField` | [Pinned file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/CMField.lean). For a field K of characteristic 0, IsCMField K: K is totally complex (IsTotallyComplex) and a quadratic extension of its maximal real subfield K⁺; IsCMField.complexConj : K ≃ₐ[K⁺] K is complex conjugation (needs Algebra.IsIntegral ℚ K). NumberField.IsTotallyReal (all infinite places real) and NumberField.InfinitePlace (absolute values from embeddings K →+* ℂ) are in .../InfinitePlace/. |
| `mathlib:PerfectRing` | [Pinned file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Perfect.lean). For [Pow R ℕ] and p : ℕ, PerfectRing R p is the Prop-class asserting that x ↦ x ^ p is bijective on R (Serre's perfect ring; primality of p comes from separate CharP/ExpChar hypotheses); with [ExpChar R p] it yields frobeniusEquiv R p : R ≃+* R, and PerfectField K (every irreducible polynomial separable) follows via PerfectRing.toPerfectField. |
| `mathlib:ValuationRing` | [Pinned file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/ValuationRing.lean). For a commutative ring A that is a domain, ValuationRing A says that for all a, b ∈ A either a divides b or b divides a. |
| `mathlib:AlgebraicGeometry.Scheme.proetaleTopology` | [Pinned file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Proetale.lean). The big pro-étale topology on schemes (Bhatt–Scholze Definition 4.1.1): generated by fpqc covers by weakly étale morphisms; it is finer than the étale and coarser than the fpqc topology, and subcanonical. Scheme.ProEt S is the small pro-étale site of weakly étale S-schemes. |
| `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology` | [Pinned file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Etale.lean). For X : Scheme.{u}, X.smallEtaleTopology : GrothendieckTopology X.Etale is the small étale site, induced from the big étale topology on the category X.Etale := MorphismProperty.Over @Etale ⊤ X of schemes étale over X (objects built by Scheme.Etale.mk from an étale f : Y ⟶ X). |
| `mathlib:AlgebraicGeometry.IsAffine` | [Pinned file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/AffineScheme.lean). IsAffine X says the canonical morphism X ⟶ Spec Γ(X, ⊤) (X.toSpecΓ) is an isomorphism. |
| `mathlib:AlgebraicGeometry.IsProper` | [Pinned file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Proper.lean). f is proper if it is separated (IsSeparated: the diagonal pullback.diagonal f is a closed immersion), universally closed and locally of finite type (isProper_eq records the MorphismProperty identity). |
| `mathlib:AlgebraicGeometry.IsFinite` | [Pinned file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Finite.lean). f is finite if it is affine (IsAffineHom f: preimages of affine opens are affine) and for every affine open U ⊆ Y the ring map f.app U is finite. |
| `mathlib:AlgebraicGeometry.Scheme.Hom.normalization` | [Pinned file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Normalization.lean). For a (qcqs, as the file's universal property assumes) morphism f : X ⟶ Y, f.normalization is the relative normalization of Y in X (Stacks 035H), glued from Spec of integral closures of Γ(Y,U) in Γ(X,f⁻¹U); f = toNormalization ≫ fromNormalization with fromNormalization integral and toNormalization dominant, universal among factorizations through integral T ⟶ Y (normalizationDesc). |
| `mathlib:WittVector` | [Pinned file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Defs.lean). WittVector p R (notation 𝕎 R) is the structure of p-typical Witt vectors with coefficients coeff : ℕ → R; for [Fact p.Prime] [CommRing R] an anonymous instance `instance : CommRing (𝕎 R)` (Mathlib/RingTheory/WittVector/Basic.lean l.244, not listed in the index) gives the ring structure. |
| `mathlib:AlgebraicGeometry.IsProper.of_valuativeCriterion` | [Pinned file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/ValuativeCriterion.lean). If f is quasi-compact, quasi-separated and locally of finite type and satisfies ValuativeCriterion f, then IsProper f (Stacks 0BX5); IsProper.eq_valuativeCriterion gives IsProper = ValuativeCriterion ⊓ QuasiCompact ⊓ QuasiSeparated ⊓ LocallyOfFiniteType, and UniversallyClosed.of_valuativeCriterion (quasi-compact + ValuativeCriterion.Existence ⇒ universally closed, Stacks 01KF) is the existence half. |
| `mathlib:AlgebraicGeometry.ValuativeCriterion` | [Pinned file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/ValuativeCriterion.lean). ValuativeCriterion : MorphismProperty Scheme holds for f when every valuative commutative square (Spec K → X, Spec R → Y, R a valuation ring with fraction field K, ValuativeCommSq) has a unique lift; ValuativeCriterion.Existence / .Uniqueness are the halves. |
| `tauceti:HeckeAntiInvolution.ofAmbient` | [Pinned file](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Commutativity.lean). An involutive anti-homomorphism f : G →* Gᵐᵒᵖ of the ambient group preserving H and Δ restricts to a HeckeAntiInvolution Δ H of the Hecke datum (Δ, H) (Shimura's anti-involution data; ofAmbient_bar computes it). |
| `tauceti:HeckeAntiInvolution.onHeckeCoset` | [Pinned file](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Commutativity.lean). The induced action of a Hecke anti-involution on double cosets H\Δ/H, sending the class of g to the class of bar g; it is an involution (onHeckeCoset_onHeckeCoset) under IsHeckeTriple. |
| `tauceti:HeckeCosetModule.instRingHeckeRing` | [Pinned file](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Associativity.lean). For [IsHeckeTriple Δ H H] and a ring R', 𝕋 Δ H R' is a Ring under the double-coset convolution product (instSemiringHeckeRing gives the semiring for semiring coefficients); root namespace, extends Mathlib's HeckeRing. Abstract double-coset Hecke algebras only: no Hecke algebras of compactly supported smooth functions on locally profinite groups. |

The library-coverage register has no direct entry for this roadmap. The relevant reviewed PEL, p-divisible-group and étale/perverse audits were inspected, alongside the exact declarations. Matrix.unitaryGroup supplies only its standard star form, normalization is not a finiteness theorem, PerfectRing does not independently supply a prime/characteristic hypothesis, and the abstract Hecke ring does not supply smooth Haar convolution. These boundaries are preserved.

## External suppliers and required restructuring

Every direct external prerequisite was resolved to a supplier statement or existing stage, and the consuming proof was compared with its hypotheses and conventions. The full identifier manifest below makes this audit reproducible at the reviewed base commit. The following changes are particularly important:

- `DiamondEtaleCohomology:C6` is base-field invariance, so it is removed as a support-triangle supplier. The actual closed/open support adjunction belongs to S3; the formal-model support derived inverse limit is a separate LPV.6 request.
- `DiamondSixOperations:S4/smooth-upper-shriek-exchange` already has the required mixed variance with smoothness on the change of base. It is imported directly, keeping f eligible. Only additional diagram/equivariant compact-pushforward compatibility is requested.
- `VStackSheavesAndLisseCategories:VS4/contractibility-of-connected-banach-colmez-torsors` and `/strata-are-classifying-stacks` already own coefficient invariance. BG3 retains geometry; the Mantovan trace/orientation API request is routed to VS4.
- HS2’s finite-F level-tower statement does not by itself extend its Q_p rigidification theorem. The finite-local-field, reflex-base and μ/μ⁻¹ comparison is explicit.
- D5 is asked only for the all-(C,C⁺)-point isomorphism criterion. Canonical compactifications come from the existing C4 nodes. R2 formal invariance is not broadened from its admissible finite-presentation domain to arbitrary perfect Witt lifts.
- The early formal-model node now contains only geometry. Perverse pushforward and nearby-cycle/continuous-limit compatibility belong to semiperversity. The external LPV interface still points at the coarse IG.4 stage; the maintainer must apply the concrete split/repointing proposal before claiming stage-graph acyclicity.

The required red-team findings were checked against the supplied reports and follow-up fixes. The seven Hilbert/Katz–Hida links are proposed for removal while the unitary PEL links are retained. The torsion GL_r determinant owner remains the proposed TC.5, requested at TC.4 meanwhile. The primitive comparison substage follows P8:local-rational, as resolved by the verified fix report. The algebraic B(G) split keeps algebraic input early and does not duplicate the analytic bundle theory. No atlas edges, existing Tau Ceti roadmap files or other workers’ packets were edited.

## Primary-source editions and source issues

The primary passages and excerpts were checked in the versions below. The current 84-page Lan–Stroh author copy is distinguished from the inherited 105-page published PDF, which was unavailable. Numbered results and author-copy page locators are used in the corrected nodes. Its one-page erratum was obtained and read; it concerns componentwise §3.6 lattice exponents and does not change the hyperspecial target. The stale unread-erratum gap is removed.

Mantovan’s 2008 Proposition 12 and its Harris–Taylor specialization were obtained in the author copy, resolving the broad unread-source objection. The Harris–Taylor book and the separately identified Oort/Viehmann–Wedhorn proof-supplier boundaries remain honestly recorded. No claim is made to have checked an unavailable published edition.

| Source / consulted version | URL | SHA-256 |
|---|---|---|
| `csnc` — arXivv2,22Nov2023,90pp | [Source](https://arxiv.org/pdf/1909.01898) | `803fc16ab30fa37fa1ce08c683885040c2034bbefc6ca6567e73026006229f2e` |
| `cs17` — published Annals186(2017)649–766,118pp | [Source](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) | `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a` |
| `oz02` — published DocumentaMath7(2002)183–201 | [Source](https://emis.muni.cz/journals/DMJDMV/vol-07/09.pdf) | `9657bf441bf9bcb7a15255d5221ea93904ac94d047e4ae24c76402fa3be80dec` |
| `ham15` — arXivv2,Nov2014,56pp | [Source](https://arxiv.org/pdf/1312.0490) | `0cf0d3b677f15928f596b7471f6549fb1a735e244faa4b6f9f2cb9c64aa77471` |
| `lil21` — author67pp copy | [Source](https://www.math.columbia.edu/~chaoli/AIPF.pdf) | `6ef2d63ea2cf55d8a2648f71ed7ac84e4d32f77e9e7eaeb62b47e584e4e5e566` |
| `lil21pub` — published Annals194(2021)817–901 | [Source](https://par.nsf.gov/servlets/purl/10338690) | `91035a5233facbed975283e1d81871c91d35c3f19f46151c4b6af01c937dfd01` |
| `lil22` — published ForumMathPi10(2022)e5,71pp | [Source](https://par.nsf.gov/servlets/purl/10338691) | `97ad2fd4f9095c8fdd09772e94a1e672258bed1b84a53677757da90600ac35f2` |
| `shi09` — Berkeley author preprint44pp | [Source](https://math.berkeley.edu/~swshin/IgusaVar.pdf) | `022defdc0ebd913cdfd96d6c37b0f583dc9dc73716c23d1577c18035ff74eff8` |
| `man05` — Caltech author preprint30pp,exact existing packet hash | [Source](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf) | `6172cd3ac7579f6115356a9112d1721efe24387e1d168ab99755dca9cfbd4a2e` |
| `man08` — Caltech author preprint24pp | [Source](https://www.its.caltech.edu/~mantovan/papers/Igusa.pdf) | `d33cb66264dc8ab65816b9aecb6200a9c22c69b10fab20f67fc352912c7913ee` |
| `box15` — arXiv:1507.05922,217PDF pages; printed theorem locators read; exact packet hash | [Source](https://arxiv.org/pdf/1507.05922) | `38199d8f86df93f767dc44b6696a9f08c465e8ca938bdb99e9d04ddf2a9370ff` |
| `nie15` — arXiv:1310.2229v2,15pp; exact packet hash | [Source](https://arxiv.org/pdf/1310.2229) | `fa1d6e36462cc6cc9224f337ad2ff4e16f1aff977d8d35bc0b191d9bb26b26a5` |
| `sw13` — arXiv:1211.6357v2,13Apr2013,74pp; exact packet hash | [Source](https://arxiv.org/pdf/1211.6357) | `984411ef6c3d735a713684d4c9251fbad411a40eab33cefed8ab5c8412b09f6d` |
| `kos21` — arXiv:2106.10602v1,17pp; exact packet hash | [Source](https://arxiv.org/pdf/2106.10602) | `622ba722641718431ac6c6750df44e1682506140733f61995551209d276be99d` |
| `ls18a-author` — Current84-page author copy; hash differs from packet105-page published PDF; corresponding numbered results independently read | [Source](https://www.kwlan.org/articles/cpt-sub.pdf) | `2be447b18090d30564f8d2bccd815e9805767bbf5a16325f0d87febf4f6084ce` |
| `ls18a-erratum` — One-page current author erratum; read; §3.6 componentwise lattice exponents | [Source](https://www.kwlan.org/articles/cpt-sub-err.pdf) | `ad9d1675994950552affda1c57bcf49db6a2721ab04228af857264921f105730` |
| `ls18b` — 42-page author compilation; exact packet hash17b8895c…; alternative live URL to archived copy | [Source](https://www.kwlan.org/articles/nearby-aut.pdf) | `17b8895c946898099ed0ae86400ef5eacf6318125f0819448e7c3ae6afd98987` |
| `acc23` — Exact downloaded primary version; passage specified in the node ledger | [Source](https://arxiv.org/pdf/1812.09999) | `7c882c4dc7208e08a0b1f4b3ce6e5c5234c9815f139a4c3a372898378a24d08c` |
| `ltxzz` — Exact downloaded primary version; passage specified in the node ledger | [Source](https://par.nsf.gov/servlets/purl/10323568) | `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97` |
| `cn23` — Exact downloaded primary version; passage specified in the node ledger | [Source](https://arxiv.org/pdf/2301.10509v3) | `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3` |
| `fs` — Exact downloaded primary version; passage specified in the node ledger | [Source](https://arxiv.org/pdf/2102.13459) | `1f8040751d3424f59ae56651d990d7b2d5030e6b7cae58bc2fc683358dfc2027` |
| `shin11` — Exact downloaded primary version; passage specified in the node ledger | [Source](https://math.berkeley.edu/~swshin/StableGal.pdf) | `93f4fe322200a646f337ae8d4aa9a036a866df1bb59ad5fe7bf09373324da75b` |

All 14 existing sourceIssues have a fresh current-job verdict. E15–E18 are new in this review. CSnc E15, E16 and E18 are strictly scoped to arXiv v2: the publisher article page was checked but the attempted PDF endpoint returned HTTP 404. Koshikawa E17 is scoped to arXiv v1; the primary history lists only v1 and no journal reference. The CS24 extraction’s twelve existing issues were checked to avoid duplicates.

| Source issue | Verdict and evidence |
|---|---|
| `E1` | **confirmed**. The integral G-isogeny/outer-isomorphism hypothesis forces unit similitude and degree1 when the outer part is nonzero; printed proof changes the middle factor by p^m. The quasi-isogeny extension remains a recorded gap. CSnc arXivv2 only; for LS18a the current author theorem numbering was checked. |
| `E2` | **confirmed**. Definition3.3.7 is the pro-Igusa normalization while Lemma3.3.8 calls it finite. Finite-level normalization is finite; inverse limit is integral and generally not finite. CSnc arXivv2 only; for LS18a the current author theorem numbering was checked. |
| `E3` | **confirmed**. CSnc arXivv2 p.66 omits dual, while p.36 gives the contragredient/Tate-twist relation. ACC§2.2.19 pp.35–37 gives Hecke inversion. Scope to v2; no published PDF read. |
| `E4` | **confirmed**. Theorem4.4.1 says partially proper, but Lemma4.4.2 used in its proof requires properness. The target compactified fibre is proper, so the application is corrected. CSnc arXivv2 only; for LS18a the current author theorem numbering was checked. |
| `E5` | **confirmed**. CSnc p.38 says Theorem2.3.3; Lan–Stroh Theorem2.3.2 contains display(2.3.3), not a theorem with that number. CSnc arXivv2 only; for LS18a the current author theorem numbering was checked. |
| `E6` | **confirmed**. CSnc v2 pp.74–75 constructs f_infty from Xi(phi) Lefschetz functions, but Lemma5.6.2 p.75 says trivial coefficients. CS17 published §§5.4 pp.739–740 uses the three-map normalized-Jacquet Red without the final modulus twist. Shin author §5.5 p.37 explicitly defines Red=n-Red tensor delta_bar^(1/2); §6.1 display(6.7), authorp.43, uses Xi(phi). The trace-to-Galois normalization remains an explicit ET request; this review does not claim a new proof of endoscopic comparison. |
| `E7` | **confirmed**. CN arXivv3 p.25 cites KoshikawaTheorem1.4. Koshikawav1 p.2 Theorem1.3 is quasi-split unitary, while1.4 is the compact anisotropic/Harris–Taylor case. Scope to CNv3. |
| `E8` | **confirmed**. CSnc p.32 cites LS18a Cor5.20, but the exact comparison is LS18b Cor5.20 p.25. Both numbered sources read. CSnc arXivv2 only; for LS18a the current author theorem numbering was checked. |
| `E9` | **confirmed**. CSnc v2 p.4 states arbitrary neatK; p.36 ends with principalK(N) descent, citing Lemma2.1.1 and Proposition2.1.6. The general normal-cover/good-prime reduction is not written there. This is an omitted argument, not a counterexample; proposed explicit geometric descent request is the correct repair. Correct existing review reason locator pp.38–39 to p.36. |
| `E10` | **confirmed**. CSnc v2 p.82 calls f on the identity-coset fibre J_b×P-equivariant. The stabilizer in p.80 is P_b×P and the concluding p.83 sentence uses exactly P_b×P. The parallel p.81 group misprint is already the extraction sourceIssueE10. |
| `E11` | **confirmed**. The proof prints H¹(Q,Gder)=0. For F=Q(i), n=2, the determinant-one Hermitian forms diag(1,1,-1,-1) and diag(1,1,1,1) define a nontrivial SU(2,2)-isometry torsor already over R; their determinant agrees. Thus full H¹ need not vanish, although the Hasse kernel is trivial. Current packet uses the latter and the PEL Hasse-principle supplier. No assertion about whether the published CSnc text repairs it; that version was not read. |
| `E12` | **confirmed**. CSnc omits constant Newton polygon when spreading complete slope divisibility from the generic point. OZ02 Proposition2.3 explicitly assumes constant polygon. The p-divisible group in a trait from an ordinary elliptic generic fibre to a supersingular special fibre is generically completely slope divisible, but cannot be completely slope divisible over the connected trait because its Newton polygon changes. The current packet restores the hypothesis. CSnc published version not checked; OZ02 published article checked. |
| `E13` | **confirmed**. Koshikawav1 Lemma8.3 and proof pp.13–14 call Ri! a left adjoint, while their support triangle i_*Ri!→id→Rj_*j* uses the counit of i_*⊣Ri!. Correct to right adjoint. Current arXiv has onlyv1. |
| `E14` | **confirmed**. Both versions give d=n−j=2r−1−j although n=2r, and the preceding stratum dimension is n−1−j. The first equality is missing −1. Current packet and suggested first-kind dimension use n−1−j. Both listed versions independently read; no inference to other revisions. |
| `E15` | **confirmed**. The typed source and target of restriction of scalars determine this correction without any new mathematical theorem. |
| `E16` | **confirmed**. The printed order is not composable on a T_M-module; the corrected order follows directly from the domains. |
| `E17` | **confirmed**. Geometric Satake normalization and the trivial-cocharacter GL1 test independently identify the incorrect dimension. No claim about an unseen published edition is made. |
| `E18` | **confirmed**. The same source defines the truncation by kernel containment, and [p] separates that definition from the printed degree bound. |

The four new findings are: CSnc Lemma 6.4.2’s restriction-of-scalars codomain (E15), the reversed restriction-functor order in display (6.4.5) (E16), Koshikawa’s use of dim(r_μ) where the geometric Satake normalization needs d_μ=⟨2ρ,μ⟩ (E17), and CSnc’s degree≤d wording in the kernel-bounded truncation argument (E18). The GL₁, μ=0 unit-Hecke example separates the two dimensions in E17; multiplication by p at d=1 separates the two bounds in E18. The main vanishing and finite-point conclusions survive these corrections.

Relevant inherited source findings were also checked in their precise editions. This report does not reassert independent verification of every inherited extraction finding: in particular the distinct E55 noncompact-isoclinic counterexample was not re-established. That limitation does not alter a node’s checked primary contract.

## Per-node review ledger

Each entry covers the statement, hypotheses, proof route, locator/excerpt, acceptance examples, API/tests where applicable, and its corresponding suggested-Lean and reader content. “Corrected” includes an example, prototype, convention, locator or supplier-boundary repair; it need not mean the paper’s main theorem was false. Descriptions of defects in corrected entries refer to the reviewed input; the submitted repairs are recorded in the correction sections and appended notes. No prior `unverifiable` verdict is silently copied or merely deleted.

### IG.0

**0. `IG.0/quasi-split-unitary-datum` — verified**

CSnc §2.1 pp11–12: split skew-hermitian trace pairing, self-dual lattice, rational common similitude, symmetric-domain dimension and split-place Hecke generators match. Revised lattice finite/full/self-dual fields are substantive.

Primary passages: `csnc`: CSnc §2.1, p. 11.

**1. `IG.0/unitary-subgroup-comparison` — verified**

Lemma2.1.1 p12 gives the open-and-closed unitary-subgroup comparison. Injection and the sign/component calculation match both APIs and tests.

Primary passages: `csnc`: CSnc §2.1, Lemma 2.1.1, p. 12.

**2. `IG.0/hasse-principle` — verified**

Prop2.1.2 p12 and the corrected Hasse-kernel argument agree. E11 is independently confirmed below; norm relation Nm(z)=t^(2n) and z/t^n are correct. The current proof no longer falsely sets H¹(Q,Gder)=0.

Primary passages: `csnc`: CSnc §2.1, Proposition 2.1.2, p. 12.

**3. `IG.0/g-structure` — corrected**

Definition2.1.3 p13 matches height, principal polarization, O_F action and balanced Lie condition. Correct the negative-test wording to unequal embedding ranks; its Lean per-embedding formulation already has the right shape.

Primary passages: `csnc`: CSnc §2.1, Definition 2.1.3(2), p. 13.

**4. `IG.0/integral-model` — corrected**

Definition2.1.4–5 p13 has an explicit stack/scheme distinction. Main packet theorem is correct; the Scheme-at-all-primes prototype and N=p test need the representable-open repair and local/generic level transitions in the companion file. The Scheme prototype is restricted to the representable open base U_{D,N}; the arbitrary-prime global transition is replaced by a common-good-prime transition and a separate complex-point transition.

Primary passages: `csnc`: CSnc §2.1, Definition 2.1.4, p. 13; `csnc`: CSnc §2.1, Definition 2.1.5, p. 13.

**5. `IG.0/complex-uniformization` — corrected**

Prop2.1.6 pp13–14: Hasse principle, self-dual lattices at unramified primes and the lifting condition at ramified primes give the complex comparison. Update the one transition consumer to complexTransition after node4’s carrier repair. The uniformization consumer now uses the complex-point level transition, so it does not compose through incompatible integral-model bases.

Primary passages: `csnc`: CSnc §2.1, Proposition 2.1.6, p. 13.

**6. `IG.0/unramified-local-pel-datum` — corrected**

Prior-review blocker is fixed: unramified field/order factors, stable order, full self-dual lattice, and the actual Hodge idempotent/cocharacter data are now present. Rational framing and IntegralSlopeRepresentative are separated, and no unsupported integral nonemptiness theorem is claimed. Narrow basic⇒isoclinic acceptance to the balanced unitary datum.

Primary passages: `cs17`: CS17 §4.2, p. 697; `cs17`: CS17 §4.2, p. 696.

**7. `IG.0/newton-map` — verified**

CS17 §4.3 p714 gives Newton stratification, locally closed strata and the stated order/closure convention. Revised integral framing is not inferred merely from a rational isocrystal. EO/isomorphism-class negative test is plausible but its explicit witness is a planned test rather than source-certified implementation.

Primary passages: `cs17`: CS17 §4.3, p. 714.

**8. `IG.0/splitting-symplectic-filtrations` — verified**

CSnc Prop2.2.1 p14: the packet fixes the source’s omitted Cartier dual in pairing the multiplicative and étale quotient pieces. The canonical connected/multiplicative decomposition and optional noncanonical symplectic splitting are distinguished. General filtration signature is deliberately not fully encoded.

Primary passages: `csnc`: CSnc §2.2, Proposition 2.2.1, p. 14.

**9. `IG.0/internal-hom-p-divisible-group` — corrected**

CS17 Lemmas4.1.5–6 pp693–694 verify the stable-image construction and torsion relation. Acceptance height product must be conditional on ordered slopes; its own μ-to-étale non-example catches the defect.

Primary passages: `cs17`: CS17 §4.1, Lemma 4.1.5, p. 693; `cs17`: CS17 §4.1, Lemma 4.1.6, p. 694.

**10. `IG.0/internal-hom-dieudonne-module` — verified**

CS17 Lemmas4.1.7–8 pp695–696, plus O_F-linear extension p706, match the covariant Dieudonné nonpositive-slope truncation and T_p identification. Positive slopes have no nonzero invariant vector; E36 independently checked.

Primary passages: `cs17`: CS17 §4.1, Lemma 4.1.7, p. 695; `cs17`: CS17 §4.1, Lemma 4.1.8, p. 695.

**11. `IG.0/internal-hom-slopes` — corrected**

CS17 Corollaries4.1.10–11 p696 and Proposition4.1.2 p691 support the statement. Correct the proof’s zero branch and identify T_pH as the kernel of H̃→H.

Primary passages: `cs17`: CS17 §4.1, Corollary 4.1.10, p. 696; `cs17`: CS17 §4.1, Corollary 4.1.11, p. 696.

**12. `IG.0/completely-slope-divisible` — verified**

CSnc Definition2.3.3/Lemma2.3.4 pp18–19 and OZ02 Definition1.2 p185, Proposition1.3 p186 support the revised constant-Newton-polygon spreading hypothesis. The actual quotient maps and nonzero graded heights in the Lean filtration satisfy the prior review. E12 independently confirmed.

Primary passages: `csnc`: CSnc §2.3, Definition 2.3.3, p. 18; `csnc`: CSnc §2.3, Lemma 2.3.4, p. 19.

**13. `IG.0/slope-filtration-existence` — verified**

OZ02 Proposition1.3 p186 and Proposition2.3 p189 verify perfect-base splitting and generic spreading with constant polygon. Integral framing nonemptiness remains the named R07.2 supplier rather than a false rational shortcut.

Primary passages: `oz02`: Proposition 1.3, p. 186; `oz02`: Proposition 2.3, p. 189; `cs17`: CS17 §4.3, p. 714.

**14. `IG.0/automorphism-group-of-universal-cover` — corrected**

CS17 Definition4.2.9/Lemma4.2.10 pp703–704 verified. Closed embedding uses both an automorphism and its inverse; the locally profinite target uses continuous maps. The GL2 test must specify the standard symplectic PEL datum, not only its underlying ordinary group.

Primary passages: `cs17`: CS17 §4.2, Lemma 4.2.10, p. 703; `cs17`: CS17 §4.2, Definition 4.2.9, p. 703.

**15. `IG.0/structure-of-automorphism-group` — verified**

CS17 Proposition4.2.11 pp704–708 and Hamacher’s root calculations support dimension <2ρ,ν_b>. Current packet already retains the E42 sign convention and E43 separate middle-slope count; both source problems were independently checked.

Primary passages: `cs17`: CS17 §4.2, Proposition 4.2.11, p. 704.

**16. `IG.0/liftable-automorphisms` — corrected**

CSnc Proposition2.2.3/Theorem2.2.4 pp15–16 verified, including seminormality, finite bound m′, and finite étale torsor descent. Add the general isoclinic underlying-group prototype: the existing balanced G-structure type cannot be instantiated by each EL graded piece. Companion snippet keeps specialized compatibility data. The general underlying isoclinic torsor and the full decorated specialization are both present, with explicit structural maps to Spec k; graded EL pieces are not forced into a balanced full-PEL carrier.

Primary passages: `csnc`: CSnc §2.2, Proposition 2.2.3, p. 15; `csnc`: CSnc §2.2, Theorem 2.2.4, p. 15.

**17. `IG.0/truncated-rz-isomorphism-locus` — corrected**

CSnc Lemma2.2.5 pp16–17 verifies finiteness of the isomorphism locus. Bounded truncations are isogenies with kernel in Y[p^d]. The proof’s degree≤d phrase must use this bound; it is also a source-level slip.

Primary passages: `csnc`: CSnc §2.2, Lemma 2.2.5, p. 16.

**18. `IG.0/isomorphism-torsors` — corrected**

CSnc Propositions2.2.6–7 p17 verify both torsor assertions. Over a regular base the trivializing cover is the actual torsor over the perfection followed by the perfection map; no section over the perfection alone is asserted.

Primary passages: `csnc`: CSnc §2.2, Proposition 2.2.6, p. 17; `csnc`: CSnc §2.2, Proposition 2.2.7, p. 17.

**19. `IG.0/central-leaf` — corrected**

CSnc Definition2.3.1 pp17–18 and Mantovan2005 Proposition1 pp7–8 verify the central leaf. Replace the circular/isoclinic-only Igusa smoothness argument by Mantovan’s completed-local-ring Serre–Tate argument. Existing finite-set basic test is correctly narrower than an assertion that every leaf is one point.

Primary passages: `csnc`: CSnc §2.3, Definition 2.3.1, p. 17; `cs17`: CS17 §4.3, Definition 4.3.6, p. 716.

**20. `IG.0/central-leaf-dimension` — verified**

Hamacher Corollary7.8(2) p30 and CS17 Remark4.2.13 p708 support the dimension formula. Passing to the perfect pro-étale Igusa cover preserves dimension. Nonempty hypotheses in numerical dimension assertions are present.

Primary passages: `ham15`: Corollary 7.8 (2), p. 30 (arXiv:1312.0490v2); `cs17`: CS17 §4.2, Remark 4.2.13, p. 708.

**21. `IG.0/serre-tate-semi-abelian` — verified**

CSnc Theorems2.4.1–2 pp20–22 verify the no-noetherian isogeny-level equivalences and global split-torus semi-abelian extension version. Nilpotence conditions and quotient construction are stated; ordinary abelian Serre–Tate remains owned by its supplier.

Primary passages: `csnc`: CSnc §2.4, Theorem 2.4.1, p. 20; `csnc`: CSnc §2.4, Theorem 2.4.2, p. 21.

**22. `IG.0/pel-rapoport-zink-space` — corrected**

CS17 Definition4.2.1/Theorem4.2.2 pp697–698 verify the unramified PEL RZ functor/formal smoothness, including p=2 in type AC. Pairs now deform IntegralPDivB against rational framing, correctly. Update the truncated API phrase to genuine isogenies, as in node17. GL_n×G_m Lubin–Tate components Z×Z are appropriate. The truncated API and its Lean description use genuine isogenies with kernel contained in X_b[p^d].

Primary passages: `cs17`: CS17 §4.2, Definition 4.2.1, p. 697; `cs17`: CS17 §4.2, Theorem 4.2.2, p. 698.

**23. `IG.0/berthelot-without-noetherian` — verified**

CS17 Lemma4.2.16 pp710–711 and corrected Remark4.2.17 verify extension over valuation/integrally closed domains with constant polygons. E45’s missing normality and E46’s scalar Frobenius sign were checked; current statement uses the safe integrally closed scope.

Primary passages: `cs17`: CS17 §4.2, Lemma 4.2.16, p. 710; `cs17`: CS17 §4.2, Remark 4.2.17, p. 710.

**24. `IG.0/constant-newton-polygon-over-perfect-rings` — corrected**

CS17 Lemma4.3.15/Remark4.3.16 pp721–723 and OZ02 Corollary3.6 p196 support the statement. The proof still jumps from a domain to a normal-domain theorem; explicitly insert algebraic integral closure and unique v-descent (E56). Bounded glued maps are quasi-isogenies (E57).

Primary passages: `cs17`: CS17 §4.3, Lemma 4.3.15, p. 721; `cs17`: CS17 §4.3, Remark 4.3.16, p. 721.

**25. `IG.0/quasi-isogeny-torsor` — corrected**

CS17 Proposition4.3.13 pp720–724 supports the natural torsor. The acceptance still repeats false cocompact monodromy while citing its correction. Remove that sentence; compact image on a central leaf is valid.

Primary passages: `cs17`: CS17 §4.3, Proposition 4.3.13, p. 720.

**26. `IG.0/drinfeld-level-newton-strata` — verified**

Li–Liu author pp34–35 and published pp859–860 verify the formal-height j+1 convention, reduced Newton strata and dimension n−1−j. E14 is independently confirmed in both versions. Harris–Taylor book is an explicitly unread supplier, not silently verified.

Primary passages: `lil21`: Proof of Lemma 7.3 and footnote 14, p. 34.

**27. `IG.0/isomorphism-locus-constructible` — corrected**

CSnc p17 explicitly invokes Oort Corollary2.5 for constructibility; Man05 Proposition1 pp7–8 gives the PEL central-leaf extension. Treat this as a valid named roadmap contract with an honest unread Oort/Vasiu proof boundary. Do not invoke Chevalley on an unexplained infinite-level liftability functor.

Primary passages: `csnc`: CSnc §2.2, proof of Lemma 2.2.5, p. 17; `man05`: Proposition 1, §3, p. 7 of the Caltech preprint (proof p. 8).

**28. `IG.0/refined-drinfeld-strata` — corrected**

Li–Liu II §4.3 p58 gives the indexing and closure display. Étale height is lower semicontinuous. The reverse closure inclusion can be supplied by Man08 §3.2 closed vanishing-on-M cover and Proposition11 finite flatness; no cycle through the later smoothness theorem is needed.

Primary passages: `lil22`: §4.3, after Theorem 4.21, p. 58; `lil22`: §4.3, display (4.1), p. 58.

### IG.1

**29. `IG.1/perfect-igusa-variety` — verified**

CSnc Corollary2.3.2 p18 and CS17 Definition4.3.1/Lemma4.3.4/Corollary4.3.5 pp715–716 support the perfect Igusa functor for all k-algebras. The revised reverse map is a quasi-isogeny, as E49 requires; the nonempty condition on the non-finite-type test is present.

Primary passages: `csnc`: CSnc §2.3, Corollary 2.3.2, p. 18; `cs17`: CS17 §4.3, Corollary 4.3.5, p. 715; `cs17`: CS17 §4.3, Lemma 4.3.4, p. 715.

**30. `IG.1/igusa-isogeny-invariance` — verified**

CSnc p18 and the CS17 moduli-up-to-isogeny equivalence give the isogeny-invariant perfect variety and equivariance. It is a correspondence on leaves; no canonical identification of the leaves themselves is asserted.

Primary passages: `csnc`: CSnc §2.3, after Corollary 2.3.2, p. 18.

**31. `IG.1/mantovan-igusa-variety` — corrected**

CSnc Definition2.3.5/Remarks2.3.6–7 pp19–20, CS17 pp716–718, Shin Definition5.3 p16 and Man05 Proposition4 p11 independently verify finite étale graded-piece Igusa towers. Replace the jMonoid description by Mantovan’s inverse-isogeny kernel inequalities from pp11–12 (also Shin p16). Apply the general isoclinic/EL theorem, not balanced full-G objects to individual pieces. Mantovan’s actual inverse-isogeny monoid and slope-separation inequalities are specified. Its source right action is recorded using the opposite monoid, with the inverse-action dictionary under perfect Igusa trivializations.

Primary passages: `csnc`: CSnc §2.3, Definition 2.3.5, p. 19; `cs17`: CS17 §4.3, Remark 4.3.7, p. 716; `shi09`: Definition 5.3, §5, p. 16 of the Berkeley preprint; `man05`: Proposition 4, §4, p. 11 of the Caltech preprint; `man05`: §4, definition of S_b on author-copy pp.11–12; Lemma 5 and following paragraph p.12; Lemma 6 p.13.

**32. `IG.1/perfection-of-mantovan` — corrected**

CS17 Proposition4.3.8 pp717–718 and CSnc Remark2.3.7 p20 verify perfection and cohomology comparison. The main statement and prototype point in the right direction; the second source-match description reverses it and should be fixed. The perfection comparison keeps the canonical direction and the inverse-trivialization action dictionary.

Primary passages: `cs17`: CS17 §4.3, Proposition 4.3.8, p. 717; `csnc`: CSnc §2.3, Remark 2.3.7, p. 20; `man05`: §4, Lemma 5 p.12 and the cohomology action on pp.13–14 of the author copy.

**33. `IG.1/igusa-faithfully-flat` — verified**

CS17 Corollary4.3.9 p718 verifies faithful flatness and the fpqc torsor. The nonreduced assertion is valid in the packet’s balanced unitary setting, where nonisoclinic means nonbasic. A future general local PEL extension must use positive d_b, since torus-decorated ordinary examples have no formal directions.

Primary passages: `cs17`: CS17 §4.3, Corollary 4.3.9, p. 718.

**34. `IG.1/igusa-group-actions` — corrected**

CS17 p718 and the moduli description support commuting group actions, finite-projection open stabilizers and diagonal ±p^Z kernel. Factoring through that quotient does not show faithfulness: additional central units such as i for F=Q(i) also act trivially. The full tower left action uses inverse prime-to-p level action. Diagonal scalars then act trivially; the source finite correspondence labelled g still sends η to η∘g. Factorization through the central quotient is asserted without false faithfulness.

Primary passages: `cs17`: CS17 §4.3, after Proposition 4.3.8, p. 718; `cs17`: Definition 4.3.1 and Lemma 4.3.4, published pp.715–716; `man05`: §4, prime-to-p Hecke action on author-copy p.13.

**35. `IG.1/igusa-cohomology` — verified**

Finite-level étale finiteness, dimension bounds and the CS17 tower action support the cohomology package. The coefficient inverse limit is taken before the level colimit, and compact support uses integral transition pullback. The toy Euler-characteristic non-example is genuinely discriminating.

Primary passages: `csnc`: CSnc §2.8, Proposition 2.8.2, p. 34; `cs17`: CS17 §4.3, after Proposition 4.3.8, p. 718.

**36. `IG.1/alternating-igusa-cohomology` — corrected**

CS17 §5.2 p731 gives the direct limit alternating admissible representation and unramified part. Write colim explicitly. The revised Cardinal-valued invariant dimension handles non-open K^S×{1}; admissibility is tested only on compact opens.

Primary passages: `cs17`: CS17 §5.2, p. 731.

**37. `IG.1/harris-taylor-igusa-varieties` — verified**

Li–Liu author pp34–35, published pp859–860 (footnote15), and Man08 Definition5 p7 independently distinguish first-kind étale-level trivialization from the extra formal Mantovan cover. The corrected j=formal-height-minus-one convention and finite disjoint-copy comparison are consistent.

Primary passages: `lil21`: Proof of Lemma 7.3 and footnote 15, p. 35.

**38. `IG.1/refined-strata-closures-smooth` — corrected**

Li–Liu II pp60,62–63 and newly read Man08 §3.2 pp9–12/§4.2.4 p22 verify smooth closures in the stated HT model, with the versality condition made explicit and properness supplied separately. Add p60 to the first-kind comparison locator and narrow the old Man08-unread gap. Mantovan Proposition 12 and §4.2.4 were obtained directly in the 24-page author copy. The broad unread-source gap is removed; the remaining Harris–Taylor formal interface is named precisely.

Primary passages: `lil22`: Li–Liu II §4.3, p.60 for the isomorphism with I^h_m as a k-scheme; proof of Proposition4.25, p.62 for smoothness; proof of Theorem4.21, p.63; introduction p.7; `man08`: Proposition 12, author-copy p.12; `man08`: §4.2.4, author-copy p.22.

### IG.2

**39. `IG.2/well-positioned-subscheme` — corrected**

Definition and chart comparison verified at CSnc pp.37–38; boundary data, refinement, Hecke and closure API agree with Lan–Stroh. Tighten the negative example by excluding the open cusp, which is an allowed cusp label and otherwise makes the suggested universal example false. Four tests remain.

Primary passages: `csnc`: CSnc §3.1, Definition 3.1.1, p. 37; `csnc`: CSnc §3.1, Remark 3.1.2, p. 38.

**40. `IG.2/partial-compactifications` — corrected**

CSnc p.38 and Lan–Stroh Theorem2.3.2 verified. The negative test omitted the nonempty Y₀ hypothesis already present in the suggested Lean example. The current author copy is84pp, so its corresponding theorem is pp.17–19 rather than published pp.21–23; no claim to have read the inaccessible105pp bytes.

Primary passages: `csnc`: CSnc §3.1, p. 38; `ls18a-author`: Theorem 2.3.2 with display (2.3.3), author-copy pp.17–19; Definition 2.3.1, pp.16–17.

**41. `IG.2/lan-stroh-boundary-charts` — verified**

CSnc p.41 identifies the leaf boundary completion; general well-positioned extension and smoothness verified directly in Lan–Stroh Theorem2.3.2(5), Proposition2.3.13 (current author copy pp.17–19,22–23). Smooth cones and the perfect base-field reduction are explicit.

Primary passages: `csnc`: CSnc §3.2, p. 41 (citing [LS18a, Thm 2.3.2(5)]).

**42. `IG.2/partial-minimal-closed` — verified**

CSnc Proposition3.1.3 p.38, including closed boundary data and closure-complement proof, matches. The subset Y₀ lies in Y′₀ when Y is closed in Y′; no extra boundary closure assumption is silently used.

Primary passages: `csnc`: CSnc §3.1, Proposition 3.1.3, p. 38.

**43. `IG.2/leaves-are-well-positioned` — verified**

CSnc Proposition3.1.4 pp.38–39 and Lemma3.1.5 p.39 match the symplectic multiplicative/abelian/étale decomposition, empty alternative, and smooth toroidal compactification. The open cusp exception is correctly present in the acceptance.

Primary passages: `csnc`: CSnc §3.1, Proposition 3.1.4, p. 38; `csnc`: CSnc §3.1, Lemma 3.1.5, p. 39.

**44. `IG.2/connected-part-at-boundary` — corrected**

CSnc Propositions3.2.1–3.2.2 pp.39–40 verified. Qualify the prose about failure of finite flatness: a leaf with no étale part has no boundary and its universal object is abelian, so its p-torsion is finite flat.

Primary passages: `csnc`: CSnc §3.2, Proposition 3.2.1, p. 39; `csnc`: CSnc §3.2, Proposition 3.2.2, p. 40.

**45. `IG.2/toroidal-igusa-finite-level` — corrected**

CSnc Definition3.2.5 and Theorems3.2.4/3.2.6 pp.40–42 match the finite étale extension, liftability, scalar and charts. Add m≥1 and nonempty degeneration to the packet negative example, as the Lean prototype already does. Level0 and empty-boundary tests match.

Primary passages: `csnc`: CSnc §3.2.3, Theorem 3.2.4, p. 40; `csnc`: CSnc §3.2.3, Theorem 3.2.6, p. 41.

**46. `IG.2/perfect-toroidal-igusa-variety` — corrected**

CSnc Theorem3.2.8/Definition3.2.9/Remark3.2.10 pp.42–43 verified. The cusp example must retain the similitude scalar; restrict the broad negative test to the explicitly cited modular-curve witness. The main pro-étale assertion is over the perfected base, not the original smooth leaf.

Primary passages: `csnc`: CSnc §3.2.7, Theorem 3.2.8, p. 42; `csnc`: CSnc §3.2.7, Remark 3.2.10, p. 42.

**47. `IG.2/igusa-boundary-charts` — verified**

CSnc Proposition3.2.11 p.43, Proposition3.2.12 pp.43–44 and Theorem3.2.13 p.44 verified. Explicitly read the symmetric lifts of X[1/p], the perfected torus torsor and the fixed splitting. Suggested file says part(2) is not encoded; it remains an explicit mathematical target in packet and reader, not a claim of formalization.

Primary passages: `csnc`: CSnc §3.2.7, Proposition 3.2.11, p. 43; `csnc`: CSnc §3.2.7, Theorem 3.2.13, p. 44.

**48. `IG.2/unit-similitude-quasi-isogeny` — verified**

CSnc footnote15 p.45 read. The extra split-in-F₀ hypothesis makes the choice of unit similitude explicit: choose maps separately on one half of each conjugate pair and use inverse dual maps on the other half. The node does not assert this construction in the inert case.

Primary passages: `csnc`: CSnc §3.3.1, footnote 15, p. 45.

**49. `IG.2/toroidal-isogeny-invariance` — verified**

CSnc Corollary3.2.14 pp.44–45 independently checked. The source proof changes only the middle polarization by p^m and does not prove the asserted unit-similitude G-quasi-isogeny extension. The packet correctly records this exact missing proof as a gap; accepted as a target with an honest planning terminal, not as an established theorem.

Primary passages: `csnc`: CSnc §3.2.7, before Corollary 3.2.14, p. 44; `csnc`: CSnc §3.2.7, Corollary 3.2.14, p. 44.

**50. `IG.2/ekedahl-oort-stratification` — corrected**

Prior requested correction is satisfied: mixed-Newton universal witness was replaced by disjoint distinct EO labels. New correction supplies the actual G-zip boundary construction and a direct primary smoothness citation. Correct the cotangent Verschiebung direction and distinguish equality of a chosen Hasse section from the weaker weight/nonvanishing signature actually tested.

Primary passages: `csnc`: CSnc §3.3.1, proof of Theorem 3.3.2, p. 45; `box15`: Theorem C, p. 17 (§1.5 of the Introduction; with Theorem B, p. 17); in the text Theorem 6.2.3 and Corollary 6.2.4, p. 190; `ls18a-author`: Proposition3.5.1(3)–(4), p.41; Proposition3.5.5 and Corollary3.5.8, pp.41–42 (84-page current author copy).

**51. `IG.2/eo-strata-minimal-affine` — verified**

Boxer TheoremC p.17, Theorem6.2.3 and Corollary6.2.4 p.190 verified, along with CSnc p.45. The Hasse section lies on a projective stratum closure and comes from an ample Hodge power; its nonvanishing locus is affine.

Primary passages: `box15`: Theorem C, p. 17 (§1.5 of the Introduction; with Theorem B, p. 17); in the text Theorem 6.2.3 and Corollary 6.2.4, p. 190; `csnc`: CSnc §3.3.1, proof of Theorem 3.3.2, p. 45.

**52. `IG.2/fundamental-eo-stratum-in-newton-stratum` — corrected**

Read Nie pp.1–4 and the proof of Proposition1.5. The affine fundamental representative must not be conflated with the finite EO label. The central-leaf conclusion is supported by minimality; the suggested theorem additionally claims complete slope divisibility, which belongs to a separately recorded gap and must not be silently included here.

Primary passages: `nie15`: Proposition 1.5, p. 3 (arXiv:1310.2229v2; proof on p. 12); `nie15`: Corollary 1.6, p. 4 (arXiv:1310.2229v2); `nie15`: Theorem1.4, p.3 (arXiv:1310.2229v2), with Corollary1.6 p.4.

**53. `IG.2/affineness-transfer-lemma` — verified**

CSnc Lemma3.3.3 p.46 verified line by line. Stein factorization, affine target factorization, descent of affineness under finite surjections, and the closed-locus quasi-finiteness check match the listed proof.

Primary passages: `csnc`: CSnc §3.3.1, Lemma 3.3.3, p. 46.

**54. `IG.2/leaf-minimal-compactification-affine` — corrected**

CSnc Theorem3.3.2 pp.45–46 verified. Prior conditional-affineness repair is sound, but the no-étale acceptance should not restore an unconditional arbitrary-representative assertion that the node’s corrected proof does not establish. Restrict that check to the fundamental representative or the stated part(2) hypotheses.

Primary passages: `csnc`: CSnc §3.3.1, Theorem 3.3.2, p. 45; `csnc`: CSnc §3.3.1, proof of Theorem 3.3.2, p. 45.

**55. `IG.2/perfect-minimal-igusa` — corrected**

CSnc Proposition3.3.4 p.46 read. Prior relative-Stein/conditional-affineness fix verified. Clarify that finiteness belongs to finite approximations, not the perfect infinite Igusa Stein object itself. Definitions and three tests otherwise match, with nonempty/infinite Γ hypotheses in Lean.

Primary passages: `csnc`: CSnc §3.3.1, Proposition 3.3.4, p. 46.

**56. `IG.2/minimal-igusa-compactification` — corrected**

CSnc Definition3.3.7/Lemma3.3.8 pp.46–47 and Theorem3.3.15 p.50 checked. The finite-versus-integral correction E2 is right. The level0 test needs normality of the base (which the cited sources do not state generally); normalization finiteness itself needs excellence. Delete the fourth unsupported universal non-étale test; the source only warns that étaleness cannot be expected in general. Three tests remain.

Primary passages: `csnc`: CSnc §3.3.6, Definition 3.3.7, p. 46; `csnc`: CSnc §3.3.6, Lemma 3.3.8, p. 47; `csnc`: CSnc §2.8, Theorem 2.8.1, p. 33.

**57. `IG.2/igusa-cusp-labels` — verified**

CSnc Definition3.3.10 and the level/stabilizer discussion pp.47–48 verified. At m=0 the p-level filtration is indeed trivial, and positive-rank labels require an étale part. Three tests and stated API match.

Primary passages: `csnc`: CSnc §3.3.9, Definition 3.3.10, p. 47; `csnc`: CSnc §3.3.9, p. 47.

**58. `IG.2/toroidal-igusa-boundary-strata` — verified**

CSnc Theorem3.3.12 pp.48–50 and Definition3.3.13 p.49 verified, including the smaller Igusa factor, extra splitting of multiplicative torsion, finite étale abelian-scheme map, and Γ_Z versus Γ_Ztilde distinction.

Primary passages: `csnc`: CSnc §3.3.11, Theorem 3.3.12, p. 48; `csnc`: CSnc §3.3.11, proof of Theorem 3.3.12, p. 50.

**59. `IG.2/minimal-igusa-boundary-strata` — corrected**

CSnc Theorem3.3.15 p.50 proves the decomposition and smaller Igusa identification. It does not prove an iff closure rule after forgetting p-level labels; use the necessary condition already encoded in the suggested theorem.

Primary passages: `csnc`: CSnc §3.3.14, Theorem 3.3.15, p. 50.

### IG.3

**60. `IG.3/good-reduction-locus` — corrected**

CSnc Theorem2.6.2 p.30 and the good-reduction definition p.31 verified. The two existing modular examples were contradictory as topological statements: if the complement were open then S° would be closed. Restrict the cusp-disc equality to rank-one geometric points, preserving the higher-rank distinction central to IG.3.

Primary passages: `csnc`: CSnc §2.6, p. 31; `csnc`: CSnc §2.6, Theorem 2.6.2, p. 30.

**61. `IG.3/good-reduction-locus-cohomology` — verified**

CSnc Proposition2.6.4 pp.31–32 and Lan–Stroh Corollary5.20 p.25 (exact42-page compilation/hash) read. The packet deliberately plans only N prime to p and acknowledges the stronger source theorem. E8’s bibliographic correction is confirmed.

Primary passages: `csnc`: CSnc §2.6, Proposition 2.6.4, p. 31; `csnc`: CSnc §2.6, proof of Proposition 2.6.4, p. 32; `ls18b`: Corollary 5.20, p. 25 of the authors' compilation.

**62. `IG.3/flag-points-and-p-divisible-groups` — verified**

CSnc §2.7 p.33, §4.1 p.51 and §4.3 p.54 read with SW TheoremB. The Hodge–Tate subspace/twist, G-structure adapter, special fibre and splitting agree. Suggested file explicitly marks unencoded splitting data, so no completed formalization is inferred.

Primary passages: `csnc`: CSnc §4.1, p. 51; `csnc`: CSnc §2.7, p. 33.

**63. `IG.3/flag-newton-strata-dimension` — verified**

CS17 Propositions4.2.19–4.2.23 pp.711–713 and CSnc Theorem2.7.3 p.33 checked. The E7 converse must choose y in Fl^b; the packet does. The reflex-field-ℚ assumption is what identifies the ordinary stratum with rational flags. Prior nonnoetherian dimension-supplier repair is retained.

Primary passages: `cs17`: CS17 §4.2, Proposition 4.2.23, p. 713; `csnc`: CSnc §2.7, Theorem 2.7.3, p. 33; `csnc`: CSnc §2.7, p. 33.

**64. `IG.3/local-hodge-tate-period-map` — corrected**

CS17 Theorem4.2.4 pp.699–701 and Propositions4.2.5–4.2.6 pp.702–703 verified, with SW rational conditions. Add Cor5.1.2 for surjectivity in the geometric exact sequence (E37), and scope the negative test to the GL₂ example already used by Lean, since arbitrary local data may have one stratum. Completion of the cyclotomic base is implicit in adic notation and made explicit in node65.

Primary passages: `cs17`: CS17 §4.2, Theorem 4.2.4, p. 699; `cs17`: CS17 §4.2, Proposition 4.2.5, p. 702; `cs17`: CS17 §4.2, Proposition 4.2.6, p. 702.

**65. `IG.3/local-period-fibres` — corrected**

CS17 Proposition 4.2.14 p.709 and inherited E44 were checked directly. In the reviewed input, the generic common-base comment was insufficient because the suggested flag fibre product was still over Ĕ. The submitted file now retains the cyclotomic structural maps through explicit helpers and forms the fibre product over the base-changed flag variety.

Primary passages: `cs17`: CS17 §4.2, Proposition 4.2.14, p. 709.

**66. `IG.3/integral-extension-lemma` — verified**

CS17 Lemma4.2.15 pp.709–710 verified with integrally closed R⁺ and constant Newton polygons of both groups. The valuation argument only extends integral coefficients under that normality condition; the supplier correction of Remark4.2.17 is retained.

Primary passages: `cs17`: CS17 §4.2, Lemma 4.2.15, p. 709.

**67. `IG.3/local-period-surjective-on-stratum` — verified**

CS17 Lemma4.2.18 p.711 verified. The classification supplies a quasi-isogeny on the special fibre; inversion reconciles the moduli directions when needed. The field is complete algebraically closed over the cyclotomic local base.

Primary passages: `cs17`: CS17 §4.2, Lemma 4.2.18, p. 711.

**68. `IG.3/automorphism-group-dimension` — corrected**

CS17 Proposition4.2.22 pp.712–713 and Proposition4.2.11 p.704 checked. The packet correctly restricts the quoted extension-lemma proof to characteristic0; direct formal-polydisc reasoning also supplies the characteristic-p case of E47. Clarify that tilting requires a perfectoid field extension when the original K is not perfectoid.

Primary passages: `cs17`: CS17 §4.2, Proposition 4.2.22, p. 712.

**69. `IG.3/canonical-lift-of-igusa` — corrected**

CS17 Lemmas4.3.10/4.3.12 pp.719–720 and CSnc pp.54–55 read. Unique flat Witt lift and the three tests are appropriate; prior nonperfect example is correctly about nonunique automorphisms, not nonisomorphic smooth affine lifts. The old product proof incorrectly left A unchanged; the source replaces it by a quasi-isogenous abelian scheme.

Primary passages: `cs17`: CS17 §4.3, Lemma 4.3.10, p. 719; `cs17`: CS17 §4.3, Lemma 4.3.12, p. 720; `csnc`: CSnc §4.3, p. 54.

**70. `IG.3/infinite-level-newton-space` — corrected**

CS17 Definition4.3.17/Remark4.3.18/Corollary4.3.19 pp.724–725 read. Correct finite versus profinite indexing and specialize the ordinary dimension test to split GL₂: arbitrary μ-ordinary local data do not satisfy d_ord=d_μ. The product construction itself matches the source.

Primary passages: `cs17`: CS17 §4.3, Definition 4.3.17, p. 724; `cs17`: CS17 §4.3, Corollary 4.3.19, p. 724.

**71. `IG.3/product-formula` — corrected**

CS17 Lemma4.3.20 pp.725–726 read, including the SW integral isomorphism and extension lemma. Preserve α and the corrected quasi-isogeny direction (E54), and make the common completed cyclotomic base explicit. Replace the informal global ordinary product assertion by the precise fibrewise consequence.

Primary passages: `cs17`: CS17 §4.3, Lemma 4.3.20, p. 725.

**72. `IG.3/rank-one-cohomology-lemma` — verified**

CS17 Lemmas4.4.1–4.4.2 pp.726–727 read in full. General geometric points use open bounded C⁺; the rank-one-removal lemma is for locally constant sheaves and a quasicompact open. The suggested signature explicitly models the perfectoid/rank-one case rather than claiming its carriers encode all analytic points.

Primary passages: `cs17`: CS17 §4.4, Lemma 4.4.2, p. 727; `cs17`: CS17 §4.4, Lemma 4.4.1, p. 726.

**73. `IG.3/perfect-scheme-lift-cohomology` — corrected**

CS17 Lemma4.4.3 pp.728–729 and E61/E62 read. Use the actual canonical pullback direction when X is over 𝔽̄_p and the residue field is larger. The suggested map to the special fibre is valid for the separately stated residue-field version, but does not by itself represent this first pullback.

Primary passages: `cs17`: CS17 §4.4, Lemma 4.4.3, p. 728.

**74. `IG.3/newton-strata-correspond` — verified**

CS17 pp.728–729 give the rank-one Newton correspondence and the quasicompact open Newton part of the fibre; Propositions4.2.6/Remark4.2.8 supply the local/global compatibility. Properness or prior good-reduction restriction is retained.

Primary passages: `cs17`: CS17 §4.2, Proposition 4.2.6, p. 702 (with Remark 4.2.8, p. 703); `cs17`: CS17 §4.2, Remark 4.2.8, p. 703.

**75. `IG.3/compact-fibre-theorem` — corrected**

CS17 Theorem4.4.4 p.729 and its pp.726–729 proof verified. Retain properness of the integral model and choice of a lift. Correct the basic H⁰ module from a free group algebra to locally constant functions, and distinguish the Newton open fibre from its full canonical compactification.

Primary passages: `cs17`: CS17 §4.4, Theorem 4.4.4, p. 729.

**76. `IG.3/open-fibre-theorem` — verified**

CSnc Theorem2.7.2 p.33 matches the canonical open immersion and cohomology comparison on the good-reduction locus; no properness is needed after that restriction. The Serre–Tate construction and rank-one comparison are exactly those expanded in §4.

Primary passages: `csnc`: CSnc §2.7, Theorem 2.7.2, p. 33.

**77. `IG.3/period-map-on-boundary` — verified**

CSnc Theorem4.2.1/Corollary4.2.2 pp.52–53 read. The inverse image of the smaller Lie filtration inside Z_{−1} is the correct isotropic subspace; the closed agreement locus and finite-level boundary-density argument match.

Primary passages: `csnc`: CSnc §4.2, Theorem 4.2.1, p. 53; `csnc`: CSnc §4.2, Corollary 4.2.2, p. 53.

**78. `IG.3/pdiv-constant-mod-p-epsilon` — corrected**

CSnc Proposition4.3.1 p.54 and the three-step proof verified. Replace the ill-defined mixed-characteristic “X⊗_k O_C” example by the split ordinary lift, whose mod-p base change is meaningful.

Primary passages: `csnc`: CSnc §4.3, Proposition 4.3.1, p. 54.

**79. `IG.3/compactified-igusa-to-shimura` — verified**

CSnc Theorem4.3.2 pp.55–57 read, including the étale quotient, deformations of Raynaud extensions, symmetric lift torsor, normality for full level, and relatively perfect gluing. The modular canonical-locus example is understood for the locus in the chosen formal model; the later negative test correctly distinguishes the full period fibre’s higher-rank points.

Primary passages: `csnc`: CSnc §4.3, Theorem 4.3.2, p. 55; `csnc`: CSnc §4.3, proof of Theorem 4.3.2, p. 57.

**80. `IG.3/canonical-compactification-criterion` — corrected**

CSnc Lemma4.4.2 p.59 read. The target is proper over Spd C, the source qc separated perfectoid, and bijectivity is quantified over all larger algebraically closed fields. E4’s properness correction is retained; no new claim is made for arbitrary partially proper targets. The D5 request is restricted to the all-(C,C⁺)-point isomorphism criterion; canonical compactifications are already imported from the exact C4 nodes.

Primary passages: `csnc`: CSnc §4.4, Lemma 4.4.2, p. 59.

**81. `IG.3/toroidal-fibre-theorem` — corrected**

CSnc Theorem4.4.1 pp.57–59 read, including the four pieces of cusp data and their comparison. The properness required by Lemma4.4.2 is supplied by the compactified period fibre; the source’s loose partial-properness sentence is corrected as E4. The proof uses properness and the canonical compactification interface at C4; the separate D5 request no longer duplicates that owner.

Primary passages: `csnc`: CSnc §4.4, Theorem 4.4.1, p. 57.

**82. `IG.3/minimal-fibre-theorem` — verified**

CSnc Theorem4.5.1/Lemma4.5.2 pp.59–60 read. The proof uses H⁰/connected Stein fibres and relative primitive comparison, not vanishing of all proper-fibre cohomology. Prior conditional-affineness and precise relative primitive-comparison supplier repair are maintained.

Primary passages: `csnc`: CSnc §4.5, Theorem 4.5.1, p. 59; `csnc`: CSnc §4.5, proof of Lemma 4.5.2, p. 60.

**83. `IG.3/compactified-fibre-theorem` — verified**

CSnc Theorem4.1.1/Corollary4.1.2 p.51 read, including the higher-rank stalk sentence. Packet and reader preserve open immersions/canonical compactifications; the suggested file explicitly records its limitation to rank-one stalks and omits p-level compatibility signatures rather than asserting these have been formalized.

Primary passages: `csnc`: CSnc §4.1, Theorem 4.1.1, p. 51; `csnc`: CSnc §4.1, Corollary 4.1.2, p. 51.

**84. `IG.3/sw-infinite-level-rz-space` — corrected**

SW13 Definition6.3.5 uses ℚ_p^h; M′∞ is locally closed, the original space is preperfectoid, and the geometric examples need base maps.

Primary passages: `sw13`: Theorem 6.3.4, p. 59 (§6.3; Definition 6.3.3 of M_∞); proof pp. 59–62; `sw13`: Definition 6.3.5 and Lemma 6.3.6, p. 60; proof pp. 60–62; `cs17`: CS17 §4.2, proof of Theorem 4.2.4, p. 701; `sw13`: Definition 2.3.9, p. 18; Proposition 2.3.11, p. 19; §6.3, p. 60.

**85. `IG.3/mantovan-formula` — corrected**

Koshikawa Theorem7.1 p.10 and Lemmas7.3–7.6 pp.10–12 retain the connected Banach–Colmez automorphism quotient and its equivariant dualizing twist κ; a naïve J_b quotient and duality-only proof are insufficient. Direct dependencies now include BG3 full-kernel geometry and VS4 coefficient invariance. The remaining equivariant trace/orientation and compact-torsor coinvariant APIs are requested from VS4 and S2/SR.1 respectively.

Primary passages: `kos21`: §7, Theorem 7.1 and Remark 7.2, p. 10; Lemmas 7.3–7.6 and their proofs, pp. 10–12 (arXiv:2106.10602v1).

### IG.4

**86. `IG.4/equivariant-sites-and-nearby-cycles` — corrected**

CS17 published p.751 gives a slice equivalence of equivariant sites/topoi and then a derived pullback comparison. The trivial-group, free finite-group and trivial cyclic-action tests are mathematically appropriate. The existing suggested carrier equivariantSite is a DERIVED category; slicing it over a complex gives a different, generally nonadditive category. Separate the site carrier from the derived carrier. The source neighborhood is in the finite-generation domain; do not claim that every raw O_C/p algebra is finitely generated over F_p.

Primary passages: `cs17`: CS17 §6.1, p. 751.

**87. `IG.4/finiteness-from-rank-one-valuative-criterion` — verified**

Verified against CS17 pp.752–753. Affine finite-type F_p source and target plus the rank-one algebraically closed-fraction-field valuative lifting criterion imply properness, hence finiteness. This lemma is not applied to arbitrary O_C/p models. Suggested hval quantifies actual valuative squares and existence of lifts; no uniqueness problem remains because affine morphisms are separated.

Primary passages: `cs17`: CS17 §6.1, proof of Proposition 6.1.3, p. 753.

**88. `IG.4/finite-level-formal-models` — corrected**

The source-level construction is supported by CSnc pp.61–63. Minimal period preimages are affinoid perfectoid and descend to finite level; raw mod-p maps are integral, and A°/p is finitely presented over O_C/p on the chosen basis. The toroidal preimages are not asserted affinoid. The suggested raw records allow unrelated/nonintegral maps, and AuxiliaryTowerBoundaryCompatible is a forbidden empty proposition placeholder placeholder. The concrete opaque genuine-model replacement removes that defect while documenting unavailable normalization/étale predicates as permitted prototype omissions. Perverse comparison belongs to the later semiperversity target, not the proposed early geometric cut. The early node has no LPV.6/EDC.5 or combined-nearby-cycle dependency. Its perverse pushforward and cohomological compatibility APIs and requests now belong to semiperversity.

Primary passages: `csnc`: CSnc §4.6, proof of Theorem 4.6.1, p. 62; `csnc`: CSnc §4.6, proof of Theorem 4.6.1, p. 61.

**89. `IG.4/compact-perversity` — verified**

Verified compact Hodge-type scope, small pro-p K_p, positive shift [dim flag] to perversity, and cofinal-neighborhood quantifiers against CS17 Proposition6.1.3 pp.751–753. This is the full compact bound; the noncompact target has only the lower half. The finite-type noetherian argument is distinguished from raw integral O_C/p maps. Coefficient extensions in the acceptance text require the corresponding torsion/l-adic nearby-cycle suppliers, already explicitly requested; they are not supplied by a field-only prototype theorem.

Primary passages: `cs17`: CS17 §6.1, Proposition 6.1.3, p. 751.

**90. `IG.4/compact-minimal-stratum-concentration` — corrected**

Verified CS17 Corollary6.1.4 pp.753–755: minimize d_b among nonzero m-torsion Igusa cohomologies, with the transition/localization argument at finite level and support dimension dim(flag)-d_b. Li–Liu author p.35 footnote16 gives its special-signature one-hyperspecial-factor application. Clarify averaging at a cofinal pro-p system and use a characteristic-zero Hecke eigenideal for the Qbar_l analogue; an integral maximal ideal containing l annihilates no Qbar_l vector.

Primary passages: `cs17`: CS17 §6.1, Corollary 6.1.4, p. 753; `lil21`: Proof of Lemma 7.3 and footnote 16, p. 35.

**91. `IG.4/ell-power-boundary-killing` — verified**

Verified CSnc Lemmas4.6.2–4.6.3 p.61. The tower is in schemes, positive Kummer boundary cohomology is killed by increasing l-power ramification, and the toroidal-to-open period comparison follows stalkwise from the fibre theorem. This uses transition maps on cohomology, not exact invariants of an l-group. Modular-curve acceptance is read in that tower sense.

Primary passages: `csnc`: CSnc §4.6, Lemma 4.6.2, p. 61; `csnc`: CSnc §4.6, Lemma 4.6.3, p. 61.

**92. `IG.4/semiperversity` — corrected**

Verified source Theorem4.6.1 p.60 and its proof pp.61–63, including finite-level algebraization, open immersion followed by finite map, torsion nearby-cycle exactness, filtered colimit and l-power descent. Current detailed requests correctly separate pro-p exact invariants from l-power Cartan–Leray. The acceptance test incorrectly suggests an arbitrary basic stalk bound; semiperversity is a costalk condition. Move the geometric-model perverse interface here to make the proposed stage split real. The perverse pushforward API was moved here. The special-fibre acceptance is a costalk bound with δ(z)=0, not a general basic-stalk bound.

Primary passages: `csnc`: CSnc §4.6, Theorem 4.6.1, p. 60; `csnc`: CSnc §4.6, end of proof of Theorem 4.6.1, p. 63.

**93. `IG.4/partial-support-cohomology` — verified**

Verified definition, triangle and support distinctions against CSnc p.33: RΓ(Ig*,j!F_l), not RΓ_c of the open variety. The no-boundary, ordinary modular H0 and nonproper examples match the meaning at finite level. The suggested constructor uses actual lowerShriek and RGamma; the natural maps and boundary triangle are correctly directed.

Primary passages: `csnc`: CSnc §2.8, p. 33.

**94. `IG.4/artin-vanishing-upper-bound` — verified**

Verified CSnc Proposition2.8.2 p.34. Artin affine vanishing applies on finite-type finite-level minimal Igusa compactifications of dimension d_b, followed by filtered colimit. The finite/integral distinction at infinite Igusa level is retained; the source affineness reference needs the already recorded E2 repair.

Primary passages: `csnc`: CSnc §2.8, Proposition 2.8.2, p. 34.

**95. `IG.4/minimal-stratum-lower-bound` — verified**

Verified CSnc Lemma2.8.4 pp.34–35. Minimal d_b gives support dimension ≤d-d_b; semiperverse costalk bounds become stalk bounds at generic points of maximal-dimensional support, then pass through the cofinal formal-neighborhood comparison. No blanket perverse t-structure on arbitrary nonnoetherian schemes is needed. The precise continuity supplier remains a legitimate request.

Primary passages: `csnc`: CSnc §2.8, Lemma 2.8.4, p. 34; `csnc`: CSnc §2.8, proof of Lemma 2.8.4, p. 34.

### IG.5

**96. `IG.5/dual-hecke-ideal` — verified**

Verified inversion of Hecke double cosets, dual ideal involutivity and the inverse-eigenvalue/Tate-scalar relation against CSnc pp.36,66 and ACC §2.2.19 pp.35–37. Geometric Frobenius eigenvalues q^(2n-1)/α and the two-dimensional numeric test agree. Existing E3 correction must keep the contragredient as well as the twist.

Primary passages: `csnc`: CSnc §5.1, proof of Corollary 5.1.3, p. 66; `acc23`: §2.2.19 'Duality and twisting', pp. 35–37: anti-involutions ι, ι̃ (p. 35), m^∨ := ι(m) (p. 36), Proposition 2.2.20 and Corollary 2.2.21 (pp. 36–37).

**97. `IG.5/igusa-poincare-duality` — verified**

Verified the finite-level smooth Poincare duality shift [-2d_b] and twist (-d_b), inverse Hecke action, and pullback/trace variance. Current text correctly refuses a colimit-to-colimit duality. The concentration/torsion-free consequence uses finite-level universal coefficients and exact sufficiently small pro-p invariants, not dualization of arbitrary infinite smooth modules.

Primary passages: `csnc`: CSnc §5.1, proof of Corollary 5.1.3, p. 66.

**98. `IG.5/galois-representations-for-igusa-constituents` — corrected**

Verified Theorem5.1.2 pp.64–66, standing F0/F+≠Q/N0/ramification assumptions, local semisimple parameter and |.|^(1/2-n) normalization. Independently checked inherited E6 against CSnc pp.74–77, CS17 pp.739–740 and Shin author §§5.5,6.1: Red includes one modulus twist, and proper endoscopic infinity coefficients are Xi(phi), not trivial. The final normalization remains the explicit ET contract. Ordinary J_b is a split Levi, so its factors may have higher-dimensional LLC parameters; ordinarity alone does not force characters.

Primary passages: `csnc`: CSnc §5.1, Theorem 5.1.2, p. 65; `csnc`: CSnc §5.1, p. 64.

**99. `IG.5/concentrated-cohomology-gives-constituent` — corrected**

Verified the extraction argument in CSnc p.66 and the finite-level concentration argument in CS17 pp.758–759. Current prerequisites include smooth-representation infrastructure, but the proof should explicitly pass through a sufficiently small pro-p invariant finite-level lattice before universal coefficients and character extraction. That supplies nonzero actual characteristic-zero cohomology and prevents virtual cancellation.

Primary passages: `csnc`: CSnc §5.1, proof of Corollary 5.1.3, p. 66.

**100. `IG.5/generic-lift-splits` — corrected**

Verified CS17 Lemma6.2.2 p.756 and CSnc pp.66–67. Strong decomposed genericity yields a sum of characters; in the weak condition repeated eigenvalues are allowed only when q≠1 mod l, and the actual characteristic-zero Frobenius may then be nonsemisimple although inertia is trivial. The stated local Euler-characteristic proof needs a distinct finite-local-cohomology supplier; D7 duality alone is insufficient. The exact finite-local Euler-characteristic input is imported/requested from the existing ClassFieldTheory layer 5, alongside D7 local duality; global duality is not substituted for it.

Primary passages: `cs17`: CS17 §6.2, Lemma 6.2.2, p. 756; `csnc`: CSnc §5.1, proof of Corollary 5.1.3 and footnote 17, pp.66–67 (arXiv v2).

**101. `IG.5/genericity-forces-ordinary` — verified**

Verified CSnc Corollary5.1.3 pp.66–67 and Theorem2.8.6 p.35. The revised proof correctly uses semisimplified Weil parameters, not semisimplicity of the actual unramified lift, and dualizes the residual representation before twisting. Nonordinary inner forms cannot carry a generic principal-series parameter. No F+≠Q hypothesis is dropped in this trace-formula route.

Primary passages: `csnc`: CSnc §5.1, Corollary 5.1.3, p. 66; `csnc`: CSnc §2.8, Theorem 2.8.6, p. 35.

### IG.6

**102. `IG.6/boundary-strata-by-parabolics` — corrected**

Verified CSnc §6.1 pp.79–80: maximal rational parabolics by 1≤r≤n, Levi GL_r times G_2(n-r), identity-coset stabilizer, and middle quotient Z_-1/Z_-2. The source reverses the quotient at p.80; the corrected packet/suggested quotient is right. The r=n similitude torus is explicitly handled outside the positive-rank datum. The unqualified n=1 curve example needs F imaginary quadratic.

Primary passages: `csnc`: CSnc §6.1, p. 79; `csnc`: CSnc §6.1, p. 80.

**103. `IG.6/boundary-parabolic-induction` — corrected**

Verified CSnc §6.2.1 p.80. The homogeneous base is compact locally profinite and the result uses unnormalized smooth induction of the entire identity-fibre complex. The source geometry is not a discrete disjoint-union argument. Suggested theorem omitted primality of l although it interprets coefficients as F_l.

Primary passages: `csnc`: CSnc §6.2.1, p. 80.

**104. `IG.6/boundary-comparison-map` — corrected**

Verified CSnc §§6.2.2–6.2.3 pp.81–83, the P_b×P group, norm/level construction, finite punctured-neighborhood Huber comparison and Borel–Serre colimit. E10 is confirmed by the correct closing group on p.83. The F+>Q example must distinguish finite-level arithmetic-unit tori from the full adelic inverse limit; positive cohomology must not be asserted to survive every level colimit.

Primary passages: `csnc`: CSnc §6.2.2, p. 81; `csnc`: CSnc §6.2.3, p. 83.

**105. `IG.6/local-boundary-computation` — corrected**

Verified CSnc Proposition6.3.1 p.84 and current LS author Assumption4.3.1/Lemma4.3.2 p.61, Definition4.3.8/Theorem4.3.10 pp.63–64. LS4.3.10 is a Qbar_l algebraic-coefficient theorem, while CSnc explicitly performs the torsion tower computation. A finite-level punctured cusp has an extra Kummer H1; the arithmetic-unit colimit formula belongs at full tower level. Published LS PDF was unavailable in this review; use the exact downloaded current-author edition and its pagination, not a false published-source claim.

Primary passages: `csnc`: CSnc §6.3, Proposition 6.3.1, p. 84; `csnc`: CSnc §6.3, proof of Proposition 6.3.1, p. 84; `ls18a-author`: §4.3, Assumption 4.3.1 and Lemma 4.3.2, author-copy p.61; Definition 4.3.8 and Theorem 4.3.10, pp.63–64.

**106. `IG.6/igusa-pink-formula` — corrected**

Verified Theorem6.1.1 p.80 and Prop6.3.1 p.84: the full tensor product lies inside unnormalized induction, with both factors carrying the specified Levi action; no Tate twist or shift appears. Suggested boundarySource already places the tensor inside induction. Clarify parentheses in prose and retain finite-level versus full-level unit-cohomology distinction.

Primary passages: `csnc`: CSnc §6.1, Theorem 6.1.1, p. 80.

**107. `IG.6/parabolic-induction-derived-invariants` — corrected**

CSnc Lemma6.4.2 p.85 has a printed codomain error: restriction of scalars along r_P:T_G→T_P lands in D+(T_G), as the paper own diagram shows. Part(2), Lemma6.4.3 p.86, correctly lands in D+(T_P). Suggested HeckeDerived.restrictScalars and the two functor isomorphisms are already correctly typed. Prime-to-l unipotent invariants are the exact functor used in part(2).

Primary passages: `csnc`: CSnc §6.4, Lemma 6.4.2, p. 85; `csnc`: CSnc §6.4, Lemma 6.4.3, p. 86.

**108. `IG.6/boundary-length-obstruction` — corrected**

Verified induction on n, finite-level dual ideal, boundary stratification, torsion GL_r determinant input and the two GL_r summands in CSnc Theorem6.4.1 pp.84–87. Nonordinary b excludes r=n, hence at least three Jordan–Holder factors. The printed restriction-functor order in (6.4.5) is reversed: r_P*∘r_M*, matching r_M∘r_P on rings. The source final lemma/proposition labels are also reversed, already covered by the inherited extraction issue.

Primary passages: `csnc`: CSnc §6.4, Theorem 6.4.1, p. 84; `csnc`: CSnc §6.4, proof of Theorem 6.4.1, p. 86; `csnc`: CSnc §2.8, Theorem 2.8.7, p. 35.

### IG.7

**109. `IG.7/cs-generic-maximal-ideal` — corrected**

Verified CSnc Theorem1.1/Remark1.4 and ACC Definition4.3.1/Lemma4.3.2 pp.76–77. The weak no-q ratio condition permits repeated roots only away from q=1; it is distinct from absolute irreducibility. Infinitely many good primes follow from a compatible finite-image Galois representation. The reducible acceptance must impose cross-block ratios as well as genericity inside each summand.

Primary passages: `csnc`: CSnc §2.8, proof of Theorem 1.1, p. 36; `acc23`: Definition 4.3.1, pp. 76–77 (recalled from [CS17, Defn. 1.9] with p and l swapped).

**110. `IG.7/cohomologically-generic` — corrected**

Definition D.1.1 and its three examples are verified in published LTXZZ p.365. Proposition D.1.3 yields a fixed-bad-set result over Fbar_l with a split witness away from l; Corollary D.1.4 passes to every enlarged bad set using infinitely many witnesses supplied by Galois/Chebotarev. The current one-prime arbitrary-field API is false for abstract Hecke characters. Counterexample: take the H0 degree character away from one prime and generic Satake values at that prime; remove it in the enlarged bad set, and localized H0 survives. Concrete repaired helper requires an avoiding witness for every finite enlargement.

Primary passages: `ltxzz`: Appendix D, §D.1 'Vanishing of cohomology off middle degree', Definition D.1.1, p. 365; `ltxzz`: Published Appendix D, Proposition D.1.3 p.365 and Corollary D.1.4 p.368.

**111. `IG.7/only-ordinary-contributes` — verified**

Verified CSnc proof of Theorem1.1 p.36. The minimal-stratum/partial-support obstruction forces only ordinary b; its d_b equals global dimension d. The period sheaf then has the required ordinary support and lower degree bound. Suggested finite-level good-reduction conclusion retains the full standing and generic hypotheses.

Primary passages: `csnc`: CSnc §2.8, proof of Theorem 1.1, p. 36.

**112. `IG.7/level-descent` — corrected**

The reviewed input’s third suggested implication fixed the original p and invoked the bad-p Lan–Stroh route. The submitted prototype retains the first two implications and explicitly omits the arbitrary-neat-level implication pending genuine good-prime data and the normal-cover Cartan–Leray interface. The complete mathematical target and supplier request remain in the packet and reader. The required data must be actual admissible data; quantifying over an impossible standing-hypothesis record would give a vacuous premise.

Primary passages: `csnc`: CSnc §2.8, proof of Theorem 1.1, p. 36.

**113. `IG.7/caraiani-scholze-vanishing` — verified**

Verified CSnc Theorem1.1 p.5 and proof pp.36–37. Ordinary cohomology vanishes BELOW d and compactly supported cohomology ABOVE d. Neither middle-degree concentration nor boundary vanishing is asserted under length≤2 alone. Standing F0/F+≠Q, generic completely split prime, arbitrary neat level and Hecke support are correctly retained.

Primary passages: `csnc`: CSnc §1, Theorem 1.1, p. 5.

**114. `IG.7/integral-and-local-system-versions` — corrected**

Verified CSnc Remark1.5 pp.5–6, integral/local-system extension, middle-degree torsion-freeness and the four-term boundary segment. Derived finite-cover invariants preserve the lower range, and duality gives the compact upper range. One proof phrase reverses the deck quotient K/K′; the l-power subgroup must be described correctly.

Primary passages: `csnc`: CSnc §1, Remark 1.5, pp. 5–6.

**115. `IG.7/irreducible-specialization` — corrected**

Verified CSnc Remark1.6 p.6 and the non-Eisenstein boundary input discussed in ACC §2.4. Concentration follows from boundary vanishing plus the two half-bounds, including integral torsion-freeness. The circle example only describes the imaginary quadratic modular-curve case, which is excluded by the standing F+≠Q hypotheses; for larger F+ there are higher-dimensional arithmetic boundary fibrations.

Primary passages: `csnc`: CSnc §1, Remark 1.6, p. 6; `acc23`: Theorem 2.4.2, p. 46 (§2.4); proof pp. 46–49.

**116. `IG.7/acc-middle-degree-export` — corrected**

Verified ACC Theorem4.3.3 pp.77–78, its exact place-set condition, integral coefficient lattice, injection after inverting the coefficient prime and boundary surjection. Prototype uses rational prime sets, hence only their saturated special case, and lacks the standing coefficient-prime membership hypothesis. Preserve exact source-level statement; label the prototype restriction and request the placewise adapter. The suggested coefficient ring now has an injective Z_ℓ scalar map, excluding O=F_ℓ; ℓ∈S is explicit. Rational-prime-saturated versus general placewise scope is documented.

Primary passages: `acc23`: Theorem 4.3.3, p. 77 (§4.3 'Cohomology in the middle degree'); proof pp. 77–78.

**117. `IG.7/koshikawa-parameter-irrelevance` — corrected**

Verified Koshikawa §§2–3 pp.4–5, including lifting supercuspidal support, normalized versus unnormalized parabolic induction, mod-l parameter compatibility and the inner-form relevance obstruction. Do not say J_b is an inner form of G itself: it is an inner form of the Newton Levi centralizer. Existing suggested local datum/FS parameter keeps this type distinction.

Primary passages: `kos21`: §§2–3, Theorem 2.1 and Lemma 3.1, pp.4–5; `kos21`: §3, Lemma 3.1, p.5.

**118. `IG.7/koshikawa-local-vanishing` — corrected**

Verified Koshikawa Theorem1.1 p.1 and §4 pp.5–6: product GL groups over finite local F, hyperspecial K, local spherical localization, integral coefficients, spectral/Satake inversion, and mod-l-to-integral finite-generation argument. Existing explicit integral/Nakayama request is appropriate. The local-shtuka supplier presently needs extension from Q_p to finite F and a mu/mu^-1 dictionary. A source shift misprint is recorded separately: geometric d_mu, not dimension of r_mu. The packet already says geometric shift. HS2’s current rigid statement is over Q_p, so the finite-F/Q_p realization and cocharacter/reflex-base dictionary are explicitly requested. The geometric Satake dimension correction is source issue E17.

Primary passages: `kos21`: Theorem 1.1, p. 1 (§1.1 'Local vanishing'); proof §4; `kos21`: §1.1, p. 1 (definition of 'generic' for the unramified L-parameter ρ_m); used globally in Conjecture 1.2, p. 2; `kos21`: §4, pp.5–6.

**119. `IG.7/koshikawa-ordinary-costalk-bound` — corrected**

Verified Koshikawa Corollary8.2/Lemma8.3 pp.13–14: unlocalized ordinary costalk cohomology lies in D≥d; finite closed special-fibre support has delta0; the formal-model passage is a DERIVED INVERSE LIMIT. Existing E13 right-adjoint correction is required. The unrelated C6 base-field-invariance dependency cannot supply a support triangle or this inverse-limit comparison. C6 base-field invariance is removed as a support supplier. S3 owns the actual support adjunction and triangle; LPV.6 is asked for the formal-model support derived inverse limit.

Primary passages: `kos21`: Corollary 8.2 and Lemma 8.3, pp.13–14.

**120. `IG.7/koshikawa-ordinary-costalk-stalk` — corrected**

Verified Koshikawa Proposition1.7 p.3 and §9 pp.14–16: localization is at the local spherical ideal alone; ordinary dualizing object κ^-1[-2d], opposite action, half/Tate normalization, admissible smooth dual/reflexivity and disjoint spectral support are essential. No self-duality of arbitrary local cohomology is assumed. The bounded-admissible supplier request is honest; smooth exceptional-pullback variance and support ownership need the exact S4/S3 interfaces. The exact existing S4/smooth-upper-shriek-exchange supplies the mixed variance, under its eligibility and smoothness hypotheses. Only support/compact-pushforward compatibility remains requested. VS4/strata-are-classifying-stacks is imported directly.

Primary passages: `kos21`: Proposition 1.7, p.3; proof §9, pp.14–16; Lemma 9.1, p.15.

**121. `IG.7/koshikawa-generic-vanishing` — corrected**

Verified Koshikawa Theorem1.3 p.2, ordinary costalk-to-stalk and Mantovan proof in §9. The quasi-split unitary theorem has no F+≠Q or residual length assumption. The source realization and product-formula quotient normalization must match the geometry review (J_b versus full automorphism group). Local-to-away-prime global localization is a separate Hecke-compatible adapter, not automatic from an arbitrary global ideal.

Primary passages: `kos21`: Theorem 1.3, p. 2; proof §9, pp. 14–16; `cn23`: Proof of Theorem 2.1.28, p. 25.

**122. `IG.7/middle-degree-without-length-hypothesis` — corrected**

Verified CN arXiv v3 Theorem2.1.28 p.25 with the field/place hypotheses of Theorem2.1.26 p.24 and setup p.15. It removes F+ degree/length restrictions using Koshikawa1.3, correcting printed1.4. Prototype rational-prime T is a saturated special case, not the full conjugation-stable finite-place set. The proof phrase local localization dominates global must be replaced by the compatible Galois/Hecke-prime choice and localization adapter. The coefficient scalar map is injective and the full finite-place localization adapter remains explicit; local-to-global Hecke localization uses a compatible Galois eigensystem and a good auxiliary prime.

Primary passages: `cn23`: Theorem 2.1.28 and its proof, p. 25 (§2.1); `cn23`: Theorem 2.1.26, p. 24 (same hypotheses on F as Theorem 2.1.20, p. 22); setup §2.1.11, p. 15.

## Validation and limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/IgusaVarietiesAndTorsionConcentration.json --json`: exit 0, zero errors and zero packet warnings. The separate stderr note about the unavailable default declaration index is disclosed above; pinned declaration verification was manual.
- All 123 node IDs have one fresh verdict. Every definition/construction has at least three tests; all 137 distinct packet test names have suggested-file test markers and all API names have corresponding declarations or explicit prototype omissions.
- The 123 reader node sections are regenerated from, and exactly agree with, the corrected packet. Requests, gaps, source versions, source issues, restructuring and coverage sections are synchronized. The obsolete process paragraph is removed.
- The source issues and version records also pass the errata checker in an errata-format projection: 18 issues, nine version records, zero errors.
- Static checks cover all node identifiers, removed/renamed consumers, comment/namespace structure and prohibited unconstrained proposition placeholders. They are not a Lean elaboration check.
- **Lean was not compiled.** No existing build at the pinned commits was available. No Lake project, dependency update, cache download, Mathlib/Tau Ceti build or language server was created. The preceding review’s compilation result is not reused as evidence for this changed file.
- The local packet graph and resolved dependency identifiers pass the checker. A complete repository-wide atlas rebuild was not run in the selective API workspace, and the explicitly documented stage-level LPV/IG cycle remains a maintainer restructuring action.
- Only the three reviewed deliverables, this review report and the job’s own handoff are submitted. No source papers or temporary review scripts are included.

## Maintainer actions

1. Accept this corrected planning pass through the normal independent-review intake; no mathematical node needs another rejection round on the defects listed here.
2. Apply the proposed early formal-model split and repoint the external LPV interface. Apply the separately listed Hilbert-link, primitive-comparison, torsion-determinant and algebraic-B(G) ownership proposals through their proper jobs.
3. Route the remaining precise supplier APIs, especially torsion nearby-cycle/continuity, equivariant Mantovan trace/coinvariants, finite-local-field rigidification and good-prime normal-cover descent. Keep the stage statuses planned until the closure requirements are met.
4. When an existing pinned Lean build is available, elaborate the suggested file and repair any type-level issues there. This review does not claim that static inspection substitutes for that gate.

## Appendix: direct external dependency manifest

Each linked file is at the reviewed base commit `5f858d955d09e952285131fe6ccd62875ae14dcd`. A stage entry is a requested interface; an exact node entry was checked against its statement, hypotheses and conventions. The mathematical qualifications and additional obligations are in the packet’s precise requests and the ledger above.

| External identifier | Supplier file checked | Resolution |
|---|---|---|
| `AbelianSchemesAndArithmeticModuli:A4` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/AbelianSchemesAndArithmeticModuli.json) | Existing stage; precise request |
| `AdelicAlgebraicGroups:AA.4/hasse-principle-simply-connected` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AdelicAlgebraicGroups.json) | Existing exact node |
| `AdicCoefficientsAndComparisons:L5/normal-crossing-local-comparison` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AdicCoefficientsAndComparisons.json) | Existing exact node |
| `AdicEtaleGeometry:A1/finite-etale-tower` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AdicEtaleGeometry.json) | Existing exact node |
| `AdicEtaleGeometry:A1/pro-etale-site-corrected` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AdicEtaleGeometry.json) | Existing exact node |
| `AdicSpacesPartII:F0/grothendieck-algebraization` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AdicSpacesPartII.json) | Existing exact node |
| `AdicSpacesPartII:F0/locally-noetherian-formal-scheme` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AdicSpacesPartII.json) | Existing exact node |
| `AdicSpacesPartII:R2/admissible-formal-scheme` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AdicSpacesPartII.json) | Existing exact node |
| `AdicSpacesPartII:R2/formal-etale-site-invariance` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AdicSpacesPartII.json) | Existing exact node |
| `ArithmeticGaloisDuality:D7/derived-local-duality` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ArithmeticGaloisDuality.json) | Existing exact node |
| `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ArithmeticGaloisDuality.json) | Existing exact node |
| `ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json) | Existing exact node |
| `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json) | Existing exact node |
| `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json) | Existing exact node |
| `ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json) | Existing exact node |
| `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json) | Existing exact node |
| `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json) | Existing exact node |
| `ArithmeticLocallySymmetricSpaces:ALS.4/gln-boundary-eisenstein` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json) | Existing exact node |
| `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json) | Existing exact node |
| `ArithmeticLocallySymmetricSpaces:ALS.4/siegel-stratum-localization` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json) | Existing exact node |
| `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json) | Existing exact node |
| `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json) | Existing exact node |
| `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json) | Existing exact node |
| `ArithmeticLocallySymmetricSpaces:ALS.6/lowest-degree-descent` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ArithmeticLocallySymmetricSpaces.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.0.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.0.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.0/the-normalization-dictionary-fixed-by-the-sources` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/data/decompositions/AutomorphicGaloisRepresentationsPartII.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/data/decompositions/AutomorphicGaloisRepresentationsPartII.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/data/decompositions/AutomorphicGaloisRepresentationsPartII.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/data/decompositions/AutomorphicGaloisRepresentationsPartII.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.7/dual-and-character-twist-hecke-comparison` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.7/genericity-transfer-and-projective-qualification` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.7/non-eisenstein-maximal-ideal` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json) | Existing exact node |
| `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/data/decompositions/AutomorphicGaloisRepresentationsPartII.json) | Existing exact node |
| `BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/BunGAndNewtonStrata.json) | Existing exact node |
| `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/BunGAndNewtonStrata.json) | Existing exact node |
| `BunGAndNewtonStrata:BG1` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/BunGAndNewtonStrata.json) | Existing stage; precise request |
| `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/BunGAndNewtonStrata.json) | Existing exact node |
| `BunGAndNewtonStrata:BG1/partial-order-on-B-of-G` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/BunGAndNewtonStrata.json) | Existing exact node |
| `BunGAndNewtonStrata:BG2:uniformization/semicontinuity-and-local-constancy` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/BunGAndNewtonStrata.json) | Existing exact node |
| `BunGAndNewtonStrata:BG3` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/BunGAndNewtonStrata.json) | Existing stage; precise request |
| `BunGAndNewtonStrata:BG3/full-automorphism-v-group` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/BunGAndNewtonStrata.json) | Existing exact node |
| `BunGAndNewtonStrata:BG3/positive-automorphism-kernel` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/BunGAndNewtonStrata.json) | Existing exact node |
| `ClassicalAdicEtaleCohomology:H0/geometric-stalks-at-field-pairs` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ClassicalAdicEtaleCohomology--H0.json) | Existing exact node |
| `ClassicalAdicEtaleCohomology:H0/overconvergent-etale-sheaves` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ClassicalAdicEtaleCohomology--H0.json) | Existing exact node |
| `ClassicalAdicEtaleCohomology:H0/overconvergent-morphisms-maximal-stalks` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ClassicalAdicEtaleCohomology--H0.json) | Existing exact node |
| `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/formal-nearby-cycles-comparison` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ClassicalAdicEtaleCohomology--H0.json) | Existing exact node |
| `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/generic-fibre-cohomology-3-5-14` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ClassicalAdicEtaleCohomology--H0.json) | Existing exact node |
| `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison/scheme-completion-comparison-3-5-13` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/data/decompositions/ClassicalAdicEtaleCohomology.json) | Existing exact node |
| `DiamondEtaleCohomology:C0/etale-cohomology-continuity` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/DiamondEtaleCohomology--C0.json) | Existing exact node |
| `DiamondEtaleCohomology:C0/etale-site` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/DiamondEtaleCohomology--C0.json) | Existing exact node |
| `DiamondEtaleCohomology:C0/quasi-pro-etale-site` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/DiamondEtaleCohomology--C0.json) | Existing exact node |
| `DiamondEtaleCohomology:C4/canonical-compactification` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/DiamondEtaleCohomology--C0.json) | Existing exact node |
| `DiamondEtaleCohomology:C4/canonical-compactification-universal` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/DiamondEtaleCohomology--C0.json) | Existing exact node |
| `DiamondEtaleCohomology:C4/relative-compactification-properties` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/DiamondEtaleCohomology--C0.json) | Existing exact node |
| `DiamondEtaleCohomology:C8/partially-proper-dimension` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/DiamondEtaleCohomology--C8.json) | Existing exact node |
| `DiamondEtaleCohomology:C8/partially-proper-fibre-dimension` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/DiamondEtaleCohomology--C8.json) | Existing exact node |
| `DiamondSixOperations:S1/qcqs-diamond-continuity` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/DiamondSixOperations.json) | Existing exact node |
| `DiamondSixOperations:S2` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/DiamondSixOperations.json) | Existing stage; precise request |
| `DiamondSixOperations:S3` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/DiamondSixOperations.json) | Existing stage; precise request |
| `DiamondSixOperations:S3/upper-shriek` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/DiamondSixOperations.json) | Existing exact node |
| `DiamondSixOperations:S4` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/DiamondSixOperations.json) | Existing stage; precise request |
| `DiamondSixOperations:S4/smooth-base-change` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/DiamondSixOperations.json) | Existing exact node |
| `DiamondSixOperations:S4/smooth-twisted-pullback` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/DiamondSixOperations.json) | Existing exact node |
| `DiamondSixOperations:S4/smooth-upper-shriek-exchange` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/DiamondSixOperations.json) | Existing exact node |
| `DiamondsAndVStacks:D5` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/DiamondsAndVStacks.json) | Existing stage; precise request |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.4` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/EndoscopicTransferAndUnitaryTraceComparison.json) | Existing stage; precise request |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.5` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/EndoscopicTransferAndUnitaryTraceComparison.json) | Existing stage; precise request |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.6` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/EndoscopicTransferAndUnitaryTraceComparison.json) | Existing stage; precise request |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.7b` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/EndoscopicTransferAndUnitaryTraceComparison.json) | Existing stage; precise request |
| `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.0.json) | Existing exact node |
| `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.0.json) | Existing exact node |
| `EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.0.json) | Existing exact node |
| `EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.4.json) | Existing exact node |
| `EtaleDualityAndPerverseSheaves:EDC.5` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/EtaleDualityAndPerverseSheaves.json) | Existing stage; precise request |
| `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.4.json) | Existing exact node |
| `EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.4.json) | Existing exact node |
| `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functor` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.4.json) | Existing exact node |
| `ExcursionOperatorsAndSpectralAction:ES3` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/ExcursionOperatorsAndSpectralAction.json) | Existing stage; precise request |
| `ExcursionOperatorsAndSpectralAction:ES4` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/ExcursionOperatorsAndSpectralAction.json) | Existing stage; precise request |
| `ExcursionOperatorsAndSpectralAction:ES5` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/ExcursionOperatorsAndSpectralAction.json) | Existing stage; precise request |
| `ExcursionOperatorsAndSpectralAction:ES6:duality` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/ExcursionOperatorsAndSpectralAction.json) | Existing stage; precise request |
| `ExcursionOperatorsAndSpectralAction:ES6:functoriality` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/ExcursionOperatorsAndSpectralAction.json) | Existing stage; precise request |
| `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/ExcursionOperatorsAndSpectralAction.json) | Existing stage; precise request |
| `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES7.json) | Existing exact node |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json) | Existing stage; precise request |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json) | Existing exact node |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-connected-etale` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json) | Existing exact node |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json) | Existing exact node |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json) | Existing stage; precise request |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json) | Existing exact node |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json) | Existing exact node |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json) | Existing exact node |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/abelian-scheme-torsion-finite-flat` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json) | Existing exact node |
| `HeckeStacksAndLocalShtukas:HS2` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/HeckeStacksAndLocalShtukas.json) | Existing stage; precise request |
| `HeckeStacksAndLocalShtukas:HS2/levels-and-tower-limit` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/HeckeStacksAndLocalShtukas.json) | Existing exact node |
| `HeckeStacksAndLocalShtukas:HS2/minuscule-rigidification` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/HeckeStacksAndLocalShtukas.json) | Existing exact node |
| `HodgeTateAndCanonicalSubgroups:T0` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/HodgeTateAndCanonicalSubgroups.json) | Existing stage; precise request |
| `HodgeTateAndCanonicalSubgroups:T1` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/HodgeTateAndCanonicalSubgroups.json) | Existing stage; precise request |
| `HodgeTateAndCanonicalSubgroups:T2` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/HodgeTateAndCanonicalSubgroups.json) | Existing stage; precise request |
| `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/IntegralHeckeAndGaloisDeterminants.json) | Existing exact node |
| `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-direct-sum` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/IntegralHeckeAndGaloisDeterminants.json) | Existing exact node |
| `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/IntegralHeckeAndGaloisDeterminants.json) | Existing exact node |
| `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/IntegralHeckeAndGaloisDeterminants.json) | Existing exact node |
| `IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/IntegralHeckeAndGaloisDeterminants.json) | Existing exact node |
| `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/data/decompositions/LefschetzPencilsAndVanishingCycles.json) | Existing exact node |
| `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/data/decompositions/LefschetzPencilsAndVanishingCycles.json) | Existing exact node |
| `LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/LefschetzPencilsAndVanishingCycles--LPV.0.json) | Existing exact node |
| `LefschetzPencilsAndVanishingCycles:LPV.6` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/LefschetzPencilsAndVanishingCycles.json) | Existing stage; precise request |
| `LefschetzPencilsAndVanishingCycles:LPV.6/filtered-colimit-support-criterion` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/LefschetzPencilsAndVanishingCycles--LPV.0.json) | Existing exact node |
| `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/LefschetzPencilsAndVanishingCycles--LPV.0.json) | Existing exact node |
| `NeronModelsAndSemistableAbelianVarieties:R11.3/raynaud-extension-comparison` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/NeronModelsAndSemistableAbelianVarieties.json) | Existing exact node |
| `PELModuli:M0` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/PELModuli.json) | Existing stage; precise request |
| `PELModuli:M0/determinant-condition` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PELModuli.json) | Existing exact node |
| `PELModuli:M0/integral-pel-datum` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PELModuli.json) | Existing exact node |
| `PELModuli:M0/similitude-group` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PELModuli.json) | Existing exact node |
| `PELModuli:M0/unramified-tau-decomposition` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PELModuli.json) | Existing exact node |
| `PELModuli:M1/moduli-problem` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PELModuli.json) | Existing exact node |
| `PELModuli:M1/principal-level-structure` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PELModuli.json) | Existing exact node |
| `PELModuli:M1/unitary-of-abelian-scheme` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PELModuli.json) | Existing exact node |
| `PELModuli:M2/representability` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PELModuli.json) | Existing exact node |
| `PELModuli:M2/unitary-deformation` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PELModuli.json) | Existing exact node |
| `PELModuli:M2/universal-family` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PELModuli.json) | Existing exact node |
| `PELModuli:M3/algebraization-of-components` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PELModuli.json) | Existing exact node |
| `PELModuli:M3/complex-points` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PELModuli.json) | Existing exact node |
| `PELModuli:M3/hasse-principle-cases` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PELModuli.json) | Existing exact node |
| `PadicHodgeTheory:P8` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/PadicHodgeTheory.json) | Existing stage; precise request |
| `PerfectoidShimuraVarieties:S0/infinite-level-diamond` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PerfectoidShimuraVarieties.json) | Existing exact node |
| `PerfectoidShimuraVarieties:S1/perfectoid-toroidal-siegel-tower` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PerfectoidShimuraVarieties.json) | Existing exact node |
| `PerfectoidShimuraVarieties:S1/rational-flags-preimage` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PerfectoidShimuraVarieties.json) | Existing exact node |
| `PerfectoidShimuraVarieties:S2/hodge-genuine-minimal-perfectoid-tower` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PerfectoidShimuraVarieties.json) | Existing exact node |
| `PerfectoidShimuraVarieties:S3/affinoid-perfectoid-basis-of-flag-variety` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PerfectoidShimuraVarieties.json) | Existing exact node |
| `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PerfectoidShimuraVarieties.json) | Existing exact node |
| `PerfectoidShimuraVarieties:S3/hodge-open-period-map` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PerfectoidShimuraVarieties.json) | Existing exact node |
| `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PerfectoidShimuraVarieties.json) | Existing exact node |
| `PerfectoidShimuraVarieties:S4/preabelian-minimal-perfectoid` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PerfectoidShimuraVarieties.json) | Existing exact node |
| `PerfectoidShimuraVarieties:S6/general-toroidal-period-map` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PerfectoidShimuraVarieties.json) | Existing exact node |
| `PerfectoidShimuraVarieties:S6/minimal-toroidal-period-map-compatibility` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PerfectoidShimuraVarieties.json) | Existing exact node |
| `PerfectoidSpaces:P0/almost-basic-setup` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PerfectoidSpaces--P0.json) | Existing exact node |
| `PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/data/decompositions/PerfectoidSpaces.json) | Existing exact node |
| `PerfectoidSpaces:P2/perfectoid-space` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PerfectoidSpaces--P0.json) | Existing exact node |
| `PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/data/decompositions/PerfectoidSpaces.json) | Existing exact node |
| `PerfectoidSpaces:P7/perfectoid-tilde-limit` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/PerfectoidSpaces--P0.json) | Existing exact node |
| `SchemeAndStackFoundations:SF.2` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/SchemeAndStackFoundations.json) | Existing stage; precise request |
| `SchemeAndStackFoundations:SF.4` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/SchemeAndStackFoundations.json) | Existing stage; precise request |
| `ShimuraCompactifications:C0/arithmetic-admissible-fan` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ShimuraCompactifications--C0.json) | Existing exact node |
| `ShimuraCompactifications:C0/smooth-projective-refinement` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ShimuraCompactifications--C0.json) | Existing exact node |
| `ShimuraCompactifications:C1/arithmetic-stabilizer` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ShimuraCompactifications--C0.json) | Existing exact node |
| `ShimuraCompactifications:C1/cusp-label` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ShimuraCompactifications--C0.json) | Existing exact node |
| `ShimuraCompactifications:C3/hecke-span` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ShimuraCompactifications--C0.json) | Existing exact node |
| `ShimuraCompactifications:C3/refinement-map` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ShimuraCompactifications--C0.json) | Existing exact node |
| `ShimuraCompactifications:C4/degeneration-effectivity` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ShimuraCompactifications--C0.json) | Existing exact node |
| `ShimuraCompactifications:C4/formal-universal-degeneration` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ShimuraCompactifications--C0.json) | Existing exact node |
| `ShimuraCompactifications:C4/polarized-degeneration-data` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ShimuraCompactifications--C0.json) | Existing exact node |
| `ShimuraCompactifications:C5/formal-completion` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ShimuraCompactifications--C0.json) | Existing exact node |
| `ShimuraCompactifications:C5/higher-level-toroidal-normalization` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ShimuraCompactifications--C0.json) | Existing exact node |
| `ShimuraCompactifications:C5/integral-minimal-space` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ShimuraCompactifications--C0.json) | Existing exact node |
| `ShimuraCompactifications:C5/integral-toroidal-space` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ShimuraCompactifications--C0.json) | Existing exact node |
| `ShimuraCompactifications:C5/minimal-hodge-ampleness` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/ShimuraCompactifications--C0.json) | Existing exact node |
| `SmoothRepresentationsOfLocalGroups:SR.0` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/SmoothRepresentationsOfLocalGroups.json) | Existing stage; precise request |
| `SmoothRepresentationsOfLocalGroups:SR.0:derived-extension` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/SmoothRepresentationsOfLocalGroups.json) | Existing stage; precise request |
| `SmoothRepresentationsOfLocalGroups:SR.1` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/SmoothRepresentationsOfLocalGroups.json) | Existing stage; precise request |
| `SmoothRepresentationsOfLocalGroups:SR.2` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/SmoothRepresentationsOfLocalGroups.json) | Existing stage; precise request |
| `SmoothRepresentationsOfLocalGroups:SR.5` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/SmoothRepresentationsOfLocalGroups.json) | Existing stage; precise request |
| `SmoothRepresentationsOfLocalGroups:SR.6` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/SmoothRepresentationsOfLocalGroups.json) | Existing stage; precise request |
| `TorsionCohomologyInfrastructure:TC.3` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/TorsionCohomologyInfrastructure.json) | Existing stage; precise request |
| `TorsionCohomologyInfrastructure:TC.4` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/TorsionCohomologyInfrastructure.json) | Existing stage; precise request |
| `VStackSheavesAndLisseCategories:VS4` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/VStackSheavesAndLisseCategories.json) | Existing stage; precise request |
| `VStackSheavesAndLisseCategories:VS4/contractibility-of-connected-banach-colmez-torsors` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/VStackSheavesAndLisseCategories.json) | Existing exact node |
| `VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/VStackSheavesAndLisseCategories.json) | Existing exact node |
| `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/packets/VectorBundlesAndIsocrystals--VB0.json) | Existing exact node |
| `VectorBundlesAndIsocrystals:VB2` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/VectorBundlesAndIsocrystals.json) | Existing stage; precise request |
| `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/data/decompositions/VectorBundlesAndIsocrystals.json) | Existing exact node |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_ClassFieldTheory.json) | Existing stage; precise request |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality` | [Contract](https://github.com/CBirkbeck/tauceti-explorer/blob/5f858d955d09e952285131fe6ccd62875ae14dcd/research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_ClassFieldTheory.json) | Existing stage; precise request |
