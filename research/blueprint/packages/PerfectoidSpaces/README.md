# Roadmap: perfectoid rings and spaces

Perfectoid spaces are the adic spaces on which Frobenius can be inverted: locally they are the adic spectra of perfectoid Tate rings, complete uniform Tate rings with a pseudouniformizer ϖ such that ϖ^p divides p and Frobenius is an isomorphism from R°/ϖ to R°/ϖ^p. This roadmap builds their theory in that generality (characteristic 0 or p, no perfectoid base field): almost mathematics over an arbitrary basic setup; perfectoid Tate rings, their tilts, Fontaine's θ and the classification of untilts by primitive ideals; the tilting homeomorphism of adic spectra, perfectoid rational localisation, the sheaf theorem with almost acyclicity of O⁺, and perfectoid spaces with fibre products; the almost purity theorem and the étale site with its tilting equivalence; injections, immersions, Zariski closed immersions and separatedness; cofiltered limits of affinoid perfectoids and finite-stage descent of étale objects; κ-small perfectoid spaces and the pro-étale calculus; tilde-limits and Frobenius-controlled towers; finite group quotients and closed perfectoid loci in towers; and descent of functions, modules and character sheaves along profinite Galois towers with rigid coefficient spaces.

The construction starts from Huber rings and valuation spectra, Mathlib’s Witt vectors and perfection, and the adic-space and sheaf-theoretic suppliers specified below. The outputs are the geometric inputs of pro-étale descent and diamonds (DiamondsAndVStacks), of the étale geometry of adic spaces beyond the noetherian case (AdicEtaleGeometry), and of the perfectoid Shimura varieties and period spaces downstream.

The construction has ten layers, in order.

| Layer | Construction |
| --- | --- |
| [P0](#p0) | Almost mathematics over a basic setup |
| [P1](#p1) | Perfectoid Tate rings, tilts and untilts |
| [P2](#p2) | Rational localisation, the sheaf theorem and perfectoid spaces |
| [P3](#p3) | Almost purity and the étale site |
| [P4](#p4) | Injections, immersions and separatedness |
| [P5](#p5) | Cofiltered limits and finite-stage étale descent |
| [P6](#p6) | κ-small perfectoid spaces and pro-étale morphisms |
| [P7](#p7) | Tilde-limits and Frobenius-controlled towers |
| [P8](#p8) | Finite quotients and closed perfectoid loci in towers |
| [P9](#p9) | Continuous torsor descent with coefficients |

Layers P0 and P1 can be developed in parallel up to the almost setup of a perfectoid ring, where they meet. P8 and P9 use the pro-étale descent of DiamondsAndVStacks and the sousperfectoid coefficient theory of AdicSpacesPartII, which in turn build on P0–P7.

## Scope and ownership

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The prerequisites beside each target name the declarations, the earlier target or the layer that supply its inputs. Library declarations are imported in their existing namespaces. Conditional supplier signatures in Suggested.lean remain in this roadmap’s namespace.

The pinned Tau Ceti library supplies Huber and Tate rings, pseudouniformizers, pairs of definition, power-bounded elements, boundedness, Huber pairs and their morphisms, valuation spectra, rational subsets and completed localization. The current library, checked at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, additionally supplies `TauCeti.Huber.IsUniform` and its reducedness theorem for T₀ uniform Tate rings. The signatures at the older pin express uniformity by boundedness of the power-bounded subring.

AdicSpaces Layers 3–5 supply the structure presheaf, sheafiness, Tate acyclicity, adic spaces and gluing. They are roadmap contracts, not declarations imported by this file at the older pin. Stable uniformity comes from AdicSpaces 4.2; the current library has no declaration named `IsStablyUniform`. AdicSpaces 6.1 supplies the perfect characteristic-p field F with its identity tilt and `A_inf = W(O_F)`. These objects are not new targets here. The Witt-vector completeness and separatedness inputs are `WittVector.isAdicComplete_span_p_teichmuller` and `WittVector.isHausdorff_span_p_teichmuller` in `TauCeti.RingTheory.WittVector.Complete`; their topological form is `TauCeti.WittVector.completeSpace_and_t2Space_adicTopology_span_p_teichmuller`. The Huber-ring structure is `TauCeti.Huber.isHuberRing_adicTopology_span_p_teichmuller`. Untilts over general perfectoid Tate pairs and their primitive-ideal classification are the new part of Layer 1.

Mathlib supplies `WittVector`, `WittVector.teichmuller`, `Perfection`, `PreTilt`, `PreTilt.untilt`, `WittVector.fontaineTheta`, `WittVector.surjective_fontaineTheta`, henselian rings, étale algebras, finite étale algebra categories, flat and faithfully flat modules, adic completion, Kähler differentials, the naive cotangent complex, Serre-class localizations, sheaf cohomology and cardinal arithmetic. The full cotangent complex is a new Layer 0 construction. The kernel of Fontaine’s map is a new Layer 1 theorem. The general Tate-ring tilt is compared with the integral `PreTilt` and the valued-field `Tilt`; it is not a second carrier for either library object.

Other existing inputs are the completion homeomorphism `TauCeti.ValuationSpectrum.spaCompletionHomeomorph`, spectrality of pullback for Tate sources `TauCeti.ValuationSpectrum.isSpectralMap_spaComap_of_isTateRing`, `TauCeti.HenselianRing.exists_isIdempotentElem_sub_mem`, `IsAdicComplete.henselianRing`, `Subgroup.exists_le_of_iInf_le_of_directed`, and `Perfection.quotientMulEquiv`. The completion and pullback results retain their hypotheses in the supplier contracts. SchemeAndStackFoundations supplies henselizations of pairs; AdicEtaleGeometry supplies filtered-colimit descent of finite étale algebras and finite étale Galois torsors. Layer 8 extends the latter to finite actions with stabilizers. AdicSpaces supplies quotient-pair closed immersions; Layer 4 distinguishes their Zariski and strongly Zariski closed perfectoid variants. The ordinary Čech acyclicity of perfectoid affinoids consumes AdicSpaces’ stably uniform sheaf theorem.

The boundaries with the neighbouring roadmaps are as follows. AdicEtaleGeometry defines étale morphisms of general analytic adic spaces; P3 defines them for perfectoid spaces and proves the comparison. DiamondsAndVStacks constructs pro-étale and v-topologies on perfectoid spaces and the diamonds; P6 constructs the pro-étale morphisms themselves and the κ-small calculus they need, and P8 proves the quotient statements that identify the represented v-sheaf of a finite quotient. AdicSpacesPartII owns the completed tensor product of Tate rings and the sousperfectoid coefficient theory; P2 proves that completed tensor products of perfectoid rings are perfectoid, and P9 proves the torsor descent with coefficients. Prismatic cohomology, quasisyntomic rings and the general perfectoidization of animated rings are not targets here: P4 and P8 state exactly the perfectoidization statements they need (initial integral perfectoid rings under semiperfectoid rings and under integral extensions of integral perfectoid rings). The locally analytic distribution theory on the coefficient spaces of P9 and the Shimura-variety applications of P7–P9 belong to the roadmaps that consume this one.

## Conventions

Fix a prime p. A perfectoid Tate ring is complete and Hausdorff, uniform, and has a pseudouniformizer ϖ with ϖ^p | p in R° such that Frobenius R°/ϖ → R°/ϖ^p is an isomorphism; injectivity of Frobenius is automatic and the condition does not depend on ϖ. No perfectoid base field is fixed; statements that hold only over a perfectoid field say so. A perfectoid Tate pair (R, R⁺) is a Tau Ceti Huber pair with R perfectoid; R° is its maximal ring of integral elements and R°° the topologically nilpotent elements. `Perfd` denotes perfectoid spaces of all characteristics and `Perf` its characteristic-p subcategory; `X♭` is the tilt, `♯` the sharp map, which is multiplicative and continuous but not additive. Almost mathematics is always with respect to a stated basic setup (V, m): m idempotent with m ⊗_V m flat; for a perfectoid Tate ring the setup is (R°, R°°), equivalently the root ideal (ϖ^{1/p^∞}) of a pseudouniformizer with compatible p-power roots, and the two setups on R⁺ ⊆ R° are compared explicitly. "Almost zero", "almost isomorphism", "almost finite étale" and "almost acyclic" are relative to that setup; an almost statement is never silently upgraded to an actual one.

Rings of integral elements are open, integrally closed and contained in R°; completed colimits of Tate pairs complete the colimit of the plus rings ϖ-adically and invert ϖ. "qcqs" means quasicompact and quasiseparated; morphisms of perfectoid spaces are morphisms of adic spaces. Tilde-limits carry both the topological condition and the affinoid density condition. Cardinals: κ-smallness bounds the point set and each affinoid ring separately; uniformly κ-small requires one cardinal λ < κ bounding all of them; the cutoff cardinals are strong limits and may be singular. Finite group quotients are categorical quotients in adic spaces, not finite étale torsors unless the action is free. Pro-étale Galois towers have profinite group G with the tower's finite levels indexed by open normal subgroups.

API names are the interfaces to implement; the examples record behaviour a definition must have and cases it must distinguish. [Suggested.lean](Suggested.lean) gives suggested typed forms for a representative part of the targets; the statements here are the specification.

## Exact supplier contracts

| Supplier | Interface used here |
| --- | --- |
| AdicSpaces Layers 0–1 | Tate rings, pseudouniformizers, bounded sets, pairs of definition, completion, valuation spectra and continuous valuations |
| AdicSpaces Layers 2–3 | Huber pairs, `Spa`, rational subsets, completed rational localisation, structure presheaf, stalks, residue fields, pre-adic spaces |
| AdicSpaces Layers 4–5 | Stable uniformity and Buzzard–Verberkmoes sheafiness, Tate acyclicity, adic spaces, open and closed subspaces, gluing |
| ModularCurves Layer 0e | Effective faithfully flat descent of modules and algebras, transported to almost modules in P0 |
| `AdicEtaleGeometry:A0`, `A1`, `A3` | Fibre products of analytic adic spaces, étale and finite étale morphisms of adic spaces with the étale site, the pro-étale site convention, and affinoid étale approximation at a finite stage |
| `AdicSpacesPartII:R0`, `R1`, `R3`, `R5` | Completed tensor products and uniform completed tensor products, analytification, spectral seminorms, finite projective modules and trace forms over sheafy Tate rings, sousperfectoid rings and mixed completed tensor products with their coefficient sheaves |
| `DiamondsAndVStacks:D0`, `D2`–`D6` | Cofiltered limits of spectral spaces, the cutoff cardinal and pro-categories, Čech-to-derived comparison, v-descent of functions, locally profinite torsors, spatial diamonds and the diamond functor `Spd` |
| `SchemeAndStackFoundations` | Scheme-theoretic smoothness, étale algebra structure schemes and the henselisation of pairs used in P3 |

## How to read the build

Layers 0 and 1 meet at the basic setup of a perfectoid ring. Layer 2 constructs local and global geometry; Layers 3–6 supply étale maps, immersions, limits, and pro-étale maps. Layers 7–9 apply these inputs to towers, finite quotients, and continuous torsor descent. Companion contracts marked as gaps are prerequisites still requiring a complete statement.

<a id="p0"></a>

## Layer 0: Almost mathematics over a basic setup

Almost mathematics is developed over an abstract basic setup, so that it can be instantiated later for (R°, R°°) and for the root ideal of a pseudouniformizer without circularity. The almost category is the Serre-quotient of V-modules by almost zero modules, with the functors of almost elements and the left adjoint, the closed symmetric monoidal structure, almost algebras, almost finite generation and presentation, flatness, projectivity and finite étaleness, the almost cotangent complex with its deformation theory, faithfully flat descent, tight henselian pairs with lifting of finite étale algebras, completion and inversion of an element of m, and almost sheaf cohomology.

**Basic setup.**

<a id="p0-1"></a>

### 0.1 Basic setup (V, m): an idempotent ideal with flat m ⊗ m

A basic setup is a pair S = (V, m) of a commutative ring V and an ideal m ⊆ V such that (i) m is idempotent, m·m = m (Mathlib `IsIdempotentElem m` in the semiring `Ideal V`), and (ii) the V-module m̃ := m ⊗_V m is flat. Condition (i) is Gabber–Ramero's basic setup (GR (2.1.1)); condition (ii) is the flatness GR assume from (2.5.14) on, imposed here once for all almost mathematics of this roadmap. Pinned conventions: a V-module M is almost zero if m·M = 0; a V-linear map is an almost isomorphism if its kernel and cokernel are almost zero; m̃ always denotes the tensor product m ⊗_V m (it maps onto m·m = m, isomorphically when m is flat); the classical limit is m = V. A basic setup is data, not a type class, because one ring carries several setups (for a perfectoid Tate ring R, (R°, R°°) and (R⁺, the root ideal of a pseudouniformiser), compared in PerfectoidSpaces:P1).

Assume throughout this subsection: V is a commutative ring (Lean: `[CommRing V]` in universe u); m is an ideal of V.

Provide the interfaces `Almost.BasicSetup`, `Almost.BasicSetup.tilde`, `Almost.BasicSetup.ideal_mul_self`.

**Checks.**

- `BasicSetup.test_classical`: For every commutative ring V, `BasicSetup.classical V` (ideal = ⊤) is a basic setup and `(classical V).IsAlmostZero M ↔ Subsingleton M`.
- `BasicSetup.test_zero_ideal`: For every V, (V, ⊥) is a basic setup ((⊥)·(⊥) = ⊥, ⊥ ⊗ ⊥ = 0 is flat) and every V-module is almost zero for it.
- `BasicSetup.test_not_dvr`: For V = ℤ_[p] and m = maximal ideal: m * m ≠ m, so there is no `BasicSetup` with this ideal; accordingly ℤ/p² (an extension of ℤ/p by ℤ/p, both killed by m) is not killed by m, so a definition accepting non-idempotent ideals would lose closure of almost zero modules under extensions.

Source: [GR](#source-gr) §2.1, (2.1.1), p. 7.

*Needs:* `mathlib:IsIdempotentElem`, `mathlib:Module.Flat`, `mathlib:Ideal.span`.

<a id="p0-2"></a>

### 0.2 The basic setup of an element with compatible p-power roots

Let V be a commutative ring, p ≥ 2 an integer and (ϖ_n)_{n≥0} a sequence in V with ϖ_{n+1}^p = ϖ_n for all n; put ϖ := ϖ_0 and m := ⋃_n ϖ_n V = Ideal.span {ϖ_n}. Then (V, m) is a basic setup, the root setup of (ϖ_n): m is the increasing union of the principal ideals ϖ_n V, m·m = m, and m̃ is flat by GR Proposition 2.1.7(i), because the increasing principal ideals and idempotence give condition (A). No nonzerodivisor hypothesis is used for this assertion: the proposition applies even when the roots have annihilators. Flatness of m itself is a separate conclusion below. A V-module M is almost zero for it iff ϖ_n M = 0 for all n. If ϖ is a nonzerodivisor of V then every ϖ_n is a nonzerodivisor, each ϖ_n V is free of rank one, m is flat and countably generated, and the multiplication m̃ → m is an isomorphism. Replacing (ϖ_n) by the shifted sequence (ϖ_{n+k})_n, or by any sequence (ϖ'_n) with ϖ'_n V = ϖ_{n+c} V for all large n, gives the same setup. This is the input PerfectoidSpaces:P1 instantiates with a pseudouniformiser admitting compatible p-power roots (ECD Definition 3.21).

Provide the interfaces `Almost.BasicSetup.ofCompatibleRoots`, `Almost.BasicSetup.ofCompatibleRoots_ideal`, `Almost.BasicSetup.mem_ofCompatibleRoots_ideal`.

**Checks.**

- `BasicSetup.ofCompatibleRoots_test_perfect_polynomial`: For V = 𝔽_p[t^{1/p^∞}] (Mathlib: the perfection of 𝔽_p[t], or an explicit monoid algebra over ℤ[1/p]≥0) and ϖ_n = t^{1/p^n}: V/(t) is not almost zero (t^{1/p} ≠ 0 in it) while V/m ≅ 𝔽_p is almost zero.
- `BasicSetup.ofCompatibleRoots_test_unit`: If ϖ_0 = 1 (e.g. all ϖ_n = 1) then m = V and the root setup is `BasicSetup.classical V`.
- `BasicSetup.ofCompatibleRoots_test_no_roots`: The principal ideal (t) ⊆ 𝔽_p[t] (a single element without roots) is not idempotent, (t)·(t) = (t²); so the root setup cannot be replaced by the ideal generated by ϖ alone.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.2a Almost zero modules and almost isomorphisms are detected by m̃ ⊗ − (GR Remark 2.1.4(i))
- P0.2b Condition (A) implies that m ⊗ m is flat (GR (2.1.6) and Proposition 2.1.7(i))

Source: [GR](#source-gr) (2.1.6) and Proposition 2.1.7(i), p. 8. [ECD](#source-ecd) Definition 3.21, p. 19 supplies the perfectoid application’s almost-zero convention, rather than the arbitrary-ring root construction.

*Needs:* [P0.1](#p0-1).

<a id="p0-3"></a>

### 0.3 The basic setup (K°, K°°) of a valuation ring with non-principal maximal ideal

Let V be a valuation ring (a domain in which the ideals are totally ordered; Mathlib `ValuationRing V` with `IsDomain V`) whose maximal ideal m is not finitely generated (equivalently not principal; for a rank-one valuation: the valuation is nondiscrete, e.g. V = K° for a perfectoid field K). Then (V, m) is a basic setup: m·m = m, m is torsion-free hence flat, and m̃ ≅ m. A V-module is almost zero iff it is killed by m, iff it is a vector space over the residue field k = V/m; in particular k is almost zero. This is the setup of Sch12 §4 and of GR Example 2.1.2(i).

Provide the interfaces `Almost.BasicSetup.ofValuationRing`, `Almost.BasicSetup.ofValuationRing_ideal`, `Almost.BasicSetup.isIdempotentElem_maximalIdeal_iff`.

**Checks.**

- `BasicSetup.ofValuationRing_test_Cp`: For V = 𝒪_{ℂ_p}: the residue field 𝔽̄_p is almost zero, V/pV is not almost zero, and ideal = maximal ideal.
- `BasicSetup.ofValuationRing_test_dvr`: For V = ℤ_p the maximal ideal pℤ_p is finitely generated and (pℤ_p)² ≠ pℤ_p, so `ofValuationRing` does not apply; its hypothesis is necessary.
- `BasicSetup.ofValuationRing_test_field`: For V a field the maximal ideal is 0, which is finitely generated; the construction does not apply, while the zero setup (V, 0) of P0/almost-basic-setup is the degenerate basic setup in which every module is almost zero.

Source: [GR](#source-gr) §2.1, Example 2.1.2(i), p. 7.

*Needs:* [P0.1](#p0-1).

<a id="p0-4"></a>

### 0.4 Firm modules: a small-hom model of the almost category

For a basic setup S = (V, m), call M firm when the multiplication map m̃ ⊗_V M → M is an isomorphism. Let S.Firm be the full subcategory of ModuleCat V on these modules. Kernels, cokernels and finite biproducts remain firm, so this is an abelian category and its inclusion j_! is exact. The functor j*(M) = m̃ ⊗_V M is exact and right adjoint to j_!. Its kernel consists of the almost zero modules. Its right adjoint sends N to Hom_V(m̃, N) and is fully faithful. The quotient of ModuleCat V by almost zero modules is therefore equivalent to S.Firm; almostification is the quotient functor, rather than an identification of objects with their almost elements.

Provide the interfaces `Almost.BasicSetup.IsFirm`, `Almost.BasicSetup.Firm`, `Almost.BasicSetup.firm`.

**Checks.**

- `BasicSetup.Firm.test_tilde`: S.tilde is firm and S.firm.obj (ModuleCat.of V V) ≅ S.tilde.
- `BasicSetup.Firm.test_ring_not_firm`: If S.ideal ≠ ⊤ then ModuleCat.of V V is not firm (the image of m̃ ⊗ V → V is m); and the tempting condition m·M = M does not characterise firm modules: for R = 𝔽_p[t^{1/p^∞}], I = (t^{1/p^∞}) and M the maximal ideal of R/t, IM = M but I ⊗ M → M is not injective (Bhatt Warning 4.1.6).
- `BasicSetup.Firm.test_classical`: For S = classical V every V-module is firm and S.firm ≅ 𝟭 (ModuleCat V).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.4a m̃ ⊗ m ≅ m̃ and m̃ ⊗ m̃ ≅ m̃; symmetric tensors of m (GR Claim 2.1.10 and its proof)
- P0.4b Almost zero modules form a Serre class (Sch12 Lemma 4.2)

Source: [Bhatt](#source-bhatt) §4.1, Construction 4.1.5, p. 18.

*Needs:* [P0.1](#p0-1).

**Almost modules.**

<a id="p0-5"></a>

### 0.5 Almost modules over a basic setup: the Serre quotient V^a-Mod

For a basic setup S = (V, m), the category of almost V-modules V^a-Mod := Almost.Module S is the localization of ModuleCat V at the almost isomorphisms S.almostZero.isoModSerre (maps with almost zero kernel and cokernel), i.e. the Serre quotient of V-modules by the almost zero modules, realised with Mathlib's Serre-class localization: the carrier is `MorphismProperty.Localization'` for the `HasLocalization.{u}` instance of P0.4, so Hom-types are V-modules in the universe of V-modules. The localization functor M ↦ M^a (`Almost.toAlmost S`) is exact and essentially surjective; M^a ≅ 0 iff M is almost zero; f^a is an isomorphism iff f is an almost isomorphism; V^a-Mod is abelian (Mathlib `SerreClassLocalization.abelian`); a functor G out of V^a-Mod to an abelian category is exact iff G ∘ (−)^a is, and an exact functor out of ModuleCat V factors (uniquely up to unique isomorphism) through (−)^a iff it kills almost zero modules. For a perfectoid field K and S = (K°, K°°) this is Sch12's K°a-mod; for a perfectoid Tate ring R, PerfectoidSpaces:P1 instantiates S with (R°, R°°) and (R⁺, root ideal) (ECD Definition 3.23). All almost-vanishing statements in consumers ("H^i(X, O⁺) is almost zero", "R⁺/ϖ is almost the equalizer") are statements in this category.

Provide the interfaces `Almost.Module`, `Almost.toAlmost`, `Almost.toAlmost_isLocalization`.

**Checks.**

- `Almost.Module.test_residue_field`: For S = ofValuationRing 𝒪_{ℂ_p}: (toAlmost S).obj (ModuleCat.of V (IsLocalRing.ResidueField V)) is a zero object, while (toAlmost S).obj (ModuleCat.of V (V ⧸ Ideal.span {p})) is not.
- `Almost.Module.test_classical`: For S = classical V, toAlmost S is an equivalence of categories ModuleCat V ≌ Almost.Module S (every almost isomorphism is an isomorphism).
- `Almost.Module.test_zero_setup`: For the setup (V, ⊥) every object of Almost.Module S is a zero object.

Source: [Sch12](#source-sch12) §4, Definition 4.3, p. 18.

*Needs:* [P0.4b](#p0-4), [P0.4](#p0-4), `mathlib:CategoryTheory.ObjectProperty.isoModSerre`.

<a id="p0-6"></a>

### 0.6 Almost elements M_* and the left adjoint M_! of almostification

For M in S.Almost, write M_* = Hom_{S.Almost}(V^a, M), with its V-module structure, for its almost elements. This functor is right adjoint to almostification; the counit (M_*)^a → M is an isomorphism. For an honest module N, (N^a)_* identifies with Hom_V(m̃, N). Define M_! = m̃ ⊗_V M_*; this is an exact left adjoint of almostification. The comparison maps N → (N^a)_*, (N^a)_! → N and M_! → M_* are almost isomorphisms. Almostification preserves limits and colimits; almost elements preserve limits and injectives, but need not preserve infinite direct sums. The almost category has exact filtered colimits, a generator V^a and enough injectives. For a surjection M → N and x in N_*, each εx with ε in m lifts to M_*; surjectivity of M_* → N_* itself is not asserted.

Provide the interfaces `Almost.Module.elements`, `Almost.Module.adjElements`, `Almost.Module.elementsCounitIso`.

**Checks.**

- `Almost.Module.elements_test_valuation`: For S = ofValuationRing K° and N = K°°: ((toAlmost S).obj N).elements ≅ K° (every x ∈ K with εx ∈ K°° for all ε ∈ K°° lies in K°).
- `Almost.Module.elements_test_not_identity`: For S = ofValuationRing K° (K the completion of ℚ_p(p^{1/p^∞})) the unit K°/ϖ → ((K°/ϖ)^a)_* = Hom(K°°, K°/ϖ) is injective but not surjective (Sch12 Remark 4.8): almost elements of N^a are not elements of N.
- `Almost.Module.elements_test_classical`: For S = classical V: M.elements ≅ M.shriek and both are inverse to toAlmost.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.6a Hom(M^a, N^a) = Hom_V(m̃ ⊗ M, N) (GR (2.2.4))

Source: [GR](#source-gr) §2.2, Proposition 2.2.13(ii), p. 14.

*Needs:* [P0.5](#p0-5).

<a id="p0-7"></a>

### 0.7 The closed symmetric monoidal structure on almost modules

For a basic setup S = (V, m), Almost.Module S carries the symmetric monoidal structure localized from ModuleCat V (Mathlib `LocalizedMonoidal` for the monoidal class of almost isomorphisms, P0.7a), with unit V^a (≅ m^a): the localization functor M ↦ M^a is symmetric monoidal, M^a ⊗ N^a ≅ (M ⊗_V N)^a, and M ⊗ N ≅ (M_* ⊗_V N_*)^a ≅ (M_! ⊗_V N_!)^a. The tensor product is right exact in each variable. Define the internal Hom by almostifying the V-module of almost morphisms; it satisfies Hom(L ⊗ M, N) ≅ Hom(L, alHom(M, N)). For honest modules, alHom(M^a, N^a) ≅ Hom_V(m̃ ⊗ M, N)^a. These formulas supply the closed structure, rather than merely the tensor product.

Provide the interfaces `Almost.isoModSerre_isMonoidal`, `Almost.Module.monoidalCategory`, `Almost.Module.symmetricCategory`.

**Checks.**

- `Almost.Module.tensor_test_residue`: For S = ofValuationRing K°: (toAlmost S).obj k ⊗ X ≅ 0 for every X, and (toAlmost S).obj K°° ⊗ (toAlmost S).obj K°° ≅ 𝟙_ (Almost.Module S).
- `Almost.Module.tensor_test_unit`: 𝟙_ (Almost.Module S) ≅ (toAlmost S).obj (ModuleCat.of V V) ≅ (toAlmost S).obj (ModuleCat.of V S.ideal).
- `Almost.Module.tensor_test_mathlib`: toAlmost S is a symmetric monoidal functor out of Mathlib's `ModuleCat.monoidalCategory`; for S = classical V the equivalence Almost.Module.classicalEquiv is monoidal.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.7a Almost isomorphisms are stable under tensor products (GR (2.2.5))

Source: [GR](#source-gr) (2.2.4)–(2.2.5), pp. 11–12, and (2.2.10)–(2.2.11), p. 13, for an arbitrary basic setup; [Sch12](#source-sch12) §4, Proposition 4.5, p. 19, for the perfectoid-field setup.

*Needs:* [P0.6a](#p0-6).

<a id="p0-8"></a>

### 0.8 Almost algebras (commutative monoids in V^a-Mod) and their modules

An almost algebra over (V, m) is a commutative unital monoid in the closed symmetric monoidal category S.Almost. Its almost elements A_* form an ordinary commutative V-algebra. Almostification from ordinary V-algebras is left adjoint to almost elements, with invertible counit (A_*)^a → A. An A-module is a module object for this monoid; their category is abelian, complete, cocomplete and closed symmetric monoidal over A. Its relative tensor product is the almostification of the tensor product over A_*, and it identifies with the almost module category for the base-changed setup (A_*, mA_*). Finiteness conditions refer to A-modules and are evaluated on almost elements; they do not assert ordinary finiteness of A_* or M_*.

Provide the interfaces `Almost.Algebra`, `Almost.Algebra.toAlmost`, `Almost.Algebra.elements`.

**Checks.**

- `Almost.Algebra.test_mod_varpi`: For K the completion of ℚ_p(p^{1/p^∞}) and a nonzero pseudo-uniformizer ϖ, the almost algebra (K°/ϖ)^a has almost elements Hom_{K°}(K°°, K°/ϖ); the natural map from K°/ϖ is injective and need not be onto (Sch12 Remark 4.8, p. 20).
- `Almost.Algebra.test_classical`: For S = classical V, Almost.Algebra.toAlmost is an equivalence CommAlgCat V ≌ Almost.Algebra S.
- `Almost.Algebra.test_modules`: For a V-algebra R: modules over (toAlmost R) in Almost.Module S are equivalent to Almost.Module (S.baseChange R), compatibly with Mathlib's restriction of scalars ModuleCat R ⥤ ModuleCat V.

Source: [GR](#source-gr) §2.2, (2.2.5), p. 12.

*Needs:* [P0.7](#p0-7).

<a id="p0-9"></a>

### 0.9 The left adjoint B ↦ B_!! of almostification on algebras

For an almost algebra B over (V, m), the module B_! = m̃ ⊗_V B_* has its natural nonunital V-algebra structure. Define B_!! as the quotient of V ⊕ B_! by the relations (xy, −x ⊗ y ⊗ 1), for x,y in m, using the multiplication on this unital extension. The base ring in this construction is V. There is a canonical isomorphism (B_!!)^a ≅ B. Relative to an almost algebra A, the resulting functor to A_!!-algebras is left adjoint to almostification. Call B exact when 0 → m̃ → V ⊕ B_! → B_!! → 0 is exact. Flatness of m implies exactness for every B, while V^a × B is always exact. This construction commutes with colimits and relative tensor products, and B_!! → B_* is an almost isomorphism. It preserves and reflects faithful flatness; no preservation of flatness alone is claimed.

Provide the interfaces `Almost.Algebra.shriekShriek`, `Almost.Algebra.shriekShriekAdj`, `Almost.Algebra.shriekShriekUnitIso`.

**Checks.**

- `Almost.Algebra.shriekShriek_test_unit`: (Almost.Algebra.toAlmost S (CommAlgCat.of V V)).shriekShriek ≅ V as V-algebras.
- `Almost.Algebra.shriekShriek_test_not_flat`: For S = ofValuationRing V with residue field k: the projection V × V → V is flat but its image under (−)^a then (−)_!! is V ×_k V → V, which is not flat (GR Remark 3.1.3(ii)); so flatness of almost algebra maps cannot be defined through (−)_!!.
- `Almost.Algebra.shriekShriek_test_classical`: For S = classical V: B.shriekShriek ≅ B.elements for every almost algebra B.

Source: [GR](#source-gr) §2.2, Construction 2.2.23 and Proposition 2.2.27, pp. 15–16.

*Needs:* [P0.8](#p0-8).

<a id="p0-10"></a>

### 0.10 Almost finitely generated, uniformly almost finitely generated and almost finitely presented modules

For an A-module M, almost finite generation means that, for each finitely generated ideal m₀ contained in m, some map A^n → M has cokernel annihilated by m₀. Uniform almost finite generation requires a single n working for every m₀. Almost finite presentation means that for each m₀ there is a complex A^k → A^n → M whose cokernel is annihilated by m₀ and for which m₀ times the kernel of A^n → M lies in the image of A^k. The integers k and n may depend on m₀. These conditions are unchanged by almost isomorphisms and hence define properties in the almost category. Under condition (A), the equivalent ε-criteria use presentations with kernel and cokernel killed by the specified ε; such criteria must retain their condition-(A) hypothesis.

Provide the interfaces `Almost.Module.AlmostFG`, `Almost.Module.UniformlyAlmostFG`, `Almost.Module.AlmostFP`.

**Checks.**

- `Almost.Module.AlmostFG_test_quadratic`: For K the completion of ℚ_p(p^{1/p^∞}), p ≠ 2, and L = K(√p): with R_n = K° ⊕ p^{1/2p^n}K° ⊆ L°, the cokernel of R_n → L° is killed by p^{1/p^{n−1}}, so L°a is UniformlyAlmostFG with bound 2 and AlmostFP (Bhatt Example 4.2.7).
- `Almost.Module.AlmostFG_test_zero`: Every almost zero R-module N gives N^a ≅ 0, which is UniformlyAlmostFG with bound 0 and AlmostFP.
- `Almost.Module.AlmostFG_test_classical`: For S = classical V: AlmostFG (N^a) ↔ Module.Finite R N and AlmostFP (N^a) ↔ Module.FinitePresentation R N.
- `Almost.Module.UniformlyAlmostFG_test_bound_zero`: For a nonzero classical base V, V is not uniformly almost finitely generated with bound 0. A bound of 0 is reserved for the almost zero module.

Source: [GR](#source-gr) §2.3, Proposition 2.3.10(i), p. 18.

*Needs:* [P0.8](#p0-8).

<a id="p0-11"></a>

### 0.11 Flat, faithfully flat, almost projective and almost finite projective almost modules

An A-module is flat when tensoring with it is exact, faithfully flat when tensoring is exact and reflects zero objects, and almost projective when its internal Hom functor is exact. Here internal Hom is the almost-module-valued functor, not the set of categorical morphisms. Almost finite projective means almost projective and almost finitely generated; uniform almost finite projectivity adds the uniform bound of P0.10. Almostification carries ordinary flat, faithfully flat and projective modules to these respective classes. Establish the Tor and internal-Ext criteria, the ε-factorisation criterion through finite free modules, and the equivalence of almost finite projectivity with flatness plus almost finite presentation. None of these assertions makes the almost unit categorically projective in a nontrivial almost setup.

Provide the interfaces `Almost.Module.Flat`, `Almost.Module.FaithfullyFlat`, `Almost.Module.AlmostProjective`.

**Checks.**

- `Almost.Module.Flat_test_valuation`: For S = ofValuationRing K°: (toAlmost S).obj K° is Flat and (toAlmost S).obj (K° ⧸ ϖ) is not Flat (its almost elements have ϖ-torsion).
- `Almost.Module.AlmostProjective_test_not_projective`: The unit almost module is almost projective. Categorical projectivity must not replace this definition: in the nondiscrete valuation setup, Sch12 Remark 4.8, p. 20, gives a field example for which the map on almost elements induced by K° → K°/ϖ is not surjective. The zero setup is excluded from that counterexample, since its unit is zero and is projective.
- `Almost.Module.Flat_test_classical`: For S = classical V and a V-module N: Flat (N^a) ↔ Module.Flat V N, FaithfullyFlat (N^a) ↔ Module.FaithfullyFlat V N, and AlmostProjective (N^a) ↔ Module.Projective V N.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.11a Tor and Ext criteria for almost flatness and almost projectivity (GR (2.4.10))
- P0.11b The ε-criterion for almost finite generation and presentation under condition (A) (GR Remark 2.3.9)

Source: [GR](#source-gr) §2.4, Definition 2.4.4, p. 23.

*Needs:* [P0.8](#p0-8).

<a id="p0-12"></a>

### 0.12 Duals, traces of endomorphisms and the trace form of an almost finite projective algebra

For an almost finite projective A-module P, define P* as its internal Hom into A. Prove that P ⊗_A P* → alEnd_A(P), sending x ⊗ λ to (y ↦ λ(y)x), is an isomorphism. Define the trace of an endomorphism by its inverse followed by evaluation. For an almost finite projective A-algebra B, compose the multiplication representation B → alEnd_A(B) with this trace to obtain Tr_{B/A}; the trace pairing sends b ⊗ c to Tr_{B/A}(bc), and its adjoint is τ_B : B → B*. Prove cyclicity, compatibility with tensor products and exact sequences of finite projectives, base change, and transitivity in towers of such algebras. In the classical free case this agrees with Mathlib's matrix or linear-map trace; the definition does not use a basis for a general projective module.

Provide the interfaces `Almost.Module.dual`, `Almost.Module.dualTensorHomIso`, `Almost.Module.trace`.

**Checks.**

- `Almost.Module.trace_test_free`: For P = (toAlmost _).obj (Fin n → R): Almost.Module.trace P ((toAlmost _).map f) = (toAlmost _).map (LinearMap.trace R _ f) (Mathlib's trace), and for a free finite R-algebra R', Almost.Algebra.trace = (Algebra.trace R R')^a.
- `Almost.Algebra.trace_test_quadratic`: For K the completion of ℚ_p(p^{1/p^∞}), p ≠ 2, L = K(√p): Tr_{L°a/K°a}(1) = 2 and IsPerfectTraceForm (L°a/K°a).
- `Almost.Module.trace_test_zero`: For P = 0, tr_{P/A} = 0; for B = 0, Tr_{B/A} = 0 and t_{B/A} is perfect.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.12a E ⊗ alHom(F, N) → alHom(F, E ⊗ N) is an isomorphism for almost finite projective E or F (GR Lemma 2.4.29)

Source: [GR](#source-gr) §4.1, Definition 4.1.1, p. 72.

*Needs:* [P0.7](#p0-7).

<a id="p0-13"></a>

### 0.13 Rank decomposition of uniformly almost finite projective modules

Let S be a basic setup satisfying condition (B) (k-th powers generate m; implied by (A)), A an almost V-algebra and P a uniformly almost finite projective A-module. Then P has finite rank: Λ^r_A P = 0 for some r.

Source: [GR](#source-gr) §4.3, Proposition 4.3.27, p. 88.

*Needs:* [P0.12](#p0-12).

**Almost finite étale algebras.**

<a id="p0-14"></a>

### 0.14 Flat, unramified, étale and finite étale morphisms of almost algebras

Let S be a basic setup and φ : A → B a morphism of almost V-algebras; view B as a B ⊗_A B-algebra through the multiplication μ_{B/A} : B ⊗_A B → B, with kernel I_{B/A}. Following GR Definition 3.1.1: φ is flat (faithfully flat, almost projective) if B is a flat (faithfully flat, almost projective) A-module; (uniformly) almost finite if B is a (uniformly) almost finitely generated A-module; weakly unramified (unramified) if B is a flat (almost projective) B ⊗_A B-module; weakly étale (étale) if flat and weakly unramified (unramified). φ is finite étale if it is étale and B is an almost finitely presented A-module (Sch12 Definition 4.13; GR's A-Ét_afp; Kedlaya–Liu's and Bhatt's 'almost finite étale'); then B is almost finite projective over A (P0.25a). A_fet denotes the full subcategory of A-algebras that are finite étale over A. Equivalent descriptions: unramified iff there is a diagonal idempotent e ∈ (B ⊗_A B)_* with μ(e) = 1 and I_{B/A,*}·e = 0 (P0.15a, Sch12's definition); for B almost finite projective over A, étale iff the trace form t_{B/A} is perfect (P0.15).

Provide the interfaces `Almost.Algebra.IsFlat`, `Almost.Algebra.IsUnramified`, `Almost.Algebra.IsEtale`.

**Checks.**

- `Almost.Algebra.IsFiniteEtale_test_quadratic`: For K the completion of ℚ_p(p^{1/p^∞}), p ≠ 2, L = K(√p): IsFiniteEtale ((toAlmost _).map (algebraMap K° L°)) over S = ofValuationRing K°.
- `Almost.Algebra.IsFiniteEtale_test_idempotent_not_honest`: In the same example the diagonal idempotent is an almost element of L°a ⊗ L°a but does not lie in L° ⊗_{K°} L° (only p^{1/p^n}e does, for every n): a definition requiring an honest idempotent of B_* ⊗_{A_*} B_* would reject L°a/K°a.
- `Almost.Algebra.IsFiniteEtale_test_classical`: For S = classical V and a V-algebra map R → R': IsFiniteEtale ((toAlmost S).map f) ↔ Algebra.Etale R R' ∧ Module.Finite R R' (Mathlib).

Source: [GR](#source-gr) §3.1, Definition 3.1.1(iii)-(iv), p. 39.

*Needs:* [P0.11](#p0-11), [P0.10](#p0-10), [P0.8](#p0-8).

<a id="p0-15"></a>

### 0.15 Almost finite projective algebras are étale iff the trace form is perfect

Let S be a basic setup and φ : A → B a morphism of almost algebras with B almost finite projective as an A-module. Then φ is étale iff the trace form t_{B/A} : B ⊗_A B → A is a perfect pairing, i.e. τ_{B/A} : B → B* = alHom_A(B, A) is an isomorphism..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.15a Unramified ⟺ existence of the diagonal idempotent (GR Proposition 3.1.4)

Source: [GR](#source-gr) §4.1, Theorem 4.1.14, p. 75.

*Needs:* [P0.12](#p0-12).

<a id="p0-16"></a>

### 0.16 Inverting an element of m: almost modules become honest modules over V[1/ϖ]

Let S = (V, m) be a basic setup and ϖ ∈ m. The localisation M ↦ M[1/ϖ] = V[1/ϖ] ⊗_V M is exact and kills almost zero modules (ϖM = 0), so it factors, uniquely up to unique isomorphism, through an exact functor Almost.invert ϖ : Almost.Module S → ModuleCat V[1/ϖ] with invert(M^a) ≅ M[1/ϖ] and invert(M) ≅ M_*[1/ϖ] ≅ M_![1/ϖ].

Provide the interfaces `Almost.invert`, `Almost.toAlmostCompInvertIso`, `Almost.invert_preservesFiniteLimits`.

**Checks.**

- `Almost.invert_test_residue`: For a perfectoid field K and a nonzero ϖ ∈ K°°, inverting ϖ sends (K°/ϖ)^a to zero and K°a to K. Nonzero ϖ is needed for the latter identification.
- `Almost.invert_test_unit`: If ϖ is a unit of V (then S.ideal = ⊤ as ϖ ∈ S.ideal), invert ϖ ≅ Almost.Module.elements composed with the identification V[1/ϖ] = V.
- `Almost.invert_test_not_equivalence`: invert ϖ is not faithful: for S = ofValuationRing K°, the nonzero almost module (K°/ϖ)^a is sent to 0 (Bhatt Exercise 4.1.9); almost statements are strictly finer than statements after inverting ϖ.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.16a Base change of a basic setup along a ring map V → W (GR Remark 2.1.4(ii))
- P0.16b Change of basic setup: (W, mW)^a-Mod ≃ W^a-Mod, and invariance under almost isomorphic base rings (GR Remark 2.2.12)

Source: [GR](#source-gr) §5.2, proof of Corollary 5.2.15, p. 110.

*Needs:* [P0.5](#p0-5).

<a id="p0-17"></a>

### 0.17 Comparison of finite étale almost algebras with Mathlib's finite étale algebras

Let S = (V, m) be a basic setup and R → R' a map of commutative V-algebras. (i) If R' is finite étale over R in Mathlib's sense (`Algebra.Etale R R'` and `Module.Finite R R'`), then R^a → R'^a is finite étale in the almost sense. (ii) In the classical setup (m = V) the converse holds, so A_fet for A = R^a is equivalent to Mathlib's category of finite étale R-algebras. (iii) For ϖ ∈ m, if R'^a is finite étale over R^a then R'[1/ϖ] is finite étale over R[1/ϖ] in Mathlib's sense (inverting ϖ turns almost statements into honest ones, P0.16). (iv) GR-étale morphisms in the classical setup are exactly the absolutely flat (weakly étale) maps whose diagonal is almost projective; they need not be of finite presentation, and a classical étale map in EGA's sense is étale in GR's sense.

Source: [GR](#source-gr) §3.4, (3.4.44), p. 64, which states the comparison only in the classical limit m = V; **Gap.** For a general basic setup, almostification and inversion require the comparison between the stated finite-projectivity and unramified predicates. The cited classical-limit discussion does not supply those interfaces; a proof remains required.

*Needs:* [P0.14](#p0-14).

<a id="p0-18"></a>

### 0.18 Almost Kähler differentials Ω_{B/A} and almost derivations

For an almost A-algebra B, let I be the kernel of multiplication B ⊗_A B → B and define Ω_{B/A} = I/I². The universal derivation is b ↦ 1 ⊗ b − b ⊗ 1 modulo I². An A-derivation into a B-module M is A-linear and satisfies d(bc) = b d(c) + c d(b). Prove that B-linear maps Ω_{B/A} → M identify with these derivations. Supply base change, the conormal exact sequence, the right-exact transitivity sequence and compatibility with filtered colimits. Compare the left-adjoint module of Ω_{B/A} with the ordinary differentials of B_!! over A_!!, and in the classical setup identify the construction with Mathlib's Kähler differentials. The conormal sequence is right exact; no unconditional injectivity on its left is asserted.

Provide the interfaces `Almost.Algebra.kaehlerDifferential`, `Almost.Algebra.kaehlerDifferential.d`, `Almost.Algebra.Derivation`.

**Checks.**

- `Almost.Algebra.kaehler_test_polynomial`: For A an almost algebra and B = (A_*[X])^a: Ω_{B/A} ≅ B, generated by δX.
- `Almost.Algebra.kaehler_test_self`: Ω_{A/A} = 0 and, for an ideal I, Ω_{(A/I)/A} = 0.
- `Almost.Algebra.kaehler_test_mathlib`: For V-algebras R → R': Ω_{R'^a/R^a} ≅ (toAlmost _).obj (KaehlerDifferential R R') as R'^a-modules, compatible with the derivations.

Source: [GR](#source-gr) §2.5, Definition 2.5.22(ii), p. 33.

*Needs:* [P0.8](#p0-8).

<a id="p0-19"></a>

### 0.19 The cotangent complex of a ring map and its deformation theory

For a map of commutative rings R → S, the cotangent complex L_{S/R} ∈ D(S) is the complex of Kähler differentials of a simplicial resolution of S by polynomial R-algebras (Illusie's standard resolution), together with: (a) H_0(L_{S/R}) ≅ Ω_{S/R}, compatibly with Mathlib's `KaehlerDifferential`, and H_1 compatible with the truncation `Algebra.Extension.Cotangent`; (b) the transitivity triangle S ⊗_T^L L_{T/R} → L_{S/R} → L_{S/T} for R → T → S; (c) base change L_{S'/R'} ≃ S' ⊗_S^L L_{S/R} for a Tor-independent square; (d) commutation with filtered colimits of rings; (e) Ext^0_S(L_{S/R}, M) ≅ Der_R(S, M) and Ext^1_S(L_{S/R}, M) ≅ Exal_R(S, M), the group of square-zero R-extensions of S by M; (f) for a flat R-algebra S and a square-zero extension R' → R with kernel J, the obstruction to a flat deformation of S over R' lies in Ext^2_S(L_{S/R}, S ⊗_R J), deformations form a torsor under Ext^1 and automorphisms are Ext^0, and, for a square-zero extension T′ → T of R-algebras with specified kernel J and a map S → T, the obstruction to an R-algebra lift S → T′ lies in Ext^1_S(L_{S/R}, J), where S acts on J through S → T, with lifts a torsor under Ext^0; (g) for a map of simplicial rings R_• → S_•, the diagonal complex L^Δ with the spectral sequence H_j(L_{S_i/R_i}) ⇒ H_{i+j}(L^Δ), and L_{S/R} ≃ L^Δ for simplicial resolutions.

Provide the interfaces `CotangentComplex`, `CotangentComplex.homologyZeroIso`, `CotangentComplex.transitivityTriangle`.

**Checks.**

- `cotangentComplex_polynomial`: For S = R[X_i] the complex is Ω_{S/R} in degree 0 (free on the dX_i).
- `cotangentComplex_perfect_charP`: For a perfect 𝔽_p-algebra S, L_{S/𝔽_p} ≃ 0 (Frobenius is an isomorphism, so the relative Frobenius criterion applies).
- `cotangentComplex_not_concentrated_in_degree_zero`: For S = R/(f) with f a nonzerodivisor and (f) a proper ideal, L_{S/R} ≃ (f)/(f²)[1] ≠ 0: a definition returning only Ω_{S/R} = 0 is wrong.

- `cotangentComplex_regular_integer_quotient`: For R = ℤ and f = 2, the degree-one homology is ℤ/2ℤ.
- `cotangentComplex_unit_quotient`: For f = 1, the quotient ring and its cotangent complex are zero; a nonzerodivisor alone does not imply nonzero homology.

Source: [Stacks](#source-stacks) Tags 08QX (transitivity triangle), 08QQ (Tor-independent base change), 08S9 (filtered colimits), 08SP (deformations: obstruction in Ext², torsor under Ext¹, automorphisms Ext⁰); [Illusie](#source-illusie) Chapter II, 1.2.3 (definition), 1.2.4.2 (Ext⁰ and Exal), II.1.2.6.2 (the spectral sequence of the diagonal complex), Chapter III, 2.2.2 (lifting morphisms); the diagonal spectral sequence in (g) is an explicit source gap: the stated Illusie locator has not been checked. For Ext¹ and lifting, use Stacks Lemmas 91.2.1 (Tag 08S5) and 91.2.3 (Tag 0GPT), together with Lemma 92.11.3 (Tag 08RB), identifying the naive complex with the two-term truncation of the full complex. In the lifting clause, the coefficient is the specified square-zero kernel viewed as an S-module through S → T; it is not an unspecified tensor product T ⊗ J.

*Needs:* `mathlib:KaehlerDifferential`, `mathlib:Algebra.Extension.Cotangent`, `mathlib:CategoryTheory.SimplicialObject`.

**Almost cotangent complex.**

<a id="p0-20"></a>

### 0.20 The almost cotangent complex L_{B/A}

Let S be a basic setup and A → B a morphism of almost algebras. Put Ã := V^a × A and B̃ := V^a × B (exact almost algebras). The almost cotangent complex is L_{B/A} := B_!! ⊗_{B̃_!!} L_{B̃_!!/Ã_!!}, an object of the derived category of B_!!-modules, where L_{−/−} is the classical cotangent complex of the ring map Ã_!! → B̃_!! (simplicial polynomial resolution; P0.19); its almostification L^a_{B/A} ∈ D(B-Mod) is the object used in deformation theory. Properties: H_0(L^a_{B/A}) ≅ Ω_{B/A};

Provide the interfaces `Almost.cotangentComplex`, `Almost.almostCotangentComplex`, `Almost.cotangentComplex_H0`.

**Checks.**

- `Almost.cotangentComplex_test_polynomial`: For B = (A_*[X])^a: H_0(L^a_{B/A}) ≅ B·δX and H_i(L^a_{B/A}) = 0 for i > 0.
- `Almost.cotangentComplex_test_identity`: L_{A/A} ≃ 0 for every almost algebra A (the identity of Ã_!!).
- `Almost.cotangentComplex_test_classical`: For S = classical V and V-algebras R → R': L^a_{R'^a/R^a} ≅ L_{R'/R} (DD.0's cotangent complex), and H_1 agrees with Mathlib's `Algebra.H1Cotangent R R'`.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.20a The almost cotangent complex of R^a → S^a is the almostified classical one (GR Proposition 8.1.7)
- P0.20b Tor-independent base change for almost cotangent complexes (GR Theorem 2.5.35)

Source: [GR](#source-gr) §2.5, Definition 2.5.20, p. 32.

*Needs:* [P0.9](#p0-9), [P0.18](#p0-18), [P0.8](#p0-8).

<a id="p0-21"></a>

### 0.21 Square-zero extensions of almost algebras are classified by Ext¹ of the almost cotangent complex

Let S be a basic setup, A → B a morphism of almost algebras and M a B-module. (i) Almostification Exal_{A!!}(B_!!, M_*) → Exal_A(B, M) is an equivalence of categories of square-zero extensions, inducing a group isomorphism on isomorphism classes, functorial in all arguments. (ii) There are natural isomorphisms Ext⁰_{B!!}(L_{B/A}, M_!) ≅ Der_A(B, M) and Exal_A(B, M) ≅ Ext¹_{B!!}(L_{B/A}, M_!) ≅ Ext¹_B(L^a_{B/A}, M). (iii) For an epimorphism A → B with kernel I, Hom_B(I/I², M) ≅ Exal_A(B, M) via pullback of 0 → I/I² → A/I² → B → 0.

Source: [GR](#source-gr) §2.5, Lemma 2.5.17(i), p. 32.

*Needs:* [P0.20](#p0-20).

**Nilpotent deformations of almost algebras.**

<a id="p0-22"></a>

### 0.22 Flat square-zero deformations of almost algebras: obstruction, torsor, automorphisms

Let S be a basic setup, A an almost algebra, B̃ = (0 → I → B → B₀ → 0) an A-extension (I² = 0) and f₀ : B₀ → C₀ a flat morphism of almost algebras. Let ω(B̃, f₀) := ∂(I → C₀ ⊗_{B₀} I) ∈ Ext²_{C₀}(L^a_{C₀/B₀}, C₀ ⊗_{B₀} I), ∂ the boundary of the transitivity sequence for B → B₀ → C₀. Then (i) ω(B̃, f₀) = 0 iff there is a flat deformation of C₀ over B, i.e. a B-extension C̃ = (0 → C₀ ⊗ I → C → C₀ → 0) with C flat over B and C ⊗_B B₀ ≅ C₀; (ii) if ω = 0, the isomorphism classes of flat deformations form a torsor under Exal_{B₀}(C₀, C₀ ⊗_{B₀} I) ≅ Ext¹_{C₀}(L^a_{C₀/B₀}, C₀ ⊗_{B₀} I);

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.22a Transitivity triangle for almost cotangent complexes (GR Theorem 2.5.32)
- P0.22b Local flatness criterion for square-zero thickenings, honest and almost (GR (3.2.19))

Source: [GR](#source-gr) §3.2, Proposition 3.2.9, p. 41.

*Needs:* [P0.21](#p0-21), [P0.20](#p0-20), [P0.18](#p0-18).

<a id="p0-23"></a>

### 0.23 Lifting morphisms along square-zero extensions of almost algebras

Let S be a basic setup, A an almost algebra, B̃ an A-extension 0 → I → B → B₀ → 0, and C̃ⁱ = (0 → Jⁱ → Cⁱ → C₀ⁱ → 0), i = 1, 2, A-extensions with morphisms f̃ⁱ : B̃ → C̃ⁱ, together with v : J¹ → J² and g₀ : C₀¹ → C₀² such that u² = v ∘ u¹ and f₀² = g₀ ∘ f₀¹. The class v_* e(C̃¹) − e(C̃²) ∗ g₀ ∈ Ext¹_{C₀¹}(L^a_{C₀¹/B₀}, J²) is the obstruction to a morphism of A-extensions g̃ : C̃¹ → C̃² over v and g₀ with f̃² = g̃ ∘ f̃¹; when it vanishes, such g̃ form a torsor under Der_{B₀}(C₀¹, J²) ≅ Ext⁰_{C₀²}(C₀² ⊗ L^a_{C₀¹/B₀}, J²). In particular, if C and C' are flat over B with reductions C₀, C₀' and f₀ : C₀ → C₀', the obstruction to lifting f₀ lies in Ext¹(L^a_{C₀/B₀}, C₀' ⊗ I) and lifts form a torsor under Hom(L^a_{C₀/B₀}, C₀' ⊗ I).

Source: [GR](#source-gr) §3.2, Proposition 3.2.16, p. 43.

*Needs:* [P0.21](#p0-21).

<a id="p0-24"></a>

### 0.24 Étale almost algebras lift uniquely along nilpotent ideals

Let S be a basic setup, A an almost algebra and I ⊆ A a nilpotent ideal, A' := A/I. (i) For B weakly étale over A, C any A-algebra and J ⊆ C nilpotent, Hom_{A-Alg}(B, C) → Hom_{A-Alg}(B, C/J) is bijective.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.24a Vanishing of the almost cotangent complex when the diagonal is Tor-trivial (GR Theorem 2.5.36)

Source: [GR](#source-gr) §3.2, Theorem 3.2.18(i), p. 43.

*Needs:* [P0.22](#p0-22).

<a id="p0-25"></a>

### 0.25 Faithfully flat descent for almost modules and almost algebras

Let S be a basic setup and φ : A → B a faithfully flat morphism of almost algebras. (i) φ is of effective descent for modules: M ↦ (B ⊗_A M, can) is an equivalence from A-Mod to the category Desc(B/A) of B-modules N with a B ⊗_A B-linear isomorphism β : p₂*N ≅ p₁*N satisfying the cocycle condition p₁₂*(β) ∘ p₂₃*(β) = p₁₃*(β); (ii) the same holds for A-algebras; (iii) both statements are stable under base change A → A' (universal effective descent); (iv) under (i) the full subcategories of flat, almost finitely generated, almost finitely presented and almost finite projective modules correspond, and under (ii) those of weakly étale, étale and finite étale algebras correspond; (v) almost projectivity descends when B is almost finitely presented over A (for general faithfully flat φ this is not asserted: GR Remark 3.2.26(iii) leaves it open).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.25a Flat + almost finitely presented ⟺ almost projective + almost finitely generated (GR Proposition 2.4.18)
- P0.25b Stability of flat, unramified and étale morphisms of almost algebras (GR Lemma 3.1.2(i))
- P0.25c B ↦ B_!! preserves and reflects faithful flatness, but not flatness (GR Remark 3.1.3(ii))
- P0.25d The Amitsur complex of an almost faithfully flat map is exact (GR (3.4.1))

Source: [GR](#source-gr) §3.4, introduction, p. 55.

*Needs:* [P0.7](#p0-7).

<a id="p0-26"></a>

### 0.26 Tight ideals, the Jacobson radical and henselian pairs of almost algebras

For an almost A-algebra, call I tight when, for every finitely generated m₀ contained in m, some n satisfies I^n ⊆ m₀ A. Define rad(A) by almostifying the ordinary Jacobson radical of A_*. For an honest algebra R and ideal J, the condition J^a ⊆ rad(R^a) is tested by mJ ⊆ rad(R). Define an almost henselian pair (A,I) by the ordinary henselian pair (A_*, mI_*). Tightness together with henselianity gives the almost Nakayama and idempotent-lifting results below. I-adic completeness supplies henselianity in the stated complete-algebra situation; it does not identify tightness with nilpotence.

Provide the interfaces `Almost.Algebra.Ideal.IsTight`, `Almost.Algebra.isTight_span`, `Almost.Algebra.Ideal.IsTight.mono`.

**Checks.**

- `Almost.Algebra.IsTight_test_varpi`: For ϖ ∈ S.ideal, the ideal ϖA is tight (m₀ = ϖV, n = 1).
- `Almost.Algebra.IsTight_test_unit`: For S = ofValuationRing K° and A = V^a, the unit ideal A is not tight: A ⊆ m₀A would force m ⊆ m₀ for a finitely generated (hence principal) m₀ = εK° ⊊ m.
- `Almost.Algebra.IsTight_test_zero`: The zero ideal of any almost algebra is tight.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.26a Almost Nakayama lemma for tight ideals (GR Lemma 5.1.6)
- P0.26b Idempotents lift uniquely along tight henselian pairs (GR Proposition 5.1.17)

Source: [GR](#source-gr) §5.1, Definition 5.1.5, p. 103.

*Needs:* [P0.8](#p0-8).

<a id="p0-27"></a>

### 0.27 Almost finite projective modules over I-adically complete almost algebras

Let S be a basic setup, A an almost algebra and I ⊆ A a tight ideal with A → lim_n A/I^{n+1} an isomorphism, A_n := A/I^{n+1}. Then M ↦ (M ⊗_A A_n)_n is an equivalence from almost finite projective A-modules to compatible systems (M_n) of almost finite projective A_n-modules (M_{n+1} ⊗ A_n ≅ M_n), with quasi-inverse (M_n) ↦ lim_n M_n; in particular P ≅ lim_n P ⊗_A A_n for every almost finite projective P..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.27a Products, limits, lim¹, colimits, Tor and Ext of almost zero modules are almost zero (GR Lemma 2.4.2(i)-(ii))
- P0.27b Almost projectivity via ε-factorisations through free modules (GR Lemma 2.4.15)

Source: [GR](#source-gr) §5.3, Theorem 5.3.24, p. 115.

*Needs:* [P0.26](#p0-26).

**Finite étale lifting.**

<a id="p0-28"></a>

### 0.28 Finite étale almost algebras lift uniquely modulo a tight ideal of a complete almost algebra

Let S = (V, m) be a basic setup, A an almost V-algebra and I ⊆ A a tight ideal such that A is I-adically complete (A → lim_n A/I^{n+1} an isomorphism). Then B ↦ B ⊗_A A/I is an equivalence of categories A_fet ≃ (A/I)_fet, with quasi-inverse B₀ ↦ lim_n B_n, where B_n is the unique finite étale A/I^{n+1}-algebra lifting B₀. In particular, for ϖ ∈ m and A ϖ-adically complete, A_fet ≃ (A/ϖ)_fet; this is Sch12 Theorem 4.17 over an arbitrary basic setup (Sch12 states it for S = (K°, K°°) and A flat over K°a).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.28a Unramifiedness lifts from the reduction modulo a tight ideal (GR Theorem 5.2.12(ii))
- P0.28b Finite étale algebras over complete flat almost algebras are flat and complete (Sch12 Theorem 4.17)
- P0.28c Uniform finite projectivity of a finite étale algebra can be checked modulo ϖ (root setups) (Sch12 Theorem 4.17)
- P0.28d ϖ-adic completeness of an almost module and of its almost elements (Sch12 Lemma 5.3(iv))
- P0.28e Complete torsion-free complexes that are almost exact modulo ϖ are almost exact, with the lim¹ term controlled (ECD  Proposition 8.8)

Source: [GR](#source-gr) §5.3, Theorem 5.3.27, p. 116.

*Needs:* [P0.14](#p0-14), [P0.26](#p0-26), [P0.24](#p0-24).

<a id="p0-29"></a>

### 0.29 Almost sheaves, almost sheaf cohomology and almost Čech complexes on a site

On a site, call a sheaf of V-modules almost zero when m annihilates its sections. Localise the sheaf category by these objects and identify it with sheaves valued in S.Almost. Define almost sheaf cohomology by almostifying ordinary sheaf cohomology of an honest representative; prove independence of that representative. Almost-zero sheaves have almost-zero ordinary cohomology in every degree. Almost acyclicity means vanishing in strictly positive degrees after almostification, and an almost exact Čech complex means that every cohomology module of the augmented complex is almost zero. Supply restriction, Čech-to-derived comparison and the analogous construction for a basic setup internal to the topos. These statements require the flat-tensor basic setup of P0.1.

Provide the interfaces `Almost.Sheaf.IsAlmostZero`, `Almost.Sheaf.almostZero_isSerreClass`, `Almost.Sheaf`.

**Checks.**

- `Almost.Sheaf.test_point`: For the site with one object and only the trivial covering, Almost.Sheaf J S ≌ Almost.Module S and almostH F n X = 0 for n > 0.
- `Almost.Sheaf.test_constant_residue`: For S = ofValuationRing K° and the constant sheaf k = K°/K°° on any site, F is almost zero, so almostH F n X ≅ 0 for all n, even when H^n(X, k) ≠ 0.
- `Almost.Sheaf.test_not_acyclic`: On the site of open subsets of the circle S¹, the constant sheaf k has H¹(S¹, k) = k ≠ 0 but is almost acyclic: IsAlmostAcyclic must not be defined as vanishing of H^n.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P0.29a Almost Čech acyclicity on a basis implies almost acyclicity (ECD  Proposition 8.8)

Source: [GR](#source-gr) §3.3, (3.3.1), p. 47.

*Needs:* [P0.5](#p0-5).

### Examples

The unit and zero ideals distinguish classical modules from the zero almost category. The maximal ideal of a DVR fails idempotence.

### Dependencies

Mathlib module categories, tensor products, localization, flatness and the naive cotangent complex; the stated full cotangent and general basic-setup comparison contracts.

<a id="p1"></a>

## Layer 1: Perfectoid Tate rings, tilts and untilts

Perfectoid Tate rings and fields with their characterisations, the tilt with its integral subrings and the sharp map, the almost setup of a perfectoid ring, Fontaine's θ with its primitive kernel, untilts and their classification by primitive ideals of degree one, integral perfectoid rings and the integral/Tate dictionary, the tilting equivalence over an arbitrary perfectoid base through the mod-ϖ category, completed colimits, perfected Tate algebras and the standard examples.

**Perfectoid Tate ring.**

<a id="p1-1"></a>

### 1.1 Perfectoid Tate rings (ECD Definition 3.1), perfectoid algebras and perfectoid Tate pairs

Fix a prime p. Let R be a commutative topological ring which is a Tate ring (tauceti:TauCeti.Huber.IsTateRing), complete and Hausdorff, with power-bounded subring R° (tauceti:TauCeti.Huber.powerBoundedSubring). For a commutative ring A and ideals I, J ⊆ A with p ∈ J and x^p ∈ J for every x ∈ I, write Φ: A/I → A/J for the ring homomorphism x mod I ↦ x^p mod J (ECD §3 notational convention). R is a perfectoid Tate ring if (a) R is uniform, i.e. R° is a bounded subset of R (tauceti:TauCeti.Huber.IsBounded), and (b) there is a pseudo-uniformizer ϖ of R (a topologically nilpotent unit, tauceti:TauCeti.Huber.IsPseudoUniformizer; necessarily ϖ ∈ R°) such that ϖ^p divides p in R° and Φ: R°/ϖR° → R°/ϖ^pR° is bijective. No perfectoid base field is fixed; characteristic 0 and characteristic p are both allowed (for pR = 0 the condition ϖ^p | p is vacuous), and p may be a nonzero nonunit (e.g. in a product K × K♭). A perfectoid R-algebra is a perfectoid Tate ring S with a continuous ring homomorphism R → S; morphisms are continuous R-algebra homomorphisms. A perfectoid Tate pair is a Huber pair (R, R+) (tauceti:TauCeti.Huber.Pair) with R perfectoid; the condition depends only on R (P1.17a).

Provide the interfaces `Perfectoid.frobeniusQuot`, `Perfectoid.frobeniusQuot_mk`, `Perfectoid.IsPerfectoidTateRing`.

**Checks.**

- `Perfectoid.not_isPerfectoidTateRing_padic`: ¬ IsPerfectoidTateRing ℚ_[p]: a pseudo-uniformizer of ℚ_p has |ϖ| = p^{-k} with k ≥ 1, so |ϖ^p| < |p| and ϖ^p ∤ p in ℤ_p, although Frobenius on ℤ_p/p = F_p is bijective (ECD Remark 3.3).
- `Perfectoid.IsPerfectoidTateRing.not_of_not_uniform`: R = ℂ_p[ε]/(ε²) (product topology on ℂ_p ⊕ ℂ_pε) is a complete Tate ring with ϖ = p^{1/p}, ϖ^p = p, and Frobenius surjective on R°/p = 𝒪_{ℂ_p}/p (as ℂ_pε ⊆ R° and ℂ_pε = p·ℂ_pε), but R° ⊇ ℂ_pε is unbounded, so R is not perfectoid; a definition omitting uniformity would accept it.
- `Perfectoid.isPerfectoidTateRing_zero`: The zero ring is a perfectoid Tate ring (0 is a topologically nilpotent unit and all quotients vanish).

Source: [ECD](#source-ecd) §3, Definition 3.1, p. 14.

*Needs:* `tauceti:TauCeti.Huber.IsTateRing`, `tauceti:TauCeti.Huber.IsHuberRing`, `tauceti:TauCeti.Huber.IsPseudoUniformizer`.

<a id="p1-2"></a>

### 1.2 In characteristic p, perfectoid Tate rings are exactly the perfect complete Tate rings

Let R be a topological ring with pR = 0. Then R is a perfectoid Tate ring iff R is a perfect complete Hausdorff Tate ring.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P1.2a Rings of integral elements of a complete uniform Tate ring are ϖ-adically and p-adically complete (Stacks Project, Tag 090T (Lemma 10.96.8))
- P1.2b Injectivity of Frobenius is automatic and the perfectoid condition is independent of the pseudo-uniformizer (ECD Remark 3.2)
- P1.2c A perfect complete Tate ring of characteristic p is uniform (open mapping theorem) (ECD Proposition 3.5, proof)

Source: [ECD](#source-ecd) Proposition 3.5, p. 15.

*Needs:* [P1.1](#p1-1).

<a id="p1-3"></a>

### 1.3 Pseudo-uniformizers with compatible p-power roots and the spectral gauge

Let R be a perfectoid Tate ring. A pseudo-uniformizer with compatible p-power roots is an element ϖ♭ = (ϖ^{1/p^n})_{n≥0} of the multiplicative monoid lim_{x↦x^p} R (Mathlib Perfection R p) such that ϖ := ϖ^{1/p^0} is a pseudo-uniformizer of R lying in R° with ϖ^p | p in R°. Then every ϖ^{1/p^n} is a pseudo-uniformizer in R°, ϖ^q := (ϖ^{1/p^n})^m is well defined for q = m/p^n ∈ ℤ[1/p]_{≥0} (and for q ∈ ℤ[1/p] as a unit of R), and ϖ♭ is a pseudo-uniformizer of the tilt R♭ with (ϖ♭)♯ = ϖ (P1.5b). The spectral gauge associated with the chosen roots is

```text
|x|_ϖ = inf { 2^(-q) : q ∈ ℤ[1/p], ϖ^(-q) x ∈ R° }.
```

It is ultrametric and power-multiplicative, induces the topology of R, and scales by |ϖ^q x|_ϖ = 2^(-q)|x|_ϖ. Its closed and open unit balls are R° and R°°. The normalization is relative to ϖ, so changing ϖ changes the numerical gauge.

Provide the interfaces `Perfectoid.PseudoUniformizerRoots`, `Perfectoid.PseudoUniformizerRoots.root`, `Perfectoid.PseudoUniformizerRoots.root_pow`.

**Checks.**

- In ℂ_p, for any admissible root system and x ≠ 0, the real value of the gauge is 2^(-log_{‖ϖ‖}(‖x‖)); it is zero at x = 0.
- The gauge of ϖ is 1/2. Choosing ϖ with ϖ^p = p gives |p|_ϖ = 2^(-p), including 1/4 at p = 2. Starting instead with ϖ = p is inadmissible: p^p does not divide p in O_{ℂ_p}.
- There is no compatible pseudo-uniformizer root system in ℚ_p: a positive integral valuation cannot be divisible by every p^n.
- In characteristic p, a fixed pseudo-uniformizer has at most one compatible root system, because the perfectoid ring is perfect.

Source: [ECD](#source-ecd) Lemma 3.10, p. 16.

*Needs:* [P1.1](#p1-1).

**Tilt of a perfectoid Tate ring.**

<a id="p1-4"></a>

### 1.4 The tilt R♭ = lim_{x↦x^p} R of a perfectoid Tate ring

Let R be a perfectoid Tate ring. Its tilt is R♭ := lim_{x↦x^p} R, the multiplicative monoid Perfection R p of compatible sequences (x^{(n)})_{n≥0} with (x^{(n+1)})^p = x^{(n)}, with the inverse-limit topology (induced from ∏_ℕ R), pointwise multiplication and addition (x + y)^{(i)} = lim_{n→∞}(x^{(i+n)} + y^{(i+n)})^{p^n}. The limit exists and R♭ is a topological ring of characteristic p which is perfect (ECD Lemma 3.10; Kedlaya AWS Lemma 2.7.1). Concretely, for ϖ♭ a pseudo-uniformizer with compatible roots and ϖ_0 | p, the submonoid lim_{x↦x^p} R° is identified with the ring lim_Φ R°/ϖ_0 (P1.4a), R♭ = (lim R°)[1/ϖ♭] as monoids, and the ring structure of R♭ is that of this localisation; it is given by the limit formula and does not depend on ϖ_0 or ϖ♭. For a Huber pair (R, R+) with R perfectoid, the tilt pair is (R♭, R♭+) with R♭+ := lim_{x↦x^p} R+ (P1.18a). If pR = 0 then x ↦ x^{(0)} is an isomorphism R♭ ≅ R.

Provide the interfaces `Perfectoid.tilt`, `Perfectoid.tilt.instCommRing`, `Perfectoid.tilt.charP`.

**Checks.**

- `Perfectoid.tilt.equivOfCharP_laurent`: For R the t-adic completion of the perfection of F_p((t)), tilt R ≃+* R via coeff 0, a homeomorphism.
- `Perfectoid.tilt.coeff_epsilon`: In tilt ℚ_p^cycl, ε := (ζ_{p^n})_n with ζ_{p^{n+1}}^p = ζ_{p^n}, ζ_1 = 1 satisfies coeff n ε = ζ_{p^n} and ε ≠ 1.
- `Perfectoid.tilt.coeff_zero_sub_ne`: In tilt ℚ_p^cycl, coeff 0 (ε − 1) ≠ coeff 0 ε − coeff 0 1 = 0: coordinatewise subtraction is not the ring structure.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P1.4a lim_{x↦x^p} R+ ≅ lim_Φ R+/ϖ_0 ≅ lim_Φ R+/p (ECD Lemma 3.10, proof)
- P1.4b Every perfectoid Tate ring has a pseudo-uniformizer with compatible p-power roots (ECD Lemma 3.10)

Source: [ECD](#source-ecd) Definition 3.9, p. 16.

*Needs:* [P1.1](#p1-1), [P1.3](#p1-3), [P1.2](#p1-2).

<a id="p1-5"></a>

### 1.5 The sharp map ♯: R♭ → R (continuous, multiplicative, not additive)

For a perfectoid Tate ring R, the sharp map ♯: R♭ → R, x ↦ x♯ := x^{(0)} (Mathlib Perfection.coeffMonoidHom R p 0 on the underlying monoid Perfection R p) is continuous and multiplicative with 0♯ = 0, and is not additive in general. It satisfies (x^{1/p^n})♯ = x^{(n)}; x ∈ R♭° iff x♯ ∈ R°; x♯ = 0 iff x = 0; for x, y ∈ R♭°, (x + y)♯ ≡ x♯ + y♯ mod pR°; every element of R° is congruent modulo pR° to some y♯ with y ∈ R♭°; reduction of ♯ modulo ϖ is the ring.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `Perfectoid.tilt.sharp`, `Perfectoid.tilt.sharp₀`, `Perfectoid.tilt.continuous_sharp`.

**Checks.**

- `Perfectoid.tilt.sharp_sub_ne`: In tilt ℚ_p^cycl: sharp (ε − 1) ≠ sharp ε − sharp 1 = 0 (a ring homomorphism sharp would fail this).
- `Perfectoid.tilt.sharp_epsilon`: sharp ε = 1 in tilt ℚ_p^cycl, and sharp p♭ = p in tilt ℂ_p for p♭ = (p^{1/p^n})_n.
- `Perfectoid.tilt.sharp_ringEquiv_of_charP`: If CharP R p, sharp is additive and is the ring isomorphism tilt.equivOfCharP.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P1.5a Frobenius-surjectivity criterion with the pseudo-uniformizer condition kept (ECD Remark 3.2)
- P1.5b R♭° = lim R° ≅ lim_Φ R°/ϖ, R♭ = R♭°[1/ϖ♭] and R♭°/ϖ♭ ≅ R°/ϖ (ECD Lemma 3.10)

Source: [ECD](#source-ecd) after Lemma 3.10, p. 16.

*Needs:* [P1.4](#p1-4).

<a id="p1-6"></a>

### 1.6 Functoriality of tilting: f ↦ f♭

A continuous ring homomorphism f: R → S between perfectoid Tate rings induces f♭: R♭ → S♭, (x^{(n)})_n ↦ (f(x^{(n)}))_n (Mathlib Perfection.mapMonoidHom p f on the underlying monoids), a continuous ring homomorphism with (f♭x)♯ = f(x♯), f♭(R♭°) ⊆ S♭°, id♭ = id and (g ∘.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `Perfectoid.tilt.map`, `Perfectoid.tilt.coeff_map`, `Perfectoid.tilt.sharp_map`.

**Checks.**

- `Perfectoid.tilt.map_id_test`: tilt.map (RingHom.id ℂ_p) = RingHom.id.
- `Perfectoid.tilt.map_inclusion_epsilon`: For the continuous inclusion ι : ℚ_p^cycl → ℂ_p, tilt.map ι ε = ε.
- `Perfectoid.tilt.map_equivOfCharP`: For f : R → S continuous between perfectoid rings of characteristic p, tilt.equivOfCharP ∘ tilt.map f = f ∘ tilt.equivOfCharP.

Source: [Berkeley](#source-berkeley) Theorem 6.2.7, p. 45.

*Needs:* [P1.4](#p1-4).

<a id="p1-7"></a>

### 1.7 The tilt B♭ = lim_{x↦x^p} B of a complete uniform Tate ring in which p is topologically nilpotent

Let B be a complete Hausdorff uniform Tate ring in which p is topologically nilpotent (B is not assumed perfectoid) and B⁺ ⊆ B° a ring of integral elements. Its tilt is B♭ := lim_{x↦x^p} B (Mathlib `Perfection B p`) with the inverse-limit topology, pointwise multiplication, x♯ := x^{(0)}, and addition (x + y)^{(i)} := lim_{n→∞}(x^{(i+n)} + y^{(i+n)})^{p^n}. Then: (a) the limit exists and makes B♭ a perfect topological ring of characteristic p; ♯ is continuous and multiplicative; B♭⁺ := lim_{x↦x^p} B⁺ = {x : x♯ ∈ B⁺} is an open subring and B♭° := lim_{x↦x^p} B° = {x : x♯ ∈ B°};

Provide the interfaces `Perfectoid.uniformTilt`, `Perfectoid.uniformTilt.sharp`, `Perfectoid.uniformTilt.coeff_add`.

**Checks.**

- `Perfectoid.uniformTilt_equiv_tilt`: For B perfectoid, uniformTilt B and tilt B are the same ring structure on Perfection B p: the identity is a topological ring isomorphism commuting with sharp, with map and with θ.
- `Perfectoid.uniformTilt_padic`: uniformTilt ℚ_p ≃+* 𝔽_p (Teichmüller representatives {0} ∪ μ_{p−1}, p odd) with the discrete topology: it is not a Tate ring, and ℚ_p has no pseudo-uniformizer ϖ with ϖ^p | p, so (c) does not apply; a construction asserting that the tilt of every uniform Tate ring is Tate fails here.
- `Perfectoid.uniformTilt_charP`: If B is a perfect uniform Tate ring of characteristic p, sharp : uniformTilt B ≃+* B is a topological ring isomorphism; uniformTilt of the zero ring is zero.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P1.7a The spectral gauge is preserved by the sharp map: |x♯|_R = |x|_{R♭} (Sch12 Lemma 5.21, proof)

Source: [AWS](#source-aws) Lemma 2.7.1, p. 66.

*Needs:* [P1.4](#p1-4).

<a id="p1-8"></a>

### 1.8 The integral tilt R♭+ is Mathlib's PreTilt R+ p, and ♯ is PreTilt.untilt

Let R be a nonzero perfectoid Tate ring and R+ a ring of integral elements (e.g. R°). Then R+ satisfies Mathlib's standing hypotheses Fact ¬IsUnit (p : R+) and IsAdicComplete (span {p}) R+ (P1.2a), and: (a) the subring R♭+ = lim_{x↦x^p} R+ of R♭ is isomorphic as a topological ring to Mathlib's PreTilt R+ p = Perfection (ModP R+ p) p via x ↦ (x^{(n)} mod p)_n, with inverse built from Perfection.teichmuller / Perfection.quotientMulEquiv; (b) under this isomorphism x ↦ x♯ on R♭+ is Mathlib's PreTilt.untilt : PreTilt R+ p →* R+, and PreTilt.coeff 0 is ♯ mod p (PreTilt.mk_untilt_eq_coeff_zero); (c) R♭ ≅ (PreTilt R+ p)[1/ϖ♭] (Localization.Away)..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [BMS](#source-bms) Lemma 3.2(i), p. 19.

*Needs:* [P1.4a](#p1-4).

<a id="p1-9"></a>

### 1.9 The almost setup (R°, R°°) of a perfectoid Tate ring

Let R be a perfectoid Tate ring. The pair (R°, R°°) is a basic setup for almost mathematics (P0.1: R°° idempotent and R°° ⊗_{R°} R°° ≅ R°° flat), and so is (R+, R°°) for every ring of integral elements R+. For an R+-module M the following are equivalent: (i) M is almost zero, R°°M = 0; (ii) ϖ'M = 0 for every pseudo-uniformizer ϖ' of R; (iii) ϖ^{1/p^n}M = 0 for all n, for one (equivalently any) pseudo-uniformizer ϖ with compatible p-power roots (ECD Definition 3.21; Kedlaya AWS Definition 2.9.4). The almost-zero modules form the Serre class of P0.4b, the almost categories R°a-Mod and R+a-Mod are the Serre quotients of P0.5 (ECD Definition 3.23), and restriction of scalars along R+ → R°, which is injective with almost zero cokernel (ECD Example 3.22(ii)), induces an equivalence R°a-Mod ≃ R+a-Mod. The construction depends only on R. For a perfectoid field K it is the classical setup (K°, m_K), with K°/m_K almost zero (ECD Example 3.22(i)).

Provide the interfaces `Perfectoid.almostSetup`, `Perfectoid.almostSetupPlus`, `Perfectoid.almostSetup_ideal`.

**Checks.**

- `Perfectoid.isAlmostZero_residueField`: For K a perfectoid field, K° ⧸ m_K is almost zero and ϖ^{1/p^n} acts by 0 on it for all n.
- `Perfectoid.not_idempotent_padic`: For ℚ_p, (pℤ_p)² ≠ pℤ_p, so (ℤ_p, ℤ_p°°) is not a basic setup; ℤ_p/p is killed by p but not by an idempotent ideal containing p.
- `Perfectoid.isAlmostZero_of_subsingleton`: For R = 0 every module is almost zero.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P1.9a R°° = ⋃ ϖ^{1/p^n}R° is an idempotent flat ideal (ECD Definition 3.21)

Source: [ECD](#source-ecd) Definition 3.21, p. 19.

*Needs:* [P1.4b](#p1-4).

**Perfectoid field.**

<a id="p1-10"></a>

### 1.10 Perfectoid fields

A perfectoid field is a perfectoid Tate ring K (P1.1) whose underlying topological ring is a nonarchimedean field: K is a field, complete with respect to a nontrivial nonarchimedean absolute value |·| defining its topology (ECD Definition 3.6). Equivalently (P1.11; ECD Proposition 3.8; the original definition Sch12 Definition 3.1): K is a nonarchimedean field which is not discretely valued, |p| < 1, and Frobenius is surjective on K°/p. Its value group is p-divisible (P1.15a). In characteristic p a perfectoid field is the same as a complete perfect nonarchimedean field.

Assume throughout this subsection: Nonarchimedean field: in Lean, NontriviallyNormedField K with IsUltrametricDist K and CompleteSpace.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `Perfectoid.IsPerfectoidField`, `Huber.isTateRing_of_nontriviallyNormedField`, `Perfectoid.IsPerfectoidField.toIsPerfectoidTateRing`.

**Checks.**

- `Perfectoid.not_isPerfectoidField_padic`: ¬ IsPerfectoidField ℚ_[p]: ℚ_p is discretely valued (ECD Remark 3.3), although Frobenius on ℤ_p/p = F_p is surjective.
- `Perfectoid.isPerfectoidField_padicComplex_test`: IsPerfectoidField (PadicComplex p): the value group is |p|^ℚ and every element of 𝒪_{ℂ_p} has a p-th root.
- `Perfectoid.isPerfectoidField_iff_perfect_laurent`: For the completed perfection K of F_p((t)): IsPerfectoidField K holds; F_p((t)) is not perfect and not a perfectoid field.

Source: [ECD](#source-ecd) Definition 3.6, p. 15.

*Needs:* [P1.1](#p1-1), `mathlib:NontriviallyNormedField`, `mathlib:IsUltrametricDist`.

<a id="p1-11"></a>

### 1.11 Characterisation of perfectoid fields

Let K be a nonarchimedean field. Then K is a perfectoid field iff (i) K is not discretely valued, (ii) |p| < 1, and (iii) Frobenius Φ: K°/p → K°/p is surjective (ECD Proposition 3.8;

Source: [ECD](#source-ecd) Proposition 3.8, p. 15.

*Needs:* [P1.10](#p1-10).

<a id="p1-12"></a>

### 1.12 Gelfand spectrum of a Banach ring: units and the maximum formula

Let A be a commutative nonarchimedean Banach ring (complete for a submultiplicative norm |·| with |a + b| ≤ max(|a|, |b|)). Its Gelfand spectrum M(A) is the set of bounded multiplicative seminorms α : A → ℝ_{≥0} (α(ab) = α(a)α(b), α(1) = 1, α ≤ C|·|), with the topology of pointwise convergence. Then: (i) M(A) is compact Hausdorff; (ii) M(A) ≠ ∅ if A ≠ 0; (iii) f ∈ A is a unit iff α(f) ≠ 0 for every α ∈ M(A); (iv) the spectral seminorm |f|_sp = lim |fⁿ|^{1/n} equals max_{α ∈ M(A)} α(f), the maximum being attained when A ≠ 0. For the zero ring, M(A) is empty and the spectral seminorm is zero; use a supremum, with value zero for the empty set, rather than an attained maximum in that case. For a complete Tate ring the carrier M(A) is the Berkovich spectrum of DiamondsAndVStacks D5 (DiamondsAndVStacks D5.13); this target proves (ii)–(iv) for arbitrary nonarchimedean Banach rings, which is the form used by Kedlaya's Banach-field theorem and by the pointwise sharp-approximation lemma.

**Checks.**

- For a complete nontrivially valued field, its absolute value is a point of the spectrum; the unit 1 has spectral value 1.
- The element T of K⟨T⟩ vanishes at the evaluation-at-zero seminorm and is not a unit, whereas 1 is nonzero at every spectral point.
- The zero ring has empty spectrum and zero spectral seminorm; nonemptiness and an attained maximum require A ≠ 0.

Source: [KL15](#source-kl15) Definition 2.3.2, Theorem 2.3.4 and Corollary 2.3.7, p. 34; Theorem 2.3.10 and Remark 2.3.11(b), pp. 35–36. These public statements replace the unchecked Berkovich locators.

*Needs:* `mathlib:MulRingSeminorm`, `mathlib:RingSeminorm`, `mathlib:NonarchimedeanAddGroup`.

<a id="p1-13"></a>

### 1.13 A uniform Banach field over a nondiscretely valued field is a nonarchimedean field

Let F be a nonarchimedean field whose value group |F^×| is dense in ℝ_{>0}, and let A be a uniform Banach F-algebra (complete, with topology defined by a power-multiplicative norm; equivalently the spectral seminorm |·|_sp is a norm defining the topology) whose underlying ring is a field. Then |·|_sp is multiplicative, so A is a nonarchimedean field (Kedlaya, On commutative nonarchimedean Banach fields, Theorem 3.7)..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [KBF](#source-kbf) Theorem 3.7, p. 10.

*Needs:* [P1.12](#p1-12).

<a id="p1-14"></a>

### 1.14 A perfectoid Tate ring whose underlying ring is a field is a perfectoid field

Let A be a perfectoid Tate ring whose underlying ring is a field. Then the topology of A is defined by a multiplicative absolute value, so A is a perfectoid field (Kedlaya, On commutative nonarchimedean Banach fields, Theorem 4.2; answers ECD Remark 3.7;.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P1.14a The tilt of a perfectoid Tate ring is a perfectoid Tate ring of characteristic p (ECD Lemma 3.10)
- P1.14b A perfectoid Tate ring is a field iff its tilt is (Sch12 Lemma 5.21)

Source: [KBF](#source-kbf) Theorem 4.2, p. 13.

*Needs:* [P1.13](#p1-13).

<a id="p1-15"></a>

### 1.15 Tilt of a perfectoid field; comparison with Mathlib's Tilt and PreTilt.val

Let K be a perfectoid field. Its tilt K♭ (P1.4) is a perfectoid field of characteristic p with absolute value |x|_♭ := |x♯|; K♭° = lim_{x↦x^p} K° ≅ lim_Φ K°/ϖ is its valuation ring for any ϖ ∈ K with |p| ≤ |ϖ| < 1; |K♭^×| = |K^×|; K♭°/ϖ♭ ≅ K°/ϖ and K♭°/m♭ ≅ K°/m; K♭ = K if char K = p. Replacing ϖ by (ϖ♭)♯ one may assume ϖ has compatible p-power roots (Sch12 Lemma 3.4, Remark 3.5).

Provide the interfaces `Perfectoid.IsPerfectoidField.tilt_isPerfectoidField`, `Perfectoid.tiltField.norm_def`, `Perfectoid.tiltField.valueGroup_eq`.

**Checks.**

- `Perfectoid.tiltField_padicComplex_pflat`: In tilt ℂ_p, p♭ = (p^{1/p^n})_n has ‖p♭‖ = ‖p‖ and ‖ε − 1‖ = ‖p‖^{p/(p−1)}.
- `Perfectoid.tiltField_equivMathlibTilt_test`: For K = ℂ_p: tilt ℂ_p ≃+* Tilt ℂ_p v 𝒪_{ℂ_p} hv p and PreTilt.val corresponds to the absolute value of the tilt.
- `Perfectoid.tiltField_equivSelf_laurent`: For K the completed perfection of F_p((t)), tilt K ≃+* K.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P1.15a The value group of a perfectoid field is p-divisible (Sch12 Lemma 3.2)
- P1.15b Continuous valuations of K and K♭ correspond (Sch12 Proposition 3.6)

Source: [Sch12](#source-sch12) Lemma 3.4(iii), p. 16.

*Needs:* [P1.4](#p1-4).

<a id="p1-16"></a>

### 1.16 Primitive (distinguished) elements and ideals of degree 1 in W(R+)

Let (R, R+) be a perfectoid Tate pair of characteristic p. An element ξ = Σ_{n≥0} p^n[ξ_n] ∈ W(R+) is primitive of degree 1 (distinguished) if ξ_0 is topologically nilpotent and ξ_1 is a unit of R+; equivalently ξ = [ξ_0] + p·u with u ∈ W(R+)^× (Kedlaya AWS Definition 2.3.4; Kedlaya–Liu II Definition 3.2.3). An ideal J ⊆ W(R+) is primitive of degree 1 if it is principal with a primitive generator. Equivalently (ECD Definition 3.15), J is generated by an element p + [ϖ♭]α with ϖ♭ ∈ R+ a pseudo-uniformizer and α ∈ W(R+): every such element is primitive, and every primitive element is a unit multiple of one of this form, because a topologically nilpotent element of R+ is divisible by a pseudo-uniformizer (Kedlaya–Liu II Lemma 3.2.2;

Provide the interfaces `Perfectoid.IsPrimitive`, `Perfectoid.IsPrimitiveIdeal`, `Perfectoid.IsPrimitive.iff_teichmuller_add`.

**Checks.**

- `Perfectoid.isPrimitive_p_sub_pflat`: In W(𝒪_{ℂ_p♭}), p − [p♭] = p + [p♭]·(−1) is primitive; so is Σ_{i=0}^{p−1}[ε]^{i/p} (its image in W(F̄_p) is p).
- `Perfectoid.not_isPrimitive_p_sq`: p² is not primitive (its Witt coordinate ξ_1 is 0), and neither is [ϖ]; a definition requiring only ξ ∈ (p, [ϖ]) would accept them.
- `Perfectoid.isPrimitive_p_test`: p is primitive, and the untilt along (p) is (R, R+) itself.

**Companion contracts.** These related results also require exact hypotheses and complete statements:

Source: [ECD](#source-ecd) Definition 3.15, p. 17.

*Needs:* [P1.2](#p1-2).

<a id="p1-17"></a>

### 1.17 ECD's θ is Mathlib's WittVector.fontaineTheta;

Let R be a nonzero perfectoid Tate ring and R+ a ring of integral elements. Mathlib's WittVector.fontaineTheta R+ p : 𝕎(PreTilt R+ p) →+* R+ (defined under [Fact ¬IsUnit (p : R+)] and [IsAdicComplete (span {p}) R+], both supplied by P1.2a) corresponds, under R♭+ ≅ PreTilt R+ p (P1.8), to ECD's θ: W(R♭+) → R+, Σ_n p^n[r_n] ↦ Σ_n p^n r_n♯. In particular θ([x]) = x♯ (WittVector.fontaineTheta_teichmuller) and θ mod p is x ↦ x♯ mod p (WittVector.mk_fontaineTheta).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P1.17a Every ring of integral elements of a perfectoid Tate ring satisfies the Frobenius condition (BMS Lemma 3.20, proof)

Source: [ECD](#source-ecd) Lemma 3.14(i), p. 17.

*Needs:* [P1.8](#p1-8).

**Fontaine's map θ.**

<a id="p1-18"></a>

### 1.18 Fontaine's θ: W(S♭+) → S+ is surjective with kernel generated by a primitive nonzerodivisor

Let (S, S+) be a perfectoid Tate pair (any characteristic) with tilt (S♭, S♭+). (a) θ: W(S♭+) → S+, Σ[r_n]p^n ↦ Σ r_n♯p^n, is a surjective ring homomorphism (P1.17). (b) ker θ is generated by a primitive element of degree 1, which can be taken of the form ξ = p + [ϖ♭]α with ϖ♭ ∈ S♭+ a pseudo-uniformizer such that (ϖ♭♯)^p | p in S+, and α ∈ W(S♭+); ξ is a nonzerodivisor. (c) An element of ker θ generates ker θ iff it is primitive (BMS1 Remark 3.11). (d) θ extends to a surjection W(S♭+)[1/[ϖ♭]] → S with kernel ξW(S♭+)[1/[ϖ♭]], and W(S♭+)/(ξ, [ϖ♭]) = S♭+/ϖ♭ ≅ S+/ϖ♭♯. If pS = 0 then ker θ = (p). (ECD Lemma 3.14; Berkeley Lemma 6.2.8; Kedlaya AWS Lemma 2.7.5; Kedlaya–Liu I Lemma 3.6.3 in characteristic 0.)

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P1.18a Rings of integral elements correspond under tilting: R+ ↦ R♭+ = lim R+ (ECD Lemma 3.11)
- P1.18b Primitive elements are nonzerodivisors and divide each other only up to units (ECD Lemma 3.16)
- P1.18c W(R+)/ξ is [ϖ]-torsion free and [ϖ]-adically complete (the facts ECD Lemma 3.14 uses) (ECD Lemma 3.14, proof)

Source: [ECD](#source-ecd) Lemma 3.14(ii), p. 17.

*Needs:* [P1.17](#p1-17), [P1.16](#p1-16), [P1.5b](#p1-5).

<a id="p1-19"></a>

### 1.19 The untilt of (R, R+) along a primitive ideal J: (W(R+)[1/[ϖ]]/J, W(R+)/J)

Let (R, R+) be a perfectoid Tate pair of characteristic p, J ⊆ W(R+) a primitive ideal of degree 1 and ϖ ∈ R+ a pseudo-uniformizer. The untilt of (R, R+) along J is the pair (A, A+) with A+ := W(R+)/J and A := A+[1/π], π the image of [ϖ], topologised so that A+ is open with its π-adic (equivalently (p,[ϖ])-adic) topology; equivalently A = W^b(R)/J·W^b(R) with W^b(R) = W(R+)[1/[ϖ]].

Provide the interfaces `Perfectoid.untilt`, `Perfectoid.untiltPlus`, `Perfectoid.untilt.instIsTateRing`.

**Checks.**

- `Perfectoid.untilt_p`: untilt (R, R+) (span {p}) ≅ R as topological rings, with untiltPlus = R+.
- `Perfectoid.untilt_pflat`: For R = the completed perfection of F_p((t)) and J = span {p − [t]}: the untilt is the completion of ℚ_p(p^{1/p^∞}) with sharp_J t = p.
- `Perfectoid.untilt_cyclotomic`: For J = span {Σ_{i<p}[1 + t]^{i/p}} the untilt is ℚ_p^cycl (Kedlaya AWS Example 2.3.8).

Source: [ECD](#source-ecd) Theorem 3.17, p. 18.

*Needs:* [P1.16](#p1-16).

<a id="p1-20"></a>

### 1.20 The untilt along a primitive ideal is a perfectoid Tate pair with tilt (R, R+) (converse construction of ECD 3.17)

For (R, R+) a perfectoid Tate pair of characteristic p and J ⊆ W(R+) primitive of degree 1, the untilt (A, A+) of P1.19 is a perfectoid Tate pair: A is a perfectoid Tate ring, A+ = W(R+)/J is a ring of integral elements of A (open, integrally closed, contained in A°), A°/A+ is almost zero, and the identification R+ ≅ lim_{x↦x^p} A+ of P1.20a extends to an isomorphism of perfectoid Tate pairs (R, R+) ≅ (A♭, A♭+) under which ker θ_A = J (Kedlaya AWS Lemmas 2.6.14 and 2.7.9; Kedlaya–Liu II Theorem 3.3.8; the converse functor of ECD Theorem 3.17 and Berkeley Theorem 6.2.11, including the topology and the integral subring).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P1.20a The tilt of W(R+)/J is R+, and θ for W(R+)/J is the quotient map (KL16 Kedlaya–Liu II, Lemma 3.3.7)
- P1.20b An integral perfectoid ring with a nonzerodivisor π gives a perfectoid Tate ring R_0[1/π] (BMS Lemma 3.21)

Source: [AWS](#source-aws) Theorem 2.3.9, p. 55.

*Needs:* [P1.19](#p1-19).

**Untilts and primitive ideals.**

<a id="p1-21"></a>

### 1.21 Untilts are classified by primitive ideals of degree 1

(ECD Theorem 3.17; Kedlaya–Liu II Theorem 3.3.8; Kedlaya AWS Theorem 2.3.9; Berkeley Theorem 6.2.11) The functors (S, S+) ↦ (S♭, S♭+, ker θ_S) and (R, R+, J) ↦ (W(R+)[1/[ϖ]]/J, W(R+)/J) are mutually quasi-inverse equivalences between (i) perfectoid Tate pairs (S, S+) with morphisms of Huber pairs and (ii) triples (R, R+, J) with (R, R+) a perfectoid Tate pair of characteristic p and J ⊆ W(R+) primitive of degree 1, a morphism being a morphism f of pairs with W(f)(J) ⊆ J' (then J' = W(f)(J)W(R'+)). The unit is induced by θ_S: W(S♭+)[1/[ϖ♭]]/ker θ ≅ S, the counit is the identification of P1.20, and both are natural. Characteristic-p pairs correspond to J = (p).

Assume throughout this subsection: No perfectoid base field; both characteristics.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P1.21a ker θ is compatible with base change: ker θ_S = W(f♭)(ker θ_R)·W(S♭+) (AWS Remark 2.3.17)

Source: [ECD](#source-ecd) Theorem 3.17 (ii), p. 18.

*Needs:* [P1.20](#p1-20), [P1.20a](#p1-20), [P1.18](#p1-18).

<a id="p1-22"></a>

### 1.22 Marked untilts of a perfectoid pair of characteristic p

Let (R, R+) be a perfectoid Tate pair of characteristic p. A marked untilt of (R, R+) is a triple (S, S+, ι) with (S, S+) a perfectoid Tate pair and ι: (S♭, S♭+) ≅ (R, R+) an isomorphism of Huber pairs; a morphism (S, S+, ι) → (S', S'+, ι') is a morphism f of Huber pairs with ι' ∘ f♭ = ι.

Provide the interfaces `Perfectoid.MarkedUntilt`, `Perfectoid.MarkedUntilt.Hom`, `Perfectoid.MarkedUntilt.primitiveIdeal`.

**Checks.**

- `Perfectoid.MarkedUntilt.self_primitiveIdeal`: primitiveIdeal (MarkedUntilt.self P) = span {p}.
- `Perfectoid.MarkedUntilt.padicComplex_primitiveIdeal`: For P = (ℂ_p♭, 𝒪_{ℂ_p♭}) and the canonical marking of ℂ_p: primitiveIdeal = span {p − [p♭]}.
- `Perfectoid.MarkedUntilt.aut_trivial`: Every automorphism of a marked untilt is the identity.

Source: [Berkeley](#source-berkeley) Lemma 6.2.8, pp. 45–47, and Theorem 6.2.11, p. 47 (the category of pairs and primitive ideals).

*Needs:* [P1.21](#p1-21).

<a id="p1-23"></a>

### 1.23 Strict inclusions correspond under tilting

A continuous ring homomorphism f: A → B of complete Hausdorff Tate rings is a strict inclusion if it is injective and a homeomorphism onto its image with the subspace topology (equivalently, as A is complete, a topological ring isomorphism onto a closed subring). Let A be a perfectoid Tate ring, ϖ♭ ∈ A♭ with compatible roots, ϖ = ϖ♭♯, and f: A → B continuous. (a) If B is a perfectoid Tate ring, f is a strict inclusion if and only if f♭: A♭ → B♭ (P1.6) is (Kedlaya AWS Theorem 2.4.2). (b) More generally, let B be a complete Hausdorff uniform Tate ring and B♭ its tilt (P1.7; f(ϖ) = (f♭ϖ♭)♯ has compatible roots and f(ϖ)^p | p in B°)..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P1.23a Metric criterion: a uniform Tate ring is perfectoid iff every element is a p-th power up to a fixed factor c < 1 (AWS Lemma 2.8.3)
- P1.23b Euclidean division by a primitive element and approximation by sharp elements (AWS Definition 2.6.5)

Source: [AWS](#source-aws) Theorem 2.4.2, p. 57.

*Needs:* [P1.6](#p1-6).

<a id="p1-24"></a>

### 1.24 Integral perfectoid rings

A commutative ring R is integral perfectoid if there is π ∈ R with π^p | p such that R is π-adically complete and separated, the Frobenius R/p → R/p is surjective, and the kernel of Fontaine's map θ : W(R♭) → R is principal, where R♭ = lim_{x ↦ x^p} R/p is the tilt (Mathlib's `PreTilt`). Equivalent forms: for a nonzerodivisor π with π^p | p and R π-adically complete, R is integral perfectoid iff Frobenius R/π → R/π^p is an isomorphism; every integral perfectoid R admits a unit multiple of π with a compatible system of p-power roots. Integral perfectoid rings may have p-torsion and need not be domains;

Provide the interfaces `IsIntegralPerfectoid`, `IsIntegralPerfectoid.frobenius_mod_pow_bijective`, `IsIntegralPerfectoid.exists_compatible_roots`.

**Checks.**

- `isIntegralPerfectoid_padicInt_false`: ℤ_p is not integral perfectoid: Frobenius on ℤ_p/p = 𝔽_p is bijective but no π with π^p | p makes R/π → R/π^p surjective (the condition fails for π = p since p^p ∤ p).
- `isIntegralPerfectoid_completed_cyclotomic`: The p-adic completion of ℤ_p[p^{1/p^∞}] is integral perfectoid with π = p^{1/p}.
- `isIntegralPerfectoid_perfect_charP`: A perfect 𝔽_p-algebra that is π-adically complete for some π is integral perfectoid (π^p | p = 0 trivially).

Source: [BMS](#source-bms) §3.2, Definition 3.5, p. 21; Lemma 3.9 and Lemma 3.10, p. 22.

*Needs:* `mathlib:IsAdicComplete`, `mathlib:PreTilt`, `mathlib:WittVector.fontaineTheta`.

<a id="p1-25"></a>

### 1.25 R perfectoid Tate ⇔ R⁺ integral perfectoid and bounded

Let R be a complete Hausdorff Tate ring and R⁺ a ring of integral elements. If R is a perfectoid Tate ring, then R⁺ (and R°) is an integral perfectoid ring in the sense of BMS Definition 3.5 (P1.24: π-adically complete for some π with π^p dividing p up to a unit, Frobenius surjective on R⁺/p, and the kernel of θ : A_inf(R⁺) → R⁺ principal). Conversely, if R⁺ is integral perfectoid and bounded in R, then R is a perfectoid Tate ring; boundedness of R⁺ is necessary for the converse. Together with P1.20b (BMS Lemma 3.21) this compares the integral notion with the Tate-ring notion of this layer.

Source: [BMS](#source-bms) Lemma 3.20, p. 26.

*Needs:* [P1.1](#p1-1).

<a id="p1-26"></a>

### 1.26 Unique flat deformation of perfectoid algebras modulo ϖ

Let R be a perfectoid Tate ring and ϖ = (ϖ♭)♯ a pseudo-uniformizer with compatible roots. Reduction modulo ϖ, A ↦ A/ϖ, is an equivalence between (i) ϖ-adically complete R°a-algebras A that are (almost) flat over R°a with Φ: A/ϖ^{1/p} ≅ A/ϖ, and (ii) (almost) flat (R°/ϖ)^a-algebras B with Φ: B/ϖ^{1/p} ≅ B..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P1.26a Frobenius criterion for vanishing of the (almost) cotangent complex; perfectoid algebras modulo ϖ (Sch12 Proposition 5.13(ii))

Source: [Sch12](#source-sch12) Theorem 5.10, p. 24.

*Needs:* [P0.22](#p0-22).

**Tilting equivalence.**

<a id="p1-27"></a>

### 1.27 Tilting equivalence Perf_R ≃ Perf_{R♭} over an arbitrary perfectoid Tate ring, with the explicit tilt

(ECD Theorem 3.13; Berkeley Theorem 6.2.7; Kedlaya AWS Remark 2.3.17; Sch12 Theorem 5.2 over a perfectoid field) Let R be a perfectoid Tate ring with tilt R♭ and J_R := ker(θ_R: W(R♭°) → R°), a primitive ideal (P1.18). The tilting functor S ↦ S♭ (R♭ → S♭ the tilt of R → S, P1.6) is an equivalence from perfectoid R-algebras to perfectoid R♭-algebras, with quasi-inverse T ↦ T♯ := W(T°)[1/[ϖ♭]]/J_R·W(T°)[1/[ϖ♭]], the untilt along J_R·W(T°) (P1.19); the unit S ≅ (S♭)♯ is induced by θ_S and the counit (T♯)♭ ≅ T by P1.20, both natural. Explicitly S♭ = lim_{x↦x^p} S, S♭° = lim_{x↦x^p} S° ≅ lim_Φ S°/ϖ and S♭°/ϖ♭ ≅ S°/ϖ;

Assume throughout this subsection: No perfectoid base field; continuous homomorphisms between Tate rings preserve power-bounded.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [ECD](#source-ecd) Theorem 3.13, p. 17.

*Needs:* [P1.21](#p1-21), [P1.21a](#p1-21), [P1.6](#p1-6).

<a id="p1-28"></a>

### 1.28 Perf_R ≃ R°a-Perf ≃ (R°a/ϖ)-Perf over an arbitrary perfectoid Tate ring

Let R be a perfectoid Tate ring and ϖ = (ϖ♭)♯ with compatible roots and ϖ^p dividing p in R°. A perfectoid (R°a/ϖ)-algebra is an (R°/ϖ)^a-algebra B that is almost flat, for the root ideal, over Λ = 𝔽_p[x^{1/p^∞}]/(x) (x ↦ ϖ; equivalently the kernel of ϖ^q on B_* is ϖ^{1−q}B_* up to almost zero for q ∈ ℤ[1/p] ∩ (0, 1)) with Φ: B/ϖ^{1/p} → B an isomorphism. Then S ↦ S°a ↦ (S°/ϖ)^a are equivalences Perf_R ≃ R°a-Perf ≃ (R°a/ϖ)-Perf (R°a-Perf as in P1.28a), and.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P1.28a Perfectoid R-algebras are equivalent to perfectoid R°a-algebras (Sch12 Lemma 5.6)
- P1.28b In characteristic p, perfectoid algebras modulo ϖ lift explicitly by the inverse limit along Frobenius (Sch12 Remark 5.18)

Source: [Sch12](#source-sch12) Definition 5.1(iii) and Theorem 5.2, p. 22, which prove the equivalences over a perfectoid field K; over an arbitrary perfectoid Tate ring the statement, with the Λ-flatness condition above, is an explicit gap: the general-base Λ-flatness criterion, the comparison through almost elements, and the proof of the equivalences have not been supplied.

*Needs:* [P1.27](#p1-27).

<a id="p1-29"></a>

### 1.29 Completed filtered colimits of perfectoid Tate rings are perfectoid, and tilting commutes with them

Let J be a small filtered category and j ↦ R_j a functor from J to perfectoid Tate rings with continuous ring homomorphisms φ_a: R_i → R_j (no injectivity, flatness or density assumed; characteristic 0, p or neither; no perfectoid base field). Fix j₀ ∈ J and a pseudo-uniformizer ϖ♭ ∈ R_{j₀}♭ with compatible roots, ϖ = ϖ♭♯ (P1.4b); on the tail J_{j₀} = Under j₀ (final in J, Mathlib `CategoryTheory.Under.final_forget`) the images of ϖ and of its roots are pseudo-uniformizers with compatible roots and ϖ^p | p in every R_j° (a compatible pseudo-uniformizer). Put A := colim_j R_j° (filtered colimit of rings, Mathlib `CommRingCat.FilteredColimits`), R_0 := its ϖ-adic completion lim_n A/ϖ^nA, and R := R_0[1/ϖ], topologised with R_0 open carrying its ϖ-adic topology. Then: (a) R is a complete Hausdorff Tate ring with pseudo-uniformizer ϖ and ring of definition R_0; ϖ is a nonzerodivisor on R_0 and R_0/ϖ^nR_0 = colim_j R_j°/ϖ^n; the canonical maps ι_j: R_j → R are continuous.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `Perfectoid.completedFilteredColimit`, `Perfectoid.completedFilteredColimit.ringOfDefinition`, `Perfectoid.completedFilteredColimit.ι`.

**Checks.**

- `Perfectoid.completedFilteredColimit_const`: For J with a terminal object j (in particular a one-object J), completedFilteredColimit F ≃+* F.obj j as topological rings, compatibly with ι_j.
- `Perfectoid.completedFilteredColimit_locallyConstant`: For a perfectoid field K and a profinite set S = lim S_i (finite S_i), the completed colimit of the perfectoid rings K^{S_i} = C(S_i, K) is C^0(S, K) with the sup norm, and its ring of definition is C^0(S, K°).
- `Perfectoid.completedFilteredColimit_tilt_algebraicClosure`: For a perfectoid field K, tiltEquiv identifies (completion of an algebraic closure of K♭) with the tilt of the completed colimit of the untilts L♯ of the finite extensions L of K♭ inside it; the union of the L♯ is dense in the untilt.

Source: [Bhatt](#source-bhatt) notes, Remark 6.2.9, p. 48.

*Needs:* [P1.1](#p1-1).

<a id="p1-30"></a>

### 1.30 Perfected Tate algebras R⟨T_s^{1/p^∞} : s ∈ Σ⟩ in any set of variables over any perfectoid Tate ring

Let R be a perfectoid Tate ring with pseudo-uniformizer ϖ (ϖ^p | p in R°) and Σ an arbitrary set, possibly infinite. The perfected Tate algebra R⟨T_s^{1/p^∞} : s ∈ Σ⟩ is A_0[1/ϖ], where A_0 is the ϖ-adic completion of the monoid algebra R°[T^a : a ∈ ℤ[1/p]_{≥0}^{(Σ)}] (AddMonoidAlgebra over the finitely supported exponent vectors Σ →₀ ℤ[1/p]_{≥0}, T^a = Π_s T_s^{a(s)}), topologised with A_0 open and ϖ-adic; equivalently the completion of the perfect.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `Perfectoid.perfectedTateAlgebra`, `Perfectoid.perfectedTateAlgebra.isPerfectoidTateRing`, `Perfectoid.perfectedTateAlgebra.X`.

**Checks.**

- `Perfectoid.perfectedTateAlgebra_empty_test`: perfectedTateAlgebra R PEmpty ≃+* R as topological rings.
- `Perfectoid.perfectedTateAlgebra.X_pow`: (X s (1/p^{m+1}))^p = X s (1/p^m), and Frobenius on A_0/ϖ sends the class of X s (1/p) to that of X s 1; for Σ = ℕ the series Σ_k ϖ^k X k 1 converges while Σ_k X k 1 does not.
- `Perfectoid.perfectedTateAlgebra.tilt_cyclotomic`: tilt (ℚ_p^cycl⟨T^{1/p^∞}⟩) ≃+* (tilt ℚ_p^cycl)⟨T^{1/p^∞}⟩ = F_p((t^{1/p^∞}))^⟨T^{1/p^∞}⟩ (ECD Example 3.4(iii); Kedlaya AWS Example 2.3.15).

Source: [AWS](#source-aws) Example 2.1.4, p. 50.

*Needs:* [P1.1](#p1-1).

<a id="p1-31"></a>

### 1.31 The completed cyclotomic field ℚ_p^cycl is a perfectoid field;

The completion ℚ_p^cycl of ℚ_p(μ_{p^∞}) is a perfectoid field: its valuation ring is the p-adic completion ℤ_p^cycl of ℤ_p[μ_{p^∞}], its value group |p|^{ℤ[1/p]/(p−1)} is nondiscrete and Frobenius on ℤ_p^cycl/p is surjective. Its tilt is the completed perfection of F_p((t)) with t = ε − 1, ε = (1, ζ_p, ζ_{p²}, …), with |t♯| = |p|^{p/(p−1)} (Berkeley Example 6.2.4), and it is the untilt of (F_p((t^{1/p^∞}))^, F_p[[t^{1/p^∞}]]^) along the primitive ideal generated by Σ_{i=0}^{p−1}[1 + t]^{i/p} (Kedlaya AWS Example 2.3.8;.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [ECD](#source-ecd) Example 3.4(i), p. 14.

*Needs:* [P1.11](#p1-11).

<a id="p1-32"></a>

### 1.32 Examples and non-examples of perfectoid Tate rings

The following are perfectoid Tate rings, each a declaration of the library: (1) ℂ_p (Mathlib PadicComplex p), a perfectoid field whose tilt contains p♭ = (p, p^{1/p}, …) with (p♭)♯ = p; (2) the completion K_1 of ℚ_p(p^{1/p^∞}), a perfectoid field with valuation ring the p-adic completion of ℤ_p[p^{1/p^∞}] and tilt F_p((t^{1/p^∞}))^ with t♯ = p, the untilt along (p − [t]) (Kedlaya AWS Example 2.3.7); (3) the completed perfection F_p((t^{1/p^∞}))^, a perfectoid field of characteristic p equal to its own tilt; (4) ℚ_p^cycl (P1.31); (5) ℚ_p^cycl⟨T^{1/p^∞}⟩ (P1.30); (6) the ring R = ℤ_p^cycl[[T^{1/p^∞}]]⟨(p/T)^{1/p^∞}⟩[1/T] with ϖ = T^{1/p} (ϖ^p = T divides p in R°), which does not contain a nonarchimedean field (ECD Example 3.4(iv);.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [ECD](#source-ecd) Remark 3.3 and Example 3.4, pp. 14–15.

*Needs:* [P1.1](#p1-1).

### Examples

ℚ_p fails the perfectoid condition; ℂ_p and completed perfect characteristic-p fields supply examples. Compatible roots fix the spectral-gauge normalization.

### Dependencies

Layer 0; Mathlib Witt vectors, multiplicative perfection, PreTilt and Fontaine theta; the exact Huber-ring inputs in the supplier section.

<a id="p2"></a>

## Layer 2: Rational localisation, the sheaf theorem and perfectoid spaces

The tilting homeomorphism of adic spectra with its rational subsets, perfectoid rational localisation, completed residue fields, the sheaf theorem with almost acyclicity of O⁺ on rational coverings, affinoid perfectoid and perfectoid spaces as a full subcategory of adic spaces, glued tilting and the slice equivalence, completed tensor products and fibre products, and absolute products in Perf.

<a id="p2-1"></a>

### 2.1 The tilting map x ↦ x♭ from Spa(R, R⁺) to Spa(R♭, R♭⁺)

Let (R, R⁺) be a perfectoid Tate pair with tilt (R♭, R♭⁺) and sharp map ♯ : R♭ → R (continuous and multiplicative, not additive), X = Spa(R, R⁺), X♭ = Spa(R♭, R♭⁺). For x ∈ X with valuation v_x : R → Γ_x ∪ {0}, the composite v_x ∘ ♯ : R♭ → Γ_x ∪ {0} is a continuous valuation of R♭ with v_x(f♯) ≤ 1 for all f ∈ R♭⁺; its class is a point x♭ ∈ X♭, characterised by |f(x♭)| ≤ |g(x♭)| ⟺ |f♯(x)| ≤ |g♯(x)| for all f, g ∈ R♭ (written |f(x♭)| = |f♯(x)|).

Provide the interfaces `PerfectoidSpace.spaTilt`, `PerfectoidSpace.spaTilt_vle_iff`, `PerfectoidSpace.supp_spaTilt`.

**Checks.**

- `spaTilt_test_perfectoidDisc_point`: For R = Q_p^cycl⟨T^{1/p^∞}⟩ and x the point T ↦ ϖ, spaTilt x is the point T ↦ ϖ♭ of Q_p^cycl♭⟨T^{1/p^∞}⟩: |T(x♭)| = |T♯(x)| = |ϖ(x)|.
- `spaTilt_test_charP_eq_id`: For R = F_p((t^{1/p^∞}))^∧⟨T^{1/p^∞}⟩ (characteristic p), spaTilt is the identity of Spa(R, R⁺).
- `spaTilt_test_preimage_disc`: On the perfectoid disc over Q_p^cycl, spaTilt ⁻¹' U({T, ϖ♭}/ϖ♭) = U({T, ϖ}/ϖ), the instance of spaTilt_preimage_rationalSubset with f₂ = ϖ♭.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P2.1a Approximation of homogeneous functions on a perfectoid polydisc over a perfectoid Tate ring (Sch12 Section 6, Lemma 6.5)

Source: [ECD](#source-ecd) Section 3, Theorem 3.12, p. 17; [Sch12](#source-sch12) Theorem 6.3(i), p. 30 (continuity and well-definedness of x ↦ x♭).

*Needs:* [P1.4](#p1-4).

**The tilting homeomorphism.**

<a id="p2-2"></a>

### 2.2 The tilting homeomorphism Spa(R, R⁺) ≅ Spa(R♭, R♭⁺) identifies rational subsets

Let (R, R⁺) be a perfectoid Tate pair (ECD Definition 3.1; no perfectoid base field) with tilt (R♭, R♭⁺). Then the tilting map τ_R : X = Spa(R, R⁺) → X♭ = Spa(R♭, R♭⁺), |f(x♭)| = |f♯(x)| (P2.1), is a homeomorphism, natural in morphisms of perfectoid Tate pairs. A subset U ⊆ X is rational if and only if τ_R(U) ⊆ X♭ is rational; explicitly, for f₁, …, f_n, g ∈ R♭⁺ with f_n = (ϖ♭)^N, τ_R(U(f₁♯, …, f_n♯ / g♯)) = U(f₁, …, f_n / g), and every rational subset of X can be written as U(f₁♯, …, f_n♯ / g♯) for such f_i, g. Consequently τ_R preserves the specialisation order, quasi-compact opens and rank-one (maximal) points, and restricts, for every rational U ⊆ X, to a homeomorphism U ≅ τ_R(U) identifying rational subsets of U and of τ_R(U).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P2.2a Rational localisations of perfectoid Tate pairs of characteristic p are perfect, with an explicit almost integral model (KL15 Proposition 3.1.7)
- P2.2b Approximation lemma: every function on a perfectoid affinoid is approximated by a sharp (Sch12 Section 6, Corollary 6.7(i))

Source: [ECD](#source-ecd) Section 3, Theorem 3.12, p. 17; [Sch12](#source-sch12) Corollary 6.7(ii) and [KL15](#source-kl15) Theorem 3.6.14(b) for the explicit form of the rational subsets.

*Needs:* [P2.1](#p2-1), [P1.27](#p1-27), [P1.18a](#p1-18).

**Rational localization.**

<a id="p2-3"></a>

### 2.3 Rational localisations of a perfectoid Tate pair are perfectoid, with tilt the rational localisation of the tilt

Let (R, R⁺) be a perfectoid Tate pair (ECD Definition 3.1; no perfectoid base field), X = Spa(R, R⁺), X♭ = Spa(R♭, R♭⁺) and τ_R : X ≅ X♭ the tilting homeomorphism. For every rational subset U ⊆ X, the rational localisation (O_X(U), O_X⁺(U)) of AdicSpaces (Layer 3.1: O_X(U) = R⟨T/s⟩ for any presentation U = U(T/s), O_X⁺(U) the integral closure of the image of R⁺[T/s];

Provide the interfaces `Perfectoid.rationalLocalization`, `Perfectoid.rationalLocalization.isPerfectoidTateRing`, `Perfectoid.rationalLocalization.tiltEquiv`.

**Checks.**

- `rationalLocalization_test_perfectoidDisc`: For R = Q_p^cycl⟨T^{1/p^∞}⟩ and U = {|T| ≤ |ϖ|}, rationalLocalization R⁺ U ≅ Q_p^cycl⟨(T/ϖ)^{1/p^∞}⟩ and tiltEquiv identifies its tilt with Q_p^cycl♭⟨(T/ϖ♭)^{1/p^∞}⟩.
- `rationalLocalization_test_noBaseField`: For R of ECD Example 3.4(iv) and U = {|T| ≤ |p|}, isPerfectoidTateRing holds for O_X(U) and p is a unit there; the statement must not require an algebra structure over a perfectoid field.
- `rationalLocalization_test_charP`: In characteristic p, the tilt comparison is the identity on the completed rational localization. **Gap.** Identification of the plus ring with the displayed compatible-root integral model requires its integral-closure comparison; it must not be inferred from almost equality alone.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P2.3a Untilted rational localisations: explicit almost integral model, perfectoidness and tilt (Sch12 Section 6, Lemma 6.4 (statement))

Source: [ECD](#source-ecd) Section 3, Theorem 3.18, p. 18.

*Needs:* [P2.2](#p2-2), [P2.2a](#p2-2), [P2.1](#p2-1).

<a id="p2-4"></a>

### 2.4 The presheaf of perfectoid pairs on rational subsets: restriction maps, plus rings, and tilting as a natural isomorphism

Let (R, R⁺) be a perfectoid Tate pair, X = Spa(R, R⁺), τ = τ_R. On the poset Rat(X) of rational subsets of X, the assignment U ↦ (O_X(U), O_X⁺(U)) with AdicSpaces' restriction maps ρ_{U,V} (V ⊆ U) is a functor Rat(X)^op → {perfectoid Tate pairs} (P2.3), with: (a) transitivity: for V ⊆ U rational, V is rational in U ≅ Spa(O_X(U), O_X⁺(U)) and ρ_{U,V} is the rational localisation of (O_X(U), O_X⁺(U)) at V;

Provide the interfaces `PerfectoidSpace.rationalPairFunctor`, `PerfectoidSpace.rationalPairFunctor.map_comp`, `PerfectoidSpace.rationalPairFunctor.isRationalLocalization_map`.

**Checks.**

- `rationalPairFunctor_test_restriction_disc`: For R = Q_p^cycl⟨T^{1/p^∞}⟩, V = {|T| ≤ |ϖ|²} ⊆ U = {|T| ≤ |ϖ|}, the restriction sends (T/ϖ)^{1/p^m} to ϖ^{1/p^m}(T/ϖ²)^{1/p^m}, and tiltIso transports it to the same formula over Q_p^cycl♭ with ϖ♭.
- `rationalPairFunctor_test_plusModEquiv_whole`: For U = X, plusModEquiv is the ring isomorphism R♭⁺/ϖ♭ ≅ R⁺/ϖ induced by ♯ (ECD Lemma 3.11), and naturality for V ⊆ X is the commutation with R⁺/ϖ → O_X⁺(V)/ϖ.
- `rationalPairFunctor_test_plus_ne_powerBounded`: For K = Q_p^cycl, R = K⟨T^{1/p^∞}⟩ and R⁺ = K° + K°°⟨T^{1/p^∞}⟩ (open, integrally closed), T ∈ R° \ R⁺ while ϖ^{1/p^n}T ∈ R⁺ for all n; a definition of the plus presheaf by O_X(U)° would violate mem_plus_iff at the points of Spa(R, R⁺) where |T| > 1.

Source: [ECD](#source-ecd) Section 3, Example 3.22(ii), p. 19.

*Needs:* [P2.3](#p2-3).

<a id="p2-5"></a>

### 2.5 Completed residue fields of perfectoid affinoids are perfectoid and tilt to those of the tilt

Let (R, R⁺) be a perfectoid Tate pair, X = Spa(R, R⁺), x ∈ X, and (k(x)^, k(x)^⁺) the completed residue affinoid field of x (the completion of the residue field of the stalk O_{X,x} for the topology of v_x, with the completion of the valuation ring of v_x; AdicSpaces Layer 3.3), with its canonical morphism (R, R⁺) → (k(x)^, k(x)^⁺). Then k(x)^ is a perfectoid field and (k(x)^, k(x)^⁺) is a perfectoid Tate pair..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [Sch12](#source-sch12) Section 6, Corollary 6.7(ii) with proof, p. 35.

*Needs:* [P2.3](#p2-3).

<a id="p2-6"></a>

### 2.6 Perfectoid Tate pairs are stably uniform and sheafy, with Čech-acyclic structure sheaf

Let (R, R⁺) be a perfectoid Tate pair (ECD Definition 3.1; no base field), X = Spa(R, R⁺). Then (a) (R, R⁺) is stably uniform: O_X(U) is uniform for every rational U ⊆ X (Hansen–Kedlaya Definition 3.13;

Source: [KL15](#source-kl15) §3.6, Theorem 3.6.15 with proof, p. 94.

*Needs:* [P2.3](#p2-3).

<a id="p2-7"></a>

### 2.7 Almost exactness of the integral Čech complex of O⁺ on rational coverings of a perfectoid affinoid

Let (R, R⁺) be a perfectoid Tate pair (ECD Definition 3.1; no base field), X = Spa(R, R⁺). For every rational U ⊆ X and every finite covering 𝔘 = (U₁, …, U_m) of U by rational subsets, the augmented alternating Čech complex C⁺(𝔘): 0 → O_X⁺(U) → ∏_i O_X⁺(U_i) → ∏_{i<j} O_X⁺(U_i ∩ U_j) → ⋯ is almost exact: each of its cohomology modules is killed by every topologically nilpotent element of R⁺ (equivalently by ϖ^{1/p^n} for all n;.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P2.7a Almost exactness lifts from reduction modulo ϖ for torsion-free complete complexes (Sch12 Section 6, Proposition 6.14 (characteristic 0))
- P2.7b Integral Čech cohomology of a stably uniform sheafy Tate pair is killed by a bounded power of ϖ (Sch12 Section 6, Proposition 6.10(iii))
- P2.7c From almost Čech acyclicity on the rational basis to almost vanishing of sheaf cohomology (KL15  Proposition 2.4.21)

Source: [Berkeley](#source-berkeley) Lecture 7, proof of Theorem 7.4.4, p. 53.

*Needs:* [P2.6](#p2-6).

**The sheaf theorem.**

<a id="p2-8"></a>

### 2.8 The sheaf theorem: O_X is a sheaf with vanishing higher cohomology and H^i(X, O_X⁺) is almost zero

Let (R, R⁺) be a perfectoid Tate pair (ECD Definition 3.1: any perfectoid Tate ring, of characteristic 0, p or mixed, with no perfectoid base field) and X = Spa(R, R⁺). Then: (i) O_X and O_X⁺ are sheaves on X; (ii) for every rational U ⊆ X, (O_X(U), O_X⁺(U)) is a perfectoid Tate pair with tilt (O_{X♭}(U♭), O_{X♭}⁺(U♭)), U♭ the image of U in X♭; (iii) H⁰(X, O_X) = R and H^i(X, O_X) = 0 for i > 0; (iv) H⁰(X, O_X⁺) = R⁺ and, for i > 0, the R⁺-module H^i(X, O_X⁺) is almost zero, i.e. killed by every topologically nilpotent element of R⁺ (equivalently H^i(X, O_X⁺ᵃ) = H^i(X, O_X°ᵃ) = 0 in the almost category, Sch12 Remark 6.12); (v) (i)-(iv) hold for every rational U in place of X.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P2.8a Almost acyclicity for p-finite perfectoid affinoids via Tate's acyclicity theorem (the source convention includes S⁺ = S°) (Sch12 Section 6, Definition 6.9)
- P2.8b Perfectoid affinoid algebras in characteristic p are completed direct limits of p-finite ones (Sch12 Section 6, Lemma 6.13(i))

Source: [ECD](#source-ecd) Section 3, Theorem 3.18, p. 18, for the sheaf property and the perfectoidness of O(U); [Sch12](#source-sch12) Theorem 6.3(iv), p. 30, and Proposition 6.14, p. 37 (over a perfectoid field), and [KL15](#source-kl15) Theorem 3.6.15, p. 94, for the vanishing of H^i(X, O) and the almost vanishing of H^i(X, O⁺).

*Needs:* [P2.6](#p2-6), [P2.3](#p2-3), [P2.4](#p2-4).

<a id="p2-9"></a>

### 2.9 Affinoid perfectoid spaces: adic spectra of perfectoid Huber pairs

An adic space X (an object of AdicSpaces' category of adic spaces, Layer 5: an object of Huber's category 𝒱 locally isomorphic to the adic spectrum of a sheafy Huber pair) is *affinoid perfectoid* if there are a complete Hausdorff Huber pair (R, R⁺) (Tau Ceti.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `PerfectoidSpace.IsAffinoidPerfectoid`, `PerfectoidSpace.spa`, `PerfectoidSpace.IsAffinoidPerfectoid.spa`.

**Checks.**

- `IsAffinoidPerfectoid.spa_Cp`: Spa(ℂ_p, O_{ℂ_p}) is affinoid perfectoid and its underlying space is a single point (the rank-one valuation).
- `not_isAffinoidPerfectoid_spa_Qp`: Spa(ℚ_p, ℤ_p) is an affinoid adic space (strongly noetherian, anchor Layer 4.1) but not affinoid perfectoid: any isomorphism Spa(ℚ_p, ℤ_p) ≅ Spa(R, R⁺) gives R ≅ O(Spa(ℚ_p, ℤ_p)) = ℚ_p, which is not perfectoid (ECD Remark 3.3). A definition asking only for surjective Frobenius on the residue field would accept it.
- `isAffinoidPerfectoid_empty`: The empty adic space is affinoid perfectoid, presented by the zero ring with the zero plus ring (0 is a pseudouniformiser of the zero ring and ECD Definition 3.1 holds vacuously); a definition requiring a nonzero ring or a base field fails this.

Source: [Berkeley](#source-berkeley) Lecture 7, §7.1, Remark 7.1.3, printed p. 49.

*Needs:* [P1.1](#p1-1).

**Perfectoid space.**

<a id="p2-10"></a>

### 2.10 Perfectoid spaces: the full subcategory Perfd of adic spaces, and Perf in characteristic p

A *perfectoid space* is an adic space X (AdicSpaces Layer 5) covered by open subspaces that are affinoid perfectoid (P2.9): every x ∈ X has an open neighbourhood U such that the open adic subspace (U, O_X|_U, (v_y)_{y ∈ U}) is isomorphic to Spa(R, R⁺) with R a perfectoid Tate ring and R⁺ ⊆ R° a ring of integral elements (ECD Definition 3.19). The category Perfd of perfectoid spaces is the full subcategory of AdicSpaces' category of adic spaces on these objects (Mathlib `ObjectProperty.FullSubcategory`): morphisms are morphisms of adic spaces; open subspaces, gluing and the sheaf property of morphisms are AdicSpaces', and no second carrier (no separate locally ringed space and no second gluing theory) is introduced.

Assume throughout this subsection: X is an object of AdicSpaces' category of adic spaces.

Provide the interfaces `PerfectoidSpace.IsPerfectoidSpace`, `PerfectoidSpace`, `PerfectoidSpace.toAdicSpace`.

**Checks.**

- `isPerfectoidSpace_empty`: The empty adic space is a perfectoid space (it is covered by the empty family).
- `not_isPerfectoidSpace_spa_Qp`: Spa(ℚ_p, ℤ_p) is not a perfectoid space: its only nonempty open subset is the whole space, whose ring ℚ_p is not perfectoid (ECD Remark 3.3).
- `not_isPerfectoidSpace_closedUnitDisc_Qp`: The closed unit disc Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩) is not a perfectoid space: the classical point T = 0 has completed residue field ℚ_p, which is discretely valued and not perfectoid, whereas every completed residue field of a perfectoid space is a perfectoid field (P2.5; Kedlaya AWS Corollary 2.5.7).

Source: [ECD](#source-ecd) Section 3, Definition 3.19, p. 18.

*Needs:* [P2.9](#p2-9), [P1.2](#p1-2), AdicSpacesPartII R0 (adic morphisms, finiteness classes, locally noetherian spaces).

<a id="p2-11"></a>

### 2.11 The glued tilt X ↦ X♭ of a perfectoid space

For every perfectoid space X (P2.10; any characteristic, no base field) there is a perfectoid space X♭ of characteristic p, the *tilt* of X, with a homeomorphism |X| ≅ |X♭|, x ↦ x♭, constructed by gluing (ECD, the sentence after Definition 3.19; Sch12 Definition 6.16 and Proposition 6.17 over a perfectoid field).

Provide the interfaces `PerfectoidSpace.tilt`, `PerfectoidSpace.tiltHomeomorph`, `PerfectoidSpace.tiltSpaIso`.

**Checks.**

- `tilt_spa_cyclotomic`: Tilting the completed cyclotomic field gives the t-adic completed perfection of 𝔽_p((t)), with t = (1, ζ_p, ζ_{p²}, …) − 1. The adic spectra with maximal plus rings are both single points; the completion on the characteristic-p field is essential.
- `tilt_spa_perfectedDisc`: For a perfectoid Tate ring R: Spa(R⟨T^{1/p^∞}⟩, R⁺⟨T^{1/p^∞}⟩)♭ ≅ Spa(R♭⟨T^{1/p^∞}⟩, R♭⁺⟨T^{1/p^∞}⟩) with T ↦ (T, T^{1/p}, …).
- `tilt_empty`: The tilt of the empty perfectoid space is empty.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P2.11a Rational subsets of affinoid perfectoid opens are affinoid perfectoid, and affinoid perfectoid opens form a basis (Sch12 Section 6, Proposition 6.17)
- P2.11b Open subspaces of perfectoid spaces are perfectoid; open immersions in Perfd (Wedhorn Remark 8.23(2))

Source: [ECD](#source-ecd) Section 3, after Definition 3.19, p. 18.

*Needs:* [P2.10](#p2-10).

**Tilting equivalence of perfectoid spaces.**

<a id="p2-12"></a>

### 2.12 Tilting equivalence of perfectoid spaces: Perfd/X ≃ Perf/X♭

Let X be a perfectoid space with tilt X♭ (P2.11). (a) The functor Perfd/X → Perf/X♭ = Perfd/X♭ on slice categories (Mathlib `CategoryTheory.Over`), (f : Y → X) ↦ (f♭ : Y♭ → X♭), is an equivalence of categories (a Mathlib `CategoryTheory.Equivalence`). (b) It commutes with restriction to open subspaces of X, and a perfectoid space Y over X is affinoid perfectoid iff Y♭ is; for X = Spa(A, A⁺) it restricts on affinoid perfectoid spaces to the equivalence of P2.12a.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P2.12a Tilting is an equivalence between perfectoid Tate pairs over (A, A⁺) and over (A♭, A♭⁺), compatible with rational localisation (ECD Section 3, Theorem 3.13 and its proof)

Source: [ECD](#source-ecd) Section 3, Corollary 3.20, p. 19.

*Needs:* [P2.11](#p2-11), [P2.11a](#p2-11), [P2.11b](#p2-11).

<a id="p2-13"></a>

### 2.13 Completed tensor products of perfectoid Tate pairs are perfectoid, uniform, and commute with tilting

Let (A, A⁺) → (B, B⁺) and (A, A⁺) → (C, C⁺) be morphisms of complete Hausdorff Huber pairs (Tau Ceti `Huber.Pair.Hom`) with A, B, C perfectoid Tate rings (ECD Definition 3.1; any characteristic; no perfectoid base field). Both maps are adic (AdicSpacesPartII R0 (adic morphisms, finiteness classes, locally noetherian spaces)), so the completed tensor product (D, D⁺) = B ⊗̂_A C with inl, inr (AdicSpacesPartII R0 (the completed tensor product); D⁺ the closure of the integral closure of the image of B⁺ ⊗_{A⁺} C⁺) is defined. Then: (i) D is a perfectoid Tate ring; in particular D is uniform and the uniformisation D → B ⊗̂ᵘ_A C (AdicSpacesPartII R0 (the spectral seminorm, uniformization and the uniform completed tensor product)) is an isomorphism (the tensor-product norm is the spectral norm, Kedlaya–Liu II Theorem 3.3.13(b)); (ii) (D, D⁺) with inl, inr is a pushout of (B, B⁺) ← (A, A⁺) → (C, C⁺) in the category of complete perfectoid Tate pairs; (iii) tilting commutes with it: there is a unique isomorphism of Huber pairs (D♭, D♭⁺) ≅ (B♭, B♭⁺) ⊗̂_{(A♭, A♭⁺)} (C♭, C♭⁺) whose composites with inl♭, inr♭ are inl, inr (Kedlaya AWS Theorem 2.4.1;.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P2.13a Characteristic p: the completed tensor product of perfect complete Tate rings is perfect, uniform and perfectoid (KL15 Remark 3.1.6(c))

Source: [AWS](#source-aws) §2.4, Theorem 2.4.1, p. 57.

*Needs:* AdicSpacesPartII R0 (the completed tensor product).

<a id="p2-14"></a>

### 2.14 The uniform completed tensor product of perfectoid rings over an arbitrary Tate ring is perfectoid

Let (A, A⁺) be a complete Hausdorff Huber pair with A a Tate ring (not necessarily perfectoid, uniform or of characteristic p), and let (A, A⁺) → (B, B⁺), (A, A⁺) → (C, C⁺) be morphisms of Huber pairs with B, C perfectoid Tate rings. Then the uniform completed tensor product B ⊗̂ᵘ_A C (AdicSpacesPartII R0 (the spectral seminorm, uniformization and the uniform completed tensor product)) is a perfectoid Tate ring (Kedlaya–Liu II Corollary 3.3.21;.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P2.14a A uniform Tate ring receiving a dense-image map from a perfectoid ring is perfectoid (AWS Lemma 2.8.4)

Source: [KL16](#source-kl16) §3.3, Corollary 3.3.21, p. 66.

*Needs:* AdicSpacesPartII R0 (the spectral seminorm, uniformization and the uniform completed tensor product).

<a id="p2-15"></a>

### 2.15 Affinoid perfectoid fibre products: Spa(B ⊗̂_A C) is a fibre product in adic spaces, compatible with open subspaces

Let X = Spa(A, A⁺), Y = Spa(B, B⁺), Z = Spa(C, C⁺) be affinoid perfectoid spaces and Y → X ← Z morphisms, corresponding (Wedhorn Proposition 8.25) to morphisms of complete perfectoid Tate pairs (A, A⁺) → (B, B⁺) and (A, A⁺) → (C, C⁺). Let (D, D⁺) = B ⊗̂_A C, a complete perfectoid Tate pair (P2.13), hence sheafy (P2.6). Then (a) W = Spa(D, D⁺) with p = Spa(inl) and q = Spa(inr) is a fibre product Y ×_X Z in AdicSpaces' category of adic spaces (a Mathlib `IsPullback` square there), hence in Perfd, and W is affinoid perfectoid; this is AdicSpacesPartII R0 (fibre products) with its sheafiness hypothesis discharged. (b) For rational subsets U' ⊆ X, U ⊆ Y, V ⊆ Z with U and V mapping into U', the open p⁻¹(U) ∩ q⁻¹(V) ⊆ W is a rational subset and equals Spa(O_Y(U) ⊗̂_{O_X(U')} O_Z(V)) = U ×_{U'} V (AdicSpacesPartII:R0/completed-tensor-rational-localisation). (c) For arbitrary open subspaces U ⊆ Y, V ⊆ Z, the open subspace p⁻¹(U) ∩ q⁻¹(V) with the restricted projections is a fibre product U ×_X V in adic spaces. (d) The map |W| → |Y| ×_{|X|} |Z| is surjective (AdicSpacesPartII:R0/fibre-product-points) and not injective in general.

Source: [Sch12](#source-sch12) Section 6, proof of Proposition 6.18, p. 38.

*Needs:* [P2.13](#p2-13).

**Fibre products of perfectoid spaces.**

<a id="p2-16"></a>

### 2.16 Fibre products of perfectoid spaces exist in adic spaces and are perfectoid

Let f : Y → X and g : Z → X be morphisms of perfectoid spaces (any characteristic; no perfectoid base field). The fibre product W = Y ×_X Z exists in AdicSpaces' category of adic spaces and is a perfectoid space; with its projections p : W → Y, q : W → Z it is therefore also a fibre product in Perfd, Perfd has all fibre products (Mathlib `HasPullbacks`), and the inclusion Perfd ⥤ AdicSpace preserves them.

Provide the interfaces `PerfectoidSpace.pullback`, `PerfectoidSpace.pullback.fst`, `PerfectoidSpace.pullback.condition`.

**Checks.**

- `pullback_perfectedDiscs`: For a perfectoid Tate ring R: Spa(R⟨T^{1/p^∞}⟩, R⁺⟨T^{1/p^∞}⟩) ×_{Spa(R, R⁺)} Spa(R⟨S^{1/p^∞}⟩, R⁺⟨S^{1/p^∞}⟩) ≅ Spa(R⟨T^{1/p^∞}, S^{1/p^∞}⟩, R⁺⟨T^{1/p^∞}, S^{1/p^∞}⟩) over the two projections.
- `pullback_galois_points`: For a finite Galois extension L/K of perfectoid fields with group G, Spa(L, L°) ×_{Spa(K, K°)} Spa(L, L°) ≅ ⊔_{g ∈ G} Spa(L, L°) has |G| points while |Spa L| ×_{|Spa K|} |Spa L| is one point: the underlying space of a fibre product is not the fibre product of underlying spaces.
- `pullback_id`: Y ×_X X ≅ Y via p, for the identity of X; and Y ×_X ∅ = ∅.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P2.16a The plus ring of a perfectoid completed tensor product: almost equal to the completed tensor product of plus rings, but not equal (Bhatt Exercise 9.3.14, printed)
- P2.16b Tilting commutes with fibre products of perfectoid spaces (AWS Theorem 2.4.1)

Source: [Sch12](#source-sch12) Section 6, Proposition 6.18, p. 38.

*Needs:* [P2.15](#p2-15), [P2.10](#p2-10), [P2.11a](#p2-11).

<a id="p2-17"></a>

### 2.17 Fibre products of perfectoid spaces over an analytic adic space, in Perfd, via uniform completed tensor products

Let S be an analytic adic space (AdicSpaces Layer 5; every point analytic, e.g. Spa(K, K⁺) for any nonarchimedean field K, or any rigid space) and f : Y → S, g : Z → S morphisms from perfectoid spaces. Then the fibre product Y ×_S Z exists in Perfd: there is a perfectoid space W with morphisms p : W → Y, q : W → Z, f p = g q, such that for every perfectoid space T, Hom(T, W) = Hom(T, Y) ×_{Hom(T, S)} Hom(T, Z).

Provide the interfaces `PerfectoidSpace.pullbackOverAnalytic`, `PerfectoidSpace.pullbackOverAnalytic.fst`, `PerfectoidSpace.pullbackOverAnalytic.condition`.

**Checks.**

- `pullbackOverAnalytic_Cp_Qp`: For S = Spa(ℚ_p, ℤ_p) and Y = Z = Spa(ℂ_p, O_{ℂ_p}), the affinoid piece is Spa(ℂ_p ⊗̂ᵘ_{ℚ_p} ℂ_p) and not Spa(ℂ_p ⊗̂_{ℚ_p} ℂ_p): the completed tensor product is not uniform (Kedlaya–Liu I Remark 2.8.5), so a construction without uniformisation does not produce a perfectoid ring.
- `pullbackOverAnalytic_perfectoidBase`: If S is perfectoid, pullbackOverAnalytic f g ≅ PerfectoidSpace.pullback f g over Y and Z.
- `pullbackOverAnalytic_empty`: If Y = ∅ then Y ×_S Z = ∅.

Source: [KL16](#source-kl16) §3.3, Corollary 3.3.21, p. 66.

*Needs:* [P2.14](#p2-14).

<a id="p2-18"></a>

### 2.18 Absolute products in Perf

Let X, Y be perfectoid spaces of characteristic p. The product X × Y exists in Perf (Berkeley Lemma 8.3.5; ECD proof of Proposition 11.4). It is also the fibre product X ×_{Spa(𝔽_p, 𝔽_p)} Y in AdicSpaces' category of adic spaces, over the discrete adic space Spa(𝔽_p, 𝔽_p), which is not a perfectoid (nor Tate, nor analytic) space; the structure maps X → Spa(𝔽_p, 𝔽_p) are not adic, so neither P2.16 nor AdicSpacesPartII R0 (fibre products) applies, and Perf has no final object (Berkeley Remark 8.3.6), so the absolute product is not a fibre product in Perf. Affinoid charts: for X = Spa(A, A⁺), Y = Spa(B, B⁺) affinoid perfectoid of characteristic p with pseudouniformisers ϖ ∈ A, ϖ' ∈ B, and integers m, n ≥ 1, put E = A ⊗_{𝔽_p} B, u_m = (ϖ^m ⊗ 1)(1 ⊗ ϖ')⁻¹ and v_n = (1 ⊗ ϖ'^n)(ϖ ⊗ 1)⁻¹ in E, D_{m,n} = (A° ⊗ B°)[u_m, v_n] ⊆ E; topologise E so that D_{m,n} is open with the (ϖ ⊗ 1)-adic topology (equal to the (1 ⊗ ϖ')-adic one, since ϖ^m = u_m ϖ' and ϖ'^n = v_n ϖ in D_{m,n}); let C_{m,n} be the completion and C⁺_{m,n} the completion of the integral closure in E of the image of (A⁺ ⊗ B⁺)[u_m, v_n], an open integrally closed subring. Then (C_{m,n}, C⁺_{m,n}) is a complete perfectoid Tate pair (C_{m,n} is a perfect complete Tate ring); a morphism of pairs (C_{m,n}, C⁺_{m,n}) → (R, R⁺) to a complete Huber pair with R Tate is the same as morphisms φ : (A, A⁺) → (R, R⁺), ψ : (B, B⁺) → (R, R⁺) with φ(ϖ)^m ψ(ϖ')⁻¹ ∈ R⁺ and ψ(ϖ')^n φ(ϖ)⁻¹ ∈ R⁺; for m ≤ m', n ≤ n', Spa(C_{m,n}) is the rational subset {|u_m| ≤ 1, |v_n| ≤ 1} of Spa(C_{m',n'}); and X × Y = ⋃_{m,n} Spa(C_{m,n}, C⁺_{m,n}), glued along these rational open immersions (AdicSpaces Layer 5.3). For general X, Y the affinoid products glue..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `PerfectoidSpace.Perf.prod`, `PerfectoidSpace.Perf.prodFst`, `PerfectoidSpace.Perf.prodLift`.

**Checks.**

- `prod_perfectoidFields`: Spa 𝔽_p((t^{1/p^∞})) × Spa 𝔽_p((s^{1/p^∞})) ≅ {0 < |s| < 1} ⊆ Spa 𝔽_p((t^{1/p^∞}))⟨s^{1/p^∞}⟩, the union of the affinoid perfectoid annuli Spa(C_{m,n}) = {|t|^m ≤ |s| ≤ |t|^{1/n}}; in particular the absolute product of two perfectoid fields is not a point and not quasi-compact.
- `prod_empty`: X × ∅ = ∅ for every X ∈ Perf.
- `not_isPerfectoidSpace_spa_Fp_final`: Spa(𝔽_p, 𝔽_p) with the discrete topology is not an object of Perf (its point is not analytic), Perf has no final object (Berkeley Remark 8.3.6), and X × Y is not X ×_Z Y for any Z ∈ Perf in general; a definition of the product as a fibre product over a perfectoid 'Spa 𝔽_p' is ill-typed.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P2.18a Characteristic p: perfectoid spaces are adic spaces locally Spa of perfect Tate rings, and affinoid perfectoid spaces are the affinoid ones (Bhatt Exercise 9.3.12 (Mihara), printed)

Source: [Berkeley](#source-berkeley) Lecture 8, §8.3, Lemma 8.3.5 and Remark 8.3.6, printed p. 61.

*Needs:* [P2.10](#p2-10).

<a id="p2-19"></a>

### 2.19 Scholze's perfectoid spaces over a perfectoid field K are the perfectoid spaces over Spa(K, K⁺₀)

Let K be a perfectoid field (P1.10), K° its valuation ring and K⁺₀ ⊆ K° the smallest ring of integral elements of K, the integral closure of ℤ·1 + K°° in K (Wedhorn Remark 7.15(2)); K⁺₀ = K° iff the residue field of K is algebraic over 𝔽_p. (i) Sch12's perfectoid K-algebras (Definition 5.1) and perfectoid affinoid K-algebras (Definition 6.1) are the perfectoid Tate rings, respectively complete perfectoid Tate pairs (R, R⁺), with a continuous K-algebra structure; no condition K° ⊆ R⁺ is imposed. (ii) Sch12's category of perfectoid spaces over K (Definition 6.15: objects of Huber's category of triples whose structure sheaf is a sheaf of complete topological K-algebras, locally affinoid perfectoid; morphisms continuous K-linear) is equivalent to the slice category Perfd/Spa(K, K⁺₀): a morphism X → Spa(K, K⁺₀) is a continuous ring map K → O_X(X) (Wedhorn Proposition 8.25), and every such map sends K⁺₀ into O_X⁺(X), which contains all topologically nilpotent elements and is integrally closed. The full subcategory Perfd/Spa(K, K°) (Bhatt Definition 9.3.9) consists of those X with K° ⊆ O_X⁺(X); it is all of Sch12's category when the residue field of K is algebraic over 𝔽_p (e.g. K = ℂ_p, ℚ_p^cycl, 𝔽_p((t^{1/p^∞}))), and a proper full subcategory otherwise..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [Sch12](#source-sch12) Section 6, Definition 6.15, p. 38.

*Needs:* [P2.10](#p2-10).

### Examples

The empty space is perfectoid. Perfected discs test rational restriction, and a finite Galois field extension distinguishes a geometric fibre product from a product of point sets.

### Dependencies

Layers 0–1; the adic-space, rational-localization and gluing suppliers; completed tensor products from AdicSpacesPartII.

<a id="p3"></a>

## Layer 3: Almost purity and the étale site

The algebraic prefix (henselian pairs, Elkik approximation, finite étale algebras over henselian completions and completed colimits), almost purity in characteristic p, the untilting functor on finite étale algebras, finite extensions of perfectoid fields and Fontaine–Wintenberger, the almost purity theorem with its three conclusions, étale and finite étale morphisms of perfectoid spaces with their comparison to the adic ones, and the étale site with its tilting equivalence and almost acyclicity.

<a id="p3-1"></a>

### 3.1 Elkik's approximation theorem for noetherian henselian pairs (Théorème 2 bis)

Let (A, 𝔍) be a henselian pair with A noetherian, Â its 𝔍-adic completion, B a finitely generated A-algebra and B̂ = B ⊗_A Â. Let V ⊆ Spec B be an open subset smooth over Spec A and V̂ its preimage in Spec B̂. Then for every integer n and every Â-section ε̂: Spec Â → Spec B̂ whose.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P3.1a Henselian pairs: adic completeness, filtered colimits, and independence of the ring of definition of a Tate ring (Stacks Tag 0FWT (Lemma 15.11.13), Section 15.11 Henselian pairs)
- P3.1b Newton approximation: approximate solutions with Jacobian control lift to true solutions over (t, I)-adically complete rings (GR Lemma 5.4.8 and the paragraph after its proof)
- P3.1c Approximate solutions over henselian pairs (GR Proposition 5.4.13)
- P3.1d Sections of smooth quasi-projective schemes over R[t⁻¹] are dense in those over R^∧[t⁻¹]; smooth maps are open on sections (GR Proposition 5.4.21)

Source: [Elkik](#source-elkik) §II, Théorème 2 bis, p. 560.

*Needs:* `mathlib:HenselianRing`.

**Henselian approximation.**

<a id="p3-2"></a>

### 3.2 Finite étale algebras do not change under henselian completion: FÉt(R[t⁻¹]) ≃ FÉt(R^∧[t⁻¹]), and FÉt(A) ≃ FÉt(Â) for a topologically henselian Tate ring

(a) (Gabber–Ramero Proposition 5.4.54; book numbering 5.4.53) Let R be a ring, t ∈ R a non-zero-divisor, I ⊆ R an ideal with (R, tI) henselian, and R^∧ the (t, I)-adic completion. Then base change B ↦ B ⊗_{R[t⁻¹]} R^∧[t⁻¹] is an equivalence of categories FÉt(R[t⁻¹]) ≃ FÉt(R^∧[t⁻¹]) (Mathlib `CommAlgCat.FiniteEtale`), compatible with tensor products; it preserves and reflects ranks, faithful flatness and splitness. (b) (Tate-ring form; Berkeley Theorem 7.4.8) Let A be a Tate ring (Tau Ceti `Huber.IsTateRing`) which is topologically henselian (P3.1a (c): a ring of definition A₀ ∋ ϖ, ϖ a pseudouniformiser, is henselian along ϖA₀), and Â its completion (Tau Ceti completion of Huber rings), with ring of definition the ϖ-adic completion Â₀. Then B ↦ B ⊗_A Â is an equivalence FÉt(A) ≃ FÉt(Â). This is (a) with R = A₀, t = ϖ, I = A₀, since A = A₀[ϖ⁻¹] and Â = Â₀[ϖ⁻¹]. (c) (Scholze 2012 Proposition 7.4) For a perfectoid field K and a flat K°-algebra A henselian along (ϖ), A[ϖ⁻¹]_fét ≃ Â[ϖ⁻¹]_fét, Â the ϖ-adic completion — the special case R = A, t = ϖ, I = A of (a). No perfectoid, base-field or noetherian hypothesis enters (a) or (b).

Assume throughout this subsection: t a non-zero-divisor (automatic for t = ϖ a unit of A inside a ring of definition A₀ ⊆ A).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P3.2a Isomorphism classes of points of a smooth groupoid do not change from R[t⁻¹] to R^∧[t⁻¹] (GR 5.4.36 and Theorem 5.4.38)
- P3.2b Finitely generated projective modules over R[t⁻¹] and over R^∧[t⁻¹] correspond (GR Corollary 5.4.42)
- P3.2c The scheme of étale algebra structures on a projective module is smooth, and GL acts on it étale-ly (GR Lemma 5.4.46)
- P3.2d Finite étale algebras over a completed filtered colimit of complete Tate rings come from a finite stage (Sch12 Lemma 7.5 (i))

Source: [GR](#source-gr) §5.4, Proposition 5.4.54 (arXiv v3; Proposition 5.4.53 in the LNM 1800 book), pp. 126–127.

*Needs:* [P3.1a](#p3-1), `mathlib:CommAlgCat.FiniteEtale`, `mathlib:CommAlgCat.FiniteEtale.baseChange`.

**Almost purity in characteristic p.**

<a id="p3-3"></a>

### 3.3 Almost purity in characteristic p: finite étale algebras over a perfectoid Tate ring of characteristic p

Let R be a perfectoid Tate ring of characteristic p (equivalently a perfect complete Tate ring of characteristic p, P1.2; no base field), ϖ ∈ R a pseudouniformiser (it has all p-power roots ϖ^{1/pⁿ} in R°), R⁺ ⊆ R° a ring of integral elements, and S ∈ FÉt(R) with its natural topology and plus ring S⁺ = integral closure of R⁺ in S. Then: (i) S is perfect, complete and uniform, hence a perfectoid Tate ring of characteristic p, and (S, S⁺) is a perfectoid Huber pair;

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P3.3a Relative Frobenius of a weakly étale map is an isomorphism; étale algebras over perfect rings are perfect (Bhatt Chapter 4, §4.3, Lemma 4.3.8)
- P3.3b Finite étale algebras over a uniform complete Tate ring are uniform, and their power-bounded elements are the integral closure (AWS Lecture 1, §1.10, Lemma 1.10.1)

Source: [Sch12](#source-sch12) §5, Proposition 5.23, p. 28.

*Needs:* [P1.2](#p1-2), [P1.2c](#p1-2), [P1.1](#p1-1).

<a id="p3-4"></a>

### 3.4 Characteristic p: inverting ϖ is an equivalence between almost finite étale R°a-algebras and finite étale R-algebras

Let R be a perfectoid Tate ring of characteristic p with pseudouniformiser ϖ. Let (R°a)_afet be the category of almost finite étale R°a-algebras (P0.14). Then the functor (R°a)_afet → FÉt(R), A ↦ A_*[ϖ⁻¹] (A_* the ring of almost elements, P0.6), with its natural topology, is an.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [GR](#source-gr) §3.5, 3.5.26 and Theorem 3.5.28, p. 69.

*Needs:* [P3.3](#p3-3).

<a id="p3-5"></a>

### 3.5 The untilting functor on finite étale algebras, T ↦ T♯, via almost finite étale integral structures

Let R be a perfectoid Tate ring with tilt R♭ (P1.4) and choose a pseudouniformiser ϖ♭ ∈ R♭ with ϖ := (ϖ♭)♯ satisfying ϖ^p | p in R° (P1.3), so that R♭°/ϖ♭ = R°/ϖ (P1.5b). Define the untilting functor (−)♯: FÉt(R♭) → FÉt(R) as the composite FÉt(R♭) ≃ (R♭°a)_afet → (R♭°a/ϖ♭)_afet = (R°a/ϖ)_afet ≃ (R°a)_afet → FÉt(R), T ↦ T°a ↦ T°a/ϖ♭ ↦ A ↦ A_*[ϖ⁻¹] =: T♯, where the first equivalence is P3.4, the middle equivalence is the unique flat deformation of almost finite étale algebras along the ϖ-adically complete flat R°a (P0.28), and the last functor inverts ϖ (natural module topology on T♯). Properties: T♯ is a perfectoid Tate ring, finite étale over R, with a canonical isomorphism (T♯)♭ ≅ T of R♭-algebras (so (−)♯ is inverse to tilting on its image; compatible with the untilting of perfectoid algebras of P1.27); (T♯)°a = A is almost finite étale over R°a; the functor is independent of ϖ♭ up to canonical isomorphism, preserves tensor products, finite products, ranks (rank of T♯ at x ∈ Spa R equals the rank of T at x♭) and faithful flatness; and it commutes with base change along every map of perfectoid Tate rings R → R' (for example a rational localisation or the completed residue field at a point): (T ⊗_{R♭} R'♭)♯ ≅ T♯ ⊗_R R'. Equivalently (Kedlaya–Liu Lemma 3.6.20, Kedlaya AWS Lemma 2.8.10) T♯ = W(T⁺)[1/[ϖ♭]]/ξ for a generator ξ of ker(θ: W(R♭⁺) → R⁺) (P1.19), which shows finite étaleness without almost mathematics.

Provide the interfaces `Perfectoid.FiniteEtale.untilt`, `Perfectoid.FiniteEtale.untilt_isPerfectoid`, `Perfectoid.FiniteEtale.tiltUntiltIso`.

**Checks.**

- `Perfectoid.FiniteEtale.untilt_test_self`: untilt R (R♭ as a finite étale R♭-algebra) ≅ R, and untilt 0 = 0, untilt (T₁ × T₂) ≅ untilt T₁ × untilt T₂.
- `Perfectoid.FiniteEtale.untilt_test_quadratic`: For K = ℚ_p(p^{1/p^∞})^, K♭ = 𝔽_p((t^{1/p^∞}))^ with t♯ = p and p odd: untilt (K♭[u]/(u² − t)) ≅ K[u]/(u² − p).
- `Perfectoid.FiniteEtale.untilt_test_tilt`: tilt (untilt T) ≅ T as R♭-algebras, and untilt T agrees with PerfectoidSpaces:P1's untilt of the perfectoid R♭-algebra T.

Source: [Sch12](#source-sch12) §5, Proposition 5.22 and the diagram following it, p. 28.

*Needs:* [P3.4](#p3-4).

<a id="p3-6"></a>

### 3.6 The untilting functor FÉt(R♭) → FÉt(R) is fully faithful, inverse to tilting on its image, with image the S having almost finite étale integral structure

Let R be a perfectoid Tate ring with tilt R♭ (any characteristic, no perfectoid base field). The untilting functor (−)♯: FÉt(R♭) → FÉt(R) of P3.5 is fully faithful and, on its essential image, inverse to tilting: for S = T♯, S is perfectoid and S♭ ≅ T..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [Sch12](#source-sch12) §5, Theorem 5.25, p. 29.

*Needs:* [P3.5](#p3-5).

<a id="p3-7"></a>

### 3.7 Finite extensions of perfectoid fields are perfectoid, and tilting is a degree-preserving equivalence of finite extensions

Let K be a perfectoid field (characteristic 0 or p) with tilt K♭. (i) Every finite extension L/K, with its natural topology (the unique extension of the absolute value, Mathlib `spectralNorm`), is a perfectoid field. (ii) The untilting functor (−)♯ of P3.5 is an equivalence FÉt(K♭) ≃ FÉt(K) with quasi-inverse L ↦ L♭; it restricts to an equivalence between finite field extensions of K♭ and of K, preserving degrees, automorphism groups and Galois extensions. (iii) K is algebraically closed if and only if K♭ is. (iv) For every finite extension L/K, L°a is almost finite étale over K°a (Tate, Gabber–Ramero §6.6 for deeply ramified fields), uniformly almost finite projective.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P3.7a If the tilt of a perfectoid field is algebraically closed, so is the field (Sch12 Proposition 3.8)
- P3.7b The completed cyclotomic extension of a finite extension of ℚ_p is perfectoid (Sch12 Section 3, Theorem 3.7(i))
- P3.7c The completed tensor product of plus rings need not be integrally closed (AWS  Lemma 2.8.7)

Source: [Sch12](#source-sch12) §3, Theorem 3.7 (i)–(ii), p. 17 (finite extensions with their natural topology and the degree comparison); Proposition 3.8, p. 17, for the algebraically closed comparison.

*Needs:* [P3.6](#p3-6).

**Fontaine–Wintenberger theorem.**

<a id="p3-8"></a>

### 3.8 Fontaine–Wintenberger: the absolute Galois groups of a perfectoid field and of its tilt are isomorphic

Let K be a perfectoid field with tilt K♭. Fix an algebraic closure K̄ of K with completion C, so that C♭ is an algebraically closed perfectoid field containing K♭ (P3.7 (iii)), and let K♭^sep be the separable closure of K♭ in C♭. Then L ↦ L♭ (for finite Galois L/K inside K̄, with L♭ ⊆ C♭ by functoriality of tilting) defines an isomorphism of profinite groups Gal(K̄/K) ≅ Gal(K♭^sep/K♭) (Mathlib `Field.absoluteGaloisGroup` up to the choice of closures), compatible with the Galois correspondences (Mathlib `InfiniteGalois.IntermediateFieldEquivClosedSubgroup`): finite subextensions of K̄/K correspond to finite subextensions of K♭^sep/K♭ with the same degrees.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P3.8a In characteristic p, finite étale algebras are insensitive to completed perfection (Sch12 Lemma 7.5 (ii))

Source: [Sch12](#source-sch12) §1, Theorem 1.1, p. 2.

*Needs:* [P3.7](#p3-7), [P3.2](#p3-2), [P1.15](#p1-15).

<a id="p3-9"></a>

### 3.9 Tilting is an equivalence between finite étale algebras over a perfectoid Tate ring and over its tilt (ECD 6.1(ii))

Let R be a perfectoid Tate ring (ECD Definition 3.1, P1.1: any characteristic, no perfectoid base field) with tilt R♭. Then the untilting functor (−)♯: FÉt(R♭) → FÉt(R) (P3.5) is an equivalence of categories, with quasi-inverse the tilting functor S ↦ S♭ (S being perfectoid)..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P3.9a Finite étale algebras over the completed residue field spread out to a rational neighbourhood (Berkeley Lecture 7, §7.4, Lemma 7.4.6 and the argument after Theorem 7.4.8)

Source: [ECD](#source-ecd) §6, Theorem 6.1 (ii), p. 26.

*Needs:* [P3.6](#p3-6).

<a id="p3-10"></a>

### 3.10 Finite étale algebras over a perfectoid Tate ring are perfectoid (ECD 6.1(i))

Let R be a perfectoid Tate ring (any characteristic, no perfectoid base field) and S a finite étale R-algebra (Mathlib `Module.Finite R S`, `Algebra.Etale R S`) with its natural topology as a finite R-module. Then S is a perfectoid Tate ring;.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [ECD](#source-ecd) §6, Theorem 6.1 (i), p. 26.

*Needs:* [P3.9](#p3-9).

<a id="p3-11"></a>

### 3.11 Almost purity, categorical form: (R°a)_afet ≃ FÉt(R) by inverting ϖ, compatibly with tilting

Let R be a perfectoid Tate ring with tilt R♭, ϖ = (ϖ♭)♯ a pseudouniformiser with ϖ^p | p, and R⁺ ⊆ R° any ring of integral elements. Then: (a) the functor (R°a)_afet → FÉt(R), A ↦ A_*[ϖ⁻¹] (natural topology), is an equivalence of categories with quasi-inverse S ↦ S°a = S⁺a, compatible with tensor products and base change along maps of perfectoid Tate rings; (b) the six categories FÉt(R) ≃ (R°a)_afet ≃ (R°a/ϖ)_afet = (R♭°a/ϖ♭)_afet ≃ (R♭°a)_afet ≃ FÉt(R♭) of Scholze's diagram are equivalent by the functors of P3.5, and the composite is the tilting equivalence of P3.9; (c) (R⁺a)_afet = (R°a)_afet, since R⁺a = R°a (P1.9;.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [Sch12](#source-sch12) §7, Theorem 7.9 (i), p. 42.

*Needs:* [P3.9](#p3-9).

<a id="p3-12"></a>

### 3.12 The integral closure is almost finite étale: S° over R° for S finite étale over a perfectoid Tate ring R (ECD 6.1(iii))

Let R be a perfectoid Tate ring (any characteristic, no perfectoid base field), R⁺ ⊆ R° a ring of integral elements, ϖ a pseudouniformiser, S ∈ FÉt(R) and S⁺ the integral closure of R⁺ in S. Then: (i) S° is the integral closure of R° in S, S°°⊆ S⁺ ⊆ S°, and S°a = S⁺a is an almost finite étale R°a = R⁺a-algebra: almost finitely presented, almost projective, and unramified (the diagonal idempotent of S ⊗_R S is an almost element of S° ⊗_{R°} S°); (ii) S°a is uniformly almost finite projective: there is n ≥ 0 such that for every ε ∈ R°° there are R°-linear maps S° → (R°)ⁿ → S° composing to multiplication by ε; (iii) Tr_{S/R}(S°) ⊆ R° and the trace pairing induces an almost isomorphism S°a → alHom_{R°a}(S°a, R°a); (iv) if S is faithfully flat over R, S°a is almost faithfully flat over R°a, Tr_{S/R}(S°°) ⊇ R°° (up to almost zero), and R°a → S°a is almost split..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [ECD](#source-ecd) §6, Theorem 6.1 (iii), p. 26.

*Needs:* [P3.11](#p3-11).

**Almost purity theorem.**

<a id="p3-13"></a>

### 3.13 The almost purity theorem for perfectoid Tate rings

Let R be a perfectoid Tate ring (ECD Definition 3.1; characteristic 0, p, or neither; no perfectoid base field) with tilt R♭, and FÉt(R) the category of finite étale R-algebras with their natural topologies. (i) For every S ∈ FÉt(R), S is perfectoid (P3.10). (ii) Tilting S ↦ S♭ is an equivalence FÉt(R) ≃ FÉt(R♭), with quasi-inverse the untilting functor (P3.9). (iii) For every S ∈ FÉt(R), S° is almost finite étale over R° (equivalently S⁺a over R⁺a for any ring of integral elements and S⁺ its integral closure), and uniformly almost finite projective (P3.12); categorically, A ↦ A_*[ϖ⁻¹] is an equivalence (R°a)_afet ≃ FÉt(R) (P3.11). The three conclusions are distinct statements: (iii) is about the integral structure up to almost zero and is neither étaleness of S° over R° nor finite freeness of S over R. Consequences recorded elsewhere: every finite étale (resp. étale) morphism of perfectoid spaces is strongly finite étale (resp. strongly étale) (P3.17c); for R = K a perfectoid field, (i)–(iii) are P3.7.

Source: [ECD](#source-ecd) §6, Theorem 6.1, p. 26.

*Needs:* [P3.10](#p3-10), [P3.9](#p3-9), [P3.12](#p3-12).

<a id="p3-14"></a>

### 3.14 Finite étale morphisms of perfectoid spaces (ECD Definition 6.2(i))

Let X, Y be perfectoid spaces (P2.10: the full subcategory of AdicSpaces' adic spaces locally of the form Spa(R, R⁺), R perfectoid). A morphism f: Y → X is finite étale (`PerfectoidSpace.IsFiniteEtale f`) if it is finite étale as a morphism of analytic adic spaces (AdicEtaleGeometry T015: X has a cover by open affinoids V = Spa(A, A⁺) with f⁻¹(V) ≅ Spa(B, B⁺) over V, B ∈ FÉt(A) with its natural topology and B⁺ the integral closure of.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `PerfectoidSpace.IsFiniteEtale`, `PerfectoidSpace.IsFiniteEtale.iff_adic`, `PerfectoidSpace.IsFiniteEtale.iff_forall_affinoidPerfectoid`.

**Checks.**

- `PerfectoidSpace.IsFiniteEtale.test_fold`: For every perfectoid space X, X ⊔ X → X and ∅ → X are finite étale, and the identity is finite étale of degree 1.
- `PerfectoidSpace.IsFiniteEtale.test_kummer`: Over X = Spa(ℚ_p^cycl⟨T^{±1/p^∞}⟩, ℤ_p^cycl⟨T^{±1/p^∞}⟩), Spa(R[u]/(u^ℓ − T)) → X (ℓ ≠ p prime) is finite étale of degree ℓ, and its source is perfectoid.
- `PerfectoidSpace.IsFiniteEtale.test_rational`: The inclusion of the rational subset {|T| ≤ |p|} into the perfectoid closed disc is étale but not finite étale.

Source: [ECD](#source-ecd) §6, Definition 6.2 (i), p. 26.

*Needs:* AdicEtaleGeometry T015.

**Étale morphisms of perfectoid spaces.**

<a id="p3-15"></a>

### 3.15 Étale morphisms of perfectoid spaces (ECD Definition 6.2(ii))

A morphism f: Y → X of perfectoid spaces is étale (`PerfectoidSpace.IsEtale f`) if it is étale in A1's local sense (AdicEtaleGeometry T017, `AdicSpace.IsEtaleLocalDescription`): every y ∈ Y has an open neighbourhood V ⊆ Y such that f|_V factors as V ↪ W → U ↪ X with V → W an open immersion, W → U finite étale (P3.14) and U ⊆ X open. W is then automatically perfectoid. This is ECD Definition 6.2(ii) (whose printed condition 'y ∈ Y' is read as y ∈ V), Scholze 2012 Definition 7.1(iii) and Berkeley Definition 7.5.1(2). Equivalent local form: U may be taken a rational subset of an affinoid perfectoid open of X, W = Spa(S, S⁺) with S ∈ FÉt(O(U)), and V a rational subset of W;

Assume throughout this subsection: X, Y perfectoid; an adic space étale over a perfectoid X is perfectoid.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `PerfectoidSpace.IsEtale`, `PerfectoidSpace.IsEtale.iff_adic`, `PerfectoidSpace.IsEtale.of_isOpenImmersion`.

**Checks.**

- `PerfectoidSpace.IsEtale.test_openImmersion`: Open immersions of perfectoid spaces are étale; the identity is étale.
- `PerfectoidSpace.IsEtale.test_rational_in_cover`: For R perfectoid, S ∈ FÉt(R) and a rational subset V ⊆ Spa(S, S⁺), the composite V → Spa(R, R⁺) is étale (standard affinoid étale map).
- `PerfectoidSpace.IsEtale.test_not_finite`: The inclusion of the open unit disc (a non-quasi-compact open) into the closed perfectoid disc is étale but not finite étale.

Source: [ECD](#source-ecd) §6, Definition 6.2 (ii), p. 26.

*Needs:* AdicEtaleGeometry T017, [P3.14](#p3-14), [P2.10](#p2-10).

<a id="p3-16"></a>

### 3.16 Strongly finite étale and strongly étale morphisms of perfectoid spaces; tilting invariance and base change

(Scholze 2012 Definition 7.2, over an arbitrary perfectoid base) A morphism (R, R⁺) → (S, S⁺) of perfectoid Huber pairs is strongly finite étale if it is finite étale (S ∈ FÉt(R) with its natural topology, S⁺ the integral closure of R⁺) and S°a is almost finite étale over R°a (P0.14). A morphism f: Y → X of perfectoid spaces is strongly finite étale (`PerfectoidSpace.IsStronglyFiniteEtale f`) if X has a cover by open affinoid perfectoid V with f⁻¹(V) affinoid perfectoid and (O_X(V), O⁺_X(V)) → (O_Y(f⁻¹V), O⁺_Y(f⁻¹V)) strongly finite étale; strongly étale (`PerfectoidSpace.IsStronglyEtale f`) if locally on Y it factors as an open immersion, a strongly finite étale map and an open immersion..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `PerfectoidSpace.IsStronglyFiniteEtale`, `PerfectoidSpace.IsStronglyEtale`, `Perfectoid.Pair.IsStronglyFiniteEtale`.

**Checks.**

- `PerfectoidSpace.IsStronglyFiniteEtale.test_charp`: For X of characteristic p, IsStronglyFiniteEtale f ↔ IsFiniteEtale f (P3/finite-etale-covers-in-characteristic-p).
- `PerfectoidSpace.IsStronglyEtale.test_open`: Open immersions are strongly étale. For the inclusion U ↪ X, strongly finite étale means that U is open and closed in X; a proper rational open in a connected disc fails this check.
- `PerfectoidSpace.IsStronglyFiniteEtale.test_tilt`: IsStronglyFiniteEtale f ↔ IsStronglyFiniteEtale f♭.

Source: [Sch12](#source-sch12) §7, Definition 7.2 (i), p. 39.

*Needs:* [P0.14](#p0-14).

<a id="p3-17"></a>

### 3.17 Comparison of perfectoid finite étale and étale morphisms with AdicEtaleGeometry A1 and with finite étale algebras

Let X be a perfectoid space. (a) (Perfectoidness) If g: Y → X is a finite étale (resp. étale) morphism of analytic adic spaces in A1's sense (AdicEtaleGeometry T015, AdicEtaleGeometry T017), then Y is a perfectoid space. (b) (Morphism classes) For morphisms of perfectoid spaces the following are equivalent: finite étale in A1's sense (= P3.14);.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P3.17a Perfectoid Tate rings are strongly sheafy; perfectoid spaces are locally strongly sheafy (Berkeley Lecture 6, §6.3, Proposition 6.3.3 (3))
- P3.17b Preimages of affinoid perfectoid opens under finite étale maps are affinoid perfectoid, with strongly finite étale ring map (Sch12 Proposition 7.6)
- P3.17c Every finite étale (resp. étale) morphism of perfectoid spaces is strongly finite étale (resp. strongly étale) (Sch12 after Theorem 7.9)

Source: [ECD](#source-ecd) §6, paragraph after Definition 6.2, p. 26.

*Needs:* [P3.10](#p3-10).

**Étale site of a perfectoid space.**

<a id="p3-18"></a>

### 3.18 The étale site X_ét and the finite étale site X_fét of a perfectoid space

Let X be a perfectoid space. Its étale site X_ét (`PerfectoidSpace.smallEtale X`) is the small étale site of the underlying locally strongly sheafy analytic adic space (AdicEtaleGeometry T024; P3.17a): objects the adic spaces étale over X — all perfectoid (P3.17 (a)), i.e. the perfectoid spaces étale over X of ECD — with all X-morphisms (étale by P3.18a (3)), and the topology generated by jointly surjective families (on all points, including higher-rank ones).

Provide the interfaces `PerfectoidSpace.smallEtale`, `PerfectoidSpace.smallEtaleTopology`, `PerfectoidSpace.smallEtale.isPerfectoid`.

**Checks.**

- `PerfectoidSpace.smallEtale.test_point`: For K a perfectoid field, Spa(K, O_K)_fét ≃ finite continuous Gal(K^sep/K)-sets (via AdicEtaleGeometry T029 and P3.8).
- `PerfectoidSpace.smallEtale.test_empty`: For X = ∅ the site has a single object (∅) covered by the empty family; for X = Spa(C, C⁺) with C algebraically closed, every finite étale object is a finite disjoint union of copies of X, so X_fét ≃ FintypeCat.
- `PerfectoidSpace.smallEtale.test_adic`: PerfectoidSpace.smallEtale X = AdicSpace.smallEtale X.toAdicSpace as sites (same objects up to the full embedding of perfectoid spaces, same coverings).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P3.18a Étale and finite étale morphisms of perfectoid spaces: composition, base change, cancellation, openness, tilting (Berkeley Lecture 7, §7.5, Proposition 7.5.2 (1))

Source: [Sch12](#source-sch12) §7, Definition 7.11, p. 43.

*Needs:* [P3.17a](#p3-17), [P3.17](#p3-17), [P3.17b](#p3-17).

<a id="p3-19"></a>

### 3.19 Étale descent for finite étale morphisms and finite projective modules on perfectoid spaces

Let X be a perfectoid space with étale site X_ét (P3.18). (a) (Locality) A morphism f: Y → X of perfectoid spaces is finite étale if, for some covering {X_i → X} in X_ét, every base change Y ×_X X_i → X_i is finite étale; étaleness of f is local on Y and on X for open coverings. (b) (Stack) The prestack U ↦ U_fét (finite étale perfectoid spaces over U, with isomorphisms) on X_ét is a stack for the étale topology (Mathlib `CategoryTheory.Pseudofunctor.IsStack`): finite étale spaces with descent data along an étale covering descend uniquely. (c) (Vector bundles;.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [KL15](#source-kl15) §1.3, Theorems 1.3.4–1.3.5, p. 16, supply algebraic faithfully flat descent and descent of finiteness properties. **Gap.** These statements alone do not supply effective descent on the analytic étale site or the omitted vector-bundle clause; the analytic comparison and its exact supplier remain to be established.

*Needs:* [P3.18](#p3-18).

<a id="p3-20"></a>

### 3.20 Tilting identifies the étale sites: X_ét ≃ X♭_ét, compatibly with affinoids, fibre products, coverings and O⁺/ϖ

Let X be a perfectoid space with tilt X♭ (P2.11). The tilting functor Y ↦ Y♭ of the slice equivalence (P2.12: perfectoid spaces over X ≃ perfectoid spaces over X♭) restricts to equivalences of categories X_ét ≃ X♭_ét and X_fét ≃ X♭_fét (P3.18)..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [ECD](#source-ecd) §6, Theorem 6.3, p. 26.

*Needs:* [P3.18](#p3-18).

<a id="p3-21"></a>

### 3.21 Almost acyclicity of O⁺ and acyclicity of O on the étale site of an affinoid perfectoid space

Let X = Spa(R, R⁺) be an affinoid perfectoid space (R perfectoid Tate, no base field) with étale site X_ét, and write H^i(X_ét, −) for sheaf cohomology of abelian sheaves on X_ét (Mathlib `CategoryTheory.Sheaf.H`). Then: (a) H⁰(X_ét, O⁺) = R⁺ and H^i(X_ét, O⁺) is almost zero (killed by R°°) for i > 0; (b) H⁰(X_ét, O) = R and H^i(X_ét, O) = 0 for i > 0; (c) for every finite covering {U_j → U} in X_ét of an affinoid perfectoid object U by affinoid perfectoid objects, the augmented Čech complex of O⁺ is almost exact and that of O is exact; (d) H⁰(X_ét, O⁺/ϖ)^a = (R⁺/ϖ)^a and H^i(X_ét, O⁺/ϖ) is almost zero for i > 0; (e) for every finitely generated projective R-module M, H^i(X_ét, M ⊗_R O) = 0 for i > 0..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [ECD](#source-ecd) §6, Theorem 6.3, second paragraph, p. 26 (O⁺); [Sch12](#source-sch12) Proposition 7.13, p. 43 (O^{°a} and hence O on X_ét, over a perfectoid field).

*Needs:* [P3.18](#p3-18).

<a id="p3-22"></a>

### 3.22 ECD Theorem 6.3: the tilting equivalence of étale sites and the almost acyclicity of O⁺ on X_ét

(ECD Theorem 6.3, over an arbitrary perfectoid base.) Let X be a perfectoid space with tilt X♭. (i) Tilting induces an equivalence of sites X_ét ≃ X♭_ét (and X_fét ≃ X♭_fét), functorial in X, preserving affinoid perfectoid objects, fibre products and coverings, identifying O⁺/ϖ with O⁺_{X♭}/ϖ♭, and inducing an equivalence of étale topoi (P3.20). (ii) If X = Spa(R, R⁺) is affinoid perfectoid, then H⁰(X_ét, O⁺) = R⁺ and the R⁺-modules H^i(X_ét, O⁺) are almost zero for i > 0; moreover H⁰(X_ét, O) = R and H^i(X_ét, O) = 0 for i > 0, and the sheaf U ↦ O_U(U) on X_ét is a sheaf (P3.21)..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [ECD](#source-ecd) §6, Theorem 6.3, p. 26.

*Needs:* [P3.20](#p3-20).

### Examples

The identity and the empty finite étale cover have degrees one and zero. Prime-to-p Kummer covers test the finite étale condition, whereas a proper rational open tests étale maps beyond finite ones.

### Dependencies

Layers 0–2; algebraic finite étale and descent APIs from Mathlib and the analytic étale suppliers from AdicEtaleGeometry.

<a id="p4"></a>

## Layer 4: Injections, immersions and separatedness

Points with values in affinoid perfectoid fields, injections and the qcqs isomorphism criterion, immersions, Zariski closed immersions and the universal perfectoid space over a Zariski closed subset, the theorem that Zariski closed immersions are strongly Zariski closed, diagonals, separatedness and its valuative criterion, and the behaviour of all of these under tilting.

<a id="p4-1"></a>

### 4.1 Affinoid perfectoid fields and (K, K⁺)-valued points of perfectoid spaces

An affinoid perfectoid field is a pair (K, K⁺) of a perfectoid field K (a perfectoid Tate ring that is a nonarchimedean field, ECD Definition 3.6; P1.10) and an open and bounded valuation subring K⁺ ⊂ K;

Provide the interfaces `PerfectoidSpace.AffinoidField`, `PerfectoidSpace.AffinoidField.toPair`, `PerfectoidSpace.AffinoidField.ofRankOne`.

**Checks.**

- `AffinoidField.subsingleton_spa_ofRankOne`: For every perfectoid field K, |Spa(K, K°)| has exactly one point.
- `AffinoidField.card_spa_eq_two`: If K⁺ ⊊ K° is the preimage of a rank-one valuation ring k⁺ ⊊ k of the residue field k = K°/K°°, then |Spa(K, K⁺)| has exactly two points and only K⁺ is closed.
- `AffinoidField.fieldPoints_affinoidEquiv_closedPoint`: For X = Spa(R, R⁺) affinoid perfectoid and φ ∈ X(K, K⁺) = Huber.Pair.Hom (R, R⁺) (K, K⁺), the closed-point image of φ is Tau Ceti `Huber.Pair.Hom.spaComap φ` applied to the closed point of Spa(K, K⁺).

Source: [ECD](#source-ecd) §5, Proposition 5.3 (ii), p. 21.

*Needs:* [P1.10](#p1-10).

<a id="p4-2"></a>

### 4.2 Quasicompact and quasiseparated morphisms of perfectoid spaces

A perfectoid space X is quasicompact (resp. quasiseparated) if |X| is quasicompact (resp. a Mathlib `QuasiSeparatedSpace`). A morphism f : Y → X of perfectoid spaces is quasicompact if f⁻¹(U) is quasicompact for every quasicompact open U ⊆ |X|, equivalently for every.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `PerfectoidSpace.QuasiCompact`, `PerfectoidSpace.QuasiSeparated`, `PerfectoidSpace.quasiCompact_iff_affinoid`.

**Checks.**

- `quasiCompact_affinoid`: Every morphism Spa(S, S⁺) → Spa(R, R⁺) of affinoid perfectoid spaces is quasicompact and quasiseparated.
- `not_quasiCompact_openDisc`: The open immersion of the open unit disc ⋃_n {|T|^n ≤ |ϖ|} into Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩) is not quasicompact (the preimage of the whole disc is not quasicompact).
- `quasiSeparated_id`: The identity of any perfectoid space is qcqs.

Source: [ECD](#source-ecd) §5, remark after Proposition 5.11, p. 25.

*Needs:* `mathlib:CompactSpace`.

**Injection of perfectoid spaces.**

<a id="p4-3"></a>

### 4.3 Injections of perfectoid spaces

A morphism f : Y → X of perfectoid spaces is an injection if for every perfectoid space Z the map f_* : Hom(Z, Y) → Hom(Z, X) is injective (ECD Definition 5.1). It suffices to test affinoid perfectoid Z, because two morphisms Z → Y that agree on an open affinoid cover of Z agree. In the category Perfd of perfectoid spaces this says exactly that f is a monomorphism (Mathlib `CategoryTheory.Mono`), and, fibre products existing in Perfd (P2.16), it is equivalent to the diagonal Δ_f : Y → Y ×_X Y being an isomorphism (Mathlib `CategoryTheory.Limits.pullback.isIso_diagonal_iff`).

Assume throughout this subsection: Perfectoid spaces are those of P2.10 (ECD Definition 3.19): adic.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `PerfectoidSpace.IsInjection`, `PerfectoidSpace.isInjection_iff_mono`, `PerfectoidSpace.IsInjection.of_affinoid`.

**Checks.**

- `isInjection_rationalOpen`: For X = Spa(R, R⁺) affinoid perfectoid and U ⊆ X rational, the open immersion U → X is an injection.
- `isInjection_diagonal`: For every morphism f : Y → X of perfectoid spaces, Δ_f : Y → Y ×_X Y is an injection.
- `not_isInjection_quadraticExtension`: For a perfectoid field K and a separable quadratic extension L/K with its natural valuation topology (L is perfectoid by P3.7), Spa(L, O_L) → Spa(K, O_K) is bijective on underlying spaces but not an injection: the two K-embeddings of L into a completed algebraic closure C give distinct (C, O_C)-points with the same image.

The continuous embeddings used in the quadratic-extension check require a continuous structure map K → L; a bare algebra structure on two independently normed fields does not provide this hypothesis.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P4.3a Integral perfectoid criterion: integral perfectoid rings give perfectoid Tate rings (compatible-root annuli) (BMS Lemma 3.21)

Source: [ECD](#source-ecd) §5, Definition 5.1 and following sentence, p. 21.

*Needs:* `mathlib:CategoryTheory.Mono`, `mathlib:CategoryTheory.IsSplitMono`, `mathlib:CategoryTheory.Limits.pullback.diagonal`.

<a id="p4-4"></a>

### 4.4 The perfectoid space attached to a filtered intersection of rational subsets

Let X = Spa(R, R⁺) be an affinoid perfectoid space, ϖ ∈ R⁺ a pseudouniformizer with ϖ^p | p admitting compatible p-power roots (P1.3), and 𝒰 a nonempty family of rational subsets of X that is filtered (for U, V ∈ 𝒰 some W ∈ 𝒰 lies in U ∩ V); put T := ⋂_{U∈𝒰} U ⊆ |X|. Let S⁺_𝒰 be the ϖ-adic completion of colim_{U∈𝒰} O⁺_X(U) and S_𝒰 := S⁺_𝒰[1/ϖ], topologized by the ϖ-adic topology on S⁺_𝒰, and let ι_𝒰 : Z_𝒰 := Spa(S_𝒰, S⁺_𝒰) → X be induced by the compatible maps O_X(U) → S_𝒰. Then: (a) S_𝒰 is a perfectoid Tate ring, S⁺_𝒰 is a ring of integral elements, S⁺_𝒰 ⊆ S_𝒰° with almost zero cokernel, S⁺_𝒰/ϖⁿ = colim_U O⁺_X(U)/ϖⁿ, and the union of the images of O_X(U) → S_𝒰 is dense;

Provide the interfaces `PerfectoidSpace.proRationalSubspace`, `PerfectoidSpace.proRationalSubspace.ι`, `PerfectoidSpace.proRationalSubspace.plus_mod_pow`.

**Checks.**

- `proRationalSubspace_singleton`: For 𝒰 = {U}, ι_𝒰 is isomorphic over X to U → X.
- `proRationalSubspace_rationalNhds`: For 𝒰 the rational neighbourhoods of x ∈ X, Z_𝒰 ≅ Spa(K(x), K(x)⁺) over X, compatibly with PerfectoidSpaces:P4/residue-field-point-injection.
- `proRationalSubspace_annulusClosure`: For X = Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩) and 𝒰 = {{|ϖ^{1/pⁿ}| ≤ |T|} : n ≥ 0}: S_𝒰 = C⟨T^{±1/p^∞}⟩ and S⁺_𝒰 is the ϖ-adic completion of O_C[T^{1/p^∞}] + 𝔪_C[T^{−1/p^∞}]; T is the annulus {|T| = 1} together with the rank-two point y with |T(y)| = 1⁻.

**Checks.** Let R = C⟨T^{1/p^∞}⟩ and take the filtered family consisting of X and the rational annulus |ϖ| ≤ |T| ≤ 1. Its colimit is the annulus algebra. The image of R is not dense there: the continuous coefficient functional at exponent −1 vanishes on R and takes value 1 on T^(-1). Thus density holds for the union of the finite-stage images, not for every stage separately.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P4.4a Morphisms of perfectoid spaces are generalizing and spectral (ECD sentence before Lemma 2.5)
- P4.4b Almost integral perfectoid criterion: a ϖ-complete ring with almost bijective Frobenius gives a perfectoid Tate ring (Sch12 Lemma 5.6)

Source: [ECD](#source-ecd) §7, remark after Lemma 7.6, p. 31.

*Needs:* [P4.3](#p4-3).

<a id="p4-5"></a>

### 4.5 The completed residue field point i_x : Spa(K(x), K(x)⁺) → X

For a perfectoid space X and a point x ∈ X, the completed residue field K(x) with its open and bounded valuation subring K(x)⁺ is an affinoid perfectoid field (P2.5), and there is a canonical morphism i_x : Spa(K(x), K(x)⁺) → X sending the closed point to x: on an affinoid perfectoid neighbourhood U = Spa(R, R⁺) of x it is given by (R, R⁺) → (K(x), K(x)⁺), independently of U. Moreover (ECD Example 5.2): (a) i_x is isomorphic over U to the pro-rational.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `PerfectoidSpace.residueFieldPoint`, `PerfectoidSpace.residueFieldPoint_closedPoint`, `PerfectoidSpace.residueFieldPoint_isInjection`.

**Checks.**

- `residueFieldPoint_closedPoint`: For X = Spa(K, K⁺) and x the closed point, i_x is the identity of X.
- `residueFieldPoint_gauss`: For the Gauss point η of Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩), K(η) is the completion of C(T^{1/p^∞}) for the Gauss norm and K(η)⁺ = K(η)°; |i_η| has image {η}.
- `residueFieldPoint_not_isOpenImmersion`: i_η is an injection whose image {η} is not open (and not locally closed), so i_η is not an immersion.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P4.5a Completed tensor products over a nonarchimedean field preserve kernels and strictness (KL15 Lemma 2.2.9)
- P4.5b The stalk of O⁺/ϖ at x is K(x)⁺/ϖ (Torsion Lemma II.3.1)

Source: [ECD](#source-ecd) §5, Example 5.2, p. 21.

*Needs:* [P4.4](#p4-4).

<a id="p4-6"></a>

### 4.6 Isomorphism criterion for qcqs maps: bijectivity on points and on (C, C⁺)-points

Let f : Y → X be a quasicompact and quasiseparated morphism of perfectoid spaces (P4.2). The following are equivalent: (i) f is an isomorphism;

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P4.6a A qcqs perfectoid space with a unique closed point is Spa(K(x), K(x)⁺) (ECD Example 5.2, last paragraph)
- P4.6b Points of fibre products of perfectoid spaces surject onto compatible pairs (ECD  Proposition 5.3)
- P4.6c Every affinoid perfectoid field embeds into an algebraically closed one, and (K, K⁺)-points are detected there (ECD  Lemma 5.4)
- P4.6d A map of perfectoid fields that is injective on geometric points is an isomorphism (ECD  Proposition 5.3)
- P4.6e A homeomorphism inducing isomorphisms of completed residue pairs is an isomorphism (ECD  Lemma 5.4)

Source: [ECD](#source-ecd) §5, Lemma 5.4, p. 23.

*Needs:* [P4.2](#p4-2).

<a id="p4-7"></a>

### 4.7 Characterisations of injections of perfectoid spaces

Let f : Y → X be a morphism of perfectoid spaces. The following are equivalent: (i) f is an injection (P4.3);

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P4.7a (K, K⁺)-points of a map that is injective on points with isomorphic rank-one residue fields (ECD  Proposition 5.3, (iii) ⇒ (iv))

Source: [ECD](#source-ecd) §5, Proposition 5.3 (iii), p. 21.

*Needs:* [P4.3](#p4-3).

<a id="p4-8"></a>

### 4.8 Base change of injections, and the underlying space of a pulled-back injection

Let f : Y → X be an injection of perfectoid spaces and X' → X any morphism, with base change f' : Y' = X' ×_X Y → X'. Then f' is an injection, and the natural map |Y'| → |X'| ×_{|X|} |Y| is a homeomorphism (the target with the fibre product topology)..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [ECD](#source-ecd) §5, Corollary 5.5 (i), p. 24.

*Needs:* [P4.3](#p4-3).

<a id="p4-9"></a>

### 4.9 Injections are exactly the universally injective maps

A morphism f : Y → X of perfectoid spaces is an injection if and only if it is universally injective: for every morphism X' → X the base change f' : X' ×_X Y → X' is injective on underlying spaces. (ECD Corollary 5.5 (ii).)

Source: [ECD](#source-ecd) §5, Corollary 5.5 (ii), p. 24.

*Needs:* [P4.8](#p4-8).

**Immersion of perfectoid spaces.**

<a id="p4-10"></a>

### 4.10 Immersions, open immersions and closed immersions of perfectoid spaces

A morphism f : Y → X of perfectoid spaces is an immersion if f is an injection (P4.3) and |f| : |Y| → |X| is a locally closed immersion, i.e. a topological embedding (Mathlib `Topology.IsEmbedding`) with locally closed image (Mathlib `IsLocallyClosed`). It is an open immersion (resp. closed immersion) if moreover |f| is an open (resp.

Assume throughout this subsection: Topology of |Y| is its own spectral-space topology; the embedding condition says it is the subspace.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `PerfectoidSpace.IsImmersion`, `PerfectoidSpace.IsOpenImmersion`, `PerfectoidSpace.IsClosedImmersion`.

**Checks.**

- `isOpenImmersion_rationalSubset`: For X = Spa(R, R⁺) affinoid perfectoid and U ⊆ X rational, U → X is an open immersion.
- `isClosedImmersion_origin`: The point T^{1/pⁿ} = 0 (all n), i.e. Spa(C, O_C) → Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩), is a closed immersion.
- `isImmersion_empty`: The empty perfectoid space maps to every X by an open and closed immersion; the identity is both.

Source: [ECD](#source-ecd) §5, Definition 5.6, p. 24.

*Needs:* [P4.3](#p4-3), `mathlib:Topology.IsEmbedding`, `mathlib:IsLocallyClosed`.

<a id="p4-11"></a>

### 4.11 Open immersions of perfectoid spaces agree with the anchor's open immersions

For a morphism f : Y → X of perfectoid spaces the following are equivalent: (a) f is an open immersion in the sense of P4.10; (b) f is an open immersion of adic spaces in the sense of AdicSpaces (Layer 5.1): an isomorphism onto the open adic subspace X|_U, U = f(|Y|)..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [ECD](#source-ecd) §5, after Proposition 5.3, p. 21.

*Needs:* [P4.10](#p4-10).

**Zariski closed immersion.**

<a id="p4-12"></a>

### 4.12 Zariski closed subsets and Zariski closed immersions into affinoid perfectoid spaces

Let X = Spa(R, R⁺) be an affinoid perfectoid space. For an ideal I ⊆ R put V(I) := {x ∈ |X| : |g(x)| = 0 for all g ∈ I}; a subset Z ⊆ |X| is Zariski closed if Z = V(I) for some ideal I (Scholze torsion paper Definition II.2.1). A morphism f : Z → X of perfectoid spaces is a Zariski closed immersion (defined by I) if f is a closed immersion (P4.10) and f(|Z|) = V(I) (ECD Definition 5.7 (i)). Conventions: V(I) depends only on the closure of I and on its radical;

Provide the interfaces `PerfectoidSpace.zeroLocus`, `PerfectoidSpace.zeroLocus_eq_iInter_rational`, `PerfectoidSpace.isClosed_zeroLocus`.

**Checks.**

- `zeroLocus_T`: For R = C⟨T^{1/p^∞}⟩, V((T)) = {origin}, and the Zariski closed immersion is Spa(C, O_C) → X; its kernel is the closure of the ideal generated by all T^{1/pⁿ}, not (T).
- `zeroLocus_T_sub_one`: For C ∋ μ_{p^∞}, V((T − 1)) ⊆ Spa(C⟨T^{±1/p^∞}⟩) is homeomorphic to ℤ_p (compatible systems of p-power roots of unity).
- `zeroLocus_bot_top`: V(0) = |X| and V(R) = ∅.

Source: [Torsion](#source-torsion) §II.2, Definition II.2.1, p. 13.

*Needs:* [P4.10](#p4-10), `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCeti.Huber.Pair.Hom.range_spaComap_quotientHom`.

<a id="p4-13"></a>

### 4.13 Strongly Zariski closed immersions: surjective perfectoid quotients

Let X = Spa(R, R⁺) be an affinoid perfectoid space. A morphism f : Z → X is strongly Zariski closed if Z = Spa(S, S⁺) is affinoid perfectoid, f is induced by a morphism (R, R⁺) → (S, S⁺) with R → S surjective, and S⁺ is the integral closure of the image of R⁺ in S (ECD Definition 5.7 (ii)). Equivalently (by the open mapping theorem, Tau Ceti `Huber.IsTateRing.isQuotientMap`), with I := ker(R → S) closed, (S, S⁺) is isomorphic to AdicSpaces' quotient pair Tau Ceti `Huber.Pair.quotient (R, R⁺) I` and R/I is perfectoid. The plus-ring clause is part of the definition: it is what makes a strongly Zariski closed map a closed immersion.

Provide the interfaces `PerfectoidSpace.IsStronglyZariskiClosed`, `PerfectoidSpace.IsStronglyZariskiClosed.surjective`, `PerfectoidSpace.IsStronglyZariskiClosed.plus_eq`.

**Checks.**

- `isStronglyZariskiClosed_origin`: C⟨T^{1/p^∞}⟩ → C, T^{1/pⁿ} ↦ 0, with plus rings O_C⟨T^{1/p^∞}⟩ → O_C, is strongly Zariski closed.
- `isStronglyZariskiClosed_id`: The identity of X and the map from the empty space Spa(0, 0) are strongly Zariski closed.
- `not_isStronglyZariskiClosed_ofPowerBounded`: For R⁺ ⊊ R°, Spa(R, R°) → Spa(R, R⁺) has R → R surjective and R⁺ → R° almost surjective (ECD Example 3.22(ii)), but R° is not the integral closure of R⁺, so it is not strongly Zariski closed (nor a closed immersion).

Source: [ECD](#source-ecd) §5, Definition 5.7 (ii), p. 24.

*Needs:* `tauceti:TauCeti.Huber.Pair`.

**Universal perfectoid Zariski closed subspace.**

<a id="p4-14"></a>

### 4.14 The universal perfectoid space over a Zariski closed subset

Let X = Spa(R, R⁺) be an affinoid perfectoid space and I ⊆ R an ideal. Let 𝒰_I := {U_F : F ⊆ I finite}, U_F = {x : |g(x)| ≤ 1 for g ∈ F}, and let ι_I : Z_I = Spa(S_I, S_I⁺) → X be the pro-rational subspace of 𝒰_I (P4.4): S_I⁺ is the ϖ-adic completion of colim_F O⁺_X(U_F) and S_I = S_I⁺[1/ϖ]. Then: (a) Z_I is affinoid perfectoid and R → S_I has dense image; (b) |ι_I| is a homeomorphism onto V(I); (c) a morphism g : W → X from a perfectoid space factors through ι_I if and only if g^*(h) = 0 in O_W(W) for all h ∈ I, if and only if |g| lands in V(I), and then uniquely; (d) ι_I is a Zariski closed immersion defined by I (P4.12); (e) I^perf := ker(R → S_I) is a closed ideal containing I, equal to {h ∈ R : |h| = 0 on V(I)}, and Z_{I^perf} = Z_I;

Provide the interfaces `PerfectoidSpace.zariskiClosedSubspace`, `PerfectoidSpace.zariskiClosedSubspace.ι`, `PerfectoidSpace.zariskiClosedSubspace.range_ι`.

**Checks.**

- `zariskiClosedSubspace_T`: R = C⟨T^{1/p^∞}⟩, I = (T): S_I = C, and ker(R → S_I) is the closure of (T^{1/pⁿ} : n ≥ 0) ⊋ (T); R/(T) is not reduced (Kedlaya AWS Example 2.4.9).
- `zariskiClosedSubspace_T_sub_one`: C = ℂ_p, R = C⟨T^{±1/p^∞}⟩, I = (T − 1): S_I = C⁰(ℤ_p, ℂ_p), with T^{1/pⁿ} ↦ (γ ↦ ζ_{pⁿ}^γ) (Kedlaya AWS Example 2.4.10).
- `zariskiClosedSubspace_bot`: Z_0 = X and Z_R = ∅.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P4.14a Every Zariski closed immersion is the universal one (Torsion after Remark II.2.3)

Source: [Torsion](#source-torsion) §II.2, Lemma II.2.2, p. 13.

*Needs:* [P4.4](#p4-4), [P4.12](#p4-12), [P4.10](#p4-10).

<a id="p4-15"></a>

### 4.15 Zariski closed immersions are strongly Zariski closed

Let X = Spa(R, R⁺) be an affinoid perfectoid space and I ⊆ R an ideal. The universal perfectoid space Z over the Zariski closed subset V(I) (P4.14) is affinoid perfectoid, Z = Spa(S, S⁺), with R → S surjective, S⁺ the integral closure of the image of R⁺, and R⁺ → S⁺ almost surjective; in particular |Z| → V(I) is a homeomorphism. Hence every Zariski closed immersion is strongly Zariski closed, and the two notions coincide. The proof constructs S from the universal perfectoid ring under the semiperfectoid ring R⁺/(I ∩ R⁺)^-: for a ring A that is a quotient of an integral perfectoid ring and p-adically complete, there is an initial integral perfectoid ring A_perfd under A, A → A_perfd is surjective, and its kernel is the set of elements killed by every map to an integral perfectoid ring. This perfectoidization construction, in the generality of semiperfectoid rings, is part of this target; the roadmap does not assume it from elsewhere.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P4.15a A surjection of perfectoid Tate rings is almost surjective on integral elements (AWS Lecture 2, Lemma 2.8.5)
- P4.15b Base change of Zariski closed and strongly Zariski closed immersions (Torsion Lemma II.2.9 (i))

Source: [ECD](#source-ecd) §5, Theorem 5.8 with proof, p. 25.

*Needs:* [P4.14](#p4-14), [P4.13](#p4-13), [P4.12](#p4-12).

<a id="p4-16"></a>

### 4.16 Comparison with the anchor's closed immersions

(a) For X = Spa(R, R⁺) affinoid perfectoid, a morphism f : Z → X of perfectoid spaces is strongly Zariski closed if and only if it is isomorphic over X to AdicSpaces' closed immersion Spa(Huber.Pair.quotient (R, R⁺) J) → Spa(R, R⁺) (AdicSpaces Layer 2.4 and Layer 5.1; Tau Ceti `Huber.Pair.quotient`) for a closed ideal J ⊆ R with R/J perfectoid; then J = ker(R → S). (b) For arbitrary X, a morphism of perfectoid spaces is a closed immersion in AdicSpaces' sense (affinoid-locally Spa(A/J) → Spa(A) with J closed and A/J sheafy) if and only if it is, locally on X, strongly Zariski closed; such a morphism is a closed immersion in the sense of ECD Definition 5.6 whose restrictions over open affinoids are Zariski closed. (c) AdicSpaces' closed immersion defined by a closed ideal J of a perfectoid R need not have perfectoid source: for R = C⟨T^{1/p^∞}⟩ and J = (T), R/J is not reduced, whereas the Zariski closed subspace V(T) is Spa(C, O_C). (d) That every Zariski closed immersion into an affinoid is of the form (a) is ECD Theorem 5.8 (P6.11).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P4.16a Immersions are stable under base change and composition; closed immersions are quasicompact (ECD Corollary 5.5 (i))
- P4.16b A surjective perfectoid quotient is a Zariski closed immersion (the direction proved here) (ECD after Definition 5.7)

Source: [AWS17](#source-aws17) Example 2.4.8, p. 51 (the version dated 10 March 2017), for the nonreduced quotient; [ECD](#source-ecd) Definitions 5.6–5.7 and Theorem 5.8, pp. 24–25, for the perfectoid closed-immersion comparison.

*Needs:* [P4.13](#p4-13).

<a id="p4-17"></a>

### 4.17 Closed immersions and Zariski closed immersions are different notions

(a) Every strongly Zariski closed map is Zariski closed, and every Zariski closed immersion is a closed immersion (P4.16b, P4.12). (b) The image of an immersion is stable under generalization, so a closed subset of |X| that is not (the closed point of Spa(K, K⁺) for K⁺ of rank two) is not the image of any immersion: the Zariski statements do not extend to arbitrary closed subsets. (c) A closed immersion need not be Zariski closed: for X = Spa(C⟨T^{1/p^∞}⟩, O_C⟨T^{1/p^∞}⟩) with C a perfectoid field and ϖ ∈ C a pseudouniformizer with compatible roots, the subset T := ⋂_n {|ϖ^{1/pⁿ}| ≤ |T|} (the closed annulus {|T| = 1} together with the rank-two point y with |T(y)| = 1⁻) is the complement of the open unit disc, hence closed, and ι : Z_𝒰 → X for 𝒰 = {{|ϖ^{1/pⁿ}| ≤ |T|}} (P4.4) is a closed immersion with image T; but T is not Zariski closed, since every g ∈ C⟨T^{1/p^∞}⟩ vanishing on T vanishes at the Gauss point, hence is 0 (the Gauss norm is the spectral norm), while T ≠ X. (d) Equivalently, a closed immersion Spa(S, S⁺) → Spa(R, R⁺) of affinoid perfectoid spaces does not force R → S to be surjective (Berkeley Lectures, remark after Definition 17.4.2).

Source: [Berkeley](#source-berkeley) Lecture 17, remark after Definition 17.4.2, p. 155.

*Needs:* [P4.4](#p4-4).

<a id="p4-18"></a>

### 4.18 The diagonal of a morphism of perfectoid spaces is an immersion

Let f : Y → X be any morphism of perfectoid spaces. Then Δ_f : Y → Y ×_X Y is an immersion (P4.10). More precisely: (a) Δ_f is a split monomorphism, hence an injection;

Source: [ECD](#source-ecd) §5, Proposition 5.9, p. 25.

*Needs:* [P4.3](#p4-3).

**Separated map of perfectoid spaces.**

<a id="p4-19"></a>

### 4.19 Separated morphisms of perfectoid spaces

A morphism f : Y → X of perfectoid spaces is separated if its diagonal Δ_f : Y → Y ×_X Y is a closed immersion (P4.10) (ECD Definition 5.10); it is quasiseparated if Δ_f is quasicompact (P4.2). In Mathlib's vocabulary, IsSeparated = MorphismProperty.diagonal IsClosedImmersion on Perfd, the pattern of `AlgebraicGeometry.IsSeparated`.

Assume throughout this subsection: Fibre products as in P2.

Provide the interfaces `PerfectoidSpace.IsSeparated`, `PerfectoidSpace.isSeparated_iff_isClosed_range_diagonal`, `PerfectoidSpace.IsSeparated.quasiSeparated`.

**Checks.**

- `isSeparated_affinoid`: Every morphism Spa(S, S⁺) → Spa(R, R⁺) of affinoid perfectoid spaces is separated.
- `isSeparated_of_isInjection`: Injections, in particular identities and open immersions, are separated: their diagonal is an isomorphism.
- `not_isSeparated_gluedDisc`: Glue two copies of the perfectoid closed disc over a perfectoid field C along the rational subset {|ϖ| ≤ |T|}; the result Y is quasiseparated over Spa(C, O_C) but not separated: for the rank-two point y of the disc with |T(y)| = |ϖ|⁻ (in the closure of the overlap, not in it), the point Δ_D(y) of the chart D₁ ×_C D₂ = D ×_C D lies in the closure of Δ_Y(|Y|) but not in Δ_Y(|Y|).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P4.19a Morphisms of affinoid perfectoid spaces are separated (ECD after Lemma 7.19)

Source: [ECD](#source-ecd) §5, Definition 5.10, p. 25.

*Needs:* [P4.10](#p4-10), [P4.2](#p4-2), `mathlib:CategoryTheory.Limits.pullback.diagonal`.

**Valuative criterion for separatedness.**

<a id="p4-20"></a>

### 4.20 Valuative criterion for separatedness of perfectoid spaces

Let f : Y → X be a morphism of perfectoid spaces. The following are equivalent: (i) f is separated; (ii) |Δ_f| : |Y| → |Y ×_X Y| is a closed immersion of topological spaces; (iii) f is quasiseparated and for every affinoid perfectoid field (K, K⁺) and every commutative square formed by a : Spa(K, O_K) → Y and b : Spa(K, K⁺) → X with f ∘ a = b ∘ j (j : Spa(K, O_K) → Spa(K, K⁺) the inclusion of the rank-one point) there is at most one c : Spa(K, K⁺) → Y with c ∘ j = a and f ∘ c = b. (ECD Proposition 5.11.)

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P4.20a Maps from Spa(R, R⁺) into a separated space are determined on Spa(R, R°) (ECD Proposition 10.10)

Source: [ECD](#source-ecd) §5, Proposition 5.11 (i)–(iii), p. 25.

*Needs:* [P4.19](#p4-19), [P4.18](#p4-18), [P4.16a](#p4-16).

<a id="p4-21"></a>

### 4.21 Tilting of injections, immersions, separatedness and strongly Zariski closed immersions

Let X be a perfectoid space with tilt X♭ and f : Y → X a morphism with tilt f♭ : Y♭ → X♭ (P2.11; |Y| = |Y♭|, |X| = |X♭|). (a) f is an injection, an immersion, an open or closed immersion, quasiseparated or separated if and only if f♭ is. (b) For X = Spa(R, R⁺) and Z = Spa(S, S⁺) affinoid: f : Z → X is strongly Zariski closed if and only if f♭ is (Scholze torsion paper Lemma II.2.7). (c) Formulas for a strongly Zariski closed f with I := ker(R → S): I♭ := ker(R♭ → S♭) is a closed perfect ideal and I is the closure of the ideal generated by ♯(I♭);.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P4.21a Surjectivity and closed ideals with perfectoid quotient under tilting (AWS Lecture 2, Theorem 2.4.4)
- P4.21b Criteria for strong Zariski closedness in terms of almost surjectivity on plus rings (Torsion Definition II.2.6)

Source: [Torsion](#source-torsion) §II.2, Lemma II.2.7, p. 15.

*Needs:* [P4.3](#p4-3).

### Examples

A quadratic extension gives a bijection of point sets without an injection of spaces. The origin of a perfected disc tests the distinction between the ideal (T) and the closed compatible-root ideal.

### Dependencies

Layers 1–3; affinoid field points, completed localizations, diagonal and quotient-pair suppliers; the perfectoidization contract in this layer.

<a id="p5"></a>

## Layer 5: Cofiltered limits and finite-stage étale descent

Completed colimits of perfectoid Tate pairs and cofiltered limits of affinoid perfectoid spaces, with the homeomorphism of underlying spaces, descent of quasicompact opens, ω₁-cofiltered limits without completion, countably generated decompositions and cardinal bounds, and finite-stage descent of qcqs étale objects along cofiltered limits.

**Completed direct limit.**

<a id="p5-1"></a>

### 5.1 The completed direct limit (R, R⁺) of a filtered system of perfectoid Tate pairs

Standing setting of this layer: p is a fixed prime; I is a small cofiltered category; X_i = Spa(R_i, R_i⁺), i ∈ I, is a cofiltered diagram of affinoid perfectoid spaces, given at ring level by a functor I^op → CAff (complete Huber pairs, AdicEtaleGeometry T071), i ↦ (R_i, R_i⁺), with each R_i a perfectoid Tate ring in the sense of ECD.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Assume throughout this subsection: The standing setting of this layer; a compatible pseudouniformiser (i₀, ϖ).

Provide the interfaces `Perfectoid.completedColimit`, `Perfectoid.completedColimitPlus`, `Perfectoid.completedColimit.instIsTateRing`.

**Checks.**

- `completedColimit_test_initial`: If I has an initial object i_* (so the diagram of rings has a terminal index), then ι_{i_*}: (R_{i_*}, R_{i_*}⁺) → (R, R⁺) is an isomorphism of Huber pairs.
- `completedColimit_test_profinite`: For S = lim_n {0,1}^n and R_n = K^{S_n}, R_n⁺ = O_K^{S_n} over a perfectoid field K: R⁺ = C^0(S, O_K) and R = C^0(S, K); the function s ↦ Σ_k s_k ϖ^k lies in R⁺ but in no ι_n(R_n⁺).
- `completedColimit_test_plusQuotient`: In the profinite example R⁺/ϖ^n = C^0(S, O_K/ϖ^n) equals the ring of locally constant functions S → O_K/ϖ^n = colim_n (O_K/ϖ^n)^{S_n}.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P5.1a A compatible pseudouniformiser with p-power roots on a tail of a cofiltered system of perfectoid Tate pairs (ECD Section 6, Proposition 6.4, statement)
- P5.1b The ϖ-adic completion of a ring integrally closed in its localisation away from a nonzerodivisor (Bhatt Section 5.1, Lemma 5.1.2, printed)

Source: [ECD](#source-ecd) Section 6, Proposition 6.4, statement, p. 27.

*Needs:* [P1.1](#p1-1), AdicEtaleGeometry T071, `mathlib:CommRingCat.FilteredColimits.colimitCoconeIsColimit`.

<a id="p5-2"></a>

### 5.2 The completed direct limit of perfectoid Tate pairs is a perfectoid Tate pair

In the situation of P5.1: (a) R⁺ is open and bounded in R and integrally closed in R, so R⁺ is a ring of integral elements and ϖR° ⊆ R⁺ ⊆ R°; (b) R is uniform; (c) ϖ^p divides p in R⁺, ϖ is a nonzerodivisor on R⁺, and Frobenius R⁺/ϖR⁺ → R⁺/ϖ^pR⁺, x ↦ x^p, is an isomorphism, so R⁺ is an integral perfectoid ring (BMS1 Definition 3.5); (d) R is the completed filtered colimit of P1.29 for the filtered system i ↦ R_i over (I/i₀)^op with the pseudouniformiser ϖ, hence a perfectoid Tate ring in the sense of ECD Definition 3.1 whose tilt R♭ is the completed direct limit of the R_i♭; so (R, R⁺) is a perfectoid Tate pair and the ι_i are morphisms of perfectoid Tate pairs; (e) if all R_i have characteristic p then R is a perfect complete Tate ring of characteristic p; if the system lives over a perfectoid Tate ring B (compatible maps B → R_i) then R is a perfectoid B-algebra..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [ECD](#source-ecd) Section 6, proof of Proposition 6.5, p. 29.

*Needs:* [P5.1](#p5-1).

**Cofiltered limits.**

<a id="p5-3"></a>

### 5.3 Cofiltered limits of affinoid perfectoid spaces

Standing setting of this layer: p is a fixed prime; I is a small cofiltered category; X_i = Spa(R_i, R_i⁺), i ∈ I, is a cofiltered diagram of affinoid perfectoid spaces, given at ring level by a functor I^op → CAff (complete Huber pairs, AdicEtaleGeometry T071), i ↦ (R_i, R_i⁺), with each R_i a perfectoid Tate ring in the sense of ECD Definition 3.1 (P1.1; characteristic 0, p or mixed, no perfectoid base field) and R_i⁺ ⊆ R_i° open and integrally closed; for a morphism a: j → i of I the transition map φ_a: R_i → R_j is continuous with φ_a(R_i⁺) ⊆ R_j⁺ (Tau Ceti `Huber.Pair.Hom`). Let (R, R⁺) be the completed direct limit for a compatible pseudouniformiser (P5.1), a perfectoid Tate pair (P5.2), and put X := Spa(R, R⁺), an affinoid perfectoid space (P2.9), with projections p_i: X → X_i induced by ι_i (i in the tail; for general i through any j → i, i₀). Then (X, (p_i)) is a limit of the diagram (X_i) in the category of perfectoid spaces: for every perfectoid space Y, Hom(Y, X) → lim_i Hom(Y, X_i) is bijective. In particular X is the limit in the full subcategory of affinoid perfectoid spaces, O_X(X) = R and O⁺_X(X) = R⁺, and X is independent of the choices up to unique isomorphism (P5.3a). Companion statements: |X| → lim |X_i| is a homeomorphism of spectral spaces (P5.4, ECD 6.4(o)); rational subsets and their rings are computed at finite stages (P5.4e); for ω₁-cofiltered I no completion is needed (P5.5); cardinal bounds (P5.7). The limit is claimed in perfectoid spaces only; for a non-uniform adic space Y a compatible family Y → X_i need not induce a map continuous for the ϖ-adic topology of colim R_i⁺.

Assume throughout this subsection: The standing setting; the X_i are affinoid perfectoid (the construction is not applied to.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `PerfectoidSpace.cofilteredLimit`, `PerfectoidSpace.cofilteredLimit.π`, `PerfectoidSpace.cofilteredLimit.isLimit`.

**Checks.**

- `cofilteredLimit_test_profinite`: For a perfectoid field K and S = lim_n {0,1}^n: cofilteredLimit (n ↦ {0,1}^n × Spa(K, O_K)) ≅ Spa(C^0(S, K), C^0(S, O_K)), with underlying space S × |Spa(K, O_K)|.
- `cofilteredLimit_test_initial`: If I has an initial object i_*, then p_{i_*}: cofilteredLimit X → X_{i_*} is an isomorphism.
- `cofilteredLimit_test_residueField`: For x ∈ X₀ affinoid perfectoid, the limit over the rational neighbourhoods of x is Spa(K(x), K(x)⁺), and the induced map to X₀ is the injection i_x of ECD Example 5.2 (P4.5); for a filtered family of rational subsets the limit is the pro-rational subspace of P4.4.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P5.3a The completed direct limit does not depend on the compatible pseudouniformiser or on the tail (ECD Section 6, Proposition 6.5, statement)
- P5.3b Uniformity of perfectoid spaces: global integral sections are ϖ-adically complete (ECD Section 6, Proposition 6.5)

Source: [ECD](#source-ecd) Section 6, Proposition 6.5, statement, p. 29.

*Needs:* [P5.1](#p5-1), [P5.2](#p5-2), [P2.9](#p2-9).

<a id="p5-4"></a>

### 5.4 The underlying space of a cofiltered limit of affinoid perfectoid spaces is the inverse limit (ECD Proposition 6.4 (o))

Let X = lim_i X_i be the limit of a cofiltered diagram of affinoid perfectoid spaces X_i = Spa(R_i, R_i⁺) (P5.3). Then the map |X| → lim_i |X_i| induced by the projections is a homeomorphism of spectral spaces: lim_i |X_i| (inverse limit in topological spaces) is spectral, the projections |X| → |X_i| and the transition maps are spectral, and the map is a homeomorphism..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P5.4a The adic spectrum of a completed direct limit of Tate pairs is the inverse limit of the adic spectra (Sch12 Section 6, Lemma 6.13 (ii))
- P5.4b Quasicompact opens, constructible sets and clopen sets in cofiltered limits of spectral spaces come from a finite stage (Stacks Tag 0A30 (Lemma 5.24.6))
- P5.4c Base changes of a qcqs perfectoid space along a cofiltered limit form a limit, with spectral underlying spaces (ECD Section 6, Proposition 6.4 (ii))
- P5.4d Quasicompact opens and rational subsets of a cofiltered limit descend to a finite stage (ECD Section 6, Proposition 6.4 (ii))
- P5.4e Restriction of a cofiltered limit to a rational subset of a finite stage (Sch12 Section 6, Lemma 6.13 (iii))

Source: [ECD](#source-ecd) Section 6, Proposition 6.4 (o), p. 27.

*Needs:* [P5.3](#p5-3).

<a id="p5-5"></a>

### 5.5 ω₁-cofiltered limits of affinoid perfectoid spaces need no completion

In the situation of P5.3 assume that I is ω₁-cofiltered: every functor J → I from a category J with countably many morphisms extends to a cone J^◁ → I (equivalently Mathlib `CategoryTheory.IsCardinalFiltered Iᵒᵖ ℵ₁`, ℵ₁ regular by `Cardinal.isRegular_aleph_one`). Then A = colim_i R_i⁺ is ϖ-adically separated and complete, so the canonical maps colim_i R_i⁺ → R⁺ and colim_i R_i → R are ring isomorphisms (bijective). Equivalently, for an ℵ₁-filtered diagram of perfectoid Tate pairs the uncompleted colimit (colim R_i, colim R_i⁺), with colim R_i⁺ carrying its ϖ-adic topology, is a perfectoid Tate pair and O(lim X_i) = colim O(X_i). For countable index categories such as I = ℕᵒᵖ both properties fail in general: colim R_i⁺ → R⁺ need be neither surjective nor injective.

Source: [ECD](#source-ecd) Section 6, Proposition 6.5, statement, p. 29.

*Needs:* [P5.1](#p5-1).

**ω₁-cofiltered limits.**

<a id="p5-6"></a>

### 5.6 Every affinoid perfectoid space is an ω₁-cofiltered limit of topologically countably generated affinoid perfectoid spaces

Let X = Spa(R, R⁺) be an affinoid perfectoid space and ϖ as in P5.6a. Let 𝒮(R) be the set of closed subrings R' ⊆ R containing ϖ^{±1} that are perfectoid Tate rings for the subspace topology and admit a countable dense subset, ordered by inclusion, and put R'⁺ := R' ∩ R⁺. Then: (a) 𝒮(R) is ω₁-directed (every countable subset of 𝒮(R) has an upper bound in 𝒮(R)) and ⋃_{R' ∈ 𝒮(R)} R' = R; (b) colim_{R' ∈ 𝒮(R)} (R', R'⁺) → (R, R⁺) is an isomorphism of Huber pairs, without completion; (c) X = lim_{R' ∈ 𝒮(R)} Spa(R', R'⁺) in perfectoid spaces and |X| = lim |Spa(R', R'⁺)|: X is an ω₁-cofiltered limit of affinoid perfectoid spaces with topologically countably generated rings of functions;

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P5.6a Every countable subset of a perfectoid Tate ring lies in a closed, topologically countably generated perfectoid subring (ECD Section 6, Proposition 6.5)

Source: [ECD](#source-ecd) Section 6, Proposition 6.5, statement, p. 29.

*Needs:* [P5.5](#p5-5), [P5.3](#p5-3), [P5.4](#p5-4).

<a id="p5-7"></a>

### 5.7 Cardinal bounds for cofiltered limits of affinoid perfectoid spaces

Let κ be a cutoff cardinal (DiamondsAndVStacks D0.23, ECD Lemma 4.1), λ < κ a cardinal, I a cofiltered category with fewer than λ morphisms, and X_i = Spa(R_i, R_i⁺) (i ∈ I) a cofiltered diagram of affinoid perfectoid spaces such that |R_i| < κ' for all i, for some strong limit cardinal κ' < κ (this holds when all X_i are κ'-small in the sense of ECD Definition 4.2). Let X = Spa(R, R⁺) = lim X_i. Then |colim R_i⁺| < κ, |R⁺| < κ, |R| < κ, |X| < κ, and |O_X(U)| < κ for every open affinoid U ⊆ X..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [ECD](#source-ecd) Section 6, Proposition 6.4, final statement, p. 27.

*Needs:* [P5.3](#p5-3).

<a id="p5-8"></a>

### 5.8 The 2-colimit of a filtered diagram of categories

Let J be a small filtered category and F a pseudofunctor from J (as a locally discrete bicategory) to categories (Mathlib `CategoryTheory.Pseudofunctor`): categories C_j, functors F_a: C_i → C_j for a: i → j, and coherent natural isomorphisms F_{ba} ≅ F_b ∘ F_a and F_{id} ≅ id. The filtered 2-colimit 2-colim_j C_j is the category whose objects are pairs (i, x) with x an object of C_i, whose morphisms are Hom((i, x), (j, y)) := colim_{(k, a: i → k, b: j →.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `CategoryTheory.FilteredTwoColimit`, `CategoryTheory.FilteredTwoColimit.ι`, `CategoryTheory.FilteredTwoColimit.ιCompIso`.

**Checks.**

- `filteredTwoColimit_test_const`: For J the one-object category and F = C, FilteredTwoColimit F ≌ C.
- `filteredTwoColimit_test_discrete`: For J = ℕ and C_n the discrete category on a set E_n with maps E_n → E_{n+1}, FilteredTwoColimit F is equivalent to the discrete category on colim_n E_n.
- `filteredTwoColimit_test_finitelyPresentedModules`: For a filtered diagram of rings B_j with colimit B, base change 2-colim_j Mod^{fp}(B_j) → Mod^{fp}(B) (finitely presented modules) is an equivalence (EGA IV 8.5.2).

Source: [Berkeley](#source-berkeley) Lecture 7, Remark 7.4.7, printed p. 54.

*Needs:* `mathlib:CategoryTheory.Pseudofunctor`.

<a id="p5-9"></a>

### 5.9 Finite étale objects over a cofiltered limit of affinoid perfectoid spaces come from a finite stage (ECD Proposition 6.4 (i))

For a perfectoid space Z, Z_ét is the category of perfectoid spaces étale over Z (ECD Definition 6.2, P3.18), Z_fét, Z_ét,qcqs and Z_ét,qc,sep its full subcategories of finite étale, of quasicompact quasiseparated (P4.2), and of quasicompact separated étale spaces, and base change along X_j → X_i or X → X_i is the fibre product of perfectoid spaces (P2.16), which preserves these classes (P3.18a). Let X = Spa(R, R⁺) = lim_i X_i be a cofiltered limit of affinoid perfectoid spaces X_i = Spa(R_i, R_i⁺) (P5.3). Then the base change functors (X_i)_fét → X_fét induce an equivalence of categories 2-colim_i (X_i)_fét → X_fét (P5.8)..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [ECD](#source-ecd) Section 6, Proposition 6.4 (i), p. 27.

*Needs:* [P3.2d](#p3-2).

<a id="p5-10"></a>

### 5.10 Quasicompact quasiseparated étale objects over a cofiltered limit form the 2-colimit (ECD Proposition 6.4 (ii))

For a perfectoid space Z, Z_ét is the category of perfectoid spaces étale over Z (ECD Definition 6.2, P3.18), Z_fét, Z_ét,qcqs and Z_ét,qc,sep its full subcategories of finite étale, of quasicompact quasiseparated (P4.2), and of quasicompact separated étale spaces, and base change along X_j → X_i or X → X_i is the fibre product of perfectoid spaces (P2.16), which preserves these classes (P3.18a). Let X = lim_i X_i be a cofiltered limit of affinoid perfectoid spaces (P5.3). Then the base change functors (X_i)_ét,qcqs → X_ét,qcqs induce an equivalence of categories 2-colim_i (X_i)_ét,qcqs → X_ét,qcqs (the 2-colimit of P5.8 for the base-change pseudofunctor on Iᵒᵖ)..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P5.10a Faithfulness of base change to a cofiltered limit on qcqs étale objects (graph argument) (ECD Section 6, Proposition 6.4 (ii))
- P5.10b Fullness of base change to a cofiltered limit on qcqs étale objects (graph approximation) (ECD Section 6, Proposition 6.4 (ii))
- P5.10c Every qcqs étale space over a cofiltered limit of affinoid perfectoid spaces descends to a finite stage (ECD Section 6, Proposition 6.4 (ii))

Source: [ECD](#source-ecd) Section 6, Proposition 6.4 (ii), p. 27.

*Needs:* [P5.8](#p5-8).

<a id="p5-11"></a>

### 5.11 Quasicompact separated étale objects over a cofiltered limit form the 2-colimit (ECD Proposition 6.4 (iii))

For a perfectoid space Z, Z_ét is the category of perfectoid spaces étale over Z (ECD Definition 6.2, P3.18), Z_fét, Z_ét,qcqs and Z_ét,qc,sep its full subcategories of finite étale, of quasicompact quasiseparated (P4.2), and of quasicompact separated étale spaces, and base change along X_j → X_i or X → X_i is the fibre product of perfectoid spaces (P2.16), which preserves these classes (P3.18a). Let X = lim_i X_i be a cofiltered limit of affinoid perfectoid spaces. Then the base change functors (X_i)_ét,qc,sep → X_ét,qc,sep induce an equivalence of categories 2-colim_i (X_i)_ét,qc,sep → X_ét,qc,sep, where X_ét,qc,sep ⊆ X_ét,qcqs is the full subcategory of quasicompact separated étale perfectoid spaces over X (a separated étale space over an affinoid is quasiseparated).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P5.11a Separatedness of a qcqs étale map is recognised at a finite stage of a cofiltered limit (ECD Section 6, Proposition 6.4 (iii))

Source: [ECD](#source-ecd) Section 6, Proposition 6.4 (iii), p. 27.

*Needs:* [P5.10](#p5-10).

**Finite-stage descent.**

<a id="p5-12"></a>

### 5.12 Finite-stage descent along cofiltered limits of affinoid perfectoid spaces (ECD Proposition 6.4 (i)–(iii))

For a perfectoid space Z, Z_ét is the category of perfectoid spaces étale over Z (ECD Definition 6.2, P3.18), Z_fét, Z_ét,qcqs and Z_ét,qc,sep its full subcategories of finite étale, of quasicompact quasiseparated (P4.2), and of quasicompact separated étale spaces, and base change along X_j → X_i or X → X_i is the fibre product of perfectoid spaces (P2.16), which preserves these classes (P3.18a). Let X_i = Spa(R_i, R_i⁺), i ∈ I, be a cofiltered system of affinoid perfectoid spaces with limit X = Spa(R, R⁺) (P5.3).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P5.12a Surjectivity and isomorphism of qcqs étale maps are detected at a finite stage of a cofiltered limit (ECD Section 6, Proposition 6.4 (ii))

Source: [ECD](#source-ecd) Section 6, before Proposition 6.4, p. 26.

*Needs:* [P5.9](#p5-9), [P5.10](#p5-10), [P5.11](#p5-11).

### Examples

Constant diagrams and profinite products test completed colimits. Finitely presented modules test passage from a filtered family to its categorical 2-colimit.

### Dependencies

Layers 0–4; filtered colimits, completions, henselian approximation, and the finite-presentation descent suppliers.

<a id="p6"></a>

## Layer 6: κ-small perfectoid spaces and pro-étale morphisms

κ-small and uniformly κ-small perfectoid spaces with their closure properties, affinoid pro-étale morphisms as cofiltered limits of affinoid étale ones, the pro-category equivalence, κ-bounded presentations, pro-étale morphisms with their stability under composition, base change, cancellation and limits, and the pro-étaleness of Zariski closed immersions and diagonals.

**κ-small perfectoid space.**

<a id="p6-1"></a>

### 6.1 κ-small perfectoid spaces

Fix a cardinal κ with ℵ₀ < κ that is a strong limit (2^λ < κ for every cardinal λ < κ); every cutoff cardinal of DiamondsAndVStacks D0.23 (ECD Lemma 4.1) is one. A perfectoid space X (P2.10: an adic space locally isomorphic to Spa(R, R⁺) for a perfectoid Tate pair (R, R⁺) in the sense of ECD Definition 3.1, with no perfectoid base field) is κ-small if (i) its underlying set |X| has cardinality #|X| < κ, and (ii) for every open affinoid perfectoid subspace U = Spa(A, A⁺) ⊆ X (so A = O_X(U)) the ring A has cardinality #A < κ.

Provide the interfaces `PerfectoidSpace.IsKappaSmall`, `PerfectoidSpace.IsKappaSmall.card_lt`, `PerfectoidSpace.IsKappaSmall.card_sections_lt`.

**Checks.**

- `isKappaSmall_spa_Cp`: For every cardinal κ with ℵ₀ < κ and κ a strong limit, Spa(C_p, O_{C_p}) is κ-small: it has one point and #C_p = 2^ℵ₀ < κ.
- `isKappaSmall_empty`: The empty perfectoid space is κ-small for every κ.
- `isKappaSmall_affinoid_iff`: For an affinoid perfectoid space X = Spa(A, A⁺), IsKappaSmall κ X ↔ #A < κ.

Source: [ECD](#source-ecd) §4, Definition 4.2, p. 20.

*Needs:* DiamondsAndVStacks D0.23, [P2.10](#p2-10), [P2.9](#p2-9).

<a id="p6-2"></a>

### 6.2 Uniformly κ-small perfectoid spaces

Let κ be an uncountable strong limit cardinal. A perfectoid space X is uniformly κ-small if there is a cardinal λ < κ such that #|X| ≤ λ and #O_X(U) ≤ λ for every open affinoid perfectoid subspace U ⊆ X. This definition is the uniform cardinal bound itself. It does not assert that a smaller uncountable strong-limit cutoff exists: λ⁺ is not a strong limit. Such a reformulation requires the extra assumption that strong-limit cutoffs below κ are cofinal. Properties: (a) uniformly κ-small implies κ-small;

Provide the interfaces `PerfectoidSpace.IsUniformlyKappaSmall`, `PerfectoidSpace.isUniformlyKappaSmall_iff_exists_uniform_bound`, `PerfectoidSpace.IsUniformlyKappaSmall.isKappaSmall`.

**Checks.**

- `isUniformlyKappaSmall_disc`: Spa(C_p⟨T^{1/p^∞}⟩, O_{C_p}⟨T^{1/p^∞}⟩) is uniformly κ-small with λ = 2^ℵ₀ for every uncountable strong limit κ.
- `isUniformlyKappaSmall_empty`: The empty perfectoid space is uniformly κ-small with λ = 1: its point set is empty and its ring of sections on the empty affinoid open is the zero ring, whose underlying set has one element.
- `isUniformlyKappaSmall_iff_isKappaSmall_of_compactSpace`: For a quasicompact perfectoid space X, IsUniformlyKappaSmall κ X ↔ IsKappaSmall κ X.

**Checks.** At κ = ℶ_ω, uniform boundedness is meaningful even though there is no smaller uncountable strong-limit cardinal. In particular λ⁺ cannot serve as an uncountable strong-limit cutoff: 2^λ ≥ λ⁺.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P6.2a Cardinality of complete Tate rings with a dense subring, and of their rational localisations, finite étale algebras and completed tensor products (ECD Remark 4.3)

Source: [ECD](#source-ecd) §6, Proposition 6.4, final sentence, p. 27.

*Needs:* [P6.1](#p6-1).

<a id="p6-3"></a>

### 6.3 Cover criterion for κ-smallness

Let κ be an uncountable strong limit cardinal and X a perfectoid space. (a) If X is κ-small, then X is covered by fewer than κ open affinoid subspaces Spa(A, A⁺) with #A < κ (namely by all of them: there are at most 2^{#|X|} < κ). (b) If X has a cover {U_j = Spa(A_j, A_j⁺)}_{j∈J} by open affinoid subspaces with #A_j < κ for all j, then every open affinoid subspace U = Spa(A, A⁺) ⊆ X has #A < κ; so such an X is κ-small as soon as #|X| < κ. (c) If moreover #J < κ and sup_j #A_j < κ — automatic when J is finite, or when #J < cf κ — then #|X| < κ, and X is κ-small, indeed uniformly κ-small (P6.2). (d) In particular an affinoid perfectoid space Spa(A, A⁺) is κ-small iff #A < κ, and a quasicompact perfectoid space is κ-small iff it has a finite cover by open affinoid subspaces whose rings have cardinality < κ. (e) The converse of (a) as printed in ECD Proposition 4.4 — a cover by fewer than κ open affinoids with rings of cardinality < κ, without a uniform bound, implies κ-small — holds for regular κ and fails whenever cf κ ≤ #J: for κ of cofinality ω₁ (such as the cutoff cardinal κ(ω₁) of the proof of ECD Lemma 4.1) and perfectoid fields K_α, α < ω₁, with #K_α < κ cofinal in κ, the.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P6.3a The adic spectrum of A has at most 2^{#A·#A} points (ECD  Proposition 4.4)

Source: [ECD](#source-ecd) §4, Proposition 4.4, p. 20.

*Needs:* [P6.1](#p6-1).

<a id="p6-4"></a>

### 6.4 Closure properties of κ-small perfectoid spaces: open subspaces, disjoint unions, fibre products

Let κ be an uncountable strong limit cardinal. (a) An open subspace of a κ-small (resp. uniformly κ-small) perfectoid space is κ-small (resp. uniformly κ-small). (b) A disjoint union ⊔_{j∈J} X_j is uniformly κ-small if #J < κ and all X_j are κ'-small for one κ' < κ; finite disjoint unions of κ-small spaces are κ-small. (c) (ECD Proposition 4.4, 'in particular') For morphisms X → Z ← Y of perfectoid spaces with X and Y uniformly κ-small (Z arbitrary), the fibre product X ×_Z Y (P2.16) is uniformly κ-small: if #|X|, #|Y| ≤ λ and all open affinoid rings of X and Y have cardinality ≤ λ (λ ≥ ℵ₀), then X ×_Z Y is covered by at most 2^λ open affinoids U ×_W V with rings of cardinality ≤ λ^ℵ₀ and has at most 2^{2^λ} points..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P6.4a Tilting preserves κ-smallness (ECD after Lemma 3.10)
- P6.4b Every affinoid perfectoid space is the cofiltered limit of its κ-small perfectoid quotients (κ-bounded form of ECD Proposition 6.5) (ECD  Proposition 6.5)

Source: [ECD](#source-ecd) §4, Proposition 4.4, p. 20.

*Needs:* [P6.2](#p6-2).

<a id="p6-5"></a>

### 6.5 ECD Proposition 6.4(iv) in the form used by the pro-étale calculus: affinoid étale objects and surjectivity descend to a finite stage

Let X_i = Spa(R_i, R_i⁺), i ∈ I, be a cofiltered inverse system of affinoid perfectoid spaces over a small index category, with limit X = Spa(R, R⁺) (P5.3: R⁺ the ϖ-adic completion of colim R_i⁺, R = R⁺[1/ϖ]). For a perfectoid space T write T_ét^aff for the category of affinoid perfectoid spaces étale over T (ECD Definition 6.2, P3.15). (a) (ECD Proposition 6.4(iv), which is AdicEtaleGeometry T130) The base change functors induce an equivalence 2-colim_i (X_i)_ét^aff → X_ét^aff. (b) (Descent of surjectivity) If Y_i ∈ (X_i)_ét^aff and Y_i ×_{X_i} X → X is surjective, there is j_0 → i such that Y_i ×_{X_i} X_j → X_j is surjective for every j → j_0. (c) (Relation to the quasicompact separated stage of P5) If Y ∈ X_ét^aff and Z_i → X_i is a qcqs étale model of Y (Z_i ×_{X_i} X ≅ Y;.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [ECD](#source-ecd) §6, Proposition 6.4(iv), p. 27.

*Needs:* AdicEtaleGeometry T130.

**Affinoid pro-étale morphism.**

<a id="p6-6"></a>

### 6.6 Affinoid pro-étale morphisms and pro-étale presentations

Let f : Y → X be a morphism of perfectoid spaces (P2.10). f is affinoid pro-étale if Y = Spa(S, S⁺) and X = Spa(R, R⁺) are affinoid perfectoid and there are a small cofiltered category I, a functor i ↦ (Y_i → X) from I to X_ét^aff (affinoid perfectoid spaces Y_i = Spa(S_i, S_i⁺) with an étale structure map to X in the sense of ECD Definition 6.2, and X-morphisms as transition maps) and an X-isomorphism Y ≅ lim_i Y_i, the limit being taken in perfectoid spaces (P5.3: S⁺ ≅ the ϖ-adic completion of colim S_i⁺ for a pseudouniformiser ϖ of R, and S = S⁺[1/ϖ]). The data (I, (Y_i), the isomorphism) is a pro-étale presentation of f. Conventions: the transition maps are X-morphisms between étale X-spaces and hence étale (P3.18a); they are not required to be surjective or finite étale, which distinguishes these presentations from those of Scholze 2013 used in AdicEtaleGeometry T037; I is small but of arbitrary size; being affinoid pro-étale is the existence of a presentation. X_proét^aff denotes the full subcategory of perfectoid spaces over X on the affinoid pro-étale X-spaces.

Provide the interfaces `PerfectoidSpace.ProEtalePresentation`, `PerfectoidSpace.IsAffinoidProEtale`, `PerfectoidSpace.IsAffinoidProEtale.of_presentation`.

**Checks.**

- `isAffinoidProEtale_rationalSubset`: For a rational subset U = X(f_1, …, f_n / g) of an affinoid perfectoid X, the inclusion U ↪ X is affinoid pro-étale with the presentation indexed by a point.
- `isAffinoidProEtale_id`: The identity of an affinoid perfectoid space is affinoid pro-étale.
- `isAffinoidProEtale_origin`: For K = Q_p(p^{1/p^∞})^∧ and X = Spa(K⟨T^{1/p^∞}⟩, K°⟨T^{1/p^∞}⟩), the origin Spa(K, K°) ↪ X is affinoid pro-étale with the presentation (X_n = {|T| ≤ |p|ⁿ})_n, and it is not étale (its image is not open).

Source: [ECD](#source-ecd) §7, Definition 7.8(i), p. 32.

*Needs:* [P2.10](#p2-10), [P2.9](#p2-9), [P3.15](#p3-15).

**Pro-étale morphism.**

<a id="p6-7"></a>

### 6.7 Pro-étale morphisms of perfectoid spaces

A morphism f : Y → X of perfectoid spaces is pro-étale if for every y ∈ Y there are an open neighbourhood V ⊆ Y of y and an open subset U ⊆ X with f(V) ⊆ U such that V and U are affinoid perfectoid and f|_V : V → U is affinoid pro-étale (P6.6). Conventions: V and U can be chosen rational inside any given neighbourhoods of y and f(y) (P6.13a);

Assume throughout this subsection: f an arbitrary morphism of perfectoid spaces, over no base field.

Provide the interfaces `PerfectoidSpace.IsProEtale`, `PerfectoidSpace.IsProEtale.of_isAffinoidProEtale`, `PerfectoidSpace.IsProEtale.of_isEtale`.

**Checks.**

- `isProEtale_openImmersion`: The inclusion of the open unit disc {|T| < 1} into the perfectoid closed disc over a perfectoid field is pro-étale.
- `isProEtale_id`: The identity of any perfectoid space is pro-étale.
- `isProEtale_prod_locallyProfinite`: For a perfectoid space X and a locally profinite set S (e.g. Q_p), X × S := ⋃ X × S_c over the compact open S_c ⊆ S is pro-étale over X (Berkeley Example 8.2.2).

Source: [ECD](#source-ecd) §7, Definition 7.8(ii), p. 32.

*Needs:* [P6.6](#p6-6), [P2.10](#p2-10), [P2.11b](#p2-11).

**Product with a profinite set.**

<a id="p6-8"></a>

### 6.8 The product X × S of an affinoid perfectoid space with a profinite set, and its relative form X ×_{S₀} S

Let X be an affinoid perfectoid space, φ : |X| → S₀ a continuous map to a profinite set and S → S₀ a continuous map of profinite sets. Write S → S₀ as a cofiltered limit of maps of finite discrete sets S_k → S₀,k (k ∈ K) compatible with S → S₀ (mathlib `Profinite.asLimit`, `DiscreteQuotient`). Each φ_k : |X| → S₀,k is locally constant, so X = ⊔_{t∈S₀,k} X_{k,t} with X_{k,t} := φ_k⁻¹(t) open and closed, hence a rational subset cut out by an idempotent of O(X) (O_X is a sheaf, P2.8);

Provide the interfaces `PerfectoidSpace.prodProfinite`, `PerfectoidSpace.fibreProdProfinite`, `PerfectoidSpace.prodProfinite.fst`.

**Checks.**

- `prodProfinite_finite`: For a finite discrete S, X × S ≅ ⊔_{s∈S} X and O(X × S) = O(X)^S.
- `prodProfinite_punit`: X × {pt} ≅ X and X × ∅ = ∅.
- `prodProfinite_Zp_sections`: O(Spa(C_p, O_{C_p}) × Z_p) = C⁰(Z_p, C_p) and O⁺ = C⁰(Z_p, O_{C_p}).

Source: [ECD](#source-ecd) §7, after Definition 7.8, p. 32.

*Needs:* [P6.6](#p6-6), [P5.3](#p5-3), [P2.8](#p2-8).

**Pro-category equivalence.**

<a id="p6-9"></a>

### 6.9 Affinoid pro-étale spaces over X are the pro-objects of the affinoid étale site

Let X be an affinoid perfectoid space, X_ét^aff the category of étale maps Y → X from affinoid perfectoid spaces (essentially small and finitely complete, P6.9a, P6.9c) and X_proét^aff the category of affinoid pro-étale maps Y → X (P6.6). Let Pro(X_ét^aff) be the pro-category (DiamondsAndVStacks D0.13; the opposite of Mathlib's Ind of the opposite category), with objects formal limits "lim" Y_i over small cofiltered categories and Hom("lim" Y_i, "lim" Z_j) = lim_j colim_i Hom_X(Y_i, Z_j). Then the realisation functor ρ_X : Pro(X_ét^aff) → X_proét^aff, "lim" Y_i ↦ lim Y_i (limit in perfectoid spaces), is an equivalence of categories, with quasi-inverse Y ↦ "lim"_{(T,t)∈E_Y} T.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P6.9a Size of the affinoid étale site: rings bounded by #O(X)^ℵ₀, fewer than κ isomorphism classes (ECD  Lemma 7.18)
- P6.9b Maps from a cofiltered limit of affinoid perfectoid spaces to a qcqs étale space factor through a finite stage (ECD  Proposition 7.10)
- P6.9c The canonical presentation: Y is affinoid pro-étale over X iff Y is the limit of all affinoid étale X-spaces under it (ECD  Lemma 7.11(iv))

Source: [ECD](#source-ecd) §7, Proposition 7.10, p. 33.

*Needs:* DiamondsAndVStacks D0.13, [P6.6](#p6-6), [P5.3](#p5-3).

<a id="p6-10"></a>

### 6.10 κ-small affinoid pro-étale spaces are the pro-objects with fewer than κ indices

Let κ be an uncountable strong limit cardinal and X a κ-small affinoid perfectoid space. (a) An affinoid pro-étale Y → X is κ-small iff it admits a pro-étale presentation Y = lim_{i∈I} Y_i with #Mor(I) < κ; all Y_i ∈ X_ét^aff are then κ-small (P6.9a). (b) Let Pro_κ(X_ét^aff) be the full subcategory of Pro(X_ét^aff) of pro-objects isomorphic to one indexed by a cofiltered category with fewer than κ morphisms. The realisation ρ_X of P6.9 restricts to an equivalence Pro_κ(X_ét^aff) ≃ X_proét,κ^aff with the full subcategory of κ-small affinoid pro-étale X-spaces. (c) Every affinoid pro-étale Y → X is the limit, along a directed poset, of κ-small affinoid pro-étale Y_J → X: for a presentation indexed by I, J runs over the cofiltered subcategories (not required to be full) of I with fewer than κ morphisms and Y_J := lim_{i∈J} Y_i (the pro-étale form of the first step of ECD's proof of Proposition 8.2; for arbitrary affinoid Y see P6.4b).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P6.10a Cofiltered limits of uniformly bounded κ-small affinoid perfectoid spaces are κ-small (set-theoretic clause of ECD Proposition 6.4) (ECD Proposition 6.4, final sentence)
- P6.10b Affinoid pro-étale spaces over a geometric point are products with profinite sets (ECD after Definition 7.8)
- P6.10c Zariski closed immersions are affinoid pro-étale: the rational-intersection presentation (ECD Remark 7.9)

Source: [ECD](#source-ecd) §7, Proposition 7.10, p. 33.

*Needs:* [P6.9](#p6-9).

<a id="p6-11"></a>

### 6.11 Zariski closed equals strongly Zariski closed

For an affinoid perfectoid space X = Spa(R, R⁺) and a morphism f : Z → X of perfectoid spaces, f is a Zariski closed immersion if and only if f is strongly Zariski closed. The direction strongly Zariski closed ⇒ Zariski closed, i.e. the case of an already given surjective perfectoid quotient R → S, is proved in P4 (P4.16b)..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P6.11a Sections of affinoid pro-étale maps are affinoid pro-étale (ECD  Lemma 7.11)

Source: [ECD](#source-ecd) §5, Theorem 5.8 with proof, p. 25.

*Needs:* [P4.15](#p4-15).

<a id="p6-12"></a>

### 6.12 X_proét^aff has all small limits, computed in perfectoid spaces (ECD Lemma 7.11(iv))

For an affinoid perfectoid space X, the category X_proét^aff has all small limits, and they are computed in perfectoid spaces over X: the final object is id_X; fibre products Y ×_Z Y' of objects of X_proét^aff are the fibre products of perfectoid spaces; cofiltered limits are the limits of P5; every small limit is a cofiltered limit of finite limits of affinoid perfectoid spaces, and the inclusion X_proét^aff → (perfectoid spaces over X) preserves all small limits. Under ρ_X (P6.9) this is the statement that Pro(C) has all small limits for C = X_ét^aff finitely complete.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P6.12a Base change of affinoid pro-étale maps (ECD Lemma 7.11(ii))
- P6.12b Cofiltered limits of affinoid pro-étale X-spaces are affinoid pro-étale (the geometric form of Pro(Pro(C)) → Pro(C)) (ECD  Lemma 7.11)
- P6.12c Composites of affinoid pro-étale maps are affinoid pro-étale (ECD Lemma 7.11(i))
- P6.12d Morphisms between affinoid pro-étale X-spaces are affinoid pro-étale (ECD Lemma 7.11(iii))

Source: [ECD](#source-ecd) §7, Lemma 7.11(iv), p. 33.

*Needs:* [P6.9](#p6-9).

**Stability of pro-étale morphisms.**

<a id="p6-13"></a>

### 6.13 Stability of pro-étale morphisms: composition, base change, cancellation and limits

(i) Composites of pro-étale morphisms of perfectoid spaces are pro-étale. (ii) If f : Y → X is pro-étale and g : X' → X is any morphism of perfectoid spaces, then f' : X' ×_X Y → X' is pro-étale. (iii) If Y → X and Y' → X are pro-étale, every X-morphism Y → Y' is pro-étale. (iv) For affinoid X, X_proét^aff has all small limits (P6.12).

Assume throughout this subsection: Arbitrary perfectoid spaces in (i)–(iii); X affinoid in (iv).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P6.13a Étale maps are pro-étale, and affinoid pro-étale maps restrict to affinoid opens (ECD  Lemma 7.11)
- P6.13b Diagonals and graphs of morphisms of perfectoid spaces are pro-étale (ECD Remark 7.9)

Source: [ECD](#source-ecd) §7, Lemma 7.11(i), p. 33.

*Needs:* [P6.12a](#p6-12), [P6.12c](#p6-12), [P6.12d](#p6-12).

<a id="p6-14"></a>

### 6.14 Scholze 2013's affinoid perfectoid objects of X_proét give affinoid pro-étale perfectoid spaces in the sense of ECD Definition 7.8

Let K be a perfectoid field of characteristic 0, X a locally noetherian adic space over Spa(K, K⁺), and X_proét Scholze's pro-étale site (AdicEtaleGeometry T052, on the category pro-X_ét of AdicEtaleGeometry T037). Let U = lim U_i ∈ X_proét be affinoid perfectoid (Scholze 2013, Definition 4.3: a pro-étale presentation by affinoid U_i = Spa(R_i, R_i⁺) whose completed colimit (R, R⁺) is a perfectoid affinoid (K, K⁺)-algebra) and Û := Spa(R, R⁺). (a) If V_i → U_i is étale and a composite of rational subsets and finite étale maps, then V := V_i ×_{U_i} U is affinoid perfectoid and V̂ = V_i ×_{U_i} Û (fibre product of adic spaces over K) is an object of Û_ét^aff, étale in the sense of ECD Definition 6.2 (Scholze 2013, Lemma 4.5(i)). (b) If V = lim_k V^{(k)} → U is a cofiltered limit in X_proét of objects V^{(k)} → U as in (a), then V is affinoid perfectoid and V̂ = lim_k V̂^{(k)} (limit in perfectoid spaces, P5) is affinoid pro-étale over Û with pro-étale presentation (V̂^{(k)})_k (P6.6);.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [Sch13](#source-sch13) §4, Definition 4.3(i), p. 22.

*Needs:* AdicEtaleGeometry T037.

### Examples

The empty space and Spa(ℂ_p) satisfy every allowed cutoff. A cofinal family of fields at a singular cutoff shows why bounds on each affinoid separately do not provide one uniform bound.

### Dependencies

Layers 1–5; cardinal arithmetic and cutoff/pro-category contracts from DiamondsAndVStacks; the analytic étale suppliers.

<a id="p7"></a>

## Layer 7: Tilde-limits and Frobenius-controlled towers

Tilde-limits of analytic adic spaces and perfectoid tilde-limits, their uniqueness in the perfectoid class and comparison with represented functors, restriction to rational opens, change of index, étale and finite étale base change and gluing; Frobenius-controlled integral towers with their completion, uniformity bound and the perfectoid Frobenius criterion; the comparison of étale topoi along tilde-limits; and regular finite flat towers.

<a id="p7-1"></a>

### 7.1 Tilde-limits of analytic adic spaces

Let I be a small cofiltered category, (X_i)_{i ∈ I} a diagram of analytic adic spaces (AdicSpaces Layer 5) whose transition maps are quasicompact and quasiseparated, and X an analytic adic space with compatible morphisms φ_i : X → X_i. Two separate conditions: (T) the continuous map |X| → lim_i |X_i| is a homeomorphism; (D) every x ∈ X has an open affinoid neighbourhood U = Spa(A, A⁺) such that, the union over all pairs (i, V), where V = Spa(A_{i,V}, A_{i,V}⁺) is an open affinoid of X_i through which U → X_i factors, of the images of A_{i,V} → A is dense in A. X ~ lim_i X_i (X is a tilde-limit of the X_i) means (T) and (D). Neither X nor the X_i is required to be quasicompact or locally noetherian; the perfectoid tilde-limits of P7.2 are the tilde-limits whose X is perfectoid.

Provide the interfaces `IsTildeLimit`, `IsTildeLimit.homeomorph`, `IsTildeLimit.dense_image`.

**Checks.**

- `tildeLimit_const`: X ~ lim X for the constant diagram.
- `tildeLimit_perfectoid_torus`: Spa ℂ_p⟨T^{±1/p^∞}⟩ ~ lim_n Spa ℂ_p⟨T^{±1/p^n}⟩, with (D) witnessed by the Laurent polynomials in T^{1/p^n}.
- `tildeLimit_not_uncompleted`: The uncompleted colimit is not a complete perfectoid Tate ring. This is a check of completeness, not a counterexample to the tilde-limit condition: SW13 Proposition 2.4.2 allows the adic spectrum of an uncompleted direct limit to be a tilde-limit.
- `tildeLimit_topology_without_density`: The map Spa(ℂ_p, O_{ℂ_p}) → Spa(ℚ_p, ℤ_p) is a homeomorphism between one-point spaces, but ℚ_p is not dense in ℂ_p, so it fails the density clause.

Source: [SW13](#source-sw13) §2.4, Definition 2.4.1, pp. 19–20 (which does not require the spaces to be analytic); [Huber96](#source-huber96) Definition 2.4.2, p. 125, and Remark 2.4.3, p. 126, for the qcqs pseudo-adic comparison; this restricted comparison does not supply the non-qcqs generality of SW13. The affinoid Lean model requires identity and composition laws for the transition maps, and its spectrality conclusion requires spectral transition maps.

*Needs:* `mathlib:CategoryTheory.IsCofiltered`, `mathlib:TopCat.limitCone`, `mathlib:Dense`.

**Perfectoid tilde-limit.**

<a id="p7-2"></a>

### 7.2 Perfectoid tilde-limits X ~ lim X_i of analytic adic spaces

Fix a prime p. Let I be a small cofiltered category, i ↦ X_i a functor from I to analytic adic spaces (AdicSpaces Layer 5: every point analytic) whose transition morphisms f_a: X_j → X_i (a: j → i) are quasicompact and quasiseparated, X a perfectoid space in the sense of P2.10 (ECD Definition 3.19: locally Spa(R, R⁺) with R a perfectoid Tate ring in the sense of ECD Definition 3.1, of characteristic 0 or p, no base field), and φ = (φ_i: X → X_i)_i a compatible family (f_a ∘ φ_j = φ_i). The pair (X, φ) is a perfectoid tilde-limit of (X_i), written X ~ lim_i X_i, if it is a tilde-limit in the sense of P7.1 (Scholze–Weinstein Definition 2.4.1), i.e. (a) the continuous map |X| → lim_i |X_i| into the limit of the underlying topological spaces (Mathlib `TopCat.limitCone`) is a homeomorphism, and (b) every x ∈ X has an open affinoid neighbourhood U = Spa(A, A⁺) ⊆ X such that the union, over i ∈ I and over open subsets V ⊆ X_i with φ_i(U) ⊆ V, of the images of the restriction maps O_{X_i}(V) → A is dense in A. Conventions pinned: (i) the index category is cofiltered and only the transition maps, not the X_i, are required to be quasicompact and quasiseparated; (ii) no perfectoid base field is fixed: the X_i may be of characteristic 0 or p, and X may lie over a different base than the X_i (Chojecki–Hansen–Johansson Theorem 2.8: the X_i over Q_p, X perfectoid; Scholze's universal cover of an affinoid over Q_p with limit over C_p); (iii) the two conditions (a) and (b) are independent and both are required (tests below); (iv) a tilde-limit is not a categorical limit in adic spaces: X ~ X_0 may hold with X ≇ X_0 (Scholze–Weinstein after Proposition 2.4.4). Equivalent forms of (b), used throughout the stage: (b′) there is an open cover of X by affinoids U = Spa(A, A⁺) for which colim_{(i, V)} O_{X_i}(V) → A has dense image, V running over open affinoids of X_i through which U → X_i factors (Scholze–Weinstein Definition 2.4.1);

Provide the interfaces `PerfectoidSpace.IsTildeLimit`, `PerfectoidSpace.IsTildeLimit.homeomorph`, `PerfectoidSpace.IsTildeLimit.dense`.

**Checks.**

- `isTildeLimit_test_perfectoidDisc`: For a perfectoid Tate ring R with pseudouniformiser ϖ admitting compatible p-power roots, the compatible maps Spa(R⟨T^{1/p^∞}⟩, R⁺⟨T^{1/p^∞}⟩) → Spa(R⟨T^{1/p^n}⟩, R⁺⟨T^{1/p^n}⟩) exhibit a perfectoid tilde-limit, and the same holds for the torus R⟨T^{±1/p^∞}⟩ over the tower R⟨T^{±1/p^n}⟩.
- `isTildeLimit_test_const`: For a perfectoid space X and the constant system X_i = X (I = the one-object category) with φ = id, X ~ lim X_i; more generally any isomorphism X ≅ X_0 of adic spaces with X perfectoid exhibits X ~ X_0.
- `isTildeLimit_test_not_categorical`: For a perfectoid field K, Spa(K, O_K) ~ Spa(K[ε]/(ε²), O_K + Kε) along the quotient map K[ε]/(ε²) → K (the image is all of K, the underlying spaces are points), although the two adic spaces are not isomorphic: a tilde-limit is not an isomorphism onto a limit.

Source: [SW13](#source-sw13) §2.4, Definition 2.4.1, pp. 19-20.

*Needs:* [P7.1](#p7-1), [P2.10](#p2-10), [P2.6](#p2-6).

<a id="p7-3"></a>

### 7.3 Residue-field tilde-limits X ~′ lim X_i over locally noetherian adic spaces

Let I be a small cofiltered category, (X_i) an I-indexed system of quasicompact quasiseparated locally noetherian analytic adic spaces (AdicSpacesPartII R0 (adic morphisms, finiteness classes, locally noetherian spaces): covered by Spa(A, A⁺) with A a complete strongly noetherian Tate ring), X a perfectoid space and φ = (φ_i: X → X_i) a compatible family. Then X ~′ lim X_i (Scholze's notation X ~ lim X_i of Definition 7.14, written ~′ in Scholze–Weinstein after Theorem 2.4.7) means: (a).

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `PerfectoidSpace.IsResidueFieldTildeLimit`, `PerfectoidSpace.IsResidueFieldTildeLimit.homeomorph`, `PerfectoidSpace.IsResidueFieldTildeLimit.residueField_dense`.

**Checks.**

- `isResidueFieldTildeLimit_test_disc`: For a perfectoid field K, Spa(K⟨T^{1/p^∞}⟩, K°⟨T^{1/p^∞}⟩) ~′ lim_n Spa(K⟨T^{1/p^n}⟩, K°⟨T^{1/p^n}⟩): the underlying spaces agree by the tilde-limit of the disc tower, and at every point the colimit of the residue fields is dense.
- `isResidueFieldTildeLimit_test_point`: For a perfectoid field K, the constant system Spa(K, K°) (noetherian, as K is a field) with the identity satisfies Spa(K, K°) ~′ lim Spa(K, K°).
- `isResidueFieldTildeLimit_test_not_dense`: Spa(C_p, O_{C_p}) → Spa(Q_p, Z_p) (constant system) satisfies (a) but not (c): Q_p is not dense in C_p.

Source: [Sch12](#source-sch12) §7, Definition 7.14, pp. 43-44.

*Needs:* AdicSpacesPartII R0 (adic morphisms, finiteness classes, locally noetherian spaces).

<a id="p7-4"></a>

### 7.4 Good affinoid perfectoid subsets of a tilde-limit

Let (X_i)_{i∈I} be as in P7.2, X a perfectoid space with a compatible cone φ. A good affinoid perfectoid of (X, φ) is a triple (W, i_0, V) where W = Spa(R, R⁺) ⊆ X is an affinoid perfectoid open subset (P2.9), i_0 ∈ I and V ⊆ X_{i_0} is a quasicompact open subset such that (i) W = φ_{i_0}^{-1}(V), and (ii) writing V_a := f_a^{-1}(V) ⊆ X_j for a: j → i_0 (the slice category I/i_0, cofiltered), the ring map colim_{a ∈ (I/i_0)^op} O_{X_j}(V_a) → R has dense.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `PerfectoidSpace.GoodAffinoid`, `PerfectoidSpace.GoodAffinoid.level`, `PerfectoidSpace.GoodAffinoid.preimage_eq`.

**Checks.**

- `goodAffinoid_test_disc`: In the perfectoid disc tower over a perfectoid Tate ring R, W = {|T| ≤ |ϖ|} ⊆ Spa(R⟨T^{1/p^∞}⟩) is good at level 0 with V = {|T| ≤ |ϖ|}: its coordinate ring is the rational localisation R⟨T^{1/p^∞}⟩⟨T/ϖ⟩, and the image of colim_n R⟨T^{1/p^n}⟩⟨T/ϖ⟩ contains the image of R[T^{1/p^∞}, T/ϖ], which is dense.
- `goodAffinoid_test_empty`: The empty subset, with V = ∅ at any level, is a good affinoid perfectoid (R = 0).
- `goodAffinoid_test_not_dense`: For Spa(C_p) → constant Spa(Q_p), W = Spa(C_p) is the preimage of V = Spa(Q_p) but Q_p is not dense in C_p, so W is not good.

Source: [Survey](#source-survey) §2, after Remark 2.21, p. 11.

*Needs:* [P2.9](#p2-9).

**Frobenius-controlled integral tower.**

<a id="p7-5"></a>

### 7.5 Frobenius-controlled integral towers

Fix a prime p. A Frobenius-controlled integral tower (A_•⁺, ϖ, m_0, w) consists of: (1) a sequence of rings A_0⁺ → A_1⁺ → A_2⁺ → ⋯ with transition maps t_m: A_m⁺ → A_{m+1}⁺; (2) an element ϖ ∈ A_0⁺ (its images again written ϖ), the compatible pseudouniformiser, such that every A_m⁺ is ϖ-torsion-free and ϖ-adically complete (Mathlib `IsAdicComplete (Ideal.span {ϖ}) A_m⁺`) and p ∈ ϖ^p A_0⁺; then every A_m⁺/ϖ^p is an F_p-algebra and absolute Frobenius induces a ring homomorphism Φ_m: A_m⁺/ϖ → A_m⁺/ϖ^p, x ↦ x^p (well defined because (x + ϖy)^p ≡ x^p mod pϖA_m⁺ + ϖ^pA_m⁺ = ϖ^pA_m⁺); (3) the eventual Frobenius lifting condition modulo ϖ^p: an index m_0 and, for every m ≥ m_0, a ring isomorphism w_m: A_{m+1}⁺/ϖ ≅ A_m⁺/ϖ^p such that (i) t_m ∘ w_m = Φ_{m+1} as maps A_{m+1}⁺/ϖ → A_{m+1}⁺/ϖ^p (t_m reduced modulo ϖ^p), and (ii) the w_m are compatible with the transition maps: w_{m+1} ∘ t_{m+1} = t_m ∘ w_m as maps A_{m+1}⁺/ϖ → A_{m+1}⁺/ϖ^p (t reduced modulo ϖ on the left and modulo ϖ^p on the right). The generic fibres are the complete Tate rings A_m := A_m⁺[1/ϖ] with ring of definition A_m⁺ (ϖ-adic topology) and the Huber pairs (A_m, A_m⁺⁺) with A_m⁺⁺ the integral closure of A_m⁺ in A_m;

Provide the interfaces `Perfectoid.FrobeniusTower`, `Perfectoid.FrobeniusTower.frobMod`, `Perfectoid.FrobeniusTower.transition_comp_lift`.

**Checks.**

- `frobeniusTower_test_disc`: For a perfectoid Tate pair (R, R⁺) and ϖ ∈ R⁺ with compatible p-power roots and ϖ^p | p in R⁺, A_m⁺ = R⁺⟨T^{1/p^m}⟩ with inclusions t_m and w_m: (R⁺/ϖ)[T^{1/p^{m+1}}] → (R⁺/ϖ^p)[T^{1/p^m}], r T^{a/p^{m+1}} ↦ Φ(r) T^{a/p^m}, is Frobenius-controlled with m_0 = 0; likewise the torus R⁺⟨T^{±1/p^m}⟩.
- `frobeniusTower_test_constPerfectoid`: For an integral perfectoid ring S that is ϖ-torsion-free and ϖ-adically complete with ϖ^p | p, the constant tower A_m⁺ = S, t_m = id, with w_m = Φ: S/ϖ ≅ S/ϖ^p (bijective by BMS Lemma 3.10) is Frobenius-controlled.
- `frobeniusTower_test_constDisc_not`: For a perfectoid field K with pseudouniformiser ϖ, the constant tower A_m⁺ = K°⟨T⟩ with identity transition maps is not Frobenius-controlled for any m_0: t_m ∘ w_m = Φ would make T a p-th power modulo ϖ^p in K°⟨T⟩, which it is not.

Source: [Torsion](#source-torsion) §III.2.3, proof of Corollary III.2.19, p. 42.

*Needs:* `mathlib:IsAdicComplete`, `mathlib:Ideal.span`, `mathlib:frobenius`.

<a id="p7-6"></a>

### 7.6 Completion and inversion of a Frobenius-controlled tower

For a Frobenius-controlled integral tower (A_•⁺, ϖ, m_0, w) (P7.5) define: A_∞⁺ := the ϖ-adic completion of the direct limit colim_m A_m⁺ (Mathlib `AdicCompletion (Ideal.span {ϖ})` of `Ring.DirectLimit`); A_∞ := A_∞⁺[1/ϖ], topologised so that A_∞⁺ is an open ring of definition with the ϖ-adic topology (a complete Tate ring with pseudouniformiser ϖ);

Provide the interfaces `Perfectoid.FrobeniusTower.completedPlus`, `Perfectoid.FrobeniusTower.completedPlus_quotient`, `Perfectoid.FrobeniusTower.completedPlus_torsionFree`.

**Checks.**

- `frobeniusTower_completion_test_disc`: For the compatible-root disc tower over (R, R⁺), the completion is R⁺⟨T^{1/p^∞}⟩ (the ϖ-adic completion of R⁺[T^{1/p^∞}]) and A_∞ = R⟨T^{1/p^∞}⟩.
- `frobeniusTower_completion_test_const`: For the constant tower of an integral perfectoid S (ϖ-torsion-free, ϖ-complete), the completion is S and A_∞ = S[1/ϖ].
- `frobeniusTower_completion_test_needsCompletion`: For the disc tower, the element Σ_{n≥1} ϖ^n T^{1/p^n} lies in A_∞⁺ but in no A_m⁺: the direct limit itself is not complete, so the formula needs the completion.

Source: [Torsion](#source-torsion) §III.2.3, proof of Corollary III.2.19, p. 43.

*Needs:* [P7.5](#p7-5).

<a id="p7-7"></a>

### 7.7 Preperfectoid adic spaces

Let X be an analytic adic space in the generality of Scholze–Weinstein §2.1 (an analytic Yoneda-adic space, AdicEtaleGeometry T072; the sheafy adic spaces of AdicSpaces Layer 5 form a full subcategory). For an open affinoid U = Spa(A, A⁺) ⊆ X with a pseudouniformiser ϖ ∈ A⁺, the strong completion (Â, Â⁺) of (A, A⁺) is the completion of (A, A⁺) for the topology on A that gives A⁺ the ϖ-adic topology (Â⁺ the ϖ-adic completion of.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Provide the interfaces `PerfectoidSpace.strongCompletionPair`, `PerfectoidSpace.strongCompletionPair_indep`, `PerfectoidSpace.IsPreperfectoid`.

**Checks.**

- `isPreperfectoid_test_nonreducedPoint`: For a perfectoid field K, Spa(K[X]/(X²), O_K + KX) is preperfectoid: the X-component is infinitely ϖ-divisible in O_K + KX, so the ϖ-adic completion of the plus ring is O_K and the strong completion is (K, O_K).
- `isPreperfectoid_test_perfectoid`: Every perfectoid space is preperfectoid, with every affinoid perfectoid its own strong completion.
- `isPreperfectoid_test_disc_not`: For a perfectoid field K, the closed unit disc D = Spa(K⟨T⟩, K°⟨T⟩) is not preperfectoid: every open affinoid of D is Spa(A, A⁺) with A a reduced one-dimensional K-affinoid algebra and A⁺ bounded, so the strong completion is (A, A⁺) itself, and A is not perfectoid (for A = K⟨T⟩, T is not a p-th power modulo ϖ^p in K°⟨T⟩).

Source: [SW13](#source-sw13) §2.3, Definition 2.3.4, pp. 17-18.

*Needs:* AdicEtaleGeometry T072.

<a id="p7-8"></a>

### 7.8 The strong completion X̂ of a preperfectoid space and X̂ ~ X

Let X be a preperfectoid analytic adic space (P7.7). There is a perfectoid space X̂ with a morphism X̂ → X (of Yoneda-adic spaces) such that: (i) |X̂| → |X| is a homeomorphism; (ii) for every open affinoid U = Spa(A, A⁺) ⊆ X whose strong completion (Â, Â⁺) is perfectoid, the corresponding open subspace of X̂ is Spa(Â, Â⁺);

Provide the interfaces `PerfectoidSpace.strongCompletion`, `PerfectoidSpace.strongCompletion.homeomorph`, `PerfectoidSpace.strongCompletion.affinoid`.

**Checks.**

- `strongCompletion_test_nonreducedPoint`: The strong completion of Spa(K[X]/(X²), O_K + KX) over a perfectoid field K is Spa(K, O_K).
- `strongCompletion_test_perfectoid`: For X perfectoid, the canonical X̂ → X is an isomorphism.
- `strongCompletion_test_not_iso`: The map Spa(K, O_K) → Spa(K[X]/(X²), O_K + KX) is a homeomorphism with dense image on functions but not an isomorphism of adic spaces: X̂ ~ X does not mean X̂ ≅ X.

Source: [SW13](#source-sw13) §2.3, Proposition 2.3.6, p. 18.

*Needs:* [P7.7](#p7-7).

<a id="p7-9"></a>

### 7.9 Cofinality witnesses for families of compact open subgroups

Let G be a Hausdorff topological group in which the compact open subgroups form a basis of neighbourhoods of 1 (a locally profinite group: a profinite group, or G(Q_p) for a linear algebraic group G over Q_p). Write CO(G) for the set of compact open subgroups, a cofiltered category under inclusion (K′ → K when K′ ⊆ K; K ∩ K′ is compact open).

Provide the interfaces `PerfectoidSpace.LevelFamily`, `PerfectoidSpace.CofinalityWitness`, `PerfectoidSpace.CofinalityWitness.initial`.

**Checks.**

- `cofinalityWitness_test_principalCongruence`: In G = GL_N(Q_p) the family K(p^n) = 1 + p^n M_N(Z_p) (n ≥ 1) has the witness U ↦ the least n with K(p^n) ⊆ U, which exists by PerfectoidSpaces:P7/compact-open-subgroup-cofinality since ⋂_n K(p^n) = {1}.
- `cofinalityWitness_test_discrete`: For G finite with the discrete topology, the one-element family K = {1} has the witness U ↦ ∗; the tilde-limit of a tower (X_K) over CO(G) is then its value X_{1}.
- `cofinalityWitness_test_gamma0_not`: In GL_2(Q_p) the decreasing family Γ_0(p^n) = {(a b; c d) ∈ GL_2(Z_p) : c ≡ 0 mod p^n} has no witness: every Γ_0(p^n) contains the upper-triangular unipotent (1 1; 0 1), which lies outside the open subgroup K(p). Its tilde-limit (the anticanonical Γ_0(p^∞) level) is not the full infinite level.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P7.9a A good affinoid perfectoid is the uniform completion of the finite-level coordinate rings; finite étale algebras descend (KL15 Definition 2.8.13)

Source: [Sch13E](#source-sch13e) item (1), p. 1.

*Needs:* `mathlib:OpenSubgroup`.

**Uniqueness of perfectoid tilde-limits.**

<a id="p7-10"></a>

### 7.10 A perfectoid tilde-limit represents lim_i Hom(−, X_i) on perfectoid spaces and is unique

Let (X_i)_{i∈I} be a cofiltered system of analytic adic spaces with quasicompact quasiseparated transition maps and X ~ lim X_i a perfectoid tilde-limit (P7.2). Then for every perfectoid space Y (of any characteristic, over no fixed base field), and more generally every analytic adic space Y covered by affinoids Spa(B, B⁺) with B uniform, the map Hom(Y, X) → lim_i Hom(Y, X_i), g ↦ (φ_i ∘ g)_i, is bijective. Consequently: (i) X represents the functor Y ↦ lim_i Hom(Y, X_i) on perfectoid spaces;

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P7.10a Good affinoid perfectoids cover a tilde-limit and are stable under rational subsets (Survey Proposition 2.22)

Source: [SW13](#source-sw13) §2.4, Proposition 2.4.5, p. 20.

*Needs:* [P7.2](#p7-2), [P7.4](#p7-4), [P1.1](#p1-1).

<a id="p7-11"></a>

### 7.11 Tilde-limits and inverse limits of represented functors and of diamonds

Let (X_i)_{i∈I} be a cofiltered system of analytic adic spaces over Spa(Z_p, Z_p) with qcqs transition maps. (i) If X ~ lim X_i is a perfectoid tilde-limit, then h_X ≅ lim_i h_{X_i} as presheaves on the category of perfectoid spaces (h_Y = Hom(−, Y)), and the induced map of v-sheaves X^◇ → lim_i X_i^◇ on Perf (diamonds of DiamondsAndVStacks D6 (the diamond functor); the limit is a diamond by DiamondsAndVStacks D5.3) is an isomorphism, compatible with |X^◇| = |X| ≅ lim |X_i| = lim |X_i^◇|. (ii) If the X_i = Spa(A_i, A_i⁺) are affinoid with completed direct limit (A, A⁺) (P7.11a) and uniformization (A^u, A^{u+}), then lim_i Spd(A_i, A_i⁺) ≅ Spd(A^u, A^{u+}) and |lim_i X_i^◇| ≅ |Spa(A^u, A^{u+})|; if moreover A^u is perfectoid, then X := Spa(A^u, A^{u+}) ~ lim X_i and X^◇ ≅ lim X_i^◇. (iii) If lim_i X_i^◇ ≅ X^◇ for a perfectoid space X with compatible maps to the X_i (the hypothesis of Hansen–Johansson Lemma 5.11 and Definition 5.12), then |X| → lim_i |X_i| is a homeomorphism and (when the X_i are qcqs, or locally over a qcqs open at a finite level) every quasicompact open and every rational subset of X is the preimage of one at a finite level; the density condition (b) of P7.2 is.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P7.11a Completed direct limits of Huber pairs give tilde-limits (SW13 Proposition 2.4.2)
- P7.11b Quasicompact opens and rational subsets of a tilde-limit come from finite level (CHJ  Theorem 2.17)
- P7.11c Tilde-limits are invariant under initial changes of index category (Sch13E item (1))
- P7.11d A decreasing family of open subgroups of a profinite group is cofinal iff its intersection is trivial (CHJ  Lemma 2.24)

Source: [Survey](#source-survey) §2, Proposition 2.23, p. 12.

*Needs:* [P7.10](#p7-10).

**Gluing of perfectoid tilde-limits.**

<a id="p7-12"></a>

### 7.12 Locality and gluing of perfectoid tilde-limits

Let (X_i)_{i∈I} be a cofiltered system of analytic adic spaces with qcqs transition maps, i_0 ∈ I, and (V^α)_{α} an open cover of X_{i_0}, with preimages V^α_a := f_a^{-1}(V^α) ⊆ X_j (a: j → i_0). (i) Locality: a perfectoid space X with a compatible cone satisfies X ~ lim X_i iff for every α the open subspace U^α := φ_{i_0}^{-1}(V^α) satisfies U^α ~ lim_a V^α_a. (ii) Gluing: if for every α the system (V^α_a)_a has a perfectoid tilde-limit U^α, then there is a perfectoid space X with a compatible cone and X ~ lim X_i;

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P7.12a Restriction of a tilde-limit to compatible open and rational subsets (BHW  Theorem 5.11)
- P7.12b Finite étale base change of perfectoid tilde-limits (Sch12 Lemma 7.3 (iii))
- P7.12c Étale base change of perfectoid tilde-limits (SW13 Proposition 2.4.3)

Source: [Torsion](#source-torsion) §III.3, Definition III.3.5 (ii), p. 56.

*Needs:* [P7.2](#p7-2), [P7.10](#p7-10), [P7.11a](#p7-11).

**Perfectoid Frobenius criterion for towers.**

<a id="p7-13"></a>

### 7.13 The perfectoid Frobenius criterion: Frobenius-controlled towers have perfectoid tilde-limits

Let (A_•⁺, ϖ, m_0, w) be a Frobenius-controlled integral tower (P7.5) with generic fibres (A_m, A_m⁺⁺) and completion (A_∞, A_∞⁺⁺) (P7.6). Then: (i) A_∞ is a perfectoid Tate ring in the sense of ECD Definition 3.1 (complete, uniform, with the pseudouniformiser ϖ satisfying ϖ^p | p in A_∞° and Φ: A_∞°/ϖ ≅ A_∞°/ϖ^p), of characteristic 0 or p according to A_0⁺, and (A_∞, A_∞⁺⁺) is a perfectoid Tate pair;

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P7.13a Frobenius on the completed tower is bijective modulo ϖ, and the uniformity bound ϖA_∞° ⊆ A_∞⁺ (Torsion  Corollary III.2.19)
- P7.13b The tilt of the limit of a Frobenius-controlled tower (Torsion  Corollary III.2.19)
- P7.13c The perfection of a characteristic-p adic space as a tilde-limit along relative Frobenius (Torsion Definition III.2.18 (ii))

**Gap.** The cited proof treats the specific anticanonical tower over the completed cyclotomic base. It does not state the arbitrary-ring tower criterion above. A proof from the full tower hypotheses, including the uniformity estimate and the claimed characteristic alternatives, is still required.

Source: [Torsion](#source-torsion) §III.2.3, proof of Corollary III.2.19, pp. 42–43.

*Needs:* [P7.5](#p7-5), [P7.6](#p7-6), [P7.11a](#p7-11).

**Limits of perfectoid towers.**

<a id="p7-14"></a>

### 7.14 Towers of perfectoid spaces with affinoid transition maps have perfectoid tilde-limits

Let (X_i)_{i∈I} be a cofiltered system of perfectoid spaces whose transition maps are affinoid (for every a: j → i and every affinoid open V ⊆ X_i, f_a^{-1}(V) is affinoid; hence qcqs). Then: (i) the limit X := lim_i X_i exists in the category of perfectoid spaces; (ii) X ~ lim_i X_i (P7.2), and X represents lim_i Hom(−, X_i) on perfectoid spaces; (iii) for i_0 ∈ I and an affinoid perfectoid open V = Spa(R_{i_0}, R_{i_0}⁺) ⊆ X_{i_0} with preimages V_a = Spa(R_a, R_a⁺), the preimage of V in X is Spa(R, R⁺) with R⁺ the ϖ-adic completion of colim_a R_a⁺ and R = R⁺[1/ϖ] (ϖ a compatible pseudouniformiser), and R is perfectoid; (iv) |X| ≅ lim_i |X_i|; (v) if I is ω_1-cofiltered, colim R_a → R and colim R_a⁺ → R⁺ are bijective. This is the easy limit theorem, in which every finite level is already perfectoid; it is distinct from P7.13, whose finite levels are not perfectoid.

Source: [BHW](#source-bhw) §5.2, proof of Theorem 5.11, p. 1749.

*Needs:* [P5.3](#p5-3), [P1.25](#p1-25), [P7.13a](#p7-13).

<a id="p7-15"></a>

### 7.15 Tilde-limits X ~ lim X_i of noetherian adic spaces and the comparison of etale topoi

Let (X_i)_{i∈I} be a cofiltered system of quasicompact quasiseparated locally noetherian analytic adic spaces (AdicSpacesPartII R0 (adic morphisms, finiteness classes, locally noetherian spaces); no perfectoid base field is assumed, and the X_i may lie over Spa(Q_p, Z_p) while X lies over a perfectoid field), X a perfectoid space and X ~′ lim X_i (P7.3; this holds whenever X ~ lim X_i, P7.15a). Then: (i) |X| is a spectral space and X is qcqs (Scholze 2012 Remark 7.15); (ii) (Theorem 7.17) the étale topos X_ét^~ of the perfectoid space X (P3.18) is the projective limit of the fibred topos (X_{i,ét}^~)_i of the étale topoi of the X_i (AdicEtaleGeometry T024, equal to Huber's): X_ét^~ is equivalent to the topos of sheaves on the colimit site colim_i (X_i)_{ét,qcqs} (objects qcqs étale over some X_i, morphisms the filtered colimits of Hom sets, coverings the families that are coverings at some finite level), compatibly with the pullback morphisms X_ét^~ → X_{i,ét}^~; (iii) (Corollary 7.18) for i_0 ∈ I and a sheaf of abelian groups F_{i_0} on X_{i_0,ét}, with pullbacks F_j to X_{j,ét} (j → i_0) and F to X_ét, the natural map colim_j H^n(X_{j,ét}, F_j) → H^n(X_ét, F) is bijective for.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P7.15a A perfectoid tilde-limit over qcqs locally noetherian spaces is a residue-field tilde-limit (SW13 after Theorem 2.4.7)
- P7.15b Étale base change of residue-field tilde-limits, and bijectivity suffices (Sch12 Proposition 7.16)
- P7.15c Qcqs étale spaces over a residue-field tilde-limit descend to a finite level (Sch12  Theorem 7.17)
- P7.15d Towers with homeomorphic, purely inseparable transition maps do not change the étale topos (Sch12 Corollary 7.19)

Source: [Sch12](#source-sch12) §7, proof of Theorem 7.17, p. 44.

*Needs:* [P7.3](#p7-3).

<a id="p7-16"></a>

### 7.16 Finite flat regular towers with algebraically closed residue field

Let (R, m) be a complete regular local ring with residue field k. There is a filtered direct system of finite flat R-algebras R_i such that each (R_i, mR_i) is a regular local ring and (lim→ R_i, m·lim→ R_i) is a regular local ring with algebraically closed residue field..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Gap.** The regular-local predicate is Mathlib’s IsRegularLocalRing. The Cohen presentations and the particular regularity/normality comparisons used in the cited proof still need precise supplier interfaces; the theorem locator does not provide their prerequisite chain.

Source: [Čes](#source-ces) §5, Lemma 5.1, p. 11.

*Needs:* `mathlib:IsAdicComplete`.

<a id="p7-17"></a>

### 7.17 Finite flat regular towers with perfectoid completion

Let (R, m) be a complete regular local ring of mixed characteristic (0, p) with perfect residue field k, and W := W(k). There is a tower {R_m}_{m≥0} of finite flat R-algebras R_m of p-power rank over R, each a regular local ring, such that the p-adic completion R̂_∞ of R_∞ := lim→_m R_m is perfectoid (integral perfectoid in the sense of BMS1 Definition 3.5, so R̂_∞[1/p] is a perfectoid Tate ring)..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Gap.** The same Cohen and regularity suppliers as Layer 7.16 are required, together with the compatible flat-tower comparisons. Their exact interfaces remain unspecified.

Source: [Čes](#source-ces) §5, Lemma 5.2, p. 12.

*Needs:* [P7.16](#p7-16).

### Examples

Constant systems, compatible-root disc towers, and the dual-number point test the two tilde-limit conditions. Principal congruence subgroups give cofinal levels; Γ₀(pⁿ) does not.

### Dependencies

Layers 1–6; analytic adic spaces, completions and spectral inverse limits; the general Frobenius-tower criterion remains a gap.

<a id="p8"></a>

## Layer 8: Finite quotients and closed perfectoid loci in towers

Invariant Huber pairs of a finite group action and the homeomorphism |Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})|; invariants of perfectoid Tate rings, including p-groups in characteristic p; finite quotients of affinoid perfectoid spaces, of spaces with an invariant affinoid cover and of analytically separated spaces; perfectoidization of integral extensions; good towers and their quotients; and Zariski closed loci in towers with the tilde-limit comparison.

**Invariant Huber pair.**

<a id="p8-1"></a>

### 8.1 The invariant Huber pair (A^G, A^{+G}) of a finite group action

Let (A, A⁺) be a complete Tate–Huber pair and G a finite group acting on A on the left by continuous ring automorphisms with g(A⁺) = A⁺ for all g ∈ G. Put A^G = {a ∈ A : g·a = a for all g} with the subspace topology and A^{+G} = A⁺ ∩ A^G. Then: (i) A^G is a closed subring and a complete Tate ring: for every pseudouniformizer ϖ of A the norm N(ϖ) = ∏_{g∈G} g(ϖ) is a G-invariant pseudouniformizer of A and of A^G, G-stable rings of definition A₀ ⊆ A exist (the subring generated by the translates g(A₁) of any ring of definition A₁), and A₀^G is a ring of definition of A^G; (ii) (A^G)° = (A°)^G = A° ∩ A^G; (iii) A^{+G} is open and integrally closed in A^G and contained in (A^G)°, so (A^G, A^{+G}) is a complete Tate–Huber pair; (iv) A is integral over A^G, each a ∈ A being a root of the monic polynomial ∏_{g∈G}(T − g·a) ∈ A^G[T]; (v) A⁺ is the integral closure of A^{+G} in A. The construction is functorial in G-equivariant continuous maps of pairs, and for a subgroup H ≤ G it gives inclusions A^G ⊆ A^H, A^{+G} ⊆ A^{+H}.

Provide the interfaces `Huber.Pair.invariants`, `Huber.Pair.invariants_toSubring`, `Huber.Pair.normPseudoUniformizer`.

**Checks.**

- `invariants_trivialGroup`: For the trivial group, Huber.Pair.invariants returns (A, A⁺).
- `invariants_swap_prod`: For A = K × K, A⁺ = K⁺ × K⁺ and Z/2 swapping the factors, A^G is the diagonal copy of K, A^{+G} the diagonal copy of K⁺, and the norm of (ϖ, ϖ) is (ϖ², ϖ²).
- `invariants_toSubring_eq_fixedPoints`: The underlying subring of Huber.Pair.invariants G (A, A⁺) is FixedPoints.subring G A, and A is Algebra.IsInvariant over it.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P8.1a Extensions of a valuation along a normal algebraic extension exist and are conjugate (Hansen Theorem 3.1, Step 1)

Source: [Hansen](#source-hansen) Theorem 3.1, Step 3, p. 6.

*Needs:* `mathlib:FixedPoints.subring`, `mathlib:Algebra.IsInvariant`, `mathlib:Algebra.IsInvariant.isIntegral`.

<a id="p8-2"></a>

### 8.2 |Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})|

With (A, A⁺) and G as above, the continuous map q: |Spa(A, A⁺)| → |Spa(A^G, A^{+G})|, v ↦ v|_{A^G}, is surjective with fibres the G-orbits and induces a homeomorphism |Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})| for the quotient topology. Moreover Spa(A, A⁺) is the full preimage of Spa(A^G, A^{+G}) in Cont(A), and for every rational subset U = U(f₁, …, f_n / s) of Spa(A^G, A^{+G}) (f_i, s ∈ A^G generating an open ideal) the preimage q^{-1}(U) is the G-stable rational subset U(f₁, …, f_n / s) of Spa(A, A⁺).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P8.2a Continuous valuations restrict surjectively to the invariants, with G-orbits as fibres (Hansen Theorem 3.1, Step 1)

Source: [Hansen](#source-hansen) Theorem 3.1, p. 4.

*Needs:* [P8.1](#p8-1).

<a id="p8-3"></a>

### 8.3 Spd(A, A⁺) × G ⇉ Spd(A, A⁺) presents Spd(A^G, A^{+G}) as a v-sheaf

Let A be a complete Tate ℤ_p-algebra with a continuous left action of a finite group G and A⁺ ⊆ A a G-stable open integrally closed subring; put X = Spd(A, A⁺) and X_G = Spd(A^G, A^{+G}). Then X → X_G and X × G → X ×_{X_G} X are surjections of v-sheaves on Perf..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [CGJ](#source-cgj) Proposition 2.1.1, p. 4.

*Needs:* [P8.2](#p8-2).

**Invariants of a perfectoid ring.**

<a id="p8-4"></a>

### 8.4 Invariants of a perfectoid Tate ring under a finite group are perfectoid

Let A be a perfectoid Tate ring and G a finite group acting continuously on A by ring automorphisms. Then A^G, with the subspace topology, is a perfectoid Tate ring, and (A^G)♭ = (A♭)^G as subrings of A♭ with the same topology, compatibly with ♯. There is no hypothesis on |G|: p may divide the order of G. Over a perfectoid field K with a K-linear action this is Hansen's Theorem 3.5.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P8.4a Frobenius is surjective modulo u^p on the invariants of a p-group (KL16 Theorem 3.3.26)

Source: [KL16](#source-kl16) Theorem 3.3.26, p. 68.

*Needs:* [P8.1](#p8-1), [P1.1](#p1-1), [P1.4](#p1-4).

<a id="p8-5"></a>

### 8.5 Invariants commute with invariant rational localisation for perfectoid pairs

Let (A, A⁺) be a perfectoid Tate–Huber pair, of any characteristic, with a continuous action of a finite group G of any order, and q: X = Spa(A, A⁺) → Y = Spa(A^G, A^{+G}). For every rational subset U of Y, A^G⟨T/s⟩ → A⟨T/s⟩^G and A^{G+}⟨T/s⟩ → (A⁺⟨T/s⟩)^G are isomorphisms (plus rings: the integral closures of the images); hence O_Y = (q_*O_X)^G and O_Y⁺ = (q_*O_X⁺)^G.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P8.5a Invariants commute with invariant rational localisation in characteristic p, for any |G| (CGJ Remark 2.1.4)

Source: [CGJ](#source-cgj) Proposition 2.1.3, p. 5.

*Needs:* [P8.4](#p8-4).

<a id="p8-6"></a>

### 8.6 The categorical quotient X/G of an adic space by a finite group

Let X = (|X|, O_X, (v_x)) be an adic space (more generally an object of Huber's category V of v-ringed spaces) with a right action of a finite group G. Define X/G = (|X|/G, (q_*O_X)^G, (v_y)) where |X|/G has the quotient topology, q: |X| → |X|/G is the orbit map, (q_*O_X)^G is the sheaf of G-invariant sections (a sheaf of complete topological rings), and v_y is the valuation on O_{X/G,y} induced by O_{X/G,y} → O_{X,x} → Γ_{v_x} ∪ {0} for any x over y (independent of x). Then X/G is an object of V with a G-invariant morphism q: X → X/G, and it is the categorical quotient in V: every G-invariant morphism X → Z in V factors uniquely through q.

Provide the interfaces `VRingedSpace.quotient`, `VRingedSpace.quotient.π`, `VRingedSpace.quotient.isQuotientMap`.

**Checks.**

- `quotient_trivialAction`: For the trivial action of G, q: X → X/G is an isomorphism.
- `quotient_prod_self`: For X = Y × G (G acting on itself by right translation), X/G ≅ Y.
- `quotient_affinoid_perfectoid`: For an affinoid perfectoid Spa(A, A⁺) with G, X/G is Spa(A^G, A^{+G}) (affinoid perfectoid quotient).

Source: [Hansen](#source-hansen) Definition 2.2, p. 3.

*Needs:* `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`.

**Quotient of an affinoid perfectoid space.**

<a id="p8-7"></a>

### 8.7 The quotient of an affinoid perfectoid space by a finite group

Let (A, A⁺) be a perfectoid Tate–Huber pair with a continuous action of a finite group G preserving A⁺ (any |G|). Then X_G = Spa(A^G, A^{+G}) is an affinoid perfectoid space and q: X = Spa(A, A⁺) → X_G is the categorical quotient X/G in V (so also in adic spaces); it is also the coequalizer of X × G ⇉ X in Kedlaya–Liu's locally v-ringed spaces (CGJ Proposition 2.1.3(2));

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P8.7a Finite quotients commute with topologically orthonormalisable scalar extension (CHJ Lemma 2.23(2))

Source: [CGJ](#source-cgj) Proposition 2.1.3, p. 5.

*Needs:* [P8.4](#p8-4), [P8.2](#p8-2), [P8.5](#p8-5).

<a id="p8-8"></a>

### 8.8 Perfectoid quotients under a G-stable affinoid perfectoid cover

Let X be a perfectoid space with a right action of a finite group G, and suppose X has a covering by G-stable open subspaces U_i = Spa(A_i, A_i⁺) with A_i perfectoid Tate. Then X/G (the categorical quotient in V; equivalently the coequalizer of X × G ⇉ X in locally v-ringed spaces) is a perfectoid space covered by the affinoid perfectoid opens U_i/G = Spa(A_i^G, A_i^{+G}); |X/G| = |X|/G; the preimage under q of each U_i/G is U_i..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [CGJ](#source-cgj) Theorem 2.1.2, p. 5.

*Needs:* [P8.7](#p8-7).

<a id="p8-9"></a>

### 8.9 Quotients of analytic adic spaces with a G-stable affinoid cover, |G| invertible

Let X be an analytic adic space with an action of a finite group G, covered by G-stable open affinoid subspaces Spa(A_i, A_i⁺) with A_i a Tate ring, and assume |G| is invertible in O_X(X). Then X/G is an adic space with underlying space |X|/G, covered by the affinoid adic spaces Spa(A_i^G, A_i^{+G}).

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P8.9a Invariants commute with rational localisation when |G| is invertible (Hansen Theorem 3.3)

Source: [Hansen](#source-hansen) Theorem 1.1, p. 1.

*Needs:* [P8.2](#p8-2).

<a id="p8-10"></a>

### 8.10 Quotients of rigid spaces with a G-stable affinoid cover, for any |G|

Let X be a rigid analytic space over a complete nonarchimedean field K with a K-linear action of a finite group G, and suppose X has an (admissible) covering by G-stable open affinoid subspaces. Then X/G is a rigid analytic space over K, q: X → X/G is finite, and X/G is affinoid if X is..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P8.10a Invariants of a classical affinoid algebra are affinoid, and A is finite over them (CHJ opening paragraph)
- P8.10b Rational localisation commutes with invariants for classical affinoid algebras, for any |G| (Hansen Theorem 3.4)

Source: [Hansen](#source-hansen) Theorem 1.3, p. 2.

*Needs:* [P8.6](#p8-6).

<a id="p8-11"></a>

### 8.11 The diamond of a finite quotient is the quotient of the diamond

Let X be an analytic adic space over ℤ_p with an action of a finite group G, covered by G-stable affinoid opens Spa(A_i, A_i⁺) such that X/G is an adic space covered by the Spa(A_i^G, A_i^{+G}) (as in the three quotient theorems). Then the canonical map X^◇/G → (X/G)^◇ of pro-étale sheaves is an isomorphism.

Source: [HJ](#source-hj) Theorem 5.3 (with the following paragraph on the auxiliary conditions), p. 28.

*Needs:* [P8.3](#p8-3).

<a id="p8-12"></a>

### 8.12 Free actions give finite étale torsors; the universal quotient is not one in general

Let X be a perfectoid space with an action of a finite group G such that X/G is a perfectoid space with (X/G)^◇ = X^◇/G (for instance under a G-stable affinoid perfectoid cover, or the hypotheses of Hansen–Johansson's theorem). The following are equivalent: (a) q: X → X/G is a finite étale G-torsor, i.e. finite étale with X × G ≅ X ×_{X/G} X via (x, g) ↦ (x, xg); (b) G acts freely on X^◇, i.e..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [ECD](#source-ecd) Definition 10.12, p. 53.

*Needs:* [P8.11](#p8-11).

<a id="p8-13"></a>

### 8.13 G-clean neighbourhoods

Let X be a topological space with a continuous (right) action of a finite group G, x ∈ X a point and H_x ≤ G its stabilizer. An open neighbourhood U of x is G-clean if Uh = U for all h ∈ H_x and U ∩ Ug = ∅ for all g ∈ G ∖ H_x.

Provide the interfaces `Perfectoid.FiniteAction.IsGClean`, `Perfectoid.FiniteAction.IsGClean.smul_eq`, `Perfectoid.FiniteAction.IsGClean.disjoint_smul`.

**Checks.**

- `isGClean_trivialGroup`: For the trivial group, every open neighbourhood of x is clean; the translate conditions impose no restriction.
- `isGClean_neg_real`: For the reflection action of ℤ/2 on ℝ, (1/2, 3/2) is clean at 1, while (−1, 1) is clean at 0. The interval (−1, 2) is not clean at 1: it meets its reflected translate.
- `isGClean_iff_isOpenEmbedding`: For an open neighbourhood U stable under H_x, cleanness is equivalent to injectivity of U ×^{H_x} G → X; this map is then an open embedding onto the union of the translates. In the reflection example at 1 the two intervals are disjoint, so the induced map has two disjoint open components.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P8.13a G-clean neighbourhoods exist in Hausdorff spaces (HJ Lemma 5.2)

Source: [HJ](#source-hj) Definition (G-clean neighbourhood), unnumbered, in the paragraph before Lemma 5.2, p. 27.

*Needs:* `mathlib:MulAction.stabilizer`.

<a id="p8-14"></a>

### 8.14 Zariski-closed embeddings of perfectoid spaces and Zariski-open subsets

A map of perfectoid spaces Z → X is a Zariski-closed embedding if for every open affinoid perfectoid U ⊆ X the base change Z ×_X U → U is a Zariski-closed embedding of affinoid perfectoid spaces, as specified in Layer 4.15. Define a Zariski-open subset U by requiring that its closed complement carry such a Zariski-closed embedding. The quantifier is over every open affinoid; checking a single chosen cover or arbitrary base-change stability is not asserted (HJ’s caution after Definition 5.4, p. 29).

Provide the interfaces `PerfectoidSpace.IsZariskiClosedEmbedding`, `PerfectoidSpace.IsZariskiClosedEmbedding.of_affinoid`, `PerfectoidSpace.IsZariskiClosedEmbedding.base_change_affinoid`.

**Checks.**

- `isZariskiClosedEmbedding_id`: The identity of X and the empty subspace are Zariski-closed embeddings.
- `isZariskiClosedEmbedding_point`: For K perfectoid, the point T = 0 of Spa(K⟨T^{1/p^∞}⟩) is the Zariski-closed embedding cut out by the ideal (T^{1/p^n})_n, with ring K.
- `isZariskiClosedEmbedding_affinoid_iff`: For X affinoid perfectoid, a map Z → X is a Zariski-closed embedding if and only if it is a (strongly) Zariski-closed immersion in the sense of ECD Definition 5.7.

Source: [HJ](#source-hj) Definition 5.4 (1),(2) (with the caution paragraph after it), p. 29.

*Needs:* [P4.15](#p4-15).

<a id="p8-15"></a>

### 8.15 Analytically separated perfectoid spaces

A perfectoid space X over a nonarchimedean field Spa(K, K⁺) is analytically separated if the diagonal X → X ×_{Spa(K, K⁺)} X is a Zariski-closed embedding.

Provide the interfaces `PerfectoidSpace.IsAnalyticallySeparated`, `PerfectoidSpace.IsAnalyticallySeparated.inter_affinoid`, `PerfectoidSpace.IsAnalyticallySeparated.isSeparated`.

**Checks.**

- `isAnalyticallySeparated_affinoid`: For a perfectoid field K, Spa(K, K°) and every affinoid perfectoid over K are analytically separated; the multiplication map on the completed tensor product presents the closed diagonal.
- `isAnalyticallySeparated_projective_tower`: The perfectoid projective line given by the p-power tower of ℙ¹ over ℂ_p is analytically separated (HJ Lemma 5.6, pp. 30–31).
- `isAnalyticallySeparated_isSeparated`: Analytic separation implies that X^◇ → Spd(K, K⁺) is separated (HJ Lemma 5.5(1), pp. 29–30). The converse is not part of this definition.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P8.15a Analytically separated perfectoid spaces are separated (HJ Lemma 5.5)

Source: [HJ](#source-hj) Definition 5.4 (1),(2) (with the caution paragraph after it), p. 29.

*Needs:* [P8.14](#p8-14).

<a id="p8-16"></a>

### 8.16 Finite quotients of separated rigid spaces

Let X be a separated rigid analytic space over a complete nonarchimedean field K with a K-linear action of a finite group G, such that for every rank-one point x ∈ X the closure of {x} lies in some open affinoid Spa(A, A°) ⊆ X, and such that distinct rank-one points of one G-orbit have distinct images in the maximal Hausdorff quotient |X|^h (automatic if |X| is taut, e.g. X affinoid, quasicompact or partially proper). Then the categorical quotient X/G = (|X|/G, (q_*O_X)^G, …) is a rigid analytic space, q: X → X/G is finite, and X^◇/G → (X/G)^◇ is an isomorphism..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P8.16a Charts of a finite quotient from a G-clean neighbourhood inside a stabilizer-stable affinoid (HJ Theorem 5.3 (with the following paragraph on the auxiliary conditions))

Source: [HJ](#source-hj) Theorem 5.3 (with the following paragraph on the auxiliary conditions), p. 28.

*Needs:* [P8.10b](#p8-10).

**Finite quotient of a perfectoid space.**

<a id="p8-17"></a>

### 8.17 Finite quotients of analytically separated perfectoid spaces

Let X be an analytically separated perfectoid space over a nonarchimedean field Spa(K, K⁺) with an action of a finite group G by automorphisms over Spa(K, K⁺), such that for every rank-one point x ∈ X the closure of {x} is contained in an open affinoid perfectoid subspace Spa(A, A⁺) ⊆ X, and distinct rank-one points of one G-orbit have distinct images in |X|^h (automatic for taut |X|, in particular for X quasicompact, as for limits of good towers). Then the categorical quotient X/G is a perfectoid space, covered by opens W_x/H_x of the affinoid perfectoids V_x/H_x = Spa(A^{H_x}, A^{+H_x}), and X^◇/G →.

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P8.17a In an analytically separated space, intersections of affinoid perfectoids are affinoid perfectoid (HJ Lemma 5.5)
- P8.17b The quotient map of an analytically separated perfectoid space is affinoid in the weak sense (HJ Theorem 5.8)
- P8.17c A spatial diamond with perfectoid components and finitely many orbits on π₀ is perfectoid (HJ Lemma 5.1)

Source: [HJ](#source-hj) Theorem 5.8, p. 30.

*Needs:* [P8.16a](#p8-16), [P8.7](#p8-7), [P8.11](#p8-11).

<a id="p8-18"></a>

### 8.18 Perfectoidization of an integral extension of a perfectoid ring

Let R⁺ be an integral perfectoid ring (P1.24) and R⁺ → S⁺ an integral ring map. Then there is an initial integral perfectoid ring S⁺_perfd under S⁺ (for every integral perfectoid A, maps S⁺_perfd → A correspond to maps S⁺ → A), and the p-adic completion S⁺^∧_p has the same perfectoidization, so S⁺_perfd is the universal integral perfectoid ring under the p-complete integral R⁺-algebra S⁺^∧_p. Moreover, for ϖ ∈ R⁺ a pseudouniformizer with compatible roots, T := (S⁺_perfd)^∧_ϖ[1/ϖ] is a perfectoid Tate ring and, with T⁺ the integral closure of (S⁺_perfd)^∧_ϖ in T, (S, S⁺) → (T, T⁺) is universal among maps from (S⁺[1/ϖ], S⁺) to perfectoid Tate pairs (**Gap.** This continuous Tate-pair universal property is not stated in BS22. Its passage from integral universality must still be proved, including continuity and the map on plus rings). In characteristic p, S⁺_perfd is the uncompleted perfection and the ϖ-adic completion is necessary.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P8.18a Integral extensions of perfectoid Huber pairs have affinoid perfectoid diamonds (HJ Lemma 5.10)
- P8.18b A tower finite over a perfectoid tower is perfectoid (HJ Lemma 5.9 (with the remark after it))

Source: [BS22](#source-bs22) §1, Theorem 1.17(1), p. 9; §10, Theorem 10.11, p. 82; §8, Corollary 8.14, p. 70.

*Needs:* [P1.24](#p1-24), [P1.20b](#p1-20), [P4.15](#p4-15).

**Good tower.**

<a id="p8-19"></a>

### 8.19 Good towers

Fix a nonarchimedean field K. A good tower is a cofiltered inverse system (X_i)_{i∈I} of locally noetherian adic spaces over Spa K such that (1) each X_i is the analytification of a projective variety over K and the transition maps are finite; (2) X = lim_i X_i^◇ is a perfectoid space; (3) there are two coverings of X by open affinoid perfectoid subsets U_j, V_j with the closure of U_j contained in V_j for all j, and U_j, V_j the preimages of open affinoids U_{j,i_j}, V_{j,i_j} ⊆ X_{i_j} for some i_j ∈ I.

Provide the interfaces `PerfectoidSpace.GoodTower`, `PerfectoidSpace.GoodTower.limit`, `PerfectoidSpace.GoodTower.isAnalyticallySeparated`.

**Checks.**

- `goodTower_const_point`: For K perfectoid, the constant tower X_i = Spa(K) is good, with U = V = Spa(K); the constant tower X_i = ℙ¹_K is not, because ℙ¹_K is not perfectoid, so condition (2) is not automatic.
- `goodTower_frobenius_P1`: The tower ℙ¹_{ℂ_p} ← ℙ¹ ← ⋯ with transition maps T ↦ T^p is a good tower with limit the perfectoid projective line; the standard discs {|T| ≤ 1}, {|T| ≥ 1} and their slight enlargements give (3).
- `goodTower_isAnalyticallySeparated`: The limit of a good tower is analytically separated, by the projective-tower lemma.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P8.19a Affinoid perfectoids pulled back from finite level form a basis (HJ Lemma 5.11)
- P8.19b Towers finite over good towers are good (HJ Proposition 5.13 (with the note after it))

Source: [HJ](#source-hj) Definition 5.12, p. 32.

*Needs:* [P8.15](#p8-15), [P7.11](#p7-11), `AdicSpacesPartII:R1`.

<a id="p8-20"></a>

### 8.20 Finite quotients of good towers

Let (X_i)_{i∈I} be a good tower with an action of a finite group G (compatible actions on the X_i). Then the categorical quotient X/G of X = lim X_i^◇ is a perfectoid space, and X/G ≅ lim_i X_i/G as diamonds, where X_i/G are the rigid quotients.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P8.20a Limits of towers of opens in projective varieties are analytically separated (HJ Lemma 5.6)

Source: [HJ](#source-hj) Proposition 5.13 (with the note after it), p. 33.

*Needs:* [P8.19](#p8-19).

**Zariski-closed loci in perfectoid towers.**

<a id="p8-21"></a>

### 8.21 Zariski-closed loci of perfectoid towers and their tilde-limit comparison

Let (Y_i)_{i∈I} be a cofiltered inverse system of analytifications of quasi-projective varieties over a nonarchimedean field K with finite transition maps and perfectoid limit Y = lim_i Y_i^◇, Y ~ lim Y_i; let X_i ⊆ Y_i be compatible closed subvarieties (X_j ⊆ X_i ×_{Y_i} Y_j for j ≥ i). Then X = lim_i X_i^◇ is a perfectoid space, X → Y is a Zariski-closed embedding, and X ~ lim X_i.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P8.21a Cofiltered limits of Zariski-closed embeddings into a fixed affinoid perfectoid (HJ Lemma 5.6)
- P8.21b Pullbacks of closed subvarieties to perfectoid spaces are Zariski closed (HJ Lemma 5.7)

Source: [Torsion](#source-torsion) Theorem IV.1.1, p. 67.

*Needs:* [P8.14](#p8-14), [P4.15](#p4-15), [P7.2](#p7-2).

### Examples

The trivial action returns X. The swap action on K × K has diagonal invariants, and its norm of (ϖ,ϖ) is (ϖ²,ϖ²), also at p = 2.

### Dependencies

Layers 1–7; finite group actions, represented v-sheaf quotients and diamond limits from the bundle suppliers; continuous perfectoidization remains an explicit gap.

<a id="p9"></a>

## Layer 9: Continuous torsor descent with coefficients

The pro-étale site of a rigid space with its affinoid perfectoid objects and completed structure sheaves; pro-étale Galois towers with their Čech descent data; descent of O, O⁺ and finite locally free modules along a tower, over smooth and over seminormal bases and after product with a smooth weight space; twisted character sheaves with their finite-level comparison; and flat and derived coefficient change with the vanishing of higher inverse limits.

<a id="p9-1"></a>

### 9.1 Pro-étale site of a rigid space; affinoid perfectoid objects

Let X be a locally noetherian adic space over Spa(k, k°) for a complete nonarchimedean field k ⊇ ℚ_p. Its pro-étale site X_proét has as objects the pro-objects lim U_i of X_ét along cofiltered diagrams with finite étale transition maps from some index on (with the surjectivity convention of the erratum), coverings the families with the pro-étale local surjectivity condition, and a morphism of sites ν : X_proét → X_ét. An object U = lim U_i ∈ X_proét with each U_i = Spa(R_i, R_i⁺) affinoid is affinoid perfectoid if the ϖ-adic completion (R, R⁺) of (colim R_i, colim R_i⁺) with R = R⁺[1/ϖ] is a perfectoid Tate pair; the associated affinoid perfectoid space Û = Spa(R, R⁺) satisfies Û ~ lim U_i. Affinoid perfectoid objects form a basis of X_proét (Sch13 Proposition 4.8 proves this over a perfectoid field K of characteristic 0 and Remark 4.11 extends it to any such k by base change), products of an affinoid perfectoid object with a profinite set are affinoid perfectoid (Corollary 6.6), and the continuous valuations of R correspond to the points of lim |U_i|.

Provide the interfaces `ProEtaleSite`, `ProEtaleSite.IsAffinoidPerfectoid`, `ProEtaleSite.affinoidPerfectoid_basis`.

**Checks.**

- `proEtale_torus_tower`: lim_n Spa k⟨T^{±1/p^n}⟩ is affinoid perfectoid over the torus, with completed ring k⟨T^{±1/p^∞}⟩ (k perfectoid) or its base change.
- `proEtale_profinite_product`: For U affinoid perfectoid and S = ℤ_p, U × S is affinoid perfectoid with ring C(ℤ_p, R).
- `proEtale_not_affinoid_perfectoid`: A constant object Spa k⟨T⟩ (k discretely valued) is not affinoid perfectoid: k⟨T⟩ is not perfectoid.

Source: [Sch13](#source-sch13) §3, Definition 3.9, p. 15; §4, Definition 4.3, Lemma 4.6, pp. 23–24, Proposition 4.8, p. 25, Remark 4.11; §6, Corollary 6.6, p. 36.

*Needs:* [P7.1](#p7-1), [P5.1](#p5-1), AdicEtaleGeometry T024.

<a id="p9-2"></a>

### 9.2 Completed structure sheaves Ô⁺, Ô on affinoid perfectoid objects

On X_proét (P9.1) define O⁺ = ν*O⁺_{X_ét}, O = ν*O_{X_ét}, Ô⁺ = lim_n O⁺/p^n and Ô = Ô⁺[1/p]. For an affinoid perfectoid object U with associated perfectoid pair (R, R⁺) and a pseudouniformizer ϖ: (i) O(U) = colim R_i and O⁺(U) = colim R_i⁺ (uncompleted); (ii) Ô⁺(U) = R⁺ and Ô(U) = R; (iii) (O⁺/ϖ)(U) is almost isomorphic to R⁺/ϖ, and H^i(U, O⁺/ϖ) is almost zero for i > 0 (not among the clauses of Lemma 4.10: it is derived here from P3.21 and the étale–pro-étale comparison); (iv) H^i(U, Ô⁺) is almost zero for i > 0 (Lemma 4.10(v)), hence H^i(U, Ô) = 0 for i > 0; (v) for a profinite set S, Ô⁺(U × S) = C(S, R⁺) and Ô(U × S) = C(S, R) (continuous maps for the ϖ-adic topology). The almost statements are for the ideal of topologically nilpotent elements of K⁺, as in Sch13, which for a pseudouniformizer ϖ ∈ K⁺ with compatible p-power roots is the root ideal of ϖ.

Source: [Sch13](#source-sch13) §4, Definition 4.1, p. 21, and Lemma 4.10, p. 26; §6, Corollary 6.6, p. 36.

*Needs:* [P9.1](#p9-1), [P2.8](#p2-8), [P2.7](#p2-7).

<a id="p9-3"></a>

### 9.3 Pushforward of Ô to the étale site of a smooth rigid space

Let k be a complete discretely valued field of characteristic 0 with perfect residue field of characteristic p, and X a smooth rigid-analytic variety over k, viewed as an adic space. For the morphism of sites ν : X_proét → X_ét (Sch13 Corollary 6.19): ν_* Ô_X = O_{X_ét}; ν_* Ô_X(n) = 0 for n ≥ 1; R¹ν_* Ô_X(1) ≅ Ω¹_{X/k} and R¹ν_* Ô_X(n) = 0 for n ≥ 2, where (n) is the Tate twist by the cyclotomic character. The higher direct images R^iν_* Ô_X for i ≥ 2 and their form after base change to a completed algebraic closure are not targets here. The i = 0 statement is the one used for function descent along Galois towers (P9.6): the functions on X are the pro-étale-locally completed functions that descend.

Source: [Sch13](#source-sch13) §6, Definition 6.8, p. 37, and Corollary 6.19, p. 40; §4, Lemma 4.5 (toric charts).

*Needs:* [P9.2](#p9-2), [P9.1](#p9-1), [P1.31](#p1-31).

**Pro-étale Galois tower.**

<a id="p9-4"></a>

### 9.4 Pro-étale Galois towers with perfectoid limit

Let X be either a locally noetherian adic space over Spa(ℚ_p, ℤ_p) (a rigid space over a complete discretely valued field in the source range) or a perfectoid space, and G a profinite group with a cofinal decreasing sequence of open normal subgroups G_j. A pro-étale G-tower over X is an inverse system (X_j)_j of finite étale G/G_j-Galois covers X_j → X, with compatible right actions, together with a perfectoid space X_∞ with a right G-action and compatible maps X_∞ → X_j such that X_∞ ~ lim_j X_j (tilde-limit; for X perfectoid the X_j are perfectoid and X_∞ = lim_j X_j). Viewed in X_proet (Scholze's pro-étale site for locally noetherian X, the pro-étale site of ECD for perfectoid X), X_∞ = lim_j X_j is a pro-étale G-torsor: X_∞ ×_X X_∞ ≅ X_∞ × \underline{G} via (x, g) ↦ (x, xg). For U ∈ X_proet (in particular U ⊆ X open), U_∞ := U ×_X X_∞ is a pro-étale G-tower over U, affinoid perfectoid when U is affinoid and X_∞ is affinoid perfectoid over it.

Provide the interfaces `ProetaleGaloisTower`, `ProetaleGaloisTower.level`, `ProetaleGaloisTower.torsorIso`.

**Checks.**

- `tower_trivial`: For G = {1} and X perfectoid, X_∞ = X, and invariants are the identity.
- `tower_finite_etale`: For G finite acting freely on a perfectoid Y with Y → X = Y/G finite étale (P8), the constant tower X_j = Y is a pro-étale G-tower and O(Y)^G = O(X).
- `tower_Zp_torus`: Over K = ℂ_p, the torus X = Spa(K⟨T^{±1}⟩) with X_n = Spa(K⟨T^{±1/pⁿ}⟩) and G = ℤ_p(1) acting by T^{1/pⁿ} ↦ ζ_{pⁿ}^γ T^{1/pⁿ} is a pro-étale ℤ_p-tower with X_∞ the perfectoid torus, and O(X_∞)^G = O(X).

Source: [CHJ](#source-chj) unnumbered setup paragraph of §4.1 ('A handy lemma'), p. 28.

*Needs:* AdicEtaleGeometry T052, [P7.2](#p7-2), [P7.12c](#p7-12).

<a id="p9-5"></a>

### 9.5 The Čech descent datum of a pro-étale Galois tower

For a pro-étale G-tower X_∞ → X and U ∈ X_proet with U_∞ affinoid perfectoid, the Čech nerve of U_∞ → U is identified with U_∞ × \underline{G}^n (n ≥ 0), and for F ∈ {Ô⁺_X, Ô_X}: F(U_∞ × \underline{G}^n) = C(G^n, F(U_∞)) (continuous maps, F(U_∞) with its p-adic topology). The descent datum is the continuous G-action on F(U_∞), and the Čech complex of U_∞ → U with coefficients in F is the continuous cochain complex C^•_cts(G, F(U_∞)).

Provide the interfaces `ProetaleGaloisTower.cechNerveIso`, `ProetaleGaloisTower.sections_prod_profinite`, `ProetaleGaloisTower.cechComplexIso`.

**Checks.**

- `cech_trivial_group`: For the trivial group, the normalized Čech complex is concentrated in degree zero with value F(U). The unnormalized complex has a copy in every degree, differentials alternating between zero and the identity, and the same cohomology: H⁰ = F(U), Hⁿ = 0 for n > 0.
- `cech_finite_group`: For G = Z/2 and U_∞ = U ⊔ U, C^0 = F(U)², and the equalizer is the diagonal F(U).
- `cech_equalizer_eq_contInvariants`: The degree-zero cohomology is Mathlib's continuousCohomology H⁰(G, F(U_∞)), identified with invariants by ContinuousCohomology.zeroIso.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P9.5a Invariants commute with the filtered colimits of a Galois tower (CHJ Lemma 2.24)

Source: [BHW](#source-bhw) Lemma 3.7, p. 10.

*Needs:* [P9.4](#p9-4).

**Descent of functions along a perfectoid tower.**

<a id="p9-6"></a>

### 9.6 Descent of O and O⁺ along a pro-étale Galois tower over a smooth rigid space

Let X be a smooth rigid space over a complete discretely valued field k ⊇ ℚ_p with perfect residue field, and X_∞ → X a pro-étale G-tower. For every open (or qcqs étale) U ⊆ X with U_∞ = U ×_X X_∞: O⁺_X(U) = O⁺_{X_∞}(U_∞)^G and O_X(U) = O_{X_∞}(U_∞)^G. These are actual equalities of rings (the equalizer of the Čech datum in degree 0), obtained through almost statements at each finite level.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P9.6a Sections of étale sheaves over a Galois tower are the invariants (CHJ Lemma 2.24)
- P9.6b Continuous group cohomology of the tower computes pro-étale cohomology almost (CHJ Remark 2.25)
- P9.6c Invariants of a uniform Banach algebra under a profinite group (CHJ Proposition 2.22)

Source: [CHJ](#source-chj) Lemma 2.26, p. 20.

*Needs:* [P9.5](#p9-5), [P9.2](#p9-2), [P9.1](#p9-1).

**Descent with weight-space coefficients.**

<a id="p9-7"></a>

### 9.7 Descent of O and O⁺ along a torsor after product with a smooth weight space

Let L₀ ⊇ ℚ_p be a complete discretely valued field with perfect residue field and L ⊇ L₀ a perfectoid field (as in BHW §1.5, where L is a perfectoid extension of ℚ_p^cyc). Let Y be an affinoid adic space over L₀ that is either a smooth rigid space or a perfectoid space, Γ a profinite group, X ∈ Y_proet an affinoid perfectoid pro-étale Γ-torsor with h: X → Y, and 𝒰 a smooth adic space over L. Put X_𝒰 = X ×_{L₀} 𝒰 and Y_𝒰 = Y ×_{L₀} 𝒰. Then for every affinoid V ⊆ Y, with affinoid perfectoid W = h^{-1}(V), and every affinoid 𝒰′ ⊆ 𝒰: O⁺(W × 𝒰′)^Γ = O⁺(V × 𝒰′) and O(W × 𝒰′)^Γ = O(V × 𝒰′). These product affinoids are not a basis of Y_𝒰; the statement is what the character sheaves need, which are sheaves on Y of O_Y ⊗̂ O(𝒰′)-modules.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P9.7a Descent of O and O⁺ along an affinoid perfectoid torsor over a perfectoid base (BHW Lemma 3.7)
- P9.7b Invariants commute with completed tensor products with a Banach space carrying the trivial action (CHJ Lemma 2.23(2))

Source: [BHW](#source-bhw) Lemma 3.7, p. 10.

*Needs:* [P9.6](#p9-6), AdicSpacesPartII R5 (perfectoid times smooth), AdicSpacesPartII R5 (sousperfectoid rings).

<a id="p9-8"></a>

### 9.8 Descent of finite locally free modules and their morphisms, and the limits of degree-zero descent

Let X_∞ → X be a pro-étale G-tower as in the function-descent theorem, and E, F finite locally free O_X-modules (resp. O⁺_X-modules locally free of finite rank)..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

Source: [CHJ](#source-chj) Proposition 2.19, p. 18.

*Needs:* [P9.6](#p9-6).

**Twisted character sheaf.**

<a id="p9-9"></a>

### 9.9 The twisted-invariant character sheaf of a pro-étale tower

Let X_∞ → X be a pro-étale G-tower, A a coefficient algebra (a small ℤ_p-algebra with the mixed completed tensor product, or a reduced affinoid ℚ_p-algebra with ⊗̂_{ℚ_p}), and c: G → (O(X_∞) ⊗̂ A)^× a continuous 1-cocycle for the pullback action, c(γδ) = c(γ)·γ^*(c(δ)) (right action on X_∞, so (γδ)^* = γ^*δ^* on functions). The sheaf ω_c on X is ω_c(U) = {f ∈ O(U_∞) ⊗̂ A : γ^*f = c(γ)^{-1} f for all γ ∈ G}, a sheaf of O_X ⊗̂ A-modules; ω_c⁺ is defined with O⁺ and c valued in (O⁺(X_∞) ⊗̂ A°)^×.

Provide the interfaces `TwistedCharacterSheaf`, `TwistedCharacterSheaf.sections`, `TwistedCharacterSheaf.module`.

**Checks.**

- `twisted_trivial_cocycle`: For c = 1, ω_c = O_X ⊗̂ A (weight-space function descent).
- `twisted_finite_character`: For the ℤ_p(1)-tower on the torus over ℂ_p, with γ^*T^{1/pⁿ} = ζ_{pⁿ}^γ T^{1/pⁿ}, and the finite-order character c(γ) = ζ_{pⁿ}^{−kγ}, ω_c = T^{k/pⁿ}·O_X is free of rank one.
- `twisted_coboundary`: If c(γ) = F/γ^*(F) for a unit F of O(X_∞) ⊗̂ A, then ω_c = F·(O_X ⊗̂ A), matching congr_cocycle with the trivial cocycle.

For a left geometric action, use inverse pullback to obtain the left ring action; direct pullback has the opposite composition order. The following order-three check distinguishes the two conventions, which an involution cannot do.

**Checks.**

- Let ζ ∈ ℂ be a primitive cube root and let right translation act on the three-point torsor ℤ/3ℤ. Pullback sends f = (1, ζ, ζ²) to (ζ, ζ², 1) = ζ f. With c(generator) = ζ^(-1), this is c^(-1)f; ζ^(-1)f gives the wrong value in the first coordinate.
- Zero belongs to every twisted-invariant module. The section 1 belongs for the trivial cocycle, and fails to belong whenever some cocycle value is not 1.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P9.9a Invariants commute with completed tensor products with a profinite flat module carrying the trivial action (CHJ Lemma 2.23)

Source: [CHJ](#source-chj) Definition 2.18, p. 17.

*Needs:* [P9.4](#p9-4), [P9.5](#p9-5), [P9.7](#p9-7).

**Local freeness of character sheaves.**

<a id="p9-10"></a>

### 9.10 Finite-level identification and local freeness of rank one of character sheaves

Let ω_c be a twisted character sheaf on X with A a small or affinoid coefficient algebra, and U ⊆ X an affinoid (rational or an affinoid subdomain). Let G_n ⊴ G be the open normal subgroup with U_n = U_∞/G_n and Γ_n = G/G_n the finite quotient. Suppose that c(γ) = (γ^*u/u)·c_n(γ) for a unit u ∈ (O(U_∞) ⊗̂ A)^× and a 1-cocycle c_n of Γ_n with values in (O(U_n) ⊗̂ A)^× (inflated to G). Then f ↦ f·u is an O(U) ⊗̂ A-isomorphism from ω_c(U) onto the c_n-twisted invariants (O(U_n) ⊗̂ A)^{Γ_n, c_n} = {f₀ : c_n(γ)γ^*f₀ = f₀}.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P9.10a Finite-group form of faithfully flat module descent (CHJ Theorem 2.28)
- P9.10b Units at infinite level are finite-level units up to a unit close to 1 (CHJ Proposition 2.27)
- P9.10c An integral unit eigenfunction trivialises the integral character sheaf (BHW Theorem 4.8, proof, p. 18)
- P9.10d Flat coefficient change: reduction modulo a regular element (CHJ Lemma 2.29)
- P9.10e Derived coefficient change for a nonflat quotient, with the Tor correction (CHJ Lemma 2.29)
- P9.10f Pro-étale coefficient sheaves from profinite modules with continuous action (CHJ Lemma 4.1)
- P9.10g Vanishing of higher inverse limits for coefficient systems on towers (CHJ Proposition 4.4 (proof))

**Gap.** The finite-level identification is conditional on the displayed unit and finite-level cocycle. Global local freeness, acyclicity and coefficient change are restricted to the established AdicSpacesPartII coefficient range or require those properties as explicit hypotheses; an infinite pseudobasis alone does not supply them.

Source: [CHJ](#source-chj) unnumbered paragraph after Proposition 2.27 (cocycle j_{U,n}, idempotent e_n), p. 21; j_{U,n} and e_n are displayed on p. 22.

*Needs:* [P9.9](#p9-9), [P9.7](#p9-7), [P9.9a](#p9-9).

<a id="p9-11"></a>

### 9.11 Sheaf equalizers after smooth coefficient base change

Let K be a perfectoid field of mixed characteristic, Y an affinoid smooth rigid or affinoid perfectoid space over K, X → Y an affinoid perfectoid pro-étale profinite Γ-torsor, and 𝒰 a smooth rigid space over a perfectoid extension of K. For h_𝒰: X ×_K 𝒰 → Y ×_K 𝒰, the intended source target is (h_𝒰* O)^Γ = O and (h_𝒰* O⁺)^Γ = O⁺ as sheaves on the whole product. Equivalently the equalities hold on every open of Y ×_K 𝒰, with invariants of sections of its full preimage..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Gap.** The cited lemma concerns the entire product sheaf. A proof through product affinoids alone does not establish this statement: product opens need not form a basis. The needed rational-open comparison or a ringed-site descent supplier is not specified.

Source: [BHW](#source-bhw) Lemma 3.7, p. 10.

*Needs:* [P9.7](#p9-7).

<a id="p9-12"></a>

### 9.12 Function descent over a seminormal rigid base

Let K be a complete nonarchimedean field of mixed characteristic, Y a seminormal rigid analytic space over K, and X_∞ → Y a prescribed pro-étale G-tower with perfectoid limit. Then O_Y = (h* O_X∞)^G and O⁺_Y = (h* O⁺_X∞)^G on analytic opens..

**Gap.** The full conclusion and its remaining hypotheses are not specified here.

**Gap.** KL16 Theorem 8.2.3 proves the rational structure-sheaf comparison. The application to a prescribed torsor requires that comparison as an exact supplier, including its seminormalization and resolution inputs. The displayed integral O⁺ equality requires a separate boundedness comparison, which is not stated by that theorem.

Source: [KL16](#source-kl16) Theorem 8.2.3 and proof, pp. 162–163 (PDF pp. 162–163).

*Needs:* [P9.5](#p9-5).

<a id="p9-13"></a>

### 9.13 Integral effectivity in arbitrary finite rank

Let h: X_∞ → X be a prescribed pro-étale G-tower with actual O⁺ function descent. Let N⁺ be a locally free finite-rank O⁺_X∞-module with continuous semilinear G-action. Suppose X has an open cover U_i such that N⁺ on h⁻¹U_i is free of rank r_i and, in a chosen integral frame, its action is v ↦ C_i(g)g(v), with C_i(g) ∈ GL_r_i(O⁺(h⁻¹U_i)) satisfying C_i(gh) = C_i(g)g(C_i(h)). Assume there is P_i ∈ GL_r_i(O⁺(h⁻¹U_i)) with C_i(g)g(P_i) = P_i for all g. Then E⁺ = (h* N⁺)^G is locally free of rank r_i over O⁺_X and the canonical map h⁻¹E⁺ ⊗ O⁺_X∞ → N⁺ is an isomorphism.

**Companion contracts.** These related results also require exact hypotheses and complete statements:
- P9.13a Integral fixed points of completed lattice tensors (CHJ Lemma 2.23(2))

Source: [BHW](#source-bhw) Theorem 4.8, proof, p. 18.

*Needs:* [P9.6](#p9-6).
### Examples

A trivial torsor gives ordinary functions. The order-three character check fixes the inverse cocycle, and a coboundary gives a rank-one module generated by its trivializing unit.

### Dependencies

Layers 0–8; the rigid pro-étale site and continuous cohomology; coefficient products and mixed completed tensors from AdicSpacesPartII; finite Galois descent.

## Downstream consumers

AdicEtaleGeometry consumes the perfectoid comparison for its étale theory. DiamondsAndVStacks consumes the pro-étale morphisms, limits, and finite quotients. Perfectoid Shimura-variety and modular-form roadmaps consume the tower constructions and coefficient descent. The general prismatic and derived perfectoidization theory belongs to its own roadmaps.

## References

Locators are theorem and section numbers of the linked versions, with page numbers of the linked manuscripts where they are stable.

<a id="source-gr"></a>
- **GR**: [Ofer Gabber and Lorenzo Ramero, Almost ring theory, LNM 1800 (2003); arXiv:math/0201175v3](https://arxiv.org/abs/math/0201175).
<a id="source-sch12"></a>
- **Sch12**: [Peter Scholze, Perfectoid spaces, Publ. IHÉS 116 (2012); arXiv:1111.4914](https://arxiv.org/abs/1111.4914).
<a id="source-ecd"></a>
- **ECD**: [Peter Scholze, Étale cohomology of diamonds, arXiv:1709.07343v4](https://arxiv.org/abs/1709.07343).
<a id="source-bhatt"></a>
- **Bhatt**: [Bhargav Bhatt, Lecture notes for a class on perfectoid spaces (2017)](https://www.math.ias.edu/~bhatt/teaching/mat679w17/lectures.pdf).
<a id="source-berkeley"></a>
- **Berkeley**: [Peter Scholze and Jared Weinstein, Berkeley lectures on p-adic geometry, Annals of Math. Studies 207 (2020); author manuscript](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf).
<a id="source-kl15"></a>
- **KL15**: [Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: foundations, Astérisque 371 (2015); arXiv:1301.0792](https://arxiv.org/abs/1301.0792).
<a id="source-aws"></a>
- **AWS**: [Kiran Kedlaya, Sheaves, stacks, and shtukas (Arizona Winter School 2017 notes)](https://kskedlaya.org/papers/aws-notes.pdf).
<a id="source-aws17"></a>
- **AWS17**: [Kiran Kedlaya, Sheaves, stacks, and shtukas, AWS 2017, version dated 10 March 2017](https://swc-math.github.io/aws/2017/2017KedlayaNotes.pdf). Its numbering differs from the author-hosted AWS version.
<a id="source-kl16"></a>
- **KL16**: [Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory, II: imperfect period rings, arXiv:1602.06899v3](https://arxiv.org/abs/1602.06899).
<a id="source-kbf"></a>
- **KBF**: [Kiran Kedlaya, On commutative nonarchimedean Banach fields, Doc. Math. 23 (2018); arXiv:1602.09004](https://arxiv.org/abs/1602.09004).
<a id="source-bms"></a>
- **BMS**: [Bhargav Bhatt, Matthew Morrow and Peter Scholze, Integral p-adic Hodge theory, Publ. IHÉS 128 (2018); arXiv:1602.03148v3](https://arxiv.org/abs/1602.03148).
<a id="source-stacks"></a>
- **Stacks**: [The Stacks Project authors, The Stacks Project (stable tags)](https://stacks.math.columbia.edu).
<a id="source-sch13"></a>
- **Sch13**: [Peter Scholze, p-adic Hodge theory for rigid-analytic varieties, Forum Math. Pi 1 (2013); arXiv:1205.3463v2](https://arxiv.org/abs/1205.3463).
<a id="source-sch13e"></a>
- **Sch13E**: [Peter Scholze, Erratum to 'p-adic Hodge theory for rigid-analytic varieties'](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf).
<a id="source-hk"></a>
- **HK**: [David Hansen and Kiran Kedlaya, Sheafiness criteria for Huber rings](https://kskedlaya.org/papers/criteria.pdf).
<a id="source-wedhorn"></a>
- **Wedhorn**: [Torsten Wedhorn, Adic spaces, arXiv:1910.05934v1](https://arxiv.org/abs/1910.05934).
<a id="source-elkik"></a>
- **Elkik**: [Renée Elkik, Solutions d'équations à coefficients dans un anneau hensélien, Ann. Sci. ÉNS 6 (1973)](http://www.numdam.org/item/ASENS_1973_4_6_4_553_0/).
<a id="source-torsion"></a>
- **Torsion**: [Peter Scholze, On torsion in the cohomology of locally symmetric varieties, Ann. of Math. 182 (2015); arXiv:1306.2070v2](https://arxiv.org/abs/1306.2070).
<a id="source-huber93"></a>
- **Huber93**: [Roland Huber, Continuous valuations, Math. Z. 212 (1993)](https://gdz.sub.uni-goettingen.de/id/PPN266833020_0212).
<a id="source-sw13"></a>
- **SW13**: [Peter Scholze and Jared Weinstein, Moduli of p-divisible groups, Camb. J. Math. 1 (2013); arXiv:1211.6357v2](https://arxiv.org/abs/1211.6357).
<a id="source-survey"></a>
- **Survey**: [Peter Scholze, Perfectoid spaces: a survey, arXiv:1303.5948](https://arxiv.org/abs/1303.5948).
<a id="source-bhw"></a>
- **BHW**: [Christopher Birkbeck, Ben Heuer and Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties, Ann. Inst. Fourier (2023); arXiv:1902.03985](https://arxiv.org/abs/1902.03985).
<a id="source-chj"></a>
- **CHJ**: [Przemysław Chojecki, David Hansen and Christian Johansson, Overconvergent modular forms and perfectoid Shimura curves, Doc. Math. 22 (2017); arXiv:1507.04875](https://arxiv.org/abs/1507.04875).
<a id="source-ces"></a>
- **Čes**: [Kęstutis Česnavičius, Purity for the Brauer group, Duke Math. J. 168 (2019); arXiv:1711.06456v4](https://arxiv.org/pdf/1711.06456v4).
<a id="source-hj"></a>
- **HJ**: [David Hansen and Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures, arXiv:2011.03951](https://arxiv.org/abs/2011.03951).
<a id="source-hansen"></a>
- **Hansen**: [David Hansen, Quotients of adic spaces by finite groups, Math. Res. Lett. 28 (2021); author manuscript](http://davidrenshawhansen.net/adicgpquotient.pdf).
<a id="source-cgj"></a>
- **CGJ**: [Ana Caraiani, Daniel Gulotta and Christian Johansson, Vanishing theorems for Shimura varieties at unipotent level, J. Eur. Math. Soc. (2022); arXiv:1910.09214](https://arxiv.org/abs/1910.09214).
<a id="source-bs22"></a>
- **BS22**: [Bhargav Bhatt and Peter Scholze, Prisms and prismatic cohomology, Ann. of Math. 196 (2022); arXiv:1905.08229v4](https://arxiv.org/abs/1905.08229).
<a id="source-sga1"></a>
- **SGA1**: [Alexander Grothendieck et al., Revêtements étales et groupe fondamental (SGA 1), arXiv:math/0206203](https://arxiv.org/abs/math/0206203).
<a id="source-illusie"></a>
- **Illusie**: [Luc Illusie, Complexe cotangent et déformations I, LNM 239 (1971)](https://doi.org/10.1007/BFb0059052).
<a id="source-berkovich"></a>
- **Berkovich**: [Vladimir Berkovich, Spectral theory and analytic geometry over non-Archimedean fields, AMS Surveys 33 (1990)](https://bookstore.ams.org/surv-33).
<a id="source-huber96"></a>
- **Huber96**: [Roland Huber, Étale cohomology of rigid analytic varieties and adic spaces, Aspects of Math. E30 (1996)](https://doi.org/10.1007/978-3-663-09991-8).
