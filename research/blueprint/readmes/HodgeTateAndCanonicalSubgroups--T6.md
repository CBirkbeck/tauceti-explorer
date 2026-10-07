# Hodge–Tate theory, canonical subgroups, and automorphic period maps: T6

This part constructs the finite-level logarithmic comparison package for general
canonical Shimura coefficients. It begins with analytic logarithmic geometry,
builds the Kummer and corrected pro-Kummer sites and logarithmic periods, proves
the logarithmic primitive and Riemann–Hilbert comparisons, and constructs the
Hodge–Tate filtration from two de Rham lattices. The final comparison of Levi
torsors includes the central cyclotomic twist. Its infinite-level application is
the diamond Hodge–Tate morphism owned by `PerfectoidShimuraVarieties:S6`.

The three existing layers are planned at the level of their targets. Supplier
requests below identify the additional interfaces needed to close them. All
declarations are proposals; no implementation is claimed.

## Conventions and the chain of constructions

Work in analytic locally noetherian adic geometry. A Huber pair carries its
chosen plus subring. An integral logarithmic chart factors through that plus
subring; “invertible index” means invertible in the structure sheaf, rather than
in the plus sheaf. A log structure lives on the ordinary étale site, and its
unit fibre is isomorphic to the sheaf of units. Fine and saturated are local
chart conditions. They are not finite-generation assertions for every monoid
of sections. Products and base change use the analytic fs category.

Continuous log differentials represent continuous log derivations into complete
topological modules. The finite differential module is automatically complete
in its natural topology. The log de Rham complex uses these continuous modules.
For a coordinate divisor its residue sends dlog T to 1 and dT to 0.

The Kummer site includes coordinate root covers at boundary points. The
pro-Kummer site uses the corrected transfinite-cover definition: each stage maps
to the inverse limit of all preceding stages by a pulled-back Kummer étale map,
and these maps are finite surjective for every sufficiently large ordinal.
The family is also jointly topologically surjective. The log-perfectoid basis requires an all-integer-divisible chart
limit. A p-power root tower alone does not satisfy it. A pro-object and its
associated completed perfectoid affinoid are distinct data.

The primitive comparison is an integral almost isomorphism for proper log
smooth spaces. Its early ordinary primitive input must precede full rational
period comparison. The early log-site prefix has no dependency on P8 or CP.3;
the proposal below separates ordinary and logarithmic primitive exports from
the full period-theory layers. Almost vanishing is distinguished from exact
vanishing, and finiteness is distinguished from local-system extension.

Ordinary period-ring functors are imported and instantiated on the pro-Kummer
completed sheaves. Positive structural logarithmic periods add monoid lifts and
their structural relations. Their t-localization needs an additional completion
on each filtration piece. This extra completion is present with trivial logs.
Geometric Riemann–Hilbert has an exact functor and normalized rational residues
in [0,1); unrestricted tensor and ramified-pullback isomorphisms are false.
Unipotent geometric boundary systems give the tensor subcategory. De Rham
interior coefficients give the arithmetic de Rham comparison.

For full-group canonical coefficients, write
M = Wₚ ⊗ B⁺dR and M⁰ = (WdR ⊗ OB⁺dR,log)^(∇=0) inside their common BdR module.
The ascending filtration is
F₋ⱼ = image(M ∩ Filʲ M⁰ → M / Fil¹ M),
with kernel Fil¹ M ∩ Filʲ M⁰. This displayed convention controls all indices.
For the scalar t-adic rank-one model M⁰=tᵃM, its jump is a. Named Tate-weight
conventions must be transported through T1, rather than inferred by changing
the sign of an index. The graded comparison retains its Tate twist.

Canonical coefficients are representations of Gᶜ. An arbitrary Levi
representation does not carry a full-group flat local system just because it
defines an automorphic bundle. General canonical comparison is proved using
special-point normalization and arithmetic monodromy recognition; the Siegel
case does not prove the general assertion.

## Sources and their versions

Page numbers below refer to the public copies identified here, not to the
publisher's pagination. The mathematical cards cite the statements actually
read. Imported inputs are listed separately from targets of this part.

### DLLZ-adic: Logarithmic adic spaces: some foundational results

Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu. [Logarithmic adic spaces: some foundational results](https://www.kwlan.org/articles/log-adic.pdf). Public author copy, 100 pages; arXiv:1912.09836v2 final-version record (2022-10-30); published chapter DOI 10.1007/978-3-031-21550-6_3 (2022), text not served by publisher. Accessed 2026-10-07.

SHA-256: `209e59836048eabbbf9735012a38c7c393fb2a30f69ce50ffac7e83b37ee1105`.

Read: §§2.1–2.3 (log structures, charts, analytic pairs, saturated products); §§3.1–3.3 (log smoothness and continuous differentials); §§4.1–4.4, 4.6 (Kummer covers, Abhyankar, descent, boundary extension); §§5.1, 5.3–5.4 (corrected pro-Kummer site and perfectoid basis); §§6.1–6.3 (toric cohomology, primitive comparison, local systems, monodromy).

### DLLZ-RH: Logarithmic Riemann–Hilbert correspondences for rigid varieties

Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu. [Logarithmic Riemann–Hilbert correspondences for rigid varieties](https://www.kwlan.org/articles/log-RH.pdf). Public author copy, 80 pages; J. Amer. Math. Soc. 36 (2023), DOI 10.1090/jams/1002; publisher access refused. Accessed 2026-10-07.

SHA-256: `dccd18f6605380a92e6fa9e2143547b7cfa12ddb01b08ff5af0e083818539d04`.

Read: §§2.1–2.4 (period sheaves, local coordinates, Poincaré); §§3.1–3.6 (functors, decompletion inputs, residue normalization, tensor/pullback restrictions, proper comparison); §§5.2–5.6 (general canonical coefficients, special-point normalization, arithmetic monodromy recognition); Appendix A: A.1.2, A.1.6, A.1.9, A.1.10, A.2.1.2, A.2.2.3, A.2.3.4 (decompletion theorem statements and their application in §3.3).

### BP: Higher Coleman theory

George Boxer, Vincent Pilloni. [Higher Coleman theory](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf). Public author manuscript, §4.4.5; read the finite-level results independently of the infinite-level theorem. Accessed 2026-10-07.

SHA-256: `d340c9a020cc5fdbca781a8630b6fae35e14607142bed700d6ab82334faa80ae`.

Read: §4.4.5, Propositions 4.4.38–4.4.39 and proof; Theorem 4.4.40: ownership boundary only.

## Pinned library boundary

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each declaration below was read with its hypotheses at these commits.

| Existing declaration | What it supplies |
| --- | --- |
| `tauceti:TauCeti.Huber.Pair` | Huber pair with an explicit open integrally closed plus subring contained in the power-bounded subring. |
| `tauceti:TauCeti.Huber.Pair.Hom` | Continuous ring map respecting the specified plus subrings. |
| `tauceti:TauCeti.Huber.Pair.Hom.spaComap` | Contravariant continuous map on Spa attached to a pair homomorphism; only affinoid spectra, not a log adic site. |
| `mathlib:CategoryTheory.GrothendieckTopology` | Covering sieves with maximality, pullback stability and transitivity. |
| `mathlib:CategoryTheory.Sheaf` | Sheaves of objects of a category on a Grothendieck site, implemented by the full subcategory of presheaves satisfying the sheaf condition. |
| `mathlib:Derivation` | An R-linear derivation A→M with Leibniz rule; continuity is extra data in the analytic refinement. |
| `mathlib:AdicCompletion` | Inverse limit of M/IⁿM for an ideal I, including the completion ring when M is the ring. Not the Banach completed tensor product. |
| `mathlib:BDeRhamPlus` | Completion at ker θ after inverting p in Witt vectors of the pretilt of a p-adically complete ring; the declaration alone supplies no field, principal-kernel or sheaf theorem. |
| `mathlib:fontaineThetaInvertP` | Localized Fontaine map from p-inverted Witt vectors to R[1/p], under the prime, nonunit-p and p-adic-completeness hypotheses. |

data/library-coverage.json has no direct T6 record; neighbouring HodgeTate duplicate routes concern T0–T5 and do not constitute a T6 baseline proof. Affine Spa is built, not bundled log adic geometry. BDeRhamPlus is a carrier construction under explicit assumptions, not proof of principal kernel/DVR, acyclic period sheaf or logarithmic comparison. Generic log algebra is imported from CR.5 rather than planned twice.

Read all stageEdges touching T6 and searched every links packet for T6 mentions; no matching links packet. Accepted RS-05 and RS-32 supply ordinary site/general compactification ownership but do not own BP 4.4.40.

## Layer map and supplier interfaces

| Layer | Outcome | Status |
| --- | --- | --- |
| `T6:log-sites` | Integral fs analytic logs, continuous differentials, Kummer/pro-Kummer sites, the perfectoid basis and local systems | planned |
| `T6:comparison` | Log primitive and period comparisons, normalized RH, general canonical coefficients, lattice filtration and cyclotomic Levi comparison | planned |
| `T6` | Finite-level package and exports to S6 and primitive-comparison consumers | planned |

A prerequisite naming an existing node imports that node. A stage prerequisite is an explicit request, whose exact mathematical content follows. It does not assert that the supplier has already proved it.

### Request to `AdicSpacesPartII:R0`

Locally noetherian analytic adic carriers, completed affinoid tensor products, lft fibre products, finite maps, finite normalizations of the local analytic algebras used in the SNC Abhyankar argument, and coherent continuous differential modules; import the AdicSpaces anchor, do not redefine it. T6 owns the Kummer extension/strictification theorem, not the ordinary finite-normalization machinery.

Consumers: `integral-adic-chart`, `saturated-adic-products`, `log-smooth-chart-criterion`, `continuous-log-derivation`, `kummer-root-covers`, `rigid-abhyankar`, `structural-log-period-plus`, `toric-structural-period-model`.

### Request to `AdicSpacesPartII:R1`

Analytification of finite-type log-free algebraic carriers over a nonarchimedean field, compatible with opens, finite products and coherent pullback; T6 supplies the analytic log structure.

Consumers: `divisorial-analytic-log`.

### Request to `AdicSpacesPartII:R3`

Continuous coherent differentials, Kiehl descent, coherent proper pushforward and finite-dimensional hypercohomology; the completed tensor product retains its topology.

Consumers: `continuous-log-differentials`, `log-differential-descent`, `analytic-log-de-rham`, `kummer-coherent-acyclicity`, `rigid-abhyankar`, `log-regularity-and-extension`, `arithmetic-log-de-rham`, `proper-log-period-cohomology`, `relative-log-comparison`.

### Request to `AdicSpacesPartII:R4`

Smooth characteristic-zero adic pairs with a strict normal-crossings boundary and étale local coordinate charts; obtain a no-self-intersection cover when the initial toroidal boundary is only normal crossings. For DLLZ-adic Corollary 6.2.3 request the resolution argument producing an SNC compactification of a smooth Zariski open in a proper rigid space, as cited there to Bierstone–Milman; no arbitrary nonproper rigid space is asserted to admit such a compactification.

Consumers: `divisorial-analytic-log`, `log-cohomology-finite-vanishing`.

### Request to `ClassicalAdicEtaleCohomology:H0`

Derived direct image, stalks, local systems, Čech-to-derived comparison on qcqs bases, projection formula, filtered colimit cohomology and continuous group cohomology. Import ordinary sheaf cohomology, not a log comparison theorem.

Consumers: `kummer-etale-site`, `kummer-coherent-acyclicity`, `finite-kummer-descent`, `boundary-local-system-extension`, `log-site-projections`, `log-perfectoid-basis`, `kummer-padic-local-systems`, `geometric-boundary-monodromy`, `toric-kummer-cohomology`, `proper-log-almost-finiteness`, `log-cohomology-finite-vanishing`, `log-tower-decompletion`, `log-oc-pushforward`, `arithmetic-log-de-rham`, `relative-log-comparison`.

### Request to `EnhancedDerivedSheaves:E1`

Derived sheaf functors, tensor and projection formula, hypercohomology and spectral sequences, exact inverse image and sheafification; needed for the log-site instances.

Consumers: `pro-kummer-presentations`, `log-site-projections`, `completed-structural-log-sheaves`, `kummer-padic-local-systems`, `log-poincare`, `filtered-log-connection`, `log-riemann-hilbert`, `proper-log-period-cohomology`.

### Request to `EnhancedDerivedSheaves:E2`

Derived inverse limits of locally constant torsion systems on the p-acyclic basis, with the required repleteness/Mittag–Leffler hypotheses made explicit.

Consumers: `log-perfectoid-almost-acyclicity`, `completed-kummer-local-systems`, `proper-padic-boundary-cohomology`, `structural-log-period-complete`, `log-riemann-hilbert`, `proper-log-period-cohomology`.

### Request to `PadicHodgeTheory:P8`

EARLY export only: Scholze 2013 Theorem 4.9, Lemma 4.12, Theorem 5.1 and finiteness consequences. No dependence on the full late P8 comparison. Proposed P8:primitive, not an existing stage, must precede P8:local-rational and CP.3; reconcile the older CP.3 proposal name primitive-comparison. Until the split is accepted this request is an explicit gap, not a new P8→CP.3 edge.

Consumers: `toric-kummer-cohomology`, `proper-log-almost-finiteness`, `log-primitive-comparison`.

### Request to `PerfectoidSpaces:P3`

Export ordinary completed structural-sheaf sections and almost acyclicity on affinoid perfectoid pro-objects, independently of late P8. Part II addition requested: Banach/semilinear decompletion systems, weakly/stably decompleting towers, good finite-projective models with continuous-cohomology invariance; DLLZ-RH Appendix A.1.2, A.1.10. Existing P3 almost purity alone is insufficient. The specialized log Kummer/cyclotomic towers are owned in T6.

Consumers: `log-perfectoid-almost-acyclicity`, `log-tower-decompletion`.

### Request to `ArithmeticLocallySymmetricSpaces:ALS.1`

Part II arithmetic-rigidity addition: Borel density and Margulis superrigidity with real-rank ≥2, no compact real factors and Q-simple simply connected semisimple group hypotheses; the non-type-A congruence subgroup input as actually used in DLLZ-RH §5.6. Existing local-system layer is not evidence these theorems are already supplied.

Consumers: `canonical-arithmetic-monodromy`.

### Request to `MotivesAndAlgebraicCycles:MC.7`

Proven CM/abelian-motive case only: Blasius compatibility of absolute Hodge tensors with p-adic realizations and potentially crystalline special-point realizations, enough to normalize DLLZ-RH Proposition 5.4.1. No general Shimura motive or general Hodge conjecture assumed.

Consumers: `special-point-comparison`.

### Request to `ShimuraVarieties:V8.general`

General pure Shimura data, the central split quotient Gᶜ, reflex-field canonical models, special-point conjugation/descent, simply connected reduction and the Piatetski-Shapiro pair of embeddings used in DLLZ-RH Lemma 5.6.7. Record absence of the precise embeddings as a gap.

Consumers: `special-point-comparison`, `canonical-arithmetic-monodromy`.

### Request to `HodgeTateAndCanonicalSubgroups:T1`

Tate twists, Hodge–Tate weight convention and functorial tensor-filtration interface; apply to the finite-level logarithmic lattice construction, not a universal abelian family.

Consumers: `lattice-hodge-tate-filtration`.

### Request to `HodgeTateAndCanonicalSubgroups:T2`

The algebraic Hodge cocharacter/parabolic convention and Tannakian extraction of a flag of prescribed type from filtered representations. Its period map is only a compatibility example; no T2 construction is duplicated.

Consumers: `lattice-hodge-tate-filtration`, `canonical-ht-tensor`, `finite-levi-torsor`.

## Ownership and proposed restructuring

RT-AREA-padic-1/4 confirmed duplicate ownership of BP 4.4.40. The existing summary, T6 parent and comparison suffix all include the infinite toroidal map.

Narrow all three texts to finite-level BP 4.4.38–4.4.39: log sites/periods, Poincaré, RH, canonical association, HT filtration and cyclotomic Levi comparison. Sole owner of 4.4.40 is PerfectoidShimuraVarieties:S6, importing through existing T6→S6. Retain its diamond formulation without a general perfectoid assertion.

RT-AREA-padic-1/24: ordinary primitive comparison lacks an early owner node and full P8→CP.3 creates a cycle.

Create proposed PadicHodgeTheory:P8:primitive before P8:local-rational, owning Scholze 2013 4.9, 4.12, 5.1 and finiteness; imports PerfectoidSpaces P2/P3, AdicEtaleGeometry A1, AdicSpacesPartII R3 and ClassicalAdicEtaleCohomology H0. Export it to P8:local-rational, CP.3, TC.2 and IG.3; reconcile CP.3’s older primitive-comparison name. Create proposed T6:log-primitive between log-sites and comparison, consisting of this packet’s toric-kummer-cohomology, proper-log-almost-finiteness, log-primitive-comparison, log-cohomology-finite-vanishing, proper-padic-boundary-cohomology; imports EARLY P8:primitive, not the full late P8. Export it to TC.2 and HigherHidaAndColemanTheory. Proposed ids appear only here, not as invented prerequisites.

RT-AREA-padic-1/23: BCGP-25 route 23 assigns four completed/coherent tower theorems to unrelated T4/T5/T6.

Remove 4.4.1-usual, 4.4.1-cusp, 4.4.1-analytic-usual and 4.4.1-analytic-cusp from BCGP-25 route 23. Route the first two to TC.2 in their Hodge-type toroidal rational form and the analytic pair to existing route 22, HigherHidaAndColemanTheory. Both consume T6’s early log primitive theorem, not its late canonical comparison. No local T6 node owns completed/coherent cohomology.

The existing P3 and ALS.1 descriptions do not contain the general supplier statements needed for DLLZ-RH §3.3/§5.6.

Add PerfectoidSpaces, Part II Banach decompletion systems and good semilinear finite models, with T6 owning only logarithmic tower instances. Add ArithmeticLocallySymmetricSpaces, Part II arithmetic monodromy rigidity for the precise Borel-density/superrigidity/congruence instances used in DLLZ-RH; T6 owns their application to canonical Gᶜ coefficients.

### Routed sources outside this part

**CS17 Theorem 4.1.4 and classification/modification inputs**. Imported only through the existing T1/T2 interfaces; targets belong to T2 and VectorBundlesOnCurvesAndSlopeTheory. No T6 node re-plans the p-divisible classification.

**Bijakowski–Pilloni–Stroh 2016; BP Higher Hida 2026; Pilloni 2020; BCGP 2021; Scholze 2015**. Fargues degree, Hasse invariants, integral lattices, canonical-subgroup bounds and early Siegel period estimates belong to T0–T5. None is a new definition or theorem of this finite-level T6 pass.

**BCGP-25 route 23 items 4.4.1-usual/-cusp/-analytic-usual/-analytic-cusp**. Remove the erroneous T6 assignment and re-route as above. Their log primitive input is planned here; the four tower comparisons are not.

**DLLZ-adic §§2–6, DLLZ-RH §§2–3, 5; BP 4.4.38–4.4.39**. Actual sources of this packet; read public text directly, not citations inherited from other packets.

**BP 4.4.40**. Read to verify the boundary and sole S6 ownership; not a local target.

## Logarithmic adic sites: `HodgeTateAndCanonicalSubgroups:T6:log-sites`

### Log structures on an adic étale site

**Declaration:** `TauCeti.LogAdic.LogAdicData` (definition). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space`.

For an étale-sheafy adic space X, a log adic space is (X,M,α), with M a sheaf of commutative monoids on X_ét and α:M→(O_X,×) inducing α⁻¹(O_X×)≃O_X×. Morphisms are an adic map with the compatible inverse-image monoid-sheaf map; strictness means f* M_X≃M_Y. Fine and fs mean étale-locally charted by fine and saturated monoids, not that every section monoid is finitely generated.

**Hypotheses.** X is étale sheafy; use the locally noetherian analytic category for all geometric results below.

**Dependencies.** `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/etale-structure-sheaf`, `CrystallineCohomology:CR.5:log-algebra/log-structure`, `CrystallineCohomology:CR.5:log-algebra/associated-log`, `CrystallineCohomology:CR.5:log-algebra/log-pullback`.

**Proof architecture.**

1. Apply the imported logification and pullback constructions to the ordinary étale ringed site.
2. Check the unit condition on stalks and carry the chosen plus sheaf separately.
3. Use inverse-image coherence to compose log morphisms.

**Acceptance.** The trivial log structure is O_X×, not the one-element monoid when X has nontrivial units.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.LogAdicData` | constructor | Bundle the monoid sheaf, structural map and unit isomorphism over the imported étale ringed adic carrier. |
| `TauCeti.LogAdic.LogAdicData.strict` | characterisation | f is strict exactly when the logified pullback map is an isomorphism. |
| `TauCeti.LogAdic.LogAdicData.map_id` | functoriality | Identity inverse image induces the identity log morphism. |
| `TauCeti.LogAdic.LogAdicData.map_comp` | functoriality | The composite log map is the composite of the inverse-image structural maps. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.LogAdicData.trivial_units` | degenerate | For M=O_X× the unit comparison is the identity. |
| `TauCeti.LogAdic.LogAdicData.unit_fiber` | characterisation | At every geometric stalk, each unit of O_X has a unique lift in α⁻¹(O_X×). |
| `TauCeti.LogAdic.LogAdicData.not_terminal_monoid` | non-example | For Spa(Q_p,Z_p), the one-element monoid mapping to 1 is not a log structure because Q_p× has more than one element. |

**Uses.** DLLZ-adic §4.1: Kummer maps are tested on log characteristic stalks. PrismaticCohomology:PR.8: Imports the analytic log-site geometry without a p-adic comparison.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 2.2.2(1)–(10), pp. 8–9.

**Atlas planet:** Log adic spaces.

### Integral charts and characteristic stalks

**Declaration:** `TauCeti.LogAdic.IntegralChart` (definition). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart`.

A chart θ:P_X→M_X has αθ(P_X)⊂O_X⁺ and induces P_X^a≃M_X. An fs analytic chart uses an fs monoid P. At a geometric point x the characteristic monoid is P/(αθ)⁻¹(O_X,x×); a chart need not be sharp or equal to that characteristic monoid. Morphism charts fit into P→Q and compatible structural maps.

**Hypotheses.** Use DLLZ charts, which have the additional integral-image condition.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space`, `CrystallineCohomology:CR.5:log-algebra/log-chart`, `tauceti:TauCeti.Huber.Pair`, `AdicSpacesPartII:R0`.

**Proof architecture.**

1. Instantiate CR.5 chart logification on the étale site.
2. Factor αθ through the explicit plus sheaf; compare with strict maps to the completed toric affinoid.
3. Compute the quotient by elements becoming units at each stalk (Remark 2.3.4).

**Acceptance.** The integral-image clause survives changes of affinoid plus ring.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.IntegralChart` | constructor | A monoid map P→M(U), its factorization through O⁺(U), and the associated-log isomorphism. |
| `TauCeti.LogAdic.IntegralChart.mem_plus` | projection | Every structural image of a chart element belongs to the designated plus ring. |
| `TauCeti.LogAdic.IntegralChart.characteristic` | compatibility | Its stalk characteristic is the quotient by the face of elements with unit structural image. |
| `TauCeti.LogAdic.IntegralChart.pullback` | functoriality | Adic pullback gives the compatible integral chart on the pullback log structure. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.IntegralChart.unit_chart` | degenerate | A chart with all images units has zero characteristic. |
| `TauCeti.LogAdic.IntegralChart.coordinate_axis` | computation | For the chart N→k⟨T⟩, 1↦T, the characteristic at T=0 is N and off T=0 is zero. |
| `TauCeti.LogAdic.IntegralChart.reject_inverse_p` | non-example | For Spa(Q_p,Z_p), the prelog map N→Q_p, 1↦p⁻¹, fails the chart integral-image condition even though logification is trivial. |

**Uses.** DLLZ-adic Proposition 3.1.4: Chart changes prove intrinsic log smoothness. DLLZ-RH §2.2: Integral monoid lifts define the structural period relations.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 2.3.1 and Remarks 2.3.2–2.3.4, pp. 12–13.

### Analytic normal-crossings log structures

**Declaration:** `TauCeti.LogAdic.DivisorialLog` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log`.

For X smooth over a characteristic-zero nonarchimedean field and D a strict normal-crossings divisor, U=X−D and M_X=O_X∩j_*O_U× on X_ét define an fs log structure. Locally with D={T₁⋯T_r=0}, its characteristic chart is N^r with e_i↦T_i, after integral rescaling. Pullback from an algebraic fs divisorial log pair is an analytification construction, not an identification of its algebraic and analytic sites.

**Hypotheses.** X smooth, D strict normal crossings; use an étale chart for a merely normal-crossings boundary.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart`, `CrystallineCohomology:CR.5:log-algebra/divisorial-log`, `AdicSpacesPartII:R4`, `AdicSpacesPartII:R1`.

**Proof architecture.**

1. Use the imported smooth-pair coordinate charts; combine coordinate monoids with unit logification.
2. Glue through the equality O_X∩j_*O_U×, independent of coordinates.
3. For algebraic pairs use R1 analytification and CR.5 divisorial-log compatibility.

**Acceptance.** The construction applies to toroidal compactifications only with the requisite smooth/SNC charts.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.DivisorialLog` | constructor | The log structure O_X∩j_*O_U× associated to the specified boundary complement. |
| `TauCeti.LogAdic.DivisorialLog.restrict_open` | compatibility | Restriction to U is the trivial log structure. |
| `TauCeti.LogAdic.DivisorialLog.chart` | characterisation | On r boundary coordinate hyperplanes the characteristic chart is N^r. |
| `TauCeti.LogAdic.DivisorialLog.analytification` | compatibility | For an algebraic SNC pair its analytic pullback log structure agrees with the analytic divisorial log structure. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.DivisorialLog.empty_boundary` | degenerate | If D is empty, M=O_X×. |
| `TauCeti.LogAdic.DivisorialLog.double_intersection` | computation | At the crossing T₁=T₂=0, characteristic monoid is N², while at its generic branches it is N. |
| `TauCeti.LogAdic.DivisorialLog.not_all_functions` | non-example | At a point of U, a function vanishing at that point is not a section of M; M is not all of O_X. |

**Uses.** AutomorphicBundles:B3.general: The canonical extension uses the same boundary pair. DLLZ-RH §3.2: SNC boundary supplies residue coordinates for the functors.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Examples 2.3.16–2.3.17, pp. 16–17.

### Saturated analytic log fibre products

**Declaration:** `TauCeti.LogAdic.FsAdicPullback` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products`.

In the locally noetherian coherent/fine/fs categories with the source lft hypotheses ensuring ordinary products exist, form log fibre products by ordinary adic product with monoid pushout, then integralize or saturate in the analytic category. Integralization/saturation are right adjoints to inclusion, with a closed integralization and finite surjective saturation map. The resulting underlying adic space can differ from the ordinary fibre product.

**Hypotheses.** Use DLLZ Proposition 2.3.27 hypotheses; saturation requires coherent charts on locally noetherian carriers.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart`, `CrystallineCohomology:CR.5:log-algebra/integral-log-fiber-product`, `CrystallineCohomology:CR.5:log-algebra/saturated-monoid`, `AdicSpacesPartII:R0`.

**Proof architecture.**

1. Import the monoid pushout, integralization and saturation from CR.5.
2. Use analytic chart algebras to form the corresponding closed and finite alterations of the ordinary product.
3. Check the mapping property chartwise and glue; apply the four-point lemma only with its exactness hypothesis.

**Acceptance.** Keep the fs universal property separate from any claim about ordinary adic product points.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.FsAdicPullback` | constructor | The analytic fs fibre product, with projections and compatibility over the base. |
| `TauCeti.LogAdic.FsAdicPullback.lift` | universal-property | Compatible fs log maps have a unique map to the fs pullback. |
| `TauCeti.LogAdic.FsAdicPullback.strict_base_change` | compatibility | Under strict base change the induced log structure is the ordinary pullback structure. |
| `TauCeti.LogAdic.FsAdicPullback.symmetry` | equivalence | Interchanging factors gives the canonical involutive isomorphism. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.FsAdicPullback.identity` | degenerate | Y×_X X≃Y as fs log adic spaces. |
| `TauCeti.LogAdic.FsAdicPullback.root_double` | computation | For N→N multiplication by n, the saturated self-product of the n-th root cover splits into μ_n-labelled copies after adjoining μ_n; the ordinary equation uⁿ=vⁿ alone is not its fs description. |
| `TauCeti.LogAdic.FsAdicPullback.mapping_property` | characterisation | Two morphisms from an fs test space coincide if their two projection maps coincide. |

**Uses.** DLLZ-adic §4.1: Kummer root covers are stable under fs base change. DLLZ-adic §5.3: Products of log perfectoid objects use these finite-level products.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Propositions 2.3.23 and 2.3.27; Lemma 2.3.33, pp. 18–20.

### Analytic log smoothness and log étaleness

**Declaration:** `TauCeti.LogAdic.log_smooth_chart_criterion` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion`.

For a map of locally noetherian fs log adic spaces, log smoothness (respectively log étaleness) is intrinsic and equivalent to étale-local fs charts P→Q whose group kernel and torsion cokernel (respectively entire cokernel) are finite of orders invertible in O_X, and whose induced underlying map Y→X×_{X⟨P⟩}X⟨Q⟩ is étale. These properties are stable under composition and fs base change; a strict log smooth/étale map is ordinarily smooth/étale.

**Hypotheses.** The index is invertible in O_X, not necessarily O_X⁺. Log smoothness does not imply ordinary smoothness without strictness.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products`, `CrystallineCohomology:CR.5:log-algebra/log-smooth-chart-criterion`, `AdicEtaleGeometry:A1/etale-site`, `AdicSpacesPartII:R0`.

**Proof architecture.**

1. Use DLLZ Proposition 3.1.4 to change charts; take roots of units for finite group corrections.
2. Prove composition and saturated base-change statements with the chart criterion.
3. Apply strictness to remove the monoid contribution in Proposition 3.1.7.

**Acceptance.** Toric singularities are valid log smooth examples. In characteristic zero, p-th coordinate roots are log étale although p is not a unit of O⁺.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 3.1.1, Propositions 3.1.3–3.1.7, pp. 21–24.

**Atlas planet:** Log smooth chart criterion.

### Continuous analytic log derivations

**Declaration:** `TauCeti.LogAdic.ContinuousLogDerivation` (definition). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-derivation`.

For a continuous prelog Huber-ring map (A,M,α)→(B,N,β) and a complete Hausdorff topological B-module L, a log derivation is a pair (d,δ): d is a continuous A-linear derivation B→L, δ:N→(L,+) is a monoid map, δ(f♯m)=0 and d(βn)=βn·δn. The pair is unchanged by logification and δ extends uniquely to N^gp.

**Hypotheses.** Completeness belongs to the target L; do not silently replace continuous derivations by algebraic derivations.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space`, `CrystallineCohomology:CR.5:log-algebra/prelog-ring`, `mathlib:Derivation`, `AdicSpacesPartII:R0`.

**Proof architecture.**

1. Refine Mathlib Derivation by continuity and the compatible monoid map.
2. Extend δ across logification using δ(u)=u⁻¹d(u) on units.
3. Use the group completion universal property for δ^gp.

**Acceptance.** On a coordinate chart, δ(T) is dlog T even at T=0.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.ContinuousLogDerivation` | constructor | Bundle a continuous derivation and monoid-to-additive map satisfying the relative-zero and compatibility equations. |
| `TauCeti.LogAdic.ContinuousLogDerivation.ext` | extensionality | Equality of d and δ gives equality of the log derivation. |
| `TauCeti.LogAdic.ContinuousLogDerivation.map_structural` | relation | d(βn)=βn·δ(n). |
| `TauCeti.LogAdic.ContinuousLogDerivation.postcompose` | functoriality | A continuous B-linear map L→L′ induces a log derivation to L′; identity and composite maps agree. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.ContinuousLogDerivation.zero` | degenerate | The pair of zero maps is a continuous log derivation. |
| `TauCeti.LogAdic.ContinuousLogDerivation.unit_formula` | computation | For a unit β(n), δ(n)=β(n)⁻¹d(β(n)). |
| `TauCeti.LogAdic.ContinuousLogDerivation.boundary_value` | non-example | For β(1)=T and d(T)=T, δ(1)=1; at T=0, d(T)=0 does not force δ(1)=0. |

**Uses.** DLLZ-adic Proposition 3.2.9: The analytic log differential module represents these pairs. DLLZ-RH (2.2.14): Defines the structural period connection on monoid generators.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 3.2.2 and Remark 3.2.3, p. 26.

### Continuous log differential modules

**Declaration:** `TauCeti.LogAdic.ContinuousLogDifferentials` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-differentials`.

For a topologically finite-type complete log Huber-ring map, Ω¹_log is the finite B-module representing continuous log derivations. It is constructed from the continuous ordinary differential module and B⊗_Z N^gp by imposing dβ(n)=β(n)⊗n and f♯M=0. In the completed log diagonal construction it is J/J²; finiteness makes this module complete in its natural topology, without a second arbitrary completion. For strict maps it is the ordinary continuous differential module.

**Hypotheses.** Topologically finite-type, complete log Huber rings/pairs as in DLLZ §3.2; the unrestricted algebraic Kähler module is not the analytic carrier.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-derivation`, `CrystallineCohomology:CR.5/log-differentials`, `AdicSpacesPartII:R3`.

**Proof architecture.**

1. Use the imported continuous coherent differential construction and CR.5 algebraic relations.
2. Establish its universal property in complete topological target modules by Definition 3.2.2.
3. Compare the relations with the exactified diagonal J/J² and verify strict specialization.

**Acceptance.** Its rank on a log toric n-disc is n, including along the boundary.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.ContinuousLogDifferentials` | constructor | The complete representing module with d and dlog. |
| `TauCeti.LogAdic.ContinuousLogDifferentials.lift` | universal-property | Continuous B-linear maps out correspond bijectively to continuous log derivations. |
| `TauCeti.LogAdic.ContinuousLogDifferentials.lift_unique` | extensionality | A map is determined by values on d(b) and dlog(n). |
| `TauCeti.LogAdic.ContinuousLogDifferentials.strict` | compatibility | For a strict map the module identifies with the imported continuous Ω¹_{B/A}. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.ContinuousLogDifferentials.identity` | degenerate | For the identity log Huber map the module is zero. |
| `TauCeti.LogAdic.ContinuousLogDifferentials.toric_rank` | computation | Over k, Ω¹_log of k⟨T₁,…,T_r⟩ with coordinate log structure is free on dlog T_i. |
| `TauCeti.LogAdic.ContinuousLogDifferentials.coordinate_relation` | characterisation | In that module dT_i=T_i dlog T_i; imposing dlog T_i=0 at T_i=0 is incorrect. |

**Uses.** DLLZ-adic Construction 3.3.4: Descent glues the affine module. DLLZ-RH Corollary 2.4.2: The log de Rham complex uses the locally free module.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 3.2.9, Lemma 3.2.10 and Definition 3.2.14, pp. 27–28.

### Analytic log differentials and transitivity

**Declaration:** `TauCeti.LogAdic.log_differential_descent` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent`.

The continuous affine modules descend to the coherent sheaf Ω¹_{Y/X,log} for lft locally noetherian log adic maps. They have log-étale base-change and the right-exact transitivity sequence f*Ω¹_{X/S,log}→Ω¹_{Y/S,log}→Ω¹_{Y/X,log}→0; for log smooth f the relative module is finite locally free and the corresponding sequence in the smooth setting is short exact. For log étale f it is zero.

**Hypotheses.** Use the formal log smoothness/lft equivalence of Theorem 3.3.17; all products and pullbacks are analytic fs products.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-differentials`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion`, `AdicSpacesPartII:R3`.

**Proof architecture.**

1. Glue the representing affine modules with uniqueness from their universal property.
2. Apply the analytic logarithmic conormal and transitivity sequences in Proposition 3.3.7.
3. Use infinitesimal lifting and the chart criterion to obtain local freeness and the split local sequences.

**Acceptance.** A strict étale pullback preserves Ω¹_log. A Kummer étale coordinate root has relative Ω¹_log=0 after its index is invertible.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Constructions 3.3.2–3.3.4, Proposition 3.3.7 and Theorem 3.3.17, pp. 34–39.

### Analytic log de Rham complexes and residues

**Declaration:** `TauCeti.LogAdic.AnalyticLogDR` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham`.

For a log smooth analytic map, Ω^q_log=∧^q Ω¹_log and the differential extends d with d(dlog m)=0. For a continuous integrable log connection E→E⊗Ω¹_log the coefficient complex is E⊗Ω^•_log. On an SNC pair, residue along D_i sends dlog T_i to 1, the other coordinate dlogs and regular differentials to 0 after restriction; pullback residues multiply by boundary multiplicities.

**Hypotheses.** Use continuous coherent analytic modules and an integrable coefficient connection, not unrestricted algebraic modules.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log`, `CrystallineCohomology:CR.5/log-de-rham`, `CrystallineCohomology:CR.5/log-connection`, `AdicSpacesPartII:R3`.

**Proof architecture.**

1. Import the algebraic exterior and log connection formalism of CR.5, instantiate its continuous analytic sheaf carriers.
2. Glue coordinate definitions and derive residue independence from change of local equation by a unit.
3. Compute pullback dlog(∏T_i^{m_i}u)=∑m_i dlog T_i+dlog u.

**Acceptance.** The degree-zero term is E and its first differential is ∇.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.AnalyticLogDR` | constructor | The cohomological continuous coefficient log de Rham complex. |
| `TauCeti.LogAdic.AnalyticLogDR.d_sq` | relation | Successive differentials compose to zero by integrability. |
| `TauCeti.LogAdic.AnalyticLogDR.residue` | projection | The boundary residue map on differential forms and coefficient connections. |
| `TauCeti.LogAdic.AnalyticLogDR.pullback_residue` | functoriality | Residues transform by the integer boundary-multiplicity matrix. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.AnalyticLogDR.empty_boundary` | compatibility | With trivial log structure this is the ordinary continuous de Rham complex. |
| `TauCeti.LogAdic.AnalyticLogDR.residue_coordinate` | computation | res_{T=0}(dlog T)=1, while res(dT)=0. |
| `TauCeti.LogAdic.AnalyticLogDR.root_pullback` | computation | Under T=S^n, pullback dlog T=n dlog S and its residue is n. |

**Uses.** DLLZ-RH Corollary 2.4.2: The period Poincaré resolution is a coefficient log complex. DLLZ-RH Corollary 3.5.7: Pullback residue normalization controls base change.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 3.1.7, pp. 23–24 and Corollary 3.5.7, p. 39; continuous exterior forms in DLLZ-adic Definition 3.3.19, p. 40.

### Analytic Kummer étale maps

**Declaration:** `TauCeti.LogAdic.KummerEtale` (definition). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism`.

A map of locally noetherian fs log adic spaces is Kummer if every characteristic stalk map is injective and every target element has a positive multiple in its image. It is Kummer étale when also log étale. Étale-locally it is an étale map following an fs root-chart map whose finite group index is invertible in O_X. Kummer étale and finite Kummer étale maps are stable under composition and fs base change.

**Hypotheses.** Use characteristic stalks, and the index in O_X rather than O_X⁺.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion`, `CrystallineCohomology:CR.5:log-algebra/kummer-morphism`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products`.

**Proof architecture.**

1. Import the generic saturated-monoid Kummer definition from CR.5.
2. Combine the root-chart criterion with analytic log étaleness.
3. Use DLLZ Propositions 4.1.14–4.1.15 for composition, base change and cancellation.

**Acceptance.** Trivial log structures give ordinary étale morphisms.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.KummerEtale` | constructor | A log étale map together with the Kummer condition on characteristic stalks. |
| `TauCeti.LogAdic.KummerEtale.root_chart` | characterisation | Étale locally a Kummer étale map factors through an admissible finite root chart. |
| `TauCeti.LogAdic.KummerEtale.comp` | functoriality | Composition preserves Kummer étaleness. |
| `TauCeti.LogAdic.KummerEtale.base_change` | functoriality | Fs analytic base change preserves Kummer étaleness. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.KummerEtale.strict` | compatibility | A strict Kummer étale map is ordinarily étale. |
| `TauCeti.LogAdic.KummerEtale.p_root_char_zero` | computation | T=S^p with coordinate logs is Kummer étale over a characteristic-zero p-adic field. |
| `TauCeti.LogAdic.KummerEtale.reject_p_root_char_p` | non-example | Over characteristic p, the same nontrivial coordinate root map is not log étale because the index p is not invertible in O_X. |

**Uses.** DLLZ-adic Definition 4.1.16: Defines objects and generating covers of the Kummer étale site. DLLZ-adic §5.1: Finite Kummer étale maps are the eventual transition steps.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definitions 4.1.1–4.1.2, Proposition 4.1.6 and Propositions 4.1.14–4.1.15, pp. 41–46.

### Finite root covers and their Galois group

**Declaration:** `TauCeti.LogAdic.RootCover` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers`.

For a sharp fs chart P and n≥1 invertible in O_X, define X^{1/n}=X×_{X⟨P⟩}X⟨(1/n)P⟩ in the fs category. It is finite surjective Kummer étale. When all n-th roots of unity are present, its chart Galois group is Hom((1/n)P^gp/P^gp,μ_n), with the action on root monomials; a finite Kummer cover is locally dominated by such a root cover followed by a strict étale map.

**Hypotheses.** The chart is integral; the chosen base contains μ_n for the stated Galois description.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products`, `AdicSpacesPartII:R0`.

**Proof architecture.**

1. Use monoid root construction from CR.5 and analytic finite completed chart algebras.
2. Apply Proposition 4.1.6 and fs fibre-product universal property to the cover action.
3. Use rigid Abhyankar’s chart refinement to dominate finite Kummer covers.

**Acceptance.** Do not call the cover ordinarily étale along its boundary.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.RootCover` | constructor | The fs n-th root cover of an integral sharp fs chart. |
| `TauCeti.LogAdic.RootCover.action` | structure | Hom((1/n)P^gp/P^gp,μ_n) acts by multiplying the root monomial of a by its character. |
| `TauCeti.LogAdic.RootCover.refine` | functoriality | For n dividing m the m-th root cover maps to the n-th root cover, compatibly under divisibility composition. |
| `TauCeti.LogAdic.RootCover.strictify` | compatibility | After sufficiently divisible root base change a finite Kummer cover becomes strictly finite étale. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.RootCover.one` | degenerate | The first root cover is X. |
| `TauCeti.LogAdic.RootCover.disc_action` | computation | For P=N and μ_n present, ζ sends S to ζS on T=S^n. |
| `TauCeti.LogAdic.RootCover.ramified_boundary` | non-example | For n>1 the root map on the log disc has ramification index n at T=0 and is not strict étale there. |

**Uses.** DLLZ-adic §5.3: All-root inverse limits give the log perfectoid basis. DLLZ-RH §2.3: Characters of the chart group control periods and residues.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.1.5 and Proposition 4.1.6, pp. 41–42.

### Characteristic ramification index

**Declaration:** `TauCeti.LogAdic.RamificationIndex` (definition). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-ramification-index`.

At a geometric point of a Kummer map the ramification index is the exponent of the finite abelian group coker(M̄_X^gp→M̄_Y^gp), not its cardinality. A Kummer étale map has index one everywhere exactly when it is strict étale.

**Hypotheses.** The cokernel is finite for the fs Kummer maps under consideration.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism`, `CrystallineCohomology:CR.5:log-algebra/characteristic-monoid`.

**Proof architecture.**

1. Apply the characteristic group-completion map.
2. Take the finite-group exponent and compare index one with characteristic isomorphism.
3. Use DLLZ Lemma 4.1.13 to pass from the stalk condition to strict étaleness.

**Acceptance.** A product of two n-th coordinate roots has index n, not n².

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.RamificationIndex` | constructor | The exponent of the characteristic group cokernel at the specified point. |
| `TauCeti.LogAdic.RamificationIndex.index_one` | characterisation | Index one for a Kummer étale map is equivalent to strict étaleness at that point. |
| `TauCeti.LogAdic.RamificationIndex.base_change` | compatibility | Compute the index from the saturated base-changed characteristic map; it can decrease after root base change. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.RamificationIndex.identity` | degenerate | The identity has index one. |
| `TauCeti.LogAdic.RamificationIndex.two_coordinates` | computation | Multiplication by n on N² has index n, since the cokernel is (Z/n)². |
| `TauCeti.LogAdic.RamificationIndex.off_boundary` | computation | On the boundary complement the coordinate-root characteristic cokernel is zero and the index is one. |

**Uses.** DLLZ-adic Lemma 5.3.8: Divisibility of the limit characteristic removes finite Kummer ramification.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.1.12 and Lemma 4.1.13, pp. 44–45.

### The Kummer étale ringed site

**Declaration:** `TauCeti.LogAdic.KummerEtaleSite` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site`.

For a locally noetherian fs log adic X, X_két has all Kummer étale Y→X as objects, all X-log morphisms, and jointly surjective families on the underlying topological spaces as coverings. Composition, cancellation and fs products give a pretopology; representables are sheaves. O, O⁺ and M are sheaves obtained from the underlying analytic/log carriers. For affinoid X, H^i(X_két,O)=0 for i>0. The strict étale inclusion defines ε:X_két→X_ét.

**Hypotheses.** All topological points, including higher-rank points, count in joint surjectivity.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers`, `AdicEtaleGeometry:A1/etale-site`, `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.Sheaf`, `ClassicalAdicEtaleCohomology:H0`.

**Proof architecture.**

1. Apply DLLZ Definition 4.1.16 and the stability/cancellation results.
2. Use Theorem 4.3.1 for structural sheaves and affinoid acyclicity, Proposition 4.3.4 for M, and Proposition 4.3.5 for representable descent.
3. Construct ε using the continuous left-exact strict étale inclusion.

**Acceptance.** The site agrees with the ordinary étale site for trivial log structures.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.KummerEtaleSite` | constructor | The category, joint-surjectivity topology, and structural sheaves. |
| `TauCeti.LogAdic.KummerEtaleSite.epsilon` | projection | The geometric morphism to the ordinary étale site induced by strict objects. |
| `TauCeti.LogAdic.KummerEtaleSite.pullback` | functoriality | Fs log base change induces the inverse-image functor, with identity and composition coherence. |
| `TauCeti.LogAdic.KummerEtaleSite.representable` | structure | Representable presheaves satisfy Kummer étale descent. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.KummerEtaleSite.trivial_log` | compatibility | For the trivial log structure, X_két≃X_ét as ringed sites. |
| `TauCeti.LogAdic.KummerEtaleSite.root_is_cover` | computation | A finite root cover of a coordinate disc is a covering object even at T=0. |
| `TauCeti.LogAdic.KummerEtaleSite.no_closed_point_shortcut` | non-example | A family covering only rank-one classical points is not declared a cover without joint surjectivity on every adic point. |

**Uses.** DLLZ-adic Theorem 6.2.1: The primitive comparison uses cohomology on X_két. PrismaticCohomology:PR.8: Imports chartwise log descent.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.1.16, pp. 46–47; Theorem 4.3.1 and Propositions 4.3.4–4.3.5, pp. 52–55.

**Atlas planet:** Kummer étale site.

### Affinoid Kummer coherent acyclicity

**Declaration:** `TauCeti.LogAdic.kummer_coherent_acyclicity` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-coherent-acyclicity`.

For an affinoid noetherian fs log adic X, H^i(X_két,F)=0 for i>0 if F is an analytic coherent O-module, or if F is coherent and X is over an affinoid field. The analytic qualification and the field alternative are retained: this is not a claim for every coherent module over an arbitrary affinoid base.

**Hypotheses.** Use the two alternatives of DLLZ Theorem 4.3.7.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers`, `AdicSpacesPartII:R3`, `ClassicalAdicEtaleCohomology:H0`.

**Proof architecture.**

1. Refine Kummer covers into strict étale and standard root covers.
2. For an analytic coherent module tensor the O-linear contracting homotopy of Lemma 4.3.2 with its affine sections.
3. For the field alternative use coherent descent through the finite root-chart models and the source argument.

**Acceptance.** For F=O recover Theorem 4.3.1.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.3.7, pp. 55–56.

### Finite Kummer descent and local systems

**Declaration:** `TauCeti.LogAdic.finite_kummer_descent` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent`.

Finite Kummer étale covers satisfy effective descent along surjective Kummer étale maps; locally constant finite sheaves are represented by finite Kummer covers, and on connected pointed X their fibres identify with continuous finite representations of π₁_két(X). Finite locally constant coefficient-module sheaves have the corresponding representation description.

**Hypotheses.** Locally noetherian fs X; use log geometric points rather than unlogged geometric points for the fibre functor.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers`, `ClassicalAdicEtaleCohomology:H0`.

**Proof architecture.**

1. Use Theorem 4.4.12 for effective finite Kummer descent under a surjective Kummer étale map.
2. Construct log geometric points by all-root characteristic extensions.
3. Apply Theorem 4.4.15 and Corollary 4.4.18 to the resulting Galois category.

**Acceptance.** On a toric log point over an algebraically closed field the inertia is Hom(P^gp,Ẑ(1)) with permitted prime indices.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorems 4.4.12, 4.4.15 and Corollary 4.4.18, pp. 60–63.

### Rigid logarithmic Abhyankar lemma

**Declaration:** `TauCeti.LogAdic.rigid_abhyankar` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/rigid-abhyankar`.

For X smooth rigid analytic over a characteristic-zero nonarchimedean field, D an SNC divisor, and U=X−D, every finite étale cover of U extends to a finite Kummer étale cover of X with its divisorial log structure. After a sufficiently divisible finite root cover of the boundary chart the extension is strict finite étale.

**Hypotheses.** Use the normalization/finite extension theorem on smooth analytic pairs; do not assume the original cover is étale over D.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent`, `AdicSpacesPartII:R0`, `AdicSpacesPartII:R3`.

**Proof architecture.**

1. First extend the finite cover by analytic normalization over the boundary.
2. Apply the local root-chart argument of Lemmas 4.2.2–4.2.3 to kill ramification.
3. Descend the chartwise finite Kummer extensions and glue uniquely.

**Acceptance.** The n-th root cover of the punctured disc extends as its log root cover, not as an ordinarily étale disc cover.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 4.2.1 and Lemmas 4.2.2–4.2.3, pp. 47–49.

### Extension across an SNC boundary

**Declaration:** `TauCeti.LogAdic.boundary_local_system_extension` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension`.

For a smooth characteristic-zero analytic SNC pair j:U→X, restriction gives an equivalence of finite locally constant torsion sheaves on X_két and U_ét, with inverse j_két,* and R^i j_két,*L=0 for i>0. Thus their torsion cohomologies agree. This extension statement does not require X proper; finiteness of cohomology is a separate proper-comparison conclusion.

**Hypotheses.** Use the pair of Example 2.3.17 and torsion local systems of Corollary 4.6.7.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/rigid-abhyankar`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent`, `ClassicalAdicEtaleCohomology:H0`.

**Proof architecture.**

1. Apply the rigid Abhyankar lemma to represent the finite local system.
2. Use the root-chart inertia computation and the boundary purity argument of Theorem 4.6.1.
3. Deduce the derived cohomology comparison from vanishing higher direct images.

**Acceptance.** For empty boundary this is the identity; this alone gives no finiteness statement for a nonproper disc.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.6.1 and Corollary 4.6.7, pp. 68–69.

### Pro-Kummer étale presentations

**Declaration:** `TauCeti.LogAdic.ProKummerPresentation` (definition). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations`.

In pro-X_két, a pro-Kummer étale U→V admits a cofiltered presentation by Kummer étale U_i→V with transitions eventually finite Kummer étale and surjective. A finite-stage Kummer morphism in the pro-category is a base change of a morphism in X_két; this is stronger than a statement about the limit topological map. Underlying spaces are inverse limits of the finite-stage spaces.

**Hypotheses.** Cofiltered small presentations and eventual transition condition, as in Definition 5.1.1.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site`, `AdicEtaleGeometry:A1/pro-etale-morphism`, `EnhancedDerivedSheaves:E1`.

**Proof architecture.**

1. Use the ordinary pro-category construction and the finite-level Kummer category.
2. Define eventual finite-surjective transition presentations invariant under cofinal reindexing.
3. Use Lemma 5.1.4 for finite limits and composition.

**Acceptance.** A constant Kummer object is allowed; no perfectoid condition is required.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.ProKummerPresentation` | constructor | A cofiltered finite-level Kummer presentation with eventually finite surjective transitions. |
| `TauCeti.LogAdic.ProKummerPresentation.reindex` | equivalence | Cofinal reindexing represents the same pro-object. |
| `TauCeti.LogAdic.ProKummerPresentation.base_change` | functoriality | Base change of the finite-level presentation represents the fs pullback pro-object. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.ProKummerPresentation.constant` | degenerate | A constant finite Kummer object has a valid presentation. |
| `TauCeti.LogAdic.ProKummerPresentation.root_tower` | computation | The divisibility-indexed system of all coordinate root covers is pro-Kummer étale. |
| `TauCeti.LogAdic.ProKummerPresentation.eventual_surjectivity` | non-example | A raw inverse system with no eventually finite surjective transitions does not qualify merely because its limit topological map is surjective. |

**Uses.** DLLZ-adic Definition 5.1.2: Provides the objects of the pro-Kummer site. DLLZ-adic Definition 5.3.1: Adds sharp charts and perfectoid completion to this presentation.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.1.1 and Lemma 5.1.4, pp. 70–71.

### Corrected transfinite pro-Kummer coverings

**Declaration:** `TauCeti.LogAdic.CorrectedProKummerCover` (definition). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/corrected-pro-kummer-covers`.

A covering family {U_a→U} consists of pro-Kummer maps jointly surjective on all underlying points, each supplied with a tower indexed by ordinals μ<λ, starting at U₀=U, such that U_μ→lim_{μ′<μ}U_μ′ is pulled back from a Kummer étale map and, for all sufficiently large μ, from a finite surjective Kummer étale map. These exact tower conditions, not arbitrary surjective pro-morphisms, generate the topology.

**Hypotheses.** Use DLLZ Definition 5.1.2 including its eventual clause; distinguish it from an arbitrary countable inverse sequence.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations`, `AdicEtaleGeometry:A1/corrected-covers-pretopology`, `mathlib:CategoryTheory.GrothendieckTopology`.

**Proof architecture.**

1. Adapt the imported corrected ordinary-cover machinery to the finite-level Kummer category.
2. Prove pullback and composition stability by tower refinements (Lemma 5.1.4).
3. Verify finite-stage Kummer covering families and transfinite limits remain covering.

**Acceptance.** Keep the transfinite certificate with the covering family.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.CorrectedProKummerCover` | constructor | A joint-surjectivity proof plus the ordinal tower certificates with eventual finite-surjective steps. |
| `TauCeti.LogAdic.CorrectedProKummerCover.pullback` | functoriality | Pullback of a certified cover is a certified cover. |
| `TauCeti.LogAdic.CorrectedProKummerCover.refinement` | structure | Composite coverings admit a common transfinite refinement with the same step conditions. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.CorrectedProKummerCover.identity` | degenerate | The identity family is a cover. |
| `TauCeti.LogAdic.CorrectedProKummerCover.finite_stage` | compatibility | Every finite-stage jointly surjective Kummer étale family gives a cover of constant pro-objects. |
| `TauCeti.LogAdic.CorrectedProKummerCover.need_tower` | non-example | Joint topological surjectivity alone is not the definition of a pro-Kummer cover; the tower certificate is required. |

**Uses.** DLLZ-adic Proposition 5.1.5: Needed for the algebraic topos and qcqs basis. DLLZ-adic Proposition 5.3.13: Refinement is used for acyclic torsion covers.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.1.2(1)–(3) and Lemma 5.1.4, pp. 70–71.

### The corrected pro-Kummer étale site

**Declaration:** `TauCeti.LogAdic.ProKummerEtaleSite` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site`.

X_prokét is the full category of pro-Kummer objects over X, with the topology generated by the corrected transfinite covers. It has finite limits and a qcqs generating basis; its topos is algebraic. Constant objects define ν:X_prokét→X_két. Trivial log structure recovers the corrected ordinary pro-étale site, not the obsolete naive covering definition.

**Hypotheses.** X locally noetherian fs, pro-objects and covers as the preceding definitions.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/corrected-pro-kummer-covers`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `mathlib:CategoryTheory.Sheaf`.

**Proof architecture.**

1. Construct the Grothendieck topology from the corrected covers.
2. Apply Proposition 5.1.5 to identify qcqs objects and a generating basis.
3. Use the constant-object functor for ν; verify trivial-log comparison on both categories and covers.

**Acceptance.** Its structure sheaves are defined by inverse image, not ad hoc values on the completed perfectoid space.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.ProKummerEtaleSite` | constructor | The category, corrected topology and qcqs basis. |
| `TauCeti.LogAdic.ProKummerEtaleSite.nu` | projection | The site morphism ν induced by constant Kummer objects. |
| `TauCeti.LogAdic.ProKummerEtaleSite.pullback` | functoriality | Fs log maps induce coherent pullback functors on the pro-Kummer topoi. |
| `TauCeti.LogAdic.ProKummerEtaleSite.trivial_log` | equivalence | Trivial logs recover the corrected ordinary pro-étale site. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.ProKummerEtaleSite.final_object` | degenerate | Constant X is final in the site category. |
| `TauCeti.LogAdic.ProKummerEtaleSite.constant_root` | computation | A finite root cover of X gives a constant covering object of X_prokét. |
| `TauCeti.LogAdic.ProKummerEtaleSite.ordinary_compatibility` | compatibility | On a trivially logged X, the ν projection matches the ordinary corrected ν under the site equivalence. |

**Uses.** DLLZ-RH §2.2: All period sheaves are defined on this site. PrismaticCohomology:PR.8: Uses the early site construction independently of P8.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.1.2 and Proposition 5.1.5, pp. 70–72.

**Atlas planet:** Pro-Kummer étale site.

### Pro-Kummer projection and cohomological descent

**Declaration:** `TauCeti.LogAdic.log_site_projections` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections`.

For an abelian sheaf F on X_két and qcqs U=lim U_i in X_prokét, H^q(U,ν⁻¹F)=colim_i H^q(U_i,F). The unit F→Rν_*ν⁻¹F is an isomorphism, so inverse image is fully faithful and preserves the cohomology of X. Combine ν with ε and the analytic-site projection, and with restriction to the boundary complement.

**Hypotheses.** Use qcqs U and finite-level basis as in Proposition 5.1.6, not an unrestricted sections formula on arbitrary objects.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension`, `AdicEtaleGeometry:A1/proetale-projection-nu`, `ClassicalAdicEtaleCohomology:H0`, `EnhancedDerivedSheaves:E1`.

**Proof architecture.**

1. Use the algebraic-topos qcqs basis and filtered-colimit sheaf cohomology.
2. Show the adjunction unit on the generating finite-level objects (Proposition 5.1.7).
3. Compose the morphisms of sites and derive the cohomology comparisons.

**Acceptance.** Constant torsion sheaves have the same Kummer and pro-Kummer cohomology.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Propositions 5.1.6–5.1.7 and Corollary 5.1.8, p. 72.

### All-root toric Kummer towers

**Declaration:** `TauCeti.LogAdic.AllRootTower` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower`.

For a sharp fs monoid P and a strict smooth toric chart X→Spa(k⟨P⟩,k⁺⟨P⟩), take the divisibility-indexed system of chart covers (1/n)P and field extensions containing μ_n. Over a perfectoid algebraically closed base its completed affinoid limit is perfectoid, its chart limit is P_{Q≥0}, and geometric Galois group Γ=Hom(P^gp,Ẑ(1)). Cyclotomic arithmetic adds the corresponding semidirect Galois action.

**Hypotheses.** Characteristic zero analytic X; for the arithmetic tower k is p-adic and k_∞ is the cyclotomic extension.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations`, `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `PerfectoidSpaces:P3/almost-purity-theorem`.

**Proof architecture.**

1. Use root-cover transition maps and the imported perfectoid toric completion.
2. Check cofinality through the divisibility indexing and all required roots of unity.
3. Compute characters on monomials and the cyclotomic conjugation action.

**Acceptance.** The chart-limit divisibility is for every integer n, not just powers of p.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.AllRootTower` | constructor | The divisibility-indexed root presentation together with its field/root-of-unity data. |
| `TauCeti.LogAdic.AllRootTower.character_action` | simp | γ(e^a)=χ_a(γ)e^a on a root monomial. |
| `TauCeti.LogAdic.AllRootTower.geometric_group` | characterisation | The geometric group is Hom(P^gp,Ẑ(1)). |
| `TauCeti.LogAdic.AllRootTower.cyclotomic_conjugation` | relation | Arithmetic conjugation acts on the geometric Ẑ(1)-directions through the cyclotomic character. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.AllRootTower.rank_zero` | degenerate | For P=0, the geometric root group is trivial. |
| `TauCeti.LogAdic.AllRootTower.two_coordinates` | computation | For P=N² the geometric group is Ẑ(1)². |
| `TauCeti.LogAdic.AllRootTower.p_only_insufficient` | non-example | The monoid N[1/p] is not q-divisible for a prime q≠p; its p-only tower does not satisfy the all-root chart-limit condition. |

**Uses.** DLLZ-adic §6.1: Characters and Koszul computations prove local cohomology bounds. DLLZ-RH §3.3: Good finite-level models yield period pushforward acyclicity.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 5.3.4 and §6.1; DLLZ-RH §2.3 and (3.3.4).

### Log affinoid perfectoid pro-objects

**Declaration:** `TauCeti.LogAdic.LogAffinoidPerfectoid` (definition). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid`.

U in X_prokét is log affinoid perfectoid if it has a presentation with an initial finite stage, sharp fs charts P_i, Kummer chart transition maps, a completed uniformized colimit Huber pair (R,R⁺) that is perfectoid, and colim P_i uniquely n-divisible for every n≥1. The associated Û=Spa(R,R⁺) is a perfectoid space and |Û|≃lim|U_i|; Û itself is not asserted to be an object of X_prokét.

**Hypotheses.** Analytic locally noetherian fs X over Spa(Z_p,Z_p); the structural-sheaf conclusions below use X over Q_p.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site`, `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `PerfectoidSpaces:P3/almost-purity-theorem`.

**Proof architecture.**

1. Use Definition 5.3.1 with uniformization before completing the colimit.
2. Show all-integer divisibility of the chart limit and topological identification in Lemma 5.3.6.
3. Use Lemma 5.3.8 to make finite-level Kummer maps strict étale after passage to U.

**Acceptance.** The object/presentation and its completed affinoid realization are different data.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.LogAffinoidPerfectoid` | constructor | The finite-stage sharp-chart presentation, all-integer divisibility and perfectoid completed-pair data. |
| `TauCeti.LogAdic.LogAffinoidPerfectoid.realization` | projection | The associated completed perfectoid Huber pair and its Spa. |
| `TauCeti.LogAdic.LogAffinoidPerfectoid.topology` | compatibility | The realization topology is canonically the inverse-limit topology of the presentation. |
| `TauCeti.LogAdic.LogAffinoidPerfectoid.strict_pullback` | functoriality | Strict closed pullback and Kummer étale localization preserve these objects with the source completion convention. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.LogAffinoidPerfectoid.trivial_chart` | compatibility | With zero characteristic chart the definition agrees with ordinary affinoid perfectoid pro-objects. |
| `TauCeti.LogAdic.LogAffinoidPerfectoid.all_divisibility` | characterisation | For each n>0 and a in colim P_i there is a unique b with nb=a. |
| `TauCeti.LogAdic.LogAffinoidPerfectoid.no_p_only` | non-example | A perfectoid ring completion with chart limit N[1/p] is not log affinoid perfectoid in DLLZ’s sense. |

**Uses.** DLLZ-adic Theorem 5.4.3: Computes completed structural sheaves and almost cohomology. DLLZ-RH Definition 2.2.10: Defines periods by presentations on this basis.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.3.1, Remark 5.3.3 and Lemmas 5.3.6–5.3.8, pp. 74–76.

**Atlas planet:** Log affinoid perfectoid objects.

### Perfectoid basis and Kummer strictification

**Declaration:** `TauCeti.LogAdic.log_perfectoid_basis` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis`.

For every analytic locally noetherian fs X over Spa(Z_p,Z_p), log affinoid perfectoid objects form a basis of X_prokét. They are stable under the finite products used in the source and strict closed pullbacks, and on such U every Kummer étale localization becomes strict étale with associated perfectoid realization. There is a basis refinement on which ν⁻¹L is acyclic for every p-torsion locally constant sheaf L (Proposition 5.3.13).

**Hypotheses.** Analytic locally noetherian fs X over Spa(Z_p,Z_p); neither log smoothness nor a perfectoid base field is required for Propositions 5.3.12–5.3.13.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/rigid-abhyankar`, `PerfectoidSpaces:P3/almost-purity-theorem`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `ClassicalAdicEtaleCohomology:H0`.

**Proof architecture.**

1. Refine any Kummer chart by all-root toric covers.
2. Use all-integer chart divisibility to remove finite Kummer ramification.
3. Apply ordinary perfectoid étale descent and torsion-acyclic refinement on the strictified localization.

**Acceptance.** Retain the analytic locally noetherian fs hypotheses; a smoothness assumption would unnecessarily weaken the source.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemmas 5.3.7–5.3.8, Propositions 5.3.11–5.3.13, pp. 76–78.

### Completed and tilted structural log sheaves

**Declaration:** `TauCeti.LogAdic.CompletedLogStructure` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves`.

On X_prokét over Q_p set O⁺=ν⁻¹O⁺_két, O=ν⁻¹O_két, Ô⁺=lim_n O⁺/p^n, Ô=Ô⁺[1/p], Ô^{♭+}=lim_Frob O⁺/p. Set M=ν⁻¹M_két and M♭=lim_{a↦a^p}M, with the structural map α♭ to Ô♭. On log perfectoid presentations M(U)=colim M_i(U_i). Limits and localizations are formed in sheaves; ring sections alone do not define the topology.

**Hypotheses.** X locally noetherian fs over Spa(Q_p,Z_p); Frobenius is applied in characteristic p for the tilt.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid`, `AdicEtaleGeometry:A1/etale-structure-sheaf`, `EnhancedDerivedSheaves:E1`, `mathlib:AdicCompletion`.

**Proof architecture.**

1. Use inverse image along ν and sheaf limits/quotients.
2. Construct tilt via Frobenius and the compatible log structural maps.
3. Compare sections on qcqs perfectoid basis objects with the completed presentation.

**Acceptance.** Distinguish O⁺, Ô⁺ and their tilt before inverting p.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.CompletedLogStructure` | constructor | The inverse-image, completed and tilted ring/monoid sheaves with their maps. |
| `TauCeti.LogAdic.CompletedLogStructure.mod_p` | compatibility | On the perfectoid basis Ô⁺/p identifies with O⁺/p. |
| `TauCeti.LogAdic.CompletedLogStructure.tilt_projection` | projection | The nth Frobenius-limit projection and the multiplicative sharp map. |
| `TauCeti.LogAdic.CompletedLogStructure.functorial` | functoriality | Log pullback gives compatible maps of all structural sheaves and their completions. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.CompletedLogStructure.constant_point` | computation | For a perfectoid field point the completed plus sections are its selected K⁺. |
| `TauCeti.LogAdic.CompletedLogStructure.frobenius_relation` | characterisation | A tilt sequence satisfies x_{n+1}^p=x_n modulo p. |
| `TauCeti.LogAdic.CompletedLogStructure.not_localize_first` | non-example | Taking p-adic completion after inverting p yields zero quotients, so it cannot replace Ô⁺ followed by inversion. |

**Uses.** DLLZ-RH Definition 2.2.3: The tilt and θ feed the ordinary period-ring functor on this site. DLLZ-adic Theorem 6.2.1: O⁺/p is the primitive-comparison coefficient sheaf.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.4.1 and Proposition 5.4.2, p. 78.

### Almost acyclicity on log perfectoid objects

**Declaration:** `TauCeti.LogAdic.log_perfectoid_almost_acyclicity` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity`.

For log affinoid perfectoid U over the given p-adic base with realization Spa(R,R⁺), Ô(U)=R, Ô⁺(U)=R⁺, Ô^{♭+}(U)=R^{♭+}; higher cohomology of Ô⁺ and its p^n quotients is almost zero relative to the perfectoid valuation ideal. Rational completed structural sheaves are acyclic. The analogous completed coefficient statements hold for finite locally constant Z_p-module sheaves after the specified log-perfectoid refinement.

**Hypotheses.** Use Theorems 5.4.3–5.4.4 with their locally noetherian fs/Q_p and basis hypotheses; retain the valuation ideal defining almost mathematics.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves`, `PerfectoidSpaces:P3/almost-purity-theorem`, `PerfectoidSpaces:P3`, `EnhancedDerivedSheaves:E2`.

**Proof architecture.**

1. Identify the localized pro-Kummer topos with the strictified ordinary perfectoid étale localization.
2. Apply imported almost purity and ordinary completed-sheaf calculations.
3. Pass to inverse limits using the p-acyclic basis; invert p only after integral almost statements.

**Acceptance.** Integral higher cohomology is almost zero, not asserted to vanish exactly.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorems 5.4.3–5.4.4, pp. 79–81.

### Kummer étale p-adic local systems

**Declaration:** `TauCeti.LogAdic.KummerLisse` (definition). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems`.

A lisse Z_p-sheaf on X_két is an inverse system L_n of locally constant finite-generated Z/p^n-module sheaves, isomorphic in the pro-category to one satisfying L_{n+1}/p^n≃L_n. Torsion is allowed. A Q_p-local system is an object of the stackification of the isogeny category, so a global Z_p lattice is not part of its definition.

**Hypotheses.** Use the finite-generated, not necessarily finite-free, convention of DLLZ Definition 6.3.1.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site`, `ClassicalAdicEtaleCohomology:H0`, `EnhancedDerivedSheaves:E1`.

**Proof architecture.**

1. Build the torsion-system category from finite Kummer local systems.
2. Localize morphisms by p and stackify for the rational category.
3. Use finite-level compatibility for morphisms, dual/tensor on the finite-free rational part.

**Acceptance.** Fp is a valid torsion Z_p-local system; rational tensor assertions use finite-rank local systems.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.KummerLisse` | constructor | The compatible locally constant torsion system, with pro-isomorphism to a strict system. |
| `TauCeti.LogAdic.KummerLisse.reduction` | projection | Evaluation at level n and the reduction isomorphism for a strict representative. |
| `TauCeti.LogAdic.KummerLisse.rationalization` | functoriality | Pass to the isogeny stack to obtain the associated Q_p-local system. |
| `TauCeti.LogAdic.KummerLisse.morphism` | characterisation | Morphisms are compatible pro-morphisms of torsion systems; rational morphisms are local isogeny morphisms glued in the stack. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.KummerLisse.constant_free` | computation | The constant system (Z/p^n)^r realizes a free rank-r Z_p-local system. |
| `TauCeti.LogAdic.KummerLisse.constant_torsion` | non-example | The compatible constant Fp-system is permitted and is not free over Z_p. |
| `TauCeti.LogAdic.KummerLisse.zero` | degenerate | The zero system has rank zero and rationalizes to zero. |

**Uses.** DLLZ-adic Lemma 6.3.3: Completion transports these objects to the pro-Kummer site. DLLZ-RH §3.2: The rational stack is the input to log Riemann–Hilbert.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 6.3.1, p. 88.

### Completion of Kummer local systems

**Declaration:** `TauCeti.LogAdic.CompletedKummerLisse` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems`.

For a strict representative L=(L_n), L̂=lim_n ν⁻¹L_n is a lisse module over Ẑ_p=lim Z/p^n on X_prokét; rationalize by p. This is an equivalence with completed local systems, independent of strict representative, and R^i lim_n ν⁻¹L_n=0 for i>0 on the p-acyclic basis.

**Hypotheses.** X locally noetherian fs over Q_p; do not take an unrestricted inverse limit of arbitrary sheaves without acyclicity.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections`, `EnhancedDerivedSheaves:E2`.

**Proof architecture.**

1. Use the p-torsion-acyclic refinement of Proposition 5.3.13.
2. Apply derived inverse-limit vanishing to compatible local torsion representatives.
3. Check the completed local-system equivalence by reductions modulo p^n and descent.

**Acceptance.** The construction commutes with finite direct sums and rationalization.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.CompletedKummerLisse` | constructor | The inverse limit of ν⁻¹L_n over the completed coefficient ring. |
| `TauCeti.LogAdic.CompletedKummerLisse.mod_pn` | compatibility | For a strict system the nth reduction agrees with ν⁻¹L_n. |
| `TauCeti.LogAdic.CompletedKummerLisse.equivalence` | equivalence | Completion and reduction are quasi-inverse on the specified lisse categories. |
| `TauCeti.LogAdic.CompletedKummerLisse.map_comp` | functoriality | Completion preserves identity and composition of local-system morphisms. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.CompletedKummerLisse.constant` | computation | A constant finite-generated Z_p module L completes to L⊗Z_p Ẑ_p. |
| `TauCeti.LogAdic.CompletedKummerLisse.torsion` | compatibility | The constant Fp-system completes to the constant Fp-sheaf. |
| `TauCeti.LogAdic.CompletedKummerLisse.representative` | characterisation | Pro-isomorphic strict representatives give canonically isomorphic completed local systems. |

**Uses.** DLLZ-RH §2.2 and §3.2: L̂ tensors with periods before geometric/arithmetic pushforward.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 6.3.2 and Lemma 6.3.3, p. 88.

### Unipotent geometric boundary monodromy

**Declaration:** `TauCeti.LogAdic.BoundaryMonodromy` (definition). **Node:** `HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy`.

At a geometric boundary point ξ, use the Kummer fundamental group of the strict localization X(ξ), with its log geometric base point. A rational local system has unipotent (respectively quasi-unipotent) geometric monodromy if this inertia acts unipotently (respectively an open subgroup acts unipotently) on every stalk. On SNC charts this is the commuting Ẑ(1)^r action. It suffices to test smooth loci of boundary components.

**Hypotheses.** This is geometric inertia, not the whole arithmetic Galois group.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower`, `ClassicalAdicEtaleCohomology:H0`.

**Proof architecture.**

1. Use log geometric points and the finite Kummer fundamental group.
2. Define unipotence of commuting inertia actions on finite-dimensional stalks.
3. Apply Lemma 6.3.11 to reduce to generic smooth boundary components.

**Acceptance.** A finite nontrivial tame character is quasi-unipotent and is not unipotent.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.BoundaryMonodromy` | constructor | The geometric inertia action with its specified log geometric stalk. |
| `TauCeti.LogAdic.BoundaryMonodromy.logarithm` | data | For a unipotent generator, its finite logarithm is nilpotent; commuting generators give commuting logarithms. |
| `TauCeti.LogAdic.BoundaryMonodromy.smooth_locus` | characterisation | Unipotence/quasi-unipotence can be checked on the smooth part of each boundary component. |
| `TauCeti.LogAdic.BoundaryMonodromy.tensor` | compatibility | Tensor and dual of unipotent boundary local systems remain unipotent. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.BoundaryMonodromy.trivial` | degenerate | The constant local system has zero logarithm and unipotent inertia. |
| `TauCeti.LogAdic.BoundaryMonodromy.jordan` | computation | For U=[[1,1],[0,1]], log U=[[0,1],[0,0]] and its square is zero. |
| `TauCeti.LogAdic.BoundaryMonodromy.finite_character` | non-example | A rank-one nontrivial finite-order character has quasi-unipotent inertia but is not unipotent. |

**Uses.** DLLZ-RH Theorem 3.2.12: Controls tensor compatibility and nilpotent residues. AutomorphicBundles:B3.general: Canonical full-group coefficients have unipotent boundary monodromy.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 6.3.7, Example 6.3.8 and Lemma 6.3.11, pp. 89–90.

## Logarithmic comparison: `HodgeTateAndCanonicalSubgroups:T6:comparison`

### Toric character cohomology estimates

**Declaration:** `TauCeti.LogAdic.toric_kummer_cohomology` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology`.

For a sharp fs toric chart V over a characteristic-zero algebraically closed perfectoid field k containing all roots of unity and an Fp-local system L, H^i(V_két,L⊗O⁺/p) is almost zero for i>dim V; on a rational V′ strictly contained in V the restriction image in every degree is almost finitely generated over k⁺. For Γ=Hom(P^gp,Ẑ(1)), a primitive μ_m-character module has continuous cohomology killed by ζ_m−1.

**Hypotheses.** Strict containment means closure(V′)⊂V. For Lemma 6.1.7 the finite-presentation assertion requires its finite coefficient model.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity`, `PadicHodgeTheory:P8`, `ClassicalAdicEtaleCohomology:H0`.

**Proof architecture.**

1. Compute the all-root toric ring as a completed sum of character monomials.
2. Import the ordinary continuous-group Koszul calculation from early primitive comparison, then apply it to Γ and each character (Lemma 6.1.7).
3. Use strict rational restriction and finite coefficient descent to obtain Proposition 6.1.1.

**Acceptance.** A nontrivial character contributes only the prescribed almost torsion; the trivial character retains its exterior cohomology.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 6.1.1 and Lemma 6.1.7, pp. 81–84.

### Proper log almost finiteness

**Declaration:** `TauCeti.LogAdic.proper_log_almost_finiteness` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-almost-finiteness`.

For proper log smooth fs X over an algebraically closed characteristic-zero affinoid field (k,k⁺) and an Fp-local system L, H^i(X_két,L⊗O⁺/p) is almost finitely generated for all i≥0 and almost zero for i sufficiently large. The ideal of almost mathematics is the maximal ideal of k⁺. This is an integral almost statement, not finite generation or vanishing before almost localization.

**Hypotheses.** Properness and log smoothness are both required; arbitrary open affinoids are excluded.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections`, `PadicHodgeTheory:P8`, `ClassicalAdicEtaleCohomology:H0`.

**Proof architecture.**

1. Use the proper-cover refinement of Lemma 6.2.4 with toric charts and strictly smaller rational domains.
2. Apply the local estimates to the Čech spectral sequence.
3. Use the ordinary almost-finiteness descent argument from the early primitive supplier.

**Acceptance.** Proper smooth trivial-log spaces specialize to the ordinary primitive input.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 6.2.1(1) and Lemma 6.2.4, pp. 85–86.

### Logarithmic primitive comparison

**Declaration:** `TauCeti.LogAdic.log_primitive_comparison` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison`.

For proper log smooth fs X over Spa(k,k⁺), k algebraically closed of characteristic zero, and an Fp-local system L on X_két, the canonical map H^i(X_két,L)⊗Fp(k⁺/p)→H^i(X_két,L⊗Fp O⁺/p) is an almost isomorphism for every i≥0. Transport along ν gives the matching pro-Kummer formulation. Its properness hypothesis is retained by every finite-level application.

**Hypotheses.** DLLZ Theorem 6.2.1; no SNC assumption is needed for the comparison itself.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-almost-finiteness`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems`, `PadicHodgeTheory:P8`.

**Proof architecture.**

1. Pull L to the log perfectoid basis and apply almost acyclicity.
2. Combine proper almost finiteness with the integral primitive descent argument of Scholze 2013 §5, instantiated on the Kummer site.
3. Use Proposition 5.1.7 to compare Kummer and pro-Kummer cohomology.

**Acceptance.** For the constant Fp-sheaf on a geometric point the map is Fp⊗Fp k⁺/p≃k⁺/p. Empty boundary agrees with Scholze’s ordinary primitive theorem.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 6.2.1(2), p. 85.

**Atlas planet:** Logarithmic primitive comparison.

### Logarithmic cohomological finiteness and vanishing

**Declaration:** `TauCeti.LogAdic.log_cohomology_finite_vanishing` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-cohomology-finite-vanishing`.

Under the proper log smooth hypotheses of the primitive theorem, H^i(X_két,L) is finite-dimensional over Fp for each i and vanishes for sufficiently large i. If X is a smooth SNC compactification, it vanishes for i>2dim X. A smooth U Zariski open in a proper rigid space has the same finite-dimensionality and bound for each Fp-local system after a smooth SNC compactification obtained by characteristic-zero resolution.

**Hypotheses.** The 2dim bound is the SNC compactification case; neither it nor finiteness is asserted for arbitrary nonproper rigid spaces.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension`, `AdicSpacesPartII:R4`, `ClassicalAdicEtaleCohomology:H0`.

**Proof architecture.**

1. Deduce integral finite-dimensionality from primitive almost comparison and proper almost finiteness.
2. Use boundary extension and the SNC cohomological-dimension argument for the explicit bound.
3. For Corollary 6.2.3 import resolution/compactification of the ordinary analytic pair, then apply the preceding results.

**Acceptance.** The closed unit disc is a counterexample to finiteness without proper compactification, as Remark 6.2.2 states.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Consequences of Theorem 6.2.1, Corollary 6.2.3, pp. 85–86.

### Proper p-adic boundary cohomology

**Declaration:** `TauCeti.LogAdic.proper_padic_boundary_cohomology` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/proper-padic-boundary-cohomology`.

For a proper smooth SNC pair U⊂X over a characteristic-zero p-adic field and a lisse Z_p-system L on U, its Kummer extension L̄ has canonically isomorphic geometric étale, Kummer and completed pro-Kummer cohomology; these groups are finite Z_p-modules. The extension equivalence itself remains valid without properness. This is the proper version of the finiteness clause in the accessible Corollary 6.3.4, recorded in source issue E1.

**Hypotheses.** Proper X is explicitly added for finiteness; torsion Z_p local systems are permitted.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-cohomology-finite-vanishing`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension`, `EnhancedDerivedSheaves:E2`.

**Proof architecture.**

1. Extend each torsion reduction by Corollary 4.6.7.
2. Use finite Fp-cohomology and the derived-limit vanishing to pass to Z_p.
3. Compare the completed pro-Kummer system using Lemma 6.3.3.

**Acceptance.** Constant Fp on the nonproper closed disc is excluded from the finite-cohomology claim.

**Source.** [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.4, p. 88, corrected properness; compare Remark 6.2.2.

### Ordinary periods on the pro-Kummer site

**Declaration:** `TauCeti.LogAdic.LogConstantPeriods` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods`.

Apply the ordinary period-ring functors to the completed/tilted sheaves on X_prokét: A_inf=W(Ô^{♭+}), θ:A_inf→Ô⁺, B_inf=A_inf[1/p], θ_p:B_inf→Ô, B_dR⁺=completion of B_inf at ker(θ_p), and B_dR=B_dR⁺[1/t] after adjoining the usual cyclotomic t. Filtration and Tate-twisted graded pieces are as in P8. On log perfectoid objects use their associated perfectoid realizations, not a new definition of a period ring.

**Hypotheses.** For the pinned BDeRhamPlus carrier retain prime p, nonunit p and p-adic completeness; all sheaf/field conclusions come from the ordinary supplier plus the log perfectoid basis.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity`, `PadicHodgeTheory:P8:local-rational/period-sheaves-definitions`, `PadicHodgeTheory:P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves`, `mathlib:BDeRhamPlus`, `mathlib:fontaineThetaInvertP`.

**Proof architecture.**

1. Instantiate P8’s ordinary period sheaves using the completed log structural sheaves.
2. Use the strictification equivalence to transfer values and higher cohomology from ordinary perfectoid realizations.
3. Transport θ, filtration and cyclotomic t under these comparisons.

**Acceptance.** There is no new local period-ring definition to duplicate P8.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.LogConstantPeriods` | constructor | Instantiate the ordinary functors on the pro-Kummer completed sheaves. |
| `TauCeti.LogAdic.LogConstantPeriods.theta` | projection | The structural Fontaine map to Ô⁺ or Ô after the specified inversion. |
| `TauCeti.LogAdic.LogConstantPeriods.grade` | compatibility | gr^r B_dR≃Ô(r), respecting Tate twists. |
| `TauCeti.LogAdic.LogConstantPeriods.sections` | compatibility | On a log perfectoid basis object the sections agree with the period functor on its associated perfectoid pair. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.LogConstantPeriods.trivial_log` | compatibility | On trivial logs these are P8’s ordinary period sheaves. |
| `TauCeti.LogAdic.LogConstantPeriods.grade_zero` | computation | B_dR⁺/Fil¹≃Ô on the log perfectoid basis. |
| `TauCeti.LogAdic.LogConstantPeriods.not_integral_completion` | non-example | Completing the p-integral Witt ring at ker θ before inverting p is not the stated B_dR⁺ construction. |

**Uses.** DLLZ-RH Definition 2.2.10: The structural periods contain these constant coefficient periods. DLLZ-RH Lemma 3.6.1: Primitive comparison upgrades to B_dR⁺-cohomology.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 2.2.3 and Proposition 2.2.4, pp. 11–12.

### Positive structural logarithmic periods

**Declaration:** `TauCeti.LogAdic.StructuralLogPeriodPlus` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-plus`.

On U=lim_i Ui log affinoid perfectoid, set M_i=M(U_i), M=colim M_i and M♭=lim_p M. For r≥1 form S_{i,r} from the completed coefficient tensor Ri⊗̂_{W(κ)}(W(R^{♭+})/ξ^r), using the k-algebra Ri in which p is already invertible, adjoining the monoid M_i×_M M♭, and impose α_i(a′)=[α♭(a″)]e_a. Its θ_log maps e_a to 1. Complete at ker θ_log and take inverse limit in r, then colimit in i and sheafify; this defines OB_dR,log⁺ with Fil^j=(ker θ_log)^j.

**Hypotheses.** k is a p-adic field, the integral monoid lifts are compatible, and the source completed tensor topology is retained.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart`, `HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid`, `AdicSpacesPartII:R0`, `mathlib:AdicCompletion`.

**Proof architecture.**

1. Use the all-root chart for the fibre-product monoid and its structural relation.
2. Check θ_log respects the relations and the two completion indices.
3. Prove independence of pro-presentation and sheafify on the log-perfectoid basis.

**Acceptance.** Boundary coordinates remain visible through e_a; replacing them by ordinary tensor periods loses dlog terms.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.StructuralLogPeriodPlus` | constructor | The sheafification of the completed relation-ring colimit with θ_log and filtration. |
| `TauCeti.LogAdic.StructuralLogPeriodPlus.theta_generator` | simp | θ_log(e_a)=1 on each compatible log generator. |
| `TauCeti.LogAdic.StructuralLogPeriodPlus.structural_relation` | relation | α_i(a′)=[α♭(a″)]e_a in the completed structural ring. |
| `TauCeti.LogAdic.StructuralLogPeriodPlus.presentation_invariance` | equivalence | Cofinal pro-presentation changes induce canonical filtered isomorphisms. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.StructuralLogPeriodPlus.rank_zero` | compatibility | With no log coordinates it agrees with the positive ordinary structural period sheaf. |
| `TauCeti.LogAdic.StructuralLogPeriodPlus.theta` | computation | The quotient by Fil¹ is Ô. |
| `TauCeti.LogAdic.StructuralLogPeriodPlus.boundary_relation` | non-example | For a coordinate vanishing at the boundary, the equation T=[T♭]e_T is retained without dividing by T. |

**Uses.** DLLZ-RH §2.3: Completed monoid relations give the power-series coordinates. DLLZ-RH Corollary 2.4.2: Positive log Poincaré resolution starts with this sheaf.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equations (2.2.8)–(2.2.9) and Definition 2.2.10(1), pp. 12–13.

**Atlas planet:** Structural logarithmic periods.

### Filtered completion of structural periods

**Declaration:** `TauCeti.LogAdic.StructuralLogPeriod` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-complete`.

Localize OB_dR,log⁺ by t, with Fil^r=∑_{s≥−r}t^{-s}Fil^{r+s}OB_dR,log⁺, then complete each Fil^r against higher filtration quotients and take their union. The resulting OB_dR,log is filtration complete and OC_log=gr⁰OB_dR,log. In general it is larger than the plain localization OB_dR,log⁺[1/t], including in the trivial-log case.

**Hypotheses.** Use the additional completion in DLLZ-RH Definition 2.2.10(3); the filtration is not the t-adic filtration alone.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-plus`, `EnhancedDerivedSheaves:E2`.

**Proof architecture.**

1. Construct the localized convolution filtration.
2. Take the inverse limit over filtration quotients separately in each bounded filtration piece.
3. Glue the pieces and identify the degree-zero quotient and constant-period inclusion.

**Acceptance.** Trivial logs compare with the corrected completed ordinary structural periods, not the uncompleted older definition.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.StructuralLogPeriod` | constructor | The filtration-completed localization, with its filtration pieces and OC_log. |
| `TauCeti.LogAdic.StructuralLogPeriod.completion_map` | projection | The map from the plain localization into its filtration completion. |
| `TauCeti.LogAdic.StructuralLogPeriod.grade` | compatibility | Its associated graded agrees with that of the precompletion filtered ring. |
| `TauCeti.LogAdic.StructuralLogPeriod.complete_piece` | characterisation | Each Fil^r is the inverse limit of its Fil^r/Fil^{r+s} quotients. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.StructuralLogPeriod.zero_log` | compatibility | For trivial logs the additional ordinary filtration completion is still present. |
| `TauCeti.LogAdic.StructuralLogPeriod.cauchy_sum` | computation | In the local one-variable model with W=y/t, ∑_{n≥0}t^nW^{n²} converges in Fil⁰ for the coefficientwise t-adic completion. |
| `TauCeti.LogAdic.StructuralLogPeriod.localization_insufficient` | non-example | The same series has y^{n²}-coefficient t^{n−n²}, with unbounded negative t-valuations, and hence is not in B_dR⁺[[y]][1/t]; its inclusion requires the additional filtration completion. |

**Uses.** DLLZ-RH §2.3: The completed local model has t-adically convergent power-series coefficients in W. DLLZ-RH §3.2: RHlog uses the completed structural sheaf.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 2.2.10(2)–(3) and Remark 2.2.11, p. 13.

### Continuous structural log connection

**Declaration:** `TauCeti.LogAdic.StructuralLogConnection` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection`.

The structural period sheaves carry the unique B_dR⁺-linear continuous log connection extending d and δ with ∇e_a=e_aδ(a′). It extends through the positive and final filtration completions, is integrable, and satisfies ∇Fil^r⊂Fil^{r−1}⊗Ω¹_log. For y_j=log e_{a_j}, ∇y_j=dlog a_j; for W_j=y_j/t, ∇W_j=t⁻¹dlog a_j.

**Hypotheses.** The analytic log differential module is pulled back to X_prokét and finite locally free in the source log-smooth setting.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-complete`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-derivation`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham`.

**Proof architecture.**

1. Define ∇ on the relation ring and verify the structural relation is preserved.
2. Bound the filtration loss to extend to both completions.
3. Check curvature and transversality on coefficients and monoid generators.

**Acceptance.** The connection is not O_X-linear; it satisfies the log Leibniz rule.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.StructuralLogConnection` | constructor | The continuous coefficient-period-linear log connection on the structural period sheaf. |
| `TauCeti.LogAdic.StructuralLogConnection.generator` | simp | ∇e_a=e_aδ(a′). |
| `TauCeti.LogAdic.StructuralLogConnection.transverse` | compatibility | The connection lowers the decreasing filtration by at most one. |
| `TauCeti.LogAdic.StructuralLogConnection.integrable` | relation | Its coefficient log de Rham differential squares to zero. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.StructuralLogConnection.constants` | degenerate | The constant B_dR period subsheaf is horizontal. |
| `TauCeti.LogAdic.StructuralLogConnection.log_coordinate` | computation | ∇log(e_T)=dlog T, also on a boundary stratum. |
| `TauCeti.LogAdic.StructuralLogConnection.normalized_coordinate` | computation | ∇W_T=t⁻¹dlog T, so omitting the t⁻¹ would give the wrong filtered connection. |

**Uses.** DLLZ-RH Corollary 2.4.2: The connection gives the Poincaré resolution. DLLZ-RH §3.2: Tensoring L̂ transfers it to the RH bundle.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equations (2.2.13)–(2.2.17), pp. 13–14.

### Toric power-series description of log periods

**Declaration:** `TauCeti.LogAdic.toric_structural_period_model` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model`.

On a smooth toric chart and its all-root log perfectoid cover, OB_dR,log⁺≃B_dR⁺[[P−1]], and for a free chart of rank n this is B_dR⁺[[y₁,…,y_n]] with y_j=log e_{a_j}. The completed Fil^r OB_dR,log=t^rB_dR⁺{W₁,…,W_n}, W_j=y_j/t, with the source t-adic coefficient convergence. Its graded ring is Ô[t,t⁻¹,W₁,…,W_n] with W_j of filtration degree zero.

**Hypotheses.** Use DLLZ-RH §2.3’s strict smooth toric charts, chart rank and pulled-back boundary strata; do not identify formal and restricted power series.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower`, `AdicSpacesPartII:R0`.

**Proof architecture.**

1. Build the monoid-completion map and prove the relation-ring isomorphism in Lemmas 2.3.7–2.3.12.
2. Use logarithm coordinates to identify the positive completion.
3. Apply the additional filtration completion to obtain Proposition 2.3.15 and the graded description.

**Acceptance.** In one variable, the generator derivative is d/dy and preserves the logarithmic boundary coordinate.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 2.3.15 and Corollaries 2.3.17–2.3.20, pp. 18–20.

### Logarithmic period Poincaré lemma

**Declaration:** `TauCeti.LogAdic.log_poincare` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare`.

For X log smooth fs over a p-adic field, or the smooth boundary intersections with induced log structures allowed in Remark 2.4.1, the structural log de Rham complex resolves B_dR⁺ and B_dR. Fil^r B_dR→Fil^r OB_dR,log→Fil^{r−1} OB_dR,log⊗Ω¹_log→… is exact, including associated graded complexes. A log smooth relative map has the analogous relative resolution with the base structural period sheaf.

**Hypotheses.** Retain log smoothness or the specified induced-log stratum hypothesis; exactness is a sheaf assertion, not arbitrary global-section acyclicity.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis`, `EnhancedDerivedSheaves:E1`.

**Proof architecture.**

1. Use the toric model to contract the power-series de Rham complex in log coordinates.
2. Descend exactness from the log perfectoid basis and extend across permitted strata.
3. Take filtered pieces and associated graded; for the relative case keep only relative chart directions.

**Acceptance.** In rank zero the resolution is B_dR→OB_dR,log with no higher log-coordinate terms. The filtration of the qth term is r−q, not r.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollaries 2.4.2 and 2.4.6, pp. 20–21.

**Atlas planet:** Logarithmic Poincaré lemma.

### Logarithmic Faltings extension

**Declaration:** `TauCeti.LogAdic.log_faltings_extension` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-faltings-extension`.

For the same smooth/SNC log-smooth context, the degree-one positive graded piece sits in the canonical short exact sequence 0→Ô(1)→gr¹ OB_dR,log⁺→Ô⊗Ω¹_log→0. The quotient map comes from the log connection, and the extension retains the cyclotomic Tate twist on its left term.

**Hypotheses.** Use the log differential and positive filtration conventions of §2.2.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model`, `HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods`, `HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection`.

**Proof architecture.**

1. Take the first graded piece of the positive local power-series model.
2. Identify its constant-period kernel as gr¹B_dR⁺=Ô(1).
3. Glue the chartwise short exact sequences using connection functoriality.

**Acceptance.** Trivial logs recover the ordinary Faltings extension; a log coordinate contributes its dlog class.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 2.4.5, p. 21.

### Filtered period log connections and Higgs reduction

**Declaration:** `TauCeti.LogAdic.FilteredLogConnection` (definition). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/filtered-log-connection`.

On X_{B_dR}, a filtered log connection is a vector bundle with a B_dR-linear integrable log connection and decreasing locally free B_dR⁺-lattice filtration satisfying Griffiths transversality. A positive log t-connection obeys ∇⁺(fe)=t e⊗df+f∇⁺e. Its reduction modulo t is an O-linear log Higgs field valued in Ω¹_log(−1), with θ∧θ=0. Arithmetic filtered bundles instead use coherent filtrations over O_X.

**Hypotheses.** Coefficient scalar ring, continuity, integrability and filtration category are specified; a t-connection is not an ordinary connection modulo t.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham`, `HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-complete`, `CrystallineCohomology:CR.5/log-connection`, `EnhancedDerivedSheaves:E1`.

**Proof architecture.**

1. Instantiate the CR.5 log-connection notion on the period ringed analytic site.
2. Use Lemma 3.1.8 to exchange positive t-connections and lattice-filtered connections.
3. Use Lemma 3.1.9 to reduce modulo t and obtain the twisted Higgs field.

**Acceptance.** The graded differential is O-linear; its Tate twist is −1.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.FilteredLogConnection` | constructor | A coefficient-linear log connection with integrability and the indicated decreasing filtration. |
| `TauCeti.LogAdic.FilteredLogConnection.transversality` | relation | The qth differential maps Fil^{r−q} into Fil^{r−q−1}. |
| `TauCeti.LogAdic.FilteredLogConnection.t_connection` | equivalence | A positive lattice with log t-connection gives a period connection by t⁻¹∇⁺. |
| `TauCeti.LogAdic.FilteredLogConnection.higgs` | functoriality | Reduction of the t-connection modulo t is an integrable log Higgs field with the Tate twist. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.FilteredLogConnection.trivial` | degenerate | The trivial coefficient bundle has d and the standard scalar filtration. |
| `TauCeti.LogAdic.FilteredLogConnection.mod_t_linear` | computation | The term t e⊗df vanishes modulo t, so the reduced map is O-linear. |
| `TauCeti.LogAdic.FilteredLogConnection.not_unshifted` | non-example | The filtered de Rham qth term has Fil^{r−q}; an unshifted Fil^r in every degree does not encode transversality. |

**Uses.** DLLZ-RH Theorem 3.2.3: Describes the geometric RH target category. DLLZ-RH Theorem 3.2.4: Its degree-zero reduction gives the log Higgs functor.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definitions 3.1.1, 3.1.7 and Lemmas 3.1.8–3.1.9, pp. 22–24.

### Decompletion of logarithmic Kummer towers

**Declaration:** `TauCeti.LogAdic.log_tower_decompletion` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion`.

The cyclotomic coefficient and geometric Kummer towers satisfy the stable-decompletion statements in DLLZ-RH A.2.1.2 and A.2.2.3. Their B_dR⁺/ξ^r variants satisfy the decompletion-system statement A.2.3.4 for every r≥1; this last statement is not strengthened to stable decompletion. Finite projective semilinear modules admit good finite-stage models with the continuous-cohomology invariance used in §3.3 and its specified localizations and boundary quotients.

**Hypotheses.** Use Appendix A.2.1.2, A.2.2.3, A.2.3.4 hypotheses and good-model refinement; do not assert arbitrary tower decompletion.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower`, `HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model`, `PerfectoidSpaces:P3`, `ClassicalAdicEtaleCohomology:H0`.

**Proof architecture.**

1. Import the general Banach decompletion theorem through the P3 Part II request.
2. Verify the uniform strict-exactness estimates for the log toric and cyclotomic models in Appendix A.2.
3. Apply good-model existence and refine the finite stage simultaneously for each boundary/localization computation.

**Acceptance.** The finite model need not recover the full original module on the boundary before extracting the correct unipotent part.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Appendix A.1.2, A.1.10; Theorems A.2.1.2, A.2.2.3, A.2.3.4; application §3.3.

### Logarithmic OC pushforward and coherence

**Declaration:** `TauCeti.LogAdic.log_oc_pushforward` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward`.

For X smooth with SNC boundary over a p-adic field k, K the completion of an algebraic extension containing k_∞, µ′:X_prokét/X_K→X_an, and a Q_p-local system L, R^iµ′_*(L̂⊗OC_log)=0 for i>0 and the degree-zero sheaf is finite locally free of rank rk L. The analogous finite-projective computation on the allowed smooth boundary strata is compatible with rational and finite-étale pullback, without asserting that the naive boundary specialization of the finite model is an isomorphism.

**Hypotheses.** SNC and coefficient-field hypotheses of §3.2 and Proposition 3.3.3.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion`, `HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy`, `ClassicalAdicEtaleCohomology:H0`.

**Proof architecture.**

1. Use a good decompleted Γ-model, decompose its finite-order character parts and extract the unipotent summand.
2. Use the W-variable Koszul/logarithm contraction to compute Γ-invariants and vanishing higher cohomology (Lemma 3.3.15).
3. Glue with the local base-change compatibility of Lemma 3.3.16.

**Acceptance.** Keep the non-surjective boundary-model comparison of Remark 3.3.12 as a rejection test for an overly strong base-change claim.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 3.3.3, Lemmas 3.3.15–3.3.16 and Remarks 3.3.12–3.3.14, pp. 28–31.

### Geometric logarithmic Riemann–Hilbert

**Declaration:** `TauCeti.LogAdic.LogRH` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert`.

For k p-adic, K complete over an algebraic extension containing k_∞, and X smooth with SNC boundary, RH_log(L)=Rµ′_*(L̂⊗OB_dR,log) is concentrated in degree zero. It is an exact functor to Gal(K/k)-equivariant vector bundles on X_{B_dR} of rank rk L, with integrable log connection and locally free B_dR⁺-lattice filtration. The construction is not asserted to be tensor on all local systems.

**Hypotheses.** L is a finite-rank Q_p-local system on X_két; tensor compatibility is a separate unipotent theorem.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward`, `HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection`, `HodgeTateAndCanonicalSubgroups:T6:comparison/filtered-log-connection`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`.

**Proof architecture.**

1. Use OC pushforward acyclicity, successive filtration quotients and completeness to obtain locally free Fil^r.
2. Transport the structural period connection by projection formula.
3. Use its transversality/integrability and the degree-zero calculation to prove exactness.

**Acceptance.** Its rank equals that of L, without a de Rham assumption on L.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.LogRH` | constructor | The geometric derived pushforward, identified with a degree-zero filtered log bundle. |
| `TauCeti.LogAdic.LogRH.rank` | structure | The bundle has rank rk L. |
| `TauCeti.LogAdic.LogRH.grade` | compatibility | gr^r RH_log(L)=H_log(L)(r). |
| `TauCeti.LogAdic.LogRH.map_comp` | functoriality | Pushforward of coefficient maps preserves identities and composition. |
| `TauCeti.LogAdic.LogRH.trivial_log` | compatibility | Trivial-log specialization is the ordinary RH functor with the corrected filtration-completed structural periods. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.LogRH.constant` | computation | The constant rank-one local system gives the scalar period bundle with its standard connection. |
| `TauCeti.LogAdic.LogRH.zero` | degenerate | The zero local system gives the zero bundle. |
| `TauCeti.LogAdic.LogRH.fractional_residue` | non-example | A finite boundary character with normalized residue 2/3 has a tensor square with normalized residue 1/3; it cannot be modeled by an unrestricted tensor functor adding residues to 4/3. |

**Uses.** DLLZ-RH Theorem 5.3.1: Arithmetic descent and normalized boundary extension compare canonical coefficients. BP Proposition 4.4.38: Uses the canonical p-adic/de Rham association.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equation (3.2.2), Theorem 3.2.3(1), §3.3, pp. 25, 27–31.

**Atlas planet:** Logarithmic Riemann–Hilbert.

### Geometric logarithmic Higgs functor

**Declaration:** `TauCeti.LogAdic.LogHiggs` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor`.

H_log(L)=gr⁰ RH_log(L)=µ′_*(L̂⊗OC_log) is a Gal(K/k)-equivariant log Higgs bundle on X_K with field θ:H_log→H_log⊗Ω¹_log(−1), obtained from t∇ on Fil⁰ modulo t. Its coefficient log Higgs complex has degree q term H_log⊗Ω^q_log(−q).

**Hypotheses.** Same geometric base and SNC hypotheses as RH_log; use the −q twists in the complex.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert`, `HodgeTateAndCanonicalSubgroups:T6:comparison/filtered-log-connection`.

**Proof architecture.**

1. Reduce the positive lattice t-connection modulo t.
2. Use the OC degree-zero pushforward to identify the underlying vector bundle.
3. Check Higgs integrability by reducing the period connection curvature.

**Acceptance.** The Tate twist cannot be discarded when describing the Higgs field.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.LogHiggs` | constructor | Degree-zero reduction with its O-linear integrable log Higgs field. |
| `TauCeti.LogAdic.LogHiggs.underlying` | compatibility | Its underlying module is gr⁰ RH_log(L). |
| `TauCeti.LogAdic.LogHiggs.field` | projection | The field takes values in Ω¹_log(−1). |
| `TauCeti.LogAdic.LogHiggs.map_comp` | functoriality | The assignment preserves identity and composition of coefficient morphisms. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.LogHiggs.constant` | degenerate | The constant local system has zero log Higgs field. |
| `TauCeti.LogAdic.LogHiggs.twist` | compatibility | The qth Higgs-complex term carries Tate twist −q. |
| `TauCeti.LogAdic.LogHiggs.residue` | computation | For a unipotent rank-two boundary system its log Higgs residue is the corresponding nilpotent monodromy operator in the twisted differential direction. |

**Uses.** DLLZ-RH Theorem 3.2.7(3): Its proper cohomology gives the Hodge–Tate decomposition.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.4(1), pp. 25–26 and Lemma 3.1.9, p. 24.

### Regularity and normalized log extensions

**Declaration:** `TauCeti.LogAdic.log_regularity_and_extension` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension`.

On a smooth SNC pair, a torsion-free coherent sheaf with integrable log connection that is reflexive and has boundary residue eigenvalues in Q∩[0,1) is locally free. A horizontal morphism from a locally free normalized-residue extension to a torsion-free coherent normalized-residue extension, an isomorphism on the boundary complement, is an isomorphism everywhere. The analogous uniqueness holds for B_dR coefficient bundles.

**Hypotheses.** Retain reflexivity for the local-freeness result, the normalized residue interval, and the horizontal morphism.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log`, `AdicSpacesPartII:R3`.

**Proof architecture.**

1. Use the completed-stalk regular-singular argument of Proposition 3.4.16.
2. Pass to the bidual of the target to obtain local freeness.
3. Apply the residue normalization to rule out boundary elementary modifications, as in Proposition 3.4.17.

**Acceptance.** A boundary modification changing residue by an integer shows why the normalization interval matters.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Propositions 3.4.16–3.4.17, pp. 37–38.

### Rational normalized logarithmic residues

**Declaration:** `TauCeti.LogAdic.normalized_log_residues` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/normalized-log-residues`.

The residues of RH_log(L) and D_dR,log(L) along geometrically irreducible boundary components have eigenvalues in Q∩[0,1). The local period residue is t⁻¹log γ in the normalized decompleted module. Unipotent geometric boundary inertia makes these residues nilpotent; a finite character can give a nonzero rational residue.

**Hypotheses.** Use finite scalar extension if needed to make the specified boundary component geometrically irreducible.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy`, `HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion`.

**Proof architecture.**

1. Use log-tower decompletion and the local logarithm coordinates.
2. Apply the root-of-unity eigenvalue analysis in Lemmas 3.4.11–3.4.13.
3. Descend normalized eigenvalues and pass to arithmetic invariants.

**Acceptance.** Unipotent Jordan inertia produces zero residue eigenvalues, not necessarily a zero residue operator.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.3(2), Lemma 3.4.7 and Proposition 3.4.15, pp. 25, 35–37.

### Arithmetic logarithmic de Rham functor

**Declaration:** `TauCeti.LogAdic.ArithmeticLogDR` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham`.

For µ:X_prokét→X_an set D_dR,log(L)=µ_*(L̂⊗OB_dR,log). It is an O_X-vector bundle with integrable log connection and decreasing coherent filtration, with normalized rational residues. If L|_U is de Rham then gr D_dR,log(L) is locally free of total rank rk L. Without that hypothesis the de Rham rank need not equal rk L.

**Hypotheses.** The same p-adic field and smooth SNC pair as the geometric RH construction.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert`, `HodgeTateAndCanonicalSubgroups:T6:comparison/normalized-log-residues`, `HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension`, `PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf`, `ClassicalAdicEtaleCohomology:H0`, `AdicSpacesPartII:R3`.

**Proof architecture.**

1. Compute arithmetic Galois invariants of geometric RH and prove coherence and reflexivity (Lemmas 3.3.17–3.3.18).
2. Use normalized residues and the log regularity theorem to obtain local freeness.
3. For de Rham interior coefficients extend the ordinary comparison using normalized-extension uniqueness and deduce graded ranks.

**Acceptance.** Do not require de Rham input to define the functor or assert equal ranks for non-de Rham input.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.ArithmeticLogDR` | constructor | The arithmetic degree-zero pushforward with its induced connection and coherent filtration. |
| `TauCeti.LogAdic.ArithmeticLogDR.geometric_invariants` | characterisation | It is the arithmetic Galois-invariant sheaf of the geometric RH object. |
| `TauCeti.LogAdic.ArithmeticLogDR.de_rham_grade_rank` | compatibility | For de Rham interior input its total graded rank equals rk L. |
| `TauCeti.LogAdic.ArithmeticLogDR.map_comp` | functoriality | Coefficient maps induce horizontal filtered maps, preserving composition. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.ArithmeticLogDR.constant` | computation | For the trivial Q_p coefficient system, D_dR,log=O_X with d and its weight-zero filtration. |
| `TauCeti.LogAdic.ArithmeticLogDR.tate` | computation | For Q_p(m), the de Rham line has its filtration jump at −m under the fixed cyclotomic convention. |
| `TauCeti.LogAdic.ArithmeticLogDR.zero` | degenerate | The zero local system maps to the zero filtered bundle. |

**Uses.** DLLZ-RH Theorem 5.3.1: Canonical coefficients are identified with their standard filtered de Rham realizations.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equation (3.2.6), Theorem 3.2.7(1)–(2), pp. 26–27.

### Restricted logarithmic comparison under pullback

**Declaration:** `TauCeti.LogAdic.log_rh_pullback` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback`.

For h:(Y,E)→(X,D) between smooth SNC log pairs and a rational local system L, the natural maps h*RH_log(L)→RH_log(h⁻¹L), and the Higgs/arithmetic analogues, are injective and strictly filtered. They are isomorphisms if for every component W of E, ∑_Z m_WZ n_Z≤1, where n_Z=0 for unipotent boundary monodromy along Z and 1 otherwise. The pullback residue is ∑m_WZ h*Res_Z.

**Hypotheses.** Boundary multiplicities are those of h⁻¹D; no unrestricted ramified-pullback isomorphism is claimed.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham`, `HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor`, `HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham`.

**Proof architecture.**

1. Construct adjunction maps and prove injectivity on the dense interior.
2. Compute pullback residues in coordinates and check their eigenvalues stay in the normalized interval under the stated inequality.
3. Apply normalized-extension uniqueness to extend the interior isomorphism.

**Acceptance.** T=S² pulls a residue 2/3 to 4/3; normalization needs a boundary modification and the unrestricted isomorphism fails.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.3(4), Lemma 3.5.3 and Corollary 3.5.7, pp. 25, 39–40.

### Tensor comparison for unipotent boundary systems

**Declaration:** `TauCeti.LogAdic.unipotent_log_tensor` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor`.

RH_log and H_log restrict to tensor functors on rational local systems with unipotent geometric boundary monodromy; their log residues are nilpotent. D_dR,log is a tensor functor on the additional de Rham-interior subcategory. Tensor, dual and unit comparison maps are canonical and coherent. No such assertion is made for arbitrary rational boundary characters.

**Hypotheses.** Unipotence is geometric boundary unipotence as in Definition 6.3.7; D_dR also requires de Rham interior.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback`, `HodgeTateAndCanonicalSubgroups:T6:comparison/normalized-log-residues`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy`, `HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension`.

**Proof architecture.**

1. Use vanishing residue eigenvalues to identify zero-exponent normalized extensions.
2. Apply the interior ordinary tensor comparison and extend uniquely across D.
3. Verify coherence on the dense interior and hence on the whole pair.

**Acceptance.** Tensoring normalized residues 2/3 and 2/3 demonstrates why the unrestricted tensor statement is false.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.12 and its proof in §3.4, pp. 27, 38–39.

### Proper logarithmic period cohomology comparison

**Declaration:** `TauCeti.LogAdic.proper_log_period_cohomology` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-period-cohomology`.

For proper smooth SNC X/k, K=completed algebraic closure, and a lisse Z_p-system L, H^i(X_K,két,L)⊗Z_p B_dR canonically equals log de Rham hypercohomology of RH_log(L), equivariantly and with filtrations. The K-valued version equals log Higgs hypercohomology of H_log(L). If L|_U is de Rham, it equals H^i_log dR(X,D_dR,log(L))⊗k B_dR; its Hodge spectral sequence degenerates at E₁ and its degree-zero graded comparison is ⊕_{a+b=i}H^{a,b}_log Hodge(X,D_dR,log(L))⊗k K(−a).

**Hypotheses.** Proper X and de Rham interior only for the arithmetic/Hodge conclusions; general coefficients give the RH/Higgs statements.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/proper-padic-boundary-cohomology`, `HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare`, `HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham`, `HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor`, `HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison`, `AdicSpacesPartII:R3`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`.

**Proof architecture.**

1. Upgrade log primitive comparison to B_dR⁺ using finite Z_p-cohomology (Lemma 3.6.1).
2. Use log Poincaré and projection formula to compare RH/Higgs hypercohomology (Lemma 3.6.2).
3. For de Rham interior input use the normalized comparison and proper coherent base change, then compare total dimensions to prove E₁ degeneration.

**Acceptance.** The Tate twist is −a; the decomposition concerns coefficient log Hodge cohomology, not just ordinary differential-form cohomology.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorems 3.2.3(3), 3.2.4(2), 3.2.7(3), Lemmas 3.6.1–3.6.4, pp. 25–27, 41–42.

### Relative logarithmic de Rham comparison

**Declaration:** `TauCeti.LogAdic.relative_log_comparison` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/relative-log-comparison`.

For a proper log smooth f:(X,D)→(Y,E) between smooth SNC pairs over k, with interior f|_U:U→V proper smooth, and a lisse Z_p-system L de Rham on U, R^if_két,*L is a lisse Z_p-system de Rham on V. D_dR,log(R^if_*L) identifies with the O_Y-torsion-free quotient of relative log de Rham cohomology R^if_log dR,*D_dR,log(L), with Gauss–Manin connection and filtration.

**Hypotheses.** Both proper log smooth f and proper smooth interior restriction are required; retain the torsion-free quotient.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-period-cohomology`, `HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare`, `HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback`, `PadicHodgeTheory:P8/relative-de-rham-comparison`, `ClassicalAdicEtaleCohomology:H0`, `AdicSpacesPartII:R3`.

**Proof architecture.**

1. Use finite Kummer proper pushforward and ordinary relative comparison on U.
2. Apply relative log Poincaré and coherent pushforward to construct the comparison morphism.
3. Use normalized-extension uniqueness and discard the stated coherent torsion in Corollary 3.5.14.

**Acceptance.** A relative conclusion omitting the interior properness or the torsion-free quotient is rejected.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.7(5) and §3.5, pp. 26–27, 40–41.

### Canonical Gᶜ coefficients on the log site

**Declaration:** `TauCeti.LogAdic.CanonicalLogRealizations` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations`.

For a pure Shimura datum (G,X), the central split quotient Gᶜ, a neat level K and smooth toroidal fan Σ, import the canonical coefficient functors W↦W_p and W↦W_dR for algebraic representations of Gᶜ. Extend W_p from the interior to the Kummer site, then complete on the pro-Kummer site; its geometric boundary monodromy is unipotent. W_dR is the canonical filtered logarithmic extension with nilpotent residues. Full-group coefficients, not arbitrary Levi representations, carry these flat connections.

**Hypotheses.** Smooth/SNC toroidal charts after étale localization; canonical full-group coefficients and their existing tensor/Hecke functoriality come from AutomorphicBundles.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems`, `HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor`, `AutomorphicBundles:B2.general/general-flat-realizations`, `AutomorphicBundles:B3.general/general-logarithmic-comparison`, `ShimuraCompactifications:C2/smooth-normal-crossings`.

**Proof architecture.**

1. Import B2.general’s full-group flat realizations and B3.general’s canonical logarithmic extension.
2. Apply the boundary local-system equivalence to the p-adic coefficient system.
3. Complete and check tensor, dual and Hecke pullback compatibility on the unipotent coefficient subcategory.

**Acceptance.** No universal abelian scheme or motive for a general datum is introduced.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.CanonicalLogRealizations` | constructor | The imported coefficient functors instantiated on the toroidal Kummer/pro-Kummer ringed sites. |
| `TauCeti.LogAdic.CanonicalLogRealizations.etale_restriction` | compatibility | Restriction to the interior recovers the canonical p-adic local system. |
| `TauCeti.LogAdic.CanonicalLogRealizations.de_rham_extension` | compatibility | Its filtered log bundle is B3.general’s nilpotent-residue canonical extension. |
| `TauCeti.LogAdic.CanonicalLogRealizations.hecke` | functoriality | Pullbacks under finite-level Hecke maps agree with the coefficient representation action. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.CanonicalLogRealizations.unit` | degenerate | The trivial representation gives the constant Q_p sheaf and trivial filtered O bundle. |
| `TauCeti.LogAdic.CanonicalLogRealizations.siegel` | compatibility | In the Siegel case the standard representation is the semiabelian Tate/de Rham coefficient with its boundary extension. |
| `TauCeti.LogAdic.CanonicalLogRealizations.no_levi_connection` | non-example | An arbitrary Levi coefficient has an automorphic bundle but is not thereby assigned a full-group flat local system. |

**Uses.** DLLZ-RH Theorem 5.3.1: The comparison identifies these two canonical realizations. PerfectoidShimuraVarieties:S6: Imports these finite-level tensor-compatible coefficients.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Propositions 5.2.10 and 5.2.17, pp. 54–56; BP §4.4.38–Remark 4.4.39, pp. 79–80.

### Special-point normalization of canonical comparison

**Declaration:** `TauCeti.LogAdic.special_point_comparison` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison`.

For a special point h of a general pure Shimura datum, the standard Betti and p-adically reconstructed Betti coefficient systems have canonical equivariant trivializations over (G(Q)h)×G(A_f), identifying both with W and preserving the CM Hodge cocharacter. These special-point identifications normalize the general coefficient comparison and its reflex-field descent.

**Hypotheses.** Use the proven CM/abelian-motive realizations and absolute Hodge-tensor compatibility; this does not assert existence of motives for every general Shimura coefficient.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations`, `MotivesAndAlgebraicCycles:MC.7`, `ShimuraVarieties:V8.general`, `PadicHodgeTheory:P8/relative-de-rham-comparison`.

**Proof architecture.**

1. Factor h through a torus and express the special-point coefficient by its CM realizations.
2. Apply the imported potentially crystalline/absolute-Hodge compatibility and CM comparison.
3. Check G(Q)×G(A_f)-equivariance of the anchored fibre identifications.

**Acceptance.** Tensor identifications are normalized at special points rather than chosen up to an unspecified scalar.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 5.4.1 and its proof, pp. 57–59.

### Arithmetic recognition of the general canonical monodromy

**Declaration:** `TauCeti.LogAdic.canonical_arithmetic_monodromy` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-arithmetic-monodromy`.

On every connected component of a neat general Shimura variety, the monodromy of the p-adically reconstructed Betti coefficient extends to an algebraic representation of G^{der,c}_C equal to W_C restricted to that group. Reduce to Q-simple simply connected derived datum. In the real-rank≤1/type-A cases use the abelian-type reduction; in the remaining higher-rank non-type-A cases use superrigidity, congruence descent and Hecke compatibility, Borel density and the Piatetski-Shapiro embedding argument to identify every simple factor.

**Hypotheses.** Only the arithmetic-group instances permitted by DLLZ-RH §§5.4–5.6 are requested; generic superrigidity and congruence results are imported from an arithmetic roadmap addition.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `ShimuraVarieties:V8.general`, `PadicHodgeTheory:P8/relative-de-rham-comparison`.

**Proof architecture.**

1. Apply Lemmas 5.4.7–5.4.8 for finite-cover and simply connected reduction.
2. For abelian type, use faithful polarized abelian coefficients and Hodge tensors to reconstruct the coefficient tensor category (Proposition 5.5.9).
3. For the remaining case, apply the requested arithmetic rigidity inputs to extend monodromy, eliminate the Hecke discrepancy by Schur/Borel density (Lemma 5.6.5), and prove faithfulness on every factor using Lemma 5.6.7.

**Acceptance.** Recognition includes all derived simple factors; checking only the abelian-type subdatum is not the general proof.

**Source.** [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 5.4.5, Proposition 5.5.9, Theorem 5.6.1 and Lemmas 5.6.5–5.6.7, pp. 61–66.

### Canonical p-adic and de Rham association

**Declaration:** `TauCeti.LogAdic.canonical_log_period_comparison` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison`.

For every algebraic representation W of Gᶜ on a neat smooth toroidal compactification of a pure Shimura datum, there is a canonical filtered horizontal Hecke-equivariant isomorphism W_p⊗Q_p OB_dR,log≃W_dR⊗O_X OB_dR,log. It is an isomorphism of tensor functors, compatible with duals, change of level and maps of Shimura data, and descends compatibly with reflex-field canonical models. It identifies the nilpotent-residue boundary extensions, not just their interior restrictions.

**Hypotheses.** Use full-group canonical coefficients, their unipotent geometric boundary monodromy and the source canonical models.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-arithmetic-monodromy`, `HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison`, `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations`, `HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension`, `HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor`, `AutomorphicBundles:B3.general/general-boundary-functoriality`.

**Proof architecture.**

1. Recognize the reconstructed Betti monodromy and normalize its isomorphism on special points.
2. Apply Proposition 5.4.4 to recover the log connection, Hodge filtration and descent from this anchored Betti comparison.
3. Use normalized-extension uniqueness and the unipotent tensor theorem to extend all compatibilities across the toroidal boundary.

**Acceptance.** Siegel semiabelian comparison and the Hodge-type tensor construction are specializations, not substitutes for the general arithmetic-recognition step.

**Source.** [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), §4.4.38–Remark 4.4.39, p. 79; DLLZ-RH Theorem 5.3.1 and Proposition 5.4.4, pp. 56, 60.

**Atlas planet:** Canonical logarithmic comparison.

### The two de Rham lattices of a canonical coefficient

**Declaration:** `TauCeti.LogAdic.TwoDeRhamLattices` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/two-de-rham-lattices`.

Inside the common B_dR local system supplied by canonical association, take M=W_p⊗B_dR⁺ and M⁰=(W_dR⊗OB_dR,log⁺)^{∇=0}, with their scalar and de Rham-induced decreasing filtrations. Both are B_dR⁺ local systems/lattices with common localization; M/Fil¹M=W_p⊗Ô. Horizontal sections are taken before extracting the lattice filtration.

**Hypotheses.** Canonical associated unipotent/de Rham full-group coefficient; sheafwise lattices in the same localized module.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison`, `HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare`, `HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods`.

**Proof architecture.**

1. Use association to identify common B_dR localization.
2. Use positive log Poincaré to identify the horizontal second lattice.
3. Carry both filtrations into the common ambient space and compare the first lattice quotient with Ô.

**Acceptance.** The construction needs the relative position of two lattices; a single filtration of W_dR alone is insufficient.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.TwoDeRhamLattices` | constructor | The common localized module with M, M⁰ and their specified filtrations. |
| `TauCeti.LogAdic.TwoDeRhamLattices.common_localization` | compatibility | Inverting t identifies both lattice localizations with the association’s period local system. |
| `TauCeti.LogAdic.TwoDeRhamLattices.first_quotient` | projection | M/Fil¹M identifies with W_p⊗Ô. |
| `TauCeti.LogAdic.TwoDeRhamLattices.map` | functoriality | A morphism of canonical coefficient representations carries both lattices and filtrations compatibly. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.TwoDeRhamLattices.unit` | degenerate | For the trivial representation the two lattices agree with B_dR⁺. |
| `TauCeti.LogAdic.TwoDeRhamLattices.relative_position` | computation | For scalar rank-one lattices M=Ae and M⁰=tᵃAe in A[1/t]e, both localize to the same line and M/tM≃A/(t); the relative shift a is retained. |
| `TauCeti.LogAdic.TwoDeRhamLattices.horizontal_requirement` | non-example | The unrestricted module W_dR⊗OB_dR,log⁺ is not itself M⁰; its horizontal kernel is required. |

**Uses.** BP Remark 4.4.39: Intersection images in the first-lattice quotient define the ascending HT filtration.

**Source.** [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), §4.4.38–Remark 4.4.39, pp. 79–80.

### The lattice Hodge–Tate filtration

**Declaration:** `TauCeti.LogAdic.LatticeHTFiltration` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration`.

Define the ascending filtration F_{−j}(W_p⊗Ô)=(M∩Fil^jM⁰)/(Fil¹M∩Fil^jM⁰), equivalently the image of M∩Fil^jM⁰ in M/Fil¹M. It is locally split of the Hodge-cocharacter type. With BP’s negative filtration indexing, its j-labelled graded comparison is Gr_j(W_p⊗Ô)(j)≃Gr^j W_dR⊗Ô; record the convention by the displayed F_{−j} formula, rather than silently replacing the ascending filtration by the de Rham one.

**Hypotheses.** Two associated B_dR⁺ lattices from the canonical coefficient comparison; intersections and quotients are sheafwise.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/two-de-rham-lattices`, `HodgeTateAndCanonicalSubgroups:T1`, `HodgeTateAndCanonicalSubgroups:T2`.

**Proof architecture.**

1. Use intersection submodules in the common B_dR space and project to M/Fil¹M.
2. Compute the local elementary-divisor position to show local splitting and the cocharacter ranks.
3. Apply the period graded comparison to identify each graded component with the specified Tate twist.

**Acceptance.** Increasing the ascending index enlarges F. For scalar t-adic filtration and a rank-one second lattice M⁰=t^aM, the ascending filtration jumps at a; translating this to named Tate weights requires the imported T1 convention.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.LatticeHTFiltration` | constructor | The image filtration with F_{−j}=image(M∩Fil^jM⁰→M/Fil¹M). |
| `TauCeti.LogAdic.LatticeHTFiltration.mem` | characterisation | A quotient class lies in F_{−j} iff it has a lift belonging to M∩Fil^jM⁰. |
| `TauCeti.LogAdic.LatticeHTFiltration.mono` | structure | The image filtration is increasing in the HT index because Fil^jM⁰ is decreasing. |
| `TauCeti.LogAdic.LatticeHTFiltration.grade` | compatibility | With the displayed BP indexing, its graded identification has the Tate twist (j). |
| `TauCeti.LogAdic.LatticeHTFiltration.map` | functoriality | Compatible maps of the two filtered lattices induce filtered quotient maps. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.LatticeHTFiltration.weight_zero` | degenerate | For a weight-zero line, F_i=0 for i<0 and F_i is the full line for i≥0. |
| `TauCeti.LogAdic.LatticeHTFiltration.lattice_shift` | computation | For scalar t-adic filtration and M⁰=t^aM in rank one, F_i is zero for i<a and the full quotient for i≥a. |
| `TauCeti.LogAdic.LatticeHTFiltration.correct_denominator` | characterisation | The quotient kernel at −j is Fil¹M∩Fil^jM⁰, not all of Fil¹M when that is not contained in Fil^jM⁰. |

**Uses.** PerfectoidShimuraVarieties:S6: Imports the finite-level flag before trivializing the p-adic torsor on its tower. BP Remark 4.4.39: The filtration defines P_HT and the Levi reduction.

**Source.** [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), Remark 4.4.39, pp. 79–80.

**Atlas planet:** Lattice Hodge–Tate filtration.

### Tensor and Hecke compatibility of the finite-level HT flag

**Declaration:** `TauCeti.LogAdic.canonical_ht_tensor` (theorem). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor`.

For canonical full-group Gᶜ coefficients the lattice HT filtration is compatible with tensor products, duals, the unit representation and finite-level Hecke pullbacks. The ascending tensor filtration is the image of ∑_{a+b=i}F_a⊗F_b; dual weights have opposite sign. It defines the prescribed P_µᶜ reduction of the completed p-adic coefficient torsor.

**Hypotheses.** Use canonical unipotent tensor association; this is not a tensor theorem for arbitrary log local systems.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration`, `HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor`, `HodgeTateAndCanonicalSubgroups:T2`, `AutomorphicBundles:B2/coefficient-tensor-hecke`.

**Proof architecture.**

1. Use the tensor-compatible association to compare the two filtered lattice systems.
2. Check the lattice image filtration in locally split cocharacter coordinates.
3. Apply the imported Tannakian flag extraction and verify Hecke naturality.

**Acceptance.** Tate lines of weights m,n tensor to the line of weight m+n.

**Source.** [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), Remark 4.4.39, p. 80.

### Finite-level cyclotomic Levi-torsor comparison

**Declaration:** `TauCeti.LogAdic.FiniteLeviComparison` (construction). **Node:** `HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor`.

From the de Rham P_µ^{std,c} and HT P_µᶜ reductions form their common Levi M_µᶜ torsors M_dR^an and M_HT^an. The canonical finite-level identification is M_HT^an≃M_dR^an×^{µ,Z_p×}Z_p(1) on the appropriate pulled-back pro-étale/pro-Kummer site, compatibly with Hecke action. A cyclotomic twist of M_HT is defined on the étale site. An untwisted equality requires an explicit cyclotomic trivialization.

**Hypotheses.** The central cocharacter µ acts on the common Levi; the de Rham and HT parabolic conventions are distinguished.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor`, `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison`, `HodgeTateAndCanonicalSubgroups:T2`, `AutomorphicBundles:B0/hodge-parabolic-convention`, `AutomorphicBundles:B3.general/general-canonical-extension`.

**Proof architecture.**

1. Import canonical de Rham torsor and flag conventions from AutomorphicBundles.
2. Reconstruct the HT torsor from the tensor-compatible finite-level flag.
3. Use the graded comparison to identify the two Levi fibre functors up to the central cyclotomic contracted product; check descent and Hecke coherence.

**Acceptance.** The result exported to S6 includes the central cyclotomic twist; it does not construct the tower map.

**API.**

| Name | Role | Mathematical contract |
| --- | --- | --- |
| `TauCeti.LogAdic.FiniteLeviComparison` | constructor | The finite-level comparison of Levi torsors with the µ-contracted cyclotomic torsor. |
| `TauCeti.LogAdic.FiniteLeviComparison.central_twist` | characterisation | The twisting action is through the central cocharacter µ:Z_p×→M_µᶜ. |
| `TauCeti.LogAdic.FiniteLeviComparison.hecke` | functoriality | The comparison commutes with finite-level Hecke pullbacks. |
| `TauCeti.LogAdic.FiniteLeviComparison.trivialization` | compatibility | Choosing a compatible generator of Z_p(1) identifies the contracted product with M_dR; changing that generator acts through µ. |

**Discriminating examples.**

| Test | Kind | Required result |
| --- | --- | --- |
| `TauCeti.LogAdic.FiniteLeviComparison.weight_zero` | degenerate | For central weight zero the cyclotomic twist is trivial. |
| `TauCeti.LogAdic.FiniteLeviComparison.weight_one` | computation | On a central weight-one character the contracted product is the associated Tate line, not an untwisted line with the same Galois action. |
| `TauCeti.LogAdic.FiniteLeviComparison.change_generator` | characterisation | Replacing a cyclotomic generator by u times it changes the trivialized comparison by µ(u); there is no generator-independent untwisted equality. |

**Uses.** PerfectoidShimuraVarieties:S6; BP Theorem 4.4.40: The tower trivialization pulls back this finite-level Levi comparison, including its twist.

**Source.** [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), Remark 4.4.39, p. 80; cyclotomic explanation in Remark 4.4.10.

## Finite-level exports: `HodgeTateAndCanonicalSubgroups:T6`

### Finite-level general canonical comparison package

**Declaration:** `TauCeti.LogAdic.finite_level_canonical_package` (application). **Node:** `HodgeTateAndCanonicalSubgroups:T6/finite-level-canonical-package`.

For every neat pure Shimura datum and smooth toroidal model, the canonical Gᶜ coefficient tensor functors are associated through completed logarithmic periods. They yield an ascending Hodge–Tate flag and the cyclotomic Levi comparison at finite level. Export the full package to PerfectoidShimuraVarieties:S6, which owns the general toroidal-tower diamond Hodge–Tate map and coefficient pullback (BP Theorem 4.4.40). Export only early log-site geometry to PrismaticCohomology:PR.8 and log primitive comparison separately to completed/coherent cohomology consumers.

**Hypotheses.** This application is the narrowed T6 aggregate; it assumes no general-datum toroidal diamond is a perfectoid space.

**Dependencies.** `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison`, `HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor`, `HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor`, `HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison`.

**Proof architecture.**

1. Assemble the canonical association, flag tensor compatibility and finite Levi comparison.
2. Name the S6 interface with the central twist and the smooth/SNC hypotheses preserved.
3. Keep the site-only and primitive-comparison exports independent of the late canonical arithmetic argument.

**Acceptance.** S6 imports the finite-level package; there is no reverse prerequisite S6→T6.

**Source.** [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), §4.4.38–Remark 4.4.39, pp. 79–80; Theorem 4.4.40 ownership boundary.

## Closure obligations

Every target has a mathematical card and a prerequisite chain. The following inputs are still requests or documented gaps; consequently no stage is marked closed.

### Early ordinary primitive owner is not yet a stage

The requested PadicHodgeTheory:P8 early primitive export is absent from the current P7/P8 packet. Adopt the proposed early split before adding consumer edges. A late full P8 dependency would create a CP.3 cycle. This is a supplier gap, not an unowned logarithmic theorem.

Affected nodes: `toric-kummer-cohomology`, `log-primitive-comparison`.

### Analytic normalization and SNC compactification inputs

The precise finite normal analytic extension across an SNC boundary and characteristic-zero resolution/compactification are not identified as exact supplier nodes. R0/R3/R4 requests specify them; no claim that ordinary curve compactification supplies arbitrary-dimensional resolution.

Affected nodes: `rigid-abhyankar`, `log-cohomology-finite-vanishing`.

### General Banach decompletion input

PerfectoidSpaces:P3 supplies almost purity but not DLLZ-RH Appendix A’s stably decompleting systems theorem. A Part II supplier addition is required; the T6 logarithmic tower instances remain local nodes.

Affected nodes: `log-tower-decompletion`.

### Arithmetic-group rigidity and congruence instances

ALS.1’s existing local systems do not establish Borel density, Margulis superrigidity or the non-type-A congruence subgroup theorem used in §5.6. The exact groups and hypotheses must be closed by an arithmetic Part II supplier; this packet does not equate an owner label with a proof.

Affected nodes: `canonical-arithmetic-monodromy`.

### CM special-point comparison inputs

MC.7’s proven-case scope is appropriate but no node supplies the full Blasius/CM potentially crystalline tensor package in DLLZ-RH Proposition 5.4.1. Request precisely that proven input, not hypothetical general Shimura motives.

Affected nodes: `special-point-comparison`.

### Shimura rigidity embeddings and descent

The exact pair of Piatetski-Shapiro embeddings in DLLZ-RH Lemma 5.6.7 and their simple-factor nontriviality, plus special-point descent conventions, need V8.general supplier closure. Mere existence of special points is insufficient.

Affected nodes: `canonical-arithmetic-monodromy`, `special-point-comparison`.

### Generic derived and continuous cohomology interfaces

The exact H0/E1/E2 exports for filtered-colimit cohomology, continuous Γ-cohomology, inverse-limit vanishing and log-site hypercohomology must be reconciled. The local geometric proofs do not replace the generic homological machinery.

Affected nodes: `log-site-projections`, `completed-kummer-local-systems`, `proper-log-period-cohomology`.

### Published-source collation of author-copy finiteness clause

Springer DOI 10.1007/978-3-031-21550-6_3 served only subscription preview on 2026-10-07. E1 is scoped strictly to the hashed author copy; collate Corollary 6.3.4 with the published chapter before asserting a version-of-record error. The proper theorem used here is supported independently by 6.2.1.

Affected nodes: `proper-padic-boundary-cohomology`.

### Supplier-dependent suggested geometric signatures

The pinned libraries lack a bundled log adic carrier, Kummer/pro-Kummer sites, completed analytic tensor sheaves and canonical Shimura coefficient interfaces. The suggested file uses concrete chart, continuous-derivation, supplied-site, adic-completion, connection, lattice and central-twist representation algebra where available, and explicitly marks supplier-dependent geometric signature omissions. No arbitrary Prop field or assumed conclusion substitutes for a missing construction. Full geometric theorem formalization needs these suppliers; elaboration alone does not close this gap.

Affected nodes: `log-adic-space`, `integral-adic-chart`, `divisorial-analytic-log`, `saturated-adic-products`, `log-smooth-chart-criterion`, `continuous-log-derivation`, `continuous-log-differentials`, `log-differential-descent`, `analytic-log-de-rham`, `kummer-etale-morphism`, `kummer-root-covers`, `kummer-ramification-index`, `kummer-etale-site`, `kummer-coherent-acyclicity`, `finite-kummer-descent`, `rigid-abhyankar`, `boundary-local-system-extension`, `pro-kummer-presentations`, `corrected-pro-kummer-covers`, `pro-kummer-etale-site`, `log-site-projections`, `all-root-toric-tower`, `log-affinoid-perfectoid`, `log-perfectoid-basis`, `completed-structural-log-sheaves`, `log-perfectoid-almost-acyclicity`, `kummer-padic-local-systems`, `completed-kummer-local-systems`, `geometric-boundary-monodromy`, `toric-kummer-cohomology`, `proper-log-almost-finiteness`, `log-primitive-comparison`, `log-cohomology-finite-vanishing`, `proper-padic-boundary-cohomology`, `constant-log-periods`, `structural-log-period-plus`, `structural-log-period-complete`, `structural-period-connection`, `toric-structural-period-model`, `log-poincare`, `log-faltings-extension`, `filtered-log-connection`, `log-tower-decompletion`, `log-oc-pushforward`, `log-riemann-hilbert`, `log-higgs-functor`, `log-regularity-and-extension`, `normalized-log-residues`, `arithmetic-log-de-rham`, `log-rh-pullback`, `unipotent-log-tensor`, `proper-log-period-cohomology`, `relative-log-comparison`, `canonical-pro-kummer-realizations`, `special-point-comparison`, `canonical-arithmetic-monodromy`, `canonical-log-period-comparison`, `two-de-rham-lattices`, `lattice-hodge-tate-filtration`, `canonical-ht-tensor`, `finite-levi-torsor`, `finite-level-canonical-package`.

## Source correction with version scope

**HodgeTateAndCanonicalSubgroups/E1**, Author copy log-adic.pdf, Corollary 6.3.4, p. 88; compare Remark 6.2.2, p. 85. Published chapter not collated.

The printed finiteness clause needs proper X. The hypotheses are those of Theorem 4.6.1 (smooth SNC pair), not properness. Definition 6.3.1 allows torsion Z_p-systems. For the nonproper closed unit disc with empty boundary and the constant Fp-system, Remark 6.2.2 explicitly states H¹(D,Fp) is infinite. The printed proof invokes 6.2.1, which requires proper X.

Require X proper for the finiteness assertion. Keep the local-system extension equivalence without that extra hypothesis; do not silently infer nonproper cohomological finiteness. No public correction was located in the author/arXiv history, publisher preview or repository errata records checked on 7 October 2026. The published chapter body was not available for collation, so this finding concerns only the hashed author copy.

## Acceptance of the part

Check the integral-image chart condition, all-integer chart divisibility and transfinite covering convention before using a site. Verify the primitive theorem only with properness and the period localization only with its additional filtration completion. Test the residue/pullback and tensor claims on nonunipotent rank-one characters, and the lattice quotient on rank-one relative positions. Verify the general canonical coefficient comparison through its special-point and arithmetic-recognition inputs. Preserve the cyclotomic central twist at the Levi step and sole S6 ownership of the infinite toroidal map.
