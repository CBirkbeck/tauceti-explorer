# Perfectoid rings and spaces

Perfectoid spaces are the adic spaces on which Frobenius can be inverted: locally they are the adic spectra of perfectoid Tate rings, complete uniform Tate rings with a pseudouniformizer ϖ such that ϖ^p divides p and Frobenius is an isomorphism from R°/ϖ to R°/ϖ^p. This roadmap builds their theory in that generality (characteristic 0 or p, no perfectoid base field): almost mathematics over an arbitrary basic setup; perfectoid Tate rings, their tilts, Fontaine's θ and the classification of untilts by primitive ideals; the tilting homeomorphism of adic spectra, perfectoid rational localisation, the sheaf theorem with almost acyclicity of O⁺, and perfectoid spaces with fibre products; the almost purity theorem and the étale site with its tilting equivalence; injections, immersions, Zariski closed immersions and separatedness; cofiltered limits of affinoid perfectoids and finite-stage descent of étale objects; κ-small perfectoid spaces and the pro-étale calculus; tilde-limits and Frobenius-controlled towers; finite group quotients and closed perfectoid loci in towers; and descent of functions, modules and character sheaves along profinite Galois towers with rigid coefficient spaces.

Everything rests on Tau Ceti's Huber rings and adic spaces (the AdicSpaces roadmap and its implementation under `TauCeti.RingTheory.Huber` and `TauCeti.AlgebraicGeometry.AdicSpace`) and on Mathlib's Witt vectors, perfection, `PreTilt` and `WittVector.fontaineTheta`. The outputs are the geometric inputs of pro-étale descent and diamonds (DiamondsAndVStacks), of the étale geometry of adic spaces beyond the noetherian case (AdicEtaleGeometry), and of the perfectoid Shimura varieties and period spaces downstream.

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

## Prerequisites and boundaries

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The prerequisites beside each target name the declarations, the earlier target or the layer that supply its inputs. Existing definitions keep their library namespaces.

Tau Ceti already has, and this roadmap uses without restating: Huber rings, Tate rings, pseudouniformizers, pairs of definition, the power-bounded subring, boundedness, uniformity and stable uniformity, rings of integral elements and Huber pairs with their morphisms (`TauCeti.Huber.IsHuberRing`, `IsTateRing`, `IsPseudoUniformizer`, `PairOfDefinition`, `powerBoundedSubring`, `IsBounded`, `IsStablyUniform`, `IsRingOfIntegralElements`, `Pair`, `Pair.Hom`); the open mapping theorem for Tate rings (`IsTateRing.isOpenMap`); restricted power series and strongly noetherian Tate rings; the valuation spectrum, `Cont`, `Spa` with its rational subsets and spectrality (`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`); completed rational localisation with its universal property; the structure presheaf, its stalks and residue-field valuations; pre-adic spaces, open immersions and gluing; sheafiness and Tate acyclicity for strongly noetherian and stably uniform Tate pairs; and the perfectoid-field input and `A_inf = W(𝒪_F)` of the Fargues–Fontaine curve (AdicSpaces Layers 0–6). From Mathlib it uses `WittVector`, `WittVector.teichmuller`, `Perfection`, `PreTilt`, `PreTilt.untilt`, `WittVector.fontaineTheta` with `surjective_fontaineTheta`, `HenselianRing` and `HenselianLocalRing`, `Algebra.Etale`, `FiniteEtale` (the category of finite étale algebras), `Module.Flat`, `Module.FaithfullyFlat`, `IsAdicComplete`, `AdicCompletion`, `KaehlerDifferential`, `Algebra.Extension.Cotangent`, the Serre-class localisation of abelian categories, `CategoryTheory.Sheaf.H` and the Čech machinery, and the cardinal arithmetic of `Cardinal.IsRegular` and `Cardinal.IsStrongLimit`. Where a target here is a variant of a Tau Ceti statement, its entry says in one clause how it differs: the tilt R♭ is defined for every perfectoid Tate ring and compared with `PreTilt`, which is defined on the integral level; perfectoid Tate pairs are Tau Ceti Huber pairs whose ring is perfectoid, not a new carrier; and the Čech acyclicity of O on perfectoid affinoids is the stably-uniform case of Tau Ceti's Buzzard–Verberkmoes theorem, which this roadmap applies rather than reproves.

Three statements this roadmap needs already exist and are cited rather than restated: uniform Tate rings are reduced (`TauCeti.Huber.IsUniform.isReduced`, used by P1 for perfectoid rings), the henselisation of a pair with its universal property, flatness and filtered-colimit compatibility (`SchemeAndStackFoundations:SF.0/henselization` and its neighbours), and finite étale algebras over a filtered colimit of rings (`AdicEtaleGeometry:A4/finite-etale-algebras-filtered-colimit`). Supporting results below that have a library core build on it: the (p, [ϖ])-adic completeness and separatedness of W(R⁺) for a perfect ϖ-adically complete R⁺ (`TauCeti.WittVector.isAdicComplete_span_p_teichmuller`, `isHausdorff_span_p_teichmuller`, `TauCeti.Huber.isHuberRing_adicTopology_span_p_teichmuller`), the homeomorphism Spa of a completion ≅ Spa (`TauCeti.ValuationSpectrum.spaCompletionHomeomorph`), spectrality of `spaComap` for Tate sources (`TauCeti.ValuationSpectrum.isSpectralMap_spaComap_of_isTateRing`), lifting of idempotents along henselian pairs (`TauCeti.HenselianRing.exists_isIdempotentElem_sub_mem`), henselianity of adically complete pairs (`IsAdicComplete.henselianRing`), the cofinality of a directed family of closed subgroups of a compact group (`Subgroup.exists_le_of_iInf_le_of_directed`), the multiplicative perfection equivalence (`Perfection.quotientMulEquiv`), and the finite étale Galois torsors and their `|Spa B|/G ≅ |Spa A|` of `AdicEtaleGeometry:A4` (`finite-etale-galois-torsor`, `torsor-spa-orbits`), of which P8's quotient theorems are the non-free generalisation. Mathlib has no statement about the kernel of `fontaineTheta`; the primitive-kernel theorem of P1 is new.

| Supplier | Interface used here |
| --- | --- |
| AdicSpaces Layers 0–1 | Tate rings, pseudouniformizers, bounded sets, pairs of definition, completion, valuation spectra and continuous valuations |
| AdicSpaces Layers 2–3 | Huber pairs, `Spa`, rational subsets, completed rational localisation, structure presheaf, stalks, residue fields, pre-adic spaces |
| AdicSpaces Layers 4–5 | Stable uniformity and Buzzard–Verberkmoes sheafiness, Tate acyclicity, adic spaces, open and closed subspaces, gluing |
| AdicSpaces Layer 6 | The perfect field F with its `A_inf`, compared with the tilt of a perfectoid field in P1 |
| ModularCurves Layer 0e | Effective faithfully flat descent of modules and algebras, transported to almost modules in P0 |
| `AdicEtaleGeometry:A0`, `A1`, `A3` | Fibre products of analytic adic spaces, étale and finite étale morphisms of adic spaces with the étale site, the pro-étale site convention, and affinoid étale approximation at a finite stage |
| `AdicSpacesPartII:R0`, `R1`, `R3`, `R5` | Completed tensor products and uniform completed tensor products, analytification, spectral seminorms, finite projective modules and trace forms over sheafy Tate rings, sousperfectoid rings and mixed completed tensor products with their coefficient sheaves |
| `DiamondsAndVStacks:D0`, `D2`–`D6` | Cofiltered limits of spectral spaces, the cutoff cardinal and pro-categories, Čech-to-derived comparison, v-descent of functions, locally profinite torsors, spatial diamonds and the diamond functor `Spd` |
| `SchemeAndStackFoundations` | Scheme-theoretic smoothness, étale algebra structure schemes and the henselisation of pairs used in P3 |

The boundaries with the neighbouring roadmaps are as follows. AdicEtaleGeometry defines étale morphisms of general analytic adic spaces; P3 defines them for perfectoid spaces and proves the comparison. DiamondsAndVStacks constructs pro-étale and v-topologies on perfectoid spaces and the diamonds; P6 constructs the pro-étale morphisms themselves and the κ-small calculus they need, and P8 proves the quotient statements that identify the represented v-sheaf of a finite quotient. AdicSpacesPartII owns the completed tensor product of Tate rings and the sousperfectoid coefficient theory; P2 proves that completed tensor products of perfectoid rings are perfectoid, and P9 proves the torsor descent with coefficients. Prismatic cohomology, quasisyntomic rings and the general perfectoidization of animated rings are not targets here: P4 and P8 state exactly the perfectoidization statements they need (initial integral perfectoid rings under semiperfectoid rings and under integral extensions of integral perfectoid rings). The locally analytic distribution theory on the coefficient spaces of P9 and the Shimura-variety applications of P7–P9 belong to the roadmaps that consume this one.

## Conventions

Fix a prime p. A perfectoid Tate ring is complete and Hausdorff, uniform, and has a pseudouniformizer ϖ with ϖ^p | p in R° such that Frobenius R°/ϖ → R°/ϖ^p is an isomorphism; injectivity of Frobenius is automatic and the condition does not depend on ϖ. No perfectoid base field is fixed; statements that hold only over a perfectoid field say so. A perfectoid Tate pair (R, R⁺) is a Tau Ceti Huber pair with R perfectoid; R° is its maximal ring of integral elements and R°° the topologically nilpotent elements. `Perfd` denotes perfectoid spaces of all characteristics and `Perf` its characteristic-p subcategory; `X♭` is the tilt, `♯` the sharp map, which is multiplicative and continuous but not additive. Almost mathematics is always with respect to a stated basic setup (V, m): m idempotent with m ⊗_V m flat; for a perfectoid Tate ring the setup is (R°, R°°), equivalently the root ideal (ϖ^{1/p^∞}) of a pseudouniformizer with compatible p-power roots, and the two setups on R⁺ ⊆ R° are compared explicitly. "Almost zero", "almost isomorphism", "almost finite étale" and "almost acyclic" are relative to that setup; an almost statement is never silently upgraded to an actual one.

Rings of integral elements are open, integrally closed and contained in R°; completed colimits of Tate pairs complete the colimit of the plus rings ϖ-adically and invert ϖ. "qcqs" means quasicompact and quasiseparated; morphisms of perfectoid spaces are morphisms of adic spaces. Tilde-limits carry both the topological condition and the affinoid density condition. Cardinals: κ-smallness is tested on affinoid covers, and uniformly κ-small means κ-small with a κ-small affinoid cover; the cutoff cardinals are strong limits and may be singular. Finite group quotients are categorical quotients in adic spaces, not finite étale torsors unless the action is free. Pro-étale Galois towers have profinite group G with the tower's finite levels indexed by open normal subgroups.

API names are the interfaces to implement; the examples record behaviour a definition must have and cases it must distinguish. [Suggested.lean](Suggested.lean) gives suggested typed forms for a representative part of the targets; the statements here are the specification.

## Sources and locators

Locators are theorem and section numbers of the linked versions, with page numbers of the linked manuscripts where they are stable.

<a id="source-gr"></a>
- **GR**: [Ofer Gabber and Lorenzo Ramero, Almost ring theory, LNM 1800 (2003); arXiv:math/0201175v3](https://arxiv.org/abs/math/0201175).
<a id="source-sch12"></a>
- **Sch12**: [Peter Scholze, Perfectoid spaces, Publ. IHÉS 116 (2012); arXiv:1111.4914](https://arxiv.org/abs/1111.4914).
<a id="source-ecd"></a>
- **ECD**: [Peter Scholze, Étale cohomology of diamonds, arXiv:1709.07343v4](https://arxiv.org/abs/1709.07343).
<a id="source-bhatt"></a>
- **Bhatt**: [Bhargav Bhatt, Lecture notes for a class on perfectoid spaces (2017)](http://www-personal.umich.edu/~bhattb/teaching/mat679w17/lectures.pdf).
<a id="source-berkeley"></a>
- **Berkeley**: [Peter Scholze and Jared Weinstein, Berkeley lectures on p-adic geometry, Annals of Math. Studies 207 (2020); author manuscript](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf).
<a id="source-kl15"></a>
- **KL15**: [Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: foundations, Astérisque 371 (2015); arXiv:1301.0792](https://arxiv.org/abs/1301.0792).
<a id="source-aws"></a>
- **AWS**: [Kiran Kedlaya, Sheaves, stacks, and shtukas (Arizona Winter School 2017 notes)](https://kskedlaya.org/papers/aws-notes.pdf).
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

<a id="p0"></a>

## P0: Almost mathematics over a basic setup

Almost mathematics is developed over an abstract basic setup, so that it can be instantiated later for (R°, R°°) and for the root ideal of a pseudouniformizer without circularity. The almost category is the Serre-quotient of V-modules by almost zero modules, with the functors of almost elements and the left adjoint, the closed symmetric monoidal structure, almost algebras, almost finite generation and presentation, flatness, projectivity and finite étaleness, the almost cotangent complex with its deformation theory, faithfully flat descent, tight henselian pairs with lifting of finite étale algebras, completion and inversion of an element of m, and almost sheaf cohomology.

### Basic setup

<a id="p0-1"></a>#### P0.1 — Basic setup (V, m): an idempotent ideal with flat m ⊗ m

A basic setup is a pair S = (V, m) of a commutative ring V and an ideal m ⊆ V such that (i) m is idempotent, m·m = m (Mathlib `IsIdempotentElem m` in the semiring `Ideal V`), and (ii) the V-module m̃ := m ⊗_V m is flat. Condition (i) is Gabber–Ramero's basic setup (GR (2.1.1)); condition (ii) is the flatness GR assume from (2.5.14) on, imposed here once for all almost mathematics of this roadmap. Pinned conventions: a V-module M is almost zero if m·M = 0; a V-linear map is an almost isomorphism if its kernel and cokernel are almost zero; m̃ always denotes the tensor product m ⊗_V m (it maps onto m·m = m, isomorphically when m is flat); the classical limit is m = V. A basic setup is data, not a type class, because one ring carries several setups (for a perfectoid Tate ring R, (R°, R°°) and (R⁺, the root ideal of a pseudouniformiser), compared in PerfectoidSpaces:P1).

**Hypotheses.** V is a commutative ring (Lean: `[CommRing V]` in universe u); m is an ideal of V.

**API.** `Almost.BasicSetup`, `Almost.BasicSetup.tilde`, `Almost.BasicSetup.ideal_mul_self`.

**Examples.** `BasicSetup.test_classical` (For every commutative ring V, `BasicSetup.classical V` (ideal = …) `BasicSetup.test_zero_ideal` (For every V, (V, ⊥) is a basic setup ((⊥)·(⊥) = ⊥, ⊥ ⊗ ⊥ = 0 is …) `BasicSetup.test_not_dvr` (For V = ℤ_[p] and m = maximal ideal: m * m ≠ m, so there is no …)

**Sources.** [GR](#source-gr) §2.1, (2.1.1), p. 7.

**Prerequisites.** `mathlib:IsIdempotentElem`, `mathlib:Module.Flat`, `mathlib:Ideal.span`.

<a id="p0-2"></a>#### P0.2 — The basic setup of an element with compatible p-power roots

Let V be a commutative ring, p ≥ 2 an integer and (ϖ_n)_{n≥0} a sequence in V with ϖ_{n+1}^p = ϖ_n for all n; put ϖ := ϖ_0 and m := ⋃_n ϖ_n V = Ideal.span {ϖ_n}. Then (V, m) is a basic setup, the root setup of (ϖ_n): m is the increasing union of the principal ideals ϖ_n V, m·m = m, and m̃ is flat by condition (A). A V-module M is almost zero for it iff ϖ_n M = 0 for all n.

**API.** `Almost.BasicSetup.ofCompatibleRoots`, `Almost.BasicSetup.ofCompatibleRoots_ideal`, `Almost.BasicSetup.mem_ofCompatibleRoots_ideal`.

**Examples.** `BasicSetup.ofCompatibleRoots_test_perfect_polynomial`, `BasicSetup.ofCompatibleRoots_test_unit`, `BasicSetup.ofCompatibleRoots_test_no_roots`.

**Supporting results.**
- P0.2a Almost zero modules and almost isomorphisms are … (GR Remark 2.1.4(i))
- P0.2b Condition (A) implies that m ⊗ m is flat (GR (2.1.6) and Proposition 2.1.7(i))

**Sources.** [ECD](#source-ecd) §3, Definition 3.21, p. 18.

**Prerequisites.** [P0.1](#p0-1).

<a id="p0-3"></a>#### P0.3 — The basic setup (K°, K°°) of a valuation ring with non-principal …

Let V be a valuation ring (a domain in which the ideals are totally ordered; […] Then (V, m) is a basic setup: m·m = m, m is torsion-free hence flat, and m̃ ≅ m. A V-module is almost zero iff it is killed by m, iff it is a vector space over the residue field k = V/m; in particular k is almost zero. This is the setup of Sch12 §4 and of GR Example 2.1.2(i).

**API.** `Almost.BasicSetup.ofValuationRing`, `Almost.BasicSetup.ofValuationRing_ideal`, `Almost.BasicSetup.isIdempotentElem_maximalIdeal_iff`.

**Examples.** `BasicSetup.ofValuationRing_test_Cp`, `BasicSetup.ofValuationRing_test_dvr`, `BasicSetup.ofValuationRing_test_field`.

**Sources.** [GR](#source-gr) §2.1, Example 2.1.2(i), p. 7.

**Prerequisites.** [P0.1](#p0-1).

<a id="p0-4"></a>#### P0.4 — Firm modules: a small-hom model of the almost category

Let S = (V, m) be a basic setup (m̃ = m ⊗_V m flat). A V-module M is firm if the multiplication map m̃ ⊗_V M → M is an isomorphism; firm modules form a full subcategory S.Firm of ModuleCat V, closed under kernels, cokernels and finite biproducts (hence abelian, with exact inclusion j_!).

**API.** `Almost.BasicSetup.IsFirm`, `Almost.BasicSetup.Firm`, `Almost.BasicSetup.firm`.

**Examples.** `BasicSetup.Firm.test_tilde`, `BasicSetup.Firm.test_ring_not_firm`, `BasicSetup.Firm.test_classical`.

**Supporting results.**
- P0.4a m̃ ⊗ m ≅ m̃ and m̃ ⊗ m̃ ≅ m̃; (GR Claim 2.1.10 and its proof)
- P0.4b Almost zero modules form a Serre class (Sch12 Lemma 4.2)

**Sources.** [Bhatt](#source-bhatt) §4.1, Construction 4.1.5, p. 18.

**Prerequisites.** [P0.1](#p0-1).

### Almost modules

<a id="p0-5"></a>#### P0.5 — Almost modules over a basic setup: the Serre quotient V^a-Mod

For a basic setup S = (V, m), the category of almost V-modules V^a-Mod := Almost.Module S is the localization of ModuleCat V at the almost isomorphisms S.almostZero.isoModSerre (maps with almost zero kernel and cokernel), i.e. the Serre quotient of V-modules by the almost zero modules, realised with Mathlib's Serre-class localization: the carrier is `MorphismProperty.Localization'` for the `HasLocalization.{u}` instance of P0.4, so Hom-types are V-modules in the universe of V-modules. The localization functor M ↦ M^a (`Almost.toAlmost S`) is exact and essentially surjective; M^a ≅ 0 iff M is almost zero; f^a is an isomorphism iff f is an almost isomorphism; V^a-Mod is abelian (Mathlib `SerreClassLocalization.abelian`); a functor G out of V^a-Mod to an abelian category is exact iff G ∘ (−)^a is, and an exact functor out of ModuleCat V factors (uniquely up to unique isomorphism) through (−)^a iff it kills almost zero modules. For a perfectoid field K and S = (K°, K°°) this is Sch12's K°a-mod; for a perfectoid Tate ring R, PerfectoidSpaces:P1 instantiates S with (R°, R°°) and (R⁺, root ideal) (ECD Definition 3.23).

**API.** `Almost.Module`, `Almost.toAlmost`, `Almost.toAlmost_isLocalization`.

**Examples.** `Almost.Module.test_residue_field` (For S = ofValuationRing 𝒪_{ℂ_p}: (toAlmost S).obj (ModuleCat.of …) `Almost.Module.test_classical` (For S = classical V, toAlmost S is an equivalence of categories …) `Almost.Module.test_zero_setup` (For the setup (V, ⊥) every object of Almost.Module S is a zero …)

**Sources.** [Sch12](#source-sch12) §4, Definition 4.3, p. 18.

**Prerequisites.** [P0.4b](#p0-4), [P0.4](#p0-4), `mathlib:CategoryTheory.ObjectProperty.isoModSerre`.

<a id="p0-6"></a>#### P0.6 — Almost elements M_* and the left adjoint M_! of almostification

For a basic setup S = (V, m): (i) the functor of almost elements (−)_* : Almost.Module S → ModuleCat V, M_* := Hom_{V^a}(V^a, M) with its V-module structure, is right adjoint to M ↦ M^a, with counit (M_*)^a → M an isomorphism (so (−)_* is fully faithful) and (N^a)_* ≅ Hom_V(m̃, N) naturally; (ii) (−)_! : Almost.Module S → ModuleCat V, M_! := m̃ ⊗_V M_*, is left adjoint to M ↦ M^a with unit M → (M_!)^a an isomorphism (so (−)_! is fully faithful), and it …

**API.** `Almost.Module.elements`, `Almost.Module.adjElements`, `Almost.Module.elementsCounitIso`.

**Examples.** `Almost.Module.elements_test_valuation`, `Almost.Module.elements_test_not_identity`, `Almost.Module.elements_test_classical`.

**Supporting results.**
- P0.6a Hom(M^a, N^a) = Hom_V(m̃ ⊗ M, N) (GR (2.2.4))

**Sources.** [GR](#source-gr) §2.2, Proposition 2.2.13(ii), p. 14.

**Prerequisites.** [P0.5](#p0-5).

<a id="p0-7"></a>#### P0.7 — The closed symmetric monoidal structure on almost modules

For a basic setup S = (V, m), Almost.Module S carries the symmetric monoidal structure localized from ModuleCat V (Mathlib `LocalizedMonoidal` for the monoidal class of almost isomorphisms, P0.7a), with unit V^a (≅ m^a): the localization functor M ↦ M^a is symmetric monoidal, M^a ⊗ N^a ≅ (M ⊗_V N)^a, and M ⊗ N ≅ (M_* ⊗_V N_*)^a ≅ (M_! ⊗_V N_!)^a. The tensor product is right exact in each variable.

**API.** `Almost.isoModSerre_isMonoidal`, `Almost.Module.monoidalCategory`, `Almost.Module.symmetricCategory`.

**Examples.** `Almost.Module.tensor_test_residue`, `Almost.Module.tensor_test_unit`, `Almost.Module.tensor_test_mathlib`.

**Supporting results.**
- P0.7a Almost isomorphisms are stable under tensor … (GR (2.2.5))

**Sources.** [Sch12](#source-sch12) §4, Proposition 4.5, p. 19.

**Prerequisites.** [P0.6a](#p0-6).

<a id="p0-8"></a>#### P0.8 — Almost algebras (commutative monoids in V^a-Mod) and their modules

For a basic setup S = (V, m), an almost V-algebra is a commutative unital monoid object in the symmetric monoidal category Almost.Module S: Almost.Algebra S := CommMon (Almost.Module S) (Mathlib), with monoid morphisms. For an almost algebra A, A_* = Hom(V^a, A) is a commutative V-algebra (a·b := μ ∘ (a ⊗ b) ∘ ν⁻¹);

**API.** `Almost.Algebra`, `Almost.Algebra.toAlmost`, `Almost.Algebra.elements`.

**Examples.** `Almost.Algebra.test_mod_varpi`, `Almost.Algebra.test_classical`, `Almost.Algebra.test_modules`.

**Sources.** [GR](#source-gr) §2.2, (2.2.5), p. 12.

**Prerequisites.** [P0.7](#p0-7).

<a id="p0-9"></a>#### P0.9 — The left adjoint B ↦ B_!! of almostification on algebras

For a basic setup S = (V, m) and an almost V-algebra B, B_! = m̃ ⊗_V B_* is a non-unital V-algebra; B_!! := (V ⊕ B_!)/I, where I is the V-submodule spanned by the elements (xy, −x ⊗ y ⊗ 1) for x, y ∈ m, is a unital commutative V-algebra with B ≅ (B_!!)^a, and B ↦ B_!! is left adjoint to R ↦ R^a from A_!!-algebras to A-algebras (for any almost algebra A with B an A-algebra).

**API.** `Almost.Algebra.shriekShriek`, `Almost.Algebra.shriekShriekAdj`, `Almost.Algebra.shriekShriekUnitIso`.

**Examples.** `Almost.Algebra.shriekShriek_test_unit`, `Almost.Algebra.shriekShriek_test_not_flat`, `Almost.Algebra.shriekShriek_test_classical`.

**Sources.** [GR](#source-gr) §2.2, Proposition 2.2.27, p. 15.

**Prerequisites.** [P0.8](#p0-8).

<a id="p0-10"></a>#### P0.10 — Almost finitely generated, uniformly almost finitely generated and …

Let S = (V, m) be a basic setup, R a V-algebra and N an R-module, M = N^a over A = R^a. N^a is almost finitely generated if for every finitely generated ideal m₀ ⊆ m there are n and an R-linear φ : Rⁿ → N with m₀·coker φ = 0; uniformly almost finitely generated with bound n if one n works for all m₀; almost finitely presented if for every finitely generated m₀ ⊆ m there is a complex R^k →ψ Rⁿ →φ N with m₀·coker φ = 0 and m₀·ker φ ⊆ im ψ.

**API.** `Almost.Module.AlmostFG`, `Almost.Module.UniformlyAlmostFG`, `Almost.Module.AlmostFP`.

**Examples.** `Almost.Module.AlmostFG_test_quadratic`, `Almost.Module.AlmostFG_test_zero`, `Almost.Module.AlmostFG_test_classical`.

**Sources.** [GR](#source-gr) §2.3, Proposition 2.3.10(i), p. 18.

**Prerequisites.** [P0.8](#p0-8).

<a id="p0-11"></a>#### P0.11 — Flat, faithfully flat, almost projective and almost finite projective …

Let S = (V, m) be a basic setup, A an almost V-algebra and M an A-module. M is flat if M ⊗_A − : A-Mod → A-Mod is exact, faithfully flat if moreover M ⊗_A N ≅ 0 implies N ≅ 0, almost projective if alHom_A(M, −) : A-Mod → A-Mod is exact (GR Definition 2.4.4), and almost finite projective if it is almost projective and almost finitely generated (P0.10); 'uniformly almost finite projective' adds a uniform bound.

**API.** `Almost.Module.Flat`, `Almost.Module.FaithfullyFlat`, `Almost.Module.AlmostProjective`.

**Examples.** `Almost.Module.Flat_test_valuation`, `Almost.Module.AlmostProjective_test_not_projective`, `Almost.Module.Flat_test_classical`.

**Supporting results.**
- P0.11a Tor and Ext criteria for almost flatness and … (GR (2.4.10))
- P0.11b The ε-criterion for almost finite generation … (GR Remark 2.3.9)

**Sources.** [GR](#source-gr) §2.4, Definition 2.4.4, p. 23.

**Prerequisites.** [P0.8](#p0-8).

<a id="p0-12"></a>#### P0.12 — Duals, traces of endomorphisms and the trace form of an almost finite …

Let S be a basic setup and A an almost V-algebra. For an A-module M, the dual is M* := alHom_A(M, A) with evaluation ev_{M/A} : M ⊗_A M* → A. For P almost finite projective, ω_{P/A} : P ⊗_A P* → End_A(P)^a is an isomorphism (P0.12a) and the trace is tr_{P/A} := ev_{P/A} ∘ ω_{P/A}⁻¹ : End_A(P)^a → A.

**API.** `Almost.Module.dual`, `Almost.Module.dualTensorHomIso`, `Almost.Module.trace`.

**Examples.** `Almost.Module.trace_test_free`, `Almost.Algebra.trace_test_quadratic`, `Almost.Module.trace_test_zero`.

**Supporting results.**
- P0.12a E ⊗ alHom(F, N) → alHom(F, E ⊗ N) is an … (GR Lemma 2.4.29)

**Sources.** [GR](#source-gr) §4.1, Definition 4.1.1, p. 72.

**Prerequisites.** [P0.7](#p0-7).

<a id="p0-13"></a>#### P0.13 — Rank decomposition of uniformly almost finite projective modules

Let S be a basic setup satisfying condition (B) (k-th powers generate m; implied by (A)), A an almost V-algebra and P a uniformly almost finite projective A-module. Then P has finite rank: Λ^r_A P = 0 for some r.

**Sources.** [GR](#source-gr) §4.3, Proposition 4.3.27, p. 88.

**Prerequisites.** [P0.12](#p0-12).

### Almost finite étale algebras

<a id="p0-14"></a>#### P0.14 — Flat, unramified, étale and finite étale morphisms of almost algebras

Let S be a basic setup and φ : A → B a morphism of almost V-algebras; view B as a B ⊗_A B-algebra through the multiplication μ_{B/A} : B ⊗_A B → B, with kernel I_{B/A}. Following GR Definition 3.1.1: φ is flat (faithfully flat, almost projective) if B is a flat (faithfully flat, almost projective) A-module; (uniformly) almost finite if B is a (uniformly) almost finitely generated A-module; weakly unramified (unramified) if B is a flat (almost projective) B ⊗_A B-module; weakly étale (étale) if flat and weakly unramified (unramified). φ is finite étale if it is étale and B is an almost finitely presented A-module (Sch12 Definition 4.13; GR's A-Ét_afp; Kedlaya–Liu's and Bhatt's 'almost finite étale'); then B is almost finite projective over A (P0.25a). A_fet denotes the full subcategory of A-algebras that are finite étale over A. Equivalent descriptions: unramified iff there is a diagonal idempotent e ∈ (B ⊗_A B)_* with μ(e) = 1 and I_{B/A,*}·e = 0 (P0.15a, Sch12's definition); for B almost finite projective over A, étale iff the trace form t_{B/A} is perfect (P0.15).

**API.** `Almost.Algebra.IsFlat`, `Almost.Algebra.IsUnramified`, `Almost.Algebra.IsEtale`.

**Examples.** `Almost.Algebra.IsFiniteEtale_test_quadratic` (For K the completion of ℚ_p(p^{1/p^∞}), p ≠ 2, L = K(√p): …) `Almost.Algebra.IsFiniteEtale_test_idempotent_not_honest` (In the same example the diagonal idempotent is an almost …) `Almost.Algebra.IsFiniteEtale_test_classical` (For S = classical V and a V-algebra map R → R': IsFiniteEtale …)

**Sources.** [GR](#source-gr) §3.1, Definition 3.1.1(iii)-(iv), p. 39.

**Prerequisites.** [P0.11](#p0-11), [P0.10](#p0-10), [P0.8](#p0-8).

<a id="p0-15"></a>#### P0.15 — Almost finite projective algebras are étale iff the trace form is …

Let S be a basic setup and φ : A → B a morphism of almost algebras with B almost finite projective as an A-module. Then φ is étale iff the trace form t_{B/A} : B ⊗_A B → A is a perfect pairing, i.e. τ_{B/A} : B …

**Supporting results.**
- P0.15a Unramified ⟺ existence of the diagonal … (GR Proposition 3.1.4)

**Sources.** [GR](#source-gr) §4.1, Theorem 4.1.14, p. 75.

**Prerequisites.** [P0.12](#p0-12).

<a id="p0-16"></a>#### P0.16 — Inverting an element of m: almost modules become honest modules over …

Let S = (V, m) be a basic setup and ϖ ∈ m. The localisation M ↦ M[1/ϖ] = V[1/ϖ] ⊗_V M is exact and kills almost zero modules (ϖM = 0), so it factors, uniquely up to unique isomorphism, through an exact functor Almost.invert ϖ : Almost.Module S → ModuleCat V[1/ϖ] with invert(M^a) ≅ M[1/ϖ] and invert(M) ≅ M_*[1/ϖ] ≅ M_![1/ϖ].

**API.** `Almost.invert`, `Almost.toAlmostCompInvertIso`, `Almost.invert_preservesFiniteLimits`.

**Examples.** `Almost.invert_test_residue`, `Almost.invert_test_unit`, `Almost.invert_test_not_equivalence`.

**Supporting results.**
- P0.16a Base change of a basic setup along a ring map V … (GR Remark 2.1.4(ii))
- P0.16b Change of basic setup: (W, mW)^a-Mod ≃ W^a-Mod, … (GR Remark 2.2.12)

**Sources.** [GR](#source-gr) §5.2, proof of Corollary 5.2.15, p. 110.

**Prerequisites.** [P0.5](#p0-5).

<a id="p0-17"></a>#### P0.17 — Comparison of finite étale almost algebras with Mathlib's finite …

Let S = (V, m) be a basic setup and R → R' a map of commutative V-algebras. (i) If R' is finite étale over R in Mathlib's sense (`Algebra.Etale R R'` and `Module.Finite R R'`), then R^a → R'^a is finite étale in …

**Sources.** [GR](#source-gr) §3.4, (3.4.44), p. 64.

**Prerequisites.** [P0.14](#p0-14).

<a id="p0-18"></a>#### P0.18 — Almost Kähler differentials Ω_{B/A} and almost derivations

Let S be a basic setup and A → B a morphism of almost algebras, I_{B/A} = ker(μ_{B/A} : B ⊗_A B → B). The module of almost differentials is the B-module Ω_{B/A} := I_{B/A}/I_{B/A}², with the A-derivation δ : B → Ω_{B/A}, b ↦ 1 ⊗ b − b ⊗ 1 on almost elements.

**API.** `Almost.Algebra.kaehlerDifferential`, `Almost.Algebra.kaehlerDifferential.d`, `Almost.Algebra.Derivation`.

**Examples.** `Almost.Algebra.kaehler_test_polynomial`, `Almost.Algebra.kaehler_test_self`, `Almost.Algebra.kaehler_test_mathlib`.

**Sources.** [GR](#source-gr) §2.5, Definition 2.5.22(ii), p. 33.

**Prerequisites.** [P0.8](#p0-8).

<a id="p0-19"></a>#### P0.19 — The cotangent complex of a ring map and its deformation theory

For a map of commutative rings R → S, the cotangent complex L_{S/R} ∈ D(S) is the complex of Kähler differentials of a simplicial resolution of S by polynomial R-algebras (Illusie's standard resolution), together with: (a) H_0(L_{S/R}) ≅ Ω_{S/R}, compatibly with Mathlib's `KaehlerDifferential`, and H_1 compatible with the truncation `Algebra.Extension.Cotangent`; (b) the transitivity triangle S ⊗_T^L L_{T/R} → L_{S/R} → L_{S/T} for R → T → S; (c) base change L_{S'/R'} ≃ S' ⊗_S^L L_{S/R} for a Tor-independent square; (d) commutation with filtered colimits of rings; (e) Ext^0_S(L_{S/R}, M) ≅ Der_R(S, M) and Ext^1_S(L_{S/R}, M) ≅ Exal_R(S, M), the group of square-zero R-extensions of S by M; (f) for a flat R-algebra S and a square-zero extension R' → R with kernel J, the obstruction to a flat deformation of S over R' lies in Ext^2_S(L_{S/R}, S ⊗_R J), deformations form a torsor under Ext^1 and automorphisms are Ext^0, and the obstruction to lifting an R-morphism S → T along a square-zero extension lies in Ext^1_S(L_{S/R}, T ⊗ J) with lifts a torsor under Ext^0; (g) for a map of simplicial rings R_• → S_•, the diagonal complex L^Δ with the spectral sequence H_j(L_{S_i/R_i}) ⇒ H_{i+j}(L^Δ), and L_{S/R} ≃ L^Δ for simplicial resolutions.

**API.** `CotangentComplex`, `CotangentComplex.homologyZeroIso`, `CotangentComplex.transitivityTriangle`.

**Examples.** `cotangentComplex_polynomial` (For S = R[X_i] the complex is Ω_{S/R} in degree 0 (free on the …) `cotangentComplex_perfect_charP` (For a perfect 𝔽_p-algebra S, L_{S/𝔽_p} ≃ 0 (Frobenius is an …) `cotangentComplex_not_concentrated_in_degree_zero` (For S = R/(f) with f a nonzerodivisor, L_{S/R} ≃ (f)/(f²)[1] ≠ …)

**Sources.** [Illusie](#source-illusie) Chapter II, 1.2.3 (definition), 2.1.2 (transitivity), 2.2.1 (base change), 1.2.4.2 (Ext^0, Ext^1); Chapter III, 1.2.3, 2.1.2.3 (deformations), 2.2.2 (lifting morphisms), II.1.2.6.2 (spectral sequence).

**Prerequisites.** `mathlib:KaehlerDifferential`, `mathlib:Algebra.Extension.Cotangent`, `mathlib:CategoryTheory.SimplicialObject`.

### Almost cotangent complex

<a id="p0-20"></a>#### P0.20 — The almost cotangent complex L_{B/A}

Let S be a basic setup and A → B a morphism of almost algebras. Put Ã := V^a × A and B̃ := V^a × B (exact almost algebras). The almost cotangent complex is L_{B/A} := B_!! ⊗_{B̃_!!} L_{B̃_!!/Ã_!!}, an object of the derived category of B_!!-modules, where L_{−/−} is the classical cotangent complex of the ring map Ã_!! → B̃_!! (simplicial polynomial resolution; supplied by DerivedDeRhamCohomology:DD.0); its almostification L^a_{B/A} ∈ D(B-Mod) is the object used in deformation theory. Properties: H_0(L^a_{B/A}) ≅ Ω_{B/A};

**API.** `Almost.cotangentComplex`, `Almost.almostCotangentComplex`, `Almost.cotangentComplex_H0`.

**Examples.** `Almost.cotangentComplex_test_polynomial` (For B = (A_*[X])^a: H_0(L^a_{B/A}) ≅ B·δX and H_i(L^a_{B/A}) = …) `Almost.cotangentComplex_test_identity` (L_{A/A} ≃ 0 for every almost algebra A (the identity of Ã_!!).) `Almost.cotangentComplex_test_classical` (For S = classical V and V-algebras R → R': L^a_{R'^a/R^a} ≅ …)

**Supporting results.**
- P0.20a The almost cotangent complex of R^a → S^a is … (GR Proposition 8.1.7)
- P0.20b Tor-independent base change for almost … (GR Theorem 2.5.35)

**Sources.** [GR](#source-gr) §2.5, Definition 2.5.20, p. 32.

**Prerequisites.** [P0.9](#p0-9), [P0.18](#p0-18), [P0.8](#p0-8).

<a id="p0-21"></a>#### P0.21 — Square-zero extensions of almost algebras are classified by Ext¹ of …

Let S be a basic setup, A → B a morphism of almost algebras and M a B-module. (i) Almostification Exal_{A!!}(B_!!, M_*) → Exal_A(B, M) is an equivalence of categories of square-zero extensions, inducing a group …

**Sources.** [GR](#source-gr) §2.5, Lemma 2.5.17(i), p. 32.

**Prerequisites.** [P0.20](#p0-20).

### Nilpotent deformations of almost algebras

<a id="p0-22"></a>#### P0.22 — Flat square-zero deformations of almost algebras: obstruction, …

Let S be a basic setup, A an almost algebra, B̃ = (0 → I → B → B₀ → 0) an A-extension (I² = 0) and f₀ : B₀ → C₀ a flat morphism of almost algebras. […] Then (i) ω(B̃, f₀) = 0 iff there is a flat deformation of C₀ over B, i.e. a B-extension C̃ = (0 → C₀ ⊗ I → C → C₀ → 0) with C flat over B and C ⊗_B B₀ ≅ C₀; (ii) if ω = 0, the isomorphism classes of flat deformations form a torsor under Exal_{B₀}(C₀, C₀ ⊗_{B₀} I) ≅ Ext¹_{C₀}(L^a_{C₀/B₀}, C₀ ⊗_{B₀} I);

**Supporting results.**
- P0.22a Transitivity triangle for almost cotangent … (GR Theorem 2.5.32)
- P0.22b Local flatness criterion for square-zero … (GR (3.2.19))

**Sources.** [GR](#source-gr) §3.2, Proposition 3.2.9, p. 41.

**Prerequisites.** [P0.21](#p0-21), [P0.20](#p0-20), [P0.18](#p0-18).

<a id="p0-23"></a>#### P0.23 — Lifting morphisms along square-zero extensions of almost algebras

Let S be a basic setup, A an almost algebra, B̃ an A-extension 0 → I → B → B₀ → 0, and C̃ⁱ = (0 → Jⁱ → Cⁱ → C₀ⁱ → 0), i = 1, 2, A-extensions with morphisms f̃ⁱ : B̃ → C̃ⁱ, together with v : J¹ → J² and g₀ : C₀¹ …

**Sources.** [GR](#source-gr) §3.2, Proposition 3.2.16, p. 43.

**Prerequisites.** [P0.21](#p0-21).

<a id="p0-24"></a>#### P0.24 — Étale almost algebras lift uniquely along nilpotent ideals

Let S be a basic setup, A an almost algebra and I ⊆ A a nilpotent ideal, A' := A/I. (i) For B weakly étale over A, C any A-algebra and J ⊆ C nilpotent, Hom_{A-Alg}(B, C) → Hom_{A-Alg}(B, C/J) is bijective.

**Supporting results.**
- P0.24a Vanishing of the almost cotangent complex when … (GR Theorem 2.5.36)

**Sources.** [GR](#source-gr) §3.2, Theorem 3.2.18(i), p. 43.

**Prerequisites.** [P0.22](#p0-22).

<a id="p0-25"></a>#### P0.25 — Faithfully flat descent for almost modules and almost algebras

Let S be a basic setup and φ : A → B a faithfully flat morphism of almost algebras. (i) φ is of effective descent for modules: M ↦ (B ⊗_A M, can) is an equivalence from A-Mod to the category Desc(B/A) of …

**Supporting results.**
- P0.25a Flat + almost finitely presented ⟺ almost … (GR Proposition 2.4.18)
- P0.25b Stability of flat, unramified and étale … (GR Lemma 3.1.2(i))
- P0.25c B ↦ B_!! preserves and reflects faithful … (GR Remark 3.1.3(ii))
- P0.25d The Amitsur complex of an almost faithfully … (GR (3.4.1))

**Sources.** [GR](#source-gr) §3.4, introduction, p. 55.

**Prerequisites.** [P0.7](#p0-7).

<a id="p0-26"></a>#### P0.26 — Tight ideals, the Jacobson radical and henselian pairs of almost …

Let S = (V, m) be a basic setup and A an almost V-algebra. An ideal I ⊆ A is tight if there are a finitely generated ideal m₀ ⊆ m and n ∈ ℕ with Iⁿ ⊆ m₀·A (GR Definition 5.1.5); for ϖ ∈ m the ideal ϖA is tight. The Jacobson radical of A is rad(A) := rad(A_*)^a (GR 5.1.1); for a V-algebra R and an ideal J ⊆ R, J^a ⊆ rad(R^a) iff mJ ⊆ rad(R) (GR Lemma 5.1.2).

**API.** `Almost.Algebra.Ideal.IsTight`, `Almost.Algebra.isTight_span`, `Almost.Algebra.Ideal.IsTight.mono`.

**Examples.** `Almost.Algebra.IsTight_test_varpi`, `Almost.Algebra.IsTight_test_unit`, `Almost.Algebra.IsTight_test_zero`.

**Supporting results.**
- P0.26a Almost Nakayama lemma for tight ideals (GR Lemma 5.1.6)
- P0.26b Idempotents lift uniquely along tight henselian … (GR Proposition 5.1.17)

**Sources.** [GR](#source-gr) §5.1, Definition 5.1.5, p. 103.

**Prerequisites.** [P0.8](#p0-8).

<a id="p0-27"></a>#### P0.27 — Almost finite projective modules over I-adically complete almost …

Let S be a basic setup, A an almost algebra and I ⊆ A a tight ideal with A → lim_n A/I^{n+1} an isomorphism, A_n := A/I^{n+1}. Then M ↦ (M ⊗_A A_n)_n is an equivalence from almost finite projective A-modules to …

**Supporting results.**
- P0.27a Products, limits, lim¹, colimits, Tor and Ext … (GR Lemma 2.4.2(i)-(ii))
- P0.27b Almost projectivity via ε-factorisations … (GR Lemma 2.4.15)

**Sources.** [GR](#source-gr) §5.3, Theorem 5.3.24, p. 115.

**Prerequisites.** [P0.26](#p0-26).

### Finite étale lifting

<a id="p0-28"></a>#### P0.28 — Finite étale almost algebras lift uniquely modulo a tight ideal of a …

Let S = (V, m) be a basic setup, A an almost V-algebra and I ⊆ A a tight ideal such that A is I-adically complete (A → lim_n A/I^{n+1} an isomorphism). Then B ↦ B ⊗_A A/I is an equivalence of categories A_fet ≃ (A/I)_fet, with quasi-inverse B₀ ↦ lim_n B_n, where B_n is the unique finite étale A/I^{n+1}-algebra lifting B₀. In particular, for ϖ ∈ m and A ϖ-adically complete, A_fet ≃ (A/ϖ)_fet; this is Sch12 Theorem 4.17 over an arbitrary basic setup (Sch12 states it for S = (K°, K°°) and A flat over K°a).

**Supporting results.**
- P0.28a Unramifiedness lifts from the reduction modulo … (GR Theorem 5.2.12(ii))
- P0.28b Finite étale algebras over complete flat almost … (Sch12 Theorem 4.17)
- P0.28c Uniform finite projectivity of a finite étale … (Sch12 Theorem 4.17)
- P0.28d ϖ-adic completeness of an almost module and of … (Sch12 Lemma 5.3(iv))
- P0.28e Complete torsion-free complexes that are almost … (ECD  Proposition 8.8)

**Sources.** [GR](#source-gr) §5.3, Theorem 5.3.27, p. 116.

**Prerequisites.** [P0.14](#p0-14), [P0.26](#p0-26), [P0.24](#p0-24).

<a id="p0-29"></a>#### P0.29 — Almost sheaves, almost sheaf cohomology and almost Čech complexes on …

Let (C, J) be a site and S = (V, m) a basic setup. For a sheaf F of V-modules on (C, J) (Mathlib `Sheaf J (ModuleCat V)`): F is almost zero if m·F(U) = 0 for all U; almost zero sheaves form a Serre class of the abelian category of sheaves, and the Serre localization Almost.Sheaf J S is the category of sheaves of almost V-modules (GR 3.3.1–3.3.2: a basic setup relative to the topos of (C, J)), with exact localization F ↦ F^a.

**API.** `Almost.Sheaf.IsAlmostZero`, `Almost.Sheaf.almostZero_isSerreClass`, `Almost.Sheaf`.

**Examples.** `Almost.Sheaf.test_point`, `Almost.Sheaf.test_constant_residue`, `Almost.Sheaf.test_not_acyclic`.

**Supporting results.**
- P0.29a Almost Čech acyclicity on a basis implies … (ECD  Proposition 8.8)

**Sources.** [GR](#source-gr) §3.3, (3.3.1), p. 47.

**Prerequisites.** [P0.5](#p0-5).

<a id="p1"></a>

## P1: Perfectoid Tate rings, tilts and untilts

Perfectoid Tate rings and fields with their characterisations, the tilt with its integral subrings and the sharp map, the almost setup of a perfectoid ring, Fontaine's θ with its primitive kernel, untilts and their classification by primitive ideals of degree one, integral perfectoid rings and the integral/Tate dictionary, the tilting equivalence over an arbitrary perfectoid base through the mod-ϖ category, completed colimits, perfected Tate algebras and the standard examples.

### Perfectoid Tate ring

<a id="p1-1"></a>#### P1.1 — Perfectoid Tate rings (ECD Definition 3.1), perfectoid algebras and …

Fix a prime p. Let R be a commutative topological ring which is a Tate ring (tauceti:TauCeti.Huber.IsTateRing), complete and Hausdorff, with power-bounded subring R° (tauceti:TauCeti.Huber.powerBoundedSubring). For a commutative ring A and ideals I, J ⊆ A with p ∈ J and x^p ∈ J for every x ∈ I, write Φ: A/I → A/J for the ring homomorphism x mod I ↦ x^p mod J (ECD §3 notational convention). R is a perfectoid Tate ring if (a) R is uniform, i.e. R° is a bounded subset of R (tauceti:TauCeti.Huber.IsBounded), and (b) there is a pseudo-uniformizer ϖ of R (a topologically nilpotent unit, tauceti:TauCeti.Huber.IsPseudoUniformizer; necessarily ϖ ∈ R°) such that ϖ^p divides p in R° and Φ: R°/ϖR° → R°/ϖ^pR° is bijective. No perfectoid base field is fixed; characteristic 0 and characteristic p are both allowed (for pR = 0 the condition ϖ^p | p is vacuous), and p may be a nonzero nonunit (e.g. in a product K × K♭). A perfectoid R-algebra is a perfectoid Tate ring S with a continuous ring homomorphism R → S; morphisms are continuous R-algebra homomorphisms. A perfectoid Tate pair is a Huber pair (R, R+) (tauceti:TauCeti.Huber.Pair) with R perfectoid; the condition depends only on R (P1.17a).

**API.** `Perfectoid.frobeniusQuot`, `Perfectoid.frobeniusQuot_mk`, `Perfectoid.IsPerfectoidTateRing`.

**Examples.** `Perfectoid.not_isPerfectoidTateRing_padic` (¬ IsPerfectoidTateRing ℚ_[p]: a pseudo-uniformizer of ℚ_p has …) `Perfectoid.IsPerfectoidTateRing.not_of_not_uniform` (R = ℂ_p[ε]/(ε²) (product topology on ℂ_p ⊕ ℂ_pε) is a complete …) `Perfectoid.isPerfectoidTateRing_zero` (The zero ring is a perfectoid Tate ring (0 is a topologically …)

**Sources.** [ECD](#source-ecd) §3, Definition 3.1, p. 14.

**Prerequisites.** `tauceti:TauCeti.Huber.IsTateRing`, `tauceti:TauCeti.Huber.IsHuberRing`, `tauceti:TauCeti.Huber.IsPseudoUniformizer`.

<a id="p1-2"></a>#### P1.2 — In characteristic p, perfectoid Tate rings are exactly the perfect …

Let R be a topological ring with pR = 0. Then R is a perfectoid Tate ring iff R is a perfect complete Hausdorff Tate ring.

**Supporting results.**
- P1.2a Rings of integral elements of a complete … (Stacks Project, Tag 090T (Lemma 10.96.8))
- P1.2b Injectivity of Frobenius is automatic and the … (ECD Remark 3.2)
- P1.2c A perfect complete Tate ring of characteristic … (ECD Proposition 3.5, proof)

**Sources.** [ECD](#source-ecd) Proposition 3.5, p. 15.

**Prerequisites.** [P1.1](#p1-1).

<a id="p1-3"></a>#### P1.3 — Pseudo-uniformizers with compatible p-power roots and the spectral …

Let R be a perfectoid Tate ring. […] Then every ϖ^{1/p^n} is a pseudo-uniformizer in R°, ϖ^q := (ϖ^{1/p^n})^m is well defined for q = m/p^n ∈ ℤ[1/p]_{≥0} (and for q ∈ ℤ[1/p] as a unit of R), and ϖ♭ is a pseudo-uniformizer of the tilt R♭ with (ϖ♭)♯ = ϖ (P1.5b).

**API.** `Perfectoid.PseudoUniformizerRoots`, `Perfectoid.PseudoUniformizerRoots.root`, `Perfectoid.PseudoUniformizerRoots.root_pow`.

**Examples.** `Perfectoid.PseudoUniformizerRoots.gauge_padicComplex`, `Perfectoid.PseudoUniformizerRoots.isEmpty_padic`, `Perfectoid.PseudoUniformizerRoots.subsingleton_of_charP`.

**Sources.** [ECD](#source-ecd) Lemma 3.10, p. 16.

**Prerequisites.** [P1.1](#p1-1).

### Tilt of a perfectoid Tate ring

<a id="p1-4"></a>#### P1.4 — The tilt R♭ = lim_{x↦x^p} R of a perfectoid Tate ring

Let R be a perfectoid Tate ring. Its tilt is R♭ := lim_{x↦x^p} R, the multiplicative monoid Perfection R p of compatible sequences (x^{(n)})_{n≥0} with (x^{(n+1)})^p = x^{(n)}, with the inverse-limit topology (induced from ∏_ℕ R), pointwise multiplication and addition (x + y)^{(i)} = lim_{n→∞}(x^{(i+n)} + y^{(i+n)})^{p^n}. The limit exists and R♭ is a topological ring of characteristic p which is perfect (ECD Lemma 3.10; Kedlaya AWS Lemma 2.7.1). Concretely, for ϖ♭ a pseudo-uniformizer with compatible roots and ϖ_0 | p, the submonoid lim_{x↦x^p} R° is identified with the ring lim_Φ R°/ϖ_0 (P1.4a), R♭ = (lim R°)[1/ϖ♭] as monoids, and the ring structure of R♭ is that of this localisation; it is given by the limit formula and does not depend on ϖ_0 or ϖ♭. For a Huber pair (R, R+) with R perfectoid, the tilt pair is (R♭, R♭+) with R♭+ := lim_{x↦x^p} R+ (P1.18a). If pR = 0 then x ↦ x^{(0)} is an isomorphism R♭ ≅ R.

**API.** `Perfectoid.tilt`, `Perfectoid.tilt.instCommRing`, `Perfectoid.tilt.charP`.

**Examples.** `Perfectoid.tilt.equivOfCharP_laurent` (For R the t-adic completion of the perfection of F_p((t)), tilt …) `Perfectoid.tilt.coeff_epsilon` (In tilt ℚ_p^cycl, ε := (ζ_{p^n})_n with ζ_{p^{n+1}}^p = …) `Perfectoid.tilt.coeff_zero_sub_ne` (In tilt ℚ_p^cycl, coeff 0 (ε − 1) ≠ coeff 0 ε − coeff 0 1 = 0: …)

**Supporting results.**
- P1.4a lim_{x↦x^p} R+ ≅ lim_Φ R+/ϖ_0 ≅ lim_Φ R+/p (ECD Lemma 3.10, proof)
- P1.4b Every perfectoid Tate ring has a … (ECD Lemma 3.10)

**Sources.** [ECD](#source-ecd) Definition 3.9, p. 16.

**Prerequisites.** [P1.1](#p1-1), [P1.3](#p1-3), [P1.2](#p1-2).

<a id="p1-5"></a>#### P1.5 — The sharp map ♯: R♭ → R (continuous, multiplicative, not additive)

For a perfectoid Tate ring R, the sharp map ♯: R♭ → R, x ↦ x♯ := x^{(0)} (Mathlib Perfection.coeffMonoidHom R p 0 on the underlying monoid Perfection R p) is continuous and multiplicative with 0♯ = 0, and is not additive in general. It satisfies (x^{1/p^n})♯ = x^{(n)}; x ∈ R♭° iff x♯ ∈ R°; x♯ = 0 iff x = 0; for x, y ∈ R♭°, (x + y)♯ ≡ x♯ + y♯ mod pR°; every element of R° is congruent modulo pR° to some y♯ with y ∈ R♭°; reduction of ♯ modulo ϖ is the ring …

**API.** `Perfectoid.tilt.sharp`, `Perfectoid.tilt.sharp₀`, `Perfectoid.tilt.continuous_sharp`.

**Examples.** `Perfectoid.tilt.sharp_sub_ne`, `Perfectoid.tilt.sharp_epsilon`, `Perfectoid.tilt.sharp_ringEquiv_of_charP`.

**Supporting results.**
- P1.5a Frobenius-surjectivity criterion with the … (ECD Remark 3.2)
- P1.5b R♭° = lim R° ≅ lim_Φ R°/ϖ, R♭ = R♭°[1/ϖ♭] and … (ECD Lemma 3.10)

**Sources.** [ECD](#source-ecd) after Lemma 3.10, p. 16.

**Prerequisites.** [P1.4](#p1-4).

<a id="p1-6"></a>#### P1.6 — Functoriality of tilting: f ↦ f♭

A continuous ring homomorphism f: R → S between perfectoid Tate rings induces f♭: R♭ → S♭, (x^{(n)})_n ↦ (f(x^{(n)}))_n (Mathlib Perfection.mapMonoidHom p f on the underlying monoids), a continuous ring homomorphism with (f♭x)♯ = f(x♯), f♭(R♭°) ⊆ S♭°, id♭ = id and (g ∘ …

**API.** `Perfectoid.tilt.map`, `Perfectoid.tilt.coeff_map`, `Perfectoid.tilt.sharp_map`.

**Examples.** `Perfectoid.tilt.map_id_test`, `Perfectoid.tilt.map_inclusion_epsilon`, `Perfectoid.tilt.map_equivOfCharP`.

**Sources.** [Berkeley](#source-berkeley) Theorem 6.2.7, p. 45.

**Prerequisites.** [P1.4](#p1-4).

<a id="p1-7"></a>#### P1.7 — The tilt B♭ = lim_{x↦x^p} B of a complete uniform Tate ring in which …

Let B be a complete Hausdorff uniform Tate ring in which p is topologically nilpotent (B is not assumed perfectoid) and B⁺ ⊆ B° a ring of integral elements. […] Then: (a) the limit exists and makes B♭ a perfect topological ring of characteristic p; ♯ is continuous and multiplicative; B♭⁺ := lim_{x↦x^p} B⁺ = {x : x♯ ∈ B⁺} is an open subring and B♭° := lim_{x↦x^p} B° = {x : x♯ ∈ B°};

**API.** `Perfectoid.uniformTilt`, `Perfectoid.uniformTilt.sharp`, `Perfectoid.uniformTilt.coeff_add`.

**Examples.** `Perfectoid.uniformTilt_equiv_tilt`, `Perfectoid.uniformTilt_padic`, `Perfectoid.uniformTilt_charP`.

**Supporting results.**
- P1.7a The spectral gauge is preserved by the sharp … (Sch12 Lemma 5.21, proof)

**Sources.** [AWS](#source-aws) Lemma 2.7.1, p. 66.

**Prerequisites.** [P1.4](#p1-4).

<a id="p1-8"></a>#### P1.8 — The integral tilt R♭+ is Mathlib's PreTilt R+ p, and ♯ is …

Let R be a nonzero perfectoid Tate ring and R+ a ring of integral elements (e.g. […] Then R+ satisfies Mathlib's standing hypotheses Fact ¬IsUnit (p : R+) and IsAdicComplete (span {p}) R+ (P1.2a), and: (a) the …

**Sources.** [BMS](#source-bms) Lemma 3.2(i), p. 19.

**Prerequisites.** [P1.4a](#p1-4).

<a id="p1-9"></a>#### P1.9 — The almost setup (R°, R°°) of a perfectoid Tate ring

Let R be a perfectoid Tate ring. The pair (R°, R°°) is a basic setup for almost mathematics (P0.1: R°° idempotent and R°° ⊗_{R°} R°° ≅ R°° flat), and so is (R+, R°°) for every ring of integral elements R+. For an R+-module M the following are equivalent: (i) M is almost zero, R°°M = 0; (ii) ϖ'M = 0 for every pseudo-uniformizer ϖ' of R;

**API.** `Perfectoid.almostSetup`, `Perfectoid.almostSetupPlus`, `Perfectoid.almostSetup_ideal`.

**Examples.** `Perfectoid.isAlmostZero_residueField`, `Perfectoid.not_idempotent_padic`, `Perfectoid.isAlmostZero_of_subsingleton`.

**Supporting results.**
- P1.9a R°° = ⋃ ϖ^{1/p^n}R° is an idempotent flat ideal (ECD Definition 3.21)

**Sources.** [ECD](#source-ecd) Definition 3.21, p. 19.

**Prerequisites.** [P1.4b](#p1-4).

### Perfectoid field

<a id="p1-10"></a>#### P1.10 — Perfectoid fields

A perfectoid field is a perfectoid Tate ring K (P1.1) whose underlying topological ring is a nonarchimedean field: K is a field, complete with respect to a nontrivial nonarchimedean absolute value |·| defining its topology (ECD Definition 3.6). Equivalently (P1.11; ECD Proposition 3.8; the original definition Sch12 Definition 3.1): K is a nonarchimedean field which is not discretely valued, |p| < 1, and Frobenius is surjective on K°/p. Its value group is p-divisible (P1.15a). In characteristic p a perfectoid field is the same as a complete perfect nonarchimedean field.

**Hypotheses.** Nonarchimedean field: in Lean, NontriviallyNormedField K with IsUltrametricDist K and CompleteSpace …

**API.** `Perfectoid.IsPerfectoidField`, `Huber.isTateRing_of_nontriviallyNormedField`, `Perfectoid.IsPerfectoidField.toIsPerfectoidTateRing`.

**Examples.** `Perfectoid.not_isPerfectoidField_padic` (¬ IsPerfectoidField ℚ_[p]: ℚ_p is discretely valued (ECD Remark …) `Perfectoid.isPerfectoidField_padicComplex_test` (IsPerfectoidField (PadicComplex p): the value group is |p|^ℚ …) `Perfectoid.isPerfectoidField_iff_perfect_laurent` (For the completed perfection K of F_p((t)): IsPerfectoidField K …)

**Sources.** [ECD](#source-ecd) Definition 3.6, p. 15.

**Prerequisites.** [P1.1](#p1-1), `mathlib:NontriviallyNormedField`, `mathlib:IsUltrametricDist`.

<a id="p1-11"></a>#### P1.11 — Characterisation of perfectoid fields

Let K be a nonarchimedean field. Then K is a perfectoid field iff (i) K is not discretely valued, (ii) |p| < 1, and (iii) Frobenius Φ: K°/p → K°/p is surjective (ECD Proposition 3.8;

**Sources.** [ECD](#source-ecd) Proposition 3.8, p. 15.

**Prerequisites.** [P1.10](#p1-10).

<a id="p1-12"></a>#### P1.12 — Gelfand spectrum of a Banach ring: units and the maximum formula

Let A be a commutative nonarchimedean Banach ring (complete for a submultiplicative norm |·| with |a + b| ≤ max(|a|, |b|)). […] Then: (i) M(A) is compact Hausdorff; (ii) M(A) ≠ ∅ if A ≠ 0; (iii) f ∈ A is a unit iff α(f) ≠ 0 for every α ∈ M(A); (iv) the spectral seminorm |f|_sp = lim |fⁿ|^{1/n} equals max_{α ∈ M(A)} α(f), the maximum being attained. For a complete Tate ring the carrier M(A) is the Berkovich spectrum of DiamondsAndVStacks D5 (`DiamondsAndVStacks:D5/berkovich-quotient`); this target proves (ii)–(iv) for arbitrary nonarchimedean Banach rings, which is the form used by Kedlaya's Banach-field theorem and by the pointwise sharp-approximation lemma.

**Sources.** [Berkovich](#source-berkovich) §1.2, Theorem 1.2.1 and Corollary 1.2.4; §1.3, Theorem 1.3.1.

**Prerequisites.** `mathlib:MulRingSeminorm`, `mathlib:RingSeminorm`, `mathlib:NonarchimedeanAddGroup`.

<a id="p1-13"></a>#### P1.13 — A uniform Banach field over a nondiscretely valued field is a …

Let F be a nonarchimedean field whose value group |F^×| is dense in ℝ_{>0}, and let A be a uniform Banach F-algebra (complete, with topology defined by a power-multiplicative norm; equivalently the spectral …

**Sources.** [KBF](#source-kbf) Theorem 3.7, p. 10.

**Prerequisites.** [P1.12](#p1-12).

<a id="p1-14"></a>#### P1.14 — A perfectoid Tate ring whose underlying ring is a field is a …

Let A be a perfectoid Tate ring whose underlying ring is a field. Then the topology of A is defined by a multiplicative absolute value, so A is a perfectoid field (Kedlaya, On commutative nonarchimedean Banach …

**Supporting results.**
- P1.14a The tilt of a perfectoid Tate ring is a … (ECD Lemma 3.10)
- P1.14b A perfectoid Tate ring is a field iff its tilt … (Sch12 Lemma 5.21)

**Sources.** [KBF](#source-kbf) Theorem 4.2, p. 13.

**Prerequisites.** [P1.13](#p1-13).

<a id="p1-15"></a>#### P1.15 — Tilt of a perfectoid field; comparison with Mathlib's Tilt and …

Let K be a perfectoid field. Its tilt K♭ (P1.4) is a perfectoid field of characteristic p with absolute value |x|_♭ := |x♯|; K♭° = lim_{x↦x^p} K° ≅ lim_Φ K°/ϖ is its valuation ring for any ϖ ∈ K with |p| ≤ |ϖ| < 1; |K♭^×| = |K^×|; K♭°/ϖ♭ ≅ K°/ϖ and K♭°/m♭ ≅ K°/m; K♭ = K if char K = p. Replacing ϖ by (ϖ♭)♯ one may assume ϖ has compatible p-power roots (Sch12 Lemma 3.4, Remark 3.5).

**API.** `Perfectoid.IsPerfectoidField.tilt_isPerfectoidField`, `Perfectoid.tiltField.norm_def`, `Perfectoid.tiltField.valueGroup_eq`.

**Examples.** `Perfectoid.tiltField_padicComplex_pflat`, `Perfectoid.tiltField_equivMathlibTilt_test`, `Perfectoid.tiltField_equivSelf_laurent`.

**Supporting results.**
- P1.15a The value group of a perfectoid field is … (Sch12 Lemma 3.2)
- P1.15b Continuous valuations of K and K♭ correspond (Sch12 Proposition 3.6)

**Sources.** [Sch12](#source-sch12) Lemma 3.4(iii), p. 16.

**Prerequisites.** [P1.4](#p1-4).

<a id="p1-16"></a>#### P1.16 — Primitive (distinguished) elements and ideals of degree 1 in W(R+)

Let (R, R+) be a perfectoid Tate pair of characteristic p. […] Equivalently (ECD Definition 3.15), J is generated by an element p + [ϖ♭]α with ϖ♭ ∈ R+ a pseudo-uniformizer and α ∈ W(R+): every such element is primitive, and every primitive element is a unit multiple of one of this form, because a topologically nilpotent element of R+ is divisible by a pseudo-uniformizer (Kedlaya–Liu II Lemma 3.2.2;

**API.** `Perfectoid.IsPrimitive`, `Perfectoid.IsPrimitiveIdeal`, `Perfectoid.IsPrimitive.iff_teichmuller_add`.

**Examples.** `Perfectoid.isPrimitive_p_sub_pflat`, `Perfectoid.not_isPrimitive_p_sq`, `Perfectoid.isPrimitive_p_test`.

**Supporting results.**
- P1.16a A_inf = W(R+) for a perfectoid pair of … (Bhatt notes, Example 6.1.6)

**Sources.** [ECD](#source-ecd) Definition 3.15, p. 17.

**Prerequisites.** [P1.2](#p1-2).

<a id="p1-17"></a>#### P1.17 — ECD's θ is Mathlib's WittVector.fontaineTheta;

Let R be a nonzero perfectoid Tate ring and R+ a ring of integral elements. […] In particular θ([x]) = x♯ (WittVector.fontaineTheta_teichmuller) and θ mod p is x ↦ x♯ mod p (WittVector.mk_fontaineTheta).

**Supporting results.**
- P1.17a Every ring of integral elements of a perfectoid … (BMS Lemma 3.20, proof)

**Sources.** [ECD](#source-ecd) Lemma 3.14(i), p. 17.

**Prerequisites.** [P1.8](#p1-8).

### Fontaine's map θ

<a id="p1-18"></a>#### P1.18 — Fontaine's θ: W(S♭+) → S+ is surjective with kernel generated by a …

Let (S, S+) be a perfectoid Tate pair (any characteristic) with tilt (S♭, S♭+). (a) θ: W(S♭+) → S+, Σ[r_n]p^n ↦ Σ r_n♯p^n, is a surjective ring homomorphism (P1.17). (b) ker θ is generated by a primitive element of degree 1, which can be taken of the form ξ = p + [ϖ♭]α with ϖ♭ ∈ S♭+ a pseudo-uniformizer such that (ϖ♭♯)^p | p in S+, and α ∈ W(S♭+); ξ is a nonzerodivisor. (c) An element of ker θ generates ker θ iff it is primitive (BMS1 Remark 3.11). (d) θ extends to a surjection W(S♭+)[1/[ϖ♭]] → S with kernel ξW(S♭+)[1/[ϖ♭]], and W(S♭+)/(ξ, [ϖ♭]) = S♭+/ϖ♭ ≅ S+/ϖ♭♯. If pS = 0 then ker θ = (p). (ECD Lemma 3.14; Berkeley Lemma 6.2.8; Kedlaya AWS Lemma 2.7.5; Kedlaya–Liu I Lemma 3.6.3 in characteristic 0.)

**Supporting results.**
- P1.18a Rings of integral elements correspond under … (ECD Lemma 3.11)
- P1.18b Primitive elements are nonzerodivisors and … (ECD Lemma 3.16)
- P1.18c W(R+)/ξ is [ϖ]-torsion free and [ϖ]-adically … (ECD Lemma 3.14, proof)

**Sources.** [ECD](#source-ecd) Lemma 3.14(ii), p. 17.

**Prerequisites.** [P1.17](#p1-17), [P1.16](#p1-16), [P1.5b](#p1-5).

<a id="p1-19"></a>#### P1.19 — The untilt of (R, R+) along a primitive ideal J: (W(R+)[1/[ϖ]]/J, …

Let (R, R+) be a perfectoid Tate pair of characteristic p, J ⊆ W(R+) a primitive ideal of degree 1 and ϖ ∈ R+ a pseudo-uniformizer. The untilt of (R, R+) along J is the pair (A, A+) with A+ := W(R+)/J and A := A+[1/π], π the image of [ϖ], topologised so that A+ is open with its π-adic (equivalently (p,[ϖ])-adic) topology; equivalently A = W^b(R)/J·W^b(R) with W^b(R) = W(R+)[1/[ϖ]].

**API.** `Perfectoid.untilt`, `Perfectoid.untiltPlus`, `Perfectoid.untilt.instIsTateRing`.

**Examples.** `Perfectoid.untilt_p`, `Perfectoid.untilt_pflat`, `Perfectoid.untilt_cyclotomic`.

**Sources.** [ECD](#source-ecd) Theorem 3.17, p. 18.

**Prerequisites.** [P1.16](#p1-16).

<a id="p1-20"></a>#### P1.20 — The untilt along a primitive ideal is a perfectoid Tate pair with …

For (R, R+) a perfectoid Tate pair of characteristic p and J ⊆ W(R+) primitive of degree 1, the untilt (A, A+) of P1.19 is a perfectoid Tate pair: A is a perfectoid Tate ring, A+ = W(R+)/J is a ring of integral …

**Supporting results.**
- P1.20a The tilt of W(R+)/J is R+, and θ for W(R+)/J is … (KL16 Kedlaya–Liu II, Lemma 3.3.7)
- P1.20b An integral perfectoid ring with a … (BMS Lemma 3.21)

**Sources.** [AWS](#source-aws) Theorem 2.3.9, p. 55.

**Prerequisites.** [P1.19](#p1-19).

### Untilts and primitive ideals

<a id="p1-21"></a>#### P1.21 — Untilts are classified by primitive ideals of degree 1

(ECD Theorem 3.17; Kedlaya–Liu II Theorem 3.3.8; Kedlaya AWS Theorem 2.3.9; Berkeley Theorem 6.2.11) The functors (S, S+) ↦ (S♭, S♭+, ker θ_S) and (R, R+, J) ↦ (W(R+)[1/[ϖ]]/J, W(R+)/J) are mutually quasi-inverse equivalences between (i) perfectoid Tate pairs (S, S+) with morphisms of Huber pairs and (ii) triples (R, R+, J) with (R, R+) a perfectoid Tate pair of characteristic p and J ⊆ W(R+) primitive of degree 1, a morphism being a morphism f of pairs with W(f)(J) ⊆ J' (then J' = W(f)(J)W(R'+)). The unit is induced by θ_S: W(S♭+)[1/[ϖ♭]]/ker θ ≅ S, the counit is the identification of P1.20, and both are natural. Characteristic-p pairs correspond to J = (p).

**Hypotheses.** No perfectoid base field; both characteristics.

**Supporting results.**
- P1.21a ker θ is compatible with base change: ker θ_S = … (AWS Remark 2.3.17)

**Sources.** [ECD](#source-ecd) Theorem 3.17 (ii), p. 18.

**Prerequisites.** [P1.20](#p1-20), [P1.20a](#p1-20), [P1.18](#p1-18).

<a id="p1-22"></a>#### P1.22 — Marked untilts of a perfectoid pair of characteristic p

Let (R, R+) be a perfectoid Tate pair of characteristic p. A marked untilt of (R, R+) is a triple (S, S+, ι) with (S, S+) a perfectoid Tate pair and ι: (S♭, S♭+) ≅ (R, R+) an isomorphism of Huber pairs; a morphism (S, S+, ι) → (S', S'+, ι') is a morphism f of Huber pairs with ι' ∘ f♭ = ι.

**API.** `Perfectoid.MarkedUntilt`, `Perfectoid.MarkedUntilt.Hom`, `Perfectoid.MarkedUntilt.primitiveIdeal`.

**Examples.** `Perfectoid.MarkedUntilt.self_primitiveIdeal`, `Perfectoid.MarkedUntilt.padicComplex_primitiveIdeal`, `Perfectoid.MarkedUntilt.aut_trivial`.

**Sources.** [Berkeley](#source-berkeley) Lemma 6.2.8, p. 45.

**Prerequisites.** [P1.21](#p1-21).

<a id="p1-23"></a>#### P1.23 — Strict inclusions correspond under tilting

A continuous ring homomorphism f: A → B of complete Hausdorff Tate rings is a strict inclusion if it is injective and a …

**Supporting results.**
- P1.23a Metric criterion: a uniform Tate ring is … (AWS Lemma 2.8.3)
- P1.23b Euclidean division by a primitive element and … (AWS Definition 2.6.5)

**Sources.** [AWS](#source-aws) Theorem 2.4.2, p. 57.

**Prerequisites.** [P1.6](#p1-6).

<a id="p1-24"></a>#### P1.24 — Integral perfectoid rings

A commutative ring R is integral perfectoid if there is π ∈ R with π^p | p such that R is π-adically complete and separated, the Frobenius R/p → R/p is surjective, and the kernel of Fontaine's map θ : W(R♭) → R is principal, where R♭ = lim_{x ↦ x^p} R/p is the tilt (Mathlib's `PreTilt`). Equivalent forms: for a nonzerodivisor π with π^p | p and R π-adically complete, R is integral perfectoid iff Frobenius R/π → R/π^p is an isomorphism; every integral perfectoid R admits a unit multiple of π with a compatible system of p-power roots. Integral perfectoid rings may have p-torsion and need not be domains;

**API.** `IsIntegralPerfectoid`, `IsIntegralPerfectoid.frobenius_mod_pow_bijective`, `IsIntegralPerfectoid.exists_compatible_roots`.

**Examples.** `isIntegralPerfectoid_padicInt_false` (ℤ_p is not integral perfectoid: Frobenius on ℤ_p/p = 𝔽_p is …) `isIntegralPerfectoid_completed_cyclotomic` (The p-adic completion of ℤ_p[p^{1/p^∞}] is integral perfectoid …) `isIntegralPerfectoid_perfect_charP` (A perfect 𝔽_p-algebra that is π-adically complete for some π is …)

**Sources.** [BMS](#source-bms) §3.2, Definition 3.5, p. 21; Lemma 3.9 and Lemma 3.10, p. 22.

**Prerequisites.** `mathlib:IsAdicComplete`, `mathlib:PreTilt`, `mathlib:WittVector.fontaineTheta`.

<a id="p1-25"></a>#### P1.25 — R perfectoid Tate ⇔ R+ integral perfectoid

(BMS1 Lemma 3.20) Let R be a complete Hausdorff Tate ring and R+ a ring of integral elements.

**Sources.** [BMS](#source-bms) Lemma 3.20, p. 26.

**Prerequisites.** [P1.1](#p1-1).

<a id="p1-26"></a>#### P1.26 — Unique flat deformation of perfectoid algebras modulo ϖ

Let R be a perfectoid Tate ring and ϖ = (ϖ♭)♯ a pseudo-uniformizer with compatible roots. Reduction modulo ϖ, A ↦ A/ϖ, is an equivalence between (i) ϖ-adically complete R°a-algebras A that are (almost) flat over …

**Supporting results.**
- P1.26a Frobenius criterion for vanishing of the … (Sch12 Proposition 5.13(ii))

**Sources.** [Sch12](#source-sch12) Theorem 5.10, p. 24.

**Prerequisites.** [P0.22](#p0-22).

### Tilting equivalence

<a id="p1-27"></a>#### P1.27 — Tilting equivalence Perf_R ≃ Perf_{R♭} over an arbitrary perfectoid …

(ECD Theorem 3.13; Berkeley Theorem 6.2.7; Kedlaya AWS Remark 2.3.17; Sch12 Theorem 5.2 over a perfectoid field) Let R be a perfectoid Tate ring with tilt R♭ and J_R := ker(θ_R: W(R♭°) → R°), a primitive ideal (P1.18). The tilting functor S ↦ S♭ (R♭ → S♭ the tilt of R → S, P1.6) is an equivalence from perfectoid R-algebras to perfectoid R♭-algebras, with quasi-inverse T ↦ T♯ := W(T°)[1/[ϖ♭]]/J_R·W(T°)[1/[ϖ♭]], the untilt along J_R·W(T°) (P1.19); the unit S ≅ (S♭)♯ is induced by θ_S and the counit (T♯)♭ ≅ T by P1.20, both natural. Explicitly S♭ = lim_{x↦x^p} S, S♭° = lim_{x↦x^p} S° ≅ lim_Φ S°/ϖ and S♭°/ϖ♭ ≅ S°/ϖ;

**Hypotheses.** No perfectoid base field; continuous homomorphisms between Tate rings preserve power-bounded …

**Sources.** [ECD](#source-ecd) Theorem 3.13, p. 17.

**Prerequisites.** [P1.21](#p1-21), [P1.21a](#p1-21), [P1.6](#p1-6).

<a id="p1-28"></a>#### P1.28 — Perf_R ≃ R°a-Perf ≃ (R°a/ϖ)-Perf over an arbitrary perfectoid Tate …

Let R be a perfectoid Tate ring and ϖ = (ϖ♭)♯ with compatible roots and ϖ^p dividing p in R°. […] Then S ↦ S°a ↦ (S°/ϖ)^a are equivalences Perf_R ≃ R°a-Perf ≃ (R°a/ϖ)-Perf (R°a-Perf as in P1.28a), and …

**Supporting results.**
- P1.28a Perfectoid R-algebras are equivalent to … (Sch12 Lemma 5.6)
- P1.28b In characteristic p, perfectoid algebras modulo … (Sch12 Remark 5.18)

**Sources.** [Sch12](#source-sch12) Definition 5.1(iii), p. 22.

**Prerequisites.** [P1.27](#p1-27).

<a id="p1-29"></a>#### P1.29 — Completed filtered colimits of perfectoid Tate rings are perfectoid, …

Let J be a small filtered category and j ↦ R_j a functor from J to perfectoid Tate rings with continuous ring homomorphisms φ_a: R_i → R_j (no injectivity, flatness or density assumed; characteristic 0, p or neither; no perfectoid base field). […] Then: (a) R is a complete Hausdorff Tate ring with pseudo-uniformizer ϖ and ring of definition R_0; ϖ is a nonzerodivisor on R_0 and R_0/ϖ^nR_0 = colim_j R_j°/ϖ^n; the canonical maps ι_j: R_j → R are continuous …

**API.** `Perfectoid.completedFilteredColimit`, `Perfectoid.completedFilteredColimit.ringOfDefinition`, `Perfectoid.completedFilteredColimit.ι`.

**Examples.** `Perfectoid.completedFilteredColimit_const`, `Perfectoid.completedFilteredColimit_locallyConstant`, `Perfectoid.completedFilteredColimit_tilt_algebraicClosure`.

**Sources.** [Bhatt](#source-bhatt) notes, Remark 6.2.9, p. 48.

**Prerequisites.** [P1.1](#p1-1).

<a id="p1-30"></a>#### P1.30 — Perfected Tate algebras R⟨T_s^{1/p^∞} : s ∈ Σ⟩ in any set of …

Let R be a perfectoid Tate ring with pseudo-uniformizer ϖ (ϖ^p | p in R°) and Σ an arbitrary set, possibly infinite. The perfected Tate algebra R⟨T_s^{1/p^∞} : s ∈ Σ⟩ is A_0[1/ϖ], where A_0 is the ϖ-adic completion of the monoid algebra R°[T^a : a ∈ ℤ[1/p]_{≥0}^{(Σ)}] (AddMonoidAlgebra over the finitely supported exponent vectors Σ →₀ ℤ[1/p]_{≥0}, T^a = Π_s T_s^{a(s)}), topologised with A_0 open and ϖ-adic; equivalently the completion of the perfect …

**API.** `Perfectoid.perfectedTateAlgebra`, `Perfectoid.perfectedTateAlgebra.isPerfectoidTateRing`, `Perfectoid.perfectedTateAlgebra.X`.

**Examples.** `Perfectoid.perfectedTateAlgebra_empty_test`, `Perfectoid.perfectedTateAlgebra.X_pow`, `Perfectoid.perfectedTateAlgebra.tilt_cyclotomic`.

**Sources.** [AWS](#source-aws) Example 2.1.4, p. 50.

**Prerequisites.** [P1.1](#p1-1).

<a id="p1-31"></a>#### P1.31 — The completed cyclotomic field ℚ_p^cycl is a perfectoid field;

The completion ℚ_p^cycl of ℚ_p(μ_{p^∞}) is a perfectoid field: its valuation ring is the p-adic completion ℤ_p^cycl of …

**Sources.** [ECD](#source-ecd) Example 3.4(i), p. 14.

**Prerequisites.** [P1.11](#p1-11).

<a id="p1-32"></a>#### P1.32 — Examples and non-examples of perfectoid Tate rings

The following are perfectoid Tate rings, each a declaration of the library: (1) ℂ_p (Mathlib PadicComplex p), a perfectoid …

**Sources.** [ECD](#source-ecd) Remark 3.3, p. 14.

**Prerequisites.** [P1.1](#p1-1).

<a id="p1-33"></a>#### P1.33 — Compatibility with the anchor's perfect field F and A_inf = W(𝒪_F) …

Let F be a complete rank-one nonarchimedean perfect field of characteristic p with a pseudo-uniformizer ϖ, as in AdicSpaces Layer 6.1. Then (a) F is a perfectoid field of characteristic p (P1.2, P1.11), its tilt …

**Sources.** [ECD](#source-ecd) Proposition 3.5, p. 15.

**Prerequisites.** [P1.2](#p1-2).

<a id="p2"></a>

## P2: Rational localisation, the sheaf theorem and perfectoid spaces

The tilting homeomorphism of adic spectra with its rational subsets, perfectoid rational localisation, completed residue fields, the sheaf theorem with almost acyclicity of O⁺ on rational coverings, affinoid perfectoid and perfectoid spaces as a full subcategory of adic spaces, glued tilting and the slice equivalence, completed tensor products and fibre products, and absolute products in Perf.

<a id="p2-1"></a>#### P2.1 — The tilting map x ↦ x♭ from Spa(R, R⁺) to Spa(R♭, R♭⁺)

Let (R, R⁺) be a perfectoid Tate pair with tilt (R♭, R♭⁺) and sharp map ♯ : R♭ → R (continuous and multiplicative, not additive), X = Spa(R, R⁺), X♭ = Spa(R♭, R♭⁺). For x ∈ X with valuation v_x : R → Γ_x ∪ {0}, the composite v_x ∘ ♯ : R♭ → Γ_x ∪ {0} is a continuous valuation of R♭ with v_x(f♯) ≤ 1 for all f ∈ R♭⁺; its class is a point x♭ ∈ X♭, characterised by |f(x♭)| ≤ |g(x♭)| ⟺ |f♯(x)| ≤ |g♯(x)| for all f, g ∈ R♭ (written |f(x♭)| = |f♯(x)|).

**API.** `PerfectoidSpace.spaTilt`, `PerfectoidSpace.spaTilt_vle_iff`, `PerfectoidSpace.supp_spaTilt`.

**Examples.** `spaTilt_test_perfectoidDisc_point`, `spaTilt_test_charP_eq_id`, `spaTilt_test_preimage_disc`.

**Supporting results.**
- P2.1a Approximation of homogeneous functions on a … (Sch12 Section 6, Lemma 6.5)

**Sources.** [ECD](#source-ecd) Section 3, Theorem 3.12, p. 17.

**Prerequisites.** [P1.4](#p1-4).

### The tilting homeomorphism

<a id="p2-2"></a>#### P2.2 — The tilting homeomorphism Spa(R, R⁺) ≅ Spa(R♭, R♭⁺) identifies …

Let (R, R⁺) be a perfectoid Tate pair (ECD Definition 3.1; no perfectoid base field) with tilt (R♭, R♭⁺). Then the tilting map τ_R : X = Spa(R, R⁺) → X♭ = Spa(R♭, R♭⁺), |f(x♭)| = |f♯(x)| (P2.1), is a homeomorphism, natural in morphisms of perfectoid Tate pairs. A subset U ⊆ X is rational if and only if τ_R(U) ⊆ X♭ is rational; explicitly, for f₁, …, f_n, g ∈ R♭⁺ with f_n = (ϖ♭)^N, τ_R(U(f₁♯, …, f_n♯ / g♯)) = U(f₁, …, f_n / g), and every rational subset of X can be written as U(f₁♯, …, f_n♯ / g♯) for such f_i, g. Consequently τ_R preserves the specialisation order, quasi-compact opens and rank-one (maximal) points, and restricts, for every rational U ⊆ X, to a homeomorphism U ≅ τ_R(U) identifying rational subsets of U and of τ_R(U).

**Supporting results.**
- P2.2a Rational localisations of perfectoid Tate pairs … (KL15 Proposition 3.1.7)
- P2.2b Approximation lemma: every function on a … (Sch12 Section 6, Corollary 6.7(i))

**Sources.** [ECD](#source-ecd) Section 3, Theorem 3.12, p. 17.

**Prerequisites.** [P2.1](#p2-1), [P1.27](#p1-27), [P1.18a](#p1-18).

### Rational localization

<a id="p2-3"></a>#### P2.3 — Rational localisations of a perfectoid Tate pair are perfectoid, with …

Let (R, R⁺) be a perfectoid Tate pair (ECD Definition 3.1; no perfectoid base field), X = Spa(R, R⁺), X♭ = Spa(R♭, R♭⁺) and τ_R : X ≅ X♭ the tilting homeomorphism. For every rational subset U ⊆ X, the rational localisation (O_X(U), O_X⁺(U)) of AdicSpaces (Layer 3.1: O_X(U) = R⟨T/s⟩ for any presentation U = U(T/s), O_X⁺(U) the integral closure of the image of R⁺[T/s];

**API.** `Perfectoid.rationalLocalization`, `Perfectoid.rationalLocalization.isPerfectoidTateRing`, `Perfectoid.rationalLocalization.tiltEquiv`.

**Examples.** `rationalLocalization_test_perfectoidDisc` (For R = Q_p^cycl⟨T^{1/p^∞}⟩ and U = {|T| ≤ |ϖ|}, …) `rationalLocalization_test_noBaseField` (For R of ECD Example 3.4(iv) and U = {|T| ≤ |p|}, …) `rationalLocalization_test_charP` (If pR = 0 then tiltEquiv is the identity of (O_X(U), O_X⁺(U)) …)

**Supporting results.**
- P2.3a Untilted rational localisations: explicit … (Sch12 Section 6, Lemma 6.4 (statement))

**Sources.** [ECD](#source-ecd) Section 3, Theorem 3.18, p. 18.

**Prerequisites.** [P2.2](#p2-2), [P2.2a](#p2-2), [P2.1](#p2-1).

<a id="p2-4"></a>#### P2.4 — The presheaf of perfectoid pairs on rational subsets: restriction …

Let (R, R⁺) be a perfectoid Tate pair, X = Spa(R, R⁺), τ = τ_R. On the poset Rat(X) of rational subsets of X, the assignment U ↦ (O_X(U), O_X⁺(U)) with AdicSpaces' restriction maps ρ_{U,V} (V ⊆ U) is a functor Rat(X)^op → {perfectoid Tate pairs} (P2.3), with: (a) transitivity: for V ⊆ U rational, V is rational in U ≅ Spa(O_X(U), O_X⁺(U)) and ρ_{U,V} is the rational localisation of (O_X(U), O_X⁺(U)) at V;

**API.** `PerfectoidSpace.rationalPairFunctor`, `PerfectoidSpace.rationalPairFunctor.map_comp`, `PerfectoidSpace.rationalPairFunctor.isRationalLocalization_map`.

**Examples.** `rationalPairFunctor_test_restriction_disc`, `rationalPairFunctor_test_plusModEquiv_whole`, `rationalPairFunctor_test_plus_ne_powerBounded`.

**Sources.** [ECD](#source-ecd) Section 3, Example 3.22(ii), p. 19.

**Prerequisites.** [P2.3](#p2-3).

<a id="p2-5"></a>#### P2.5 — Completed residue fields of perfectoid affinoids are perfectoid and …

Let (R, R⁺) be a perfectoid Tate pair, X = Spa(R, R⁺), x ∈ X, and (k(x)^, k(x)^⁺) the completed residue affinoid field of x (the completion of the residue field of the stalk O_{X,x} for the topology of v_x, with …

**Sources.** [Sch12](#source-sch12) Section 6, Corollary 6.7(ii) with proof, p. 35.

**Prerequisites.** [P2.3](#p2-3).

<a id="p2-6"></a>#### P2.6 — Perfectoid Tate pairs are stably uniform and sheafy, with …

Let (R, R⁺) be a perfectoid Tate pair (ECD Definition 3.1; no base field), X = Spa(R, R⁺). Then (a) (R, R⁺) is stably uniform: O_X(U) is uniform for every rational U ⊆ X (Hansen–Kedlaya Definition 3.13;

**Sources.** [KL15](#source-kl15) §3.6, Theorem 3.6.15 with proof, p. 94.

**Prerequisites.** [P2.3](#p2-3).

<a id="p2-7"></a>#### P2.7 — Almost exactness of the integral Čech complex of O⁺ on rational …

Let (R, R⁺) be a perfectoid Tate pair (ECD Definition 3.1; no base field), X = Spa(R, R⁺). For every rational U ⊆ X and every finite covering 𝔘 = (U₁, …, U_m) of U by rational subsets, the augmented alternating …

**Supporting results.**
- P2.7a Almost exactness lifts from reduction modulo ϖ … (Sch12 Section 6, Proposition 6.14 (characteristic 0))
- P2.7b Integral Čech cohomology of a stably uniform … (Sch12 Section 6, Proposition 6.10(iii))
- P2.7c From almost Čech acyclicity on the rational … (KL15  Proposition 2.4.21)

**Sources.** [Berkeley](#source-berkeley) Lecture 7, proof of Theorem 7.4.4, p. 53.

**Prerequisites.** [P2.6](#p2-6).

### The sheaf theorem

<a id="p2-8"></a>#### P2.8 — The sheaf theorem: O_X is a sheaf with vanishing higher cohomology …

Let (R, R⁺) be a perfectoid Tate pair (ECD Definition 3.1: any perfectoid Tate ring, of characteristic 0, p or mixed, with no perfectoid base field) and X = Spa(R, R⁺). Then: (i) O_X and O_X⁺ are sheaves on X; (ii) for every rational U ⊆ X, (O_X(U), O_X⁺(U)) is a perfectoid Tate pair with tilt (O_{X♭}(U♭), O_{X♭}⁺(U♭)), U♭ the image of U in X♭; (iii) H⁰(X, O_X) = R and H^i(X, O_X) = 0 for i > 0; (iv) H⁰(X, O_X⁺) = R⁺ and, for i > 0, the R⁺-module H^i(X, O_X⁺) is almost zero, i.e. killed by every topologically nilpotent element of R⁺ (equivalently H^i(X, O_X⁺ᵃ) = H^i(X, O_X°ᵃ) = 0 in the almost category, Sch12 Remark 6.12); (v) (i)-(iv) hold for every rational U in place of X.

**Supporting results.**
- P2.8a Almost acyclicity for p-finite perfectoid … (Sch12 Section 6, Definition 6.9)
- P2.8b Perfectoid affinoid algebras in characteristic … (Sch12 Section 6, Lemma 6.13(i))

**Sources.** [ECD](#source-ecd) Section 3, Theorem 3.18, p. 18.

**Prerequisites.** [P2.6](#p2-6), [P2.3](#p2-3), [P2.4](#p2-4).

<a id="p2-9"></a>#### P2.9 — Affinoid perfectoid spaces: adic spectra of perfectoid Huber pairs

An adic space X (an object of AdicSpaces' category of adic spaces, Layer 5: an object of Huber's category 𝒱 locally isomorphic to the adic spectrum of a sheafy Huber pair) is *affinoid perfectoid* if there are a complete Hausdorff Huber pair (R, R⁺) (Tau Ceti …

**API.** `PerfectoidSpace.IsAffinoidPerfectoid`, `PerfectoidSpace.spa`, `PerfectoidSpace.IsAffinoidPerfectoid.spa`.

**Examples.** `IsAffinoidPerfectoid.spa_Cp`, `not_isAffinoidPerfectoid_spa_Qp`, `isAffinoidPerfectoid_empty`.

**Sources.** [Berkeley](#source-berkeley) Lecture 7, §7.1, Remark 7.1.3, printed p. 49.

**Prerequisites.** [P1.1](#p1-1).

### Perfectoid space

<a id="p2-10"></a>#### P2.10 — Perfectoid spaces: the full subcategory Perfd of adic spaces, and …

A *perfectoid space* is an adic space X (AdicSpaces Layer 5) covered by open subspaces that are affinoid perfectoid (P2.9): every x ∈ X has an open neighbourhood U such that the open adic subspace (U, O_X|_U, (v_y)_{y ∈ U}) is isomorphic to Spa(R, R⁺) with R a perfectoid Tate ring and R⁺ ⊆ R° a ring of integral elements (ECD Definition 3.19). The category Perfd of perfectoid spaces is the full subcategory of AdicSpaces' category of adic spaces on these objects (Mathlib `ObjectProperty.FullSubcategory`): morphisms are morphisms of adic spaces; open subspaces, gluing and the sheaf property of morphisms are AdicSpaces', and no second carrier (no separate locally ringed space and no second gluing theory) is introduced.

**Hypotheses.** X is an object of AdicSpaces' category of adic spaces.

**API.** `PerfectoidSpace.IsPerfectoidSpace`, `PerfectoidSpace`, `PerfectoidSpace.toAdicSpace`.

**Examples.** `isPerfectoidSpace_empty` (The empty adic space is a perfectoid space (it is covered by …) `not_isPerfectoidSpace_spa_Qp` (Spa(ℚ_p, ℤ_p) is not a perfectoid space: its only nonempty open …) `not_isPerfectoidSpace_closedUnitDisc_Qp` (The closed unit disc Spa(ℚ_p⟨T⟩, ℤ_p⟨T⟩) is not a perfectoid …)

**Sources.** [ECD](#source-ecd) Section 3, Definition 3.19, p. 18.

**Prerequisites.** [P2.9](#p2-9), [P1.2](#p1-2), `AdicSpacesPartII:R0/adic-morphism`.

<a id="p2-11"></a>#### P2.11 — The glued tilt X ↦ X♭ of a perfectoid space

For every perfectoid space X (P2.10; any characteristic, no base field) there is a perfectoid space X♭ of characteristic p, the *tilt* of X, with a homeomorphism |X| ≅ |X♭|, x ↦ x♭, constructed by gluing (ECD, the sentence after Definition 3.19; Sch12 Definition 6.16 and Proposition 6.17 over a perfectoid field).

**API.** `PerfectoidSpace.tilt`, `PerfectoidSpace.tiltHomeomorph`, `PerfectoidSpace.tiltSpaIso`.

**Examples.** `tilt_spa_cyclotomic`, `tilt_spa_perfectedDisc`, `tilt_empty`.

**Supporting results.**
- P2.11a Rational subsets of affinoid perfectoid opens … (Sch12 Section 6, Proposition 6.17)
- P2.11b Open subspaces of perfectoid spaces are … (Wedhorn Remark 8.23(2))

**Sources.** [ECD](#source-ecd) Section 3, after Definition 3.19, p. 18.

**Prerequisites.** [P2.10](#p2-10).

### Tilting equivalence of perfectoid spaces

<a id="p2-12"></a>#### P2.12 — Tilting equivalence of perfectoid spaces: Perfd/X ≃ Perf/X♭

Let X be a perfectoid space with tilt X♭ (P2.11). (a) The functor Perfd/X → Perf/X♭ = Perfd/X♭ on slice categories (Mathlib `CategoryTheory.Over`), (f : Y → X) ↦ (f♭ : Y♭ → X♭), is an equivalence of categories (a Mathlib `CategoryTheory.Equivalence`). (b) It commutes with restriction to open subspaces of X, and a perfectoid space Y over X is affinoid perfectoid iff Y♭ is; for X = Spa(A, A⁺) it restricts on affinoid perfectoid spaces to the equivalence of P2.12a.

**Supporting results.**
- P2.12a Tilting is an equivalence between perfectoid … (ECD Section 3, Theorem 3.13 and its proof)

**Sources.** [ECD](#source-ecd) Section 3, Corollary 3.20, p. 19.

**Prerequisites.** [P2.11](#p2-11), [P2.11a](#p2-11), [P2.11b](#p2-11).

<a id="p2-13"></a>#### P2.13 — Completed tensor products of perfectoid Tate pairs are perfectoid, …

Let (A, A⁺) → (B, B⁺) and (A, A⁺) → (C, C⁺) be morphisms of complete Hausdorff Huber pairs (Tau Ceti `Huber.Pair.Hom`) with A, B, C perfectoid Tate rings (ECD Definition 3.1; any characteristic; no perfectoid …

**Supporting results.**
- P2.13a Characteristic p: the completed tensor product … (KL15 Remark 3.1.6(c))

**Sources.** [AWS](#source-aws) §2.4, Theorem 2.4.1, p. 57.

**Prerequisites.** `AdicSpacesPartII:R0/completed-tensor-product`.

<a id="p2-14"></a>#### P2.14 — The uniform completed tensor product of perfectoid rings over an …

Let (A, A⁺) be a complete Hausdorff Huber pair with A a Tate ring (not necessarily perfectoid, uniform or of characteristic p), and let (A, A⁺) → (B, B⁺), (A, A⁺) → (C, C⁺) be morphisms of Huber pairs with B, C …

**Supporting results.**
- P2.14a A uniform Tate ring receiving a dense-image map … (AWS Lemma 2.8.4)

**Sources.** [KL16](#source-kl16) §3.3, Corollary 3.3.21, p. 66.

**Prerequisites.** `AdicSpacesPartII:R0/uniform-completed-tensor-product`.

<a id="p2-15"></a>#### P2.15 — Affinoid perfectoid fibre products: Spa(B ⊗̂_A C) is a fibre product …

Let X = Spa(A, A⁺), Y = Spa(B, B⁺), Z = Spa(C, C⁺) be affinoid perfectoid spaces and Y → X ← Z morphisms, corresponding (Wedhorn Proposition 8.25) to morphisms of complete perfectoid Tate pairs (A, A⁺) → (B, B⁺) …

**Sources.** [Sch12](#source-sch12) Section 6, proof of Proposition 6.18, p. 38.

**Prerequisites.** [P2.13](#p2-13).

### Fibre products of perfectoid spaces

<a id="p2-16"></a>#### P2.16 — Fibre products of perfectoid spaces exist in adic spaces and are …

Let f : Y → X and g : Z → X be morphisms of perfectoid spaces (any characteristic; no perfectoid base field). The fibre product W = Y ×_X Z exists in AdicSpaces' category of adic spaces and is a perfectoid space; with its projections p : W → Y, q : W → Z it is therefore also a fibre product in Perfd, Perfd has all fibre products (Mathlib `HasPullbacks`), and the inclusion Perfd ⥤ AdicSpace preserves them.

**API.** `PerfectoidSpace.pullback`, `PerfectoidSpace.pullback.fst`, `PerfectoidSpace.pullback.condition`.

**Examples.** `pullback_perfectedDiscs` (For a perfectoid Tate ring R: Spa(R⟨T^{1/p^∞}⟩, R⁺⟨T^{1/p^∞}⟩) …) `pullback_galois_points` (For a finite Galois extension L/K of perfectoid fields with …) `pullback_id` (Y ×_X X ≅ Y via p, for the identity of X; and Y ×_X ∅ = ∅.)

**Supporting results.**
- P2.16a The plus ring of a perfectoid completed tensor … (Bhatt Exercise 9.3.14, printed)
- P2.16b Tilting commutes with fibre products of … (AWS Theorem 2.4.1)

**Sources.** [Sch12](#source-sch12) Section 6, Proposition 6.18, p. 38.

**Prerequisites.** [P2.15](#p2-15), [P2.10](#p2-10), [P2.11a](#p2-11).

<a id="p2-17"></a>#### P2.17 — Fibre products of perfectoid spaces over an analytic adic space, in …

Let S be an analytic adic space (AdicSpaces Layer 5; every point analytic, e.g. […] Then the fibre product Y ×_S Z exists in Perfd: there is a perfectoid space W with morphisms p : W → Y, q : W → Z, f p = g q, such that for every perfectoid space T, Hom(T, W) = Hom(T, Y) ×_{Hom(T, S)} Hom(T, Z).

**API.** `PerfectoidSpace.pullbackOverAnalytic`, `PerfectoidSpace.pullbackOverAnalytic.fst`, `PerfectoidSpace.pullbackOverAnalytic.condition`.

**Examples.** `pullbackOverAnalytic_Cp_Qp`, `pullbackOverAnalytic_perfectoidBase`, `pullbackOverAnalytic_empty`.

**Sources.** [KL16](#source-kl16) §3.3, Corollary 3.3.21, p. 66.

**Prerequisites.** [P2.14](#p2-14).

<a id="p2-18"></a>#### P2.18 — Absolute products in Perf

Let X, Y be perfectoid spaces of characteristic p. […] Then (C_{m,n}, C⁺_{m,n}) is a complete perfectoid Tate pair (C_{m,n} is a perfect complete Tate ring); a morphism of pairs (C_{m,n}, C⁺_{m,n}) → (R, R⁺) to a complete Huber pair with R Tate is the same as morphisms φ : (A, A⁺) → (R, R⁺), ψ : (B, B⁺) → (R, R⁺) with φ(ϖ)^m ψ(ϖ')⁻¹ ∈ R⁺ and ψ(ϖ')^n φ(ϖ)⁻¹ ∈ R⁺; for m ≤ m', n ≤ n', Spa(C_{m,n}) is the rational subset {|u_m| ≤ 1, |v_n| ≤ 1} of …

**API.** `PerfectoidSpace.Perf.prod`, `PerfectoidSpace.Perf.prodFst`, `PerfectoidSpace.Perf.prodLift`.

**Examples.** `prod_perfectoidFields`, `prod_empty`, `not_isPerfectoidSpace_spa_Fp_final`.

**Supporting results.**
- P2.18a Characteristic p: perfectoid spaces are adic … (Bhatt Exercise 9.3.12 (Mihara), printed)

**Sources.** [Berkeley](#source-berkeley) Lecture 8, §8.3, Lemma 8.3.5 and Remark 8.3.6, printed p. 61.

**Prerequisites.** [P2.10](#p2-10).

<a id="p2-19"></a>#### P2.19 — Scholze's perfectoid spaces over a perfectoid field K are the …

Let K be a perfectoid field (P1.10), K° its valuation ring and K⁺₀ ⊆ K° the smallest ring of integral elements of K, the integral closure of ℤ·1 + K°° in K (Wedhorn Remark 7.15(2)); […] (i) Sch12's perfectoid …

**Sources.** [Sch12](#source-sch12) Section 6, Definition 6.15, p. 38.

**Prerequisites.** [P2.10](#p2-10).

<a id="p3"></a>

## P3: Almost purity and the étale site

The algebraic prefix (henselian pairs, Elkik approximation, finite étale algebras over henselian completions and completed colimits), almost purity in characteristic p, the untilting functor on finite étale algebras, finite extensions of perfectoid fields and Fontaine–Wintenberger, the almost purity theorem with its three conclusions, étale and finite étale morphisms of perfectoid spaces with their comparison to the adic ones, and the étale site with its tilting equivalence and almost acyclicity.

<a id="p3-1"></a>#### P3.1 — Elkik's approximation theorem for noetherian henselian pairs …

Let (A, 𝔍) be a henselian pair with A noetherian, Â its 𝔍-adic completion, B a finitely generated A-algebra and B̂ = B ⊗_A Â. […] Then for every integer n and every Â-section ε̂: Spec Â → Spec B̂ whose …

**Supporting results.**
- P3.1a Henselian pairs: adic completeness, filtered … (Stacks Tag 0FWT (Lemma 15.11.13), Section 15.11 Henselian pairs)
- P3.1b Newton approximation: approximate solutions … (GR Lemma 5.4.8 and the paragraph after its proof)
- P3.1c Approximate solutions over henselian pairs (GR Proposition 5.4.13)
- P3.1d Sections of smooth quasi-projective schemes … (GR Proposition 5.4.21)

**Sources.** [Elkik](#source-elkik) §II, Théorème 2 bis, p. 560.

**Prerequisites.** `mathlib:HenselianRing`.

### Henselian approximation

<a id="p3-2"></a>#### P3.2 — Finite étale algebras do not change under henselian completion: …

(a) (Gabber–Ramero Proposition 5.4.54; book numbering 5.4.53) Let R be a ring, t ∈ R a non-zero-divisor, I ⊆ R an ideal with (R, tI) henselian, and R^∧ the (t, I)-adic completion. Then base change B ↦ B ⊗_{R[t⁻¹]} R^∧[t⁻¹] is an equivalence of categories FÉt(R[t⁻¹]) ≃ FÉt(R^∧[t⁻¹]) (Mathlib `CommAlgCat.FiniteEtale`), compatible with tensor products;

**Hypotheses.** t a non-zero-divisor (automatic for t = ϖ a unit of A inside a ring of definition A₀ ⊆ A).

**Supporting results.**
- P3.2a Isomorphism classes of points of a smooth … (GR 5.4.36 and Theorem 5.4.38)
- P3.2b Finitely generated projective modules over … (GR Corollary 5.4.42)
- P3.2c The scheme of étale algebra structures on a … (GR Lemma 5.4.46)
- P3.2d Finite étale algebras over a completed filtered … (Sch12 Lemma 7.5 (i))

**Sources.** [GR](#source-gr) §5.4, Proposition 5.4.54 (arXiv v3; Proposition 5.4.53 in the LNM 1800 book), pp. 126–127.

**Prerequisites.** [P3.1a](#p3-1), `mathlib:CommAlgCat.FiniteEtale`, `mathlib:CommAlgCat.FiniteEtale.baseChange`.

### Almost purity in characteristic p

<a id="p3-3"></a>#### P3.3 — Almost purity in characteristic p: finite étale algebras over a …

Let R be a perfectoid Tate ring of characteristic p (equivalently a perfect complete Tate ring of characteristic p, P1.2; no base field), ϖ ∈ R a pseudouniformiser (it has all p-power roots ϖ^{1/pⁿ} in R°), R⁺ ⊆ R° a ring of integral elements, and S ∈ FÉt(R) with its natural topology and plus ring S⁺ = integral closure of R⁺ in S. Then: (i) S is perfect, complete and uniform, hence a perfectoid Tate ring of characteristic p, and (S, S⁺) is a perfectoid Huber pair;

**Supporting results.**
- P3.3a Relative Frobenius of a weakly étale map is an … (Bhatt Chapter 4, §4.3, Lemma 4.3.8)
- P3.3b Finite étale algebras over a uniform complete … (AWS Lecture 1, §1.10, Lemma 1.10.1)

**Sources.** [Sch12](#source-sch12) §5, Proposition 5.23, p. 28.

**Prerequisites.** [P1.2](#p1-2), [P1.2c](#p1-2), [P1.1](#p1-1).

<a id="p3-4"></a>#### P3.4 — Characteristic p: inverting ϖ is an equivalence between almost finite …

Let R be a perfectoid Tate ring of characteristic p with pseudouniformiser ϖ. […] Then the functor (R°a)_afet → FÉt(R), A ↦ A_*[ϖ⁻¹] (A_* the ring of almost elements, P0.6), with its natural topology, is an …

**Sources.** [GR](#source-gr) §3.5, 3.5.26 and Theorem 3.5.28, p. 69.

**Prerequisites.** [P3.3](#p3-3).

<a id="p3-5"></a>#### P3.5 — The untilting functor on finite étale algebras, T ↦ T♯, via almost …

Let R be a perfectoid Tate ring with tilt R♭ (P1.4) and choose a pseudouniformiser ϖ♭ ∈ R♭ with ϖ := (ϖ♭)♯ satisfying ϖ^p | p in R° (P1.3), so that R♭°/ϖ♭ = R°/ϖ (P1.5b). […] Equivalently (Kedlaya–Liu Lemma 3.6.20, Kedlaya AWS Lemma 2.8.10) T♯ = W(T⁺)[1/[ϖ♭]]/ξ for a generator ξ of ker(θ: W(R♭⁺) → R⁺) (P1.19), which shows finite étaleness without almost mathematics.

**API.** `Perfectoid.FiniteEtale.untilt`, `Perfectoid.FiniteEtale.untilt_isPerfectoid`, `Perfectoid.FiniteEtale.tiltUntiltIso`.

**Examples.** `Perfectoid.FiniteEtale.untilt_test_self`, `Perfectoid.FiniteEtale.untilt_test_quadratic`, `Perfectoid.FiniteEtale.untilt_test_tilt`.

**Sources.** [Sch12](#source-sch12) §5, Proposition 5.22 and the diagram following it, p. 28.

**Prerequisites.** [P3.4](#p3-4).

<a id="p3-6"></a>#### P3.6 — The untilting functor FÉt(R♭) → FÉt(R) is fully faithful, inverse to …

Let R be a perfectoid Tate ring with tilt R♭ (any characteristic, no perfectoid base field). The untilting functor (−)♯: FÉt(R♭) → FÉt(R) of P3.5 is fully faithful and, on its essential image, inverse to …

**Sources.** [Sch12](#source-sch12) §5, Theorem 5.25, p. 29.

**Prerequisites.** [P3.5](#p3-5).

<a id="p3-7"></a>#### P3.7 — Finite extensions of perfectoid fields are perfectoid, and tilting is …

Let K be a perfectoid field (characteristic 0 or p) with tilt K♭. (i) Every finite extension L/K, with its natural topology (the unique extension of the absolute value, Mathlib `spectralNorm`), is a perfectoid …

**Supporting results.**
- P3.7a If the tilt of a perfectoid field is … (Sch12 Proposition 3.8)
- P3.7b The completed cyclotomic extension of a finite … (Sch12 Section 3, Theorem 3.7(i))
- P3.7c The completed tensor product of plus rings need … (AWS  Lemma 2.8.7)

**Sources.** [Sch12](#source-sch12) §3, Theorem 3.7 (i), p. 17.

**Prerequisites.** [P3.6](#p3-6).

### Fontaine–Wintenberger theorem

<a id="p3-8"></a>#### P3.8 — Fontaine–Wintenberger: the absolute Galois groups of a perfectoid …

Let K be a perfectoid field with tilt K♭. […] Then L ↦ L♭ (for finite Galois L/K inside K̄, with L♭ ⊆ C♭ by functoriality of tilting) defines an isomorphism of profinite groups Gal(K̄/K) ≅ Gal(K♭^sep/K♭) (Mathlib `Field.absoluteGaloisGroup` up to the choice of closures), compatible with the Galois correspondences (Mathlib `InfiniteGalois.IntermediateFieldEquivClosedSubgroup`): finite subextensions of K̄/K correspond to finite subextensions of K♭^sep/K♭ with the same degrees.

**Supporting results.**
- P3.8a In characteristic p, finite étale algebras are … (Sch12 Lemma 7.5 (ii))

**Sources.** [Sch12](#source-sch12) §1, Theorem 1.1, p. 2.

**Prerequisites.** [P3.7](#p3-7), [P3.2](#p3-2), [P1.15](#p1-15).

<a id="p3-9"></a>#### P3.9 — Tilting is an equivalence between finite étale algebras over a …

Let R be a perfectoid Tate ring (ECD Definition 3.1, P1.1: any characteristic, no perfectoid base field) with tilt R♭. Then the untilting functor (−)♯: FÉt(R♭) → FÉt(R) (P3.5) is an equivalence of categories, …

**Supporting results.**
- P3.9a Finite étale algebras over the completed … (Berkeley Lecture 7, §7.4, Lemma 7.4.6 and the argument after Theorem 7.4.8)

**Sources.** [ECD](#source-ecd) §6, Theorem 6.1 (ii), p. 26.

**Prerequisites.** [P3.6](#p3-6).

<a id="p3-10"></a>#### P3.10 — Finite étale algebras over a perfectoid Tate ring are perfectoid (ECD …

Let R be a perfectoid Tate ring (any characteristic, no perfectoid base field) and S a finite étale R-algebra (Mathlib `Module.Finite R S`, `Algebra.Etale R S`) with its natural topology as a finite R-module. …

**Sources.** [ECD](#source-ecd) §6, Theorem 6.1 (i), p. 26.

**Prerequisites.** [P3.9](#p3-9).

<a id="p3-11"></a>#### P3.11 — Almost purity, categorical form: (R°a)_afet ≃ FÉt(R) by inverting ϖ, …

Let R be a perfectoid Tate ring with tilt R♭, ϖ = (ϖ♭)♯ a pseudouniformiser with ϖ^p | p, and R⁺ ⊆ R° any ring of integral elements. Then: (a) the functor (R°a)_afet → FÉt(R), A ↦ A_*[ϖ⁻¹] (natural topology), is …

**Sources.** [Sch12](#source-sch12) §7, Theorem 7.9 (i), p. 42.

**Prerequisites.** [P3.9](#p3-9).

<a id="p3-12"></a>#### P3.12 — The integral closure is almost finite étale: S° over R° for S finite …

Let R be a perfectoid Tate ring (any characteristic, no perfectoid base field), R⁺ ⊆ R° a ring of integral elements, ϖ a pseudouniformiser, S ∈ FÉt(R) and S⁺ the integral closure of R⁺ in S. Then: (i) S° is the …

**Sources.** [ECD](#source-ecd) §6, Theorem 6.1 (iii), p. 26.

**Prerequisites.** [P3.11](#p3-11).

### Almost purity theorem

<a id="p3-13"></a>#### P3.13 — The almost purity theorem for perfectoid Tate rings

Let R be a perfectoid Tate ring (ECD Definition 3.1; characteristic 0, p, or neither; no perfectoid base field) with tilt R♭, and FÉt(R) the category of finite étale R-algebras with their natural topologies. (i) For every S ∈ FÉt(R), S is perfectoid (P3.10). (ii) Tilting S ↦ S♭ is an equivalence FÉt(R) ≃ FÉt(R♭), with quasi-inverse the untilting functor (P3.9). (iii) For every S ∈ FÉt(R), S° is almost finite étale over R° (equivalently S⁺a over R⁺a for any ring of integral elements and S⁺ its integral closure), and uniformly almost finite projective (P3.12); categorically, A ↦ A_*[ϖ⁻¹] is an equivalence (R°a)_afet ≃ FÉt(R) (P3.11). The three conclusions are distinct statements: (iii) is about the integral structure up to almost zero and is neither étaleness of S° over R° nor finite freeness of S over R. Consequences recorded elsewhere: every finite étale (resp. étale) morphism of perfectoid spaces is strongly finite étale (resp. strongly étale) (P3.17c); for R = K a perfectoid field, (i)–(iii) are P3.7.

**Sources.** [ECD](#source-ecd) §6, Theorem 6.1, p. 26.

**Prerequisites.** [P3.10](#p3-10), [P3.9](#p3-9), [P3.12](#p3-12).

<a id="p3-14"></a>#### P3.14 — Finite étale morphisms of perfectoid spaces (ECD Definition 6.2(i))

Let X, Y be perfectoid spaces (P2.10: the full subcategory of AdicSpaces' adic spaces locally of the form Spa(R, R⁺), R perfectoid). A morphism f: Y → X is finite étale (`PerfectoidSpace.IsFiniteEtale f`) if it is finite étale as a morphism of analytic adic spaces (AdicEtaleGeometry:A1/finite-etale-morphism: X has a cover by open affinoids V = Spa(A, A⁺) with f⁻¹(V) ≅ Spa(B, B⁺) over V, B ∈ FÉt(A) with its natural topology and B⁺ the integral closure of …

**API.** `PerfectoidSpace.IsFiniteEtale`, `PerfectoidSpace.IsFiniteEtale.iff_adic`, `PerfectoidSpace.IsFiniteEtale.iff_forall_affinoidPerfectoid`.

**Examples.** `PerfectoidSpace.IsFiniteEtale.test_fold`, `PerfectoidSpace.IsFiniteEtale.test_kummer`, `PerfectoidSpace.IsFiniteEtale.test_rational`.

**Sources.** [ECD](#source-ecd) §6, Definition 6.2 (i), p. 26.

**Prerequisites.** `AdicEtaleGeometry:A1/finite-etale-morphism`.

### Étale morphisms of perfectoid spaces

<a id="p3-15"></a>#### P3.15 — Étale morphisms of perfectoid spaces (ECD Definition 6.2(ii))

A morphism f: Y → X of perfectoid spaces is étale (`PerfectoidSpace.IsEtale f`) if it is étale in A1's local sense (AdicEtaleGeometry:A1/etale-morphism, `AdicSpace.IsEtaleLocalDescription`): every y ∈ Y has an open neighbourhood V ⊆ Y such that f|_V factors as V ↪ W → U ↪ X with V → W an open immersion, W → U finite étale (P3.14) and U ⊆ X open. W is then automatically perfectoid. This is ECD Definition 6.2(ii) (whose printed condition 'y ∈ Y' is read as y ∈ V), Scholze 2012 Definition 7.1(iii) and Berkeley Definition 7.5.1(2). Equivalent local form: U may be taken a rational subset of an affinoid perfectoid open of X, W = Spa(S, S⁺) with S ∈ FÉt(O(U)), and V a rational subset of W;

**Hypotheses.** X, Y perfectoid; an adic space étale over a perfectoid X is perfectoid …

**API.** `PerfectoidSpace.IsEtale`, `PerfectoidSpace.IsEtale.iff_adic`, `PerfectoidSpace.IsEtale.of_isOpenImmersion`.

**Examples.** `PerfectoidSpace.IsEtale.test_openImmersion` (Open immersions of perfectoid spaces are étale;) `PerfectoidSpace.IsEtale.test_rational_in_cover` (For R perfectoid, S ∈ FÉt(R) and a rational subset V ⊆ Spa(S, …) `PerfectoidSpace.IsEtale.test_not_finite` (The inclusion of the open unit disc (a non-quasi-compact open) …)

**Sources.** [ECD](#source-ecd) §6, Definition 6.2 (ii), p. 26.

**Prerequisites.** `AdicEtaleGeometry:A1/etale-morphism`, [P3.14](#p3-14), [P2.10](#p2-10).

<a id="p3-16"></a>#### P3.16 — Strongly finite étale and strongly étale morphisms of perfectoid …

(Scholze 2012 Definition 7.2, over an arbitrary perfectoid base) A morphism (R, R⁺) → (S, S⁺) of perfectoid Huber pairs is strongly finite étale if it is finite étale (S ∈ FÉt(R) with its natural topology, S⁺ the integral closure of R⁺) and S°a is almost finite étale …

**API.** `PerfectoidSpace.IsStronglyFiniteEtale`, `PerfectoidSpace.IsStronglyEtale`, `Perfectoid.Pair.IsStronglyFiniteEtale`.

**Examples.** `PerfectoidSpace.IsStronglyFiniteEtale.test_charp`, `PerfectoidSpace.IsStronglyEtale.test_open`, `PerfectoidSpace.IsStronglyFiniteEtale.test_tilt`.

**Sources.** [Sch12](#source-sch12) §7, Definition 7.2 (i), p. 39.

**Prerequisites.** [P0.14](#p0-14).

<a id="p3-17"></a>#### P3.17 — Comparison of perfectoid finite étale and étale morphisms with …

Let X be a perfectoid space. (a) (Perfectoidness) If g: Y → X is a finite étale (resp. étale) morphism of analytic adic spaces in A1's sense (AdicEtaleGeometry:A1/finite-etale-morphism, …

**Supporting results.**
- P3.17a Perfectoid Tate rings are strongly sheafy; (Berkeley Lecture 6, §6.3, Proposition 6.3.3 (3))
- P3.17b Preimages of affinoid perfectoid opens under … (Sch12 Proposition 7.6)
- P3.17c Every finite étale (resp. étale) morphism of … (Sch12 after Theorem 7.9)

**Sources.** [ECD](#source-ecd) §6, paragraph after Definition 6.2, p. 26.

**Prerequisites.** [P3.10](#p3-10).

### Étale site of a perfectoid space

<a id="p3-18"></a>#### P3.18 — The étale site X_ét and the finite étale site X_fét of a perfectoid …

Let X be a perfectoid space. Its étale site X_ét (`PerfectoidSpace.smallEtale X`) is the small étale site of the underlying locally strongly sheafy analytic adic space (AdicEtaleGeometry:A1/etale-site; P3.17a): objects the adic spaces étale over X — all perfectoid (P3.17 (a)), i.e. the perfectoid spaces étale over X of ECD — with all X-morphisms (étale by P3.18a (3)), and the topology generated by jointly surjective families (on all points, including higher-rank ones).

**API.** `PerfectoidSpace.smallEtale`, `PerfectoidSpace.smallEtaleTopology`, `PerfectoidSpace.smallEtale.isPerfectoid`.

**Examples.** `PerfectoidSpace.smallEtale.test_point` (For K a perfectoid field, Spa(K, O_K)_fét ≃ finite continuous …) `PerfectoidSpace.smallEtale.test_empty` (For X = ∅ the site has a single object (∅) covered by the empty …) `PerfectoidSpace.smallEtale.test_adic` (PerfectoidSpace.smallEtale X = AdicSpace.smallEtale …)

**Supporting results.**
- P3.18a Étale and finite étale morphisms of perfectoid … (Berkeley Lecture 7, §7.5, Proposition 7.5.2 (1))

**Sources.** [Sch12](#source-sch12) §7, Definition 7.11, p. 43.

**Prerequisites.** [P3.17a](#p3-17), [P3.17](#p3-17), [P3.17b](#p3-17).

<a id="p3-19"></a>#### P3.19 — Étale descent for finite étale morphisms and finite projective …

Let X be a perfectoid space with étale site X_ét (P3.18). (a) (Locality) A morphism f: Y → X of perfectoid spaces is finite étale if, for some covering {X_i → X} in X_ét, every base change Y ×_X X_i → X_i is …

**Sources.** [KL15](#source-kl15) §1.3, Theorem 1.3.4, p. 16.

**Prerequisites.** [P3.18](#p3-18).

<a id="p3-20"></a>#### P3.20 — Tilting identifies the étale sites: X_ét ≃ X♭_ét, compatibly with …

Let X be a perfectoid space with tilt X♭ (P2.11). The tilting functor Y ↦ Y♭ of the slice equivalence (P2.12: perfectoid spaces over X ≃ perfectoid spaces over X♭) restricts to equivalences of categories X_ét ≃ …

**Sources.** [ECD](#source-ecd) §6, Theorem 6.3, p. 26.

**Prerequisites.** [P3.18](#p3-18).

<a id="p3-21"></a>#### P3.21 — Almost acyclicity of O⁺ and acyclicity of O on the étale site of an …

Let X = Spa(R, R⁺) be an affinoid perfectoid space (R perfectoid Tate, no base field) with étale site X_ét, and write H^i(X_ét, −) for sheaf cohomology of abelian sheaves on X_ét (Mathlib …

**Sources.** [ECD](#source-ecd) §6, Theorem 6.3, second paragraph, p. 26.

**Prerequisites.** [P3.18](#p3-18).

<a id="p3-22"></a>#### P3.22 — ECD Theorem 6.3: the tilting equivalence of étale sites and the …

(ECD Theorem 6.3, over an arbitrary perfectoid base.) Let X be a perfectoid space with tilt X♭.

**Sources.** [ECD](#source-ecd) §6, Theorem 6.3, p. 26.

**Prerequisites.** [P3.20](#p3-20).

<a id="p4"></a>

## P4: Injections, immersions and separatedness

Points with values in affinoid perfectoid fields, injections and the qcqs isomorphism criterion, immersions, Zariski closed immersions and the universal perfectoid space over a Zariski closed subset, the theorem that Zariski closed immersions are strongly Zariski closed, diagonals, separatedness and its valuative criterion, and the behaviour of all of these under tilting.

<a id="p4-1"></a>#### P4.1 — Affinoid perfectoid fields and (K, K⁺)-valued points of perfectoid …

An affinoid perfectoid field is a pair (K, K⁺) of a perfectoid field K (a perfectoid Tate ring that is a nonarchimedean field, ECD Definition 3.6; P1.10) and an open and bounded valuation subring K⁺ ⊂ K;

**API.** `PerfectoidSpace.AffinoidField`, `PerfectoidSpace.AffinoidField.toPair`, `PerfectoidSpace.AffinoidField.ofRankOne`.

**Examples.** `AffinoidField.subsingleton_spa_ofRankOne`, `AffinoidField.card_spa_eq_two`, `AffinoidField.fieldPoints_affinoidEquiv_closedPoint`.

**Sources.** [ECD](#source-ecd) §5, Proposition 5.3 (ii), p. 21.

**Prerequisites.** [P1.10](#p1-10).

<a id="p4-2"></a>#### P4.2 — Quasicompact and quasiseparated morphisms of perfectoid spaces

A perfectoid space X is quasicompact (resp. quasiseparated) if |X| is quasicompact (resp. a Mathlib `QuasiSeparatedSpace`). A morphism f : Y → X of perfectoid spaces is quasicompact if f⁻¹(U) is quasicompact for every quasicompact open U ⊆ |X|, equivalently for every …

**API.** `PerfectoidSpace.QuasiCompact`, `PerfectoidSpace.QuasiSeparated`, `PerfectoidSpace.quasiCompact_iff_affinoid`.

**Examples.** `quasiCompact_affinoid`, `not_quasiCompact_openDisc`, `quasiSeparated_id`.

**Sources.** [ECD](#source-ecd) §5, remark after Proposition 5.11, p. 25.

**Prerequisites.** `mathlib:CompactSpace`.

### Injection of perfectoid spaces

<a id="p4-3"></a>#### P4.3 — Injections of perfectoid spaces

A morphism f : Y → X of perfectoid spaces is an injection if for every perfectoid space Z the map f_* : Hom(Z, Y) → Hom(Z, X) is injective (ECD Definition 5.1). It suffices to test affinoid perfectoid Z, because two morphisms Z → Y that agree on an open affinoid cover of Z agree. In the category Perfd of perfectoid spaces this says exactly that f is a monomorphism (Mathlib `CategoryTheory.Mono`), and, fibre products existing in Perfd (P2.16), it is equivalent to the diagonal Δ_f : Y → Y ×_X Y being an isomorphism (Mathlib `CategoryTheory.Limits.pullback.isIso_diagonal_iff`).

**Hypotheses.** Perfectoid spaces are those of P2.10 (ECD Definition 3.19): adic …

**API.** `PerfectoidSpace.IsInjection`, `PerfectoidSpace.isInjection_iff_mono`, `PerfectoidSpace.IsInjection.of_affinoid`.

**Examples.** `isInjection_rationalOpen` (For X = Spa(R, R⁺) affinoid perfectoid and U ⊆ X rational, the …) `isInjection_diagonal` (For every morphism f : Y → X of perfectoid spaces, Δ_f : Y → Y …) `not_isInjection_quadraticExtension` (For a perfectoid field K and a separable quadratic extension …)

**Supporting results.**
- P4.3a Integral perfectoid criterion: integral … (BMS Lemma 3.21)

**Sources.** [ECD](#source-ecd) §5, Definition 5.1 and following sentence, p. 21.

**Prerequisites.** `mathlib:CategoryTheory.Mono`, `mathlib:CategoryTheory.IsSplitMono`, `mathlib:CategoryTheory.Limits.pullback.diagonal`.

<a id="p4-4"></a>#### P4.4 — The perfectoid space attached to a filtered intersection of rational …

Let X = Spa(R, R⁺) be an affinoid perfectoid space, ϖ ∈ R⁺ a pseudouniformizer with ϖ^p | p admitting compatible p-power roots (P1.3), and 𝒰 a nonempty family of rational subsets of X that is filtered (for U, V ∈ 𝒰 some W ∈ 𝒰 lies in U ∩ V); put T := ⋂_{U∈𝒰} U ⊆ |X|. […] Then: (a) S_𝒰 is a perfectoid Tate ring, S⁺_𝒰 is a ring of integral elements, S⁺_𝒰 ⊆ S_𝒰° with almost zero cokernel, S⁺_𝒰/ϖⁿ = colim_U O⁺_X(U)/ϖⁿ, and each O_X(U) → S_𝒰 has dense image;

**API.** `PerfectoidSpace.proRationalSubspace`, `PerfectoidSpace.proRationalSubspace.ι`, `PerfectoidSpace.proRationalSubspace.plus_mod_pow`.

**Examples.** `proRationalSubspace_singleton`, `proRationalSubspace_rationalNhds`, `proRationalSubspace_annulusClosure`.

**Supporting results.**
- P4.4a Morphisms of perfectoid spaces are generalizing … (ECD sentence before Lemma 2.5)
- P4.4b Almost integral perfectoid criterion: a … (Sch12 Lemma 5.6)

**Sources.** [ECD](#source-ecd) §7, remark after Lemma 7.6, p. 31.

**Prerequisites.** [P4.3](#p4-3).

<a id="p4-5"></a>#### P4.5 — The completed residue field point i_x : Spa(K(x), K(x)⁺) → X

For a perfectoid space X and a point x ∈ X, the completed residue field K(x) with its open and bounded valuation subring K(x)⁺ is an affinoid perfectoid field (P2.5), and there is a canonical morphism i_x : Spa(K(x), K(x)⁺) → X sending the closed point to x: on an affinoid perfectoid neighbourhood U = Spa(R, R⁺) of x it is given by (R, R⁺) → (K(x), K(x)⁺), independently of U. Moreover (ECD Example 5.2): (a) i_x is isomorphic over U to the pro-rational …

**API.** `PerfectoidSpace.residueFieldPoint`, `PerfectoidSpace.residueFieldPoint_closedPoint`, `PerfectoidSpace.residueFieldPoint_isInjection`.

**Examples.** `residueFieldPoint_closedPoint`, `residueFieldPoint_gauss`, `residueFieldPoint_not_isOpenImmersion`.

**Supporting results.**
- P4.5a Completed tensor products over a nonarchimedean … (KL15 Lemma 2.2.9)
- P4.5b The stalk of O⁺/ϖ at x is K(x)⁺/ϖ (Torsion Lemma II.3.1)

**Sources.** [ECD](#source-ecd) §5, Example 5.2, p. 21.

**Prerequisites.** [P4.4](#p4-4).

<a id="p4-6"></a>#### P4.6 — Isomorphism criterion for qcqs maps: bijectivity on points and on (C, …

Let f : Y → X be a quasicompact and quasiseparated morphism of perfectoid spaces (P4.2). The following are equivalent: (i) f is an isomorphism;

**Supporting results.**
- P4.6a A qcqs perfectoid space with a unique closed … (ECD Example 5.2, last paragraph)
- P4.6b Points of fibre products of perfectoid spaces … (ECD  Proposition 5.3)
- P4.6c Every affinoid perfectoid field embeds into an … (ECD  Lemma 5.4)
- P4.6d A map of perfectoid fields that is injective on … (ECD  Proposition 5.3)
- P4.6e A homeomorphism inducing isomorphisms of … (ECD  Lemma 5.4)

**Sources.** [ECD](#source-ecd) §5, Lemma 5.4, p. 23.

**Prerequisites.** [P4.2](#p4-2).

<a id="p4-7"></a>#### P4.7 — Characterisations of injections of perfectoid spaces

Let f : Y → X be a morphism of perfectoid spaces. The following are equivalent: (i) f is an injection (P4.3);

**Supporting results.**
- P4.7a (K, K⁺)-points of a map that is injective on … (ECD  Proposition 5.3, (iii) ⇒ (iv))

**Sources.** [ECD](#source-ecd) §5, Proposition 5.3 (iii), p. 21.

**Prerequisites.** [P4.3](#p4-3).

<a id="p4-8"></a>#### P4.8 — Base change of injections, and the underlying space of a pulled-back …

Let f : Y → X be an injection of perfectoid spaces and X' → X any morphism, with base change f' : Y' = X' ×_X Y → X'. Then f' is an injection, and the natural map |Y'| → |X'| ×_{|X|} |Y| is a homeomorphism (the …

**Sources.** [ECD](#source-ecd) §5, Corollary 5.5 (i), p. 24.

**Prerequisites.** [P4.3](#p4-3).

<a id="p4-9"></a>#### P4.9 — Injections are exactly the universally injective maps

A morphism f : Y → X of perfectoid spaces is an injection if and only if it is universally injective: for every morphism X' …

**Sources.** [ECD](#source-ecd) §5, Corollary 5.5 (ii), p. 24.

**Prerequisites.** [P4.8](#p4-8).

### Immersion of perfectoid spaces

<a id="p4-10"></a>#### P4.10 — Immersions, open immersions and closed immersions of perfectoid spaces

A morphism f : Y → X of perfectoid spaces is an immersion if f is an injection (P4.3) and |f| : |Y| → |X| is a locally closed immersion, i.e. a topological embedding (Mathlib `Topology.IsEmbedding`) with locally closed image (Mathlib `IsLocallyClosed`). It is an open immersion (resp. closed immersion) if moreover |f| is an open (resp.

**Hypotheses.** Topology of |Y| is its own spectral-space topology; the embedding condition says it is the subspace …

**API.** `PerfectoidSpace.IsImmersion`, `PerfectoidSpace.IsOpenImmersion`, `PerfectoidSpace.IsClosedImmersion`.

**Examples.** `isOpenImmersion_rationalSubset` (For X = Spa(R, R⁺) affinoid perfectoid and U ⊆ X rational, U → …) `isClosedImmersion_origin` (The point T^{1/pⁿ} = 0 (all n), i.e. Spa(C, O_C) → …) `isImmersion_empty` (The empty perfectoid space maps to every X by an open and …)

**Sources.** [ECD](#source-ecd) §5, Definition 5.6, p. 24.

**Prerequisites.** [P4.3](#p4-3), `mathlib:Topology.IsEmbedding`, `mathlib:IsLocallyClosed`.

<a id="p4-11"></a>#### P4.11 — Open immersions of perfectoid spaces agree with the anchor's open …

For a morphism f : Y → X of perfectoid spaces the following are equivalent: (a) f is an open immersion in the sense of P4.10; (b) f is an open immersion of adic spaces in the sense of AdicSpaces (Layer 5.1): an …

**Sources.** [ECD](#source-ecd) §5, after Proposition 5.3, p. 21.

**Prerequisites.** [P4.10](#p4-10).

### Zariski closed immersion

<a id="p4-12"></a>#### P4.12 — Zariski closed subsets and Zariski closed immersions into affinoid …

Let X = Spa(R, R⁺) be an affinoid perfectoid space. For an ideal I ⊆ R put V(I) := {x ∈ |X| : |g(x)| = 0 for all g ∈ I}; a subset Z ⊆ |X| is Zariski closed if Z = V(I) for some ideal I (Scholze torsion paper Definition II.2.1). A morphism f : Z → X of perfectoid spaces is a Zariski closed immersion (defined by I) if f is a closed immersion (P4.10) and f(|Z|) = V(I) (ECD Definition 5.7 (i)). Conventions: V(I) depends only on the closure of I and on its radical;

**API.** `PerfectoidSpace.zeroLocus`, `PerfectoidSpace.zeroLocus_eq_iInter_rational`, `PerfectoidSpace.isClosed_zeroLocus`.

**Examples.** `zeroLocus_T` (For R = C⟨T^{1/p^∞}⟩, V((T)) = {origin}, and the Zariski closed …) `zeroLocus_T_sub_one` (For C ∋ μ_{p^∞}, V((T − 1)) ⊆ Spa(C⟨T^{±1/p^∞}⟩) is …) `zeroLocus_bot_top` (V(0) = |X| and V(R) = ∅.)

**Sources.** [Torsion](#source-torsion) §II.2, Definition II.2.1, p. 13.

**Prerequisites.** [P4.10](#p4-10), `tauceti:TauCeti.ValuationSpectrum.rationalSubset`, `tauceti:TauCeti.Huber.Pair.Hom.range_spaComap_quotientHom`.

<a id="p4-13"></a>#### P4.13 — Strongly Zariski closed immersions: surjective perfectoid quotients

Let X = Spa(R, R⁺) be an affinoid perfectoid space. […] Equivalently (by the open mapping theorem, Tau Ceti `Huber.IsTateRing.isQuotientMap`), with I := ker(R → S) closed, (S, S⁺) is isomorphic to AdicSpaces' quotient pair Tau Ceti `Huber.Pair.quotient (R, R⁺) I` and R/I is perfectoid. The plus-ring clause is part of the definition: it is what makes a strongly Zariski closed map a closed immersion.

**API.** `PerfectoidSpace.IsStronglyZariskiClosed`, `PerfectoidSpace.IsStronglyZariskiClosed.surjective`, `PerfectoidSpace.IsStronglyZariskiClosed.plus_eq`.

**Examples.** `isStronglyZariskiClosed_origin`, `isStronglyZariskiClosed_id`, `not_isStronglyZariskiClosed_ofPowerBounded`.

**Sources.** [ECD](#source-ecd) §5, Definition 5.7 (ii), p. 24.

**Prerequisites.** `tauceti:TauCeti.Huber.Pair`.

### Universal perfectoid Zariski closed subspace

<a id="p4-14"></a>#### P4.14 — The universal perfectoid space over a Zariski closed subset

Let X = Spa(R, R⁺) be an affinoid perfectoid space and I ⊆ R an ideal. […] Then: (a) Z_I is affinoid perfectoid and R → S_I has dense image; (b) |ι_I| is a homeomorphism onto V(I); (c) a morphism g : W → X from a perfectoid space factors through ι_I if and only if g^*(h) = 0 in O_W(W) for all h ∈ I, if and only if |g| lands in V(I), and then uniquely; (d) ι_I is a Zariski closed immersion defined by I (P4.12); (e) I^perf := ker(R → S_I) is a closed ideal containing I, equal to {h ∈ R : |h| = 0 on V(I)}, and Z_{I^perf} = Z_I;

**API.** `PerfectoidSpace.zariskiClosedSubspace`, `PerfectoidSpace.zariskiClosedSubspace.ι`, `PerfectoidSpace.zariskiClosedSubspace.range_ι`.

**Examples.** `zariskiClosedSubspace_T` (R = C⟨T^{1/p^∞}⟩, I = (T): S_I = C, and ker(R → S_I) is the …) `zariskiClosedSubspace_T_sub_one` (C = ℂ_p, R = C⟨T^{±1/p^∞}⟩, I = (T − 1): S_I = C⁰(ℤ_p, ℂ_p), …) `zariskiClosedSubspace_bot` (Z_0 = X and Z_R = ∅.)

**Supporting results.**
- P4.14a Every Zariski closed immersion is the universal … (Torsion after Remark II.2.3)

**Sources.** [Torsion](#source-torsion) §II.2, Lemma II.2.2, p. 13.

**Prerequisites.** [P4.4](#p4-4), [P4.12](#p4-12), [P4.10](#p4-10).

<a id="p4-15"></a>#### P4.15 — Zariski closed immersions are strongly Zariski closed

Let X = Spa(R, R⁺) be an affinoid perfectoid space and I ⊆ R an ideal. […] Hence every Zariski closed immersion is strongly Zariski closed, and the two notions coincide. The proof constructs S from the universal perfectoid ring under the semiperfectoid ring R⁺/(I ∩ R⁺)^-: for a ring A that is a quotient of an integral perfectoid ring and p-adically complete, there is an initial integral perfectoid ring A_perfd under A, A → A_perfd is surjective, and its kernel is the set of elements killed by every map to an integral perfectoid ring. This perfectoidization construction, in the generality of semiperfectoid rings, is part of this target; the roadmap does not assume it from elsewhere.

**Supporting results.**
- P4.15a A surjection of perfectoid Tate rings is almost … (AWS Lecture 2, Lemma 2.8.5)
- P4.15b Base change of Zariski closed and strongly … (Torsion Lemma II.2.9 (i))

**Sources.** [ECD](#source-ecd) §5, Theorem 5.8 with proof, p. 25.

**Prerequisites.** [P4.14](#p4-14), [P4.13](#p4-13), [P4.12](#p4-12).

<a id="p4-16"></a>#### P4.16 — Comparison with the anchor's closed immersions

(a) For X = Spa(R, R⁺) affinoid perfectoid, a morphism f : Z → X of perfectoid spaces is strongly Zariski closed if and only …

**Supporting results.**
- P4.16a Immersions are stable under base change and … (ECD Corollary 5.5 (i))
- P4.16b A surjective perfectoid quotient is a Zariski … (ECD after Definition 5.7)

**Sources.** [AWS](#source-aws) Lecture 2, Example 2.4.9.

**Prerequisites.** [P4.13](#p4-13).

<a id="p4-17"></a>#### P4.17 — Closed immersions and Zariski closed immersions are different notions

(a) Every strongly Zariski closed map is Zariski closed, and every Zariski closed immersion is a closed immersion (P4.16b, …

**Sources.** [Berkeley](#source-berkeley) Lecture 17, remark after Definition 17.4.2, p. 155.

**Prerequisites.** [P4.4](#p4-4).

<a id="p4-18"></a>#### P4.18 — The diagonal of a morphism of perfectoid spaces is an immersion

Let f : Y → X be any morphism of perfectoid spaces. Then Δ_f : Y → Y ×_X Y is an immersion (P4.10). More precisely: (a) Δ_f is a split monomorphism, hence an injection;

**Sources.** [ECD](#source-ecd) §5, Proposition 5.9, p. 25.

**Prerequisites.** [P4.3](#p4-3).

### Separated map of perfectoid spaces

<a id="p4-19"></a>#### P4.19 — Separated morphisms of perfectoid spaces

A morphism f : Y → X of perfectoid spaces is separated if its diagonal Δ_f : Y → Y ×_X Y is a closed immersion (P4.10) (ECD Definition 5.10); it is quasiseparated if Δ_f is quasicompact (P4.2). In Mathlib's vocabulary, IsSeparated = MorphismProperty.diagonal IsClosedImmersion on Perfd, the pattern of `AlgebraicGeometry.IsSeparated`.

**Hypotheses.** Fibre products as in P2.

**API.** `PerfectoidSpace.IsSeparated`, `PerfectoidSpace.isSeparated_iff_isClosed_range_diagonal`, `PerfectoidSpace.IsSeparated.quasiSeparated`.

**Examples.** `isSeparated_affinoid` (Every morphism Spa(S, S⁺) → Spa(R, R⁺) of affinoid perfectoid …) `isSeparated_of_isInjection` (Injections, in particular identities and open immersions, are …) `not_isSeparated_gluedDisc` (Glue two copies of the perfectoid closed disc over a perfectoid …)

**Supporting results.**
- P4.19a Morphisms of affinoid perfectoid spaces are … (ECD after Lemma 7.19)

**Sources.** [ECD](#source-ecd) §5, Definition 5.10, p. 25.

**Prerequisites.** [P4.10](#p4-10), [P4.2](#p4-2), `mathlib:CategoryTheory.Limits.pullback.diagonal`.

### Valuative criterion for separatedness

<a id="p4-20"></a>#### P4.20 — Valuative criterion for separatedness of perfectoid spaces

Let f : Y → X be a morphism of perfectoid spaces. The following are equivalent: (i) f is separated; (ii) |Δ_f| : |Y| → |Y ×_X Y| is a closed immersion of topological spaces; (iii) f is quasiseparated and for every affinoid perfectoid field (K, K⁺) and every commutative square formed by a : Spa(K, O_K) → Y and b : Spa(K, K⁺) → X with f ∘ a = b ∘ j (j : Spa(K, O_K) → Spa(K, K⁺) the inclusion of the rank-one point) there is at most one c : Spa(K, K⁺) → Y with c ∘ j = a and f ∘ c = b. (ECD Proposition 5.11.)

**Supporting results.**
- P4.20a Maps from Spa(R, R⁺) into a separated space are … (ECD Proposition 10.10)

**Sources.** [ECD](#source-ecd) §5, Proposition 5.11 (i)-(ii), p. 25.

**Prerequisites.** [P4.19](#p4-19), [P4.18](#p4-18), [P4.16a](#p4-16).

<a id="p4-21"></a>#### P4.21 — Tilting of injections, immersions, separatedness and strongly Zariski …

Let X be a perfectoid space with tilt X♭ and f : Y → X a morphism with tilt f♭ : Y♭ → X♭ (P2.11; |Y| = |Y♭|, |X| = |X♭|). (a) f is an injection, an immersion, an open or closed immersion, quasiseparated or …

**Supporting results.**
- P4.21a Surjectivity and closed ideals with perfectoid … (AWS Lecture 2, Theorem 2.4.4)
- P4.21b Criteria for strong Zariski closedness in terms … (Torsion Definition II.2.6)

**Sources.** [Torsion](#source-torsion) §II.2, Lemma II.2.7, p. 15.

**Prerequisites.** [P4.3](#p4-3).

<a id="p5"></a>

## P5: Cofiltered limits and finite-stage étale descent

Completed colimits of perfectoid Tate pairs and cofiltered limits of affinoid perfectoid spaces, with the homeomorphism of underlying spaces, descent of quasicompact opens, ω₁-cofiltered limits without completion, countably generated decompositions and cardinal bounds, and finite-stage descent of qcqs étale objects along cofiltered limits.

### Completed direct limit

<a id="p5-1"></a>#### P5.1 — The completed direct limit (R, R⁺) of a filtered system of perfectoid …

Standing setting of this layer: p is a fixed prime; I is a small cofiltered category; X_i = Spa(R_i, R_i⁺), i ∈ I, is a cofiltered diagram of affinoid perfectoid spaces, given at ring level by a functor I^op → CAff (complete Huber pairs, AdicEtaleGeometry:A1/huber-pair-rational-site), i ↦ (R_i, R_i⁺), with each R_i a perfectoid Tate ring in the sense of ECD …

**Hypotheses.** The standing setting of this layer; a compatible pseudouniformiser (i₀, ϖ).

**API.** `Perfectoid.completedColimit`, `Perfectoid.completedColimitPlus`, `Perfectoid.completedColimit.instIsTateRing`.

**Examples.** `completedColimit_test_initial` (If I has an initial object i_* (so the diagram of rings has a …) `completedColimit_test_profinite` (For S = lim_n {0,1}^n and R_n = K^{S_n}, R_n⁺ = O_K^{S_n} over …) `completedColimit_test_plusQuotient` (In the profinite example R⁺/ϖ^n = C^0(S, O_K/ϖ^n) equals the …)

**Supporting results.**
- P5.1a A compatible pseudouniformiser with p-power … (ECD Section 6, Proposition 6.4, statement)
- P5.1b The ϖ-adic completion of a ring integrally … (Bhatt Section 5.1, Lemma 5.1.2, printed)

**Sources.** [ECD](#source-ecd) Section 6, Proposition 6.4, statement, p. 27.

**Prerequisites.** [P1.1](#p1-1), `AdicEtaleGeometry:A1/huber-pair-rational-site`, `mathlib:CommRingCat.FilteredColimits.colimitCoconeIsColimit`.

<a id="p5-2"></a>#### P5.2 — The completed direct limit of perfectoid Tate pairs is a perfectoid …

In the situation of P5.1: (a) R⁺ is open and bounded in R and integrally closed in R, so R⁺ is a ring of integral elements …

**Sources.** [ECD](#source-ecd) Section 6, proof of Proposition 6.5, p. 29.

**Prerequisites.** [P5.1](#p5-1).

### Cofiltered limits

<a id="p5-3"></a>#### P5.3 — Cofiltered limits of affinoid perfectoid spaces

Standing setting of this layer: p is a fixed prime; I is a small cofiltered category; X_i = Spa(R_i, R_i⁺), i ∈ I, is a cofiltered diagram of affinoid perfectoid spaces, given at ring level by a functor I^op → CAff (complete Huber pairs, AdicEtaleGeometry:A1/huber-pair-rational-site), i ↦ (R_i, R_i⁺), with each R_i a perfectoid Tate ring in the sense of ECD Definition 3.1 (P1.1; characteristic 0, p or mixed, no perfectoid base field) and R_i⁺ ⊆ R_i° open and integrally closed; for a morphism a: j → i of I the transition map φ_a: R_i → R_j is continuous with φ_a(R_i⁺) ⊆ R_j⁺ (Tau Ceti `Huber.Pair.Hom`).

**Hypotheses.** The standing setting; the X_i are affinoid perfectoid (the construction is not applied to …

**API.** `PerfectoidSpace.cofilteredLimit`, `PerfectoidSpace.cofilteredLimit.π`, `PerfectoidSpace.cofilteredLimit.isLimit`.

**Examples.** `cofilteredLimit_test_profinite` (For a perfectoid field K and S = lim_n {0,1}^n: cofilteredLimit …) `cofilteredLimit_test_initial` (If I has an initial object i_*, then p_{i_*}: cofilteredLimit X …) `cofilteredLimit_test_residueField` (For x ∈ X₀ affinoid perfectoid, the limit over the rational …)

**Supporting results.**
- P5.3a The completed direct limit does not depend on … (ECD Section 6, Proposition 6.5, statement)
- P5.3b Uniformity of perfectoid spaces: global … (ECD Section 6, Proposition 6.5)

**Sources.** [ECD](#source-ecd) Section 6, Proposition 6.5, statement, p. 29.

**Prerequisites.** [P5.1](#p5-1), [P5.2](#p5-2), [P2.9](#p2-9).

<a id="p5-4"></a>#### P5.4 — The underlying space of a cofiltered limit of affinoid perfectoid …

Let X = lim_i X_i be the limit of a cofiltered diagram of affinoid perfectoid spaces X_i = Spa(R_i, R_i⁺) (P5.3). Then the map |X| → lim_i |X_i| induced by the projections is a homeomorphism of spectral spaces: …

**Supporting results.**
- P5.4a The adic spectrum of a completed direct limit … (Sch12 Section 6, Lemma 6.13 (ii))
- P5.4b Quasicompact opens, constructible sets and … (Stacks Tag 0A30 (Lemma 5.24.6))
- P5.4c Base changes of a qcqs perfectoid space along a … (ECD Section 6, Proposition 6.4 (ii))
- P5.4d Quasicompact opens and rational subsets of a … (ECD Section 6, Proposition 6.4 (ii))
- P5.4e Restriction of a cofiltered limit to a rational … (Sch12 Section 6, Lemma 6.13 (iii))

**Sources.** [ECD](#source-ecd) Section 6, Proposition 6.4 (o), p. 27.

**Prerequisites.** [P5.3](#p5-3).

<a id="p5-5"></a>#### P5.5 — ω₁-cofiltered limits of affinoid perfectoid spaces need no completion

In the situation of P5.3 assume that I is ω₁-cofiltered: every functor J → I from a category J with countably many morphisms …

**Sources.** [ECD](#source-ecd) Section 6, Proposition 6.5, statement, p. 29.

**Prerequisites.** [P5.1](#p5-1).

### ω₁-cofiltered limits

<a id="p5-6"></a>#### P5.6 — Every affinoid perfectoid space is an ω₁-cofiltered limit of …

Let X = Spa(R, R⁺) be an affinoid perfectoid space and ϖ as in P5.6a. […] Then: (a) 𝒮(R) is ω₁-directed (every countable subset of 𝒮(R) has an upper bound in 𝒮(R)) and ⋃_{R' ∈ 𝒮(R)} R' = R; (b) colim_{R' ∈ 𝒮(R)} (R', R'⁺) → (R, R⁺) is an isomorphism of Huber pairs, without completion; (c) X = lim_{R' ∈ 𝒮(R)} Spa(R', R'⁺) in perfectoid spaces and |X| = lim |Spa(R', R'⁺)|: X is an ω₁-cofiltered limit of affinoid perfectoid spaces with topologically countably generated rings of functions;

**Supporting results.**
- P5.6a Every countable subset of a perfectoid Tate … (ECD Section 6, Proposition 6.5)

**Sources.** [ECD](#source-ecd) Section 6, Proposition 6.5, statement, p. 29.

**Prerequisites.** [P5.5](#p5-5), [P5.3](#p5-3), [P5.4](#p5-4).

<a id="p5-7"></a>#### P5.7 — Cardinal bounds for cofiltered limits of affinoid perfectoid spaces

Let κ be a cutoff cardinal (DiamondsAndVStacks:D0/cutoff-cardinal, ECD Lemma 4.1), λ < κ a cardinal, I a cofiltered category with fewer than λ morphisms, and X_i = Spa(R_i, R_i⁺) (i ∈ I) a cofiltered diagram of …

**Sources.** [ECD](#source-ecd) Section 6, Proposition 6.4, final statement, p. 27.

**Prerequisites.** [P5.3](#p5-3).

<a id="p5-8"></a>#### P5.8 — The 2-colimit of a filtered diagram of categories

Let J be a small filtered category and F a pseudofunctor from J (as a locally discrete bicategory) to categories (Mathlib `CategoryTheory.Pseudofunctor`): categories C_j, functors F_a: C_i → C_j for a: i → j, and coherent natural isomorphisms F_{ba} ≅ F_b ∘ F_a and F_{id} ≅ id. The filtered 2-colimit 2-colim_j C_j is the category whose objects are pairs (i, x) with x an object of C_i, whose morphisms are Hom((i, x), (j, y)) := colim_{(k, a: i → k, b: j → …

**API.** `CategoryTheory.FilteredTwoColimit`, `CategoryTheory.FilteredTwoColimit.ι`, `CategoryTheory.FilteredTwoColimit.ιCompIso`.

**Examples.** `filteredTwoColimit_test_const`, `filteredTwoColimit_test_discrete`, `filteredTwoColimit_test_finitelyPresentedModules`.

**Sources.** [Berkeley](#source-berkeley) Lecture 7, Remark 7.4.7, printed p. 54.

**Prerequisites.** `mathlib:CategoryTheory.Pseudofunctor`.

<a id="p5-9"></a>#### P5.9 — Finite étale objects over a cofiltered limit of affinoid perfectoid …

For a perfectoid space Z, Z_ét is the category of perfectoid spaces étale over Z (ECD Definition 6.2, P3.18), Z_fét, Z_ét,qcqs and Z_ét,qc,sep its full subcategories of finite étale, of quasicompact …

**Sources.** [ECD](#source-ecd) Section 6, Proposition 6.4 (i), p. 27.

**Prerequisites.** [P3.2d](#p3-2).

<a id="p5-10"></a>#### P5.10 — Quasicompact quasiseparated étale objects over a cofiltered limit …

For a perfectoid space Z, Z_ét is the category of perfectoid spaces étale over Z (ECD Definition 6.2, P3.18), Z_fét, Z_ét,qcqs and Z_ét,qc,sep its full subcategories of finite étale, of quasicompact …

**Supporting results.**
- P5.10a Faithfulness of base change to a cofiltered … (ECD Section 6, Proposition 6.4 (ii))
- P5.10b Fullness of base change to a cofiltered limit … (ECD Section 6, Proposition 6.4 (ii))
- P5.10c Every qcqs étale space over a cofiltered limit … (ECD Section 6, Proposition 6.4 (ii))

**Sources.** [ECD](#source-ecd) Section 6, Proposition 6.4 (ii), p. 27.

**Prerequisites.** [P5.8](#p5-8).

<a id="p5-11"></a>#### P5.11 — Quasicompact separated étale objects over a cofiltered limit form the …

For a perfectoid space Z, Z_ét is the category of perfectoid spaces étale over Z (ECD Definition 6.2, P3.18), Z_fét, Z_ét,qcqs and Z_ét,qc,sep its full subcategories of finite étale, of quasicompact …

**Supporting results.**
- P5.11a Separatedness of a qcqs étale map is recognised … (ECD Section 6, Proposition 6.4 (iii))

**Sources.** [ECD](#source-ecd) Section 6, Proposition 6.4 (iii), p. 27.

**Prerequisites.** [P5.10](#p5-10).

### Finite-stage descent

<a id="p5-12"></a>#### P5.12 — Finite-stage descent along cofiltered limits of affinoid perfectoid …

For a perfectoid space Z, Z_ét is the category of perfectoid spaces étale over Z (ECD Definition 6.2, P3.18), Z_fét, Z_ét,qcqs and Z_ét,qc,sep its full subcategories of finite étale, of quasicompact quasiseparated (P4.2), and of quasicompact separated étale spaces, and base change along X_j → X_i or X → X_i is the fibre product of perfectoid spaces (P2.16), which preserves these classes (P3.18a). Let X_i = Spa(R_i, R_i⁺), i ∈ I, be a cofiltered system of affinoid perfectoid spaces with limit X = Spa(R, R⁺) (P5.3).

**Supporting results.**
- P5.12a Surjectivity and isomorphism of qcqs étale maps … (ECD Section 6, Proposition 6.4 (ii))

**Sources.** [ECD](#source-ecd) Section 6, before Proposition 6.4, p. 26.

**Prerequisites.** [P5.9](#p5-9), [P5.10](#p5-10), [P5.11](#p5-11).

<a id="p6"></a>

## P6: κ-small perfectoid spaces and pro-étale morphisms

κ-small and uniformly κ-small perfectoid spaces with their closure properties, affinoid pro-étale morphisms as cofiltered limits of affinoid étale ones, the pro-category equivalence, κ-bounded presentations, pro-étale morphisms with their stability under composition, base change, cancellation and limits, and the pro-étaleness of Zariski closed immersions and diagonals.

### κ-small perfectoid space

<a id="p6-1"></a>#### P6.1 — κ-small perfectoid spaces

Fix a cardinal κ with ℵ₀ < κ that is a strong limit (2^λ < κ for every cardinal λ < κ); every cutoff cardinal of DiamondsAndVStacks:D0/cutoff-cardinal (ECD Lemma 4.1) is one. A perfectoid space X (P2.10: an adic space locally isomorphic to Spa(R, R⁺) for a perfectoid Tate pair (R, R⁺) in the sense of ECD Definition 3.1, with no perfectoid base field) is κ-small if (i) its underlying set |X| has cardinality #|X| < κ, and (ii) for every open affinoid perfectoid subspace U = Spa(A, A⁺) ⊆ X (so A = O_X(U)) the ring A has cardinality #A < κ.

**API.** `PerfectoidSpace.IsKappaSmall`, `PerfectoidSpace.IsKappaSmall.card_lt`, `PerfectoidSpace.IsKappaSmall.card_sections_lt`.

**Examples.** `isKappaSmall_spa_Cp` (For every cardinal κ with ℵ₀ < κ and κ a strong limit, Spa(C_p, …) `isKappaSmall_empty` (The empty perfectoid space is κ-small for every κ.) `isKappaSmall_affinoid_iff` (For an affinoid perfectoid space X = Spa(A, A⁺), IsKappaSmall κ …)

**Sources.** [ECD](#source-ecd) §4, Definition 4.2, p. 20.

**Prerequisites.** `DiamondsAndVStacks:D0/cutoff-cardinal`, [P2.10](#p2-10), [P2.9](#p2-9).

<a id="p6-2"></a>#### P6.2 — Uniformly κ-small perfectoid spaces

Let κ be an uncountable strong limit cardinal. A perfectoid space X is uniformly κ-small if there is a cardinal λ < κ such that #|X| ≤ λ and #O_X(U) ≤ λ for every open affinoid perfectoid subspace U ⊆ X; equivalently, X is κ'-small (P6.1) for some cardinal κ' < κ (take κ' = λ⁺, which is < κ because κ is a limit cardinal). Properties: (a) uniformly κ-small implies κ-small;

**API.** `PerfectoidSpace.IsUniformlyKappaSmall`, `PerfectoidSpace.isUniformlyKappaSmall_iff_exists_lt`, `PerfectoidSpace.IsUniformlyKappaSmall.isKappaSmall`.

**Examples.** `isUniformlyKappaSmall_disc`, `isUniformlyKappaSmall_empty`, `isUniformlyKappaSmall_iff_isKappaSmall_of_compactSpace`.

**Supporting results.**
- P6.2a Cardinality of complete Tate rings with a dense … (ECD Remark 4.3)

**Sources.** [ECD](#source-ecd) §6, Proposition 6.4, final sentence, p. 27.

**Prerequisites.** [P6.1](#p6-1).

<a id="p6-3"></a>#### P6.3 — Cover criterion for κ-smallness

Let κ be an uncountable strong limit cardinal and X a perfectoid space. (a) If X is κ-small, then X is covered by fewer than κ open affinoid subspaces Spa(A, A⁺) with #A < κ (namely by all of them: there are at …

**Supporting results.**
- P6.3a The adic spectrum of A has at most 2^{#A·#A} … (ECD  Proposition 4.4)

**Sources.** [ECD](#source-ecd) §4, Proposition 4.4, p. 20.

**Prerequisites.** [P6.1](#p6-1).

<a id="p6-4"></a>#### P6.4 — Closure properties of κ-small perfectoid spaces: open subspaces, …

Let κ be an uncountable strong limit cardinal. (a) An open subspace of a κ-small (resp. uniformly κ-small) perfectoid space is κ-small (resp. uniformly κ-small).

**Supporting results.**
- P6.4a Tilting preserves κ-smallness (ECD after Lemma 3.10)
- P6.4b Every affinoid perfectoid space is the … (ECD  Proposition 6.5)

**Sources.** [ECD](#source-ecd) §4, Proposition 4.4, p. 20.

**Prerequisites.** [P6.2](#p6-2).

<a id="p6-5"></a>#### P6.5 — ECD Proposition 6.4(iv) in the form used by the pro-étale calculus: …

Let X_i = Spa(R_i, R_i⁺), i ∈ I, be a cofiltered inverse system of affinoid perfectoid spaces over a small index category, with limit X = Spa(R, R⁺) (P5.3: R⁺ the ϖ-adic completion of colim R_i⁺, R = R⁺[1/ϖ]). …

**Sources.** [ECD](#source-ecd) §6, Proposition 6.4(iv), p. 27.

**Prerequisites.** `AdicEtaleGeometry:A3/affinoid-etale-finite-stage-6-4-iv`.

### Affinoid pro-étale morphism

<a id="p6-6"></a>#### P6.6 — Affinoid pro-étale morphisms and pro-étale presentations

Let f : Y → X be a morphism of perfectoid spaces (P2.10). f is affinoid pro-étale if Y = Spa(S, S⁺) and X = Spa(R, R⁺) are affinoid perfectoid and there are a small cofiltered category I, a functor i ↦ (Y_i → X) from I to X_ét^aff (affinoid perfectoid spaces Y_i = Spa(S_i, S_i⁺) with an étale structure map to X in the sense of ECD Definition 6.2, and X-morphisms as transition maps) and an X-isomorphism Y ≅ lim_i Y_i, the limit being taken in perfectoid spaces (P5.3: S⁺ ≅ the ϖ-adic completion of colim S_i⁺ for a pseudouniformiser ϖ of R, and S = S⁺[1/ϖ]). The data (I, (Y_i), the isomorphism) is a pro-étale presentation of f. Conventions: the transition maps are X-morphisms between étale X-spaces and hence étale (P3.18a); they are not required to be surjective or finite étale, which distinguishes these presentations from those of Scholze 2013 used in AdicEtaleGeometry:A1/pro-etale-morphism; I is small but of arbitrary size; being affinoid pro-étale is the existence of a presentation. X_proét^aff denotes the full subcategory of perfectoid spaces over X on the affinoid pro-étale X-spaces.

**API.** `PerfectoidSpace.ProEtalePresentation`, `PerfectoidSpace.IsAffinoidProEtale`, `PerfectoidSpace.IsAffinoidProEtale.of_presentation`.

**Examples.** `isAffinoidProEtale_rationalSubset` (For a rational subset U = X(f_1, …, f_n / g) of an affinoid …) `isAffinoidProEtale_id` (The identity of an affinoid perfectoid space is affinoid …) `isAffinoidProEtale_origin` (For K = Q_p(p^{1/p^∞})^∧ and X = Spa(K⟨T^{1/p^∞}⟩, …)

**Sources.** [ECD](#source-ecd) §7, Definition 7.8(i), p. 32.

**Prerequisites.** [P2.10](#p2-10), [P2.9](#p2-9), [P3.15](#p3-15).

### Pro-étale morphism

<a id="p6-7"></a>#### P6.7 — Pro-étale morphisms of perfectoid spaces

A morphism f : Y → X of perfectoid spaces is pro-étale if for every y ∈ Y there are an open neighbourhood V ⊆ Y of y and an open subset U ⊆ X with f(V) ⊆ U such that V and U are affinoid perfectoid and f|_V : V → U is affinoid pro-étale (P6.6). Conventions: V and U can be chosen rational inside any given neighbourhoods of y and f(y) (P6.13a);

**Hypotheses.** f an arbitrary morphism of perfectoid spaces, over no base field.

**API.** `PerfectoidSpace.IsProEtale`, `PerfectoidSpace.IsProEtale.of_isAffinoidProEtale`, `PerfectoidSpace.IsProEtale.of_isEtale`.

**Examples.** `isProEtale_openImmersion` (The inclusion of the open unit disc {|T| < 1} into the …) `isProEtale_id` (The identity of any perfectoid space is pro-étale.) `isProEtale_prod_locallyProfinite` (For a perfectoid space X and a locally profinite set S (e.g.)

**Sources.** [ECD](#source-ecd) §7, Definition 7.8(ii), p. 32.

**Prerequisites.** [P6.6](#p6-6), [P2.10](#p2-10), [P2.11b](#p2-11).

### Product with a profinite set

<a id="p6-8"></a>#### P6.8 — The product X × S of an affinoid perfectoid space with a profinite …

Let X be an affinoid perfectoid space, φ : |X| → S₀ a continuous map to a profinite set and S → S₀ a continuous map of profinite sets. Write S → S₀ as a cofiltered limit of maps of finite discrete sets S_k → S₀,k (k ∈ K) compatible with S → S₀ (mathlib `Profinite.asLimit`, `DiscreteQuotient`). Each φ_k : |X| → S₀,k is locally constant, so X = ⊔_{t∈S₀,k} X_{k,t} with X_{k,t} := φ_k⁻¹(t) open and closed, hence a rational subset cut out by an idempotent of O(X) (O_X is a sheaf, P2.8);

**API.** `PerfectoidSpace.prodProfinite`, `PerfectoidSpace.fibreProdProfinite`, `PerfectoidSpace.prodProfinite.fst`.

**Examples.** `prodProfinite_finite` (For a finite discrete S, X × S ≅ ⊔_{s∈S} X and O(X × S) = …) `prodProfinite_punit` (X × {pt} ≅ X and X × ∅ = ∅.) `prodProfinite_Zp_sections` (O(Spa(C_p, O_{C_p}) × Z_p) = C⁰(Z_p, C_p) and O⁺ = C⁰(Z_p, …)

**Sources.** [ECD](#source-ecd) §7, after Definition 7.8, p. 32.

**Prerequisites.** [P6.6](#p6-6), [P5.3](#p5-3), [P2.8](#p2-8).

### Pro-category equivalence

<a id="p6-9"></a>#### P6.9 — Affinoid pro-étale spaces over X are the pro-objects of the affinoid …

Let X be an affinoid perfectoid space, X_ét^aff the category of étale maps Y → X from affinoid perfectoid spaces (essentially small and finitely complete, P6.9a, P6.9c) and X_proét^aff the category of affinoid pro-étale maps Y → X (P6.6). […] Then the realisation functor ρ_X : Pro(X_ét^aff) → X_proét^aff, "lim" Y_i ↦ lim Y_i (limit in perfectoid spaces), is an equivalence of categories, with quasi-inverse Y ↦ "lim"_{(T,t)∈E_Y} T.

**Supporting results.**
- P6.9a Size of the affinoid étale site: rings bounded … (ECD  Lemma 7.18)
- P6.9b Maps from a cofiltered limit of affinoid … (ECD  Proposition 7.10)
- P6.9c The canonical presentation: Y is affinoid … (ECD  Lemma 7.11(iv))

**Sources.** [ECD](#source-ecd) §7, Proposition 7.10, p. 33.

**Prerequisites.** `DiamondsAndVStacks:D0/pro-category-of-finite-t0-spaces`, [P6.6](#p6-6), [P5.3](#p5-3).

<a id="p6-10"></a>#### P6.10 — κ-small affinoid pro-étale spaces are the pro-objects with fewer than …

Let κ be an uncountable strong limit cardinal and X a κ-small affinoid perfectoid space. (a) An affinoid pro-étale Y → X is κ-small iff it admits a pro-étale presentation Y = lim_{i∈I} Y_i with #Mor(I) < κ; all …

**Supporting results.**
- P6.10a Cofiltered limits of uniformly bounded κ-small … (ECD Proposition 6.4, final sentence)
- P6.10b Affinoid pro-étale spaces over a geometric … (ECD after Definition 7.8)
- P6.10c Zariski closed immersions are affinoid … (ECD Remark 7.9)

**Sources.** [ECD](#source-ecd) §7, Proposition 7.10, p. 33.

**Prerequisites.** [P6.9](#p6-9).

<a id="p6-11"></a>#### P6.11 — Zariski closed equals strongly Zariski closed

For an affinoid perfectoid space X = Spa(R, R⁺) and a morphism f : Z → X of perfectoid spaces, f is a Zariski closed immersion if and only if f is strongly Zariski closed. The direction strongly Zariski closed ⇒ …

**Supporting results.**
- P6.11a Sections of affinoid pro-étale maps are … (ECD  Lemma 7.11)

**Sources.** [ECD](#source-ecd) §5, Theorem 5.8 with proof, p. 25.

**Prerequisites.** [P4.15](#p4-15).

<a id="p6-12"></a>#### P6.12 — X_proét^aff has all small limits, computed in perfectoid spaces (ECD …

For an affinoid perfectoid space X, the category X_proét^aff has all small limits, and they are computed in perfectoid spaces over X: the final object is id_X; fibre products Y ×_Z Y' of objects of X_proét^aff …

**Supporting results.**
- P6.12a Base change of affinoid pro-étale maps (ECD … (ECD Lemma 7.11(ii))
- P6.12b Cofiltered limits of affinoid pro-étale … (ECD  Lemma 7.11)
- P6.12c Composites of affinoid pro-étale maps are … (ECD Lemma 7.11(i))
- P6.12d Morphisms between affinoid pro-étale X-spaces … (ECD Lemma 7.11(iii))

**Sources.** [ECD](#source-ecd) §7, Lemma 7.11(iv), p. 33.

**Prerequisites.** [P6.9](#p6-9).

### Stability of pro-étale morphisms

<a id="p6-13"></a>#### P6.13 — Stability of pro-étale morphisms: composition, base change, …

(i) Composites of pro-étale morphisms of perfectoid spaces are pro-étale. (ii) If f : Y → X is pro-étale and g : X' → X is any morphism of perfectoid spaces, then f' : X' ×_X Y → X' is pro-étale. (iii) If Y → X and Y' → X are pro-étale, every X-morphism Y → Y' is pro-étale. (iv) For affinoid X, X_proét^aff has all small limits (P6.12).

**Hypotheses.** Arbitrary perfectoid spaces in (i)–(iii); X affinoid in (iv).

**Supporting results.**
- P6.13a Étale maps are pro-étale, and affinoid … (ECD  Lemma 7.11)
- P6.13b Diagonals and graphs of morphisms of perfectoid … (ECD Remark 7.9)

**Sources.** [ECD](#source-ecd) §7, Lemma 7.11(i), p. 33.

**Prerequisites.** [P6.12a](#p6-12), [P6.12c](#p6-12), [P6.12d](#p6-12).

<a id="p6-14"></a>#### P6.14 — Scholze 2013's affinoid perfectoid objects of X_proét give affinoid …

Let K be a perfectoid field of characteristic 0, X a locally noetherian adic space over Spa(K, K⁺), and X_proét Scholze's pro-étale site (AdicEtaleGeometry:A1/pro-etale-site-corrected, on the category pro-X_ét …

**Sources.** [Sch13](#source-sch13) §4, Definition 4.3(i), p. 22.

**Prerequisites.** `AdicEtaleGeometry:A1/pro-etale-morphism`.

<a id="p7"></a>

## P7: Tilde-limits and Frobenius-controlled towers

Tilde-limits of analytic adic spaces and perfectoid tilde-limits, their uniqueness in the perfectoid class and comparison with represented functors, restriction to rational opens, change of index, étale and finite étale base change and gluing; Frobenius-controlled integral towers with their completion, uniformity bound and the perfectoid Frobenius criterion; the comparison of étale topoi along tilde-limits; and regular finite flat towers.

<a id="p7-1"></a>#### P7.1 — Tilde-limits of analytic adic spaces

Let I be a small cofiltered category, (X_i)_{i ∈ I} a diagram of analytic adic spaces (AdicSpaces Layer 5) whose transition maps are quasicompact and quasiseparated, and X an analytic adic space with compatible morphisms φ_i : X → X_i. Two separate conditions: (T) the continuous map |X| → lim_i |X_i| is a homeomorphism; (D) every x ∈ X has an open affinoid neighbourhood U = Spa(A, A⁺) such that the union over i ∈ I and over opens V ⊆ X_i with φ_i(U) ⊆ V of the images of O_{X_i}(V) → A is dense in A. X ~ lim_i X_i (X is a tilde-limit of the X_i) means (T) and (D). Neither X nor the X_i is required to be quasicompact or locally noetherian; the perfectoid tilde-limits of P7.2 are the tilde-limits whose X is perfectoid.

**API.** `IsTildeLimit`, `IsTildeLimit.homeomorph`, `IsTildeLimit.dense_image`.

**Examples.** `tildeLimit_const` (X ~ lim X for the constant diagram.) `tildeLimit_perfectoid_torus` (Spa ℂ_p⟨T^{±1/p^∞}⟩ ~ lim_n Spa ℂ_p⟨T^{±1/p^n}⟩, with (D) …) `tildeLimit_not_uncompleted` (The uncompleted colimit colim ℂ_p⟨T^{±1/p^n}⟩ is not complete, …)

**Sources.** [Huber96](#source-huber96) §2.4, Definition 2.4.2.

**Prerequisites.** `mathlib:CategoryTheory.IsCofiltered`, `mathlib:TopCat.limitCone`, `mathlib:Dense`.

### Perfectoid tilde-limit

<a id="p7-2"></a>#### P7.2 — Perfectoid tilde-limits X ~ lim X_i of analytic adic spaces

Fix a prime p. […] (a) the continuous map |X| → lim_i |X_i| into the limit of the underlying topological spaces (Mathlib `TopCat.limitCone`) is a homeomorphism, and (b) every x ∈ X has an open affinoid neighbourhood U = Spa(A, A⁺) ⊆ X such that the union, over i ∈ I and over open subsets V ⊆ X_i with φ_i(U) ⊆ V, of the images of the restriction maps O_{X_i}(V) → A is dense in A. Conventions pinned: (i) the index category is cofiltered and only the transition maps, not the X_i, are required to be quasicompact and quasiseparated; (ii) no perfectoid base field is fixed: the X_i may be of characteristic 0 or p, and X may lie over a different base than the X_i (Chojecki–Hansen–Johansson Theorem 2.8: the X_i over Q_p, X perfectoid; Scholze's universal cover of an affinoid over Q_p with limit over C_p); (iii) the two conditions (a) and (b) are independent and both are required (tests below); (iv) a tilde-limit is not a categorical limit in adic spaces: X ~ X_0 may hold with X ≇ X_0 (Scholze–Weinstein after Proposition 2.4.4). Equivalent forms of (b), used throughout the stage: (b′) there is an open cover of X by affinoids U = Spa(A, A⁺) for which colim_{(i, V)} O_{X_i}(V) → A has dense image, V running over open affinoids of X_i through which U → X_i factors (Scholze–Weinstein Definition 2.4.1);

**API.** `PerfectoidSpace.IsTildeLimit`, `PerfectoidSpace.IsTildeLimit.homeomorph`, `PerfectoidSpace.IsTildeLimit.dense`.

**Examples.** `isTildeLimit_test_perfectoidDisc` (For a perfectoid Tate ring R with pseudouniformiser ϖ admitting …) `isTildeLimit_test_const` (For a perfectoid space X and the constant system X_i = X (I = …) `isTildeLimit_test_not_categorical` (For a perfectoid field K, Spa(K, O_K) ~ Spa(K[ε]/(ε²), O_K + …)

**Sources.** [SW13](#source-sw13) §2.4, Definition 2.4.1, pp. 19-20.

**Prerequisites.** [P7.1](#p7-1), [P2.10](#p2-10), [P2.6](#p2-6).

<a id="p7-3"></a>#### P7.3 — Residue-field tilde-limits X ~′ lim X_i over locally noetherian adic …

Let I be a small cofiltered category, (X_i) an I-indexed system of quasicompact quasiseparated locally noetherian analytic adic spaces (AdicSpacesPartII:R0/locally-noetherian-adic-space: covered by Spa(A, A⁺) with A a complete strongly noetherian Tate ring), X a perfectoid space and φ = (φ_i: X → X_i) a compatible family. Then X ~′ lim X_i (Scholze's notation X ~ lim X_i of Definition 7.14, written ~′ in Scholze–Weinstein after Theorem 2.4.7) means: (a) …

**API.** `PerfectoidSpace.IsResidueFieldTildeLimit`, `PerfectoidSpace.IsResidueFieldTildeLimit.homeomorph`, `PerfectoidSpace.IsResidueFieldTildeLimit.residueField_dense`.

**Examples.** `isResidueFieldTildeLimit_test_disc`, `isResidueFieldTildeLimit_test_point`, `isResidueFieldTildeLimit_test_not_dense`.

**Sources.** [Sch12](#source-sch12) §7, Definition 7.14, pp. 43-44.

**Prerequisites.** `AdicSpacesPartII:R0/locally-noetherian-adic-space`.

<a id="p7-4"></a>#### P7.4 — Good affinoid perfectoid subsets of a tilde-limit

Let (X_i)_{i∈I} be as in P7.2, X a perfectoid space with a compatible cone φ. A good affinoid perfectoid of (X, φ) is a triple (W, i_0, V) where W = Spa(R, R⁺) ⊆ X is an affinoid perfectoid open subset (P2.9), i_0 ∈ I and V ⊆ X_{i_0} is a quasicompact open subset such that (i) W = φ_{i_0}^{-1}(V), and (ii) writing V_a := f_a^{-1}(V) ⊆ X_j for a: j → i_0 (the slice category I/i_0, cofiltered), the ring map colim_{a ∈ (I/i_0)^op} O_{X_j}(V_a) → R has dense …

**API.** `PerfectoidSpace.GoodAffinoid`, `PerfectoidSpace.GoodAffinoid.level`, `PerfectoidSpace.GoodAffinoid.preimage_eq`.

**Examples.** `goodAffinoid_test_disc`, `goodAffinoid_test_empty`, `goodAffinoid_test_not_dense`.

**Sources.** [Survey](#source-survey) §2, after Remark 2.21, p. 11.

**Prerequisites.** [P2.9](#p2-9).

### Frobenius-controlled integral tower

<a id="p7-5"></a>#### P7.5 — Frobenius-controlled integral towers

Fix a prime p. A Frobenius-controlled integral tower (A_•⁺, ϖ, m_0, w) consists of: (1) a sequence of rings A_0⁺ → A_1⁺ → A_2⁺ → ⋯ with transition maps t_m: A_m⁺ → A_{m+1}⁺; (2) an element ϖ ∈ A_0⁺ (its images again written ϖ), the compatible pseudouniformiser, such that every A_m⁺ is ϖ-torsion-free and ϖ-adically complete (Mathlib `IsAdicComplete (Ideal.span {ϖ}) A_m⁺`) and p ∈ ϖ^p A_0⁺; then every A_m⁺/ϖ^p is an F_p-algebra and absolute Frobenius induces a ring homomorphism Φ_m: A_m⁺/ϖ → A_m⁺/ϖ^p, x ↦ x^p (well defined because (x + ϖy)^p ≡ x^p mod pϖA_m⁺ + ϖ^pA_m⁺ = ϖ^pA_m⁺); (3) the eventual Frobenius lifting condition modulo ϖ^p: an index m_0 and, for every m ≥ m_0, a ring isomorphism w_m: A_{m+1}⁺/ϖ ≅ A_m⁺/ϖ^p such that (i) t_m ∘ w_m = Φ_{m+1} as maps A_{m+1}⁺/ϖ → A_{m+1}⁺/ϖ^p (t_m reduced modulo ϖ^p), and (ii) the w_m are compatible with the transition maps: w_{m+1} ∘ t_{m+1} = t_m ∘ w_m as maps A_{m+1}⁺/ϖ → A_{m+1}⁺/ϖ^p (t reduced modulo ϖ on the left and modulo ϖ^p on the right). The generic fibres are the complete Tate rings A_m := A_m⁺[1/ϖ] with ring of definition A_m⁺ (ϖ-adic topology) and the Huber pairs (A_m, A_m⁺⁺) with A_m⁺⁺ the integral closure of A_m⁺ in A_m;

**API.** `Perfectoid.FrobeniusTower`, `Perfectoid.FrobeniusTower.frobMod`, `Perfectoid.FrobeniusTower.transition_comp_lift`.

**Examples.** `frobeniusTower_test_disc` (For a perfectoid Tate pair (R, R⁺) and ϖ ∈ R⁺ with compatible …) `frobeniusTower_test_constPerfectoid` (For an integral perfectoid ring S that is ϖ-torsion-free and …) `frobeniusTower_test_constDisc_not` (For a perfectoid field K with pseudouniformiser ϖ, the constant …)

**Sources.** [Torsion](#source-torsion) §III.2.3, proof of Corollary III.2.19, p. 42.

**Prerequisites.** `mathlib:IsAdicComplete`, `mathlib:Ideal.span`, `mathlib:frobenius`.

<a id="p7-6"></a>#### P7.6 — Completion and inversion of a Frobenius-controlled tower

For a Frobenius-controlled integral tower (A_•⁺, ϖ, m_0, w) (P7.5) define: A_∞⁺ := the ϖ-adic completion of the direct limit colim_m A_m⁺ (Mathlib `AdicCompletion (Ideal.span {ϖ})` of `Ring.DirectLimit`); A_∞ := A_∞⁺[1/ϖ], topologised so that A_∞⁺ is an open ring of definition with the ϖ-adic topology (a complete Tate ring with pseudouniformiser ϖ);

**API.** `Perfectoid.FrobeniusTower.completedPlus`, `Perfectoid.FrobeniusTower.completedPlus_quotient`, `Perfectoid.FrobeniusTower.completedPlus_torsionFree`.

**Examples.** `frobeniusTower_completion_test_disc`, `frobeniusTower_completion_test_const`, `frobeniusTower_completion_test_needsCompletion`.

**Sources.** [Torsion](#source-torsion) §III.2.3, proof of Corollary III.2.19, p. 43.

**Prerequisites.** [P7.5](#p7-5).

<a id="p7-7"></a>#### P7.7 — Preperfectoid adic spaces

Let X be an analytic adic space in the generality of Scholze–Weinstein §2.1 (an analytic Yoneda-adic space, AdicEtaleGeometry:A1/generalized-adic-presentation; the sheafy adic spaces of AdicSpaces Layer 5 form a full subcategory). For an open affinoid U = Spa(A, A⁺) ⊆ X with a pseudouniformiser ϖ ∈ A⁺, the strong completion (Â, Â⁺) of (A, A⁺) is the completion of (A, A⁺) for the topology on A that gives A⁺ the ϖ-adic topology (Â⁺ the ϖ-adic completion of …

**API.** `PerfectoidSpace.strongCompletionPair`, `PerfectoidSpace.strongCompletionPair_indep`, `PerfectoidSpace.IsPreperfectoid`.

**Examples.** `isPreperfectoid_test_nonreducedPoint`, `isPreperfectoid_test_perfectoid`, `isPreperfectoid_test_disc_not`.

**Sources.** [SW13](#source-sw13) §2.3, Definition 2.3.4, pp. 17-18.

**Prerequisites.** `AdicEtaleGeometry:A1/generalized-adic-presentation`.

<a id="p7-8"></a>#### P7.8 — The strong completion X̂ of a preperfectoid space and X̂ ~ X

Let X be a preperfectoid analytic adic space (P7.7). There is a perfectoid space X̂ with a morphism X̂ → X (of Yoneda-adic spaces) such that: (i) |X̂| → |X| is a homeomorphism; (ii) for every open affinoid U = Spa(A, A⁺) ⊆ X whose strong completion (Â, Â⁺) is perfectoid, the corresponding open subspace of X̂ is Spa(Â, Â⁺);

**API.** `PerfectoidSpace.strongCompletion`, `PerfectoidSpace.strongCompletion.homeomorph`, `PerfectoidSpace.strongCompletion.affinoid`.

**Examples.** `strongCompletion_test_nonreducedPoint`, `strongCompletion_test_perfectoid`, `strongCompletion_test_not_iso`.

**Sources.** [SW13](#source-sw13) §2.3, Proposition 2.3.6, p. 18.

**Prerequisites.** [P7.7](#p7-7).

<a id="p7-9"></a>#### P7.9 — Cofinality witnesses for families of compact open subgroups

Let G be a Hausdorff topological group in which the compact open subgroups form a basis of neighbourhoods of 1 (a locally profinite group: a profinite group, or G(Q_p) for a linear algebraic group G over Q_p). Write CO(G) for the set of compact open subgroups, a cofiltered category under inclusion (K′ → K when K′ ⊆ K; K ∩ K′ is compact open).

**API.** `PerfectoidSpace.LevelFamily`, `PerfectoidSpace.CofinalityWitness`, `PerfectoidSpace.CofinalityWitness.initial`.

**Examples.** `cofinalityWitness_test_principalCongruence`, `cofinalityWitness_test_discrete`, `cofinalityWitness_test_gamma0_not`.

**Supporting results.**
- P7.9a A good affinoid perfectoid is the uniform … (KL15 Definition 2.8.13)

**Sources.** [Sch13E](#source-sch13e) item (1), p. 1.

**Prerequisites.** `mathlib:OpenSubgroup`.

### Uniqueness of perfectoid tilde-limits

<a id="p7-10"></a>#### P7.10 — A perfectoid tilde-limit represents lim_i Hom(−, X_i) on perfectoid …

Let (X_i)_{i∈I} be a cofiltered system of analytic adic spaces with quasicompact quasiseparated transition maps and X ~ lim X_i a perfectoid tilde-limit (P7.2). Then for every perfectoid space Y (of any characteristic, over no fixed base field), and more generally every analytic adic space Y covered by affinoids Spa(B, B⁺) with B uniform, the map Hom(Y, X) → lim_i Hom(Y, X_i), g ↦ (φ_i ∘ g)_i, is bijective. Consequently: (i) X represents the functor Y ↦ lim_i Hom(Y, X_i) on perfectoid spaces;

**Supporting results.**
- P7.10a Good affinoid perfectoids cover a tilde-limit … (Survey Proposition 2.22)

**Sources.** [SW13](#source-sw13) §2.4, Proposition 2.4.5, p. 20.

**Prerequisites.** [P7.2](#p7-2), [P7.4](#p7-4), [P1.1](#p1-1).

<a id="p7-11"></a>#### P7.11 — Tilde-limits and inverse limits of represented functors and of …

Let (X_i)_{i∈I} be a cofiltered system of analytic adic spaces over Spa(Z_p, Z_p) with qcqs transition maps. (i) If X ~ lim X_i is a perfectoid tilde-limit, then h_X ≅ lim_i h_{X_i} as presheaves on the category …

**Supporting results.**
- P7.11a Completed direct limits of Huber pairs give … (SW13 Proposition 2.4.2)
- P7.11b Quasicompact opens and rational subsets of a … (CHJ  Theorem 2.17)
- P7.11c Tilde-limits are invariant under initial … (Sch13E item (1))
- P7.11d A decreasing family of open subgroups of a … (CHJ  Lemma 2.24)

**Sources.** [Survey](#source-survey) §2, Proposition 2.23, p. 12.

**Prerequisites.** [P7.10](#p7-10).

### Gluing of perfectoid tilde-limits

<a id="p7-12"></a>#### P7.12 — Locality and gluing of perfectoid tilde-limits

Let (X_i)_{i∈I} be a cofiltered system of analytic adic spaces with qcqs transition maps, i_0 ∈ I, and (V^α)_{α} an open cover of X_{i_0}, with preimages V^α_a := f_a^{-1}(V^α) ⊆ X_j (a: j → i_0). (i) Locality: a perfectoid space X with a compatible cone satisfies X ~ lim X_i iff for every α the open subspace U^α := φ_{i_0}^{-1}(V^α) satisfies U^α ~ lim_a V^α_a. (ii) Gluing: if for every α the system (V^α_a)_a has a perfectoid tilde-limit U^α, then there is a perfectoid space X with a compatible cone and X ~ lim X_i;

**Supporting results.**
- P7.12a Restriction of a tilde-limit to compatible open … (BHW  Theorem 5.11)
- P7.12b Finite étale base change of perfectoid … (Sch12 Lemma 7.3 (iii))
- P7.12c Étale base change of perfectoid tilde-limits (SW13 Proposition 2.4.3)

**Sources.** [Torsion](#source-torsion) §III.3, Definition III.3.5 (ii), p. 56.

**Prerequisites.** [P7.2](#p7-2), [P7.10](#p7-10), [P7.11a](#p7-11).

### Perfectoid Frobenius criterion for towers

<a id="p7-13"></a>#### P7.13 — The perfectoid Frobenius criterion: Frobenius-controlled towers have …

Let (A_•⁺, ϖ, m_0, w) be a Frobenius-controlled integral tower (P7.5) with generic fibres (A_m, A_m⁺⁺) and completion (A_∞, A_∞⁺⁺) (P7.6). Then: (i) A_∞ is a perfectoid Tate ring in the sense of ECD Definition 3.1 (complete, uniform, with the pseudouniformiser ϖ satisfying ϖ^p | p in A_∞° and Φ: A_∞°/ϖ ≅ A_∞°/ϖ^p), of characteristic 0 or p according to A_0⁺, and (A_∞, A_∞⁺⁺) is a perfectoid Tate pair;

**Supporting results.**
- P7.13a Frobenius on the completed tower is bijective … (Torsion  Corollary III.2.19)
- P7.13b The tilt of the limit of a Frobenius-controlled … (Torsion  Corollary III.2.19)
- P7.13c The perfection of a characteristic-p adic space … (Torsion Definition III.2.18 (ii))

**Sources.** [Torsion](#source-torsion) §III.2.3, proof of Corollary III.2.19, p. 42.

**Prerequisites.** [P7.5](#p7-5), [P7.6](#p7-6), [P7.11a](#p7-11).

### Limits of perfectoid towers

<a id="p7-14"></a>#### P7.14 — Towers of perfectoid spaces with affinoid transition maps have …

Let (X_i)_{i∈I} be a cofiltered system of perfectoid spaces whose transition maps are affinoid (for every a: j → i and every affinoid open V ⊆ X_i, f_a^{-1}(V) is affinoid; hence qcqs). Then: (i) the limit X := lim_i X_i exists in the category of perfectoid spaces; (ii) X ~ lim_i X_i (P7.2), and X represents lim_i Hom(−, X_i) on perfectoid spaces;

**Sources.** [BHW](#source-bhw) §5.2, proof of Theorem 5.11, p. 1749.

**Prerequisites.** [P5.3](#p5-3), [P1.25](#p1-25), [P7.13a](#p7-13).

<a id="p7-15"></a>#### P7.15 — Tilde-limits X ~ lim X_i of noetherian adic spaces and the comparison …

Let (X_i)_{i∈I} be a cofiltered system of quasicompact quasiseparated locally noetherian analytic adic spaces (AdicSpacesPartII:R0/locally-noetherian-adic-space; no perfectoid base field is assumed, and the X_i …

**Supporting results.**
- P7.15a A perfectoid tilde-limit over qcqs locally … (SW13 after Theorem 2.4.7)
- P7.15b Étale base change of residue-field … (Sch12 Proposition 7.16)
- P7.15c Qcqs étale spaces over a residue-field … (Sch12  Theorem 7.17)
- P7.15d Towers with homeomorphic, purely inseparable … (Sch12 Corollary 7.19)

**Sources.** [Sch12](#source-sch12) §7, proof of Theorem 7.17, p. 44.

**Prerequisites.** [P7.3](#p7-3).

<a id="p7-16"></a>#### P7.16 — Finite flat regular towers with algebraically closed residue field

Let (R, m) be a complete regular local ring with residue field k. There is a filtered direct system of finite flat R-algebras R_i such that each (R_i, mR_i) is a regular local ring and (lim→ R_i, m·lim→ R_i) is …

**Sources.** [Čes](#source-ces) §5, Lemma 5.1, p. 11.

**Prerequisites.** `mathlib:IsAdicComplete`.

<a id="p7-17"></a>#### P7.17 — Finite flat regular towers with perfectoid completion

Let (R, m) be a complete regular local ring of mixed characteristic (0, p) with perfect residue field k, and W := W(k). There is a tower {R_m}_{m≥0} of finite flat R-algebras R_m of p-power rank over R, each a …

**Sources.** [Čes](#source-ces) §5, Lemma 5.2, p. 12.

**Prerequisites.** [P7.16](#p7-16).

<a id="p8"></a>

## P8: Finite quotients and closed perfectoid loci in towers

Invariant Huber pairs of a finite group action and the homeomorphism |Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})|; invariants of perfectoid Tate rings, including p-groups in characteristic p; finite quotients of affinoid perfectoid spaces, of spaces with an invariant affinoid cover and of analytically separated spaces; perfectoidization of integral extensions; good towers and their quotients; and Zariski closed loci in towers with the tilde-limit comparison.

### Invariant Huber pair

<a id="p8-1"></a>#### P8.1 — The invariant Huber pair (A^G, A^{+G}) of a finite group action

Let (A, A⁺) be a complete Tate–Huber pair and G a finite group acting on A on the left by continuous ring automorphisms with g(A⁺) = A⁺ for all g ∈ G. […] Then: (i) A^G is a closed subring and a complete Tate ring: for every pseudouniformizer ϖ of A the norm N(ϖ) = ∏_{g∈G} g(ϖ) is a G-invariant pseudouniformizer of A and of A^G, G-stable rings of definition A₀ ⊆ A exist (the subring generated by the translates g(A₁) of any ring of definition A₁), and A₀^G is a ring of definition of A^G; (ii) (A^G)° = (A°)^G = A° ∩ A^G; (iii) A^{+G} is open and integrally closed in A^G and contained in (A^G)°, so (A^G, A^{+G}) is a complete Tate–Huber pair; (iv) A is integral over A^G, each a ∈ A being a root of the monic polynomial ∏_{g∈G}(T − g·a) ∈ A^G[T]; (v) A⁺ is the integral closure of A^{+G} in A. The construction is functorial in G-equivariant continuous maps of pairs, and for a subgroup H ≤ G it gives inclusions A^G ⊆ A^H, A^{+G} ⊆ A^{+H}.

**API.** `Huber.Pair.invariants`, `Huber.Pair.invariants_toSubring`, `Huber.Pair.normPseudoUniformizer`.

**Examples.** `invariants_trivialGroup` (For the trivial group, Huber.Pair.invariants returns (A, A⁺).) `invariants_swap_prod` (For A = K × K, A⁺ = K⁺ × K⁺ and Z/2 swapping the factors, A^G …) `invariants_toSubring_eq_fixedPoints` (The underlying subring of Huber.Pair.invariants G (A, A⁺) is …)

**Supporting results.**
- P8.1a Extensions of a valuation along a normal … (Hansen Theorem 3.1, Step 1)

**Sources.** [Hansen](#source-hansen) Theorem 3.1, Step 3, p. 6.

**Prerequisites.** `mathlib:FixedPoints.subring`, `mathlib:Algebra.IsInvariant`, `mathlib:Algebra.IsInvariant.isIntegral`.

<a id="p8-2"></a>#### P8.2 — |Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})|

With (A, A⁺) and G as above, the continuous map q: |Spa(A, A⁺)| → |Spa(A^G, A^{+G})|, v ↦ v|_{A^G}, is surjective with …

**Supporting results.**
- P8.2a Continuous valuations restrict surjectively to … (Hansen Theorem 3.1, Step 1)

**Sources.** [Hansen](#source-hansen) Theorem 3.1, p. 4.

**Prerequisites.** [P8.1](#p8-1).

<a id="p8-3"></a>#### P8.3 — Spd(A, A⁺) × G ⇉ Spd(A, A⁺) presents Spd(A^G, A^{+G}) as a v-sheaf

Let A be a complete Tate ℤ_p-algebra with a continuous left action of a finite group G and A⁺ ⊆ A a G-stable open integrally closed subring; put X = Spd(A, A⁺) and X_G = Spd(A^G, A^{+G}). Then X → X_G and X × G …

**Sources.** [CGJ](#source-cgj) Proposition 2.1.1, p. 4.

**Prerequisites.** [P8.2](#p8-2).

### Invariants of a perfectoid ring

<a id="p8-4"></a>#### P8.4 — Invariants of a perfectoid Tate ring under a finite group are …

Let A be a perfectoid Tate ring and G a finite group acting continuously on A by ring automorphisms. Then A^G, with the subspace topology, is a perfectoid Tate ring, and (A^G)♭ = (A♭)^G as subrings of A♭ with the same topology, compatibly with ♯. There is no hypothesis on |G|: p may divide the order of G. Over a perfectoid field K with a K-linear action this is Hansen's Theorem 3.5.

**Supporting results.**
- P8.4a Frobenius is surjective modulo u^p on the … (KL16 Theorem 3.3.26)

**Sources.** [KL16](#source-kl16) Theorem 3.3.26, p. 68.

**Prerequisites.** [P8.1](#p8-1), [P1.1](#p1-1), [P1.4](#p1-4).

<a id="p8-5"></a>#### P8.5 — Invariants commute with invariant rational localisation for …

Let (A, A⁺) be a perfectoid Tate–Huber pair, of any characteristic, with a continuous action of a finite group G of any order, and q: X = Spa(A, A⁺) → Y = Spa(A^G, A^{+G}). For every rational subset U of Y, …

**Supporting results.**
- P8.5a Invariants commute with invariant rational … (CGJ Remark 2.1.4)

**Sources.** [CGJ](#source-cgj) Proposition 2.1.3, p. 5.

**Prerequisites.** [P8.4](#p8-4).

<a id="p8-6"></a>#### P8.6 — The categorical quotient X/G of an adic space by a finite group

Let X = (|X|, O_X, (v_x)) be an adic space (more generally an object of Huber's category V of v-ringed spaces) with a right action of a finite group G. […] Then X/G is an object of V with a G-invariant morphism q: X → X/G, and it is the categorical quotient in V: every G-invariant morphism X → Z in V factors uniquely through q.

**API.** `VRingedSpace.quotient`, `VRingedSpace.quotient.π`, `VRingedSpace.quotient.isQuotientMap`.

**Examples.** `quotient_trivialAction`, `quotient_prod_self`, `quotient_affinoid_perfectoid`.

**Sources.** [Hansen](#source-hansen) Definition 2.2, p. 3.

**Prerequisites.** `tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf`.

### Quotient of an affinoid perfectoid space

<a id="p8-7"></a>#### P8.7 — The quotient of an affinoid perfectoid space by a finite group

Let (A, A⁺) be a perfectoid Tate–Huber pair with a continuous action of a finite group G preserving A⁺ (any |G|). Then X_G = Spa(A^G, A^{+G}) is an affinoid perfectoid space and q: X = Spa(A, A⁺) → X_G is the categorical quotient X/G in V (so also in adic spaces); it is also the coequalizer of X × G ⇉ X in Kedlaya–Liu's locally v-ringed spaces (CGJ Proposition 2.1.3(2));

**Supporting results.**
- P8.7a Finite quotients commute with topologically … (CHJ Lemma 2.23(2))

**Sources.** [CGJ](#source-cgj) Proposition 2.1.3, p. 5.

**Prerequisites.** [P8.4](#p8-4), [P8.2](#p8-2), [P8.5](#p8-5).

<a id="p8-8"></a>#### P8.8 — Perfectoid quotients under a G-stable affinoid perfectoid cover

Let X be a perfectoid space with a right action of a finite group G, and suppose X has a covering by G-stable open subspaces U_i = Spa(A_i, A_i⁺) with A_i perfectoid Tate. Then X/G (the categorical quotient in …

**Sources.** [CGJ](#source-cgj) Theorem 2.1.2, p. 5.

**Prerequisites.** [P8.7](#p8-7).

<a id="p8-9"></a>#### P8.9 — Quotients of analytic adic spaces with a G-stable affinoid cover, |G| …

Let X be an analytic adic space with an action of a finite group G, covered by G-stable open affinoid subspaces Spa(A_i, A_i⁺) with A_i a Tate ring, and assume |G| is invertible in O_X(X). Then X/G is an adic …

**Supporting results.**
- P8.9a Invariants commute with rational localisation … (Hansen Theorem 3.3)

**Sources.** [Hansen](#source-hansen) Theorem 1.1, p. 1.

**Prerequisites.** [P8.2](#p8-2).

<a id="p8-10"></a>#### P8.10 — Quotients of rigid spaces with a G-stable affinoid cover, for any |G|

Let X be a rigid analytic space over a complete nonarchimedean field K with a K-linear action of a finite group G, and suppose X has an (admissible) covering by G-stable open affinoid subspaces. Then X/G is a …

**Supporting results.**
- P8.10a Invariants of a classical affinoid algebra are … (CHJ opening paragraph)
- P8.10b Rational localisation commutes with invariants … (Hansen Theorem 3.4)

**Sources.** [Hansen](#source-hansen) Theorem 1.3, p. 2.

**Prerequisites.** [P8.6](#p8-6).

<a id="p8-11"></a>#### P8.11 — The diamond of a finite quotient is the quotient of the diamond

Let X be an analytic adic space over ℤ_p with an action of a finite group G, covered by G-stable affinoid opens Spa(A_i, A_i⁺) such that X/G is an adic space covered by the Spa(A_i^G, A_i^{+G}) (as in the three …

**Sources.** [HJ](#source-hj) Theorem 5.3 (with the following paragraph on the auxiliary conditions), p. 28.

**Prerequisites.** [P8.3](#p8-3).

<a id="p8-12"></a>#### P8.12 — Free actions give finite étale torsors; the universal quotient is not …

Let X be a perfectoid space with an action of a finite group G such that X/G is a perfectoid space with (X/G)^◇ = X^◇/G (for instance under a G-stable affinoid perfectoid cover, or the hypotheses of …

**Sources.** [ECD](#source-ecd) Definition 10.12, p. 53.

**Prerequisites.** [P8.11](#p8-11).

<a id="p8-13"></a>#### P8.13 — G-clean neighbourhoods

Let X be a topological space with a continuous (right) action of a finite group G, x ∈ X a point and H_x ≤ G its stabilizer. An open neighbourhood U of x is G-clean if Uh = U for all h ∈ H_x and U ∩ Ug = ∅ for all g ∈ G ∖ H_x.

**API.** `MulAction.IsGClean`, `MulAction.IsGClean.smul_eq`, `MulAction.IsGClean.disjoint_smul`.

**Examples.** `isGClean_trivialGroup`, `isGClean_neg_real`, `isGClean_iff_isOpenEmbedding`.

**Supporting results.**
- P8.13a G-clean neighbourhoods exist in Hausdorff spaces (HJ Lemma 5.2)

**Sources.** [HJ](#source-hj) Definition (G-clean neighbourhood), unnumbered, in the paragraph before Lemma 5.2, p. 27.

**Prerequisites.** `mathlib:MulAction.stabilizer`.

<a id="p8-14"></a>#### P8.14 — Zariski-closed embeddings of perfectoid spaces and Zariski-open …

A map of perfectoid spaces Z → X is a Zariski-closed embedding if for every open affinoid perfectoid U ⊆ X the base change Z ×_X U → U is a Zariski-closed embedding of affinoid perfectoid spaces, i.e.

**API.** `PerfectoidSpace.IsZariskiClosedEmbedding`, `PerfectoidSpace.IsZariskiClosedEmbedding.of_affinoid`, `PerfectoidSpace.IsZariskiClosedEmbedding.base_change_affinoid`.

**Examples.** `isZariskiClosedEmbedding_id`, `isZariskiClosedEmbedding_point`, `isZariskiClosedEmbedding_affinoid_iff`.

**Sources.** [HJ](#source-hj) Definition 5.4 (1),(2) (with the caution paragraph after it), p. 29.

**Prerequisites.** [P4.15](#p4-15).

<a id="p8-15"></a>#### P8.15 — Analytically separated perfectoid spaces

A perfectoid space X over a nonarchimedean field Spa(K, K⁺) is analytically separated if the diagonal X → X ×_{Spa(K, K⁺)} X is a Zariski-closed embedding.

**API.** `PerfectoidSpace.IsAnalyticallySeparated`, `PerfectoidSpace.IsAnalyticallySeparated.inter_affinoid`, `PerfectoidSpace.IsAnalyticallySeparated.isSeparated`.

**Examples.** `isAnalyticallySeparated_affinoid`, `isAnalyticallySeparated_projective_tower`, `isAnalyticallySeparated_isSeparated`.

**Supporting results.**
- P8.15a Analytically separated perfectoid spaces are … (HJ Lemma 5.5)

**Sources.** [HJ](#source-hj) Definition 5.4 (1),(2) (with the caution paragraph after it), p. 29.

**Prerequisites.** [P8.14](#p8-14).

<a id="p8-16"></a>#### P8.16 — Finite quotients of separated rigid spaces

Let X be a separated rigid analytic space over a complete nonarchimedean field K with a K-linear action of a finite group G, such that for every rank-one point x ∈ X the closure of {x} lies in some open affinoid …

**Supporting results.**
- P8.16a Charts of a finite quotient from a G-clean … (HJ Theorem 5.3 (with the following paragraph on the auxiliary conditions))

**Sources.** [HJ](#source-hj) Theorem 5.3 (with the following paragraph on the auxiliary conditions), p. 28.

**Prerequisites.** [P8.10b](#p8-10).

### Finite quotient of a perfectoid space

<a id="p8-17"></a>#### P8.17 — Finite quotients of analytically separated perfectoid spaces

Let X be an analytically separated perfectoid space over a nonarchimedean field Spa(K, K⁺) with an action of a finite group G by automorphisms over Spa(K, K⁺), such that for every rank-one point x ∈ X the closure of {x} is contained in an open affinoid perfectoid subspace Spa(A, A⁺) ⊆ X, and distinct rank-one points of one G-orbit have distinct images in |X|^h (automatic for taut |X|, in particular for X quasicompact, as for limits of good towers). Then the categorical quotient X/G is a perfectoid space, covered by opens W_x/H_x of the affinoid perfectoids V_x/H_x = Spa(A^{H_x}, A^{+H_x}), and X^◇/G → …

**Supporting results.**
- P8.17a In an analytically separated space, … (HJ Lemma 5.5)
- P8.17b The quotient map of an analytically separated … (HJ Theorem 5.8)
- P8.17c A spatial diamond with perfectoid components … (HJ Lemma 5.1)

**Sources.** [HJ](#source-hj) Theorem 5.8, p. 30.

**Prerequisites.** [P8.16a](#p8-16), [P8.7](#p8-7), [P8.11](#p8-11).

<a id="p8-18"></a>#### P8.18 — Perfectoidization of an integral extension of a perfectoid ring

Let R⁺ be an integral perfectoid ring (P1.24) and R⁺ → S⁺ an integral ring map. Then there is an initial integral perfectoid ring S⁺_perfd under S⁺ (for every integral perfectoid A, maps S⁺_perfd → A correspond to maps S⁺ → A), S⁺_perfd is the p-adic completion of a filtered colimit of integral perfectoid rings, and the p-adic completion S⁺^∧_p has the same perfectoidization, so S⁺_perfd is the universal integral perfectoid ring under the p-complete integral R⁺-algebra S⁺^∧_p. Moreover, for ϖ ∈ R⁺ a pseudouniformizer with compatible roots, T := (S⁺_perfd)^∧_ϖ[1/ϖ] is a perfectoid Tate ring and, with T⁺ the integral closure of (S⁺_perfd)^∧_ϖ in T, (S, S⁺) → (T, T⁺) is universal among maps from (S⁺[1/ϖ], S⁺) to perfectoid Tate pairs. In characteristic p, S⁺_perfd is the uncompleted perfection and the ϖ-adic completion is necessary.

**Supporting results.**
- P8.18a Integral extensions of perfectoid Huber pairs … (HJ Lemma 5.10)
- P8.18b A tower finite over a perfectoid tower is … (HJ Lemma 5.9 (with the remark after it))

**Sources.** [BS22](#source-bs22) §1, Theorem 1.17(1), p. 9; §10, Theorem 10.11; §8, Corollary 8.14.

**Prerequisites.** [P1.24](#p1-24), [P1.20b](#p1-20), [P4.15](#p4-15).

### Good tower

<a id="p8-19"></a>#### P8.19 — Good towers

Fix a nonarchimedean field K. A good tower is a cofiltered inverse system (X_i)_{i∈I} of locally noetherian adic spaces over Spa K such that (1) each X_i is the analytification of a projective variety over K and the transition maps are finite; (2) X = lim_i X_i^◇ is a perfectoid space; (3) there are two coverings of X by open affinoid perfectoid subsets U_j, V_j with the closure of U_j contained in V_j for all j, and U_j, V_j the preimages of open affinoids U_{j,i_j}, V_{j,i_j} ⊆ X_{i_j} for some i_j ∈ I.

**API.** `PerfectoidSpace.GoodTower`, `PerfectoidSpace.GoodTower.limit`, `PerfectoidSpace.GoodTower.isAnalyticallySeparated`.

**Examples.** `goodTower_const_point` (For K perfectoid, the constant tower X_i = Spa(K) is good, with …) `goodTower_frobenius_P1` (The tower ℙ¹_{ℂ_p} ← ℙ¹ ← ⋯ with transition maps T ↦ T^p is a …) `goodTower_isAnalyticallySeparated` (The limit of a good tower is analytically separated, by the …)

**Supporting results.**
- P8.19a Affinoid perfectoids pulled back from finite … (HJ Lemma 5.11)
- P8.19b Towers finite over good towers are good (HJ Proposition 5.13 (with the note after it))

**Sources.** [HJ](#source-hj) Definition 5.12, p. 32.

**Prerequisites.** [P8.15](#p8-15), [P7.11](#p7-11), `AdicSpacesPartII:R1`.

<a id="p8-20"></a>#### P8.20 — Finite quotients of good towers

Let (X_i)_{i∈I} be a good tower with an action of a finite group G (compatible actions on the X_i). Then the categorical quotient X/G of X = lim X_i^◇ is a perfectoid space, and X/G ≅ lim_i X_i/G as diamonds, …

**Supporting results.**
- P8.20a Limits of towers of opens in projective … (HJ Lemma 5.6)

**Sources.** [HJ](#source-hj) Proposition 5.13 (with the note after it), p. 33.

**Prerequisites.** [P8.19](#p8-19).

### Zariski-closed loci in perfectoid towers

<a id="p8-21"></a>#### P8.21 — Zariski-closed loci of perfectoid towers and their tilde-limit …

Let (Y_i)_{i∈I} be a cofiltered inverse system of analytifications of quasi-projective varieties over a nonarchimedean field K with finite transition maps and perfectoid limit Y = lim_i Y_i^◇, Y ~ lim Y_i; let X_i ⊆ Y_i be compatible closed subvarieties (X_j ⊆ X_i ×_{Y_i} Y_j for j ≥ i). Then X = lim_i X_i^◇ is a perfectoid space, X → Y is a Zariski-closed embedding, and X ~ lim X_i.

**Supporting results.**
- P8.21a Cofiltered limits of Zariski-closed embeddings … (HJ Lemma 5.6)
- P8.21b Pullbacks of closed subvarieties to perfectoid … (HJ Lemma 5.7)

**Sources.** [Torsion](#source-torsion) Theorem IV.1.1, p. 67.

**Prerequisites.** [P8.14](#p8-14), [P4.15](#p4-15), [P7.2](#p7-2).

<a id="p9"></a>

## P9: Continuous torsor descent with coefficients

The pro-étale site of a rigid space with its affinoid perfectoid objects and completed structure sheaves; pro-étale Galois towers with their Čech descent data; descent of O, O⁺ and finite locally free modules along a tower, over smooth and over seminormal bases and after product with a smooth weight space; twisted character sheaves with their finite-level comparison; and flat and derived coefficient change with the vanishing of higher inverse limits.

<a id="p9-1"></a>#### P9.1 — Pro-étale site of a rigid space; affinoid perfectoid objects

Let X be a locally noetherian adic space over Spa(k, k°) for a complete nonarchimedean field k ⊇ ℚ_p. Its pro-étale site X_proét has as objects the pro-objects lim U_i of X_ét along cofiltered diagrams with finite étale transition maps from some index on (with the surjectivity convention of the erratum), coverings the families with the pro-étale local surjectivity condition, and a morphism of sites ν : X_proét → X_ét. An object U = lim U_i ∈ X_proét with each U_i = Spa(R_i, R_i⁺) affinoid is affinoid perfectoid if the ϖ-adic completion (R, R⁺) of (colim R_i, colim R_i⁺) with R = R⁺[1/ϖ] is a perfectoid Tate pair; the associated affinoid perfectoid space Û = Spa(R, R⁺) satisfies Û ~ lim U_i. Affinoid perfectoid objects form a basis of X_proét, products of an affinoid perfectoid object with a profinite set are affinoid perfectoid, and the continuous valuations of R correspond to the points of lim |U_i|.

**API.** `ProEtaleSite`, `ProEtaleSite.IsAffinoidPerfectoid`, `ProEtaleSite.affinoidPerfectoid_basis`.

**Examples.** `proEtale_torus_tower` (lim_n Spa k⟨T^{±1/p^n}⟩ is affinoid perfectoid over the torus, …) `proEtale_profinite_product` (For U affinoid perfectoid and S = ℤ_p, U × S is affinoid …) `proEtale_not_affinoid_perfectoid` (A constant object Spa k⟨T⟩ (k discretely valued) is not …)

**Sources.** [Sch13](#source-sch13) §3, Definition 3.9; §4, Definition 4.3, Lemma 4.6, Proposition 4.8.

**Prerequisites.** [P7.1](#p7-1), [P5.1](#p5-1), `AdicEtaleGeometry:A1/etale-site`.

<a id="p9-2"></a>#### P9.2 — Completed structure sheaves Ô⁺, Ô on affinoid perfectoid objects

On X_proét (P9.1) define O⁺ = ν*O⁺_{X_ét}, O = ν*O_{X_ét}, Ô⁺ = lim_n O⁺/p^n and Ô = Ô⁺[1/p]. For an affinoid perfectoid object U with associated perfectoid pair (R, R⁺) and a pseudouniformizer ϖ: (i) O(U) = colim R_i and O⁺(U) = colim R_i⁺ (uncompleted); (ii) Ô⁺(U) = R⁺ and Ô(U) = R; (iii) (O⁺/ϖ)(U) is almost isomorphic to R⁺/ϖ and H^i(U, O⁺/ϖ) is almost zero for i > 0; (iv) H^i(U, Ô⁺) is almost zero and H^i(U, Ô) = 0 for i > 0; (v) for a profinite set S, Ô⁺(U × S) = C(S, R⁺) and Ô(U × S) = C(S, R) (continuous maps for the ϖ-adic topology). The almost statements are for the root ideal of ϖ in R⁺.

**Sources.** [Sch13](#source-sch13) §4, Definition 4.1 and Lemma 4.10 (i)–(v); §6, Lemma 6.4.

**Prerequisites.** [P9.1](#p9-1), [P2.8](#p2-8), [P2.7](#p2-7).

<a id="p9-3"></a>#### P9.3 — Pushforward of Ô to the étale site of a smooth rigid space

Let k be a complete discretely valued field of characteristic 0 with perfect residue field of characteristic p, and X a smooth rigid-analytic variety over k, viewed as an adic space. For the morphism of sites ν : X_proét → X_ét: ν_* Ô_X = O_{X_ét}, and more precisely R^i ν_* Ô_X ≅ Ω^i_{X/k}(−i) (Tate twist by the cyclotomic character, as sheaves on X_ét after base change to a completed algebraic closure) for all i ≥ 0. The i = 0 statement is the one used for function descent along Galois towers (P9.6): the functions on X are the pro-étale-locally completed functions that descend.

**Sources.** [Sch13](#source-sch13) §6, Proposition 6.16 and Corollary 6.19; §4, Lemma 4.5 (toric charts).

**Prerequisites.** [P9.2](#p9-2), [P9.1](#p9-1), [P1.31](#p1-31).

### Pro-étale Galois tower

<a id="p9-4"></a>#### P9.4 — Pro-étale Galois towers with perfectoid limit

Let X be either a locally noetherian adic space over Spa(ℚ_p, ℤ_p) (a rigid space over a complete discretely valued field in the source range) or a perfectoid space, and G a profinite group with a cofinal decreasing sequence of open normal subgroups G_j. A pro-étale G-tower over X is an inverse system (X_j)_j of finite étale G/G_j-Galois covers X_j → X, with compatible right actions, together with a perfectoid space X_∞ with a right G-action and compatible maps X_∞ → X_j such that X_∞ ~ lim_j X_j (tilde-limit; for X perfectoid the X_j are perfectoid and X_∞ = lim_j X_j). Viewed in X_proet (Scholze's pro-étale site for locally noetherian X, the pro-étale site of ECD for perfectoid X), X_∞ = lim_j X_j is a pro-étale G-torsor: X_∞ ×_X X_∞ ≅ X_∞ × \underline{G} via (x, g) ↦ (x, xg). For U ∈ X_proet (in particular U ⊆ X open), U_∞ := U ×_X X_∞ is a pro-étale G-tower over U, affinoid perfectoid when U is affinoid and X_∞ is affinoid perfectoid over it.

**API.** `ProetaleGaloisTower`, `ProetaleGaloisTower.level`, `ProetaleGaloisTower.torsorIso`.

**Examples.** `tower_trivial` (For G = {1} and X perfectoid, X_∞ = X, and invariants are the …) `tower_finite_etale` (For G finite acting freely on a perfectoid Y with Y → X = Y/G …) `tower_Zp_torus` (Over K = ℂ_p, the torus X = Spa(K⟨T^{±1}⟩) with X_n = …)

**Sources.** [CHJ](#source-chj) unnumbered setup paragraph of §4.1 ('A handy lemma'), p. 28.

**Prerequisites.** `AdicEtaleGeometry:A1/pro-etale-site-corrected`, [P7.2](#p7-2), [P7.12c](#p7-12).

<a id="p9-5"></a>#### P9.5 — The Čech descent datum of a pro-étale Galois tower

For a pro-étale G-tower X_∞ → X and U ∈ X_proet with U_∞ affinoid perfectoid, the Čech nerve of U_∞ → U is identified with U_∞ × \underline{G}^n (n ≥ 0), and for F ∈ {Ô⁺_X, Ô_X}: F(U_∞ × \underline{G}^n) = C(G^n, F(U_∞)) (continuous maps, F(U_∞) with its p-adic topology). The descent datum is the continuous G-action on F(U_∞), and the Čech complex of U_∞ → U with coefficients in F is the continuous cochain complex C^•_cts(G, F(U_∞)).

**API.** `ProetaleGaloisTower.cechNerveIso`, `ProetaleGaloisTower.sections_prod_profinite`, `ProetaleGaloisTower.cechComplexIso`.

**Examples.** `cech_trivial_group`, `cech_finite_group`, `cech_equalizer_eq_contInvariants`.

**Supporting results.**
- P9.5a Invariants commute with the filtered colimits … (CHJ Lemma 2.24)

**Sources.** [BHW](#source-bhw) Lemma 3.7, p. 10.

**Prerequisites.** [P9.4](#p9-4).

### Descent of functions along a perfectoid tower

<a id="p9-6"></a>#### P9.6 — Descent of O and O⁺ along a pro-étale Galois tower over a smooth …

Let X be a smooth rigid space over a complete discretely valued field k ⊇ ℚ_p with perfect residue field, and X_∞ → X a pro-étale G-tower. For every open (or qcqs étale) U ⊆ X with U_∞ = U ×_X X_∞: O⁺_X(U) = O⁺_{X_∞}(U_∞)^G and O_X(U) = O_{X_∞}(U_∞)^G. These are actual equalities of rings (the equalizer of the Čech datum in degree 0), obtained through almost statements at each finite level.

**Supporting results.**
- P9.6a Sections of étale sheaves over a Galois tower … (CHJ Lemma 2.24)
- P9.6b Continuous group cohomology of the tower … (CHJ Remark 2.25)
- P9.6c Invariants of a uniform Banach algebra under a … (CHJ Proposition 2.22)

**Sources.** [CHJ](#source-chj) Lemma 2.26, p. 20.

**Prerequisites.** [P9.5](#p9-5), [P9.2](#p9-2), [P9.1](#p9-1).

### Descent with weight-space coefficients

<a id="p9-7"></a>#### P9.7 — Descent of O and O⁺ along a torsor after product with a smooth weight …

Let L₀ ⊇ ℚ_p be a complete discretely valued field with perfect residue field and L ⊇ L₀ a perfectoid field (as in BHW §1.5, where L is a perfectoid extension of ℚ_p^cyc). […] Then for every affinoid V ⊆ Y, with affinoid perfectoid W = h^{-1}(V), and every affinoid 𝒰′ ⊆ 𝒰: O⁺(W × 𝒰′)^Γ = O⁺(V × 𝒰′) and O(W × 𝒰′)^Γ = O(V × 𝒰′). These product affinoids are not a basis of Y_𝒰; the statement is what the character sheaves need, which are sheaves on Y of O_Y ⊗̂ O(𝒰′)-modules.

**Supporting results.**
- P9.7a Descent of O and O⁺ along an affinoid … (BHW Lemma 3.7)
- P9.7b Invariants commute with completed tensor … (CHJ Lemma 2.23(2))

**Sources.** [BHW](#source-bhw) Lemma 3.7, p. 10.

**Prerequisites.** [P9.6](#p9-6), `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`, `AdicSpacesPartII:R5/sousperfectoid-rings`.

<a id="p9-8"></a>#### P9.8 — Descent of finite locally free modules and their morphisms, and the …

Let X_∞ → X be a pro-étale G-tower as in the function-descent theorem, and E, F finite locally free O_X-modules (resp. O⁺_X-modules locally free of finite rank).

**Sources.** [CHJ](#source-chj) Proposition 2.19, p. 18.

**Prerequisites.** [P9.6](#p9-6).

### Twisted character sheaf

<a id="p9-9"></a>#### P9.9 — The twisted-invariant character sheaf of a pro-étale tower

Let X_∞ → X be a pro-étale G-tower, A a coefficient algebra (a small ℤ_p-algebra with the mixed completed tensor product, or a reduced affinoid ℚ_p-algebra with ⊗̂_{ℚ_p}), and c: G → (O(X_∞) ⊗̂ A)^× a continuous 1-cocycle for the pullback action, c(γδ) = c(γ)·γ^*(c(δ)) (right action on X_∞, so (γδ)^* = γ^*δ^* on functions). The sheaf ω_c on X is ω_c(U) = {f ∈ O(U_∞) ⊗̂ A : γ^*f = c(γ)^{-1} f for all γ ∈ G}, a sheaf of O_X ⊗̂ A-modules; ω_c⁺ is defined with O⁺ and c valued in (O⁺(X_∞) ⊗̂ A°)^×.

**API.** `TwistedCharacterSheaf`, `TwistedCharacterSheaf.sections`, `TwistedCharacterSheaf.module`.

**Examples.** `twisted_trivial_cocycle` (For c = 1, ω_c = O_X ⊗̂ A (weight-space function descent).) `twisted_finite_character` (For the ℤ_p(1)-tower on the torus over ℂ_p, with γ^*T^{1/pⁿ} = …) `twisted_coboundary` (If c(γ) = F/γ^*(F) for a unit F of O(X_∞) ⊗̂ A, then ω_c = …)

**Supporting results.**
- P9.9a Invariants commute with completed tensor … (CHJ Lemma 2.23)

**Sources.** [CHJ](#source-chj) Definition 2.18, p. 17.

**Prerequisites.** [P9.4](#p9-4), [P9.5](#p9-5), [P9.7](#p9-7).

### Local freeness of character sheaves

<a id="p9-10"></a>#### P9.10 — Finite-level identification and local freeness of rank one of …

Let ω_c be a twisted character sheaf on X with A a small or affinoid coefficient algebra, and U ⊆ X an affinoid (rational or an affinoid subdomain). […] Then f ↦ f·u is an O(U) ⊗̂ A-isomorphism from ω_c(U) onto the c_n-twisted invariants (O(U_n) ⊗̂ A)^{Γ_n, c_n} = {f₀ : c_n(γ)γ^*f₀ = f₀}.

**Supporting results.**
- P9.10a Finite-group form of faithfully flat module … (CHJ Theorem 2.28)
- P9.10b Units at infinite level are finite-level units … (CHJ Proposition 2.27)
- P9.10c An integral unit eigenfunction trivialises the … (BHW Theorem 4.8, proof (sentence "It now follows from Pro)
- P9.10d Flat coefficient change: reduction modulo a … (CHJ Lemma 2.29)
- P9.10e Derived coefficient change for a nonflat … (CHJ Lemma 2.29)
- P9.10f Pro-étale coefficient sheaves from profinite … (CHJ Lemma 4.1)
- P9.10g Vanishing of higher inverse limits for … (CHJ Proposition 4.4 (proof))

**Sources.** [CHJ](#source-chj) unnumbered paragraph after Proposition 2.27 (cocycle j_{U,n}, idempotent e_n), p. 21; j_{U,n} and e_n are displayed on p. 22.

**Prerequisites.** [P9.9](#p9-9), [P9.7](#p9-7), [P9.9a](#p9-9).

<a id="p9-11"></a>#### P9.11 — Sheaf equalizers after smooth coefficient base change

Let K be a perfectoid field of mixed characteristic, Y an affinoid smooth rigid or affinoid perfectoid space over K, X → Y an affinoid perfectoid pro-étale profinite Γ-torsor, and 𝒰 a smooth rigid space over a …

**Sources.** [BHW](#source-bhw) Lemma 3.7, p. 10.

**Prerequisites.** [P9.7](#p9-7).

<a id="p9-12"></a>#### P9.12 — Function descent over a seminormal rigid base

Let K be a complete nonarchimedean field of mixed characteristic, Y a seminormal rigid analytic space over K, and X_∞ → Y a prescribed pro-étale G-tower with perfectoid limit. Then O_Y = (h* O_X∞)^G and O⁺_Y = …

**Sources.** [KL16](#source-kl16) Theorem 8.2.3 and proof, pp. 162–163 (PDF pp. 162–163).

**Prerequisites.** [P9.5](#p9-5).

<a id="p9-13"></a>#### P9.13 — Integral effectivity in arbitrary finite rank

Let h: X_∞ → X be a prescribed pro-étale G-tower with actual O⁺ function descent. […] Then E⁺ = (h* N⁺)^G is locally free of rank r_i over O⁺_X and the canonical map h⁻¹E⁺ ⊗ O⁺_X∞ → N⁺ is an isomorphism.

**Supporting results.**
- P9.13a Integral fixed points of completed lattice … (CHJ Lemma 2.23(2))

**Sources.** [BHW](#source-bhw) Theorem 4.8, proof, p. 18.

**Prerequisites.** [P9.6](#p9-6).
