# Cohomology comparisons: integral diagrams and rational period realizations

This roadmap constructs a library of comparison maps for actual geometric cohomology. Its objects are the formal model, the named special fibres, the geometric adic generic fibre and their cohomology complexes, together with the scalar maps that relate them. Its central outputs are the integral specialization diagram, the canonical infinitesimal B_dR⁺ deformation, crystalline and semistable period comparisons, geometric torsion bounds and lattice recovery, and the product, trace and Chern-class compatibilities needed by arithmetic consumers. A dimension equality does not replace a comparison map. An arbitrary free lattice inside rational étale cohomology does not replace the canonical deformation.

The accepted RS-01 restructuring is binding. CP.0 keeps the geometric dictionary, coefficient-map normalization and compatibility of the shared diagrams; AI.0 constructs the integral Fontaine coefficients, CR.0 constructs the crystalline PD coefficients, and R06.1 constructs the rational periods. CP.5 keeps the geometric torsion bounds, lattice-recovery applications and counterexamples; generic A_inf module and complex algebra belongs to AI.5, and BKF classification belongs to AI.2. The correct statements from the preceding checkpoint are retained. Ten former generic nodes are preserved as supplier records and import aliases rather than reintroduced as declarations owned by CP. The residue-section theorem is preserved under CR.3, which supplies it before AI.5. This prevents a proof of the A_inf input package from depending on the rational comparison that the package is meant to prove.

This is a complete **target-level planning pass**, with every stage CP.0–CP.6 planned. Every declaration remains unchecked. No stage is closed: the explicit gaps and source-qualified supplier requests below remain required work. The distinction matters. A planned target has its mathematical statement, direct dependencies and proof route, including the place where an input is still missing. A closed target would additionally have all those inputs and no remaining refinements. The packet and its suggested file make no formalization claim.

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The reviewed library audit has no CohomologyComparisons entry. The fourteen declarations cited by the packet were checked in their pinned source files. WittVector and fontaineTheta supply concrete algebraic ingredients; BDeRhamPlus supplies a kernel-adic completion with a commutative ring structure, while BDeRham supplies a localization. The pin does not prove the needed field or DVR theorems. AdicCompletion is the actual compatible inverse limit of quotients, and its completeness theorem requires a finitely generated ideal. Module.length is an extended-natural length, whereas finrank is a natural-number rank and needs the appropriate finite-dimensional hypotheses to serve as dimension. Ordinary tensors and the classical derived category do not provide an enhanced filtered stable category or derived completed E∞ tensor. Those missing generic interfaces are supplied by their owners, not defined ad hoc in CP.

Use C for a complete algebraically closed extension of Q_p, O_C for its ring of integers and k for its residue field. Use K for a complete discretely valued subfield with perfect residue field k₀ when a G_K action is claimed. The formal model 𝔛, its base change to O_C, its reduction over O_C/p, its residue scheme over k and its geometric analytic generic fibre X_C remain different objects. In particular O_C/p is not k. A comparison over C has no G_K action until descent data are given. Arithmetic and geometric Frobenius, linear versus semilinear realization and the choice of geometric point are recorded in the normalization layer.

The period conventions are decreasing filtration, HT(χ_p)=+1 and Q_p(1) with action χ_p. The element t=log[ε] satisfies φ(t)=pt. The BMS Breuil–Kisin twists on differential forms are retained before rationalization. The map θ̃ is θφ⁻¹, not θ, and Witt reduction sends ξ to p rather than zero. A source changing the prism from ker θ to ker θ̃ is transported through Frobenius. There is no natural section C→B_dR⁺. The canonical deformation is built from embedding envelopes and their refinement maps; it is not defined by tensoring a C-vector space with B_dR⁺ along an invented section.

The layers are listed in their atlas order. This is not their complete dependency order: the filtered part of CP.2 uses CP.3, while CP.3's construction uses integral and local inputs without CP.2. AI.6 supplies the semistable A_inf maps and lattice functor; CP.3 does not depend on those later semistable conclusions. R06.5–R06.6 consume the geometric results. Scholze's primitive finiteness/almost comparison needs an early owner cut independent of the later P8 proper comparison, and the two routed red-team proposals disagree about its order relative to the local-rational cut. That disagreement is recorded as a scope task, not hidden by adding a circular late-stage dependency.

Pan's logarithmic and infinite-level coefficient adapters have actual parent CP.6 in this packet, while their realization records also name the routed CP.0/CP.3 extension. T6:comparison constructs the logarithmic period sheaf after the ordinary CP.3 comparison. Keeping the adapters after it avoids a return edge into that same CP.3 core. The proposed CP.6:log-truncated substage makes that late extension explicit. CP never reconstructs the logarithmic structural sheaf, connection, Poincaré lemma or Faltings extension that the corrected Pan route assigns to T6.

<a id="cp-0"></a>

## CP.0. Common objects, coefficient maps and normalization

The coefficient adapter receives named ring homomorphisms and checks their composites. Its tests distinguish θ from Witt reduction and compare the direct period map with the PD route on each element. The geometry adapter receives completion, analytification and site pullback from the formal/étale owners. This layer must preserve the maps induced on cohomology, rather than identifying different geometric objects by notation. Its normalization is consumed by the integral diagram, Kisin lattice recovery, twists in the Chern comparison and the Habiro specialization interface.

<a id="ainf-specialization-dictionary"></a>

### Normalized specialization diagram

Library declaration: `SpecializationDictionary` (definition).

For C complete algebraically closed over Q_p, assemble the imported maps of A=W(O_C^♭): θ:A→O_C, θ̃=θ∘φ⁻¹, w:A→W(k), A→A_cris→B_dR⁺, and A[1/μ]→B_cris→B_dR. The adapter records their actual composites, ξ=μ/φ⁻¹(μ), ξ̃=φ(ξ), ker θ=(ξ), ker θ̃=(ξ̃), θ(μ)=0, w(ξ)=p and w(μ)=0. It identifies the composite A→A_cris→B_dR⁺ with the canonical completion map. These are relations among imported objects, not constructions of the coefficient rings.

Construction and proof. Use AI.0:integral for θ, φ, ξ, μ and reduction; use CR.0 and R06.1 for PD and rational maps. Check w(ξ)=p by reducing ε to 1 in the geometric sum for ξ; θ(ξ)=0 uses the primitive p-th root relation. Check every square on Teichmüller coordinates before scalar extension.

Uses. CP.1 integral squares: Pins the scalar map and the Frobenius pullback of each comparison. BMS1 Theorems 14.5–14.6: Distinguishes the Witt specialization from θ when recovering lattices.

The API serves those uses:

- `SpecializationDictionary.thetaTilde_apply` (simp): For a∈A, θ̃(a)=θ(φ⁻¹(a)).
- `SpecializationDictionary.period_composite` (compatibility): The map A→B_dR⁺ is the composite A→A_cris→B_dR⁺.
- `SpecializationDictionary.theta_xi` (simp): θ(ξ)=0.
- `SpecializationDictionary.witt_xi` (simp): w(ξ)=p.
- `SpecializationDictionary.witt_mu` (simp): w(μ)=0.

The discriminating unit tests are:

- `SpecializationDictionary.test_theta` (computation): The θ-specialization sends the specified ξ to 0.
- `SpecializationDictionary.test_witt` (non-example): If p is nonzero in W(k), Witt specialization sends ξ to a nonzero element; replacing it by θ violates the dictionary.
- `SpecializationDictionary.test_composite` (compatibility): On every a∈A, the direct B_dR⁺ specialization equals the value through A_cris.

Direct prerequisites: `AInfCohomology:AI.0:integral`, `CrystallineCohomology:CR.0`, `PadicHodgeTheory:R06.1`, `mathlib:WittVector.fontaineTheta`, `mathlib:BDeRhamPlus`.

Acceptance. θ and Witt reduction send ξ to different values, respectively 0 and p; they cannot be conflated.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Example 3.16, pp.25–26; Definition 3.22, p.27; §4.3, p.40.

<a id="formal-algebraic-analytic-dictionary"></a>

### Formal and analytic cohomology dictionary

Library declaration: `CP0.formal_algebraic_analytic_dictionary` (theorem).

For a proper smooth O_K-scheme X₀, let 𝔛₀ be its p-adic completion, 𝔛=𝔛₀⊗̂O_C, Y=𝔛_{O_C/p}, X_k its residue scheme, and X_C the geometric adic generic fibre. Identify algebraic and analytic étale cohomology of the proper generic fibre, algebraic and continuous formal de Rham cohomology, and the special-fibre crystalline objects through the imported GAGA/completion equivalences. Keep Spec O_C/p distinct from Spec k; the former is not the residue field. Geometric points and pullback morphisms are retained in each identification.

Construction and proof. Compose formal completion and analytification from H1/H5, and proper cohomological GAGA. Record the induced maps of ringed sites; this is the geometric adapter, not a new formal model construction.

Direct prerequisites: `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`, `ClassicalAdicEtaleCohomology:H5`, `CrystallineCohomology:CR.3`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 1.1 and Remarks 1.2–1.3, pp.2–4; §13.4, p.116.

Required refinements: [Missing geometric and enhanced Lean interfaces](#G-lean-types).

<a id="site-and-geometric-point-compatibility"></a>

### Compatible geometric fibres and sites

Library declaration: `CP0.site_and_geometric_point_compatibility` (theorem).

The morphisms from the generic analytic pro-étale to étale site, the formal scheme to its special fibres, and the logarithmic to ordinary generic fibre induce the prescribed derived pullbacks and pushforwards. For X descended from K, choose compatible geometric points over K̄→C so that G_K acts on the same geometric cohomology object. Use the corrected pro-étale covers of Scholze’s erratum; no discarded classification of topological points is an input.

Construction and proof. Use the supplier site morphisms and functoriality of derived global sections. Corrected covers give the needed acyclic perfectoid basis; do not invoke the deleted Scholze Propositions 3.8 or 3.13.

Direct prerequisites: `AdicEtaleGeometry:A1`, `ClassicalAdicEtaleCohomology:H5`, `CrystallineCohomology:CR.5`.

Acceptance. Changing the embedding K̄→C conjugates the action and comparison, rather than producing unrelated representations.

Source: [Peter Scholze, Erratum to p-adic Hodge theory for rigid-analytic varieties](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeErratum.pdf), Erratum (1)–(3), pp.1–2.

<a id="twist-frobenius-filtration-normalization"></a>

### Twists, Frobenius and filtration conventions

Library declaration: `CP0.twist_frobenius_filtration_normalization` (theorem).

Use HT(χ_p)=+1, Q_p(1) with G_K action χ_p, t=log[ε] and φ(t)=pt. The filtration is decreasing, Fil^r B_dR=t^r B_dR⁺; Hodge–Tate forms use the Breuil–Kisin twist {−j}, not an unnormalized Tate twist over O_C. The semilinear φ on a module is displayed as φ* M→M. The BMS/Kisin map S=W(k)[[u]]→A_inf sends u↦[π^♭]^p and restricts to Witt Frobenius; S→W(k) sends u↦0 and is also Frobenius on W(k).

Construction and proof. Read BMS1 Example 4.24 and §4.4 with the coefficient adapter. R06.4 and R07.3 supply the convention translations; test the trivial representation and Q_p(1).

Direct prerequisites: [CohomologyComparisons:CP.0/ainf-specialization-dictionary](#ainf-specialization-dictionary), `AInfCohomology:AI.2`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`, `PadicHodgeTheory:R06.4`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Example 4.24, p.40; §4.4, pp.43–44; introduction p.4.

<a id="no-c-section-and-choice-transport"></a>

### Coefficient choices and transport

Library declaration: `CP0.no_c_section_and_choice_transport` (theorem).

No natural section C→B_dR⁺ is used. For a discretely valued subfield K⊂C the continuous lift K→B_dR⁺ is canonical; a lift of a smooth spreading-out algebra A over K is a proof choice, whose resulting cohomology is compared by embedding-system quasi-isomorphisms. The residue-field section k→O_C/p in rational crystalline base change is separately recorded, with independence only in the cases stated by BMS1 Remark 13.22.

Construction and proof. Use the distinction between Lemma 13.11, Theorem 13.19 and Remark 13.20. Transport two choices through the common embedding; do not choose a splitting of θ on C.

Direct prerequisites: [CohomologyComparisons:CP.0/ainf-specialization-dictionary](#ainf-specialization-dictionary), `PadicHodgeTheory:R06.1`.

Acceptance. The point X=Spa(C) has B_dR⁺ cohomology without a chosen embedding C→B_dR⁺.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemmas 13.11–13.13, pp.108–110; Remark 13.20, p.114; Remark 13.22, p.116.

Coverage: **planned**. Every target has a node or a preserved supplier interface at target granularity. Planned is a completed planning pass, not proof closure.

Before closure: Missing geometric and enhanced Lean interfaces.

<a id="cp-1"></a>

## CP.1. The integral derived comparison diagram

The diagram is instantiated on the actual proper smooth formal O_C scheme and its AΩ global complex. Derived tensor and derived completion survive in every statement in which Tor or inverse limits occur. The coefficient operation determines the geometric object: θ is de Rham, θ̃ is Hodge–Tate with a BK twist, Witt reduction is special-fibre crystalline, A_cris is the PD-base comparison over O_C/p, and μ-inversion is generic-fibre étale. Prismatic crystalline/de Rham comparisons use the appropriate Frobenius pullback; ordinary Hodge–Tate reduction has a different normalization. The smooth multiplicative maps are imported with their Bockstein coherence. A separate boundary node prevents their unqualified extension to singular or nonflat animated inputs.

<a id="proper-ainf-input-package"></a>

### Proper smooth A_inf input package

Library declaration: `CP1.proper_ainf_input_package` (application).

For a proper smooth p-adic formal O_C-scheme 𝔛, import the actual K_A=RΓ(𝔛,AΩ_𝔛), its perfectness, and the BKF structures on H^i(K_A). H^i(K_A) is finitely presented and becomes finite free after inverting p. Its derived specializations are complexes attached to 𝔛 and its named generic and special fibres; arbitrary perfect complexes with these ranks do not substitute for this geometric input.

Construction and proof. AI.4–AI.5 own BMS1 Theorems 14.1 and 14.3. Keep this as an interface adapter and cite those exact supplier requirements, then use the coefficient maps from CP.0.

Direct prerequisites: `AInfCohomology:AI.4`, `AInfCohomology:AI.5`, [CohomologyComparisons:CP.0/ainf-specialization-dictionary](#ainf-specialization-dictionary).

Acceptance. The structure morphism 𝔛=Spf O_C gives A_inf in degree zero.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorems 14.1 and 14.3, pp.118–120.

Required refinements: [Early absolute and relative primitive comparison owner](#G-primitive), [Missing geometric and enhanced Lean interfaces](#G-lean-types).

<a id="theta-de-rham-specialization"></a>

### Integral de Rham specialization

Library declaration: `CP1.theta_de_rham_specialization` (theorem).

For 𝔛 as above, the θ-base change K_A⊗^L_{A_inf,θ}O_C is canonically quasi-isomorphic to RΓ(𝔛,Ω^{•,cont}_{𝔛/O_C}), multiplicatively in the smooth BMS1 setting. The right side uses continuous differential forms; use derived tensor even when individual cohomology has torsion.

Construction and proof. Apply BMS1 Theorem 14.1(ii) on sheaves, then proper global comparison from AI.5. The ring map is θ, not θ̃.

Direct prerequisites: [CohomologyComparisons:CP.1/proper-ainf-input-package](#proper-ainf-input-package), [CohomologyComparisons:CP.0/ainf-specialization-dictionary](#ainf-specialization-dictionary), `AInfCohomology:AI.4`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 14.1(ii), p.118; Theorem 14.3(ii), p.119.

<a id="hodge-tate-specialization"></a>

### Hodge–Tate specialization and Bockstein

Library declaration: `CP1.hodge_tate_specialization` (theorem).

The θ̃-base change of AΩ has cohomology Ω^j_{𝔛/O_C}{−j}; its Bockstein differential is the de Rham differential under the correctly twisted comparison. Preserve the cup product and the degree-j Breuil–Kisin twist. This is not the same reduction as θ-de Rham and is not automatically a split complex of untwisted forms.

Construction and proof. Import AI.4’s Hodge–Tate comparison and AI.1’s Bockstein/Lη compatibility. Check dlog on torus coordinates; globalize the sheaf comparison.

Direct prerequisites: `AInfCohomology:AI.4`, `AInfCohomology:AI.1`, [CohomologyComparisons:CP.0/ainf-specialization-dictionary](#ainf-specialization-dictionary).

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 1.8; §9; Theorem 14.1 proof, pp.118–119.

<a id="witt-crystalline-specialization"></a>

### Derived Witt crystalline specialization

Library declaration: `CP1.witt_crystalline_specialization` (theorem).

The derived p-completed base change K_A⊗̂^L_{A_inf}W(k) identifies with RΓ_crys(𝔛_k/W(k)); locally AΩ⊗̂^L W(k) is WΩ^•. The Witt reduction has ξ↦p, and Frobenius is the de Rham–Witt/crystalline Frobenius. No ordinary tensor of H^i is claimed without Tor control in the next degree.

Construction and proof. Use AI.4 Theorem 14.1(i), CR.4’s de Rham–Witt computation and AI.5 properness. Keep the derived completion in the local statement and the supplier perfectness in the global one.

Direct prerequisites: [CohomologyComparisons:CP.1/proper-ainf-input-package](#proper-ainf-input-package), [CohomologyComparisons:CP.0/ainf-specialization-dictionary](#ainf-specialization-dictionary), `CrystallineCohomology:CR.4`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 14.1(i), p.118; Theorem 14.3(i), p.119.

<a id="acris-specialization"></a>

### Integral A_cris specialization

Library declaration: `CP1.acris_specialization` (theorem).

For Y=𝔛_{O_C/p}, K_A⊗̂^L A_cris≃RΓ_crys(Y/A_cris). In the proper setting use the precise completed/ordinary tensor simplification supplied by perfectness, never a general assertion that derived completion is unnecessary. This comparison is φ-compatible and smooth BMS1 multiplicative.

Construction and proof. Import AI.4’s explicit all-coordinate PD comparison and CR.2’s PD de Rham calculation; globalize using AI.5. Retain the coefficient map through A_cris.

Direct prerequisites: [CohomologyComparisons:CP.1/proper-ainf-input-package](#proper-ainf-input-package), `AInfCohomology:AI.4`, `CrystallineCohomology:CR.2`, `CrystallineCohomology:CR.0`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 12.1, p.96; Theorem 14.3(iii), p.119.

<a id="mu-inverted-etale-specialization"></a>

### Étale specialization after μ inversion

Library declaration: `CP1.mu_inverted_etale_specialization` (theorem).

K_A[1/μ]≃RΓ_ét(X_C,Z_p)⊗^L_{Z_p}A_inf[1/μ] for the proper smooth formal scheme, functorially with φ and products. The same statement is not asserted for every qcqs nonproper formal scheme. Scalar extension to W(C^♭) is degreewise flat, and μ is a unit there.

Construction and proof. AI.5 supplies BMS1 Theorem 14.3(iv). Use AI.0’s coefficient flatness; modulo p, ε−1 is nonzero in the field C^♭, hence μ is a Witt unit.

Direct prerequisites: [CohomologyComparisons:CP.1/proper-ainf-input-package](#proper-ainf-input-package), `AInfCohomology:AI.0:integral`, `AInfCohomology:AI.0:period-comparison`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 14.3(iv), p.119; Lemma 4.26, p.41.

<a id="prismatic-frobenius-pullback-comparison"></a>

### Prismatic Frobenius pullback

Library declaration: `CP1.prismatic_frobenius_pullback_comparison` (theorem).

For the bounded prism (A_inf,ker θ), identify φ*RΓ_Δ(𝔛/(A_inf,ker θ)) with K_A with its specified Frobenius and scalar maps. Track whether a source uses ker θ̃ and transport by φ rather than silently replacing the prism. The crystalline, de Rham and étale specializations of this map agree with the BMS maps under the qualified uniqueness theorem of BS22 §18. More precisely BS22 Notation 18.1 assumes a perfect prism (A,I), R=A/I, the category Sm_R of p-completely smooth R-algebras, a symmetric monoidal G:Sm_R→D_(p,I)-comp(A), and a symmetric monoidal natural transformation η:id→G⊗^L_A R. Theorem 18.2 says End(Δ_{−/A})={1} in that category; it is not uniqueness among arbitrary group isomorphisms or all maps without η. Frobenius compatibility need not be imposed separately in that uniqueness statement.

Construction and proof. PR.6 owns the prismatic comparison construction. Use its φ-pullback statement and BS22 §18’s functorial hypotheses on the smooth site; equality of diagrams requires equality of natural transformations, not equality of dimensions.

Direct prerequisites: `PrismaticCohomology:PR.6`, [CohomologyComparisons:CP.1/proper-ainf-input-package](#proper-ainf-input-package), [CohomologyComparisons:CP.0/ainf-specialization-dictionary](#ainf-specialization-dictionary).

Acceptance. On a framed torus the coordinate q-derivative and the specified φ-twist agree.

Source: [Bhargav Bhatt, Peter Scholze, Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229), Theorem 17.2; Notation 18.1, Theorem 18.2 and Lemma 18.3, pp.119–123.

<a id="crystalline-de-rham-overlap-square"></a>

### Crystalline–de Rham overlap square

Library declaration: `CP1.crystalline_de_rham_overlap_square` (theorem).

Base change the A_cris comparison along θ:A_cris→O_C. Its composite with crystalline–de Rham reduction is the θ-de Rham specialization of K_A. In the W(k) specialization, crystalline reduction to k is the Frobenius-normalized base change of the de Rham complex, not the θ̃ Hodge–Tate object.

Construction and proof. Write the two maps on the all-coordinate PD polynomial presentation and compare dlog generators. Apply CR.2 and the AI.4 explicit comparison, then descend; BS22 uniqueness is used only with its stated naturality hypotheses.

Direct prerequisites: [CohomologyComparisons:CP.1/acris-specialization](#acris-specialization), [CohomologyComparisons:CP.1/theta-de-rham-specialization](#theta-de-rham-specialization), [CohomologyComparisons:CP.1/witt-crystalline-specialization](#witt-crystalline-specialization), `CrystallineCohomology:CR.2`, `PrismaticCohomology:PR.6`.

Acceptance. The point diagram is the actual ring triangle. The torus test compares differentials, not merely cohomology ranks.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 14.1 proof, pp.118–119; §12.2.

<a id="multiplicative-bockstein-coherence"></a>

### Multiplication and Bockstein coherence

Library declaration: `CP1.multiplicative_bockstein_coherence` (theorem).

For smooth BMS1 comparison maps, retain the multiplication, Frobenius and Bockstein structures through the derived diagram. Iterated scalar extension gives coherent associativity squares on the complexes. Semistable analogues require their own source-qualified multiplicativity input and are not inferred from the smooth theorem.

Construction and proof. Apply the multiplicative sheaf comparisons of Theorem 14.1 and the Lη/Bockstein API from AI.1. E4 supplies associativity and completion comparisons. Record the missing enhancement if an E∞ assertion is stronger than the source.

Direct prerequisites: `AInfCohomology:AI.1`, `EnhancedDerivedSheaves:E4`, [CohomologyComparisons:CP.1/crystalline-de-rham-overlap-square](#crystalline-de-rham-overlap-square).

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 14.1 opening and proof, pp.118–119.

<a id="singular-and-completed-boundary"></a>

### Derived tensor and completion boundary

Library declaration: `CP1.singular_and_completed_boundary` (application).

The diagram for singular, semiperfectoid or nonproper objects is imported only with the owner’s actual derived-complete construction and its finiteness hypotheses. For smooth proper 𝔛 the preceding nodes give the entire target. A general replacement by H^i(K_A)⊗S can fail because Tor from H^{i+1} contributes; animated prismatic extensions require PR.5/PR.6 and E4, not the ordinary DerivedCategory alone.

Construction and proof. Use the exact sequence for a non-zero-divisor from AI.5 and E4’s derived completion. State the broader target as the supplier-qualified specialization interface, with an explicit gap for the singular geometric comparison.

Direct prerequisites: `EnhancedDerivedSheaves:E4`, `PrismaticCohomology:PR.5`, `PrismaticCohomology:PR.6`, `AInfCohomology:AI.5`.

Acceptance. A complex with nonzero next-degree p-torsion produces a Tor term; the plan must not erase it.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemma 4.16, p.38; Theorems 14.1–14.3.

Coverage: **planned**. Every target has a node or a preserved supplier interface at target granularity. Planned is a completed planning pass, not proof closure.

Before closure: Early absolute and relative primitive comparison owner; Missing geometric and enhanced Lean interfaces.

<a id="cp-2"></a>

## CP.2. Rational crystalline comparison and descent

The rational comparison first compares the O_C/p crystalline object over A_cris with generic étale cohomology. Descent to an O_K model then uses the exact rational residue-section base change, whose proof includes the smooth affine Frobenius-isogeny statement. The final map has G_K and φ equivariance and its filtration is checked through the independently constructed de Rham comparison. Passing to individual cohomology uses flat rational scalar extension and the actual perfect complex. The period-invariant theorem is R06.2's input to the geometric crystallinity consequence; it cannot reconstruct an integral lattice by itself. The ordinary and supersingular elliptic tests distinguish Frobenius structures with the same total dimensions.

<a id="rational-crystalline-comparison-over-C"></a>

### Rational A_crys/B_crys comparison over O_C (BMS1 Theorem 14.5(i))

Library declaration: `CP2.rational_crystalline_comparison_over_C` (theorem).

Let X be proper smooth formal over O = O_C with generic fibre X and i ≥ 0. There is a canonical isomorphism H^i_crys(X_{O/p}/A_crys) ⊗_{A_crys} B_crys ≅ H^i_ét(X,Z_p) ⊗_{Z_p} B_crys. It is compatible with the isomorphism H^i_crys(X/B_dR^+) ⊗_{B_dR^+} B_dR ≅ H^i_ét(X,Z_p) ⊗ B_dR of Theorem 13.1 via the identification H^i_crys(X_{O/p}/A_crys) ⊗_{A_crys} B_dR^+ ≅ H^i_crys(X/B_dR^+).

The stated hypotheses are X proper and smooth formal over O_C; C complete algebraically closed over Q_p (Remark 14.2: for Theorem 14.1, C perfectoid with all p-power roots of unity suffices).; Input (AInfCohomology:AI.5, Theorem 14.3): RΓ_Ainf(X) ⊗^L A_crys ≃ RΓ_crys(X_{O/p}/A_crys) and RΓ_Ainf(X) ⊗ A_inf[1/μ] ≃ RΓ_ét(X,Z_p) ⊗ A_inf[1/μ]; all H^j_Ainf(X)[1/p] free.; Normalization: A_inf → B_crys factors through A_inf[1/μ] because B_crys := A_crys[1/μ] (Definition 3.22(ii)); confirmed in the public source, so this is no longer a gap.

Construction and proof. Source: 'The isomorphism in part (i) follows from Theorem 14.1' — base change the two derived comparisons of Theorem 14.3(iii),(iv) to B_crys. Passage to cohomology groups (reconstructed, following CP.2's instruction to use perfectness and rational flatness): B_crys = A_crys[1/μ] (Definition 3.22(ii)) is a localization of A_crys, hence A_crys-flat, so H^i(RΓ_crys(X_{O/p}/A_crys) ⊗^L_{A_crys} B_crys) = H^i_crys ⊗_{A_crys} B_crys; B_crys is Z_p-torsion-free, hence Z_p-flat, so the étale side is H^i_ét ⊗ B_crys; and H^i(RΓ_Ainf(X) ⊗^L B_crys) = H^i_Ainf(X) ⊗ B_crys because the H^j_Ainf(X)[1/p] are free (a complex over A_inf[1/p] with free cohomology is formal). Compatibility with the B_dR^+-lattice: the source says it 'amounts to the compatibility between the isomorphisms of Theorem 12.1 and Theorem 13.1, which one checks on the level of the explicit complexes'. The identification H^i_crys(X_{O/p}/A_crys) ⊗ B_dR^+ ≅ H^i_crys(X/B_dR^+) comes from Proposition 13.23 (a natural quasi-isomorphism built from the explicit complexes of §12.2, confirmed in the public source), but the agreement of the two comparison isomorphisms is not displayed; see the CP.3 node and the corresponding gap.

Direct prerequisites: [CohomologyComparisons:CP.1/acris-specialization](#acris-specialization), [CohomologyComparisons:CP.1/mu-inverted-etale-specialization](#mu-inverted-etale-specialization), [CohomologyComparisons:CP.3/good-reduction-bdr-lattice-identification](#good-reduction-bdr-lattice-identification), `CrystallineCohomology:CR.3`, `mathlib:TensorProduct`.

Acceptance. Multiplicativity: the comparisons of Theorem 14.1 are compatible with multiplicative structures; φ acts on RΓ_Ainf(X) (Theorem 14.3), but Theorem 14.5(i) itself asserts no Frobenius compatibility and the O_C statement carries no Galois action — a Frobenius test here is a packet-authored target, not a source claim. Elliptic curve with good reduction over O_C, ordinary and supersingular; the trivial case X = Spf O_C.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 14.5(i), pp.120–121.

Required refinements: [Rational affine crystalline invariance proof](#G-affine-crystalline).

<a id="crystalline-comparison-over-discretely-valued-base"></a>

### Crystalline comparison and crystallinity of H^i_ét(X_C,Q_p) (BMS1 Theorem 14.6(i))

Library declaration: `CP2.crystalline_comparison_over_discretely_valued_base` (theorem).

Let X be proper smooth formal over O_K, K complete discretely valued over Q_p with perfect residue field k, C a completed algebraic closure with Galois group G_K, X_C the geometric rigid-analytic generic fibre, i ≥ 0. There is a comparison isomorphism H^i_ét(X_C,Z_p) ⊗_{Z_p} B_crys ≅ H^i_crys(X_k/W(k)) ⊗_{W(k)} B_crys compatible with the G_K- and Frobenius actions and with the filtration; in particular H^i_ét(X_C,Q_p) is a crystalline G_K-representation.

The stated hypotheses are X proper smooth formal over O_K; K/Q_p complete discretely valued, k perfect.; Inputs: Theorem 14.5(i) for X_{O_C}; Proposition 13.21 with the canonical section k → O_K/p → O_C/p; Theorem 13.1 and its agreement with Theorem 5.1 (Scholze: H^i_ét(X_C,Z_p) ⊗ B_dR ≅ H^i_dR(X/K) ⊗_K B_dR) under Remark 13.20, for the filtration.

Construction and proof. Theorem 14.5(i) for X_{O_C}: H^i_crys(X_{O_C/p}/A_crys) ⊗ B_crys ≅ H^i_ét(X_C,Z_p) ⊗ B_crys. Proposition 13.21 with the canonical section: H^i_crys(X_{O_C/p}/A_crys)[1/p] ≅ H^i_crys(X_k/W(k)) ⊗_{W(k)} A_crys[1/p]; tensor to B_crys. Map-level G_K and φ compatibility: the AI.4 all-coordinate maps are equivariant for automorphisms of O_C and their Witt Frobenius; CR.3 residue-section descent is transported through the same maps. The canonical discrete-base map is invariant. Checking the exact supplier naturality statements is an open interface, not a claim based on canonicity alone. Filtration: the isomorphism H^i_crys(X_C/B_dR^+) ⊗ B_dR ≅ H^i_ét(X_C,Z_p) ⊗ B_dR of Theorem 13.1 is compatible with Theorem 5.1's H^i_dR(X) ⊗_K B_dR ≅ H^i_ét(X_C,Z_p) ⊗ B_dR; together with the B_dR^+-lattice compatibility in Theorem 14.5(i) this identifies the Hodge filtration. The source does not say which filtration is meant on H^i_crys(X_k/W(k)) ⊗ B_crys; composing Proposition 13.21 (canonical section), Proposition 13.23 and Remark 13.20 gives H^i_crys(X_k/W(k)) ⊗_{W(k)} B_dR^+ ≅ H^i_dR(X/K) ⊗_K B_dR^+ (packet-authored composite), which carries the Hodge filtration. Crystallinity (reconstructed; the source only says 'In particular'): taking G_K-invariants of the G_K-equivariant B_crys-linear isomorphism, with G_K acting trivially on H^i_crys(X_k/W(k)), gives D_crys(H^i_ét(X_C,Q_p)) = H^i_crys(X_k/W(k))[1/p] ⊗ B_crys^{G_K} = H^i_crys(X_k/W(k))[1/p] using B_crys^{G_K} = W(k)[1/p]; equality of dimensions then gives crystallinity by the period-functor formalism (PadicHodgeTheory R06.2).

Direct prerequisites: [CohomologyComparisons:CP.2/rational-crystalline-comparison-over-C](#rational-crystalline-comparison-over-C), [CohomologyComparisons:CP.2/residue-section-descent-adapter](#residue-section-descent-adapter), [CohomologyComparisons:CP.3/descended-de-rham-lattice](#descended-de-rham-lattice), [CohomologyComparisons:CP.3/filtered-de-rham-comparison](#filtered-de-rham-comparison), `PadicHodgeTheory:R06.2`.

Acceptance. Good-reduction elliptic curve E: D_crys(H^1_ét(E_C,Q_p)) = H^1_crys(E_k/W(k))[1/p] with its Frobenius (H^1_ét(E_C,Q_p) is the Q_p-dual of V_pE; keep the duality explicit); ordinary versus supersingular slopes. Frobenius compatibility must be checked with one normalization (arithmetic Frobenius on W(k), φ on A_crys) fixed in CP.0. The proof accepts a proper smooth formal model without a projective presentation. A separate nonprojective example computation requires a supplied formal model; no projective weak-Lefschetz hypothesis may enter this comparison proof.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 14.6(i), pp.121–122.

Required refinements: [Explicit map and homotopy agreement](#G-map-agreement).

<a id="residue-section-descent-adapter"></a>

### Residue-section descent adapter

Library declaration: `CP2.residue_section_descent_adapter` (application).

Given the CR.3 rational base change of BMS1 Proposition 13.21, compose H_crys^i(Y/A_cris)[1/p]≃H_crys^i(X_k/W(k))⊗A_cris[1/p] with the B_cris comparison. In a discretely valued descent the map is normalized by the W(k)→O_K inclusion after the sufficiently small nilpotent reduction; record k versus its algebraic closure and every extension W(k)→W(k̄). A general choice of section does not disappear from the result.

Construction and proof. Import Proposition 13.21 from CR.3 before AI.5 (avoids a cycle). For ramification e choose m with p^m≥e; O_K→O_C/p^{1/p^m} factors through k, fixing the transported map. Apply perfect-residue extension base change.

Direct prerequisites: `CrystallineCohomology:CR.3`, `CrystallineCohomology:CR.3:Frobenius-isogeny`, [CohomologyComparisons:CP.0/ainf-specialization-dictionary](#ainf-specialization-dictionary).

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Proposition 13.21 and Remark 13.22, p.116; Theorem 14.6 proof, p.122.

Required refinements: [Rational affine crystalline invariance proof](#G-affine-crystalline).

<a id="rational-degreewise-comparison"></a>

### From derived to rational cohomology

Library declaration: `CP2.rational_degreewise_comparison` (theorem).

For the proper perfect K_A with H^j(K_A)[1/p] free, the rational base-change comparisons induce the stated degreewise B_cris isomorphisms. A_cris→B_cris is localization at μ, and B_cris is Z_p-flat; ordinary group tensors on these sides are justified separately. No integral equality H^i(K_A⊗^L W(k))=H^i(K_A)⊗W(k) follows from this rational argument.

Construction and proof. Use AI.5 rational freeness and degeneration of the Tor spectral sequence over A_inf[1/p]; use flat localization on the crystalline side. Retain the actual map so filtered compatibility survives.

Direct prerequisites: `AInfCohomology:AI.5`, [CohomologyComparisons:CP.1/proper-ainf-input-package](#proper-ainf-input-package), [CohomologyComparisons:CP.1/acris-specialization](#acris-specialization), `mathlib:DerivedCategory`, `mathlib:TensorProduct`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorems 14.3–14.5, pp.119–121.

<a id="period-invariants-and-admissibility"></a>

### Crystalline representation export

Library declaration: `CP2.period_invariants_and_admissibility` (application).

For 𝔛₀/O_K proper smooth, V=H_ét^i(X_C,Q_p) is crystalline and D_cris(V) identifies φ-equivariantly with H_crys^i(X_k/W(k))[1/p]. Its K-linear filtered realization is H_dR^i(X_K/K). This consequence uses B_cris^{G_K}=K₀ and the dimension criterion from R06.2; it does not construct the period functor again.

Construction and proof. Apply the G_K-equivariant comparison, take invariants using R06.1, and check dimensions by CR.3 finiteness. Transport the Hodge filtration through CP.3. Weak admissibility is supplied by the representation theorem under these hypotheses.

Direct prerequisites: [CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base](#crystalline-comparison-over-discretely-valued-base), `PadicHodgeTheory:R06.1`, `PadicHodgeTheory:R06.2`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 14.6(i), p.121.

<a id="crystalline-geometric-examples"></a>

### Good reduction examples

Library declaration: `CP2.crystalline_geometric_examples` (application).

For an ordinary good-reduction elliptic curve, D_cris H^1 has Newton slopes 0,1; for a supersingular elliptic curve it has slopes 1/2,1/2, while both have de Rham Hodge numbers 1,1. The comparison identifies these supplied crystalline computations with the Galois period modules. It also applies to a proper smooth formal model with nonprojective generic fibre; projectivity is absent from BMS1 Theorem 14.6.

Construction and proof. Import the elliptic crystalline computations from CR.4/CR.7 and the elliptic geometry anchor; apply the comparison without converting slopes into Hodge weights. The nonprojective acceptance is conditional on an imported actual formal example.

Direct prerequisites: [CohomologyComparisons:CP.2/period-invariants-and-admissibility](#period-invariants-and-admissibility), `CrystallineCohomology:CR.7`.

Acceptance. Check both Newton polygons against the same Hodge polygon; supply a specific nonprojective proper formal example before treating that test as closed.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 14.6, p.121; Remarks 1.2–1.3, pp.3–4.

Coverage: **planned**. Every target has a node or a preserved supplier interface at target granularity. Planned is a completed planning pass, not proof closure.

Before closure: Explicit map and homotopy agreement; Rational affine crystalline invariance proof.

<a id="cp-3"></a>

## CP.3. Canonical B_dR⁺ deformation and de Rham comparison

The canonical deformation begins with the very-small affinoid embedding system of BMS1 §13. Its supporting results include rigid geometry over finite B_dR⁺ quotients, noetherian approximation, formal-étale lifts, the full embedding-ideal envelope, redundant-coordinate normal form, embedding independence and proper smooth spreading. These are required inputs to finite freeness and degeneration. The global complex is independent of all proof choices even when a smooth lift is used to compute it. The relative infinitesimal site of Guo–Reinecke uses nilpotent thickenings over the specified relative base and simultaneous analytic covers. Its Čech–Alexander/de Rham computation and perfectness are separated from its crystalline coefficient and filtered prismatic comparison. Singular éh/derived-de-Rham support is a qualified extension and gap. The Pan relative logarithmic/infinite-level consequences are listed in CP.6, where their dependencies are available.

<a id="very-small-affinoid-embedding"></a>

### Very small affinoid embeddings

Library declaration: `CP3.very_small_affinoid_embedding` (theorem).

For smooth Tate C-algebra R of dimension d, choose a finite set Σ⊂R^{◦×} containing d coordinates T_i such that the map from the Laurent Tate algebra on Σ onto R is surjective and Spa(R,R◦)→T_C^d factors through rational embeddings and finite étale maps. Such very small affinoids form a basis. Enlarging Σ is a refinement, and functorial comparisons are obtained from the filtered family, rather than from one preferred torus chart.

Construction and proof. BMS1 Definition 13.5 and Construction 13.6 fix the coordinate data. Import the very-small basis and the completed Tate algebra from AdicSpacesPartII and the rational étale basis from the adic site owner.

Direct prerequisites: `AdicSpacesPartII:R0`, `AdicEtaleGeometry:A1`.

Acceptance. For a torus take its d standard unit coordinates; for a rational subdomain enlarge Σ by the invertible denominators.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Definition 13.5 and Construction 13.6, pp.105–106.

<a id="infinitesimal-envelope"></a>

### Presented infinitesimal envelope

Library declaration: `InfinitesimalEnvelope` (construction).

For a very small R and Σ, put P_Σ=lim_n (B_dR⁺/ξ^n)⟨X_u^{±1}:u∈Σ⟩ and e:P_Σ→R, X_u↦u. Set D_Σ(R)=lim_m P_Σ/(ker e)^m, the ker(e)-adic completion, with the induced B_dR⁺-algebra structure. Its logarithmic derivations extend continuously to the completed de Rham complex. The presented completion is Mathlib AdicCompletion; the topology and Tate presentation are imported. Completion is along the full embedding ideal, not just ξ.

Construction and proof. Use the ξ-complete Tate presentation and BMS1 Construction 13.6. The ideal is finitely generated by Lemma 13.4 under these hypotheses. Apply the pinned AdicCompletion construction. The logarithmic derivations follow by continuity from the coordinate algebra and then degreewise completion.

Uses. BMS1 Lemmas 13.12–13.13: Computes cohomology using the embedding ideal and coordinate normal form. Guo–Reinecke Example 10.5 and Construction 10.6: Relative Čech nerves use the same completion on each diagonal embedding.

The API serves those uses:

- `InfinitesimalEnvelope.of` (constructor): The canonical map P_Σ→D_Σ sends a to its compatible classes modulo (ker e)^m.
- `InfinitesimalEnvelope.level` (projection): The m-th projection is D_Σ→P_Σ/(ker e)^m.
- `InfinitesimalEnvelope.level_of` (simp): The m-th projection of the canonical image of a is the class of a modulo (ker e)^m.
- `InfinitesimalEnvelope.ext` (extensionality): Two envelope elements agree if their projections agree at every m.
- `InfinitesimalEnvelope.complete` (structure): If ker(e) is finitely generated, D_Σ is ker(e)-adically complete, using the P_Σ-module structure.

The discriminating unit tests are:

- `InfinitesimalEnvelope.test_point` (degenerate): For the identity presentation e:B→B, the completion along ker(e)=0 is canonically B.
- `InfinitesimalEnvelope.test_coordinate` (computation): In the presentation Q[X]→Q, X↦0, the level-two image of X is its nonzero class modulo (X)^2.
- `InfinitesimalEnvelope.test_nonzero_coordinate` (non-example): For Q[X]→Q, X↦0, the completed image of X is nonzero, even though its reduction at level one is zero; replacing completion by the quotient Q fails this test.

Direct prerequisites: [CohomologyComparisons:CP.3/very-small-affinoid-embedding](#very-small-affinoid-embedding), `AdicSpacesPartII:R0`, `mathlib:AdicCompletion`, `mathlib:AdicCompletion.isAdicComplete`, `mathlib:AdicCompletion.eval_of`, `mathlib:AdicCompletion.ext`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Construction 13.6, p.106; Lemma 13.4, pp.105–106.

<a id="noetherian-approximation-interface"></a>

### Noetherian approximation for embeddings

Library declaration: `CP3.noetherian_approximation_interface` (application).

A very small smooth R/C descends to a smooth affinoid R_A over a smooth affinoid algebra A of a discretely valued subfield, with compatible Σ_A, étale torus coordinates and R_A⊗̂_A C≃R. The approximation uses BMS1 Lemmas 13.7–13.10: stability of a surjection under a sufficiently small perturbation, a rank-one rational neighbourhood retaining fiberwise surjectivity, and the p-power containment criterion for monic integral generators. Higher-rank neighbourhood surjectivity is excluded.

Construction and proof. Import the generic affinoid approximation and perturbation lemmas from AdicSpacesPartII:R0/R5. Apply them to the chosen torus chart as in Lemma 13.7; record the rank-one point explicitly. No generic open mapping theorem is reproved here.

Direct prerequisites: `AdicSpacesPartII:R0`, `AdicSpacesPartII:R5`, [CohomologyComparisons:CP.3/very-small-affinoid-embedding](#very-small-affinoid-embedding).

Acceptance. Keep the higher-rank counterexample from Lemma 13.9 as the supplier’s negative test; do not drop rank one.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemmas 13.7–13.10, pp.106–108.

<a id="completed-smooth-lift"></a>

### Completed smooth lift over B_dR⁺

Library declaration: `CP3.completed_smooth_lift` (theorem).

For the noetherian approximation R_A/A and a chosen A→B_dR⁺ lifting A→C, the completed tensor R_A⊗̂_A B_dR⁺ is ξ-complete and flat, reduces to R, and has topologically free reductions modulo ξ^n. The tensor is formed from integral p-adic completions before inversion, as in BMS1 Lemma 13.11. A lift of A is a proof choice, not a canonical section of θ on C.

Construction and proof. Import the topological tensor and Raynaud–Gruson freeness input from R0/R3; apply smoothness and the completed flat base-change lemma. Test modulo ξ^n, then use derived ξ-completeness.

Direct prerequisites: `AdicSpacesPartII:R0`, `AdicSpacesPartII:R3`, [CohomologyComparisons:CP.3/noetherian-approximation-interface](#noetherian-approximation-interface), `EnhancedDerivedSheaves:E4`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemma 13.11, p.108.

<a id="envelope-normal-form"></a>

### Embedding envelope normal form

Library declaration: `CP3.envelope_normal_form` (theorem).

For a sufficiently large Σ, D_Σ(R) identifies, after choosing lifts of its redundant coordinates, with (R_A⊗̂_A B_dR⁺)[[X_u−ũ:u∈Σ excluding {T_1,…,T_d}]]. The torus coordinates T_i lift by formal étaleness. This describes the envelope for proof purposes; the chosen ũ do not define the canonical global cohomology.

Construction and proof. Follow BMS1 Lemma 13.12: lift the formally étale torus map, extend to p-complete rings of definition, then complete the redundant directions. The ordinary formal power series variables are contractible de Rham directions in characteristic zero.

Direct prerequisites: [CohomologyComparisons:CP.3/infinitesimal-envelope](#infinitesimal-envelope), [CohomologyComparisons:CP.3/completed-smooth-lift](#completed-smooth-lift), `AdicSpacesPartII:R0`.

Acceptance. Adding a redundant coordinate adds a formal disk to the envelope, not new cohomology.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemma 13.12, pp.108–109.

<a id="embedding-independence-and-reduction"></a>

### Embedding independence and de Rham reduction

Library declaration: `CP3.embedding_independence_and_reduction` (theorem).

The completed de Rham complexes of D_Σ(R) are quasi-isomorphic under Σ⊂Σ′ and under a double embedding joining two smooth lifts. Reduction modulo ξ is Ω_R/C^•; after a spreading-out choice it identifies with Ω_{R_A/A}^•⊗̂_A B_dR⁺. The comparison maps are compatible on triple refinements and give the coordinate-independent presheaf of BMS1 Definition 13.14.

Construction and proof. Use the double-envelope diagram of Lemma 13.13. Formal disks are de Rham contractible over Q_p (division by positive integers); first check modulo ξ, then apply derived ξ-Nakayama to the complete complexes.

Direct prerequisites: `EnhancedDerivedSheaves:E4`, [CohomologyComparisons:CP.3/envelope-normal-form](#envelope-normal-form), `AdicSpacesPartII:R0`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemma 13.13 and Definition 13.14, pp.109–110.

<a id="proper-formal-spreading"></a>

### Spreading out proper smooth rigid spaces

Library declaration: `CP3.proper_formal_spreading` (application).

For a proper smooth rigid X/C, choose a proper smooth family over a smooth rigid base S over a discretely valued subfield K⊂C with X as its C-valued fibre. The construction uses the noetherian descent of a proper flat formal model (BMS1 Proposition 13.15) over a complete noetherian local ring, then Corollary 13.16 and smooth neighbourhoods. Keep proper flat descent separate from the later smooth shrinking.

Construction and proof. R09.6 supplies versal proper formal deformation and algebraization; F0 supplies formal models. Apply Proposition 13.15’s induction on artinian thickenings and Corollary 13.16. These generic deformation results are requested, not owned again.

Direct prerequisites: `AlgebraicModuliForArithmeticGeometry:R09.6`, `AdicSpacesPartII:F0`, `AdicSpacesPartII:R5`.

Acceptance. This is a proper rigid statement; a projective polarization is not added.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Proposition 13.15 and Corollary 13.16, pp.110–113.

<a id="canonical-bdr-cohomology"></a>

### Canonical B_dR⁺ cohomology

Library declaration: `CanonicalBdrCohomology` (construction).

For a proper smooth adic X/C define K_dR⁺(X)=RΓ(X_very-small, Ω_X/B_dR⁺^•), where Ω_X/B_dR⁺^• is the filtered colimit of the completed envelope de Rham complexes over sufficiently large Σ (BMS1 Definition 13.18). The colimit is independent of embeddings by the previous comparison. This gives a derived ξ-complete perfect B_dR⁺ complex with K_dR⁺(X)⊗^L C≃RΓ_dR(X/C); its construction makes no choice of a lift X to B_dR⁺.

Construction and proof. Use the very-small basis and Lemma 13.13 to form the presheaf and derived global sections. Reduction is de Rham cohomology; proper finiteness plus derived ξ-Nakayama gives perfectness, as in Definition 13.18.

Uses. BMS1 Theorems 13.1,13.19: Provides the canonical finite free lattice in the rational étale comparison. CK Proposition 6.8 and CP.5 lattice recovery: Fixes the B_dR⁺ lattice used in BKF classification.

The API serves those uses:

- `CanonicalBdrCohomology.affinoid` (characterisation): On a very small affinoid, the presheaf complex is the colimit of Ω_DΣ/B_dR⁺^• with the Lemma 13.13 refinement quasi-isomorphisms.
- `CanonicalBdrCohomology.map` (functoriality): A morphism f:X→Y gives K_dR⁺(Y)→K_dR⁺(X); common embedding refinements prove identity and composition laws.
- `CanonicalBdrCohomology.theta` (compatibility): K_dR⁺(X)⊗^L C≃RΓ_dR(X/C), using the canonical quotient B_dR⁺→C.
- `CanonicalBdrCohomology.complete` (structure): K_dR⁺(X) is derived ξ-complete and perfect for proper smooth X.
- `CanonicalBdrCohomology.independent` (equivalence): Two sufficiently large embedding systems yield the same object through canonical quasi-isomorphisms satisfying the refinement cocycle law.

The discriminating unit tests are:

- `CanonicalBdrCohomology.test_point` (degenerate): K_dR⁺(Spa C)=B_dR⁺ concentrated in degree zero.
- `CanonicalBdrCohomology.test_projective_line` (computation): For P¹_C, H⁰ and H² are free rank one over B_dR⁺ and H¹=0; their θ-reductions are the corresponding C de Rham groups.
- `CanonicalBdrCohomology.test_redundant_embedding` (compatibility): On a very small torus, adjoining a redundant unit to Σ induces the Lemma 13.13 quasi-isomorphism; no extra degree-one class is introduced.

Direct prerequisites: [CohomologyComparisons:CP.3/embedding-independence-and-reduction](#embedding-independence-and-reduction), `AdicEtaleGeometry:A1`, `EnhancedDerivedSheaves:E4`, `AdicSpacesPartII:R3`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Definition 13.18, p.114.

Required refinements: [Missing geometric and enhanced Lean interfaces](#G-lean-types).

<a id="bdr-cohomology-finite-freeness"></a>

### Finite freeness of B_dR⁺ cohomology

Library declaration: `CP3.bdr_cohomology_finite_freeness` (theorem).

For proper smooth X/C, every H^i(K_dR⁺(X)) is finite free over B_dR⁺. Reduction to C commutes with cohomology and identifies H^i with H_dR^i(X/C); dimensions give the common rank. Freeness comes from proper smooth spreading out and relative de Rham cohomology with integrable connection, not merely from perfectness of the complex.

Construction and proof. Use Corollary 13.16 to spread X; relative de Rham cohomology is locally free by its integrable connection. Pull back along a chosen lift A→B_dR⁺ and use the embedding-independent comparison. Derived ξ-Nakayama identifies the complexes, proving Theorem 13.19.

Direct prerequisites: [CohomologyComparisons:CP.3/canonical-bdr-cohomology](#canonical-bdr-cohomology), [CohomologyComparisons:CP.3/proper-formal-spreading](#proper-formal-spreading), [CohomologyComparisons:CP.3/completed-smooth-lift](#completed-smooth-lift), `AdicSpacesPartII:R3`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 13.19, p.114.

<a id="local-bdr-etale-map"></a>

### Local B_dR period comparison map

Library declaration: `CP3.local_bdr_etale_map` (theorem).

For a very small X=Spa(R,R◦) and Σ, adjoining compatible p-power roots of all u∈Σ gives a perfectoid tower with Γ=∏_Σ Z_p(1). The degree-zero map D_Σ(R)→B_dR⁺(R_∞,Σ) sends X_u to [u^♭]. The normalized maps of completed logarithmic de Rham and Γ-Koszul complexes identify Ω_DΣ/B_dR⁺^• with η_ξ of the period Koszul complex. After ξ inversion this is the local comparison quasi-isomorphism.

Construction and proof. Use the actual exponential/Koszul normalization from AI.4 §12.2, not an unscaled identification ∂logX=γ−1. The BMS1 Theorem 13.1 proof repeats Proposition 12.9. Perfectoid acyclicity and continuous group cohomology are early site/period inputs.

Direct prerequisites: `AInfCohomology:AI.4`, [CohomologyComparisons:CP.3/infinitesimal-envelope](#infinitesimal-envelope), `AInfCohomology:AI.1`, `PadicHodgeTheory:P8:local-rational`, `AdicEtaleGeometry:A1`.

Acceptance. On X_u the map is Teichmüller [u^♭]; on dlog X_u the scale is the specified logarithmic period.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 13.1 proof, p.115; Proposition 12.9.

<a id="canonical-bdr-etale-comparison"></a>

### Canonical de Rham period comparison

Library declaration: `CP3.canonical_bdr_etale_comparison` (theorem).

For proper smooth X/C, the natural map K_dR⁺(X)→RΓ(X_proét,B_dR⁺) becomes a quasi-isomorphism after ξ inversion; proper primitive finiteness identifies the target with RΓ_ét(X,Z_p)⊗^L B_dR. Hence H^i(K_dR⁺(X))⊗B_dR≃H_ét^i(X,Z_p)⊗B_dR. Over C, BMS1 Theorem 13.1 establishes the underlying comparison; its filtered enhancement is stated separately with CN Theorem 6.8.

Construction and proof. Globalize the strictly functorial local maps, use ξ inversion and the early primitive/global period input. The dependency is on P8:local-rational plus a recorded early primitive owner gap, never on the late P8 global theorem that consumes CP.3.

Direct prerequisites: [CohomologyComparisons:CP.3/canonical-bdr-cohomology](#canonical-bdr-cohomology), [CohomologyComparisons:CP.3/local-bdr-etale-map](#local-bdr-etale-map), `PadicHodgeTheory:P8:local-rational`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 13.1 and proof, pp.104–105,115.

Required refinements: [Early absolute and relative primitive comparison owner](#G-primitive).

<a id="descended-de-rham-lattice"></a>

### Descended de Rham lattice

Library declaration: `CP3.descended_de_rham_lattice` (theorem).

If X=X₀⊗̂_K C for X₀/K proper smooth and K complete discretely valued, H^i(K_dR⁺(X))≃H_dR^i(X₀/K)⊗_K B_dR⁺ via the continuous lift K→B_dR⁺. After inversion the canonical comparison agrees with the early local-period Poincaré comparison of Scholze/BMS1 Theorem 5.1. The equality is equality of comparison maps through a common envelope, not an arbitrary matching of two free modules.

Construction and proof. Use Remark 13.20. In the final diagram of the Theorem 13.1 proof compare D_Σ(R)→D̃_Σ(R_K)←R_K⊗̂B_dR⁺ above B_dR⁺(R_∞)→OB_dR⁺(R_∞)←R_K⊗̂B_dR⁺. The corrected structural sheaf uses p-completion before ker θ completion.

Direct prerequisites: [CohomologyComparisons:CP.3/canonical-bdr-cohomology](#canonical-bdr-cohomology), [CohomologyComparisons:CP.3/embedding-independence-and-reduction](#embedding-independence-and-reduction), [CohomologyComparisons:CP.3/canonical-bdr-etale-comparison](#canonical-bdr-etale-comparison), `PadicHodgeTheory:P8:local-rational`.

Acceptance. For P¹_K the trace-normalized generator gives the same rational comparison in both diagrams.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Remark 13.20, p.114; Theorem 13.1 proof diagram, p.115.

<a id="filtered-de-rham-comparison"></a>

### Filtered de Rham comparison over K

Library declaration: `CP3.filtered_de_rham_comparison` (theorem).

For proper smooth X₀/K, the rational comparison H_ét^i(X_C,Q_p)⊗B_dR≃H_dR^i(X₀/K)⊗B_dR is G_K-equivariant and strict for the tensor product Hodge/period filtrations. On the étale side the filtration is the period filtration; on the de Rham side Fil^r is the sum of Fil^a H_dR⊗Fil^{r−a}B_dR. The equality with the canonical B_dR⁺ deformation is the preceding map comparison.

Construction and proof. The early P8 local-rational period sheaf Poincaré lemma supplies the filtered local map. Globalize using proper finiteness and the descended envelope diagram. Strictness means the inverse also preserves Fil^r, rather than mere filtration preservation.

Direct prerequisites: [CohomologyComparisons:CP.3/descended-de-rham-lattice](#descended-de-rham-lattice), `PadicHodgeTheory:P8:local-rational`.

Acceptance. Q_p(1) has HT weight +1; its period-invariant generator t⁻¹e lies in Fil^{-1}, fixing the sign.

Source: [Peter Scholze, p-adic Hodge theory for rigid-analytic varieties](https://arxiv.org/pdf/1205.3463), Theorem 8.4; BMS1 Theorem 5.1 and Theorem 13.1 proof.

<a id="hodge-de-rham-degeneration"></a>

### Hodge–de Rham degeneration

Library declaration: `CP3.hodge_de_rham_degeneration` (theorem).

For proper smooth rigid X/C in characteristic zero, E₁^{a,b}=H^b(X,Ω_X^a)⇒H_dR^{a+b}(X/C) degenerates at E₁. Over a discretely valued descent this follows from the filtered period comparison; the general C case follows by proper smooth spreading out and constancy of relative cohomology ranks. No integral or positive-characteristic degeneration is asserted.

Construction and proof. Follow Theorem 13.3(i): shrink the spreading base so the coherent cohomology and base changes are locally free; test rank equality on classical points using Scholze’s de Rham comparison. Then specialize to the given C-point.

Direct prerequisites: [CohomologyComparisons:CP.3/proper-formal-spreading](#proper-formal-spreading), [CohomologyComparisons:CP.3/filtered-de-rham-comparison](#filtered-de-rham-comparison), `AdicSpacesPartII:R3`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 13.3(i) and proof, pp.104,116.

<a id="hodge-tate-degeneration"></a>

### Hodge–Tate degeneration

Library declaration: `CP3.hodge_tate_degeneration` (theorem).

For proper smooth X/C, E₂^{a,b}=H^a(X,Ω_X^b)(−b)⇒H_ét^{a+b}(X,Q_p)⊗C degenerates at E₂. The source convention (−b) is translated through HT(χ_p)=+1. The dimension equality follows from the finite free canonical B_dR⁺ lattice and Hodge–de Rham degeneration; it does not imply a canonical splitting for every descended family.

Construction and proof. BMS1 Theorem 13.3(ii): de Rham dimensions equal the sum of Hodge dimensions; canonical B_dR comparison equates them to étale dimensions. Apply the supplied Hodge–Tate spectral sequence.

Direct prerequisites: [CohomologyComparisons:CP.3/hodge-de-rham-degeneration](#hodge-de-rham-degeneration), [CohomologyComparisons:CP.3/bdr-cohomology-finite-freeness](#bdr-cohomology-finite-freeness), [CohomologyComparisons:CP.3/canonical-bdr-etale-comparison](#canonical-bdr-etale-comparison), `PadicHodgeTheory:P8:local-rational`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 13.3(ii) and proof, pp.104,116.

Required refinements: [Early absolute and relative primitive comparison owner](#G-primitive).

<a id="good-reduction-bdr-lattice-identification"></a>

### The canonical B_dR^+-lattice in the good-reduction case

Library declaration: `CP3.good_reduction_bdr_lattice_identification` (theorem).

For proper smooth formal 𝔛/O_C and Y=𝔛_{O_C/p}, there is a natural quasi-isomorphism RΓ_crys(Y/A_cris)⊗^L_{A_cris}B_dR⁺≃K_dR⁺(X_C). Its degreewise map is H_crys^i(Y/A_cris)⊗B_dR⁺≃H^i(K_dR⁺(X_C)); use CR.3 Proposition 13.21 rational freeness to justify this passage. This identifies the canonical deformation lattice. Agreement with the B_cris/étale map is a separate downstream comparison.

Construction and proof. BMS1 Proposition 13.23 compares explicit PD de Rham complexes with the embedding envelopes of §13. On smooth lifts both are the same completed de Rham complex. Globalize and use rational crystalline freeness to pass to H^i.

Direct prerequisites: [CohomologyComparisons:CP.3/canonical-bdr-cohomology](#canonical-bdr-cohomology), [CohomologyComparisons:CP.3/infinitesimal-envelope](#infinitesimal-envelope), `AInfCohomology:AI.4`, `CrystallineCohomology:CR.2`, `CrystallineCohomology:CR.3`.

Acceptance. The lattice is not an arbitrary free B_dR^+-lattice: it is determined by the A_crys-crystalline cohomology of X_{O/p} (good reduction) or by H^i_dR(X_0) (descent case). The identification must be compatible with Fargues' pair for H^i_Ainf(X) (used in Theorem 14.5(iii)). Finite freeness of H^i_crys(X/B_dR^+) over B_dR^+ (Theorem 13.19; in the good-reduction case also Proposition 13.23 with Proposition 13.21), so that it is a lattice in the sense of Theorem 4.28.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Proposition 13.23, p.117.

<a id="integral-rational-bdr-map-agreement"></a>

### Agreement of integral and rational period maps

Library declaration: `CP3.integral_rational_bdr_map_agreement` (theorem).

After B_dR extension, the BMS1 A_inf→A_cris→B_cris/étale comparison and the canonical §13 de Rham/étale comparison coincide under Proposition 13.23. The comparison is verified on their common all-coordinate tower via X_u↦[u^♭] and the normalized logarithmic Koszul maps. It also matches the early local de Rham sheaf comparison when X descends to K.

Construction and proof. Compare the degree-zero ring maps and the explicit comparison operators of §12.2 and the proof of Theorem 13.1. Theorem 14.5(i) cites this check without a full diagram; the map-level supplier API and homotopy coherence still need refinement.

Direct prerequisites: [CohomologyComparisons:CP.3/good-reduction-bdr-lattice-identification](#good-reduction-bdr-lattice-identification), [CohomologyComparisons:CP.3/local-bdr-etale-map](#local-bdr-etale-map), `AInfCohomology:AI.4`.

Acceptance. Check the diagram on a torus, including the degree-one normalization; equal scalar rings or ranks do not suffice.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 14.5(i) proof, p.120; Theorem 13.1 proof, p.115.

Required refinements: [Explicit map and homotopy agreement](#G-map-agreement).

<a id="relative-infinitesimal-site"></a>

### Relative B_dR⁺ infinitesimal site

Library declaration: `RelativeInfinitesimalSite` (definition).

For a smooth morphism of smooth formal O_K-schemes f:X→Y and the specified O_K→B_dR⁺, define X/Y_B_dR⁺,inf as in Guo–Reinecke Definition 10.1. An object is (U,T), U open in X_C, T topologically finite type over Y_{B_dR⁺/I^e} for some e, and a nilpotent closed immersion U→T over Y_C. Morphisms are compatible maps of thickenings and open immersions on U; covers are simultaneous analytic covers of U and T. O_inf(U,T)=Γ(T,O_T). Generic crystals and their cartesian condition are imported from the crystalline/sheaf owners.

Construction and proof. Use the imported adic spaces and completed base changes. Organize the pairs, morphisms and analytic coverage of Definition 10.1; the structure sheaf is evaluation on T. Increasing e gives compatible thickenings. The nilpotent lifting property of smooth ambient spaces proves the weakly final envelope statement, used below.

Uses. GR Theorem 10.7 and Corollary 10.9: Computes relative infinitesimal cohomology using crystals and envelopes. GR Propositions 10.10–10.11: Receives the crystalline-to-infinitesimal coefficient comparison.

The API serves those uses:

- `RelativeInfinitesimalSite.object` (constructor): An open U, a finite-level T and a nilpotent closed immersion U→T over the specified base give an object.
- `RelativeInfinitesimalSite.morphism` (data): Morphisms are compatible adic maps on T and open immersions on U, with identity and composition inherited from adic spaces.
- `RelativeInfinitesimalSite.structureSheaf` (projection): The structure sheaf evaluates a thickening at Γ(T,O_T), compatibly with restrictions.
- `RelativeInfinitesimalSite.baseChange` (functoriality): A compatible base change Y′→Y induces the pullback comparison on the corresponding relative thickenings and cartesian crystals.
- `RelativeInfinitesimalSite.envelope` (characterisation): The ind-system of infinitesimal neighbourhoods in a smooth ambient Z over Y_K is weakly final; its self-products are the diagonal embedding envelopes of GR Lemma 10.3.

The discriminating unit tests are:

- `RelativeInfinitesimalSite.test_point` (degenerate): For X_C=Spa C over the point, its structure-sheaf cohomology is B_dR⁺ in degree zero, as computed by the canonical envelope.
- `RelativeInfinitesimalSite.test_identity` (computation): For an identity smooth relative morphism, the relative de Rham complex in an ambient lift has only degree zero; the Čech envelope computation agrees.
- `RelativeInfinitesimalSite.test_base` (non-example): A nilpotent thickening T with no map to the specified Y_{B_dR⁺/I^e} is not an object, even if it is an absolute B_dR⁺ thickening.

Direct prerequisites: `AdicSpacesPartII:R0`, `AdicEtaleGeometry:A1`, `CrystallineCohomology:CR.1`, `EnhancedDerivedSheaves:E4`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Haoyang Guo, Emanuel Reinecke, A prismatic approach to crystalline local systems](https://arxiv.org/pdf/2203.09490v3), Definition 10.1, p.94.

Required refinements: [Missing geometric and enhanced Lean interfaces](#G-lean-types).

<a id="relative-cech-de-rham-comparison"></a>

### Relative Čech–de Rham comparison

Library declaration: `CP3.relative_cech_de_rham_comparison` (theorem).

For a vector-bundle crystal F on X/Y_B_dR⁺,inf and a smooth ambient embedding, the Čech–Alexander complex of the weakly final envelope and the completed relative de Rham complex of F on that envelope both compute RΓ_inf(X/Y_B_dR⁺,F). In the formal affine smooth setting of GR Convention 10.4, the canonical lift and enlarged Laurent framing give the natural equivalences of Corollary 10.8.

Construction and proof. Use Lemma 10.3 to compute by the Čech nerve. GR Construction 10.6 and Theorem 10.7 compare the two complexes through a double complex; contraction of formal power-series de Rham directions is Guo Lemma 4.1.10. Do not confuse weak finality with a single final thickening.

Direct prerequisites: [CohomologyComparisons:CP.3/relative-infinitesimal-site](#relative-infinitesimal-site), [CohomologyComparisons:CP.3/infinitesimal-envelope](#infinitesimal-envelope), `CrystallineCohomology:CR.2`, `EnhancedDerivedSheaves:E4`.

Acceptance. On an enlarged framing, deleting redundant formal coordinates is a quasi-isomorphism of both Čech and de Rham models.

Source: [Haoyang Guo, Emanuel Reinecke, A prismatic approach to crystalline local systems](https://arxiv.org/pdf/2203.09490v3), Construction 10.6 and Theorem 10.7, pp.95–97; Corollary 10.8, p.97.

<a id="relative-infinitesimal-perfectness"></a>

### Relative infinitesimal perfectness

Library declaration: `CP3.relative_infinitesimal_perfectness` (theorem).

For a proper smooth f:X→Y of smooth formal O_K-schemes with Y=Spf R and a vector-bundle crystal F on the relative infinitesimal site, RΓ_inf(X/Y_B_dR⁺,F) is a perfect R_{B_dR⁺}-complex. Its derived I-reduction is the relative de Rham cohomology of the associated vector bundle with flat connection on X_C/Y_C. This gives perfectness, not an unconditional statement that all higher direct images are free.

Construction and proof. GR Corollary 10.9: proper smooth relative de Rham cohomology is perfect; I-completeness and the derived Nakayama criterion lift perfectness. Preserve the completed tensor defining R_{B_dR⁺}.

Direct prerequisites: [CohomologyComparisons:CP.3/relative-cech-de-rham-comparison](#relative-cech-de-rham-comparison), `EnhancedDerivedSheaves:E4`, `AdicSpacesPartII:R3`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Haoyang Guo, Emanuel Reinecke, A prismatic approach to crystalline local systems](https://arxiv.org/pdf/2203.09490v3), Corollaries 10.8–10.9, p.97.

<a id="crystalline-to-infinitesimal-coefficients"></a>

### Crystalline-to-infinitesimal coefficient functor

Library declaration: `CP3.crystalline_to_infinitesimal_coefficients` (comparison).

For the smooth relative setup, there is a natural functor D_perf(X_{p=0,crys})→D_perf(X/Y_B_dR⁺,inf), restricting from vector-bundle crystals to vector-bundle crystals. On an enlarged framing its value is E′(D_pd,Σ^n)⊗^L_{D_pd,Σ^n}D_Σ^n. The ring map is obtained by p-inversion followed by completion along the embedding ideal, and the cartesian crystal condition provides Čech descent.

Construction and proof. GR Proposition 10.10 constructs maps D_pd,Σ→D_Σ by finite divided-power truncations, then passes to inverse limits. Apply the crystal condition on the Čech envelope to globalize, rather than choosing lifts of each coefficient.

Direct prerequisites: `CrystallineCohomology:CR.0`, `CrystallineCohomology:CR.1`, [CohomologyComparisons:CP.3/relative-cech-de-rham-comparison](#relative-cech-de-rham-comparison).

Acceptance. A rank-one trivial crystal becomes the structure-sheaf crystal; the construction commutes with a change of enlarged framing.

Source: [Haoyang Guo, Emanuel Reinecke, A prismatic approach to crystalline local systems](https://arxiv.org/pdf/2203.09490v3), Proposition 10.10 and proof, pp.97–98.

<a id="relative-crystalline-infinitesimal-base-change"></a>

### Relative crystalline–infinitesimal base change

Library declaration: `CP3.relative_crystalline_infinitesimal_base_change` (comparison).

In GR Convention 10.4 for a vector-bundle crystalline crystal E′ and its image F, crystalline cohomology over R, crystalline cohomology over R_Acrys, and infinitesimal cohomology over R_B_dR⁺ identify after the specified completed B_dR⁺ base change. The induced connections agree: ∇_inf is the ker θ̃_K-completion of ∇_crys[1/p]. This is the comparison of equation (36), not a blanket uncompleted base-change assertion.

Construction and proof. Use the two Čech–Alexander/de Rham computations of Proposition 10.11 and the same double complex. Evaluate at degree zero and one of the diagonal envelope to identify connections; properness is used only for the later finite perfect outputs.

Direct prerequisites: [CohomologyComparisons:CP.3/crystalline-to-infinitesimal-coefficients](#crystalline-to-infinitesimal-coefficients), [CohomologyComparisons:CP.3/relative-cech-de-rham-comparison](#relative-cech-de-rham-comparison), `CrystallineCohomology:CR.3`, `EnhancedDerivedSheaves:E4`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Haoyang Guo, Emanuel Reinecke, A prismatic approach to crystalline local systems](https://arxiv.org/pdf/2203.09490v3), Proposition 10.11, pp.98–99, equation (36).

<a id="relative-filtered-prismatic-agreement"></a>

### Relative filtered comparison adapter

Library declaration: `CP3.relative_filtered_prismatic_agreement` (comparison).

For proper smooth f and crystalline Z_p-lisse T with the associated analytic prismatic F-crystal, the B_dR specialization of GR’s étale–crystalline comparison equals the Hodge-filtered relative de Rham comparison under Convention 10.12 and its compatible section R→A⊗W(k)O_K. Without the section, the structural OB_dR sheaf gives the canonical relative formulation. CP supplies the infinitesimal base-change comparison; PR.7 supplies the F-crystal equivalence and the comparison being specialized. The perfect prism (A,I) must be p-completely flat over (A_inf,[p]_q), q=[ε]; its I-adic period filtration and the tensor-product Hodge filtration on the de Rham side are the filtrations being compared.

Construction and proof. Import GR Theorems 9.15,10.13 from PR.7 with their exact base prism and flatness conditions. Compare via Proposition 10.11; use Remark 10.14 and Griffiths transversality to remove the auxiliary section only after tensoring with OB_dR.

Direct prerequisites: `PrismaticCohomology:PR.7`, [CohomologyComparisons:CP.3/relative-crystalline-infinitesimal-base-change](#relative-crystalline-infinitesimal-base-change), `PadicHodgeTheory:P8:local-rational`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Haoyang Guo, Emanuel Reinecke, A prismatic approach to crystalline local systems](https://arxiv.org/pdf/2203.09490v3), Theorem 10.13 and Remark 10.14, pp.99–100.

Required refinements: [Relative filtered and singular extensions](#G-relative-filtration).

<a id="absolute-relative-infinitesimal-agreement"></a>

### Absolute and relative infinitesimal agreement

Library declaration: `CP3.absolute_relative_infinitesimal_agreement` (comparison).

For smooth X/C over the point, Guo’s B_dR⁺ infinitesimal cohomology agrees with the BMS1 canonical embedding cohomology. The relative formulation specializes to that construction using the same completed envelopes. Guo Theorem 1.2.7 also treats singular proper spaces via éh descent; that broader extension is an explicit requested interface and gap, not derived from the smooth statement in this packet.

Construction and proof. Use Guo Corollary 1.2.11 and the envelope/Čech comparison. Restrict to smooth X for the present construction; preserve the filtered versus underlying distinction of Theorem 1.2.7. Request éh hyperdescent and analytic derived de Rham support separately.

Direct prerequisites: [CohomologyComparisons:CP.3/canonical-bdr-cohomology](#canonical-bdr-cohomology), [CohomologyComparisons:CP.3/relative-cech-de-rham-comparison](#relative-cech-de-rham-comparison), `EnhancedDerivedSheaves:E5:animation`.

Acceptance. The point gives the identical B_dR⁺ complex on both sides.

Source: [Haoyang Guo, Crystalline cohomology of rigid analytic spaces](https://arxiv.org/pdf/2112.14304v1), Theorem 1.2.7 and Corollary 1.2.11, pp.5–6; [Haoyang Guo, Crystalline cohomology of rigid analytic spaces](https://arxiv.org/pdf/2112.14304v1), Definition 2.2.1, Remarks 2.2.2–2.2.4, pp.12–13; Lemma 4.1.10, pp.33–34.

Required refinements: [Relative filtered and singular extensions](#G-relative-filtration).

Coverage: **planned**. Every target has a node or a preserved supplier interface at target granularity. Planned is a completed planning pass, not proof closure.

Before closure: Early absolute and relative primitive comparison owner; Explicit map and homotopy agreement; Relative filtered and singular extensions; Missing geometric and enhanced Lean interfaces.

<a id="cp-4"></a>

## CP.4. Semistable, logarithmic and monodromy comparison

The semistable theorem imports AI.6's actual log A_inf diagram and CR.6's Hyodo–Kato complex. It distinguishes the geometric W(k̄),Q_{≥0} log base from the arithmetic W(k₀),N log base. Nφ=pφN and the total monodromy on a tensor are part of the comparison. A B_st→B_dR embedding depends on the chosen logarithmic coordinate, so the filtered statement also retains that choice and its transport. CK's full semistable A_cris map is not asserted multiplicative. The routed Colmez–Nizioł results have three separate scopes: arbitrary algebraic varieties with h-derived realizations; proper smooth rigid spaces over K with potential semistability; and proper smooth rigid spaces over C with the filtered B_dR⁺ complex. Neither proper smoothness nor semistability over K is silently added to the arbitrary algebraic theorem.

<a id="logarithmic-integral-diagram"></a>

### Logarithmic integral comparison adapter

Library declaration: `CP4.logarithmic_integral_diagram` (application).

For a proper flat p-adic O_K-formal scheme with divisorial log structure and étale local charts t₀⋯t_r=π′ (π′ a nonzero nonunit, allowed to vary), use the AI.6 semistable K_A and its θ-log de Rham, Witt-log crystalline, A_cris-log crystalline and μ-inverted étale comparisons. The log bases over W(k̄) and W(k₀) are displayed separately. Properness is retained for the étale comparison. CK does not prove the full semistable all-coordinate A_cris map multiplicative.

Construction and proof. Import AI.6 exact node statements, including its corrected properness and log-base qualifications. Compose with CP.0’s scalar diagram. Product/functorial enhancements not supplied there remain an explicit CP.6 gap.

Direct prerequisites: `AInfCohomology:AI.6/log-de-rham`, `AInfCohomology:AI.6/global-crystalline`, `AInfCohomology:AI.6/etale-comparison`, `AInfCohomology:AI.6/crystalline-de-rham-square`, [CohomologyComparisons:CP.0/ainf-specialization-dictionary](#ainf-specialization-dictionary).

Acceptance. For r=0 with smooth reduction, forgetting the log structure gives the smooth diagram.

Source: [Kęstutis Česnavičius, Teruhisa Koshikawa, The A_inf-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145), §7.2, pp.68–69; Corollary 5.43; Theorem 2.3.

<a id="hyodo-kato-log-base-adapter"></a>

### Hyodo–Kato log-base adapter

Library declaration: `CP4.hyodo_kato_log_base_adapter` (comparison).

Relate the AI.6 log crystalline object over W(k̄) with Q_{≥0} log base to the arithmetic Hyodo–Kato complex over W(k₀) with N→W(k₀), 1↦0. The B_st⁺-base-change map of CK Proposition 9.2 is φ- and N-compatible; on the HK side N is N_HK⊗1+1⊗N_Bst, while on the A_cris side N acts on the period factor. Descent to k₀ and invariants require the precise CR.6 comparison, not an implicit identification of log bases.

Construction and proof. Use AI.6/hyodo-kato-interface and CR.6. CK Proposition 9.2 uses a descent Y and Beilinson log period maps; keep that datum and its transport. Do not assert the unstated W(k₀)→W(k̄) descent without its requested theorem.

Direct prerequisites: `AInfCohomology:AI.6/hyodo-kato-interface`, `CrystallineCohomology:CR.6`, `PadicHodgeTheory:R06.1`, [CohomologyComparisons:CP.4/logarithmic-integral-diagram](#logarithmic-integral-diagram).

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Kęstutis Česnavičius, Teruhisa Koshikawa, The A_inf-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145), Proposition 9.2 and Remark 9.3, pp.75–76.

Required refinements: [Hyodo–Kato log-base descent and signed transport](#G-hk-conventions).

<a id="semistable-period-comparison"></a>

### Semistable period comparison

Library declaration: `CP4.semistable_period_comparison` (theorem).

For a proper p-adic O_K-formal scheme with the preceding semistable charts and perfect residue k₀, there is a natural G_K-equivariant quasi-isomorphism RΓ_ét(X_C,Z_p)⊗^L B_st≃RΓ_logcrys(X_{k₀}/W(k₀))⊗^L B_st, compatible with φ and N, where Nφ=pφN. Degreewise it gives semistable H_ét^i(X_C,Q_p). The right side uses the N→W(k₀),1↦0 log base.

Construction and proof. CK Theorem 9.5: compose Proposition 9.2 with the A_cris specialization from AI.6, then invert μ and use the proper étale comparison. Check φ on both factors, N as the total monodromy and the trivial étale-factor N.

Direct prerequisites: [CohomologyComparisons:CP.4/logarithmic-integral-diagram](#logarithmic-integral-diagram), [CohomologyComparisons:CP.4/hyodo-kato-log-base-adapter](#hyodo-kato-log-base-adapter), `CrystallineCohomology:CR.6`, `PadicHodgeTheory:R06.1`, `PadicHodgeTheory:R06.2`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Kęstutis Česnavičius, Teruhisa Koshikawa, The A_inf-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145), Theorem 9.5, p.76.

Required refinements: [Early absolute and relative primitive comparison owner](#G-primitive), [Missing geometric and enhanced Lean interfaces](#G-lean-types).

<a id="semistable-filtered-bdr-agreement"></a>

### Semistable de Rham agreement

Library declaration: `CP4.semistable_filtered_bdr_agreement` (theorem).

Choose a noncanonical A_cris-algebra embedding B_st→B_dR as in Fontaine/CK. The B_dR extension of the semistable comparison agrees with the canonical de Rham comparison of CP.3 under AI.6 Proposition 6.8. Transport the Hodge filtration through the chosen Hyodo–Kato identification; filtered compatibility is not a filtration on B_st independent of its embedding choice.

Construction and proof. CK Remark 9.6 invokes Proposition 6.8. Import AI.6/etale-bdr-agreement, which compares the explicit maps, and apply the descended de Rham comparison. Preserve the choice of embedding as input.

Direct prerequisites: [CohomologyComparisons:CP.4/semistable-period-comparison](#semistable-period-comparison), [CohomologyComparisons:CP.3/descended-de-rham-lattice](#descended-de-rham-lattice), [CohomologyComparisons:CP.3/filtered-de-rham-comparison](#filtered-de-rham-comparison), `AInfCohomology:AI.6/etale-bdr-agreement`.

Acceptance. Verify the displayed map, the stated hypotheses and its compatibility on the point and the torus charts; do not substitute an abstract isomorphism.

Source: [Kęstutis Česnavičius, Teruhisa Koshikawa, The A_inf-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145), Remark 9.6, p.76; Proposition 6.8, pp.65–66.

<a id="uniformizer-change-and-monodromy"></a>

### Uniformizer change and monodromy transport

Library declaration: `CP4.uniformizer_change_and_monodromy` (theorem).

For two uniformizer choices with ratio a, the corresponding Hyodo–Kato-to-de Rham identifications are transported by the exponential of the logarithmic ratio times N, with the sign fixed by the CR.6/Fontaine convention N=−d/dT on the B_st torsor. B_st itself is the intrinsic HK torsor algebra, not one permanently chosen polynomial coordinate. The transport obeys the cocycle law and preserves the rational comparison.

Construction and proof. CR.6 owns the uniformizer-change theorem and R06.1 the torsor/B_st normalization. CK §9.1 gives T↦T+log(a), N=−d/dT and φ(T)=pT; determine the exponential sign from those exact maps, rather than guessing it. The missing full convention interface is recorded.

Direct prerequisites: `CrystallineCohomology:CR.6`, `PadicHodgeTheory:R06.1`, [CohomologyComparisons:CP.4/semistable-filtered-bdr-agreement](#semistable-filtered-bdr-agreement).

Acceptance. Composition for ratios a,b equals transport for ab; supply the sign in the final owner API before this target is closed.

Source: [Kęstutis Česnavičius, Teruhisa Koshikawa, The A_inf-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145), §9.1, p.75.

Required refinements: [Hyodo–Kato log-base descent and signed transport](#G-hk-conventions).

<a id="log-prismatic-agreement"></a>

### Log prismatic comparison boundary

Library declaration: `CP4.log_prismatic_agreement` (comparison).

For the precise boundedness, log smoothness and exact chart class furnished by PR.8, its log prismatic crystalline, de Rham and étale maps fit the semistable comparison after the indicated derived completions and rational period extensions. No assertion extends automatically to all fs log schemes, nonvertical log structures or nonexact charts.

Construction and proof. Import the source-qualified PR.8 comparison and compare its chart maps with AI.6’s log exactification and CP.4’s HK base-change map. Record the exact range and map-uniqueness theorem needed; that agreement is still an explicit gap.

Direct prerequisites: `PrismaticCohomology:PR.8`, [CohomologyComparisons:CP.4/logarithmic-integral-diagram](#logarithmic-integral-diagram), [CohomologyComparisons:CP.4/hyodo-kato-log-base-adapter](#hyodo-kato-log-base-adapter).

Acceptance. The nodal chart uses exactification before the log PD envelope; an ordinary PD envelope does not supply the same map.

Source: [Kęstutis Česnavičius, Teruhisa Koshikawa, The A_inf-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145), §9 introduction and Theorem 9.5, pp.75–76.

Required refinements: [Log-prismatic agreement and semistable products](#G-log-products).

<a id="semistable-geometric-examples"></a>

### Good reduction and Tate-curve monodromy

Library declaration: `CP4.semistable_geometric_examples` (application).

The semistable comparison restricts in good reduction to the crystalline comparison with N=0. For a split Tate elliptic curve with parameter q, the supplied two-dimensional HK module has nonzero rank-one N with Nφ=pφN, and the filtered de Rham realization records log(q) after the chosen period embedding. Thus the semistable theorem detects information that the N=0 crystalline theorem does not.

Construction and proof. Import the Tate-curve HK/period computation from CR.6 and R06.2 and apply the diagram. Forget log structures on the smooth good-reduction case; compare through the CP.3 map agreement.

Direct prerequisites: [CohomologyComparisons:CP.4/semistable-period-comparison](#semistable-period-comparison), [CohomologyComparisons:CP.4/semistable-filtered-bdr-agreement](#semistable-filtered-bdr-agreement), [CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base](#crystalline-comparison-over-discretely-valued-base), `CrystallineCohomology:CR.6`, `PadicHodgeTheory:R06.2`.

Acceptance. A Tate curve test must display a nonzero N, with the sign and bases imported from the supplier; a two-dimensional dimension count is insufficient.

Source: [Kęstutis Česnavičius, Teruhisa Koshikawa, The A_inf-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145), Theorem 9.5, p.76; §9.1.

<a id="algebraic-beilinson-period-comparison"></a>

### Algebraic period comparison without smoothness

Library declaration: `CP4.algebraic_beilinson_period_comparison` (theorem).

For any algebraic variety X_K over K and r≥0, CN Theorem 6.2 records Beilinson’s B_st-linear G_K-equivariant period isomorphism H_ét^r(X_{K̄},Q_p)⊗B_st≃H_HK^r(X_{K̄})⊗_{F^{nr}}B_st preserving φ,N and inducing the filtered B_dR isomorphism with H_dR^r(X_K). No smoothness or properness assumption is added; HK and de Rham use the h-descent/derived realizations for arbitrary varieties, not the smooth proper model definitions.

Construction and proof. Request algebraic h-descent HK and filtered de Rham from a CR.6 extension together with resolution/hypercovers from R09.7. CN quotes Beilinson rather than proving the algebraic theorem here; the original h-descent comparison proof is a documented gap.

Direct prerequisites: `CrystallineCohomology:CR.6`, `AlgebraicModuliForArithmeticGeometry:R09.7`, `EnhancedDerivedSheaves:E4`, `PadicHodgeTheory:R06.2`.

Acceptance. A singular or nonproper variety must use the h-derived realizations; the smooth proper CK model theorem is not enough.

Source: [Pierre Colmez, Wiesława Nizioł, On the cohomology of p-adic analytic spaces, II: The C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Theorem 6.2 and footnote 17, p.40.

Required refinements: [Analytic and algebraic C_st proof suppliers](#G-analytic-cst).

<a id="algebraic-period-recovery-and-duals"></a>

### Period recovery and Hom descriptions

Library declaration: `CP4.algebraic_period_recovery_and_duals` (application).

For the algebraic comparison above, recover H_ét^r as (H_HK^r⊗B_st)^{φ=1,N=0}∩Fil⁰(H_dR^r⊗B_dR). The natural Hom^sm_{G_K}(H_ét^r,B_st)≃(H_HK^r)^* is an isomorphism of (φ,N,G_K)-modules and Hom_{G_K}(H_ét^r,B_dR)≃(H_dR^r)^* is filtered K-linear. The smooth-vector qualifier and the duals are essential; the theorem does not identify ordinary B_st Hom with undualized HK cohomology.

Construction and proof. Use CN Theorem 6.2 equation (6.3) and the R06.2 admissible period-module theorem. Dualize the comparison and apply the correct smooth-invariant period functor. Topological strictness is qualified by Remark 6.7.

Direct prerequisites: [CohomologyComparisons:CP.4/algebraic-beilinson-period-comparison](#algebraic-beilinson-period-comparison), `PadicHodgeTheory:R06.2`.

Acceptance. Weight zero gives Q_p through the φ=1,N=0,Fil⁰ intersection; forgetting the intersection produces B_st instead.

Source: [Pierre Colmez, Wiesława Nizioł, On the cohomology of p-adic analytic spaces, II: The C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Theorem 6.2, equation (6.3), p.40; Remark 6.7, p.41.

<a id="proper-rigid-potential-semistable-comparison"></a>

### Proper rigid C_st comparison over K

Library declaration: `CP4.proper_rigid_potential_semistable_comparison` (theorem).

For X_K proper smooth rigid over K and r≥0, CN Theorem 6.4 gives a natural G_K-equivariant B_st isomorphism H_ét^r(X_C,Q_p)⊗B_st≃H_HK^r(X_C)⊗_{F^{nr}}B_st preserving φ,N and inducing the filtered B_dR comparison. The resulting Galois representation is potentially semistable; the F^{nr} HK object with G_K action is the potential period realization, not a claim of semistability over K without further hypotheses.

Construction and proof. Use the overconvergent syntomic/étale comparison in sufficiently high twists, HK–de Rham finiteness and the Banach–Colmez dimension argument in the proof of Theorem 6.4. These analytic inputs are requests; no semistable model is silently imposed.

Direct prerequisites: `CrystallineCohomology:CR.6`, `CrystallineCohomology:CR.7`, [CohomologyComparisons:CP.3/filtered-de-rham-comparison](#filtered-de-rham-comparison).

Acceptance. For a proper smooth curve, the potential HK module equals D_pst H¹; its Hodge–Tate weights are 0,−1 with HT(χ_p)=+1.

Source: [Pierre Colmez, Wiesława Nizioł, On the cohomology of p-adic analytic spaces, II: The C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Theorem 6.4 and proof, pp.40–41.

Required refinements: [Analytic and algebraic C_st proof suppliers](#G-analytic-cst).

<a id="proper-rigid-c-period-comparison"></a>

### Proper rigid period comparison over C

Library declaration: `CP4.proper_rigid_c_period_comparison` (theorem).

For X proper smooth rigid over C, CN Theorem 6.8 gives a natural φ,N-compatible B_st comparison with H_HK^r(X)⊗_{F^{nr}}B_st, inducing a filtered B_dR comparison with H_dR^r(X/B_dR⁺)⊗B_dR. The latter filtration is Im[H^r(Fil^i K_dR⁺)→H^r(K_dR⁺)], not only the free B_dR⁺ lattice. No G_K action is asserted without descent. This is a separate filtered extension of BMS1 §13; the unfiltered finite-free lattice theorem by itself is not used as a filtered comparison theorem.

Construction and proof. Use the syntomic/étale comparison and the BC dimension proof in Theorem 6.8. Identify its canonical infinitesimal deformation with CP.3. Remark 6.10 explicitly says the earlier BMS1 Theorem 13.1 did not treat filtrations.

Direct prerequisites: `CrystallineCohomology:CR.6`, [CohomologyComparisons:CP.3/canonical-bdr-cohomology](#canonical-bdr-cohomology), [CohomologyComparisons:CP.3/canonical-bdr-etale-comparison](#canonical-bdr-etale-comparison).

Acceptance. Retain the filtered complex; a choice of free cohomology lattice alone cannot encode this filtration.

Source: [Pierre Colmez, Wiesława Nizioł, On the cohomology of p-adic analytic spaces, II: The C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Theorem 6.8 and Remark 6.10, pp.42–43.

Required refinements: [Analytic and algebraic C_st proof suppliers](#G-analytic-cst).

<a id="proper-curve-potential-period-interface"></a>

### Proper-curve potential period interface

Library declaration: `CP4.proper_curve_potential_period_interface` (application).

For a proper smooth curve X_K over a finite extension K/Q_p and X=X_K⊗C, V=H_ét¹(X,Q_p) is potentially semistable with Hodge–Tate weights 0,−1, D_pst(V)≃H_HK¹(X), and Fil¹D_dR(V)≃H⁰(X_K,Ω¹). These are precisely the comparison inputs to CDN Proposition 3.12, not an assertion of semistability over the original K. Its additional identity for the modified HK object uses the fundamental period exact sequence and pro-étale H¹(Ô), owned outside CP.

Construction and proof. Apply the proper rigid comparison, the descended de Rham comparison and degeneration. Record D_pst over the maximal unramified coefficient field with inertia descent; extract the first Hodge piece. Leave the Drinfeld-tower and modified HK functor to its routed owner.

Direct prerequisites: [CohomologyComparisons:CP.4/proper-rigid-potential-semistable-comparison](#proper-rigid-potential-semistable-comparison), [CohomologyComparisons:CP.3/hodge-de-rham-degeneration](#hodge-de-rham-degeneration), `PadicHodgeTheory:R06.2`.

Acceptance. A curve acquiring semistable reduction only after extension has D_pst; it does not justify replacing that object by D_st over K.

Source: [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld : le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf), §3.3, Proposition 3.12 and first proof paragraph, pp.35–36.

Coverage: **planned**. Every target has a node or a preserved supplier interface at target granularity. Planned is a completed planning pass, not proof closure.

Before closure: Early absolute and relative primitive comparison owner; Hyodo–Kato log-base descent and signed transport; Log-prismatic agreement and semistable products; Analytic and algebraic C_st proof suppliers; Missing geometric and enhanced Lean interfaces.

<a id="cp-5"></a>

## CP.5. Integral torsion inequalities and lattice recovery

The smooth geometric applications import AI.5's generic A_inf module and complex algebra. The torsion length bound holds without any freeness assumption. The first lattice-recovery tier has a finite free BKF module and an inclusion in crystalline cohomology; equality uses the additional degree i+1 torsion-free hypothesis. The discrete-base Kisin realization needs an all-weight crystalline-lattice theorem stronger than the current finite-flat/p-divisible stage text. In the semistable branch AI.6 already owns the torsion bounds and functorial lattice, and CP exports their placement in the diagram. Normalized O_K length is divided by e when v(p)=1. The two BMS1 §2 surfaces are central examples: one disproves the converse to crystalline torsion-freeness implying étale freeness; the other disproves a subquotient inference even when the numerical bounds hold.

<a id="crystalline-de-rham-torsionfreeness-equivalence"></a>

### Torsion-freeness of the crystalline and de Rham specializations is equivalent degree by degree

Library declaration: `CP5.crystalline_de_rham_torsionfreeness_equivalence` (theorem).

For proper smooth formal 𝔛/O_C, H_crys^i(𝔛_k/W(k)) is p-torsion-free if and only if H_dR^i(𝔛/O_C) is p-torsion-free; then H_Ainf^i(𝔛) is finite free and H_ét^i(X_C,Z_p) is torsion-free. This is the geometric application of AI.5’s generic complex criterion, not a converse from étale freeness.

The stated hypotheses are C is a complete algebraically closed extension of Q_p; 𝔛 is proper smooth formal over O_C; i≥0.; The actual AI.5 perfect geometric complex and CP.1 specializations, with their finite-presentation/free-after-p hypotheses.

Construction and proof. Import AI.5 Lemma 4.18 and Corollary 4.17, and substitute the two actual derived specializations of CP.1. BMS1 Remarks 14.4 and 14.7 make this geometric deduction.

Direct prerequisites: `AInfCohomology:AI.5`, [CohomologyComparisons:CP.1/theta-de-rham-specialization](#theta-de-rham-specialization), [CohomologyComparisons:CP.1/witt-crystalline-specialization](#witt-crystalline-specialization).

Acceptance. The criterion is degree by degree; no degree i+1 freeness is needed for this equivalence. The Enriques-derived surface of CP.5/enriques-torsion-counterexample has torsion in H_crys² and H_dR² while all integral étale cohomology is free, detecting the invalid reverse implication.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Remarks 14.4 and 14.7, pp.120,122; supplier Lemma 4.18.

<a id="integral-torsion-length-inequality-over-C"></a>

### Crystalline torsion dominates étale torsion over O_C (BMS1 Theorem 14.5(ii))

Library declaration: `CP5.integral_torsion_length_inequality_over_C` (theorem).

Let X be a proper smooth formal scheme over the ring of integers O of a complete algebraically closed extension C of Q_p, with residue field k and generic fibre X, and let i ≥ 0. For all n ≥ 0, length_{W(k)}(H^i_crys(X_k/W(k))_tor/p^n) ≥ length_{Z_p}(H^i_ét(X,Z_p)_tor/p^n). In particular, if H^i_crys(X_k/W(k)) is p-torsion-free then so is H^i_ét(X,Z_p). The argument also gives rank_{W(k)} H^i_crys(X_k/W(k)) = rank_{Z_p} H^i_ét(X,Z_p).

The stated hypotheses are X proper and smooth formal over O_C; C complete algebraically closed over Q_p.; Input package from AInfCohomology:AI.5 (Theorem 14.3): C := RΓ_Ainf(X) perfect with all H^j(C)[1/p] free over A_inf[1/p]; C ⊗^L W(k) ≃ RΓ_crys(X_k/W(k)); C ⊗ A_inf[1/μ] ≃ RΓ_ét(X,Z_p) ⊗ A_inf[1/μ].; No torsion-freeness hypothesis: the inequality holds in every degree.

Construction and proof. M := H^i(C) is finitely presented with M[1/p] free (Corollary 4.17 with Theorem 14.3). Lemma 4.16: M ⊗ W(k) ↪ H^i(C ⊗^L W(k)) = H^i_crys(X_k/W(k)), an isomorphism after inverting p, hence with torsion cokernel; so length(H^i_crys/p^n) ≥ length(M ⊗ W(k)/p^n) by the length-monotonicity lemma, and the ranks agree. Corollary 4.15: rank(M ⊗ W(k)) = rank(M ⊗ W(K♭)) and length_{W(k)}(M ⊗ W(k)/p^n) ≥ length_{W(K♭)}(M ⊗ W(K♭)/p^n). Étale identification (the source cites Theorem 14.1 for this step; details reconstructed): H^i(C)[1/μ] = H^i(C ⊗ A_inf[1/μ]) = H^i_ét(X,Z_p) ⊗_{Z_p} A_inf[1/μ] since localization is exact and A_inf[1/μ] is Z_p-flat; base change along A_inf[1/μ] → W(K♭) (μ a unit in W(K♭)) gives M ⊗ W(K♭) = H^i_ét(X,Z_p) ⊗_{Z_p} W(K♭); as Z_p → W(K♭) is flat with p remaining a uniformizer, length_{W(K♭)}((T ⊗ W(K♭))/p^n) = length_{Z_p}(T/p^n) and ranks agree. Chain the inequalities and subtract n·rank from both ends (ranks equal) to obtain the torsion inequality; the p-torsion-free corollary is the case where the left side vanishes for all n.

Direct prerequisites: `AInfCohomology:AI.5`, [CohomologyComparisons:CP.1/proper-ainf-input-package](#proper-ainf-input-package), [CohomologyComparisons:CP.1/witt-crystalline-specialization](#witt-crystalline-specialization), [CohomologyComparisons:CP.1/mu-inverted-etale-specialization](#mu-inverted-etale-specialization), `mathlib:Module.length`.

Acceptance. n = 0 is trivial; n = 1 gives dim_k(H^i_crys,tor/p) ≥ dim_{F_p}(H^i_ét,tor/p). Elliptic curve with good reduction over O_C: equality of ranks (1,2,1) and no torsion, in both the ordinary and the supersingular case. The two CP.5 counterexamples give a strict inequality for the Enriques-derived surface and distinct elementary divisors for the degenerating-group surface: at n=1 the latter is 1≤2 and at n≥2 it is 2≤2. A subquotient conclusion fails.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 14.5(ii), pp.120–121.

<a id="lattice-recovery-over-C"></a>

### Recovering the crystalline lattice from étale cohomology with its B_dR^+-lattice (BMS1 Theorem 14.5(iii))

Library declaration: `CP5.lattice_recovery_over_C` (theorem).

Let X be proper smooth formal over O = O_C with generic fibre X and i ≥ 0. Tier 1 (hypothesis: H^i_crys(X_k/W(k)) p-torsion-free; then the finitely generated Z_p-module H^i_ét(X,Z_p) is p-torsion-free by part (ii), hence finite free, so the pair below satisfies the hypotheses of Theorem 4.28): H^i_Ainf(X) is a finite free Breuil–Kisin–Fargues module and there is a canonical isomorphism H^i_Ainf(X) ≅ BKF(H^i_ét(X,Z_p)), where BKF(H^i_ét(X,Z_p)) is the finite free BKF module attached by Fargues' equivalence (Theorem 4.28) to the pair (H^i_ét(X,Z_p), H^i_crys(X/B_dR^+) ⊂ H^i_ét(X,Z_p) ⊗ B_dR); moreover H^i_crys(X_k/W(k)) ⊃ BKF(H^i_ét(X,Z_p)) ⊗_{A_inf} W(k), compatibly with φ. Tier 2 (hypothesis: H^i_crys(X_k/W(k)) and H^{i+1}_crys(X_k/W(k)) both p-torsion-free): the inclusion is an equality, so H^i_crys(X_k/W(k)) with its φ-action is recovered from H^i_ét(X,Z_p) with its B_dR^+-lattice.

The stated hypotheses are X proper smooth formal over O_C.; Tier 1: H^i_crys(X_k/W(k)) p-torsion-free (degree i only).; Tier 2: H^{i+1}_crys(X_k/W(k)) p-torsion-free as well (degree i+1) — the source's exact adjacent-degree hypothesis; by Remark 14.7 either hypothesis may be replaced by torsion-freeness of H^i_dR(X), resp. H^{i+1}_dR(X).; Input package (AInfCohomology:AI.5, Theorem 14.3): RΓ_Ainf(X) perfect, φ, comparisons (i),(iii),(iv), all H^j_Ainf(X) BKF modules.; CP.3 input (Theorem 13.1): the B_dR^+-lattice H^i_crys(X/B_dR^+), identified in the good-reduction case with H^i_crys(X_{O/p}/A_crys) ⊗ B_dR^+ (Proposition 13.23; the degreewise identification is displayed in Theorem 14.5(i)).

Construction and proof. Corollary 4.20 (the source's citation; given Theorem 14.3's BKF conclusion, Corollary 4.17 already suffices) with C = RΓ_Ainf(X): H^i_crys(X_k/W(k)) = H^i(C ⊗^L W(k)) p-torsion-free ⇒ H^i(C) = H^i_Ainf(X) finite free; with its φ it is a finite free BKF module. Its Fargues pair (reconstructed from 'the identification of the B_dR^+-lattice in part (i)'; not displayed): T = (H^i_Ainf(X) ⊗ W(C♭))^{φ=1} = H^i_ét(X,Z_p) by Theorem 14.3(iv) and Lemma 4.26 — this uses that comparison (iv) is φ-equivariant for the trivial Frobenius on H^i_ét(X,Z_p), which Theorem 14.3 does not state explicitly; Ξ = H^i_Ainf(X) ⊗ B_dR^+ = H^i_crys(X_{O/p}/A_crys) ⊗ B_dR^+ by Theorem 14.3(iii) (rational coefficients: derived and ordinary tensor agree because the H^j(C)[1/p] are free) = H^i_crys(X/B_dR^+) by the identification in part (i) (Proposition 13.23). Fargues' equivalence (Theorem 4.28; only full faithfulness is needed, Remark 4.29, which proves it directly: faithfulness from Lemma 4.26 and injectivity of A_inf → A_inf[1/μ], fullness by induction on φ^{−r}(μ)^{−1} using the B_dR^+-lattices and Lemma 3.23) gives the canonical isomorphism H^i_Ainf(X) ≅ BKF(H^i_ét(X,Z_p)). Lemma 4.16 gives the φ-compatible injection H^i_Ainf(X) ⊗ W(k) ↪ H^i(C ⊗^L W(k)) = H^i_crys(X_k/W(k)) (Tier 1 inclusion). Tier 2: Corollary 4.20's last clause — if H^{i+1}(C) ⊗ W(k) is p-torsion-free, e.g. if H^{i+1}(C ⊗^L W(k)) = H^{i+1}_crys(X_k/W(k)) is — the injection is bijective.

Direct prerequisites: `AInfCohomology:AI.5`, `AInfCohomology:AI.2`, [CohomologyComparisons:CP.1/proper-ainf-input-package](#proper-ainf-input-package), [CohomologyComparisons:CP.3/good-reduction-bdr-lattice-identification](#good-reduction-bdr-lattice-identification), [CohomologyComparisons:CP.3/integral-rational-bdr-map-agreement](#integral-rational-bdr-map-agreement).

Acceptance. Elliptic curve E over O_C: H^1_crys(E_k/W(k)) is recovered from H^1_ét(E,Z_p) with its B_dR^+-lattice; H^2 is torsion-free so the adjacent condition holds. A test where H^{i+1}_crys has torsion but H^i_crys does not may assert only Tier 1 (the inclusion); the source neither proves equality nor gives an example of a strict inclusion in that case, and the generic Lemma 4.16 example (H^{i+1}(C) with x-torsion) shows only the algebraic mechanism. Test specifications must not force all cohomology to be free (CP.5 acceptance rule).

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 14.5(iii), pp.120–121.

Required refinements: [Explicit map and homotopy agreement](#G-map-agreement).

<a id="dvr-lattice-recovery-via-breuil-kisin"></a>

### Recovering the crystalline lattice from the G_K-lattice over a discretely valued base (BMS1 Theorem 14.6(iii))

Library declaration: `CP5.dvr_lattice_recovery_via_breuil_kisin` (theorem).

Let X be proper smooth formal over O_K, K complete discretely valued over Q_p with perfect residue field k, C a completed algebraic closure with Galois group G_K, X_C the geometric rigid generic fibre, i ≥ 0. Assume H^i_crys(X_k/W(k)) and H^{i+1}_crys(X_k/W(k)) are p-torsion-free. Kisin's functor (Theorem 4.4; it depends on the fixed uniformizer π and roots π^{1/p^n}) attaches to the lattice H^i_ét(X_C,Z_p) in the crystalline G_K-representation H^i_ét(X_C,Q_p) a finite free Breuil–Kisin module BK(H^i_ét(X_C,Z_p)) over S = W(k)[[T]] (written 𝔖 in the source); there is an identification BK(H^i_ét(X_C,Z_p)) ⊗_S B_crys^+ ≅ H^i_crys(X_k/W(k)) ⊗_{W(k)} B_crys^+ (Proposition 4.34 and part (i); S → A_inf sends T to [π♭]^p and is the Frobenius on W(k), §4.4); extending scalars along B_crys^+ → W(k̄)[1/p] gives BK(H^i_ét) ⊗_S W(k)[1/p] ≅ H^i_crys(X_k/W(k))[1/p], where S → W(k) sends T to 0 and is the Frobenius on W(k) (introduction, p.4); and BK(H^i_ét(X_C,Z_p)) ⊗_S W(k) = H^i_crys(X_k/W(k)) as submodules of the common base extension to W(k)[1/p]. Thus H^i_crys(X_k/W(k)) with φ is recovered from H^i_ét(X_C,Z_p) with its G_K-action.

The stated hypotheses are X proper smooth formal over O_K, K/Q_p complete discretely valued, k perfect; a uniformizer π and compatible p-power roots π^{1/p^n} ∈ C fixed (§4.1), defining θ̃: S → O_K (T ↦ π), the element π♭ ∈ C♭, K_∞ and S → A_inf (T ↦ [π♭]^p, Frobenius on W(k)).; Both H^i_crys and H^{i+1}_crys(X_k/W(k)) p-torsion-free (the Theorem 1.1(iii) hypothesis; Remark 14.7 allows H^i_dR(X), H^{i+1}_dR(X) torsion-free instead).; H^i_ét(X_C,Q_p) crystalline (Theorem 14.6(i)) so that Kisin's functor applies.; External: Theorem 4.4 — existence and the identification M(T) ⊗_S W(C♭) ≅ T ⊗ W(C♭) from Kisin [49, Theorem 1.2.1]; uniqueness through [48, Proposition 2.1.12] and the equivalence between finite free φ-modules over S[1/T]^∧_p and finite free Z_p-modules with G_{K_∞}-action ([44, Proposition 4.1.1] or [35, Proposition 2.32]), with the implicit full faithfulness of restriction from crystalline G_K-representations to G_{K_∞}-representations; Proposition 4.34 — proof is one sentence: it 'follows from Kisin's construction of M(T), which starts with the crystalline side and an isomorphism between M(T) and D_crys(V) ⊗ S[1/p] on some rigid-analytic open of the generic fibre of Spf S, cf. [48, Section 1.2, Lemma 1.2.6]' (original Kisin proof is the exact G-kisin supplier gap).

Construction and proof. Apply Theorem 14.5(iii) to X_{O_C} (residue field k̄): under torsion-freeness of H^i_crys and H^{i+1}_crys of X_{k̄} (base change of the hypotheses along k → k̄; import), H^i_crys(X_{k̄}/W(k̄)) = BKF(H^i_ét(X_C,Z_p)) ⊗_{A_inf} W(k̄), with the B_dR^+-lattice H^i_crys(X_C/B_dR^+) = H^i_dR(X/K) ⊗_K B_dR^+ (Remark 13.20) = D_dR(V) ⊗_K B_dR^+ (Theorem 5.1). Proposition 4.34 (restated geometrically in Remark 5.2: BKF(H^i_ét) = BK(H^i_ét) ⊗_S A_inf): under Fargues' classification BK(T) ⊗_S A_inf corresponds to the pair (T, D_dR(V) ⊗_K B_dR^+); by full faithfulness (Remark 4.29) BK(H^i_ét) ⊗_S A_inf ≅ BKF(H^i_ét) = H^i_Ainf(X_{O_C}). The identification BK ⊗_S B_crys^+ ≅ H^i_crys(X_k/W(k)) ⊗ B_crys^+ is Proposition 4.34's equality M(T) ⊗_S B_crys^+ = D_crys(V) ⊗ B_crys^+ combined with part (i) (D_crys(V) = H^i_crys(X_k/W(k))[1/p]); extending scalars along B_crys^+ → W(k̄)[1/p] (the Witt reduction A_inf → W(k̄) carries ξ to p and so extends to A_crys, introduction p.4) and taking G_{K_∞}-invariants as in Remark 4.5 gives BK ⊗_S W(k)[1/p] = H^i_crys[1/p], for the map S → W(k) with T ↦ 0 and Frobenius on W(k). Equality of lattices: BK ⊗_S W(k̄) = H^i_crys(X_k/W(k)) ⊗_{W(k)} W(k̄) inside the common W(k̄)[1/p]-space (step 1 with base change of crystalline cohomology along k → k̄); descend to W(k) by faithful flatness of W(k) → W(k̄) (reconstructed; the source states 'part (iii) follows from Theorem 14.5(iii) and Proposition 4.34').

Direct prerequisites: `AInfCohomology:AI.2`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, [CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base](#crystalline-comparison-over-discretely-valued-base), [CohomologyComparisons:CP.5/lattice-recovery-over-C](#lattice-recovery-over-C), [CohomologyComparisons:CP.0/twist-frobenius-filtration-normalization](#twist-frobenius-filtration-normalization), `CrystallineCohomology:CR.3`.

Acceptance. Good-reduction elliptic curve over O_K: BK(H^1_ét(E_C,Z_p)) ⊗_S W(k) equals the Dieudonné module H^1_crys(E_k/W(k)). The hypothesis in degree i+1 is retained: a case with torsion in H^{i+1}_crys is not covered by this statement (only the Tier 1 inclusion over C). Consistency on Tate twists: Z_p(1) ↦ S{1} (Corollary 4.33, confirmed in the public source: S{1} ⊗_S A_inf ≅ A_inf{1} compatibly with G_{K_∞}, and A_inf{1} = μ^{−1}(Z_p(1) ⊗ A_inf)) versus A_inf{1} (Example 4.24).

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 14.6(iii) and proof, pp.121–122.

Required refinements: [All-weight crystalline-lattice Kisin scope](#G-kisin).

<a id="dvr-torsion-length-inequality"></a>

### Torsion inequality over a discretely valued base (BMS1 Theorem 14.6(ii))

Library declaration: `CP5.dvr_torsion_length_inequality` (theorem).

With X proper smooth formal over O_K as in Theorem 14.6 and X_C its geometric generic fibre: for all n ≥ 0, length_{W(k)}(H^i_crys(X_k/W(k))_tor/p^n) ≥ length_{Z_p}(H^i_ét(X_C,Z_p)_tor/p^n); in particular H^i_crys(X_k/W(k)) p-torsion-free implies H^i_ét(X_C,Z_p) p-torsion-free (the converse fails, §2.1).

The stated hypotheses are X proper smooth formal over O_K, K complete discretely valued with perfect residue field k; no torsion hypothesis.

Construction and proof. The base change X_{O_C} is proper smooth formal over O_C with special fibre X_{k̄}; Theorem 14.5(ii) gives the inequality with W(k̄)-lengths of H^i_crys(X_{k̄}/W(k̄))_tor. Reconstructed (the source says 'immediate'): RΓ_crys(X_{k̄}/W(k̄)) ≃ RΓ_crys(X_k/W(k)) ⊗^L_{W(k)} W(k̄) by crystalline base change along the perfect extension k → k̄ (import: CrystallineCohomology CR.3); W(k) → W(k̄) is flat with p a uniformizer on both sides, so torsion submodules and their lengths modulo p^n are preserved.

Direct prerequisites: [CohomologyComparisons:CP.5/integral-torsion-length-inequality-over-C](#integral-torsion-length-inequality-over-C), `CrystallineCohomology:CR.3`, `mathlib:Module.length`.

Acceptance. Same examples as the O_C statement; the inequality is independent of the choice of C.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 14.6(ii), pp.121–122.

<a id="mod-p-de-rham-dimension-bound"></a>

### Mod-p de Rham dimension bounds mod-p étale dimension (BMS1 inequality (1))

Library declaration: `CP5.mod_p_de_rham_dimension_bound` (theorem).

For X proper smooth formal over O_K as in Theorem 1.1, dim_k H^i_dR(X_k) ≥ dim_{F_p} H^i_ét(X_C, F_p) for every i.

The stated hypotheses are X proper smooth formal over O_K, K complete discretely valued with perfect residue field.; Universal-coefficient identifications RΓ_crys(X_k/W(k)) ⊗^L_{W(k)} k ≃ RΓ_dR(X_k/k) (reduction of crystalline cohomology to the residue field — CrystallineCohomology CR.3's 'compatible reductions' together with the crystalline–de Rham comparison of CR.2) and RΓ_ét(X_C,Z_p) ⊗^L_{Z_p} F_p ≃ RΓ_ét(X_C,F_p), with the H^j_ét(X_C,Z_p) finitely generated (Theorem 5.1) so that all dimensions are finite.

Construction and proof. The source states (1) as implied by Theorem 1.1(ii) without displaying the argument; reconstruction: universal coefficients give dim_k H^i_dR(X_k) = dim_k(H^i_crys/p) + dim_k(H^{i+1}_crys[p]) and dim_{F_p} H^i_ét(X_C,F_p) = dim(H^i_ét(Z_p)/p) + dim(H^{i+1}_ét(Z_p)[p]). Theorem 14.6(ii) with n = 1 in degree i, together with rank equality, gives dim_k(H^i_crys/p) ≥ dim_{F_p}(H^i_ét/p). Theorem 14.6(ii) with n = 1 in degree i+1 gives dim_k(H^{i+1}_crys[p]) = length(H^{i+1}_crys,tor/p) ≥ length(H^{i+1}_ét,tor/p) = dim_{F_p}(H^{i+1}_ét[p]) (for finite-length modules over a DVR the length of the p-kernel equals the length modulo p). Add the two inequalities. The argument uses the torsion inequality in the adjacent degrees i and i+1.

Direct prerequisites: [CohomologyComparisons:CP.5/dvr-torsion-length-inequality](#dvr-torsion-length-inequality), `CrystallineCohomology:CR.3`, `AInfCohomology:AI.5`, `mathlib:Module.finrank`.

Acceptance. Elliptic curve: equalities 1, 2, 1 in degrees 0, 1, 2. Remark 2.11 (p.16): for the Theorem 2.10 surface H over a ramified O, H^1_ét(H_C, Z/p) ≅ Z/p while H^1_dR(H_k) ≅ k ⊕ k, so (1) — 'the inequality ... coming from Theorem 1.1 (ii)' — can be strict. For the Theorem 2.1 surface over Z_2 the universal-coefficient count makes (1) strict in degrees 1 and 2 (packet-authored consequence). Remark 1.2 (p.3): for an Enriques surface S_k over a perfect field of characteristic 2, lifted to characteristic 0 (possible by [25, 52]), the lift has H^1_ét(S_C, F_2) ≅ F_2, so (1) forces H^1_dR(S_k) ≠ 0 — the non-vanishing first observed via [42, Corollaire 7.3.4 (a)].

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 1.1 and inequality (1), pp.2–3.

<a id="semistable-crystalline-torsion-export"></a>

### Semistable log crystalline torsion export

Library declaration: `CP5.semistable_crystalline_torsion_export` (application).

Under the AI.6 proper semistable hypotheses, import CK Theorem 7.9: for every i∈Z and n≥0, length_Zp(H_ét^i(X_C,Z_p)_tor/p^n)≤length_W(k)(H_logcrys^i(X_k/W(k))_tor/p^n), and length_Zp H_ét^i(X_C,Z/p^n)≤length_W(k) H_logcrys^i(X_k/W_n(k)). CP places these in the common diagram and records the rank equality needed to pass between full and torsion quotients.

Construction and proof. Use AI.6/crystalline-torsion and rank-equality without redeveloping their generic AI.5 proof. The finite coefficient inequality uses universal coefficients in both adjacent degrees.

Direct prerequisites: `AInfCohomology:AI.6/crystalline-torsion`, `AInfCohomology:AI.6/rank-equality`, `AInfCohomology:AI.6/degreewise-specializations`, [CohomologyComparisons:CP.4/logarithmic-integral-diagram](#logarithmic-integral-diagram).

Acceptance. At n=0 both sides vanish. For n=1 both adjacent-degree Tor contributions must be kept.

Source: [Kęstutis Česnavičius, Teruhisa Koshikawa, The A_inf-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145), Theorem 7.9 and proof, p.70.

<a id="semistable-normalized-de-rham-torsion-export"></a>

### Normalized log de Rham torsion export

Library declaration: `CP5.semistable_normalized_de_rham_torsion_export` (application).

Import CK Theorem 7.12 with v(p)=1: v_Zp(H_ét^i(Z_p)_tor/p^n)≤v_OC(H_logdR^i(𝔛/O_C)_tor/p^n), including the finite-coefficient log de Rham inequality. For a discrete O_K of absolute ramification e, normalized torsion length is ordinary O_K length divided by e; it is not unscaled module length. The definition via the valuation of Fitt₀ and its scalar-extension invariance belong to AI.5/AI.6.

Construction and proof. Use AI.6/de-rham-torsion and CK §7.10 normalization, which follows the valuation-ring structure theorem. The geometric bound uses the ξ-specialization sequence in degree i and i+1; import CK Lemma 7.11 from the generic linear-algebra owner.

Direct prerequisites: `AInfCohomology:AI.6/de-rham-torsion`, `AInfCohomology:AI.6/degreewise-specializations`, `AInfCohomology:AI.5`, [CohomologyComparisons:CP.4/logarithmic-integral-diagram](#logarithmic-integral-diagram).

Acceptance. For O_K/(π), normalized length is 1/e; for O_K/(p), it is 1.

Source: [Kęstutis Česnavičius, Teruhisa Koshikawa, The A_inf-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145), §7.10, Lemma 7.11 and Theorem 7.12, p.71.

<a id="functorial-log-de-rham-lattice-export"></a>

### Functorial log de Rham lattice export

Library declaration: `CP5.functorial_log_de_rham_lattice_export` (application).

Import AI.6’s M(T) from the pair (T,D_dR(T)⊗B_dR⁺) and L_dR(T)=(M(T)⊗_{A_inf,θ}O_C)^{G_K}. For a proper flat semistable model with H_logdR^i and H_logdR^{i+1} both O_K-free, AI.6/model-independent-lattice gives L_dR(H_ét^i)=H_logdR^i inside H_dR^i(X_K). Thus the comparison identifies the lattice functorially and independently of such a model. It does not claim equality after dropping either adjacent-degree condition.

Construction and proof. Use the supplier’s construction, CK Theorem 8.7 and Remark 8.8, together with CP.3’s descended lattice map. The pair’s B_dR⁺ lattice is D_dR(T)⊗B_dR⁺, not T⊗B_dR⁺. Do not assert invariants commute with all integral scalar extensions.

Direct prerequisites: `AInfCohomology:AI.6/de-rham-lattice-functor`, `AInfCohomology:AI.6/model-independent-lattice`, [CohomologyComparisons:CP.3/descended-de-rham-lattice](#descended-de-rham-lattice), [CohomologyComparisons:CP.4/semistable-filtered-bdr-agreement](#semistable-filtered-bdr-agreement).

Acceptance. Use the supplier’s trivial, cyclotomic and ramified-character tests. The ramified test detects a strict inclusion L_dR(T)⊗O_C⊂M(T)_dR.

Source: [Kęstutis Česnavičius, Teruhisa Koshikawa, The A_inf-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145), §8.5–8.6, pp.73–74; Theorem 8.7 and Remark 8.8, p.74.

<a id="small-weight-integral-interface"></a>

### Small-weight integral arithmetic interface

Library declaration: `CP5.small_weight_integral_interface` (application).

For K absolutely unramified (e=1), after a common Tate shift restrict the Fontaine–Laffaille filtration indices to [0,p−2] for unrestricted torsion full faithfulness. The interval [0,p−1] requires the precise restricted subcategories of Fontaine–Laffaille §0.9/§6 excluding the specified endpoint subobjects or quotients; at p=2 the unrestricted safe interval is [0,0]. For the Breuil–Kisin alternative use R07.4’s separately proved height/ramification and dyadic hypotheses. In either case compare the supplied geometric realization with CP.5’s actual lattice, using the Kummer tower and the Frobenius-twisted S specialization. No classification is owned here.

Construction and proof. Import the exact R07.3 Fontaine–Laffaille equivalence in its stated range, R07.4’s crystalline lattice functor and R06.4’s covariance/weight translation. Compare their realization maps with CP.5 lattice recovery. The all-weight Kisin lattice comparison used in BMS1 Theorem 14.6(iii) needs a scope extension of the current R07.4 text, which only promises finite-flat/p-divisible classification.

Direct prerequisites: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `PadicHodgeTheory:R06.4`, [CohomologyComparisons:CP.5/dvr-lattice-recovery-via-breuil-kisin](#dvr-lattice-recovery-via-breuil-kisin).

Acceptance. A weight interval must appear in the final imported theorem; “small weight” alone is not a hypothesis.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), §4.4, pp.43–44; Theorem 14.6(iii), p.121.

Required refinements: [All-weight crystalline-lattice Kisin scope](#G-kisin).

<a id="enriques-torsion-counterexample"></a>

### Enriques torsion counterexample

Library declaration: `CP5.enriques_torsion_counterexample` (theorem).

BMS1 Theorem 2.1 constructs a smooth projective geometrically connected surface over Z₂ with all geometric generic-fibre integral étale groups free and H_crys² of the special fibre having torsion F₂. The proof uses a singular Enriques surface S/Z₂ with Pic^τ=μ₂, a K3 double cover and an ordinary elliptic curve: a generically nontrivial Z/2→μ₂→E becomes zero in the special fibre, producing an E-torsor threefold D; a sufficiently ample smooth hypersurface gives the surface.

Construction and proof. Follow Proposition 2.2’s π₁ and crystalline Künneth computations. Import Lang–Ogus liftability and Illusie’s Enriques crystalline computation; finite-field Bertini, étale cohomological bounds and crystalline weak Lefschetz (Lemma 2.12) are named supplier inputs. They were not proved by the comparison theorem.

Direct prerequisites: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `CrystallineCohomology:CR.3`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`.

Acceptance. Crystalline torsion-free implies étale torsion-free, but the reverse implication fails even for smooth projective surfaces.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 2.1 and Proposition 2.2 with proofs, pp.13–15.

Required refinements: [Geometric counterexample imported existence inputs](#G-counterexamples).

<a id="degenerating-group-torsion-counterexample"></a>

### Degenerating torsion counterexample

Library declaration: `CP5.degenerating_group_torsion_counterexample` (theorem).

For the BMS1 Theorem 2.10 smooth projective surface H/O_C, H_ét²(H_C,Z_p)_tor≃Z/p² while H_crys²(H_k/W(k))_tor≃k⊕k. Hence étale torsion need not be a subquotient of crystalline torsion despite all-n length inequalities. The construction starts with the flat closure G of a p²-torsion point in a supersingular elliptic curve, G_C≃Z/p² and G_k=E_k[p]; approximate BG by a projective quotient with bad stabilizer locus of codimension >2.

Construction and proof. Import R07.1’s flat closure and finite-flat quotient results corresponding to Lemmas 2.5,2.7,2.9. A general surface avoids the bad locus by Bertini. Étale Leray gives H²(Z/p²,Z_p); crystalline Leray of the E-torsor yields the cokernel of multiplication by p on rank-two H_crys¹(E), using the weakened weak Lefschetz Lemma 2.12.

Direct prerequisites: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `CrystallineCohomology:CR.3`.

Acceptance. At n=1 the length bound is strict: 1≤2. At n≥2 total lengths agree: 2=2. The elementary-divisor types still differ.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Lemmas 2.5,2.7,2.9 and Theorem 2.10 proof, pp.15–17.

Required refinements: [Geometric counterexample imported existence inputs](#G-counterexamples).

<a id="special-fibre-does-not-determine-integral-etale"></a>

### Special-fibre non-determination

Library declaration: `CP5.special_fibre_does_not_determine_integral_etale` (application).

The two Z₂ lifts D and D′=S×E of the same smooth projective special fibre S_k×E_k in BMS1 Remark 2.4 have different generic-fibre H_ét² torsion. Therefore neither integral generic étale torsion nor RΓ_Ainf, even modulo p, is a functor only of the special fibre. This prevents replacing the formal model in the CP.1 diagram by its residue scheme.

Construction and proof. Use the E-torsor construction and Proposition 2.2 for D, and the product/Künneth computation for D′. The finite-flat map degenerates, while the special fibre is unchanged; record the result as a geometric obstruction, not a new cohomology construction.

Direct prerequisites: [CohomologyComparisons:CP.5/enriques-torsion-counterexample](#enriques-torsion-counterexample), `CrystallineCohomology:CR.3`.

Acceptance. Any proposed integral comparison depending only on X_k fails this pair of lifts.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Remark 2.4, p.15.

Required refinements: [Geometric counterexample imported existence inputs](#G-counterexamples).

Coverage: **planned**. Every target has a node or a preserved supplier interface at target granularity. Planned is a completed planning pass, not proof closure.

Before closure: Explicit map and homotopy agreement; All-weight crystalline-lattice Kisin scope; Geometric counterexample imported existence inputs.

<a id="cp-6"></a>

## CP.6. Reusable coefficient, product and arithmetic exports

The reusable output is compatibility of the constructed maps, including the scalar and twist normalizations. Betts–Stix Proposition 3.19 gives cup, naturality, finite base change and product compatibility for its specific de Rham map. Proposition 3.20 normalizes a:B_dR(−1)≃B_dR⟨−1⟩ by the P¹ trace, then obtains duality, cycles and Chern classes. Its Remark 3.21 does not prove that a equals the canonical Fontaine choice. The manuscript's final Chern proof uses a nonproper total space after a proper cycle theorem; the required proper projective-compactification proof is an explicit gap. Crystalline/prismatic Chern classes remain PR.4 inputs, étale Gysin/cycles EDC inputs, the cyclotomic Chern character an RT input and Habiro q-gluing an HQ.8 result. Pan's adapters retain almost coefficients, bounded torsion, inverse-limit control, analytic-vector hypotheses and the truncated-period flatness induction. Arithmetic consumers receive these maps with their hypothesis sets, never an unrestricted regulator or an arbitrary classification theorem.

<a id="naturality-base-change-and-cup-products"></a>

### Naturality, scalar extension and cup products

Library declaration: `CP6.naturality_base_change_and_cup_products` (theorem).

For smooth proper algebraic X/K and the CP.3 de Rham comparison c_dR, the total isomorphism is a graded B_dR-algebra map, natural for morphisms of such varieties and compatible with finite extension K′/K inside C. It commutes with the Künneth external product for X×_K Y. Integral/crystalline/prismatic enhancements have the exact same compatibility only in the source scopes of the CP.1 multiplicative maps and the supplied completed tensor/Künneth theorems. In particular this does not make CK’s semistable A_cris map multiplicative without further proof.

Construction and proof. Betts–Stix Proposition 3.19 obtains (1)–(3) from the ring-valued filtered connection comparison and obtains Künneth from the two projections. Identify that map with CP.3 through the recorded map-agreement target. For integral enhancements use the actual local cup maps, the CP.1 Bockstein coherence and the supplier Künneth statement.

Direct prerequisites: [CohomologyComparisons:CP.3/filtered-de-rham-comparison](#filtered-de-rham-comparison), [CohomologyComparisons:CP.3/integral-rational-bdr-map-agreement](#integral-rational-bdr-map-agreement), [CohomologyComparisons:CP.1/multiplicative-bockstein-coherence](#multiplicative-bockstein-coherence), `EnhancedDerivedSheaves:E4`, `ClassicalAdicEtaleCohomology:H5`.

Acceptance. On P¹×P¹ the two degree-two hyperplane classes give their product in degree four. Finite scalar extension must commute with both projection pullbacks.

Source: [L. Alexander Betts, Jakob Stix, Galois sections and p-adic period mappings](https://www.math.uni-frankfurt.de/~stix/research/preprints/BETTS_STIX-GaloisSectionsPadicPeriods20220429.pdf), Proposition 3.19, p.27.

Required refinements: [Explicit map and homotopy agreement](#G-map-agreement), [Log-prismatic agreement and semistable products](#G-log-products).

<a id="trace-normalized-tate-period"></a>

### Trace-normalized Tate period

Library declaration: `CP6.trace_normalized_tate_period` (theorem).

For the specific c_dR in Betts–Stix, there is a unique G_K-equivariant filtered B_dR-linear isomorphism a:B_dR(−1)≃B_dR⟨−1⟩ making the trace square commute on P¹. Here Fil^i(V⟨n⟩)=Fil^{i+n}V. For smooth proper geometrically connected X/K of dimension d, the étale trace to Q_p(−d) and de Rham trace to K⟨−d⟩ commute with c_dR and a^{⊗d}. Equality of a with the canonical Fontaine period is not asserted: Remark 3.21 explicitly leaves it unproved.

Construction and proof. Normalize on P¹, transport along finite extensions, and prove the product (P¹)^d case by Künneth. Use a common generically finite alteration/morphism and degree compatibility of both traces to obtain the general case. Require the supplier trace normalizations, a nonzero degree over characteristic zero and geometrically connectedness.

Direct prerequisites: [CohomologyComparisons:CP.6/naturality-base-change-and-cup-products](#naturality-base-change-and-cup-products), `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`, `CrystallineCohomology:CR.3:duality`, `AlgebraicModuliForArithmeticGeometry:R09.7`.

Acceptance. The fundamental class of P¹ has trace 1 on both sides after a, detecting an arbitrary scalar rescaling of c_dR.

Source: [L. Alexander Betts, Jakob Stix, Galois sections and p-adic period mappings](https://www.math.uni-frankfurt.de/~stix/research/preprints/BETTS_STIX-GaloisSectionsPadicPeriods20220429.pdf), Proposition 3.20(5) and proof; Remark 3.21, pp.27–28.

Required refinements: [Chern class owners and proper compactification proof](#G-chern).

<a id="duality-and-cycle-class-compatibility"></a>

### Duality, cycles and Gysin compatibility

Library declaration: `CP6.duality_and_cycle_class_compatibility` (theorem).

For X smooth proper geometrically connected of dimension d over K, c_dR and a^{⊗d} identify the perfect Poincaré pairings in degrees i and 2d−i. For a codimension-r algebraic cycle Z, (c_dR⊗a^{⊗−r})cl_ét(Z)=cl_dR(Z) in H_dR^{2r}(X)⟨r⟩⊗B_dR. Proper pushforward and regular-immersion Gysin commute in the duality/purity range supplied by EDC.3 and the crystalline owner. No arbitrary nonproper trace is inferred.

Construction and proof. Proposition 3.20(6) uses cup and trace. Resolve integral Z in characteristic zero; its cycle class is characterized by pairing with test classes and the trace of their pullback to the resolution. Transport via naturality and the perfect pairing. Gysin compatibility follows by that adjunction in the stated proper range, using supplier purity, not a newly defined cycle theory.

Direct prerequisites: [CohomologyComparisons:CP.6/trace-normalized-tate-period](#trace-normalized-tate-period), [CohomologyComparisons:CP.6/naturality-base-change-and-cup-products](#naturality-base-change-and-cup-products), `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `EtaleDualityAndPerverseSheaves:EDC.3`, `CrystallineCohomology:CR.3:duality`, `AlgebraicModuliForArithmeticGeometry:R09.7`.

Acceptance. On P¹ the class of a K-rational point maps to the degree-one de Rham class with the a^{-1} twist. A codimension-r pushforward has degree shift 2r and Tate twist r.

Source: [L. Alexander Betts, Jakob Stix, Galois sections and p-adic period mappings](https://www.math.uni-frankfurt.de/~stix/research/preprints/BETTS_STIX-GaloisSectionsPadicPeriods20220429.pdf), Proposition 3.20(6)–(7) and proof, pp.27–28.

<a id="first-chern-class-comparison"></a>

### First Chern class comparison

Library declaration: `CP6.first_chern_class_comparison` (theorem).

For a line bundle L on smooth proper X/K or a smooth proper formal model in the common crystalline/prismatic range, compare its étale Kummer c₁∈H²_ét(X_C,Q_p(1)), de Rham dlog c₁∈Fil¹H²_dR(X), crystalline PD c₁ and prismatic logarithmic c₁ with their supplied twist objects. The de Rham rational map uses c_dR⊗a^{-1}; the crystalline and prismatic maps use the precise Frobenius-linearized comparisons. Claims about the canonical t-normalization or unrestricted integral semistable cup maps remain separate gaps.

Construction and proof. Check the Kummer-to-dlog cocycle square in the supplier Poincaré resolution. For the proper cycle proof replace the nonproper total-space argument at the end of Betts–Stix Proposition 3.20 by the projective compactification P(O⊕L), its zero/infinity section Gysin classes and the projective-bundle formula, then pull back to X. PR.4 supplies the prismatic/syntomic/crystalline Chern constructions; CP compares them and does not define a second Chern class.

Direct prerequisites: [CohomologyComparisons:CP.6/duality-and-cycle-class-compatibility](#duality-and-cycle-class-compatibility), [CohomologyComparisons:CP.1/prismatic-frobenius-pullback-comparison](#prismatic-frobenius-pullback-comparison), [CohomologyComparisons:CP.1/crystalline-de-rham-overlap-square](#crystalline-de-rham-overlap-square), `EtaleDualityAndPerverseSheaves:EDC.3`, `EtaleDualityAndPerverseSheaves:EDC.4`, `PrismaticCohomology:PR.4`, `PadicHodgeTheory:P8:local-rational`.

Acceptance. c₁(O)=0 and c₁(O(1)) on P¹ has trace 1 after the stated twist. Check additivity for L⊗M; forgetting the Tate/filtration shift fails the P¹ test.

Source: [L. Alexander Betts, Jakob Stix, Galois sections and p-adic period mappings](https://www.math.uni-frankfurt.de/~stix/research/preprints/BETTS_STIX-GaloisSectionsPadicPeriods20220429.pdf), Proposition 3.20(8), final proof paragraph, p.28.

Required refinements: [Chern class owners and proper compactification proof](#G-chern).

<a id="higher-chern-and-projective-bundle-comparison"></a>

### Higher Chern and projective bundle comparison

Library declaration: `CP6.higher_chern_and_projective_bundle_comparison` (theorem).

For a vector bundle E of rank n on smooth proper X in the common range, identify each supplied c_r(E) under the same comparisons with twist r. On the complete flag bundle, the classes are the elementary symmetric polynomials in the line-quotient c₁’s; the iterated projective-bundle formula makes pullback injective. Thus the higher-class statement descends to X. Preserve the projective-bundle relation and its sign convention as provided by EDC.4 and PR.4.

Construction and proof. Use splitting after the flag-bundle pullback, naturality and the c₁ comparison; use the injective summand from the projective-bundle formula to descend. Betts–Stix invokes Grothendieck’s formalism without proving these inputs. The crystalline/prismatic splitting API is an exact request.

Direct prerequisites: [CohomologyComparisons:CP.6/first-chern-class-comparison](#first-chern-class-comparison), [CohomologyComparisons:CP.6/naturality-base-change-and-cup-products](#naturality-base-change-and-cup-products), `EtaleDualityAndPerverseSheaves:EDC.4`, `PrismaticCohomology:PR.4`, `CrystallineCohomology:CR.3`.

Acceptance. For O(1)⊕O(1) on P², c₂=h² and c₁=2h. A rank-one test alone does not detect a wrong higher-class convention.

Source: [L. Alexander Betts, Jakob Stix, Galois sections and p-adic period mappings](https://www.math.uni-frankfurt.de/~stix/research/preprints/BETTS_STIX-GaloisSectionsPadicPeriods20220429.pdf), Proposition 3.20(8) and proof, p.28.

Required refinements: [Chern class owners and proper compactification proof](#G-chern).

<a id="geometric-arithmetic-export"></a>

### Geometric arithmetic export

Library declaration: `CP6.geometric_arithmetic_export` (application).

Return the actual comparison maps and their φ,N,G_K,filtration,duality and twist data to R06.6, R07 and AutomorphicGaloisRepresentationsPartII. Smooth proper good reduction supplies crystalline realizations; a proper semistable model supplies semistable realizations; a proper smooth rigid space over K supplies the potential realization in CP.4. The export does not make all de Rham representations crystalline. Small-weight integral consumers retain R07.3’s unramified base, interval and endpoint restrictions and R07.4’s height/ramification hypotheses.

Construction and proof. Apply R06.2’s period invariants to the geometric comparisons already constructed; compose the CP.5 integral realization when its adjacent-degree freeness holds. R06.5–R06.6 are consumers, never prerequisites of CP.4. The return links specify these maps, rather than postulating a representation with the desired realization.

Direct prerequisites: [CohomologyComparisons:CP.2/period-invariants-and-admissibility](#period-invariants-and-admissibility), [CohomologyComparisons:CP.4/semistable-period-comparison](#semistable-period-comparison), [CohomologyComparisons:CP.4/proper-rigid-potential-semistable-comparison](#proper-rigid-potential-semistable-comparison), [CohomologyComparisons:CP.5/small-weight-integral-interface](#small-weight-integral-interface), [CohomologyComparisons:CP.6/duality-and-cycle-class-compatibility](#duality-and-cycle-class-compatibility).

Acceptance. Good reduction has N=0. A Tate curve has N≠0 and needs B_st. Compare the dual representation with its cohomological pairing and dimension twist.

Source: [Pierre Colmez, Wiesława Nizioł, On the cohomology of p-adic analytic spaces, II: The C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), Theorems 6.4,6.8 and proof, pp.40–43.

<a id="habiro-and-trace-specialization-export"></a>

### Habiro and trace specialization export

Library declaration: `CP6.habiro_and_trace_specialization_export` (application).

Export the CP.0 normalization and CP.1/CP.6 commutative maps to HQ.8 for its own q=1, p-adic and cyclotomic specialization diagrams. The consumer records the base prism/perfectoid ring, completion ideal, inversions, filtration and BK/Tate twists and proves q-gluing compatibility in the intersection of the source hypotheses. RefinedTraceMethods owns the cyclotomic Chern character and its trace-to-prismatic map; CP supplies the class-comparison diagram into which that character maps. No unconditional analytic/algebraic Habiro equivalence or identification before base change is claimed.

Construction and proof. Provide the already constructed coefficient and Chern maps as interface data. HQ.8 proves its global gluing square and RT proves the cyclotomic character square. These are return uses, not dependencies on the completed consumer theorem; register missing supplier character normalization as a gap for the consumer’s scope extension.

Direct prerequisites: [CohomologyComparisons:CP.0/ainf-specialization-dictionary](#ainf-specialization-dictionary), [CohomologyComparisons:CP.1/prismatic-frobenius-pullback-comparison](#prismatic-frobenius-pullback-comparison), [CohomologyComparisons:CP.6/first-chern-class-comparison](#first-chern-class-comparison), [CohomologyComparisons:CP.6/higher-chern-and-projective-bundle-comparison](#higher-chern-and-projective-bundle-comparison).

Acceptance. At q=1 retain derived specialization and Hodge completion. A p-adic localization is a map losing integral information, not an equivalence on the original Habiro coefficient category.

Source: [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3), Theorem 14.1, p.118; specialization diagram §1.2, pp.6–8.

Required refinements: [Trace character and Habiro return interfaces](#G-exports).

<a id="pan-graded-analytic-decompletion"></a>

### Graded analytic vectors and decompletion

Library declaration: `CP6.pan_graded_analytic_decompletion` (theorem).

In Pan’s modular-curve tower and basis U∈B, suppose G_K acts on O B_dR,k⁺(U) for some finite K/Q_p. For i≥0, k>i and l>0, taking gr^i commutes with GL₂(Q_p)-locally analytic vectors, with the χ̃_l isotypic subspace, and with the decompleted G_{K∞}-fixed/G_K-analytic subspace. The i-th symmetric power of the log Faltings extension filters the latter by j=0,…,i with graded pieces O_{K^p}^{la,χ̃_l}(U)_K(j)⊗_{O_{V₀}}Ω¹_{V₀}(C)^{⊗(i−j)}. The stabilized gr^i is independent of k>i; ordinary fixed vectors without the analytic/decompletion condition are not substituted.

Construction and proof. Import the logarithmic period sheaf, Faltings extension and Poincaré lemma from T6:comparison, their analytic-vector exactness and decompletion for this tower, and Pan’s earlier LB-space arguments. Proposition 6.3.9 states the three maps, not commutation of every inverse limit with every analytic-vector functor.

Direct prerequisites: `HodgeTateAndCanonicalSubgroups:T6:comparison`, `HodgeTateAndCanonicalSubgroups:T6:log-sites`, `CompletedCohomologyPartII:CC.8`.

Acceptance. For i=0 the only graded factor is O_{K^p}(U)_K; for i=1 there are the j=0 differential and j=1 cyclotomic pieces. The cutoff k>i must be tested.

Source: [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1), Proposition 6.3.9 and preceding paragraph, pp.101–102.

Required refinements: [Pan early tower and analytic control](#G-pan).

<a id="pan-bounded-torsion-inverse-limit"></a>

### Bounded torsion in truncated coefficients

Library declaration: `CP6.pan_bounded_torsion_inverse_limit` (theorem).

For each degree i and k≥1, H^i(X_{K^p},A_inf,X^a/(ker θ)^k) has p-primary torsion killed by p^n for some n depending on i,k, and is the inverse limit of H^i(X_{K^p},A_inf,X^a/((ker θ)^k,p^m)). The almost coefficient category and p-completion are retained. There is no uniform bound in every k or every degree.

Construction and proof. Pan Lemma 7.2.5 starts from Pan22 Corollary 4.4.3 for k=1. Induct on k with multiplication by a chosen generator of ker θ; the quotient is p-torsion-free. In the cohomology coefficient exact sequence, transitions on H^{i+1}[p^m] are multiplication by p, so bounded torsion kills the inverse Tate module. Import completeness/control from CC.2 with its hypotheses.

Direct prerequisites: `CompletedCohomologyPartII:CC.2`, `CompletedCohomologyPartII:CC.8`, `AInfCohomology:AI.3`, `PerfectoidSpaces:P3`.

Acceptance. For k=1 recover the almost O_C completed-cohomology comparison. The inverse Tate-module transition is multiplication by p, not the inclusions H[p^m]→H[p^{m+1}].

Source: [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1), Lemma 7.2.5 and proof, p.119.

Required refinements: [Pan early tower and analytic control](#G-pan).

<a id="pan-completed-coefficient-and-flag-descent"></a>

### Completed coefficient and flag descent

Library declaration: `CP6.pan_completed_coefficient_and_flag_descent` (theorem).

For k≥1, completed cohomology with A_inf/(ker θ)^k coefficients is lim_m H̃^i(K^p,Z/p^m)⊗_{Z_p}A_inf/((ker θ)^k,p^m). More generally Pan’s coefficient interchange holds for a p-adically complete p-torsion-free Z_p-module M in the specified completed tower model. On the perfectoid modular curve, R^jπ_HT,*A_inf,X^a/(ker θ)^k=0 for j>0, giving H^i(X_{K^p},A_inf,X^a/(ker θ)^k)≃H^i(Fl,π_HT,*A_inf,X^a/(ker θ)^k).

Construction and proof. Pan Lemma 7.2.6 uses the p-complete torsion-free tower complex supplied by CC.4; keep its universal-coefficient exact sequence and multiplication-p Tor transitions. Vanishing follows on π_HT^{-1}(U), which is affinoid perfectoid, by induction on k. No arbitrary pushforward on all diamonds is inferred.

Direct prerequisites: [CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit](#pan-bounded-torsion-inverse-limit), `CompletedCohomologyPartII:CC.4`, `CompletedCohomologyPartII:CC.8`, `PerfectoidSpaces:P3`, `HodgeTateAndCanonicalSubgroups:T6:comparison`.

Acceptance. The coefficient M must be complete and p-torsion-free. The higher-direct-image argument requires the stated affinoid perfectoid preimages, not only a map to Fl.

Source: [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1), Lemma 7.2.6 and proof, p.120.

Required refinements: [Pan early tower and analytic control](#G-pan).

<a id="pan-etale-site-truncated-comparison-map"></a>

### Étale-site truncated period map

Library declaration: `CP6.pan_etale_site_truncated_comparison_map` (theorem).

For k≥1 construct Pan’s G_Qp-equivariant B_dR,k⁺-linear map H̃^i(K^p,B_dR,k⁺)→H^i(Fl,B_dR,k⁺), reducing modulo t to the k=1 completed C-coefficient isomorphism. At finite level use truncated Witt sheaves and, for each k,m, a sufficiently large projection φ_l:A_inf→W_l(O_C/p) through which A_inf→A_inf/((ker θ)^k,p^m) factors; the resulting almost maps g_{k,m} are compatible in k,m. After inverse p-adic limits and p-inversion they give the stated map.

Construction and proof. Pan Lemma 7.2.4 sketches an étale-site construction independent of a claim that ordinary étale/pro-étale sites agree. Compare their almost O⁺/p cohomology on the affinoid-perfectoid basis, induct for W_n, use the kernel-of-θ factorization estimate for Teichmüller lifts, then PB/PC justify the limit. The alternative primitive proof is cited but not used to skip the Witt factorization.

Direct prerequisites: [CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit](#pan-bounded-torsion-inverse-limit), [CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent](#pan-completed-coefficient-and-flag-descent), `AInfCohomology:AI.3`, `PerfectoidSpaces:P3`, `ClassicalAdicEtaleCohomology:H5`, `mathlib:WittVector`.

Acceptance. Reduction modulo t is Pan22 Corollary 4.4.3. Independently check compatibility modulo p^m and (ker θ)^k before taking either limit.

Source: [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1), Lemma 7.2.4 and proof, pp.118–120.

<a id="pan-truncated-period-isomorphism"></a>

### Truncated period comparison

Library declaration: `CP6.pan_truncated_period_isomorphism` (theorem).

For Pan’s modular-curve tower, every k≥1 and degree i, the preceding map is a natural G_Qp-equivariant isomorphism of B_dR,k⁺-modules H̃^i(K^p,B_dR,k⁺)≃H^i(Fl,B_dR,k⁺), with the source’s truncated period sheaf on Fl.

Construction and proof. Proposition 7.2.3 uses the k=1 result of Pan22 Corollary 4.4.3, the explicit map of Lemma 7.2.4 and flatness of the scalar algebra/sheaf over B_dR,k⁺ to induct on k. Flatness and the modulo-t exact sequences are inputs; agreement of dimensions alone does not produce this isomorphism.

Direct prerequisites: [CohomologyComparisons:CP.6/pan-etale-site-truncated-comparison-map](#pan-etale-site-truncated-comparison-map), `HodgeTateAndCanonicalSubgroups:T6:comparison`, `CompletedCohomologyPartII:CC.8`.

Acceptance. At k=1 obtain H̃^i(K^p,C)≃H^i(Fl,O_{K^p}); the k=2 comparison respects the nontrivial t-extension.

Source: [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1), Proposition 7.2.3 and proof, p.118.

Required refinements: [Pan early tower and analytic control](#G-pan), [Missing geometric and enhanced Lean interfaces](#G-lean-types).

Coverage: **planned**. Every target has a node or a preserved supplier interface at target granularity. Planned is a completed planning pass, not proof closure.

Before closure: Explicit map and homotopy agreement; Log-prismatic agreement and semistable products; Chern class owners and proper compactification proof; Pan early tower and analytic control; Trace character and Habiro return interfaces; Missing geometric and enhanced Lean interfaces.

## Preserved supplier records and ownership

The preceding checkpoint contained correct generic results which RS-01 assigns to other owners. Their old IDs remain import aliases. The following evidence is retained for the supplier and reviewer; these entries are not additional declarations owned by CP. Their exact requests are in the packet.

### Coherence of W_r(O) and finite presentation over A_inf/p^n

Retained ID: `CohomologyComparisons:CP.0/coherence-of-witt-vectors-of-perfectoid-integers`; owner: `AInfCohomology:AI.5`.

Let K be a perfectoid field with ring of integers O and maximal ideal m. (i) For every r ≥ 1 the ring W_r(O) is coherent (Proposition 3.24); in particular W_n(O♭) = A_inf/p^n is coherent for every n, whereas A_inf itself is not coherent in general. (ii) For a ring R and a finitely generated ideal I, an R/I-module is finitely presented over R/I iff it is finitely presented over R, and R/I is coherent if R is (Lemma 3.25). (iii) A square-zero extension S → R with R coherent and kernel finitely presented over R is coherent (Lemma 3.26). (iv) If f ∈ R is a non-zero-divisor and (R,f) has the Artin–Rees property, R is coherent as soon as R[1/f] and R/f are (Lemma 3.27); for an injective map R → S of f-torsion-free rings whose cokernel is killed by a power of f, (R,f) has the Artin–Rees property iff (S,f) does (Lemma 3.28). (v) A finitely presented W_r(O)-module has no nonzero element killed by W_r(m) (Corollary 3.29).

Supplier proof route. Characteristic p case of (i): O is a perfect valuation ring of characteristic p, hence coherent; W_r(O) → O is a successive square-zero extension by copies of O, so Lemma 3.26 applies. This is the case used for W_n(O♭) in Lemma 4.9 and Lemma 4.14. Characteristic 0 case of (i): the ghost map W_r(O) → ∏_{i=1}^r O is injective with cokernel of bounded p-torsion since O is p-torsion-free; O, hence ∏O, is coherent and has the Artin–Rees property for f = p (asserted in the source without proof); by Lemmas 3.27–3.28 it suffices that W_r(O)/p is coherent (that W_r(O)[1/p] ≅ K^r is coherent is left implicit). As W_r(O)/p = W_r(O/p^N)/p for N large, it suffices (Lemma 3.25(ii), implicit) that W_r(O/p^N) is coherent, proved by induction on r and, for fixed r, on i for the square-zero extensions R_{i+1} → R_i with R_i = W_r(O/p^N)/V^{r−1}(p^i O/p^N) (R_0 = W_{r−1}(O/p^N), R_N = W_r(O/p^N)), whose kernel p^iO/p^{i+1}O is an R_i-module via R_i → O/p^N → O/p followed by φ^{r−1} and is finitely presented. (ii): tensor a presentation down; conversely lift (R/I)^n → (R/I)^m → M → 0 to R^n ⊕ I^m → R^m → M → 0; for coherence of R/I lift a finitely generated ideal J to J̃ ⊂ R and use I/I^2 → J̃/IJ̃ → J → 0. (iii): for a finitely generated ideal J ⊂ S, 0 → J ∩ I → J → JR → 0 with JR finitely presented over R hence over S; so J ∩ I is finitely generated, hence finitely presented inside the finitely presented R-module I; J is an extension of finitely presented modules. (iv): Lemma 3.27 reduces finite generation of the kernel K of R^n → I to K/f, then to finite presentation of I/fI over R/f, using Artin–Rees twice and the coherence of R/f^M obtained from R/f by Lemma 3.26; Lemma 3.28 uses the equivalence of categories of modules up to bounded f-torsion. (v): the submodule generated by an element killed by W_r(m) is finitely presented by coherence, hence W_r(O)/I with W_r(m) ⊂ I, hence a quotient W_s(k) of W_r(k); but ker(W_r(O) → W_s(k)) is not finitely generated since m is not.

Supplier acceptance. A finitely generated submodule of a finitely presented W_n(O♭)-module (pM ⊂ M, or M[p^n] = H^{-1}(M ⊗^L A_inf/p^n)) is finitely presented — the two uses inside Lemma 4.9. Contrast: A_inf itself is not coherent in general (the source cites [46]; not read), which is why the finite-presentation arguments of Lemmas 4.9 and 4.14 are run over W_n(O♭) = A_inf/p^n.

### Rational crystalline base change from W(k) to A_crys along a residue-field section (BMS1 Proposition 13.21)

Retained ID: `CohomologyComparisons:CP.2/rational-crystalline-base-change-along-residue-section`; owner: `CrystallineCohomology:CR.3`.

Let X be proper smooth formal over O = O_C, Y := X_{O/p}, Ȳ := X_k, and fix a section k → O/p. There is a canonical φ-equivariant isomorphism H^i_crys(Y/A_crys)[1/p] ≅ H^i_crys(Ȳ/W(k)) ⊗_{W(k)} A_crys[1/p]; in particular H^i_crys(Y/A_crys)[1/p] is a finite free A_crys[1/p]-module. Canonicity is relative to the section: the section is unique when k = F̄_p (Remark 13.22; the overline is lost in the text extraction and was checked on the PDF). In Theorem 14.6, where X is the base change of a proper smooth formal scheme over O_K with K discretely valued with residue field k, the proof uses 'a canonical section k → O/p → O_C/p' of the residue field k of K (the reduction of the canonical map W(k) → O_K), i.e. a variant of this proposition with H^i_crys(X_k/W(k)) on the right; that variant is not spelled out in the source (see the last proof step).

Supplier proof route. For any qcqs smooth O/p-scheme Z, φ: H^i_crys(Z/A_crys) ⊗_{A_crys,φ} A_crys → H^i_crys(Z/A_crys) is an isomorphism after inverting p: reduce to Z affine, where Z ≅ Z̄ ×_{Spec k} Spec O/p (an isomorphism modulo p^{1/p^n} exists by finite presentation and lifts by smoothness), and base change from Z̄/k. Iterate: H^i_crys(Y/A_crys) ⊗_{A_crys,φ^n} A_crys = H^i(Y_{O/p^{1/p^n}}/φ^{−n}(A_crys)) ⊗_{φ^{−n}(A_crys),φ^n} A_crys, whose left side agrees with H^i_crys(Y/A_crys) after inverting p. For n large there is an isomorphism Y ×_{O/p} O/p^{1/p^n} ≅ Ȳ ×_{Spec k} Spec O/p^{1/p^n} reducing to the identity over Spec k (finite presentation), any two agreeing after increasing n; base change for crystalline cohomology gives the result. DVR descent (reconstructed for Theorem 14.6): if X = X_0 ⊗_{O_K} O_C with ramification index e and p^n ≥ e, then O_K → O_C/p^{1/p^n} kills the uniformizer and coincides with the canonical section k → O_C/p^{1/p^n}, so the isomorphism of the previous step is canonical and the statement holds with k the residue field of K.

Supplier acceptance. k = F̄_p: the section is unique (Remark 13.22: a surjection R → F_q of F_p-algebras with locally nilpotent kernel has a unique section; pass to the union over q). Independence of the section in general is not claimed by the source; CP.2's 'claimed independence' must be limited to the canonical DVR section. X = Spf O_C: both sides are A_crys[1/p] in degree 0.

### Perfectness, bounded torsion and Tor-dimension of finitely presented A_inf-modules

Retained ID: `CohomologyComparisons:CP.5/perfectness-and-tor-bounds-for-ainf-modules`; owner: `AInfCohomology:AI.5`.

[Supplier material: owned by AInfCohomology:AI.5 per its stage description ('the linear algebra controlling integral torsion under these specializations'); recorded here for the CP.5 application chain pending expansion of the AInfCohomology packet.] Let M be a finitely presented A_inf-module with M[1/p] finite free over A_inf[1/p]. Then (i) M is perfect as an A_inf-complex; (ii) the torsion submodule M_tor is killed by p^n for n ≫ 0 and is finitely presented and perfect over A_inf; (iii) M has Tor-dimension ≤ 2 and Tor_2^{A_inf}(M, W(k)) = 0; if moreover M has no x-torsion, then Tor_i^{A_inf}(M, W(k)) = 0 for all i > 0.

Supplier proof route. (i), case M[1/p] = 0: M is killed by p^n, hence a finitely presented W_n(O♭)-module; induction on n via 0 → pM → M → M/pM → 0, where M/pM is a finitely presented O♭-module, perfect over the valuation ring O♭ and hence over A_inf (O♭ = A_inf/p is perfect over A_inf), and pM is finitely presented over W_n(O♭) by coherence (Proposition 3.24, characteristic-p case) and killed by p^{n−1}. (i), general case: choose a free A_inf-module N ⊂ M with N[1/p] = M[1/p] by clearing denominators; the quotient Q is finitely presented with Q[1/p] = 0, hence perfect; so M is perfect. (ii): M_tor ∩ N = 0, so M_tor embeds in Q and is killed by p^n; then M_tor = M[p^n] = H^{-1}(M ⊗^L A_inf/p^n), a cohomology group of a perfect W_n(O♭)-complex, hence finitely presented over W_n(O♭) by coherence and over A_inf by Lemma 3.25(i); perfectness by (i). (iii): Tor-dimension ≤ 2 since finitely presented O♭-modules have Tor-dimension ≤ 1 over O♭. With W̃ = colim A_inf/(x^{1/p^n}) and 0 → Q → W̃ → W(k) → 0 (Q an A_inf[1/p]-module): Tor_i(M,Q) = 0 for i > 0 as M[1/p] is free; W̃ has Tor-dimension 1 because x is a non-zero-divisor; hence Tor_2(M, W(k)) = 0. (The source asserts without further argument that W̃ → W(k) is the p-adic completion map and that W̃ is p-torsion-free; the proof opens with 'We freely use Lemma 3.25 and Lemma 3.26'.) (iii), x-torsion-free case: Tor_i(M, W̃) = 0 for i > 0, giving 0 → Tor_1(M, W(k)) → M ⊗ Q → M ⊗ W̃ → M ⊗ W(k) → 0; the first term is killed after inverting p while p acts invertibly on M ⊗ Q, so Tor_1(M, W(k)) = 0.

Supplier acceptance. M = A_inf/(x,p): perfect (Koszul), M_tor = M killed by p, Tor_1(M, W(k)) = k ≠ 0 (M has x-torsion, so the last clause does not apply). M = A_inf/x is not an admissible test: M[1/p] = A_inf[1/p]/x is nonzero and killed by the non-zero-divisor x, hence not free over A_inf[1/p], so the hypothesis of Lemma 4.9 fails (its Tor_1(M, W(k)) = W(k) ≠ 0 says nothing about the lemma). Within the hypotheses, M = A_inf/(x,p) (first test) shows that the x-torsion-freeness assumption in (iii) cannot be dropped. M finite free: all higher Tor vanish.

### Structure of finitely presented A_inf-modules free after inverting p

Retained ID: `CohomologyComparisons:CP.5/ainf-module-structure-theorem`; owner: `AInfCohomology:AI.5`.

[Supplier material: owned by AInfCohomology:AI.2 per its stage description ('torsion decompositions' of finitely presented A_inf-modules free after p-inversion); recorded here for the CP.5 application chain.] Let M be a finitely presented A_inf-module with M[1/p] finite projective (equivalently free, Corollary 4.12) over A_inf[1/p]. There is a functorial exact sequence 0 → M_tor → M → M_free → M̄ → 0 with (i) M_tor finitely presented, perfect and killed by p^n for n ≫ 0; (ii) M_free finite free; (iii) M̄ finitely presented, perfect and supported at the closed point s ∈ Spec A_inf, i.e. killed by a power of (x,p). Moreover M is finite free if M ⊗_{A_inf} W(k) is p-torsion-free, or if K has characteristic 0 and M ⊗_{A_inf} O is p-torsion-free.

Supplier proof route. (i) is Lemma 4.9(ii). N := M/M_tor is finitely presented, p-torsion-free and free after inverting p, so by Lemma 4.10 it defines a vector bundle on U = Spec A_inf minus the closed point (checked at the DVR A_inf,(p); the reduction 'It is enough to check that M ⊗ A_inf,(p) is finite free' is asserted in the proof of Lemma 4.10). Kedlaya's Lemma 4.6: restriction is an equivalence between vector bundles on Spec A_inf and on U, and all vector bundles on U are free; hence M_free := H^0(U, N) is finite free, giving (ii). Full faithfulness: A_inf = A_inf[1/p] ∩ A_inf[1/x] inside A_inf[1/xp], by the Teichmüller expansion. Essential surjectivity (read by the reviewer): for a bundle given by (M_1, M_2, h), M := ker(M_1 ⊕ M_2 → M_12) lies in a finitely generated M' ⊂ M_1 with M'/M killed by a power of p; dim_k(M ⊗ k) ≥ d via a W(k)-lattice argument; M is p-adically complete, separated and p-torsion-free; M/p embeds in M_2/p ≅ (K♭)^d and is free of rank d by Lemmas 4.7–4.8 (an O♭-submodule E of (K♭)^d has dim_k(E ⊗ k) ≤ d, with equality only if it is free of rank d); hence M is finite free of rank d. N → M_free is injective (N has no p-torsion) and an isomorphism over U, so the cokernel M̄ is finitely presented and supported at s; perfectness of M̄ follows from perfectness of the other three terms. Freeness criterion: for a local domain R with residue field k_s and fraction field k_η, a finitely generated M with dim_{k_s}(M ⊗ k_s) = dim_{k_η}(M ⊗ k_η) is finite free (a nonzero Fitting ideal I ≠ R would separate the ranks at k_η ∉ Spec R/I and k_s ∈ Spec R/I). Apply to R = A_inf: the generic rank equals the rank over W(k)[1/p] or O[1/p] since M[1/p] is free, and equals dim_k(M ⊗ k) by the p-torsion-freeness assumption on M ⊗ W(k) (resp. M ⊗ O). Corollary 4.12 (finite projective over A_inf[1/p] ⇒ free): choose a finitely generated M ⊂ N with M[1/p] = N; Lemma 4.10 and Lemma 4.6 give a finite free M' agreeing with M on U, so N = M'[1/p] is free.

Supplier acceptance. M = (x,p) ⊂ A_inf: M_tor = 0, M_free = A_inf, M̄ = A_inf/(x,p) ≠ 0 — Remark 4.11: M is not projective though trivial on U. M = A_inf/p^n ⊕ A_inf: M_tor = A_inf/p^n, M_free = A_inf, M̄ = 0. The freeness criterion applied to M with M ⊗ W(k) p-torsion-free is the step Corollary 4.17 invokes.

### Length goes up under specialization for finitely presented W_n(O♭)-modules

Retained ID: `CohomologyComparisons:CP.5/specialization-length-inequality`; owner: `AInfCohomology:AI.5`.

[Supplier material: owned by AInfCohomology:AI.5 per its stage description ('the linear algebra controlling integral torsion under these specializations'); recorded here for the CP.5 application chain pending expansion of the AInfCohomology packet.] Let M be a finitely presented W_n(O♭)-module, M_η := M ⊗_{W_n(O♭)} W_n(K♭) and M_s := M ⊗_{W_n(O♭)} W_n(k). Then M_η and M_s have finite length over W_n(K♭) and W_n(k) respectively, and ℓ(M_η) = ℓ(M_s) − ℓ(Tor_1^{W_n(O♭)}(M, W_n(k))) ≤ ℓ(M_s).

Supplier proof route. M ⊗^L_{W_n(O♭)} W_n(k) ≃ M ⊗^L_{A_inf} W(k); by Lemma 4.9 (M[1/p] = 0 is trivially free) M is perfect over A_inf, so each Tor_i^{W_n(O♭)}(M, W_n(k)) is a finitely generated W_n(k)-module, hence of finite length, and Tor_i = 0 for i > 1 by Lemma 4.9(iii). Reformulate: ℓ(M_η) = ℓ(M ⊗^L W_n(K♭)) because W_n(O♭) → W_n(K♭) is flat (specialization dictionary, item (b)); ℓ(M_s) − ℓ(Tor_1) = ℓ(M ⊗^L W_n(k)) as an Euler characteristic, higher Tor vanishing. Both sides are additive in short exact sequences of finitely presented modules. Writing M as an extension of M/p^{n−1}M by p^{n−1}M (= p^{n−1}M/p^nM, a module killed by p) reduces to n = 1, using M ⊗^L_{W_n(O♭)} W_n(k) ≃ M ⊗^L_{O♭} k when pM = 0. That p^{n−1}M and M/p^{n−1}M stay finitely presented uses the coherence of W_n(O♭) (Proposition 3.24) and Lemma 3.25(i), which the proof of Lemma 4.14 leaves implicit. n = 1: by the classification of finitely presented modules over the valuation ring O♭ (external import), reduce to M = O♭ (both sides 1) and M = O♭/(x^r) with r > 0 in the value group of K♭ (M_η = 0; M_s = k and Tor_1(O♭/x^r, k) = k, so both sides 0).

Supplier acceptance. M = O♭/(x^r): strict inequality 0 < 1 = ℓ(M_s). M = W_n(O♭)/(x^r) for n ≥ 2: ℓ(M_η) = 0, ℓ(M_s) = n, ℓ(Tor_1) = n. M = W_n(O♭): equality n = n with Tor_1 = 0.

### Rank equality and length inequality between the W(k)- and W(K♭)-specializations

Retained ID: `CohomologyComparisons:CP.5/witt-versus-tilt-specialization-inequality`; owner: `AInfCohomology:AI.5`.

[Supplier material: owned by AInfCohomology:AI.5 per its stage description ('the linear algebra controlling integral torsion under these specializations'); recorded here for the CP.5 application chain pending expansion of the AInfCohomology packet.] Let M be a finitely presented A_inf-module with M[1/p] free over A_inf[1/p]; put M_1 := M ⊗_{A_inf} W(K♭) and M_2 := M ⊗_{A_inf} W(k). Then (i) M_1 and M_2 have the same rank; (ii) for all n ≥ 1, ℓ_{W(k)}(M_2/p^n) ≥ ℓ_{W(K♭)}(M_1/p^n). Consequently (reconstructed from (i), (ii) and the structure of finitely generated modules over the discrete valuation rings W(k) and W(K♭)) ℓ(M_{2,tor}/p^n) ≥ ℓ(M_{1,tor}/p^n) for all n.

Supplier proof route. (i): M_1[1/p] and M_2[1/p] are base changes of the finite free A_inf[1/p]-module M[1/p]. (ii): apply Lemma 4.14 to M/p^n, a finitely presented W_n(O♭)-module (Lemma 3.25(i)), whose η- and s-specializations are M_1/p^n and M_2/p^n. Torsion form (reconstructed, not displayed in the source): for a finitely generated module N over a DVR with uniformizer p, ℓ(N/p^n) = n·rank N + ℓ(N_tor/p^n); subtract the common n·rank.

Supplier acceptance. M = A_inf/(x,p) ⊕ A_inf: x is a unit in W(K♭) (its residue x̄ is a nonzero element of the field K♭), so M_1 = W(K♭) while M_2 = k ⊕ W(k); ranks 1 = 1 and ℓ(M_2/p^n) = n + 1 > n = ℓ(M_1/p^n). M finite free: equality for all n.

### Degreewise versus derived W(k)-specialization: injectivity and the adjacent-degree obstruction

Retained ID: `CohomologyComparisons:CP.5/derived-to-degreewise-witt-specialization`; owner: `AInfCohomology:AI.5`.

[Supplier material: owned by AInfCohomology:AI.5 per its stage description ('the linear algebra controlling integral torsion under these specializations'); recorded here for the CP.5 application chain pending expansion of the AInfCohomology packet.] Let C ∈ D(A_inf) with H^j(C)[1/p] free over A_inf[1/p] for every j, and fix i. The natural map H^i(C) ⊗_{A_inf} W(k) → H^i(C ⊗^L_{A_inf} W(k)) is injective and becomes bijective after inverting p. If H^{i+1}(C) has no x-torsion, the map is bijective.

Supplier proof route. Rational bijectivity is formal from freeness of the H^j(C)[1/p] (reconstructed reason: a complex over A_inf[1/p] with free cohomology groups is quasi-isomorphic to the direct sum of its shifted cohomology groups, so derived and ordinary base change agree after inverting p). Injectivity of H^i(C) ⊗ W̃ → H^i(C ⊗^L W̃) with W̃ = colim A_inf/(x^{1/p^n}): both sides commute with filtered colimits, reducing to A_inf/(x^{1/p^n}), which the source 'can be checked easily using the Koszul presentation'; packet-authored expansion: the Koszul presentation gives 0 → H^i(C)/x^{1/p^n} → H^i(C ⊗^L A_inf/x^{1/p^n}) → H^{i+1}(C)[x^{1/p^n}] → 0, and the right-hand term vanishes for all n exactly when H^{i+1}(C) has no x-torsion, which gives bijectivity in that case. With Q = ker(W̃ → W(k)) an A_inf[1/p]-module, the hypothesis gives H^i(C) ⊗ Q ≅ H^i(C ⊗^L Q). In the map of exact rows H^i(C)⊗Q → H^i(C)⊗W̃ → H^i(C)⊗W(k) → 0 over H^i(C⊗^L Q) → H^i(C⊗^L W̃) → H^i(C⊗^L W(k)), the left vertical map a is bijective and the middle map b injective; a diagram chase gives injectivity of the right map c. Surjectivity of d: H^i(C⊗^L W̃) → H^i(C⊗^L W(k)): its obstruction is the boundary H^i(C ⊗^L W(k)) → H^{i+1}(C ⊗^L Q), which vanishes since the target is an A_inf[1/p]-module and d[1/p] is surjective (as c[1/p] is). Surjectivity of c then follows from surjectivity of b, i.e. from x-torsion-freeness of H^{i+1}(C).

Supplier acceptance. C = A_inf/(x,p)[−(i+1)] (Koszul-resolved): the hypotheses hold (H^{i+1}(C)[1/p] = 0), H^i(C) ⊗ W(k) = 0 but H^i(C ⊗^L W(k)) = Tor_1^{A_inf}(A_inf/(x,p), W(k)) = k ≠ 0: injective, not surjective; the failure is caused by x-torsion in H^{i+1}(C). C with H^{i+1}(C) finite free: bijective. The map is natural in C, hence compatible with a Frobenius-semilinear endomorphism of C and the Witt vector Frobenius on W(k) (packet-authored; Lemma 4.16 does not mention φ, while Theorem 14.5(iii) asserts that the resulting inclusion is φ-compatible).

### Finite presentation of cohomology, freeness from a torsion-free crystalline specialization, and the adjacent-degree equality

Retained ID: `CohomologyComparisons:CP.5/finite-presentation-and-freeness-criterion`; owner: `AInfCohomology:AI.5`.

[Supplier material: owned by AInfCohomology:AI.5 per its stage description ('the linear algebra controlling integral torsion under these specializations'); recorded here for the CP.5 application chain pending expansion of the AInfCohomology packet.] Let C ∈ D(A_inf) be a perfect complex with H^j(C)[1/p] free over A_inf[1/p] for all j. Then every H^j(C) is a finitely presented A_inf-module. For fixed i: if H^i(C ⊗^L W(k)) is p-torsion-free then H^i(C) is finite free over A_inf and H^i(C ⊗^L W(K♭)) = H^i(C) ⊗ W(K♭) is p-torsion-free. If moreover H^{i+1}(C) ⊗_{A_inf} W(k) is p-torsion-free — e.g. if H^{i+1}(C ⊗^L W(k)) is p-torsion-free, by Lemma 4.16 — then H^i(C) ⊗_{A_inf} W(k) = H^i(C ⊗^L_{A_inf} W(k)).

Supplier proof route. Finite presentation by descending induction on j: if H^{j'}(C) is finitely presented for all j' > j, then each is perfect (Lemma 4.9), so τ^{≤ j}C is perfect and H^j(C) is the top cohomology of a perfect complex, hence finitely presented. (The source asserts that the top cohomology group of a perfect complex is 'always finitely presented'.) Freeness of H^i(C) (the source's preface 'Combining Proposition 4.13 with Lemma 4.16'): Lemma 4.16 embeds H^i(C) ⊗ W(k) into the p-torsion-free H^i(C ⊗^L W(k)); Proposition 4.13's final statement then makes H^i(C) finite free. The W(K♭)-statement follows from flatness of A_inf → W(K♭). Adjacent-degree equality: H^{i+1}(C) ⊗ W(k) p-torsion-free ⇒ H^{i+1}(C) finite free (Proposition 4.13) ⇒ no x-torsion ⇒ Lemma 4.16's last clause gives bijectivity in degree i. The 'e.g.' clause: Lemma 4.16 in degree i+1 embeds H^{i+1}(C) ⊗ W(k) into H^{i+1}(C ⊗^L W(k)).

Supplier acceptance. C = A_inf/(x,p)[−(i+1)]: H^{i+1}(C ⊗^L W(k)) = k has p-torsion and the degree-i equality fails (Lemma 4.16 example). C with all H^j(C ⊗^L W(k)) p-torsion-free: all H^j(C) finite free and derived = degreewise specialization in every degree.

### Freeness after inverting p from μ-inverted and B_crys^+ freeness

Retained ID: `CohomologyComparisons:CP.5/mu-inverted-freeness-criterion`; owner: `AInfCohomology:AI.5`.

[Supplier material: owned by AInfCohomology:AI.5 per its stage description ('the linear algebra controlling integral torsion under these specializations'); recorded here for the CP.5 application chain pending expansion of the AInfCohomology packet.] Assume K of characteristic 0 containing all p-power roots of unity, μ = [ε] − 1. Lemma 4.19: if M is a finitely presented A_inf-module with (i) M[1/pμ] finite projective over A_inf[1/pμ] and (ii) M ⊗_{A_inf} B_crys^+ finite projective over B_crys^+, then M[1/p] is finite free over A_inf[1/p]. Corollary 4.20: if C ∈ D(A_inf) is perfect with H^j(C)[1/pμ] free over A_inf[1/pμ] and H^j(C ⊗^L B_crys^+) free over B_crys^+ for all j, then every H^j(C) is finitely presented with H^j(C)[1/p] free, and the conclusions of Corollary 4.17 hold: freeness of H^i(C) if H^i(C ⊗^L W(k)) is p-torsion-free, and H^i(C) ⊗ W(k) = H^i(C ⊗^L W(k)) if moreover H^{i+1}(C) ⊗ W(k) is p-torsion-free (e.g. if H^{i+1}(C ⊗^L W(k)) is).

Supplier proof route. R := A_inf[1/p], N := M[1/p], R̂ := μ-adic completion of R. The map R → R̂ factors through B_crys^+: produce A_crys → A_inf[1/p]/μ^n by bounding the images of ξ^m/m! (the cokernel of A_inf/μ^n → A_inf/ξ^n ⊕ A_inf/φ^{-1}(μ)^n is bounded p-torsion; ξ ≡ φ^{-1}(μ)^{p−1} mod p). μ is a non-zero-divisor of R (Proposition 3.17(ii), not cited at this point); the bounded-p-torsion claim is justified in the source only by 'this cokernel is finitely presented over A_inf, and acyclic after inverting p (since p ≡ ξ mod (φ^{-1}μ))'. Beauville–Laszlo (external [4]) with Corollary 4.12: N is finite projective over R once N[1/μ] is finite projective (hypothesis (i)), N ⊗_R R̂ is finite projective (hypothesis (ii) through R → B_crys^+ → R̂) and N has no μ-torsion. μ-torsion-freeness: from 0 → R → R̂ → Q' → 0 with Q' an R[1/μ]-module, Tor_1^R(N, Q') = Tor_1^{R[1/μ]}(N[1/μ], Q') = 0, so N ↪ N ⊗_R R̂, which is μ-torsion-free. (Injectivity of R → R̂ and the R[1/μ]-module structure of Q' are asserted in the source.) Corollary 4.20: decreasing induction on j; for j maximal with H^j(C) ≠ 0, H^j(C) satisfies Lemma 4.19's hypotheses (top cohomology commutes with base change); 'the rest is Corollary 4.17'.

Supplier acceptance. For C = RΓ_Ainf(X) the hypotheses are supplied by Theorem 14.3(iv) (H^j(C)[1/μ] = H^j_ét(X,Z_p) ⊗ A_inf[1/μ], which becomes free after also inverting p only because H^j_ét(X,Z_p) is a finitely generated Z_p-module — finiteness of p-adic étale cohomology of the proper smooth adic space X over C, from Scholze [58], which BMS1 recalls only in the discretely valued setting of Theorem 5.1 and does not cite here) and by Theorem 14.3(iii) with Proposition 13.21 (H^j(C ⊗^L B_crys^+) = H^j_crys(X_{O/p}/A_crys)[1/p] free) — the way Theorem 14.3 proves that all H^j_Ainf(X) are BKF modules. Remark 4.21: the W(k)-hypothesis may be replaced by the O-hypothesis via Lemma 4.18.

### Length modulo p^n is monotone along injections with torsion cokernel

Retained ID: `CohomologyComparisons:CP.5/length-monotonicity-under-torsion-cokernel`; owner: `AInfCohomology:AI.5`.

For an injective map M ↪ N of finitely generated W(k)-modules with torsion cokernel Q, length_{W(k)}(N/p^n) ≥ length_{W(k)}(M/p^n) for all n ≥ 0.

Supplier proof route. Exact sequence Tor_1^{W(k)}(Q, W(k)/p^n) → M/p^n → N/p^n → Q/p^n → 0. length Tor_1^{W(k)}(Q, W(k)/p^n) = length(Q/p^n) for any torsion W(k)-module Q (reconstructed check: Q ≅ ⊕ W(k)/p^{a_j} and both sides equal Σ min(a_j, n)). Hence length(N/p^n) = length(Q/p^n) + length(M/p^n) − length(image of Tor_1) ≥ length(M/p^n).

Supplier acceptance. M = pW(k) ⊂ N = W(k): n ≥ n. M = W(k) ⊂ N = W(k) ⊕ W(k)/p: n + 1 ≥ n. Applied with M = H^i_Ainf(X) ⊗ W(k) ↪ N = H^i_crys(X_k/W(k)) in Theorem 14.5(ii).

## Required supplier interfaces

The following requests give the precise statements needed at a stage where no finer supplying node exists. Every request records its consuming nodes in the packet. An exact AI.6 node import is used instead whenever that corrected packet supplies the statement; those thirteen imports have their node IDs in the layer descriptions. These requests are mathematical interfaces, not claims that another roadmap has finished them. A request exceeding the current stage text is also an explicit gap and scope proposal.

### AInfCohomology:AI.0:integral

For complete algebraically closed C/Q_p, the shared A_inf=W(O_C^♭), its topology, φ, θ, θ̃=θφ⁻¹, compatible roots ε, μ=[ε]−1, ξ=μ/φ⁻¹μ, ker θ=(ξ), ker θ̃=(φξ), Witt reduction with ξ↦p and μ↦0, and the natural ring maps. Include μ a unit after W(C^♭) extension and the BK twists. Coefficient constructions remain AI.0, not CP.0.

### AInfCohomology:AI.0:period-comparison

The p-adically completed coefficient-to-period ring comparison and the μ-inverted étale sheaf comparison, with its actual functorial maps and φ action; supply the difference between the two topologies/completions before rational scalar extension.

### AInfCohomology:AI.1

Lη/Bockstein comparison for the ξ/ξ̃ specializations, its multiplicative enhanced form, logarithmic Koszul coordinates and the localization identity when the décalage element becomes a unit; actual natural transformations rather than rank identities.

### AInfCohomology:AI.2

BKF modules, φ linearization, the Fargues functor to pairs (T,Ξ) with its full faithfulness in the range used for lattice recovery, and the normalization of twists. Essential surjectivity is only needed for constructing M(T); state the source proof and hypotheses rather than assuming it from the definition.

### AInfCohomology:AI.3

The sheaf A_inf,X on the corrected pro-étale site and its almost/coefficient reductions; the local-coordinate Witt and perfectoid tower maps with compatibility in the finite truncation indices used by Pan.

### AInfCohomology:AI.4

BMS1 Theorem 14.1’s sheaf-level smooth AΩ comparison maps: θ-de Rham, θ̃-Hodge–Tate with BK twist, Witt/de Rham–Witt and A_cris/PD comparison with φ and products. Supply the all-coordinate explicit-complex maps from §12.2 for the CP.3 agreement check.

### AInfCohomology:AI.5

BMS1 Theorem 14.3 and proof: perfect K_A for proper smooth formal O_C schemes, finite presentation/BKF H^i, almost-to-integral proper étale comparison, derived specializations and their φ compatibility. Also import the generic §4.2 module/complex statements retained under supplierRecords, including Lemmas 4.9–4.20, valuation-length inequalities, adjacent-degree Tor sequences, coherence of Witt vectors and μ-inverted freeness. CR.3 supplies the rational Frobenius-isogeny input upstream; CP.2 is not a prerequisite for AI.5.

### AdicEtaleGeometry:A1

Compatible analytic étale and corrected pro-étale sites, geometric fibre pullbacks, perfectoid bases and site morphisms; base change on the explicitly specified formal/analytic objects and derived sheaf cohomology.

### AdicSpacesPartII:F0

Formal completion, generic fibres and admissible blowups for proper smooth formal models, including the completion/analytification map used in BMS1 spreading-out. Preserve the chosen model and its base-change maps.

### AdicSpacesPartII:R0

Rigid affinoids over B_dR⁺/ξ^n and ξ-completed Tate algebras: BMS1 Lemma 13.4, noetherianity, flatness/completion for a finitely generated defining ideal, smooth lift and formal-étale coordinate extension. Supply these analytic algebra facts once; CP owns their embedding-cohomology application.

### AdicSpacesPartII:R3

Proper coherent cohomological finiteness and continuous formal/analytic GAGA; finite-projective base change on a smooth affinoid base and the derived Nakayama/perfectness criterion used in BMS1 §13 and GR Corollary 10.9. These do not imply cohomology freeness without the separate degeneration argument.

### AdicSpacesPartII:R5

Noetherian approximation and smooth/proper spreading over a smooth K-affinoid base, in the hypotheses of BMS1 Lemmas 13.7–13.10 and Proposition 13.15/Corollary 13.16. Smooth approximants must preserve the actual framed affinoid maps and completed inverse limits; coefficient-field embeddings alone do not suffice.

### AlgebraicModuliForArithmeticGeometry:R09.3

Existence and descent of finite-flat quotient spaces and E-torsors used by BMS1 §2, approximation of BG avoiding a codimension>2 stabilizer locus, and the projective quotient/ample-section construction. Supply the singular Enriques lift with Pic^τ=μ₂ and its K3 double cover, or an exact routed Part II source for it.

### AlgebraicModuliForArithmeticGeometry:R09.6

Proper smooth formal spreading as in BMS1 Proposition 13.15 and Corollary 13.16, including algebraization/effectivity of the chosen deformation and descent along the complete filtered noetherian system, with base-change compatibility.

### AlgebraicModuliForArithmeticGeometry:R09.7

Characteristic-zero resolution and common generically finite domination used in trace/cycle arguments; h-hypercover/resolution support for arbitrary algebraic varieties in Beilinson’s comparison. Also the precise finite-field Bertini statement needed to obtain the BMS1 §2 smooth projective surfaces after residue extension. The latter lies beyond the present resolution title and is flagged for an owner extension.

### ClassicalAdicEtaleCohomology:H1:formal-adic-comparison

Natural algebraic/formal/adic proper comparison for geometric étale cohomology and base change, retaining geometric points and finite coefficient systems, including its Z_p/Q_p passage under finiteness.

### ClassicalAdicEtaleCohomology:H5

Proper cohomology, derived scalar extension, Künneth and coefficient exact sequences on the specified analytic/étale sites. For Pan import the almost comparison of analytic and étale O⁺/p on an affinoid perfectoid basis and its truncated-Witt induction; do not identify the sites globally.

### CompletedCohomologyPartII:CC.2

p-adic derived inverse limits and cohomology control for the modular-curve tower, with Pan22 Lemma 4.4.4’s completeness input. The multiplication-p transition on adjacent-degree torsion, its inverse-Tate-module vanishing and the exact ML/lim¹ conditions must appear.

### CompletedCohomologyPartII:CC.4

A p-complete p-torsion-free Z_p chain complex S̃ with H^i(S̃)=H̃^i(K^p,Z_p) and H^i(S̃/p^m)=H̃^i(K^p,Z/p^m), functorial for tower transition/Hecke/Galois maps; coefficient interchange for complete p-torsion-free M in Pan Lemma 7.2.6.

### CompletedCohomologyPartII:CC.8

The modular-curve infinite-level tower, its π_HT: X_{K^p}→Fl and affinoid perfectoid preimages of the basis U∈B, with actions and coefficient sheaves; Pan22 Corollary 4.4.3’s almost integral and C-coefficient cohomology isomorphism. Supply an exact early adapter or scope extension, because CC.8 does not by its title alone promise Pan’s flag-variety calculation.

### CrystallineCohomology:CR.0

Shared A_cris PD-envelope, its completed coefficient map from A_inf, PD reductions and extension to B_cris/B_dR⁺, with compatibility of the canonical period completion and Frobenius. Not a new coefficient-ring construction in CP.

### CrystallineCohomology:CR.1

Crystalline sites and crystals in vector bundles/perfect complexes with the actual cartesian pullback condition, evaluation, functoriality and topology used to transfer crystalline coefficients to the relative infinitesimal site.

### CrystallineCohomology:CR.2

PD-envelope Čech–Alexander and completed de Rham computation for smooth formal schemes and crystals, including independence of embeddings, scalar-extension maps and logarithmic differentials where admitted. The CP.3 relative comparison imports this generic computation.

### CrystallineCohomology:CR.3

Derived crystalline base change including BMS1 Proposition 13.21 after p-inversion for smooth qcqs residue schemes and an auxiliary residue-field section; its independence when descending from W(k). Proper smooth crystalline/de Rham comparison, weak Lefschetz in BMS1 Lemma 2.12’s range, Künneth/Leray, Illusie’s singular Enriques H_crys² torsion and the supersingular elliptic H_crys¹ calculation used in the two counterexamples are exact additional routed requests.

### CrystallineCohomology:CR.3:Frobenius-isogeny

Frobenius is an isogeny on rational crystalline cohomology of smooth affine and then smooth qcqs k-schemes, not just proper schemes; the affine range is needed in the proof of BMS1 Proposition 13.21. Include the crystalline base-change Frobenius-semilinear map.

### CrystallineCohomology:CR.3:duality

Crystalline/de Rham Poincaré duality and trace with its dimension twist, degree formula under generically finite morphisms, regular-immersion Gysin adjunction and projective-bundle normalization in the proper smooth range.

### CrystallineCohomology:CR.4

Smooth de Rham–Witt comparison with Frobenius and BMS1’s Witt specialization map, not merely the graded differential-form module.

### CrystallineCohomology:CR.5

Fine saturated divisorial log structures, exactification, PD log bases and the Kummer/ordinary generic-fibre comparison in the admitted semistable chart class; keep W(k̄) with Q_{≥0} distinct from W(k₀) with N.

### CrystallineCohomology:CR.6

Actual Hyodo–Kato complexes, φ,N with Nφ=pφN, log-base descent from the AI.6 W(k̄) model to arithmetic W(k₀), the B_st torsor map and the exact signed uniformizer-change cocycle. Also the algebraic h-derived and overconvergent rigid HK realizations of CN Theorems 6.2,6.4,6.8 and finite-dimensionality for proper rigid spaces. The latter require a CR Part II scope extension and do not follow from proper semistable log crystalline cohomology alone.

### CrystallineCohomology:CR.7

Crystalline Frobenius examples: the ordinary and supersingular good-reduction elliptic H¹ modules and their slopes, with the proper-cohomology comparison maps. Only these computations are used; no weight–monodromy statement is requested.

### EnhancedDerivedSheaves:E4

Derived completed tensor products, derived inverse limits, filtered stable/enhanced symmetric monoidal cohomology and sheaf hyperdescent, with Tor/ML and perfectness criteria. The ordinary baseline DerivedCategory is not a replacement for these structures. Support the proper comparison, completed envelope Čech systems and map-level multiplicativity.

### EnhancedDerivedSheaves:E5:animation

Animated/derived coefficient and hyperdescent support required by Guo’s singular éh extension; analytic éh descent and cotangent/derived de Rham completion need a source-qualified owner extension, not a claim that the current smooth BMS construction handles singular spaces.

### EtaleDualityAndPerverseSheaves:EDC.2:pairings

Perfect Poincaré pairings for smooth proper varieties with Z/p^n and Q_p coefficients in the used range, their dimension twist, cup normalization and comparison under scalar extension.

### EtaleDualityAndPerverseSheaves:EDC.2:trace-purity

Proper smooth trace with target Q_p(−d), degree compatibility and normalization on projective space; purity/Gysin interfaces sufficient for the trace-normalized period and cycle comparison.

### EtaleDualityAndPerverseSheaves:EDC.3

Étale Kummer c₁, cycle classes for algebraic cycles, regular-immersion Gysin, proper pushforward and trace-adjunction characterization, with degree and Tate twists. De Rham dlog and the proper projective compactification P(O⊕L) supply the matched cycle proof; CP compares these classes.

### EtaleDualityAndPerverseSheaves:EDC.4

Projective-bundle and complete flag-bundle splitting, injectivity of pullback and the elementary-symmetric-polynomial construction of higher Chern classes; sign/normalization and zero/infinity-section formulas for P(O⊕L) are explicit.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1

Flat closure of a generic p² torsion point in a supersingular elliptic curve, G_C≃Z/p² and G_k=E_k[p]; finite-flat group quotients and degeneration Z/2→μ₂ used in BMS1 Lemmas 2.5,2.7,2.9 and Proposition 2.2. Supply their actual existence proofs rather than assuming equal ranks determine a finite-flat group.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3

Fontaine–Laffaille normalization and integral realization for absolutely unramified K, safe shifted interval [0,p−2], and the explicit restricted endpoint [0,p−1] subcategories. At p=2 the safe interval is [0,0]. Include the covariance and HT-sign translation, not only an unspecified small-weight condition.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4

Extend the finite-flat/p-divisible scope to the all-Hodge–Tate-weight crystalline-lattice Kisin functor in BMS1 Theorem 4.4: existence, full faithfulness, the S[1/u]^∧_p↔G_{K∞} equivalence, uniqueness, and Proposition 4.34’s B_cris⁺ comparison. S→A_inf is φ on W(k), u↦[π^♭]^p; S→W(k) is φ on W(k), u↦0. Include dyadic hypotheses. R06.2 rational admissibility cannot recover the integral lattice.

### HodgeTateAndCanonicalSubgroups:T6:comparison

The logarithmic structural B_dR⁺ sheaf with connection and filtration, log Poincaré lemma and Faltings extension routed from Pan /493–/494. For Pan Proposition 6.3.9 supply the LB-space analytic-vector exactness, χ̃_l isotypic and G_{K∞}-fixed/G_K-analytic decompletion hypotheses. These are late coefficient imports to CP.6’s routed adapters, after the ordinary CP.3 theorem, so no T6:comparison→CP.3 core edge is added.

### HodgeTateAndCanonicalSubgroups:T6:log-sites

The source-qualified modular-curve log adic/Kummer sites, log differential forms, charts and perfectoid local basis; supply only the early geometric prefix, without asserting a Poincaré lemma before the period-sheaf construction.

### PadicHodgeTheory:P8:local-rational

Early rational relative period sheaves, local acyclicity, filtered Poincaré lemma and strictness from corrected Scholze covers: p-complete the integral tensor before p-inversion and ker θ completion. This request excludes the later proper-global comparison theorem. Scholze’s primitive finiteness/almost comparison is a separate gap and proposed early owner, not smuggled into this stage’s scope.

### PadicHodgeTheory:R06.1

Shared B_cris⁺, B_cris, B_st torsor and B_dR⁺/B_dR as topological rings with actual field/DVR, flatness and invariant properties where proved, embeddings and t/φ/N normalizations. Pinned BDeRham only defines a localization and supplies none of these field theorems.

### PadicHodgeTheory:R06.2

Period invariants and admissibility for crystalline/semistable/potentially semistable representations with the precise coefficient field, descent, φ,N and Hodge filtration; identify D_cris/D_st/D_pst of an already compared geometric representation, never construct the geometric comparison here.

### PadicHodgeTheory:R06.4

Covariance, decreasing filtration and HT(χ_p)=+1 convention translation among rational, Fontaine–Laffaille and Breuil–Kisin realizations; compatible semilinear φ pullback and S-specialization normalizations.

### PerfectoidSpaces:P3

Almost acyclicity of O⁺/p on affinoid perfectoid spaces, its finite Witt induction and the actual perfectoid tower preimages used by Pan; almost equality must retain the chosen ideal/category.

### PrismaticCohomology:PR.4

Construct the prismatic, syntomic and crystalline first Chern classes of Bhatt–Lurie §§7–8, logarithmic boundary maps, twists, projective-bundle/flag splitting and their realization maps. The current general prismatic-cohomology stage does not name every Chern input; flag the exact scope extension before claiming CP.6 closed.

### PrismaticCohomology:PR.5

Source-qualified singular/animated prismatic comparison with its bounded-prism and derived completion hypotheses. CP.1’s smooth diagram is only transported in the intersection of these hypotheses, not asserted for every animated base.

### PrismaticCohomology:PR.6

The A_inf/prismatic φ-pullback comparison and its local q-de Rham/PD maps; BS22 Theorem 17.2 and §18 symmetric monoidal uniqueness with the Hodge–Tate structure map, perfect prism and p-completely smooth input. Supply the crystalline and de Rham Frobenius-twisted versus ordinary Hodge–Tate base changes.

### PrismaticCohomology:PR.7

Crystalline local system↔analytic prismatic F-crystal equivalence and GR Theorem 9.15’s comparison map, with perfect prism/base-flatness hypotheses. CP.3 only compares its B_dR specialization with the independently constructed infinitesimal/de Rham map; a later PR.7 proper-pushforward application must consume CP.3, not be required to construct its core.

### PrismaticCohomology:PR.8

Exact source-qualified log-prismatic comparison in the semistable overlap: boundedness, log smoothness/Cartier type, perfect-log-prism and exact chart hypotheses, derived completion and crystalline/de Rham/étale maps. Supply a map agreement criterion with AI.6’s exactified log PD model; all fs log schemes are not implicitly included.

## Explicit gaps and closure work

These thirteen gaps distinguish unavailable proof/type foundations from completed source reading and target coverage. A follow-up starts from the named consuming declarations and exact supplier requests, retaining the normalization and ownership choices made here.

<a id="G-primitive"></a>

### Early absolute and relative primitive comparison owner

Scholze Theorems 1.1,1.3,5.1: finiteness for F_p local systems on proper smooth rigid spaces and the absolute/relative almost O⁺/p comparison, with corrected covers and the A_inf sheaf variant. The routed red teams propose differently ordered early P8 primitive substages. Neither exists in the atlas. Keep it outside the later P8 proper-comparison suffix; request the owner split in restructure. Until that exact early input is supplied this is a genuine gap, not a consequence of CP.3.

Consumers: [CohomologyComparisons:CP.3/canonical-bdr-etale-comparison](#canonical-bdr-etale-comparison), [CohomologyComparisons:CP.3/hodge-tate-degeneration](#hodge-tate-degeneration), [CohomologyComparisons:CP.1/proper-ainf-input-package](#proper-ainf-input-package), [CohomologyComparisons:CP.4/semistable-period-comparison](#semistable-period-comparison).

<a id="G-map-agreement"></a>

### Explicit map and homotopy agreement

BMS1 Theorem 14.5(i) says the maps agree on explicit complexes, while Proposition 13.23 gives the lattice comparison. The all-coordinate ring map X_u↦[u^♭], normalized logarithmic Koszul operators and degree-one/higher cup homotopies must be written as actual natural-transformation identities, including agreement with corrected P8 local sheaves. Their source sketches do not supply a named complete map API.

Consumers: [CohomologyComparisons:CP.3/integral-rational-bdr-map-agreement](#integral-rational-bdr-map-agreement), [CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base](#crystalline-comparison-over-discretely-valued-base), [CohomologyComparisons:CP.5/lattice-recovery-over-C](#lattice-recovery-over-C), [CohomologyComparisons:CP.6/naturality-base-change-and-cup-products](#naturality-base-change-and-cup-products).

<a id="G-affine-crystalline"></a>

### Rational affine crystalline invariance proof

Verify CR.3’s requested smooth affine/qcqs Frobenius-isogeny and completed residue-section base-change theorem with the actual Berthelot–Ogus/Illusie source proof. Proper crystalline finiteness alone is insufficient; integral section-independence is not claimed. The generic result is preserved as a supplier record, not owned in CP.2.

Consumers: [CohomologyComparisons:CP.2/residue-section-descent-adapter](#residue-section-descent-adapter), [CohomologyComparisons:CP.2/rational-crystalline-comparison-over-C](#rational-crystalline-comparison-over-C).

<a id="G-relative-filtration"></a>

### Relative filtered and singular extensions

GR Theorem 10.13 specializes a PR.7 étale-crystalline comparison in the p-completely flat perfect-prism range with a compatible section; Remark 10.14 removes it only through OB_dR and Griffiths transversality. Complete the supplier map API and analytic éh/derived-de-Rham support before extending the smooth BMS/Guo agreement to singular spaces. The relative target nodes specify the comparison, but these type/proof foundations are not yet supplied.

Consumers: [CohomologyComparisons:CP.3/relative-filtered-prismatic-agreement](#relative-filtered-prismatic-agreement), [CohomologyComparisons:CP.3/absolute-relative-infinitesimal-agreement](#absolute-relative-infinitesimal-agreement).

<a id="G-hk-conventions"></a>

### Hyodo–Kato log-base descent and signed transport

Read and supply CR.6’s exact descent from the W(k̄),Q_{≥0} log base to W(k₀),N and uniformizer-change formula with N=−d/dT. Determine the sign from the torsor coordinates and prove the cocycle; CP.4 states that qualified transport rather than guessing the sign.

Consumers: [CohomologyComparisons:CP.4/hyodo-kato-log-base-adapter](#hyodo-kato-log-base-adapter), [CohomologyComparisons:CP.4/uniformizer-change-and-monodromy](#uniformizer-change-and-monodromy).

<a id="G-log-products"></a>

### Log-prismatic agreement and semistable products

PR.8’s precise admitted log chart class and comparison map must be checked against CK. The full semistable A_cris comparison in CK is not claimed multiplicative; any tensor/cup enhancement needed by CP.6 requires a separate source/proof. Importing a smooth E∞ comparison does not prove it in the log case.

Consumers: [CohomologyComparisons:CP.4/log-prismatic-agreement](#log-prismatic-agreement), [CohomologyComparisons:CP.6/naturality-base-change-and-cup-products](#naturality-base-change-and-cup-products).

<a id="G-analytic-cst"></a>

### Analytic and algebraic C_st proof suppliers

CN Theorem 6.2 quotes Beilinson’s h-descent algebraic comparison for arbitrary varieties; its original proof and the h-derived HK/de Rham realization are not provided by the semistable model theory. Theorems 6.4/6.8 use overconvergent syntomic/étale comparison in high twists, proper HK/de Rham finiteness and Banach–Colmez dimension theory. No suitable early BC/syntomic stage has been identified; R06.5/R06.6 consume CP.4 and cannot fill this gap. Propose a source-qualified Part II early prefix of rational p-adic Hodge theory/CR.6 and preserve filtered-complex cohomology in the over-C case.

Consumers: [CohomologyComparisons:CP.4/algebraic-beilinson-period-comparison](#algebraic-beilinson-period-comparison), [CohomologyComparisons:CP.4/proper-rigid-potential-semistable-comparison](#proper-rigid-potential-semistable-comparison), [CohomologyComparisons:CP.4/proper-rigid-c-period-comparison](#proper-rigid-c-period-comparison).

<a id="G-kisin"></a>

### All-weight crystalline-lattice Kisin scope

R07.4’s stage promises finite-flat/p-divisible classification, which is weaker than BMS1 Theorem 4.4 and Proposition 4.34 needed here. The old checkpoint’s detailed Kisin references are retained in the request. Read existence/uniqueness/full faithfulness in Kisin’s original sources and the Kummer restriction theorem, then extend its owner; R06.2 rational classification and R07.3 small weights do not close this gap.

Consumers: [CohomologyComparisons:CP.5/dvr-lattice-recovery-via-breuil-kisin](#dvr-lattice-recovery-via-breuil-kisin), [CohomologyComparisons:CP.5/small-weight-integral-interface](#small-weight-integral-interface).

<a id="G-counterexamples"></a>

### Geometric counterexample imported existence inputs

The §2 proof outlines and torsion computations are planned, but the original proofs of the singular Enriques Z₂ lift (Lang–Ogus), Illusie’s crystalline calculation, finite-field Bertini (Gabber/Poonen), finite-flat group degenerations and BMS1 Lemma 2.12 weak Lefschetz remain exact supplier requests. R09.7’s resolution stage alone does not promise positive-characteristic Bertini; a supplier scope extension must assign it before closure.

Consumers: [CohomologyComparisons:CP.5/enriques-torsion-counterexample](#enriques-torsion-counterexample), [CohomologyComparisons:CP.5/degenerating-group-torsion-counterexample](#degenerating-group-torsion-counterexample), [CohomologyComparisons:CP.5/special-fibre-does-not-determine-integral-etale](#special-fibre-does-not-determine-integral-etale).

<a id="G-chern"></a>

### Chern class owners and proper compactification proof

PR.4 must explicitly construct prismatic/syntomic/crystalline Chern classes, twists and splitting before CP compares them. Betts–Stix Proposition 3.20’s last paragraph uses the nonproper total space of L after proving cycle compatibility only for proper spaces. Supply the proper P(O⊕L) section/Gysin/projective-bundle proof. Equality of its trace-normalized a with the canonical Fontaine period is separately unproved in Remark 3.21 and is not used.

Consumers: [CohomologyComparisons:CP.6/first-chern-class-comparison](#first-chern-class-comparison), [CohomologyComparisons:CP.6/higher-chern-and-projective-bundle-comparison](#higher-chern-and-projective-bundle-comparison), [CohomologyComparisons:CP.6/trace-normalized-tate-period](#trace-normalized-tate-period).

<a id="G-pan"></a>

### Pan early tower and analytic control

Supply the actual Pan22 Corollary 4.4.3 coefficient/flag comparison, complete torsion-free tower complex, LB-space analytic exactness, χ̃_l decompletion and the flat truncated period sheaf from the named modular/log suppliers. The general distribution roadmap L0 does not by itself supply analytic-vector exactness, so no incorrect distribution-stage prerequisite is used. Keep the Pan cohomological adapters after T6:comparison and the ordinary CP.3 core; the proposed stage refinement makes the routed extension explicit.

Consumers: [CohomologyComparisons:CP.6/pan-graded-analytic-decompletion](#pan-graded-analytic-decompletion), [CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit](#pan-bounded-torsion-inverse-limit), [CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent](#pan-completed-coefficient-and-flag-descent), [CohomologyComparisons:CP.6/pan-truncated-period-isomorphism](#pan-truncated-period-isomorphism).

<a id="G-exports"></a>

### Trace character and Habiro return interfaces

HQ.8 owns q-gluing and RT owns the cyclotomic Chern character; neither is reconstructed or assumed complete here. The consumer interfaces must take CP’s actual map and normalization, preserve all intersection hypotheses and record the p-adic/q=1 specialization square. The current RT stage text does not explicitly name every required character normalization; propose the scope clarification rather than replace it with an unnamed regulator.

Consumers: [CohomologyComparisons:CP.6/habiro-and-trace-specialization-export](#habiro-and-trace-specialization-export).

<a id="G-lean-types"></a>

### Missing geometric and enhanced Lean interfaces

The pins supply Witt vectors, adic completion, ordinary tensors and derived categories. They do not supply the actual smooth formal/adic objects with all required site morphisms, completed E∞ tensor, AΩ and log/prismatic comparison types, analytic infinitesimal sites or completed tower/filtered connection interfaces. The suggested file inventories every omitted mathematical signature, API and test under its packet name. Only the normalized coefficient homomorphism adapter and presented completion have typed prototypes; no missing type is represented by an arbitrary Prop.

Consumers: [CohomologyComparisons:CP.0/formal-algebraic-analytic-dictionary](#formal-algebraic-analytic-dictionary), [CohomologyComparisons:CP.1/proper-ainf-input-package](#proper-ainf-input-package), [CohomologyComparisons:CP.3/canonical-bdr-cohomology](#canonical-bdr-cohomology), [CohomologyComparisons:CP.3/relative-infinitesimal-site](#relative-infinitesimal-site), [CohomologyComparisons:CP.4/semistable-period-comparison](#semistable-period-comparison), [CohomologyComparisons:CP.6/pan-truncated-period-isomorphism](#pan-truncated-period-isomorphism).

## Source corrections

### CohomologyComparisons/E1 — error

Scholze 2013 Proposition 3.7(i), official erratum (1), pp.1–2. The official erratum gives an uncountable inverse-limit counterexample and proves the corrected splitting criterion by transfinite induction. The original covers/point classification cannot justify the primitive/local period proof.

Required correction: Use transfinite inverse systems whose successor-to-limit transition is the pullback of a surjection of finite sets; restrict the pro-étale covers accordingly. Do not use the deleted Propositions 3.8/3.13 point descriptions.

Correction status: Official Scholze erratum, items (1)–(2); imported correction, not a newly claimed discovery.

### CohomologyComparisons/E2 — gap

Scholze 2013 structural OB_dR⁺ definition; official erratum (3), pp.2–3. The official correction changes the topology of the tensor construction and replaces the proof of its local formal-power-series description. The CP.3/P8 request uses that corrected order of operations.

Required correction: p-complete the integral tensor of the formal coefficients with A_inf before p-inversion; then take the kernel-of-θ completion and sheafification. Do not take the uncompleted tensor as the structural period sheaf.

Correction status: Official Scholze erratum (3).

### CohomologyComparisons/E3 — gap

Betts–Stix author manuscript 29 April 2022, Proposition 3.20(8), last proof paragraph, p.28. The preceding assertion (7) assumes X smooth proper. The total space V of a positive-rank bundle over proper X is nonproper, so invoking (7) there leaves a hypothesis gap in this manuscript proof. This finding concerns that step, not a counterexample to the Chern-class result.

Required correction: Give a proper projective-compactification argument in P(O⊕L) with its zero/infinity-section Gysin classes and projective-bundle formula, or first prove the corresponding nonproper cycle comparison.

Correction status: No correction found in the checked author manuscript, author publication list, arXiv v1 record or Annals landing page; the published full-text proof was not available in this check. No claim that the published version retains this step.

## Source register and reproducibility

Public PDFs were accessed on 7 October 2026. The packet records a SHA-256 for each PDF, its exact edition and the sections read. Private text-extraction hashes and line locators from the checkpoint are replaced by public URLs and printed theorem/page locators. The downloaded BMS1 source is v3, CK is v3 and Prisms is v4. The source boundaries below specify what was actually read, rather than implying that this comparison roadmap extracts every theorem of every paper.

- [Bhargav Bhatt, Matthew Morrow, Peter Scholze, Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3). arXiv:1602.03148v3 (2019), printed pagination. Read: §2, pp.13–18; §3.3 and §4.2–4.4 retained source records; §5.1–5.2; §12.2 comparison models; §13, pp.104–117; §14, pp.118–122.
- [Kęstutis Česnavičius, Teruhisa Koshikawa, The A_inf-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145). arXiv:1710.06145v3, printed pagination. Read: §§6–9, especially Proposition 6.8, §7.6, Theorems 7.9,7.12, §7.10–7.11, §8.2–8.6, Theorem 8.7, Remark 8.8, §9.1–9.6; supplier packet consulted for earlier construction.
- [Haoyang Guo, Emanuel Reinecke, A prismatic approach to crystalline local systems](https://arxiv.org/pdf/2203.09490v3). arXiv:2203.09490v3 (2023); source of published 2024 paper. Read: §10.1, pp.93–99, Definitions 10.1, Lemma 10.3, Construction 10.6, Theorem 10.7, Corollaries 10.8–10.9, Propositions 10.10–10.11; §10.2 Theorem 10.13 and Remark 10.14 statements.
- [Haoyang Guo, Crystalline cohomology of rigid analytic spaces](https://arxiv.org/pdf/2112.14304v1). arXiv:2112.14304v1 (2021). Read: §1.2 Theorem 1.2.7 and Corollary 1.2.11; §2.2 envelopes; §4.1 Čech–de Rham comparison and Lemma 4.1.10; only the smooth comparison needed here, singular and éh proofs remain a gap.
- [Pierre Colmez, Wiesława Nizioł, On the cohomology of p-adic analytic spaces, II: The C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf). Author manuscript CN5, 24 November 2024, published 2025. Read: §1.1 conjectures and Remark 1.3; §6.2, Theorems 6.2,6.4,6.8, their proofs and Remark 6.10, pp.40–43; earlier syntomic and Banach–Colmez inputs are supplier requests.
- [L. Alexander Betts, Jakob Stix, Galois sections and p-adic period mappings](https://www.math.uni-frankfurt.de/~stix/research/preprints/BETTS_STIX-GaloisSectionsPadicPeriods20220429.pdf). Author manuscript 29 April 2022, source of 2025 paper. Read: §3.4, Propositions 3.16–3.20 and Remark 3.21, pp.25–28, trace, duality, cycles and Chern classes.
- [Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1). arXiv:2209.06366v1 (2022), source of published 2026 paper. Read: §6.3.9, pp.101–102; §7.2, pp.118–120, Proposition 7.2.3 and Lemmas 7.2.4–7.2.6; constructions of period sheaves remain imports.
- [Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld : le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf). Author manuscript GPW5, source of 2020 paper. Read: §3.3, Proposition 3.12 and proof, pp.35–36; proper-curve C_st input, D_pst=H_HK¹ and Fil¹D_dR=Ω¹; the Drinfeld tower results are outside this route.
- [Bhargav Bhatt, Peter Scholze, Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229). arXiv:1905.08229v4, 12 January 2022, printed pagination. Read: §18 comparison of integral comparison maps; statements and uniqueness hypotheses checked, construction imported from PR.6.
- [Peter Scholze, p-adic Hodge theory for rigid-analytic varieties](https://arxiv.org/pdf/1205.3463). Public arXiv:1205.3463 PDF, read together with official erratum. Read: Theorems 1.1,1.3,5.1,8.4 and §6 local period sheaf comparison; primitive/global results are imports.
- [Peter Scholze, Erratum to p-adic Hodge theory for rigid-analytic varieties](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeErratum.pdf). Official author PDF, 3 pages. Read: Entire erratum, corrected pro-étale covers, deletion of point descriptions, p-adic completion before ker θ completion.

The original Beilinson h-descent proof, original Kisin existence/uniqueness sources, Lang–Ogus Enriques lift, Illusie Enriques calculation, Gabber/Poonen Bertini, analytic BC/syntomic foundations and DLLZ primitive extension are not claimed read here. Their precise interfaces remain in the gap/request register. Betts–Stix is read in its public 2022 author manuscript; the published 2025 full text was not available for checking the possible correction of its Chern proof. The 2025 Annals landing page, author publication list and arXiv record were searched for an existing correction. The documented source issue is confined to the manuscript version.

## Verified findings and structural follow-up

- `RT-AREA-padic-1/24`: G-primitive and restructure name the early absolute and DLLZ log-primitive owners; no late P8→CP.3 back edge. The stale “no owner” is replaced by a precisely scoped missing-stage input, not false closure.
- `RT-AREA-padic-2/3`: G-primitive records the finite F_p local-system, absolute/relative almost comparison and A_inf variants with corrected covers. P8:local-rational remains local only; the differing proposed primitive order is explicitly reconciled by an owner-cut proposal.
- `RT-AREA-padic-2/4`: R07.4 request and G-kisin retain all-weight integral crystalline lattices, Kummer restriction, S↦A_inf/W(k) Frobenius twist and the source uniqueness proof. Rational R06.2 is not treated as lattice classification.
- `RT-AREA-padic-2/23`: CP.4 imports PR.8; CP.5 imports R07.3 and R06.4 with their exact weight/sign ranges; CP.6 imports PR.4 and EDC.3/EDC.4; returnInterfaces exports to R06.6. RT/HQ remain character/gluing owners.

The verified primitive-comparison findings propose an early P8 owner with two incompatible orderings; the late P8 proper application already consumes CP.3. Pan’s newly routed logarithmic/infinite-level adapters also consume T6:comparison, which itself consumes the ordinary CP.3 theorem. A whole-stage T6:comparison→CP.3 edge would be circular. Add the exact early P8:primitive-comparison cut for corrected Scholze §§4–5 absolute/relative finiteness and almost comparison, independently of the CP.3 proper period theorem. Resolve whether its Lemma 4.10 local input precedes it, rather than using two primitive cuts. Add the separately sourced T6:log-primitive DLLZ theorem between log sites and log comparison. Keep CP.3 ordinary infinitesimal/de Rham targets before T6:comparison; the Pan nodes in this packet have actual parent CP.6 and realise CP.0/CP.3’s routed coefficient extension. Assign that late extension an explicit CP.6:log-truncated substage (or a late CP.3 substage that never supplies its own early inputs) when the atlas structure is updated.

The routed Kisin, analytic/algebraic C_st, counterexample, prismatic-Chern and trace-character inputs go beyond some currently stated supplier scopes. They cannot be replaced by weaker classification or cohomological-rank assertions. Extend the named owners with source-qualified Part II cuts: all-weight crystalline-lattice Kisin in R07.4; h-derived/overconvergent HK and the early BC/syntomic proof bridge for CN in CR.6/rational period theory before CP.4; positive-characteristic Bertini/Enriques lifting where the moduli owner supplies the §2 construction; PR.4 crystalline/prismatic/syntomic Chern and projective-bundle interfaces; RT cyclotomic-character normalization. Keep CP’s nodes as map-comparison applications of those inputs, not duplicate foundational developments. In RT.6 keep the early THH/prismatic/Nygaard comparison before PR.7 and put the CP.6-consuming cyclotomic-character compatibility in a distinct late suffix; a CP.6→whole RT.6 return would be circular through PR.7.

## Prototype and acceptance boundary

The suggested file has real typed signatures for SpecializationDictionary and the underlying presented InfinitesimalEnvelope, eight admitted API lemmas and six admitted examples. Its namespace uses the pinned completion without rebuilding it. The remaining geometric definition/construction signatures, APIs, examples and comparison names appear in an explicit mathematical inventory with their missing supplier types. No advanced comparison is represented by a truth-valued stand-in or an axiom. Compiling the file checks the two adapters and does not verify the geometric statements.

The blueprint checker reports zero errors and zero warnings. The suggested file elaborated under lean-check at the pinned Mathlib with admitted-proof warnings only. The owned prerequisite graph and the atlas stage graph combined with accepted RS-01 links and the new cross-stage edges were checked acyclic. The short literal excerpts were matched against the downloaded public source texts, and every definition, API and test name is present in the suggested inventory. Every stage has explicit remaining work, and its planets respect the six-per-stage limit. Independent review must check the map-level hypotheses, source qualifications, target coverage and supplier boundaries before this pass can be accepted.
